Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922DECAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 07:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5628210E68D;
	Wed,  1 Oct 2025 07:30:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589CC10E29F;
 Wed,  1 Oct 2025 07:30:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_drm_sharpness_p?=
 =?utf-8?q?roperty?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Oct 2025 07:30:37 -0000
Message-ID: <175930383735.382019.9004721863180998587@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20251001063500.1259687-1-nemesa.garg@intel.com>
In-Reply-To: <20251001063500.1259687-1-nemesa.garg@intel.com>
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

Series: Introduce drm sharpness property
URL   : https://patchwork.freedesktop.org/series/155272/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 88b374aa3be67563884e00597db24cf3efbb0cdb
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Wed Oct 1 12:05:00 2025 +0530

    drm/i915/display: Expose sharpness strength property
    
    Expose the drm crtc sharpness strength property which will enable
    or disable the sharpness/casf based on user input. With this user
    can set/update the strength of the sharpness or casf filter.
    
    v2: Update subject[Ankit]
    
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch bb42887c28cd6ede2c83547a9afc852a6aed3569 drm-intel
aa1e2e04821f drm/drm_crtc: Introduce sharpness strength property
3bad56fbfff7 drm/i915/display: Introduce HAS_CASF for sharpness support
1cdc34e2de71 drm/i915/display: Add CASF strength and winsize
-:43: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#43: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 223 lines checked
8eee5f23904d drm/i915/display: Add filter lut values
a6b4ffbc0772 drm/i915/display: Compute the scaler coefficients
-:26: WARNING:TYPO_SPELLING: 'funtion' may be misspelled - perhaps 'function'?
#26: 
v11: Add casf_write_coeff funtion to casf_enable
                          ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 138 lines checked
c7cc57b112db drm/i915/display: Add and compute scaler parameter
1405d29d9f2e drm/i915/display: Configure the second scaler
054375dea815 drm/i915/display: Set and get the casf config
c1d33e821a03 drm/i915/display: Enable/disable casf
88b374aa3be6 drm/i915/display: Expose sharpness strength property


