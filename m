Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFE6C61DFD
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 01:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C39D10E269;
	Tue,  1 Sep 2026 01:23:42 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088F10E030;
 Tue,  1 Sep 2026 01:23:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Read_scheduler_message_opcode_under_lock?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Sep 2026 01:23:41 -0000
Message-ID: <178822582106.104222.1745840348388436605@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901011712.2617466-1-matthew.brost@intel.com>
In-Reply-To: <20260901011712.2617466-1-matthew.brost@intel.com>
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

Series: series starting with [1/2] drm/xe: Read scheduler message opcode under lock
URL   : https://patchwork.freedesktop.org/series/173108/
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
commit ad1a633c7b89e4665d81527e9df15c0c17e15f1d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Aug 31 18:17:12 2026 -0700

    drm/xe: Disable scheduling early on FD close to avoid CAT error cascade
    
    When an FD is closed with many exec queues, teardown relies on the TDR
    path to clean up scheduling. However, the TDR handling is serialized
    (i.e., only one exec queue is processed at a time), which can make it
    too slow compared to GuC scheduling activity.
    
    In this window, GuC may continue to schedule contexts backed by
    invalid page tables, leading to a cascade of CAT errors and repeated
    engine resets. This significantly increases recovery time and can
    degrade system stability.
    
    To mitigate this, eagerly disable scheduling by sending a self-message
    outside of the TDR path. This prevents further scheduling of invalid
    contexts and avoids the CAT error/reset cascade.
    
    This change improves robustness and reduces recovery latency in
    multiple queue teardown scenarios.
    
    Cc: Wang Xin <x.wang@intel.com>
    Cc: Jia Yao <jia.yao@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Tested-by: Jia Yao <jia.yao@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch c8420bcb1802510e5411ea4c98e2e07bdb43d74e drm-intel
c05a6a13b65f drm/xe: Read scheduler message opcode under lock
-:12: WARNING:BAD_STABLE_ADDRESS_STYLE: Invalid email format for stable: 'stable <stable@kernel.org>', prefer 'stable@kernel.org'
#12: 
Cc: stable <stable@kernel.org>

total: 0 errors, 1 warnings, 0 checks, 65 lines checked
ad1a633c7b89 drm/xe: Disable scheduling early on FD close to avoid CAT error cascade


