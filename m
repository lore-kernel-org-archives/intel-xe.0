Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BF3C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 05:17:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E53910E585;
	Fri, 16 Aug 2024 05:17:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600CB10E585;
 Fri, 16 Aug 2024 05:17:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_for=5Feach?=
 =?utf-8?q?=5Fremote=5Ftile_rather_than_manual_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 05:17:42 -0000
Message-ID: <172378546238.653293.1281918754158489847@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816040208.62695-1-matthew.brost@intel.com>
In-Reply-To: <20240816040208.62695-1-matthew.brost@intel.com>
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

Series: drm/xe: Use for_each_remote_tile rather than manual check
URL   : https://patchwork.freedesktop.org/series/137366/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e0db31b47b2c57dbda4d39d12fb9aad64ae61858
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Aug 15 21:02:08 2024 -0700

    drm/xe: Use for_each_remote_tile rather than manual check
    
    Replace for_each_tile plus a check against primary tile with
    for_each_remote_tile in tiles_fini. The latter macro does this for us.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a drm-intel
e0db31b47b2c drm/xe: Use for_each_remote_tile rather than manual check


