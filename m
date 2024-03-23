Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D00C54E58
	for <intel-xe@archiver.kernel.org>; Sat, 23 Mar 2024 04:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBF910E6AF;
	Sat, 23 Mar 2024 04:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHe9WfDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0F010E6AF
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Mar 2024 04:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711167764; x=1742703764;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zImZXeunzs/JLZQyrWwGG14jgu38qASGjtrvatR6v4o=;
 b=dHe9WfDtpvKDNozCAsv/T7Tori7x4WLQE7AxTD7Hb1szdPSLOU2kgeUj
 I1TJVwQB2UcdIJKU5ztv6MH0pgyy6c3ul7V82tuiSMTt/+jdbbt/3cCyW
 Hf/YcMbaIaLB2pxbjGpCyDmyujmfdY2yRxgQDOph1npF1EkRlcyDaE1o2
 wpqRw1QSqh/PcU2QZugtt88QniLO65ytex51xrI4nwLaiWyPzwJlFfMLF
 a4+UBLDIq09Q7pz60IYC1OoLVLoPZXKBBLVvsG+QgNu1d7RMS/QVHp0qH
 XvRI8AHu91UctYZ92i56QI7XfzwgfcLOtiyC1Q4fWhI6O1cEC4pY/Mb/m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="16864994"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; d="scan'208";a="16864994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 21:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; d="scan'208";a="19658962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 21:22:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 21:22:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 21:22:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 21:22:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDXmWQBZUpHf6Wr8D+txRrh0l6gUkk+Bn+zDpYckXv2hJHKf/V9SrRVmsgAOO567Ybh/7rrdfg8HBae3OPQLmW/dza1AG2nun36NQcwpSwRNJPMToF8Dg5oSow5BzBKOTXAIQOrqsPmcA2s/j0eBEqqwsEHpLH3Pna2jRBjJrsXVHv+fJI8wZaix31Qw4JBlwLDtHSmSCMXN5R36qwYOm5YhNQDn3ru11tc8Hwueu6OsMnwCyzeP5jSq1uTTmhCcFQwigQA5oEuhFm4GeH1jraPfCTZiCp434IlEzNR/onNKz58z7YXGGU9vc31UOV66Ic4n6mbCMt5F3cm7CvAyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TN3AtKgpE3ktjJQfZpRXszkVbp7Y830zqLgiy49nwc8=;
 b=atReEVuFRGGuY+lC39J/PgB/w1dtYToMcUSumMEQxrUzItuelCyofHo0AAy0BNbrzpbXBTqte0aYOfMzYyAD9nmQot7XGPYNzPGrj515GYTiyQHB+u3ZgApz2Fow6Dl4HNdx91hB2AeV2v0aS24GZ1TR664ym11keTdV+mMGzqSVeZx2Z8uR30dljtDTawa0rfcjBhr3UQGpUNw7g5DBT8ExRbwcWLnk9fiPpePnesotMEtkiWbjlrx7nPoVexRNgMY1Jjkpm0kZTzX1q0x0XSwD7LjY6EBvYPcErlkpFP2dJc2RHdwWDGaZWGOJBfCeJlNZH+qLvE2EBfzTGyTPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB6740.namprd11.prod.outlook.com (2603:10b6:303:209::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Sat, 23 Mar
 2024 04:22:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7409.026; Sat, 23 Mar 2024
 04:22:41 +0000
Message-ID: <5e9b7b83-58ef-4d8c-90c4-6e1678d94e22@intel.com>
Date: Sat, 23 Mar 2024 09:52:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Add infra to support card power and energy
 attributes
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <ashutosh.dixit@intel.com>
References: <20240322192836.2600861-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240322192836.2600861-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c318c7-2c37-48c0-e50d-08dc4af0e0f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jAzFRfR5BDVOreVcWe56Kf29NDvq+4OYz+6mEoIjjf5NLVVg7BwR77JvlqJhP3MxuBqOcCjVmTiO/Xp8U30gS0JvXVyVs4jBo/HO3pzXQl6d5Z3FmGtjAotESJngI95rAJkQTn5oXzGW4EAaKR4Bt/DT4lewblDYXPcDXBHySbRn9gvfceFU29OwXxopwUHXQ443ITlyvNJN3iOlbfTx6Ro8LzblDrAWySY1xQzR1rDmyjUc1YtehWlFKcOr5kQmp+LCbZwZ4zguJ+D8Ud/hkaVCYj7Vm/t8odLPcjvfTm8kPowPypcsQQmWMFsNJxXH6BxZWp36XuFGhB1BKTOJt833dIV/deHYf+Jj9eQoU62z9KjMOP5qmEPD0m++l/uGwuw30DYyIAB/KfaGeO4ZGwt3MyHHC/sluht5maOKfv6eg16iDPQ3gKYBOkluuBhFZumU/e2WrrqSTKD2zXWdsU8n66BgQPqjq950W1c60kIB9+HIj/psPqsLsNJOCWKuHscIvFgsPGbStIIYw+9ixFCFh7hugBVLvw/OuyZPEKFkORst1hzOzcd9n02cml5/OPWPduap8PfqhcD69qBpgihhZAL46KOqkqtRiI1v9ReyGUoC2uxBPXlCGtcdYkEipIUY5EUKtAwQepg6RltkIzwoYlC7MLicc+idlHihYdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDJsM2VGK1FxYXVoQjd4U1JkM0FRQ3NHdWtJVm9OaGZUQ2FkazBJVkRDR2Fm?=
 =?utf-8?B?VW5BdUZCZFdqYTBsTW5qeGpFVXlwU1NDRDAwSVptNGk4Z2RjVXM3TDcwY1h4?=
 =?utf-8?B?ajRQSEpjSlVYcGVYSWZSTUJxVUkrOUxsTDBnOTNwTGtwMVJzME5QcDlUZHM2?=
 =?utf-8?B?WkZHZTJHa0tpZkkzbmJYdmdoaWJ1MDhRSXlDbUNGb3haNEN6V2lsZldWaUVQ?=
 =?utf-8?B?MVg4aUZYdE1UYm05M1hRS3RjaFh6V2lCSnZXN2p2T1ZaRERLa2ZGQjRxcHI5?=
 =?utf-8?B?Q0JzLzI4N0d5V21LSkZNMkZodGhsWFhMSVg1Vm90L0xqdzJUaHJXQUtNQlNC?=
 =?utf-8?B?RktHV0JFeFgzRVRCTzVick9lUXA4RGhUWDhoeWlOd1JWUDJJNlpXM1R6c3lJ?=
 =?utf-8?B?MWhVd2hvWm5Jcy9SaG0zRDRNSisrY0pPZUs1NmlPRExrQVI4WVRhTFhnUU5o?=
 =?utf-8?B?Tm5NSisxU0QzM0VvRmJSMVNrdmNyMlpPYUlZY1ZSZmRqL2RsZ25DT0hVTDNj?=
 =?utf-8?B?ZGsyd3lrai9tZUgrUno1djU4VloxaG1KeC9kQit0UmNhdUcvZUF5YTBnZVVo?=
 =?utf-8?B?aGtEMmsxZE90REVqZFFFWjM2a0hjbDlZRnkvNmRMZFZrdmI1VVI4V29rVkl2?=
 =?utf-8?B?dVFSU0VvaHppcUgyYmMrZ0p1c1NmVEVMc05iMVlOamtNMTVINkFWN3BXSWY3?=
 =?utf-8?B?NHJma09jZFg4UzZ1QlRSc2IrL2VPMER3OUFNYjdsZXRJbS8walZtVzFyd1JX?=
 =?utf-8?B?ZzRJYUJ6ZVR1M1FoaHBPSzRMV0g2eS9XSWdvd2RXdEJOTWpjRWUrSkdGWXB1?=
 =?utf-8?B?UlVtdlB2Z0JRdUlwODdBaE5aZFRHaTR3bVZ1RzFVU3ZMZlppUGp6a0VTVTVT?=
 =?utf-8?B?UC9hMzN1ckNYbjhFaTl6RDlBaHh4bWx2d0tDTUlGVTQwZURsa0ZZTHZiZSt6?=
 =?utf-8?B?YVp6Rnd0VTRDU1gvaGswYit3Vlc1TWo0M2xhTmNUa2VvQkNOZ0xUSDduREgy?=
 =?utf-8?B?TWtZYVFYcFMwVE9EbTZ5TXJEeXl3K2xOOFRIQWZ2UWcwb0hVU3BQYU5uTnVY?=
 =?utf-8?B?TGRRays3NndETHk2VFpzR2pZdVRtM1N3TGxHUlJOQzhHbzZkb2QrUkFoZUhv?=
 =?utf-8?B?Z2FIa1M3aC95NzYzdkR6bjFaSmgwQzVqdXR6dGl1RHhYWkJWMTJzdllGdnVk?=
 =?utf-8?B?L3JZWjdxa0IwVnI4anlobDlramlyOGl1bUk1MHNMTG9CVy92N3NyekJ4eWQ5?=
 =?utf-8?B?VjBWNnF6Q2l6azdhdzZtQXpMTng2dG1IMlY0SUxRaTZRcDRJc01JM3pGYmVV?=
 =?utf-8?B?RTZmVlRvNWFTeTc4dEh6anN4Y09IbTlBZGlRSk5pQ1QzVGp1QURFTDRYa0dC?=
 =?utf-8?B?ME15dDlwYlBRL3lLYldkRC9Fejg3NFV2bWt2SVNuZGFJaUNwbkRwK0poWS9N?=
 =?utf-8?B?c3pEUGxNUm9GWmlUa1RhNS96NlNyQTZCL1hGZlloZEZ0S2pmQ2dQMlliSVU2?=
 =?utf-8?B?SWhJZmc3QU1CRXpudHp0SUxjNnE5ZnVCeEFUb1I1Z2IvY2oySXRsQ1NNRXRZ?=
 =?utf-8?B?emQrR2NxZjFGS0R0aDVZVGlRVUlidXIzMmtLUzVHWm15RHJYUCtPQzZ2ZFNx?=
 =?utf-8?B?RTBXcFNsYm9Vb0lLQllqUkVjMkI1V3RBQ0tCTkVXcHA0aFhZbExjZms4ZTh3?=
 =?utf-8?B?cVNJM1REUmljSnVUdE4xb0w1c1BtNFBOc3RTYTk1UkFCbFF3bTgyREhaTHBW?=
 =?utf-8?B?U2VtbklKNkJsK2x0TUpmRTk3SGplRlozQzZlR2FuQnJQdGJkTWR6WW5zWGlm?=
 =?utf-8?B?cWZQUDhJb0l4alB0d1JZTGlCT0w1eUVGQmZXRyt4UmE1V1dLbXdNMDNBZmhI?=
 =?utf-8?B?OTBzYjB3K2Vyb0F3NDR3Y0I0bWIzNVNjTFFCLzN5ZTNNaWEvbGhOWlZBc3NG?=
 =?utf-8?B?QjJ6a0NWaXhtU1RXck5Fa2w0dStVZXlITmRvb1g4Q2Eyak4yVzgyMFZTQnUw?=
 =?utf-8?B?MFJSZElKL0g3S0N4ZkFobW1oN1BXRjNJYWd1b1BZOFVQWDZMNlJ5Q21HK2hu?=
 =?utf-8?B?S2h3MEo1SGZHd0p2dTBXK3dZNmpTbEtaakFpNWZhNzlQUEU0dDdSNFFZUGxI?=
 =?utf-8?Q?E0aIWqvkPdZ6eOuuk8448Svc+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c318c7-2c37-48c0-e50d-08dc4af0e0f8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2024 04:22:41.0622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CokaRsN+bwnPlZeUoA8WG/UBgg8pbOB1iOldmt/j4lWJWGTtWvoh2azc1Auv6ewA8zjZJTr4NDtToOzQ7/jcdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6740
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



On 23-03-2024 00:58, Karthik Poosa wrote:
> Add infra to support card power and energy attributes through channel 0.
> Package attributes will be now exposed through channel 1 rather than
> channel 0 as shown below.
> 
> Channel 0 i.e power1/energy1_xxx used for card and
> channel 1 i.e power2/energy2_xxx used for package power,energy attributes.
> 
> power1/curr1_crit and in0_input are moved to channel 1, i.e.
> power2/curr2_crit and in1_input as there available for package only.
> 
> This would be needed for future platforms where they might be
> separate registers for package and card power and energy.
> 
> Each discrete GPU supported by xe driver, would have a directory in
> /sys/class/hwmon/ with multiple channels under it.
> Each channel would have attributes for power, energy etc.
> 
> Ex: /sys/class/hwmon/hwmon2/power1_max
>                             /power1_label
>                             /energy1_input
>                             /energy1_label
> 
> Attributes will have a label to get more description of it.
> Labelling is as below.
> 		power1_label/energy1_label - "card",
> 		power2_label/energy2_label - "pkg".
> 
> v2: Updated intel-xe-hwmon documentation as per above changes and review
> comments (Riana, Badal).
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  82 +++++--
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 230 +++++++++++-------
>   2 files changed, 200 insertions(+), 112 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 023fd82de3f7..2f8279b2ad1a 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -20,51 +20,91 @@ Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_crit
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy1_input
>   Date:		September 2023
>   KernelVersion:	6.5
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RW. Card reactive critical (I1) power limit in microwatts.
> +Description:	RO. Card energy input of device in microjoules.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max_interval
> +Date:		October 2023
> +KernelVersion:	6.6
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_max
> +Date:		February 2024
> +KernelVersion:	6.8
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Package reactive sustained  (PL1) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit. A read value of 0 means that the PL1
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 and <= TDP will enable the power limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_rated_max
> +Date:		February 2024
> +KernelVersion:	6.8
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RO. Package default power limit (default TDP setting).
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_crit
> +Date:		February 2024
> +KernelVersion:	6.8
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Package reactive critical (I1) power limit in microwatts.
>   
> -		Card reactive critical (I1) power limit in microwatts is exposed
> +		Package reactive critical (I1) power limit in microwatts is exposed
>   		for client products. The power controller will throttle the
>   		operating frequency if the power averaged over a window exceeds
>   		this limit.
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr1_crit
> -Date:		September 2023
> -KernelVersion:	6.5
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr2_crit
> +Date:		February 2024
> +KernelVersion:	6.8
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RW. Card reactive critical (I1) power limit in milliamperes.
> +Description:	RW. Package reactive critical (I1) power limit in milliamperes.
>   
> -		Card reactive critical (I1) power limit in milliamperes is
> +		Package reactive critical (I1) power limit in milliamperes is
>   		exposed for server products. The power controller will throttle
>   		the operating frequency if the power averaged over a window
>   		exceeds this limit.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/in0_input
> -Date:		September 2023
> -KernelVersion:	6.5
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy2_input
> +Date:		February 2024
> +KernelVersion:	6.8
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RO. Current Voltage in millivolt.
> +Description:	RO. Package energy input of device in microjoules.
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/energy1_input
> -Date:		September 2023
> -KernelVersion:	6.5
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_max_interval
> +Date:		February 2024
> +KernelVersion:	6.8
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RO. Energy input of device in microjoules.
> +Description:	RW. Package sustained power limit interval (Tau in PL1/Tau) in
> +		milliseconds over which sustained power is averaged.
>   
>   		Only supported for particular Intel xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_max_interval
> -Date:		October 2023
> -KernelVersion:	6.6
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/in1_input
> +Date:		February 2024
> +KernelVersion:	6.8
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
> -		milliseconds over which sustained power is averaged.
> +Description:	RO. Package current voltage in millivolt.
>   
>   		Only supported for particular Intel xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index a256af8c2012..8f5dd77d2b8e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -34,6 +34,12 @@ enum xe_hwmon_reg_operation {
>   	REG_READ64,
>   };
>   
> +enum xe_hwmon_channel {
> +	CHANNEL_CARD,
> +	CHANNEL_PKG,
> +	CHANNEL_MAX,
> +};
> +
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    */
> @@ -69,26 +75,26 @@ struct xe_hwmon {
>   	int scl_shift_energy;
>   	/** @scl_shift_time: pkg time unit */
>   	int scl_shift_time;
> -	/** @ei: Energy info for energy1_input */
> -	struct xe_hwmon_energy_info ei;
> +	/** @ei: Energy info for energyN_input */
> +	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>   };
>   
> -static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
> +static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, int channel)
>   {
>   	struct xe_device *xe = gt_to_xe(hwmon->gt);
>   	struct xe_reg reg = XE_REG(0);
>   
>   	switch (hwmon_reg) {
>   	case REG_PKG_RAPL_LIMIT:
> -		if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
> -		else if (xe->info.platform == XE_DG2)
> +		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>   		break;
>   	case REG_PKG_POWER_SKU:
> -		if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			reg = PVC_GT0_PACKAGE_POWER_SKU;
> -		else if (xe->info.platform == XE_DG2)
> +		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			reg = PCU_CR_PACKAGE_POWER_SKU;
>   		break;
>   	case REG_PKG_POWER_SKU_UNIT:
> @@ -98,13 +104,13 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>   		break;
>   	case REG_GT_PERF_STATUS:
> -		if (xe->info.platform == XE_DG2)
> +		if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
>   			reg = GT_PERF_STATUS;
>   		break;
>   	case REG_PKG_ENERGY_STATUS:
> -		if (xe->info.platform == XE_PVC)
> +		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>   			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> -		else if (xe->info.platform == XE_DG2)
> +		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>   			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>   		break;
>   	default:
> @@ -117,11 +123,11 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
>   
>   static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>   				 enum xe_hwmon_reg_operation operation, u64 *value,
> -				 u32 clr, u32 set)
> +				 u32 clr, u32 set, int channel)
>   {
>   	struct xe_reg reg;
>   
> -	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg);
> +	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>   
>   	if (!reg.raw)
>   		return;
> @@ -151,13 +157,13 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
>    * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>    * clamped values when read.
>    */
> -static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
>   {
> -	u64 reg_val, min, max;
> +	u64 reg_val = 0, min, max;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0, channel);
>   	/* Check if PL1 limit is disabled */
>   	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>   		*value = PL1_DISABLE;
> @@ -167,7 +173,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>   	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ64, &reg_val, 0, 0, channel);
>   	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>   	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>   	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
> @@ -179,19 +185,19 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
>   	mutex_unlock(&hwmon->hwmon_lock);
>   }
>   
> -static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long value)
>   {
>   	int ret = 0;
> -	u64 reg_val;
> +	u64 reg_val = 0;
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>   	if (value == PL1_DISABLE) {
>   		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
> -				     PKG_PWR_LIM_1_EN, 0);
> +				     PKG_PWR_LIM_1_EN, 0, channel);
>   		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
> -				     PKG_PWR_LIM_1_EN, 0);
> +				     PKG_PWR_LIM_1_EN, 0, channel);
>   
>   		if (reg_val & PKG_PWR_LIM_1_EN) {
>   			ret = -EOPNOTSUPP;
> @@ -204,17 +210,17 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
>   	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
> -			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
> +			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val, channel);
>   unlock:
>   	mutex_unlock(&hwmon->hwmon_lock);
>   	return ret;
>   }
>   
> -static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
>   {
> -	u64 reg_val;
> +	u64 reg_val = 0;
>   
> -	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0);
> +	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0, channel);
>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>   }
> @@ -237,16 +243,16 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
>    * the hwmon API. Using x86_64 128 bit arithmetic (see mul_u64_u32_shr()),
>    * a 'long' of 63 bits, SF_ENERGY of 1e6 (~20 bits) and
>    * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
> - * energy1_input overflows. This at 1000 W is an overflow duration of 278 years.
> + * energyN_input overflows. This at 1000 W is an overflow duration of 278 years.
>    */
>   static void
> -xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
> +xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>   {
> -	struct xe_hwmon_energy_info *ei = &hwmon->ei;
> -	u64 reg_val;
> +	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
> +	u64 reg_val = 0;
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
> -			     &reg_val, 0, 0);
> +			     &reg_val, 0, 0, channel);
>   
>   	if (reg_val >= ei->reg_val_prev)
>   		ei->accum_energy += reg_val - ei->reg_val_prev;
> @@ -260,19 +266,20 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
>   }
>   
>   static ssize_t
> -xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
> -				  char *buf)
> +xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *attr,
> +				 char *buf)
>   {
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> -	u32 x, y, x_w = 2; /* 2 bits */
> -	u64 r, tau4, out;
> +	u32 x = 0, y = 0, x_w = 2; /* 2 bits */
> +	u64 r = 0, tau4, out;
> +	int sensor_index = to_sensor_dev_attr(attr)->index;
>   
>   	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>   
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
> -			     REG_READ32, &r, 0, 0);
> +			     REG_READ32, &r, 0, 0, sensor_index);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -291,7 +298,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
>   	 * As y can be < 2, we compute tau4 = (4 | x) << y
>   	 * and then add 2 when doing the final right shift to account for units
>   	 */
> -	tau4 = ((1 << x_w) | x) << y;
> +	tau4 = (u64)((1 << x_w) | x) << y;
>   
>   	/* val in hwmon interface units (millisec) */
>   	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
> @@ -300,14 +307,15 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
>   }
>   
>   static ssize_t
> -xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *attr,
> -				   const char *buf, size_t count)
> +xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *attr,
> +				  const char *buf, size_t count)
>   {
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>   	u32 x, y, rxy, x_w = 2; /* 2 bits */
>   	u64 tau4, r, max_win;
>   	unsigned long val;
>   	int ret;
> +	int sensor_index = to_sensor_dev_attr(attr)->index;
>   
>   	ret = kstrtoul(buf, 0, &val);
>   	if (ret)
> @@ -326,12 +334,12 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
>   
>   	/*
>   	 * val must be < max in hwmon interface units. The steps below are
> -	 * explained in xe_hwmon_power1_max_interval_show()
> +	 * explained in xe_hwmon_power_max_interval_show()
>   	 */
>   	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
>   	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
>   	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
> -	tau4 = ((1 << x_w) | x) << y;
> +	tau4 = (u64)((1 << x_w) | x) << y;
>   	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>   
>   	if (val > max_win)
> @@ -360,7 +368,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
>   	mutex_lock(&hwmon->hwmon_lock);
>   
>   	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
> -			     PKG_PWR_LIM_1_TIME, rxy);
> +			     PKG_PWR_LIM_1_TIME, rxy, sensor_index);
>   
>   	mutex_unlock(&hwmon->hwmon_lock);
>   
> @@ -370,11 +378,16 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
>   }
>   
>   static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> -			  xe_hwmon_power1_max_interval_show,
> -			  xe_hwmon_power1_max_interval_store, 0);
> +			  xe_hwmon_power_max_interval_show,
> +			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
> +
> +static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
> +			  xe_hwmon_power_max_interval_show,
> +			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
>   
>   static struct attribute *hwmon_attributes[] = {
>   	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	&sensor_dev_attr_power2_max_interval.dev_attr.attr,
>   	NULL
>   };
>   
> @@ -387,8 +400,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>   
>   	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>   
> -	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> -		ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? attr->mode : 0;
> +	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? attr->mode : 0;
>   
>   	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
>   
> @@ -406,10 +418,11 @@ static const struct attribute_group *hwmon_groups[] = {
>   };
>   
>   static const struct hwmon_channel_info * const hwmon_info[] = {
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> -	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
> -	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> -	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>   	NULL
>   };
>   
> @@ -432,7 +445,8 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
>   			      uval);
>   }
>   
> -static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u32 scale_factor)
> +static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
> +					 long *value, u32 scale_factor)
>   {
>   	int ret;
>   	u32 uval;
> @@ -450,7 +464,8 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u3
>   	return ret;
>   }
>   
> -static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u32 scale_factor)
> +static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
> +					  long value, u32 scale_factor)
>   {
>   	int ret;
>   	u32 uval;
> @@ -464,117 +479,127 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u3
>   	return ret;
>   }
>   
> -static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
> +static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *value)
>   {
> -	u64 reg_val;
> +	u64 reg_val = 0;
>   
>   	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
> -			     REG_READ32, &reg_val, 0, 0);
> +			     REG_READ32, &reg_val, 0, 0, channel);
>   	/* HW register value in units of 2.5 millivolt */
>   	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>   }
>   
>   static umode_t
> -xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
> +xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_power_max:
> -		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? 0664 : 0;
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
>   	case hwmon_power_rated_max:
> -		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU) ? 0444 : 0;
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
>   	case hwmon_power_crit:
> -		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> -			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +		if (channel == CHANNEL_PKG)
> +			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> +				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +		break;
> +	case hwmon_power_label:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> +	return 0;
>   }
>   
>   static int
> -xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
> +xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_power_max:
> -		xe_hwmon_power_max_read(hwmon, val);
> +		xe_hwmon_power_max_read(hwmon, channel, val);
>   		return 0;
>   	case hwmon_power_rated_max:
> -		xe_hwmon_power_rated_max_read(hwmon, val);
> +		xe_hwmon_power_rated_max_read(hwmon, channel, val);
>   		return 0;
>   	case hwmon_power_crit:
> -		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_POWER);
> +		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
>   static int
> -xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
> +xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
>   	switch (attr) {
>   	case hwmon_power_max:
> -		return xe_hwmon_power_max_write(hwmon, val);
> +		return xe_hwmon_power_max_write(hwmon, channel, val);
>   	case hwmon_power_crit:
> -		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_POWER);
> +		return xe_hwmon_power_curr_crit_write(hwmon, channel, val, SF_POWER);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
>   static umode_t
> -xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr)
> +xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	u32 uval;
>   
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> -			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +	case hwmon_curr_label:
> +		if (channel == CHANNEL_PKG)
> +			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> +				(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> +		break;
>   	default:
>   		return 0;
>   	}
> +	return 0;
>   }
>   
>   static int
> -xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_CURR);
> +		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_CURR);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
>   static int
> -xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
> +xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>   {
>   	switch (attr) {
>   	case hwmon_curr_crit:
> -		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_CURR);
> +		return xe_hwmon_power_curr_crit_write(hwmon, channel, val, SF_CURR);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
>   static umode_t
> -xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr)
> +xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	switch (attr) {
>   	case hwmon_in_input:
> -		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS) ? 0444 : 0;
> +	case hwmon_in_label:
> +		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
>   }
>   
>   static int
> -xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_in_input:
> -		xe_hwmon_get_voltage(hwmon, val);
> +		xe_hwmon_get_voltage(hwmon, channel, val);
>   		return 0;
>   	default:
>   		return -EOPNOTSUPP;
> @@ -582,22 +607,23 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, long *val)
>   }
>   
>   static umode_t
> -xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr)
> +xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   {
>   	switch (attr) {
>   	case hwmon_energy_input:
> -		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 0444 : 0;
> +	case hwmon_energy_label:
> +		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel) ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
>   }
>   
>   static int
> -xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, long *val)
> +xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   {
>   	switch (attr) {
>   	case hwmon_energy_input:
> -		xe_hwmon_energy_get(hwmon, val);
> +		xe_hwmon_energy_get(hwmon, channel, val);
>   		return 0;
>   	default:
>   		return -EOPNOTSUPP;
> @@ -618,13 +644,13 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		ret = xe_hwmon_power_is_visible(hwmon, attr, channel);
>   		break;
>   	case hwmon_curr:
> -		ret = xe_hwmon_curr_is_visible(hwmon, attr);
> +		ret = xe_hwmon_curr_is_visible(hwmon, attr, channel);
>   		break;
>   	case hwmon_in:
> -		ret = xe_hwmon_in_is_visible(hwmon, attr);
> +		ret = xe_hwmon_in_is_visible(hwmon, attr, channel);
>   		break;
>   	case hwmon_energy:
> -		ret = xe_hwmon_energy_is_visible(hwmon, attr);
> +		ret = xe_hwmon_energy_is_visible(hwmon, attr, channel);
>   		break;
>   	default:
>   		ret = 0;
> @@ -650,13 +676,13 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
>   		break;
>   	case hwmon_curr:
> -		ret = xe_hwmon_curr_read(hwmon, attr, val);
> +		ret = xe_hwmon_curr_read(hwmon, attr, channel, val);
>   		break;
>   	case hwmon_in:
> -		ret = xe_hwmon_in_read(hwmon, attr, val);
> +		ret = xe_hwmon_in_read(hwmon, attr, channel, val);
>   		break;
>   	case hwmon_energy:
> -		ret = xe_hwmon_energy_read(hwmon, attr, val);
> +		ret = xe_hwmon_energy_read(hwmon, attr, channel, val);
>   		break;
>   	default:
>   		ret = -EOPNOTSUPP;
> @@ -682,7 +708,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
>   		break;
>   	case hwmon_curr:
> -		ret = xe_hwmon_curr_write(hwmon, attr, val);
> +		ret = xe_hwmon_curr_write(hwmon, attr, channel, val);
>   		break;
>   	default:
>   		ret = -EOPNOTSUPP;
> @@ -694,10 +720,30 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	return ret;
>   }
>   
> +static int xe_hwmon_read_label(struct device *dev,
> +			       enum hwmon_sensor_types type,
> +			       u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_power:
> +	case hwmon_energy:
> +	case hwmon_curr:
> +	case hwmon_in:
> +		if (channel == CHANNEL_CARD)
> +			*str = "card";
> +		else if (channel == CHANNEL_PKG)
> +			*str = "pkg";
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static const struct hwmon_ops hwmon_ops = {
>   	.is_visible = xe_hwmon_is_visible,
>   	.read = xe_hwmon_read,
>   	.write = xe_hwmon_write,
> +	.read_string = xe_hwmon_read_label,
>   };
>   
>   static const struct hwmon_chip_info hwmon_chip_info = {
> @@ -711,14 +757,15 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	struct xe_hwmon *hwmon = xe->hwmon;
>   	long energy;
>   	u64 val_sku_unit = 0;
> +	int channel;
>   
>   	/*
>   	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>   	 * so read it once and store the shift values.
>   	 */
> -	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT)) {
> +	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
>   		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
> -				     REG_READ32, &val_sku_unit, 0, 0);
> +				     REG_READ32, &val_sku_unit, 0, 0, 0);
>   		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>   		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
> @@ -728,8 +775,9 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
>   	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
>   	 * first value of the energy register read
>   	 */
> -	if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, 0))
> -		xe_hwmon_energy_get(hwmon, &energy);
> +	for (channel = 0; channel < CHANNEL_MAX; channel++)
> +		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
> +			xe_hwmon_energy_get(hwmon, channel, &energy);
>   }
>   
>   static void xe_hwmon_mutex_destroy(void *arg)
