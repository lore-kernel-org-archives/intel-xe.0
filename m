Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC173C0218F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 07:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A812010E5A6;
	Tue,  4 Feb 2025 07:14:09 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F033310E5A2;
 Tue,  4 Feb 2025 07:14:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_DRM_device_wedg?=
 =?utf-8?q?ed_event_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 07:14:08 -0000
Message-ID: <173865324898.742998.16548948093329050479@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204070528.1919158-1-raag.jadav@intel.com>
In-Reply-To: <20250204070528.1919158-1-raag.jadav@intel.com>
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

Series: Introduce DRM device wedged event (rev10)
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
commit b49f36e576a71b8c380dfb2d6ef2d2fe34c0592d
Author: André Almeida <andrealmeid@igalia.com>
Date:   Tue Feb 4 12:35:28 2025 +0530

    drm/amdgpu: Use device wedged event
    
    Use DRM's device wedged event to notify userspace that a reset had
    happened. For now, only use `none` method meant for telemetry
    capture.
    
    In the future we might want to report a recovery method if the reset didn't
    succeed.
    
    Acked-by: Shashank Sharma <shashank.sharma@amd.com>
    Signed-off-by: André Almeida <andrealmeid@igalia.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
+ /mt/dim checkpatch e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db drm-intel
f2e50ab1210e drm: Introduce device wedged event
-:198: WARNING:STATIC_CONST_CHAR_ARRAY: char * array declaration might be better as static const
#198: FILE: drivers/gpu/drm/drm_drv.c:543:
+	char *envp[] = { event_string, NULL };

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
a2138752b914 drm/doc: Document device wedged event
af5a971df7ce drm/xe: Use device wedged event
-:20: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#20: 
KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)

total: 0 errors, 1 warnings, 0 checks, 19 lines checked
08ea2eff8d06 drm/i915: Use device wedged event
b49f36e576a7 drm/amdgpu: Use device wedged event


