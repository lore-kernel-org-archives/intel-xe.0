Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEE4C761A6
	for <intel-xe@archiver.kernel.org>; Thu, 30 Mar 2023 18:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9654310E3B3;
	Thu, 30 Mar 2023 18:26:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9571C10E3B3;
 Thu, 30 Mar 2023 18:26:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 791DBAADE3;
 Thu, 30 Mar 2023 18:26:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 30 Mar 2023 18:26:29 -0000
Message-ID: <168020078949.18826.6915874569279628337@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230330182405.43993-1-matthew.d.roper@intel.com>
In-Reply-To: <20230330182405.43993-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Interrupt_cleanup_and_future-proofing?=
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

Series: Interrupt cleanup and future-proofing
URL   : https://patchwork.freedesktop.org/series/115884/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 5de0375b04455c7c8e516f53715eedde50f5ae45
Author:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
AuthorDate: Thu Mar 23 15:05:18 2023 +0100
Commit:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CommitDate: Wed Mar 29 11:24:42 2023 +0200

    drm/xe: Display api changes update
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
=== git am output follows ===
Applying: drm/xe/irq: Drop gen3_ prefixes
Applying: drm/xe/irq: Add helpers to find ISR/IIR/IMR/IER registers
Applying: drm/xe/irq: Drop IRQ_INIT and IRQ_RESET macros
Applying: drm/xe/irq: Drop unnecessary GEN11_ and GEN12_ register prefixes
Applying: drm/xe/irq: Rename and clarify top-level interrupt handling routines
Applying: drm/xe/irq: Drop remaining "gen11_" prefix from IRQ functions
Applying: drm/xe/irq: Drop commented-out code for non-existent media engines
Applying: drm/xe/irq: Don't clobber display interrupts on multi-tile platforms


