Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39777E95A91
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 09:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0422D10E24F;
	Mon,  9 Oct 2023 09:21:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71ED110E24F;
 Mon,  9 Oct 2023 09:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696843310; x=1728379310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GF04VPPg5FobM+ouj0L6CCarl+YKa+4bNuZhs/rDWlU=;
 b=M1cg74eVtkeduiaT8LTfQ+oSdxQGixt1RyIHyBpMRMSb10cvn/5VQDhy
 QWOuzfAKRp6K/qGbd5S6XW70qHm9itq8wHLDG7sqTWKjgEi8ulSisIrY5
 dU4joQJSNNRCE7rfL7X0jYlnzMpRzEqHPk1Sljxa+1lI5n3jiJSfVLtio
 uMPV17UeLjJNS5StNWD8lTA30ierqTiBUIa03CkY5qlz/Ad7HbVT+90DB
 2njqC4Xx/hmT/7Ckn9nkV60xmqsDM12BYMTHC0rm8ZviuC+R+2eUw25JY
 DyV0p2vKqiZ/pTQPZuWFwH69rOUSJphI6ZQ+7l5JwCXRIBZ5E559rC3Gc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="382980174"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="382980174"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1084268667"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="1084268667"
Received: from lewandow-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.14.229])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:21:48 -0700
Date: Mon, 9 Oct 2023 11:21:46 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20231009092146.yjhh27ug54eckwih@zkempczy-mobl2>
References: <20231005153116.452319-1-matthew.auld@intel.com>
 <20231005153116.452319-9-matthew.auld@intel.com>
 <20231006115147.sboxniiobenbvls2@zkempczy-mobl2>
 <504919dd-da5e-4b64-3dcd-18e8810763f3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <504919dd-da5e-4b64-3dcd-18e8810763f3@intel.com>
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 08/12] lib/intel_blt: support
 pat_index
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

On Fri, Oct 06, 2023 at 01:08:50PM +0100, Matthew Auld wrote:
> On 06/10/2023 12:51, Zbigniew Kempczyński wrote:
> > On Thu, Oct 05, 2023 at 04:31:12PM +0100, Matthew Auld wrote:
> > > For the most part we can just use the default wb, however some users
> > > including display might want to use something else.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > > ---
> > >   lib/igt_fb.c                    |  2 ++
> > >   lib/intel_blt.c                 | 54 +++++++++++++++++++++------------
> > >   lib/intel_blt.h                 |  7 +++--
> > >   tests/intel/gem_ccs.c           | 16 +++++-----
> > >   tests/intel/gem_lmem_swapping.c |  4 +--
> > >   tests/intel/xe_ccs.c            | 19 +++++++-----
> > >   6 files changed, 64 insertions(+), 38 deletions(-)
> > > 
> > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > index f8a0db22c..d290fd775 100644
> > > --- a/lib/igt_fb.c
> > > +++ b/lib/igt_fb.c
> > > @@ -37,6 +37,7 @@
> > >   #include "i915/gem_mman.h"
> > >   #include "intel_blt.h"
> > >   #include "intel_mocs.h"
> > > +#include "intel_pat.h"
> > >   #include "igt_aux.h"
> > >   #include "igt_color_encoding.h"
> > >   #include "igt_fb.h"
> > > @@ -2768,6 +2769,7 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
> > >   	blt_set_object(blt, handle, fb->size, memregion,
> > >   		       intel_get_uc_mocs(fb->fd),
> > > +		       intel_get_pat_idx_wt(fb->fd),
> > >   		       blt_tile,
> > >   		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
> > >   		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
> > > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > > index b55fa9b52..b7ac2902b 100644
> > > --- a/lib/intel_blt.c
> > > +++ b/lib/intel_blt.c
> > > @@ -13,6 +13,7 @@
> > >   #include "igt.h"
> > >   #include "igt_syncobj.h"
> > >   #include "intel_blt.h"
> > > +#include "intel_pat.h"
> > >   #include "xe/xe_ioctl.h"
> > >   #include "xe/xe_query.h"
> > >   #include "xe/xe_util.h"
> > > @@ -810,10 +811,12 @@ uint64_t emit_blt_block_copy(int fd,
> > >   	igt_assert_f(blt, "block-copy requires data to do blit\n");
> > >   	alignment = get_default_alignment(fd, blt->driver);
> > > -	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
> > > -		     + blt->src.plane_offset;
> > > -	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
> > > -		     + blt->dst.plane_offset;
> > > +	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
> > > +					  alignment, blt->src.pat_index) +
> > > +		blt->src.plane_offset;
> > > +	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
> > > +					  alignment, blt->dst.pat_index) +
> > > +		blt->dst.plane_offset;
> > 
> > To less tabs in formatting for src and dst plane_offset.
> > 
> > >   	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
> > >   	fill_data(&data, blt, src_offset, dst_offset, ext);
> > > @@ -884,8 +887,10 @@ int blt_block_copy(int fd,
> > >   	igt_assert_neq(blt->driver, 0);
> > >   	alignment = get_default_alignment(fd, blt->driver);
> > > -	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
> > > -	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
> > > +	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
> > > +					  alignment, blt->src.pat_index);
> > > +	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
> > > +					  alignment, blt->dst.pat_index);
> > >   	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
> > >   	emit_blt_block_copy(fd, ahnd, blt, ext, 0, true);
> > > @@ -1036,8 +1041,10 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
> > >   	data.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
> > >   	data.dw00.length = 0x3;
> > > -	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
> > > -	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
> > > +	src_offset = get_offset_pat_index(ahnd, surf->src.handle, surf->src.size,
> > > +					  alignment, surf->src.pat_index);
> > > +	dst_offset = get_offset_pat_index(ahnd, surf->dst.handle, surf->dst.size,
> > > +					  alignment, surf->dst.pat_index);
> > >   	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
> > >   	data.dw01.src_address_lo = src_offset;
> > > @@ -1103,8 +1110,10 @@ int blt_ctrl_surf_copy(int fd,
> > >   	igt_assert_neq(surf->driver, 0);
> > >   	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
> > > -	src_offset = get_offset(ahnd, surf->src.handle, surf->src.size, alignment);
> > > -	dst_offset = get_offset(ahnd, surf->dst.handle, surf->dst.size, alignment);
> > > +	src_offset = get_offset_pat_index(ahnd, surf->src.handle, surf->src.size,
> > > +					  alignment, surf->src.pat_index);
> > > +	dst_offset = get_offset_pat_index(ahnd, surf->dst.handle, surf->dst.size,
> > > +					  alignment, surf->dst.pat_index);
> > >   	bb_offset = get_offset(ahnd, surf->bb.handle, surf->bb.size, alignment);
> > >   	emit_blt_ctrl_surf_copy(fd, ahnd, surf, 0, true);
> > > @@ -1308,10 +1317,12 @@ uint64_t emit_blt_fast_copy(int fd,
> > >   	data.dw03.dst_x2 = blt->dst.x2;
> > >   	data.dw03.dst_y2 = blt->dst.y2;
> > > -	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
> > > -		     + blt->src.plane_offset;
> > > -	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
> > > -		     + blt->dst.plane_offset;
> > > +	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
> > > +					  alignment, blt->src.pat_index) +
> > > +		blt->src.plane_offset;
> > > +	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size, alignment,
> > > +					  blt->dst.pat_index) +
> > > +		blt->dst.plane_offset;
> > 
> > Ditto.
> > 
> > >   	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
> > >   	data.dw04.dst_address_lo = dst_offset;
> > > @@ -1380,8 +1391,10 @@ int blt_fast_copy(int fd,
> > >   	igt_assert_neq(blt->driver, 0);
> > >   	alignment = get_default_alignment(fd, blt->driver);
> > > -	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
> > > -	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
> > > +	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
> > > +					  alignment, blt->src.pat_index);
> > > +	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
> > > +					  alignment, blt->dst.pat_index);
> > >   	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
> > >   	emit_blt_fast_copy(fd, ahnd, blt, 0, true);
> > > @@ -1460,7 +1473,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
> > >   							  &size, region) == 0);
> > >   	}
> > 
> > I think blt_create_object() should have also pat_index passed as an
> > argument.
> 
> I think you would also have to pass in the cpu_caching mode, and maybe even
> the coh_mode, if we wanted that. Currently blt_create_object() gives you a
> combination of cpu_caching, coh_mode and pat_index that is the default and
> should "just work" for most cases. Idea is if you need something more exotic
> you would instead create your own object (using say gem_create_caching) and
> then also select whatever pat_index you needed.
> 
> I can change it to expose everything but figured blt_create_object() should
> be more "I don't care, just give me the defaults".

Ok. You've conviced me. Any non-default settings might be changed before
the exec.

--
Zbigniew

> 
> > 
> > Rest looks ok.
> > 
> > --
> > Zbigniew
> > 
> > > -	blt_set_object(obj, handle, size, region, mocs, tiling,
> > > +	blt_set_object(obj, handle, size, region, mocs, DEFAULT_PAT_INDEX, tiling,
> > >   		       compression, compression_type);
> > >   	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
> > > @@ -1481,7 +1494,7 @@ void blt_destroy_object(int fd, struct blt_copy_object *obj)
> > >   void blt_set_object(struct blt_copy_object *obj,
> > >   		    uint32_t handle, uint64_t size, uint32_t region,
> > > -		    uint8_t mocs, enum blt_tiling_type tiling,
> > > +		    uint8_t mocs, uint8_t pat_index, enum blt_tiling_type tiling,
> > >   		    enum blt_compression compression,
> > >   		    enum blt_compression_type compression_type)
> > >   {
> > > @@ -1489,6 +1502,7 @@ void blt_set_object(struct blt_copy_object *obj,
> > >   	obj->size = size;
> > >   	obj->region = region;
> > >   	obj->mocs = mocs;
> > > +	obj->pat_index = pat_index;
> > >   	obj->tiling = tiling;
> > >   	obj->compression = compression;
> > >   	obj->compression_type = compression_type;
> > > @@ -1516,12 +1530,14 @@ void blt_set_copy_object(struct blt_copy_object *obj,
> > >   void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
> > >   			      uint32_t handle, uint32_t region, uint64_t size,
> > > -			      uint8_t mocs, enum blt_access_type access_type)
> > > +			      uint8_t mocs, uint8_t pat_index,
> > > +			      enum blt_access_type access_type)
> > >   {
> > >   	obj->handle = handle;
> > >   	obj->region = region;
> > >   	obj->size = size;
> > >   	obj->mocs = mocs;
> > > +	obj->pat_index = pat_index;
> > >   	obj->access_type = access_type;
> > >   }
> > > diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> > > index d9c8883c7..f8423a986 100644
> > > --- a/lib/intel_blt.h
> > > +++ b/lib/intel_blt.h
> > > @@ -79,6 +79,7 @@ struct blt_copy_object {
> > >   	uint32_t region;
> > >   	uint64_t size;
> > >   	uint8_t mocs;
> > > +	uint8_t pat_index;
> > >   	enum blt_tiling_type tiling;
> > >   	enum blt_compression compression;  /* BC only */
> > >   	enum blt_compression_type compression_type; /* BC only */
> > > @@ -151,6 +152,7 @@ struct blt_ctrl_surf_copy_object {
> > >   	uint32_t region;
> > >   	uint64_t size;
> > >   	uint8_t mocs;
> > > +	uint8_t pat_index;
> > >   	enum blt_access_type access_type;
> > >   };
> > > @@ -247,7 +249,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
> > >   void blt_destroy_object(int fd, struct blt_copy_object *obj);
> > >   void blt_set_object(struct blt_copy_object *obj,
> > >   		    uint32_t handle, uint64_t size, uint32_t region,
> > > -		    uint8_t mocs, enum blt_tiling_type tiling,
> > > +		    uint8_t mocs, uint8_t pat_index, enum blt_tiling_type tiling,
> > >   		    enum blt_compression compression,
> > >   		    enum blt_compression_type compression_type);
> > >   void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
> > > @@ -258,7 +260,8 @@ void blt_set_copy_object(struct blt_copy_object *obj,
> > >   			 const struct blt_copy_object *orig);
> > >   void blt_set_ctrl_surf_object(struct blt_ctrl_surf_copy_object *obj,
> > >   			      uint32_t handle, uint32_t region, uint64_t size,
> > > -			      uint8_t mocs, enum blt_access_type access_type);
> > > +			      uint8_t mocs, uint8_t pat_index,
> > > +			      enum blt_access_type access_type);
> > >   void blt_surface_info(const char *info,
> > >   		      const struct blt_copy_object *obj);
> > > diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> > > index f5d4ab359..a98557b72 100644
> > > --- a/tests/intel/gem_ccs.c
> > > +++ b/tests/intel/gem_ccs.c
> > > @@ -15,6 +15,7 @@
> > >   #include "lib/intel_chipset.h"
> > >   #include "intel_blt.h"
> > >   #include "intel_mocs.h"
> > > +#include "intel_pat.h"
> > >   /**
> > >    * TEST: gem ccs
> > >    * Description: Exercise gen12 blitter with and without flatccs compression
> > > @@ -111,9 +112,9 @@ static void surf_copy(int i915,
> > >   	blt_ctrl_surf_copy_init(i915, &surf);
> > >   	surf.print_bb = param.print_bb;
> > >   	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
> > > -				 uc_mocs, BLT_INDIRECT_ACCESS);
> > > +				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
> > >   	blt_set_ctrl_surf_object(&surf.dst, ccs, REGION_SMEM, ccssize,
> > > -				 uc_mocs, DIRECT_ACCESS);
> > > +				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> > >   	bb_size = 4096;
> > >   	igt_assert_eq(__gem_create(i915, &bb_size, &bb1), 0);
> > >   	blt_set_batch(&surf.bb, bb1, bb_size, REGION_SMEM);
> > > @@ -133,7 +134,7 @@ static void surf_copy(int i915,
> > >   		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
> > >   		blt_set_ctrl_surf_object(&surf.dst, ccs2, REGION_SMEM, ccssize,
> > > -					 0, DIRECT_ACCESS);
> > > +					 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> > >   		blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
> > >   		gem_sync(i915, surf.dst.handle);
> > > @@ -155,9 +156,9 @@ static void surf_copy(int i915,
> > >   	for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
> > >   		ccsmap[i] = i;
> > >   	blt_set_ctrl_surf_object(&surf.src, ccs, REGION_SMEM, ccssize,
> > > -				 uc_mocs, DIRECT_ACCESS);
> > > +				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> > >   	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
> > > -				 uc_mocs, INDIRECT_ACCESS);
> > > +				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
> > >   	blt_ctrl_surf_copy(i915, ctx, e, ahnd, &surf);
> > >   	blt_copy_init(i915, &blt);
> > > @@ -399,7 +400,8 @@ static void block_copy(int i915,
> > >   	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
> > >   	if (config->inplace) {
> > >   		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
> > > -			       T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > +			       DEFAULT_PAT_INDEX, T_LINEAR, COMPRESSION_DISABLED,
> > > +			       comp_type);
> > >   		blt.dst.ptr = mid->ptr;
> > >   	}
> > > @@ -475,7 +477,7 @@ static void block_multicopy(int i915,
> > >   	if (config->inplace) {
> > >   		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
> > > -			       mid->mocs, mid_tiling, COMPRESSION_DISABLED,
> > > +			       mid->mocs, DEFAULT_PAT_INDEX, mid_tiling, COMPRESSION_DISABLED,
> > >   			       comp_type);
> > >   		blt3.dst.ptr = mid->ptr;
> > >   	}
> > > diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> > > index ede545c92..7f2ab8bb6 100644
> > > --- a/tests/intel/gem_lmem_swapping.c
> > > +++ b/tests/intel/gem_lmem_swapping.c
> > > @@ -486,7 +486,7 @@ static void __do_evict(int i915,
> > >   				   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
> > >   		blt_set_object(tmp, tmp->handle, params->size.max,
> > >   			       INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0),
> > > -			       intel_get_uc_mocs(i915), T_LINEAR,
> > > +			       intel_get_uc_mocs(i915), 0, T_LINEAR,
> > >   			       COMPRESSION_DISABLED, COMPRESSION_TYPE_3D);
> > >   		blt_set_geom(tmp, stride, 0, 0, width, height, 0, 0);
> > >   	}
> > > @@ -516,7 +516,7 @@ static void __do_evict(int i915,
> > >   			obj->blt_obj = calloc(1, sizeof(*obj->blt_obj));
> > >   			igt_assert(obj->blt_obj);
> > >   			blt_set_object(obj->blt_obj, obj->handle, obj->size, region_id,
> > > -				       intel_get_uc_mocs(i915), T_LINEAR,
> > > +				       intel_get_uc_mocs(i915), 0, T_LINEAR,
> > >   				       COMPRESSION_ENABLED, COMPRESSION_TYPE_3D);
> > >   			blt_set_geom(obj->blt_obj, stride, 0, 0, width, height, 0, 0);
> > >   			init_object_ccs(i915, obj, tmp, rand(), blt_ctx,
> > > diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> > > index 20bbc4448..27859d5ce 100644
> > > --- a/tests/intel/xe_ccs.c
> > > +++ b/tests/intel/xe_ccs.c
> > > @@ -13,6 +13,7 @@
> > >   #include "igt_syncobj.h"
> > >   #include "intel_blt.h"
> > >   #include "intel_mocs.h"
> > > +#include "intel_pat.h"
> > >   #include "xe/xe_ioctl.h"
> > >   #include "xe/xe_query.h"
> > >   #include "xe/xe_util.h"
> > > @@ -108,8 +109,9 @@ static void surf_copy(int xe,
> > >   	blt_ctrl_surf_copy_init(xe, &surf);
> > >   	surf.print_bb = param.print_bb;
> > >   	blt_set_ctrl_surf_object(&surf.src, mid->handle, mid->region, mid->size,
> > > -				 uc_mocs, BLT_INDIRECT_ACCESS);
> > > -	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs, DIRECT_ACCESS);
> > > +				 uc_mocs, DEFAULT_PAT_INDEX, BLT_INDIRECT_ACCESS);
> > > +	blt_set_ctrl_surf_object(&surf.dst, ccs, sysmem, ccssize, uc_mocs,
> > > +				 DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> > >   	bb_size = xe_get_default_alignment(xe);
> > >   	bb1 = xe_bo_create_flags(xe, 0, bb_size, sysmem);
> > >   	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
> > > @@ -130,7 +132,7 @@ static void surf_copy(int xe,
> > >   		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
> > >   		blt_set_ctrl_surf_object(&surf.dst, ccs2, system_memory(xe), ccssize,
> > > -					 0, DIRECT_ACCESS);
> > > +					 0, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> > >   		blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
> > >   		intel_ctx_xe_sync(ctx, true);
> > > @@ -153,9 +155,9 @@ static void surf_copy(int xe,
> > >   	for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++)
> > >   		ccsmap[i] = i;
> > >   	blt_set_ctrl_surf_object(&surf.src, ccs, sysmem, ccssize,
> > > -				 uc_mocs, DIRECT_ACCESS);
> > > +				 uc_mocs, DEFAULT_PAT_INDEX, DIRECT_ACCESS);
> > >   	blt_set_ctrl_surf_object(&surf.dst, mid->handle, mid->region, mid->size,
> > > -				 uc_mocs, INDIRECT_ACCESS);
> > > +				 uc_mocs, DEFAULT_PAT_INDEX, INDIRECT_ACCESS);
> > >   	blt_ctrl_surf_copy(xe, ctx, NULL, ahnd, &surf);
> > >   	intel_ctx_xe_sync(ctx, true);
> > > @@ -369,7 +371,8 @@ static void block_copy(int xe,
> > >   	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
> > >   	if (config->inplace) {
> > >   		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
> > > -			       T_LINEAR, COMPRESSION_DISABLED, comp_type);
> > > +			       DEFAULT_PAT_INDEX, T_LINEAR, COMPRESSION_DISABLED,
> > > +			       comp_type);
> > >   		blt.dst.ptr = mid->ptr;
> > >   	}
> > > @@ -450,8 +453,8 @@ static void block_multicopy(int xe,
> > >   	if (config->inplace) {
> > >   		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
> > > -			       mid->mocs, mid_tiling, COMPRESSION_DISABLED,
> > > -			       comp_type);
> > > +			       mid->mocs, DEFAULT_PAT_INDEX, mid_tiling,
> > > +			       COMPRESSION_DISABLED, comp_type);
> > >   		blt3.dst.ptr = mid->ptr;
> > >   	}
> > > -- 
> > > 2.41.0
> > > 
