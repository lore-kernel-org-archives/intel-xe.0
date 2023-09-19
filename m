Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D1CE79A8
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 15:32:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569EE10E299;
	Tue, 19 Sep 2023 15:32:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F77710E299;
 Tue, 19 Sep 2023 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695137575; x=1726673575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=acf8h6uS7QKVVI9oY3c5aNYhTpnTAbAexPADPWh9bic=;
 b=ERtWXFRDIp5QbCmTFXvFJrmK4gGSWUrg/Vjs0bbEmg4vtVw6HzghZC+e
 82B6Ry96HOQNwjUdWwY47tnMkD+JL22zsecVCtJBZHfVMkn648UY52ic/
 4gZMKNG5Th2g9sQgboDuh0UFji7SKvbi278TWxfP8qGYyec091A5J0Tyj
 S07FJdN0vD8jV5EKA0WYeNpVpo6ra3c/Kr5g6qVjxacKWJmP3AlYxLAKb
 3Fkuvpk+l/kEHDRTNvohrdnqRT0nQmpmkoo7Xz6pthWWbjXU/p+Jj0qzV
 yeKny5r34n15p2urApWiQWkGcnPk/EVi2OlNN7NbKSsNf5cXCaGtzFCFW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383805236"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383805236"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 08:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="746282338"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="746282338"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 08:32:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 08:32:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 08:32:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 08:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBNtrn0h0U1dHLsbyDot3avl4qn+UY1hqAa2hAr5WUbznuqsuW5zj2QoFUqWCzTmexN/ibuHBcxQZQ5pQdu5H2S/5bHT/lcSkNIzZTeJ8G2ENdoF4KJSSowV/1y04NxvVuIVvqWm//P1sMVfiNjFhc0oseu+fxQH4DqI4Msfe+/U7LXmcyhkXT+oSnQv5ALV7PbSXOU1UKhRu4iuEc6RtnpAakBqelf393YDR/QzDd2Hu4zDgyq6rADzlsdwzHFe2ZE6Hv9yrwFYUBSrgd+ttRMmD5boPpBTqDkUenj+51G1Z7trwaHfoLrNcXPCPcE0rNXHcDarHAwKeEFGt5EBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ch8euOPV9eL3D3fcBQ8Tx/7VJzAHxBYmfxy7oFWMMw=;
 b=Kl+ZoZRA6WFGJgXQoTs0rUNJskoZ38taIhjnecE/Rd7ZDp33dqQQxG0vihUxF6eGLbqXF0arpkaAW1AwNA++DHeSugsg85fNfS9JXZV5ObeELjx3nNkrrjDOHWxX9yTxgnKOl84gGLAshKJWscXPplMD/VoMFVWT6OGxZU1ROktybZA6Ururk1pyWmPhUCoyq5CApzam+UP0pci/bGskKxOQgEMJBhrfTbRgOlWUoAJ1epMoD0SVbz7TReBkAeKNBJoctnb1bO65tq+tPMI5Y6GUEPd8+arOe9oJk3w2vwSlH2gkQgTJDSzBsum0yebm6Y0J4EWF9XudYFaoRefPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 15:32:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 15:32:40 +0000
Date: Tue, 19 Sep 2023 15:31:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQm+1k9R4BG89qcp@DUT025-TGLU.fm.intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
 <20230919142000.91363-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919142000.91363-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df02f56-3f51-4ba0-630e-08dbb925a8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WK7oKSIlfr/3XVhX+d12vSIT8A1iY7GEWAmvi5vWZlEy6lCL2NCXCeNbXtxW3e6l/MY77zG191f2Mk1TOsgGOTiizXM6RDZjE8whZWSNDBKLhngE0ZGZVjztJhra/SFzGthZE4FYPO+P/TklGo4EKIREmcJ2U9XLxBGzp1A0bjV4sK684nbFTd1gdoT2QYgMJfsuNHxqIzMivviHxHlmEm7REp29nm/iFmZCkzNfnfbsph+pKjeipzlvzGUR0oV5OseSA7uIkxgSemkakNton2nSMPTCea2z5C6jb8oZ/K/EXjuO2rUATOwQ/qg+mjbXj7XqeDFQJGcA68n62GF+Lplopzv4Osk1aYDbwfpXKhuXDoXwEcQ+5p5jK8yBLxcJDpP/CtaDE1Go9cjYJYOm+Vb83rfKdx3xmlqJV8jUP3KpcHg3I62hDd//244PPdhDRDM8Vasxqsoqz1YNiVcuRkt5/FV3J6YYBvDKjm4eDu0V8OhI8wfKVtCUB1FfH5M5RN1WEqgyBP/Y96UG8b/xlWq1cKQPP2bSDSXLTx8rBPAzTxa01Fpofl2WLt9XdID8mBAAvK1NMsnyc5LYJiLIeqw2fptHtypArdqDTX/4OeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199024)(1800799009)(186009)(44832011)(5660300002)(83380400001)(86362001)(30864003)(4326008)(8936002)(8676002)(41300700001)(450100002)(6862004)(6506007)(6486002)(6666004)(82960400001)(26005)(6512007)(66946007)(478600001)(2906002)(38100700002)(6636002)(316002)(66476007)(66556008)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?73iAprd4GZQtlP7fTeBmwB17+XVaYGFulZLcE2K08HQbu1LYxqoDeWl8PZGr?=
 =?us-ascii?Q?dbBfEy+DsMVznMtSEP+MU6HNUfsQZg1B3/y2EWW0YeEdGbQZuPIN2MHfp42T?=
 =?us-ascii?Q?lO04Hxeslquu3JMIi6XzZfxvbfPJDIqjZyD1i59NGY0rCZd5fSOZmqovP4RI?=
 =?us-ascii?Q?EThYhqEZWmHh+yVkkX99fnu/ckpXsS2nxlDIElZscb4aZ9UEck02NIi6I7ag?=
 =?us-ascii?Q?KC7HviR+gWYuC0diFIO+1TzYHMxUd+Yn+4d4adwstHWaVWu81GrjwTWofu5Z?=
 =?us-ascii?Q?NV8rxuxAeKUm/XyERgE4+SH4ULbCU9RiehiRCotzICREn7+vkyvlrpc542Aq?=
 =?us-ascii?Q?ljz2HULprrKlkUCdAjH0ivyFkdmRoZLZ5Jq23T7Lzn1HiLxevrZHB9L5ZDfw?=
 =?us-ascii?Q?IIPQsYp12LT4J1+XuO6YMsvTCXL92GjQ74/MfyZMDxSn2uSJaQDbyj6YRY5e?=
 =?us-ascii?Q?24ceU/VKJQNWaH4/bTTFQvAT2QbK4FreCdYcsl2vD9WNgR1Z+OOioPMdhpmj?=
 =?us-ascii?Q?lq3B2jGvt00O9x7ji22LMJ3V0DjAZb/bVTt23sIsUHETOurr6F2SGMaqOiai?=
 =?us-ascii?Q?mnJZh2rgQEP5w32p1NpHa8bgSNsALYSAxlGYsmfljr2eBffhiE6g36X6ocFL?=
 =?us-ascii?Q?YWYFga4Pe74YvZJCyjvF/p9jAeWemcYhgPYDoH2q4xlYax/isCGFNsGE/uDK?=
 =?us-ascii?Q?YWDQ02c/f9RYgURvobZhHQCqVL57B3EILPQk5hPu9+y9HTQTZvaooS1AkgLv?=
 =?us-ascii?Q?5vR7u96wr2PmMlQEiyRVDhArjt2sc4j+ZDxN8jSWeNFnF7dSPS1KkT7gw65J?=
 =?us-ascii?Q?1sDBP9pJXi3rZUnwxgbchV2W3UyAuyQKJcwAJ3aHiCwpbFTtpAgArDL0E50A?=
 =?us-ascii?Q?UpJVPrSzEUN1OOhdpiQej25paAfXKgBM+ic1ldr2H9K0kt/QFndvjQzbRxj0?=
 =?us-ascii?Q?5im5OfEIE26dFvs9bnmAlQ7SKb5un9Lv4MMHU3PI/75d8PN0fOaCE1rVnZGE?=
 =?us-ascii?Q?hDPkSC+zzlygHjxuEI5Dgzg6TWJ2CK/i3N621+7bKZfRgsiYaD+UF3qh9fRM?=
 =?us-ascii?Q?ROm90qbWx+93eA6kOZshaUTx7VdM+0aMghXJg4duI/qw85mhaVXWOa1yggwU?=
 =?us-ascii?Q?UQZvY5yRdgwj8PK3mCf0vymP34shaAcyeK4K3LlYyU4cBMcrUJn9eInNlg3X?=
 =?us-ascii?Q?i5q41pHqewbEE3VR0mPp5jL1rKypoo5wCwOa86tUXPyWvD+B8Km+tYVrylfZ?=
 =?us-ascii?Q?S8SlQ5O1WHePmtCk2I1HJ9y2T+KA6E/+Q9rYa/O7CWGlcDDJS1wlMgOAErin?=
 =?us-ascii?Q?vHPg4DV9P/7KcvlnoE+9a3r0DtFEsQOV3ApDge+0SfV79UH8lHCI+TwhfZtu?=
 =?us-ascii?Q?o9J06YmMrlSVfdZdwDutes/N+Uuwgn+f5ywGXY8EUYCwbFpJ3uGbeiQR2Cp8?=
 =?us-ascii?Q?fZWe+rYGNm0pPrPQveR9smG4NZvVsmBNiOYAWdRITa18Gwxmm8wxxGFcUAid?=
 =?us-ascii?Q?AhI8II1zZ1Qi87fJzgiddoDNOFqU1cHeyGivU/+NNFm7iJ7gBo9sC/+CRrO1?=
 =?us-ascii?Q?RknyXtf0WBjvATcIZrv8ep4QQMIfAupt63Wa2VjBQkRxXAvkWjFAsz0RPd1k?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df02f56-3f51-4ba0-630e-08dbb925a8c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 15:32:40.0349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qks3k91CT9QIG9KCeyPu9zR+jS0TB93XFXJnaiSH8yFnz5bkx/GI6Pm77JhSazwVAjbO9ovjHPk4G7vqJVUtww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 03/16] drm-uapi/xe_drm:
 Separate VM_BIND's operation and flag, align with latest uapi
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 10:19:46AM -0400, Rodrigo Vivi wrote:
> From: Francois Dugast <francois.dugast@intel.com>
> 
> Align with commit ("drm/xe/uapi: Separate VM_BIND's operation and flag")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  include/drm-uapi/xe_drm.h     | 14 ++++++++------
>  lib/intel_batchbuffer.c       | 11 +++++++----
>  lib/xe/xe_ioctl.c             | 31 ++++++++++++++++---------------
>  lib/xe/xe_ioctl.h             |  6 +++---
>  lib/xe/xe_util.c              |  9 ++++++---
>  tests/intel/xe_exec_basic.c   |  2 +-
>  tests/intel/xe_exec_threads.c |  2 +-
>  tests/intel/xe_vm.c           | 16 +++++++++-------
>  8 files changed, 51 insertions(+), 40 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index f96c84a98..078edd9f8 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -663,8 +663,10 @@ struct drm_xe_vm_bind_op {
>  #define XE_VM_BIND_OP_RESTART		0x3
>  #define XE_VM_BIND_OP_UNMAP_ALL		0x4
>  #define XE_VM_BIND_OP_PREFETCH		0x5
> +	/** @op: Bind operation to perform */
> +	__u32 op;
>  
> -#define XE_VM_BIND_FLAG_READONLY	(0x1 << 16)
> +#define XE_VM_BIND_FLAG_READONLY	(0x1 << 0)
>  	/*
>  	 * A bind ops completions are always async, hence the support for out
>  	 * sync. This flag indicates the allocation of the memory for new page
> @@ -689,12 +691,12 @@ struct drm_xe_vm_bind_op {
>  	 * configured in the VM and must be set if the VM is configured with
>  	 * DRM_XE_VM_CREATE_ASYNC_BIND_OPS and not in an error state.
>  	 */
> -#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
> +#define XE_VM_BIND_FLAG_ASYNC		(0x1 << 1)
>  	/*
>  	 * Valid on a faulting VM only, do the MAP operation immediately rather
>  	 * than deferring the MAP to the page fault handler.
>  	 */
> -#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> +#define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 2)
>  	/*
>  	 * When the NULL flag is set, the page tables are setup with a special
>  	 * bit which indicates writes are dropped and all reads return zero.  In
> @@ -702,9 +704,9 @@ struct drm_xe_vm_bind_op {
>  	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
>  	 * intended to implement VK sparse bindings.
>  	 */
> -#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> -	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
> -	__u32 op;
> +#define XE_VM_BIND_FLAG_NULL		(0x1 << 3)
> +	/** @flags: Bind flags */
> +	__u32 flags;
>  
>  	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
>  	__u32 region;
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index e7b1b755f..6e668d28c 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1281,7 +1281,8 @@ void intel_bb_destroy(struct intel_bb *ibb)
>  }
>  
>  static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
> -						   uint32_t op, uint32_t region)
> +						   uint32_t op, uint32_t flags,
> +						   uint32_t region)
>  {
>  	struct drm_i915_gem_exec_object2 **objects = ibb->objects;
>  	struct drm_xe_vm_bind_op *bind_ops, *ops;
> @@ -1298,6 +1299,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct intel_bb *ibb,
>  			ops->obj = objects[i]->handle;
>  
>  		ops->op = op;
> +		ops->flags = flags;
>  		ops->obj_offset = 0;
>  		ops->addr = objects[i]->offset;
>  		ops->range = objects[i]->rsvd1;
> @@ -1323,9 +1325,10 @@ static void __unbind_xe_objects(struct intel_bb *ibb)
>  
>  	if (ibb->num_objects > 1) {
>  		struct drm_xe_vm_bind_op *bind_ops;
> -		uint32_t op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
> +		uint32_t op = XE_VM_BIND_OP_UNMAP;
> +		uint32_t flags = XE_VM_BIND_FLAG_ASYNC;
>  
> -		bind_ops = xe_alloc_bind_ops(ibb, op, 0);
> +		bind_ops = xe_alloc_bind_ops(ibb, op, flags, 0);
>  		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
>  				 ibb->num_objects, syncs, 2);
>  		free(bind_ops);
> @@ -2354,7 +2357,7 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
>  
>  	syncs[0].handle = syncobj_create(ibb->fd, 0);
>  	if (ibb->num_objects > 1) {
> -		bind_ops = xe_alloc_bind_ops(ibb, XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, 0);
> +		bind_ops = xe_alloc_bind_ops(ibb, XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC, 0);
>  		xe_vm_bind_array(ibb->fd, ibb->vm_id, 0, bind_ops,
>  				 ibb->num_objects, syncs, 1);
>  		free(bind_ops);
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 730dcfd16..48cd185de 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -67,7 +67,7 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			    uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, bo, 0, 0, 0,
> -			    XE_VM_BIND_OP_UNMAP_ALL | XE_VM_BIND_FLAG_ASYNC,
> +			    XE_VM_BIND_OP_UNMAP_ALL, XE_VM_BIND_FLAG_ASYNC,
>  			    sync, num_syncs, 0, 0);
>  }
>  
> @@ -91,8 +91,8 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
>  
>  int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> -		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
> -		  uint64_t ext)
> +		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> +		  uint32_t region, uint64_t ext)
>  {
>  	struct drm_xe_vm_bind bind = {
>  		.extensions = ext,
> @@ -103,6 +103,7 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		.bind.range = size,
>  		.bind.addr = addr,
>  		.bind.op = op,
> +		.bind.flags = flags,
>  		.bind.region = region,
>  		.num_syncs = num_syncs,
>  		.syncs = (uintptr_t)sync,
> @@ -117,11 +118,11 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  
>  void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  			  uint64_t offset, uint64_t addr, uint64_t size,
> -			  uint32_t op, struct drm_xe_sync *sync,
> +			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
>  			  uint32_t num_syncs, uint32_t region, uint64_t ext)
>  {
>  	igt_assert_eq(__xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size,
> -				   op, sync, num_syncs, region, ext), 0);
> +				   op, flags, sync, num_syncs, region, ext), 0);
>  }
>  
>  void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> @@ -129,7 +130,7 @@ void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  		struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size,
> -			    XE_VM_BIND_OP_MAP, sync, num_syncs, 0, 0);
> +			    XE_VM_BIND_OP_MAP, 0, sync, num_syncs, 0, 0);
>  }
>  
>  void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
> @@ -137,7 +138,7 @@ void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
>  		  struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, 0, 0, offset, addr, size,
> -			    XE_VM_BIND_OP_UNMAP, sync, num_syncs, 0, 0);
> +			    XE_VM_BIND_OP_UNMAP, 0, sync, num_syncs, 0, 0);
>  }
>  
>  void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t offset,
> @@ -146,7 +147,7 @@ void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t exec_queue, uint64_t off
>  			  uint32_t region)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
> -			    XE_VM_BIND_OP_PREFETCH | XE_VM_BIND_FLAG_ASYNC,
> +			    XE_VM_BIND_OP_PREFETCH, XE_VM_BIND_FLAG_ASYNC,
>  			    sync, num_syncs, region, 0);
>  }
>  
> @@ -155,7 +156,7 @@ void xe_vm_bind_async(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		      struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
> -			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, sync,
> +			    XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC, sync,
>  			    num_syncs, 0, 0);
>  }
>  
> @@ -165,7 +166,7 @@ void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t exec_queue, uint32_t b
>  			    uint32_t flags)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, bo, offset, addr, size,
> -			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC | flags,
> +			    XE_VM_BIND_OP_MAP, XE_VM_BIND_FLAG_ASYNC | flags,
>  			    sync, num_syncs, 0, 0);
>  }
>  
> @@ -174,7 +175,7 @@ void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			      struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
> -			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC,
> +			    XE_VM_BIND_OP_MAP_USERPTR, XE_VM_BIND_FLAG_ASYNC,
>  			    sync, num_syncs, 0, 0);
>  }
>  
> @@ -184,7 +185,7 @@ void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t exec_queue,
>  				    uint32_t num_syncs, uint32_t flags)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, 0, userptr, addr, size,
> -			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC |
> +			    XE_VM_BIND_OP_MAP_USERPTR, XE_VM_BIND_FLAG_ASYNC |
>  			    flags, sync, num_syncs, 0, 0);
>  }
>  
> @@ -193,7 +194,7 @@ void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t exec_queue,
>  			struct drm_xe_sync *sync, uint32_t num_syncs)
>  {
>  	__xe_vm_bind_assert(fd, vm, exec_queue, 0, offset, addr, size,
> -			    XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC, sync,
> +			    XE_VM_BIND_OP_UNMAP, XE_VM_BIND_FLAG_ASYNC, sync,
>  			    num_syncs, 0, 0);
>  }
>  
> @@ -205,8 +206,8 @@ static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  		.handle = syncobj_create(fd, 0),
>  	};
>  
> -	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, &sync, 1, 0,
> -			    0);
> +	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, 0, &sync, 1,
> +			    0, 0);
>  
>  	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
>  	syncobj_destroy(fd, sync.handle);
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 6c281b3bf..f0e4109dc 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -19,11 +19,11 @@ uint32_t xe_cs_prefetch_size(int fd);
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
>  int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> -		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
> -		  uint64_t ext);
> +		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> +		  uint32_t region, uint64_t ext);
>  void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  			  uint64_t offset, uint64_t addr, uint64_t size,
> -			  uint32_t op, struct drm_xe_sync *sync,
> +			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
>  			  uint32_t num_syncs, uint32_t region, uint64_t ext);
>  void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  		uint64_t addr, uint64_t size,
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index 2f9ffe2f1..5fa4d4610 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -116,7 +116,7 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
>  {
>  	struct drm_xe_vm_bind_op *bind_ops, *ops;
>  	struct xe_object *obj;
> -	uint32_t num_objects = 0, i = 0, op;
> +	uint32_t num_objects = 0, i = 0, op, flags;
>  
>  	igt_list_for_each_entry(obj, obj_list, link)
>  		num_objects++;
> @@ -134,13 +134,16 @@ static struct drm_xe_vm_bind_op *xe_alloc_bind_ops(struct igt_list_head *obj_lis
>  		ops = &bind_ops[i];
>  
>  		if (obj->bind_op == XE_OBJECT_BIND) {
> -			op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
> +			op = XE_VM_BIND_OP_MAP;
> +			flags = XE_VM_BIND_FLAG_ASYNC;
>  			ops->obj = obj->handle;
>  		} else {
> -			op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
> +			op = XE_VM_BIND_OP_UNMAP;
> +			flags = XE_VM_BIND_FLAG_ASYNC;
>  		}
>  
>  		ops->op = op;
> +		ops->flags = flags;
>  		ops->obj_offset = 0;
>  		ops->addr = obj->offset;
>  		ops->range = obj->size;
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index a4414e052..e29398aaa 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -170,7 +170,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		if (flags & SPARSE)
>  			__xe_vm_bind_assert(fd, vm[i], bind_exec_queues[i],
>  					    0, 0, sparse_addr[i], bo_size,
> -					    XE_VM_BIND_OP_MAP |
> +					    XE_VM_BIND_OP_MAP,
>  					    XE_VM_BIND_FLAG_ASYNC |
>  					    XE_VM_BIND_FLAG_NULL, sync,
>  					    1, 0, 0);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 12e76874e..1f9af894f 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -609,7 +609,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  			if (rebind_error_inject == i)
>  				__xe_vm_bind_assert(fd, vm, bind_exec_queues[e],
>  						    0, 0, addr, bo_size,
> -						    XE_VM_BIND_OP_UNMAP |
> +						    XE_VM_BIND_OP_UNMAP,
>  						    XE_VM_BIND_FLAG_ASYNC |
>  						    INJECT_ERROR, sync_all,
>  						    n_exec_queues, 0, 0);
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 4952ea786..f96305851 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -316,7 +316,7 @@ static void userptr_invalid(int fd)
>  	vm = xe_vm_create(fd, 0, 0);
>  	munmap(data, size);
>  	ret = __xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
> -			   size, XE_VM_BIND_OP_MAP_USERPTR, NULL, 0, 0, 0);
> +			   size, XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0, 0);
>  	igt_assert(ret == -EFAULT);
>  
>  	xe_vm_destroy(fd, vm);
> @@ -437,7 +437,7 @@ static void vm_async_ops_err(int fd, bool destroy)
>  		if (i == N_BINDS / 8)	/* Inject error on this bind */
>  			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
>  					    addr + i * bo_size * 2,
> -					    bo_size, XE_VM_BIND_OP_MAP |
> +					    bo_size, XE_VM_BIND_OP_MAP,
>  					    XE_VM_BIND_FLAG_ASYNC |
>  					    INJECT_ERROR, &sync, 1, 0, 0);
>  		else
> @@ -451,7 +451,7 @@ static void vm_async_ops_err(int fd, bool destroy)
>  		if (i == N_BINDS / 8)
>  			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
>  					    addr + i * bo_size * 2,
> -					    bo_size, XE_VM_BIND_OP_UNMAP |
> +					    bo_size, XE_VM_BIND_OP_UNMAP,
>  					    XE_VM_BIND_FLAG_ASYNC |
>  					    INJECT_ERROR, &sync, 1, 0, 0);
>  		else
> @@ -465,7 +465,7 @@ static void vm_async_ops_err(int fd, bool destroy)
>  		if (i == N_BINDS / 8)
>  			__xe_vm_bind_assert(fd, vm, 0, bo, 0,
>  					    addr + i * bo_size * 2,
> -					    bo_size, XE_VM_BIND_OP_MAP |
> +					    bo_size, XE_VM_BIND_OP_MAP,
>  					    XE_VM_BIND_FLAG_ASYNC |
>  					    INJECT_ERROR, &sync, 1, 0, 0);
>  		else
> @@ -479,7 +479,7 @@ static void vm_async_ops_err(int fd, bool destroy)
>  		if (i == N_BINDS / 8)
>  			__xe_vm_bind_assert(fd, vm, 0, 0, 0,
>  					    addr + i * bo_size * 2,
> -					    bo_size, XE_VM_BIND_OP_UNMAP |
> +					    bo_size, XE_VM_BIND_OP_UNMAP,
>  					    XE_VM_BIND_FLAG_ASYNC |
>  					    INJECT_ERROR, &sync, 1, 0, 0);
>  		else
> @@ -928,7 +928,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		bind_ops[i].range = bo_size;
>  		bind_ops[i].addr = addr;
>  		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
> -		bind_ops[i].op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
> +		bind_ops[i].op = XE_VM_BIND_OP_MAP;
> +		bind_ops[i].flags = XE_VM_BIND_FLAG_ASYNC;
>  		bind_ops[i].region = 0;
>  		bind_ops[i].reserved[0] = 0;
>  		bind_ops[i].reserved[1] = 0;
> @@ -972,7 +973,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  
>  	for (i = 0; i < n_execs; ++i) {
>  		bind_ops[i].obj = 0;
> -		bind_ops[i].op = XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC;
> +		bind_ops[i].op = XE_VM_BIND_OP_UNMAP;
> +		bind_ops[i].flags = XE_VM_BIND_FLAG_ASYNC;
>  	}
>  
>  	syncobj_reset(fd, &sync[0].handle, 1);
> -- 
> 2.41.0
> 
