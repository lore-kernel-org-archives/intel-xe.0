Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6602D1CDAB
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 00:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC6810E19C;
	Thu,  4 Dec 2025 00:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMFqjdNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6779F10E19C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 00:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764807561; x=1796343561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IDKtkJYtxPh8yxQ1vRZqlRDzRQd0lWYDStRmIMrSnmw=;
 b=YMFqjdNViWTNcUcU1petXlC/ElRcXHKiB19gwT0rxlNF9fhUucTcab7/
 ZzKBrMDwl6HVtoVwEAYDK8WHqI8RX3NUAY+bcU8gUwY2+x8NvtFfS7pQU
 tzT0l4gb1q8c9wW2pd8UpNtcyW0pQB7tVXkbrq4N8qmouzl6nqdjChmnt
 SsWBU56t+P5taN1lvtlQ2HR4Ir/RZSaDX8Sx34Nh5tnN7jQ81M/hIu7Zm
 kZR9wRH89okX8AILmO6ezLDvzo0pIVaf+BYBUVkLZVE+vu0rq96awUomt
 3mfrJg8fzpQroylP0Jlkm6WIP6yAvnqgfUXS5mBUKiIIJtGtAVm76iDsR w==;
X-CSE-ConnectionGUID: U80WvOxqSqebp7RrUnKW2g==
X-CSE-MsgGUID: xNrAiSokSQiybuilJNIhlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89469893"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="89469893"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 16:19:21 -0800
X-CSE-ConnectionGUID: jF4umgiJT3Ou2hfvTzOAdA==
X-CSE-MsgGUID: l6ZAvJvYRJiDY35CsWCEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194656475"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 16:19:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 16:19:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 16:19:19 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 16:19:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qV0fpf+cKMuwETTyWq4deXyigrwTXVn2/zAPKs7OSH/thTpO6Gml2+UY667CquDjhlU0PbnySoZwllZEd/gTc2zsvVM4teC+zOHvIwfo3Q4dHs1oz0d7G1os7ud9bA7gGqjiyMBAK8eSPQUjwXF+RMYRKXMpM8Ddo8pnAiM5xB6S1bfW3thzF69N0iJ0I54k//zzW7/XcdOqSbz/OM+rGpYWNP6QR7tXITeyqVa3o2GJin5vV/HqxgnWnl4CySbvLx2pgeETlQwgUNwNqBfnoA1JV51W68Ax+4i1kb5gCBQCx/dKFZz/AT1EADffBMAi0c0Efd4lbAqByrDuRgf6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcUO+a1uwagDR03tExHJzqJF+dGev/bbPcP2gmDTToE=;
 b=qxHovOZ93cG4HVQs3sO13qwcpmcsTpbAPRdCKyH8fka0l5sEGJVQypGbR6shjib5KuuJtIwXwsnmfWA0g1iQdU+EaH99HkF3PhhKMjV//B9RxMthSKldU51K+4FWW/3RDbREWG+gRh9wMidyL83gK64BB4ryM+n2mI/S43chVXrGELna5A19/wJv02s6/Enj1BY8zwGoyRP5MzJjI1XaNDWRV5S5lgr2e6pKCMKFGTYlQ0Ij4tSjIU7kw/IfiIPaNWlBuaUyGiskf7Dg/ScMzgTb+jzLahkP7CdSqZGfA28xTNKfrb/lqR0xcFMtOWRZYeUGA6Qao8CpshvQtmfT/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 00:19:17 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 00:19:17 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v2 06/11] drm/xe: Create page reclaim list on unbind
Thread-Topic: [PATCH v2 06/11] drm/xe: Create page reclaim list on unbind
Thread-Index: AQHcXyjJgQiCBj5ywEu3ksCQ26IuebUQkaoAgAAN9hA=
Date: Thu, 4 Dec 2025 00:19:16 +0000
Message-ID: <SA1PR11MB883920353D72C678E2163B13AAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-19-brian3.nguyen@intel.com>
 <aTDAALlkzefO8NqO@lstrano-desk.jf.intel.com>
In-Reply-To: <aTDAALlkzefO8NqO@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SJ0PR11MB6814:EE_
x-ms-office365-filtering-correlation-id: 4f114258-d8ce-4fce-081d-08de32cac2f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?XmGXJy1PWwaaGu0gVodsCo8rDKHaHT3KweV6AVtfEn+yhuamNQ2i3rhSXM7/?=
 =?us-ascii?Q?rhjRuG9Pj9cEZqZz2gzBda/3+QnBZZR/zpXZasCxMrMI7t/EID3q1jU6Zr7q?=
 =?us-ascii?Q?EJi65ZAaC/8hzFASwAFTQjL2miX4XJeT+NJMIHg5ONsxvFdCxIiclcWLKAqx?=
 =?us-ascii?Q?GlJcBwT0LwB9nk6lM0g/oABIwWHkDWMw2tWwrYH2rDNW7Tv1oeNBFz+YsBOY?=
 =?us-ascii?Q?Thki1WbsjZEiVtcSQ0wQN07NBW+3TkRel2s5H4CHzbJMqsKQus+F+/01V8CI?=
 =?us-ascii?Q?bqSFEX3pJp37ldWkA3yG2tL7pquhqwJvi4fQC1i9GYPHKUdJbkb9wTNOpSAD?=
 =?us-ascii?Q?JIwM8vQ1DUuXuUYf95/60ZDwanrSDM8dOVaFC6vX/1V77LNSb+Dzxqsupo4w?=
 =?us-ascii?Q?oDnzdBsDJen0HGenC8BNYRY7Qk3fFsRtsjZqlSyKYtxpX79YliG4VaX/mcHR?=
 =?us-ascii?Q?KJuHX0BArFXZQ/B5hn6B4e+RCzQ7wnNyNBOopVPEHmu6zG9juAEp8LFGLtaX?=
 =?us-ascii?Q?dhD/vQlQQQLvaVAu6A049LJZxhsDet2YKgznm8QtEzOEJyL4qNqWNYNpOSor?=
 =?us-ascii?Q?55Sw8VrEEZc2HbQV5t7i5+dXKIgz5hiTba/JC2LKZSE2AqirWiUZU9THJNEC?=
 =?us-ascii?Q?nMn8zChyCDxlj7PKwLRr/wBP2mjE7sH7D5x/ub2ozBgR5HvexAtjH1eVOcBP?=
 =?us-ascii?Q?hyY11pR6T51d8RPK8eLyP92hn+xFQCv1b06W+oQ89I4Fhy/KZQ31ny1O8T4V?=
 =?us-ascii?Q?b5/p/yT5CXwwYMeXv/08NTibQn3xqnpe3DHhNmCodKZVwGLWkewOW16qAIIm?=
 =?us-ascii?Q?uhde31uO3+eWQ1zhj0DmgrOMP4dylf+Ihb8aFbb9dKoX39qKPacGzNQNcfyC?=
 =?us-ascii?Q?A4unwhX3oupJjQXxNoDtZ01SVZcrJqw1zkEv2VaUl8xDMbEcBlj32HEgClch?=
 =?us-ascii?Q?yYd95vVni1NghIeZelqJU8kSnZlKMptZC8krhnfK3IvnFYSnUtZrdeFQEdwd?=
 =?us-ascii?Q?z0GxwpDBZjE1q+IhXWFxjNjWaUcjAmFskybTcsZ80gjEbmofjgjv1tArU9Vk?=
 =?us-ascii?Q?DhP+c3yti5g85DoPHrO43yH6+OVdixFQZoEWqrmBeejyFPvEIkQ/25u35yof?=
 =?us-ascii?Q?/YZ0ulmxyJ8OBbVbXg1XD3K1yXLpkJ3WqYeHIDEjnzLPO36/n2rVC+RklvnC?=
 =?us-ascii?Q?hYCJpUzNmomBdR7/4YB1qD9T0j6Jey+PAJoKozQw7/fd9g00yaKzX46Ou8Oj?=
 =?us-ascii?Q?e93xQWPgAbaE++Abu/s2py6ZUN5grG+mC252SDsooYxDxvGQRnp/EVsPGTgW?=
 =?us-ascii?Q?txBTepmIsRfFxOTjbQTHEEpjuwRx9ZzS8xrSne69hqIyqJP2ZPVH9kRpWWrs?=
 =?us-ascii?Q?hA/zT79DbnPdllHbpAxTp6QjsGE+fR4RTnQXiywx0kM2MW59Ce3XT0RJIe+g?=
 =?us-ascii?Q?fPlJjEgsj2Fb3garFeDf7BMJFa/F65N8lAZOfyIdJPlngHQSEm38+yPz3Rl7?=
 =?us-ascii?Q?tqEfvue9wtkJ81JFOmSw7STX8oybg89zFfFe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z6b+ZmUM31LtS0u4vt88Cp6pOp8QpPsI4zIbVHqy/6RT36RDnn27coB8dkKL?=
 =?us-ascii?Q?Gpky4t+Cjrlo/q9/X91VKBJdV7umznvwmkL5hZ57fa7NzIUrLLyHbXACZugT?=
 =?us-ascii?Q?YgI7TyrBBnRYoJJDhiYVqXTsTqPhRLI5LXBSSGpxdKls0XSBQ8o3XvwBck/+?=
 =?us-ascii?Q?gS+deELPhXQcQ/jKEGXloGTABESj+1658PexU3O+4obDeq64LgJfq/6UwET8?=
 =?us-ascii?Q?Yf2pVElWr3dETqJcLu1rY19pa1OidwMNFLka0zEF1BPByc1Ioh0fcILiVmwc?=
 =?us-ascii?Q?GKkSmJ582cfbZOEShTCYUWH14MeCP67eobf4TIzsQcxPMpxYZluygXLtHbjM?=
 =?us-ascii?Q?keWQRhnF4RTuafdYT5lKqWd7ZrM7jSX9s9wEA0gtKkMjoJ/7hu5UeGx9wIWE?=
 =?us-ascii?Q?oe5/kU0kfjcumEJugq4tpEXZEemWrEA5JL3ZOHYAreUz//8jwjGmK+6GhuFn?=
 =?us-ascii?Q?UKiEk0V/7Q31vPMQQwTX5TCIjPJxEO2wTh+zlaUivdiPtQ8w5H5tAvNTO2lV?=
 =?us-ascii?Q?geLfBh8Z/bt2PBJ+4yuxOsBEYyIp4vHST18w/kHKCrF3w/836KlnWajHq/d1?=
 =?us-ascii?Q?qeBerYNmOWXDYJoYs3yHIyEa2Uy0im79gErm6cmkLJmH1H3BYMzqaIhAFWWB?=
 =?us-ascii?Q?UcIUsBF0GwMTPBoFA00ZAJp9EIv7FanUtUdjoC0ROY3l8fu2/xxPj1pbvqTs?=
 =?us-ascii?Q?n7beMhipWhJNhkCdkdvDHrG70PnC4Mk1RL4gRjsyHL/K+SBChts4U5eEk2MH?=
 =?us-ascii?Q?yWA6rwmHXsLBrLy+6HFWDBzLk079MnygbWrTrmuUBrXFLm9ND+er+xY7u6AN?=
 =?us-ascii?Q?6FINkOtXPGdwSCaQpdRudYaRl3YECms9soD7USRXUAxv9R8/4/fXi1XR6q2H?=
 =?us-ascii?Q?OB/M84xcvamXNoJbYyZF2B8nISK3FPDeBT/CIObBR0IFcL2QnoGE+wwggELx?=
 =?us-ascii?Q?UjRRuY0+ZxO1Zr1UcFWWjE3zklkubK2DUaqply0VtJG+KPEFCaENLZn+gwRP?=
 =?us-ascii?Q?K3e/1kQ2FU1D/hDW8HuKtWd7xQS0JQK7nvPuU9yX5D/nn9JvMWhZTObqmP28?=
 =?us-ascii?Q?HumCC+8n+to7cfGDg6fPVHNrvv5ydbXArbQiFYteqz0acfdXYjlgm3oUpAX8?=
 =?us-ascii?Q?9I5skc5s3bAOPmlByHhPu3RqxTVactEt0AwYAK90qAzczRh2HcN75DM3i3DJ?=
 =?us-ascii?Q?/op3gM/CxHkLnxyqvHhWSh4xogXPjkYmIefRD3wRb+cQnavd6J/9Yz5zAU6g?=
 =?us-ascii?Q?eb540JyKrfFFwxivFMbCz601Ry9Te2UbatyH/fUhLJV14LJis9hdiep8YqZo?=
 =?us-ascii?Q?CQbnrzan4aJP6/fgyWlMXGhakHgQRgZM4YrwI+0XgZ8DBA/GV3xUgp9abWiK?=
 =?us-ascii?Q?zzUZNcoW0JZ4KLnr2FG8wkugSlS23JOZ7+7yHRX2VtzwxPsclekJppUgZQqC?=
 =?us-ascii?Q?WASHZkQOwoPE8RPSyACFIv/6/UIgkwLoZvjfIkXzduFGvRu3sNUuW4jAOmnx?=
 =?us-ascii?Q?1sR6oTfsZ0oqOlICMgZlCP7Mmog97j6AV5wY0P9R6qfHiYhIwEJPYlOA6f/N?=
 =?us-ascii?Q?UuJjl6bw7EFcQHCWFj1vuw7jICqkkGQ4qGxBF1hn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f114258-d8ce-4fce-081d-08de32cac2f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 00:19:16.8740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wKN8VLAOE7JeDwe3MGUtrTew3ni9eG5gY7QsoS/XmGjltuy0MPa1Ps0H86PCahFJMxNNl/Ec3X/HJWQjIHOD/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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

On Wednesday, December 3, 2025 2:56 PM, Matthew Brost wrote:
> On Thu, Nov 27, 2025 at 07:02:07AM +0800, Brian Nguyen wrote:
> > Page reclaim list (PRL) is preparation work for the page reclaim featur=
e.
> > The PRL is firstly owned by pt_update_ops and all other page reclaim
> > operations will point back to this PRL. PRL generates its entries
> > during the unbind page walker, updating the PRL.
> >
> > This PRL is restricted to a 4K page, so 512 page entries at most.
> >
> > v2:
> >  - Removed unused function. (Shuicheng)
> >  - Compacted warning checking, update commit message,
> >    spelling, etc. (Shuicheng, Matthew B)
> >  - Fix kernel docs
> >  - Moved PRL max entries overflow handling out from
> >    generate_reclaim_entry to caller (Shuicheng)
> >  - Add xe_page_reclaim_list_init for clarity. (Matthew B)
> >  - Modify xe_guc_page_reclaim_entry to use macros
> >    for greater flexbility. (Matthew B)
> >  - Add fallback for PTE outside of page reclaim supported
> >    4K, 64K, 2M pages (Matthew B)
> >  - Invalidate PRL for early abort page walk.
> >  - Removed page reclaim related variables from tlb fence
> >    (Matthew Brost)
> >  - Remove error handling in *alloc_entries failure. (Matthew B)
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile           |   1 +
> >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
> >  drivers/gpu/drm/xe/xe_page_reclaim.c  |  62 ++++++++++++++
> > drivers/gpu/drm/xe/xe_page_reclaim.h  |  73 +++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pt.c            | 112 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
> >  6 files changed, 253 insertions(+), 1 deletion(-)  create mode 100644
> > drivers/gpu/drm/xe/xe_page_reclaim.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index c9b60e19cecc..cbce647f2f01 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -95,6 +95,7 @@ xe-y +=3D xe_bb.o \
> >  	xe_oa.o \
> >  	xe_observation.o \
> >  	xe_pagefault.o \
> > +	xe_page_reclaim.o \
> >  	xe_pat.o \
> >  	xe_pci.o \
> >  	xe_pcode.o \
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > index 4389e5a76f89..4d83461e538b 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > @@ -9,6 +9,7 @@
> >  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> >  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> >
> > +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> >  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
> >
> >  #define GUC_GGTT_TOP		0xFEE00000
> > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > new file mode 100644
> > index 000000000000..63facea28213
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > @@ -0,0 +1,62 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright (c) 2025 Intel Corporation  */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/kref.h>
> > +#include <linux/mm.h>
> > +#include <linux/slab.h>
> > +
> > +#include "xe_page_reclaim.h"
> > +
> > +#include "regs/xe_gt_regs.h"
> > +#include "xe_assert.h"
> > +#include "xe_macros.h"
> > +
> > +/**
> > + * xe_page_reclaim_list_invalidate() - Mark a PRL as invalid
> > + * @prl: Page reclaim list to reset
> > + *
> > + * Clears the entries pointer and marks the list as invalid so
> > + * future use knows PRL is unusable. It is expected that the entries
> > + * have already been released.
> > + */
> > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > +*prl) {
> > +	prl->entries =3D NULL;
> > +	prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST; }
> > +
> > +/**
> > + * xe_page_reclaim_list_init() - Initialize a page reclaim list
> > + * @prl: Page reclaim list to initialize
> > + *
> > + * Invalidates the list to prepare on initalization.
> > + */
> > +void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl) {
> > +	xe_page_reclaim_list_invalidate(prl);
> > +}
> > +
> > +/**
> > + * xe_page_reclaim_list_alloc_entries() - Allocate page reclaim list
> > +entries
> > + * @prl: Page reclaim list to allocate entries for
> > + *
> > + * Allocate one 4K page for the PRL entries, otherwise assign prl->ent=
ries to NULL.
> > + */
> > +int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list
> > +*prl) {
> > +	struct page *page;
> > +
> > +	if (XE_WARN_ON(prl->entries))
> > +		return 0;
> > +
> > +	page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> > +	if (page) {
> > +		prl->entries =3D page_address(page);
> > +		prl->num_entries =3D 0;
> > +	}
> > +
> > +	return page ? 0 : -ENOMEM;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > new file mode 100644
> > index 000000000000..5ccff46d1b4e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > @@ -0,0 +1,73 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright (c) 2025 Intel Corporation  */
> > +
> > +#ifndef _XE_PAGE_RECLAIM_H_
> > +#define _XE_PAGE_RECLAIM_H_
> > +
> > +#include <linux/kref.h>
> > +#include <linux/mm.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/bits.h>
> > +
> > +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> > +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> > +
> > +struct xe_guc_page_reclaim_entry {
> > +	u32 dw0;
> > +/* valid reclaim entry bit */
> > +#define XE_PAGE_RECLAIM_VALID		BIT(0)
> > +/*
> > + * offset order of page size to be reclaimed
> > + * page_size =3D 1 << (XE_PTE_SHIFT + reclamation_size)  */
> > +#define XE_PAGE_RECLAIM_SIZE		GENMASK(6, 1)
> > +#define XE_PAGE_RECLAIM_RSVD_0		GENMASK(11, 7)
> > +/* lower 20 bits of the physical address */
> > +#define XE_PAGE_RECLAIM_ADDR_LO		GENMASK(31, 12)
> > +	u32 dw1;
> > +/* upper 20 bits of the physical address */
> > +#define XE_PAGE_RECLAIM_ADDR_HI		GENMASK(19, 0)
> > +#define XE_PAGE_RECLAIM_RSVD_1		GENMASK(31, 20)
> > +} __packed;
> > +
> > +struct xe_page_reclaim_list {
> > +	/** @entries: array of page reclaim entries, page allocated */
> > +	struct xe_guc_page_reclaim_entry *entries;
> > +	/** @num_entries: number of entries */
> > +	int num_entries;
> > +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> > +};
> > +
> > +void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list
> > +*prl); void xe_page_reclaim_list_init(struct xe_page_reclaim_list
> > +*prl); int xe_page_reclaim_list_alloc_entries(struct
> > +xe_page_reclaim_list *prl);
> > +/**
> > + * xe_page_reclaim_entries_get() - Increment the reference count of pa=
ge reclaim entries.
> > + * @entries: Pointer to the array of page reclaim entries.
> > + *
> > + * This function increments the reference count of the backing page.
> > + */
> > +static inline void xe_page_reclaim_entries_get(struct
> > +xe_guc_page_reclaim_entry *entries) {
> > +	if (entries)
> > +		get_page(virt_to_page(entries));
> > +}
> > +
> > +/**
> > + * xe_page_reclaim_entries_put() - Decrement the reference count of pa=
ge reclaim entries.
> > + * @entries: Pointer to the array of page reclaim entries.
> > + *
> > + * This function decrements the reference count of the backing page
> > + * and frees it if the count reaches zero.
> > + */
> > +static inline void xe_page_reclaim_entries_put(struct
> > +xe_guc_page_reclaim_entry *entries) {
> > +	if (entries)
> > +		put_page(virt_to_page(entries));
> > +}
> > +
> > +#endif	/* _XE_PAGE_RECLAIM_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 884127b4d97d..347b111dc097 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -12,6 +12,7 @@
> >  #include "xe_exec_queue.h"
> >  #include "xe_gt.h"
> >  #include "xe_migrate.h"
> > +#include "xe_page_reclaim.h"
> >  #include "xe_pt_types.h"
> >  #include "xe_pt_walk.h"
> >  #include "xe_res_cursor.h"
> > @@ -1535,6 +1536,9 @@ struct xe_pt_stage_unbind_walk {
> >  	/** @modified_end: Walk range start, modified like @modified_start. *=
/
> >  	u64 modified_end;
> >
> > +	/** @prl: Backing pointer to page reclaim list in pt_update_ops */
> > +	struct xe_page_reclaim_list *prl;
> > +
> >  	/* Output */
> >  	/* @wupd: Structure to track the page-table updates we're building */
> >  	struct xe_walk_update wupd;
> > @@ -1572,6 +1576,61 @@ static bool xe_pt_check_kill(u64 addr, u64 next,=
 unsigned int level,
> >  	return false;
> >  }
> >
> > +/* Huge 2MB leaf lives directly in a level-1 table and has no
> > +children */ static bool is_2m_pte(struct xe_pt *pte) {
> > +	return pte->level =3D=3D 1 && !pte->base.children; }
> > +
> > +/* page_size =3D 2^(reclamation_size + XE_PTE_SHIFT) */
> > +#define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
> > +({									\
> > +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> > +	ilog2(page_size) - XE_PTE_SHIFT;				\
> > +})
> > +
> > +static void generate_reclaim_entry(struct xe_tile *tile,
> > +				   struct xe_page_reclaim_list *prl,
> > +				   u64 pte, struct xe_pt *xe_child) {
> > +	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl->entries;
> > +	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> > +	int num_entries =3D prl->num_entries;
> > +	u32 reclamation_size;
> > +
> > +	xe_tile_assert(tile, xe_child->level <=3D MAX_HUGEPTE_LEVEL);
> > +	xe_tile_assert(tile, reclaim_entries);
> > +	xe_tile_assert(tile, num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1);
> > +
> > +	if (num_entries =3D=3D XE_PAGE_RECLAIM_INVALID_LIST)
> > +		return;
> > +
> > +	/**
> > +	 * reclamation_size indicates the size of the page to be
> > +	 * invalidated and flushed from non-coherent cache.
> > +	 * Page size is computed as 2^(reclamation_size + XE_PTE_SHIFT) bytes=
.
> > +	 * Only 4K, 64K (level 0), and 2M pages are supported by hardware for=
 page reclaim
> > +	 */
> > +	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64))
> > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /* reclam=
ation_size =3D 0 */
> > +	else if (xe_child->level =3D=3D 0)
> > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclam=
ation_size =3D 4 */
> > +	else if (is_2m_pte(xe_child))
> > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclam=
ation_size =3D 9 */
> > +	else {
> > +		prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST;
> > +		return;
> > +	}
> > +
> > +	reclaim_entries[num_entries].dw0 =3D
> > +		FIELD_PREP(XE_PAGE_RECLAIM_VALID, 1) |
> > +		FIELD_PREP(XE_PAGE_RECLAIM_SIZE, reclamation_size) |
> > +		FIELD_PREP(XE_PAGE_RECLAIM_ADDR_LO, (u32)(phys_addr & 0xFFFFF));
> > +	reclaim_entries[num_entries].dw1 =3D
> > +		FIELD_PREP(XE_PAGE_RECLAIM_ADDR_HI, (u32)((phys_addr >> 20) &
> > +0xFFFFF));
>=20
> The phys_addr math looks off wrt to shifting. I think in the first case y=
ou'd want shift phys_addr by 12 first and 32 in second.
>=20

Ahh got it, perhaps I will just shift the init phys_addr: u64 phys_addr =3D=
 (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT
instead of directly shifting. Seems like it would be compiled down to the s=
ame thing and remain slightly more readable?

Also, seems like I will drop the bit mask and casting here after second loo=
k at FIELD_PREP usage...

> Can you make xe_guc_page_reclaim_entry a qw and just do...
>=20
> reclaim_entries[num_entries].qw =3D phys_addr |
> 	FIELD_PREP(XE_PAGE_RECLAIM_VALID, 1) |
> 	FIELD_PREP(XE_PAGE_RECLAIM_SIZE, reclamation_size);
>=20

Sure, I could, but this does look quite strange compared to traditional lay=
outs where other structs breaks down the dw0, dw1.

Especially for the FIELD_PREP where I believe I must do (?):

#define XE_PAGE_RECLAIM_ADDR_HI		GENMASK(51, 32)
#define XE_PAGE_RECLAIM_RSVD_1		GENMASK(63, 52)

instead of the original 32-bit DW spec aligned that all others follow:

#define XE_PAGE_RECLAIM_ADDR_HI		GENMASK(19, 0)
#define XE_PAGE_RECLAIM_RSVD_1		GENMASK(31, 20)

I'll proceed with the qw suggestion for now though unless any following obj=
ections.

> > +	prl->num_entries++;
> > +}
> > +
> >  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t off=
set,
> >  				    unsigned int level, u64 addr, u64 next,
> >  				    struct xe_ptw **child,
> > @@ -1579,11 +1638,39 @@ static int xe_pt_stage_unbind_entry(struct xe_p=
tw *parent, pgoff_t offset,
> >  				    struct xe_pt_walk *walk)
> >  {
> >  	struct xe_pt *xe_child =3D container_of(*child, typeof(*xe_child),
> > base);
> > +	struct xe_pt_stage_unbind_walk *xe_walk =3D
> > +		container_of(walk, typeof(*xe_walk), base);
> > +	struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> >
> >  	XE_WARN_ON(!*child);
> >  	XE_WARN_ON(!level);
> > +	/* Check for leaf node */
> > +	if (xe_walk->prl && xe_walk->prl->num_entries !=3D XE_PAGE_RECLAIM_IN=
VALID_LIST &&
> > +	    !xe_child->base.children) {
> > +		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> > +		pgoff_t first =3D xe_pt_offset(addr, 0, walk);
> > +		pgoff_t count =3D xe_pt_num_entries(addr, next, 0, walk);
> > +
> > +		for (pgoff_t i =3D 0; i < count; i++) {
> > +			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64)=
;
> > +
> > +			/* Account for NULL terminated entry on end (-1) */
> > +			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
> > +				generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > +						       pte, xe_child);
> > +			} else {
> > +				/* overflow, mark as invalid */
> > +				xe_walk->prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST;
> > +				break;
> > +			}
> > +		}
> > +	}
> >
> > -	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
> > +	/* If aborting page walk early, invalidate PRL since PTE may be dropp=
ed from this abort */
> > +	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &=
&
> > +	    level > 1 && xe_child->base.children && xe_child->num_live !=3D 0=
) {
> > +		xe_walk->prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST;
> > +	}
> >
>=20
> I think everything in this function is right but it really hard to reason=
 with absolutely certainly without running some tests where we
> know the type of memory being allocated / free (e.g., 1 GB pages, things =
getting pruned out at the root, 2M pages + 4k pages, etc...) and
> then look at some debug outputs from the kernel to make it is doing what =
we think it should doing.
>=20
> Can you put in some vm_dbg messages in this function and maybe generate_r=
eclaim_entry which show PRL entries being added and
> cases where it gets invalidated? vm_dbg usually compiles out so if is ver=
bose not a huge deal.
>=20

Got it. I'll add some vm_dbg messages here and in generate_reclaim_entry an=
d those invalidate cases.

Brian

> Matt
>=20
> >  	return 0;
> >  }
> > @@ -1654,6 +1741,8 @@ static unsigned int xe_pt_stage_unbind(struct
> > xe_tile *tile,  {
> >  	u64 start =3D range ? xe_svm_range_start(range) : xe_vma_start(vma);
> >  	u64 end =3D range ? xe_svm_range_end(range) : xe_vma_end(vma);
> > +	struct xe_vm_pgtable_update_op *pt_update_op =3D
> > +		container_of(entries, struct xe_vm_pgtable_update_op, entries[0]);
> >  	struct xe_pt_stage_unbind_walk xe_walk =3D {
> >  		.base =3D {
> >  			.ops =3D &xe_pt_stage_unbind_ops,
> > @@ -1665,6 +1754,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_=
tile *tile,
> >  		.modified_start =3D start,
> >  		.modified_end =3D end,
> >  		.wupd.entries =3D entries,
> > +		.prl =3D pt_update_op->prl,
> >  	};
> >  	struct xe_pt *pt =3D vm->pt_root[tile->id];
> >
> > @@ -1897,6 +1987,7 @@ static int unbind_op_prepare(struct xe_tile *tile=
,
> >  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> >  			     struct xe_vma *vma)
> >  {
> > +	struct xe_device *xe =3D tile_to_xe(tile);
> >  	u32 current_op =3D pt_update_ops->current_op;
> >  	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops->ops[current=
_op];
> >  	int err;
> > @@ -1914,6 +2005,11 @@ static int unbind_op_prepare(struct xe_tile *til=
e,
> >  	pt_op->vma =3D vma;
> >  	pt_op->bind =3D false;
> >  	pt_op->rebind =3D false;
> > +	/* Maintain one PRL located in pt_update_ops that all others in unbin=
d op reference */
> > +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops->prl.entrie=
s)
> > +		xe_page_reclaim_list_alloc_entries(&pt_update_ops->prl);
> > +
> > +	pt_op->prl =3D (pt_update_ops->prl.entries) ? &pt_update_ops->prl :
> > +NULL;
> >
> >  	err =3D vma_reserve_fences(tile_to_xe(tile), vma);
> >  	if (err)
> > @@ -1921,6 +2017,13 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >
> >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, xe_vma_vm(vma),
> >  						vma, NULL, pt_op->entries);
> > +	/* Free PRL if list declared as invalid */
> > +	if (pt_update_ops->prl.entries &&
> > +	    pt_update_ops->prl.num_entries =3D=3D XE_PAGE_RECLAIM_INVALID_LIS=
T) {
> > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > +		pt_op->prl =3D NULL;
> > +	}
> >
> >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> >  				pt_op->num_entries, false);
> > @@ -1979,6 +2082,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
> >  	pt_op->vma =3D XE_INVALID_VMA;
> >  	pt_op->bind =3D false;
> >  	pt_op->rebind =3D false;
> > +	pt_op->prl =3D NULL;
> >
> >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, vm, NULL, range,
> >  						pt_op->entries);
> > @@ -2096,6 +2200,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update=
_ops *pt_update_ops)
> >  	init_llist_head(&pt_update_ops->deferred);
> >  	pt_update_ops->start =3D ~0x0ull;
> >  	pt_update_ops->last =3D 0x0ull;
> > +	xe_page_reclaim_list_init(&pt_update_ops->prl);
> >  }
> >
> >  /**
> > @@ -2518,6 +2623,11 @@ void xe_pt_update_ops_fini(struct xe_tile *tile,=
 struct xe_vma_ops *vops)
> >  		&vops->pt_update_ops[tile->id];
> >  	int i;
> >
> > +	if (pt_update_ops->prl.entries) {
> > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > +	}
> > +
> >  	lockdep_assert_held(&vops->vm->lock);
> >  	xe_vm_assert_held(vops->vm);
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 881f01e14db8..88fabf8e2655 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -8,6 +8,7 @@
> >
> >  #include <linux/types.h>
> >
> > +#include "xe_page_reclaim.h"
> >  #include "xe_pt_walk.h"
> >
> >  struct xe_bo;
> > @@ -79,6 +80,8 @@ struct xe_vm_pgtable_update_op {
> >  	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
> >  	/** @vma: VMA for operation, operation not valid if NULL */
> >  	struct xe_vma *vma;
> > +	/** @prl: Backing pointer to page reclaim list of pt_update_ops */
> > +	struct xe_page_reclaim_list *prl;
> >  	/** @num_entries: number of entries for this update operation */
> >  	u32 num_entries;
> >  	/** @bind: is a bind */
> > @@ -95,6 +98,8 @@ struct xe_vm_pgtable_update_ops {
> >  	struct llist_head deferred;
> >  	/** @q: exec queue for PT operations */
> >  	struct xe_exec_queue *q;
> > +	/** @prl: embedded page reclaim list */
> > +	struct xe_page_reclaim_list prl;
> >  	/** @start: start address of ops */
> >  	u64 start;
> >  	/** @last: last address of ops */
> > --
> > 2.52.0
> >
