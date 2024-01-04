Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868AEC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 20:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBD410E52B;
	Thu,  4 Jan 2024 20:28:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FCF10E52B;
 Thu,  4 Jan 2024 20:28:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/3=5D_drm/i915=3A_Disable_DSB_in_Xe_KMD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 04 Jan 2024 20:28:49 -0000
Message-ID: <170440012943.22406.970283927738784178@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240104162411.56085-1-jose.souza@intel.com>
In-Reply-To: <20240104162411.56085-1-jose.souza@intel.com>
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

Series: series starting with [v4,1/3] drm/i915: Disable DSB in Xe KMD
URL   : https://patchwork.freedesktop.org/series/128215/
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
commit eee500f64d5163e77a829cfb4422afdea064b72c
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Jan 4 08:24:11 2024 -0800

    drm/xe: Use intel_wakeref_t in intel_runtime_pm functions
    
    Now intel_wakeref_t is a unsigned long and Xe KMD version of those
    functions should use the same type, so changing from bool to
    intel_wakeref_t.
    
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
101ae62fc drm/i915: Disable DSB in Xe KMD
-:38: WARNING:IS_ENABLED_CONFIG: IS_ENABLED(I915) is normally used as IS_ENABLED(CONFIG_I915)
#38: FILE: drivers/gpu/drm/i915/display/intel_dsb.c:457:
+	if (!IS_ENABLED(I915))

total: 0 errors, 1 warnings, 0 checks, 10 lines checked
966f01def drm/xe: Fix definition of intel_wakeref_t
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
                 from ./drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11,

-:49: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '44e694958b95', maybe rebased or not pulled?
#49: 
Fixes: 44e694958b95 ("drm/xe/display: Implement display support")

-:63: WARNING:NEW_TYPEDEFS: do not add new typedefs
#63: FILE: drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h:8:
+typedef unsigned long intel_wakeref_t;

total: 0 errors, 3 warnings, 0 checks, 5 lines checked
eee500f64 drm/xe: Use intel_wakeref_t in intel_runtime_pm functions


