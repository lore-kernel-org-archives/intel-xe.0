Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8D8C0218C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 00:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2079410E31D;
	Thu, 23 Jan 2025 00:03:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F8D10E0BD;
 Thu, 23 Jan 2025 00:02:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re-instate_GuC_logs_in_de?=
 =?utf-8?q?bugfs_=26_devcoredump_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 00:02:45 -0000
Message-ID: <173759056592.3226643.8387639605891865547@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122233305.3667730-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250122233305.3667730-1-John.C.Harrison@Intel.com>
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

Series: Re-instate GuC logs in debugfs & devcoredump (rev2)
URL   : https://patchwork.freedesktop.org/series/143864/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 13ee431c00c706be3e19ed9111ee8aad28046592
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed Jan 22 15:33:04 2025 -0800

    Partially revert "drm/xe: Revert some changes that break a mesa debug tool"
    
    This reverts part of:
      commit a53da2fb25a3 ("drm/xe: Revert some changes that break a mesa
      debug tool")
    
    The KMD has been updated to avoid the line wrapping issue of the mesa
    tool. The section heading issue has not been fixed yet, however. So
    that part of the original revert remains.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch db7cf8d52a41001ea2780cf834fed3dc490343d2 drm-intel
ef8492c5cb6f drm/xe/guc: Explicitly name each chunk of GuC log data in a dump
854286f5f20c drm/xe/devcoredump: Temporarily disable the line wrapping of ASCII85 output
13ee431c00c7 Partially revert "drm/xe: Revert some changes that break a mesa debug tool"


