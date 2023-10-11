Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC56CCD98F3
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 06:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB18510E46C;
	Wed, 11 Oct 2023 06:52:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742A610E46C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 06:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697007140; x=1728543140;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bbEqLq0ZFqLWasTo0VeU1FQ2J3XgoBXZbH08WW1HXfU=;
 b=CW/dOvAoXqin5i8n/uFPNa+B5InEETDEETHCJLYzMfPpW4bfxYXqVwrk
 ByeDuSToFGeeyKtoRuwqQCxPjCwULZArU+OJRElDyTxEejkIdRIDko8ed
 lRqyY6b/ejZG71L7JPlxBy8n3xS9BBPv3EIvdlh3/aYMaBXZJtdPsJ1Fe
 pPfNFmGN82/6mBZRLd0HmB2DbzyRdJXoxTs3k5nmvhYPj4TMOS2dN6xgW
 MbQQAqZG3L2gEWoxk3Mblca/y44zf0Mw+zXUhD195pdXKlkSgSLOEalhn
 W6/HptkwS5dStsBk7xkMxKiXVxlh3wr1MxX3xP+4vPemumBAZ46Gc2kh8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470857726"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="470857726"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 23:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877554623"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="877554623"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 23:52:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 23:52:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 23:52:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 23:52:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 23:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYT47I1ze66f3JDmMT3b7f57/jM+/5Z6kTrnVkmKPor4KXjROw+R/d0HmzpPb/tuDOSSzrr1qnFMSO5W/PVJ3JkSDfWFMU+iWcUz9CDp0mQ8wvA2U/iKZjPDZHgo45p9IAV/1J1Vtkh3ivw3NNlHSRcoBzOHBxgS4bMkxJJzOpkTRXE0+ttmEe5WJYymy58O8i89SSDsfaRG5aXoZqXFTlu8A7xVQztCKoKhLut7I836O+lUHJWEouyU5+oVDQ+ZF03NNrAvCvIPMHbb7QjsZhgywy6rFWT9x2z9y7M24+H3Va2Y/Nndk3SfXjTbZX7hhEuJhHCvG/gFB+a11WBO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojgH1MYpu1LFp1HS7RdlAny2VqKPugd5ZQfusD4MxsU=;
 b=SRUolw9tnYp3baYv94/k0a/4znyipD6Y3BzY0CrtDqUvSDY4TQmjt8vD7P3iM3R9kqP1fIGsBvMe3x96utfWnxoRA75EQuH0Ne6EqOxwlo85BTArsNlm0YJ+cQQu7cjbhE4QY+Kp2AJRaX2IJ3WFOT4zwsCeMNFcOWnPzZn2eh8bVD6EHMv5b3ZVzgHli+4Jg/BkXFmKpM0THH20sC7GuF3Rbg+H6rA8WxVdoYfvBS+rFFApRns23WqnSXpxnQ2jYHkj4U+pU4uZuE1fiZJe9GJPSUHak+9tihK8WWqkns/AprDf6Rhppz7heBFlI72OVLU/d6ESpQcCo3XP9PS2zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CO1PR11MB5025.namprd11.prod.outlook.com (2603:10b6:303:9e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 06:52:12 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%6]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 06:52:12 +0000
Message-ID: <ba352668-c77f-4b65-b487-ac18edaf26e8@intel.com>
Date: Wed, 11 Oct 2023 12:22:01 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-11-himal.prasad.ghimiray@intel.com>
 <c083d229-bfc1-4acc-421f-246d9be66f07@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <c083d229-bfc1-4acc-421f-246d9be66f07@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CO1PR11MB5025:EE_
X-MS-Office365-Filtering-Correlation-Id: c3443c36-1794-4eb0-5c4f-08dbca26980a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqTJM/Wt6/DVwyjBPHibKOWJnJQF9aS1tqxaxHXt3CLXkUz/cepWrvni80YWrMDJXx7V8vVopZg6uGP33/7ihwfGpl7ZAx6Cys6j0lNWgCDrqRKNidHy8tvm4+LVhOBcdVOgiJ1qlGNU4L/h2C7R8VD0neIzxKfgkMcQd61NEgYb0sCBraCIHNQCt6GfYc/ppCYzVwB//uNOr0q5BeAHI/Ap+LfQScfY558zydcN/SlCb72PBE29a2UpBTtMFzPPgQWzNBwwiUPH8NgxwDbpoScZ9ljjkmlIMOeIaApGeJ3rAvDbdoAlZr5j8TWSSVJB6DHex7CnK2a9Qxh4IesKYYGerM+wd6BNL7Lant07I+eEEtE7HhyG5xM6p/zxzbHngDnoNHDaeQ7GuouQywSYRHByiaaOtHXJbYyfx9JAZDo0ExbCEflD5OM+36CCRtHLXkSMmST619Q6OIr/V77lDHoeo0gRsw0LKHe66tzbAXoRG4uxog2mq9M9QSqNot7VKrtYV7vjm7VD1hTwQR0EGsjfSbBxX93Hc3j1mvU84wfLX4M3d4S8WoXRmn2GHyplHiSMEIX9ZDUPairoLLAYdabQD1zys64nbo29Yv6j8bxTXzfbhSxLIbKAdxsT5fDzX1OpW0HNMKxi8lpaDh2X1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6486002)(478600001)(6666004)(66556008)(66476007)(316002)(66946007)(86362001)(82960400001)(31696002)(2906002)(8676002)(8936002)(36756003)(38100700002)(5660300002)(41300700001)(26005)(6512007)(2616005)(83380400001)(31686004)(6506007)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWRydmlSSGpFVkg2NklpSW94NnZCMlZTdG92N2JWOUwrWFhSRk1WRk9qWVlT?=
 =?utf-8?B?NXZsUG5OZDJyTnZZNEhlU3VqRUlJNTh5NmhsTnJ3T3V0OUJ0ZzRJVVp4WHBy?=
 =?utf-8?B?VDNlOWF1M3RZNzFUMy84Z1YyRHVSUHNaT1Y5cE5VRXVaZW1iRzd6elowVnly?=
 =?utf-8?B?bjZDbTUvYkFFeVNkdGhLUWd5UU52YmlSQXlWWGxJb3hTbkhISWpFbktkOFVN?=
 =?utf-8?B?aEw2TnBJM0NkK2lBQnJGU1JuQXUwNkJtZWh2Z0JmT0QzeW9xWk1aUEZNalhS?=
 =?utf-8?B?NTZVL1hkN0w1MkZvUkJxSFUydFpldUFBRVF3WmdYVUFuN1k0Yml6aUJSNWpr?=
 =?utf-8?B?OXdwN2tYWUpXcTFtcUZSM1dTQ2NXR1lSRkQwS2lXSU9MUHFqak1OMi9mV3ha?=
 =?utf-8?B?YURjZG9HKzZyVEVaM0t1T2IvOWpzaFN2UnMwZVJlS1hmaTljZ3I0ZEgvNCth?=
 =?utf-8?B?dm1TazY1YTRSU0JqWHhWN0xEdVZQU0pGbGhJeGdwaDBYQzJHVG8yRVdKMTBo?=
 =?utf-8?B?RTBlUUhLa04wcXAwQURLeTVRTUxPOE9pUW9TUFFHd1N4amZhVUlzZkRqR0Ez?=
 =?utf-8?B?am1Xd29JeENURld6Z2dxYTk5bVFLcFo1Zm5XSzBMT013MWYwRzNENEhVYkRu?=
 =?utf-8?B?dWo2aS9paXZZeXdoalN3eUJtR2JLMm8xTGRaa1FPM0FBVlVqSDRqbE5mZjJl?=
 =?utf-8?B?MitrMmdWSG5tRDhKOUFsUVBSc3VpNmlLL0xObWI0NGgzNFZVNHcyVzIzTVhj?=
 =?utf-8?B?RE5Zc3ZWeEJPdGM2eFUrdWt0VnRpRktVT3dlWDhrV2lOSjF2aFN3YzVVTHh5?=
 =?utf-8?B?dFo0b0RBV3FTeExxdmpGWnlZVEdaR1IyM1dNNmRtdDJERS93bWdwRmlhZDU0?=
 =?utf-8?B?dk03RCthUlg5NmErYjQ3Skh0c3ROdFBSSjlwNFlvcGlPUXU4Z3lVT1lGSmpl?=
 =?utf-8?B?Um02VmQ3a2NHN3Nxa3JKREJ5YkZ1NVJmanNMRGoxeFNiWEI2ejNlVld3VENw?=
 =?utf-8?B?Yis4NE95UGVlVFEvckgvbEdEbWpLeC9BNlpFR3RxblRUamFSM1FtTUtmWVpN?=
 =?utf-8?B?NVpnaVJEaW1CcWM4N3U0L3FSNzFNMTZIMEw4NlRBOVdmQkYzc013K01QVlRl?=
 =?utf-8?B?MEkzVWhsV3MrNVFvS0FDWVgrUFhSNlBYRERNVWhMMEN6YXZ6TUJNdW8yVmI2?=
 =?utf-8?B?KzVxNkl2d2hoZ3JkbEpDVWxZSkNoTHVVSk1jd2U0K2lGeENldUs2djVnRThB?=
 =?utf-8?B?dXNDZkNNQy8zVVB2TVVsRU50VHROaytsVTMvSHAwVkRXNWQ3cHJrZnk0Z1Uy?=
 =?utf-8?B?WS9Kc0cxWXZ4Z2tweWRKc3B1TytUdGZZRzVuOUhYUkJpbmZaR004T3ZtcnBy?=
 =?utf-8?B?TjNwNTZTWnA4WTlYbUpoa3RwUUtnQ2ZDMmVYMkZXTnNqV3FJRk1MR1dIRXpZ?=
 =?utf-8?B?bWdPeEJCTEhWdWhUcjBUNEJpVGFMRGlhK3JKQ2NzZzR0MUFyWHB2ckJET29y?=
 =?utf-8?B?dzBTT3pUMHZRTTluUllSeTRHM1hic3RKdThSOFpqbjMzS0k0K0FmZkZxNDlq?=
 =?utf-8?B?ZjlxaW13WGJDekJVdFhoV3I5K2JScHZ0TGZsbDRHU3BZNHd5WkVrOE51eWJk?=
 =?utf-8?B?TWh6dmRlU3FBOUJyc2d3R21mOGd0bGc4Tmdod1FDQ0FCWjhiNCtIVDN6SFZ3?=
 =?utf-8?B?dkdYRDI0UFRZWlhkZ3o4b0N6aTZoNm1oQndyWDY1QWZVbEhNdHdrWUZpUmRY?=
 =?utf-8?B?bUxHTG9CelJSVk8yRWlwbjBBTXhxUkxQUVl5K3lUSmtTLzhQaXduK05NTWFY?=
 =?utf-8?B?SzJSbXVObHhrR0trb3diUVZXcjFpTmFONG1BNU50blRjR0p2dVA2UXA3QVJO?=
 =?utf-8?B?bEV2bXRTYnZUWkZ5cW53TXZYYXoxdXVRejVrQ0dZN2c0NXhwZlVrVHlwM1li?=
 =?utf-8?B?RUxlcFdhUFpZRXpwTVo2WmJKWkhOYkt3ZlJTTUJjbFVJOFNMU3c1aHIzUVl1?=
 =?utf-8?B?L0pJQ09XWC9QNWtyZ3dpOU9NdnM1REJpODk2QiszbkhNVXYwQjJLNTIvd3VY?=
 =?utf-8?B?eUorYnFWUkVVdGhVei9JN0txTU9QNEhLUFlMZU5YK3pDQ1dJVXoxUVlrZWlS?=
 =?utf-8?B?cE5jVklzQmNQQ0lBZlphYU92d1R1TW5heFRTVG4wcHcvdDhNK0xjK0ovTW1L?=
 =?utf-8?Q?XPKGu65BxhUuwJtA631Frdc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3443c36-1794-4eb0-5c4f-08dbca26980a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:52:11.4572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVFb+J4Ba2xUk9M5NEdbYUlia1W9fRzHofssow0aQYw2ogtto4feHKDLbNDnQeS+FCviLO6Ri+Qqh/ZFmr0pfJiSX9YtxBDWDEc0Z0LfH7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5025
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 10/11] drm/xe: Clear SOC CORRECTABLE error
 registers.
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


On 11-10-2023 12:18, Aravind Iddamsetty wrote:
> On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
>> PVC doesn't support correctable SOC errors, if we receive MSI due to
> statement looks incomplete/inappropriate,
>
> better rephrase to "PVC doesn't support correctable SOC error reporting"
ok.
>
> Thanks,
> Aravind.
>> correctable error, classify them as Undefined and clear the registers.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_error.c | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index dcf395bd985f..0bcb1bea7ffb 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -616,9 +616,30 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   
>>   	lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
>>   
>> -	if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err == HARDWARE_ERROR_CORRECTABLE)
>> +	if ((tile_to_xe(tile)->info.platform != XE_PVC))
>>   		return;
>>   
>> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
>> +		for (i = 0; i < PVC_NUM_IEH; i++)
>> +			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>> +					~REG_BIT(hw_err));
>> +
>> +		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +
>> +		drm_info(&tile_to_xe(tile)->drm, HW_ERR
>> +			  "Tile%d Undefine SOC %s error.",
>> +			  tile->id, hwerr_to_str);
> I still feel in this scenarios at least we shall flag this as drm_err, since even though
> it is correctable and corrected by HW, aren't they spurious as we don't expect to receive them
> and a HW misbehaviour. Thoughts?

Agreed. IMO this change should be part of low driver error reporting. 
Not only SOC, we need to report other gt and tile errors

too as spurious interrupt errors when they are undefined irrespective of 
error classes(correctable/uncorrectable).

>
>
> Thanks,
> Aravind.
>> +
>> +		goto unmask_gsysevtctl;
>> +	}
>> +
>>   	if (hw_err == HARDWARE_ERROR_FATAL) {
>>   		soc_mstr_glbl_err_reg = soc_mstr_glbl_err_reg_fatal;
>>   		soc_mstr_lcl_err_reg = soc_mstr_lcl_err_reg_fatal;
>> @@ -709,6 +730,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>>   			mst_glb_errstat);
>>   
>> +unmask_gsysevtctl:
>>   	for (i = 0; i < PVC_NUM_IEH; i++)
>>   		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>>   				(HARDWARE_ERROR_MAX << 1) + 1);
