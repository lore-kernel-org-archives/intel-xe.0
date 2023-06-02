Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F693C7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 23:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF77D10E0DA;
	Fri,  2 Jun 2023 23:57:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B77B510E10D;
 Fri,  2 Jun 2023 23:57:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B1531AADF8;
 Fri,  2 Jun 2023 23:57:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Fri, 02 Jun 2023 23:57:32 -0000
Message-ID: <168575025272.15698.899162345410534907@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230602235210.1314028-1-matthew.d.roper@intel.com>
In-Reply-To: <20230602235210.1314028-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/xe=3A_Reformat_xe=5Fguc=5Fregs?=
 =?utf-8?q?=2Eh?=
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

Series: series starting with [1/3] drm/xe: Reformat xe_guc_regs.h
URL   : https://patchwork.freedesktop.org/series/118808/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 71089db6effb17e98184d8c5b18b9f61556ae5ec
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Fri Jun 2 16:52:10 2023 -0700

    drm/xe: Don't hardcode GuC's MOCS index in register header
    
    Although PVC is currently the only platform that needs us to program a
    GuC register with the index of an uncached MOCS entry, it's likely other
    platforms will need this in the future.  Rather than hardcoding PVC's
    index into the register header, we should just pull the appropriate
    index from gt->mocs.uc_index to future-proof the code.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch ef153c77d25ffd86b074190b77f9f561b9a5a909 drm-intel
d7ba1e4e4 drm/xe: Reformat xe_guc_regs.h
f0f85dc84 drm/xe: Initialize MOCS earlier
71089db6e drm/xe: Don't hardcode GuC's MOCS index in register header


