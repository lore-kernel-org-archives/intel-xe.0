Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E11CD5C0FF
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 16:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA2B10EA00;
	Fri,  8 Nov 2024 16:18:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B41610E111;
 Fri,  8 Nov 2024 16:18:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Allow_fault_injection_in_?=
 =?utf-8?q?vm_create_and_vm_bind_IOCTLs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Nov 2024 16:18:45 -0000
Message-ID: <173108272517.1427063.8577710355068385553@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241108161307.1203967-1-francois.dugast@intel.com>
In-Reply-To: <20241108161307.1203967-1-francois.dugast@intel.com>
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

Series: Allow fault injection in vm create and vm bind IOCTLs
URL   : https://patchwork.freedesktop.org/series/141106/
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
commit 8a3fb49a23366d061bbede2cbf0ec08207f88562
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Nov 8 17:11:56 2024 +0100

    drm/xe: Allow fault injection in vm create and vm bind IOCTLs
    
    Use fault injection infrastructure to allow specific functions to
    be configured over debugfs for failing during the execution of
    xe_vm_create_ioctl() and xe_vm_bind_ioctl(). This allows more
    thorough testing from user space by going through code paths for
    error handling and unwinding which cannot be reached by simply
    injecting errors in IOCTL arguments. This can help increase code
    robustness.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 5521311ecd7ffbb0adf016dbf83bd0165fc94d25 drm-intel
8a3fb49a2336 drm/xe: Allow fault injection in vm create and vm bind IOCTLs


