Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7FDC36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 14:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801010EBD3;
	Fri, 11 Apr 2025 14:34:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEvETGQh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C34010EBD8
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744382052; x=1775918052;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Ul8V4s/po5ynYFDxlVnyM7TprsMvDmD7lc+1QXMDzo=;
 b=MEvETGQhaDc+15IKYEODxDZePDQM+kwimAnbrUAsMCPqweX+vIoG1L6G
 jE1dENDBuHTxV56IpDy2KizwRGyCln7cY7XK72/8hfMmIu0N1vmYlT8Gn
 j7w/a23/kR69m6CATYlCj1leaz5O4YbtAgY2OkC/psRjPtIzCG9hEdZkg
 4+9C/pn2j2eoxHwgt0N2L+L9bssqKZHbR33FcLGzWjSkvwYBdne6bEnA8
 J0UhCcJPTs1lf95jTNR6jMVx3gUsFJWXxBsOysIIBrk5W3uUz3Hyp0LCL
 xZijcRDdEP4uaAnPsAnHVqzswODevPsx/unl/+2rSXHdJWwCSfeuOyqd2 Q==;
X-CSE-ConnectionGUID: 5O+vJ4ddRXa3CrDFBXd/iA==
X-CSE-MsgGUID: a/lyo2WuT0CTYJ7yCf6rhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="63479350"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="63479350"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:34:11 -0700
X-CSE-ConnectionGUID: pwfzq35+QymX93of6dy/MA==
X-CSE-MsgGUID: omp8ekUiS/WMg4EqVj6KHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134316019"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:34:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 07:34:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 07:34:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 07:34:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlrigYPrASrutD2rHiSTU9zJIxWr2sOjGw/fHa7qzVfxiNSWr1LJ69thb5SJYm6UTOC1HNXjgE71GoGLjUE7+9C6jCMrjKq4DZlTyYJEI/V/byCAp3OvUWFyjmehq80NPNzoZ/mpuZwODOLR+jhh28urEQGEn+71qnBjPziOPbUWS2eVUhs+nm8jjs81Gbpw5VjfqQCl0xJ6uy0EP4zGhVqFYpUFGI+OxUA4c6aT18YkuyUwvuwqNiKALAMC6bfEBSud4855hc8SCII3hyxHwGTRU1SaO64ae29bwrv4A0zPuMMxOa4tsBDH3NfIYlf3BlFFqFWx/Lgn57ToEDo8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lz+0DdWPp4qsd/DC3rvS1E1gxTOdPMuznvXs6BY/lNA=;
 b=crRGh+I6YKBhWoWRDzgmliui+dy7Kli4RFK544xJAbpRVUMjQ9wAezexeFNn49DshLPK8MW1kmt10v9ub1gAsGYJfzntcarjEpLnGm0AKkV7G8kowIRlgQs7k5aPCXKSqMxxRvfeWie8H0udOeeigElROn/GE1lx4vrWRDnaGTQaurn0vj5klY/4pVBwVN6gy69DUWVrlWtPbEbYhgzonyRXS+yJfRneKCHBK4ymm0nNESbZJI9XiHc20FJZ7M6R6qbP+ZxMsU6wEk0ReQIp6vrsTF8Qo7ipuppybCyadOL8KzmgO8KnH3ei1pcFqi9juIS4fQk+ZuvQ4yJ3Y9gwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 14:34:07 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 14:34:07 +0000
Message-ID: <51532b24-c672-49e5-a495-937e2fab3a23@intel.com>
Date: Fri, 11 Apr 2025 16:34:01 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v7 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
 <20250403184055.2317409-5-tomasz.lis@intel.com>
 <5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com>
 <d1c9b224-685b-4f1d-9776-f12131f15331@intel.com>
 <bb89a891-bc4f-4818-870d-77d14e9b4e00@intel.com>
Content-Language: en-US
In-Reply-To: <bb89a891-bc4f-4818-870d-77d14e9b4e00@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0036.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::9) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 6214c97f-be03-4171-7afe-08dd7905ea73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDZldmwxeGxrZzNtb0FrbkZqeDRHOWgzK3BkU2hGM05ZLzFHZnIvaDNrQzJT?=
 =?utf-8?B?YUx4bXBPSUR6U2pIVjNnTVhUaGNXakROMXY4bG5LdndlVDBmTDVuY3lDbHBr?=
 =?utf-8?B?UEhEakk4dWs0TXlRci9sWmJHcS9rRlBTRWFMaG9DNitvUGdDUlJ3UnFmNDlq?=
 =?utf-8?B?Qi92SURja0d5RUJHOXJLV1VROWthaXpoUWs2S2FHMHFIT09MMGR3K3hNL2Fv?=
 =?utf-8?B?QTFSTjRvRWVpWGovNUl2dEk1cCtDcXE2Tlp2c0xkM2lyUmdzRmhUSkRLOWY1?=
 =?utf-8?B?KzdNOHdTLzAxcXdBRmtjcDU1RjJEZG5VZTNLZEU1T1gwZEs3R0t3d01rcnlK?=
 =?utf-8?B?Uk9xb1V3ZXQ3WjROT0JDVkhockN5SnRZNzZjc2VSNzZ4TFlUN1Y3S242NmRN?=
 =?utf-8?B?azdWVGN1T0RYS00zeXd2UC80Qm55OUNiS2UzQnBCdzlLelRlMXNQdW1tR2Zt?=
 =?utf-8?B?dWJLTUNXdEliYzVmdG83bjFPWGFuc3owNS8vSzdIQ1FOYnRUczFoNlkrTXd1?=
 =?utf-8?B?Y1FzR29zZ3FEaDlhelI1aW96T3ZVbVY2S0RhelJSbjlrUjJQeDNJb3gyVHRz?=
 =?utf-8?B?cUdjZmhTcXgzbUNFZTZnOFFuRzNFd20vd1hJK3locURWMnFLVmVGQm9ScFhz?=
 =?utf-8?B?ZmVnaGZlbVVHMHBvamNXOVYzaTE3ZUZkdUxuRjRxNE8zV1hHWjVyZ0VoZ0NB?=
 =?utf-8?B?YjExMCtIN25ZMWQwbzQ5WXdaKzI2a1F5b25ZYS9zUE1XYlJWdU54NWZWVFR2?=
 =?utf-8?B?ZGZEcXNaUS9NY0dQOFRwK1ExVlFZSDRSQ2pPMk5NSkg2VGE5TitQUXRqSWpW?=
 =?utf-8?B?YVExUUhVb2lkSVIyOFd6akptNDhCZmFRT05yWGxETjhuMmZwSU95SXhPc29o?=
 =?utf-8?B?b3ZMZjhycnV5NzRsWXQ1NU5RYjNyZlU0ZklMUXFvenFtYzRwNU9ldFVGemhB?=
 =?utf-8?B?VmplVU9pVHVTTVJ1NDBWQkNiUmNWSUtIVG5aZExHeC9kZkFaSmxFVEtnV2ZK?=
 =?utf-8?B?RWErOHB3bzNQUkJkbXBuTXk0Z2Qzbk55cTI3VVAyOG5CZnp1dSsvSGhEa1Qr?=
 =?utf-8?B?d21mNGd3OTYwUllJRnplRm5VKzVDSEFKaDJjQjNwRVVjWnVLZUdkbDZWTVU3?=
 =?utf-8?B?MEFqaDFsM3lSU1VZbEd1MXpZYkVJZ3lVOTBkaUhtY1NPc1RMNHcxL1B4eWFS?=
 =?utf-8?B?K3NHdmRWSzdjc3YzTjRHcXBWUEh0b1FPcHFwZ0psblVVU1hFMnVHZ0hJdGJy?=
 =?utf-8?B?YTExUnV5MHdWR3VUbjhsT2VjUWQxNnFGRnRIdU1NQ3J4VFFzZm5HTEZhbU5T?=
 =?utf-8?B?VnkrMmNPRWpNQW96THVFZUQzTEtMakFINEh5Sm03S09BRFF0a1ZKZSt0TGFi?=
 =?utf-8?B?c0hlaFhnc1lza2lGRi92akdhRzNSMkVxc3ZWK1lqNExVRXIrMm1iVGMzcGxT?=
 =?utf-8?B?eFI3UFIvdXJhdFA1NDFjZExNR2VDajkybGRKeGRzNXhsNkJ5MThnQWx1a3pT?=
 =?utf-8?B?YWVJUDhsQVVJcXNSZjJhOTFFOEZpM2p5NWFVKzFFR0tKaDYxcGVENElsUmNV?=
 =?utf-8?B?RjlHTFZqY1A0aEdlRTBRNUd3L2xGendxZFdxVVpEUU1Vc0FFMVRJVVpydmht?=
 =?utf-8?B?eW5CSXViTC9vdHFjcmJVZzF5bThxTzFLMm12RldTZ0NmUUJuTzB4VFoxTXVI?=
 =?utf-8?B?SWNuMlEzdVE1U3Z0d293RzNHdFJXSmVvenhZclk3bS85MTZnTWZsay9WZjBX?=
 =?utf-8?B?UGpZbE9QRWdnVTJxNTRlaW5kSjRCWmNGVU9jTDlwdFVVQlFoa1VXUmlCTFda?=
 =?utf-8?B?U1dQNFkxblVGZmc4eTQweVNPS3VLUTl2N2Z3Y1gwWTU1YlpFOERMeVJIZHNI?=
 =?utf-8?B?aWgxZ2l1Q3FGSkhhTUlteDFnb2tpbm5WbUIyeTFXK0ZiTFRkbUJPckQyelZJ?=
 =?utf-8?Q?kb7Yw+0iPzc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGQvaTZGS0dqMVE5RmtMSnJVRERjQmtoZDR5WWg0dXJUL1loRXU3bWRkbkJL?=
 =?utf-8?B?U0tFdWt4cnAveUZGMk55aGVpQ09oK2RKU05GVEFZL05qY0Rwcng2Q3Ezd0NX?=
 =?utf-8?B?OG03Z0J1K2dNdmRPeUU3dVFkbTlRQ2xLbVdTVkpWa2NQZ2VMVnlIemNUTzly?=
 =?utf-8?B?K0NZbVhoWDBnT2VrRTU3L0M2SXNZRnpwazRCUGJGSHhDaHFxUVlwWlk0UXdZ?=
 =?utf-8?B?clk5K2VMNjhibVZQNGNJOEo1TkJId1pTYlVxaWlwaEtMWUJXVzhKUmVVQUNh?=
 =?utf-8?B?djNOSGFlWG5wSitvdS9WYkJYalhXSzZOeDVFSVBIaTNUZ0xEL0dlTiszRnVl?=
 =?utf-8?B?VG91Z0sremxlQVlCWllLZHNJSXNGRnVINGJOWHp3dmhFMDFoR3l1cnBZWVJM?=
 =?utf-8?B?UXJsUFY3Q0JoYURML3BHbUFVSDBoZGZRdjVsTDVOdllQV3ppdWFiQnVzNElp?=
 =?utf-8?B?UGJBY2xJM05VbFhYY2lwWnh3cDRIcVo4VVBvazB4c2pKQ21sMFhmRkpmaVRz?=
 =?utf-8?B?cWs4OTNiZFVrUlNDbEFRd2hMcW9HV2QyVFFMV2JidHA2Z0F4eCt4NW9XQjdi?=
 =?utf-8?B?a0RPM1paZ1U0UHV2ekN1UHVqT2ovSDBGS1pvNUt1VGNRYllObHR0a3FLWHhL?=
 =?utf-8?B?cEFQcncydWk1WUoxNGZMbkhObmtHaDdYaG5kd3JEc2dIc1JLYndRaG9iNlhS?=
 =?utf-8?B?STRPazJvOGhOeE84Y3FpZVVsSkEwNzFVTmhTR2hTWng3UDhRa3BsU0R5amNa?=
 =?utf-8?B?ajByN3E3d21BQUFoTCs5V3g3cVRvMGNBSHo0cjhzY3lONm9RZlczTjhhOVRM?=
 =?utf-8?B?K1BqWnNBOWNCZlZsY0gvMHhXMUpENUs1YytIZ0hpYTBCRnREY3U2bEZrMmho?=
 =?utf-8?B?Tml6Ni92MkVwWnhtZTdOekFXS0MrQ2lBQkNTOVRCTHB2cDBaTkI0bVZvbmNp?=
 =?utf-8?B?VTV4eGg4dDF2czNBaml1ZzVyU0tpTG9MSnBySVpPalRvMU1CajJkR1B4ak53?=
 =?utf-8?B?aWEvVnl5cmlMM1JxOUVnUFoxclY0dXVxN1VuQ3JuUkZqaDFJemhBVXZ1M2dl?=
 =?utf-8?B?WDBja0NjMHJ4c09mQ2NRYzM0V3pWZ3l3b1I0ajJxSTJQcEdsUHovVnQ5dFBB?=
 =?utf-8?B?T3BYeUUzRTFFYlc1WHd0YzR4MlQ0eml5dWJQMkMwZTV6Y0lHU3dWTXo2THBF?=
 =?utf-8?B?MktYU3NlSmR1YnVaQnZKM0FTZlNGTnRVQXlyRkxpTHUya1U4cGZUUGxqaEF0?=
 =?utf-8?B?dERWYjVKSmFsZlg2Z2ZIdXFKUC82VUVvdFpHaE9XTitLYml3UDBFUWhya2h3?=
 =?utf-8?B?cy9Bc3d3aHgxb3hJZmFWSEs1aCtSbkNBSk9ETlYyaUk3NklORnBvNFNhYnU4?=
 =?utf-8?B?VEw2bW93TENrWFZ0Vzc1b0RYL1QyWUkzaEUvM0NmZmdKT3hMOXhZelgweXpa?=
 =?utf-8?B?UTNWaVZuVWxpaE1kUnBTNEtDYlh5MzJ2N0h2RGdKYzMxREwydjk1SUlEc0l0?=
 =?utf-8?B?Y0FVaDNBajlvV2FFVjN5MGVldFFseVpQMlltNm11NlJTa1BkTldaQXRhWGkv?=
 =?utf-8?B?dmNHMkhweGVSL0JWSXgxb3UybkZLTnZYaG54QktudUdPb2xWZGtZUi9DTnhl?=
 =?utf-8?B?UGpzZmtGUlcxa0c4U01BN3NGbnI5elR1cXFBcy9PUmhrWDdTaGxwZVNmYmFV?=
 =?utf-8?B?MlpaQVErd0NYODE0aXRCSVdzVnJVbmtOeUJYYlhwUldiK3hNNHJWUkhpSTNQ?=
 =?utf-8?B?d0FkaHVVamlBV2Y4WUxrWGNZWi83dUlyTzB2VTc1R2k1MGhycGVwR24wbFpD?=
 =?utf-8?B?WGFPS2liVURCOEpoZ2RhZmdDMUNIVTdCekwwVGxnVjd2ZVNZRmhydU82MUhS?=
 =?utf-8?B?ZFdjaWpuSGNGTUR4SXJCQjVJY3ZoWGhNaTRZSEdXOUNoVnRGMzJTTlEyeHY2?=
 =?utf-8?B?aDBlVnZNVE8rclB0NUI1ZGpGd3dSbk02aWNhbWIzR3NMcHo5RzZUdE5POUdT?=
 =?utf-8?B?SUllaFNuRnUydE5xWjFkWE5ZT1FTNmNOaWN5MGgxT3lXREE0dVNBM2lzK082?=
 =?utf-8?B?VnBaSkhZbVZqMzdpdFgvZ0o4TU1JVW9LQlNQTzg2RktkeDk4YmU2Vzk4MS9n?=
 =?utf-8?Q?HmNJKTwEs1F90BoCJsfGud04L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6214c97f-be03-4171-7afe-08dd7905ea73
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:34:07.4562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMd0eVPM3jD7zs9OQnee4W/2Dvmpru1nMOAq4Rsvf22PGB1kEyCqYkBy2YU0n/mat5An7z1JpqGJcNUCpjxefA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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


On 10.04.2025 20:24, Michal Wajdeczko wrote:
> On 09.04.2025 23:09, Lis, Tomasz wrote:
>> On 08.04.2025 16:23, Michal Wajdeczko wrote:
>>> On 03.04.2025 20:40, Tomasz Lis wrote:
> ...
>
>>>> +    u32 msg[1];
>>>      u32 msg;
>>> or
>>>      u32 msg[GUC_HXG_MSG_MIN_LEN];
>> I want an array, so will go with 2nd. Though this looks like unjustified
>> obfuscation to me.
> using magic "1" is an obfuscation to me

It's not magic, the array has one entry because only one entry is used 
later.

Naming it something which one could theorize is any value, obfuscates 
the real value of "1".

It makes no sense to think of this value as some "min length".

So maybe I used a wrong term - this is not just obfuscation, this is 
misinformation.

> ....
>
>>>> +                     struct guc_ctb *h2g,
>>> nit: this is redundant
>> oh I see. by "this" you mean a spaced out separate line.
> no, I just repeat that all your fixup is about H2G and since we pass ct
> each helper function can easily find pointer to h2g
>
> passing struct guc_ctb * as separate parameter may suggest that
> something other than h2g could be handled (but we don't need this)

 From the other comments, it would seem you think it is important for 
the code to correspond to the idea, or mindset, behind it.

The idea behind this function is to fix a message in specific `guc_ctb`. 
Why do we want to hide this idea by optimizing out a parameter in this 
specific case, but we're adding incorrect parameters (meaning ones that 
are not used directly, need to be converted to another object) 
everywhere else? What is the difference?

> ...
>
>>>> +    /* Read header */
>>> you should at least assert that avail > 0 before reading even single u32
>>>
>>>      xe_gt_assert(gt, avail >= GUC_CTB_MSG_MIN_LEN);
>> This is a static function, and the caller is ensuring that. But sure, I
>> can add the assert.
>>> but since it is called in the loop, more appropriate would be:
>>>
>>>      if (avail < GUC_CTB_MSG_MIN_LEN)
>>>          goto broken;
>> I don't know what you mean by that. There are not that many
>> possibilities for an integer value greater than 0 but smaller than 1.
> caller just checks for avail > 0
> but we shall check for avail >= GUC_CTB_MSG_MIN_LEN
>
> and we should not make any assumptions about GUC_CTB_MSG_MIN_LEN value

In this round I finally agreed to the changes which removed any size 
read (xe_map_memcpy_from) and replaced that with one dword read 
(xe_map_rd_array_u32).

We are now making assumptions about GUC_CTB_MSG_MIN_LEN.  The only 
supported value is 1.

And even if it wasn't the case, the value is and always will be 1. We 
are creating false narrative around the simple value of 1. It is just 1 
and can't be anything else. Change to that would require a rewrite, but 
it's not even worth considering as that will never happen.

"avail > 0" and "avail >= 1" are equivalent.

>> And by the changes I agreed to above and below, we've already ensured
>> that GUC_CTB_MSG_MIN_LEN can only be equal to 1.
> we are adding checks for 'avail'
> we are not making new assumptions about ABI values
>
> ...
>
>>> maybe it's time to introduce
>>>
>>>      u32 move_head(u32 head, u32 step, u32 size)
>> We are overdefining a lot of things already. I don't think we should
>> press even harder in that direction.
> it's about avoiding duplicated code and wrap it into named helper

This is why we introduce helpers, true. But now we're starting to do 
this for trivial stuff.

Every programmer understands these:

head = (head + GUC_CTB_MSG_MIN_LEN) % size;

*mhead = (head + msg_len_to_hxg_len(len)) % size;

This is trivial. The lines are self explanatory. Making a sub-function 
to hide that isn't providing any benefit, It's harmful, as it requires 
the reader to check the sub-function instead of seeing plainly and 
directly what's being done. It also leads to more lines of code.

> ...
>
>>>> +
>>>> +/**
>>>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB
>>>> messages
>>>> + * @ct: pointer to CT struct of the target GuC
>>>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>>>> + *
>>>> + * Messages in guc-to-host CTB are owned by GuC and any fixups in them
>>>> + * are made by GuC. But content of the host-to-guc CTB is owned by the
>>>> + * KMD, so fixups to GGTT references in any pending messages need to be
>>>> + * applied here.
>>> s/guc-to-host/H2G
>>>
>>> like you have earlier and below
>> Earlier is a short description. Below I am using shortcut after defining
>> it in this line. This is how the long comments should look like,
>> abbreviations should be defined.
> but I guess you should be aware right now that your code is not the
> first that introduces the CTB feature, including G2H and H2G concept and
> naming,

ok, interesting argument. I didn't know we have the concept of "first" 
introduction which defines abbreviations.

Where is it? I see two candidates:

1. ./drivers/gpu/drm/xe/xe_guc_ct_types.h:        /** @ctbs.recv: GuC to 
Host (G2H, receive) channel */

This one is a part of struct declaration, so it clearly isn't the first, 
right?

2. /drivers/gpu/drm/xe/abi/guc_communication_mmio_abi.h: * Each MMIO 
based message, both Host to GuC (H2G) and GuC to Host (G2H)

This one is in MMIO specific file. And we're discussing a comment to a 
CTB-related function. So.. not this one?

Where is that "first" introduction which defined it? What rule do we 
have here as a general concept, one expansion per driver is enough? Or 
one expansion per file? One per feature?

Or.. is it all just arbitrary. We have no rules. In which case this 
place is in no way worse than any other. Maybe every full description 
should expand it.

>   so really above kernel-doc is not a right place to suddenly use
> "guc-to-host" term (which is a bad notation anyway)

Right, in the two other places the notation is different.

To be honest I'm not really against using a shortcut here, I just do not 
understand the argumentation in this review comment.

With the justification provided, I'd consider this as below the 
threshold of things worth commenting in a review.

-Tomasz

>
