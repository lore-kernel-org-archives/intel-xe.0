Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE11C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 18:26:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B0010E2C9;
	Wed, 13 Dec 2023 18:26:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB2610E285
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702491989; x=1734027989;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VqV6ciY789xy7+pnKp+3ul1fPxrf3SDwNwCOCNu8VuM=;
 b=aAZtvvLaoN2ABbjEBY9LDaajBcqUnfcudpmRa1UTs/rLn+1ys8EP8Tpo
 gusOLRhVmaZ0HqpW0rzYw5I4u2J4GdO53yIkB9AQMLu0v+s0JBk96Fglq
 nx9iNRWBDK25JZVpWTovhRla1bGKt5dFTN0v3U5LOgoETqWS0On460tSk
 vsd9zDuPAyx1ZPqVnDJz5pmFLjsRVNZqPo6ZY+/Y/lIJjeBvQqlxtaOuG
 CAE30vpLbbzgkEgHGIElvlByiuTlJePJoRr1O6Wf5Y8Pad5ntLLGTnYKZ
 ALliZPZKFkn3m00cdlDqufFzhf/wIwp0XHZnSO/WMyBYw6wqcgU8xM9lK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="8401011"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="8401011"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 10:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="777596975"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; d="scan'208";a="777596975"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 10:26:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:26:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 10:26:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 10:26:26 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 10:26:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=binv/e4huvU9CtGivnIvyh+61FTfefOcsgSejbDAWK0//0UIpP5eLmcKzdNeaYdnGB0y76WzANXbO2Cj8BYNA1la0FCm09wMCFxZZ/77fblSwNpUxiPDUe/+wrIBLiloCJKnvyi3UJ26cXa1GWiCx5TiMz9LXcb9JFL7Aq1L0uuM3/Or3h3oLJsLQTyU94u52dxxwZl7wbTGK4CgffNp9ph83QTk+wgfKKwWWvTqb1iZiO3xj/OAVlILf+8+wKX89DSU5CQmgpvdtNXaeGlueVwdg1lwYS3Hvr/zq5jfUMv4GtA7y8UMHpYPaBolSqzONQYnyYm16wfp3qTin4EL0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4GCRqXUebtCkT4gtiLV6r/G+cjxz+hvTwDRIraM0wQ=;
 b=GNtB2smd5QZ8b2anpM1v9O7hK4cEoZE7E20JPFOAUyU6i/oiRZSLiNJrF2Io1a8SpXZT7mfkAAdxE6bmG7PazM6dook6QuwVL95yJHrzFCcSL71icDrWTowvTLTE1n9m58u5j0sb0ia9xyZXmKXwALNa/h9GKKu9IFj1DGP50hOkD3x4xkPHa/iAfU6c6GRQQtteG3rIVYvlRLM2hlZNyo6AOhewg1wGEeQgv9gX1XWX6b2kmuJqvCBODREIqGxIhdX4sItg/DPqkAf1tlNsfEyQvIslz/nXXaJKcgJXur30Kh6/jNVb43wOraYECL6OWTzQ0Qjbg57YFT+M8pG20Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 18:26:15 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 18:26:15 +0000
Date: Wed, 13 Dec 2023 13:26:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 12/14] drm/xe/uapi: Add examples of user space code
Message-ID: <ZXn3RLXQsvGOMFGT@intel.com>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-13-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207135009.7-13-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: d71315f3-7837-4ba8-12dc-08dbfc08fdf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzn0g2dmeZduSVh+lw1VGrTkLheyRCo02tj07Ek9SZw36JTM7nH+IVZXlFEd72Aexts82mmAoQVLu7XyUCFK3Kr6jpkOueizCBIWhaAz23BQpt3/zqlEZtujvx93Y/15VLJhuyh2sbAWs76oBqbzqt7swWZBRS21qXL/QfiAloBATOzNWSvTbPjI2SkGAR5JfDtZe+jAcvq+sahcZ90LAKRvMOUKvA0w6v4jfRKIUGUjGZD+aW4qYAY7IQn8+JE3rm/fJbciycP7SZzuJ8tLwn0VI7NVEg8+mL9/6L1e3N0LAwrS9Qe8b8qLr2NK7ITNGPiQSpric1C6Y6Rvs2SEdpSNI43l7Aotzg6NvmKnd6YAh1k9DHwFAoaXD2O/yBz10E6+eYMHW/YXdIbmGf8EGiWRJIFQE0IsVUUi25o4CD6/qMB8dabiWSz9DeO2byUFAb8zx7CPZL5x5KBS7euCXX4z867Chk0wnsAa65I27L347QsxF9FwUPtk2ssM2xby93FTvJcg5YiTopOkXPJnvuzegiAiZB7VFKPtk86CMQBaRTnb7uWWW1UTKNSqtRuJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66899024)(83380400001)(38100700002)(26005)(44832011)(8936002)(316002)(6636002)(37006003)(8676002)(2906002)(5660300002)(4326008)(6862004)(478600001)(66476007)(41300700001)(6512007)(6666004)(66946007)(6506007)(6486002)(66556008)(2616005)(82960400001)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mavcIU90FHEobGVUriGlSDCa3VQjqwxNm3jY+aqGjny23yz5JMFiUuLob/zE?=
 =?us-ascii?Q?I1xH5WVylfE0h+80aU06KHXdmXa7NX0j+7qQwV9psXvLbP47id3fRxgBPaIm?=
 =?us-ascii?Q?7WzV7UH2Nh1oiqt2xXP4PFgTfFLnkfS1Vb8+82DwMbGq4N9OfzBKI0+Rb9kU?=
 =?us-ascii?Q?ZoJE4QspV2iR0Kq3/Z9oNGdMm3+JWnXpi2n3/IQleRPhBeM3zK0KH/JfzGcd?=
 =?us-ascii?Q?yYUsNXRYLt46hQjX+RzkeHFsa3LqbNsfJvKMrdIQdTuMjMMVs4ucWmzPhKmL?=
 =?us-ascii?Q?vLfwbl0JOFtK9pxrnktUNLqZLSWAVf9htrKTr0FtAsg1c/LjJ6rTgBc2Otvh?=
 =?us-ascii?Q?36IgluBprBpHZDY21BRKorgI852SaB2sKKZZ5/4v+h9QVOsM/ZqzXJmLgOCy?=
 =?us-ascii?Q?uEYwYWK0rCNsfg97014TlXkmwtfk/Lecuji5KTH5OB2/nVLMyfzttm8uBkjI?=
 =?us-ascii?Q?sSCKXHFhiAfudjmwiiujt0yBn4r0KOoa4MeLebH3FYha+YxWcvQyEqOHWVmA?=
 =?us-ascii?Q?ib7xUD5irSMt6tydvuqcu2vD4k+j3hSnSEZLBzZQXLaRFA/NWxeZiROf6/ce?=
 =?us-ascii?Q?fOgXC6fQgU0oNETw0Tz0MdgsOaorF+IVpPjWBuHK04VH+/cSQzeb+Ui21ivV?=
 =?us-ascii?Q?Lj9JxtQ+hZcRccDivXlr7SedXLakELFy8QienyOQx05xTjA2AIM9hF/huASO?=
 =?us-ascii?Q?9hSjQ4Nr99TbeKwI1cql5r7s2aFOe0izLO220v/PQ+jD7/zQFnkPJ6DgWjfp?=
 =?us-ascii?Q?TdTyzfBr1kj3ipx+IYFNvi4HZ2dCMjTm6r1GnjzuoRJWWeAI7B4TII/DKkB2?=
 =?us-ascii?Q?SWv6PnrkM9S/eKdMoqMptlpwvo1oeiKwisvGc5nTorHYyXd0E3kbvFqGqfh5?=
 =?us-ascii?Q?Bf6XCzEyc4FUqRJ1LvOTGmyXJBngcg5egEksRQo5pY/krrGxizxHKoWuK9w4?=
 =?us-ascii?Q?ZaeN3u9N8DYRLfsrhTTJ50Kc7NA61Dxhe8KNc9uxw8hJPuA5VRHPEBU7nTYS?=
 =?us-ascii?Q?U9DzV0AOHVZUhRLzfk2yLtL3xDqGxB94d4XjTYsswwHLQW+S7RZmbVRBUvR/?=
 =?us-ascii?Q?ZJw6knIZMC95gRzlCR6yjzwWVZErvYusR5bcbf22t5auWJTv1m6ug9AyWqVy?=
 =?us-ascii?Q?YPhhOsc1eoJfWeq1p5SvKV7/pnv1WuAkdUaT2FxojnyGLXJl9n/ElF5KTIYM?=
 =?us-ascii?Q?A3AkqQNb/aOzweO5UnKeaGesFnx9F4okr2JH7l6oJzn9DWTD670zvak8tbUG?=
 =?us-ascii?Q?aTqEwY1YWCeiVZBDK8Qj7FzMZopUMdzhh98CUjQhlv9AEFyfNIB+qGOV4qbH?=
 =?us-ascii?Q?ShrKS2B3aRXonSfNwE6h8v0aUyMFsZbWaKx+MdD9+t2yPOXJzbxjKjCOozo+?=
 =?us-ascii?Q?LLEpGd4U/DMx4lhY35AVuSEMNQPlvILZdGWLXhTOAWe2ib/1dZzM5E2MtB8c?=
 =?us-ascii?Q?JZoE8xt/uDreWPgKoj0NpccdQdjqtp9kHxV5wg+PKe+P0J4B1M7ZOlKfktZK?=
 =?us-ascii?Q?oFTSggK8WzAeF3cNDpJr0+1lOCTuYcZW+Cif6/E9xVF4tM9t85+5QOSCOYYy?=
 =?us-ascii?Q?UPrV49yNlGn9udtKFSSs4nLpJ8B3w0BdtmRNbtgqOFWzOTbLesiFI1AM9TKb?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d71315f3-7837-4ba8-12dc-08dbfc08fdf1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 18:26:15.7286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bgs8BS3aWPAJITO37522D1ZZGRli+byTzWfOhRjTLqHd49SDC3AEhy4YUF+K21JFiXTkQBYyC+SI2UDpjVArFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 01:50:07PM +0000, Francois Dugast wrote:
> Complete the documentation of some structs by adding functional
> examples of user space code. Those examples are intentionally kept
> very simple. Put together, they provide a foundation for a minimal
> application that executes a job using the Xe driver.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 84 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b5117bc1f13c..6811a1c96078 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -962,6 +962,30 @@ struct drm_xe_vm_bind_op {
>  
>  /**
>   * struct drm_xe_vm_bind - Input of &DRM_IOCTL_XE_VM_BIND
> + *
> + * Below is an example of a minimal use of @drm_xe_vm_bind to
> + * asynchronously bind the buffer `data` at address `BIND_ADDRESS` to
> + * illustrate `userptr`. It can be synchronized by using the example
> + * provided for @drm_xe_sync.
> + *
> + * .. code-block:: C
> + *
> + *     data = aligned_alloc(ALIGNMENT, BO_SIZE);
> + *     struct drm_xe_vm_bind bind = {
> + *         .vm_id = vm,
> + *         .num_binds = 1,
> + *         .bind.obj = 0,
> + *         .bind.obj_offset = to_user_pointer(data),
> + *         .bind.range = BO_SIZE,
> + *         .bind.addr = BIND_ADDRESS,
> + *         .bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
> + *         .bind.flags = DRM_XE_VM_BIND_FLAG_ASYNC,
> + *         .num_syncs = 1,
> + *         .syncs = &sync,
> + *         .exec_queue_id = 0,
> + *     };
> + *     ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
> + *
>   */
>  struct drm_xe_vm_bind {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1023,6 +1047,25 @@ struct drm_xe_vm_bind {
>  
>  /**
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
> + *
> + * The example below shows how to use @drm_xe_exec_queue_create to create
> + * a simple exec_queue (no parallel submission) of class
> + * &DRM_XE_ENGINE_CLASS_RENDER.
> + *
> + * .. code-block:: C
> + *
> + *     struct drm_xe_engine_class_instance instance = {
> + *         .engine_class = DRM_XE_ENGINE_CLASS_RENDER,
> + *     };
> + *     struct drm_xe_exec_queue_create exec_queue_create = {
> + *          .extensions = 0,
> + *          .vm_id = vm,
> + *          .num_bb_per_exec = 1,
> + *          .num_eng_per_bb = 1,
> + *          .instances = to_user_pointer(&instance),
> + *     };
> + *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &exec_queue_create);
> + *
>   */
>  struct drm_xe_exec_queue_create {
>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> @@ -1114,6 +1157,30 @@ struct drm_xe_exec_queue_get_property {
>   *
>   * and the @flags can be:
>   *  - %DRM_XE_SYNC_FLAG_SIGNAL
> + *
> + * A minimal use of @drm_xe_sync looks like this:
> + *
> + * .. code-block:: C
> + *
> + *     struct drm_xe_sync sync = {
> + *         .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> + *         .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> + *     };
> + *     struct drm_syncobj_create syncobj_create = { 0 };
> + *     ioctl(fd, DRM_IOCTL_SYNCOBJ_CREATE, &syncobj_create);
> + *     sync.handle = syncobj_create.handle;
> + *         ...
> + *         use of &sync in drm_xe_exec or drm_xe_vm_bind
> + *         ...
> + *     struct drm_syncobj_wait wait = {
> + *         .handles = &sync.handle,
> + *         .timeout_nsec = INT64_MAX,
> + *         .count_handles = 1,
> + *         .flags = 0,
> + *         .first_signaled = 0,
> + *         .pad = 0,
> + *     };
> + *     ioctl(fd, DRM_IOCTL_SYNCOBJ_WAIT, &wait);
>   */
>  struct drm_xe_sync {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1156,6 +1223,23 @@ struct drm_xe_sync {
>  
>  /**
>   * struct drm_xe_exec - Input of &DRM_IOCTL_XE_EXEC
> + *
> + * This is an example to use @drm_xe_exec for execution of the object
> + * at BIND_ADDRESS (see example in @drm_xe_vm_bind) by an exec_queue
> + * (see example in @drm_xe_exec_queue_create). It can be synchronized
> + * by using the example provided for @drm_xe_sync.
> + *
> + * .. code-block:: C
> + *
> + *     struct drm_xe_exec exec = {
> + *         .exec_queue_id = exec_queue,

one thing that I believe we are missing on these ioclt examples is how
to bridge them and be more explicit that the exec_queue id here came
as output of the exec_queue_create.

As well as the 'vm' items used on the above cases. But anyway, I believe
that that could be done later and this is already an improvement in the
doc. Ideally uapi docs should have examples and be self-sufficient to
any new UMD developer working with these entries. So, this series
is already a big step towards that, so:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> + *         .syncs = &sync,
> + *         .num_syncs = 1,
> + *         .address = BIND_ADDRESS,
> + *         .num_batch_buffer = 1,
> + *     };
> + *     ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
> + *
>   */
>  struct drm_xe_exec {
>  	/** @extensions: Pointer to the first extension struct, if any */
> -- 
> 2.34.1
> 
