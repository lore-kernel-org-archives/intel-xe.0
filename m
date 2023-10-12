Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2415CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 06:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955E810E415;
	Thu, 12 Oct 2023 06:28:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4DCA510E415;
 Thu, 12 Oct 2023 06:28:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4C5F9AADD8;
 Thu, 12 Oct 2023 06:28:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Thu, 12 Oct 2023 06:28:48 -0000
Message-ID: <169709212831.25007.16926442559349069476@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231012063209.56824-1-riana.tauro@intel.com>
In-Reply-To: <20231012063209.56824-1-riana.tauro@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?move_GuC_Reset_in_D3Hot_path_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Remove GuC Reset in D3Hot path (rev2)
URL   : https://patchwork.freedesktop.org/series/122772/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d8415d3d11cc1608d81fcf3c30e6f316f760623d
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Oct 12 12:02:09 2023 +0530

    drm/xe: Toggle GuC CT communication for D3Hot Transition
    
    During Runtime suspend/resume, GuC is reloaded for both
    D3hot/D3Cold-> D0 transistions. It is not necessary for GuC to be
    loaded everytime for D3hot->D0, only enable/disable ctb communication.
    
    Add a function that toggles CT communication when d3cold
    is not allowed.
    
    v2: simplify code (Bala)
        handle pmu suspend in runtime suspend (Rodrigo)
        change function names
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
3b4e1e0d5 drm/xe: Add helper functions to toggle CT communication
d8415d3d1 drm/xe: Toggle GuC CT communication for D3Hot Transition


