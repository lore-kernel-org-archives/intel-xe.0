Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D5ECEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 23:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26B10E3FE;
	Mon, 17 Nov 2025 23:52:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BD910E404;
 Mon, 17 Nov 2025 23:52:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_xe=5Fpci=5F?=
 =?utf-8?q?rebar_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Nov 2025 23:52:35 -0000
Message-ID: <176342355599.3464.18042318072868400586@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251117-xe-pci-rebar-2-part-2-v2-0-9f3dac7dec36@intel.com>
In-Reply-To: <20251117-xe-pci-rebar-2-part-2-v2-0-9f3dac7dec36@intel.com>
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

Series: drm/xe: Add xe_pci_rebar (rev2)
URL   : https://patchwork.freedesktop.org/series/156871/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ed16d833bb2899d33fa486a46d518f54d805e5c5
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Nov 17 15:42:47 2025 -0800

    drm/xe: Improve rebar log messages
    
    Some minor improvements to the log messages in the rebar logic:
    use xe-oriented printk, switch unit from M to MiB in a few places for
    consistency and use ilog2(SZ_1M) for clarity.
    
    Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 91fc6d984707c9bfd4a60550e6a85f1a991e7ec8 drm-intel
a5c05281a563 FOR-CI: pci changes for drm-tip
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
PCI change from git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git 1f16dbb3b4ed8cd8a852f0cc90b78e71ed6cbc99

-:570: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#570: 
new file mode 100644

-:655: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#655: FILE: drivers/pci/rebar.c:81:
+		return -ENOTSUPP;

-:874: WARNING:ENOTSUPP: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
#874: FILE: drivers/pci/rebar.c:300:
+		return -ENOTSUPP;

total: 0 errors, 4 warnings, 0 checks, 1123 lines checked
92ad0e6607dc drm/xe: Move rebar to its own file
-:50: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#50: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 247 lines checked
ed16d833bb28 drm/xe: Improve rebar log messages


