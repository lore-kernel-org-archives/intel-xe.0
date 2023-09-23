Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2F7CE7A8C
	for <intel-xe@archiver.kernel.org>; Sat, 23 Sep 2023 07:53:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3270210E0A3;
	Sat, 23 Sep 2023 07:53:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E621710E09F;
 Sat, 23 Sep 2023 07:53:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D78B9A0003;
 Sat, 23 Sep 2023 07:53:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Date: Sat, 23 Sep 2023 07:53:20 -0000
Message-ID: <169545560087.3504.511994709164048565@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230922115122.305107-1-juhapekka.heikkila@gmail.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_En?=
 =?utf-8?q?able_remapped_display_page_table_on_Xe_=28rev3=29?=
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

Series: Enable remapped display page table on Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/124108/
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
commit f27f04fbdd053d56153deb6c4b0854f40a1addc9
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Fri Sep 22 14:51:22 2023 +0300

    drm/xe/display: Don't try to use vram if not available
    
    Trying to get bo from vram when vram not available will cause
    WARN_ON() hence avoid touching vram if not available.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 16e2c940ef53f81b2c68e16ec39cf5772894a625 drm-intel
7518c2742 drm/xe/display: Add writing of remapped dpt
80a9cee1a drm/xe/display: Enable remapped display page tables
f27f04fbd drm/xe/display: Don't try to use vram if not available


