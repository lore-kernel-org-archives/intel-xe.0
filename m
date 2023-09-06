Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979A2EE14B0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 17:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1992410E6DB;
	Wed,  6 Sep 2023 17:29:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 174C310E6E2;
 Wed,  6 Sep 2023 17:29:22 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0B026AADE3;
 Wed,  6 Sep 2023 17:29:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 06 Sep 2023 17:29:22 -0000
Message-ID: <169402136201.17389.17533693338356659825@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230905141347.1027082-1-jani.nikula@intel.com>
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_drm/xe=3A_drop_unnecessary_i915_display_commits_=28rev2=29?=
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

Series: drm/xe: drop unnecessary i915 display commits (rev2)
URL   : https://patchwork.freedesktop.org/series/123280/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 62fe9fa9a drm/drm_exec: Work around a WW mutex lockdep oddity
=== git am output follows ===
Applying: Revert "FIXME: drm/i915: display/intel_display_types.h random whitespace changes"
Applying: Revert "FIXME: drm/i915: include i915_utils.h from intel_display_types.h"
Applying: Revert "FIXME: drm/i915: revert the earlier mmio_offset change"
Applying: Revert "FIXME: drm/i915/display: Prefer i915->uncore over plain uncore"
Applying: Revert "FIXME: drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe"


