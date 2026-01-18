Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C9DC9832F
	for <intel-xe@archiver.kernel.org>; Sun, 18 Jan 2026 12:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A8110E2B3;
	Sun, 18 Jan 2026 12:21:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4213410E126;
 Sun, 18 Jan 2026 12:21:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dma-buf=3A_document_revok?=
 =?utf-8?q?e_mechanism_to_invalidate_shared_buffers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Leon Romanovsky" <leon@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 18 Jan 2026 12:21:58 -0000
Message-ID: <176873891826.165070.17294792483994940023@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
In-Reply-To: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
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

Series: dma-buf: document revoke mechanism to invalidate shared buffers
URL   : https://patchwork.freedesktop.org/series/160246/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 50068a9a201ec5b5ce464c4316274270e0041b95
Author: Leon Romanovsky <leon@kernel.org>
Date:   Sun Jan 18 14:08:48 2026 +0200

    vfio: Add pinned interface to perform revoke semantics
    
    DMABUF ->pin() interface is called when the DMABUF importer perform
    its DMA mapping, so let's use this opportunity to check if DMABUF
    exporter revoked its buffer or not.
    
    Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
+ /mt/dim checkpatch 1956fa9bd80d606f7eb92e877680de38a4f6e8ef drm-intel
fcf666f915a5 dma-buf: Rename .move_notify() callback to a clearer identifier
398e529f69d9 dma-buf: Document revoke semantics
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
dma_buf_pin() after the DMA‑buf is attached to verify the exporter’s support

total: 0 errors, 1 warnings, 0 checks, 25 lines checked
712ad7bad6cf iommufd: Require DMABUF revoke semantics
50068a9a201e vfio: Add pinned interface to perform revoke semantics


