Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E19CA5FAD
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 23:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8F910E0DB;
	Tue, 29 Sep 2026 23:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xm2d5j2p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AAD10E0DB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 23:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790724099; x=1822260099;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2UV9/AyzkFgeW+krmpgATHON/zP6CoOM9BtpQbk+QLE=;
 b=Xm2d5j2pp3sPqiZS1LbLnXf8wYUPN0chvTFmp5BljnpHa/i/AF9KhxCS
 TAdo5vEMt/6Y4FghmSiTTO/13Dq+3bE/mtkXvZQsUApoPI0gLF3PM6K5L
 RkIELR25R6jsfqRQH+5rmtizJv6OoH8e1Ot7wl2ryb8tWhIwPfSOkqbdr
 oAm/fHmEGi/vlHOPVrbRc8NiydkS9N3+ZbNFZHYIpq87IhGbT1mL5YLVH
 B3tflUcUaPFTkMG15YZyRKR9Hh8m/USLM30zDZgqXbj2b1L3F2jZG3Ph6
 l7xyrjSIpmE3dHkPpvpfDfL6WZRQ8eUKsFcuwzpEeilWIllo9A+OaksEj w==;
X-CSE-ConnectionGUID: t5hcttoeQimK+2H4KVPVCA==
X-CSE-MsgGUID: aICYmUJ2QVKWO32b5efn4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="100786277"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="100786277"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 16:21:39 -0700
X-CSE-ConnectionGUID: QSyM+7quSCm+lNaAA9T8Zw==
X-CSE-MsgGUID: zjpD3kQlSTKulmWLrAt8sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="273284548"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 16:21:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 16:21:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 16:21:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 16:21:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRihJx4QIhY54ZqudtC2JA13dLckoU7vgUqIOLXCDIdmabyJO0v247ukvkfi/wLrDpo9r3y1r84ukoiwLDsUgrzwKUVq5/ki5+uHrxFF/3JLhv3Zx+AZFGwpajEsCRBzxpSPaGBIswj8zseFx55bCq4YQI9uTy1MiDGW1MklgCUuryKC5k+GzqUYAD1GK8aE4VCCcATrNpjLu4V9M8oYhmMzapj8xmoP5XLp+tNPFky4GioYAvPFx2MT8WTTRixr/BC2EjMfI6qG+qiRKHHarX6rqgO7MFRKvbwJ1LYyeZG2nR/Qrrlv5jRnewx7jZkYnwn6s8tkIiKXMljE7mfgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4Nezt1+aCBztTgpOSf3sbmRQndWt8z5ggTGTx3t3/U=;
 b=GJJvh+DMxq0hWFPSERGU08wz+d1pGzs6ji6FfJ2N/obncYct4eFPg805vgqRzur6QbU+F5EZcs2kcd5eDBuDy2EL26Q30n/ghD3tblyIMMhHSkHN02x3WGWYTXP0eqR/g2B44q1k/IIu6TK1bBmhOUxhSFo3ca15rXT4L3bh/2TVa4BJ30KYjljh1mp0PY+un05T2friUoOPHu54BXAvosRAF6MGVrf8wgquJh/dN7gYjG7muWybGziHVY5BaCn3gcJQYkwtHBz0B6lQF6cgLgfCSMs0rX4JHUqJRdxUVXgGVmabeG8c/zuMfUrxurx0651yN5XND63h4Ktg1iVu8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 23:21:35 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 23:21:35 +0000
Date: Tue, 29 Sep 2026 16:21:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Do not clear SVM device memory allocations
 up front
Message-ID: <arxH/HM5kdMCXnNO@gsse-cloud1.jf.intel.com>
References: <20260929181024.2743854-1-matthew.brost@intel.com>
 <20260929181024.2743854-4-matthew.brost@intel.com>
 <59e6ec889f8615ce424833b3a15ecd94b8dfb8b4.camel@intel.com>
 <arwqPFnLGKf8Im0c@gsse-cloud1.jf.intel.com>
 <5fde25694f1d383083270485ff49ce0a583a678b.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fde25694f1d383083270485ff49ce0a583a678b.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0380.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::25) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f4a939-a026-43c1-1274-08df1e806762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|6133799003|4143699003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: q5c8jziTJoW+fidJue8r1TYY75b+XcEU29AIVdNFSz67Cs6e7rsJhtXy9H5FCInUjhgX0M5u19h+8RxtcDMv4Llk55Sa9V43Ibp/DeQOUbZHlPUW6iRByY31iOmNf8Qpw/1rpsqUdp8yrgVN7SkhQ0RbgDP0ulkWHIqPhhKDy2aTFVxgeb4bpxSCleMhh9cAuUQAETciREdNnH1nFPx41L7OOLYISj/3SAYg9sdPin/zciOhPUrvUlYnpWmVQTiLC1EsUey+tdrra0wKOn7jt8Yon16yN6pVw6Ii02vp2olZK03Vri4Oc+98b71iaxmTXcDYY9Pks4FIXYg0ER7TX5EmCFMrEhqUPh74QNkV5t87ttEBO8u4DvkPtTQ6YnwbBuIhcegRsY4u624G7ih/2wGDQJF0HgKTtMNm5pbrDGHu0oSpSoCft4Ey84IRkkwU1GIDJWX8oE1qcfiMhkurouC5oT0rygYC8VShBylVoeki119qyjGmL2KAwn7y3jWhTmGvnyd2cIbOSBf+Kqk9FSYHkw2/2ghYkDFkYlDPGEKEokJxJXBeZi2nO8dEK9nPtiAlBvpXi+pdGgS9m+7/cL3ObGJAXQ8fCBXPFvitV4TQepXqpkMy3brifjjusKSPIhqg55DJrRdbOWnpSJZ6xo3oLe0uMuuhCyBWF42g538=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ftgA5IPtxjoObxiJPB8qAncHgwgCPEehDWubragnNz5XqTi5SaI4Ws/pER?=
 =?iso-8859-1?Q?cAvu1moPaZ28w/cyxlnN/C453vzWXPmm8q7KFq+vP15PgEe5pDxPp/G+k/?=
 =?iso-8859-1?Q?+M2b7FWZwMEsEZnz00LlETodDct5/57WxZyS+lDOom8XkhMzY+Ffsq073s?=
 =?iso-8859-1?Q?9lHfKjJway/GyvQttdCA0XQiLeqeTBGKKiDzWif6lUb6BXrlrMigeIbOJ4?=
 =?iso-8859-1?Q?S0vJUimMPCYozKdreZsSaty7pTFjHgBZJgoDe24vpm4Rnf3hpdgxWLQI4N?=
 =?iso-8859-1?Q?Nbfqdk1PnvQnYfgYuvYOkO3G9PcCJV0qporKEs8xC02BDMmnolU9Om8Si9?=
 =?iso-8859-1?Q?v1E50EFbDXa7FTsk86HtTYaZyUGXB3zmBH8Op0GB8c1IfPWe5Ypl35hvvp?=
 =?iso-8859-1?Q?c41tni0VY/x2J/KbVEPbxnVtqs6iQcMDqB4yyylNZij9LXWeq53FbRcyyS?=
 =?iso-8859-1?Q?sUhiU/m5pE/DCxAAeTqAr46y8TuEGXJhzpIMjKV2dIU8r7RzR1w5+MBJ8M?=
 =?iso-8859-1?Q?0NHHfPUyE4UPl/Pov3S57wGZvRn+cGiHl7oXYPWSBq+GRvItvHHv+nBhH1?=
 =?iso-8859-1?Q?n4e/LwkZ30zQmVhefdvxLBx+IyxI9JbPMVV8C5tJ6Jcrs99NSG1pitAYVu?=
 =?iso-8859-1?Q?i+CtMf7+LJJy0Yk2louSUPoMWSTFujtG3GewG+57ScSyExR48+aEaOC/ra?=
 =?iso-8859-1?Q?K3bULb1fC4eY2gnI86AvhJPEzzB0WOPw0HBUcyX57F8YDr6pct6G6VTMq3?=
 =?iso-8859-1?Q?tvsC3gHqEbngNn9YtZBfAza36/eJ3Lnj9lzMr7SrcWou0kTHBgu/WdN/YB?=
 =?iso-8859-1?Q?hgKkixloZ9AodIZGaB+ePMut7BZTzF8phXVjq4+JtXk1sNHfcF2IX7jMpZ?=
 =?iso-8859-1?Q?JhNa1EYKWuNR5Mv7Ai2bradO4fxcS3sxAfAlEwPHNfcQD4CIshhVH+tqJG?=
 =?iso-8859-1?Q?mx8ttgOxm3ynbygvGNRu5T06BvuO4uPRyBTl9amFu7hmXKZznuHnxOs1Lh?=
 =?iso-8859-1?Q?wOyivpFsxXEXPaEFRHUUHWZlCMEPhOx7QG4n7LQdseabqo5orUeUEAgrnC?=
 =?iso-8859-1?Q?uWGoASFmLAyV/W2+jqsZe8M+e3QnM5P176+MeTRxLm4+7rnkag0LhZQLFK?=
 =?iso-8859-1?Q?Wxfl7qaX0FYRtOQrh3MO13yBGP3Vg4J1gJm4ma8jxWOtyLlRRK3rJmAvs5?=
 =?iso-8859-1?Q?A1jKKofjoBF2NH1UGZKm6dgvj0Rt9MYgSxVtmjxmh1+vwA8eoMqKEDeXaT?=
 =?iso-8859-1?Q?69ertH39xZcxxx70Y0Yj8MmlGgkqYSAZskYWmvOxDVwembSPFlDJgvQN9i?=
 =?iso-8859-1?Q?txmesLvhIwOLTJhiZg2bhjD/tkhnQAel2JlBy4qm+v7pRoHEnZfNUCYXVy?=
 =?iso-8859-1?Q?SLabyqwFatJTSoC6hdjh2Nc/LH6fR7N8oio7Dp/DL0xA7hKGHL4XkXaUvD?=
 =?iso-8859-1?Q?ygsreQJms63MZmgqFBKnNkgpoUR6ezCpw6RozN7dXHvHj9rU7UFHkHrONR?=
 =?iso-8859-1?Q?ZSbg8sytgzcxPgEWIaDVVm0YanYeg+n3NP7SnybzKOVIwaHczbs79U3RZF?=
 =?iso-8859-1?Q?CgMtTErNCaB0bEbL7jWLYo8XuYJLQd8iol0YvDdLIG1pUR/JGknQXNgMeJ?=
 =?iso-8859-1?Q?73ZFzpjk30qlGmlu4ZgKD5X+IOh5mQnMVLn1e0lNlWYu2idfMf6Zn945I5?=
 =?iso-8859-1?Q?tNAxMpL+FDqoSziueUNDqAuSHnhebVROATfnOwZYi7mePH7Teb21Zjlql0?=
 =?iso-8859-1?Q?3uh52rLzBVVaCxHVigERu+J5lW1hYuihpJEhbR+LYctqwh6vnxG6KlPUE6?=
 =?iso-8859-1?Q?LHXuj++RFgm/OPsYaF+q8cqgiaqBTXo=3D?=
X-Exchange-RoutingPolicyChecked: SywgdJpRe/nB+dmMC12zEqY08fquy8CBu6WB8qNNXlwP/YkPjHf3WMgKa/mjY6IuPYxENd6oUDGQ9roQMXgiPZEeTpzQMPbM9CUsUF8WYLxGflFOr1DNLsQ7LHyYtz8G7wacpxd/uyK7g+yrI2/Wmx2CqenhZZaOqOEIgJliDBeIGChH9D+FHUeL2DZ0ZwItRvn5XGhMcKIL0bwHHU88PRO6oXOVsZrFjQLqL2YCcIYt+ThYQTSdZhmD3mpsDqaKkhPBSPdemF+XKNTYt05gOB6jPwCaaVOPA/iH7eXo9EZX/yswGkJVQf5yjoGwPsEZjR4XsCQkdU+iA0cAJpxSGA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f4a939-a026-43c1-1274-08df1e806762
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 23:21:35.0845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAifIV+LKwyP5JqaXRvqU71DqMnXMVODAtWttB8YeOzPTSOL1BS51LZEXWLBc/wrjbJpxuw/d3OqAw+1gGa5bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
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

On Tue, Sep 29, 2026 at 04:05:44PM -0600, Summers, Stuart wrote:
> On Tue, 2026-09-29 at 14:14 -0700, Matthew Brost wrote:
> > On Tue, Sep 29, 2026 at 02:16:18PM -0600, Summers, Stuart wrote:
> > > On Tue, 2026-09-29 at 11:10 -0700, Matthew Brost wrote:
> > > > xe_drm_pagemap_populate_mm() allocates a BO to back the range
> > > > being
> > > > migrated into device memory, and TTM clears it. That clear is on
> > > > the
> > > > GPU
> > > > page fault and SVM prefetch critical paths, and in the common
> > > > case it
> > > > is
> > > > immediately overwritten in its entirety by the migration itself.
> > > > 
> > > > Allocate the BO with XE_BO_FLAG_SKIP_CLEAR and instead deal with
> > > > the
> > > > contents in xe_svm_copy(). A migration to VRAM only sources pages
> > > > which
> > > > are populated on the CPU side, so if every page has a source DMA
> > > > address
> > > > the copy covers the whole allocation and nothing else is needed.
> > > > Only
> > > > when the migration is sparse - holes in the CPU VMA from never
> > > > faulted
> > > > anonymous memory, for instance - is a clear issued, ahead of the
> > > > copies,
> > > > so the uncovered pages still read as zero.
> > > > 
> > > > The clear walks the destination device pages, taking the extent
> > > > of
> > > > each
> > > > entry from its folio order since only folio heads are populated,
> > > > and
> > > > coalesces physically contiguous entries into chunks of at most
> > > > 8M. It
> > > 
> > > Why 8M?
> > > 
> > 
> > XE_MIGRATE_CHUNK_SIZE is existing code which has picked 8M for
> > copies,
> > so using same size for clears. In practice this is limited at 2M as
> > that
> > is max SVM allocation size but that part is table driven and can be
> > changed at any time. 
> 
> Yeah I guess my question was related to the page size granularity (2M),
> so the 8M chunk seems a little arbitrary to me. I don't have all the
> migrate chunk size history though...
> 
> But yeah makes sense generally.
> 
> > 
> > > > runs on the same ordered migrate queue as the copies, so it takes
> > > > over
> > > > the pre-migrate fence dependency and the copies are implicitly
> > > > ordered
> > > > behind it.
> > > > 
> > > > Assisted-by: Github-Copilot:Claude-opus-5
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_svm.c | 150
> > > > ++++++++++++++++++++++++++++++++++--
> > > >  1 file changed, 143 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > > b/drivers/gpu/drm/xe/xe_svm.c
> > > > index f39e647512ad..1b4d1222fbb7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -586,6 +586,124 @@ static void
> > > > xe_svm_copy_us_stats_incr(struct
> > > > xe_gt *gt,
> > > >         }
> > > >  }
> > > >  
> > > > +#define XE_MIGRATE_CHUNK_SIZE  SZ_8M
> > > > +#define XE_VRAM_ADDR_INVALID   ~0x0ull
> > > > +
> > > > +/**
> > > > + * xe_svm_copy_covers_all() - Does a migration write every page?
> > > > + * @pagemap_addr: Array of DMA information for the system side
> > > > of
> > > > the migration
> > > > + * @npages: Number of pages covered by @pagemap_addr
> > > > + *
> > > > + * A migration to device memory only sources pages which are
> > > > actually populated
> > > > + * on the CPU side. Holes in the CPU VMA (never faulted
> > > > anonymous
> > > > memory, for
> > > > + * instance) have no DMA address and leave the corresponding
> > > > device
> > > > pages
> > > > + * untouched by the copy.
> > > > + *
> > > > + * Return: true if every page has a source address, false
> > > > otherwise.
> > > > + */
> > > > +static bool xe_svm_copy_covers_all(struct drm_pagemap_addr
> > > > *pagemap_addr,
> > > > +                                  unsigned long npages)
> > > > +{
> > > > +       unsigned long i;
> > > > +
> > > > +       for (i = 0; i < npages;) {
> > > > +               if (!pagemap_addr[i].addr)
> > > > +                       return false;
> > > > +
> > > > +               i += NR_PAGES(pagemap_addr[i].order);
> > > > +       }
> > > > +
> > > > +       return true;
> > > > +}
> > > > +
> > > > +static int xe_svm_clear_vram_chunk(struct xe_vram_region *vr,
> > > > u64
> > > > vram_addr,
> > > > +                                  unsigned long npages,
> > > > +                                  struct dma_fence **fence,
> > > > +                                  struct dma_fence **deps)
> > > > +{
> > > > +       struct dma_fence *__fence;
> > > > +
> > > > +       vm_dbg(&vr->xe->drm, "CLEAR VRAM - 0x%016llx,
> > > > NPAGES=%ld",
> > > > +              vram_addr, npages);
> > > > +
> > > > +       __fence = xe_migrate_clear_vram(vr->migrate, npages,
> > > > vram_addr, *deps);
> > > > +       if (IS_ERR(__fence))
> > > > +               return PTR_ERR(__fence);
> > > > +
> > > > +       /* Ordered queue - only the first job needs to take the
> > > > dependency */
> > > > +       *deps = NULL;
> > > > +       dma_fence_put(*fence);
> > > > +       *fence = __fence;
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_svm_clear_vram() - Clear the device memory backing a
> > > > migration
> > > > + * @pages: Array of device pages which back the migration
> > > > destination
> > > > + * @npages: Number of pages in @pages
> > > > + * @fence: In/out pointer to the last fence issued on the
> > > > migrate
> > > > queue
> > > > + * @deps: In/out pointer to a dependency to attach to the first
> > > > job
> > > > issued
> > > > + *
> > > > + * Zero the device memory described by @pages. Entries in @pages
> > > > are
> > > > only
> > > > + * populated at the head of each folio, so the extent of each
> > > > entry
> > > > is taken
> > > > + * from the folio order, and physically contiguous entries are
> > > > coalesced into a
> > > > + * single clear of at most XE_MIGRATE_CHUNK_SIZE.
> > > > + *
> > > > + * Return: 0 on success, negative error code on failure.
> > > > + */
> > > > +static int xe_svm_clear_vram(struct page **pages, unsigned long
> > > > npages,
> > > > +                            struct dma_fence **fence,
> > > > +                            struct dma_fence **deps)
> > > > +{
> > > > +       struct xe_vram_region *vr = NULL;
> > > > +       unsigned long i, count = 0;
> > > > +       u64 vram_addr = XE_VRAM_ADDR_INVALID;
> > > > +       int err;
> > > > +
> > > > +       for (i = 0; i < npages;) {
> > > > +               struct page *page = pages[i];
> > > > +               unsigned long nr;
> > > > +               u64 addr;
> > > > +
> > > > +               if (!page) {
> > > > +                       ++i;
> > > > +                       continue;
> > > > +               }
> > > > +
> > > > +               if (!vr)
> > > > +                       vr = xe_page_to_vr(page);
> > > > +               XE_WARN_ON(xe_page_to_vr(page) != vr);
> > > > +
> > > > +               nr = NR_PAGES(folio_order(page_folio(page)));
> > > > +               addr = xe_page_to_dpa(page);
> > > > +
> > > > +               /* Not contiguous with the pending clear, or
> > > > chunk is
> > > > full */
> > > > +               if (count && (addr != vram_addr + count *
> > > > PAGE_SIZE
> > > > > > 
> > > > +                             count + nr > XE_MIGRATE_CHUNK_SIZE
> > > > /
> > > > PAGE_SIZE)) {
> > > > +                       err = xe_svm_clear_vram_chunk(vr,
> > > > vram_addr,
> > > > count,
> > > > +                                                     fence,
> > > > deps);
> > > > +                       if (err)
> > > > +                               return err;
> > > > +                       count = 0;
> > > > +               }
> > > > +
> > > > +               if (!count)
> > > > +                       vram_addr = addr;
> > > > +               count += nr;
> > > > +               i += nr;
> > > > +       }
> > > > +
> > > > +       if (count) {
> > > > +               err = xe_svm_clear_vram_chunk(vr, vram_addr,
> > > > count,
> > > > fence,
> > > > +                                             deps);
> > > > +               if (err)
> > > > +                       return err;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  static int xe_svm_copy(struct page **pages,
> > > >                        struct drm_pagemap_addr *pagemap_addr,
> > > >                        unsigned long npages, const enum
> > > > xe_svm_copy_dir dir,
> > > > @@ -596,12 +714,23 @@ static int xe_svm_copy(struct page **pages,
> > > >         struct xe_device *xe;
> > > >         struct dma_fence *fence = NULL;
> > > >         unsigned long i;
> > > > -#define XE_VRAM_ADDR_INVALID   ~0x0ull
> > > >         u64 vram_addr = XE_VRAM_ADDR_INVALID;
> > > >         int err = 0, pos = 0;
> > > >         bool sram = dir == XE_SVM_COPY_TO_SRAM;
> > > >         ktime_t start = xe_gt_stats_ktime_get();
> > > >  
> > > > +       /*
> > > > +        * Device memory is allocated with XE_BO_FLAG_SKIP_CLEAR,
> > > > so
> > > > it still
> > > 
> > > Should we check that explicitly somewhere here (or in the wrapper)?
> > > What if someone changes the code down the road to not skip the
> > > clear
> > > accidentally... I guess we just have a slight performance drop so
> > > maybe
> > > not a functional problem?
> > > 
> > 
> > We don't have the BO here, only addresses. The why interfaces in
> > GPUSVM
> > are defined that layer has no idea if driver allocated a BO or not.
> 
> Ok so basically the SVM layer is going to do this no matter what and we
> just need to ensure in the BO layer that this isn't doing a double
> clear? Should we have a performance test to make sure we don't regress
> there?
> 

The old code:
 - Always clear upon alloc BO
 - Copy

The new code:
 - Skip clear upon alloc BO
 - Do clear late *after* we get the CPU pages if the CPU pages don't
   fully cover BO, if fully covered skip clear
 - Copy

Having a test to verify this is tricky, as the speed of each machine's
copy engine varies based on several factors: CPU type, whether the IOMMU
is enabled, the discrete GPU SKU, and the GPU power management
configuration. In other words, hardcoding an expected value in an IGT
will not work.
 
I have scripts that measure copy time via GT stats after running an IGT,
and they show that this optimization shaves roughly 10 µs off the copy
time. Prefetch IGTs show an approximately 4 GB/s throughput increase in
benchmark sections on BMG G31, and similarly, UMD benchmarks that
measure fault throughput show roughly a 4 GB/s improvement.
 
I have a good understanding of what "good" numbers look like on the
machines I use regularly, and I also review any code that touches SVM,
so I'm not overly concerned about regressions.

Matt

> > 
> > > > +        * holds whatever the previous owner left behind. A copy
> > > > covering every
> > > > +        * page scrubs it, anything less has to be cleared first.
> > > > +        */
> > > > +       if (!sram && !xe_svm_copy_covers_all(pagemap_addr,
> > > > npages)) {
> > > > +               err = xe_svm_clear_vram(pages, npages, &fence,
> > > > +                                       &pre_migrate_fence);
> > > > +               if (err)
> > > > +                       goto err_out;
> > > > +       }
> > > > +
> > > >         /*
> > > >          * This flow is complex: it locates physically contiguous
> > > > device pages,
> > > >          * derives the starting physical address, and performs a
> > > > single GPU copy
> > > > @@ -617,7 +746,6 @@ static int xe_svm_copy(struct page **pages,
> > > >                 u64 __vram_addr;
> > > >                 bool match = false, chunk, last;
> > > >  
> > > > -#define XE_MIGRATE_CHUNK_SIZE  SZ_8M
> > > >                 chunk = (i - pos) == (XE_MIGRATE_CHUNK_SIZE /
> > > > PAGE_SIZE);
> > > >                 last = (i + 1) == npages;
> > > >  
> > > > @@ -758,8 +886,6 @@ static int xe_svm_copy(struct page **pages,
> > > >                 xe_svm_copy_us_stats_incr(gt, dir, npages,
> > > > start);
> > > >  
> > > >         return err;
> > > > -#undef XE_MIGRATE_CHUNK_SIZE
> > > > -#undef XE_VRAM_ADDR_INVALID
> > > >  }
> > > >  
> > > >  static int xe_svm_copy_to_devmem(struct page **pages,
> > > > @@ -1121,18 +1247,28 @@ static int
> > > > xe_drm_pagemap_populate_mm(struct
> > > > drm_pagemap *dpagemap,
> > > >         struct xe_validation_ctx vctx;
> > > >         struct drm_exec exec;
> > > >         struct xe_bo *bo;
> > > > +       u32 bo_flags;
> > > >         int err = 0, idx;
> > > >  
> > > >         if (!drm_dev_enter(&xe->drm, &idx))
> > > >                 return -ENODEV;
> > > >  
> > > > +       /*
> > > > +        * Skip the clear on device memory - xe_svm_copy() either
> > > > fully
> > > > +        * overwrites the allocation or clears it explicitly, so
> > > > clearing here
> > > > +        * is pure overhead on the page fault and prefetch paths.
> > > > +        */
> > > > +       if (IS_DGFX(xe))
> > > > +               bo_flags = XE_BO_FLAG_VRAM(vr) |
> > > > XE_BO_FLAG_SKIP_CLEAR;
> > > 
> > > This is maybe a comment that should go in the earlier patch that
> > > adds
> > > the flag, but should we have a check that ensures this is a
> > > kernel/migration BO and not a user BO?
> > 
> > I think the comment here is valid as it explains why setting
> 
> Oh sorry that was really unclear by "a comment" here I meant my review
> comment, not your in code comment which looks fine :)
> 
> > XE_BO_FLAG_SKIP_CLEAR is safe as it done later if it is required, but
> > I
> > should likely add an assert !xe_bo_is_user if XE_BO_FLAG_SKIP_CLEAR
> > is
> > set. Let me add that.
> 
> Yeah perfect.
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > > +       else
> > > > +               bo_flags = XE_BO_FLAG_SYSTEM;
> > > > +       bo_flags |= XE_BO_FLAG_CPU_ADDR_MIRROR;
> > > > +
> > > >         xe_pm_runtime_get(xe);
> > > >  
> > > >         xe_validation_guard(&vctx, &xe->val, &exec, (struct
> > > > xe_val_flags) {}, err) {
> > > >                 bo = xe_bo_create_locked(xe, NULL, NULL, end -
> > > > start,
> > > > -                                        ttm_bo_type_device,
> > > > -                                        (IS_DGFX(xe) ?
> > > > XE_BO_FLAG_VRAM(vr) : XE_BO_FLAG_SYSTEM) |
> > > > -                                       
> > > > XE_BO_FLAG_CPU_ADDR_MIRROR,
> > > > &exec);
> > > > +                                        ttm_bo_type_device,
> > > > bo_flags, &exec);
> > > >                 drm_exec_retry_on_contention(&exec);
> > > >                 if (IS_ERR(bo)) {
> > > >                         err = PTR_ERR(bo);
> > > 
> 
