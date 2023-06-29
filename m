Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7CDEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 14:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FAD10E3DF;
	Thu, 29 Jun 2023 14:59:08 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B874110E3DF
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688050746; x=1719586746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pW5f/SOidtI32TmP2Ow6syUllxa5uymxiG6173aVAHk=;
 b=B2ib2KyG7CW1mGaawvcHJZhVJHgoDN7Ihl/IHQUSqYly1PkG0Cz0vepP
 nlLEQvOo/fBhRBHKMoGmdZPVAtblw6YgYfdkpqQF1IDrF5lTGRUviRNfz
 iHlUqt0+cSqgHIXaDH//iRuAbaXCBXxvS/3g/UhOCyCT3Dj7Cx+QFFwHL
 ap/ZPjYbd2JilVtMqqAESK9CEd15Fx3NdrMv4IPdF8QXuFQNhi7rEX9oH
 ssOM6IMLA367aBDacEXJWSg1YWu2HI5XzqsM029xuyx0B+JNiT/VS5Ukn
 UdqqJUQKJ/onXOifsa6E8IAC7kIUeQzv8HuoZX4PfTiedrXCn0Kc6y4IA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="425818325"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="425818325"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 07:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="752660105"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="752660105"
Received: from gkarray-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.226])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 07:59:01 -0700
Date: Thu, 29 Jun 2023 16:58:57 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZJ2cMWcYcmEEIaoV@ashyti-mobl2.lan>
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <20230627183043.2024530-5-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627183043.2024530-5-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 4/6] drm/xe/hwmon: Expose input voltage
 attribute
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
Cc: linux-hwmon@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Badal,

> +static int hwm_get_voltage(struct hwm_drvdata *ddat, long *value)
> +{
> +	u32 reg_val;
> +
> +	if (IS_DG2(gt_to_xe(ddat->gt))) {

if you revert this if() you save a level of indentation:

	if (!IS_DG2(gt_to_xe(ddat->gt)))
		return -EOPNOTSUPP;

The rest looks straight forward.

Andi

> +		process_hwmon_reg(ddat, gt_perf_status,
> +				  reg_read, &reg_val, 0, 0);
> +		/* HW register value in units of 2.5 millivolt */
> +		*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
> +
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
