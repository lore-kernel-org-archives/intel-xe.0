Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E32CC6FD19
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 18:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D39D10E2AC;
	Thu, 16 Mar 2023 18:32:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 942BC10E29B;
 Thu, 16 Mar 2023 18:32:36 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 66140AA917;
 Thu, 16 Mar 2023 18:32:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 16 Mar 2023 18:32:36 -0000
Message-ID: <167899155637.19094.16871102546286668624@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230316182951.3441696-1-lucas.demarchi@intel.com>
In-Reply-To: <20230316182951.3441696-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_fixup!_drm/xe=3A_Introduce_a_new_DRM_driver_for_Intel_GPUs?=
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

Series: fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
URL   : https://patchwork.freedesktop.org/series/115290/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit 68c0f7421b74cf51fe442bed6d4395d28ded5d7d
Author:     Thomas Hellström <thomas.hellstrom@linux.intel.com>
AuthorDate: Tue Mar 14 15:56:44 2023 +0100
Commit:     Thomas Hellström <thomas.hellstrom@linux.intel.com>
CommitDate: Thu Mar 16 15:16:00 2023 +0100

    drm/xe/vm: Defer vm rebind until next exec if nothing to execute
    
    If all compute engines of a vm in compute mode are idle,
    defer a rebind to the next exec to avoid the VM unnecessarily trying
    to make memory resident and compete with other VMs for available
    memory space.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
=== git am output follows ===
Applying: fixup! drm/xe: Introduce a new DRM driver for Intel GPUs


