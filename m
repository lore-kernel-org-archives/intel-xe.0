Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8F7EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 11:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269B510E0FB;
	Wed, 28 Jun 2023 11:48:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1802410E038;
 Wed, 28 Jun 2023 11:48:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 11839AADD8;
 Wed, 28 Jun 2023 11:48:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 28 Jun 2023 11:48:28 -0000
Message-ID: <168795290804.32036.5794406219210611854@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230628114732.3598169-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Add_engine_scheduler_control_interface_=28rev3=29?=
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

Series: drm/xe: Add engine scheduler control interface (rev3)
URL   : https://patchwork.freedesktop.org/series/119392/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: abdb420db amend! drm/xe : Fix GT looping for standalone media
=== git am output follows ===
.git/rebase-apply/patch:27: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Add sysfs entries for engines under its GT
Applying: drm/xe: Add sysfs for default engine scheduler properties
Applying: drm/xe: Add job timeout engine property to sysfs
Applying: drm/xe: Add timeslice duration engine property to sysfs
Applying: drm/xe: Add sysfs for preempt reset timeout
Applying: drm/xe: Add min/max cap for engine scheduler properties


