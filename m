Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA3BC41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 06:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2710E09A;
	Tue, 19 Dec 2023 06:56:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4FEB10E09A;
 Tue, 19 Dec 2023 06:56:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D01B2AADF8;
 Tue, 19 Dec 2023 06:56:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_ci-only_?=
 =?utf-8?q?GuC_FW_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Tue, 19 Dec 2023 06:56:03 -0000
Message-ID: <170296896384.17583.8831073016502977760@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231218212747.1136433-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231218212747.1136433-1-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: Remove ci-only GuC FW definitions
URL   : https://patchwork.freedesktop.org/series/127944/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 320675369db9f2dee167834d18a6310ce3202cda
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon Dec 18 13:27:47 2023 -0800

    drm/xe: Remove ci-only GuC FW definitions
    
    As part of the FW definitions, we declare each blob as required via the
    MODULE_FIRMWARE() macro. This causes the initramfs update (or equivalent
    process) to look for the blobs on disk when the kernel is installed;
    therefore, we need to make sure that all FWs we define are available in
    linux-firmware.
    
    We currently don't plan to push the PVC and LNL blobs to linux-firmware,
    so we need to remove them from the list. we can then re-add them in the
    topic/core-for-CI branch until we're ready to push them to the official
    repo.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 84e5d706cb0c11f2948a9f16d9e31ad5256b641c drm-intel
320675369 drm/xe: Remove ci-only GuC FW definitions


