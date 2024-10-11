Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E503D1A427
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 22:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480C110E2F0;
	Fri, 11 Oct 2024 22:33:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B914610E2F0;
 Fri, 11 Oct 2024 22:33:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_enable_lite_res?=
 =?utf-8?q?tore_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 22:33:31 -0000
Message-ID: <172868601175.1242364.2602638691560564113@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241010173142.425498-1-fei.yang@intel.com>
In-Reply-To: <20241010173142.425498-1-fei.yang@intel.com>
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

Series: drm/xe: enable lite restore (rev3)
URL   : https://patchwork.freedesktop.org/series/139734/
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
commit 4e4e132caf7cd99892921a19903ec7efd87d06aa
Author: Fei Yang <fei.yang@intel.com>
Date:   Thu Oct 10 10:31:42 2024 -0700

    drm/xe: enable lite restore
    
    The lite restore feature is supposed to be enabled by default.
    
    Signed-off-by: Fei Yang <fei.yang@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 61340a18d54c2b756e7f1a0010abc4c08e8dade3 drm-intel
4e4e132caf7c drm/xe: enable lite restore


