Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28135CD3424
	for <intel-xe@archiver.kernel.org>; Sun,  3 May 2026 11:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B648710E2FA;
	Sun,  3 May 2026 11:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SDVoshme";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F225610E2FA
 for <intel-xe@lists.freedesktop.org>; Sun,  3 May 2026 11:41:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 414604446D;
 Sun,  3 May 2026 11:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4715C2BCB4;
 Sun,  3 May 2026 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777808466;
 bh=nXx1cbO4cllnCXWz0u9na2TdgFHsGj74Vc0HirDKlVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SDVoshmeQtTa+D8jSkEPvk5EpptmbfHnXmnfxmJAkjv5K2BtCAkfcJAWrEPIM3du3
 wDiy/mawK2obodhaBr6u/cZzs+mOV+lyCe+c1hyGtbK98I64/GskE6DySH6S2jLSXc
 U/qnc+OBluiriNAvApnwQAB5mqCDVQHIgYjMNJBAe86jp+jO1PGPr0S76WfTNTxhp1
 eS6RjAvyekUuirEV+74Q0ZGouSdxBVzVUNPcZ9DujleJ3sRYgXzJJIkchxNTgLxAXL
 8v5iVzKnYyZc95mLIEXF2zrLBj7M1xZXRbPUFy0uR2a7TRwvC6Z79D3Yg51r7rPNGl
 IyiXbNotk26Mg==
Date: Sun, 3 May 2026 13:41:02 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com
Subject: Re: [PATCH v1] drm/xe/hw_error: Cleanup array map
Message-ID: <afc0MHGBfw_McVP6@zenone.zhora.eu>
References: <20260502180143.1450266-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502180143.1450266-1-raag.jadav@intel.com>
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

Hi Raag,

On Sat, May 02, 2026 at 11:31:43PM +0530, Raag Jadav wrote:
> xe_hw_error_map[] is not worth the memory needed to map two components.
> Clean it up and use switch() instead, which also, in turn, simplifies
> bounds checking logic.
> 
> add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-425 (-425)
> Function                                     old     new   delta
> xe_hw_error_map                              136       -    -136
> xe_hw_error_irq_handler                     3728    3439    -289
> Total: Before=7700, After=7275, chg -5.52%
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
