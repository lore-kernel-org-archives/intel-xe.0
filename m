Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31004C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 19:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28C710E29A;
	Mon, 22 Jul 2024 19:11:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E851D10E29A;
 Mon, 22 Jul 2024 19:11:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_stale_de?=
 =?utf-8?q?claration_of_xe=5Fmmio=5Fprobe=5Fvram=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jul 2024 19:11:23 -0000
Message-ID: <172167548394.342828.8589507988593693554@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722190524.71548-2-gustavo.sousa@intel.com>
In-Reply-To: <20240722190524.71548-2-gustavo.sousa@intel.com>
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

Series: drm/xe: Remove stale declaration of xe_mmio_probe_vram()
URL   : https://patchwork.freedesktop.org/series/136354/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 35f7c3bf170f64802ffb77f2edbf2a2c14f1d59e
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Mon Jul 22 16:05:25 2024 -0300

    drm/xe: Remove stale declaration of xe_mmio_probe_vram()
    
    The declaration of xe_mmio_probe_vram() became useless since
    commit 638d1c79cbf1 ("drm/xe: Promote VRAM initialization function to
    own file"). Remove it.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 16dc06e8fb1aaf484c4914f1fecc22502c9ab641 drm-intel
35f7c3bf170f drm/xe: Remove stale declaration of xe_mmio_probe_vram()


