Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A854CD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 08:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A0010E2B7;
	Mon, 15 Jun 2026 08:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvCNUdeD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D7E10E2B7;
 Mon, 15 Jun 2026 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781513276; x=1813049276;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=t0qiV0kGi2OQBQ2osZZAvySPqCdxjIpDAQfoNSRuB2A=;
 b=hvCNUdeDA6j3wBnjNsbex4d+acIfOF92pUi1fJjXf2gVm1B/UYGxTgkh
 de2vBEUeZ/AP7AMuTptR31UamDcCIRUb85r7jJIeAhaBmi06DUJXDzzL+
 cSNTUL5B70WKqjg9Wk8QC7XFw3qrZ8pmDvaNdc4OOamHh562FoSRv0irn
 lnHPenY4CFwRFnEmpXIa7kdGXYKRPM4cUvh7BL8AvBUdCBWEtqjseyA5V
 rJ02a7tyF0pPH8I5JgJ9im40ARymWCnnQPTHvPvMrgZfjNbT0uV4tS090
 EtDhZpj+JWKa0i4qZtM3bc3ibjh85640SKi0eVwaCsZ1iGCOWb3WlrWJu w==;
X-CSE-ConnectionGUID: E/VJElKuTlmivDtUFNNiBw==
X-CSE-MsgGUID: UWce/px0Qs60zlfrHNJTag==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93636831"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93636831"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 01:47:56 -0700
X-CSE-ConnectionGUID: 86ciwZ4eQEq7CN1v3SKhfw==
X-CSE-MsgGUID: uBRqg4GAQ4uCIbQivP5+Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247292790"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.39])
 ([10.245.244.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 01:47:54 -0700
Message-ID: <79a7df51-a2ac-4206-987a-83737e1d316f@linux.intel.com>
Date: Mon, 15 Jun 2026 11:47:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] xhci: dbc: serialize enabling and disabling dbc
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 ravitejax.veesam@intel.com
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
 <20260603091132.1110849-9-mathias.nyman@linux.intel.com>
 <9ce24ff5-efab-4089-92d7-709862d68e6d@intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <9ce24ff5-efab-4089-92d7-709862d68e6d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 6/15/26 09:11, Borah, Chaitanya Kumar wrote:
> 
> Hello Mathias,
> 
> On 6/3/2026 2:41 PM, Mathias Nyman wrote:
>> DbC can be enabled and disabled via sysfs, serialize those
>> with a mutex to make sure everything is done in the correct
>> order.
>>
>> remove xhci_do_dbc_stop() and integrate the register write and
>> dbc->state setting into xhci_do_stop()
>>
> 
> This patch seems to cause a regression in our CI. [1]
> 
> We could not revert the patch because of merge conflicts but resetting to the parent commit seems to heal the issue.
> 
> Could you please check why the patch causes this regression and provide
> a fix if necessary?

Ah, I see, deadlock when enabling DbC via sysfs on runtime suspended xhci

Appears this is an issue mid series in intel-next,
The last patch that enabled runtime pm for DbC should also fix this issue.

The DbC runtime pm support patch was dropped last minute from the upstream series.

I'll send it as a RFT, can you check it solve the issue in your CI

Details of deadlock issue while mid series:

dbc_store() {  // enable dbc via syfs
     mutex_lock(&dbc->enable_mutex);
     xhci_dbc_start(dbc);
         pm_runtime_get_sync(dbc->dev);
             xhci_dbc_resume()
                 mutex_lock(&dbc->enable_mutex);

Thanks
Mathias

