Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF07CE8D49
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 04:11:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B68E10E256;
	Thu, 19 Sep 2024 04:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jru8Yy53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409D110E256
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 04:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726719117; x=1758255117;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wUtkLhGUG1uvgAHUz/WmFSQ1hvVHePzQrW5dVWCjAWA=;
 b=Jru8Yy53HVCwsn/8PAcIhN4hamh//9NxxNF05go9JLMm90kSb3Dlxhqn
 d915LMIzPpbZBEKHQr6+zuwQOI/pq+5n2k6ZvaB6wduHCMNZ384NvmJhD
 XhaR3uicdUpGDACL5ibasFai29pYKlmcv96SIVZzM3BsTDPFQ39hTmNef
 PGEHQMNoe4YAuamcTno1wu5mg9osrpcBWScfP4virFrWieQXsIsYbjXsH
 Bg2sUh61qlUzHnEDYM2PLi4BtlEa15954sATYlxr8FZU5vsztk1GJSsIE
 /kJaRnZiwiBkseFChacGgnOZmX0qS3dA6mQdOhU/cfr4jC3YTmOrJl8nP A==;
X-CSE-ConnectionGUID: wpIKLt4iRtiA/Mpo/+hi5Q==
X-CSE-MsgGUID: aBW6GKp2SRqzZCiPMm0f8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25537605"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="25537605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 21:11:56 -0700
X-CSE-ConnectionGUID: x+xvy8ECT02W1Qxtcb8YJA==
X-CSE-MsgGUID: EqUX/TbKT0yy2/mHbEl/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; d="scan'208";a="69818327"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 21:11:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 21:11:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 21:11:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 21:11:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 21:11:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnhCP8GCK5MLGVRKOQmx1zC03tUoMnhjyMOERfIdjtXeG2AzwoDqvL23jKa42lW2lDkMdBm3iFcHT3dZzgMcTnCkM7w7xueOs5jyJpIuUBkthM1BsjHAiLyzbN414RLFjv0VRRDN3cekZLa17beF82EVw0tu8FRo3TaFdJbiL5TbipqrVJ5YEK79hX3jILAKMxzWJzjxS+bfxcZUAQ3VOBB7/kq3isorr0xdBB8tgAQJAmFELCLODpLrKyYzi1W8AzBkuNmvfNmf+PYCpMOS+HUK9KRfniyE18jg/aNPcqu5zoTomi1dOfb32PbaCVAvpJZDTkZXquos7taX9nNG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wqEx3XqqUCUMjv/SHmHdGuFeOo3FxI8q1JIXeEVyXE=;
 b=zML+sTpmdEzUAb7SFwlAmeHBrqKNUfZHWDX5m47SMUksIi5CNjWb/d5hMIVseuPPx9fSJFXn5R1EIrSg4GqZO0T+3A2RiJ7XU5wucC8F1RCYyrJxSyaodsqukB4r/KLiEVVhDzBniFFKSZ2kSJkNAArzg7EdRdBaDwVmYElwHTY3nEBFBUEpdSG/Rk8x2Tmj3RS/4wHuJGehJ+D/BTORJtCBCWpLNFKfd/ULfp1ecJFacUh4Q6ATm0QEtEsbclmo0vOSkCq/LYiJ1abMScOJWgfHeZ5Zn67NzeKOmNoRiV6ImeofbVjEpBr1dbj/5keQuE9bmPdAEsqeYvVUAcNUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 04:11:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 04:11:48 +0000
Date: Thu, 19 Sep 2024 04:10:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe: Add null pointer check for xe_migrate_copy
Message-ID: <ZuukIs6ZwIQpYtep@DUT025-TGLU.fm.intel.com>
References: <20240918221000.1124248-1-zhanjun.dong@intel.com>
 <20240918221000.1124248-2-zhanjun.dong@intel.com>
 <ZutVzBOBcklkarY1@DUT025-TGLU.fm.intel.com>
 <ba4d854e-81f7-49cd-8723-5967d7404e32@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ba4d854e-81f7-49cd-8723-5967d7404e32@intel.com>
X-ClientProxiedBy: SJ0PR05CA0144.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: ac8486e1-982e-4f6e-b232-08dcd8612e50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MWReKcdz1x0EUODsYovQe9Kz+zd/ftKHinIKaK4t09LALyia8XdddqM+Dwsu?=
 =?us-ascii?Q?r/ApqsQtRmZZwejsE41J6tZRCHAUl+AFwBsPwZ+LoBDkeby3HsPAYO7Z3Edq?=
 =?us-ascii?Q?ajdnEny14wja7QT1MLADIPwTBzE7/R9H4x18f1vXmeQ19yLbn7fnBtvAhafN?=
 =?us-ascii?Q?YxV3ZA1YNN/wLt1zZvEy4SMtiN18ORiRhDOyZoEl2NfhGXTFuCiAAiP7QJMU?=
 =?us-ascii?Q?8AiTwEWAKQRS3rhWZVeikk8VIgoWsk7tcAelD6Orz4YVwByxspVvSp4PUeUo?=
 =?us-ascii?Q?Q+evoXofXnOjRXyjl84PWArxLkKAhZeMVyRBASpzwpXtDq5jL5bgLV01fQzZ?=
 =?us-ascii?Q?c0R1vEIdnnKHNqFcgg1Nt3pC4WeE2VGteZf2AuhF0LHCz3npz6WFtZ/J5T56?=
 =?us-ascii?Q?50Arz1qlcHTQi+/OY89MyFyH1fM668TZ28MZa+M6mcGBQm17zAJUxRCZS3pP?=
 =?us-ascii?Q?vGH0jzGJZS7bFCaltOXoqm4uKaI5E5bkpipLEwtmZPSVPOBd3Wx2IWNwpQ+y?=
 =?us-ascii?Q?1wGp0TIM39aygD96sRIvRBaoZoldVdU34uA5KzEQT2GjRNBEwkeGXeu9+PeC?=
 =?us-ascii?Q?F8N7rXIyC5mRAUEBq7oSUNodtB37lNDakQURnV5SP2l6Tep9ZrLSAjwe5nHu?=
 =?us-ascii?Q?YJ3xtDM1NAcHQTGoqAkXEHRyfw8wvLlGwSkJv2QkhxfVa2X8t2KdFPe6Ikmf?=
 =?us-ascii?Q?K/F95G6/KFWfUujKYFrJ1Eci0HYn9lYbCVTpPU5obWVqXCag0E4UeE3t7hDf?=
 =?us-ascii?Q?PXGiLkuBXhxKDX96G9ZRz4gxTnBuH/DL30fIrF4KVBwjq4/nR+hmpdQwfX3n?=
 =?us-ascii?Q?uX4WzSTNrVwVT+of689v0EjlQoD2caMjX+5dzonQOqGCSXQbg6h+DFHeyLB5?=
 =?us-ascii?Q?TTjiijKXLBdvG0LDM8rb5M1/QK8xyUVc9PWthHYhw4ELlyDHVh6sNubMCAzd?=
 =?us-ascii?Q?JmJuSltIGB+aVRYP9NytEs9zJFn2Ifa80AVOl8JdvzkJzXXscFbsFwKEgfxM?=
 =?us-ascii?Q?BT4v1DlCZak7W96kLrR/Upromqr4TF9Tb/g1jDr8oQj+1JoYi2NTjwVrHkx8?=
 =?us-ascii?Q?92JqtpoUD90xKuCvE1Vy9PhcYCi3ML6pxdL2/ZxT4AE33mFAPJHaHVVpVK5H?=
 =?us-ascii?Q?VuktJKhFW4oJQkokPsCN1TAlJRDKJOj4RTIaANxYx9CMCdIcbVPlMRWzpJO1?=
 =?us-ascii?Q?PPS5SFKFhLpe3EhDJWzNKEHivUH0oNLmEpGrITsgUEm+cUjl9eFkDd01rHzW?=
 =?us-ascii?Q?lUbl2cfHmKnCx3N19UtZ8aFys3IxdjbyHZ4j4otDA1OXkmhsMERoGST17+yM?=
 =?us-ascii?Q?sbLymM6YdPrQMWBervHFRs00GIvnAO49867YOl+UzOsHog=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l10wrG34SwMG/Ri19JelGcyrNOpnShUN+Ol6Lu0LlgXblHer87hfrdZxU7bU?=
 =?us-ascii?Q?05r/mfw5TP5DVoyRtIwuj1l07DPgJmfPVRtao4+ikrBMwnS9qW4n6VjJ5v8V?=
 =?us-ascii?Q?qAeH0xhlXzZfwWLYmtmCRW8cN7sWdDWT4T7g/Xx/XNFnn8xNEeuXwBkeqiSe?=
 =?us-ascii?Q?QKGHx3QNwzlmfpWP8wlzl5/VByhl0BMYnOvzqQburlRYxZllFGWVWdtAdyij?=
 =?us-ascii?Q?Ngv2/EWmfEsWf7QgPcxz+ZfV4RGOlvRhkmBgIqgF3WQLbAlkGfMuIra4MXXv?=
 =?us-ascii?Q?k1Y6LZjSUJju93KpoLQHUBdXt8jQYuGxMxRChiqCh/Br1GDu81PHHgzofFEG?=
 =?us-ascii?Q?oww81Tn9DL4TJE8ygqDDOxwVteovoQeZ6zwdBSlig+yAkpz5aEiEKcIm+/GP?=
 =?us-ascii?Q?7H7ovK/G9zeVVDPpDa9ntw3xPDrLlfiyngTLjgcO+tOTe2hdfHivIKX5eTHN?=
 =?us-ascii?Q?gMMyk1xsIWlozv9jpw+83/qv2yDfMMj6YpgBSXnHRtZyArN33aHWZNPZ9HF0?=
 =?us-ascii?Q?HXY2uBX4Stp8ivwjPq+FOAR9GUCP738W4FdHnI9wVZgXTgusVEpiw3SkJ7e7?=
 =?us-ascii?Q?BlUPPYd3dzgo+LQ5qhDGnAB0YnSOqGRgskVjh+rFHHYDikSDwsWorh6vloAW?=
 =?us-ascii?Q?vS/erKvHjB0nStKIo1brtfmM2r7EaAbzGRNdoQkvOGVdfvcQdPi1kutOg759?=
 =?us-ascii?Q?yexhfLTCAFyKP4S39x1fJvHmTwj4hlad8Gp+okeEj+/5KQz2ryRNF99yv2Oj?=
 =?us-ascii?Q?V8tAIwxYyLH8V1mFCbQk8tabXC9ggHuqBFCcQOoHzHps6uPo9p5znCer8tIB?=
 =?us-ascii?Q?OXBPgyEHVAj6OMo54uwvORL0ONnUuvQ7PWTvNHoVwoYM8y8GvGOOzzgr1pwt?=
 =?us-ascii?Q?G8eLuYvjEK0EoM24ApEueeatPmMjRz7t/9rQX3biAmMAclE9YAP6tmDxZ2Gf?=
 =?us-ascii?Q?VACyTo0LALWw+r9xBPOeaf5s1loIDnnez5PV+f+rABEJiVVZUdTOsdZKOv5c?=
 =?us-ascii?Q?b8NaN9R++Hqa/bU/HNDYktxPqYBhq0LSqN8BRj9mn/sT6Ba7PYTIaeYtnQ7w?=
 =?us-ascii?Q?7vVfR+M9Dxfga8O5doq9SyxVMcPcVOtNtUpTGki6WbY/IEch4Xxv6oP/tVSt?=
 =?us-ascii?Q?0fTwq7wBW/UsrvYhhtMBx462UFOgmOmgQOuLxkS/k8Ju69G5mx0cjDElApBH?=
 =?us-ascii?Q?GXSDphWu6dbKS0zw0w1Wy8aKIWX3Wm0h7arLSBEBGh6sq3bPFypMU0MTyqVa?=
 =?us-ascii?Q?R90o8Ki8gFtFl1b4R5Y3189xVlZsebUtiK0yQMYZ33BE67zUWBiiKpTm5TYv?=
 =?us-ascii?Q?KxXfHgGhN/8VE96fRF6Nyb0wLcSDTvw4ZB4IodsdWjSs+aVM23WTdVWtCwA/?=
 =?us-ascii?Q?SZZY4AaEOT8FLo1qMQqUp4SXySsqCWPnf0iixbmtkxwuh3WKPGfuyislDe6b?=
 =?us-ascii?Q?YF6wGRst2Q/9lxFw8ahNFVWWz4CJmsBSOYpPvN5GSs2uNUU8Ii1/0l8VEE3H?=
 =?us-ascii?Q?ruAnatQYGFs6wdQOMiIxhpJxSPKFbapwPfh72yFyq+ifIPDxHUXY6iVJHdY2?=
 =?us-ascii?Q?T8h6VIQC4c4MmwQOw0Gqyo2S9MPY4lXn/ZAwoUOn0A+XeIKX8rKh5Y4WYh6X?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac8486e1-982e-4f6e-b232-08dcd8612e50
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 04:11:48.1500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RJGG9L0lPEwzPiPr1WSwsHmDFnLjFO/smzMOGPdJEccQTLwi2rEr6vuHlz6isCI4TuILlXH/jlAma/4v83Ddg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

On Wed, Sep 18, 2024 at 08:12:20PM -0400, Dong, Zhanjun wrote:
> See my comments inline below.
> 
> Regards,
> Zhanjun Dong
> 
> On 2024-09-18 6:35 p.m., Matthew Brost wrote:
> > On Wed, Sep 18, 2024 at 03:10:00PM -0700, Zhanjun Dong wrote:
> > > Add null pointer check for parameter src.
> > > Update lack source flag to include resource is null case in xe_bo_move
> > > before xe_migrate_copy called.
> > > 
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c      |  4 ++--
> > >   drivers/gpu/drm/xe/xe_migrate.c | 24 ++++++++++++++++--------
> > >   2 files changed, 18 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 5f2f1ec46b57..761130f0e9a9 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
> > >   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
> > >   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
> > > -	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
> > > -						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
> > > +	move_lacks_source = !old_mem ? true : (handle_system_ccs ? (!bo->ccs_cleared)  :
> > > +					       (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> > 
> > I'd write it like this:
> > 
> > old_mem || (conditional)
> Sure
> > 
> > But I think if old_mem is NULL this condition always evaluates to true.
> 
> The NULL ptr issue is found by CI:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128077v21/bat-lnl-2/igt@xe_live_ktest@xe_bo.html#dmesg-warnings5406
>

The fact this is a selftest is very suspicious. Self tests can do this
outside of normal operations to trigger various bugs. If they do things
like this, IMO it is a test bug not implementation bug. Thomas this so
likely a good idea to check with him.

> To get there, 2 conditions are:
> src == null
> And
> move_lacks_source == false
>

Yes, but my point is I think if src == null move_lacks_source should
evaluate true as I think the 'ttm' variable here should always but NULL
too. Not 100% on this. Again I think Thomas is the expert here.

> > 
> > - old_mem_type will be XE_PL_SYSTEM.
> > - ttm should be NULL (I think), thus handle_system_ccs should be false
> >    and tt_has_data should be false
> > 
> > >   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
> > >   		(!ttm && ttm_bo->type == ttm_bo_type_device);
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > index cfd31ae49cc1..45bba0d731ec 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -774,14 +774,22 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> > >   	u64 src_L0, dst_L0;
> > >   	int pass = 0;
> > >   	int err;
> > > -	bool src_is_pltt = src->mem_type == XE_PL_TT;
> > > -	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
> > > -	bool src_is_vram = mem_type_is_vram(src->mem_type);
> > > -	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
> > > -	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> > > -		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> > > -	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> > > -	bool use_comp_pat = xe_device_has_flat_ccs(xe) &&
> > > +	bool src_is_pltt, dst_is_pltt;
> > > +	bool src_is_vram, dst_is_vram;
> > > +	bool copy_ccs, copy_system_ccs;
> > > +	bool use_comp_pat;
> > > +
> > > +	if (!src)
> > > +		return ERR_PTR(-EINVAL);
> > 
> > Can you explain if this function is called with src == NULL? That seems
> > to be problem in the upper layers if that happens.
> I agree, the src should not be null when this function was called.
> The previous move_lacks_source change should prevent it being called.
> 
> Maybe keep the xe_migrate_copy not changed here and only keep the above part
> in xe_bo_move?

Yea I'd drop this however this gets resolved.

Matt

> 
> > 
> > Matt
> > 
> > > +
> > > +	src_is_pltt = src->mem_type == XE_PL_TT;
> > > +	dst_is_pltt = dst->mem_type == XE_PL_TT;
> > > +	src_is_vram = mem_type_is_vram(src->mem_type);
> > > +	dst_is_vram = mem_type_is_vram(dst->mem_type);
> > > +	copy_ccs = xe_device_has_flat_ccs(xe) && xe_bo_needs_ccs_pages(src_bo) &&
> > > +		xe_bo_needs_ccs_pages(dst_bo);
> > > +	copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> > > +	use_comp_pat = xe_device_has_flat_ccs(xe) &&
> > >   		GRAPHICS_VER(xe) >= 20 && src_is_vram && !dst_is_vram;
> > >   	/* Copying CCS between two different BOs is not supported yet. */
> > > -- 
> > > 2.34.1
> > > 
