Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA71CCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 17:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EAF10E297;
	Tue,  4 Nov 2025 17:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+/AJ0W/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8285D10E297
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 17:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762277062; x=1793813062;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1KQMqVoNwRbled951vujqf6xck2Ge8l+QmWvfe6FMfc=;
 b=K+/AJ0W/SNbw+WsTtBImXrcYuwerA0zKQfmPbsS5C2xA86KjuTxZrgbm
 lNvVQcZe3JlMIvej7h9t9cQuHS/5oQip5Bp9D2Z56n8IgC8BQyvQTSOwt
 TliwdJSzOV5FOXIzBcER7ZcZDSrzYqO7+fuZ82ap990Z9eTbTvry/grCA
 qz1/C6WRq87ScVo5vDDWHKywf7iL/1c+DFAI0SiPZxkzebbOoFv8FLi1N
 NMq33w0fGPR/HMdkM5wCiGscXh/NnUcCAok41Y3XfhXELaOijpZyiqj08
 bA6lp71Lqlq8lfETmpsuPk2ss6FWdpNYIxW5ecEBTsZsiG7qlk4cBRdCu A==;
X-CSE-ConnectionGUID: ChnBKiuJSYS/U0NcotgVIw==
X-CSE-MsgGUID: tJxZ8Fz7Tsq6ZB8iWITimw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64411313"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64411313"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:24:22 -0800
X-CSE-ConnectionGUID: o/wReDPtSmSed0JMUIIEQw==
X-CSE-MsgGUID: tOVlCAKORhOTJ2YZVxmctw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191308852"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:24:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:24:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 09:24:21 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:24:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2JuwbJ1cXh8e5ObPMmFnuYX6QPdcpHRLQ9lW978FbjR9PxJO8qNUgqqH0BOWfKibHg+SXqfF8ZyjjvnokS8Zf7XYzv9ZF8UR84pWNVjOYYUCv81gOfmZgKiuPj9eSHbUXqa0ryu1Pfje+6sHbNv584rA7urD6fSs6NUvnI2i700yyrXqKEr0xsv0tdilk9zX8ZNWhXxO1IIqidqM/fwZ+dQr/JrKR22l7a3bfzosPMsCwYZfDRTt9Z1ykjTas2qu0pnSZ0LBiWnT+nRAHFYqAulhMRxuqN93Fflfv6/ZyZ2BySO9GRVYHTEJ1uLI20CQym2C+ajWC5cPLXH+kfc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Jbfrm+6HRWqqszeYZaq8mYWPlwNhg9aUNcEMdAYc4w=;
 b=yGSNLaTPXYebV4+tm8+6Pnxjslpclardgo5Pi/mOySbCH90OgPIeujirjYQrgXANbGZu4CPgTF5wHmZ988CcOja0QTtVLH4AVStHAvPGZx7iGdZifDOmo1xNpkoQvwn6VAYNwjI8P7uhllTurbQ3W9+UE8uRGh2ZurkMNMPi865AY6fh9xCq0IF1PeslgEG9/4JyauVirYffT26nZ1OrQ+hS1nL1wZGf+ABXReVGlt1SHIGMwQZK+p+Zm+7s+k5cql+SMS3Z7lofregvpt14KpD5GozVb1OwDeHZbyTn/99sCXSHmXfSyQcoIS+dsIZ/mQB/dvPITvXIt72MoXYIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 17:24:19 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 17:24:19 +0000
Date: Tue, 4 Nov 2025 09:24:15 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/16] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <aQo2v7Kiphmc7ibF@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-14-niranjana.vishwanathapura@intel.com>
 <aQknQYvam2TBQIpf@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQknQYvam2TBQIpf@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: e1770def-26b8-496a-5d08-08de1bc6fc47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vGtY/hwP/wWAM2FwVHkYgnbVkb9XOTThG0TB4dCSJKhAfCC5XS1alv1Enb25?=
 =?us-ascii?Q?aevf9rDLkKTpJZaP2Z4Rju2IF5szP6T2R1+z0Uc84iblajnGtZzA+dIE1kwV?=
 =?us-ascii?Q?8HfyWGNKkLujaO3EgLINMSTVSuPIBwYKQ2T5JCrNgqqluUPdeTUpi/KoAxeC?=
 =?us-ascii?Q?Ke0IbmynQPHllzffoynj4BpC8W2bECp8DHOaLIEF2I6X0Iz2/mrH7HSidSdn?=
 =?us-ascii?Q?YYxEYOHa1I7AhyhtRLY2N9S4Nib+ORAaVKDvp5nNi52xU1KxVEFX8hYtCxNN?=
 =?us-ascii?Q?oxicq7LOwGPNTtgPvM9Mi6yKcfKjEzOlJhiGGzUEiVtIHxGJ/fZdl1CXBAEd?=
 =?us-ascii?Q?S+Xnlddvlk9CmcGsWaHhX3Hu2ls4gqukQ3j5aCvzzercdDwOVv2Z+IiKGTgK?=
 =?us-ascii?Q?GFn/KtdYbCWB8dX8D44Ucv455vVOsaoAri/WeTinfnVDgvrLrNRoWENSfeAY?=
 =?us-ascii?Q?ipJGz4a5qJTp7ii50NaW/VU1WyXbp6XSt5NH06rVweo3hw4q1z60pWjkcJiU?=
 =?us-ascii?Q?1OMeU6Q4LoKTuvMI6W/O5EfysBhNCLM+T5rdjK1D6NAbjzrGBdy0YuHt3k3V?=
 =?us-ascii?Q?+eZYV/ORWVI2+RF73nNL82BZAxEnqCdHeELPKDfP8mbuNXVIvhcoEitpMa1z?=
 =?us-ascii?Q?rQ0EB/gXb6v+FP0XXNfGyjuekNRTetnAOpnr8E9J0EqgmVUUasnk+KHKrJec?=
 =?us-ascii?Q?VzwPmMvYZWK8+R6CCgAvibQmlVarbkFMAnlO2+DOyP3K83C/pExU43rZIW9h?=
 =?us-ascii?Q?yzrEJ8hUxX5xex7wrIGTZyTDET3a7WT8Td/G4MSXANwZ0fho5dvybpUMUL9a?=
 =?us-ascii?Q?iYE2HgnGppabIlOGSN1vTDPBT0jrabUgEeHPpWuL1Lpecw7G4PT05toNmnfN?=
 =?us-ascii?Q?WpqsRxjVmV59HSF8/rhyMBBEsaiXLPmgtFENyHQMO0f2luZCePgbTckesekE?=
 =?us-ascii?Q?ODRMBU/8JD9XOoR06Z1ybjMkG9AQS7sNPE01BdgTqwPn64RHEvn9QgL5jC/i?=
 =?us-ascii?Q?iS12sfm6IKGN8IOMwVDLaBMZgsk5F50uX4pbZ60y4w32DoljLjim3khNJaMP?=
 =?us-ascii?Q?+qC8t+YKSLK65mn1mbq8GT+LR3CjO4wMCjusJZxy+s274v65aRqNEMod0RTr?=
 =?us-ascii?Q?KLI9o8iAJS5sqbtwR4arsExe1D04kkEUJnHK1OjU4stZWBGBcrmimzVdlUdf?=
 =?us-ascii?Q?O99Gj/vTh8z21shMYKoblV1qoFkH+qm+5Hh/QGAO63i3adTOq4hkTe0kvmUp?=
 =?us-ascii?Q?MJxF4O4X9JeRRmh5V57mEnzJCZgGxIRwKkdP4YeAruE6aZyu3+rHpiV6YJgv?=
 =?us-ascii?Q?nDdfdX5UxwmBX56ZVHptgdkD+twVOhAxoNdDpkuldhBl5f48D5i2Lh97bw7x?=
 =?us-ascii?Q?v2HwpYx+AU6yeuo+WADSyeuNh5/W79IlyQxI2dVjA8wsdjw2iibpqT64rq93?=
 =?us-ascii?Q?0+Ac2Pho4PXby+o1y1amK5HXSa/zU6QK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O554IXIbBuUbnxkOhT5vHN42xAASRHZQgFWKwaEbaGnIIMQF8bjYaIckeCEm?=
 =?us-ascii?Q?kN8qEFCkKWtKOGQMpKCz9k/42xiDmM0k0PGhyLr5955at9uV+VpeIPPQpHF3?=
 =?us-ascii?Q?HVYVTAgGEJyl4bAECkSi1Qw3IJpKKStjSZHoeh7RnFKCg9sjqZckgb62g1l3?=
 =?us-ascii?Q?76mOdgqRQcUF+I9wUnUmsUvTqi9SlwZcVj+vsa0jK/Z7wAG2ILYqAg9eOKjW?=
 =?us-ascii?Q?ZPEnZYENpSYbcgNQAWPzICUgWnL9ViWv2mUOhND3MJTnhusQ8L0A5veOOL/l?=
 =?us-ascii?Q?0kAx+XWMWyHJZo/RhnEslhOjIQxpDkcsp0GnOz8vGFdxC4XQzT+5DePPtriF?=
 =?us-ascii?Q?1ay3cUpmTtfANVdhHDuHirdgkSqcn4s4qsB/2+RL9bhvNO0y4g7VMJQZey46?=
 =?us-ascii?Q?Vi15NAzAbDRv/q9GFT1MGV2YDmWnhxi7qmR0FbM5oQI6dLzom8G7PlLP9wHH?=
 =?us-ascii?Q?pRVovKSOPAsITZ7C3i4qnrA/4dFT/ctkecRICuZkWZbHOwQU70/PTXO99z+f?=
 =?us-ascii?Q?3w6K1vIrnNIH98cobKppL+VUYMZHPYCUMHz2DmdapumA+LEd0JxF7hUO6E1q?=
 =?us-ascii?Q?sFrQWH4DWKvH88aJrCEUrja9KS5WXuwZkn8aLyz2/0d00L1DVvRtaqwBNawJ?=
 =?us-ascii?Q?5UmAKDckBRp1HrvBPqec/crRDZ/0zTqIgqDmkc6mQijp1A6eAL1PYnb+0FKS?=
 =?us-ascii?Q?2WS3it9yWRtpH/xSLnsx8LSvaU3XDSg8Be0sofdMeRv9huVJJBRMW96ReM7Z?=
 =?us-ascii?Q?yIuEIEGaZIBKAemGdx0js2q4VP92mAKEo+GtxRuqqbX3aRoa0NTFF05ZzZeK?=
 =?us-ascii?Q?BOXvVPeLpaYqjFJkmlif2dF7YyKpdonhym5/xuKgwrp6x5U3j6zGxTTJ+Aiu?=
 =?us-ascii?Q?Hivs8TTxkosS5iuKJdvpkwGNb0r1uaZvScahv4aOHV5D0ZVbZxLbuL1FMgCq?=
 =?us-ascii?Q?7sPiFDB1e3e3HZto23gah4O6ZYj71kR0Qr8U6SnBjqdFFuyex53rKyql3zBr?=
 =?us-ascii?Q?G3KqcSkXa3nWjM86kXX2hjzSCl5SChtc1bGFK/ttw1MI4Gnbo7KVxwSlD58V?=
 =?us-ascii?Q?QAko4JmDjmSTpSQSePzQ40Esokjzs3FIXgOLpd2BAb3ptJQx1thUKs7glKuS?=
 =?us-ascii?Q?aFyDjT4qJLKBKf/7DRCz52S2XH8w5G5u7FjAmTwSaY7z1EIXi7tAHoKjnm1D?=
 =?us-ascii?Q?8i7iVX9QE4HDTZLbVG5j1gYF8wQMjnfwNGfNgckBDVmnzPDPghLerv+vc2XI?=
 =?us-ascii?Q?dZwpAicb8cr2LElQqolyxf+N6yPluMxgYqtiRIYK3g0VvbKKg0/Va1xPW601?=
 =?us-ascii?Q?tkNZ3GR8bKyeFaH98/fmiTmc+V19Lk1FlvPMFISaVi9KYtcHzRQFnSIFIyDq?=
 =?us-ascii?Q?w1/uvT9sbBGqqNrJJDTEUGbc8VPwZCtNa8ViisrxbqY+0QlamBCwkyhTmUlZ?=
 =?us-ascii?Q?n6gxtEDoWBtiMFhlWM4R/DP/2Jhk0pDIjkuEMO+mp0gzZoBM6ZtUE8/0Fr+h?=
 =?us-ascii?Q?3P7e+90jVGg8CWnWtHV2LyeL+pMCxaMBN9jix+x6pGn3S+mYd78tuorG9P9h?=
 =?us-ascii?Q?oLJR3fYmx8o2JY90IXbHjXHqkUsPJ6Ip85LqjOfXtDLUII7V1JLFpz8l8Rxz?=
 =?us-ascii?Q?zCZXEHwkOOJ/1RXZpo2ZYtU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1770def-26b8-496a-5d08-08de1bc6fc47
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 17:24:19.0007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqQ8asUTv5AD1Vx7eISuEkyX4XP6nfFmKXhfO101/NtdOJMXqmyWqk1xbrwz5t5DKz9cYZkNXWlmomRDLwvFBkmTpzhqq3+ZaTbfW+NH3q2yQ9oiKARcXPOWJOsSmmmY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
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

On Mon, Nov 03, 2025 at 02:05:53PM -0800, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:33AM -0700, Niranjana Vishwanathapura wrote:
>> Add support to keep the group active after the primary queue is
>> destroyed. Instead of killing the primary queue during exec_queue
>> destroy ioctl, kill it when all the secondary queues of the group
>> are killed.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c           |  7 ++-
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
>>  include/uapi/drm/xe_drm.h                |  5 +++
>>  5 files changed, 70 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 0b496676527a..708a17c357e6 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -176,7 +176,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>>  		if (q->vm && q->hwe->hw_engine_group)
>>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>> -		xe_exec_queue_kill(q);
>> +
>> +		if (xe_exec_queue_is_multi_queue_primary(q))
>> +			xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +		else
>> +			xe_exec_queue_kill(q);
>> +
>>  		xe_exec_queue_put(q);
>>  	}
>>  	xa_for_each(&xef->vm.xa, idx, vm)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 3c1bb4f10fd5..d7b0173691c1 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -405,6 +405,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>>  }
>>  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>>
>> +static void xe_exec_queue_group_kill(struct kref *ref)
>> +{
>> +	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
>> +							 kill_refcount);
>> +	xe_exec_queue_kill(group->primary);
>> +}
>> +
>> +static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
>> +{
>> +	kref_get(&group->kill_refcount);
>> +}
>> +
>> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
>> +{
>> +	if (!group)
>> +		return;
>> +
>> +	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
>> +}
>> +
>>  void xe_exec_queue_destroy(struct kref *ref)
>>  {
>>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
>> @@ -607,6 +627,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>>  	group->primary = q;
>>  	group->cgp_bo = bo;
>>  	INIT_LIST_HEAD(&group->list);
>> +	kref_init(&group->kill_refcount);
>>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>>  	mutex_init(&group->lock);
>>  	mutex_init(&group->list_lock);
>> @@ -675,6 +696,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>>  	q->multi_queue.pos = pos;
>>  	mutex_unlock(&group->lock);
>>
>> +	if (group->primary->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_get(group);
>> +		q->multi_queue.keep_active = true;
>> +	}
>> +
>>  	return 0;
>>  }
>>
>> @@ -691,6 +717,11 @@ static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
>>  	if (lrc)
>>  		xe_lrc_put(lrc);
>>  	mutex_unlock(&group->lock);
>> +
>> +	if (q->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_put(group);
>> +		q->multi_queue.keep_active = false;
>> +	}
>>  }
>>
>>  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
>> @@ -709,12 +740,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>>  		return -EINVAL;
>>
>>  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
>> -		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>> +		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
>> +					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
>> +			return -EINVAL;
>> +
>> +		/*
>> +		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
>> +		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
>> +		 */
>> +		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
>> +				 xe_vm_in_preempt_fence_mode(q->vm)))
>>  			return -EINVAL;
>>
>>  		q->multi_queue.valid = true;
>>  		q->multi_queue.is_primary = true;
>>  		q->multi_queue.pos = 0;
>> +		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
>> +			q->multi_queue.keep_active = true;
>> +
>>  		return 0;
>>  	}
>>
>> @@ -1254,6 +1297,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>>
>>  	q->ops->kill(q);
>>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>> +
>> +	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
>> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +		q->multi_queue.keep_active = false;
>> +	}
>
>This looks a little odd. Either you don't need to clear
>multi_queue.keep_active as xe_exec_queue_kill can be called at most once
>(IIRC it can be called multiple times) or you need some locking around
>multi_queue.keep_active or it needs to be an atomic to prevent multiple
>threads from calling xe_exec_queue_group_kill_put twice.
>

It looks like xe_exec_queue_kill() will only get called once.
We really don't need to reset the keep_active flag here by setting it
to 'false'. I just added that for completeness.
Ok, Will remove.

Niranjana

>Matt
>
>>  }
>>
>>  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> @@ -1280,7 +1328,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>  	if (q->vm && q->hwe->hw_engine_group)
>>  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>>
>> -	xe_exec_queue_kill(q);
>> +	if (xe_exec_queue_is_multi_queue_primary(q))
>> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
>> +	else
>> +		xe_exec_queue_kill(q);
>>
>>  	trace_xe_exec_queue_close(q);
>>  	xe_exec_queue_put(q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index 61478b2e883b..b642341f1ede 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -109,6 +109,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>>  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>>  }
>>
>> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
>> +
>>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>>
>>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index e64b6588923e..cdca3afe838c 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -55,6 +55,8 @@ struct xe_exec_queue_group {
>>  	struct list_head list;
>>  	/** @list_lock: Secondary queue list lock */
>>  	struct mutex list_lock;
>> +	/** @kill_refcount: ref count to kill primary queue */
>> +	struct kref kill_refcount;
>>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>>  	bool sync_pending;
>>  };
>> @@ -152,6 +154,8 @@ struct xe_exec_queue {
>>  		u8 valid:1;
>>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>>  		u8 is_primary:1;
>> +		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
>> +		u8 keep_active:1;
>>  	} multi_queue;
>>
>>  	/** @sched_props: scheduling properties */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index d72151163e77..333fb38b3404 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1260,6 +1260,10 @@ struct drm_xe_vm_bind {
>>   *    then a new multi-queue group is created with this queue as the primary queue
>>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>>   *    queue id is specified in the 'value' field.
>> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
>> + *    set, then the multi-queue group is kept active after the primary queue is
>> + *    destroyed.
>> + *
>>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>>   *    priority within the multi-queue group.
>>   *
>> @@ -1304,6 +1308,7 @@ struct drm_xe_exec_queue_create {
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>> +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>>  	/** @extensions: Pointer to the first extension struct, if any */
>>  	__u64 extensions;
>> --
>> 2.43.0
>>
