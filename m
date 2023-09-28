Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFD4E732D0
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 13:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572DC10E65E;
	Thu, 28 Sep 2023 13:51:27 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48B2310E65E;
 Thu, 28 Sep 2023 13:51:25 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 475ABA0BA8;
 Thu, 28 Sep 2023 13:51:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Thu, 28 Sep 2023 13:51:25 -0000
Message-ID: <169590908528.21266.12269409871753283575@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230928134816.881379-1-david.kershner@intel.com>
In-Reply-To: <20230928134816.881379-1-david.kershner@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/xe=5Fmigrate=2Ec=3A_Use_DPA_offset_for_page_table_entries?=
 =?utf-8?q?=2E?=
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

Series: drm/xe/xe_migrate.c: Use DPA offset for page table entries.
URL   : https://patchwork.freedesktop.org/series/124404/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 926631d5598b07ce0c5e9467a7265149c9d72496
Author: David Kershner <david.kershner@intel.com>
Date:   Thu Sep 28 09:48:16 2023 -0400

    drm/xe/xe_migrate.c: Use DPA offset for page table entries.
    
    Device Physical Address (DPA) is the starting offset device memory.
    
    Update xe_migrate identity map base PTE entries to start at dpa_base
    instead of 0.
    
    The VM offset value should be 0 relative instead of DPA relative.
    
    Signed-off-by: David Kershner <david.kershner@intel.com>
+ /mt/dim checkpatch 7c58b58522cf124dd324fbf95d9dd838fac36bcb drm-intel
926631d55 drm/xe/xe_migrate.c: Use DPA offset for page table entries.


