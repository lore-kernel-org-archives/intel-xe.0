Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2220DC27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 20:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEDD10ECF8;
	Fri,  7 Jun 2024 20:07:59 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C5310ECF8;
 Fri,  7 Jun 2024 20:07:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_devcoredump=3A_Add_dev=5Fcoredumpm=5Ftimeout=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 20:07:58 -0000
Message-ID: <171779087880.28455.8844051093845183909@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607193220.229760-1-jose.souza@intel.com>
In-Reply-To: <20240607193220.229760-1-jose.souza@intel.com>
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

Series: series starting with [v4,1/2] devcoredump: Add dev_coredumpm_timeout()
URL   : https://patchwork.freedesktop.org/series/134632/
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
commit 3f3776fcef61c70d846fe6087a6419ed11073e8e
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Fri Jun 7 12:32:20 2024 -0700

    drm/xe: Increase devcoredump timeout
    
    5 minutes is too short for a regular user to search and understand
    what he needs to do to report capture devcoredump and report a bug to
    us, so here increasing this timeout to 1 hour.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 2bea08bd31298d60d416b2a6ed346bb53dd28037 drm-intel
0613358a966c devcoredump: Add dev_coredumpm_timeout()
3f3776fcef61 drm/xe: Increase devcoredump timeout


