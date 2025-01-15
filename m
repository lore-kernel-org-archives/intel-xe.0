Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B523DC02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 15:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E75B10E079;
	Wed, 15 Jan 2025 15:37:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1AF10E079;
 Wed, 15 Jan 2025 15:37:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_drm/xe=3A_Introduce_GuC_PC_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Jan 2025 15:37:03 -0000
Message-ID: <173695542344.3992211.608813167088081425@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250115145053.1142023-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250115145053.1142023-1-rodrigo.vivi@intel.com>
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

Series: series starting with [CI,1/2] drm/xe: Introduce GuC PC debugfs
URL   : https://patchwork.freedesktop.org/series/143559/
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
commit d350eb5126991cfdd25af3a30b952fd24ff4abbd
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Jan 15 09:50:53 2025 -0500

    drm/xe/lnl: Enable GuC SLPC DCC task
    
    Enable DCC (Duty Cycle Control) in Lunar Lake.
    
    DCC is the SLPC task that tries to keep
    the GT from operating inefficiently when thermally constrained.
    
    Although the recommendation is to enable it, LNL GuC is leaving
    it disabled by default on LNL.
    
    It would minimize the GT frequency oscillation on throttled
    scenarios, which could potentially reduce latencies.
    
    v2: Move set_policies call after wait for running state, so
        we ensure it is not overwritten. (Vinay)
    v3: Fix English in the commit message (Jonathan)
    v4: Also set disable to 0 so DCC can really get into effect.
    v5: Avoid lnl_ prefix (Vinay)
    v6: Finish renaming...
    
    Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v3
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f28dfb722dce66482e5d1741deae312d96c29ee0 drm-intel
63652e24ba91 drm/xe: Introduce GuC PC debugfs
d350eb512699 drm/xe/lnl: Enable GuC SLPC DCC task


