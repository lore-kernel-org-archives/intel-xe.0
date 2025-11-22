Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89152CFC51D
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 05:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086FE10E009;
	Sat, 22 Nov 2025 05:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNJ094RK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8A10E009
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 05:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763790456; x=1795326456;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ipbprTlFHHqEIfH2EAZFuMRaKom39eHqZ56l551usZQ=;
 b=JNJ094RK3Mc+h7TbU3aU/6CJrDNwEsnG637vVyGkN+1Qh3f0lEpAKVW/
 y9nxwTjrzUgTakH6BOZOnZRdFmCeeYJwmUKFGj/KBtlUpD7CykoAU8D/s
 ZzQqR+xYfb9/fSpgST0vfjrL12ChbZgk9ccsXBrQp406RdA6GHTWza4B7
 k5HXpA64OOx/nzwR4HgxQyClLmpMMrdnk9OOht+0PgivJEK+aje4zHFrp
 80jSfeA7RgLH11DMlRbhz+7JC8iXd8JKIlw54jTjnsbU9NzKbOscU3sVW
 s0fwt0hx7L+qGjtrFzyBxT7Avia2/xufv3y9DK7cRMWWOPmUEozvUPAma A==;
X-CSE-ConnectionGUID: L7mm80QURnmVoQpuUssAcA==
X-CSE-MsgGUID: OTP3sbQfTMGbJHVL/8CnTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65070263"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="65070263"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 21:47:35 -0800
X-CSE-ConnectionGUID: qF70UR5qR0KqCGjtbEnI0w==
X-CSE-MsgGUID: OE/wrIYtRBiZsTQUkFwSxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191900627"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 21:47:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 21:47:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 21:47:34 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 21:47:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9+s5dFdBdR7vEK+cSRIwrssXpI/spMjXZVHLtlwUtss5PVAj3Ue6rtYRqezspyc1NZW77vwo43bAmrnl9Jp+bbixkubL5C3kYsVkOx4w1+Dn89zWpAPEXvwRUEg4EiEHkf0aH4z55tlEUoUtlLxnJvQzR7k583WuigfbTXJCwuOrcup29XEe7ag1dAL7ERRXOpxFnH5IYELH0ZyxgN0H+CSKu/Tema7B5JmENbhBFj11QoQ4obk1ZRfP+eFACMVFqiigprKdVFs+MOPpvp2JWI+aI347SYUfHUax4BCtl/Xq8RcoGfhcF1VlpTJGH0ikGgiXw5CmvWtMz1RapkFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRdjUJFZDKdFTR/fKNscdZ4OvszkaQ4IFg1T+Ku9gCc=;
 b=ClAysI0c7fDXSJsdNUz7VjE42Dr6sASMxiuazzbM6796jyIWkX2Pvp8jfU319ZPcOUJz17SJ5e9qyGhDCGZmaHmkLWugYto3ecaB6al972aJ7biv/oonFbFLPNQz5HWeNnfsWfrTYRed4/mxy+LwLCrnASHZ6qSPKrnTjNwQkwua0Kx42SfZgPElwSRQ0GSRJZapwWHoEm3ZsPykYDiwdAXAwADn+/uW9AnsKd8lEY2Q8FrOz03aD5P48Z1Af85bt4HxHZfzrWEABI3IFzhayQytmAIpxKSH3lHeB2r25PU/yl1R7WNJzObYR4nRIJDc2o2koRuPStoYih+vSAYoNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sat, 22 Nov
 2025 05:47:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 05:47:13 +0000
Date: Fri, 21 Nov 2025 21:47:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 09/18] drm/xe/multi_queue: Handle tearing down of a
 multi queue
Message-ID: <aSFOXpGsDupxuKTT@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-29-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-29-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:303:8d::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f50201-0873-4969-73a1-08de298a95f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?34NfadPsVGuL/YMJLYFV2jIFegPmPO01Eh5iI8i414xWd6NoEmkseS3i/zia?=
 =?us-ascii?Q?ua5Nb1qYZ1psigN+x77fKzinai9VTZAirzPg5iTiVyM87MxFxR0lzn/N3vDS?=
 =?us-ascii?Q?ZIqrlrNmmU25U3ORScygZanGqGS58C/142GcyVZuz3PAwVRC2RYBNjyJQPSo?=
 =?us-ascii?Q?fXtydnNFJZGZZtxdOY3klCAbLlsL9BhbuoPejqACW9Id+duYFiHuVIV1RBsY?=
 =?us-ascii?Q?wnhzOVzsMjeNcq15vSENBN3i8taZkSQ1kCl6VILxdn9BVPgYM1hu6/pQZlSe?=
 =?us-ascii?Q?ZLWx1CeK0qhhqXVVgHefn7R5WCqBlUNuR50Gl7R+aEkFDGWRFb35Mu8UMdA/?=
 =?us-ascii?Q?0oYvccQ095dujb52KUMiy4IkLbMCU8LbSAb5zyeCTSKUJEHEQAp6l3Idyj81?=
 =?us-ascii?Q?Mr/hLczO8vQSDOc4WyHXB3qvBiAZp26FFinSQeKFDm/AjC0bCiZw1upuglzr?=
 =?us-ascii?Q?A8IGaKMU4bd8z2vFxpJFaEMgnczqQnsbD9dc0NCyis6iEt8ajv77ayrKCSQM?=
 =?us-ascii?Q?yEyeE52dWNjvrYGeh8qzaMVLm1ATszoYDsGI+d1b5tAxB3PYP9d3jWYCQ4jR?=
 =?us-ascii?Q?gfeAm+sNVptH1htDMK3MVVbdKbhjB9mGjVMwMPdakjQgEFegYHMpMBWsQEBA?=
 =?us-ascii?Q?SOzK5UnOOklNNX1n/I/G7gQiyGbjJjLVoHai9drrqELvqVISrrYcwTOPEok4?=
 =?us-ascii?Q?5GhcXclYkuMktZZ1u0siiSuEM6qS+8E+Dzz6yVar6RGAO34CFSCI94jeOW3B?=
 =?us-ascii?Q?572BDzwwL52Nbo5IA4dw7KXUjDWkzh1udnZZ0ZFXKeyz+ShuPmLEZRGvEjra?=
 =?us-ascii?Q?wdVpw4sYF3jSVvTARVjbsNmYBVtqnGZsxeZkyZQE1OM4gGfwWdwzO1R/zx9Q?=
 =?us-ascii?Q?L5XCBoZBp/QkoZPoeBMVVjOCMmNkHrly1Ql7HbjtMjON2ak8bYKwnrdePpeM?=
 =?us-ascii?Q?DAyLdEhd8UM4K3lWgpAetwabbYd2zrMDFpU4PQF6Wdm84jLtA2V4YDW2wNOL?=
 =?us-ascii?Q?sR6QBoFHxfxjtjTKBhMNPRNNc+ck6uu7CdbwTzFIY7Avco2zj0fBajfOKLsa?=
 =?us-ascii?Q?393fd82K6jPSDYp7shSS64qiIodZi+IeKLvKzhPASqFlfUFIkEfxwMyNwxBF?=
 =?us-ascii?Q?ospMs77LetJZ08s18Jsi2xQ2LpQKk71NKe+b8PJJoWtufzNlkmADtMcgBFef?=
 =?us-ascii?Q?o3kLtDstM1EA7WyGRoZ+TWaIvVfvMsLt3MkbhUYyv4K/HQfW4DuTxOKIS2QI?=
 =?us-ascii?Q?s/edKfN0py/4HCsdzeWRzmsQYyAcxdQ1rVZ8bk4nTQgDaau0whhfE1QWvh/9?=
 =?us-ascii?Q?tohk+BVDPZy9PJBOTaSUEgo58roR3CEUqPTb+sRu3j/rXjminjTm1G6cHEyl?=
 =?us-ascii?Q?OZTKa0ayrksKDoTmqRg5pZBdQve5CFsOohkZlXTopQA/6L6iMg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6kYSFtgHAYukW1pOLX9sf9lw2ZwikwhyzuwhWFbXIdK1phE397Ekes9wAqAl?=
 =?us-ascii?Q?YjrVj8cxOCCc6lQstquoYt62cna5qbY+AlbRouEJAm/PnYEEoMHQKG4ozDPB?=
 =?us-ascii?Q?RI7m7lOk9xsMR4iY0tFfIJDL/nHfr4DR6U0aS23VvUUnRJlzUJTBhK5uw5TN?=
 =?us-ascii?Q?LwslKXVZag4N1+TSBC8SYuqDkRtK58QcpZYjnBjzfp1C5DWL1NKmkMhjXbW4?=
 =?us-ascii?Q?eMbj/17eFjX7Wpq3er1AxD2q8rAWqBoj+lgw0BYw1hkIaieI+CV+zwsXBlRy?=
 =?us-ascii?Q?hG6lbAplGVf98lwoD3q9sLBKCeou+xo7hzv+Kx4Yms5tJ7ZvIG9yiGUyg8VQ?=
 =?us-ascii?Q?0Ef4jNWoy8Mnsl91r8FlGzZp9EJBNV0ORguIOS/JPdEXdejAcSbIMvc9fugm?=
 =?us-ascii?Q?n0Q9J72sHx+LcnqdVr3royHd6KEAcAQNU/r+sZx2yVn5nZwM/JbrWNuLVS96?=
 =?us-ascii?Q?ypzbrZ7CJjCOUalbpvNaexhw6Ne26c5lVtUM9kE9Z4JRKKKqR8xJxjYFvFh5?=
 =?us-ascii?Q?IGy+8WUF4l7MueZgALzNB3S9bX5f1+YYh745WYP1PuYIxKYJszkmdYPOcK0U?=
 =?us-ascii?Q?xorC6YY4y8orvAmqF/k2uZj2//fijIm3r8plBCxlNeEPLVq/9CU4+yVt8H7J?=
 =?us-ascii?Q?cmHXRTSNUoAyKVOPhIvzqbH+Js5bdevl9QIxiFO4BxeIEce9E9mt7jCqqxve?=
 =?us-ascii?Q?LtHf7j+cGQxe0Rjzt+4jMvXloHSRyp3t8do2aXaNdIgQoXDVBXXhFA+zpKHl?=
 =?us-ascii?Q?Pw+VC41UGh1CMpmj53PPpa/hp4bYpp73YK9NE43Mzaqy8kkppeUsOwZqMVNc?=
 =?us-ascii?Q?maaxPevBCMds9rFTE2Q9MK52xKdq98skzrfyJMZTb34MLLt4XWoLGG124H/w?=
 =?us-ascii?Q?d4eEYTA5H8RXI2fGeY8HN8miNAFybn9KBK/7yfk/0rtPVPYS0ibCzx6ssdfQ?=
 =?us-ascii?Q?PyRtzCEsIV3KKNPEvtOmCURJx0O/3CtQy3H9iQvUuHsL19qco2eOFpBMJ8j5?=
 =?us-ascii?Q?kaI04HQcBJmB2J6b/ZFT6UhPy5sCevsINzqUdynRRpnfuxprwdvGi7Gx0ZVU?=
 =?us-ascii?Q?TrwJNxSUIKH5fBNXQJ1RGIHJEy0e5hnJzi7JUm3iQie7E4RNsLDycfYRm/zN?=
 =?us-ascii?Q?TmH0rkkUduZKjOhci4SFCQmJrf7zgu3PYIqckXLBnc2QCWhQ5VxmH5axFbtR?=
 =?us-ascii?Q?YseU47TppnxOXc4uQLAOaPfdKo5tnHpA+yAHotB4BD0XR8EOAXT3wRjZd0RH?=
 =?us-ascii?Q?/9JT/XQiRtJvRO9uUtT+20IxYz7UEHoFubD9tEQEqPUu+ueK6KCKp1QaqRSC?=
 =?us-ascii?Q?BBeI+Gd045MOYWGDS7ni1KpHj+5pIbrleolvfERAsb8TxGwoQC7G0lgf70QV?=
 =?us-ascii?Q?S8cei27BmGMmmm3cw4AJeZJsoe4t7LA+w1CityKMaGhq4AM0X/Klh2Vsa0Sn?=
 =?us-ascii?Q?xfnqDO3896AWMNZdnJz/DZ/NVW8A3icYWFQX66BAcZPUvojDqrGzTomGqH0E?=
 =?us-ascii?Q?SbZ7JEwRLviXc4Bqn7ki68URXalAMG6tNGl5LMIX4Ecu/S+cWVHTY8+qnz2S?=
 =?us-ascii?Q?bchKFGAC2qMPO7BdwSKCVbBstT82TYXKyv9w84Ij0c7Kwb/IYMRIatRqAu5X?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f50201-0873-4969-73a1-08de298a95f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 05:47:13.2628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzeDPR4JxfzUPTr46o3ouXSD9jO51LQAxdJ8TPH/BHb8bXeIVXseibs8kH+F01xK1n2g6dEipIyZEXqXlRJ5xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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

On Thu, Nov 20, 2025 at 07:51:43PM -0800, Niranjana Vishwanathapura wrote:
> As all queues of a multi queue group use the primary queue of the group
> to interface with GuC. Hence there is a dependency between the queues of
> the group. So, when primary queue of a multi queue group is cleaned up,
> also trigger a cleanup of the secondary queues also. During cleanup, stop
> and re-start submission for all queues of a multi queue group to avoid
> any submission happening in parallel when a queue is being cleaned up.
> 
> v2: Initialize group->list_lock, add fs_reclaim dependency, remove
>     unwanted secondary queues cleanup (Matt Brost)
> v3: Properly handle cleanup of multi-queue group (Matt Brost)
> 

Also discussed privately, I believe the agreement is teardown the group
on any individual job's timeout within the group. We maybe can leave
this part out until my series here [1] merges to avoid a conflict with
that series. Not huge deal as this feature won't be enabled for a bit as
all supported platforms are behind force probe.

Matt

[1] https://patchwork.freedesktop.org/series/155314/

> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  10 ++
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 154 ++++++++++++++++++-----
>  3 files changed, 142 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cdc044d3c96c..ab161b74fef0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -87,6 +87,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
>  		xe_lrc_put(lrc);
>  
>  	xa_destroy(&group->xa);
> +	mutex_destroy(&group->list_lock);
>  	xe_bo_unpin_map_no_vm(group->cgp_bo);
>  	kfree(group);
>  }
> @@ -627,9 +628,18 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  
>  	group->primary = q;
>  	group->cgp_bo = bo;
> +	INIT_LIST_HEAD(&group->list);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> +	mutex_init(&group->list_lock);
>  	q->multi_queue.group = group;
>  
> +	/* group->list_lock is used in submission backend */
> +	if (!IS_ENABLED(CONFIG_LOCKDEP)) {
> +		fs_reclaim_acquire(GFP_KERNEL);
> +		might_lock(&group->list_lock);
> +		fs_reclaim_release(GFP_KERNEL);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index cafb3ba9a123..5721fb4bad1a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -58,6 +58,10 @@ struct xe_exec_queue_group {
>  	struct xe_bo *cgp_bo;
>  	/** @xa: xarray to store LRCs */
>  	struct xarray xa;
> +	/** @list: List of all secondary queues in the group */
> +	struct list_head list;
> +	/** @list_lock: Secondary queue list lock */
> +	struct mutex list_lock;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  };
> @@ -145,6 +149,8 @@ struct xe_exec_queue {
>  	struct {
>  		/** @multi_queue.group: Queue group information */
>  		struct xe_exec_queue_group *group;
> +		/** @multi_queue.link: Link into group's secondary queues list */
> +		struct list_head link;
>  		/** @multi_queue.priority: Queue priority within the multi-queue group */
>  		enum xe_multi_queue_priority priority;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ce870a119800..2e5fff7ad69b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -577,6 +577,45 @@ static bool vf_recovery(struct xe_guc *guc)
>  	return xe_gt_recovery_pending(guc_to_gt(guc));
>  }
>  
> +static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> +	wake_up_all(&xe->ufence_wq);
> +
> +	if (xe_exec_queue_is_lr(q))
> +		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> +	else
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +}
> +
> +static void xe_guc_exec_queue_reset_trigger_cleanup(struct xe_exec_queue *q)
> +{
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		set_exec_queue_reset(primary);
> +		if (!exec_queue_banned(primary) && !exec_queue_check_timeout(primary))
> +			xe_guc_exec_queue_trigger_cleanup(primary);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link) {
> +			set_exec_queue_reset(eq);
> +			if (!exec_queue_banned(eq) && !exec_queue_check_timeout(eq))
> +				xe_guc_exec_queue_trigger_cleanup(eq);
> +		}
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		set_exec_queue_reset(q);
> +		if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> +			xe_guc_exec_queue_trigger_cleanup(q);
> +	}
> +}
> +
>  #define parallel_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_)
> @@ -939,6 +978,50 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>  }
>  
> +static void xe_guc_exec_queue_submission_start(struct xe_exec_queue *q)
> +{
> +	/*
> +	 * If the exec queue is part of a multi queue group, then start submission
> +	 * on all queues of the multi queue group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		xe_sched_submission_start(&primary->guc->sched);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link)
> +			xe_sched_submission_start(&eq->guc->sched);
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		xe_sched_submission_start(&q->guc->sched);
> +	}
> +}
> +
> +static void xe_guc_exec_queue_submission_stop(struct xe_exec_queue *q)
> +{
> +	/*
> +	 * If the exec queue is part of a multi queue group, then stop submission
> +	 * on all queues of the multi queue group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +		struct xe_exec_queue *eq;
> +
> +		xe_sched_submission_stop(&primary->guc->sched);
> +
> +		mutex_lock(&group->list_lock);
> +		list_for_each_entry(eq, &group->list, multi_queue.link)
> +			xe_sched_submission_stop(&eq->guc->sched);
> +		mutex_unlock(&group->list_lock);
> +	} else {
> +		xe_sched_submission_stop(&q->guc->sched);
> +	}
> +}
> +
>  #define RESUME_PENDING	~0x0ull
>  static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>  {
> @@ -1117,20 +1200,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
> -static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> -{
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> -
> -	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> -	wake_up_all(&xe->ufence_wq);
> -
> -	if (xe_exec_queue_is_lr(q))
> -		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> -	else
> -		xe_sched_tdr_queue_imm(&q->guc->sched);
> -}
> -
>  /**
>   * xe_guc_submit_wedge() - Wedge GuC submission
>   * @guc: the GuC object
> @@ -1204,8 +1273,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	if (!exec_queue_killed(q))
>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  
> -	/* Kill the run_job / process_msg entry points */
> -	xe_sched_submission_stop(sched);
> +	/*
> +	 * Kill the run_job / process_msg entry points.
> +	 * As this function is serialized across exec queues, it is safe to
> +	 * stop and restart submission on all queues of a multi queue group.
> +	 */
> +	xe_guc_exec_queue_submission_stop(q);
>  
>  	/*
>  	 * Engine state now mostly stable, disable scheduling / deregister if
> @@ -1241,7 +1314,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  				   q->guc->id);
>  			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>  				       q->guc->id);
> -			xe_sched_submission_start(sched);
> +			xe_guc_exec_queue_submission_start(q);
>  			xe_gt_reset_async(q->gt);
>  			return;
>  		}
> @@ -1252,7 +1325,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  
>  	xe_hw_fence_irq_stop(q->fence_irq);
>  
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
>  
>  	spin_lock(&sched->base.job_list_lock);
>  	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> @@ -1410,8 +1483,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	    vf_recovery(guc))
>  		return DRM_GPU_SCHED_STAT_NO_HANG;
>  
> -	/* Kill the run_job entry point */
> -	xe_sched_submission_stop(sched);
> +	/*
> +	 * Kill the run_job entry point.
> +	 * As this function is serialized across exec queues, it is safe to
> +	 * stop and restart submission on all queues of a multi queue group.
> +	 */
> +	xe_guc_exec_queue_submission_stop(q);
>  
>  	/* Must check all state after stopping scheduler */
>  	skip_timeout_check = exec_queue_reset(q) ||
> @@ -1568,7 +1645,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * fences that are complete
>  	 */
>  	xe_sched_add_pending_job(sched, job);
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
>  
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  
> @@ -1592,7 +1669,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 * but there is not currently an easy way to do in DRM scheduler. With
>  	 * some thought, do this in a follow up.
>  	 */
> -	xe_sched_submission_start(sched);
> +	xe_guc_exec_queue_submission_start(q);
>  handle_vf_resume:
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  }
> @@ -1623,6 +1700,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
>  	guard(xe_pm_runtime)(guc_to_xe(guc));
>  	trace_xe_exec_queue_destroy(q);
>  
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		mutex_lock(&group->list_lock);
> +		list_del(&q->multi_queue.link);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>  	if (xe_exec_queue_is_lr(q))
>  		cancel_work_sync(&ge->lr_tdr);
>  	/* Confirm no work left behind accessing device structures */
> @@ -1913,6 +1998,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	xe_exec_queue_assign_name(q, q->guc->id);
>  
> +	/*
> +	 * Maintain secondary queues of the multi queue group in a list
> +	 * for handling dependencies across the queues in the group.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		INIT_LIST_HEAD(&q->multi_queue.link);
> +		mutex_lock(&group->list_lock);
> +		list_add_tail(&q->multi_queue.link, &group->list);
> +		mutex_unlock(&group->list_lock);
> +	}
> +
>  	trace_xe_exec_queue_create(q);
>  
>  	return 0;
> @@ -2140,6 +2238,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> +	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> +	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> +		return true;
> +
>  	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
>  }
>  
> @@ -2801,9 +2903,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	 * jobs by setting timeout of the job to the minimum value kicking
>  	 * guc_exec_queue_timedout_job.
>  	 */
> -	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> -		xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>  
>  	return 0;
>  }
> @@ -2882,9 +2982,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  	trace_xe_exec_queue_memory_cat_error(q);
>  
>  	/* Treat the same as engine reset */
> -	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> -		xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_guc_exec_queue_reset_trigger_cleanup(q);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
