Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F8C36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 15:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041B810E03A;
	Fri,  4 Apr 2025 15:53:32 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339F110E03A;
 Fri,  4 Apr 2025 15:53:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dp=5Fmst=3A_Clea?=
 =?utf-8?q?n_up_active_stream_count_tracking?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 15:53:30 -0000
Message-ID: <174378201020.39095.13154243535608271246@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250404150310.1156696-1-imre.deak@intel.com>
In-Reply-To: <20250404150310.1156696-1-imre.deak@intel.com>
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

Series: drm/i915/dp_mst: Clean up active stream count tracking
URL   : https://patchwork.freedesktop.org/series/147274/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ce372ce7b248a03663d1b37234852fc3e9a3804a
Author: Imre Deak <imre.deak@intel.com>
Date:   Fri Apr 4 18:03:10 2025 +0300

    drm/i915/dp_mst: Rename intel_dp::mst.active_links to mst.active_streams
    
    intel_dp::mst.active_links actually indicates the number of MST streams,
    not the number of MST links (one MST link carrying one or more MST
    streams), rename the field accordingly.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 15ac66651307aa3178e5ff8fc7d62b97f2092d09 drm-intel
12c7e7d7da57 drm/i915/dp: Rename intel_dp::link_trained to link.active
ff31ab58a8db drm/i915/dp_mst: Add intel_dp_mst_{inc, dec}_active_streams()
0b193d0b0dcc drm/i915/dp_mst: Remove stream count assert from intel_dp_check_mst_status()
5d5d2d0f30c7 drm/i915/dp_mst: Rename intel_dp_mst_encoder_active_links() to intel_dp_mst_active_streams()
78a90daa755f drm/i915/dp_mst: Use intel_dp_mst_active_streams() instead of open-coding it
ce372ce7b248 drm/i915/dp_mst: Rename intel_dp::mst.active_links to mst.active_streams


