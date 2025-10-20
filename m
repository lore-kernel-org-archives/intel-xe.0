Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ADFCCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 12:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C52B10E3A1;
	Mon, 20 Oct 2025 12:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDh59/Xr";
	dkim-atps=neutral
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DC010E398
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 10:05:16 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso2224894f8f.0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760954715; x=1761559515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmRi35y6N5WRRBxahDavUEXtA6gcUuvhGuS8xAmEQp0=;
 b=gDh59/XrloRMxbe/m8xm8igCzsZ8fbt0tPQJVxrL2MMgIqfkqAR7P4VKk6FMAJvhiD
 eQ/PCqi+99FbWnrL95l/UlNJnflMLG5bhDqb1BV6P+ZeCLnGqTCfMzxWVkhoNj/TBQ7C
 q3PpXgX7Iz43XMzmUQLdyud4im8WpltdgrfQsog/fBT73+km/cJ7qcvlfIqINHSAy7V1
 FY/8NFwtVcbrz0sc2sG0wMeDReY7kcYqGZjwSry6cErPSjJFFriYU7soxFg7sNUuJlBl
 7nZMSu7eQk4mkmvyoC7AHisAtBXTrvKfBzZIezFEGdWiF7Ycb7PFZwxm8ofPNi+BxDNJ
 Byzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760954715; x=1761559515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmRi35y6N5WRRBxahDavUEXtA6gcUuvhGuS8xAmEQp0=;
 b=MVEJjMm3xUgtdPzQ10rGIq2x1Vh86XvVNO22VBy2wg997xzAsPzXPf/+FsEkx72Qho
 NkO2U1Y2f/xhBQDGv1qZzFYAMjDqgbDH+4SgGS9FwTW0Ww85IzCGPCsq0NLF7y4pv6zo
 xFcSgbBhSfxPBU6mipk6UsaJMTBeLnpH3Ilzc0g+nx+xXBVkl7DawFdhDBNaupvzYA/P
 k/+4aEW2rUhS/25pNzvvXcMvKfBlEdeYNRs9fkVKvFUgQUziGuNK4UmAkOjsxRQdrwZL
 YMTBKMXSxO1loobc7tCUiQsXzkqvelIssdjhioSq2EPgk3qu+u8Mc16UGRLxmQLKKWWk
 eF1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvn6MAMISpbuXc1whcUrVS1yRX4B/+ygB8besSIuYKeI7x/cMqGWvdWaEx6zl152OekpdCa5jkfA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRSpKLFBbt+pg+gKQgmYZYEt82YIH/rg1b1JRwXcVR68O8vRWr
 9xLJKkhnYpdGBsAuH7MplHlEgf5/B14UzZ8eiqH73LHSICer5EzyWbLd
X-Gm-Gg: ASbGnctXNGYeOJlLbC6yve5p8UiHsCXQX7Bqy/WfREgd4vzqvykMdiTFhWTcHiCqtKS
 TORWcUXCSNc6+FdeXTOIy9Z8J9DYiJq8zwLyXRH4Mutbm3AUaTmUmcqj7Qm/2zPWKCMz/BQIDBv
 +4+nNqL5xqYGHGiPReZixKT3Dhpe2uQidu//TPfhee8+M1HnhtGJLfCdm0f+ao2UEa7QLIFYs1Z
 GJKLzoKDYbyteD2jQvuDyai4BDR6PaahUUTiz4AkPUgDxAaxWZmj9e+85aUEHQmCxVaYWq/yDvE
 t8z9YmbU0DXXTcan7e4t+ifo4JPIeCuY0S5rYMQ8j4J1Fjdh3dIOdqvnbBjrjZxX7mH+GjueuRg
 Q25mfH303yLHw+BzrU5yGe6cPt5LXZ/akFdt8ZUqDqB6fawfB9kEFbRM5WR7TMLPG6b0UnHEL9l
 nS+kL3dvV0xoaQ9bWG65p2190oFMh8lxO8rAL5HldZdDhiD1poxqy9
X-Google-Smtp-Source: AGHT+IFIwYtaN8vVGOKJnzPfzSNFBFhGVp3hgUQ/fiHsNQ1iCinDla5G+0DyDEO1L7XTYHNYpfyOFA==
X-Received: by 2002:a05:6000:144a:b0:427:e1bf:13bd with SMTP id
 ffacd0b85a97d-427e1bf1a74mr5180978f8f.52.1760954715031; 
 Mon, 20 Oct 2025 03:05:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5bab52sm14419230f8f.22.2025.10.20.03.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 03:05:14 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:05:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Neph <ryanneph@google.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe/configfs: fix clang warnings for missing
 parameter name
Message-ID: <20251020110513.48d18788@pumpkin>
In-Reply-To: <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
References: <20251017-rn-cfi-v1-0-bf66e6ad4fcd@google.com>
 <20251017-rn-cfi-v1-2-bf66e6ad4fcd@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 20 Oct 2025 12:58:48 +0000
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

On Fri, 17 Oct 2025 12:46:26 -0700
Ryan Neph <ryanneph@google.com> wrote:

> Fixes warning from clang-17 that look like:
> 
> drivers/gpu/drm/xe/xe_configfs.h:35:97: error: omitting the parameter name in a function definition is a C2x extension [-Werror,-Wc2x-extensions]
>    35 | static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,

Why did that become invalid?
It has pretty much always been used - and can be used to avoid -Wshadow warnings.
This looks like a clang bug.
And you'd want a specific -W 'knob' for it as well.

At a guess the C2x extension lets the name be omitted in the function body for
an unused parameter (the same as C++).
I think that is the 'definition' and the ones being changed here are the 'declaration'.
But I might be wrong.

	David

> 
> Signed-off-by: Ryan Neph <ryanneph@google.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index fed57be0b90e146d57d966bab0e55e1723513997..a0d614b37efd54b89390f04a238aef1a8d4df4e2 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -21,9 +21,9 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class class,
>  				       const u32 **cs);
> -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class class,
>  					const u32 **cs);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> @@ -37,9 +37,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
>  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +						     enum xe_engine_class class,
>  						     const u32 **cs) { return 0; }
> -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +						      enum xe_engine_class class,
>  						      const u32 **cs) { return 0; }
>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
>  #endif
> 

