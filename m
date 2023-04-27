Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B6EC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 22:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C1510E18D;
	Thu, 27 Apr 2023 22:35:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 394DC10E177;
 Thu, 27 Apr 2023 22:35:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 22AB8A00CC;
 Thu, 27 Apr 2023 22:35:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 27 Apr 2023 22:35:12 -0000
Message-ID: <168263491211.9050.16551958091344490441@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230427223256.1432787-1-lucas.demarchi@intel.com>
In-Reply-To: <20230427223256.1432787-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Cleanup_registers_and_introduce_xe=5Freg=5F*_=28rev5=29?=
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

Series: Cleanup registers and introduce xe_reg_* (rev5)
URL   : https://patchwork.freedesktop.org/series/116845/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 4a4af2511 drm/xe: Remove extra xe_mmio_read32 from xe_mmio_wait32
=== git am output follows ===
Applying: drm/xe/guc: Convert GuC registers to REG_FIELD/REG_BIT
Applying: drm/xe: Drop gen afixes from registers
Applying: drm/xe: Use REG_FIELD/REG_BIT for all regs/*.h
Applying: drm/xe: Clarify register types on PAT programming
Applying: drm/xe/rtp: Improve magic macros for RTP tables
Applying: drm/xe: Introduce xe_reg/xe_reg_mcr
Applying: drm/xe: Use XE_REG/XE_REG_MCR
Applying: drm/xe: Annotate masked registers used by RTP
Applying: drm/xe: Plumb xe_reg into WAs, rtp, etc
Applying: drm/xe: Move helper macros to separate header


