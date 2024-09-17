Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE4DC3ABD0
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 04:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B963410E401;
	Tue, 17 Sep 2024 04:10:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27C410E401;
 Tue, 17 Sep 2024 04:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM_device_wedg?=
 =?utf-8?q?ed_event_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 04:10:19 -0000
Message-ID: <172654621978.1020268.16820713334235743275@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917040235.197019-1-raag.jadav@intel.com>
In-Reply-To: <20240917040235.197019-1-raag.jadav@intel.com>
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

Series: Introduce DRM device wedged event (rev3)
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
commit a5b8e29570f59cadd9a11ea9ee0a1a0cc29d7b3d
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Tue Sep 17 09:32:35 2024 +0530

    drm/i915: Use device wedged event
    
    Now that we have device wedged event supported by DRM core, make use
    of it. With this in place, userspace will be notified of wedged device
    on gt reset failure.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch e08d67347c6c3fd164c1346ea9e2ae8788da1976 drm-intel
5eaedda10188 drm: Introduce device wedged event
-:14: WARNING:TYPO_SPELLING: 'upto' may be misspelled - perhaps 'up to'?
#14: 
and hence the vendor agnostic nature of the event. It is upto the drivers
                                                         ^^^^

-:66: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#66: FILE: drivers/gpu/drm/drm_drv.c:521:
+	char *envp[] = { event_string, NULL };

total: 0 errors, 2 warnings, 0 checks, 86 lines checked
5a9c2903f6af drm: Expose wedge recovery methods
-:26: WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#26: FILE: drivers/gpu/drm/drm_sysfs.c:39:
+extern const char *const wedge_recovery_opts[];

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
c6fd727c3f88 drm/xe: Use device wedged event
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 53 lines checked
a5b8e29570f5 drm/i915: Use device wedged event


