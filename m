Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401D6C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC73110E283;
	Wed, 26 Aug 2026 22:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c44QW5eX";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEF510E283
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 22:51:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 751B843C8C;
 Wed, 26 Aug 2026 22:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B321C1F000E9;
 Wed, 26 Aug 2026 22:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787784660;
 bh=8zl0/qSfEzzyY8W1c3clWdaGpvuhiLzdYLeGXQBaOig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=c44QW5eXyNfQ5RMx/lMZEazCw3oZqC3hjpnEOT+dVaIXSGFTmOjnby4bFzz64iCCP
 2qAKA/oXQ5l3+xbOy6UdtBjBc0Yxmrow2aYwI7uRAGvRxr+mWkKAnYopS2rTcdDP1y
 oHixVkL8DHliIv7VlTU9/zDyKz5ii3zslslrdLfR0dUtAVuhY907EizzWoELdccy8U
 biT0m6S0jOI+/vjgX1P5cnU/LBMu/67vZxPcLXtCm8a08WNlWSoCCplNfPevb2+0fK
 n+fjauQEsc2ijwb1C4sYTdJfc7F/PNZPq8m+ABiPstEYQRpI+rgBBTEHVj5z4/O4pc
 dYTruLgWnctNg==
Date: Thu, 27 Aug 2026 00:50:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH V18 06/14] drm/xe/vram: Extract buddy alloc and free
 helpers
Message-ID: <ao9ttVvOHS8yvhdu@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-22-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826135136.204044-22-tejas.upadhyay@intel.com>
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

Hi Tejas,

On Wed, Aug 26, 2026 at 07:21:41PM +0530, Tejas Upadhyay wrote:
> Factor out xe_ttm_vram_buddy_alloc() and xe_ttm_vram_buddy_free()
> from xe_ttm_vram_mgr_new() and xe_ttm_vram_mgr_del(). These helpers
> consolidate block allocation with visible-size tracking and
> block->private tagging, making them reusable by the upcoming VRAM
> page offline reservation path.
> 
> No functional change.
> 
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
