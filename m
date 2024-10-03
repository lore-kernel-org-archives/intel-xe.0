Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6325DCF34B0
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 15:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C7C10E87C;
	Thu,  3 Oct 2024 15:27:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E39B10E87A;
 Thu,  3 Oct 2024 15:27:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/psr=3A_Implement?=
 =?utf-8?q?_WA_to_help_reach_PC10?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 15:27:06 -0000
Message-ID: <172796922657.1168893.7851652834042327403@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003145337.1673715-2-suraj.kandpal@intel.com>
In-Reply-To: <20241003145337.1673715-2-suraj.kandpal@intel.com>
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

Series: drm/i915/psr: Implement WA to help reach PC10
URL   : https://patchwork.freedesktop.org/series/139512/
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
commit 95ebf74fbd19c7093bd1b43d0880a11e16ad610a
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Oct 3 20:23:38 2024 +0530

    drm/i915/psr: Implement WA to help reach PC10
    
    To reach PC10 when PKG_C_LATENCY is configure we must do the following
    things
    1) Enter PSR1 only when delayed_vblank < 6 lines and DC5 can be entered
    2) Allow PSR2 deep sleep when DC5 can be entered
    3) DC5 can be entered when all transocoder have either PSR1, PSR2 or
    eDP 1.5 PR ALPM enabled and VBI is disabled and flips and pushes are
    not happening.
    
    WA: 22019444797
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 17c0158bdb239d8b6d23834db5595ea422b69915 drm-intel
95ebf74fbd19 drm/i915/psr: Implement WA to help reach PC10


