Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7B6C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 13:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0651410E316;
	Mon,  6 Nov 2023 13:21:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8A710E314;
 Mon,  6 Nov 2023 13:21:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D9D760E17;
 Mon,  6 Nov 2023 13:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3503C433C7;
 Mon,  6 Nov 2023 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699276870;
 bh=7Rrue7iWo7xWOE5v3jmblFvIZlUbm342f9COKV0+8nA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=P8oKSHEFiUaILzU/Mh2+xyABysGTDT8YUVkOOlcpRhIDNLiIz3d4UJj3NeFBRrirx
 PYXtUMxXoJcxP2aTBNYkGkBuuzFak3FrzXq42qiSDzM11FGmxLo/Qs4/Lhy8hY9/0r
 35X7Yut/4HG5w9x1G2KauU7xy99tbU9WfwYrIdSAifMdWHP/au576J+x15LW9cG620
 CckZwVBCRs2eXUU2rNirDu7OiJ3TGh5IupTZX1nOgrccLOtmXdTh6LJVoCxHo2yJSq
 ulFzBivMS8znzBJl5aV+rxHgY9ZFn0tqo6OfkawlWmjHtiQtvxOp6RgvV10G7rmxjt
 SzEWgCDy8RlWA==
Message-ID: <87b4456213b2d4bc3bfa312e28f946ca.mripard@kernel.org>
Date: Mon, 06 Nov 2023 13:21:07 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: =?utf-8?b?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
References: <20231106114827.62492-1-thomas.hellstrom@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/gpuvm: Fix deprecated license identifier
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
Cc: Maxime
 Ripard <mripard@kernel.org>, David Edelsohn <dje.gcc@gmail.com>, Danilo
 Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 6 Nov 2023 12:48:27 +0100, Thomas Hellstr=C3=B6m wrote:
> "GPL-2.0-only" in the license header was incorrectly changed to the
> now deprecated "GPL-2.0". Fix.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Danilo Krummrich <dakr@redhat.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
