Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEE6C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 22:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B560F10E9E0;
	Wed, 26 Jun 2024 22:38:16 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20BA10E9D4;
 Wed, 26 Jun 2024 22:38:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/mocs=3A_Check_that?=
 =?utf-8?q?_MOCS_table=2Eops_is_assigned?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 22:38:14 -0000
Message-ID: <171944149498.163034.278565810614918097@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626211256.1620889-2-matthew.d.roper@intel.com>
In-Reply-To: <20240626211256.1620889-2-matthew.d.roper@intel.com>
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

Series: drm/xe/mocs: Check that MOCS table.ops is assigned
URL   : https://patchwork.freedesktop.org/series/135453/
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
commit bc9709d2360b5dc42c96a24ef48a70f58dc74d47
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Jun 26 14:12:57 2024 -0700

    drm/xe/mocs: Check that MOCS table.ops is assigned
    
    When MOCS debugfs dumping was added in commit 9fbd0adbcbe8
    ("drm/xe/mocs: Add debugfs node to dump mocs"), a sanity check was added
    to xe_mocs_dump() to ensure table.ops->dump is not a NULL pointer.  The
    more common programmer mistake when adding MOCS enablement for new
    platforms is to simply forget to assign anything to table.ops
    altogether.  Extend the check to also cover a NULL table.ops and add a
    WARN() so that CI will help us catch these mistakes when new platforms
    are enabled in the future.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 6580bd2882edc6ea84200f2968d3d12b69b3ce40 drm-intel
bc9709d2360b drm/xe/mocs: Check that MOCS table.ops is assigned


