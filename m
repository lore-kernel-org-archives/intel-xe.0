Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01B2C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 06:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5461310EEBD;
	Fri, 22 Mar 2024 06:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8dQu23i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AA310EEBD
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 06:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711088441; x=1742624441;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Al5xopNmh3V1iDVGfyIlw13bd09WkLhQSVHxlbX2W+M=;
 b=d8dQu23iOQqS895i1Tg9ZxzMTHA/YXvs4aMLh38oEXRu+TVZUeCwj1ww
 uhc2xn11+lOpa6bVd8i2YjV43lHtndHeQnK66s87gbZ6u+5vqNXkTg8T0
 xCS39PYx4plwS8F0ZBWHvanbBs9bQGNFWd0JKExDpUsVXFyXhPGP4mj0Y
 YSc4X1xdF/C3ku+hmPu897VLz/pqDEHoTX1QuWqlf+xBADe9VLwV/0WcV
 mWauU44wtYM6CO9HqWji719daF4ayg7fAPgr21A4zbXnDkFbGa0vcQMtM
 pph0KH6bTtZU0XVgdY0IHySHqqA8ayIs9H3OfmTjVuNnNnhRcp29fqoFz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5977807"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="5977807"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 23:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="14744049"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 23:20:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 23:20:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 23:20:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 23:20:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 23:20:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNGmzPqXs/xbJZHEDNcVt+eGN3jxsMYKuQ1YdcERhH9uEp0D2c/b+2G6BjGISCyKJXNsSBi3l45vnPACx3KjL6hqn+dExL2Gu/JPmciiTJiuFv2cDxEWNO3yhDJyayG7+K4vsc8wEz3a8QPnf5hljl2l9zJfKtWNzJBJ8tX3j0DdBYciM5GpExhGsiTQZQ9S3jwvu8prJXkmfOrz7BQH8hYfHb2RIuIv15X7g21GY37VDol2Wo4n0TuRxdHKrI/iyW9wXO+jW0Qe+hBbA98nxk+lcoHdaDpKvUiUkkUmXR4Nr+yjaRblFuh3zOw9VnZFvqaCiRoocuwyPMHV4viUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5VwdGxXG7mTGfREwIwXiURuLzIajbQKOMpmyL++1Kk=;
 b=PpapFBf3adzYBcakMaTqvkJAOvafor8nLyub+gbDha8Eyh4nSxnFMsWdc8oo1RqDD1SJTKIFvikL1aNx+bWWqIJdLNmeepjEjFNws4PQbzT29UkNy5nayUmUBRGoGv847jJnXzFpIVLDr0b822GcHQI86ctQSKWxaVUhQN+cXOUuaaXgYG9Y8tEZxpeg4W1NRbU1Mpm9rpQZQTCew0rgS5zwLC0vZgEj73rc76tTGXmN7kBzOLfd/lt+PLnMJ35h7LLQd+tXDuZg2NCy/5Uv6oQ5IGdw0sX8p0WePaOQD+/HIt287s9bxx9zrXpyVsQbytajSse34osirMZIlYEoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB8738.namprd11.prod.outlook.com (2603:10b6:8:192::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.12; Fri, 22 Mar 2024 06:20:38 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::bf36:ca7c:bb6f:68a5%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 06:20:38 +0000
Message-ID: <eb736899-1d8d-4203-b2a1-378d28d950f5@intel.com>
Date: Fri, 22 Mar 2024 11:50:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>
References: <20240321104624.2205317-1-karthik.poosa@intel.com>
 <20240321104624.2205317-2-karthik.poosa@intel.com>
 <CY5PR11MB6211A336A3E832319D7C98B595312@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211A336A3E832319D7C98B595312@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::35) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc04b74-92dc-4d2a-703a-08dc4a3830e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2X5SBbzFh8aj0oIRlV4k6RDyFkQaNyMkcQNMPgyg6R1syOuhydyfyDdCmYRLaO11OqRO/xrgHFCa3oQNvtjHYtQrj3bSJr8dGd9Y896gu4ePNXvQ3j5Pkp6dfq3pNCjhhI2ETGEeim13RbwuKig5o30GHxJv+XG1bFHIwY2frEp9jsX1FMUhli6s22IHRsK5xA/WhTQ/qzfpY2hDbHYVbtWUPuhm+pW6qc9pf+eVD9Qge3d4Nlv8/qzAhXtogUSEDbF8LkJHs7NCesFBugeRRSc477cTqT6iKA0ybmcEAzSd+ZCrlng3/+DZ4XkZ7k/xzRtlKZi85TOYXVlKeVnZTXjlwOYBemLhqeAGeuSVNishUmt/Rhswo7uwEDRGzjXlcmy/Q4NegodSiV9RnrHKTPnjKSP/QIwDeSwkHAJK/9Rtxw2DKlDdmuDSKBiO6pj39um6Q/J3UpHXdJuCVYHS8raV6jCasybIheY8HfRsBL0YSjAA4p7yzxi1xsOVUk24D0D8Jt0iFIE3dcf8gw/Gum7tzCcFGBN1lZdif+LTvhO6blHAXJ1yeKuP1j/3XusK7fBp4wl6R1D72a9S+g7id0thplt+VzxXdBchkIfJ9zvIj3ZDnLz5AxhT1KFBbRX78Zu4ZEZwFs4NHRw5PuRhTizk1aQy+yotj6BMwQCOwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjgxN1V4VEdjVmdLdE9yWDBWdmpISGVBK2lpUVFvQ0I4Z3NYMXkrTlhIMzI0?=
 =?utf-8?B?V0VlcVVTR3pOR0tlUjdnaGdvTEZWRWlXcjFISjExMGxlS0FZZ3o3NWNwK1FI?=
 =?utf-8?B?TWsyQ3pmZm9iRlhNUWFZdXhRYXR3VzREaDJEYUVKNkRXc1V2dWpKTWJack9V?=
 =?utf-8?B?WFZENURvdkFpZmUzcy9MSHZES0FtbXNEZlg4SzdRY01XS0p4YWlOQitNV3dP?=
 =?utf-8?B?cjBORHQ3b3JaSCtCaHJTU0hSOUhPaVI4WUM3bzh6K3dpY2R4VGs3akozdEds?=
 =?utf-8?B?ZllqekJWU0FKVjA3ZmEwblNuZ3ZiQUQ5ODlBSXIwaHFnOWVwYmI3WmF4QzhP?=
 =?utf-8?B?N29uMVZ2QkMrSWNZQk9URTg0Wk1jdk9OaUVvTGIzUytqdkk2Z2wreE1HcTNZ?=
 =?utf-8?B?ODFHdmZDUzRkKy9KaVI4K3BMSXcyazA2ZmxycFlaQW1HNDBwZi92RVZzbjBz?=
 =?utf-8?B?Lzk1cCs0ZEw5amhybUV4UWplL3JYaENzbWZETVU2VDZGb2I1NEt4SitoT1M2?=
 =?utf-8?B?a3ZHeEN6NHgxRjgvNE83VmZuN21LcDlhSE5LUEsyMitncVdONUY0RGFWVFd4?=
 =?utf-8?B?VXdCQ1BEYWcydlhDdkg4bmhJMXRTQ1NJU09lTnF4R0tBYndLZHNIa215VUJL?=
 =?utf-8?B?cmp4TEh0QUVNTDZ4by90dkxYU3BVbjlUaHFLVE53N25KaDlrYWNyWWYybUkr?=
 =?utf-8?B?azdtb2J5UGp0UFF0RDFhZldkU0tNSWYrQm9vRXdUbm80QUNnMEZGM1ByejdR?=
 =?utf-8?B?MWRXSmdZVGRXL2VmOVpGQTBtWWlQOWZ6QUZEK2d4R0dYaTkzNjJiUTFjVWYr?=
 =?utf-8?B?Z0ZoTDhQMTFuMEZXMHVFdFhaTjVlWkNrdjFTOStCd1BEekk2NndmbmxCUzlh?=
 =?utf-8?B?RzFJY3BvM1NSWDdJMGhDKzc5UGdPWmZOTlYvMnQ0TTFTYVFud1BBbGwxTzMy?=
 =?utf-8?B?ckp0VkVrelFDdVN4ZFlLQXhRSUtyVzRWalhRaXNtSXJ2N3V0bkJQR3oybmxp?=
 =?utf-8?B?TnBlNjJ1MVFMRHVOaVJhRExpbjQwZXJDeVlGOEl2MHhTZ0x1OTlrSDJjb1Yz?=
 =?utf-8?B?K001WTFPcVhZOGhGM2hjcFc1WUY4V3krMHpEWWdvL3pUNEs2R01vZHV1Wnp2?=
 =?utf-8?B?V2hVUFhaRTJDUmt2dTl1SjNldlh1UzlvYUlHcVNLV0hXVWcyRnJkZ2xuTHhs?=
 =?utf-8?B?VUt3L2tuY3dDQUVkT0FOVE10a2JhUTkvbkVoanJsWnRrZWNtanhXeWU4dnYy?=
 =?utf-8?B?cnlaMDYzZlBkNGJPc2pLZVg3dEk2MjYzQWJBRTVwNTFjdGJuK1piZi9pLzNE?=
 =?utf-8?B?KzV3RXA0NkQ4d0IxR04rNXhZWXo0eGNNTjgzNlBqMldVc0RDeDREMmhST3Vu?=
 =?utf-8?B?ZHhaTGE0NEVnbVBIV29lYm5lWkFva201SmNtSlhFYVlHb0hhZGFyNktMS1FU?=
 =?utf-8?B?am1abHZnUit3OEFBaEZUMk1JL2lNd2QxV29FNWQ0ZVZJdnU0ZkF0LzFicGlq?=
 =?utf-8?B?NzZ4V0UybWhKQmoxUzUwM3ZOZ2liTm1VdFVsUWxCaWxtYytZMHRGZkkrZ3Yr?=
 =?utf-8?B?eEQyUnhHY09iL0piRkdhOXBDMUJOek0rTW9LN2MxQmsvVmJseG15Ti8wSWJt?=
 =?utf-8?B?Um95RlFsY1daT1RBRDVrSDFidjZxZUlyTE1Vanp6cDlVWVN0eTJwSkQvVGpT?=
 =?utf-8?B?em1rVTcvY3U4cHZBaWVRa1FhSVVVZU5LVDVWQnZzSEhRUGY0cGRPZE84OE41?=
 =?utf-8?B?bWtQbDU1RTNCS0hlUnZ5czRia3ptNUIrRDl4aUE4VUZ0WjdSbkNZQW1BbURZ?=
 =?utf-8?B?ckRGUThxd1U4b1l6RGJuWERhUmxvK1FrV2FiVWJkRE9Rb29MN2wrR1RoMVBJ?=
 =?utf-8?B?QUE2MDh0Mk84MnUxRmFoTEowcHd4a3FHcTJkVDA1MzNXNFZCeGZwOVFXYjc2?=
 =?utf-8?B?aUlxcHpvekpSSWNZN2FxM3IyWlBacE9KZTVWQ0xDbEtPSkd0Uy9IRzFML1lB?=
 =?utf-8?B?cVUyV0dMaXRmUVFaejhVQ2FXS1NDU2I2dDZSYUVPZnNzSXBzWElERlRGZmtO?=
 =?utf-8?B?UXFzazJDQzY4MW5YN3pXQ1NhYm9tYWpsV0ZUZnVYVUhKYWFSSWdGL0pJSUZw?=
 =?utf-8?Q?7p6P41HJ1zGmRPvMV+MwAsdyS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc04b74-92dc-4d2a-703a-08dc4a3830e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 06:20:38.2575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CJTjkWbNduJJ3uHSc9CEbQ2lLKEtbGcykyZIvb24ijtuwcv/nFgShNybvtUn0lU1eOldU5jFsYGp7wV44fLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8738
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

Hi Karthik

On 3/22/2024 11:34 AM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Poosa, Karthik <karthik.poosa@intel.com>
>> Sent: Thursday, March 21, 2024 4:16 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poosa@intel.com>
>> Subject: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
>>
>> Add a NULL pointer check.
>>
>> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
>> cc650a92c2fc..5cb5aef16823 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	 * really lost power. Detecting primary Gt power is sufficient.
>>   	 */
>>   	gt = xe_device_get_gt(xe, 0);
>> +	if (!gt) {
>> +		drm_err(&xe->drm, "xe_gt pointer NULL in xe_device\n");
You can just print "gt is NULL"
>> +		return -ENXIO;
You need to set err and goto out and release the previous resources

Thanks,
Riana
>> +	}
>> +
>>   	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>>
>>   	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>> --
>> 2.25.1
> 
