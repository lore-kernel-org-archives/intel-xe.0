Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2269DCDB482
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 11:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EB510E088;
	Wed, 18 Oct 2023 11:00:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 40ABF10E088;
 Wed, 18 Oct 2023 11:00:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 3EF09AADEF;
 Wed, 18 Oct 2023 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 18 Oct 2023 11:00:17 -0000
Message-ID: <169762681725.15108.7387555001567591088@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231018103603.1814906-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231018103603.1814906-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Count_and_report_low_level_driver_errors_=28rev9=29?=
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

Series: drm/xe: Count and report low level driver errors (rev9)
URL   : https://patchwork.freedesktop.org/series/124026/
State : success

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
commit 5817dee8f04c3955d7d9ab26fb3fa8df372378b9
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Oct 18 16:06:03 2023 +0530

    drm/xe: Update counter for low level driver errors
    
    we added a low level driver error counter and incrementing on
    each occurrence. Focus is on errors that are not functionally
    affecting the system and might otherwise go unnoticed and cause
    power/performance regressions, so checking for the error
    counters should help.
    
    Importantly the intention is not to go adding new error checks,
    but to make sure the existing important error conditions are
    propagated in terms of counter under respective categories like
    below :
    Under GT:
    gt_guc_communication,
    gt_engine_other,
    gt_other
    
    Under Tile:
    gtt,
    interrupt
    
    TODO: Currently this is just a counting of errors, later these
    counters will be reported through netlink interface when it is
    implemented and ready.
    
    V8:
      - Correct missed ret value handling
    V7:
      - removed double couting of err - Michal
    V6:
      - move drm_err to gt and tile specific err API - Aravind
      - Use GTT naming instead of GGTT - Aravind/Niranjana
    V5:
      - Dump err_type in string format
    V4:
      - dump err_type in drm_err log - Himal
    V2:
      - Use modified APIs
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 4d039d7be23937e2b498ed783aa5b0d8801b377b drm-intel
b35320338 drm/xe: Introduce low level driver error counting APIs
5817dee8f drm/xe: Update counter for low level driver errors


