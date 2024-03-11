Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ED1C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 05:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4110E0EA;
	Mon, 11 Mar 2024 05:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVveDhCI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E8510E0EA
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 05:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710134602; x=1741670602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sArq/TrsxYF26FIbtOErCbBgMn+j3X3XwvGtnZER4ck=;
 b=OVveDhCIAXdzc3KCf9SdI5T78j01/tOVLvNNFJvHyT3QXXe3bnMg4IIa
 Y08zaDXPTrULxNdFd3pG+7IlChWFiOaoFFShAhYSVGN2IzBcBvd0ev5A6
 UtMPZ1l1V9BRijTWai1vCB22QFge1xq6bFRq9tdw2Wi799GteyzPJd1AF
 9QAMfGreWkucpzWJDnDLZvqdAoLoRvt28PPTKQG6P7EA//gcu8K7fcOx3
 CUa+BqJKQmPAHxTRTsJJLkC6reHgqTQNmGeYD+VSebJkp/8hbEqxffjir
 G2HTSq2tgT8DSLBLzRC5nz9Aysr4Sv71TM8JwreSZbqoGPVOjcC3Jz1v1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4920091"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4920091"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 22:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="15614975"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2024 22:23:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 22:23:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 22:23:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 22:23:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 22:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQRL049PFCiHz4sEh1NZV7caRzPOrXspZ4lj3AophLLxNkFsJ0uXvm0k1CTzBcoAGdvu7LoRTELd/xEu5ILwmspJJtrk3wOlUQDcSiOk5VmfblmD5ICf8MInZeEnGIC122oEa2ijsw5x1alorG9p6QP9lzSL9DBuflbDIIJG86WOs8Kbu0hN1Vg87USb8X3nSAJt8wXpiPdcbyS4pw0H/6KTOJSAS7c9sudSoqtAGOn14e3jcEJTbaj/SF4FZGaZBLCclpwDuHMiZrmLHSZGfqNmzlfmtH+urD6S2hU6yl5hYrp5iII+3doOnDDVj9qWvJC+SBbJoP9cVlljKEiMNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4tMdKpKdZsRfL+ZcH9r1KYnP7v/wroSzYEBpHjk/T0=;
 b=jSIG/AYKTQFhK/60FpgFPb7Jvf/P2IuUfbxzOFCzOS1/vu+D0UkNgObFNkUL5zVff2J5SYyMgYXJq9eOeWCpQCSS6tDy0i+rL/VgZKGn/VtzuXOpxn9iJbydw8lQtxqwVyx1FRk8mKPVOB7ARK5ByETMxfdyv7P3u3/SU669gzQsbgCm4SkI4oB1MZCeXh744dicWfrzSckMk50Pb6PNkO1SK3mZLG6miIIEFZafgx4tmBNT3gbqjbwVxY8ntpXa/Tg71FwK0kHfJsn154cHAkRae4SmnHokiYq+bIhFngOhKdE8SRlxyr3mW7jBpSOp+qa6EaM9doffrj2wV77jBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7099.namprd11.prod.outlook.com (2603:10b6:510:20e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 05:23:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 05:23:16 +0000
Message-ID: <72814323-19e7-4ddc-9551-892f582490cc@intel.com>
Date: Mon, 11 Mar 2024 10:53:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RFC drm/xe: re-order lmem init check and wait for
 initialization to complete
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@intel.com>, <badal.nilawar@intel.com>,
 <matthew.d.roper@intel.com>
References: <20240308085517.2030484-1-riana.tauro@intel.com>
 <20240308085517.2030484-3-riana.tauro@intel.com> <Zesj1vgtwk877OhR@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Zesj1vgtwk877OhR@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::31) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 3964ef08-ca8c-4c26-4d8d-08dc418b5af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObnDAIw3rD4w0Wq/YiL0ks6fylLxivMIjoFYGPlJlINRRjbwLK6ORstIcrdZe2mmmJl98YPBucjJE63Ly0OWnKlOf1os2ngWpHyqQjzX6gA6xO7Rs+aIQLgiOKLY4M6uSRz7ZTjDjmHBYMW+YfXP5faxrfDtnvSg0e3LGuqLhd3a8dJfiNf5QhnB+jJdI3KQq8AsI+hE/57gpU41kQxuTAY5w/RhZ4kfsRgoJ6s7szvUmmDm4OTIL6EniF0ngnwcWeCbPWe9Q0RXupMsRdImCyZJLKIk52b1IFhAf8scy7aFaxM7JWUrDehqITJ7NB9D3dHfgORuSKHl/WXBQ0o7iQnQZNReu8cY3BVY6VXhr5l0PZ7tX/aVhAEw2cmcLJHE6yOJXA2tL2Q/grtDJ0TtBjF23BAi5DAWn7dKKJiezj6sZGoXwWm3b1d7C4H3oDVTap9mOw2kGgAkxrde2cLEiDkD3aKtimVlYXVV95WUmavIficIfUaLhAKmrBQ5+sVihbMItqkKmeuSeGBJM62zN4RA07RtISC5uGlqTjacvLWqPYMsPpNPVV3h36b9rQs4urDBRVEzG2wSNloSFmVj0uxNdP7VaRdHMOlo68Sr+yF2rLfvojIP4+U/qAnwy4IJMq7Bkod9IPkL3Y6sBZ7SV8YuuLCxs/JxStS7f0bBdIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFUVUZLSzBqNkFnU01QdWFEM3lBWGUxWjRXYUdjR3B2L2hMUURqYVR2Ry9p?=
 =?utf-8?B?Sk0vQWFOY3VMOXdXQ2NsSmYvYWxkZnJ0REkya2VtbCswMXR1eWhwSWdtbno3?=
 =?utf-8?B?Z3JsNXhHcVRBY2NhUHlRT1JUM1RFSXZDakl2eENZWXpDTG8rMWoxTUdMNFdy?=
 =?utf-8?B?ZEJLZTRMTGdOYzF4WFRFWWxpalkybkk2MFp5M3pnb0NWbEtwNEdabTFWdjRD?=
 =?utf-8?B?Skw4UmpTYzNFUXFaSjFlSHBUMUVrclRjb3gycm9KNUNiZUpKb0JqQWp1TUp1?=
 =?utf-8?B?SFlqTkdkY2JlcmdWUEt6RDBsSU1vUmNNWlFhK1VEdEM1MTlYMmY1RXNPZVlq?=
 =?utf-8?B?Tm1lM3NIeEMyVW02c1QrbzdRUkpweFRxb0xIWmlCc0Vrb0lGblY0bmd2bDgx?=
 =?utf-8?B?aTVnaEJtSlExUDNpOVZxbGVkVC9xWGNMWEd1NENsYVBvVFVyZkV4Q1BoRTV1?=
 =?utf-8?B?LzU0dlpRZlR2TWFmYUZ4bE9vWEdHUEdtKy8rWnpiRllsRmdNa0NPZFhOT0J5?=
 =?utf-8?B?S3FjRlpBZkkzcGN3SkhTbFlCU1hQQ0NrdWcyV3JBcG9WcHRlREk3ZGl5QVBr?=
 =?utf-8?B?UWtHL1FLSm9xZGJCSEYyYWJJcFgzZmF6YWQ0c1BqYWZIS3VUZzlyUmZFZ2U0?=
 =?utf-8?B?OEZ2MC9KQXIvNDlvcnAxL0c2Y2Y4eWFKRU5ZU3B6N2o1c21oRFNPNCtZelcv?=
 =?utf-8?B?b2Npa0R3MzBDajdia05hdUYzdzRzVENwZlNBQS8vTXVadC9WalF0TzJXQTg5?=
 =?utf-8?B?cW1QeTFtYnB6RG1DVm04QUJkZ2hZN25QQ3lFZnRNNWlkZ0xISkVxL1E1ODVs?=
 =?utf-8?B?RjJBQUhrK1ZrWk9NNUoySEpPc0xUMDM5TjZPbVBINjV1aVVsMmRxcDFuZmtN?=
 =?utf-8?B?a25CbXJ0dWhWVlVkN2p0L2ZFamNtSlYvbXVqeVZ1M2hia05LaXVKUEVFL3BJ?=
 =?utf-8?B?KzlFVldBODJkZk96L3JrTFNLM3V5dDg2MWMxc1Fwc0tZTkNpWlJjZWFudnhK?=
 =?utf-8?B?S1FVRERYWEZtNmtFd002QTFGK1daQ0M2RytDN3VwTnVuU1ZQM2huU0RNV1ZQ?=
 =?utf-8?B?ODZMdmtKU0NRL3VtT2NkcFUzUjQ1V1plMnQ3eXc0SzlvaWkrQ2REZXp1cGll?=
 =?utf-8?B?MFpDTWkwR2x3YXF6T0p6cUhISlFLZGhaS0Zsam5YY0Y5R3B5NzV1NldDa0t6?=
 =?utf-8?B?VDM2UG1BREZWZldsS1RQYUVkeXdpL2NFeTZxWTdVZkRjYVBmMHhMdS9aZ1JR?=
 =?utf-8?B?YVBtM0VkSUxGYUZmOEtna2t3YzBYZk0yZklQSTh0em9TdWR6UmVMZVErUnQ1?=
 =?utf-8?B?bytjenI2dzQxUG1jMDBGVUJmYmNqSHZhK2tJQnYzendGdGRNc3EvVGtQUTNo?=
 =?utf-8?B?akl0ZWhoUTYxTmtYdDZ5bWoxZUhDZGhiM1FiTGNSTSszR3Y0NHI3RXl1ZWo1?=
 =?utf-8?B?akFmM0xmTUtDRkRXa21VSDZsTFdTK2VVL2lCbXI3RkhZMURVWWVVU3VkNnFN?=
 =?utf-8?B?ZjN5SXpQS3hYT2svdTExN3NZd0ZDbGpDK096em13cEwwaWlqbk9ZdTltSlhP?=
 =?utf-8?B?S1J6bmkzUmVLN2ZEWmMzMjFJZ0hQaHRHcXV4di9KUkh4R0xRUnJwSWEzZ1o4?=
 =?utf-8?B?L0MyOUJrdVpvSjRhUjVJWDVJbjlqSHM0OUhCZGpaajJSQWgwL1o2NEVjcjN2?=
 =?utf-8?B?QkMxV3dPdit6NTJwVWlNaWw0VCtrNDc4VUxZcHIxN3R4b2FCcVNDRlJqZ042?=
 =?utf-8?B?MXRyRDVva0RzUHNOV1Bqa2QzWDRrTHBPR0RTZXFqU0hKa3VZd0xIVU41TTVw?=
 =?utf-8?B?aXEybzhGSWE1Z2h1VldXb2h2MC9iQWJKODBuKzN0aGIvcUN2MFcvN25KMGVY?=
 =?utf-8?B?UHFmTHVCZFgvNytiTU81TFhWMjMrZytIWU4ybmFoNVNDRzRKc2twbFBaRXpT?=
 =?utf-8?B?c3V2KzV4WVZnbzliWXJVTDNVb0RzTWNmZEZxZ0RpeGdram5DZUZZSC93RnF3?=
 =?utf-8?B?SjlNY1RKeGNrOWVpY2hkdkJ5VTJKRk1jTGdxcnFlQXhWYTBwMms5SjRpUXNV?=
 =?utf-8?B?UTdEWEEzNElTQkdLSHROZDMvL1Y5L0dFZmZyRVZORlhKekdUcXpsUlh1MzJa?=
 =?utf-8?Q?haPbL/OASxVkZzK8xl60D/qZD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3964ef08-ca8c-4c26-4d8d-08dc418b5af4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 05:23:16.5352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaU5DmHP13xUQL0N1qD8LoyODuaBVy+4v6RqxVvNbZKuZcLSw+sE0KUL2HAaNFvWno39Y0gV+fmzX+5utTDdpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7099
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

Hi Rodrigo

On 3/8/2024 8:12 PM, Rodrigo Vivi wrote:
> On Fri, Mar 08, 2024 at 02:25:17PM +0530, Riana Tauro wrote:
>> Lmem init check should be done only after pcode initialization
>> status is complete. Move lmem init check after pcode status
>> check. Also wait for a short while after pcode status check
>> to allow completion of the task.
>>
>> Failing to do so, can lead to aborting the module load
>> leaving the system unusable. Wait until the lmem initialization
>> is complete within a timeout (60s) or till the user aborts.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 53 +++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_mmio.c   | 29 -------------------
>>   2 files changed, 52 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 83dd60f68566..4806e7806be5 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -413,12 +413,59 @@ static int xe_set_dma_info(struct xe_device *xe)
>>   	return err;
>>   }
>>   
>> +static int verify_lmem_ready(struct xe_gt *gt)
> 
> maybe bool?
will change this
> 
>> +{
>> +	return xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
>> +}
>> +
>> +static int wait_for_lmem_ready(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +	unsigned long timeout, start;
>> +
>> +	if (!IS_DGFX(xe))
>> +		return 0;
>> +
>> +	if (IS_SRIOV_VF(xe))
>> +		return 0;
>> +	/*
>> +	 * The boot firmware initializes local memory and assesses its health.
>> +	 * If memory training fails, the punit will have been instructed to
>> +	 * keep the GT powered down; we won't be able to communicate with it
>> +	 * and we should not continue with driver initialization.
>> +	 */
> 
> the comment is negative in a positive outcome.
> I mean, one reading this comment above might conclude that we are returning below
> because we won't be able to communicate with the GT.
> 
> but the code is right and we need this change. thanks for taking care of it.
Will move it to the place where its returning EPROBE_DEFER on timeout.
Thanks for the ack. Will fix these in the next rev

Thanks
Riana
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>> +	if (verify_lmem_ready(gt))
>> +		return 0;
>> +
>> +	drm_dbg(&xe->drm, "Waiting for lmem initialisation\n");
>> +
>> +	start = jiffies;
>> +	timeout = start + msecs_to_jiffies(60 * 1000); /* 60 sec! */
>> +
>> +	do {
>> +		if (signal_pending(current))
>> +			return -EINTR;
>> +
>> +		if (time_after(jiffies, timeout))
>> +			return -EPROBE_DEFER;
>> +
>> +		msleep(20);
>> +
>> +	} while (!verify_lmem_ready(gt));
>> +
>> +	drm_dbg(&xe->drm, "lmem ready after %ums",
>> +		jiffies_to_msecs(jiffies - start));
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_device_probe_early: Device early probe
>>    * @xe: xe device instance
>>    *
>>    * Initialize MMIO resources that don't require any
>> - * knowledge about tile count. Also initialize pcode
>> + * knowledge about tile count. Also initialize pcode and
>> + * check vram initialization on root tile.
>>    *
>>    * Return: 0 on success, error code on failure
>>    */
>> @@ -438,6 +485,10 @@ int xe_device_probe_early(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> +	err = wait_for_lmem_ready(xe);
>> +	if (err)
>> +		return err;
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 7ba2477452d7..7fc0c5453b21 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -360,30 +360,6 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>>   		iounmap(xe->mem.vram.mapping);
>>   }
>>   
>> -static int xe_verify_lmem_ready(struct xe_device *xe)
>> -{
>> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>> -
>> -	if (!IS_DGFX(xe))
>> -		return 0;
>> -
>> -	if (IS_SRIOV_VF(xe))
>> -		return 0;
>> -
>> -	/*
>> -	 * The boot firmware initializes local memory and assesses its health.
>> -	 * If memory training fails, the punit will have been instructed to
>> -	 * keep the GT powered down; we won't be able to communicate with it
>> -	 * and we should not continue with driver initialization.
>> -	 */
>> -	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
>> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
>> -		return -ENODEV;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>>   int xe_mmio_init(struct xe_device *xe)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> @@ -407,16 +383,11 @@ int xe_mmio_init(struct xe_device *xe)
>>   int xe_mmio_root_tile_init(struct xe_device *xe)
>>   {
>>   	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> -	int err;
>>   
>>   	/* Setup first tile; other tiles (if present) will be setup later. */
>>   	root_tile->mmio.size = SZ_16M;
>>   	root_tile->mmio.regs = xe->mmio.regs;
>>   
>> -	err = xe_verify_lmem_ready(xe);
>> -	if (err)
>> -		return err;
>> -
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.40.0
>>
