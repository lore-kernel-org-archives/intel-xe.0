Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C7ACDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 10:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE82C10E19A;
	Mon, 16 Oct 2023 10:15:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0098E10E190;
 Mon, 16 Oct 2023 10:15:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F348CA0093;
 Mon, 16 Oct 2023 10:15:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Date: Mon, 16 Oct 2023 10:15:27 -0000
Message-ID: <169745132799.13508.8944574375849616570@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ev?=
 =?utf-8?q?ent_tracing_for_GuC_CTB?=
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

Series: Event tracing for GuC CTB
URL   : https://patchwork.freedesktop.org/series/125164/
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
commit af31d00c6c63bca710159e5af73d4a7e8d77fddb
Author: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Date:   Mon Oct 16 15:47:20 2023 +0530

    drm/xe/trace: Optimize trace definition
    
    Make use of EVENT_CLASS to group similar trace events
    
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch ab7cd1b4af95baba2d6ce5487d35ffda523e895d drm-intel
303093cab drm/xe: Add event tracing for CTB
-:86: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#86: FILE: drivers/gpu/drm/xe/xe_trace.h:575:
+		    TP_STRUCT__entry(

-:94: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#94: FILE: drivers/gpu/drm/xe/xe_trace.h:583:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 102 lines checked
af31d00c6 drm/xe/trace: Optimize trace definition
-:70: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#70: FILE: drivers/gpu/drm/xe/xe_trace.h:525:
+		    TP_STRUCT__entry(

-:78: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#78: FILE: drivers/gpu/drm/xe/xe_trace.h:533:
+		    TP_fast_assign(

total: 0 errors, 0 warnings, 2 checks, 91 lines checked


