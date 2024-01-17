Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C71FC47DA2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 16:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F403110E6D1;
	Wed, 17 Jan 2024 16:04:34 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71E010E6D1;
 Wed, 17 Jan 2024 16:04:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_typo_in_vra?=
 =?utf-8?q?m_frequency_sysfs_documentation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Wed, 17 Jan 2024 16:04:33 -0000
Message-ID: <170550747388.537692.5378675638096911318@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117043215.2598677-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240117043215.2598677-1-sujaritha.sundaresan@intel.com>
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

Series: drm/xe: Fix typo in vram frequency sysfs documentation (rev2)
URL   : https://patchwork.freedesktop.org/series/128415/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7dc2a38858b87667c4e64a9441de3027298e4953
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Wed Jan 17 10:02:15 2024 +0530

    drm/xe: Fix typo in vram frequency sysfs documentation
    
    Fix function naming and description for xe_vram_freq_sysfs_init
    function.
    
    v2: Add fixes tag (Riana)
        Fix review comments (Lucas)
    
    Fixes: 4ae3aeab32d7 ("drm/xe: Add vram frequency sysfs attributes")
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch b42f47ca5fff1d04fb8eb02d64520b3f338a495d drm-intel
7dc2a3885 drm/xe: Fix typo in vram frequency sysfs documentation
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '4ae3aeab32d7', maybe rebased or not pulled?
#12: 
Fixes: 4ae3aeab32d7 ("drm/xe: Add vram frequency sysfs attributes")

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


