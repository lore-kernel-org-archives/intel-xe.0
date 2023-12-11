Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA12C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 20:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8610E4E0;
	Mon, 11 Dec 2023 20:17:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A40D410E4E0;
 Mon, 11 Dec 2023 20:17:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9CC19AADF2;
 Mon, 11 Dec 2023 20:17:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B01/13=5D_drm/sched=3A_Rename_drm=5Fsched=5Fget=5Fcleanup=5Fjo?=
 =?utf-8?q?b_to_be_more_descriptive?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Mon, 11 Dec 2023 20:17:11 -0000
Message-ID: <170232583161.19580.525069461842602136@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231211191306.1069362-1-rodrigo.vivi@intel.com>
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

Series: series starting with [01/13] drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
URL   : https://patchwork.freedesktop.org/series/127643/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: f622e36ea fixup! drm/xe/display: Implement display support
=== git am output follows ===
Applying: drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
Applying: drm/sched: Move free worker re-queuing out of the if block
Applying: drm/sched: Rename drm_sched_free_job_queue to be more descriptive
Applying: drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify kerneldoc
Applying: drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
Applying: drm/sched: Don't disturb the entity when in RR-mode scheduling
Applying: drm/sched: Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()
Applying: drm/sched: implement dynamic job-flow control
Applying: drm/sched: Fix bounds limiting when given a malformed entity
Applying: drm/sched: Rename priority MIN to LOW
Applying: drm/sched: Reverse run-queue priority enumeration
Applying: drm/sched: Partial revert of "Qualify drm_sched_wakeup() by drm_sched_entity_is_ready()"
Applying: fixup! drm/xe: Introduce a new DRM driver for Intel GPUs


