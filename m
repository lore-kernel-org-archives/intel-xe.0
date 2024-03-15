Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B99EC54E5D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 01:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D4710FA91;
	Fri, 15 Mar 2024 01:08:52 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68D310FA8D;
 Fri, 15 Mar 2024 01:08:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Introduce_a_simple_busted_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Mar 2024 01:08:50 -0000
Message-ID: <171046493088.794418.4823278388588499206@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240315010317.193756-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240315010317.193756-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/3] drm/xe: Introduce a simple busted state
URL   : https://patchwork.freedesktop.org/series/131156/
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
commit ede9104877aa767f8988be32e21bfea379195547
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Thu Mar 14 21:03:17 2024 -0400

    drm/xe: Force busted state and block GT reset upon any GPU hang
    
    In many validation situations when debugging GPU Hangs,
    it is useful to preserve the GT situation from the moment
    that the timeout occurred.
    
    This patch introduces a module parameter that could be used
    on situations like this.
    
    If xe.busted module parameter is set to 2, Xe will be declared
    busted on every single execution timeout (a.k.a. GPU hang) right
    after devcoredump snapshot capture and without attempting any
    kind of GT reset and blocking entirely any kind of execution.
    
    v2: Really block gt_reset from guc side. (Lucas)
        s/wedged/busted (Lucas)
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
    Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch b7ead5c90db25002638773b1a9289220e6a36b4d drm-intel
076d0a16cb6c drm/xe: Introduce a simple busted state
a591a2f849a5 drm/xe: declare busted upon GuC load failure
ede9104877aa drm/xe: Force busted state and block GT reset upon any GPU hang


