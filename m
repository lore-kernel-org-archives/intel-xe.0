Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142B7C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 19:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DF110E041;
	Thu, 25 May 2023 19:13:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FE310E041
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 19:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685041986; x=1716577986;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p8TDhPb8lzcIH0HL1WvlbRIdMEx4kHt3esE6cfraTAA=;
 b=OrA8nz/rsPzylg+S/tYmbL/vnIwwvo/vEw+2wefA309xMIttHQMwPryr
 2N6M+8WM6AFAcKld2+59L/h/tH7j6d0uQi53sMMBOv/w2AdKduNlU50Nv
 Lyus40iZMg+YmcH9A+8BtqMPkhm9//MG+aaj98gw+cEPDVtdQnTdCP3PD
 QdseciMCgITGipm5HAL2qTcT2SjTsz1gVn8P1mMIKUHOVKXj80c6jTPrZ
 1RdrHdSokPRHOdj5p58AbfHMGwAuhQ9DHAI1MN72LSyZIA+19n0m0hHdy
 lpjqrqj00i/abPl2I3HZVdUNLVOaBBZ9YCOpISRrEBxjl7oQFMf6LSCPy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356375710"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="356375710"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="655327419"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="655327419"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 25 May 2023 12:13:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 12:13:04 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 12:13:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 12:13:03 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 12:13:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgLiYrtc9aJ6Iq8YW/lcMP1mwpaJZlUbfwOm8gMZmuzia4AWhSd2dwRtxSwVvH63m8gwpnZJiQaHoG4Rv0CHrSEWg1d7mrWejes0Id+0Qayuib5LM9puqYO/nIY9O9PYmDBgZSK6bIegkK+hVxZys0ws7FFLbSV5p5pPL/aMbIXhBSIif9j+65hWXPAGiZ1RqcVAe9SMJtnl+3N4ehd5NKumojZjmMdBMgJstg0AkNt4lrQgUzfK4i8GdwpdvvyCldzm6GYvjF/qL/dZKipDT9eu2Jx2vMufivQkzO24OnNvkV17b8Odow7oi+QMLcSz6rMav8ulBgJ1qf5z9ocJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MZAwUgln+yJHwRuNeaEr6ac5TUlbYBtYnxeMLhzaCM=;
 b=aWhNSW1e998q7wyUIOTyedzwbqNbwahxGSWzXfEfFNTTT19aGh8I6ZZSTOvnMpXOsrbhxzCiTAFklxWWwMlu/Bf10CoR3CFscqR3aSBOafyEL5PdP+xtMWN59yjDuOjt2Ab+2ESRwA1NcdFoyJS2desRdfvJMxUKNEAmmDhr700hrxtv0jUQlcupGdUjopNUPXkeRD0WEhnH1FnFdtxIvWBcLa4Ta1ZtGQG40l+it1AKL0zlsEeg6OYaBsgoeuDiYNi3RSWCbUjXoBfYnOAQjd3UmcHuOKqAFIsepwRlhVyLfiA5thGG0JGh8AhzaQlbIw33oFyZ5q3o9+u2p8Ntiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 19:13:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 19:13:01 +0000
Date: Thu, 25 May 2023 12:12:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <kode54@gmail.com>
Message-ID: <3bpbea4zj7y2h66rn4vzb2vum5klwtbn2jtn5imlf2kov36zzf@knqmclpzpstx>
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
 <1918VR.US05UYXGP19H3@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1918VR.US05UYXGP19H3@gmail.com>
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: c2beab28-548d-4adf-53b2-08db5d540eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q2Gl8V5vpUqZEslKg/KajdNkEM/yvD6SC5cSrKFqA9j9Tu9Neq2y+eryNlik0aq3k9UEWqdSEdFcNlFeDwbaueCTf97xGZvCvYwcJ2b2rDlavRNreJJZQaYwdDieHw4vdxMZhULPJPBZi3Au4KV6nO8bY9pOwOrPXn6OpnidTiBhG7FrE3iiIFcCltr+shLqmHg9hmZ4qOn5jc4RVFEqejLD6yQEN8T1sgqaxMV8QN4m5WDodsnVqPy21X5HP2sIb01KJNXyOH8fEaTp70R4nE3lvpwVtIdbRju+rT/n8kcfEcoQW1B/KQje+tY4UUxNbQSebzh3ZjFWvuETonPFjW565K2jMy2OapYG/zowPI2tASgYYduUeFlnetcwqmRRnckPJayppOXqOdTh+X0BJlpQiScEYExloWoVZOtkq64Pn3Z98EqcVi3Vc6mpueLjG/g8zpRi8ms5Jih9wFAX+l+QcPDC6+rJn6u7CZkC3q17bcsrVU/6HZkSf5jYzCbyDF2+iYe13X13RSRMDRmaQstocSr4FGtWhrFx+bNQCTb9WWJb7uSQmm+HaYVH/tHSjObJP+FXpmzONpQsXcE0cK2GDg4nRXutsDYlJLSELjd8eJXNOXiCkCZqwNV3zssT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(38100700002)(33716001)(9686003)(6506007)(41300700001)(107886003)(6512007)(26005)(8676002)(8936002)(186003)(86362001)(4326008)(15650500001)(2906002)(478600001)(66556008)(6916009)(66476007)(66946007)(5660300002)(54906003)(316002)(83380400001)(6486002)(6666004)(82960400001)(27246005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0FmHYOWsqh5Eiyaz5XdvBX7PEqM3Uycnj2PQL2NFrxbijPv2cxFRlaQu5s?=
 =?iso-8859-1?Q?7iC7p3ix1anDXlv34jGIJMv1a+59EN6lqPigoeFFafwOAVApQDti59w5LR?=
 =?iso-8859-1?Q?DqsVBuWLz/i9MwMFxyfyQ84hiKPMtcUIm0nn2Pqva88Noc/5HqLtkZ3chJ?=
 =?iso-8859-1?Q?9jmaAOClkAbUc9Y/Y6nx5o09MO9g1HFB8pZPi2VJzOBGhJe2R0/2vm2OSa?=
 =?iso-8859-1?Q?VB8pPdjL0bpErWsjlKWT8oPugSiAyFbHov65ndDId0jVMyYW+inWc4Gep2?=
 =?iso-8859-1?Q?/AgavsOXbIPtJmQ6DX9reFeggZe5XN3KyC2b2efl3s7k4SQS8TWoprVjmP?=
 =?iso-8859-1?Q?a0AbphcXFdkdOXeSJ3bpAqrMf16ZQ52btCKKqA0l6PLTAv4429sqrhBXpj?=
 =?iso-8859-1?Q?706hMrfXN6Is43/l/9I8v/cR/F/axaVdf4BToAMqzIvVOFgZHi27P7At4o?=
 =?iso-8859-1?Q?lXVvdJezUY9753BrWuGiwgWMO+jM8MQI+vg2/ZlkyFSTSP2OGD8w644IY4?=
 =?iso-8859-1?Q?UK1ylawmTorSJ33pPdEI6mlIC9s0hxuTL7p0Mfie2PkvHJf772un7aBmP8?=
 =?iso-8859-1?Q?eYN4Mzh4gLfpwoySkKuIA2zSwmYSrvsAilOcMs3Vsy6gZ+naW8+5W1mvBe?=
 =?iso-8859-1?Q?MA5tEi2KvPekX9EjKoyFOeiQ3LBZ7GcPYO+2UDjRtW75lyaNRkCMwqXAE/?=
 =?iso-8859-1?Q?mXsaJjDG5wxhTtEmwOqB6vVdAnvvXWGqimdiBtnTWvdhcNwSB0Mw0tw6yK?=
 =?iso-8859-1?Q?B8O1JlEyWZ8DhTfzUOW/oZebnAB0NVAwE7XpAkytfcbUc4/4tZl/FOW3oO?=
 =?iso-8859-1?Q?Lw1GsWZZpuu/y+M4it16282BpZEkZfAq1SfqsPa/3jNOrlZCi9zR1N6JZm?=
 =?iso-8859-1?Q?j3VjE+Yhq8GXlyn1RC7K+TAqCRSIGISk35tAehyyaXszsRpgII3h2Ci/0n?=
 =?iso-8859-1?Q?9HqMzBoKPEvjGE6ZVtC8KrJgzcJCgpbZLIm8H8ujksqjfOTIDLlnW8P2cj?=
 =?iso-8859-1?Q?9SJEpQgZzlLjnxlmWE/0ecSWNh6YCldMDaYRS/daZGRj4iOy1LwcAgr8Xs?=
 =?iso-8859-1?Q?SyKbIyxXfUFBdYugYF/MGbknffGaZHXDaJgUHdq2UJmv4JV8AarjD9l/9C?=
 =?iso-8859-1?Q?ORMFEJRA/bUwSGi/VkniTVPnUhG6WhVSPiChz6/4gmM1kGgePbsQdKyrw8?=
 =?iso-8859-1?Q?Ub44XYZmAKU0H6eBO2WuKjueIA7raQR6D6qEzzQjsKj8KtGFpORpOid2Vz?=
 =?iso-8859-1?Q?xDSoDf0P7O6d1BL59R7wdYvmAKIPLjICZnl/2l2TeVE4sfeHAaNNwwFHyN?=
 =?iso-8859-1?Q?VmTEstgvkDkIcIlXfM3RKpZHDOUg/2jsTp10cMNIxGnhqWiVbINjvmAoYJ?=
 =?iso-8859-1?Q?1cHOX4K/GxEjCUoIEdgXkt/L0UZ9ymxpsr76chRZDQ80ipdF8xeGd4rl7n?=
 =?iso-8859-1?Q?wUXI11Fq6EOPzMUZGNo25pW2mcpoxXTfg9sCx13R0yEJgGf/4M6ArlFq+4?=
 =?iso-8859-1?Q?NzN6n75AitZSEEuqBLFw7N1uzI9DPsusv8/uQfpZm1xj07L39WO+XozxPn?=
 =?iso-8859-1?Q?TjSNqxonrQJmVDAql2OTri8Z5DjPT7C9BdEWbpBdFYLtO/Xz0QKEbRwHql?=
 =?iso-8859-1?Q?kdE1ThZabK+Iku1bk5ZLPb9otMgPb10YA6b7nTidMIP4oDRNthPiT8vg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2beab28-548d-4adf-53b2-08db5d540eb3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:13:01.0423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmY0v8kvivf5wLqyfe/kM5KMsIIMgzKIQaJG+tJ7LMDITnZ67mVb0YmkE8w2gTxNeFcwdYgergQyK7lJOCH+PcKsHPeV5bbzrhsKmPBRRuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Yu, Effie" <effie.yu@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 08:48:37AM -0700, kode54@gmail.com wrote:
>
>
>On Thu, May 25 2023 at 08:13:43 AM -07:00:00, Lucas De Marchi 
><lucas.demarchi@intel.com> wrote:
>>On Thu, May 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
>>>Hi
>>>
>>>Planning to push this today,
>>>Christopher already have sent the Mesa MR and IGT patch series.
>>
>>the whole point of this series is being able to fix it without 
>>having to
>>synchronize with the mesa / media / igt / intel-compute updates. There
>>are some reordering in the structs that would better be done before
>>applying upstream and when that is done, then we need to sync all the
>>UMDs. But not for this.
>
>Unfortunately, all userspace software which is also built for multilib 
>must synchronize with this change, or else their 32-bit userspace will 
>simply fail. In my experience, apps consuming Mesa 32-bit without this 
>change will fail spectacularly, often crashing on startup.
>
>I suppose only Mesa really matters, since most users won't be 
>installing proprietary software that consumes 32-bit OpenCL or VA-API, 
>but there may yet be cases for that. This is usually proprietary 
>software, often involving use of Wine, such as Steam's Proton 
>distribution.

yes, but 32bit was never properly supported before this patch. So if
they don't synchronize, they will continue in the current state of
not working at all.

And I'd still try to pack the structs properly before having the
definite uapi in place, which only happens when this all is merged
upstream, which is *THE* most important synchronization point.
I also sync'ed with Jose to clarify on that.

I'm about to push it, but since it's your patch I'd rather let you
confirm you are ok with it first.

thanks
Lucas De Marchi

>
>>
>>Lucas De Marchi
>>
>>>It should not break 64 bits ABI but would be good to update 
>>>intel-compute and media as well.
>>>
>>>On Wed, 2023-05-24 at 18:56 -0700, Christopher Snowhill wrote:
>>>>This series takes off from mlankhorst's attempt to do the same, 
>>>>except
>>>>instead, it tries to be as minimally invasive to the original 
>>>>uAPI as
>>>>possible, by only inserting padding where appropriate to ensure all
>>>>32-bit members are 32-bit aligned, and all 64-bit members are 64-bit
>>>>aligned. This should have zero effect on 64-bit hosts versus 64-bit
>>>>userspace, so existing native software will operate the same with or
>>>>without the update. The only real change is 32-bit compat 
>>>>support for
>>>>multilib userspace, which was previously broken.
>>>>
>>>>Also introduces field validation against all of the padding and
>>>>reserved fields, which must be zero, in a separate commit.
>>>>
>>>>v2:
>>>>  Removed extensions checks where there were none originally. 
>>>>(José)
>>>>  Moved extraneous parentheses to the correct places. (Lucas)
>>>>
>>>>Signed-off-by: Maarten Lankhorst 
>>>><maarten.lankhorst@linux.intel.com 
>>>><mailto:maarten.lankhorst@linux.intel.com>>
>>>>Signed-off-by: Christopher Snowhill <kode54@gmail.com 
>>>><mailto:kode54@gmail.com>>
>>>>
>>>>Christopher Snowhill (2):
>>>>  drm/xe: Add explicit padding to uAPI definition
>>>>  drm/xe: Validate uAPI padding and reserved fields
>>>>
>>>> drivers/gpu/drm/xe/xe_bo.c              |  6 +++--
>>>> drivers/gpu/drm/xe/xe_engine.c          | 18 ++++++++++---
>>>> drivers/gpu/drm/xe/xe_exec.c            |  4 ++-
>>>> drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
>>>> drivers/gpu/drm/xe/xe_query.c           |  3 ++-
>>>> drivers/gpu/drm/xe/xe_sync.c            |  4 ++-
>>>> drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++---
>>>> drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 ++-
>>>> drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
>>>> include/uapi/drm/xe_drm.h               | 34 
>>>>++++++++++++++++++++++++-
>>>> 10 files changed, 85 insertions(+), 16 deletions(-)
>>>>
>>>
>
