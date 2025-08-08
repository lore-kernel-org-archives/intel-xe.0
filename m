Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD34DC87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 15:38:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E5010E966;
	Fri,  8 Aug 2025 15:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoCeDOQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D8F10E966
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754667522; x=1786203522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=klyMkxSLGABzwtgFCD9nGzMGMLyNlQhzzFR/aiyuy7k=;
 b=LoCeDOQbG73qoj2slskVTZHdwa11zFuTTuTdV/Jhn2CcL1R9+3iPHFd8
 nmN+43s4Y1+XDad3deiCXEzsyeTkJeEMA+AAE08vQse9dFPnsf8Fxmlfn
 m6+fzwiZzkZpvi2RnL4fCMDjEN7egrq2BTKHDEL40fOGdpDWrIBqkh5L/
 tJoKC2uriehNNHQvMsKVhc50wuQLlQu8YZBiO6a+QueVq8yN1SyGlHzTo
 NCys+cB2aOhKPaXUYH1EJ+iF/yoQ5gSaYTiAOAp62IJ5A5B6nbt+SA+dC
 uQ4oYmDfpkYzVXHmDcuPdliUWAoXqHF9D0zh7y8G6rQmXAAxM4JTB9JRB g==;
X-CSE-ConnectionGUID: 0JqD0w5ORKS6kWiqcesLIg==
X-CSE-MsgGUID: xGmBiDhwSQ+QlmRIdbG0hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="44609339"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="44609339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 08:38:42 -0700
X-CSE-ConnectionGUID: rSDP7opYTFezHDs6mTrPyg==
X-CSE-MsgGUID: uWb802ObTw2T6IHWQmKSXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165725885"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 08:38:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 08:38:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 08:38:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.86)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 08:38:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2npa783bELagb/irhPETZKZhLiO5JFaY8LKSEgPGw/1nEJas9Iphj/4M8g7GAN860sTQdKi2anxj1KxkGra7sv2dkjkLvvW27z9nHU7URceqRnodCthA18S9nZg9KELf3lEYaFFJk38i4xVMNBEEKBFCQdtWQ6Cx70u3Gkyoau58pkjZbyVcxyt5vWz0d+sl65th93Mc832/AgJYgcViGJEzflFeIzUfqjYq89h8BrvYuNzYXZ7DRIx5MIUXHOTQGDsHEXioiw7eSFwtlVjWmJKo8wIzeLpeRSWfWqP6FE18h+QNfLvc+3TC8SQUxqD4caYWzMmGH+jyrCYp2bUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klyMkxSLGABzwtgFCD9nGzMGMLyNlQhzzFR/aiyuy7k=;
 b=H+t0w2ORYWmomuQEgBW2QxSxJNKc8ciRxlKgoD8TeQgCW/YBZ2GehwEYLCxfEAJV9L31SQ6YCSLtILtHVhhsH6r1uYwh1KTgCAT6HhMfixUvl02sqB58htDdNuGJNyqBZdee4y5UOQbKzTvnHxZHX5wzckNowAD7zcUhz+BHgzMbPhHsoi1usLOf4YAw/hXaj7aj67NrhUxEtKo3ODGlA2P8Sl0jhlAcRLPwFoQGDJj8OPiD3kBdIr42jeuQDi2BWNMsxQqXE7CM7AxyEjx9qIA1p8QbIgUG3CmOg/J2YokULqgF5Z5Hhv3+cjgi76wMoC60DsiZQ/9+i0C96bVkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.18; Fri, 8 Aug 2025 15:38:38 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 15:38:38 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Don't expose mailbox attributes for skip_pcode
 cases
Thread-Topic: [PATCH v2] drm/xe: Don't expose mailbox attributes for
 skip_pcode cases
Thread-Index: AQHcBuYfSZHmP3HhbEO+UUXJZEc5rbRVxyKAgAAMNwCAAAIMAIADEdEA
Date: Fri, 8 Aug 2025 15:38:38 +0000
Message-ID: <838d76644da78ac27ca122bd6cc8a709e8058617.camel@intel.com>
References: <20250806152256.748057-1-raag.jadav@intel.com>
 <157ffa826b02292dc383ab444e1cb11b5b77093f.camel@intel.com>
 <aJOFFFXIx8ysMun2@black.igk.intel.com>
 <784543b394ee63647181463d56b45bb5a2dbd876.camel@intel.com>
In-Reply-To: <784543b394ee63647181463d56b45bb5a2dbd876.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA0PR11MB4558:EE_
x-ms-office365-filtering-correlation-id: 58e6ab3a-56b2-4b4e-2c7c-08ddd691a4ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TDNBdGNubXFWTDBlSiswdUZ3WWRBWUFwUXFoSTM2Nlp3cUo3cWR1RExUckNC?=
 =?utf-8?B?cFlTMldPV3M3Z3Z4ajVIRUZYUkZORU56dXpBNTBDN29qOStqZnRuVzJwdThk?=
 =?utf-8?B?dExMa3V2K09Zd0xvOWpJYVB6ckZCTUtXdWhSMmxMaFdSOXhBcXF6M0MxOE04?=
 =?utf-8?B?NTlyWlA2RWtUTUUwTStlNmZzRnBjbko3SEd4UUtvSXBKdG9mUC9sTXpaYUdw?=
 =?utf-8?B?cUI3dDQ2Y3lvclFpc0FHaHJ0MjdoQnJEcDA3bGdPRUxuU29FTlJuMjhKWmQr?=
 =?utf-8?B?OUNwSEsyWUcxaVVhbzNTNFQ3K3Bra1dycTNlVSswUnljR0VFM3V3L3AyZ3pM?=
 =?utf-8?B?OHI1c1FveXdhekZ6dFpKNEZ6RmhoTUpSdVZKY09NV1RpT29JM0hTajNjWDNN?=
 =?utf-8?B?ZXQ0ZXY4NEVsbHVTbzVhN2tFR3dXcjZxbC9PUGNLdkxYN3UvWXB4RW1Ddndp?=
 =?utf-8?B?Rkd3U0lTRHRPdFRzZ2diRE9HK3dyYkxjODB3ankvanFzWXk2eXpnRlNtM0ts?=
 =?utf-8?B?eEUrQml2aVgrL1RDWnhpa1RzOTRiV1ByamFvUzl4MDZRTnVBeVljbGdhKzBn?=
 =?utf-8?B?NjBnRjFLZmtpc3FuYzRkWnFxNm1Ha0hFQmRzTDgzclNydFR2V0JEVXRjNDQ2?=
 =?utf-8?B?MGlWWXlWQmFLbXZyeXRnT3RpV29TTXpKNmpPYUVxdXVmNWFXcFFINXJkaVFP?=
 =?utf-8?B?MStkNjlxVUtESDFjODRUeDdkWDJzaTUxNksvNkxobWFkL01Obmk0N09MNzBq?=
 =?utf-8?B?NTJ5UFlTNElBbm5qTnY3VitIRDF2Q1UzbjBwVjdUS0E3czhNcHdpRHFZelVh?=
 =?utf-8?B?STcyQXBWdnZ4SHhJc3B4Ylk4RGxMa2Z4VXpnVnQ5bSthV053R1g1dGd4OUJM?=
 =?utf-8?B?RWQvdWdDcTM3YkttWER4WlRGMlU2SkdmdTJaNEZVQ3lVb3phYnVjWlZXc1M4?=
 =?utf-8?B?eHk4NGNXTlptci9DUHZ6TjEyTkUvOU11T3QvaHZ2L004L0F3VWhncjR5U3pw?=
 =?utf-8?B?L0hjVlJFN2xXM2RhWlE0bzlMUzhsVzJkSmN2UmZIcm85SURDc1VSemVRYkZQ?=
 =?utf-8?B?TzZPbzZCak1QSHkreVUyTGk5VyswdXB4UHd3dkYrVCtyUUtIRlpSbjhSY0Ix?=
 =?utf-8?B?SlcvSFJTdlhTdEgwMklZSk5SbGVKSWxVTjhMZDFoZXZYdFRNbHU0RGZ2Tjh0?=
 =?utf-8?B?T0tsaUpTVFU5Ynh4SWV3aXpyVVd6THlRU2VDMGE2bjlZYkg0dTRKU2IxRjYw?=
 =?utf-8?B?N1VYNWk4QU9YNWh3dGZuSDNDTVVNT0VlNDRURzg2WGpRTzdJTHF0ZFNTeXBL?=
 =?utf-8?B?R1lMTXdVaDRyQ1MrWEFlWVQvNE5mMWZpbTltd25tb3F0dnBSUldBeDdkc3JW?=
 =?utf-8?B?bUJTendCNFNNRjBaRDluTmZaaTF3WUEycTFzc3oyZWJxeXg3MlJwaVhacWhS?=
 =?utf-8?B?UkthU1FvZHhUcEh1VmRDd1JpMVNGUW5EQ0NQOVZEUXNqNkJnYnlaRDBmeGc4?=
 =?utf-8?B?TWF2UHFlbitFWm8zS21qWHlYWnc2TEROcCs4M2c0RTNwOThRZGJRUUlXN1FH?=
 =?utf-8?B?dGJBRXBGbU56STRMWmg1U1lZUzM2alhHU2IrazZGMlplbjFGUCtzdXJXTUFz?=
 =?utf-8?B?RDRDTnVyY3RpeVNJdVdVMUJnUzJmbXZlNVhNRE8xakxwMEFkTEtobkk2d3Fi?=
 =?utf-8?B?V2JWdG51UUQ1a2FaOHRpQnRFbUhQSDMveVNEZVlUNCtHbkU3Nm9SbG52UFB4?=
 =?utf-8?B?KzQ4dGpDQlZIMnJFVUk5bnN0WWNXMW1hbDA5Yk9zc01JbzBjN2diUkVRY2lG?=
 =?utf-8?B?bXd3NTJNZEhMMGh2Q0ZRblBibGxScG0xNVZkM1hnbnFoZGo3QjZqRmw5Nk0w?=
 =?utf-8?B?dzYvZXNUY09mc2M3OHd2OWl4aHJ1dU4yM1BVMkNYU2d5UkEvcmF1dW9IVlNL?=
 =?utf-8?Q?VXgkYvzasqk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGFwc1lOc3JxNnRXa0g3Ly9ObGs2aVZITzBWUHM0eEN4Nk9NUDhRN3VCKzZt?=
 =?utf-8?B?NytQdVVGeTJ0d25PZjVseDFUOFJsSlZiYXFCREc5bU9sM0lLM24yaHhsR3Zu?=
 =?utf-8?B?aUJZZnFpaGhlTm8zSTg0NUNqUXdyNnlPNW5GU2FLbUdWMWkvRjJBclNNYUNU?=
 =?utf-8?B?eUhuWTNmQmxtMENDM3NFT2NaWHhLNFFyWTE0NVpSKzFKcC8vWVgwRDVZNEFo?=
 =?utf-8?B?UjJmdUJJajkweDJiWTBJeDg0eW0xZklWY2srem5xMTVRd0N3V0l2OHIzeFdN?=
 =?utf-8?B?cm9ZbEF1YnNNN21CRk9ja3VPQVQrNUFtdUREcVI1NTJ5RDNYUWJ0bTZwRE1G?=
 =?utf-8?B?QnEyZnpiY0JiN3R4d0x2Ukdya1FYRldjSk1WZVVtTzk4L1hBTkFzRXdBVXhy?=
 =?utf-8?B?VWg1d2Y2aWNrYnhFYXAxS3V5ZDM1cXJhTmw2Njk4T3NpVWcwWmZTdTUydHhm?=
 =?utf-8?B?OENqNDBTeXZCaTVJcm9qM2xVd1ZyZnN0R2NaQkFUZ29pemJoUHpPWm52dVhZ?=
 =?utf-8?B?dHM2UjV1TFhveVI2cEFocHdEU3VlbUNycTUzY3JkOXFydDd2ZGpGTVgyRFU4?=
 =?utf-8?B?a3lDV2djMldMNW1XTnd5MWxiclZ5a1BSeEZVUVdZc0lFVWx5MndTd0dMU1hL?=
 =?utf-8?B?d2dUdURZdHFmTHpGVHF1VnJVby92NGpPcU4wVW9rOWgrMHhrYmpuQ1dIaGlr?=
 =?utf-8?B?S1BwU3dUZmVuWU90T0kyc1RKSXFrUVRjSlNTN09jNldXdmlEdlg5SitqQk1l?=
 =?utf-8?B?SWptZ2FRWU5WVmpkUnVRTWttaVR3MFQxbDJNWXB6TGExWEpEKzlacU9XaE54?=
 =?utf-8?B?dGxqUGpjSUxCSDhxTnFqaTJwSXkxWEpOMmJ6d0cweXFCbDFFR0luUVA5RnBE?=
 =?utf-8?B?SG5pMTVFWWw5T05OWGRxSUY2NlBLRDMrSG44WmdWUk9NY0xjdEVQcVN1TmZ4?=
 =?utf-8?B?azBWS0N6ekdEYWxFR2dJSGJZTWMxYksxM2NxZ1ZSUGZRcWEyY203K3hYUFdo?=
 =?utf-8?B?RjIvQVIxa0VEV0NpY3c4aWdxdWlqc2xUK3JBYVZDV0hZS3hRSUJmdS9TNXEv?=
 =?utf-8?B?MHVYZnBicm5BNlI3Zm43blpzSjg4TDZLeFFyRkIzZWZCeFRXQjRwTzNOTWRh?=
 =?utf-8?B?Z2pBb0o4dzlPc2JWKzNXRGZteHpWaUk0dmJmb21pOTRNS2dsKzd4Mkt1akJC?=
 =?utf-8?B?Zk5SaHNOUGJwdDNVZUtBeEtEd1BQVGZWVHMzSndKV2FPa2NkZEFBQXY2enli?=
 =?utf-8?B?ZmVJRzFhRFhLRG92TmlSVG1UQXp3aC9vbFlaOXp6N013SEFhU3lnZ1BpS3Nz?=
 =?utf-8?B?SWN0eXNxclhSdHdUaG9rbVpqQVg0OHc1cFZpeXpVL3ZSSS9UWXdBMGVDL2Qz?=
 =?utf-8?B?cllPYWp4dlM5M1hnS3BrNlVWMHhIL1A2L1JkQ3M4OXE0MUI5VkpiUDlqQ3pT?=
 =?utf-8?B?S1FiUHJYMUZ5bkFVcXl3bHFRYzQwVmFhRWNQOEwwME5DbVRQL3paNTZoSS9U?=
 =?utf-8?B?aGZSU01FLzdGZ0RKZXdoeS9WU0ZWSktwbVpDL1ptR2h0V3ZzNHE3WnZ3N2M0?=
 =?utf-8?B?T0dnaE40V2lVdUNPak9JQTE2V1NsSTFhTkhkVWNUZmJxakp0SElDNHAvdlUz?=
 =?utf-8?B?VjZlQnI0WGwydlZMSllNM0dvK3Q0aVRPenVSNzJTMGl2d3RyU2wvQnlrZlV5?=
 =?utf-8?B?VnhPY3FSYTFJTEh3SVV4U05TYkNIQlBYQi9GKytsVVRkYXJIcUV1Nk9pS0ZG?=
 =?utf-8?B?Mmh1MDJqVjBwNFBSTVRWV3BwSFo4SUM3QjBIanljNWtjdUpFeWdwV0t4amVa?=
 =?utf-8?B?MnZsWkJIRFg1blhWWDdQb1FlSDlHWHJvdWNmdEw1eThVUU5qdVdpcnJBTGRC?=
 =?utf-8?B?emJFUDFzaTJHbklpaEpEbzJ2YVRZQTNTRDdrR1dnNDAvaE9vVkhIUmxuUFR5?=
 =?utf-8?B?QlFWamExSGRMdFNwWG5KclcwOTV3NWJBMVFVdnFTUEM5T0lYaFNhRVhhaHFV?=
 =?utf-8?B?RGV1KzdiTzI0S0pMNkVSWGhYYnV1c2JCb1k3NW5mdmszdFQ3eWRDTGsxMFI2?=
 =?utf-8?B?RVJjYWYwZHVPMXFsR3JYR2VsbzJRNFNCY2F5YlFEOGRNT0ZRVUpRRzlwNFVp?=
 =?utf-8?B?ODJBOVUra0lRTm1vQ1RwU0ZsdEhWSXNsTTZBSUNyU3lTMGhxUVhFTHBIamZE?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49CB1CCD15044946BE261CBA0D2D2AE4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e6ab3a-56b2-4b4e-2c7c-08ddd691a4ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 15:38:38.1601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yssK8mb3KQjj9JvKeeA3ohrIy1tOgV/7e0m/bBw2+k818CJt0UgurmjDmAjY1IUZ6KEZHxDyqgwj7sjblWyy5nxYpZvOkX52xUojjY7/968=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDI1LTA4LTA2IGF0IDE2OjQ2ICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIFdlZCwgMjAyNS0wOC0wNiBhdCAxODozOCArMDIwMCwgUmFhZyBKYWRhdiB3cm90ZToN
Cj4gPiBPbiBXZWQsIEF1ZyAwNiwgMjAyNSBhdCAwOToyNTowM1BNICswNTMwLCBTdW1tZXJzLCBT
dHVhcnQgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjUtMDgtMDYgYXQgMjA6NTIgKzA1MzAsIFJh
YWcgSmFkYXYgd3JvdGU6DQo+ID4gPiA+IENvbW1pdCBhN2Y4N2RlYWMyMjkgKCJkcm0veGU6IERl
ZmF1bHQgYXV0b19saW5rX2Rvd25ncmFkZQ0KPiA+ID4gPiBzdGF0dXMNCj4gPiA+ID4gdG8NCj4g
PiA+ID4gZmFsc2UiKQ0KPiA+ID4gPiB0cmllZCB0byBmaXggdGhlIHNpZGUgZWZmZWN0IG9mIHhl
X3Bjb2RlX3JlYWQoKSByZXR1cm5pbmcNCj4gPiA+ID4gc3VjY2Vzc2Z1bGx5DQo+ID4gPiA+IHdp
dGhvdXQgdmFsaWQgZGF0YS1vdXQgdmFsdWUuIFNpbmNlIHRoaXMgaXMgdHJ1ZSBmb3IgY2FzZXMN
Cj4gPiA+ID4gd2hlcmUNCj4gPiA+ID4gc2tpcF9wY29kZQ0KPiA+ID4gPiBmbGFnIGlzIHNldCwg
YSBtdWNoIHJvYnVzdCBmaXggd291bGQgYmUgdG8gbm90IGV4cG9zZSBtYWlsYm94DQo+ID4gPiA+
IGF0dHJpYnV0ZXMNCj4gPiA+ID4gYXQgYWxsIGZvciBzdWNoIGNhc2VzLg0KPiA+ID4gPiANCj4g
PiA+ID4gdjI6IENoZWNrIGFnYWluc3Qgc2tpcF9wY29kZSAoU3R1YXJ0KQ0KPiA+ID4gPiANCj4g
PiA+ID4gRml4ZXM6IGE3Zjg3ZGVhYzIyOSAoImRybS94ZTogRGVmYXVsdCBhdXRvX2xpbmtfZG93
bmdyYWRlDQo+ID4gPiA+IHN0YXR1cw0KPiA+ID4gPiB0bw0KPiA+ID4gPiBmYWxzZSIpDQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFJhYWcgSmFkYXYgPHJhYWcuamFkYXZAaW50ZWwuY29tPg0KPiA+
ID4gPiAtLS0NCj4gPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMg
fCA3ICsrKy0tLS0NCj4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2Vfc3lzZnMuYw0KPiA+ID4gPiBpbmRleCBiZDkwMTU3NjFhYTAuLjc1YjZjZDgxNmZh
OCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNm
cy5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0K
PiA+ID4gPiBAQCAtMjY0LDggKzI2NCw3IEBAIGF1dG9fbGlua19kb3duZ3JhZGVfc3RhdHVzX3No
b3coc3RydWN0DQo+ID4gPiA+IGRldmljZQ0KPiA+ID4gPiAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0DQo+ID4gPiA+IMKgew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHBkZXZfdG9feGVfZGV2aWNlKHBkZXYpOw0KPiA+ID4g
PiAtwqDCoMKgwqDCoMKgwqAvKiBkZWZhdWx0IHRoZSBhdXRvX2xpbmtfZG93bmdyYWRlIHN0YXR1
cyB0byAwICovDQo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoHUzMiB2YWwgPSAwOw0KPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqB1MzIgdmFsOw0KPiA+ID4gDQo+ID4gPiBXaHkgYXJlIHdlIG1ha2luZyB0
aGlzIGNoYW5nZSBhZ2Fpbj8gTG9va2luZyBhdCB4ZV9wY29kZV9yZWFkLA0KPiA+ID4gd2hpY2gN
Cj4gPiA+IGNhbGxzIHBjb2RlX21haWxib3hfcncgd2l0aCB0aGlzIHZhbHVlLCB0aGUgZmlyc3Qg
dGhpbmcgd2UncmUNCj4gPiA+IGRvaW5nDQo+ID4gPiB3aXRoIHRoaXMgaXMgYSB3cml0ZToNCj4g
PiA+IHhlX21taW9fd3JpdGUzMihtbWlvLCBQQ09ERV9EQVRBMCwgKmRhdGEwKTsNCj4gPiA+IA0K
PiA+ID4gVGhlcmUncyBubyBOVUxMIGNoZWNrIGhlcmUgbGlrZSB3ZSBoYXZlIGZvciB0aGUgc2Vj
b25kIHBhcmFtZXRlcg0KPiA+ID4gaW4NCj4gPiA+IHhlX3Bjb2RlX3JlYWQuIFNvIHdlIG5lZWQg
c29tZSBpbml0aWFsIHZhbHVlIGhlcmUgc28gd2UgZG9uJ3QNCj4gPiA+IHdyaXRlDQo+ID4gPiBn
YXJiYWdlLg0KPiA+IA0KPiA+IERhdGEtaW4gdmFsdWUgaXMgb25seSByZWxldmFudCBmb3IgbWFp
bGJveGVzIHRoYXQgdXNlIGl0LiBTbyB3aXRoDQo+ID4gdGhlIGludHJvZHVjdGlvbiBvZiBza2lw
X3Bjb2RlIGZpeCBoZXJlLCBub3QgbXVjaCB1c2Ugb2YgcmVkdW5kYW50DQo+ID4gaW5pdGlhbGl6
YXRpb24uDQo+IA0KPiBJIGFncmVlIHRoaXMgaXNuJ3QgdXNlZCB3aGVuIHdlIGhhdmUgc2tpcF9w
Y29kZT10cnVlLCBidXQgaW4gdGhlDQo+IHNraXBfcGNvZGU9ZmFsc2UgY2FzZSwgd2UgYXJlIHN0
aWxsIGluc3RhbnRpYXRpbmcgdGhpcyBzeXNmcyBlbnRyeQ0KPiBhbmQNCj4gYWNjZXNzaW5nIHRo
YXQgd2lsbCBjYXVzZSB0aGUgd3JpdGUgdG8gcGNvZGUgd2l0aCB1bmRlZmluZWQgdmFsIGhlcmUu
DQoNCkp1c3QgdG8gcmVpdGVyYXRlIGhlcmUuIFdlIGhhdmUgYSB2YXJpYWJsZSB0aGF0IGlzIGJl
aW5nIHBhc3NlZCBpbiBhcyBhDQp3cml0ZSAoYXMgSSBleHBsYWluZWQgYWJvdmUpIHRvIGFuIGV4
dGVybmFsIGludGVyZmFjZSAtIGluIHRoaXMgY2FzZQ0KcGNvZGUuIFdoaWxlIGl0IG1pZ2h0IGJl
IHRydWUgdGhhdCB0aGlzIHBhcnRpY3VsYXIgdmFsdWUgaXMgaWdub3JlZCBieQ0KcGNvZGUgdG9k
YXksIHRoZSBhY3R1YWwgdXNhZ2UgaXMgb3V0c2lkZSBvZiB0aGUgY29udHJvbCBvZiB0aGUgZHJp
dmVyLg0KU28gSU1PIHRoZSBwcmlvciBjb2RlIHdoaWNoIGRpZCBub3QgaW5pdGlhbGl6ZSB0aGUg
dmFsdWUgYmVpbmcgcGFzc2VkDQppbiBoZXJlIHdhcyBpbmNvcnJlY3QuIEFzIHN1Y2gsIG5vdyB0
aGF0IHdlIGhhdmUgY29ycmVjdCBjb2RlIGluIHBsYWNlDQp3aGljaCBpbml0aWFsaXplcyB0aGUg
ZGF0YSBiZWluZyBwYXNzZWQgaW4gaGVyZSwgSSBhbSBhZ2FpbnN0IHJldmVydGluZw0KYmFjayB0
byB0aGUgb2xkLCB1bmluaXRpYWxpemVkIHZhbHVlLg0KDQpJIGFsc28gc2VudCBhIG5ldyBwYXRj
aCB0aGF0IGNvdmVycyB0aGUgcmVzdCBvZiB0aGUgcGNvZGUgcmVhZA0KbG9jYXRpb25zLiBJIGRp
ZCByZXZpZXcgdGhlIHdyaXRlIHNpZGUgYXMgd2VsbCBhbmQgZG9uJ3Qgc2VlIGFueXRoaW5nDQp1
bmluaXRpYWxpemVkIHRoZXJlLCBzbyBob3BlZnVsbHkgdGhpcyBzaG91bGQgY292ZXIgZXZlcnl0
aGluZzoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTUyNzAwLw0K
DQpUaGFua3MsDQpTdHVhcnQNCg0KPiANCj4gVGhhbmtzLA0KPiBTdHVhcnQNCj4gDQo+ID4gDQo+
ID4gUmFhZw0KPiA+IA0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsNCj4gPiA+ID4g
wqANCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlX3BtX3J1bnRpbWVfZ2V0KHhlKTsNCj4gPiA+
ID4gQEAgLTI5MSw3ICsyOTAsNyBAQCBzdGF0aWMgdm9pZCB4ZV9kZXZpY2Vfc3lzZnNfZmluaSh2
b2lkICphcmcpDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmQzY29sZC5jYXBhYmxl
KQ0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN5c2ZzX3JlbW92ZV9m
aWxlKCZ4ZS0+ZHJtLmRldi0+a29iaiwNCj4gPiA+ID4gJmRldl9hdHRyX3ZyYW1fZDNjb2xkX3Ro
cmVzaG9sZC5hdHRyKTsNCj4gPiA+ID4gwqANCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKHhl
LT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UpIHsNCj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UgJiYgIXhlLQ0KPiA+ID4g
PiA+IGluZm8uc2tpcF9wY29kZSkgew0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHN5c2ZzX3JlbW92ZV9maWxlcygmeGUtPmRybS5kZXYtPmtvYmosDQo+ID4gPiA+IGF1
dG9fbGlua19kb3duZ3JhZGVfYXR0cnMpOw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGxhdGVfYmluZF9yZW1vdmVfZmlsZXMoeGUtPmRybS5kZXYpOw0KPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gPiBAQCAtMzA4LDcgKzMwNyw3IEBAIGludCB4ZV9kZXZp
Y2Vfc3lzZnNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gPiA+ICp4ZSkNCj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsN
Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ID4gwqANCj4gPiA+ID4gLcKgwqDCoMKg
wqDCoMKgaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UpIHsNCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UgJiYg
IXhlLQ0KPiA+ID4gPiA+IGluZm8uc2tpcF9wY29kZSkgew0KPiA+ID4gDQo+ID4gPiBUaGlzIHBh
cnQgbG9va3MgZ29vZC4gV2UgaGF2ZSBza2lwX3Bjb2RlIGluIHRoZSBwY29kZV9tYWlsYm94X3J3
DQo+ID4gPiByb3V0aW5lLCBidXQgdGhlc2UgZmlsZXMgYXJlIGNoZWNraW5nIHZhbHVlcyBoZXJl
IHRoYXQgZG9uJ3QgbWFrZQ0KPiA+ID4gc2Vuc2UNCj4gPiA+IGlmIHdlIGFyZW4ndCByZWFkaW5n
IHRoZW0uDQo+ID4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IFN0dWFydA0KPiA+ID4gDQo+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gc3lzZnNfY3JlYXRlX2Zp
bGVzKCZkZXYtPmtvYmosDQo+ID4gPiA+IGF1dG9fbGlua19kb3duZ3JhZGVfYXR0cnMpOw0KPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpDQo+ID4gPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7
DQo+ID4gPiANCj4gDQoNCg==
