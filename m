Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DCDC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF4010E083;
	Fri,  8 Dec 2023 05:08:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B5D10E083
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702012109; x=1733548109;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7vOujiuWxl1JF0x3+DxJOV+VHveqMGwj7XGx1YLnj4E=;
 b=jGSVIvrKhmt2n3hW4MB5wqY78odGsCA/8DjvnifxQPaINPEgAjknF0kU
 MRR3gviZu/nPpu6lcCh3fEZ9aeWhjCzq3JgUpLeaS/fVtpfDz9RDtWpYn
 7fv5H+uLnE9apwqsja0irLh0KvdWSyt5aWCtHO2MBTTr1UBpd3sU0/tP4
 7HiEZvC8q2dftTdH2B1PcSPM7eVx5jAsoZtvb4tBowptafGHAxvxIuZEN
 mQPO5dSDxyZ3sKerSIYcWvE08PuTnIh6ubdd/M912kquXRAH60TGd+Olu
 6ozXthAJBYdMFgiSUPAcQ+Hx4ZjH1FNn8LfDgobhE5GjJ6vi5BWirwULs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1238256"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="1238256"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895400892"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="895400892"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:08:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:08:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:08:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:08:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:08:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anpPJpxzbJBODCy5uROSBJax+46EAxxRAtqAi7U8bDMeF3n9knwirGsc5E6tlY07YHb37rkiD33ovl/9NWgsW6y4fR8xDthZA2SzHnQXnuO4KTOJL3gMX15MAJu1porVQHIISw16/rIQ0jOypL9X8V/8mNGBKOPWv8SwQ3Esj1Jf0l6J3byKD6gk88A674D40/xjFbPviCu3r0HR1KHX2APyCK9m+7R1SsYDW30zIU8QHjm7zL8sSlChAcgFFVGVDja+wPZYF0cX9tYEMkeFP/4109yzacGYsPdbvlKLwMQ/ecaX+cHZjZWc3CqEp15kzuFUA/9yP0q6H05GyZZtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8ADxmD57Uq4K4RmC6NUsS+Y6cx0yboZY35TLUuuCxA=;
 b=MNtGdzWRxXo9873n0sNJyN2DfmVeDk9imIR/96VMtid+CVRJ+Z6warNb/Q8ti+2a71+DqOqDwMCz6InJShxoYOZXJ8cgr0oXTY69fS0+HQwsa4g0wnuxg9TR0cxqVasbJwoDQbLFRcvI25saPSo6drXdiLDWWRPeHwwA7wuaj0L6FgsMIrBzuh99fz7CjW6cklRBv3GENFZkkXoZMOrVS7Lex2dXFt7O8C0usmYKVozcfrpn3GAXyo36nfvnjhRJg1QISJYRY5m9pB0jdFsEtUZWnpeh0m8hmBG7TQwFxZl30oBMalNbBTs2nyKlWTH6KNvXGtamm0VfwBu9u730RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 05:08:24 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 05:08:24 +0000
Message-ID: <1e0b3beb-9caa-4975-924b-25a26fbb4c33@intel.com>
Date: Fri, 8 Dec 2023 10:38:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] drm/xe/xe2: Support flat ccs
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231207091922.1224800-1-himal.prasad.ghimiray@intel.com>
 <20231207091922.1224800-10-himal.prasad.ghimiray@intel.com>
 <e10e828c-1100-f735-f781-a4e030648094@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <e10e828c-1100-f735-f781-a4e030648094@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e93ad67-1b94-4698-079c-08dbf7abb471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r42XkSnYZYTek/dI1k1589VLm9J4CPfI4JLjSFDB81hRh1+SCUh9L+RKW9S5ywqPB8M+A/I/rEvlzo2hqlXwYALaziYdehZzwyBsOetilYNr0FxjYtr9vig6kH6tAbPUhza7plvwFlAU8+M7Oq5gdbbIGXhW4c9EEfJ4Klteo9XcODkuBbsJhhNZFb511Pluj4vBwb1nE9vghF5mznM878B1Aa2caVxolbN3JBj2Rq4Ae8tDIozBSbh6aNwDumFXoxaq2OrSawsWTsfaX1P0D2EyX0OLoAc3Q0KedoGtcF9KDs2u0gdOxxc/O3VS0Q9taYLExE3Dy0dkHavB69edDJMvDN7PmEYnScKNwMCkB2d+ncnsWs0c/dLUpgU9RSajiUvEs8OJYDlf+OoqNh3nNxCZusHDR3/8GEeVvcSI8Qz16Qg96qCXceO0BQMttZZI44XjyprsI+BRyToHnReiBfUKejsPeeYjFU6UFB9YwhALfQPyKSuBaJgFck5GQcbrllffw6ijIXMTujFJjNT2Z1jXUypKBhmbNR8kXiP9598SaCDZXsEx3A7dDCrqq5pLPtJoqtrTIN7vNb5owa/JHgWY/iz32NBgD21BQH1Ox3Ur+KsArygh4GMzPVRPX2jr3zgoJUOyfxLSyTd7Bj3P1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31696002)(31686004)(6506007)(478600001)(53546011)(6486002)(6512007)(38100700002)(6666004)(5660300002)(26005)(316002)(86362001)(66946007)(66476007)(66556008)(2616005)(8936002)(8676002)(66574015)(2906002)(83380400001)(41300700001)(36756003)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2doQ29RWGh2OGJaQnNYY291WE16TnlpaTU0d294VUM3S0N0NWRYalVzMERs?=
 =?utf-8?B?alN2ZkZZejJrWURkRHVDZHpuNmptaEk1K3ZGR1NXWmJpRmRtTG1rdStHckEz?=
 =?utf-8?B?SlpVdmgxdDQybmdaaTQrWklsZU15b1pCSGlHQ1ZvbHR6NGJqOUphZmtxVFdr?=
 =?utf-8?B?ZTZkZFJyR0FpNGd1YzNBWkZVMEQ5OFdvcTFjNXNnbTVxYkJZcVFNTUEyMVQ4?=
 =?utf-8?B?SCsvaUlnNUREaEhSZWwvMWF1cCtLcTBsT0x1K0tiUWs0aGlvK3dlOE0rSlFz?=
 =?utf-8?B?QlF4WnpTRW1vNWJvcHdzaUw4Q2FaRmVhK1lFbWxudStQTEp5SUVGT0czK3Vu?=
 =?utf-8?B?UHliUmdJbTU2MS9BaGtha2ZlY2wzcnJoZy8rZE5jTGRCdEJTSmN0ZTc4Y0Q3?=
 =?utf-8?B?Uy94THp5TlRBNHA3RWhBeGkxRWgvSWtlWW5QcEZWYmJzNFl4ZC9QTnNRUmJ1?=
 =?utf-8?B?ZjhJa2ZCdkFWR1c5bUxtRTh1cHJGbURuN2habktJR2pVSGJVM0hudE1xbTkz?=
 =?utf-8?B?WW1pVXovNUZxZGU0MHU4UzF4TmRWL003N3huK3QyNU1DRW5tb1NxSFhrdTh3?=
 =?utf-8?B?UkdYLzh1d0tSTnpnUk9pWkx2RVFCWnMraTBBWjFQOEthV2dCWGlKeit4VmVs?=
 =?utf-8?B?QUkvZ0F5dkZ0NTB6d3kwdUJ2OWVGa25TbzZSSTI4UWpnVGVVUjBpeWFoRjFz?=
 =?utf-8?B?eVRDOHZBcnZjRG5mdnRveGNVbVZzS244d3B6WDArRTFINTAvMUpzb2YxWmUv?=
 =?utf-8?B?azJIb3hNME90OUpKMXFqWDZZQ0RsT2FjSnI2YnRRblRZdEJzbUNBeFpNdXI1?=
 =?utf-8?B?b2xzaWVkcXhhZlh6a0xaci96T2pTZ3hieHRDZGF5V0RvYVEwcHZrZ2FzWDA1?=
 =?utf-8?B?WGxZR3RyOFkxSExFNXgxbVN5T1U1d21tbFlxMEovc28vMGdrMDJGU3ZEb0VJ?=
 =?utf-8?B?QzVYTGhWQzNOb01rbUk5a0VIbG5oNDB1b2dSeEdzRk9BRklxSkQwZW5QUjE2?=
 =?utf-8?B?WlMzWDhtRGhweEg1bFNRZldEZmpHb0NXVU03OE51enJHUzhvTmFVR09pV2lL?=
 =?utf-8?B?TE0wemlKL0JLdWRFeXJkZlFydEw3K0RvM201Ni9xZEJOQWRJWE9TQW13SFNX?=
 =?utf-8?B?c1RacU5ETDdMYnBnTDRaNHBQeThvZnYxQUcrcGtYZXpsOGJ1Q1YxTGZqVUk0?=
 =?utf-8?B?dGJlUkxlVzZxUHdMSTJ3b1FFUC9hTjdqcjM0OW5Gc2Z1ZmxpYStHZFZFbUg2?=
 =?utf-8?B?cDZ3aEdNVWlFcUE5cFlKYk1abGNDZm1BT0NpRjFSbGliV2JtWXErWnMxYnJT?=
 =?utf-8?B?QmlqZ3I4ZS9Pb0JkMlp1aTUySUxJUERadEM3TjBDTEhXVDViaWlubHdpRUxF?=
 =?utf-8?B?d29oVkdmQnh6NGVXUmdjZnBRRkxkSk9BS1ZKQTNCcy9ZaWE4WFdQTm1kU0hD?=
 =?utf-8?B?MElaSE10a1pLQlVPY0lVYVBrQUE4cFpFdTZZbGhSMmhsM2NNN2NwcHNpYm5k?=
 =?utf-8?B?SzdtZ1djR0JZRFVPcmZXRlRxYW5BTE1RQk11RWhYUnZaUFNsQUNjbytnZ2o4?=
 =?utf-8?B?eVlYNHBiMG9VMlFPcGpnMWtqbUlwTHN5RkduM1FBcUFjaEVKVWpHWnBIejI5?=
 =?utf-8?B?NUg3eWZiY1FyTzdWTnkzelhuQUkwbTF5S29ia0o0OU5hTURFMTRlTzg2cHhk?=
 =?utf-8?B?bnpUazBmMEVZZXBEbTF6RE04MWlnYk9WNG5Ga29KM0FpUGJvck9xUGN1U2Zj?=
 =?utf-8?B?c3dKSSswWkhOZjR0Tk81bjRlYkhxbFJIRUszZURGSnZuTE8yaFVvOW44aklS?=
 =?utf-8?B?Vm1nMG5KMlRtNitURFdpN21za3ZuRjRqYkIzWWpoR1Zha3dCd0pTM2tueWgr?=
 =?utf-8?B?eHUxWlF1WnRUZGlYbmVWNHJ2R3VDVWxQNW04c1grOGlxT2JtL1hHNlY1WnJv?=
 =?utf-8?B?bmszRmxvMDJmditTTUd6Vmlranh5V3Q4Y05wZFNZMTFJM1VFVlFxQ0VmL251?=
 =?utf-8?B?UFlKWXlvYm9FczJobVlzNEFzZ0huYXZsbFo0WFRURloxWEczekxZbjdKeDFD?=
 =?utf-8?B?dWR3cXE0TWhHYThGaVBSRi9jMDRNYk5qOG5waW9PMjZQZjVJK3ZucHBBU0w5?=
 =?utf-8?B?anRuTWVOSUpENFdEQ3h6b1lFT1dCNER0L3pCRE0zSWVWYW9mLzE4aUxTUHcv?=
 =?utf-8?Q?kNXVA8ZWHYBzN2siac6Fo1Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e93ad67-1b94-4698-079c-08dbf7abb471
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:08:24.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bahIeyqCicAqIThM1hg0x54Jj2k85Adil3U+L+GBp/ac/albrpu6OgfIleRe7+XG9+eq3Lr59Rrpq7FB16x0jEp06IaVFFux5x/d800lyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8705
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


On 07-12-2023 18:31, Thomas Hellström wrote:
>
> On 12/7/23 10:19, Himal Prasad Ghimiray wrote:
>
>> Enable flat ccs for XE2_GFX_FEATURES.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
> What happens when we run this on XE2 | DGFX?

We will need to add  support for future dgfx platform during their 
enablement.

>
> /Thomas
>
>
>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 2186ebfbe05c..c3032143096f 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -164,7 +164,7 @@ static const struct xe_graphics_desc 
>> graphics_xelpg = {
>>   #define XE2_GFX_FEATURES \
>>       .dma_mask_size = 46, \
>>       .has_asid = 1, \
>> -    .has_flat_ccs = 0 /* FIXME: implementation missing */, \
>> +    .has_flat_ccs = 1, \
>>       .has_range_tlb_invalidation = 1, \
>>       .supports_usm = 0 /* FIXME: implementation missing */, \
>>       .va_bits = 48, \
>
