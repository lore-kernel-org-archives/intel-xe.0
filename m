Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB3CE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 18:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06EB710E139;
	Tue, 14 Jan 2025 18:25:11 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA6510E139;
 Tue, 14 Jan 2025 18:25:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Mark_ComputeCS_?=
 =?utf-8?q?read_mode_as_UC_on_iGPU_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jan 2025 18:25:09 -0000
Message-ID: <173687910937.3682296.7488530956821190848@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250114002507.114087-1-matthew.brost@intel.com>
In-Reply-To: <20250114002507.114087-1-matthew.brost@intel.com>
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

Series: drm/xe: Mark ComputeCS read mode as UC on iGPU (rev3)
URL   : https://patchwork.freedesktop.org/series/142512/
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
commit f1f3ff1d97677f23cf9d017377b505e7de3d65c0
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jan 13 16:25:07 2025 -0800

    drm/xe: Mark ComputeCS read mode as UC on iGPU
    
    RING_CMD_CCTL read index should be UC on iGPU parts due to L3 caching
    structure. Having this as WB blocks ULLS from being enabled. Change to
    UC to unblock ULLS on iGPU.
    
    v2:
     - Drop internal communications commnet, bspec is updated
    
    Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
    Cc: Michal Mrozek <michal.mrozek@intel.com>
    Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: stable@vger.kernel.org
    Fixes: 328e089bfb37 ("drm/xe: Leverage ComputeCS read L3 caching")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Acked-by: Michal Mrozek <michal.mrozek@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 30226b91b1754fdae425af3397c1e3dcba8264b0 drm-intel
f1f3ff1d9767 drm/xe: Mark ComputeCS read mode as UC on iGPU


