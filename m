Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22E5C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 10:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5277C112F54;
	Mon,  6 May 2024 10:15:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9540A112F53;
 Mon,  6 May 2024 10:15:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Implement_Aud?=
 =?utf-8?q?io_WA=5F14020863754_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 10:15:57 -0000
Message-ID: <171499055761.1939725.14168683529217296163@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506101817.2590328-1-uma.shankar@intel.com>
In-Reply-To: <20240506101817.2590328-1-uma.shankar@intel.com>
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

Series: drm/i915: Implement Audio WA_14020863754 (rev3)
URL   : https://patchwork.freedesktop.org/series/132254/
State : success

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
commit 5cf15deba14182d3c4bba841a5e084ce83de3fdd
Author: Uma Shankar <uma.shankar@intel.com>
Date:   Mon May 6 15:48:17 2024 +0530

    drm/i915: Implement Audio WA_14020863754
    
    WA_14020863754: Corner case with Min Hblank Fix can cause
    audio hang
    
    Issue: Previously a fix was made to avoid issues with extremely
    small hblanks, called the "Min Hblank Fix". However, this can
    potentially cause an audio hang.
    
    Workaround :
    During "Audio Programming Sequence" Audio Enabling -
    When DP mode is enabled Set mmio offset 0x65F1C bit 18 = 1b,
    before step #1 "Enable audio Presence Detect"
    
    During "Audio Programming Sequence" Audio Disabling -
    When DP mode is enabled Clear mmio offset 0x65F1C bit 18 = 0b,
    after step #6 "Disable Audio PD (Presence Detect)"
    If not clearing PD bit, must also not clear 0x65F1C bit 18 (leave = 1b)
    
    v2: Update the platform checks (Jani Nikula)
    
    v3: Limited the WA to LNL and BMG, added a helper (Matt Roper)
    
    Signed-off-by: Uma Shankar <uma.shankar@intel.com>
+ /mt/dim checkpatch 5a43da669cdb9b8df66e32a661b09cd9c52e35f2 drm-intel
5cf15deba141 drm/i915: Implement Audio WA_14020863754


