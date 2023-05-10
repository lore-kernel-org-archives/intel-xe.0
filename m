Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293F7C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 13:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D192710E077;
	Wed, 10 May 2023 13:18:39 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D9810E077
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683724717; x=1715260717;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HXEcEHjfmp+6EDTxy5c42rd2p95HLzLcwnbAPxXgmBo=;
 b=NHjnam1ualR3aPfP0FBFH5mc1rXpnoHXRR/HUuhVrq2hbljs5hReWbgP
 uTasgXeDjBvV5p8VCj0QwmDK/mXwhDls131whuRstUXqRk148tQKqLtG1
 dQKZgoIZ+cgXBLAI1dzN/qawj9yc7KFN0PdF5JnXOmYHySm5TjB7J4Gx7
 ZslOV4/o4U4bH9OFFFFH/vUl5HtU8f2yMJITrOyTmIqDlGGBj9qEZFTR8
 G+JelS9FYF6fN6m3r3pbKqToJbqcpdlNH5JnT/jb4ktJRWTAyKwWPzqlr
 B2Qh/alAah5xCldEEInODpowPwblFKPELPOqlc2GNMNbGS8Up25u+87PJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378309546"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="378309546"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 06:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="676844376"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="676844376"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2023 06:18:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 06:18:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 06:18:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 06:18:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 06:18:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYIextXjWo4RemhnpFIdx8Bs7wiT2tKFGuztweI/rfo1RmH7t8bnAfoNmmZPU92DuVbf93p8BTtz8H/8jNr6pK+g6v2mqBbRBo+T8CnI8Fl95dScWREdRxlSIlSlcLLFV7iFq+iNYzXDhWz8DfQAnc6Z4lG7jo05OjNalp81CbnT0lhaby8QNqpFDk4nyN+MhVe2U498JnshVAPYPt1vei2SKKp+sCJcMTNA7OkAYvpMp/vkeIY5K+vC3PxDtxeAqB6B9FsvdZbi6PgDamWsJ19y5jG6Cs5DNAlZXeETnOqOuTd9IWjinUcKIKpHVfe/YGL3zmLAb0553oMemOhh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97Am32dNX4QcEJSlbhMVFjEWKsZE1tmezPp6cdZEaHA=;
 b=llLABWaPVw+2sveFfkkImuvC1WF32E3/ZE99b4ugH+5ckTeD/A2ssmEpLrUGusd0XAQXEUCC3aziXcaH67D/BQ0FV47RtCo18O25KqrrUMkX1DEcgR3Ijq65z++YA2ViEQW0+9l/EPmYNqqSATRYG/mj7kZ591QqVOi25DIyvvSsvx73Jfroroxcs/NtVVmbZs92cNr78RZXziDBesdgYQxpkPvZhB104S7Y0xUoit+TJpft+Hxwi558pGvuk43mfEufm250QkQdVS2KviMCqiyPbXaOlLTGvIN0F9GAnuoY6SKHCrDamKoWJIC212kgNo99a9+B8bEmANj8sD6ASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 13:18:27 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::756c:718b:566c:9047]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::756c:718b:566c:9047%4]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 13:18:27 +0000
Message-ID: <7939b30c-2716-3723-c7ed-d69f76509a0f@intel.com>
Date: Wed, 10 May 2023 15:18:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230510130004.28490-1-nirmoy.das@intel.com>
 <87v8h0miyw.fsf@intel.com>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <87v8h0miyw.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|PH7PR11MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: a7eb9ddb-a51f-4565-8500-08db51590a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Px6R96r2UAuhgrcRyu/lElSjwjt4JgyTn+tRfjgJ6R30pHeR+ITlViXie/RF7Gr0z4z2nU7+oCoWPtbqhctR628Sit9JbgOCE4vGz7viBSQxpk5YuYGuTpkT5b21s6lBEemMfph8xOKWnaKUiTqX4Ticct7HEzxiTRTEhnLZbPWp9lgqZ8mKsFn+gBfnlQiTmD3JDerneQoNPjJt6+aIchDY0R11py9SAErcdGHEfziXtOzubJTYpqL7pzW8BA6vTclwcZXs2cxO0V/wjfn0EWNOr7FJN7Pp4CxDFZyDm2GkWY9i9ou95uuD30P7fTj2cDBnzbalCpUmRSydNTQyiH8xBed2lCLI5Sy1LYXMpdLXXeBGcKFQbjy9QHLTtz6Xwl6L9mSH3NQx4vfGfnd912S1QFlepGPnPbyTkSXSYe+siqAeTgi7v46TdU4qUWdZaVISw0GLEAVtJbHGOGTA4Xg4IRRaqpdagv4PwSQy/kB6VF7aSd5hVqRLn3sp1JZuLfzskzfIufEAkqBIMbhPsA+73c5O3wDifZsIWrrZWASjHhKfnHH4wvuyL+Ag7SZuaMKkzq5p/wWJsK7AISlAKTmnLKR1EOuNZqxKtUT473hG3Z37FnO+G9XcYQwFlCfnBmCQvwtz162aybe8arkkew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(4744005)(2616005)(2906002)(186003)(478600001)(36756003)(6486002)(6666004)(316002)(6506007)(41300700001)(26005)(6512007)(53546011)(38100700002)(82960400001)(83380400001)(31686004)(66946007)(66476007)(66556008)(5660300002)(31696002)(8936002)(86362001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TStMcnAreFBuMGtURys2VURqUlUvamxEYXlrSURNM01lVXlHY0hwQ0luSGp0?=
 =?utf-8?B?R3ZmTDNqb2RyNitoUWlGZFBaQzhFTWhFRDlNYWI1NGVMS1N3OWo2Q1pGejhO?=
 =?utf-8?B?VENkeG4rNXo2YVk3SFlqeUhYUnBKR2NuMGhaVy9VVnVnMEJ4YzdENUIyWU1Q?=
 =?utf-8?B?UVJDdk53YWtGYmpvNFpUMTNWb01GVUNyUG1LcnUxQ0EzcHA5MXlEY3hFcTdn?=
 =?utf-8?B?VDJoYmh4N2dIWnBZNllnMUJQdXhSYm1xRHhsZnZGUjFlajBKb2tKTVNlLzZa?=
 =?utf-8?B?TFI0VjZvbFVabWh1YUhrSUh2TVc0YlBIUW9HcHZicDBOYlBZWERRUjBMelZk?=
 =?utf-8?B?MVkyY1pmSU5PTlBPL3Y3cmY3Qk05SmlmSkJJYVlMdU1MSElvbmsxWlArMGZZ?=
 =?utf-8?B?Q2xlbGNWN3BtYXFZSjJkSXR4M1pCcmYxQXZ0U05IK2pYV3lXRE94eWloT3l5?=
 =?utf-8?B?VUhmREhOUnlMVjFtZTNMTWk1S2lCSjVxZUw2dFY5aHppdFgxMVY1YlN3SGdj?=
 =?utf-8?B?WWl5Yy80SlV2dXFVa0puNFdMZ043ZnpXZXkydUZBbHIzeTJUdytYMDRoN2Q1?=
 =?utf-8?B?d21rMmhuR1JhVlIvakVuVEY5dGFkQ0pTTjA0MVJBOTNoK08zM2pQVTJuV3pQ?=
 =?utf-8?B?SHoyYVJtNjE2eFByMkF0WWt0NlNrMUpFOEpBclRnR1h4dDU1TVVGeDZoTkVh?=
 =?utf-8?B?U0p5TEo4c202amNFWDhTcE95aEpmMmQwMkd3TWsxVmZhQXNYMUtOQzkxUGF1?=
 =?utf-8?B?dDdselpqWHhLQU5mQ1BjUWVwK205WTdtRmpWaTRBelZhSUNvbG5ORDlsaFRo?=
 =?utf-8?B?Nk5PclZZVmh3TEUraENnbndob0VvbFRrbWhFRjBHb3JmcXUwYXlycFlNWkRW?=
 =?utf-8?B?ZDY0Zld2MFROdmpPY1hpMW0veFJaOVc3cWVHMFhCcnZnQlBEaWVxRC8vRytj?=
 =?utf-8?B?S1FxcE0wcjEwZWZldjRTb01XLzBVUVRMVy9iRThNYllHdnNiODc1blRLQk8v?=
 =?utf-8?B?bmpBbFpTcmxidmszT092Q3M2czQ4NloxRFA3SmZkU2xBZ1N0dVF4cTNpMDVP?=
 =?utf-8?B?WlBZSlRXblVvak5DZVJsYUFPM2FtTDNLZUZSTmc0OURDbHhZYUVFbVhZZzlt?=
 =?utf-8?B?MUpRRnJ3ZnV2K0NzemVSMUJQeHZCd1U5RC9qODhwT2s5cjc1ZWxScjhJVHpD?=
 =?utf-8?B?dGpGcFFDdTZLZXowR1ZZQ3lxUElnRWE1VGFvTjNzSHh0MXRzaGFIclJNbFNX?=
 =?utf-8?B?T1RFSnhLcjZkRUVTdm9nbmt3MS9RL0ZGSGs1eE56bXRqN2hXcjc1SDZOd2tI?=
 =?utf-8?B?UUI2SjNYakhGTGVSR3VROFRyN3JuTXhmYjcyaGR3Y2tvcTZCK212cGRjS3Vv?=
 =?utf-8?B?K2JOK3VoNzdUMjFHcVllTFlBT0VZMTB2S1BGcWxSSFNBV3pxMWkwT0cxZHBs?=
 =?utf-8?B?N2w3dlV6b0k0YlBpcWlPOUtveTZrRVRWV3NUR1hOcWZUU2NqVFJXbCtSNWlT?=
 =?utf-8?B?R0ZZV3V5QzdaaGpmZDBianB3cmZwa1NQK0ZFNlNyQnh0Nm1OdnorOUE2NDlt?=
 =?utf-8?B?WEg4dHV5T3UzbUdHTVkyYWJPaWZVeUhueGNPU1U2ZmdKZmZxMUVZN1U5ekZk?=
 =?utf-8?B?djNVVis5YUJjREFlcDRrOHk4c1JGWXdFZTcwc3IzSG85b05hd28wb2hNbGpW?=
 =?utf-8?B?WS9adVZNalVhb2FYbFd1ZjNoQ2pmZ0wzd2tkTTNNUVlmYnBtaSt3RVBLbjUr?=
 =?utf-8?B?OEJWdTIvcEtQNlNFdHFYMUwvb0RuY01jd0l2TGl1SFRQOGJRaWhzUWx2MzRQ?=
 =?utf-8?B?MXVBRkJPVU84MGkrcmFkSk5oRmdVSVFtZkxnZmxITWE0dEtXTk0zRnc4UVNm?=
 =?utf-8?B?dVBxa1Urcndic2hhZ2Zyb0JBRHpCb0M2OUNJNnd2bDhuZC9UQnV2cWd1ZkJ0?=
 =?utf-8?B?S281a3hXOXFrZ3RIbWY2S2RDMlFxd0xTcDJrNEo1ODNobVRjejcrL2s5WHpx?=
 =?utf-8?B?Nmd6N0lhdHlHZm1oSG1MSWwzOFkrd2YwY1piaEN5Y1JRSklxMnNzaFFNRnBp?=
 =?utf-8?B?WERYLy9SdVVZd0g2Y1orcWhISm5MRFcyZ1JmNlB5NlpDYUR3SG9TYUtCQlRw?=
 =?utf-8?Q?YvQ6QOIpxoEn8Cj2aCTqU9i6h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7eb9ddb-a51f-4565-8500-08db51590a75
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 13:18:27.5208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OD6Yn0m5UjHbJicILMlOdVyZLgp8zF4rfKavHH5J6n32kVfAsIdjLSDqNlORhDJExbOV4lb4ufPXTnlSOaa8OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Unlink display before turning off irq
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


On 5/10/2023 3:09 PM, Jani Nikula wrote:
> On Wed, 10 May 2023, Nirmoy Das <nirmoy.das@intel.com> wrote:
>> Unlinking display will lead to guc tlb inval timeout for
>> the fbdev vma as irqs are disabled.
> fixup to display enabling?


Works for me. Do you want me to resend this with fixup! tag ? I am fine 
if you do that while merging it.


Regards,

Nirmoy

>
> BR,
> Jani.
>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 32cc83c43b2a..430bd6eb4053 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -349,9 +349,9 @@ void xe_device_remove(struct xe_device *xe)
>>   {
>>   	xe_device_remove_display(xe);
>>   
>> -	xe_irq_shutdown(xe);
>> -
>>   	xe_display_unlink(xe);
>> +
>> +	xe_irq_shutdown(xe);
>>   }
>>   
>>   void xe_device_shutdown(struct xe_device *xe)
