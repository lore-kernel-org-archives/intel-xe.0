Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E2C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 09:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFFF10E0CD;
	Wed, 16 Aug 2023 09:51:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133B210E0CD
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 09:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692179494; x=1723715494;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=n/LZh4WOmyO5XWNYRHxhnm3m5Z0HwvzUy7dvf0S6Xw0=;
 b=FyC8uAzbJTmaT2MrMChAtnZaisSmqQhXmyzGvz+sXjpW+DMUDUgIJkC9
 +4Cwqvtrr/SOGSbu9nrO7lS2CKnD5GiMilHvJUrYoR3bu1CMZuQgvXUHo
 2eeO4gNx5fsbyzg/eJHnI5oj8uDKQsCl2RXBich9ey0Kc5FKlGfgUCQ/9
 pLVkwrZkUfwDsb//YGt/fZWCb0C9EdOswf3FBfLcPTLAHMcr2VViV+1zG
 rTe9lGcSeSgiLcT9Y6vv0LzMEig/KXSECfbDMwj7ULHIkhEm9E8CbibXj
 NaRuNDknx2Twp9G8rWcBrveW/QFJI9YuVqxlGKmBpNSBzaHXdQxFQNtds A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458842373"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="458842373"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 02:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769128928"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; d="scan'208";a="769128928"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 16 Aug 2023 02:51:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 02:51:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 02:51:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 02:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lnq0Q759R2wefsk0bm1Forx7B+XGWsBiV6xLvJBlyXOLLpqxo5+dJcnMZ+X3yGWZUWAyC22vpLvze+1EVXbA7xAjpdYgXFAOx27CBNud3vPMG59lEgUNB6c3K1T9ebgAqbkMM4mceP7L0mUB4NLGaVbbMQ6XAueKI/SkRDYP4mMV6qLoVDBzbb1k8Py1/UpCGtXl/XempTO5FHPCn7eXwDe716yWfFrp0jyMkL1kYokNG+u6Mpw0jOljBxkeNaSbQkilI4PU8KuCGKmXnGfHKV1OCa7gqPJZVun4D1FNHOrDy1+d2AO9RxnqWpmBsFVYt7GM34f65OjxpiScmvEt9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZqprFVogz3pE30zx4DBc5xoifl+FVqVgJXgcg5UrDc=;
 b=fE1YBkuAY0ppclH+Qqb10rT00fZgy1t6xCvjZON52IGV4Lo3TiG4rDs9YTipAKCMq/CcMpV78raaaPZ8Phm8TQQM5ozA9HJpW89JzOKjA65ja2rJMlZhfng3cYJgh0POXqg0N0FBu0oWIQx0p3CYA2p1oxFiEtyVsm7fa5w28Jf3ynwcBn/J+L0R2w+An96Pw5Uuo0LRoDALG4Da6xkThy/K9h3Mv0g/8Jdm8d6IYgofqr/8BXhgmEzFKKDNuZm2kOWKDiJBbt/lBaFZ2fhlbOWDCKQYuirERL8OnYwxq2WlgwFHVKho0VVHQFhaCotMcuyDUx4Q/3ctDq85j5qrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SJ0PR11MB8293.namprd11.prod.outlook.com (2603:10b6:a03:44f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 09:51:29 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 09:51:28 +0000
Message-ID: <a9466c20-b73c-ad2d-931f-3af5dcc37b4c@intel.com>
Date: Wed, 16 Aug 2023 15:21:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230809140746.1614908-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SJ0PR11MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 164146bd-4cea-457d-5e54-08db9e3e5ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tk1K1zlqJFkS/gWAGMgumM7cYiUJCZ6KcPeoYMltfTu5RifNZ9o+0LcjDptWcQbXUBmJ+YRrVgeQBnktzekJURBuh84FaCUIyHxkdEgLn4jd+cdupoYmHXcGn0+KNyMOkpxvS6YtOxuvHG/ernFHzFi4C46mInjLf8Vz2x5uaPyRWvs978dMREpKoCtQ4NRyYjlywmLQgJn3VQwJSBOmiwKkxap0Z5H+EE0OJZ/mr9S22FKpkhnkMqFT2K4ayY4ZuCE49XtC12dE+mlwmI7/CboJhmH68PX1whRNDr0ebsjVwYuoMqPUOaRIN2wYQOICqmk+8Jkj4jz7YbSs0RmyRi4gwfD/o0cFnWICcLbn7IUhi844uitNcOvpQywepw/fMYl6IMcEC9ygWdngXgodd2LIf1MG7NWOpZyuJLTMy31UmvBPw7T9CRgKkle9cWen0285D2gkiFpENj7zkBgRij1xP0iK6uCdzpVGBOGFi9O9zclweB62z0xJnimefH5AhQbpA10nC/sJGWRxA67RdcFU0tBFP1Kpv73Zizok6vFdLa/eFMsDyeEL3QQ2oZjIAtsSVAZH+pbaanc1Srkd/hVQS9xAH9RJQU1qcGFv2aNt1qmHwocNBa2zEh9VH/yvGOzkhYj2k4/ttHr2AGB0Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(316002)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(8936002)(8676002)(31686004)(82960400001)(2906002)(83380400001)(26005)(478600001)(86362001)(6512007)(53546011)(31696002)(6506007)(6666004)(36756003)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzlLN2s0em45UThNcHZ6NE9XU3JwNmUrWkNveCtRU2JqUThnV3pndmw0TCta?=
 =?utf-8?B?QmJob1piQjE2d1o4OFMvZXB2VWN2dTQ0YWdTRUhLU056dytpYWZkeTN0UTF1?=
 =?utf-8?B?Y1paN3QraEVrSkNkaEc0ZFBPMVJNZDhrK1BNdEVsMXhUeEN3SlY0bVFiNE45?=
 =?utf-8?B?OGltOWVPTFdwT3AxNDlRcUREU2VUaER6Q21KcGRmUlNnaXlyQmxQUFFob2c0?=
 =?utf-8?B?Zk9BTXBRN0dNZ0xFZm1MWEI5eDZPYWNZWUpOTmFmcFljZUZYOFlOM0I4SDRO?=
 =?utf-8?B?OW9PS3FlVU5obDgrNm9NV09lc0hOZ1poMGRURXM5Q0NHem1xSVZEUzRMQzFP?=
 =?utf-8?B?TUQwWGtVdXBKT2FwZTJGRnRBZE1tYnVHbEtmSzlPOUpvRmNIa2taQ2tER2lm?=
 =?utf-8?B?WXB1aGFkUklpTERUUlU4dTI1elVaY1M0NGF4Y256Q1JwMEZYK3NXS2JqcGps?=
 =?utf-8?B?NjlHdVFGOUJpMTJsTmdMbVVrT0h2dTE2dldaK0g4N3FNeFZSM2xFazBuSm4z?=
 =?utf-8?B?emVnWE5GNTMza05xalJNSVFMZGNJZXlOMzRKeVBHZHprVGNFVnZiblQrbS9P?=
 =?utf-8?B?TFh1R0FDMWhTL2ZsNDY3cmdzOURtNTBIWWpjMFV3SWM0Vjg1MUwwMFNzd0dN?=
 =?utf-8?B?T1oyZ0FFQk0waGh6bjlUdWo1NEJqdHJFQjVjQ1BTS3gxb1JKcjRZM2g3RVV5?=
 =?utf-8?B?K056YTZsaG4wVWRzaHoyd0dNUnFhYldnOUVzSHkvU0VEVjZKKzJyODh6WnE1?=
 =?utf-8?B?bXdMRVNRTWZXbktjTW1iUHc0QkdQc1FKbXh0UDVCVk11aGd2enBkTitnM1pz?=
 =?utf-8?B?VUFYNHg3VVF5SytxU2hISFl5dU1DWXpIbVN3WUNmRTBIcGVydnd4RkRBclBN?=
 =?utf-8?B?OVNFeTExY0pQWmZEQ0U5R3RTMHpPbml4NDZoYVlLWmNGbzRQU0YyRXh0U295?=
 =?utf-8?B?NVlKNEFjOGZjVGo5blJTRERuUHhvbDhTZG0xc1lRaEEvTnhrRTdxN2hTZ3FU?=
 =?utf-8?B?NGRNTDlZcitVbHFXSTFKd2dPZDRhV3h0SUdTQUJRQ0ppcHVrL3dmN1lCOEYw?=
 =?utf-8?B?emV6K1h1bXZHalU3UHQ2VmNscUJCZVFDL25hMy94dzVZaG9NVllmUkJPV2x6?=
 =?utf-8?B?RUJyaXFlSEdaQ0NndnVnQXl0SEVOR1JTMFN3ZnFkYXRsU1h4NFV3ZXRIWGdS?=
 =?utf-8?B?LzljancxcHBXb3NGUjcwYjdaa2NVZ1NQTlNrckJiRGZLS1dhNWhhV1R4T0Fp?=
 =?utf-8?B?Nmt6SDE5RG1paWtZWlBVcnFuZG1pQ3krSi96enJWcXVxL2lJUmlFUWhjNklD?=
 =?utf-8?B?NlVta0JmbTIrTDF6LzlPZHd5Y1l0b3ljamZZekd3Z1BpTUdYVHZJR2dDMFll?=
 =?utf-8?B?aFJUVHFacTA0M2NLSkJnNk1JSHhGYklVczA5RGRKNnpRNlJ6NVp5Tzc5Tkpr?=
 =?utf-8?B?c3BNZUNYcUNEQ29vYkpJcFhBOVNrL3dhWWhoeU5nNUtYQis2WDRsMHNJN3p5?=
 =?utf-8?B?MFR0WkJ2Y3pxYkFQVlZKUWQvdXUzWnlheVpramt6M0ZBQVg2RlJaMWl2clh6?=
 =?utf-8?B?TE1qSkFPSEp2MFFmVTlSQkRJRkRKTHdmQWQ1TjNLRHpURmZMOGJHRjlOTGFk?=
 =?utf-8?B?bG9aWTdoUnFRa2FxWVgvS1MyeFlySXQzZXhYbnh2UHc2eldGVENyYjRpR0hM?=
 =?utf-8?B?OXp5bHI5RzE4YzhmZ2pMT0NtNWxPb2wzOG83elhLUnlybUhHemNQSzNXUVgx?=
 =?utf-8?B?Q01FRzhUTnhPbzhxdTVsdTdQYzFORERNTzRicHpoNkNVazlEMS8xY01KTnpw?=
 =?utf-8?B?aTBDa2NUeU4zS1gwR2lWNnRDMHN3UnQ3UG04UEphdE43N25INnE3a09DYU5s?=
 =?utf-8?B?TVp4QXI2Q0I4VHV3dHV4TmVyUXZDTkNSNmE4WWpNQ1p3Skp4aWNmalJBaE1w?=
 =?utf-8?B?MjBoUklkYnI2V044cEh5eTNPNkhVdWsrTUVjRmNFaUhrVVFEUnd3UFRUeDho?=
 =?utf-8?B?elV3eVN6V011NmdkM2p0QmI0K0x3RkprNUZqMnBZZXZCRFVuaS9VRTN1YUFq?=
 =?utf-8?B?b1ZFU3ZiNFZ1Wk1ZYklGVStmZTNvWUdJQUNtRTlFOFpsTFZ6SWNLcjBtdy9X?=
 =?utf-8?B?dFJCMGlmTVdwNTJkWmZCdDByME1BdkFENm1LTGtROUZQanU1UjRIZmF6UC90?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 164146bd-4cea-457d-5e54-08db9e3e5ca4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:51:28.6009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RQ44z9EWhTelTt9gHiIBcw+/NFbY2gZO/2/x5FfuCG31OTb8lMxrDyAgmFtP3iVn87EDSzjxIiM5Pa26tI5DTcbRNDPwqR8RuRdU/lOgLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8293
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 0/3] drm/xe: Add drm client infra to track
 client stats
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



On 09-08-2023 19:37, Tejas Upadhyay wrote:
> This series adds below in corrosponding patch no.:
> 1. drm-client infrastructure to identify each client and its related stats
> 2. Interface drm core fdinfo API to drm client infra
> 3. Adds API for tracking per client buffer offects

I think adding more details as to what you wanted to do/track and how
you wanted to show would help get more feedback. eg: which interface
exposes this, how the output looks like.

Thanks,
Aravind.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> Tejas Upadhyay (3):
>   drm/xe: Add drm-client infrastructure
>   drm/xe: Interface xe drm client with fdinfo interface
>   drm/xe: Add tracking support for bos per client
> 
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_bo.c           |  5 ++
>  drivers/gpu/drm/xe/xe_bo_types.h     | 10 ++++
>  drivers/gpu/drm/xe/xe_device.c       | 14 +++++-
>  drivers/gpu/drm/xe/xe_device_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_drm_client.c   | 71 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_drm_client.h   | 71 ++++++++++++++++++++++++++++
>  7 files changed, 174 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_client.c
>  create mode 100644 drivers/gpu/drm/xe/xe_drm_client.h
> 
