Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D234EC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 21:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D9F10E0D4;
	Thu,  6 Feb 2025 21:50:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D651010E0D4;
 Thu,  6 Feb 2025 21:50:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/xe3lpd=3A_Update?=
 =?utf-8?q?_bandwidth_parameters?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 21:50:39 -0000
Message-ID: <173887863987.2248575.3577542513773119404@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206192148.53610-1-gustavo.sousa@intel.com>
In-Reply-To: <20250206192148.53610-1-gustavo.sousa@intel.com>
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

Series: drm/i915/xe3lpd: Update bandwidth parameters
URL   : https://patchwork.freedesktop.org/series/144440/
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
commit 01931cbc8659b3b2d0288442e432051321077823
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Thu Feb 6 16:21:30 2025 -0300

    drm/i915/xe3lpd: Update bandwidth parameters
    
    Bandwidth parameters for Xe3_LPD have been updated with respect to
    previous display releases. Encode them into xe3lpd_sa_info and use that
    new struct.
    
    Bspec: 68859
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch f2401c718ce075408a723b147cac70aad2a8246f drm-intel
08c7262980e2 drm/i915/display: Use display variable in intel_bw.c
5ea74c309f06 drm/i915/display: Use display-specific platform checks in intel_bw.c
01931cbc8659 drm/i915/xe3lpd: Update bandwidth parameters


