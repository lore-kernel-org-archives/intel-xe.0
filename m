Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13F2C27C7B
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 07:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5968310EC74;
	Fri, 14 Jun 2024 07:29:18 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC9B10EC74;
 Fri, 14 Jun 2024 07:29:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Explicitly_cast?=
 =?utf-8?q?_to_u64_to_avoid_overflow_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 07:29:12 -0000
Message-ID: <171835015284.77189.3167957515288562669@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614062415.260340-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240614062415.260340-1-zbigniew.kempczynski@intel.com>
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

Series: drm/xe: Explicitly cast to u64 to avoid overflow (rev2)
URL   : https://patchwork.freedesktop.org/series/134869/
State : success

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
commit 94f43eeec24c07bb7154ba507762e25d6fbce14e
Author: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Date:   Fri Jun 14 08:24:15 2024 +0200

    drm/xe: Explicitly cast to u64 to avoid overflow
    
    Without casting whole expression will be calculated on u32 what
    means adding U32_MAX effectively decreases the result by one due to
    overflow. Fix this and use explicit cast to u64.
    
    Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 2749e3ede81bebc181cc2271e01d2b15c41aba83 drm-intel
94f43eeec24c drm/xe: Explicitly cast to u64 to avoid overflow


