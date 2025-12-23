Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BD0E6F085
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 17:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4508D10E228;
	Tue, 23 Dec 2025 17:05:18 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9BB10E228;
 Tue, 23 Dec 2025 17:05:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_xe=5Fpci=5F?=
 =?utf-8?q?rebar_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Dec 2025 17:05:16 -0000
Message-ID: <176650951696.114809.13411628693102473079@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219211650.1908961-4-matthew.d.roper@intel.com>
In-Reply-To: <20251219211650.1908961-4-matthew.d.roper@intel.com>
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

Series: drm/xe: Add xe_pci_rebar (rev4)
URL   : https://patchwork.freedesktop.org/series/156871/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 090981c9ff82da94a715c1f86c2e83e9eae544a4
Author: Lucas De Marchi <demarchi@kernel.org>
Date:   Fri Dec 19 13:16:49 2025 -0800

    drm/xe: Improve rebar log messages
    
    Some minor improvements to the log messages in the rebar logic:
    use xe-oriented printk, switch unit from M to MiB in a few places for
    consistency and use ilog2(SZ_1M) for clarity.
    
    Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 98fdf8a438c3a1d9de8d5804cdcda94e097d53a0 drm-intel
eb3ce3a89f58 drm/xe: Move rebar to its own file
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 247 lines checked
090981c9ff82 drm/xe: Improve rebar log messages


