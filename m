Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE61CC77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 20:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F72C10E3AC;
	Tue,  6 Jun 2023 20:23:01 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F35410E3AC;
 Tue,  6 Jun 2023 20:22:59 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8C1DDAADE3;
 Tue,  6 Jun 2023 20:22:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 06 Jun 2023 20:22:59 -0000
Message-ID: <168608297957.22671.16046227672659531926@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230606201959.94128-1-jose.souza@intel.com>
In-Reply-To: <20230606201959.94128-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/display=3A_Append_dma=5Fbuf_fences_to_framebuffer_fences?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/display: Append dma_buf fences to framebuffer fences
URL   : https://patchwork.freedesktop.org/series/118964/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c8a842168df351f9dbe46d7ce2f9d0f139fee2e
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Jun 6 13:19:59 2023 -0700

    drm/xe/display: Append dma_buf fences to framebuffer fences
    
    This is required to comply with KMS page flip requirements, and it is
    the only way to synchronize framebuffer scanouts in Xe KMD.
    
    UMDs are expected to attach a syncobj that will be signaled at the end
    of the GPU job that is rendering in the framebuffer.
    This way, the compositor can send jobs to the GPU to render the
    framebuffer and without having to wait for it to complete, queue the
    page flip in KMS.
    
    This fixes display glitches.
    
    Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/8923
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch a17ea8317b0260a1230cedb0469d4ba0cec0f4f2 drm-intel
2c8a84216 drm/xe/display: Append dma_buf fences to framebuffer fences


