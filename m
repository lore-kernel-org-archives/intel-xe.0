Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C735FCA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 20:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4D210E222;
	Thu, 14 Aug 2025 20:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eq48riu/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE5310E222
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 20:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755201694; x=1786737694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7/o8O1qA0heb24Epv6/bfVCiijosgqUb/DD+DzvxA5Y=;
 b=eq48riu/llbyNNDCS10zQrb4/b6z5hzZbSBZ5FPleU5p/w50usyTlRjp
 W9RdS6s/IC3xIVyWn1RMVDOSi3riTH1j5EKX25QJsc+rJRFPlfup4gCV2
 ISLOMshAGNOAZ9sKWVuaBznpX/HA62gZbn16e1/NkzBLFFoi/zb0+9Rpr
 m3qVOta2hPWofVHgcF5cQlzdBvCXLqRM2OfEX6C1/qdE18twZFcW9IkwH
 jIwId/JbwKfJarPcWHg6dHmMrCHoaoMS3i5J+Itfug1AM1pazGtI7BH16
 jo4rb6PVZzORS9DNIOzun+ty1zDGMhcZPbeUfWQDUTFfq2pSQCdFLBp5S w==;
X-CSE-ConnectionGUID: iWZZ9ujjSICM33NXtUOcDQ==
X-CSE-MsgGUID: LfIZN8/SSSOr93vHlPZZXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57642111"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57642111"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:01:28 -0700
X-CSE-ConnectionGUID: DHiiD+nSQEa2q0GrPRP0Tg==
X-CSE-MsgGUID: Z66aX7DUQT+3Z4K9RKwEog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="204026529"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 13:01:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:01:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 13:01:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.48)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 13:01:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3xSwd2WWfJWLexsfDeMQLHOPpvwP/QheeBZTm5YdctGK8KYLJk0aQVJlDk6s/oV3Qn6xVOxa7LdKGxIEYAwePOAkTqmVvUf5+QDF7hD4W7sgs436V/9pdG5hA3tPX8U0mE4pMUYVJSQfmbpxrzAW7FRnXJ6xpUHUzIYu+RKLf0lHkVyow6jobbJBAMH8k1Bkxnh6NPY7P8N8w0crVY6DLNEAnvaGwLuYlztNOWU2OimaP/2SjAsI+5TmvCtQN/X+ahasd720WsgPq2sZFXs5A8U309ZA6XMqPFauNNY61YPOehTydBv+ZTR16hDyLACK4dMtPm+viv8NJ1aX3GjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpJ7J/4cUr2WVOtTj4EmrB1WvyZj1e+V7JDF45aYesw=;
 b=MgGI3DhMCtmy2BCIvU49UU/spI0YgwSqORJ0kuKhKBlrqQFnUzGfaeISHHPYR2X5DQv7nVaeQVewtsgYgMliDqPZ8ZeP8x412t6Mb7ZosNolsHnTVPabtn61wjuOMiMAy+REuMbijSHhfO/zIRTJHlaSgGdIMIUHXOtyQmIjdCBWDHunIY3RDnS9FIbAfvCA6Imn5w9I2N8gC0hCR9ZyZdN9OBThAtuqX+cclXK7tjAmrEMQTTHavq++yJhijTJoWgfxgUeuXb+92Kqba7ts7qyydZfqfZw+6I1HpDWaU/HCcMBRTYgUMW93foC48jPcO82CmQwJ2FIaFJVDPL3NQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Thu, 14 Aug
 2025 20:01:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 20:01:22 +0000
Date: Thu, 14 Aug 2025 16:01:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Probe for tile count during device info
 initialization
Message-ID: <aJ5AkBQ2jUAT0IHy@intel.com>
References: <20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com>
 <20250728-gt_count-improvements-v2-1-78841ce8a81c@intel.com>
 <CH0PR11MB5444138F03288882024320FBE55AA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444138F03288882024320FBE55AA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4962:EE_
X-MS-Office365-Filtering-Correlation-Id: 96217dc1-4426-417e-7589-08dddb6d57a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cz33qCCjierhSoC/A4G67g3pd+vuzQNbUzVlxsNx3Yb2xYd6oebsS/vB8cjc?=
 =?us-ascii?Q?xvd498gfPpAKouadLr/93YOuN9ROFW1PMIz8j9xC+/IBkiK+Jj3WYZ4rSJKp?=
 =?us-ascii?Q?k3e7pmuVnXWDtuW956hpsLwFgOM8fRS8mGAEhSW3jU8BwbtB1IneWzdqadL4?=
 =?us-ascii?Q?IuUtEWxw9dHqINy3YBdz7cqQQfZVUPmCgfKy5DOoctJk8AYczx16z/vwZ/oz?=
 =?us-ascii?Q?rWmnnwKFlv0Nq8Q8IyCXb4a42G5o/y5aaF5GwKoQhJOFyRqm6R+a9OeSSJco?=
 =?us-ascii?Q?FYgu7YRap7oClIyjRBnlDFkfXRH6swzofh9Pos/ju+Dl2lVf3FwMcnWiRloB?=
 =?us-ascii?Q?FYfliweFiy/PRr0u+K5pZbGfvOzCxMVcPMp2BpGxf1MOzUVtftXtsJvjLjYm?=
 =?us-ascii?Q?6Ge7jGxO1R/1y0OPPOFKrEmt4/h2nHayGVGoSYxohgPdkBExgeUJ3MV7+rZj?=
 =?us-ascii?Q?JTwu9Uptvp6wlLGpBX7XRCU6RQw4EYlOGg4rS6S710UbQxMggEASiBsD6oER?=
 =?us-ascii?Q?FgmVaU18RSN++PbkHGkJDZyZK+4KPi8nNhYNbKzaHuTIH5EPLByB9U5SA9Oy?=
 =?us-ascii?Q?nw755Y1r1485T+Ck4kmuM5pTZqAiullLT3BlH/eWRJWXDBYX/FsKV5ynqy7N?=
 =?us-ascii?Q?wjWlt/BHTVcIMjGbngbwG6UiVI4396GKJ+ln0aU00WkJOd6cunEdV07fdVak?=
 =?us-ascii?Q?iyOZVttXyB97lNH1FDNAShSfAwZRrngzWHBGwThJdHtsG9ExRXsiHMRHwFBd?=
 =?us-ascii?Q?GLhmlGns3UnjwSjcXAUtZMcpA27yzC7D2ZoCngr8ipckX/m6ZBWpRBQ99QTj?=
 =?us-ascii?Q?1cKHooB0lwiIicysZBlNIM6wz9zrbHnU2JPN4vQ7fZ+IaL7zNRoPfCa+3fy+?=
 =?us-ascii?Q?hhr/YJwbcIOeamTZgCzDnBrkDXc7n4P5EhnVFRcWVzPfNIYI8ees3aHtDVk1?=
 =?us-ascii?Q?U//SP8rlJQ4S1vXHBEysnmMPZO16+LorEc6CYS69GntKMTcnggeuH1oxuQyR?=
 =?us-ascii?Q?CEIhS4sr1OhYxrHR0hIY5ijlxQ6Gbsvyl7tQ0b/QxqBgl5U+Lroi/LiSrRYx?=
 =?us-ascii?Q?81/z60lnB1IoVDCM20o0YUkZLnnD033yaKbDKX0hvDM9qC+AL1hgeMIBcC6A?=
 =?us-ascii?Q?iEgP9OFXB1FsXaeBuBwWcl59OmdTMxQq8EoaUu0fWF/KyK+ynKUMy45WQScZ?=
 =?us-ascii?Q?FhBbsDwZwlx+dLilHgtN3h+IhpcUtcuBt42q69ylwg0WMYtwFTgWYgNbHYRV?=
 =?us-ascii?Q?p97Qxsc9nw2tvfKl9AfDHevNLZOxJ2IzxbmZRlUQr3KoIabZYyySvC7NtM1g?=
 =?us-ascii?Q?7plH05RWOM8h54tb+OEQMqCdLxrK5DnIoOSQr/USBy1kt2TcLAXf7KpKukEi?=
 =?us-ascii?Q?jyFGgdrmq61j3ZnfsxCtqHodC3hmuA7XCxnBCIhqb9jbxIqIB9Lsh90uX4Pj?=
 =?us-ascii?Q?c2uGoMgbLZU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZSnig6n6SLna5pQk36KHqTqKn0emc0PvbKzYSgrwdUboTt0LrsHsXSAWwTqs?=
 =?us-ascii?Q?NSJcuk1TxSJsKErOWuNDjKd6l/3DwfoQ2Uieaz79MgjCxXSLLGN51V9Sn0ct?=
 =?us-ascii?Q?fxnCPniuMhGtIVZQwC1peR6MIR1n4TruYvPhNDwsBJdAeyKOxfrAWdVNAo7P?=
 =?us-ascii?Q?BCXbdUsjvWmDdt9Pn61RB/dAZGmhUiEOILq6hqNGyE++QY+m+edJVjxPYnza?=
 =?us-ascii?Q?Excn4/EV9aEdA73lxthnHtdBUsma+aVlLKzjNf2QI2L4Ar7aXnAQZqUvJsp5?=
 =?us-ascii?Q?FJuzauLP17sVutZ/Bs1N/8GrkMKaTEhy2FJjNyWMjKklDyj45edv5lEy2eC8?=
 =?us-ascii?Q?DCW+KKYA9T6O9sE7bPcOfWnAVR21ARq51VsWsikwvWLljTu7WhJzyfBvEHHj?=
 =?us-ascii?Q?nn2v1QyP8HCv5BMcw5eY6nhKYAPceUooZasdlfSGIzAnjuY1DGpqbVS9plpk?=
 =?us-ascii?Q?OMnv40FzsWcSP96SyG72WU3gn44pem79zq5t3yHvIOn+q3dzjd7DQ3+XIXuk?=
 =?us-ascii?Q?5siHitn1NzEgF88gb3hcHcEDip7ez3MK7S1TmRx9AhS5+V7FmO3Wt+w0bDc4?=
 =?us-ascii?Q?ngtlCnlIXnxuF1HR735J5l3w5bpMsagDYPpV4kfC4WWIU4jk8o7KRU3owl7W?=
 =?us-ascii?Q?W3Fu6i2SJQ2vIab1ggXE4r8WQ1EIL51+rlN+YCSQV8EdbEZ2aZWqZDVbgu5d?=
 =?us-ascii?Q?N1/z6sm323pNYTFBJUv+pleh1sFml3zQQOzNfMeJ4GFp7fhNQ+6p3rGsEKXE?=
 =?us-ascii?Q?hXG2cDPzepLuqLSp6nU12i42eB0rFjs2H1Y3ISOYHYqWPFWFk1e+dPEdbz2a?=
 =?us-ascii?Q?Eq/IyUtqdY72weaz54W/y2VWvHIvXJcnieqDuy1+/o2L9ZOyH8ZmmTJ8TRHm?=
 =?us-ascii?Q?tuBuay17PrXesP3AqK2FnewsMFXCCUKyfe8j+IlJGaVYm30Xpi8tiiV33TV+?=
 =?us-ascii?Q?n5tuV+FXHbKMwKxk93mbnnYhJkIH7pq3T853Kwd0kPPpZxYUP+wBJBPWBMpT?=
 =?us-ascii?Q?EhZ9hBNo9H5/igsqK9Rw6ImBiTtkseBNSTsxsX3tnLrSYEregFVShS5KQvo1?=
 =?us-ascii?Q?cxypVwPGIlYJuJ6kq3AfOaZZaxyM14+RkSkq6qubPgfy/HwucKbg5sWm3EQI?=
 =?us-ascii?Q?O4p6+UWzuKv28jXihKn7q6es+Uog/QQKXprzTV4KM3i14vPfBUV0g/HRXC8p?=
 =?us-ascii?Q?K2ri7BiVskQPiEmvFBYuUaVGscFlt1RLdKeNvXwMiqk9J09Jq7B2to9qcXD8?=
 =?us-ascii?Q?Jaz58df5dvtNBpedrhDsopgrONCTyW6t6PFkggUayXzjcoc2+bbkCGXkPVIV?=
 =?us-ascii?Q?7hn0SWGZjs4ZV0b2raNyn5FAqQakGcvYvONlWrQqDamkqGUKz7/3P4OBzoG5?=
 =?us-ascii?Q?3kbsaat/2JuPXyCBdmmf62AuuSauRfHdq5eYf3q6DG4IrDkuJ+kIYvU0GPvc?=
 =?us-ascii?Q?NJGQFuzbCVWWnmVWqgRKo/V0tMuGcULAiCJO8G/oXeP8hx4MvqjEYv2l1qaY?=
 =?us-ascii?Q?y8yBlg0/TlGxOKpNlsyUshA7U8EcFUb1FcBm6fOO32IjWGBCqhyk87E4oBOH?=
 =?us-ascii?Q?1Fm+nJ0FnTbzbSizYoSk+2PVs7+I+2tAgAi5R+Ns?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96217dc1-4426-417e-7589-08dddb6d57a2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:01:22.6744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkR6RF8OjtHCa782+kNkIqTBvsc7Si/jhv90rryzz99Nldy/SDEwOibuLMuo048n+bfKGUQ6Km+uAecKIGtAsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4962
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

On Mon, Jul 28, 2025 at 06:33:04PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Sousa, Gustavo <gustavo.sousa@intel.com> 
> Sent: Monday, July 28, 2025 11:29 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Sousa, Gustavo <gustavo.sousa@intel.com>
> Subject: [PATCH v2 1/2] drm/xe: Probe for tile count during device info initialization
> > 
> > The function mmio_multi_tile_setup() does not look like the proper
> > location for probing for the number of existing tiles in the hardware.
> > It should not be that function's responsibility and such information
> > should instead be already available when it gets called.
> > 
> > The fact that we need to adjust gt_count is a symptom of that.
> > 
> > Move probing of available tile count to a dedicated function named
> > xe_info_probe_tile_count() and call it from xe_info_init(), which seems
> > like a more appropriate place for that.
> > 
> > With that move, we no longer need to (and shouldn't) adjust gt_count as
> > a part of xe_info_probe_tile_count(), as that field will be initialized
> > later in xe_info_init().
> > 
> > v2:
> >   - Use KUnit static stub so that we do not try to query hardware when
> >     running KUnit tests. (CI)
> >   - Tweak last paragraph of commit message to make it clearer.
> >     (Jonathan)
> > 
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>  #v1
> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> > ---
> >  drivers/gpu/drm/xe/tests/xe_pci.c |  7 +++++++
> >  drivers/gpu/drm/xe/xe_mmio.c      | 33 ---------------------------------
> >  drivers/gpu/drm/xe/xe_pci.c       | 34 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 41 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
> > index 9c715e59f030..db30c5156d0c 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> > @@ -101,6 +101,11 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> >  	}
> >  }
> >  
> > +static void fake_xe_info_probe_tile_count(struct xe_device *xe)
> > +{
> > +	/* Nothing to do, just use the statically defined value. */
> > +}
> > +
> >  int xe_pci_fake_device_init(struct xe_device *xe)
> >  {
> >  	struct kunit *test = kunit_get_current_test();
> > @@ -138,6 +143,8 @@ int xe_pci_fake_device_init(struct xe_device *xe)
> >  			   data->sriov_mode : XE_SRIOV_MODE_NONE;
> >  
> >  	kunit_activate_static_stub(test, read_gmdid, fake_read_gmdid);
> > +	kunit_activate_static_stub(test, xe_info_probe_tile_count,
> > +				   fake_xe_info_probe_tile_count);
> >  
> >  	xe_info_init_early(xe, desc, subplatform_desc);
> >  	xe_info_init(xe, desc);
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index e4db8d58ea2d..ef6f3ea573a2 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -58,7 +58,6 @@ static void tiles_fini(void *arg)
> >  static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> >  {
> >  	struct xe_tile *tile;
> > -	struct xe_gt *gt;
> >  	u8 id;
> >  
> >  	/*
> > @@ -68,38 +67,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> >  	if (xe->info.tile_count == 1)
> >  		return;
> >  
> > -	/* Possibly override number of tile based on configuration register */
> > -	if (!xe->info.skip_mtcfg) {
> > -		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > -		u8 tile_count, gt_count;
> > -		u32 mtcfg;
> > -
> > -		/*
> > -		 * Although the per-tile mmio regs are not yet initialized, this
> > -		 * is fine as it's going to the root tile's mmio, that's
> > -		 * guaranteed to be initialized earlier in xe_mmio_probe_early()
> > -		 */
> > -		mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
> > -		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
> > -
> > -		if (tile_count < xe->info.tile_count) {
> > -			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
> > -				 xe->info.tile_count, tile_count);
> > -			xe->info.tile_count = tile_count;
> > -
> > -			/*
> > -			 * We've already setup gt_count according to the full
> > -			 * tile count.  Re-calculate it to only include the GTs
> > -			 * that belong to the remaining tile(s).
> > -			 */
> > -			gt_count = 0;
> > -			for_each_gt(gt, xe, id)
> > -				if (gt->info.id < tile_count * xe->info.max_gt_per_tile)
> > -					gt_count++;
> > -			xe->info.gt_count = gt_count;
> > -		}
> > -	}
> > -
> >  	for_each_remote_tile(tile, xe, id)
> >  		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 52d46c66ae1e..0d7073a04bb2 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -17,6 +17,7 @@
> >  
> >  #include "display/xe_display.h"
> >  #include "regs/xe_gt_regs.h"
> > +#include "regs/xe_regs.h"
> >  #include "xe_device.h"
> >  #include "xe_drv.h"
> >  #include "xe_gt.h"
> > @@ -604,6 +605,37 @@ static int xe_info_init_early(struct xe_device *xe,
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Possibly override number of tile based on configuration register.
> > + */
> > +static void xe_info_probe_tile_count(struct xe_device *xe)
> > +{
> > +	struct xe_mmio *mmio;
> > +	u8 tile_count;
> > +	u32 mtcfg;
> > +
> > +	KUNIT_STATIC_STUB_REDIRECT(xe_info_probe_tile_count, xe);
> 
> I don't know much about these static stubs, but if they're necessary
> to make CI happy and don't have any functional impact otherwise,
> then I won't block on it.
> Everything else is the same from V1 (code-wise), so my Reviewed-by
> still stands.
> -Jonathan Cavitt
> 
> > +
> > +	if (xe->info.skip_mtcfg)
> > +		return;
> > +
> > +	mmio = xe_root_tile_mmio(xe);
> > +
> > +	/*
> > +	 * Although the per-tile mmio regs are not yet initialized, this
> > +	 * is fine as it's going to the root tile's mmio, that's
> > +	 * guaranteed to be initialized earlier in xe_mmio_probe_early()
> > +	 */
> > +	mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
> > +	tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
> > +
> > +	if (tile_count < xe->info.tile_count) {
> > +		drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
> > +			 xe->info.tile_count, tile_count);
> > +		xe->info.tile_count = tile_count;
> > +	}
> > +}
> > +
> >  /*
> >   * Initialize device info content that does require knowledge about
> >   * graphics / media IP version.
> > @@ -678,6 +710,8 @@ static int xe_info_init(struct xe_device *xe,
> >  	xe->info.has_usm = graphics_desc->has_usm;
> >  	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
> >  
> > +	xe_info_probe_tile_count(xe);
> > +
> >  	for_each_remote_tile(tile, xe, id) {
> >  		int err;
> >  
> > 
> > -- 
> > 2.50.1
> > 
> > 
