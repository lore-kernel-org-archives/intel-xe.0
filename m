Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22690EF371A
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 08:41:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D4210E152;
	Mon,  9 Mar 2026 08:41:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B38810E152;
 Mon,  9 Mar 2026 08:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Some_updates_over_DP_AUX_?=
 =?utf-8?q?Transactions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 08:41:27 -0000
Message-ID: <177304568729.332521.16454712092836194753@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
In-Reply-To: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
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

Series: Some updates over DP AUX Transactions
URL   : https://patchwork.freedesktop.org/series/162842/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 69d99254cb81902df57b2dda6cd8a80fc1e9600d
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Mon Mar 9 12:59:26 2026 +0530

    drm/i915/dp: Configure PORT_AUX_CTL and then trigger the tx
    
    Use re_rmw and update the required bits for PORT_AUX_CTL and drop the
    bit configurations that are not required(AUX Power Request setting of
    bit 19). Also break writing to PORT_AUX_CTL into 2 steps with first step
    for doing the configuration/settings and then second write to trigger
    the AUX transaction.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 2590b5b38b7b67f863d0997270d5dc50430c0287 drm-intel
9722dfe786b3 drm/display/dp: Export function to wake the sink AUX_CH
f0d120a65d62 drm/i915/dp: On AUX_CH tx timeout, wake up the sink
69d99254cb81 drm/i915/dp: Configure PORT_AUX_CTL and then trigger the tx
-:29: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#29: FILE: drivers/gpu/drm/i915/display/intel_display_types.h:1889:
+	void (*get_aux_send_ctl)(struct intel_dp *dp, int send_bytes,
 				u32 aux_clock_divider);

total: 0 errors, 0 warnings, 1 checks, 196 lines checked


