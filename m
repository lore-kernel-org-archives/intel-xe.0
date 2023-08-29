Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09C4C83F14
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 09:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBE110E1AA;
	Tue, 29 Aug 2023 09:09:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124FD10E1AA
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 09:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693300185; x=1724836185;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aygqWdJlCFALDWTykvuf8lb14JqYVbY+XceSA3ibLVc=;
 b=BbAkIws1jiIoZSN30tcGy72LjOHGPcLOZhuSv5YS2c+U5s2l2pgDq+3T
 9r110ebJBeU4Eb4gq81ZSg1yor4+twdqk1lKwaP72OfPX9wTZVIKCfY0U
 uIQhHPOSdKdDaPUT0KO/BA5LWBm1ou+w1xivCZ7eCZQNP6HGJ6vrGM0kf
 Qm4SdYViXJDp7RKdDUQzqMnA7tfXUTRrskpXVCInTX+CzrtpZaFDxTqt7
 51PmFb7Bbta/udUpFh36Cn3txsHf8vzxkOzvJQBe4XxScW0q8q51ZYwHV
 TLrkNdzD3mRM156AWqkiQlwTUc3bmrLzFd57UfSl7lr+UfIlt+8sH/SYf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="439270739"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="439270739"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 02:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="862169978"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="862169978"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 02:09:44 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.21.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0EF16580D94;
 Tue, 29 Aug 2023 02:09:42 -0700 (PDT)
Date: Tue, 29 Aug 2023 11:09:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230829110940.35ca41a4@maurocar-mobl2>
In-Reply-To: <20230829080429.4024-1-niranjana.vishwanathapura@intel.com>
References: <20230829080429.4024-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pvc: Use fast copy engines as
 migrate engine on PVC
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023 01:04:29 -0700
Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com> wrote:

> Update Makefile to generate OOB header file for xe_migrate.c
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 550cdfed729e..78365e14f0d3 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -37,7 +37,7 @@ quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>  $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>  	$(call cmd,wa_oob)
>  
> -$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o: $(generated_oob)
> +$(obj)/xe_guc.o $(obj)/xe_wa.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $(obj)/xe_migrate.o: $(generated_oob)
>  
>  # Please keep these build lists sorted!
>  
Looks good to me. I would prefer to keep the targets that depends on
$(generated_oob) in alphabetic order.

With or without such change:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
