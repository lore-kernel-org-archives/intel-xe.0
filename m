Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CDFCF0428
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 21:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822D910E5F7;
	Tue,  8 Oct 2024 21:49:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAB310E5FC;
 Tue,  8 Oct 2024 21:49:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_gen2_stuff?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 21:49:51 -0000
Message-ID: <172842419162.1206078.11887498653872823754@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008214349.23331-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20241008214349.23331-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: gen2 stuff
URL   : https://patchwork.freedesktop.org/series/139727/
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
commit e8c01e07444811f0a91c41b98d8fb88fca88b742
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Oct 9 00:43:49 2024 +0300

    drm/i915/pmu: Add support for gen2
    
    Implement pmu support for gen2 so that one can use intel_gpu_top
    on it once again.
    
    Gen2 lacks MI_MODE/MODE_IDLE so we'll have to do a bit more work
    to determine the state of the engine:
    - to determine if the ring contains unconsumed data we can simply
      compare RING_TAIL vs. RING_HEAD
    - also check RING_HEAD vs. ACTHD to catch cases where the hardware
      is still executing a batch buffer but the ring head has already
      caught up with the tail. Not entirely sure if that's actually
      possible or not, but maybe it can happen if the batch buffer is
      initiated from the very end of the ring? But even if not strictly
      necessary there's no real harm in checking anyway.
    - MI_WAIT_FOR_EVENT can be detected via a dedicated bit in RING_HEAD
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch 8752b50cc6ea4e90f3caa68dd1cc169112ac4b34 drm-intel
a87c3a9d3876 drm/i915/gt: Nuke gen2_irq_{enable,disable}()
20883744a025 drm/i915/gt: s/gen3/gen2/
57c6ac2c4983 drm/i915/irq: s/gen3/gen2/
e8c01e074448 drm/i915/pmu: Add support for gen2


