Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D59C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 22:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40A610E50B;
	Mon, 24 Feb 2025 22:21:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BD710E504;
 Mon, 24 Feb 2025 22:21:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_xe=5Fgen=5Fwa?=
 =?utf-8?q?=5Foob=3A_replace_program=5Finvocation=5Fshort=5Fname_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniel Gomez via B4 Relay" <devnull+da.gomez.samsung.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 22:21:28 -0000
Message-ID: <174043568868.1742692.1542532731383759701@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
In-Reply-To: <20250224-macos-build-support-xe-v3-1-d2c9ed3a27cc@samsung.com>
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

Series: drm/xe: xe_gen_wa_oob: replace program_invocation_short_name (rev2)
URL   : https://patchwork.freedesktop.org/series/139088/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4d5483eb4a627e23024b9c9816ccaf522a2610ab
Author: Daniel Gomez <da.gomez@samsung.com>
Date:   Mon Feb 24 07:23:13 2025 +0100

    drm/xe: xe_gen_wa_oob: replace program_invocation_short_name
    
    program_invocation_short_name() may not be available in other systems.
    Instead, replace it with the argv[0] to pass the executable name.
    
    Fixes build error when program_invocation_short_name is not available:
    
    drivers/gpu/drm/xe/xe_gen_wa_oob.c:34:3: error: use of
    undeclared identifier 'program_invocation_short_name'    34 |
    program_invocation_short_name);       |                 ^ 1 error
    generated.
    
    Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
    Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
+ /mt/dim checkpatch 0bd853a9790bbe9c4ccf3bf2c521958d1df41d54 drm-intel
4d5483eb4a62 drm/xe: xe_gen_wa_oob: replace program_invocation_short_name


