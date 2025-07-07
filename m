Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1699C8303C
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 17:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B210E505;
	Mon,  7 Jul 2025 17:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxOD9PBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D99910E505
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751910145; x=1783446145;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Uc2FXcVu38lWizGnDl7VscK1yR0lsm65b7wALxxPcPs=;
 b=jxOD9PBBvWI6KDhvxoXgMiDjnkGnTrQxbfSV870auvb0HOOMOXVZ3+eS
 M31aQtyVxVsBH02Ez/PPIiDCgaQr6owPSFIknlGbhj0rkE1oyxZVYxk5j
 cTtFtnue0987LcNjLea+2p7jxfEVAuIJspliKJZaWUoV+GEPSUrGy/JFe
 Bm0+yNWwiDxbEg7nbqINkJnH5G/UoKIA1gq2MviMrqAQ0Vp3PWQrzkbdG
 ie5t8VS0N0EC3Xp9G5iR7X+8aWIgd2MVDerMNhhVSglGO5Z4jYd/0JAes
 Ij68kRMdGTwRWpXYKyasyQws1sYdDKB3Nf1aNfZq3gP9GvMXaeVAolVIS Q==;
X-CSE-ConnectionGUID: 9gw/am2BQGS8HnHieuk4JA==
X-CSE-MsgGUID: XUev0zM1SOykXoaGSjwlGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53852602"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="53852602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 10:42:24 -0700
X-CSE-ConnectionGUID: ph6CKKJMSXWyywUS6sHMqw==
X-CSE-MsgGUID: jtItrW18T42R5uJg8lIWeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="155400424"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 07 Jul 2025 10:42:22 -0700
Received: from [10.245.96.176] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.176])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 643BD32CB1;
 Mon,  7 Jul 2025 18:42:21 +0100 (IST)
Message-ID: <db1cddee-96cb-48f4-8034-d95117256fce@intel.com>
Date: Mon, 7 Jul 2025 19:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250707021510.3525028-2-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250707021510.3525028-2-shuicheng.lin@intel.com>
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



On 07.07.2025 04:15, Shuicheng Lin wrote:
> The parameter threshold is with size in mb, not in bits.

s/mb/MiB

> Correct it to avoid any confusion.
> 
> Fixes: 30c399529f4c ("drm/xe: Document Xe PM component")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index bcfda545e74f..c7622e1c614b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -754,7 +754,7 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
>  /**
>   * xe_pm_set_vram_threshold - Set a vram threshold for allowing/blocking D3Cold

while around, please s/vram/VRAM

>   * @xe: xe device instance
> - * @threshold: VRAM size in bites for the D3cold threshold
> + * @threshold: VRAM size in mb for the D3cold threshold

s/mb/MiB

>   *
>   * Returns 0 for success, negative error code otherwise.

and also please fix return section according to [1]

[1] https://docs.kernel.org/doc-guide/kernel-doc.html#return-values

>   */

