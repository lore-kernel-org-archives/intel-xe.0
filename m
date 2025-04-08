Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8445C369A2
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 16:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE07110E255;
	Tue,  8 Apr 2025 16:28:28 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDB010E255;
 Tue,  8 Apr 2025 16:28:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/plane=3A_fi?=
 =?utf-8?q?le_and_function_renames?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 16:28:27 -0000
Message-ID: <174412970751.48724.57684515717595078@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744129283.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744129283.git.jani.nikula@intel.com>
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

Series: drm/i915/plane: file and function renames
URL   : https://patchwork.freedesktop.org/series/147415/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: bc033b97f4cf drm-tip: 2025y-04m-08d-15h-32m-12s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/plane: rename intel_atomic_plane.[ch] to intel_plane.[ch]
Applying: drm/i915/plane: drop atomic from intel_atomic_plane_check_clipping()
Applying: drm/i915/plane: make intel_plane_atomic_check() static and rename
Applying: drm/i915/plane: rename intel_atomic_check_planes() to intel_plane_atomic_check()
Applying: drm/i915/plane: rename intel_atomic_add_affected_planes() to intel_plane_add_affected()


