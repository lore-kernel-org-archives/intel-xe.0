Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8F5C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 13:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A2A10ED1F;
	Fri, 14 Jun 2024 13:41:28 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ABA10E04E;
 Fri, 14 Jun 2024 13:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/=7Bttm=2Cxe=7D?=
 =?utf-8?q?=3A_Improve_ttm=5Fbo=5Fvmap=28=29_and_update_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 13:41:27 -0000
Message-ID: <171837248723.77190.14156325939033222306@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614133556.11378-1-tzimmermann@suse.de>
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/{ttm,xe}: Improve ttm_bo_vmap() and update xe
URL   : https://patchwork.freedesktop.org/series/134890/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 00e9498b4534 drm-tip: 2024y-06m-14d-10h-57m-36s UTC integration manifest
=== git am output follows ===
Applying: iosys-map: Add allocator flags
Applying: drm/ttm: Store the bo_kmap_type in struct iosys_map
Applying: drm/ttm: Support partial buffer mappings for ttm_bo_vmap()
Applying: drm/ttm: Support kmap for single-page mappings in ttm_bo_vmap()
Applying: drm/xe: Remove vunmap calls object-freeing code
Applying: drm/xe: Replace ttm_bo_kmap() with ttm_bo_vmap()


