Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918D1C79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 14:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B48710F1AB;
	Wed,  9 Sep 2026 14:10:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0D10E358;
 Wed,  9 Sep 2026 14:09:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Access_counter_squash?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 14:09:59 -0000
Message-ID: <178896299934.143074.16426451934288641528@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909140650.1639482-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260909140650.1639482-2-himal.prasad.ghimiray@intel.com>
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

Series: Access counter squash
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
commit 4ebb5520b3f8b22179249ce1b5bf1f020b64a84c
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Sep 9 19:36:47 2026 +0530

    Access counter squash
+ /mt/dim checkpatch 5d8ee99db6673736cbd5d5d4c0d6612fe07d94ff drm-intel
4ebb5520b3f8 Access counter squash
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:61: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#61: 
new file mode 100644

-:1593: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1593: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:133:
+	    TP_STRUCT__entry(

-:1603: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1603: FILE: drivers/gpu/drm/xe/xe_trace_bo.h:143:
+	    TP_fast_assign(

-:2232: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 2 checks, 2032 lines checked


