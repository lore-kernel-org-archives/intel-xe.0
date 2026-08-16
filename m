Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F169C5DF66
	for <intel-xe@archiver.kernel.org>; Sun, 16 Aug 2026 09:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3D310E1D3;
	Sun, 16 Aug 2026 09:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+XeW7F5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FBF10E1D3
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Aug 2026 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786874192; x=1818410192;
 h=date:from:to:cc:subject:message-id;
 bh=sWm9ZZ/Oryhl2PQ34fEvfrhEMOlZGBCUiDjQlnC8fDI=;
 b=A+XeW7F5TeVj2bsZYbKH9lhuWwDnALnHY8xX22Wo7qye8lpGRMOJbFXp
 OOxHtu/eAzyiAcah8Fq3/7hJZusTvQH7pVDaR9y2mqOqj46nKp8zZ5Ln8
 eq31EKgOe5EU3wSgphmZPyJMCz1mt+AYYKRyO5Gg/I5xq3xIR2UTmyVYa
 04lv+fm9i/v8kmg6V2Hm1CKtJ5EIxaygpB5Fiyb5rII5I3+Zf/kTGe+p0
 Czm4cjVmXVVsGW0WeSpSZSwPlintsZBu6iqWL8ctxTRwSrgAq+APCy0B5
 /qr6o9t5k3gK6CDfYBawt9uCZlX77eTqreHCRrzshwflMG6bMw33dj6+r Q==;
X-CSE-ConnectionGUID: vYiqvEcKSN6uYRlDYk8q/Q==
X-CSE-MsgGUID: M5Vsi545R+Sos/BzwNKVhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87447302"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; d="scan'208";a="87447302"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2026 02:56:31 -0700
X-CSE-ConnectionGUID: P2wG91A4TFe/KUl3W/6Nlg==
X-CSE-MsgGUID: XuUy4k+FSfam74Y78QQFsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; d="scan'208";a="262875044"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 16 Aug 2026 02:56:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wvXbP-00000000cqs-49XQ;
 Sun, 16 Aug 2026 09:56:27 +0000
Date: Sun, 16 Aug 2026 17:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [drm-xe:drm-xe-next] BUILD SUCCESS
 b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6
Message-ID: <202608161744.AY2utCpX-lkp@intel.com>
User-Agent: s-nail v14.9.25
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

tree/branch: https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
branch HEAD: b4f95affc66ef76342c1f6bf3849f6c8ade6b9d6  drm/xe/pci: Report 'cannot re-enable' error using SIGID

elapsed time: 1310m

configs tested: 14
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-16.1.0
alpha           allyesconfig    gcc-16.1.0
alpha              defconfig    gcc-16.1.0
arc             allmodconfig    gcc-16.1.0
arc             allyesconfig    gcc-16.1.0
csky            allmodconfig    gcc-16.1.0
i386            allmodconfig    gcc-14
loongarch          defconfig    clang-24
nios2           allmodconfig    gcc-11.5.0
nios2            allnoconfig    gcc-11.5.0
parisc          allmodconfig    gcc-16.1.0
parisc             defconfig    gcc-16.1.0
sh                 defconfig    gcc-16.1.0
sh         rsk7269_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
