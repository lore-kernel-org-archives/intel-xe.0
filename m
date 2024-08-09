Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643B2C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8C410E9EA;
	Fri,  9 Aug 2024 19:23:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79DD10E9EA;
 Fri,  9 Aug 2024 19:23:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Allow_exec_queue_bac?=
 =?utf-8?q?kend_ops_which_issue_message_to_be_called_multiple_times?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 19:23:38 -0000
Message-ID: <172323141892.552626.9426875200852440400@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809191929.3138956-1-matthew.brost@intel.com>
In-Reply-To: <20240809191929.3138956-1-matthew.brost@intel.com>
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

Series: Allow exec queue backend ops which issue message to be called multiple times
URL   : https://patchwork.freedesktop.org/series/137102/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 13384fb5b1e7 drm-tip: 2024y-08m-09d-16h-57m-03s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Add xe_sched_msg_lock/unlock helper
Applying: drm/xe: Reinit msg link when processing a message
Applying: drm/xe: Add xe_sched_add_msg_locked helper
Applying: drm/xe: Only enable scheduling upon resume if needed
Applying: drm/xe: Allow suspend / resume to be safely called multiple times


