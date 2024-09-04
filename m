Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C522FCD4857
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 16:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EF810E41E;
	Wed,  4 Sep 2024 16:29:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7C210E41E;
 Wed,  4 Sep 2024 16:29:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Cleanup_has=5Fflat=5Fccs_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Sep 2024 16:29:57 -0000
Message-ID: <172546739735.933961.9693798921630620065@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240904162238.2831202-1-lucas.demarchi@intel.com>
In-Reply-To: <20240904162238.2831202-1-lucas.demarchi@intel.com>
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

Series: series starting with [1/2] drm/xe: Cleanup has_flat_ccs handling
URL   : https://patchwork.freedesktop.org/series/138219/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c2b2f71d02467cd03ead217af86df578a7957364
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Sep 4 09:22:38 2024 -0700

    drm/xe: Update runtime detection of has_flat_ccs
    
    It's confusing to have a *set* function that actually probes the
    hardware rather than receiving a parameter. Rename it to *probe* along
    with prefix removal and comment in the relevant places that the
    has_flat_ccs flag may be overridden in runtime.
    
    While at it, fix the mixed declaration of struct xe_gt.
    
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c72d3ffc0308b71024de6f80c3596668991c67ea drm-intel
ee5f57f61fac drm/xe: Cleanup has_flat_ccs handling
c2b2f71d0246 drm/xe: Update runtime detection of has_flat_ccs


