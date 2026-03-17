Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDC5FB5E9F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 00:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D8610E2F0;
	Tue, 17 Mar 2026 00:50:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7E910E06B;
 Tue, 17 Mar 2026 00:50:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_use_=25z_format?=
 =?utf-8?q?_string_for_ptrdiff=5Ft?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Mar 2026 00:50:51 -0000
Message-ID: <177370865104.364316.5974274776425389535@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316224357.658520-1-arnd@kernel.org>
In-Reply-To: <20260316224357.658520-1-arnd@kernel.org>
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

Series: drm/xe: use %z format string for ptrdiff_t
URL   : https://patchwork.freedesktop.org/series/163329/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3773a0a4bd7d40b1dabc6388f8f3d2deee15558b
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Mar 16 23:43:46 2026 +0100

    drm/xe: use %z format string for ptrdiff_t
    
    ptrdiff_t, size_t and long are the same size on all supported architectures,
    but gcc requires the use of the %zx modifier instead of %lx. On 32-bit
    targets, the wrong one produces this warning:
    
    drivers/gpu/drm/xe/xe_lrc.c:1913:7: error: format specifies type 'unsigned long' but the argument has type '__ptrdiff_t' (aka 'int') [-Werror,-Wformat]
     1912 |                 drm_printf(p, "LRC[%#5lx]  =  [%#010x] MI_NOOP (%d dwords)\n",
          |                                    ~~~~~
          |                                    %#5tx
     1913 |                            dw - num_noop - start, inst_header, num_noop);
          |                            ^~~~~~~~~~~~~~~~~~~~~
    
    Fixes: 65fcf19cb36b ("drm/xe: Include running dword offset in default_lrc dumps")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+ /mt/dim checkpatch a25d8c583e1e52bde77d371081a7c3fcd0a2e820 drm-intel
3773a0a4bd7d drm/xe: use %z format string for ptrdiff_t
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
ptrdiff_t, size_t and long are the same size on all supported architectures,

total: 0 errors, 1 warnings, 0 checks, 100 lines checked


