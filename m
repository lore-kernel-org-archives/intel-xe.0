Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE330C369D5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 01:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9EC10E037;
	Tue, 29 Apr 2025 01:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PboCwKbz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1C10E037
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 01:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745888527; x=1777424527;
 h=date:from:to:subject:message-id:mime-version;
 bh=G8gtPIN6kn1uZdZD3L7deYajOGolH2AbOc7291fEaBY=;
 b=PboCwKbzK6FxmeyfKS8salsTG4nS/VgyyGuduLGcJGPi8ZcO/nmT+QhY
 iOnNkooBWpjMQ1RkbZrdQXFEfKXslBQHhN+SWIbxSRy7P/Vr03WbU1alM
 9VMHa/6bFwNC4AjclDWiZfr1pRD2QeVh6xdCKJPpIRYrb1pz7uYtgve3R
 C4BErFubzxcFFuuWaVp1A49rVoYRHemkrIgUSRm3l1muYJyAAH1xt6DkQ
 xHvFp95Wst4svOLtDFRpn+TvdJoGEqUdCII3l4HX01rL2EbYWg7Mnhg/I
 wg1h6IkKNibsBVgz/SoyPbcQsCMqNGTDcQU1mA0Lqk9g1pFqdPOM9toP9 w==;
X-CSE-ConnectionGUID: h7bC8Gf8QkOONiGlshr1Bg==
X-CSE-MsgGUID: ajHeoVHaQ0igYmpEtEjxcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51311899"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="51311899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 18:02:02 -0700
X-CSE-ConnectionGUID: iRxvBhIzRlSQOgDhIAgz4g==
X-CSE-MsgGUID: 4o25Wt0iSn+hD5Zlb+G2yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; d="scan'208";a="164631773"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 18:02:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 18:02:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 28 Apr 2025 18:02:00 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 28 Apr 2025 18:02:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7xVpwYkuJdNpebF4WbVEFr1onxPCV/r1TYYQbUvOnTBexDeOS8PqUxfYHxX5kXWhjLgDYES06ZIFV+uf56TzmWOiQarolwFlIREs7hre+tbiBhbTXsKjbqZt9uoJ5p3con9grzzA7pAHGElIv+1KNXOZudp8IfQfTVo+rojhdFeVnqZJzWKP9s72mPx508hYXhjjI5tAFwXTA8Xu4YTT50KgudOhx+q8ys+aMc/iOahgsFhA88e+OONldWO0F0DVev5/L11QvZkd0ObAtUp5uGbYu9XmJ372n18UsXTWQuGTeoo+lAlxYdKwRF4vFjwhBKGlRcfAUs/izKBD/Wz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb7XjhusLmLFU1fBQp/cq8pQje82BGEERSh8k45BOYU=;
 b=uPiB06+qGu5irLFdP9b48jma+fRXvZpKO5lhm/li92LiE1HlP2D7Y91qAPWGzp8X0ghgqAgijIpiZusBqehOPWHk5WWlyEDodr3A4GHXeuCexLMOeQRcy4RvxUZHdcFmmrff4cBooejI95ED575jZdBhS2GxrQmlE7voHlAdKaSauRsB7e4lCx4eaNUgiIQsffSMUP1xmoWHehcRzC/Q1fQATqumlePb7c3ZGwvtbBoDY0EBIJA9+Ikv6o7j+JTgg/6Dg5OV9x22K22V498S61oFd6eoDEdnkVlh9xz6ErCjHfHQ8PBpU4/BAOnEiMMM7O9noj5cYEFLnnFlAYd7Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4912.namprd11.prod.outlook.com (2603:10b6:a03:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 01:01:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8678.025; Tue, 29 Apr 2025
 01:01:56 +0000
Date: Mon, 28 Apr 2025 18:01:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 <matthew.brost@intel.com>
Subject: Fw: Re: [PATCH v2 3/3] drm/xe: Add WA BB to capture active context
 utilization
Message-ID: <aBAlAnLxLXBK4dwx@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW2PR16CA0043.namprd16.prod.outlook.com
 (2603:10b6:907:1::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: 2592b28a-10d5-473f-e758-08dd86b96fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3Y4WDgrdHZFVWU2Z09aci9mMUFxYVlkWFZIbVB6MGRUcEVrSTNTczRVUzdm?=
 =?utf-8?B?Qllic3ovdkx1WGRGQXQ0Z21PKy83WWxjZ3kvTU5wdUphVk5Dd3dNVGpyS1Uv?=
 =?utf-8?B?OFpJdUZiSit2T01BZGdZcmJhUDZOMWhIUlR3VHQyekovOE1rL0FSUncrcnpT?=
 =?utf-8?B?NldRVWhFR3A1REdSQkV4MC9lc0RVMmFNVGhyMnBNZEJuNHIyRHc4N1hTZGMz?=
 =?utf-8?B?MUc5UTlaMWs2Q1Q0NTJtNHB5QjQ3MzlUeXJIalk3VlNTRk9ndlBvSERSc3Bl?=
 =?utf-8?B?M2RQUFZLTVBHRFh3cCtoQWVRYVRHRHBKT2R6aFBiZnhld2M5UFdaZEdUWUtM?=
 =?utf-8?B?Uk1kRFBlcW1EVy9lWUZ6ZDFMbElWaDVISUtIem90QmZOc2tnNERjMUhob2dk?=
 =?utf-8?B?c29Od2dQekU4WDNkM3hGeWp4SzdKZHVicTBDbWZjUmNIWWlPZ1BpdXZXbmd0?=
 =?utf-8?B?UmY1U2pQRlhNTTZDdUtmRUErejloQjNXZHZjeENOeHBKa252a0dac0xINDBO?=
 =?utf-8?B?YVJTTWJjR2dSOGJtY1dWMVNpOE1lK1dWYzIvUjQ1Q040NmRwVFQ4c01iTXZJ?=
 =?utf-8?B?QW5HaWtjczIzNnhlczlxS0RMcDF5MmtVbTlZQW1aK2xrYnkzNitHakNNT3A3?=
 =?utf-8?B?bGZvTTN5NWVGREYvMGs0ZkdxbmdveE54KzdKeFpVUVkzd0svcm9kYnJiWHVU?=
 =?utf-8?B?cWlub2pTK1BCVHhjSkEweDA0UmhxZ2RiUi9aZFRrVUJ1Um5nbHdzNkJSYVBw?=
 =?utf-8?B?Z3NaUkptd0JPZ091d1lHRFFXYlp5MXcvRU5yZVZuQWEvaXplZHB6U1ZlOUlM?=
 =?utf-8?B?Mm9hc3NueVpIZHRyamN2Rkt1MmRhSkRsbzlMaTVMRlQyUVhwSU10cTVLUFZk?=
 =?utf-8?B?VVVPdkJ3NzBWbXFHL1ZSRzFyaTQ2akpkUXBiVVJScE1nQUJjUTRwb2RZYzNW?=
 =?utf-8?B?ZEMwWUVRYjJHM0svNThOSmNmbGtPRUN0QnlYeHcrZkw2bDFwRzN4dWIrYmJ2?=
 =?utf-8?B?YWgwSUc5MEl6cGJNcVRnc2gxUDVUQzV1d2RnQ1hzK1FwalJPUSt6NFFOVkpW?=
 =?utf-8?B?dEtqNGZPNXE1RWg2Zk8wZ0xOa3VVVzVONDlubFcvRTZMb1lzS01aWldqTEtN?=
 =?utf-8?B?dzRkVkFhOWt5cEdjUnl5NEdCUXRUQUZGQ3pCRFlmdEtqNXRrQjVEMTJPWHJu?=
 =?utf-8?B?Z3NDSjgrQStBS1pZQXJia2syS0FzQjJkKzJYTVdwRXBrVnVTd2FuYnJSRStW?=
 =?utf-8?B?L0drVHp4NnJ1K0FNaXUrTGdSUzNEZDk1S1drY2RhMVFBL2JzdVc1cEtuUXgr?=
 =?utf-8?B?dWJpcEdBK0FCaCtXT3JmMFdUZDlLdnJObXVUYk9hZU0ydmlnK0JzZ1N5aWVO?=
 =?utf-8?B?T1FzSFdHNW1mN0pxcStWdnNaR3BzSjFzTXdldFNFUU9jdEVabjBVK0VuSCtN?=
 =?utf-8?B?bytwc3NGNHRHYzB5K3dRVFBQT24zM09DaDVxNzBwdWlDNmROb0pFYzNNcnky?=
 =?utf-8?B?ZEsxQlBrN1VTc2RtYWk0dHRhNEl1QjhQbE5QbEh0dThJV3pMZjhqQjVOTkE1?=
 =?utf-8?B?bjF0bjI4NW1nVzZOdTZicnZhZG5wVklEdU9hTWtlNFMvTGdQNlhCR3dOWG9Z?=
 =?utf-8?B?OWtrbkRBbkhTUVR1dG5TRE0wMzdJSnFaMUk0Z3YxbUVlZ2ZBVTRNbnhoaUM5?=
 =?utf-8?B?Um9XZGpWdElSY1dTc000WDF0NFBSU1JaTVNENmlONG5PRG5lVVRNdm8zUGhH?=
 =?utf-8?B?NFBGdDZUMm9PWm1EWjZGVHE3MG54a1ROUHdZVUVMdGMzZlZsdGxieDAwNWJ6?=
 =?utf-8?B?cUM2aEM2WmhqNVdNS0wyVm1lbmhqRE9vUlp5YjFNY2VxSzFNdDJxWWJweGpF?=
 =?utf-8?B?L1UxY24rUUFhdGE1WWtZdS9LYThQMUFxYS9OWVdCM3lrK0tJdVBLaWh0ZGNW?=
 =?utf-8?Q?aTI5KrdAGKQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUtNVkZadHU0M3ZHOURpUloycHcrcWZIQjZPUUZWekwyOFNJZi9JSFlCVlBk?=
 =?utf-8?B?bkYxMnQwMWhrdUhTYlJyaDl0djMzVDF5aUVFL21keURPSWRVTUtMR3BLWlo4?=
 =?utf-8?B?ODJpRXEyOUhXRlE5RWRaS1VjWnBGaHFiWUtEaDlLeVVjcno0WWJrTXpHZCtI?=
 =?utf-8?B?SzNGcTl2WWEvclJTaFNjNzVOR1g2UXkzMmx1d1krbHBlWEwrRmhWazJrZm9a?=
 =?utf-8?B?alRQaHpXdkZ3WmJhcnRPSHF5bHJHTHdGUUl3QjBybnNNeStQRHpmWUEzYUZM?=
 =?utf-8?B?cjUzTitCM3B5c21EdllaOXgxa3lrd2JrNHU4VGpFcnhpUWJyUk42ZmhMWGRP?=
 =?utf-8?B?d2NtZUxJNE1OZi9iTXB6amtxazhoYlNtVVlmNS9yd05IVVRMalNJelA0S2Fi?=
 =?utf-8?B?NnJid2Roc0JnUFQybndEOFViaU1LZ203dStEWXhTTktBRkIvZmNHcFowUjdB?=
 =?utf-8?B?NEo0ZHJFVkEvcE9xMS9xaXovNzhiT2RLWmtUQjFiU1RYTmNkbDJKcUZhQ1Zn?=
 =?utf-8?B?OGNDTGJLV0hLYlZiUnBpdUt5N3dpdXp0MmZNRjN0aEdNdmw5TklvV1lOVU02?=
 =?utf-8?B?bmIxVG95VjFYbzJkTXFIYVgxYWlQb2Fqd0dBTGN3WDhBOFloSUlmcElORDJD?=
 =?utf-8?B?Njk3VmRMTTBSRjJyZW5UaHVtYkNUNVdHaEpvMlZIQ0lTYmhmdW1JUktlaGtz?=
 =?utf-8?B?M3NxbDVRVHBhU2ladkRiWGtVOGpibE5tTmpOeDZUZm4ybWxRYTUvNU53UWJK?=
 =?utf-8?B?Y2tlWk5DVElpMkhaTHZDekhwQWVIUXZ6L0tZZlo4Y1FMbis4TXJiWmNKUWIv?=
 =?utf-8?B?NzBBWXZZZDNHNHErRFl2Umx6R1V4NGxDOG53Uk1PVk03Y0ZFUXd2ZURrTHpo?=
 =?utf-8?B?R0FQc2lGR00raHhwSVJzbzRQaGsyVHRSL1gyYldYNS9uT0NNamZ4NmZLaXRi?=
 =?utf-8?B?QjBON3doTVpEcTdPV01WVDh5dk4rTjdoSnYreGYxTEsxTVQ2R0FJKzVseEQy?=
 =?utf-8?B?emxRY0NLaGNHTTRkM1hWZnVMZmpJTm55ekpvNjZ3QkZXVXZ3K1VqNDlnOXhE?=
 =?utf-8?B?Q1dOazdOSWZJQ2lIZSszOXZDWWs2ZnBqZXZ1anV2N0o1WkhOQ3VTMGlONG84?=
 =?utf-8?B?NEowK1BBcHhvdGdwSEIzQ1k2MHVEaXE0Mk03bWl2Sm5wb09hOEI2ZjM5V3Ux?=
 =?utf-8?B?SVFIeVJRM2NyUEE0d2VkdmV0UXpJMXp5QXV1eW1OYVd0cHRVcnl0R0NnMHFt?=
 =?utf-8?B?bVhtT1hLcHdOcitxWmxhdmY1b0RHMGp1TFYrb1FvT2VwRFBXWVlidFJLaWtO?=
 =?utf-8?B?azVQWk5jRVRXRmV6RExBY2JwNXQ4NWRqSXhzY2tMNXlWWlNxTFI4R1A5L01I?=
 =?utf-8?B?c2JwYkM0NGoxVFNkYVVkRzJWdGl3T3IvanVtSElwU0IzN2Z1TnpMNTNxMVdC?=
 =?utf-8?B?eWRLNERZeHFFTDN4OFc1bXVJVlJLK1ZqQW52RDhNcFJHWVZTVFd5K3YyQTB6?=
 =?utf-8?B?VDAySW13b3BjbVcrOEcvS0l5eGEyZXJocDl2Y0NQa0pPRW1Db0wrMm9RZGR1?=
 =?utf-8?B?TGRGc2JyQVZSYnpDb0VHS0l6cVh1MVBsMWRxREJYZ21jZkhhTU41ZXBNZndh?=
 =?utf-8?B?eXZEUHVpUGtZazBBN2h3NVJnOG53YmpsVHlRWFlhWTlKUXF5aFFVNlJwMlVk?=
 =?utf-8?B?R2EwUDhnMVZiVWNJS283NWx3eFh5b05hSGFtQnZJN2llN0dob1V1aytoR2Rt?=
 =?utf-8?B?ZXVSVU1WZG41QkhSQzlZWEZPZU9KM2NUWXFPY1VmYWd6M2hWWWZHclNmRTI5?=
 =?utf-8?B?Vk45ZUdwTHV4QWlxVWFzNzNKNWx4aUlrOVFHaUNkd1BBM3J1TWl5K0dwV1Bu?=
 =?utf-8?B?RmNyWW4wYjVuV2Z0L25mWXdLQmZYZW1RMFE1dEZtdjlOYmZONU1KM2V6L3M1?=
 =?utf-8?B?NGpMUS9McEhWSHdMRitqYjc3RVZab1pvU1V3RHdYbkp1NjFwWmZqSGIxbzNE?=
 =?utf-8?B?RmthY0VlNmVLMFRsUityME0yaW5EZ2x0S1NMbEtyNTRnTjhmREdibmtLTDM1?=
 =?utf-8?B?bU40SnRveGxZTzlNVktwUWlMWUN4TGVrMWFrY1hGWDlwL08rZVYvSmpBZnZw?=
 =?utf-8?B?VFhtRWRYZ2xFUTF0QjArMmNMSld5eldSdTRIWTdTU01VU3cxa2RiNUlWYlhU?=
 =?utf-8?Q?D1dFYc9tOrJ1G0yO2In+PIE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2592b28a-10d5-473f-e758-08dd86b96fee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 01:01:56.4625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAr8lTxEj3D6sDkpzRuocB3/uaokCviGi1F18kuBRvALiTxhgYCd0WSzsCu1TDpsqBZM7+Zz/xYq7LFDyqk6KOBo3qZ2RMVql/wOV9NQFM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4912
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

Resending, since I forgot to add the list

----- Forwarded message from Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> -----

Date: Mon, 28 Apr 2025 16:58:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: Add WA BB to capture active context utilization

On Fri, Apr 25, 2025 at 09:54:52PM -0700, Matthew Brost wrote:
> On Fri, Apr 25, 2025 at 05:29:51PM -0700, Umesh Nerlige Ramappa wrote:
> > Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks
> > of the context, but only gets updated when the context switches out. In
> > order to check how long a context has been active before it switches
> > out, two things are required:
> > 
> > (1) Determine if the context is running:
> > 
> > To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP
> > in the lrc. The value chosen is 1 since 0 is the initial value when the
> > lrc is initialized. During a query, we just check for this value to
> > determine if the context is active. If the context switched out, it
> > would overwrite this location with the actual CTX_TIMESTAMP MMIO value.
> > Note that wa bb will run after the context has been restored, so reusing
> > this lrc location will not clobber anything.
> > 
> > (2) Calculate the time that the context has been active for:
> > 
> > The CTX_TIMESTAMP ticks only when the context is active. If a context is
> > active, we just use the CTX_TIMESTAMP MMIO as the new value of
> > utilization. While doing so, we need to read the CTX_TIMESTAMP MMIO
> > for the specific engine instance. Since we do not know which instance
> > the context is running on until it is scheduled, we also read the
> > ENGINE_ID MMIO in the wa bb and store it in the PPHSWP.
> > 
> > Using the above 2 instructions in a WA BB, capture active context
> > utilization.
> > 
> > v2: (Matt Brost)
> > - This breaks TDR, fix it by saving the CTX_TIMESTAMP register
> >   "drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value"
> > - Drop tile from lrc if using gt
> >   "drm/xe: Save the gt pointer in lrc and drop the tile"
> > 
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > ---
> >  .../gpu/drm/xe/instructions/xe_mi_commands.h  |   4 +
> >  drivers/gpu/drm/xe/regs/xe_engine_regs.h      |   4 +
> >  drivers/gpu/drm/xe/regs/xe_lrc_layout.h       |   1 +
> >  drivers/gpu/drm/xe/xe_lrc.c                   | 167 +++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_lrc_types.h             |   3 +
> >  5 files changed, 177 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > index eba582058d55..9153a7cd2ceb 100644
> > --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
> > @@ -62,6 +62,10 @@
> >  #define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
> >  #define   MI_LRM_USE_GGTT		REG_BIT(22)
> > 
> > +#define MI_STORE_REGISTER_MEM		(__MI_INSTR(0x24) | XE_INSTR_NUM_DW(4))
> > +#define   MI_SRM_USE_GGTT		REG_BIT(22)
> > +#define   MI_SRM_ADD_CS_OFFSET		REG_BIT(19)
> > +
> >  #define MI_LOAD_REGISTER_REG		(__MI_INSTR(0x2a) | XE_INSTR_NUM_DW(3))
> >  #define   MI_LRR_DST_CS_MMIO		REG_BIT(19)
> >  #define   MI_LRR_SRC_CS_MMIO		REG_BIT(18)
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index da713634d6a0..cc698136a6f6 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -43,6 +43,10 @@
> >  #define XEHPC_BCS8_RING_BASE			0x3ee000
> >  #define GSCCS_RING_BASE				0x11a000
> > 
> > +#define ENGINE_ID(base)				XE_REG((base) + 0x8c)
> > +#define   ENGINE_INSTANCE_ID			REG_GENMASK(9, 4)
> > +#define   ENGINE_CLASS_ID			REG_GENMASK(2, 0)
> > +
> >  #define RING_TAIL(base)				XE_REG((base) + 0x30)
> >  #define   TAIL_ADDR				REG_GENMASK(20, 3)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > index 57944f90bbf6..210be0ef12f2 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> > @@ -11,6 +11,7 @@
> >  #define CTX_RING_TAIL			(0x06 + 1)
> >  #define CTX_RING_START			(0x08 + 1)
> >  #define CTX_RING_CTL			(0x0a + 1)
> > +#define CTX_BB_PER_CTX_PTR		(0x12 + 1)
> >  #define CTX_TIMESTAMP			(0x22 + 1)
> >  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> >  #define CTX_PDP0_UDW			(0x30 + 1)
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 089b195e2635..a78acec1a358 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -24,6 +24,7 @@
> >  #include "xe_hw_fence.h"
> >  #include "xe_map.h"
> >  #include "xe_memirq.h"
> > +#include "xe_mmio.h"
> >  #include "xe_sriov.h"
> >  #include "xe_trace_lrc.h"
> >  #include "xe_vm.h"
> > @@ -654,6 +655,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> >  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> >  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> >  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
> > +#define LRC_ENGINE_ID_PPHWSP_OFFSET 2096
> > 
> >  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> >  {
> > @@ -697,11 +699,21 @@ static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> >  	return xe_lrc_pphwsp_offset(lrc) + LRC_PARALLEL_PPHWSP_OFFSET;
> >  }
> > 
> > +static inline u32 __xe_lrc_engine_id_offset(struct xe_lrc *lrc)
> > +{
> > +	return xe_lrc_pphwsp_offset(lrc) + LRC_ENGINE_ID_PPHWSP_OFFSET;
> > +}
> > +
> >  static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> >  {
> >  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> >  }
> > 
> > +static u32 __xe_lrc_bb_per_ctx_ptr_offset(struct xe_lrc *lrc)
> > +{
> > +	return __xe_lrc_regs_offset(lrc) + CTX_BB_PER_CTX_PTR * sizeof(u32);
> > +}

This also looks like it's unused, so will drop it.

> > +
> >  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> >  {
> >  	/* Indirect ring state page is at the very end of LRC */
> > @@ -731,6 +743,8 @@ DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> >  DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> >  DECL_MAP_ADDR_HELPERS(parallel)
> >  DECL_MAP_ADDR_HELPERS(indirect_ring)
> > +DECL_MAP_ADDR_HELPERS(bb_per_ctx_ptr)
> 
> This appears to be unused.

oh, you are right, will remove

> 
> > +DECL_MAP_ADDR_HELPERS(engine_id)
> > 
> >  #undef DECL_MAP_ADDR_HELPERS
> > 
> > @@ -880,6 +894,58 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
> >  	xe_bo_unpin(lrc->bo);
> >  	xe_bo_unlock(lrc->bo);
> >  	xe_bo_put(lrc->bo);
> > +	xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
> > +}
> > +
> > +/*
> > + * xe_lrc_setup_utilization() - Setup wa bb to assist in calculating active
> > + * context run ticks.
> > + * @lrc: Pointer to the lrc.
> > + *
> > + * Context Timestamp (CTX_TIMESTAMP) in the lrc accumulates the run ticks of the
> > + * context, but only gets updated when the context switches out. In order to
> > + * check how long a context has been running before it switches out, two things
> > + * are required:
> > + *
> > + * (1) Determine if the context is running
> > + * To do so, we program the wa bb to set an initial value for CTX_TIMESTAMP in
> > + * the lrc. The value chosen is 1 since 0 is the initial value when the lrc is
> > + * initialized. During a query, we just check for this value to determine if the
> > + * context is active. If the context switched out, it would overwrite this
> > + * location with the actual CTX_TIMESTAMP MMIO value. Note that wa bb will run
> > + * after the context has been restored, so reusing this lrc location will not
> > + * clobber anything.
> > + *
> > + * (2) Calculate the time that the context has been running for
> > + * The CTX_TIMESTAMP ticks only when the context is active. If a context is
> > + * active, we just use the CTX_TIMESTAMP MMIO as the new value of utilization.
> > + * While doing so, we need to read the CTX_TIMESTAMP MMIO from the specific
> > + * engine instance. Since we do not know which instance the context is running
> > + * on until it is scheduled, we also read the ENGINE_ID MMIO in the wa bb and
> > + * store it in the PPHSWP.
> > + */
> > +
> > +static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
> > +{
> > +	u32 *cmd;
> > +
> > +	cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
> > +
> > +	*cmd++ = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> > +	*cmd++ = ENGINE_ID(0).addr;
> > +	*cmd++ = __xe_lrc_engine_id_ggtt_addr(lrc);
> > +	*cmd++ = 0;
> > +
> > +	*cmd++ = MI_STORE_DATA_IMM | MI_SDI_GGTT | MI_SDI_NUM_DW(1);
> > +	*cmd++ = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> > +	*cmd++ = 0;
> > +	*cmd++ = 1;
> 
> Nit: Rather than '1' can we have define indicating this is a special value.

Sure, will add define.

> 
> Also there is a small possibily (1 in 4 billion - I think) of a race
> here. It is possible than an LRC switches out with a value of '1' and I
> believe we'd read garbage from get_ctx_timestamp() ... Is there really
> not another register in the LRC we can steal a bit from?

There are, but the ones that are saved/restored during lite-restore is 
entirely hw implementation dependent. Looks like CTX_TIMESTAMP is NOT 
saved/restored during lite-restore and also it directly relates to this 
feature, so a safer bet.

Other alternatives explored
1) ppHWSP locations that might be updated on context save. These are not 
consistent across platforms and are disabled in some.

For 2, 3 below, Ref: https://www.intel.com/content/www/us/en/docs/graphics-for-linux/developer-reference/1-0/alchemist-arctic-sound-m.html

2) Vol 8: Page 57/64
If we look for anything after CSEL_BE in the LRC, then we would need to add 
logic to traverse the LRC to find the right offset because it is engine 
specific and also platform specific. Can be done, but not a lot of ROI 
considering the probability of hitting this.

3) Vol 9: Page 39/730
If we omit support for media and copy engines, then we could use upper half of 
PREEMPTION_STATUS field. Needs more experiments though. This doesn't get 
restored at all, only saved. So we could just write
something like (ENGINE_ID + 1) to this location from the WA BB.

> 
> If not, maybe we can live with this race? At minimum we'd need comment
> somewhere explaining this - at worst we'd get some bad stats or in a
> very unlikely case get false job timeout if we switch the TDR to use
> this new code path.

I asked around and got some suggestions - like check HEAD/TAIL of the ring in 
the LRC and that should tell if the context is really active.  But if HEAD != 
TAIL, we still run into the same issue of checking validity again.

IMO, since the probability of hitting this is very small, I would go with the 
current implementation and like you said, add a comment describing this race.

> 
> The patch / design LGTM to good me though.

Thanks,
Umesh

> 
> Matt
> 
> > +
> > +	*cmd++ = MI_BATCH_BUFFER_END;
> > +
> > +	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
> > +			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
> > +
> >  }
> > 
> >  #define PVC_CTX_ASID		(0x2e + 1)
> > @@ -921,6 +987,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >  	if (IS_ERR(lrc->bo))
> >  		return PTR_ERR(lrc->bo);
> > 
> > +	lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
> > +						  ttm_bo_type_kernel,
> > +						  bo_flags);
> > +	if (IS_ERR(lrc->bb_per_ctx_bo)) {
> > +		err = PTR_ERR(lrc->bb_per_ctx_bo);
> > +		goto err_lrc_finish;
> > +	}
> > +
> >  	lrc->size = lrc_size;
> >  	lrc->ring.size = ring_size;
> >  	lrc->ring.tail = 0;
> > @@ -1026,6 +1100,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >  	map = __xe_lrc_start_seqno_map(lrc);
> >  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
> > 
> > +	xe_lrc_setup_utilization(lrc);
> > +
> >  	return 0;
> > 
> >  err_lrc_finish:
> > @@ -1245,6 +1321,21 @@ struct iosys_map xe_lrc_parallel_map(struct xe_lrc *lrc)
> >  	return __xe_lrc_parallel_map(lrc);
> >  }
> > 
> > +/**
> > + * xe_lrc_engine_id() - Read engine id value
> > + * @lrc: Pointer to the lrc.
> > + *
> > + * Returns: context id value
> > + */
> > +static u32 xe_lrc_engine_id(struct xe_lrc *lrc)
> > +{
> > +	struct xe_device *xe = lrc_to_xe(lrc);
> > +	struct iosys_map map;
> > +
> > +	map = __xe_lrc_engine_id_map(lrc);
> > +	return xe_map_read32(xe, &map);
> > +}
> > +
> >  static int instr_dw(u32 cmd_header)
> >  {
> >  	/* GFXPIPE "SINGLE_DW" opcodes are a single dword */
> > @@ -1792,21 +1883,93 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
> >  	kfree(snapshot);
> >  }
> > 
> > +static u32 get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id)
> > +{
> > +	static u32 base[XE_ENGINE_CLASS_MAX][XE_HW_ENGINE_MAX_INSTANCE] = {
> > +		{
> > +			RENDER_RING_BASE,
> > +		},
> > +		{
> > +			BSD_RING_BASE,
> > +			BSD2_RING_BASE,
> > +			BSD3_RING_BASE,
> > +			BSD4_RING_BASE,
> > +			XEHP_BSD5_RING_BASE,
> > +			XEHP_BSD6_RING_BASE,
> > +			XEHP_BSD7_RING_BASE,
> > +			XEHP_BSD8_RING_BASE,
> > +		},
> > +		{
> > +			VEBOX_RING_BASE,
> > +			VEBOX2_RING_BASE,
> > +			XEHP_VEBOX3_RING_BASE,
> > +			XEHP_VEBOX4_RING_BASE,
> > +		},
> > +		{
> > +			BLT_RING_BASE,
> > +			XEHPC_BCS1_RING_BASE,
> > +			XEHPC_BCS2_RING_BASE,
> > +			XEHPC_BCS3_RING_BASE,
> > +			XEHPC_BCS4_RING_BASE,
> > +			XEHPC_BCS5_RING_BASE,
> > +			XEHPC_BCS6_RING_BASE,
> > +			XEHPC_BCS7_RING_BASE,
> > +			XEHPC_BCS8_RING_BASE,
> > +		},
> > +		{ 0 },
> > +		{
> > +			COMPUTE0_RING_BASE,
> > +			COMPUTE1_RING_BASE,
> > +			COMPUTE2_RING_BASE,
> > +			COMPUTE3_RING_BASE,
> > +		},
> > +	};
> > +	u32 c = REG_FIELD_GET(ENGINE_CLASS_ID, engine_id);
> > +	u32 i = REG_FIELD_GET(ENGINE_INSTANCE_ID, engine_id);
> > +	u32 mmio_base = base[c][i];
> > +
> > +	if (xe_gt_WARN_ONCE(lrc->gt, !mmio_base,
> > +			    "Unexpected engine c:i %d:%d for context utilization\n",
> > +			    c, i))
> > +		return 0;
> > +
> > +	return xe_mmio_read32(&lrc->gt->mmio, RING_CTX_TIMESTAMP(mmio_base));
> > +}
> > +
> >  /**
> >   * xe_lrc_update_timestamp() - Update ctx timestamp
> >   * @lrc: Pointer to the lrc.
> >   * @old_ts: Old timestamp value
> >   *
> >   * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> > - * update saved value.
> > + * update saved value. With support for active contexts, the calculation may be
> > + * slightly racy, so follow a read-again logic to ensure that the context is
> > + * still active before returning the right timestamp.
> >   *
> >   * Returns: New ctx timestamp value
> >   */
> >  u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
> >  {
> > +	u32 ctx_lrc, ctx_reg, engine_id;
> > +
> >  	*old_ts = lrc->ctx_timestamp;
> > 
> > -	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> > +	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> > +	if (ctx_lrc == 1) {
> > +		engine_id = xe_lrc_engine_id(lrc);
> > +		ctx_reg = get_ctx_timestamp(lrc, engine_id);
> > +		if (!ctx_reg)
> > +			lrc->ctx_timestamp = *old_ts;
> > +		else
> > +			lrc->ctx_timestamp = ctx_reg;
> > +
> > +		/* read lrc again to ensure context is still active */
> > +		ctx_lrc = xe_lrc_ctx_timestamp(lrc);
> > +	}
> > +
> > +	/* If context switched out, just use the lrc value */
> > +	if (ctx_lrc != 1)
> > +		lrc->ctx_timestamp = ctx_lrc;
> > 
> >  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> > index cd38586ae989..a62d0b8ca8a4 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> > @@ -53,6 +53,9 @@ struct xe_lrc {
> > 
> >  	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> >  	u32 ctx_timestamp;
> > +
> > +	/** @bb_per_ctx_bo: buffer object for per context batch wa buffer */
> > +	struct xe_bo *bb_per_ctx_bo;
> >  };
> > 
> >  struct xe_lrc_snapshot;
> > --
> > 2.43.0
> > 

----- End forwarded message -----
