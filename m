Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E368EC4345F
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 13:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7EA10E529;
	Thu,  2 May 2024 13:44:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998DD10E529;
 Thu,  2 May 2024 13:44:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/gt=3A_Fix_assert_i?=
 =?utf-8?q?n_L3_bank_mask_generation_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 May 2024 13:44:17 -0000
Message-ID: <171465745762.1848758.2708050256590238146@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240502124311.159695-1-francois.dugast@intel.com>
In-Reply-To: <20240502124311.159695-1-francois.dugast@intel.com>
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

Series: drm/xe/gt: Fix assert in L3 bank mask generation (rev4)
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
commit 51ade325c17ca2ffda01468e6c170591bd5e14e8
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu May 2 14:43:10 2024 +0200

    drm/xe/gt: Fix assert in L3 bank mask generation
    
    What needs to be asserted is that the pattern fits in the number
    of bits provided by the user in patternbits, otherwise it would
    be truncated when replicated according to the mask, which is
    likely not the intended use of this function.
    The pattern argument is a bitmap so use find_last_bit() instead
    of fls(). The bit position starts at index 0 so remove "or equal"
    from the comparison. XE_MAX_L3_BANK_MASK_BITS would be the
    returned value if the pattern is 0, which can be the case on some
    platforms.
    
    v2: Check the result does not overflow the array (Lucas De Marchi)
    
    v3: Use __fls() for long and handle mask == 0  (Lucas De Marchi)
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 1b26f047c5fd5ce2cb738736d729d198b4ead7c8 drm-intel
51ade325c17c drm/xe/gt: Fix assert in L3 bank mask generation


