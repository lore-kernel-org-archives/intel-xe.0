Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C77C25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 22:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBAA10F36C;
	Mon,  6 May 2024 22:51:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E7510F36C;
 Mon,  6 May 2024 22:51:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Implement_pc?=
 =?utf-8?q?i=5Fdriver=2Esriov=5Fconfigure_callback_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 22:51:56 -0000
Message-ID: <171503591606.1960090.10834248808152173322@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506184121.2615-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240506184121.2615-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Implement pci_driver.sriov_configure callback (rev3)
URL   : https://patchwork.freedesktop.org/series/132868/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fdede38f659dd5c71f276aeaa611f46e52df931d
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon May 6 20:41:21 2024 +0200

    drm/xe/pf: Implement pci_driver.sriov_configure callback
    
    The PCI subsystem already exposes the "sriov_numvfs" attribute
    that users can use to enable or disable SR-IOV VFs. Add custom
    implementation of the .sriov_configure callback defined by the
    pci_driver to perform additional steps, including fair VFs
    provisioning with the resources, as required by our platforms.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com> #v2
+ /mt/dim checkpatch 980de4c8f9c4fc65bd51d355372e06dc576c3ea7 drm-intel
fdede38f659d drm/xe/pf: Implement pci_driver.sriov_configure callback
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:56: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#56: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 179 lines checked


