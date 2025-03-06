Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0033C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 20:15:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7375A10E32E;
	Thu,  6 Mar 2025 20:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2iLOGEk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA07B10E32E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 20:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741292106; x=1772828106;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qoOWGjR2KHDdY0POmh9LRvu3vHPoxI/sfxzksH4k/Mw=;
 b=b2iLOGEkWnd3znB1kjJkZ5ySC9yS8pWf02QqedYLLOZ1uQjgw+eddtES
 LHVD/VeUBGH1Rg+HT8hfs7ohCqfFhx9XATHQ0N7LHoz9vlxS3BqrqRkyE
 WBM60y9ZkGYhTthci1kCWdZGlyKD7rHY72OBZWas9IdlnEr6pTV7/5Veg
 yKYLjKOeAD+NzOoFfwNhuoX5DHcS0PdiZePR8E1b6WtQCImy/TMepZesF
 vsJj8DijnyqJOA37CSEIU8al/sIe+nnDxJpS09hSY0wItNjZvm99NxOGX
 aZRWGUk63E/VPGIJBtzjAD5Gggx5w30pPyDIBxQN/DhR5i5A7K9xQHh2B g==;
X-CSE-ConnectionGUID: k6hZ8t/XRi+nYEG0fvxsJA==
X-CSE-MsgGUID: 1MzM/gF7TuqGEHJdUe5bPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53720013"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53720013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:15:04 -0800
X-CSE-ConnectionGUID: sNh2Am2KRK+qiclH8DKGgg==
X-CSE-MsgGUID: QQMS4kBYSmSvLN3MQ0UYPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149919335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:15:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 12:15:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 12:15:02 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 12:15:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPSDO+S39taN1QzJA3lJT+JzOWAe6TVtnTnv3flIJqtluAprnmr+hpZX/RMPJ+EathzUbc7Tmh6Ot39ZJw0Z8P734sj/bjLuvkud74RdYWIoCRxzMxGpu/YakPJHzeeOtkcg1HVWFOgp+i6126NxWpO95N+q9n2JqLbr1TsZStsenr8rC490N0/PCu9PKgk1pwTDZ+OR5yusgq1jYFsc7v3HFGD825SvJf5q+UgdH5R9rrXIeol5o+N+0Rkj01k/PaBEwzeC3tjk8sqJN3whTntwHxfxhtMieW5rShxiBvjlSzDwdKW0kdq7O4PYFh9JqoG0l1B6V/6yzG2wpqTd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bu4veWZmjIEG/0dq4kZyY63CNo2KpZM+RAukauuHSiM=;
 b=KmJyEslfelzKMOXpbZKu/8mBV4RS8gdNhMG3LMAwlQzBc/9kJrm0u3JkB5qwU0Tf1UbyObV6Fgu5yHSzzbwD0CNCjJoEHMRNBaJzTHkuTLr+Su92qJCn1V1DVyBTDCWvTFqXJpOejwiQciDTRVe80uM/IekCSZWi2nBhKAcfDzpkaT3FOKSyT+TKQddY6LYHKhuMVjDor7ouc2Oc3NGQe5BAh+HY2oh0nFa4J4OwKcbv8TLvBDerdisObTVeCIncz2AWXs42WRFqnklWIsOWPxbASSxjFnUla73Uq8fvbZPUg7M24PeKtZXSATcDerQliPfAhR+bhPaD4rBNMd02AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB8174.namprd11.prod.outlook.com (2603:10b6:208:450::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 20:15:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 20:15:00 +0000
Date: Thu, 6 Mar 2025 12:16:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v7 3/3] drm/xe: Allow scratch page under fault mode for
 certain platform
Message-ID: <Z8oCh9kRdckHCrvy@lstrano-desk.jf.intel.com>
References: <20250228153058.1039188-1-oak.zeng@intel.com>
 <20250228153058.1039188-4-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250228153058.1039188-4-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:303:8d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: d60ab6aa-936a-48ab-3f7b-08dd5ceb927d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lsR1837OuCiO4Y6UbRGLugqzQqXZEbfjyAues/3FjjtOrfTPLcJxR/7h5eOT?=
 =?us-ascii?Q?GJxa1gLh+7WvNiWcX1Nd9XEoxHT7lXEOMViiAz6zLvGofSuGR0FKtlEte89D?=
 =?us-ascii?Q?Os9CXKVJagYe2A0odrow1SSuivI0w3j/6d6AnR3iSXUu0XOSJsA/Rvdi1hmx?=
 =?us-ascii?Q?Rd9Kr5WHOQqztVtpeDV/RKsMJabs5/VgTlejsHBgH/Q2nYjQCTLkspyCj9uh?=
 =?us-ascii?Q?b2h2fbmZGyOihC9/2f19AtyQxha29rLOeoZ541Fb43QsoMuL8a70HQRPKLVF?=
 =?us-ascii?Q?35FFxJr6J3YXhOHHVuCUNcq/R3SRt6HZqaGRT/exCx2EknvaRnWtJHCCs7z5?=
 =?us-ascii?Q?q1DGe8a6Mja54sbubimTjthOOH9Ehq/40g8VUkQnhB31HDXqyG9TCtFLTuDE?=
 =?us-ascii?Q?6+W/FQJei/U/OzIhORhv0r4xXyP7YIefwYuQfk+qvx1pfBptlk2PAQdleF9h?=
 =?us-ascii?Q?syaYZ99l+SIWXiu4M8rZKCTYILnQRB5SXcrAdxxWiZHYvcX7kbwX/NWN3XFm?=
 =?us-ascii?Q?2ys+by5Lx+3csIhUWsKXMfnxOzlUJEDFZFEikdVxZ4QLCJIt2kmyAY2HmScR?=
 =?us-ascii?Q?vdKQ5oCmMofRQStcnjuKcIHu8GGr7A5M/gJdJbITf3vQ8BWXd96MNTo0mnBH?=
 =?us-ascii?Q?9k6DTHavdLKbyUF/AC+aB4ujqrX5ahJL+S+IR+5DOqgBhZ3inCg0rThGRFlJ?=
 =?us-ascii?Q?MdB2K6T0dI57dzaEONTq8X4h3ofcvAfyNMJI9B8PaHxcs0YAgDrgBoEyooI+?=
 =?us-ascii?Q?ez8dP3d7DhqXTSiCNUQ7dse1trhYkKnnK6LeZq1ytYYc3XVYXs51prTWw59k?=
 =?us-ascii?Q?tGL/9aiDJFb8omBZ6/d6/x92f9lhMXRjUvZXVVRR1PlXgCY30ZIQUCYw3KsA?=
 =?us-ascii?Q?zzX1AeJ5/ar/jxNP5q6ocCkUPw7iqwyhR1/LmHLuBlHsTxu+R6lBnhTsTYRC?=
 =?us-ascii?Q?/Bg5HTd/1bVdzjCPMWDvlUAA1+T04pUVmsbDkoXBFURdZW3pJwW/pAo//kvf?=
 =?us-ascii?Q?wdilGISyAx300h4fVQ7mfXDyBq8e+r23SUBhi0ZWhDBza14awoM85d8uVHKj?=
 =?us-ascii?Q?NEt5RmY4Nky9J3Km5Fj7EldUQxhNoTuU+DgQkdy5qPF+MCT5IsmyHE0XWWyz?=
 =?us-ascii?Q?VMAFnYqKLYu0C4lcVLP5bc7NbrB6+ztMTGwg3wzclINQM4NN3/8d+8FAYfcS?=
 =?us-ascii?Q?Y5k1ghef8VkECe+Jf/rLfDPLCzCQtrfCcGeP/3Qce3HCEPqmuwl+Oztc9MFi?=
 =?us-ascii?Q?6sGhr0JwzXu6V99dqtH/ortVz8EfgLM/M6uS8A6jx5f7xfRFtYzShdA7rTnI?=
 =?us-ascii?Q?q3tfI0NvPvG2Xt4U1lep9nrzKScfCdOKKNX7ijAOFCV5kW2l6D550qMqvITB?=
 =?us-ascii?Q?nhRpBoFNCcS1NlXIzyy7PpvhF1TO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Lztrr1RAgibWgZpJ4W6d8C3YnBwTOaioCDSAVwmfSttfRoS6GMCqjjOR5Y6?=
 =?us-ascii?Q?lQlBqDn7i6Np2VG6TOGnsCpJzZ1HhsCFU5Qqvu8vAiZ27Cn0BRu6HiSCMNBd?=
 =?us-ascii?Q?2OW4WUevm4lUkyMM4bOKwiZBlk4BZqZQrLHbN9QLVTTbAiaBMu4rKS6arozV?=
 =?us-ascii?Q?zA5CwFi+9IdKuvCyhEe0PkKAqVB2lRFdDUkJBuu7dUMrGKen+BGGfEcARtFu?=
 =?us-ascii?Q?x25pB64KXcg9tJjS2i8qOZbfCFP2/yPuK0L0KAH1tOVLa9QRS5jq5JyOjfgl?=
 =?us-ascii?Q?Eaj2QMc6prohT9KOE7aKSrzCnGaYQWKDtZDR+B8RsFWZWt2BQ0UsqQ7psGw6?=
 =?us-ascii?Q?ERPlkNAIcqCmwKW+Mv+CZSQ/Tbtt/NOes3MV5LcYFjOcZ61TS6n4NhZdCSPZ?=
 =?us-ascii?Q?7sMsAXgR7AmbRh1Ra+UG0CnCoxbR/TrC2pJrNNvXPPMCQgaJ9RFwtTZPQDrx?=
 =?us-ascii?Q?EW+VtAEAX6vO/FCm6pwdldehgHLht9X33vOTrCZrjQXOqVZwFXn6+9Vrqo2m?=
 =?us-ascii?Q?hSviODGXeTsflI4ySR1F0+TbRRbcolt7mbNTmjFqMdIICukVjYmm+IMZxCaA?=
 =?us-ascii?Q?VZc4bXEVkhTiK2jhpu/MbiDhL2xvxIHa/CWN8sKMql8vG4dFyEdFi6yBtR4S?=
 =?us-ascii?Q?3CO/F1MFuHp9IZK6NXJsh1Fmeu4ekOq6e9GGbaSK56JjQFWC8Ivgf3F1lKVG?=
 =?us-ascii?Q?R6u4ElfypefWqre5/dkjWP0H85ejYGx9jnQBH2jUqMN534nHylSRg2m1krs3?=
 =?us-ascii?Q?fJwvM4lRwRJs2GjD5MWodnwTWbeYvI1Rzo+TUslmCv/yz+Z/JrIzeNyTl1Qb?=
 =?us-ascii?Q?jO5lPQ2e41X5N/AyjtMIIanvJY0AD7F/dhN41fkqmt9sEBsEizdHoknvVYud?=
 =?us-ascii?Q?3HFv0rE2UIc7HjzO8IC03y6ek02RA60rllbfMl6cagJ1MlVT9TZbGF2W/JuJ?=
 =?us-ascii?Q?gD4YS5kz8b1R5Gn4RMt165sOTUoR3lScG8cO8czUWCe52MPPTRln8h84S52O?=
 =?us-ascii?Q?yuzR7E59FQKh3YZ7hTSdH4sJzTfZ46E3bgVMnvPjrc3ciGmVpuZFKyMD+ifc?=
 =?us-ascii?Q?OnG6G/9SlEJp2HtJ8DiG+NOCq/Z9C1UFuYkQOMS1A15eZFEwiSlFwnMsTvGr?=
 =?us-ascii?Q?cmIREGkGGyJC9tI0cmZIcTOaQMb0EcnbOUZH0FV7pNvVNUzXy5bmbfoFlut4?=
 =?us-ascii?Q?ofRT7txEN46rCLz1JMF8G3He2HN+m+4XHoqwWyzSjhiPjcZmuQEeP6FO61de?=
 =?us-ascii?Q?4Zb8E5tmULx7oNQcy6BRupYz51CiFVT9e5wLZMYAqloq7ywTaIZni9LpCSqh?=
 =?us-ascii?Q?nE/ThLDNoa8fM7iwoNUDJPJIpW4nvcGBzMAlmHtSav124Og3+I8ssgrMAo9j?=
 =?us-ascii?Q?UdAPNWj0immcD4vqlKlx8q0IKjQtzq+lVm6vnoi1eP9ksyj0f+Wv6B1rVRY3?=
 =?us-ascii?Q?8OpIxBpYN9QCEqJlmqeElv9cV6BmZ/+E0OIAIE735jBxrljMTzIYsIRcokGP?=
 =?us-ascii?Q?abhBNk4x2tLjM+55QvUbxtNV3iDyJBCxMxtU50sM7igza7dv9AbtaZVkGMUU?=
 =?us-ascii?Q?CSYNZjGZ7xVfLZIgx5ifSUBm/GNM1XiCNarrR8Zqcji+2yCUkhz5abECOVFn?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d60ab6aa-936a-48ab-3f7b-08dd5ceb927d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 20:15:00.2943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpUiJ0fZ5B59Rk7wTa7geIyCkSLhqBbimolDbgdqUCC/RUUAKMbTcO8QDx5j8NmCpN/wVVIqmwclWAQ1w42PaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8174
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

On Fri, Feb 28, 2025 at 10:30:58AM -0500, Oak Zeng wrote:
> Normally scratch page is not allowed when a vm is operate under page
> fault mode, i.e., in the existing codes, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> and DRM_XE_VM_CREATE_FLAG_FAULT_MODE are mutual exclusive. The reason
> is fault mode relies on recoverable page to work, while scratch page
> can mute recoverable page fault.
> 
> On xe2 and xe3, out of bound prefetch can cause page fault and further
> system hang because xekmd can't resolve such page fault. SYCL and OCL
> language runtime requires out of bound prefetch to be silently dropped
> without causing any functional problem, thus the existing behavior
> doesn't meet language runtime requirement.
> 
> At the same time, HW prefetching can cause page fault interrupt. Due to
> page fault interrupt overhead (i.e., need Guc and KMD involved to fix
> the page fault), HW prefetching can be slowed by many orders of magnitude.
> 
> Fix those problems by allowing scratch page under fault mode for xe2 and
> xe3. With scratch page in place, HW prefetching could always hit scratch
> page instead of causing interrupt.
> 
> A side effect is, scratch page could hide application program error.
> Application out of bound accesses are hided by scratch page mapping,
> instead of get reported to user.
> 
> v2: Refine commit message (Thomas)
> 
> v3: Move the scratch page flag check to after scratch page wa (Thomas)
> 
> v4: drop NEEDS_SCRATCH macro (matt)
>     Add a comment to DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 3 ++-
>  include/uapi/drm/xe_drm.h  | 6 +++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 47051735f0e1..2356f12392a2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1791,7 +1791,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE &&
> -			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE))
> +			 args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> +			 !xe->info.needs_scratch))
>  		return -EINVAL;
>  
>  	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE) &&
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 76a462fae05f..7471eaa669bc 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -911,7 +911,11 @@ struct drm_xe_gem_mmap_offset {
>   * struct drm_xe_vm_create - Input of &DRM_IOCTL_XE_VM_CREATE
>   *
>   * The @flags can be:
> - *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE
> + *  - %DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE - Map the whole virtual address
> + *    space of the VM to scratch page. A vm_bind would overwrite the scratch
> + *    page mapping. This flag is mutually exclusive with the
> + *    %DRM_XE_VM_CREATE_FLAG_FAULT_MODE flag, with an exception of on x2 and
> + *    xe3 platform.
>   *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
>   *    exec submissions to its exec_queues that don't have an upper time
>   *    limit on the job execution time. But exec submissions to these
> -- 
> 2.26.3
> 
