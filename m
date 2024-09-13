Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF744EEE26C
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 12:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B2F10E08E;
	Fri, 13 Sep 2024 12:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MmH1P1zN";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8706110E08E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 12:35:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2BC375C04E6;
 Fri, 13 Sep 2024 12:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81E2C4CEC0;
 Fri, 13 Sep 2024 12:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726230927;
 bh=S7JsoSknSmdYN+Z7+B8zmBsIAtK94bUTql5EaC6fut8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MmH1P1zNNxp80Oyl2ilFiB4RLP8UIm36PcJrA/mi3U9BFNgJZ28EWR+exedF/AVVn
 cKUVkXfb0J6/SYEfoYKm8J7qAyIIcgzqrsbXnZYZ9JQM+ZYFQog41BFdNNhyE/i/7h
 wqcnhFv+gwArSwg6brFxnb9ewyRC3g6a9gZQVjNDpcWSdSeHhYM5OoANEFw13LKuJ/
 D34WFHBuSzYt8w0ExYPL3ZV8W8Kxb1rP+jcceHOhEfJdhdMtnSIKBXUl/s4JFrPq8f
 mVDV8jcdAprb+mdbTDmRWAxdCYzM21SFSdsKDQykZNVZiBAjSjshjf23yIA6dkrs5s
 8uX4JdphBJbWA==
Date: Fri, 13 Sep 2024 14:35:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/xe/vram: fix ccs offset calculation
Message-ID: <bcgfdjrp5jvkckdgsqpr26bnvkduvxnw7eliudh47uli6jerxl@frgpwy66hsdq>
References: <20240913120023.310565-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913120023.310565-2-matthew.auld@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matt,

On Fri, Sep 13, 2024 at 01:00:24PM GMT, Matthew Auld wrote:
> Spec says SW is expected to round up to the nearest 128K, if not already
> aligned for the CC unit view of CCS. We are seeing the assert sometimes
> pop on BMG to tell us that there is a hole between GSM and CCS, as well
> as popping other asserts with having a vram size with strange alignment,
> which is likely caused by misaligned offset here.
> 
> BSpec: 68023
> Fixes: b5c2ca0372dc ("drm/xe/xe2hpg: Determine flat ccs offset for vram")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.10+
> ---

and... what is the difference between v1 and v2? :-)

Andi

>  drivers/gpu/drm/xe/xe_vram.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 7e765b1499b1..8e65cb4cc477 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -181,6 +181,7 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>  
>  		offset = offset_hi << 32; /* HW view bits 39:32 */
>  		offset |= offset_lo << 6; /* HW view bits 31:6 */
> +		offset = round_up(offset, SZ_128K); /* SW must round up to nearest 128K */
>  		offset *= num_enabled; /* convert to SW view */
>  
>  		/* We don't expect any holes */
> -- 
> 2.46.0
> 
