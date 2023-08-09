Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1446EEB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 12:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8B010E42E;
	Wed,  9 Aug 2023 12:35:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF8B410E42E;
 Wed,  9 Aug 2023 12:35:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DC7BBA00E8;
 Wed,  9 Aug 2023 12:35:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Date: Wed, 09 Aug 2023 12:35:50 -0000
Message-ID: <169158455090.10297.15692094618238616761@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20230809120730.383981-1-ravi.kumar.vodapalli@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Di?=
 =?utf-8?q?fferent_platforms_has_different_PAT_encoding_in_PTE_and_PDE_for?=
 =?utf-8?q?mat=2C_add_correct_PAT_encoding_for_pre-Xe2_platforms_=28XELP?=
 =?utf-8?q?=2C_XEHPC=2C_XELPG=29=2E?=
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

Series: Different platforms has different PAT encoding in PTE and PDE format, add correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
URL   : https://patchwork.freedesktop.org/series/122222/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e4883ffba7246ab9eab554de57c042e452da9f1a
Author: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Date:   Wed Aug 9 17:37:30 2023 +0530

    Different platforms has different PAT encoding in PTE and PDE format, add correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
    
    Bspec: 45101, 71582
    Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
+ /mt/dim checkpatch 2ef5b2cdba32ac15df104b1a7f0464df8839f7b0 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


