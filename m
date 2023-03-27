Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB912C76195
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 21:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F2510E79B;
	Mon, 27 Mar 2023 21:52:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C82310E779
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 21:50:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B74C261525;
 Mon, 27 Mar 2023 21:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02197C4339B;
 Mon, 27 Mar 2023 21:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679953836;
 bh=ptN5ctiIuPUxc1vhEFeijvowILU3PEacGbW0i0f/YA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gORXpLkhhyfMn46W1sROQkONya5gSFajAqJYItPa/84fMUSz7Py+WrO3xrdEElV7w
 ZnbnxUqzg8lbbia8iYCXPl9HrzdGgY+n0TN1cV3aRMBsH/zRXpukl2RSsAfy8WZiua
 xrOxmbOvl0ItgPDYtMkbMuly9cBEiZKKGZWPWKRyuIB0WXGhIJplps5H5xUQU1cTKB
 Kag2cTus91KOH7MnQBTQdeMOmjJQKxjQZSrzVVNNfdQZ3aa0k/SYnVeOrSyuofcQW5
 M3PdJukDztDrxHSB0yI36oJctFemPev/fh6PduRa7/fGSZ3Ks2CRWqnrdOeKJ8JhvS
 PpYpwrCV+4iYw==
Date: Mon, 27 Mar 2023 23:50:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230327215033.cr3fnbibsulfenoo@intel.intel>
References: <20230327173433.2957645-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327173433.2957645-1-matthew.d.roper@intel.com>
X-Mailman-Approved-At: Mon, 27 Mar 2023 21:52:52 +0000
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pat: Handle unicast vs MCR PAT
 registers
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

Hi Matt,

On Mon, Mar 27, 2023 at 10:34:33AM -0700, Matt Roper wrote:
> Somehow I dropped the error message when sending this; add it back.
> 
> To be squashed next time the Xe driver is rebased.
> 
> Fixes: 11946af00717 ("drm/xe/pat: Handle unicast vs MCR PAT registers")

I don't think you need the Fixes tag here as this is not a fix.

Andi

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a713afdd0510..c860b2122301 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -94,5 +94,7 @@ void xe_pat_init(struct xe_gt *gt)
>  		 * raise an error rather than trying to silently inherit the
>  		 * most recent platform's behavior.
>  		 */
> +		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
> +			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>  	}
>  }
> -- 
> 2.39.2
> 
