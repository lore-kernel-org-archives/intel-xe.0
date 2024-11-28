Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A89D69114
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 15:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BBB10ECF6;
	Thu, 28 Nov 2024 15:52:16 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2684E10ED04;
 Thu, 28 Nov 2024 15:52:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM_device_wedg?=
 =?utf-8?q?ed_event_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Nov 2024 15:52:15 -0000
Message-ID: <173280913515.4064499.10273813050650808465@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241128153707.1294347-1-raag.jadav@intel.com>
In-Reply-To: <20241128153707.1294347-1-raag.jadav@intel.com>
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

Series: Introduce DRM device wedged event (rev8)
URL   : https://patchwork.freedesktop.org/series/138070/
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
commit e548d261685a8d8aa12fc23d14ddd1b28c43a00a
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Nov 28 21:07:07 2024 +0530

    drm/i915: Use device wedged event
    
    Now that we have device wedged event provided by DRM core, make use
    of it and support both driver rebind and bus-reset based recovery.
    With this in place, userspace will be notified of wedged device on
    gt reset failure.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
+ /mt/dim checkpatch 74a57778be9b7768773c41c9ef84e8a81877adca drm-intel
fad6cfa45df9 drm: Introduce device wedged event
-:189: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#189: FILE: drivers/gpu/drm/drm_drv.c:542:
+	char *envp[] = { event_string, NULL };

total: 0 errors, 1 warnings, 0 checks, 105 lines checked
49324beed43f drm/doc: Document device wedged event
9dec61b73813 drm/xe: Use device wedged event
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
e548d261685a drm/i915: Use device wedged event


