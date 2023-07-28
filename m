Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21857C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jul 2023 14:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E6F10E70B;
	Fri, 28 Jul 2023 14:55:46 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF40B10E70B
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jul 2023 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690556144; x=1722092144;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L1cofC06MzRyAPOZQJxTjw0LKhMCykpR1ronB3WFOPg=;
 b=h74A6XfL4ppQ3ukvckmKkZCl1Ww6CuZy6smNSSCvXfbDR98D9zcxbDTU
 KskmI/BItPmhchvc51u/rqdG0gVyyAIsG4dfGze4KgO1k3IH1FZCwCs24
 MZLOJs7830YIlH8anbsswz9rrH9Od3PWb+WMaU5WpK/ZqznNhPPG5bM2C
 6voXuj1UiHzKrV6ojw91sva11NM/pm08pdVI1Ziuy5E1O21oElmYNWzXJ
 M6VilEiv0bmNJ+5Ky5efafhfVsNeFrmiK96wiu94NsAbsOdC3qzUHAOAB
 iWVqjGIzY8TCzh4a7yR57rNDFXgy5rYgwKxsfw6o3BneNKm7FklePWWa2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434893707"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="434893707"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2023 07:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="762636885"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; d="scan'208";a="762636885"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 28 Jul 2023 07:53:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:53:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 28 Jul 2023 07:53:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 28 Jul 2023 07:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpVcN0y+T5bSVkCEjRNqWhClpF5yb/dLtv7OuNflIpSu/L1+KZGiEPI+L4aAQ2A3Rbl8VOW/GKm7LxwIImWXMwHlYdcjB+OLp6Nr9nma3pvDyGtoS0fxgZ8/wMWDAjY/kDt4EPGo7qTRSUrFb/Cko5pe4RnY7VWt4rNtBdxFl/WX/bhPV4LYgkbUq1jvy2cb4XG4dZZBLX4JDX4pFDyG+/q6DJRWugdp28IJarbWI/ZI78YZF5KF34ChguEG/HiQgROoeqBeppYYQVdDwlzCzcPgECsV3lURa84D9Q8+8BPeHf/eKU+66m+E0EFLeXoVm6A5LVcT0Zz4vsOJlbBG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQj5tlDi/8aKtQcC2cV1anJMH01BoDahyNKMqS0fxPo=;
 b=FGPuwaWqckfNbuYUj1lKQUY2tdMranb7xJn/PG+j2VrfI0IPfKte2yotPpZG9mYKR0dlatkBWILBKgtmEZW++ra75Yb5RrCJQrBSgcwTPGoNxIxu1IivlW2m/+HqH6ffG44tNt2DiRsAdJozU/T2QXVE2vjoTZmfEoKOOlUCZarwmm57fsJqZc67v40sz+JkHXsV1YxmIyavMAFIK1HrPPlMIbkAdfS9MVJO26uq9Ycxf7p2J3xumZ+TC0oM29Mp3sx0+8hBzkwmCPvhAUobxmJ9Mx8aPphgiEJO5U31HVV/6vf6FkQojncUl/7S8l/Zo5kM59X/kxNHkaEeqjAZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 14:53:27 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::fe5e:ee9:8806:c9fa%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 14:53:27 +0000
Date: Fri, 28 Jul 2023 07:53:20 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Message-ID: <ZMPWYGLgFuckFR8x@nvishwa1-DESK>
References: <20230727082235.905240-1-tejas.upadhyay@intel.com>
 <20230727082235.905240-7-tejas.upadhyay@intel.com>
 <ZMKMuWeQBXsSo2Sb@DUT025-TGLU.fm.intel.com>
 <ZMNHp1f+wwyd9ZTB@nvishwa1-DESK>
 <ZMNMdIXaJrm4RKGJ@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62041E3422EBC2A5D9ABC05C8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZMNfY83ZteSxWk3w@nvishwa1-DESK>
 <SJ1PR11MB62044364227D86A702DE966F8106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZMPPgsfu+W2HzRcF@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62044D599FEFC3B5E5F7D1F28106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62044D599FEFC3B5E5F7D1F28106A@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d85f9c3-b0c9-4bb5-3d80-08db8f7a66a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cW7dKvwXZrcz39AE9e82QpjBD6mGMhRKJsdyGzs06IxKq8SwXegYp1qN8FnpkuPoukCukYPLAgMCb4wDM40OgvRXiiUEc0uQaoBAQtTGTo6XNBRKF3qCnDeCjwedCCUryYel5EqtCJOW7U7rifZIVsPDkltw7CPO0XGYsF8pFal92E7cdGVWsJpU2b5hF8n6xpxJPnG7qPqsRFbq9tiju1pLMl1I4Jkx/7sP6yvglRNiuU9R+UcDuev2Fs0ZbuZtvCf2xFpffEv7jNrl+42dxYaXpMFFDNLezkC6e8mAduQUws+Uhld9AK54kIy7PTAyD9i4jAFS3Tp6Y4ITXQsUSJYN4c3xEsK8M289rQvochcjGpfZFH6nTkfQcOOqmNjBOfZQJZyZEnZYbq5T9m93CHfGfemEpDVVWReEWcvhn6CvP9qKeon4cXbQ3KHFqsmKRrf1xiTeVwG0LfSYzuV9GHo65pxj9Pjk/HxeWleU/IBGOh0POMjGHbQ2llIiZKBL8+q0Kgyc5f+BVD2FBYio4oo3VeErAdCm/v7fib5IsoKpVmNisZ14bHrT0MBPZO6s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(26005)(83380400001)(53546011)(33716001)(5660300002)(8936002)(6862004)(8676002)(186003)(86362001)(6506007)(41300700001)(6512007)(9686003)(478600001)(6666004)(82960400001)(316002)(6486002)(2906002)(19627235002)(54906003)(38100700002)(30864003)(66476007)(44832011)(4326008)(66556008)(66946007)(6636002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z9/3zHeiOAJsREORdy3aEwzYcR4lnqJN3WAN6W28ANy68GGuio8ms2FoYpNo?=
 =?us-ascii?Q?owrU/atJkrEGfGjhIkVxPOOqGH9mva1X0m1F3o7wRAy+SZZUp9i9P1+Z7wlq?=
 =?us-ascii?Q?0cHqnBPP1TeB5+9DPK63pgq4eXodDAE+hvlZkysOEON4J/b+hFNttxn721AM?=
 =?us-ascii?Q?EYU/JURjFwLxrvwxx5yPErWeNuTwu7fk2pCyZtQArTAcUISkn+x6NYTCVIDU?=
 =?us-ascii?Q?C1FSln8X7OnI/d5oeLCMl0g0MVZoeQ33yk5ZKvk8LijAmvhnRGRXa+V65nDC?=
 =?us-ascii?Q?qD/mhnXNxEhpV2cO2poDUNYK+0+0kvM8hX3lobBUC/4m7+9a3p15z4uG0VdD?=
 =?us-ascii?Q?Xb+hdQyGbLUMn+nS8mmlXSPu514yXLoKNdv5J3uPCpMo/SUapyknKW6a7a+Q?=
 =?us-ascii?Q?WyQTqX8N6WJhR6CAsEp7Yr6EwF8uS+kWaGuGUwhNkkvQkXgVsm3EHeaikV71?=
 =?us-ascii?Q?DsMH/0e4Eb6aKs8K5QPkUgPsmquYm70U7gkLFuhohuH9JAjhkr0qeQ472QQh?=
 =?us-ascii?Q?R4M56hmNNpEjRg4gzm4UBOEWqoq0OLolqsXy4/v0aP3etYhWugKSeGHXCIXP?=
 =?us-ascii?Q?Nu6uwBR5OiQaUdryDrSdXPD1KFpY3UArxZD/fwngkWuqlcSqPPBBStGd5F+e?=
 =?us-ascii?Q?4L0AwEHhknzb9IeS3ku2w+IAHyccZxcsWazqNFzSbMP3/0oh1MV3esgMAFWS?=
 =?us-ascii?Q?+7yzZPdFtZMXyZhWWCDFlh+0TrzsDcfE+p4HX/Bt8IUqQ7DXTRKAA4B47yHQ?=
 =?us-ascii?Q?nlVK4r98mfWTILkJvFDfu/QYLkuLHDTBUHEfSCrGNmCNDz7GSybN4Qf9IeNj?=
 =?us-ascii?Q?MhPzkxittBX1uL4msh56oSfA0n7ZIb649tLUxIr/ai5G4y+dFpCnHxHBvO6E?=
 =?us-ascii?Q?Owhbif3L6Dc0YkhoNlZwavoa9GGSwQJaY6YyUOE1AyUG/rBfi8Roz5tsj0QE?=
 =?us-ascii?Q?BQItf2k2l1AiTEP8nD6ts0117NNptwYecMEN8SROu9nNWQQoBsyr6HKbSUsO?=
 =?us-ascii?Q?jpHHiThXkgow7nBzVWUt4uiN7Dt6QYZR7CLby1Nk4yj9FSs+tcNvEcbZ0jam?=
 =?us-ascii?Q?sKUwtWyx+q2VjMP0hxjW0YH6v4dhJ5CjDjTuOkeKjN7D5gWGafpeku9QmYdZ?=
 =?us-ascii?Q?A7KcQJF/th9DpPOxZg8BZja45aBXQIm/Ix+A3i/QWN3xcXWh/nwBgPA8g+WU?=
 =?us-ascii?Q?J/BPdtngCfFkl9CDh++/MYhnAbvd87rwUMBlfAMjHgjc4qtEGu/rcAMObXzk?=
 =?us-ascii?Q?6WBfES2R/wcHTEvzhi+wLymKd5SL3zh7Ph3zMNawac7Jan0aDf8DjzVxeXJr?=
 =?us-ascii?Q?Uwxx/vXf3g6INh4qzQ4BLW8Qk4ekyMaj/eGKmkpgmeuFZaZPcdpDWEu5/SJN?=
 =?us-ascii?Q?Rp0+s3vhE4tuM9z+yAE2DG0YfaZMqGgOB7HGRKxmHwO1p7AZFhmoFuChGLIe?=
 =?us-ascii?Q?hd9bDOkVx7t/Y8tYBM3n2Qvo3B7v+koNLzc8aFCJugSQpuf3vzADYQnQ8sQa?=
 =?us-ascii?Q?jS8bbP469rwtRV7ut6VaDWPPRL46oEU8UrHp57G6W8Ju5vJ8JIfD5wn2fu72?=
 =?us-ascii?Q?YrCGwG80+J1W5UJ7Nd9Qb4AIgf9T9Zhe3qnKqzT6gFVdzM9CB9hlVUe5sRtW?=
 =?us-ascii?Q?/qKCKhRJ0VNX49ZKTZxgdCA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d85f9c3-b0c9-4bb5-3d80-08db8f7a66a2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 14:53:27.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWA+qtfncVosd0b6DmA42US0A/KiDuedXy8Y49cP3U2XumiiZLdu2weyqgQAZux5rPE3bMTp6mUn3WyQfv4arlo78Dg0HKivYJXSK/Ien5MXQMtR3S57I5+7mS3TFI/C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V9 6/6] drm/xe: Add min/max cap for engine
 scheduler properties
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 07:27:35AM -0700, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: Friday, July 28, 2023 7:54 PM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
>> intel-xe@lists.freedesktop.org
>> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine scheduler
>> properties
>>
>> On Fri, Jul 28, 2023 at 01:36:29AM -0600, Upadhyay, Tejas wrote:
>> >
>> >
>> > > -----Original Message-----
>> > > From: Vishwanathapura, Niranjana
>> > > <niranjana.vishwanathapura@intel.com>
>> > > Sent: Friday, July 28, 2023 11:56 AM
>> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> > > Cc: Brost, Matthew <matthew.brost@intel.com>; intel-
>> > > xe@lists.freedesktop.org
>> > > Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine
>> > > scheduler properties
>> > >
>> > > On Thu, Jul 27, 2023 at 10:54:42PM -0700, Upadhyay, Tejas wrote:
>> > > >
>> > > >
>> > > >> -----Original Message-----
>> > > >> From: Brost, Matthew <matthew.brost@intel.com>
>> > > >> Sent: Friday, July 28, 2023 10:35 AM
>> > > >> To: Vishwanathapura, Niranjana
>> > > <niranjana.vishwanathapura@intel.com>
>> > > >> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> > > >> xe@lists.freedesktop.org
>> > > >> Subject: Re: [PATCH V9 6/6] drm/xe: Add min/max cap for engine
>> > > >> scheduler properties
>> > > >>
>> > > >> On Thu, Jul 27, 2023 at 09:44:23PM -0700, Niranjana
>> > > >> Vishwanathapura
>> > > >> wrote:
>> > > >> > On Thu, Jul 27, 2023 at 03:26:49PM +0000, Matthew Brost wrote:
>> > > >> > > On Thu, Jul 27, 2023 at 01:52:35PM +0530, Tejas Upadhyay wrote:
>> > > >> > > > Add sysfs entries for the min, max, and defaults for each
>> > > >> > > > of engine scheduler controls for every hardware engine class.
>> > > >> > > >
>> > > >> > > > Non-elevated user IOCTLs to set these controls must be
>> > > >> > > > within the min-max ranges of the sysfs entries, elevated
>> > > >> > > > user can set these controls to any value. However,
>> > > >> > > > introduced compile time CONFIG min-max values which
>> > > >> > > > restricts elevated user to be in compile time min-max range if at
>> all sysfs min/max are violated.
>> > > >> > > >
>> > > >> > > > Sysfs entries examples are, DUT# cat
>> > > /sys/class/drm/cardX/device/tileN/gtN/engines/ccs/.defaults/
>> > > >> > > > job_timeout_max         job_timeout_ms
>> preempt_timeout_min
>> > > >> timeslice_duration_max  timeslice_duration_us
>> > > >> > > > job_timeout_min         preempt_timeout_max
>> > > preempt_timeout_us
>> > > >> timeslice_duration_min
>> > > >> > > >
>> > > >> > > > DUT# cat /sys/class/drm/card1/device/tileN/gtN/engines/ccs/
>> > > >> > > > .defaults/              job_timeout_min         preempt_timeout_max
>> > > >> preempt_timeout_us      timeslice_duration_min
>> > > >> > > > job_timeout_max         job_timeout_ms
>> preempt_timeout_min
>> > > >> timeslice_duration_max  timeslice_duration_us
>> > > >> > > >
>> > > >> > > > V9 :
>> > > >> > > >    - Rebase to use s/xe_engine/xe_hw_engine/ - Matt
>> > > >> > > > V8 :
>> > > >> > > >    - fix enforce_sched_limit and avoid code duplication - Niranjana
>> > > >> > > >    - Make sure min < max - Niranjana
>> > > >> > > > V7 :
>> > > >> > > >    - Rebase to replace hw engine with eclass interface
>> > > >> > > >    - return EINVAL in place of EPERM
>> > > >> > > >    - Use some APIs to avoid code duplication
>> > > >> > > > V6 :
>> > > >> > > >    - Rebase changes to reflect per engine class props interface -
>> MattB
>> > > >> > > >    - Use #if ENABLED - MattB
>> > > >> > > >    - Remove MAX_SCHED_TIMEOUT check as range validation is
>> > > >> > > > enough
>> > > >> > > > V5 :
>> > > >> > > >    - Rebase to resolve conflicts - CI
>> > > >> > > > V4 :
>> > > >> > > >    - Rebase
>> > > >> > > >    - Update commit to reflect tile addition
>> > > >> > > >    - Use XE_HW macro directly as they are already filtered
>> > > >> > > >      for CONFIG checks - Niranjana
>> > > >> > > >    - Add CONFIG for enable/disable min/max limitation
>> > > >> > > >      on elevated user. Default is enable - Matt/Joonas
>> > > >> > > > V3 :
>> > > >> > > >    - Resolve CI hooks warning for kernel-doc
>> > > >> > > > V2 :
>> > > >> > > >    - Restric min/max setting to #define default min/max for
>> > > >> > > >      elevated user - Himal
>> > > >> > > >    - Remove unrelated changes from patch - Niranjana
>> > > >> > > >
>> > > >> > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > > >> > > > ---
>> > > >> > > >  drivers/gpu/drm/xe/Kconfig                    |   6 +
>> > > >> > > >  drivers/gpu/drm/xe/Kconfig.profile            |  46 +++
>> > > >> > > >  drivers/gpu/drm/xe/xe_engine.c                |  25 +-
>> > > >> > > >  drivers/gpu/drm/xe/xe_hw_engine.c             |   8 +
>> > > >> > > >  drivers/gpu/drm/xe/xe_hw_engine.h             |  31 ++
>> > > >> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 354
>> > > >> ++++++++++++++++++
>> > > >> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |   2 +
>> > > >> > > >  7 files changed, 466 insertions(+), 6 deletions(-)  create
>> > > >> > > > mode
>> > > >> > > > 100644 drivers/gpu/drm/xe/Kconfig.profile
>> > > >> > > >
>> > > >> > > > diff --git a/drivers/gpu/drm/xe/Kconfig
>> > > >> > > > b/drivers/gpu/drm/xe/Kconfig index
>> > > >> > > > d44794f99338..0a4ea965645b
>> > > >> > > > 100644
>> > > >> > > > --- a/drivers/gpu/drm/xe/Kconfig
>> > > >> > > > +++ b/drivers/gpu/drm/xe/Kconfig
>> > > >> > > > @@ -83,3 +83,9 @@ depends on DRM_XE  depends on EXPERT
>> > > source
>> > > >> > > > "drivers/gpu/drm/xe/Kconfig.debug"
>> > > >> > > >  endmenu
>> > > >> > > > +
>> > > >> > > > +menu "drm/xe Profile Guided Optimisation"
>> > > >> > > > +	visible if EXPERT
>> > > >> > > > +	depends on DRM_XE
>> > > >> > > > +	source "drivers/gpu/drm/xe/Kconfig.profile"
>> > > >> > > > +endmenu
>> > > >> > > > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
>> > > >> > > > b/drivers/gpu/drm/xe/Kconfig.profile
>> > > >> > > > new file mode 100644
>> > > >> > > > index 000000000000..e72f15ec4bf6
>> > > >> > > > --- /dev/null
>> > > >> > > > +++ b/drivers/gpu/drm/xe/Kconfig.profile
>> > > >> > > > @@ -0,0 +1,46 @@
>> > > >> > > > +config DRM_XE_JOB_TIMEOUT_MAX
>> > > >> > > > +       int "Default max job timeout (ms)"
>> > > >> > > > +       default 10000 # milliseconds
>> > > >> > > > +       help
>> > > >> > > > +         Configures the default max job timeout after which job will
>> > > >> > > > +         be forcefully taken away from scheduler.
>> > > >> > > > +config DRM_XE_JOB_TIMEOUT_MIN
>> > > >> > > > +       int "Default max job timeout (ms)"
>> > > >> > > > +       default 1 # milliseconds
>> > > >> > > > +       help
>> > > >> > > > +         Configures the default min job timeout after which job will
>> > > >> > > > +         be forcefully taken away from scheduler.
>> > > >> > > > +config DRM_XE_TIMESLICE_MAX
>> > > >> > > > +       int "Default max timeslice duration (us)"
>> > > >> > > > +       default 10000000 # microseconds
>> > > >> > > > +       help
>> > > >> > > > +         Configures the default max timeslice duration
>> > > >> > > > +between
>> > > multiple
>> > > >> > > > +         contexts by guc scheduling.
>> > > >> > > > +config DRM_XE_TIMESLICE_MIN
>> > > >> > > > +       int "Default min timeslice duration (us)"
>> > > >> > > > +       default 1 # microseconds
>> > > >> > > > +       help
>> > > >> > > > +         Configures the default min timeslice duration
>> > > >> > > > +between
>> > > multiple
>> > > >> > > > +         contexts by guc scheduling.
>> > > >> > > > +config DRM_XE_PREEMPT_TIMEOUT_MAX
>> > > >> > > > +       int "Default max  preempt timeout (us)"
>> > > >> > > > +       default 10000000 # microseconds
>> > > >> > > > +       help
>> > > >> > > > +         Configures the default max preempt timeout after
>> > > >> > > > +which
>> > > context
>> > > >> > > > +         will be forcefully taken away and higher priority context
>> will
>> > > >> > > > +         run.
>> > > >> > > > +config DRM_XE_PREEMPT_TIMEOUT_MIN
>> > > >> > > > +       int "Default min  preempt timeout (us)"
>> > > >> > > > +       default 1 # microseconds
>> > > >> > > > +       help
>> > > >> > > > +         Configures the default min preempt timeout after
>> > > >> > > > +which
>> > > context
>> > > >> > > > +         will be forcefully taken away and higher priority context
>> will
>> > > >> > > > +         run.
>> > > >> > > > +config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
>> > > >> > > > +       bool "Default configuration of limitation on scheduler
>> timeout"
>> > > >> > > > +       default y
>> > > >> > > > +       help
>> > > >> > > > +	 Configures the enablement of limitation on scheduler
>> > > timeout
>> > > >> > > > +	 to apply to applicable user. For elevated user, all above MIN
>> > > >> > > > +	 and MAX values will apply when this configuration is
>> > > >> > > > +enable
>> > > to
>> > > >> > > > +	 apply limitation. By default limitation is applied.
>> > > >> > > > diff --git a/drivers/gpu/drm/xe/xe_engine.c
>> > > >> > > > b/drivers/gpu/drm/xe/xe_engine.c index
>> > > >> > > > 9e167b113963..d934196eb79f
>> > > >> > > > 100644
>> > > >> > > > --- a/drivers/gpu/drm/xe/xe_engine.c
>> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_engine.c
>> > > >> > > > @@ -13,6 +13,7 @@
>> > > >> > > >
>> > > >> > > >  #include "xe_device.h"
>> > > >> > > >  #include "xe_gt.h"
>> > > >> > > > +#include "xe_hw_engine_class_sysfs.h"
>> > > >> > > >  #include "xe_hw_fence.h"
>> > > >> > > >  #include "xe_lrc.h"
>> > > >> > > >  #include "xe_macros.h"
>> > > >> > > > @@ -191,8 +192,12 @@ static int engine_set_priority(struct
>> > > >> > > > xe_device *xe, struct xe_engine *e,  static int
>> > > >> engine_set_timeslice(struct xe_device *xe, struct xe_engine *e,
>> > > >> > > >  				u64 value, bool create)  {
>> > > >> > > > -	if (!capable(CAP_SYS_NICE))
>> > > >> > > > -		return -EPERM;
>> > > >> > > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
>> > > >> > > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
>> > > >> > >
>> > > >> > > So I screwed this up in my last comment, sorry.
>> > > >> > >
>> > > >> > > min = cap_nice ? KConfig option for min :
>> > > >> > > e->hwe->eclass->sched_props.timeslice_min;
>> > > >> > > same logic for max;
>> > > >> > >
>> > > >> > > Probably add helper for this.
>> > > >> > >
>> > > >> > > > +
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(value, min, max))
>> > > >> > >
>> > > >> > > Then I think logic works too...
>> > > >> > >
>> > > >> > > if cap nice && !Kconfig option to enfore limits
>> > > >> > > (enforce_schedule_limit
>> > > >> returns false):
>> > > >> > > 	user can do whatever
>> > > >> > > else if cap nice
>> > > >> > > 	user within Kconfig range
>> > > >> > > else
>> > > >> > > 	user within sysfs range
>> > > >> > >
>> > > >> > > This is what we want in the end.
>> > > >> > >
>> > > >> >
>> > > >> > Matt, I think this is exactly what the previous revision of the
>> > > >> > patch was
>> > > >> doing.
>> > > >> >
>> > > >>
>> > > >> No... Previous version
>> > > >>
>> > > >> min = Kconfig option to enfore limits ? KConfig option for min :
>> > > >> e->hwe-
>> > > >> >eclass->sched_props.timeslice_min
>> > > >> same for max
>> > > >>
>> > > >> Results in:
>> > > >>
>> > > >> if cap nice && !Kconfig option to enfore limits
>> > > >> (enforce_schedule_limit returns false):
>> > > >> 	user can do whatever
>> > > >> else if cap_nice || Kconfig option to enfore limit
>> > > >> 	user within Kconfig range
>> > > >> else
>> > > >>  	user within sysfs range
>> > > >>
>> > > >> !cap_nice && Kconfig option to enfore limits == user within
>> > > >> Kconfig range
>> > > >> (previously) !cap_nice && Kconfig option to enfore limits == user
>> > > >> within sysfs range (my suggestion)
>> > > >
>> > > >In previous version we can achieve it by just adding one below check
>> right?
>> > > >#if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT) &&
>> > > cap_nice
>> > > >+       u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
>> > > >+       u32 max = XE_HW_ENGINE_TIMESLICE_MAX; #else
>> > > >+       u32 min = e->hwe->eclass->sched_props.timeslice_min;
>> > > >+       u32 max = e->hwe->eclass->sched_props.timeslice_max;
>> > > >+#endif
>> > > >
>> > > >Please let me know!
>> > > >
>> > >
>> > > Ah I see. Yah, it is a limits selection issue.
>> > > We can do,
>> > >
>> > > u32 min = e->hwe->eclass->sched_props.timeslice_min;
>> > > u32 max = e->hwe->eclass->sched_props.timeslice_max;
>> > >
>> > > #if IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > >          if (cap_nice) {
>> > >                  u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
>> > >                  u32 max = XE_HW_ENGINE_TIMESLICE_MAX;
>> > >          }
>> > > #endif
>> > >
>> > > Matt, Tejas
>> > > Also, looks like you missed my another comment below.
>> > >
>> > > Niranjana
>> > >
>> > > >>
>> > > >> The logic is different and I believe we want what I'm suggesting.
>> > > >>
>> > > >> Matt
>> > > >>
>> > > >> > > > +		return -EINVAL;
>> > > >> > > >
>> > > >> > > >  	return e->ops->set_timeslice(e, value);  } @@ -201,8
>> > > >> > > > +206,12 @@ static int engine_set_preemption_timeout(struct
>> xe_device *xe,
>> > > >> > > >  					 struct xe_engine *e, u64
>> > > value,
>> > > >> > > >  					 bool create)
>> > > >> > > >  {
>> > > >> > > > -	if (!capable(CAP_SYS_NICE))
>> > > >> > > > -		return -EPERM;
>> > > >> > > > +	u32 min = e->hwe->eclass-
>> > > >sched_props.preempt_timeout_min;
>> > > >> > > > +	u32 max = e->hwe->eclass-
>> > > >sched_props.preempt_timeout_max;
>> > > >> > > > +
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(value, min, max))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > >
>> > > >> > > >  	return e->ops->set_preempt_timeout(e, value);  } @@ -
>> > > 266,11
>> > > >> > > > +275,15 @@ static int engine_set_persistence(struct
>> > > >> > > > +xe_device *xe,
>> > > >> > > > struct xe_engine *e,  static int
>> > > >> > > > engine_set_job_timeout(struct xe_device
>> > > >> *xe, struct xe_engine *e,
>> > > >> > > >  				  u64 value, bool create)  {
>> > > >> > > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
>> > > >> > > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
>> > > >> > > > +
>> > > >> > > >  	if (XE_IOCTL_DBG(xe, !create))
>> > > >> > > >  		return -EINVAL;
>> > > >> > > >
>> > > >> > > > -	if (!capable(CAP_SYS_NICE))
>> > > >> > > > -		return -EPERM;
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(value, min, max))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > >
>> > > >> > > >  	return e->ops->set_job_timeout(e, value);  } diff --git
>> > > >> > > > a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > >> > > > index afa7d25c3852..e601bffe3b13 100644
>> > > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> > > >> > > > @@ -364,8 +364,16 @@ static void
>> > > >> > > > hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine
>> > > >> > > > *hwe,
>> > > >> > > >
>> > > >> > > >  	if (!gt->eclass[hwe->class].sched_props.job_timeout_ms) {
>> > > >> > > >  		gt->eclass[hwe->class].sched_props.job_timeout_ms
>> > > = HZ *
>> > > >> 5;
>> > > >> > > > +		gt->eclass[hwe-
>> > > >class].sched_props.job_timeout_min =
>> > > >> XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>> > > >> > > > +		gt->eclass[hwe-
>> > > >class].sched_props.job_timeout_max =
>> > > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX;
>> > > >> > > >  		gt->eclass[hwe->class].sched_props.timeslice_us = 1
>> > > * 1000;
>> > > >> > > > +		gt->eclass[hwe->class].sched_props.timeslice_min =
>> > > >> XE_HW_ENGINE_TIMESLICE_MIN;
>> > > >> > > > +		gt->eclass[hwe->class].sched_props.timeslice_max =
>> > > >> > > > +XE_HW_ENGINE_TIMESLICE_MAX;
>> > > >> > > >  		gt->eclass[hwe-
>> > > >class].sched_props.preempt_timeout_us =
>> > > >> 640 *
>> > > >> > > > 1000;
>> > > >> > > > +		gt->eclass[hwe-
>> > > >class].sched_props.preempt_timeout_min =
>> > > >> > > > +
>> > > >> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>> > > >> > > > +		gt->eclass[hwe-
>> > > >class].sched_props.preempt_timeout_max =
>> > > >> > > > +
>> > > >> 	XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
>> > > >> > > >  		/* Record default props */
>> > > >> > > >  		gt->eclass[hwe->class].defaults = gt->eclass[hwe-
>> > > >> >class].sched_props;
>> > > >> > > >  	}
>> > > >> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > >> > > > index 7eca9d53c7b1..3d37d6d44261 100644
>> > > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> > > >> > > > @@ -10,6 +10,37 @@
>> > > >> > > >
>> > > >> > > >  struct drm_printer;
>> > > >> > > >
>> > > >> > > > +#ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN #define
>> > > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MIN
>> > > >> CONFIG_DRM_XE_JOB_TIMEOUT_MIN #else
>> > > >> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MIN 1 #endif #ifdef
>> > > >> > > > +CONFIG_DRM_XE_JOB_TIMEOUT_MAX #define
>> > > >> > > > +XE_HW_ENGINE_JOB_TIMEOUT_MAX
>> > > >> CONFIG_DRM_XE_JOB_TIMEOUT_MAX #else
>> > > >> > > > +#define XE_HW_ENGINE_JOB_TIMEOUT_MAX (10 * 1000)
>> #endif
>> > > #ifdef
>> > > >> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #define
>> > > >> XE_HW_ENGINE_TIMESLICE_MIN
>> > > >> > > > +CONFIG_DRM_XE_TIMESLICE_MIN #else #define
>> > > >> > > > +XE_HW_ENGINE_TIMESLICE_MIN 1 #endif #ifdef
>> > > >> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #define
>> > > >> XE_HW_ENGINE_TIMESLICE_MAX
>> > > >> > > > +CONFIG_DRM_XE_TIMESLICE_MAX #else #define
>> > > >> > > > +XE_HW_ENGINE_TIMESLICE_MAX (10 * 1000 * 1000) #endif
>> > > >> > > > +#ifdef CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #define
>> > > >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN
>> > > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MIN #else #define
>> > > >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN 1 #endif #ifdef
>> > > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX
>> > > >> > > > +#define XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX
>> > > >> > > > +CONFIG_DRM_XE_PREEMPT_TIMEOUT_MAX #else #define
>> > > >> > > > +XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX (10 * 1000 * 1000)
>> > > #endif
>> > > >> > > > +
>> > > >> > > >  int xe_hw_engines_init_early(struct xe_gt *gt);  int
>> > > >> > > > xe_hw_engines_init(struct xe_gt *gt);  void
>> > > >> > > > xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16
>> > > >> > > > intr_vec); diff --git
>> > > >> > > > a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> > > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> > > >> > > > index 990bb675d1e0..2b7ac4e02db6 100644
>> > > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> > > >> > > > @@ -11,6 +11,20 @@
>> > > >> > > >
>> > > >> > > >  static int xe_add_hw_engine_class_defaults(struct kobject
>> > > >> > > > *parent);
>> > > >> > > >
>> > > >> > > > +bool enforce_schedule_limit(void) { #if
>> > > >> > > > +IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > > >> > > > +	return true;
>> > > >> > > > +#else
>> > > >> > > > +	return !capable(CAP_SYS_NICE); #endif }
>> > > >> > > > +
>> > > >> > > > +bool engine_timeout_in_range(u64 timeout, u64 min, u64 max)
>> {
>> > > >> > > > +	return timeout >= min && timeout <= max; }
>> > > >> > > > +
>> > > >> > > >  static void kobj_xe_hw_engine_release(struct kobject *kobj)  {
>> > > >> > > >  	kfree(kobj);
>> > > >> > > > @@ -39,11 +53,92 @@ kobj_xe_hw_engine_class(struct kobject
>> > > >> *parent, char *name)
>> > > >> > > >  	return keclass;
>> > > >> > > >  }
>> > > >> > > >
>> > > >> > > > +static ssize_t job_timeout_max_store(struct kobject *kobj,
>> > > >> > > > +				     struct kobj_attribute *attr,
>> > > >> > > > +				     const char *buf, size_t count) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > kobj_to_eclass(kobj);
>> > > >> > > > +	u32 timeout;
>> > > >> > > > +	int err;
>> > > >> > > > +
>> > > >> > > > +	err = kstrtou32(buf, 0, &timeout);
>> > > >> > > > +	if (err)
>> > > >> > > > +		return err;
>> > > >> > > > +
>> > > >> > > > +	if (timeout < eclass->sched_props.job_timeout_min)
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(timeout,
>> > > >> > > > +
>> > > XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> > > >> > > > +
>> > > XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_max,
>> > > timeout);
>> > > >> > > > +
>> > > >> > > > +	return count;
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static ssize_t job_timeout_max_show(struct kobject *kobj,
>> > > >> > > > +				    struct kobj_attribute *attr, char
>> > > *buf) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->sched_props.job_timeout_max);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute job_timeout_max_attr =
>> > > >> > > > +__ATTR(job_timeout_max, 0644, job_timeout_max_show,
>> > > >> > > > +job_timeout_max_store);
>> > > >> > > > +
>> > > >> > > > +static ssize_t job_timeout_min_store(struct kobject *kobj,
>> > > >> > > > +				     struct kobj_attribute *attr,
>> > > >> > > > +				     const char *buf, size_t count) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > kobj_to_eclass(kobj);
>> > > >> > > > +	u32 timeout;
>> > > >> > > > +	int err;
>> > > >> > > > +
>> > > >> > > > +	err = kstrtou32(buf, 0, &timeout);
>> > > >> > > > +	if (err)
>> > > >> > > > +		return err;
>> > > >> > > > +
>> > > >> > > > +	if (timeout > eclass->sched_props.job_timeout_max)
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(timeout,
>> > > >> > > > +
>> > > XE_HW_ENGINE_JOB_TIMEOUT_MIN,
>> > > >> > > > +
>> > > XE_HW_ENGINE_JOB_TIMEOUT_MAX))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	WRITE_ONCE(eclass->sched_props.job_timeout_min,
>> > > timeout);
>> > > >> > > > +
>> > > >> > > > +	return count;
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static ssize_t job_timeout_min_show(struct kobject *kobj,
>> > > >> > > > +				    struct kobj_attribute *attr, char
>> > > *buf) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->sched_props.job_timeout_min);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute job_timeout_min_attr =
>> > > >> > > > +__ATTR(job_timeout_min, 0644, job_timeout_min_show,
>> > > >> > > > +job_timeout_min_store);
>> > > >> > > > +
>> > > >> > > >  static ssize_t job_timeout_store(struct kobject *kobj,
>> > > >> > > >  				 struct kobj_attribute *attr,
>> > > >> > > >  				 const char *buf, size_t count)  {
>> > > >> > > >  	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > kobj_to_eclass(kobj);
>> > > >> > > > +#if
>> IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > > >> > > > +	u32 min = XE_HW_ENGINE_JOB_TIMEOUT_MIN;
>> > > >> > > > +	u32 max = XE_HW_ENGINE_JOB_TIMEOUT_MAX; #else
>> > > >> > > > +	u32 min = e->hwe->eclass->sched_props.job_timeout_min;
>> > > >> > > > +	u32 max = e->hwe->eclass->sched_props.job_timeout_max;
>> > > >> > > > +#endif
>> > > >> > >
>> > > >> > > I don't think we need this, just make sure default is within
>> > > >> > > min / max of the sched_props.
>> > > >> > >
>> > > >> >
>> > > >> > Shouldn't the sched_prop set through sysfs here which applies
>> > > >> > to all future user engines (xe_engine) has the same requirement
>> > > >> > as the sched_prop set directly to user engine (xe_engine)
>> > > >> > through set_properly
>> > > >> ioctl?
>> > > >> > ie., shoudln't the requirement be same in job_timeout_store()
>> > > >> > and engine_set_job_timeout()?
>> >
>> > I also think it should apply same to sysfs calls as well. Unless we think sysfs
>> should limit to compile configs only. Since sysfs min/max cab be changed.
>> >
>>
>> Disagree, the min / max sysfs entries are subject to the Kconfig limits.
>> So if you check the sysfs entry min / max here, the initial value will always be
>> within the Kconfig limits plus any additional restrictions a user has imposed.
>
>So limit to sysfs min/max always irrespective of elevated user or not, right?
>

Yah, the min/max sysfs entries are not subjected to the Kconfig limits
if cap_nice and CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT is not defined.
Also, if cap_nice, we should allow setting beyond sysfs limits. Right?

Niranjana

>Thanks,
>Tejas
>>
>> Matt
>>
>> > Thanks,
>> > Tejas
>> >
>> > > >> >
>> > > >> > Niranjana
>> > > >> >
>> > > >> > > Matt
>> > > >> > >
>> > > >> > > >  	u32 timeout;
>> > > >> > > >  	int err;
>> > > >> > > >
>> > > >> > > > @@ -51,6 +146,10 @@ static ssize_t job_timeout_store(struct
>> > > >> > > > kobject
>> > > >> *kobj,
>> > > >> > > >  	if (err)
>> > > >> > > >  		return err;
>> > > >> > > >
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(timeout, min, max))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > >  	WRITE_ONCE(eclass->sched_props.job_timeout_ms,
>> > > timeout);
>> > > >> > > >
>> > > >> > > >  	return count;
>> > > >> > > > @@ -78,11 +177,40 @@ static ssize_t
>> > > >> > > > job_timeout_default(struct kobject *kobj,  static struct
>> > > >> > > > kobj_attribute job_timeout_def = __ATTR(job_timeout_ms,
>> > > >> > > > 0444, job_timeout_default, NULL);
>> > > >> > > >
>> > > >> > > > +static ssize_t job_timeout_min_default(struct kobject *kobj,
>> > > >> > > > +				       struct kobj_attribute *attr, char
>> > > *buf) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj->parent);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->defaults.job_timeout_min);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute job_timeout_min_def =
>> > > >> > > > +__ATTR(job_timeout_min, 0444, job_timeout_min_default,
>> > > >> > > > +NULL);
>> > > >> > > > +
>> > > >> > > > +static ssize_t job_timeout_max_default(struct kobject *kobj,
>> > > >> > > > +				       struct kobj_attribute *attr, char
>> > > *buf) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj->parent);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->defaults.job_timeout_max);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute job_timeout_max_def =
>> > > >> > > > +__ATTR(job_timeout_max, 0444, job_timeout_max_default,
>> > > >> > > > +NULL);
>> > > >> > > > +
>> > > >> > > >  static ssize_t timeslice_duration_store(struct kobject *kobj,
>> > > >> > > >  					struct kobj_attribute *attr,
>> > > >> > > >  					const char *buf, size_t count)
>> > > {
>> > > >> > > >  	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > kobj_to_eclass(kobj);
>> > > >> > > > +#if
>> IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > > >> > > > +	u32 min = XE_HW_ENGINE_TIMESLICE_MIN;
>> > > >> > > > +	u32 max = XE_HW_ENGINE_TIMESLICE_MAX; #else
>> > > >> > > > +	u32 min = e->hwe->eclass->sched_props.timeslice_min;
>> > > >> > > > +	u32 max = e->hwe->eclass->sched_props.timeslice_max;
>> > > >> > > > +#endif
>> > > >> > > >  	u32 duration;
>> > > >> > > >  	int err;
>> > > >> > > >
>> > > >> > > > @@ -90,11 +218,92 @@ static ssize_t
>> > > >> > > > timeslice_duration_store(struct
>> > > >> kobject *kobj,
>> > > >> > > >  	if (err)
>> > > >> > > >  		return err;
>> > > >> > > >
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(duration, min, max))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > >  	WRITE_ONCE(eclass->sched_props.timeslice_us, duration);
>> > > >> > > >
>> > > >> > > >  	return count;
>> > > >> > > >  }
>> > > >> > > >
>> > > >> > > > +static ssize_t timeslice_duration_max_store(struct kobject
>> *kobj,
>> > > >> > > > +					    struct kobj_attribute *attr,
>> > > >> > > > +					    const char *buf, size_t
>> > > count) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > kobj_to_eclass(kobj);
>> > > >> > > > +	u32 duration;
>> > > >> > > > +	int err;
>> > > >> > > > +
>> > > >> > > > +	err = kstrtou32(buf, 0, &duration);
>> > > >> > > > +	if (err)
>> > > >> > > > +		return err;
>> > > >> > > > +
>> > > >> > > > +	if (duration < eclass->sched_props.timeslice_min)
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(duration,
>> > > >> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
>> > > >> > > > +
>> > > XE_HW_ENGINE_TIMESLICE_MAX))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_max, duration);
>> > > >> > > > +
>> > > >> > > > +	return count;
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static ssize_t timeslice_duration_max_show(struct kobject
>> *kobj,
>> > > >> > > > +					   struct kobj_attribute *attr,
>> > > >> > > > +					   char *buf)
>> > > >> > > > +{
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->sched_props.timeslice_max);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute timeslice_duration_max_attr =
>> > > >> > > > +	__ATTR(timeslice_duration_max, 0644,
>> > > >> timeslice_duration_max_show,
>> > > >> > > > +	       timeslice_duration_max_store);
>> > > >> > > > +
>> > > >> > > > +static ssize_t timeslice_duration_min_store(struct kobject *kobj,
>> > > >> > > > +					    struct kobj_attribute *attr,
>> > > >> > > > +					    const char *buf, size_t
>> > > count) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > kobj_to_eclass(kobj);
>> > > >> > > > +	u32 duration;
>> > > >> > > > +	int err;
>> > > >> > > > +
>> > > >> > > > +	err = kstrtou32(buf, 0, &duration);
>> > > >> > > > +	if (err)
>> > > >> > > > +		return err;
>> > > >> > > > +
>> > > >> > > > +	if (duration > eclass->sched_props.timeslice_max)
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(duration,
>> > > >> > > > +				     XE_HW_ENGINE_TIMESLICE_MIN,
>> > > >> > > > +
>> > > XE_HW_ENGINE_TIMESLICE_MAX))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	WRITE_ONCE(eclass->sched_props.timeslice_min, duration);
>> > > >> > > > +
>> > > >> > > > +	return count;
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static ssize_t timeslice_duration_min_show(struct kobject *kobj,
>> > > >> > > > +					   struct kobj_attribute *attr,
>> > > char
>> > > >> *buf) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->sched_props.timeslice_min);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute timeslice_duration_min_attr =
>> > > >> > > > +	__ATTR(timeslice_duration_min, 0644,
>> > > >> timeslice_duration_min_show,
>> > > >> > > > +	       timeslice_duration_min_store);
>> > > >> > > > +
>> > > >> > > >  static ssize_t timeslice_duration_show(struct kobject *kobj,
>> > > >> > > >  		struct kobj_attribute *attr, char *buf)  { @@ -118,11
>> > > >> > > > +327,40 @@ static ssize_t timeslice_default(struct kobject
>> > > >> > > > *kobj,  static struct kobj_attribute timeslice_duration_def
>> > > >> > > > = __ATTR(timeslice_duration_us, 0444, timeslice_default,
>> > > >> > > > NULL);
>> > > >> > > >
>> > > >> > > > +static ssize_t timeslice_min_default(struct kobject *kobj,
>> > > >> > > > +				     struct kobj_attribute *attr, char
>> > > *buf) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj->parent);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->defaults.timeslice_min); }
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute timeslice_duration_min_def =
>> > > >> > > > +__ATTR(timeslice_duration_min, 0444,
>> > > >> > > > +timeslice_min_default, NULL);
>> > > >> > > > +
>> > > >> > > > +static ssize_t timeslice_max_default(struct kobject *kobj,
>> > > >> > > > +				     struct kobj_attribute *attr, char
>> > > *buf) {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj->parent);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->defaults.timeslice_max); }
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute timeslice_duration_max_def =
>> > > >> > > > +__ATTR(timeslice_duration_max, 0444,
>> > > >> > > > +timeslice_max_default, NULL);
>> > > >> > > > +
>> > > >> > > >  static ssize_t preempt_timeout_store(struct kobject *kobj,
>> > > >> > > >  				     struct kobj_attribute *attr,
>> > > >> > > >  				     const char *buf, size_t count)  {
>> > > >> > > >  	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > kobj_to_eclass(kobj);
>> > > >> > > > +#if
>> IS_ENABLED(CONFIG_DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT)
>> > > >> > > > +	u32 min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
>> > > >> > > > +	u32 max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX; #else
>> > > >> > > > +	u32 min = e->hwe->eclass-
>> > > >sched_props.preempt_timeout_min;
>> > > >> > > > +	u32 max = e->hwe->eclass-
>> > > >sched_props.preempt_timeout_max;
>> > > >> > > > +#endif
>> > > >> > > >  	u32 timeout;
>> > > >> > > >  	int err;
>> > > >> > > >
>> > > >> > > > @@ -130,6 +368,10 @@ static ssize_t
>> > > >> > > > preempt_timeout_store(struct
>> > > >> kobject *kobj,
>> > > >> > > >  	if (err)
>> > > >> > > >  		return err;
>> > > >> > > >
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(timeout, min, max))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > >  	WRITE_ONCE(eclass->sched_props.preempt_timeout_us,
>> > > timeout);
>> > > >> > > >
>> > > >> > > >  	return count;
>> > > >> > > > @@ -158,17 +400,129 @@ static ssize_t
>> > > >> > > > preempt_timeout_default(struct kobject *kobj,  static
>> > > >> > > > struct kobj_attribute preempt_timeout_def =
>> > > >> > > > __ATTR(preempt_timeout_us, 0444, preempt_timeout_default,
>> > > >> > > > NULL);
>> > > >> > > >
>> > > >> > > > +static ssize_t preempt_timeout_min_default(struct kobject
>> *kobj,
>> > > >> > > > +					   struct kobj_attribute *attr,
>> > > >> > > > +					   char *buf)
>> > > >> > > > +{
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj->parent);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->defaults.preempt_timeout_min);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute preempt_timeout_min_def =
>> > > >> > > > +__ATTR(preempt_timeout_min, 0444,
>> > > preempt_timeout_min_default,
>> > > >> > > > +NULL);
>> > > >> > > > +
>> > > >> > > > +static ssize_t preempt_timeout_max_default(struct kobject
>> *kobj,
>> > > >> > > > +					   struct kobj_attribute *attr,
>> > > >> > > > +					   char *buf)
>> > > >> > > > +{
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj->parent);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->defaults.preempt_timeout_max);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute preempt_timeout_max_def =
>> > > >> > > > +__ATTR(preempt_timeout_max, 0444,
>> > > >> preempt_timeout_max_default,
>> > > >> > > > +NULL);
>> > > >> > > > +
>> > > >> > > > +static ssize_t preempt_timeout_max_store(struct kobject *kobj,
>> > > >> > > > +					 struct kobj_attribute *attr,
>> > > >> > > > +					 const char *buf, size_t count)
>> > > {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > kobj_to_eclass(kobj);
>> > > >> > > > +	u32 timeout;
>> > > >> > > > +	int err;
>> > > >> > > > +
>> > > >> > > > +	err = kstrtou32(buf, 0, &timeout);
>> > > >> > > > +	if (err)
>> > > >> > > > +		return err;
>> > > >> > > > +
>> > > >> > > > +	if (timeout < eclass->sched_props.preempt_timeout_min)
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(timeout,
>> > > >> > > > +
>> > > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> > > >> > > > +
>> > > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_max,
>> > > timeout);
>> > > >> > > > +
>> > > >> > > > +	return count;
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static ssize_t preempt_timeout_max_show(struct kobject *kobj,
>> > > >> > > > +					struct kobj_attribute *attr,
>> > > char *buf)
>> > > >> {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->sched_props.preempt_timeout_max);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute preempt_timeout_max_attr =
>> > > >> > > > +	__ATTR(preempt_timeout_max, 0644,
>> > > preempt_timeout_max_show,
>> > > >> > > > +	       preempt_timeout_max_store);
>> > > >> > > > +
>> > > >> > > > +static ssize_t preempt_timeout_min_store(struct kobject *kobj,
>> > > >> > > > +					 struct kobj_attribute *attr,
>> > > >> > > > +					 const char *buf, size_t count)
>> > > {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > kobj_to_eclass(kobj);
>> > > >> > > > +	u32 timeout;
>> > > >> > > > +	int err;
>> > > >> > > > +
>> > > >> > > > +	err = kstrtou32(buf, 0, &timeout);
>> > > >> > > > +	if (err)
>> > > >> > > > +		return err;
>> > > >> > > > +
>> > > >> > > > +	if (timeout > eclass->sched_props.preempt_timeout_max)
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	if (enforce_schedule_limit() &&
>> > > >> > > > +	    !engine_timeout_in_range(timeout,
>> > > >> > > > +
>> > > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN,
>> > > >> > > > +
>> > > >> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX))
>> > > >> > > > +		return -EINVAL;
>> > > >> > > > +
>> > > >> > > > +	WRITE_ONCE(eclass->sched_props.preempt_timeout_min,
>> > > timeout);
>> > > >> > > > +
>> > > >> > > > +	return count;
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static ssize_t preempt_timeout_min_show(struct kobject *kobj,
>> > > >> > > > +					struct kobj_attribute *attr,
>> > > char *buf)
>> > > >> {
>> > > >> > > > +	struct xe_hw_engine_class_intf *eclass =
>> > > >> > > > +kobj_to_eclass(kobj);
>> > > >> > > > +
>> > > >> > > > +	return sprintf(buf, "%u\n",
>> > > >> > > > +eclass->sched_props.preempt_timeout_min);
>> > > >> > > > +}
>> > > >> > > > +
>> > > >> > > > +static struct kobj_attribute preempt_timeout_min_attr =
>> > > >> > > > +	__ATTR(preempt_timeout_min, 0644,
>> > > preempt_timeout_min_show,
>> > > >> > > > +	       preempt_timeout_min_store);
>> > > >> > > > +
>> > > >> > > >  static const struct attribute *defaults[] = {
>> > > >> > > >  	&job_timeout_def.attr,
>> > > >> > > > +	&job_timeout_min_def.attr,
>> > > >> > > > +	&job_timeout_max_def.attr,
>> > > >> > > >  	&timeslice_duration_def.attr,
>> > > >> > > > +	&timeslice_duration_min_def.attr,
>> > > >> > > > +	&timeslice_duration_max_def.attr,
>> > > >> > > >  	&preempt_timeout_def.attr,
>> > > >> > > > +	&preempt_timeout_min_def.attr,
>> > > >> > > > +	&preempt_timeout_max_def.attr,
>> > > >> > > >  	NULL
>> > > >> > > >  };
>> > > >> > > >
>> > > >> > > >  static const struct attribute *files[] = {
>> > > >> > > >  	&job_timeout_attr.attr,
>> > > >> > > > +	&job_timeout_min_attr.attr,
>> > > >> > > > +	&job_timeout_max_attr.attr,
>> > > >> > > >  	&timeslice_duration_attr.attr,
>> > > >> > > > +	&timeslice_duration_min_attr.attr,
>> > > >> > > > +	&timeslice_duration_max_attr.attr,
>> > > >> > > >  	&preempt_timeout_attr.attr,
>> > > >> > > > +	&preempt_timeout_min_attr.attr,
>> > > >> > > > +	&preempt_timeout_max_attr.attr,
>> > > >> > > >  	NULL
>> > > >> > > >  };
>> > > >> > > >
>> > > >> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> > > >> > > > b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> > > >> > > > index 757136614672..2e2ab351a991 100644
>> > > >> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> > > >> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
>> > > >> > > > @@ -10,6 +10,8 @@
>> > > >> > > >
>> > > >> > > >  #define MAX_ENGINE_CLASS_NAME_LEN    16
>> > > >> > > >  int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
>> > > >> > > > +bool enforce_schedule_limit(void); bool
>> > > >> > > > +engine_timeout_in_range(u64 timeout, u64 min, u64 max);
>> > > >> > > >
>> > > >> > > >  /**
>> > > >> > > >   * struct kobj_eclass - A eclass's kobject struct that
>> > > >> > > > connects the kobject and the
>> > > >> > > > --
>> > > >> > > > 2.25.1
>> > > >> > > >
