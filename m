Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D868C531DF
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 06:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3D910E741;
	Thu, 22 Aug 2024 06:24:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0F710E741;
 Thu, 22 Aug 2024 06:24:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_Do_not_explic?=
 =?utf-8?q?ilty_enable_FEC_in_DP=5FTP=5FCTL_for_UHBR_rates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Aug 2024 06:24:57 -0000
Message-ID: <172430789764.724138.9823226678757236960@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240822061448.4085693-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240822061448.4085693-1-chaitanya.kumar.borah@intel.com>
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

Series: drm/i915: Do not explicilty enable FEC in DP_TP_CTL for UHBR rates
URL   : https://patchwork.freedesktop.org/series/137612/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1cecd54338bb45f9b6d67fc895f8390fced2ae36
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Thu Aug 22 11:44:48 2024 +0530

    drm/i915: Do not explicilty enable FEC in DP_TP_CTL for UHBR rates
    
    In case of UHBR rates, we do not need to explicitly enable FEC by writing
    to DP_TP_CTL register.
    For MST use-cases, intel_dp_mst_find_vcpi_slots_for_bpp() takes care of
    setting fec_enable to false. However, it gets overwritten in
    intel_dp_dsc_compute_config(). This change keeps fec_enable false across
    MST and SST use-cases for UHBR rates.
    
    While at it, add a comment explaining why we don't enable FEC in eDP v1.5.
    
    v2: Correct logic to cater to SST use-cases (Jani)
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 4c294bd7d8c84305dbb1de1aa9e010818e3f4b7e drm-intel
1cecd54338bb drm/i915: Do not explicilty enable FEC in DP_TP_CTL for UHBR rates


