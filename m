Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44755C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 20:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3E010E113;
	Tue,  9 Jul 2024 20:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMuyZYhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510E710E113
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720558023; x=1752094023;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kvZTBMJZ0sjTvcQlujlphfSg3/hydSDyRx54+9lHIlE=;
 b=AMuyZYhGJatW4yotP7JmsZVA1LBTJ/TyD5FdfAmVgqq5NGbmWLOrz87j
 6RW3rE+wOMGSX2Tvlo6Dz75RD9EC7aWcYYbBop5c7Z4WoGpGUmDRi5GEp
 gDi3c3UxLmJqZaExY5ekKG/64Iz1YfAsvG8yvt/JnmMPemC3rL1lX8Hwq
 EQ08abrVR72jY9ElXKyv31MTKOD26BwkW2cjI45uc8WR4oH3HFophyhLa
 Wd0LDolYrJyj7DsKwuPpuee6kLRaH1Xyc7uHxRIRCxwcgXwyP6NrIC7BE
 Tz/htpqQgf5ujXbx2sd6uSOJZFefTQIPpFJXSRqqbQMjtKQ1XZDnQPZlv Q==;
X-CSE-ConnectionGUID: 7eQaqdf4QROlzbj6SqkPtw==
X-CSE-MsgGUID: vwEyybokQAO1Ua4xPtK8Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17987166"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="17987166"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 13:47:03 -0700
X-CSE-ConnectionGUID: XYM29x6PSdGZSSvFwLDEKw==
X-CSE-MsgGUID: TY5ig4NVQmKa1eEo4TMJ0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="47760218"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 13:47:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:47:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 13:47:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 13:47:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 13:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqGbr1LGyH7+0gn/FUb41FOf4pyQ0f/t8DLqk9GNpBhwI4Y1VhxB+F7oe7O2zkMSKEWYhFzRaHaj9FGBDHhp4HU9I/tJKRo23qfWzcUjgdA/h7iBKeaZ/fWsvUp0iPgyuU0zjbxDxhoxW24Ktzv+UTKPMLeriNIcfQzxHwJmHcaEFmXzONQs/U1qlQOmCQxJ+tR6/KBcQzy6bSgJCWtcp6gffxLlQCc98jnN1Qz7F0/wGbcV94tOUBNjHPZUVGKxqyli2Y4CIExQjNLVnIX+fgSLn18qpI48d908zDUnISgXzhv0lGSKS85KjK+rHoBTqnjaVIMcUeAMh683b+4saA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnvkedZdTlJk9FnCdnfPpQeHUdte4qCqePQOPoIuses=;
 b=jaaW2mzFIzeMpTeNs1rLzug1UDpv9RCmKsVKW55FjGc7Mxd2I4JHrvHtqmlc4gQBNaEFt6RJ0Yp+6pnOdo0D+GwvZ8P68sJqbXvDZPE8Fy0OyaxaS/Y8i3YNhFINeTobAwv14IWTRxGaMS8Iouee3ngQWAjfiv6+CwDYNJMz7w4eC9vhlDhRXDvFSLmUJYzY4l0qnT7RX+dI4/J823D6CkYDBf/PUJCIE5Q0cGOGFf1Lb+YA4XPMT7pKIdKDuasuuU3McU4384DvVNqbC3SCdxlWTnbg/o/C9RWGuq9Eq8P6SDrMO7QKEZFCUJSfSmQXwoU7ytCy2ApSH8KZqSPZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 9 Jul
 2024 20:46:57 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 20:46:57 +0000
Date: Tue, 9 Jul 2024 20:46:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 4/4] drm/xe: Fix use after free when client stats are
 captured
Message-ID: <Zo2hlvjE5XDS/5+A@DUT025-TGLU.fm.intel.com>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240709002835.3372618-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BY5PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH8PR11MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc2ada5-a719-4c93-25b5-08dca0584647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?74HkvgrkMCiDCGrHwU7aFB6iS5j2iGZrDIQcUzOQ6vnLMKDkdMeyMrltg5oB?=
 =?us-ascii?Q?RCtKoRL03n+93RqDfCE7JFqOLWCyCR6EApoN2PqFMrWzPbgHqgJO+t6qUM+d?=
 =?us-ascii?Q?JXvbcty/qgGWlu+wzJJNDfWJ/klktiV4FsxW6bPS8flCJ4iiaalYzmhVS7PQ?=
 =?us-ascii?Q?MCzzWMpnrWBrfj8Mb9yVi0jFuNRGS8wY4rI4uDejNDV7IwraDg/H/wFMhs3Y?=
 =?us-ascii?Q?qYxb0Fla9LlhwjGDXlK6rh4EhAMx0z4pGUZZOs9hNvKdXXcKeMMTTTt/gdSm?=
 =?us-ascii?Q?ry0SK7RjydpHnP2yWDKpppdjmx2QzcF3meEZRqpRh258r8o8GTg7bS1pLLot?=
 =?us-ascii?Q?GcxtfhKE3Pi+WSMCf7iybeOhMI1eJr+OBN5d1H5NV1FC6rtaHo45wRT13LR7?=
 =?us-ascii?Q?RnexhI2uZcp7vMnjWY2Is3EJnuuzR1kF+H2V9uuDE/Himk9xOO+vL9yr4BA6?=
 =?us-ascii?Q?qdT1VDcRisfegyfRal24tptmlLN45jboY/Cvjxn2D9gSqlM4JVgY0gua3QTt?=
 =?us-ascii?Q?wKi4RkNAdA1r153jUBZ0CRubA37TrFxGdt5H2db6RxbCaRs7uLNjLfmoyPou?=
 =?us-ascii?Q?k5goLdGq2NMGPLHwV4mSIm7vweD9tXF8FYZgJHdHApsexGzcYvGpulefidSp?=
 =?us-ascii?Q?QTtfEzJb5PIQM43rd3GpBgoxT+x56/5LfbrMYveNocHico2jeQvfQdZWgbHw?=
 =?us-ascii?Q?P5Qh7FtYOQFu7bt5W4QvYi3F0RTNTqGRLD5sWR5gezASlDd0pQJ5WP9ES/4X?=
 =?us-ascii?Q?3A8bR8eNABb2Z8NaY22d52M5QUIVdxC8HcrPUuh1SSPaNWsd1kLX1qrkrkJk?=
 =?us-ascii?Q?qRAVO0n63CPO+FuFcDM9MWzPEhMSYkaGDISfwvgurjJevkVzwTaI8AH+A2Wb?=
 =?us-ascii?Q?CTmfueWi2pM8soZrch1NeIraGYG12Dq4m5mZhh8Zstl8kBkAFuxmrUs5JBMl?=
 =?us-ascii?Q?f/QgLah4V9dt77W5F5PCkFwTEdMWxqszO9LdNaSHDmoJqv4iFZSRdV5AFlPR?=
 =?us-ascii?Q?kj/ONS5qG9//nyeO8w3aB0tMRbsZ79ueHbga3mnfjDALzQ+ptx4IfjKcpy0n?=
 =?us-ascii?Q?PABGfB32dXcULZr7b9I/fKRmeJ3wouzGiTaD8aeFmsE11NHvLqsOLn+5fBjq?=
 =?us-ascii?Q?SdsbCMsm9M+tbnZzEFiu9zSe89ogGsoEb9R1wJXgb3+A1qbJBXVFPXGKkxxN?=
 =?us-ascii?Q?xtvodXeB6RvzVVqngZ7fvh55Q+d8eio6NpxQG0BPXFyTC+J0zHK8zOs1GmFJ?=
 =?us-ascii?Q?6KfVVdlUWDj/jNTfX/h2N2flYLzf5suPWXJEVQTnmrmKDZ/z2qMSBY6urj6s?=
 =?us-ascii?Q?1DM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zD/CaFncB3AtGSYZPFOEui/07zCJO8lZfGpxPaXBVOI7jJ+6uE/gULYYSsJQ?=
 =?us-ascii?Q?KVK+YELnRewsHNeohts8OGzKbjLnqUZENO0aovpT9RrJfVN+KVfMYrmUYK/0?=
 =?us-ascii?Q?Ecuno/Laz+ZWd1nAAfrmToYDXLeFAqYIyD4PFJEIZkxT00e+IrWb37ZR+dbT?=
 =?us-ascii?Q?BHITgKZGbZmxKMSeI9LFoVlqix3S0Pyb2XZOPMcpsB/pbKr7Eh163NzIJmD8?=
 =?us-ascii?Q?ZfXyl3IEUTx7RBap0+mjd1EsZCju5nDgXYWfg4IdgnMjQxTSPVnh2xD6RQtL?=
 =?us-ascii?Q?UFRmU4DGBAczCYbxOGhxSWFTPcCR4yJoiPUvk07k+LcwinW55WKWPhMSNXTo?=
 =?us-ascii?Q?bJ0gV54kH8b4JaifmdXexcbW9wpZsanEyfSwL0C/L9jBCEVGEqISYy5U+GwH?=
 =?us-ascii?Q?RkKS8jXq13vngg28mrT6fbWjn0yVuceMnGxN7HA1Q0mCZ0mfu0/iI5kJKzF/?=
 =?us-ascii?Q?XY70O4BFXuPvjwAM/bjrcl1bE6pRVYyFk22/YqAG1OxCsXPqN9mR+tNlJUSA?=
 =?us-ascii?Q?vYe2CfKtR+PkbPlekS+0bNgmXvdqxxIkNL0pRoG/G8J1xZdPA4c4Mnfs/6Yv?=
 =?us-ascii?Q?5cd4+iM621YtSyhrblQzN0cpfI7u9DrHDtws0A2OvHxdDj0l0u9JuS6AcQ5g?=
 =?us-ascii?Q?wqGDOEhthm3NTZ2oL+NSPUpvM8Hy74xFoLuHqaIU7TUvihFSl8XiUzr0VSWv?=
 =?us-ascii?Q?SavMqjrYDE3ZS7SkOV4/Ml7IgEcoUrxz9XAiIioN0itu0tgIZUOYp+5zUjrV?=
 =?us-ascii?Q?zpuZOCVJ942/u+ZjnZ6uqAUTYuS+UsnZAE3uFHZJadp37SMfn7N4G3abgsw1?=
 =?us-ascii?Q?oiiy/a4yBgwPPdiCuQvwHT9+oSTjcMIGAFwfSWNMwUQ17I2Y1zldxoTpuue6?=
 =?us-ascii?Q?rIiY1/Tf0qVh/XiqyLUwl/QRnCbWGsAtV2rQPQVS8iKjEt059dJN+0l5D3xt?=
 =?us-ascii?Q?zqTFyJJCZrP06XmAYduTIznDJdiZacXuFBfa6CCv+inD9cal8Vv3X5Q+4Gzm?=
 =?us-ascii?Q?3w2+827BjwCdNw1ov9MIjOhCJ0a8s1DOA8KHu47+qUhYEiPVQD3r9l0Aw2O0?=
 =?us-ascii?Q?NzCrEyJQoVfKMQs9UPMU2P+LhXByzWbsq6ZiwD3uFJTvCITRzScX1Dik1TmA?=
 =?us-ascii?Q?EL7M17bSMt2+Vv1yWG+sLlUSgO/VOuYD7KbFuLtI1vp1G5ZsVVOh8T67m8RD?=
 =?us-ascii?Q?E/liKUivnCPi6f1KdorOZxqpffifS+VQTIL+FN/YwwQ9aH4N3zKnA3sFHdHx?=
 =?us-ascii?Q?pwixQ5WIhN4OiNzij+20vaEGIlD+onDZALY8ATzpzeRxmOuVtgUBE17wo0L5?=
 =?us-ascii?Q?jllFmleS6lmL5Ahr2wBDfUhnrDSj5RfxMJUweSm3xmfoSHpnuzmLI/ZcWgsc?=
 =?us-ascii?Q?WVZTi2E7sA5U3+sTubjqW8hBM/5lDBhSSrTVHH9EZTBmyGN5wa7GjQ6cArIa?=
 =?us-ascii?Q?eLbOYV8///ZKl6nqiXYW7y1N43VJtdNwzJeOT00mtowFNo8KXTa7gEXsJGXY?=
 =?us-ascii?Q?jOHhV7X+jZANLxcUuds80Gbb8Q7LkB4ishAPoKhjoeprWkbSidtNI/ueiXjL?=
 =?us-ascii?Q?uv0Kc4LEoD7SAeo2tDLutitrlCYc8t3sLD+2ohwXoDLJ9SU78k/qRRsmQ7vB?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc2ada5-a719-4c93-25b5-08dca0584647
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 20:46:57.7801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9etAElXREipbUcozukbSGHPHQ2h5OJDHGjwgCuyqVY2YvlKlYKYu+1ggy8yk5s9rKm3dXXyRDz1pVQ9fYxJY8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6952
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

On Mon, Jul 08, 2024 at 05:28:35PM -0700, Umesh Nerlige Ramappa wrote:
> xe_file_close triggers an asynchronous queue cleanup and then frees up
> the xef object. Since queue cleanup flushes all pending jobs and the KMD
> stores client usage stats into the xef object after jobs are flushed, we
> see a use-after-free for the xef object. Resolve this by taking a
> reference to xef from xe_exec_queue.
> 
> While at it, revert an earlier change that contained a partial work
> around for this issue.
> 
> v2:
> - Take a ref to xef even for the VM bind queue (Matt)
> - Squash patches relevant to that fix and work around (Lucas)
> 
> Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
> Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908

I haven't look at Lucas's suggestions for the Fixes tags / patch
ordering, so I'd double check with him that this meets his expectations.

The patch itself LGTM. With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c       |  5 +----
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++----
>  3 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 6a26923fa10e..7ddd59908334 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
> -	xa_for_each(&xef->exec_queue.xa, i, q) {
> +	xa_for_each(&xef->exec_queue.xa, i, q)
>  		xe_exec_queue_update_run_ticks(q);
> -		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
> -		q->old_run_ticks = q->run_ticks;
> -	}
>  	mutex_unlock(&xef->exec_queue.lock);
>  
>  	/* Get the total GPU cycles */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 3336a01a1006..69867a7b7c77 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -37,6 +37,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  {
>  	if (q->vm)
>  		xe_vm_put(q->vm);
> +
> +	if (q->xef)
> +		xe_file_put(q->xef);
> +
>  	kfree(q);
>  }
>  
> @@ -649,6 +653,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		goto kill_exec_queue;
>  
>  	args->exec_queue_id = id;
> +	q->xef = xe_file_get(xef);
>  
>  	return 0;
>  
> @@ -762,6 +767,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>   */
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  {
> +	struct xe_file *xef;
>  	struct xe_lrc *lrc;
>  	u32 old_ts, new_ts;
>  
> @@ -773,6 +779,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	if (!q->vm || !q->vm->xef)
>  		return;
>  
> +	xef = q->vm->xef;
> +
>  	/*
>  	 * Only sample the first LRC. For parallel submission, all of them are
>  	 * scheduled together and we compensate that below by multiplying by
> @@ -783,7 +791,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	 */
>  	lrc = q->lrc[0];
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
> -	q->run_ticks += (new_ts - old_ts) * q->width;
> +	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>  }
>  
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ded9f9396429..b5343cdd0632 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
>   * a kernel object.
>   */
>  struct xe_exec_queue {
> +	/** @xef: Back pointer to xe file is this is user created exec queue */
> +	struct xe_file *xef;
> +
>  	/** @gt: graphics tile this exec queue can submit to */
>  	struct xe_gt *gt;
>  	/**
> @@ -139,10 +142,6 @@ struct xe_exec_queue {
>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>  	 */
>  	u64 tlb_flush_seqno;
> -	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
> -	u64 old_run_ticks;
> -	/** @run_ticks: hw engine class run time in ticks for this exec queue */
> -	u64 run_ticks;
>  	/** @lrc: logical ring context for this exec queue */
>  	struct xe_lrc *lrc[];
>  };
> -- 
> 2.38.1
> 
