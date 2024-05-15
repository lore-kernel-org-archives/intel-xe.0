Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC9BC25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 16:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D1210E904;
	Wed, 15 May 2024 16:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eobG6Nhv";
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AF610E35D;
 Wed, 15 May 2024 16:22:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F1DA2CE172F;
 Wed, 15 May 2024 16:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D46C116B1;
 Wed, 15 May 2024 16:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715790149;
 bh=dyY5xHwj0t2PCxhheNyX2xM7JFQDx7iIcPYvy0V0ZcA=;
 h=From:To:Cc:Subject:Date:From;
 b=eobG6NhvC9EIz45JGu6GXyPPyCjZG1Z2MiAMmxt5uPAyZjX2YPE9fhJ1h/feCwZQR
 f5w4ygry77wpZNWqgZoGu5pVObb52ysXFYzgp2IXnE0h9daEyghWuYSrIqEo6HPIVD
 RfvzEc1TSylMr/xYUuwz5Ba3I1Sjf+5uB1dl7E1tOsfpPNBq5WFST5s+eTsmm/tFc2
 TF/3CMKlVJI0CsW+TJASLex+sr9t+zUJS2h2tf7NnPEqb6BSPQJVV3+7re69BwV3ue
 ewU6ymaybKa6vz9vnc5A2uGNSBKrI4h6wgf+pj2OnbSFCue7+8xUfuxPgHZCgEvKnV
 eqaWmk41Dia3g==
From: Oded Gabbay <ogabbay@kernel.org>
To: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Ofir Bitton <obitton@habana.ai>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 0/2] Update on habanalabs, Xe maintainer status
Date: Wed, 15 May 2024 19:22:20 +0300
Message-Id: <20240515162222.12958-1-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Dave, Sima.

A few weeks ago I left Habana and Intel. Therefore, I'm stepping down from
the maintainer role of both habanalabs and Xe drivers.

Ofir Bitton from Habana will replace me in the role of habanalabs driver
maintainer and as for the Xe driver, Thomas and Lucas will probably suggest
someone in the near future.

Although I'm not going to do full-time kernel development in my next role,
I will remain as the accel maintainer and will probably continue to
participate in discussions from time to time.

Thanks,
Oded

Oded Gabbay (2):
  MAINTAINERS: Change habanalabs maintainer and git repo path
  MAINTAINERS: update Xe driver maintainers

 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--
2.34.1

