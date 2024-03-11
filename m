Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A312C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 20:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43D810F554;
	Mon, 11 Mar 2024 20:33:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1771210F554;
 Mon, 11 Mar 2024 20:33:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/xe=3A_Introduce_?=
 =?utf-8?q?xe=5Fpm=5Fruntime=5Fget=5Fnoresume_for_inner_callers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Mar 2024 20:33:56 -0000
Message-ID: <171018923609.680152.13002971103878373317@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers (rev2)
URL   : https://patchwork.freedesktop.org/series/130996/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 61fa386186cb drm-tip: 2024y-03m-11d-17h-54m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
Applying: drm/xe: Introduce intel_runtime_pm_get_noresume at compat-i915-headers for display
Applying: drm/i915/display: convert inner wakeref get towards get_if_in_use
Applying: drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
Applying: drm/xe: Convert GSC HDCP from mem_access to direct xe_pm_runtime calls
Applying: drm/xe: Remove useless mem_access during probe
Applying: drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
Applying: drm/xe: Removing extra mem_access protection from runtime pm
Applying: drm/xe: Convert mem_access_if_ongoing to direct xe_pm_runtime_get_if_active
Applying: drm/xe: Ensure all the inner access are using the _noresume variant
Applying: drm/xe: Kill xe_device_mem_access_{get*,put}


