Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53034606A8A8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F8kHAEQ/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BFF10F954;
	Thu, 12 Nov 2026 08:21:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA7B10F954
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794471665; x=1826007665;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+fzIY9VHO8HIK6IBpVJ8SrhPU5TbO8gdIyrgfH2KlGI=;
 b=F8kHAEQ/1QcNGVJ2VuszCORcqgMwuHY1HMhSZxeMtXgRamX0J9d8QP6D
 MIE/knUou4xBW2bX0fqFTqfANBClznKjHnFM9J1QAUnkWdawH0NNoPqP4
 bp8bad4dK0J24Q7YdMeFp/G8flGtNE8KxdjCLl1NBljByx9uyCGiLcaLR
 iO7n9Bs2z1UBerb2+es/ynu4WN78FlDHeVHOZu/CKbQbCBzYgatdnzPkL
 DgdY3Z1ahipEkAFGR3OFAg4jt/0UuD4PWsqWNvt02ujJPXNPdCWfo+Cqc
 eG7tJaWYlIHB6P9465ezdmBx6wVHfBD9G1M1ReMCFeZEWaaMqENHFx0mN Q==;
X-CSE-ConnectionGUID: LklWWv61SBKn/Eu1c2LgtA==
X-CSE-MsgGUID: lQcd0y5VQvqIcwZQqRvzDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3133083"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3133083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:21:05 -0800
X-CSE-ConnectionGUID: iGZ4/1RATNqzsSKTipVUWQ==
X-CSE-MsgGUID: gdZ/lV5fSSaSaMP4GL369Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8691572"
Received: from kngiex-mobl.gar.corp.intel.com (HELO [10.247.254.121])
 ([10.247.254.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:21:03 -0800
Message-ID: <aa5d6f6a-c6ff-4ea7-8b66-8927621c011b@intel.com>
Date: Thu, 12 Nov 2026 13:50:52 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/cri: Add new PCI IDs
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
References: <20261111055020.866766-1-ranu.maurya@intel.com>
 <sashiko-outbox-208375@kernel.org>
Content-Language: en-US
From: "Maurya, Ranu" <ranu.maurya@intel.com>
In-Reply-To: <sashiko-outbox-208375@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/11/2026 11:30 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/cper: missing xe_device_guids entries for new CRI PCI
>    IDs
> --
>
> commit 61a3e0e92a66a1e015400ed3ae42a758a161459f
> Author: Ranu Maurya <ranu.maurya@intel.com>
>
> drm/xe/cri: Add new PCI IDs
>
> This commit adds four new Crescent Island (CRI) PCI device IDs (0x6753,
> 0x6754, 0x6755, and 0x6756) to INTEL_CRI_IDS.
>
>> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>> index ac858ed26df2e..ab02bef262f14 100644
>> --- a/include/drm/intel/pciids.h
>> +++ b/include/drm/intel/pciids.h
>> @@ -906,7 +906,11 @@
>>   	MACRO__(0x674F, ## __VA_ARGS__), \
>>   	MACRO__(0x6750, ## __VA_ARGS__), \
>>   	MACRO__(0x6751, ## __VA_ARGS__), \
>> -	MACRO__(0x6752, ## __VA_ARGS__)
>> +	MACRO__(0x6752, ## __VA_ARGS__), \
>> +	MACRO__(0x6753, ## __VA_ARGS__), \
>> +	MACRO__(0x6754, ## __VA_ARGS__), \
>> +	MACRO__(0x6755, ## __VA_ARGS__), \
>> +	MACRO__(0x6756, ## __VA_ARGS__)
> [Severity: Medium]
> Should xe_device_guids[] in drivers/gpu/drm/xe/xe_cper.c also be updated
> with platform_id GUID entries for 0x6753, 0x6754, 0x6755, and 0x6756?
>
> xe_device_guids[] only lists CRI device IDs 0x674C through 0x6752.  When
> cper_init_record_hdr() calls lookup_device_guid() on a CRI device with one
> of the new PCI IDs, the lookup fails, logs a warning ("CPER: no platform
> GUID for device"), and leaves rhdr->platform_id unset in emitted CPER
> records.

We need updates to GUID, which will be addressed in a new patch.

- Ranu

