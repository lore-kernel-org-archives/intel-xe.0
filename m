Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A443AE674A7
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 06:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2F810E1BB;
	Fri,  1 Nov 2024 06:33:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4F710E1BB;
 Fri,  1 Nov 2024 06:33:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Use_trans_push_mechanism_?=
 =?utf-8?q?to_generate_frame_change_event_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Nov 2024 06:33:54 -0000
Message-ID: <173044283424.1386901.12132730802837416597@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241101062728.3865980-1-jouni.hogander@intel.com>
In-Reply-To: <20241101062728.3865980-1-jouni.hogander@intel.com>
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

Series: Use trans push mechanism to generate frame change event (rev2)
URL   : https://patchwork.freedesktop.org/series/139831/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4054dfbfadd74f730b4c9808efd3ea7756d20ca2
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Nov 1 08:27:28 2024 +0200

    drm/i915/display: Generate PSR frame change event on cursor update
    
    On LunarLake and onwards we are using vrr send push mechanism to trigger
    frame change event. Due to this we need to trigger it using
    intel_vrr_psr_send_push provided by VRR code on legacy cursor update.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch 73837e0500d417f9ff3afdf145ee7e1b152d9c24 drm-intel
d637dead0d4e drm/i915/psr: Add TRANS_PUSH register bit definition for PSR
d441f5d099e9 drm/i915/vrr: Do not overwrite TRANS_PUSH PSR Frame Change Enable
e1194bf6e802 drm/i915/vrr: Use TRANS_PUSH mechanism for PSR frame change
41ecd74c4386 drm/i915/psr: Rename psr_force_hw_tracking_exit as psr_force_exit
1f116a8c62bf drm/i915/psr: Simplify frontbuffer invalidate/flush callbacks
37ba87d531ce drm/i915/psr: Add VRR send push interface for PSR usage
4054dfbfadd7 drm/i915/display: Generate PSR frame change event on cursor update


