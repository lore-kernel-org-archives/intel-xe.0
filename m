Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0D1C2D0CD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 00:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0024310E047;
	Tue, 20 May 2025 00:44:51 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8419910E047;
 Tue, 20 May 2025 00:44:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Small_fixes_and?=
 =?utf-8?q?_cleanups_for_PXP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 May 2025 00:44:50 -0000
Message-ID: <174770189052.2496.2971511803604019935@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
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

Series: drm/xe: Small fixes and cleanups for PXP
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
commit 46b1a8627b301b28f6288ceb904784a2ba3763d3
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Mon May 19 16:32:32 2025 -0700

    drm/xe/pxp: Decouple queue addition from PXP start
    
    Starting PXP and adding a queue to the PXP queue list are separate
    actions. Given that a queue can only be added to the list if PXP is
    active, the 2 actions were bundled together to avoid having to
    re-lock and re-check the status to perform the queue addition after
    having done so during the PXP start. However, we don't save a lot of
    complexity by doing so and we lose in clarity of code, so overall it's
    cleaner to just keep the 2 actions separate.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 956a742459cff150a14f1d2f44b6294e646f208a drm-intel
211cc1937f17 drm/xe/pxp: Use the correct define in the set_property_funcs array
6757e0b36046 drm/xe/pxp: Clarify PXP queue creation behavior if PXP is not ready
46b1a8627b30 drm/xe/pxp: Decouple queue addition from PXP start


