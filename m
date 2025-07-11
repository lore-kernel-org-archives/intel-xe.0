Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FB4C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2271110EAA5;
	Fri, 11 Jul 2025 16:52:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56AD10EA9E;
 Fri, 11 Jul 2025 16:52:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/migrate=3A_Fix_ali?=
 =?utf-8?q?gnment_check_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Jul 2025 16:52:25 -0000
Message-ID: <175225274586.155282.2240834780939778510@1538d3639d33>
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

Series: drm/xe/migrate: Fix alignment check (rev2)
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
commit 765e60776c687b0f647ed48abcf6f5ef61f78c8c
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
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch d415c0716821abca694e8a93e74cc71b4a9b6522 drm-intel
765e60776c68 drm/xe/migrate: Fix alignment check
-:27: ERROR:CODE_INDENT: code indent should use tabs where possible
#27: FILE: drivers/gpu/drm/xe/xe_migrate.c:1820:
+        if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||$

-:27: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#27: FILE: drivers/gpu/drm/xe/xe_migrate.c:1820:
+        if (!IS_ALIGNED(len, XE_CACHELINE_BYTES) ||$

-:28: ERROR:CODE_INDENT: code indent should use tabs where possible
#28: FILE: drivers/gpu/drm/xe/xe_migrate.c:1821:
+            !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {$

-:28: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#28: FILE: drivers/gpu/drm/xe/xe_migrate.c:1821:
+            !IS_ALIGNED((unsigned long)buf + offset, XE_CACHELINE_BYTES)) {$

total: 2 errors, 2 warnings, 0 checks, 10 lines checked


