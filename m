Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9A9C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 10:13:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F2610FF7E;
	Thu, 30 May 2024 10:13:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B8710E0FF;
 Thu, 30 May 2024 10:13:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_identify?=
 =?utf-8?q?_all_platforms_in_display_probe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 May 2024 10:13:41 -0000
Message-ID: <171706402117.2237378.13813138936076243858@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1716399081.git.jani.nikula@intel.com>
In-Reply-To: <cover.1716399081.git.jani.nikula@intel.com>
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

Series: drm/i915: identify all platforms in display probe (rev2)
URL   : https://patchwork.freedesktop.org/series/133931/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 55d6179b96e0 drm-tip: 2024y-05m-29d-17h-29m-17s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: move params copy at probe earlier
Applying: drm/i915/display: change probe for no display case
Applying: drm/i915/display: check platforms without display one level higher
Applying: drm/i915/display: change GMD ID display ip ver propagation at probe
Applying: drm/i915/display: add platform descriptors
Applying: drm/i915: add LNL PCI IDs
Applying: drm/i915/display: change display probe to identify GMD ID based platforms
Applying: drm/i915/display: identify platforms with enum and name
Applying: drm/i915/display: add support for subplatforms
Applying: drm/i915/display: add probe message


