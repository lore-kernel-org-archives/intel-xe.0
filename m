Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77052C27C50
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 01:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C470010E65D;
	Wed,  5 Jun 2024 01:06:45 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3971F10E65D;
 Wed,  5 Jun 2024 01:06:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Ensure_xe=5Fforce=5F?=
 =?utf-8?q?wake=5Fput_is_always_called_after_xe=5Fforce=5Fwake=5Fget?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 01:06:44 -0000
Message-ID: <171754960423.2266479.15836414616085281768@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240604110225.29495-1-nirmoy.das@intel.com>
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
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

Series: Ensure xe_force_wake_put is always called after xe_force_wake_get
URL   : https://patchwork.freedesktop.org/series/134437/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 596cf447db94 drm-tip: 2024y-06m-04d-20h-11m-26s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/display: Always call xe_force_wake_put/get in pairs
Applying: drm/xe/pat: Always call xe_force_wake_put/get in pairs
Applying: drm/xe/xe_reg_sr: Always call xe_force_wake_put/get in pairs
Applying: drm/xe/xe_gt: Always call xe_force_wake_put/get in pairs
Applying: drm/xe/uc: Always call xe_force_wake_put/get in pairs
Applying: drm/xe: Add xe_force_wake_tryget to simplify forcewake handling
Applying: drm/xe: Use xe_force_wake_tryget when possible
Applying: drm/xe/client: Check return value of xe_force_wake_get
Applying: drm/xe: Add __must_check for xe_force_wake_get


