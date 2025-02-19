Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E1DC021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 13:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA5C10E2F6;
	Wed, 19 Feb 2025 13:14:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E55210E2C5;
 Wed, 19 Feb 2025 13:14:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Fix_fbd?=
 =?utf-8?q?ev_GGTT_mapping_handling=2E_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Feb 2025 13:14:04 -0000
Message-ID: <173997084431.3962046.12169905785142606403@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219130015.192618-1-dev@lankhorst.se>
In-Reply-To: <20250219130015.192618-1-dev@lankhorst.se>
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

Series: drm/xe/display: Fix fbdev GGTT mapping handling. (rev4)
URL   : https://patchwork.freedesktop.org/series/144602/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 90e133553f27993884df6afff6090730719ba384
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed Feb 19 14:00:14 2025 +0100

    drm/xe/display: Fix fbdev GGTT mapping handling.
    
    The fbdev vma is a normal unrotated VMA, so add ane explicit check
    before re-using.
    
    When re-using, we have to restore the GGTT mapping on resume, so add
    some code to do that too.
    
    Fixes: 67a98f7e27ba ("drm/xe/display: Re-use display vmas when possible")
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch e0ae0e88c9111e486fb4ff4edb064cdb40851762 drm-intel
90e133553f27 drm/xe/display: Fix fbdev GGTT mapping handling.
-:90: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#90: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 74 lines checked


