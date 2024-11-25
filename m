Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F4ED58090
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 12:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2391210E2CA;
	Mon, 25 Nov 2024 12:53:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAA410E002;
 Mon, 25 Nov 2024 12:53:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/ddi=3A_clarify_i?=
 =?utf-8?q?ntel=5Fddi=5Fconnector=5Fget=5Fhw=5Fstate=28=29_for_DP_MST?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Nov 2024 12:53:05 -0000
Message-ID: <173253918513.2821773.6804076441213933214@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125120959.2366419-1-jani.nikula@intel.com>
In-Reply-To: <20241125120959.2366419-1-jani.nikula@intel.com>
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

Series: drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST
URL   : https://patchwork.freedesktop.org/series/141748/
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
commit 15d9dc7eada5fbca642ce415dfff75f5fe7cd6ce
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Nov 25 14:09:59 2024 +0200

    drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST
    
    encoder->get_hw_state() returns false for DP MST, and currently always
    interprets 128b/132b as MST. Therefore the DDI MST mode checks in
    intel_ddi_connector_get_hw_state() are redundant.
    
    Prepare for future, and handle 128b/132b SST and warn on 8b/10b MST.
    
    Cc: Imre Deak <imre.deak@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b21f1413ea1860e80fd278112e820e6dadfc9df9 drm-intel
15d9dc7eada5 drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST


