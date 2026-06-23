Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30A3CDB470
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jun 2026 09:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B7A10EA30;
	Tue, 23 Jun 2026 09:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+Jxzhh+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811EF10EA2B;
 Tue, 23 Jun 2026 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782206090; x=1813742090;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=4LxckzBwbZgQQ9lZbjIYqslsHgBM2/ZMG4bqUgw7f0U=;
 b=j+Jxzhh+k87oTPrXHx90JH57luavwfmJXT7N6ZbIjbM4AQ6Ed4cLUWln
 53PjrPJrUt47otXDX8VV1seIB45vHL0zh0G3AuCK7DvTT/+goyf+7M3Ce
 dEG6XoB1rDsaovtjv8hXGQY2I98+XcTBg93djtKdBFxvmNE3Q4JpbzNLE
 x6ToWpM4Fe8Sp/5q6sY+YkF9qPMQTBPi+zuDAPUw0jqetYRdvD5tmukEe
 24KZBXHFYTlNCOBd1xq8wiDi8iSMdaFOGPG+pdQ2NAqvKMx0aAqMHFACW
 VxKqJ3ZugysLb4pkoOhOnFz4W3GAUiMY+bvAw0zbQvSu9sD0r4HwGU7DM A==;
X-CSE-ConnectionGUID: 74AV8YiiQcKY5vVR92k09w==
X-CSE-MsgGUID: doNMLPCsRJKsn8q/hnbmbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108486882"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="108486882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:14:50 -0700
X-CSE-ConnectionGUID: ZJIAY5yxSxmZTqvzaryRLg==
X-CSE-MsgGUID: 7EzhgGNSQL2HmnIHJhaFTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="249506464"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 02:14:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 0/4]  DSC max delta bpp support
In-Reply-To: <IA1PR11MB64672A1C0531552103C35F0AE3EE2@IA1PR11MB6467.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260619113905.1413453-1-nemesa.garg@intel.com>
 <IA1PR11MB64672A1C0531552103C35F0AE3EE2@IA1PR11MB6467.namprd11.prod.outlook.com>
Date: Tue, 23 Jun 2026 12:14:45 +0300
Message-ID: <b96480cf8db4912e1ad8b8d3192e8ca9204fefaa@intel.com>
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

On Tue, 23 Jun 2026, "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
>> -----Original Message-----
>> From: Garg, Nemesa <nemesa.garg@intel.com>
>> Sent: Friday, June 19, 2026 5:09 PM
>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Garg, Nemesa <nemesa.garg@intel.com>
>> Subject: [PATCH 0/4] DSC max delta bpp support
>> 
>>     Some sinks exposes DSC max bpp through delta based DPCD fields. To
>> support those sinks, add DP DPCD field field and logic to decode the delta
>> value in bppx16 format.
>> 
> Hi Jani Nikula,
>
> Can you please give ack for this series so as to merge via drm-misc.

Ack... but you didn't send the series to dri-devel.

>
> Thanks and Regards,
> Nemesa
>
>> Nemesa Garg (4):
>>   drm/dp: Add DP_DSC_MAX_BPP_DELTA register
>>   drm/dp: Rename YCbCr420 bpp delta mask to native
>>   drm/dp: Add max bpp delta computation constants
>>   drm/i915/dp: Decode dsc max delta bpp from sink dpcd
>> 
>>  drivers/gpu/drm/i915/display/intel_dp.c | 43 +++++++++++++++++++++++--
>>  include/drm/display/drm_dp.h            | 13 ++++++--
>>  2 files changed, 52 insertions(+), 4 deletions(-)
>> 
>> --
>> 2.25.1
>

-- 
Jani Nikula, Intel
