Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3D7C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 17:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD26A10E2DB;
	Wed, 31 Jul 2024 17:38:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF99310E2DB;
 Wed, 31 Jul 2024 17:38:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_struct_intel?=
 =?utf-8?q?=5Fdisplay_conversions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 17:38:56 -0000
Message-ID: <172244753671.468844.10039484933946322951@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1722444150.git.jani.nikula@intel.com>
In-Reply-To: <cover.1722444150.git.jani.nikula@intel.com>
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

Series: drm/i915: struct intel_display conversions
URL   : https://patchwork.freedesktop.org/series/136757/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 20a7cceb512a6b61a673a29fdc814247926f27ce
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jul 31 19:44:36 2024 +0300

    drm/i915/bios: convert to struct intel_display
    
    Going forward, struct intel_display shall replace struct
    drm_i915_private as the main display device data pointer type. Convert
    intel_bios.[ch] to struct intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 91efc68883cbff0e7e453d1828c8e84d9959c458 drm-intel
4f9315b4caba drm/i915/acpi: convert to struct intel_display
0d2a4d58dd64 drm/i915/opregion: unify intel_encoder/intel_connector naming
0e795fb6c349 drm/i915/opregion: convert to struct intel_display
20a7cceb512a drm/i915/bios: convert to struct intel_display


