Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A762C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 14:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A1B10E932;
	Fri,  9 Aug 2024 14:33:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACD110E930;
 Fri,  9 Aug 2024 14:33:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_struct_intel?=
 =?utf-8?q?=5Fdisplay_conversions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 14:33:12 -0000
Message-ID: <172321399243.552626.4104676824843435525@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1723213547.git.jani.nikula@intel.com>
In-Reply-To: <cover.1723213547.git.jani.nikula@intel.com>
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

Series: drm/i915: struct intel_display conversions (rev2)
URL   : https://patchwork.freedesktop.org/series/136757/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
dc547930fbb1350eaf6bde84653b9ac973a411db
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3dc1558dbc8a86789ab6e52e374e543f4e35aa6a
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Aug 9 17:27:06 2024 +0300

    drm/i915/bios: convert to struct intel_display
    
    Going forward, struct intel_display shall replace struct
    drm_i915_private as the main display device data pointer type. Convert
    intel_bios.[ch] to struct intel_display.
    
    Do one drive-by conversion of unnecessary hex usage to decimal.
    
    Reviewed-by: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 8d0f83b389ec64b9f7f9b2ee241fc352346868f1 drm-intel
7d37252dbf51 drm/i915/acpi: convert to struct intel_display
bf4ec253aca9 drm/i915/opregion: unify intel_encoder/intel_connector naming
087ce3b6d01c drm/i915/opregion: convert to struct intel_display
3dc1558dbc8a drm/i915/bios: convert to struct intel_display


