Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A318EC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 11:14:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6A610F439;
	Thu, 10 Sep 2026 11:14:47 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E25410F439;
 Thu, 10 Sep 2026 11:14:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Access_counter_squash_=28?=
 =?utf-8?q?rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 11:14:46 -0000
Message-ID: <178903888624.146745.9856360854332618499@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910111204.1708465-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260910111204.1708465-2-himal.prasad.ghimiray@intel.com>
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

Series: Access counter squash (rev3)
URL   : https://patchwork.freedesktop.org/series/173728/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 58f8b677b1a7129f3dfe994816698fc44ab05b87
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Sep 10 16:42:03 2026 +0530

    Access counter squash
+ /mt/dim checkpatch 5adc9763607d7b5dd14ff99e6dcab3cd2dc2d225 drm-intel
58f8b677b1a7 Access counter squash
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

-:1647: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1647: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:133:
+	    TP_STRUCT__entry(

-:1657: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1657: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:143:
+	    TP_fast_assign(

-:2286: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 2 checks, 2083 lines checked


