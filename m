Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26042C072A2
	for <intel-xe@archiver.kernel.org>; Fri, 17 Nov 2023 15:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62BF10E0C3;
	Fri, 17 Nov 2023 15:32:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFB310E0C3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Nov 2023 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700235171; x=1731771171;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hUYLyDP4pem4KPUW9tISVg/ArnlT3sUTnkedp/cSm7Y=;
 b=I2oT2Wq7X6wxWPnQOMFASSlXhLSzr4InRPmOrc9Ug8OiRXx485GtIXGr
 YUU9D19IFvqxClJDm9SaOe4kbHUzNg2FGDJbgUUKyvmTtGxEuBWd8+vsT
 aL1706PdiC9cbojae/e3uc5P0USZkWx3Rt8a6o2LatPzIT1L9M4O0S3F0
 3O5+mHqe1d/0mNoRc4V+yHfti3eKvB3nqw/W8oQKf8y+z7MLohl2uezFA
 XRQTSQUgO6TrwZ9J5/vdYXARe9Cnn+5CgLHl6lM7lu4Iwvy+MG3mBVzl+
 cXZ5CmYbab1mIThrj5B1tTk7LGZOGzZHZoo5MWaBlVw1fN+XVhCFXmcu4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="477530206"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="477530206"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:32:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="13959195"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 07:32:50 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 07:32:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 07:32:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 07:32:49 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 07:32:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFs1EkHPazxQdJDASZPlMLeh5BC9StT/Gdq1Cl7S44ugiKpnOSTzqh8HmttZjZUfH2eSq9fPSvCgQhd+7un3EGG37+/uWsec+8Sk/FQz1TmODSg6BqvyAmCAvgCO5OPiUu5y0uHtUICIfNeFFGZ91yPgcvCzwZUwyj1ED/L1h9n4o9E6+fV6XHtIwBdG620MrP6sXNiJq79iyjOqpMNK1ezwhh8XOtI2L6+m2QkU/jlk46wh1DYS3zy0bP3Q/VppMJKFOQmM2FVHTyTlt/ybYobwm+zXEsUrdD/cn5NqMKqXQUNXBjhPeoUqU33sM5Rl1TbYCrRQfGKzpLKalI3VBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUUMXfjoPxITw9LSGEcHiVSWXH3dX6WDzVAQiGP7xEs=;
 b=CoyYZ/0bTmaikv6bOOJWv1OA/63MPuo+KncXjpEBcp+ZOgK99bpxO18zzE6Dy/g+BBOxIldpVySLZYKNQF80mZmJuiSZKLCt4JU3+kvmyW8v9BIhWqJC797vM8dG3+4wWnH/KwRJ9p/Y+ukpig0rg7++DLtNQyh+4M3NvkLcNYlVkXMl5BcItbb6shbYZumy/qBArD72fAWynQy6/PPj0RS6AjO2EuB9RAmmhQZcp3A0Jco/XtwQ1TtZ6aRzzMeNCc+QwCi9VupU+hCEhfl2l9Qj5kiwKL6ZjpptxqRA9AU5xc+metmVQ9rZdYK1cjaNlXm3hHLxC+Rb9welOPsrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB5983.namprd11.prod.outlook.com (2603:10b6:510:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 15:32:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::1c7b:3943:33a5:aa9%3]) with mapi id 15.20.6977.033; Fri, 17 Nov 2023
 15:32:44 +0000
Date: Fri, 17 Nov 2023 08:31:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>
Message-ID: <ZVck+vKWY1o0/3i6@DUT025-TGLU.fm.intel.com>
References: <20231115031508.173140-1-matthew.brost@intel.com>
 <8f88e133-6595-4cdd-8b81-11fd4e74e85d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8f88e133-6595-4cdd-8b81-11fd4e74e85d@intel.com>
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 75bb92af-7fbe-4647-d938-08dbe7827182
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJ3gVKUqH/8AaGqE8tmSfYXx3BZ2ZCTkBj2572u1sgfxNHk3pv/DdQSGboXvgJ6gthomsKXVrTKr7bfeWnB6G8f2I/xE547Snzc6kK6AOmodJt8yeNq/6AfLmbSw8MOhV/S62fIAN0EtPKSW5tGiCb3Z+PI9ZQZDDDZxKJDs87ry154wUdAzVe5IcfJgr/1+OF6RGzoXG9URJxtCYvQx4lfhb5c/riVI7oBEZNfNgPGgnLWwbde3TbFRg8ZgDdQQrX6DTCfHMjCnb6bFuSXv39ip8WSthuUZdzLBVwlpsnfx0AHnZLqREgqCtn1c4qlRg7mgYW/IQxW7XB8Mwr8KWgSKRzkqYSUf25v7az6b04YadR4MvlPBSTYGnM0uc5rrAJjFufPaa3JI/k8FnD9fOKCrabveY8RlhXljLX7jrNXsqu9K8zCcCTC5+5D7+nTg6lTJYUp0a48akc9njePK4tPL60RB1KE+XJLlIqSTCcrQIAjsK1JrfaqTz3gXsIMkzNpWavEAvBzwIKc2D8cfXXhaFooItXzlpBZYcRolRo0FfVQloeMdhoSgyiX9/s9V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(83380400001)(82960400001)(26005)(6512007)(6506007)(53546011)(6666004)(6486002)(478600001)(86362001)(5660300002)(4326008)(66556008)(66476007)(66946007)(41300700001)(6636002)(316002)(8936002)(8676002)(6862004)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Zug6Sda+KSNX7e7ZOow9/OiuyMMGyNyij/swMOlZrn0E1XXImilu11hX0Pb?=
 =?us-ascii?Q?UPD7mhuTclW+PAgjtqB1FXW+Q8wbAA7ji7WugaqoLwWQz3pGl5QXEIH4yOKh?=
 =?us-ascii?Q?NpFnHBNnm0IZi5g4BHIrQ1OJHPm/VlCyM5+oTszl7aX++DpByEtrqQ4duBY7?=
 =?us-ascii?Q?xEv73px+jEK7qM6qPrFtKRqQP8WvfuRue+GAeRKbKWWNX05LRi8lTccDAzCh?=
 =?us-ascii?Q?4i6tvE/+IDoQ0XNGqo9SswxL07k+BGwyC22lQRmhyhzQDroj4+FvVsY3BED+?=
 =?us-ascii?Q?I4GH3rjlVozwz+ZvP4O2fUCnMrWC5pznP7aChOCZrzELiuRAaYYFornlIg00?=
 =?us-ascii?Q?2EsU5TqCRDu1TUOMfx8wrR8nfQYfLJedNl1QNIX1yMFcen8x0E4ughPY3+Uj?=
 =?us-ascii?Q?6HOAnbtobz9yuRcEnvsTiMd0gTWPjqyhMxqfpAtftLHXPLCJiGhKI/GqJsvh?=
 =?us-ascii?Q?BPp6DxtX85cdb8X/76wP1FseFPf9AWYqhsVMUljpMMrzb5sSYn36AdH32CkM?=
 =?us-ascii?Q?6q/+2fEvUFTzt6i0hsZH9r8+SlNxucZ+HhECsEv+RkWSt18lqYIhwI+RLOT1?=
 =?us-ascii?Q?6paibTaA8Lysdxpa5G3nZP+3mGXl72td0SXC9eZM/xXiPGTLs1hs7qnuUp+Y?=
 =?us-ascii?Q?kZZKZNIV7CLAmDKjEEQTB7wAbWOsFMxr+nV0gfyFsBbNymcj6A95sBVThHcr?=
 =?us-ascii?Q?dLs7WzGHB6pj3KEfaT3q004F1enwjF3ZoHBvANVSx6Vgx3GC+w6U9eDMwDlt?=
 =?us-ascii?Q?ys3WWIr+wqNn8kbqrUu1H9SdESZ7Xv02NDFMz81J1w4yaHXUvM46lKMdyDNl?=
 =?us-ascii?Q?G5b5eGYxChjWp86s9dgRz0qrcFdhRptu+RLC6fhzaE3+6GrpMDSxUt3y+lnC?=
 =?us-ascii?Q?klwM3zXWK+8OaQXsQKJlvPPNcKHOwUvbuwMfJs2KyPSbImCpBj26v/VwGX7T?=
 =?us-ascii?Q?SPvU+yfF6cZilroI3fnNLp8YZZVHS8t/5AX0Pb5PE84IoI34TGXkGB5lymby?=
 =?us-ascii?Q?gmcrWvoRl6qhPW4mEe3SvjbNAQn9aUIHKrUps7bQVjw6/jAaZXf2RmsmPT0X?=
 =?us-ascii?Q?ypee0EY0jMuA/OyhXYpZU/WIiSxOoJXW6B8wTo1lCfKIJlnfrgLZx7A9aH/T?=
 =?us-ascii?Q?Y9OwvFGNaBsuUhlaZjdbz1xEz2Prf/O1Mt95AT/kk5Z+gqHZK2+xZP7lw5o+?=
 =?us-ascii?Q?yLbaqjbqtlRw4k446Wm5BSiSfPd30eSlsQUGS4+BiGoneSahdqX+H/cD5jlJ?=
 =?us-ascii?Q?BqJA61lbioWPRLPTV2sOxZIYlRgrsf2Uz83ZD1I+6UfzhwGZswAITQ+64ZaB?=
 =?us-ascii?Q?v0n88K3pDIs7W38dcA0nVBkYqKNUyctILdWgsh5D4YMd1NwsK87mHYSPLcnG?=
 =?us-ascii?Q?2FHj7qWYPnGLCTLVT8m504gFFBg8tKtqitY7NBTgyCrpT5fXK4ALBJxWjBQ8?=
 =?us-ascii?Q?SdJ0wGLf4T/4E1kXxITp4qUL9TPrIR/aBsXgpqRYlldAKcXzlPOO+HMHmc2K?=
 =?us-ascii?Q?cWCvyFnyPRO8RzCAa7jVtxQnxY50nWjK9PUkT9j6VtApOcXeN3kR4S3p1ohQ?=
 =?us-ascii?Q?mn1Pws7Y5W0KKanIhdnG3e4pcH4AT1J9hlEr2sr7uOkroGJEFRxt8j7bYyjV?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bb92af-7fbe-4647-d938-08dbe7827182
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 15:32:44.0685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GSA/AumUfeH8CF+QBGT/ZIxPUrLr+C++IB87ynB5WRCJBHeTY2jkxtvsfoR+7zodTCTNoUpf5NuQAgas3YsaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5983
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Only set xe_vma_op.map fields for
 GPUVA map operations
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 11:57:09AM -0800, Welty, Brian wrote:
> 
> 
> On 11/14/2023 7:15 PM, Matthew Brost wrote:
> > XE_VM_BIND_OP_MAP_* IOCTL operations can result in GPUVA unmap, remap,
> > or map operations in vm_bind_ioctl_ops_create. The xe_vma_op.map fields
> > are blindly set which is incorrect for GPUVA unmap or remap operations.
> > Fix this by only setting xe_vma_op.map for GPUVA map operations. Also
> > restructure a bit vm_bind_ioctl_ops_create to make the code a bit more
> > readable.
> > 
> > Reported-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> > Signec-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Typo in your signed-off !
> 

Yep, will fix.

> One comment below.
> 
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 59 ++++++++++++--------------------------
> >   1 file changed, 18 insertions(+), 41 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d45f4f1d490f..1049869b5a6f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2187,42 +2187,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> 
> 
> Looks like you can trim the arguments to this function....
> At a glance, looks like flags, tile_mask, and region no longer need to be
> passed.
>

These are still used at the bottom of the function...
 
> -Brian
> 
> 
> >   	case XE_VM_BIND_OP_MAP_USERPTR:
> >   		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
> >   						  obj, bo_offset_or_userptr);
> > -		if (IS_ERR(ops))
> > -			return ops;
> > -
> > -		drm_gpuva_for_each_op(__op, ops) {
> > -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > -
> > -			op->tile_mask = tile_mask;
> > -			op->map.immediate =
> > -				flags & XE_VM_BIND_FLAG_IMMEDIATE;
> > -			op->map.read_only =
> > -				flags & XE_VM_BIND_FLAG_READONLY;
> > -			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
> > -		}
> >   		break;
> >   	case XE_VM_BIND_OP_UNMAP:
> >   		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
> > -		if (IS_ERR(ops))
> > -			return ops;
> > -
> > -		drm_gpuva_for_each_op(__op, ops) {
> > -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > -
> > -			op->tile_mask = tile_mask;
> > -		}
> >   		break;
> >   	case XE_VM_BIND_OP_PREFETCH:
> >   		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
> > -		if (IS_ERR(ops))
> > -			return ops;
> > -
> > -		drm_gpuva_for_each_op(__op, ops) {
> > -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > -
> > -			op->tile_mask = tile_mask;
> > -			op->prefetch.region = region;
> > -		}
> >   		break;
> >   	case XE_VM_BIND_OP_UNMAP_ALL:
> >   		xe_assert(vm->xe, bo);
> > @@ -2232,19 +2202,13 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >   			return ERR_PTR(err);
> >   		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
> >   		xe_bo_unlock(bo);
> > -		if (IS_ERR(ops))
> > -			return ops;
> > -
> > -		drm_gpuva_for_each_op(__op, ops) {
> > -			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > -
> > -			op->tile_mask = tile_mask;
> > -		}
> >   		break;
> >   	default:
> >   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >   		ops = ERR_PTR(-EINVAL);
> >   	}
> > +	if (IS_ERR(ops))
> > +		return ops;
> >   #ifdef TEST_VM_ASYNC_OPS_ERROR
> >   	if (operation & FORCE_ASYNC_OP_ERROR) {
> > @@ -2255,9 +2219,22 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> >   	}
> >   #endif
> > -	if (!IS_ERR(ops))
> > -		drm_gpuva_for_each_op(__op, ops)
> > -			print_op(vm->xe, __op);
> > +	drm_gpuva_for_each_op(__op, ops) {
> > +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> > +
> > +		op->tile_mask = tile_mask;
> > +		if (__op->op == DRM_GPUVA_OP_MAP) {
> > +			op->map.immediate =
> > +				flags & XE_VM_BIND_FLAG_IMMEDIATE;
> > +			op->map.read_only =
> > +				flags & XE_VM_BIND_FLAG_READONLY;
> > +			op->map.is_null = flags & XE_VM_BIND_FLAG_NULL;
> > +		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > +			op->prefetch.region = region;
> > +		}

Here is the use od flags, tile_mask, and region.

Matt

> > +
> > +		print_op(vm->xe, __op);
> > +	}
> >   	return ops;
> >   }
