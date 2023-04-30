Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D86C77B60
	for <intel-xe@archiver.kernel.org>; Sun, 30 Apr 2023 17:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C2810E053;
	Sun, 30 Apr 2023 17:47:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FB810E053
 for <intel-xe@lists.freedesktop.org>; Sun, 30 Apr 2023 17:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682876863; x=1714412863;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=T/uNohxedv4OdHW3acZ1CgwTtFbaS/xKc+3wZ4pHoHU=;
 b=G98ewZEwccBOvR3viNRwpU9GJck+KVqpFxg41ka9rjHjSNOuZG9rp4vk
 AbqWhBqwepRTkLXCtygcqDnVSRRceu3q5mbQA/xKtaOHRXbw6kfDsGDQ8
 nf0M4BQN233YtYjvemmrgsyoIl7yoG4AwVwhMEHSjMQkzzc8ITG7t7a3a
 IaO5nxEPDpt2aqdUDRDABZwLNz7haKIeZHv8UbzgimcuLBk9Z1felSlO5
 KpLDRbeUbjVlWxePH8rweXkIsk1qgtlDt4sTYDwZ7sNZBgDfoq2LRQQ82
 5RGx8X0VP3qdQDcA+uL3bE6/IbDftDqU8zVhLMNTn9r0m4LI4IcSDq1xh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="350989716"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="350989716"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2023 10:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="941805138"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="941805138"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga006.fm.intel.com with ESMTP; 30 Apr 2023 10:47:40 -0700
Received: from [10.249.147.125] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.147.125])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A6BC4365D9;
 Sun, 30 Apr 2023 18:47:39 +0100 (IST)
Message-ID: <8fdb51d8-0626-0d03-2080-b978f25cfa3b@intel.com>
Date: Sun, 30 Apr 2023 19:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.1
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-4-lucas.demarchi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230429062332.354139-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe: Use media base for GMD_ID access
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



On 29.04.2023 08:23, Lucas De Marchi wrote:
> Instead of adding a hardcoded base, define GMD_ID() with a base
> argument and use it in all places.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 4 +++-
>  drivers/gpu/drm/xe/xe_pci.c          | 9 +++++----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4d87f1fe010d..da7b6d2c7e01 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -8,6 +8,8 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> +#define MTL_MEDIA_GT_BASE			0x380000

maybe for completeness (and to avoid using anonymous 0 offset in other
places) we should define also:

#define GRAPHICS_GT_BASE			0x0

> +
>  /* RPM unit config (Gen8+) */
>  #define RPM_CONFIG0					XE_REG(0xd00)
>  #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
> @@ -21,7 +23,7 @@
>  #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		XE_REG(0xd70 + (n) * 4)
>  #define FORCEWAKE_ACK_RENDER			XE_REG(0xd84)
>  
> -#define GMD_ID					XE_REG(0xd8c)
> +#define GMD_ID(base)				XE_REG((base) + 0xd8c)

this register is not the only one that's has it's counterpart at this
0x38000 MEDIA offset, and other registers we are treating in automatic
way, without the need to explicitly pass the 'base', so I'm not sure we
should change that here

>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>  #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>  #define   GMD_ID_STEP				REG_GENMASK(5, 0)

btw, is there a plan to s/REG_GENMASK/XE_REG_GENMASK or something ?

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 35dcb8781f2a..8687e51cb0a4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -276,7 +276,7 @@ static const struct xe_gt_desc xelpmp_gts[] = {
>  		.type = XE_GT_TYPE_MEDIA,
>  		.vram_id = 0,
>  		.mmio_adj_limit = 0x40000,
> -		.mmio_adj_offset = 0x380000,
> +		.mmio_adj_offset = MTL_MEDIA_GT_BASE,
>  	},
>  };
>  
> @@ -391,8 +391,9 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
>  	return NULL;
>  }
>  
> -static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
> +static u32 peek_gmdid(struct xe_device *xe, struct xe_reg gmdid_reg)

better to keep u32 but defined as new 'base' for the GMD_ID:

peek_gmdid(xe, GRAPHICS_GT_BASE)
peek_gmdid(xe, MTL_MEDIA_GT_BASE)

then since we parse the value according to the GMDID definition we will
prevent passing wrong register offset and always refer to the right
GMD_ID address inside the function:

static u32 peek_gmdid(struct xe_device *xe, u32 base)
{
	xe_reg gmdid = XE_REG(GMD_ID.addr + base);
...
	WARN_ON(base != GRAPHICS_GT_BASE && base != MTL_MEDIA_GT_BASE);
...
  	map = pci_iomap_range(pdev, 0, gmdid.addr, sizeof(u32));
...
	REG_FIELD_GET(GMD_ID_ARCH_MASK, value)


Michal

>  {
> +	u32 gmdid_offset = gmdid_reg.reg;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>  	u32 ver;
> @@ -441,7 +442,7 @@ static void handle_gmdid(struct xe_device *xe,
>  {
>  	u32 ver;
>  
> -	ver = peek_gmdid(xe, GMD_ID.reg);
> +	ver = peek_gmdid(xe, GMD_ID(0));
>  	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>  		if (ver == graphics_ip_map[i].ver) {
>  			xe->info.graphics_verx100 = ver;
> @@ -456,7 +457,7 @@ static void handle_gmdid(struct xe_device *xe,
>  			ver / 100, ver % 100);
>  	}
>  
> -	ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
> +	ver = peek_gmdid(xe, GMD_ID(MTL_MEDIA_GT_BASE));
>  	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
>  		if (ver == media_ip_map[i].ver) {
>  			xe->info.media_verx100 = ver;
