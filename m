Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09029C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 06:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A468210E988;
	Fri, 28 Mar 2025 06:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUPWOvs1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05E610E988
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 06:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743143779; x=1774679779;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tHaAJQqIAu52yQTzaBQ84GLr9DTgoTBdsymK4N1Tab8=;
 b=aUPWOvs1awKSPT+GA4qOG3UyP/3Z5F6VLXUJhKQGcRS3j/LhtmAHfHkV
 eOp7FOHNG+npga4SFMwlS0N+saU3nWjHxnl3hyB1dzwEYXUteMoaFtqcB
 C6o8FQL/y8V36eplZr3CzLr7zHGPZTAbxVhXtNYiSCOwSEWIRSbdYmGRH
 ws61UvQvl8oYWUxMH8UxVqZ/BIho5tCSFuW5h/e0haknrmeDm+4eiwChM
 Sj/W9rsihkfDcS7zlyf3fUPeDhjezN/vi6fVuo+BRwxQlhBFWOexjNCar
 m9ezeTUr0CwIvRRnuXwRfRzHCdoyDAy+UBypJ3sdB2COI4dNKaWA8wUcg A==;
X-CSE-ConnectionGUID: yKmBXkIPRDmR95RE6VtfGg==
X-CSE-MsgGUID: G6adIvHwSQ+iLQ1kRCJcpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55145717"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="55145717"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:36:16 -0700
X-CSE-ConnectionGUID: C07eI14vT66HnDdTFHLvjg==
X-CSE-MsgGUID: CrMOROKeQcC9Kq7Zx8g2Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130578921"
Received: from nihaljai-mobl1.gar.corp.intel.com (HELO [10.247.253.176])
 ([10.247.253.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 23:36:15 -0700
Message-ID: <363df5cc-0be6-44d4-b515-6070ad35d5cd@intel.com>
Date: Fri, 28 Mar 2025 12:06:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe2h?=
 =?UTF-8?Q?pg=3A_Add_Wa=5F16025250150_=28rev2=29?=
To: intel-xe@lists.freedesktop.org, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
References: <20250325134421.1489416-1-aradhya.bhatia@intel.com>
 <174311817504.13007.12492813581667605313@e6b6f09ec485>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
In-Reply-To: <174311817504.13007.12492813581667605313@e6b6f09ec485>
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

Hi,

On 28-03-2025 04:59, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2hpg: Add Wa_16025250150 (rev2)
> URL   : https://patchwork.freedesktop.org/series/146709/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def_FULL -> xe-pw-146709v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-146709v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146709v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-146709v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
>     - shard-lnl:          [PASS][1] -> ([PASS][2], [INCOMPLETE][3]) +1 other test ( 1 incomplete, 1 pass )
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_vblank@query-busy-hang:
>     - shard-dg2-set2:     [PASS][5] -> ([INCOMPLETE][6], [PASS][7]) +2 other tests ( 1 incomplete, 1 pass )
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-464/igt@kms_vblank@query-busy-hang.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_vblank@query-busy-hang.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-463/igt@kms_vblank@query-busy-hang.html
> 
>   * igt@kms_vblank@query-busy-hang@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-432/igt@kms_vblank@query-busy-hang@pipe-d-dp-2.html
> 
>   * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0:
>     - shard-lnl:          [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-lnl-4/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-lnl-7/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_compute0.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
>     - shard-bmg:          [PASS][11] -> ([PASS][12], [ABORT][13])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
>     - shard-dg2-set2:     [PASS][14] -> ([ABORT][15], [PASS][16])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def/shard-dg2-435/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-435/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/shard-dg2-436/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
> 

These possible regressions do not seem to be related to my patch.


--
Regards
Aradhya
