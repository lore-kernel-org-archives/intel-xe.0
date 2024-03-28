Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFB6C54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 12:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5DE112415;
	Thu, 28 Mar 2024 12:32:20 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE37112415;
 Thu, 28 Mar 2024 12:32:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fdevcoredump?=
 =?utf-8?q?=3A_Check_NULL_before_assignments?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Mar 2024 12:32:19 -0000
Message-ID: <171162913944.1062663.1175338641889262276@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328123739.3633428-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240328123739.3633428-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe/xe_devcoredump: Check NULL before assignments
URL   : https://patchwork.freedesktop.org/series/131762/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
10b531c2aeb176a1a539b4a77216232f97719cec
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2662b2119f62d197addb4c8c4a2d417358479ec0
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Mar 28 18:07:39 2024 +0530

    drm/xe/xe_devcoredump: Check NULL before assignments
    
    Assign 'xe_devcoredump_snapshot *' and 'xe_device *' only if
    'coredump' is not NULL.
    
    v2
    - Fix commit messages.
    
    v3
    - Define variables before code.(Ashutosh/Jose)
    
    v4
    - Drop return check for coredump_to_xe. (Jose/Rodrigo)
    
    v5
    - Modify misleading commit message. (Matt)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 4e1d9f9322648d99848ebff27d441e748d26e2b8 drm-intel
2662b2119f62 drm/xe/xe_devcoredump: Check NULL before assignments


