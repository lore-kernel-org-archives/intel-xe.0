Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BDBC67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 17:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E6610ED62;
	Fri,  5 Apr 2024 17:21:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3020D10ED70;
 Fri,  5 Apr 2024 17:21:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Check_pat=2Eops?=
 =?utf-8?q?_before_dumping_PAT_settings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 17:21:53 -0000
Message-ID: <171233771319.1239316.16778141201322484278@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405143625.935-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240405143625.935-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Check pat.ops before dumping PAT settings
URL   : https://patchwork.freedesktop.org/series/132085/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f6cb0876c70567fce1da54403d0b2fef969f67d6
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Apr 5 16:36:25 2024 +0200

    drm/xe: Check pat.ops before dumping PAT settings
    
    We may leave pat.ops unset when running on brand new platform or
    when running as a VF.  While the former is unlikely, the latter
    is valid (future) use case and will cause NPD when someone will
    try to dump PAT settings by debugfs.
    
    It's better to check pointer to pat.ops instead of specific .dump
    hook, as we have this hook always defined for every .ops variant.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 8cb1ee178ef7e504e233814ef50c1f18f42dac72 drm-intel
f6cb0876c705 drm/xe: Check pat.ops before dumping PAT settings


