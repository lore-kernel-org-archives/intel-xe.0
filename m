Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A58C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D98A10E032;
	Tue,  3 Jun 2025 18:32:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F251A10E032;
 Tue,  3 Jun 2025 18:32:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Add_WildCat_Lake_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 18:32:46 -0000
Message-ID: <174897556699.45504.5390857870262322902@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
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

Series: Add WildCat Lake support
URL   : https://patchwork.freedesktop.org/series/149794/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 48b1801a86335455559cf24ca626e86ce5c0a86b
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Jun 3 23:54:30 2025 +0530

    drm/xe: Add Wildcat Lake device IDs to PTL list
    
    Introduce wildcat lake device Id.
    Wildcat Lake uses slightly different graphics and media IP versions
    than Panther Lake, but can still be treated as PTL for general driver
    flows.
    
    Bspec: 73951
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
+ /mt/dim checkpatch ba486e3b10ce5b4ee4d1ffc58aa4cc3b669c02a3 drm-intel
0830e2c19e66 drm/i915/xe3lpd: Add support for display version 30.02
2156615f0c39 drm/xe/xe3: Add support for graphics IP version 30.03
b1dde4be8926 drm/xe/xe3: Add support for media IP version 30.02
fa332cc0ee4a drm/i915/xe3lpd: Update bandwidth parameters for display version 30.02
baa43addbe10 drm/i915: Set max cdclk for display 30.02
48b1801a8633 drm/xe: Add Wildcat Lake device IDs to PTL list


