Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767BAC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 14:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4821C10ECB3;
	Fri, 28 Feb 2025 14:03:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714DB10ECB4;
 Fri, 28 Feb 2025 14:03:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_add_s?=
 =?utf-8?q?ome_sub-structs_for_clarity?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 14:03:15 -0000
Message-ID: <174075139545.3243174.8536231427574938698@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740746939.git.jani.nikula@intel.com>
In-Reply-To: <cover.1740746939.git.jani.nikula@intel.com>
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

Series: drm/i915/display: add some sub-structs for clarity
URL   : https://patchwork.freedesktop.org/series/145640/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ad7ee2da33f34afd6c46a336749363c09ab0991f
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Fri Feb 28 14:49:31 2025 +0200

    drm/i915/hdcp: add hdcp sub-struct to struct intel_digital_port
    
    Move hdcp_mutex, num_hdcp_streams, hdcp_auth_status, hdcp_port_data, and
    hdcp_mst_type1_capable members of struct intel_digital_port under an
    hdcp sub-struct to group hdcp related things together.
    
    Rename them mutex, num_streams, auth_status, port_data, and
    mst_type1_capable for clarity.
    
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4e4a83bc30b77bb710641f0b43e6098bd04c5044 drm-intel
904875599049 drm/i915/mst: add mst sub-struct to struct intel_dp
cbc384c30c7b drm/i915/mst: add mst sub-struct to struct intel_connector
-:278: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#278: FILE: drivers/gpu/drm/i915/display/intel_dp_mst.c:1216:
+				       drm_atomic_get_mst_payload_state(mst_state, connector->mst.port));

total: 0 errors, 1 warnings, 0 checks, 379 lines checked
ad7ee2da33f3 drm/i915/hdcp: add hdcp sub-struct to struct intel_digital_port


