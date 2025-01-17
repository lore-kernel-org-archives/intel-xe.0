Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E088C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 13:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2718410EAF3;
	Fri, 17 Jan 2025 13:31:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10CE10EAF1;
 Fri, 17 Jan 2025 13:31:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Clarify?=
 =?utf-8?q?_XE=5FIOCTL=5FDBG_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 13:31:36 -0000
Message-ID: <173712069698.721130.9454325182063264035@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250117115305.53113-1-dev@lankhorst.se>
In-Reply-To: <20250117115305.53113-1-dev@lankhorst.se>
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

Series: drm/xe/display: Clarify XE_IOCTL_DBG message
URL   : https://patchwork.freedesktop.org/series/143673/
State : warning

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
commit e7abe9b57aced73a98c30c480a64572aa1ac2247
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Jan 17 12:53:05 2025 +0100

    drm/xe/display: Clarify XE_IOCTL_DBG message
    
    This should make it easier to understand from userspace why importing BO
    fails.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 515c8b0666df99c5aaa378e4d46fa39a910e8903 drm-intel
e7abe9b57ace drm/xe/display: Clarify XE_IOCTL_DBG message
-:19: CHECK:LINE_SPACING: Please don't use multiple blank lines
#19: FILE: drivers/gpu/drm/xe/display/intel_fb_bo.c:27:
 
+

total: 0 errors, 0 warnings, 1 checks, 48 lines checked


