Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DC8C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 14:03:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E6F10E071;
	Tue, 18 Feb 2025 14:03:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083F910E071;
 Tue, 18 Feb 2025 14:03:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe=3A_move_page_fault_descriptors_to_uc_types_file?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 14:03:49 -0000
Message-ID: <173988742903.3580550.15567848561888378568@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218112702.262780-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250218112702.262780-1-dafna.hirschfeld@intel.com>
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

Series: series starting with [v2,1/2] drm/xe: move page fault descriptors to uc types file
URL   : https://patchwork.freedesktop.org/series/145009/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bfc0a86a612e954c6720aa201974785c70163cf1
Author: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Date:   Tue Feb 18 13:27:02 2025 +0200

    drm/xe: upon page fault, use generic uc fw instead of guc
    
    Future asic will have different firmware to handle page faults.
    Change the code in xe_gt_pagefault.c to use xe_uc_fw instead of
    xe_guc and add a callback to struct xe_uc_fw to send the page
    fault replay to the fw.
    
    Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
+ /mt/dim checkpatch 4587c05996666a92af63f86ba410bae1dc940794 drm-intel
a75d16879f4a drm/xe: move page fault descriptors to uc types file
bfc0a86a612e drm/xe: upon page fault, use generic uc fw instead of guc


