Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FBECDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 22:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407AA10E071;
	Fri, 13 Oct 2023 22:05:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DF6010E071;
 Fri, 13 Oct 2023 22:05:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 27EB6AADD8;
 Fri, 13 Oct 2023 22:05:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 13 Oct 2023 22:05:31 -0000
Message-ID: <169723473115.31157.9183928980872590031@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231013220250.927876-8-matthew.d.roper@intel.com>
In-Reply-To: <20231013220250.927876-8-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_LRC_debugfs_and_general_instruction_tweaks_=28rev3=29?=
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

Series: LRC debugfs and general instruction tweaks (rev3)
URL   : https://patchwork.freedesktop.org/series/125008/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 7a2215ad9 drm/i915: Remove the module parameter 'fastboot'
=== git am output follows ===
Applying: drm/xe: Make MI_FLUSH_DW immediate size more explicit
Applying: drm/xe: Separate number of registers from MI_LRI opcode
Applying: drm/xe: Clarify number of dwords/qwords stored by MI_STORE_DATA_IMM
Applying: drm/xe: Extract MI_* instructions to their own header
Applying: drm/xe/debugfs: Add dump of default LRCs' MI instructions
Applying: drm/xe/debugfs: Include GFXPIPE commands in LRC dump


