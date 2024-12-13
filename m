Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EDCE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 17:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB0010E332;
	Fri, 13 Dec 2024 17:53:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F91010E332;
 Fri, 13 Dec 2024 17:53:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/display=3A_?=
 =?utf-8?q?handle_hdmi_connector_init_failures=2C_and_no_HDMI/DP_cases_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 17:53:00 -0000
Message-ID: <173411238032.2202578.7779915968252121366@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1734099220.git.jani.nikula@intel.com>
In-Reply-To: <cover.1734099220.git.jani.nikula@intel.com>
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

Series: drm/i915/display: handle hdmi connector init failures, and no HDMI/DP cases (rev2)
URL   : https://patchwork.freedesktop.org/series/142118/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: df4217f9eec2 drm-tip: 2024y-12m-13d-17h-28m-01s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/ddi: change intel_ddi_init_{dp, hdmi}_connector() return type
Applying: drm/i915/hdmi: propagate errors from intel_hdmi_init_connector()
Applying: drm/i915/hdmi: add error handling in g4x_hdmi_init()
Applying: drm/i915/ddi: gracefully handle errors from intel_ddi_init_hdmi_connector()
Applying: drm/i915/display: add intel_encoder_is_hdmi()
Applying: drm/i915/ddi: only call shutdown hooks for valid encoders


