Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AD7C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6710E7A3;
	Thu,  8 Aug 2024 17:17:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CC610E7A4;
 Thu,  8 Aug 2024 17:17:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Allow_to_compil?=
 =?utf-8?q?e_out_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 17:17:11 -0000
Message-ID: <172313743127.550184.9460917543493023447@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808171121.2484237-1-lucas.demarchi@intel.com>
In-Reply-To: <20240808171121.2484237-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Allow to compile out debugfs
URL   : https://patchwork.freedesktop.org/series/137053/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
be41dd201d01bbf73d9e4ab77e74ab47923582e5
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b1a30c919aaf48cb25e71a03bbb9eaaaa378398
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Aug 8 10:11:21 2024 -0700

    drm/xe: Allow to compile out debugfs
    
    Use a dummy xe_debugfs_register() if debugfs is not enabled and move all
    debugfs-related files under `ifeq ($(CONFIG_DEBUG_FS),y)` in the
    Makefile. This is similar to what was done for display in
    commit 439987f6f471 ("drm/xe: don't build debugfs files when
    CONFIG_DEBUG_FS=n").
    
    This removes the following warning while loading xe with
    CONFIG_DEUBG_FS=n:
    
            xe 0000:03:00.0: [drm] Create GT directory failed
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch b6a72e1d0a6ee0aad5bb0da07b050228c815a5f9 drm-intel
8b1a30c919aa drm/xe: Allow to compile out debugfs


