Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66BDC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEB1113BD6;
	Thu, 18 Apr 2024 14:16:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4B8113BD6;
 Thu, 18 Apr 2024 14:15:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_allow_unaligned?=
 =?utf-8?q?_start_and_size_xe=5Fres=5Fcursor_parameters?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Apr 2024 14:15:59 -0000
Message-ID: <171344975904.1501116.4937398327710994647@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
In-Reply-To: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
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

Series: drm/xe: allow unaligned start and size xe_res_cursor parameters
URL   : https://patchwork.freedesktop.org/series/132605/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d15bddd87a7fe4e3cdc1e203dec1cd06a84257ed
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Thu Apr 18 16:03:37 2024 +0200

    drm/xe: allow unaligned start and size xe_res_cursor parameters
    
    xe_res_cursor code does not depend on the alignment. On the other side
    unaligned accesses are useful from pread/pwrite point of view.
    
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
+ /mt/dim checkpatch 4eddedf2b31be4f2280a7c42966eaf9b6cb251a8 drm-intel
d15bddd87a7f drm/xe: allow unaligned start and size xe_res_cursor parameters


