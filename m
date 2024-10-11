Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CB1D2447F
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 06:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC88C10EA39;
	Fri, 11 Oct 2024 06:13:19 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E7B10EA39;
 Fri, 11 Oct 2024 06:13:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_add_system_memo?=
 =?utf-8?q?ry_page_iterator_support_to_xe=5Fres=5Fcursor_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hajda" <andrzej.hajda@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Oct 2024 06:13:18 -0000
Message-ID: <172862719888.1238837.1082413321037067016@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com>
In-Reply-To: <20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com>
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

Series: drm/xe: add system memory page iterator support to xe_res_cursor (rev2)
URL   : https://patchwork.freedesktop.org/series/139780/
State : warning

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
commit f3440e1ff029be427e09aa1247778abd0375c778
Author: Hajda <andrzej.hajda@intel.com>
Date:   Fri Oct 11 08:05:43 2024 +0200

    drm/xe: add system memory page iterator support to xe_res_cursor
    
    Currently xe_res_cursor allows iteration only over DMA side of sg tables.
    Adding possibility to iterate over pages allows the use of cursor in more
    contexts.
    
    v2: fixed wording in commit message(Jonathan)
    
    Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch f3354eab2a45420cf38a67f6d7735d5dff53eb6f drm-intel
f3440e1ff029 drm/xe: add system memory page iterator support to xe_res_cursor
-:44: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#44: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:148:
+static inline void __xe_res_first_sg(const struct sg_table *sg,
+				   u64 start, u64 size,

-:86: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#86: FILE: drivers/gpu/drm/xe/xe_res_cursor.h:189:
+static inline void xe_res_first_sg_system(const struct sg_table *sg,
+				   u64 start, u64 size,

-:92: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: Hajda <andrzej.hajda@intel.com>' != 'Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>'

total: 0 errors, 1 warnings, 2 checks, 71 lines checked


