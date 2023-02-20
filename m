Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CCEC636CC
	for <intel-xe@archiver.kernel.org>; Mon, 20 Feb 2023 10:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300D410E644;
	Mon, 20 Feb 2023 10:06:55 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0331C10E644
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Feb 2023 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676887613; x=1708423613;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KilkwxSeciAkhNk8D6fz4l1CwdeLLK/YytRZqA3vxSI=;
 b=W5vwlT/VHoOUHB9DSBXmJjIDo5Tq382usu7KHmdMpLg1xCfjmg7He8GC
 ynTNtc8S4wg2VmMKxha3R7GqrG6Gpumx5oivIXPpuMWBvhdqrKjT6dN/p
 yUxjJBOevViiPCcO/wKtlnLfu16hfjAQt5sFICSbihlO52erQsj9bwACN
 s4VUCLeD8L0uw1Wo5tmr50sH0ynV2/wjCM/yM+ceWFZSGtOsBiWTDmqWz
 C0tntGXy5Z+5S0/C4StSWq1IzhPpm8uwZGZpIF8FEXkarXIWR0gCfgb0E
 0/9GGTGGySVhuFKjmr5mAp0fxTSZocYQpBgn3QlinqT9ho0eEsAdPjEJt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="334568122"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="334568122"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 02:06:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="735074005"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; d="scan'208";a="735074005"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 20 Feb 2023 02:06:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 20 Feb 2023 02:06:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 20 Feb 2023 02:06:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 20 Feb 2023 02:06:50 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 20 Feb 2023 02:06:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLmJCdMvcriJGMpW/w5Xuo+Zao9SLu0OUMSXee4Rv/Y+YrJrcQl+FHUbTQ6pWCeZsBeuvLVO7kKxTFyzayWg9pHKnyOzq9MwIb8GjablF0TXY1eK+TAz1So0zyqeaVwbH5zYe9w/hr+8lrd4+JhV9XMfi5ixobhNb4GXMUam6W52LD4blvJpF+sPiNiWpTs9X9IupG4fzxjuQybyHIkmJ2d7vStQYxRP5SJwC4R3/cCijh3Zir5M4exh+XWKRa19cUA6AVLpqOtpcxIV11qN1MWrImKuJEzfjWdwM1s/wRaB5v/WVZA5iVvhG14RTsLS+1Q7lxqmqNBAof7XV9OqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+9Im59qFtBemSxsUhUTHHfOjmE5q8DftQ2RQ+BCeC0=;
 b=na+cgRocgzgKpgLchbeGHb4CRsBFVbuyhnqXoF+PX65gV5l8D5DZrkhghAsxE/iv1imgZHg3m9MVR/84iYcjhTbV3WIsdG6v9nNmNvKCWkMx+iMtSalj0v3dIHj/V3Iio99e3F+/zNAc1bN7BboCIaFmrbUezDo19O3QKJagnNxA/glXqxY+N5ScsyIQ9E3Byc/WQfvYc0b6GN3zZNjxQy0pnunturoowIYoCz3tFu9Olc2KKE4bzx6XXX1rk55T0/xspA39HxdQZubj0V7PwskTfkDtwsziukIjQSKuYGuQaUT+FfVWtC8Tc1P2z96kSlAbEmumZ55cwAmr9ZZsTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SA0PR11MB4542.namprd11.prod.outlook.com (2603:10b6:806:9f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.19; Mon, 20 Feb 2023 10:06:48 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::5a34:2a91:9ea5:3e8f%2]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:06:48 +0000
Date: Mon, 20 Feb 2023 15:36:38 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <Y/NGLl7VS0bpNTmM@bvivekan-mobl>
References: <20230215140329.402916-1-balasubramani.vivekanandan@intel.com>
 <20230216231726.iwplck7nv6gcpcn2@ldmartin-desk2.lan>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230216231726.iwplck7nv6gcpcn2@ldmartin-desk2.lan>
X-ClientProxiedBy: PN2PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::19) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SA0PR11MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: c3316e9b-ed06-4d23-9483-08db132a2daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5PPGAfIUdm6XQkaCpQGJ/wswbqrhGBDPNgXY7GKM+inBSvuNCgwUSro97nw/PiAfX5hM5omdSwl2YKkS/DUZhVa6okhtNHnEM7M2Rc8juWkYkrrEZkSpoT/x0yUS30OhblYtHDloL4y/o9l2EDwJgZSV+X/ltUdxbMJysw6fDXOBOloG2U/fsbTfdaPp2H59jCRpc76Ut0SSCasjnR6B8ermiIcFXuQCOtuIMXYjyFIMpUYPEgrzKY6kjwHZU3YbWVy04NPTeNzjxYsDAO0dQF8J4fGH8djVpImBKpknkTFJbS0Jrdu86ordLcE0FtlWjFDRc6PAtlVMXcHa/9ZSlqvZecSF7Js58fzsCx/AGQIwlMqv/71DVzYH+w5Z106Qxz/iGiJIDA2P3t8UKPcGhbAw4Qfu6i68fcIfxxSs/K/1ug5ADspyGqiXkg04VgxhJX4QPKD2t9gcF/tpOvFBvt5QTEYm1Ja4tycHeucAO1YsPOS4eOZm3zzwXHmTJ/lIxjBfw5Y3v4FWX6fMhOl3Oqnv9rpyqQalUqoFbeK9YysoWsE1vk9kWbagefVGSgdToRmRQG1kdjg5pP9QKwVzEWykRCbg4JlELxi8h1rBHOvOtGzpCSoEBbImql2gRr0s5OoJGAjqiY9qOc5A1OdKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199018)(5660300002)(44832011)(82960400001)(86362001)(33716001)(2906002)(38100700002)(6486002)(478600001)(53546011)(6512007)(186003)(9686003)(26005)(316002)(83380400001)(66946007)(4326008)(8676002)(6506007)(6666004)(41300700001)(6862004)(6636002)(66556008)(8936002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzlML0h6S2FCMGZrRnNNQ3BudEoyZmpKdkNRSUE5Y3FaSTVzNlJaRy91UWxC?=
 =?utf-8?B?RW5ZdXJsM1cxemhtWFB4NDBQczBhUExtTlp0OVJpcC9vcHgvY01Ga244RWpp?=
 =?utf-8?B?eTRUTCtNOTNXa1haNUIyNHMzakczQW5nNW9wVzdJeG14bHR0RXpQd0ZJQm94?=
 =?utf-8?B?TnNSeTd3cW83TTNaWENla0o3R2JuSGZhd2IzejNMcWFPaDhGK0oyR0xOQXll?=
 =?utf-8?B?c21GYjdlSnkrdzhZbTdyOGVKZmlOelE1Q3Q2Q29zQUU0VUFWOTF3REVVUmIy?=
 =?utf-8?B?YmpjZC8za0lKQ2tWZTNBYVpNU1lHMWk1UEFMYnVNSDRhQ21MZ3lGQUgvZnZD?=
 =?utf-8?B?eEg4aE9ESjlpSU1QSTh0NHdqUVdFZnkyb1pRVTdxaGxuRTNydlg0ZXhiWEMz?=
 =?utf-8?B?Wi9yelZNR0lnQ0tFLys1OHgyVGpCYlMzMGNhTjBGTmkxUVowNXJXYkFjUkJ2?=
 =?utf-8?B?dWNTWXNMRFUzeVVtWERacGR1bmpEYVRHNllZQ2FJZ3c0Y3lZakFkdVFVNjBZ?=
 =?utf-8?B?c2ZKd21MTFR1K3NjR0c3NTZSV2xqYUo1bUhrdUY1ajR0WVdXc0lPSUt6M0E1?=
 =?utf-8?B?ajBLYm1FUTdMVWI5dGl3TWxhOERrQ3lqYzFHV3ZoN044c3lLT0svSXpoMGg5?=
 =?utf-8?B?OWJmYkpGM3JqN1NRL3JpdE50ZHg5cVFRQnRCNWVTSFNBUDRpVjJNdDg3S0gw?=
 =?utf-8?B?VFMvVjd3L2JFOThUaEozSnVXN3JnWk5yUGZTVytLaDloM3VvQ0t5akFUT1Rr?=
 =?utf-8?B?SkhrUHhBUWRaSlVIaUZNcHltcHpKRk9DUGRsNlJ1cGovKzVrMlcxNStKMFJD?=
 =?utf-8?B?RmNxUWVjeVc4cWNMVXF1OTVLenR6R3ZxTlpLc0t3clVWZm5OVC9FRjhlUXMv?=
 =?utf-8?B?NXNvcThWTnhPL3E0VTlRZTUzdEp4NytKTXpKUi9DT3lZa09WSWVNa3dqWFpY?=
 =?utf-8?B?U2U4NjE1ZFpvblBXWGlQV2RIRlZUcnJuVlJBMERLRkNrYmxmNmpnNnk5ZEpJ?=
 =?utf-8?B?aDA5NzYxQmtaK2RETEZzSG1RUG9DVHE4SnplV3dRa0dpUHpvcHYrNmFJay9p?=
 =?utf-8?B?bmFiR2RaOHJjWllyeGdma25aMmxZei9pQVNCdXJ2MWZUTi9MT2s5UEdYNitJ?=
 =?utf-8?B?eVliSUJ0SzBQZitqajJvdHg1OW5Nb2J0RENBMlA0VGFqaEtGSWZzdWlvQW1M?=
 =?utf-8?B?ZlQrSXBCTVYzZTRHeWpqdXc1V2dWVDZBeVJTczM0ODhuRDdPOTR5cThJN3Uz?=
 =?utf-8?B?TkswMm56b2d6ZHBIRzBCOTFnZThaU1M0V1orTTV1cVZWS0hBODZ3MzdtZC9H?=
 =?utf-8?B?M3JpdC8zQVVNbjZ5VDZOazhCZXJ1QWNGTkZDUXFOb1N3ZEFtMGc5cXZFSlNx?=
 =?utf-8?B?TEJhMFJONmhvb2dtUGdjaDNWUHRlZldXSUttSHBzajhpQ1g0WXE2cnN5WGxT?=
 =?utf-8?B?MXZqSXdPRGQzZ0dOU3FuOW1zdXM1ZHdmb1hwdlRjamtON1hGVHV6RHlyYzU3?=
 =?utf-8?B?M2dsT3dQSFhuV2NTWVIzQnF2N1djRlUzcGJWbUMvK05vbVdDZW5vUi9haS9r?=
 =?utf-8?B?blRlYXBqckNhTXhBYUVJMmsyb00zOVR4Q05NQkVZa01ZOGpibmdsendkVFVy?=
 =?utf-8?B?VEZUZEZxYmJ4RHM0SXF5SFBqcy9BTjljOTVPQWdpYjVRMWVSNERtTVNJZmdO?=
 =?utf-8?B?azR3WElVN3JScFdKbFNKRW0xaUJFcU1rKzF0Ujk3U2F0OTgxd0ZSNW1HQzJl?=
 =?utf-8?B?L05Ranh1OS90TnQrUEEvZXNGR1FxMTU4S3p2QmJvSE1PdEEycXhKMjhjWWJt?=
 =?utf-8?B?ajdjUy9XbWkwZlpPSVJwNUFsMzNJZk81em4xK2dZSnZDWkMyUDEyNmk1OXJw?=
 =?utf-8?B?OGRydEYwUzd6aFpSTlpkUVBFZklnL2lrTVFVeVdlQ0Qzb2ZMTXhRUTRpTUg4?=
 =?utf-8?B?dVBiVDBRdXMrUjJ3UGorc2x5TC84S3FkbkloYmI3TmN4VTY3UmVmdGNzL29D?=
 =?utf-8?B?TG1VcElHSnZ6N285NEs2QzV2dzJzOSt0R2FZUDhCOHNqNXl2NTZWQWpKMFRG?=
 =?utf-8?B?cHJHQ2NaMVpqa09yWWZVVklQWmZOenVwVThUQzU4U09rVzMwN1Q5SVBNUlJX?=
 =?utf-8?B?ZEdEUlliTThBMWx1YXJ1L1k4NWwyM0Z5alpTTVIwa2xiQWN6U0tZTmg2YnYr?=
 =?utf-8?Q?g1xDMampD+dL7tI04tb/xdd4Ky4eYS2O9KHLDC9FHi53?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3316e9b-ed06-4d23-9483-08db132a2daa
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:06:48.3296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gfwjq15G16lRuj5OTksRQYr7saLlwvlAAjx41CB73hyPXkW4YlZj257Zpb8vruZztJvTM4BCoatndAsOcBXdOwqE6KYe/egzQDWv1neTG0d5EM2he3vmVudSZj1D/CEQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4542
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix wopcm size
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

On 16.02.2023 15:17, Lucas De Marchi wrote:
> On Wed, Feb 15, 2023 at 07:33:29PM +0530, Balasubramani Vivekanandan wrote:
> > The wopcm size returned by xe_wopcm_size function is used in calculating
> > the GuC wopcm base offset and the GuC wopcm size. It is also used to
> > find the size of the wopcm space to be reserved at the bottom of the
> > GGTT address space. So it is the per-GT wopcm size and not the total
> > wopcm area used by all GTs.
> > Fix the wopcm size to 2MB which is the wopcm size per-GT for platforms
> > above Gen11.
> 
> Bspec 67948 contradicts this. It says WOPCM may be 1, 2, 4 or 8 MB and
> you have to read the registers set up by BIOS to figure that out.

Agree Bpsec 67948 (rather actually the next page 44982) says wopcm size
can be 1/2/4/8 MB in size.
But the *_WOPCM_SIZE macros in question here is not really used by the
driver for any wopcm size related purpose. Driver does not dictate or define
the wopcm size based on this macros, but the macros are used by the
driver to find the offsets of other regions within wopcm like the offset
of the guc base, end of guc etc. Top of the GuC region within wopcm is
calculated as a fixed offset of the *_WOPCM_SIZE macro. So the macro
value is actually impacting the guc wopcm size not the total wopcm size.

Also with most wopcm code reused from i915, *_WOPMC_SIZE macros also
exist in i915 and it is fixed as 2MB for all platforms from Gen11.

The original code is trying to define this macros as a multiple of 2MB
for multitile platforms. For platforms with 2-tile configuration it has
defined the macros as 4MB (2 x 2MB).
But the driver is not really using this macro for wopcm size related
purposes. The offset calculations based on the macro would go wrong.
The macros should remain fixed even for multitile platforms.

Regards,
Bala

> 
> It seems there's some confusion in xe_wopcm between WOPCM_SIZE
> (the total size of WOPCM) and GUC_WOPCM_SIZE (the GuC's size in the
> wopcm region)?
> 
> Lucas De Marchi
> 
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_wopcm.c | 10 +---------
> > 1 file changed, 1 insertion(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > index 8fe182afa06c..a88d02357cb6 100644
> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > @@ -46,12 +46,6 @@
> >  */
> > 
> > /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
> > -#define DGFX_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
> > -						   for 2 tile PVC, do a proper
> > -						   probe sooner or later */
> > -#define MTL_WOPCM_SIZE			SZ_4M	/* FIXME: Larger size require
> > -						   for MTL, do a proper probe
> > -						   sooner or later */
> > #define GEN11_WOPCM_SIZE		SZ_2M
> > /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
> > #define WOPCM_RESERVED_SIZE		SZ_16K
> > @@ -178,9 +172,7 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
> > 
> > u32 xe_wopcm_size(struct xe_device *xe)
> > {
> > -	return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
> > -		xe->info.platform == XE_METEORLAKE ? MTL_WOPCM_SIZE :
> > -		GEN11_WOPCM_SIZE;
> > +	return GEN11_WOPCM_SIZE;
> > }
> > 
> > /**
> > -- 
> > 2.34.1
> > 
