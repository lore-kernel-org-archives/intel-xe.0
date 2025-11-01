Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0819CCFA02
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 23:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A8010E04D;
	Sat,  1 Nov 2025 23:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nA3acWMh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE7210E04D
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 23:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762041551; x=1793577551;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FJ1se+nB04mLHO+oCeBmBOCIfApNwjKQRkswee2DvAk=;
 b=nA3acWMhW25y0uq+96oh8nME76s/SsYl+0SF0v/1AXIr0A09ypLUIkNz
 b0pgbwkLXFGlRFOoj2puf8XHlt6v/NikBvB60rAzqCri0f1czJlW68qxE
 D3r2yAWNblXcMf0GYd8TydE4sVSUIXeQ7OY7XldoXJM9lIP0ybyd/BRYc
 TRd/uzn4qUClnXtkZpmUxjB3vZ/TxBVciryu4d3wveJYx+qreiPJ7EJwy
 gBQuX5K5WqsF3WhAMEjcfe0JvcUy+KvnovP1/uvMWIvAkjPJV9ah3BAf1
 I7nAZ8gqB8A7A04QXoy6r+ZnQEaYN5xu1qNaDs3mwyphQQNiFpJYa/SMR w==;
X-CSE-ConnectionGUID: OBHwctNARAK43HFMWs9BNA==
X-CSE-MsgGUID: qFY+aMCnRAKq5rrPwg85ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="75279059"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; d="scan'208";a="75279059"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 16:59:10 -0700
X-CSE-ConnectionGUID: LiFf7egeTbGsnftgf3smfA==
X-CSE-MsgGUID: VhLresBsSoCbiNq1lz2zJw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2025 16:59:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 16:59:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 1 Nov 2025 16:59:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 1 Nov 2025 16:59:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpqAelQdZGuctW6t8K6bbTjB3fHxvPLBPaTTtezsNuNklsMEF2NOIsoJaFUufAIGuDpVDrE5PGvstcSCY2+u0+ONpPn4/8BK8s50l8ohiUKCY04eHcQZohvNfVAbjkuBwenEvPZXHCsaTo7UCrArBdjxVkVQ0Z+dYgOQp6MOLacN1jTz+mtftUZoFU7u7ynLtFyS317d3iMpg57XN7Sz6GLT3XCEf8CP/vNgLTP/4R+UIlKw5lwEJ9S0TyhzWDyQP9CfSUJ3R7nvS3ABTvquo3tRI6A91p8OFE8elg7u9h0Z0/fPgU4075iv2mCx90SdgO3HvTCLjw8Qob9JnVs1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHOp7b9pWp4xmpdtH7R+IRI4Oabqk97ALZjv1M6DVKQ=;
 b=jkrLogfMPT+YtvMNLuNTmqTVr9LHtH6UF66JVmCEnxTPq3qfyJ6SfgRZxTKLJUwD8E69Sos+/v1TkirFTPPp3XZrSQW48rjpDU/4V784DzX+8fSTBukfQ06JbY4idwxMybZQ79Tg798tGNBP2VVZ4RsIloxUpsyY4lsZUHtA3vdtxScNCjKrfvwYEDTWkWhrG400VZNIpaF2219hpoarTTWtFtgdIjc2GbtQiCf9rMs04jo1Ost49jrICE5JkVK/m5P/fe0y54u3T76lXzfZRlrxcDIknyJkFgr9fNu1y0i5ug6NSVOvxEq1uPiey86VPvlJRzFXamv48ZtBgo24eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 1 Nov
 2025 23:59:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Sat, 1 Nov 2025
 23:59:06 +0000
Date: Sat, 1 Nov 2025 16:59:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 04/16] drm/xe/multi_queue: Add multi queue priority
 property
Message-ID: <aQaex+xD5qdOwXdD@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-5-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4996:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5871b2-5f3b-4605-94e5-08de19a2a3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LxkTRLy0pgdvVCqm7lI1/D4SaSZ3GcnMZuE51qEOQpG6dI4rmLR1vRzxFN3e?=
 =?us-ascii?Q?FjXbOp6/Xj2qJNuoP/v9m5kqCAqMLepzJfEY1wdh85eSTP3KO752EbEc/S+Y?=
 =?us-ascii?Q?9GLLbtD2Iy5NkIRnjgKXLBZb51InhAEJ+Spz+ieSilQkm2S9Tf9obi20KrwA?=
 =?us-ascii?Q?XX5YmoIrK+c/p95wKANf3kDTM4c+PFI1+SM78opwRVfGBcxsCpBrV+MkLYzv?=
 =?us-ascii?Q?XeNIgTNMeRzS3bKonzfh/H9oA1+AdResaiU06o5EuU4fPI3+938Pkp+AK2ZQ?=
 =?us-ascii?Q?7bdhl3M6e+zBqZs3W9K9I4Ui6xdoBVatK1/9XFrVeCoQvWWiN9v6WiL8Wwvm?=
 =?us-ascii?Q?kSoab4OsvDjZOIHlDi89DRVp9FSAqwXkUGFkm0Vvh2Aq5X3P3lC/QJdbzuhW?=
 =?us-ascii?Q?Usmgn2DiKmUZ/JXyQPnxpG74zlCH0RtBRJglNXfCxOnShzws0gQSJYygaL5k?=
 =?us-ascii?Q?ZVeqyRddJ72+tQ96JB74UVC7qGhxv8d6rUmU7egg9Ze3x7mIBGQbD11WMv/T?=
 =?us-ascii?Q?X6CdJEBUxwVdIPpdwmsFFH0GLbzv/Hyq0Jiz8+1NEwPCx4ImukqNLezpHCkb?=
 =?us-ascii?Q?vNDvt1m9NE7+0AfoJZ4rMbHqI7RtIORR+4J3Z1XmkyhSFSBfRbrv2rjGEM73?=
 =?us-ascii?Q?3i1v85NnJmspbNxepocYtET8kxgreRJTpQs980ghpLSdxRx+xOd1HRkGxTCM?=
 =?us-ascii?Q?W97S2AoQISj9LKNVq1iDgW9khhWMdk9A83B06hyrMmq3SgDf/+xxvHi4E3qG?=
 =?us-ascii?Q?VOs+M/myMeqE1pwOKMzMyeYgeAXACsQ9ZiR0hfQ5c3d6MVqsrH9/X7McZWyg?=
 =?us-ascii?Q?GdCWVX4UL4gUCiaQ169kXM7vDvyK7Ezgndl5YMVG5eMe4O3SyULefhSkOUJK?=
 =?us-ascii?Q?b7yMqVXdivUfRWSNfIXrYrw3oef80idLzq3/xsaRzuINgKOxm3F9ni7y99K0?=
 =?us-ascii?Q?8HmuObxHioEZJpKkeAbgfOdcD6TEfCukUmW/4jKNqgBW2j7kVeQb/YO+z+93?=
 =?us-ascii?Q?sCSsJn5eCx01j23DjTCRSG21XbHW8boR5p98BvdVFUQF3xNRRm2pe+nl01na?=
 =?us-ascii?Q?et99LNbeTUdWtwzHujA8upLW7v8NCPVZLl+bS+ipjte1u1f3tXUNg8noZdSt?=
 =?us-ascii?Q?EHV2p2lSqAmESaCscIlneDdGmIqjW8fZA0amzYz6rKKXKjpZ3P3fJBOucVlL?=
 =?us-ascii?Q?6obfnLsJw6PATZ2boJ8GNhNUBq8H9GxgcclyyNVnrHXBnLIcNxRkqoiXeiIw?=
 =?us-ascii?Q?CcgvRw+aWOiP+o4zTWWkW9vWJ42kkHMvYzR+B4AgDK5i3RYUxSKu6CbYPTeL?=
 =?us-ascii?Q?7NnzoPO6IyWLkf/5KVQIY5k0labO8LcWaOn+i0YJO9ww8qq84K1ESgjZ0nAX?=
 =?us-ascii?Q?WoeujaUmTPqbI6BQUEfzoH+WpGCpREwRkFOw/8ApVhkErqZ9gv8Q7sI+B0Mx?=
 =?us-ascii?Q?Y4yvdJpHm3/juu9P4jEHDHm5fJdaU5A4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sE062i/o39ojePZlKAZlsUBcIKk35/ynOtUqUYB4kXTHnD68Sw8ThH+hl9QY?=
 =?us-ascii?Q?lrQJTz0tGsu4xaguQw3X98lJEtLC2D+dB25t2ImzHZum8Ibpk7Fz3fD9hIyD?=
 =?us-ascii?Q?rGCRl2pETwR1KtQDg90LwPMv9yHi/W79WkK29AecDhckCkZH6dnXNmh/viTs?=
 =?us-ascii?Q?LBEHlNBk9uujSWn3hA40fgNB3TCWIki06o9AxrrVCdV0esw+9OV+FNVEivt8?=
 =?us-ascii?Q?lY7cSvQztyJGzh6RKjkR06do2bWqJ4dDEq0mr1Bqj0QtbM798GdYErDgfluw?=
 =?us-ascii?Q?AEUXpym/2EkBugP8JeUxAuDn+/+P8UYFEuz+u+ke5ygm0RwYYUC8NoEDI/N7?=
 =?us-ascii?Q?E9vyRLNq+lCd/ap3zpNsF07iDlJaGujLTxjH1EPu0j6BtU7qcWDXR5gP3U0X?=
 =?us-ascii?Q?A875KhAcXnRvO9v3m0T7GoRTbfjqE/fKaIDPKGF6orIW83o5Ai+UD6zta1+L?=
 =?us-ascii?Q?vUYrac2YTpGMUWE3PCtpDTiusK0h7VSuHjnS2MfFrlZeOwpTJq8O40uSxnap?=
 =?us-ascii?Q?9AEvAawKyl/j1sPKqDUx0CEViNWHWPICXzWzWVwLV8Z4cdsFHoMEjeZHI2Gu?=
 =?us-ascii?Q?uUwAqIbP/z7s1GiHOZdgcgLoD3aVE6TnljFVdl4HB5UfBOAHse2bPFUQp0cN?=
 =?us-ascii?Q?WZRvh4ZD8GzB41XVSQ313Y21WZfJD7X/LvB7nzUShpUy3g4hOKdEol3vnQ/x?=
 =?us-ascii?Q?zX6vSQvKyzYvAmtFLJ6FQfKORvpmt4EKNpy9/HTUONjD0EljHJZNxDWl4mBO?=
 =?us-ascii?Q?oV00kyaGlE+QY7wRhilTVl3DV0m9s4banpzBKre5jTKzFk3qXrF5J56MIUgf?=
 =?us-ascii?Q?RBsIOwcaI1vA/LE53IfJaeGz1scgSdBGaG8INheByi1NDIyxHp+8BV7aeZWg?=
 =?us-ascii?Q?r3tqAn57wJoQL1dZP/ED2z5ViTOVaqJrxg7bR/QsMGWjkwWRmMiA8JrCAka9?=
 =?us-ascii?Q?6rSta+Q+5A6xHOCNyzav/Jg51HWLI5IBOib6KiHZQ3T2yXpoxdvx1TQGLAl1?=
 =?us-ascii?Q?iqRInabolHtOq+OoKfNXomjGNC+mdQFuV6J3fUL/FuUCRvsbnmP4gCpzz1Pl?=
 =?us-ascii?Q?yWsZbvqOsk3cr5Wmv+jZ2C7rMQfR6kSxsjyY20X5aroCep2Y127EPtWs7tEW?=
 =?us-ascii?Q?nMZG3HsU7NQRUhRE5Y33SnZyzlqg4yftA8pS1WEXGBg8qYYv/nxSjA1I0tID?=
 =?us-ascii?Q?Zq3sOMCvqPTOff4FxguIsSqs1aJj/StUdLT/k4KdljB56b+D+5kUPBNTFWRt?=
 =?us-ascii?Q?aVDf6J0fPvtfsir1u9+h+l407GLCXvdsyA2VslfJp7C8sczLEPbsh2OAPwcB?=
 =?us-ascii?Q?QfSV0bS1nqlqdabXpE/Rjm164F5VqD4SUV+/P8n+7rHG7AaHfnljIYJi4MAK?=
 =?us-ascii?Q?5Yo1f68dd7E1eTbnBSdtNyv1nOF/qV139SRYUwfUIrVbCx2xLUQ9ayMMyrZv?=
 =?us-ascii?Q?QC6Ieaun9rZXUgqHRBV5GdM3WYW7af7Z/ru/Ub6ujqIR0f6nWq46qQiQuGvV?=
 =?us-ascii?Q?WLOt/jl6d7I9uW9zpSmW1FOKVkP28I5EYfuYOEsPHImdIn25+ps4HJ5w/N+N?=
 =?us-ascii?Q?TxUt4+MwLNCOklhHUcjTQB+uSQaqmigx21CeVG2ScK/CLk7cBZvtY7pgT4fY?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5871b2-5f3b-4605-94e5-08de19a2a3bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 23:59:06.0236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pk8TdpgYW+EYBWuwzPc0JVwhKv7E6Vt0NoNVHsMcz62AayOnaZHY8zu7vFq6jjZiEXsYM2PsmO4/OLRSUtUSdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
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

On Fri, Oct 31, 2025 at 11:29:24AM -0700, Niranjana Vishwanathapura wrote:
> Add support for queues of a multi queue group to set
> their priority within the queue group by adding property
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY.
> This is the only other property supported by secondary
> queues of a multi queue group, other than
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 17 ++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  8 ++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  1 +
>  drivers/gpu/drm/xe/xe_lrc.c              | 32 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h              |  5 ++++
>  include/uapi/drm/xe_drm.h                |  3 +++
>  6 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 86404a7c9fe4..0da256428916 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -177,6 +177,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	INIT_LIST_HEAD(&q->multi_gt_link);
>  	INIT_LIST_HEAD(&q->hw_engine_group_link);
>  	INIT_LIST_HEAD(&q->pxp.link);
> +	q->multi_queue.priority = XE_MULTI_QUEUE_PRIORITY_NORMAL;
>  
>  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
>  	q->sched_props.preempt_timeout_us =
> @@ -722,6 +723,17 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>  	return xe_exec_queue_group_validate(xe, q, value);
>  }
>  
> +static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_exec_queue *q,
> +					       u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
> +		return -EINVAL;
> +
> +	q->multi_queue.priority = value;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -731,6 +743,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
> +	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
> +							exec_queue_set_multi_queue_priority,
>  };
>  
>  static int exec_queue_user_ext_set_property(struct xe_device *xe,
> @@ -752,7 +766,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 38e47b003259..964a0e6654c7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -31,6 +31,12 @@ enum xe_exec_queue_priority {
>  	XE_EXEC_QUEUE_PRIORITY_COUNT
>  };
>  
> +enum xe_multi_queue_priority {
> +	XE_MULTI_QUEUE_PRIORITY_LOW = 0,
> +	XE_MULTI_QUEUE_PRIORITY_NORMAL,
> +	XE_MULTI_QUEUE_PRIORITY_HIGH,
> +};

Kernel doc.

> +
>  /**
>   * struct xe_exec_queue_group - Execution multi queue group
>   *
> @@ -134,6 +140,8 @@ struct xe_exec_queue {
>  	struct {
>  		/** @multi_queue.group: Queue group information */
>  		struct xe_exec_queue_group *group;
> +		/** @multi_queue.priority: Queue priority within the multi-queue group */
> +		enum xe_multi_queue_priority priority;
>  		/** @multi_queue.pos: Position of queue within the multi-queue group */
>  		u8 pos;
>  		/** @multi_queue.valid: Queue belongs to a multi queue group */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d2aa9a2524e7..5ec144c1c2dc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -634,6 +634,7 @@ static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
>  		return;
>  	}
>  
> +	xe_lrc_set_multi_queue_priority(q->lrc[0], q->multi_queue.priority);
>  	xe_guc_exec_queue_group_cgp_update(xe, q);
>  
>  	WRITE_ONCE(group->sync_pending, true);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index b5083c99dd50..45fc5bc5de5c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -44,6 +44,11 @@
>  #define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>  
> +#define LRC_PRIORITY				GENMASK_ULL(10, 9)
> +#define LRC_PRIORITY_LOW			0
> +#define LRC_PRIORITY_NORMAL			1
> +#define LRC_PRIORITY_HIGH			2
> +
>  /*
>   * Layout of the LRC and associated data allocated as
>   * lrc->bo:
> @@ -1386,6 +1391,33 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  	return 0;
>  }
>  
> +static u8 xe_multi_queue_prio_to_lrc(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
> +{
> +	struct xe_device *xe = gt_to_xe(lrc->gt);
> +
> +	/* xe_multi_queue_priority is directly mapped to LRC priority values */
> +	if (priority >= XE_MULTI_QUEUE_PRIORITY_LOW &&
> +	    priority <= XE_MULTI_QUEUE_PRIORITY_HIGH)
> +		return priority;

You santize at the IOCTL layer, so an assert here would be preferred.

> +
> +	/* Fallback to NORMAL if out of range */
> +	drm_warn(&xe->drm, "Unknown multi queue priority: %d, defaulting to NORMAL\n", priority);
> +	return LRC_PRIORITY_NORMAL;
> +}
> +
> +/**
> + * xe_lrc_set_multi_queue_priority() - Set multi queue priority in LRC
> + * @lrc: Logical Ring Context
> + * @priority: Multi queue priority of the exec queue
> + *
> + * Convert @priority to LRC multi queue priority and update the @lrc descriptor
> + */
> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority)
> +{
> +	lrc->desc &= ~LRC_PRIORITY;
> +	lrc->desc |= FIELD_PREP(LRC_PRIORITY, xe_multi_queue_prio_to_lrc(lrc, priority));
> +}
> +
>  static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
>  		       u32 init_flags)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 2fb628da5c43..3e6b356e0d1c 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -8,11 +8,14 @@
>  #include <linux/types.h>
>  
>  #include "xe_lrc_types.h"
> +#include "xe_exec_queue_types.h"
>  
>  struct drm_printer;
>  struct xe_bb;
>  struct xe_device;
>  struct xe_exec_queue;
> +enum xe_exec_queue_priority;

Never needed in this file.

> +enum xe_multi_queue_priority;

No need to forward declare if xe_exec_queue_types.h is included. If this
compiles without "xe_exec_queue_types.h", please drop that include. If
it doesn't compile, drop this forward declaration.

>  enum xe_engine_class;
>  struct xe_gt;
>  struct xe_hw_engine;
> @@ -133,6 +136,8 @@ void xe_lrc_dump_default(struct drm_printer *p,
>  
>  u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs);
>  
> +void xe_lrc_set_multi_queue_priority(struct xe_lrc *lrc, enum xe_multi_queue_priority priority);
> +
>  struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc);
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d903b3a55ec1..8ab44413646a 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1258,6 +1258,8 @@ struct drm_xe_vm_bind {
>   *    then a new multi-queue group is created with this queue as the primary queue
>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>   *    queue id is specified in the 'value' field.
> + *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> + *    priority within the multi-queue group.

Should the valid values be in uAPI as defines? At the minimum the valid
values should be mentioned in the kernel doc.

Matt

>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1300,6 +1302,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
