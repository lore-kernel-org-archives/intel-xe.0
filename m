Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788BBC78853
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 14:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437FF10E121;
	Fri, 20 Sep 2024 14:43:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1E10E121;
 Fri, 20 Sep 2024 14:43:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_10/12=5D_drm/xe/guc=3A_Ad?=
 =?utf-8?q?d_GuC_log_to_devcoredump_captures?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 14:43:35 -0000
Message-ID: <172684341591.1051253.797351872046338199@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920140646.618008-1-badal.nilawar@intel.com>
In-Reply-To: <20240920140646.618008-1-badal.nilawar@intel.com>
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

Series: 10/12] drm/xe/guc: Add GuC log to devcoredump captures
URL   : https://patchwork.freedesktop.org/series/138926/
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
commit 14cb36be1713066ab82d6e9742e0765620a6a42c
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Fri Sep 20 19:36:35 2024 +0530

    01/12] drm/xe/guc: Remove spurious line feed in debug print
    
    Including line feeds at the start of a debug print messes up the
    output when sent to dmesg. The break appears between all the useful
    prefix information and the actual string being printed. In this case,
    each block of data has a very clear start line and an extra delimeter
    is really not necessary. So don't do it.
    
    v2: Fix typo in commit message (review feedback from Michal W.)
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 128ccc5f71d7b9d84ce8f0651aa713ae490f4990 drm-intel
14cb36be1713 01/12] drm/xe/guc: Remove spurious line feed in debug print


