Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10263EFB7E1
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 02:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DED10E236;
	Tue, 24 Feb 2026 02:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WaKx7yVq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9FD10E236
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 02:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771899436; x=1803435436;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P1rvBtLflJljBmUwuISYGZ9gTQ1uzf/Lt2g+THuGrLI=;
 b=WaKx7yVqkZJVxIzgEYTiadxeJBijv+dnGGlJResGwHoLzGafoM7h2u1T
 29WYKAbceQvOI2WJnsPJ0Z95cS1NzrE71hhWy9QV2eyRbBsFcoGBmsMhF
 Th2GDT6AwJ3xyZQhXM89TcLrtshELSttf/2OFMg4F8tq4wmTpcqAzrSqZ
 m6UhomZtmFYkui+9RzUlfQSnlIwHsA1QM89zsW11kg4nlvuT6bxB7Yo/q
 lIEf0k6QdxJsGEl7P+ePskFej8juukDyjaxiCE4/JWlbwdxaMg6Jz1Kyn
 thGyJKbTtVUxcgrZLfAZVmOexUgjKZspw1jNz91n5EdFFEDKsiWPCjJez g==;
X-CSE-ConnectionGUID: KbskQDD5TaiygrrIWja5/A==
X-CSE-MsgGUID: usncoSikT/eB7EtbDGWJjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90315285"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="90315285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 18:17:15 -0800
X-CSE-ConnectionGUID: 98Uyx2bmTYG7QHJmvL92Rg==
X-CSE-MsgGUID: 85HNYfRyRcOxYK5v3tkWQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214037435"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 18:17:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 18:17:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 18:17:00 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 18:17:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUExmBUj9C0I/7oWlPsN5gWrLg23nWYchKWSkpN0z+bo2ztwEzXD2PlYAEQBsU8q1wfNh3gNuj23aLITFjRmvhjYqDx0rqkhytFP1YuYrf0HJWqiWAphxwwDkt2QNYKPfi5Qidrm9OXYvohxrqzWnA0w9vwOh6pAwpjleVFpdhUvsZ4SHJu5cKaZUZupuGyC6TkK6fB/NRDJvyJqXTWvjSqdkaL8PFTItng53549Y53JkdhDPiVUzJZh9npTM7tv13EFqJRiE5JXcm5DBnf5VKeN4ZBKj7as/OSJI0D1yPOh+u4RUW79OlTOah30N6D0npoe0HYZ1Eu1T1qBRGocLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McN0eD9fQyBH4/myj0oZMlf3ikkQDA+1jvja7Meuogc=;
 b=KgMfLOyuUfdU22rEQGNo6Q6dANpxW7iWLYCdzaMsnxmqLtNzXDTOzJlVQlpp/bYixovsTpwa9k9BXnG/y6uYtulZ4ZsOnOUbekrw58Pq9MT0CwUMU9kjeyBVg+R6Q4bg5F9e8WjgH8mkqudvg6ejlfbZXkMlgok3qN6NHtQ9yDkUDuejnMAJ8Eg/znoRXP+vQU/O0kuaZ2BL4un9hz/WjS303Ul/ypReG3ZWHMfsFuW8BXU1lEUBZd1EWz/yhSKctHsADWft+peIAZvU2uO62z02F/QhdXav14pu0A3NcgWQLAcSnqMKZadDODeXi8g1w0uG1cFSpJNxfDEsis+kBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9423.namprd11.prod.outlook.com (2603:10b6:208:582::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 24 Feb
 2026 02:16:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:16:58 +0000
Date: Mon, 23 Feb 2026 18:16:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH 1/6] drm/xe/svm: Use res_to_mem_region
Message-ID: <aZ0KGKDe+z86vSML@lstrano-desk.jf.intel.com>
References: <20260213092552.1527799-8-tejas.upadhyay@intel.com>
 <20260213092552.1527799-9-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260213092552.1527799-9-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:303:b8::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: a3dac673-9442-4d4d-fc7c-08de734ac9e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ml4OYNBwgAhORG8R+EIjgoXq0vzhopLb3yeJWmYbK7ArOFqg35uZghpsmbqN?=
 =?us-ascii?Q?8wbi9fYH9ZQRXqTjY66U+kpqlSxPPD+Vj2D7shWjzN73Md1rKBl9DTMRRxWb?=
 =?us-ascii?Q?O7idL1WOUi895pGZ77BJr/3585m3r4cMfnws8p3WgwBEeJQoCgHIiuTj3b8K?=
 =?us-ascii?Q?CZWowj9XyjYOUU1LV1Lzgbo4qTHY61oQwIO4vTIyP9K7Z+UYUsjox98QwV4U?=
 =?us-ascii?Q?mh7jvPAuQF/QiMiIHyR0TMKdfiR8T3PBnAu3UJROYOytiaCcW1z9/uMikqYM?=
 =?us-ascii?Q?X9HgCndsS/PxAzhDS5vqvklval13pZSa/lYm4y+lk/aUj60RjWikhXconBGF?=
 =?us-ascii?Q?aGZG+NnA1amSGWqPcUXs5b4Mizbb53Xuw5L2En7yOISzLBQfTKNWVEvs5bL6?=
 =?us-ascii?Q?UpVuUgCfNX/rKoFQ/Jce9nR1qPPEzuDM+k6x0z4a3FrUsXojAcKomdmMmAGI?=
 =?us-ascii?Q?HCYcaDErnrHYko/nDVJfmwWbw/hJFNW2a46SDj7KXXZeuge8Ac81GyiNUKsk?=
 =?us-ascii?Q?7DAnwslskGcKee6c9eWdgHMvlN15oE5LIaRv/lTVPStfE6/DVB77ITAtjUQ8?=
 =?us-ascii?Q?ClxkpohqXMGEi23yQxdtUBfPDADXYDuM2jUzzZf2NSbIuUxh9HCNcvquT4SZ?=
 =?us-ascii?Q?weDDQ1cqX99Hm7VLE4A+eDn2ZnzYLg5UqT39DLaMWZ7NeEw0YhGh7k9NQJ4h?=
 =?us-ascii?Q?6qVy8B4aXk/Wb6PdVgE6HT6PA+7ql5lzWYp/xbdAzRRFcKqp9HGbtFP5yYXM?=
 =?us-ascii?Q?P5OBh9RIzlk2SqVl3iiHZdroUGB1JJRkcxyyQpsXKciSt815OxMLCJJzYVMx?=
 =?us-ascii?Q?wP2hIZcZE2w9EDuodt/vExcrMReRRdTIHU+q0w7Oeu0KbE8Cciwj7nCiK7Ya?=
 =?us-ascii?Q?7QMdSFY4z6W3do6THxkdTrfUAcdcHjU8AVeKMsVEA5YCbTQE08zMc/ZVtii9?=
 =?us-ascii?Q?QTQEeQ1fWj2x18JhQhxkFt9dIp0srxYu10Jak9vJ6WsXJ4T3//lxwpI/IVAI?=
 =?us-ascii?Q?F7oIftIUGqTt+osWkvRexp0ULL8ULY78GsLJtPnlORNOQosKde2ZMcqfVBL5?=
 =?us-ascii?Q?znQ866zzjAszVTPcTOtaRZvnIQt4cGCuNfusyehJyDTr6uqiRhxPXzrBzRMA?=
 =?us-ascii?Q?ScWR2m5NWb54gg85lhKpvAEW83IVPF3Y2pM5vdCED8AOsgAkIIZV6FtjnGJF?=
 =?us-ascii?Q?62IFB9LMkk1zA4l0xNjNe6yy8YuV9LCBFnlXxBqZ3emt6iNT4CR9kR6tpdll?=
 =?us-ascii?Q?/5gGAnrupwZnptGkWz1XGBrJhciiowZUYUq0v0PYoeCB5gRhCxJmMU/W9cD6?=
 =?us-ascii?Q?P7z3vF4/WQR0Pc0+dfOf1Qi6w1AqRP90+iVqJ0z5wu9UGKN4n/0H+lJCHdCv?=
 =?us-ascii?Q?UdvMf+jE91NVvvK2MKE4ZLGqZsY4I4E7FPe9gvoEWMsXcQiESugJKvWw9hqN?=
 =?us-ascii?Q?HJETlcU/8VQ3xwvZOefsfpOUUcDGMnqtCvfIzX8a0CR3pVOeYOQ1nBoJS8d6?=
 =?us-ascii?Q?fVHHgCbAfZysC2FlYTowt8nfkx/bQog6dbAruWeOJ4WR0nKWKRoa02hvmSFC?=
 =?us-ascii?Q?UUEhDIGHAtf/b2yAV4w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BGcKUO04UvPW4z00v3P55Z9pvZ/4G8A4XDg6290t8r5GMJ4pTqTjRJGVDNo/?=
 =?us-ascii?Q?kmGjud7X8amEtLa0Q8bpi8beZ67JJVObSjnPnRB+RXyouNFvioCUqqiG0OzY?=
 =?us-ascii?Q?4DtQC0dLW4AtYiXEPY3ClnkPo34T43kMJi3AIf5+TrfgTsRPkScrkLlZHZYi?=
 =?us-ascii?Q?6XI8alDd8cdRqO+6E5HO5bhABt2qLp24K/u3aO/qCX0bF2noWuJRD3+9SqDD?=
 =?us-ascii?Q?Lpoz2JaGxW888ilBG3QhZWcPfk0kxC4lXC3/FQYQV5ARmPefgwkhVe+ouXaH?=
 =?us-ascii?Q?Lu9eZOrUl9M5FVcWfc0OAr7MTykmGXrMyi08hBAk815p4s5eypzin56kW+bZ?=
 =?us-ascii?Q?wFs59vnEMGqQD1dUjJP9C5ToHBNyH4Vr8y1lfU4fJ6waTqmcHPZvgo4B2/QA?=
 =?us-ascii?Q?iKJ2PMy848sNTo6dmvwcSQe2iw/k0RHavjjqUxyg0XyAsyPcknLYom2yX6O5?=
 =?us-ascii?Q?JXQYiDfnb8LHl26Gl5NiSzIJVdqgzvt5UFHmB35dOzM0KPYY6QSBK0lRf9i5?=
 =?us-ascii?Q?LgtbxKcnYRTns3He/OZnfen8ATgKz96IdeczX/V866z+LxiK6lXQy5oEXG8u?=
 =?us-ascii?Q?gq5SoqKkRNs08l9hHIsPORjmUgrVGLqswJu4rv+lmbRVOnz2RlU7/j42HvnG?=
 =?us-ascii?Q?UU5obGXwfSJ4j0CMpXl0fkIlYzSRNDGFXgla38my99yl/kOlFx5jmXBmEjhy?=
 =?us-ascii?Q?ONSXBd7tRC47YwJfRu6cVFqJD5YA1B7+yCJ+Ejm6rEvgRdX7eKm+aqE6qn2Z?=
 =?us-ascii?Q?JB4qgpLXP0lLMRIoOB3zEuZ7uN53R5Z2G9XxTDJj/GqPquxFHX+0vi1BItA2?=
 =?us-ascii?Q?VMs8KWa0H1g4Tu6GK42XD8xy0/24E+2+rOAvaomrtsfjri6egbmrMx1D2PdY?=
 =?us-ascii?Q?J1WMZWKZ5KmrVswSHr8/SWnizeyNGhqQGlEUWxbmPdYlxOUl7D7t0/5DJ05q?=
 =?us-ascii?Q?SQKM8a/86IKv27gcoiukHF8+bgbIGyKB6LtoTwtokZioumOzkY1rbElVg0D8?=
 =?us-ascii?Q?6NL4UgF1n1fK01ZxIMkHs3xq/xukamGGpMyPJTiad7ekf3Xn2GIvbXpokqL1?=
 =?us-ascii?Q?NKFx/Z8SELqC/q94BXi1Fi/CqNhAQIj3gQ7tUfkuVQjEsi6Ip1FflSzUs6fB?=
 =?us-ascii?Q?GJJjRujytbpOenjMLIUoDuv6QbJ2/lKIErrMxZZo9+iYGhCaRGgT4TwfV+Cn?=
 =?us-ascii?Q?K8R8wdu/+LBlnhn5Lh++DcGwavbHvuYzRnr9EIS8d+2akxhtUAnoeqoW7edC?=
 =?us-ascii?Q?3S6lRS1FrWbuczcEFRZBQsN8YnOaTwwoKLNaukFMBGUZEcYnHQywHZtiO/Ug?=
 =?us-ascii?Q?IgZgoVz3gJ6K6Yd9h5u4+T89+yAFrGWbxjs468CcoblAQrNxNVG/ChKntfc6?=
 =?us-ascii?Q?IFJhMK1qK37JHAEbagGDuXem6Sqv1nz7K5iyoASIsvpyqSeFMImAkxWb0enB?=
 =?us-ascii?Q?VEYd73+FNIPImyj/G7Srrd/n0tJZGaqoNiU5uoBRmHdP+5xk0sVEJQ+HBC0O?=
 =?us-ascii?Q?eiArQW0hLKSBsDQ3Mt9ZgJcG8pB/+mHg842T+B6tA0rQI4TpoumF4P3iyEfD?=
 =?us-ascii?Q?Dk7LBcRjPp5vD5hTOzatsboe4PfbyalTpsFOZxwPhnveoPueH7t9cMBrEEdG?=
 =?us-ascii?Q?HyA9miB5RUFWEZPAAC7YaXFi5GXg6t1EhhW/vb0xB9PbkfRHAybOzc1w7czf?=
 =?us-ascii?Q?UoQ5atwLEo2Oe6HQNW+A1MF4wwHPUnhT+pJrw/UfO2SN6eBNqwbg25dgEReK?=
 =?us-ascii?Q?+zPQXXLFskrvZ7ag9oxAJTsxbjPo9NU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dac673-9442-4d4d-fc7c-08de734ac9e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:16:58.6786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSWxL7C5c8QQnPg+WKvHThwFfdsEe9SnGrHVuIwKz7lMsQhHcxFLLcufOa0lFVcxP694tyBCQmM2vzVtausM1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9423
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

On Fri, Feb 13, 2026 at 02:55:54PM +0530, Tejas Upadhyay wrote:
> Replace the direct use of block->private with the helper function
> res_to_mem_region to get vram region.
> 
> V2(MattA): Use res_to_mem_region
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c  | 2 +-
>  drivers/gpu/drm/xe/xe_bo.h  | 1 +
>  drivers/gpu/drm/xe/xe_svm.c | 8 +-------
>  3 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index cb8a177ec02b..70aca621c1a1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -173,7 +173,7 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
>  	return tile->migrate;
>  }
>  
> -static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
> +struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)

We need kernel doc now, perhaps a better name for a public function too.

>  {
>  	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
>  	struct ttm_resource_manager *mgr;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index c914ab719f20..393f1b4faf99 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -311,6 +311,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  		      struct drm_mode_create_dumb *args);
>  
>  bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
> +struct xe_vram_region *res_to_mem_region(struct ttm_resource *res);
>  
>  static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 213f0334518a..8015eb6fcbc9 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -762,7 +762,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
>  	int j = 0;
>  
>  	list_for_each_entry(block, blocks, link) {
> -		struct xe_vram_region *vr = block->private;
> +		struct xe_vram_region *vr = res_to_mem_region(res);
>  		struct drm_buddy *buddy = vram_to_buddy(vr);

vr, buddy can now we declared outside of the loop.

Matt

>  		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
>  						    drm_buddy_block_offset(block));
> @@ -1033,9 +1033,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  	struct dma_fence *pre_migrate_fence = NULL;
>  	struct xe_device *xe = vr->xe;
>  	struct device *dev = xe->drm.dev;
> -	struct drm_buddy_block *block;
>  	struct xe_validation_ctx vctx;
> -	struct list_head *blocks;
>  	struct drm_exec exec;
>  	struct xe_bo *bo;
>  	int err = 0, idx;
> @@ -1072,10 +1070,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  					&dpagemap_devmem_ops, dpagemap, end - start,
>  					pre_migrate_fence);
>  
> -		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
> -		list_for_each_entry(block, blocks, link)
> -			block->private = vr;
> -
>  		xe_bo_get(bo);
>  
>  		/* Ensure the device has a pm ref while there are device pages active. */
> -- 
> 2.52.0
> 
