Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFACCCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 18:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DD210E214;
	Mon,  3 Nov 2025 18:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnqCh1Jd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF7A10E214
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 18:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762193675; x=1793729675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Or/BcwBn1vww2SgqUzYPQKOlJ0YBgvh2ZX6a5Cctp4o=;
 b=TnqCh1Jdlp37YPH2OTppDc9Fi/fO1CYzrnFcM9FdpR4LXE4BWI5AeGRu
 mq5fUr9iYjExZQ1f8+8B/gpTkw8cff4h/e7SxzDaaIXBvON9uBZCOsT7E
 kf78AsnYPqbY+g3q+HjJO6lepKXIDBgbrIWGDt+iqQwnrjeYYSj7/OBP2
 lud9UNFjHN8OOUib713oE5BE9pI6JYZurUZ+UwtzVGmv4M6HqdtOJVzRp
 sHmkprq/oujDC7acgvRqnwsDyqTtdFUsa4xre2Yz6i2SK8+MxlerXiwQU
 QkAIPIv+/fAbEsBBBlHabd89X6j82HylFoSc6B+BNLYFi9qQVKSTE0K/9 w==;
X-CSE-ConnectionGUID: eFP/d/A6SFOIIUXu//LiRQ==
X-CSE-MsgGUID: E59hRRFgS8ebnQYCJ82d2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64310820"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64310820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:14:35 -0800
X-CSE-ConnectionGUID: 1gCGLtLwRk+nYH+i/5WkPg==
X-CSE-MsgGUID: +tXl+EG1TvybNvCJjwG7ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="191256666"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:14:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:14:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 10:14:33 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:14:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7DLNNM4H0XG1VSCq+44XzmQFLGvSU5KnkpfbgNRwn5JmydWrpqrFX3eMwNNoVAIkdjT+RN3GMFmQb7CG80Wtt0slvKLqGo4ikCn4slh3RKIYlj2VTuCtmsQBfsgyx7ngCuJo5ImlutxX/V6WB1C8Dh+CI1r1TwCA8SWiPZ1bsq+RLg60GJ/AUedKqYidtr0ZM2WSd9Pndacn2QZJ+EO9g6+wy26xkbQFg8hQ0b30haoGRAvLbXiIUoWsSH9qwTvjpCfxwv4a6nKzntqXUoNiFNnMJYjzmx4/RmDNpYow9Ryw3A2lqsiHnefcX3DQRnpcIeAXHjWkJ5M2MlnHlLeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1D9yK2mtev/XE9bYwtLfghW7L6juY/44brC4UnVxqY=;
 b=jGWFNBYuIbnEt28cUCzoe6noUXVT44C1G/FqbXtGlGGnBHEeSoBDUp6wZRLoaWmc8fCVN+afE78O532Qic+blWX3dM2/Ku7aHfX1oAC+FRCRuclpTvt8vSUTHT2D+fNn3kMO5J0bvxTTtf81YAvqpOFiDBlQawpISVq98s8zYQae/ouNm+FWtenIlOBMSAMR1c0CNrU4yrBrLZzrJ6ZHRnvHYJq56Q6zErn4l71zVUSD0VCdJYU4q3uIRJ/JmrHy1MVlAjWHb2ZTTmqG3FCLUvKA+9uCQ4LZpe4ekRsGd1bd6CChIsKFJLmJOoNFKnHInVW5AcTP8Vjv6BfkHdtI3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA2PR11MB4969.namprd11.prod.outlook.com (2603:10b6:806:111::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 18:14:31 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 18:14:31 +0000
Date: Mon, 3 Nov 2025 10:14:28 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/16] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Message-ID: <aQjxBMcncOOX9k9j@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-8-niranjana.vishwanathapura@intel.com>
 <aQaaxtYCevkVoq4u@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQaaxtYCevkVoq4u@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:a03:114::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA2PR11MB4969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7e1ae5-7931-4815-2f29-08de1b04d575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OzXtWpMv7UJR46xXywA+/xO0QyUrQG8gGfbBEVxZD55PbMKHY0vW/guDt5AY?=
 =?us-ascii?Q?UHmWJ3V+gaqRh/opu4+OIrzAB92rP5y7LnVcIDFm6/Lwny+98mM3Jd9emqa/?=
 =?us-ascii?Q?4/xgLBu1DwZLNh/7d2dkgFl/RCsuIMfkIU4WH1812JQrl8wTD61BNTmXGLWk?=
 =?us-ascii?Q?4pXfDJX8ZpP3w+PGxAQdtp9+JnbVpNtHQGuRpAoT5ZTwzWaPFLiymEPjsCqb?=
 =?us-ascii?Q?LyZCdLVSK67TWG14pOZxf148UDIoCpzP7NY6WaYmWL4rXpuN6ocatNBeag2Q?=
 =?us-ascii?Q?ObWQwvUKL171b6sqz8kSejRtuaXiVw0b46151g7Cejaa4vS1DeTzi/eQ3l7u?=
 =?us-ascii?Q?98yLb9fcuGbLptpqlmrcX62q4aBkwUda3NlcvCfPSNEZOBLsSEOHiwjZzgcd?=
 =?us-ascii?Q?1ygaOLfFv+jzwtGWHGA5Hm6fA3cTYcPpCpZsJBOUld5DbGPZWcrfuXkTSS9b?=
 =?us-ascii?Q?yA7U4NQFL0/NLftaB8/saoN6UMNvy8FQJXIoIMakuaIlBKEPorFMMVCUdDXw?=
 =?us-ascii?Q?5NIKtwSGEpzhaxBTLHuVbudd+TnpAf8KQmkPJEf4ulfIGGEXI5Puv9t3ib4T?=
 =?us-ascii?Q?S0rgXkz+HilEJMrJTZvyIeO2Onm7NhOOrRSN4p/2VbZi6af8OEMPrUvhitVo?=
 =?us-ascii?Q?N5d2DybmRik8rA+Nyu10hQMScnuxOUqEmZR6sW4yfeDRU4pZ7QssThNJRn1u?=
 =?us-ascii?Q?/1WZunj8kVWO7Gthi3dRub9IPmxl1G/2be/Swd8Km/xtX6xjOuFYNVKeMZ+o?=
 =?us-ascii?Q?0976XsXyfjdlJY1FN0vE6iPt+wlml6r2l66yaAjHRnl7obrYvwWZ4oRaceQA?=
 =?us-ascii?Q?xWwcNRwFykVb5TF1aTfyBQuauJBRKRUWp6MihVwMtI6kJxyWL+b3Snu3s4dN?=
 =?us-ascii?Q?Gq6a/6gjqxBR195xgBQTc28Nl6/Zh+3dih6SgebBiMmLM2Oi/uBVKYSWLPie?=
 =?us-ascii?Q?7crF0vPbBURMi0ecHZdia2ypMwnoMG2HYauRdnxrvxrZrI4poufbvW+Og9+g?=
 =?us-ascii?Q?xIBJHvaGHXjuXstOq+gAOJ0/5oo8A0JmGrrxEMxYQrnHYOB4HJwg+upZoPzM?=
 =?us-ascii?Q?sqgAYQ2Qq41reiynFZ8NB9XgRccWVGY6A66+JC5mdv5j7S8dVjkBaLaQg8my?=
 =?us-ascii?Q?fHUaTNA/jXmrDFfodtd4i1evlTwQj/925dmLTjvpm5WoDn63kNMDmUbMfLyq?=
 =?us-ascii?Q?lzIgtHv7kCytofRG03LmtmWgoGHLNpBNZHFwRaPRyOeyiUwnFbHgbP3jzm7W?=
 =?us-ascii?Q?HwpFTzv2fl1J/dNCK4ctOdgb9/XdY02id4S7ZKhgQmxmoteNWoGHhIAo36Ji?=
 =?us-ascii?Q?rPCnQcEo3GuQ3k4iFBjeNSjGNnE/qvyR4aXT8jhKfczg4eR46FFE69kPULfx?=
 =?us-ascii?Q?M+Ohzv3S4DeAmSXW/jrCqSJFkgzdPzg432az+8wG2UxQbn4w7WCnjr18W/j2?=
 =?us-ascii?Q?7X8UEyjHuK42OQT2EeVJkFnEDApSEAP3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sGGmcGueefWMDUtjWSwzajVgK++GGx4wPddEGsfi2q/KSS6Dx4snXtjIkvnp?=
 =?us-ascii?Q?BJLQMvY8uzvOjJRwQxNxsPBRRJB2Tt01ec3tnVaUvgHAJbaHEOPCYhDXeFGs?=
 =?us-ascii?Q?CWn+brW9DWHuEZRJugDdjQY6JEXt0xlHYlIAHE0PejDwo/lV5qwV7hdXDVlc?=
 =?us-ascii?Q?KzD45vgdBJUtG+XZHYI8WHzzR4PvUZn7ZkYNIUQ8vD/TbLTClxa9pKl1e/Qi?=
 =?us-ascii?Q?nXRx9OnbfUhyF02NxwIpR3GtSBBGnoDuHGgagT6lYK75MeJXGRpEjQqKb6Ie?=
 =?us-ascii?Q?69dyUYB39E4E18T09AALEr/OrnlYXuCgixmrdunkPcmZdn3erSNjYu+5Sdj8?=
 =?us-ascii?Q?wNhBITCtGNndDeAz4ues6BraF54KDDva3P7b6t0j+/qmZrQ7ILUJ9KmbaqTB?=
 =?us-ascii?Q?rta0QKrIolj4x9pnArJWA1fWSQHCXI2Mi57HLle4vzi2yj8NXj+ZI/bDWM9R?=
 =?us-ascii?Q?NBYSk30iiTNYUJ8M9DjVwuH75lpB624LG7mAPQY1t9oZnz+ubq5WmkLbEzvW?=
 =?us-ascii?Q?f4YssN9zlu+YRS8pFb0tCOuDRNfr45P4sfu4PeP0sG1noMl7kxHhZq+7Gu+i?=
 =?us-ascii?Q?PQ2Jz7FS+IQg8SC0YdH1a45WCCS+2vv9u8fLxnFvWmEQEJ52/3ruOvdeM8C1?=
 =?us-ascii?Q?vyQRFivwGfhrkExg/kdEVyXpslRdhtV7NR4qOpzBc57UP17b9gobL524NNjI?=
 =?us-ascii?Q?Gglu2ULGeM295WL4YA1Tb44pNcRKTy9oWJxadgbkT7Sc9NliD60UbEZW4E11?=
 =?us-ascii?Q?F8CUGWbCCrTWLEYcrUw9C/gXC9EB72/XAMI/41pERWuP0MaZsfxbEfleNT7M?=
 =?us-ascii?Q?PZCSEfiA8e71xeIOys2MkEk35HWbRXPcVcC8gXtCyg91CB+OQenuDYdren3D?=
 =?us-ascii?Q?zXiYFeGs7WArgF/CptcRdW7rSwWlzAHxLxiRw8b64XGBOfm7eWtlwAh5Ibuk?=
 =?us-ascii?Q?5kVgOvOOobNtffjlnE27bAh1O+zuYw4T0ZMS9gNsWSd0T6X6TTZAWsVbdpHD?=
 =?us-ascii?Q?j50sbzVAad2CFj8KNV7tCN6E7S5Y96XtmQ1sIz+ApqA/pWFTU9e7evECVPzD?=
 =?us-ascii?Q?yfGwH40z5RiSX/38mzQme3xYUaKH9I+tIgPpbmJt/mUH4o2+gNRuFp3eYmlg?=
 =?us-ascii?Q?7eb3MilSkuKG0+Tt6FupnYH10LlTh69oB3qi2APqEkTLTgxMNo3ub2Z0GE1m?=
 =?us-ascii?Q?fX780sRwsJooWwFGfOBZitxPhz7JTh/ICAurRATv/9RVWZCB5SMj0uM/PGyt?=
 =?us-ascii?Q?xjLv7gURIicYhQwpp8VbDXR4alzEy5ZHWpmRhAv2gGqua6NLm5FZvqW8Nrlt?=
 =?us-ascii?Q?RNeKFCyTeM1QnYRSOOo7N9Afucjd94k6U9fL1C+lHLsdt77XJ5hgr0ODLF02?=
 =?us-ascii?Q?nwOO3jvpEdiWmu5Rft5VsYZhsq6lNg3LrA3mmxRsj5mouBVfdeKY5Jbk2OZO?=
 =?us-ascii?Q?hmr9oshRyJgHe+X++MWJPBvKbvdlztDTst68Z/ik8jAxwISRry56PxbdjX3z?=
 =?us-ascii?Q?1+SknBG0TeO7cKVnuwuEy0Qr2gSsL3LfH1n4SJl+VAM0k9ZlFNsA/lB1bv0D?=
 =?us-ascii?Q?jNFFF1gKq2oCN1JNYQTA1/Ws1rregGE6HwDKFHiNYJx4K12AMtHoSz5QkBO3?=
 =?us-ascii?Q?cwuGqXjSUZC3z9T1J3/P+KM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7e1ae5-7931-4815-2f29-08de1b04d575
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:14:31.0747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kt73Ll10iVmixLXVT7/lf0UASQOuCgZeLpBj04jpG8hcHdd6jnlY/UdlrgB0yR1YfrkS/CTlI/sSDPFN1Y31KLWyBc/M5LNjXuBMH/vxw807EKXjkg6kZ+NFRpK+sw/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4969
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

On Sat, Nov 01, 2025 at 04:41:58PM -0700, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:27AM -0700, Niranjana Vishwanathapura wrote:
>> Support dynamic priority change for multi queue group queues via
>> exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
>> the drm scheduler message interface for priority to take effect.
>>
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 12 ++++-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>>  drivers/gpu/drm/xe/xe_guc_submit.c       | 56 ++++++++++++++++++++++--
>>  3 files changed, 65 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 0264cab00fd4..98f8f1c7f13b 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -729,9 +729,13 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>>  	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
>>  		return -EINVAL;
>>
>> -	q->multi_queue.priority = value;
>> +	/* For queue creation time (!q->xef) setting, just store the priority value */
>> +	if (!q->xef) {
>> +		q->multi_queue.priority = value;
>> +		return 0;
>> +	}
>
>I also don't love this check here as if exec queue creation order
>changes, this code breaks. I'm pretty sure you can just delete this and
>send on the message to the backend given
>guc_exec_queue_allowed_to_change_state check will change the backend op to
>a NOP.
>

The multi_queue_priority propertly can be set either during queue
creation time (via multi_queue_priority extension) or later during
set_property ioctl. This function gets called in both cases.

When this function gets called during the queue creation time (during user
extension parsing), the guc initializaiton of the queue is not yet done
(ie., q->ops->init() is not called yet). So, we shouldn't call the
below q->ops->set_multi_queue_priority() function. That is what the
above code is handling.

Niranjana

>Matt
>
>>
>> -	return 0;
>> +	return q->ops->set_multi_queue_priority(q, value);
>>  }
>>
>>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>> @@ -760,6 +764,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>>  	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>  		return -EINVAL;
>>
>> +	if (XE_IOCTL_DBG(xe, args->property !=
>> +			 DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>> +		return -EINVAL;
>> +
>>  	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>>  	if (XE_IOCTL_DBG(xe, !q))
>>  		return -ENOENT;
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index 964a0e6654c7..dcb55b069ed8 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -241,6 +241,9 @@ struct xe_exec_queue_ops {
>>  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
>>  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
>>  	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
>> +	/** @set_multi_queue_priority: Set multi queue priority */
>> +	int (*set_multi_queue_priority)(struct xe_exec_queue *q,
>> +					enum xe_multi_queue_priority priority);
>>  	/**
>>  	 * @suspend: Suspend exec queue from executing, allowed to be called
>>  	 * multiple times in a row before resume with the caveat that
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 5ec144c1c2dc..426b64ef8d99 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1761,10 +1761,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>>  	}
>>  }
>>
>> -#define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
>> -#define SET_SCHED_PROPS	2
>> -#define SUSPEND		3
>> -#define RESUME		4
>> +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
>> +{
>> +	struct xe_exec_queue *q = msg->private_data;
>> +
>> +	if (guc_exec_queue_allowed_to_change_state(q)) {
>> +#define MAX_MULTI_QUEUE_REG_SIZE        (2)
>> +		struct xe_guc *guc = exec_queue_to_guc(q);
>> +		struct xe_exec_queue_group *group = q->multi_queue.group;
>> +		u32 action[MAX_MULTI_QUEUE_REG_SIZE];
>> +		int len = 0;
>> +
>> +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
>> +		action[len++] = group->primary->guc->id;
>> +#undef MAX_MULTI_QUEUE_REG_SIZE
>> +
>> +		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
>> +	}
>> +
>> +	kfree(msg);
>> +}
>> +
>> +#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
>> +#define SET_SCHED_PROPS			2
>> +#define SUSPEND				3
>> +#define RESUME				4
>> +#define SET_MULTI_QUEUE_PRIORITY	5
>>  #define OPCODE_MASK	0xf
>>  #define MSG_LOCKED	BIT(8)
>>  #define MSG_HEAD	BIT(9)
>> @@ -1788,6 +1810,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>>  	case RESUME:
>>  		__guc_exec_queue_process_msg_resume(msg);
>>  		break;
>> +	case SET_MULTI_QUEUE_PRIORITY:
>> +		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
>> +		break;
>>  	default:
>>  		XE_WARN_ON("Unknown message type");
>>  	}
>> @@ -2004,6 +2029,28 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>>  	return 0;
>>  }
>>
>> +static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
>> +						   enum xe_multi_queue_priority priority)
>> +{
>> +	struct xe_sched_msg *msg;
>> +
>> +	if (!xe_exec_queue_is_multi_queue(q))
>> +		return -EINVAL;
>> +
>> +	if (q->multi_queue.priority == priority ||
>> +	    exec_queue_killed_or_banned_or_wedged(q))
>> +		return 0;
>> +
>> +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
>> +	if (!msg)
>> +		return -ENOMEM;
>> +
>> +	q->multi_queue.priority = priority;
>> +	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
>> +
>> +	return 0;
>> +}
>> +
>>  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>>  {
>>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> @@ -2095,6 +2142,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>>  	.set_priority = guc_exec_queue_set_priority,
>>  	.set_timeslice = guc_exec_queue_set_timeslice,
>>  	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
>> +	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
>>  	.suspend = guc_exec_queue_suspend,
>>  	.suspend_wait = guc_exec_queue_suspend_wait,
>>  	.resume = guc_exec_queue_resume,
>> --
>> 2.43.0
>>
