Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11E3C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 19:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A662E10E1C8;
	Tue,  8 Jul 2025 19:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfWZ0qF+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B939C10E1C8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 19:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752002898; x=1783538898;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LzZV66RT568geQhUDhcna/xAQBggb4vqFLlqtnSn/Kg=;
 b=DfWZ0qF+Kw0NK05PraMQM37nf57o39rqqQGRrwdPnG4B21h7f7VEi+Ql
 cp8ZKvRbMxGYMIMlAt8vT6qpyQ3y2ENV7jJ1duQPhFIVTiyQuyg0nlf/7
 Url1KsVuw2Hf0GdzhbkLFFLr5disYCyo51DTLB7Mo96us2vW+I8zwuiJY
 RVcj41HHP0aMIBBoCa63KTf0ngR399lGpXQr2Tf/x87n7FGPhMq7x0FEm
 kiaQ/KiPL3dtEhGb3F+kqh/syEB4N/lfhEpJmdO/WmFFgFfb1J15bcKgW
 +E9otjjuEjprajrjjTZD2az7ThwVqktEEKuvblgd7FcN/9rj4qGDEHqNq A==;
X-CSE-ConnectionGUID: v4yklRnGTyq7SPG4/VbOrA==
X-CSE-MsgGUID: yk6DorNrRq+tq4aRGXBZJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58056208"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="58056208"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:28:16 -0700
X-CSE-ConnectionGUID: toYLLf0ARzCjWXRqXQyncw==
X-CSE-MsgGUID: 647dsnAARQO4t1OK6Irrdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156156428"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:28:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:28:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 12:28:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:28:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+JKUlCmWwya1yp89V9dRK8vRJyK0VQEamqShG3LbpSf0CNwJsCmJsgLzpPSXmzGqxk5kYNpvyNgPWj8w4jRBOWN9Ut75M43+b78eOYFAYhBvlfov8fHx5977cSR+puCm7cUs7b5ThzB2wyu8NGLDAN+MwRBVULTI1slgSv9qOvBDWJhNqmZgP6T7WkfpPx+b4LWmlA3F83Vr5jx77O99t4FBfToRNzqY9sQ/+McnTckbjm6PEgkEHf+HYUcd+fGJXMfwkg68mx7g1TUmlQFo1mJ8GMa5fuIuw9T0SNQKD4s10WuzMcloNxAW1j25c1GtutUq6YmwmoLMveIDoCZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRU44N7smH5zZORJ7BIoUsTd8OFv1wIBzxQmStiaKoo=;
 b=mmWCcc2eKHQs4Q+plSWLw6M6kUt6nsfOJvOpFeKo1sv0GwKT8Sza1vsmjUIKpDpsB2KsHDa+thj7Ejr80m+rCUmJ5pTsXxtHlKY/Y8CF0lhkyRZI5y2vRX4TTlJJ0+dE0ns/OOWht4ikMDVxWgq5elpKhbtmgJEMFOsLbsptGbpK7w/s1xApbBBIHndGUp0nfeL+YkCOq8w/LW1dLZOJgMcWEz3wNHfHVjayblFSquPTDnlT2sZuVDVS+VAgrRwczBH6yJa7jhWq/BY/LMdaLUYx4HIq+rjrgVq8A4rZx95Ek7oOLTBzvXlwLu87UQwGtew0VhyDV4A/WGlulqIrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW6PR11MB8438.namprd11.prod.outlook.com (2603:10b6:303:241::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 19:27:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 19:27:42 +0000
Date: Tue, 8 Jul 2025 12:29:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 drm/sched: Consolidate drm_sched_rq_select_entity_rr
Message-ID: <aG1xldwcBa9VQjXy@lstrano-desk.jf.intel.com>
References: <20250708122121.75689-1-tvrtko.ursulin@igalia.com>
 <175198539271.144352.4354396872897421005@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175198539271.144352.4354396872897421005@1538d3639d33>
X-ClientProxiedBy: MW4PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:303:b9::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW6PR11MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b36d68-f586-4e8d-e3b6-08ddbe55823d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CCJt3cXq9yamkrgB9jNZ+Gl25Ew6kFIDleqwlDoNn7QPNdsBgPekLjBDXC/Z?=
 =?us-ascii?Q?lrb8rKXkbdG7OBFb4T8ZcicQ9E0f6RYQpuXSTsoHcdCZpKjgqsRWNkIo9w4r?=
 =?us-ascii?Q?SjnjvNtRkJ69yNVxNOUQc1R+o5y6LArrHFibCJ5Y9GlO19KFluUU7diVCfnJ?=
 =?us-ascii?Q?9V4fw13rUxoWLtGj1K0wI2PIsOaC8OhvPVL0JnWUGUhn4d9qcbeRvk320eyY?=
 =?us-ascii?Q?hv7fcWUDaHfo4YJ+m5fUb6bgWypu76Lm3f6oh2QrUNRc7vXl0D2JRgk3hGUw?=
 =?us-ascii?Q?PBGB7Cr7RsENjx06i1dkcDWfzeGCT21rZ//74kjx/40ues60W+mwjmpoytTi?=
 =?us-ascii?Q?rF6pXhHK3wTTwHWQa+IHfhwtT73KKdcnft8aSqxq6OUM2bzT+sC0243U8nt+?=
 =?us-ascii?Q?cRVp7HCFFxk5w3m2eecvj6tK1G/645tVcJ6A2gb9sm4DVrsmhteFZfw0R76l?=
 =?us-ascii?Q?RJO/SYrWKl22eP747V2vmNEkJM+xNlI3BdPAQ6ayfQbcOqtKwf/aV5zrY+VY?=
 =?us-ascii?Q?UY3/XGWpcTbV2qi+A38u9uIEYnxXxjzhTR2GLeN+uRi1hruUc/4LzXrIHdrM?=
 =?us-ascii?Q?Q8cJT0Zb4f2boRL5gTKtPyFd10lDdpW6yvyDXm/B9qcLtaEVc06xbYCjcv+n?=
 =?us-ascii?Q?ovdmi16Fv3G27+Zgtk9dcAC7EcN0fZTXXX272aJcTYJzTZbsh2ktm9oA33Mo?=
 =?us-ascii?Q?80tE4dPrl3a/4j99eaQ6MX0BM/Qdc6cRu9uHVJIE8ULD6S/qTY2UDYsNsf5Q?=
 =?us-ascii?Q?+gkFAzDgYF74PUMakS9jHfjBv2eDa9skuW9c1E8PgLvNkaLjpu2vPXQ098fM?=
 =?us-ascii?Q?Nl7a7QcQWIQya14dDGnRGHMe58bN1hEBrUlGVxK9jGQ6CSMNxCVOId5Rws8e?=
 =?us-ascii?Q?j2aX/fEyhE7DSuyhe5yh//xtekQXljqT3rzf9lp15NgajfrLMLoVAwUQqymC?=
 =?us-ascii?Q?HDIzoOPbuDGAz2iSMnuGW7Q7YHuoOBzHhoiPiFD+/gVgDCW3yu+iPRgEO9ox?=
 =?us-ascii?Q?4osriafKJj1n6gyOzkANriSPEjVfvoXKulQZH0qdSX3PcO+rDal+MV9kKRQE?=
 =?us-ascii?Q?7pbX/gwzz3bfyWIx5draizLBhXTOfBDioCW1laiiIVl0eAj/BnnfmPeeAomd?=
 =?us-ascii?Q?45er0zMPmtubOhNkpv2sx28ZktyFP9uT61UwTFFW6I8u8L5aJE4oxt0ioVME?=
 =?us-ascii?Q?F9zd2ce9PbjpAQQ/HMNeVRKXkoZjxse+r0zp767xbrgFCpMDF27LlLJlteOU?=
 =?us-ascii?Q?v6DPzq2p1genxPcypjrJYNGSOrIEpV61KNmzeIN14jbA4hD7qbvktK/2emUF?=
 =?us-ascii?Q?9CK9tL3Zkujt0lpctPgLIrLtexykQn6SzCx/TRnCG4PtFdvx7//DdIpea5iy?=
 =?us-ascii?Q?bWORR3U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?47ogKPdhHswjcr6NV3sMz73N9fHySFeeJwYlMvvqAQVrJXDcK8SoRYJG8/37?=
 =?us-ascii?Q?L/4exBG4AzbQqnakvQjR2Rnsm3P3QWxfuiKZeqvmZimXLH3zSXf+LLI+HcYw?=
 =?us-ascii?Q?iUKW8i+xjoQDttvj4zaU9vwGl+/XDvfemYnNB+6axcisqO3OJrh7rZlQUpkK?=
 =?us-ascii?Q?XpH3LvbYwmTtRZwiErKv4IGL/UZoy83ri0Dyd6K/hDIAjG75+QF2YAvkfzNC?=
 =?us-ascii?Q?9UWCXyE9GMVCXj0UOEtTAfK5Lr7t8Wc+eepOufQN5x/0oKEasp02pvohbPZv?=
 =?us-ascii?Q?R1qev0Lv6q7BEXyM6xF02/W8UOxPYbKTTgqvq7ZsU+3jBswvhzuMgohmpbLZ?=
 =?us-ascii?Q?vC3JJn6mOES3fKS6nCBijbwn+eh6jG7Wd4oDSPkkSkfYytSj0NWdQ7XZqvgQ?=
 =?us-ascii?Q?MBKY5KiUnFaGnbiJTOXDqOriylnVl2KULzJn8me4WdDAnzOc9uFL+TJ0BSKr?=
 =?us-ascii?Q?L9w+rutRfAXvtmBmT/lQnr+PTg0d1uS+cOdKDeDofBZnQwiWw6ueHR273fww?=
 =?us-ascii?Q?UA8UznT+3PR8OM4hYsNOkpcNTL/dYrhoZCMM0+gRox029kj6o40kWjCQgzXZ?=
 =?us-ascii?Q?v8ORGCO3MnyY5jnVtYt/UYN8twDU30KGOBnxu+dDmaVl1RTJR6xmetyJF2dI?=
 =?us-ascii?Q?p0L6ngiI/IG+Md2awyb5wDNv6TbMXvUlQa9NNIivfs4P8+TkxxMRKuOyfr5X?=
 =?us-ascii?Q?sCFTBP2Biq6bPLY4niPyrpF+MY3q1IjCVclDUdTow5oB5hTds3ONu30LwDE3?=
 =?us-ascii?Q?6S3P+EaxDg8U1MLzJbmUiwFmyXYJ9dZyY0qhACa2ibLrW/zxm1GxR8LxVFjw?=
 =?us-ascii?Q?s3pmOd5oACb5pcltkeeAfVbsVRkxILbz4wCk88ZTsmDO/Xsrf9XJ39nLA4bP?=
 =?us-ascii?Q?pro7FivLqysw8b9aY4e7+uAC06ARyljeFi4QOZay4y+iKbALar2Oj7WP4TeS?=
 =?us-ascii?Q?5UltWo7A0ko9OKyb+Aca2FC/OiTC0v3dKO9JdJWps8tGGZWa+8ONTi8kzWMA?=
 =?us-ascii?Q?op0SzTgmVMl9AbS0PrNRGXZd4o5T3X5UHqo2dEqlc+OQUlrmfeWzY+4Za7aX?=
 =?us-ascii?Q?qd0kyKaThniDtGEoP1HsRYpgoUqR22mFe4eGcdB4a+AS4EPrZtgR+rYtdd7n?=
 =?us-ascii?Q?u98wkHBUE1YagR/IVds+Dzonk+qZzb03Y81zOnTLtg2aISdcN5fqsr6cNoVw?=
 =?us-ascii?Q?q5pUdEUUuOhG2zxqlQsi3p76XR9SWc6AR0DD4MNhLyvskEzsngOVdfgBUwCk?=
 =?us-ascii?Q?PCyI1QZzNhjNZT+5JCazbrE1HeZXvIYXLFalZX/YjByST7LE+9mOzT/roVAX?=
 =?us-ascii?Q?uThkJuECILg0LVGMI2gPvT4IauXkvkPh/AiVT34cuTlnweMt0mIb9yRj+OVd?=
 =?us-ascii?Q?nt33noqfFRzrZXOklKeFSrv2LO2qrezylxfnePactCiBPFoW94oCnSPcPqh8?=
 =?us-ascii?Q?uu9looufhbRmcw9CnENEtCL1cYa/5BCNFO/MiGAkrjFVofuGY3BvmKmjvrcT?=
 =?us-ascii?Q?CDESP6KRAS/q7asLMcPYLqn77If3yctOGy5Wsm+QQTrFAzErrMpYJzSTW42J?=
 =?us-ascii?Q?Pbr8t4HEGjJzZ9xV2whCXcqzBr8qC6WSVPDsSsZuL0B5740TU2FW32Bytyu7?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b36d68-f586-4e8d-e3b6-08ddbe55823d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 19:27:42.4371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChGy9hOzUNzNeGpaCQZVPns7nAVqLc4E8XIPMiRLKJIiT2YZ6eJ9f71O4fAWDe7mV7l2kD4JUHJcRuDv85zUsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8438
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

On Tue, Jul 08, 2025 at 02:36:32PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/sched: Consolidate drm_sched_rq_select_entity_rr
> URL   : https://patchwork.freedesktop.org/series/151335/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b_BAT -> xe-pw-151335v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-151335v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-151335v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (9 -> 4)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in xe-pw-151335v1_BAT prevented too many machines from booting.
> 
>   Missing    (5): bat-bmg-1 bat-pvc-2 bat-dg2-oem2 bat-atsm-2 bat-adlp-vm 

This looks like Intel's CI didn't run for whatever reason. I'd hit the rerun button.

Matt

> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b -> xe-pw-151335v1
> 
>   IGT_8445: 8445
>   xe-3368-8b32b5509128873da8ecfc06beefcb58927eb50b: 8b32b5509128873da8ecfc06beefcb58927eb50b
>   xe-pw-151335v1: 151335v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151335v1/index.html
