Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4833CC54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 17:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD17112643;
	Fri, 22 Mar 2024 17:18:42 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16F0112646;
 Fri, 22 Mar 2024 17:18:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fdevcoredump?=
 =?utf-8?q?=3A_Check_NULL_before_dereferencing_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Mar 2024 17:18:40 -0000
Message-ID: <171112792099.961261.9622769953330864865@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240322172447.3372167-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240322172447.3372167-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/xe_devcoredump: Check NULL before dereferencing (rev3)
URL   : https://patchwork.freedesktop.org/series/131353/
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
commit bd2de1ef25704e2714415f123ed1c6aba5e50baa
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Mar 22 22:54:47 2024 +0530

    drm/xe/xe_devcoredump: Check NULL before dereferencing
    
    Dereference 'coredump' to access 'xe_devcoredump_snapshot' only if
    'coredump' is not NULL,
    
    v2
    - Fix commit messages.
    
    v3
    - Define variables before code.(Ashutosh/Jose)
    
    v4
    - Drop return check for coredump_to_xe. (Jose/Rodrigo)
    
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch a69187c8b4ee770b05c8acb9754efb80c5447031 drm-intel
bd2de1ef2570 drm/xe/xe_devcoredump: Check NULL before dereferencing


