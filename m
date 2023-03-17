Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0320C6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 14:36:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6413C10EF3D;
	Fri, 17 Mar 2023 14:36:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E6CAC10E125;
 Fri, 17 Mar 2023 14:36:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CC841A0003;
 Fri, 17 Mar 2023 14:36:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mauro Carvalho Chehab" <mauro.chehab@linux.intel.com>
Date: Fri, 17 Mar 2023 14:36:36 -0000
Message-ID: <167906379680.12995.16413387221969045917@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
In-Reply-To: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe/xe-pci=3A_print_a_message_when_probing_a_device_=28re?=
 =?utf-8?b?djIp?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/xe-pci: print a message when probing a device (rev2)
URL   : https://patchwork.freedesktop.org/series/115177/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 10989943f6b27400a891c4bfc9e37ee31aef9f26
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Tue Mar 14 08:58:39 2023 +0000
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Fri Mar 17 09:58:48 2023 +0000

    drm/xe/vram: start tracking the io_size
    
    First step towards supporting small-bar is to track the io_size for
    vram. We can longer assume that the io_size == vram size. This way we
    know how much is CPU accessible via the BAR, and how much is not.
    Effectively giving us a two tiered vram, where in some later patches we
    can support different allocation strategies depending on if the memory
    needs to be CPU accessible or not.
    
    Note as this stage we still clamp the vram size to the usable vram size.
    Only in the final patch do we turn this on for real, and allow distinct
    io_size and vram_size.
    
    v2: (Lucas):
      - Improve the commit message, plus improve the kernel-doc for the
        io_size to give a better sense of what it actually is.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
=== git am output follows ===
Applying: drm/xe/xe-pci: print a message when probing a device


