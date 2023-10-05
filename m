Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44CEE75451
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 16:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD3C10E429;
	Thu,  5 Oct 2023 16:17:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6D710E428
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696522625; x=1728058625;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9SAmhbKDkPC7f/tgIazxJvveYfU602NUJjG//DtgLN4=;
 b=WJKoUOkJ1L1g1m8bH1qboA/WAUaApraXv3brvxPx3vE+2ejhlhSxSHQK
 /PF8GUN7BZ8Ciy4YEK9MBm/9MOypovs4MGMTbklVf9W+Byv9spVOrYexW
 RnLdndC1Ml+Yy4BF2AetN7vpy9g0d8UqxJ0Mg8WlJRAlJiMDLivHRFqzp
 t9RB5vzc+0gBcuQkgm5Vn0+LUN1GZKF4gCuR2i2uIqlHgM4R0gmbF6KR3
 Ilin/Ja0XPQwFZ0ejaLEeqCzh/KZLGdfwJ3y96PcP8orJw40E+xLgdAoG
 sH6N6ryOrY5yobUx5yt1O0Z03toOEKMgTJhlPMzL/DYwiZDJarPXPIjHj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="450035928"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="450035928"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 09:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895497341"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="895497341"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 09:12:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 09:13:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 09:13:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 09:13:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/P347P0hNU005rl72VNJCjacLoN3RYHVnuaT9hd/ioUCnfJxOV1ioaghPVOiJ0Vg5BUWFb0u6xUY1bC2gL7l2SGvTHlbp2gi3M7TUhXTpWMjcoaCGFnXHZ3EzAWau7WsJzyk6i8O5vPp+LQv8rigumIqv5D8v55cKhhMfHPoKuk+05zvZSHkUlreHC4kPxDUmaCI2+qrPIurKrHp7ZsXtP1AHWF3+onj0bhKy+0dORF1k+v79wOXgx6NGGz4nTNlaOXmBGD4ezzqOp42FBcZg6pIqpax4qbjpzUr3lmXYPdSfAL1mcf9Gi01vxRog1YFK4HVH9gC74zhj/ZrLntLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SO6kNiJY5PqZHXeR9KomaaurhC13qp65I2jWXBmvqVM=;
 b=G7JH23dFUTu/Id6vGRlOWEm4SzQC88uyAzfdOj+bQTTh9y90VSUHYSZJkykvdvab/45iZXE3qdB2R359dDT0qyiGr8fqRHh1ltVPdfcDlCcPLR8DrvThjOimt0UWvpaVrxti3F1T6mf016+qAXpooZYV/QS8/GhBVa0ZgDR0Ir/je8QLOV79Xee1dOjAmRKjpwTRQuDm7Rwaq2PFH2ltZSJutV48lPntS6bBz/wc33x2zPFgAPDVpfz4r9z7G35vYvzM1h5z3ekxAbqbQyxIIL1sTVUFxCWGcWJp5exc8K1MkD4S9vVOHCvLrV4ErQsmxJrbOITIC782Ex/2RMVfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 16:13:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 16:13:30 +0000
Date: Thu, 5 Oct 2023 12:13:26 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Message-ID: <ZR7gpm90CTkEQA+P@intel.com>
References: <20230926212056.40881-1-stuart.summers@intel.com>
 <ZR1qnvcWDY40i0vD@intel.com>
 <4c1b54f514d3303c1436e66bf278fc16d5ad7e41.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c1b54f514d3303c1436e66bf278fc16d5ad7e41.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0048.namprd03.prod.outlook.com
 (2603:10b6:303:8e::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 4026935a-16c4-4bc3-14c3-08dbc5be0415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rLNj5CwXNHuSN36tz7oWk7rU4qSmX6mSt4C0fOXN8TkTZjQRnpkCxL0NE7u2hUgAdV+Kk8QE9wtFAZZasjIBkznslgL2l23HLO1VtUaaYkF3eiGHc486NB4VqUSn8GasASJuweWdrhT2MUR9m7W9a0joX4wto+UOyydbY1TV8zSvWf6lGjTjtf7VtUkDcfGavFeOwDzCQgeCFdo2QiDaVib9Jx5aCNAtvNkMtLy0QWAUbv7H1Cwf9pYB2USgd+8kYyJ7J1E22X07ptKhVwGqr93K/Mr/cc9+QFvkFOwm20rsyxJqivE7douUIatpT01REHRbbOGBQOMNnOJFVY6Yrd/sbqK2XB0A1qiZnVJJmv+fHOwgsq6MLhNVEHRglSUFQtHmr9q6Ft6jkMyDZahFAv/QGgP6CJTwlnOSwZoQSGnAf3fdxYd/hupRczB8NZbjFfXjfs/QCr47yBgcDyuYGTJ/ArNhe/Fl46RnzhlR4NfH2Wgyp0cQhzTD/Nn75pzIwQZhEh0xYUQ5wOtvuo2xQv9PbezG7joeJBLgyYrDDbha6heqG0PoudlXYtrCrN+VkSrZW9JSA4cGSGn2IB6S5KsEyLy6+UDr1k65/ShOgGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(38100700002)(82960400001)(86362001)(36756003)(2616005)(316002)(2906002)(6506007)(6486002)(478600001)(6636002)(37006003)(4326008)(44832011)(41300700001)(66556008)(6512007)(6666004)(8676002)(8936002)(5660300002)(66946007)(83380400001)(26005)(6862004)(66476007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NpYbvPs8oQjlUPQXk1brQ1LkDAIm6/R5F06rUu+QwSqSiVhJ5wZwxtYihj?=
 =?iso-8859-1?Q?PYX//0SKT1LFhkKJOoWRjj8DH6nAmt/NeXokWssKntDis5e+0CNnTrmTju?=
 =?iso-8859-1?Q?XmSGAu16zz9I97VFPebaSsuenQGKKfqFhTzPwjs9YEy3yPM73H2Y1GoNFF?=
 =?iso-8859-1?Q?4TOOio2bxH7uewKz51vcOLKGlmlTAw0ldrG30A+8xzqjjRhfr3W7NW2Imx?=
 =?iso-8859-1?Q?zhGqDtik/4B8BlaCv3poh6F+HmVSzUa2tXKqszSxDV3FXYZPxug6vD22P0?=
 =?iso-8859-1?Q?gxkjEYxTF3kG6LPJsbMejHpUSKQHqYdi6rfZa1fLT6uuVXKV7tZeBdFLI7?=
 =?iso-8859-1?Q?PpBHbnY9sHmAKitnZNWt+N0OQwus8YY1WnnIEx+Qj1lq4Z4xiKz+s5XEk4?=
 =?iso-8859-1?Q?5ha+TtdO5tQNpidKGMPeW/ud5tUs1jJVicxzi8BzaX2lycFJvKOnJcbmUc?=
 =?iso-8859-1?Q?uh1d+M3lv/Q7/rln5leZReN+XTSTPmB1pPPQgiHW/Tsaj3vbbueFOVmVma?=
 =?iso-8859-1?Q?UYXpMpjdeh+D4gAot5g2vz1eXtb9DDWnALVDnBVs3b6s8e4divtHOejhhE?=
 =?iso-8859-1?Q?SQBeYQFLyWhn1himUGVToKepQuH+Qus+h/yW17BFr+kNM7LpT0e4PogGW4?=
 =?iso-8859-1?Q?KEyixNZ18Yi3JNSgjWhQy9Zi5DcYgTv8VmadXyDtTACHZPH8hHiJqiLd4I?=
 =?iso-8859-1?Q?5iI6uLIcgMhy2nF9X2HsJL9xYiNimLKljIR6/hYC1HK2a1+uE+oHu1JJp4?=
 =?iso-8859-1?Q?edjfWXwnWgJoZMEvWdJxVwgsASY3Jc1sEwBA1Ngdq9ZI+LPN6OIXcerOeT?=
 =?iso-8859-1?Q?FQNY9HU0d70ctelTJOQRKcaJ31e5B1xBk+BUj9hZDcKtoG5O09IsRJcJHi?=
 =?iso-8859-1?Q?EUvwOS0LNHAa7rAGleK6sSuhloAfg95RPFVdl5ABVxCRtcx+VuMz6YFimz?=
 =?iso-8859-1?Q?ZtAh7UipmN+duSwsjVedgWrYqCgDbyciByYJJhQwiSwKYI9xIG/VnNVd8h?=
 =?iso-8859-1?Q?xRnpGC5GwNHwMxx9/xQXb3QigGX90hSKmvSSFDOl+KgMvb+rEon5sPvjg4?=
 =?iso-8859-1?Q?fUxXhHDFubs4+Rvcnb1t680e5Zxg8zWAhaelVXuIKQYWszJVrWCUUk2KZG?=
 =?iso-8859-1?Q?DqwJpPfeO+fFioF4VYMWr66Hvmfr/pwuU8Nt3RQGsFk3ulT/lAWPuFVn8N?=
 =?iso-8859-1?Q?ebPtxJH0ZqTUkvK7qip6dbFHkYtvIRWH3z34GGxiRr1DrCibKT2MwB7Gcs?=
 =?iso-8859-1?Q?VGmQacV/PLgFKuW2LYQxoDLS0m7b8b1Gpdl6sz61yq0vFdK/Ql5NNZdlD6?=
 =?iso-8859-1?Q?IJuS7Vdluxq5S4BCyMyHR0ofyBmRSKn11SPiZE7FJgGIoXdgY7J6IiEnDI?=
 =?iso-8859-1?Q?1FHohHprkrt99cNp8u/4VcaFH8rr9E3eHTpJy371K0xiEoYP97+HiQFJDf?=
 =?iso-8859-1?Q?1Zh9qq36/tCwP+fGqMN7KRo+PB5FxhBfs8lxvNYxLW5k0p4eAbTQKkZ9gE?=
 =?iso-8859-1?Q?bY2GchLGl1RD/0pBXZvL8NzgITXxiP0q9EiW+rISlAYfV6JjmJYOoUiJD1?=
 =?iso-8859-1?Q?HTrCKpN0cL3wrv7LjGxc+tVpQoKlLYvp6V5hO5a01rb2V1RZtHjPBqRHha?=
 =?iso-8859-1?Q?eI3fdWRTheDQ2h+6wAX4hJ37+M4z8fl1nJCX7R96/ewiQFD7T/1WnK8w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4026935a-16c4-4bc3-14c3-08dbc5be0415
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 16:13:30.8492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnYkBplzQwzJCN+40Q3+XUQ5vp123VnJOBtSxZUPXsLS4BqxQP87PFCaMIw7PHfogQ3PeEuRXyCai1XtUJXirg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Print devcoredump to drm_info
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

On Thu, Oct 05, 2023 at 11:38:10AM -0400, Summers, Stuart wrote:
> On Wed, 2023-10-04 at 09:37 -0400, Rodrigo Vivi wrote:
> > On Tue, Sep 26, 2023 at 09:20:55PM +0000, Stuart Summers wrote:
> > > Currently the devcoredump is available in the file system
> > > for a user. However 1) CI isn't currently set up to dump
> > > this data and 2) if we try to dump this during the driver
> > > load when a failure is observed, the driver will be torn
> > > down before we have a chance to actually read this data.
> > > 
> > > Add a quick routine to print this out with drm_info as well
> > > if CONFIG_DRM_XE_DEBUG is enabled.
> > 
> > I feel this is kind of a duplication of simple_error_capture()
> > that I thought we could kill... at least that has a more specific
> 
> What was the reason to kill it?

just ignore that thought. I thought it was not useful after we
got the devcoredump, but you just showed a good case to keep.

> 
> > config: CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE
> > 
> > I mean, maybe the right thing to do is to kill that and have
> > this one here, but with a dedicated config?!...
> 
> I feel like the ability to dump extra information when an error happens
> during driver load is critical for debug. We could come up with a way
> to dump this during teardown to some other file that is persistent -
> even in /tmp or something?

what I mean now is to just keep one version of it, or keep that
simple error capture, or the one that you are proposing, but not both.
and with a dedicated config like this CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE
instead of the reuse of the generic debug config like you had here.

> 
> Thanks,
> Stuart
> 
> > 
> > > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_devcoredump.c | 17 ++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_devcoredump.h |  3 +++
> > >  2 files changed, 19 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index 68abc0b195be..aa41d8e9b602 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -78,7 +78,11 @@ static ssize_t xe_devcoredump_read(char *buffer,
> > > loff_t offset,
> > >         iter.remain = count;
> > >  
> > >         ss = &coredump->snapshot;
> > > -       p = drm_coredump_printer(&iter);
> > > +
> > > +       if (iter.data)
> > > +               p = drm_coredump_printer(&iter);
> > > +       else
> > > +               p = drm_info_printer(coredump_to_xe(coredump)-
> > > >drm.dev);
> > >  
> > >         drm_printf(&p, "**** Xe Device Coredump ****\n");
> > >         drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> > > @@ -102,6 +106,15 @@ static ssize_t xe_devcoredump_read(char
> > > *buffer, loff_t offset,
> > >         return count - iter.remain;
> > >  }
> > >  
> > > +/* Print the coredump locally also for debug purposes */
> > > +void
> > > +xe_devcoredump_print(struct xe_devcoredump *coredump)
> > > +{
> > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > +       xe_devcoredump_read(NULL, 0, 0, coredump, 0);
> > > +#endif
> > > +}
> > > +
> > >  static void xe_devcoredump_free(void *data)
> > >  {
> > >         struct xe_devcoredump *coredump = data;
> > > @@ -192,5 +205,7 @@ void xe_devcoredump(struct xe_exec_queue *q)
> > >  
> > >         dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0,
> > > GFP_KERNEL,
> > >                       xe_devcoredump_read, xe_devcoredump_free);
> > > +
> > > +       xe_devcoredump_print(coredump);
> > >  }
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h
> > > b/drivers/gpu/drm/xe/xe_devcoredump.h
> > > index 6ac218a5c194..ba0c2a7b71b4 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > > @@ -8,6 +8,9 @@
> > >  
> > >  struct xe_device;
> > >  struct xe_exec_queue;
> > > +struct xe_devcoredump;
> > > +
> > > +void xe_devcoredump_print(struct xe_devcoredump *coredump);
> > >  
> > >  #ifdef CONFIG_DEV_COREDUMP
> > >  void xe_devcoredump(struct xe_exec_queue *q);
> > > -- 
> > > 2.34.1
> > > 
> 
