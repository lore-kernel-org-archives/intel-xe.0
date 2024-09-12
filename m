Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EE9EEB572
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 09:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD7B10EB29;
	Thu, 12 Sep 2024 09:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVyDUm90";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5E510EB29
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726132811; x=1757668811;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9qtBW6lX0kIKLQERpftoZ++1geLnLu667l0MFLI5bpA=;
 b=UVyDUm90d74m59cDqkrcORHErCEoA+HYHRnn9gjPX85SHM40JAJkdw2u
 01m61A/q6inLZlebMNbL0pPPlZiQYIIevXpgqbDLTKqgG+jhTnZzBm/97
 MZ7TIpNTubc6nQ2D5XYuIzWZyhiGvJ57839WgUJ/Dxs5RfEhHJvrlbjDx
 WxgNlac8YYmeT6Ayz58FuAfOtf25ey9URb9FbkV4HM9Fbi1fV+H2B8alY
 OPEIted1MPuoHsW3i3OUCijiYhFIsGTPwB4QYJQXpYfhUMQdlT0oZweDJ
 djMS0kxTIubTKfoil7I2+WTAFBAj6KvfGYHpDcXuhjmzDrYvRuOl4tDO7 Q==;
X-CSE-ConnectionGUID: Vkcy4OueTbmsv2zC7WgSuw==
X-CSE-MsgGUID: lBQPvhbUQUiHP+xARnPKCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42487637"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="42487637"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 02:20:08 -0700
X-CSE-ConnectionGUID: wHZTGSlESuaml+LDZuajhQ==
X-CSE-MsgGUID: V7NsWnxYTuKtuOoBJ0bOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67882846"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 02:20:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>, Dnyaneshwar
 Bhadane <dnyaneshwar.bhadane@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/pciid: Add new PCI id for ARL
In-Reply-To: <570df84e-44b3-42ec-8ad5-313865ed585a@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911092657.2348978-1-dnyaneshwar.bhadane@intel.com>
 <570df84e-44b3-42ec-8ad5-313865ed585a@intel.com>
Date: Thu, 12 Sep 2024 12:20:02 +0300
Message-ID: <874j6li5z1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 11 Sep 2024, "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com> wrote:
> On 11-09-2024 14:56, Dnyaneshwar Bhadane wrote:
>> Add new PCI id for ARL platform.
>>
>> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
>> ---
>>   include/drm/intel/xe_pciids.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
>> index 79001afa7d27d..5758924a5b4ca 100644
>> --- a/include/drm/intel/xe_pciids.h
>> +++ b/include/drm/intel/xe_pciids.h
>> @@ -181,7 +181,8 @@
>>   	MACRO__(0x7D41, ## __VA_ARGS__),	\
>>   	MACRO__(0x7D51, ## __VA_ARGS__),        \
>>   	MACRO__(0x7D67, ## __VA_ARGS__),	\
>> -	MACRO__(0x7DD1, ## __VA_ARGS__)
>> +	MACRO__(0x7DD1, ## __VA_ARGS__),	\
>> +	MACRO__(0xB650, ## __VA_ARGS__)
> This should be 0xB640

Lucas, Rodrigo, are we getting buy-in for having the PCI ID macros
shared between i915 and xe yet...? ;)

BR,
Jani.


>>   
>>   /* MTL */
>>   #define XE_MTL_IDS(MACRO__, ...)		\
>
> Thank You
> Sai Teja

-- 
Jani Nikula, Intel
