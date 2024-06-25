Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CA6C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F4B10E1DC;
	Tue, 25 Jun 2024 21:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpsbrKrh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDBA10E1DC
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 21:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719350884; x=1750886884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=auFJZE9f0/hybmUSxr+CMBOX6XVg5bnj8WAgvs111bI=;
 b=gpsbrKrhRPiNvZfJ1Oqqhk1gJwVaGI6n5iHWk4hsTS1oTrAh+c6eJmiz
 Du5YkJz4Kv/2kLt0iOOUm2d+01GUzXzMjE6+o0zhRp2TsFBV0fOhJs0Vy
 c9yvBwX2s29a5DzpxSIUMjETSoz8YD/Iwgib34D3fV5x+fJ+3cwwfrSzP
 A09g6Ozm4C5nFiJUyfV1tWNDPB46S/iz2SmOFXWzwjIZhDzwZgDZd3JIy
 Hz0bQbf4QfDp2JF8jrl/AwK0zjVMVIuFaIyHVeNn/60XDqkIlh2/iM6uv
 wyvrcmm+fWwEdt5Tx0GAb+xTxp9I7h7wAc3AkLZLZ/Rp/u7fK1IS7WzE7 A==;
X-CSE-ConnectionGUID: lIgc0stETt+/K178Le1EaA==
X-CSE-MsgGUID: YTEpW+vMTxeeFBDwH4UUdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33930433"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="33930433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 14:28:02 -0700
X-CSE-ConnectionGUID: 3xcR57NCS7yY6ItsOMD3xw==
X-CSE-MsgGUID: 38kAu1UVR/OanvbU+QDewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="43592202"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 14:27:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:27:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 14:27:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 14:27:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ls0KFerBlQlbhG3jL20R33E//QUwgHeLI9YGeCLp8hBCtiwjJj2smT+B9al67BHBITIs+N40UWljv8bm0GqQY6jWFRDJiBOMgdI1+Fdkf0WdBSuinj+6WapgkVKhgR1dejt0ysKX6AEKSWmwIWrM2wcsET8FBSypilmXu3QqJJmfd6Ydsvvhju75sE1MbmpWZAB5XLqbqXRNrGpls0BXUJ/C5N0X4poqqL7Th8hJMbJDK3F5nihxrWDbwGPf+Gg2CYn2hv5x8L0MeatKciLVuPvgaCS5fyxB5rIl/GmmMI/3dMtw4h9txOJGwHHqCU14p76Q9wikbpk1HP9K0O048g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzomNwKQS1Qh6rEmFB49oCC9Nfrr/G2h9scBKLT1mmM=;
 b=fWbo+Yudzau+ouJ/7fpOJL2hk4mJ2KNjqyIhv49X71ymXZC6PV2UT9FZ3axZsHw6OiGEHEBry9vpbbiNh4Ixyi/Jup0F72gsaBNY3YAzlAgQfpyupAqdaGd7pB2N4ucOBr/2RlTraxzeGgf+CGtDyuoM7+8EPTU3aIJ8+wTeJUphcIpFenQUFyYqJAKqtG/Sa25DUXTlHuj4EApEv9TvzBbNWpPU+ZJMYaTOEi4V6UvvhYXfjMKUq/vUwl6zRgzlpYSsxqSd2n7wugJzT92lrK2RV/Vcf1XNBp+abf97GVxOVYcLjP0XX+yR1cUaKbn0MJ17jdMaxs7Y2ZIiIpnVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 21:27:38 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:27:38 +0000
Date: Tue, 25 Jun 2024 17:27:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe/oa: Fix kernel doc warnings in xe_drm.h
Message-ID: <Zns2OqKffC-6Ua1y@intel.com>
References: <20240623203119.3840283-1-ashutosh.dixit@intel.com>
 <9de03fae-edce-41c6-8b1f-421c83d6c23a@intel.com>
 <851q4mqf98.wl-ashutosh.dixit@intel.com>
 <91631dc09610974b9ca5aa1756ee72c258c09dd4.camel@intel.com>
 <87tthixfif.wl-ashutosh.dixit@intel.com>
 <87msn9gco6.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87msn9gco6.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::9) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 2386bc14-24df-423e-03fe-08dc955d9c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k/pgXpKynpfiGeTbMf0Tg3L4KydceT4/lRcESwcokAvz2AdNV1DHBoFnoYcg?=
 =?us-ascii?Q?SL1Gdo/KM2DeehCHB7WCviBfDhNMYm2kQwt432AM1DH1XkvnJaSNAFaPAqk3?=
 =?us-ascii?Q?r7xvxod4cojImgdg2rsa6WfDKOnUnlRSAqsnEbTMiltfKpCZVGg3V1n5HfOC?=
 =?us-ascii?Q?xIXbn+vGU0ryo8Vz439UYuxUbGavjkzi8TJYlud/tKIrWUCi8YB8265fQUhv?=
 =?us-ascii?Q?GUmT4EoI6hOuetI5tmy9MR2iZU/AH2gYmZsYNpCJrPrQYyn1tUjZiLSF6cu9?=
 =?us-ascii?Q?sLTsvt4Ba842xRRhVftjJzDQdIKJvTspd7IRjmxM4c9iBIRYsv3I1wQdhoZH?=
 =?us-ascii?Q?PNkHQs7FgZ+JaZ2BYDiSUeH3wuT88JvxTzD5PzYXMXlLHwO+KZFH4P1wxYzq?=
 =?us-ascii?Q?lfqoqLfjmXlJ8tlvPXswu+x2uhIah+P74KHe+CZAKsyvF4snl8PXrPA6qKks?=
 =?us-ascii?Q?jKmM7VR1rdZG4rUo+Nl1xsBJGn25gbWpHfUzY9CjKX8mlM5r77jiv+GeGRgC?=
 =?us-ascii?Q?EaFRY5vh+XtGTxEVDJ0fxsi9xmtl+TQhnDSuHYiVs/cvGGQquBUgRrSkDDG2?=
 =?us-ascii?Q?/sEjVwfco51hJ3+YABxUoWlZ/DwxgwrOlvSIRALuZi6subUGcR9oNu+gexwo?=
 =?us-ascii?Q?v2acJtca4n3btGgjX/szVI6LpJ7KUHwtkFu5IncVL8TxOeH0YXihRqhZpfff?=
 =?us-ascii?Q?7t9zz+tbF0Bt8UwScxUuf4LZ8N8beugJH9NXQWiCBxxHV+O5PX06IvTj0hPC?=
 =?us-ascii?Q?1A/+LsrczmpaRf/ClwWerJf6xJE3ggidh8jfxxnkBshwsM28YhT69K6DFW80?=
 =?us-ascii?Q?rqehFtObgnf+lpSchDI89fFVs5YRaA3O/gXGTWwPy2vCtGnKtpGvPm+pq3Jg?=
 =?us-ascii?Q?gLMIOAMl23ktQrzt0FDAId+MHrMUV1id993hB0XqCjsYRp4qP/8KBypNSbi/?=
 =?us-ascii?Q?b4HiDIlsanSR50rucdhvu7jktVJgJCew1bC7EPbq3l4g3Olsr3TwwZpH5aew?=
 =?us-ascii?Q?uKP7YKAIEFPvybh5FrXRaCPctiuxEnWzMqtqAisM9vwtoBLEo3hmQ73EL7pr?=
 =?us-ascii?Q?QGsCCu8/BD/t8Ur6SHrtsb5CvKkzNkNaZT2V5JW8xW1rBIqsOlRjmgilh6Ug?=
 =?us-ascii?Q?LcivhLKWP26ptXLiKSCmPkwjaoomdKMBTIBnkBmityEOBzRFH/Rws04F10Hj?=
 =?us-ascii?Q?JtwCTLxrWjyd11Bojzyf/2buTvsqpg6mfYuTWJXdA4Jy9rVDssfiV+V0ifmY?=
 =?us-ascii?Q?j2T1e2DJCQp7CpfhXhxCN3PVyfmbjEl3iVw20hZPdYSHYRLn/8Yaj18iSuI2?=
 =?us-ascii?Q?gckHW9B/aKdYNEYn4ascblFdHPR5ICRfR2qF/oQXs6fWSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n4SgHuATmq3HOdRs+RKuZ+aAWCl7Nk8qX0yZ1x9vZe0J7oZtI0zjCO1hHkcX?=
 =?us-ascii?Q?YL57F/AzcrSmmiYst4tmDvppZeLcgNaFlw8+mzDXs5L2tEpKu0dln7tygB0k?=
 =?us-ascii?Q?KXj7/m23Zi76PtOlb5K14UhgQpGiiGo78wHswMNCZax3b5PWhFKqrANbCvg7?=
 =?us-ascii?Q?lWfhHidb1PTMlqycPHg9IOSIb3DLEIUEF7ubRzCRf5iovPO2ZEJFV8Wy23/S?=
 =?us-ascii?Q?G9xNP2T+WcJ2MABxPUx0mMKGkbHoykWSbjhD5b63X1+gN3DTnu1CI3rj2A/v?=
 =?us-ascii?Q?Bbj1fYowtjRWYR4wPD+rcHjmmM/VBSGDUxCYW0LQBFOoBbUUOnuXSkxHNBZ9?=
 =?us-ascii?Q?YH6aUtVrsTWdgW0gnwGkwbmF2dhgxSi2acS/FgnPq6v1LoQDZQxTY76HBjQT?=
 =?us-ascii?Q?ZgGr5j5pV5L3MpPUZixd+9qg+CyNsHPfObg3Ku6BCAW0A/aXcICBF+q2gKez?=
 =?us-ascii?Q?Kn+K2JMvv4ofASPgGWLcvUiXlIZtYwyyERU1MMweOtqt2VpNXxviw/GhHBR2?=
 =?us-ascii?Q?cmUknzvJtV6XPmfCVB9Og62BsxDGWYNMgY7zex2Fi6ReFWGs/ZqQnrNyNs2q?=
 =?us-ascii?Q?ImZQ8v+h+L1elpp13VzpKEbr7EvBXzHM5iacz7s8Woxrs32Vxvui5q9v9Isq?=
 =?us-ascii?Q?pgrF3MAyDzo3lpIk8gxchWPEJbtS9FYZyd2DZvJUNFzo6Hlv9Pvy9wDSJlwQ?=
 =?us-ascii?Q?5ZtyJGHu0W2FPq4sOJfH7FO0vo3LZQ3g0Jdu+wZeDlB8Nt9EqZZYaDZUORib?=
 =?us-ascii?Q?DIKWIFZtuJt45iS5BErHVLLM1fa6OveaHoTex9thXe+IIZGAFFD2VUnS05UO?=
 =?us-ascii?Q?6d0Yug+mlXXieZPa9GWrYvOJYVpS6F9hKDcpceBeHUhPLCY5DPJbivuEa7My?=
 =?us-ascii?Q?lgY4NlKOWFOqanjZZ1sa12oo/zJ2CrwYXNv4arI58vjMLB42/PCWh4iqgyoW?=
 =?us-ascii?Q?0utY/FsG1uQoLKLB6urC2l/cSccSLBlnL0/60o2qjVFLT4RsSNDRv/rbR6hD?=
 =?us-ascii?Q?M8CrpBkTBm+ROHZ0FKHMO/0LIfTe9b5WXVFTGmRn9yaJG1VFYDGL/IHSUr8V?=
 =?us-ascii?Q?dsN17A+qexyfMNoYs3+uGfaOGlwu/Qtc8k6Ip7oTUCG5uCZGOGApzKlYD0KM?=
 =?us-ascii?Q?OgvuDvZ1ArWGuKAJL6hIyjU6btTfRYdzUioO/MYP5+pgWm25rqZ6LAiOY0Dd?=
 =?us-ascii?Q?r4m4HKbiVQMOdLM7hld17aiI9Py9v00EwNioGLSUzcbfJxZhoFmpdoH8sGhM?=
 =?us-ascii?Q?0g56coX9FQzYnJvjlF45QbzgG7D+ufBmoQK9vk6r0ZVYNaohjVHO3YFvUivV?=
 =?us-ascii?Q?sH4pcm9zswxPTXkuT4ctgghXlOtq5ZmafpuoegyqeI6ovrJNM84iQoxNTQJd?=
 =?us-ascii?Q?MQQ4rEZGou/M/0QJsJal9bUIkwVUKysxXEU3huhqVBf5wwz1vBz6O+VC1WU0?=
 =?us-ascii?Q?ptJTdh3EYUg1RgaFJmApqWeFXbxGgqpQ0kzbW5eVrZJfMdxV7TZeCO5FvKkJ?=
 =?us-ascii?Q?8yKyblzFZuENpKLiAGMNy+0c/BucKzT3IEMfhS4U4GZFnBXVExAOQ13bNJaI?=
 =?us-ascii?Q?q+Ib1wQFKHumiUrZ2QmSueamXqsaMt/Q92Ry9RLf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2386bc14-24df-423e-03fe-08dc955d9c40
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:27:38.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tI76JqYR52nt/iD5EjQGPGGOcIFNOzcihWdXxK/VYhkpTAg3kJZqEBup6/xfRhNSciPRyns7NNBvkSoMO+S12g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

On Tue, Jun 25, 2024 at 10:22:33AM -0700, Dixit, Ashutosh wrote:
> On Mon, 24 Jun 2024 13:16:56 -0700, Dixit, Ashutosh wrote:
> >
> > On Mon, 24 Jun 2024 13:18:20 -0700, Souza, Jose wrote:
> > >
> > > On Mon, 2024-06-24 at 13:04 -0700, Dixit, Ashutosh wrote:
> > > > On Mon, 24 Jun 2024 05:30:37 -0700, Michal Wajdeczko wrote:
> > > > >
> > > >
> > > > Hi Michal,
> > > >
> > > > And Cc: Jose below.
> > > >
> > > > >
> > > > >
> > > > > On 23.06.2024 22:31, Ashutosh Dixit wrote:
> > > > > > Fix kernel doc warnings in xe_drm.h. Also eliminate private/non-abi enum
> > > > > > definitions.
> > > > > >
> > > > > > v2: Remove __DRM_XE_PERF_TYPE_MAX since it is unused (Michal)
> > > > > > v3: Also remove DRM_XE_OA_PROPERTY_MAX since it can also be eliminated (Michal)
> > > > > >
> > > > > > Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > >
> > > > > some nits below, but in general LGTM, so
> > > > >
> > > > > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > >
> > > > Thanks.
> > > >
> > > > >
> > > > > and I'm assuming it's not too late for such uabi fixups, but better to
> > > > > wait for ack from Rodrigo
> > > >
> > > > Copying Jose: in case Mesa were using DRM_XE_OA_PROPERTY_MAX, they can
> > > > probably also use a value like 16 like we've done below in Xe (I will make
> > > > this change in IGT). Mesa PR is not merged yet so should be ok I think, but
> > > > they will need to make a tiny change. I am assuming as long as this all
> > > > gets into 6.11 it should be ok.
> > > >
> > > > Jose please confirm this is ok. Thanks.
> > >
> > > Mesa is not using and even if were we can change it until it gets
> > > merged(after KMD patches reaches drm-next).
> >
> > OK, thanks for the confirmation Jose.
> 
> Thanks everyone, I went ahead and merged this so that it gets into 6.11.

I'm sorry for getting to late on this. Next time, please ensure that the
subject tag is drm/xe/uapi: for anything touching uapi headers.
Could even be drm/xe/uapi/oa: if needed to specify oa, but the 'uapi'
is more useful on the history.

> 
> Thanks.
> --
> Ashutosh
> 
> 
> >
> > >
> > > While at it, do we have any UMD using drm_xe_query_oa_units?  Because
> > > Mesa don't use it, so I think it should be removed until a UMD makes use
> > > of it.  So drm_xe_query_oa_units and related UAPIs could be removed.
> >
> > Actually we do use drm_xe_query_oa_units in gpuvis (actually
> > tools/xe-perf/xe_perf_recorder.c in IGT, which is used for gpuvis OA
> > recordings, see assign_oa_unit()).
> >
> > drm_xe_query_oa_units is needed because it defines the mapping between an
> > OA unit and the hardware engines connected to that OA unit. Otherwise
> > userspace has no way of knowing that information.
> >
> > In case of RCS, mostly you can assume that RCS is connected to OA unit
> > 0. But for CCS etc. we need the query to correctly determine which OA unit
> > that engine is connected to.
> >
> > Thanks.
> > --
> > Ashutosh
> >
> >
> > >
> > > >
> > > > >
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_oa.c | 3 ++-
> > > > > >  include/uapi/drm/xe_drm.h  | 5 +----
> > > > > >  2 files changed, 3 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > > > > > index 4168b51cf7b5..9263ae9a864e 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_oa.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > > > > > @@ -1684,6 +1684,7 @@ static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] = {
> > > > > >		[DRM_XE_OA_EXTENSION_SET_PROPERTY] = xe_oa_user_ext_set_property,
> > > > > >  };
> > > > > >
> > > > > > +#define MAX_USER_EXTENSIONS	16
> > > > >
> > > > > nit: maybe it's worth to put small comment saying this is our choice to
> > > > > limit number of nested user extensions we want to support (or at least
> > > > > this is how I understood this)
> > > > >
> > > > > nit: and this doesn't really look like OA specific limitation, so maybe
> > > > > it's time to promote MAX_USER_EXTENSIONS to some shared location to make
> > > > > it unified across driver
> > > >
> > > > xe_exec_queue.c also uses a similar mechanism. But I think better to leave
> > > > them separate in different modules so that each module can tweak the value
> > > > to what is best for that module.
> > > >
> > > > Thanks.
> > > > --
> > > > Ashutosh
> > > >
> > > >
> > > > >
> > > > > >  static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number,
> > > > > >					 struct xe_oa_open_param *param)
> > > > > >  {
> > > > > > @@ -1692,7 +1693,7 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
> > > > > >		int err;
> > > > > >		u32 idx;
> > > > > >
> > > > > > -	if (XE_IOCTL_DBG(oa->xe, ext_number >= DRM_XE_OA_PROPERTY_MAX))
> > > > > > +	if (XE_IOCTL_DBG(oa->xe, ext_number >= MAX_USER_EXTENSIONS))
> > > > > >			return -E2BIG;
> > > > > >
> > > > > >		err = __copy_from_user(&ext, address, sizeof(ext));
> > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > > index 93e00be44b2d..b410553faa9b 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -1379,8 +1379,8 @@ struct drm_xe_wait_user_fence {
> > > > > >   * enum drm_xe_perf_type - Perf stream types
> > > > > >   */
> > > > > >  enum drm_xe_perf_type {
> > > > > > +	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
> > > > > >		DRM_XE_PERF_TYPE_OA,
> > > > > > -	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
> > > > > >  };
> > > > > >
> > > > > >  /**
> > > > > > @@ -1611,9 +1611,6 @@ enum drm_xe_oa_property_id {
> > > > > >		 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
> > > > > >		 */
> > > > > >		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
> > > > > > -
> > > > > > -	/** @DRM_XE_OA_PROPERTY_MAX: non-ABI */
> > > > > > -	DRM_XE_OA_PROPERTY_MAX
> > > > > >  };
> > > > > >
> > > > > >  /**
> > >
