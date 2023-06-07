Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91F0C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 16:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E9010E053;
	Wed,  7 Jun 2023 16:15:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF3FA10E053;
 Wed,  7 Jun 2023 16:15:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D7619AADDD;
 Wed,  7 Jun 2023 16:15:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 07 Jun 2023 16:15:53 -0000
Message-ID: <168615455384.21184.15719511406358270904@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607160334.4111289-1-matthew.brost@intel.com>
In-Reply-To: <20230607160334.4111289-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Scheduler_changes_for_upstreaming_=28rev4=29?=
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

Series: Scheduler changes for upstreaming (rev4)
URL   : https://patchwork.freedesktop.org/series/118091/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: dc8094ef1 drm/xe/wa: Extend scope of Wa_14015795083
=== git am output follows ===
Applying: fixup! drm/sched: Convert drm scheduler to use a work queue rather than kthread
Applying: drm/sched: Move schedule policy to scheduler
Applying: drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
Applying: drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
Applying: drm/xe: Long running job update
Applying: drm/xe: Ensure LR engines are not persistent
Applying: drm/xe: Only try to lock external BOs in VM bind
Applying: drm/xe: VM LRU bulk move


