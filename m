Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9FBC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 16:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7B310E0C8;
	Fri, 17 Mar 2023 16:56:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B27A010EF4C;
 Fri, 17 Mar 2023 16:56:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9DBC4AADE4;
 Fri, 17 Mar 2023 16:56:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Date: Fri, 17 Mar 2023 16:56:42 -0000
Message-ID: <167907220261.12990.7892907988714133701@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230317165335.1014314-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20230317165335.1014314-1-balasubramani.vivekanandan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Use_max_wopcm_size_when_validating_the_preset_GuC_?=
 =?utf-8?q?wopcm_size?=
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

Series: drm/xe: Use max wopcm size when validating the preset GuC wopcm size
URL   : https://patchwork.freedesktop.org/series/115322/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit beff2b917ac1966c090ac2f498f969ca615093be
Author:     Masahiro Yamada <masahiroy@kernel.org>
AuthorDate: Thu Mar 16 14:03:40 2023 -0700
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Fri Mar 17 08:25:37 2023 -0700

    UML: define RUNTIME_DISCARD_EXIT
    
    With CONFIG_VIRTIO_UML=y, GNU ld < 2.36 fails to link UML vmlinux
    (w/wo CONFIG_LD_SCRIPT_STATIC).
    
      `.exit.text' referenced in section `.uml.exitcall.exit' of arch/um/drivers/virtio_uml.o: defined in discarded section `.exit.text' of arch/um/drivers/virtio_uml.o
      collect2: error: ld returned 1 exit status
    
    This fix is similar to the following commits:
    
    - 4b9880dbf3bd ("powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT")
    - a494398bde27 ("s390: define RUNTIME_DISCARD_EXIT to fix link error
      with GNU ld < 2.36")
    - c1c551bebf92 ("sh: define RUNTIME_DISCARD_EXIT")
    
    Fixes: 99cb0d917ffa ("arch: fix broken BuildID for arm64 and riscv")
    Reported-by: SeongJae Park <sj@kernel.org>
    Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
    Tested-by: SeongJae Park <sj@kernel.org>
    Signed-off-by: Richard Weinberger <richard@nod.at>
    (cherry picked from commit b99ddbe8336ee680257c8ab479f75051eaa49dcf)
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
    Link: https://lore.kernel.org/r/20230316210341.3547058-3-lucas.demarchi@intel.com
=== git am output follows ===
Applying: drm/xe: Use max wopcm size when validating the preset GuC wopcm size


