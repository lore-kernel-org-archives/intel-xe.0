Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE27E7C4E2
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 17:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C043310E395;
	Wed,  4 Oct 2023 17:39:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618BA10E395
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696441139; x=1727977139;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BEtp7qlhc5kjd7eiAjVBIQ6zaFgfDmju0abLxC/4KXU=;
 b=g0gFt73TBWPfW/ZtTYWswo68x8DjQRLzGC6oundiElISvCRXMMsTz6BX
 mSYqPxm7yUWP+pfh+QPcrF1K9gf6Yz2vhkxw+Wgm/qaDQNqNr+mCg4IyJ
 sNGpvj3hbz2z/l6WKMhI5fNfStc3G0u6x+9Ml7HTsp+k28gvyIlCtTT3y
 gSuOV0L+XjrOjLp2q0m8pVmZ3AxLlWONXUKO3Hi21voK27cujVACyh+4s
 sfHKeyvq708LRRPJgi2DKZW2mZ3Sw4G1NIYW1C20tGRSh9zS6i1LvHYu0
 uvX8IMFPt1PE4PNQbLGIo8MOcixf2Zzt5Qbh+d/Mw9ivPjC6iuzK3Ec3G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387116838"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="387116838"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 10:38:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786612311"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="786612311"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 10:38:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 10:38:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 10:38:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 10:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYkFNQoK2/+L3wEatMudu1QtE5b56CQgqXLa+pywLnyRhG1T2whPU+D+NcdFZwN6d99y1fAy13EQyXkCCcjRTFCarmevgSLZOQSbujQezA0m/WKjUl8+zGyvE6KcS6Ewde5lYryjYqJg2Z/uE5wYKB6t6x910SWkAAb4VzwOwzOqh5diG8jwdRqfPDY+qQd/2W5DK6q0SVoGcGysJ9w7r9R91XoNxAngdTbtcJgQdFTtWJrWZpd63dLaaTqpk5XlK7pgdyJK7yoC57X6xfExearaud8/n/1uqo/1A7YKz4fX073CMXp83dMBYE4YxoY5T4J1hT4GfcyUhRRkiZrWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZJ1IF+8rxZvgtHTcB6/HxgpOLzbb5vP4suFsSMW0i0=;
 b=m4MHs7cZnTrd/tm7mWDdym5wB8IObuS2mZaqhH+FWZY0mwUwwoMLfX8yJ8kBEy3XfNTvGiVyIKfXK9XTGXc7gyj73OdRnlZdRtaawf3nXC3N+mf8ZxgpsVsTeQJv1OZPcOUv51jqfyvkVijJiHplOUx+yK6k1FC+LLrWuF+pbfA4slBaXpcdSTUoppNHvoLxfvheONyWQH8op8SPD4P3WKUCcEy2Qcb8aaRCQea1Gx5U1eKIs0xiD1o1KxanSbOvcwnlgR9/Gv1lTgB0nnQdWxF4/alsFYZh39nXzDV/4DqhZoRuUcp2KRIltszKTqNKVoJgB6073Ye+nTEPyapb2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4690.namprd11.prod.outlook.com (2603:10b6:5:2ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 17:38:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 17:38:53 +0000
Date: Wed, 4 Oct 2023 12:38:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Kershner, David" <david.kershner@intel.com>
Message-ID: <bkn4zknwieodhmi7actm3v2lstt53qvhud4nnw3k6sh35kk6c5@xmkkx5xfo4gc>
References: <20231004160931.3490464-1-lucas.demarchi@intel.com>
 <ZR2SMB3j1wZ6Oxqc@intel.com>
 <SJ0PR11MB586601A1BB6CB8FD858A358A81CBA@SJ0PR11MB5866.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ0PR11MB586601A1BB6CB8FD858A358A81CBA@SJ0PR11MB5866.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:303:b7::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4690:EE_
X-MS-Office365-Filtering-Correlation-Id: e469ff32-12c7-4846-1854-08dbc500c6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JJsU3mroabDD/O1mDSW0Z6DuRmoUt77xa+GJbrlgdNCLYzCSVXVEiz5lRhhoX0OEQ7vGLRF3e64x/lqSDTx6L078pgZVRUI6qTFKVAg6QsAiMFCNVo14Vd6x1U94SP/kz1NiO024rrEY1tsdZJyT1Vqtmz0tmXAHSUue+6908JrYvF7jZfgJZ7YcBpRJsKGZK/5s7VxnolVPOJq9peMCcgvLTNPaEcbc9KKhHXw3DcYOHQDFuCvTHfAZgwlUT1FqPBfUpqgf1Sc52sJSH+3uPDv/Ik1hf6YpS9smHonM5tp2bKgkRbN8hYNhDG64yQhZod0Fo8jze+pqzpW/7B2hkTdU34fj9H6WLuDsZ99lqqj9LPPIZU1dC7oJw8gzx5rE15dI7+Gx9d+kLcEJsmhLY5OVB/jbgoZAM1b76jomAOf+yiwLp3EnJECbUF7Lwzucl3dKW0JhloE5eSzVBGyku+ARYLsSCu2SCw2W6B+o2lG7+OaQqVJg1hd+EgABtSTCKN6w3ztBEftzU6V4LJoE0qVecqujFresxXcpGT1JWI4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(54906003)(66476007)(66946007)(66556008)(6636002)(316002)(41300700001)(6512007)(9686003)(6506007)(53546011)(26005)(6666004)(86362001)(478600001)(6486002)(966005)(38100700002)(82960400001)(83380400001)(33716001)(2906002)(6862004)(8936002)(5660300002)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rsv6iRHxksX1IYBZpAEAmmNH9aOSSDLrOVt4KJOGzM8ckMsB01FDOXz1Xi9m?=
 =?us-ascii?Q?vURkL2YEpSLX6h/HfxoUZSaZM+/Ya4r/AGIxINrYpupA3T2hphpD9PsgZr4p?=
 =?us-ascii?Q?aTLTy6lHQWk25+ll0mC6H9jBG9JJCdo/o0C4xoYM8mmeFvz7Zi03W3F2qIcS?=
 =?us-ascii?Q?eiNnsaL3ppdXFdw2oU7++FjwbybjVT76MATzTYNj3Pwfl+L/Iq2gc0Euc0n/?=
 =?us-ascii?Q?G+Fs9h0ZS0wYQyHY1pcjF89+62d5xjtoUK48AMXY0bmGfa6zoGi8CcXPSfqy?=
 =?us-ascii?Q?6o3z7YbS3E5uNKx5PjDx//Vn6PA8JK7gee6QUtEaYKA9maDcwCutWk1qllng?=
 =?us-ascii?Q?na6Xm6fmWWkeE/NSxsTIxHluV3Hf9u+GucRfS3qPO/pTxO7AuIDMUSo00tRX?=
 =?us-ascii?Q?udgTlRngWoF8M2BnLXp0NQvNBLOWBnjcHq2r4XWKaXCyEWMZGYFNIhmCeAsp?=
 =?us-ascii?Q?wXGyCRlEg/hS3relRo8huzDBQaapsYizFbDG6BYHpBhH3zqYOFEqYrMunLzz?=
 =?us-ascii?Q?12H7MIfSMXjsNw5ZBGDgQjA8pcg6Y+erqhnkN4w2xG4tzFHrUNLJD97vAMoX?=
 =?us-ascii?Q?pKc7aBqD0U37TyTuW1Gn6gAltQrPS8riYhuGxOpCFH5WLzw17/1qyMqz6c/b?=
 =?us-ascii?Q?6zqsfJLHP47ImE08Fsz67RyoqtmUhq77IBJLzZMk0T7Qy/owxWNs1E2gbqYU?=
 =?us-ascii?Q?qfZ8v7FlJgFdxothA1glHMK0SIxtw2Lw7YGkpquVoclLHiTpiB5C7duZCuD8?=
 =?us-ascii?Q?WWBIs4fzaF+HmpeGH6CaJRs7MOaK7GU0sas5PEXSUu29JI7GefasjNweljFe?=
 =?us-ascii?Q?L0+hZl+Vi4+DqietbuXDoyZvCPCebEfEJAPBklpgmTAmugb8FOpxUxCUJGDh?=
 =?us-ascii?Q?pSY9RIDdpCytvPhwrqGH2u8e4hgiWCY9S57olzPzbMBgHn9T7FbVYcTCosFu?=
 =?us-ascii?Q?D5460e62/MsHs69FiqUKD7ToEFLFofF/jjRFk4/0wCF+0H8F6h1bGygBsNeM?=
 =?us-ascii?Q?p3FjgrPRIdrA0f2xE4379yPkQuhJ0pVNZZlhA7gGN1azTbaA/+NjbAeYYQCk?=
 =?us-ascii?Q?yJaIE8cX5GyRibxNKy35lJtq9mqHLt7KqEgBT8z7XJv70BZ6Py4ZnBWCfqWy?=
 =?us-ascii?Q?8/r0aTwWyJh/fRlV0veUaB/1XNEhUegqJmvvtRv2uguHBqFFNTa5+HGIUWj5?=
 =?us-ascii?Q?QAcvh3OnQWmWZjWk8UnmSUjaVmymAp8d/3BROYCxGZSdcl0a3zH4GwPcNHh9?=
 =?us-ascii?Q?gQes8lEwI6PxgFrecTIBgaapAuR8NIEz8RzA6lui997GqUz0grO9ejoHvylo?=
 =?us-ascii?Q?ODRdAA8mzb0zqwp4+NZR+pv75Vo9rzmpQOCIOFVNPWphYdghRATEnovkEdEP?=
 =?us-ascii?Q?e9snFOr1MVrjJA6sF7rj9cNohbBqk2kZKneUQhuwi2AGG6VrYcn5EdLEDNUq?=
 =?us-ascii?Q?A2uI2rfDxqrfz4i1EYx5yCJ9aIZqp1UDHJ7YbUsNH/qYRbxG2tLLDRqb9i2y?=
 =?us-ascii?Q?5rRoOaAc40xIIhWS05RvXgnF3uVQU9JeiXN9FW5lDfyCAUNH46HD/dCx7kNr?=
 =?us-ascii?Q?Z+NurYvHX25C5Cw5lR52kxR6W8xznk66oCSTnW676LkQzg1OuTTl43s33g/I?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e469ff32-12c7-4846-1854-08dbc500c6cc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 17:38:53.0477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqxc3705bqvToBM4xgM+oMhUJO1ndYdnOHZn2kLArT4kmoDVsEk3gkpWzJ2JPtJ32D7T+xq4F+AZqwxyLxN+w+8eKrXqwXuAwDpPHlXKA24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4690
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power attributes
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 05:08:05PM +0000, Kershner, David wrote:
> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo
>> Vivi
>> Sent: Wednesday, October 4, 2023 12:26 PM
>> To: De Marchi, Lucas <lucas.demarchi@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power
>> attributes
>>
>> On Wed, Oct 04, 2023 at 09:09:32AM -0700, Lucas De Marchi wrote:
>> > Add missing static to fixup build with W=1
>>
>> https://lore.kernel.org/all/20231003222145.4090918-3-
>> david.kershner@intel.com/
>
>I'm not sure what the protocol is here, I'm still fixing up the other patch that I
>have in my series. Should we just drop my patch and have yours go in?

Quick fixups like this could be sent individually so we don't depend on
other things to apply.

I'd rather have this as a fixup (as in this patch) so we don't have the build
broken in any official release.  If 1 year from now someone is doing a
bisect and fall in the middle of these commits, they may have to adjust
their warning settings.

And of course, we should make sure not to introduce these regressions in
the first place.

Lucas De Marchi

>
>David Kershner
>
>>
>> >
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> >
>> > Also I see in the changelog a change adding xe_ prefix to the static
>> > funtions... that is not the convention most of the driver follow and I
>> > don't think it should had been done. Anyway, just fixing the more
>> > immediate issue here.
>> >
>> >  drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>> > b/drivers/gpu/drm/xe/xe_hwmon.c index 1deb5007e1e2..734fcca9f71f
>> > 100644
>> > --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> > @@ -123,7 +123,8 @@ static int xe_hwmon_process_reg(struct xe_hwmon
>> *hwmon, enum xe_hwmon_reg hwmon_
>> >  	}
>> >  }
>> >
>> > -int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum
>> > xe_hwmon_reg hwmon_reg, u64 *value)
>> > +static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
>> > +				       enum xe_hwmon_reg hwmon_reg, u64
>> *value)
>> >  {
>> >  	struct xe_reg reg;
>> >
>> > --
>> > 2.40.1
>> >
