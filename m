Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194A8C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 12:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA52210E2BF;
	Mon, 31 Aug 2026 12:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b05E67Pn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E4B10E2BF
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 12:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788179585; x=1819715585;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qw4HtKXqpzn+8lmXuX3BmeS8GX6mVGQcRk9P3Vic9Bw=;
 b=b05E67Pnyq9T02rMqHRN/4oo0TI9BE6mlWp94Hf9OQkCYlrsAmOOpLKH
 53U+wcaCpidq/VvsBQIfm1snyysacGF9/qNztsHJjqnU3GtKuOXqydzLh
 65iAC4J2fdm8Lj1486E4rbVFgrJO4XPwSf2QFkDIjX/5pvwRYXH3OMmAS
 pvzE1jrY2twV5LexUCbNrl3l/yKaQE9IF/j+M+mhWBvk3bzpi71qWoR+D
 PZp+INt9vsCVUqsCVslMczIj8iW+9QYoQOvg84GyylIlY+Daenb1/v/bB
 ugoEeTjcOkpp6j8U4sySM0BSyBzGeggjosLAzoiD/Z1+HZZ0C0aoqdejr g==;
X-CSE-ConnectionGUID: Ci1s8WCAS8SxJcjLRMPxVw==
X-CSE-MsgGUID: dHjFAZmkRfmdeM0C3VN+vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88462003"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88462003"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:33:04 -0700
X-CSE-ConnectionGUID: Kye5zRVWRliDVGY++BHlBw==
X-CSE-MsgGUID: Hqumj074Q3qsokMyG+YYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="267455104"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.246.51])
 ([10.247.246.51])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:33:02 -0700
Message-ID: <0bad9269-ddae-4ab9-9823-9fef7363323a@linux.intel.com>
Date: Mon, 31 Aug 2026 18:02:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
 <20260828113104.319843-5-riana.tauro@intel.com>
 <BN9PR11MB524232BB439BB10F87C48D2395AC2@BN9PR11MB5242.namprd11.prod.outlook.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <BN9PR11MB524232BB439BB10F87C48D2395AC2@BN9PR11MB5242.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 28-08-2026 19:36, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Friday, August 28, 2026 5:01 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Roper,
>> Matthew D <matthew.d.roper@intel.com>
>> Subject: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
>>
>> Pcode init complete indicates the device is ready, with device memory
>> initialization complete. Wait for Pcode init before accessing the device post
>> Secondary Bus Reset (SBR).
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_pci_error.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c
>> b/drivers/gpu/drm/xe/xe_pci_error.c
>> index 79ce0c671549..3e9c77f8483d 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -9,6 +9,7 @@
>>  #include "xe_gt.h"
>>  #include "xe_log.h"
>>  #include "xe_pci.h"
>> +#include "xe_pcode.h"
>>  #include "xe_pm.h"
>>  #include "xe_printk.h"
>>  #include "xe_ras.h"
>> @@ -109,6 +110,10 @@ static pci_ers_result_t
>> xe_pci_error_slot_reset(struct pci_dev *pdev)
>>  		return PCI_ERS_RESULT_DISCONNECT;
>>  	}
>>
>> +	err = xe_pcode_probe_early(xe);
> This can be a 3-minute wait in worst case, after PCIe core pci_bridge_wait_for_secondary_bus() is already waited for 1 second*[1].
> What will be the impact on already running workload and any worker thread tries to access the mmio or PCIe bar here? 

The existing workloads are expected to crash or terminate for an error
that needs SBR to recover, before we reach to this state driver declares
the device as wedged anyways.

Thanks,
Aravind.
>
> [1]
> /*
>  * Devices may extend the 1 sec period through Request Retry Status
>  * completions (PCIe r6.0 sec 2.3.1).  The spec does not provide an upper
>  * limit, but 60 sec ought to be enough for any device to become
>  * responsive.
>  */
> #define PCIE_RESET_READY_POLL_MS 60000 /* msec */
>
> Thanks,
> Anshuman
>> +	if (err)
>> +		return PCI_ERS_RESULT_DISCONNECT;
>> +
>>  	/*
>>  	 * Secondary Bus Reset causes all VRAM state to be lost along with
>>  	 * hardware state. As an initial step, re-probe the device to
>> --
>> 2.47.1
