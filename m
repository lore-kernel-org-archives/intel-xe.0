Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC620C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 04:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7936C10E668;
	Wed,  6 Dec 2023 04:12:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1415810E668;
 Wed,  6 Dec 2023 04:12:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ECEAAA0169;
 Wed,  6 Dec 2023 04:12:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 06 Dec 2023 04:12:33 -0000
Message-ID: <170183595396.26425.17021326912936122581@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Enable_compression_handling_on_LNL=2E_=28rev4=29?=
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

Series: Enable compression handling on LNL. (rev4)
URL   : https://patchwork.freedesktop.org/series/126704/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 8833b1390 drm/xe/huc: HuC authentication via GSC
=== git am output follows ===
Applying: drm/xe/xe2: Determine bios enablement for flat ccs on igfx
Applying: drm/xe/xe2: Allocate extra pages for ccs during bo create
Applying: drm/xe/xe2: Updates on XY_CTRL_SURF_COPY_BLT
Applying: drm/xe/xe_migrate: Use NULL 1G PTE mapped at 255GiB VA for ccs clear
Applying: drm/xe/xe2: Update chunk size for each iteration of ccs copy
Applying: drm/xe/xe2: Update emit_pte to use compression enabled PAT index
Applying: drm/xe/xe2: Handle flat ccs move for igfx.
Applying: drm/xe/xe2: Modify xe_bo_test for system memory
Applying: drm/xe/xe2: Support flat ccs


