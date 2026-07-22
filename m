Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702C2C4451C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 07:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3074B10EC95;
	Wed, 22 Jul 2026 07:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfe2QvmY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E91E10EC95;
 Wed, 22 Jul 2026 07:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784704466; x=1816240466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H0aGsmKwv23Oz+jvyWVj7lBAr+vfvaZUn1THic5vPaI=;
 b=hfe2QvmYu7ovTjOL7OtRnc8gVM78L7Xtb0hKpBV5ndcqxHkMw+EXvjBr
 Rqe+kaaS26CcCiYa9UV9cJmdwO46w7DFXii/LCQNIxa0T5FQhZHMoUswA
 L8+333dSBVj8kVMOjnQawiYv4crazIVn0CNCmP0kE/YgJ4UWtUBNj5Q9j
 bKdfMeA5qFcYgNNHpBw6NQoceFB8cS7JfYgMoxgJXZ7wW1gnWECaLI8CO
 knYUqzbJiHm1bJ5eXotZy1vabcMwH0vQbOT0bhujqUAqXq1Mm4ZXrl+wB
 YFkStH8HL7lqWFYFbswhEAdEGlvNNuNurl39rG1bWE7sXQ29SpVVCdGhn Q==;
X-CSE-ConnectionGUID: VBszOaLiRbWeaRUwqfA9LA==
X-CSE-MsgGUID: be00LohUSH2TuBzr758nHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108122923"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="108122923"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 00:14:26 -0700
X-CSE-ConnectionGUID: hAZC7rilQmCiNAzkZeHP8A==
X-CSE-MsgGUID: wDHykCrHTMaYPGgsJyeRmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="253633828"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 00:14:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 00:14:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 00:14:25 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 00:14:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjCyiLjhBTeYnbbDZrAclvv8f8haSOwAU3rYQj4EBNjd5Ukl6B1QXa03XxHiAW7JP0WXyKw2ON5DsWQGVkP2rnJQrb5Lqh1ZuMkio+2weZCWVNL5h0Zl1JQe6daKPQSvnP6KBWZBP0+d1NwnCueNvHs75JJCfacbiehTSr7OofK6MylCBDkWx8/6ivhHdiWrIQjKTCRSFOqGrtqIM8UW+O3wYMp4dbqyjSAuI4fPRM4D6GBvfG1Lwn1SGHn7DzB77Zv7YZcmB8ibpmM4iTJVtE4LMvoUDbD0NEh4Uv16VBg+f37aGo3wf3pEfZLPQ4A/lUcsagolEj2BEipgkl4hdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0aGsmKwv23Oz+jvyWVj7lBAr+vfvaZUn1THic5vPaI=;
 b=sHL7O4v8s1WyLEI8wPmZ5I/gAJKZKKuQ8g0he29pAsgwhmZP/E7EC+0ZfVtRcW7GTsUKPVtekhshNpEzUP1FiHN66q6m1jrr8ViEO4WNvssT6SF9CDJCUkliG3rrGeHDDdTo6Ji6ViBAFjJd4ZF9wG54aLD7kHtMHkzjUW5nzuR/k0GMwmHqPLedb6CH4Eyjog1B8MLVPISPty4UeYwKaQF1AzVHUr1Y1bX5UrsDfau0ZF/7LAfjSCjG02/yKbk+HhMnbpgEzOCXiV1t08hTNCkPHcgfYzxU4Qv7IPX2yj9cMDLIJitG4Npbbim70X0fT/Lm1q7bU1TBWkHKxS4s5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by CH3PR11MB7251.namprd11.prod.outlook.com
 (2603:10b6:610:147::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 07:14:17 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::6d3c:5451:b5d4:3ea6%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 07:14:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/i915/cdclk: Introduce has_cd2x_pipe_select()
Thread-Topic: [PATCH 2/2] drm/i915/cdclk: Introduce has_cd2x_pipe_select()
Thread-Index: AQHdFgXBnOVFegdv/02hs3HIql2tj7Z5JzvA
Date: Wed, 22 Jul 2026 07:14:17 +0000
Message-ID: <DS4PPFE901A304FA27089FB794D60DE6888E3C12@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260717155107.17801-1-ville.syrjala@linux.intel.com>
 <20260717155107.17801-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20260717155107.17801-2-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|CH3PR11MB7251:EE_
x-ms-office365-filtering-correlation-id: 5cea91fe-f53d-4155-662a-08dee7c0d7cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|4143699003|3023799007|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: NExStha1pNi7IalyAQhcEAmpe9EWiJxZObhyZjUlczhDxl3pIfbfukMxEHETkeNy26HOuTe44jJZlXoRg2ZogAwpQ4RBKQ8gYgUfmHQHI9KSf6x3FM0gpotwMX4dAmqzGXuFpbnVcXWKlO3bjAGwiG+JZ33FXJWAT21rTSToyA1eCix8H3ff63xjrcuyxqRjfgwUheqKCqkNQpPRkxL61GsKv5hd63AxnKyIvvuVNRayzst/Qr3iTGyyyBcnJQxoMzQHkMiY/l9DumTFXzzp5yQgvA94plRvADCcR08lph85/MhWxRah0Kz83cA/d/DtxRHkbKSTjLXdddABZhcgbuDoPO7vK83n7R+nRoJtQcnbUX7pcTQQACx4MGYW49I/BRJw2KmWT7nYA/IFV/8/jBJgLD7QJDxvL1OOEYYgrn3fQ4hDtoPT6KI1P+7Ij8sVbQ3I19Ftawvn5tcBN7V0514/XmRn1Yx0dzVon8g5O+oO+TGGv/oOLZ0HLTIt/EwC5M3mEVqsi/Hio2g483e/85dY2EBOn0ka+F3VDu9htu8GHXt+DEV26h2CDk5CHN2NINFaKe/7dKKqcwUGs1PMg2Z2apwet4qyCf9y91MYM7jurXEHMbUe0UKsm4B+2ICTWfX1Vvu4LLtArLjJyFtdLkiWaj7KypFbLpuJ+9nXtOqukinwRP/SCiuHbN2OLNeV6AOW1EHwFTYN1XQy1BkDrc7PQWAuAKcGGRrDl1f8334=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(3023799007)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXBRMFFydjlRWGcrVitmbFlwb0tDVGxtbDIyZnpUTkN1cXcwUlVVTWhlSFNX?=
 =?utf-8?B?SzZVeXdySHRwbTJEWmR4UDNvN29icjNjY3Q1SWpQNmVoS3hIZzl6UFNMN2tT?=
 =?utf-8?B?N3JYTDZQODlwd3cwSFNpZDZETlpLaExnN0FTcHFRTkd5eVVQcml5cTNyTmFT?=
 =?utf-8?B?b09OTkNuTFVWZFE5QnJydUw2VVYzNVg0aVdyT3lLWmQ1bEo3QjA0QklJMFJa?=
 =?utf-8?B?L0doanB5ZldyZW9waGdWaVRYbDladVVyelRldGcxblY3TExUL0t5K2s1UjFY?=
 =?utf-8?B?a3FuUGs4Wnc1MHJmODRuQ0dnOENvWFFxZTBKcTduTmJQTU90VnQwRGdGUjlS?=
 =?utf-8?B?VDBSZlRKVGZKS1cydm1HWUM0ait3RGIxQWpteDJFWTA0Nk9HYS81MDBSZ1VL?=
 =?utf-8?B?STdMemx3R3lUNTlTTjFCZGtNQTRQT1B6SWRRbllPQVRHbGdKTml5WUFmakhw?=
 =?utf-8?B?Z0haZ1BaUm1yVjEzVjNXQUI5bmRSNVBVT3l4ck82cUl1b1BKdlRKR0Y0bnhn?=
 =?utf-8?B?WVNDY3NMR3ZQUHBCODlwLzFORkI1VFdlOUsrQW1kYmRmanl2bXpyQjA5Mkph?=
 =?utf-8?B?UXdPeUVZbDNrZHZiMGhzaVBRWUdQUExJa1NRUjdISGhvYmtibVdLZ3lqeWdL?=
 =?utf-8?B?TWVObmpyU2UyT05nMFlOeEY2RnJnaTFhME5HSHpGVjNWbXdUZStWRU4rbFFE?=
 =?utf-8?B?bFZlZy9xTEpiSUF1VlNmRllEMVFKVGtubDQ1ZzR2c2RaMjFXb1YyN3JobHZz?=
 =?utf-8?B?U1lYYzRCMlhRMDQzTjhaSDBwSDM2cHVtczBiUXVjTDdpOHFNR09NQWd3ZzJH?=
 =?utf-8?B?RlZuamE3cDFaMk5UWW56M1BLcDZsZU9XMkdxNkhGbFo4SW1kTkJxRFRmUFdE?=
 =?utf-8?B?T1JTVnlTR0tIV0xSYzJkWDREVmYwNHJKenhDQ3RSd0o4dUI3NG9lRFhOa2xp?=
 =?utf-8?B?SEh6Q01laTZsUitQS0hnNUxjUHIxTzF2UVBlbGsva3p6ell0bGFBTks0cHNl?=
 =?utf-8?B?TVFKL3RvMFpIbExIek1QZVNiTkgwSkFEdFdlK1JVOGluazRoR0VScDlXb2Jt?=
 =?utf-8?B?djFGRWVzUlFpY2Q0TEF2eVJYa29FS1VCL0loaTRid25iWS9pcVBpT251Vk5o?=
 =?utf-8?B?WkFMdGNMRmg0S3ZtOG5YUHlkWGVXeGhoeHBKRGNRc0ZvK01HTU9tOUlrcXA0?=
 =?utf-8?B?V3JSaHJtN1dQaUI0SnVreWZnTzBzSzJqcmp5UGh5eEdXWU8yVlNnYUtFM3k0?=
 =?utf-8?B?OHBFMkRZYVl6QmVacDFVcVVLZFF2Z210SDFPUTlTRHkwemExRVJ3enpvZUZZ?=
 =?utf-8?B?Mlh5T2FGME1JVjZQQTVuVk11RW43cStZN3BPYmFUVEJNcE1RQXVWTWJ3dGJP?=
 =?utf-8?B?TXNMaGpjRnE3ZjBWTXZPWDliTnJPRC94S3YycXNGZGRFSkRkWVNxRkV6OGZt?=
 =?utf-8?B?TXA4aDBNaDRSNmZtYzljVFl3VFVuVDVMYTM2UDNDR2tPREZtK3hCajFRbFZB?=
 =?utf-8?B?VWtPTFZQUTI4MXhJbmxxVXBWQnZIOFg4azRhZHJJY0FsOVhWZEtPTEovZ2lW?=
 =?utf-8?B?MTNDakRLOHFaQnBBbGJLbHk2WkVTOGZCN2dMY3RsVUx1ODVPS3M5T1JlM2pR?=
 =?utf-8?B?WnBZSERJUDdjby9sbmxDWGxwcDYvZzM1WDBIdVZiZDJjVGpadVc1SXA0dGcx?=
 =?utf-8?B?ODNzY1A1WDdQWStzdllZNW1Ob3ljRVF5YXpod0RKS3l5d2pmYjQ2TDl1WjhB?=
 =?utf-8?B?Y1g1UGhoSFVoV0cxbk00QWRrVExRWDk1T1k5QnlLZ3dhRGg4S3d3OTkwWFdJ?=
 =?utf-8?B?L3U2czdHb3dtL1c5TW5zVm5QNlluZXBWbklBUk05VFBTQzB0Z3prcUozblRk?=
 =?utf-8?B?R0JtMEkzcEtuYUVZdXMzNmtDTVpmUWVXQU9yVERDcmQ5dzdVQVBDWmlaRExx?=
 =?utf-8?B?V0NTWFpQdDF1YkFTbEtoeG4xeS9Cd3lCUnMwY1g5ZjNhMVVNRVg3MzNEY2Mz?=
 =?utf-8?B?TjlNdnowVG5Ha1VpNUtlbXFxYWIzRGZ4b0VuK0hERW1jaXVFMzFlN3V4UWpN?=
 =?utf-8?B?TEFhc1RiZU9jcFNJb2VWOHNEVEQrN0czbTllUUpCQW1RWFY3ajdEbk4zQzVH?=
 =?utf-8?B?QTlQUGpsQUZwM0d6OFFFS2piY2ZjUThKMVFXZjlZQ0E1UnFxRXAxdGxvUzc1?=
 =?utf-8?B?K2NMYXQycUVPcFRUckFyUWZMNHZYRksyYnI5a0FVNFhWaVFEUEpTcS9pL2FJ?=
 =?utf-8?B?MWY4bTBybHFsVWFqdlpacGxxV1FJTFBxaUJBYUVVb3B5dFdhdlRmMFdod0xp?=
 =?utf-8?B?amVqWlpIZjN4YlIzUlRnaUFScndackV0bCtNbGp6dHV6TUgyRWRGQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ufu5TOjI/qkDZrmXTJjQRYWx1y3srSwX39FPVI/R7tO+DwgMKPAo2fAvI6x0VNq80JwklgAjZi52cWrV+AREZ6d1Qcj0Wxa3t9eNQ+Tq++HQeYRpaVAOGoMBjUGld/YdQq+Xb000IKVAHrso3KeGTy/09Dqck0u4lEaIqqKEhGDdw+v36aYt/68S11a70FN+MwSb4Rgux56AGl67DypS6gUIAewhObdIP5U2cqb58YpvmT/yY0rmzZrDd549iw8w5sOZ3w4fXb3wAiBpYtvPIE4ANNg7LN+pQsNtOfX+FLVbAajrvQl62Yft8a8EvhWNdkbdXyhFUVMIp9G8kXOG6Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cea91fe-f53d-4155-662a-08dee7c0d7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 07:14:17.3455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyu1Bhf7z4yh2nwuyUsEVH7wCKURDA3qLO/gh/TpPLLwABjz4oXL7GAdp70Al1iPuRo8lsJovDYrX44VRAdseg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7251
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

PiBTdWJqZWN0OiBbUEFUQ0ggMi8yXSBkcm0vaTkxNS9jZGNsazogSW50cm9kdWNlIGhhc19jZDJ4
X3BpcGVfc2VsZWN0KCkNCj4gDQo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBXZSBoYXZlIHNldmVyYWwgb3BlbiBjb2RlZCBjaGVj
a3MgZm9yIHRoZSBwbGF0Zm9ybSdzIGNkMnggcGlwZSBzZWxlY3QNCj4gY2FwYWJpbGl0eSwgZWFj
aCB3cml0dGVuIHNsaWdodGx5IGRpZmZlcmVudGx5LiBNb3ZlIGl0IGFsbCBpbnRvIGEgY29tbW9u
DQo+IGhhc19jZDJ4X3BpcGVfc2VsZWN0KCkgaGVscGVyLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2VzIGFzIHRoZSBwcmV2aW91cyAnRElTUExBWV9WRVIgPCAzMCcNCj4gY2hlY2tzIHdlcmUg
aW4gY29kZXBhdGhzIHRoYXQgYWxyZWFkeSBleGNsdWRlIHByZS1ieHQgcGxhdGZvcm1zLCBhbmQN
Cj4gaW50ZWxfY2RjbGtfY2FuX2NkMnhfdXBkYXRlKCkgYWxyZWFkeSByZWplY3RzIFBUTCsgdmlh
IHRoZSBsYXRlcg0KPiBIQVNfQ0RDTEtfU1FVQVNIKCkgY2hlY2suDQo+IA0KPiBBbHNvIHVwZGF0
ZSB0aGUgZG9jcyBmb3IgdGhlIHJlZ2lzdGVyIGJpdGZpZWxkIHdoaWxlIGF0IGl0Lg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFs
QGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfY2RjbGsuYyAgICAgICAgfCAxMiArKysrKysrKy0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9yZWdzLmggfCAgMiArLQ0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+IGluZGV4IDllNWUxNWIwYzRkMS4u
NzVhZGE5NDFkMTEzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2NkY2xrLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9jZGNsay5jDQo+IEBAIC0yMTc3LDYgKzIxNzcsMTEgQEAgc3RhdGljIGJvb2wgcGxsX2VuYWJs
ZV93YV9uZWVkZWQoc3RydWN0DQo+IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpDQo+ICAJCWRpc3Bs
YXktPmNkY2xrLmh3LnZjbyA+IDA7DQo+ICB9DQo+IA0KPiArc3RhdGljIGJvb2wgaGFzX2NkMnhf
cGlwZV9zZWxlY3Qoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpIHsNCj4gKwlyZXR1cm4g
SVNfRElTUExBWV9WRVIoZGlzcGxheSwgMTAsIDIwKSB8fCBkaXNwbGF5LT5wbGF0Zm9ybS5icm94
dG9uOyB9DQo+ICsNCj4gIHN0YXRpYyB1MzIgYnh0X2NkY2xrX2N0bChzdHJ1Y3QgaW50ZWxfZGlz
cGxheSAqZGlzcGxheSwNCj4gIAkJCSBjb25zdCBzdHJ1Y3QgaW50ZWxfY2RjbGtfY29uZmlnICpj
ZGNsa19jb25maWcsDQo+ICAJCQkgZW51bSBwaXBlIHBpcGUpDQo+IEBAIC0yMTkwLDcgKzIxOTUs
NyBAQCBzdGF0aWMgdTMyIGJ4dF9jZGNsa19jdGwoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3Bs
YXksDQo+IA0KPiAgCXZhbCA9IGJ4dF9jZGNsa19jZDJ4X2Rpdl9zZWwoZGlzcGxheSwgY2RjbGss
IHZjbywgd2F2ZWZvcm0pOw0KPiANCj4gLQlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPCAzMCkN
Cj4gKwlpZiAoaGFzX2NkMnhfcGlwZV9zZWxlY3QoZGlzcGxheSkpDQo+ICAJCXZhbCB8PSBieHRf
Y2RjbGtfY2QyeF9waXBlKGRpc3BsYXksIHBpcGUpOw0KPiANCj4gIAkvKg0KPiBAQCAtMjM4MSw3
ICsyMzg2LDcgQEAgc3RhdGljIHZvaWQgYnh0X3Nhbml0aXplX2NkY2xrKHN0cnVjdCBpbnRlbF9k
aXNwbGF5DQo+ICpkaXNwbGF5KQ0KPiAgCSAqIGRpdmlkZXJzIGJvdGggc3luY2luZyB0byBhbiBh
Y3RpdmUgcGlwZSwgb3IgYXN5bmNocm9ub3VzbHkNCj4gIAkgKiAoUElQRV9OT05FKS4NCj4gIAkg
Ki8NCj4gLQlpZiAoRElTUExBWV9WRVIoZGlzcGxheSkgPCAzMCkgew0KPiArCWlmIChoYXNfY2Qy
eF9waXBlX3NlbGVjdChkaXNwbGF5KSkgew0KPiAgCQljZGN0bCAmPSB+Ynh0X2NkY2xrX2NkMnhf
cGlwZV9tYXNrKGRpc3BsYXkpOw0KPiAgCQljZGN0bCB8PSBieHRfY2RjbGtfY2QyeF9waXBlKGRp
c3BsYXksIElOVkFMSURfUElQRSk7DQo+ICAJfQ0KPiBAQCAtMjU3OSw4ICsyNTg0LDcgQEAgc3Rh
dGljIGJvb2wgaW50ZWxfY2RjbGtfY2FuX2NkMnhfdXBkYXRlKHN0cnVjdA0KPiBpbnRlbF9kaXNw
bGF5ICpkaXNwbGF5LA0KPiAgCQkJCQljb25zdCBzdHJ1Y3QgaW50ZWxfY2RjbGtfY29uZmlnICph
LA0KPiAgCQkJCQljb25zdCBzdHJ1Y3QgaW50ZWxfY2RjbGtfY29uZmlnICpiKSAgew0KPiAtCS8q
IE9sZGVyIGh3IGRvZXNuJ3QgaGF2ZSB0aGUgY2FwYWJpbGl0eSAqLw0KPiAtCWlmIChESVNQTEFZ
X1ZFUihkaXNwbGF5KSA8IDEwICYmICFkaXNwbGF5LT5wbGF0Zm9ybS5icm94dG9uKQ0KPiArCWlm
ICghaGFzX2NkMnhfcGlwZV9zZWxlY3QoZGlzcGxheSkpDQo+ICAJCXJldHVybiBmYWxzZTsNCj4g
DQo+ICAJLyoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9yZWdzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfcmVncy5oDQo+IGluZGV4IDBmNTAxODQ4MjQ5Ny4uMWZhY2EzY2RhY2ViIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcmVn
cy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9y
ZWdzLmgNCj4gQEAgLTI3ODgsNyArMjc4OCw3IEBAIGVudW0gc2tsX3Bvd2VyX2dhdGUgew0KPiAg
I2RlZmluZSAgQlhUX0NEQ0xLX0NEMlhfUElQRV9NQVNLCVJFR19HRU5NQVNLKDIxLCAyMCkgLyog
Ynh0L2dsayAqLw0KPiAgI2RlZmluZSAgQlhUX0NEQ0xLX0NEMlhfUElQRShwaXBlKQ0KPiAJUkVH
X0ZJRUxEX1BSRVAoQlhUX0NEQ0xLX0NEMlhfUElQRV9NQVNLLCAocGlwZSkpDQo+ICAjZGVmaW5l
ICBCWFRfQ0RDTEtfQ0QyWF9QSVBFX05PTkUNCj4gCVJFR19GSUVMRF9QUkVQKEJYVF9DRENMS19D
RDJYX1BJUEVfTUFTSywgMykNCj4gLSNkZWZpbmUgIElDTF9DRENMS19DRDJYX1BJUEVfTUFTSwlS
RUdfR0VOTUFTSygyMSwgMTkpIC8qIGljbCsgKi8NCj4gKyNkZWZpbmUgIElDTF9DRENMS19DRDJY
X1BJUEVfTUFTSwlSRUdfR0VOTUFTSygyMSwgMTkpIC8qIGljbC1sbmwgKi8NCj4gICNkZWZpbmUg
IElDTF9DRENMS19DRDJYX1BJUEUocGlwZSkNCj4gCVJFR19GSUVMRF9QUkVQKElDTF9DRENMS19D
RDJYX1BJUEVfTUFTSywgKHBpcGUpIDw8IDEpDQo+ICAjZGVmaW5lICBJQ0xfQ0RDTEtfQ0QyWF9Q
SVBFX05PTkUNCj4gCVJFR19GSUVMRF9QUkVQKElDTF9DRENMS19DRDJYX1BJUEVfTUFTSywgNykN
Cj4gICNkZWZpbmUgIENEQ0xLX0RJVk1VWF9DRF9PVkVSUklERQlSRUdfQklUKDE5KSAvKiBwcmUt
aWNsICovDQo+IC0tDQo+IDIuNTQuMA0KDQo=
