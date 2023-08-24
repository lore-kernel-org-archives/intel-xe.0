Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AD2C7EE2C
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 16:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF85710E59E;
	Thu, 24 Aug 2023 16:50:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 901B310E595;
 Thu, 24 Aug 2023 16:50:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8D0D3A73C7;
 Thu, 24 Aug 2023 16:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 24 Aug 2023 16:50:23 -0000
Message-ID: <169289582357.13344.2796000316300340259@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230824160444.494648-2-matthew.auld@intel.com>
In-Reply-To: <20230824160444.494648-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_nuke_GuC_on_unload?=
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

Series: drm/xe: nuke GuC on unload
URL   : https://patchwork.freedesktop.org/series/122851/
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
commit 191b7da00a6b406f71aa1804a6650d0139815383
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Aug 24 17:04:45 2023 +0100

    drm/xe: nuke GuC on unload
    
    On PVC unloading followed by reloading the module often results in a
    completely dead machine (seems to be plaguing CI). Resetting the GuC
    like we do at load seems to cure it at least when locally testing this.
    
    v2:
      - Move pc_fini into guc_fini. We want to do the GuC reset just after
        calling pc_fini, otherwise we encounter communication failures. It
        also seems like a good idea to do the reset before we start releasing
        the various other GuC resources. In the case of pc_fini there is an
        explicit stop, but for other stuff like logs, ads, ctb there is not.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/542
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/597
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch c77796cf84361b4716839141f2e48de2bf7f4bd5 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


