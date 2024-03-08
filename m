Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E4EC54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 04:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973C010F768;
	Fri,  8 Mar 2024 04:33:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B6F10F76E;
 Fri,  8 Mar 2024 04:33:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Minor_fixes_for_errors_re?=
 =?utf-8?q?ported_by_static_analyzer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 04:33:48 -0000
Message-ID: <170987242854.611156.11185598384347494024@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
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

Series: Minor fixes for errors reported by static analyzer
URL   : https://patchwork.freedesktop.org/series/130895/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 61836b0b54bfa39de7ebe79bb943ec0e127c9dfb
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Mar 8 10:06:51 2024 +0530

    drm/xe/xe_exec : In xe_exec_ioctl remove deadcode
    
    At label err_unlock_list the condition write_label will never be true.
    Remove the deadcode line for write_label true.
    
    Reported by static analyzer.
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch ee6e5c86f4d587b4ce1093eceae7d50e3f3a7c6b drm-intel
dd70c258474f drm/xe: Return if kobj creation is failed
f1f37a02b1c3 drm/xe/vf: Remove lmtt->ops null check in xe_lmtt_estimate_pt_size
61836b0b54bf drm/xe/xe_exec : In xe_exec_ioctl remove deadcode


