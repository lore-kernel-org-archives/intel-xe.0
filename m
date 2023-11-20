Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E308C2BB3F
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 21:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E476710E197;
	Mon, 20 Nov 2023 21:34:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB0B10E197
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 21:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700516081; x=1732052081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dLmqtZPvqxcdHilm2qSFvBDYqAKfvjl5blr7fcI4IUY=;
 b=ED3qDpIurgyuKfs/d/3otnb+6MbNE+Jk637/2OPDCYpOOuIXikpnD5Xj
 QYM2cENXNOBXqj685F9zD7794w+Tgc3VdK4IEgOXogMMWiR5kCQtlJOPS
 Uo/e+s8MVVpf2n4H5OYerROXgrrtNaEz+JJwT4WrIMVk5DRknlWGbRrhz
 qroV6Hw0eS4xxmcoHwgpGIVuM8P7I/LVoGjMvigjfF3I1ubHwCOFGDtF/
 nGx94udpVTLwn7id9uydWUkzCWK/6zUswIyHaPIhMLu5m0/5tt0zWzrS2
 M7dGYWnIJaQ6ipJIIW0zWxhOw46gaobDwCg07TyLb6xLnnSdUKQhZBOVl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371885914"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="371885914"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:34:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890055059"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="890055059"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 13:34:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 13:34:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 13:34:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 13:34:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glTj9zRoGfPbeKLEFNt/zm7IOupWzPY+ki8bD/6DRSNMkGZaxrrnAFCoHmH5Xaf+51BISDiCRWugeZ+j5vV5GKmf6K5YKbx2F4psxDcB6ntAkNCLKx/dTT9ovU9DJEXN863W4fjS+5qdxqjr6Frc/nVZaodNfwCBBlDvEnRrAOoWkfu7U9xCvVTfi7AuNmrR8qv7uouEgZQnJIoImc1NrnSXrlR40fKt8xLqsT8GQifBLbwknnR+6E8FkO/SkEbzFsXWVYLdmXHEWDSTDeogWu0kgToxVYprE2WelPbGrYUqv7UR2tMzJUalCyeMKhUKUtwC0gtUO8bjLr55MbgV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFPrSt9EOl33z+JT11w70Y/yUfzcaYL7yIrbfLKAVTE=;
 b=V7mrULPARrkQaOyTRl+FbeF6Gwxbo8IRRPftSwzy1bXWn1h5UM0Siz3RpQzzMXehTiSo96m+Tft/08Lke9enxjpXmAH1wdhzbH6toizy5OtHH1Azzc6W+odL7LVFw9YsH0ik62sfGZk6Y054+RWlxYTO2UWNMUDuyULuN3kDaKjlV46gPIKXjnAGQjuUMvKtEN9sK6C1du0yqhzO9Jww+zM6JCJBQhFO0sGBHGl05O2ITxPd6aQfvzEl/O6k/wig7dZwKmQ76ZqKZkpkOLW1M5jnufZpSqpYNxjOylAQqexvR73nDZfpvwmOPExRDDbvKxit0P+zbNXdD+5NoJqPdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 21:34:37 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 21:34:37 +0000
Message-ID: <56e02c1c-bc49-4ee3-ac45-f5d5b4596bef@intel.com>
Date: Mon, 20 Nov 2023 13:34:36 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-16-michal.winiarski@intel.com>
 <n4gpq5spqopx3mgajfln7s762y4uv5lwwbirjfrragkfanbg26@7gfibmbjccwa>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <n4gpq5spqopx3mgajfln7s762y4uv5lwwbirjfrragkfanbg26@7gfibmbjccwa>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:40::41) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: b03a35c2-43fc-4260-1890-08dbea107efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18IzxZPNc1C36JhfzBDvjFilW+f2FLROVArSaXFC8iiby7PDTw+WvpHFKciWK6BtfpoZkCias39xSGZ59HxBH1oQNTKyzMUxpAs8lU/HD83v7aNPkHcZrIe/t7sWQsaO0DdPTXPgmOTY0/at+YifYXbLvML1XvVb4bjAM0N8Ng+rn3R27IIBX1pt1LlCiKLSb94iVWsUuJN4GU3H10IJaUemnK/Rz+3ECmmdNbzTexRjpIDXvjt4FVSh1IfART2/Hl696JI/SwndDjXUodUWC23CY8yNFe9OPR79nxdUDky/K4oExlcWfEr4kdAZH2v9TbsgnIkaJRqeVfI6UssWjKAyWqTL4JR3M1P0Q0w2Rh7aTI9JSH0FJDTYfxboD9iCUXtkC9t0tEHCrLr0dOQvR/SzEE4621sZD4vrmyVHWIS6NCnmmbdfM16RVAKk5/ULgewn20wAh9e5PDW1Pbm+7y5nXxSj8Le2JwWlx4+rzy9d1nlVs/i2F2se9yPc7WMOZ8QpRNzHN5PvllKYYtQpn1gRg1/A50dmHhWhasYVrWx4yoZD5gudtMpPkQprt0CX2gAMQymOxdgV781NxwrDpWFgYBhtgab+ssu8a2bZpCS+zYitWjGgmljTj+GyIx4xDYqdnkqINEJSxWyahWEuXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(39860400002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(6512007)(53546011)(26005)(107886003)(41300700001)(4326008)(8676002)(8936002)(38100700002)(2906002)(5660300002)(478600001)(6486002)(6506007)(110136005)(6636002)(66476007)(66556008)(66946007)(316002)(36756003)(31696002)(86362001)(82960400001)(31686004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnoyREFpclY5Wk9qdFVzWUY3Ymw2R0NiM3dHbkJDZnFBRENqc0NoSHNjdVVH?=
 =?utf-8?B?dWExS3M5c0tGQngzMG5OV1dmUlFaSXBLcWp4Qm1QMkQzbkJ0djZwZUdzekF3?=
 =?utf-8?B?ZEM5cDVLNmVkZ1FzTWx4SlBQRUUwSGpnZVZscmxPWmxmbWlGNmxuZ2J6Z2kz?=
 =?utf-8?B?ZjdxT2VTYkdtSGIzSUlHYnJ6Mm5HREZ0QkMwQWVpQVEwTFBsWjMvcUxxdTUx?=
 =?utf-8?B?TXROZ2Y4QnJzdUtzNTdrMXlPN3UxajlNZG5MaUhId0ZxcXhBRlBXZE5heUox?=
 =?utf-8?B?UDRqcU5waUNENjNPR2VOVnM0Zk5xMWpNU2FaT2M1NUxlTXlZSi8yRE1SNGVk?=
 =?utf-8?B?dkVKSWwrZ2NmbzI4bXFGNlVJL3R6NFpqR3A5M05yUXpqTG5NejdCVHpLRVNy?=
 =?utf-8?B?aEZkc1I1WFVqclVWYlJNZno2Y0VOM1kxVlRORGNrM3N3bjJCMXI5V1NxSjg4?=
 =?utf-8?B?VGpaVXJlU2pnNzc0cWgrQUI5VDlFNnMvOWloYk5kcXpMcnlINUJodCtpVGkx?=
 =?utf-8?B?U2lKR1E4SE5XdklybnZ3R0F4VlJOWTVBaVZqQjBjMXVRQktVKzgyL3lrWGhS?=
 =?utf-8?B?MytsQnVQQVFId1BnblFmMUt0K2pVeURnUjdMZkRhZ2I0V3VqMS9qMmdudlJP?=
 =?utf-8?B?c08zdTdsOERTbHplc2Z3bytYb2Q4WXNjMk1RTXpQSXMxZXQxQ0FoKzRlSVJa?=
 =?utf-8?B?QnpNaVpCQm5RcHlOQVBkZDRrZU5sRzRYbGVpWUxJbWZQQXN5eFo1VVVKZW1W?=
 =?utf-8?B?UUZwTDBLQWpBNnAvVWZDS0dUZ3AyLzA3YS9UL0dKZW1yTkJhakJOK2szMDNt?=
 =?utf-8?B?RTFWQ2k4UmZCRnN5Q3ErVlNSbXFxNUoyWUcycE15aUlVK3dIWHZVZDJmcllG?=
 =?utf-8?B?ZzFGdmpydjlHUVZ6WFhiTERBa3NSVzZ2N29DZ3prVDEvcmN0aWo5bXpWbEIr?=
 =?utf-8?B?VTFtS2tvUEtuNlI3UE9BL2dxbXhJSGNRdTN1ekNxdjBXVmc3SzFuTkNjeEhZ?=
 =?utf-8?B?b20zTDhwVFV6ZjJRQlUydW5Dck5ycitRMlB3ZW11WmNWSzFUVCtUb2duZnZq?=
 =?utf-8?B?cGthdFgxZlVtNnpkcFFLMWFIMjJJUk4vRVJJdFdWQzVKazFPbVlRc2VTZVZl?=
 =?utf-8?B?RXNrMFo3a3NOZmhLRFdaOEZCbHQzL3ZqVGRQYlNvR0NMVDl2QUZweVlGUGc3?=
 =?utf-8?B?b0kyYjJXRFhKb09xRjNFUU5TaktndStuSzh2ZmlndDlIRmpOVWVUdnZpQWhF?=
 =?utf-8?B?YzB1eDdGTCs5ay9pLzNMQWxHYlg3NUJrM2tUaVREcm1hc1AzcE1GRDVqWXlB?=
 =?utf-8?B?RVhOQzQ1U2w4VWl4dG82K25aeUdjUW16OFJ3Z1dRNVlRWHl0ZTdFUisvOUNp?=
 =?utf-8?B?M0hDUkRnZHBkQXZkWEg2alp3SVMwSG5zZUpzSnhrQXdhV1hDcmhQdWlXZjVq?=
 =?utf-8?B?VUh4b3BCKzFsVGlZL0g3dTZ4T2dvM3dBSTRQa3FoNWRSMnkxMCtrczlLaXl0?=
 =?utf-8?B?dWsvZ3RVbG1SdFJycS9PVklXVnF4cVJOSGFJT0pET3ByL1c4TUJKSkR1S3Q2?=
 =?utf-8?B?djgvZEkxWWF6aGQwQnlnbDJPZWtnSGE5QlZOMzFLZ2RLc2UwU2k1aTBHQWJX?=
 =?utf-8?B?ck4wYWIxUmwrNTRwbTV1QWdOSjJhWjR2ZG9tcm1HZk9iRmNSK3BUN1hYclFz?=
 =?utf-8?B?V0NaU3BTZjZsUGZ3RGtCc04rblg0TUszTUtUY1Y1dUhObklHQlVyVXl2eWRo?=
 =?utf-8?B?V1R1QUtTVE85eVF1aXFpODkvQlNYbTJsWFVQbVBGV05ncTMwWmtBYm9zWW5m?=
 =?utf-8?B?WXhpQ282bXg5QWdEeFJmRGRkRXp1TnV0a2hUMHJlYlNjbkV3UFZMcHpWNWNi?=
 =?utf-8?B?NDFVRXVCSlZsZm94M082THpuR1VuVW1US3pTd21OQ2FZMStQRmRYeTNWQ0oy?=
 =?utf-8?B?ckY0Q0c0bFVCb2ZDNzBPWENEdXErR1cvM1N1dFBlYVppdEt0WWJhVWh5azht?=
 =?utf-8?B?c2I1UjZBbG1iNmY1QURCQVByNERLbTNBbVRkUTFqVVpKbDUwdWxTM0U0ZVZ4?=
 =?utf-8?B?Z2ZRdElmR3J1dUk5SEs1ODV0dzM0Y0JCVWg4SHFhZmQwbUIyM1dhd1d6TlB2?=
 =?utf-8?B?VjFJTFRicnJlNVplREFKUDkzNDgwUUdvSTgyNXdRUllIZkZJS2VmSHZwblFk?=
 =?utf-8?Q?mnwyR9huYmuf01zhxPszyzM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b03a35c2-43fc-4260-1890-08dbea107efc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 21:34:37.5013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GS3k2zZrtodUQVVwWiZOTRifDlIWw8wdhOgxSg/YtxrKMp91wqXXuu6XkPCvXHd3KOKnQ898npfLIYJkdAvxexzwQtHKxEX1/8gIH6tZytM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 15/20] drm/xe/uc: Store firmware binary in
 system-memory backed BO
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/20/2023 12:04 PM, Lucas De Marchi wrote:
> On Tue, Nov 14, 2023 at 02:02:26PM +0100, Michał Winiarski wrote:
>> The firmware loading for GuC is about to be moved, and will happen much
>> earlier in the probe process, when local-memory is not yet available.
>> While this has the potential to make the firmware loading process
>> slower, this is only happening during probe and full device reset.
>> Since both are not hot-paths - store all UC-like firmware in system
>> memory.
>
> is this really possible? AFAIR we needed it to be in vram for DG2.
> Or maybe it was a WA that is not needed anymore?
>
> +Daniele. Do you remember any limitation here?

It's a performance thing. Having the objects in vram makes them faster 
to transfer to WOPCM, which is relevant in scenarios where we need to 
reload the GuC, of which I think the most critical is the S3 exit. I 
don't know if we ever took actual measurements on how much faster 
loading from vram actually is, so no idea if the performance impact is 
acceptable or not.

Daniele

>
> Lucas De Marchi
>
>>
>> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_uc_fw.c | 4 +---
>> 1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index df46751fb5959..b04dd7d034d83 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -636,8 +636,6 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, 
>> const void *data, size_t size, u32
>> int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>> {
>>     const struct firmware *fw = NULL;
>> -    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>> -    struct xe_tile *tile = gt_to_tile(gt);
>>     int err;
>>
>>     err = uc_fw_request(uc_fw, &fw);
>> @@ -649,7 +647,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>         return 0;
>>
>>     err = uc_fw_copy(uc_fw, fw->data, fw->size,
>> -             XE_BO_CREATE_VRAM_IF_DGFX(tile) | XE_BO_CREATE_GGTT_BIT);
>> +             XE_BO_CREATE_SYSTEM_BIT | XE_BO_CREATE_GGTT_BIT);
>>
>>     uc_fw_release(fw);
>>
>> -- 
>> 2.42.1
>>

