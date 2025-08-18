Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14379CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 17:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4D310E4AD;
	Mon, 18 Aug 2025 17:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DOELq4+U";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5316610E4AD
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 17:29:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB73B5C6277;
 Mon, 18 Aug 2025 17:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E32CC4CEEB;
 Mon, 18 Aug 2025 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755538159;
 bh=UoRcLTnGA9G3bBK2gQjDRi8iU5cjUQPh07X2fgzSTmc=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=DOELq4+ULSsPwURdgEDYEKG8F9/m1i2QpqBXF+//FpYBXj9kzLkzBLwqGLMbekVlK
 LIItjxrKgxfu0OS5Drz0x4JdmqO2ERVBWJrTM+i8C0CR69LalkTYUdkc1EvhoVGcZU
 e1iQSY0FwH02GVL9K+NpzSpsxfIiY4pQeTELPQFUmAuKrifeHigKMgy4Gd0wkW6Rhh
 ib2eS37KEY4ZC+7dzaPknSAxHz2e3QQyTP1GCcM+q6bETSLf4JCAn6w9Y2/WzBA+jp
 74lKMfgTSWwzTPZS5N9sRv0dN3nUnDnODbZe76KnB57llvJ3qlh+kJy3hdsw+JuEcY
 itWkHLmecThuA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Aug 2025 19:29:16 +0200
Message-Id: <DC5QC7DRTGQW.3846S7WOEGQMD@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 02/24] drm/gpuvm: Kill drm_gpuva_init()
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Caterina Shablia"
 <caterina.shablia@collabora.com>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <20250814105950.2177480-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250814105950.2177480-3-himal.prasad.ghimiray@intel.com>
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

On Thu Aug 14, 2025 at 12:59 PM CEST, Himal Prasad Ghimiray wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> drm_gpuva_init() only has one internal user, and given we are about to
> add new optional fields, it only add maintenance burden for no real
> benefit, so let's kill the thing now.
>
> v2
> - Remove usage from msm
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>

Caterina doesn't seem to be involved in the handling of this patch, please
either add her Co-developed-by: in case that is approprite or remove her So=
B.

(Also, no need to resend, you can fix this when applying the patch AFAIC.)

> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
