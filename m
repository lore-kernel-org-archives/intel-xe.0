Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AB1D637A0
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 17:26:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED83510E111;
	Wed, 13 Nov 2024 17:26:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A040510E111;
 Wed, 13 Nov 2024 17:26:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Flrc=3A_Fix_co?=
 =?utf-8?q?ntext_descriptors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 17:26:47 -0000
Message-ID: <173151880765.3708786.4417963011739096621@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113152946.62418-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241113152946.62418-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_lrc: Fix context descriptors (rev2)
URL   : https://patchwork.freedesktop.org/series/141253/
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
commit 9fcab8a8e8f7b2c2940142cb2eb60fb076b91672
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Wed Nov 13 15:29:46 2024 +0000

    drm/xe/xe_lrc: Fix context descriptors
    
    The direct and indirect context descriptors in xe_lrc_snapshot have
    various problems:
    
    - context_desc uses an incomplete 32-bit offset into the GGTT at which
      the LRC resides.  This is not the same thing as the descriptor itself,
      which is reported by the function xe_lrc_descriptor.
    
    - indirect_context_desc currently only reports the indirect ring state,
      as described at xe_lrc_indirect_ring_ggtt_addr.  The variable name
      does not accurately reflect its purpose and should be changed.
    
    Fix these issues.
    
    v2:
    - Properly convert context_desc into a 64-bit address (Matt)
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: Matt Roper <matthew.d.roper@intel.com>
    CC: John Harrison <john.c.harrison@intel.com>
+ /mt/dim checkpatch 169c7cd31a373ed31054abb423981856eb5fb119 drm-intel
9fcab8a8e8f7 drm/xe/xe_lrc: Fix context descriptors


