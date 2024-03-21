Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54000C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 23:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88C211222A;
	Thu, 21 Mar 2024 23:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KnVhIWZF";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BA811222C
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 23:00:27 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1e04ac4209eso13382815ad.1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 16:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711062027; x=1711666827; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=vydzG9aeyX3M7A4kiFOylwajQQaC5SHQWqoz/TY9Om4=;
 b=KnVhIWZFawb5lxT993X/pgC0yCjFVsyco+xl3209445wUNrOOobknhCsFI64ATNVWg
 zoNDUGeIrGB/ftCgWL3N80ZyY4SLKy2qxeH30Mq1rvyVJ4vcKmbVWM/cfY/m5XHcld70
 R9lUM37hITlOl7+Vy9VAECF6o+yhHiRRqfn4eLiQ6Kouy/pzgSoyQ6eIQ8xVpuQhZxiT
 oyCNW1wZJQQ/ECa9XtbBs9+sf/6LvI66TYeYoTfurE1xpG1MReMlk5T1lng0IFC0c0Yq
 MhNWSVIEGleqIoCI7gTseKyHSCfnwTxt6fNXhcc1QTG1AIhpwtp1hVX5jGFR2xi6/7db
 KiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711062027; x=1711666827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vydzG9aeyX3M7A4kiFOylwajQQaC5SHQWqoz/TY9Om4=;
 b=pK7syaYauq9AXF3pUo5JsfqEkR7wqhPCYJeEHg55GApnS7Ly+hc5tGaoJrxq9hhFAj
 R7/M0JOZ6xR5UArxP9fTIA7Yro/rrxmrmvKLmTLKfjfdmrOk1erGnzt7tuhJYZ8Mni4R
 awm2ArzoiRH726E3eWqaYKRCVb1A63r2ufqEPKWgMM0kbUejUWJI4ogQm4l2NxSVI9iB
 ZELDPmNwRVjEQHBkUlE7yBZ54QNTEhJK7Sa4I4GElHVNBlj9IbEQ1X22Wt3lprTxfGtY
 PE0kX4pHDbQH++gO0Vc+0nsvlPFlQXvrsSF2utUF13SV4Ri78rVFUQjsjFP6H2uQbPuz
 qQFQ==
X-Gm-Message-State: AOJu0Yxc6aosMLKAfQ11GMMI3eNx2u9Y38X9iy/r71uSASZKHbw+ia6c
 ntgOzQ9nrktsBbr3Nfm98xgi2jWX+rcJuqEuG67wtEAo4linbfrl
X-Google-Smtp-Source: AGHT+IEO3/WWyf2AQZhnfH88RFiQI7AIQ1mjE05/eUI745WSjAl8WNsHnK0XT95eRxQbM1l1rRdVKA==
X-Received: by 2002:a17:903:32cc:b0:1de:fdbd:9324 with SMTP id
 i12-20020a17090332cc00b001defdbd9324mr934741plr.10.1711062024461; 
 Thu, 21 Mar 2024 16:00:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170902ee5500b001deed044b7dsm395501plo.185.2024.03.21.16.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 16:00:23 -0700 (PDT)
Date: Thu, 21 Mar 2024 16:00:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/xe: Fix END redefinition
Message-ID: <49e68474-8e13-4c25-8f75-0331f6e181a3@roeck-us.net>
References: <20240321221726.102193-1-lucas.demarchi@intel.com>
 <20240321221726.102193-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321221726.102193-2-lucas.demarchi@intel.com>
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

On Thu, Mar 21, 2024 at 03:17:25PM -0700, Lucas De Marchi wrote:
> mips declares an END macro in its headers so it can't be used without
> namespace in a driver like xe.
> 
> Instead of coming up with a longer name, just remove the macro and
> replace its use with 0 since it's still clear what that means:
> set_offsets() was already using that implicitly when checking the data
> variable.
> 
> Closes: http://kisskb.ellerman.id.au/kisskb/buildresult/15143996/
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks!
Guenter

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 95e0f7b1ec3f..db0793273de0 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -115,7 +115,6 @@ static void set_offsets(u32 *regs,
>  #define REG16(x) \
>  	(((x) >> 9) | BIT(7) | BUILD_BUG_ON_ZERO(x >= 0x10000)), \
>  	(((x) >> 2) & 0x7f)
> -#define END 0
>  {
>  	const u32 base = hwe->mmio_base;
>  
> @@ -186,7 +185,7 @@ static const u8 gen12_xcs_offsets[] = {
>  	REG16(0x274),
>  	REG16(0x270),
>  
> -	END
> +	0
>  };
>  
>  static const u8 dg2_xcs_offsets[] = {
> @@ -220,7 +219,7 @@ static const u8 dg2_xcs_offsets[] = {
>  	REG16(0x274),
>  	REG16(0x270),
>  
> -	END
> +	0
>  };
>  
>  static const u8 gen12_rcs_offsets[] = {
> @@ -316,7 +315,7 @@ static const u8 gen12_rcs_offsets[] = {
>  	REG(0x084),
>  	NOP(1),
>  
> -	END
> +	0
>  };
>  
>  static const u8 xehp_rcs_offsets[] = {
> @@ -357,7 +356,7 @@ static const u8 xehp_rcs_offsets[] = {
>  	LRI(1, 0),
>  	REG(0x0c8),
>  
> -	END
> +	0
>  };
>  
>  static const u8 dg2_rcs_offsets[] = {
> @@ -400,7 +399,7 @@ static const u8 dg2_rcs_offsets[] = {
>  	LRI(1, 0),
>  	REG(0x0c8),
>  
> -	END
> +	0
>  };
>  
>  static const u8 mtl_rcs_offsets[] = {
> @@ -443,7 +442,7 @@ static const u8 mtl_rcs_offsets[] = {
>  	LRI(1, 0),
>  	REG(0x0c8),
>  
> -	END
> +	0
>  };
>  
>  #define XE2_CTX_COMMON \
> @@ -489,7 +488,7 @@ static const u8 xe2_rcs_offsets[] = {
>  	LRI(1, 0),              /* [0x47] */
>  	REG(0x0c8),             /* [0x48] R_PWR_CLK_STATE */
>  
> -	END
> +	0
>  };
>  
>  static const u8 xe2_bcs_offsets[] = {
> @@ -500,16 +499,15 @@ static const u8 xe2_bcs_offsets[] = {
>  	REG16(0x200),           /* [0x42] BCS_SWCTRL */
>  	REG16(0x204),           /* [0x44] BLIT_CCTL */
>  
> -	END
> +	0
>  };
>  
>  static const u8 xe2_xcs_offsets[] = {
>  	XE2_CTX_COMMON,
>  
> -	END
> +	0
>  };
>  
> -#undef END
>  #undef REG16
>  #undef REG
>  #undef LRI
> -- 
> 2.43.0
> 
