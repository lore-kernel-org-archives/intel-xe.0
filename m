Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1B7C4167D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:19:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA33010E0AB;
	Tue,  7 Nov 2023 16:19:37 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A3A4510E0AB;
 Tue,  7 Nov 2023 16:19:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8B231A7DFF;
 Tue,  7 Nov 2023 16:19:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 07 Nov 2023 16:19:36 -0000
Message-ID: <169937397653.21168.1823869330934630650@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231107161623.135419-1-matthew.brost@intel.com>
In-Reply-To: <20231107161623.135419-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_xe=5Fguc=5Fsubmit_style_cleanups?=
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

Series: xe_guc_submit style cleanups
URL   : https://patchwork.freedesktop.org/series/126081/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 17fc56818 drm/xe/xelpmp: Add Wa_16021867713
=== git am output follows ===
Applying: drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
Applying: drm/xe: s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
Applying: drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
Applying: drm/xe: Fix alignment in GuC exec queue state defines
Applying: drm/xe: Replace engine references with exec queue in xe_guc_submit.c


