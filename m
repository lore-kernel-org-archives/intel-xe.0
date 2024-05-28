Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8EBC25B7C
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 13:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116AD10E50D;
	Tue, 28 May 2024 13:39:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D241122B2;
 Tue, 28 May 2024 13:39:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_replace_format-?=
 =?utf-8?q?less_snprintf=28=29_with_strscpy=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 May 2024 13:39:14 -0000
Message-ID: <171690355473.2216896.17060811231803494277@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240528133251.2310868-1-arnd@kernel.org>
In-Reply-To: <20240528133251.2310868-1-arnd@kernel.org>
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

Series: drm/xe: replace format-less snprintf() with strscpy()
URL   : https://patchwork.freedesktop.org/series/134140/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e640d62e4f7fe7ff11315fcdde6d49c07f7fbbfa
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue May 28 15:32:36 2024 +0200

    drm/xe: replace format-less snprintf() with strscpy()
    
    Using snprintf() with a format string from task->comm is a bit
    dangerous since the string may be controlled by unprivileged
    userspace:
    
    drivers/gpu/drm/xe/xe_devcoredump.c: In function 'devcoredump_snapshot':
    drivers/gpu/drm/xe/xe_devcoredump.c:184:9: error: format not a string literal and no format arguments [-Werror=format-security]
      184 |         snprintf(ss->process_name, sizeof(ss->process_name), process_name);
          |         ^~~~~~~~
    
    In this case there is no reason for an snprintf(), so use a simpler
    string copy.
    
    Fixes: b10d0c5e9df7 ("drm/xe: Add process name to devcoredump")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch 74ca368d029a2f7918fd2702caa402c156821cca drm-intel
e640d62e4f7f drm/xe: replace format-less snprintf() with strscpy()
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
  184 |         snprintf(ss->process_name, sizeof(ss->process_name), process_name);

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


