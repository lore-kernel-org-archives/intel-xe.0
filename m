Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EB5C4332F
	for <intel-xe@archiver.kernel.org>; Sun,  5 Nov 2023 11:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5649110E106;
	Sun,  5 Nov 2023 11:01:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E56F10E106;
 Sun,  5 Nov 2023 11:01:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6C12FAADDD;
 Sun,  5 Nov 2023 11:01:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Date: Sun, 05 Nov 2023 11:01:42 -0000
Message-ID: <169918210243.24736.14634525347078704125@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231105105307.3710560-1-alexander.usyskin@intel.com>
In-Reply-To: <20231105105307.3710560-1-alexander.usyskin@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/gsc=3A_enable_pvc_support?=
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

Series: drm/xe/gsc: enable pvc support
URL   : https://patchwork.freedesktop.org/series/125990/
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
commit 08d9692a3803baa881daefbe26a17e88aafc54a7
Author: Alexander Usyskin <alexander.usyskin@intel.com>
Date:   Sun Nov 5 12:53:07 2023 +0200

    drm/xe/gsc: init heci gsc after interrupts are ready
    
    Init HECI GSC only after GT enables interrupts.
    
    Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
+ /mt/dim checkpatch fc457bcc18109467961edc92c80b238009f6a9fb drm-intel
96e13aa29 drm/xe/gsc: enable pvc support
08d9692a3 drm/xe/gsc: init heci gsc after interrupts are ready


