Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC047C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BF810E1F8;
	Mon, 18 Sep 2023 07:47:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8085110E0E3;
 Mon, 18 Sep 2023 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695023238; x=1726559238;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=j6CRm9tZrjrs5t3EjmZXCdSfaUUYe4gD8iSY+8qlJss=;
 b=SWdTBU7jYXW/gpIHaxXjSXPfIvNejr+09STdb110XH30iDGk2jpQnzAh
 q1t8oKuf33IdSNVDkXYlRGpZJ0UBhCehnDsYbtC4HitRZfGbxNcJjiwh9
 BH5JP0rmbJepEUe7m4tnJ66k3fElObcbNKagAmNDjZ7uP/rqQPw3Dglqo
 SbepKjVHxS16WIKLt05k8FANPK0+RqZaBF+GUdLDdRpS7JNeFph9sYEQA
 VaktaAd8OXv1t0/8HliYxNr0Jm4eQx7cihH6FM/VNhfX5UPikz5TPYxuE
 8ZU1xjhfvBO7TCaSPgeiTjH/6cjFOPcfeI2JmbQm2af9na48Q/G3O95rB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="359007652"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="359007652"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="860960457"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="860960457"
Received: from ktrzcins-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.6.101])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:47:16 -0700
Date: Mon, 18 Sep 2023 09:47:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230918074714.d5kjoyvu7lr2hl4p@zkempczy-mobl2>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-13-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915132346.1845909-13-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH i-g-t 12/14] lib/intel_blt: Support Xe2 in
 xy-block-copy command
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

On Fri, Sep 15, 2023 at 06:23:44AM -0700, Lucas De Marchi wrote:
> Xe2 block-copy command is slightly different, with dw01 and dw02
> having a few differences: 1) different bitrange for mocs; 2) no
> ctrl_surface_type, aux_mode or compression.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/intel_blt.c | 107 +++++++++++++++++++++++++++++++-----------------
>  1 file changed, 69 insertions(+), 38 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 9f8e3dea3..0658d67f4 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -55,15 +55,24 @@ struct gen12_block_copy_data {
>  		uint32_t client:			BITRANGE(29, 31);
>  	} dw00;
>  
> -	struct {
> -		uint32_t dst_pitch:			BITRANGE(0, 17);
> -		uint32_t dst_aux_mode:			BITRANGE(18, 20);
> -		uint32_t pad:				BITRANGE(21, 21);
> -		uint32_t dst_mocs:			BITRANGE(22, 27);
> -		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
> -		uint32_t dst_compression:		BITRANGE(29, 29);
> -		uint32_t dst_tiling:			BITRANGE(30, 31);
> -	} dw01;
> +	union {
> +		struct {
> +			uint32_t dst_pitch:			BITRANGE(0, 17);
> +			uint32_t dst_aux_mode:			BITRANGE(18, 20);
> +			uint32_t pad:				BITRANGE(21, 21);
> +			uint32_t dst_mocs:			BITRANGE(22, 27);
> +			uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
> +			uint32_t dst_compression:		BITRANGE(29, 29);
> +			uint32_t dst_tiling:			BITRANGE(30, 31);
> +		} dw01;
> +		struct {
> +			uint32_t dst_pitch:			BITRANGE(0, 17);
> +			uint32_t pad0:				BITRANGE(18, 23);

I see bit 21 has its meaning for Xe2, is it intentionally you've
currently included it in 18-23 range as current code likely is
not using it?


> +			uint32_t dst_mocs:			BITRANGE(24, 27);
> +			uint32_t pad1:				BITRANGE(28, 29);
> +			uint32_t dst_tiling:			BITRANGE(30, 31);
> +		} dw01_xe2;
> +	};
>  
>  	struct {
>  		int32_t dst_x1:				BITRANGE(0, 15);
> @@ -96,15 +105,24 @@ struct gen12_block_copy_data {
>  		int32_t src_y1:				BITRANGE(16, 31);
>  	} dw07;
>  
> -	struct {
> -		uint32_t src_pitch:			BITRANGE(0, 17);
> -		uint32_t src_aux_mode:			BITRANGE(18, 20);
> -		uint32_t pad:				BITRANGE(21, 21);
> -		uint32_t src_mocs:			BITRANGE(22, 27);
> -		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
> -		uint32_t src_compression:		BITRANGE(29, 29);
> -		uint32_t src_tiling:			BITRANGE(30, 31);
> -	} dw08;
> +	union {
> +		struct {
> +			uint32_t src_pitch:			BITRANGE(0, 17);
> +			uint32_t src_aux_mode:			BITRANGE(18, 20);
> +			uint32_t pad:				BITRANGE(21, 21);
> +			uint32_t src_mocs:			BITRANGE(22, 27);
> +			uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
> +			uint32_t src_compression:		BITRANGE(29, 29);
> +			uint32_t src_tiling:			BITRANGE(30, 31);
> +		} dw08;
> +		struct {
> +			uint32_t src_pitch:			BITRANGE(0, 17);
> +			uint32_t pad0:				BITRANGE(18, 23);
> +			uint32_t src_mocs:			BITRANGE(24, 27);
> +			uint32_t pad1:				BITRANGE(28, 29);
> +			uint32_t src_tiling:			BITRANGE(30, 31);
> +		} dw08_xe2;
> +	};
>  
>  	struct {
>  		uint32_t src_address_lo;
> @@ -521,7 +539,7 @@ static bool __new_tile_y_type(enum blt_tiling_type tiling)
>  static void fill_data(struct gen12_block_copy_data *data,
>  		      const struct blt_copy_data *blt,
>  		      uint64_t src_offset, uint64_t dst_offset,
> -		      bool extended_command)
> +		      bool extended_command, unsigned int ip_ver)
>  {
>  	data->dw00.client = 0x2;
>  	data->dw00.opcode = 0x41;
> @@ -529,18 +547,24 @@ static void fill_data(struct gen12_block_copy_data *data,
>  	data->dw00.special_mode = __special_mode(blt);
>  	data->dw00.length = extended_command ? 20 : 10;
>  
> -	if (__special_mode(blt) == SM_FULL_RESOLVE)
> -		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> -	else
> -		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
> -	data->dw01.dst_pitch = blt->dst.pitch - 1;
> +	if (ip_ver >= IP_VER(20, 0)) {
> +		data->dw01_xe2.dst_pitch = blt->dst.pitch - 1;
> +		data->dw01_xe2.dst_mocs = blt->dst.mocs;
> +		data->dw01_xe2.dst_tiling = __block_tiling(blt->dst.tiling);
> +	} else {
> +		if (__special_mode(blt) == SM_FULL_RESOLVE)
> +			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> +		else
> +			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
> +		data->dw01.dst_pitch = blt->dst.pitch - 1;
>  
> -	data->dw01.dst_mocs = blt->dst.mocs;
> -	data->dw01.dst_compression = blt->dst.compression;
> -	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
> +		data->dw01.dst_mocs = blt->dst.mocs;
> +		data->dw01.dst_compression = blt->dst.compression;
> +		data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
>  
> -	if (blt->dst.compression)
> -		data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
> +		if (blt->dst.compression)
> +			data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
> +	}
>  
>  	data->dw02.dst_x1 = blt->dst.x1;
>  	data->dw02.dst_y1 = blt->dst.y1;
> @@ -558,14 +582,20 @@ static void fill_data(struct gen12_block_copy_data *data,
>  	data->dw07.src_x1 = blt->src.x1;
>  	data->dw07.src_y1 = blt->src.y1;
>  
> -	data->dw08.src_pitch = blt->src.pitch - 1;
> -	data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> -	data->dw08.src_mocs = blt->src.mocs;
> -	data->dw08.src_compression = blt->src.compression;
> -	data->dw08.src_tiling = __block_tiling(blt->src.tiling);
> -
> -	if (blt->src.compression)
> -		data->dw08.src_ctrl_surface_type = blt->src.compression_type;
> +	if (ip_ver >= IP_VER(20, 0)) {
> +		data->dw08_xe2.src_pitch = blt->src.pitch - 1;
> +		data->dw08_xe2.src_mocs = blt->src.mocs;
> +		data->dw08_xe2.src_tiling = __block_tiling(blt->src.tiling);
> +	} else {
> +		data->dw08.src_pitch = blt->src.pitch - 1;
> +		data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
> +		data->dw08.src_mocs = blt->src.mocs;
> +		data->dw08.src_compression = blt->src.compression;
> +		data->dw08.src_tiling = __block_tiling(blt->src.tiling);
> +
> +		if (blt->src.compression)
> +			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
> +	}
>  
>  	data->dw09.src_address_lo = src_offset;
>  	data->dw10.src_address_hi = src_offset >> 32;
> @@ -770,6 +800,7 @@ uint64_t emit_blt_block_copy(int fd,
>  			     uint64_t bb_pos,
>  			     bool emit_bbe)
>  {
> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>  	struct gen12_block_copy_data data = {};
>  	struct gen12_block_copy_data_ext dext = {};
>  	uint64_t dst_offset, src_offset, bb_offset, alignment;
> @@ -786,7 +817,7 @@ uint64_t emit_blt_block_copy(int fd,
>  		     + blt->dst.plane_offset;
>  	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
>  
> -	fill_data(&data, blt, src_offset, dst_offset, ext);
> +	fill_data(&data, blt, src_offset, dst_offset, ext, ip_ver);
>  
>  	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
>  
> -- 
> 2.40.1
>

Rest code LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
