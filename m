Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E90CED276
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 08:17:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C5010E498;
	Tue,  8 Oct 2024 08:17:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8C910E4AB;
 Tue,  8 Oct 2024 08:17:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_compute_mode_change_refac?=
 =?utf-8?q?toring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 08:17:02 -0000
Message-ID: <172837542277.1202428.13755665365808437084@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
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

Series: compute mode change refactoring
URL   : https://patchwork.freedesktop.org/series/139679/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eb302c906e31646b569e29e4707b1ec161edfad9
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Tue Oct 8 13:06:28 2024 +0530

    drm/xe: Use the filelist from drm for ccs_mode change
    
    Drop the exclusive client count tracking and use the filelist from the
    drm to track the active clients. This also ensures the clients created
    internally by the driver won't block changing the ccs mode.
    
    Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch 131a5dd267541faa13894b97d44af39b257fc887 drm-intel
d8a6bfb947de drm/xe: Set mask bits for CCS_MODE register
eb302c906e31 drm/xe: Use the filelist from drm for ccs_mode change


