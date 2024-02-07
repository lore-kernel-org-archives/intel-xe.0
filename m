Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BC9C4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 16:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CDF10E66B;
	Wed,  7 Feb 2024 16:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMtTAd6e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EF310E66B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 16:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707324168; x=1738860168;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bAfgzjm5ZXvlX8T0BDE52r9sqffHAyeyTPHb/Pn1eMo=;
 b=HMtTAd6ee2909mb3cNrnoSRK26Hdw4OZPAqs2+RUQRIBaVAAIz+lDhSF
 mYgH57j3a6xX5ovkOvRKPpGVhdNelu5N4opFHL3wkrfQr/gYZIj+cv6cI
 D07KQIJ+9V7+nd7YKCZFXXDyaZi50jESFX0FXkqF2F+J7mfquKFCBFRaO
 YyFbpOUcy5GNSEJfPIW4SZOpEPOqWmei6QyaaC4M4UyOvfnIaj1lIVtAb
 sSIDkBqEZrMPhyb73tFRgKGQgJ7Qm1I7whZB8XSzLkKA4bKfqDz8OPoT9
 znf7EfTg0yKWV2TMkMJajPUA4ZS6gCAHoSCXEDJj2pPmStXCNq9RUMRiB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1178290"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1178290"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1405047"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 08:42:47 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 08:42:46 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 08:42:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 08:42:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsfYHy19KNbBj+qv0LmquixSyRl7mUbW88sg6lH9l4mngjmu46N516FHLTSNyi+h2SCCjMQBtSzm39T37JESwoyXEecRDz2cpxxMoOyZ3h8D23BZ+/OipXhFtJXpWgXHIO0Lo7Y7k9HnJXMlg68VKZQJmuFIjYf7g30pDI2fH6/MqpveTtnLoF3DZFaYJafReffPnT0scsMGixHFC0bqA15GwgARjDhCUSQt2VZ6gHvTjtacmjFIkzBNiiUQalCgSJy8jE6I4M2rCb83SkEAe3Tz4rYo0pu0Skxc0KGrfgrLn3EwUSwUQZZbyQI/5U/c7tdOfpvjH/5ysnGMi5RDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgMBhdR5m5qad6CzvBj/5HnWtAa7Cp0QKu3mi+RlO1w=;
 b=SO0Ys/h2LXCPSLAfLP+BKU41jZoZQXbjDD/feUWKIFAPxW7qBmt4PP0FhEIvg4wAxjnptXDk1ERbTQIRw3AzQPtLuh26Vknol3fwbdWyNZ9Wjvq17CHaj/4cpNT2S+rzwX2TzM0LsGNc5Yxd57LbBEQVRYE3nOM+bp8AXFDIcqSXDulAhpxNUqPaFArKDNs5ILmZA2zd1LAA1+4PzVQ9Avb8Etm7cP7idicO5ndUEDxQLn6NxUVHCVdysqvdzHoDPYlWoqdOOKjvTJUCclyOhfdmPSQg0Po6xeHwlRk1hnFoi6TEydJNJflhIeZpaAT0Vtmp88FggAoF2EKkzJ2gug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8352.namprd11.prod.outlook.com (2603:10b6:806:377::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 16:42:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 16:42:43 +0000
Date: Wed, 7 Feb 2024 10:42:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: John Harrison <john.c.harrison@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, <intel-xe@lists.freedesktop.org>, "Matt
 Roper" <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Message-ID: <zcvxg35dgst3vffu76v532dhl5lob6ilpi3hktg4ptnqc6lsbd@dsrjrmgk2kdj>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
 <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c23006c-41b0-4032-10d0-08dc27fbce9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCmH0y6mSHIZGXP1zrzjJdhkRh60DM+ohU2jY5LraDiSC40ju1jMYXVImR3gMRQw6XbzblGoydn3p2IpyPaimvgPUo6xPSg7uOofMtCAmfUZImVNXdgWzG6TBI7sQLRWvYtWPvY0ppBnSg+BwA3LxDGJlmYROolOHaxwZiO9BvI76HJ3OuOs1lT75dp8BAvNW1fnvMGPZLgdte/1RGvLoArr3s8kHjUGn5NY3wZNZ2H2B3MWbPmEE0xBCnOYyuWM0rNBHW0CZnFacXhPaoayGntx7xzZS/WeHdO3DCbr0SOZ3rPnap/CRDshfBK5zQDEgEh4U8OfdnIK+wk3wlpF9wqDFge9Yr/iojZVvyzc+3omMrtv6mwwWgn79xT8XjrSxIqcROoO0hdc6fGmzvEvCqSvwM9sszoI5FqTS1qxVOhpZB7cxlWkxWW0vmwx2pH7JgbrXlTIdCR+ZqoXhEkS+vNzadb6pQzAGgxaXGg/mRLYwsSt9MpQ94vcahxOelcDbUVnAwnf4MMLWZiUrqwWCsjjUczLSSoFa4CXo0ovA8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(39860400002)(136003)(396003)(366004)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(83380400001)(82960400001)(38100700002)(41300700001)(66899024)(33716001)(316002)(6636002)(26005)(66946007)(66476007)(66556008)(54906003)(86362001)(4326008)(8676002)(6862004)(8936002)(53546011)(9686003)(6506007)(966005)(6512007)(107886003)(5660300002)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4bvenPTo7YJ8OazQSLJE33abw1Os/8kB6/2NKNWzNRRpXSiXo+Rdzl2IzdDl?=
 =?us-ascii?Q?gwj6DcgjEgI3hiLjFfMTSNSjWWxiOn84zuMLzT7UYim3tjoFjMsog/DOeXzj?=
 =?us-ascii?Q?sBDF0YIKEqovoO87yPRibvI5ggzB7fpvxNohPThQqZjckPPmy2+E8SGRKfPX?=
 =?us-ascii?Q?GRfZUNujjN06WkhZctoYjN0CRr4z5bxw7kOmdeKpDkoN49dR7a5wCmGfqUmR?=
 =?us-ascii?Q?hiYBrBNDm43a+WbtgMWKg/qsKhX2/qqzZ3VPS4WKtPRmsOEQt5frxFgGU2vI?=
 =?us-ascii?Q?LffmfSz9veVBMsRXlo3vlWxCsDm+gUpgyXkr18CV40w6TVzzD3d1gmFfMO+9?=
 =?us-ascii?Q?a4iw/EUXnp5XdJVKzXtLj7rd3YdBHfxxYreeADukBQMhnfBvBVHYVKFPTjOg?=
 =?us-ascii?Q?fN3AUVP8M/NiW7R13HPMJ5nd1f3SlDfESx7lhU+MJSTKnPCF2W+qQWe5pbpW?=
 =?us-ascii?Q?eOqVIvVJH4RVlzp6btiX01HdFLVpcElcbaLKWKtJZ1eudHXICSw6xgv5iDBE?=
 =?us-ascii?Q?9rgTUP27Zdp+NXnnDjL9YI4a99vBZ6ucLZWhA4pCn5zzBL01ks72MziAK9JD?=
 =?us-ascii?Q?2SkVY6CSwr4NXUfZJ9K2QfWQIQcgGkrolLWqROJCtbvZCMIGXwnMbNNTnz/z?=
 =?us-ascii?Q?YUYQmxyXMd7FlkOaoL9pDAJ4/+gqj5M6ZCr+lmxoq5/2nPdoj04Bc3M9mRFU?=
 =?us-ascii?Q?vn7SJvPbw9sB/cKRu3icn+IGGtYlzH4cRqPZevAwetBROg/oM9qn2ntT1bq2?=
 =?us-ascii?Q?gVCkR8be1i0m9b3Ytkqc+J7dxL9mgHjNGSdK5Dk86UreVRs+SWmFh6loy5LD?=
 =?us-ascii?Q?cvCPRdxhiQx+wifg0KDqcKrihpgxohm+p4LgeUnTVHUr/l5cMI9sux8TEGhg?=
 =?us-ascii?Q?nZKNmLwKpHd6ghj+f4okHzrc+ofJCmxiLijMWTxTe2yAth0+iuV8UhViXdxm?=
 =?us-ascii?Q?kEj7b2GGoCJm8SI/3tPDAC7HDp5meYvod0r9bwqz65F40F8Tsg4os4AL4u9l?=
 =?us-ascii?Q?iNutg3Ui11X02p3CQyqcKcUsVhlgX0gT1XCjmxlLkUcCswC/rWJ7cbJ4fUE0?=
 =?us-ascii?Q?N5a8AvEQEJXIhOByfjHPqKYugRj1WYFOgRD3JrNLNRPoL0dnRSMuNhTdYIJ8?=
 =?us-ascii?Q?aHprTLyqQDwlsbs9pKqP4vjAMWM791z576z/mSJppLhDIj8XmjBVSUnEbtZg?=
 =?us-ascii?Q?VkZQ65Ufhvsldx3k/at/4/ZqOZpFXyyR4Sdx18+GRDxkkZg2pZzBeoD39SLl?=
 =?us-ascii?Q?YOiCJwtaYpr4ni+zaVX+CXsxN/xS3t0YVcj9cAZehJIifQNBEHKnLYnrNdGm?=
 =?us-ascii?Q?82jvHaWBYheyxDZ8bZp954hoh5lWbBgXjn85ICnZtdCPhJs8lJs7eJA+keuI?=
 =?us-ascii?Q?8AkhbEnV8k9T3I+CIHIikHfcqGKTXeWZpPXOnRuzB6dSUCPxi9SwDvgDn/e6?=
 =?us-ascii?Q?U3e0OEH8mjpbvwGUVsVtHMlnbqS3ir1K3D/j2JKPaXSPFinPhi8gAi4cDBmQ?=
 =?us-ascii?Q?Iu/caeRgmbl5FvUQIVyKqRIFVFU+Hyr7q/+DSVzbj8GjlUfiCZhgVuh6es10?=
 =?us-ascii?Q?HU7mTMiaIg9LXiNaIkXXODpC9qwo/iCdM59l0aZ74ryf+7l2k5l9crj5l+lQ?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c23006c-41b0-4032-10d0-08dc27fbce9d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 16:42:43.8853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XK7uKDPiEG1m/8+bineERYJLMY28+i92m3Iq9/aUpISvUfN9r6+EXtkbmBCMqpLVSkol/DDoBJdYwoFLsjVogUdwpnQxshm2mXKtnwCdwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8352
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

+Gustavo who is dealing with DMC firmware lately

On Wed, Feb 07, 2024 at 03:30:59AM +0000, Matthew Brost wrote:
>On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
>> On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
>> > Supporting older GuC versions comes with baggage, both on the coding
>> > side (due to interfaces only being available from a certain version
>> > onwards) and on the testing side (due to having to make sure the driver
>> > works as expected with older GuCs).
>> > Since all of our Xe platform are still under force probe, we haven't
>> > committed to support any specific GuC version and we therefore don't
>> > need to support the older once, which means that we can force a bottom
>> > limit to what GuC we accept. This allows us to remove any conditional
>> > statements based on older GuC versions and also to approach newer
>> > additions knowing that we'll never attempt to load something older
>> > than our minimum requirement.
>> >
>> > RFC: this patch sets the minimum to the current GuC version (70.19),
>> > but that can be moved one way or the other. The main aim here is
>> Ideally, this would be bumped every time we update Xe to a newer firmware
>> version right up to the point when force probe is lifted. At that point it
>> becomes fixed and we have to add the version check support back in for
>> future w/a's and features.
>>
>> Get's my vote :).

Yeah, but see my other reply... I think we will have to wait the
firmware being available in linux-firmware for that.

Also, let's kickstart a discussion on our process with some
possible changes so we can get it documented. I think we have a good
opportunity here to start adopting the
https://gitlab.freedesktop.org/drm/firmware repo.

Rough idea:

1) use intel-staging branch with tags for pull requests to
    linux-firmware, just like documented in their readme.
    IMO the naming is rather unfortunate since it would be
    good to use it for (2) below.... but since it's already used
    we can use something else.

    this would mainly replace the use we have today for
    https://cgit.freedesktop.org/drm/drm-firmware/ , 
    which could be retired. From  upstream linux-firmware pov the only
    change would be the remote location and that we start using tags
    for the pull requests, coming from a single branch regardless of
    the firmware (guc, huc, dmc, gsc): intel-staging. Once accepted in
    linux-firmware, the branch is fast-forwarded.

2) mmp firmware versions are only ever pushed to a separate staging-intel-for-CI
    branch. There is no pull request in the mailing for this. We can either
    push directly to the branch or create MRs in gitlab. CI would start
    using this branch for the extra firmware for platforms instead of
    whatever it's using today to process the pull requests from the
    mailing list.  Or whatever it's using, because I don't know and don't
    see it documented anywhere.

    The patch on the kernel side to use the mmp firmware is only ever
    pushed to the topic/xe-for-CI branch since a) the firmware is coming from
    a non-official location and b) end users and distro packaging
    shouldn't see a warning when building the kernel due to a possibly
    missing firmware 

3) Raising firmware version requirement for past platforms used as
    SDV can be done **unless** it raises the major version. That's because
    end users would start seeing the warning that we avoided in (2).

thoughts?

Lucas De Marchi

>>
>
>Mine too.
>
>With that:
>Acked-by: Matthew Brost <matthew.brost@intel.com>
>
>> John.
>>
>> > agreeing to stop supporting very old GuC releases on the newer driver.
>> >
>> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> > Cc: John Harrison <John.C.Harrison@Intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > ---
>> >   drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>> >   drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
>> >   2 files changed, 16 insertions(+), 34 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> > index 868208a39829..5e6b27aac495 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>> > @@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>> >   	return flags;
>> >   }
>> > -#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>> > -
>> >   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>> >   {
>> >   	struct xe_device *xe = guc_to_xe(guc);
>> >   	struct xe_gt *gt = guc_to_gt(guc);
>> > -	struct xe_uc_fw *uc_fw = &guc->fw;
>> > -	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>> > -
>> >   	u32 flags = 0;
>> >   	if (XE_WA(gt, 22012773006))
>> > @@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>> >   	if (XE_WA(gt, 1509372804))
>> >   		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>> > -	if (XE_WA(gt, 14018913170)) {
>> > -		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
>> > -			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>> > -		else
>> > -			drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version expected >= 70.7.0, found %u.%u.%u\n",
>> > -				version->major, version->minor, version->patch);
>> > -	}
>> > +	if (XE_WA(gt, 14018913170))
>> > +		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>> >   	return flags;
>> >   }
>> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> > index 4714f2c8d2ba..e5bf59616f3d 100644
>> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> > @@ -296,36 +296,28 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
>> >   	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>> >   }
>> > -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>> > +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>> >   {
>> >   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>> >   	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>> >   	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> >   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>> > -	xe_gt_assert(gt, release->major >= 70);
>> > -
>> > -	if (release->major > 70 || release->minor >= 6) {
>> > -		/* v70.6.0 adds CSS header support */
>> > -		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>> > -						 css->submission_version);
>> > -		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>> > -						 css->submission_version);
>> > -		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>> > -						 css->submission_version);
>> > -	} else if (release->minor >= 3) {
>> > -		/* v70.3.0 introduced v1.1.0 */
>> > -		compatibility->major = 1;
>> > -		compatibility->minor = 1;
>> > -		compatibility->patch = 0;
>> > -	} else {
>> > -		/* v70.0.0 introduced v1.0.0 */
>> > -		compatibility->major = 1;
>> > -		compatibility->minor = 0;
>> > -		compatibility->patch = 0;
>> > +
>> > +	/* We don't support GuC releases older than 70.19 */
>> > +	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {
>> > +		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
>> > +			  release->major, release->minor);
>> > +		return -EINVAL;
>> >   	}
>> > +	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
>> > +	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
>> > +	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
>> > +
>> >   	uc_fw->private_data_size = css->private_data_size;
>> > +
>> > +	return 0;
>> >   }
>> >   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>> > @@ -424,7 +416,7 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>> >   	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
>> >   	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>> > -		guc_read_css_info(uc_fw, css);
>> > +		return guc_read_css_info(uc_fw, css);
>> >   	return 0;
>> >   }
>>
