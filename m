Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A19CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 14:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2202410EC20;
	Fri, 17 Oct 2025 14:17:02 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED2110EC20;
 Fri, 17 Oct 2025 14:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/migrate=3A_Atomici?=
 =?utf-8?q?ze_CCS_copy_command_setup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 14:17:00 -0000
Message-ID: <176071062097.27663.16201427539943398817@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
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

Series: drm/xe/migrate: Atomicize CCS copy command setup
URL   : https://patchwork.freedesktop.org/series/156128/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 59e7b6b2b86b49601b0669f0facb308371b1e7cc
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Fri Oct 17 19:42:30 2025 +0530

    drm/xe/vf: Clear CCS read/write buffers in atomic way
    
    Clear the contents of the CCS read/write batch buffer, ensuring no page
    faults / GPU hang occur if migration happens midway.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch c809fdcf60b85e8a261eaa1b49f18b9c5731b18c drm-intel
b68b94ce1e47 drm/xe/migrate: Atomicize CCS copy command setup
-:33: WARNING:INCLUDE_LINUX: Use #include <linux/cpufeature.h> instead of <asm/cpufeature.h>
#33: FILE: drivers/gpu/drm/xe/xe_migrate.c:9:
+#include <asm/cpufeature.h>

total: 0 errors, 1 warnings, 0 checks, 179 lines checked
6de49bc1b74b drm/xe/migrate: Make emit_pte() header write atomic
59e7b6b2b86b drm/xe/vf: Clear CCS read/write buffers in atomic way


