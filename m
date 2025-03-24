Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804D1C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 18:35:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F7310E439;
	Mon, 24 Mar 2025 18:35:39 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCA710E439;
 Mon, 24 Mar 2025 18:35:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Fix_DP_MST_DB?=
 =?utf-8?q?_message_timeouts_due_to_PPS_delays?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 18:35:37 -0000
Message-ID: <174284133783.74611.17572501989002849172@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250324180145.142884-1-imre.deak@intel.com>
In-Reply-To: <20250324180145.142884-1-imre.deak@intel.com>
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

Series: drm/i915: Fix DP MST DB message timeouts due to PPS delays
URL   : https://patchwork.freedesktop.org/series/146681/
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
commit c7e0c3ba1883c4bb7fbb40cf1b461ef4b761daf8
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon Mar 24 20:01:45 2025 +0200

    drm/i915/dp_mst: Fix side-band message timeouts due to long PPS delays
    
    The Panel Power Sequencer lock held on an eDP port (a) blocks a DP AUX
    transfer on another port (b), since the PPS lock is device global, thus
    shared by all ports. The PPS lock can be held on port (a) for a longer
    period due to the various PPS delays (panel/backlight on/off,
    power-cycle delays). This in turn can cause an MST down-message request
    on port (b) time out, if the above PPS delay defers the handling of the
    reply to the request by more than 100ms: the MST branch device sending
    the reply (signaling this via the DP_DOWN_REP_MSG_RDY flag in the
    DP_DEVICE_SERVICE_IRQ_VECTOR DPCD register) may cancel the reply
    (clearing DP_DOWN_REP_MSG_RDY and the reply message buffer) after 110
    ms, if the reply is not processed by that time.
    
    Avoid MST down-message timeouts described above, by locking the PPS
    state for AUX transfers only if this is actually required: on eDP ports,
    where the VDD power depends on the PPS state and on all DP and eDP ports
    on VLV/CHV, where the PPS is a pipe instance and hence a modeset on any
    port possibly affecting the PPS state.
    
    v2: Don't move PPS locking/VDD enabling to a separate function. (Jani)
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch 9be2a7099019ef52d17cbc2b3e6ba15cd638ec2c drm-intel
0bdf935915dd drm/i915/pps: Let calling intel_pps_vdd_{on, off}_unlocked() w/o PPS lock held
c7e0c3ba1883 drm/i915/dp_mst: Fix side-band message timeouts due to long PPS delays


