Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8001EC54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 05:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D4910EBF3;
	Thu,  7 Mar 2024 05:02:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E4D10EBF3;
 Thu,  7 Mar 2024 05:02:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gsc=3A_Fix_kernel_?=
 =?utf-8?q?doc_for_xe=5Fgsc=5Fcreate=5Fhost=5Fsession=5Fid?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 05:02:39 -0000
Message-ID: <170978775973.580334.5156364567646391895@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240307045533.1867892-2-suraj.kandpal@intel.com>
In-Reply-To: <20240307045533.1867892-2-suraj.kandpal@intel.com>
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

Series: drm/xe/gsc: Fix kernel doc for xe_gsc_create_host_session_id
URL   : https://patchwork.freedesktop.org/series/130846/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fadc32df0c4e4c923eaf0298a339841c043835e5
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Thu Mar 7 10:25:34 2024 +0530

    drm/xe/gsc: Fix kernel doc for xe_gsc_create_host_session_id
    
    Fix documentation for xe_gsc_create_host_session_id which
    was xe_gsc_get_host_session_id.
    
    Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch c9b9b8d4449209d2451127f98cdfe2b99bec3da7 drm-intel
fadc32df0c4e drm/xe/gsc: Fix kernel doc for xe_gsc_create_host_session_id


