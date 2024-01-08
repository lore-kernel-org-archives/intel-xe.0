Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17CCC3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 18:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14AB10E2CD;
	Mon,  8 Jan 2024 18:58:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D8310E2CD
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704740301; x=1736276301;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=J5i9v7+8yyB9IBG5nLTIOsHzAnp070aLs2pmdUmlBBM=;
 b=KaDjD0SvMsFk6KeHDT8SH4e8R51RNl+tIcRJs/Pw4dzVO+PAXXJA02cc
 qAhWVG2dgrrx200ZBySeiEzN4Ku6uuIiE9GofSVcCAJWN+t2BDaXA87Uy
 ZCPGEOD7hqzFxaOJiM+L/3fh8Ca6QofKzmptFm+R9LeZ/sfSgoG6gX+3v
 4KW0bc1A9nuxdJou8JAwcfgXZi+L4E2PkBth4XwgsHGB9igg6dWlWROW1
 N2C2Ttfl38aX+LErniTEJMYfYCMAxCsSP7K6u4hNDx3qqnFGcrLKzaeu5
 XgsH/6bSZEcFjVV/M891OkASwbIwJjvWweWmayGHTPbQe2/tQqc3mc2RS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464374304"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
 d="scan'208,217";a="464374304"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 10:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="1028486719"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
 d="scan'208,217";a="1028486719"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 10:58:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 10:58:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 10:58:19 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 10:58:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 10:58:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRh4F5rpICwIFX3vhkbS7yyIgHhH3G6sK+L6uQqCLEB815o5zEzyCsU8WSgpLftKxReYkbtYA43QFUnVzNmxeL4tmzH+FWh/UCwkPxto6YWoHCCFt5eTqDgoLuNxyVtNyIjA8rLMfXDT5cwDwpou1erWSV+IlqP9nxRlKjSpX0ehFj4WYfPn3sXceYU5lHnnMvyYTtYCoUhwfkQCeWjUGutbEDZgzysnkS/NL+NBsjHfOLBgVU/N8+3BZlfRnucnOzGdRnX2ByzuLf0zn89E+919+eyWDbed90dgTxlaIjfRtOgOgbrPZqH0fuEfnOU4hc99meG+Tk+iBugpDtzHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F43c/bXZjC0wJtFwqhmnYdZHIhhfE0XNYCaL00shxbQ=;
 b=Kximv6rm9Uy/TirhebrHmMzhS7wS8FyFRDjuoevVN/WfK0mAZjyUkykd5t1FmFpifpHvL4qSCymrCa9eslkv17VhO0sddkNFkCuxtSRuK/wfvyGu1nsCzNILSAc0h6A8QSNp97V/kGgr9uoC4Qm4V0xQIfBEAv1gUP5UEwUw8+1PdkHUeg3/Uolke0zJg32yB4HnRg7jSn9k5MmCm8Tx13UTk/+tHP2NHEnr5OIShN0nDC9asSKAkcd6Th98r7P6T631KyLnFk+fux7AzZy2JLjO03VYYHdXAKwSF3LMF/MwwWITV9YiypADA+uSEcTLnXNjDwHvArulc2gI7FRaiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 18:58:17 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 18:58:17 +0000
Content-Type: multipart/alternative;
 boundary="------------jr3yiGwuVyKT67HyRJJA6HbV"
Message-ID: <2cd5b758-5c37-4017-9876-a84d2e9ecc97@intel.com>
Date: Mon, 8 Jan 2024 10:58:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/gsc: Initialize GSC proxy
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231212010600.3479465-1-daniele.ceraolospurio@intel.com>
 <20231212010600.3479465-2-daniele.ceraolospurio@intel.com>
 <a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:303:8f::28) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: a277d065-7152-48b0-1427-08dc107bc600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrGn0b6ZxlVAcVUdIwG2BInIgNWQgKm9N5BjrW5mEWAUehtgqyxqo/TbFcIGdg5G4CloGibYBAaREDKxRFrZs1mAl9Ml7ciHQ7ASh7vps9GwHPF/1IdIlNS0SuYyFRgpio4MbzXMKchj7qPDktZy0TEo3XY00fg41ntAvS15AAx1aiA/2Ub/7KcJDRHEwpLSuAHcB4rIOmLI3+8ZaK1VA1BTpPLsPd9dO8xXrwyo4+VKfndedFtWyEP31NykiYrmoNGiWPKMV62GywFm8IlIBGwKiwm2JgHdOVGRnrmbzbB6JD0mqF4lrXDSnj5f3Ms9RYTxMf90VAAmj5/Ha5bUG2saL5wojXEAKnwLwAPRTawiCRTu62Iq9L9INODTPYgKmWKq6etQQBxsjLxfygOjEDjwQM+8Dwn4WqaxA0UQlQyaItcA0e6GvhrNYLB4uGPGM7CpJM5YFQnsTl7l6tXEhflPdo+96AoaTkD0+tC1wRAfhoH94wZw60KZOelQxVZcMCFo1jIfKlb31aXxhmMhHn2sdX94DzWW/RfgjlWZz6fVIZ0o/afsC4VyVgeKJowRey5wRchX4AOhAI1LA4Nzy8zB21qjl4yR70wm4JZJHUO1jaRN0mtiQBG/xQui5ntEy1buB8gRG69Q78aCoSeUSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(41300700001)(53546011)(6666004)(83380400001)(31686004)(33964004)(6506007)(4001150100001)(478600001)(66476007)(66556008)(110136005)(66946007)(316002)(2906002)(38100700002)(107886003)(31696002)(26005)(2616005)(6512007)(82960400001)(86362001)(6486002)(8936002)(30864003)(36756003)(4326008)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEdnQTM4LzhEbTNzVVFpK1NONlpYbjVyWFE3UlhXVUdkMkRaK1F4clhKZzBD?=
 =?utf-8?B?bVl4c1ByMlUxTHRUOVFIaWVQZGZLazY5SHE0TFRiZlhma3gxRlE1b05mcHVV?=
 =?utf-8?B?VDdnc0I5cmtQRHJESG1sYnBOWVZmQXhMK29qZUU1MEFhL0ozczYyL3VPZVFH?=
 =?utf-8?B?akdseThlTkxnd055amVZOGpaTlF5UjFzKy9YaDFnd0sxT3FvcmVkWWYxU0Nm?=
 =?utf-8?B?TEtJejl3N1ozaWNGUmpHbG1hTitCMEtoTnVTMTRMUmMyMFFBWGx2NGxCcWF0?=
 =?utf-8?B?OVowNGhDZHROOHY3MjIxMnE4cWVQZlJsdHFKbDlCUk13Nm5hNFpYbnZCeDBa?=
 =?utf-8?B?RE1wdXlRNnJyUHJUbE80MmhNK2hVOUpmdVJXaUN1eFRqRks3ei9kTVE1d1pn?=
 =?utf-8?B?c0RlcVNhcytDYXYvUkZVSUMvdEN0NDFEbGVwTDlMVXhJWWlZdzMyeVBDdEM5?=
 =?utf-8?B?OEVWL2tJZ1kwaTk2dUtqdTg5VVQxcVZDNHZRV1hpakdMKzQxbU1xZjI4cmpR?=
 =?utf-8?B?aEFueDd5emp5QmRoeDJOczAwMk1IVXhVNloxcmkrdDRzMTFkQmFFYjIzbUZF?=
 =?utf-8?B?NUwwSS9JTUtGby9uTmNZZU1jS3R5MUQ5Z2FrN1lhVXpMb3c3b3k2WE4ybEQ1?=
 =?utf-8?B?SWsrbUFSQ0sxbTBlcDZ5UzVKaUVxb1dSVWpGK3QrNm5FdHRlZm8wWXgxS1RI?=
 =?utf-8?B?OWtTcWhnZUN3a1V3aGxzeFk2YmNIMVlqSVdpUHFtUEswdU5ZbnpqcktWTXRF?=
 =?utf-8?B?cHU5NzlpM1pXUlB1VFFNL0Ryb2xzRUV4S09SdGVCV0VyUWlIYUplY3NKMkh2?=
 =?utf-8?B?ckg4djArUUNBMlM1Z0RDSDJnTHRqMk1ialN1TmwvdjZKNDY1WE12cXF5OUtk?=
 =?utf-8?B?M2xiN0U1WG5SUXFxTHo3eVBrUXhXTXExSEJVeVF5di9MU2dUeVE3RUhIYXhx?=
 =?utf-8?B?VUdoODE4RkJVNEJPR0UxMzRHWlUrRElEYThZN1ZuR1ZjSnZrVUp5R1BzVXcx?=
 =?utf-8?B?MmlwR3QzOVg5S2VGazFLNmFIZGNXNnBOaVFId3FIVEV2a0U0SWQ4aVk1blg0?=
 =?utf-8?B?NU90OEVzSGEvVWFKUWcwRkpyL3R5VlA5U3E1bWxNWHZNeElxRTRDczNPcHNI?=
 =?utf-8?B?RWZQbFpJZGNqMHdSRUxhQlJnSWNUODEzajhJNzRybjhzb0pSREpBN1UzYkEy?=
 =?utf-8?B?R3hKUGs4T281RjJFL1BCa1RyYnpFSDI4UTR6UUVOYnYvaWVzaktSMlQyd3FS?=
 =?utf-8?B?c25waEhsemorVXM0WEFKVDdBcVhGTzlIbmlWMTNrcW83WVNocjR2YmkrTHlY?=
 =?utf-8?B?V2FyR1NsVUEveStwbnlaUmIvQXhjWndvR3l0WklIeDg3M2tYN2FBNE5aRWpU?=
 =?utf-8?B?aDQ0Q0FPbXhwVEcyZ3drNlhtUUFQR0ZJc1ZIdkk2N1ZoVTJEaGRzaExGdDdW?=
 =?utf-8?B?UzJkaVIrNnVRcHh4Mm5GS0FqV2hNblI2bWZXKzdEOUU1YWhtSTROV04yd2h6?=
 =?utf-8?B?NXovNnFGWHg4VE9XZzB4QzVMdWpreVF5ZndwREhWYXRLbE9SZ1lObjJ3Sm5m?=
 =?utf-8?B?RHRWdTVpcldmUFhFTGpaVXRDbGFZUHExK0s3RW5zTVg1S3kzbnBZMTJQdmVi?=
 =?utf-8?B?ZlJ6Yi9tUk9veUlJQlVIRzRpanhpQUJ0cW44dHhBWUNmRkxjUzRoU2ZRSzJ0?=
 =?utf-8?B?byszU0xlUjVoUmNRWEhTbU4xTlhWNno1VXFYNUVLTFdxVHVYbGREaVpycTRh?=
 =?utf-8?B?dCtWZnBSekg0aGlQaTRxMytOL0NmWFZ0NFVhZm1MY1c0ZzU4Mkp0alh1OEtJ?=
 =?utf-8?B?MnRndTFPdU5lRmhRZDhaWndaelZhcm0yY2Z1WVExcm1ZanVOMzN5eCsyakxL?=
 =?utf-8?B?aGRZT29wTW5ZRzZVNUhEUEE4NXJRakxaNkZlT2k3WGpZeEFOZGkyYjRoUUZL?=
 =?utf-8?B?K1JiYThBTWFaSnkvTE0zVHB4NENFczB2R3lTcGg1V1Jaci8zN0tzVUlUYllm?=
 =?utf-8?B?Y2tTY3NxK2pMNS9JRUJRdUhMSjFGSmhUaVA3dHNtWHFjUE82S2YxZVBrcGdT?=
 =?utf-8?B?cS9BR3hNYXRnTFpzcjFnNU1PbHBaNnZFOGVMeWhpR1Y1dTZ5M0ZTRWZWSmNr?=
 =?utf-8?B?MURlQ0ZEejM2SllHVEdTUjV1eUt5KzRTSVgzY3U2SThZQ3pBQ0wwYkhiRElX?=
 =?utf-8?Q?kTmBoe+pfeX570tq+0WWytc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a277d065-7152-48b0-1427-08dc107bc600
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 18:58:17.0175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PX9k0NP8rbtBk/U0nwwHC9Sy+YNGDaGvtJJqmycxv5TE3JcCHbWXBy4aZrbLPjZTwn2nHadfw4Xbb0P48lCPJ+P1DAeZ2xSK25z0tzU17/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
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

--------------jr3yiGwuVyKT67HyRJJA6HbV
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 1/4/2024 11:21 PM, Teres Alexis, Alan Previn wrote:
> On Mon, 2023-12-11 at 17:05 -0800, Daniele Ceraolo Spurio wrote:
>
> alan: per offline chat, apologies on my delay causing to warrant a rebase.
> alan: (nit?/not-nit?): for Xe driver, are we enforcing to ensure all
> functions require documentation? (description, input, output, return...).
> If so, i think many functions in this patch is lacking this.
>
>
>> The GSC uC needs to communicate with the CSME to perform certain
>> operations. Since the GSC can't perform this communication directly on
>> platforms where it is integrated in GT, the graphics driver needs to
>> transfer the messages from GSC to CSME and back. The proxy flow must be
>> manually started after the GSC is loaded to signal to GSC that we're
>> ready to handle its messages and allow it to query its init data from
>> CSME.
> alan:snip
>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 2e0b2e40d8f3..3e97bc5a5b48 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
> alan:snip
>> @@ -512,6 +516,14 @@ int xe_device_probe(struct xe_device *xe)
>>   err_fini_display:
>>   	xe_display_driver_remove(xe);
>>   
>> +err_fini_gt:
>> +	for_each_gt(gt, xe, id) {
>> +		if (id < last_gt)
>> +			xe_gt_remove(gt);
> alan: since xe_gt_init does a drmm_add_action_or_reset(... gt_fini ...),
> is there a reason we don't want to place the new xe_uc_remove under there?
> (which in turn calls the new xe_gsc_remove).

Copying from the commit message:

Note that the component must be removed before the pci_remove call 
completes, so we can't use a drmm helper for it and we need to instead 
perform the cleanup as part of the removal flow.

>
> alan:snip
>
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index a8a895cf4b44..38e9dd3129bd 100644
>> +static int gsc_upload_and_init(struct xe_gsc *gsc)
>> +{
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	int ret;
>> +
>> +	ret = gsc_upload(gsc);
>> +	if (ret)
>> +		return ret;
> alan: nit:going thru gsc_upload top->down, there is only one corner
> case where we can fail inside xe_uc_fw_check_version_requirements without
> an error message, would we perhaps wanna add a xe_gt_dbg "GSC_FW async init: load done" after this
> and tweak the message at end to "GSC FW async init: proxy done"?

ok

>
> alan:snip
>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>> new file mode 100644
>> index 000000000000..0983b4903cc7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> alan:snip
>
>
>> +/* shorthand define for code compactness */
>> +#define PROXY_HDR_SIZE (sizeof(struct xe_gsc_proxy_header))
> alan: nit: "GSC_PROXY_HDR_SIZE"? (for no reason other than consistency).

I'd prefer to keep it as short as possible. This is defined in a .c 
file, so there shouldn't be risk of confusion as it can't be used in 
another non-gsc file.

>
>
>
>> +static inline struct xe_device *kdev_to_xe(struct device *kdev)
>> +{
>> +	return dev_get_drvdata(kdev);
> alan: seeing some other xe codes that convert from dev to xe, should this rather be:
> 	return to_xe_device(dev_get_drvdata(kdev);

AFAICS we set the drvdata to the xe structure (via pci_set_drvdata). The 
drm device is the first structure inside the xe_device struct, so a 
pointer to the drm struct is also a pointer to the xe struct, which is 
why the code you suggested works as well (with an extra unneeded step).

>> +}
>> +
>> +static bool gsc_proxy_init_done(struct xe_gsc *gsc)
> alan: not blocking: as i compared simple hw/fw facing helpers like
> this against i915 (logically the same), I notice that in xe, we dont
> have the equivalent for i915's __wait_gsc_proxy_completed which
> is called from selftest code. In i915 that helper calls a gsc-helper
> same as this function after also checking CONFIG_INTEL_MEI_GSC_PROXY
> and the fw loading state. Do we not need this type of checking for
> xe BISTs that excercise all engines? To be fair that can be a separate
> patch. Probably an offline to-do.

AFAICT we don't have xe selftests yet, so no user for that function.

>
> alan:snip
>
>
>
>> +u32 emit_proxy_header(struct xe_device *xe, struct iosys_map *map, u32 offset)
>> +{
>> +	xe_map_memset(xe, map, offset, 0, PROXY_HDR_SIZE);
>> +
>> +	proxy_header_wr(xe, map, offset, hdr,
>> +			FIELD_PREP(GSC_PROXY_TYPE, GSC_PROXY_MSG_TYPE_PROXY_QUERY) |
>> +			FIELD_PREP(GSC_PROXY_PAYLOAD_LENGTH, 0));
> alan: thinking of discrete devices, i assume proxy messages are occasional and in between
> (not sure about how occasional for hdcp case), so as a low priority feedback:
> perhaps its more efficient (at the hw pci bus transaction level) if we create a local
> structure filled up and then use iosysmap for a memcpy as opposed to writing dwords
> one at a time? or am missing something about how we are cache/flush these buffers leading
> up  to submission?

I didn't think about optimizing this since, as you said, it's relatively 
rare. I can switch to a memcpy if you think it works better.

>
> alan: snip
>
>
>
>
>> +static int proxy_query(struct xe_gsc *gsc)
>> +{
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_gsc_proxy_header *to_csme_hdr = gsc->proxy.to_csme;
>> +	void *to_csme_payload = gsc->proxy.to_csme + PROXY_HDR_SIZE;
>> +	u32 wr_offset;
>> +	u32 rd_offset;
>> +	u32 size;
>> +	int ret;
>> +
>> +	wr_offset = xe_gsc_emit_header(xe, &gsc->proxy.to_gsc, 0,
>> +				       HECI_MEADDRESS_PROXY, 0, PROXY_HDR_SIZE);
>> +	wr_offset = emit_proxy_header(xe, &gsc->proxy.to_gsc, wr_offset);
>> +
>> +	size = wr_offset;
>> +
>> +	while (1) {
>> +		/* clear the GSC response header space */
>> +		xe_map_memset(xe, &gsc->proxy.from_gsc, 0, 0, SZ_4K);
> alan: any reason we are clearing out a whole page as opposed to
> just the sizeof(gsc-cmd-header) or sizeof(gsc-cmd-header) + sizeof(proxy-header)?

This function has no visibility of how big the GSC cmd header is (this 
is on purpose). In theory the only thing we need to clear is the first 
dword (where the header marker is), but IMO clearing the whole page is 
better so we're sure all header are cleared (including whatever is at 
the beginning of the payload, which is a black box to us).

>
>> +
>> +		/* send proxy message to GSC */
>> +		ret = proxy_send_to_gsc(gsc, size);
>> +		if (ret)
>> +			goto proxy_error;
>> +
>> +		/* check the reply from GSC */
>> +		ret = xe_gsc_read_out_header(xe, &gsc->proxy.from_gsc, 0,
>> +					     PROXY_HDR_SIZE, &rd_offset);
> alan: nit: could we rename "rd_offset" to "gsc_payload_offset"? (i believe this
> would be more descriptive of how it's used in the subsequent places in this loop)

"payload" would be incorrect, since this is proxy_header + 
proxy_payload. I can change it to "reply_offset".

>
>> +		if (ret) {
>> +			xe_gt_err(gt, "Invalid gsc header in proxy reply (%pe)\n",
>> +				  ERR_PTR(ret));
> alan: why the ERR_PTR conversion here?

because %pe takes an error pointer and converts it to a readable errno 
string.

>> +			goto proxy_error;
>> +		}
>> +
>> +		/* copy the proxy header reply from GSC */
>> +		xe_map_memcpy_from(xe, to_csme_hdr, &gsc->proxy.from_gsc,
>> +				   rd_offset, PROXY_HDR_SIZE);
>> +
>> +		/* stop if this was the last message */
>> +		if (FIELD_GET(GSC_PROXY_TYPE, to_csme_hdr->hdr) == GSC_PROXY_MSG_TYPE_PROXY_END)
>> +			break;
>> +
>> +		/* make sure the GSC-to-CSME proxy header is sane */
>> +		ret = validate_proxy_header(to_csme_hdr,
>> +					    GSC_PROXY_ADDRESSING_GSC,
>> +					    GSC_PROXY_ADDRESSING_CSME,
>> +					    GSC_PROXY_BUFFER_SIZE - rd_offset);
>> +		if (ret) {
>> +			xe_gt_err(gt, "invalid GSC to CSME proxy header! (%pe)\n",
>> +				  ERR_PTR(ret));
> alan: why the ERR_PTR conversion here?

same as above

>> +			goto proxy_error;
>> +		}
>> +
>> +		/* copy the rest of the message */
>> +		size = FIELD_GET(GSC_PROXY_PAYLOAD_LENGTH, to_csme_hdr->hdr);
>> +		xe_map_memcpy_from(xe, to_csme_payload, &gsc->proxy.from_gsc,
>> +				   rd_offset + PROXY_HDR_SIZE, size);
>> +
>> +		/* send the GSC message to the CSME */
>> +		ret = proxy_send_to_csme(gsc, size + PROXY_HDR_SIZE);
>> +		if (ret < 0)
>> +			goto proxy_error;
>> +
>> +		/* reply size from CSME, including the proxy header */
>> +		size = ret;
>> +		if (size < PROXY_HDR_SIZE) {
>> +			xe_gt_err(gt, "CSME to GSC proxy msg too small: 0x%x\n", size);
> alan: should we set ret = -EPROTO or other error?

yes, will fix

> This way, this function will returns an error, also it would ensure all paths in this
> loop will either have ret = 0 or an error and simplify the end of the fucntion... i.e.
> all cases can just "break" as opposed to "goto proxy_error" and just return 'ret' as is?
>> +			goto proxy_error;
> alan:snip
>> +proxy_error:
>> +	return ret < 0 ? ret : 0;
>> +}
>> +
>
> alan:snip
>
>> +void xe_gsc_proxy_remove(struct xe_gsc *gsc)
>> +{
>> +	struct xe_gt *gt = gsc_to_gt(gsc);
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (gsc->proxy.component_added) {
>> +		component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
> alan: we ought to put the wait for the worker to complete since that worker
> could take long time for the component to get added - we could get racy no?

The wait is the first thing inside the unbind() action, so the unbind 
can't complete until the worker is done.

>
>> +		gsc->proxy.component_added = false;
>> +	}
>> +}
>> +
>>
> alan:snip
>
>> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
>> index 57fefd66a7ea..645166adae1f 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
>> @@ -7,11 +7,15 @@
>>   #define _XE_GSC_TYPES_H_
>>   
>>   #include <linux/workqueue.h>
>> +#include <linux/iosys-map.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
> alan: question: do we need to follow alphabetical for linux includes?

yeah, I'll fix this.

Daniele

> alan:snip
>>   

--------------jr3yiGwuVyKT67HyRJJA6HbV
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 1/4/2024 11:21 PM, Teres Alexis,
      Alan Previn wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 2023-12-11 at 17:05 -0800, Daniele Ceraolo Spurio wrote:

alan: per offline chat, apologies on my delay causing to warrant a rebase.
alan: (nit?/not-nit?): for Xe driver, are we enforcing to ensure all
functions require documentation? (description, input, output, return...).
If so, i think many functions in this patch is lacking this.


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The GSC uC needs to communicate with the CSME to perform certain
operations. Since the GSC can't perform this communication directly on
platforms where it is integrated in GT, the graphics driver needs to
transfer the messages from GSC to CSME and back. The proxy flow must be
manually started after the GSC is loaded to signal to GSC that we're
ready to handle its messages and allow it to query its init data from
CSME.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan:snip

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2e0b2e40d8f3..3e97bc5a5b48 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan:snip
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -512,6 +516,14 @@ int xe_device_probe(struct xe_device *xe)
 err_fini_display:
 	xe_display_driver_remove(xe);
 
+err_fini_gt:
+	for_each_gt(gt, xe, id) {
+		if (id &lt; last_gt)
+			xe_gt_remove(gt);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: since xe_gt_init does a drmm_add_action_or_reset(... gt_fini ...),
is there a reason we don't want to place the new xe_uc_remove under there?
(which in turn calls the new xe_gsc_remove).</pre>
    </blockquote>
    <br>
    Copying from the commit message:<br>
    <br>
    <span style="white-space: pre-wrap">Note that the component must be removed before the pci_remove call
</span><span style="white-space: pre-wrap">completes, so we can't use a drmm helper for it and we need to instead
</span><span style="white-space: pre-wrap">perform the cleanup as part of the removal flow.</span><br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

alan:snip

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index a8a895cf4b44..38e9dd3129bd 100644
+static int gsc_upload_and_init(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	int ret;
+
+	ret = gsc_upload(gsc);
+	if (ret)
+		return ret;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: nit:going thru gsc_upload top-&gt;down, there is only one corner
case where we can fail inside xe_uc_fw_check_version_requirements without
an error message, would we perhaps wanna add a xe_gt_dbg &quot;GSC_FW async init: load done&quot; after this
and tweak the message at end to &quot;GSC FW async init: proxy done&quot;?</pre>
    </blockquote>
    <br>
    ok<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

alan:snip

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
new file mode 100644
index 000000000000..0983b4903cc7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan:snip


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+/* shorthand define for code compactness */
+#define PROXY_HDR_SIZE (sizeof(struct xe_gsc_proxy_header))
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: nit: &quot;GSC_PROXY_HDR_SIZE&quot;? (for no reason other than consistency).</pre>
    </blockquote>
    <br>
    I'd prefer to keep it as short as possible. This is defined in a .c
    file, so there shouldn't be risk of confusion as it can't be used in
    another non-gsc file.<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">



</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static inline struct xe_device *kdev_to_xe(struct device *kdev)
+{
+	return dev_get_drvdata(kdev);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: seeing some other xe codes that convert from dev to xe, should this rather be:
	return to_xe_device(dev_get_drvdata(kdev);</pre>
    </blockquote>
    <br>
    AFAICS we set the drvdata to the xe structure (via pci_set_drvdata).
    The drm device is the first structure inside the xe_device struct,
    so a pointer to the drm struct is also a pointer to the xe struct,
    which is why the code you suggested works as well (with an extra
    unneeded step).<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+}
+
+static bool gsc_proxy_init_done(struct xe_gsc *gsc)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: not blocking: as i compared simple hw/fw facing helpers like
this against i915 (logically the same), I notice that in xe, we dont
have the equivalent for i915's __wait_gsc_proxy_completed which
is called from selftest code. In i915 that helper calls a gsc-helper
same as this function after also checking CONFIG_INTEL_MEI_GSC_PROXY
and the fw loading state. Do we not need this type of checking for
xe BISTs that excercise all engines? To be fair that can be a separate
patch. Probably an offline to-do.</pre>
    </blockquote>
    <br>
    AFAICT we don't have xe selftests yet, so no user for that function.<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

alan:snip



</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+u32 emit_proxy_header(struct xe_device *xe, struct iosys_map *map, u32 offset)
+{
+	xe_map_memset(xe, map, offset, 0, PROXY_HDR_SIZE);
+
+	proxy_header_wr(xe, map, offset, hdr,
+			FIELD_PREP(GSC_PROXY_TYPE, GSC_PROXY_MSG_TYPE_PROXY_QUERY) |
+			FIELD_PREP(GSC_PROXY_PAYLOAD_LENGTH, 0));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: thinking of discrete devices, i assume proxy messages are occasional and in between
(not sure about how occasional for hdcp case), so as a low priority feedback:
perhaps its more efficient (at the hw pci bus transaction level) if we create a local
structure filled up and then use iosysmap for a memcpy as opposed to writing dwords
one at a time? or am missing something about how we are cache/flush these buffers leading
up  to submission?</pre>
    </blockquote>
    <br>
    I didn't think about optimizing this since, as you said, it's
    relatively rare. I can switch to a memcpy if you think it works
    better.<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

alan: snip




</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static int proxy_query(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_gsc_proxy_header *to_csme_hdr = gsc-&gt;proxy.to_csme;
+	void *to_csme_payload = gsc-&gt;proxy.to_csme + PROXY_HDR_SIZE;
+	u32 wr_offset;
+	u32 rd_offset;
+	u32 size;
+	int ret;
+
+	wr_offset = xe_gsc_emit_header(xe, &amp;gsc-&gt;proxy.to_gsc, 0,
+				       HECI_MEADDRESS_PROXY, 0, PROXY_HDR_SIZE);
+	wr_offset = emit_proxy_header(xe, &amp;gsc-&gt;proxy.to_gsc, wr_offset);
+
+	size = wr_offset;
+
+	while (1) {
+		/* clear the GSC response header space */
+		xe_map_memset(xe, &amp;gsc-&gt;proxy.from_gsc, 0, 0, SZ_4K);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: any reason we are clearing out a whole page as opposed to
just the sizeof(gsc-cmd-header) or sizeof(gsc-cmd-header) + sizeof(proxy-header)?</pre>
    </blockquote>
    <br>
    This function has no visibility of how big the GSC cmd header is
    (this is on purpose). In theory the only thing we need to clear is
    the first dword (where the header marker is), but IMO clearing the
    whole page is better so we're sure all header are cleared (including
    whatever is at the beginning of the payload, which is a black box to
    us).<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+		/* send proxy message to GSC */
+		ret = proxy_send_to_gsc(gsc, size);
+		if (ret)
+			goto proxy_error;
+
+		/* check the reply from GSC */
+		ret = xe_gsc_read_out_header(xe, &amp;gsc-&gt;proxy.from_gsc, 0,
+					     PROXY_HDR_SIZE, &amp;rd_offset);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: nit: could we rename &quot;rd_offset&quot; to &quot;gsc_payload_offset&quot;? (i believe this
would be more descriptive of how it's used in the subsequent places in this loop)</pre>
    </blockquote>
    <br>
    &quot;payload&quot; would be incorrect, since this is proxy_header +
    proxy_payload. I can change it to &quot;reply_offset&quot;.<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+		if (ret) {
+			xe_gt_err(gt, &quot;Invalid gsc header in proxy reply (%pe)\n&quot;,
+				  ERR_PTR(ret));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: why the ERR_PTR conversion here? </pre>
    </blockquote>
    <br>
    because %pe takes an error pointer and converts it to a readable
    errno string.<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+			goto proxy_error;
+		}
+
+		/* copy the proxy header reply from GSC */
+		xe_map_memcpy_from(xe, to_csme_hdr, &amp;gsc-&gt;proxy.from_gsc,
+				   rd_offset, PROXY_HDR_SIZE);
+
+		/* stop if this was the last message */
+		if (FIELD_GET(GSC_PROXY_TYPE, to_csme_hdr-&gt;hdr) == GSC_PROXY_MSG_TYPE_PROXY_END)
+			break;
+
+		/* make sure the GSC-to-CSME proxy header is sane */
+		ret = validate_proxy_header(to_csme_hdr,
+					    GSC_PROXY_ADDRESSING_GSC,
+					    GSC_PROXY_ADDRESSING_CSME,
+					    GSC_PROXY_BUFFER_SIZE - rd_offset);
+		if (ret) {
+			xe_gt_err(gt, &quot;invalid GSC to CSME proxy header! (%pe)\n&quot;,
+				  ERR_PTR(ret));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: why the ERR_PTR conversion here? </pre>
    </blockquote>
    <br>
    same as above<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+			goto proxy_error;
+		}
+
+		/* copy the rest of the message */
+		size = FIELD_GET(GSC_PROXY_PAYLOAD_LENGTH, to_csme_hdr-&gt;hdr);
+		xe_map_memcpy_from(xe, to_csme_payload, &amp;gsc-&gt;proxy.from_gsc,
+				   rd_offset + PROXY_HDR_SIZE, size);
+
+		/* send the GSC message to the CSME */
+		ret = proxy_send_to_csme(gsc, size + PROXY_HDR_SIZE);
+		if (ret &lt; 0)
+			goto proxy_error;
+
+		/* reply size from CSME, including the proxy header */
+		size = ret;
+		if (size &lt; PROXY_HDR_SIZE) {
+			xe_gt_err(gt, &quot;CSME to GSC proxy msg too small: 0x%x\n&quot;, size);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: should we set ret = -EPROTO or other error?</pre>
    </blockquote>
    <br>
    yes, will fix<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
This way, this function will returns an error, also it would ensure all paths in this
loop will either have ret = 0 or an error and simplify the end of the fucntion... i.e.
all cases can just &quot;break&quot; as opposed to &quot;goto proxy_error&quot; and just return 'ret' as is?
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+			goto proxy_error;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan:snip
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+proxy_error:
+	return ret &lt; 0 ? ret : 0;
+}
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

alan:snip

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+void xe_gsc_proxy_remove(struct xe_gsc *gsc)
+{
+	struct xe_gt *gt = gsc_to_gt(gsc);
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (gsc-&gt;proxy.component_added) {
+		component_del(xe-&gt;drm.dev, &amp;xe_gsc_proxy_component_ops);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: we ought to put the wait for the worker to complete since that worker
could take long time for the component to get added - we could get racy no?</pre>
    </blockquote>
    <br>
    The wait is the first thing inside the unbind() action, so the
    unbind can't complete until the worker is done.<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+		gsc-&gt;proxy.component_added = false;
+	}
+}
+

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan:snip

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
index 57fefd66a7ea..645166adae1f 100644
--- a/drivers/gpu/drm/xe/xe_gsc_types.h
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -7,11 +7,15 @@
 #define _XE_GSC_TYPES_H_
 
 #include &lt;linux/workqueue.h&gt;
+#include &lt;linux/iosys-map.h&gt;
+#include &lt;linux/mutex.h&gt;
+#include &lt;linux/types.h&gt;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: question: do we need to follow alphabetical for linux includes?</pre>
    </blockquote>
    <br>
    yeah, I'll fix this.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:a61fdbc48bb25b7e221f6c3e8edcb722a2873f1c.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
alan:snip
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------jr3yiGwuVyKT67HyRJJA6HbV--
