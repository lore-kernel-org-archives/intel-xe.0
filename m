Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D181C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 17:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C67110E277;
	Thu, 20 Jun 2024 17:08:44 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D49B10E277;
 Thu, 20 Jun 2024 17:08:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/ttm/pool=3A_Revert_to?=
 =?utf-8?q?_clear-on-alloc_to_honor_TTM=5FTT=5FFLAG=5FZERO=5FALLOC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jun 2024 17:08:42 -0000
Message-ID: <171890332238.127624.853297393934058895@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620160147.29819-1-nirmoy.das@intel.com>
In-Reply-To: <20240620160147.29819-1-nirmoy.das@intel.com>
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

Series: drm/ttm/pool: Revert to clear-on-alloc to honor TTM_TT_FLAG_ZERO_ALLOC
URL   : https://patchwork.freedesktop.org/series/135129/
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
commit 25c44f91dde53c66fc50dd2f517ead46f7f48c46
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Thu Jun 20 18:01:47 2024 +0200

    drm/ttm/pool: Revert to clear-on-alloc to honor TTM_TT_FLAG_ZERO_ALLOC
    
    Currently ttm pool is not honoring TTM_TT_FLAG_ZERO_ALLOC flag and
    clearing pages on free. It does help with allocation latency but clearing
    happens even if drm driver doesn't passes the flag. If clear on free
    is needed then a new flag can be added for that purpose.
    
    Cc: Christian Koenig <christian.koenig@amd.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 3fb4b3d5cb3b6320f2235539167fe8e8d4038118 drm-intel
25c44f91dde5 drm/ttm/pool: Revert to clear-on-alloc to honor TTM_TT_FLAG_ZERO_ALLOC


