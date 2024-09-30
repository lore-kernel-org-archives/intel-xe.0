Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF06CE835C
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 15:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B291898F5;
	Mon, 30 Sep 2024 15:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSlaIUB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717AD898F5
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727710141; x=1759246141;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RP+taMbjxe+CEjKV+IdxlGiIgSkUBEQnjz+YhTEExs4=;
 b=iSlaIUB5RTG3LmjVpjfpb/Lt3XdCAEsrdv9DA/JvlKm9/zOn0O6i/y9K
 wAR8bxV10SgQepIfm4AE+kI6KntzL2OWwXQqIS7ie3gh315ocVBdo2gwW
 g8FGQHmxEDZ8F2a1i4wRrHqE2Uh418I9E+a2IS0eO2EdbNQ3DXbU2vnoR
 o0i+hdKXNTkE+nTBuuOOIlgX81od+WzltRLEGA66VCkcO0Ad7CxFpC8es
 CzF/F7xZXYRm/LDOjqXAALf2NVU0rQxD/XAaTB9fyGleMOmBo+4Tp/ZQm
 CBY47pJT+XyV3Ws/EFGs1Yr8mk8k84m8l2c/eqbgd5jl+vJb5SbDlmBi/ A==;
X-CSE-ConnectionGUID: 1PDitOVzTeOE1aZGLVfQ8A==
X-CSE-MsgGUID: Krz538vOSp2d4vaf+di5Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26758740"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26758740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 08:29:01 -0700
X-CSE-ConnectionGUID: tVrOm7x3Th6HkGxUdsNCzw==
X-CSE-MsgGUID: lqE+q8/nSbykl98a9qvP+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73209467"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Sep 2024 08:29:01 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 08:29:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 08:29:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 08:28:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 08:28:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 08:28:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD9QUVCMjaWsZHeMhS0Y+vdUeqO+MyOTiNnAojRhmKX+DgY9p5mPX8XRd7+7wUqLvfUcF7p2tgEujxydQoHW2g9cBj8lUCU0sxZr8fuRB6AHLru6ctJBmmkPwEqgZdHwCIQcFmxs48IcFm1aHqng39LQ+OxEn0h6eXXTGmaHLsvx12IgsB+1lTIUhi4OLClHolD03f+iQk7FKcnlkTN8g090puDJMEiNJ5roUkKKTeTrrjSwadH9cTnAEItlhtO4GMNidj0Sir6vbLDBlFwu7HH/MuPCYEvDJ3qGf2x4L9pZEAhr3yzuY0jVwzKsFFuKSN2W2NmRO9kGkTlYuy8pQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RP+taMbjxe+CEjKV+IdxlGiIgSkUBEQnjz+YhTEExs4=;
 b=Z98XfhGIyjmjYRZiJdeSEh8gmh/1prfTKVj+O2WgWwlBZPuzxwI2JYG+KSWZHDDFr1Cg5FZwmlP7q8ifOtSuVH+RoSZ4ZAq2Jk+P9h3ntN65kYVW9jsp18lQtoRDNSFtpVOtFa+nIlmlPl6ANT2/rDhKvFYfjflfj16uU/hdc1ab3k/9ejAlLW+Xj3/i0OqtC3/CSWsIlIgCyVkqGaDVJunEznnfYTWc58qRN4Moktu4GZdiVu/dVh2ruYV6noMrJJBt8ccUG5el1KoKZdyoST68PCEzGP/bEpCa5nsIH1IrjeI6s09rVVEsmaZN7o662FgmfB5Dh6WfYilenwiq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SA0PR11MB4542.namprd11.prod.outlook.com (2603:10b6:806:9f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.27; Mon, 30 Sep 2024 15:28:57 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 15:28:56 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] Revert "drm/i915/psr: Implement WA to help reach PC10"
Thread-Topic: [PATCH] Revert "drm/i915/psr: Implement WA to help reach PC10"
Thread-Index: AQHbEwhYqzjZLw7iKkKOlNE8jop5lbJwcs8AgAABxVA=
Date: Mon, 30 Sep 2024 15:28:56 +0000
Message-ID: <DM8PR11MB56558A8F4EC6ECEE1712BC0AE0762@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20240930071329.1630583-1-jouni.hogander@intel.com>
 <ZvrCANmHJIw59v8b@intel.com>
In-Reply-To: <ZvrCANmHJIw59v8b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SA0PR11MB4542:EE_
x-ms-office365-filtering-correlation-id: 50368ba2-9cec-4105-6ea8-08dce1649991
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TFcwVFJlVEpBeFdWQVdBMDArZkRtTnJxV0RnR0pnL0tQdFBjamZzNXUvR2du?=
 =?utf-8?B?M2VVWm1DbXFjakNLWGxpSDA0RDA5OTdWVUVpbm1Yd2Z6Z1ZMQ3phWFJIKytM?=
 =?utf-8?B?aGkrY2FIS0trTGdGblBXYmRQTHlHLzFwTFYrTjA2bGM1K2NONmF2RWZzMHB5?=
 =?utf-8?B?TVpkZ3ZzRFRrdVM1anQydEJWM1NOcHd5K0VCc1A2RFBGbklnS1RhSXF2QUpM?=
 =?utf-8?B?cjhsZ0h6VE1RM2szUWgraHRKYUJIYXVZNFg3WXE3d0paT21WOEppWUN0K1F1?=
 =?utf-8?B?bWxNdGtMOGtSWWhRK05UVHFReERkYWNaV25Mcy9UWnQ1emREZjMxYkNyb3hN?=
 =?utf-8?B?aXBkUmJqQkgwN0syQjh1bG11Ym12SmMwNkh6Qk0vdityRC8xZngxenJaUURV?=
 =?utf-8?B?azVzYmdJOWNYKy9HZVlJUHh0amp3Smd3cC9pdTV1SnVadVhZOE1OZUk1eU1l?=
 =?utf-8?B?eUhKZ1Y0ZldhMVN3bjVpTGRyMHRVZHVkVUxSclArR05MYXBrTXhvVmVUdDVW?=
 =?utf-8?B?WlR1N0VXNFhuQ0xpNERSa3RLN1JNbmVnK0lIaG5IYXpuc0FuTGdZQ2VXaVh3?=
 =?utf-8?B?c1UveUNkRjY5N1AxYmVxa0pWQVp0ejVqaFNkZHZXSzQ2OHVCaWdBeHBKMUhT?=
 =?utf-8?B?dE1QYWtKOXhoZlJpRVc4VG5Jd29ScE12VVdqUTdZZzJXS2xUUHI1SnRFeWg2?=
 =?utf-8?B?WFBONDNPVWdtUlcxQlFjWmNKOFgxWVFwQ1JIN1NmNGRUVWUzYWVvWW9JbUti?=
 =?utf-8?B?MnNjaitESTBFZHIrTGE5VFlPd0dEM1dVTkRHbTFtWWR0Z2MwdUVvMDN2TzBN?=
 =?utf-8?B?ZEtYT0pQa1JOMzdhQWlqODNMcFZBZ1pocWRuZkE3TzVxc21NM1grU3pWcElm?=
 =?utf-8?B?SGpPMjY4WkRJcmdONW5IM0xNUXpyeGRudThMeFl0UTQ2UGdITnJEUmZHcHBk?=
 =?utf-8?B?cWJYUXNHcnduemtGb3dxbGx3eHM1elcwbXBlQWRqUGJGTFBmZzFEWjk1RWVo?=
 =?utf-8?B?aDh2aDVldDZ6YnU4OHkvVGRrdVY3aE0wRHA3NGp1WTVxQjNINlc0dXpHZVZ3?=
 =?utf-8?B?U1d5eldVNnU2V0ttUHpuV3R0by9lT1E1cUFtSnF6OTJMMnlRSDRXZTRQVXBU?=
 =?utf-8?B?UktMc0ZYekVCV2FZUTViTUswWUp3TmR2ZWhkSHhwYU1EVzQrb3BiSzdWaDhB?=
 =?utf-8?B?ZDBkeEE2RHBQcUtxN1NXV24yOHZ5UzIxUzROQVZUMllBMlVGVjFCREVmd0pW?=
 =?utf-8?B?bjBlRjQ2TmdkSkNhTVJtUmlVbnhCeEd6ZWY3VDFtL0QxeFdYZkduMW9VSGJQ?=
 =?utf-8?B?QnJvWG9YSmNxSnlwalBjY0Z3RlZxNk5nZk0zWDk4MmtHWUQ3TzM4VVdySDNo?=
 =?utf-8?B?Ym5FTnJNUlg2Z2g4QVhuTE1pZ0NJRHl1VWxpQ3gzWE1GNG1YTVk3eStlSkdW?=
 =?utf-8?B?aTk5OG5ma2hHanZ3dzlGUzlHTjN3bmtUemlCN1VLaU1TeWJ4NXZSNUdmbmpq?=
 =?utf-8?B?YVBYTWE4eWdnOWZTU1VUNjRGb3VaZ2Nsb3VmQUtHQVJBcXkrSVozU0VTZXB2?=
 =?utf-8?B?QkRJb0VXRlFPTXNHd1FpUmNXb0dMaExCVE1RMjU0WE5uNWxZZ2JsQ0x6U2Mw?=
 =?utf-8?B?R0wzS25ydkVkWXZqVnBvK3Zhc0pvVHVobzZ4R1dTZ2R6cjBRNlNBQjRRSGwx?=
 =?utf-8?B?dnhiWkFLbGdhWGRpR0xrTFhOazRQVUIwMjhFZjhwbzVZallZWWwyYnhqQmtj?=
 =?utf-8?B?bTFSYTBnWENpNGl4aEMvS2dKblJHd3B2QmpKYzhNL2lkdWJwU0hHR1RGU2JE?=
 =?utf-8?B?L0poQnZmUEJTeVJwQTNYZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3dFc0F2Z0RsMFJvZ3drQ1VaQUY5aTlheWFhNkdUbm5acm1oQVkrME1WcVVR?=
 =?utf-8?B?c3hVSDZ5dXJNQzhIRDdMU0tJd3kwRzUzNUhLOElpVjlBbjhJOVBOaForSm9T?=
 =?utf-8?B?Q3pTa0hpcGxDalZxbnpWdklLcFhpa3RvdVhLS1NmUGYvMkE4OFB4TGZkSUgx?=
 =?utf-8?B?YUVwTE16WHgxMVNEOWVQWk1vN3pTVjl6NUZKMElKK2JpTnhJZElYalE5aE42?=
 =?utf-8?B?c3QvSk5aUC8vZmpRek9LU1htVVdOd3ZCQkdUWmxJY3BTMU9MZDM1QnRkbkFS?=
 =?utf-8?B?b0FZc0NnczlmQ2F4VzhPQXYxc2NWYWtZSFVNR2twTUFMNlk1NmtYM2dibHV4?=
 =?utf-8?B?ZHU1OHFhV3UycUc3cStNNGZnK0ZuazZzc1d2djl6bE5LMmQ3dHJQN0ZOMVo1?=
 =?utf-8?B?aUpyeGVmZUNZSnEyMS83MGZaMkZOS05WWWJQbEVFOFFibGlpbDR3OGlmd3dj?=
 =?utf-8?B?bmd2RHNwVWJ4R3hTZ3dJcUpkMnVndWNRcC96dzRPUlVHRk9wbDVRRk4wUFQ2?=
 =?utf-8?B?VzVPVEJ6aklKR1ZqeDc3OWVYbzVKR0ZvQzZKMDlCdzZlWE02Y2hOMEhGb1lL?=
 =?utf-8?B?dzlMZzd4STBkY20vczRLRHpxckNEMXM5MC9CcmMzQmhjQkYwQkVtcW5oZzJW?=
 =?utf-8?B?STB6dXdVV2dVZjZIb1FJR01QZlhMSDVPc2FMbnRuQTEyL0hqdHpuejNqdDBC?=
 =?utf-8?B?bnRTOGRrZlNMK0xEazdRQkp3YzA4RHZSWEJKZUIrZTdaRXRkbE9XSFRJSHJ0?=
 =?utf-8?B?UnVtSkJZMmZSbVJuK0NLSkNsNFpGWHo5cU1ET1Q4ODB5VUNOdlpoTVM5azBI?=
 =?utf-8?B?SWZVbS9jcURmSUw5d0Z0ZE9TVzM1djBGMWtlOXVZMlBkRTVEdnN1T3hjNVAz?=
 =?utf-8?B?VzRKWFlVcTduUFBWRXFHa1psRTlMdTJaNnIrbE5KK2ZJMjdJV2FTQmR2R2pj?=
 =?utf-8?B?YVFPTVhNblo3VkgrOFBEd3JmTm9zSWhNcGs2RE1aclBHRmMvbENrQXJYYXRW?=
 =?utf-8?B?VUNZWVJVL3lNb2dMSXFFNkRmdXVrTWp5Z2oxZjFkUkJiakVuWmU2bURkMFRG?=
 =?utf-8?B?aTh0RHJEWVcyL2hsM01UM2gyYjFuSFVtc3R2VnJJcFdTalNhQURNZVVHQkFR?=
 =?utf-8?B?MG1uOWdhTmxXY0Nlbmt4UkphS21OL0cwU0dBN3JlNzY5VVI5M1pPZHpza3Uw?=
 =?utf-8?B?UjZ0UWZhVzlER1R3WjRSR2w4MEljQVJWUzhPK0NPVUljL2NIdkQxU2dsMTQv?=
 =?utf-8?B?d1B2T1ByMVI4czFGSisydE81NWZyK2lRZXU3L2hGWGtJZkNuUWpCRlV3Q3pK?=
 =?utf-8?B?Z2owcjVQSnlYbDEwRzQ4SnEvN3FoeDR0REpOeEIrcGRPbkNpSFlBYVYxekNl?=
 =?utf-8?B?SUFtaW9YcW41NmtCcHVMdFM3dm91N01TYkdBa1BqRHRsb1QvdXlXaDZ0MVZ4?=
 =?utf-8?B?dnlPc0h0Vi9LNXkzdkxHbUNsY0pNaUZPbUxpS2toaFNyRTdXdDdTSjh1MW1j?=
 =?utf-8?B?YVVmUWZ1RlF3OFRrdlZlTmRNengrRlJ6VUJiaXdPVjNGdkFVdFpsMlZpVTFE?=
 =?utf-8?B?eE9QcWdkYkVZclZWK3hPZXBNSS8yZHhPOWtSY1dUUmhrWHY1U2laY3ZVOFNh?=
 =?utf-8?B?WU8rYXNDZXoyZDdlVHhMMERrd2sxeDJYbjNNR1kyaVBsOUpYcEdJQm9iNmE4?=
 =?utf-8?B?dkt3UzRlTUFiMG83R3gzUzM0elF3TFJCbWs2MERISVpBcVZCZ0ZBeStxbURR?=
 =?utf-8?B?aTk1TFlDS21XR0xBUTRRYXBiQThYMyszNU9UbDBrRnJGNFNtSElMYnd1SGtp?=
 =?utf-8?B?bDRhM2lJelZZcEVFVzBGU3g2NC94VGNIRzNnTTBoQUJNa2RrbDB3bTNHdFRr?=
 =?utf-8?B?VjFpT1dEa2xuTUZiaVBwUDhNcVFkYTF5TnJVNmJUK2d1bGNhZVdFN3l5MnBu?=
 =?utf-8?B?QlhSR3BlN1NFTzlqdytGK0E5Z21Md1ZQWVVmdFM1K1JJR0JWSEF4UFNPUjhJ?=
 =?utf-8?B?WGdvUDZBdlQrblZQVWlMODNxWE4zbkFNcWJBblltc0pRSkh5NXl2TGM0SWF6?=
 =?utf-8?B?a3h0ejYrZVV1M0dyVk0rcVhwaHp2c01HcExvUlNVSnc2TlQrOTFIQUlxZ1Zl?=
 =?utf-8?Q?Tru0j8kAqeUGiW7Ag/sEMmWqV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50368ba2-9cec-4105-6ea8-08dce1649991
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 15:28:56.8856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /4DwkEIQHTvRzu9jCVHYJngASzLu34XBxSKMgS22ByEsY4SGvPpNftpVfnT6CgJCcaXbkud2ZiIOnnAfoJhRWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4542
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

SEksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50
ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBSb2RyaWdv
DQo+IFZpdmkNCj4gU2VudDogTW9uZGF5LCAzMCBTZXB0ZW1iZXIgMjAyNCAxOC4yMg0KPiBUbzog
SG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IENjOiBpbnRlbC14
ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gUmV2ZXJ0ICJk
cm0vaTkxNS9wc3I6IEltcGxlbWVudCBXQSB0byBoZWxwIHJlYWNoDQo+IFBDMTAiDQo+IA0KPiBP
biBNb24sIFNlcCAzMCwgMjAyNCBhdCAxMDoxMzoyOUFNICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIg
d3JvdGU6DQo+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCBjMjU3OWEyMTc3OTliYTU3N2ZhMzlhMmEx
MjY0M2EyNzczMzRlNjkxLg0KPiA+DQo+ID4gUmV2ZXJ0aW5nIHRoaXMgY29tbWl0IGFzIGl0IGlz
IHN1c3BlY3RlZCBiZWluZyBjdWxwcml0IG9uIHJlZ3Jlc3Npb24uDQo+IA0KPiBBbnkgbGluayB0
byBhIGdpdGxhYiBpc3N1ZSBvciBhbnkgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHJlZ3Jlc3Npb24g
aXRzZWxmPw0KU29tZSBoZXJlIGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVs
LXhlL2luZGV4Lmh0bWw/dGVzdGZpbHRlcj1rbXNfcHNyJmhvc3RzPWxubCANCkdpdGxhYiA6IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0veGUva2VybmVsL2lzc3Vlcy8xNjQ5IA0K
PiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5k
ZXJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3R5cGVzLmggICAgfCAgIDMgLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Bzci5jICAgICAgfCAxMTkgKy0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEyMSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlw
ZXMuaA0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5
cGVzLmgNCj4gPiBpbmRleCA3ZmY5N2U1YjgzZGQ1Li5mNjBkNjZmNGI5ODBhIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5o
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5
cGVzLmgNCj4gPiBAQCAtMTU3Niw5ICsxNTc2LDYgQEAgc3RydWN0IGludGVsX3BzciB7DQo+ID4g
ICNkZWZpbmUgSTkxNV9QU1JfREVCVUdfUEFORUxfUkVQTEFZX0RJU0FCTEUJMHg0MA0KPiA+DQo+
ID4gIAl1MzIgZGVidWc7DQo+ID4gLQlib29sIGlzX2Rwa2djX2NvbmZpZ3VyZWQ7DQo+ID4gLQli
b29sIGlzX2RjNV9lbnRyeV9wb3NzaWJsZTsNCj4gPiAtCWJvb2wgaXNfd2FfZGVsYXllZF92Ymxh
bmtfbGltaXQ7DQo+ID4gIAlib29sIHNpbmtfc3VwcG9ydDsNCj4gPiAgCWJvb2wgc291cmNlX3N1
cHBvcnQ7DQo+ID4gIAlib29sIGVuYWJsZWQ7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiBpbmRleCAzOWFhNDZkZTE1ZTQzLi5lMzM1N2YzYjVj
NzA1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
cHNyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5j
DQo+ID4gQEAgLTI2LDcgKzI2LDYgQEANCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hl
bHBlci5oPg0KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmg+DQo+ID4gICNp
bmNsdWRlIDxkcm0vZHJtX2RlYnVnZnMuaD4NCj4gPiAtI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5r
Lmg+DQo+ID4NCj4gPiAgI2luY2x1ZGUgImk5MTVfZHJ2LmgiDQo+ID4gICNpbmNsdWRlICJpOTE1
X3JlZy5oIg0KPiA+IEBAIC04OTcsODkgKzg5Niw2IEBAIHN0YXRpYyB1OCBwc3JfY29tcHV0ZV9p
ZGxlX2ZyYW1lcyhzdHJ1Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwKQ0KPiA+ICAJcmV0dXJuIGlk
bGVfZnJhbWVzOw0KPiA+ICB9DQo+ID4NCj4gPiAtc3RhdGljIGJvb2wNCj4gPiAtaW50ZWxfcHNy
X2NoZWNrX3dhX2RlbGF5ZWRfdmJsYW5rKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlDQo+
ID4gKmFkanVzdGVkX21vZGUpIC17DQo+ID4gLQlyZXR1cm4gKGFkanVzdGVkX21vZGUtPmNydGNf
dmJsYW5rX3N0YXJ0IC0gYWRqdXN0ZWRfbW9kZS0NCj4gPmNydGNfdmRpc3BsYXkpID49IDY7DQo+
ID4gLX0NCj4gPiAtDQo+ID4gLS8qDQo+ID4gLSAqIFBLR19DX0xBVEVOQ1kgaXMgY29uZmlndXJl
ZCBvbmx5IHdoZW4gRElTUExBWV9WRVIgPj0gMjAgYW5kDQo+ID4gLSAqIFZSUiBpcyBub3QgZW5h
YmxlZA0KPiA+IC0gKi8NCj4gPiAtc3RhdGljIGJvb2wgaW50ZWxfcHNyX2lzX2Rwa2djX2NvbmZp
Z3VyZWQoc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+ID4gLQkJCQkJICBzdHJ1Y3Qg
aW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gPiAtew0KPiA+IC0Jc3RydWN0IGludGVsX2Ny
dGMgKmludGVsX2NydGM7DQo+ID4gLQlzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0
ZTsNCj4gPiAtCWludCBpOw0KPiA+IC0NCj4gPiAtCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA8
IDIwKQ0KPiA+IC0JCXJldHVybiBmYWxzZTsNCj4gPiAtDQo+ID4gLQlmb3JfZWFjaF9uZXdfaW50
ZWxfY3J0Y19pbl9zdGF0ZShzdGF0ZSwgaW50ZWxfY3J0YywgY3J0Y19zdGF0ZSwgaSkgew0KPiA+
IC0JCWlmICghaW50ZWxfY3J0Yy0+YWN0aXZlKQ0KPiA+IC0JCQljb250aW51ZTsNCj4gPiAtDQo+
ID4gLQkJaWYgKGNydGNfc3RhdGUtPnZyci5lbmFibGUpDQo+ID4gLQkJCXJldHVybiBmYWxzZTsN
Cj4gPiAtCX0NCj4gPiAtDQo+ID4gLQlyZXR1cm4gdHJ1ZTsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAt
c3RhdGljIGJvb2wgd2FfMjIwMTk0NDQ3OTdfcHNyMV9jaGVjayhjb25zdCBzdHJ1Y3QgaW50ZWxf
Y3J0Y19zdGF0ZQ0KPiAqY3J0Y19zdGF0ZSwNCj4gPiAtCQkJCSAgICAgIHN0cnVjdCBpbnRlbF9w
c3IgKnBzcikNCj4gPiAtew0KPiA+IC0Jc3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0
b19pbnRlbF9kaXNwbGF5KGNydGNfc3RhdGUpOw0KPiA+IC0NCj4gPiAtCXJldHVybiBESVNQTEFZ
X1ZFUihkaXNwbGF5KSA9PSAyMCAmJiBwc3ItPmlzX2Rwa2djX2NvbmZpZ3VyZWQgJiYNCj4gPiAt
CQkocHNyLT5pc193YV9kZWxheWVkX3ZibGFua19saW1pdCB8fCAhcHNyLQ0KPiA+aXNfZGM1X2Vu
dHJ5X3Bvc3NpYmxlKSAmJg0KPiA+IC0JCSFjcnRjX3N0YXRlLT5oYXNfc2VsX3VwZGF0ZSAmJiAh
Y3J0Y19zdGF0ZS0NCj4gPmhhc19wYW5lbF9yZXBsYXk7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLS8q
DQo+ID4gLSAqIERDNSBlbnRyeSBpcyBvbmx5IHBvc3NpYmxlIGlmIHZibGFuayBpbnRlcnJ1cHQg
aXMgZGlzYWJsZWQNCj4gPiAtICogYW5kIGVpdGhlciBwc3IxLCBwc3IyLCBlZHAgMS41IHByIGFs
cG0gaXMgZW5hYmxlZCBvbiBhbGwNCj4gPiAtICogZW5hYmxlZCBlbmNvZGVycy4NCj4gPiAtICov
DQo+ID4gLXN0YXRpYyBib29sDQo+ID4gLWludGVsX3Bzcl9pc19kYzVfZW50cnlfcG9zc2libGUo
c3RydWN0IGludGVsX2Rpc3BsYXkgKmRpc3BsYXksDQo+ID4gLQkJCQlzdHJ1Y3QgaW50ZWxfYXRv
bWljX3N0YXRlICpzdGF0ZSkNCj4gPiAtew0KPiA+IC0Jc3RydWN0IGludGVsX2NydGMgKmludGVs
X2NydGM7DQo+ID4gLQlzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsNCj4gPiAt
CWludCBpOw0KPiA+IC0NCj4gPiAtCWlmICgoZGlzcGxheS0+cG93ZXIuZG9tYWlucy50YXJnZXRf
ZGNfc3RhdGUgJg0KPiA+IC0JICAgICBEQ19TVEFURV9FTl9VUFRPX0RDNV9EQzZfTUFTSykgPT0g
MCkNCj4gPiAtCQlyZXR1cm4gZmFsc2U7DQo+ID4gLQ0KPiA+IC0JZm9yX2VhY2hfbmV3X2ludGVs
X2NydGNfaW5fc3RhdGUoc3RhdGUsIGludGVsX2NydGMsIGNydGNfc3RhdGUsIGkpIHsNCj4gPiAt
CQlzdHJ1Y3QgZHJtX2NydGMgKmNydGMgPSAmaW50ZWxfY3J0Yy0+YmFzZTsNCj4gPiAtCQlzdHJ1
Y3QgZHJtX3ZibGFua19jcnRjICp2Ymxhbms7DQo+ID4gLQkJc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXI7DQo+ID4gLQ0KPiA+IC0JCWlmICghaW50ZWxfY3J0Yy0+YWN0aXZlKQ0KPiA+IC0J
CQljb250aW51ZTsNCj4gPiAtDQo+ID4gLQkJdmJsYW5rID0gZHJtX2NydGNfdmJsYW5rX2NydGMo
Y3J0Yyk7DQo+ID4gLQ0KPiA+IC0JCWlmICh2YmxhbmstPmVuYWJsZWQpDQo+ID4gLQkJCXJldHVy
biBmYWxzZTsNCj4gPiAtDQo+ID4gLQkJaWYgKCFjcnRjX3N0YXRlLT5oYXNfcHNyKQ0KPiA+IC0J
CQlyZXR1cm4gZmFsc2U7DQo+ID4gLQ0KPiA+IC0JCWZvcl9lYWNoX2VuY29kZXJfb25fY3J0Yyhk
aXNwbGF5LT5kcm0sIGNydGMsIGVuY29kZXIpDQo+ID4gLQkJCWlmIChlbmNvZGVyLT50eXBlICE9
IElOVEVMX09VVFBVVF9FRFAgfHwNCj4gPiAtCQkJICAgICFDQU5fUFNSKGVuY190b19pbnRlbF9k
cChlbmNvZGVyKSkpDQo+ID4gLQkJCQlyZXR1cm4gZmFsc2U7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+
IC0JcmV0dXJuIHRydWU7DQo+ID4gLX0NCj4gPiAtDQo+ID4gIHN0YXRpYyB2b2lkIGhzd19hY3Rp
dmF0ZV9wc3IxKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApICB7DQo+ID4gIAlzdHJ1Y3QgaW50
ZWxfZGlzcGxheSAqZGlzcGxheSA9IHRvX2ludGVsX2Rpc3BsYXkoaW50ZWxfZHApOyBAQA0KPiA+
IC0xMDkyLDE1ICsxMDA4LDcgQEAgc3RhdGljIHZvaWQgaHN3X2FjdGl2YXRlX3BzcjIoc3RydWN0
IGludGVsX2RwDQo+ICppbnRlbF9kcCkNCj4gPiAgCXUzMiB2YWwgPSBFRFBfUFNSMl9FTkFCTEU7
DQo+ID4gIAl1MzIgcHNyX3ZhbCA9IDA7DQo+ID4NCj4gPiAtCS8qDQo+ID4gLQkgKiBXYV8yMjAx
OTQ0NDc5Nw0KPiA+IC0JICogVE9ETzogRGlzYWJsZSBpZGxlIGZyYW1lcyB3aGVuIHZibGFuayBn
ZXRzIGVuYWJsZWQgd2hpbGUNCj4gPiAtCSAqIFBTUjIgaXMgZW5hYmxlZA0KPiA+IC0JICovDQo+
ID4gLQlpZiAoRElTUExBWV9WRVIoZGV2X3ByaXYpICE9IDIwIHx8DQo+ID4gLQkgICAgIWludGVs
X2RwLT5wc3IuaXNfZHBrZ2NfY29uZmlndXJlZCB8fA0KPiA+IC0JICAgIGludGVsX2RwLT5wc3Iu
aXNfZGM1X2VudHJ5X3Bvc3NpYmxlKQ0KPiA+IC0JCXZhbCB8PQ0KPiBFRFBfUFNSMl9JRExFX0ZS
QU1FUyhwc3JfY29tcHV0ZV9pZGxlX2ZyYW1lcyhpbnRlbF9kcCkpOw0KPiA+ICsJdmFsIHw9IEVE
UF9QU1IyX0lETEVfRlJBTUVTKHBzcl9jb21wdXRlX2lkbGVfZnJhbWVzKGludGVsX2RwKSk7DQo+
ID4NCj4gPiAgCWlmIChESVNQTEFZX1ZFUihkaXNwbGF5KSA8IDE0ICYmICFJU19BTERFUkxBS0Vf
UChkZXZfcHJpdikpDQo+ID4gIAkJdmFsIHw9IEVEUF9TVV9UUkFDS19FTkFCTEU7DQo+ID4gQEAg
LTI4MTUsMjAgKzI3MjMsMTAgQEAgdm9pZCBpbnRlbF9wc3JfcHJlX3BsYW5lX3VwZGF0ZShzdHJ1
Y3QNCj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gPiAgCWNvbnN0IHN0cnVjdCBpbnRl
bF9jcnRjX3N0YXRlICpuZXdfY3J0Y19zdGF0ZSA9DQo+ID4gIAkJaW50ZWxfYXRvbWljX2dldF9u
ZXdfY3J0Y19zdGF0ZShzdGF0ZSwgY3J0Yyk7DQo+ID4gIAlzdHJ1Y3QgaW50ZWxfZW5jb2RlciAq
ZW5jb2RlcjsNCj4gPiAtCWJvb2wgZHBrZ2NfY29uZmlndXJlZCA9IGZhbHNlLCBkYzVfZW50cnlf
cG9zc2libGUgPSBmYWxzZTsNCj4gPiAtCWJvb2wgd2FfZGVsYXllZF92YmxhbmtfbGltaXQgPSBm
YWxzZTsNCj4gPg0KPiA+ICAJaWYgKCFIQVNfUFNSKGRpc3BsYXkpKQ0KPiA+ICAJCXJldHVybjsN
Cj4gPg0KPiA+IC0JaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID09IDIwKSB7DQo+ID4gLQkJZHBr
Z2NfY29uZmlndXJlZCA9IGludGVsX3Bzcl9pc19kcGtnY19jb25maWd1cmVkKGRpc3BsYXksDQo+
IHN0YXRlKTsNCj4gPiAtCQlkYzVfZW50cnlfcG9zc2libGUgPQ0KPiA+IC0JCQlpbnRlbF9wc3Jf
aXNfZGM1X2VudHJ5X3Bvc3NpYmxlKGRpc3BsYXksIHN0YXRlKTsNCj4gPiAtCQl3YV9kZWxheWVk
X3ZibGFua19saW1pdCA9DQo+ID4gLQ0KPiAJaW50ZWxfcHNyX2NoZWNrX3dhX2RlbGF5ZWRfdmJs
YW5rKCZuZXdfY3J0Y19zdGF0ZS0NCj4gPmh3LmFkanVzdGVkX21vZGUpOw0KPiA+IC0JfQ0KPiA+
IC0NCj4gPiAgCWZvcl9lYWNoX2ludGVsX2VuY29kZXJfbWFza193aXRoX3BzcihzdGF0ZS0+YmFz
ZS5kZXYsIGVuY29kZXIsDQo+ID4gIAkJCQkJICAgICBvbGRfY3J0Y19zdGF0ZS0NCj4gPnVhcGku
ZW5jb2Rlcl9tYXNrKSB7DQo+ID4gIAkJc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGVuY190
b19pbnRlbF9kcChlbmNvZGVyKTsgQEAgLQ0KPiAyODM3LDEyDQo+ID4gKzI3MzUsNiBAQCB2b2lk
IGludGVsX3Bzcl9wcmVfcGxhbmVfdXBkYXRlKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUNCj4g
PiAqc3RhdGUsDQo+ID4NCj4gPiAgCQltdXRleF9sb2NrKCZwc3ItPmxvY2spOw0KPiA+DQo+ID4g
LQkJaWYgKERJU1BMQVlfVkVSKGk5MTUpID09IDIwKSB7DQo+ID4gLQkJCXBzci0+aXNfZHBrZ2Nf
Y29uZmlndXJlZCA9IGRwa2djX2NvbmZpZ3VyZWQ7DQo+ID4gLQkJCXBzci0+aXNfZGM1X2VudHJ5
X3Bvc3NpYmxlID0gZGM1X2VudHJ5X3Bvc3NpYmxlOw0KPiA+IC0JCQlwc3ItPmlzX3dhX2RlbGF5
ZWRfdmJsYW5rX2xpbWl0ID0NCj4gd2FfZGVsYXllZF92YmxhbmtfbGltaXQ7DQo+ID4gLQkJfQ0K
PiA+IC0NCj4gPiAgCQkvKg0KPiA+ICAJCSAqIFJlYXNvbnMgdG8gZGlzYWJsZToNCj4gPiAgCQkg
KiAtIFBTUiBkaXNhYmxlZCBpbiBuZXcgc3RhdGUNCj4gPiBAQCAtMjg1MCw3ICsyNzQyLDYgQEAg
dm9pZCBpbnRlbF9wc3JfcHJlX3BsYW5lX3VwZGF0ZShzdHJ1Y3QNCj4gaW50ZWxfYXRvbWljX3N0
YXRlICpzdGF0ZSwNCj4gPiAgCQkgKiAtIENoYW5naW5nIGJldHdlZW4gUFNSIHZlcnNpb25zDQo+
ID4gIAkJICogLSBSZWdpb24gRWFybHkgVHJhbnNwb3J0IGNoYW5naW5nDQo+ID4gIAkJICogLSBE
aXNwbGF5IFdBICMxMTM2OiBza2wsIGJ4dA0KPiA+IC0JCSAqIC0gRGlzcGxheSBXQV8yMjAxOTQ0
NDc5Nw0KPiA+ICAJCSAqLw0KPiA+ICAJCW5lZWRzX3RvX2Rpc2FibGUgfD0NCj4gaW50ZWxfY3J0
Y19uZWVkc19tb2Rlc2V0KG5ld19jcnRjX3N0YXRlKTsNCj4gPiAgCQluZWVkc190b19kaXNhYmxl
IHw9ICFuZXdfY3J0Y19zdGF0ZS0+aGFzX3BzcjsgQEAgLTI4NjAsOA0KPiArMjc1MSw2IEBADQo+
ID4gdm9pZCBpbnRlbF9wc3JfcHJlX3BsYW5lX3VwZGF0ZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0
YXRlICpzdGF0ZSwNCj4gPiAgCQkJcHNyLT5zdV9yZWdpb25fZXRfZW5hYmxlZDsNCj4gPiAgCQlu
ZWVkc190b19kaXNhYmxlIHw9IERJU1BMQVlfVkVSKGk5MTUpIDwgMTEgJiYNCj4gPiAgCQkJbmV3
X2NydGNfc3RhdGUtPndtX2xldmVsX2Rpc2FibGVkOw0KPiA+IC0JCS8qIFRPRE86IERpc2FibGUg
UFNSMSB3aGVuIHZibGFuayBnZXRzIGVuYWJsZWQgd2hpbGUgUFNSMQ0KPiBpcyBlbmFibGVkICov
DQo+ID4gLQkJbmVlZHNfdG9fZGlzYWJsZSB8PQ0KPiB3YV8yMjAxOTQ0NDc5N19wc3IxX2NoZWNr
KG5ld19jcnRjX3N0YXRlLCBwc3IpOw0KPiA+DQo+ID4gIAkJaWYgKHBzci0+ZW5hYmxlZCAmJiBu
ZWVkc190b19kaXNhYmxlKQ0KPiA+ICAJCQlpbnRlbF9wc3JfZGlzYWJsZV9sb2NrZWQoaW50ZWxf
ZHApOw0KPiA+IEBAIC0yOTAyLDEyICsyNzkxLDYgQEAgdm9pZCBpbnRlbF9wc3JfcG9zdF9wbGFu
ZV91cGRhdGUoc3RydWN0DQo+IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+ID4gIAkJa2Vl
cF9kaXNhYmxlZCB8PSBESVNQTEFZX1ZFUihkaXNwbGF5KSA8IDExICYmDQo+ID4gIAkJCWNydGNf
c3RhdGUtPndtX2xldmVsX2Rpc2FibGVkOw0KPiA+DQo+ID4gLQkJLyoNCj4gPiAtCQkgKiBXYV8y
MjAxOTQ0NDc5Nw0KPiA+IC0JCSAqIFRPRE86IERpc2FibGUgUFNSMSB3aGVuIHZibGFuayBnZXRz
IGVuYWJsZWQgd2hpbGUgUFNSMSBpcw0KPiBlbmFibGVkDQo+ID4gLQkJICovDQo+ID4gLQkJa2Vl
cF9kaXNhYmxlZCB8PSB3YV8yMjAxOTQ0NDc5N19wc3IxX2NoZWNrKGNydGNfc3RhdGUsDQo+IHBz
cik7DQo+ID4gLQ0KPiA+ICAJCWlmICghcHNyLT5lbmFibGVkICYmICFrZWVwX2Rpc2FibGVkKQ0K
PiA+ICAJCQlpbnRlbF9wc3JfZW5hYmxlX2xvY2tlZChpbnRlbF9kcCwgY3J0Y19zdGF0ZSk7DQo+
ID4gIAkJZWxzZSBpZiAocHNyLT5lbmFibGVkICYmICFjcnRjX3N0YXRlLT53bV9sZXZlbF9kaXNh
YmxlZCkNCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo=
