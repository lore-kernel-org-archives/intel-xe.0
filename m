Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BD9CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 15:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2A410F02A;
	Wed, 17 Jun 2026 15:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SnQCGLuL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D110F027;
 Wed, 17 Jun 2026 15:15:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 06DD160122;
 Wed, 17 Jun 2026 15:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368EC1F00A3A;
 Wed, 17 Jun 2026 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
 s=korg; t=1781709354;
 bh=PRtwX9XZuKeOePBQ1eaXIZKRl+06gjsxGdVK1OpTJto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=SnQCGLuLG6CoDNtPjBGeifYyw4Q5oqmW4Wje3sAiyfVUKH81TG114bc1QrLiGivRX
 i6osstjx2OzdrQH8fZuKZEq+j38LZCpiO8ePbHj3Ix+jcdKUkIgDtQ+ydapMv7Qx61
 EpwcnJkvHen2ne2XtH2K5R3ZYJwJDYy1xnBteMsI=
Date: Wed, 17 Jun 2026 11:15:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org, tools@kernel.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/14] drm/i915/cdclk: Don't bail if pcode post nofify
 fails
Message-ID: <20260617-horned-orthodox-zebu-625bcb@meerkat>
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-2-ville.syrjala@linux.intel.com>
 <511da82834da302ac50a326c082c45f6134b2556@intel.com>
 <8c18eca330bd63182319a18f238e78f1c451ede2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c18eca330bd63182319a18f238e78f1c451ede2@intel.com>
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

On Wed, Jun 17, 2026 at 04:29:16PM +0300, Jani Nikula wrote:
> >> We already changed the actual cdclk frequency by the time we do
> >> the pcode post notify. So skipping the subsequent readout is plain
> >> wrong.
> >
> > Fixes: ?
> 
> Turns out posing the question about Fixes: trailer like that leads to b4
> shazam literally adding that trailer. Please clean them up before
> pushing!
> 
> Cc: tools@k.o and Konstantin, FYI

We now recognize this and properly change this to:

| Fixes: ¯\_(ツ)_/¯

(Just kidding... I'll see if I can clean this up to be more discerning of the
actual Fixes: format.)

Thanks,
-K
