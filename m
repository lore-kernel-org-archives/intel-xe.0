Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D797BCA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 16:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9939410E790;
	Wed, 20 Aug 2025 16:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jSqEN71e";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C1410E790;
 Wed, 20 Aug 2025 16:38:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EB02441967;
 Wed, 20 Aug 2025 16:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6838EC4CEE7;
 Wed, 20 Aug 2025 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755707891;
 bh=KLf/x1bae8ZNcSXG4Tm3gMEPqXJdXzwsfFGsA+zQQN0=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=jSqEN71ef8dl7weol/2WNQV5dm5pqCh9gvFpUSr7jCWL7iqIGVuKKXkdFybuvMfHX
 8L3/CZ1p51AJsA9g+IE/PCOgjEPWUe7V9Dm3gpiCiEvbNv/JouoPC/5I401RqDDXWc
 nZq1DwUuVGivzJlGjR4D9t6fTiVHjW4r0YRaeSyivh9hZi3JLko0Z1iP+XEl54u8Rq
 qGhLbW9mjn2QQKznNVza+Me5wDIGSm5Awxdk8rnRZ85i6pmndCGv8IehDxuwFkFkZz
 1qbXxt9UtsuDjaeGjVIdrxEVRS8z1sxIhaR1y0ul6yXC6L18mgPOwbKbXWYF4gI4om
 5wUwmVaqc7b+Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 18:38:08 +0200
Message-Id: <DC7EI5AXQHU7.1UZ948MYXH3W4@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
Cc: <intel-xe@lists.freedesktop.org>, "Boris Brezillon"
 <bbrezillon@kernel.org>, "Matt Coster" <matt.coster@imgtec.com>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Matthew Brost"
 <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
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

On Wed Aug 20, 2025 at 5:23 PM CEST, Himal Prasad Ghimiray wrote:
> Renamed 'map' to 'op' in drm_gpuvm_map_req for clarity and added
> corresponding documentation. No functional changes introduced.
>
> Fixes: baf1638c0956 ("drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create")
> Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
> Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>
