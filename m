Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD0DC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 21:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D549010E2A1;
	Fri, 10 Nov 2023 21:01:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A206C10E2A2;
 Fri, 10 Nov 2023 21:01:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9FACAA7DFB;
 Fri, 10 Nov 2023 21:01:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommithi Sakeena" <bommithi.sakeena@intel.com>
Date: Fri, 10 Nov 2023 21:01:45 -0000
Message-ID: <169965010565.31677.18325680923202584754@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231109174709.4360-1-bommithi.sakeena@intel.com>
In-Reply-To: <20231109174709.4360-1-bommithi.sakeena@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Encapsulate_all_the_module_parameters_=28rev4=29?=
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

Series: drm/xe: Encapsulate all the module parameters (rev4)
URL   : https://patchwork.freedesktop.org/series/124995/
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
commit 8860f52f4f092daccbd01fc48334c35d1169b78b
Author: Bommithi Sakeena <bommithi.sakeena@intel.com>
Date:   Thu Nov 9 17:47:09 2023 +0000

    drm/xe: Encapsulate all the module parameters
    
    Encapsulate all the module parameters in one single global struct
    variable. This also removes the extra xe_module.h from includes.
    
    v2: naming consistency as suggested by Jani and Lucas
    v3: fix checkpatch errors/warnings
    
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch b3890fb4386dcef68a96888141c4cc773f6241ce drm-intel
8860f52f4 drm/xe: Encapsulate all the module parameters
-:166: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#166: FILE: drivers/gpu/drm/xe/xe_module.h:21:
+};
+extern struct xe_modparam xe_modparam;

total: 0 errors, 0 warnings, 1 checks, 158 lines checked


