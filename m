Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CDFE9370C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 13:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD8510E408;
	Thu,  5 Oct 2023 13:51:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C15910E408
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696513865; x=1728049865;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AW0N/qrHh4XqThjV1ZLUir5fUh089LcpmJzbUewCMwI=;
 b=TqVR9MCU/VoRrGM9zowAMYO3CHwFrBcIPoeH0Wnv5E/wkKrj27e28T4/
 eALLfPthmWquCQvGoAndpyOnAasZwe22yfyrj2pwGsbggDiO4V3ryTMhp
 U0qvysuHrIFZsIMnaVGExGZ5mBXq+i3xjMQEY8JXBzkiWJeh+8SsXgiHF
 zSBqz0n2anRavufKKP6DXsPtaie7QTfGFo7YgEjPYL1OvNFenzpHlRHAa
 QJGPxwfEJ4VpgNKNX6aZf7ToV6ouClv8FFtkL4nST4c/2VR4iuiz1Yyld
 kWBLdmTXjHDRmOxgVFDCTmHxZv2bJ5Xph/F/E1i3efF61raZjJB/NkVT5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447686777"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="447686777"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 06:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="701660346"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="701660346"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 06:51:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 06:51:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 06:51:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 06:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFkboi1/p17SJxXeeJxqc6QRxVSxEFPSrKTMs0VG4ch7UYxuiPT20VeZard/BOhCAhsh28aLmJVh8f6h14S9iFeXliEHCYuCNQ8hClyvLudNRAZbMWFifr5tSEuP60DsrI9RD7uxgitH0fICy2KVKgjQWEFeXULO4u5Ao8kWXJvYqLZ5E2pcW59dQ/L6/ePIl3PPYcG6wq3ixNA8LoeUSYShMzpcjdHCO3frtZl3caBg9zJLmFfQ3JiBBwDnarkfEn1bEfBmXNzHpLhkSCk5LShv1rGzTkBUdVsZSnkg+UOZ4Hat4SRk7X71aEHkjVcmKan7Vn+rSkDxdoyBlSfk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t93bIn/XPLIXr9TWc9hSEhd+ni0RZKL7iSouTidZAPA=;
 b=T6FKP7oPtRkDNRseaeYH64PJDDqIIdqisNydhjC2sxwc5rrPXdcefnbojeBwCnBOSHfOLvqp6MXx306OYZ2wGfqluSXXzYTm1DfkXrCLU+bkaBXKdb/NpwAa/NLWNciWPv3BG3TJFkt7kHPyFGj+FqTHxP+S1xqFuKVoSgD5PlqWmmZH9pVt9xxGmunY9YBKVdHZMTbPeJ32rnYxhVtOcWsn/ig0e2KCi6ibnODBKgiyc589iK74FA/G/HcfBDsZ9pFU9sqfu/PP1rJU99QONCgWCfU9oN3a1d0xtg8i84HEmgexvwOn9kjugc/w1banD1OSgIIp3G8GWskhc4cuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 5 Oct
 2023 13:50:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::53f2:4a71:7a0e:3281]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::53f2:4a71:7a0e:3281%6]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 13:50:55 +0000
Message-ID: <46604081-c5b6-4d7c-95d1-90dc093876ae@intel.com>
Date: Thu, 5 Oct 2023 06:50:47 -0700
User-Agent: Mozilla Thunderbird
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Ofir Bitton <obitton@habana.ai>
References: <20230927074607.3027012-1-andrzej.hajda@intel.com>
 <eab66481-c899-2ee1-7c32-c9339db87417@habana.ai>
 <399f4d2c-f502-46fc-b59b-1e750ee9fdf1@intel.com>
 <c356834b-7312-9965-3fd2-7e08a494dab1@habana.ai> <ZR2em8wyd4iRxhnp@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ZR2em8wyd4iRxhnp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ2PR11MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 9402d7a5-c48a-4b88-dd2b-08dbc5aa185f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bq68KIs/pSUoY3/6rUFnlRotLtUvHJt7y+Od3l8LXiVX9+BOGPz7UjBwZFYDt/QDZRu/z8jGy2B1ptJhoFN/78RUKTdY6X4b+vacaDDbyGCNLPPeEfVKUhpB1U25UBqiPmsW3f4DWxF2QEHM3PCVf+AqKvUmrboGN5HHQAyyC6Nx4q90dhorc5FDXBvKGg6Jnbrg4xtxhWuQzxYixs+LwyxSNuCxH0oCn0vTVtkopXG394M6WgGYMzy8Oe6IDj9y+Ri3kWLNyXwGhraMtAtCder0anPT44wCn4kcUD5n9T3jkUbhJjhhRMpZe+w4Fez64bQ2XJGONKx7N1o+pk5PzGXtl6UcnzGjWDNIdmuXFMj2Ssjdep83CzKRP1wzYxqJyQDx3PkOEV92030JtKsnrVhXLnH/URwIkwgMI5vMGxrxIcB9mYy7mYnQ4uzRf9c80j0btzn+SznXZde4PCyAFbU1fvPnviIQ2V/TJ8AvKJQhyh1dZ8apk1bxHG/0Zuuvst0ohqsL9deNni7+kSJMX/c+NMDjtCTLcN217MPWGydHRaqJRnlHzewtCTaJSox0rjYzlxyM8j0PhJu9WP1lC1JtP48vnIXA5h44/29X47nV05aFuJzK2dOppAKaUIBYperquhsqRtWdg9WADngKyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(31686004)(6486002)(6512007)(2616005)(6506007)(53546011)(107886003)(83380400001)(36756003)(38100700002)(82960400001)(31696002)(86362001)(2906002)(6666004)(8936002)(5660300002)(41300700001)(26005)(316002)(66946007)(66476007)(478600001)(4326008)(8676002)(66556008)(110136005)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk9HL3RCUitSSUFPNndBY0lsVWFTMlpQVU55V3AvS2Vod0w5S2JybmIzOEFX?=
 =?utf-8?B?L0JqQ25MdmhXUlRudXJNUkYrM3dndWUrYXM3QWQxRmlEVzdYMWV5akN3SlF1?=
 =?utf-8?B?ek9XOVh5NHExdHZvNFkxbXAvR1ZDUmV2dzRiQ2E5QlE1TGxKc1VFU2JvSVdu?=
 =?utf-8?B?VzFlb0pEZ3hOeTMxVzBnMGxwVFBUd1A1aVp2ZDEvdzdKNVJ4SmxmUmhHb2RU?=
 =?utf-8?B?em1TS0hQakQ0VFMvdmp6d0dZUjJWakdOQUNmMFI5cnpNZHpnM0FBTXpqQlV2?=
 =?utf-8?B?bUlsS0J3OW16ZjNIc2srK2ZiY0txMG9MdDd2V0pKOUt0WGdiUTRQdFg3bkFo?=
 =?utf-8?B?M1UyK0E3bmY1blJOM0V2ZGh6NVNFRGZtdEpHOEJnS0xlNlFkVkpGTzZhamJ0?=
 =?utf-8?B?SC9IdVM3OHh0VmZjMldSbkpqb0lwdzV5SWxSWkZPV285MkRJZURvbjNmZ3BY?=
 =?utf-8?B?T2ltcVErU0dSVzNFRCtaem9oY0RxWktJdStVS1ExdGNKaWI4UCtjbUtBRE1M?=
 =?utf-8?B?b0V6b00ra1JBSDl3TFZkaGlId2h3OENmZTNSeHdXZUE1bWhYb2RtQWlVQ05O?=
 =?utf-8?B?OTJUSmxiYzlmcmZFbG5aMzhndjJzck5wVHB1Nk1sZHJhMXh1M2M2MHVmb1Ev?=
 =?utf-8?B?YndjaTUySUNzb0kzeFZEWlpPQ3ZFYXA2QjlRY1dUdkFjZUt0eElPQnJxcXRr?=
 =?utf-8?B?d3c2L3FYcHB5UGpQSS9kc000dllIS1p1UDdyTEtiZkZFMmIvdnppbHgxNFUy?=
 =?utf-8?B?dWdTYTVvaEVUNmtWY1pPTmQ3WTFwK2NpaEx6VWMrbktMSmxEVitZRnoxMngw?=
 =?utf-8?B?R1JmOGRNTlVnMkJjVHREcXY2cHo0Uy9HYjU5NForVUdyaGxoQm4zNmpPL3Fa?=
 =?utf-8?B?akIzNGYwYVZyR0RTZDNuVERRT2ZqeDNhSmVScXBFWUVPdE9xNkhOdlJzR0d6?=
 =?utf-8?B?YW0vdnJ5OUtPVVl4NTZ1NmFyelQ0MUFnSTYxZmtEUEZoVzlLSmZ1TVV0KzFm?=
 =?utf-8?B?dXhvcEF5Ukd3WmpZUkpjU210VmdPMmtwb01hd3IxVngrd1kxajVFaXRqY2lS?=
 =?utf-8?B?WkdxdEUrT0VvQWlkQngvSFBmNlh4ZVdyUXRxYzF3cjR3QXN2SThDdUluTzFj?=
 =?utf-8?B?QmQ1NU5VWjFsWEVVbERBRDBFOVc5T2p1LzBseG1SU0doZmhCV1dYbHV1QW5I?=
 =?utf-8?B?WTFzL2UrU2dla0M5WENxMnZoODB3WUppaTc1T0NZeEl0MDg4SFpmMnRPUlNa?=
 =?utf-8?B?K1NYN2FvZml5MVAxanNoUWlwUTd1ZENBSmQ5cUV0dG1mQ0kzTGRIczdKdk9t?=
 =?utf-8?B?eWJLNnJqeTNIRzc5NXE0UkFYaXpQL0tacGRmQ1lFYzkzZHptYUtpTE92RUdU?=
 =?utf-8?B?ejUwb29JNFVNK0NvVDRCSUw2M21YRmJYRlVVUFpkdmFnV3RxL1NFVTNLbER1?=
 =?utf-8?B?UnIwaGFUL2JaRE5ZSy9GOS9hbG5zRHFvQVZZaFNwd2lDZHFCMDRPNmNJVmw3?=
 =?utf-8?B?a0JnWnJ4bGltU1BrRXhJQmxqT1oxcUhZclUxZlJldExtTzNxcVJXY1hMd1Mw?=
 =?utf-8?B?UEtzajhsM214MmQ2Vk5wSkRrR2o2MTBKc3NXUmtYSkp2em9kNjRYMTJSOUZT?=
 =?utf-8?B?WVc0WU8rVGFMalZSODc2V0hkVDlWdTVxYnM2OUZVS1JzaU5GeUdQTmJWb2lP?=
 =?utf-8?B?ZFplcGN2UERoVGUrL2JFQVNpeDlKRGsvVEFuV0FCVXRFdnl6bkwzMVI3N09E?=
 =?utf-8?B?VEpidVpSeG50UTVVdXRqTDNTV0FPckZSUFRZVVRlWlJCWjNCa1ZwaFF3S2g1?=
 =?utf-8?B?ODhGSlZXekdjU0xJQ3MwUUJPY3RreEJETVJ4NDlaUVZlMVZLcFlXOWlwTVEy?=
 =?utf-8?B?NHdXcWVDTFN6Z3k1bGdFNDhKWmdXRlNBUVpOdTFNa3Z0aTN0RnAxVm9QaDNY?=
 =?utf-8?B?Y0sxazl1RU52VnFTS25Ic1p1TFRjTnlWVzlBU2ZSaHZsek5DM1Q0RWdaa29N?=
 =?utf-8?B?WWxkUlFaNnFDYU9CVEROTEhpaS8rUWhaODdBN0NjWTdTRlZyNnRBWU1ZMGVu?=
 =?utf-8?B?Rm9aa3NTWGFORVJkblo2QzZ5TmJLaDAya1ZHQXpYQlhsaGJ2WDVmd29Cd3pq?=
 =?utf-8?B?NTlGYmJVVm9jQXVnUEM2alE0aGFpUFQ3YXppeWJ1dzdPWW5zbmlTdnQ2amNt?=
 =?utf-8?Q?ElraMkmG2qm+DuJRIdBc7sM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9402d7a5-c48a-4b88-dd2b-08dbc5aa185f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 13:50:54.9687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jmI9fewebNGsw7qkYANAv46C7awz9FO8FF61AP8NmmyMVXBIoc2CIG3nyPWuJci2h6AGySCWMpIr2/lCdmqdt/9F2uJLxb/6p0MTntFDmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: implement driver initiated
 functional reset
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 10/4/2023 10:19 AM, Rodrigo Vivi wrote:
> On Mon, Oct 02, 2023 at 12:22:19PM +0000, Ofir Bitton wrote:
>> On 02/10/2023 11:11, Andrzej Hajda wrote:
>>>
>>> On 01.10.2023 10:50, Ofir Bitton wrote:
>>>> On 27/09/2023 10:46, Andrzej Hajda wrote:
>>>>> Driver initiated functional reset (FLR) is the highest level of reset
>>>>> that we can trigger from within the driver. In contrast to PCI FLR it
>>>>> doesn't require re-enumeration of PCI BAR. It can be useful in case
>>>>> GT fails to reset. It is also the only way to trigger GSC reset from
>>>>> the driver and can be used in future addition of GSC support.
>>>>>
>>>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>>> ---
>>>>> Hi all,
>>>>>
>>>>> This is initial attempt to implement Driver-FLR in xe. Implementation
>>>>> is copied from i915. I've skipped comments, but I can re-add them if
>>>>> requested.
>>>>> In i915 Driver-FLR is performed on driver unload if GSC was used.
>>>>> In xe GSC is not yet supported, but I have added trigger to perform FLR
>>>>> in case GT fails to reset, I guess this could be proper use-case and
>>>>> of course this is prerequisite to GSC support.
>>>>>
>>>>> Since this is my 1st patch to xe please be merciful in comments :)
>>>>>
>>>>> Regards
>>>>> Andrzej
>>>>> ---
>>>>>     drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++++
>>>>>     drivers/gpu/drm/xe/xe_gt.c           |  2 ++
>>>>>     drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
>>>>>     drivers/gpu/drm/xe/xe_mmio.c         | 38
>>>>> ++++++++++++++++++++++++++++
>>>>>     4 files changed, 49 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> index e13fbbdf6929ea..769a8fd005931a 100644
>>>>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>>>> @@ -359,6 +359,12 @@
>>>>>     #define RCU_MODE                            XE_REG(0x14800,
>>>>> XE_REG_OPTION_MASKED)
>>>>>     #define   RCU_MODE_CCS_ENABLE                       REG_BIT(0)
>>>>>
>>>>> +#define GU_CNTL                                      XE_REG(0x101010)
>>>>> +#define   LMEM_INIT                          REG_BIT(7)
>>>>> +#define   DRIVERFLR                          REG_BIT(31)
>>>>> +#define GU_DEBUG                             XE_REG(0x101018)
>>>>> +#define   DRIVERFLR_STATUS                   REG_BIT(31)
>>>>> +
>>>>>     #define FORCEWAKE_ACK_GT                    XE_REG(0x130044)
>>>>>     #define   FORCEWAKE_KERNEL                  BIT(0)
>>>>>     #define   FORCEWAKE_USER                    BIT(1)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>> index 1aa44d4f9ac1c8..1e0b76000ed46b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>> @@ -604,6 +604,8 @@ static int gt_reset(struct xe_gt *gt)
>>>>>         xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>>>>>                                    gt_to_tile(gt)->id, gt->info.id);
>>>>>
>>>>> +     gt->needs_flr_on_fini = true;
>>>>> +
>>>>>         return err;
>>>>>     }
>>>> I think this should be platform dependent and not set to true by default.
>>> Why? Do we have xe supported hw without FLR?
>>> This is kind-of bigger hammer solution - if GT reset fails, lets try FLR.
>> In future platforms this might not be straight forward, this is why I
>> think it is preferable to be able to choose whether this feature is
>> valid or not. We can always have bypass flags in innersource.
> we could check if this is PVC case already and make the case for adding
> a device flag already. Or maybe just a if () return; in the beggining
> of the function when/where that is needed.
>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>> index d4310be3e1e7c8..dc194e9656abd5 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>> @@ -347,6 +347,9 @@ struct xe_gt {
>>>>>                 /** @oob: bitmap with active OOB workaroudns */
>>>>>                 unsigned long *oob;
>>>>>         } wa_active;
>>>>> +
>>>>> +     /** @needs_flr_on_fini: requests functional reset on fini */
>>>>> +     bool needs_flr_on_fini;
>>>>>     };
>>>>>
>>>>>     #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>>>> index 3ccc0af4430be4..593ecc98cdfe8a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>>>>> @@ -4,6 +4,7 @@
>>>>>      */
>>>>>
>>>>>     #include <linux/minmax.h>
>>>>> +#include <linux/units.h>
>>>>>
>>>>>     #include "xe_mmio.h"
>>>>>
>>>>> @@ -364,9 +365,46 @@ static void xe_mmio_probe_tiles(struct xe_device
>>>>> *xe)
>>>>>         }
>>>>>     }
>>>>>
>>>>> +static void driver_initiated_flr(struct xe_gt *gt)
>>>>> +{
>>>>> +     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend
>>>>> a 3s wait */
>>>>> +     struct xe_device *xe = gt->tile->xe;
>>>>> +     int ret;
>>>>> +
>>>>> +     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>>>> +
>>>>> +     ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout,
>>>>> NULL, false);
>>>>> +     if (ret) {
>>>>> +             drm_err(&xe->drm, "Driver-FLR-prepare wait for ready
>>>>> failed! %d\n", ret);
>>>>> +             return;
>>>>> +     }
>>>>> +     xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>>>>> +     xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
>>>>> +     ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout,
>>>>> NULL, false);
>>>>> +     if (ret) {
>>>>> +             drm_err(&xe->drm, "Driver-FLR-teardown wait completion
>>>>> failed! %d\n", ret);
>>>>> +             return;
>>>>> +     }
>>>>> +     ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS,
>>>>> DRIVERFLR_STATUS,
>>>>> +                          flr_timeout, NULL, false);
>>>>> +     if (ret) {
>>>>> +             drm_err(&xe->drm, "Driver-FLR-reinit wait completion
>>>>> failed! %d\n", ret);
>>>>> +             return;
>>>>> +     }
>>>>> +
>>>>> +     /* Clear sticky completion status */
>>>>> +     xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>>>>> +}
>>>>> +
>>>>>     static void mmio_fini(struct drm_device *drm, void *arg)
>>>>>     {
>>>>>         struct xe_device *xe = arg;
>>>>> +     struct xe_gt *gt;
>>>>> +     u8 id;
>>>>> +
>>>>> +     for_each_gt(gt, xe, id)
>>>>> +             if (gt->needs_flr_on_fini)
>>>>> +                     driver_initiated_flr(gt);
>>>>>
>>>>>         pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>>>>>         if (xe->mem.vram.mapping)
>>>> Not sure mmio_fini is the best place to put this, as this is not mmio
>>>> related.
>>>
>>> The reason I have put it there, is that it should be the last action
>>> before unmapping mmio. What place would you suggest then?
>> maybe add something like:
>> 'drmm_add_action_or_reset(&xe->drm, flr, xe);' under 'xe_device_probe'
>> after 'mmio_init'.
> yeap, I also had my doubts about the placement. Why not simply calling this
> function or a work-queue calling this function from the place where the
> gt_reset failed?
>
> hmmm... and maybe not even a work-queue but a direct call is better, since
> on that point we are surely serialized and no execution attempt happening
> in parallel.

FLR is extremely destructive and impacts domains outside of GT, 
including wiping LMEM and resetting display and gunit. To trigger an FLR 
at runtime from the GT reset code we'd have to save/restore LMEM 
(potentially via the CPU, because if we're doing an FLR the copy engine 
might be dead) and do a full HW re-init afterwards. By adding it at 
driver remove time we can ensure that we leave the HW in a clean working 
state (GSC in particular can only be stopped by FLR, so if we don't 
trigger one it'll keep executing and potentially accessing memory after 
the driver has been removed), while at the same time we won't have to 
worry about re-initializing the HW because that'll be taken care of on 
driver reload.

Just to be clear, I have nothing against implementing runtime FLR, but 
given its complexity it should probably be a follow up step after we're 
added the much simpler FLR on driver unload.

Daniele

>
>> --
>> Ofir
>>
>>> Regards
>>> Andrzej
>>>
>>>
>>>> -- 
>>>> Ofir
>>>>
>>>>

