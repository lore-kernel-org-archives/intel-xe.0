Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9052C2D0D1
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 14:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CDA10E083;
	Mon, 24 Jun 2024 14:05:40 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF67A10E05D;
 Mon, 24 Jun 2024 14:05:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_add_wopcm_devic?=
 =?utf-8?q?e_info_and_set_region_into_Guc_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Farah Kassabri" <fkassabri@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jun 2024 14:05:38 -0000
Message-ID: <171923793884.153309.13299228280601410274@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624135954.99565-1-fkassabri@habana.ai>
In-Reply-To: <20240624135954.99565-1-fkassabri@habana.ai>
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

Series: drm/xe: add wopcm device info and set region into Guc registers (rev2)
URL   : https://patchwork.freedesktop.org/series/133879/
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
commit 4878638c3b19e6c43fb26359667b7cf53d5dba81
Author: Farah Kassabri <fkassabri@habana.ai>
Date:   Mon Jun 24 16:59:54 2024 +0300

    drm/xe: add wopcm device info and set region into Guc registers
    
    Guc FW is loaded to the DSM WOPCM region.
    Guc DMA engine reads the WOPCM base address and size from
    guc registers DMA_GUC_WOPCM_OFFSET and GUC_WOPCM_SIZE, do some sanity
    checks and alignmnets, then load the FW there.
    This patch will set the region size at init.
    
    Signed-off-by: Farah Kassabri <fkassabri@habana.ai>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    
    Changes in v2:
    Keep the xe_wopcm_size function and return the new attribute
    from it.
+ /mt/dim checkpatch c0c1c2d3681c4a653c6b2122a8e8ef9fbaaa4398 drm-intel
4878638c3b19 drm/xe: add wopcm device info and set region into Guc registers


