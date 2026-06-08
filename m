Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2E9CD8CA4
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 20:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8AD10F9A9;
	Mon,  8 Jun 2026 20:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a4N9PktP";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B26610F9A9
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 20:22:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AF18E6001D;
 Mon,  8 Jun 2026 20:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1861F00893;
 Mon,  8 Jun 2026 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780950140;
 bh=Vf8Tmm3ri8GHOwDWBtusrIrkK9eORtkvEaf/1PjrZaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=a4N9PktP/zxyZ8OxfMcYoerF9SpVZNxcotnRiA3j2o4ZamuP7ZyoJZc/aeGG6YC2A
 +wlOgV1io/9+OTOaPcbCCmvKi3oQr1psllaQgW0k1ZHhe5aJ0QwUJf4VVasOCtszCT
 JXbLAqONGkdqy8ZtBo0SlGVHeaeTIV7AkqcBuiOJEq85oQ4GQi8zzA1EDvpyYj7yAB
 OT07n2qCKDW0F1hlJ4kAf9zmZLbntVRaQQfmmUrCy8zmc4kcQ7X6TRAMS1QtbLJThG
 md6CHlIQTZze8DpOmlkvrsj20X8ybEIaRtJxDEJasaSoaZAkdMATJjMPiTUIvFEytP
 9jIljJb/kB/jw==
Date: Mon, 8 Jun 2026 22:22:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com, 
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, 
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, 
 andi.shyti@intel.com, rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v3 1/3] From: Riana Tauro <riana.tauro@intel.com> DO NOT
 REVIEW. COMPILATION ONLY
Message-ID: <aicj1fRcs05USEsz@zenone.zhora.eu>
References: <20260608052556.1744123-5-soham.purkait@intel.com>
 <20260608052556.1744123-6-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608052556.1744123-6-soham.purkait@intel.com>
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

Hi Soham,

On Mon, Jun 08, 2026 at 10:55:58AM +0530, Soham Purkait wrote:
> From: Riana Tauro <riana.tauro@intel.com>
> 
> This patch is from https://patchwork.freedesktop.org/series/164393
> Added only for Compilation.

why are you adding this patch? If you want to compile test only,
please use trybot, or, for more urgent or relevant cases, you can
add the [CI] instead of the [PATCH] prefix.

This way the whole series is unusable.

Andi
