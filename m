Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441FEC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 12:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0679D10E28E;
	Tue, 25 Jun 2024 12:51:31 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE91710E28E;
 Tue, 25 Jun 2024 12:51:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_PMT_features_in_X?=
 =?utf-8?q?e_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 12:51:29 -0000
Message-ID: <171931988990.153309.9156224409043376929@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
In-Reply-To: <20240625124554.3358460-1-michael.j.ruhl@intel.com>
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

Series: Support PMT features in Xe (rev3)
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
commit f7509e5310323d4d83d590d6a69016765192a5f7
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Tue Jun 25 08:45:52 2024 -0400

    drm/xe/vsec: Add support for DG2
    
    DG2 needs to adjust the discovery offset WRT the GT BAR not the
    P2SB bar so add the base_adjust value to allow for the difference
    to be used.
    
    Update xe_vsec.c to include DG2 header information.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 61dfb30a52fac9b1bb455a250799611682334cc3 drm-intel
673dc4be85ca platform/x86/intel/vsec.h: Move to include/linux
-:191: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#191: 
rename from drivers/platform/x86/intel/vsec.h

total: 0 errors, 1 warnings, 0 checks, 149 lines checked
04da03b9b28e platform/x86/intel/vsec: Add PMT read callbacks
0bebed18ef39 platform/x86/intel/pmt: Use PMT callbacks
51efb5fc7028 drm/xe/vsec: Support BMG devices
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

total: 0 errors, 1 warnings, 0 checks, 269 lines checked
9b9dc44697f7 platform/x86/intel/pmt: Add support for PMT base adjust
f7509e531032 drm/xe/vsec: Add support for DG2


