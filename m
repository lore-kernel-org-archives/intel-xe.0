Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5784C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 17:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C6410E78D;
	Wed,  6 Dec 2023 17:06:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2BCF710E799;
 Wed,  6 Dec 2023 17:06:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2803CAADD6;
 Wed,  6 Dec 2023 17:06:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Wed, 06 Dec 2023 17:06:35 -0000
Message-ID: <170188239516.26426.16231397249634422169@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206160617.7-1-francois.dugast@intel.com>
In-Reply-To: <20231206160617.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/uapi=3A_Remove_DRM=5FIOCTL=5FXE=5FEXEC=5FQUEUE=5FSET=5FPRO?=
 =?utf-8?q?PERTY?=
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

Series: drm/xe/uapi: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
URL   : https://patchwork.freedesktop.org/series/127440/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6aecb3e472954bc384afbde0a54ab726fefae329
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Dec 6 16:06:17 2023 +0000

    drm/xe/uapi: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
    
    The exec_queue_set_property feature was removed in a previous
    commit ("drm/xe/uapi: Kill exec_queue_set_property") and is no
    longer usable, struct drm_xe_exec_queue_set_property does not
    exist anymore, so let's remove this.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 42c08951a31c679822795d72ada017e004d89102 drm-intel
6aecb3e47 drm/xe/uapi: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY


