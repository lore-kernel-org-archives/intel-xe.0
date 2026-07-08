Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A3CC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 15:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BE210E61F;
	Wed,  8 Jul 2026 15:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1gevDQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AC110E61F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783524898; x=1815060898;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uPldZnSIdMUdVBCNfawRUqSkCrKjy8UGz6tupK+YVAk=;
 b=P1gevDQ+ai5IioP4IfYKL+qc8PCNQ6sF/3c6uvvb1YKta24U54Ee/j14
 iKJk4CmrHbnBVnIDRdHicozfq+Ab3657B6TyxDb6bgJx+BktGovcbzQTH
 FIZ1gsD5mfbPAdGd1lSDXessGxBVSZdSGgQeeP/SNJ7NM+VKdAb26Htv1
 ZkgMQxcDKyBJG9mHpyy8jzbj6WvJ2ntpt/44rEPsi8aesa9gwJXGExRgf
 LYvvC5pwagADJvs2W90XZmzYYDLioo9OtzLmpJzouXMHw4hG/v9nXWYkE
 180YFA9oOXiab30EYNUKgmKKq2mtVvD1dh/1FDzkybQBp4s7oGJBai9Bb w==;
X-CSE-ConnectionGUID: 5Oz0DexQQH2jTnJ2W5vf0Q==
X-CSE-MsgGUID: dMfK68zjSP+bqOc/Vtrz4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88104026"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="88104026"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 08:34:57 -0700
X-CSE-ConnectionGUID: vMVq/9UyQs+6SgNnQsc3Ug==
X-CSE-MsgGUID: rb+DgLewTJO5jPHJL2LAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="292504506"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.80])
 ([172.28.182.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 08:34:57 -0700
Message-ID: <7634b3c8-5d72-4ff5-963c-3be7853ba810@linux.intel.com>
Date: Wed, 8 Jul 2026 17:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvdWM6?=
 =?UTF-8?Q?_Apply_RCS/CCS_yield_policy_to_SR-IOV_VFs?=
To: intel-xe@lists.freedesktop.org
References: <20260708100616.1050537-1-marcin.bernatowicz@linux.intel.com>
 <178351597091.165013.2931847048806160536@6beec6c84f66>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <178351597091.165013.2931847048806160536@6beec6c84f66>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 7/8/2026 3:06 PM, Patchwork wrote:
> == Series Details ==
>
> Series: drm/xe/uc: Apply RCS/CCS yield policy to SR-IOV VFs
> URL   : https://patchwork.freedesktop.org/series/169989/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-5365-6a22b406f919a5b891ceea74421732a026543902_FULL -> xe-pw-169989v1_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with xe-pw-169989v1_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-169989v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in xe-pw-169989v1_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_vblank@query-forked-hang:
>      - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5365-6a22b406f919a5b891ceea74421732a026543902/shard-lnl-7/igt@kms_vblank@query-forked-hang.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169989v1/shard-lnl-7/igt@kms_vblank@query-forked-hang.html
Not related to the change.
--
marcin

>    
> Known issues
> ------------
>
>    Here are the changes found in xe-pw-169989v1_FULL that come from known issues:
[...]
> Build changes
> -------------
>
>    * Linux: xe-5365-6a22b406f919a5b891ceea74421732a026543902 -> xe-pw-169989v1
>
>    IGT_8992: 1e912fa143a35c4238a1fbcf94443175d8ce1d60 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    xe-5365-6a22b406f919a5b891ceea74421732a026543902: 6a22b406f919a5b891ceea74421732a026543902
>    xe-pw-169989v1: 169989v1
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169989v1/index.html
>
