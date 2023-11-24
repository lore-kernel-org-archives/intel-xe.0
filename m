Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCB4C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 19:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A5A10E380;
	Fri, 24 Nov 2023 19:07:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C43610E380;
 Fri, 24 Nov 2023 19:07:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3A112A47DF;
 Fri, 24 Nov 2023 19:07:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Fri, 24 Nov 2023 19:07:28 -0000
Message-ID: <170085284823.13022.1732785320501214748@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231124170830.398517-2-matthew.auld@intel.com>
In-Reply-To: <20231124170830.398517-2-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_fix_mem=5Faccess_for_early_lrc_generation?=
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

Series: drm/xe: fix mem_access for early lrc generation
URL   : https://patchwork.freedesktop.org/series/126882/
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
commit 89abb50977a8aca80b35ed57d3aafc219e0ff5b5
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Nov 24 17:08:31 2023 +0000

    drm/xe: fix mem_access for early lrc generation
    
    We spawn some hw queues during device probe to generate the default LRC
    for every engine type, however the queue destruction step is typically
    async. Queue destruction needs to do stuff like GuC context deregister
    which requires GuC CT, which in turn requires an active mem_access ref.
    The caller during probe is meant to hold the mem_access token, however
    due to the async destruction it might have already been dropped if we
    are unlucky.
    
    Similar to how we already handle migrate VMs for which there is no
    mem_access ref, fix this by keeping the callers token alive, releasing
    it only when destroying the queue. We can treat a NULL vm as indication
    that we need to grab our own extra ref.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 1832821c7e4c5bd24353183f060f1435b2eb7992 drm-intel
89abb5097 drm/xe: fix mem_access for early lrc generation


