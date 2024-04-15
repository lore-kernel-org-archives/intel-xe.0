Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9F7C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 20:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834B710E84D;
	Mon, 15 Apr 2024 20:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMX8BZ9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E0D10E84D
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 20:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713212971; x=1744748971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8L+NR31GTly468JsYl+4FijUtfWIg/SquCYtbXl+aVs=;
 b=GMX8BZ9s1/7VhqZQbu8FSZMGh3MpP3ufowC634rM2gR+RELQe0pe7R7R
 8+q7fpI4NWlqyitMscUdrwfrrATYEboFErQosTIzDDPxu6RfT3YN+oq8w
 O5HVRrTz0CbhCuYp8UCIN1dvZSbO/gn1ggsgi5VFmeDvQjN8Q9OwOko67
 ZeGCj2zmg1q9oWwzritW6PI69Wb/u2rmgWX6gALGj3IuHljFhtAWAKJiU
 KFAf1a7hG6NzReEGFU2tgiOureqXziyQ/E10v1wurFCxX9XS+m745Rmmk
 VBiqmMMUl66jXzR9FfHn/GNIiAe2zupEgxLMVF3l+oezs5k4qx23cz2QQ A==;
X-CSE-ConnectionGUID: RTrue+xpREi48pDMCoeSFA==
X-CSE-MsgGUID: ndo/KChjTZ2IprqJmr8WZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8485965"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8485965"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 13:29:30 -0700
X-CSE-ConnectionGUID: ZgdEnBoWTZKWlzWKrdX7Qg==
X-CSE-MsgGUID: +eIuZROcQuSHirF8XaDGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22113291"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 13:29:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 13:29:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 13:29:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 13:29:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 13:29:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xb69QI08/wwSwMTiNlXU5tB5nGTgbHjypyl01qc+/wloo3HT7e6fq2Leq+fyabXlMlzQvDNathYLR72MSYb1AmgEbK4ljYg+vL0g6fioavN33JYpt6X3Siz9gnzHYQAfeyZlEzbF6yoURDjS1odOW+Mbv2ezrxpbvg5ztymqTLHZXXwuys+K33XqO39XbOercMJ62jWCwaZmGzroJ9Vu3z/KN0TMqShHcp/uaEQMIjoG9OSAX4uNdaGWrqukpbHyymIV3LgyjFarty4AB0AzOVSR8pZ4HFUT2HpYD5v33bZKXH8oUVP333Qm9JmmFjlwenCJ6Fcq+OXfUk7i306VNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4tQI1ysWGUYKH3ycPpxMUTdaR/LIbWPkWR3ng2aTAU=;
 b=ZXh8My5haUqprsLSHb8KbIXWEMhegCnWkvqZXDFVKEmyurqp790er5KHgtPMz2TLfyskvpNO3U18ZgJrJb00PhQuNDwaqj+9dyUheTH+jVdspSqDMTwMdVSDWwS8calHKdazKs05pIKVhKn9cTzoY5jFd4pdCvEcbC6xlOs52TNUzff4XJNdhl5sViz7SM+78srqN05kT1tWPe2UqyLkOlTvwWyKwinx+2n9qS38TxsRhXinr7P/nlOSDmha+E9b2Zqvik9ejk9PUaYPdPs13BGNdQ/Huw3Jh7PGnj5HqJp8DXB0YP2sdxKmbvmFu3HvuBj3WXTLF1nelegzq/0l9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7729.namprd11.prod.outlook.com (2603:10b6:930:70::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 20:29:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 20:29:22 +0000
Date: Mon, 15 Apr 2024 20:29:20 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Harrison, 
 John C" <john.c.harrison@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Message-ID: <Zh2OIMAqvo310IZr@DUT025-TGLU.fm.intel.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
 <dde80e98a80b9fcfbd46c9dab4ef9bc27bc108f1.camel@intel.com>
 <Zh2Dlx9hhQTTcuD9@DUT025-TGLU.fm.intel.com>
 <CH0PR11MB5444382EEBFD7D79F6CB7763E5092@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB5444382EEBFD7D79F6CB7763E5092@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a2788a-80b3-4d01-2fee-08dc5d8abbfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ze4EF4pkD45MP+CeTnK81exX92hqRL29IHB6IadkNZ03JDXS2xgHZHxT3k1ZRkDXGPxhzrjWTzlS0CJyZ17b9AIg92Ws4PnZ+k5Od+bFQGbSumrectIgk+ABDxhh6CgrNm5jdjPPDMDUWfKzLoEpugVtHaaBuQYawZ2rbI6BtxOSCBoWAxkMsDmXPKsMKk/SpQ0E17v4rP7RASN3GoSN2K4QQ+1WICNN7ocKy7zpKCBEKEsyj7y6B5WXBO/pC4kwfkEH2TjHSwZdhExMq+6XM/qkMNWOTG3irCCv0HZlLzIzrl9zRpkH8nDthmuGY9TAtW2BAyy/NsJDQ1eXpsBiE83yO0IpMVGIr/93ZvFu7jaPm6NMxLPuTb4DEXXvv7GXh4qCqNM93leBcxPSqR4BPQyljtPOHJMmUhyCiu9C0UVCBKFyFdCy+z82kzzkgubmEgmA4lCxPZMa6gQM4g/wOcXBYXqI9lkHmxQx47V6az/VVkXgtneeD80hNUjOwvRawqrFWQzOcJfYHbuGPRQ1Exz3b/47Mz0T1dJ5X5zWIcoyOXDQPZuQtlr1y4tBVEDWL/88nJZStoEpQ5licNgDttArjqAfS5Jc+8CZlqG066SdpftDas+PEtU5rQv+iIbmpkxVM1VJmBn8D7KaoUhKWegpquCJiaX2C74eSA95SxQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mII2oYjWF2BGigaZOMd2KtZ6a9NMwA5XsfHinAe1FGbJ21hWJ1zQQn6fHT?=
 =?iso-8859-1?Q?dmRUYZrULniEULkDqQKFKJ75yBjeWs+uEGrTyfX21cArJKt0wlizpeEw6w?=
 =?iso-8859-1?Q?7p4/gYPr+ZDb+o9SNsVOotlEdlRO1fyGvkZbCjSttf6VZ3ShpdM7qdkiQJ?=
 =?iso-8859-1?Q?10BDHAHT6ADWu7nSujnpo12I4mnOObfWxWpMCSt0/xvWy8Auwl8bKLBa2+?=
 =?iso-8859-1?Q?jqgK8ATcA+QGBWnhy+NJr22blVF6DZ62Qon7oZtli8lxmKSAWs+zdWvT6j?=
 =?iso-8859-1?Q?fZDyMqPnxIv7m7vXaQTvxmTvzV9c+b1epegswWGSwbR3vVa/v94lCaDKUJ?=
 =?iso-8859-1?Q?3686GDRVp1KBmT5lJv8pR4hw6iyI4q8lHbnojzl35qWo51JgzcflndGLCp?=
 =?iso-8859-1?Q?Kk12B1YoIhd4b4DVytt23KzaC6d7ntgwscyJ84IvSmEPN8d8gDqUqcMjlF?=
 =?iso-8859-1?Q?L0ecojwYmH3VqYeIZcc/ZiIX3ddqrxJOUXI3CDjwekVPUxDiBnvpOucLUo?=
 =?iso-8859-1?Q?NX2em80qjlzy7MJzyv4HavUrMXPZoFvZXbE6RgHCmWfi9nsCwi9q88NudO?=
 =?iso-8859-1?Q?DUWlTfF1RdHoSBa+ZGTYuFd59VPgMeElS6DumrlOdPCwt4iUyJXIByw4Wt?=
 =?iso-8859-1?Q?yM/Rtgy98gjNZkhzvvILOngI0W2yIfJ8My+rt4MSXtHuT92nGS29FiwEJ8?=
 =?iso-8859-1?Q?kwAieG0WE1M/WHamhxTQiXEVI13yEi9AshQlZmUEoM9ogDqPAFpy5Mw9KN?=
 =?iso-8859-1?Q?mI9FokFJFcYy9Tpfd7e6JJ5M3gY1xguwG67I9TwSrD/wrjOwOfyVKUyA5M?=
 =?iso-8859-1?Q?thNRTSnfoSQZYzX+NGEM7p+gTVqpc/E5UC1agt4xzJ+7QUzXvQDA7PtE6+?=
 =?iso-8859-1?Q?AsTyjQBw0FSGSCJUE1uTnwWNRh8klqrfITpfiGZ4ZBdaajG3PgI3mLQTz2?=
 =?iso-8859-1?Q?NKsNKRtpFGWZW5014yooUceLoCdw97gWJEjeflMNm7wUx+Btg1ScezOkIS?=
 =?iso-8859-1?Q?XIvgOqkNHzmemdzCHLtc/LAJKWpkk7Qlf5WzMWmBR8G45b3eV8xsjmhUIp?=
 =?iso-8859-1?Q?dOsE1g+ejIpgPOqFVakHUQraU0gRU9NSR4VI4t7DOiJDtiAW2lN1a70/S3?=
 =?iso-8859-1?Q?PTx8CEtDZ8JPZi2rCkbvS539i0I0+9MNVF5gWREVLcQVeYtK14g6CD44+p?=
 =?iso-8859-1?Q?ea+/LMXcCm1hOTe3GPlbeeO1XicXTkPwMkYO6tRUFDaFCMoWq9X6fhkpRg?=
 =?iso-8859-1?Q?FzywGq2joOKe38R+zWqcxGfcAgUBZGCHLV/RbY5P54v+uDq8ua1FvwJo99?=
 =?iso-8859-1?Q?szpWw1n2e6mfFnDMyffnSkfJK1TW/doZSiNXkwt6G7nqbUCa/PPJNrc+XB?=
 =?iso-8859-1?Q?FKjHRz6WCbMtBHS+u9NayDk6s3Uw9L8m8PXi3TaDgRj6KKZMrBS/1jLtSv?=
 =?iso-8859-1?Q?eKu9hM08n09UuTHRq4kLh9UhITY9kW5Pva+U43szZGXshxMzRCOBFImAi6?=
 =?iso-8859-1?Q?VcK5Ui9jx3zsAcT7rTOZ+ls2mVyIkM5begxHHXE43EOoFuEqzTZznQxpvy?=
 =?iso-8859-1?Q?DhxhgcjxBn0tfp9StWbYmPpNFfw+uEuKJd0moyWf345YYj8m43DG88i10z?=
 =?iso-8859-1?Q?MfS0L1BAebT37c2fxlAnZ9HISrHtKjfRtu4v7yOolJxT7/lV6jDHdoMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a2788a-80b3-4d01-2fee-08dc5d8abbfd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 20:29:22.2771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXT5IR0kndpSCnCIWpX1RM/xoVx5TSaAhE4Uyi9335u/p7tCO4aGcbJA+IkKPmL263y0cdIm68PNyvfoRwx4qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7729
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

On Mon, Apr 15, 2024 at 02:26:38PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com> 
> Sent: Monday, April 15, 2024 12:44 PM
> To: Summers, Stuart <stuart.summers@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; Welty, Brian <brian.welty@intel.com>
> Subject: Re: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function definitions
> > 
> > On Mon, Apr 15, 2024 at 01:31:32PM -0600, Summers, Stuart wrote:
> > > On Mon, 2024-04-15 at 11:46 -0700, Jonathan Cavitt wrote:
> > > > Add defintions for the functions xe_lrc_set_ring_tail and
> > > > xe_lrc_ring_tail to match the definitions for xe_lrc_set_ring_head
> > > > and
> > > > xe_lrc_ring_head, respectively, except tarting the lrc tail.
> > > > 
> > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > > CC: Brian Welty <brian.welty@intel.com>
> > > > CC: Matt Roper <matthew.d.roper@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++++
> > > >  drivers/gpu/drm/xe/xe_lrc.h |  2 ++
> > > >  2 files changed, 12 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > > b/drivers/gpu/drm/xe/xe_lrc.c
> > > > index 615bbc372ac62..e91ecbcceba5c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > @@ -834,6 +834,16 @@ void xe_lrc_finish(struct xe_lrc *lrc)
> > > >         xe_bo_put(lrc->bo);
> > > >  }
> > > >  
> > > > +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
> > > > +{
> > > > +       xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
> > > > +}
> > > > +
> > > > +u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
> > > > +{
> > > > +       return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) & TAIL_ADDR;
> > > > +}
> > > > +
> > > >  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
> > > >  {
> > > 
> > > I see lower in xe_lrc.c we're doing this (xe_lrc_snapshot_capture):
> > > snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> > > 
> > > Should we change this call to use the new wrapper also?
> > > 
> > 
> > Yea. Also xe_guc_submit.c sets the LRC tail. It should be updated to use
> > the helper too.
> 
> Please list all of the places where you would like me to use xe_lrc_set_ring_tail
> and xe_lrc_ring_tail, and I will have those ready for the next revision.
> -Jonathan Cavitt
> 

grep is your friend...

mbrost@lstrano-desk:xe$ grep CTX_RING_TAIL *.c *.h
xe_execlist.c:  xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
xe_guc_submit.c:                xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
xe_lrc.c:       xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
xe_lrc.c:       snapshot->tail.memory = xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);

Matt

> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > >         xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, head);
> > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h
> > > > b/drivers/gpu/drm/xe/xe_lrc.h
> > > > index d32fa31faa2cf..f355b0eeb5658 100644
> > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > @@ -24,6 +24,8 @@ void xe_lrc_finish(struct xe_lrc *lrc);
> > > >  size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class
> > > > class);
> > > >  u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
> > > >  
> > > > +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
> > > > +u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
> > > >  void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
> > > >  u32 xe_lrc_ring_head(struct xe_lrc *lrc);
> > > >  u32 xe_lrc_ring_space(struct xe_lrc *lrc);
> > > 
> > 
