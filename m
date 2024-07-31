Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52640C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 21:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2F810E1A3;
	Wed, 31 Jul 2024 21:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZk/P4zc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EDA10E1A3
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 21:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722461031; x=1753997031;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8BCBSVC24MnWmrPNTm32NTf0j991XegUHVeY1sM8HUo=;
 b=XZk/P4zcFAurBIB2pgkA01Dub6ZGCkoPcyuqsEzhwENzD4F7lSra9ge2
 PCVi3Vs5dnh3JSqVYmdNgd81BIhi+UOoei+1YUYeE4wULyC2ZFsGM+98d
 ERdJ/la3b7b9jMY2RM2x69gHklmyFMLAAscp71RzgCx1aC9xOl4rELKO1
 nvXdZyEJzEt6257gTrN/GlNLy5mKmCm9bD9Up08Vb7e0xqtD4UZTGlV3i
 SyUBzhajYNp2sg4TGj4sa7LSn3OG3XhkrWFTqmTM7Y0xqLECSYgNfbWrF
 KEGjH3fKkk9+6+E8DRu4MjCCqAwOorb7QM+mhJv+xQCd8/pUZmblJjMqp g==;
X-CSE-ConnectionGUID: KJARzqnQQ5CPfLS4Kucx+A==
X-CSE-MsgGUID: iVi1cDUhS7Gw7EWYfAU3rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31776569"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31776569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 14:23:51 -0700
X-CSE-ConnectionGUID: hwRwCJrXRO6Hi+KU5FeasA==
X-CSE-MsgGUID: YnfEZ+yBTr28YXvkxXWQbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54470571"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 14:23:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:23:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 14:23:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 14:23:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 14:23:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4NRrHSmTR5V86SEEb1kvxJ6u0aezJnc1KRvMoS8GBiNmD6IY67qbcu0rnFtEOJXoXEU2cOXI4KnfhXX6FmTey/UWTSWEvmT4ixYuGMDSRcbleIgKvR2XcZjOapXq7VQwmh1bxCxHo98opxBH85QwIcA6JbNFxEzx+me4DggY6thiSbTNfetiByqmDnCn7fC4/eU6G0rTEY0poF61oaZcHqsuNYi/e9tgyErMQGSKUYDWiDinD5uFlW+sjl2XMUpDcd7GjFFhtxKsIvplvDsjhylv7k4wYRDVYuReW5yxo3QBdJsZF36P03Wd15GQuJdb7gWRQHRZuWPmPuUdF6Hjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxDDGR0e3Z7Z9JzniACnGva9fWCOAz0gfiw3En3Dwec=;
 b=tLN0hNRIh+QJa+UXur/v9odLlKHtYs8Ht3pv2pXITx7m9vlai6H+wg6Er8wDCzToiUiJLX4+0PvTrA45CImXoIW7vcQ5+a4hSr4qiTPYNh3xMmRe9gpyCegNrFonDdB3JWgaOrtU5u6bG4U1GWyTZ6XoE3k+bHVblXuXOycd60XC8k6jYuQfWpVFmmkCmkpQUYij7nmilFB5Zlkffpa98NDxox6EtM9V8Se/m83sRgR0eMWV4g04XC6v7CPCBSqOyqn6gWwo5cRLnpN+8fFSxwAJ6nuGTjQxXwxd+5ixyUEr5GgylskbvYumCur8zZuqpFPHo5WaHcsu85B4oB5lfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6404.namprd11.prod.outlook.com (2603:10b6:510:1f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 21:23:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 21:23:45 +0000
Date: Wed, 31 Jul 2024 21:22:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Faster devcoredump
Message-ID: <ZqqrLOz074ABYyWz@DUT025-TGLU.fm.intel.com>
References: <20240726052101.2069493-1-matthew.brost@intel.com>
 <7783452aa26ca547e2ac80fca1ac752574c49f2d.camel@intel.com>
 <abcc60c6-acdc-45f2-8b30-fa30bfd19461@linux.intel.com>
 <ZqlsQEMZGhekGMGs@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZqlsQEMZGhekGMGs@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: ebfb10a1-f8d1-4806-246f-08dcb1a70f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RnZN4AxHiWX5BsVxfdAfYWycu9u+IfhtkF1O6B+ljiUbbIyGdxazi5CIR7qx?=
 =?us-ascii?Q?lqkAKtr6XLZXSPvXmQ2B0lSfFmtz0gZRclqOiExIgBPjyETxEOUCLhBtAwdD?=
 =?us-ascii?Q?XqXK8OlFroEdZDxdaUAQLVndgyC5RkAaQL4HoDW3qHLnNgRnakZJCyVwS5zU?=
 =?us-ascii?Q?i4FAWdQeZ6LKEekliSsnfotiGYIBU0d4D2ZY+J/XJIoAdmntwCM1OqvEixXt?=
 =?us-ascii?Q?pqmaPTZpHGqWbZlFQTc8eTI/jDW08bv3mfBxPUFuxA/NKqSW1QbShlebMN4C?=
 =?us-ascii?Q?XkWROQBigwUSQ2zdteYRE4VWNEDTO7nX3FcV6p2JUC4dMLggJ8unLkm8j1XK?=
 =?us-ascii?Q?bnR6gs283BVqmKE/FR1UDX4rq2jXMn1r4ed/UhV9R1fxYERt8jIMwBua4tqw?=
 =?us-ascii?Q?3YJ4pgbZ2emcN5zgR9oXlSHMelGFCChRtpZtoMUcpMmiI79ATgujVNJsSHUi?=
 =?us-ascii?Q?dMZAHIVS4vn3By6UFkMqciI4xVuzvCtmG5P9kfeySH+jYQK7Cq/F+tq0RoYm?=
 =?us-ascii?Q?9FIh/VQQ/8U96U8SH0v84tpteR31tZ5yrQkbeARq2vSq5tNAOOn33qz1TjDZ?=
 =?us-ascii?Q?4qQ0Q3XRFmJ4s3AWmSeYwCHSq+hOMvkY4XV9AGNS3LfCSpIGu7q73ezhFeBP?=
 =?us-ascii?Q?Z1CGBMvDOk7Dh1F0Osn8BkV4eioUUZAeEbEpWzvNlAU58h0f+4UsM0VvAk0T?=
 =?us-ascii?Q?vR6B81LC+YOAE1/KAMP+GVl4dZIAUaOWbFKA4IFFhz171qIv4QIMLArOiCCy?=
 =?us-ascii?Q?Zf6G07qq1wrXHzyop/ECswlMammJxIyeSjGquCea4uTf22t+4Fo5mkBu4SXh?=
 =?us-ascii?Q?4hXu0fBFoWWGzol7kPij+4VgCZLFKnXLo/Zs2t7spO3dbamsDsdv6VaB7/Py?=
 =?us-ascii?Q?BA9sq5Kb5JhWnS2S/Uo0sbpboL4Vp+BCNGMCgsnRC6plhFx+sn1sqP6H3Djh?=
 =?us-ascii?Q?RdAGncmzZUZ+um/QJjwwUsM9BTpXzSSBUFv2XtSi+cuQtNjNBg9E1MSyTEPJ?=
 =?us-ascii?Q?0+zTVvf5UbN5yvkHESwx4V1T882K+/puSSO11WBAGQ4oQfUHYOiYynzxFRYV?=
 =?us-ascii?Q?UCr+s7sMW+69ilEr4Yk4yMw8pTpgdfDmvOBePM4nW1N1BhgdQeMzMaGe3dzi?=
 =?us-ascii?Q?RTOJRam7dkuuAG+tbECpdChSvZtAEfPRgHUqWuPVE8HzdDh0k90vIEVaBDoR?=
 =?us-ascii?Q?JW7UuybzQKbmiPpZ0jO8js7jY601bzTvxxCNntL2m9KTPq5XI32Pox1JXupQ?=
 =?us-ascii?Q?3Eu8QULUa9tX7IC9L/nfVvRwj6asD/II6/7dJqjv6XzDaZ0xN1zaXasgrw/+?=
 =?us-ascii?Q?iJM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rc8kBhLVRsw6zVKSsj4l15vmhevtM29eZot2aS+RhJggMikSmp9ad1z2z+jT?=
 =?us-ascii?Q?8/WHXfRwNPFHRr8OQRpeqZ8GSdaAqPm03J12r1uLmw6YCkllBsoCVEWT6mpQ?=
 =?us-ascii?Q?jjWazqh3Ik6GNjrgB+4PhgX4SjcYjFJlJ4RS4fhtyDuyZnZWa/w3/giQ0IZT?=
 =?us-ascii?Q?Fm671BOwJgQpdL47u3VYSyd1Ot0Qea33m15D0FexUqWdIe/wBD7MqBEgldbH?=
 =?us-ascii?Q?hHnIHf9WCES6XPWdZaH4zCsCsNsIIVDJqqG9KoGJ3eRS/Em/gXpD6yRCqaIj?=
 =?us-ascii?Q?OKz+i+oS7bR5yx7kZ2f9DWvAYXOf7tFWBHQEC1/+0KYb/zvezOdf+q9fYH05?=
 =?us-ascii?Q?ZpVWEpz9KtTQA9QXf8oM2x16Fj2NbxBbpHn1rBzXgDUOXb27XmBH6dI2snGd?=
 =?us-ascii?Q?hYn5HKd4WQHNU4iw3//WcYRPAcZdpwIaCpMeb/tIVq3DJxCTd5mzJBNEWqdG?=
 =?us-ascii?Q?/UECgXlRjP5TLi+MCdsLzjjwpdu4iXCnKiST+TotjSqtagmZmNtDkL4IUJPJ?=
 =?us-ascii?Q?IW5DZB2kbG0JgzPYT+zCrG0EBtU8yHbu8dfZuWhkfRsu7J57nIqFBmNZK5Xe?=
 =?us-ascii?Q?BqcZJI2fLp7FV8R8TT9S4hptWyD9Q5fVH/a7D/PnCnK5Bv027030vckU+Kf2?=
 =?us-ascii?Q?VrsoC++dwDDlF1X71+3zOxZH6aFChD4nYoZP6Id7CaBRyJ+nOiHonA2lXr1l?=
 =?us-ascii?Q?vbjJNgwj79ZkN+uvvPLivX01rLBP0s+2bfYVsPhYuxZJIfkP3q/T0fNMlPOE?=
 =?us-ascii?Q?M1MxWqpW1zYZx2lAMUjzSfowVmk+mzyyF0u6l3CqiTUr2hnkG9sDi1sHfp8K?=
 =?us-ascii?Q?rOnnfKZWezeCfCG1Kg+ukvAZvZOMM98yrzr43XhRLGs8i/oCQPPzQkbtkMT5?=
 =?us-ascii?Q?JbKZXp83hGe0BQhenry1N7+vHOdQZH7fLeYmGYqwkb76pEtgL/0sgMtzV8Bd?=
 =?us-ascii?Q?uw18FuEIbCpLU2rcVj7vTg+IfCqg/LdqDQSFyQHixBo8/sl5RIgdpEnZMX+G?=
 =?us-ascii?Q?C7Eoq7mcHwqN0lBj4YLjutEZ635SidaM0YwqnAksyQ9fMscSLxuVLrlmSvNF?=
 =?us-ascii?Q?18al1JM5C1CiYc8WuoPnDzthOk/nKi5wdLPIDXHSC2RZpL+KbZku7thj+SGa?=
 =?us-ascii?Q?WXEfO+7/Kp2iNvdqX7dO48UzJmpk0Xx8aLSlfmumA5BgONvtrgef9hh7AURf?=
 =?us-ascii?Q?VYFogTgUzJDWRZxeUTa1+ioLngR6gGUtTN8P/XG4nIFPzAH6S9FMoggGy7ug?=
 =?us-ascii?Q?4cClpD8uvj//r7mpi/bY7UE6Itbb3ORgxSKPp8To5WJATElwCwv78iFJjr1o?=
 =?us-ascii?Q?eIIUaKS/IoYtNk53MkC7KzFRZYEftWxPLwjmBu2DOSMo+TUESzsE8sN0eIz2?=
 =?us-ascii?Q?LBZp59Txh8WadQwXxtRWxxItJD3fjCx32SataSdadbfZeIDCg24rOpVyQs2+?=
 =?us-ascii?Q?Fc7RwrupCBNQBBagQuplP6lv74Y60swuNRLilkF6sct4zt/DmYnK8kRlgJnn?=
 =?us-ascii?Q?CJDJ0DwcDjM+7odgLmZmYvAbSIAYx8gqIzS5FSysFG256paMTbV8bIgBgf5C?=
 =?us-ascii?Q?HFu+jFBRrbiRp/PFumfCrlVOV/AHY6//ulGg1ucJFmwiW7XMzPo+m7byzAXA?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfb10a1-f8d1-4806-246f-08dcb1a70f7e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 21:23:45.8536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+GA/U1cm9ndsSvZtO/BJBjsUhAwMOqGqOuZ7hPkV/sok1VLQSCY8EgbhKsyFV4umoK8xi6HH0CGDfxyXSdhRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6404
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

On Tue, Jul 30, 2024 at 10:42:08PM +0000, Matthew Brost wrote:
> On Mon, Jul 29, 2024 at 10:47:59AM +0200, Maarten Lankhorst wrote:
> > Hey,
> > 
> > I like speed, so great to have it fixed!
> > 
> 
> Yep. Uncover bug here exposed a pretty poor implementation...
> 
> > Den 2024-07-27 kl. 00:01, skrev Zanoni, Paulo R:
> > > On Thu, 2024-07-25 at 22:21 -0700, Matthew Brost wrote:
> > >> The current algorithm to read out devcoredump is O(N*N) where N is the
> > >> size of coredump due to usage of the drm_coredump_printer in
> > >> xe_devcoredump_read. Switch to a O(N) algorithm which prints the
> > >> devcoredump into a readable format in snapshot work and update
> > >> xe_devcoredump_read to memcpy from the readable format directly.
> > > 
> > > I just tested this:
> > > 
> > > root@martianriver:~# time cp /sys/class/drm/card0/device/devcoredump/data gpu-hang.data
> > > 
> > > real	0m0.313s
> > > user	0m0.008s
> > > sys	0m0.298s
> > > root@martianriver:~# ls -lh gpu-hang.data 
> > > -rw------- 1 root root 221M Jul 26 14:47 gpu-hang.data
> > > 
> > > Going from an estimated 221 minutes to 0.3 seconds, I'd say it's an improvement.
> > > 
> > >>
> > >> v2:
> > >>  - Fix double free on devcoredump removal (Testing)
> > >>  - Set read_data_size after snap work flush
> > >>  - Adjust remaining in iterator upon realloc (Testing)
> > >>  - Set read_data upon realloc (Testing)
> > >>
> > >> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > >> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
> > >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > >> ---
> > >>  drivers/gpu/drm/xe/xe_devcoredump.c       | 140 +++++++++++++++++-----
> > >>  drivers/gpu/drm/xe/xe_devcoredump.h       |  13 ++
> > >>  drivers/gpu/drm/xe/xe_devcoredump_types.h |   4 +
> > >>  drivers/gpu/drm/xe/xe_vm.c                |   9 +-
> > >>  drivers/gpu/drm/xe/xe_vm.h                |   4 +-
> > >>  5 files changed, 136 insertions(+), 34 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > >> index d8d8ca2c19d3..6af161250a9e 100644
> > >> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > >> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > >> @@ -66,22 +66,9 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> > >>  	return &q->gt->uc.guc;
> > >>  }
> > >>  
> > >> -static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> > >> +static void __xe_devcoredump_read(char *buffer, size_t count,
> > >> +				  struct xe_devcoredump *coredump)
> > >>  {
> > >> -	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> > >> -
> > >> -	/* keep going if fw fails as we still want to save the memory and SW data */
> > >> -	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> > >> -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> > >> -	xe_vm_snapshot_capture_delayed(ss->vm);
> > >> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> > >> -	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> > Should this put be conditional?
> > 
> > >> -}
> > >> -
> > >> -static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > >> -				   size_t count, void *data, size_t datalen)
> > >> -{
> > >> -	struct xe_devcoredump *coredump = data;
> > >>  	struct xe_device *xe;
> > >>  	struct xe_devcoredump_snapshot *ss;
> > >>  	struct drm_printer p;
> > >> @@ -89,18 +76,12 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > >>  	struct timespec64 ts;
> > >>  	int i;
> > >>  
> > >> -	if (!coredump)
> > >> -		return -ENODEV;
> > >> -
> > >>  	xe = coredump_to_xe(coredump);
> > >>  	ss = &coredump->snapshot;
> > >>  
> > >> -	/* Ensure delayed work is captured before continuing */
> > >> -	flush_work(&ss->work);
> > >> -
> > >>  	iter.data = buffer;
> > >>  	iter.offset = 0;
> > >> -	iter.start = offset;
> > >> +	iter.start = 0;
> > >>  	iter.remain = count;
> > >>  
> > >>  	p = drm_coredump_printer(&iter);
> > >> @@ -129,15 +110,86 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > >>  			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
> > >>  						    &p);
> > >>  	drm_printf(&p, "\n**** VM state ****\n");
> > >> -	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
> > >> +	xe_vm_snapshot_print(ss, coredump->snapshot.vm, &p);
> > >>  
> > >> -	return count - iter.remain;
> > >> +	ss->read_data_size = iter.offset;
> > >> +}
> > >> +
> > >> +static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> > >> +{
> > >> +	int i;
> > >> +
> > >> +	xe_guc_ct_snapshot_free(ss->ct);
> > >> +	ss->ct = NULL;
> > >> +
> > >> +	xe_guc_exec_queue_snapshot_free(ss->ge);
> > >> +	ss->ge = NULL;
> > >> +
> > >> +	xe_sched_job_snapshot_free(ss->job);
> > >> +	ss->job = NULL;
> > >> +
> > >> +	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> > >> +		if (ss->hwe[i]) {
> > >> +			xe_hw_engine_snapshot_free(ss->hwe[i]);
> > >> +			ss->hwe[i] = NULL;
> > >> +		}
> > >> +
> > >> +	xe_vm_snapshot_free(ss->vm);
> > >> +	ss->vm = NULL;
> > >> +}
> > >> +
> > >> +static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> > >> +{
> > >> +	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> > >> +	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
> > >> +
> > >> +	/* keep going if fw fails as we still want to save the memory and SW data */
> > >> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> > >> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> > >> +	xe_vm_snapshot_capture_delayed(ss->vm);
> > >> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> > >> +	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> > >> +
> > >> +	ss->read_data = kvmalloc(SZ_16M, GFP_USER);
> > >> +	if (!ss->read_data)
> > >> +		return;
> > >> +
> > >> +	ss->read_data_size = SZ_16M;
> > Shouldn't it be easy to actually make a reasonable approximation of the size, instead of reallocating all the time?
> > Or run twice, returning size on first attempt, and data on second.
> > 
> 
> I tried this initially and is actually a pretty large refactor, hence I
> went with the realloc approach for simplicity. Paulo's test case does 4
> reallocs and seems to preform just fine.
>  

Ignoring this, your right. Fairly easy to do 2 passes. Agree this is
better. Be on the lookout for my next post with this fixed.

Matt

> > In any case,
> > 
> > ss->read_data_size = some const + VM_DUMP_SIZE * some other const
> > 
> > This approach is likely too fragile, but we should be able to change the code to dump twice to get the accurate number.
> > 
> 
> It is fragile in the sense that anything before xe_vm_snapshot_print has
> to be 16M or less. This is all static though, how about adding in an
> assert which pops if we hit this limit? The drm_coredump_printer
> protects us against buffer overrun and corrupting memory, we just lose
> coredump data.
> 
> Matt
>  
> > Cheers,
> > ~Maarten
