Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D5CC07545
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 22:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC42F10E4ED;
	Tue, 24 Oct 2023 22:52:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDAD310E4ED;
 Tue, 24 Oct 2023 22:52:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DC2BCA882E;
 Tue, 24 Oct 2023 22:52:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 24 Oct 2023 22:52:07 -0000
Message-ID: <169818792789.18361.14330717738104003096@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231024220739.224251-1-lucas.demarchi@intel.com>
In-Reply-To: <20231024220739.224251-1-lucas.demarchi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5Bv2=2C1/3=5D_drm/xe/xe2=3A_Add_initial_wor?=
 =?utf-8?q?karounds?=
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

Series: series starting with [v2,1/3] drm/xe/xe2: Add initial workarounds
URL   : https://patchwork.freedesktop.org/series/125531/
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
commit 3bce6ef5fc6d8a62d67b0edc310e11646d817a60
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Oct 24 15:07:39 2023 -0700

    drm/xe: Add Wa_14019821291
    
    This workaround is primarily implemented by the BIOS.  However if the
    BIOS applies the workaround it will reserve a small piece of our DSM
    (which should be at the top, right below the WOPCM); we just need to
    keep that region reserved so that nothing else attempts to re-use it.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
18d0ebaa2 drm/xe/xe2: Add initial workarounds
4b06dead7 drm/xe: Add performance tuning settings for MTL and Xe2
3bce6ef5f drm/xe: Add Wa_14019821291


