Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBFBC47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 17:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3EB10E326;
	Thu, 25 Jan 2024 17:38:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191F210E31B;
 Thu, 25 Jan 2024 17:38:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fguc=3A_Reduce?=
 =?utf-8?q?_a_print_from_warn_to_debug_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Date: Thu, 25 Jan 2024 17:38:18 -0000
Message-ID: <170620429810.727567.17363099851881451869@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125165652.3764711-1-karthik.poosa@intel.com>
In-Reply-To: <20240125165652.3764711-1-karthik.poosa@intel.com>
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

Series: drm/xe/xe_guc: Reduce a print from warn to debug (rev3)
URL   : https://patchwork.freedesktop.org/series/129168/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
b2ca823f819193c33ab811dfac08c614138d6d46
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 25fc19d335396772e2d01f50ecad87aced854188
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu Jan 25 22:26:52 2024 +0530

    drm/xe/xe_guc: Reduce a print from warn to debug
    
    Reduce debug print from warn to debug to avoid uncessary
    warning message in dmesg (Lucas).
    
    Fixes: c5a06c9169f3 ("drm/xe/guc: Enable WA 14018913170")
    Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 38a58d4231067e1b548c12ee521b73ffc0ebb73a drm-intel
25fc19d33 drm/xe/xe_guc: Reduce a print from warn to debug
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'c5a06c9169f3', maybe rebased or not pulled?
#9: 
Fixes: c5a06c9169f3 ("drm/xe/guc: Enable WA 14018913170")

total: 0 errors, 1 warnings, 0 checks, 10 lines checked


