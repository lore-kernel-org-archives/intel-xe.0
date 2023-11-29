Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42B9C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8222B10E5DD;
	Wed, 29 Nov 2023 01:52:04 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B7BE10E5DD;
 Wed, 29 Nov 2023 01:52:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 08712AADEA;
 Wed, 29 Nov 2023 01:52:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Wed, 29 Nov 2023 01:52:03 -0000
Message-ID: <170122272303.12092.17074133106558341313@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231128213634.3633-1-brian.welty@intel.com>
In-Reply-To: <20231128213634.3633-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/xe2=3A_add_pagefault_support_for_LNL_platform?=
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

Series: drm/xe/xe2: add pagefault support for LNL platform
URL   : https://patchwork.freedesktop.org/series/127012/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a8c86979a89f4e2bc3d2e95a74afc9649a8bc5cc
Author: Brian Welty <brian.welty@intel.com>
Date:   Tue Nov 28 13:36:34 2023 -0800

    drm/xe/xe2: Respond to TRTT faults as unsuccessful page fault
    
    SW is not expected to handle TRTT faults and should report these as
    unsuccessful page fault in the reply, such that HW can respond by
    raising a CAT error.
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch 1b020536e1c9147006cfe4e771396e89afdb14f3 drm-intel
2c2e2f97e drm/xe/xe2: Update LNL platform to support device page faults
a8c86979a drm/xe/xe2: Respond to TRTT faults as unsuccessful page fault


