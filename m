Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E92BCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4DF10E0A2;
	Mon, 13 Oct 2025 17:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CmqETXjg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8445210E0A2
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760375883; x=1791911883;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SjBg4kOiaIx2wC4yejptKSTL2HghSX+bNnGJLtgSLJc=;
 b=CmqETXjgvGYlRx17JtDUTSoQP4eJTwgR5SlYf6zytgIPJn4WQZeGiSGG
 gh1c1j6+ugPEIZBabrWlpX8P+93AIVg5Dw5ThO4nGeEpCjYFAsKrUOzgz
 4i1QmRsv2FlndRJuRQJqnaKXVICVE/5QGh4Q1zlIucJl1FztQuVE++Lab
 c5GtBCsu9uxS1QgXX2IB2r8XSeJd8xQw27jAoGRU0NbeJuz/Z8Qx4hSfM
 tcUPHvORaRe7dTOrEbMUyk6+Gf/8dI12M0iwCoG/DSzrfpw9znqvg7sjv
 4tGhg6OguvuQsXxZo2mPfq46qCNnHWaHziC2TP94z8+WJds2QLajr3StA w==;
X-CSE-ConnectionGUID: 4d1gBgUHSfyqUwN8PZgSgw==
X-CSE-MsgGUID: 6IiOE8ndSt2oSHNQRRW8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66345763"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66345763"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:18:02 -0700
X-CSE-ConnectionGUID: OthuBtKyR+q9R6j9AOUGMw==
X-CSE-MsgGUID: j/JBCKqEQDGaNvaOpGnMUg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:18:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:18:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:18:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5d4+ooEgj8y38c1eZkq2G7IjxrL3+4RgvhU00V2CgAQo3ZQjU6herSYcbTTfcktc6gTDPjuqthCObIC5gI5V1uR8zaEBaGCPB3FH3lH/As36qW0/K6N7IdKmN7YD1pGGVWI+cIph4xNpCHR7tWbmvXamwE/u7ckhZ7i3NvYJa1DBVoGAo42Uob8etL5CFoiZYnLWV2FhrVKHqTDbZhXkcLUGV5k3TpLANOPfTVJXmmlLWy9jOvblBFebejV+aNlSyR8h25eZI5gQVhSJDSBBwt0L+s0KVRaJeC5psH8bsr/z2xWP7HMmW+9yhGniOsoNq7PZc+5lR5Gv1QtIxgTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjBg4kOiaIx2wC4yejptKSTL2HghSX+bNnGJLtgSLJc=;
 b=SuFbhOlRm+RIfjJ0qt4QWhr1+6ETgEb6Tjx5gI/wPEAFj71ZwOLb+5+dDUMA+iMy32bhOypVPkpICN6OYXgz23zWExv1mT72O+kUwC9Bi00POjEIODHMgWQ64qcCZ8xD6JYMrRLF8101lB3/vJOtgz7i33cbaEZtvXcQ10OOie7/UjQGrhNVc9hWd0GXN2Q+rd0fn64sqkyCY4thgYLF1a+foHmYZooJDw6wgU54Yog9rm0bsx9e6vWvTtgDArRctxY6B96XwgtLrOVstYBnBtPa0oljy/zUwnrxzSglSoPRaSxwOHLZ3S5BI/5oFwXXXc8uBn90H31281FZJYNcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA1PR11MB8325.namprd11.prod.outlook.com (2603:10b6:806:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 17:17:58 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:17:58 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Thread-Topic: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Thread-Index: AQHcPF371ZmVGh4OnE+kD6NCwCmWbbTAS/GAgAAF9YA=
Date: Mon, 13 Oct 2025 17:17:58 +0000
Message-ID: <69295444f047934f6f8a711b939bf1306dce0416.camel@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
 <20251013162504.7768-7-stuart.summers@intel.com>
 <aO0vRcrh+vYm8JbN@lstrano-desk.jf.intel.com>
In-Reply-To: <aO0vRcrh+vYm8JbN@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA1PR11MB8325:EE_
x-ms-office365-filtering-correlation-id: e74a1fa0-8935-4998-148a-08de0a7c74f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TTRWRTZ1RnFGR3dwMi9WRnZYcmIzYldoeGoyUHhMVng5dDlWUGY5VE0vTE1R?=
 =?utf-8?B?RGtLR3hnV1VjeUQ5S2xKVGxveHRtcndHYk5CVmwvQWZHTFVpZGdkQ25DVmw5?=
 =?utf-8?B?Y21uOTJIRmtLRlMwMHBoamtNWUplQlBEVHdMU0Q0QUN0MGUxYUpvOGp0dGtN?=
 =?utf-8?B?dVJWeEQ2dzBTUEdJdEhtdWdPT3VVQTNQM2xWcEFrZkI2SGk4UC9wQi9LM256?=
 =?utf-8?B?LzRzTWxTeGxrTXRuTTVpNlVYdzdVT0NGRWtpa0I0MmoyMTNFc1RyNWVEbENP?=
 =?utf-8?B?SUlOOWZMWHkyckdpcEZXbjE1WE43WHRKcFlmci9aL2N1Qzc5VzB5MUpJSGUr?=
 =?utf-8?B?THZkR1pjbmFPL0R5cnEvejBlSWNWdWwwc1FaUlV3MTFFSTh0LzVBRkwxS0Fw?=
 =?utf-8?B?OVpEQk03dENnR1FVWVVtVXNzajFwYnRpR243eHBoeDc1TXN3TWl6Tkpsb1hM?=
 =?utf-8?B?Vkh0RC9TVUthbm5XRHZDU05WSERWWFRlaVhSTlhDVG95NlRxNUh1SmtNRDRq?=
 =?utf-8?B?TE5QbEFWWUdFdEZJQ3RnOWludW02QzEzbTVFbEYyU3NaZ3RvSG1sVWtURHdw?=
 =?utf-8?B?MDhDejY5RjZYemY1UFNpWHhDckdpMG51cXNZTmNWbGNGME05V2pEaks2Z0FG?=
 =?utf-8?B?Y2MrT2RsWnU4aXZHTFM0TmNiK1lVZWhHU2p2VFE3YXM4cVN1MWhpS1VtNjlT?=
 =?utf-8?B?eWJhQ2w3N2h0MTUwZyszaUIzd2tYUVIxaDB0WHVoOUx3U0ZPTDM1Y1ZKd2tn?=
 =?utf-8?B?cUtMdXo3UnBsUFo1UUxHL3plb2xPQ1ZsMUwyazVrNTZITS9ETVJ0bzZ4bFkv?=
 =?utf-8?B?LzIyeFI0VSswcmNpVDRmNDZiMHQxZjJhNE42cXdXQXhiazlXUlFNZk93ZHVt?=
 =?utf-8?B?OXVnUXFxZTF5SEgyYjV1TFdKTi9QZjR3cjBCNUMvaTBZS2pETkZteGlJWkRY?=
 =?utf-8?B?MC9zV0ZIRWVNc0VZeFdSNG9nQUJhcTBYR0Qwc0dncVRYUVF3SEhrVDZYaTBu?=
 =?utf-8?B?VG5qcVNjbFJHSFQ4K0c3QmFMbkd5c3JUbm4wMS8zNTUyclV6SGJwS3kybm1H?=
 =?utf-8?B?cm0ycmRmajRQa3E4dEM5ditXR3l0UUdCR2RVeWw1ck5DOGtBQnVwS3dBZDlV?=
 =?utf-8?B?WnR4R3NoMlFjTG45S0dkcWNHc292K1pnNHdveHUzeWZaU2RNL01ySGdFbjF3?=
 =?utf-8?B?RUxYdytNSHdjUmNSZHo4Ync4dU85ZGpvVkJBVzVRTFhTOVViMEl1YlVWZkox?=
 =?utf-8?B?KzFERjVwbUhvMjEzSlRZekIwcGlTTFcwQS9rSk9uK0dqMFZsRmQ1SURiREV0?=
 =?utf-8?B?SVBmTU1kckh6eEdmRjRaVTc2MlAxT0o1MjdmU0E2ZGxlbFBYK1dwUnlGN094?=
 =?utf-8?B?TlFkdnU0ZGc1WXFwL3Zrb0xIdmc0ajhjYlorenFtNmJSRlFVY3NDaVdXRnE4?=
 =?utf-8?B?MGVsWklmYmcxRG0wamg4aTJzOGRwVG94NFhsWHhKS1lZRHVnekYwTWpteWJw?=
 =?utf-8?B?YUhVSEg0YWZVNUJEbk83WU9SNjd2amo4eHlEUWF2QWg2dEFtYjdobjhuVzM5?=
 =?utf-8?B?VDZLSmpKOHN0MllrWnVRKysrZ0gwQnFoZUFhNTFnSlBNNlEzaHdnVWRldWF1?=
 =?utf-8?B?dUVKUmZHNWRMaDBZUWZOMWcxQ3kyczdLNXFHSW0xNk1UY0ZwQW5pRHhVSHpI?=
 =?utf-8?B?eWpYNlhONHlOY3c4Rkg3dFZtY2VHL0pjNnpjMWVqNnR1YTJuM1NNdkpOV3pU?=
 =?utf-8?B?ek1PY3paN2Y5Qm9wNk56bVMrelM0eDczWno1MSt0UDFrbVBoTjN0aWN6dm90?=
 =?utf-8?B?YXQyQXpuZ1MxbE9iTzkrQisva0xCWGNsSklwVVFkOUV1S2d6Z09uTGhvck14?=
 =?utf-8?B?MWlPWGlHLzI5dmdETkYvd1M1bTh5V3QzMjZlTW9EU3Uwa3dXSlFING9tb0Rm?=
 =?utf-8?B?cjFqZWIwTjhWMVdiN2dBOFhTVElsRlQ4a3hzS3ArekJHSjI0TzRNRk5LczBu?=
 =?utf-8?B?Smwwcy8yN1R3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWw3RjRCblZ3d2R5OWpkN3l2YVhwR3ZDRi9tZE1aTDhadHZxZEtEaXhERmxy?=
 =?utf-8?B?Q1VpREpJZTFrZmdxTndBQjBhWkJ6Vml2MUVQemRyTnJUQ3NGOC9hMFFlZXZI?=
 =?utf-8?B?Rm5haVlxM0J6TWk5UldwU0I4M1QwR1ljQktTV2QxYU5GWkVoM0pUQ1VBWlZk?=
 =?utf-8?B?OTVYWTAyY1pBQ1daRDVMQ21oZWJXcURqY09YajNuZ0xOR2k4ZWtIOCtJQVhF?=
 =?utf-8?B?M21qSkY3ank1Qy9jRUFBZHB2ZUV3VWltRkVEQis3Q2RmUnFldDVWY2ZlK2Q5?=
 =?utf-8?B?SjZaOVdGV0dEam1BTGZySitCTVhRVUxqcEVUaFZ1cUwwNmErdHNPQTNqYjZi?=
 =?utf-8?B?MXJOcWg5M2tGT0NlMGQxc1o1UTJORmhFN0Q3RjRLQWpFMkFPc2VhQnpNZEtT?=
 =?utf-8?B?NXdwUkNWa1l1NkVNTFp3c1l2ZkVYSFNpK2RKRlhCYkpwa3h5bmpUcUZSek5k?=
 =?utf-8?B?K0JyTXN6ei96SU15MVl6ZE80WkpDbFZPR2VZZHFXSmFkS3RKYVRjejE3Tngr?=
 =?utf-8?B?VnhrdGJuS2pla3FSVm9EMWNuRXI5ZkZncytqeEJQK3lhUkhUczl6c043bzJq?=
 =?utf-8?B?Wjd6NnB5RmRnSG5yRytUQ1BGMDNzVld5R3Y2K2FQeXJ4SllyQzhTNE5xKzkx?=
 =?utf-8?B?VDQ1aDJoN2cxcHZQS0dWSGJKTkRaUWNFRVgzNkR5NmhpMzFydzhRZ2VnSlhi?=
 =?utf-8?B?MTArd0grUFZIWElibTJvMVQ5Q2dIaFZPdWYyZXdmSWhKRzFCN2VWYkdCQVV4?=
 =?utf-8?B?eGE1UHRaS1dnWjJDSGVodkM1VlVCWEtLZmhVZ0xZaUgvREwvVWFteGpKTkc0?=
 =?utf-8?B?TmtoV0RDdEJETG5NQkRRV3pINnV1VGNQZjNJUVF4dTNvaThLZ1pyeDFjV1JK?=
 =?utf-8?B?eWxBNitlaVJzcHhEZ2tFT01SMnFvQ1grQ2dEelBJZTU4U1Myd3pTYmhZemp1?=
 =?utf-8?B?UU9CNFRZQ1VCYUl4bDlHVUpwTWJZSnJzd3dDYkNqUERFa1ByOTJtVU9KVE1I?=
 =?utf-8?B?dmZJTVQ1UUZMaWxnVjM1OFRNL2dBTCtHckxzakNqbllHdTg3Qks1a1NFTXZS?=
 =?utf-8?B?RmVHTHcxUDVKZjBMY0lTcWhyRGkxdlo4TG5pZDd3WHdYMDJFaGlML0E4Y3g2?=
 =?utf-8?B?ZVNxTWY5bzFEb05KMVlycUl6SnRLWnFRZFR4RWhYY1g0WExZTGJic3hCdDNB?=
 =?utf-8?B?Vk9NZ3RrLzRZOWlPQjdTK21OZVB2RHJLK0FsOXE5KzBTN2FudGRVTy9MSmJN?=
 =?utf-8?B?NzdNUjBlN2RnUmZaaDJGVjhYR1kySHhQWGdnNmZNQnVOdFRGdXdRaHZFQ3hF?=
 =?utf-8?B?V1ZWREx5MjlrVUl0cVRpUFMxQUdvWnhod2FOTkZXRzdTeWE4a0NuR2NhT3lz?=
 =?utf-8?B?QlFrYWFkR0ZUNGtRbTVidmNNbFovMzJZUlZIblg4NTJJcGtDb21FYUFpcHh6?=
 =?utf-8?B?ak55Rjg2YXJlcWlQVXgySmdKaTRRMnEvcjkwZ0VvTDBBRlgvRERZK1R1aWNw?=
 =?utf-8?B?bUk0aEQwQWpWbCtOaWMvSHFQM3d2OGQxendLTDY0S1NWbVQwazgrYTE2M0cz?=
 =?utf-8?B?VW9jSzBEYjZSdm1iYXVSRWlqYnhkV3MzekxpcE1LcGpScW0wT3lzYnFOMCtD?=
 =?utf-8?B?WFFQdThRMkNvNm42ajVwN3dSR2pWYW1CODFxTEJWWThYSDB2NFNPdEVyNzh4?=
 =?utf-8?B?M0JwRG1hTTZZenk3RVMwNnRGQTVDWG9DYjNvblNXSzJLbTR5M1JDOUZNSUEz?=
 =?utf-8?B?SW82Z2VHenhuUjBmNnY4NUVJVFBwZTJBc081NjFua1RQM0dGc3o0VHBFNE9P?=
 =?utf-8?B?bzNzaG5yVm0vUHdTR1dTL3VtV3dpWlQrWFJFbDViZ0ZrM2FhRDR4dzRodTht?=
 =?utf-8?B?a0kzcUZBYWh4OEl0SkxBK2hCUU9VZ09ZNVlpK2lHeDdSaXMvS3dtUHlqVjll?=
 =?utf-8?B?YVVrbkFBNWw1SDNoKzg2N0NJUzV2VHJ0U1QxQnpBNzgyeENnVUhLaWdXUity?=
 =?utf-8?B?QUtNdTFDTHdnV1orR2VqUy9ZaTVPZmNDZzg1b1RJOE9YVEcvWXpTMHdMYzFN?=
 =?utf-8?B?T29OZzlsdGxNQ3R2UTZEanE5dldsN0ZCMWpVc2J0TGkrekF0eUxicjdqK3Rq?=
 =?utf-8?B?V0p5S2hRZEFleUxRZE5XeWtMbzFlbWZtV3RwcG1TcTRlMHdRV1FhcGJZajdO?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F9BF8324BB4704791E980A141545556@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74a1fa0-8935-4998-148a-08de0a7c74f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 17:17:58.7478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1P3dzcnk2UMFSR4lrQO6Y2o8lSz5RaxICq/75WwDNES+OPoDR4DXT2wCHJYLaSTKbrNHgKG1jIWmMXJZVoXZrSzkqgj4oRT6SvBFd/bLRE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8325
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDA5OjU2IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAwNDoyNTowM1BNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBSaWdodCBub3cgd2UgYXJlIHVzaW5nIHRoZSBzdGF0ZSBvZiB0aGUgR1BV
IHNjaGVkdWxlcg0KPiA+IHRvIGRldGVybWluZSB3aGV0aGVyIHdlIHNlbmQgYW5kIHJlY2VpdmUg
bWVzc2FnZXMuIFRoZXJlDQo+ID4gYXJlIHNvbWUgc3RhdGVzLCBob3dldmVyLCB3aGVyZSB3ZSBt
aWdodCBpbnRlbnRpb25hbGx5DQo+ID4gcGF1c2UgdGhlIHNjaGVkdWxlciwgbGlrZSBhIGRldmlj
ZSB3ZWRnZSwgYW5kIGV4cGVjdCB0aGF0DQo+ID4gbWVzc2FnZXMgYXJlIHJlc3VtZWQgbGF0ZXIg
b25jZSB0aGUgdXNlciBoYXMgdGFrZW4gdGhlDQo+ID4gaGFyZHdhcmUgc3RhdGUgYW5kIGlzIGF0
dGVtcHRpbmcgdG8gcmVzZXQsIGxpa2UgYW4gdW5iaW5kLg0KPiA+IA0KPiA+IFJlbW92ZSB0aGVz
ZSBjaGVja3MgaW4gdGhlIFhlS01EIGFuZCBsZXQgdGhlIEdQVSBzY2hlZHVsZXINCj4gPiBoYW5k
bGUgc3RhdGUgY2hlY2tzIGludGVybmFsbHkuDQo+ID4gDQo+IA0KPiBXZSBjYW4ndCBkbyB0aGlz
LiBUaGUgZW50aXJlIHF1ZXVlIHN0b3AgLyBzdGFydGluZyBtZWNoYW5pc20gcmVsaWVzDQo+IG9u
DQo+IGdldHRpbmcgZXhjbHVzaXZlIGFjY2VzcyB0byB0aGUgcXVldWUgYnkgZW5zdXJpbmcgdGhl
IHNjaGVkdWxlciBpcw0KPiBmdWxseQ0KPiBzdG9wcGVkIC0gdGhpcyBpbmNsdWRlcyBtZXNzYWdl
cy4gVGhpcyB3aWxsIGJyZWFrIGpvYiB0aW1lb3V0cywgR1QNCj4gcmVzZXQNCj4gZmxvd3MsIGFu
ZCBWRiBtaWdyYXRpb24uDQoNCkknbSBub3Qgc3VyZSBJIGZ1bGwgdW5kZXJzdGFuZCBoZXJlLiBU
aGUgc2NoZWR1bGVyIHNob3VsZCBiZSBzdG9wcGVkIGFzDQppdCB3YXMgYmVmb3JlLCBpdCBqdXN0
IG1lYW5zIHdlIGtlZXAgc2VuZGluZyBtZXNzYWdlcyByaWdodD8gSSBjYW4gdGVzdA0KdGhlIGpv
YiB0aW1lb3V0IHBpZWNlIHRvIG1ha2Ugc3VyZS4uLg0KDQpCYXNpY2FsbHkgSSdtIGFyZ3Vpbmcg
dGhlIHN0YXJ0L3N0b3AgbWVjaGFuaWNzIHNob3VsZCBiZSBpbnNpZGUgdGhlDQpzY2hlZHVsZXIg
YW5kIG5vdCBpbiB0aGUgY2FsbGluZyBkcml2ZXIuDQoNCj4gDQo+IFdoYXQgZXhhY3RseSBpcyB0
aGUgcHJvYmxlbSB5b3UgYXJlIHRyeWluZyB0byBzb2x2ZT8gVGhlIGRldmljZSBpcw0KPiB3ZWRn
ZWQgYW5kIHF1ZXVlcyBhcmUgc3RvcHBlZCwgdGhlbiBhbiB1bmJpbmQgb2NjdXJzPyBUaGF0IGlz
DQo+IHByb2JhYmx5IGENCj4gYnVnLiBJSVJDIGV2ZW4gd2VkZ2luZyBhIGRldmljZSAvIHRlYXJp
bmcgZG93biBhIHF1ZXVlIHdlIHNob3VsZA0KPiBhbHdheXMNCj4gc3RhcnQgdGhlIHF1ZXVlIGFn
YWluLiBXZSBjb3VsZCBhc3NlcnQgaW4gZ3VjX3N1Ym1pdF93ZWRnZWRfZmluaSB0aGF0DQoNCkkg
dGhpbmsgdGhlcmUncyBiYXNpY2FsbHkgYSByYWNlIGJldHdlZW4gc2VuZGluZyB0aGUgY2xlYW51
cCBtZXNzYWdlDQphbmQgc3RvcHBpbmcgdGhlIHNjaGVkdWxlci4gQW5kIG9uY2Ugd2Ugc2VuZCB0
aGF0IG1lc3NhZ2UsIHdlIGRvbid0DQpyZWFsbHkgdHJhY2sgaXQgb24gdGhlIHhlIHNpZGUuIFNv
IGlmIHdlIGFydGlmaWNpYWxseSBwYXVzZSB0aGluZ3Mgb24NCnRoZSB4ZSBzaWRlIChieSBhZGRp
bmcgdGhlIGNoZWNrcyBJJ20gcmVtb3ZpbmcgaW4gdGhpcyBwYXRjaCksIHdlIGNhbg0KZ2V0IGlu
dG8gYSBzY2VuYXJpbyB3aGVyZSB0aGUgY2xlYW51cCBtZXNzYWdlIGlzIHNlbnQgKmFmdGVyKiB0
aGUNCnNjaGVkdWxlciBpcyBwYXVzZWQgYW5kIHRodXMgdGhhdCBjbGVhbnVwIG1lc3NhZ2UgZ2V0
cyBkcm9wcGVkLCBhbmQgd2UNCm5ldmVyIGlzc3VlIHRoZSBkZXJlZ2lzdHJhdGlvbiBmb3IgdGhh
dCBwYXJ0aWN1bGFyIGV4ZWMgcXVldWUuDQoNClRoYW5rcywNClN0dWFydA0KDQo+IGFsbCBxdWV1
ZXMgYXJlIG5vdCBwYXVzZWQuDQo+IA0KPiBBbHNvIGlmIHlvdSBoYXZpbmcgaXNzdWVzIG9uIHVu
YmluZCAtIHRoZXJlIGlzIHRoaXMgcGF0Y2ggWzFdIHdoaWNoDQo+IGZpeGVzIGFuIGlzc3VlIHRv
by4gSSdtIGdvaW5nIHRvIG1lcmdlIFsxXSBub3cuDQo+IA0KPiBNYXR0DQo+IA0KPiBbMV0gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTU0MTcvDQo+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3B1X3NjaGVkdWxlci5jIHwgNiAr
LS0tLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMo
LSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dwdV9zY2hl
ZHVsZXIuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dwdV9zY2hlZHVsZXIuYw0KPiA+
IGluZGV4IGY5MWUwNmQwMzUxMS4uZDlkNmZiNjQxMTg4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ncHVfc2NoZWR1bGVyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3B1X3NjaGVkdWxlci5jDQo+ID4gQEAgLTcsOCArNyw3IEBADQo+ID4gwqANCj4g
PiDCoHN0YXRpYyB2b2lkIHhlX3NjaGVkX3Byb2Nlc3NfbXNnX3F1ZXVlKHN0cnVjdCB4ZV9ncHVf
c2NoZWR1bGVyDQo+ID4gKnNjaGVkKQ0KPiA+IMKgew0KPiA+IC3CoMKgwqDCoMKgwqDCoGlmICgh
UkVBRF9PTkNFKHNjaGVkLT5iYXNlLnBhdXNlX3N1Ym1pdCkpDQo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHF1ZXVlX3dvcmsoc2NoZWQtPmJhc2Uuc3VibWl0X3dxLCAmc2NoZWQt
DQo+ID4gPndvcmtfcHJvY2Vzc19tc2cpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoHF1ZXVlX3dvcmso
c2NoZWQtPmJhc2Uuc3VibWl0X3dxLCAmc2NoZWQtDQo+ID4gPndvcmtfcHJvY2Vzc19tc2cpOw0K
PiA+IMKgfQ0KPiA+IMKgDQo+ID4gwqBzdGF0aWMgdm9pZCB4ZV9zY2hlZF9wcm9jZXNzX21zZ19x
dWV1ZV9pZl9yZWFkeShzdHJ1Y3QNCj4gPiB4ZV9ncHVfc2NoZWR1bGVyICpzY2hlZCkNCj4gPiBA
QCAtNDMsOSArNDIsNiBAQCBzdGF0aWMgdm9pZCB4ZV9zY2hlZF9wcm9jZXNzX21zZ193b3JrKHN0
cnVjdA0KPiA+IHdvcmtfc3RydWN0ICp3KQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgY29udGFpbmVyX29mKHcsIHN0cnVjdCB4ZV9ncHVfc2NoZWR1bGVyLA0KPiA+IHdvcmtf
cHJvY2Vzc19tc2cpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfc2NoZWRfbXNnICpt
c2c7DQo+ID4gwqANCj4gPiAtwqDCoMKgwqDCoMKgwqBpZiAoUkVBRF9PTkNFKHNjaGVkLT5iYXNl
LnBhdXNlX3N1Ym1pdCkpDQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVy
bjsNCj4gPiAtDQo+ID4gwqDCoMKgwqDCoMKgwqDCoG1zZyA9IHhlX3NjaGVkX2dldF9tc2coc2No
ZWQpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAobXNnKSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBzY2hlZC0+b3BzLT5wcm9jZXNzX21zZyhtc2cpOw0KPiA+IC0tIA0K
PiA+IDIuMzQuMQ0KPiA+IA0KDQo=
