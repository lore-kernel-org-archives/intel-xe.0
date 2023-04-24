Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A788C77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 16:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E051210E0E8;
	Mon, 24 Apr 2023 16:58:24 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A564710E3F1
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355502; x=1713891502;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pQ7x9CAHe2TsARM66xEbxqN7W1CQ/xwjwrAGBBC/dKI=;
 b=B8mK8Kwbj2Q58XzbQFh9pVPhjISzIPBNZalZuqBzAcMI0hEZKrofi2Ro
 XxZK5AjrpQWegnfRtPZ3i9rlN8IqrbrIGDXB2iuuYvajFLfmvjQpBHFDf
 HeGMLziadQ9S4vK7dj58JzbbKhsCJSck3p52rP8XE0WD5H8xc+snGhTzl
 +OyOdEkRMiQmc2vfMZYUsCTHCmNSTr8eerlDmxG990Ab9zJs/7dzJC2LP
 aiTgp685WugZMcOTYpKoW52w64x0mAatxtAMKgUbv6vpY4vOLgk7G/FNW
 Qx/xQCEKavRVgEYEYaNNMWfkTdnQ02DCYNUVKCf+MGU20W4V/bc/tZwbi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330706435"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330706435"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022788630"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022788630"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2023 09:58:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 09:58:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 09:58:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 09:58:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGTVowH+Sssc4AyxkYNHpfbyfjQL9jAf0hijMQHr0EgBrFlQpQ/pe6LUwyt15wHXNW3D3JWBQ124ucoZkeIGEapc4+RH4xQ6yY5evnQIdT3ZsVhfIpEGmnI+gSrKXujj+qxncaMCxCkFZT0mw79qIuZzya8TYMhLkqUS8BdSEJ3X2tQdlZOI6yTH+olT6Ou4/EAGNNceFD9IJCqUzqiuNehPsDmy5DckO78QBlALBMlnAxidnprkFbLgUpjGT1aV/QHUKTE8k2LjXcOMawVb9QwE63TsoOCAChQU/zXFiBZb4zBeNtkGa4rWOURptFN4OKrnD0L2oKopZbxsDr1BIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yx3VEti4rZoncI/bGG4gnXUsyYHPx66P8bmZsNkL5/E=;
 b=NZJckwLD/olpX9yl0LMpHo8H1S0i6mKeVVkc3lzmsGm/Ecr4yRvqhYtGWjkW0RT8Tano8rh9QbdbMnVWDvD6krdAifsSDa+1qx59rr63y3VXvwWqwgA1FCznLycfmTgI4T0aLY1BHBG11ba4pH6M55a5WFrhRyGFlTQoZmHXUBIvK6KWTvwRYvxDvvE4V1rc649q9rGbuSQ60abTkRQsbWyKeg5QD+RS520lAywiCNA5KBIqLpFrFLRN9YLgeP9dWNTdnQNwDfHQoH1ZunaPWG/P4G+lN6x9QPaz5c7eSFg7LYeEMxsK/PO/4WIGiR5DmjCfflPd7KJytQwW22f+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 16:58:18 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::962f:b14d:4e3b:63b3%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 16:58:18 +0000
Message-ID: <03c099f7-e4d9-8622-09c2-68119af5f4c1@intel.com>
Date: Mon, 24 Apr 2023 22:28:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230413072554.4183876-1-riana.tauro@intel.com>
 <ZEGlBmIi54V25uP9@rdvivi-mobl4>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZEGlBmIi54V25uP9@rdvivi-mobl4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::12) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA1PR11MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b625397-1f0c-4fd9-6f0f-08db44e51a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E4NfpMejRJfKQLBN9VHyV+BvdKFiHPLj9HOYZSXv8D7z8f6eA04d9UgZViIOecNzEJapkleZwfKTzWKdPdBilzplhl10Zqu5YDeYIqj3gsDCjmdywtajmfQDgMGaChGMfHK/G7f7bwO3KF4V1qImZr/xeISlLX8ROUkXdNYKDo4W+km89DmipO81YCZsdX8oFbb6tUi+pTiVaQTwqaRFmQ4Bsd4FhsgXBWdx8n8KXar+FG+sT19Z8nd7iE0AnHDXmu4Qtc7otlKDfv1d28lAl3cj7dYpBICSyRClU6MefeQ26Jqx7n2gtja/PRp/KpV+j2CkBMkQFWttxT0vtkimNJWnTL5NLAMU9fj1prcf5ZXH32CWcLM8rSdXEqQcisQdEedSsLSgqoqi82grzbwSCGiqxYcL6u8HitWRIgigMjKrhUtt4uuxTkaKbl96azMHK1SRGy9jLUgUnxEyMjn8VK1Ni/24bRygoaYTP3Q6n7osjbekyOFypRYwiIk4oqLDv3UJS4XvTuAAu6esEO0uNLvjJtsF/LFu66WiXetOXjBVnMGWwrEGr8pDtLw6HtVamSZaStFWjF6GZtPXtVvzqbDZ8x+j09OtNscmJUUfIfxlBpD/a53w8az6GM1uLOmAbRqR7IUzUVM1jYh3iwsQaIDqdY5mrwndO9H28BTfUNxUoUepshjMvNvzyQXJdiITi3e6lICc3rxJjnnFO/CM6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(107886003)(53546011)(6506007)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(82960400001)(38100700002)(66946007)(31696002)(478600001)(86362001)(6916009)(66556008)(66476007)(31686004)(8936002)(8676002)(44832011)(5660300002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002)(42413004)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1dkMmhqajlMdmFKT0dRZ3VBMEJHTGsrMXBvRVpDZHFkY2N3Q1JORDh3MXVa?=
 =?utf-8?B?SEx4QWJ0dVZIRlNVWmFLYlFxdVVvSjZ6Q3NZZWh5TDhoYW1nLzg5b1ZHaFh2?=
 =?utf-8?B?L1RmdEw2bDVPOHh1cnU4bFlFbnlaMTNaQXY0K0hqVXV3cjBIbUxyaVp2UXo5?=
 =?utf-8?B?eVZaNU5EYUE0UVNHakVrZ2t5Z3ZZdXJtMHRRaS9FVG0raGhjVk5vYUtZUnpx?=
 =?utf-8?B?Qi9DMitQYzlNY29PblB5cnNyckVRQVZTZ3NjTUpnb2I5VEpwaU5OVDVmWmxi?=
 =?utf-8?B?emJObURCb0NkT3o2UEN4Qjl4Y25hRlhGNzVpM3VrZ0xnTS9aUEx0M2t6STFk?=
 =?utf-8?B?YlZUWEVPcTc4c1BoMWU1WE9DcjZKeENkbkZpTit2S1FOMTI0Q0p1M2xuL0Fu?=
 =?utf-8?B?bkxkSGtTdHp5M3FMQ3R2SDNzVWpVck5FMStyS1hiWjZhMXBjS2w3d3RGZVVr?=
 =?utf-8?B?cVp0RWtNaWRNWXdQOWl1TFRTYnFQbHAzdzNSUy82T0tMQlkrNXk2cmZQWDFo?=
 =?utf-8?B?a25US3JrUU9tWHI1NVJqR0dCY3NvOWVJdjlKejBOLzM2WlA1VnY0VjRzUkNY?=
 =?utf-8?B?VllOeVI1L0tNUWVWMEpDcUtDam5FSUM4dFRxbjNoY1drNC9adi9CdFNKeklL?=
 =?utf-8?B?c1gzL3F6VnZydkUydnpYUkJVWFVRbCtXVXdrcHZ3QmlhYVl1ZG9xZFFucjla?=
 =?utf-8?B?MG9RR2p3YUV0UktPNnJUSGx1T0twWHRLVFZaUHlLY2hLNWF1VGxDaXh3VkhY?=
 =?utf-8?B?aGFocmVJRWJ1K2ZaWSs4UGVYVmgwa0l5K3VySUhUNlRrUHVPV3RzUG9pMTkv?=
 =?utf-8?B?amZsaTRKei9zM2tjTHJJVW1pL1hZOTNJZDNuTDlPeWRUbS8xcU51UlU2YUhk?=
 =?utf-8?B?N0RRTTAzdmlMKzJPRmNtSlJISWR3QjEvNlJaYnhXQ0wvdExzS2tnZHVHWW9T?=
 =?utf-8?B?N2hOc2tISTFkMGYxanBTMm5hK0MxY3JIaXl1WU4yVGU1b1BseUVCVkpKS2hC?=
 =?utf-8?B?WDc0WEdma2tEajY2bEJpY1QxRTVFNTNUVHRJaFNqVytNSjFaSlNYdnlzMTRJ?=
 =?utf-8?B?bHIrVnF4WFlVeTdnS2plazlpYlVmNGo2OEp0S0dhR1FHTDljWUQzL0hFRzNZ?=
 =?utf-8?B?ZVB4Q3VDYVZGUTBWdzhuZFEyT0N1c055cGM5MDJ6YVVhUGo2NituQzAzdi9H?=
 =?utf-8?B?cmdyUUQwcjRYWStxWXQ1N21sRWpyRUFVeFpDQkszS3E3c3QranhuTVVZNEFC?=
 =?utf-8?B?TWNhN29WVU9YQk5HSTFBR3BzRzIvWVdLUEo0c2NiNzVlQWN0UlM4L1ZtZmNz?=
 =?utf-8?B?ZUE0aUtsZFF2cXhUMmx5QTFDWFBhbTMzcTJHaDlRczBOOGJpb2hHcDF2YVRQ?=
 =?utf-8?B?aHhxaXE3cVV1UlJKSTBxcEVDQklRcHR6QTh0SzJIL2V0bXNzUUhwZjF5elFR?=
 =?utf-8?B?bnVUTEZ2V1FlLzRqNVZza3BNbWpJVkEyaWllaHBRd2tZdFRoZC93aFZqSXBW?=
 =?utf-8?B?RWtQOFl6RXhaMlBkdHdBWGZQWTIyOVlNSXJzaXdLOVpDRTJ4UnJFWG5LWnVp?=
 =?utf-8?B?Y1lZSTUzdW9UaGFLbUpGekRjQVMxbU1IOFJoVVhlZjJIbTFxMFUzQndOSUdX?=
 =?utf-8?B?WWFuM0xNTTFRaG04VCt0YmtjUTREZkQ0aWx0UFUvWUltaUdmVXhyeTVjNTNl?=
 =?utf-8?B?NnJnRkkyZUg2d2FTYUF0QmR4NjNUTzRsRm01MkxLT1ZpTlFDZFk0Qm04NEN5?=
 =?utf-8?B?WjIyM2hVM1hvQ3lrM0hiZ2NML1gxSHFQYW11bmNPczluanNPL2JUZmY1ams4?=
 =?utf-8?B?ZDBXYytFbmQvejRxK1JJa1BVSzN2RnRNcERUQlI3emFMdVIxZTU1TUk5Tjl6?=
 =?utf-8?B?UU1rS2ZRRDZablhPR01Gc0RTVWlsL3NGRkhqK3FCVjJyOGVSTlM4Z2t3d3dn?=
 =?utf-8?B?bjBKRjduamlyQ3UxZDkwTWQ0eFdJby96SjlRUzdVTVJyRlE0ckJGY3o1SlZl?=
 =?utf-8?B?eS9lODAyeVpIaGVHZjFMVzZMYkk0ZFBLQ0pMZE9FQ2ZDenZZWjg5cWVHdkRF?=
 =?utf-8?B?Qm9FMGs0bTFKYmpBSEE4Z0gwTXlqajRHczVmNlNHeHoyb3NQRGNtdVhzeXVV?=
 =?utf-8?Q?MCo0XOTJijkCZzsO+5T0pdLRi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b625397-1f0c-4fd9-6f0f-08db44e51a18
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 16:58:18.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJUSR++Y14dfDdsU2d25XfckwrkmRp2uutwBYtwHkO2U5VHGjM5hRaa4FaxoQn3Cae1i7Glx6FBhVLK/DBiuvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Enable d3cold support for dgfx
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
Cc: anshuman.gupta@intel.com, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 4/21/2023 2:18 AM, Rodrigo Vivi wrote:
> On Thu, Apr 13, 2023 at 12:55:54PM +0530, Riana Tauro wrote:
>> allow d3cold for dgfx as xe_bo_restore_kernel
>> bug is fixed.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> and pushed. Thank you so much for fixing it...
> 
> I also tested it on my DG2 here and it survived well :)

Thank you for the review
> 
> $ sudo ./build/tests/xe_pm --r d3cold-multiple-execs
> IGT-Version: 1.27.1-g1a619e8d (x86_64) (Linux: 6.3.0-rc4+ x86_64)
> Starting subtest: d3cold-multiple-execs
> Subtest d3cold-multiple-execs: SUCCESS (17.087s)
> 
> 
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index b92d8b5a391e..79cc0b8f197a 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -750,13 +750,8 @@ static int xe_pci_runtime_idle(struct device *dev)
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>   
>> -	/*
>> -	 * FIXME: d3cold should be allowed (true) if
>> -	 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
>> -	 * however the change to the buddy allocator broke the
>> -	 * xe_bo_restore_kernel when the pci device is disabled
>> -	 */
>> -	 xe->d3cold_allowed = false;
>> +	if (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
>> +		xe->d3cold_allowed = true;
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.40.0
>>
