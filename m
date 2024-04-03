Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C533CD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC19112BE0;
	Wed,  3 Apr 2024 15:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpuhtVAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219258920E
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712159239; x=1743695239;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WMvhD82WLZNq8D9M5iAuy7ylMiOMi58hYiTpgaiKZ1Q=;
 b=SpuhtVArChGbRuFFH2A+4MMILbQOdMvh1kzzp/J28Q+hPC1JognGhoMM
 TOKLv7VrfIqeWB8D2lCj1BpL5xRupp3KLI/MYLIHX8RA7TgynBWsf2IRX
 5wLRwnkcrmPuC2oOk9YI9cHmCsFBNxnrapktGCK2EkgpJkZdytPCWH6I/
 tYsT+KOZTeWlMrU7e62RNq+fliCFqGl3Fmx3AbMmGbaQMf3oLqcLAxqeL
 kPL0rOV1oKEUXRxs/BeTWijJizkcCtMJa7p2ZqheI0aXCbz4C2jmTIJmd
 FqvGl3LS+l9i7+vx+rs3Qw/lD2Pty195Qdo1gw4XaxEWDKoVOyqK3pCtg w==;
X-CSE-ConnectionGUID: U0vgWwQtRHS/EmEtEJRvBg==
X-CSE-MsgGUID: PpoEkgl7RnOVDWFGI+0HyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7258184"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7258184"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:47:18 -0700
X-CSE-ConnectionGUID: Py98EZqGQhOfLj04tI9RtQ==
X-CSE-MsgGUID: 6b77cyL8SYWdpo9yboMCpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="41642775"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.15])
 ([10.246.36.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:47:17 -0700
Message-ID: <da259b55-5bbe-4f1b-82cc-4399d2514c14@linux.intel.com>
Date: Wed, 3 Apr 2024 17:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Protect devcoredump_free
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20240403145054.97414-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240403145054.97414-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Rodrigo,

On 4/3/2024 4:50 PM, Rodrigo Vivi wrote:
> While we don't have the full flow protection when devcoredump
> is accessed after device unbind. Let's at least for now
> protect against null dereference:
>
> [  422.766508] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> [  423.119584] RIP: 0010:xe_vm_snapshot_free+0x30/0x180 [xe]
>
> While at it, I also fixed a non-standard code-declaration block
> on the similar function of xe_guc_submit.
>
> Fixes: e5f661bb56d4 ("drm/xe/devcoredump: Print errno if VM snapshot was not captured")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 1 +
>   drivers/gpu/drm/xe/xe_vm.c         | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f42f1b567067..6e32f9ce4eb5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1961,6 +1961,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>   void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot)
>   {
>   	int i;
> +
>   	if (!snapshot)
>   		return;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f4bfb2705956..ccb2e1c67c2c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3514,7 +3514,7 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>   {
>   	unsigned long i;
>   
> -	if (IS_ERR(snap))
> +	if (!snap || IS_ERR(snap))
>   		return;

You can use IS_ERR_OR_NULL() here.


Regards,

Nirmoy

>   
>   	for (i = 0; i < snap->num_snaps; i++) {
