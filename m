Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63899C5B543
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 01:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242E510EA6E;
	Fri,  6 Jun 2025 01:46:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E29E10EA6E;
 Fri,  6 Jun 2025 01:46:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_GSM_size_should?=
 =?utf-8?q?_be_constant_on_most_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 01:46:05 -0000
Message-ID: <174917436551.54220.13218993756943789915@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605225352.2333981-2-matthew.d.roper@intel.com>
In-Reply-To: <20250605225352.2333981-2-matthew.d.roper@intel.com>
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

Series: drm/xe: GSM size should be constant on most platforms
URL   : https://patchwork.freedesktop.org/series/149907/
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
commit 66d4f3ca3c6de02833c1b23b92d8f633e6a9db48
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Jun 5 15:53:53 2025 -0700

    drm/xe: GSM size should be constant on most platforms
    
    On old Intel platforms, the size of the GSM (i.e., the stolen memory
    that holds the GGTT page table entries) could vary, so the driver needed
    to read the actual size from the PCI config space.  However from Xe_HP
    onward, the GSM is now always guaranteed to be exactly 8MB (which
    translates to a 4GB GGTT address space); this is always true regardless
    of what the platform's much larger PPGTT address space is.
    
    The bspec doesn't document the PCI config space as being a valid way to
    query the size of the GSM after Xe_LP platforms, although so far it
    still seems to be giving us proper values for Xe_HP, Xe2, and Xe3.
    However we suspect that the config space will stop providing correct
    values on some upcoming platforms, so we should stop relying on it.
    Instead just use the hardcoded 8MB value as documented elsewhere in the
    bspec.
    
    Bspec: 49636, 67090, 50589
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 308a53b9affc92eca9eaa6117dd62c79d5419ce7 drm-intel
66d4f3ca3c6d drm/xe: GSM size should be constant on most platforms


