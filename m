Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD25C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 18:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B187F10E37B;
	Mon, 10 Jun 2024 18:54:22 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E357510E379;
 Mon, 10 Jun 2024 18:54:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Prepare_Xe_force-wake_cod?=
 =?utf-8?q?e_for_VFs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jun 2024 18:54:20 -0000
Message-ID: <171804566093.48434.14666697086501256131@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240610183757.1812-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240610183757.1812-1-michal.wajdeczko@intel.com>
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

Series: Prepare Xe force-wake code for VFs
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
commit 97369f01d1fa5a390fa84c715cd16fd5d60afded
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jun 10 20:37:57 2024 +0200

    drm/xe/vf: Ignore force-wake requests if VF
    
    The control and ack force-wake registers are not accessible for
    the VF drivers. To avoid changing existing code logic that tracks
    woken domains, simply ignore all attempts to access control or ack
    registers if we are running as a VF driver.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch a7d697ac042a3c94241bc4b3d0c19b763107c205 drm-intel
6ff32551e4b1 drm/xe: Prefer GT oriented messages in xe_force_wake.c
fc8a3b552fb9 drm/xe: Include additional info on failed force-wake operation
bfcaadd2853d drm/xe: Combine common force-wake code into helpers
97369f01d1fa drm/xe/vf: Ignore force-wake requests if VF


