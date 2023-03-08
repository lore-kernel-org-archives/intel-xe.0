Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFB0C64EC4
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 10:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312EF10E0D8;
	Wed,  8 Mar 2023 10:46:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A906910E0D8;
 Wed,  8 Mar 2023 10:46:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8E889A47DF;
 Wed,  8 Mar 2023 10:46:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 08 Mar 2023 10:46:18 -0000
Message-ID: <167827237855.20410.8190513329420205857@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_DG2_+_PVC_workarounds_and_infra?=
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

Series: DG2 + PVC workarounds and infra
URL   : https://patchwork.freedesktop.org/series/114754/
State : success

== Summary ==

.git/rebase-apply/patch:260: trailing whitespace.
			     /* 
.git/rebase-apply/patch:271: trailing whitespace.
			     /* 
warning: 2 lines add whitespace errors.
Applying: drm/xe/mcr: Add L3BANK steering for DG2
Applying: drm/xe: Allow const propagation in gt_to_xe()
Applying: drm/xe: Constify xe_dss_mask_group_ffs()
Applying: drm/xe: Add helper to get dss per group
Applying: drm/xe/rtp: Move match function from wa to rtp
Applying: drm/xe/rtp: Add match for render reset domain
Applying: drm/xe/rtp: Add match helper for gslice fused off
Applying: drm/xe: Remove dump function from reg_sr
Applying: drm/xe: Name LRC wa after the engine it belongs
Applying: drm/xe/debugfs: Dump register save-restore tables
Applying: drm/xe/reg_sr: Tweak verbosity for register printing
Applying: drm/xe/pvc: Remove A* steppings
Applying: drm/xe: Reorder WAs to consider the platform
Applying: drm/xe: Add PVC gt workarounds
Applying: drm/xe: Add PVC engine workarounds
Applying: drm/xe: Add missing DG2 gt workarounds and tunings
Applying: drm/xe: Add missing DG2 engine workarounds
Applying: drm/xe: Add missing DG2 lrc tunings
Applying: drm/xe: Add missing DG2 lrc workarounds


