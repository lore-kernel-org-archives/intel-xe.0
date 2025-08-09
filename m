Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309CBC87FCF
	for <intel-xe@archiver.kernel.org>; Sat,  9 Aug 2025 12:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF87910E1DF;
	Sat,  9 Aug 2025 12:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s3vqifkD";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D532110E1A6;
 Sat,  9 Aug 2025 12:46:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 277CC601EC;
 Sat,  9 Aug 2025 12:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60800C4CEE7;
 Sat,  9 Aug 2025 12:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754743576;
 bh=ZWlskfAzXt4gDmDhAxEJnCXerdHuinpi0MLZYhTIO7k=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=s3vqifkDcot3TGo8BXhwTg2SsTGdKXmxHj4aEX/XIVERRZH2HcgR1G+muBe/R/lrl
 NE/fTDYMMGBsleLR7Q5KsL87/5pUVcUMyjlN3CpF+/ALRhiN8UxAc8wLZjMBzmJ+qn
 CySXOo1HD8jdd7W477yIR0CdWfwh7shq8ldSeH7oexgueHh6xFhQMiPszcNz45z/Xm
 b/YwIdLchxiuEsQKOS/wwRnDzWBUyUa5D2qVuIMnz9nmMtXC6FSHqId5YB1n0mD3Aj
 HGjluEGAbbCpKpwE9MsoRSUHS4eLCrr9tRGz5Ou+wpptax9hbJaELOujHH2axVCvf1
 lB8n8rFGaWplw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 09 Aug 2025 14:46:13 +0200
Message-Id: <DBXWOL7C9IJO.9A7IOEWNQYG2@kernel.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 03/26] drm/gpuvm: Support flags in drm_gpuvm_map_req
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Boris Brezillon"
 <bbrezillon@kernel.org>, "Caterina Shablia"
 <caterina.shablia@collabora.com>, <dri-devel@lists.freedesktop.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-4-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250807164338.1832254-4-himal.prasad.ghimiray@intel.com>
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

On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
> This change adds support for passing flags to drm_gpuvm_sm_map() and
> sm_map_ops_create(), enabling future extensions that affect split/merge
> logic in drm_gpuvm.
>
> v2
> - Move flag to drm_gpuvm_map_req
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  include/drm/drm_gpuvm.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index cbb9b6519462..116f77abd570 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1049,6 +1049,13 @@ struct drm_gpuva_ops {
>   */
>  #define drm_gpuva_next_op(op) list_next_entry(op, entry)
> =20
> +enum drm_gpuvm_sm_map_ops_flags {

Please also add a doc-comment for the enum type itself, explaing where thos=
e
flags are used, etc.

> +	 /**
> +	  * %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT sm_map ops

Shouldn't this be '@DRM_GPUVM_SM_MAP_OPS_FLAG_NONE:'?

> +	  */
> +	DRM_GPUVM_SM_MAP_OPS_FLAG_NONE =3D 0,
> +};
