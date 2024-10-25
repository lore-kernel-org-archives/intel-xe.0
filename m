Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB8FD1038E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 01:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B46210E274;
	Fri, 25 Oct 2024 01:30:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F39310E274;
 Fri, 25 Oct 2024 01:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_=28CI=29_drm/xe=3A_Fix_in?=
 =?utf-8?q?itial_framebuffer_handover=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 01:30:36 -0000
Message-ID: <172981983638.1330038.4353911043738050382@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
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

Series: (CI) drm/xe: Fix initial framebuffer handover. (rev5)
URL   : https://patchwork.freedesktop.org/series/140183/
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
commit 9674a8122737838411b70485404d486d54ba36cf
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Oct 24 17:15:19 2024 +0200

    drm/xe: Initialise display before GT and tile init
    
    Display needs to be initialised first, because we need to preserve the
    initial framebuffer. It will be overwritten by any allocation we do,
    especially on discrete where the framebuffer is not in stolen memory.
    
    On integrated even if we still recover the initial framebuffer after
    allocating, it still shows up as temporary corruption on-screen.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 75eab7b9ee32a121d95a42ac704b679097f1fac4 drm-intel
b92d609db116 drm/xe: Remove double pageflip
0a12200eadc9 drm/i915/display: Use async flip when available for initial plane config
3241ee3c49a1 drm/xe: Move suballocator init to after display init
9674a8122737 drm/xe: Initialise display before GT and tile init
-:250: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#250: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:435:
+		bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
+						XE_BO_FLAG_SYSTEM |

total: 0 errors, 0 warnings, 1 checks, 210 lines checked


