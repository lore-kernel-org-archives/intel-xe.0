Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C59CCF9FE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 23:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC2A10E10D;
	Fri, 31 Oct 2025 23:51:34 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C1110E10D;
 Fri, 31 Oct 2025 23:51:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_xe=5Fpci=5F?=
 =?utf-8?q?rebar?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 23:51:32 -0000
Message-ID: <176195469242.7757.5885688859226842760@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
In-Reply-To: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
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

Series: drm/xe: Add xe_pci_rebar
URL   : https://patchwork.freedesktop.org/series/156871/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6b7b5d4671c99e8fdafe44cb720f937587aa2457
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Oct 31 14:17:43 2025 -0700

    drm/xe: Improve rebar log messages
    
    Some minor improvements to the log messages in the rebar logic:
    use xe-oriented printk, switch unit from M to MiB in a few places for
    consistency and us ilog2(SZ_1M) for clarity.
    
    Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 089e83683d58db86cc4c69d34fba3a96904e40e1 drm-intel
8ddf926487e4 drm/xe: Move rebar to its own file
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 307 lines checked
6b7b5d4671c9 drm/xe: Improve rebar log messages
-:59: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#59: FILE: drivers/gpu/drm/xe/xe_pci_rebar.c:96:
+				(u64)rebar_size >> ilog2(SZ_1M), bar_size_mask, (u64)current_size >> ilog2(SZ_1M));

total: 0 errors, 1 warnings, 0 checks, 57 lines checked


