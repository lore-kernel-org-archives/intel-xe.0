Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC6DCF857C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 11:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B2710E1D9;
	Thu,  3 Oct 2024 11:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+vcatol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CD910E1D9
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727953508; x=1759489508;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hlKTE72RN5LyVzY+xZ/mdpaK+0jq0twFs9MOpFRXRJE=;
 b=n+vcatolrQFZ2DbABBUZQMhXWnhMQCGzJKoOfTdRcEZvRM1ViZXZWzaA
 VXjsAfTFWFvVx/2GHZs+7CNxZ+cHKxDRyz+SxOj/7xHUZ3CN0tRQQnrqC
 xo28LCTQuytU4VatBDbPzcmmSdIkbmAPJLg5YEfSVQJwZIyOB2szMkFdX
 d1zDyp38AdXiPqm9kyMDL4g4l4V9SnYEligBtAvkixOhBeXvHzWr9FzP2
 Q7dPkNiIsvXnegyOVarhoc7watzuJLIOxAAfKu3oBHxhNW5zmiM+98IFd
 KvUdILJeO7qozZ1Y+GoQYnpAp+309+y2yuyvUBDBd83/TgZq6MWtK3o+v g==;
X-CSE-ConnectionGUID: jKa6nJlRRhuWZd51syZ9eg==
X-CSE-MsgGUID: o7Z2hSlRSOOXtonNmJDClg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26650509"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="26650509"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:05:07 -0700
X-CSE-ConnectionGUID: l/pzBZHjQNmWkRJjtTmeQg==
X-CSE-MsgGUID: 7KwSYwJDRHqhMQoOFGDDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="75115022"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 04:05:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 04:05:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 04:05:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 04:05:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 04:05:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXwCuEIJqYsQSeTgUU7AYRThmk42Y7mWNFNKmYkvemFSJbAyGOrkV7gxKe+icuJHkC4QnRkzMZfp19xFJrVU6nrJ/bXwk233vZAS4gOi5p6zQJm/0Lelr89u/U/UX6WJ6HuIOFByUhdNx6DDs/dQJxmENP1zr9o6Cz+sDqMjje2EKlvPJFI3JVkzvhn3ojjRCut9/UP+6lvQNMkd+bpXG/c/TZ7Ys90VkUfP1FspLLOfcnZ8C4iFKOIgFtib9IoG4u+zDa/NL8g5KM7QPcf0Z92dEJ0HIR3xULPOEVwvXnbmXwjZOyAmkk4ajuH8ISmjDmkZVI0HV0s0On1guUSVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbAIl8T7PKsYk/j30anyKTSblvIhkg1j/AP/wn39f2Y=;
 b=CsDdIx1Y/n9JL19Z7P9rWZuDiAq6nIRFgOMTN+bwrxD5fl5AZ2Fs4vMkERyz7l5TBdNp588yH7NS0hY5Uiu/m2DpqcyDfgocOqSsOlJf0JR3EV26I9MFZJukAKuvxJyvGo+0inve8ETFELXueVCOFQip7D5EgvJm8+wiyQ8xWfina1j7tOuFD5sj/T24o9YVtsjPeWsOZuEWFAoI+tk83r4vK2AZOwbTnSwvgOwAidc+4w2zAHqFjTOcudcr9Wm8FDwMMJwByeVr8MHOBPK1jiBc5vUBX6H1jBHi3fvXGAmBPei57lnKk+weCkeZt+KYte9U/jUDi2j7NNim//4faQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 11:05:04 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 11:05:04 +0000
Date: Thu, 3 Oct 2024 13:05:01 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/5] PF: Add functions to save and restore VF
 configuration blob
Message-ID: <w7zdjqviauh2ox2xzpsg2ebqchvudzmlyji54x4p7moys7fqem@bru6lh4yj3jb>
References: <20240919171528.1451-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240919171528.1451-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 2826757d-9c5c-4e63-6e0c-08dce39b3bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajEwUXJrY3U5NmtCd0pzbzFHR3BLOERkMUVOSmdlUGw1cW1QdlBDR3RUbVp3?=
 =?utf-8?B?RXlySjV3MlQ3clJaNlo3N0JEVFdKaU80ZXZ6T2t5VFpDQU5mdHd0dWs3eUN5?=
 =?utf-8?B?K2wyWlBkWDJqd0JldUlVVjRVaTNSMjFuTUNjR050bUFXcm9wOVRBVXRCblk4?=
 =?utf-8?B?S3FzemRNS2lOK1RldFhpbytabCtYK28vbnp3NFJvNE5hL1hSVTFRbi9kcTl1?=
 =?utf-8?B?MDJPYm9sdlZNNTVxcjAvdDNRMnJrYlJJeTkxUnQ1a1ZNNVlQZjlzSHRza3Av?=
 =?utf-8?B?djQwb2dBdjZXWXVWaW5qVmJrYTRVdHJtbDk4N0xYUGVkYll4bUVrNE5jbnJ3?=
 =?utf-8?B?a2g2MjlIZWY4Z2x6SkN3d3ZxUFRvNW5Ockttd3Zoa2lrbEdLWmFldUJGYXZx?=
 =?utf-8?B?NndzYlBjZ2N3Q0lqek8xRWdVekhhRndLcUNLWGFtUitEZ0QyOUw4Smptb2lS?=
 =?utf-8?B?dzZ4Vll3K09FUlFMTTJCcTVDbzNpeWFkNlFjTzNjY2lFZWtqNElJTExLWDZy?=
 =?utf-8?B?OTJtNGhLdGRJMlBxenFQWi9BTTFTUWRTMnFzMDZ1em5kYzhSWG51bEZJN2p3?=
 =?utf-8?B?eFhWby9qcFkxRUI0SDNSSVl2SnVOZTJhTHBYWmJYckJ6NW5pYTNwS0pZd1Y1?=
 =?utf-8?B?SDliZ04rMUZ4OE9UYVZodGtkcC82c0tvZERTaUxiUHZ4YTZ6Ykh4N1FqYklB?=
 =?utf-8?B?bWVpR09QRW1JSjhtVk83NUtzakJKb1MwS092V2FOaitOazdVeklpbFFsRGhX?=
 =?utf-8?B?U0pnTnRncmZHZnlSZnBmSU00Wm9WajU0ejBkVWZBVC9OOCtzeUt5Y3hYdWcz?=
 =?utf-8?B?Z202TTFDbFlmQi9GeG1JN01DQjFMaVROTFAyWGV1SzIwQVhTMHpnKzF6TnZ5?=
 =?utf-8?B?dC9ScVQ4MmZHcmRqaDcybGdWVk4vZDFZcUZyQ0ZERTFIdkVRWkFtQ1lOQnYv?=
 =?utf-8?B?dUdVWWUwZjNXM0pCc1JNS1paWnBjalNtMktoSGl1VGF4RW5iYzdaVUxqOUs3?=
 =?utf-8?B?OXdrMXhUOHFMb2hTRk1DOHIzWWF4ZWJwc1ZpNTlQVU1qYjB1N3FBNVJ2Y1BQ?=
 =?utf-8?B?V3dSN3Vpbm5JbUc0MTE5VGt3MGxLeHdjNmJkdFpwdCtxanVOWXpVWld2Zmw4?=
 =?utf-8?B?QTdnbE1kd0p1ZXd0L2tGVGlGRXdyWmVMZTZSOERmYmZmVDluR3kxNWZFTkgr?=
 =?utf-8?B?V3ZUUm5YZWFOL1UzdkkwcXdQRmVtNFE1MkZCYmY0c0t1Y1BYQnY0K21mQndN?=
 =?utf-8?B?cWFMUDNKdStxNjdzUTViNWlwcmJySmhnbVllUnNYMzVCSnY4am14M2VZWVFh?=
 =?utf-8?B?b1FBcTFnWUpGWnFFRkJRZ0hmUUEzZzBiU29GemoyTHBWMXRJWHVTdWRkdGx3?=
 =?utf-8?B?bGNNSDU0bWV6S1VaaTBmamFrbTZBRFFya3lpRnRCVnYrU1dpQUV6MndEUlBE?=
 =?utf-8?B?dS9aRTFuZWk1WE5qRWJRK0pXQmpxVEdFVDVLTjl4dVpLcWNwNU8xblZqZUlD?=
 =?utf-8?B?U3J5ek91VkhWaGVncThzWnM2bmN6Q1Y5c3FwUVZSd2JSV2hhcm1qbmJuWkJ0?=
 =?utf-8?B?d1FoV3Mzb0RubWVyVXJLWU51T29UQmRwUmZoNStraDE2R3pUdE9PVHVWdE1x?=
 =?utf-8?B?Vm40L2p0UzJHVjgrTm5rUFJWRTFzYmZBd2lGUWhkSVJWZnRFUFYraXVIQjYx?=
 =?utf-8?B?akJFbnc3M3B5YVNPYjR6ekRncnBTT0JncGMvOHZTSVFDRUNvcnNCVlJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REo0QWRUZFZtT1FmYWs4WTlWYmZzVDhDRUFxeDNITSs0MmFGVWFWbk4yZ1Jh?=
 =?utf-8?B?ODlWUDVCMFdSUlQwK29CSUlJcFgzbW5oVDlSNjFib1ZZMXR4bXN2TS81SWNG?=
 =?utf-8?B?TGxRajBta2x5c0g1aElUb1JUZEJEUlZ1anA5M1VoOTRyMDN2d1JDL0xYZm5P?=
 =?utf-8?B?MDd0ZkdYKzJKTGx3Vng0ZjVuMy9GUis3OU5YM09FZWlIMXFrM05OWGk1L1dk?=
 =?utf-8?B?ejI3M0l4UUtpUzRrMXQxUUxOVmlyZDZYNnFLczVlYWVBaDJQL1BpTTg3UEE3?=
 =?utf-8?B?UCt5Y3JpaWVsbGlGUUxRZUhUVk8wUjBjUXVkaDJUdisrd2VGb2EyMlVLb1g3?=
 =?utf-8?B?Vm1wNThaNCtHMFRrc0pzZWZ1M0hFUjMyWXdwMEJQRVY0cS9BRTZOL1RldWY1?=
 =?utf-8?B?ZU8xYWg4a1lnWjN6a2ZMdTVGd0NqMGpMMlRmdzZyTnNsOXlvK2d2ckNDL2Fw?=
 =?utf-8?B?emNIQWp6U3JkUUIrVGE1aG8yaW1nMks1M2ZIa3RGRTdVZ1NrL0gvallzUTIx?=
 =?utf-8?B?N0tCMTAxN3U4MzJiOWFxUkozK3pYdkd5NkJBOUFvalhrclV2eUF3MDhBQXoy?=
 =?utf-8?B?dmdmZ1dRZEMvdWE3Y3dud0ErTFgvdmlDanZmWm1lLzVXVXN6MTdMUUdvWnBo?=
 =?utf-8?B?WWxSOGVFN3huYWgrV3Y5OERjZURqOGZRckZBUENaUFdPQ204S0d3RTdyMWxy?=
 =?utf-8?B?NlFmbmdqcWY4NU9LOUQzUU9JdGwxeVZkWitWOWlGdDVqSWFBNmxPUTJ5N1c2?=
 =?utf-8?B?RkVTcFR1RUFIdkhwcE1lUnRua3lPU284K3dWSWZTbU5iTDIzUUo0TzJEVW5D?=
 =?utf-8?B?d3MwS1RPdllWVjduK0NoMEYyb3h2RzUvK2xqeWY5dGJVOFF0bnBldWhqdkFs?=
 =?utf-8?B?a0hOWjJNTEFHUEpXQnFWd01QOWNLNnNBSXRtRDlaV1Vjcm0zdkJRbUhHYlFj?=
 =?utf-8?B?Y3RBY2VRM2FpOFFCQy9RckhTaTgxT1FQQmFVN0RCRENOR0JGREZxSlkrQUFu?=
 =?utf-8?B?ekZVajNnVTduZEdPd2tMZnAyejlMbXpycG1oZGkzdGpUMUlpcUkxU3pWVCs3?=
 =?utf-8?B?bXB1NVB6T3BRM3FXZXFpN0l2Tkh2U2Fobzd0dUFKU1RIVGlhQlNnbEtXdXZk?=
 =?utf-8?B?cmZieWJKa1RielRVZFZTcVg5UThVZ1VVVEJ4NzN4V3JUTytOZXcrM29nV0Fi?=
 =?utf-8?B?K0h5YlpqZjZHcS8ycWdOR0FyWCs0a3cvSi9mbHAycnZ5VUdxcjdxTHJPZDh0?=
 =?utf-8?B?Q2tMam1ISXRMem5aTTVZZmxWMmNaRmV1NGhvV1FVVFlFU09HVDduM0ZNOStR?=
 =?utf-8?B?clN1UG02Wk9UMXlsb291NkNPL0NXcm1zc2JKWDhZQnhEU1B3UURJQUR1Ky96?=
 =?utf-8?B?MlhLTDBINmUzVzZ3bVpTUkxlRG03MUJCUmF2UEdzUm5HamI5TU9lRW1XZENw?=
 =?utf-8?B?SDRMcE9PWjJ3WEEwOUJmT1I2TDh6aGl4d29taXBORHgzaFZleEFaV0w3cktQ?=
 =?utf-8?B?NjVUQ295dFdzVHJLY0xnU2NRYTc5RzEreHRDTElnWEx3UWROV0UzY1lobGVX?=
 =?utf-8?B?UDZ5S2UrN29BRU5wOVhBdm9UbjdmV0hwM2c4WXdoTCtQNmNnUDgzV1ZwYVFL?=
 =?utf-8?B?a2R3RHpuZmJPYWhJV3Bvak5HbHlKbWsrd0gwT2IzdWNDMzVZcEt3YmNEU2Nj?=
 =?utf-8?B?K2R5UUJmWGkweS95c1Z4dkdzSmlpZ3VNQ0JBR29qb1pmM3FNQThWZEhsTE9D?=
 =?utf-8?B?K1dRNnNweElOOWR2L2VxYUp3K1J4N2ZwRkxUQkYydEt0U1MwVG43Y3c0d2lP?=
 =?utf-8?B?MUVTR3Q1bk5MNm1VYXN3Q0xnbjZ0R2d5YnJpUnY2SUg5YXI4N0Vsc2NFM3Jt?=
 =?utf-8?B?b2lnOG9CanpJb1dTQmZpNU83eVRiYjMyLzBiUDgra2ZnNHl5N0xHSnY2V3BZ?=
 =?utf-8?B?UFBsdWVsZGF6SGJLS015dXk5dkg3RkFBVXdLMjdJMG1vcGFLbzZxLzNTS1BI?=
 =?utf-8?B?aSthNDFTTEZaeVZTMDRQTDA0SjYyRTh0VjBIWURjc0pDaWEyUmZqWStkM1hE?=
 =?utf-8?B?NnhrdmtWNlJvVTBmczFWZGd4K0UzRW1YTWZ5WkphSTB2RzNzYjlVNjR3WUgx?=
 =?utf-8?B?Wjdyekk1bmZURVUyMVZZVzFCUDF4Rld6dFd0TnkxdDNVYTVVK1ZLSE0yL1FH?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2826757d-9c5c-4e63-6e0c-08dce39b3bd9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:05:04.5353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pN8lrP7IQ9nV2h1kjc6/xr+/GZaM6ynrx/LU1tnJzz53RdoLVQiYRfMtgyuEUNR6/anH2CEk7a7sgmVsS9Eia3AJiyq4wPxGKDnD3nqbr3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8450
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

On Thu, Sep 19, 2024 at 07:15:23PM GMT, Michal Wajdeczko wrote:
> We already have support to save and restore GuC VF state, but that
> will only work when the target VF configuration (provisioning) will
> be exactly the same as the source VF configuration. To help with
> assuring that both configurations match, allow to encode whole VF
> configuration that can be saved as blob and restored later.
> 
> In the future we may want to use such captured configuration blobs
> as templates to make sure we provision VFs with exactly the same
> configuration that was previously tested or recommended, or when
> debugfs knobs are not be available.

If we end up using this for that purpose - we will need to turn the
ordering of fields in the blob into an ABI (or at least version it).

For the series:
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

> 
> Michal Wajdeczko (5):
>   drm/xe/guc: Add yet another helper macro for threshold
>   drm/xe/pf: Update success code of pf_validate_vf_config()
>   drm/xe/pf: Allow to encode subset of VF configuration KLVs
>   drm/xe/pf: Add functions to save and restore VF configuration blob
>   drm/xe/pf: Allow to save and restore VF config blob from debugfs
> 
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 204 ++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   4 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  78 +++++++
>  .../gpu/drm/xe/xe_guc_klv_thresholds_set.h    |   7 +
>  4 files changed, 279 insertions(+), 14 deletions(-)
> 
> -- 
> 2.43.0
> 
