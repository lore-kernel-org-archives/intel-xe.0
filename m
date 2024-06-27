Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD60C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 10:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2233F10E1EB;
	Thu, 27 Jun 2024 10:48:21 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F0210E1EB;
 Thu, 27 Jun 2024 10:48:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pf=3A_Remove_inlin?=
 =?utf-8?q?ed_=23ifdef_CONFIG=5FPCI=5FIOV?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jun 2024 10:48:19 -0000
Message-ID: <171948529921.164201.17730143202465037736@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627104305.1477-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240627104305.1477-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV
URL   : https://patchwork.freedesktop.org/series/135472/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 718a4534aecf29e396f0c8582df1022aaf79c746
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jun 27 12:43:05 2024 +0200

    drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV
    
    We can remove #ifdef CONFIG_PCI_IOV in .c files if we provide
    dummy replacement of the xe_pci_sriov_configure() function.
    
    Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 9d3a556a7d3f7310c3afbd185f05dc1a6b0fb7f2 drm-intel
718a4534aecf drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV


