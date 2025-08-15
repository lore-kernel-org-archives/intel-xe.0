Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2870CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 19:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB0B10E363;
	Fri, 15 Aug 2025 19:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="db0RhEB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1167710E363
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 19:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755284697; x=1786820697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A0uiBeKF9HkS4qv9Jd6LaqxK3yALL2StFhXCr9O4BP4=;
 b=db0RhEB4hPKCfTU8DhbQHMdk0E+fAQTpgd+zqHPMMVLRstCRLTG22sy2
 VKYKlyWmb4ZGuZdofzhucF84cFpUMFGMpTR72vgYsCvmgoqJDzHTLhZhS
 5avXQSbwRPcO1mktUtKMXd7DEEATH2WBIDLk9vonL/WAsMnqlNxSApCfk
 rqRfnHPPN6dbjHJat3NyWAvmQzbo2ii5lLKJIS5gC/u8smUVWNGYT2HXJ
 L4PFv4Pd1kQiC9agXkCMrH62wqWqvxFy0PDJRgJIQKgRjzPqhFKVIwtkk
 dxxRcyWmUud8GW1GjR4UQtRccBAH88AmjrZdNjnUUSZAk0l2+O7f9tWzE Q==;
X-CSE-ConnectionGUID: zAap8U/pRISY/D4D5HXmRQ==
X-CSE-MsgGUID: bzDbvP9FSh+fcMbuTepVvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57681650"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57681650"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 12:04:56 -0700
X-CSE-ConnectionGUID: wHf9B25XRMykoB32aR54lg==
X-CSE-MsgGUID: yY7b3xlmSdOOjZJDtpOtHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166705851"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 12:04:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 12:04:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 12:04:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 12:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OOE2Xtdj3HxquAvz5pgjUDYp+Lj/5Ul8z4Vt9D+X4E6LtGrjfMevK4EfvNAyZ4cZfv8X6WUKrqBlWIp7+h3m0lA2K4WuF9VngnXTCohDIYsCAlp8eCkNlq+Kj6buL2xo7LS3lMn9GGYmiFtlWTO+WfVdA/doa21iVrzDcVd3jmxkCfkzHyZmfOuhJ6ZRsXW/I15j1e9xXOfWQPRPH6BWf7ljnq46/VsDhq2uFk3o0vs4thqHp54HiMhUkWvJZ+Dm7WApi/rRbBxKX9V34uxSTBxYjRWVIYTKZw07oyi4tlYuOJSN8iCaWP+2ZyFfACOUzw5mJYtIpPdTMXNbNtiVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yejq9VV7g4jKPnQrzjGgZFBhS7rLzzJFEvB4kChNwkE=;
 b=BO+rekXijuRqM2YCBaaRmGIDRjpaVvuo60g1WMShFKEMrkOOnLbzntKPoFJZB6et8D6D4hwRRQOOeV5n2tOgJbCjp3ybFsUnMSQnmGOTQqxxtwetc97qnlSOQyHpxrDAUmO0uE9H5bQ49kxpIJnmXfQIZpxCKwsl6OAXX5j3TGdcf0/JolZuYwCe+tPC5j0fnbtKi0WgRO4cDVTTItLlbmuWSA55n02upJHoldKWB+LF0eapMhXoXFCVxERS+QEmQYuF5zlzn9bHcH4lH4kFstWH8dCIQrIAlbfkSLiZa4L51OqVfe/REgSNcUgFb0mC8LVABSyRFb1fE8Fc7cWSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 19:04:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 19:04:52 +0000
Date: Fri, 15 Aug 2025 12:04:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 09/15] drm/xe: Convert the CPU fault handler for
 exhaustive eviction
Message-ID: <aJ+E0UbTPk4FPenz@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-10-thomas.hellstrom@linux.intel.com>
 <aJ0MUTkV1j2xWAam@lstrano-desk.jf.intel.com>
 <e37e926918884fa683713db9437f2e7c0f0a07ca.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e37e926918884fa683713db9437f2e7c0f0a07ca.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:303:b5::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d47eb8-3278-474a-43a4-08dddc2e9d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XHPBJofWtIubX3s619b8l+w2e8cytWCreoP1l7JJLGNDaZ/IIfpZt44NoI?=
 =?iso-8859-1?Q?p+LYw9CWLmu0dx7dtncb2VEFqvpvG0CqKOuAyqXsgwLudC7EXRT9Y1zpLf?=
 =?iso-8859-1?Q?a6BP0PTCpgqVlrXwlTKqoXtRTcF7qy/Q19CzVtC6LkLnlSpgt9LHugCt+D?=
 =?iso-8859-1?Q?wvV3yvqe9h5NKHyzwbL3K116MfsVq59Tx6DYyqdeJNTYqBwAVHNUNUkq6v?=
 =?iso-8859-1?Q?alT5Pz97cvIqEyyveu3LVSgbLGUSjAMFpeuxgybilTTLtlorNf3ZG+lxN/?=
 =?iso-8859-1?Q?FSOpVeeej+jUm0ccHJJy535UjK2uAZAN9gFMC0A3t/Kaiv2pXEq7X0wdDI?=
 =?iso-8859-1?Q?ua9M01BouqTvkI+7vYNpKmWTlz7oq0elMSgZY6tBgylIVf9qrzhzV8wi3P?=
 =?iso-8859-1?Q?yhdPhmwvKLtxsFW+8wJMHdI4rQdn+fu0UYkjFerJR+pJjjU27QI9t/ddfR?=
 =?iso-8859-1?Q?OqzKqasWe+MynfS5SnCouLqLvJmOx9xQr0Lpm6GVz90uWzBkITunQAEi1U?=
 =?iso-8859-1?Q?piFDUNEZMHHE35TmOXpA4HjJxtIxTBjBo1PnvTHsF0mkOiMaeqYcnHP0QX?=
 =?iso-8859-1?Q?6OyG/ASA9VBnxMnRkhBwC6dk3cwX66mjafgHjGCXlTjdzlTxwVsegFuYEe?=
 =?iso-8859-1?Q?UqDwsPwqg+OjrpKX9mYQJKo6vCPq/SmPcezeUn6NBVxTqoYfFO3at9nf/6?=
 =?iso-8859-1?Q?r4iREUFVDhDjZ+YzM1J4snWZaGey557bMX19c+O06BGWaZzJakTCt7ORj0?=
 =?iso-8859-1?Q?2zzNY42Ok4pSqbjfGuiZNjTM7epEcXEaAhbuyoqEcjmuxMcD8GqI5RZLE4?=
 =?iso-8859-1?Q?pM/mA9QlmFgxkq2MvPdlJ7Z/2p7AvyRdvF70g2ZZOBBP5rCz/G37wVp841?=
 =?iso-8859-1?Q?iZk3kD/MHMTBrkL1TFXVIwyXf9mlddXQ6avEyU4+WUzWf3Vs4pvVZtLnKO?=
 =?iso-8859-1?Q?4lumOj7kSZe+n0O341PWdhK2f7m+IPLytFsLTU9ocVYh8aBHNl0C9u0T9n?=
 =?iso-8859-1?Q?6Tn8nuyEWcRyVCjZqIS0sjC4eKMfWWaONYtiom0GQ4gGUTFPcc6Q2gETwa?=
 =?iso-8859-1?Q?BEeSiWzYb8QHEGGXFLd/ntlANxgNFttwB4eoFAueNhsiJWsjQI6xYzumKp?=
 =?iso-8859-1?Q?fEeiJ0OFUbQBta3RfpY6fAZdhU4ISvSD1qhNiA/Fd3WL4w6AX3bFgr7IRH?=
 =?iso-8859-1?Q?y5GYvvO2gQyH0RNbTNVvLGtKhOC4Y0g2pYrv/vzKEA7gyMNv3EqhCwu9IB?=
 =?iso-8859-1?Q?ivzNfHRpZIkFb4cO6RQtUbtDmLE80dMpWcOmBsqcFsT0cF33dln8jl9kVE?=
 =?iso-8859-1?Q?B5FtZrlF6JcRvpZAU7Ighy4pHpgPOxcd5NaxlDSyH17QgKgjwmW0MDic7t?=
 =?iso-8859-1?Q?RP+Z8zwXle+H+CNyNOxKOQb4Ylkb8LZOhG6iWHOrCLoum/8Un+h1YmUEbq?=
 =?iso-8859-1?Q?Qunq1PSENWPAOzivemNoQxjZkYfe0Rm6OK8naK1X64ZXvDqAsHJejpg/X0?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0KCZPTsFj1jIPZyksevafQ0DKEZKe3JcQVv9luKTSyE0qmuhH45C2MIhE9?=
 =?iso-8859-1?Q?O1f3lcp0LAYyHLIPNZJ7w7IHcrSd0Uqnym+W5wVfVt+C23hvbrhO+izdDT?=
 =?iso-8859-1?Q?SxzRDqXGMhTU4q4rarfsAANiQy9KxHzzxhdrMEFskrJAmHjvN0d9jzcue+?=
 =?iso-8859-1?Q?O50vyrRTxWiZjLfw0BcEYw5nF2DRWk8OiqOz0ltsrMU3dQS8MfH5BpqvdH?=
 =?iso-8859-1?Q?oqzA/RuK9EfTwceYAJC7aUGRfYLEPPRbLFde0QfWYUL0S1BlnOyOrLT8Kh?=
 =?iso-8859-1?Q?FHr/v5RQmtAnRLBICic3lANZBhIoHp3OcUBwb8tlu5WQcdT6NRSOwFw7Ig?=
 =?iso-8859-1?Q?UUxs4M5jqrpA1+8hELz9gKILOX0C6Z1qyqodQsC6KomdTh717S1I7xgoHB?=
 =?iso-8859-1?Q?Bf+sMO80iuymHkuCUNI6M8JompoKuMakk42Ql6olEEoitdh5KAsViDJwgw?=
 =?iso-8859-1?Q?f+ldN5PhINUEye660pst28I+ADTqKd3WGZnMO0Wt+yuFEuYrP23EgV9eHL?=
 =?iso-8859-1?Q?AN0LHBlh3lkBo/OkhQfU9S0pto0dzvewXPnvIdzGP9TBC0HNMSu59YafzM?=
 =?iso-8859-1?Q?ZvoqYmjAE6Y+x2wR4baHgu+aKKzgFBi/dvjR9RGaYBBgXpGIE/NtneGU8I?=
 =?iso-8859-1?Q?4xVgdO6aUDp2GVt26YFS+dOXsNz4IUuAjKsD405ZNZh36HTqsBJN8CDpoA?=
 =?iso-8859-1?Q?2VlhN7qEAvleQFICpXOlkXQWWpYL4hoUKTFWoNV/qzaA72LxIpcD4kdqXA?=
 =?iso-8859-1?Q?+cMo3pDttl70e4ZkDkhu76krXKWJ7JdTzCSA0j1VQqu97JNS8g+j1B6Dt3?=
 =?iso-8859-1?Q?/cid3/KDdax9NbhxybxYeVYCjYIP252SxMgQrUfgtF6Oetlixauc9yh9ar?=
 =?iso-8859-1?Q?b4dm2XMAUlfOUeA4RFqbKWOl13FCsvd3IB5ZC08POxSaje+GTd5X0ljybW?=
 =?iso-8859-1?Q?/qZCH5QOytUYn4fuRliCO0CYHTS9AY4JAAFIoDGHT171oooMu51vHjsIT0?=
 =?iso-8859-1?Q?t8A90UeSdEylItydW+BNLzASw8Xazv7/2ZNNFuIuqRhd8zbw0rxVHDAePE?=
 =?iso-8859-1?Q?dTEnYmooyq6aIYVAUeaPcYHCBu5AbBkNzNQ8ETwpSwXLhcJCE/mryz4hKF?=
 =?iso-8859-1?Q?l+7zwfXPl6lk0xS7k5tUuIoVzTJcpS0u50+czTedLwLbku+EIxwasCXYH6?=
 =?iso-8859-1?Q?QnMMNUYYEpi9p8u35jPoIcIlKKoQ2WdVVeXJN227Kiw33gENPs+oJWT3he?=
 =?iso-8859-1?Q?GtjMlBEmrtxgwXwj+Svo4G78wKvjVCTY5vncIBqTAeNDE+d4be59Mx/5Nu?=
 =?iso-8859-1?Q?vw2EWVGys0QXnfZEJ/5d3DQVFkNITYfIM7i04iEWg4bdav3i+6qe6Ejd9Z?=
 =?iso-8859-1?Q?OEEosKww0hc/bNEi/aRfHhPT/gI/5Rotj6VF1m/DdYnIq/scxHCy2MGaUu?=
 =?iso-8859-1?Q?24T2Z7SluQJiledRUNQsxPeky4O/3H6xvwaYEGQ1ir4NgbWttEItWpuHqR?=
 =?iso-8859-1?Q?cXJ+2C+bH05MYZarmCxXPTtUFB3/XtbCLLKCOUFWmfoG27ecnikiXN5PuM?=
 =?iso-8859-1?Q?QsB+ymL70VFeKxNfDDuPr3HJBL89fbWR4fB7OSjtM+qGjhTFo1JoWhCGDw?=
 =?iso-8859-1?Q?/dEbtwKXG6qO3MOSuO0fX3/k2/EGC4xN9S6mLR0Dw9wX+4zEQQAw8ZfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d47eb8-3278-474a-43a4-08dddc2e9d32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 19:04:52.2519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDY8fisfJq6y9Bk7wKOnZAZg0utBmkc9t5AQkyL6zFZpbLvins88knCGmKmrwYVGGR89tq6+jKIZM25s25Pupw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
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

On Fri, Aug 15, 2025 at 05:16:54PM +0200, Thomas Hellström wrote:
> On Wed, 2025-08-13 at 15:06 -0700, Matthew Brost wrote:
> > On Wed, Aug 13, 2025 at 12:51:15PM +0200, Thomas Hellström wrote:
> > > The CPU fault handler may populate bos and migrate, and in doing
> > > so might interfere with other tasks validing.
> > > 
> > > Convert it for exhaustive eviction. To do this properly without
> > > potentially introducing stalls with the mmap lock held requires
> > > TTM work. In the meantime, let's live with those stalls that
> > > would typically happen on memory pressure.
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c | 11 ++++++++---
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 5e40b6cb8d2a..dd1e0e9957e0 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1720,14 +1720,18 @@ static vm_fault_t xe_gem_fault(struct
> > > vm_fault *vmf)
> > >  	struct xe_device *xe = to_xe_device(ddev);
> > >  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
> > >  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
> > > -	struct drm_exec *exec;
> > > +	struct xe_validation_ctx ctx;
> > > +	struct drm_exec exec;
> > >  	vm_fault_t ret;
> > >  	int idx;
> > >  
> > >  	if (needs_rpm)
> > >  		xe_pm_runtime_get(xe);
> > >  
> > > -	exec = XE_VALIDATION_UNIMPLEMENTED;
> > > +	if (xe_validation_ctx_init(&ctx, &xe->val, &exec,
> > > +				   DRM_EXEC_INTERRUPTIBLE_WAIT, 0,
> > > false))
> > > +		return VM_FAULT_NOPAGE;
> > 
> > Any particular reason to not use xe_validation_guard here?
> 
> Well this is a bit complicated ATM.
> We would need some serious TTM rework here to support drm_exec in these
> helpers, and ATM I think upon closer inspection we'd need an
> xe_validation_ctx_init that doesn't initialize a drm_exec.
> 

Right, so I think this is an unsupported case then.

Matt

> ttm_bo_vm_reserve() might use a bo lock without a drm_exec and that
> will cause a lockdep splat if the drm_exec transaction has initialized
> the ww ctx, which happens in drm_exec_until_all_locked(). 
> 
> I should add a comment about that.
> 
> /Thomas
> 
> 
> 
> > 
> > Matt
> > 
> > > +
> > >  	ret = ttm_bo_vm_reserve(tbo, vmf);
> > >  	if (ret)
> > >  		goto out;
> > > @@ -1735,7 +1739,7 @@ static vm_fault_t xe_gem_fault(struct
> > > vm_fault *vmf)
> > >  	if (drm_dev_enter(ddev, &idx)) {
> > >  		trace_xe_bo_cpu_fault(bo);
> > >  
> > > -		xe_validation_assert_exec(xe, exec, &tbo->base);
> > > +		xe_validation_assert_exec(xe, &exec, &tbo->base);
> > >  		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> > > >vm_page_prot,
> > >  					      
> > > TTM_BO_VM_NUM_PREFAULT);
> > >  		drm_dev_exit(idx);
> > > @@ -1761,6 +1765,7 @@ static vm_fault_t xe_gem_fault(struct
> > > vm_fault *vmf)
> > >  
> > >  	dma_resv_unlock(tbo->base.resv);
> > >  out:
> > > +	xe_validation_ctx_fini(&ctx);
> > >  	if (needs_rpm)
> > >  		xe_pm_runtime_put(xe);
> > >  
> > > -- 
> > > 2.50.1
> > > 
> 
