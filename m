Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C79CDB474
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 02:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0F310E584;
	Fri, 13 Oct 2023 02:05:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C7810E584
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 02:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697162730; x=1728698730;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FNbcjig0sdserV0H9q30LWbqC4slWozKxvkw/C2vV6o=;
 b=JU7lKdXgLn3+gdpIfT7nLifMj2VDeCXn6jYYUzRyg+9+K+K4TG3stcFg
 //YLWif4HH7pL+St1LrjID7KsqRm73n3e/czu2Lz2HwAh5udtHUPLeTR2
 Zgr5vff52d3IuJmXB2h7trBlH+KaGwEqRW0hLmS5p43cLTaYr817mMcVI
 4z08PlvbF+gXM2d4W8LiWkqQ3PCLhlYnWBmoFY6I37QYaxa+miZ/k+n1u
 vzf5cxzJpy7tsiY11bqlUqPclYEYiJbvSjAIMn+MJ8zusXV7Ng50vKuzE
 i8icEesPUsXLYm8oCy9OMTA/m5BF9Za9IEAH+xRbHaHWDagMQ20lINhg1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="383946952"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="383946952"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 19:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1085923260"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1085923260"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 19:05:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 19:05:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 19:05:29 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 19:05:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcQm5ul4IJzRbQ8ZElI/BTurt18gLAustwnjDPRKlw5IVa/0kFqaAJxdhSB4Phtsj+zEXhqtNT8IFJLnsG0PZcs5HcJL2fPcDctNGNsThCXzaC4SnmzF1wcbRNWJINqVeKgDLhC9ztgObdt2XDageiU8D2VjWyJblQDCUr6RjCjH5j8Hai1jTnieNywlgudye8zYWtF33a5iktzt/T4vky5syTlOFCuvNycnL0y/X3wOz9GcIORh6c2JQlVaoMdxixfDHkV07Yd5U9b3RuSjQeSYIOQeqT1i/yZTxxpa247ISy++vE9elIJDamsWaTL83Fw765eiyp23ToQfErITvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zglp9SuxD6961vcPeRPuIwaWjcdGVZDxrQmUG7f0Meg=;
 b=GCKXLHxPkn4Ngx430RVZFWwGOg+AqugxJodNI87I8IQ99ldxNlECGTZVmWD+nO1MaSO2KhgibgysMaPjC6p+L5IHNRhmi+TVPxkL883v0fM2wRUdoAHV6BMYNg6vx9yFPSyNmJEKoBCODUoVjGoIq79OGiCTAZSH1NAqppiIgKCS8rMPaQomm3m5KGowmr2SLd7lSlk1uxFYyWnvnzmmaV9dpqXskEfYMlp2NpdPkfGvk5SULbYcLBdXdzvBzln/CaXK2hQF/X2YbwakcgS82TwHfOg4yGxwkWXGIW/k0YZEXo/4L+CENDBAZvEKR63Id+CkxaZRc5X6NpTNaZJPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Fri, 13 Oct 2023 02:05:27 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 02:05:26 +0000
Date: Thu, 12 Oct 2023 19:05:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <ZSil5GiJqEvijXNZ@unerlige-ril>
References: <20231011172643.826452-1-ashutosh.dixit@intel.com>
 <20231011172643.826452-2-ashutosh.dixit@intel.com>
 <ZSgj/AzRIL1Ge//q@unerlige-ril>
 <877cnr3efj.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877cnr3efj.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR11CA0104.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::45) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|MW3PR11MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c58ea50-13f7-4e26-5e4e-08dbcb90de31
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fbMiBYTJpAoGSm6ue82wPyWybzYWvEvqwGNLxNl5ObWGYq4eWcTS31H/TqeC1f/yfjy0Jpv382rvLothtlL+7y8yBu7L9RY17ACbtbtMKPDVHw0BCENvOELCBwUzgfqQ/QGxjO1/fx5xDT5kB/Z0ZCWaLIGmBI4eOF39cQGRmMhVu9+gSJB1pWM5z1xJhw8zGuYhmVLy01oZ/0JuT+Q1xu0o6ZxWzXzIZ/A5LV66ULwVA0+mUZDy0u0S9hG0c2QTrddIyl/0nZcTecYp2skdQXura3ofF2uVLpnIYgETyDw9NcXRtoIVMxRIhsNg+f4RNxWFDoLRw6ENRWtCTcs7j3btVR598hTrVuwkeQBiUHsGdqmNGQ3H/8MTML5hXAlUsUyljHoNonOV718kBlUPxoNxFJGVvRZpg3U/aXTZOk3pBRAQIZ1/73QIwe646/Bhl9tk9CWPwu4NEJvJYUAP0ARbfPddnnaQaUdwsyBdp1IGxuv1F4fu/Fy75qCgC6UX48EiF5sKVbOeVmuYgJ0kixYeg8uFi7lzcHc53juE0BjXLoFqx1UZWFUDmdnrxXn6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(376002)(136003)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82960400001)(107886003)(5660300002)(8936002)(8676002)(6862004)(4326008)(6506007)(6512007)(9686003)(83380400001)(38100700002)(26005)(478600001)(66946007)(66556008)(66476007)(6636002)(6486002)(54906003)(316002)(86362001)(33716001)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnU2M0J0dkRLSThqY0tVN0tuWUl1dHNpaDYxYUtmS2ZTUVUvd0N0Vmw2cWpk?=
 =?utf-8?B?dUlmdEJMMlNOWjdqRDY4Q1BvTnlObGh0SXFETkV2Ry9haHhEVEFxSDVmc1RK?=
 =?utf-8?B?RkhZaHFGT1JKMWpJU2tVS0hLUGM4RUs5a0Z3dE1IV1RWRlprN1BlUW1QVWFs?=
 =?utf-8?B?T0lsaG15S0YycmlCYVlta3BoOFBHMkQ2eXRZbXV0SUMvTVdseG0yVXpzUGp0?=
 =?utf-8?B?VUE2Wk9iTjUrZVVoa3pFSkRrc1N5emNreUNGQ3FoN25EanJJTGliZDgrNXli?=
 =?utf-8?B?Wno5RTd4bkZLVmM1M2NVcjI2QnM0Qm9aWGdDakdhQmlUTmlpQituUlBQVjcx?=
 =?utf-8?B?Vk1PdzY1cjAzYStoTWkweWw2eXNyaWVKckNpcjE3eDhQc2tTSCtrY1NQaGpk?=
 =?utf-8?B?REdhMmdXRENsaHhLU1BYWmQ2ZW40bXhxMmN6STl4UnhQRjdEVXJyckFiSGY4?=
 =?utf-8?B?TVFGLytMY3VVM2FpRFVQa0lPWklTOXBKQWJyQ2VaTjV5Q2NVbWF5Y09pSDhx?=
 =?utf-8?B?VytyTE9SQWo3dG5BbDRXUXpjZ3VMZy9qWWpTOXFyYmhuYUs5MmpKTU9JcFFs?=
 =?utf-8?B?QmNLeHdDL0JWSklrR0Vaa1o3ekZKaitITURDUUhDNnB0NDdvRnVFZjRtNWFy?=
 =?utf-8?B?TDFuZ0ZQZlgwREtmYzdMcU1EQndnb1VuZ2tvT0xPbkc2aEpVK3VMM3ZsSDQz?=
 =?utf-8?B?ZXd2U3BVVGU4RnRhSU1VYXFtQXlRTTJhM1c0VkNkMW9UVUZFRjF0U21ZcGdF?=
 =?utf-8?B?bXVrak45ekVJL0hkNFJkV2VrK2tGMHpURk9TNlRXWkFaTGNlRnVOdmVmQ2RR?=
 =?utf-8?B?M1Z4cE4wUE1IamNabGw1cWdtTXZSRnpEMlFIMFIveGV6ZHNLT0paUWFmRk1W?=
 =?utf-8?B?QUFqMHBYemlnTWJ5Yjc0MmFESE1WWTV5aFlXTUNlNllNb3RSaC9yVzlGQ05Z?=
 =?utf-8?B?N0lyZTA4cGtHbStGaGZvZDI2eWJQYzE5Ulphc1BSZmZFY2pUWXE3dUdyS2RI?=
 =?utf-8?B?d3RmejVIcGhNR1I4V3VzckNtV2Nmb3M4eklYWlFySThCS3cwbXRXL3l3b1d2?=
 =?utf-8?B?dUl6RlQvOHZkSXlNNEpRR3A5ZmJKa0ZZVjlVQ014U1BkM3NqWEsxcmIrWXRw?=
 =?utf-8?B?REJsK25XRUNqaEtRaXJXTVRuWjRwL1prblBjSVdGY1NoUHQ2aXYva2lDKytk?=
 =?utf-8?B?MEw4c1lFU0lmdkZhK0FjdndsVC9XUUZYYVhrWHN4RXJIWTgxZ1A5aGR2SFZ1?=
 =?utf-8?B?ZHlnZmg2NEJCUW5jaXY3Zkd5akZ5bGVVL1BtMTd0U0Q5OWtsWENLdXIyRnhN?=
 =?utf-8?B?clhoSWdzSFJDbWZ6SDJGVExYYkVVcUFmcm1weDRwQ3EvUkhjSkJOSTZ2d0cw?=
 =?utf-8?B?dnltUGtka2pnVUN5c2hMNGFsS01BamF2dDJiUzI5RXBubWZqdW5lcmw5QVFY?=
 =?utf-8?B?Nmdkand6NmJlOVh2K1p2NUFJZE8yQnk3TEJudWlVRVpHeGgvcEpQVnhpUHM1?=
 =?utf-8?B?T3ZzK1hTdWJSYjdaRnFYTW8xUmtIZUg0UGc1cTdVRDQ5clpSTFV0WEJrK1lq?=
 =?utf-8?B?V3pZTXZKNStvVlBNODZmMFNkbXhMc3J5Y2R4M3l5T1puZEl5aVN3VytpdUhU?=
 =?utf-8?B?ZXloa0crMWh5SG5YSVVmQ0ZjblVvNXpaMktXN2NVditXckhhd08xdHA1QVZB?=
 =?utf-8?B?bVJWdFVtTlRTLzhUS1FUMGFRTWhCUjB4NVJVODc4RFRZQm02eE5lVnFucVp6?=
 =?utf-8?B?Zm5mdlZ5cllsV2djK2dIWG1HSGQwV3llVE9VNTduUnpBdFJDNk1EK1hwZUk4?=
 =?utf-8?B?U0Z5TmE0KzQvYkd3elcrSVpENzdJcUpKMVlSSVNOdVp2c0IvQXpLeWFFb1da?=
 =?utf-8?B?dklSRlVrNXpDRVQ4S2tIdnNkQ3NmQmhxRndoN3JUbWFNTWRtbkhYOHNySVNZ?=
 =?utf-8?B?bk5wV3FsUW5SSjVva0Fta2dZL1JiOGIvQkR6TWVFM05tRTFHcWUwdmN0ZEtJ?=
 =?utf-8?B?VG4wL1UzaWk2YlZRVWpEa3lTRkFBOEh1eU5TV2V4MG4yditEYnVWdUtia292?=
 =?utf-8?B?ekhYVHg2Tks2RHUrTzZXRDlmcWVva09ZMlBPck9UWk9hMFRzbUVQN1pvaXpu?=
 =?utf-8?B?cE5YU3FlQlFJRnd1RmliTDBLVHpIMVIrREdsYlQ5WmlyemVOZTJhQ3lFdTNK?=
 =?utf-8?Q?zMJIGakJ/EZ6mvtaaOZcmGs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c58ea50-13f7-4e26-5e4e-08dbcb90de31
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 02:05:26.8213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMzxf2El8d3P07XL5v0UTZmnoqx32UwKZEE16cm2X+PZ60kAfZfuCdt+p2+IKMuRxssC5Sk+GrY8XapVXJ2zZ1cNemppfIK2QJ9ZJsCjIvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uapi: "Perf" layer to support
 multiple perf counter stream types
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
Cc: robert.krzemien@intel.com, ogabbay@habana.ai,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, gzadicario@habana.ai,
 Harish Chegondi <harish.chegondi@intel.com>, bdotan@habana.ai, talbo@habana.ai,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 11:04:32AM -0700, Dixit, Ashutosh wrote:
>On Thu, 12 Oct 2023 09:51:08 -0700, Umesh Nerlige Ramappa wrote:
>>
>
>Hi Umesh,
>
>> On Wed, Oct 11, 2023 at 10:26:41AM -0700, Ashutosh Dixit wrote:
>> > In XE, the plan is to support multiple types of perf counter streams (OA is
>> > only one type of these streams). This requires addition of a PERF layer to
>> > multiplex these different stream types through a single set of PERF
>> > ioctl's.
>> >
>> > In addition to PERF DRM ioctl's, another set of ioctl's on the PERF fd are
>> > defined. These are expected to be common to different PERF stream types and
>> > therefore are defined at the PERF layer itself.
>> >
>> > v2: Add param_size to 'struct drm_xe_perf_param' (Umesh)
>> > v3: Rename 'enum drm_xe_perf_ops' to 'enum drm_xe_perf_ioctls' (Guy Zadicario)
>> >    Add DRM_ prefix to ioctl names to indicate uapi names
>> >
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/Makefile    |  1 +
>> > drivers/gpu/drm/xe/xe_device.c |  4 +++
>> > drivers/gpu/drm/xe/xe_perf.c   | 47 ++++++++++++++++++++++++++++++++
>> > drivers/gpu/drm/xe/xe_perf.h   | 18 +++++++++++++
>> > include/uapi/drm/xe_drm.h      | 49 ++++++++++++++++++++++++++++++++++
>> > 5 files changed, 119 insertions(+)
>> > create mode 100644 drivers/gpu/drm/xe/xe_perf.c
>> > create mode 100644 drivers/gpu/drm/xe/xe_perf.h
>> >
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index 175a357366d96..fb3eacbe3d6cb 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -88,6 +88,7 @@ xe-y += xe_bb.o \
>> >	xe_pat.o \
>> >	xe_pci.o \
>> >	xe_pcode.o \
>> > +	xe_perf.o \
>> >	xe_pm.o \
>> >	xe_preempt_fence.o \
>> >	xe_pt.o \
>> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > index ef42c33e30558..3c0c28c6f9fb8 100644
>> > --- a/drivers/gpu/drm/xe/xe_device.c
>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > @@ -28,6 +28,7 @@
>> > #include "xe_module.h"
>> > #include "xe_pat.h"
>> > #include "xe_pcode.h"
>> > +#include "xe_perf.h"
>> > #include "xe_pm.h"
>> > #include "xe_query.h"
>> > #include "xe_tile.h"
>> > @@ -128,6 +129,9 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>> >	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>> >			  DRM_RENDER_ALLOW),
>> >	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>> > +	DRM_IOCTL_DEF_DRV(XE_PERF_OPEN, xe_perf_open_ioctl, DRM_RENDER_ALLOW),
>> > +	DRM_IOCTL_DEF_DRV(XE_PERF_ADD_CONFIG, xe_perf_add_config_ioctl, DRM_RENDER_ALLOW),
>> > +	DRM_IOCTL_DEF_DRV(XE_PERF_REMOVE_CONFIG, xe_perf_remove_config_ioctl, DRM_RENDER_ALLOW),
>> > };
>> >
>> > static const struct file_operations xe_driver_fops = {
>> > diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>> > new file mode 100644
>> > index 0000000000000..de430065e0d27
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_perf.c
>> > @@ -0,0 +1,47 @@
>> > +// SPDX-License-Identifier: MIT
>> > +/*
>> > + * Copyright © 2023 Intel Corporation
>> > + */
>> > +
>> > +#include <linux/errno.h>
>> > +
>> > +#include "xe_perf.h"
>> > +
>> > +int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> > +{
>> > +	struct drm_xe_perf_param *arg = data;
>> > +
>> > +	if (arg->extensions)
>> > +		return -EINVAL;
>> > +
>> > +	switch (arg->perf_type) {
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> > +}
>> > +
>> > +int xe_perf_add_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> > +{
>> > +	struct drm_xe_perf_param *arg = data;
>> > +
>> > +	if (arg->extensions)
>> > +		return -EINVAL;
>> > +
>> > +	switch (arg->perf_type) {
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> > +}
>> > +
>> > +int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> > +{
>> > +	struct drm_xe_perf_param *arg = data;
>> > +
>> > +	if (arg->extensions)
>> > +		return -EINVAL;
>> > +
>> > +	switch (arg->perf_type) {
>> > +	default:
>> > +		return -EINVAL;
>> > +	}
>> > +}
>>
>> I would just squash the 2 patches here since this is a new interface and we
>> don't care much about what existed earlier.
>
>OK, I'll squash the two patches.
>
>> > diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
>> > new file mode 100644
>> > index 0000000000000..7ee90491132a0
>> > --- /dev/null
>> > +++ b/drivers/gpu/drm/xe/xe_perf.h
>> > @@ -0,0 +1,18 @@
>> > +/* SPDX-License-Identifier: MIT */
>> > +/*
>> > + * Copyright © 2023 Intel Corporation
>> > + */
>> > +
>> > +#ifndef _XE_PERF_H_
>> > +#define _XE_PERF_H_
>> > +
>> > +#include <drm/xe_drm.h>
>> > +
>> > +struct drm_device;
>> > +struct drm_file;
>> > +
>> > +int xe_perf_open_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>> > +int xe_perf_add_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>> > +int xe_perf_remove_config_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>> > +
>> > +#endif
>> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > index d48d8e3c898ce..d734d2ee385b1 100644
>> > --- a/include/uapi/drm/xe_drm.h
>> > +++ b/include/uapi/drm/xe_drm.h
>> > @@ -111,6 +111,9 @@ struct xe_user_extension {
>> > #define DRM_XE_WAIT_USER_FENCE		0x0b
>> > #define DRM_XE_VM_MADVISE		0x0c
>> > #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
>> > +#define DRM_XE_PERF_OPEN		0x0e
>> > +#define DRM_XE_PERF_ADD_CONFIG		0x0f
>> > +#define DRM_XE_PERF_REMOVE_CONFIG	0x10
>> >
>> > /* Must be kept compact -- no holes */
>> > #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
>> > @@ -127,6 +130,9 @@ struct xe_user_extension {
>> > #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>> > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>> > #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>> > +#define DRM_IOCTL_XE_PERF_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_OPEN, struct drm_xe_perf_param)
>> > +#define DRM_IOCTL_XE_PERF_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_ADD_CONFIG, struct drm_xe_perf_param)
>> > +#define DRM_IOCTL_XE_PERF_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_REMOVE_CONFIG, struct drm_xe_perf_param)
>> >
>> > /**
>> >  * enum drm_xe_memory_class - Supported memory classes.
>> > @@ -1093,6 +1099,49 @@ struct drm_xe_vm_madvise {
>> > #define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
>> > #define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
>> >
>> > +/**
>> > + * enum drm_xe_perf_type - Perf stream types
>> > + */
>> > +enum drm_xe_perf_type {
>> > +	DRM_XE_PERF_TYPE_MAX,
>> > +};
>> > +
>> > +/**
>> > + * struct drm_xe_perf_param - XE perf layer param
>> > + *
>> > + * The perf layer enables multiplexing perf counter streams of multiple
>> > + * types. The actual params for a particular stream operation are supplied
>> > + * via the @param pointer (use __copy_from_user to get these params).
>> > + */
>> > +struct drm_xe_perf_param {
>> > +	/** @extensions: Pointer to the first extension struct, if any */
>> > +	__u64 extensions;
>> > +	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
>> > +	__u64 perf_type;
>> > +	/** @param_size: size of data struct pointed to by @param */
>> > +	__u64 param_size;
>>
>> Since this structure is expandable using extensions, maybe we don't need to
>> worry about the param_size. We can drop it. The size would matter if the
>> only way to extend a structure was to add members to the end.
>
>Hmm, note param_size is not the size of this struct, it is the "size of
>data struct pointed to by @param". Even the struct pointed to by @param
>probably will also have an extensions member.
>
>Even then I am thinking no harm in having the param_size member since it
>helps in cases where UMD and KMD versions are different and the struct size
>has changed, so each has a different notion of what the struct size
>is. Having param_size available enables the kernel to resolve such cases if
>the need arises in the future (as is done in drm_ioctl). UMD just needs to
>fill in param_size as sizeof(struct) it is passing in via @param, so
>doesn't look too horrible. So I'm thinking of leaving it in just in case.
>
>What do you think?

IMO, if extensions are members of all structs in our uApi, then we 
should just use that for extending the structs. I think the size is 
added burden on UMDs to populate. In case of drm_ioctl, the UMD does not 
see this, so it's probably okay.

Regards,
Umesh

>
>Thanks.
>--
>Ashutosh
>
>> > +	/** @param: Pointer to actual stream params */
>> > +	__u64 param;
>> > +};
>> > +
>> > +/**
>> > + * enum drm_xe_perf_ioctls - Perf fd ioctl's
>> > + */
>> > +enum drm_xe_perf_ioctls {
>> > +	/**
>> > +	 * @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream that
>> > +	 * was e.g. either opened in a disabled state or was disabled via
>> > +	 * DRM_XE_PERF_IOCTL_DISABLE
>> > +	 */
>> > +	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>> > +
>> > +	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>> > +	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>> > +
>> > +	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>> > +	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>> > +};
>> > +
>> > #if defined(__cplusplus)
>> > }
>> > #endif
>> > --
>> > 2.41.0
>> >
