Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA346C61D97
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 22:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EF810E28A;
	Tue, 21 Nov 2023 22:06:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E889E10E101;
 Tue, 21 Nov 2023 22:06:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E5CBEAADE8;
 Tue, 21 Nov 2023 22:06:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Tue, 21 Nov 2023 22:06:54 -0000
Message-ID: <170060441493.30159.12698808036753706059@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231022155727.717251-1-kelbaz@habana.ai>
In-Reply-To: <20231022155727.717251-1-kelbaz@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5Bv2=2C1/2=5D_drm/xe=3A_add_skip=5Fpcode_fl?=
 =?utf-8?b?YWcgKHJldjQp?=
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

Series: series starting with [v2,1/2] drm/xe: add skip_pcode flag (rev4)
URL   : https://patchwork.freedesktop.org/series/125426/
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
commit cb2dc1ea80c03577b8e0496f22b6bd5e744cc2e5
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Sun Oct 22 18:57:27 2023 +0300

    drm/xe: rename bypass_mtcfg to skip_mtcfg
    
    Per device, set this flag to access the MTCFG register or to skip it.
    This is done to standardise Xe driver naming if an access to any HW
    should be avoided.
    
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 89e2bb1e155242dd9aa46bc90e563e71c5f498b0 drm-intel
0388cae83 drm/xe: add skip_pcode flag
cb2dc1ea8 drm/xe: rename bypass_mtcfg to skip_mtcfg


