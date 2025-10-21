Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA68CCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 17:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AD510E636;
	Tue, 21 Oct 2025 17:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuV7kgFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A3710E636
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761069036; x=1792605036;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Drc4vdu5CctMytVBulGzv73wZYEUa1AbaIP9yH/oDHc=;
 b=MuV7kgFC9jSyjAWPuVvzJmBXFFFKJg3kc13eBZxQYVlUufgH9k8ppm2/
 RXhZBgLtMA4hfMir+buoIzVEElLAeA8NaCvfB4vDqeWgYOJESLrKq+pwa
 3lc2PaJzLswFp5W845VnQu5TWJHf7C+xRtinTR/bag/8pjkPrQmlaLuLO
 sV24h9qgfSFU5xjAQ/Afqq8KUudJ/u9dD9zAAQmeHmODdifYiUP/6HJsx
 QgzJa2CwmAv/NleSit1sX1hWNUIWVeQ39DtuffocMrBv/URMgGZYZvY97
 ID9Qy8n2o3lJJR4x0KL2H6nmwbFhgNl3Rt8ZTyES59QdrSHj9YY91M8/p A==;
X-CSE-ConnectionGUID: ijpK8nYERhGANpZAsOQ9hA==
X-CSE-MsgGUID: iBrTVBaDQ9y3gqAojln1mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85829024"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="85829024"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:50:35 -0700
X-CSE-ConnectionGUID: EEu++C2pThS1Tv9FrlGgNw==
X-CSE-MsgGUID: 6fokyu2ZRnSSYNvYArleNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="207324285"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 10:50:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:50:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 10:50:33 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 10:50:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4M4rLwrFAxmszGGYUXtYcC9Qih5VsKrbpm7OrsARkjxjEux30Xd+pv/rnP0oi5x7Uxpc3AIp58B9MB3Kdcszx8qQiMdaW+gr1M5nixQy+JyfNL4FZGgpIPpZXxRdMPWAUT8xVXDoS/Gbomes6WzumkjnkNHiL1ez0XYnMoZk+wfMJBOj2xiLd5Sd/MOkdxSHZfc6miYUmqyskr7mYXt0C1sStaqiyXGabdic1BZX2WsqOWojhxu3ih8KV0ZiM1TvLSrIADUpqVULO5hHWPzN7J//i7WV8zr21PK+xp1iaTWpXtA1CWYLDnC7TWRgysLxHdM2Q85emrtM4e2kOKpCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQMMxpNSGq08X+2muu0VZ8WYOwCEtDKNXJq3nMfM0JA=;
 b=LwQTH2bQaPW9Xv7thNRGf8pfL7vxRoNQUQUK2UnbKH6cqGGuQ1r90p5MWqR2kLjct7aXhaJ5C5c65eLkv9GwJBS96qU+UNlztxfgB/2CVip3bgmYrBWVItKikxGNuGmh58M17aMlARC8m0CigT3nySxCxAdv9fLv28RztaoF3hiILsDspo6fW8TPttVrKoWzvYGyaxjI5PzKCPk1X6VvQh+PZdaWweC51eaU8/9ItXIUuyxT60oV8eZNAgHZ8hxzYTpSLf3izg7EebsbGu50HlE9FhvbreLR9mSN4npXGXLyrnI7cWN0ItY/7ykD/nzfLA/4XXu2VNCG1kO/+8ZcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ2PR11MB8469.namprd11.prod.outlook.com (2603:10b6:a03:57b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 17:50:29 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 17:50:28 +0000
Message-ID: <1b9095ab-8731-4bb1-8cdc-4efb4be3bf99@intel.com>
Date: Tue, 21 Oct 2025 13:50:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/xe/guc: Update GuC log buffer type value
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>
References: <20251009215749.378905-1-zhanjun.dong@intel.com>
 <20251009215749.378905-2-zhanjun.dong@intel.com>
 <11def395-7b94-4029-8537-2c720e886113@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <11def395-7b94-4029-8537-2c720e886113@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::9) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ2PR11MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: af267376-4f9c-4550-8875-08de10ca527f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2EyQTkwQUpZSnZ3SmVFRFlYSTU3cWR4WnlwL2hUeWhhSUlaSktBY2lackc5?=
 =?utf-8?B?eCszQ2t4V3MvZ0VaTFFIa0lXblFzZjdBNzg1dFk0UnNMM0NZTmt0RCtTV0Rj?=
 =?utf-8?B?bGN5bnhwTm83ODl0T3B5SklhMlNLTTVDK3grMGhNMW9RLzBkRldTNVB2Nmxh?=
 =?utf-8?B?bmVWTVZhUHNIck5MZEJkdTZVbmhoQnVmcmMvTlU4SWk4aEFxdGJlTTBKTEl1?=
 =?utf-8?B?Y3hLRGVveTFweDkrd2xlWlFVUkRyTWxlYlc5VmpYSDkwbm5oOTVlSi9NaFFI?=
 =?utf-8?B?cUlqMEx3U0hlS0owS0JNcWJ3alVmQWVmcG82OGgrU3E3L3F3ODNqQXFLMTU1?=
 =?utf-8?B?T0NjT2lsdUkyUm5ObUVjbHVVWWZHb3dDWXhVMUEwQUZTK3MwTy9zUkRQZlA4?=
 =?utf-8?B?amNwRlZIUG9ZZWxFTE1ONS9IbDJDQ2dib2dPQmJtZ0djMnpMRzg5cC9yZXFR?=
 =?utf-8?B?TXQwUkpLeVByYzJpR1hkQklsK1JQQkdVRElMcGJJNFBhMit1bjNhSEpYZXU1?=
 =?utf-8?B?Sk8xKyszZDZNVG96blpDYkFKK1dCbDNyb0RRVy8wRStpWmsxVDVKcWVLZENm?=
 =?utf-8?B?Nk83aXZVc21xNStKeHFqcUZKTUl2cC9MQnVKMkpqN3lxdFRNL2ZEa3hhRXQz?=
 =?utf-8?B?Q2ZyMmk1RXhCVnJ1MWR2ajNkaVJSRjhtQWI0YS9NaHo1SkI5YUlYd3JaUWRv?=
 =?utf-8?B?K21USXFnTnZzcXRhQ2RzTFQ0WTZnMCs5TjNHUThGS0RSbHRDZ2VPZzMzK3Zn?=
 =?utf-8?B?aHd2WVRMMFlkQ0JPMlBTK3NjbXg0VjdjSEdYQjA1cXU5SW83QkRWSnFMUnln?=
 =?utf-8?B?YWxwNm84TzRZQVhuR2FmMkVoakhudUdvaXR3cEJPeXNWSXNJOGxpTTdKNjZL?=
 =?utf-8?B?R20zZGZiakdjbmhQdE5FcXZnK2dGUSsvZnRJWDlrSkt3SUJTMnBLMzhibG4v?=
 =?utf-8?B?YS82dkJZSktBS3g3aUFlT0hzWUNGNnNFcEYrdkM1YXovSzR1TjFpOHcvRUc5?=
 =?utf-8?B?eXV1MU9wQWVzOGhncGUzR0RHZHhHeHdSNWlSaG9tTjk2VkpqREJteW12Uk04?=
 =?utf-8?B?MFhkZHpzdjRkbnFFSmpoMHJCT0RwYWRpMmxITWNtTUxxM1pPN2VoVkVXYlZH?=
 =?utf-8?B?T05QSTBhaDg0Q3BGdUt4UW5rbGh2SHRaTDRsVmI5enFkRWg3Qk83a2RVeDBC?=
 =?utf-8?B?VkpkM2Q5dEQ3T1JLT2c0WlN3aGF6SjIxYlZNMU5DTVQrbTBYZGVFOVUwSHFK?=
 =?utf-8?B?bWI2S0ZHSnBJVUs0ZUNTcDZ3eXlNeTl6clNHMXM5RDZZQ2kxbUdpOWd5ZnRv?=
 =?utf-8?B?QlpnZ2l5YUZVc2IvUXp6NUVGT0VJWTBXazdqVzVzR0xJc0dhOXJJTVdpNm1N?=
 =?utf-8?B?TTNCbGZ6TFZTWXFOYVZkV2I5USsyNWNNcnAvSnN1aUgyWnRrSVY1RU5SUlRV?=
 =?utf-8?B?NjFmMjljand5WE5MdW9SSzQ3NlhIaStjR3NZNHQ2MVdUTDBlTkdNOG45YzU0?=
 =?utf-8?B?V281YnNHVzlucDJvM2l3TTRhSkFXMlU0MFc4c1B0MTRJSmVlM3BpSzRqTWdD?=
 =?utf-8?B?dStHS1NJcENNYnBsNWhhTUVpS3R2OXJjTWtyT3M0MVdxUjA1QmFNcUw1bkVy?=
 =?utf-8?B?Uk9LSGlJa0Rra3dSTlJsRmFBQmNPNmdTTStlcmxDRS9STHkzMUhDYWpoMENH?=
 =?utf-8?B?NGRIRjJDM3V5VDVuOW9WTkY2SHppSmpOcDFqYzZxZWlyOVFiNXRONk9tam9O?=
 =?utf-8?B?MWZGN0dRSU5lcGsySStWS2FhSlQ1ZkxWVGdOemF0YmFNNk9UYXdzTUhSMjMv?=
 =?utf-8?B?bGhSZHQ2alZpL25JN043M1VBd1Jtc3RyM21OQmVISUtNS0RoR2RzSHMyaTdV?=
 =?utf-8?B?K0FXVytYNkF4QVUxUHZRZ1UwdXZETHIwSjJGNkxnclgxdjFZUW5WUGYydmhT?=
 =?utf-8?Q?YDc4WGellxehX1bkWmfey9lmwtX4ALfV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3hvaG5Pa3V0UCtyUmphUGZOdjk0ckVuWnZrSU5wWW1nVWR2a0ZZaDM0bjdR?=
 =?utf-8?B?SnZ6Yjlzd3NqUk1tWXlVSzc0Zi9HZjZST0ppMlQ2bW9iaEFyTU1NS0NIMjhQ?=
 =?utf-8?B?Nk9HTmVQaHRkOTFuSDluQ3ZrdHcrQzZzZlA0Y3lBa1NRanhOUXg2SWNwbjNh?=
 =?utf-8?B?Y3Mvd3FXdXJuVDM4a2JYek5QUDY0NnUvSnRJU1Bja1I1eXlMYUFXQ0IxK2NJ?=
 =?utf-8?B?ODREMUoybHlFTE9neHMxRTk2N2lrT2hOUkYyQUdIZ3RqMnBqbUw0N1hyMnR5?=
 =?utf-8?B?T3ZyTHNLL1ZEeTlINDY3aGJKTldlb1gyNEg3TXNPcURUWmt2cXB6a1hHWm1P?=
 =?utf-8?B?K1lKUmhHVnhOT1IwT1B0ZjdyN0g2Sng1WWFRcDZsb0p2S3QvR01tOHRPRkI1?=
 =?utf-8?B?WHZWZjgxZjg4NGxJT0lHbnB6dkNydmp5SG9mdWFLMnJyb21aMnlCM1o0czkz?=
 =?utf-8?B?RnIwVEFuT3Q1dlVSbUFkakJheHhoazhMa3pOTHY5VzJxOXF3Z1YrWTdoWjg1?=
 =?utf-8?B?aTgrZUJXcnprVDJJSjczYUFXVFhCRWpQQkVHeVVKUXA2U0J6NlpsSlI4SklE?=
 =?utf-8?B?VG1oVkZsdnM5cDJRME5jd3NuZXh1VS9DRjU1ZEtTNSt1b041RkxyVHpCY1ZY?=
 =?utf-8?B?RmRXci8xVkl3OWc4U3JSYXRwODFzVmRWSVR4bkpIOXFBdnBYY0RPMHpIbG9T?=
 =?utf-8?B?S05reDFHSFJtcmtWc0RVamlhTmdYRFQzOUJ3TDZ1R0ZrbURTTTd1TUgxa1J2?=
 =?utf-8?B?WERXc2NvZkpPN3UyZDhvSjNZd2RnN3F6Y1ROUTlJVW5MNktxNFpleWIyRGhQ?=
 =?utf-8?B?K0lCOVFRWVdvWHRFUkpJWWxHemlUS1Fzd3JxSmpXUldjd2xxNm8yZkVtZFcw?=
 =?utf-8?B?aGtNdE1kQVN2OWhIQkJIejBzb01kVTRGaURaOVdlam5FRFpsWnorNHVDTk8w?=
 =?utf-8?B?YmMzTkhVRjh5OGNtU2VzZmhOa2Y1ZGw4UDk5ZDcxTGs5U3RTSk1tUlhNbVp5?=
 =?utf-8?B?ZG5yTGJEMktLRUI2MFVYdTZ1TXJ1QSt1T2NHRkJ1SUExaUxnU3BqZXVJT2xN?=
 =?utf-8?B?a0tEMTJ5TkFoK3ltbG5wUUxuaUdsM29pZVZ1RGRvWmtRRHJmRXJFR0E0QnAz?=
 =?utf-8?B?eDBmaE90NGNFeEZuL0xqcmw0dEFOdGJnZkx5VXJtMm44MnoxcEQ1ajJ5bm1K?=
 =?utf-8?B?cG94ZHo1dFpVVER1bE5MREVDd2YxcXlSNU5jeUlHYnN2ZkRjTzdkUDRGRDRD?=
 =?utf-8?B?Z0thV2x0d2hLTkpady90azBDOVh2bEhkeWZPcjFnUlBpUldHU3pMdHVOK2ph?=
 =?utf-8?B?ZDVGMENSOTIzaE03eVFTdlJXTnVCNklmTzcrekM5L2g0dGphVWhGZFFxa1li?=
 =?utf-8?B?WC9BcHo3a3dtS0dsY2k0NFJIeDRZUVRxSC82WUhveHZEenowY2dzQU1PRGlY?=
 =?utf-8?B?eFdodzdYSzJaMXdTVVNOenpFTlRpYk53VWg0dWNjT2NHNjRLaEgrOVQ1RXE2?=
 =?utf-8?B?c0N4dlV1UDhSVE1TdHF3SjVNNXBnMXhjeU5Pc3hwTk9KbEFBUG8zTlRaN2dh?=
 =?utf-8?B?dlJ0WXg4OVJ0bjVlQWNvMElCTVBQQk5lRi92R1pwbmRaN1BhMWlBQjB2QVB2?=
 =?utf-8?B?VGNiQThmOEU4cXRqMUh0a1BIamxkeFIwS1BGcTRTNDJTOHRNbVBtTVN5QTlp?=
 =?utf-8?B?YXdJZWJtdGdqRm1nVC84MjM3bEVZOS9PWVdYVzZtVU1ZUituSUpNMFkyQjJE?=
 =?utf-8?B?eUoreDY4eU9peUlyMGgvcVhqcDN1Q20yakl0eDVQTWwzU2JrM1RiTTRiOGlV?=
 =?utf-8?B?UTZIYkRGT2dtc2RQZm5zTFlzUlAxLzVHYngvRWJaWDBlVFJqN2RLa2RJOVJp?=
 =?utf-8?B?VGJOUW15TjVKWWM3R0w1Q2JQc1RBazdRVEZPSnF2WDZrbmlTYU81ZUNTSlZD?=
 =?utf-8?B?aHZ0WThNaEdFWU85WE1EcHg2WEdTWDFWRmZGOXRwVTFlM1NpU3B2NUtidzBQ?=
 =?utf-8?B?Q1h6T21qeGpCaXdWNjlXamFUeU9jemszeTJyaDMvWkRkdjRYYlBrTVEvTVla?=
 =?utf-8?B?bktsajhUUkUrRXpoRjdYbFJRZG03S3JQOHZ4U1YzWEtmMmtPUGsxaVJZSDVq?=
 =?utf-8?B?ZDlJaFBWSTN4T2pFR1luSmdxN1VnTmIvY0krNHkvTC9uclhvM29YWDRIcEFG?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af267376-4f9c-4550-8875-08de10ca527f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 17:50:28.8959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPkl11/205Keappoy23F0Cxgr2Bja1djPCrFazz66jPLOkRgO0qiBmh4fk2XtTzWDIUQrrqDSmo1DPF3Vwq3Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8469
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



On 2025-10-21 1:23 p.m., Michal Wajdeczko wrote:
> 
> 
> On 10/9/2025 11:57 PM, Zhanjun Dong wrote:
>> Update GuC log buffer type value, to align with the GuC specification.
>> Update buffer offset calulation.
> 
> typo
> 
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
>>   drivers/gpu/drm/xe/xe_guc_log.c      | 13 +++++++++----
>>   2 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> index 554630b7ccd9..b1819679fa35 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -10,8 +10,8 @@
>>   
>>   /* GuC logging buffer types */
>>   enum guc_log_buffer_type {
>> -	GUC_LOG_BUFFER_CRASH_DUMP,
>>   	GUC_LOG_BUFFER_DEBUG,
>> +	GUC_LOG_BUFFER_CRASH_DUMP,
>>   	GUC_LOG_BUFFER_CAPTURE,
>>   };
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index c01ccb35dc75..b5d837efaf74 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -330,10 +330,15 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
>>   	enum guc_log_buffer_type i;
>>   	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
> 
> btw, this should be fixed SZ_4K, not a config PAGE_SIZE
Yes, to be fixed.>
>>   
>> -	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>> -		if (i == type)
>> -			break;
>> -		offset += xe_guc_get_log_buffer_size(log, i);
>> +	switch (type) {
>> +	case GUC_LOG_BUFFER_CAPTURE:
>> +		offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
> 
> ../drivers/gpu/drm/xe/xe_guc_log.c: In function ‘xe_guc_get_log_buffer_offset’:
> ../drivers/gpu/drm/xe/xe_guc_log.c:335:27: error: ‘XE_GUC_LOG_CRASH_BUFFER_SIZE’ undeclared (first use in this function)
>    335 |                 offset += XE_GUC_LOG_CRASH_BUFFER_SIZE;
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
this rename should be in next patch.

Thanks for review, will fix it in next rev.

Regards,
Zhanjun Dong>
> 
>> +		fallthrough;
>> +	case GUC_LOG_BUFFER_CRASH_DUMP:
>> +		offset += XE_GUC_LOG_EVENT_LOG_BUFFER_SIZE;
>> +		fallthrough;
>> +	case GUC_LOG_BUFFER_EVENT_LOG:
>> +		break;
>>   	}
>>   
>>   	return offset;
> 

