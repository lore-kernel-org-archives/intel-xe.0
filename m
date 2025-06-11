Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F3C71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 22:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B1C10E73D;
	Wed, 11 Jun 2025 22:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLdjAco3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A7410E73D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 22:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749681856; x=1781217856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gC8pN6l4WFzymWttAzGheGToBgukqcSStzQDRloRpFU=;
 b=SLdjAco3jxSXZyHgzRzK2Xu0sK5vkr1vrsbQyaF2CLruZ7vvU3Ued4VA
 fvNbejLCKFWrfaS8HpYefL/oHAMFAke1qSJ5L1Oxzc7N7lI0zsULAcEWg
 FwH1MAowIZdivd8524CpLiSggxWDr4KDtajCCY9g4LTC0Y8jp1lpuRva8
 77wUgBOhifGQUSae9yxeidFTy67on5jQDT0xUawx7oo+J6RnOZM5d3hcV
 VedHt3JxZsYRMzOSJBROdYWWav7EtLPtE2OMe8CCR92EDzHbZ1lSXV+v0
 Bz44fIBWhdiCkKsDg0UDztY0v+ADrpzCiHqc/zgRYx2dk7JQ6t3PvDLjo w==;
X-CSE-ConnectionGUID: 7rIZlexgT2+CmR+syYx0CA==
X-CSE-MsgGUID: UpPzt03LQyG+CM0fZSFm8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63186450"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="63186450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 15:44:15 -0700
X-CSE-ConnectionGUID: KhpLrld2QGC31SPUr7cPLg==
X-CSE-MsgGUID: yrocmjJuSSi+GK/beu+1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="178289335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 15:44:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 15:44:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 15:44:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 15:44:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmlioylhDaNWtbYuw6qmFASGEoHeyXHmO7xHcHjwDXq+8MsSuLGo8DsIy4/xfwMqeXaK5H2ChGYgmAhy74mWT2kxD49yMSEhEmIVyCXmb3uvv4RLlYAcMSYAZZFLzKe2aTkk0+ehRErLWm8Nn//viHHh08rZLZbxSVi65xhZSu+1IYFgTbNDyMqK6Kr9gctbufl5N+psjdVo0NJaRf2r7i62o2+3WhTGaAS4LZw9EdKbNVbls/FDGjP7UG2xWNx7A3FdcHyMNOb7IVxlkygsW5wBq8jg2ZfPzcZnXrOThhLU8hZPzxZQ5aFKfmzFrcGyky/pBlfmlIay0qiPzczHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gC8pN6l4WFzymWttAzGheGToBgukqcSStzQDRloRpFU=;
 b=me+RHK6qrtIqxN4JGcsMmaefRDD6dIz7xzHC+n/6HfMTRUbba5GaoyuH9Js2dhSlov2ONqwdC1KwvnRSXN9h24keVO+xl04ib1WjsqBbGSRHUSrrYO/V3G5RMIrbdyL9bidHJbO/5V/prX/jrmkhRzL3voooJZbsl1Z3P4NoGxgjLnXxjBNgBi3ki5Gop2BgXBjh4Vj7G+KrSCUiZy9ZjzYLdAGMMBCRO8F50DrKssFjyryO8QzB30NyGpF/ZgVD2DPG+g6wUsHM8MIJt0AdjHsXoJUivLrIx1upYq2qogiObnGX2gb3Luum80HHDNPw+agFiDeCqSW0Gdly3KAODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Wed, 11 Jun 2025 22:44:05 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 22:44:05 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Topic: [PATCH v3 1/4] drm/xe/bmg: Update Wa_14022085890
Thread-Index: AQHb1Bi2Rz7m/s3aGk2VJ2AWxoSwWrPxs8qAgAASW4CAAA3TAIAAEPKAgAA8BoCABLfJgIAHw76A
Date: Wed, 11 Jun 2025 22:44:05 +0000
Message-ID: <b6bf6cfe1dfdb08dc6992c6ab01f5035922d5e7e.camel@intel.com>
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
 <20250602234415.2015921-2-vinay.belgaumkar@intel.com>
 <85316ce01b40c0cf8775833c29c4843bbf281315.camel@intel.com>
 <83ec77ee-1aed-4926-866b-e1a6301109e2@intel.com>
 <8afdac13617376dd5c9151e832921b5993443243.camel@intel.com>
 <5f834906-e62e-4a61-8dbc-7bed51904548@intel.com>
 <7094d8f3f850baed86783365bfbf5ffb84663edf.camel@intel.com>
 <c2dg4jybyfkmxgwpydvchso5bdpv46gpqat7zcjdrwcrjwjx7x@zxdu4py4iyki>
In-Reply-To: <c2dg4jybyfkmxgwpydvchso5bdpv46gpqat7zcjdrwcrjwjx7x@zxdu4py4iyki>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB7570:EE_
x-ms-office365-filtering-correlation-id: 09d41e24-0143-47e8-4a2d-08dda9397898
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R0sxZTNkbHRpcklHaW1od3JWMlR3a2lTWEgvL0NtcDR0NFBZb3NrNzJhaCtK?=
 =?utf-8?B?RXBtdlJSSmVnTGVuRE9rWWR5QkI3M2lxbXZIMWlrdDZaMlc0T25PdkpkWmFJ?=
 =?utf-8?B?WXY5QWRGeVduTG1YMkw5dFZTUkI0UUhCUUs5bmdyT2RyT29tMSsxZmlZUVM2?=
 =?utf-8?B?MWUyY1dpSVlublByWVo5T1pEcTZJcXdYWTlLYUM1TXVDbTJNdXlPaGYzQUlz?=
 =?utf-8?B?alpOT2R6UTNubU4ra3ozWXY0M0QvYVkzT3FGVGh1aHlMN2NUcTVVdjIwQ1VP?=
 =?utf-8?B?d21hSzFNRmt4TDNuRUR2L2paT2Vwa1dHQ1JiMVFsOE9talBHZGN4b2ZCNmsy?=
 =?utf-8?B?cmRWY3JLdEdSa0g1WDloZUpIVWFuMmpCVElFajdJWGMrN3h1Vml0TEZLSE4y?=
 =?utf-8?B?OEVGTGczY0h2alF2bjRLWUp1bGpOTzJqc2xIUHdSMGtYL3JvMVNhcktkN010?=
 =?utf-8?B?WG1jM0tVYXFnQmU4dDhuZVFpbVFEdmhEeUVCUlJQbytLc1dXWkRDWlg2bjd2?=
 =?utf-8?B?azVSNlltdDZVTFUrM0xwd0x4UmV1dUs1QWxZOTJKVkFvL2dFQjVmcE1ibUtN?=
 =?utf-8?B?aXZKL2ZYeHhtNnhuQ2RvOXZIZXlaQUJ1bVVrVWpkVGNmM0E5YUQyV2NzZmZT?=
 =?utf-8?B?RU1ZdmM2KzFSNlpOb0VzQnBzc1lVWVpTenFHdEdEZjNTdW5WKys2djVnUVhp?=
 =?utf-8?B?aHdKTWRvN3BSU0pvS2lLelAxRU1KekVJWWt6TEIwNk9qVFJJd2Fod2JVenBX?=
 =?utf-8?B?V1laYm9hNHc1Q3kxN25oUUdKY0VvczFiYmN2T3BOWGF1ays0T3dyeWlIT3pz?=
 =?utf-8?B?YUxZOFpSUkh4d0pUS3hrLzQrKzk1SUJ5U0hpV2x0OGF2Ym1xSTFMVVIyMWtH?=
 =?utf-8?B?WDk3Qkx0VkpTdjVpb1RsazRRRHlNMVFvYXp2TFFlWVNLV3BUL0x2RDJuSXBG?=
 =?utf-8?B?OElYTFZyQUtUTDM4RDQrdE0zcXZtbEVIK3FhSzlldW40TWxrMlJub21Jbldm?=
 =?utf-8?B?NnZCZEpzZDhZcUtrS3JqT0RTcDF3RlpRWWtsemM0c2RkZk9mQ0ZrWWpGVitL?=
 =?utf-8?B?RlI3WnQrbmRqWmdTeGQxM3pmNDQ5WEZmNS9udEpheitYbFk5UUdiVTN4WVpB?=
 =?utf-8?B?ZUhUQ1dnem4xR0oxaTNWMTVaL2trdnNuNVBBMXlPdk42WW51YW5BKzJBc2ow?=
 =?utf-8?B?MldmUUtXTGlGeldBamZQVkF5WFZnT3pmZldyVXNsa1VBdGFHY0pmOUwvRmxG?=
 =?utf-8?B?YmZvczVBVGtjaG5nM0l5eHlXWVZ3VXhUSzRtK3haTmVOZHR1WHNpR2xzQm1G?=
 =?utf-8?B?aENoS1ZpbGoyVGtSb013dm43RzdnVlYrRlBpZGpaOG5XcUh3V3RNdmJmRjd1?=
 =?utf-8?B?cHhWU2NNMUpSaW1GK2xEV0hkbXpDWTNoazFsZzQ0UmRialNkM21yRGhrN0Jm?=
 =?utf-8?B?SXdxUGFWQ3JvZjV4ZXVpOFUzbDdLM1VvdkJib09SL0xqQmJuc2doRHlnYUVy?=
 =?utf-8?B?aFl4aFBJeXhIdGNqVjFubGxyWTZ0d2pYNzVJSzBRempkMUp1YVhaMWxyVnBp?=
 =?utf-8?B?N0JFK3ppemgxWXhGeTRxQ2tkanVibG1sWXRieVViSlMvc2VKbFRTSWNTVEN2?=
 =?utf-8?B?V1VEWm1RelN0eVpueHZJbGZSRmpFR3VWSHpEQWFwS0t5eGVXam93MkxDeEtl?=
 =?utf-8?B?Y2RNTllMbm4zd2p0dk5wWFVRcFZ3andkRnBxMjMxM3ZzOS9DRGZNSis5ZXFF?=
 =?utf-8?B?aXVSU2IrZVRVV0dOUjVXWGxoaWFpTnpuM0laOUdGdHhGd1VPSmpGbTN2MHNQ?=
 =?utf-8?B?SVFjb0Q4Vi9aQWM3RjlOaXl2bzYrNUZBblRtS2RrVVNFSzMyQ2JGdDE1UkZ3?=
 =?utf-8?B?RlNiSHJ1TE5hZ055WW9FNFN0ZkxUQ2JGbFhoQ0krSUczUWl2c1l5Qm93dFBP?=
 =?utf-8?B?d292bmsydHkxOXAzVmVQWWRlUjQrbks0S3lUWVhoMVFxU2xPZ1JNSWlZNXJo?=
 =?utf-8?Q?WkHxWDr4nPOXkyL9OEnHJK4davvcN8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clpScytvSVJOMS9zNlp5K3Q4NEFMZjhENStVU2NwNHZzWlN6L1dUbGJ6TG9Y?=
 =?utf-8?B?ZDZJcFd5c0JLM2Y5bVJEUDhBWjE1cGNLL1hILzJhYzVrc2o5RFZzemlPeW5r?=
 =?utf-8?B?NEpxSDdnK3lwd1VFajFZVEpSWVUzYVV5K0lHdTJaZU43QkNsd2YvSlBEVlE0?=
 =?utf-8?B?bS9qbHdVUVU4cjQzSkF5MmZ3bE9Id1JzWExkQkdYQmxYN2xnT2ZFVzFaeGxt?=
 =?utf-8?B?TDdLa0lEUEZSb2p4SjJQR1R1eWw4RVFvVEJoczZFdDhRc0VBTU5tUzh4RG1Q?=
 =?utf-8?B?dHh5eXprdnB3YlpJbTc5cFFmWlB4MlJDa1JKS1EvakhadU5pWTVISWVzZmhH?=
 =?utf-8?B?aTdFbkVqOUhWY1QyK0V2Slh4dzA3ejBCNmVtcmNkYUg5MFVqemhwQnVtRnQ3?=
 =?utf-8?B?eDJsZDQ0R2dxWUNSaE5vbVBaSGxQMW01QlVIRWR6cjNabWZXakdld0VjbVNm?=
 =?utf-8?B?UXZ3b0NnNjh1ZGVaNG9qS0dxakRYbkFuRlVCZnN1YjgyS0dDYUZzT2lNUmVW?=
 =?utf-8?B?dWVmSW1mK3o5Um5vVVZRY3kzUHV3R005bzlJVHNsdkZqMlVQOUlRMzRBZmVC?=
 =?utf-8?B?NDcxTmpCMm43SGh0WFFENm12TFNLMi9CODhpYitKK0ZqeWpHTFpIaE5LWmdo?=
 =?utf-8?B?SlBYNmZpZzRhWlhzOVdNMTkwNGU5TSttL3NpSjRLVmdUa2JLZllYQWRHclBZ?=
 =?utf-8?B?c3lGcWZKKzQzeW1CZnFLYXp1aWxDM1RBNDlVY0hjRmdQYjZVeERycjU0SFZ5?=
 =?utf-8?B?Wi9rZWJNOHNlb2RJTUJGNy82dEZWRnc3a3Jyd1R2cmZQSk0yMnlLMTA5UHJT?=
 =?utf-8?B?UXk1M0MwcnNPbjRkMmNEbUVvcDRSRWM1Vk9Ta0RGN1d3UzVGWUNQd0ZmZnA2?=
 =?utf-8?B?bWorbzBDaFc3eUdNOURRUGlabGFKMEJ6S1NQdHV4dVE4NGNHM0lqdUtmeHkv?=
 =?utf-8?B?U0Y3d2ZkemVwQkJxOW1PWHNMK0RxcTdKdW1SNHNCbU1tMzF3QzVLUnYxNDBD?=
 =?utf-8?B?MGg1QUROTVBVcGRXR2JXTTNsMncyNzM1RnUrckRnYXM0eU5lSTR3UUI4T3Fh?=
 =?utf-8?B?M1hUaXYvOW5paUJ5MzVGWmdIaEp6b3V1aGJ6a09tS0lnZFV4Slg3U1FSVjVn?=
 =?utf-8?B?bC82bzM5N3ZGR2psOVhVVzJsY1NMZnk4U2dLT0tNZFgvak9Tc1NnYXpqaGtI?=
 =?utf-8?B?dDltclRDK3pjQzRHOWVKdWpud2s5VS9JeitjVEF3S01iaG0xOWE0ZHdoS2FK?=
 =?utf-8?B?RzJXa3l3VGlITDJKcUZlQkRsYURpQlNlaVNKZzBkU0hNYTVjVjlqeWxpMkV4?=
 =?utf-8?B?SFVtV0tKT1c4S0IxcFBaN2o5VW1rSUttSVlZRHhuZW54QzVUNk12VHVmRkRD?=
 =?utf-8?B?RTBOZVYyUzJ4WEZYS2FnT0NHSFBGbXlGR0JtbXVwUHhuSzNsdE92ZllYV1Ex?=
 =?utf-8?B?NVMzRCttS0FmVjM0U2w1bGhpYjk4djl0ZDRYUW4zaVVlTFVHbDUrc0JwQjJ1?=
 =?utf-8?B?cXh4WlZnSkZsN3lBQ3Jkd0QwNXVzQkE1M0Q2dnJ6L3libDFVeXo3N2J6VDc4?=
 =?utf-8?B?Y0FJS0hKczJIRWI2MDNpamwvdXhjTzh3dmNRWThvT3IwTTM0V2hjQU9Zdkhu?=
 =?utf-8?B?eUtxa2kwTXhsM3FLckhzS2FYNjdmTjl5OEZqcklTSmFYMW1LaEZkYnB1dnBt?=
 =?utf-8?B?UjZIYUJwMTJTOGtQY29GL21STHMyamlOcFl4V1NRS1NjU2xEcjBNaXNLbzdU?=
 =?utf-8?B?MWRzSzZHZ2E3MlMxZmpHc2pvOE9GT0pPa240MFprME1xVytISkJFbTdzWklm?=
 =?utf-8?B?dXFONmRjMDVkK1Uwa2hvUjNTQ2lEOGordnpMMHd0cnBsamZLNElET3JtN1dV?=
 =?utf-8?B?c1FSUXNoT2l3QlVBdWtscWdWSjZRd0x5VFlzUFV2YXF0M2RyQmxSbnBIVlBF?=
 =?utf-8?B?SytqMnpYck56N2ZOYjc5djFZdFZCdFdLb0Y5UEhOdlluNGNMSFZPMGs1bTcz?=
 =?utf-8?B?OCt5TVpFSTFIcXVIRWlDYkh5NkNudjZOMVRkNDZCWHk0WGxrdG91b2ttU1o0?=
 =?utf-8?B?N2VBOERIeTdqMUJYWHg3amd5UWpxVWVIYWdiTlBpdFJNd1R3NVJpRkdsR0R5?=
 =?utf-8?B?ZkxrTUdqRHJPVDg2T2ZvaHpNR1ExNUsxc0R3NWZPdmJEYVVmWjBRZmhlM01J?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71F258211DAC2E4BB8EBC1BBBF6377C5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d41e24-0143-47e8-4a2d-08dda9397898
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 22:44:05.7694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4vZbfpWQZ5HnPa4osPUKtkCaf71sHN1f7AQAbaf6h8g4/RDOWrweCMZNjPgEZjmlN3Hfs51kabol8a2uy3TTBjvI8Y6TKlCHW4C7apILO1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
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

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDE5OjA5IC0wNTAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFdlZCwgSnVuIDA0LCAyMDI1IGF0IDEyOjA2OjUyQU0gKzAwMDAsIFN0dWFydCBTdW1t
ZXJzIHdyb3RlOg0KPiA+IE9uIFR1ZSwgMjAyNS0wNi0wMyBhdCAxMzozMSAtMDcwMCwgQmVsZ2F1
bWthciwgVmluYXkgd3JvdGU6DQo+ID4gPiANCj4gPiA+IE9uIDYvMy8yMDI1IDEyOjMxIFBNLCBT
dW1tZXJzLCBTdHVhcnQgd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgMjAyNS0wNi0wMyBhdCAxMTo0
MSAtMDcwMCwgQmVsZ2F1bWthciwgVmluYXkgd3JvdGU6DQo+ID4gPiA+ID4gT24gNi8zLzIwMjUg
MTA6MzYgQU0sIFN1bW1lcnMsIFN0dWFydCB3cm90ZToNCj4gPiA+ID4gPiA+IE9uIE1vbiwgMjAy
NS0wNi0wMiBhdCAxNjo0NCAtMDcwMCwgVmluYXkgQmVsZ2F1bWthciB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gU2V0IEdUIG1pbiBmcmVxdWVuY3kgdG8gMTIwME1oeiBvbmNlIGRyaXZlciBsb2FkIGlz
DQo+ID4gPiA+ID4gPiA+IGNvbXBsZXRlLg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4g
djI6IFJldmlldyBjb21tZW50cyAoUm9kcmlnbykNCj4gPiA+ID4gPiA+ID4gdjM6IEFwcGx5IFdh
IGVhcmxpZXIgc28gdXNlcl9yZXFfbWluIGlzIG5vdCBjbG9iYmVyZWQuDQo+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT4NCj4gPiA+ID4gPiA+ID4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4NCj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVmluYXkgQmVsZ2F1bWthcg0KPiA+ID4g
PiA+ID4gPiA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiA+IC0tLQ0K
PiA+ID4gPiA+ID4gPiDCoMKgwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3BjLmPCoMKgwqDC
oCB8IDUgKysrKysNCj4gPiA+ID4gPiA+ID4gwqDCoMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dh
X29vYi5ydWxlcyB8IDEgKw0KPiA+ID4gPiA+ID4gPiDCoMKgwqAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfcGMuYw0KPiA+ID4gPiA+ID4gPiBpbmRleCAxOGM2MjM5OTIwMzUu
LmNiMDU2MzQ5NGZjYyAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19wYy5jDQo+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndWNfcGMuYw0KPiA+ID4gPiA+ID4gPiBAQCAtNTEsNiArNTEsNyBAQA0KPiA+ID4gPiA+ID4g
PiDCoMKgDQo+ID4gPiA+ID4gPiA+IMKgwqDCoCNkZWZpbmUgTE5MX01FUlRfRlJFUV9DQVDCoMKg
wqDCoMKgwqA4MDANCj4gPiA+ID4gPiA+ID4gwqDCoMKgI2RlZmluZSBCTUdfTUVSVF9GUkVRX0NB
UMKgwqDCoMKgwqDCoDIxMzMNCj4gPiA+ID4gPiA+ID4gKyNkZWZpbmUgQk1HX01JTl9GUkVRwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoDEyMDANCj4gPiA+ID4gPiA+ID4gwqDCoA0KPiA+ID4gPiA+ID4g
PiDCoMKgwqAjZGVmaW5lIFNMUENfUkVTRVRfVElNRU9VVF9NUyA1IC8qIHJvdWdobHkgNW1zLCBi
dXQgbm8NCj4gPiA+ID4gPiA+ID4gbmVlZCBmb3INCj4gPiA+ID4gPiA+ID4gcHJlY2lzaW9uICov
DQo+ID4gPiA+ID4gPiA+IMKgwqDCoCNkZWZpbmUgU0xQQ19SRVNFVF9FWFRFTkRFRF9USU1FT1VU
X01TIDEwMDAgLyogVG8gYmUNCj4gPiA+ID4gPiA+ID4gdXNlZA0KPiA+ID4gPiA+ID4gPiBvbmx5
DQo+ID4gPiA+ID4gPiA+IGF0DQo+ID4gPiA+ID4gPiA+IHBjX3N0YXJ0ICovDQo+ID4gPiA+ID4g
PiA+IEBAIC04NDMsNiArODQ0LDkgQEAgc3RhdGljIGludA0KPiA+ID4gPiA+ID4gPiBwY19hZGp1
c3RfZnJlcV9ib3VuZHMoc3RydWN0DQo+ID4gPiA+ID4gPiA+IHhlX2d1Y19wYw0KPiA+ID4gPiA+
ID4gPiAqcGMpDQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHBjX2dldF9t
aW5fZnJlcShwYykgPiBwYy0+cnAwX2ZyZXEpDQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHBjX3NldF9taW5fZnJlcShwYywgcGMtDQo+ID4g
PiA+ID4gPiA+ID5ycDBfZnJlcSk7DQo+ID4gPiA+ID4gPiA+IMKgwqANCj4gPiA+ID4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKFhFX1dBKHBjX3RvX2d0KHBjKSwgMTQwMjIwODU4OTApKQ0KPiA+
ID4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gcGNfc2V0X21p
bl9mcmVxKHBjLA0KPiA+ID4gPiA+ID4gPiBtYXgoQk1HX01JTl9GUkVRLA0KPiA+ID4gPiA+ID4g
PiBwY19nZXRfbWluX2ZyZXEocGMpKSk7DQo+ID4gPiA+ID4gPiBEbyB3ZSB3YW50IHRoaXMgYWJv
dmUgdGhlIGdldF9taW5fZnJlcSgpIGNhbGwgYWJvdmU/IFNlZW1zDQo+ID4gPiA+ID4gPiBsaWtl
DQo+ID4gPiA+ID4gPiB0aGF0DQo+ID4gPiA+ID4gPiB3b3VsZCBmdXJ0aGVyIGxpbWl0IHdoaWNo
IGlzIHdoYXQgd2UnZCB3YW50IGluIHRoYXQgY2FzZQ0KPiA+ID4gPiA+ID4gcmlnaHQ/DQo+ID4g
PiA+ID4gTm8sIHRoaXMgaXMgZHVyaW5nIFNMUEMgaW5pdCwgd2UgZG9uJ3QgbmVlZCB0byByZWFk
IHRoZSBtaW4NCj4gPiA+ID4gPiBmcmVxDQo+ID4gPiA+ID4gYXQNCj4gPiA+ID4gPiB0aGlzDQo+
ID4gPiA+ID4gcG9pbnQuIFdlIHdpbGwgYWRqdXN0IGl0IGxhdGVyIGluIHRoZSBmbG93IGlmIHRo
ZXJlIHdhcyBhDQo+ID4gPiA+ID4gdXNlcg0KPiA+ID4gPiA+IHJlcXVlc3QuDQo+ID4gPiANCj4g
PiA+IFRoaXMgZW5zdXJlcyBtaW4gZnJlcXVlbmN5IGlzIHNldCB0byAxMjAwLiBUaGF0IGlzIHJl
cXVpcmVkIGJ5DQo+ID4gPiB0aGUNCj4gPiA+IFdBLg0KPiA+ID4gSWYgdGhlcmUgd2FzIG5vIHBy
ZXZpb3VzIHVzZXIgcmVxdWVzdCAobGlrZSBiZWZvcmUgYSBHVCByZXNldCksDQo+ID4gPiB0aGUN
Cj4gPiA+IG1pbg0KPiA+ID4gd2lsbCBiZSBzZXQgdG8gMTIwMCBpbnN0ZWFkIG9mIHRoZSB1c3Vh
bCBSUGUgKHdoaWNoIGlzIGFyb3VuZA0KPiA+ID4gNTAwKS4NCj4gPiANCj4gPiBPayBtYWtlcyBz
ZW5zZSB0byBtZS4gSSBkaWQgY29uZmlybSB0aGUgd29ya2Fyb3VuZCBmcmVxdWVuY3kgY2FsbGVk
DQo+ID4gb3V0DQo+ID4gaW4gYnNwZWMgbWF0Y2hlcyBoZXJlOg0KPiA+IFJldmlld2VkLWJ5OiBT
dHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiANCj4gYnV0IHdoeSBk
byB3ZSBkbyAyIHJtdyBpbnN0ZWFkIG9mIDE/IFNvbWV0aGluZyBsaWtlIHRoaXMNCj4gDQo+IMKg
wqDCoMKgwqDCoMKgwqB1MzIgbWluX2ZyZXE7DQo+IMKgwqDCoMKgwqDCoMKgwqAuLi4NCj4gDQo+
IMKgwqDCoMKgwqDCoMKgwqAvKg0KPiDCoMKgwqDCoMKgwqDCoMKgICogU2FtZSB0aGluZyBoYXBw
ZW5zIGZvciBTZXJ2ZXIgcGxhdGZvcm1zIHdoZXJlIG1pbiBpcw0KPiBsaXN0ZWQgYXMNCj4gwqDC
oMKgwqDCoMKgwqDCoCAqIFJQTWF4DQo+IMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4gwqDCoMKgwqDC
oMKgwqDCoG1pbl9mcmVxID0gbWluKHBjX2dldF9taW5fZnJlcShwYyksIHBjLT5ycDBfZnJlcSk7
DQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKgLyogQnV0IHNob3VsZG4ndCBnbyB0byBsZXNzIHRoYW4g
Qk1HX01JTl9GUkVRIG9uIGFmZmVjdGVkDQo+IHBsYXRmb3JtcyAqLw0KPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKFhFX1dBKHBjX3RvX2d0KHBjKSwgMTQwMjIwODU4OTApKQ0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoG1pbl9mcmVxID0gbWF4KEJNR19NSU5fRlJFUSwgbWluX2ZyZXEp
Ow0KPiANCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IHBjX3NldF9taW5fZnJlcShwYywgbWluX2Zy
ZXEpOw0KDQpJIGFncmVlIHRoaXMgaXMgbXVjaCBjbGVhbmVyLiBWaW5heSBjYW4geW91IGNvbW1l
bnQgaGVyZT8NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+IFRo
YW5rcywNCj4gPiA+IA0KPiA+ID4gVmluYXkuDQo+ID4gPiANCj4gPiA+ID4gU28gdGhlbiB3aGF0
IGlzIHRoZSBwdXJwb3NlIG9mIHRoZSBjb2RlIGp1c3QgYWJvdmUgdGhpcz8NCj4gPiA+ID4gDQo+
ID4gPiA+IC1TdHVhcnQNCj4gPiA+ID4gDQo+ID4gPiA+ID4gVGhhbmtzLA0KPiA+ID4gPiA+IA0K
PiA+ID4gPiA+IFZpbmF5Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gVGhhbmtzLA0KPiA+ID4g
PiA+ID4gU3R1YXJ0DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4g
PiDCoMKgwqBvdXQ6DQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJl
dDsNCj4gPiA+ID4gPiA+ID4gwqDCoMKgfQ0KPiA+ID4gPiA+ID4gPiBAQCAtODc5LDYgKzg4Myw3
IEBAIHN0YXRpYyBpbnQNCj4gPiA+ID4gPiA+ID4gcGNfc2V0X21lcnRfZnJlcV9jYXAoc3RydWN0
DQo+ID4gPiA+ID4gPiA+IHhlX2d1Y19wYw0KPiA+ID4gPiA+ID4gPiAqcGMpDQo+ID4gPiA+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19wY19n
ZXRfbWluX2ZyZXEocGMsICZwYy0NCj4gPiA+ID4gPiA+ID4gPiBzdGFzaGVkX21pbl9mcmVxKTsN
Cj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFy
ZXQpDQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXQgPQ0KPiA+ID4gPiA+ID4gPiB4ZV9ndWNfcGNfZ2V0X21heF9mcmVx
KHBjLA0KPiA+ID4gPiA+ID4gPiAmcGMtDQo+ID4gPiA+ID4gPiA+ID4gc3Rhc2hlZF9tYXhfZnJl
cSk7DQo+ID4gPiA+ID4gPiA+ICsNCj4gDQo+IG5pdDogc3B1cmlvdXMgbmV3bGluZSBhZGRlZCBp
biB1bnJlbGF0ZWQgZnVuY3Rpb24/DQo+IA0KPiBJIGhhdmUgdGhlIGxvY2FsIGNoYW5nZXMgbG9j
YWxseSBhbmQgY2FuIGNyZWF0ZSBhIG5ldyByZXYgbGF0ZXIuDQo+IFN0dWFydCwNCj4gc2luY2Ug
eW91IHJldmlld2VkIHRoaXMuLi4gZG8geW91IGFncmVlPw0KPiANCj4gTHVjYXMgRGUgTWFyY2hp
DQo+IA0KPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
ZiAocmV0KQ0KPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsNCj4gPiA+ID4gPiA+ID4gwqDCoA0KPiA+ID4g
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0K
PiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiA+
ID4gPiA+ID4gaW5kZXggOWVmYzVhY2NkNDNkLi43NWZiZGFiNjhkNDQgMTAwNjQ0DQo+ID4gPiA+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YV9vb2IucnVsZXMNCj4gPiA+ID4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhX29vYi5ydWxlcw0KPiA+ID4gPiA+
ID4gPiBAQCAtNTksMyArNTksNCBAQCBub19tZWRpYV9sM8KgwqDCoE1FRElBX1ZFUlNJT04oMzAw
MCkNCj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTUVE
SUFfVkVSU0lPTl9SQU5HRSgxMzAxLCAzMDAwKQ0KPiA+ID4gPiA+ID4gPiDCoMKgwqAxNjAyNjUw
ODcwOMKgwqDCoMKgR1JBUEhJQ1NfVkVSU0lPTl9SQU5HRSgxMjAwLCAzMDAxKQ0KPiA+ID4gPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBNRURJQV9WRVJTSU9OX1JB
TkdFKDEzMDAsIDMwMDApDQo+ID4gPiA+ID4gPiA+ICsxNDAyMjA4NTg5MMKgwqDCoMKgR1JBUEhJ
Q1NfVkVSU0lPTigyMDAxKQ0KPiA+IA0KDQo=
