Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DA5C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 14:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57310E5E5;
	Tue, 12 Dec 2023 14:23:20 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87A1910E5E5;
 Tue, 12 Dec 2023 14:23:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 842C4AADE4;
 Tue, 12 Dec 2023 14:23:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_fixup!_drm/xe/uc=3A_Store_firmware_binary_in_system-memory_?=
 =?utf-8?q?backed_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Tue, 12 Dec 2023 14:23:19 -0000
Message-ID: <170239099953.31294.11128842416832093939@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231212142045.22182-1-maarten.lankhorst@linux.intel.com>
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

Series: series starting with [1/2] fixup! drm/xe/uc: Store firmware binary in system-memory backed BO
URL   : https://patchwork.freedesktop.org/series/127688/
State : warning

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
commit fad0f7a2c99c751590e62a813412d8fce5a8e287
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Dec 12 15:20:45 2023 +0100

    fixup! drm/xe/uapi: Reject bo creation of unaligned size
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 0c30a1b58ce6096e5d6a6c9ba32961c345fab7c8 drm-intel
f75221995 fixup! drm/xe/uc: Store firmware binary in system-memory backed BO
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:21: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Maarten Lankhorst <dev@lankhorst.se>' != 'Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>'

total: 0 errors, 2 warnings, 0 checks, 8 lines checked
fad0f7a2c fixup! drm/xe/uapi: Reject bo creation of unaligned size
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Maarten Lankhorst <dev@lankhorst.se>' != 'Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>'

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


