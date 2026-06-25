Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE621CDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 15:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2E610F306;
	Thu, 25 Jun 2026 15:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3wUeoPL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E382E10F306;
 Thu, 25 Jun 2026 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782400234; x=1813936234;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=JrBabcnCfghdYJWyCx4aVau5GRUQ9fSLRxJAxqSP8kc=;
 b=U3wUeoPLruuy1ZqJcvRy4fd1cqYWVkH1fxZpS8vLxxvxL0DdNY7Rjxof
 nJJdvtercOcxbHFrNGiiyqCtWUQC6Aw4fO5VW/1DzUui/O2ZxdaRbtIhe
 mjj98NQqxqcgwBe8qx6Tp3Tr+cPxeuBptxvZaXeWOmLZYvWbnsfQ53NNK
 SzDLUjTC3RuxAzsp8tN6c1TR5VYgCxI2eQwwdq1dLQmdFbavxx7/xLrn8
 Hrcj9AOA3CtZinIRWoOTAPXyhuEp2kJpWrP99kw2Wu79XCENbo5uJOxYS
 vvoPUhluqNSzA1Vroe4g6d9UewEo1Mf/Cjzbwdk0D9u2n6sHxVsetxMl8 w==;
X-CSE-ConnectionGUID: oiGYuDO3Tg2SWc20HoqPgg==
X-CSE-MsgGUID: fiCleqpbQv+PllYNkxiv3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83185211"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="83185211"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:10:33 -0700
X-CSE-ConnectionGUID: DqeXBJdySoGqDauEuoFDfg==
X-CSE-MsgGUID: ETxJszuWS2ivLdv/M3kKHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="252745066"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 08:10:30 -0700
Date: Thu, 25 Jun 2026 17:10:27 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Imre Deak <imre.deak@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Mika Kahola <mika.kahola@intel.com>, 
 Luca Coelho <luciano.coelho@intel.com>, 
 Nemesa Garg <nemesa.garg@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 30/30] drm/i915/dp: return -EINVAL on failure
In-Reply-To: <aj04BaDXwD9dRLCF@ideak-desk.lan>
Message-ID: <253d225e-a3dd-694e-11e6-13152c54871d@intel.com>
References: <20260623224619.1949975-1-michal.grzelak@intel.com>
 <20260623224619.1949975-31-michal.grzelak@intel.com>
 <aj04BaDXwD9dRLCF@ideak-desk.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1838146869-1782400231=:605841"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1838146869-1782400231=:605841
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 25 Jun 2026, Imre Deak wrote:
> On Wed, Jun 24, 2026 at 12:46:19AM +0200, Michał Grzelak wrote:
>> Both intel_dp_rate_index() and intel_dp_link_config_index() in case of
>> failure return -1 which equates to -EPERM. Return -EINVAL instead since
>> each caller checks for negative error code.
>>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c           | 2 +-
>>  drivers/gpu/drm/i915/display/intel_dp_link_caps.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 66346b74b2c04..1c0b85ac27ad5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -666,7 +666,7 @@ int intel_dp_rate_index(const int *rates, int len, int rate)
>>  		if (rate == rates[i])
>>  			return i;
>>
>> -	return -1;
>> +	return -EINVAL;
>
> I'm not sure about these changes. Both of these functions can fail in
> one way and returning an invalid index in that case looks ok to me.

Agreed, please drop this patch then. Also, thank you for taking the
previous one.

BR,
Michał

>
>>  }
>>
>>  static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
>> index 1c34ba6c49c35..241809e6a9cb2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
>> @@ -347,7 +347,7 @@ int intel_dp_link_config_index(struct intel_dp_link_caps *link_caps,
>>  			return i;
>>  	}
>>
>> -	return -1;
>> +	return -EINVAL;
>>  }
>>
>>  /**
>> --
>> 2.45.2
>>
>
--8323329-1838146869-1782400231=:605841--
