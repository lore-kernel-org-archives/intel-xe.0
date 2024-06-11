Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A907BC27C77
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 15:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E9B10E681;
	Tue, 11 Jun 2024 15:42:04 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044E610E071;
 Tue, 11 Jun 2024 15:42:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Only_timeout_jobs_if?=
 =?utf-8?q?_they_run_longer_than_timeout_period?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 15:42:02 -0000
Message-ID: <171812052201.67160.17717887828898237207@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611144053.2805091-1-matthew.brost@intel.com>
In-Reply-To: <20240611144053.2805091-1-matthew.brost@intel.com>
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

Series: Only timeout jobs if they run longer than timeout period
URL   : https://patchwork.freedesktop.org/series/134724/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 950ce28fe0b3 drm-tip: 2024y-06m-11d-15h-22m-31s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add LRC ctx timestamp support functions
Applying: drm/xe: Add MI_COPY_MEM_MEM GPU instruction definitions
Applying: drm/xe: Emit ctx timestamp copy in ring ops
Applying: drm/xe: Add ctx timestamp to LRC snapshot
Applying: drm/xe: Add xe_gt_clock_interval_to_ms helper
Applying: drm/xe: Improve unexpected state error messages
Applying: drm/xe: Assert runnable state in handle_sched_done
Applying: drm/xe: Add GuC state asserts to deregister_exec_queue
Applying: drm/xe: Add pending disable assert to handle_sched_done
Applying: drm/xe: Add killed, banned, or wedged as stick bit during GuC reset
Applying: drm/xe: Sample ctx timestamp to determine if jobs have timed out


