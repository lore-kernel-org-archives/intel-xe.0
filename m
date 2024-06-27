Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06BEC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 20:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E3C10EA61;
	Thu, 27 Jun 2024 20:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LV0uo18S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C268810EA61
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 20:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719521915; x=1751057915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1RGUW7JoAZaZcGhyJwBQAe6weegMadmc3KA05/8Wk74=;
 b=LV0uo18ST+vUpIwqhicBiPDeEj8eZiTE6Gy/PwXupX3eC6NMcCllpf0E
 0T3zlLG/7DQovLCuCVCgWfqxFLqAVQuJbqTR1N5wQlwu3TLXqeyBHY2bx
 f27hoHCzJoGUJ/RpaJGxrX1a3IKg4A4S2AjmdRiU+T+GgAjoP8Kz9eWiL
 QUcUXfl8asJ9WsQxebVH5SJ1EbxCPQjjklhPbyPaBdJhqqkVh4RRUGK2/
 nYnZw9WYqAYt8Pz/+aL6roPjrhyZg2fZOP2V6VGkPGBm43PHEBEDxvKm+
 4EvUeUCF26lB4qEaHb4gzuyNupq6ZchqzWUxQvBYcXKmfA+wBS/36QX4J Q==;
X-CSE-ConnectionGUID: uHwx0qyUQGCTL1qIIn2fdw==
X-CSE-MsgGUID: ruYAlMh3SCakvkh6IzmaqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="20444891"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="20444891"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 13:58:34 -0700
X-CSE-ConnectionGUID: Mltp5KpLTLaNfo6lhNuTyQ==
X-CSE-MsgGUID: vRjNuKsOTCikwn+6CTw5xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; d="scan'208";a="45154818"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jun 2024 13:58:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 13:58:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 13:58:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 13:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSk82rjm9xyadMf9TbsIV5ZXiNNunYoIHVt7J2ak2fF7yxsDvA1fiAmf4K2iHPJgf+iqcJbYmGLQbpUhbFPj6AUkhIOVnwdvroSA95Z+vJPiVDRV4jZzm4dPC/ASV4VgFWRo/lmuLcmx5pPorzBdRhqwRPt3PM/l3K6ruCTXIqDxfOUBuNTs842iAUbEXi7yCqrlq037GTSbFScrbhaDEpW5O5sx9Bv6JwyMXaZ/zn/iHtCSipbRdWmKEWJqpgyB++pkX0SqtZrwyeB9jm7XYCp/5TWOT2O99G2T/RNDNi0AQ8FBaBtV5e1/8EGwCaJNVxZ4Bhe9jqtJYGpZqhJRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaI7dbsgTwf9frDoGITpm6RJSYZ6a5BxYTkXjs5XHmQ=;
 b=YDBVovtiX9YJf0eF2dGRNVUE7BVsNrOpl+m2Kr+tuNcZNlJkuPVoycHa6Ur0DuEe1ERpF3vJhsgxy8aR3zLy9xjylk2y0Z1U7fLte7ncTMy1CX75tGC692Qe82D/u6kZ0bI51yccUzze0INgdAQMSXRIXeKPFLs76QmNCEMAwqOSMnPtk+panlu2B9sVEKO0hhMrvxLmqnNm0rSIEXL6hpDi8Xbq9PlHAG7VkxxqGJ7FSevrJYm6QCE4b84HZPdvDJoiMk+KrDsYOMIwMRu5FuJhjqwOItFOwnG0mJCvJUoYTMZr3zRZTCRRvQttgERx5Rcu5bxlRvucdlD3jR/BJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7836.namprd11.prod.outlook.com (2603:10b6:8:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 20:58:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 20:58:22 +0000
Date: Thu, 27 Jun 2024 15:58:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Record utilization before destroying the
 exec queue
Message-ID: <6egzvxymwun3sp63kwu4ceu6wd65osi3vaxmq2bsp6prddrqo3@3mskhio5m4as>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
 <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
 <Znr9Mk8r1e2gvUja@DUT025-TGLU.fm.intel.com>
 <ZnsBLb8x/Ma+JIxl@DUT025-TGLU.fm.intel.com>
 <ZnuJP4HOMsY0ImvQ@orsosgc001>
 <Zn0ATkJwe00C+hpL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zn0ATkJwe00C+hpL@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 731422c0-91aa-4d4f-bbd8-08dc96ebe163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BvqCfZlKcMOdUMAIe51M78QZj9oakxnj2QP1XhG4k2udGYANjXn4vLrb+9lQ?=
 =?us-ascii?Q?kObuVhT5IIJdVkFpQvmISzSzAhNcHG1mV2JjONL6pJeFzyUuNQFUNytoE+0H?=
 =?us-ascii?Q?FmMZDLVr9dwsZscbu1HJVJ0uDXElkSE9YLy28DZj2t7F+ZIGQFSBTC5JsCEp?=
 =?us-ascii?Q?AtauEYLizVKXDZ+JOUN34VpuLe8pV7zKHbXBj8QHVhugdvYn5R/LAsrSy+6D?=
 =?us-ascii?Q?VEP2q6pEJ/uDeGS1OI2UOy4Wps8++7vqlcvE8YksENNeMfHpRXc8XdF9+km4?=
 =?us-ascii?Q?XYO+yyELU77eaM802SfIrRj/0wpE88rvEa+FmGNpvemNXR6ixaEGV+eSe4Qj?=
 =?us-ascii?Q?FFrKB5fHbjmhXtRWAd9R6pDNaHqoec4Ts5fI89C5mEWTiYpnt8+Z/YjgngWP?=
 =?us-ascii?Q?5ig9BBMKa4wt9ejukAIISFvOsd+ZxRPitr+XJDtgqj1ItDfo/z8ezH78iOeD?=
 =?us-ascii?Q?f3qITbgkFOI/KFBx0R3CAWHY6p6PX2DoaFQ5gBYg30sqkGfx4V/ah8IfEKui?=
 =?us-ascii?Q?Ycw5dtAbrNl/GtKjDqsl6Ll+XqKT3GyQ/wEaau4Ylu8ro1wQIn+7WF36MRyl?=
 =?us-ascii?Q?mgWPjKG/3Kooq5kzW0zka7KgMhP1wHa+pJWVUfmQMqhq8wu2jz5xglBAiMmi?=
 =?us-ascii?Q?wPCdNU0VNYTu4Fa6y0w6U7aRX+hmVrHIPmQpxv3SDBjI9NvWmp2R+/516FlT?=
 =?us-ascii?Q?8eTBE2i9RNLtYIdM/8i+h+mCz2OPLrMmLGq+sQksiSksuhR7HND6UzXNNgZA?=
 =?us-ascii?Q?AZL4Yd1ztRSBRPkFcBWp/nE3G3JtTcutCid5tqDLV6gcc/IJU4+P3n+5dwfO?=
 =?us-ascii?Q?U38sVsjw5Im7s/ukmPkM2LgDKa33mL2EE1At2o93qMmVmxR/FF+DKIb1C6ie?=
 =?us-ascii?Q?CL3mItgBGjYBv/w3piHzmHH30zlDyNcMoZ1UqFGnKtYc0UGdqC7umUfBjyHV?=
 =?us-ascii?Q?byVEBy8tTNW8/cKQghlEZyd4WnpYoAEKRF5Y7DmsI0rm3JSaorp0axcezOqk?=
 =?us-ascii?Q?ed8zdLBtLMqSrzcTGEVirL/9klKOLODxb2pucIUwpYh/PcEeA9fy/K09N2hb?=
 =?us-ascii?Q?10roi6mUijeHPVka8v8LuURwxzw7J2rWuwY3eAKklbMio9w3vAN9woVyDURQ?=
 =?us-ascii?Q?p/OCAy2fKseb+KbXjigTAkbXgcZQ6OGiDg5BWMuNq0QVPZXen4ixfQ9xZOub?=
 =?us-ascii?Q?du12MplxNPSG5DMkOtEC6L7BzfN2iMfOTQqamHI2fwmRVlDS+sflOtMO8CIc?=
 =?us-ascii?Q?Am8dXADoo02IrTyoEO+lXb5TEtjeXKRXSLT7BbJN+d6nUvyts+5+JoM4gAeZ?=
 =?us-ascii?Q?nR8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uSbNl6rII8XxreYrvQLC7H2bDCNEyxtu1kQYhp7cOAtftQ9ofWoy4319GQ6c?=
 =?us-ascii?Q?ZDJ5iezrV9mlde/ECUflFbJ2t+ms6w2e9OTAdxQ3ADWT5J1smeAmEAx8eMHR?=
 =?us-ascii?Q?TdPnqsw4C/Dx6j019rhmaBih2xUkwVGk5wr9scz/yA1+CfgO5sXOWR26aGVN?=
 =?us-ascii?Q?ONTSvX4Z3t9AvXUQSBYlc0IYdTQxzCXh/YW1g/nM/eMx0GHL7/tr6XSYnR3Z?=
 =?us-ascii?Q?2I7cDnfqg56iMa2FTts0GyytJ98PRi0USlzO86iw4p09mmy9cQPzGxHQYV7Y?=
 =?us-ascii?Q?CBLcI4tHKgwvufpGLsg9SMMwud63TPrBwgo/Q+reDlfmwLfCpbNzTBKtJISJ?=
 =?us-ascii?Q?bOu4KAvQHzChl6rpIP/nAJ3Spi3B1YNguLBJFWKU+JnKsBH5usrqgXFmJz7t?=
 =?us-ascii?Q?LuNGCTGJ1Ns7skV/1k3N/mx2Qsy+KfBQaidkazzczMSn5JJDezGL4bBV2XUR?=
 =?us-ascii?Q?iNO864vmjvS9yztX1oNIWSjCmfTZaV64tRJbGNgpl37ojc62219PdIuBt7qv?=
 =?us-ascii?Q?IOJEPHiVhhtfflKeRIsU5l9KXTJPRo/S4aSM6Z7hgiUQr1EOXlTpWcfNiHBu?=
 =?us-ascii?Q?2k7sBMThbgQIB4I9uLOtx+cBh1tzPiwCvYRPzoj+2OT/u4c3dlkFoxHbZOdu?=
 =?us-ascii?Q?An+UvaxIEPrPEaTwMeW9QqDLk++s+Q10o1sIp18vqRr8R+lC1Y1LKBwkoTgp?=
 =?us-ascii?Q?vmFv9kug7uxpzPqPNfCMKfFR09L9zZ7sOjWwQ4RGl8JQgU6GHrZy9WCQIyud?=
 =?us-ascii?Q?F3jGMbXD4eK14rC+wWPSXXfgT17YPfEO+ion8vqgWs7AABDlFBogXI07VuGR?=
 =?us-ascii?Q?LS3CSx2vbJTUY4i/DAwtU/sWPTpCm53pGmSzjRoTpgTgjU9zHbcw+vPcy0K+?=
 =?us-ascii?Q?094Re7rsnhnTe1QVkQDrMnwqBsraV32BAq3d7WEA/iwx4WMfrIo3YyknPB8H?=
 =?us-ascii?Q?AbvKJ3WbTgrjxKogWyRgvlbJDakfUtgq7LzlRGK84gThnbF2YbP6GPrIItp0?=
 =?us-ascii?Q?ZCDw5VTuFQNOrkrIYuEVyAnpwMx1GcTdyBdp0UsMb3Oa0Zm+DhCX9BFQYDuk?=
 =?us-ascii?Q?ECWQrSb8L/lwHT5T00VxuxUEEToPS7Ht3IvI0tEVWddnZblxShk2fGK1jxpp?=
 =?us-ascii?Q?3qWuNvWXV7j6afvYXwTEvhvuJxQ6uzi69uS9T+Go5iC6I0Ngi/n9qoRGkax6?=
 =?us-ascii?Q?TZUe1/HCnJs01+IE+CsU0ow09mRXvVKqXLTAzj2BHrjzzFcj/FwQvu4lmDeI?=
 =?us-ascii?Q?MdIA65+ZQXC10ULa42KBtIzDsS681gM9oL+RxNZsOFVznjfCwkEzzqCwvHCs?=
 =?us-ascii?Q?GtuGwlENoVmsceu2/6tsY98sMgCD3+7pM6e1dJ38zvNxfmMbr/OQvoSe1vWl?=
 =?us-ascii?Q?lm0XbkwiIHp6TAPdxGHrzpCwK0ODfhpQvM0clDN2hXHazXaYd9qtyTpOv7rD?=
 =?us-ascii?Q?X7ReCvwz85Iwq2zytCZrY2JFveSDGGqybmbtuPPE6FEHbik+GVKH8aAHXLCg?=
 =?us-ascii?Q?33JxE6ZmWibXHgPJ3zwC8yrxprCC8dqgCVE2txwLJP8ng8OD51KFaL3XWjVd?=
 =?us-ascii?Q?3TuknCu3uPl/0YwdWKUx2j9NX1/aRWgmVE3LWXWKHOIrLJBl3XdN/wl4funp?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 731422c0-91aa-4d4f-bbd8-08dc96ebe163
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 20:58:22.4562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeTWJMOBxZgQvasjl2htE64QoRfJ8V5b7nxbwKeyskGJJoKd1LZaViTBgo0i8JzghIwxKEocWxl/icPVc6oHapm3OD1W+HNr2by4Cg+Q2bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7836
X-OriginatorOrg: intel.com
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

On Thu, Jun 27, 2024 at 06:01:50AM GMT, Matthew Brost wrote:
>On Tue, Jun 25, 2024 at 08:21:35PM -0700, Umesh Nerlige Ramappa wrote:
>> On Tue, Jun 25, 2024 at 05:41:01PM +0000, Matthew Brost wrote:
>> > On Tue, Jun 25, 2024 at 05:24:02PM +0000, Matthew Brost wrote:
>> > > On Wed, Jun 26, 2024 at 12:58:12AM +0800, Umesh Nerlige Ramappa wrote:
>> > > > Current code captures utilization at the exec queue level whenever a job
>> > > > is completed and then accumulates it into the xe file stats whenever the
>> > > > user queries for per client engine utilization. There is a case where
>> > > > utilization may be lost if the exec queue is destroyed before the user
>> > > > queries the utilization. To overcome that, record the utlization when
>> > > > the exec queue is destroyed.
>> > > >
>> > > > To do so
>> > > >
>> > > > 1) Wait for release of all other references to the exec queue. The wait
>> > > >    uses the same timeout as the job scheduling timeout. On timeout, only
>> > > >    a debug message is printed out since this is just a best effort to
>> > > >    capture the utilization prior to destroying the queue.
>> > > > 2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
>> > > >    record the utilization in the xe file stats.
>> > > >
>> > > > Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
>> > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > ---
>> > > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 +++++++++++
>> > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>> > > >  2 files changed, 13 insertions(+)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > > index 4d90a16745d2..f1028eaf2d7f 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > > @@ -69,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>> > > >  	q->ops = gt->exec_queue_ops;
>> > > >  	INIT_LIST_HEAD(&q->lr.link);
>> > > >  	INIT_LIST_HEAD(&q->multi_gt_link);
>> > > > +	init_waitqueue_head(&q->wq);
>> > > >
>> > > >  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>> > > >  	q->sched_props.preempt_timeout_us =
>> > > > @@ -825,6 +826,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> > > >  	struct xe_file *xef = to_xe_file(file);
>> > > >  	struct drm_xe_exec_queue_destroy *args = data;
>> > > >  	struct xe_exec_queue *q;
>> > > > +	int ret;
>> > > >
>> > > >  	if (XE_IOCTL_DBG(xe, args->pad) ||
>> > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>> > > > @@ -838,6 +840,15 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>> > > >
>> > > >  	xe_exec_queue_kill(q);
>> > > >
>> > > > +	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
>> > > > +			(q->sched_props.job_timeout_ms/1000) * HZ);
>> > > > +	if (!ret)
>> > > > +		drm_dbg(&xe->drm, "Timedout waiting for exec queue run ticks update\n");
>> > > > +
>> > >
>> > > I can't say I love adding a wait to destroy IOCTL just to accurately
>> > > report some stats. If we can't preempt this exec queue, the kill flow
>> > > can take nearly .7s which would be pretty bad to block in the IOCTL.
>> >
>> > Opps, my timing calculation is wrong here as I forget that we reduce to
>> > the preemption timeoot to 1ms upon kill. But my point still stands from
>> > an arch perspective blocking in an IOCTL to collect stats doesn't seem
>> > right to me. Maybe others have a different opinion?
>> >
>> > > Even the common case isn't great either...
>> > >
>> > > Beyond that, this code breaks if the assumption of
>> > > kref_read(&q->refcount) == 1 meaning all jobs are done. e.g. The wedging
>> > > code == 2 takes an extra ref to the exec queue, so this IOCTL will hang
>> > > forever even we wedge the device.
>> >
>> > s/even we/if we/
>> >
>> > Matt
>> >
>> > >
>> > > Could this be added to exec queue backend code which adjusts on the
>> > > final destroy? e.g. Add it to __guc_exec_queue_fini_async via
>> > > xe_exec_queue_fini? Or does that not work because we don't have the xef?
>>
>> That's how it was earlier, but the problem we ran into earlier was that
>> xe_file_close would schedule work to kill the queue and in parallel go ahead
>> and close the xef object. By the time, the queue backend wanted to update
>> xef, xef was freed -
>> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>>
>> Maybe if the queue backend somehow knows that the relevant xef is gone, it
>> could handle the above bug, but we do not have a q->xef. It looks like that
>> was intentionally removed a while ago. We were using q->vm->xef in the code
>> that caused the above bug, but that's a hacky way to relate the queue to its
>> xef.
>>
>> To resolve the bug above, I had added code to localize the stats to the
>> queue and transfer those stats to xef only in calls where we knew that the
>> xef was valid - like when the user queries the stats. The only open was that
>> when the queue is destroyed, we will lose the stats stored in the queue if
>> we don't transfer it. That's what is being addressed here.
>>
>> > >
>> > > Regardless if my suggestion works or not, surely we can do something to
>> > > avoid waiting in this IOCTL. I suggest exploring another solution.
>>
>> Lucas had suggested using a ref to xef object, but I think that requires
>> bringing back the link q->xef. If you are okay with that, then I can add
>> some code to make xef ref counted and solve the original issue -
>> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908. I can drop this
>> series then.
>>
>
>That seems to be a sane choice, in general I think we get into trouble
>when we don't ref count objects.
>
>So the ref counting scheme would roughly be:
>
>- init ref count to xef in xe_file_open
>- drop ref in xe_file_close
>- exec queue takes ref to xef upon creation (user IOCTL created exec queues only)
>- exec queue drops ref to xef upon destroy (again user IOCTL created exec queues only)
>
>Seeme like a good design to me.

we will also neet to get the ref on objects where we store the xef (e.g.
xe_vm_create_ioctl()) and put it when destroying the vm.

ack, but the check for "user IOCTL created exec queues" is implicit as
otherwise q->xef would be NULL.... because this is not coming from any
xef.

Lucas De Marchi

>
>Matt
>
>> Thanks,
>> Umesh
>>
>> > >
>> > > Matt
>> > >
>> > > > +	mutex_lock(&xef->exec_queue.lock);
>> > > > +	xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
>> > > > +	mutex_unlock(&xef->exec_queue.lock);
>> > > > +
>> > > >  	trace_xe_exec_queue_close(q);
>> > > >  	xe_exec_queue_put(q);
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > > index 201588ec33c3..2ae4221d2f61 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> > > > @@ -143,6 +143,8 @@ struct xe_exec_queue {
>> > > >  	u64 old_run_ticks;
>> > > >  	/** @run_ticks: hw engine class run time in ticks for this exec queue */
>> > > >  	u64 run_ticks;
>> > > > +	/** @wq: wait queue to wait for cleanup */
>> > > > +	wait_queue_head_t wq;
>> > > >  	/** @lrc: logical ring context for this exec queue */
>> > > >  	struct xe_lrc *lrc[];
>> > > >  };
>> > > > --
>> > > > 2.34.1
>> > > >
