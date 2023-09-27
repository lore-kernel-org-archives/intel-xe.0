Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75548E810AD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 08:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D7510E4AE;
	Wed, 27 Sep 2023 08:51:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 65D6110E4AE;
 Wed, 27 Sep 2023 08:51:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6681CAADDD;
 Wed, 27 Sep 2023 08:51:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Date: Wed, 27 Sep 2023 08:51:16 -0000
Message-ID: <169580467641.20755.10369545006266407795@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230927074607.3027012-1-andrzej.hajda@intel.com>
In-Reply-To: <20230927074607.3027012-1-andrzej.hajda@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_implement_driver_initiated_functional_reset?=
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

Series: drm/xe: implement driver initiated functional reset
URL   : https://patchwork.freedesktop.org/series/124313/
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
commit 3e1c588bb83e3dfe1fa999c646c943f3b4ad4b3b
Author: Andrzej Hajda <andrzej.hajda@intel.com>
Date:   Wed Sep 27 09:46:07 2023 +0200

    drm/xe: implement driver initiated functional reset
    
    Driver initiated functional reset (FLR) is the highest level of reset
    that we can trigger from within the driver. In contrast to PCI FLR it
    doesn't require re-enumeration of PCI BAR. It can be useful in case
    GT fails to reset. It is also the only way to trigger GSC reset from
    the driver and can be used in future addition of GSC support.
    
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
3e1c588bb drm/xe: implement driver initiated functional reset


