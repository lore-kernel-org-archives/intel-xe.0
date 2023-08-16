Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6070C27C52
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 21:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E51310E3DE;
	Wed, 16 Aug 2023 21:57:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F0DBF10E3D9;
 Wed, 16 Aug 2023 21:57:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id ED018AADEC;
 Wed, 16 Aug 2023 21:57:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Wed, 16 Aug 2023 21:57:44 -0000
Message-ID: <169222306496.10285.16305559224297522692@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230816215515.1506619-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230816215515.1506619-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe/uc=3A_rework_uC_version_tracking?=
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

Series: drm/xe/uc: rework uC version tracking
URL   : https://patchwork.freedesktop.org/series/122542/
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
commit f403388e2324eddd9506de94b2347669d7222ca4
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Aug 16 14:55:15 2023 -0700

    drm/xe/uc: rework uC version tracking
    
    The GSC firmware, support for which is coming soon for Xe, has both a
    release version (updated on every release) and a compatibility version
    (update only on interface changes). The GuC has something similar, with
    a global release version and a submission version (which is also known
    as the VF compatibility version). The main difference is that for the
    GuC we still want to check the driver requirement against the release
    version, while for the GSC we'll need to check against the compatibility
    version.
    Instead of special casing the GSC, this patch proposes a rework of the
    FW logic so that we store both versions at the uc_fw level for all
    binaries and we allow checking against either of the versions. Initially,
    we'll use it to support GSC, but the logic could be re-used to allow VFs
    to check against their expected GuC compatibility version.
    
    RFC note: I've added a couple of the GSC defines to show how this is
    supposed to be different for the GSC, but those are not intended to be
    part of this patch in its final version. I'd like to get some early
    feedback on this before I build the full GSC version checking on top of
    it.
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Zhanjun Dong <zhanjun.dong@intel.com>
+ /mt/dim checkpatch c605cfb9a29a5425541053b45efddbe9751cbad3 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


