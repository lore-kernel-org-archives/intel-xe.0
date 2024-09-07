Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E0CCE7B04
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 01:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFAF10E74E;
	Sat,  7 Sep 2024 01:14:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF8F10E74E;
 Sat,  7 Sep 2024 01:14:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Enable_Xe2+_?=
 =?utf-8?q?PES_disaggregation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Sep 2024 01:14:10 -0000
Message-ID: <172567165070.955479.4152817900932192675@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906221010.2461123-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240906221010.2461123-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/oa: Enable Xe2+ PES disaggregation
URL   : https://patchwork.freedesktop.org/series/138352/
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
commit 21b43d54525fe104c84b9ce6e88240458c20f109
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Sep 6 15:10:10 2024 -0700

    drm/xe/oa: Enable Xe2+ PES disaggregation
    
    Xe2+ PES disaggregation for OAG needs to be enabled to obtain disaggregated
    metrics when disaggregated data is needed. There is no uapi impact of this
    change.
    
    v2: Minor change to commit message
    
    Bspec: 61101
    Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a drm-intel
21b43d54525f drm/xe/oa: Enable Xe2+ PES disaggregation


