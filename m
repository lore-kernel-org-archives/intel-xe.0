Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFA2C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 17:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAA810E40A;
	Fri, 31 Jan 2025 17:27:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1DC10E40A;
 Fri, 31 Jan 2025 17:26:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/debugfs=3A_Add_nod?=
 =?utf-8?q?e_to_dump_guc_log_to_dmesg?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jan 2025 17:26:59 -0000
Message-ID: <173834441964.3249762.12702235911112706811@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250131171716.3998432-1-lucas.demarchi@intel.com>
In-Reply-To: <20250131171716.3998432-1-lucas.demarchi@intel.com>
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

Series: drm/xe/debugfs: Add node to dump guc log to dmesg
URL   : https://patchwork.freedesktop.org/series/144196/
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
commit d6f4fd2b17b97dae9659870fdeddda3a6711b217
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jan 31 09:17:16 2025 -0800

    drm/xe/debugfs: Add node to dump guc log to dmesg
    
    Currently xe_guc_log_print_dmesg() is unused, as it's expected
    developers to add those calls when needed. However it makes it hard to
    guarantee it's working as nothing is testing it. Add a node in debugfs
    so it can be tested. This is purely for testing purposes since with the
    device probed and working, the guc log can be obtained by the regular
    debugfs file.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 12fb3dcbf0667f1ed3c3caff321de4a1ad3d4a7a drm-intel
d6f4fd2b17b9 drm/xe/debugfs: Add node to dump guc log to dmesg


