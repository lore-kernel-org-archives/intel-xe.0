Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE8EC7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:50:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AAD10E3AA;
	Thu, 18 May 2023 17:50:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3393A10E104
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:50:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CD1461B7C;
 Thu, 18 May 2023 17:50:05 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id F11BCC433EF;
 Thu, 18 May 2023 17:50:03 +0000 (UTC)
Date: Thu, 18 May 2023 13:50:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZGZlStPg0uEjnNAP@rdvivi-mobl4>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-14-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-14-matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH 13/26] drm/xe: Add media GT to tile
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

On Wed, May 10, 2023 at 08:47:09PM -0700, Matt Roper wrote:
> This media_gt pointer isn't actually allocated yet.  Future patches will
> start hooking it up at appropriate places in the code, and then creation
> of the media GT will be added once those infrastructure changes are in
> place.

I think it could be squashed in some other patch, but anyway

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1033f233f6ab..2cf67ea57aac 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -81,7 +81,12 @@ struct xe_tile {
>  	 */
>  	struct xe_gt *primary_gt;
>  
> -	/* TODO: Add media GT here */
> +	/**
> +	 * @media_gt: Media GT
> +	 *
> +	 * Only present on devices with media version >= 13.
> +	 */
> +	struct xe_gt *media_gt;
>  
>  	/**
>  	 * @mmio: MMIO info for a tile.
> -- 
> 2.40.0
> 
