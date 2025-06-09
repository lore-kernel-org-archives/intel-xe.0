Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD540C61DB2
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 09:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAD810E103;
	Mon,  9 Jun 2025 09:26:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1610410E0F2;
 Mon,  9 Jun 2025 09:26:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Support_for_mma?=
 =?utf-8?q?p-ing_mmio_regions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 09:26:57 -0000
Message-ID: <174946121708.59084.4395757405865460456@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609092047.7668-1-ilia.levi@intel.com>
In-Reply-To: <20250609092047.7668-1-ilia.levi@intel.com>
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

Series: drm/xe: Support for mmap-ing mmio regions
URL   : https://patchwork.freedesktop.org/series/149977/
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
commit 3bdb36a8af96d359ef03c628c6c04b7191ae8f5d
Author: Ilia Levi <ilia.levi@intel.com>
Date:   Mon Jun 9 12:20:47 2025 +0300

    drm/xe: Support for mmap-ing mmio regions
    
    Allow the driver to expose hardware register spaces to userspace
    through GEM objects with fake mmap offsets. This can be useful
    for userspace-firmware communication, debugging, etc.
    
    Signed-off-by: Ilia Levi <ilia.levi@intel.com>
+ /mt/dim checkpatch 4f1b47e74d34192357af40cb1134f10ad7429955 drm-intel
3bdb36a8af96 drm/xe: Support for mmap-ing mmio regions


