Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A818C4829F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 07:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E8D112A0A;
	Tue,  6 Feb 2024 07:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5N0MhwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9B4112A0A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 07:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707203647; x=1738739647;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S1fZDQn4LruZqYIBW/XXRSE2CsHFLPrdmkHd/O+YcnE=;
 b=c5N0MhwI96WuwIplWBfAqHVcbsmeS4EPy88tnFJSn5ae/6GnUc9nOObt
 wKU/7JMU5uykfTYU52/eSBSnHdtAcU+3HVIxacuqjCu+Sl4ZfzKtRacOK
 NdN+Z6pAkMJBa5ZXk9JhwjgBfKvt6zgfMW3xxpVLN5ZB3Ro6YS2R5kT/D
 U7xu+OnOJtEfuHu6/U43pAyy2FbdR4I7Y0qSCRcvP9SxIXZdVMEXXe36a
 554Uv9+UaQY4AxujA7pS8PI4SAoK59K1ggd4YcIrp3sB0RKG3MuaoIAst
 9+VFl2nYobDNoHcjzA2iv+CFH2Q5NrobaLfMaZW2iR4NeJ3OL6xi1xbxe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="12040453"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="12040453"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 23:14:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; d="scan'208";a="31757226"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2024 23:14:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 23:14:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 23:14:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 23:14:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 23:14:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyVD45dxk/l4tz9mLMe6Oos3FZTrzMs6hN0PdbgsU0HJQbnA7Bd7/B+Qc4P9uNTR5e1vvln4qvw9DWs0o6p2xGswxAhOMLanTXb6h0NYoEhEmxVu5JuNTzKiozqc7458Cba4uFAqTATejC8YyFcOEXcd6/YgAfmUN2ShxocaieyDCiRRHGgk2GxYT+tzFlfvUN4Db+xEil03R8xoH6UA1GasAAZgURStqz7Rkp1NvimN3jjCwYq4Y+7PRqgQg9rbvdKi527oXyYPkxn56U/OwjOjLYxG8bkIr4kQPM/xTaTOaza0pFARaDZTfIGotszWsJV9o0u+6YlX0oqkp29jjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHq055PfO/FLPdwnHgHoyR8ezCzV6jAkUu4+wOM050g=;
 b=oXmCI9hGDjLYuPD2zUFnwrMR4mlswsdOvsGq5D4qD79K2EhJmv1FqRFV7WIqFyf45jwzE1ZM3WFvU8zDLirBV7/eVnoruLARVZqhPGos/DPkCC5qjXiUeG1ThZ25FkEVCfSjb7sFO5/31zco8hJG0HpQ1PyFqvcOen+xddYRChRSoFgyf+z45TiGe0CTIFZ/662OrBwbfaJAK4Ltj6Nl6X9a0OHBJgORNHTsw7ciUZO+OvtWM0y0RItgpz0I1YfGriIoBmXpY6knF32AsSDOUIksU+NMAhz4kgW3AZ675yvHYQgt+ky9B55CLBMrWU+V5y1t1OlRI5lLxUZQJdPTJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 07:14:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8676:39c3:f7b0:808e]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8676:39c3:f7b0:808e%4]) with mapi id 15.20.7249.032; Tue, 6 Feb 2024
 07:14:02 +0000
Message-ID: <55a03371-9eb7-441a-af18-459d988bede8@intel.com>
Date: Tue, 6 Feb 2024 12:43:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Add label support
To: "Poosa, Karthik" <karthik.poosa@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20240201175846.434392-1-karthik.poosa@intel.com>
 <82a783bb-e0bf-4a96-b993-e1244d353906@intel.com>
 <c6cff625-383b-4297-8863-166674d230f6@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <c6cff625-383b-4297-8863-166674d230f6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::29) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: f47aceec-be45-47e0-75a5-08dc26e331f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01g0TzHUimsgyPJhh4/CJMWYE1ueEz347cBIj4qPrsJsOMf8SQBz+AFVa4WcTg+COsmMVG3Xd7Ext8DuBrdHzi5LTTU2Db6O+7CEFkYGHjUinLJPBmouXczjsen4oF1vF0XtCtURKS1lsaQyhYmSbtuqjh0GdGWLqc9HjKcTREkFxHucdX1VLwe3wQFYgzEkOsqA+ZCN/oJm2NempxrzeODzZTH9DH+YGI8MuX8gkZ7PA2QgwUXrlZ/1ene63gahgX3fOjIKkpeMnjp4WA9/z7z1lCZPT5sgrhKtP1dSQfO3E5ANH7py+pmTVT4Nkk6g9L0XIr5JNMByVdY93BUCSib9KJPieDI6enRX/BR086HqBrO2+YVLPjpRA92Oaqo2qh9QB7B/mOzVCEswEGpT4/gBMi1/RC/7sxfxbr0XMM0cfLKTnLgQkFj5lThWHzma63u/QL6VbV18QaWLlwZvNax2ZTPDIqumEnm6Wy74rOd7EmtYKCm4YPeVKq5LyDREA1WOJL/TreCCO2EEndaSqp06oVb8kCRhzXJUS/3MD8QtOhqjAQTeCW5v9TPuR2Fu85C5sYMP5izm8IY4xzqPjSe/05Px/yAYS0//1kE9kCoyfVQvqqDhz7+WSL04eCZSKKX7Fmn0b/biPoxF4dp3kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(2616005)(107886003)(26005)(86362001)(6512007)(8676002)(6486002)(5660300002)(2906002)(478600001)(44832011)(110136005)(66556008)(66946007)(316002)(66476007)(8936002)(4326008)(36756003)(6666004)(53546011)(38100700002)(82960400001)(31686004)(6506007)(83380400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2NBT2lFMFJpcTA4aXl3UHJ2RzBFMjd2NTFSZHZPUERYSmZMWHhYWlRHVzFK?=
 =?utf-8?B?QkRBOHVGUkUvSUd1Y2txOG5KUGx4eUhLRVFQSEc0bWkwVlFzdytvV1hJN3E3?=
 =?utf-8?B?WlM0SFEzbDNxaDh4eHhqVUlDWnM4U1B0bStYVVFhZ2I2WlgzVUlVYlMvODNF?=
 =?utf-8?B?SzhQMDkxWENpL3RQR0ZrY3Jpd3dhZlJMZEpQVW9pOEcwdDhRMEVRV0xLYjMv?=
 =?utf-8?B?UWVUS1dOSVN2VkhiTjBUMVVPcW1YZ1FTaGNvSnVJYlJ6WWFhUkpCcmRPMXV1?=
 =?utf-8?B?WGtnRFZjZHoxYjhsZFZmS0k1cTc5NGZjWklLbGg0L3RFS1lOUnNRODArRkpK?=
 =?utf-8?B?NGNkQ1lDUVdtdDNhcnFaSTludkNNUE40Y1k1U2hjZ2h5S1pFL2picXk4M0lS?=
 =?utf-8?B?VEg3V0J6OVI5UkFEOWN6MWw3ZDczRFRHdWQ3YjdjUDMrSU5KTWZEUVB0U1Zk?=
 =?utf-8?B?NXZzaEpGaHB1dm1BOWR6djdIaG1iSkFMQXBvb1YrYVZzb1RTWHhiWWNuU1FV?=
 =?utf-8?B?S2FkbHpCOFcxQy9pRE1CTXJtNm1HSGZuR1d5QkZKcnJmM1IyT0NhZEdwNFVo?=
 =?utf-8?B?azRpZHMydUN3TE5UZ2Y1RnhQWFhYajdZaFBNUG1heElORUhRMlFVaTFIWHZk?=
 =?utf-8?B?cStBM2FpajFBVzhtQjdwUXFxcEZuRy8zdXp0QWwyQnBYWVcrMTB6VjRuQld0?=
 =?utf-8?B?clBsZ2xzWDlMeGttTUF0c3lUSU9xVVFEOFNubXdMRGgwbVBMUmdZNnVNaVkr?=
 =?utf-8?B?bDZLT0MvaDRIOFc1VGY5NVJaMmhzTVB1MnVkaTlFOTVlRnhBeU81WXQzTE11?=
 =?utf-8?B?RTJoUFlNUXBQMlZpK0J0cHhNV01wblJuK21JMUxFY0VGMzY2SWZ5aGpJYXU2?=
 =?utf-8?B?MzlBUEJiaGt6djJkZGFYVU8wNmIxazlGWm5RWjQ5eW5PVTVxclIwbW9GUXJ1?=
 =?utf-8?B?Vk5FeGxGWEFNZXdKcWlKQjAzalY4ei9uYmt1Y0wzQ1p3QXdBRmxIVlBLMXJi?=
 =?utf-8?B?UjhaWjg5Qjlaak1VbmdweDFsbGVCUkRzTUhSV21JUDJIVnJZbU5iUzRJVTd0?=
 =?utf-8?B?dXpIc0J6VUdkNWRJZmZXSWZncUR1U1hWVXJ4alRMSmwwa3dzQ1ZrWnZwdmtY?=
 =?utf-8?B?UVMrcSs2UlA4eTlxdEJpZU1sVXdIU2c2dlRzOGx4K2l2djFwcXlrNGg4SWlJ?=
 =?utf-8?B?R29HREpaeWI4UFFCa3JSdlJOcEVuVWs4Q1JYampFY2FnQldNdE4wRjVuaWV5?=
 =?utf-8?B?b1IzZm0xTGc4QTBPeTRJMlc4U0ZVVEdTOGEvZHFHTVRsVU5nQk1HUU9wQmtt?=
 =?utf-8?B?cnBkcDhtQVVxWG1YcjhhRjdJaWZSVjduam93bGx5Ym9UbmhvWi81SnFjVlJQ?=
 =?utf-8?B?a211MWpnNnYyRnR5a1JkS3hVTjhpQ1RlYm00U0d1NzdUc1JBMUd4bkp1YzlM?=
 =?utf-8?B?Rnd5RWNLOXBvZElPck5HcTdTK2dGY0RNbmo3SW9ac056UGdxMmRqUlM2NThZ?=
 =?utf-8?B?RzVXb2xldit6c09vY1NpUWdqOEZ6dUl4c1RZR01aSUNMQVRyS2tMeTN1Viti?=
 =?utf-8?B?bnordjFtUDJEYm1CYzhvOW1oVTh3NVRSa2lKYUpZaUdZN3Fpb0JNVzRjb3hW?=
 =?utf-8?B?T0N6cVBGR3ZycU9oN0kwazhidmJLb2NVSy9JRFR4MjIvWFMxdFBOczZTWWdN?=
 =?utf-8?B?WUkxNHRVeFNyRWdjanNhWlF6bHhBUHhJZ3kraGJENFRLMkZYK3lyRFVEWkhF?=
 =?utf-8?B?bVZ5VnpRWGxEZTl4ZEU4anVhNkdKQzY2KzJqbmpEbnVHUDFmK1NmVGJ2Y2Vy?=
 =?utf-8?B?MGlrcVhPK3N1T0EzQXM3WE9rL2JnWStEMkZmNmRZR1Awd2k2RHh3WS9iTFZa?=
 =?utf-8?B?dmJFME1yenFneWI2OUhwaE5kNlZrc1RKZGxjVGx5algrbTBrenBhcC91YWNU?=
 =?utf-8?B?UEVIMFZuQW5EY0hMRGNUUVlVVm5LbHg5RWVheS9rbnU3cUx5SStwZzQramxY?=
 =?utf-8?B?OVFRajk0UklqZlpnUTgyRElQVitWd2pxem1xOFp1Q09vUVZwYmZnSHZ1VTQr?=
 =?utf-8?B?Uk00ZkJnME1rSEpqREl3ZEErYzlxSmZVekFtU05VNG9VcXVkMjV2TkhmUnp5?=
 =?utf-8?Q?lkk2bBDJQUQFDYNiGJrWHcwnc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f47aceec-be45-47e0-75a5-08dc26e331f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 07:14:02.0552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCK971abs7ZwpsWgdeSnumpBBqpX/ZKn92HLFtn7JuCmAPlD0Z37vmRJu9oYXI2nTAqSI0w14nBfAAhbbqhVWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
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

On 2/6/2024 11:17 AM, Poosa, Karthik wrote:
> 
> On 02-02-2024 17:22, Nilawar, Badal wrote:
>>
>>
>> On 01-02-2024 23:28, Karthik Poosa wrote:
>>> Add label for power and energy attributes.
add why label is added
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 24 ++++++++++++++++++++++--
>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 89c6f7f84b5a..9fd70bff3435 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -403,10 +403,10 @@ static const struct attribute_group 
>>> *hwmon_groups[] = {
>>>   };
>>>     static const struct hwmon_channel_info * const hwmon_info[] = {
>>> -    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>>> HWMON_P_CRIT),
>>> +    HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | 
>>> HWMON_P_CRIT | HWMON_P_LABEL),
>> Is it not possible to expose label for each individual entry?
> You mean like power1_max_label, power1_crit_label ?
> Nope we can't do that, Each entry can have only 1 label, ex: power1_label.
> 
>>>       HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
>>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
>>> -    HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
>>> +    HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL),
>>>       NULL
>>>   };
>>>   @@ -484,6 +484,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon 
>>> *hwmon, u32 attr, int chan)
>>>       case hwmon_power_crit:
>>>           return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
>>>               !(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>>> +    case hwmon_power_label:
>>> +        return 0444;
>>>       default:
>>>           return 0;
>>>       }
>>> @@ -584,6 +586,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon 
>>> *hwmon, u32 attr)
>>>       switch (attr) {
>>>       case hwmon_energy_input:
>>>           return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 
>>> 0444 : 0;
>>> +    case hwmon_energy_label:
>>> +        return 0444;
This should be visible only if any of the energy entries are visible.
Same for power.

Thanks
Riana
>>>       default:
>>>           return 0;
>>>       }
>>> @@ -691,10 +695,26 @@ xe_hwmon_write(struct device *dev, enum 
>>> hwmon_sensor_types type, u32 attr,
>>>       return ret;
>>>   }
>>>   +static int xe_hwmon_read_label(struct device *dev,
>>> +                   enum hwmon_sensor_types type,
>>> +                   u32 attr, int channel, const char **str)
>>> +{
>>> +    switch (type) {
>>> +    case hwmon_power:
>>> +    case hwmon_energy:
>>> +        *str = "card";
>> This should be package instead of card. You may use 'pkg' here.
> Okay.
>>
>> Regards,
>> Badal
>>> +        return 0;
>>> +    default:
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +}
>>> +
>>> +
>>>   static const struct hwmon_ops hwmon_ops = {
>>>       .is_visible = xe_hwmon_is_visible,
>>>       .read = xe_hwmon_read,
>>>       .write = xe_hwmon_write,
>>> +    .read_string = xe_hwmon_read_label,
>>>   };
>>>     static const struct hwmon_chip_info hwmon_chip_info = {
