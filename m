Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F00C3ABBF
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 14:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8D610E6A4;
	Tue,  6 May 2025 14:20:05 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF7D10E6A4;
 Tue,  6 May 2025 14:20:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/mocs=3A_Check_if_a?=
 =?utf-8?q?ll_domains_awake?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 14:20:03 -0000
Message-ID: <174654120382.51804.2717655439480451054@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250506142300.1865783-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250506142300.1865783-1-tejas.upadhyay@intel.com>
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

Series: drm/xe/mocs: Check if all domains awake
URL   : https://patchwork.freedesktop.org/series/148642/
State : warning

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
commit 0a25f35e6dc2bae4bed27a2c32ef33d5fad249d8
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Tue May 6 19:53:00 2025 +0530

    drm/xe/mocs: Check if all domains awake
    
    Check if all domains are awake specially for
    LNCF regs
    
    Fixes: 1182bc74b39b ("drm/xe: Fix MOCS debugfs LNCF readout")
    Improvements-suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 9f365ea4cf81b0d81ad82903e5605894ca4aba98 drm-intel
0a25f35e6dc2 drm/xe/mocs: Check if all domains awake
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
Improvements-suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

total: 0 errors, 1 warnings, 0 checks, 28 lines checked


