Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F56ACE7A89
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 04:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EC610E1C8;
	Mon, 25 Sep 2023 04:17:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AFD10E1C8
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 04:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695615429; x=1727151429;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BdWIW7sGI8CecGc8oMA3ygrMOUSsN0Yxex14TraRUBA=;
 b=LemxvwW8WIhTxVgmYGnvX8V+JcaiFsRpiD+hYxLZkFErYerioTohbdr+
 Y3fPRyF9nOOSyGNRJOoFde2Fp//Baz97UTJHi9IHHwvD6iP4dbJqx/uM/
 sfCkcd1kN2sSbtT70GsrkJUNiqZ/qhPuu/Kh4/R3R+MKppWqCTexDyXHa
 u/x+Dd5/LWBH/vXU7dgovRBnX/J7EvDqD2xbRPRLfL0tVPFbAXT+fB/rA
 xbRDgkM0qlbcJE06zz5EuOuC3atLbyfz7sZG5Ak9rWrhPdPDJUR761s7i
 f7NVqA/l4lGqb/M3/07D3OoxNLKiaXTG5oPTYqIHZzHCmTEsLKjbHpkxN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378432027"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="378432027"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 21:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751528350"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="751528350"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2023 21:17:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 21:17:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 24 Sep 2023 21:17:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 24 Sep 2023 21:17:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 24 Sep 2023 21:17:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBS6U2qfxbKMlPQB067H0LHgGTdhljyxTBKcYXViKnCx7uVsLczSqhMzk63NoYPzkaCFwdQNaM99dsgP7q2H1T1Bxhnej2fwN1MANWUG7PQJItd1MgwcnXPaufCwziTArDPdnx8iSbJTpPm6qIFDa7m51D88k2R/fT2RLY0PSN+kdEnb1u+EzR15NjqsZWmTlBe6uSKgWjB8LixbfpZE6pghtikkiJUIXMvIroOePPVjRmyTViVCP/6IZSqKF3dxEtAZM7Skl7TLOpvBVqAX8ozWCZaRyLzs8J0gmUgoJIa7+j+bYv7hgqkXL3CdKH61WDTZwiItgdLgAB/xZ95rUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtbgqryNmi0h056BR7cU3CynlCGGcPbg79gRnU+mFd4=;
 b=m2VnTOxFMC8UEcniFk7XVbujw/NHIjqCPOiX+Lcr+ObPJKVE+zAdAFTWe53OH/5wFUJq5/RkT+GVXVCWL/OjFqGCAMYGb+Ncc2nB1WalhJg08wlYAtvn4HYlN+lKd84LDz+zl5dDYgpv59vmpNcxGNUOI+4aPPKl7JLtV5MGR8kKxDtZLY5Ai6CQgwiinTE/1ZDuRhr8G1zsg9VgL2pUxVtlqkZEJ2pcARGeWjeM06ApwiRZqR4Ii6sShh8bSL4O/aYYZx1an/kuQ27T443z4Ssf2Wom+6n5hu7c5Muahz2NbBIgDNilDJEdzKSKbE9TVtoDca/JnYsE1pfEfqdAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB5960.namprd11.prod.outlook.com (2603:10b6:510:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Mon, 25 Sep
 2023 04:17:04 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::c5ac:9134:7e53:b45c%7]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 04:17:04 +0000
Message-ID: <66f5ca34-bd42-68fb-6df9-a2005bdf9704@intel.com>
Date: Mon, 25 Sep 2023 09:46:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
 <20230919110541.1243785-2-sujaritha.sundaresan@intel.com>
 <d48b8558-5e81-8f9d-0425-2064541b85c9@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <d48b8558-5e81-8f9d-0425-2064541b85c9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::19) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 322de0df-7cbf-485a-d55d-08dbbd7e457a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FuzrrtBtsTyIqZuVGfGa6T+t8/rZxCLL6JuexsJg9nLQeeMOvNJwkRFZ6lsRMgF6fcid4a0B5m9ySj2VbgYig8P8MlknmesQHgE14Mj2nsbZT+sZ0//LGH5DgtoXqTDy5ExKjiP1NFtch7vU/BQG+jfwoG7dkeQ5jKt+TJv8BQ/vn/VImKX9tULmSddfyzTwtwpRBS88WUtqNuU9Yz83oQ9LswtllGKZM7AWKDaeB+CrsggrutgVDeclfggEUbnuNVispfPlOj+6Rbt/fiCIMNpNp3YGYuXZgGVq+HVyuLVUGsiSdV8aPKri762uA+/O1n/rOTaVHS4UqFDVjbmAH3vExX3ZDu1qPSy+3kZU/ilKyVYhGYfigRoy12SdRAYiX/9jWKmj9a7l/Xf1+Lak9Yz0aYtLzxdyD4EoHKMh6ZHaA7dlnH1FxEwBXYFLTlfy3JJDH2V/hbbLOct2ZJHAD0nPJFnBgB93/Izc6L6zjx7dVIW9CaSJCwgWtmH/ld+5HnSGWFPc6J/VSL456jSxRnNrf9t10I7gXV+3XJbGgRDAHtfcaRlg6jJOg/zNe8xfrYRdyhxdUmZ98Z0VwrZZxj6K6/GaCIgf+/wsyczK3UKrxXZLXeiZ7CGmr+EEHrVSfgCpUBO+c97lw7HFvA31SOEgrdouKr1W3z1+/sjMiOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(186009)(1800799009)(451199024)(6512007)(316002)(38100700002)(26005)(66946007)(66476007)(66556008)(2616005)(478600001)(53546011)(6486002)(36756003)(41300700001)(6506007)(6666004)(82960400001)(30864003)(2906002)(83380400001)(31686004)(31696002)(86362001)(5660300002)(8936002)(8676002)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2VtUGxTcldnaFNsdkRnNGZOU1YweVB0akhyRXJvYmhPT2FiWmk4dHVHMTN6?=
 =?utf-8?B?dml5UXdIMDZRMGtxaTAzVjNNYXR1TDVTZ0NyZzkrM1l5NVVhSVc5RmM0eFJH?=
 =?utf-8?B?OG5KN3lLbnUzcHVyZTN6bXFablJuK2NwaStoNWpGZlora0t5RzVTMzd3dWI4?=
 =?utf-8?B?VVNyZzJjaU5qV3ZoeWZwZnBOQmswQXNJeFkrMUtadmNySTFIeU9mNHljU2tw?=
 =?utf-8?B?dUdvQUpMRzdidDFvWWFSQUJpbTlzRUhycGNkemNVRk9PdXQxRDhSZmxXdXUx?=
 =?utf-8?B?NzNMRC9CWVBaQXBrQXN3MlZFUUdIeXlvSHRSYWROMVM0d1QwdzlRdnU1T29N?=
 =?utf-8?B?STc3cEdaMjZoazcwb2hYUEU3bnlleVJuMHNqM2JlbFl3aEt6VjJEVHNFZW9h?=
 =?utf-8?B?QytpZGR5QUVNNlpSMHpySTdxdlR1cXNwME5rZmtQVnpVT0l5bFE1SElucldG?=
 =?utf-8?B?MEI0UUJROGpsa0I1WUlTWnMyc3lQczRkd2FqaWFqNEZEMmxxNzQ2OFRCbkVQ?=
 =?utf-8?B?eTNENHV4QzBlQUdUdE1WQzVmT3FsaTZ3cVY2UEg0VWlUYnpPUUFsL1RXUm1n?=
 =?utf-8?B?NlozZithc0pWZnM4YjVPTTlRS0ZoMkVCNjRML2cybTgxUkZBWmoyWHZFelpa?=
 =?utf-8?B?OWNsdHhib3FRdkhkMzAyQmk0NHlqaEQyY1VmUDcvcFc0b2g5cFlYWnVXTmpX?=
 =?utf-8?B?a1NxMmpDYkJrbE1scElGLy9MTWJpQXlUaGZ4LzlrL2QwWHRtdng5VE1KYzVE?=
 =?utf-8?B?ak8zUnFQWnU4bkxOVWVsMDBPZStPNGIrSytwZHkwcDkva3hTQ2d0S1V3QnFQ?=
 =?utf-8?B?RkZtWlhPWHN5T3M0WUdiMk1RcU9UWU9BV2Y5NWU0b2d1QmNuK1YveTJERWhT?=
 =?utf-8?B?cjFvVlBRQ1pZamdIV3pxcTYwVzhHbWxoeHVEdVBVRGlJVkFZd2ZvU2NJQUY3?=
 =?utf-8?B?bTBLVzF2dW5JWjZ5b0lITDlUdm9jNnRGVHNvUDYya3NLQ2tqNWpNN1FuYjJj?=
 =?utf-8?B?Y3RVZWRmSkJGOUlUUGFlQzNkRjBBTUVucFdnNkVCKzRSQXJxaHN3cndoRkw5?=
 =?utf-8?B?YTJmWjlmV1B3dE5rK3N4b25EbGFIVFljQzN6ejQ0UitRMjZMQ05WSGl6SWJD?=
 =?utf-8?B?c2J6b0JxQjhXSWdNSzI3ODlQQ1NkNFdrbDFrajJ5SHlYVStwZjRwM2c3N2pP?=
 =?utf-8?B?ZDBsRGVyV2xDbWJLN2djWmg4NUFTUmU3TDY5ODBreVhkYjJ6cFhpUk0vWWJC?=
 =?utf-8?B?ZnFEWC9QalpzekNZN3hFUS9FTWRHZXRtcEdVSGsyRm5wUDZBTkQzSzBRWUh3?=
 =?utf-8?B?ckhTREZZTjlWaGdWTlUvbzFCdTlFR2laNWJwMFpYR2g3N1BHWTUyb2NrMVZM?=
 =?utf-8?B?NjVpc3VMbHY4SWMxNDZCU3Uycys2Tlp1RzlEK2hHVGI1Uy8zbVdNMXRrUUJv?=
 =?utf-8?B?RnR4T3NXOERIN1U4STVRODBCdHhUZmdyUVo5NzlxTlRGU1pEOWtiL21uQW9B?=
 =?utf-8?B?Wjg2VFJCVDRKdFAvekNOZS81ZjhvZ3NFei80clJkQjJib0NHSEJ1MExWdmdY?=
 =?utf-8?B?SDloVVl3L04yQXpRNEZpMGhsY2ZNUEtyVEQwQW5wbkVUSDNQaVZDZGpwOUU5?=
 =?utf-8?B?aXY3U1A0RHRUdkkwZ1ducGtCM3dOVzNFWDlXbWViT1hNWlhrSCthaVNKSnZI?=
 =?utf-8?B?YXpCclF1elYxbU5HY1J4cXRyUnFkN1piTVhpbkllMHMwMnErd1BvZzBLR00y?=
 =?utf-8?B?NFZHeEo4ZzZ2dWxuWEZGMU9MNll1YTBweFYxNFN2ZUFWY1lNSm8vZm83WWYz?=
 =?utf-8?B?OEdZWWFIQ21uWGZ6RWROaER2bzNucUdKeGhJQTMvZ1V4V0VLRFpLZlBKUGxP?=
 =?utf-8?B?R0gzNHpka01uSEVEUjMwa29nYWdNZTk0Q0pMZ2N1N0llVUxNLzVpeXhaK1Rh?=
 =?utf-8?B?U0lBYjhFR2g3eXpCdUgxTEhpU2JtMkh1ZDVVSXc1L3ZTZXJ6SDBJcEpCZ2FC?=
 =?utf-8?B?UGpZWUlUS3hpTEFlN3oxU1lsU2NadHB6dzdYRkNLQjhucXRCL3dad2c3WFdN?=
 =?utf-8?B?dkRuYjk1eDlKUURLVG5Pa0VxTzdtT0lpWmhIdFFGRitPUUFRQkhVZER4UEQ3?=
 =?utf-8?B?YlpsbFJSa0NrcG93Q0FtVEk4UTJDUVdGWm5iMmREaFNGR3B2RDRBUnRyZnV0?=
 =?utf-8?Q?+eTGpojI0Vd8/ntyu5ZPkpA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 322de0df-7cbf-485a-d55d-08dbbd7e457a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 04:17:03.6027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaLL9qF0d6P/solHkfVFqRHITNLuO8MOIy6GhHAo8YeULJIfKzteZn822mbI9BIFUC1+nv5yrk+/DG7U7s+5SIdJ6wSU6BwmplPkx5M14s0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5960
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add throttle reason sysfs
 attributes
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


On 9/20/2023 10:16 AM, Riana Tauro wrote:
>
>
> On 9/19/2023 4:35 PM, Sujaritha Sundaresan wrote:
>> Add throttle reasons sysfs interface under device/../gt#/
>> Currently there is one overall status and eight reasons
>> attributes.
>>
>> The new sysfs structure will have the below layout
>>
>> device/tile<n>/gt<n>
>>                 ├── gt0
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>                 │
>>                 │
>>                 ├── gtN
>>                 │   └── throttle
>>                 │       ├── <throttle_reasons>
>>
>> v2: Fix review comments (Riana)
>>      Move init call (Matt)
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
>>   drivers/gpu/drm/xe/xe_gt_sysfs.c              |   3 +
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 281 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
>>   .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  15 +
>>   drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>>   7 files changed, 334 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index cc95a46b5e4d..7e1c4be0ab7f 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -63,6 +63,7 @@ xe-y += xe_bb.o \
>>       xe_gt_mcr.o \
>>       xe_gt_pagefault.o \
>>       xe_gt_sysfs.o \
>> +    xe_gt_throttle_sysfs.o \
>>       xe_gt_tlb_invalidation.o \
>>       xe_gt_topology.o \
>>       xe_guc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index e13fbbdf6929..f9ba57c3bc4b 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -410,4 +410,17 @@
>>   #define XEHPC_BCS5_BCS6_INTR_MASK        XE_REG(0x190118)
>>   #define XEHPC_BCS7_BCS8_INTR_MASK        XE_REG(0x19011c)
>>   +#define GT0_PERF_LIMIT_REASONS            XE_REG(0x1381a8)
>> +#define   GT0_PERF_LIMIT_REASONS_MASK        0xde3
>> +#define   PROCHOT_MASK                REG_BIT(0)
>> +#define   THERMAL_LIMIT_MASK            REG_BIT(1)
>> +#define   RATL_MASK                REG_BIT(5)
>> +#define   VR_THERMALERT_MASK            REG_BIT(6)
>> +#define   VR_TDC_MASK                REG_BIT(7)
>> +#define   POWER_LIMIT_4_MASK            REG_BIT(8)
>> +#define   POWER_LIMIT_1_MASK            REG_BIT(10)
>> +#define   POWER_LIMIT_2_MASK            REG_BIT(11)
>> +#define   GT0_PERF_LIMIT_REASONS_LOG_MASK    REG_GENMASK(31, 16)
> Not used in below code
I had added this, in case we need to expose the log bits later. But I'll 
remove this for now.
>> +#define MTL_MEDIA_PERF_LIMIT_REASONS        XE_REG(0x138030)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index c69d2e8a0fe1..d4839ade7240 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_managed.h>
>>     #include "xe_gt.h"
>> +#include "xe_gt_throttle_sysfs.h"
>>     static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>   {
>> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>         gt->sysfs = &kg->base;
>>   +    xe_gt_throttle_sysfs_init(&gt->throttle);
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>       if (err) {
>>           drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> new file mode 100644
>> index 000000000000..0dc9c7cada5a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -0,0 +1,281 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include <regs/xe_gt_regs.h>
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_sysfs.h"
>> +#include "xe_gt_throttle_sysfs.h"
>> +#include "xe_mmio.h"
>> +
>> +/**
>> + * DOC: Xe GT Throttle
>> + *
>> + * Provides sysfs entries for frequency throttle reasons in GT
>> + *
>> + * device/gt#/throttle/status - Overall status
>> + * device/gt#/throttle/throttle_reason_pl1 - Frequency throttle due 
>> to PL1
>> + * device/gt#/throttle/throttle_reason_pl2 - Frequency throttle due 
>> to PL2
>> + * device/gt#/throttle/throttle_reason_pl4 - Frequency throttle due 
>> to PL4, Iccmax etc.
>> + * device/gt#/throttle/throttle_reason_thermal - Frequency throttle 
>> due to thermal
>> + * device/gt#/throttle/throttle_reason_prochot - Frequency throttle 
>> due to prochot
>> + * device/gt#/throttle/throttle_reason_ratl - Frequency throttle due 
>> to RATL
>> + * device/gt#/throttle/throttle_reason_vr_thermalert - Frequency 
>> throttle due to VR THERMALERT
>> + * device/gt#/throttle/throttle_reason_vr_tdc -  Frequency throttle 
>> due to VR TDC
>> + */
>> +
>> +static struct xe_gt_throttle *dev_to_throttle(struct device *dev)
>> +{
>> +    struct kobject *kobj = &dev->kobj;
>> +
>> +    return &kobj_to_gt(kobj->parent)->throttle;
>> +}
>> +
>> +static struct xe_gt *throttle_to_gt(struct xe_gt_throttle *throttle)
>> +{
>> +    return container_of(throttle, struct xe_gt, throttle);
>> +}
>> +
>> +u32 read_perf_limit_reasons(struct xe_gt *gt)
>> +{
>> +    u32 reg;
> Add a new line after all declarations
Sure. Will fix
>> +    if (xe_gt_is_media_type(gt))
>> +        reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
>> +    else
>> +        reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
>> +
>> +    return reg;
>> +}
>> +
>> +u32 xe_read_status(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 status = read_perf_limit_reasons(gt) & 
>> GT0_PERF_LIMIT_REASONS_MASK;
>> +
>> +    return status;
>> +}
>> +
>> +u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>> +
>> +    return pl1;
>> +}
>> +
>> +u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>> +
>> +    return pl2;
>> +}
>> +
>> +u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>> +
>> +    return pl4;
>> +}
>> +
>> +u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>> +
>> +    return thermal;
>> +}
>> +
>> +u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
>> +
>> +    return prochot;
>> +}
>> +
>> +u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
>> +
>> +    return ratl;
>> +}
>> +
>> +u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>> +
>> +    return thermalert;
>> +}
>> +
>> +u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
>> +
>> +    return tdc;
>> +}
>> +
>> +static ssize_t status_show(struct device *dev,
>> +               struct device_attribute *attr,
>> +               char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
> Since you are using only xe_gt and nothing of the struct 
> xe_gt_throttle is used. Can be converted to gt directly
Okay. Will fix.
>> +    bool status = !!xe_read_status(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", status);
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +
>> +static ssize_t reason_pl1_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool pl1 = !!xe_read_reason_pl1(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl1);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl1);
>> +
>> +static ssize_t reason_pl2_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool pl2 = !!xe_read_reason_pl2(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl2);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl2);
>> +
>> +static ssize_t reason_pl4_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool pl4 = !!xe_read_reason_pl4(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", pl4);
>> +}
>> +static DEVICE_ATTR_RO(reason_pl4);
>> +
>> +static ssize_t reason_thermal_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool thermal = !!xe_read_reason_thermal(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", thermal);
>> +}
>> +static DEVICE_ATTR_RO(reason_thermal);
>> +
>> +static ssize_t reason_prochot_show(struct device *dev,
>> +                   struct device_attribute *attr,
>> +                   char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool prochot = !!xe_read_reason_prochot(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", prochot);
>> +}
>> +static DEVICE_ATTR_RO(reason_prochot);
>> +
>> +static ssize_t reason_ratl_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool ratl = !!xe_read_reason_ratl(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", ratl);
>> +}
>> +static DEVICE_ATTR_RO(reason_ratl);
>> +
>> +static ssize_t reason_vr_thermalert_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    bool thermalert = !!xe_read_reason_vr_thermalert(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", thermalert);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_thermalert);
>> +
>> +static ssize_t reason_vr_tdc_show(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  char *buff)
>> +{
>> +    struct xe_gt_throttle *throttle = dev_to_throttle(dev);
>> +    struct xe_gt *gt = throttle_to_gt(throttle); > +    bool tdc = 
>> !!xe_read_reason_vr_tdc(&gt->throttle);
>> +
>> +    return sysfs_emit(buff, "%u\n", tdc);
>> +}
>> +static DEVICE_ATTR_RO(reason_vr_tdc);
>> +
>> +static const struct attribute *throttle_attrs[] = {
>> +    &dev_attr_status.attr,
>> +    &dev_attr_reason_pl1.attr,
>> +    &dev_attr_reason_pl2.attr,
>> +    &dev_attr_reason_pl4.attr,
>> +    &dev_attr_reason_thermal.attr,
>> +    &dev_attr_reason_prochot.attr,
>> +    &dev_attr_reason_ratl.attr,
>> +    &dev_attr_reason_vr_thermalert.attr,
>> +    &dev_attr_reason_vr_tdc.attr,
>> +    NULL
>> +};
>> +
>> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
>> +{
>> +    struct kobject *kobj = arg;
>> +
>> +    sysfs_remove_files(kobj, throttle_attrs);
>> +    kobject_put(kobj);
>> +}
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle)
>> +{
>> +    struct xe_gt *gt = throttle_to_gt(throttle);
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    struct kobject *kobj;
>> +    int err;
>> +
>> +    kobj = kobject_create_and_add("throttle", gt->sysfs);
>> +    if (!kobj) {
>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +        return;
>> +    }
>> +
>> +    err = sysfs_create_files(kobj, throttle_attrs);
>> +    if (err) {
>> +        kobject_put(kobj);
>> +        drm_warn(&xe->drm, "failed to register throttle sysfs, err: 
>> %d\n", err);
>> +        return;
>> +    }
>> +
>> +    err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, 
>> kobj);
>> +    if (err)
>> +        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> +             __func__, err);
>> +}
>> +
>> +
> Extra blank line
Will remove
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> new file mode 100644
>> index 000000000000..809213c3bba1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
>> +#define _XE_GT_THROTTLE_SYSFS_H_
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
> The above headers are not required
Okay.
>> +#include "xe_gt_throttle_sysfs_types.h"
>> +
>> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
>> +
>> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>> new file mode 100644
>> index 000000000000..5ee0d45d0a9f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_gt_throttle {
>> +};
>> +
> Why an empty struct?
>
> Thanks
> Riana Tauro

Yeah looking at it now, it's not needed.

Thanks,

Suja

>> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index d4310be3e1e7..7829bbeeb5d8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -8,6 +8,7 @@
>>     #include "xe_force_wake_types.h"
>>   #include "xe_gt_idle_sysfs_types.h"
>> +#include "xe_gt_throttle_sysfs_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -299,6 +300,9 @@ struct xe_gt {
>>       /** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>>       struct kobject *sysfs;
>>   +    /** @throttle: frequency throttling reasons in GT */
>> +    struct xe_gt_throttle throttle;
>> +
>>       /** @mocs: info */
>>       struct {
>>           /** @uc_index: UC index */
