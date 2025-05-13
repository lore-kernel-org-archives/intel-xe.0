Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B471C3ABCC
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 13:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D4B10E5AE;
	Tue, 13 May 2025 13:02:53 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259AE10E59F;
 Tue, 13 May 2025 13:02:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vsec=3A_Allow_for_?=
 =?utf-8?q?kernel_context_access_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 13:02:52 -0000
Message-ID: <174714137215.75033.5829671768526975823@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512182012.181644-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250512182012.181644-1-michael.j.ruhl@intel.com>
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

Series: drm/xe/vsec: Allow for kernel context access (rev3)
URL   : https://patchwork.freedesktop.org/series/148726/
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
commit 2fa630012d5de1ffb51e58c3cefa4f2e921fdb9c
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Date:   Mon May 12 14:18:35 2025 -0400

    drm/xe/vsec: Allow for kernel context access
    
    The PMT driver API allows kernel level access to device
    data.  Because of this, the mutex lock use by the Xe copy
    callback function turns out to be a poor choice.
    
    Since the context of the caller can not be known, change
    the mutex to a raw_spinlock to account for all use cases.
    
    Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
    Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 39fec6496914103994862533bbdbec4e4ea58d46 drm-intel
2fa630012d5d drm/xe/vsec: Allow for kernel context access


