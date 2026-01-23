Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEF6D74EEC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 15:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF4410EB1B;
	Fri, 23 Jan 2026 15:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nEUi3UDH";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ACC10E2CB
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 15:34:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D9A6740E8A;
 Fri, 23 Jan 2026 15:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4815C4CEF1;
 Fri, 23 Jan 2026 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769182470;
 bh=YseJkVABJlm/jhvdY1L58/hMfxdtbJczxH6fIXRkGEI=;
 h=Date:From:To:Cc:Subject:From;
 b=nEUi3UDHo7zwvCliR3TkXUEhWp5O8g4Mcx0kD45s5h3GeiHPgHPfEOYynmJYCevuA
 uEk3O2FgTusGHg/P0kHMIcIdRnN0141qBHSr1og80y0eIWOgUu2M+vI06/yjUmpRtf
 pZN5zIpyP46F6IIlbsvo+f/uNzmEVNMlik/gZ/1NtCRszCPjdg8H1seNYl5reW3YAv
 ToeQujjfh34EtjUziDMZWImPOlK1dx9ucvB3xTvaCS7YB+dMsFf9i5Im8mejYOb0tv
 ru0ZCDJbrdgtx2+G8iEfASbKDGYrmVJS9bvnE5pguWM8gEno2pq7h3CtK4LJ/M1+4n
 ySgzh9nLGhnOA==
Date: Fri, 23 Jan 2026 15:34:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <aXOVAyMnaCIwgF6r@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  include/drm/drm_pagemap.h

between commit:

  bdcdf968be314 ("drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE")

from the drm-fixes tree and commit:

  1e372b246199c ("drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/drm/drm_pagemap.h
index b7a78c1ca7670,2baf0861f78f3..0000000000000
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
