Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910FEC369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 04:47:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5839D10E06C;
	Wed, 30 Apr 2025 04:47:59 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA2B10E06C;
 Wed, 30 Apr 2025 04:47:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_BMG_PCIe_link_downgrade_a?=
 =?utf-8?q?ttributes_and_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Apr 2025 04:47:58 -0000
Message-ID: <174598847850.28173.18313923653571539435@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250430042419.3256029-1-raag.jadav@intel.com>
In-Reply-To: <20250430042419.3256029-1-raag.jadav@intel.com>
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

Series: BMG PCIe link downgrade attributes and usage
URL   : https://patchwork.freedesktop.org/series/148460/
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
commit 5a8b8477599e35518966c531c5a202bc9b0b618f
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Wed Apr 30 09:54:19 2025 +0530

    drm/xe/doc: Wire up PCIe Gen5 limitations
    
    Append PCIe Gen5 limitations to xe_firmware document.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 1295f065de1df2595f37d907efa3354b19d9b639 drm-intel
55aed8803c2f drm/xe/pm: s/xe_device_sysfs_init/xe_pm_sysfs_init
76b403ad465a drm/xe: Expose PCIe link downgrade attributes
5a8b8477599e drm/xe/doc: Wire up PCIe Gen5 limitations


