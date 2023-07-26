Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A04FC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F0010E045;
	Wed, 26 Jul 2023 17:31:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2109D10E045;
 Wed, 26 Jul 2023 17:31:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1D05CAADF1;
 Wed, 26 Jul 2023 17:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 26 Jul 2023 17:31:29 -0000
Message-ID: <169039268911.23472.9862878435355315257@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Fix_stolen_setup_for_MTL+_=28rev2=29?=
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

Series: Fix stolen setup for MTL+ (rev2)
URL   : https://patchwork.freedesktop.org/series/121329/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 3eb59fdaf drm/xe: Invert guc vs execlists parameters and info.
=== git am output follows ===
Applying: fixup! 57f0bc550693ad29726bf2a71d05af0dc2d0a542
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/xe: Fix checking for unset value
Applying: drm/xe: Remove vma arg from xe_pte_encode()
Applying: drm/xe: Decouple vram check from xe_bo_addr()
Applying: drm/xe: Set PTE_DM bit for stolen on MTL
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/xe: Fix MTL+ stolen memory mapping
Applying: drm/xe: Carve out top of DSM as reserved
Applying: drm/xe: Sort xe_regs.h


