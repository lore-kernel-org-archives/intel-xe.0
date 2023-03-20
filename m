Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C33CC6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 14:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF79897E0;
	Mon, 20 Mar 2023 14:27:01 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924A4897E0
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679322419; x=1710858419;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ehTo3MvBtv3pseHchkcgn3lFq+30w5mYNMXveKZGR/I=;
 b=CZ67lj5XPiJVEUtAgB/12WwsPVPNx4RslpmKxGPEMFLV81tsDTKaP8mI
 FHz+vAc1DWvODlS0s/hh9hKnCE+PmH9IHEphLgcGVNaZGGb3YzQJ3n7tE
 k3Q7cBx88u+V/nInWTMEO/pYGIAGhWGs5hbhhn5RT0e6g9Fbf6C0QG3P1
 DorxHbtGiyhV7NFkR0bAMkfRx3qppNdgG6IhZsYgoWMq1hE40aSjggFmk
 CdOWm3UyT0n51YJ5RHu2sRGFViC7oBFN+cUlzLRJm/k0SiptRJFOtpuBK
 8RjWHghi2rYmEMlI88fw3mbx8Jv3/TSShfH4cUEAyCqKv0HrSN4Z7U07P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340219331"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="340219331"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770214050"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="770214050"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2023 07:26:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 07:26:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 07:26:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 07:26:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 07:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVmhwFrkz7B3q/ua1C2AqMsYGKxhB3Q6V9h3gXcaCV1dbF57RsVGYfUdRzYThLQzejDIqOs/jDcNfjpnOm9CaYJFGS1t8vUxdVFLGx6C4Y3ViBWa1kS16ljyGl9rU7RdmxWPtwfRpCdurC455DL7q6ZNptMhAuFk5PzyjZiBjvx7rnApf7/PDnigtYbdRvKow1Z6IqHSpPvybiqzrh7hPvVXasufTTNZoa7O8M63L/TWehMLa/3w77PaN/nHUGlNPQmsLu4cvONGmX9bnnlbjdTHUXqvguN7/pf3jawb56fkrjCpOQP5zxBSD+ZmKJwPtvFKvdxWOWJzcCi3jfyksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=du1VUrf4gNDYlqCz9wiKFu+LtosEb+Upt9WpFwYbNz0=;
 b=c2GfaYsg0RH9Kygdji2U3fDa6kwrovsblizoS1f+A6CY8U0shYn00dcPRR8kDadmBoVTREKjZY50CqKPf/PtKsE3T5nfpekse2IncOEQqdly0kTE1Zq2SJEZl6Ywkh8bab5/0w1svB+J5L8JmesIW5jzhxCujJNKu5wyurbMIRnQYqt7K6G5hcmlMU0zcWaeAp1WOrCbP0DXLWrJzyE8N5jDQ+Aykof4lmaGxRDvuUUKpIioG4oCIojaOr6gDHjU5coGGZVEOW2JI6wcSgO7P8TCJdTFqIhj0+K+o7mHByRXY4VW5+BlWZzk+3US3ppBlP5zgp65uCc45PEFn9Bj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:26:47 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 14:26:42 +0000
Message-ID: <5f0f4a60-6f5c-c62a-7864-67de50f807fa@intel.com>
Date: Mon, 20 Mar 2023 16:26:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230308101745.217120-1-matthew.auld@intel.com>
 <20230308101745.217120-6-matthew.auld@intel.com>
 <15701e64-9d2a-bd62-7628-c37b31152654@intel.com>
 <3b98447d-40f6-604a-ae61-b90e5c31b3e8@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <3b98447d-40f6-604a-ae61-b90e5c31b3e8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|SJ0PR11MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ed04e0-43bc-4251-24f4-08db294f2041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /k1dDTewPDexhm/Sctv+RmyH1uXRJoMq6Uk7+iGXl7h/UosPEiotINtDBhP3Y5tqeuJaEeJ1sbxQ2TaqmGRHJZ8PZDqlW8UtD/fM1WhxLUp6zSVjAoWUeFuu4/rT6E9Yzv6V0qDTVzeKhEZ1xynrI9NVrtZHrYiLwL058v6cLaH1YNpGWIlN02R9m3YVRV+yNBj6betxm7PTRv+BdJAaYKRxHsjcoirtAyo1l4vofn5P5y+C1CpXd2CbvKe/E/m5nQuv2/wRDDlPXFLR3gxg2Ggo8ezLvz0bg1OFuBipFV3EK7CfG5cEkwB/KzwVk7PtjxX/UuXuwyZmNOZlWJte2RBjkoXxKmk14PNjAScbqNCTRwhkV9ZiJOj3kqQ3X+N1PglfcHaf7fjXqJ/vSdEBmDscMjA2qMUGOkeaBKRxMwCk7HKJQAdPAUmesZ3Kq7BZW+kxCPJTs+iY/pCMS9TDba30nrY39rBrNKKUPnkFxoYHPwT4moh1F7tbvuz1PrF5w1oZZ8CeISIRrmSJtlLiYK6epB1I+iTvMCU0Vxxm1cNOjxcMPlMTsCybPZXuzwALSineq287qJOdT9bBOqQzEZldaLUUe12pW8MoK+dcOjdYRDerq5JediR6orNEGQSayGyBuLOwRAxFzfwolz2bhamNzVxSRnCsWl+j+KahPLjckiR2GnOBZHkFHYRKyG+FY8kpX1CutHsdhKd6k6Qc4hvz7aM3j1fW6DnDSOKGUv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199018)(31686004)(2616005)(83380400001)(316002)(6486002)(6512007)(478600001)(5660300002)(6506007)(107886003)(26005)(186003)(53546011)(6666004)(31696002)(41300700001)(38100700002)(86362001)(2906002)(8936002)(30864003)(4326008)(66946007)(82960400001)(8676002)(66476007)(66556008)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnFtMDVxS1JRVC9mOWhXVTdDaTkyZzE1U29FTzlXaXRlUm16ZStyNVZFbUZH?=
 =?utf-8?B?aVlOdW0zWVZDdzFnNFkySkpVdlBKdmVTVnp6RVFISGRQSi9tMXFiL0trOXZu?=
 =?utf-8?B?VlFBT1BQclJiRVN1dVFwV1B1dkJRVVFNd3AyeEhXVW5DYlB5WTJUYVQvWEpp?=
 =?utf-8?B?SUZ2TjROSWdSYmtvYjNUTWlsT0p4ZGpBNkRPRXRpczZzUDVmaDltOEN0SWs1?=
 =?utf-8?B?eHVBSXdGY1JkdFhHc1hoSFBkR1ZZUVhNMGdXcUNmK0NiM0p0cUxaamdpWUIx?=
 =?utf-8?B?UUUrMStnUUQ4SVNNazlQN3ErME4yVFBId2tZV3ZaNlk3S0lGY09NL013aHAx?=
 =?utf-8?B?ZmhFSlU4RTdzdnR4K0k3bC9qVmNiSWRERnRLY3l2bUVNY2p0K2MxdEIvTDkw?=
 =?utf-8?B?VTVBZUFaNlplV1hmd3FKOGdzTHlyTXpYWlliQzFwZHd0ZExoN1piT1pzVW1a?=
 =?utf-8?B?V3RZWUFyRmJiVnFMN0dRQlpGOUcrNnoyMTBmZ1NBdWVMOEdWVzBJbjR6VEZa?=
 =?utf-8?B?TnpVOWE3L28vam0zbHpSUUhKajA4T2RVYlMyeW9QMkxRbTlUaGNRdmhVMGN5?=
 =?utf-8?B?c1czdWRhTU5sT0VwRVFlSXU1bXhBUkw3TWt3aUZWNmZqR3VpVXEvT3lJeEVH?=
 =?utf-8?B?NTBta01HbnZhME1lcDlGZUxzNnEwckJXMVFGMy92UGpnTDN5bmQyZWJNNWZz?=
 =?utf-8?B?cHZyd09wK0N6cGk0UlNIcFhMNHFGZkNsVHI3V3RYNEk5ck9COGVFbzNVUlkw?=
 =?utf-8?B?bWJtRmhKQ0NzdEJ1N3IyU3FCbnFmVEdVSC8velhUN2VGTzdWek5XNWw5K2Jo?=
 =?utf-8?B?KzhpZWpKWVN5Z2J5cUhGblhqcEZRNGE2WjZsbC9HMGpiZFdoaGtCMU5CRUZE?=
 =?utf-8?B?U3pYTEVFa1F0WVFBd3hJSUh6SWxTRGtINHZ0aWU5NU9DSy9TdzBPUW91aHd2?=
 =?utf-8?B?SUJEVTVoM1ZxL0x6WHJFTWo0TlVublhlZnJWR2xyNE54ai9TakRNOWZOdW5X?=
 =?utf-8?B?UW1jRWpvK092LzZOYmhyWklPWUZ3K2FwS1UvWGRtVUttNnRwQWtZa2JPanNK?=
 =?utf-8?B?WTFVenptUktVV1BOZkdVTVJZaGZYODhtUjJ3Q2RPZS82Zk16UjllYUdlb1h4?=
 =?utf-8?B?VllYQ3NzYlM3RGRMdHYxeER0c2JWcHppU2xuZzJwM1lPWGtIVGZBUTlZTmxN?=
 =?utf-8?B?YlBZMi9QM3U0d2o0WFozUzc4Z2lxdys5V3pVanNEZDNGMW5VUDMvUFZxOVJm?=
 =?utf-8?B?bWp0QzEyR2VBUk1VUCttUWU3M0pJRHRkNDh0Ny90REQwUGo4LyttT3UwNzlx?=
 =?utf-8?B?T2EyZkJNQzRUNnhPVytWMC9ubTZEKytkQVZXVHpTMXdmTDE0RTdIZGIzOWIv?=
 =?utf-8?B?N003SDA5YUwrNjE4MTVLM0NkNVJOMEh1eFJkTSt0OTRldytaOUovZ3liNDNm?=
 =?utf-8?B?WGx3dFhROWpWNkFVd0NmblIzZkhyQnFuYjd0dW9FSHltQ1RUMWVBM3NZMW51?=
 =?utf-8?B?bndudTZOMnFkVnY1WVRhY3doRUlWZUxlSGl2cnBTL0hnVmxnVlNtdXE2RDZk?=
 =?utf-8?B?L28walp3N0RlYkpxYWV0N2xMTEEwNWp2L0tlZnhTNVM3bFgyUkpCMWdJMFdW?=
 =?utf-8?B?WFppRDdpOExCUklRRmNxVDZMN3RaUUdQeFgxYXVIcmpseHJJVGpSa2JaYkt2?=
 =?utf-8?B?WDdlWGhmamdSa3V0UUZhdGRzZmRiMFRYRlJiNkdzY1plM3UwVHFBNitxOWp5?=
 =?utf-8?B?QmJETmZ4dmRCd0RCVDRrVXl3ZVROZ3hpZDJPRCt3bWxCQmowM1pQYllNMGVC?=
 =?utf-8?B?WEI1eXl3RElSTm9Vd3JmM3NRa25OYjg2dHZYNUhtNStyMWlrUG9XYm81NkY0?=
 =?utf-8?B?UkxTSUN3ODczeGJENEZScTlRcU5CUy9JQlRRUmM5NytnR1JPZEs0dGpISHpI?=
 =?utf-8?B?QmdxWEd0ZmtsaGl5WkhscCtYckFhdXY2bEFyU3hRWElBUUJ5RHVicmFwbGVx?=
 =?utf-8?B?MGZQNXhrZ1FSZm9yVlBUV01JcTUwV1Z2R0E0L3oyeDNyOFEzVXRNVGVNbXpX?=
 =?utf-8?B?a05EcXlEYkxhUGpkelZObVdKRWdnNStYcXBFeG1xVTQxZVc1Q21WMzVET2Vq?=
 =?utf-8?B?UWVQTnhpSmZyT3pWKzhTNXFxKzBGSkh1YWFVT0U3WGVsT28zN0lCQ2dUVEtY?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ed04e0-43bc-4251-24f4-08db294f2041
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:26:42.7258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqZuo9u87uGVAHyXiWLq4fZqV4sJvMmssq4UhCRCVQ/PTXb0vrcRER7pwgAQ97aK+MS+aTbFEFpvE25WujqyrYDx0jxm2sfAz6TsVHlLSlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 5/6] drm/xe/buddy: add visible tracking
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 3/20/23 3:03 PM, Matthew Auld wrote:
> On 20/03/2023 12:08, Gwan-gyeong Mun wrote:
>>
>>
>> On 3/8/23 12:17 PM, Matthew Auld wrote:
>>> Replace the allocation code with the i915 version. This simplifies the
>>> code a little, and importantly we get the accounting at the mgr level,
>>> which is useful for debug (and maybe userspace), plus per resource
>>> tracking so we can easily check if a resource is using one or pages in
>>> the mappable part of vram (useful for eviction), or if the resource is
>>> completely within the mappable portion (useful for checking if the
>>> resource can be safely CPU mapped).
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     |  18 +-
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 201 ++++++++++-----------
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   3 +-
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |   6 +
>>>   4 files changed, 118 insertions(+), 110 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> index e608b49072ba..35e6bc62766e 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> @@ -158,7 +158,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>   {
>>>       struct xe_ttm_stolen_mgr *mgr = drmm_kzalloc(&xe->drm, 
>>> sizeof(*mgr), GFP_KERNEL);
>>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>> -    u64 stolen_size, pgsize;
>>> +    u64 stolen_size, io_size, pgsize;
>>>       int err;
>>>       if (IS_DGFX(xe))
>>> @@ -177,7 +177,17 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>       if (pgsize < PAGE_SIZE)
>>>           pgsize = PAGE_SIZE;
>>> -    err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, 
>>> stolen_size, pgsize);
>>> +    /*
>>> +     * We don't try to attempt partial visible support for stolen vram,
>>> +     * since stolen is always at the end of vram, and the BAR size 
>>> is pretty
>>> +     * much always 256M, with small-bar.
>>> +     */
>>> +    io_size = 0;
>>> +    if (!xe_ttm_stolen_cpu_inaccessible(xe))
>>> +        io_size = stolen_size;
>>> +
>>> +    err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, 
>>> stolen_size,
>>> +                     io_size, pgsize);
>>>       if (err) {
>>>           drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>>>           return;
>>> @@ -186,8 +196,8 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>       drm_dbg_kms(&xe->drm, "Initialized stolen memory support with 
>>> %llu bytes\n",
>>>               stolen_size);
>>> -    if (!xe_ttm_stolen_cpu_inaccessible(xe))
>>> -        mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, 
>>> stolen_size);
>>> +    if (io_size)
>>> +        mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, 
>>> io_size);
>>>   }
>>>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index e3ac8c6d3978..f703e962f499 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -49,45 +49,26 @@ static int xe_ttm_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>                      const struct ttm_place *place,
>>>                      struct ttm_resource **res)
>>>   {
>>> -    u64 max_bytes, cur_size, min_block_size;
>>>       struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>>>       struct xe_ttm_vram_mgr_resource *vres;
>>> -    u64 size, remaining_size, lpfn, fpfn;
>>>       struct drm_buddy *mm = &mgr->mm;
>>> -    unsigned long pages_per_block;
>>> -    int r;
>>> -
>>> -    lpfn = (u64)place->lpfn << PAGE_SHIFT;
>>> -    if (!lpfn || lpfn > man->size)
>>> -        lpfn = man->size;
>>> -
>>> -    fpfn = (u64)place->fpfn << PAGE_SHIFT;
>>> +    u64 size, remaining_size, min_page_size;
>>> +    unsigned long lpfn;
>>> +    int err;
>>> -    max_bytes = mgr->manager.size;
>>> -    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>> -        pages_per_block = ~0ul;
>>> -    } else {
>>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> -        pages_per_block = HPAGE_PMD_NR;
>>> -#else
>>> -        /* default to 2MB */
>>> -        pages_per_block = 2UL << (20UL - PAGE_SHIFT);
>>> -#endif
>>> -
>>> -        pages_per_block = max_t(uint32_t, pages_per_block,
>>> -                    tbo->page_alignment);
>>> -    }
>>> +    lpfn = place->lpfn;
>>> +    if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
>>> +        lpfn = man->size >> PAGE_SHIFT;
>>>       vres = kzalloc(sizeof(*vres), GFP_KERNEL);
>>>       if (!vres)
>>>           return -ENOMEM;
>>>       ttm_resource_init(tbo, place, &vres->base);
>>> -    remaining_size = vres->base.size;
>>>       /* bail out quickly if there's likely not enough VRAM for this 
>>> BO */
>>> -    if (ttm_resource_manager_usage(man) > max_bytes) {
>>> -        r = -ENOSPC;
>>> +    if (ttm_resource_manager_usage(man) > man->size) {
>>> +        err = -ENOSPC;
>>>           goto error_fini;
>>>       }
>>> @@ -96,95 +77,91 @@ static int xe_ttm_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>       if (place->flags & TTM_PL_FLAG_TOPDOWN)
>>>           vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>>> -    if (fpfn || lpfn != man->size)
>>> -        /* Allocate blocks in desired range */
>>> +    if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>>>           vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>> -    mutex_lock(&mgr->lock);
>>> -    while (remaining_size) {
>>> -        if (tbo->page_alignment)
>>> -            min_block_size = tbo->page_alignment << PAGE_SHIFT;
>>> -        else
>>> -            min_block_size = mgr->default_page_size;
>>> -
>>> -        XE_BUG_ON(min_block_size < mm->chunk_size);
>>> -
>>> -        /* Limit maximum size to 2GiB due to SG table limitations */
>>> -        size = min(remaining_size, 2ULL << 30);
>>> -
>>> -        if (size >= pages_per_block << PAGE_SHIFT)
>>> -            min_block_size = pages_per_block << PAGE_SHIFT;
>>> -
>>> -        cur_size = size;
>>> -
>>> -        if (fpfn + size != place->lpfn << PAGE_SHIFT) {
>>> -            /*
>>> -             * Except for actual range allocation, modify the size and
>>> -             * min_block_size conforming to continuous flag enablement
>>> -             */
>>> -            if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>> -                size = roundup_pow_of_two(size);
>>> -                min_block_size = size;
>>> -            /*
>>> -             * Modify the size value if size is not
>>> -             * aligned with min_block_size
>>> -             */
>>> -            } else if (!IS_ALIGNED(size, min_block_size)) {
>>> -                size = round_up(size, min_block_size);
>>> -            }
>>> -        }
>>> +    XE_BUG_ON(!vres->base.size);
>>> +    size = vres->base.size;
>>> -        r = drm_buddy_alloc_blocks(mm, fpfn,
>>> -                       lpfn,
>>> -                       size,
>>> -                       min_block_size,
>>> -                       &vres->blocks,
>>> -                       vres->flags);
>>> -        if (unlikely(r))
>>> -            goto error_free_blocks;
>>> +    min_page_size = mgr->default_page_size;
>>> +    if (tbo->page_alignment)
>>> +        min_page_size = tbo->page_alignment << PAGE_SHIFT;
>>> -        if (size > remaining_size)
>>> -            remaining_size = 0;
>>> -        else
>>> -            remaining_size -= size;
>>> +    XE_BUG_ON(min_page_size < mm->chunk_size);
>>> +    XE_BUG_ON(min_page_size > SZ_2G); /* FIXME: sg limit */
>>> +    XE_BUG_ON(size > SZ_2G &&
>>> +          (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS));
>> Hi Matt,
>> What scenario is the purpose of testing? Is the purpose of reporting 
>> an error when it is a small bar case at the current stage?
> 
> XE_BUG_ON(min_page_size < mm->chunk_size) - This one is just a general 
> sanity check, which seemed good to add. The chunk_size is the minimum 
> sized chunk of memory that we can allocate, and so if we ask for 
> something smaller then likely that's a bug.
> 
> XE_BUG_ON(min_page_size > SZ_2G) - This is also not small-bar related, 
> but an existing limitation. If you look below the allocation is split 
> into a maximum allocation size of 2G (so that is can always fit in an sg 
> entry without overflowing). If someone in the future asks for page_size 
>  > 2G, then the alignment might not match, due to this splitting, hence 
> better treat that as an error. This one has a FIXME, since the code that 
> constructs the sg table could be improved to handle the limitation 
> there, instead of leaking it into the buddy code.
> 
> XE_BUG_ON(size > SZ_2G && (vres->base.placement & 
> TTM_PL_FLAG_CONTIGUOUS)) - And this is basically the same as above. We 
> can't have larger than 2G for one chunk AFAICT, so if someone asks for 
> CONTIG for such a case, the underlying allocation might not be 
> contiguous, since we need to make at least two separate allocation 
> requests. But again, I don't think anyone currently needs such a thing, 
> but best to just document/assert such limitations.
> 
>>> +    XE_BUG_ON(!IS_ALIGNED(size, min_page_size));
>> If it is not aligned, can't we increase it to the aligned size and 
>> allocate it?
> 
> Yeah, that's one possibility. It's just that the existing behaviour is 
> to leave that to the responsibility of the caller. AFAICT this is for 
> now mostly interesting on platforms where we need 64K min page size for 
> VRAM, and there the object size is meant to be rounded up, so we don't 
> currently expect anyone to trigger this, unless there is a bug.
> 
>>> +
>>> +    if (place->fpfn + (vres->base.size >> PAGE_SHIFT) != place->lpfn &&
>>> +        place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>> +        unsigned long pages;
>>> +
>>> +        size = roundup_pow_of_two(size);
>>> +        min_page_size = size;
>>> +
>>> +        pages = size >> ilog2(mm->chunk_size);
>> Why did you use ilog2(mm->chunk_size) instead of PAGE_SHIFT here?
> 
> Yeah, it looks like the existing i915 code seems to mix chunk_size and 
> PAGE_SHIFT. I think back in the day the buddy allocator just accepted 
> the order, but now is happy with the number of bytes, so doesn't make 
> much sense. Will fix. Thanks for pointing this out.
> 
>>> +        if (pages > lpfn)
>>> +            lpfn = pages;
>>>       }
>>> -    mutex_unlock(&mgr->lock);
>>> -    if (cur_size != size) {
>>> -        struct drm_buddy_block *block;
>>> -        struct list_head *trim_list;
>>> -        u64 original_size;
>>> -        LIST_HEAD(temp);
>>> +    if (size > lpfn << PAGE_SHIFT) {
>> In case of DRM_BUDDY_RANGE_ALLOCATION, shouldn't it be compared with 
>> size > (lpfn - fpfn) << PAGE_SHIFT?
> 
> Yeah, that makes more sense. Also this should be higher up. Thanks for 
> reviewing.
Thanks for comments.
And I should have replied to the v4 patch, but I replied to v2. Please 
review the emailed reply as a reply to v4.
Br,
G.G.
> 
>>
>> Br,
>>
>> G.G.
>>> +        err = -E2BIG; /* don't trigger eviction */
>>> +        goto error_fini;
>>> +    }
>>> -        trim_list = &vres->blocks;
>>> -        original_size = vres->base.size;
>>> +    mutex_lock(&mgr->lock);
>>> +    if (lpfn <= mgr->visible_size && size > mgr->visible_avail) {
>>> +        mutex_unlock(&mgr->lock);
>>> +        err = -ENOSPC;
>>> +        goto error_fini;
>>> +    }
>>> +    remaining_size = size;
>>> +    do {
>>>           /*
>>> -         * If size value is rounded up to min_block_size, trim the last
>>> -         * block to the required size
>>> +         * Limit maximum size to 2GiB due to SG table limitations.
>>> +         * FIXME: Should maybe be handled as part of sg construction.
>>>            */
>>> -        if (!list_is_singular(&vres->blocks)) {
>>> -            block = list_last_entry(&vres->blocks, typeof(*block), 
>>> link);
>>> -            list_move_tail(&block->link, &temp);
>>> -            trim_list = &temp;
>>> -            /*
>>> -             * Compute the original_size value by subtracting the
>>> -             * last block size with (aligned size - original size)
>>> -             */
>>> -            original_size = drm_buddy_block_size(mm, block) -
>>> -                (size - cur_size);
>>> -        }
>>> +        u64 alloc_size = min_t(u64, remaining_size, SZ_2G);
>>> +
>>> +        err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << 
>>> PAGE_SHIFT,
>>> +                         (u64)lpfn << PAGE_SHIFT,
>>> +                         alloc_size,
>>> +                         min_page_size,
>>> +                         &vres->blocks,
>>> +                         vres->flags);
>>> +        if (err)
>>> +            goto error_free_blocks;
>>> -        mutex_lock(&mgr->lock);
>>> -        drm_buddy_block_trim(mm,
>>> -                     original_size,
>>> -                     trim_list);
>>> -        mutex_unlock(&mgr->lock);
>>> +        remaining_size -= alloc_size;
>>> +    } while (remaining_size);
>>> -        if (!list_empty(&temp))
>>> -            list_splice_tail(trim_list, &vres->blocks);
>>> +    if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>> +        if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
>>> +            size = vres->base.size;
>>>       }
>>> +    if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
>>> +        vres->used_visible_size = size;
>>> +    } else {
>>> +        struct drm_buddy_block *block;
>>> +
>>> +        list_for_each_entry(block, &vres->blocks, link) {
>>> +            u64 start = drm_buddy_block_offset(block);
>>> +
>>> +            if (start < mgr->visible_size) {
>>> +                u64 end = start + drm_buddy_block_size(mm, block);
>>> +
>>> +                vres->used_visible_size +=
>>> +                    min(end, mgr->visible_size) - start;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    mgr->visible_avail -= vres->used_visible_size;
>>> +    mutex_unlock(&mgr->lock);
>>> +
>>>       if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>>>           xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>>>           vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>>> @@ -213,7 +190,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>       ttm_resource_fini(man, &vres->base);
>>>       kfree(vres);
>>> -    return r;
>>> +    return err;
>>>   }
>>>   static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>>> @@ -226,6 +203,7 @@ static void xe_ttm_vram_mgr_del(struct 
>>> ttm_resource_manager *man,
>>>       mutex_lock(&mgr->lock);
>>>       drm_buddy_free_list(mm, &vres->blocks);
>>> +    mgr->visible_avail += vres->used_visible_size;
>>>       mutex_unlock(&mgr->lock);
>>>       ttm_resource_fini(man, res);
>>> @@ -240,6 +218,13 @@ static void xe_ttm_vram_mgr_debug(struct 
>>> ttm_resource_manager *man,
>>>       struct drm_buddy *mm = &mgr->mm;
>>>       mutex_lock(&mgr->lock);
>>> +    drm_printf(printer, "default_page_size: %lluKiB\n",
>>> +           mgr->default_page_size >> 10);
>>> +    drm_printf(printer, "visible_avail: %lluMiB\n",
>>> +           (u64)mgr->visible_avail >> 20);
>>> +    drm_printf(printer, "visible_size: %lluMiB\n",
>>> +           (u64)mgr->visible_size >> 20);
>>> +
>>>       drm_buddy_print(mm, printer);
>>>       mutex_unlock(&mgr->lock);
>>>       drm_printf(printer, "man size:%llu\n", man->size);
>>> @@ -262,6 +247,8 @@ static void ttm_vram_mgr_fini(struct drm_device 
>>> *dev, void *arg)
>>>       if (ttm_resource_manager_evict_all(&xe->ttm, man))
>>>           return;
>>> +    WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>>> +
>>>       drm_buddy_fini(&mgr->mm);
>>>       ttm_resource_manager_cleanup(&mgr->manager);
>>> @@ -270,7 +257,8 @@ static void ttm_vram_mgr_fini(struct drm_device 
>>> *dev, void *arg)
>>>   }
>>>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct 
>>> xe_ttm_vram_mgr *mgr,
>>> -               u32 mem_type, u64 size, u64 default_page_size)
>>> +               u32 mem_type, u64 size, u64 io_size,
>>> +               u64 default_page_size)
>>>   {
>>>       struct ttm_resource_manager *man = &mgr->manager;
>>>       int err;
>>> @@ -279,6 +267,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, 
>>> struct xe_ttm_vram_mgr *mgr,
>>>       mgr->mem_type = mem_type;
>>>       mutex_init(&mgr->lock);
>>>       mgr->default_page_size = default_page_size;
>>> +    mgr->visible_size = io_size;
>>> +    mgr->visible_avail = io_size;
>>>       ttm_resource_manager_init(man, &xe->ttm, size);
>>>       err = drm_buddy_init(&mgr->mm, man->size, default_page_size);
>>> @@ -298,7 +288,8 @@ int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct 
>>> xe_ttm_vram_mgr *mgr)
>>>       mgr->gt = gt;
>>>       return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + 
>>> gt->info.vram_id,
>>> -                      gt->mem.vram.size, PAGE_SIZE);
>>> +                      gt->mem.vram.size, gt->mem.vram.io_size,
>>> +                      PAGE_SIZE);
>>>   }
>>>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> index 78f332d26224..35e5367a79fb 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> @@ -13,7 +13,8 @@ struct xe_device;
>>>   struct xe_gt;
>>>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct 
>>> xe_ttm_vram_mgr *mgr,
>>> -               u32 mem_type, u64 size, u64 default_page_size);
>>> +               u32 mem_type, u64 size, u64 io_size,
>>> +               u64 default_page_size);
>>>   int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr 
>>> *mgr);
>>>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>>>                     struct ttm_resource *res,
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> index 39aa2ec1b968..3d9417ff7434 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
>>> @@ -23,6 +23,10 @@ struct xe_ttm_vram_mgr {
>>>       struct ttm_resource_manager manager;
>>>       /** @mm: DRM buddy allocator which manages the VRAM */
>>>       struct drm_buddy mm;
>>> +    /** @visible_size: Proped size of the CPU visible portion */
>>> +    u64 visible_size;
>>> +    /** @visible_avail: CPU visible portion still unallocated */
>>> +    u64 visible_avail;
>>>       /** @default_page_size: default page size */
>>>       u64 default_page_size;
>>>       /** @lock: protects allocations of VRAM */
>>> @@ -39,6 +43,8 @@ struct xe_ttm_vram_mgr_resource {
>>>       struct ttm_resource base;
>>>       /** @blocks: list of DRM buddy blocks */
>>>       struct list_head blocks;
>>> +    /** @used_visible_size: How many CPU visible bytes this resource 
>>> is using */
>>> +    u64 used_visible_size;
>>>       /** @flags: flags associated with the resource */
>>>       unsigned long flags;
>>>   };
