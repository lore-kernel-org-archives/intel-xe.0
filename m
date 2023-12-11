Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5864DC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 06:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A8010E06F;
	Mon, 11 Dec 2023 06:01:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37CC10E06F
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 06:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702274500; x=1733810500;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zj+cjTrI3Jg1F9IJSuzCSoa1xIKVLTy97qj+O+IhsOY=;
 b=h8x5gwxY7STcRRxdMFQHbNqJJTjm+sUZ3V9m5u6CnQKdEU3uBqGOm3XA
 QcfDO647NP+ogat+8jUxsP+Q3PyVHn/bMK/hjx/daYreFaJZLy42hMCOO
 3v1U9wv4VPtQlRwjMgy4A+F0unE+PrCGG0jAdHbhUqmgSp7+nGVLhU9du
 iRvT/RY92/N80+kiFB4sekzVkdqV8nXsyuHf8eiovySFj24rS1R1hwFZI
 quqAbKvFTmH5N2Y7yWjaT4XEfedhPJTJGpESKQrewq02oy6vNiHrWAG7Z
 4GjneUz5jNJ9LQLDOCt5McQkIIInT+7Fb0+jn22ZMRUsaU1f8XIkNAIVr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="461074599"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="461074599"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 22:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="807172827"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="807172827"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2023 22:01:37 -0800
Message-ID: <aecbe74c-af61-4ea8-984b-c7d5ff3133c1@linux.intel.com>
Date: Mon, 11 Dec 2023 11:34:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pmu: Remove PMU from Xe till uapi is finalized
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231209224352.2720403-1-ashutosh.dixit@intel.com>
 <87msujhtu3.wl-ashutosh.dixit@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <87msujhtu3.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: francois.dugast@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/10/23 04:22, Dixit, Ashutosh wrote:
> On Sat, 09 Dec 2023 14:43:52 -0800, Ashutosh Dixit wrote:
>> PMU uapi is likely to change in the future. Till the uapi is finalized,
>> remove PMU from Xe. PMU can be re-added after uapi is finalized.

Hi Ashutosh,

Is it possible to have the infra as it is and just remove the events part. 
As there is follow on series from Riana which uses the infra https://patchwork.freedesktop.org/series/126919/.
or the other alternative would be for Riana to bring in the infra as part of her series.


Thanks,
Aravind.


> Complete removal of PMU for now is probably preferable than what was done
> in:
>
> https://patchwork.freedesktop.org/series/127590/
>
> Also, it is probably preferable to remove PMU code via a rebase, but if
> that is time consuming, adding this patch will remove PMU code.
>
> I was trying to send a series of 'fixup' patches, but that seemed difficult
> because a large number of patches have touched non-PMU files, so all those
> patches will need to be fixed up.
>
> Thanks.
> --
> Ashutosh
