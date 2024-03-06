Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70429C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 19:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9351134AB;
	Wed,  6 Mar 2024 19:30:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9521134AB;
 Wed,  6 Mar 2024 19:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_Remove_unused_FF=5FSLICE=5FCS=5FCHICKEN2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 19:30:42 -0000
Message-ID: <170975344244.562292.16752910416653303871@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240306192128.1895603-1-lucas.demarchi@intel.com>
In-Reply-To: <20240306192128.1895603-1-lucas.demarchi@intel.com>
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

Series: series starting with [1/2] drm/xe: Remove unused FF_SLICE_CS_CHICKEN2
URL   : https://patchwork.freedesktop.org/series/130825/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f1fa2a50ad6a758b35c6f8f6460ae791e467b100
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Mar 6 11:21:28 2024 -0800

    drm/xe/pvc: Fix WA 18020744125
    
    With the current state GUC_WA_RCS_REGS_IN_CCS_REGS_LIST could in theory
    be removed since there is no render register being added to the list of
    compute WAs. However the real issue is that 18020744125 is incomplete
    and not setting the RING_HWSTAM on render as it should.
    
    Writing this in RTP is a little more tricky as we want to write to
    another's engine base when the match happens: first compute engine and
    no render present. So use RING_HWSTAM(RENDER_RING_BASE) instead of the
    usual XE_RTP_ACTION_FLAG(ENGINE_BASE).
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e96742a33719079709b8e180448b491622e6a427 drm-intel
f5d7a2cb7391 drm/xe: Remove unused FF_SLICE_CS_CHICKEN2
f1fa2a50ad6a drm/xe/pvc: Fix WA 18020744125


