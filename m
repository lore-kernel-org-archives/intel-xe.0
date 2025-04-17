Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269F0C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 14:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB7E10E0F3;
	Thu, 17 Apr 2025 14:13:11 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3C010EB20;
 Thu, 17 Apr 2025 14:13:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_BMG_PCIe_Gen4_downspeed_a?=
 =?utf-8?q?ttributes_and_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 14:13:10 -0000
Message-ID: <174489919090.15056.1780432182947586449@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417111233.2322000-1-raag.jadav@intel.com>
In-Reply-To: <20250417111233.2322000-1-raag.jadav@intel.com>
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

Series: BMG PCIe Gen4 downspeed attributes and usage
URL   : https://patchwork.freedesktop.org/series/147908/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 26bf54832c2bbef3a129873328fdbf586fb21c42
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Thu Apr 17 16:42:33 2025 +0530

    drm/xe/doc: Wire up PCIe Gen5 update limitations
    
    Append PCIe Gen5 update limitations to xe_firmware document.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 830407db6fa5a871d1a6fcba1e51b42899ff57f6 drm-intel
415ae41de976 drm/xe: s/xe_device_sysfs_init/xe_pm_sysfs_init
50999d4e8f8a drm/xe: Expose PCIe Gen4 downspeed attributes
26bf54832c2b drm/xe/doc: Wire up PCIe Gen5 update limitations


