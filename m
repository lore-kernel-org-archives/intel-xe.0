Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05412C54E6A
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 10:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7ED51120D7;
	Fri, 15 Mar 2024 10:02:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8A31120D4;
 Fri, 15 Mar 2024 10:02:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Pcode_init_status_and_lme?=
 =?utf-8?q?m_check_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Mar 2024 10:02:20 -0000
Message-ID: <171049694005.795503.16598630243497940044@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240315100530.3051944-1-riana.tauro@intel.com>
In-Reply-To: <20240315100530.3051944-1-riana.tauro@intel.com>
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

Series: Pcode init status and lmem check (rev3)
URL   : https://patchwork.freedesktop.org/series/130904/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e2ed793da9e0119b12e95cb4f0ef8811575c4605
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Mar 15 15:35:30 2024 +0530

    RFC drm/xe: add fault injection for lmem init check
    
    add a boot time fault injection for lmem init check.
    This can be triggered by adding a modparam fail_lmem_init
    
    xe.fail_lmem_init=<interval>,<probability>,<space>,<times>
    
    Adding this causes the lmem init check to fail causing
    the probe to defer.
    
    v2: add fault injection (Lucas)
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 601f578c8c069e990adab2f8a6d94c549d7d0fe1 drm-intel
b0b30980d27b drm/xe: check pcode init status only on root gt of root tile
1c1592b60367 drm/xe: re-order lmem init check and wait for initialization to complete
e2ed793da9e0 RFC drm/xe: add fault injection for lmem init check


