Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D787EC47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 21:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D78C10E754;
	Thu, 18 Jan 2024 21:46:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8BD10E754
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 21:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705614394; x=1737150394;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ef0frjeoeIblIo2a0COIPrUigDr0mhuRoBYvYo5O+b8=;
 b=amzIcgYK1lKMKP26jc+eBzU/R/4aak+d9X7DWYdNPrW11fS8qx47fJey
 mFgqWd4ITLX8FiNUy2QmN9+43aJcVdglETzOYO9RnOCIAbhuT5jmfaeVE
 JUrx4qTgkU9CDrH53NwfDOjNcW6EpP5i9gPT9BjZT+5XFXNm8JdBhk7Ge
 0+JCOx2itk6+FXRUI0AXaNfprXRlry8dYixE9Y6b2q/A/v8O1Q0EFtegA
 +Rm9sOhv8f842DhbtySEvRsKiG4jLfEofE54DkMXeTL7GG/n7gMHja1Y6
 WNredTkrCSrFLpWAIDqyCI5czWYuLD+49QB3pOzVmZ0FmH6vUD87PhUYn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="404345794"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="404345794"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 13:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="444688"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 13:46:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 13:46:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 13:46:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 13:46:29 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 13:46:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kik43hUfq2vaLbkHqGk7pSqoIBoJVbL/dItt4HRMHS9lfQlN7XobDJEFbYj1vyku4/yq0u9pK0SYgpQdkd43ohEDprEPF+n3mjnBY6t3HPmvYnxJVfc8wxMyJCekYkD21cOkVEXEA9UuxUWk3M6f+LNDGhz7GBF7/DKs45OuNf8AZQzZWhKjv57xFjZR2aMfNiPPrdVGwLOq/SZqOChyrPDWmJtvB8Unsjr1m9YoSVGzZCK5fHqfyiTapfqK+ALMl/2KHW/2yq4Vq8MIsG8UpQgT0zJYN5tOqvTU1XWRGm6ZTKrFeqNIIUQmBvrGYuCzhKTLAB1mVvBkON7rx85HZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXrYtao4OOhHPYnUQ99PAKbvM6lRQhJtcOz59rMngE8=;
 b=Rhxg7Pjr1OBuNPhxaVDunFYciaPEHlaTFjQoVQZ4QQhgj+BSIgbc5/regMa7cjbp9jwgUS/Qyw+zBQONOOhw/ora+COzeG6XF3TvCE7QXbsnHoqU8sWcNdf3OdU1WUFIiAXMQyMUC3WXocC12WYPhOjT/vzptg4PhBZj1SFb7aWSG+NelAV44LntML6xoTrqFYen5Mi6QEi0ft63hf97rPSH/dCLcKzBZpM8MH46WVtjxSwu/6L8GtUu4bb3YNHU+yPX3n1atFAUwyli0d/0PZI/h1QGyaA32NRLRCQ5V3ANnohP9A2qLYXysutStHQUhWo2+e8vvv5T7aBsxg8pwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 21:46:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7181.031; Thu, 18 Jan 2024
 21:46:27 +0000
Date: Thu, 18 Jan 2024 16:46:22 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: Re: [PATCH] drm/xe: Do not flood dmesg with guc log
Message-ID: <ZamcLlCn7NbCJmtb@intel.com>
References: <20240117204059.345143-1-rodrigo.vivi@intel.com>
 <ztv76j5a2333n3sdl3h6nuulqcdscqcosambxe62rydprzpepz@mitp3w4jgb2o>
 <Zak2LTfFOPRulNje@intel.com>
 <osoxittwh6wna5rq3awbvzddqp6dsggbxg5xrfgcmft3bcut6x@y4vfqvgb4kw5>
 <Zal3oznvaamLHv6x@DUT025-TGLU.fm.intel.com>
 <umt5wovebemjsdu64vzskml7u6cn26isgxkgyzs7dyb4yjipwe@gnmq5lt6tf33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <umt5wovebemjsdu64vzskml7u6cn26isgxkgyzs7dyb4yjipwe@gnmq5lt6tf33>
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: e472e26c-471d-4740-3085-08dc186eec65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oBuViYykhuuPKHuxymI41t/Zx1Y7JmFky0NxjVuFxA4PdEewI4IzZAD7nyD2pUAMpsNOrm8I9bDH2HSm7ZS/nqA97qYaOVEbnxE5raIfhDxXWTkDq2hHfp4TwJ+0E/cDfweVRxtkjSng/yz37SqFdK1R7NsRjb/7eKX5CfrbKLsvsFUY1NUUxfcsDtUU0wkHUQNYqMYG3YrjIPTqs2dZAfnLDOs5Tw1rryum9j4IHoxvJ7jE20Jx5+KOKhz5tSVhI8lt3RKe+eB27GhfBJm4BnHA0P/9jfO6lMN17GV5eL2lujzs7vI+b8dxAZ5lJZG+maKoV7Y0GtMh18E6FOBD3YKMKgR4jzPNGczeYjE7CU2HzASWOOnzTa/h5EEXd1tA9xATq6cAYJtYoHTlWHr7HlWm2ShEkeUuiIq2QagYLXpWMtIgl4agOKXVZ2N6MflTZf1D3PgqRH4qkV14kajA6CkS0MlBTJvEqenmIWA0XErVlxs2WPvyplsgrFs6mF+HKYHS9KLph5Q+3hvCJBcyYg3IWIxinN6/APVnurld4RBTmcY2vL4E48+H+dQFPXur
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(39860400002)(376002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(4326008)(6862004)(8676002)(66899024)(38100700002)(8936002)(44832011)(316002)(2616005)(6506007)(6666004)(2906002)(41300700001)(82960400001)(478600001)(86362001)(6486002)(36756003)(26005)(6512007)(66556008)(66476007)(66946007)(5660300002)(6636002)(37006003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jkWE4pO886D/FdYrPb0+dOazzh24q+9yo1ChFmzuotSOHS6KC4WsBAOBfa/T?=
 =?us-ascii?Q?MlrfujwQwUE1KT+6rOR9o1m6B+pH4Yj0WDIcfJ/tw1dEFJXdHvEewQCYo0iY?=
 =?us-ascii?Q?iG/aK1lX/JWymB1QWSce3lBP4rcPUTLaL6fHZKanwJQTQ4QuEHelm/o1VdGB?=
 =?us-ascii?Q?+tOWiJYmPMzQDdysWCpJJ1H3+0YZ6HwryzGGBoEJ7+/1UVxobTxrBlq/GyJJ?=
 =?us-ascii?Q?K2ZzVC9IBTeNohGjlxg1t7LCUwgrBlIfe9+NNJ5OcqunyliUkQvbzYABe9dG?=
 =?us-ascii?Q?q53/38osGPqeF5qbN4XM2QiUFDi6ZlQ0z5anWDMBVAQLheDofi2MjlgXB7/Q?=
 =?us-ascii?Q?7l07obD14W75nJm1xbp8LI6FfndLqzjVF3DI9PRHdrvqyP7KPXOC5yZZIsMs?=
 =?us-ascii?Q?amRXjLj4XvVcXeTwEILIKFbHlHeo9NZY0hNN2k0XGwhwO2tZpixkmGUDGZt+?=
 =?us-ascii?Q?9z9igH7rMCIhs2VOB9MoK1JiyxEi7NM6An+rvNzgsUuSBnLC3qlz3LGo9ato?=
 =?us-ascii?Q?5SVjbMR3eD/qAFsgP/nMEmcwJ3lg5nh6SOmctyYAot98WoCSyL09JoeSgP9G?=
 =?us-ascii?Q?KiwTO5CNHyf7gNPJerGLSi4+W/O8B8nOf5goci7lKg0HwfCoAqpVjzqd7/PC?=
 =?us-ascii?Q?W92DG6mjsBFR9qMuHdC9vb38aduQ1TGgySnVd/tZnP1ffSUugemcE5KhMCRB?=
 =?us-ascii?Q?ylnbxC9uZqnZRx+C/aLuiM1wrHyeBLUuwQmYkWEQYs2Vvpuh9IaoT54Xb++r?=
 =?us-ascii?Q?6l0miE/n2rc8eBXtJQ+HSWXEsEuqoQYboYrQhnL1c9mCNx7alEDjZAKvJbDI?=
 =?us-ascii?Q?qRydPYlauJgg3A349wvWDdsjah2AMdM/ByHRvTPYpQ44D/5G+Q4A1naW9ICI?=
 =?us-ascii?Q?d6IREszqcAlCQ4v71Ocl0LUVDP6tytfKhVS4EH214yXwREQ+wAqu2Ot7PJMT?=
 =?us-ascii?Q?Ke/OnDWYScBiEXfoxTFfl9BejQUBHLUQJ7+TGxpBV5WE0h6NaVnxzzpnOdsz?=
 =?us-ascii?Q?fVt0UJdrG0UM1ApBRrYPE3qyaYpdRpQfr1hxriLaFwcfVCJIkIZd7+MqNDlr?=
 =?us-ascii?Q?R5koJhI9fbC16HbIEvmdG8KSE/J77dK3gBJ1rh/Zr+gSkhvyK75CxWUZ3E0A?=
 =?us-ascii?Q?mxA/cRALByIMQe+AP9ZC3w4AQj13UDmFPqlqGM+7MWgAlU/S+7tqu6SbHc5U?=
 =?us-ascii?Q?kzoa+n8IqWRRUPUK4h4+C/sxR+2J7irMi07u8Q8b+7lpszhaFDOybCubRUkU?=
 =?us-ascii?Q?heZWa91i4GWjyebCQN7Rh9aiCom/d6wiYG61r9l+vUahxrCqdXGJT3h8T0qp?=
 =?us-ascii?Q?g1czILRI0zhGZ7jwydHb+xjJhGc2z6VV4teewbr+Qlm48NyP5h5D9aAs6T4z?=
 =?us-ascii?Q?379vg40KYgfv3f3EYp8Myn0Z/26sf94rkJBUysSclvEaorTmT3Ou3avtUDTl?=
 =?us-ascii?Q?bFl4B8DcSrjKh9o73+fQnROnRFXk05z9tMoGn2rC638KoQi9CUXe28j3llln?=
 =?us-ascii?Q?fHM3HP23kc6FuA/OuSrMRPAeD0SOLrIfiIGW+lke441ghqn6uPh7FBSEI7xN?=
 =?us-ascii?Q?m3bPduyv46G3fc+2O3RiOeQoCAokmSJh/uBnOD8n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e472e26c-471d-4740-3085-08dc186eec65
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 21:46:27.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oneYbnNiVNlc153XtAvowcy6G17w2qjz0mWZ1SJs1/r6dxsYVDZ2jLyHFWcQaoTuLTHunGhp5/mkggCpGy1Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 02:58:32PM -0600, Lucas De Marchi wrote:
> On Thu, Jan 18, 2024 at 07:10:27PM +0000, Matthew Brost wrote:
> > On Thu, Jan 18, 2024 at 12:16:27PM -0600, Lucas De Marchi wrote:
> > > On Thu, Jan 18, 2024 at 09:31:09AM -0500, Rodrigo Vivi wrote:
> > > > On Wed, Jan 17, 2024 at 05:42:00PM -0600, Lucas De Marchi wrote:
> > > > > On Wed, Jan 17, 2024 at 03:40:59PM -0500, Rodrigo Vivi wrote:
> > > > > > This information is already present at
> > > > > > /sys/kernel/debug/dri/0/gt0/uc/guc_log if needed.
> > > > >
> > > > > but is it persisted if we couldn't load guc?
> > > >
> > > > well, it was there here with the same content that was spit to dmesg.
> > > > Maybe just because I got this after a resume?
> > > 
> > > not sure. I remember past debugs I had to rely on the guc log being
> > > relayed to to kernel log when debugging issues on the golden LRC
> > > submission. Honestly I don't remember if that was with i915 or xe.
> > > 
> > > commit 4bc3a34f1237 ("drm/xe: Dump GuC log to dmesg on load / auth failure")
> > > seems to be the one adding it before drm-xe-next creation, but maybe
> > > we just didn't have a better alternative at the time.
> > > 
> > > >
> > > > If so I would still prefer to make that persistent instead
> > > > of the flooded dmesg that gets really messed up and hard
> > > > to navigate to find the real useful information of the
> > > > failures.
> > > 
> > > that would be my preference too. If it works, I'm fine with that. At
> > > least the end user should never be exposed to that amount of info we
> > > print.
> > > 
> > > could we add the guc log to a devcoredump if we failed earlier?
> > > 
> > 
> > I agree that if we can avoid flooding dmesg either via debugfs being
> > available or creating a devcoredump that is the preference.
> > 
> > I added this code originally to debug failures on driver load during
> > early Xe bring up. I haven't used this in a very long time.
> 
> humn... Aside from that debug I mentioned, I don't remember really
> making use of this. If nobody is actively using, then maybe let's make
> it simpler and proceed with this patch. If the needs arise, then it
> should rather be added to devcoredump. Agreed?

yes, please! I will send a v3 removing that extra spurious line.

indeed devcoredump is the ideal place. but first we need to get some old
work from nvme folks adding support from multiple-files (other then 'data')
and then move the guc_log there. I can do that after I'm done with the rpm.

> 
> > 
> > Matt
> > 
> > > Lucas De Marchi
> > > 
> > > >
> > > > >
> > > > > >
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_guc.c | 1 -
> > > > > > 1 file changed, 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > > > index 235d27b17ff99..2a71348c5deda 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > > > @@ -466,7 +466,6 @@ static int guc_wait_ucode(struct xe_guc *guc)
> > > > > > 			ret = -ENXIO;
> > > > > > 		}
> > > > > >
> > > > >
> > > > > trailing newline above
> > > >
> > > > not actually a newline, but I can remove that extra line there
> > > > while removing this.
> > > > Wonder if I also should remove the spaces between the if/else
> > > > above this block as well... The "style" there looked strange,
> > > > but I decided to not touch.
> 
> 
> not sure I follow. Looking at the code now it seems the style became
> weird because you removed xe_guc_log_print(&guc->log, &p) without
> removing the line before
> 
> Lucas De Marchi
