Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ADFC61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 22:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C0C10EE08;
	Wed, 26 Aug 2026 22:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XgTlOT4s";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C5410EE08
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 22:44:22 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E550060A63;
 Wed, 26 Aug 2026 22:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A0A1F000E9;
 Wed, 26 Aug 2026 22:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787784261;
 bh=TMlQ/iA7iE/63ti/KGLpJZ2uzV1Qkyooz1UqGtEGa6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XgTlOT4smp1cG+20Xx3wbTLlAI41ToW7jljvVBbpEY5RLQ859bMgIwgJ+vNA3oF6U
 bwWZK+jRvB1/F9DIErmDYjAq18Ee0/uwyRTLCd3RZNwLdvs63utMPKDOzYB55U1Gew
 oNRy0Mb05dSgBG7aSfrWFBc+tyLd0nMQpIxqW2STf6Qk7uyRJb4jBX6+0rEXvgG5UM
 JI/4AlZOTCuhOGtzY/IO9io5bZNOkD48NuYwKJnpgdTAgqqB0jGg5k8KmvwQnPVdAI
 61plrWAFZnTI5XSYBAP6qQbsuZeORLIa1+64Fpb8U6MG82CnPIAuMf5VQnXctCZZ9f
 cbgAcmg/kzJ+g==
Date: Thu, 27 Aug 2026 00:44:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH V18 04/14] drm/xe/bo: Make xe_bo_is_user() public
Message-ID: <ao9sLYOanyzGLIyh@zenone.zhora.eu>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-20-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826135136.204044-20-tejas.upadhyay@intel.com>
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

On Wed, Aug 26, 2026 at 07:21:39PM +0530, Tejas Upadhyay wrote:
> Export xe_bo_is_user() so it can be used by the VRAM page offline
> code to distinguish user-created BOs from kernel BOs when deciding
> whether a faulty page can be safely purged or requires a full reset.
> 
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
