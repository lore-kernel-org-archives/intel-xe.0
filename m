Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440CAC77B78
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 12:04:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9B010E296;
	Thu,  4 May 2023 12:04:35 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F45310E296
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 12:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683201873; x=1714737873;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qmiyCsWVCSi0RS0cDHnjEmazyau28AHiKY2Cd7FjEPk=;
 b=Lahti7eI0iUu0Hm6ZEt2QgSVRFBpWATTSVmiUrsuFCy7BkvWsvxYMEHJ
 wam4ciAgRSjTHzQNUMC7uo85j9FWRECwwsx+G3lUwpnsUiX/ttlF9ystW
 seWyU1TEtX3Q3ooMqZwyazmFajLcRMr9M+cTZARByPUqrFTr+UkuyMbj1
 tG0ip9y0DIQUWpxZt81GoxPAZepuLb3jmE2JC6QJEGkYJO/cHFg9zSLHn
 NlbFzN03U7qndgTh24eyGYqEKrf8/ocq7Z5S06P6iOim2rlNKqkxfd80A
 UC8mk/cCUr/Ir0LUe2hCvSZUcWKSK8O5lfTfVqW25JJel0QJlzVWzumdY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="351908302"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="351908302"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:04:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="871324827"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="871324827"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 04 May 2023 05:04:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:04:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:04:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 05:04:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 05:04:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPg+aQEjfuJK2uiN8RUa76r0ak9fwYkfrUGqzdGuYJKpaRpWkJJOyrFP3SgVH1WF+SVKxEnOypDalB4KEH9pjdndl80p373Y//qLWKc8M5UrD7dz67MNtgdhQi9DEKu6pDyN8Jo1n3p6DfEJfPJ9qAvRNNUdsuKbPn+o928ZPmNkC7OeEZLGG0gxoPzk52pnaQcyyEzyirgDDGc6d/Phj4EAu84FkyhIw8sOFltmD7ry0BHc/PapqqAvmHhGTzeJxG94ZQbivHIbXyOck0q7U/fpu8eAwAKPsBaySJp2A+qaJmHHOgdlYqjSPuTrJ4pBBFT+1MdpwXncfqw5Vq/IMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0dVZqz3NZ5Nm3hs8oXvmCN6aUfV/fEsyJfICdiNwjE=;
 b=IRB15S2G6liAQm9VG3CV3yvhE740OsCPCody1gY+VJn7rGLauAeIEoEYMpxzTvqW4zSAPs/sXd51iEjvNye1PfBp2RtNdEEZ5WTiuGpzV0hwPKuZHF3+JRm5WeXrQmZNHWB5XkDlf3MxZkDMVOZ+vAWlG6HaXbY/UndIinDBgWTgdEv1AcWmwsBmBFH+TcL0n38AP/jfm2Qjq9/JOD6lJuNTAED3cc4GKc5UCByZRm7K3gp9Xp/C9iFsjuFKtx//ApNv4q8cDP8KOYq+D29pPjp0v7TMlGwqPBpbGmbZLZmOqh95u7FochpW9jZdj4EI+SqgYg+8G/NvEugvFWwLUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 12:04:19 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::9c58:34e2:84e5:751b%4]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:04:19 +0000
Message-ID: <b2e385b8-d476-a544-602e-4dbd953fbcb0@intel.com>
Date: Thu, 4 May 2023 17:34:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <20230504112020.300498-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: f2ef7422-63c4-4558-93d0-08db4c97b089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VswA1PAjEh6Bh6l5n4LDSoAlsSk/zzi/2f/JKNCZ+/Ey997q1qGHIWzWaP5WDsgVvhaOGDnRhVQxKK9cn7C4/nuC3QmZuitjzSOcCeNprxxdV00YV6KdUWwabvtikEULblvtNQfQdonx4kRuaPkFqkODBDFHqSx0zjwFz2pQLsx5nCqvOETh4eW9aoibjnzHK/6jbOHJXncaSA87Vge1VaG0mhQiVdAHRbnAPm3sde+TOfynZAJ7Qiu1RX0VGOvgSORt8OCvq5vUtViz88J9YQ8rKGpaIAzcPDl60PXDaXqVyyEuexuiot1GJOPhIpGA1cA++SxTolNeZ13trSqaD32C0e2/SZXOlCJ+CMBKnwDz6A8pdtBGjfQdsR7vGPAgvfyKhVuopLCHOGnZlUUkbC1UI07OS+HmMtnvQ6H8bPDhqEQF6TzRK/23MtuLNCYZgoqJHZoUZ5fkEcR1HHta5exlxiR0qDmjlRpz1eVaySjM34agzdhRMg6ocbc8cu5/Osj93SkQAxObK8AFHSwxSBj7vHis/zenTq9ZhzH0fRE2/6YBErx6hrKehBZlPaQdkNHaxkfiNVry2lBkgkpPwMjkFtHMvv5uvymoFmyQxJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(83380400001)(966005)(6486002)(478600001)(2616005)(6666004)(6512007)(6506007)(26005)(186003)(53546011)(2906002)(36756003)(5660300002)(38100700002)(66476007)(66946007)(82960400001)(66556008)(41300700001)(8936002)(31696002)(316002)(86362001)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFRVcXlTbXNGT1p0ZDRmY1VSckYvTFZrUFVGRTlqZ2pGbGdVaEgrUjcvQWxV?=
 =?utf-8?B?NU5SWnNLbmRGT20xOFN0MVdVZ3hwVWlGUXFZNDZnYi9xU09YK2g2Sm1ITEhC?=
 =?utf-8?B?a3BGamNPWGh3S2dNaXhscysrRDE0dU1rd0dmUWhCYWpDdGR5TURlQVM5QXBR?=
 =?utf-8?B?aGxzUDNCYjhRb3RTS2dQOTUyVStONGtlOVNLRmhPbjJGN0o5c05HT1l6cUVo?=
 =?utf-8?B?aGlTNHRsV2MzWktUMi9XWktvWWJRN0RQWExBY3FsaWk2OUtCc2hyQlBvK2NQ?=
 =?utf-8?B?QkMyL2pETFV0dS9uTXoyMHFZdFFjb3dRd1VZaHpmN2NQUFZpQ3NaOUY3RE1S?=
 =?utf-8?B?cXBuT25uUG9aNnB3R0EvcFhHRituVXRKaXFoRFFNVWpNeDlqSE1PRWJlT1hy?=
 =?utf-8?B?d0ZTN3IzMVBZSFBmWExmWE1ZM1VuRHFSMldOcXZZck9jOTBPZEMyQnNMWlA2?=
 =?utf-8?B?SW00UDhoeWFpMitudUk3NzJHbjNLaHNZZGl0OE44Y2Nxc0lRV05abHo3RmpW?=
 =?utf-8?B?d3BHejNHcEdJWGtSd0ZnRURBdFZyQ0pOUjBlTHpaZGZxQVRqLzNFT2FRSng2?=
 =?utf-8?B?QlpUckwwM2F2RlowbTNvMFR3WDg2bDVJeWR4Uk5sU2U3SVhOR0QyNytMNHFV?=
 =?utf-8?B?SDQ3YmhLUUVwdzg4QVdFVUdkKzRGejR0S3BKMlRBMjhUT0RGSy92UnZMK2g2?=
 =?utf-8?B?ZTdLWU9oSmpoUEhSU29pem9Gb1RjMXZBTDJLbXYwQmhYZTRXNmdWbHRPK2tU?=
 =?utf-8?B?UUZLOStwTGlBOUZnZENwNzJqcXpGN0pTNVl5L09DMVVZcEZHTEk1dUIxY3FG?=
 =?utf-8?B?aUxoMW1Jcm0vNFBHeUJKcC9QMFZteVpJaUZBZFlJRFhTYnp0eDV4YmhqSCti?=
 =?utf-8?B?d0lVViswbnEyWHMxSjVZaDNvV1JxVHdOdmxvb01GeENPWDUvbTduWWFMdldx?=
 =?utf-8?B?Rk42aFgxRmZGbFdyMjZwWUQ2Vlk4TkNkRE5pVXM2LzF4eXpwS29nSHgyNFJj?=
 =?utf-8?B?QWxhNHdPWVpLd0o0N3NYbWFaL0kwRHpsaUhHakdnTGNhSDFlMDFvbW9TODFX?=
 =?utf-8?B?UlBYNUxnRGh6cm1GVkN3bkVML3hlKzhtRUNXckZscU4zYzRZOGpkL2xoWk5r?=
 =?utf-8?B?NmE4SHZkeFFFNHdUSk53YUlPTTdMQ3phUWpLVHlRRlBwZ3ZxdjVkcjY2Q0NE?=
 =?utf-8?B?OW5hQ2ZFVkMxT0RJWWdUN3VWVkxDNnpJQ2FWOUhCVEFla2JXamp0TE5XWWRF?=
 =?utf-8?B?Sk1pWnl3aE9ZaHdORURlVy9SOGx3Yi9lc3ZjNHk3dllhdDB5VS92WjJjSzdV?=
 =?utf-8?B?QWdBK0VLNjZIRTNJNWo0T0twcnZONmRZejJva3ZFNEhMK2Q4TDJsZXZxVXMz?=
 =?utf-8?B?aVhtQ00xMGd0a3E2RHhKcElVQk85ZzhXLzE1V3dHMDVqRjc0eXk5cURUOVUz?=
 =?utf-8?B?ekJDcGFnbUpmOUIvUktnckpKUzVaK0RmcjVrN1FESXNFRFlXOStZL1N2UUtF?=
 =?utf-8?B?aWtTU2JPMm5Wd2NmcXdMbXRoMitrbzFuVEpTbmk2MGY4UzlZeHFGNlBPQ2ZR?=
 =?utf-8?B?a2hwallhN2ltSSs3R3JOVmpoN25WcEhTanErS3M5eXFrL044ZFVZZHluR29l?=
 =?utf-8?B?clVIL1E1eWVXc2VhQkkwZzRDQmxFVkZPRjZkOXRuazRZSys0Y0RValN6TFA0?=
 =?utf-8?B?ZWsreXkxUjBsNGhoSnk5Uk41dkJCWkh6cTdTa3FYTEpuem1DdU9wT3N3MTUy?=
 =?utf-8?B?cXRyV2c5Rjc4YlYrVXVkS2xHakVCdkIxb2JiMVFaandXQ1NTRnRhSktjZy85?=
 =?utf-8?B?WU8xN3RzekxYNTRGd0p4Q2N2WHhuMk9FM3RlOWtsZnFuRmFMcXh4SkFva0Fa?=
 =?utf-8?B?YStIZ3FCeU56MUJHYUdiR1hjMkhta0NKTjQraFZBT0pJbzFkS1BjV0JkVnh4?=
 =?utf-8?B?cFIxeVJrT1l1WjBSRkQ0V01YQ205aTNTQlBOcUJENmhNRUhzR29qZWhReklB?=
 =?utf-8?B?T1BENFluTEpGVE4wR0pFMnN0TGZTV3MwSnhQWHNUNjEyWUdiR1N3eTR4b3dX?=
 =?utf-8?B?eGQvb2NDc2VIN1MvRTh4eDFieHRMVHNCNUd6Q2p0QXphTlJGMmlZRWxhRlJL?=
 =?utf-8?B?OFMyVUhGUE53M3YrbVF1UHJBV2JDZElpMlBrTW1abGdXNitmYWFQTEp0VG1s?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ef7422-63c4-4558-93d0-08db4c97b089
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 12:04:19.1945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxUFgEvFRqsitRecxGBrmzgaqghIM4GXhJqYDt+gLA54Rm42ssIuhBQIHG5W5yDinQnGdorMchc6ng6LocVpxbnLSI+eaL81F8OD81cZawo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
 memory size
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



On 04-05-2023 16:50, Tejas Upadhyay wrote:
> Add sysfs entry to read per gt physical memory
> in total including stolen memory.
> 
> The sysfs entry added can be read using:
> cat /sys/class/drm/card1/gt/gt0/addr_range
> cat /sys/class/drm/card1/gt/gt1/addr_range
is this the right sysfs path? i do not think gt is enumerated under card
folder and also there is no top level gt folder as in i915.

Thanks,
Aravind.
> 
> As it involves drm_class, it required movement in
> xe_device init flow, patch for same is part of this
> series.
> 
> Actual physical memory per GT was dependent on infra patch
> from Ruhl, Michael J, so I have added it as part of this
> series to pass through pre-merge.
> Patchwork: https://patchwork.freedesktop.org/series/117126/#rev3
> 
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> Tejas Upadhyay (3):
>   drm/xe: Rework multi tile device memory initialization
>   drm/xe: Register drm device prior to gt init
>   drm/xe: Add sysfs entry to report per gt memory size
> 
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
>  drivers/gpu/drm/xe/xe_bo.c             |   8 +-
>  drivers/gpu/drm/xe/xe_bo.h             |   2 +-
>  drivers/gpu/drm/xe/xe_device.c         |   8 +-
>  drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
>  drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
>  drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
>  drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
>  drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
>  12 files changed, 291 insertions(+), 164 deletions(-)
> 
