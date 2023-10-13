Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB980CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 21:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D8E10E649;
	Fri, 13 Oct 2023 21:31:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B4310E071
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697232703; x=1728768703;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yDPVKkNHu9Lh5+amYv7ISaLFnZA1D3TzG6wqjD3KskE=;
 b=Na9FWyYSd8r9EmHi6nJQze1mw13n2su5bAlVXpXYq16v3FuW2G2edIOB
 FLLvBfBjZISEy+w8SgnPkOfYWA9ZqqtIguxJDDiCpgZdV4nrGp/HAH1z/
 TzHg+1ybQRsUFB8j4hgxw931leZn0GxN9jVOFLfN1EofC8th/J+A8S9Uf
 mD0xeDU8e7lcdtxuco+pYKV4DEF/KWPWo2xhj55AERIxTZns5y1eWrKh7
 gBd/ypSi+uk4Q6+Kwsxo4prk2sRMUolqA0GSC7SIocxsgSl2U7CmTEaGK
 MYykIj+D84S12r7uFuFrqGypTF2uaIoaQoyWK27p+4xzame1kG0eFD76U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471501477"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="471501477"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 14:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="748495928"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="748495928"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 14:31:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 14:31:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 14:31:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 14:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDxhyTCeiBCQSqN9+z+32eolHAMRPH0yhqHF/Tj9H/yyfLfsTOUv2stPNyYaT0NG+o4BUH6gpi7DhDmRGtUOmzDkiynIwZjEabrIuYbk2/QiQTDs8iZomsOgYRFIc05a75AsnR0bCdlznJc8WnxEp+6i141SxIkkBLxLWRcRvwkGgj2v+D/ZrajG/PPVIVpmzvBG4q+a10hOCuEWoe7f0kqMY6C+unn/LlC3wX/SuiBj9JPkDcc2dQ2JOVsTxVZLK2esp1u1R+mU9mWT7cJcGlF/BhCJQXhC5NTMX1Z40Jfx4ZePE8TOhPF6xBkm318OH1swoEr0Zg70RPZ33GXcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKCA0PMdLZPIgxjEv+Ja+hJWCgkDPUZHHP541LqU6Ww=;
 b=lbkdu2l54fLHbeptKRLlPrxf+C2VxmQz3CeukL80ONld4ymC09T8tc5ReOa7wfqkI3cHHyouwEZgLpDh+ppx6yL4rdxF3M9S4QE1B4JsfhrfiVvWuwSAMLJmaWejFg4ci4mmJLO0E6GkvisJbNngPP2SKr7SCzS4Wizlz3n1cuUAW+yYTXtaBFIcUUYEFNRKN4yIsJUgIiT8GfAVe2hLdYASr4puunB8XwfjTuWYF6bBzr1zjC9QSxk/X29Z7XLL/Z+YxxVueth2+scdwhntNoeEbksdZoXGEVoyCMt7HaNCOqKft6GfyzrciC8rAwra3gRIsxadKrq9bJskdDU4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BN9PR11MB5419.namprd11.prod.outlook.com (2603:10b6:408:100::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 21:31:39 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48f3:57b4:7dce:f17a]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48f3:57b4:7dce:f17a%4]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 21:31:20 +0000
Message-ID: <c960b9f4-968d-4154-a0ed-52e94e94a564@intel.com>
Date: Fri, 13 Oct 2023 14:31:19 -0700
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230915223459.2964036-1-daniele.ceraolospurio@intel.com>
 <20230915223459.2964036-2-daniele.ceraolospurio@intel.com>
 <qafchp6pojez7hmi42qrz7qsoygjfjemo7uskoi4k4yzchhqhd@lf2hepkprzfv>
 <696bb591-e7c7-4a0d-9777-d6872b7538dd@intel.com>
 <dve6v32diqpvodyhbmwhjdne7bo5cktl3r6nbojslci6q2krbb@4gxpg27byifq>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <dve6v32diqpvodyhbmwhjdne7bo5cktl3r6nbojslci6q2krbb@4gxpg27byifq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:a03:40::44) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BN9PR11MB5419:EE_
X-MS-Office365-Filtering-Correlation-Id: 56dd1f8c-311d-44c4-000e-08dbcc33bd82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KDZliNyQkyMkz1RdNcNQSIKu8TGDid66DRLE0s53XCGF5k5bVAZtfeHsfKjzUYsBWYhwu6rRwDD6/mSeERW97R6yK0aYRWYI0HcFkQXhbP3xSDirD2ciJgGsWyCxsUOCCYYPyzGGCpXspMhh5Map2XIaGa12VTQzrklLbwDfzNINqiudwAAYqBnvkXv1yNWye6ymb6zurIQLXpmUg3ODvVLKgyWSN5mk7oAByPjzCjW81foGt4TMTKQsXpTnXeyIq3ABn2VZce9f6uB4Yzj+HthjbpM1HsMn0b/YYQdBw5llf72U3tOFMSh0QwvR/S4YSa7kK+j61Xlwis5lpgY8tecMzrQkYqKMdbk0/pDqPlRSpQKi/cLfp1khDLiJ/kd8PCxEc/a5Bx3sbXRx2VZ2ahUCZOKIuYpVoOfPhru943boWu6GkL0tyu7WbkUCLTOGTbAgSHUVrDJKhLlwy/YqasSyOgUDhAzbK4jwj6E0teVmnswfOPRk2+8+pgguXSDqBuZrNAUdqm7Y4LI5ztNCf2IRlMXFdIA6J8HC3WT1MMvw+wOQZ/3cUZVRnvA6IqRuM5zRnp0VmrpIjDsKOblVyOc4doAecPKd6EmjenjDe3GmLNAOUMJzwIbqIzlyB9WTqflmhJw6QaxQeRElgEV/qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(31686004)(82960400001)(5660300002)(8936002)(8676002)(4326008)(6862004)(53546011)(36756003)(6512007)(83380400001)(26005)(38100700002)(6506007)(478600001)(6486002)(66946007)(37006003)(316002)(6636002)(66556008)(66476007)(31696002)(2906002)(30864003)(41300700001)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pNYitYQzdKUjFpTGk2amJKVUtXbU95VDQ3T0ZLVTRyS1V5SnJqbEtUL0xQ?=
 =?utf-8?B?L2lTMHFEbUZJWjhDNW1HTTl3L2VVdGdrNFNXY2VYV3NZR2NzTXkrQlB1STNG?=
 =?utf-8?B?elZtbDZtbXRMYUY4R3ZxdUhtNG0yVmgvaWd0RDVaZnRnRFo0MGFWTWRvWnZO?=
 =?utf-8?B?K2t5VTJKdTdFcnpDN0ZMcktjMEZqNTdjR0RWNFpIRmt6TzRJWU5HYjNDeTdC?=
 =?utf-8?B?SDRHOEdaem9SalFwd2t6RjJ2Y1A1U1ovZjJyN1pVcmZ0ZmcxQTh6QlRNR2s5?=
 =?utf-8?B?V25XUDBoRENPM01YZ1hqamlIUTgzd1NpRGcwenczMy9XWEVEWVJxbEw3TVA2?=
 =?utf-8?B?aVJrN3Z4czRQcGV1SFRybU9FcWMyTGxqRTUxcWtlRk55R1UrSlJkMktLa21n?=
 =?utf-8?B?bGo4ZVpsNVZ2WUlMQ1AyUzZvdlFORkpNZjVhbW5DcUZtdXAzVnJEc3pJZzlH?=
 =?utf-8?B?ZkpvT1NLdmc4blcvNjM1OFVDMzFEazBLYWJtcituZnpFQmVsYlE5bGRzeFBD?=
 =?utf-8?B?Tm9BdldsSmttcUZJdE03a0dYKzBBSVhNMmZFRWMwU29RLzZUZHpkRVpQOVpH?=
 =?utf-8?B?UWppUHFvVW50dldnWEdrWWYvOEwvL3piSzBnR1VCSkFwei9oTFlycHp6dytF?=
 =?utf-8?B?d2RiYURZS0hMckJlV2F5TGdtejQrSm9IMFp5blBXS056bDR1Mk5QcDdiME1S?=
 =?utf-8?B?MlBEeUlnaFg1eEdSRmIxdFhpZU1paHFWeUo3djR2c21WbFprbVplNzZmTHU1?=
 =?utf-8?B?MG9MN2xGdFY3cVpqTmJKbnEwSmhsRFByUkRtNGhlTnVjVG4rSFhKZTQyRHJD?=
 =?utf-8?B?SEJqNk9KY0QvSWVmR25QTC90aENFRVhPNVJoTCtJRGxEcWhpbzk5YnFLd3RS?=
 =?utf-8?B?OEtweUFmaTlja0dRN0JUSHRpRkV3ZUs4Um56ZWk4NGNINzQvaXlpNTBCR1l6?=
 =?utf-8?B?bERRRGhaby9hMHFmd0xvNzgzbGM5OFFEa3BLMHNLKzJTOU95U2pGbXVETjVV?=
 =?utf-8?B?WUt6ZGU5ek1vc2RRREJtcGpvbUc4eWVmbnUwTFpIOGp2RTcrK0VHSW0rZmZN?=
 =?utf-8?B?YS85c1lxZmd3NW1WVWJtWHlSa2k3YVRPUDJwUDZ2c0dyWnRtbFVZZEpxSFVC?=
 =?utf-8?B?VFdMNE80NzlQVGswRldaZ1ZQTzkxb1oxNnozREJWYldUcldKdDVsSEFqV1VK?=
 =?utf-8?B?ZnU5WEs4dUhtMlJGbk1Mc2dYZEs1ZmNUaFdUTStCODVJcjFrQm1vMzYxL2tB?=
 =?utf-8?B?UTFzb1d1dElxL2J5KzdLS212a0FKbW9EdHdWUmVxNERjS2RyN3l3MFFtOEYy?=
 =?utf-8?B?QmpjYW9vclZ4cytjM09XcTZOY3lnMG9nemJ6QTNaWTlkb3g5SUJzMFZiK3NQ?=
 =?utf-8?B?ZDJRU2JrcmZ3L2pFVUQzU0Y3NnhlSk5KN0RyYXFxZ3R5RDVja0hQY3dSOGFI?=
 =?utf-8?B?bGlaNURkYXplSjNmVFZDR00yNVZhY3BGSHhoclJlUXdteHNsQlBXVFlPYUY2?=
 =?utf-8?B?cTh0TnZsYWFNaXdxMzY2SmU3SEVCVHE5eWNXcXpORzdlNXI0UVhnNXBSbmRa?=
 =?utf-8?B?UmpIV0h3clVYQVZkL1h2M2xKUWYrSEFhTG9zMmZVU0JNTWlIcE9tYitEa05V?=
 =?utf-8?B?bHp5NTJ0SGVHTTdnNnR1L0YrWmd4REhrWENoNG5IOHhWc3I5bXVud0V3SXJW?=
 =?utf-8?B?bm0wU1U2cWlDRnloNXQ4aGsyRUFTYStyQzNLUEcxZGppM1RNTHN3dWNCclJq?=
 =?utf-8?B?N1BIRzVFYXd1a1hNNkFwYmUrcG5BYm9PcGhITHRWUDgvd0tZaGtzWG1neENs?=
 =?utf-8?B?RTFWM3BuOHBrRDVaNmw3TUtPN2c3ZzVwbUFzZFZnd0tLNXdDeC9oelZZamp3?=
 =?utf-8?B?SnVEVk9VUFhoSGpGZkJTQ05UKzZwQ2huUkI1S2ptY0R0TzZOdTNIRHlUMDFP?=
 =?utf-8?B?T1I3cWVEWFYvc0IzcTBTR01BR3BTbjV5dy9QMTYvRVh5R3MyckRaWHlxMmgr?=
 =?utf-8?B?c0J6b09GUDFrZHJRQms0NGxDUWxHVjZYRHluQVBKZW5pQ0RoaWJJVUpzdXpN?=
 =?utf-8?B?YjRHcW1wNjhrV2ZwZFhUR1FJbXBKczFFc2V6ZG9yZnlnRENmQkxVbWxSYXNz?=
 =?utf-8?B?UVZoK2YvM0RjM1dLYWZEQVFvMWZGSUFxbGJWcllOTHNCY3J1N1lOTVM1ZmlQ?=
 =?utf-8?Q?3z5gSF4OS8tUbHTjLFZ4xq4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56dd1f8c-311d-44c4-000e-08dbcc33bd82
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 21:31:19.9245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hwv2FxIy6u3JPhqp6gdIsK13i00eXZ+od+Jrcc1JZ2DIByV1C3FMtxXILctd/G3aLP/QNaKSdEuK9s1s//rzcKAWxHin7s3WOd0z215UnqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5419
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe/huc: Extract version and binary
 offset from new HuC headers
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



On 10/13/2023 12:35 PM, Lucas De Marchi wrote:
> On Fri, Oct 13, 2023 at 11:59:01AM -0700, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 10/13/2023 11:31 AM, Lucas De Marchi wrote:
>>> On Fri, Sep 15, 2023 at 03:34:55PM -0700, Daniele Ceraolo Spurio wrote:
>>>> The GSC-enabled HuC binary starts with a GSC header, which is followed
>>>> by the legacy-style CSS header and the binary itself. We can parse the
>>>> GSC headers to find the HuC version and the location of the binary to
>>>> be used for the DMA transfer.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/abi/gsc_binary_headers.h |  74 ++++++++++
>>>> drivers/gpu/drm/xe/xe_huc.c                 | 131 ++++++++++++++++++
>>>> drivers/gpu/drm/xe/xe_huc.h                 |   1 +
>>>> drivers/gpu/drm/xe/xe_uc_fw.c               | 144 +++++++++++++-------
>>>> drivers/gpu/drm/xe/xe_uc_fw.h               |   2 +-
>>>> drivers/gpu/drm/xe/xe_uc_fw_types.h         |   5 +
>>>> 6 files changed, 304 insertions(+), 53 deletions(-)
>>>> create mode 100644 drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/gsc_binary_headers.h 
>>>> b/drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>>>> new file mode 100644
>>>> index 000000000000..666f2665b5b4
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/abi/gsc_binary_headers.h
>>>> @@ -0,0 +1,74 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _GSC_BINARY_HEADERS_H_
>>>> +#define _GSC_BINARY_HEADERS_H_
>>>> +
>>>> +#include <linux/types.h>
>>>> +
>>>> +struct gsc_version {
>>>> +    u16 major;
>>>> +    u16 minor;
>>>> +    u16 hotfix;
>>>> +    u16 build;
>>>> +} __packed;
>>>> +
>>>> +/* Code partition directory (CPD) structures */
>>>> +struct gsc_cpd_header_v2 {
>>>> +    u32 header_marker;
>>>> +#define GSC_CPD_HEADER_MARKER 0x44504324
>>>> +
>>>> +    u32 num_of_entries;
>>>> +    u8 header_version;
>>>> +    u8 entry_version;
>>>> +    u8 header_length; /* in bytes */
>>>> +    u8 flags;
>>>> +    u32 partition_name;
>>>> +    u32 crc32;
>>>> +} __packed;
>>>> +
>>>> +struct gsc_cpd_entry {
>>>> +    u8 name[12];
>>>> +
>>>> +    /*
>>>> +     * Bits 0-24: offset from the beginning of the code partition
>>>> +     * Bit 25: huffman compressed
>>>> +     * Bits 26-31: reserved
>>>> +     */
>>>> +    u32 offset;
>>>> +#define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>>>> +#define GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
>>>> +
>>>> +    /*
>>>> +     * Module/Item length, in bytes. For Huffman-compressed 
>>>> modules, this
>>>> +     * refers to the uncompressed size. For software-compressed 
>>>> modules,
>>>> +     * this refers to the compressed size.
>>>> +     */
>>>> +    u32 length;
>>>> +
>>>> +    u8 reserved[4];
>>>> +} __packed;
>>>> +
>>>> +struct gsc_manifest_header {
>>>> +    u32 header_type; /* 0x4 for manifest type */
>>>> +    u32 header_length; /* in dwords */
>>>> +    u32 header_version;
>>>> +    u32 flags;
>>>> +    u32 vendor;
>>>> +    u32 date;
>>>> +    u32 size; /* In dwords, size of entire manifest (header + 
>>>> extensions) */
>>>> +    u32 header_id;
>>>> +    u32 internal_data;
>>>> +    struct gsc_version fw_version;
>>>> +    u32 security_version;
>>>> +    struct gsc_version meu_kit_version;
>>>> +    u32 meu_manifest_version;
>>>> +    u8 general_data[4];
>>>> +    u8 reserved3[56];
>>>> +    u32 modulus_size; /* in dwords */
>>>> +    u32 exponent_size; /* in dwords */
>>>> +} __packed;
>>>> +
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>>>> index 293403d16f25..ff86b7d8633e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_huc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_huc.c
>>>> @@ -5,12 +5,14 @@
>>>>
>>>> #include "xe_huc.h"
>>>>
>>>> +#include "abi/gsc_binary_headers.h"
>>>> #include "regs/xe_guc_regs.h"
>>>> #include "xe_assert.h"
>>>> #include "xe_bo.h"
>>>> #include "xe_device.h"
>>>> #include "xe_force_wake.h"
>>>> #include "xe_gt.h"
>>>> +#include "xe_gt_printk.h"
>>>> #include "xe_guc.h"
>>>> #include "xe_mmio.h"
>>>> #include "xe_uc_fw.h"
>>>> @@ -33,6 +35,135 @@ huc_to_guc(struct xe_huc *huc)
>>>>     return &container_of(huc, struct xe_uc, huc)->guc;
>>>> }
>>>>
>>>> +#define HUC_CSS_MODULE_TYPE 0x6
>>>> +static bool css_valid(const void *data, size_t size)
>>>> +{
>>>> +    const struct uc_css_header *css = data;
>>>> +
>>>> +    if (unlikely(size < sizeof(struct uc_css_header)))
>>>> +        return false;
>>>> +
>>>> +    if (css->module_type != HUC_CSS_MODULE_TYPE)
>>>> +        return false;
>>>> +
>>>> +    if (css->module_vendor != PCI_VENDOR_ID_INTEL)
>>>> +        return false;
>>>> +
>>>> +    return true;
>>>> +}
>>>> +
>>>> +static inline u32 entry_offset(const struct gsc_cpd_entry *entry)
>>>> +{
>>>> +    return entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
>>>> +}
>>>> +
>>>> +int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void 
>>>> *data, size_t size)
>>>> +{
>>>> +    struct xe_huc *huc = container_of(huc_fw, struct xe_huc, fw);
>>>> +    struct xe_gt *gt = huc_to_gt(huc);
>>>> +    const struct gsc_cpd_header_v2 *header = data;
>>>> +    const struct gsc_cpd_entry *entry;
>>>> +    size_t min_size = sizeof(*header);
>>>> +    int i;
>>>> +
>>>> +    if (!huc_fw->has_gsc_headers) {
>>>> +        xe_gt_err(gt, "Invalid FW type for GSC header parsing!\n");
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    if (size < sizeof(*header)) {
>>>> +        xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>>>> +        return -ENODATA;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * The GSC-enabled HuC binary starts with a directory header, 
>>>> followed
>>>> +     * by a series of entries. Each entry is identified by a name and
>>>> +     * points to a specific section of the binary containing the 
>>>> relevant
>>>> +     * data. The entries we're interested in are:
>>>> +     * - "HUCP.man": points to the GSC manifest header for the 
>>>> HuC, which
>>>> +     *               contains the version info.
>>>> +     * - "huc_fw": points to the legacy-style binary that can be 
>>>> used for
>>>> +     *             load via the DMA. This entry only contains a 
>>>> valid CSS
>>>> +     *             on binaries for platforms that support 2-step 
>>>> HuC load
>>>> +     *             via dma and auth via GSC (like MTL).
>>>> +     *
>>>> +     * --------------------------------------------------
>>>> +     * [  gsc_cpd_header_v2                             ]
>>>> +     * --------------------------------------------------
>>>> +     * [  gsc_cpd_entry[]                               ]
>>>> +     * [      entry1                                    ]
>>>> +     * [      ...                                       ]
>>>> +     * [      entryX                                    ]
>>>> +     * [          "HUCP.man"                            ]
>>>> +     * [           ...                                  ]
>>>> +     * [           offset >----------------------------]------o
>>>> +     * [      ...                                       ] |
>>>> +     * [      entryY                                    ] |
>>>> +     * [          "huc_fw"                              ] |
>>>> +     * [           ...                                  ] |
>>>> +     * [           offset >----------------------------]----------o
>>>> +     * -------------------------------------------------- |   |
>>>> +     * |   |
>>>> +     * -------------------------------------------------- |   |
>>>> +     * [ gsc_manifest_header ]<-----o   |
>>>> +     * [  ... ]          |
>>>> +     * [  gsc_version fw_version ]          |
>>>> +     * [  ... ]          |
>>>> +     * -------------------------------------------------- |
>>>> + * |
>>>> +     * -------------------------------------------------- |
>>>> +     * [ data[] ]<---------o
>>>> +     * [  ...                                           ]
>>>> +     * [  ...                                           ]
>>>> +     * --------------------------------------------------
>>>> +     */
>>>> +
>>>> +    if (header->header_marker != GSC_CPD_HEADER_MARKER) {
>>>> +        xe_gt_err(gt, "invalid marker for CPD header: 0x%08x!\n",
>>>> +              header->header_marker);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    /* we only have binaries with header v2 and entry v1 for now */
>>>> +    if (header->header_version != 2 || header->entry_version != 1) {
>>>> +        xe_gt_err(gt, "invalid CPD header/entry version %u:%u!\n",
>>>> +              header->header_version, header->entry_version);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
>>>> +        xe_gt_err(gt, "invalid CPD header length %u!\n", 
>>>> header->header_length);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    min_size = header->header_length + sizeof(*entry) * 
>>>> header->num_of_entries;
>>>> +    if (size < min_size) {
>>>> +        xe_gt_err(gt, "FW too small! %zu < %zu\n", size, min_size);
>>>> +        return -ENODATA;
>>>> +    }
>>>> +
>>>> +    entry = data + header->header_length;
>>>> +
>>>> +    for (i = 0; i < header->num_of_entries; i++, entry++) {
>>>> +        if (strcmp(entry->name, "HUCP.man") == 0) {
>>>> +            const struct gsc_manifest_header *manifest = data + 
>>>> entry_offset(entry);
>>>> +
>>>> +            huc_fw->major_ver_found = manifest->fw_version.major;
>>>> +            huc_fw->minor_ver_found = manifest->fw_version.minor;
>>>> +        }
>>>> +
>>>> +        if (strcmp(entry->name, "huc_fw") == 0) {
>>>> +            u32 offset = entry_offset(entry);
>>>> +
>>>> +            if (offset < size && css_valid(data + offset, size - 
>>>> offset))
>>>
>>> isn't this an error condition?
>>
>> you mean "offset < size" ? That's just there to make sure that the 
>> offset doesn't point to outside the binary, so we do want it to be 
>> less than the size.
>
> yes, that's the error condition I'm saying would be silently ignored. It
> looks odd that this function would return 0 even if we have an invalid
> HuC firmware with the offset pointing outside.

ok now I get what you meant, I misunderstood your original comment. I'll 
split the check to its own if condition

>
>>
>>>
>>>> + huc_fw->dma_start_offset = offset;
>>>> +        }
>>>> +    }
>>>
>>> if we are here but we didn't find huc_fw, shouldn't we rather bail out?
>>>
>>> I think the assumption for the caller should be that after this 
>>> function
>>> returns success, dma_start_offset must be set (to a valid value) and 
>>> the
>>> version parsed.  It seems like we later validade if dma_start_offset 
>>> and
>>> version are set, but isn't it more fragile to validate later?
>>
>> The issue here is that the "huc_fw" section doesn't exist in the DG2 
>> HuC binary (which does have GSC headers), but it does in the ones for 
>
> right now this is controlled by the filename in the last patch:
>
>     if (strstr(uc_fw->path, "gsc"))
>         uc_fw->has_gsc_headers = true;
>
> ( which I don't like, but it seems safe since we don't have such a
> firmware for DG2 right now )
>
>> MTL and newer platforms, so it's not guaranteed to actually be there. 
>> I could modify the code to assume it's always there and add an assert 
>> for DG2, so if we ever want to add support for that we'll hit it and 
>> know to come back and rework the code to handle the section not being 
>> there. Would that work?
>
> Yes, but for DG2 we have the GSC header but we don't have the entry
> pointing to the blob...  How would we find the right blob in this case?
> Any version difference in the headers?

On DG2 (and only on DG2) we don't need to find the legacy blob because 
the GSC does the loading (instead of the driver via DMA), so they didn't 
include the CSS headers in the binary at all; we just pass the whole 
thing, including all headers, to the GSC. There is no difference in the 
header formats or markers, the "huc_fw" entry is just missing and there 
is instead an entry for the GSC FW to look up and use.

>
>>
>>>
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> int xe_huc_init(struct xe_huc *huc)
>>>> {
>>>>     struct xe_device *xe = huc_to_xe(huc);
>>>> diff --git a/drivers/gpu/drm/xe/xe_huc.h b/drivers/gpu/drm/xe/xe_huc.h
>>>> index 5802c43b6ce2..e151bcbe13c6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_huc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_huc.h
>>>> @@ -10,6 +10,7 @@
>>>>
>>>> struct drm_printer;
>>>>
>>>> +int xe_huc_parse_gsc_header(struct xe_uc_fw *huc_fw, const void 
>>>> *data, size_t size);
>>>
>>> as said in the last patch, I don't think the decision to call this
>>> function should be based on the filename. IMO this function should not
>>> be exported outside xe_huc.c
>>
>> I do have to export something from the xe_huc.c to be called from the 
>> FW parsing code in xe_uc_fw.c . If you don't want this specific 
>> function exported, I can instead export a more generic 
>> xe_huc_parse_header() to cover parsing for all types of FWs, but that 
>> function would need to call the parse_css() function, which would 
>> therefore need to be exported from xe_uc_fw.c. I'm ok with doing 
>> that, just pointing out that we'd end up with cross-exports between 
>> xe_huc.c and xe_uc_fw.c.
>
> or move the gsc one to xe_uc_fw so the header part of the firmware is
> all inside xe_uc_fw.c, which I think would be more beneficial... yes,
> it's only used by HuC, not GuC, but it's still part of the header
> parsing and discovering what exactly is inside.

I'll try both ways locally to see what looks cleaner and then post that.

>
>>
>>>
>>>> int xe_huc_init(struct xe_huc *huc);
>>>> int xe_huc_upload(struct xe_huc *huc);
>>>> int xe_huc_auth(struct xe_huc *huc);
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> index 138960138872..f956457d0b11 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> @@ -13,6 +13,7 @@
>>>> #include "xe_device_types.h"
>>>> #include "xe_force_wake.h"
>>>> #include "xe_gt.h"
>>>> +#include "xe_huc.h"
>>>> #include "xe_map.h"
>>>> #include "xe_mmio.h"
>>>> #include "xe_module.h"
>>>> @@ -344,57 +345,21 @@ static int 
>>>> uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>>>>     return -ENOEXEC;
>>>> }
>>>>
>>>> -int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>> +static int __parse_css_header(struct xe_uc_fw *uc_fw, const void 
>>>> *fw_data, size_t fw_size)
>>>> {
>>>>     struct xe_device *xe = uc_fw_to_xe(uc_fw);
>>>> -    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>> -    struct xe_tile *tile = gt_to_tile(gt);
>>>> -    struct device *dev = xe->drm.dev;
>>>> -    const struct firmware *fw = NULL;
>>>>     struct uc_css_header *css;
>>>> -    struct xe_bo *obj;
>>>>     size_t size;
>>>> -    int err;
>>>> -
>>>> -    /*
>>>> -     * we use FIRMWARE_UNINITIALIZED to detect checks against 
>>>> uc_fw->status
>>>> -     * before we're looked at the HW caps to see if we have uc 
>>>> support
>>>> -     */
>>>> -    BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>>>> -    xe_assert(xe, !uc_fw->status);
>>>> -    xe_assert(xe, !uc_fw->path);
>>>> -
>>>> -    uc_fw_auto_select(xe, uc_fw);
>>>> -    xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>>>> -                   XE_UC_FIRMWARE_SELECTED :
>>>> -                   XE_UC_FIRMWARE_NOT_SUPPORTED);
>>>> -
>>>> -    if (!xe_uc_fw_is_supported(uc_fw))
>>>> -        return 0;
>>>> -
>>>> -    uc_fw_override(uc_fw);
>>>> -
>>>> -    /* an empty path means the firmware is disabled */
>>>> -    if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>>>> -        xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>>> -        drm_dbg(&xe->drm, "%s disabled", 
>>>> xe_uc_fw_type_repr(uc_fw->type));
>>>> -        return 0;
>>>> -    }
>>>> -
>>>> -    err = request_firmware(&fw, uc_fw->path, dev);
>>>> -    if (err)
>>>> -        goto fail;
>>>>
>>>>     /* Check the size of the blob before examining buffer contents */
>>>> -    if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>>>> +    if (unlikely(fw_size < sizeof(struct uc_css_header))) {
>>>>         drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < 
>>>> %zu\n",
>>>>              xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>>> -             fw->size, sizeof(struct uc_css_header));
>>>> -        err = -ENODATA;
>>>> -        goto fail;
>>>> +             fw_size, sizeof(struct uc_css_header));
>>>> +        return -ENODATA;
>>>>     }
>>>>
>>>> -    css = (struct uc_css_header *)fw->data;
>>>> +    css = (struct uc_css_header *)fw_data;
>>>>
>>>>     /* Check integrity of size values inside CSS header */
>>>>     size = (css->header_size_dw - css->key_size_dw - 
>>>> css->modulus_size_dw -
>>>> @@ -403,9 +368,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>>         drm_warn(&xe->drm,
>>>>              "%s firmware %s: unexpected header size: %zu != %zu\n",
>>>>              xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>>> -             fw->size, sizeof(struct uc_css_header));
>>>> -        err = -EPROTO;
>>>> -        goto fail;
>>>> +             fw_size, sizeof(struct uc_css_header));
>>>> +        return -EPROTO;
>>>>     }
>>>>
>>>>     /* uCode size must calculated from other sizes */
>>>> @@ -417,12 +381,11 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>>     /* At least, it should have header, uCode and RSA. Size of all 
>>>> three. */
>>>>     size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
>>>>         uc_fw->rsa_size;
>>>> -    if (unlikely(fw->size < size)) {
>>>> +    if (unlikely(fw_size < size)) {
>>>>         drm_warn(&xe->drm, "%s firmware %s: invalid size: %zu < 
>>>> %zu\n",
>>>>              xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>>> -             fw->size, size);
>>>> -        err = -ENOEXEC;
>>>> -        goto fail;
>>>> +             fw_size, size);
>>>> +        return -ENOEXEC;
>>>>     }
>>>>
>>>>     /* Get version numbers from the CSS header */
>>>> @@ -433,6 +396,86 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>>     uc_fw->patch_ver_found = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>                        css->sw_version);
>>>>
>>>> +    if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>>> +        guc_read_css_info(uc_fw, css);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int parse_css_header(struct xe_uc_fw *uc_fw, const struct 
>>>> firmware *fw)
>>>> +{
>>>> +    return __parse_css_header(uc_fw, fw->data, fw->size);
>>>> +}
>>>> +
>>>> +static int parse_gsc_header(struct xe_uc_fw *uc_fw, const struct 
>>>> firmware *fw)
>>>> +{
>>>> +    int err;
>>>> +
>>>> +    /* only supported for HuC from now */
>>>> +    if (uc_fw->type != XE_UC_FW_TYPE_HUC)
>>>> +        return -EINVAL;
>>>> +
>>>> +    err = xe_huc_parse_gsc_header(uc_fw, fw->data, fw->size);
>>>
>>> parse_gsc_header() here versus xe_huc_parse_gsc_header() seems 
>>> confusing
>>> from the abstraction pov and looks like a layering violation.
>>
>> The idea was to expand this function to apply to also the GSC binary 
>> (like we did in i915), so the more generic parse_gsc_headers would be 
>> called for all binary types that have GSC headers, while inside it 
>> would then call the function matching the specific binary.
>
> could we keep it in xe_uc_fw.c? See above
>
>>
>>>
>>>> +    if (err)
>>>> +        return err;
>>>> +
>>>> +    if (uc_fw->dma_start_offset) {
>>>> +        u32 delta = uc_fw->dma_start_offset;
>>>> +
>>>> +        err = __parse_css_header(uc_fw, fw->data + delta, fw->size 
>>>> - delta);
>>>> +        if (err)
>>>> +            return err;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>
>>> can we split this patch in 2 with the code movement first?  It becomes
>>> hard to read the delta when there's a lot of code moving at the same
>>> time.
>>
>> sure
>>
>>>
>>>> +{
>>>> +    struct xe_device *xe = uc_fw_to_xe(uc_fw);
>>>> +    struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>> +    struct xe_tile *tile = gt_to_tile(gt);
>>>> +    struct device *dev = xe->drm.dev;
>>>> +    const struct firmware *fw = NULL;
>>>> +    struct xe_bo *obj;
>>>> +    int err;
>>>> +
>>>> +    /*
>>>> +     * we use FIRMWARE_UNINITIALIZED to detect checks against 
>>>> uc_fw->status
>>>> +     * before we're looked at the HW caps to see if we have uc 
>>>> support
>>>> +     */
>>>> +    BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
>>>> +    xe_assert(xe, !uc_fw->status);
>>>> +    xe_assert(xe, !uc_fw->path);
>>>> +
>>>> +    uc_fw_auto_select(xe, uc_fw);
>>>> +    xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>>>> +                   XE_UC_FIRMWARE_SELECTED :
>>>> +                   XE_UC_FIRMWARE_NOT_SUPPORTED);
>>>> +
>>>> +    if (!xe_uc_fw_is_supported(uc_fw))
>>>> +        return 0;
>>>> +
>>>> +    uc_fw_override(uc_fw);
>>>> +
>>>> +    /* an empty path means the firmware is disabled */
>>>> +    if (!xe_device_uc_enabled(xe) || !(*uc_fw->path)) {
>>>> +        xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_DISABLED);
>>>> +        drm_dbg(&xe->drm, "%s disabled", 
>>>> xe_uc_fw_type_repr(uc_fw->type));
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    err = request_firmware(&fw, uc_fw->path, dev);
>>>> +    if (err)
>>>> +        goto fail;
>>>> +
>>>> +    if (uc_fw->has_gsc_headers)
>>>> +        err = parse_gsc_header(uc_fw, fw);
>>>> +    else
>>>> +        err = parse_css_header(uc_fw, fw);
>>>> +    if (err)
>>>> +        goto fail;
>>>> +
>>>>     drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u\n",
>>>>          xe_uc_fw_type_repr(uc_fw->type), uc_fw->path,
>>>>          uc_fw->major_ver_found, uc_fw->minor_ver_found, 
>>>> uc_fw->patch_ver_found);
>>>> @@ -441,9 +484,6 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>>>>     if (err)
>>>>         goto fail;
>>>>
>>>> -    if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>>> -        guc_read_css_info(uc_fw, css);
>>>> -
>>>>     obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
>>>>                      ttm_bo_type_kernel,
>>>>                      XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>>> @@ -496,7 +536,7 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, 
>>>> u32 offset, u32 dma_flags)
>>>>     xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>>>
>>>>     /* Set the source address for the uCode */
>>>> -    src_offset = uc_fw_ggtt_offset(uc_fw);
>>>> +    src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->dma_start_offset;
>>>>     xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
>>>>     xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw.h
>>>> index a519c77d4962..44aee1bdb133 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>>>> @@ -21,7 +21,7 @@ void xe_uc_fw_print(struct xe_uc_fw *uc_fw, 
>>>> struct drm_printer *p);
>>>>
>>>> static inline u32 xe_uc_fw_rsa_offset(struct xe_uc_fw *uc_fw)
>>>> {
>>>> -    return sizeof(struct uc_css_header) + uc_fw->ucode_size;
>>>> +    return sizeof(struct uc_css_header) + uc_fw->ucode_size + 
>>>> uc_fw->dma_start_offset;
>>>> }
>>>>
>>>> static inline void xe_uc_fw_change_status(struct xe_uc_fw *uc_fw,
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>> index 444bff83cdbe..850224890f25 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
>>>> @@ -91,6 +91,9 @@ struct xe_uc_fw {
>>>>     /** @bo: XE BO for uC firmware */
>>>>     struct xe_bo *bo;
>>>>
>>>> +    /** @has_gsc_headers: whether the FW starts with GSC headers 
>>>> instead of CSS */
>>>> +    bool has_gsc_headers;
>>>> +
>>>>     /*
>>>>      * The firmware build process will generate a version header 
>>>> file with
>>>>      * major and minor version defined. The versions are built into 
>>>> CSS
>>>> @@ -113,6 +116,8 @@ struct xe_uc_fw {
>>>>     u32 rsa_size;
>>>>     /** @ucode_size: micro kernel size */
>>>>     u32 ucode_size;
>>>> +    /** @dma_start_offset: offset within the blob at which the FW 
>>>> is located */
>>>> +    u32 dma_start_offset;
>>>
>>> maybe `u32 ucode_offset`?
>>
>> it's not the ucode offset, that's further down. This is the offset to 
>> a full FW binary in the legacy format, including the CSS header 
>> before the ucode and the RSA key after it. I could call it css_offset 
>> if that makes it clearer.
>
> yes, it does. Another thing that would help would be another ascii
> diagram like you are adding in xe_huc_parse_gsc_header(), but zoomed
> out with the new gsc header, then css, ucode etc.

I'll add it in.

Daniele

>
> Thanks
> Lucas De Marchi
>
>>
>> Daniele
>>
>>> Lucas De Marchi
>>>
>>>>     /** @private_data_size: size of private data found in uC css 
>>>> header */
>>>>     u32 private_data_size;
>>>> -- 
>>>> 2.41.0
>>>>
>>

