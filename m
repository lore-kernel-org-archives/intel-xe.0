Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242C3C52D7B
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 16:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF6210E39E;
	Tue, 13 Aug 2024 16:47:17 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BCA10E39E;
 Tue, 13 Aug 2024 16:47:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/7=5D_drm/i915/display=3A_support_struct_intel=5Fatomic=5Fstate_i?=
 =?utf-8?q?n_to=5Fintel=5Fdisplay=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 16:47:16 -0000
Message-ID: <172356763629.614286.17970938663250449180@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813164123.2674462-1-jani.nikula@intel.com>
In-Reply-To: <20240813164123.2674462-1-jani.nikula@intel.com>
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

Series: series starting with [1/7] drm/i915/display: support struct intel_atomic_state in to_intel_display()
URL   : https://patchwork.freedesktop.org/series/137250/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f32a19e5d91e39a10c15cab11bd8a63de805566f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Aug 13 19:41:23 2024 +0300

    drm/i915/hti: convert to struct intel_display
    
    Going forward, struct intel_display shall replace struct
    drm_i915_private as the main display device data pointer type. Convert
    intel_hti.[ch] to struct intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4d1d605f5ff966b0df757c683e396a9f3e77171b drm-intel
f345bb15c9cd drm/i915/display: support struct intel_atomic_state in to_intel_display()
8af2337ae287 drm/i915/display: convert intel_link_bw.c to struct intel_display
b70e0daf279c drm/i915/display: convert intel_load_detect.c to struct intel_display
e5c17c674731 drm/i915/alpm: convert to struct intel_display
59e7c5d12793 drm/i915/lspcon: convert to struct intel_display
6803f3446412 drm/i915/display: convert dp aux backlight to struct intel_display
f32a19e5d91e drm/i915/hti: convert to struct intel_display


