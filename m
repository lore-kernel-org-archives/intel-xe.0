Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861BFC47DDF
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 09:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F0B10F0E6;
	Wed, 24 Jan 2024 09:09:45 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB71810EDAE;
 Wed, 24 Jan 2024 09:09:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_don=27t_build_d?=
 =?utf-8?q?ebugfs_files_when_CONFIG=5FDEBUG=5FFS=3Dn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 24 Jan 2024 09:09:44 -0000
Message-ID: <170608738483.685200.7198114728557223533@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240124090515.3363901-1-jani.nikula@intel.com>
In-Reply-To: <20240124090515.3363901-1-jani.nikula@intel.com>
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

Series: drm/xe: don't build debugfs files when CONFIG_DEBUG_FS=n
URL   : https://patchwork.freedesktop.org/series/129125/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ab769a2232069558ebe94da0a8618dfc067fe005
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Jan 24 11:05:15 2024 +0200

    drm/xe: don't build debugfs files when CONFIG_DEBUG_FS=n
    
    If we unconditionally build the debugfs files, we'll get both the static
    inline stubs from the headers and the real functions for
    CONFIG_DEBUG_FS=n. Avoid building the debugfs files with that config.
    
    Reported-by: Randy Dunlap <rdunlap@infradead.org>
    Closes: https://lore.kernel.org/r/152521f9-119f-4c61-b467-3e91f4aecb1a@infradead.org
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 0496fe20d8ed5e73ed186d293ef67e7bae4658eb drm-intel
ab769a223 drm/xe: don't build debugfs files when CONFIG_DEBUG_FS=n


