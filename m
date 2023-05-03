Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BECC77B75
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D3610E0CB;
	Wed,  3 May 2023 13:59:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E9110E0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:59:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FABC6251E;
 Wed,  3 May 2023 13:59:42 +0000 (UTC)
Received: from rdvivi-mobl4 (fmdmzpr02-ext.fm.intel.com [192.55.54.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id BE516C433D2;
 Wed,  3 May 2023 13:59:39 +0000 (UTC)
Date: Wed, 3 May 2023 09:59:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZFJoyJwtpFak/adU@rdvivi-mobl4>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
 <20230503131005.1602412-12-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503131005.1602412-12-jani.nikula@intel.com>
Subject: Re: [Intel-xe] [PATCH 11/18] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 04:09:58PM +0300, Jani Nikula wrote:
> Add the read8 accessor to support intel_de_read8.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

I wonder if we should have this as a new separated patch instead of a fixup?
Then when rebasing with autosquash we make sure to put this before the
xe/display patches...

Oded has already started to review the xe-rev1 branch and I'd like
to avoid changes to the patches that are in that branch already.

But this is really small, probably with his ack we can keep as this fixup!

> ---
>  drivers/gpu/drm/xe/xe_mmio.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 1a32e0f52261..b72a0a75259f 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -17,6 +17,14 @@ struct xe_device;
>  
>  int xe_mmio_init(struct xe_device *xe);
>  
> +static inline u8 xe_mmio_read8(struct xe_gt *gt, u32 reg)
> +{
> +	if (reg < gt->mmio.adj_limit)
> +		reg += gt->mmio.adj_offset;
> +
> +	return readb(gt->mmio.regs + reg);
> +}
> +
>  static inline void xe_mmio_write32(struct xe_gt *gt,
>  				   u32 reg, u32 val)
>  {
> -- 
> 2.39.2
> 
