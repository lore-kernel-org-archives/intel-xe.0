Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5D3C61DB2
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 21:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C527010E5D0;
	Tue, 10 Jun 2025 21:19:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64C410E5D2;
 Tue, 10 Jun 2025 21:19:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Crashlog_Type1_Version2_s?=
 =?utf-8?q?upport_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 21:19:12 -0000
Message-ID: <174959035280.65653.49836571911648186@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
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

Series: Crashlog Type1 Version2 support (rev4)
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
commit 7d42dd0f4ca4c776409bb4ecf53c5161033cf46b
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Tue Jun 10 17:12:25 2025 -0400

    platform/x86/intel/pmt: support BMG crashlog
    
    The Battlemage GPU has the type 1 version 2 crashlog feature.
    
    Update the crashlog driver to support this crashlog version.
    
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 7bc153635620254b73cfe8714ce42768b2bf6d60 drm-intel
61993c6f5b0f platform/x86/intel/pmt: fix a crashlog NULL pointer access
58c0972b63ee drm/xe: Correct BMG VSEC header sizing
b439e4c9bf09 platform/x86/intel/pmt: white space cleanup
64fbdc68a9af platform/x86/intel/pmt: use guard(mutex)
c30f8979cfdf platform/x86/intel/pmt: re-order trigger logic
52c8d8245a03 platform/x86/intel/pmt: correct types
22253e77a47e platform/x86/intel/pmt: decouple sysfs and namespace
6fdbc4edee3f platform/x86/intel/pmt: add register access helpers
ab613265fbcb platform/x86/intel/pmt: use a version struct
7d42dd0f4ca4 platform/x86/intel/pmt: support BMG crashlog


