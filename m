Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E31C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 23:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF7810EB7D;
	Mon, 25 Mar 2024 23:12:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6CA10EB7D;
 Mon, 25 Mar 2024 23:12:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Remove_expl?=
 =?utf-8?q?icit_shutdown_of_SLPC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 23:12:38 -0000
Message-ID: <171140835884.1038645.16388129322937378492@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240321184924.234579-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/guc: Remove explicit shutdown of SLPC (rev2)
URL   : https://patchwork.freedesktop.org/series/131449/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 268f1a78abf2f90c4692f4e0dd22af9f7c68c0f9
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Mar 21 11:49:24 2024 -0700

    drm/xe/guc: Remove explicit shutdown of SLPC
    
    SLPC shutdown is called in reset and suspend paths. In the reset
    path, it is possible that the H2G call gets lost as GuC is in the
    process of being reset. There is no value in stopping SLPC when
    it will happen anyways.
    
    In the suspend path, we disable communication with GuC, so there
    is no need to explicitly shutdown SLPC.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 4a8fabcf2f1aadbbb777a94edd01549c2aa95caf drm-intel
268f1a78abf2 drm/xe/guc: Remove explicit shutdown of SLPC


