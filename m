Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B04C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 17:51:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DC610E342;
	Mon, 19 Aug 2024 17:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4Ko6Q02";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8362410E342
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724089893; x=1755625893;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EOh7H6bYfDilk0DlmJ4kF02CN7JKDkpynGRGb6DOwzA=;
 b=f4Ko6Q02BroXf2GbFuE3qvGXdfFaunv/rWcMbzjbvDWt5yRhEkslDAlO
 BQolTfrDu50poKhsd+WQNCccYTQTQeQH3Qr3K6hwPpN0gmWlLPilLZcUi
 mTy9eMeNxl7V0qM7JSu/vYNBc/dJZmwrJbAWlstlQvdjuJoL2N/x9eYoN
 LMmoOur9Yl5F44BpJQibtcw7p5iZRB+M2yD8oabfdipwJnvPlQLposG/u
 fDVCiRmZHN1E2DAYi/MdLETFh/xA6Py7i3Ip8SCNvxqhBnLfor80neoNT
 LV97V+qHl76ga0ATmeUKA4/oHMyqXEUedFAleEw703svgO/dbu6EoIp4K Q==;
X-CSE-ConnectionGUID: UwwizQ47QTeLGHsBSI3N9g==
X-CSE-MsgGUID: JLWwf7W7TOmZDo4HjKBWqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26151474"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="26151474"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 10:51:32 -0700
X-CSE-ConnectionGUID: P7oRCuRtRoCwicEsDDw6zw==
X-CSE-MsgGUID: pSG2y6l5R9mrfpzMRhleGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64841559"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 19 Aug 2024 10:51:30 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8305D2FC5B;
 Mon, 19 Aug 2024 18:51:29 +0100 (IST)
Message-ID: <de0bdc3e-d01b-4988-b369-99b7883b6416@intel.com>
Date: Mon, 19 Aug 2024 19:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/xe/pf: Drop GuC notifications for non-existing
 VF
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-4-michal.wajdeczko@intel.com>
 <20240816130130.xt7qx5x4xi6ltjgn@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240816130130.xt7qx5x4xi6ltjgn@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 16.08.2024 15:01, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:50 +0200]:
>> It is unlikely that GuC will ever send a G2H notification with an
>> invalid VFID and it is currently harmless if that actually happen.
>> But in upcoming patches we will start using that VFID as an index
>> and we must be sure it is a valid to avoid a crash due to a buggy
>> firmware or a currupted G2H message.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> index d11839d9e7d4..ad447d867e51 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
>> @@ -8,6 +8,7 @@
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_sriov_pf_control.h"
>> +#include "xe_gt_sriov_pf_helpers.h"
>>  #include "xe_gt_sriov_printk.h"
>>  #include "xe_guc_ct.h"
>>  #include "xe_sriov.h"
>> @@ -212,6 +213,11 @@ static void pf_handle_vf_flr_done(struct xe_gt *gt, u32 vfid)
>>  
>>  static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>>  {
>> +	xe_gt_sriov_dbg_verbose(gt, "received VF%u event %#x\n", vfid, eventid);
>> +
>> +	if (vfid > xe_gt_sriov_pf_get_totalvfs(gt))
>> +		return -EPROTO;
> 
> I would probably add some log here.
> I'm afraid that during debug the information about the last event is not enough

it should be the CTB layer responsibility to print an error message and
dump this invalid or corrupted or unexpected G2H message, no point in
doing this in every possible G2H message handler; note that 'silent'
return is aligned with the existing code in this file.

for now CTB will just report:

	xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
		  action, ERR_PTR(ret));

but it should be easy to add (what we had in i915) full dump of the
problematic G2H message in case of at least the EPROTO error

> 
> Thanks,
> Piotr
>> +
>>  	switch (eventid) {
>>  	case GUC_PF_NOTIFY_VF_FLR:
>>  		pf_handle_vf_flr(gt, vfid);
>> -- 
>> 2.43.0
>>
> 
