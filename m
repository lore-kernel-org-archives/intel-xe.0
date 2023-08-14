Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01FCC41513
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 22:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A2910E021;
	Mon, 14 Aug 2023 22:40:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85CE010E021;
 Mon, 14 Aug 2023 22:40:46 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 81FB8A7DFB;
 Mon, 14 Aug 2023 22:40:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Mon, 14 Aug 2023 22:40:46 -0000
Message-ID: <169205284652.19472.17079915132979776982@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Po?=
 =?utf-8?q?rt_CPU-GPU_timestamp_correlation_to_XE_KMD?=
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

Series: Port CPU-GPU timestamp correlation to XE KMD
URL   : https://patchwork.freedesktop.org/series/122440/
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
commit ebcd05d72060750a893db33dc5d62fa4271b81a2
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Mon Aug 14 15:37:34 2023 -0700

    drm/xe: Correlate engine and cpu timestamps with better accuracy
    
    Perf measurements rely on CPU and engine timestamps to correlate
    events of interest across these time domains. Current mechanisms get
    these timestamps separately and the calculated delta between these
    timestamps lack enough accuracy.
    
    To improve the accuracy of these time measurements to within a few us,
    add a query that returns the engine and cpu timestamps captured as
    close to each other as possible.
    
    Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24591
    
    v2:
    - Fix kernel-doc warnings (CI)
    - Document input params and group them together (Jose)
    - s/cs/engine/ (Jose)
    - Remove padding in the query (Ashutosh)
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 945d16a6ea31fbaf3dde002cd182381a92a0e656 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


