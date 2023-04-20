Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E868BC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 20 Apr 2023 20:48:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9711A10E295;
	Thu, 20 Apr 2023 20:48:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F8710E295
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Apr 2023 20:48:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFEDB60919;
 Thu, 20 Apr 2023 20:48:10 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id D92D8C4339B;
 Thu, 20 Apr 2023 20:48:08 +0000 (UTC)
Date: Thu, 20 Apr 2023 16:48:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZEGlBmIi54V25uP9@rdvivi-mobl4>
References: <20230413072554.4183876-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413072554.4183876-1-riana.tauro@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable d3cold support for dgfx
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
Cc: anshuman.gupta@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Apr 13, 2023 at 12:55:54PM +0530, Riana Tauro wrote:
> allow d3cold for dgfx as xe_bo_restore_kernel
> bug is fixed.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed. Thank you so much for fixing it...

I also tested it on my DG2 here and it survived well :)

$ sudo ./build/tests/xe_pm --r d3cold-multiple-execs
IGT-Version: 1.27.1-g1a619e8d (x86_64) (Linux: 6.3.0-rc4+ x86_64)
Starting subtest: d3cold-multiple-execs
Subtest d3cold-multiple-execs: SUCCESS (17.087s)


> ---
>  drivers/gpu/drm/xe/xe_pci.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b92d8b5a391e..79cc0b8f197a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -750,13 +750,8 @@ static int xe_pci_runtime_idle(struct device *dev)
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  
> -	/*
> -	 * FIXME: d3cold should be allowed (true) if
> -	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
> -	 * however the change to the buddy allocator broke the
> -	 * xe_bo_restore_kernel when the pci device is disabled
> -	 */
> -	 xe->d3cold_allowed = false;
> +	if (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
> +		xe->d3cold_allowed = true;
>  
>  	return 0;
>  }
> -- 
> 2.40.0
> 
