Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3001CE7F12C
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 21:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFD110E436;
	Tue, 26 Sep 2023 21:23:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8414110E436;
 Tue, 26 Sep 2023 21:23:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8735DAADF4;
 Tue, 26 Sep 2023 21:23:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Date: Tue, 26 Sep 2023 21:23:35 -0000
Message-ID: <169576341555.20980.7720472541192733256@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926212056.40881-1-stuart.summers@intel.com>
In-Reply-To: <20230926212056.40881-1-stuart.summers@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_drm/xe=3A_Print_devcoredump_to_drm?=
 =?utf-8?q?=5Finfo?=
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

Series: series starting with [1/2] drm/xe: Print devcoredump to drm_info
URL   : https://patchwork.freedesktop.org/series/124298/
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
commit 42f4543243fbf6d858a30d6a7cf3fec38811ced1
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Tue Sep 26 21:20:56 2023 +0000

    drm/xe: Add coredump to wa_bb timeouts
    
    We're seeing some hangs during driver load on some platforms
    in CI which are hard to catch manually. As such, add the dump
    at the time of the hang.
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
3bb6cc84c drm/xe: Print devcoredump to drm_info
42f454324 drm/xe: Add coredump to wa_bb timeouts


