Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C261CAC5B3
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 11:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466710E70C;
	Wed, 24 Sep 2025 11:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LvFthsmE";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA48310E70D;
 Wed, 24 Sep 2025 11:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6FAE7408AB;
 Wed, 24 Sep 2025 11:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0C1C4CEE7;
 Wed, 24 Sep 2025 11:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758714056;
 bh=kR+Ok3i6XGeSjpCL+KKwb5rGI3jr4nccDrgAUXF1bQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LvFthsmEvlhX+gZHto0iC6VlV9oJ2dFpgLseinA7HM1739ICX9qCR5bMA3zlZmqHv
 ufniIFudWPdwHNu9Iu15HG+DwkxQg9lYLdx1S+0sDh30kcVaBd15dize6KJYFzrIrp
 +F1Ix7FpEPZvekF9hClI7OleM5ZvlSWXyQLy3LcGu/kdenstOF+3Ts9E9Co48dOGAI
 wl8i0r3FS9S6DEb1B4t/T1hLaNT2+FvVAd4VZJFE9NSPufWnLsvCfoMLcpqvY8xdWF
 9PjglRd9ZfkyLnOCcpM9o0fafhOokz/noFKy3A+Km2dqYALM8Eja+A5Ogc2Qyft+B0
 GJaJbF3FYTy9g==
Date: Wed, 24 Sep 2025 13:40:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/gem: add i915_gem_fence_wait_priority_display()
 helper
Message-ID: <ikxg4ddkaymzhjckhyvs4y4wf7ozuopmfytjykfhiokjl6fw4m@ujuqzucgajn2>
References: <20250924085129.146173-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924085129.146173-1-jani.nikula@intel.com>
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

Hi Jani,

On Wed, Sep 24, 2025 at 11:51:29AM +0300, Jani Nikula wrote:
> Add i915_gem_fence_wait_priority_display() helper to wait with
> I915_PRIORITY_DISPLAY. This drops the intel_plane.c dependency on
> i915_scheduler_types.h, and allows us to remove the compat header from
> xe.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
