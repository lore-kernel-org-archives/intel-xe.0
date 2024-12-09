Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F76E77180
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 20:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C2210E0D2;
	Mon,  9 Dec 2024 20:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhVsiqkT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C626A10E0D2
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 20:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733774765; x=1765310765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aGZjreKUhmpmmzSvoJ6WH2D+keewriyyk/H9O2PQApE=;
 b=nhVsiqkTexWXm4lD0AFjcPy190mBNMx/2/MpFaeuyaCBIoe86CKSqlAk
 m/GXAFSgQVIrmB248lWqApSEEQ4J2sGxyX9q4o824DWZRKtd4P3ftfhY6
 O39DADaSsgU8mpzfG+/Mq28st6QolGnf2vl4D8a14P/T30Y1ynUCcmk2m
 fnwt/m8b6h/VbJQVTII3nhDQJjzuJS0xmQGltBVxfMbzbUc/UP5yjJeY3
 dn0MeEkK8+VXIcuL49YtO57o034VKi1TYWTihN5ms2OF5jurPMx7nOz9R
 6EGvu/ZHZIItdBqCCbUL1ZXEYQwpe9S3ndPxi+1cgOCuKJr50/Wo9/p4Q A==;
X-CSE-ConnectionGUID: sNLstzviQO+w5CmxDcSFew==
X-CSE-MsgGUID: FaEhOt2yQP+3rEKOUVnTAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51626114"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="51626114"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 12:06:04 -0800
X-CSE-ConnectionGUID: 5pwaiOKmRDepvg7tJqs8xg==
X-CSE-MsgGUID: mMYAmfRaTO+q06AH9O7Wog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95015656"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.77])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 12:06:03 -0800
Date: Mon, 9 Dec 2024 12:05:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org, 
 niranjana.vishwanathapura@intel.com,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: introduce xe_gt_reset_wait to wait for async
 gt reset
Message-ID: <ryej5ung5dfapzz2uaodoc7k5mkrblw5rdtudln5hqait6osys@4rew5kdgbl7t>
References: <20241209141210.1311374-1-maciej.patelczyk@intel.com>
 <20241209141210.1311374-2-maciej.patelczyk@intel.com>
 <Z1cB5Wx7AWUUD7L2@black.fi.intel.com>
 <Z1cEtYgIRzoaVRY4@black.fi.intel.com>
 <hb75rvvovu6r7owm7ly3yjwh7x6nqxb225ode7pe6qfu34pmgc@zxhtb5q3xbyj>
 <587f6772-4450-4357-b7f9-3c0e8defb511@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <587f6772-4450-4357-b7f9-3c0e8defb511@intel.com>
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

On Mon, Dec 09, 2024 at 08:39:32PM +0100, Maciej Patelczyk wrote:
>On 9.12.2024 17:22, Lucas De Marchi wrote:
>
>>On Mon, Dec 09, 2024 at 04:54:45PM +0200, Raag Jadav wrote:
>>>On Mon, Dec 09, 2024 at 04:42:49PM +0200, Raag Jadav wrote:
>>>>On Mon, Dec 09, 2024 at 03:12:09PM +0100, Maciej Patelczyk wrote:
>>>>> The reset of the GT is asynchronous.
>>>>> Adding a wait helper to wait until gt reset is done.
>>>>>
>>>>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>>>> ---
>>>>>  drivers/gpu/drm/xe/tests/xe_bo.c   |  2 +-
>>>>>  drivers/gpu/drm/xe/tests/xe_mocs.c |  2 +-
>>>>>  drivers/gpu/drm/xe/xe_gt.h         | 12 ++++++++++++
>>>>>  drivers/gpu/drm/xe/xe_gt_debugfs.c |  2 +-
>>>>>  4 files changed, 15 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c 
>>>>b/drivers/gpu/drm/xe/tests/xe_bo.c
>>>>> index c9ec7a313c6b..b51434fc5bd1 100644
>>>>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>>>>> @@ -266,7 +266,7 @@ static int evict_test_run_tile(struct 
>>>>xe_device *xe, struct xe_tile *tile, struc
>>>>>           */
>>>>>          for_each_gt(__gt, xe, id) {
>>>>>              xe_gt_reset_async(__gt);
>>>>> -            flush_work(&__gt->reset.worker);
>>>>> +            xe_gt_reset_wait(__gt);
>>>>
>>>>Why not just create a
>>>>
>>>>void xe_gt_reset_sync(gt)
>>>>{
>>>>    xe_gt_reset_async()
>>>>    flush_work()
>>>>}
>>
>>
>>maybe, the problem I think is the 1 letter difference between
>>
>>xe_gt_reset_async
>>xe_gt_reset_sync
>>
>>that may be confusing/error-prone.
>>
>>I like the helper, just think we need the naming to be polished.
>>
>>+Thomas
>>
>>maybe having this as xe_gt_reset() / xe_gt_reset_async()?
>>
>>
>>Lucas De Marchi
>>
>xe_gt_reset(), xe_gt_reset_async() would be my vote.
>
>
>I proposed only the wait helper as I did not want to block under mutex 
>for the whole period of time when the reset worker will be scheduler 
>and executed.
>
>That could be seconds.

but as I mentioned in the other patch we actually want to hold the
mutex since we don't want a new client until this is completed.

Why would a gt reset take seconds?

Lucas De Marchi
