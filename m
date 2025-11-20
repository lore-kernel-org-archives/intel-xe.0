Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4916CF9C72
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 17:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787DF10E78C;
	Thu, 20 Nov 2025 17:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSmO/DuI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2371A10E78C
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763658326; x=1795194326;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NbmwTUr03c7j+sZkiFmpD7xYtvzg+0RI+vLZIrK/Hmk=;
 b=LSmO/DuIr+TdY6YrolMS5wu5zTm1+vVcuWoSVit70T66Mtt4e6sOp2Jy
 PEmQUuF08/IZpFI8SGH+sBfQeCX4zUX6TQNEKuCOsvbSSjrF5znkiIPY3
 OCOlHad4Mkl8c7FN6xd7arpVJg7Ya1d6jiZXFGeDiaDb03kyxJOEHSuNI
 7+Ng15Wv0FFVwz+a78x6xJNuuUvoeAr4PtWIy0jN2AW7sJkXHvHMTRsx0
 HpbRQmM6XT3dL0qmPMcgRDPQcRWPCL5BUfsflC2gqWhf4uX6jQ+Obv3uC
 O89fm3cSvZl2GvE6SCyt6LVp6Vt2VvTtz5s81Ttuk1unes0tr7ir/Vdfi g==;
X-CSE-ConnectionGUID: 4V/ECu1uTSWZLLRpgvrb0Q==
X-CSE-MsgGUID: 3VQB0ofuT2eVpDS2LB0Sjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69353918"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="69353918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:05:25 -0800
X-CSE-ConnectionGUID: w0fw0IQsTuiQ+ypXjktfCg==
X-CSE-MsgGUID: lFrE7T0yRWmvsHH5FVNM1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="214780389"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:05:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:05:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 09:05:23 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:05:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4gEnAHzd+yx7Sv4BlKoOP8bGjCFt/3sXfQTc/97+EctgeGzyKoh5HR6udlrAQxJcn44jz93gpUh3Qfl5gz8HfrH6wuwNoOVQWQPLmPolsHCpoKWnruLQdv00Caqvv3X5Wl9woSGqZUVCBy4aGlPX3UTl0jKlI61gfm7b5lieCfCvVIdIS1/lnVnd7Tkw+qGPdp40IdR25N0+03y4u+gq33ifo+ztD4Rak8uSM2jQVRXlU6CfP8tP5i+nuYKOE2RaYiTJdl5qtt92js4oUwmncXtDNEZww37hQRg3Kd6uHjU58jjPsYGa2yMP8qkykpyFn60GGX42lkRhM3sqkqi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctF57bnn0fLU6s8APg2LTuvP0yJrh28Ijm+CK/nUVpo=;
 b=D+Pfz23pEASuNNzU7Nlk6XHDxr1SkfJOcHuTkcfnhcuxlXXrMmAiSoH0Cbwh3m5uY/C54QZBl2OWnpZDeevGaf3ZBK5g1hde5VXma9x+iQ2KuRVlRpaBT5cUblwJDHSwfLaxj9Bcm9DEUh+flZ/p1Spv1SFO0e0wdm1e0zPG2BR59NTdmYBEN4RkGf/756xTA5sJgICAzui0cl/0cO+lPm4bvA5JZYV86JOenVZuoAsNbuz1O5L46C61mpztkJn1MUsZe2ppJDwDH34uWllLc3Xj2n2VeNM0iolG0tD7gYqShPhnqsVUKVpoFjvlgeoZM9bW7m3zoFszcE407L0LUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB6751.namprd11.prod.outlook.com (2603:10b6:806:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 17:05:20 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 17:05:19 +0000
Message-ID: <98cde433-0f87-4e5c-82d3-64ce9acda5a9@intel.com>
Date: Thu, 20 Nov 2025 12:05:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/uc: Add stop on hardware initialization error
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251028153820.3139977-1-zhanjun.dong@intel.com>
 <aQEgDjfMVDYELrWJ@lstrano-desk.jf.intel.com>
 <55e77810-bf9a-4914-9eec-8984d29684da@intel.com>
 <84fa5b89-61e7-4aec-ab17-5057f9c52d74@intel.com>
 <aR025izk8Q10bFOl@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aR025izk8Q10bFOl@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: d4146dd9-6d3b-4596-d11e-08de2856fc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXJ3OW12bTBRMzNMY3J0ZGhHdEozYUZkcmNoWHVNNHlkT1VVQTV3Zy9EZzJ4?=
 =?utf-8?B?NGFDZUI1dFpXWHlsemJJaU13S2k1QXRZeWJwVnlycGVMTEFLOHA4N0JibzZv?=
 =?utf-8?B?MW9wNGpRMjhKdWxiRkw3dDBKbGZGMk5OQ3NjOVQ4ZndXL3JLNzlmelNHblpj?=
 =?utf-8?B?Q1g3djA5clZselQxa2VjOUhTSS9HelZvbHovc044cndRcS9WamQ5bUdFREVy?=
 =?utf-8?B?U3VEL0dMVGQ0eWxiN28wTjhaYlNyRHVhbWdwdGxUVXprZnJtaFJrSUw3K2ZF?=
 =?utf-8?B?eFVqSzUrNEdMSDdnbVpzTHpCZC9vOVBpZDkyMUVWekl6ZElsckVCTm5GM3FP?=
 =?utf-8?B?QXFUU0l3c2oxbm5EaUxQU1NtcFkyMy9oZXRkMjE4M0J0aGtqTUhLTDU1VGhv?=
 =?utf-8?B?bmlLbWZ1TjdpZEpFV0hlZENmRWNXTzZWWVNuanNRMHRBZGovdWIrMWM5aUlt?=
 =?utf-8?B?ZHZ1dWczT210Z056OXpNZWk3NmRZODd1cUxrQmtybFY0MUVkVVRoTS9FQjJq?=
 =?utf-8?B?NW9nZm5EL3drUjlDTWVNSVhaT2hxTTIzTUEvTUlJeFlBMzI4RDJvMTVOalZy?=
 =?utf-8?B?OTd3TW9TSFY3aW1ic3JHZEZIck9RT1BZa0JGMVZGWVlGSXo2NHlJbVlQL0Vl?=
 =?utf-8?B?SHhNa0RhVWg5bGozcFh4bU5aN1ErT1FsS1U0SnpYUzFoQVdNMUdFeERod1JV?=
 =?utf-8?B?eEhGRHdXTFphSzNZNjlkMVA0STc2ekRFYUx0cFF2cE1tTUVJUEpxZXhkU1dO?=
 =?utf-8?B?RHNzcjBUYnBteDBtVEhMWGkwY1AyeWw3OThXcWhEaHB3Ris4bm1sQjJNOEZh?=
 =?utf-8?B?a0l3ODNPdi93ei8xOGVJRm1JNXBMQldXZmtTUmc1ZVpscnZ1WFFjNGhjbTFI?=
 =?utf-8?B?ZkdBMmpwZXFXMWZBUUF1RVhaMmRBaFNmRXJCMWFuZXNpUVRMUjVkb1pHYnFP?=
 =?utf-8?B?VHNralBCQVFyYytjaTlpN01LMjNUbnN2eGpiNEtLVXRMV0RkU1ZSckJNNTFr?=
 =?utf-8?B?eS8ybTR3VWlPdE5LcmlTc1l0MTQzNnJ4ajlUOGpDLzVWT2d3d2xWZEJtQ1NZ?=
 =?utf-8?B?bG9kazVFNU1wUmNEOXkvMDRYME41czJWeHJyV3hpanNBcGxJWTVWVGJrRnE2?=
 =?utf-8?B?SC83aE9jaXlzNkgvL0FVT1Y3MEd0MkpxSHM3b2N6RVQwQkdwcFdkbHMxeEpQ?=
 =?utf-8?B?aVppLy9rZnFSSVZYam1FbkluOGYrNGllV0lWZ1N4WG12M0xwcW51cFVYeXhv?=
 =?utf-8?B?NzdVQkhFaHVadUVJRkRHdjdRdjZzZ1VMMkhmU0R2WFRzRjBWMTExT09yMFRp?=
 =?utf-8?B?NGp1VEhqRkdydUtzaTN4SkdjUjluOTRiTmVxd0ZIL1o4VCtRMVFtaXgrcGcr?=
 =?utf-8?B?Vi9Vb1U0WnBOZDc5YWVSbGs5Z1VYeTBmeHdWZUR6cnVSRER4WUVRRS9mYnNF?=
 =?utf-8?B?eS9zT0gyamdzRnVKL0NlQ3p2aGRleUZTZW1WWGx6U0pRb2xEUjFMU25ZT0Ju?=
 =?utf-8?B?VXE5RjRmcUpzWnpYNnBOeGRsaDhMWnFkVitMdGdTYkx4Q3Z3WWg0VEdzbEtY?=
 =?utf-8?B?UjhrS2o5OTFhSVI0MzVvZG5jaFIySlRLaWJMampuNnZLdGx1cUh2NklaamU5?=
 =?utf-8?B?cjBISy9UY1RLbUpjN0NMbU9zWHlGcFEvOC9QNjlkdmpHdUlJc0cxbWJyY1Z2?=
 =?utf-8?B?cDIzWTBqc0pPT0NzRTdJVXJOenZxWUpZVFRPcmFxUCtGbGNvcklPSGppRkZa?=
 =?utf-8?B?Nnh4RW1hc0RXWjdZUkVSc1VhV3dCTmxSUjc1YlppdkpRS1NSNFRKM0p6Zyth?=
 =?utf-8?B?THdzbjhLdHFWVE1FRTUzb0t1MU02MjFMbzZSM2hjMGZsWEtVZnZRdjdFVmFa?=
 =?utf-8?B?VTk0djRrazNkRGh1d2phUW0xUkF6QnhKdGUxbW52UmRoa0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRsYndOSmExTUJQaFpjME1wWjArLzA2clZORjZkdjRNYTk2REtXOXA5OU50?=
 =?utf-8?B?K2lKU2w3Y2hBWXpFbnBSRjJZNGlQVlc1NlpqSkMwdkZqMzJSUGs2aXc5TGxv?=
 =?utf-8?B?T1IzUERQeVh6M3c3SnVVUzlVS09xbjdjY0V6QkZ1cHptSlhmcWpnVlh6SVRJ?=
 =?utf-8?B?SXhnS1hxWktkSXprdWRBR0VqY3k1TjNzY281OWx4L2hrQkMwVFNQSm5WTzZ5?=
 =?utf-8?B?cXNWam1xdVd3dS95b0RtNDU1OWMzOVJoR2VwWkxoeE1RSTFMY2JHYkg2MkVY?=
 =?utf-8?B?WUwvMFhmT0wrbDlzdTdNV1IzVUxiSS9vVk8vSmc2cWg1RU1KZ2JGb1E1Zncx?=
 =?utf-8?B?Ujc1OUx0bnVaUU1ZcUZHRTJMMm9Pb2pLSjNvVkhRcGg2UzFCSGtMQXRzVmt5?=
 =?utf-8?B?VU1mVjZIYWlyUUJ3bjhnL0Z3cnkrRTUxRWhwSUtlVEZvOHNVSVNPNkFQRU9G?=
 =?utf-8?B?MDZOV1VSRWNSTmNyNTBmL2RnT0RTN3BzWkV6aWVTTGVPcTZIUUxOd3BNeklL?=
 =?utf-8?B?dkcyZSt1eC9VWndSL1dubGwwYWRsY0xmWGVoU20wVVZOc3dBRnN5WnB3NndL?=
 =?utf-8?B?WE9HWEx4WGpwbnRHaVVsYzRGM0JlVnRsQkI3Y1ZDSHhsU1hCVDBEQytYdnN1?=
 =?utf-8?B?VmpVL0ltQlppY1Z2WkhnMm9TTmZQK3k2eWFwY1B6aktOKytiUFB4Tno1YU13?=
 =?utf-8?B?cEpkak9HM1JzMzQ4WldrVHRUakpNY2o5R2lIYlZxYlRldnlaZmkwREhxZFd4?=
 =?utf-8?B?bExlb0xFOThRVmhQSEdPNUFpM3l1Uks1dzUrSldzKyt4c3U3bUF5RjVHMjR2?=
 =?utf-8?B?cnpxd0k0cGNrbUM0cHJEMytCRnNFT05xclRJbnJKVllhaGRlQnd1eHY2WGc0?=
 =?utf-8?B?ZCtGY24vVUJ3VC9ua25rdk9Nbi9JdCt2RXhadTFxcVVPdStodlRFY0Q3U0py?=
 =?utf-8?B?bGhHdUhzSStqdUZJLzBOVGp2WEF0N3BsYitWdzNDWEI1RGYzaS9WdEVSYkVu?=
 =?utf-8?B?R1ZjbE9PTXNDSjYwMnVncUVDM0d2SWIyR2NmQzBIY3lJYmRHQ0lQa3doMlBv?=
 =?utf-8?B?VDZVeEttZGNjclhuQXBoeFBXM0JOaVAvWlNmdjRleDdhRFFDUkNwK3JrTlhR?=
 =?utf-8?B?US94RkF6MG1KLzNCMU8zR3ZSNWpyVGRRck03Vnd3MmhZZXp1UVNQL2I0eGFC?=
 =?utf-8?B?aG1tTENVNWpzV3JyU1pZalY0ZEJZa1VvcGQrdHRFVWh4ay8xV1FYMFo5QjVR?=
 =?utf-8?B?WDJqdGwxbTBaL3lGdnZKRXcrelJxOWN5V1g4TkQ3SDhac3dpTkJrQTJHVzVL?=
 =?utf-8?B?T1o2MEM5QWJpMzRWOFpCdVhVSDR6cUdWVHB5cEhaRkVGTWlGck0xcXJCNW1T?=
 =?utf-8?B?NTJTd2licDdNN1ZHNlZBTk1oT3QrdFZaV25QK0JaVGlBRGpQam5vUkZxTkdh?=
 =?utf-8?B?T2VrRjRwalZtSUs2SzhiUXdEVGZBZG5JbDdmb2hDNW9rSENVNmJ5Ulh5Ymo3?=
 =?utf-8?B?UGVGQXd6aitSdjFSajVKSjZNMnhoVGJVcXNFV2VoUTJFcDFONmVBbVk4TDVs?=
 =?utf-8?B?SnJsUUIyMFNHYllrdUYxVnN6Zkc4bWxlcXpncTc2a0srbG5Rcmg1Vk8ya1Jy?=
 =?utf-8?B?OG5VamZna0JONVF4d2xQN21TQ3RsbWZhcFI0cVVtVkVTVHUyVWtnY096Yldu?=
 =?utf-8?B?UHBMQ2laWWlmOGs5bWxiUHZBNS9HYnp3L1RDTjhVRGZXeGtlTmhyNE4zbVhG?=
 =?utf-8?B?QWdrOUZ6UFYvNHFMY1pCK0VjWUp6cm9OTFN5ZGVLRjNSY3hkVDZrUkNxd0dm?=
 =?utf-8?B?Vm1aa1ZIbURqQUMwVUJhalkzL3h5UHBYTnpQOGVhSEs1cGRWNGx0UTFNYkRm?=
 =?utf-8?B?MUNLenBZY2JtbGtKY1dTTTdDUmJnb05oZ3Rlb1BOK09tR2djdUMwaVNnREx5?=
 =?utf-8?B?MHJiK2Z3NC9DUzF4Z3ZjVmZNVHNRQjkxdXVRVU5WbFQ1RTlmOXRkanhPVEtC?=
 =?utf-8?B?cW1Nd05DdmxMclQzZXlWZC9EMll4Ukh0MWxiTllRRUFFT29MZ2hNNGRVNXcy?=
 =?utf-8?B?NlY1L3lwSDd6Z0hMVWhQd1pxaGJkQWhHMWhTLzdzOTRtK2tBMFdGcU9vcy80?=
 =?utf-8?B?R0wwcFJCMHVvR2UzSkx2dlJ1ejJUTzNlZDNoRXRhUkhEV0xzRlZ6SlJsV0ZY?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4146dd9-6d3b-4596-d11e-08de2856fc1d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:05:19.6856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5wOm4bqt+OubP2sej+WtV7jBYWsLNappMYzr2IfTDl03HuNkTbJx22rWDY4QV/K1edk2Rlm+Vol5UccDg+3zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6751
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



On 2025-11-18 10:17 p.m., Matthew Brost wrote:
> On Tue, Nov 04, 2025 at 11:33:19AM -0500, Dong, Zhanjun wrote:
>>
>>
>> On 2025-10-28 6:36 p.m., Dong, Zhanjun wrote:
>>>
>>>
>>> On 2025-10-28 3:57 p.m., Matthew Brost wrote:
>>>> On Tue, Oct 28, 2025 at 11:38:20AM -0400, Zhanjun Dong wrote:
>>>>> On hardware init fail, the hardware might no longer response,
>>>>> add GuC stop
>>>>> to clean up exec_queue items.
>>>>>
>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
>>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>>> ---
>>>>> v3: Switch to xe_guc_stop
>>>>> v2: Switch to xe_guc_ct_stop
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_uc.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>>> index 465bda355443..00ca5883e006 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>>> @@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>>>>>        return 0;
>>>>>    err_out:
>>>>> +    xe_guc_stop(&uc->guc);
>>>>
>>>> If exec queues are destroyed later—after the submission backend has been
>>>> stopped—the final put on the queue may be lost, leading to dangling
>>>> memory when aborting the driver load or unloading it.
>>>>
>>>> I think you'll need to call xe_guc_submit_pause_abort somewhere to
>>>> ensure the final put cleanup messages are processed by the queues. Maybe
>>>> we add this call in guc_submit_fini before wait_event_timeout?
>>>>
>>>> Matt
>>> Thanks for review.
>>> My original thought is through xe_guc_stop/xe_guc_submit_stop/
>>> guc_exec_queue_stop, where will do clean up, might be not covers all
>>> conditions, let me try.
>> Tested with call xe_guc_submit_pause_abort in guc_submit_fini before
>> wait_event_timeout, works in some condition, while there is 1 condition
>> might not cover: for lr queues, it won't clear, so I'm thinking of:
>>
>> @@ -2375,7 +2382,9 @@ void xe_guc_submit_pause_abort(struct xe_guc *guc)
>>                          continue;
>>
>>                  xe_sched_submission_start(sched);
>> -               if (exec_queue_killed_or_banned_or_wedged(q))
>> +               if (exec_queue_killed_or_banned_or_wedged(q) || \
>> 		    exec_queue_registered(q))
>>                          xe_guc_exec_queue_trigger_cleanup(q);
>>          }
>>          mutex_unlock(&guc->submission_state.lock);
>>
>> @Matthew Brost <matthew.brost@intel.com>, Do you think this change has side
>> effect to migration worker? I can make it another function if true.
>>
> 
> Probably actually just change this function to forcefully kill all exec
> queues, i.e., call guc_exec_queue_kill. That is likely what I should
> have done in VF migration from the start and what you want to do here.

Tested, but got "RIP: 0010:xe_ggtt_set_pte+0x53/0x360 [xe]" and 1 
warning of non empty irq pending list, did you see this before?
 From other hand, each component shall free resources themself, that's 
why I will prefer to let guc cleanup all guc things; meanwhile, we can 
also have a generic cleanup at module unload, it should be able to works 
together, this time the generic solution hit the xe_ggtt_set_pte+0x53 
issue, let me know if this an known issue for you.
Anyway, let me try.

Regards,
Zhanjun Dong

Here is the dmesg output:

[  169.605721] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: 
GT1: GuC CT communication channel disabled
[  169.642429] ------------[ cut here ]------------
[  169.642434] WARNING: CPU: 0 PID: 2323 at 
drivers/gpu/drm/xe/xe_hw_fence.c:91 xe_hw_fence_irq_finish+0x46/0x120 [xe]
[  169.642633] Modules linked in: xe drm_ttm_helper drm_suballoc_helper 
gpu_sched drm_gpuvm drm_gpusvm_helper ttm drm_exec drm_buddy 
drm_display_helper cec rc_core drm_kunit_helpers kunit xt_conntrack 
nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4 xfrm_user xfrm_algo xt_addrtype nft_compat 
x_tables nf_tables br_netfilter bridge stp llc overlay sunrpc 
binfmt_misc intel_uncore_frequency intel_uncore_frequency_common 
x86_pkg_temp_thermal cmdlinepart intel_powerclamp 
processor_thermal_device_pci processor_thermal_device 
processor_thermal_wt_hint spi_nor platform_temperature_control coretemp 
kvm_intel mei_gsc_proxy mtd intel_rapl_msr kvm irqbypass rapl 
intel_cstate wmi_bmof processor_thermal_soc_slider platform_profile 
i2c_i801 processor_thermal_rfim nls_iso8859_1 processor_thermal_rapl 
i2c_mux spi_intel_pci mei_me intel_rapl_common i2c_smbus spi_intel 
processor_thermal_wt_req processor_thermal_power_floor mei idma64 
intel_pmc_core processor_thermal_mbox intel_vpu igen6_edac
[  169.642766]  intel_skl_int3472_tps68470 tps68470_regulator 
clk_tps68470 input_leds int3403_thermal int340x_thermal_zone 
pmt_telemetry pmt_discovery pmt_class intel_skl_int3472_discrete 
intel_hid acpi_tad intel_skl_int3472_common sparse_keymap 
int3400_thermal joydev intel_pmc_ssram_telemetry acpi_thermal_rel 
acpi_pad intel_vsec msr fuse efi_pstore dm_multipath nfnetlink autofs4 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor 
async_tx raid1 raid0 hid_sensor_custom hid_sensor_hub intel_ishtp_hid 
ucsi_acpi typec_ucsi typec hid_generic polyval_clmulni 
ghash_clmulni_intel usbhid igb i2c_algo_bit hid intel_ish_ipc dca 
intel_ishtp thunderbolt video wmi pinctrl_meteorlake aesni_intel
[  169.642869] CPU: 0 UID: 0 PID: 2323 Comm: xe_fault_inject Tainted: G 
S   U  W           6.18.0-rc6+xu4118+ #10 PREEMPT(voluntary)
[  169.642875] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER, [W]=WARN
[  169.642878] Hardware name: Intel Corporation Meteor Lake Client 
Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS 
MTLPFWI1.R00.4122.D21.2408281317 08/28/2024
[  169.642881] RIP: 0010:xe_hw_fence_irq_finish+0x46/0x120 [xe]
[  169.643069] Code: 47 60 49 39 c4 75 20 e8 e8 73 26 e0 48 83 c4 10 5b 
41 5c 41 5d 41 5e 41 5f 5d 31 c0 31 c9 31 f6 31 ff c3 cc cc cc cc 48 89 
fb <0f> 0b e8 f3 e0 00 e1 48 89 df 88 45 d7 e8 b8 cb 64 e1 48 8b 4b 60
[  169.643073] RSP: 0018:ffffc90001cf7970 EFLAGS: 00010202
[  169.643078] RAX: ffff888165294468 RBX: ffff888168b39d18 RCX: 
0000000000000000
[  169.643081] RDX: 0000000000000000 RSI: 0000000000000002 RDI: 
ffff888168b39d18
[  169.643084] RBP: ffffc90001cf79a8 R08: 0000000000000000 R09: 
0000000000000000
[  169.643087] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff888168b39d78
[  169.643089] R13: ffff888168b38028 R14: ffff888169fc1140 R15: 
ffff888103cc4550
[  169.643092] FS:  00007cc04f780940(0000) GS:ffff8884ebaed000(0000) 
knlGS:0000000000000000
[  169.643095] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  169.643098] CR2: 0000726861f772b4 CR3: 0000000167979003 CR4: 
0000000000f72ef0
[  169.643101] PKRU: 55555554
[  169.643104] Call Trace:
[  169.643106]  <TASK>
[  169.643114]  xe_gt_fini+0x42/0x80 [xe]
[  169.643278]  devm_action_release+0x15/0x30
[  169.643287]  release_nodes+0x3d/0x120
[  169.643293]  devres_release_all+0x96/0xd0
[  169.643304]  device_unbind_cleanup+0x12/0x90
[  169.643334]  really_probe+0x1bd/0x3b0
[  169.643347]  __driver_probe_device+0x8c/0x180
[  169.643358]  device_driver_attach+0x57/0xd0
[  169.643370]  bind_store+0x77/0xd0
[  169.643380]  drv_attr_store+0x24/0x50
[  169.643384]  sysfs_kf_write+0x4d/0x80
[  169.643392]  kernfs_fop_write_iter+0x188/0x240
[  169.643401]  vfs_write+0x280/0x540
[  169.643418]  ksys_write+0x6f/0xf0
[  169.643425]  __x64_sys_write+0x19/0x30
[  169.643429]  x64_sys_call+0x2171/0x25a0
[  169.643436]  do_syscall_64+0x93/0xb80
[  169.643448]  ? putname+0x65/0x90
[  169.643453]  ? putname+0x65/0x90
[  169.643458]  ? do_sys_openat2+0x8b/0xd0
[  169.643467]  ? __x64_sys_openat+0x6b/0xa0
[  169.643475]  ? do_syscall_64+0x1b7/0xb80
[  169.643480]  ? fd_install+0xb8/0x350
[  169.643490]  ? putname+0x65/0x90
[  169.643494]  ? putname+0x65/0x90
[  169.643499]  ? do_sys_openat2+0x8b/0xd0
[  169.643508]  ? __x64_sys_openat+0x6b/0xa0
[  169.643515]  ? do_syscall_64+0x1b7/0xb80
[  169.643522]  ? irqentry_exit+0x77/0xb0
[  169.643529]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  169.643533] RIP: 0033:0x7cc051926274
[  169.643538] Code: c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e 0f 1f 84 
00 00 00 00 00 f3 0f 1e fa 80 3d f5 2d 0f 00 00 74 13 b8 01 00 00 00 0f 
05 <48> 3d 00 f0 ff ff 77 54 c3 0f 1f 00 55 48 89 e5 48 83 ec 20 48 89
[  169.643542] RSP: 002b:00007ffd6edc26a8 EFLAGS: 00000202 ORIG_RAX: 
0000000000000001
[  169.643547] RAX: ffffffffffffffda RBX: 000000000000000c RCX: 
00007cc051926274
[  169.643550] RDX: 000000000000000c RSI: 00007ffd6edc3b50 RDI: 
0000000000000008
[  169.643553] RBP: 00007ffd6edc3b50 R08: 00007ffd6edc3730 R09: 
0000000000000001
[  169.643556] R10: 0000000000000000 R11: 0000000000000202 R12: 
0000000000000008
[  169.643558] R13: 0000000000000000 R14: 00007ffd6edc3810 R15: 
00007cc051da2000
[  169.643573]  </TASK>
[  169.643575] irq event stamp: 12958705
[  169.643579] hardirqs last  enabled at (12958711): 
[<ffffffff814a5da9>] __up_console_sem+0x79/0xa0
[  169.643587] hardirqs last disabled at (12958716): 
[<ffffffff814a5d8e>] __up_console_sem+0x5e/0xa0
[  169.643592] softirqs last  enabled at (12958490): 
[<ffffffff813d4ecf>] __irq_exit_rcu+0x13f/0x160
[  169.643598] softirqs last disabled at (12958481): 
[<ffffffff813d4ecf>] __irq_exit_rcu+0x13f/0x160
[  169.643602] ---[ end trace 0000000000000000 ]---
[  169.712267] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: 
GT0: GuC CT communication channel disabled
[  169.713546] xe 0000:00:02.0: [drm:guc_ct_change_state [xe]] Tile0: 
GT0: GuC CT communication channel disabled
[  169.814501] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked 
[xe]] [ENCODER:261:DDI A/PHY A] PPS 0 turning VDD off
[  169.814885] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked 
[xe]] [ENCODER:261:DDI A/PHY A] PPS 0 PP_STATUS: 0x00000000 PP_CONTROL: 
0x00000060
[  169.815194] xe 0000:00:02.0: [drm:intel_power_well_disable [xe]] 
disabling AUX_A
[  169.815505] xe 0000:00:02.0: [drm:wait_panel_power_cycle [xe]] 
[ENCODER:261:DDI A/PHY A] PPS 0 wait for panel power cycle (500 ms 
remaining)
[  170.317649] xe 0000:00:02.0: [drm:wait_panel_status [xe]] 
[ENCODER:261:DDI A/PHY A] PPS 0 mask: 0xb800000f value: 0x00000000 
PP_STATUS: 0x00000000 PP_CONTROL: 0x00000060
[  170.327989] xe 0000:00:02.0: [drm:wait_panel_status [xe]] Wait complete
[  170.353748] BUG: unable to handle page fault for address: 
ffffc9000e80f4b0
[  170.360583] #PF: supervisor write access in kernel mode
[  170.365753] #PF: error_code(0x0002) - not-present page
[  170.370836] PGD 100000067 P4D 100000067 PUD 100a8c067 PMD 0
[  170.376432] Oops: Oops: 0002 [#1] SMP NOPTI
[  170.380577] CPU: 14 UID: 0 PID: 2780 Comm: kworker/14:3 Tainted: G S 
  U  W           6.18.0-rc6+xu4118+ #10 PREEMPT(voluntary)
[  170.391996] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER, [W]=WARN
[  170.397587] Hardware name: Intel Corporation Meteor Lake Client 
Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS 
MTLPFWI1.R00.4122.D21.2408281317 08/28/2024
[  170.410719] Workqueue: xe-destroy-wq __guc_exec_queue_destroy_async [xe]
[  170.417551] RIP: 0010:xe_ggtt_set_pte+0x53/0x360 [xe]
[  170.422661] Code: e2 48 89 45 d0 31 c0 f7 c6 ff 0f 00 00 75 56 49 3b 
5c 24 08 0f 83 aa 01 00 00 49 8b 84 24 b0 00 00 00 48 c1 eb 0c 48 8d 04 
d8 <4c> 89 38 48 8b 45 d0 65 48 2b 05 76 89 d0 e2 0f 85 e5 02 00 00 48
[  170.441187] RSP: 0018:ffffc9000348f9f0 EFLAGS: 00010206
[  170.446357] RAX: ffffc9000e80f4b0 RBX: 0000000000001e96 RCX: 
0000000000000000
[  170.453406] RDX: 0000000000000000 RSI: 0000000001e96000 RDI: 
ffff888168864a28
[  170.460459] RBP: ffffc9000348fa88 R08: 0000000000000000 R09: 
ffff888134b30000
[  170.467509] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff888168864a28
[  170.474558] R13: 0000000000000000 R14: ffff888134b326a8 R15: 
0000000000000000
[  170.481611] FS:  0000000000000000(0000) GS:ffff8884ec1ed000(0000) 
knlGS:0000000000000000
[  170.489605] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  170.495285] CR2: ffffc9000e80f4b0 CR3: 0000000003448005 CR4: 
0000000000f72ef0
[  170.502334] PKRU: 55555554
[  170.505022] Call Trace:
[  170.507451]  <TASK>
[  170.509540]  ? __mutex_lock+0xae/0x1240
[  170.513347]  xe_ggtt_clear+0xa1/0x260 [xe]
[  170.517518]  ggtt_node_remove+0xb2/0x140 [xe]
[  170.521935]  xe_ggtt_node_remove+0x40/0xa0 [xe]
[  170.526524]  xe_ggtt_remove_bo+0x87/0x250 [xe]
[  170.531027]  ? _raw_write_unlock+0x22/0x50
[  170.535085]  ? drm_vma_offset_remove+0x65/0x80
[  170.539487]  xe_ttm_bo_destroy+0xe3/0x310 [xe]
[  170.543988]  ttm_bo_release+0x70/0x330 [ttm]
[  170.548228]  ? vunmap+0x4a/0x70
[  170.551344]  ? vunmap+0x4a/0x70
[  170.554458]  ttm_bo_fini+0x3c/0x70 [ttm]
[  170.558345]  xe_gem_object_free+0x1a/0x30 [xe]
[  170.562844]  drm_gem_object_free+0x1d/0x40
[  170.566901]  xe_bo_put+0x13e/0x1c0 [xe]
[  170.570802]  xe_lrc_destroy+0x47/0x60 [xe]
[  170.574980]  xe_exec_queue_fini+0x85/0xd0 [xe]
[  170.579483]  __guc_exec_queue_destroy_async+0x62/0x120 [xe]
[  170.585107]  process_one_work+0x22e/0x6f0
[  170.589086]  worker_thread+0x1a0/0x370
[  170.592798]  ? __pfx_worker_thread+0x10/0x10
[  170.597026]  kthread+0x11f/0x250
[  170.600230]  ? __pfx_kthread+0x10/0x10
[  170.603940]  ret_from_fork+0x29a/0x300
[  170.607655]  ? __pfx_kthread+0x10/0x10
[  170.611367]  ret_from_fork_asm+0x1a/0x30
[  170.615258]  </TASK>
[  170.617426] Modules linked in: xe drm_ttm_helper drm_suballoc_helper 
gpu_sched drm_gpuvm drm_gpusvm_helper ttm drm_exec drm_buddy 
drm_display_helper cec rc_core drm_kunit_helpers kunit xt_conntrack 
nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack_netlink nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4 xfrm_user xfrm_algo xt_addrtype nft_compat 
x_tables nf_tables br_netfilter bridge stp llc overlay sunrpc 
binfmt_misc intel_uncore_frequency intel_uncore_frequency_common 
x86_pkg_temp_thermal cmdlinepart intel_powerclamp 
processor_thermal_device_pci processor_thermal_device 
processor_thermal_wt_hint spi_nor platform_temperature_control coretemp 
kvm_intel mei_gsc_proxy mtd intel_rapl_msr kvm irqbypass rapl 
intel_cstate wmi_bmof processor_thermal_soc_slider platform_profile 
i2c_i801 processor_thermal_rfim nls_iso8859_1 processor_thermal_rapl 
i2c_mux spi_intel_pci mei_me intel_rapl_common i2c_smbus spi_intel 
processor_thermal_wt_req processor_thermal_power_floor mei idma64 
intel_pmc_core processor_thermal_mbox intel_vpu igen6_edac
[  170.617480]  intel_skl_int3472_tps68470 tps68470_regulator 
clk_tps68470 input_leds int3403_thermal int340x_thermal_zone 
pmt_telemetry pmt_discovery pmt_class intel_skl_int3472_discrete 
intel_hid acpi_tad intel_skl_int3472_common sparse_keymap 
int3400_thermal joydev intel_pmc_ssram_telemetry acpi_thermal_rel 
acpi_pad intel_vsec msr fuse efi_pstore dm_multipath nfnetlink autofs4 
raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor 
async_tx raid1 raid0 hid_sensor_custom hid_sensor_hub intel_ishtp_hid 
ucsi_acpi typec_ucsi typec hid_generic polyval_clmulni 
ghash_clmulni_intel usbhid igb i2c_algo_bit hid intel_ish_ipc dca 
intel_ishtp thunderbolt video wmi pinctrl_meteorlake aesni_intel
[  170.766822] CR2: ffffc9000e80f4b0
[  170.770106] ---[ end trace 0000000000000000 ]---
[  171.910242] RIP: 0010:xe_ggtt_set_pte+0x53/0x360 [xe]
[  171.915463] Code: e2 48 89 45 d0 31 c0 f7 c6 ff 0f 00 00 75 56 49 3b 
5c 24 08 0f 83 aa 01 00 00 49 8b 84 24 b0 00 00 00 48 c1 eb 0c 48 8d 04 
d8 <4c> 89 38 48 8b 45 d0 65 48 2b 05 76 89 d0 e2 0f 85 e5 02 00 00 48
[  171.933986] RSP: 0018:ffffc9000348f9f0 EFLAGS: 00010206
[  171.939150] RAX: ffffc9000e80f4b0 RBX: 0000000000001e96 RCX: 
0000000000000000
[  171.946202] RDX: 0000000000000000 RSI: 0000000001e96000 RDI: 
ffff888168864a28
[  171.953251] RBP: ffffc9000348fa88 R08: 0000000000000000 R09: 
ffff888134b30000
[  171.960300] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff888168864a28
[  171.967350] R13: 0000000000000000 R14: ffff888134b326a8 R15: 
0000000000000000
[  171.974402] FS:  0000000000000000(0000) GS:ffff8884ec1ed000(0000) 
knlGS:0000000000000000
[  171.982396] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  171.988076] CR2: ffffc9000e80f4b0 CR3: 0000000003448006 CR4: 
0000000000f72ef0
[  171.995126] PKRU: 55555554
[  171.997810] note: kworker/14:3[2780] exited with irqs disabled
> 
> Matt
> 
>> Regards,
>> Zhanjun Dong
>>
>>>
>>> Regards,
>>> Zhanjun Dong
>>>
>>>>
>>>>>        xe_guc_sanitize(&uc->guc);
>>>>>        return err;
>>>>>    }
>>>>> @@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>>>>>        return 0;
>>>>>    err_out:
>>>>> +    xe_guc_stop(&uc->guc);
>>>>>        xe_guc_sanitize(&uc->guc);
>>>>>        return ret;
>>>>>    }
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>
>>

