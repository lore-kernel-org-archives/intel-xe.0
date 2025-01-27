Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A882CC02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 15:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774FC10E563;
	Mon, 27 Jan 2025 15:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4XFHDMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5825010E563
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737990087; x=1769526087;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wjrJ65xCCKYw+VIQkiQKt3xFOnrjuQuVkXMYD4vepv4=;
 b=d4XFHDMuKNo4GH+8uoaYHYhojHUyi90M5Sld5njioqQkBAq38X7Po/0l
 YNpPfGpjItMorLg9x/J4IqJRWyrRFCTq46I/XjwRONJFi10wboWw6PNEf
 kftCqZ3SDAYR5m6EGo21HDSzlAF/1qyfmI3yzNWw2N+q2iXAt0AMgCg18
 L5YLNSQgSH4/7W5s7beq7vy2hSJH2BLyNmTLBxoFoCwMkHl3IrRlH7kFJ
 p2CoH8v+qYcr9fi8m5TaBv+jfZqmL/ZAd/z6Y6X9LFn+UcQFviseAqPPp
 j2tnXJKGj1hOHqk6USBDGHbRe6ERd+baY+ZssXgtf3GIgvS/pBRuGJgZW w==;
X-CSE-ConnectionGUID: 4tLSSDwnTCuZIIYEd9O2Ng==
X-CSE-MsgGUID: 3Hb3j9M6ScGOGpi8UOP/9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49105333"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="49105333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 07:01:27 -0800
X-CSE-ConnectionGUID: FuL8b1yqRIqQKXQnfCP1yQ==
X-CSE-MsgGUID: LFBWoYF/T/68cwGPEhe4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113599261"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 27 Jan 2025 07:01:26 -0800
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 40D6E28799
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 15:01:25 +0000 (GMT)
Message-ID: <829c1e47-ef2c-4efa-b745-76d80af7d485@intel.com>
Date: Mon, 27 Jan 2025 16:01:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Use_GuC_Buffer_Cache_during_policy_provisioning?=
To: intel-xe@lists.freedesktop.org
References: <20250124185247.676-1-michal.wajdeczko@intel.com>
 <173777733997.99963.1606818443566568312@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173777733997.99963.1606818443566568312@b555e5b46a47>
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



On 25.01.2025 04:55, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Use GuC Buffer Cache during policy provisioning
> URL   : https://patchwork.freedesktop.org/series/143949/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2549-b36df02c99e3246ba2a90e951c71797327374db7_full -> xe-pw-143949v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143949v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143949v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-143949v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 

all unrelated, all in KMS

>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

<3> [531.599943] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)
<3> [531.610408] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did
not complete or timeout within 10ms (status 0xad40023f)

> 
>   * igt@kms_sequence@queue-idle@pipe-b-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +2 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-4/igt@kms_sequence@queue-idle@pipe-b-dp-2.html
> 
>   * igt@kms_setmode@basic:
>     - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/shard-bmg-4/igt@kms_setmode@basic.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143949v1/shard-bmg-7/igt@kms_setmode@basic.html

we don't have PF on BMG


