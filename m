Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC01CC3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 09:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A25ED10E375;
	Thu,  8 May 2025 09:18:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA82E10E36A;
 Thu,  8 May 2025 09:18:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Wait_for_VRAM_ready_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 May 2025 09:18:48 -0000
Message-ID: <174669592888.58855.10471223243449016558@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250508090816.216176-1-karthik.poosa@intel.com>
In-Reply-To: <20250508090816.216176-1-karthik.poosa@intel.com>
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

Series: Wait for VRAM ready (rev2)
URL   : https://patchwork.freedesktop.org/series/148022/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 512a9357545c09afcbe6cadf1038c5415703d1bb
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu May 8 14:38:16 2025 +0530

    drm/xe/pm: Wait for vram ready in resume
    
    Add wait for vram ready during system and runtime resume.
    This wait is there in probe and is missing during resume.
    While there are no issues today without this check, it's
    a prudent measure to prevent any future issues.
    
    v2:
     - Use xe_device_wait_for_vram_ready function.
     - Improve commit message. (Lucas)
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch ca0305cadc2d34c8887b891b96226af17571b2a3 drm-intel
f6b5a9ec6b66 drm/xe: Rename wait_for_lmem_ready and make it non-static
512a9357545c drm/xe/pm: Wait for vram ready in resume


