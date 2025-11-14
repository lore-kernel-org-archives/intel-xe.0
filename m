Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CDCCE8D56
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 16:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C237910E24D;
	Fri, 14 Nov 2025 16:47:16 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E310E24D;
 Fri, 14 Nov 2025 16:47:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_pci_changes_for_drm-tip?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 16:47:16 -0000
Message-ID: <176313883637.55609.11230929904198457456@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114154338.4161137-2-lucas.demarchi@intel.com>
In-Reply-To: <20251114154338.4161137-2-lucas.demarchi@intel.com>
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

Series: pci changes for drm-tip
URL   : https://patchwork.freedesktop.org/series/157585/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e8d901bcb432c109e72df9176e2bb2e4acd5d329
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Nov 14 07:43:38 2025 -0800

    pci changes for drm-tip
    
    PCI change from git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git 1f16dbb3b4ed8cd8a852f0cc90b78e71ed6cbc99
    for drm-tip testing in i915 and xe.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 396085f09adb76920b080f62adfd4649e572111b drm-intel
e8d901bcb432 pci changes for drm-tip
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


