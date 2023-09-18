Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A28C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 15:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3392010E28A;
	Mon, 18 Sep 2023 15:14:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783F510E077;
 Mon, 18 Sep 2023 15:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695050057; x=1726586057;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fpAxrujEk1EVvtbrPHEw+EUn6QH1MQqYYkGB+oZxYYY=;
 b=nLWPTnHbHPytDAf5UraLWQgict8+4fgitro7y2v5vNWVIuiGw9yZWadN
 LTLEFor3b4Z/Bd3ex01DzaW8oZhpreZQDmaJ0tzC0gIrezLKazXaqOwk9
 eyX/1moOwqnpDTPtfeDd/cC1+dC1Lr6u40wP7IwvlZsmlY1KeEgXgGlv4
 cJOVLYEm6zjKSEDrzx0MrcInhTQk6CPifdIAnNyaUkMLKCERKndxNcISn
 +7I6Hv1T6ANsoRB4n/Q/CPKbqncWzxwzcTvsXrlba2JS8lBl0kczNYd+x
 BA0CTGv1yf9f6u30khyl74468+675vEK2lfA4CeslhkRLJPdnAqNuBzKR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377000138"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="377000138"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="992764876"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="992764876"
Received: from ldmartin-desk2.corp.intel.com (HELO
 ldmartin-desk2.attlocal.net) ([10.212.23.222])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:14:16 -0700
Date: Mon, 18 Sep 2023 10:14:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <pakcw5gc27ff2x3eugnj24orqhisg7vtkmib325fdi6vf3k7ay@fuumrc6wkiqe>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-13-lucas.demarchi@intel.com>
 <20230918074714.d5kjoyvu7lr2hl4p@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918074714.d5kjoyvu7lr2hl4p@zkempczy-mobl2>
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 12/14] lib/intel_blt: Support
 Xe2 in xy-block-copy command
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

On Mon, Sep 18, 2023 at 09:47:14AM +0200, Zbigniew Kempczyński wrote:
>On Fri, Sep 15, 2023 at 06:23:44AM -0700, Lucas De Marchi wrote:
>> Xe2 block-copy command is slightly different, with dw01 and dw02
>> having a few differences: 1) different bitrange for mocs; 2) no
>> ctrl_surface_type, aux_mode or compression.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/intel_blt.c | 107 +++++++++++++++++++++++++++++++-----------------
>>  1 file changed, 69 insertions(+), 38 deletions(-)
>>
>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>> index 9f8e3dea3..0658d67f4 100644
>> --- a/lib/intel_blt.c
>> +++ b/lib/intel_blt.c
>> @@ -55,15 +55,24 @@ struct gen12_block_copy_data {
>>  		uint32_t client:			BITRANGE(29, 31);
>>  	} dw00;
>>
>> -	struct {
>> -		uint32_t dst_pitch:			BITRANGE(0, 17);
>> -		uint32_t dst_aux_mode:			BITRANGE(18, 20);
>> -		uint32_t pad:				BITRANGE(21, 21);
>> -		uint32_t dst_mocs:			BITRANGE(22, 27);
>> -		uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
>> -		uint32_t dst_compression:		BITRANGE(29, 29);
>> -		uint32_t dst_tiling:			BITRANGE(30, 31);
>> -	} dw01;
>> +	union {
>> +		struct {
>> +			uint32_t dst_pitch:			BITRANGE(0, 17);
>> +			uint32_t dst_aux_mode:			BITRANGE(18, 20);
>> +			uint32_t pad:				BITRANGE(21, 21);
>> +			uint32_t dst_mocs:			BITRANGE(22, 27);
>> +			uint32_t dst_ctrl_surface_type:		BITRANGE(28, 28);
>> +			uint32_t dst_compression:		BITRANGE(29, 29);
>> +			uint32_t dst_tiling:			BITRANGE(30, 31);
>> +		} dw01;
>> +		struct {
>> +			uint32_t dst_pitch:			BITRANGE(0, 17);
>> +			uint32_t pad0:				BITRANGE(18, 23);
>
>I see bit 21 has its meaning for Xe2, is it intentionally you've
>currently included it in 18-23 range as current code likely is
>not using it?

yes. Looking at other fields in this file, it was merging together all
the fields that are not used, calling them either rsvd<N> or pad<N>. I
just followed what was already done in other places.

>
>
>> +			uint32_t dst_mocs:			BITRANGE(24, 27);
>> +			uint32_t pad1:				BITRANGE(28, 29);
>> +			uint32_t dst_tiling:			BITRANGE(30, 31);
>> +		} dw01_xe2;
>> +	};
>>
>>  	struct {
>>  		int32_t dst_x1:				BITRANGE(0, 15);
>> @@ -96,15 +105,24 @@ struct gen12_block_copy_data {
>>  		int32_t src_y1:				BITRANGE(16, 31);
>>  	} dw07;
>>
>> -	struct {
>> -		uint32_t src_pitch:			BITRANGE(0, 17);
>> -		uint32_t src_aux_mode:			BITRANGE(18, 20);
>> -		uint32_t pad:				BITRANGE(21, 21);
>> -		uint32_t src_mocs:			BITRANGE(22, 27);
>> -		uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
>> -		uint32_t src_compression:		BITRANGE(29, 29);
>> -		uint32_t src_tiling:			BITRANGE(30, 31);
>> -	} dw08;
>> +	union {
>> +		struct {
>> +			uint32_t src_pitch:			BITRANGE(0, 17);
>> +			uint32_t src_aux_mode:			BITRANGE(18, 20);
>> +			uint32_t pad:				BITRANGE(21, 21);
>> +			uint32_t src_mocs:			BITRANGE(22, 27);
>> +			uint32_t src_ctrl_surface_type:		BITRANGE(28, 28);
>> +			uint32_t src_compression:		BITRANGE(29, 29);
>> +			uint32_t src_tiling:			BITRANGE(30, 31);
>> +		} dw08;
>> +		struct {
>> +			uint32_t src_pitch:			BITRANGE(0, 17);
>> +			uint32_t pad0:				BITRANGE(18, 23);
>> +			uint32_t src_mocs:			BITRANGE(24, 27);
>> +			uint32_t pad1:				BITRANGE(28, 29);
>> +			uint32_t src_tiling:			BITRANGE(30, 31);
>> +		} dw08_xe2;
>> +	};
>>
>>  	struct {
>>  		uint32_t src_address_lo;
>> @@ -521,7 +539,7 @@ static bool __new_tile_y_type(enum blt_tiling_type tiling)
>>  static void fill_data(struct gen12_block_copy_data *data,
>>  		      const struct blt_copy_data *blt,
>>  		      uint64_t src_offset, uint64_t dst_offset,
>> -		      bool extended_command)
>> +		      bool extended_command, unsigned int ip_ver)
>>  {
>>  	data->dw00.client = 0x2;
>>  	data->dw00.opcode = 0x41;
>> @@ -529,18 +547,24 @@ static void fill_data(struct gen12_block_copy_data *data,
>>  	data->dw00.special_mode = __special_mode(blt);
>>  	data->dw00.length = extended_command ? 20 : 10;
>>
>> -	if (__special_mode(blt) == SM_FULL_RESOLVE)
>> -		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
>> -	else
>> -		data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
>> -	data->dw01.dst_pitch = blt->dst.pitch - 1;
>> +	if (ip_ver >= IP_VER(20, 0)) {
>> +		data->dw01_xe2.dst_pitch = blt->dst.pitch - 1;
>> +		data->dw01_xe2.dst_mocs = blt->dst.mocs;
>> +		data->dw01_xe2.dst_tiling = __block_tiling(blt->dst.tiling);
>> +	} else {
>> +		if (__special_mode(blt) == SM_FULL_RESOLVE)
>> +			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
>> +		else
>> +			data->dw01.dst_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->dst);
>> +		data->dw01.dst_pitch = blt->dst.pitch - 1;
>>
>> -	data->dw01.dst_mocs = blt->dst.mocs;
>> -	data->dw01.dst_compression = blt->dst.compression;
>> -	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
>> +		data->dw01.dst_mocs = blt->dst.mocs;
>> +		data->dw01.dst_compression = blt->dst.compression;
>> +		data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
>>
>> -	if (blt->dst.compression)
>> -		data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
>> +		if (blt->dst.compression)
>> +			data->dw01.dst_ctrl_surface_type = blt->dst.compression_type;
>> +	}
>>
>>  	data->dw02.dst_x1 = blt->dst.x1;
>>  	data->dw02.dst_y1 = blt->dst.y1;
>> @@ -558,14 +582,20 @@ static void fill_data(struct gen12_block_copy_data *data,
>>  	data->dw07.src_x1 = blt->src.x1;
>>  	data->dw07.src_y1 = blt->src.y1;
>>
>> -	data->dw08.src_pitch = blt->src.pitch - 1;
>> -	data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
>> -	data->dw08.src_mocs = blt->src.mocs;
>> -	data->dw08.src_compression = blt->src.compression;
>> -	data->dw08.src_tiling = __block_tiling(blt->src.tiling);
>> -
>> -	if (blt->src.compression)
>> -		data->dw08.src_ctrl_surface_type = blt->src.compression_type;
>> +	if (ip_ver >= IP_VER(20, 0)) {
>> +		data->dw08_xe2.src_pitch = blt->src.pitch - 1;
>> +		data->dw08_xe2.src_mocs = blt->src.mocs;
>> +		data->dw08_xe2.src_tiling = __block_tiling(blt->src.tiling);
>> +	} else {
>> +		data->dw08.src_pitch = blt->src.pitch - 1;
>> +		data->dw08.src_aux_mode = __aux_mode(blt->fd, blt->driver, &blt->src);
>> +		data->dw08.src_mocs = blt->src.mocs;
>> +		data->dw08.src_compression = blt->src.compression;
>> +		data->dw08.src_tiling = __block_tiling(blt->src.tiling);
>> +
>> +		if (blt->src.compression)
>> +			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
>> +	}
>>
>>  	data->dw09.src_address_lo = src_offset;
>>  	data->dw10.src_address_hi = src_offset >> 32;
>> @@ -770,6 +800,7 @@ uint64_t emit_blt_block_copy(int fd,
>>  			     uint64_t bb_pos,
>>  			     bool emit_bbe)
>>  {
>> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>>  	struct gen12_block_copy_data data = {};
>>  	struct gen12_block_copy_data_ext dext = {};
>>  	uint64_t dst_offset, src_offset, bb_offset, alignment;
>> @@ -786,7 +817,7 @@ uint64_t emit_blt_block_copy(int fd,
>>  		     + blt->dst.plane_offset;
>>  	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
>>
>> -	fill_data(&data, blt, src_offset, dst_offset, ext);
>> +	fill_data(&data, blt, src_offset, dst_offset, ext, ip_ver);
>>
>>  	bb = bo_map(fd, blt->bb.handle, blt->bb.size, blt->driver);
>>
>> --
>> 2.40.1
>>
>
>Rest code LGTM:
>
>Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

thanks
Lucas De Marchi

>
>--
>Zbigniew
