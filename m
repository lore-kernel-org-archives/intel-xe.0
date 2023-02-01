Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE003C636D4
	for <intel-xe@archiver.kernel.org>; Wed,  1 Feb 2023 21:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A95C10E138;
	Wed,  1 Feb 2023 21:20:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4046510E138
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Feb 2023 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675286448; x=1706822448;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LmkPH4LaQCPT2Nz/+ImVWWZiqnWMg+jEXrk39YhsLo4=;
 b=dY0M0PX0yOZk/nxIi+SaOSNEUXzlXSwz44KmW1JJz5qNSQmwr6pbK6hR
 C6E/Hqqzsumhcs2oqU0joGC7FtzgmOATPglL67ie5Rd4XLrdJJdh1bESY
 uGysIDUn7lhLww7vl+UpaSnB9lmvZk5t0jMp7WDm5+0razKcIo1bUK8fa
 +zVy4mhAChxNXdD1IjskLpUQdiQZ1K7IKgsoGn5Kn7mjwQdle7Fgylf1e
 yyQQUJjJKiiy+kzc6ofZj6LkuUk8rRK4ybxmMzYiXplgZH4am2fr8lzVt
 CeWvv5XxHXbFduHdkguB1kI64jzUMVYFLlxI88GmUOrgQTXI1UocrD84b w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="307934310"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="307934310"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 13:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807716085"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="807716085"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2023 13:20:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 13:20:47 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 13:20:47 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 13:20:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 13:20:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jc5VKdKc4kcas7YnsaLQQb24v6e2pWyRGD76RWWgtbka0xKa8GUc3fb0ovBgkcVP6lD125ymxhcYYsRgRSS0g8yC3/EAQxulSBZaCcy2deiBy4DRKxBob0O1rjW8+/HlK4qMMkwFWXHB0tkrOY50ovo+1mEUWTOkddCi5LMLCZ99R8Cx8U+qUnXsyZ+Yxe+Ja4bNLaqfXCRmoDJNGy5eBC1PTegQBi64Sf1JqIewJKWIJx4YqExF95A6TNNxIW8p6efoYgD2J0sDiBI/eaLt+/3WQCqGL6+NFqhBA0aly7A8Q98oikkUODyr5fYpGhUpXIdnHC+NWP7A66V0I7ktnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsywKkx25pTtYaLtkLmyxDkh0WZlzqkbUckqOidnkvo=;
 b=gXUlES79L4CjU71OAvzvTSWEAnpM9FA2gVin9JIaylmKPkG2zwZ357hv8co6/f2bUg9ygKJGLEW67jDmA4hUtvyXjHshGC5zPSNVRPPq48Y1Keit9bho7mlJCBmNeKLJEHMBrX+BkqFOGTlZZ8MQHlppOmZ4i+2qxNaoJO88O5khwoktVCkwAlLhmSPISSy0YphCt6dn2XSpxqxA9DPBIezU6rcQx7KUAJ8d0Y/jj6peI122Uz7Xfe5SjMSNQPza+liq78XZ77opa5BgIUIP+b/CwwPt7p8rwWCuAw+KppcB5FKpFpwjff2CviwpjUZjx6SNh562qXC5R+2sZ7Wn6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 21:20:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 21:20:45 +0000
Date: Wed, 1 Feb 2023 16:20:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <Y9rXqCOP+8Y2MC4J@intel.com>
References: <20230130161723.42602-1-jose.souza@intel.com>
 <Y9f7O86ki5W4Qv1C@mdroper-desk1.amr.corp.intel.com>
 <7c9f39e8eb4ad81926af9b91f45509a5a5a9d347.camel@intel.com>
 <20230130192751.ozgru3btj67iojfa@ldmartin-desk2>
 <12ca0b771f2845509e00a36e6514d456ea39073a.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12ca0b771f2845509e00a36e6514d456ea39073a.camel@intel.com>
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 34d74c85-7a8b-4ff0-7ecb-08db049a2e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z4zh+7G5p7WaYK8VEEUCPkR6P8SgYvktD7cl7+D1zEf9dloXwBuRCDWmCsRWbmhPvflLJgepWrGtWFDoBty/Z+69e9GsH4I/nXVNSkbsFpSqg29KeFpFlUqa0A4eiAaVyQr1pHSKy6BfZv0we1q3A545HKFzIwHbMpjkQDy4xoy7TAUPwWj4+k+9SVDXHpPnepvaXmtfWifLP6Y/cyNr+s9vU2zDlbc7izx/zPlTfuia/P5WmGjcptSUVsUOTvNvtAAqYz93rpaibL+yfvOEV/Sgv7eiTd6+svs+V5f2sBsgaz/l63ZfDsHcrlUV0BSaFGBZUEJkWFeNI3SpbmrpODHPA/ocqL4miwbEgcZjSzWP8FWUJdZb5gi6pFFxAlaOEDELqt6eUEOoUY2ibastqxd7vlY1MtRNDgdHdsIRGRvJ7syRCnyP9ZpYTMqeUmEQ7x3r6tmo2WazSqgv1TuXg8NpYBEFZ0dc4gNGcsoMjawPwlBimpnH5uzH0z4ktQIHqDi4JDjeQcVNcLohtzXa9Z5dDAZp6nlCksmP5qnO37cFV9IjMFB+6eDaJ+/EkZbVMTxry9YZmcRsy4O1Zk4hzL4JcSAZ7HaCia52J7omDCuKoZH0ACFpvbkarJU4QRhXH+OwFycJWmFBY++/ptWyoBDQj6WuzzMU44ubbeRfuRESvA9n3qiwAUzEhxXSXfl7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199018)(6862004)(8936002)(41300700001)(6512007)(86362001)(54906003)(83380400001)(82960400001)(44832011)(4326008)(2616005)(6486002)(66476007)(6636002)(66556008)(66946007)(37006003)(38100700002)(316002)(8676002)(186003)(5660300002)(6666004)(36756003)(478600001)(26005)(6506007)(2906002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?prebN03bz9ELfTlPUrgIdXj6prOfn7YfecbDd0wtn8zXmAlKdip6yDj5Ti?=
 =?iso-8859-1?Q?4Jd68zc93MxbidWOn0Ppw0m38nwj/2shOjhKHcJSOZST4J8V+Vyb/pkfPT?=
 =?iso-8859-1?Q?rLuu66OqiZ6MoL4binZepucd9BUKkl9s2xI6zXg7MgbO+GXRW0A80woJee?=
 =?iso-8859-1?Q?srWtIQGxIz5C3cKy0zgmZTw0jqiEfqYUOKSQblsaHG3wDdqaWR8uC2jBOk?=
 =?iso-8859-1?Q?n0dD67LlpSzYCIrftXob9kVvw4X1anJ+rTZslnCjGeUFBTFdl5gMmJ3K9S?=
 =?iso-8859-1?Q?cMWO60+B6R6KA3WP5k0wV2M1eAfnnadxjOE0bW3v2l/pTSjkXsAYO9T6A1?=
 =?iso-8859-1?Q?eVb3i/8jNBcivmLuhcFNOvMLPNQDhXEFbDrc08IxPZP3fB70R1Yqd7iJ91?=
 =?iso-8859-1?Q?hzIYJcvUe+zK5UjkbFhw9WxtcX1SvW0hw1DBlMD8lrxiKea99DjpLaQHjQ?=
 =?iso-8859-1?Q?vsYxL6MRxIWPJOZ/Q6b9keVV8PzuOqfaOiT0eFvWF9c0pGJ6GG3WTb0IBq?=
 =?iso-8859-1?Q?MxYzbaY86ndzXKRtipCmDPZF64h2opMox/LJNVZZWJch7dBB+z5IOMLCbU?=
 =?iso-8859-1?Q?GuxcQ1PRxixeCbHxZZU+NPbQAwgBXrDnm0g4tR0xV8ht8Mt3DXjZSjA9Av?=
 =?iso-8859-1?Q?zJDPJxzN9ycDctjo+P2N0vhCaDCQbwCZQrl+PSFvM62iEvn4jYO+96gyu+?=
 =?iso-8859-1?Q?g1g0RCGernJqlcRrgagMY1/ajj338XLvtKN7gll7dXqiz1eHv1LX63aeyf?=
 =?iso-8859-1?Q?0a0xYdJiSQ7qqS4DQYYO5JFuUcGphe4N/HUZ/zWQTbq4aVnQNPghcCgQbh?=
 =?iso-8859-1?Q?t5S4SQ4RqkliAXtH3UY4h4qfkvfrTHDf7jKwnNJymDDDwiH0jOLLxRSQaB?=
 =?iso-8859-1?Q?M8Ew29oBHJXW+D1hCoAWofKQwMT1MTeDk5InGGjloKH+2c7bwa0PxMzK3+?=
 =?iso-8859-1?Q?ApK2QU9cQX/XA3xKYAJgkXU+riayg399HehAbnCK79Byn12L1hjAioTDeD?=
 =?iso-8859-1?Q?KlD9y6fGyxj+S5S/hZfV+1bSuWy3nEQ7Ai2x1RjS6LbPFZu01etpLXqH+o?=
 =?iso-8859-1?Q?qvxY79oM5jlEmse+TGie9OnaEETNCDAlpSwtygQz3WRttIHW79i9t71sBb?=
 =?iso-8859-1?Q?hZ9bCxKIosFyuTGdEl6TlJlceG0iCI5Nu5f30lD7yuAuQv1pTi2JZT1PZr?=
 =?iso-8859-1?Q?K4qlIM4h5+AD6G55FVu96k+qnAyVBZ//HDNb+qJQ2/h635k9jwGhwV/2YL?=
 =?iso-8859-1?Q?F/QtubF3a1wP5sVDnvjqlMxedfX/14pgoJQqwzRNF7hhLniqQksUKixVWi?=
 =?iso-8859-1?Q?8qxYta3cGN6DUeduZr65EeeawnUbJLorJRv6A3Dyni2wohrKgCghHBzHyv?=
 =?iso-8859-1?Q?9jOGloQdUpC0wMAx2CbgNjKXSX285KBhGQAOTRPAuc3xlBgxIyIgSxRsZ3?=
 =?iso-8859-1?Q?Vq5/Pvn/GpY5kHpqBubpT0W3u9/0RNbRDOhZiC4H9JPx9ufIVjOyKxHckQ?=
 =?iso-8859-1?Q?weGoec72ncqmDNYSHWrRWeWjruKc/zNxz5Wq44kSZKdbbgh/ARDr/JLACh?=
 =?iso-8859-1?Q?x/059WlOQiLxFe0vJju6EOEwRnJOYne/g7K3dfCYZnj8B9CeSSdQTXr+JM?=
 =?iso-8859-1?Q?dCfWYumvgfSKhXUwxBE0q5+TV9YxKp5+cGjVCOHWapIWPzKviMX2rm9Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d74c85-7a8b-4ff0-7ecb-08db049a2e05
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 21:20:45.0236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wlnBoktf3IpVIV/fC8nCzILxJ22zCDjBCnxo+khNsI3Y7iZIhmnhAN5NpcKrTDYBh7TmAGVA1UNORTNU/zl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 30, 2023 at 07:43:58PM +0000, Souza, Jose wrote:
> On Mon, 2023-01-30 at 11:27 -0800, Lucas De Marchi wrote:
> > On Mon, Jan 30, 2023 at 10:04:25AM -0800, Jose Souza wrote:
> > > On Mon, 2023-01-30 at 09:15 -0800, Matt Roper wrote:
> > > > On Mon, Jan 30, 2023 at 08:17:23AM -0800, José Roberto de Souza wrote:
> > > > > i915 has the same fake workaround to return MI_BATCH_BUFFER_START
> > > > > nested batch buffer behavior in DG2 and newer platforms to the same
> > > > > behavior as older platforms.
> > > > > 
> > > > > So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
> > > > > chained batch buffer level.
> > > > 
> > > > I was kind of assuming we'd just drop this setting for the Xe driver.  I
> > > > believe hardware will be removing the option to turn off nested
> > > > batchbuffers in an upcoming platform, so userspace is going to have to
> > > > adapt to the new behavior soon anyway; doing it while moving to a new
> > > > KMD seems like the easiest time to make that happen since the UMDs are
> > > > already updating their programming models.
> > > 
> > > This would bring even more changes to track when debugging issues in Xe KMD port.
> > > Better do this after Xe KMD is stabilized and with better CI coverage in UMDs and KMDs.
> > 
> > but if we start supporting these platforms with nested bb disabled,
> > we can't change it later. At least not for the older platforms that had
> > it that way.
> 
> Xe KMD will not support by default TGL, DG2... anyways.
> Why have different hardware behavior between KMDs then?

For the older platforms we will always be behind the force_probe.
So we will be able to change the uapi behavior later.

However, I tend to agree with Matt and Lucas that it would be better
if we align with the future, instead of trying to align with i915
first.

But I'd like to hear from Jose, how much of a trouble this is for the
user space? What are the advantages of aligning with i915's current
behavior first and then move later?

If you noticed all other uapi, there's not a much of alignment with
i915 anyway. Why should we align on this?

Thanks,
Rodrigo.

> 
> > 
> > Lucas De Marchi
> > 
> > > 
> > > > 
> > > > 
> > > > Matt
> > > > 
> > > > > 
> > > > > v2:
> > > > > - replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
> > > > > - move fake workaround to lrc_additional_programming table
> > > > > 
> > > > > Bspec: 45974, 45718
> > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gt.c |  1 +
> > > > >  drivers/gpu/drm/xe/xe_wa.c | 28 ++++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_wa.h |  1 +
> > > > >  3 files changed, 30 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > > index 84a73eeccd297..5d07e1e7bd506 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > @@ -311,6 +311,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > > > > 
> > > > >  		xe_reg_sr_init(&hwe->reg_lrc, "LRC", xe);
> > > > >  		xe_wa_process_lrc(hwe);
> > > > > +		xe_wa_process_lrc_additional_programming(hwe);
> > > > > 
> > > > >  		default_lrc = drmm_kzalloc(&xe->drm,
> > > > >  					   xe_lrc_size(xe, hwe->class),
> > > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > > index 3325de3edf691..744b7d0982683 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > > @@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] = {
> > > > >  	{}
> > > > >  };
> > > > > 
> > > > > +static const struct xe_rtp_entry lrc_additional_programming[] = {
> > > > > +	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
> > > > > +	  /*
> > > > > +	   * This is a "fake" workaround defined by software to ensure we
> > > > > +	   * maintain reliable, backward-compatible behavior for userspace with
> > > > > +	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
> > > > > +	   */
> > > > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED)),
> > > > > +	  XE_RTP_CLR(RING_MI_MODE(0),
> > > > > +		     TGL_NESTED_BB_EN,
> > > > > +		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
> > > > > +	},
> > > > > +	{}
> > > > > +};
> > > > > +
> > > > >  static const struct xe_rtp_entry register_whitelist[] = {
> > > > >  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
> > > > >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
> > > > > @@ -362,6 +377,19 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
> > > > >  	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
> > > > >  }
> > > > > 
> > > > > +/**
> > > > > + * xe_wa_process_lrc_additional_programming - process additional LRC programming
> > > > > + * table
> > > > > + * @hwe: engine instance to process workarounds for
> > > > > + *
> > > > > + * Process additional context programming table for this platform, saving in
> > > > > + * @hwe all the registers changes that need to be applied on context restore.
> > > > > + */
> > > > > +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe)
> > > > > +{
> > > > > +	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * xe_reg_whitelist_process_engine - process table of registers to whitelist
> > > > >   * @hwe: engine instance to process whitelist for
> > > > > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> > > > > index 1a0659690a320..872f3e4ddc73c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_wa.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_wa.h
> > > > > @@ -12,6 +12,7 @@ struct xe_hw_engine;
> > > > >  void xe_wa_process_gt(struct xe_gt *gt);
> > > > >  void xe_wa_process_engine(struct xe_hw_engine *hwe);
> > > > >  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> > > > > +void xe_wa_process_lrc_additional_programming(struct xe_hw_engine *hwe);
> > > > > 
> > > > >  void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe);
> > > > >  void xe_reg_whitelist_apply(struct xe_hw_engine *hwe);
> > > > > --
> > > > > 2.39.1
> > > > > 
> > > > 
> > > 
> 
