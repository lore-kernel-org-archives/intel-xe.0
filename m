Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE3E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 23:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E001410E58B;
	Mon,  9 Dec 2024 23:33:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB75F10E360;
 Mon,  9 Dec 2024 23:33:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_reg=5Fsr/whitelist_f?=
 =?utf-8?q?ixes_and_refactors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Dec 2024 23:33:41 -0000
Message-ID: <173378722176.639395.1076824666429197925@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
In-Reply-To: <20241209232739.147417-1-lucas.demarchi@intel.com>
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

Series: reg_sr/whitelist fixes and refactors (rev2)
URL   : https://patchwork.freedesktop.org/series/142195/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 9d12021e081c drm-tip: 2024y-12m-09d-16h-48m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/reg_sr: Remove register pool
Applying: drm/xe: Introduce xe_gt_dbg_printer()
Applying: drm/xe/reg_sr: Convert whitelist to gt logging
Applying: drm/xe/reg_sr: Stop setting all whitelist slots
Applying: drm/xe: Apply whitelist to engine save-restore


