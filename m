Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0E9C77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 11:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002A710E0AA;
	Mon, 29 May 2023 11:57:28 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966210E0AA
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685361446; x=1716897446;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=l1qhJ3CM4Yo0l7JWNcfFJmuHBMBJHYwPEWBuMcT7kMc=;
 b=JbvaSeq9piNEpI/adAo6IsqGos7ZtnOxy18quWNFcyxRe2TbETBpOUO4
 33LPecF4+G0E1IToSmUMy2HVX+U3hRdcQG5TU+Q8BjUQyoJiEXpP3bzIh
 7iYBn4JPIpv+cpRhqtlCJVMSJx1q0MDTOAT6eASboqeXipO3RHz1Xsfi3
 psp6auhSMG0/JTHO4XVTRCae0aS0rd1Bk2Gs1LHKFOOAKQJJ2bvvP0WOJ
 dgptLxOj6DjKFe4ZCobMZC4u5pRgvWzKr3XHLj0l7Ea8+LtcW6Q7y27ar
 RlcoM2lMfe0p0FGONt+pxYm8QTV5pKAS2dW6Mf0w9PiFkyt8YaVPaJ49j A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="335041911"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="335041911"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 04:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="775916568"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="775916568"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 29 May 2023 04:57:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 04:57:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 04:57:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 04:57:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JV1jvH0RgG2Kf440bR69JY1phJFlEe+CihhGKIl+tPQTEwNhDJ4z+jkPvnInF5oWzJM6wUdgN2K1GJlVbCiSav8j5UVLEp22MWyxkqv1+mAopYGGrjIxLKln3fixTjomiuXIR/CUApJXotI0zXwCP8qDprU+xMYnpl39qp3GdPSfKpc3jfqk6Y+AO7kE6DdCykNqVfNzgCz0tCnM9OrCT6bR45tKEg1/fGkmNfIt8QYuru010AU3oH0oghRDaae7khVHOhvYU4wRIMaxJFcoFdw4VPmRgemNgtlYfhnvb/ki2jQhSnK48n23UjTkhOmX71JNcGnw6mRynr0euKE7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mRZtYXcTl8BwVSSkS+9wJ0BqQFPUCN2k04Iua6pe7w=;
 b=T/mKKYymPtZ/A3f9i6JIGqUDffzp4igvV61bZxriUjs2Hy0w/J3pY9TXgbS6cKLprJTHP0y0R85EsD9wANyyOTX78WRSK7lAU9sq6Pz94O/P7f8ehsoPYUJsMBRKcPLQXaDS0awrTCzxPuVOvo0yC2oFPGGRlqF6NVTBdSscz3uTAZG4EkwUkRqI3Mjg/OeaYELVQK4brBfZh62pJmUlIXdSTw/iZ6kcoaWr6pdu1+yb+O5Qa20E2P0U7/nrdX2T9zIPS+AZIEImr+U9kz7crKjZp8uAZrVpcifDWO6KQ6ejBy4FmLvmGC0nxCAoiko0reGo/HFJEN0sr96RzuNVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.23; Mon, 29 May 2023 11:57:22 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3a23:193f:52c6:9e1c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3a23:193f:52c6:9e1c%6]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 11:57:22 +0000
Message-ID: <13afb0d2-0d69-7537-d345-cc1bc87ff920@intel.com>
Date: Mon, 29 May 2023 17:27:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230529092703.1451203-1-sujaritha.sundaresan@intel.com>
 <e7a781ec-5f4c-2029-10bc-698056cb37bd@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <e7a781ec-5f4c-2029-10bc-698056cb37bd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0190.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::19) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a1d223-2f0d-4c8f-790a-08db603bdc06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HP7pdD/AbEukk/9t3gLetyyhvS8BEzeZX4IWaQbQjwKbXJ4q5b6Ol8xEHXxiSo7YdmJlE5RXYZxIBDiuFoPmLHwJIg87vJe9bWBYqygDU3/lfUVHugOAhBwnoRsnXs+q9Qj/IvaL32XXoxiT1P4Z8fxGMrZHKlKft01lqXC3yyBZm7aFRXjb4vlEsaIiguY0k0Fq6T+3vBuvkEiMvI8le7U5XdOfWBy1mTqFITpepkj/7aN6viTkIbdrl2l3zFHWmLovnAXiw6DwFwEjiJtJElLzld87Mjr0vZFp8M68XFp4O61xtE6ktfdo5od/oAFV5K/OWzqa1awvWMhyHr9ofpt+0lP6Vj452NMuwnc7q8CcwFkcMz11jEekwtWjpYUpeILErcz0Qbf751EEVfZOc405nOM7Sh+6SAx96n0MeskqXFnBC5p4sXts1f4HDmTBBZHWRQ9/a4B2EgEw17l2HzYeiZ9AzziWdsPDMWAjow8t/gG2nX5GriNVXSNTJPIbIJajd551hYrQ0tL0ylSIsZPlrALpkgjIBzxvXEcUtDby9xcD3EWodiv5nD3N3WJpJ2h4Ls3dr8v8cSklAqOBN3afDSkd52IRd5fm5EvSmjgK3WH9WA5ltnY+2V0nn0r9+LDgYKpawOaKrdOvycuh/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(38100700002)(31686004)(41300700001)(6512007)(316002)(82960400001)(6666004)(31696002)(86362001)(8936002)(6486002)(2906002)(8676002)(2616005)(66946007)(66476007)(53546011)(66556008)(36756003)(6506007)(26005)(83380400001)(478600001)(5660300002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVpTTG9sL2Zra01HOElsMzArY00vd1cvMWltZTFaaWVUQzlPbVQzN2RFQ0Zq?=
 =?utf-8?B?TjJ0TkJEY29qWEZ6MW5vWXZiVzJMdXZyMkFTUGV5K0RrN0U5TDNJMjB6dUhC?=
 =?utf-8?B?TzMyd1NPZnpvL29WVmwwME9UZDRVR3oxRGZUcmptNFh3Q2ZUYUVrYU81RHhF?=
 =?utf-8?B?QXk4Z0RKU0ZVNFVzODlWQkdKYm9TcGFuaHlaT0ZVaDBGTlphTFJIRzIrR1I1?=
 =?utf-8?B?ajNqdEVJelZ4UFJFQU8wNFRyY1lxMXBwQ25UMTNrNmxXMnNSdkEySkpyTlYz?=
 =?utf-8?B?NFhXdlFuemM1SkZOVXVPTU1sOW85YksvdjNyWXJZdTJpL29aOThkYWFwV2l3?=
 =?utf-8?B?T2F4dk5BTW9uVElaZ2VUZGdubjVwM1pGZWpRTnFOcUFOU2lqZjhnZUdwMDZ0?=
 =?utf-8?B?Q3ltY1k1cHlGbnRha2c5UC9WRm1qSFBUVStrdE5lZkF1S1RtMGM3WmZTWG9C?=
 =?utf-8?B?b3d1bmlpTEhENC9BQXgybTZZa0hVUHFWcURGK0F5VlgzQlk5QkRIcFV0T2Mx?=
 =?utf-8?B?Wm01TlVXYmIxandveFQwVHdjdktIa21mcytXNnA0RW9vS2pyQkh1Qjc1elNo?=
 =?utf-8?B?aGVjSmlQUGxlV21jUmVRL3UyNEpFbnBQb3U1djVDbGl4UHJBU2JQWU5RTVFO?=
 =?utf-8?B?ciswWC9kOHU5bWJMTXBkTU5qeE1kSmRyeVdMV2V0ekJ5Vk1kN2JtbEZLdHNr?=
 =?utf-8?B?c3E2bThMbUJkRFpWVkd6aVhlWjRGRlVWaHV6ZllUM0V6SkNwSzkwaUVKSkVC?=
 =?utf-8?B?RGM3dXV6QVNEelhOOTR1dDJOK3Z5Njkva1JMVVlRRHlXU2NNUGxjTXJTK1FJ?=
 =?utf-8?B?WXNaSnZ4VlRXczFMZFg2UCtELzFnREl0S2pGOUt5RmRXOGRHbFhoSG1ZYVpF?=
 =?utf-8?B?UDJXSTliM0Qwd0FBdG41dkZ5bHdJS1ByeWpsU0NCaDRRTm5ESDdIb0RGZ0F1?=
 =?utf-8?B?aUZocG5ENmZtcWNqbWFROG5SWmhQVnc1dEQ2amZVWnhPNFh5ZktKOCtVL2xj?=
 =?utf-8?B?UVVBd204SzFBTVdyWmRFVVpSV2pQaTlhMEhzak1mOXptOHJBdWY4UVdUb2Yy?=
 =?utf-8?B?NCtlanpiM3gyQlBkK3U3ZmdSM3ZsOEN0a2IxUXRaSGNhNzZBTjhZU3Z2UkF2?=
 =?utf-8?B?ZmtLSjFLSzlzdXExejJPT01FVzRJdnpCWDZCd08vak5mcHorakh3SHp4K2h0?=
 =?utf-8?B?RC9oUkhKSmFIM2VRNytsNXhBN2paSG41U0oxT0xESitCTTA3TG9vTC9URnlR?=
 =?utf-8?B?WTVKWUJEOGdickZkcmtXTmRnY05TUU4yOFN5TE9SSmdYZlh3c0ZZL3FJZnBk?=
 =?utf-8?B?Q3c5RGJmWmErWlpjZTZzRVVpd2FLSlBiQWQ1d0puU3pKdjRsZUtOcU5sUTJZ?=
 =?utf-8?B?YzBrRjAzSTI1K0l5VmprMy9tWGY3WTQ3S1c4dytEc1AyS2xyeVFoOXlVempS?=
 =?utf-8?B?NHZJRWN5OFo3aVBvRWZ5VWlFQUNDNWEvaURDVUJRaWFBZVpuMUVYZ1lSNDZT?=
 =?utf-8?B?RmcvSFBoQnBjMXlSNVB6LzJqUTgzZDF0MG9EK2hhNG56UVFuWHZTWElxZnRL?=
 =?utf-8?B?aVdmbU1VVmRoc1RNVno5SnRCNElYdS9GMlR3L0FNQVhvTHBrQlNkRGNXRk5a?=
 =?utf-8?B?c2U2OXAreGJMSzA2OEV1eU9LcnNKWTBzMXR2cUs3NzN0LzZzYUVCZXNNNUp1?=
 =?utf-8?B?S2NmUjNqNVBNek5ucmRwalRmVXp5MnBVVTB3aDZvd0lnczFNOVU5Zm9TSTdq?=
 =?utf-8?B?YlZ5UmJic25XVGg5YjV1eWwzOFNBM3MrUGd6M0VwRXl2MzNIZEFscVU2aFcy?=
 =?utf-8?B?QlVaMW1WL29FWWpsN1JrY1VwZXNSOHdGRzBNdzNLZUdlNzdIb01mZjQ1NER0?=
 =?utf-8?B?bGxLWGhvRTZueEoyektSaE5Zazd2WDJqM3ZWSlVPbmJEaFBWdTVORlhta2FT?=
 =?utf-8?B?blBZRk9tOFJHUGRCcXZ4b0hsYW9PbVBXcS9MdG1lYmdsSnNRSWRqRkUwcUYr?=
 =?utf-8?B?d2hISVhRWkRhNHNDdklITmFSa1hiK1FkT0Q1akhyMmNzb3c1S2lqNzBuRGxF?=
 =?utf-8?B?dXhuTERya3l3NEswcmZpYVNwMnIrOEFWZHBDelFiVmF2WDZpU1l3VTYxcGpo?=
 =?utf-8?B?Zkx1c1N0MFpNWDdPUUFOb2VvWHF5emZNYkFyME90RDNYMEFYaFhacTIzckZR?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a1d223-2f0d-4c8f-790a-08db603bdc06
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 11:57:21.8554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NztTyl0+x3FiEgTAvSs18FjvwxIgFQlbqA8l+/iwSqp1bRjvHhqw9twEx24nmYiHa+IFhxMekdG7jdNTciPPVY5pzy/FnJdwU9as+X8lFBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add a sysfs node for requested
 frequency
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


On 5/29/2023 5:00 PM, Riana Tauro wrote:
> Hi Suja
>
> On 5/29/2023 2:57 PM, Sujaritha Sundaresan wrote:
>> Adding freq_pureq as a sysfs node to expose the frequency requested
>> by the PUnit.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index e799faa1c6b8..8a1b3bc5d397 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -62,6 +62,7 @@
>>    * device/gt#/freq_* *read-only* files:
>>    * - freq_act: The actual resolved frequency decided by PCODE.
>>    * - freq_cur: The current one requested by GuC PC to the Hardware.
>> + * - freq_pureq: The frequency requested by PUnit.
>>    * - freq_rpn: The Render Performance (RP) N level, which is the 
>> minimal one.
>>    * - freq_rpe: The Render Performance (RP) E level, which is the 
>> efficient one.
>>    * - freq_rp0: The Render Performance (RP) 0 level, which is the 
>> maximum one.
>> @@ -425,6 +426,19 @@ static ssize_t freq_cur_show(struct device *dev,
>>   }
>>   static DEVICE_ATTR_RO(freq_cur);
>>   +static ssize_t freq_pureq_show(struct device *dev,
>> +                    struct device_attribute *attr, char *buf)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +    struct xe_gt *gt = kobj_to_gt(kobj);
>> +    u32 freq;
>> +
>> +    freq = xe_mmio_read32(gt, RPNSWREQ);
> freq_cur also reads the same mmio. REQ_RATIO_MASK is used in freq_cur.
> Is there a mask missing here?
>> +
>> +    return sysfs_emit(buf, "%d\n", decode_freq(freq));
>> +}
>> +static DEVICE_ATTR_RO(freq_pureq);
> Maybe freq_punit_req?
>
> Thanks
> Riana
>> +
>>   static ssize_t freq_rp0_show(struct device *dev,
>>                    struct device_attribute *attr, char *buf)
>>   {
>> @@ -628,6 +642,7 @@ static DEVICE_ATTR_RO(rc6_residency);
>>   static const struct attribute *pc_attrs[] = {
>>       &dev_attr_freq_act.attr,
>>       &dev_attr_freq_cur.attr,
>> +    &dev_attr_freq_pureq.attr,
>>       &dev_attr_freq_rp0.attr,
>>       &dev_attr_freq_rpe.attr,
>>       &dev_attr_freq_rpn.attr,

Thanks for the review Riana.

Looks like this patch can be closed out. freq_cur already does what this 
attribute wants to do. So closing out this patch.

Nothing further needed here.

- Suja


