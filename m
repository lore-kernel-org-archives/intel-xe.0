Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049D6C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 11:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DBA10E1A3;
	Mon,  4 Dec 2023 11:19:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D707810E1A3
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701688772; x=1733224772;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d5R4tEpKxJZylToOHiWxsEsGZuTyzE75XS0K6IYu8zI=;
 b=C2hjXXebUrw2FLv5Si4zmXlo4mbrxb/Ji7TEdQTvZfTcR/uuEakOfUD+
 vpD17rCo9+dUm/g0JQkH3OslAuKwx90/CzG4o3XWg3CCeHf8tp8SWDSXw
 bJD6gwVDpPvS06UhqjM/ZdTIJkiOkXsb6tpwP5uVhSgh9ZtwuAV6HceKs
 eoAiirYl912hubIbJJ1CGYpLaqa5+13IpTW7dLKY38UC85Hw1fiw7KKKt
 8DuQkVSgtUZrBpV20o/3tcySNakD8BrFLwyJIjqx02CxW73T0eT/Q9DOD
 tgvNYEpQ/XjHh9tCgKgCbmBoECNnML8bB8JjSXyLgKu45QUOD/kMGRdi4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="460212464"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="460212464"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 03:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774222518"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="774222518"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.100])
 ([10.249.254.100])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 03:19:30 -0800
Message-ID: <18dfde78-1c2e-91f7-cec3-103c41fbf040@linux.intel.com>
Date: Mon, 4 Dec 2023 12:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>,
 Riana Tauro <riana.tauro@intel.com>
References: <20231204052609.3283031-1-riana.tauro@intel.com>
 <CAM0jSHOk7sGu6tHOmnsYryRf7dNSJM5rk_gqV-+6wF4ZvzNxBQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAM0jSHOk7sGu6tHOmnsYryRf7dNSJM5rk_gqV-+6wF4ZvzNxBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 0/2] Fix deadlock issue on d3cold
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/4/23 11:57, Matthew Auld wrote:
> Hi,
>
> On Mon, 4 Dec 2023 at 05:18, Riana Tauro <riana.tauro@intel.com> wrote:
>> kernel BOs need to be restored to the same place in VRAM, and with
>> d3cold that means that any VRAM allocation can
>> potentially steal the spot from kernel BOs which then blows up when
>> waking the device up.
>>
>> However if we end up moving xe_device_mem_access_get() much higher
>> up in the hierarchy (start of the gem_create_ioctl) then
>> this is no longer possible.
>>
>> This patch fixes the deadlock issue seen in
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
>> Also enables d3cold to get CI results
>>
>> Riana Tauro (2):
>>    RFC drm/xe: Move xe_device_mem_access_get to the top of
>>      gem_create_ioctl
>>    CI drm/xe: Enable d3cold
> Tried this locally on DG2 and it triggers lockdep splats for me when
> loading the module, so it looks like a lot more is needed before
> turning on d3cold.

IMHO I think for the backup of pinned kernel bos we should either do 
something that is similar to what i915 does, with a separate backup bo, 
or if it is impossible to grab the object lock, put together a function 
that backs up all non-freed memory of a TTM VRAM manager to a set of 
system pages...

/Thomas





>   However I also had to manually set the
> d3cold.capable=true. Wondering if we have machines in CI that are
> d3cold capable, since BAT results are reporting success?




>
>>   drivers/gpu/drm/xe/xe_bo.c | 26 ++++++++++++++++++++------
>>   drivers/gpu/drm/xe/xe_pm.h |  2 +-
>>   2 files changed, 21 insertions(+), 7 deletions(-)
>>
>> --
>> 2.40.0
>>
