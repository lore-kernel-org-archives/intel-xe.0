Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2BE68944
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 08:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE88210E2CF;
	Thu, 31 Oct 2024 08:15:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C3A10E2CC;
 Thu, 31 Oct 2024 08:15:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/psr=3A_Disable_P?=
 =?utf-8?q?anel_Replay_as_well_if_VRR_is_enabled?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Oct 2024 08:15:59 -0000
Message-ID: <173036255916.1365298.7443348508112544072@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241031081025.3215966-1-jouni.hogander@intel.com>
In-Reply-To: <20241031081025.3215966-1-jouni.hogander@intel.com>
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

Series: drm/i915/psr: Disable Panel Replay as well if VRR is enabled
URL   : https://patchwork.freedesktop.org/series/140753/
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
commit 0068d8bd49763a85ac158ff8b0c8d3d49b7fe812
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Thu Oct 31 10:10:25 2024 +0200

    drm/i915/psr: Disable Panel Replay as well if VRR is enabled
    
    Having Panel Replay enabled together with VRR is causing following errors:
    
    xe 0000:00:02.0: [drm] *ERROR* Timed out waiting PSR idle state
    xe 0000:00:02.0: [drm] *ERROR* Fault errors on pipe A: 0x00000080
    xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO underrun
    xe 0000:00:02.0: [drm] *ERROR* Fault errors on pipe A: 0x00040080
    xe 0000:00:02.0: [drm] *ERROR* Fault errors on pipe A: 0x00040080
    
    Let's disable Panel Replay as well if VRR is enabled.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 drm-intel
0068d8bd4976 drm/i915/psr: Disable Panel Replay as well if VRR is enabled


