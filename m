Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF83CCA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785F710F187;
	Mon, 12 Oct 2026 14:30:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB6F10E5C1
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 14:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791815427; x=1823351427;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yefwr/62bCyx30l4VF2Wdsc6LgHsdHTAUVCYCoVyWh4=;
 b=cOTkQ3xJglqw5Kt1WVX1ZbMsaN4ire7J+3FeFTJBphOs3PxI8+H8NGLi
 7W+WtjeGQ05c/mftYSPGkCL/MCyVpMAE7gievdfvtB1E3gOLrASIRGrQk
 mdri83shc5SEGDycflvI4FW3WJ8tvW1S87G9muTVBzJuUHn7cAHUrI7uM
 iMizwuc/JsTW8mvWUfPIC2E0fuc2gJNKULhmViBXoL6GyW8c6WWjQXeGH
 XQ8xn9s8Tjx0t398/o0I7oNqxxFa1PZm+IpMV57ZM6+wBTSkA+wKhIskF
 SYGcw3dHf8ubfK0h9bcOh7JlpJoygcRjX6nR80lmDVB59ClfYIeRzsRTA g==;
X-CSE-ConnectionGUID: yOmGPFIsST2Ui9LwT9ZDsw==
X-CSE-MsgGUID: JweCAuiTRTmT1d5rgYwkYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="420330"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="420330"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:30:26 -0700
X-CSE-ConnectionGUID: 7/BvQkTQTDCrRl/Lh/dylg==
X-CSE-MsgGUID: wjmXdqjwTrO6w2fCO94y6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2762339"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 07:30:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:30:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 07:30:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 07:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBT7BkgC+HbD2lUDF5y4emY2qX46WY920TcGWRwfnrTYICWI2PRUEQo0YovsrRXTocbgp6gCLLSqsZY8UCflZ2QM4Ku7RE3RO79boHUCSlgmne1MVYJysz6Q5DibeqUWh7+8hrKmcJT+h1RxGj/uvKuKCvUoAS4nr0/rkZ83LNsu6qpygRiOwVFblaLD3FQbSx8q5gCiLy33JBAVUREUJiFHxOLCFB7p688p8kDN4IFDsYRxU7CLL1im21uhvheyhxoRWg+D3YquE2mFxBZh1Ch3XEopq5fpeS0tPUipI0EjYv3IJmG3AtdoegkA5FdTd/6O0B3YruRLD7gM8U8J7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtJ0Yb5kxelOU10S6nUSxpiY0wkHo1Hm9NMTOxeRCCc=;
 b=APGI452Vhzcv0ffYwJCBVUPkr12cWZ89eO7YKDWXb14MANtu/At0ffjaMitcOwUrqh7PfkrgpN38SSEgpOCkoLpdT0HSh4ZgLF61F/eQ/en3kKrYZGZpQaCrlSUO+JpHPQV+UpWdIG845fVORhp69mYw74CUL0DPtT2RAFmqVRwK3Q/c1MzNIiq9YWu320fau98lFlTnWzMhjKv+gkwPYhvS1TGyY7yZA33I4r/fFnxH/n05JbOBfm1hHhG2hV86mc1uYE29PN1M8IiLl4yfiSSnmZggZvR+1V8qR5jRFMLpPLDbFqom2OHGXN8M/U8e4RJwL3wYliofw9+QTxl0Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 by SA2PR11MB4939.namprd11.prod.outlook.com (2603:10b6:806:115::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 12 Oct
 2026 14:30:19 +0000
Received: from PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289]) by PH0PR11MB4792.namprd11.prod.outlook.com
 ([fe80::fec9:8db4:c768:8289%6]) with mapi id 15.21.0472.016; Mon, 12 Oct 2026
 14:30:18 +0000
Date: Mon, 12 Oct 2026 07:30:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: skip eviction of a BO with no resource
Message-ID: <aszu9/68xztiPeUJ@gsse-cloud1.jf.intel.com>
References: <20261010054041.1327217-4-niranjana.vishwanathapura@intel.com>
 <20261010054041.1327217-5-niranjana.vishwanathapura@intel.com>
 <DS0PR11MB87183BD13715E4AAF20D9E8A819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DS0PR11MB87183BD13715E4AAF20D9E8A819F2@DS0PR11MB8718.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To PH0PR11MB4792.namprd11.prod.outlook.com
 (2603:10b6:510:32::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4792:EE_|SA2PR11MB4939:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9b7f81-4054-4bb1-139f-08df286d5692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|10067099003|22082099003|11063799006|4143699003|56012099006|261009223027099003|5023799004;
X-Microsoft-Antispam-Message-Info: dTtbHWJEKD/ZfalN25QmEsK9c2AayW69S3OYcmi0kGE7QAOcstMUjXXg4+wdu7+STG0DZsoPur3hRkpz+xEZw8wRWyRnVNk19dEZPa7Qm3UkLevimhXxwGpBCKvvYM8jwjLo+1iCbEq2AE6eVV6MuLFx6jD7GAP3NxbBE5uFD96Xx86+Jc9eLc+NOm9sU+F2fE55JDGXTnC0QjLpFFU0v6U+3zdM6kSeKB9i9fgWcC7rtUjTWeubXxU+fyjeL8/PYJsEHuk661K2RdNZIGOJ2jzykK1NJXZ6eKIz6x3CJjBM6M1HiTAyhrUhPsNkKPkwGlAR2IanHYh+Foxtbgq3mbr1w7JIcC0dEvql2anv+SUjH3AzagklaeVStseXmFeIWBLWMMs6+ncX1w9Jw0+c397OuEerJ0fzbr3lkumNzoxZslHahVr5iBBnmdeZBx+rL++ejAyfjFy3RyMwGZt11v1cBnq8NdRJE7Kg1a1GXBA8f6qkmgu4RGUb6Trly7/zl6QfUT9YcV0TqKzhgEhvOCUcD1jaefCePW4yJFBqkZ0awavfvUtRcufwLG4h3CdfdKNfj7Vgl7SjsnWbe7hN2D3y0iRYTsfQqRUau4DhomiQXnMF1p5OsHq+57spXIuH1BWPQ6FRaQtPzMgVHNyI3VEt29gQeRp3PgF/srHl5hU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(10067099003)(22082099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p2FG/E8d0W3YaVwcjbAo/dl1XCDbyw4eyam3VHbt2Zt7ULkFe9mau0yASyah?=
 =?us-ascii?Q?kMnkVCBzDxKQaug4pBlLlUqTMzES3SnJv+/y8QjBQXsR2snlMhDJuqh/PvaP?=
 =?us-ascii?Q?Kj/U1gy1G9zPM/d+PsjO9muOGWb/DfgWhHAhiyOX9PjNc2PXI23SIcH3XsVp?=
 =?us-ascii?Q?DBLwBcTARo74ZNTZwAJKeOyjJd0xGafbtB5javpDf7puQOH+7LSK21PeS5oN?=
 =?us-ascii?Q?1+D5naOeJhpjqRP2RNLQFwbzk1aBSSGc3OVaOn4QpXbRUxvtlBZWCtDMU2Ro?=
 =?us-ascii?Q?w1KhbvDUtylNMQjReYqzfu2A7T4jqyG5P8SVJTK0su/eY2cI0EUw41C33yHc?=
 =?us-ascii?Q?yxCC4CSDDIE7c5kOQarvn0bC+vlmH6SpPFnOvY26nLCLWsG/7pk0oILE3AMJ?=
 =?us-ascii?Q?RFQsd781vGl/mIztfOD8tkByCZxW6WU6InveFrxEQDZoBnpj2BkdmFTK6YA+?=
 =?us-ascii?Q?WjSsMn8LM3lcx1j11BTEpid41iLcEOmd+yxTZKuVtXAAoWcYas8vqxK/n64N?=
 =?us-ascii?Q?wDJWyF6ZV/X7g2a2e2BGtv2Udfnpu+Xfcg2YwuAWlvP7QERg4+lu8vFWCXme?=
 =?us-ascii?Q?uOAPn0QQ9BOfYEGB6QRx3H35CosepFWayN9gVB2tTaMJz4TgcDwdwkNqJT98?=
 =?us-ascii?Q?gYQmb+Cvkbeos9bl3SR6/fwe95jvOMUXLWIkmn2wzOpiY5Hxyfiw28mPHE2W?=
 =?us-ascii?Q?dFEpNkREECoBR9CR0t/DFo/ya+tjRyZJPoQ8haSyOC/nBqwyaux4fq/xi9iR?=
 =?us-ascii?Q?0Ll3/xyRbrvU/iCv/piDCi92wkPSa4Z2VOd12QMT5Dv3Z3V73E1+NTrf6DD8?=
 =?us-ascii?Q?Bm0R4urepmvF/E8FVUBWWYYhkeZePrRhL5RqTHdT8INcxbECfEFStQfuOSbB?=
 =?us-ascii?Q?G8AF1zQ6owe00nm5Xsx+G8QInjJxaet8L4xnTwcD+Udbodol/xD5rYdOsZP+?=
 =?us-ascii?Q?+M9mmtvinDJxHvXBQefja+cikCe7PJ3jNzzDioMLs48fgVoQachJvUSrqBbF?=
 =?us-ascii?Q?/ElL28wEWXyRAn/usf8hJcalzz3jSaQ20kAoPSpGqMhNAgHPEhsvpXQmjXOe?=
 =?us-ascii?Q?uAuZCL6ozYklfhUUe9HLfUtCUD8Y3GiCRChk1iT4Yb8blMDBVO/OdeXIvoMB?=
 =?us-ascii?Q?vA1BFSGn4TdAAm+NudxW+MYpvGab5K86P0BYnIFrNJ8RwvRU7bnrPJiKohCf?=
 =?us-ascii?Q?Wwcd0cq3HjKabMToPh18KezkejmYhLxCjcVmJ7MYX/nv+bwXoTl9NW19qUN1?=
 =?us-ascii?Q?nnIdK3SH+qg4hsQtd3RifpbPzQtB8VAECGjVBQz9miXRtCjJ5gdgH0oNmjOI?=
 =?us-ascii?Q?udLby7foMNTbP/Pq5wgpF0qtChKgTiwV3esJIF7FkjalJsJ8t8O1wolOllFm?=
 =?us-ascii?Q?B7V5fEe3Z0Q7j+46B1VEyAdXf2bWRunLDcX1BTqw0PVh/33ZPY4KiYBq/vxR?=
 =?us-ascii?Q?hJqLXrt3sY0SGrBa6vl5Bj7BDer04WLqz6b35n0LcEvZeOjmqep2/S2ZH8po?=
 =?us-ascii?Q?5fTI34ZwpIRiRmDttUduy0KYypmOMkJOFzLIFCqixUlq+yXRn0Ejx0H9bnPy?=
 =?us-ascii?Q?7OSF9NG8MLbLvxDZRWvXBwakxUHejjdNFQLLDayATflwshalsDKXYJbFTjSe?=
 =?us-ascii?Q?HPHvkSJw+zosAZzUlB7/Yv98oMoVQSYV5Et2P/LF1mYQEb9YgsEBvl+1WUsl?=
 =?us-ascii?Q?sZE491G0c3ieczUgmdmwOPaZqu35H9WKH5z/D/Nrgkt62trxcIuQqKIOGr9q?=
 =?us-ascii?Q?F23lMZPZ6g=3D=3D?=
X-Exchange-RoutingPolicyChecked: mMxJSmC2VQr1QgN3DAIhPhRXsZmIG+eKi3bV+j0cfEjCzWlkynPz9x/hKDCRJtpq35BFJ1Y/lsl5dgoh8bKy2bjY8bR5tZSgK9GCxnRVYivyDibCgmK4X1+iNTmFAWZC86TEWoSWE3h9ZyyaK/IIFALulD8IGhSVgAvD4w3Q/vpMh8Wf4Il7xAvFC+o26NYclXIVimecDutq49OQ1TuvaDsO/KnwR1nHFQpM5Ohv/NtzHXa8k5NNMzz4qQIEOFlcNOI8GS+cMCTtFe8+GGpqMocCGgUJoin+bMgpL8KslUlXzrrhhLTOZJ8slWqSr3KiM7BBfb0BkVSo7tTt7UAN6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9b7f81-4054-4bb1-139f-08df286d5692
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:30:18.0165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Niq7Ao7zBBs/4FKFwSvkvkd6dboxBAqPURaB+0cauk/a8NBFxx7DdOKn/IfjctIdMusGTu01NHI07qP36UD6QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4939
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

On Mon, Oct 12, 2026 at 02:05:39PM +0000, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Niranjana Vishwanathapura
> > Sent: 10 October 2026 11:11
> > To: intel-xe@lists.freedesktop.org
> > Subject: [PATCH 1/2] drm/xe: skip eviction of a BO with no resource
> > 
> > xe_evict_flags() switches on tbo->resource->mem_type to choose an eviction
> > placement. An xe BO can reach eviction with no ttm.resource, e.g. an imported
> > dma-buf BO whose resource was freed during teardown while its attachment
> > is still live: the exporter then invalidates it via
> > xe_dma_buf_move_notify() -> xe_bo_evict(), and the switch dereferences a
> > NULL resource and faults.
> > 
> > A BO with no resource has nothing placed or mapped, so there is nothing to
> > evict. Return an empty placement (num_placement = 0), mirroring the
> > handling already used for non-xe scatter-gather BOs just above;
> > ttm_bo_validate() then takes the pipeline-gutting path and returns 0.
> > 
> > Assisted-by: GitHub-Copilot:claude-opus-4.8

Assisted-by: LLM

This looks like a fixes. To unburden my mental tax, what does the
current code do if !tbo->resource upon eviction? If it is anything bad
or undesired, this is a fixes.

Matt

> > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c index
> > cc78283b702c..12e523c61c1f 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -340,6 +340,12 @@ static void xe_evict_flags(struct ttm_buffer_object
> > *tbo,
> >  		return;
> >  	}
> > 
> > +	/* No resource: nothing is placed/mapped, so there is nothing to evict.
> > */
> > +	if (!tbo->resource) {
> > +		placement->num_placement = 0;
> > +		return;
> > +	}
> > +
> 
> LGTM,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> Tejas
> >  	bo = ttm_to_xe_bo(tbo);
> >  	if (bo->flags & XE_BO_FLAG_CPU_ADDR_MIRROR) {
> >  		*placement = sys_placement;
> > --
> > 2.43.0
> 
