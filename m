Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C14EC678DC
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 22:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B3E10E171;
	Thu, 17 Aug 2023 22:33:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB17C10E171;
 Thu, 17 Aug 2023 22:33:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E7CADAADE3;
 Thu, 17 Aug 2023 22:33:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Thu, 17 Aug 2023 22:33:08 -0000
Message-ID: <169231158894.12433.15941681156497904451@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230817201831.1583172-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_plumbing_for_submitting_to_the_GSCCS_=28rev3=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Add plumbing for submitting to the GSCCS (rev3)
URL   : https://patchwork.freedesktop.org/series/122531/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fe16f1ff1852c5fda01237c214761f5657241f53
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu Aug 17 15:17:07 2023 -0700

    drm/xe: enable idle msg and set hysteresis for GSCCS
    
    On MTL (and only on MTL) the GSCCS defaults with idle messaging
    disabled. This means that, once awoken, the GSCCS will never signal its
    idleness to the GT. To allow the GT to enter the proper low-power state,
    we need therefore to turn idle messaging on. As part of this, we also
    need to set a proper hysteresis value for the engine.
    
    v2: use MEDIA_VERSION() and CLR() for the RTP rule and action, add reg
    bit define in descending order (Matt)
    
    Bspec: 71496
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 9112bca10116fdc4c33220478c47aa92f95832fe drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


