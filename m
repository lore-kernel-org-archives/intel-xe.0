Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4498C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827FD10EB35;
	Thu, 27 Jun 2024 20:42:40 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2317210E392;
 Thu, 27 Jun 2024 20:42:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/mocs=3A_Update_MOCS_assertions_and_remove_redundant_?=
 =?utf-8?q?checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jun 2024 20:42:39 -0000
Message-ID: <171952095914.164687.10159815784723210510@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627203741.2042752-3-matthew.d.roper@intel.com>
In-Reply-To: <20240627203741.2042752-3-matthew.d.roper@intel.com>
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

Series: series starting with [1/2] drm/xe/mocs: Update MOCS assertions and remove redundant checks
URL   : https://patchwork.freedesktop.org/series/135489/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9519373dee8e9b981101d1f552c9718e4f8824d2
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Jun 27 13:37:43 2024 -0700

    drm/xe/mocs: Clarify difference between hw and sw sizes
    
    It's not very obvious what the difference is between the 'size' and
    'n_entries' fields of the MOCS structure.  Rename both fields slightly
    and add some comments explaining that one is the documentation-defined
    table size, while the other is the number of entries that can be
    programmed into the hardware (and the documented table size can
    potentially be smaller than the number of hardware entries).
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch cab79257e1f25f4b3411210b23fcca4f56daf15d drm-intel
902f85cebdd2 drm/xe/mocs: Update MOCS assertions and remove redundant checks
9519373dee8e drm/xe/mocs: Clarify difference between hw and sw sizes


