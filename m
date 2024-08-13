Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB79C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 12:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466E10E328;
	Tue, 13 Aug 2024 12:19:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EDD10E328;
 Tue, 13 Aug 2024 12:19:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_fault-inject=3A_improve_build_for_CONFIG=5FFAULT=5FINJECTIO?=
 =?utf-8?q?N=3Dn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 12:19:14 -0000
Message-ID: <172355155428.613446.11282639830005000929@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813121237.2382534-1-jani.nikula@intel.com>
In-Reply-To: <20240813121237.2382534-1-jani.nikula@intel.com>
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

Series: series starting with [1/3] fault-inject: improve build for CONFIG_FAULT_INJECTION=n
URL   : https://patchwork.freedesktop.org/series/137232/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 947c0dbca26c9b0edee61ec8fe43f27def224589
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Aug 13 15:12:37 2024 +0300

    drm/xe: clean up fault injection usage
    
    With the proper stubs in place in linux/fault-inject.h, we can remove a
    bunch of conditional compilation for CONFIG_FAULT_INJECTION=n.
    
    Cc: Andrew Morton <akpm@linux-foundation.org>
    Cc: Akinobu Mita <akinobu.mita@gmail.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 924db73e261b7bfd4b70b14db61197f48bf09426 drm-intel
edd9310c7882 fault-inject: improve build for CONFIG_FAULT_INJECTION=n
-:56: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#56: FILE: include/linux/fault-inject.h:69:
+}
+static inline bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags)

-:60: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#60: FILE: include/linux/fault-inject.h:73:
+}
+static inline bool should_fail(struct fault_attr *attr, ssize_t size)

total: 0 errors, 0 warnings, 2 checks, 58 lines checked
80a106f0261b drm/msm: clean up fault injection usage
947c0dbca26c drm/xe: clean up fault injection usage


