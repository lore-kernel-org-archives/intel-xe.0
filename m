Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A94C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 18:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AE610E4CF;
	Mon,  1 Jul 2024 18:11:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DE310E4D0;
 Mon,  1 Jul 2024 18:11:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_PMT_features_in_X?=
 =?utf-8?q?e_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Jul 2024 18:11:12 -0000
Message-ID: <171985747259.2486.16329684326582492140@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240701141730.3585133-1-michael.j.ruhl@intel.com>
In-Reply-To: <20240701141730.3585133-1-michael.j.ruhl@intel.com>
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

Series: Support PMT features in Xe (rev6)
URL   : https://patchwork.freedesktop.org/series/133472/
State : warning

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
commit 6924256a50a3cf196439639c8c24ce6c75dfc817
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Mon Jul 1 10:17:27 2024 -0400

    drm/xe/vsec: Add support for DG2
    
    DG2 needs to adjust the discovery offset WRT the GT BAR not the
    P2SB bar so add the base_adjust value to allow for the difference
    to be used.
    
    Update xe_vsec.c to include DG2 header information.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 886eeb6d89b58f914ee5045fcac54b59a73d8299 drm-intel
28a85538f14f platform/x86/intel/vsec.h: Move to include/linux
-:192: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#192: 
rename from drivers/platform/x86/intel/vsec.h

total: 0 errors, 1 warnings, 0 checks, 149 lines checked
fd309f6fa44b platform/x86/intel/vsec: Add PMT read callbacks
15f7fe946027 platform/x86/intel/pmt: Use PMT callbacks
e1a070e08328 drm/xe/vsec: Support BMG devices
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 276 lines checked
2337c1d03d15 platform/x86/intel/pmt: Add support for PMT base adjust
6924256a50a3 drm/xe/vsec: Add support for DG2


