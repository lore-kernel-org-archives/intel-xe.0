Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE913EEC2A0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC3310E45A;
	Mon, 23 Feb 2026 22:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nRhl7swP";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CC310E457;
 Mon, 23 Feb 2026 22:30:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A71642E0C;
 Mon, 23 Feb 2026 22:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A76C116C6;
 Mon, 23 Feb 2026 22:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771885846;
 bh=Ri8Bcp3HNyoGxaB+xtimKGPg09Xa/BNnKr7GVNRZg7c=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=nRhl7swPKKcAroLdDFvPAoPx0CnV7LfQtzl7aH7Z6tqtRtrp0UpJ/Ki2jnqXchNkn
 aahglVaYJ8vqzJfIU27+WF/5baLzzHzVS3a+BEPeaK8ghSZI9BJTLP1OzfIc/t0fPq
 kZYj94WApvOpOW6+0euJsMyckPB5qds4vmN7styV8BRmKFR67KwauijEoojtM/Yj91
 KE9hI6X93wQZs1IatN8YKdKrMFU6MTZu5Q550rQmRQCzLKLsDauyu6yOOOgCvjS9Ls
 7KSx3BM4Yca3ZbQ3mJ5b0MJn9d85bNDoZ4C/27GsEPmK1Yhg+0Iec/W6EZXiZDMwIY
 1rd8THtiso8lQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:30:42 +0100
Message-Id: <DGMP3YT8VSCW.3OJRL3TK5PLRQ@kernel.org>
Subject: Re: [PATCH] gpu: Fix uninitialized buddy for built-in drivers
Cc: <dri-devel@lists.freedesktop.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>, "Matthew Auld"
 <matthew.auld@intel.com>, "Arun Pravin" <arunpravin.paneerselvam@amd.com>
To: "Koen Koning" <koen.koning@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
In-Reply-To: <20260213152047.179628-1-koen.koning@linux.intel.com>
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

(Cc: Matthew, Arun)

On Fri Feb 13, 2026 at 4:20 PM CET, Koen Koning wrote:
> Move buddy to the start of the link order, so its __init runs before any
> other built-in drivers that may depend on it. Otherwise, a built-in
> driver that tries to use the buddy allocator will run into a kernel NULL
> pointer dereference because slab_blocks is uninitialized.
>
> Specifically, this fixes drm/xe (as built-in) running into a kernel
> panic during boot, because it uses buddy during device probe.
>
> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part tw=
o)")
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: intel-xe@lists.freedesktop.org
> Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
> ---
>  drivers/gpu/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 5cd54d06e262..b4e5e338efa2 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -2,8 +2,9 @@
>  # drm/tegra depends on host1x, so if both drivers are built-in care must=
 be
>  # taken to initialize them in the correct order. Link order is the only =
way
>  # to ensure this currently.
> +# Similarly, buddy must come first since it is used by other drivers.
> +obj-$(CONFIG_GPU_BUDDY)	+=3D buddy.o
>  obj-y			+=3D host1x/ drm/ vga/ tests/
>  obj-$(CONFIG_IMX_IPUV3_CORE)	+=3D ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)		+=3D trace/
>  obj-$(CONFIG_NOVA_CORE)		+=3D nova-core/
> -obj-$(CONFIG_GPU_BUDDY)		+=3D buddy.o
> --=20
> 2.48.1

