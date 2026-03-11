Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2B4103E2F1
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 23:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC38910E925;
	Wed, 11 Mar 2026 23:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BGDbYIvm";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D3210E409;
 Wed, 11 Mar 2026 23:14:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5857C60141;
 Wed, 11 Mar 2026 23:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C29C4CEF7;
 Wed, 11 Mar 2026 23:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773270875;
 bh=PMFM4CqgSssQ4CnXzCICZtNXFK0XLwYNcekNrdndkt0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=BGDbYIvmJx1dWnQHEeX/lP8nZSOvuqeJra5Jw1QVZ2vijaUTEPk72D5GjzWP5qWIb
 y9FT7Y2WFNNjqbVIOM7q0lZ4OO0ug86ZW6ktLt7xPTWpCKMnhd5xSIvlznAeLpC/bN
 fqtbia3sg9ChiZMSAiF4jplAx+jTv+K1HtdyDbMC2ye9F++e7Y/9gl1KXVNyqZoVYe
 VmNc22e5k9EZ7a5NU3z6MFB8mKeYslbBGsBVTQf+q5NPnaiwyLkAl3aaLGaTpuwDxX
 wTOlwR6x+GgmV0lfam2/scLRRHouPNcfgosvUnxWhxZ8ezXoXITfF/QOz1MKpBVD/y
 724rKy9n1gP4Q==
Date: Wed, 11 Mar 2026 18:14:33 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: linux-pci@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/5] vgaarb: mark vga_get() and wrappers as __must_check
Message-ID: <20260311231433.GA1083635@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30fdf953-76b4-4aa6-b430-b9c73f91c8cb@hogyros.de>
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

On Thu, Mar 12, 2026 at 07:51:31AM +0900, Simon Richter wrote:
> On 3/11/26 5:07 AM, Bjorn Helgaas wrote:
> 
> > vga_get() is implemented in vgaarb.c and is only used there.  Can we
> > drop this declaration and the stub below, make it static and
> > __must_check in vgaarb.c?
> 
> It's documented API, and exported. If we make it private, we need to export
> vga_get_interruptible() and vga_get_uninterruptible() instead.

Yes.  vga_get_interruptible() and vga_get_uninterruptible() are
already exported by virtue of being defined in include/linux/vgaarb.h.
We would have to move those implementations to vgaarb.c and
EXPORT_SYMBOL them, leaving just the declaration in vgaarb.h.

Is there other API documentation I don't see?  Are you concerned about
out-of-tree drivers that might use vga_get()?  I don't know how much
to worry about that; usually I don't put too much effort into keeping
out-of-tree things working.

Bjorn
