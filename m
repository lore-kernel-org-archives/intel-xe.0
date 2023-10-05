Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A8FE9271C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 17:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AACE10E047;
	Thu,  5 Oct 2023 17:43:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C9910E047
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696527823; x=1728063823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yY9UJm+6mos5iqRJrzDkFrjwwC2FDQgBsp8Pib5qaKY=;
 b=Y95vLA3gfyGCwlkir8EaM11tJ+hsA4FGeAT/ZbaojczkQ/E3Os368Ht7
 5I5yaQYGaj/qSl7yhAigSNVbtFlweGEYqu6wPITBKdkuN+NAj34GpxkMZ
 Ez2ERGYgEwDKO4g6WYW8b+0LYly0oAH9BSwaAePau6ZauCogm8wLi7KfZ
 TbXrHG9p4KpbcO2H5z/MHsnMrZfWpV4nEi4HcbP3/f0XltCSL00JHiW/Q
 58JIjdeRE47ON+t7lnAbjIFDlIhoaAovymg/PQ7LepwQOVS9ub2uIObCJ
 I5+PhnENOwv6Ybi8YA/ze2HRJcatxKN/iBnPYv9BELQq0buBQ3ghgQaMD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="368646508"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="368646508"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 10:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755545348"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755545348"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 10:43:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 10:43:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 10:43:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 10:43:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 10:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVTfvEF/bwz5XfxhTL2YpdKi6jRBhBMXjetmNeHiRy2KMpDhVllZ9Ocjs/PSuvOHMNETfgCTqmqmFBPnX2sihvBpVMIEJBeUL6vALpZnlX925qQimLerPJy3SJwj9tDlvk5Zl4tN6dhQ3Gf9trYgZSdLnoRRoahvwmA40iy5XdRAazvyJkBY+OBZ6kTuE2xeGF+qIv+nXG1jlf1vTrCFR/s+z/skCtJmsR60a8f1mYfh12PDzH6oWenKWkLnzXHQgLSjKA0EYXlVXZNtpaCk3kTcQ7qNdQEJD68DeQK2QQkOVWv8vN6z43txtZqoiOmk1aMV6vBkdVjvKg05CK/EnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2DznyUYIYjR/0Gdp6QfuiLN3AyuHECCAs2NPfimn28=;
 b=X1f/Xvx07ILOU/tljObe1SdIUrn2ovGPHNW4QFCNKj9e0y9bcKwiLRj4vI3Bjou9aHJi2xrKfyC6bBbJLlyVCyYdF5QjH9HF4W6sAjm5qf/cBgaQrYey8R40owJh/lFCrU4AvCe8U0uumOfWAJAyy1zEqkwnNpNmu3hpnJ7ytSVG99uPk8RTr4+/z5iRmkt7pTlBQ3CLUBhl0PurPK25CX18KFQTLwXPnxFrWuOdUPVm5PiA/cDEdi9F/qk6kazlxjHuoACV9t3rqZlRfHmBYbXVUN1MGH6k9nC4tp7z+Hqvja7bd9vKcQlgLExROhRikZNzUCLEPRTgqPfPuItKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Thu, 5 Oct
 2023 17:43:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 17:43:38 +0000
Date: Thu, 5 Oct 2023 12:43:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <hhrrv7bbnokmhq5ysapilnwbgszfzjdpqjxpcwdeyhakukduay@m5lt2qrgeu4v>
References: <20231004160931.3490464-1-lucas.demarchi@intel.com>
 <ZR2SMB3j1wZ6Oxqc@intel.com>
 <SJ0PR11MB586601A1BB6CB8FD858A358A81CBA@SJ0PR11MB5866.namprd11.prod.outlook.com>
 <bkn4zknwieodhmi7actm3v2lstt53qvhud4nnw3k6sh35kk6c5@xmkkx5xfo4gc>
 <ZR7Dwya2Oy1fjG/g@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZR7Dwya2Oy1fjG/g@intel.com>
X-ClientProxiedBy: MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 3022527b-8e05-483e-ecf2-08dbc5ca9b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JekvgtWJ03+VpI/HoLr0+kEyfOkb2qLXJ5uDVoVGlv3Zx7bxu7t9Uh5MVYPxI9/yf35jhrhFVTNQrsO5d8l4T4M2M1jWbNZCEQAcwf4pkpcW7C9b8sTLDDrznzU8/8FL0wIcEFJIRe4QVfn+vpcnRiDq7aq7pDbZILE0wPLL3kzr+4A6z6yTqX09pkJI3KJn/snOilGgSmhwcfdYUqgj7B9egeAHnND4v8tQOr/M+0mXjIo3Yevo25qRZJXLEMx6qyzaCy/04W1+1X6BIaH93UiG4okkXnS6snZ1JOvv43bBzLI156rQT5Rw4agTaO+vBimoy2bq5JI3HLkL7paLWP2PPxhcXSLNM4tx0bfCA8L4u6F1vDMtRLnQjuOi/uZjzG1c7pQ3lSOdhND6Zp7lIubfBNAUV5Roe4EHBPLd780nGEqTUa3+PWiOPO3baWQ80j+bEvrasq8PVMP/1E9QYplca7agW60DVydUfFwvgd05j+43NPrro9RWO2YlZmExIZkAiLmjDKtKyp63OXAWNGc5LZjxt+t/gUsbVcW910g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(136003)(346002)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2906002)(6512007)(9686003)(83380400001)(26005)(8936002)(4326008)(6862004)(8676002)(966005)(6486002)(33716001)(41300700001)(5660300002)(478600001)(54906003)(66476007)(66556008)(66946007)(6636002)(86362001)(316002)(82960400001)(6666004)(53546011)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iUS8LyPoO+v0+CHJSyjXA0LlIMwy5uzripj1A5iPv+oJDFn0YK9AwP7OEYnc?=
 =?us-ascii?Q?ykZNnt/6jmD1LKGDGaoZItmV/oQPjFYV5yD6XwQaRqhbY1RHtEFJGI0BZeyv?=
 =?us-ascii?Q?9zXeYGNmBVSzbkMjd0pd2ddR/B90XXksoGwMRhRl9PGf66enkd6kscu6BUyX?=
 =?us-ascii?Q?pDr6JxIYCSSEnQ4KAsZl0LwdySCJggxPpUQPYiQW0BsCPzeb7LnfEFGYsiap?=
 =?us-ascii?Q?2YLJ8lfGI1d1oexS/QCBUU7mcdTrsNAFQw8ejryfhnEP8AQGYsFNqQLLIGas?=
 =?us-ascii?Q?CyFw+emBDLPlfBSOvGFgPS+c0IURHmE1sqeKoncC/GIrtjO2cTgoou01zYVP?=
 =?us-ascii?Q?1vqPTD/qCKy+IMNOsi9Hf3yLMgvyGBt91k46lrMExbzWWLGP0nY0+OOSjJvA?=
 =?us-ascii?Q?qQ2Sqoc1poN1wEO4xU9wnzB26F6Ub9fto8rwzyKFjWVWmWKMs2aiQ983grFJ?=
 =?us-ascii?Q?kIEDhhZg16a7gp+lDVN5hoVsPTn5Xcyklcp7DkWvTmEsGI6QmMF/9/AeL6Wk?=
 =?us-ascii?Q?esRSt4GCjHqMET55UUx/7hIhHwzAjMz2j20tNpdGBI+iM7qiJjIN+P29e+C+?=
 =?us-ascii?Q?/TB6oJanZGN7M8vaJKxKB5qlQEk/z+b/yzo036hWLiVFfGEwZG+HuSP2aewH?=
 =?us-ascii?Q?G6i5W/Jxu7JabQqlFecfBtRxkA09AM8/QB53b/ot+xXt5MyrLMIAzd7BpPoJ?=
 =?us-ascii?Q?pMrWWcrJKgCCfeIahpZ7BRM7uykdl/ghf/cT7vPNk8I71J+y3ajpWOBNUd2B?=
 =?us-ascii?Q?GdFjUuVTd4c2PKfyG5rY7/yteTmloX3NTvZl0TMCEB54nm9ESnoPGjVy3Lng?=
 =?us-ascii?Q?qLl5byw+nSH+EggLjthd+nbwxRE95AcmQJna+s1p/DSyrRf7r1cOyQO/dly7?=
 =?us-ascii?Q?6RBc5LGzHuQZJHpl4mppJWPXecmLld67T6XlLaF/kx1shGvlrF9XQlMas9w+?=
 =?us-ascii?Q?A8sQ92Atpk/hwPrNOelpHJedqeGkiMjtiwnDJzVMrbVKi+vtN+WKMMUCku2W?=
 =?us-ascii?Q?HslqfRgOiEB0HXSEy0I6JSVSNe9KcSG8RhaFz0KdS4jkPvILbddQpqwsAg+X?=
 =?us-ascii?Q?jsdPNM4s4Mb7bnGMSMoKE5hnh4osCBag/Fwn5KPznuXVzQpL0M2YXYOpGFrA?=
 =?us-ascii?Q?59vzKpBh6gd3ofsKD9taIpp22TcgQOqjC+LBqC5bTYMyGsvpFGa9NQLapnNH?=
 =?us-ascii?Q?wfvbO+vl+VwKWvC5rwyiKGHrOP7DzrBDnpiYDzZWZcNw2zmXLNZgpriekSXI?=
 =?us-ascii?Q?xlE7t3zhL09er5dYfJp4fa3mJS75VN+FOvn8YN+hkV6Mq0ErdsK3jQnuTqbU?=
 =?us-ascii?Q?TFcGcdRrqUtC+H/ojORcrQFk0Qs8B7DJKwAZQWpLKLo8/rcE9dCQb/I36DNc?=
 =?us-ascii?Q?u/7wtGkiU84L0lALJ2fsneQiYa1D+DGJLNGQwgt/ESv27uM2XJY0riI0YvDt?=
 =?us-ascii?Q?GJMxTK2KzZOyN19Q3TuHwr4ELDzDLLclbubhCIFibvoZdNF13Fd8s8HKe6+u?=
 =?us-ascii?Q?7FlpN4+Y6OHJ1uqmuFo8z+InLuB6tlBEQwDvRWVOPZeO+KfK64r3hrBPpJGK?=
 =?us-ascii?Q?psJlvqlQAhndG+J7sNslRprcIpJL8kmNe5oAXamwdKJ8z/Pj8tJWpyNH72wl?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3022527b-8e05-483e-ecf2-08dbc5ca9b32
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 17:43:38.4898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2AmU4bNcGKZIZ/hwEy0LRX1WFhgZS+adFy0s/VZxSeV+L4MLRCVZKtp3n4gfsuWBF4ZgtMcC/Mitz6fBZGmqqqzYlzNZHN2sp3eFgic4SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 05, 2023 at 10:10:11AM -0400, Rodrigo Vivi wrote:
>On Wed, Oct 04, 2023 at 12:38:11PM -0500, Lucas De Marchi wrote:
>> On Wed, Oct 04, 2023 at 05:08:05PM +0000, Kershner, David wrote:
>> > -----Original Message-----
>> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo
>> > > Vivi
>> > > Sent: Wednesday, October 4, 2023 12:26 PM
>> > > To: De Marchi, Lucas <lucas.demarchi@intel.com>
>> > > Cc: intel-xe@lists.freedesktop.org
>> > > Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/hwmon: Expose power
>> > > attributes
>> > >
>> > > On Wed, Oct 04, 2023 at 09:09:32AM -0700, Lucas De Marchi wrote:
>> > > > Add missing static to fixup build with W=1
>> > >
>> > > https://lore.kernel.org/all/20231003222145.4090918-3-
>> > > david.kershner@intel.com/
>> >
>> > I'm not sure what the protocol is here, I'm still fixing up the other patch that I
>> > have in my series. Should we just drop my patch and have yours go in?
>>
>> Quick fixups like this could be sent individually so we don't depend on
>> other things to apply.
>>
>> I'd rather have this as a fixup (as in this patch) so we don't have the build
>> broken in any official release.  If 1 year from now someone is doing a
>> bisect and fall in the middle of these commits, they may have to adjust
>> their warning settings.
>
>Good point on the bisect breakage. Let's move with fixup this time.
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushed, thanks
Lucas De Marchi

>
>
>>
>> And of course, we should make sure not to introduce these regressions in
>> the first place.
>>
>> Lucas De Marchi
>>
>> >
>> > David Kershner
>> >
>> > >
>> > > >
>> > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > ---
>> > > >
>> > > > Also I see in the changelog a change adding xe_ prefix to the static
>> > > > funtions... that is not the convention most of the driver follow and I
>> > > > don't think it should had been done. Anyway, just fixing the more
>> > > > immediate issue here.
>> > > >
>> > > >  drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
>> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>> > > > b/drivers/gpu/drm/xe/xe_hwmon.c index 1deb5007e1e2..734fcca9f71f
>> > > > 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> > > > @@ -123,7 +123,8 @@ static int xe_hwmon_process_reg(struct xe_hwmon
>> > > *hwmon, enum xe_hwmon_reg hwmon_
>> > > >  	}
>> > > >  }
>> > > >
>> > > > -int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon, enum
>> > > > xe_hwmon_reg hwmon_reg, u64 *value)
>> > > > +static int xe_hwmon_process_reg_read64(struct xe_hwmon *hwmon,
>> > > > +				       enum xe_hwmon_reg hwmon_reg, u64
>> > > *value)
>> > > >  {
>> > > >  	struct xe_reg reg;
>> > > >
>> > > > --
>> > > > 2.40.1
>> > > >
