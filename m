Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956BCFA375A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 15:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4935F10E27E;
	Fri, 13 Sep 2024 15:15:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B5E10E27E;
 Fri, 13 Sep 2024 15:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_PF=3A_Initial_suppor?=
 =?utf-8?q?t_to_save/restore_VF_GuC_state_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 15:15:32 -0000
Message-ID: <172624053221.997167.16594934063538178092@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
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

Series: PF: Initial support to save/restore VF GuC state (rev2)
URL   : https://patchwork.freedesktop.org/series/138609/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8c9686621372 drm-tip: 2024y-09m-13d-15h-03m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros
Applying: drm/xe/guc: Add PF2GUC_SAVE_RESTORE_VF to ABI
Applying: drm/xe/pf: Add functions to save and restore VF GuC state
Applying: drm/xe/pf: Save VF GuC state when pausing VF
Applying: drm/xe/pf: Allow to view and replace VF GuC state over debugfs
Applying: drm/xe/pf: Allow to trigger VF GuC state restore from debugfs


