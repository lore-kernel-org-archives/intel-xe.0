Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30765606A323
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kz4ReoG2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D903410FBDB;
	Wed, 25 Nov 2026 11:48:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC2E10FBDB;
 Wed, 25 Nov 2026 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795607314; x=1827143314;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=SlAJNOZ8GH42CB5OxxCuaE69BzuEFOQuIRpLzKBMgPU=;
 b=kz4ReoG2gw+/7v5dq/8sLeaqPiT/2pf+MbhGTOnTaqmoYua+FwByRs1X
 3N8p0u4hXUJSydwRGyuXxzthfnLEUhCKiKGTJjn9yiQTFPi9Pk7x3dnUN
 ZUukRo2+D1A3r+0vCUviOG8/WBAi3jiFS7rEodInNN17ueNEAV1ARvhLJ
 Y34nmlaufamTnUE8G+Wq+7NH19/lMalrzIq65vpsyjwxOE1n7myvltk4J
 dwfW0aVIwzYRwFdg+Gvaj4KTe5PdMh44uACjKkI1UMFeY9GC9Wn/W2Qtk
 2EKIQG1a68tvqYYtVMLdx7ZVVRPGyQitrBpEwytmgIQndi9nxK1JrTFif w==;
X-CSE-ConnectionGUID: sNFO767gRbquoNblyFSiZQ==
X-CSE-MsgGUID: 6B+UPrM6T32FZHBwCF8qGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4369349"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4369349"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:48:33 -0800
X-CSE-ConnectionGUID: 21w86H2gSvm1ifVn+5oXXA==
X-CSE-MsgGUID: AUxD5cJ/QlSA9qpmwx68Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11864946"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 03:48:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: sashiko-reviews@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/display: don't be cute about printing
 enabling/disabling
In-Reply-To: <sashiko-outbox-231335@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124141146.1560208-1-jani.nikula@intel.com>
 <sashiko-outbox-231335@kernel.org>
Date: Wed, 25 Nov 2026 13:48:29 +0200
Message-ID: <5c89a1a8b185633112990fa4201c92e8de0740c6@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/i915/display: intel_force_bit_banging_write() missed in
>   %sabling cleanup
> --
>
> commit a6f91eb39a4003adc548629cfa79fbc4fb32b5bb
> Author: Jani Nikula <jani.nikula@intel.com>
>
> drm/i915/display: don't be cute about printing enabling/disabling
>
> This commit replaces "%sabling", enable ? "en" : "dis" debug logging
> patterns in i915 display code with str_enable_disable().
>
> [ ... ]
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> index d43c81d362e6c..d68521588d54b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>> @@ -1107,9 +1107,8 @@ void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
>>  	mutex_lock(&display->gmbus.mutex);
>>  
>>  	bus->force_bit += force_bit ? 1 : -1;
>> -	drm_dbg_kms(display->drm,
>> -		    "%sabling bit-banging on %s. force bit now %d\n",
>> -		    force_bit ? "en" : "dis", adapter->name,
>> +	drm_dbg_kms(display->drm, "%s bit-banging on %s. force bit now %d\n",
>> +		    str_enable_disable(force_bit), adapter->name,
>>  		    bus->force_bit);
>>  
>>  	mutex_unlock(&display->gmbus.mutex);
>
> [Severity: Low]
> Should intel_force_bit_banging_write() in this same file also be converted
> to str_enable_disable()?  It logs the identical bit-banging message using
> the old "%sabling" pattern:

Gah, a dupe of that shouldn't have been added in the first place. :/

Deduplication at [1].


BR,
Jani.


[1] https://lore.kernel.org/r/cover.1795607055.git.jani.nikula@intel.com

>
> drivers/gpu/drm/i915/display/intel_gmbus.c:intel_force_bit_banging_write() {
>     ...
> 		drm_dbg_kms(display->drm,
> 			    "%sabling bit-banging on %s. force bit now %d\n",
> 			    force_bit_banging ? "en" : "dis",
> 			    connector->base.ddc->name, force_bit);
>     ...
> }

-- 
Jani Nikula, Intel
