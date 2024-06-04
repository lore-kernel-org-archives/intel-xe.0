Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13DDC27C50
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 22:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC56D10E61C;
	Tue,  4 Jun 2024 22:47:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2166410E61C;
 Tue,  4 Jun 2024 22:47:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Avoid_fbdev_suspend_at_runtime_pm_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Jun 2024 22:47:08 -0000
Message-ID: <171754122813.2266114.9406927111036651488@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603215218.14278-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240603215218.14278-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/2] drm/xe: Avoid fbdev suspend at runtime pm suspend
URL   : https://patchwork.freedesktop.org/series/134416/
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
commit 26d74c3934c9814d5b61f70c5aaf267091a5870f
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Jun 3 17:52:18 2024 -0400

    drm/xe: Ensure d3cold is only allowed in DGFX
    
    For our integrated parts, the GPU is part of the CPU package,
    hence removing the power at the root port is likely not possible.
    
    Let's add this extra layer of protection to ensure that we are
    really not seeing d3cold atempts into integrated devices.
    
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
5c2873c34b08 drm/xe: Avoid fbdev suspend at runtime pm suspend
26d74c3934c9 drm/xe: Ensure d3cold is only allowed in DGFX


