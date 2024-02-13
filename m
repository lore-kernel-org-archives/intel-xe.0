Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F585C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 20:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A052510E512;
	Tue, 13 Feb 2024 20:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="QDC0AHuy";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5909510E36E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 20:42:53 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1707856724; bh=4yXesl3qXd/tgIuc1oFifBiKq7y5u1VlFFZkCBdBoSU=;
 h=From:To:Cc:Subject:Date:From;
 b=QDC0AHuyTrY210Akrf/z4Em4otV3J84kIStgZ1anYlXwjoSoAYCqQUulkEVC90P44
 1uFENM9BB3pza3giXV4Gyvc+16cKFzmmo9VEITl/qkHopYIHeek3aglvG2LkHoQeo4
 ZckZnF5bSFz49xDmAoRSaO0CiO26J5TXRMIshhRHgvFQFCvHYZaTdFJiylBpcHGv6C
 UvOGHfTK742wOBDbvcNaqaOTEz2a7EQ8G3DwKiRuR9Mn5LOETE626rDNYacc4PYL9y
 1tcQ1XVvaW/3mi27gs9PaAAZ0amOYdEKZ56u2ximcTYXZ5KHhh9U45sefYIHw67DcQ
 6H/GkMQnzXZyg==
Received: from mhaimovski-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 41DKcW1p871819
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 22:38:32 +0200
Received: (from mhaimovski@localhost)
 by mhaimovski-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 41DKcWdh871818; 
 Tue, 13 Feb 2024 22:38:32 +0200
From: Moti Haimovski <mhaimovski@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: mhaimovski@habana.ai, oak.zeng@intel.com, thomas.hellstrom@linux.intel.com
Subject: [PATCH v2 0/1] drm/xe: support VM sharing between apps
Date: Tue, 13 Feb 2024 22:38:28 +0200
Message-Id: <20240213203829.871802-1-mhaimovski@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There can be devices which offer multiple hardware features each
requiring its own driver. In such case, there is always only one
primary driver which registers itself with the device. All other
drivers work as auxiliary drivers to the primary driver.
Based on software use case of the application there can be a
requirement to share virtual memory information between these drivers.
In current design virtual memory is exposed as an integer, this number
is tightly coupled with the application context. In this integer form,
VM information cannot be shared with other auxiliary drivers by the
application.
Taking inspiration from dma-buf framework, adding a new interface to
export the VM id as an FD. This FD is unique across the host and
encapsulates VM related configurations. Using this FD each application
can opaquely share VM info with other aux drivers.
This feature doesn't allow inter application sharing of VM information,
its purpose is to allow application for sharing its VM with another
driver contexts.
    
Bharat Jauhari (1):
  drm/xe: support sharing VM info between XE drivers

 drivers/gpu/drm/xe/xe_device.c   |   1 +
 drivers/gpu/drm/xe/xe_vm.c       | 107 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h       |   2 +
 drivers/gpu/drm/xe/xe_vm_types.h |  24 +++++++
 include/uapi/drm/xe_drm.h        |  27 ++++++++
 5 files changed, 161 insertions(+)

---
V2:
 * More comprehensive cover letter and commit messages (Zeng Oak)
 * Removed xe_file refcount patch,
   will use existing VM refcount instead (Thomas Hellström)

V1:
 * Initial release
-- 
2.34.1

