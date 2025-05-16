Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6067CC3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 14:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BEF10EAC6;
	Fri, 16 May 2025 14:03:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7FD10EAC6;
 Fri, 16 May 2025 14:03:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Default_auto=5F?=
 =?utf-8?q?link=5Fdowngrade_status_to_false_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 14:03:47 -0000
Message-ID: <174740422770.88034.897862095668370810@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516124355.4872-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250516124355.4872-1-aradhya.bhatia@intel.com>
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

Series: drm/xe: Default auto_link_downgrade status to false (rev2)
URL   : https://patchwork.freedesktop.org/series/149101/
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
commit dbb92ec25237c3f673c0cbaa46a4456f22efa117
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Fri May 16 12:43:55 2025 +0000

    drm/xe: Default auto_link_downgrade status to false
    
    xe_pcode_read() can return back successfully without updating the
    variable 'val'. This can cause an arbitrary value to show up in the
    sysfs file.
    
    Allow the auto_link_downgrade_status to default to 0 to avoid any
    arbitrary value from coming up.
    
    Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch 6d2dd85ba4eb3df89dc816c03b5bf81a470865b2 drm-intel
dbb92ec25237 drm/xe: Default auto_link_downgrade status to false


