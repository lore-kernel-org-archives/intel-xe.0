Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2715EB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 14:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C167C10E502;
	Thu, 15 Jun 2023 14:16:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 365DC10E509;
 Thu, 15 Jun 2023 14:16:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2E79BAA3D8;
 Thu, 15 Jun 2023 14:16:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Thu, 15 Jun 2023 14:16:42 -0000
Message-ID: <168683860218.10727.16674261586584702206@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230615141933.2865583-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_Add_engine_scheduler_control_interface?=
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

Series: drm/xe: Add engine scheduler control interface
URL   : https://patchwork.freedesktop.org/series/119392/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 6d2981d42 drm/xe/mtl: Add some initial MTL workarounds
=== git am output follows ===
.git/rebase-apply/patch:27: new blank line at EOF.
+
.git/rebase-apply/patch:72: new blank line at EOF.
+
warning: 2 lines add whitespace errors.
Applying: drm/xe: Add sysfs entries for engines under its GT
Applying: drm/xe: Add sysfs for default engine scheduler properties
Applying: drm/xe: Add job timeout engine property to sysfs
Applying: drm/xe: Add timeslice duration engine property to sysfs
Applying: drm/xe: Add sysfs for preempt reset timeout
Applying: drm/xe: Add min/max cap for engine scheduler properties


