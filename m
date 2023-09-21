Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DB9E70708
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 10:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA89410E5A9;
	Thu, 21 Sep 2023 10:21:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3308B10E5A9;
 Thu, 21 Sep 2023 10:21:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 35156A00CC;
 Thu, 21 Sep 2023 10:21:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Thu, 21 Sep 2023 10:21:30 -0000
Message-ID: <169529169021.7234.11074736582958846386@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230921102519.3355538-1-badal.nilawar@intel.com>
In-Reply-To: <20230921102519.3355538-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Add_HWMON_support_for_DGFX_=28rev5=29?=
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

Series: Add HWMON support for DGFX (rev5)
URL   : https://patchwork.freedesktop.org/series/118934/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 57039c55b fixup! drm/xe/bo: Evict VRAM to TT rather than to system
=== git am output follows ===
.git/rebase-apply/patch:43: new blank line at EOF.
+
.git/rebase-apply/patch:507: new blank line at EOF.
+
warning: 2 lines add whitespace errors.
.git/rebase-apply/patch:41: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
.git/rebase-apply/patch:24: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/xe: Add XE_MISSING_CASE macro
Applying: drm/xe/hwmon: Expose power attributes
Applying: drm/xe/hwmon: Expose card reactive critical power
Applying: drm/xe/hwmon: Expose input voltage attribute
Applying: drm/xe/hwmon: Expose hwmon energy attribute
Applying: drm/xe/hwmon: Expose power1_max_interval


