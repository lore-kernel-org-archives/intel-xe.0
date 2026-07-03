Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7946C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 15:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B4110F83A;
	Fri,  3 Jul 2026 15:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D36y4/Tz";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA5410F83A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 15:08:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EE26841475;
 Fri,  3 Jul 2026 15:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA0B1F000E9;
 Fri,  3 Jul 2026 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783091338;
 bh=FuL4WeewDArElfKjKW2FQOwiHzL8TbbRzcybFbnakyU=;
 h=Date:From:To:Cc:Subject;
 b=D36y4/TzdcXi9HugBw6aCNzdXy3xt7gN28tRcx8CbAv5gXme65yrF4mGXWp0Utfey
 n/cAXe8iX0XZKnVcSy9jWZY8WlbZgwYsYZgepT14hqqJZxc7Q9eVGPYH9MC5Zz6caZ
 3TXXjQsBr/HDpXUkrmn14brHbs0tqa3BZOFB6lPg0XEcSiL31Y+PHAB0bR2LsofNRi
 2KTWEmuK0GYSGJbeN0AmtdXR/V20ZZpWA8yMz4w5ca7viTgmaxFWbiZM+oWlU9r7QM
 xCuGhNvf6ky8KjvnVFqwuGJ2Cr/WFG4Ax4VJCWTmmYVvM7GbxwZN1Zn3gj9Rs8gekB
 0D1FJBJcdChFg==
Date: Fri, 3 Jul 2026 16:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Violet Monti <violet.monti@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drm-xe tree
Message-ID: <akfQhvCUM6kcWeSX@sirena.org.uk>
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

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

   5ff004fdc7377 (drm/xe/rtp: Add struct types for RTP tables)
