Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E32EC44526
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC5710E791;
	Wed, 21 Jan 2026 13:06:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E1110E796;
 Wed, 21 Jan 2026 13:06:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dma-buf=3A_Use_revoke_mec?=
 =?utf-8?q?hanism_to_invalidate_shared_buffers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Leon Romanovsky" <leon@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 13:06:09 -0000
Message-ID: <176900076902.177211.4393263972040166681@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
In-Reply-To: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
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

Series: dma-buf: Use revoke mechanism to invalidate shared buffers (rev2)
URL   : https://patchwork.freedesktop.org/series/160360/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit db8740607e9fad983ee78ad1b1889f69ee6aa96a
Author: Leon Romanovsky <leon@kernel.org>
Date:   Wed Jan 21 14:59:16 2026 +0200

    vfio: Validate dma-buf revocation semantics
    
    Use the new dma_buf_attach_revocable() helper to restrict attachments to
    importers that support mapping invalidation.
    
    Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
+ /mt/dim checkpatch f869ee12e212bfa9fe277e6586c2c02902ed950b drm-intel
9c38a404c8cc dma-buf: Rename .move_notify() callback to a clearer identifier
53d3f42f1443 dma-buf: Rename dma_buf_move_notify() to dma_buf_invalidate_mappings()
786155566295 dma-buf: Always build with DMABUF_MOVE_NOTIFY
10e31654fce5 dma-buf: Make .invalidate_mapping() truly optional
93fb0dca8875 dma-buf: Add check function for revoke semantics
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
For importers, this means implementing .invalidate_mappings(). For exporters,

total: 0 errors, 1 warnings, 0 checks, 51 lines checked
4bc785872420 iommufd: Pin dma-buf importer for revoke semantics
2b8b34f75c2b vfio: Wait for dma-buf invalidation to complete
db8740607e9f vfio: Validate dma-buf revocation semantics


