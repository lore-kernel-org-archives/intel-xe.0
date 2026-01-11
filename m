Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2439FD2502E
	for <intel-xe@archiver.kernel.org>; Sun, 11 Jan 2026 21:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E5710E009;
	Sun, 11 Jan 2026 21:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="De+d5pWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA01510E009
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Jan 2026 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768168058; x=1799704058;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VVUpczYGkbwwymbQUVpssS/Pkl+V4FjAyKVubILQnaM=;
 b=De+d5pWyFZwPYfJeS98fyCR02c2K5IfZAOL1sJCs9dB5ndBcVPprksap
 vT2PH4mWvTvfdC1U7GqHYaJT7MCSuPl4yl9DL81sAwrmRMWrCgoMDHJjj
 /e81sj4G2yapTEioO/m6yj/e6ByeJfq7SOeBpGXr5qfN55rUFlxQ2j3p5
 dHVByt8QfLACqTXY/oLiVtOAmrErp/vJNqbb7GiWsMwnAJ2uDPQulVzit
 cm2WHKUroMaqv2D34OQGfMcPopL8+tjhJM8AQDUc/MaCxEeobTOwokjTg
 hN3H1twBECnPjdSgzxYInXJMaO+p5HW8O0St++8pfsVBu5yPKoJ1sCdG+ A==;
X-CSE-ConnectionGUID: iOXmBKbbRV67fOlEHhqJEw==
X-CSE-MsgGUID: /nWERuYbSUaHhf+DzZs3WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73295107"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="73295107"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 13:47:38 -0800
X-CSE-ConnectionGUID: bX5SaYyXSsaaNN+IS7w/Dg==
X-CSE-MsgGUID: ALwOUvXyRcSN0PBoBltqIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="203563704"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 13:47:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 13:47:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 13:47:36 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 13:47:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFe2JE+2iQsHRQIyumFdwJlXMGNAerR4H5v1FK7xlVf+lIystPXk4yvGdZI3r8eLfU3HzQEINd+EaXJfTyjmUaCMc7YBFdYsr5OyBtap5DRXuOrXovFvC+wcf9mCpoJ0ZdBYnyZE4AoakFHV6FX+QoeHMWQHxtjfm9Y9T4y/irs3kWVGP3z3qRSVZst8foy89pF33hwJLDiYHZP1KA9DUysg/NTxv4KzzXeihUi2vGNH26p2lKC6zlQTnZ+TNPCvnlp+0H39ZpmyY0ehm5s3qzcW20pqXK+GPDlFetsC6l7sViB/hGwhp8WUDkSda616/QLSIZN30fLGnsgCjQwyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhfThi+WK2WyF5/op5Oce1FlhwuVIzYaWnQDsTKBI24=;
 b=OWSHlm3lBbzm0DQK7ANo9cqQgpleoJERU4ufQh6SfdB/Bzd4g1YM42hp8307fYQakIdu4Foc1JafDzI70HI6eOwRawFjwGRSHDMynwcAZIqoNBjzGqUqZ1geRA/yh0TCItREWnuv9+u2zcPRhQvqzDwkOUdVYv5rGksBpz/9oX1uv9EvAmgCqR3GXyPwmIQN4cq3fLPRYunqoU5vtArX5uIEsUqaVVgmnqZXHGGGuwBRtZtvhOcPqZnaNKDFsNeACZjCTqwV6KTtSjJVabmsQ7+1otdtos4QYmrghwlHgjjmeqV6FMy2OHxbcfA/8axY/8F44P9tdQqwyCuCXZeIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5789.namprd11.prod.outlook.com (2603:10b6:a03:424::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sun, 11 Jan
 2026 21:47:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Sun, 11 Jan 2026
 21:47:34 +0000
Date: Sun, 11 Jan 2026 13:47:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/cri: vram addr range is expanded to bit[17:8]
Message-ID: <aWQadEqbiBzu1ePh@lstrano-desk.jf.intel.com>
References: <20260110053650.2241351-1-fei.yang@intel.com>
 <20260110053650.2241351-2-fei.yang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260110053650.2241351-2-fei.yang@intel.com>
X-ClientProxiedBy: BYAPR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: b079d3c4-f995-4c52-7f78-08de515b0787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVIwMS8vT1B1bDNOZ0ZXaFJIS1JnZG9pMCsrN0cwUlNaMlkzTWpkc3lBVGRh?=
 =?utf-8?B?MzlUM3kxOFJ2dGovZ1ZzVXhqUjFlWHdxVlM2dkU5d3ZLOVhPVTEvcTRFUzZz?=
 =?utf-8?B?YXo5b3JWYUtrU1pWTEpRalUxNm9EL1BHVWdyRTdsWHNOVnpmQUIvOThqTFE1?=
 =?utf-8?B?cVVwblFONGh3c1o4Nng2OFJVWHAzSDE5WksyYkRucHJQZHpNTXBWTjR4NXk1?=
 =?utf-8?B?dWdWK1FibGZkUWE1U3JpZzJpME5MQ3VaMUdHZ2VLMVRnMmNYc2YwVUdnNk8z?=
 =?utf-8?B?OEVGMFJieUdkdHhUSnFNM0NvblBjTzZDRlRzTENOZVVIQnppMnYvdVB5cytu?=
 =?utf-8?B?aEtjSkVuV08zZXFTNFBpT094VlQyY2xwRHNsbHBHcnZuWkNtR3FXSWVCWnkz?=
 =?utf-8?B?WDl6bWlCK1BZN1lNZU9ZQTZHK3V2U1RyL1p3UlJneWh3VkcvcklBSEU5aTMy?=
 =?utf-8?B?UTNzbHUvY29XMUFhTkF3NXZzM2h4K0k0THN1OWtqTHVDZGNaOWR6UngzRTdU?=
 =?utf-8?B?RlgrVUk2NnJtSkpEN05nOVdpRDJMaGNaRWVidEtlc1NjYnpFbU5BZy9ucjBE?=
 =?utf-8?B?YkQ5ZTRHMnNJcGNFdXNpK2VuUEw2dFFtMVFHM1gwOVNEajlKOXFnSnlzME01?=
 =?utf-8?B?bHlYdjNWSTFPZk9ZR2pOUHBkMGdXYjV3UzdFam9ocjA1b1JxNnFSVW13azB1?=
 =?utf-8?B?TlhnbldTRXd2N3VqUmM5UVB0SEpTWVVzaVFMTDRmZnlsQzhZdGliMDhYQThO?=
 =?utf-8?B?QzB1L3dJczY2ak5KeXNBamVGR1BNM1Y1N0NnYW1hQk5VSUdiZmNCZ2FnSFpH?=
 =?utf-8?B?V2dpR1VDNlBjcnZUOHBXMGQ3ZEdFbVlSVE5TVGtxV0VvbHFyemwrNHcyb1l0?=
 =?utf-8?B?ZS8yd0VLV2sxMml0b0lNOUgycWd4ZlRmT1pWZ3JXbDRZZWx3eHdySjUxMGtT?=
 =?utf-8?B?U1pWYlJ6SVNoeHUyRWd5TjNZT1NKTXg1L0g0bFdJOGdNNjhGNEpZNEp4cnN0?=
 =?utf-8?B?NS8yU0ZYSzZjbjY3b0huUkxNcXVobWNySVpDR2VOTEVaY1BHVnM0bDZmWWlm?=
 =?utf-8?B?WkNyNkJCNENOZWE4UVc5L3phNGV4d3oxMVVvVTdkSmExdnFWbmFCNWUzZmFa?=
 =?utf-8?B?VndwSVdXeG5KdmtEQ1VGU0QzdHB1dVZwbnVMd1RGNDJlS0NrQTd2ZnpTZEtq?=
 =?utf-8?B?TlpKTWpXZ1U5SnVVUTM5RG1LS2xxYkU1ZmVzbnhuYlM3aEZjdmZzRlh0dVdR?=
 =?utf-8?B?UGNQVWNveHpldG9HNkJTbjQvVU9qcHpoYm9XZE9ueWx3VXdHejhITXhCZGM0?=
 =?utf-8?B?bDRIc3pmc1l4VWZ6b0RtSGFIY0JiVUJvb1d1WjBqdnZSUHJhRjRNRVFvcUZK?=
 =?utf-8?B?OWZhWFFNL0NWb1hLZTF6N2dGMlJxRHprRGxlaDI1bHBBVktuT3h5dXV3aHlQ?=
 =?utf-8?B?SGM1UkxrMG03VUJ1dTc1b3FITDZIMThqY2NUb0hYQ3l1YmM4enE4UlR5OWU0?=
 =?utf-8?B?WDJIYmxsQnNiZjFZWmF4a0VDbFk5L2p2R05POG1jU0ZOb2FEdzV0M3IxbkpW?=
 =?utf-8?B?UStKZzY3alIwc0ZjVWN1TFhKZi94NnVINXllRWtIQ2t6SnFVZDd5Q2ZBRXhI?=
 =?utf-8?B?QlVaclJPemdkc1JxSTJBeGRrNG82NFNuUy9HcjhhMFNaL0g3Rnd3c3FwL0U5?=
 =?utf-8?B?S3B5WVIwanc2RGVPdk1YTUVxTjQ4b0FyNCt2UkxhazFHdGJJeGpkbWhyL0VY?=
 =?utf-8?B?UGNzRHAzRElGbmZxeUY5VktZSmNhZXVETVh1ZGpuOWxlY1JCc3oyMjlCMDRM?=
 =?utf-8?B?RlV5R2xzZWdXQVdZNGNUcnZCcnVaUGQ4YzhxMnhQeHFRclFSMGg3ZHY0aWlG?=
 =?utf-8?B?NWxPaUFnN0xjRWxvRkRSZnFuTXZKSjR2UUEwdDNEZ1NGTlZnNTBuTFVUek9r?=
 =?utf-8?Q?jhVxuJ2SbC5/34tOkG5mZZZbs6yyK3pS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjE0R1FWVU9ER2JjSDJqemJMMzhyWXRWSUhKMGVEUXU4Y1laZUMvRUQ2S3ZE?=
 =?utf-8?B?cXhMMis0VGtiOUNLQ2FneHpOK0ZZeG05Q2t0VFQ5Q0c4Zk1TRU1ESy9heTk4?=
 =?utf-8?B?dDBlUDJQWG9JVndkcjBwNndKUFBOUFlqQ2JrbGlVSi9HdklLNm4wTHJjd1F4?=
 =?utf-8?B?aHhXSHk1dkRSKzh1S1FlMTNGMlczYnhjRE4wcFRaUEk5YytmaTJBYzZqdlR3?=
 =?utf-8?B?Z2tCcEhZc0FCYjlELzBYN2NnYm1LVExwZy9kNThnWnVmWVhFVlFaVU1LcEQ2?=
 =?utf-8?B?OVU2T1FNU0VoblR4RVV1UUFxSlNCU3NVN2lWMW1WUTlVeUV6ZFJYK1p2UWcx?=
 =?utf-8?B?SENvSDJCclNGK2docENpUEw0eXBIcGI2THA5SHJ5a0g0Vk9jeEIrMm5QMGFB?=
 =?utf-8?B?dUdLVDFQeWlUNUNvb3dsclBzeFNjZTlHaU1aM2xCdnU3dEgvUjUxaWxVeHVQ?=
 =?utf-8?B?MTVyRmJNOHd1b0VDcTBic05Jb0VRMFN6NklubHBia3lseHdSQ29IZmowTmxN?=
 =?utf-8?B?aXJXS3RpU202R3hGZWN3dWk5R2VSbE5RTGZqeWJFdGpiSDRrZzUyYy9TdlhR?=
 =?utf-8?B?dkpuQWVoNjNFZTh1NE44UUo3OFR0bWo0WWZrN2NyYm10SlArK0tXaFFoaTQ2?=
 =?utf-8?B?aGduWlZRVTBVWXc2SG1LbkN2YzJTZjdKTW5HbGxCd1NWcUV3RkxjN3FVVU1X?=
 =?utf-8?B?ZS9WajQ0RmJ6K1BhQUlYRVJ4MzBFdXFjV0EraTRZMlRiQ09KNWw3dHdkd3o0?=
 =?utf-8?B?aW51Uko2dktzejF2ZXMvN1IrU1J0NFBuemtUSzcvczJneFdEajRpNDFNUnBC?=
 =?utf-8?B?UjdKRkJaZW12S1FzNzlvUnlYeWxrRWxvK0lZTUk5SVo3UkJqVEg1dGw3blNX?=
 =?utf-8?B?SS9KMGZXVmZ2QVJacG1DQzRMRWZvSkg0ZEI5eDZUcHBMTWxVYzBsK3E2TE5o?=
 =?utf-8?B?ZGdMZHVxNTIvZCtLSStzdmZaQys1Vzg0OWR1Tlcxanl1anF1b1hsOTV3MVFk?=
 =?utf-8?B?bUVnWmJKdFVBaEhwb09xMThpYnoraVVRWFNEM0RodERQS1RGeFpWVmc1cW1k?=
 =?utf-8?B?czRpU3FUVE9BZEhhelhOT3M0UDUveDNjQzgyWVphengvQUorM1pQQUlZMVFn?=
 =?utf-8?B?eWozSWhiaFFZem1GS016VTZkWUlBcjgwTWJXb2pCZjlNU0NQNjlOWDVwZ2dU?=
 =?utf-8?B?Rk12RWhMWVpEMjRKMnlROHVCU2YrcS9uY2VkTjNsMGJCVERGS05md0NnZDJ4?=
 =?utf-8?B?aU1uSVROS3NOSGJKOXBpdHNBcmF4Q21ERGl1Rjk4MGJVOUw4bzkvV2cvK1Fm?=
 =?utf-8?B?eE5UYkIwL3Fnemt6M0tKcnJPVk84TjF3anZuUGR6V0h5SmdhSlI5cHhpVHdU?=
 =?utf-8?B?TGlINjB2RXdwbUJKNGpkL0tQZmkzMnBFOUpVd2RGdVVhQVN1YnNwdE9Tbzlp?=
 =?utf-8?B?Q3dpMXU5YmVZVThYeDNEUWsvNUdmQ3VabG9Oa1FURVcyb290QnIrNkJ3cXpZ?=
 =?utf-8?B?TG5ib3pOTEFrUXNpMFo2S0tqa3pjbklqSmg4MTlqOWg4YjdadDNQcEtmZ3ZG?=
 =?utf-8?B?eU8wYVFYOGhjSU84aVFjWllqVVhxQlZWN0xVVUlHVVpWeG5aWXlHNHJjUzc0?=
 =?utf-8?B?RTdld0hPVzlmN1VkY0dMZlVua2F6R25OaTdlUllGR0ZEd1hDMllRTVJGSW5y?=
 =?utf-8?B?WHFFR0FRWDVYSG5hRlZTZVlDVC9idTNOTWFvTTFTek1uSDJ0NHpURHdQS2Qy?=
 =?utf-8?B?RzhlMGVHUTNjNVFjaTVaYVZiTWdVcnRtYlRUYzBiME1kMWFnK0ZNdVdSL3ZS?=
 =?utf-8?B?bnZlSmFWRFZDaGVFbndtT216Z0JQeHR6L0VESlJPU2UwTklMOTlOTEtLU2lT?=
 =?utf-8?B?WnRGQ3dmU0RDWTFiZGdXUHJhWDg2ZlFOcDMxQVRIWE9lWC91RTVrRU1nOHRG?=
 =?utf-8?B?OU5Wc0svS1lLVDlpY0dOTkMvdytpdmE3U0duL1M2azU1QU1FV2kxKzhGeU9V?=
 =?utf-8?B?YUNvL2ZMeTZUbUo2YTQ1Uk9NYy8zdThiQ3EvK20vOUoxZUR0N0ZSelBDQzYv?=
 =?utf-8?B?T2JMekV5M1pVUzJUTkZlVFNHcVMwNExIMnZ3cXhxcWpoMFlJZGthN25HaEdq?=
 =?utf-8?B?a0RlbUM2ejRRUnJaTEhBZWxaZGM4czJjcjBidGw3VVZoRjB2SU1RMzhhZXZF?=
 =?utf-8?B?UTVJcU1ReTVvTmw0cnAyYWVmZGFjL3kxVFhGT3cyNE5BcSswT1A2Z3Jpcmli?=
 =?utf-8?B?RFNKWS9CV0w1b29VSlk2YlFOcjg4ZjlLb0JEbFVoMHhZNkIrV1c0RDZ1RDV2?=
 =?utf-8?B?dWl1b0o4V0NGeFhBclBTOWFMWkVBVjd6b1lIa3UxcjhKVkhYUWNvVmlLbUdn?=
 =?utf-8?Q?U9cNsnWG97Wutjxs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b079d3c4-f995-4c52-7f78-08de515b0787
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 21:47:34.4617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29Vak/aqM/jLNeqwZLBPyamQGcGJeQJAguR6Dd4bCKgyAda4owFzA/EvxhhwlUzsqeIOIVAfTAYK5pfS6qGKNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5789
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

On Fri, Jan 09, 2026 at 09:36:50PM -0800, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> There was a BSpec update to incorporate larger vram size.
> BSpec: 54991
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vram.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index c64d98bf1723..2159d9c33bb1 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -155,7 +155,10 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>  		*tile_offset = 0;
>  	} else {
>  		reg = xe_mmio_read32(&tile->mmio, SG_TILE_ADDR_RANGE(tile->id));
> -		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
> +		if (xe->info.platform == XE_CRESCENTISLAND)

I suspect that all future platforms will want to use GENMASK(17, 8), so
maybe an IP version check (e.g., greater than CRI, use GENMASK(17, 8)).

Alternatively, since bits 17–15 are reserved on prior platforms, they
presumably just read as zero—so another option is to blindly use
GENMASK(17, 8).

Matt

> +			*tile_size = (u64)REG_FIELD_GET(GENMASK(17, 8), reg) * SZ_1G;
> +		else
> +			*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
>  		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
>  	}
>  
> -- 
> 2.43.0
> 
