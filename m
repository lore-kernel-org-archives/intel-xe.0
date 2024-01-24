Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95799C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 04:01:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B14C10F02C;
	Wed, 24 Jan 2024 04:01:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD9910F02C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 04:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706068859; x=1737604859;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=evNMF/ho/IURalDv7Kcl5LPE/oru0uJJKH+j11WBKzY=;
 b=JLmRYk5KMxEIqFcZca2pELi8Ti0PWSE54WfG1x/VfTIYPqEQzFEBtTd9
 D1KFBWuBG34/+6svdO3CkNEMDkrjKHXbbXFtgWwRCV1okq/DYep/No8tf
 m/uZH08CCfpyzoq1e9+0Pt/KZCo7OYlNZHQPC/jA+i7vzibRlDLU33GOW
 9xIK47eHfSAS2uEOJVpL9irAprL70WvT2Eb4e2tz5LjCsZHRSsuZpEfZ0
 DuYzi7zufwzd59vGjlU8gG9mXr3qWrClmi7OQ/UTgR89SE22S6ecY8eey
 XxzZrRtY0kBg76qYgPSfLDOr4lu61Se4dYZk1yaWXKPCT3uwb+sSWof+i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23194717"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="23194717"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:00:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856557576"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="856557576"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 20:00:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 20:00:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 20:00:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 20:00:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 20:00:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bN9957M28dbsqp2pFJ0bDTGt+xc0L/JF3CbA6wM0Di2jIjaK2K0cOM3m3xjJVohJHHTkw0DkFZWC/Vrup7KGeQ5xP4DKXjnV7Wu1dt9RQg+h31GUcpa/6jdeJPyMSn7IeoydTEcepK4Kff5XWj1FHEuwHWucoW22M3HPq27bWO/+rcumst96Q85Alq+SZpuIUNnNgaLSbSbDoP6XdeXBRyv+B/gnJfeLQSYjNglJ2VG5uTuo7Pfw5uKJJPlqwD1kpYKbfq3odt1Wyb+GXyco4HFMZV9L7CDJMhPBIXg8QFORqkeLHG4SKIgz/U3AM2b0nFB1TCFxBnursWqsTXy6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI83AuT+aEuFOPsB+XmO/C5V10wB+v+c9aF+KS/+q90=;
 b=gykt8M7zrO+hqCHQ8H5sad/27sDfg8/cGKLu9azCkJ6tTnQyqLBClsAdqbV/9yH+15I1hSxUQJa/kQDeYGzH/KKQ8KhgSLjInsB7kAqmolXEkK7DbQUA1qiN815H2syv213iVUMdXcaqu1Q2b2dY989Ema4JSDfN5Ul4TelHvIB7h57qRoEduueplgrLIZVm6tJ6Smy2TPoGtcT3spYDkcsNQvaBK7s6o01rJ8sKBdwJ2pBH2i/puhM93GWh+uUxG4OHY4zDjt282PXTRk32RPRBr+WR4O+sTywnvo9gexDkuVBPx9N1hBinftCCqSFI60dJX6jco/nN6ZB0EMS7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM4PR11MB6216.namprd11.prod.outlook.com (2603:10b6:8:a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Wed, 24 Jan 2024 04:00:44 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::5e80:889f:ebfe:8a37]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::5e80:889f:ebfe:8a37%7]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 04:00:44 +0000
Message-ID: <5e5f0555-a09c-46e3-a279-20ed03e1f3b1@intel.com>
Date: Wed, 24 Jan 2024 09:30:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/xe: Fix typo in vram frequency sysfs documentation
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240117043215.2598677-1-sujaritha.sundaresan@intel.com>
 <11530813-d796-4e76-b268-2a020d7357f5@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <11530813-d796-4e76-b268-2a020d7357f5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::16) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DM4PR11MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: db0e5e40-074d-4f19-48ca-08dc1c91099e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1m9+CwJrh5z16c4jMNc9cjFxizo+EDBJouWJgEoqOEYfu3teXLn7pQN5X+3sz7QZdiSdtOgeH+QcxGFtDX1vtXhVzLJATs9w9cwAcKzN1HvNphOf+Pen0JR2qdMS2YshJ1fRxlYwz8NTKjNqkxJ/CpxTHS9ljqBwZMiFnDYd09PTRsMFw9W6C0KVXD2hzjYsaad2oAdgGzAc465/beTz2hg4fgTeEGn1dOLqfsV3k3zDqjgEhcItPlkmPnyAAppCIfBNodhvv1jDKC8gkqn2LAqMBANnXzXGTkF3oPli3UvozyaT5zyO4HdX/e3YXHIIig9EuK8+trv8+ntgFJCXfpEB3FCjJbrntIhF+zHP9BVqspCsMj8rBV6YRJ61JfAUfAI2EGZF2zprAbQf/gwLiJc34F/VbIcZLOESWQn+M7dvmQcSqezXsub0qGsnw4+YSOkWm5/xYpPqfYFhTYoBPo+gHge/QTQlzjk0WcwS38FY1NhZOJYJXxPoRD3h9VN2hiqkyCP37ADYDzR5T2Rn8pUX2MQX2mv/hi8YqWR6c2eKki3rbFTeeJqb7vYMRK25Vb+reJPeZRKoCM/uWsjbfAUNBVSuPunZ75N9Ur0mOksx3Q4/kK7iqtVTZbrvFtmf6pPz/l0E12R41ixhBLbOhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(2616005)(6512007)(53546011)(5660300002)(38100700002)(478600001)(8936002)(8676002)(66556008)(66476007)(6486002)(2906002)(6666004)(66946007)(316002)(6506007)(36756003)(41300700001)(26005)(86362001)(31696002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTh0UXdDV05ocXU3bk5QTS81aWxqUHhpZ3lKREplUVJmNFNQTW9CMm5iR05D?=
 =?utf-8?B?NGtLRFlZeVl5QVBhVG5vdEsxZC9JdEdCVi9DUXJHeWQ1UTJFR0JmK05OQ3cy?=
 =?utf-8?B?YnB4VjdJajRPbnhJZ3M3d0NEMzBnbnlzdWFxWmp4UFczSyt1ekpHQ3ZraVRC?=
 =?utf-8?B?cmhXSG0ySStTUXhhV1FJQUp1aElhMUVYYUhJY0FSQWdMQXFXOU14ajVydHB3?=
 =?utf-8?B?d3BBdWtxRVhqWmZKN1M4K1Rwbmxyd3pVci9rbFlXVXRNWUFWYWZ0dUtLVCtY?=
 =?utf-8?B?NFpXZDJqUTg2OU5VSmhHbWlyb1lQRExJOE5KZkNQZjhWVlE5ZXI5bEl3cmFN?=
 =?utf-8?B?NUtnYmMvTUIvdDJRZHllNWRiWUFmVm5RVXpRaHNVU3FBTnYzM1dWdlByUGZU?=
 =?utf-8?B?S2hIc1dpVGdZMHdRS0JyRDVsYkFmNEhFZ0hiKzA0dEZTMTRLdENMNCtFMHpZ?=
 =?utf-8?B?NmFRcW5EMnhvek8rdHZ6Qjh6a2loK1hvTE55QWg5QWpXM3lYQnMxQ01EMDh1?=
 =?utf-8?B?dDRlQzB5c3U5KzFSS3o4VEhHSXlvSHBpa3FXRHJrUUh0VFpaNk5abUM3YkxB?=
 =?utf-8?B?eXlqSHBkbmo1MjMyeUtmd1Z3b0lFRExwc0VJYmJqTjIrQUN1RUM4L3FIN0NW?=
 =?utf-8?B?Sit5MFoybThGSDBoUGlBNDlpUWNmSDRlZUlTRUZVa0U3MGo2Zm5QOTFleUxM?=
 =?utf-8?B?ZFVKTklEcmhGWHJBc3AyRUczK29ucFlZZnlkQWQ0dHVYUFg4cTgrZDNUeW5I?=
 =?utf-8?B?ejgrRXp1WnM0ejJMdFdFSmwrb3o0RmFpWWgrWWdRVkI3WEJsWFl2SERCY1lC?=
 =?utf-8?B?Ky8wc240QVpSWUM0MzV4UmNKc1dLTlFMSWYyQnRnQzVqTm92SzF3clZBKzJX?=
 =?utf-8?B?dGNIUDF2UVV2eFcrUWRhazVjZDlDaWpqekVhaFppcGh5eDNkYWk3VzQ1U2Fj?=
 =?utf-8?B?ck5IK0R2MmtobDZ5ekRaNjlyWTl5cExWaElCblFjZVZaZFY2TkwyRis2NzVk?=
 =?utf-8?B?VzQ1azR6MUZYcjJ3WjFTTHp3anpWUHNpREpvK29zYUcwaitBcHR6d2xHd1FJ?=
 =?utf-8?B?Y2hzakY4cW5uc1g1S3VRSkU0cU1XbDZZU0luaFRlNlN1WVcrbGttSTFvZTNm?=
 =?utf-8?B?WGpXRDZHT2dvQ09EMGJSWHlEREdhTUhLT3BqZDJ6RHJOZHorTU10RGczMFhG?=
 =?utf-8?B?QjNoMkJuUkdYUUJlTDlHQVdyYkdpeVNPZGRSR3VubEF0elJjcW1Uck43TmNv?=
 =?utf-8?B?NjJ5YytaeE5uZ3FmY1d4Z3NDNkMrQ25raFgybFdHcGlVbURXbnNkMEpEcDdM?=
 =?utf-8?B?TVBrNjc4alVSZDRVRlVuUFZWTk9xa0J4SnZ1Q1hrZXJPNWR2WkdKQkh1NG02?=
 =?utf-8?B?OW9qYVZ3NkxhL1g2ZkpzVjJTZTljY3M1dFRxQnlzY3k0aXdQSGlyRmpJYzhQ?=
 =?utf-8?B?TWp1VC9aTDVTSHI2YVRsQmh4V05hT25BVWZ6T0U2SlYvTTB6L0FERkVBNzhx?=
 =?utf-8?B?N2hVNjJDZWZzdDk0Skd2dFpMbDdYODM4bFk3ZEUzbDZjNWtWZi9PMHZ2R1U1?=
 =?utf-8?B?b3FYeUdLaDhrdk5ZKzJ5Y0JoT3JHY0p2aUR4ZUdjZUpvQzhGd0NBRWcwNllm?=
 =?utf-8?B?bjBWUldWeStYcGt6T0RPcG00VmwrRXJtWlVTMVY0ejRuY2VHejJuSzRsMGx6?=
 =?utf-8?B?YmF1aExzQ2VicnJpdEFnOVVEdUV1UDYzMnVqSHRYcjltOGp2cTl1Kzc5bThu?=
 =?utf-8?B?ejl3dnhDZ1RiRGJra2o4Z21jUjdEWnlzSXp3dUFYU1ZHLzczUVIvdzB3L0V4?=
 =?utf-8?B?VDdUbUtNeTcrMnJieWt2TzZrMDhmNXpqLzZrYWVCdU9zdGZzYVBMcW1JWThQ?=
 =?utf-8?B?MkxyaEg1bGtJV2dhM25WQStKSnB4eVNsR3VYUEFEc0pPVVluYi9VRFZVcVlM?=
 =?utf-8?B?WVQ2QU1USmQ2K1BmRURtczRtTDBlQXRjSnd3ZHA1dkJ5SU10N2l3ZGgwOC9m?=
 =?utf-8?B?a2tVL1p6SXB1WUxMOGk5YXl5dkQzZW9nUmhkR0JPaFdDTHhtbzZuUHF0YUVl?=
 =?utf-8?B?S3lLOVRFWUovdnpUV0szam9LUHhvc0o4dGhZWDZRcTJHNnhMdXc3QU5ZK0RG?=
 =?utf-8?B?ZEtaSGN6NG94bXVsaXlYRlFHLzRZakp0bUk1N29PNDR1RUlqNTFQalp6WGVj?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db0e5e40-074d-4f19-48ca-08dc1c91099e
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 04:00:44.1657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ji2K86xLxVxj1I132PGiPGgZPDo5MYTujgxl/6MzzXHMVeO79hhxQf+ZkJytWyjt1RTV4gSdXGFGBFUmQMmNfHIobBtjjPVHwNuqt9h500=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6216
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


On 1/22/2024 12:38 PM, Riana Tauro wrote:
>
>
> On 1/17/2024 10:02 AM, Sujaritha Sundaresan wrote:
>> Fix function naming and description for xe_vram_freq_sysfs_init
>> function.
>>
>> v2: Add fixes tag (Riana)
>>      Fix review comments (Lucas)
>>
>> Fixes: 4ae3aeab32d7 ("drm/xe: Add vram frequency sysfs attributes")
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Looks good to me
>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thanks for the review. Patch has been merged.

Regards,

Suja

>> ---
>>   drivers/gpu/drm/xe/xe_vram_freq.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c 
>> b/drivers/gpu/drm/xe/xe_vram_freq.c
>> index 733146293307..079cc283a186 100644
>> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
>> @@ -95,13 +95,12 @@ static void vram_freq_sysfs_fini(struct 
>> drm_device *drm, void *arg)
>>       kobject_put(kobj);
>>   }
>>   -/*
>> - * xe_vram_freq_init - Initialize vram frequency component
>> +/**
>> + * xe_vram_freq_sysfs_init - Initialize vram frequency sysfs component
>>    * @tile: Xe Tile object
>>    *
>>    * It needs to be initialized after the main tile component is ready
>>    */
>> -
>>   void xe_vram_freq_sysfs_init(struct xe_tile *tile)
>>   {
>>       struct xe_device *xe = tile_to_xe(tile);
