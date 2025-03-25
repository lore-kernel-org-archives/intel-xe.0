Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A23C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 10:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE3410E392;
	Tue, 25 Mar 2025 10:41:07 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC9810E392
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 10:41:07 +0000 (UTC)
Message-ID: <c010cb9d-cfed-46fa-a232-7ce8768f3f4d@lankhorst.se>
Date: Tue, 25 Mar 2025 11:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5B1/2=5D_drm/xe=3A_Remove_extra_spaces_in_xe=5Fvm=2Ec_?=
 =?UTF-8?B?KHJldjIp?=
To: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250320211519.632432-1-dev@lankhorst.se>
 <174289544214.218.14501066439435038545@e6b6f09ec485>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <174289544214.218.14501066439435038545@e6b6f09ec485>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Cc: Matthew Auld

Hey,

For peer-to-peer DMA-BUF, it can be beneficial to allow mapping memory as uncached.
Initially I tried copying the caching on same-driver import from the original BO.

Thomas suggested that since memory access from discrete is always coherent, the
check in xe_vm.c can be simplified from XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)
to XE_IOCTL_DBG(xe, !ID_DGFX(xe) && coh_mode == XE_COH_NONE)

This causes below failures.

Should I continue with the original patch, or change the testcase as well?

Kind Regards,
~Maarten


On 2025-03-25 10:37, Patchwork wrote:
> *Patch Details*
> *Series:*	series starting with [1/2] drm/xe: Remove extra spaces in xe_vm.c (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/146562/ <https://patchwork.freedesktop.org/series/146562/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056_BAT -> xe-pw-146562v2_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-146562v2_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-146562v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (10 -> 9)
> 
> Missing (1): bat-adlp-vm
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-146562v2_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_pat@prime-external-import-coh:
>       o bat-bmg-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html>
>       o bat-bmg-1: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html>
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html>
>       o bat-atsm-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html>
>       o bat-pvc-2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2844-9a42bdcde0f77b2c1e947e283cc3b267b1ce2056/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146562v2/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html>
