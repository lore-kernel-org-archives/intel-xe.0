Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7535EC3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 18:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4519710E47B;
	Mon, 15 Jul 2024 18:01:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82DE10E47B;
 Mon, 15 Jul 2024 18:01:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Support_PMT_features_in_X?=
 =?utf-8?q?e_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jul 2024 18:01:53 -0000
Message-ID: <172106651388.231691.16518299633428698413@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
In-Reply-To: <20240715175452.4010751-1-michael.j.ruhl@intel.com>
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

Series: Support PMT features in Xe (rev8)
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
commit 36d91890bc832583d3e1f258ec0ad6e5cfabab5b
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Mon Jul 15 13:54:50 2024 -0400

    drm/xe/vsec: Add support for DG2
    
    PMT (DVSEC) offset information is based on the PCI BAR
    for the telemetry (PCI) endpoint (also known as the P2SB).
    However the DG2 endpoint is not completely functional,
    and is disabled.
    
    In order to allow access to the DG2 PMT features it is
    necessary to inform the VSEC driver of the correct offset
    via the base_adjust value.
    
    This odjustment is the difference between the telemetry
    offset (read from the PMT regiser) and the fixed offset in
    the Xe SOC space.  Calculate the offset, and pass it to the
    VSEC driver on header registration.
    
    Update xe_vsec.c to include DG2 header information.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch b6af83ceb593bc4e0d79acda73684462b13a15b9 drm-intel
4796dceb799c platform/x86/intel/vsec.h: Move to include/linux
-:198: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#198: 
rename from drivers/platform/x86/intel/vsec.h

total: 0 errors, 1 warnings, 0 checks, 184 lines checked
8856c1f8abd6 platform/x86/intel/vsec: Add PMT read callbacks
f398e3830ff2 platform/x86/intel/pmt: Use PMT callbacks
b0c7d799e8df drm/xe/vsec: Support BMG devices
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

total: 0 errors, 1 warnings, 0 checks, 277 lines checked
ea9382b8650e platform/x86/intel/pmt: Add support for PMT base adjust
36d91890bc83 drm/xe/vsec: Add support for DG2
-:16: WARNING:TYPO_SPELLING: 'regiser' may be misspelled - perhaps 'register'?
#16: 
offset (read from the PMT regiser) and the fixed offset in
                          ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 124 lines checked


