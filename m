Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E63C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F45F112FBD;
	Tue,  9 Apr 2024 22:22:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF2F112FBD;
 Tue,  9 Apr 2024 22:22:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/4=5D_drm/xe=3A_Introduce_a_simple_wedged_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 22:22:04 -0000
Message-ID: <171270132471.1316401.9164839657519620904@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/132232/
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
commit 9b3b10a85b343b580e3e9f39b2a56c870a426083
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Apr 9 18:15:07 2024 -0400

    drm/xe: Introduce the wedged_mode debugfs
    
    So, the wedged mode can be selected per device at runtime,
    before the tests or before reproducing the issue.
    
    v2: - s/busted/wedged
        - some locking consistency
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 057ec21a54cddd595a7725fa8731eb4c5bd5abff drm-intel
8d5d42a8d0da drm/xe: Introduce a simple wedged state
f64c42e383ec drm/xe: declare wedged upon GuC load failure
9647925bd600 drm/xe: Force wedged state and block GT reset upon any GPU hang
9b3b10a85b34 drm/xe: Introduce the wedged_mode debugfs


