Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E39C369D5
	for <intel-xe@archiver.kernel.org>; Sun, 27 Apr 2025 09:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001A510E187;
	Sun, 27 Apr 2025 09:48:49 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BE410E188;
 Sun, 27 Apr 2025 09:48:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/gpusvm=3A_set_has=5Fd?=
 =?utf-8?q?ma=5Fmapping_inside_mapping_loop?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 27 Apr 2025 09:48:48 -0000
Message-ID: <174574732848.15585.16711761511063860200@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250427094238.1497681-1-dafna.hirschfeld@intel.com>
In-Reply-To: <20250427094238.1497681-1-dafna.hirschfeld@intel.com>
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

Series: drm/gpusvm: set has_dma_mapping inside mapping loop
URL   : https://patchwork.freedesktop.org/series/148313/
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
commit c0ee4ea10294b6637956b5e5ae9b862fc05f77df
Author: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Date:   Sun Apr 27 12:42:38 2025 +0300

    drm/gpusvm: set has_dma_mapping inside mapping loop
    
    The 'has_dma_mapping' flag should be set once there is a
    mapping so it could be unmapped in case of error.
    
    Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
+ /mt/dim checkpatch 4548c64c3d42a60af11ab57886ba69b54d63dd2d drm-intel
c0ee4ea10294 drm/gpusvm: set has_dma_mapping inside mapping loop


