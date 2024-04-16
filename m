Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F49BC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 18:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97E810F2BB;
	Tue, 16 Apr 2024 18:56:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DD410F2BB;
 Tue, 16 Apr 2024 18:56:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/display=3A_Unify_DPT_mapping_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 18:56:49 -0000
Message-ID: <171329380969.1445385.3872138182003753299@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416181406.124125-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240416181406.124125-1-juhapekka.heikkila@gmail.com>
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

Series: series starting with [1/2] drm/xe/display: Unify DPT mapping (rev2)
URL   : https://patchwork.freedesktop.org/series/132510/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fae1e565f2e5fbb878df0dbfb24f3f7fc481a38f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5a36038b9257d460a3659c82d15910f87c58cc46
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Tue Apr 16 21:14:06 2024 +0300

    drm/xe/display: limit dpt creation to device where it's used
    
    If running on discrete graphics dpt cannot be used from system memory
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch cc9471acb3130ab40ad1fa622899b01688236474 drm-intel
aa5443360c9b drm/xe/display: Unify DPT mapping
5a36038b9257 drm/xe/display: limit dpt creation to device where it's used
-:19: CHECK:BRACES: Unbalanced braces around else statement
#19: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:97:
+	else {

total: 0 errors, 0 warnings, 1 checks, 27 lines checked


