Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E97BC5ACB3
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 03:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502AE10E1CD;
	Mon, 20 Nov 2023 03:32:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF2010E1CD
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 03:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700451176; x=1731987176;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KQgKuVsqqoD2X/JhRt5+A17i9TI/w60dpKtmYNBnrSo=;
 b=hhIjSEkDLdkA1ebAfCAe+2HIbU80RpNALg1TkxyKdlRxTqaE//sTeN5u
 D8u1pFFOGydS0FxgLee8Ti+dCpGKoBtIavJHGIxGq3MnCVnF8xJEnA+AN
 BR6oYYROgEVvDITwHOsU+QkqTYP2BWpa6iatueMf08GiQxozx4daUEHlH
 ntgu0nDG3SDIGynNnszODrohQP+VOrB31n5Ef8kzT1wEjKdvCTXChL0HO
 CQgyinGzjchP8qHQuuikGyHkGm+XzwMY0N1MqBAadlhpaEsdGrZo7IutG
 s2AcjQbVaz5mRTse/2lDcPI+k/bTUo4fJfYITEwOTX/EcJq4nA8xU//MF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="458043286"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="458043286"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 19:32:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="836611598"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; d="scan'208";a="836611598"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2023 19:32:55 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 19:32:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 19:32:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 19:32:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkoaKU0ScnaSnd3h/Y+BIYwXLSEMno0R4xtOqioYrV9nVaE/zkXiAsYnhDBHNBsXVioYYM5+5l3WaWtB+U2dHff14QafZ1QMk1ZgjCQkq7sha1RhIl6rzchAlVlS4TsYPLRhqAXfOy+/2bnOt3wZCxJllE/v0VjQKp0J6ZM/6K6289lLu95Gdjna59MC2KMTroyFozI+X3Sc36iazfBng+ok/IbfzSRWLRsDCATHdJ5RUoodLIrRiL8eGVH5zJZg7MJvEufl0q2wi/bhC/kTzzqlK3YE85jzlEb017fp5gpb4t9hdfNW4JmQtGxi+r6n+gemzIxBL0muL5tU9ahBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHFFSX1y10fyfdvUGeHQxZQHNl+yRvzIzyY3B45FymA=;
 b=NL84dqnUTdsZ75+RIZ6CmuSB8ABenZAB6/qjqtPqerZFstBzyfdt9PXaH9mG0FIRblSuTR0qbRluDKx719tTn9QcVx8Mja3/Wca2EDh8426zwLO/++TsDa0vnV5lFtnpYbTCOWWLN65iehlgs+ZseO0u0E7aAhcotrB1bzkGaEveQmnKjshhTJ7Uu37xOGl8QfTtVN+XwCPq+9ZvgEmcHmzsIx/NvMWNrsnCIQxXwnPiGrT50RIPu1wM3JR4sL/N9OSDLU7i3FCpVwZxpUs2El/6Fgot76sXDR0ozEDV49xvMD10sTL5WEtrSTvfLejinyP4VDEV/xcrFyQCXQXQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 03:32:40 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7002.018; Mon, 20 Nov 2023
 03:32:40 +0000
Message-ID: <ebfaa922-6608-41f5-b8cb-b63d5c7617b1@intel.com>
Date: Mon, 20 Nov 2023 09:02:32 +0530
User-Agent: Mozilla Thunderbird
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231115030111.770130-1-sujaritha.sundaresan@intel.com>
 <20231115030111.770130-2-sujaritha.sundaresan@intel.com>
 <ZVfcEpiH4QGOX7Gx@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZVfcEpiH4QGOX7Gx@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::20) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aeb301a-81f8-48ab-ef18-08dbe97958fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mzBgiTRbNKDXfZkoNRQ7Dw4IEqcJJp9Dzt7DQMJfzT4iRrTQTgfVjCWD5CwFpq71lG8RunWmBo8AQfWViO6cWY7teooDpDbHoNnhLsv//djrz4Zx2CiQbIBKsDu7/ibssVqsSgGGJcWpkGEPxpsdc7rDdibfo5yG/JrRxTodVXuhddDrexAGJgSJyHJLubEUpYz8zBj16e48fbg3INsI9tmCfeBR2xRkFLvIcfTpoL2O7FZLYDlVWL5KpOuIJ3YFSxtFBDQCZ3T8ch54UKzA0GBPVefFLaUEd+j4Tq3azP1MHaAtNELcjXWo9TlVpZUfmoY+HeNu9igRoxWI1p9VhFj6dGCdoO7iLNRAeUiCWRHUWmPsb/cqifRIzC0hCLHXtxTIUGCI479yOsRaXsAo84lu102QXwbAjSrsPLl3Q1CaUuvz1zGN1BKcA1S0bhXaqFrZ64BtOEFw5H/mi2H8lMKK84tnneHbRALJ6qN1TNNk+KiNvHgDok4hKiX4/SUeB+tNsWXoOUdpHzOIf+L8/q8NdrtOuP6sSZ5YlAax6AzVRYVsRh+VASPMf95LNKrvlQkScu218kNf0TI9ZJh4pL9Ecfk+m4TiNfvouEcaWOIw85GP1dbFkkNsTtmCqUjUIrrbtXgZNgTHt0JD1anm3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(366004)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(31686004)(6506007)(6512007)(53546011)(26005)(66946007)(66556008)(316002)(6636002)(37006003)(4326008)(6862004)(8676002)(8936002)(66476007)(6486002)(83380400001)(478600001)(2616005)(82960400001)(107886003)(38100700002)(6666004)(5660300002)(31696002)(2906002)(86362001)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZURZaWNWalFiS0l2eURiMEt4T0ZJQWE4VC81TTRJOEk1V29mTUhLTFc5bHEv?=
 =?utf-8?B?OHpGRVZFR2c4S2FIUWJZb0VWaDZ1cUdpYitqK1VObzFraFNhMEFlcm5ZWXNa?=
 =?utf-8?B?RWxCREUzc0JBeVJveGNFUjhZSDlGZ2lKL0lBSnl2RW40S2V0VnMxZEFzTHZ0?=
 =?utf-8?B?YkVhWW1POGtWTWM2ZGVsdGU4RVowNWJZVnY1T2tZMCtOc2xXSld4ZDZyeG1Y?=
 =?utf-8?B?eFNsNDJJdUt6eE9wQUhDN2VPZGE5cFQrcEVwc2pMcTBsUmpkVUhHVzJFYWIw?=
 =?utf-8?B?cGxVMG5NOEN6SmkvN3JWMFh2eWUzRDVPYUZTQzJhNTBPZ0lEL25oc2o2V1pY?=
 =?utf-8?B?YlJqU05nOXFmZHRvVzhZTzVibTA3Tnd5TTU2S0hBSkVoV2hMS2NpNnE3L0cy?=
 =?utf-8?B?eUVNMkdkUjRuZ1R1N1VBWElLTnFTaFNFYXpSZ2JYOGZBaWE5TWdRSlo5NURL?=
 =?utf-8?B?eDdVenpqNG1TZ2FKUUdSK2lZY0VpM2w3V09INjJ0c2hMZ2k4cUVRNnNWSDgw?=
 =?utf-8?B?VzExK2J5VXMwbHFVQ0RLODBzMlNRZ1dES3dsbnNlWjF6NVJWbG9Cd24rTi9k?=
 =?utf-8?B?QWI1Nm9JWTNlaW4rb1RMUVg1TkN6ckpZVjk0aGdMSWFIYXhsaHE1V2JBcmJi?=
 =?utf-8?B?ZXlxTDRjMGllWENMdndMeHZVREQ2R08rWnY2c1VlU2d1OURXRUsza1djTHM1?=
 =?utf-8?B?MDc2M3lrd3Mra3lZN1hpMk1JT3FoUno5cGJyUStROENNRHczclhncmtUM2pz?=
 =?utf-8?B?MCtTcXh6MnRZOTkyN2pIN1hzR0lyT1JNS0wyZkEwcEVmWnRVNVJyd0h1cnNW?=
 =?utf-8?B?b1RxMktqdlJiOHg2YjBwZ29aVE94eFg1bHVuZ2RLUXpiUTZJK1VnaUhNR0N0?=
 =?utf-8?B?RXh6TWhWbEoxeXdRdW1weUZRVVVYNWYya1R1ZlA5WG9QT2RMWUVoNmF0cWJv?=
 =?utf-8?B?eDA5S2pML1B3RUFFbHZEcGZ1Y3BnNmZIemZINkwvb1R0cjJFaXM1RlJjSjg2?=
 =?utf-8?B?RTNWd1dmeEpFNTdqc2U4THAvNjRKb2NCd0EvR0dXWFM4NXE0QzJtZVAwc0Fz?=
 =?utf-8?B?dFUxeWg4aVlUN2hTb1dYNjFJalZWbHJMSFBZdlB2Tm1VemFJcFdPaVBHa1Qx?=
 =?utf-8?B?Uk5RT0Y4UUJsWkQ0aGFZdFNlQ0JDT2F1VHFLWDVnSFVOc0grNi9BRGV6M2cw?=
 =?utf-8?B?dDc2SXRBbXFNR0x0YkVOOHhlMGgyUVM2cWhlYnE4ajRicUt5YUt3QmtXQklV?=
 =?utf-8?B?OFV4eWFuMGU4R3Jwdi82STJoN3BrQStpSkN3bEZmV25zQVgxREF4bERHcXlh?=
 =?utf-8?B?d3hYbnZJdlQvNmwxOG5TMi9EOVJ3TkRkN1Z4YnIzaG5sZTN1cm5UcE1UNTlL?=
 =?utf-8?B?NEQ0NFhuZWN2ZHBDUExHdkVTa0dNai9IZFhmdFRMbXdRdGZsNFpOYTlVRmlh?=
 =?utf-8?B?SXhKMzlieUhKbWRxWEhTSS9XV3V0d2Rma0RxT1Y2VnFuL3I4azV5VlU5L1Va?=
 =?utf-8?B?a2RwU1NaYkJZbmc0cGl3YUlyVzNXbVRYZEl0Lys3VktXalZTdThha2h2bGFQ?=
 =?utf-8?B?L1UwaFhUeXpPdWNTWFhTYk9ZcTRvR1NqbXFmeEdzRXZ3ZjFsaHhKR0Z1U0tx?=
 =?utf-8?B?VENzbDJPSXFab2RWNUVEeEk3K1BvTzZld3BaU0IzWEg2YitVSGJjdVBTVjdx?=
 =?utf-8?B?YVA0K1AxZ09oL0pHMXBlanlHVWlpdGgxQjJDTHhzT2w4QzBkZDVSZVZHWDJY?=
 =?utf-8?B?aUFWa0VtdXFxMGZIWkFtdXVvSzlNUGUvWGRkMkorUCt2Y0ljV3JWcm9TL3p4?=
 =?utf-8?B?cHlwMzNaVWFDa2xESVVqL0hLTFpWZmFhbWFRUG5iZTdYcTZ3MEtKRFNDQm5i?=
 =?utf-8?B?S2FSM1FlazlvZWxOTkcxbUhiTFgycUM2elZjODB0dXRneDJGYjNENjArVnBy?=
 =?utf-8?B?N0hMQjF1eHlyc1ZyVHFONkhxRzQ4d3p4d1VSRWFNTTJLR2ppSzhVeU83ZkF5?=
 =?utf-8?B?MVF5RzF1T1Y2QWJ5TnRWcmhHSHk5Y0xMLzRxellvZ1VNVEF4cGJZOGJjTGFL?=
 =?utf-8?B?bmlGKzhwSnhUV25NT2M1SmZPT1ZPK05BTUhWT3lhdEVwS1ZwdnBEcjVmN0V4?=
 =?utf-8?B?YlZFVWhoWXZqODhTS2xlWkhscHRUVEtjQkhHcEZnYU1DZ1V6Uyt6dFZoY2l2?=
 =?utf-8?Q?ZsOD1eRDdAhFecQKvm6b0wo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aeb301a-81f8-48ab-ef18-08dbe97958fa
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 03:32:40.0575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GS3rLI2EoMn6OlAU1xSpDx8M6/fRhWTetBKamf7C/OFXv1jjHFjP4c0EywJPWrIupo3n2LVofzyymRbHmnuej8RNV+KPm/FFi0kwCW3azhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Moving and renaming existing
 frequency sysfs attributes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/18/2023 3:03 AM, Rodrigo Vivi wrote:
> On Wed, Nov 15, 2023 at 08:31:11AM +0530, Sujaritha Sundaresan wrote:
>> Creating a new freq directory to move frequency sysfs attributes.
>> Additonally, renaming the frequency sysfs to align with devfreq
>> requirements.
>>
>> /device/tile<n>/gt<n>/freq
>> 			|- act_freq
>> 			|- cur_freq
>> 			|- max_freq
>> 			|- min_freq
>> 			|- rp0_freq
>> 			|- rpn_freq
>> 			|- rpe_freq
>>
> on top of this we should become future proof by having a possibility of
> N freq directory for different domains/PLLs.
>
> /device/tile<n>/gt<n>/freq<n>
>
> under each freq dir a file 'name' that would contain the differentiator
> name. probably useful already on PVC with media freq, although there
> we could only read the act_freq.
>
> But this patch is great. Thanks for taking care of this!
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Hi Rodrigo !

Thanks for the review. Agree that it would good to have this future proof.

Will merge this one for now, along with the needed IGT fixes.

Thanks,

Suja

>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 65 ++++++++++++++++++----------------
>>   1 file changed, 34 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index f4ac76d6b2dd..5d64cd041db2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -57,15 +57,15 @@
>>    * Xe's GuC PC provides a sysfs API for frequency management:
>>    *
>>    * device/gt#/freq_* *read-only* files:
>> - * - freq_act: The actual resolved frequency decided by PCODE.
>> - * - freq_cur: The current one requested by GuC PC to the Hardware.
>> - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
>> - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
>> - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
>> + * - act_freq: The actual resolved frequency decided by PCODE.
>> + * - cur_freq: The current one requested by GuC PC to the Hardware.
>> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
>> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
>> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>>    *
>>    * device/gt#/freq_* *read-write* files:
>> - * - freq_min: GuC PC min request.
>> - * - freq_max: GuC PC max request.
>> + * - min_freq: GuC PC min request.
>> + * - max_freq: GuC PC max request.
>>    *             If max <= min, then freq_min becomes a fixed frequency request.
>>    *
>>    * Render-C States:
>> @@ -385,7 +385,7 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>   	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>   }
>>   
>> -static ssize_t freq_act_show(struct device *dev,
>> +static ssize_t act_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>>   	struct kobject *kobj = &dev->kobj;
>> @@ -410,9 +410,9 @@ static ssize_t freq_act_show(struct device *dev,
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	return ret;
>>   }
>> -static DEVICE_ATTR_RO(freq_act);
>> +static DEVICE_ATTR_RO(act_freq);
>>   
>> -static ssize_t freq_cur_show(struct device *dev,
>> +static ssize_t cur_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>>   	struct kobject *kobj = &dev->kobj;
>> @@ -439,18 +439,18 @@ static ssize_t freq_cur_show(struct device *dev,
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	return ret;
>>   }
>> -static DEVICE_ATTR_RO(freq_cur);
>> +static DEVICE_ATTR_RO(cur_freq);
>>   
>> -static ssize_t freq_rp0_show(struct device *dev,
>> +static ssize_t rp0_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>>   
>>   	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
>>   }
>> -static DEVICE_ATTR_RO(freq_rp0);
>> +static DEVICE_ATTR_RO(rp0_freq);
>>   
>> -static ssize_t freq_rpe_show(struct device *dev,
>> +static ssize_t rpe_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>> @@ -462,18 +462,18 @@ static ssize_t freq_rpe_show(struct device *dev,
>>   	xe_device_mem_access_put(xe);
>>   	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
>>   }
>> -static DEVICE_ATTR_RO(freq_rpe);
>> +static DEVICE_ATTR_RO(rpe_freq);
>>   
>> -static ssize_t freq_rpn_show(struct device *dev,
>> +static ssize_t rpn_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>>   
>>   	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
>>   }
>> -static DEVICE_ATTR_RO(freq_rpn);
>> +static DEVICE_ATTR_RO(rpn_freq);
>>   
>> -static ssize_t freq_min_show(struct device *dev,
>> +static ssize_t min_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>> @@ -510,7 +510,7 @@ static ssize_t freq_min_show(struct device *dev,
>>   	return ret;
>>   }
>>   
>> -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>>   			      const char *buff, size_t count)
>>   {
>>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>> @@ -540,9 +540,9 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>>   	xe_device_mem_access_put(pc_to_xe(pc));
>>   	return ret ?: count;
>>   }
>> -static DEVICE_ATTR_RW(freq_min);
>> +static DEVICE_ATTR_RW(min_freq);
>>   
>> -static ssize_t freq_max_show(struct device *dev,
>> +static ssize_t max_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>> @@ -568,7 +568,7 @@ static ssize_t freq_max_show(struct device *dev,
>>   	return ret;
>>   }
>>   
>> -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>>   			      const char *buff, size_t count)
>>   {
>>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>> @@ -598,7 +598,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>>   	xe_device_mem_access_put(pc_to_xe(pc));
>>   	return ret ?: count;
>>   }
>> -static DEVICE_ATTR_RW(freq_max);
>> +static DEVICE_ATTR_RW(max_freq);
>>   
>>   /**
>>    * xe_guc_pc_c_status - get the current GT C state
>> @@ -664,13 +664,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>>   }
>>   
>>   static const struct attribute *pc_attrs[] = {
>> -	&dev_attr_freq_act.attr,
>> -	&dev_attr_freq_cur.attr,
>> -	&dev_attr_freq_rp0.attr,
>> -	&dev_attr_freq_rpe.attr,
>> -	&dev_attr_freq_rpn.attr,
>> -	&dev_attr_freq_min.attr,
>> -	&dev_attr_freq_max.attr,
>> +	&dev_attr_act_freq.attr,
>> +	&dev_attr_cur_freq.attr,
>> +	&dev_attr_rp0_freq.attr,
>> +	&dev_attr_rpe_freq.attr,
>> +	&dev_attr_rpn_freq.attr,
>> +	&dev_attr_min_freq.attr,
>> +	&dev_attr_max_freq.attr,
>>   	NULL
>>   };
>>   
>> @@ -950,6 +950,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   	struct xe_tile *tile = gt_to_tile(gt);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct xe_bo *bo;
>> +	struct kobject *kobj;
>>   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>>   	int err;
>>   
>> @@ -965,7 +966,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   
>>   	pc->bo = bo;
>>   
>> -	err = sysfs_create_files(gt->sysfs, pc_attrs);
>> +	kobj = kobject_create_and_add("freq", gt->sysfs);
>> +
>> +	err = sysfs_create_files(kobj, pc_attrs);
>>   	if (err)
>>   		return err;
>>   
>> -- 
>> 2.25.1
>>
