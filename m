Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE274C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 10:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA2810E099;
	Thu,  8 Aug 2024 10:29:21 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EBF10E099;
 Thu,  8 Aug 2024 10:29:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/xe/gt=3A_Add_APIs_for_printing_stats_over_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 10:29:20 -0000
Message-ID: <172311296053.549353.5623855628915977831@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808091917.5761-1-nirmoy.das@intel.com>
In-Reply-To: <20240808091917.5761-1-nirmoy.das@intel.com>
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

Series: series starting with [v3,1/2] drm/xe/gt: Add APIs for printing stats over debugfs
URL   : https://patchwork.freedesktop.org/series/137032/
State : warning

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
commit bcddb5f2ec758c8df7852e3ce4077f4f08094a09
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Aug 8 11:19:15 2024 +0200

    drm/xe: Add stats for tlb invalidation count
    
    Add stats for tlb invalidation count which can be viewed with per GT
    stat debugfs file.
    
    Example output:
    cat /sys/kernel/debug/dri/0/gt0/stats
    tlb_inval_count: 22
    
    v2: fix #include order(Tejas)
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch b6a72e1d0a6ee0aad5bb0da07b050228c815a5f9 drm-intel
471f915625a8 drm/xe/gt: Add APIs for printing stats over debugfs
-:56: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#56: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 123 lines checked
bcddb5f2ec75 drm/xe: Add stats for tlb invalidation count


