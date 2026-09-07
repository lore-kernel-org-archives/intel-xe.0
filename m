Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED27C79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 09:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249EB10E734;
	Mon,  7 Sep 2026 09:35:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BD510E43C;
 Mon,  7 Sep 2026 09:35:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_xe=5Fwedge_=28r?=
 =?utf-8?q?ev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 09:35:06 -0000
Message-ID: <178877370686.128699.6366848698562482391@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260907083541.2194747-1-raag.jadav@intel.com>
In-Reply-To: <20260907083541.2194747-1-raag.jadav@intel.com>
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

Series: Introduce xe_wedge (rev2)
URL   : https://patchwork.freedesktop.org/series/173011/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ba3f0c8cf7d79d1cc32faaf7f11e57539783c824
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Mon Sep 7 14:04:40 2026 +0530

    drm/xe/ras: Move xe_ras_process_errors() to xe_ras
    
    With xe_wedge_fini() now moved to xe_wedge and registered as part of
    xe_device_probe_early(), it is safe to move xe_ras_process_errors() back
    to xe_ras where it belongs. This essentially reverts commit 20bc4883c7c0
    ("drm/xe/ras: Fix boot-time ras error processing") which was added to
    prevent PM reference leak in case of early wedging in probe sequence.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch c60540b13d7bacc21848ed94fd368a968454d5db drm-intel
1c20364ccb32 drm/xe/gt: Use GT ordered workqueue for wedging
e49775412e28 drm/xe: Move xe_device_wedged_fini() registration to xe_device_probe_early()
cc625991f946 drm/xe: Make xe_device_declare_wedged() IRQ safe
1062bfa75b7d drm/xe: Introduce xe_wedge
-:1081: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#1081: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1235 lines checked
ba3f0c8cf7d7 drm/xe/ras: Move xe_ras_process_errors() to xe_ras


