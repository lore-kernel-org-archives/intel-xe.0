Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBE0C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 07:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D558A10E8FA;
	Fri, 24 Jan 2025 07:46:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4868110E8FB;
 Fri, 24 Jan 2025 07:46:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM_device_wedg?=
 =?utf-8?q?ed_event_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 07:46:07 -0000
Message-ID: <173770476729.3924040.8943471307599120352@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124055300.1111274-1-raag.jadav@intel.com>
In-Reply-To: <20250124055300.1111274-1-raag.jadav@intel.com>
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

Series: Introduce DRM device wedged event (rev9)
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
commit c113af0c9f0cd8939995e553859722450ee68041
Author: André Almeida <andrealmeid@igalia.com>
Date:   Fri Jan 24 11:23:00 2025 +0530

    drm/amdgpu: Use device wedged event
    
    Use DRM's device wedged event to notify userspace that a reset had
    happened. For now, only use `none` method meant for telemetry
    capture.
    
    In the future we might want to report a recovery method if the reset didn't
    succeed.
    
    Acked-by: Shashank Sharma <shashank.sharma@amd.com>
    Signed-off-by: André Almeida <andrealmeid@igalia.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch e242335af00fca4900f579d00dc7c1ab658c7fe1 drm-intel
f50cdb93885f drm: Introduce device wedged event
-:194: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#194: FILE: drivers/gpu/drm/drm_drv.c:543:
+	char *envp[] = { event_string, NULL };

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
4d9a1f92f2ac drm/doc: Document device wedged event
7a13d844d91e drm/xe: Use device wedged event
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
5be494b724a1 drm/i915: Use device wedged event
c113af0c9f0c drm/amdgpu: Use device wedged event


