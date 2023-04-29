Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA1C77B60
	for <intel-xe@archiver.kernel.org>; Sat, 29 Apr 2023 06:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DFF10E074;
	Sat, 29 Apr 2023 06:27:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62B5810E074;
 Sat, 29 Apr 2023 06:27:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5BBEEA0BA8;
 Sat, 29 Apr 2023 06:27:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Sat, 29 Apr 2023 06:27:29 -0000
Message-ID: <168274964934.25337.10013147984177927139@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
In-Reply-To: <20230429062332.354139-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Convert_xe=5Fmmio_to_struct_xe=5Freg?=
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

Series: Convert xe_mmio to struct xe_reg
URL   : https://patchwork.freedesktop.org/series/117138/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: f7b51a4d5 drm/xe: Fix media detection for pre-GMD_ID platforms
=== git am output follows ===
Applying: fixup! drm/xe: Drop gen afixes from registers
Applying: drm/xe/guc: Handle RCU_MODE as masked from definition
Applying: drm/xe: Use media base for GMD_ID access
Applying: drm/xe/mmio: Use struct xe_reg
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/xe: Rename reg field to addr
Applying: drm/xe: Fix indent in xe_hw_engine_print_state()


