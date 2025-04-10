Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A277AC369A2
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 05:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F9D10E35E;
	Thu, 10 Apr 2025 05:06:15 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFD410E35E;
 Thu, 10 Apr 2025 05:06:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Set_LRC_address?=
 =?utf-8?q?es_before_guc_load?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 05:06:14 -0000
Message-ID: <174426157471.54719.17883299635708985740@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
In-Reply-To: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
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

Series: drm/xe: Set LRC addresses before guc load
URL   : https://patchwork.freedesktop.org/series/147505/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6edd990249f84a6b14aaa7f18d35f5282b000a8c
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Apr 9 21:59:34 2025 -0700

    drm/xe: Set LRC addresses before guc load
    
    The metadata saved in the ADS is read by GuC when it's initialized.
    Saving the addresses to the LRCs when they are populated is too late as
    GuC will keep using the old ones.
    
    This was causing GuC to use the RCS LRC for any engine class. It's not a
    big problem on a Linux-only scenario since the they are used by GuC only
    on media engines when the watchdog is triggered. However, in a
    virtualization scenario with Windows as the VF, it causes the wrong LRCs
    to be loaded as the watchdog is used for all engines.
    
    Fix it by letting guc_golden_lrc_init() initialize the metadata, like
    other *_init() functions, and later guc_golden_lrc_populate() to copy
    the LRCs to the right places. The former is called before the second GuC
    load, while the latter is called after LRCs have been recorded.
    
    Cc: Chee Yin Wong <chee.yin.wong@intel.com>
    Cc: John Harrison <john.c.harrison@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c54633598106dbdb97f3aa589587b8176009b6d8 drm-intel
6edd990249f8 drm/xe: Set LRC addresses before guc load


