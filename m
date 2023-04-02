Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1EAC6FD1D
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 02:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC73510E11D;
	Sun,  2 Apr 2023 02:44:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61C2410E11D;
 Sun,  2 Apr 2023 02:44:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3DEE9A0169;
 Sun,  2 Apr 2023 02:44:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sun, 02 Apr 2023 02:44:30 -0000
Message-ID: <168040347023.4256.4445172854201312935@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230402024145.2572923-1-matthew.brost@intel.com>
In-Reply-To: <20230402024145.2572923-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Upstream_DRM_scheduler_policy_story?=
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

Series: Upstream DRM scheduler policy story
URL   : https://patchwork.freedesktop.org/series/115997/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit cbd8b47f28266aad8f9786be9a1899e3f0e0f2e0
Author:     Matt Roper <matthew.d.roper@intel.com>
AuthorDate: Mon Mar 27 10:34:33 2023 -0700
Commit:     Matt Roper <matthew.d.roper@intel.com>
CommitDate: Fri Mar 31 17:06:44 2023 -0700

    fixup! drm/xe/pat: Handle unicast vs MCR PAT registers
    
    Somehow I dropped the error message when sending this; add it back.
    
    To be squashed next time the Xe driver is rebased.
    
    Fixes: 11946af00717 ("drm/xe/pat: Handle unicast vs MCR PAT registers")
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
    Link: https://lore.kernel.org/r/20230327173433.2957645-1-matthew.d.roper@intel.com
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
=== git am output follows ===
Applying: drm/sched: Move schedule policy to scheduler / entity
Applying: drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
Applying: drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode


