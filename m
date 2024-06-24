Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7563FC2BD05
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 11:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245A610E400;
	Mon, 24 Jun 2024 11:51:22 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10FD10E400;
 Mon, 24 Jun 2024 11:51:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Track_writes?=
 =?utf-8?q?_to_inaccessible_registers_from_VF?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jun 2024 11:51:20 -0000
Message-ID: <171922988085.153309.10972118900319942540@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624114526.1125-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240624114526.1125-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/vf: Track writes to inaccessible registers from VF
URL   : https://patchwork.freedesktop.org/series/135295/
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
commit a2074524bcf0c1f88495df7a8f56d8ff2b82c8f1
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jun 24 13:45:26 2024 +0200

    drm/xe/vf: Track writes to inaccessible registers from VF
    
    Only limited set of registers is accessible for the VF driver.
    The hardware will silently drop writes to inaccessible registers,
    but to improve our driver lets track all such unexpected writes
    on debug builds.
    
    We will explicitly ignore writes to SOFTWARE_FLAGS_SPR33 since it
    is used by the driver just to mimic wmb and we do not have any
    similar unused scratch register accessible from the VF.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398 drm-intel
a2074524bcf0 drm/xe/vf: Track writes to inaccessible registers from VF


