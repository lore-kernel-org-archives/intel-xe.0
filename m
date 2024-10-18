Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DB7D3F29E
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 21:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF1C10E8F3;
	Fri, 18 Oct 2024 21:25:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E63010E8F3;
 Fri, 18 Oct 2024 21:25:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_=28CI=29_drm/xe=3A_Fix_in?=
 =?utf-8?q?itial_framebuffer_handover=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 21:25:51 -0000
Message-ID: <172928675118.1294974.2076299319267782753@2413ebb6fbb6>
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

Series: (CI) drm/xe: Fix initial framebuffer handover. (rev2)
URL   : https://patchwork.freedesktop.org/series/140183/
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
commit 809e267948afbeada0b9e7eb990ea9a83d04ee5b
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Oct 18 22:05:15 2024 +0200

    drm/xe: Initialise display before GT and tile init
    
    Display needs to be initialised first, because we need to preserve the
    initial framebuffer. It will be overwritten by any allocation we do,
    especially on discrete where the framebuffer is not in stolen memory.
    
    On integrated even if we still recover the initial framebuffer after
    allocating, it still shows up as temporary corruption on-screen.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch fe768c9d3f0cfbe30a1dddf3ae2319d1e04a4403 drm-intel
766172064245 drm/xe: Remove double pageflip
d0df8f89e0f7 drm/i915/display: Use async flip when available for initial plane config
6a5312c82d72 drm/xe: Move suballocator init to after display init
809e267948af drm/xe: Initialise display before GT and tile init


