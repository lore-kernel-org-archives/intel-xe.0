Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF63AC001DE
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 23:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1D410E586;
	Wed,  2 Aug 2023 23:32:13 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88DE10E586
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 23:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691019131; x=1722555131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wsbr/Lqy1eHdkS7ufvZr0sVg10Oh2t77yQEQ/F7Iaw4=;
 b=nqIDqIGm/lSUUTkPWIC3v9eGxYFttz9BqwLz6IuIOaX+YSmhQQ8MLAVp
 0Ujh7ECFeQndjQPKlpWPmYQ1aL/oxnr19kXMcbwKj8i7euF6mNXWcTdUn
 7rgWvf3wTLOxZ5YZADt+JWz76UkoHs4wyXU6kXsTGlEXrzK37TshZb++g
 uOh1c/kn4YrL/5g3184MEsZjftG4MbkKgh9CUHft1AbPFVxlXuFb7hae2
 VMr8uEh48nr/fiR7SBQ/s6aIxj8vVCMEOnEgg/magnKN13fFL7Imiceli
 lvgT+UZqHxemYgFBkOLfS3ddG0+cdTA5/XxKg0CjEuQrR8PpZsYzZJLZ8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="368625408"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="368625408"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:32:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="764390190"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="764390190"
Received: from mlytkin-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.38.55])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 16:32:07 -0700
Date: Thu, 3 Aug 2023 01:32:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Message-ID: <ZMrndXUXs4nB5fnx@ashyti-mobl2.lan>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-5-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802135241.458855-5-badal.nilawar@intel.com>
Subject: Re: [Intel-xe] [PATCH v3 4/6] drm/xe/hwmon: Expose input voltage
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

[...]

>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>  	NULL
>  };
>  
> @@ -244,6 +254,18 @@ static int hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>  			      uval);
>  }
>  
> +static int hwmon_get_voltage(struct xe_hwmon_data *ddat, long *value)

one thing I forgot to mention also in previous patches is that
hwmon_* and HWMON_* as prefixes do not belong to the xe driver.

You should use an xe related prefix, like xe_hwmon.

Rest looks good,
Andi
