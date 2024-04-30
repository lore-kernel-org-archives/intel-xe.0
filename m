Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592E3C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 11:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE4710EA29;
	Tue, 30 Apr 2024 11:46:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F4810EA29;
 Tue, 30 Apr 2024 11:46:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gt=3A_Fix_assert_i?=
 =?utf-8?q?n_L3_bank_mask_generation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 11:46:03 -0000
Message-ID: <171447756349.1793171.17138545446946728906@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430114045.7-1-francois.dugast@intel.com>
In-Reply-To: <20240430114045.7-1-francois.dugast@intel.com>
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

Series: drm/xe/gt: Fix assert in L3 bank mask generation (rev2)
URL   : https://patchwork.freedesktop.org/series/133055/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9e31353df1beacf67f6b0aba0499530a0d1a949a
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Apr 30 11:40:45 2024 +0000

    drm/xe/gt: Fix assert in L3 bank mask generation
    
    What needs to be asserted is that the pattern fits in the number
    of bits provided by the user in patternbits, otherwise it would
    be truncated when replicated according to the mask, which is
    likely not the intended use of this function.
    The pattern argument is a bitmap so use find_last_bit() instead
    of fls(). The bit position starts at index 0 so remove "or equal"
    from the comparison, and XE_MAX_L3_BANK_MASK_BITS would be the
    returned value if the pattern is 0.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 39bf0b9d268e460fe2b7e9f792c9d610655eb9b7 drm-intel
9e31353df1be drm/xe/gt: Fix assert in L3 bank mask generation


