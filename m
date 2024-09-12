Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835B3EE644F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 12:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541B710EB67;
	Thu, 12 Sep 2024 12:03:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8A510EB67;
 Thu, 12 Sep 2024 12:03:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pciid=3A_Add_new_P?=
 =?utf-8?q?CI_id_for_ARL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 12:03:22 -0000
Message-ID: <172614260291.991496.12107513961330931710@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com>
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

Series: drm/xe/pciid: Add new PCI id for ARL (rev2)
URL   : https://patchwork.freedesktop.org/series/138509/
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
commit 4035b35e7fc45ff1c91856381cbefeddf0bc38b4
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Date:   Thu Sep 12 17:29:06 2024 +0530

    drm/xe/pciid: Add new PCI id for ARL
    
    Add new PCI id for ARL platform.
    
    v2: Fix typo in PCI id (SaiTeja)
    
    Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
+ /mt/dim checkpatch 5c43f7fc693a421b6bd029a255d5c940c0072187 drm-intel
4035b35e7fc4 drm/xe/pciid: Add new PCI id for ARL


