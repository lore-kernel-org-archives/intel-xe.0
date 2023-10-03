Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410ACE8FDBE
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 22:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ECF10E320;
	Tue,  3 Oct 2023 22:55:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 801E510E320;
 Tue,  3 Oct 2023 22:55:02 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 637B2AADF2;
 Tue,  3 Oct 2023 22:55:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Tue, 03 Oct 2023 22:55:02 -0000
Message-ID: <169637370240.4380.14439304204437385855@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231003222145.4090918-1-david.kershner@intel.com>
In-Reply-To: <20231003222145.4090918-1-david.kershner@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Us?=
 =?utf-8?q?e_DPA_offset_for_page_table_entries=2E?=
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

Series: Use DPA offset for page table entries.
URL   : https://patchwork.freedesktop.org/series/124577/
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
commit 06d18a85108ff0da936256f422ac4c0d54a3ef0d
Author: David Kershner <david.kershner@intel.com>
Date:   Tue Oct 3 18:21:45 2023 -0400

    drm/xe/xe_hwmon.c: Add static to xe_hwmon_process_reg_read64
    
    Add static to xe_hwmon_process_reg_read64 to avoid compile warning:
    
        ../drivers/gpu/drm/xe/xe_hwmon.c:126:5: error: no previous prototype
             for ‘xe_hwmon_process_reg_read64’ [-Werror=missing-prototypes]
    
    Signed-off-by: David Kershner <david.kershner@intel.com>
+ /mt/dim checkpatch 090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36 drm-intel
e9f64104f drm/xe/xe_migrate.c: Use DPA offset for page table entries.
06d18a851 drm/xe/xe_hwmon.c: Add static to xe_hwmon_process_reg_read64
-:25: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#25: FILE: drivers/gpu/drm/xe/xe_hwmon.c:126:
+static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, u64 *value)

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


