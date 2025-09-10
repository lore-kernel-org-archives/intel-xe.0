Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250B8CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 18:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63FB10E9AD;
	Wed, 10 Sep 2025 18:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K49yF9WH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C7810E9AD
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Sep 2025 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757527384; x=1789063384;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s6AdKw6NYvHkL68/P4OLm+S1XD8J7a5bmY83rO3W3w0=;
 b=K49yF9WHPV2tyjyH+D3V1hYOnfYq5zDy7W/M8IQEwGXK/oVP4oIEa8mV
 hypJqPlBNeZD7n9e0hAvLku0ITV47DHsAeSqo70tUmy2VllfUqrlMfGo0
 oQCKofbxlA13k7D4JIODri5p1uCBaLVZLebWqTgbKbDdhnnpfRKr2LpBD
 FMX4RIgjXVpSywKtrVWjcM4ZntLEukJSXZJGkgy9QuAEHLd+u8gZdPYQM
 dgyD5U8RePC3OsN6TokrEbQAI3v9TH97mGuENKanZEpLepX2sl+6Ghkiv
 lO/35+60hamERorJv52BgFEPvX8fYtByXDBZUiJLRtRbuGFSNb0RnFIa7 g==;
X-CSE-ConnectionGUID: K51yWIpNSDWrExZ8Fvu0sg==
X-CSE-MsgGUID: DOvUSeRyQsmQoXUB92s+6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59795559"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59795559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:03:03 -0700
X-CSE-ConnectionGUID: BNJ8GcTBQd+z5hJmLZOdeg==
X-CSE-MsgGUID: 7mG45R6CSj+H3acvJhmu2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="177498179"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 11:03:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 11:03:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 11:03:02 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 11:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJ4F2XqLrVJP9yII//0dgB0eBzDTV7DMH5tApCrkWEj4FNRke3JnpbZJhWbcWher1BLvKZfCllcaX5Vk1d6Jpt/qWz2UVgC+sLu2XpxEPqdmohwp355alonsdZ/7AmYCoBAZp6K49gIQmKu2AdpyugSzAG3YPuK9KdGyyY+6f6F9R8VcFNLpwLNDKFDyax++J0aP6HMee+EARLBMwbma3eVgU9SnEbJLqQ/rDFSgmz9BnUnr2Ly1fo6kXhYgphIVTlVH8Ihp//j8Qc5SyG9/ug71oxoQg5mtyqbeh2ZJYp8sHggv78NQY7oNnkFj/9fN6wG+Ue9lZDA8id4SPhoTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6AdKw6NYvHkL68/P4OLm+S1XD8J7a5bmY83rO3W3w0=;
 b=wPWxfrJ7lNP1rjmqZJ3SqNNA2uknraFvb8ZgP0xVZvpz0KryNIooAXQ0/GliZ4DUKTARCply9cgNH9/YXjb2n6AseTQl4fbMaXMRLku/1o1zdEsmrTXLGIZr8as1QrnLC4EAe+Vr4QlcSrjwcr9+LUIzOULsXC/sHt6hesAIZxXoudS//BYhFyXHlCuL+74cSHrtT4jMlwXRisb9KzTSsPf3LiVudk+s727UcnZK2g98b6yi4L4ElNL0MbGQr8+69aOHTSiinz4M4oOw2X0emnVeEr/IObUWxFNr2u0/QMJjEyLWPnQ1uz7xn0XBUU4ldM9nC8Rk5mk3jT2GXZ/1Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM6PR11MB4674.namprd11.prod.outlook.com (2603:10b6:5:2a0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Wed, 10 Sep 2025 18:02:49 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 18:02:49 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>,
 "Harrison, John C" <john.c.harrison@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Return an error code if the GuC load fails
Thread-Topic: [PATCH v2] drm/xe/guc: Return an error code if the GuC load fails
Thread-Index: AQHcIdrvbhIdjOJBtE26Sz2ljI0nWbSMtoUA
Date: Wed, 10 Sep 2025 18:02:49 +0000
Message-ID: <9e8460e70cefba27f70a4cfba9f33c58159f4203.camel@intel.com>
References: <20250909224132.536320-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250909224132.536320-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM6PR11MB4674:EE_
x-ms-office365-filtering-correlation-id: 1d0aad39-4fa8-4719-1d92-08ddf09440e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?R004TU5iK0FmU3NNMm5iTEZBazltNEJaOUprWlB6WVF1cFNCbWJvTk5NR0VS?=
 =?utf-8?B?bzUvbTZnS0tLc1RyKzlEV29NaHZsdUM1clhBN0FYcElkUlQrM3NNejQyWXNY?=
 =?utf-8?B?Y053SXpoNFBObHozeGF4bDBWT1RuOEdLV3VFZStsblFkUXNmVE9wMDAvRDhS?=
 =?utf-8?B?YVFBaitWTDBvNnAvVzM4MlJpOTFkejl3bTJSdk5yS2lldlA4cE9wM244akVH?=
 =?utf-8?B?S2dtWHV0OFAzSjFFd2ZnZFdRUTdWcjdCRWp2K05ZdVExWHA3OWJYQkpBVWdk?=
 =?utf-8?B?RUNFd3FQaml0dEhIT3U2cWQ0VXYrdzRJRGJ0WWJ6dURiRStWbWh3bVZDbWZq?=
 =?utf-8?B?d0ZDUTR4eldoSmU3a01YV2dDbzQ0WGowc0FUKzZRL0I0UGxJZG5oVjgzUSt0?=
 =?utf-8?B?U0lVNWtWS3Rodlp1L2E3cFNZWitVa1JVRVhRMVZZT0pqRGFqWHRxV2pHUmRl?=
 =?utf-8?B?K3BldVZKVDVzeGlacjAramg5M2dYMm1SeC9HbWZkZFpaN0NlOFZKNkJyLzhz?=
 =?utf-8?B?L2czYzRHVFRldlJPdFFadzZUaUVhNi9jbGU4L1NpS1Q3NlpkY3RBUklKVmlt?=
 =?utf-8?B?RzJWelE4OEFPWFlmcGRZbXpkYkVOTUJwbTNvQktDT1FwN0d6cnhza25jOHND?=
 =?utf-8?B?OWVySGx5MFIyczJrV2lXOWNxYW15cHhuZWpJaG9aOW9oR1k1MnV0TE50M3Zn?=
 =?utf-8?B?VEVjcGRXb3FrMW5LUWQyeC8yS0lOdHVjcnJKNVNNMlI2NFp5cXRHUTJUaTN2?=
 =?utf-8?B?V3hWb2w2VkZibis0Ykd0TnNzdldCajQzc3VWSnZsZUR3R3Axa0JLaEo5YWdv?=
 =?utf-8?B?dmJIVEVlTVB0b3dGUHZQSUFMczFEajYvTnJrQTcrSVBISHNhL3BhSWsvUzRh?=
 =?utf-8?B?aFk5TmRWVnA5SFpjc3ZNQ2wvVEE1Zms2blFCTEdTenV3QW5YV0tTQjFZeWRV?=
 =?utf-8?B?Rm1ZNCs5eHNqczI5RUFsbGdyRWk1Z0k4RCtHMG8wVmJPZlJOczBXVmFMZHR4?=
 =?utf-8?B?RUZaWFhFVUc4MkUwT0NGQmh1WldxYzlRenl4N0I3V256RER2bEdXTHNVQUdM?=
 =?utf-8?B?di9xaU5IbmYzUkFUbEF4QTA1dW1DN0VRNk9tMUR4ZUNzcXdENjdHaFNXaFZp?=
 =?utf-8?B?dFFBbXNoWnRQejBVeUNxemZYZDMzenRBL1VjMTRtZmQ1WjBKamI3UHVMV0VV?=
 =?utf-8?B?eXBrcW40THdHOEFvMVhxVmlKaW5kQTY3d1lEckxLc3ZLNWpud2RnUGN3SG11?=
 =?utf-8?B?WGVWTTVMOExLRmlKYXhYdXpDbkVLbkVhL0wrUWY1bVl2VzdaNEd6dTR0bkF1?=
 =?utf-8?B?Wk8ya2JDMUNCZnpyb0hSbmpqY0I0aHUxL25ZdjA3dThBbEV6Z3Y4QXN0L1M1?=
 =?utf-8?B?VnRrcnQ1YWhUbHFRdkthUk9xaEpSOWxIdnhZbHZpZFM4bHRiZ3QrNUhZZlVp?=
 =?utf-8?B?Ry9xZ0FmQmE1TEdNUkNxSFdlODJHNXR1VjhZK1VkcU83bXYvTFJORTlpZTVU?=
 =?utf-8?B?eGE5TFNVakpjWU9xbkZ3dXMxTGo2ZnhIOHN0cHptdzBHVmh4VDQ1Y2NoSC9N?=
 =?utf-8?B?cDdiQVFNQUJCMmREcFJUY0R0a080V2dpNWFIQlBzUVE1SUZ0YUtPemRTNUdU?=
 =?utf-8?B?Y2h5akNVWjNHd1dPd0JLUTdEQnZUQUlGUHZzSldHN0NaeGhFMUw3cDg4OFZt?=
 =?utf-8?B?YlhCekdqUTVzYmNGdEdiN3lTSkVlbytKQ2ViUW85TG12WUtPSTYvOVZWVkZa?=
 =?utf-8?B?MUtielFhcXVRbWpGaXRKMGh3b1hibHRVZEpaa0tvRkxURjQzYUhIcTRUTGlH?=
 =?utf-8?B?QW80RU43RmM0MzgyT01GcUI2VXNwN3pDR0RhbThMNXYzbVAyZVUwYnM5dEcr?=
 =?utf-8?B?SVR1RUtNUkhpdWNvTWM0NW9KRW5tUFdyMXNVNC9jT1o0bktEZWllSUFHN3lM?=
 =?utf-8?B?T2ZTNW55Y3Y3S2w0STN6dlMzUXJuMzBqbXMraDdsQnJ0Z2JwNnJGZ280elhG?=
 =?utf-8?Q?k5M3VRiz3eIRGjXqItDJm7rf/CFxEk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWt2VTdiUDg5cTBZbTlaR2JTU003TEVLNG9KNm9NOGZyR2FEOVBZYXllaDkx?=
 =?utf-8?B?ZGc5SkltNHVqcyt0WituN01VYTF6a3c0cDl6Q25KN3ZBSXMxeG5lWEpZL0F1?=
 =?utf-8?B?ZGlFOGlPbmF2bmY5Q1Q4SktWaEFCY2UvWWJ1VkQxdWcwRHhJSDRZbVJXTFhm?=
 =?utf-8?B?SVF2TlFHQ3NRTDNyZTdZck1jTmgxUm1uZ2FVWDJOdU5qU20vVkljc1ZIYUJ1?=
 =?utf-8?B?YkRFMHJSdTdwUmkxTHZGT2VjY1kxR1RMeDR4RUNqWnZHNFBMa09yQk5wdk1L?=
 =?utf-8?B?bjdncU80VjQ4T3dTdzJmemRscTA3Y1NhQ1F1N3RsRmUrTEhvNUFVbTRVUXRV?=
 =?utf-8?B?SlJod2VhczE2VHplbWpSQWIrQ2ZybEo3ekduc1hrNko2YnJaaDgyemVLM3Y2?=
 =?utf-8?B?ZUJjVGI3TDFzUDBpSk56NXJFWDFmOXFZSFg5STNEOU9sQXJlNTNuVHhYa25j?=
 =?utf-8?B?dlU1YThUMzVyQzVnV2pJbkpSUjNSMWJTRTNYY1JUOWt6TURPeTJMakdoWDNZ?=
 =?utf-8?B?bDBSMVg5TTFXdkp6MTBKb3ZyRFR2MWsrTll2TndFZ0RUSnphU2JJckNDVzBP?=
 =?utf-8?B?S0tpMVdhZjNZaDh1OWJQUVdBTFdvUFhzMmRUT21Ud3JTanlkKzd0dmswWDVY?=
 =?utf-8?B?bmdpMnVydm5NTUVTV0x3QkkxaFUxS3EyOW10aE9DejF3cWVCazlYZmdiMzlH?=
 =?utf-8?B?ZFpXRVFGNjlyQnB5aUJVNTcrUnN0cFA4QVIxanpzTUY4eFFYSlVrV25yY0VS?=
 =?utf-8?B?dnk0cVNNQUpjWUk5SVl5emQxTWZVKzV5ckdNb3V6K3ptN0JCT2tad1NpaGNX?=
 =?utf-8?B?RGE5RG5sdGRJRUVwS0h1N0l3MHJnYThZWjVodFBVU1ZjcWJCdWhtSTR5aytp?=
 =?utf-8?B?amkxbjVleURZcDI2anFRc05WbFIrMGFha1FqY1lSR1NOSWNLWVpoc2xOSzVO?=
 =?utf-8?B?aUZ4NVYvYzIwNGZqL083akRXRnY3STNwN0srdXpmUDNzb3BTcU5VSUw0Sk1M?=
 =?utf-8?B?RU9aSkZWM3FSbjF4aHNNRklzS2FBMUZ4a0pSTUMwY1MzdFI3SFFoVGV5SDhV?=
 =?utf-8?B?U0lPZVdyNmZUbk1UL3ovQVZrbVZTTW9ac2ZuYllOMGUyeEpKakpVS0VpMUNx?=
 =?utf-8?B?TWdwZ043YkJ5TFArY0FPWTdjMHdCWEtKcnBaNTBWZklwMkJHVTV5QTR4WS9D?=
 =?utf-8?B?dXVBVXcyNURWV0x6VEJnVHRMcUU2enM4Qms1bTVKYVI3RnUrSW83bjBPeUh5?=
 =?utf-8?B?alBOSzc3aEpIQmNsUVBQUHdNUVRGcGhURmRZQi9QRXM1NHVBdzA5aFdCWEZS?=
 =?utf-8?B?Z2pMMUE5NmYxeDYzNWQzVVNudFVtOVJoSVdxcHlWcE10emk0YkdFN0V2eGNo?=
 =?utf-8?B?STNEbUFMYTBmZC9zbkJoUDFuZXF2K0UxWjZUR2NjNVdVK1BYbmdRL09jSE81?=
 =?utf-8?B?em5MNGFMeENNSEsvVWE0Nk5oNWdEUFh3YUpzdytYWUNYenpGVjgwUVhicFNH?=
 =?utf-8?B?Z0IrcHRVcElVTGZ3WFZTNXVvMFVRY3BKZ3hkYVpWbnZzUnRqRTlWZ1FqSmtz?=
 =?utf-8?B?VjRsS3NpWUUzTzNKL2QraXZyU2tiaFN3ZEppNnFGVkkzR2kwamhOc1FGZFZM?=
 =?utf-8?B?S0pJdXNjM3ZpUWxVSVFRRTZLcm81ZmNVR1ZkejhMRzhlaHpTVnUvR0IwMC9P?=
 =?utf-8?B?SDBjNTU2RW5PS3p3alZ6VWQ0VVlBSmEvL0s2VWZkVkkvakV6dWNVWXZEbW5Z?=
 =?utf-8?B?V3NvdGlydlNMWVhkOXp2c25xS01OVUhSL2VCZ3hHZUU0MGlxaU96cW5Yc2NC?=
 =?utf-8?B?emNjVEN2cEtqLzhOTnN2a3BlUkNRN0gyRkVHbXFTKzlTSzVQKzhzRHhFNzk1?=
 =?utf-8?B?UVQrTG1vRUszVms0NndOVDRua2c0dXYraFhkdjAvNXMvTmxtQ0FWRHF2QkJw?=
 =?utf-8?B?TzlZUjVZdjFQUjgxTFZkTWlUb0V3akY2WkEveElJcFZLQjJQYkNTT3VGRUpZ?=
 =?utf-8?B?UUwrd1NIMXIyZjBWTUNSa3lOMHZKcTlLWnVrOTZMRFpROHdlcGRaZnUzbFE3?=
 =?utf-8?B?OFUzaS9qKzU5M3h4NFNoSkFub0xFVUFRN1YyVFZjMHVuWjZKWG1HdVc2azV3?=
 =?utf-8?B?akhhWklwMVhIUTRqQW84djk3NUxsVEUxd2QxaDk1UU5FZUdQcDhlWUQzS0w3?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1D254404EDCE44CB1C793BA2CC7510A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0aad39-4fa8-4719-1d92-08ddf09440e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 18:02:49.0248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igNDdJh/YjWre5G9EXX3LbXavky8jBhjd/WQ8oSsUSPEvIBueYPcvSjMZhovkb36BDu7m5M2mOAetu62d2+nMuP0irEA0O7kpkPHBQw2yuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4674
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

T24gVHVlLCAyMDI1LTA5LTA5IGF0IDE1OjQxIC0wNzAwLCBKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tIHdyb3RlOg0KPiBGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25ASW50ZWwu
Y29tPg0KPiANCj4gRHVlIHRvIG11bHRpcGxlIGV4cGxvc2lvbiBpc3N1ZXMgaW4gdGhlIGVhcmx5
IGRheXMgb2YgdGhlIFhlIGRyaXZlciwNCj4gdGhlIEd1QyBsb2FkIHdhcyBoYWNrZWQgdG8gbmV2
ZXIgcmV0dXJuIGEgZmFpbHVyZS4gVGhhdCBwcmV2ZW50ZWQNCj4ga2VybmVsIHBhbmljcyBhbmQg
c3VjaCBpbml0aWFsbHksIGJ1dCBub3cgYWxsIGl0IGFjaGlldmVzIGlzIGNyZWF0aW5nDQo+IG1v
cmUgY29uZnVzaW5nIGVycm9ycyB3aGVuIHRoZSBkcml2ZXIgdHJpZXMgdG8gc3VibWl0IGNvbW1h
bmRzIHRvIGENCj4gR3VDIGl0IGFscmVhZHkga25vd3MgaXMgbm90IHRoZXJlLiBTbyBmaXggdGhh
dCB1cC4NCj4gDQo+IEFzIGEgc3RvcC1nYXAgYW5kIHRvIGhlbHAgd2l0aCBkZWJ1ZyBvZiBsb2Fk
IGZhaWx1cmVzIGR1ZSB0byBpbnZhbGlkDQo+IEd1QyBpbml0IHBhcmFtcywgYSB3ZWRnZSBjYWxs
IGhhZCBiZWVuIGFkZGVkIHRvIHRoZSBpbm5lciBHdUMgbG9hZA0KPiBmdW5jdGlvbi4gVGhlIHJl
YXNvbiBiZWluZyB0aGF0IGl0IGxlYXZlcyB0aGUgR3VDIGxvZyBhY2Nlc3NpYmxlIHZpYQ0KPiBk
ZWJ1Z2ZzLiBIb3dldmVyLCBmb3IgYW4gZW5kIHVzZXIsIHNpbXBseSBhYm9ydGluZyB0aGUgbW9k
dWxlIGxvYWQgaXMNCj4gbXVjaCBjbGVhbmVyIHRoYW4gd2VkZ2luZyBhbmQgdHJ5aW5nIHRvIGNv
bnRpbnVlLiBUaGUgd2VkZ2UgYmxvY2tzDQo+IHVzZXIgc3VibWlzc2lvbnMgYnV0IGl0IHNlZW1z
IHRoYXQgdmFyaW91cyBiaXRzIG9mIHRoZSBkcml2ZXIgaXRzZWxmDQo+IHN0aWxsIHRyeSB0byBz
dWJtaXQgdG8gYSBkZWFkIEd1QyBhbmQgbG90cyBvZiBzdWJzZXF1ZW50IGVycm9ycw0KPiBvY2N1
ci4NCj4gQW5kIHdpdGggcmVnYXJkcyB0byBkZXZlbG9wZXJzIGRlYnVnZ2luZyB3aHkgdGhlaXIg
cGFydGljdWxhciBjb2RlDQo+IGNoYW5nZSBpcyBiZWluZyByZWplY3RlZCBieSB0aGUgR3VDLCBp
dCBpcyB0cml2aWFsIHRvIGVpdGhlciBhZGQgdGhlDQo+IHdlZGdlIGJhY2sgaW4gYW5kIGhhY2sg
dGhlIHJldHVybiBjb2RlIHRvIHplcm8gYWdhaW4gb3IgdG8ganVzdCBkbyBhDQo+IEd1QyBsb2cg
ZHVtcCB0byBkbWVzZy4NCj4gDQo+IHYyOiBBZGQgc3VwcG9ydCBmb3IgZXJyb3IgaW5qZWN0aW9u
IHRlc3RpbmcgYW5kIGRyb3AgdGhlIG5vdw0KPiByZWR1bmRhbnQNCj4gd2VkZ2UgY2FsbC4NCj4g
DQo+IENDOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IC0tLQ0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYyB8IDEzICsrKysrKysrKy0tLS0NCj4gwqAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYw0KPiBpbmRleCBlNTZjOWM1Yzg4NDUuLjVhYTcyODljYzgzZSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndWMuYw0KPiBAQCAtMTA1Nyw3ICsxMDU3LDcgQEAgc3RhdGljIHMzMiBndWNf
cGNfZ2V0X2N1cl9mcmVxKHN0cnVjdCB4ZV9ndWNfcGMNCj4gKmd1Y19wYykNCj4gwqAjZW5kaWYN
Cj4gwqAjZGVmaW5lIEdVQ19MT0FEX1RJTUVfV0FSTl9NU8KgwqDCoMKgwqAgMjAwDQo+IMKgDQo+
IC1zdGF0aWMgdm9pZCBndWNfd2FpdF91Y29kZShzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ICtzdGF0
aWMgaW50IGd1Y193YWl0X3Vjb2RlKHN0cnVjdCB4ZV9ndWMgKmd1YykNCj4gwqB7DQo+IMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZ3QgKmd0ID0gZ3VjX3RvX2d0KGd1Yyk7DQo+IMKgwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgeGVfbW1pbyAqbW1pbyA9ICZndC0+bW1pbzsNCj4gQEAgLTExNjQsNyAr
MTE2NCw3IEBAIHN0YXRpYyB2b2lkIGd1Y193YWl0X3Vjb2RlKHN0cnVjdCB4ZV9ndWMgKmd1YykN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0KPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2aWNlX2RlY2xhcmVfd2VkZ2VkKGd0X3RvX3hlKGd0
KSk7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVQUk9UTzsNCg0K
SWYgd2UgZXJyb3Igb3V0IGhlcmUgaW5zdGVhZCBvZiB3ZWRnZSB3b3VsZCBpdCBiZSBiZXR0ZXIg
dG8gYWRkIHNvbWUNCmRlZmF1bHQgY2FzZXMgdG8gdGhlIGJvb3Ryb20gYW5kIHVrZXJuZWwgc3dp
dGNoIHN0YXRlbWVudHMgYWJvdmUgc28gd2UNCm1ha2Ugc3VyZSB0byBjYXRjaC9ub3RpZnkgb2Yg
dW5leHBlY3RlZCBlcnJvcnMgcmF0aGVyIHRoYW4ganVzdCByZXR1cm4NCnRoZSBwcm90b2NvbCBl
cnJvcj8NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSBpZiAo
ZGVsdGFfbXMgPiBHVUNfTE9BRF9USU1FX1dBUk5fTVMpIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB4ZV9ndF93YXJuKGd0LCAiZXhjZXNzaXZlIGluaXQgdGltZTogJWxsZG1z
ISBbc3RhdHVzDQo+ID0gMHglMDhYLCB0aW1lb3V0cyA9ICVkXVxuIiwNCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWx0YV9tcywgc3RhdHVz
LCBjb3VudCk7DQo+IEBAIC0xMTc2LDcgKzExNzYsMTAgQEAgc3RhdGljIHZvaWQgZ3VjX3dhaXRf
dWNvZGUoc3RydWN0IHhlX2d1YyAqZ3VjKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWx0YV9tcywgeGVfZ3VjX3BjX2dldF9hY3RfZnJlcShn
dWNfcGMpLA0KPiBndWNfcGNfZ2V0X2N1cl9mcmVxKGd1Y19wYyksDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJlZm9yZV9mcmVxLCBzdGF0dXMs
IGNvdW50KTsNCj4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gKw0KPiArwqDCoMKgwqDCoMKgwqByZXR1
cm4gMDsNCj4gwqB9DQo+ICtBTExPV19FUlJPUl9JTkpFQ1RJT04oZ3VjX3dhaXRfdWNvZGUsIEVS
Uk5PKTsNCj4gwqANCj4gwqBzdGF0aWMgaW50IF9feGVfZ3VjX3VwbG9hZChzdHJ1Y3QgeGVfZ3Vj
ICpndWMpDQo+IMKgew0KPiBAQCAtMTIwOCwxNCArMTIxMSwxNiBAQCBzdGF0aWMgaW50IF9feGVf
Z3VjX3VwbG9hZChzdHJ1Y3QgeGVfZ3VjDQo+ICpndWMpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZ290byBvdXQ7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqAvKiBXYWl0IGZv
ciBhdXRoZW50aWNhdGlvbiAqLw0KPiAtwqDCoMKgwqDCoMKgwqBndWNfd2FpdF91Y29kZShndWMp
Ow0KPiArwqDCoMKgwqDCoMKgwqByZXQgPSBndWNfd2FpdF91Y29kZShndWMpOw0KPiArwqDCoMKg
wqDCoMKgwqBpZiAocmV0KQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBv
dXQ7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqB4ZV91Y19md19jaGFuZ2Vfc3RhdHVzKCZndWMt
PmZ3LCBYRV9VQ19GSVJNV0FSRV9SVU5OSU5HKTsNCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiAw
Ow0KPiDCoA0KPiDCoG91dDoNCj4gwqDCoMKgwqDCoMKgwqDCoHhlX3VjX2Z3X2NoYW5nZV9zdGF0
dXMoJmd1Yy0+ZncsIFhFX1VDX0ZJUk1XQVJFX0xPQURfRkFJTCk7DQo+IC3CoMKgwqDCoMKgwqDC
oHJldHVybiAwwqDCoMKgwqDCoMKgwqDCoC8qIEZJWE1FOiByZXQsIGRvbid0IHdhbnQgdG8gc3Rv
cCBsb2FkDQo+IGN1cnJlbnRseSAqLzsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4g
wqB9DQo+IMKgDQo+IMKgc3RhdGljIGludCB2Zl9ndWNfbWluX2xvYWRfZm9yX2h3Y29uZmlnKHN0
cnVjdCB4ZV9ndWMgKmd1YykNCg0K
