Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFED8C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 09:30:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9FB112B4F;
	Tue, 16 Apr 2024 09:30:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18604112B4F;
 Tue, 16 Apr 2024 09:30:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/edid=3A_cleanups?=
 =?utf-8?q?=2C_rebase?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 09:30:01 -0000
Message-ID: <171325980109.1443376.18198833991817567020@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1713259151.git.jani.nikula@intel.com>
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
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

Series: drm/edid: cleanups, rebase
URL   : https://patchwork.freedesktop.org/series/132493/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5f7597e990be drm-tip: 2024y-04m-16d-01h-07m-54s UTC integration manifest
=== git am output follows ===
Applying: drm/displayid: move drm_displayid.h to drm_displayd_internal.h
Applying: drm/edid: move all internal declarations to drm_crtc_internal.h
Applying: drm/edid: group struct drm_edid based declarations together
Applying: drm/edid: rename drm_find_edid_extension() to drm_edid_find_extension()
Applying: drm/edid: avoid drm_edid_find_extension() internally
Applying: drm/edid: make drm_edid_are_equal() static
Applying: drm/edid: make drm_edid_are_equal() more convenient for its single user


