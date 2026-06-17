Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4558CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 15:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63FC810F02A;
	Wed, 17 Jun 2026 15:20:38 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944B010F02A;
 Wed, 17 Jun 2026 15:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Add_flag_t?=
 =?utf-8?q?o_tell_if_VM=5FGET=5FPROPERTY=5FFAULTS_is_supported?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 15:20:37 -0000
Message-ID: <178170963760.90143.8918151795559142248@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617151419.101546-1-jose.souza@intel.com>
In-Reply-To: <20260617151419.101546-1-jose.souza@intel.com>
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

Series: drm/xe/uapi: Add flag to tell if VM_GET_PROPERTY_FAULTS is supported
URL   : https://patchwork.freedesktop.org/series/168725/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4d7151aa116eb7bcc812c770e790c3d97bb704e6
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Wed Jun 17 08:14:19 2026 -0700

    drm/xe/uapi: Add flag to tell if VM_GET_PROPERTY_FAULTS is supported
    
    Not all Xe versions support this feature and not every device supported by Xe
    supports this feature, so this flag is needed to make UMD's life easier.
    
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch f7cb2873b7430d84afd4ad4e4771d3f8ad03fbf9 drm-intel
4d7151aa116e drm/xe/uapi: Add flag to tell if VM_GET_PROPERTY_FAULTS is supported
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
Not all Xe versions support this feature and not every device supported by Xe

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


