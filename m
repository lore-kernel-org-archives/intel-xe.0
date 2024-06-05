Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE2FC27C50
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 01:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E796410E681;
	Wed,  5 Jun 2024 01:54:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136C10E681;
 Wed,  5 Jun 2024 01:54:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vm=3A_Simplify_if_?=
 =?utf-8?q?condition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thorsten Blum" <thorsten.blum@toblux.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Jun 2024 01:54:36 -0000
Message-ID: <171755247659.2266479.9546678874482304024@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240603180005.191578-1-thorsten.blum@toblux.com>
In-Reply-To: <20240603180005.191578-1-thorsten.blum@toblux.com>
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

Series: drm/xe/vm: Simplify if condition
URL   : https://patchwork.freedesktop.org/series/134444/
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
commit 50c399b1814a306f06563979e3a6091fcb9c0606
Author: Thorsten Blum <thorsten.blum@toblux.com>
Date:   Mon Jun 3 20:00:07 2024 +0200

    drm/xe/vm: Simplify if condition
    
    The if condition !A || A && B can be simplified to !A || B.
    
    Fixes the following Coccinelle/coccicheck warning reported by
    excluded_middle.cocci:
    
            WARNING !A || A && B is equivalent to !A || B
    
    Compile-tested only.
    
    Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 596cf447db94909c4788fd612876520531e439b0 drm-intel
50c399b1814a drm/xe/vm: Simplify if condition


