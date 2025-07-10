Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6FCC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 23:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A1210E22F;
	Thu, 10 Jul 2025 23:44:02 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AE210E22F;
 Thu, 10 Jul 2025 23:44:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/migrate=3A_Fix_ali?=
 =?utf-8?q?gnment_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 23:44:01 -0000
Message-ID: <175219104140.152021.12183534873770039063@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710-migrate-aligned-v1-1-44003ef3c078@intel.com>
In-Reply-To: <20250710-migrate-aligned-v1-1-44003ef3c078@intel.com>
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

Series: drm/xe/migrate: Fix alignment check
URL   : https://patchwork.freedesktop.org/series/151470/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
43254c2aa575037fc031c7ac21b0d031c700b2bf
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 68c0b1df8834a34d4ea4970a5200a53b0358bf95
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Jul 10 14:34:41 2025 -0700

    drm/xe/migrate: Fix alignment check
    
    The check would fail if the address is unaligned, but not when
    accounting the offset. Instead of `buf | offset` it should have
    been `buf + offset`. To make it more readable and also drop the
    uintptr_t, just use the IS_ALIGNED() macro.
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch bab85d5087ee37f0f268e0a0fb307378a168fe6e drm-intel
68c0b1df8834 drm/xe/migrate: Fix alignment check
-:26: ERROR:CODE_INDENT: code indent should use tabs where possible
#26: FILE: drivers/gpu/drm/xe/xe_migrate.c:1820:
+        if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||$

-:26: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#26: FILE: drivers/gpu/drm/xe/xe_migrate.c:1820:
+        if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||$

-:27: ERROR:CODE_INDENT: code indent should use tabs where possible
#27: FILE: drivers/gpu/drm/xe/xe_migrate.c:1821:
+            !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {$

-:27: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#27: FILE: drivers/gpu/drm/xe/xe_migrate.c:1821:
+            !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {$

total: 2 errors, 2 warnings, 0 checks, 10 lines checked


