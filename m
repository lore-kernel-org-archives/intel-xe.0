Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98E5C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 19:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41AD10EA07;
	Mon, 29 Jan 2024 19:49:30 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7C10EA07;
 Mon, 29 Jan 2024 19:49:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Add_SVG_state_table_for_Xe2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Mon, 29 Jan 2024 19:49:29 -0000
Message-ID: <170655776954.806672.13638156383053910035@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129194615.282624-1-jose.souza@intel.com>
In-Reply-To: <20240129194615.282624-1-jose.souza@intel.com>
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

Series: series starting with [1/2] drm/xe: Add SVG state table for Xe2
URL   : https://patchwork.freedesktop.org/series/129280/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fe4ac49a5456241680caddbc5e37e46451c7590a
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Mon Jan 29 11:46:15 2024 -0800

    drm/xe: Use functions to emit PIPE_CONTROL
    
    This reduces boring code duplicating in xe_ring_ops.
    
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch f4c0dac89bd3cd02a1afe5e7a91ed4bf8de4afc6 drm-intel
db09689d5 drm/xe: Add SVG state table for Xe2
-:9: WARNING:TYPO_SPELLING: 'lenght' may be misspelled - perhaps 'length'?
#9: 
3DSTATE_HS has a different lenght than gfx1255+ platforms.
                           ^^^^^^

total: 0 errors, 1 warnings, 0 checks, 74 lines checked
fe4ac49a5 drm/xe: Use functions to emit PIPE_CONTROL
-:21: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#21: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:116:
+static int emit_pipe_control_full(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset, u32 value)

total: 0 errors, 1 warnings, 0 checks, 91 lines checked


