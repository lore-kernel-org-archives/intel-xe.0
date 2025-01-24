Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40272C0218C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 21:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D90410E1BD;
	Fri, 24 Jan 2025 21:36:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B3710E1BD;
 Fri, 24 Jan 2025 21:36:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/dmc=5Fwl=3A_Do_n?=
 =?utf-8?q?ot_check_for_DMC_payload?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 21:36:33 -0000
Message-ID: <173775459374.4147336.2588754506487851079@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124191250.56833-1-gustavo.sousa@intel.com>
In-Reply-To: <20250124191250.56833-1-gustavo.sousa@intel.com>
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

Series: drm/i915/dmc_wl: Do not check for DMC payload
URL   : https://patchwork.freedesktop.org/series/143950/
State : success

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
commit 579d71a086e9f1000cea5d761252c6cdc9a18e28
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Fri Jan 24 16:12:34 2025 -0300

    drm/i915/dmc_wl: Do not check for DMC payload
    
    Enabling and disabling of DMC wakelock is already coupled with enabling
    and disabling of dynamic DC states, which already depend on the DMC
    being properly loaded. As such, we do not need to check if we already
    have a DMC payload parsed in __intel_dmc_wl_supported().
    
    Furthermore, the presence of such a check causes inconsistencies in the
    refcount if the following sequence of events happen:
    
      1. A call to one of the register accessors from intel_de.h is done
         before the DMC payload is parsed. That causes intel_dmc_wl_get() to
         be called. Suppose the register offset qualifies as needing the
         wakelock.
    
         In normal circumstances, the refcount would be incremented, but,
         because __intel_dmc_wl_supported() returns false, the refcount is
         untouched.
    
      2. In a separate worker thread, the DMC firmware is parsed. Parsing of
         the DMC payload is finished before the corresponding
         intel_dmc_wl_put() from (1) is called.
    
      3. When in the context of (1), intel_dmc_wl_put() gets called, now we
         have __intel_dmc_wl_supported() returning true and we hit the
         warning, because the code doesn't expect a zero refcount.
    
    Let's remove that check, since it is unnecessary and causes the
    inconsistency illustrated above.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch df181b47c540b5c4604c91929f4f346030955d53 drm-intel
579d71a086e9 drm/i915/dmc_wl: Do not check for DMC payload


