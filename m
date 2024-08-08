Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CA2C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 19:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9152C10E7EA;
	Thu,  8 Aug 2024 19:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDf7v48U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15FE10E7EA
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723143920; x=1754679920;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ztfR9IYCi60BvDyeNpSoHcwXbY1I+pRe9nUIKRi5muk=;
 b=nDf7v48UWcY01zrFQwntuOKdE7HXE4tGVaaeZjbVMza174H6tPQ/X15v
 ti4VeLlZTeIgfzeR0yDXszGd6nFuGGspaKXMvRD+YveRaPXBWGoD27xzM
 tXHA2brT9xDIvn8lrnBZyVTxzoFjRXH3NOPPPf442KwJITQLANdYI4TWb
 HGPICjKl/gdNTNTxtatfq5BEDrulIqwzKFPjRRHdtjKzYFTAGY2ioeJ3C
 4DIT51b6yHJyCvMDo4F6Q+JRodAqJxnHIaXt2WrYLa9OZ0KxyIIOp60tn
 Bw6QdenHYr4w1mSOlyBnxHr1FcGh26kdmV0BZuAfq9bCeSZ7FC0lqK0zT w==;
X-CSE-ConnectionGUID: gPjGV5fLRFe7JLLcU3dIcA==
X-CSE-MsgGUID: U8pEfk3CSmSre7VkcrXefA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20862483"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="20862483"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 12:05:20 -0700
X-CSE-ConnectionGUID: Ggz/4NuPT3mFvzYpLZmK2w==
X-CSE-MsgGUID: I/Q9mEotSR2sbORicvJ+aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57874398"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 12:05:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 12:05:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 12:05:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 12:05:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvesVJ9bLGSv740RJ2ARyd11bfIOtBTYC4JtA3EK7dOYdKIAH9FQEQm6fDKWvkvZEPerpfojdZ+jl8Clygcrvp1HuO6mvxckKq/2hVQXppuWyHNqoDXAFpdjv0guJvUo2dS0EpOPjED8ROh0ZY74gYIIAnCKZoJIrVqFQcZRHnX/vFXNTK8CZe1geS4nHk+AlsdXLZ63JEDiJdnvnsdllvmMyawubYOD5A0KRXiqZo1GD9O3mcL5UmATHO5DloUKohZAmg645ME+KyrifooRvC82F3VvGOMEDQtzePNI7P5/dpXBKKtsu7Xkq7xSEXWTesBg4P8fmcGXSacUS8i1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztfR9IYCi60BvDyeNpSoHcwXbY1I+pRe9nUIKRi5muk=;
 b=F+yPUB1c7Bg/RQt18h52PT82dO2PE8TMsyoVdh5JHsLmtV8XcGGLG3Mzwf0BjSuX4V6DKbN5EnS7VicCvZJkQ/Ati3xQEdJMvV/xPfQQ/MY3NHmpJA4wFQOS7dsB82iugR9NoIjt1NVtdf2tC3mLkaYlFo1DUdXFgNCI2dvF3UtGdsNKqHDhCRweownVm5zo9xwYOgU39NtvZRyG10v6mXTg+XlAoaP5klcdkVuOL0ZlOL9sIEnYdTKEFunakt9AsGte9YbVjQyjy40t78SSIE/SQIxq6DU3U32MULyl7WALPP1YAVkaQBa2Dq6Y7dTTStl23ohDYqaI3qOaWLsVyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 8 Aug
 2024 19:05:15 +0000
Received: from BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f]) by BN0PR11MB5758.namprd11.prod.outlook.com
 ([fe80::5183:feab:8a06:b19f%5]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 19:05:15 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v15 3/5] drm/xe/guc: Add capture size check in GuC log
 buffer
Thread-Topic: [PATCH v15 3/5] drm/xe/guc: Add capture size check in GuC log
 buffer
Thread-Index: AQHa6BEB6eL1KT2Ze0+m9/05toitHbIdu6mA
Date: Thu, 8 Aug 2024 19:05:15 +0000
Message-ID: <f595c8370110e71082801f3a08bf6c0e254819b6.camel@intel.com>
References: <20240806145704.165231-1-zhanjun.dong@intel.com>
 <20240806145704.165231-4-zhanjun.dong@intel.com>
In-Reply-To: <20240806145704.165231-4-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_|CO1PR11MB5139:EE_
x-ms-office365-filtering-correlation-id: edac7a5b-6173-409b-2d20-08dcb7dd0947
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RElEMWZ2ZEE0bW9GRGhMUFdoY1VhWjArUys1RFlXSlJTSEpKZ09tSzNoNVlM?=
 =?utf-8?B?bGEyU0pXZFVMclhyQ2hNWFBSUW5TZ2RzQzFsU2VZV2gxVnVRejZDMWY3OEcv?=
 =?utf-8?B?VHBGYStJd2hzNGRwditkNUVQd2M0UVVUYWRuMVI2YmZOQkZKakJKQ3lSSjY5?=
 =?utf-8?B?T2NBNEdINnd6ZVRpU3dUMGFkUUg5bXFVNkNXOG53REg3UWpFNDZCU0lOQkpU?=
 =?utf-8?B?YWJjV3psQkY2S05wejY1b3NCTDhLYURVc3Z5L0ljT0Vvc3A3b2ZDaFRnc2RR?=
 =?utf-8?B?R0VSbnBEODFNSC8vQmJFNE05SDVScHRRZjV0d2FjUjRYZ1UrMUlxdld3bGl1?=
 =?utf-8?B?dmM3K2tCalg4dTFlQkJvNjVYeFhjQWtlRC9mb0hqQzFCM1lDOHJpYm5zcUxz?=
 =?utf-8?B?OHo3ZldKazk4eDZZU3lwKzBBZjZWeUFmK2pCS2k2S0ZhR2VmSzlaMnhHbng4?=
 =?utf-8?B?WHEvc1paVWdXeUtnZWpCbForUEtpbitES0tncklUVVczRVVwdWZ5K1UybkRZ?=
 =?utf-8?B?WVFNQ3EvdWVZbzIzalVqdmFmTEZJZUdIdHhwdElSYnN4MGY5Tzl4Z3gvaEMv?=
 =?utf-8?B?aXZGeXFFRXhhNmxkUGF2Zll2UVpwTExsNnFBYW5uTHhZVFFiWFdHbWRHWkgr?=
 =?utf-8?B?NHZtVGNMRXdDbTI1eVF0QmdmNFBhSGx4Vi9MU3gyaUpaaER3TnBEYldCZUpu?=
 =?utf-8?B?a1NJZXN6cWlBMmtkZWhjY2hxNU1STExkaU9BcUVFTGE3aXEwSmU5d2NESUl3?=
 =?utf-8?B?L2U2blZXaU5mQmFTZngyQ3ArZk5BVnorYzBIM2NiYzU2MTBFZ2E0NmtiTm5Q?=
 =?utf-8?B?a2psdUp1WkFmRVo3aHIveWVPaXV1NklId01MQWtIUk81VW1hZzc2VUh0VVJL?=
 =?utf-8?B?emM5S0JwMmpPdE83a0lIZzdDa3d4U0MzK3ZFM0g2WXZBTk5NSWIwR0phY1lW?=
 =?utf-8?B?Tk9pYWc0UnVNSHpad0taVUVGb2d3RmVJYWg2bkh2NVpDWkxYOGtDdWdOVkhn?=
 =?utf-8?B?bnZxL0VFbHIxdi94WVF4bUVNQ2tNSFd5eTZpRjZ0b1d3YkQ5UlF3dFhpMytN?=
 =?utf-8?B?SjUvVXYzbGZtSjI5UTNsenQ5dDk0Tm43U25vbUs2NUFwQUxQTkFqM0FqdTRo?=
 =?utf-8?B?ZFFueStjS0xjT0hvVU5YTnJSZUtQeGl5OU0yclVMZjhOOFYyRkVwTmJxVk1n?=
 =?utf-8?B?WmU2VnExalQxalhQVzVHOHhGeE9ROVB0Sk9tTGZGY1Rnb1Z5ZlVqYlNNLy9k?=
 =?utf-8?B?dEI3RjJHaXorWEd1NkdVNENPcTJCSS9pK2xJSk0zaWIzYXZpNDFQZGhsL1d1?=
 =?utf-8?B?WUgrWCt0VzRJVWs0TVVLRDV5RG5mYnJDTDhFbVpYeUxoWGZ1eTdWUHNCZFRW?=
 =?utf-8?B?S3FoS2V2bG9WNmxjbzdOY0lvY2dNOXlsZk1tbG44QkF3b0V5UU5OMCtoZFZ3?=
 =?utf-8?B?aTlsMkpTWnpEcnMwSFVnVGtuU2JxR0lLbFJ4RGxpS01IMTY4WWovaXc2alA1?=
 =?utf-8?B?MHBhRWxyUEVxQ1pMRDBHamVuemIrZEo3YjVxTWVrS05xVDJRSC9JdG1GZmFr?=
 =?utf-8?B?Q2RSR3pGWUdlMFUra0lHaGxrS3duUlRUTTFhM0RSTDBtbVRZNTRKcTFJc29O?=
 =?utf-8?B?VlJpcXNraVpsQTlpUndZejY1MURXREFOd2dmcUxUT2xxM1A1MW1naXhxTUxa?=
 =?utf-8?B?ZUt4Z2JoZ1ZCTWJtOGg0WXNvMGJacUttZ0lkVUM0dDlCd3o2M3hJUjRMeTV0?=
 =?utf-8?B?dFppeFF6QSt2ZENNV1BNODM2SDJpdXpFSWhad2p5NzRZUVJibkN5ZUlJRmJq?=
 =?utf-8?B?SzFQL3FmQXlTNTlOZ3pJVCtHdUpsMGszcWhYOVQwTm9hSTMyQmZReW9wWDVr?=
 =?utf-8?B?b1VkNWErVmVNSVN3UTlwNlhKVjhuaVdkTHFiWXN0ZGRjaXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzhrR3Y4aVpVK0w3dXhVNTBSS01aRllaNVFFT3dacy9HS3ZKWUxTOENRQ3lB?=
 =?utf-8?B?M3l3L0czdlQzelBMSW4xelZXVUtyR3ZnZFRhTmhlNDZneXg2aSt2NGN0Kytk?=
 =?utf-8?B?SkxwVlF3SHhyVUhsVTd4NW4vSWFqOEY4MzN5UXVub1Z0WHQ2cUJOV3VNVGto?=
 =?utf-8?B?eDhsVWhKTTZ0Q1lhNWs0R1YwTUZjcTVaWExEVEtWaDdOZU9qWnY5S0N5Q29N?=
 =?utf-8?B?dTNZcjhiRW5jQy8xbUdYT2o2a2lOd0xwRllvVGp2UjFLaVdNNUEwTks3V3V2?=
 =?utf-8?B?Y3lsYmdwanN3UDZiYUtTcXp2S1UvQUZlVUlXNWxVQmkvZHcrSFJuTFFmTFRh?=
 =?utf-8?B?SkQ1aFZEM0E3V0hkMmNTdWNvdXNzYTJvR2w5bEkyclNtNC9icE56NWpkVHdv?=
 =?utf-8?B?ekZrNWtZcmZyMFZIVUZLdnUrcXRwRERsK2NTTEExYVlqUDgvNTNFOHpUbjZr?=
 =?utf-8?B?ZGU0TFFSWGxEajhORFJxdUhTUjRzU0thQUJrbWliR1lFSk9ndnNvQldaUURw?=
 =?utf-8?B?czQ5Qk8wOGpTS1dmbUZnSWQ5bldWRVp1SDdGTWcrQ1BweG9IUDN0R0YyUGpS?=
 =?utf-8?B?RHlpU3hPcERLRHVvbEtJTm1BZzVKZVN2RGM3ZFpSVmt1SlVRaWQwWG1zU3ps?=
 =?utf-8?B?U0VhZ2cyZWRKWFBNREM3ZjNqb2QyVDllekJucUtGVmdEZ2M4MDZyamVNYzdX?=
 =?utf-8?B?WHloUkVkbGxKRVJ2Y29xaGZlYkZaMlhMWEVJNlVWZ3dLNXRRYktURXhHMXF3?=
 =?utf-8?B?QlR6VEROUlVIZUpuYmVkRmsvRWVMRTBLTGZBRWkxalU1NEc5Rkx2aTQrckxS?=
 =?utf-8?B?Z0hrK2pEaXVQMTEydmx4aXAxV3lIc3Q2d2k5TkthcDFRUm5pODUyNEJHbUpz?=
 =?utf-8?B?VWlIQ1poSHhxU1oxbXlPRDk4QnpEdDdKeHg3aGpIQkxvRnVvdlVrRUJTUjdu?=
 =?utf-8?B?UlFOOElZNjBFL0V3eThYUUZ6SVdTcllXclJlNnhBR1U5dXppWjFVZ0RpQjBI?=
 =?utf-8?B?T0JBMnJ2MnprcWFIMll0WUEvQzM2OTl2Ri95bXJzY2pIa1FWM3pXVlAvZkZj?=
 =?utf-8?B?S2NFZVpRSUpGQW44Q0tzcHVQZ1F1dlhKK1VnbGpqWERSVXhIL1BjYnJ3Tk85?=
 =?utf-8?B?YUtxeDlBc0NIUTJoZVlTZ1pSK2dsTG94RXR5bDNORXRCN0lpV1FIcm5ML0I2?=
 =?utf-8?B?OTREZHJqWGdCL1Y3eFBsRHdxdGdYVitxbFlSNmI1U3E0V1F2ZCtCckNwM0po?=
 =?utf-8?B?blRXdmVIWTdNYzdGdFlzMzBSeSt4aTlMa3dNZm9HLzdjalM2bk1tV2VqWGZv?=
 =?utf-8?B?VDhoWG1EU3hETU42NGwyYlltZ2N5RVg4NHFMMXlqVkJVU3ZLbWtyQWRpWnF4?=
 =?utf-8?B?UnA2YktPdTBrV3FyZ3hUVHh4Qmlia3dDTmxOUTJzb2VsYUU1L1BQY2o0dCsr?=
 =?utf-8?B?SHpLV1BTaStVNzU4UDdSRURpTG1nQ010bG4xZGJmZmxqL1pIMWduZmVXb21k?=
 =?utf-8?B?L3JPL29ybVZsUUttcUdNdFB3dUd4TlQ1TTlGUEEwMDA3UXBnSHRnSHpON1c2?=
 =?utf-8?B?ZmR1NWpsT2piOEtjSTBCOUgzSFE1RnlMdlB0eU83NjZ1VUUwM2RpdE1uVnM2?=
 =?utf-8?B?aXhKaFJ1M2YyNThPL1ViS1QvOGRCaE9nL05YS0Z6eVdUYXdkeU1xZ0tYL0NF?=
 =?utf-8?B?c2twQ2hUZDRpWm1rakpOckRpb1ZGQTdzWDNsTnpqNndqUFVrdmtML1lPY2JR?=
 =?utf-8?B?MHFCU0t1ZUs0dkxOMms1VlJ4OEI2WkV2SStCSHV1eTVlelN4a2lUMnJWUzRj?=
 =?utf-8?B?RFUwcml0bUhWYmFnT2NnY3Y2MVBRRVdBNXp6Skt3V1Z3VXhwK1NlOERMQXRk?=
 =?utf-8?B?VkYvdWdLdEltRWxDQUVSTWNrUERzSGZuSDhjK0F5a3dOdGpxRE9UdEZKMUZj?=
 =?utf-8?B?a0xwcWhxanFOY2Joem02dTRHWGxGRXVzRUtCQ25VajlJcDQyVDlaU0RDc1NO?=
 =?utf-8?B?bkNWMSt4TjN6VUNVS2svZ3V6eEJ4UlM0VExsN1F5VDRpdjVOTGRUM0tCVDJ4?=
 =?utf-8?B?WVAxODVzUi84WlVoVjkwanpYK2dOQkMxNDR1eGRwSzkxUzZNelVWQ2RIaGd2?=
 =?utf-8?B?Uk9jQkdxVGJIYnUybnVhVlVVWkFlMnJoZGtDM1kyY3JLVnNFakExWUc3VGJW?=
 =?utf-8?Q?M0iQhiF1v13mgVUZj0lcDNU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E1E07EA508AF548BC07268CEE734B8D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edac7a5b-6173-409b-2d20-08dcb7dd0947
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 19:05:15.0859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZhIztn0YXss2l5WFNRYO/1WiNOGKndiAyGsfpcn08K0uewjQirRYe5OeL2zM1lf7TewDuUwZftJYOczkPFRZbh8mefak2G46wd9KjG/K/k7dy7oIezu3UhqaqUKLbYI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

YWxhbjogZXZlcnl0aGluZyBsb29rcyBnb29kIHRvIG1lIGV4Y2VwdCBmb3Igb25lIHVudXNlZCBm
dW5jdGlvbiBwZXIgYmVsb3cuDQpJJ2xsIGdpdmUgeW91IGEgY29uZGl0aW9uYWwtcmIgcGxlYXNl
IGVuc3VyZSByZW1vdmUgdGhhdCBvbiB0aGUgbmV4dCByZXYuDQoNClJldmlld2VkLWJ5OiBBbGFu
IFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCg0KLi4uYWxhbg0K
DQpPbiBUdWUsIDIwMjQtMDgtMDYgYXQgMDc6NTcgLTA3MDAsIFpoYW5qdW4gRG9uZyB3cm90ZToN
Cj4gQ2FwdHVyZS1ub2RlcyBnZW5lcmF0ZWQgYnkgR3VDIGFyZSBwbGFjZWQgaW4gdGhlIEd1QyBj
YXB0dXJlIHJpbmcNCj4gYnVmZmVyIHdoaWNoIGlzIGEgc3ViLXJlZ2lvbiBvZiB0aGUgbGFyZ2Vy
IEd1Yy1Mb2ctYnVmZmVyLg0KPiBBZGQgY2FwdHVyZSBvdXRwdXQgc2l6ZSBjaGVjayBiZWZvcmUg
YWxsb2NhdGluZyB0aGUgc2hhcmVkIGJ1ZmZlci4NCj4gDQo+IA0KYWxhbjpzbmlwDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19sb2cuYw0KPiBpbmRleCBhMzdlZTM0MTk0MjguLjI1MDY5NmRmOTJjYyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19sb2cuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2xvZy5jDQo+IEBAIC0xMiw2ICsxMiwxMSBAQA0KPiDCoCNp
bmNsdWRlICJ4ZV9tYXAuaCINCj4gwqAjaW5jbHVkZSAieGVfbW9kdWxlLmgiDQo+IMKgDQo+ICtz
dGF0aWMgaW5saW5lIHN0cnVjdCB4ZV9ndWMgKmxvZ190b19ndWMoc3RydWN0IHhlX2d1Y19sb2cg
KmxvZykNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGNvbnRhaW5lcl9vZihsb2csIHN0
cnVjdCB4ZV9ndWMsIGxvZyk7DQo+ICt9DQphbGFuOiAoY29uZGl0aW9uYWwtcmIpIHBsZWFzZSBy
ZW1vdmUgdGhpcyBmdW5jdGlvbiBzaW5jZSBpIGRvbnQgc2VlIGl0IGJlaW5nIHVzZWQgYW55d2hl
cmUgaW4gdGhlIGVudGlyZSBzZXJpZXMuDQoNCmFsYW46c25pcA0KDQo+IMKgI2VuZGlmDQoNCg==
