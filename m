Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAC5D1BDC9
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 17:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B48610E7F4;
	Wed,  3 Dec 2025 17:07:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJ7ReZ/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806BC10E7F7
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764781629; x=1796317629;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V5Nenpxb1WrJXrW8r271dz4pssSGsCw4ffDsPS4cES0=;
 b=hJ7ReZ/dk3Y3trgRWcC50hMnp7Jbq1fPGGhxSwXjeAQefiF0wyjiwVuN
 DdVIsu/DymQzITUrrBwWvLAEyrW3NYO30ZXIzP1vkNTS8nAKVIrGRRWq+
 FEjSU+XmIz55hG3WxO1w9Dada+KhtcDh4G+FOhF5qwUkGk9uncHKF1eZs
 C2MMKMfDB4pB19X72l73Q6w8d5SambWN7OKrYPXRN5cu0d8HA8ke2a3n8
 eKFONMpyvfJRFrw5r0p9O7jd8qT8c2o5WBGtnI4RdJzdTadfqSxmwTQOY
 VbI60Cg7Gf1u11sFouSKWqiQH1eSdsk7Qdue6xc3oHKWf5WLS5xCuwuIA A==;
X-CSE-ConnectionGUID: GnQ9R2hyQ6GuAPXlOGJBUw==
X-CSE-MsgGUID: 1Ueusr+sQn6ZcnucwwxRgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69379867"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="69379867"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:07:08 -0800
X-CSE-ConnectionGUID: X1gNNRZKToKggiMwL9Mmuw==
X-CSE-MsgGUID: S+wus8SjQ1K8Tdv4+vMZYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="199206182"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:07:07 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 09:07:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 09:07:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 09:07:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/V2zDIf6hwVtsu817u5nIWhnQ6Io+8kgXeRzimGQO6JKmwBwRcO996S7VHPXKj3/tulrwIWug+8CM4NBRwHdsUDwAUu/osqjNos7JxoC6J0y/8pw/CqGgAoE5S+WrIVpNwyGTmP9I3X5lh44NbD9BOhiV6ikv1zlbFlzJa++oNSy2tCjN3ap5TB2vIUI3KSx7EM1n9r20kM1hLGvKcevjSdnPFhsLjjCsXLrBi5al5MOajpAxpt6ln/okR7AHMp9mrBHgRHvWYQfg12KIPC/sXMb8tK3pN1m9AGhPcsJbsUEgEeqHM/p+RiqJpqYQEf+WXByqTHRtBCF+v7Y5zF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBTopXGDQ2O9/8LNIxV+jGfCXMZ8yuX+8mZJG+cGLbw=;
 b=Pruf0S1ToJ7xdU/h3TJ7sQw3oLcjQELWvgieY67xJ0Z7VCaTDV20XSzMUeuXTo9EU+Uuaei3lCTpV5eCvxdw+bT2IVyTS1d/ZUeu+Qca9Gx3Do3ENfTH0XlPRR/jlOfIcJm5nvAmwEeZOI54+lgO6vppqYgkA2D5HB/hzQSf/8aYq9Ha6xp0C3XvPpz5kpU14+iGZzzRx0IB6cBdMKtm6Kcf/ziy96hgNkKAxepMSEUdcnNY0WyQdu4DRK5yhaZ+L9sPNZJOLyQX3D+MVulj3N1cZZikE5S32v/zQuXyGWBHw6noLLY/Z4qQXvBlbXUeV1d0i32ThynYOB57WSFTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS4PPFAC42FDD50.namprd11.prod.outlook.com (2603:10b6:f:fc02::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 17:07:01 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 17:07:01 +0000
Date: Wed, 3 Dec 2025 09:06:48 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <badal.nilawar@intel.com>, <ashutosh.dixit@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe/soc_remapper: Initialize SoC remapper
 during Xe probe
Message-ID: <aTBuKPcPgZdkCPWO@soc-5CG1426VCC.clients.intel.com>
References: <20251203004800.1993258-5-umesh.nerlige.ramappa@intel.com>
 <20251203004800.1993258-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251203004800.1993258-6-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS4PPFAC42FDD50:EE_
X-MS-Office365-Filtering-Correlation-Id: cd92c2ec-c5f3-41cf-20a8-08de328e5fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGhsWm83VXJIYXZJSE5BWUlDWWNMWlpTQXNaakFGcnpwNnkvUXNMZWRYd0do?=
 =?utf-8?B?N0pXazdUU2Z0eUdVTUlXalMwQUJ2czJQMFJCUURzV3BNY0JaVUJVNm1aTHBT?=
 =?utf-8?B?MzN1bldUS0tXTzQrWklpaXlqcDRwZUgzYXlkTlBwMUNlYksrUzBIM2poVlJT?=
 =?utf-8?B?T2N6aks1UE5iazYyM1IwdzRhSzgzUHQwcjRKWmRLZHhHdldDcWQxTUpSUHc4?=
 =?utf-8?B?RTg3MUd2SU9tVGpPZXFtOXRkSGNTNTJzTEFZMDArNG9KOHNzVkp1Mm8reEVU?=
 =?utf-8?B?NkJpZDEyMUdTb05RSWNhbm0vYjR5VnNtNmQ4L3lDSDBEcitvZEMvTzRZY0RD?=
 =?utf-8?B?b1F5SDVKMnBobml5K25JUy9ocCtKYlFJZUxsTUgwYkhNcUIxZ0loQUtKVlJC?=
 =?utf-8?B?c2xmWmM2RWRja1FmbUdUNkpPTzFVRVA5VnJhOHVwbFJoSVR2K00rSGhXVkdG?=
 =?utf-8?B?ZXJYbGlja1B5VFVkRVplVC9EZm9MdVJldXdPeXZHeHFyd3FyTWNVakJHaVFI?=
 =?utf-8?B?Z3BQblM1WWNBSm15NXg5clpYTXloNzE1bzdDSlVnUFY5K3AwOUh1ZHQ3amNu?=
 =?utf-8?B?MWhYVU1QYmpuU2RYeE5ORUxnbUxGV3MvcGc1N1ZiLzc5aG5FWlF4TTJrSVBV?=
 =?utf-8?B?WTlzNU1NdnRlRW5wN29yZUFoOGMxNUVDdFBERFMxUy96NS9aeFIxYUlHck5N?=
 =?utf-8?B?Z2VwWUJkeC9nSlBKdHFtLzRSb1o0bUs2cmNoNGxYUmZGOC9MK0R0ektOdEtz?=
 =?utf-8?B?VUplM1g0Ty9kQS9wbjgvMG9wTjE0QmJqMFM2a2J6VDcxS1RQcFJ2VSs4SFlH?=
 =?utf-8?B?NjBjcG81UXhZU3IwKzJHaVNLQUVtdXpEdm5OMHNXaHhzb0lIVFpmNnhKSVIz?=
 =?utf-8?B?Q1lYb2kzcEs4Ymh6bUQ0SXhmeWxsMFZJYko5d3Y2aytxZ21SM0QxR0FIU21m?=
 =?utf-8?B?djY3Mnc1amFJa09yQVJtVjdlS0RXQUw4ZTA3VHdCWEo5cEwwQmxrYW9qVWpY?=
 =?utf-8?B?Vk1BcnhyV053a0t4UHNnVE16WHh3aG1UZkc3TzRPMGdyMzNMMGI2R283ajZM?=
 =?utf-8?B?VmFzWlgrQkdUd2t5QmRXVnpLQUFIUjhjT2hscTVJSU04SkFhYk5vUS9VUXls?=
 =?utf-8?B?OU1JL043aUZBMUcyZ0hmTDV3a1M3VHEyRCtGRmJaVUdUdDZaVkw3S1BNeW9l?=
 =?utf-8?B?Z0MwRDJrMFVPTllkMmY0T3pTUHNxZ0xTc3B6UW1DTE1MQlhOTDRhdk8xUHNQ?=
 =?utf-8?B?YW9hejFoSE5Pa0pVQXVXdGNMTWZOdERYT0NINVFrVDB3aTJqNExzS0xwVWlw?=
 =?utf-8?B?cHdsK01FdFN5SG5FUXJlOGJZamFmMHY2SGRYUzRaUGYvbTUyS0JWYjdLRjMx?=
 =?utf-8?B?SkxMckJUZkd1dDJUVXFQZnhrS3AwZ1k5eFhROG8rcmJPOTlUV1R3NlNNaHJn?=
 =?utf-8?B?VCtXekV1RnM0ejdEQmpBSjVlMnVnM3BVc2xHVW9wbjRFRGZHVjhTc1RabFBl?=
 =?utf-8?B?S0g3bmtjYVZQOG5aY1hoTFZhTkFRWkF2ekx1bi9SUXhKWkV1RmNGeVRPbmo2?=
 =?utf-8?B?djkyOWt3Y09OVmJHNnVSZGRwNXdmVktaM2pYUXVxNTMvOHIzck5VL2xvSDNs?=
 =?utf-8?B?QTFiTmF0cFpFM0dGWW1Ca0VlNXB4VVZXOXp3d1pONkZlOFh5SG0yd082RjNt?=
 =?utf-8?B?c3YyMXlpS3hndzdVd29kQ1AvVlorNitBUGdISXhMVzNhZnRlb2h5bUNMQlFl?=
 =?utf-8?B?MVZlQXNDTjduZzFpUlk3dDVrakV3UElGVUlsQmExSlgyTklUZzM0aWNJZ25N?=
 =?utf-8?B?Y2lOdy9tOXRGY3RiZWs0SGpscVVrelkvTzRCbUUzbTVjN3dSL3RDYVVKdkdp?=
 =?utf-8?B?RVZXOEhaaXpIUnBkNzU5WVAvVEV1M3dldjM1WVlWVHcyMW9VdFdacHFhSFBo?=
 =?utf-8?Q?QrXZHH/XWuULUV2WJw/qSVCxn0uHCCvB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmR3SXZhdytERlZZdWI3d0pDN0h4MDZUdTRBTDIwdG5YV0ozMmIxZHg5WE40?=
 =?utf-8?B?dXZqODVyZU8wN1Zhb2Rsam0wMkJaUFd6TEdVK2NsRmRGeXBKc0NqNXhLRkEx?=
 =?utf-8?B?UStwaytVUGhrL1NrcFAvMTY1VU1ldWlZRThPYjkyTyticG1ZNUFRVW05R0wz?=
 =?utf-8?B?em1DSlNtakp6MXV3MGZvQWNFelFsc0drUG80VVh4RXZhQzJvbEF2NHdxUzU3?=
 =?utf-8?B?THFRYWlibkxCY0lkQWQ1dVExWWVjSUtMejFFU0owRmc0Y280UmJaWnlrSmNK?=
 =?utf-8?B?dkhBaE50dnZXZDJIL3pZZWVEOUU1Q0piVUFadyt6Wkh2cGxUL2szUmEvOWt4?=
 =?utf-8?B?N1Jab0dqVDVNVjRuNFhSMTBid2RTVEFScXoyOG9kNVVEMmFRdjdHQUZDOFM1?=
 =?utf-8?B?cXBuTzVSNlpTT0tqTUFhcm5XeVdILzlqYmsrSUlyRHdmbFZrQ01iS01yK2la?=
 =?utf-8?B?TUZCdXlIM3FGWk0wMlFPTmtRTXRXSVZqSDBxeGY3LzlmYXRHdmVOZ0RnTEh3?=
 =?utf-8?B?bk9PRmpwTVRqVEpkZ0RxanBsRmJSazZOa0EwWUVtZitoVldQdWtZWWFhMHho?=
 =?utf-8?B?L1hhSTE3a1k1dmJrYnI4REsyQldOWkJFaDZkNjBRZ1MyaHBvRlhPaW1Hcm5s?=
 =?utf-8?B?ZzlnTy9obGxnenhVZEdFcmVPOWx4SmJDWFo3T29mN3JWeEV6NWxFMW1mbmlP?=
 =?utf-8?B?WWNRMDdqNkdwcGpUaGh1OGtCOVpmandBS1hKeENRRGg0UmFZVnQveEh5NWtV?=
 =?utf-8?B?aTdua2VDK1hwZit4TVlDN0lUa3RkVXpBUHI0Z0ZwQWx1NThyUUc1L3U4cGpk?=
 =?utf-8?B?Y2diTkpLMW1IN2s4VkNVSktVSHloTGVYZ2tIbktLVG9wV3REMmJtUmJobnUz?=
 =?utf-8?B?c3lKV0pzajgzZlE1dU5RanNSY3JTZUMrY1NxRnpzZFhJT0NFUCtRbU44ZDJ4?=
 =?utf-8?B?QmY4MWtLZTY4UDQ1WDRWbllNb0pFR0tpRU5HZEVaVlRvMFN6YnBVcVI5aEc0?=
 =?utf-8?B?cm5zdk5uNm1tYXJjT242RDVjbWpyaG4yUkdvc1I1SVlaUmU3RWFXOEZKckVX?=
 =?utf-8?B?eHRESTFlN2ZEdDF4RWxWZnRkWC9kT1UwTm9YUTArdXdFZjBmcEpMZjBPRXd6?=
 =?utf-8?B?bzJ2ekp0TEhOTFhZZDQrcjc5L1J5UHltZGtnMlJFL1ZhQVQxSmI3Ui90OGVy?=
 =?utf-8?B?QUUrMkRPcXFwMERQOUsvbHZjdmNUd0wxdXNqais2eGVsL3F3clFmODhWZmMw?=
 =?utf-8?B?ak5JQmJtQ1ZKUGJvUWJja1ZsOG82TE9RQ0x0SWI2V3ZjQTgyeko3NjBZbjN1?=
 =?utf-8?B?clIxcnhZRkRBTXlQMDE3M25aSUlWV01iUm9QYkdiNVF6SkJwWXRMT29qSXkv?=
 =?utf-8?B?VmtjMEZnV3o1SXZGdTVVVlNUeUt0Y3VYWTdOV3o1NVRZU05kQmZUZGs1d2x6?=
 =?utf-8?B?ejRWdDdsemxDaDlWZUVkVHJUMzA0NnpWalpPMExocWNnRzNJTUtDeXU0Q2tU?=
 =?utf-8?B?RVhkVFFuZTFOZFRHdWpSZGxJam14ckxZb0tKNjFVQlZicU5VcU5FdmpLb3Zk?=
 =?utf-8?B?Vm8wSmVnRTR4djNXOEpyYjAwMGZjWkdHK2FnWmxOcURnYWk1UkJQUWVRVUtz?=
 =?utf-8?B?b1MwdnRzeVgyN0V4UUYxT2NseTFxeStYU2s3SE5Id0xZTmhzd01aMFpSMno5?=
 =?utf-8?B?ZWNkemlEWmJEcGRnTUFBUHFQMkNWaG9vQkJtU2QvQUJxZWEyY2xNUC9MS3k4?=
 =?utf-8?B?WWpjV25TN3B5Vnc1QkkrdGk5eVBManhGWGV5Z3lrN09EQkZ6UzVxT0lUbTEr?=
 =?utf-8?B?SUdwK1RsMHpUTUZaVGhGMlBJZWh4QU53R2w0eStmQVNjdm5SaGRDYjZxZnVv?=
 =?utf-8?B?RUFYTDNscG55TzA0THN6NlFxMnRuS3FNK3lTWjdDNWJrRm8rbWtoKzh5Q3p6?=
 =?utf-8?B?cHhrTk9hL1cyUGsvbUZGWjVYUTBjdm1YeXJPMEo0clMyTEIxMmdFYzNrU3cw?=
 =?utf-8?B?MXJHeUswZlNxd0xueHdIbnVoOVAwNkVTRmZ6YWNEbnpxdUR3Z3VwUlRSZ0ps?=
 =?utf-8?B?aUJac0hscjJldzE5OEs3ZGN5QzZlR3NYQ3hvOUp4dG5Fb1FoL2sxZTFQMlVt?=
 =?utf-8?B?R2twR2tsVHZvSHNRTGRQb0VTRnhkR0NFVno0YkJ4OU44RlpyMWFzUk54c1F2?=
 =?utf-8?Q?rOWVt82KFoGPLMJ9NlLQ7OM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd92c2ec-c5f3-41cf-20a8-08de328e5fd4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 17:07:00.9616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1oXGUUFk59LADtn3IGEykyBV4w7llLZa3lZaHHFGlUTeamTcO+hPQx/VaP1k9K/jJryejqwBFJdJchygZuFN50J+SkG80iIjq7vg+4036c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAC42FDD50
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

On Tue, Dec 02, 2025 at 04:48:02PM -0800, Umesh Nerlige Ramappa wrote:
>SoC remapper is used to map different HW functions in the SoC to their
>respective drivers. Initialize SoC remapper during driver load.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2: (Ashutosh/Lucas)
>- s/remapper/soc_remapper/
>- return status from init during probe
>- reorder patches 1 and 2 from earlier series
>- fix copyright year
>
>v3: (Michal, Badal)
>- Kernel doc fixes
>- Alphabetical order for headers/objects
>- Add has_soc_remapper
>- Drop unnecessary headers
>---
> drivers/gpu/drm/xe/Makefile          |  1 +
> drivers/gpu/drm/xe/xe_device.c       |  5 +++++
> drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++++
> drivers/gpu/drm/xe/xe_pci.c          |  2 ++
> drivers/gpu/drm/xe/xe_pci_types.h    |  2 ++
> drivers/gpu/drm/xe/xe_soc_remapper.c | 24 ++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_soc_remapper.h | 13 +++++++++++++
> 7 files changed, 55 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
> create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 0eadfeda67d9..06c3987afd4c 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -115,6 +115,7 @@ xe-y += xe_bb.o \
> 	xe_sa.o \
> 	xe_sched_job.o \
> 	xe_shrinker.o \
>+	xe_soc_remapper.o \
> 	xe_step.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 92f883dd8877..b54fc5852fef 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -61,6 +61,7 @@
> #include "xe_pxp.h"
> #include "xe_query.h"
> #include "xe_shrinker.h"
>+#include "xe_soc_remapper.h"
> #include "xe_survivability_mode.h"
> #include "xe_sriov.h"
> #include "xe_tile.h"
>@@ -906,6 +907,10 @@ int xe_device_probe(struct xe_device *xe)
>
> 	xe_nvm_init(xe);
>
>+	err = xe_soc_remapper_init(xe);
>+	if (err)
>+		return err;
>+
> 	err = xe_heci_gsc_init(xe);
> 	if (err)
> 		return err;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 9a9a8eb84a78..450fe703a3b9 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -315,6 +315,8 @@ struct xe_device {
> 		u8 has_pxp:1;
> 		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
> 		u8 has_range_tlb_inval:1;
>+		/** @info.has_soc_remapper: Has SoC remapper support */
>+		u8 has_soc_remapper:1;
> 		/** @info.has_sriov: Supports SR-IOV */
> 		u8 has_sriov:1;
> 		/** @info.has_usm: Device has unified shared memory support */
>@@ -555,6 +557,12 @@ struct xe_device {
> 		struct mutex lock;
> 	} pmt;
>
>+	/** @soc_remapper: SoC remapper object */
>+	struct {
>+		/** @soc_remapper.lock: Serialize access to SoC Remapper's index registers */
>+		spinlock_t lock;
>+	} soc_remapper;
>+
> 	/**
> 	 * @pm_callback_task: Track the active task that is running in either
> 	 * the runtime_suspend or runtime_resume callbacks.
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 75e3588242c7..ec0fed691fa0 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -413,6 +413,7 @@ static const struct xe_device_desc cri_desc = {
> 	.has_flat_ccs = false,
> 	.has_mbx_power_limits = true,
> 	.has_mert = true,
>+	.has_soc_remapper = true,

Needs to be enabled for BMG also, hence the BAT failure.

Umesh
