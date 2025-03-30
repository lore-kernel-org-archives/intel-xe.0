Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A57C36010
	for <intel-xe@archiver.kernel.org>; Sun, 30 Mar 2025 17:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C51E10E0E5;
	Sun, 30 Mar 2025 17:05:55 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE4410E09B;
 Sun, 30 Mar 2025 17:05:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Invalidate_L3_r?=
 =?utf-8?q?ead-only_cachelines_for_geometry_streams_too_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kenneth Graunke" <kenneth@whitecape.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 30 Mar 2025 17:05:54 -0000
Message-ID: <174335435419.18741.16008171582869413354@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250330165923.56410-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250330165923.56410-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Invalidate L3 read-only cachelines for geometry streams too (rev4)
URL   : https://patchwork.freedesktop.org/series/146522/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5224c63cb0896423762b7738846647dcc723f28a
Author: Kenneth Graunke <kenneth@whitecape.org>
Date:   Sun Mar 30 12:59:23 2025 -0400

    drm/xe: Invalidate L3 read-only cachelines for geometry streams too
    
    Historically, the Vertex Fetcher unit has not been an L3 client.  That
    meant that, when a buffer containing vertex data was written to, it was
    necessary to issue a PIPE_CONTROL::VF Cache Invalidate to invalidate any
    VF L2 cachelines associated with that buffer, so the new value would be
    properly read from memory.
    
    Since Tigerlake and later, VERTEX_BUFFER_STATE and 3DSTATE_INDEX_BUFFER
    have included an "L3 Bypass Enable" bit which userspace drivers can set
    to request that the vertex fetcher unit snoop L3.  However, unlike most
    true L3 clients, the "VF Cache Invalidate" bit continues to only
    invalidate the VF L2 cache - and not any associated L3 lines.
    
    To handle that, PIPE_CONTROL has a new "L3 Read Only Cache Invalidation
    Bit", which according to the docs, "controls the invalidation of the
    Geometry streams cached in L3 cache at the top of the pipe."  In other
    words, the vertex and index buffer data that gets cached in L3 when
    "L3 Bypass Disable" is set.
    
    Mesa always sets L3 Bypass Disable so that the VF unit snoops L3, and
    whenever it issues a VF Cache Invalidate, it also issues a L3 Read Only
    Cache Invalidate so that both L2 and L3 vertex data is invalidated.
    
    xe is issuing VF cache invalidates too (which handles cases like CPU
    writes to a buffer between GPU batches).  Because userspace may enable
    L3 snooping, it needs to issue an L3 Read Only Cache Invalidate as well.
    
    Fixes significant flickering in Firefox on Meteorlake, which was writing
    to vertex buffers via the CPU between batches; the missing L3 Read Only
    invalidates were causing the vertex fetcher to read stale data from L3.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4460
    Cc: stable@vger.kernel.org # v6.13+
    Signed-off-by: Kenneth Graunke <kenneth@whitecape.org>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 9b76925c9c5bc22d87fb7c1f710aad326d45a6d5 drm-intel
5224c63cb089 drm/xe: Invalidate L3 read-only cachelines for geometry streams too
-:37: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#37: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4460

-:87: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 2 warnings, 0 checks, 34 lines checked


