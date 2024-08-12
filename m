Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C6EC3DA7F
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 17:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C595410E25A;
	Mon, 12 Aug 2024 17:32:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1F810E25A;
 Mon, 12 Aug 2024 17:32:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/migrate=3A_Paramet?=
 =?utf-8?q?erize_ccs_and_bo_data_clear_in_xe=5Fmigrate=5Fclear=28=29_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 17:32:50 -0000
Message-ID: <172348397025.595755.7812412433566396245@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809220347.25330-1-nirmoy.das@intel.com>
In-Reply-To: <20240809220347.25330-1-nirmoy.das@intel.com>
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

Series: drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear() (rev3)
URL   : https://patchwork.freedesktop.org/series/137107/
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
commit b9245148d2c136950ffb709e874eefba31ce772f
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Sat Aug 10 00:03:47 2024 +0200

    drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()
    
    Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
    layers can utilize. This patch will be used later on when doing bo data
    clear for igfx as well.
    
    v2: Replace multiple params with flags in xe_migrate_clear (Matt B)
    v3: s/CLEAR_BO_DATA_FLAG_*/XE_MIGRATE_CLEAR_FLAG_* and move to
        xe_migrate.h. other nits(Matt B)
    
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 4f95bd933f4dacd22752bf8d6e548e8cc445d093 drm-intel
b9245148d2c1 drm/xe/migrate: Parameterize ccs and bo data clear in xe_migrate_clear()


