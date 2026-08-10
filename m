Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FC9C5AD4E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 08:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650EA10E194;
	Mon, 10 Aug 2026 08:07:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ED110E194;
 Mon, 10 Aug 2026 08:06:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_make_CTX=5FTIME?=
 =?utf-8?q?STAMP_TOCTOU-safe_and_handle_sentinels?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gajendra Uttamchand" <gajendra.uttamchand@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Aug 2026 08:06:58 -0000
Message-ID: <178634921858.33188.9123983800007099709@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260810071812.213358-3-gajendra.uttamchand@intel.com>
In-Reply-To: <20260810071812.213358-3-gajendra.uttamchand@intel.com>
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

Series: drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle sentinels
URL   : https://patchwork.freedesktop.org/series/171909/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2cfa5cbe637bd134f760adc9e9e4250ab1b1550e
Author: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Date:   Mon Aug 10 07:18:14 2026 +0000

    drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
    
    Problem: CTX_TIMESTAMP MMIO reads could be stale if a context
    switched out between check and read; LRC stores a sentinel while
    a context starts that must not be treated as a real timestamp.
    
    Fix: Check the LRC-stored sentinel before and after the MMIO read;
    return the LRC value if the context switched out to avoid TOCTOU.
    
    Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify
    logic")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7956
    
    Note: Keep XE_LRC_CTX_TIMESTAMP_ACTIVE in xe_lrc.h as the
    canonical sentinel.
    
    Assisted-by: GitHub-Copilot:claude-sonnet-5
    Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Acked-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9c14709d79cf144f0990551a124af7615bdd97be drm-intel
2cfa5cbe637b drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
-:14: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic")'
#14: 
Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify

total: 0 errors, 1 warnings, 0 checks, 55 lines checked


