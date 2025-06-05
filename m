Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7909C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 22:36:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A458510EA90;
	Thu,  5 Jun 2025 22:36:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8963110EA8A;
 Thu,  5 Jun 2025 22:36:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Crashlog_Type1_Version2_s?=
 =?utf-8?q?upport_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 22:36:34 -0000
Message-ID: <174916299455.53928.3319779615867898776@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
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

Series: Crashlog Type1 Version2 support (rev3)
URL   : https://patchwork.freedesktop.org/series/149120/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 29f6c4d38a05c15a0e354c8b64f05cac6cc2c5f0
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Thu Jun 5 14:44:44 2025 -0400

    platform/x86/intel/pmt: support BMG crashlog
    
    The Battlemage GPU has the type 1 version 2 crashlog feature.
    
    Update the crashlog driver to support this crashlog version.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 832a676ed68901ea8c404d8602381cd8ca413e88 drm-intel
114306f3b033 platform/x86/intel: refactor endpoint usage
23795f48a0c3 platform/x86/intel/pmt: crashlog binary file endpoint
e402c01c42f3 drm/xe: Correct BMG VSEC header sizing
46cbb2e7eccd platform/x86/intel/pmt: white space cleanup
d372fcdefc9e platform/x86/intel/pmt: use guard(mutex)
6248a996ea0c platform/x86/intel/pmt: re-order trigger logic
9dbd53cff6e1 platform/x86/intel/pmt: correct types
310330cb19b0 platform/x86/intel/pmt: decouple sysfs and namespace
5071e548bf27 platform/x86/intel/pmt: add register access helpers
5ffaa007bb6f platform/x86/intel/pmt: use a version struct
29f6c4d38a05 platform/x86/intel/pmt: support BMG crashlog


