Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF3EC52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 22:51:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E16310E209;
	Wed,  7 Aug 2024 22:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrLhZqgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B6410E209
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 22:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723071104; x=1754607104;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pZUg7cBvtVnuBxHoVQpEwRYHdWAGaqb5X/R2H1M0s/A=;
 b=nrLhZqggnbs5OhcwmAIb/HW2p8gxOJ4k2U2eH+hOINBnh8XkpXohvYaS
 Va5T53IImK87AP9QO9/FLjAaLDijy5ew2uZRr9Q2tgqQt3TzxhpeAnuUz
 7+avByOrFgBxV4Oa3GwVZCDkvvGf/JyzQos86WvdEISeaNKX0iF63qA6L
 jS1AFGWe98GIzqSlMourDmscC7Xh3qGhcWtGqD7433fn6haPtAZbRs/Nv
 CmJXNM6neggXmFwoGwVKXS1yYYyisk+mpRRv9wSenaI+M8cDtNh0GRFES
 pkWMQCbZVsqPMaaKuIu0TzKgZnum5jIP+3XifoZ7dG+kGUjofhT+5z+B8 w==;
X-CSE-ConnectionGUID: TGYjVBPOS7OX9OTsX+Fldg==
X-CSE-MsgGUID: rtUw2KSuSv+ybRDTSMieGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="20833915"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="20833915"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 15:51:44 -0700
X-CSE-ConnectionGUID: 03CXSxG+Tbu8paenGzcP/g==
X-CSE-MsgGUID: kEd9bEitS3CumKRhjpl/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="87673211"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 15:51:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 15:51:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 15:51:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 15:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBmPVbiS7V1IaHEv6uXEZwhzMIQ+CszjaNh7ChNAeJbjQYcFuo0NOlz01MZBBVQewxteGMq/RIsos1xf09Wsz/Zc8qkFUgdCOggRYHiBswNY8S87FMInEv9KJJLgbx6U/F+VpZIyKpZeFBuWIFrmrXqqaost61eOxwwWeZUXKUgNHfm13dKtgqKDHnd5EwG4baHmupmFS0RBckOWHhKdIzaXUieIN+qNocNItj+yHG8xitaDVG2BjWiivtYi/IeXifAU9jFS4jCVzwU9BkoghdjWnFek04hkt5EGwl5j/OWHPc9CmjyCbXtZdxKw7EnMztnR7ZI/gIdviyVXswIkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8F6GmA8cbAcvcVX360udq10c3jNPMYf73A0+2X4kivM=;
 b=m1IJdSZMVlAIO7DtZHT3O8C7Dier6CeroXG8RLMaL6qKtDKNK5QfUr1uybGkDQBLg1Yk/W9rWTUOpLo3XDv9iussfUb5hziTzYeKy/ZmSKIWtMvP/WtNcqMXwMfdPPVtLpmHRMpmkBvWpq9jNOUrohuWeQOPnnNPueuQtwcEOJzsGWlWGGr3/RMol3PJsILDIGrb5o4LwcCgiWC+z3s18FooHLxvQD6H9TjTLm/AjWeIqfA7SJv+VHs3V+DeO6Zih3dYof19er+xCM7v87iQaYYtKD3bOi9untRvvi0LrcHhXbaLIAfvRGXsaF31kUOLAhKdM1IiREL0ie8sZJMHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 22:51:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 22:51:40 +0000
Date: Wed, 7 Aug 2024 17:51:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: fix WA 14018094691
Message-ID: <osdhyhztjrktv54nc2g4qqpzk7wljrnegk5ekulxbvajgjdpeq@5cmw5zdmc4lf>
References: <20240807211106.1322197-1-daniele.ceraolospurio@intel.com>
 <57qe3afswvijqjsf2vowsif7p4hofxn3mhv36e3k5wc5qwop47@xgh3gy6ol5cl>
 <20240807224209.GC5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807224209.GC5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d34ea18-6aa7-47c4-3e8e-08dcb7338032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VCKSdSTFzGgu3ZNbJNlrFj8zzwGNSq8qkEzPgqm9XaxbXR15tBcwMe0eaW0R?=
 =?us-ascii?Q?x25DodIRUcctVy8EpMFs7GTdI+KopfmzWZktYESO2sgsmXARbzgMGU6/V5BA?=
 =?us-ascii?Q?bbEYBQzK1Jxf/ntkPFZHGu7JWmSLy77Bw7B9aPMHOpafVc8WYOI0b99i4OlF?=
 =?us-ascii?Q?18pH/oj3TwPsv1+B637C0exLppg6C54RCIp4mpcS6xkurgTU2jOp7S1/O/lZ?=
 =?us-ascii?Q?DiLp0vGzrGicWiW7zAQFaxZ12DnXlRUEuk7XDhAKGBV1OFdTC3vb+l70wUh9?=
 =?us-ascii?Q?/Tthz96bsbMl9R9/fRDIldzimGpYxiFS1szHTqlYhDICeHQP8L9LhFUDDLdb?=
 =?us-ascii?Q?rQmqXahMHtu5xde7K8+mYhMv80rW0piYJn6zMLZrZZ3K2+tFVO4nvTGbAIcU?=
 =?us-ascii?Q?tVyzb+NMQ001sDUSBTO8S+WNRzOTKTzk9ysmd2C/dS4tPjAoigPBa3vXtmry?=
 =?us-ascii?Q?HAQD5Z7FKsTX+9zQbnIaJgLiucG/jnVuVExE36JqkAq92DUbdD6VNVpiDrAN?=
 =?us-ascii?Q?q5w0+OAY6E5DHuOhvlYdGxQfyFcXS3eIMczQ1g25InYs0o4p3BkXZ0BzxdaU?=
 =?us-ascii?Q?oaUXyzMI1WhclnYezp0eMdyn4YAgYMVSId/MgMFKa+qxC9l/8OJndVTXjfLi?=
 =?us-ascii?Q?Ut/Y8WyfW0BX+ce1NmDbVGLJxSgzP8+o8Bru4cnxZIjpqniyITc+oXzIUMfU?=
 =?us-ascii?Q?0uhIktELbc8mviabjxiJ/oI7pdNVk6Vd9xcGIYlgo7OfqaJfI7obsWeDQyKQ?=
 =?us-ascii?Q?Ce6P2WvmLQf4iOAyr6yNRV7ZBcmShjtSteZA4l4pg2D5YXOQdMzK3Qd0RMmt?=
 =?us-ascii?Q?YFoBnHK/PFTUS3XOsg0xk/Q4G4FV/+1da1WcV3MCXZ8RYtlTv6a19lj+Vix1?=
 =?us-ascii?Q?Ru+z4yj6uiqB5eblQlIxD5amtag7jY7iPEuprrCcJjh+dZdm9YDW+ISbNtuI?=
 =?us-ascii?Q?M7zO4aZa5Lr/oPzDm5EjCjH0cZTmZl6sBQotSMHv6C4cslbiiUu37+cX2SJ8?=
 =?us-ascii?Q?HtR9Q6tXkN8LrZ66Jy9UrlDayx0ZnFTuHgsJZUMavO4tkvuQ9qiy7Uknfkcx?=
 =?us-ascii?Q?uuGxmxxiJJTwZH67DlGJ6hslNd/II0S5ZdhCS4DIvcqDtYolJgzA4RARRhJM?=
 =?us-ascii?Q?LQ0fxJH+dTI1FGTRIv1xiLT/Ij2j5GgahG31uT/EDNOhqVpJDwJ0AknZRTTR?=
 =?us-ascii?Q?G7apoPZqrZqWiIYp2DBfY6TFudygbkVDnXWlSJssD1SEct8G9E8QItU6jQnJ?=
 =?us-ascii?Q?QGD/njXXVA5rAgFVPiQzR9uOHCKJa1ZiC9LUetRxdZ+vlrKHwgPAxm4RRniZ?=
 =?us-ascii?Q?/1BfqlFonxjqeFzX/36UHvaaIe4PgCca2h5EKPG9UDQjkA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1GrCyBuxN5jgg06vyRgIUJRdIy8esMy2YMXi8aA9yvJ5RI/INdYW60JYAaF8?=
 =?us-ascii?Q?d+iLhTYcqedP7hkvdBtUCqtubuEBr7pqPMn3ybWTfA5tZNmdKq/E07eNgtDc?=
 =?us-ascii?Q?E3LnqZ0JJXz12szrJN8q3SVNfe1SxyK4wkadTlBF+EUzYKi0CwEhRO5P5xIl?=
 =?us-ascii?Q?SlNIrv/nZYNld2SGandnrPtX8O0eh2+IgZDwt7q6ie4VYd/V/09MH88PImPs?=
 =?us-ascii?Q?PlaXxDjLdUQv/tZrfQf2ewPaeChLnIz+KD81T1lRi81hy1yOmYuJ2E337bMx?=
 =?us-ascii?Q?zKRAS1RQmAy4oPFDrZkPwWfoVfCVu4uQ5kE2/zt5C9W7LGkSi4alunVw2gWM?=
 =?us-ascii?Q?Crp46T/w7w+082O2dR6YUYs6emyBiV2cM2it/VS07oeczA1Ykkw/tXrYv6J7?=
 =?us-ascii?Q?LFYbwgDB2V6itVTlG7i/pZaxtL0Gjdl3bUv6Sw22eq+RwSCniSkmwg9cX3Jg?=
 =?us-ascii?Q?h7HpMr58VrrbIXGWpyssT4q4BYGbUVRF40qFIsCsgxYTPZFEqF/8Py7jqshA?=
 =?us-ascii?Q?zih9WoEWuoipOc1BaWVgJ8MBL1eHLg3/9MGs7NX9qiceGTKJtNFOEy+zGmav?=
 =?us-ascii?Q?XmD7ugdSaHg7p60LU9FluzXwBKjf5au0kRaMhHVK3p/+PZKDyF7eLY+wVkXG?=
 =?us-ascii?Q?2y5yhcUrRCLllvvrsPBd5dQZW/qjA+HOcwyRk5YebWQcDuU+AsB8kD0zNo+6?=
 =?us-ascii?Q?/tHPwrfydyTB1uvIzgNv8YyC2FmooA0QiA2Ex72bYC9ueNQxG8Vl7JhoXqiT?=
 =?us-ascii?Q?2N6D/5gP7LmYaOv/thjp4A4QxZIWNIRP1xftbnhPodUFP3iUa7Nt0W2yg7ZY?=
 =?us-ascii?Q?VETqlwsQlZfMV24W3KCB1QWSX3jcVpbkY4GpwJcNntmat9+cBUfFhIuScpoE?=
 =?us-ascii?Q?wj+t2dVSQpM7K2/4IvcUrTElpcGCNt8BaVbWibyQiY1acAiKFTazEcJUdg2z?=
 =?us-ascii?Q?sM0O1wNWGsgZNOyEwViXbYRnjEwTIxqsSkLUF9IBWxTCW9u150BUSGGz6qq6?=
 =?us-ascii?Q?XcSPnky7NbJKlmOEAaANCnmi07sPR5INpr5afGcs8OmukKGdjs25AOaGoenb?=
 =?us-ascii?Q?qenoMQBjyddJ9+okL+GvjSiuTguJ8niqLebq4PYxesPFC2YWwLTsBEKAuXRr?=
 =?us-ascii?Q?1E+dBAMWQ9PyifBbALTN9Vg+wckQFhpLSgyMZtvVpr5E9CKAlBUIEKpjWnsC?=
 =?us-ascii?Q?IeLBX5usigoyGQ8BZSmuQ0rpuBjROOLiy/88b59McdgNaVO55lazI54pQvzF?=
 =?us-ascii?Q?BF3DCl28Im7NdFAWktTdb3tcqn0Z/SYHsSDdC0HyLVognX14ddS9iLxpj2pM?=
 =?us-ascii?Q?4uX/AB2lYhDT+EXQQe00WheVYdswkkEjL+qJEKUHTX9C9Fv7SCd/GTOiK8e+?=
 =?us-ascii?Q?7EKJlfaMAEjYyWokKCchcdn07wBukIkIcIJtK6NQ8vskLzgTrXm313faN7YT?=
 =?us-ascii?Q?2qS5d+RFqcDiKPMJ48yk8tGXySgyuWlNeJt3kcYbPu9pwlmsXKFuqwVOrlQ4?=
 =?us-ascii?Q?o7FR+7NX07DWPwpzJZNwQ689JK5x+vXRnJtBBWFfXsdvi+O1egpbCIJKrpav?=
 =?us-ascii?Q?ZNLZjY/0ShiqW0NBjOd+O0YIUM/acKGQbCKt5o2ckQVLLyGoSZv3VWybYMvL?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d34ea18-6aa7-47c4-3e8e-08dcb7338032
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 22:51:40.3365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SIsoaAOi+LH0XMaQHwDnLmlr0iMECqqiWWNh5MaUVFPwQWiAVC8yBivBaq+OXA8QzTS2SLy2VEuihwZNbEmRl3nbEwQ4gR6hYoYhwD6EXYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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

On Wed, Aug 07, 2024 at 03:42:09PM GMT, Matt Roper wrote:
>On Wed, Aug 07, 2024 at 04:51:32PM -0500, Lucas De Marchi wrote:
>> On Wed, Aug 07, 2024 at 02:11:05PM GMT, Daniele Ceraolo Spurio wrote:
>> > This WA is applied while initializing the media GT, but it is currently
>> > defined as a primary GT WA (because it modifies a register on the
>> > primary GT), so the XE_WA macro is returning false even when the WA
>> > should be applied.
>>
>> humn... I don't see the media gt marked in the WA db. Does it need to
>> be updated considering the GSC is actually loaded in the media GT? But
>> it would be odd to write to the primary_gt. So... alternative approach
>> that I think would be more correct would be to change the implementation
>> in drivers/gpu/drm/xe/xe_gsc.c so it passes the primary_gt to XE_WA(),
>> just like it's doing when writing the register.
>>
>> Thoughts? Would also like to see Matt Roper's opinion
>
>Yeah, I agree.  It sounds like the workaround applicability is keyed off
>the primary GT's IP and the registers that need to be written are also
>the primary GT's copy, so I think we should just be passing that GT to
>XE_WA() as well.
>
>BTW, it looks like this workaround needs to apply to both graphics
>version 20.04 (used by LNL) and 20.01 (used by BMG) if I'm reading
>correctly?

yes, it's the second patch in this series.


Lucas De Marchi

>
>
>Matt
>
>>
>> Lucas De Marchi
>>
>> > Since both GTs are involved in the flow, fix this by marking the WA as
>> > applying to the platform instead of just the specific GT.
>> >
>> > Note that this WA only applies to PXP and we don't yet support that in
>> > Xe, so there are no negative effects to this bug, which is why we didn't
>> > see any errors in testing.
>> >
>> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > index 540d38603f32..40354fb01737 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> > @@ -19,7 +19,7 @@
>> > 		GRAPHICS_VERSION_RANGE(1270, 1274)
>> > 		MEDIA_VERSION(1300)
>> > 		PLATFORM(DG2)
>> > -14018094691	GRAPHICS_VERSION(2004)
>> > +14018094691	PLATFORM(LUNARLAKE)
>> > 14019882105	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>> > 18024947630	GRAPHICS_VERSION(2001)
>> > 		GRAPHICS_VERSION(2004)
>> > --
>> > 2.43.0
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
