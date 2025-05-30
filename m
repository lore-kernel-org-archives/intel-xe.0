Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1C9C5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 17:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B83510E815;
	Fri, 30 May 2025 17:41:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5528510E815;
 Fri, 30 May 2025 17:41:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Small_fixes_and?=
 =?utf-8?q?_cleanups_for_PXP_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 17:41:51 -0000
Message-ID: <174862691134.36039.9183271910669862798@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: Small fixes and cleanups for PXP (rev4)
URL   : https://patchwork.freedesktop.org/series/149211/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bf99a571872ffd7ecc2fd102d845e395451a4946
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Thu May 22 15:54:05 2025 -0700

    drm/xe/pxp: Decouple queue addition from PXP start
    
    Starting PXP and adding a queue to the PXP queue list are separate
    actions. Given that a queue can only be added to the list if PXP is
    active, the 2 actions were bundled together to avoid having to
    re-lock and re-check the status to perform the queue addition after
    having done so during the PXP start. However, we don't save a lot of
    complexity by doing so and we lose in clarity of code, so overall it's
    cleaner to just keep the 2 actions separate.
    
    v2: remove leftover rpm_get (John), fix rpm_put in error case
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 52afe38ad6f8eccc238956b78e04977dded23411 drm-intel
4eea1aae691f drm/xe/pxp: Use the correct define in the set_property_funcs array
6b31bbe7d7e0 drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready
bf99a571872f drm/xe/pxp: Decouple queue addition from PXP start


