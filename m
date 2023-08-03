Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6541BEB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 16:02:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64DA10E62A;
	Thu,  3 Aug 2023 16:02:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEF1C10E629;
 Thu,  3 Aug 2023 16:02:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CB4B6A00E6;
 Thu,  3 Aug 2023 16:02:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 03 Aug 2023 16:02:40 -0000
Message-ID: <169107856082.5268.3879360472444028177@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230803153016.94282-1-jose.souza@intel.com>
In-Reply-To: <20230803153016.94282-1-jose.souza@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Make_explicit_that_exec_uAPI_expects_canonical_addresse?=
 =?utf-8?q?s_=28rev4=29?=
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

Series: drm/xe: Make explicit that exec uAPI expects canonical addresses (rev4)
URL   : https://patchwork.freedesktop.org/series/120143/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4e3818017a8c203673833db722e8f8f880fc3f79
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Aug 3 08:30:16 2023 -0700

    drm/xe: Make explicit that exec uAPI expects canonical addresses
    
    The batch buffer address in exec uAPI is used when emitting
    MI_BATCH_BUFFER_START that expect canonical addresses in future
    platforms, for current ones the bits above 57 for PVC and 47 for
    other platforms are ignored.
    
    So the safest approach is to require canonical address for all
    platforms supported by Xe to avoid uAPI breaks.
    
    v2:
    - fix check for non parallel engines
    
    v3:
    - fix style
    
    v4:
    - replace XE_IOCTL_ERR by XE_IOCTL_DBG
    
    BSpec: 60223 59475 45718
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch f16c04291100aa92caddd4d09e17b56bf7f4833c drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


