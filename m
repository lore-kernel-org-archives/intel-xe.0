Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB481C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 14:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB0C10EAAF;
	Thu, 13 Jun 2024 14:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oy0sbYTC";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFBB10EAB4
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 14:30:07 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7043102dcc1so901441b3a.2
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718289007; x=1718893807; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=6mSnD2NP45xbhbQGgMnQrNtHehZ4j0M4c9KMGZenGok=;
 b=Oy0sbYTCIFwAOinsCwVBTgTQbCCdFCJDZdaN71gW/gpx+QOPZYLG3AZeB67FR1pjLJ
 xwqi+rOfIq21HgbYrHRx9HYaAcLYGbpWP1DgJm/Ia1FE0AKiYQGmR1nU3dPdiij83f8M
 CbKIG8482sbomZyXS0I6dVmum6jvNlTAD6hNQsUqAcoUCqeBkwdZskARCPybg/AdiOyX
 xTGYxsg/Us+aBLlzHQFJc6Bf7HRYAnqiFVteVXvB3qZBTVD/wIbOlV2c63+6Z5rysom7
 01YDAbMkJHu1M7Gi3BCkO8uqlGvPF2uJ6Br9N3GR1brfyC0cIS93UZr69OPklNXJCkdD
 3IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718289007; x=1718893807;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mSnD2NP45xbhbQGgMnQrNtHehZ4j0M4c9KMGZenGok=;
 b=mLNui6WXbwjUxqyFj77tkRJoDKSfo6lLH2hEUSLlJnmEk0lXD3xtadGvqpeNhcRrHL
 Ar96W55cbAXsqEUS7YlRohypAhKc6KFXRa1Tiw4CD7Ajd3faon6KalEQO797KJS0Iybg
 NIJUxJ6DkkZIVmt9oFvAnfn6iBM6NMCf2BDDvpIfxvFbA3sXYhfqa4+XSYvkW3Qjoqsp
 Ppq/ounO20Hc9SfhjizeA0ZC0fkdHcT4c0pcZy5DAUG2/tLCN5rXDBCXmZ8ubMf/1rzb
 iFzY9rqOsGlYZbe3gg+dnABSM2pt2BJUQPQMEM002vgI4i92js83aVOc3q4DiHdGsGNq
 4Tsg==
X-Gm-Message-State: AOJu0YwPoK/8ll59xVrp+tEsg8HDDft8NVbxXAT1coOg8bST1Hz+9dLd
 nry511JvayVmU1Tjxypoi+mwx665QiFF94wTlG0uGYDx2AjM+empZXo5HA==
X-Google-Smtp-Source: AGHT+IEtn7qVEk2yH4MQfuk1T7QOakhyDV0OG6tWyEiBN49eQf5yw6rRBteHReAWrle3QC+1MPEZCA==
X-Received: by 2002:a05:6a00:1816:b0:705:951e:ed9d with SMTP id
 d2e1a72fcca58-705bced2c7bmr5798598b3a.28.1718289006439; 
 Thu, 13 Jun 2024 07:30:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb6b9besm1378911b3a.165.2024.06.13.07.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 07:30:04 -0700 (PDT)
Date: Thu, 13 Jun 2024 07:30:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v5] drm/xe/hwmon: Add infra to support card power and
 energy attributes
Message-ID: <7a9cebda-033e-47b2-ab40-3d0394e41d06@roeck-us.net>
References: <20240328175435.3870957-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328175435.3870957-1-karthik.poosa@intel.com>
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

On Thu, Mar 28, 2024 at 11:24:35PM +0530, Karthik Poosa wrote:
> Add infra to support card power and energy attributes through channel 0.
> Package attributes will be now exposed through channel 1 rather than
> channel 0 as shown below.
> 
> Channel 0 i.e power1/energy1_xxx used for card and
> channel 1 i.e power2/energy2_xxx used for package power,energy attributes.
> 
> power1/curr1_crit and in0_input are moved to channel 1, i.e.
> power2/curr2_crit and in1_input as these are available for package only.
> 
> This would be needed for future platforms where they might be
> separate registers for package and card power and energy.
> 
> Each discrete GPU supported by Xe driver, would have a directory in
> /sys/class/hwmon/ with multiple channels under it.
> Each channel would have attributes for power, energy etc.
> 
> Ex: /sys/class/hwmon/hwmon2/power1_max
>                            /power1_label
>                            /energy1_input
>                            /energy1_label
> 
> Attributes will have a label to get more description of it.
> Labelling is as below.
> 		power1_label/energy1_label - "card",
> 		power2_label/energy2_label - "pkg".
> 
> v2: Fix checkpatch errors.
> 
> v3:
>  - Update intel-xe-hwmon documentation. (Riana, Badal)
>  - Rename hwmon card channel enum from CHANNEL_PLATFORM
>    to CHANNEL_CARD. (Riana)
> 
> v4:
>  - Remove unrelated changes from patch. (Anshuman)
>  - Fix typo in commit msg.
> 
> v5:
>  - Update commit message and intel-xe-hwmon documentation with "Xe"
>    instead of xe when using it as a name. (Rodrigo)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
[ ... ]

>  
>  static umode_t
> -xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
> +xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
>  	u32 uval;
>  
>  	switch (attr) {
>  	case hwmon_power_max:
> -		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
>  	case hwmon_power_rated_max:
> -		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
>  	case hwmon_power_crit:
> -		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> -			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +		if (channel == CHANNEL_PKG)
> +			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> +				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;

Coverity complains about this, so I had a closer look.

520     	case hwmon_power_crit:
521     		if (channel == CHANNEL_PKG)
>>>     CID 1593858:  Uninitialized variables  (UNINIT)
>>>     Using uninitialized value "uval".
522     			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
523     				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;

Normally one would assume this to be a false positive, assuming that
xe_hwmon_pcode_read_i1() would return an error code if it leaves uval
uninitialized.

Looking at the following call path:

xe_hwmon_pcode_read_i1()
  xe_pcode_read()
    pcode_mailbox_rw()
      __pcode_mailbox_rw()

In __pcode_mailbox_rw(), we see:

       if (gt_to_xe(gt)->info.skip_pcode)
                return 0;

So there is a call path where uval is left uninitialized after a call to
xe_hwmon_pcode_read_i1() and no error is returned. Maybe that is as
expected (the call is made several times, after all), but it is still
surprising.

Guenter
