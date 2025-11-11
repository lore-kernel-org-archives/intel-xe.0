Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21283CCFA1A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 15:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E9810E5F3;
	Tue, 11 Nov 2025 15:46:23 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F4C10E343;
 Tue, 11 Nov 2025 15:46:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_mtd=3A_intel-dg=3A_Fix_ac?=
 =?utf-8?q?cessing_regions_before_setting_nregions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Nov 2025 15:46:23 -0000
Message-ID: <176287598352.42606.9098963422879312332@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251111-mtd-nregions-v1-1-61db61e78c63@intel.com>
In-Reply-To: <20251111-mtd-nregions-v1-1-61db61e78c63@intel.com>
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

Series: mtd: intel-dg: Fix accessing regions before setting nregions
URL   : https://patchwork.freedesktop.org/series/157392/
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
commit 7b674888ea77b0b871c58f4e278b21373712dd52
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Nov 11 07:28:25 2025 -0800

    mtd: intel-dg: Fix accessing regions before setting nregions
    
    The regions array is counted by nregions, but it's set only after
    accessing it:
    
            [] UBSAN: array-index-out-of-bounds in drivers/mtd/devices/mtd_intel_dg.c:750:15
            [] index 0 is out of range for type '<unknown> [*]'
    
    Fix it by also fixing an undesired behavior: the loop silently ignores
    ENOMEM and continues setting the other entries.
    
    Cc: Alexander Usyskin <alexander.usyskin@intel.com>
    Reported-by: Jani Partanen <jiipee@sotapeli.fi>
    Closes: https://lore.kernel.org/all/caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi
    Fixes: ceb5ab3cb646 ("mtd: add driver for intel graphics non-volatile memory device")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 52764bea2cf028d285b0f4d86ee1ebfd4e196486 drm-intel
7b674888ea77 mtd: intel-dg: Fix accessing regions before setting nregions
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
	[] UBSAN: array-index-out-of-bounds in drivers/mtd/devices/mtd_intel_dg.c:750:15

total: 0 errors, 1 warnings, 0 checks, 25 lines checked


