Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E5DC54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 17:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D26310EAA7;
	Wed, 13 Mar 2024 17:19:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E2810EAA7;
 Wed, 13 Mar 2024 17:19:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Skip_VMAs_pin_w?=
 =?utf-8?q?hen_requesting_signal_to_the_last_XE=5FEXEC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 17:19:09 -0000
Message-ID: <171035034956.732599.10341332785624405882@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313171318.121066-1-jose.souza@intel.com>
In-Reply-To: <20240313171318.121066-1-jose.souza@intel.com>
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

Series: drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC
URL   : https://patchwork.freedesktop.org/series/131085/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 83a1852441fc263c4ca0f7ae7deb0ebbe404c234
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Wed Mar 13 10:13:18 2024 -0700

    drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC
    
    Doing a XE_EXEC with num_batch_buffer == 0 makes signals passed as
    argument to be signaled when the last real XE_EXEC is completed.
    But to do that it was first pinning all VMAs in drm_gpuvm_exec_lock(),
    this patch remove this pinning as it is not required.
    
    This change also help Mesa implementing memory over-commiting recovery
    as it needs to unbind not needed VMAs when the whole VM can't fit
    in GPU memory but it can only do the unbiding when the last XE_EXEC
    is completed.
    So with this change Mesa can get the signal it want without getting
    out-of-memory errors.
    
    Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
    Co-developed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 72f447f984cf5526e6ad32a6e2770124c67d59d3 drm-intel
83a1852441fc drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC


