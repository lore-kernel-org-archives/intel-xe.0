Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA9EEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 09:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFC910E49A;
	Thu, 15 Jun 2023 09:00:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD2C10E49A
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686819616; x=1718355616;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+0zMAzeTGqdqlv5LLnU79JgJDETZeKqCewKpiyj1xXQ=;
 b=WElAjL2mSOivI0/5yOV7KoscNPXvKPUG64//a7ywJvHJRwTW2dG8gtbm
 nWrnQxdo7QxM4Z0FykVWUwykjq2ZZz3PWhkjPoq+4Onuj/Cy+bhmzEZTa
 jlUlv5m4VEDB9R8Uk4swZpl7GQd2DokLWzeEA6Gwe1Ma1M8VRZxe03RGL
 DoQHKH+DY8g4xUgZmb8+H/3p1VGSLD7Y1SB9OUav4vn6yLXqepq9DYNZ2
 MNY0xxoRUej2e21hBgR/DnQs1KsvHaVc5JnefBPQcyXEtzSr9idH+yqZa
 uXagvs73vfAmBD8Kr++x5WEdAcB+bEtiqFmyC1+K262ANyz04nOGAzYe9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338483812"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="338483812"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 02:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="959110648"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; d="scan'208";a="959110648"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2023 02:00:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 02:00:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 02:00:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 02:00:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhI00Lxsf23z6fi1xSsiDFlOMWZhRdgj2+mVsssorHWFgwY7XR5o6VWC/AoOyW2WkcvSgjn0hCBWzTZ/3dq26JjCGHqB8m8m4K343728gFiKij/ehE0kX7/tqEXIlx7G2ltwEIqfcwmgtax1WEB4FcHWYbXkNvQU7++3W4z54P6WumdbuWwH5+iwlBv8/AOszO9S0qDm5QEa/SId7ys9fS4oubUq7cuhe/U73QRADTvcyqBu+JQeDfFL/HBlRheTyR9XTdS13bKT+KwKYmbPWjSnMOMNmngBANia2DKHa78UuGK0JytjiK99r3Kc4VBztIFfUy+kg+hZN2QqYmEJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTV3rurib8WUQtr0EMhAZqbd6Gth9W0DHcslG/wxSV0=;
 b=mPw4Ug5aGDiZfSL2p7pI0jsz19Img/u9nAev161wodewH9vmLxdf48Fk/hW6MUVkG2GYiWDiTEdmYgHaCQrbeQLgFR/pbmmLUnjd3DrOB1JoJ5TcdgilDj6h932zZsLghBz/teRp1wdyU12m5OPICzm/QaQKKaluacYtbPGskn6GerJpqE7MbKlyzqh4n8M9e86arc89yN6DpOVVIkhWoiNS8WIpSFbbki3MibffAtPq1IU347tRBNxY40rU0sSXNmVzT35L7MaS74QzkfPPMw7KagULucOM36MMJAMDxVUHq0C0PyjsG7vTJ78G93b2HmNsDmn61a7clGTIU0jLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 09:00:12 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 09:00:12 +0000
Message-ID: <7404de30-fbfa-6747-f6bd-990474b1b0ac@intel.com>
Date: Thu, 15 Jun 2023 14:30:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
 <20230613084721.3698818-3-riana.tauro@intel.com>
 <CY5PR11MB621125B0EC412873760578A3955AA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CY5PR11MB621125B0EC412873760578A3955AA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fedacf-0fdc-4d7d-7434-08db6d7eed9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iaXeSPqeWoGtS8amMAjWiOtJkpCCimfyb/s224TdrIGiHX7JZ/ye9ZVeDLH55LyFbMN1+KLuCVQu/1YgJex8u+8kbD7VgyHTdzlSUmU2SNta6ibqY6lZlSieuztD3UJB2FPGMIkiQ+X9eLKqQHydfXJEEvVdlEdIUUbckAFYcpJwp9LtZ9mh4KWaT62UxT1UnizjFX+jjFQ88VU95rPDvu7cmyn3bWRklMVpODBTR1j8PUMhFVeIgpQzaAjAMLj5ma2ZJm/wARedt0d7LvpARmSv3gXoZe/+yWWsIokvDyjaSai3KlVt5fXOuSj/LgWb6FePC0k23LDBclMRlRLskWjCHYaGYPy0o3duPGXQ3VHLe6j8nvA9M5M+yLxyWG5qq7Nu0rAVQcbrIvbBy6g1cPksOEho+C5M0JGArKjXrkB47PBVmmhvri0LjCnNxYn7dcC77igsjNIY7JBtUQBR0JcQfJ/TthO69tlOgnZUoBi/z3XutH7dwdfdg/MQNHW5Bri47ONZ1ogwLvimyubynafXOogVb36f10tts3+kaqtkvNXTZTGoMA9eOzmKkeU+G/6IBk249dQdgewbH3Vk6GPxefwNNnSogyy2eFc5nkhxN701AXWZKHWi7cfa0afP9CSfJuLcPl+pANBHiZ6O9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(82960400001)(478600001)(36756003)(66946007)(38100700002)(4326008)(66556008)(66476007)(86362001)(316002)(110136005)(54906003)(31696002)(6666004)(53546011)(6506007)(5660300002)(83380400001)(186003)(2616005)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1EzT1ZObEdlK1JlSkE5ZU8zV1QyUlpPN28wVXJZYktJQ3lPQ1ZEQXE0MldE?=
 =?utf-8?B?V3VIdlBicURuWGJ1NnBCYjErMGZNb0RkZzE3QzV2NWFvNGJSN2V2QS91K2xN?=
 =?utf-8?B?R29lWUc3OUxrSkJ0WjFRUU1iNHhaVkhqMU9PUTFETjdlNE1YWEVuQngzeU1X?=
 =?utf-8?B?MUdIQnovUnUvdXp3bUxBekNrUDNCRFFoQm5nWkgrZ0dUcUgvMFBmZFp1TTNh?=
 =?utf-8?B?VUhyWHEzQUlvd09pVUlnWmtNSFRQckt1U0t2cW1pVDhWd016ZGlZSEV4QXdT?=
 =?utf-8?B?RnFnMHl6OVltY1hoSVdEQWlEMGxMQTF2bmlaamRaejZ4Vzg0VExMRnUrTjFU?=
 =?utf-8?B?OVcxZ3d6Um5IT1JqNWovVjJ4ekdGNENybFp5U2VOSWE1REh6dm1TaGVZdncz?=
 =?utf-8?B?Z3ptU0wwZnFYZ3RUMlozOFlnQXNYLzZWczBVSEpqZVRNWEpkYVluMHphcDZG?=
 =?utf-8?B?S2J4S3IzNzZVQ05tZ09uWkNGTWx2cFFubmFlaGNXMDMvcGxHL0o1SnR6UVdE?=
 =?utf-8?B?QUFLU0wweWxiRXc1bktkaVE4b0hPT3daVEppZjVRd2hrOXJiWXVxSjFDeGtU?=
 =?utf-8?B?UTBDUVVjVlpGandEYXJ6WTNSbXRqZ05LTytlNFFIaTdma3h6ZDA1dkpsZnRq?=
 =?utf-8?B?bHQ5d1JlR3dBc1ZEMU9DTkN2aGw2Q3Y3NnV6UU1jR2JXbWp2aUE1RmNTSTFR?=
 =?utf-8?B?THViWWZGVy9tZFBUaVZma0ZTeG9GdVllZ2g3ZUx6R0ZsMWdjR1VPdmF2V1Ur?=
 =?utf-8?B?NEZBc1RpdEttMjdnbVNZbW1CV1ErV2tvekJTbVJ1QVlMUmRaem9hRkVqYVdh?=
 =?utf-8?B?U0xONUYzVkFqQTZvQUh1NllVSFJRZHl6eVBndFMzZVUraVJ5VWRLRjFDNFps?=
 =?utf-8?B?Wm5QSWhEUkFPMktRNzd0aUxuWGE5K1I2VjBJL09SNnNjdE03ejJJQ2ZMWFVv?=
 =?utf-8?B?R1FZTDZvVnk2OWZKT0trUnhFbEhOVXdpWTBoaXdkZE1wbjMvRHIrYXRuT05a?=
 =?utf-8?B?b01pZVVqMmxTM2RrdmpzUDZUbFdTbjlvcnJXMW9hMnI5Z2Rzd0NQY20ySDBx?=
 =?utf-8?B?QTZmeXByWXpwcXhlNFRDODdPTG1KN2k4clluNFU3SU1QcHVsajRXdTR4ekZx?=
 =?utf-8?B?VE5yR0g5ZlptQVFjZTN3dnFaS0dsdlRsRHF4THY1M2lLSlVFNmpSbml2RG41?=
 =?utf-8?B?QitrUDliNGV5cStKQUZ2aFFTUkZ1Q1lNQi9TeVphMjMyb1czeDhnbnMzV1pO?=
 =?utf-8?B?cncxVkdtWW5sRU1OQ21PbGVWOVZiKzNsUEFvdnFrRUFQb0VGNDJ3cDJqU0kw?=
 =?utf-8?B?MlZjYlRyNU16cGN4aVNKbnY1OUlYbUhBemZVRFp6VDJBbHpXcTl5WU43eCtp?=
 =?utf-8?B?RmljZGRJZ3FjMmFFL3FkVnJnMHJySUJsVkhURG5yZExnREw2NUJKdkZ5SXd5?=
 =?utf-8?B?WmJQUmw3RDZ0ZFIwSDdRRU1HdVg4dlpjaTZrZUl4UXBZVTJTNkQ4V0ZFdDA1?=
 =?utf-8?B?bFU3TjRVS05ONXpQeE1VSlZLYWVQWURLeDIxRDkvQjA1NUNPMlFqQ2ltN2t0?=
 =?utf-8?B?R2FSby92TWtoTEZiRkIyUDZac2VZQ3RncUlEblJpSEJ5RGtUM25oMlJPOU54?=
 =?utf-8?B?Z1dWWFI5a3dyUm1QUkUyVGJZT2RyaEtjcTlZcnZLTEloa2dQNk1WNVhOTTBX?=
 =?utf-8?B?MThLYUFvVDFFVjJaYVRUQzhxcDZhelRnNUVtVWRuTkpubGNYL09Pbk51dlVk?=
 =?utf-8?B?dTdOTk9XT2dxZm9WUTI2dWpQMmlhUjQ5K1U2MlNiS2xPeUFpbjFkUjFOVjA5?=
 =?utf-8?B?Y2srRGhDQ2tTTEtrTmJqWEVRbWhkODNBdTlsRHpNbjhldTZYNGh6Um03MVNl?=
 =?utf-8?B?N3RXc2RxeHRBalJCNVJpNzNxK2dOd0tVQXN6SGRkTTR6M3BqM1NIczQ5UVVD?=
 =?utf-8?B?bFJZdzZBc3lLRXZtNGlWUnV2Wi9tMXphTzJ5bmZLdURlcHV0V3Y5T0Z6WFdG?=
 =?utf-8?B?Yjh0djQ0ZVdIOHNkSEVCaEQ2MXBZeTVQazhmcEV3bzZtRjlWQ2dyV3o1ZEpH?=
 =?utf-8?B?Y0V0K244ZzhUdFZUS1VDZHhKQlg5eEFIYkpCQzh6TDhHbnVLNmg5TmYrV3BG?=
 =?utf-8?Q?8srFfXmOs8ybqwlHXGPntFg9U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fedacf-0fdc-4d7d-7434-08db6d7eed9d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 09:00:12.6400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZYsnQEqMyIRRw0qO1jlETqM8G+aX23tZ71IgmMA34RKu67I5k+95ZrJwSbH2lBZaVcuOIUflTcMiuVwhBgOCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe/mtl: Add support to get C6
 residency/status of MTL
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
Cc: "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Anshuman,

On 14-06-2023 13:38, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Tuesday, June 13, 2023 2:17 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Dixit, Ashutosh
>> <ashutosh.dixit@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>> Brost, Matthew <matthew.brost@intel.com>; andi.shyti@linux.intel.com;
>> joonas.lahtinen@linux.intel.com
>> Subject: [PATCH 2/2] drm/xe/mtl: Add support to get C6 residency/status of
>> MTL
>>
>> From: Badal Nilawar <badal.nilawar@intel.com>
>>
>> Add the registers to get C6 residency of MTL SAMedia and
>> C6 status of MTL gts
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  2 ++
>> drivers/gpu/drm/xe/xe_gt_idle_sysfs.c | 16 +++++++---
>>   drivers/gpu/drm/xe/xe_guc_pc.c        | 44
>> +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_pc.h        |  2 ++
>>   4 files changed, 60 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 0f920175526e..7c3dd0a81b71 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -341,6 +341,8 @@
>>   #define   FORCEWAKE_USER			BIT(1)
>>   #define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>>
>> +#define MTL_MEDIA_MC6				XE_REG(0x138048)
> Reg should define in a header.
Its already under the header.
>> +
>>   #define GT_CORE_STATUS				XE_REG(0x138060)
>>   #define   RCN_MASK				REG_GENMASK(2, 0)
>>   #define   GT_RC0				0
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> index 1b2dcac46479..a75816a610ae 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
>> @@ -140,11 +140,19 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>>   	if (!kobj)
>>   		return -ENOMEM;
>>
>> -	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> -	/* Multiplier for  RC6 Residency counter in units of 1.28us */
>> +	if (xe->info.platform == XE_METEORLAKE &&
>> +	    gt->info.type == XE_GT_TYPE_MEDIA) {
>> +		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
>> +		gtidle->idle_residency = xe_guc_pc_mc6_residency;
>> +		gtidle->idle_status = xe_guc_pc_mc_status;
>> +	} else {
>> +		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
>> +		gtidle->idle_residency = xe_guc_pc_rc6_residency;
>> +		gtidle->idle_status = xe_guc_pc_rc_status;
>> +	}
>> +
>> +	/* Multiplier for Residency counter in units of 1.28us */
>>   	gtidle->residency_multiplier = 1280;
>> -	gtidle->idle_residency = xe_guc_pc_rc6_residency;
>> -	gtidle->idle_status = xe_guc_pc_rc_status;
>>
>>   	err = sysfs_create_files(kobj, gt_idle_attrs);
>>   	if (err) {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index 72f49808918a..35ca4115dc96
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -36,6 +36,10 @@
>>
>>   #define MTL_MIRROR_TARGET_WP1	XE_REG(0xc60)
> Need Bspec index here.
Will add bspec index to commit message.
>>   #define   MTL_CAGF_MASK		REG_GENMASK(8, 0)
>> +#define   MTL_CC_MASK		REG_GENMASK(12, 9)
>> +#define   MTL_C0		0
>> +#define   MTL_C6		3
> These register definition also should move in to the appropriate reg header file
Sure, will move this to reg header file.
>> +
>>
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GEN9_FREQ_SCALER	3
>> @@ -598,6 +602,29 @@ enum xe_gt_idle_state xe_guc_pc_rc_status(struct
>> xe_guc_pc *pc)
>>   	}
>>   }
>>
>> +/**
>> + * xe_guc_pc_mc_status - get the current Media C state
>> + * @pc: XE_GuC_PC instance
>> + */
>> +enum xe_gt_idle_state xe_guc_pc_mc_status(struct xe_guc_pc *pc) {
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 reg;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(gt));
>> +	reg = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
>> +	xe_device_mem_access_put(gt_to_xe(gt));
> Duplication code of getting a wakeref can be avoided  with macro.
Agreed but with respect to this series there is not much ROI as only 
couple of regs will be benifited from this. Lets keep it simple.
> Thanks,
> Anshuman Gupta.
>> +
>> +	switch (REG_FIELD_GET(MTL_CC_MASK, reg)) {
>> +	case MTL_C6:
>> +		return GT_IDLE_C6;
>> +	case MTL_C0:
>> +		return GT_IDLE_C0;
>> +	default:
>> +		return GT_IDLE_UNKNOWN;
>> +	}
>> +}
>> +
>>   /**
>>    * xe_guc_pc_rc6_residency - rc6 residency counter
>>    * @pc: Xe_GuC_PC instance
>> @@ -615,6 +642,23 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc
>> *pc)
>>   	return reg;
>>   }
>>
>> +/**
>> + * xe_guc_pc_mc6_residency - mc6 residency counter
>> + * @pc: Xe_GuC_PC instance
>> + */
>> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc) {
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u64 reg;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(gt));
>> +
>> +	reg = xe_mmio_read32(gt, MTL_MEDIA_MC6);
>> +
>> +	xe_device_mem_access_put(gt_to_xe(gt));
>> +	return reg;
>> +}
>> +
>>   static const struct attribute *pc_attrs[] = {
>>   	&dev_attr_freq_act.attr,
>>   	&dev_attr_freq_cur.attr,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
>> b/drivers/gpu/drm/xe/xe_guc_pc.h index 976179dbc9a8..0d13c19b7b78
>> 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -13,5 +13,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc);  int
>> xe_guc_pc_stop(struct xe_guc_pc *pc);
>>
>>   enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
>> +enum xe_gt_idle_state xe_guc_pc_mc_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> +u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>   #endif /* _XE_GUC_PC_H_ */
>> --
>> 2.40.0
> 
