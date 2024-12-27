Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A14E7718F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Dec 2024 19:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA15710E1F8;
	Fri, 27 Dec 2024 19:03:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFE010E1F8;
 Fri, 27 Dec 2024 19:03:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22drm/xe=3A_Force?=
 =?utf-8?q?_write_completion_of_MI=5FSTORE=5FDATA=5FIMM=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Dec 2024 19:03:56 -0000
Message-ID: <173532623663.3948707.6052135654216286897@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241227183230.101334-1-jose.souza@intel.com>
In-Reply-To: <20241227183230.101334-1-jose.souza@intel.com>
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

Series: Revert "drm/xe: Force write completion of MI_STORE_DATA_IMM"
URL   : https://patchwork.freedesktop.org/series/142991/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4db9d022adc1c740c990bec1168c4c2a5dd461e0
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Fri Dec 27 10:32:19 2024 -0800

    Revert "drm/xe: Force write completion of MI_STORE_DATA_IMM"
    
    This reverts commit 1460bb1fef9ccf7390af0d74a15252442fd6effd.
    
    In all places the MI_STORE_DATA_IMM are not followed by a read of
    the same memory address in the same batch buffer and the posted writes
    are flushed with PIPE_CONTROL or MI_FLUSH_DW in xe_ring_ops.c functions
    so there is no need to set this register.
    
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Fixes: 1460bb1fef9c ("drm/xe: Force write completion of MI_STORE_DATA_IMM")
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 08bd590935a5258ffd79355c59adffd72fb2c642 drm-intel
4db9d022adc1 Revert "drm/xe: Force write completion of MI_STORE_DATA_IMM"


