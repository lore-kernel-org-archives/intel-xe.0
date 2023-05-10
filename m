Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAD7C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 00:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9B010E1EA;
	Wed, 10 May 2023 00:39:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE36810E1EA
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 00:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683679167; x=1715215167;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lLDwNgBoZK67WNQZnMmkRqdMrSlIBfyEtLyOhx7Za2w=;
 b=KEpl3q6ItmamAU7SxBa7lX924/ZAJpdU1Ch9bEe3I7QXiQY+8vKWkZNa
 rEIJL5ID65TA3PvADJrSz6oPrBz1K7ns57yqwYzATxb6BQ4I7AvwU5LNz
 8sAh6+Wnn1lHaGxtvpDZ/1fzertVqD5ttF8sEHH2z3pvztVDtWlm6TEYN
 yDfzgbP6oXgsiEtFZtDismUcsiI8kNVcKakVtQZjf1b+KiiiL2QbmV4Po
 6fsA0AFGeQLKVcxHgiDcgx+x8Y8Nif+abQxLYrg4VTd4DjG1rypoR/Y/W
 MGHemqmxE676+q0nuYelThsLYCrXO7vD0OK1Sm/O2ePLYAX2lzZ1XY8qJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="348928330"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="348928330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 17:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="764089456"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; d="scan'208";a="764089456"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 09 May 2023 17:39:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:39:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 17:39:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 17:39:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 17:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWNXB820nmnKBZqBxJgajeRJSm5bOhrLZ7V7PWuwU7KRywZVIE20OQRDTXSy406d7GF4vhtE4cpF/O70A7kV8z3yQJck1sg45KD16RKmA/hiGBAljcSYb/Wd0txI7CASWtiax0/7DLBiwLKmii/7sYOLxrWbrMKhaOb5WrIKmMrJIKv+gvES0HLI/g9S2c5aBgxy3hr4tB17PzJLdZobAjyNvi7S5O5Ea4LpfLiLCS/0pbeRynnYGsnxVk7JpuDKxMI6Y3PMbNsWCtFFWOsfs8BT8cps6CfvpKfFb/JTnbMU3rVEyzkFqOTjOxEb+C4vph56mkb02//OResT9Zb6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JrfGYIS35kg613PttnmPV0iv0VKsLuzlsIXUM4HiGU=;
 b=cT9Wlzdho9OQU+zeXpVDysJht2VDlxI/N76XO5PfI3Xgb+4P3qF8DeWowkFTND1IzNszlK3l7NbXNc7+1h6tBQJhYaFMeVcCEFG1VHY/c0zuMT0JvJ/kNpRPhAQ9JPSIQ8xiLUOuTpjfsIYi/iIRbGx12PDmXl1mEuJ0ORYg8ioeyARY+SFAEbrRkFrvkXPkJUY++dIMlgyJDcUdrV6iZVsvr4lIEBZJ5mOpCesz9OPkjCoVWdTYqp1TgTssyAVDcnYiajoRQ5mzarcRano+M+rZUe6XNqERKEXxXaScHrZfvub4AJJ3V6E0DDs1/fNF6EJlJjcq8Oq+52+qqO0i+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 00:39:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 00:39:19 +0000
Date: Wed, 10 May 2023 00:38:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZFrnk38XfOIVZqy0@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-27-matthew.brost@intel.com>
 <ZFpcgRA0y3Jy0HpL@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZFpcgRA0y3Jy0HpL@intel.com>
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: b500e27c-8b4c-418a-2978-08db50eefde8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XEtOuvmassfCnqdWIeqRVn/EdiMKXbyPKdNQajkJqNvwC/o+TZ6KbA+AWISaBZLwMFw9b0BDspWS9Mf3+EfrywjrFI3H9ekTi8nxi/ZK/5vzHG8JjgomADUvkgaeJqOkYkNDpCwey3qAVP/csUcx6LlnZPttmfstXQ8TVlVIRMSEsSkxe7pYehNsFvF4gZomql/6VteSIKrJspLkxJKOglzxnnynXC+UJJg6IHObapdhHY9Wr3rS7gY9b2UH0pbF2oSml4Do6EHRZ9Ly1WmjLPTf2NkYCgLLO9HlCbPvokL2Ua9GElvIpwDQk22+sANvvARbDbXqYgZn+GlP1IOOtyAJwBRME7tERZszuVYga5uppWcns0uVcmyTis7BrxV/vv3YDw08WG58qYVBQIw/XHBGxvRbfXrN0hWOFKWF7nRzL8rFh+UW5GQiRL3RDaKuZfhjvTHssb2oX5tg/0YvDh/r1/eaBECyLSmJiNTa05WMXJcF5DaA7353QJZ+nngjKKT8KXm3uqoynMbk1a48Khra7T869k0Zv+cPoVja+oa2/WuOu20SK2BJebhUxIbl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(6512007)(26005)(6506007)(38100700002)(82960400001)(6636002)(66556008)(66946007)(86362001)(2906002)(44832011)(4326008)(8676002)(6862004)(316002)(66476007)(5660300002)(8936002)(41300700001)(478600001)(83380400001)(6486002)(6666004)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hmOecBTMcuJe7d4cWiepWixnaEFhKAB69FNaUJ78YdHzkd8Qscsfd0PewEjM?=
 =?us-ascii?Q?JcFcxA05bLXI9r6HS1a8CAkTifNClZ6/w5RrQ4kkCY6xgFVIoIyabSLlvZbQ?=
 =?us-ascii?Q?3VkIe7NqgtGH1gseu1QIjP/X7yp3zEZPqrh7MYNZdVPi+w9EJYLWYGtPv7Id?=
 =?us-ascii?Q?CWXm3TRspF1JgNqnEYIrqnyEGg9+pvtrWpMA3m3TVqc/eLBYPlJXvu/qYl77?=
 =?us-ascii?Q?5vzSI2Q+1EPkmneff+uKulB+BDNA1cK1L7Jw5IqQ3c/9ycJ5GJGTH8k44aBs?=
 =?us-ascii?Q?2MsjF5CMJREEzKf0uXiRkdysQ7QlFGYmq9Fm0r2QYJN9XRW8JEOWbvsQLf3B?=
 =?us-ascii?Q?8J0r7WrogC4+05fNpUJNA0AQgE2JGnwmOwk2s/rVHb1la5nlSJ879ZQggRsM?=
 =?us-ascii?Q?AOZZOq8P/FvE62F5Bip8CS1d/x1esEtKPVBjNSTOQ1JShYIYyUoxsEOErUBU?=
 =?us-ascii?Q?FV7iD9clN+13RHSvAg/dOaVGUB9G0kanxk27+8qJUoL3/ja8BihPxX8mBH9F?=
 =?us-ascii?Q?LAs5oMbB9CnsCu01bzrmI74lGnRLp9xh1heqYI7jztYLnXEjWcqpgvfO0JPq?=
 =?us-ascii?Q?yPi216baFA67oedpw7smWterUX7axxRMGhLe6/fNUMQvWYE/5oUxa4bFOZ1u?=
 =?us-ascii?Q?J4ZFpgOYilW4AzS9w2FJ+6+WdJAmd6MOA2yguJS48OuUCrLjvP5kMiYYVZ68?=
 =?us-ascii?Q?Gy/ScTpFIEDdGk59wjxaN5uqKxzzjvsRCuNMEzNZ3NOmAUVQ8zU4ec6ehS9D?=
 =?us-ascii?Q?97jO2jZmu3QD2jPQGhlX6PhizCd7Ax7XJLCyQaWLZ/Y5ZAFMuW/KP9M93LNJ?=
 =?us-ascii?Q?Ngep4p96osAV5jc00iQ/2Hq2S02qO7ZBcSOtVDtP10DGUDaQxahN0z+ZIDlb?=
 =?us-ascii?Q?eB8mYkkclnQvTxRK66NKRg62ge/stSju1s+VMXmlfTKvFJCGKaSXkswqjndY?=
 =?us-ascii?Q?1+Qw+p9Ck1HMFfCuIRhUFL7kxGm86RjiuVDFqHHHITiZ04F7xLgoOapL0oAu?=
 =?us-ascii?Q?GTVWE3/ZyGZ+RWiu2+8/m0g8GYQEXnBTd/Vf82AmhCEAWFsnxnAupUhrj8f9?=
 =?us-ascii?Q?EMP4nXDm0j5spbrhESIzSE45lVijotOL/9cn9etNGZXfdljpf+Ec7/Yu0q5Y?=
 =?us-ascii?Q?PKhTNHc9OGqKQZX+J4Ut1Wfb+3XximwImRZ7llIIT+KpwRyeY97RGJ1Hp6/D?=
 =?us-ascii?Q?26MAXgwk48vCAIBIm41szCUlF/ZsMN3pvMHUiXjz2cdW7h5Mr2haj64T/T8o?=
 =?us-ascii?Q?qwgHpuNRijrPVhqwLIz2BQLv/zoeH6me818b+hufL+Kfpyo/Pq9DwchLFhIt?=
 =?us-ascii?Q?nJEEh+1a4L7hmVeZG7hS0uXPVlBy4KMVViuS2KJaZuSMHB1SjZWnMZyXCpuu?=
 =?us-ascii?Q?IUgfckFxWufSL6Ilz4PwgepPnRL56JgN+9E7H/IaQI1Y/oRyX9YgfYS/oAfK?=
 =?us-ascii?Q?EvwaX7npVR6HV11HUDh5+i5dF5A7TGCaqEE7/2VotAh2APLt0txSNzovCxlk?=
 =?us-ascii?Q?+w1Sja2d/ojyewq7kUirb2SLK44DexdJgQZx2GPkRyLBtF9XGtn93JJt0HXH?=
 =?us-ascii?Q?0r4OmCkP8VamnN+PoFTkFjUjVu5dwJ4r1yG0MyFMlF7v8rcufqar+uTrFv3P?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b500e27c-8b4c-418a-2978-08db50eefde8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 00:39:19.6787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bkh2mP95NvYzkB+D07p2fgMQHMeoCFJXVK7WKTNBhkpun54AumAbHR1GxXMZJT17nyVLwfCebKVjAAEE+N0DRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 26/31] drm/exec: Always compile drm_exec
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
Cc: Danilo Krummrich <dakr@redhat.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 10:45:21AM -0400, Rodrigo Vivi wrote:
> On Mon, May 01, 2023 at 05:17:22PM -0700, Matthew Brost wrote:
> > We want some helpers for DRM exec in gpuva, alway compile this.
> > 
> > Suggested-by: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/Makefile | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index ab728632d8a2..40067970af04 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -23,6 +23,7 @@ drm-y := \
> >  	drm_dumb_buffers.o \
> >  	drm_edid.o \
> >  	drm_encoder.o \
> > +	drm_exec.o \
> >  	drm_file.o \
> >  	drm_fourcc.o \
> >  	drm_framebuffer.o \
> > @@ -81,8 +82,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
> >  # Memory-management helpers
> >  #
> >  #
> > -obj-$(CONFIG_DRM_EXEC) += drm_exec.o
> 
> shouldn't this kill this kconfig entirely then?
> Or should the helpers be split into some other common file?
> 

I can probably post 28 & 29 in an independent series.

Matt

> > -
> >  obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
> >  
> >  drm_dma_helper-y := drm_gem_dma_helper.o
> > -- 
> > 2.34.1
> > 
