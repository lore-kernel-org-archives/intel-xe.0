Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753D1EB64DA
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 02:40:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B1210E3CF;
	Thu,  6 Jul 2023 02:40:15 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108C010E1CF
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 02:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688611213; x=1720147213;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DahmE+zfw+JrEPQ35NfW4JQ8P4vGXI0bH0q3uIYjIxU=;
 b=JyqRLmtY1FYq3R1kFLn/QpZYrbR2GTmyH/LIK+WMCX8cqcDr6NGPgSSp
 bcHYeMZVmQt4EVtVttpeJVqgF8ALJpMZKx9s+/XjNUyWlJNgfmL/zSlbi
 j4pZyf7cI4PY1Qpv09ANVRBtbMSP/qzRqXGwuqHgEqWewcG+zJzZu0oXh
 eVRZ9aZtvEEYz8AiG9/cBkhbpCTQ+xfDT4QMLIXePkq6Te/0o9Fnx7Tq1
 +g6M+jmY3TVBMdgULnnsNMjrG5IccsksjeaPxhkxPVGktElsazO/k5LfF
 HKraSGK1Ylk7KXC6J5DMNNWXtn7ZKcLR9n3Cw1lsf+1sHxSUr7PHrMSEO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366975100"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="366975100"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 19:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="669605370"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="669605370"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 05 Jul 2023 19:40:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 19:40:12 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 19:40:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 19:40:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 19:40:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZh6O6DCT34iNRqF390LcNP463v6solBpwGrY9Hd6PIG/ZztpFb4C6Du146wIRrMsgxkAI7j5FbSLB88P4Ku4JT3t1qH67nMMMxhFQ0eI1DK3+v1a/gKT0njXjKgNAGhql1TlKsy0Qv4ahufA2j6RU3Lu9WUblHl3FXPr130Z2W2QfCzfJ9/dlyRhlNx7l2Se9WS8P2SDKJJvtACQDgiz28DN7qU6TXO0H6xKbSubv+GWf6xbow6F8z+rTkAo5og9Uy7s/OfPHjOdujFhcvqU1gsuyAOp8tKFt8lhXoF8ojIP0juTslODRG2G4dlj7/WqyvfXgaEb2OF8sdyBxGNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsfpBZJdBXZOmbj8uxDG7j+/OCl4/XX4K4HjdV4S9jc=;
 b=DO+8f1JNoqzNq0D8Rqv8Yjrc3Q9UwKzu+TSZkVeT+ICVLTp+ue7XdtSbzutwGcg9Fo2kOeb/8ppJ63LQ1cj4O9HFQvzB7SF0J5u9fHkHoNEzSgLsAtYR1bZpxfnpRW2Up1a2Ug9qHWyL668TX11icjUNa6Mkms+8lLPKuw/v60uLoQx7AWmH0HwbdoI3+L9etXcDcQfFjDH64AUbdh21n6tt5DPOG6NpCna5a01ln7ncNJhnJfBN+N74eF91HCRprp+B6I+Wl2A/HbFmHHKnXdCjayFNKbwu55X9vyhMo4Vi/AcIwupcSiyCMben+l1dm246BVkE6KjdGJDLTTeuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 02:40:09 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::5ec8:e1d9:fbae:5b2a%5]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 02:40:09 +0000
Message-ID: <a1ec84ad-cd6f-e88e-fa25-2bdee7a2e7d9@intel.com>
Date: Wed, 5 Jul 2023 19:40:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: <intel-xe@lists.freedesktop.org>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c1541c-071e-4772-eef0-08db7dca506a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5ZS2m12eadpZMOVwJuhlIApNPcdj/lqEXbc5lHi6iZ2PAtzRXBmmo3wUQ11an1szjzExschXLGcpAZC7MQfqAa+IyNBjT87NrVSCRCGyKZTOWgXGEoZT7vy/j44tYOoBHKTWjnCdAlwDvbRSXQgSmMsI9AyuHoQvfUJJZtYN7Mis9IuTiEUvYMFBZu1sA1FADjILcMmAx3a1jzQBmTSQrUVR+DrmWI0HnvmXRYN1dMhuL/Ts8Deprvv0p/FUBMWh4j/roRQSv+dI/VYkch/rE34IlbBmjUEFaNdTsiY/Je3ubEepMVn50ji0IDBk1Y5ttS179CCCgS2z+6z+1YZ5z7idaHuwdwNYqtdaDBjV7RztwjNN13GMwznrWYR+3GAD5ZKdU7M1GNIAGtnKeZI/0ElkPUo0TE7XsyOPZobY0G7ymnSZ5eaVSixQu5ssN4TOY6w+UJIAxQD+6UDN9vY113eaFVDt+jLtNu3qjXrgICqmH47EJ8b3ZOWgrk9Hwsbv9LZSUOlPW54fu0XHO4dEDkwoGgiNkV3/T6JbOJE2Nb2WP407z+SJcV6WuwWRM3K8h5datmOMD5kRBYaGTNluxHRKoEPW+RCe8XQE2rmeGegWx34p+KWOnqzbj8gmV4EfF3nhlBPQuh5FjkItVTmnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(66556008)(66476007)(6916009)(4326008)(2616005)(86362001)(38100700002)(186003)(82960400001)(31696002)(6506007)(26005)(53546011)(83380400001)(6512007)(107886003)(66946007)(6666004)(478600001)(6486002)(36756003)(30864003)(41300700001)(8676002)(31686004)(8936002)(2906002)(66899021)(5660300002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWNCVGJQNGpwWVVWZzYyRzRJa2lVb1J2WlNwYzc0QUpyNlB3NUdwOFN2ZVpB?=
 =?utf-8?B?WHZGOWYvR3JnNTJYODhIU3Z1Y0hZVnE3bFdqNGU4L0IxanFHem52TWNuZEQ5?=
 =?utf-8?B?Zk42R3NQaVBiZ1dnZU5rQkNlcnZ5U3JSWHB6aTNja1BEd3BSNGEzNkFtdVQ0?=
 =?utf-8?B?RG1xTm92UjZXeEg4RjNZSkNHUkVSdFpGQXlleFlVK2FNMmFWaTJiYVFLbk5Z?=
 =?utf-8?B?QXRMUGpPMmFFYXVCSWRmZUFBU1NxdmYzUGpsbEZ0b29JWTdGWkFsZDFXSEQ1?=
 =?utf-8?B?dGFaL2VVTEc0VnRKTTZzS01SbjBlSCsvc1RZVHpaSk0vQ1U1NTQ2MFlyUlVy?=
 =?utf-8?B?WVEwaTZxc28yR01TWUp3Z0VRWjJzN0htN1VESkZGRndnZDF2bG1RWVBwVlEy?=
 =?utf-8?B?aFk5ZXdFVzB5M0tDell5T1h1WE0xZm5GUDJyUVlWcUp1YUdWaXVSRVlhcGNU?=
 =?utf-8?B?NFVUeGRpWjN6WEprQ0xRa3dYcktzR1FDNkdFZk9Hc1kyOHg1Y2YvaVR4bHUz?=
 =?utf-8?B?cmN3U1JxanhMK2o3OGxVaW9YZ28wZ3NmWEFHWVp2MDZhWUl2WndtYk5tQXp5?=
 =?utf-8?B?MkdTcGI0ZHhlWkl0V0pwYWZLQkMrQ3pFdnlYN2l1QlJYVzFUQldITktpaDFz?=
 =?utf-8?B?TVNpUktDTGpzUmJZUDk3UGs5UEh1NTM1UHc2bU5ONVBEdmRyR0hSMlcxeGxa?=
 =?utf-8?B?M0RGSWtWNXpUYXk4bXVxZUdPVkxYSmJpa0lOTTBFTForeUhtRE55Skl0anZn?=
 =?utf-8?B?eE5sSFgvSFJHMFJWb0xPR2o2a0d1aEVtMGhNS1lPWU40b1Q3QnhnQmVVd2xQ?=
 =?utf-8?B?RkVSbTNiaXdGL3N6RFlPdW5kbXhZSzE3dytvSHEwZFlPdUJvWm1qTVhmSkxQ?=
 =?utf-8?B?RkZDcFpNbUhpRWwwNzIwdVcyZ1d4cmdOa0NzMnhwbDJDYlorUnJYMVBmR0li?=
 =?utf-8?B?TmhDRVZtK0UrYXR2em1qSW5OVGh4VTNYY2tzNm5BRW03RXZsVkNhMGZsa1M5?=
 =?utf-8?B?ZTNxRjBWeVNtaG1jS3p1TWs1ak9nVG5rVmJYOEg5cUpGbldqUDN5amlBTkJH?=
 =?utf-8?B?b1JnOG5mWGlqQmQzWjlISDhMK0dtZkR0UEVvb0VSMnQxbjZQd1FqK3pGM3dm?=
 =?utf-8?B?OUVCaE1Ic3Y5RnFaWGNDSXE3QTltSG9VbWFVR2Q3U1k0R0paVmxDTENGQml5?=
 =?utf-8?B?bHd5eE1OS1FHYkp6VTYxamtKaWVBU09zbEY5eHYvbmhFcytrUTZmY0JOS0o4?=
 =?utf-8?B?QjdYckcrT1IzellYdnF6V0FndVVwMSs3ZnMrR0d2aUZwQlowdzFkZkY0cVFW?=
 =?utf-8?B?Wjc2Y09vU0JhMEVBNDExK1ZNVkxSaVR1dXdYTS9CNWVpMEUrbklXOER3NjhX?=
 =?utf-8?B?aVNQVWRrSmNRVHIxaU9ZdHJoN1FReGdoWVZ0ODFsclZNMTJJMEV5dW5wMUlL?=
 =?utf-8?B?NC8rT2NwRUNsL2NEcTg2N2tLdy9udy9RdlZYUk9lV2krVFFJVmxzcStORHdR?=
 =?utf-8?B?MzNBdkxBYnluaGVldnVGYk90cGJ6L2VsR3drenFUQmJUV2pXWHdHaEpscTlk?=
 =?utf-8?B?UVFyeU83eVo1QWJKRVk4dTBaRDlHL0FoV2tSZUZIV1JFYTJGREVCZ2FCSlJB?=
 =?utf-8?B?U25SODU4eGtkYnhRYVdCazZqL3ZjeEg2SEg1aUhJRGZJYUszMkVmNm9xK3hm?=
 =?utf-8?B?RndubHBlbWNnNzVGcVk0SVMzdnpCWGViYjljdkcwcTlLdXdYWFhaRjBjU2VG?=
 =?utf-8?B?N3ZCbmo4ZEcxNlFLNEt1V2Z0RHd2dlZDM2J1T2RQUUs4MWtlVTgzUXlKTnpF?=
 =?utf-8?B?TDdvYnI0SzBFbkoxeGQ0RVVZYnBXR1JlbXlmaVFGaThPb3RmRTd0cXVGdW1i?=
 =?utf-8?B?MkVsNVloM2I5V05qOEtFUEh0cVNjQnlkc0Yya2cxS3dUblowMTc2SER6VldP?=
 =?utf-8?B?QU5CNUI2OU1SdEsrbFdzaHVYNmpVVWVYSUJLS0tONHRSb1AwV25aVnhDT0s0?=
 =?utf-8?B?ZUxMbE15Um0zRFNZNDduQjBkdlJIZ3JRY09uMFhMN3gwTERLNFpPZEEwYVVW?=
 =?utf-8?B?Y29wZjh4SXpHNCt0VkZuL3RCVHpoNE9kYk4wWDBxZWFmQ3EzRlV4QVQwOE5B?=
 =?utf-8?B?Q2t2RXRXazVDVGJlanE5ckpsV2JNOG5YaE44L1cxd1JvYnFZaXBrdWlHYmtx?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c1541c-071e-4772-eef0-08db7dca506a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 02:40:09.1543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMwbb2YLUwoie50ZucWoysXhhG8ZvqRhkmlUh5Gsp+dhYEPje4QSENrBd2Ap7Zt11RcN/RREYG0GCicFcxbVFadFk1VtxOxG87VtG1btFmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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


On 6/27/2023 5:21 AM, aravind.iddamsetty at intel.com (Aravind 
Iddamsetty) wrote:
> There are a set of engine group busyness counters provided by HW which are
> perfect fit to be exposed via PMU perf events.
>
> BSPEC: 46559, 46560, 46722, 46729
>
> events can be listed using:
> perf list
>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>    xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>
> and can be read using:
>
> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>             time             counts unit events
>       1.001139062                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       2.003294678                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       3.005199582                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       4.007076497                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       5.008553068                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       6.010531563              43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       7.012468029              44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       8.013463515                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>       9.015300183                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      10.017233010                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>      10.971934120                  0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>
> The pmu base implementation is taken from i915.
>
> v2:
> Store last known value when device is awake return that while the GT is
> suspended and then update the driver copy when read during awake.
>
> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin at intel.com>
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu at intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty at intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |   2 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>   drivers/gpu/drm/xe/xe_device.c       |   2 +
>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>   drivers/gpu/drm/xe/xe_gt.c           |   2 +
>   drivers/gpu/drm/xe/xe_irq.c          |  22 +
>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>   drivers/gpu/drm/xe/xe_pmu.c          | 739 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pmu.h          |  25 +
>   drivers/gpu/drm/xe/xe_pmu_types.h    |  80 +++
>   include/uapi/drm/xe_drm.h            |  16 +
>   11 files changed, 902 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 081c57fd8632..e52ab795c566 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -217,6 +217,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/skl_universal_plane.o \
>   	i915-display/skl_watermark.o
>   
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>   ifeq ($(CONFIG_ACPI),y)
>   	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   		i915-display/intel_acpi.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3f664011eaea..c7d9e4634745 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -285,6 +285,11 @@
>   #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>   #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>   
> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE		XE_REG(0xdb80)
> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE		XE_REG(0xdba0)
> +#define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
> +#define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
> +
>   #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>   #define   ENABLE_SMALLPL			REG_BIT(15)
>   #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c7985af85a53..b2c7bd4a97d9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -328,6 +328,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_debugfs_register(xe);
>   
> +	xe_pmu_register(&xe->pmu);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>   	if (err)
>   		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 0226d44a6af2..3ba99aae92b9 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -15,6 +15,7 @@
>   #include "xe_devcoredump_types.h"
>   #include "xe_gt_types.h"
>   #include "xe_platform_types.h"
> +#include "xe_pmu.h"
>   #include "xe_step_types.h"
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> @@ -332,6 +333,9 @@ struct xe_device {
>   	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>   	bool d3cold_allowed;
>   
> +	/* @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 2458397ce8af..96e3720923d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -593,6 +593,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>   	if (err)
>   		goto err_msg;
>   
> +	engine_group_busyness_store(gt);
> +
>   	err = xe_uc_suspend(&gt->uc);
>   	if (err)
>   		goto err_force_wake;
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index b4ed1e4a3388..cb943fb94ec7 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -27,6 +27,24 @@
>   #define IIR(offset)				XE_REG(offset + 0x8)
>   #define IER(offset)				XE_REG(offset + 0xc)
>   
> +/*
> + * Interrupt statistic for PMU. Increments the counter only if the
> + * interrupt originated from the GPU so interrupts from a device which
> + * shares the interrupt line are not accounted.
> + */
> +static inline void xe_pmu_irq_stats(struct xe_device *xe,
> +				    irqreturn_t res)
> +{
> +	if (unlikely(res != IRQ_HANDLED))
> +		return;
> +
> +	/*
> +	 * A clever compiler translates that into INC. A not so clever one
> +	 * should at least prevent store tearing.
> +	 */
> +	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
> +}
> +
>   static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>   {
>   	u32 val = xe_mmio_read32(mmio, reg);
> @@ -325,6 +343,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>   
>   	xe_display_irq_enable(xe, gu_misc_iir);
>   
> +	xe_pmu_irq_stats(xe, IRQ_HANDLED);
> +
>   	return IRQ_HANDLED;
>   }
>   
> @@ -414,6 +434,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   	dg1_intr_enable(xe, false);
>   	xe_display_irq_enable(xe, gu_misc_iir);
>   
> +	xe_pmu_irq_stats(xe, IRQ_HANDLED);
> +
>   	return IRQ_HANDLED;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 75e5be939f53..f6fe89748525 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -12,6 +12,7 @@
>   #include "xe_hw_fence.h"
>   #include "xe_module.h"
>   #include "xe_pci.h"
> +#include "xe_pmu.h"
>   #include "xe_sched_job.h"
>   
>   bool enable_guc = true;
> @@ -49,6 +50,10 @@ static const struct init_funcs init_funcs[] = {
>   		.init = xe_sched_job_module_init,
>   		.exit = xe_sched_job_module_exit,
>   	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>   	{
>   		.init = xe_register_pci_driver,
>   		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..bef1895be9f7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,739 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright ? 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static unsigned int
> +__sample_idx(struct xe_pmu *pmu, unsigned int gt_id, int sample)
> +{
> +	unsigned int idx = gt_id * __XE_NUM_PMU_SAMPLERS + sample;
> +
> +	XE_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));
> +
> +	return idx;
> +}
> +
> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
> +{
> +	return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur;
> +}
> +
> +static void
> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
> +{
> +	pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val;
> +}
> +
> +static int engine_busyness_sample_type(u64 config)
> +{
> +	int type = 0;
> +
> +	switch (config) {
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +		type =  __XE_SAMPLE_RENDER_GROUP_BUSY;
> +		break;
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +		type = __XE_SAMPLE_COPY_GROUP_BUSY;
> +		break;
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
> +		break;
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +		type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
> +		break;
> +	}
> +
> +	return type;
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static u64 __engine_group_busyness_read(struct xe_gt *gt, u64 config)
> +{
> +	u64 val = 0;
> +
> +	switch (config) {
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
> +		break;
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
> +		break;
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
> +		break;
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
> +		break;
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return xe_gt_clock_interval_to_ns(gt, val * 16);
> +}
> +
> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
> +{
> +	int sample_type = engine_busyness_sample_type(config);
> +	struct xe_device *xe = gt->tile->xe;
> +	const unsigned int gt_id = gt->info.id;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	bool device_awake;
> +	unsigned long flags;
> +	u64 val;
> +
> +	/*
> +	 * found no better way to check if device is awake or not. Before
> +	 * we suspend we set the submission_state.enabled to false.
> +	 */
> +	device_awake = gt->uc.guc.submission_state.enabled ? true : false;
> +	if (device_awake)
> +		val = __engine_group_busyness_read(gt, config);
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (device_awake)
> +		store_sample(pmu, gt_id, sample_type, val);
> +	else
> +		val = read_sample(pmu, gt_id, sample_type);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return val;
> +}
> +
> +void engine_group_busyness_store(struct xe_gt *gt)
> +{
> +	struct xe_pmu *pmu = &gt->tile->xe->pmu;
> +	unsigned int gt_id = gt->info.id;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
> +		     __engine_group_busyness_read(gt, XE_PMU_RENDER_GROUP_BUSY(0)));
> +	store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
> +		     __engine_group_busyness_read(gt, XE_PMU_COPY_GROUP_BUSY(0)));
> +	store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
> +		     __engine_group_busyness_read(gt, XE_PMU_MEDIA_GROUP_BUSY(0)));
> +	store_sample(pmu, gt_id, __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
> +		     __engine_group_busyness_read(gt, XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
> +	unsigned int gt_id = config_gt_id(config);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +
> +	if (gt_id > max_gt_id)
> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	case XE_PMU_INTERRUPTS(0):
> +		if (gt_id)
> +			return -ENOENT;
> +		break;
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +		if (GRAPHICS_VER(xe) < 12)
> +			return -ENOENT;
> +		break;
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		if (MEDIA_VER(xe) >= 13 && gt->info.type != XE_GT_TYPE_MEDIA)
> +			return -ENOENT;
> +		break;
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	ret = config_status(xe, event->attr.config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const unsigned int gt_id = config_gt_id(event->attr.config);
> +	const u64 config = config_counter(event->attr.config);
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 val = 0;
> +
> +	switch (config) {
> +	case XE_PMU_INTERRUPTS(0):
> +		val = READ_ONCE(pmu->irq_count);
> +		break;
> +	case XE_PMU_RENDER_GROUP_BUSY(0):
> +	case XE_PMU_COPY_GROUP_BUSY(0):
> +	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> +	case XE_PMU_MEDIA_GROUP_BUSY(0):
> +		val = engine_group_busyness_read(gt, config);
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (pmu->closed) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +again:
> +	prev = local64_read(&hwc->prev_count);
> +	new = __xe_pmu_event_read(event);
> +
> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
> +		goto again;
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	if (flags & PERF_EF_UPDATE)
> +		xe_pmu_event_read(event);
> +
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (pmu->closed)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_str_attribute {
> +	struct device_attribute attr;
> +	const char *str;
> +};
> +
> +static ssize_t xe_pmu_format_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct xe_str_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_str_attribute, attr);
> +	return sprintf(buf, "%s\n", eattr->str);
> +}
> +
> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
> +	(&((struct xe_str_attribute[]) { \
> +		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
> +		  .str = _config, } \
> +	})[0].attr.attr)
> +
> +static struct attribute *xe_pmu_format_attrs[] = {
> +	XE_PMU_FORMAT_ATTR(xe_eventid, "config:0-20"),
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_format_attr_group = {
> +	.name = "format",
> +	.attrs = xe_pmu_format_attrs,
> +};
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +	.global = false, \
> +}
> +
> +#define __global_event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +	.global = true, \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +		bool global;
> +	} events[] = {
> +		__global_event(0, "interrupts", NULL),
> +		__event(1, "render-group-busy", "ns"),
> +		__event(2, "copy-group-busy", "ns"),
> +		__event(3, "media-group-busy", "ns"),
> +		__event(4, "any-engine-group-busy", "ns"),
> +	};
> +
> +	unsigned int count = 0;
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	struct xe_gt *gt;
> +	unsigned int i, j;
> +
> +	/* Count how many counters we will be exposing. */
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +
> +			if (!config_status(xe, config))
> +				count++;
> +		}
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_alloc;
> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_alloc;
> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_alloc;
> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
> +			char *str;
> +
> +			if (config_status(xe, config))
> +				continue;
> +
> +			if (events[i].global)
> +				str = kstrdup(events[i].name, GFP_KERNEL);
> +			else
> +				str = kasprintf(GFP_KERNEL, "%s-gt%u",
> +						events[i].name, j);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &xe_iter->attr.attr;
> +			xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +			if (events[i].unit) {
> +				if (events[i].global)
> +					str = kasprintf(GFP_KERNEL, "%s.unit",
> +							events[i].name);
> +				else
> +					str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
> +							events[i].name, j);
> +				if (!str)
> +					goto err;
> +
> +				*attr_iter++ = &pmu_iter->attr.attr;
> +				pmu_iter = add_pmu_attr(pmu_iter, str,
> +							events[i].unit);
> +			}
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +err_alloc:
> +	kfree(attr);
> +	kfree(xe_attr);
> +	kfree(pmu_attr);
> +
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	XE_BUG_ON(!pmu->base.event_init);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	XE_BUG_ON(!pmu->base.event_init);
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (pmu->closed)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
> +
> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_slot = ret;
> +
> +	return 0;
> +}
> +
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_slot != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_slot);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_slot == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister(struct drm_device *device, void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +
> +	if (!pmu->base.event_init)
> +		return;
> +
> +	/*
> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
> +	 * ensures all currently executing ones will have exited before we
> +	 * proceed with unregistration.
> +	 */
> +	pmu->closed = true;
> +	synchronize_rcu();
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	pmu->base.event_init = NULL;
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +static void init_samples(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	struct xe_gt *gt;
> +	unsigned int i;
> +
> +	for_each_gt(gt, xe, i)
> +		engine_group_busyness_store(gt);
> +}
> +
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&xe_pmu_format_attr_group,
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +
> +	int ret = -ENOMEM;
> +
> +	spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +	init_samples(pmu);
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (pmu->name)
> +		/* tools/perf reserves colons as special. */
> +		strreplace((char *)pmu->name, ':', '_');
> +
> +	if (!pmu->name)
> +		goto err;
> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;
> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
> +	XE_WARN_ON(ret);
> +
> +	return;
> +
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	pmu->base.event_init = NULL;
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);
> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..d3f47f4ab343
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright ? 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_gt_types.h"
> +#include "xe_pmu_types.h"
> +
> +#ifdef CONFIG_PERF_EVENTS
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void engine_group_busyness_store(struct xe_gt *gt);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void engine_group_busyness_store(struct xe_gt *gt) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..e87edd4d6a87
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright ? 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +#include <uapi/drm/xe_drm.h>
> +
> +enum {
> +	__XE_SAMPLE_RENDER_GROUP_BUSY,
> +	__XE_SAMPLE_COPY_GROUP_BUSY,
> +	__XE_SAMPLE_MEDIA_GROUP_BUSY,
> +	__XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +struct xe_pmu_sample {
> +	u64 cur;
> +};
> +
> +#define XE_MAX_GT_PER_TILE 2
> +
> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;

Are we not adding this timer for xe (it exists in i915)?

/**
          * @timer: Timer for internal i915 PMU sampling.
          */
         struct hrtimer timer;

Thanks,

Vinay.

> +	/**
> +	 * @closed: xe is unregistering.
> +	 */
> +	bool closed;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 *
> +	 */
> +	struct xe_pmu_sample sample[XE_MAX_GT_PER_TILE * __XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @irq_count: Number of interrupts
> +	 *
> +	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
> +	 * 4e9 interrupts are a lot and postprocessing can really deal with an
> +	 * occasional wraparound easily. It's 32bit after all.
> +	 */
> +	unsigned long irq_count;
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding device attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 965cd9527ff1..ed097056f944 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -990,6 +990,22 @@ struct drm_xe_vm_madvise {
>   	__u64 reserved[2];
>   };
>   
> +/* PMU event config IDs */
> +
> +/*
> + * Top 4 bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (60)
> +
> +#define ___XE_PMU_OTHER(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
> +
>   #if defined(__cplusplus)
>   }
>   #endif
