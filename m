Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21189FF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 09:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D340D10E3CC;
	Mon,  4 May 2026 09:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ncmJgeT3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3335010E3CC
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777885921; x=1809421921;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jYekuQwE097KgrVMBvGw7JG3xd60nhn/qmUFKUJIy68=;
 b=ncmJgeT3ziQCSE57dbm7JzG0qQW0nvyn1wpAnFb4IJ5cc7//f8O2F4zJ
 JKwUPQy2fZaSbOCqTvoL2N7L08kGu8OilaVwLWnGRnFxt1uBmQtyzeErF
 GOvN9myxlnudgOz9XrjYZZ5zgmYX5f75ArOrCZ1kiiqp/McABLWi5r+mZ
 KJ0QV0qVUor6hMX8qot45IEuXzDWfRrSs2BJ3I5T2aj8keTRdQGcgRPPJ
 QtpYjxyAAwu3bmSqW7k/MEMtz/G9mdcGij//WggkPLALEmgIASI9D5nYl
 FqPpaV5bQRA9edF9nBbznHjwJl3n9RGQaMqoN7xaHMw3s7HMRvNZh90Er w==;
X-CSE-ConnectionGUID: 3+szQMnaRjaYYOXC6/++/A==
X-CSE-MsgGUID: lcu+1VgMTYCUmI5HLVQGcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96308408"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="96308408"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:11:58 -0700
X-CSE-ConnectionGUID: WYuDyuS8SneJQtPRS8lQNQ==
X-CSE-MsgGUID: dN9L1HOCQ82gTt+mF3fVNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="230867712"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 02:11:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:11:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 02:11:57 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 02:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIId8xqzQcO5CQOnuBc/vWBl8+TII1ds/Cm1nkNAoQYdUeYYLMylXF/5fjk74wEf0ej7SBno92c+24cI3Ur4/Wynzm2+gLaLbu7GrFcoMrjyFP0rtNBXIN8i+k6JpAc1QkMKoC9FfTaYx9sNds+TFj8CJ6mMZM/2tUCZNiTp/UMv5Iq3fcbi5N1m0S246yUM/WqjvhDNWEiPBtE48zTi1lNXRACCgQisRS4I5hWNvuIwJuMU+LJWFIBhYv1Fzr4gcPrhu8uCUKDkMqmRrVENfki7uB2nXP18msAqoPHa/iKBOBAN73wwutxiH6Y+/ZwWN8VlAUaz4ZCFyV7zYxa7sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuEBFino4/booLAOZ7CsY4XIkytG/7t2U+mnnbMzuXU=;
 b=irS/GcF8b5EhGGTn7gvc8iW9vIkg2qjrr8KWt7yzXf65pyYs9wQkS7yBC6UMZ7lEUo7bpELJ8mrz7+MGK0OHrKl+s+2q8Gd8T7Rf6HLwr8hrGOwF3+aMEx7WGBIMcBS6rrV5lkcsGfKXq5A24sS1Bh5PPCsqZgDVVuDPOJaEy+pkg3BzKweIez7vAab0hcfnRGtiKab5eL5K6zeJeDchYNokIxb/zXRovD8eAkWnpHOGqb6H4fqLjfdpBDVFhz6+cvvnqONkowEL7afmSsdW/znOtnibjpExK7CPnKip7Af6n4TWy+72lsxdZCeWzL/GBwFwGikgq1FHyMriMXPaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Mon, 4 May
 2026 09:11:49 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 09:11:49 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [RFC PATCH V7 04/10] drm/xe: Link LRC BO and its execution Queue
Thread-Topic: [RFC PATCH V7 04/10] drm/xe: Link LRC BO and its execution Queue
Thread-Index: AQHczXW/2G5w5GwMLEWl0lGab5/FN7X3CYuAgAanVhA=
Date: Mon, 4 May 2026 09:11:49 +0000
Message-ID: <DS0PR11MB87185C235C09A26E9F4C4A8181312@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260416074958.3722666-12-tejas.upadhyay@intel.com>
 <20260416074958.3722666-16-tejas.upadhyay@intel.com>
 <afLNvfQRu69FgHyf@gsse-cloud1.jf.intel.com>
In-Reply-To: <afLNvfQRu69FgHyf@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SN7PR11MB7666:EE_
x-ms-office365-filtering-correlation-id: 137037ed-35e1-4195-3f48-08dea9bd2cc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: yxzfAc65oqbFNAR70Fw0OJljh1j0REjpGxZGTPdE16lrBhNX9oGzn/nP7OAc+DNfhkT3ZQZkpi2639/W9VLwR4ahCn9vFUcxl6m320Yz2YfNKcKn2NDrxoVOhhnYrbVtkZ+kr3DXB4TO1EKYjtJjyCHoR0UyGCRYiAjMuLI7iSgyicM0Gm3+FstAwM51a4IkfTg51U2JldkfpqxeY3mivCMb5FaGJVOBCkmsQ3QjPoIne5VzIBJObtbu0LFWk51xCtmFSHvVVQ5AaTeVzZIzMZhM4YGyUPMi6k2j3dG1UOOQhxv6Camt+/ryiuKUGDj60YPKN4bvyxrQyYKNJ2ZF+i/9JSqD6ZgXRLNVhtgIXSxh+j/+sZ/j9NGfy8wMg7njKbxYAKkI63OOk+GdoyyTqfafbu/V/XFyMCCOg9oXBta79lL5Bq82xpeKsTSvH+Drxad6+o1wFlHGUPO84KavfH5sj0TG6z5GdjyBlySt4TMVIEZWYHR9GBf/T+Gvz5+DwF0quE5LB5ZmLIf/2hpuqNRbDD65OVJP95DGq2A4uyudb3EoVi0IYV8jH7BVEEDU69WR5pzN6x0L927DtbyvEZ1MpVLCV99lrWiYbz0cmW+C5UTZyYiNHHsop2frcnjQkhkZcrKUEmqnNOzAy7vVmZ1EIG3cn60nTVK90dONQpTSFLGyGX2e4nOq8KN7Ywe+u2vO51CS8fwuewddEcc1Q4HxDjcxwttMSPT08MApB8eRw7yKKrflLUfn1iVnPx7F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HrzhGoyerL/2QK8UQozE4DDacVyRHVTn1Mv+hs3/4RdxDKJz6yesPh8/GyVV?=
 =?us-ascii?Q?GomEyoVZpQOmCMTakfPH8WYj8de+SQBY1EV9sZJuZ3nNCQMSfp/0sRiq66QM?=
 =?us-ascii?Q?bYto4VVtRlhoX+221qrDBbrXKhi2o428JKuGW7R2ipHTkcXtKrzqa3j+CTfy?=
 =?us-ascii?Q?gp1i8Cb5JJ5QW6MQFQJghwxLR7MBTkD8p6eaPmUlp5go+99WG6KOA78G5QX5?=
 =?us-ascii?Q?jYL88ZczkNtWAWnNIv9ee+jeftHNVgVklGmdDkbH93K79wS8hUuW+0C19BNW?=
 =?us-ascii?Q?3pFWloqjOsiTIxIlbZvpfy2/v9htEauHkIevwR2fybLwya+n72PHp1vK6cYA?=
 =?us-ascii?Q?XasXg5Zu159DTVdYZd9wZ15cmI+qa1fubyCKpvd9ORESNIa3bST13XX7P9UM?=
 =?us-ascii?Q?dDbMS3WFT9ABgztHwsncNlHRCwSOs0xJ1SOvFwO/aDHKD0UYOQ/K23IhLfR2?=
 =?us-ascii?Q?KwapXZnqSwPi2t5E6ExWbBHBn7QeO4FcFo1Zmxia0Vdfj1bPxYv0CBuWc+9m?=
 =?us-ascii?Q?Lbyf95grII1mz08tjldMVYiw2NYtmWUuq6TWEFll1QEcG9vz2nPD4hayhChd?=
 =?us-ascii?Q?W0ffxUEJuw4UoomNF2D4OQb1uXLCD6BkbSjzasIJIK8lCZdDqR5FJXmHPkzj?=
 =?us-ascii?Q?7KHK6TfC1ivJqk8RDy5NhMMGGApZCbjDvgd2driGqkwQGXaLkjXD6S0ZECok?=
 =?us-ascii?Q?rlzCgW1aV6KQVu4BAL8J6DReEHQdPyoklqR1IjTEHUYOr949FcBcMzwLwov0?=
 =?us-ascii?Q?2SMW78JCh7Sy2qAqMvDa2K+0ta8r/GHZK3Md5LefPg3hHa1f5CRhC6YsX79z?=
 =?us-ascii?Q?5tMhSHh3R79j1RAR/YSeworfLGlXxe4M2CgKNxpFQpQvBR62FxqEIFiENPh7?=
 =?us-ascii?Q?ht1kYMMsBVNoSMzMk16P+1jqfZiJgz+69A8IcGj7j42+UqKE6E07SnGsm9I/?=
 =?us-ascii?Q?qXfBmVG/t7/ARRY13eu7tgfG9R8uFIthsXgS+JEYpY6/zi4HsGq3Ixg96XCh?=
 =?us-ascii?Q?8eImHFgSTqQ2LKy5/zYTx54lmnS0gGryILJZ/6dpznu3xCdiz3esQHHOvYbC?=
 =?us-ascii?Q?k8qKWd8cfhdxzSI44QGk6KZk5EN/ACDF9ESY8myZ2hU9Hlhst6RBJjvt2Wmf?=
 =?us-ascii?Q?CUAEUmyR+otjKqRGl3XQNkxEej5Eb3cmX6M2Eds1vq7GhV5VVvpcodTn+dMp?=
 =?us-ascii?Q?MAXxHRXVoTsyaqEBsqxBqMt1rMikpOG83yLg1vf2QTOQ4cMz46g5pMNLyCMe?=
 =?us-ascii?Q?PWX1ZLcfQCOJZcTcyGh1XTD2RawRnESTGNSZH/mleQBPxoEl7FMjPoXolJeB?=
 =?us-ascii?Q?pPUGctYO5F9Edr/iqgYm7qHotNKdvuNs5zYY5TvrjfXet+eXEJKHZa4sL0dG?=
 =?us-ascii?Q?GmNylwj6MCiotBqEi9cy26ERM05CoU0q30AMJMdWHbKfAF/Y2c3DpOqzS+/O?=
 =?us-ascii?Q?86K/uBrRH8OnHEtAOAuamGStEGRo/KXRXSEeYMIA/lu2OYJSwT1FkAdyzWSF?=
 =?us-ascii?Q?arcY7EGYIWqzWPEuGGMMq97UC/5ip3EG2L1tRqBvvGNTpmVD+Xzx8RQy0lor?=
 =?us-ascii?Q?0eYg9TT9XTRSVRQVd4w6DX6oEWs3wkkQDNcVjsvB2RJKUm952AJu03GlMzKp?=
 =?us-ascii?Q?C2dQ28A2z5Bvn+uGr7hggHbooDBJkNaOp4Ie8ypLtf4H5AG/7vaBY5/oDymV?=
 =?us-ascii?Q?ZJuj9/D7pkzw+/kYRDY32FqXIdV+4K2ohE691ahQksGXpuPxiOJfxHqNNART?=
 =?us-ascii?Q?FGG6gCaHNTw20nFNujS2U1CzL77O2RNKl2vBXBE7/QYsr5BEcqn/mwOldwGW?=
x-ms-exchange-antispam-messagedata-1: W7btlZ5z6+uWnA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ArxlVWCXeb+8/QR/z0xr5I4QqjZAE1YKB56zovyojlSuKOczR0PuH5Ucq5WvN9bS2EJjdF8gpVehoi4E49byZRwU+dXU4rWI9iW48GVSbhUZicTbDnAugX/M6Y9Riiu0JsUGt74wj9A4nDpIusWhiFIDWeAmkIXPPaZyhKSP8pZbTdwNXpPI7Xh/2+jur67BUEYLm5onTXN3+J2SySAAuTAMttFeBaX9SmyM79V6z9UIi/9E62DnJWoQZSng25gZ16LE7fS7C0zl74y6G3szPnxwQac2zALTcItvtZHwSezf04gsZ/Y0xogc0n3imTHRDmP+0fzP2hg7XAweFZeesQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 137037ed-35e1-4195-3f48-08dea9bd2cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 09:11:49.7716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8se3d/b25qy3b/jI1GL6jP6ntBnZxsKiNpWt0/w76wPSjTxkCc+3vEMOW08RBoiYKJZdL0VWpvf3f3sTNFgccwuIOsv7ONWzFVxdyjip/p8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: 30 April 2026 09:04
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> <matthew.auld@intel.com>; thomas.hellstrom@linux.intel.com; Ghimiray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: Re: [RFC PATCH V7 04/10] drm/xe: Link LRC BO and its execution
> Queue
>=20
> On Thu, Apr 16, 2026 at 01:19:53PM +0530, Tejas Upadhyay wrote:
> > To establish a link between an LRC BO (Logical Ring Context Buffer
> > Object) and its corresponding execution Queue in the drm/xe driver,
> > you need to store a back-pointer to the queue within the BO's private
> > data structure. This allows the driver to identify and take corrective
> > action on the specific queue if the LRC BO encounters an error (e.g.,
> > memory corruption or eviction issues).
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo_types.h   | 3 +++
> >  drivers/gpu/drm/xe/xe_exec_queue.c | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 9d19940b8fc0..a647b775a65c 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -20,6 +20,7 @@
> >  struct xe_device;
> >  struct xe_mem_pool_node;
> >  struct xe_vm;
> > +struct xe_exec_queue;
> >
> >  #define XE_BO_MAX_PLACEMENTS	3
> >
> > @@ -40,6 +41,8 @@ struct xe_bo {
> >  	u32 flags;
> >  	/** @vm: VM this BO is attached to, for extobj this will be NULL */
> >  	struct xe_vm *vm;
> > +	/** @q: Queue this BO is attached to, mostly for LRC BO, NULL
> otherwise */
> > +	struct xe_exec_queue *q;
> >  	/** @tile: Tile this BO is attached to (kernel BO only) */
> >  	struct xe_tile *tile;
> >  	/** @placements: valid placements for this BO */ diff --git
> > a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 071b8c41df43..632c9603afc1 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -386,6 +386,7 @@ static int __xe_exec_queue_init(struct
> xe_exec_queue *q, u32 exec_queue_flags)
> >  				goto err_lrc;
> >  			}
> >
> > +			lrc->bo->q =3D q;
>=20
> I think we need a comment why this is safe.. Something like:
>=20
> /*
>  * The queue ref counts the LRCs, thus it safe for the LRC BO to hold a
>  * pointer to queue without reference.
>  */
> lrc->bo->q =3D q;
>=20
> Multi-q comes into play here... So I think the assignment should actually=
 be:
>=20
> lrc->bo->q =3D xe_exec_queue_multi_queue_primary(q);
>=20
> Then to be paranoid in xe_lrc_finish:
>=20
> lrc->bo->q =3D NULL;
>=20
> Before calling: xe_bo_unpin_map_no_vm(lrc->bo);

Thanks for comment, sure I need to change that.

Tejas
>=20
> Matt
>=20
> >  			xe_exec_queue_set_lrc(q, lrc, i);
> >
> >  			if (__lrc)
> > --
> > 2.52.0
> >
