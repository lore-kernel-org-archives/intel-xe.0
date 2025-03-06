Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93649C19F32
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 01:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C4110E882;
	Thu,  6 Mar 2025 01:05:11 +0000 (UTC)
Received: from 64e06c682a23 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9F10E882;
 Thu,  6 Mar 2025 01:05:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_GuC_opt-in_feature?=
 =?utf-8?q?s_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Mar 2025 01:05:10 -0000
Message-ID: <174122311096.64376.14097549505128875835@64e06c682a23>
X-Patchwork-Hint: ignore
References: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250306005745.3520231-1-daniele.ceraolospurio@intel.com>
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

Series: Enable GuC opt-in features (rev2)
URL   : https://patchwork.freedesktop.org/series/145532/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aa01c8487eae5f8694b6d9f38e213df3237925c5
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Wed Mar 5 16:57:45 2025 -0800

    drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization
    
    The Dynamic Inhibit Context Switch is an optimization aimed at reducing
    the amount of time the HW is stuck waiting on an unsatisfied semaphore.
    When this optimization is enabled, the GuC will dynamically modify the
    CTX_CTRL_INHIBIT_SYN_CTX_SWITCH in the CTX_CONTEXT_CONTROL register of
    lrcs to enable immediate switching out on an usatisfied semaphore wait
    when multiple contexts are competing for time on the same engine.
    
    This feature is available on recent HW from GuC 70.40.1 onwards and it
    is enabled via a per-VF feature opt-in.
    
    v2: rebase
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c drm-intel
d97454fad584 drm/xe/guc: move KLV helpers to common file
c30e478c103e drm/xe/guc: Enable extended CAT error reporting
aa01c8487eae drm/xe/guc: Enable the Dynamic Inhibit Context Switch optimization


