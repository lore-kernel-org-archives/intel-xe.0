Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F37C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 16:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BE110E52A;
	Tue, 14 May 2024 16:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkDSob+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9CA10E52A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715702756; x=1747238756;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f4eWyHW/legDC8CKpyScXvI4SQY4c7PmbRVu1vQ8ZCk=;
 b=WkDSob+bJOlHGxVo+e2feqIBReP1wPraocWHh4fP4irm3BarIxmJePXP
 bVswEZBnisZbXY7zOaQjt8EvHJg2Wuc0txPVso5B2Mbiri5vEYrb4ETQ3
 8yiljxbBAq4ZBxdMjukY0SNoaTgGA6nCY5jIhd3hMAx0ympKllFriqVXR
 umaeV2waGtkFfrhViuK9V3HdTuK/NEBPhr7iZ/Cz/nNe5bHz35ofW6n6z
 WI4JePCk8IPvBwH8+8+eQbxI+vL8e4Gy346LfeKJHH6yS9rvqINVygT3j
 XZ9ezUtB+DmomuomzcG9IQBsf53w5ap/o/ZyxVbEYWladOf+3EJKXz6gE A==;
X-CSE-ConnectionGUID: eNB41otIQIqxdrlesEH68A==
X-CSE-MsgGUID: qk7XbhxtQE6NtY2mfBMK9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23100070"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="23100070"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 09:05:46 -0700
X-CSE-ConnectionGUID: VBQnDHUhQK6Kp3BuRj3S7w==
X-CSE-MsgGUID: fBdsHgeqR36VMJDDzwkJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="61553920"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 14 May 2024 09:05:44 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C09E4122DE;
 Tue, 14 May 2024 17:05:40 +0100 (IST)
Message-ID: <ff6b98d1-cef1-4833-acd3-4d6c1d8e0eeb@intel.com>
Date: Tue, 14 May 2024 18:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
 <20240512154915.2040-2-michal.wajdeczko@intel.com>
 <20240514124703.4o5royonzqivxokw@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240514124703.4o5royonzqivxokw@intel.com>
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



On 14.05.2024 14:47, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-maj-12 17:49:10 +0200]:
>> In upcoming patches we will add a version negotiation between
>> the VF driver and the GuC firmware. Add necessary definitions
>> to our GuC firmware ABI header.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> index c1ad09b36453..49ed5fbd4ced 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>> @@ -213,6 +213,73 @@
>>  #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
>>  #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
>>  
>> +/**
>> + * DOC: VF2GUC_MATCH_VERSION
>> + *
>> + * This action is used to match VF interface version used by VF and GuC.
>> + *
>> + * This action must be sent over MMIO.
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 27:16 | DATA0 = MBZ                                                  |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_MATCH_VERSION` = 0x5500         |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  | 1 | 31:24 | **BRANCH** - branch ID of the VF interface                   |
>> + *  |   |       | (use BRANCH_ANY to request latest version supported by GuC)  |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
>> + *  |   |       | (use MAJOR_ANY to request latest version supported by GuC)   |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
>> + *  |   |       | (use MINOR_ANY to request latest version supported by GuC)   |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |   7:0 | **MBZ**                                                      |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  |   | Bits  | Description                                                  |
>> + *  +===+=======+==============================================================+
>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  27:0 | DATA0 = MBZ                                                  |
>> + *  +---+-------+--------------------------------------------------------------+
>> + *  | 1 | 31:24 | **BRANCH** - branch ID of the VF interface                   |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
>> + *  |   +-------+--------------------------------------------------------------+
>> + *  |   |   7:0 | **PATCH** - patch version of the VF interface                |
>> + *  +---+-------+--------------------------------------------------------------+
>> + */
>> +#define GUC_ACTION_VF2GUC_MATCH_VERSION			0x5500u
>> +
>> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
>> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
>> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH	(0xffu << 24)
>> +#define   GUC_VERSION_BRANCH_ANY			0
>> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR	(0xffu << 16)
>> +#define   GUC_VERSION_MAJOR_ANY				0
>> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR	(0xffu << 8)
>> +#define   GUC_VERSION_MINOR_ANY				0
>> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MBZ		(0xffu << 0)
> 
> NIT: It seems to me that GENMASK would be more appropriate here

as replied sometime ago for similar suggestion, here at GuC ABI level
headers I want to keep only plain C definitions, without introducing any
OS specific stuff yet - we can reconsider if all these ABI headers will
be auto-generated

> 
>> +
>> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_LEN		(GUC_HXG_RESPONSE_MSG_MIN_LEN + 1u)
>> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH	(0xffu << 24)
>> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR	(0xffu << 16)
>> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR	(0xffu << 8)
>> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH	(0xffu << 0)
>> +
>>  /**
>>   * DOC: PF2GUC_UPDATE_VGT_POLICY
>>   *
> 
> LGTM:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
>> -- 
>> 2.43.0
>>
> 
