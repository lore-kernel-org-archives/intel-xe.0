Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08116C35274
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 03:36:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB25E10E17A;
	Tue, 19 Dec 2023 03:36:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0EF110E17A;
 Tue, 19 Dec 2023 03:36:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CD41EAA915;
 Tue, 19 Dec 2023 03:36:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Ensure_=27passe?=
 =?utf-8?q?d=27_variable_is_always_initialized?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 19 Dec 2023 03:36:23 -0000
Message-ID: <170295698383.17582.3261720442208522819@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231218163818.1700983-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231218163818.1700983-1-rodrigo.vivi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Ensure 'passed' variable is always initialized
URL   : https://patchwork.freedesktop.org/series/127934/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b4c258acb227c662cdaa91476aff6294ded2c49e
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Dec 18 11:38:18 2023 -0500

    drm/xe: Ensure 'passed' variable is always initialized
    
    Although the path should be impossible, some static analyzers
    and compilers might not like the fact that there is a path
    where 'passed' variable is not initialized.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
    Fixes: ad7d86415578 ("drm/xe: Enable W=1 warnings by default")
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 84e5d706cb0c11f2948a9f16d9e31ad5256b641c drm-intel
b4c258acb drm/xe: Ensure 'passed' variable is always initialized
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'ad7d86415578', maybe rebased or not pulled?
#12: 
Fixes: ad7d86415578 ("drm/xe: Enable W=1 warnings by default")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


