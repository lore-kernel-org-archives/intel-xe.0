Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1EEC7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 10:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A287E10E14C;
	Wed, 12 Apr 2023 10:32:44 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7585110E04D;
 Wed, 12 Apr 2023 10:32:43 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 44200AA3D8;
 Wed, 12 Apr 2023 10:32:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Wed, 12 Apr 2023 10:32:43 -0000
Message-ID: <168129556323.10846.6424709079792418206@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230412082054.3314568-1-lucas.demarchi@intel.com>
In-Reply-To: <20230412082054.3314568-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Dump_+_OOB_workarounds?=
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

Series: Dump + OOB workarounds
URL   : https://patchwork.freedesktop.org/series/116365/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
commit a4df4e15fc962559422803d7b01e5dbe3a16d89e
Author:     Matthew Auld <matthew.auld@intel.com>
AuthorDate: Tue Apr 11 11:04:58 2023 +0100
Commit:     Matthew Auld <matthew.auld@intel.com>
CommitDate: Wed Apr 12 08:47:28 2023 +0100

    drm/xe/mmio: stop incorrectly triggering drm_warn
    
    CI keeps triggering:
    
    xe 0000:03:00.0: [drm] Restricting VRAM size to PCI resource size
    (0x400000000->0x3fa000000)
    
    Due to usable_size vs vram_size differences. However, we only want to
    trigger the drm_warn() to let developers know that the system they are
    using is going clamp the VRAM size to match the IO size, where they can
    likely only use 256M of VRAM. Once we properly support small-bar we can
    revisit this.
    
    v2 (Lucas): Drop the TODO for now
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
=== git am output follows ===
Applying: drm/xe: Add debugfs to dump all known workarounds
Applying: drm/xe: Register OOB workarounds


