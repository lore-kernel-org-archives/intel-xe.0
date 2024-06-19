Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A224AC2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DA310E27F;
	Wed, 19 Jun 2024 21:51:24 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C8210E27F;
 Wed, 19 Jun 2024 21:51:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Adapt_the_driver_to_boot_?=
 =?utf-8?q?on_the_VF_device?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 21:51:23 -0000
Message-ID: <171883388309.125140.12733429488261399130@a6498e030952>
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

Series: Adapt the driver to boot on the VF device
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
commit ec0b4f84716bb5724d96eccd7b7dda23d98b5491
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jun 19 23:45:57 2024 +0200

    drm/xe/vf: Custom HuC initialization if VF
    
    The HuC firmware is loaded and initialized by the PF driver. Make
    sure VF driver performs only limited data structure initialization.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 drm-intel
22830edd94b3 drm/xe/vf: Disable features that do not apply to VFs
32c875231145 drm/xe/vf: Don't run any save-restore RTP actions if VF
2f471e98e625 drm/xe/vf: Don't apply tile workarounds if VF
6d5169ed46ea drm/xe/vf: Don't change hwe IRQ masks if using memory IRQs
3dfcaf22b7be drm/xe/vf: Don't initialize OA if VF
4fc8ba301446 drm/xe/vf: Don't support gtidle if VF
07370b779a30 drm/xe/vf: Don't use register based TLB invalidation if VF
957f29ad012e drm/xe/vf: Skip engine ring enabling if VF
ec0b4f84716b drm/xe/vf: Custom HuC initialization if VF


