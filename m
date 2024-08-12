Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B39C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 18:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16B810E273;
	Mon, 12 Aug 2024 18:19:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A3D10E273;
 Mon, 12 Aug 2024 18:19:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Name_and_docume?=
 =?utf-8?q?nt_Wa=5F14019789679?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 18:19:13 -0000
Message-ID: <172348675362.595846.8953612287711238346@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812181042.2013508-2-matthew.d.roper@intel.com>
In-Reply-To: <20240812181042.2013508-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Name and document Wa_14019789679
URL   : https://patchwork.freedesktop.org/series/137200/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 93570dd517f19d076211dd0700d9e33de7bd836b
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Mon Aug 12 11:10:43 2024 -0700

    drm/xe: Name and document Wa_14019789679
    
    Early in the development of Xe we identified an issue with SVG state
    handling on DG2 and MTL (and later on Xe2 as well).  In
    commit 72ac304769dd ("drm/xe: Emit SVG state on RCS during driver load
    on DG2 and MTL") and commit fb24b858a20d ("drm/xe/xe2: Update SVG state
    handling") we implemented our own workaround to prevent SVG state from
    leaking from context A to context B in cases where context B never
    issues a specific state setting.
    
    The hardware teams have now created official workaround Wa_14019789679
    to cover this issue.  The workaround description only requires emitting
    3DSTATE_MESH_CONTROL, since they believe that's the only SVG instruction
    that would potentially remain unset by a context B, but still cause
    notable issues if unwanted values were inherited from context A.
    However since we already have a more extensive implementation that emits
    the entire SVG state and prevents _any_ SVG state from unintentionally
    leaking, we'll stick with our existing implementation just to be safe.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 4f95bd933f4dacd22752bf8d6e548e8cc445d093 drm-intel
93570dd517f1 drm/xe: Name and document Wa_14019789679


