Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B5BC369A1
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 09:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5E710E81C;
	Wed,  9 Apr 2025 09:19:03 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2B110E81A;
 Wed,  9 Apr 2025 09:19:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Disble_invalida?=
 =?utf-8?q?te_in_migration_job?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Apr 2025 09:19:02 -0000
Message-ID: <174419034243.51366.2958089803452083587@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409091210.1590853-1-dev@lankhorst.se>
In-Reply-To: <20250409091210.1590853-1-dev@lankhorst.se>
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

Series: drm/xe: Disble invalidate in migration job
URL   : https://patchwork.freedesktop.org/series/147452/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 79bf7f488960542607a5f63ff3d382d668f68273
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Wed Apr 9 11:12:10 2025 +0200

    drm/xe: Disble invalidate in migration job
    
    Lets see if things break?
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 163f93211dcf28cc82f6757bea3040ef7464a461 drm-intel
79bf7f488960 drm/xe: Disble invalidate in migration job
-:4: WARNING:TYPO_SPELLING: 'Disble' may be misspelled - perhaps 'Disable'?
#4: 
Subject: [PATCH] drm/xe: Disble invalidate in migration job
                         ^^^^^^

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


