Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ADAC54E67
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 15:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E4210EAFA;
	Tue, 26 Mar 2024 15:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6Leur9d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C4810EAFA
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711466614; x=1743002614;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x7CU1MtOx6BCGudvchVkRMzVbNFpXBC5ZnVej9a+zrs=;
 b=I6Leur9drsaWCHa5cq+1sPlu2BIRib83ikpgK1s7muO/YhWmoQEczcsb
 LXCEkZK3k7yPMO9vAcQiokf4npRRQDGBZoV95J/m9wb6Nr34m3XG1n2Y7
 4O9EMX8TxaK2rrGoGxiflmtcwtVWVr1ih6wTfZkWDxaRBuYXShR0jNzMO
 FaJ6yvnk3wieMJ9kYz81HzrCuCfrWSqkNAVNHYCAD2J8eBEQQm9cZdeXv
 T+9z2k95a86xVyVyZWLgO1IVnSKdOv2+IStBN1Z2eRPhI/uiOIUtbGXco
 tbxB8gsEav5tivRDmNuSQhWLQ1jwY79q7om+7rOQKg35n1lxrAddKyxEd A==;
X-CSE-ConnectionGUID: z31RWmzMTbiCz2kRiAzK0Q==
X-CSE-MsgGUID: Mw0IjHFGTVCJfZHLozwCbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6353137"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6353137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20459492"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 08:23:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 08:23:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 08:23:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 08:23:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRejokn45FKRzxOmc+NOsM2UQ5KL5vwsdyDRF2nDqo+KVcR9OGQZGgm4JcBL2dtV9k664kEfg8YeFWshW7gXmb+LIWDdz9YiM7hyq1cut5QuZz5WHaUFJXwDTpk/aBKrfU9s8tQ3Lf01yQfCXi5Lf3nBOiqb55R2y7mdGg/z7os3OnlM8BTTm7DkXm9sy6aGcHyofxxh36HytocnP15WfHQUmouyJ0XPOU1OUyeCbb//eBbmX+JjZUzyR4TBxG1JvIV5yslJWfA+WKzYNPhwjscAhPpkXrCNEyzLH+Rm9IEpZ4rhjaIhag+CZHhotu35u4QGDrOgG8dWwepKXIzxuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKpisjRybTKGTO8mrk1dYm3gnXeHmdVab1B66cHbQp8=;
 b=GCtkLiAexKHi6BIGK0yz9hzFcoI7g1AJaCVLZDSdv43BUFWid+Qf7FrKX4gYc56cMkrM0XtXuYGZicK8Yuw+K0PxYFZd6UA3CrmjXnABp0DrYl0uOfGRPlMnQPMQL2wW0nKA25rSnVW+RtGea04KrETCL92VLHc3XYeIRhYMFJ+yNiNWgqBqLIbpghOq2TT7UuotRAiCB3orlMUJrMvN+mtccpT9W5Sl14aKtoCHzt2EBAV0bI8CR2FGIYHbTpdBzmPWVsb9dCwamFU461pZwR6tyDRMmO8emp12EHY4LjpIMOAJ7xiyKczRA1f4Zzwn8Q/CkrLXCU48Z9XsC4eiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.33; Tue, 26 Mar 2024 15:23:22 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%5]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 15:23:22 +0000
Message-ID: <9e257d4b-8335-473f-8d0c-ee2b6673aec5@intel.com>
Date: Tue, 26 Mar 2024 20:53:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Add a null pointer check
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>, <jani.nikula@intel.com>
References: <20240325141223.3426250-1-karthik.poosa@intel.com>
 <20240325175829.GZ718896@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20240325175829.GZ718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:4:91::13) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CY8PR11MB7339:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRzNn78DRsGc5+SUvU5zbmlUmMe5ceM8UNY8mqujyx43dyINp/8epU1FxJU9LKs/E4gOsZB2DNFyYoTNw1hI5Npdx9vK2Ra33FJRrksgwMXoF1tjVvr67dHLzbeKimGomfBzVTEKjaGV+KYlaCHUxwW927CA1/lgTAGzFGUzbZ78YYdjZ1+iIiNPGFxEKZJGF6KyFWLlkY2YntwHtWfyJFr1iKlTTF4tGr5R2RRd3QlYXzkfZOYkDtnRMIVn+DbNPvSf1YHtRWNKI8vmxDGe+dHrXbo8XwjO4yOcZccdc6luyKvm0NkSiZ002OUXRDD7STGJ+3BvNwH9sWQBRHoaPfsCCGK8CfqntvOcmasl2SHMTQ9G/K4euHQpBy17ey7wCGaDyx5VWXQwzwQKseHYyaBF0XfczcFCf1L+MC4e8TE0kKM9whXm3RhWXC5ueS3heKlPQezbB/FoiwygilSqWc10qh9JljsVE5U0RYP4YHCRF7VjbI2F86Ka1jf8g4v5XMhwnI+xywRjlHok9J9atAnuqVYbcaF8XX5xP9llnVq3GLfyz3iNybt91uGb+KRyBHviqKU7LI7ity53q7RJjRrz+CrqfKXqVxuxeIbuf98yUj5uHr3I3/8Npt0kHpGt1y6/MHi6usCG/N2TcOyBpqaclG6+w6L1q7YZVz4O0Nc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnREVWNpUGt6bG1NL2g5Rjc0Q0ltQ1dsVjFndmJwejJiaDRmMDZYVVg2WkpK?=
 =?utf-8?B?bDUwNm9KcUx5T1hBcEpEVHZFQk9BalU3WGlvM0hqSE0vajl1ejAyVm1lMU5v?=
 =?utf-8?B?QVNyZC9oRDdzaW1xa3dQQmtkcklVMmFIQjltQVJRV2c4NmgrM3hwYTlhQ2Nh?=
 =?utf-8?B?bWNvOU5JM09xUnJ0K3h4Rll0enoxVGdKUnF1cUFRcE5jcWh0elFTSS83NUY2?=
 =?utf-8?B?cUNvMUw1RmFPb1NtdW9pL09QQ1ZwSUhFNlJlYkEzN1JxL1pxK2xhVWk1Uk83?=
 =?utf-8?B?eTNQL0hxaDBzdlVDQUFVeEZUZFY0VWg4WTFNVFo4U0U4K2xIMDMzb0NSbVgw?=
 =?utf-8?B?ZnNNNCtmSjVhZ0JBS1hKS1dOTWhRMUg1VFYwZFhQZE9FR00wKzZGWHhVajcv?=
 =?utf-8?B?OVh4dkRwMy9RQTBsSVlHWWQzSlh0MitNYUUwenJsTUJGczF1NXVQdHc5amNp?=
 =?utf-8?B?V29FS3d4NnlrVzNuM1FrNGtzL3BFa2lMbm9xMm5hK2xlSlJsUWpBazRRRzk5?=
 =?utf-8?B?enAwa2pMdTByRXBTRjJ5TnI3Wm94UXcvcUFnNnl1bnJGUGJMV1gxbkFYNmJv?=
 =?utf-8?B?ME9oK3dDYUdiZU1mWG1ZREk0cENOTTVDV1ROL2NjT3FWUmVYYmU0NTdFMFhi?=
 =?utf-8?B?ckxGRUhpS2VPa0gyUUVjNmVNaVRvYVNhVmhRaG00bldkcVBmZ054cDZ6Umdm?=
 =?utf-8?B?T2l4QzFzQkgrVFdIMGlBa284Rmp6ZnpkSjFlTERWL08rSk5UMCtyUCt3K0Nl?=
 =?utf-8?B?RjZpd1JZNm9Qb0lubFNiV0Yyc3JPZ2wwdGZWdXhzZUhKMGlCckdzNzdMSlVm?=
 =?utf-8?B?T2FPbDd6RnR2NGJNVUo4RHJQN1NCbXJsWTIwNjZZOUlDa3BkZ1NvNm82VWI1?=
 =?utf-8?B?VU9DNjNOVnJEaGMzYytUM1ZmMGwzL0U1RE85WlRTS2xOdldLd3BhUDdQZTli?=
 =?utf-8?B?c1BBRWFOZTZidXQwdGVTMkRuNFVtTXp4Wm5GSGphcmtyZWlzZDY3NEV3MjYr?=
 =?utf-8?B?TEN4bjJhaXlYY1VUd281MGJpMldOVm9zakZ6WGlJRVZZWE1KRHNyWWtlcnYw?=
 =?utf-8?B?cWtCQkxoV0R3VFJ1N09rM1ZtckRXOGpiWkczaWt6VTZXcmlGeStOK2p6MmI5?=
 =?utf-8?B?L1JFWGpybC92S0UwZGhtNy9haG9vU3loMm5vWC9pZjV4cDNpK3RCY1p4WTZV?=
 =?utf-8?B?bDJySzB2UGIrTVRqVm5FVzN2UUpLcExoMHVBSEtGWFVDejVaKzMwR0FwTThS?=
 =?utf-8?B?aWJhajBXZ1QwMFNDRkdkR1gwa1Y3Sm03TjNRb041bDFhUFN2ZzFiWi81cXhC?=
 =?utf-8?B?aUhpOFN6cU9iQVJ6Z25SVzZLKzl3a0laS3o3OWVlWlVCUkhQM0p4Vll3aGZy?=
 =?utf-8?B?RXhEZ1RDd2kwQXRHR3laS2RxTUFDdWxMQWVaZGNhMXcxRGEyL3NEdm5qSnNx?=
 =?utf-8?B?MzRQZXJNOXpDYXpVREpHOHI2M29mYkcxNWczOVdPYjZaRUwwUzF5ZVdGRnJK?=
 =?utf-8?B?RjdjZmpidEF6eUROc3hpVWpxSXc5VVo2VUUxR1lEMlMyMzNYSkxwT2s3ZXMw?=
 =?utf-8?B?dlFMbXR5WnFLTEdoYXRFM0szTU1pOEFqUEZyTjY0ZmkvR3ZadHVTRmRHcUJ6?=
 =?utf-8?B?eUhVRjNJVVhoNWs5aThvMHlzMHovNlFDalU0RGJkZW1yalV5ZU5vZGZMSXU2?=
 =?utf-8?B?OFZ1MENPZjlrY0ZxRjhuRlE3ZHRnTEp1NmM2bXNyaUxjNnlUazBybEhwdjFu?=
 =?utf-8?B?UWlHKzVvYUc1QTV6QlRzYjcrOGtMNVdGUWRDRE91eHBOWjh6SDZQNkdRaXlJ?=
 =?utf-8?B?QkZnSk14VFdKcVRpZWdBeFdDdVEzbzl4MDg4ZFNNTXFPOXhEditZbDRlMTAx?=
 =?utf-8?B?R2YwaVlRRHk5Q1lHM3BLNG5pV2E1SjFwMlFGSmxEdXBCajBSa2IzUW5kc3Rl?=
 =?utf-8?B?RUJmVDBrclFiYk03UWVDd0psODhRNjVBdFcyRG1zN3pTWDNvczNoMFJEbGJT?=
 =?utf-8?B?ZHcweXVJbG91ejIwK2U1MlAwWTNFbEZxMG5rQWs4cW12N283UHBCbzgvWGFv?=
 =?utf-8?B?NDZPYW1BbTBQZi9RaDRwaE1XcGc1ZlM1ZWViOFovOUNObXBNL29VWU5uWlQ5?=
 =?utf-8?B?UW5WSWRNY2t5UUhTeGQ2eE0wN1RwNDlROTlTQnVFSUh3aTZnbjVYcHNVd284?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d549a11-d459-4ca4-3548-08dc4da8ac6f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 15:23:22.6385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5VbyPUQ7R/Pj9OHWZ8htsG1S/jW/dEkAN/cni8pYkMdNGYFnxmjm1fXcgOuf9CbJ05cJYZ/HlCxGdb2BTWe7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
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


On 25-03-2024 23:28, Matt Roper wrote:
> On Mon, Mar 25, 2024 at 07:42:23PM +0530, Karthik Poosa wrote:
>> Add a missing null pointer check.
> You have so many versions of this patch that I've lost track of which is
> which, but as I commented on an earlier version, this whole patch seems
> unnecessary.  All Intel devices will have at least one GT, and we can
> never "resume from runtime PM" before those GT(s) get initialized.  So a
> NULL return here is impossible.  If you want to be paranoid, you can add
> an assert to make that invariant clear and it will get compiled out of
> production releases.
>
>
> Matt
Unfortunately, I missed your comment on earlier version (v2). Will drop 
this patch.
>
>> v2: Release resources before returning error. (Riana)
>>
>> v3: Update commit message. (Badal)
>>
>> v4: Change drm_err to XE_WARN_ON. (Anshuman)
>>
>> v5: Fix XE_WARN_ON check. (Riana)
>>
>> v6: Update commit message. (Jani)
>>
>> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index cc650a92c2fc..f6837bd6f9a3 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	 * really lost power. Detecting primary Gt power is sufficient.
>>   	 */
>>   	gt = xe_device_get_gt(xe, 0);
>> +	if (XE_WARN_ON(!gt)) {
>> +		err = -ENXIO;
>> +		goto out;
>> +	}
>> +
>>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>>   
>>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>> -- 
>> 2.25.1
>>
