Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A90CD54AC
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 09:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF75F10E101;
	Tue, 19 Sep 2023 09:19:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165D210E101;
 Tue, 19 Sep 2023 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695115197; x=1726651197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hQxi+4qu4LvZfiZZJv4QHR+sS2wm3kD2eO29W1+Hvt0=;
 b=X8UtSTqOLt8k5uFFHfl0NcBCHaEv3HCsN6kRgZ9Vpb1PX8+oaIXc7Zz2
 augRon4hwgwt+Jspep4EFbl5QY0lyvc4O5ifQnVr4gqu64WyBmXoSWzLN
 2bJMNbm5JJ3YntT1BsUefQZ+GKgWCaKb42Zq5KNCQI0w8/8KVMoMwOEFp
 I68Gc+YZvnXkLQJBTbh/Pw4fQ1qfxCVDtf+edmUmpE548IE9oo/DQN82F
 vHuT59fpo6fm37BV6TJriWobPKjQrC0Pxk0155RkRI49oiQnnH/coIJpT
 iiQCzwTB48zV0Ge8RwS7MAe+7K1OOnyUPinm3kFmkK6Osu9mflMMlW1OZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377204337"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="377204337"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="695838768"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="695838768"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 02:19:53 -0700
Date: Tue, 19 Sep 2023 11:19:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230919091950.6iuxsetry62u2iwq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-14-lucas.demarchi@intel.com>
 <20230918075740.gswvt6joydhzbyfc@zkempczy-mobl2>
 <acuibqhswa7alrjto7uokpwcfzisbyxmrnkvbb3usdyco2kuct@wdtecpkkythn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acuibqhswa7alrjto7uokpwcfzisbyxmrnkvbb3usdyco2kuct@wdtecpkkythn>
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t 13/14] lib/intel_blt: Support
 xe2 in xy-fast-copy command
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Lucas,
On 2023-09-18 at 10:17:12 -0500, Lucas De Marchi wrote:
> On Mon, Sep 18, 2023 at 09:57:40AM +0200, Zbigniew Kempczyński wrote:
> > On Fri, Sep 15, 2023 at 06:23:45AM -0700, Lucas De Marchi wrote:
> > > Xe2 xy-fast-copy command is slightly different, with dw01 and dw07
> > > having a few differences: 1) different bitrange for mocs (it was
> > > previously absent in dw07); 2) no dst_memory, src_memory;
> > > 3) hardcoded dst_type_y and src_type_y to 1.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  lib/intel_blt.c | 76 +++++++++++++++++++++++++++++++++++--------------
> > >  1 file changed, 55 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> > > index 0658d67f4..508c2de46 100644
> > > --- a/lib/intel_blt.c
> > > +++ b/lib/intel_blt.c
> > > @@ -1149,16 +1149,27 @@ struct gen12_fast_copy_data {
> > >  		uint32_t client:			BITRANGE(29, 31);
> > >  	} dw00;
> > > 
> > > -	struct {
> > > -		uint32_t dst_pitch:			BITRANGE(0, 15);
> > > -		uint32_t rsvd1:				BITRANGE(16, 23);
> > > -		uint32_t color_depth:			BITRANGE(24, 26);
> > > -		uint32_t rsvd0:				BITRANGE(27, 27);
> > > -		uint32_t dst_memory:			BITRANGE(28, 28);
> > > -		uint32_t src_memory:			BITRANGE(29, 29);
> > > -		uint32_t dst_type_y:			BITRANGE(30, 30);
> > > -		uint32_t src_type_y:			BITRANGE(31, 31);
> > > -	} dw01;
> > > +	union {
> > > +		struct {
> > > +			uint32_t dst_pitch:			BITRANGE(0, 15);
> > > +			uint32_t rsvd1:				BITRANGE(16, 23);
> > > +			uint32_t color_depth:			BITRANGE(24, 26);
> > > +			uint32_t rsvd0:				BITRANGE(27, 27);
> > > +			uint32_t dst_memory:			BITRANGE(28, 28);
> > > +			uint32_t src_memory:			BITRANGE(29, 29);
> > > +			uint32_t dst_type_y:			BITRANGE(30, 30);
> > > +			uint32_t src_type_y:			BITRANGE(31, 31);
> > > +		} dw01;
> > > +		struct {
> > > +			uint32_t dst_pitch:			BITRANGE(0, 15);
> > > +			uint32_t rsvd1:				BITRANGE(16, 19);
> > 
> > Similar to block-copy bit 17 is not described here for Xe2.
> 
> same reason to merge the fields as explained there.
> 
> > 
> > > +			uint32_t dst_mocs:			BITRANGE(20, 23);
> > > +			uint32_t color_depth:			BITRANGE(24, 26);
> > > +			uint32_t rsvd0:				BITRANGE(27, 29);
> > > +			uint32_t dst_type_y_mb1:		BITRANGE(30, 30);
> > > +			uint32_t src_type_y_mb1:		BITRANGE(31, 31);
> > > +		} dw01_xe2;
> > > +	};
> > > 
> > >  	struct {
> > >  		int32_t dst_x1:				BITRANGE(0, 15);
> > > @@ -1183,10 +1194,18 @@ struct gen12_fast_copy_data {
> > >  		int32_t src_y1:				BITRANGE(16, 31);
> > >  	} dw06;
> > > 
> > > -	struct {
> > > -		uint32_t src_pitch:			BITRANGE(0, 15);
> > > -		uint32_t rsvd0:				BITRANGE(16, 31);
> > > -	} dw07;
> > > +	union {
> > > +		struct {
> > > +			uint32_t src_pitch:			BITRANGE(0, 15);
> > > +			uint32_t rsvd0:				BITRANGE(16, 31);
> > > +		} dw07;
> > > +		struct {
> > > +			uint32_t src_pitch:			BITRANGE(0, 15);
> > > +			uint32_t rsvd0:				BITRANGE(16, 19);
> > > +			uint32_t src_mocs:			BITRANGE(20, 23);
> > > +			uint32_t rsvd1:				BITRANGE(24, 31);
> > > +		} dw07_xe2;
> > > +	};
> > > 
> > >  	struct {
> > >  		uint32_t src_address_lo;
> > > @@ -1285,11 +1304,13 @@ uint64_t emit_blt_fast_copy(int fd,
> > >  			    uint64_t bb_pos,
> > >  			    bool emit_bbe)
> > >  {
> > > +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
> > >  	struct gen12_fast_copy_data data = {};
> > >  	uint64_t dst_offset, src_offset, bb_offset, alignment;
> > >  	uint32_t bbe = MI_BATCH_BUFFER_END;
> > >  	uint32_t *bb;
> > > 
> > > +
> > >  	alignment = get_default_alignment(fd, blt->driver);
> > > 
> > >  	data.dw00.client = 0x2;
> > > @@ -1298,12 +1319,20 @@ uint64_t emit_blt_fast_copy(int fd,
> > >  	data.dw00.src_tiling = __fast_tiling(blt->src.tiling);
> > >  	data.dw00.length = 8;
> > > 
> > > -	data.dw01.dst_pitch = blt->dst.pitch;
> > > -	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
> > > -	data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
> > > -	data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
> > > -	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
> > > -	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
> > > +	if (ip_ver >= IP_VER(20, 0)) {
> > > +		data.dw01_xe2.dst_pitch = blt->dst.pitch;
> > > +		data.dw01_xe2.dst_mocs = blt->dst.mocs;
> > > +		data.dw01_xe2.color_depth = __fast_color_depth(blt->color_depth);
> > > +		data.dw01_xe2.dst_type_y_mb1 = 1;
> > > +		data.dw01_xe2.src_type_y_mb1 = 1;
> > 
> > I would rather use:
> > 
> > src_type_y = 1; /* Must be programmed to on Xe2 */
> > ...
> > 
> > mb1 - ambiguous for me, megabytes first, lesser 'must be'.
> 
> yeah, usually we have "mbz" as "must be zero", so tried to extend it to
> "must be one".

mbs - must be set ? But if used please comment this at struct
definition, there are too many shortcuts.

Regards,
Kamil

> 
> 
> I will change this on next version.
> 
> > 
> > > +	} else {
> > > +		data.dw01.dst_pitch = blt->dst.pitch;
> > > +		data.dw01.color_depth = __fast_color_depth(blt->color_depth);
> > > +		data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
> > > +		data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
> > > +		data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
> > > +		data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
> > > +	}
> > > 
> > >  	data.dw02.dst_x1 = blt->dst.x1;
> > >  	data.dw02.dst_y1 = blt->dst.y1;
> > > @@ -1323,7 +1352,12 @@ uint64_t emit_blt_fast_copy(int fd,
> > >  	data.dw06.src_x1 = blt->src.x1;
> > >  	data.dw06.src_y1 = blt->src.y1;
> > > 
> > > -	data.dw07.src_pitch = blt->src.pitch;
> > > +	if (ip_ver >= IP_VER(20, 0)) {
> > > +		data.dw07_xe2.src_pitch = blt->src.pitch;
> > > +		data.dw07_xe2.src_mocs = blt->src.mocs;
> > > +	} else {
> > > +		data.dw07.src_pitch = blt->src.pitch;
> > > +	}
> > > 
> > >  	data.dw08.src_address_lo = src_offset;
> > >  	data.dw09.src_address_hi = src_offset >> 32;
> > > --
> > > 2.40.1
> > > 
> > 
> > With my minor comment addressed:
> > 
> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> thanks
> Lucas De Marchi
> 
> > 
> > --
> > Zbigniew
