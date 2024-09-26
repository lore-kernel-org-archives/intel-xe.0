Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE1DCDE017
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 16:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1BD10EB92;
	Thu, 26 Sep 2024 16:07:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F03F10EB92;
 Thu, 26 Sep 2024 16:07:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Restore_GT_freq?=
 =?utf-8?q?_on_GSC_load_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 16:07:02 -0000
Message-ID: <172736682205.1107989.15457066951256414468@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe: Restore GT freq on GSC load error
URL   : https://patchwork.freedesktop.org/series/139119/
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
commit 1cff4e780439789075544e217f23cc05aa670415
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Wed Sep 25 13:49:18 2024 -0700

    drm/xe: Restore GT freq on GSC load error
    
    As part of a Wa_22019338487, ensure that GT freq is restored
    even when GSC reload is not successful.
    
    Fixes: 3b1592fb7835 ("drm/xe/lnl: Apply Wa_22019338487")
    
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch ec87b409d3a9358c9a079186d528fad3f7d64334 drm-intel
1cff4e780439 drm/xe: Restore GT freq on GSC load error


