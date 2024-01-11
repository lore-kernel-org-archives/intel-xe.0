Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7AAC4707B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 20:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034F410E998;
	Thu, 11 Jan 2024 20:30:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4525410E9D9
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 20:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705005035; x=1736541035;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=scAeeibkeNIbck3EOnvYNn1j0l8/F/WxdzJU9szObsM=;
 b=hDvktjTlv+0ETjmoo0t19ZyzzigaB15DNGTTN7qfbMo2klTtnyx2J6lD
 L7QGtDfxNxV3z/oy6X1yspJgruWNJzsNZEQ8S7lMDccdNeOTjnUtnZuRS
 iT1DVIfjf1+Sji46IafoG1yfY04qY4veFM346lRSgAIEq7DLF63fNlup8
 vDFs531jUDLaumfC+TL6M8pyM2+njvHva2tvIM7VAL4Ht9Q2VgGxs+U6n
 K5JZiv23yndjgLdGPPVcOEmOB5KEoEJ5N2fjiwRkwRyvuT8g5AT3Adw/5
 gHjrWHERYHX/w/B1QsDDvmYVe/HA48LRPmoIf+t6BkmPGTj5pjBdAECec A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="485156672"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="485156672"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 12:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="926149865"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="926149865"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2024 12:30:33 -0800
Received: from [10.249.150.229] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BE1B243C1D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 20:30:31 +0000 (GMT)
Message-ID: <911c1338-24d0-499f-84c5-40983fd2dcee@intel.com>
Date: Thu, 11 Jan 2024 21:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_Introduce_GuC_con?=
 =?UTF-8?Q?text_ID_Manager?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240110174622.409-1-michal.wajdeczko@intel.com>
 <170492736329.270358.9755170133663410009@5338d5abeb45>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <170492736329.270358.9755170133663410009@5338d5abeb45>
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



On 10.01.2024 23:56, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce GuC context ID Manager
> URL   : https://patchwork.freedesktop.org/series/128445/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9_BAT -> xe-pw-128445v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-128445v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-128445v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-128445v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
>     - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

doesn't look like a real regression
these "exec...twice" tests doesn't seem stable (seen similar
"regressions" on other unrelated series)

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-128445v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
>     - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
>     - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
>     - bat-dg2-oem2:       [FAIL][7] ([Intel XE#480]) -> [PASS][8] +1 other test pass
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
> 
>   
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7667 -> IGT_7668
>   * Linux: xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9 -> xe-pw-128445v1
> 
>   IGT_7667: e9b26a2f44a6b1125b36a77ed8366cb82b502622 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7668: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-614-bb9e8031d2feb59becdea41e54e62f1bc47f3ef9: bb9e8031d2feb59becdea41e54e62f1bc47f3ef9
>   xe-pw-128445v1: 128445v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v1/index.html
> 
