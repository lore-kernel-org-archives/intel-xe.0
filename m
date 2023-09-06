Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14B4EE14C7
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 18:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951A310E6F2;
	Wed,  6 Sep 2023 18:16:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085410E6F2
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694024165; x=1725560165;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8chN2TrcSjAsmpd9TMCmKn70ZjsVdRmh79cb/SKiKIs=;
 b=R9u19CMjqkwZ0U6yKEDryrp5h/NN0nZpGLz3dpJ0J9E8+xaNuurRRXPD
 WpLU8/PEjYkbvIlOEPb6fobkXwFp0l/OjbqIBJI2IBP8TA4zVExwE9Ji3
 qPkEjZGBBApH07VjCw2iZ0DXtnHi2jIqvw2CVfkmK8YCP/8ZoCxzRdomD
 UOMlzQHHsGkqsbuhn4Og3siMu+KJePuRl3p3zlautShIUAQQE+CfGiP/8
 BGvofpum4k07iTvcnPAuziPFPXf2dU1SSyFM2XDH+LZQ3rqZe3wwEn9kG
 4PiNwm9W++eXAAh8Dd1nZn4tvmBJcUPAdw5SvnID16REyA60o6wtNOVEP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379855810"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="379855810"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 11:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741656645"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="741656645"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 11:13:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 11:13:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 11:13:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 11:13:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 11:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8HYUWSgS3D9+ma4/QnybNVfz2lkO4eLEDoXMChdJiJ1ygU5qrqlkq3cFeYj2UfG7c3wlDm4JL5dWBqDkR/yMJQsnz7tXnvXqOOrXl0QALFj/OpvookhGSb4rlf6aV+SNe1tqafzKiJmWS1lrjAyDhWzW8wm9pUf9MRsbgu6P9CnO19OZQPNqT8UXfTkL4w8mE9IM9cKvXHLNjGlbIRl2EZbwd1aMFyAotbGsP9XxOAkZW9/p6hOvEBmRe38uUC6Uxu+GVabpOBuw0aeOK1H+WnA8JlQ0tiuoQFGo1wx3D8PjzkbIpsb6emnC5kag42M7GZoX4pzd0o76Smo8ugFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AucYvNUq+R6vkaPZtYwi3lr0XtVRPWGllclglQ8c6zA=;
 b=i1Eo3BiQBtFEqBl3fxmEBSXeLf5cOz9k9sXmGW8ln3v4aI0Zyy5Q8uMx9tPrSwl/gw7HwVOIrsffeOGGGa4IkL2UXH9FltA+DlnC9aa0L5qptMaJsbVT1FGuLV/pYcmWpVH0izO/3ukyzbzUCCLiHvYVmSi9FoN5oRg6/UmNLxctLTUIafpsiR92SpcAYVdwhOjPZaBBxfJmAA451X7HuVEreGLc7hIf0LTJlEKNJdoVqHGULi8GpFRujl1rOB0h2SpJQNEs6bxRXyGMp1CK5+GnrcCOcd4ORdmJitwxD18YaHy6omsmvJtngJavbF/Nusi+6JZcI0291V42/FIplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 18:13:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 18:13:49 +0000
Date: Wed, 6 Sep 2023 14:13:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZPjBWbRnwpY8HK3g@intel.com>
References: <20230830214715.113435-1-rodrigo.vivi@intel.com>
 <ZPiSbH39eeMoNOQ2@fdugast-desk.home>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZPiSbH39eeMoNOQ2@fdugast-desk.home>
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb89271-b5f3-4375-df0d-08dbaf0504fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/gfp0mFg8mMhNzrjKDP1iNYE/l1wcT2dCRBxEwswOgJl3TczMf9dqZvxPz7UULsH3XAnkWnXKfLkVaUE+VzcbEvR3th3gGo634MCLXt1mbJqMxqdrtpR7KQnWR5YstyMU+8OchppcgmIaiKLrm9DSZ0bakwpt1caBXho9UFcNuGI8ztLld473C24tu8nMPVCoCsS31BXoIxvvostoYBcKaN0L3ISVERUnlf3tPbOtmXyAXlSz2lFRMe7dpwuWYritoFAZEGmjJ1TesBdbzq1uVf995rs9R31i/kGewaRfEh3NMav33q96VYt1RRs21SyhvUuuU23v165CuFVFlA8F7xrH7AxbgMIMWQfiU9pgp189ol/mZJLLRW0l7W3gZE42xyy3BywM+mYVJRrOM8ObVPWLLsK7ZZjeYV4kLlDes2idDV21QYVsn1uPXYoxr9YYYUrVBr9oRy17lHbiqQF2cI3jOn5oEHKqxcICQezVhZGqkFrlgzoq6TDJx1iVDA+sYJxXNwGh9M+lI3+py0NFK8rT/w1Vl64nUfn+61q54=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(1800799009)(186009)(451199024)(41300700001)(478600001)(6666004)(86362001)(82960400001)(66574015)(2616005)(83380400001)(966005)(26005)(6512007)(6506007)(6486002)(38100700002)(66946007)(6636002)(37006003)(2906002)(36756003)(66476007)(66556008)(316002)(4326008)(6862004)(8676002)(8936002)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GiCzb0gFu752GRrgpvZ+gMV1Eq/YpfB6jJ3YS5kQj9Oc/U79evHou51MGJ?=
 =?iso-8859-1?Q?LnC2h02GcfDfY4PZ7JCJLuGHcvgStwqRXB2v3ycoYmyaML6eNZVMzJF6vi?=
 =?iso-8859-1?Q?5NYQwzSc4kGw/+yaPfc+a7Ok+MwEUuaJ+0Ok2L07ZGHgul7slDT8lW74pc?=
 =?iso-8859-1?Q?cIYpzO+BKovv33WLrV4sDMMP/i+kCXbCDoysIM3RhI5vvlIERPvG86i3Bq?=
 =?iso-8859-1?Q?UxEAOIjXKC7ntNuZteH8Zm13ex/SKsvsHa87vI03YihVtKX+GGxNnrjHp6?=
 =?iso-8859-1?Q?IFuqbYoRCZRXIz2V2WlJLi7hNglaw5EqeBpIsxQmTmMneieNiXpQG7ftAV?=
 =?iso-8859-1?Q?wQ2RKJXgjDQMtnpPHQZRn11AHxCZ34zrSWygrKzzrpWAT48hlLx4u7LW3+?=
 =?iso-8859-1?Q?JEnhm+gMWTjviTA9ZaIzPazhA2QW/KrDC8nb3n6DyJ4Pj38hWwLzVrVr2/?=
 =?iso-8859-1?Q?eadppjYswZj8Y6TdXCGQlUzRbcfrmQt/TxYLM9FGiIWVyTt1oGbhelVP5E?=
 =?iso-8859-1?Q?83JWJzoKr4XHeH3us89pEIM50Iv1LLA6cj8yBtuupLYQwBEzhmx+8KMnLR?=
 =?iso-8859-1?Q?Hrefqu6h2PRbyw7EfTxebJXDxStLVhaxCIyWl8gbywSehV5fJrKJH/k8Lx?=
 =?iso-8859-1?Q?k7W3TJnnKwP61qsQpnZSawSlVrXp4S1ZG5ptVdL51xCjhGboS5pT2j5eX9?=
 =?iso-8859-1?Q?wiPDhfnARsC9UsMvTAUfZFKVziWYoKjAA2fXsyzGxMDW23xwZU7jCfKTIk?=
 =?iso-8859-1?Q?cwNZZna/HLjZluN3lW2l1o2JPyQKXOVJZqg4ECtTtPEFl2qPF89mvZzciZ?=
 =?iso-8859-1?Q?LdhYK+DozwR4bqE2s/DlnzYCjivGG/1oUQN3PaBw9PS/+DHLzkgg7UOCBH?=
 =?iso-8859-1?Q?EtjL4IwaeG9gLtbQ5jdACLgEObc2iP+tjOf1Qpeo3hVZLCAQ9QHm3CgNV8?=
 =?iso-8859-1?Q?wjpEGG9p1PYpm6FZHfUHHmm/CZ4nNSLlpGl3JJq15dzvlJTa4mBpH4HoEb?=
 =?iso-8859-1?Q?4oXYLuog098StUe0BhvP6rir1tjLbHQvg7wLQnGlRLJmgFoMg87MYJOmq3?=
 =?iso-8859-1?Q?kk6lkv/jbVFRGLod+LmD859iXZ0xSLX0vEHk7F5SrpfIYTCFcVrUUY2gyL?=
 =?iso-8859-1?Q?sj3VRTfyK4dgdttwIZ0S+KE4OCwdqgKb8dTtZ8IvbyaFocmHk9n8M8S97u?=
 =?iso-8859-1?Q?ac9rNp9l8+0LqIL7SWwsLLK7JguLX+BBpUicGHKAZnJTc/xi+uTBrLzORK?=
 =?iso-8859-1?Q?cM2GSN1IKO7tXpqH49UpIpuGoY3JIV61tp45xyOiX1XDJpbuKjwsdRte0i?=
 =?iso-8859-1?Q?CacM3R6Oqsz/QoghBNDwFoM5VmAnAWM7a2I/D0adQGSWyMzoaZnbtCAuXA?=
 =?iso-8859-1?Q?B6OBHYeI0jou87ShFk7WTL9ouTtg67MbRDZ2k/kbv1PvDv2puNy9AGT7Le?=
 =?iso-8859-1?Q?6x3CABtP+VFavWHLc9eZQ0OlRoI1WnDwu6GCep7NdXTequAxHHGCexMRg+?=
 =?iso-8859-1?Q?mnREH9ypRIetm99PeYc1IEGtVzEYwMmT4dKdhY/yNlXKmAcV9/Po6i5Tg9?=
 =?iso-8859-1?Q?tZtPTDhjFfl8FLoKRiBHE3AWx7jroFMz+/DbvCIghU8sX7V/obUUaCi4Og?=
 =?iso-8859-1?Q?++TXeQ95yn7PW6BsRKYHz0+rQLPrjp+RZAcy4xw6cQeofGlj3A73tRPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb89271-b5f3-4375-df0d-08dbaf0504fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:13:49.8540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+YzZ7Wc3c1Kgc5AmWO84NTl6Jn6wDt8zZFhLzm1NMNw6wqj0WQ3636IHKTQuIe5TffhSovsyApEIURiGRav8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uapi: Typo lingo and other small
 backwards compatible fixes.
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

On Wed, Sep 06, 2023 at 04:53:32PM +0200, Francois Dugast wrote:
> On Wed, Aug 30, 2023 at 05:47:14PM -0400, Rodrigo Vivi wrote:
> > Fix typos, lingo and other small things identified during uapi
> > review.
> > 
> > v2: Also fix ALIGNMENT typo at xe_query.c
> > 
> > Link: https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c |  2 +-
> >  include/uapi/drm/xe_drm.h     | 23 ++++++++++++-----------
> >  2 files changed, 13 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 1db77a7c9039..c3d396904c7b 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -195,7 +195,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> >  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> >  		config->info[XE_QUERY_CONFIG_FLAGS] =
> >  			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
> > -	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
> > +	config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> >  	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> >  	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 86f16d50e9cc..7c08bedbeeaf 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -256,7 +256,7 @@ struct drm_xe_query_config {
> >  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> >  #define XE_QUERY_CONFIG_FLAGS			1
> >  	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> > -#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
> > +#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> >  #define XE_QUERY_CONFIG_VA_BITS			3
> >  #define XE_QUERY_CONFIG_GT_COUNT		4
> >  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> > @@ -449,7 +449,6 @@ struct drm_xe_gem_create {
> >  	 * If a VM is specified, this BO must:
> >  	 *
> >  	 *  1. Only ever be bound to that VM.
> > -	 *
> >  	 *  2. Cannot be exported as a PRIME fd.
> >  	 */
> >  	__u32 vm_id;
> > @@ -489,7 +488,7 @@ struct drm_xe_gem_mmap_offset {
> >   * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
> >   */
> >  struct drm_xe_vm_bind_op_error_capture {
> > -	/** @error: errno that occured */
> > +	/** @error: errno that occurred */
> >  	__s32 error;
> >  
> >  	/** @op: operation that encounter an error */
> > @@ -609,7 +608,7 @@ struct drm_xe_vm_bind_op {
> >  	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
> >  	 * Once the user sees the error (via a ufence +
> >  	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> > -	 * via non-async unbinds, and then restart all queue'd async binds op via
> > +	 * via non-async unbinds, and then restart all queued async binds op via
> >  	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
> >  	 * VM.
> >  	 *
> > @@ -620,7 +619,7 @@ struct drm_xe_vm_bind_op {
> >  #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
> >  	/*
> >  	 * Valid on a faulting VM only, do the MAP operation immediately rather
> > -	 * than differing the MAP to the page fault handler.
> > +	 * than deferring the MAP to the page fault handler.
> >  	 */
> >  #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> >  	/*
> > @@ -727,7 +726,7 @@ struct drm_xe_exec_queue_set_property {
> >  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
> >  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
> >  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
> > -	/** @property: property to set */
> > +	/** @property: property to be set */
> >  	__u32 property;
> >  
> >  	/** @value: property value */
> > @@ -796,7 +795,7 @@ struct drm_xe_exec_queue_get_property {
> >  	__u32 exec_queue_id;
> >  
> >  #define XE_EXEC_QUEUE_GET_PROPERTY_BAN			0
> > -	/** @property: property to get */
> > +	/** @property: property to be gotten */
> >  	__u32 property;
> 
> LGTM but as a non-native speaker I am just wondering about the use of "to get"
> vs. "to be gotten" in this context (and to a lesser extent "to set" vs. "to be
> set") as it seems not to be widely used:

well, I'm not a native speaker as well and I bet your English is better than mine ;)

> 
>     $ grep -E "@.*to get" . -ir | wc -l
>     701

but I don't believe it applies... about all of these occurrences is
'to get *something*'

while in our case here the 'property' item is what we want to get.

>     $ grep -E "@.*to be gotten" . -ir | wc -l
>     1

Okay, I don't want to be the first one hehe...
I will just accept my English is broken and although my brain cannot parse that
(no verb before, no object after)

I will leave it alone and remove from this patch :)

> 
> Francois
> 
> >  
> >  	/** @value: property value */
> > @@ -907,7 +906,7 @@ struct drm_xe_mmio {
> >  /**
> >   * struct drm_xe_wait_user_fence - wait user fence
> >   *
> > - * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> > + * Wait on user fence, XE will wake-up on every HW engine interrupt in the
> >   * instances list and check if user fence is complete::
> >   *
> >   *	(*addr & MASK) OP (VALUE & MASK)
> > @@ -1039,9 +1038,11 @@ struct drm_xe_vm_madvise {
> >  	 */
> >  #define DRM_XE_VM_MADVISE_PRIORITY		5
> >  #define		DRM_XE_VMA_PRIORITY_LOW		0
> > -#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
> > -#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> > -	/* Pin the VMA in memory, must be elevated user */
> > +		/* Default */
> > +#define		DRM_XE_VMA_PRIORITY_NORMAL	1
> > +		/* Must be user with elevated privileges */
> > +#define		DRM_XE_VMA_PRIORITY_HIGH	2
> > +	/* Pin the VMA in memory, must be user with elevated privileges */
> >  #define DRM_XE_VM_MADVISE_PIN			6
> >  	/** @property: property to set */
> >  	__u32 property;
> > -- 
> > 2.41.0
> > 
