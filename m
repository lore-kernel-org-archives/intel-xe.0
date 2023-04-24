Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B506C7618E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 23:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C4C891D9;
	Mon, 24 Apr 2023 23:18:31 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED41891D9
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 23:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682378308; x=1713914308;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zoe/gnqEbY63DUKgEOrKTF2gbFG0alM7XeNVJGKn7Nw=;
 b=jHZ730sho2Mh3pmn4nV3mqMjTFqeJ+G3VW8aU3Vj60CB8n77sm6LacAO
 weXbYpyqsg7o9SoLPjK1PGkJO2RwmUF9dpBvzIsyGkRmTDdkiIISH+am6
 SJy2uOuswGeAsd8Oddo/yzolmuMJ++eBr2QMgSgtuGOvR5VyKyknBhTOp
 Z8hJyXqjHeECM/d2C1GlZh9R080EM5SbOixTcR8PvHVXhSJY6Twb+K5j3
 V0yEJ5zj5DmkZb6VunxnITwU8vh3cwmZCekHvpNTsPqrK7pGNjW/LZ/zI
 HZriP/iRdp7BS8SaI7UxTX8TMslncZjsXGAc1n6ys0dQMG1AJ/TmTZRmv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330806088"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330806088"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 16:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="643553821"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="643553821"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 24 Apr 2023 16:18:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 16:18:06 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 16:18:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 16:18:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 16:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEExkQOyiKurILf9GHkXcp8Zrn4fHaEQD9GAcrVnQQP+Zeiu9olRYE7SgBS52zWEl5JCOqQmiTUst2sromjHLzyU9AQlRiHFAox9FhEap7IkUGmu4ft3kzA+OPbRRDAPeeyQp2ZV58yqjN90UzwGBMTSF1uc62IWxFs8p0V9tT6npsYG1eTVVeUkEkShc289wApG9+viNG3dWr4w1d2xzVg0RV0bZkxqFX5jB+ul02XVSfEG0EUEHHJf5JvxLVNFUX/GgFOjBuGPAytvE/rUraCWc6WHFbOLIso8U0EG+qGpj4g5GjbBx2YykGzOwZ8WFxgYkVMc0y7RI6XjyK0UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NVQ58z8WquM7b++UUTeXnDHPC+qZUk51gvxgO/T2JY=;
 b=mNxvM8UA9mhjLdNDp/xZfcC4BHOxBPmEJeva7J8iWLFcVpES90pzkmi28RLlOQa2jfGP4soP3b9ttCKLB8xg+1csoz3t61ZfhxBrX9cSIXVcjK1fGP0xMUGvEqmZm6tJJzbzUN6tjIPUTOmHlmFuEOP5hd8N+C3uZyYnLqys91+jWR5fAYA934lgWj1yaz787yifkk1BUyKT8DK278SdXnBvlW/ePxJkoy+DdJsgSc71ise88jnxACjlG87LFzP0VtjcMF7if8vmW+JE3neVLCYk7g1Cxcga6umsLpgrqxgHXMZlc8ODphUbNtTpZRzWbTzFe6MOGzHu3GjVVvr93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 23:18:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.034; Mon, 24 Apr 2023
 23:18:02 +0000
Date: Mon, 24 Apr 2023 16:17:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <oxoluibsgwtga7nv7el2awyy6xarhyggxno7gey37y6yqp572a@ssnfr6uxyvp4>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-17-lucas.demarchi@intel.com>
 <20230424212052.GE10045@mdroper-desk1.amr.corp.intel.com>
 <rl4znzdiv3poheqpgfx4uvsdqqyg35fo2ydovy4jyu6y42smxw@fxffc223lmfl>
 <20230424231019.GI10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230424231019.GI10045@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdbfa0b-003d-4b75-4224-08db451a256c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BG73PtIWEYT7BE1sZjR/fCle/yUGHOvdPivRQi1zV0TPWo/BoRtDpyocSNb224zk7Dpo+AZHNUoFgII5ycQz8c3SFx3U2eZ2Sz6dOiHk60ru8I8vBTbt8WKYcPG9YK+o71wj1EpAju/dOkRg8tEanE8AGpkymZZWU3+wy3r426OQxzz+efm0xaGra6vmaK1UNZYYh9Lj8ip0B4TNTB5RfSMdXDvMfzMkXwvlABx1rrBTO5vXC+rjsnwawTh5oyOhaodaEo48xzIlxRDVttc3CI4HePYclwfl6dvmIaRUCUOs8KfvwvwwM8wRAHrNSb/W00l/qyVW4Eobkn6H1Kw1YDFPwAgWbDqoWFipFOEFGlUpEmNCD3BaSEJMsEQImmfU+mnqPICQBcizdJBEGmpAGNLbC9jNkkC2noFs5YThiFHxZQ5Z4kLO1Y2/EiwQtYTHrROs4X+3yjr+aFWbkad3HRdI2AcsjbQOnB0N52yUlVTYJAZHp6wMDaGWZwEBas2Lb4hwJgsc8AQXVTjLSRRfNT7Lx143KLhoEYR0878kh06u5GXgyv0htHrvgG1ATw9E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(33716001)(186003)(86362001)(9686003)(6512007)(6506007)(26005)(38100700002)(5660300002)(6486002)(83380400001)(6666004)(478600001)(54906003)(41300700001)(2906002)(6862004)(8936002)(8676002)(82960400001)(66476007)(66556008)(66946007)(6636002)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fTB2Q36iu6IuGwC1kKyoxayxz4Tk6jn3BQXj1RKS8xhzrgHtt+ytAHqZBB+t?=
 =?us-ascii?Q?kdRSbau82ZkPay6Iit1cxP5huzNkkyulKBTjRFSGOLHGN4feF0NOz99pFSXR?=
 =?us-ascii?Q?RyqcdeRczRvGQLjlqjMZPWqiHziINb/P+V4pne0bPGkCq6Eb7YR7NGToZsbZ?=
 =?us-ascii?Q?1B+SyQgY+GES/3REz41hNiXLVqivFWf+ODLSI7oUZc/hv4cjJTEIzFjemLGC?=
 =?us-ascii?Q?Kd/yb/EovLcGZtD3fMLhxCvwt4UJ4XdDKQjkFE8KvzYQSaNx9PpMzJ0kg0Lt?=
 =?us-ascii?Q?afq+l3HutO9HNTMADEqAlICuzQTsUBL7s2dpEWNl/brDgPr/ThRMej35V6Iz?=
 =?us-ascii?Q?a5q2NlW5I7ODiUung4OljTFwsFajqExJHcOKfgdHeUh78+C6dSY/FWYyUbU0?=
 =?us-ascii?Q?P2A4TnWxApZwnwOoqtZMTPDBHGBvNeMIdgjEolQIlXKurbEXfGD5idaOXfbi?=
 =?us-ascii?Q?aFRakzQtpeMhVbvUx74igloYq1Dd9RSr5aEVuqn5T+jV7K/n0y2rG1NjHaiR?=
 =?us-ascii?Q?OzRDr7+AqkTGd7B9y8SWJ0FHwVMVthjKTMqJxwxX0G7cC5p8rKw1H4OSNMtz?=
 =?us-ascii?Q?tiuBrZh/6VJ2v5HeBHsFymO2GJqieXkXq9eiZlthfxgBYJhTEM3g15/Ckr+r?=
 =?us-ascii?Q?NbDgLeFRVOjw0GXhsDgVG3tRD1oTipzcaAR7+u6jMP0zo3T5CLnX/1YOPW4/?=
 =?us-ascii?Q?RDHI3ZvKT2ZcqkoLacDYzYmpHKs2xfQc0bS6Dl5S/0vD25cjmbN+18lD/pVL?=
 =?us-ascii?Q?K3zxHW1kIoaU6GUhpiz0f406N7dUr8E6xurKIWSOapnpMrY8QSuYdHAhdlED?=
 =?us-ascii?Q?8VXk7TxbzqPcClo/+prnevDE1JB46XDzMjxV4Co6AwO+CDHNEqP9kioQl2dM?=
 =?us-ascii?Q?eg0Y3bb0T25/YzrKgSaRHiawunPjpsih4pz26M3cS3yvhY0Q64f8ctD90Kvk?=
 =?us-ascii?Q?1+WzElSSI0lfoYeYvkabFCZzMPqVvHXiR49viQ6NfcAUM3XA2RNTKsA+a1FG?=
 =?us-ascii?Q?4h2cvvkM/xSIbWhq76j80Jw5FGzuFipMLERilA7GsQDolr6VbIOxzMZe9NYQ?=
 =?us-ascii?Q?I/vHZ2bbgoa4VLYqWXg4wKsCCUsKivwyZIRJao1G6NmqrU223DCy3xd/4pIS?=
 =?us-ascii?Q?Ls847/lKWlr6b7F5+8g0O52knM1HPgUqbfn6r/leOUnmvyF1I6YAbJXVUUIA?=
 =?us-ascii?Q?8Y6hXdgTFUOIeTHe/TtieDP1OD8kQ7M8ajRo/9P6ni8WYzeGTuuNacBy1RNB?=
 =?us-ascii?Q?3haEUYCeCxBVULNj4agqpKn82JrANvtUUU6LBYVNZpjKOHUKCaiOHdgdFgYZ?=
 =?us-ascii?Q?DOfED/X9HaA2WE5P3/ssZr/p6WONuwBqEzGXwgVSPWhtXvBizqcNjYWtxiYD?=
 =?us-ascii?Q?7kmcoL3Sd47nb1/KuX53HXorZchF/ajHmHhi5YtLTRobSHEpN+d1acht6qrn?=
 =?us-ascii?Q?5Rfy+WU40NawvpvjGgnnlWepbNecb6vHaVJQLP1q12miVAi7Vq0TNRXuFnWl?=
 =?us-ascii?Q?jP9d4IY1VbwAih1js3lOWk2x7qJWGHaZEKmUnr3VKmvjsflTrT63wKsOxc3X?=
 =?us-ascii?Q?q/Y154vkzfFDpMWcB6bP3zQ39dGjKL8qxKYe++effkjbmyjps43yQIsEISwY?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdbfa0b-003d-4b75-4224-08db451a256c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 23:18:01.4123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aXNcxg+7i4pbTi+lvflTceRapabzQg1o3UqJPdBrfcyfD+lSdZqQGwanKjG0Z3atlzJiHpoAOBS4PeIVM5VE2KWsdR0SDOuUE7hfdLPkgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 16/17] drm/xe: Plumb xe_reg_t into WAs, rtp,
 etc
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 04:10:19PM -0700, Matt Roper wrote:
>On Mon, Apr 24, 2023 at 03:50:34PM -0700, Lucas De Marchi wrote:
>> On Mon, Apr 24, 2023 at 02:20:52PM -0700, Matt Roper wrote:
>> > On Fri, Apr 21, 2023 at 03:32:57PM -0700, Lucas De Marchi wrote:
>> > > Now that xe_reg_t is a type that can be used by xe, convert the rest of
>> > > the driver to use it:
>> >
>> > s/the rest of the driver/more of the driver/
>> >
>> > We still need to fix xe_mmio_*() to take this type instead of a u32
>> > before we consider the conversion "done."  I assume that's coming in
>> > another series after this one?
>>
>> My plan was to convert xe_mmio_* on a follow up, but then when I
>> finished this series I noticed the one thing noted in the commit that introduced
>> xe_reg/xe_reg_mcr: now the latter doesn't have a .reg field anymore, so passing
>> a mcr reg to xe_mmio_* already breaks the build
>
>There's still the issue that led to the creation of i915_reg_t all those
>years ago:  xe_mmio_write32() just takes two u32's right now, so it's
>possible to misorder those and wind up trying to write your register
>offset into a location specified by the value.  Jani mentioned that that
>happened a lot back in the early i915 days and caused hard-to-debug
>issues.  Plus passing foo.reg in a bunch of places is kind of ugly
>(especially since kernel coding style requires that typedefs only be
>used for opaque types).
>
>If we really need to keep a bunch of direct accesses into xe_reg_t's
>members scattered throughout the driver (rather than making dedicated
>accessors like xe_reg_offset()), then I think we'd at least need to kill
>the typedef and move to a 'struct xe_reg' instead to not violate kernel
>coding style so much.

in this version we don't have the typedef anymore (and I forgot to
update the subject in this patch).

But I agree... since it's 90% done, there isn't much reason to stop here
instead of doing the final conversion.

Lucas De Marchi

>
>
>Matt
>
>>
>> That left me wondering if we just go ahead and do the conversion to
>> avoid the uses of THIS_REG.reg or just leave it as is. More from IRC:
>>
>> <demarchi> mattrope: rodrigovivi jani next version of my register cleanup
>> series will retain the strong type for mcr. I also found a way to make calls to
>> xe_mmio_*(gt, FOO.reg) error out, even if xe_mmio* only receives a u32, not a
>> xe_reg
>>
>> <demarchi> so... the incentive to make xe_mmio receive xe_reg rather than u32
>> is actually smaller. I want to do a s/.reg/.addr/  in the xe_reg struct... but
>> if we are going to end up converting xe_mmio_* to xe_reg (even with the smaller
>> incentive now), then maybe I should wait for that?
>>
>> <demarchi> thoughts?
>>
>> <demarchi> to see what I'm talking about:
>> `git grep -e "\\.reg[^_s]" -- drivers/gpu/drm/xe`  (with a few false positives)
>>
>> <rodrigovivi> I honestly don't have strong preferences there... as long as we
>> get rid of the 'i915_reg_t' there I'm good... and a bonus if we combine the
>> mcr...
>>
>> Lucas De Marchi
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
