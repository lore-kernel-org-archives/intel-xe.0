Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB79CD5BDD
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 05:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9B610E042;
	Fri,  6 Sep 2024 05:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmQ8ji4y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F11D10E042
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 05:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725599904; x=1757135904;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8fFeyv/c5dhe6nRGHiLiYo98MZPlNoFoQcPL+AqHosM=;
 b=cmQ8ji4yK9X2yy/BI/0mkHqUGDRE9P0hHoYECjbwqcD6ExUhMeRiL1QU
 8c0Hfa2IqxPl4qq3IdIKsoWDIuWVAg3lgyayoGBIu7jVaMQwnI9CEahBX
 +MPZfjYASA9lbaCxiq81EIG6rtlC5JMaezhbRqeFo32hmDGE2Pgyunezz
 wNkWsLERJeFEqnMJCdFEJvFuqIoG3E68nvXbAtoSdJj+3tTgZScTEIvlK
 bMstiwRqFmTKBS4HF0FrjI9IEsbMVoM6JpPiP1Vyv3WtvdyP22okE73Vf
 /X4lW+AwyF5uNmmPK7nEHF07Jbgg48+QP+/bFlHpVFbnhj9+IKCppkKlr g==;
X-CSE-ConnectionGUID: thTVxwcBToOWQtuF1WiF4A==
X-CSE-MsgGUID: +6Z7Hmn6RRmidB8T5ll1Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24298256"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="24298256"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 22:18:23 -0700
X-CSE-ConnectionGUID: e8kaDK5WTtW/MKFE2KQKcw==
X-CSE-MsgGUID: P8M++lExSNOrn0W4yWOsOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; d="scan'208";a="70649645"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 22:18:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 22:18:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 22:18:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 22:18:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 22:18:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJYJihjuJ52x78SXYwjJUstPNHQ//yefJ3ODf2CA3XBdld/3EbI3W6zBEbHi3hoOGvT6Dmq9p0XDQSWy7G4BSTxQuFN3xR7BmOiv7JfWAMImDuWDx1SKuVaXl5AbRlUbFMamQPQbfMLB7UHYi6V9boLgUsKOND1qzFnmo/8XjCfXt2nlnOsfOQWlg8AFgZKIp5e+9Gl/jzEe7/1FeQkSZXikbwkpU9vnceaU0lvkGjDYDQEd3GjQKh/ajeHSbaSGucwTJG+wHXKYQf0UxH/orOMljYhcZzja3H0zuR7bLt8ZuQ4uOQMBtHrtdZ28i2wF9thhjhSsOP5zYBMCo0ylgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fFeyv/c5dhe6nRGHiLiYo98MZPlNoFoQcPL+AqHosM=;
 b=djDKh2KI3C6fqLTMHvzP4Pp/PYy57w5L0KpjNOR3aWpabGgTAPxuDJL6kQXzQVelLcvTSHzf996525PjlAXMIvkH4qXd4oOua+r1aKjcFTOlddoMOouhYXibC0lWEeq+/1Q48lNoNDyIuE6Gzpv21fhiVIC5wERM6ZOW8AiIZ6pkz2YCZqPE8DVJz+RH35vr52bhByGuLwW5rYPe4ThG0wvmrZTrQ1vcDIHA7cmmvRx27AUDJFcAZpOMLGBFp8dhHMhushXoY7GAPLfRzjeXM/5eHezeueb8XjZDj+AIKfnuiDy/mw1L+qMdGYRS4S9szEJ0aBiA0EctzPAiilCcyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 05:18:19 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 05:18:19 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Fix missing conversion to
 xe_display_pm_runtime_resume
Thread-Topic: [PATCH 1/4] drm/xe: Fix missing conversion to
 xe_display_pm_runtime_resume
Thread-Index: AQHa/6R3yK7tKODzfUOOLL+hLN+/FLJKORIA
Date: Fri, 6 Sep 2024 05:18:19 +0000
Message-ID: <482eccb53d00df3b4f3d00af2d38df8c9b2676b4.camel@intel.com>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <20240905150052.174895-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240905150052.174895-2-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SA0PR11MB4686:EE_
x-ms-office365-filtering-correlation-id: 911715a9-d634-47c6-de2c-08dcce3351e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WTdFdURNZlBnTGlzMVZySUNOeXUwN2VRODRFTkhwdlQraEg0NkpvU2pOdGlB?=
 =?utf-8?B?c3BCdnJaSk1GYTQwN2E1WVNEcUNLV2NGMjFZZzhUUUJ3SGFqRU1acEZ5enJT?=
 =?utf-8?B?RFlackVtRlVYc0ZwL1dwN2ZMb05DN2tjM3BpMkN1RDFNdXBUSlpqUjdwSmFN?=
 =?utf-8?B?S1dQeFhpZVBhOXNsWG5XN2tjbjlPRW5XVEU2akh6VTh0V3prWXNPQVZZL2VT?=
 =?utf-8?B?NXlZZnAzZ01NQ1RBZmpVM2FWNytOZ0xFYUZxS3V4M1hlTjJuSTBIcmxCcGda?=
 =?utf-8?B?T0kyVkVNdjErOGFWZ1NlUnhwVExsYk5rbHp5T3l1YWhKMGxldHZ3cFpOZTRV?=
 =?utf-8?B?Umt3aVNnWWs0RTJ3QjNrdmJpTGZnWitRa1F5WnR4QXBrbTZwVEIwRkdab0xB?=
 =?utf-8?B?bTFIdEJScWU0RE8yVUF0RFRVREdXQXk5RWJHazRtRkNibzlGdVhFbS83VXVa?=
 =?utf-8?B?bitZdnRvV0o4QUhCZldjQi9WZUpadFVjblRyUXp1d2YwczFHbjhSNUxZREpH?=
 =?utf-8?B?cFRzN1N6TnBiQ0VNT1hKSDhicW0xbUJNVGo4U1R2a1V5S3draWtraDRiMXFx?=
 =?utf-8?B?dkpZdXBiMWs4S1lKdHVMbVpNOWtGaEtLWXdQbnQza2ZOYnpQNHRDa3hhaWZu?=
 =?utf-8?B?WitNZVRpSVRINGNnZjJVNUcyZUhNdkExY1Voc0pOcDh0WmVUMDJlay9SRTBU?=
 =?utf-8?B?YVB2R0lXc3dFWGRwUEtVblBLQjBpQXVjMjArbnAySitzZXorZTlUWjJzNGpC?=
 =?utf-8?B?MnYrOFdNRWJ1MWp5bUJnVDJ1Ty9hUnZZRDFFVWJKbkFLZVdQcTlJaVBhY21R?=
 =?utf-8?B?VU5IT0RZSnhzRHhqT0xzT0h0QVlrYU1TUVpyZmlES0Z0Wm14ak43TTEweExt?=
 =?utf-8?B?T3RnTTVJR1pWVG5Gdys5Ky9rU0kxb1k0dWxxcmFPbjN0Q1k5VzZGTW9Kejls?=
 =?utf-8?B?aEZ1UDMraUxvcjg2UVBRSUd2c2RCMVZLR3lDTmdBTW81Yi9SOS83dlRZb1Av?=
 =?utf-8?B?UEduaXhlcjJHbkswTEFxeVJnNjEva2M5emhZaU1Yb0tBcTI1bi9YcnlZVnVH?=
 =?utf-8?B?eWRNemVxdUIwZThJaDZMdWhYeTB6dXI5MmkybjdsSVhDWTl6OXdoejd5TEJF?=
 =?utf-8?B?R1M4aFpMT3hPQmVRbTBLNkdwRkYzMnVBbGdRenpEMGFMSVZUMW9KeEpQbkJK?=
 =?utf-8?B?Q1hEay9HeURJdEdvOExWRDNYTGtrdlpPbFAzdFY3TXIvUlJUaExFWisraGFr?=
 =?utf-8?B?cHM2WDhaOXV1VmR6bW9QcjhPdWVpRWJJMytQWnZCK1RTbDlSYUVmcms4cFFU?=
 =?utf-8?B?ZDNxMG1CMEx1RUFGQXhlb3dTUE80cCtPWGlnN3laQzJLb29XcVh4ZXhlTUxE?=
 =?utf-8?B?a1l6WksvVU1aNSsvcERrcW1NK3V0MjlwcGpLVnlqQ2RTdDN1WTI3bmZmNHZV?=
 =?utf-8?B?MU9qWE5ValZ0eEllTXE2d0RVRDhPQkdPa3ArQ3JnR3IvTkxLeXZDSTFHd0Yr?=
 =?utf-8?B?bnNSVmVLN0dwOFNIZmFRQWtqM3BwQS9pa25RVWlwTTdIdEFDK1V4WXVNcldp?=
 =?utf-8?B?MFRXVEZGMmxiN2lXS2NyZ3l1dHdSazFGSnFTb3JkR2JiMlNoaFI5TWp0UWc3?=
 =?utf-8?B?SlowQ2pYQ1J0RkVsaFltNXlkZ0RHZ1dkQmFWdVByOWlxcDdjajN2UmwvY05i?=
 =?utf-8?B?M0F3N05pQUZRKzZMNVh2Tm5wWDFsQW9HN1MrVVNRaW9pTU54WTYzQVdZeTBh?=
 =?utf-8?B?U1lOYU9IZ2hrSngreXhmSTZNTDBIL3RJaEhSTmNCVlM1Wlk1TGdqQjFXL2Mx?=
 =?utf-8?B?aTNzZVhLT3NnWmdkd0RrdTY4bDVXU1Y1NkgxaE94TFN0SkloYjd6SEMwQ2ly?=
 =?utf-8?B?MWFEbWtKTWlERkk1aE5EN2ZLRUFTR1FZS3p1QVZDVFcweWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzhRTnVhSXR4Q0oySFFvUlkyeUZOdGNmaW40dHF0bkV2VTBqS0t5dzcrQ1RL?=
 =?utf-8?B?UklHaEFYSGpHNmJkVFhwbDRvUHZrNzJ0Ym4wRjdFcmtjcTY5eVNMNGh5Z1V5?=
 =?utf-8?B?VUp6VVBCdTkybkVyd2loV0RRTTJsa3hBd0c4UFdXTlZrY01MaWNtRXZIdU4x?=
 =?utf-8?B?b0RqdUJpa0lpTS91S1BqOFFxanBIVGN3K0FVOWhLMzFJd2s1ZDByN0p0WkJm?=
 =?utf-8?B?aFRIbkxOQnJvUkZUOTZXWGJhNVlrNWdHTWxUdURjalJkbUc1MUpHTjFXYlVw?=
 =?utf-8?B?VHhKME1Ha3ZBdDlDUGJ2bzdNNjcvRys1MDIzUE15dUtzUVdZb1ZmZ2NxUjNN?=
 =?utf-8?B?cG5aTjNBVEU4eDN2UHlVU0dhcDZmMFB1YXgzODkzc2NDbjBtWFNuRno2aUlH?=
 =?utf-8?B?enowVW5sUGtSSkJiSDVOWFlDanhiYStVTTNpRjV3UzlDc3FCSUhQMER2eDNK?=
 =?utf-8?B?czZvc1BPckpOSG5mR0RhVG16ejRyUWtDOXFSTDYvais3b2NsSGpJQXczY3dw?=
 =?utf-8?B?L0VrVEJ2Mm94QjllMnQ4TzJWcW1PWXl3MGhDbEt3ektYeVA4dUN3dVdLU2dJ?=
 =?utf-8?B?ekVCNHJpS2IvdFJaemFqK0U0aTRhcFhha2h0RkNLRDc5bzN2OVFoQTJhd0Mz?=
 =?utf-8?B?aElGM1phaWwxdGpncHBLbGVhbWZIS1RvbzNuQnl0TitGRDBQdEU3c3NjR0NB?=
 =?utf-8?B?bFZML1pQN3g4elh2MW5ZR2Y2QXNHL0RzR1RwbGFLZWJxR1V3dW5UYXNKbE9q?=
 =?utf-8?B?T05SdXJ5Q01NT2MrMEhqb0dTY05iQWhxYUk5QktUYVVtMVMyRnN4aWdaUFJr?=
 =?utf-8?B?U3JPNGYyS0pwS2E2eElkQ3A4dmNXZ3VxMC90OE80cnZUOWd4eFd3ajdHRnhi?=
 =?utf-8?B?Ynk2azQ4cDJuYW85bTBaaU13bE9DNkJodE5ydXZmMDhsMHAxdzRGOUxpbFlP?=
 =?utf-8?B?SFBwRUVscWpJL2JoSCt0U1dwWXpCTHgvVTRiTmxGM1Z2aThhSTB3eEltSlAv?=
 =?utf-8?B?TEl3QWlHeTIxbndJSGxSMmtEdlVoeTB1TURCM2JiT2dwRXhpY0ltZDNSY3pQ?=
 =?utf-8?B?STFCeC9XZk1RVlVTZzNkTlRoS0NkbjJuM0FCU1ZMOG4zQ2JhZUVwcTlvMHFL?=
 =?utf-8?B?YnJLYy9McGJuNCtTODd6eDFrVUxTVFlQQjNTV3o2WmswNCtNSmJyV2NQNG02?=
 =?utf-8?B?NXdDUVd0eWY0TE5sai9TT0w3cy9vQW51NzJqZHZqR0I4b1lzSnA5MjI5d2xG?=
 =?utf-8?B?WjFSTnlybnVpN3JyZmF6TEVMMEg0UUJWLzVoSjlxUVZydHlPQnhFdjFJajR6?=
 =?utf-8?B?UVlGLzlBUkxwMDlNU0wwbDZJcUJkLzBHUDJyKzBQR1VZME5yMnM1QU45VkRN?=
 =?utf-8?B?R3dSZjdNK0VlVjlQODhVbFJ5cnNETUV0dWJBbWJmdjFMOEEya1VTQWtlVEty?=
 =?utf-8?B?eVBlS3dMT0o4SlU0OWlvVlJNb2FiUG4yYzhESGkzWjIxblVYcGV4ZEEvVHkx?=
 =?utf-8?B?dGJhakE4VUw2WG5XNHpSdmhwWDl0VFBJUlpkam9MSkd0cnhicFpOd01kNGxG?=
 =?utf-8?B?Z3BIR3FQTW9selU4eEt0S1VkekllN2xjQVkzZjRBNkp4NDFpSCtKOFpETUJS?=
 =?utf-8?B?TWVLTjVvd1hKS1NKQ3ljZDl5ZVpvSk5Oem1LbkNIZndVdkU4WGpDbXF6QStN?=
 =?utf-8?B?YUtnek44eDNQSG9FV1lqSy9ORy9BVnduMlRaSWN0OENnWHRZK05zb2M2MUFx?=
 =?utf-8?B?QXhBZk11TXE3Q2R4azFpQlg2c0Zpb29zWUtIVmNFeXRkK0M1L01UQktiWWQy?=
 =?utf-8?B?TkVNOTJWMkhQUDd1QndFTTZOMGpmSHRXNUQyTEZlempZVitmR2IwMW1wVUJN?=
 =?utf-8?B?VnJ3bXNDU3FUQVdKem9oai9CNlo0U1Y2aS9WcU43UVJKazJ1OXpXYkZhblVy?=
 =?utf-8?B?cnNHczFXUzJaY3lQdmhKaFlNU3hCNENLcWhHU0t6NWlwQytCVEp3bGgzcDRX?=
 =?utf-8?B?KzFBSkRLdm1jZzUyeUtueG5QR09xWlZrNTVwTFQzQWhPM3hYNjF5WWFlaXZN?=
 =?utf-8?B?SVFqRk1TVm5lZ0dLMDBkRjM5UDdNTUswTkU5c2ZZckpJQkdxQ2QyRTJVUXVC?=
 =?utf-8?B?alN3QnZOQkpEOEJ5dTloUDRpcm5OWFdIc2VMTDJxWWFnaGVEZTBBUFRwbDM1?=
 =?utf-8?Q?FwYtIRsLcTk0dZj4mCgPzoc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4358B3E7F25654F9B4EA79C640AF6B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911715a9-d634-47c6-de2c-08dcce3351e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 05:18:19.1877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPeWSpJCNZ11vDc7Fs1VWvIJ5kJUpNvjU28DJlqDtxGf15O6Pt3CJS/94UWN+os2534cNPQ7vVIVQsqUI3xageinjmuh7+enpg75jCIhOpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
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

T24gVGh1LCAyMDI0LTA5LTA1IGF0IDE3OjAwICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gVGhpcyBlcnJvciBwYXRoIHdhcyBtaXNzZWQgd2hlbiBjb252ZXJ0aW5nIGF3YXkgZnJv
bQ0KPiB4ZV9kaXNwbGF5X3BtX3Jlc3VtZSB3aXRoIHNlY29uZCBhcmd1bWVudC4NCj4gDQo+IEZp
eGVzOiA2NmEwZjZiOWY1ZmMgKCJkcm0veGUvZGlzcGxheTogaGFuZGxlIEhQRCBwb2xsaW5nIGlu
IGRpc3BsYXkgcnVudGltZSBzdXNwZW5kL3Jlc3VtZSIpDQo+IENjOiBBcnVuIFIgTXVydGh5IDxh
cnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gQ2M6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9k
LmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcG0uYyB8IDIgKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KVGhhbmtzIGZvciB0aGUgZml4Lg0KDQpSZXZpZXdl
ZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+
DQoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+IGluZGV4IGU1MTg1NTdlMGVlYzYuLjliMTIwNGRiMTJj
M2QgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+IEBAIC00MTYsNyArNDE2LDcgQEAgaW50IHhlX3Bt
X3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB4ZV9kaXNwbGF5X3BtX3N1c3BlbmRfbGF0ZSh4ZSk7DQo+IMKgb3V0
Og0KPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX2Rpc3BsYXlfcG1fcmVzdW1lKHhlLCB0cnVlKTsNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHhlX2Rpc3BsYXlfcG1fcnVudGltZV9yZXN1bWUoeGUpOw0KPiDCoMKg
wqDCoMKgwqDCoMKgeGVfcnBtX2xvY2ttYXBfcmVsZWFzZSh4ZSk7DQo+IMKgwqDCoMKgwqDCoMKg
wqB4ZV9wbV93cml0ZV9jYWxsYmFja190YXNrKHhlLCBOVUxMKTsNCj4gwqDCoMKgwqDCoMKgwqDC
oHJldHVybiBlcnI7DQoNCg==
