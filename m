Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7E5C7882E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 12:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9794310E824;
	Fri, 20 Sep 2024 12:06:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E0810E824;
 Fri, 20 Sep 2024 12:06:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/dp=3A_clean?=
 =?utf-8?q?_up_DP_testing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 12:06:43 -0000
Message-ID: <172683400399.1050565.14967485558253578487@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1726833193.git.jani.nikula@intel.com>
In-Reply-To: <cover.1726833193.git.jani.nikula@intel.com>
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

Series: drm/i915/dp: clean up DP testing
URL   : https://patchwork.freedesktop.org/series/138918/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 128ccc5f71d7 drm-tip: 2024y-09m-20d-07h-32m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: split out intel_dp_test.[ch] to a dedicated file
Applying: drm/i915/dp: fix style issues in intel_dp_test.c
Applying: drm/i915/dp: convert intel_dp_test.c struct intel_display
Applying: drm/i915/dp: clean up intel_dp_test.[ch] interface
Applying: drm/i915/dp: move DP test debugfs files next to the functionality
Applying: drm/i915/dp: fix style issues in DP test debugfs
Applying: drm/i915/display: remove the loop in fifo underrun debugfs file creation
Applying: drm/i915/dp: convert DP test debugfs to struct intel_display
Applying: drm/i915/dp: add intel_dp_test_reset() and intel_dp_test_short_pulse()


