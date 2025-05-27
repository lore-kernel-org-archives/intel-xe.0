Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81528C5B542
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 21:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379FF10E56F;
	Tue, 27 May 2025 21:45:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F75410E551;
 Tue, 27 May 2025 21:45:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_out-of-boun?=
 =?utf-8?q?ds_field_write_in_MI=5FSTORE=5FDATA=5FIMM_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 21:45:47 -0000
Message-ID: <174838234745.25908.4851842070776608330@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250523150418.168362-1-jia.yao@intel.com>
In-Reply-To: <20250523150418.168362-1-jia.yao@intel.com>
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

Series: drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM (rev2)
URL   : https://patchwork.freedesktop.org/series/149435/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c70ccc4b0b22efc270e835cf351ebee53d919149
Author: Jia Yao <jia.yao@intel.com>
Date:   Tue May 27 16:30:50 2025 +0000

    drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
    
    According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE.
    The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
    condition 2 * x + 1 <= 0x3FE must be satisfied. Therefore, the maximum
    valid value for x is 0x1FE, not 0x1FF.
    
    v2
     - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew & Patelczyk, Maciej)
    
    Bspec: 60246
    
    Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
    Cc: Alex Zuo <alex.zuo@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
    Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Signed-off-by: Jia Yao <jia.yao@intel.com>
    Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 07b6736f75df3e60d5e20eda53ecb97f6d9a66c0 drm-intel
c70ccc4b0b22 drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
 - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew & Patelczyk, Maciej)

total: 0 errors, 1 warnings, 0 checks, 24 lines checked


