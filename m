Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0697BCE7AA8
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 10:13:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98C010EA27;
	Fri, 14 Nov 2025 10:13:00 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4E010EA27;
 Fri, 14 Nov 2025 10:12:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Drop_the_VF_?=
 =?utf-8?q?VRAM_BO_reference_on_successful_restore?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Nov 2025 10:12:59 -0000
Message-ID: <176311517950.55315.6873018133364807470@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251114100713.1776073-1-michal.winiarski@intel.com>
In-Reply-To: <20251114100713.1776073-1-michal.winiarski@intel.com>
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

Series: drm/xe/pf: Drop the VF VRAM BO reference on successful restore
URL   : https://patchwork.freedesktop.org/series/157572/
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
commit 003e4992f036c55c853aeadade51bd1ec879db29
Author: Michał Winiarski <michal.winiarski@intel.com>
Date:   Fri Nov 14 11:07:13 2025 +0100

    drm/xe/pf: Drop the VF VRAM BO reference on successful restore
    
    The reference is only dropped on error. Fix it by adding the missing
    xe_bo_put().
    
    Fixes: 49cf1b9b609fe ("drm/xe/pf: Handle VRAM migration data as part of PF control")
    Reported-by: Adam Miszczak <adam.miszczak@linux.intel.com>
    Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch fcced1dc80e617aa10794e4abc525895212e3678 drm-intel
003e4992f036 drm/xe/pf: Drop the VF VRAM BO reference on successful restore
-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#14: 
Reported-by: Adam Miszczak <adam.miszczak@linux.intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


