Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25D6C27C77
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 05:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5587F10EC31;
	Fri, 14 Jun 2024 05:57:15 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAE210EC33;
 Fri, 14 Jun 2024 05:57:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Explicitly_cast?=
 =?utf-8?q?_to_u64_to_avoid_overflow?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 05:57:11 -0000
Message-ID: <171834463169.77190.13206854261047582307@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614051556.255455-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240614051556.255455-1-zbigniew.kempczynski@intel.com>
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

Series: drm/xe: Explicitly cast to u64 to avoid overflow
URL   : https://patchwork.freedesktop.org/series/134869/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 774a938a9e0598410ee5c399971de5b4fd77732f
Author: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Date:   Fri Jun 14 07:15:56 2024 +0200

    drm/xe: Explicitly cast to u64 to avoid overflow
    
    Without casting whole expression will be calculated on u32 what
    means adding U32_MAX effectively decreases the result by one due to
    overflow. Fix this and use explicit cast to u64.
    
    Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a88e8dc2c59464cac89137471031d736a408652f drm-intel
774a938a9e05 drm/xe: Explicitly cast to u64 to avoid overflow
-:26: CHECK:SPACING: No space is necessary after a cast
#26: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:970:
+		diff = (u64) ctx_timestamp + U32_MAX - ctx_job_timestamp;

total: 0 errors, 0 warnings, 1 checks, 8 lines checked


