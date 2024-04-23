Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAED4C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 22:30:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F89110EB68;
	Tue, 23 Apr 2024 22:30:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5076D10E64B;
 Tue, 23 Apr 2024 22:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/4=5D_drm/xe=3A_Introduce_a_simple_wedged_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 22:30:22 -0000
Message-ID: <171391142232.1610190.10858468889088842442@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/4] drm/xe: Introduce a simple wedged state
URL   : https://patchwork.freedesktop.org/series/132797/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 193ced9796338366b3a66ae789bd4f5ec87b9783
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Apr 23 18:18:17 2024 -0400

    drm/xe: Introduce the wedged_mode debugfs
    
    So, the wedged mode can be selected per device at runtime,
    before the tests or before reproducing the issue.
    
    v2: - s/busted/wedged
        - some locking consistency
    
    v3: - remove mutex
        - toggle guc reset policy on any mode change
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e1dc9638bb47a28181fee1a9a180445ca2a8b9cf drm-intel
b965225e7618 drm/xe: Introduce a simple wedged state
f39ee7526ad5 drm/xe: declare wedged upon GuC load failure
ff2648241dcf drm/xe: Force wedged state and block GT reset upon any GPU hang
193ced979633 drm/xe: Introduce the wedged_mode debugfs


