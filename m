Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AADC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:31:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C7410E37D;
	Wed, 26 Aug 2026 22:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VQ+uTFUN";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0759910E37D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 22:31:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 230DA60A63;
 Wed, 26 Aug 2026 22:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6A01F000E9;
 Wed, 26 Aug 2026 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787783489;
 bh=6m7GU2EnmV+MtVwBchVkxJufjXpLT1tlbXs0COLM2c0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=VQ+uTFUN1nJvvxwClJxE1hHiIbx+vNbZx4WDbIlJUP20o6gYykxUYklOXcsRLjWrF
 dInTEsPailcegqx+DDBAbO0NYaI3tseFsgNdupKv64WFJV2kzD/Hq0I5aRLAVnfD2y
 O+x3Yrp86K7S2di5587QY9oGRBIteqocdrpYc+zhbO24AAhhXKHojgYzxOID40BgqS
 QVbdwQGxJPOcpOvDRQpBUWJwxL+y6jDc0gx3WJ+SkXICcVBpJHjj0AvJs2hcLbggGh
 FDXlExOVEmvD0GAAm1puj9LaG6r3s0B9BR/+VFVxgqntaEuLYkMpZkvpzG6YgeX3qh
 opTVi75XRpjsw==
Date: Thu, 27 Aug 2026 00:31:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com, 
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH V18 01/14] drm/xe: Link VRAM object with gpu buddy
Message-ID: <ao9pJsL6bJL0NjMC@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-17-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826135136.204044-17-tejas.upadhyay@intel.com>
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

On Wed, Aug 26, 2026 at 07:21:36PM +0530, Tejas Upadhyay wrote:
> Setup to link TTM buffer object inside gpu buddy. This functionality
> is critical for supporting the memory page offline feature on CRI,
> where identified faulty pages must be traced back to their
> originating buffer for safe removal.
> 
> V2(MattB): Clear block->private in xe_ttm_vram_mgr_del as well
> 
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
