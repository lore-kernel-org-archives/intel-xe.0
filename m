Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6D4C7618B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5452110E6A9;
	Tue, 14 Mar 2023 00:33:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F1C210E6A7;
 Tue, 14 Mar 2023 00:33:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 26EFDA66C9;
 Tue, 14 Mar 2023 00:33:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 14 Mar 2023 00:33:41 -0000
Message-ID: <167875402113.26413.16534925951400850709@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_DG2_+_PVC_+_ADL_workarounds_and_infra?=
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

Series: DG2 + PVC + ADL workarounds and infra
URL   : https://patchwork.freedesktop.org/series/115089/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 1528d94b95561c4407c65d5ef5754a988eef42dd
Author:     Jani Nikula <jani.nikula@intel.com>
AuthorDate: Thu Mar 9 14:17:46 2023 +0200
Commit:     Lucas De Marchi <lucas.demarchi@intel.com>
CommitDate: Mon Mar 13 13:39:40 2023 -0700

    drm/xe: make compound literal initialization const
    
    Be careful about having const in the compound literal initialization to
    keep the initializers in rodata. Here, the impact is 1.8k of mutable
    data moved to rodata.
    
    add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-1804 (-1804)
    Data                                         old     new   delta
    __compound_literal                          1804       -   -1804
    Total: Before=42425, After=40621, chg -4.25%
    add/remove: 0/0 grow/shrink: 1/0 up/down: 1804/0 (1804)
    RO Data                                      old     new   delta
    __compound_literal                          7696    9500   +1804
    Total: Before=138535, After=140339, chg +1.30%
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Link: https://lore.kernel.org/r/20230309121746.479146-1-jani.nikula@intel.com
=== git am output follows ===
.git/rebase-apply/patch:277: trailing whitespace.
			     /* 
.git/rebase-apply/patch:288: trailing whitespace.
			     /* 
warning: 2 lines add whitespace errors.
Applying: drm/xe/rtp: Add match helper for gslice fused off
Applying: drm/xe/reg_sr: Tweak verbosity for register printing
Applying: drm/xe: Print whitelist while applying
Applying: drm/xe/debugfs: Dump register save-restore tables
Applying: drm/xe: Reorder WAs to consider the platform
Applying: drm/xe: Add PVC gt workarounds
Applying: drm/xe: Add PVC engine workarounds
Applying: drm/xe: Add missing DG2 gt workarounds and tunings
Applying: drm/xe: Add missing DG2 engine workarounds
Applying: drm/xe: Add missing DG2 lrc tunings
Applying: drm/xe: Add missing DG2 lrc workarounds
Applying: drm/xe: Add missing ADL-P engine workaround
Applying: drm/xe: Add missing LRC workarounds for graphics 1200
Applying: drm/xe: Move policy on preemption from WAs to tunings


