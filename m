Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C614C02192
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 16:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6534610E854;
	Wed, 29 Jan 2025 16:31:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5C210E84A;
 Wed, 29 Jan 2025 16:31:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_series_starting_with?=
 =?utf-8?q?_=5B1/6=5D_drm/i915/dp=3A_constify_struct_link=5Fconfig=5Flimits_?=
 =?utf-8?q?pointers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 16:31:56 -0000
Message-ID: <173816831663.2489503.3055051026217672266@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1738161945.git.jani.nikula@intel.com>
In-Reply-To: <cover.1738161945.git.jani.nikula@intel.com>
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

Series: series starting with [1/6] drm/i915/dp: constify struct link_config_limits pointers
URL   : https://patchwork.freedesktop.org/series/144106/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: bdfc862a5c71 drm-tip: 2025y-01m-29d-14h-11m-06s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dp: constify struct link_config_limits pointers
Applying: drm/i915/dp: change the order of intel_dp_mtp_tu_compute_config() params
Applying: drm/i915/mst: change where lane_count and port_clock are set
Applying: drm/i915/mst: handle mst pbn_div in intel_dp_mtp_tu_compute_config()
Applying: drm/i915/mst: remove unnecessary mst_stream_find_vcpi_slots_for_bpp()
Applying: drm/i915/mst: use min_array() and max_array() instead of hand-rolling


