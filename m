Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D96E75459
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 18:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1D010E02A;
	Tue,  3 Oct 2023 18:12:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E4AD10E02A;
 Tue,  3 Oct 2023 18:12:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0CFC5AADE1;
 Tue,  3 Oct 2023 18:12:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Tue, 03 Oct 2023 18:12:20 -0000
Message-ID: <169635674004.4383.5866715819021211280@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20231003180909.3241390-1-umesh.nerlige.ramappa@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/124565/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 256e295924bf5db66cb4eebe45ba2522faeca9c4
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Tue Oct 3 11:09:09 2023 -0700

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
    
    v3:
    - s/rsvd/pad/ in struct drm_xe_engine_class_instance (Jose)
    - Explicitly initialize pad to 0
    
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    [Rodrigo finished the s/cs/engine renaming]
+ /mt/dim checkpatch 090c3e92db31fbbe59a47d44f8dd7e8a1ccbcb36 drm-intel
f46e80513 drm/xe: Fix array bounds check for queries
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '22504d560287', maybe rebased or not pulled?
#9: 
Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
eaa15f299 drm/xe: Set the correct type for xe_to_user_engine_class
256e29592 drm/xe: Correlate engine and cpu timestamps with better accuracy
-:130: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#130: FILE: drivers/gpu/drm/xe/xe_query.c:108:
+query_engine_cycles(struct xe_device *xe,
+		struct drm_xe_device_query *query)

total: 0 errors, 0 warnings, 1 checks, 311 lines checked


