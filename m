Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C965C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 15:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6328F10E7DB;
	Fri, 21 Mar 2025 15:01:39 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4639210E7DB;
 Fri, 21 Mar 2025 15:01:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Fix_DP_MST_SB?=
 =?utf-8?q?_message_timeouts_due_to_PPS_delays?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Mar 2025 15:01:38 -0000
Message-ID: <174256929828.64975.14137261947175578982@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250321145626.94101-1-imre.deak@intel.com>
In-Reply-To: <20250321145626.94101-1-imre.deak@intel.com>
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

Series: drm/i915: Fix DP MST SB message timeouts due to PPS delays
URL   : https://patchwork.freedesktop.org/series/146601/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 631f39ba98b9b3ae0f7a7b21ae0a2df8e30e5198
Author: Imre Deak <imre.deak@intel.com>
Date:   Fri Mar 21 16:56:26 2025 +0200

    drm/i915/pps: Use intel_pps_is_pipe_instance() instead of open-coding it
    
    Use intel_pps_is_pipe_instance() instead of open-coding the same for all
    conditional PPS programming required for a pipe instance PPS.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch b15a87713d14b1c2986f47a622c5a8c5458e2396 drm-intel
019a7136a400 drm/i915/pps: Add helpers to lock PPS for AUX transfers
4e628c981e67 drm/i915/dp_mst: Fix side-band message timeouts due to long PPS delays
631f39ba98b9 drm/i915/pps: Use intel_pps_is_pipe_instance() instead of open-coding it


