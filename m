Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31593C28B28
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 21:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A5210E07E;
	Fri,  7 Mar 2025 21:50:05 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA01310E1C7;
 Fri,  7 Mar 2025 21:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=5Fmst=3A_Fix_locki?=
 =?utf-8?q?ng_when_skipping_CSN_before_topology_probing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 21:50:04 -0000
Message-ID: <174138420475.4463.16258451216108255581@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307183152.3822170-1-imre.deak@intel.com>
In-Reply-To: <20250307183152.3822170-1-imre.deak@intel.com>
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

Series: drm/dp_mst: Fix locking when skipping CSN before topology probing
URL   : https://patchwork.freedesktop.org/series/146018/
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
commit 667472723beacf199242e361814487f5cc8482a6
Author: Imre Deak <imre.deak@intel.com>
Date:   Fri Mar 7 20:31:52 2025 +0200

    drm/dp_mst: Fix locking when skipping CSN before topology probing
    
    The handling of the MST Connection Status Notify message is skipped if
    the probing of the topology is still pending. Acquiring the
    drm_dp_mst_topology_mgr::probe_lock for this in
    drm_dp_mst_handle_up_req() is problematic: the task/work this function
    is called from is also responsible for handling MST down-request replies
    (in drm_dp_mst_handle_down_rep()). Thus drm_dp_mst_link_probe_work() -
    holding already probe_lock - could be blocked waiting for an MST
    down-request reply while drm_dp_mst_handle_up_req() is waiting for
    probe_lock while processing a CSN message. This leads to the probe
    work's down-request message timing out.
    
    A scenario similar to the above leading to a down-request timeout is
    handling a CSN message in drm_dp_mst_handle_conn_stat(), holding the
    probe_lock and sending down-request messages while a second CSN message
    sent by the sink subsequently is handled by drm_dp_mst_handle_up_req().
    
    Fix the above by moving the logic to skip the CSN handling to
    drm_dp_mst_process_up_req(). This function is called from a work
    (separate from the task/work handling new up/down messages), already
    holding probe_lock. This solves the above timeout issue, since handling
    of down-request replies won't be blocked by probe_lock.
    
    Fixes: ddf983488c3e ("drm/dp_mst: Skip CSN if topology probing is not done yet")
    Cc: Wayne Lin <Wayne.Lin@amd.com>
    Cc: Lyude Paul <lyude@redhat.com>
    Cc: stable@vger.kernel.org # v6.6+
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch f811577f424491a57b1e8669bde62998227d6907 drm-intel
667472723bea drm/dp_mst: Fix locking when skipping CSN before topology probing


