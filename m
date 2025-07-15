Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA80C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032EF10E6C4;
	Tue, 15 Jul 2025 21:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNUi73bt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ACA10E6C4
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752615773; x=1784151773;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=71s0C5liKfpExCkiQv46JCHfI7zw2zjfW10CoH2Cm1k=;
 b=DNUi73btIGYBMt3/kccfZoJTEWuiHk5bn1mjVI5bNyUzYQs8wfj3EfsM
 7eidh6LpUgBTm3xTM+NYP/UOYL2rWGd9JISR3WNTF/jaM+jgQLd9JyDOq
 gTX2YKJ2EJVe1j3xIrn5BLkt1MTjIENp9ONuCIPES9ieaIsK2Bt+oBDnT
 3CYmOV/JyF9bCJxEyeLXUdGRD47OWI5UcLbES5xRJQBoBNBKlBo2mdDTE
 QUgTDgzVaI0hb+c5iDMXWs+y+L5r2MURLiB6sEukPndX2Nc54fdwMXGCe
 lmSHWzCt7d8iaR0C448BOqmTrX1MRx8mMHQSNC4TtueKdYKCnyBKMzMgG A==;
X-CSE-ConnectionGUID: BPHgVshBQ3GtlfRv+HWhxQ==
X-CSE-MsgGUID: RZFU0Fa3RpS3RjYANgBXJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65915664"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="65915664"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:42:52 -0700
X-CSE-ConnectionGUID: HkmIB/TLReiEjPVwXuDqfw==
X-CSE-MsgGUID: jV0iHvSCRz2STuSOQ8KhXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156999280"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:42:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:42:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:42:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjKKYW9tMDontVqDd9snhLtP1PcL5XH/cMLw5ClPz4U10DZrxiNV+03Pg3m9FLvWDyFyFC8O0D/92Pn6eEQ1xQIguRSgeU9qIYqEp7YrSdH5Ow45gcPo9koK2Wi11YByWp3XDKkxsWv1MCyDoX4emLhcjXu+fDJsX24AhCTREUWm24XYcsTpvJu94cKkNn13BnRmpPKw49B0FrUdBDYWPlrGmiQy1x2oOJswH2i0ZzBYqoB4Cz1NbnaxGqikm48GEiOcUNxtguZuhqrisQ6ZIrXJW6qQ6NcyMxvcttbj3hxoorz1qNeTToThQ/imwyYYtBFtDLRsV96L8KmQjcWwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maNoeUtW3RYnVWsbwyExooIx5WnEw8s/I201rR4MjfU=;
 b=AE5zpRXXk9FBvHT/apIG6k+/V/IavYkitTvZIXF5Xw7C9JfWAXtUtm2w7k16NZsB042rLHDdrF2/16G712OwSex24euHT/R1Nv40Zi5sziqVVeQVo4zSF+YLr5dWreT+Q/eg0sPtIHdLPNz/inerktGKBzsUNJqHM6A/DQBPLC2mwRLcnuc8fWvh+rVMRkcBu3KDzvgkLqBOHj/nwUM+7i+BXXL1yODOPug/OfnbEz87dmXpSU39j+P0XU1hZBR2F6QIOKkwm0Je1/HvDyDylS64Wr17m+tr1Et4A9pAInBxWHaPvUErwfT7NaixwMs8QDsnE45ospgt3nxPG2Yz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 15 Jul
 2025 21:42:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 21:42:20 +0000
Date: Tue, 15 Jul 2025 14:44:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Message-ID: <aHbLpWs+xQT68C43@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-6-matthew.brost@intel.com>
 <f70aa0a14c0a4c0e3fdc1570f42ca804705191c4.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f70aa0a14c0a4c0e3fdc1570f42ca804705191c4.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b14d62-b4c0-451c-0b0a-08ddc3e87a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9girvNWBEVJFj2mpG6Q2/su+jo7yEjyh8iCRWjrEgZtp5yvAhz140oczaa?=
 =?iso-8859-1?Q?aceHf9HFqGnAzZaDnOyd52iBJi3xj+xY62iFWlfQG9nYLy9KwaCK28zUAK?=
 =?iso-8859-1?Q?0ayfMjRPEOJmCxS3aJH8WiIViqVqU9xxpynO0PE9PYJV680+YPY9XSJR98?=
 =?iso-8859-1?Q?KqcfDZJPoMkzqp4VnVgyUoYFf9IaifXzQqB1PjRrE/8Q47eDS5n4IKRJF5?=
 =?iso-8859-1?Q?xUyQaCHq5NDOMWKxnZw726JSUkNwf4dcqJzfWI0HCo3lYUVyi+d97jFxAS?=
 =?iso-8859-1?Q?i4HkbFSRjyWHSZRcs5banKSuU8rwDN/Sqtxw6tpsX2zQe/OZ+KgaR1pwYW?=
 =?iso-8859-1?Q?3uTS+E4Ta7jhROBiSq2I6MhfCTGDFoB7wZLRDBkmWSfM5U/Gu4iv8VJz0D?=
 =?iso-8859-1?Q?iOqvaNadJofnodeWzNkOeMsaV82tvpRUPWFh+KksRJTmRJHnno4wbMto00?=
 =?iso-8859-1?Q?i6TrGcZBd81IKm+nzlNnPXR2LBh6txc5WlWlUmKJO4ciPOrV3tvDKfV0fb?=
 =?iso-8859-1?Q?BcjHXwyc+vyrcfz6u/hkLk7SUKKsbnpwFHHj4mADdqy3bpqMy1SUHZpu05?=
 =?iso-8859-1?Q?ZUVq+SBXYrUtBTnTb5PDRDqIxwCkmSYD3d4ZiRP1/NzdTQSIE1Tcrrh1CP?=
 =?iso-8859-1?Q?p7Cn/0hCjyW3vM5BmsauPEEMnCDgaoRzGklghGQfNbx5B/oZ+b6flwUqdW?=
 =?iso-8859-1?Q?5in+KIWCGz+bcXOlyUa7HUS1eyMlE1nG7XbSjpwSt7UJEvkzBIOVMo7uhE?=
 =?iso-8859-1?Q?F3wWs5H26DpE6rDRlIHGO46EfHo23WDynr2cqL40A4KuYl252gEEksXu74?=
 =?iso-8859-1?Q?awouscSIY+hjJRrTBhCYrXyXDXjtF0W46xRT9jz591fXlKVzC1LaXxk05b?=
 =?iso-8859-1?Q?Qt6AqmKw4phHUf24XSPHgQjSQcHNoxs58qnTu++UsxWapvO1bPwYSYCoUI?=
 =?iso-8859-1?Q?4GsPnGHosuJu+aZQ+VsZcxmGvWc4d0jc7WKUay+GVIpB78NdLdZDcZouU1?=
 =?iso-8859-1?Q?neJGhv130TKiY1ak1kMZ3DwTkFD2204EmZ228xWc6zHs3TZ4w8ohefACUq?=
 =?iso-8859-1?Q?DZ3n9N+sje9L0OjQSNxWy7ZgyuHiJkNqZBgW09fYumffEqc5+AwoPWJOih?=
 =?iso-8859-1?Q?iqk2y77vco6vd7ex5cBSVFtKNLQDf8ZXZxMzv7b65mrNPzrHrbJlS8YMvQ?=
 =?iso-8859-1?Q?WUbl+IpqcIJB8hLBNn+NhsFiqnQnfnk0nWK7M5IGuXdHkO2TV4fU6lojeZ?=
 =?iso-8859-1?Q?QRWEwnxXWErGuQWQcHKgO3r3b7CCHopVhZSBcRXGIKfvBSHajwA/21m1Oc?=
 =?iso-8859-1?Q?9cfqcYQhTZVGfY3KfE/f0QWdoBntLFEpFIYILxlvfFuCwlLUdi0BNeJNaf?=
 =?iso-8859-1?Q?zqzfJmEX4bBIVIfYY4G7nya5A5tEa0JIFqZay0rflKJjUmiQ2vFLgMZCvP?=
 =?iso-8859-1?Q?VBFTOUOlzJqnPExYenvnlDENhR++uNMdsVDw4QVc31bpMpJh2X9U/Ui/E2?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uKBmMCnbc1QVuy4vy56mbs2HPCLo7vkLBDDGm3a3XdzWNjR/tm40dZ12aj?=
 =?iso-8859-1?Q?j069uSZuXZubb6MHnR2U56Icykj58q+ZpDMjnZneFO8gOw7UuF5nPDyNZI?=
 =?iso-8859-1?Q?5wyG9DE8vGhHtzmivOPMvP4TPX2+yZYnmB7Dwitl9SBK0EeE5udRxupvjA?=
 =?iso-8859-1?Q?Jf0pFx7P48vTSqiVPG3tHjT8G/GRu1NzJ+Cd+jVZk5XcXC1rQf+n2YGPHx?=
 =?iso-8859-1?Q?EkkCGFaPt/4XaBxwJLp8aJ57fIgQrV1BE6CYaPpht9l/bpS6H358khQZPx?=
 =?iso-8859-1?Q?5k2s/pUgrsW4WDCXPBnNqAKMIecxP/EkIXylawCe6FSRHzBkwSklF3y1k3?=
 =?iso-8859-1?Q?eo4P4UmrELDkyh5sPQ98Z7mj/YqqkhleeSutjyatqEO2FT+MjeQmhGolnP?=
 =?iso-8859-1?Q?eUbjZzDPDBA91CH6cFUbwR4BO+NPqgHaksyktbAQCkq7w6bI51lL6BBX8y?=
 =?iso-8859-1?Q?blmNNZlKsQ1C0uUjHZMqXyWujCsdJv2tH86rIfzCqfMqmuNHAdyZX1toO4?=
 =?iso-8859-1?Q?Rvrq+iw4L+xL11EcTjbowMkymJudi8A/iR+bWKc8uoUf6r3idNIN/nEvq9?=
 =?iso-8859-1?Q?WrhtvnX3T0F7z0I6+3TvuwvonL8c0aCEe2pO7MMe07x2CQbKrSPrikXtUC?=
 =?iso-8859-1?Q?UV5cN408TXOR148CSmN8kkpVvg4Go9DqxY04yjOj8711T8XU5w5pAlUQ1T?=
 =?iso-8859-1?Q?cn7D2cx9j20aWcCmRhmX1Z0Djoo6gg5jo7q8FaiQdYrWGz7sfkIlJGBaV+?=
 =?iso-8859-1?Q?1g1dUKZQukgZd85Xphx+ZoFNHQV23IBnD4qssmuMqZulf3AhPKgh3icwhb?=
 =?iso-8859-1?Q?YzQI4y1ruUUQeDsr3iAJJlqFWnNYE3eF9iF8vjJa5445FOFz9zp+oQxaW3?=
 =?iso-8859-1?Q?2wD3mMT7u7Ujdur2gU1rGPvnNVfMy5oZt5m7FA+qL3yUrQPfTEPUd649b6?=
 =?iso-8859-1?Q?6qN6SvwT93GlAG5b1o70eXCOWU6VasTeKXZulxSi6pq1H5FPao1M3/D4A4?=
 =?iso-8859-1?Q?vXNEbtZLxpWu5sAbcQ7CaBWdKPbVAYSroepgybvIUiwNN46K//t1gICIUS?=
 =?iso-8859-1?Q?0v8P0VMBPG2e322I0N/S6hzh5eHVzQVwA79jVKUgsWcwkX7BSi0KDvyqn+?=
 =?iso-8859-1?Q?YkCLm8Qwp2L1IHNIzVp6MumGEq4NXx06eL9AxtYnAMGluFFOS1++WX4Us7?=
 =?iso-8859-1?Q?zwMOSu7NWKDxQxezuyF7Ab5YZ37hMi9DjpIKBdqv1lKwJlJWSckygwAmWQ?=
 =?iso-8859-1?Q?SbuTJaLtp5TxU67cCLOgTTd28rzrvYjOJSri8z+J+hVjT/1PuPnOzlxA+n?=
 =?iso-8859-1?Q?EsFfgB705s8vXgmRdWbtfU42OuCIDblRCy8O7IhvU/JcFOQJ6v4rVHEk6U?=
 =?iso-8859-1?Q?qyp9a2upZhXLmvbuOrW/l6ky994Mxe/fPCObNmDWkfv/OO7DiHln5wPdi5?=
 =?iso-8859-1?Q?5Ec5EFRcqply0mjbiW8eRYdn4HDaG7+lLnvP/Lbk6sDxPZH1siQKWGvsLI?=
 =?iso-8859-1?Q?zfyDHB587JeBiCTCjzetWoP9pm68dJ9vpjk6edq/l9X4BhpR1L1TjUzcFg?=
 =?iso-8859-1?Q?AvvOcFFDNeLg4MtaRsHAtAwRbN7e1QtLdzHNqcCZ6EvzuJ8jNzsZrlcbvl?=
 =?iso-8859-1?Q?vTQutoEfijZiTEtw+mEHu/Ljh6jrB1Tbe11YmADO/OKcOMiOnkgIwTPA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b14d62-b4c0-451c-0b0a-08ddc3e87a03
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:42:20.6348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOADGbEUrPyoECJIPaGqnO9RWG3LEe+rpd2xezNCIE13s5Xd07GF2Rtgn0v8hh+5bza6mGLdpStEy+jDQ5hySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
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

On Tue, Jul 15, 2025 at 03:34:29PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > Add a generic dependency scheduler for GT TLB invalidations, used to
> > schedule jobs that issue GT TLB invalidations to bind queues.
> > 
> > v2:
> >  - Use shared GT TLB invalidation queue for dep scheduler
> >  - Break allocation of dep scheduler into its own function
> >  - Add define for max number tlb invalidations
> >  - Skip media if not present
> > 
> > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c       | 48
> > ++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 13 +++++++
> >  2 files changed, 61 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index fee22358cc09..7aaf669cf5fc 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -12,6 +12,7 @@
> >  #include <drm/drm_file.h>
> >  #include <uapi/drm/xe_drm.h>
> >  
> > +#include "xe_dep_scheduler.h"
> >  #include "xe_device.h"
> >  #include "xe_gt.h"
> >  #include "xe_hw_engine_class_sysfs.h"
> > @@ -39,6 +40,12 @@ static int exec_queue_user_extensions(struct
> > xe_device *xe, struct xe_exec_queue
> >  
> >  static void __xe_exec_queue_free(struct xe_exec_queue *q)
> >  {
> > +       int i;
> > +
> > +       for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i)
> > +               if (q->tlb_inval[i].dep_scheduler)
> > +                       xe_dep_scheduler_fini(q-
> > >tlb_inval[i].dep_scheduler);
> > +
> >         if (xe_exec_queue_uses_pxp(q))
> >                 xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
> >         if (q->vm)
> > @@ -50,6 +57,39 @@ static void __xe_exec_queue_free(struct
> > xe_exec_queue *q)
> >         kfree(q);
> >  }
> >  
> > +static int alloc_dep_schedulers(struct xe_device *xe, struct
> > xe_exec_queue *q)
> > +{
> > +       struct xe_tile *tile = gt_to_tile(q->gt);
> > +       int i;
> > +
> > +       for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i) {
> > +               struct xe_dep_scheduler *dep_scheduler;
> > +               struct xe_gt *gt;
> > +               struct workqueue_struct *wq;
> > +
> > +               if (i == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
> > +                       gt = tile->primary_gt;
> > +               else
> > +                       gt = tile->media_gt;
> > +
> > +               if (!gt)
> > +                       continue;
> > +
> > +               wq = gt->tlb_invalidation.job_wq;
> > +
> > +#define MAX_TLB_INVAL_JOBS     16      /* Picking a reasonable value
> > */
> 
> So if we exceed tihs number, that means we won't get an invalidation of
> that range before a context switch to a new queue?
> 
> > +               dep_scheduler = xe_dep_scheduler_create(xe, wq, q-
> > >name,
> > +                                                       MAX_TLB_INVAL
> > _JOBS);
> > +               if (IS_ERR(dep_scheduler))
> > +                       return PTR_ERR(dep_scheduler);
> > +
> > +               q->tlb_inval[i].dep_scheduler = dep_scheduler;
> > +       }
> > +#undef MAX_TLB_INVAL_JOBS
> > +
> > +       return 0;
> > +}
> > +
> >  static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device
> > *xe,
> >                                                    struct xe_vm *vm,
> >                                                    u32 logical_mask,
> > @@ -94,6 +134,14 @@ static struct xe_exec_queue
> > *__xe_exec_queue_alloc(struct xe_device *xe,
> >         else
> >                 q->sched_props.priority =
> > XE_EXEC_QUEUE_PRIORITY_NORMAL;
> 
> We want these to be high priority right? I.e. if another user creates a
> queue and submits at high priority can we get stale data on those
> executions if this one is blocked behind that high priority one?

I'm struggling with exactly what you are asking here.

The q->sched_props.priority is priority of exec queue being created
and is existing code. In the case of bind queues (i.e., ones that
call alloc_dep_schedulers) this maps to priority of the GuC context
which runs bind jobs on a hardware copy engine. 

dep_schedulers do not have priority, at least that is used in any way.
This is just software queue which runs TLB invalidations once the bind
jobs complete.

wrt high priority passing lower priority ones, that isn't possible if
there is a dependency chain. The driver holds any jobs in the KMD until
all dependecies are resolved - high priority queues just get serviced by
the GuC over low priority queues if both queues have runnable jobs.

TL;DR nothing is patch changes anything wrt to priorities.

Matt

> 
> Thanks,
> Stuart
> 
> >  
> > +       if (q->flags & (EXEC_QUEUE_FLAG_MIGRATE |
> > EXEC_QUEUE_FLAG_VM)) {
> > +               err = alloc_dep_schedulers(xe, q);
> > +               if (err) {
> > +                       __xe_exec_queue_free(q);
> > +                       return ERR_PTR(err);
> > +               }
> > +       }
> > +
> >         if (vm)
> >                 q->vm = xe_vm_get(vm);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index abdf4a57e6e2..ba443a497b38 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -134,6 +134,19 @@ struct xe_exec_queue {
> >                 struct list_head link;
> >         } lr;
> >  
> > +#define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT     0
> > +#define XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT       1
> > +#define
> > XE_EXEC_QUEUE_TLB_INVAL_COUNT          (XE_EXEC_QUEUE_TLB_INVAL_MEDIA
> > _GT  + 1)
> > +
> > +       /** @tlb_inval: TLB invalidations exec queue state */
> > +       struct {
> > +               /**
> > +                * @tlb_inval.dep_scheduler: The TLB invalidation
> > +                * dependency scheduler
> > +                */
> > +               struct xe_dep_scheduler *dep_scheduler;
> > +       } tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
> > +
> >         /** @pxp: PXP info tracking */
> >         struct {
> >                 /** @pxp.type: PXP session type used by this queue */
> 
