Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C361C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 18:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EB410E09C;
	Fri, 26 Jul 2024 18:34:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E2810E09C;
 Fri, 26 Jul 2024 18:33:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_Introduce_p?=
 =?utf-8?q?erformance_changes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Jul 2024 18:33:59 -0000
Message-ID: <172201883975.386898.3583500646769812732@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1722060742.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1722060742.git.akshata.jahagirdar@intel.com>
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

Series: drm/xe/xe2: Introduce performance changes (rev2)
URL   : https://patchwork.freedesktop.org/series/136170/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a4fb74af3b9aa495bc9e9c0c185ab2c2fa03af1
Author: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Date:   Fri Jul 26 23:20:23 2024 -0700

    drm/xe/xe2: Introduce performance changes
    
    Add Compression Performance Improvement Changes in Xe2
    
    Bspec: 70559, 59928, 59927, 59251
    
    v2: Rebase
    
    Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
+ /mt/dim checkpatch 422ad8b018bb44eb6aec55db31d0881aef32539e drm-intel
5a4fb74af3b9 drm/xe/xe2: Introduce performance changes


