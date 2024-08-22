Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4C3C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 13:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8949010EA51;
	Thu, 22 Aug 2024 13:14:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395E410EA51;
 Thu, 22 Aug 2024 13:14:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_memirq_infra_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Aug 2024 13:14:10 -0000
Message-ID: <172433245022.725702.15013648455126477971@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240822130815.1355437-1-ilia.levi@intel.com>
In-Reply-To: <20240822130815.1355437-1-ilia.levi@intel.com>
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

Series: memirq infra changes
URL   : https://patchwork.freedesktop.org/series/137643/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0934a546ebdb490dbd9ae6a829588c6bb2c59e5c
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Thu Aug 22 16:08:15 2024 +0300

    drm/xe: separate memirq reset/postinstall from vf
    
    Up until now only VF used Memory Based Interrupts (memirq).
    Moving reset/postinstall flows out of VF to cater for other usages.
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch dc922f9a42d9a7d424b1059ba905b6666ac148c8 drm-intel
afa55b4c30d4 drm/xe: move memirq out of vf
33acc3994070 drm/xe: memirq infra changes for msix
86370673ceb4 drm/xe: add memirq offsets for engine instance 0 to hw engine properties
93091474f3d1 drm/xe: memirq handler changes
0934a546ebdb drm/xe: separate memirq reset/postinstall from vf


