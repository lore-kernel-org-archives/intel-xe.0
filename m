Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177C606A319
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QrbHLbwb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D0610EDD0;
	Mon, 19 Oct 2026 22:03:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA03510EDD0
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792447413; x=1823983413;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GlRTAeaw59b6szNbtEazsRIw5/Aoi2QFj+hgAdTurEI=;
 b=QrbHLbwbPJH/PMq34OoeAqpt/wh1lXDHJjcDYKVjEnXeEjBuGkXwjwqJ
 OqFDIYDiU/PAbWlQnPsJ2AwuDfuGwzjGCI+8Km+vDxntVLfCmlonC+Uam
 vnN16JF6rlgp4ARm3F2H6Erq84bEwLUvREXmRNizPgDkWQkyU9Z8+U06v
 Am641HvftQi0FWb1X8enfeCxSYC1Ds2JV+OHGGjEcWsB3pbQtCpgrWp/9
 4xhfkTHvJ3exmNhK/3kVxhJKO80w6ITE78FtjaaNeo1tOAWUvSknracrW
 bQTLzAhGbqCHHzKypz7ErlZ3hI7kSaJuqcKo7gqk8S/ghbIaJTC43vdAr w==;
X-CSE-ConnectionGUID: SkKXEngGQPKBP38v6uRDLQ==
X-CSE-MsgGUID: g6AZAzWXT+aVdEk2vfTggg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1028855"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1028855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 15:03:33 -0700
X-CSE-ConnectionGUID: 0usDXFy4RnGUV9ov/xIdOw==
X-CSE-MsgGUID: QLof8SZIRv2rNHKuK6x7Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2636830"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 15:03:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 15:03:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 15:03:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 15:03:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4cU/HB68H8w3WYJNTXEVEajkr/tdXIjUIAwkQ+i79qyf1/t5ovN5S+3GHbo04awMCZOSuNAqHUmUaM4mdI0j/WzW698WismK+Du2AMDROYKVaBX9sl1a5GlbADBgGHPDWSq8OjtHvPPkoZ5LzXIHc3pcVZIsABNG3NBGly77sWJPhZXl1Q2BAM2KVgLjcL9bm0RA+YklRcUui0yXxDxjwwD/ENOKo5hU7DOzO6QnA8QYnFtZa130eYUO48inlwqqdZ6pF1UmXh3If2A9UTqFeYOPU2wz3lY2tFTnbXeNy5+78+9QZJq/1JOyhiOiaaLA49twIvkyvA+HRASftUygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMLvbrEfsOwI3aF2nCSBolmCbDoSGTD8tE9I5yWWM7Q=;
 b=CoL3cZLDtFvIZEiV0uloHc/3AdRNk1mJ6VFBiNYoAwvteWNdAS4VXYs6bT8Lrmd9enT1JlWznvFJyx33vb4gn88lmhhZ8kz5bQ0JTnaPzNQ+ZxF8eYHK97+7eLDLWKWpNJE14+hjnMdrv/35bTvRi7H+ysgpRsCxSZ1hvX3XXdyW16WoxjmRhzTA1dFMK4Cz3PQZfexeHnpqen4BcXtUoO6zATPZjmcagnTmoVBfs1Y5zMFlUxslnOjIrLw6vYWO6O4Y7YJ8CLCR0cLh1AAOTQDOnyju47fNh6kdnXKB3KPtaZ0m7Em8gIyWaaNsH8i+LI/p8JVjlLkIIHryiC0m5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA1PR11MB6268.namprd11.prod.outlook.com (2603:10b6:208:3e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 19 Oct
 2026 22:03:24 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 22:03:23 +0000
Date: Mon, 19 Oct 2026 15:03:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add a minimum age gate to the shrinker
Message-ID: <ataTqjVRYQkDE6bL@gsse-cloud1.jf.intel.com>
References: <20261015231733.624746-1-matthew.brost@intel.com>
 <02b86ebb170398c1720dcb849024a89fd3dc9ad4.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02b86ebb170398c1720dcb849024a89fd3dc9ad4.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0217.namprd04.prod.outlook.com
 (2603:10b6:303:87::12) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA1PR11MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 706760c4-28c5-421f-c407-08df2e2ccb73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|260925022911599003|22082099003|18002099003|260925021311599003|260925021911599003|261009221227099003|4143699003|261009220027099003|261009223027099003|11063799006|261009223327099003|261009221727099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: gopxkobjG5qkaC+wbPeKj3bpCgSnUQYwa8pRTreQIUf/ZuJ0CBpOjz+l4WyUyFs1sw/P9usVnieOIeFC8neBc0HiiIXwJY9OxowmdbwJSJqwXINg1/FUS6iuhdiJPyP4DO8s1UNrFLcZ/429pNCTXLZcuaV280CS0PMdPXBMwF44pizCKZqwhY9dk8Ia/lxefw7K8Efgc1qrFGd+et8rsj5SnPPs6BY/4ZKAbaITMZmZtSvQ6eJrAU4b+ZwuWFcOjfOTBRIBNWqr1AM8Ov9pMRsL+cc3DW6bBSmSzlNnOgDwERnJHk/W7XbhDox2cnT/VQXz2mn4Bi0iR0E3V16H+L0z5yK/a6tMtSAIRjwUuA84nV88sa9nShW6kR0H4EUSyMHrdF6uJCbkdAZau75C02XtzPUXWnPJza9tiguIbP6ZkhBwaYEOIClprrrF26q+ocsyT35qU+ia0XypmXyIWrwDwDETJsrLpHq2z780s3MS6vHWl2+n7r5M/oELnCpgFkqBnamL4iFpsszTucmVzHDbpvHLIGmZwwho1O0/svftN1mr6ztm+ZzZVoBTzlXm7l4AF91A6fWhjXUYRCyCY58bs3eVB6jH1vX9zmhjCdA7jIfFd6Q3Yf/QU8ZJ/2qAIwKu1aIurtD3/iBgm+0IOLEZDr//ONUjfHigw2zAKZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(260925022911599003)(22082099003)(18002099003)(260925021311599003)(260925021911599003)(261009221227099003)(4143699003)(261009220027099003)(261009223027099003)(11063799006)(261009223327099003)(261009221727099003)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?aSLqD4F9ipvtvVF6rD9fLIuinsYUGPVaY3P5zR2L3DYBUJa5sIQLpuIWmh?=
 =?iso-8859-1?Q?OB7utTzsoPQnKivJI3vtYMKRDHdZ5YoJiCwijf5KnNEUwfPFZ/wuvU/cyg?=
 =?iso-8859-1?Q?72m0gcWS+oHwvYExfejgRmRJoAuyh4Q5NnT8QtSzgCXvmXpro77zLGXIke?=
 =?iso-8859-1?Q?kKMagf2RE+7S6LzLQlkKNbnln+WodXjGqz2LkfwCRljzYmJrpJkt9VUNM4?=
 =?iso-8859-1?Q?mLYDm29krdZbz4UCxXS/ue6J6pdfdw5wrCWTj5xI5Qwg94rph/JwM61suX?=
 =?iso-8859-1?Q?S2KEHgamj16p8iUGUAtVkrZ/BTf+axcRq8Gc90GEHfYA27mMPLEtcOR9aY?=
 =?iso-8859-1?Q?jkvexoXGA5wNjoY4OL0De+7VykZOPK6U9UUPZdnXgOtsp9NzFlkB0oY+9e?=
 =?iso-8859-1?Q?0ILa/zATzkSwHMdew4qL2BgJ1bjgx0jv3knSnR3MCeQJec9JIkkkZQaHEj?=
 =?iso-8859-1?Q?z2kDGLQ5SKW3aQxFgaOnUGndpllhImzJHloXpnOtS9oT0AwHep5UFxVXdi?=
 =?iso-8859-1?Q?66k/Wx5UI5PzKHuk+iohv7ULkqLtyVhS1fU6FkYjgXTOsPNAmbZZlh6Vgh?=
 =?iso-8859-1?Q?+35eXBKlfobdPLIHW4hVNQj0sA0H0jW3MupUDHseLZYGRq3OZVwXeXQqEe?=
 =?iso-8859-1?Q?Zo51M46X5cYLvyS4r6u/hcJeiBsVDWBarMc2GP+FLH2lsYLGGzRBa6M0AW?=
 =?iso-8859-1?Q?DWPTL9ixmTLpjq5OlxsQrf4De60IFQjDLmHRqi3KQ1SlzwfEsOkmt7vYHP?=
 =?iso-8859-1?Q?yKoTpYVd7cBbEbpjdA+/F3YioyFhwu0av07MNuHcl+E6kdfTpEzb9zaua0?=
 =?iso-8859-1?Q?aB0vUN5Ej8dYAO/LAlOGjK2sPv+42LG594RGB1f/DhZUz8543cH1mpkyW0?=
 =?iso-8859-1?Q?zNFeqxVpePDbpCuB5tm1zwTgA3g3Q7X83wpNMjaEtwVRhgcOBGlNOm0vmV?=
 =?iso-8859-1?Q?EB6qlWD/yZ57V3kMhFFWs0m1wsulYa4HOLj9R+t2pdT2VD/JV17YueacGU?=
 =?iso-8859-1?Q?O3yugCYWDJyUIv3BKGsQsn9AYEFyEo2MHgWavDXWIVP61MGVxfQsQNr2pN?=
 =?iso-8859-1?Q?aV6soXKTtvhGX/9DhqwrjtBrmfZvaaKAkApeaaGIWGD718MHiWaS3EWM+6?=
 =?iso-8859-1?Q?61XFgNjkP82CYxvop2x4/2L1fBeOJm/gkTH44Duwr5P1k25nslG5BLnLd4?=
 =?iso-8859-1?Q?mh9DEJJqS6xiEVy+uoXTG47SJ+uSJcu+yKHelswN/9Cvc+riUOv6RUTd81?=
 =?iso-8859-1?Q?gPzK9v5ZrWn4ETKVw1excRbYsml5GpQX+ui9aHPod9kJCFSE41u/4c8M8H?=
 =?iso-8859-1?Q?7la/dwIT6ZHPs4EETbvNYfIIH8EKviV90jb9nRyOVBwx1yPySxDEQt/OBO?=
 =?iso-8859-1?Q?NP3cvIjbfrtHGquvy00tJovidnSTYdcn5AUhcA3T14oxpN85njDO88gNGS?=
 =?iso-8859-1?Q?/BX3ZMVq014GoQTynrv7pxa5FiIFurOTVNrnwSC2TSZbpg6eUPd2QtqO9d?=
 =?iso-8859-1?Q?hBHJ9IILv+HL7OCP8VyV8usWzY8fEptmlcy7/8sXAPzZp7LfSHBIFkBIJP?=
 =?iso-8859-1?Q?t6PxxipF0fU7/VA+0rghEz2mkBIebquRpRqsoJ9j2dsDUvj+sA+nD+Hkgb?=
 =?iso-8859-1?Q?/SiefHzLwZjaD0KF1Kv911t2Jr1sXXkJ5jIibr7uapfvFBV+JjuS9ulyo1?=
 =?iso-8859-1?Q?FtX4BGO+LgjfxEklGBGa65sMo80BtwfRpc4IFzDj8A87Op0T9DoiKdhGCg?=
 =?iso-8859-1?Q?cUKy6Jid99HbiqWY0kztAHdWRMQXQdSi9hXgtiFpjsZDCeJiedjbIuXJA4?=
 =?iso-8859-1?Q?JPsGEDKPhg=3D=3D?=
X-Exchange-RoutingPolicyChecked: lVMZ2ocP/RlLR+lKdlhBF4Qfy3NIrT8Gj3iPQ/3eF3yQfWLaNHCBktaNzA//2KKlxgY9iccPAOD3jzv00E5rBHJR3YtcUyx4diQA2IbdegXaLDS/8/YIFiYLSrvx1rl9ZKU9qSifSnGzvaqgCL+ucZLLxZVLgUsoBmvsylczro5gYEytvltXQUk6rPDvbzIQnpYl1DtcHDTGQ35QQ9OZbf1QWxK+LMP2vXTn+SZEjjp48rHGxZGBiZ6eXeg+mZRk9S4wOg90LPLw5ishoKDOcDGdpiPCB5LqWffh22sXXDJ4a6XbUNF7KdbU8vRcJzM9u5M1xGY/ruPvYMrpFcci3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 706760c4-28c5-421f-c407-08df2e2ccb73
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 22:03:23.8370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUhRz5qhkIof/SKpgy7KqrBfxNRplU/Ib+8sqh8owR62LWPgItzusBgUEcJvJRCUWxOtPfCbO5YK84XHcn5Pow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:15:54PM +0200, Thomas Hellström wrote:
> On Thu, 2026-10-15 at 16:17 -0700, Matthew Brost wrote:
> > Backing up a BO costs a GPU blit plus a page copy, and if the BO is
> > part
> > of an active working set it is faulted straight back in on the next
> > exec.
> > Evicting a BO that was used moments ago is therefore almost always a
> > loss, yet the shrinker currently has no notion of recency beyond LRU
> > order.
> > 
> > Timestamp BOs on their last use: on a successful move into TT in
> > xe_bo_move(), and on the exec LRU bump in xe_vm_bump_lru(). Private
> > BOs
> > are bulk moved with their VM, so stamp the VM there and take the
> > later
> > of the BO and VM stamps for user BOs private to a VM. External
> > objects
> > are stamped individually.
> 
> Perhaps it makes sense to bump LRU on move into TT (I also recall some
> implementations bumped LRU on CPU faults). Then we could timestamp on
> LRU bump only. To me they indicate the same thing.
> 

I was falsely under the impression ttm_bo_move_null or ttm_bo_assign_mem
would do a LRU move, but I guess it doesn't.

So what is suggestion - at the end of xe_bo_move where I adjust
lru_stamp, also do a LRU move? 

> > 
> > Add a per-device shrinker_min_age_ms sysfs attribute, defaulting to
> > CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS (0, disabled). While set, the
> > shrinker
> > won't back up BOs younger than the delay:
> > 
> > - xe_shrinker_count() snoops the first shrinkable BO on each TT-
> > backed
> >   LRU using the trylocked reserved walker, as the tt may be torn down
> >   while the BO is still on the LRU. If all are young it reports only
> >   purgeable pages.
> > - The backup walk stops at the first young BO, as the LRU is roughly
> > age
> >   ordered, and serves as a backstop for the count sample.
> > 
> > The gate is hard and applies at every reclaim priority. A working set
> > kept younger than the delay is never backed up and can lead to OOM.
> > This
> > is deliberate: some users prefer risking OOM over thrashing a hot
> > working
> > set, which is also why it is off by default.
> > 
> > Purgeable objects are never gated, nor are BOs in XE_PL_SYSTEM: those
> > are
> > not GPU mapped, so not part of a working set, and are stamped again
> > when
> > moved back to TT for use.
> 
> What about an OOM notifier and thoughts about future per-cgroup
> shrinking WRT this?
> 

I think this is a follow up a missing OOM notifier (or I thinking if we
priority information from shrinker core, at some priority level we'd
always shrink) is reason this can't be flipped on by default. 

> Perhaps add some timings to the commit message?
>

Sure will trim it down a bit.

> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig.profile   |  14 +++
> >  drivers/gpu/drm/xe/xe_bo.c           |  42 ++++++++
> >  drivers/gpu/drm/xe/xe_bo.h           |   2 +
> >  drivers/gpu/drm/xe/xe_bo_types.h     |   7 ++
> >  drivers/gpu/drm/xe/xe_device_sysfs.c |  48 +++++++++
> >  drivers/gpu/drm/xe/xe_shrinker.c     | 145
> > +++++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_shrinker.h     |   3 +
> >  drivers/gpu/drm/xe/xe_vm.c           |   9 +-
> >  drivers/gpu/drm/xe/xe_vm_types.h     |   7 ++
> >  9 files changed, 266 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> > b/drivers/gpu/drm/xe/Kconfig.profile
> > index e07517d120e0..0e68ad4f06a4 100644
> > --- a/drivers/gpu/drm/xe/Kconfig.profile
> > +++ b/drivers/gpu/drm/xe/Kconfig.profile
> > @@ -74,3 +74,17 @@ config DRM_XE_ENABLE_SCHEDTIMEOUT_LIMIT
> >  	  to apply to applicable user. For elevated user, all above
> > MIN
> >  	  and MAX values will apply when this configuration is
> > enable to
> >  	  apply limitation. By default limitation is applied.
> > +
> > +config DRM_XE_SHRINKER_MIN_AGE_MS
> > +	int "Default minimum BO age before shrinker backup (ms)"
> > +	default 0
> > +	range 0 1000000
> > +	help
> > +	  Default for the per-device shrinker_min_age_ms sysfs
> > attribute. The
> > +	  shrinker won't back up a BO that was moved into TT, or
> > bumped on the
> > +	  LRU by an exec, less than this many milliseconds ago. BOs
> > already
> > +	  evicted to system memory are not part of a working set and
> > are
> > +	  never protected. This applies at every reclaim priority: a
> > working
> > +	  set kept younger than this is never backed up and can
> > cause OOM.
> > +	  Only set if that risk is preferred over thrashing a hot
> > working
> > +	  set. 0 disables.
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 12e523c61c1f..914a9949e6e1 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1313,9 +1313,51 @@ static int xe_bo_move(struct ttm_buffer_object
> > *ttm_bo, bool evict,
> >  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
> >  	}
> >  
> > +	if (!ret && ttm_bo->resource && ttm_bo->resource->mem_type
> > == XE_PL_TT)
> > +		WRITE_ONCE(bo->lru_stamp, jiffies);
> > +
> >  	return ret;
> >  }
> >  
> > +/**
> > + * xe_bo_shrink_too_young() - Whether a BO was used too recently to
> > shrink
> > + * @bo: The TTM buffer object, reserved by the caller.
> > + * @min_age: Minimum age in jiffies. 0 disables the check.
> > + *
> > + * The age is taken from the later of the BO's own &xe_bo.lru_stamp
> > and, for
> > + * user BOs private to a VM, the VM's &xe_vm.lru_stamp. Purgeable
> > and non-xe
> > + * BOs are never considered young since dropping them is cheap.
> > Neither are
> > + * BOs in XE_PL_SYSTEM: they are not GPU mapped, hence not part of a
> > working
> > + * set, and must be moved back to TT, refreshing the stamp, before
> > use.
> > + *
> > + * Return: true if @bo was touched less than @min_age jiffies ago.
> > + */
> > +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned
> > long min_age)
> > +{
> > +	struct xe_ttm_tt *xe_tt;
> > +	struct xe_bo *xe_bo;
> > +	unsigned long stamp;
> > +
> > +	if (!min_age || !bo->ttm || !xe_bo_is_xe_bo(bo) ||
> > +	    bo->resource->mem_type == XE_PL_SYSTEM)
> > +		return false;
> > +
> > +	xe_tt = container_of(bo->ttm, struct xe_ttm_tt, ttm);
> > +	if (xe_tt->purgeable)
> > +		return false;
> > +
> > +	xe_bo = ttm_to_xe_bo(bo);
> > +	stamp = READ_ONCE(xe_bo->lru_stamp);
> > +	if (xe_bo->vm && xe_bo_is_user(xe_bo)) {
> > +		unsigned long vm_stamp = READ_ONCE(xe_bo->vm-
> > >lru_stamp);
> > +
> > +		if (!stamp || time_after(vm_stamp, stamp))
> > +			stamp = vm_stamp;
> > +	}
> > +
> > +	return stamp && time_before(jiffies, stamp + min_age);
> > +}
> > +
> >  static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
> >  			       struct ttm_buffer_object *bo,
> >  			       unsigned long *scanned)
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 77b3a02e9b8e..927642adfc21 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -623,6 +623,8 @@ struct xe_bo_shrink_flags {
> >  	u32 writeback : 1;
> >  };
> >  
> > +bool xe_bo_shrink_too_young(struct ttm_buffer_object *bo, unsigned
> > long min_age);
> > +
> >  long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct
> > ttm_buffer_object *bo,
> >  		  const struct xe_bo_shrink_flags flags,
> >  		  unsigned long *scanned);
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 8ec4a01a0092..a5f0435df718 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -43,6 +43,13 @@ struct xe_bo {
> >  	u32 flags;
> >  	/** @vm: VM this BO is attached to, for extobj this will be
> > NULL */
> >  	struct xe_vm *vm;
> > +	/**
> > +	 * @lru_stamp: jiffies at the last move into TT or, for
> > external
> > +	 * objects, the last exec LRU bump. Private BOs are
> > additionally
> > +	 * covered by &xe_vm.lru_stamp. Consulted by the shrinker's
> > minimum
> > +	 * age gate. Accessed with READ_ONCE()/WRITE_ONCE().
> > +	 */
> > +	unsigned long lru_stamp;
> >  	/**
> >  	 * @q: Queue this BO is attached to, mostly for LRC BO, NULL
> > otherwise.
> >  	 * Protected by the BO dma_resv: readers must hold it across
> > both the
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > index 18783a286a83..799397755f57 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_pcode_api.h"
> >  #include "xe_pcode.h"
> >  #include "xe_pm.h"
> > +#include "xe_shrinker.h"
> >  
> >  /**
> >   * DOC: Xe device sysfs
> > @@ -31,6 +32,12 @@
> >   *
> >   * lb_voltage_regulator_version - Voltage regulator version
> > provisioned by late
> >   * binding. Exposed only if supported by the device.
> > + *
> > + * shrinker_min_age_ms - Report/change the minimum time, in ms,
> > since a BO was
> > + * last moved to TT or bumped on the LRU by an exec before the
> > shrinker may
> > + * back it up. BOs evicted to system memory are never protected.
> > Defaults to
> > + * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, 0 disables. This applies at
> > every
> > + * reclaim priority, so a non-zero value can lead to OOM.
> >   */
> >  
> >  static ssize_t
> > @@ -75,6 +82,43 @@ static const struct attribute_group
> > vram_attr_group = {
> >  	.attrs = vram_attrs,
> >  };
> >  
> > +static ssize_t
> > +shrinker_min_age_ms_show(struct device *dev, struct device_attribute
> > *attr,
> > +			 char *buf)
> > +{
> > +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> > +
> > +	return sysfs_emit(buf, "%u\n", xe_shrinker_min_age_ms(xe-
> > >mem.shrinker));
> > +}
> > +
> > +static ssize_t
> > +shrinker_min_age_ms_store(struct device *dev, struct
> > device_attribute *attr,
> > +			  const char *buff, size_t count)
> > +{
> > +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> > +	unsigned int ms;
> > +	int ret;
> > +
> > +	ret = kstrtouint(buff, 0, &ms);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe_shrinker_set_min_age_ms(xe->mem.shrinker, ms);
> > +
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(shrinker_min_age_ms);
> > +
> > +static struct attribute *shrinker_attrs[] = {
> > +	&dev_attr_shrinker_min_age_ms.attr,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group shrinker_attr_group = {
> > +	.attrs = shrinker_attrs,
> > +};
> > +
> >  static ssize_t
> >  lb_fan_control_version_show(struct device *dev, struct
> > device_attribute *attr, char *buf)
> >  {
> > @@ -299,6 +343,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
> >  	struct device *dev = xe->drm.dev;
> >  	int ret;
> >  
> > +	ret = devm_device_add_group(dev, &shrinker_attr_group);
> > +	if (ret)
> > +		return ret;
> > +
> >  	if (xe->d3cold.capable) {
> >  		ret = devm_device_add_group(dev, &vram_attr_group);
> >  		if (ret)
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > index deb4378c1ec1..f0bc026bd642 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -22,6 +22,8 @@
> >   * @purgeable_pages: Number of pages that are currently purgeable.
> >   * @shrink: Pointer to the mm shrinker.
> >   * @pm_worker: Worker to wake up the device if required.
> > + * @min_age_ms: Minimum BO age before backup, in ms. 0 disables.
> > Defaults to
> > + * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, overridable through sysfs.
> >   */
> >  struct xe_shrinker {
> >  	struct xe_device *xe;
> > @@ -30,6 +32,7 @@ struct xe_shrinker {
> >  	long purgeable_pages;
> >  	struct shrinker *shrink;
> >  	struct work_struct pm_worker;
> > +	unsigned int min_age_ms;
> >  };
> >  
> >  static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
> > @@ -80,6 +83,7 @@ static void xe_shrinker_runtime_pm_put(struct
> > xe_shrinker *shrinker, bool runtim
> >  static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
> >  			      struct ttm_operation_ctx *ctx,
> >  			      const struct xe_bo_shrink_flags flags,
> > +			      unsigned long min_age, bool *young,
> >  			      unsigned long to_scan, unsigned long
> > *scanned,
> >  			      unsigned long *freed)
> >  {
> > @@ -112,6 +116,16 @@ static int __xe_shrinker_walk(struct xe_shrinker
> > *shrinker,
> >  			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
> >  				continue;
> >  
> > +			/*
> > +			 * The LRU is roughly age ordered, so
> > everything past
> > +			 * the first young BO is most likely young
> > too. Stop
> > +			 * here.
> > +			 */
> > +			if (xe_bo_shrink_too_young(ttm_bo, min_age))
> > {
> > +				*young = true;
> > +				goto out;
> > +			}
> > +
> >  			lret = xe_bo_shrink(ctx, ttm_bo, flags,
> > scanned);
> >  			if (lret < 0) {
> >  				ret = lret;
> > @@ -141,42 +155,128 @@ static int __xe_shrinker_walk(struct
> > xe_shrinker *shrinker,
> >  static int xe_shrinker_walk(struct xe_shrinker *shrinker,
> >  			    struct ttm_operation_ctx *ctx,
> >  			    const struct xe_bo_shrink_flags flags,
> > +			    unsigned long min_age,
> >  			    unsigned long to_scan, unsigned long
> > *scanned,
> >  			    unsigned long *freed)
> >  {
> >  	bool no_wait_gpu = true;
> >  	struct xe_bo_shrink_flags save_flags = flags;
> > +	bool young = false;
> >  	int ret;
> >  
> >  	swap(no_wait_gpu, ctx->no_wait_gpu);
> >  	save_flags.writeback = false;
> > -	ret = __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan,
> > scanned,
> > -				 freed);
> > +	ret = __xe_shrinker_walk(shrinker, ctx, save_flags, min_age,
> > &young,
> > +				 to_scan, scanned, freed);
> >  	swap(no_wait_gpu, ctx->no_wait_gpu);
> > -	if (ret || *scanned >= to_scan)
> > +	if (ret || young || *scanned >= to_scan)
> >  		return ret;
> >  
> >  	if (!ctx->no_wait_gpu) {
> > -		ret = __xe_shrinker_walk(shrinker, ctx, save_flags,
> > to_scan, scanned,
> > -					 freed);
> > -		if (ret || *scanned >= to_scan)
> > +		ret = __xe_shrinker_walk(shrinker, ctx, save_flags,
> > min_age,
> > +					 &young, to_scan, scanned,
> > freed);
> > +		if (ret || young || *scanned >= to_scan)
> >  			return ret;
> >  	}
> >  
> >  	if (flags.writeback)
> > -		ret = __xe_shrinker_walk(shrinker, ctx, flags,
> > to_scan, scanned,
> > -					 freed);
> > +		ret = __xe_shrinker_walk(shrinker, ctx, flags,
> > min_age, &young,
> > +					 to_scan, scanned, freed);
> >  
> >  	return ret;
> >  }
> >  
> > +/**
> > + * DOC: Shrinker minimum age
> > + *
> > + * The per-device shrinker_min_age_ms sysfs attribute, defaulting to
> > + * CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS, protects recently used BOs
> > from backup.
> > + * A BO's age is taken from the last time it moved into TT
> > (xe_bo_move()) or,
> > + * at exec time, was bumped on the LRU (xe_vm_bump_lru()). For BOs
> > private to
> > + * a VM the VM-wide stamp is used, matching the LRU bulk move. BOs
> > in
> > + * XE_PL_SYSTEM are never young: they are not GPU mapped, so not
> > part of a
> > + * working set, and will be stamped again when moved back to TT for
> > use.
> > + *
> > + * xe_shrinker_count() snoops the first shrinkable BO on each TT-
> > backed LRU.
> > + * If all of them are young, it doesn't report shrinkable pages, so
> > vmscan
> > + * only asks for purgeable ones. A shrinkable BO in XE_PL_SYSTEM
> > therefore
> > + * always lets count report. The backup walk in xe_shrinker_scan()
> > stops
> > + * at the first young BO, since the LRU is roughly age ordered, as a
> > backstop
> > + * since the count snoop is only a sample. Purgeable BOs are never
> > gated.
> > + *
> > + * The gate is hard and applies at every reclaim priority. A working
> > set kept
> > + * younger than the delay is never backed up, which can lead to OOM.
> > This is
> > + * intended for users who prefer that risk over thrashing a hot
> > working set,
> > + * hence it is disabled by default.
> > + */
> > +static unsigned long xe_shrinker_min_age(struct xe_shrinker
> > *shrinker)
> > +{
> > +	unsigned int ms = READ_ONCE(shrinker->min_age_ms);
> > +
> > +	return ms ? msecs_to_jiffies(ms) : 0;
> > +}
> > +
> > +/* Max shrink-unsuitable BOs to skip per LRU before giving up the
> > snoop. */
> > +#define XE_SHRINKER_SNOOP_MAX	16
> > +
> > +/*
> > + * Whether the first shrinkable BO on every TT-backed LRU is younger
> > than
> > + * @min_age. BOs are trylocked through the reserved LRU walker since
> > their
> > + * tt may be torn down while still on the LRU. Contended BOs are
> > skipped by
> > + * the walker. If no verdict can be reached within the snoop budget,
> > report
> > + * not young and leave it to the scan side check.
> > + */
> > +static bool xe_shrinker_lru_young(struct xe_shrinker *shrinker,
> > +				  unsigned long min_age)
> > +{
> > +	struct ttm_operation_ctx ctx = {
> > +		.interruptible = false,
> > +		.no_wait_gpu = false,
> > +	};
> > +	struct xe_device *xe = shrinker->xe;
> > +	unsigned int mem_type;
> > +
> > +	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT;
> > ++mem_type) {
> 
> XE_PL_SYSTEMs are never young?
> 

Correct, so first XE_PL_SYSTEM found can be shrunk which allows shrinker
to run.

> > +		struct ttm_resource_manager *man =
> > ttm_manager_type(&xe->ttm, mem_type);
> > +		struct ttm_bo_lru_cursor curs;
> > +		struct ttm_buffer_object *ttm_bo;
> > +		struct ttm_lru_walk_arg arg = {
> > +			.ctx = &ctx,
> > +			.trylock_only = true,
> > +		};
> > +		unsigned int budget = XE_SHRINKER_SNOOP_MAX;
> > +
> > +		if (!man || !man->use_tt)
> > +			continue;
> > +
> > +		ttm_bo_lru_for_each_reserved_guarded(&curs, man,
> > &arg, ttm_bo) {
> > +			if (!ttm_bo_shrink_suitable(ttm_bo, &ctx)) {
> > +				if (!--budget)
> > +					return false;
> > +				continue;
> > +			}
> > +
> > +			if (!xe_bo_shrink_too_young(ttm_bo,
> > min_age))
> > +				return false;
> > +
> > +			break;
> > +		}
> > +	}
> > +
> > +	return true;
> > +}
> > +
> >  static unsigned long
> >  xe_shrinker_count(struct shrinker *shrink, struct shrink_control
> > *sc)
> >  {
> >  	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> > -	unsigned long num_pages;
> > +	unsigned long num_pages, min_age;
> >  	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> >  
> > +	min_age = can_backup ? xe_shrinker_min_age(shrinker) : 0;
> > +	if (min_age && xe_shrinker_lru_young(shrinker, min_age))
> > +		can_backup = false;
> > +
> >  	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
> 
> Also here, perhaps reorder since on a system with num_pages == 0, the
> bo age doesn't matter.
>

So elide the new logic on !num_pages?

e.g.,

num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
if (num_pages) {
	min_age = can_backup ? xe_shrinker_min_age(shrinker) : 0;
	if (min_age && xe_shrinker_lru_young(shrinker, min_age))
		can_backup = false;
}

Matt
 
> 
> /Thomas
> 
> >  	read_lock(&shrinker->lock);
> >  
> > @@ -245,7 +345,7 @@ static unsigned long xe_shrinker_scan(struct
> > shrinker *shrink, struct shrink_con
> >  	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false,
> > nr_to_scan, can_backup);
> >  
> >  	if (purgeable && nr_scanned < nr_to_scan)
> > -		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> > +		xe_shrinker_walk(shrinker, &ctx, shrink_flags, 0,
> >  				 nr_to_scan, &nr_scanned, &freed);
> >  
> >  	sc->nr_scanned = nr_scanned;
> > @@ -259,6 +359,7 @@ static unsigned long xe_shrinker_scan(struct
> > shrinker *shrink, struct shrink_con
> >  	shrink_flags.purge = false;
> >  
> >  	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
> > +			 xe_shrinker_min_age(shrinker),
> >  			 nr_to_scan, &nr_scanned, &freed);
> >  
> >  	sc->nr_scanned = nr_scanned;
> > @@ -288,6 +389,29 @@ static void xe_shrinker_fini(struct drm_device
> > *drm, void *arg)
> >  	kfree(shrinker);
> >  }
> >  
> > +/**
> > + * xe_shrinker_min_age_ms() - Get the shrinker minimum BO age
> > + * @shrinker: Pointer to the struct xe_shrinker.
> > + *
> > + * Return: Minimum age, in ms, a BO must reach before it may be
> > backed up.
> > + */
> > +unsigned int xe_shrinker_min_age_ms(struct xe_shrinker *shrinker)
> > +{
> > +	return READ_ONCE(shrinker->min_age_ms);
> > +}
> > +
> > +/**
> > + * xe_shrinker_set_min_age_ms() - Set the shrinker minimum BO age
> > + * @shrinker: Pointer to the struct xe_shrinker.
> > + * @ms: Minimum age, in ms. 0 disables the gate.
> > + *
> > + * See DOC: Shrinker minimum age. A non-zero value can lead to OOM.
> > + */
> > +void xe_shrinker_set_min_age_ms(struct xe_shrinker *shrinker,
> > unsigned int ms)
> > +{
> > +	WRITE_ONCE(shrinker->min_age_ms, ms);
> > +}
> > +
> >  /**
> >   * xe_shrinker_create() - Create an xe per-device shrinker
> >   * @xe: Pointer to the xe device.
> > @@ -309,6 +433,7 @@ int xe_shrinker_create(struct xe_device *xe)
> >  
> >  	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> >  	shrinker->xe = xe;
> > +	shrinker->min_age_ms = CONFIG_DRM_XE_SHRINKER_MIN_AGE_MS;
> >  	rwlock_init(&shrinker->lock);
> >  	shrinker->shrink->count_objects = xe_shrinker_count;
> >  	shrinker->shrink->scan_objects = xe_shrinker_scan;
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> > b/drivers/gpu/drm/xe/xe_shrinker.h
> > index 5132ae5192e1..a3b8b7dada09 100644
> > --- a/drivers/gpu/drm/xe/xe_shrinker.h
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> > @@ -13,4 +13,7 @@ void xe_shrinker_mod_pages(struct xe_shrinker
> > *shrinker, long shrinkable, long p
> >  
> >  int xe_shrinker_create(struct xe_device *xe);
> >  
> > +unsigned int xe_shrinker_min_age_ms(struct xe_shrinker *shrinker);
> > +void xe_shrinker_set_min_age_ms(struct xe_shrinker *shrinker,
> > unsigned int ms);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 095f762bbb6f..b569c1ababa3 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -426,15 +426,22 @@ int xe_vm_validate_rebind(struct xe_vm *vm,
> > struct drm_exec *exec,
> >  void xe_vm_bump_lru(struct xe_vm *vm, struct drm_exec *exec)
> >  {
> >  	spinlock_t *lru_lock = &vm->xe->ttm.lru_lock;
> > +	unsigned long now = jiffies;
> >  	struct drm_gem_object *obj;
> >  
> > +	WRITE_ONCE(vm->lru_stamp, now);
> > +
> >  	spin_lock(lru_lock);
> >  	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> >  	drm_exec_for_each_locked_object(exec, obj) {
> > +		struct xe_bo *bo;
> > +
> >  		if (!drm_gpuvm_is_extobj(&vm->gpuvm, obj))
> >  			continue;
> >  
> > -		ttm_bo_move_to_lru_tail(&gem_to_xe_bo(obj)->ttm);
> > +		bo = gem_to_xe_bo(obj);
> > +		WRITE_ONCE(bo->lru_stamp, now);
> > +		ttm_bo_move_to_lru_tail(&bo->ttm);
> >  		cond_resched_lock(lru_lock);
> >  	}
> >  	spin_unlock(lru_lock);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > index fb9305124679..a6dc7233b336 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > @@ -267,6 +267,13 @@ struct xe_vm {
> >  	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
> >  	struct ttm_lru_bulk_move lru_bulk_move;
> >  
> > +	/**
> > +	 * @lru_stamp: jiffies at the last xe_vm_bump_lru(). Covers
> > the
> > +	 * VM's private BOs for the shrinker's minimum age gate.
> > +	 * Accessed with READ_ONCE()/WRITE_ONCE().
> > +	 */
> > +	unsigned long lru_stamp;
> > +
> >  	u64 size;
> >  
> >  	struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
