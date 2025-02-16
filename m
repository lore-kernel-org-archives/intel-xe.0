Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028E7C02198
	for <intel-xe@archiver.kernel.org>; Sun, 16 Feb 2025 20:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD00D10E259;
	Sun, 16 Feb 2025 20:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dljOPJms";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1F710E259
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Feb 2025 20:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739737920; x=1771273920;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=DiFTNsnW8yDlzExePw3IuaXEJ5KA7Sa164vP6Vg9HLE=;
 b=dljOPJmss2lsMUbf43MdrweJJ5oRu/0tzDQ6Nh+IxZorq4vvCjUU9rE8
 maYY3oSwXteAaCAImo5cEhL6NzPL/SFscJsev2ign5PgvqOhcnoBOZqCv
 gDVILLpiSpDm+TRh1wR6Lp0f+PnAcDA/CFhD9/mxQjKIX813e+Gv4fbv2
 2Gdn304QLcXnhB5IDZbCepMnPRHEdXBYSJUmQTjt4lr7JCG3xu194JiyN
 4lwsiPNPUJRXwJFcXc+84LdLXk672KE2DF1VNDBdRNLSzO1vbiyx26TuC
 20TYGpbkKS4h9U2sGw1uCo0+moSbuyjAsKqFDi8Jn8x19QCFOJP15KNIa w==;
X-CSE-ConnectionGUID: bVjb0Vj3SSaennvTzmNvoQ==
X-CSE-MsgGUID: WFZnCYMoQ+SNz4m2xsAVDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40558014"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; d="scan'208";a="40558014"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 12:31:59 -0800
X-CSE-ConnectionGUID: 4Aua1SbyTEu7qyqyR969TQ==
X-CSE-MsgGUID: PySo/7irSquuYM1HPguKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144863296"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 16 Feb 2025 12:31:59 -0800
Received: from [10.245.81.227] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.81.227])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4088672
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Feb 2025 20:31:58 +0000 (GMT)
Message-ID: <9b2453ab-b6aa-40be-8e11-c0100f2e51a8@intel.com>
Date: Sun, 16 Feb 2025 21:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Release_all_VFs_configs_on_device_removal_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20250211155034.1028-1-michal.wajdeczko@intel.com>
 <173932234878.1117740.5473400007206031840@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173932234878.1117740.5473400007206031840@b555e5b46a47>
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



On 12.02.2025 02:05, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Release all VFs configs on device removal (rev2)
> URL   : https://patchwork.freedesktop.org/series/144628/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2639-5a6f3d00770c0c384a79c34a74e049c80d8b235d_full -> xe-pw-144628v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-144628v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144628v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-144628v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 

both unrelated

>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2639-5a6f3d00770c0c384a79c34a74e049c80d8b235d/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144628v2/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_sequence@get-forked-busy:
>     - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] +4 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2639-5a6f3d00770c0c384a79c34a74e049c80d8b235d/shard-adlp-6/igt@kms_sequence@get-forked-busy.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144628v2/shard-adlp-6/igt@kms_sequence@get-forked-busy.html
> 

<3> [431.230376] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)
<3> [431.240847] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)


