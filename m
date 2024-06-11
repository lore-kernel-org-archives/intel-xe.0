Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EEAC27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 17:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1F810E6F0;
	Tue, 11 Jun 2024 17:36:45 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC46110E6F0;
 Tue, 11 Jun 2024 17:36:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prepare_Xe_force-wake_cod?=
 =?utf-8?q?e_for_VFs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Jun 2024 17:36:44 -0000
Message-ID: <171812740483.67160.18259495035529788267@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240611163537.1944-1-michal.wajdeczko@intel.com>
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

Series: Prepare Xe force-wake code for VFs (rev4)
URL   : https://patchwork.freedesktop.org/series/134690/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 25b8026480d6ff154dcb537e76480715ea42f0a9
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 11 18:35:37 2024 +0200

    drm/xe/vf: Ignore force-wake requests if VF
    
    The control and ack force-wake registers are not accessible for
    the VF drivers. To avoid changing existing code logic that tracks
    woken domains, simply ignore all attempts to access control or ack
    registers if we are running as a VF driver.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 950ce28fe0b31a24c5bddcc337aba9554a41cbb3 drm-intel
20a6c8c9d690 drm/xe: Prefer GT oriented messages in xe_force_wake.c
737217e34d91 drm/xe: Kill fw_to_gt() helper
2de9c2718bd5 drm/xe: Include additional info on failed force-wake operation
3b2aac2f719e drm/xe: Combine common force-wake code into helpers
25b8026480d6 drm/xe/vf: Ignore force-wake requests if VF


