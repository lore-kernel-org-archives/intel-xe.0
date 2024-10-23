Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E2AD2E014
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 04:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC0F10E718;
	Wed, 23 Oct 2024 04:50:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A84410E35F;
 Wed, 23 Oct 2024 04:50:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Allow_fastset?=
 =?utf-8?q?_for_change_in_HDR_infoframe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Oct 2024 04:50:50 -0000
Message-ID: <172965905010.1322262.5776576530376409397@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023044122.3889137-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20241023044122.3889137-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915: Allow fastset for change in HDR infoframe (rev3)
URL   : https://patchwork.freedesktop.org/series/139292/
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
commit 91edf11aebcb860a3320c26fd31198abd1b36ee3
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Wed Oct 23 10:11:22 2024 +0530

    drm/i915: Allow fastset for change in HDR infoframe
    
    Changes in Dynamic Range and Mastering infoframe
    should not trigger a full modeset. Therefore, allow
    fastset. DP SDP programming is already hooked up in the
    fastset flow but HDMI AVI infoframe update is not, add it.
    Any other infoframe that can be fastset should be added to
    the helper intel_hdmi_fastset_infoframes().
    
    v3:
     - Create a wrapper intel_ddi_update_pipe_hdmi to stick to
       uniform naming (Jani)
     - Do not disable HDMI AVI infoframe if already disabled (Uma)
    
    v2:
     - Update HDMI AVI infoframe during fastset.
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 8a7ac0227c7c3fe2fcb01a933df5b9c49c7f2832 drm-intel
91edf11aebcb drm/i915: Allow fastset for change in HDR infoframe


