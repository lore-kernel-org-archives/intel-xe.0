Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E2FCE7AFB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 09:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B737010E9E5;
	Fri,  6 Sep 2024 09:51:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5154E10E9E5;
 Fri,  6 Sep 2024 09:51:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM_device_wedg?=
 =?utf-8?q?ed_event_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Sep 2024 09:51:52 -0000
Message-ID: <172561631232.953803.16088304091116822136@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906094225.3082162-1-raag.jadav@intel.com>
In-Reply-To: <20240906094225.3082162-1-raag.jadav@intel.com>
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

Series: Introduce DRM device wedged event (rev2)
URL   : https://patchwork.freedesktop.org/series/138070/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 237825e211d38f69ad09b8f69404b90a6194585a
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Fri Sep 6 15:12:25 2024 +0530

    drm/i915: Use device wedged event
    
    Now that we have device wedged event supported by DRM core, make use
    of it. With this in place, userspace will be notified of wedged device
    on gt reset failure.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch d4b15a4609f1b768b0301fd238022ab8d07d15bc drm-intel
278b8c69398d drm: Introduce device wedged event
-:47: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#47: FILE: drivers/gpu/drm/drm_drv.c:512:
+	char *envp[] = { event_string, NULL };

total: 0 errors, 1 warnings, 0 checks, 33 lines checked
62bf3119fc0f drm/xe: Use device wedged event
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
KERNEL[307.420340] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 23 lines checked
237825e211d3 drm/i915: Use device wedged event


