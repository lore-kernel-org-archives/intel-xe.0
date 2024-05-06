Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867CDC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 23:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A8310E013;
	Mon,  6 May 2024 23:53:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D366510E4A2;
 Mon,  6 May 2024 23:53:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introducing_I915=5FFORMAT?=
 =?utf-8?q?=5FMOD=5F4=5FTILED=5FXE2=5FCCS_Modifier_for_Xe2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 23:53:57 -0000
Message-ID: <171503963786.1960082.9353278791844470981@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506185238.364539-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240506185238.364539-1-juhapekka.heikkila@gmail.com>
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

Series: Introducing I915_FORMAT_MOD_4_TILED_XE2_CCS Modifier for Xe2
URL   : https://patchwork.freedesktop.org/series/133252/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2b4cf7eded91920e596b3d795290fbbc0ed8bac8
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Mon May 6 21:52:38 2024 +0300

    drm/i915/display: allow creation of case I915_FORMAT_MOD_4_TILED_XE2_CCS type framebuffer
    
    Add I915_FORMAT_MOD_4_TILED_XE2_CCS to possible created tiling for new framebuffer
    on Xe driver.
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 980de4c8f9c4fc65bd51d355372e06dc576c3ea7 drm-intel
f4a367457dd3 drm/fourcc: define Intel Xe2 related tile4 ccs modifier
ec012ff7e27e drm/xe/display: allow creation of case I915_FORMAT_MOD_4_TILED_XE2_CCS type framebuffer
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Add I915_FORMAT_MOD_4_TILED_XE2_CCS to possible created tiling for new framebuffer

total: 0 errors, 1 warnings, 0 checks, 7 lines checked
2b4cf7eded91 drm/i915/display: allow creation of case I915_FORMAT_MOD_4_TILED_XE2_CCS type framebuffer
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Add I915_FORMAT_MOD_4_TILED_XE2_CCS to possible created tiling for new framebuffer

total: 0 errors, 1 warnings, 0 checks, 57 lines checked


