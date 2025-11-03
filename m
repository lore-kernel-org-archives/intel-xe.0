Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E395DCCF9FE
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 04:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B8010E04A;
	Mon,  3 Nov 2025 04:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dPeUozdo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDC510E04A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 04:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762145132; x=1793681132;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yxPuyGhJc7muJZI2fj4HRBHfyTBThwEFTm6kHpTgpH4=;
 b=dPeUozdo1IgOnLBn9+oWNe9bRciGAlrO2vAW4gQP6wE4HTZFnRb8yfPV
 XRpX3aTP6SpcGmge1EXagm9YVeBQW95gxofO6PO6LgrIk2t6C1zOGQyMx
 I7w95wqsxJefa7lwXBp9opSKxJaoNlD5juu+JeREQJxt2MVx7RDsFuUgL
 y21BxkaYmObIORCnrP/pnD9WkmYHVcSsfHlrnGyCEgl2YkMxoNP1MuTT8
 gpb8K6MCrtpL/KHqtyrKAUsF8Sj4HNXlX92p/9UDBG7qLvibI3mvptsRi
 kGP3ZFDJnpQxVPSWQJAafBxyraQ5zS0blWk2G3WzbuXc6M33s6lDicGIo Q==;
X-CSE-ConnectionGUID: KlGnUukaQXad/3C2d0mhcg==
X-CSE-MsgGUID: daTDMvnSRx2neoV+k658Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64133135"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64133135"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 20:45:32 -0800
X-CSE-ConnectionGUID: 310nkUTDQDG4cSYjs7HQVw==
X-CSE-MsgGUID: 0593s0XkQlimOCjwiLQsvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="224013363"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 20:45:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 20:45:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 20:45:31 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 20:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2NcXT6eYybmBC/WIowsDGqdNT0wrsB66iI/m7vh2UZBN+6MdkHlzr9sc306YiXf9k1oLdvHF7gdE0Vv9JHJUpwC2bSrx39ydp9RnQ4wVlV0PvtorN8Nftq8qr5mCNVanOA+6GiiA2OZT2CENUL6Nv9PRJ0DeS5Xlj+m1pj/op+4j4Q451T5vua8plUTIXHMlkWCg0fqBMxyMpVccp8ouP9qH2oi33pe1Jh5NJi53if/Jpa+EMYAWP8LW6fyCFX5Dvj+C1IzBMtfUoES5+n5907B8yatiirO5dVZwrS+gQNZwZjf/d3HTatgbZ4ZePiA2cXymjfC9mKyWWMFgsgc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IHqjPI5kmgzFk6zAUw0Kl7mofK/9h5A4ecOuQV/u8A=;
 b=MzxpKrHp6waJkodAiJ/ZTeYEatSkcPgk252zJmhDj/SqtkDUvalFFFIvwIP0LZ6CjfolLaHXLnNykcPN53GN0QnBdC1zdlIVeoruPNy3n9dtY47N1FO4yBeGv5e8haKvtnz8feJhqcs/J+Qpr8IRAIrizLkbX8PFuBan1wGIuMTY0n9V8GFxcFcw/ZH0PADCek8oPHLPZxJPRVXFHHMKx1rt+1A6dh450xi6tUlg0STFDu3ed0Vn+dV1kVOSWx/tkhZX7gEdRd4IK36Xls6TM59qdP4IXhFQUXl4ixJNPceaR4urmCiFmD4iSmAYg8DLEkyJ4UVTFErOw7fneHPOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 04:45:24 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 04:45:24 +0000
Date: Sun, 2 Nov 2025 20:45:21 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/16] drm/xe/multi_queue: Add multi queue priority
 property
Message-ID: <aQgzYevuX641kaQZ@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-5-niranjana.vishwanathapura@intel.com>
 <aQaex+xD5qdOwXdD@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQaex+xD5qdOwXdD@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0198.namprd05.prod.outlook.com
 (2603:10b6:a03:330::23) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SN7PR11MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: a6dc8ac8-2233-488e-0dc4-08de1a93cd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L62FuNk1F4HAcujO33UFRjYNZfuu24/BSAYQyQo2p+Wc74uMOZWtguTQKf9O?=
 =?us-ascii?Q?SjN54cnrMvKN0aYlqfUa9Wss1fTy4w1ikd7ZuFHDn3jQCvNltLwYO/9S7SNW?=
 =?us-ascii?Q?AryUQVgUGlmANWvz3vW7f5tmlPVjt/EGeDfttNRMsTuy0gxVroaiAymkABwQ?=
 =?us-ascii?Q?h70A7DRBGMp7PwKitmc6lpucSu6VZNkm0wTXllhgdamTJXwgj4/nR1AOIvqb?=
 =?us-ascii?Q?byydyj56JdEs9n2j8UxYF3f4AnZC4DMoqaqm3EO2YTyd49OdZVfFjOzALuC1?=
 =?us-ascii?Q?NumyfE5z/gtoIhpU6M5nu2do7Nj5gbJHXu6cmMhvc0gbpJuw+56x5s9O1lLb?=
 =?us-ascii?Q?QKQdVyWTcDJPqN7ITMxdPz1jLLFSHFVk7cqTKLf+vSLly+5os4JQnmS/zu0i?=
 =?us-ascii?Q?K7BRRAO0OcwqyTw5adc+lZGGo/WaC/56p4OwGjzLuKXbfb6v6NzBqSEayaY5?=
 =?us-ascii?Q?lH76ruRZfxr459jFdB+lXzWE9sbI/aea6t7Y0caJaR/NYNbXguq00OMmSqDZ?=
 =?us-ascii?Q?pB73GWoGDzQ+DxY3N3wpXEuaZGFJK9uPDWhmEjosnjv0oBGXxHwIIz6qLFSG?=
 =?us-ascii?Q?2kv6cSHoMGlmKJeth84VhnLhuWMrEHE44puqGnFNj+E2jNzZMWhZA7Xmvflu?=
 =?us-ascii?Q?BZw5EtfO7t5koEtAyZDKc/ojf29ntTI1M2gKBQA1HU3jjoNarsVhPOq7jolZ?=
 =?us-ascii?Q?YkTC/K44oHOL6uzIIWD8PDvQnqPhfDLv1nW7cEmx1wJl1v6W6YMeGZUpBNZS?=
 =?us-ascii?Q?H9IOSR+VNehWaoKw6saEqwPT4HF9j1U1CVkRdE54KnrCTDrD7F3ZKUojtyE3?=
 =?us-ascii?Q?WCZi2RYKVRf+K7IK1RIYrFQ8wlBLDxDdO5q9Mn046uZkbkbWx/KNR3V60hZ/?=
 =?us-ascii?Q?0umWACOUvlw0PkTn96J3eV9Q5WgA3o2Gj0zS6t1RtMDRC9xMPDHXhZbWMOUS?=
 =?us-ascii?Q?Z/xlkMLKwQbVW1JEYWjusE9VUMwpcCO8Rr3vWxF1JCdqUQDdGCYGa5/0Uq9e?=
 =?us-ascii?Q?nDbQDNY7cyM5bnJUfyNAPzKHFrhajpAS3GqUHzwZ71j5Ye5tXsJmugXclcy7?=
 =?us-ascii?Q?akjxfblKQxStZ1iIOsa1sCk8eQskvOgkOgA8m/mI/UoJVjpnMyi3dp2n7Zg0?=
 =?us-ascii?Q?HQW/rlxjNRON549OSiZ+SnOVgMpNla8+aTHFEzvSuBIYeqrFjFFGC3h7dCJR?=
 =?us-ascii?Q?9dVhcRW2pwDI4dcVpQNEDUOP5Iws/R+oexQkfMRfX+9nOIkiAHuhbqvDp348?=
 =?us-ascii?Q?X9/X23iV+cjH6DsP9aF7TGr5dzEHe1f16tblSchVetRkXkNlOpAPTRVn5ULu?=
 =?us-ascii?Q?Srv6Wz4sT3buFPNGA/uwucntbgEC8NaXPnUbBe98sQqsRy+Z60nNjeJ1XgXZ?=
 =?us-ascii?Q?1iuqpQEKvf9Vxy/aUaYSNQlkiNwhUWzIbaeAFRM4DL/tGW9IdFuUd+FRG6lp?=
 =?us-ascii?Q?GJpe0alYzI38n/51kt4lE9IVEEh2KPyN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DONuxfY64zVtfM3uRZ2+5xyYUWtQRhY42K/N7C3tlcuVS2JkHMOBAPJ4jfUm?=
 =?us-ascii?Q?tBlckHX9g+2NbeqkdDte9rfE8hMxU5+L7fe4rv8JD/J7U5H0ve0qN5elva4k?=
 =?us-ascii?Q?tSHHh5dIJjXw6WbnXik4a8avTRpoXsu2gwKTzKL3SEahyKSPKjo/eVg1NUbl?=
 =?us-ascii?Q?Y/T+j3lr+74N/V3ke80X7girqeyEExmSZgOhH+MEJZJI+HUvlfkv+mUfdT3i?=
 =?us-ascii?Q?KDJGAdVQTze5u5D259ECWq2OXiOvCUaA84JcU4rAch0YmQaN2+yt47UMNxEd?=
 =?us-ascii?Q?hX4LAgDi/r4xdKJoWLcotjOuhbcPZjHK9Bcg3AjldpaljMFz7NY7+sMxNSoU?=
 =?us-ascii?Q?OjxwpAfjxrtPNikeXoLGrMcr4YEXVfH6zDrTtzpeOPo6URnAaCoBztoLrTXC?=
 =?us-ascii?Q?gSZSNtXjC1FtFjufQh/bpniwBvvVqlcRSN8LGdF5tvaIa6haSUPiNNN8qlxx?=
 =?us-ascii?Q?OoYFOASgf8FRGpOyHhtl0EtQgsCa8+/nkIegVriCFsbjbks2dDAZDJv8U4Jq?=
 =?us-ascii?Q?+6pXOsfcE+rsTkxXNuuPXvWvxQssugq24xMdEvHpudXmubgCyOYzU49yS+w7?=
 =?us-ascii?Q?tWNkX2wog0+ksNfPVmx2fFOBJSrtEuJBTvR1QokV4ATDUdscLDGGEstxNx+s?=
 =?us-ascii?Q?ySmWrgZk92A6jlyzzuT6cmNezThLTQsacT4+N6uHDtdlqlJJFgOa8aC1ki8B?=
 =?us-ascii?Q?Ipg/mvaQ3fPXZj6F/0+CzVF9uy9uYceh/TfnYNXqi7LDZ5rhpuSxtrVmKdrE?=
 =?us-ascii?Q?p6tUU2g8sI8n5oUVgcYl7B7tirrs67uesg6ZQxIGReOGHZoeAlV1hV3Wo5IN?=
 =?us-ascii?Q?e+TGGOqd3hZ736BFWj482/EoUAMZ87VNrynExbUNZ2pvSgL24quhMwmCTrvB?=
 =?us-ascii?Q?8h71v7UTUczF5iJtESDOmzKu90i5C2Kmcvoa1sNLPOwMrrKwTOzt+O+NsWi3?=
 =?us-ascii?Q?ilZT+KRgOXz4rIPH5RBhMCAbnvT8Jui/7tFJeoF+js5s0MG6nB/pU1EeUy6h?=
 =?us-ascii?Q?VIAwT92MO8d2/yzXfYrtYqKczqPUY42U/KwQDFJUZAzL8jv2RmJtmk87VnN3?=
 =?us-ascii?Q?2A+nL6UardDnby8q9Sv6ShxLMzunN4Vu54Yj/yOtaogIKNSMVQP2eUimF33E?=
 =?us-ascii?Q?lwwKhiQRavrPyJodMZ8K1F0dHvkLwNlQYLuL+qlTND5841j4I0bGh4LSBTI5?=
 =?us-ascii?Q?hz0wJ6gHdli3cNRajUCEawT6HylRXSyKTC1tMREC4ttbVNdTu2KscVkDtlGh?=
 =?us-ascii?Q?IrufPQgxOhOwLt1GCC7ikKUXMiestAHJoLetoCmdKFbTOV43NJvrFsTLXSbI?=
 =?us-ascii?Q?DkNocTZtvq2BDsNHo4qgIzSqS10tuzcn2atX+6PbXfnZHSJwG2IoIfQ2+Qjd?=
 =?us-ascii?Q?ssnH78zcBkCAsdVY9zid5uT2UkTg7FOXZFFpqMjTNrcctH9ysgWoFiBUMHRI?=
 =?us-ascii?Q?G+n5h3K7dWeVOJtH7o88Cn2GsD6jzOYhJFvWf04gPMoFwdW7WtFYat+3BoaL?=
 =?us-ascii?Q?C/GvNvu3TPfodJz0q3yjUU6suoFHmdxIhfQ1/WlOg6JuOlswo0a5n7vqzFlw?=
 =?us-ascii?Q?TMa42PPprUwvSrU7PEzftoVhzMPMbaQqCIh+G5SfVTV6Ou86UXRUSMpNRDqf?=
 =?us-ascii?Q?S3rqXneLwEiwsGZtmT9rT18=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dc8ac8-2233-488e-0dc4-08de1a93cd68
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 04:45:24.3645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q80mA6GGSMHYOA/4k+TQs2CzOQsI1j9hsxAJY4zBxuyd1fxTs5fPbuGkpzE90dGqvaq0Fjtpf0nQXZxiMMXtJh3LpMuDSnaaAp5XJrKpKi1Eo1YVCvWjsMp4zNz3UIDS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
X-OriginatorOrg: intel.com
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

On Sat, Nov 01, 2025 at 04:59:03PM -0700, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:24AM -0700, Niranjana Vishwanathapura wrote:
>> Add support for queues of a multi queue group to set
>> their priority within the queue group by adding property
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY.
>> This is the only other property supported by secondary
>> queues of a multi queue group, other than
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 17 ++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  8 ++++++
>>  drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
>>  drivers/gpu/drm/xe/xe_lrc.c              | 32 ++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_lrc.h              |  5 ++++
>>  include/uapi/drm/xe_drm.h                |  3 +++
>>  6 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 86404a7c9fe4..0da256428916 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -177,6 +177,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>>  	INIT_LIST_HEAD(&q->multi_gt_link);
>>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>>  	INIT_LIST_HEAD(&q->pxp.link);
>> +	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
>>
>>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>>  	q->sched_props.preempt_timeout_us =
>> @@ -722,6 +723,17 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>>  	return xe_exec_queue_group_validate(xe, q, value);
>>  }
>>
>> +static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_exec_queue *q,
>> +					       u64 value)
>> +{
>> +	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
>> +		return -EINVAL;
>> +
>> +	q->multi_queue.priority = value;
>> +
>> +	return 0;
>> +}
>> +
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>  					     struct xe_exec_queue *q,
>>  					     u64 value);
>> @@ -731,6 +743,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>> +							exec_queue_set_multi_queue_priority,
>>  };
>>
>>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
>> @@ -752,7 +766,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>>  		return -EINVAL;
>>
>>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 38e47b003259..964a0e6654c7 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -31,6 +31,12 @@ enum xe_exec_queue_priority {
>>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>>  };
>>
>> +enum xe_multi_queue_priority {
>> +	XE_MULTI_QUEUE_PRIORITY_LOW = 0,
>> +	XE_MULTI_QUEUE_PRIORITY_NORMAL,
>> +	XE_MULTI_QUEUE_PRIORITY_HIGH,
>> +};
>
>Kernel doc.

Ok

>
>> +
>>  /**
>>   * struct xe_exec_queue_group - Execution multi queue group
>>   *
>> @@ -134,6 +140,8 @@ struct xe_exec_queue {
>>  	struct {
>>  		/** @multi_queue.group: Queue group information */
>>  		struct xe_exec_queue_group *group;
>> +		/** @multi_queue.priority: Queue priority within the multi-queue group */
>> +		enum xe_multi_queue_priority priority;
>>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>>  		u8 pos;
>>  		/** @multi_queue.valid: Queue belongs to a multi queue group */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index d2aa9a2524e7..5ec144c1c2dc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -634,6 +634,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>>  		return;
>>  	}
>>
>> +	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
>>  	xe_guc_exec_queue_group_cgp_update(xe, q);
>>
>>  	WRITE_ONCE(group->sync_pending, true);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index b5083c99dd50..45fc5bc5de5c 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -44,6 +44,11 @@
>>  #define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
>>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>>
>> +#define LRC_PRIORITY				GENMASK_ULL(10, 9)
>> +#define LRC_PRIORITY_LOW			0
>> +#define LRC_PRIORITY_NORMAL			1
>> +#define LRC_PRIORITY_HIGH			2
>> +
>>  /*
>>   * Layout of the LRC and associated data allocated as
>>   * lrc->bo:
>> @@ -1386,6 +1391,33 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>  	return 0;
>>  }
>>
>> +static u8 xe_multi_queue_prio_to_lrc(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
>> +{
>> +	struct xe_device *xe = gt_to_xe(lrc->gt);
>> +
>> +	/* xe_multi_queue_priority is directly mapped to LRC priority values */
>> +	if (priority >= XE_MULTI_QUEUE_PRIORITY_LOW &&
>> +	    priority <= XE_MULTI_QUEUE_PRIORITY_HIGH)
>> +		return priority;
>
>You santize at the IOCTL layer, so an assert here would be preferred.
>

Ok

>> +
>> +	/* Fallback to NORMAL if out of range */
>> +	drm_warn(&xe->drm, "Unknown multi queue priority: %d, defaulting to NORMAL\n", priority);
>> +	return LRC_PRIORITY_NORMAL;
>> +}
>> +
>> +/**
>> + * xe_lrc_set_multi_queue_priority() - Set multi queue priority in LRC
>> + * @lrc: Logical Ring Context
>> + * @priority: Multi queue priority of the exec queue
>> + *
>> + * Convert @priority to LRC multi queue priority and update the @lrc descriptor
>> + */
>> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
>> +{
>> +	lrc->desc &= ~LRC_PRIORITY;
>> +	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
>> +}
>> +
>>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
>>  		       u32 init_flags)
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index 2fb628da5c43..3e6b356e0d1c 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -8,11 +8,14 @@
>>  #include <linux/types.h>
>>
>>  #include "xe_lrc_types.h"
>> +#include "xe_exec_queue_types.h"
>>
>>  struct drm_printer;
>>  struct xe_bb;
>>  struct xe_device;
>>  struct xe_exec_queue;
>> +enum xe_exec_queue_priority;
>
>Never needed in this file.
>

Ok

>> +enum xe_multi_queue_priority;
>
>No need to forward declare if xe_exec_queue_types.h is included. If this
>compiles without "xe_exec_queue_types.h", please drop that include. If
>it doesn't compile, drop this forward declaration.
>

Ok

>>  enum xe_engine_class;
>>  struct xe_gt;
>>  struct xe_hw_engine;
>> @@ -133,6 +136,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
>>
>>  u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
>>
>> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority);
>> +
>>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
>>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
>>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index d903b3a55ec1..8ab44413646a 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1258,6 +1258,8 @@ struct drm_xe_vm_bind {
>>   *    then a new multi-queue group is created with this queue as the primary queue
>>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>>   *    queue id is specified in the 'value' field.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>> + *    priority within the multi-queue group.
>
>Should the valid values be in uAPI as defines? At the minimum the valid
>values should be mentioned in the kernel doc.
>

It is defined below. Also mentioned in the kernel-doc.

Niranjana

>Matt
>
>>   *
>>   * The example below shows how to use @drm_xe_exec_queue_create to create
>>   * a simple exec_queue (no parallel submission) of class
>> @@ -1300,6 +1302,7 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>>
>> --
>> 2.43.0
>>
