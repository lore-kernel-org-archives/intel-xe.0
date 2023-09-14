Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0DBEEAA71
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 20:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195C010E0F7;
	Thu, 14 Sep 2023 20:37:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BA2310E0F7;
 Thu, 14 Sep 2023 20:37:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6B15CAADE4;
 Thu, 14 Sep 2023 20:37:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 14 Sep 2023 20:37:27 -0000
Message-ID: <169472384743.29167.1014931738131203355@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230914203419.111424-1-jose.souza@intel.com>
In-Reply-To: <20230914203419.111424-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_xe?=
 =?utf-8?q?=3A_Add_a_uAPI_to_query_micro-controler_firmware_version?=
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

Series: xe: Add a uAPI to query micro-controler firmware version
URL   : https://patchwork.freedesktop.org/series/123728/
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
commit 804c84b998df8902075d43c31b0babdb6f9490e1
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Sep 14 13:34:19 2023 -0700

    xe: Add a uAPI to query micro-controler firmware version
    
    Due to a bug in firmware Mesa can't enable by default usage of compute
    engines in DG2.
    
    A new GuC firmware fixed the issue but until know there was no way
    for Mesa to know if user was running with the fixed version or not,
    so this uAPI is required.
    
    I may be expanded in future to query other firmware versions.
    
    More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661
    
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch aeac46cfaebff413254ac07837b97370c7ed3957 drm-intel
804c84b99 xe: Add a uAPI to query micro-controler firmware version
-:18: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#18: 
More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661

-:57: WARNING:BRACES: braces {} are not necessary for single statement blocks
#57: FILE: drivers/gpu/drm/xe/xe_query.c:391:
+	if (copy_to_user(query_ptr, &resp, size)) {
+		return -EFAULT;
+	}

total: 0 errors, 2 warnings, 0 checks, 95 lines checked


