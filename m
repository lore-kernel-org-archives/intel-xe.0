Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED0EE7F154
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 11:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5351710E113;
	Fri, 29 Sep 2023 11:00:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 240A610E114;
 Fri, 29 Sep 2023 10:59:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 21F27A0169;
 Fri, 29 Sep 2023 10:59:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 29 Sep 2023 10:59:59 -0000
Message-ID: <169598519913.19497.3761669175006558986@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929105030.1132290-1-jouni.hogander@intel.com>
In-Reply-To: <20230929105030.1132290-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ba?=
 =?utf-8?q?ckport_set_frontbuffer_return_value_check?=
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

Series: Backport set frontbuffer return value check
URL   : https://patchwork.freedesktop.org/series/124447/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2d60d4db2be47d2489257782b3638589250bda9c
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Fri Sep 29 13:50:30 2023 +0300

    drm/i915: Warn on if set frontbuffer return value is not NULL on release
    
    i915_gem_object_set_frontbuffer returns set frontbuffer pointer.  When we
    are releasing frontbuffer we are clearing the pointer from the object. Warn
    on if return value is not null.
    
    v3: Check i915_gem_object_set_frontbuffer return value separately
    v2: Instead of ignoring do drm_WARN_ON
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230928082924.164720-1-jouni.hogander@intel.com
+ /mt/dim checkpatch 9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64 drm-intel
174e0e455 Revert "drm/i915: Ignore set frontbuffer return value on release"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '93f635ae20cce2b9ee9b647ef986615552ae28d1', maybe rebased or not pulled?
#10: 
This reverts commit 93f635ae20cce2b9ee9b647ef986615552ae28d1.

total: 0 errors, 1 warnings, 0 checks, 9 lines checked
2d60d4db2 drm/i915: Warn on if set frontbuffer return value is not NULL on release


