Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F99C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 10:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EBB10E304;
	Thu, 20 Jun 2024 10:09:24 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EE210E304;
 Thu, 20 Jun 2024 10:09:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Adapt_the_driver_to_boot_?=
 =?utf-8?q?on_the_VF_device_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jun 2024 10:09:23 -0000
Message-ID: <171887816368.127478.17034876632836388944@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

Series: Adapt the driver to boot on the VF device (rev3)
URL   : https://patchwork.freedesktop.org/series/135080/
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
commit 7bf1debaf57b5d12c0c7443f2b98b3bb0919e673
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jun 19 23:45:57 2024 +0200

    drm/xe/vf: Custom HuC initialization if VF
    
    The HuC firmware is loaded and initialized by the PF driver. Make
    sure VF driver performs only limited data structure initialization.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 65ef303b3a8a20609f394e0a823ade01cb4f1357 drm-intel
e3499b899162 drm/xe/vf: Disable features that do not apply to VFs
60a68af2274f drm/xe/vf: Don't run any save-restore RTP actions if VF
6c4db6b71e26 drm/xe/vf: Don't apply tile workarounds if VF
598c86fe167a drm/xe/vf: Don't change hwe IRQ masks if using memory IRQs
17bed2717c2b drm/xe/vf: Don't initialize OA if VF
ea92072451c6 drm/xe/vf: Don't support gtidle if VF
cdb1b68e7b80 drm/xe/vf: Don't use register based TLB invalidation if VF
442f2ac61e70 drm/xe/vf: Skip engine ring enabling if VF
7bf1debaf57b drm/xe/vf: Custom HuC initialization if VF


