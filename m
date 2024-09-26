Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF10CF58C8
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 12:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD4F10EAE4;
	Thu, 26 Sep 2024 12:35:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0007A10EACC;
 Thu, 26 Sep 2024 12:35:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_xe=5Fgen=5Fwa?=
 =?utf-8?q?=5Foob=3A_replace_program=5Finvocation=5Fshort=5Fname?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Gomez via B4 Relay" <devnull+da.gomez.samsung.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 12:35:15 -0000
Message-ID: <172735411599.1106900.13881756896891716448@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925-macos-build-support-v3-1-233dda880e60@samsung.com>
In-Reply-To: <20240925-macos-build-support-v3-1-233dda880e60@samsung.com>
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

Series: drm/xe: xe_gen_wa_oob: replace program_invocation_short_name
URL   : https://patchwork.freedesktop.org/series/139088/
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
commit f2cf15734a356e4cebe80839f535d5dd723f66d4
Author: Daniel Gomez <da.gomez@samsung.com>
Date:   Wed Sep 25 12:49:00 2024 +0200

    drm/xe: xe_gen_wa_oob: replace program_invocation_short_name
    
    program_invocation_short_name() may not be available in other systems.
    Instead, replace it with the argv[0] to pass the executable name and
    make it portable.
    
    Fixes build error when program_invocation_short_name is not available:
    
    drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
    undeclared identifier 'program_invocation_short_name'    34 |
    program_invocation_short_name);       |                 ^ 1 error
    generated.
    
    Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
    Tested-by: Jeff Xie <xiehuan09@gmail.com>
    Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
+ /mt/dim checkpatch 6b498b1015e38b1b7dbd1c7e3ab0a9be5d48f4da drm-intel
f2cf15734a35 drm/xe: xe_gen_wa_oob: replace program_invocation_short_name


