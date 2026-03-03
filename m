Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51F2EDEBE0
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 18:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632B810E8A2;
	Tue,  3 Mar 2026 18:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dE5bV0oP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0352810E8A2
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772562889; x=1804098889;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SmRfbPtJGR8S6XjuKZRk1bGM6ye5H4fpnsqlhNxJkhM=;
 b=dE5bV0oPi86Mc6jc5Bcny0WOJy5IFW1WVb9CB4eu0qn73tr9//bHOCY/
 R5vzzQ3O4FoJ1+GX3MehEiLzGvohq+5pG2Dw3JXLD/3Xk1Xy9p2KSkuPA
 PqBSLOh6uu2TLt5wJxeSHYhW3vDXPbtF45kBnPxkf+VM8RNcPaEiOw0wd
 jrM+57Wsnld/QXPDR65wB5szivDFwH2w8rujD32gY5XjhUvrkT0fa9Mct
 3k+w+PK4NCTTB528eSW7aQtKE+5I6jZnIRopCirE74KbWe+9J2ZcVr0Z2
 0DkIjbq2kHKSvjJS6BY4Kv7AQbAJ0pvS0QXOvrHIanrQwc6URqwngIMWS g==;
X-CSE-ConnectionGUID: I5Ksv+nIT5WVQ0i3OJSxTw==
X-CSE-MsgGUID: AueukXLkQVWthgRLQXfSKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77458261"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="77458261"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:34:48 -0800
X-CSE-ConnectionGUID: rFUCcY4cTRezSVWz/Dn2jA==
X-CSE-MsgGUID: A9lVHQjVRveN7fZtII72eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218210174"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:34:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:34:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 10:34:47 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:34:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYRCH0T4aEXCkxGkxIrJlEhRP+fh9qGgnLOuze26lQnyMvv8+rdolFkCSWeF6ppp2MR6oTlemgukZCY/I3bR/aVWjZqor4NqvyPfcxYRNLhIc1/nTCf0pU9ek9k1GVIq4mEwzgpfs76sZir/5oShZPUfbO67Nc9dXtEAzi0Di9fow7GiAlllel+TzpjlyaLBipuVwnlwxYpHzUQPfqW2JzGAAoFmSbemZQcViLKM49feycwUQs1GebqIr8Mj9KH2d7pG0Tm5KrKFxuajvULwGCFL5zC6NVsI1CxYwv4FyncDhlKvtWJYt/4zrOATGgfi/NqXi1/E2tBynol1uKCZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ON0HWS8JxrBcBQsEoUdqhWj6hSe6LPAZ8Tafcvg6jU=;
 b=fQ4ZokD9LnvU4ZfN5FJybZmY3/p25L/eI5iI2QDsxxzs3F8GTKJl9uIJ+/fHVBSyxKmTTWVDLjt+i3be5+cCjlzgR/7I7fiVoib65BXZ4YBidEs1qcLB2GcozhIRTqZjZovu5DFwGjVsMabaBmEBophO5qqIA0jyWOm8yr0DXednKQPMBrgLyx1hSlj+R43xkuJEjZec6fVPp5rAg/8dsn8sDLeRALWo/4sxFSUyKfk0qHQQkHoKoyImWWKaUnL5oohqDjV2g9tNytalUDwPh+J4V0gSXhWivm2PJRe4IDKafmBXrI0IZ0eGIG068elHvGa50HBUfwaCMv1Xr7ApwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:34:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 18:34:39 +0000
Date: Tue, 3 Mar 2026 10:34:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v17 5/8] drm/xe: Export xe_emit_aux_table_inv
Message-ID: <aacpu4pMPKCYeZXV@lstrano-desk.jf.intel.com>
References: <20260128101333.37765-1-tvrtko.ursulin@igalia.com>
 <20260128101333.37765-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128101333.37765-6-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: ce551a79-d368-43cd-c8d1-08de79538712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 7FyMhC5f51ckrruypmzioNvrsBZJ/1ncGqkYTdTm6f4PJb0nzXEe6Jt0fEL8GvosoPHYlk8ACQU76RGYvnK27abG90p5zHXIYx0RD7VeUaFxBVfdoWNct7X8tZfyJjya+aUbtqZ42SCWXJlnEtgri1ZnH+ruGXqmgiV+TNLbrU3sXHPwnWCe/Rab4wSfku4CDlL+/rKhQEexIkmPRxO3aLccTyU7uVyaVN2K6y886eteybe9WE64DG++YbacQ6hFePU8MgJ06f24b/jeTyQKShvkaVbseEfZIYClkn85XiBSUIsscVU8MsmBxQxqgD+snKvqI6Y/izDsN8ACri91VwWAb6ArYQqKvPfRK1gPI1J04kuIiWHlt4SfxDnbzL3PZzCCYlKjna3JZFxWzL7IMSXqJKNcv4QyRjhrJYWU65QaT29s5piafBtoLqNG0OA8M87dlUq2r1rmSLPRoZwMCiDBzhQvpmdCIEaX4Cjv/ipMR7UFbpXBl7uguKNe/eJR0tWmUfKvv9py3KR/nONKuT9PNYssB5FTsGmFyvuuqBEwr3zPm2yPJkJEDb0lgzSJXtKYV6R14p43UJZyMnCVg8CBvGhHHfB2kCoBAfzgcyosj/2GnOFOU5yXOgNlVPKEf8JEL2Rnd3DgQ2A3FurgTmmxL7yXohTQJgUVMCeWCGBZ83Wi4DL8GfX/G3+g8wwT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTNFajdib3FscUUzeWh3VUh4eFNJMkpNU2JEckJ2VVpQN3pWSjFXdy9CZUdX?=
 =?utf-8?B?SXdCYjZaVG9IQ1BFQ3I0SzFSbDY0cTNZZE50b0ltdWNydkkxci9YNU9iMU5W?=
 =?utf-8?B?Y0Y3RXoxcUEyM2RVbjBsZnhadVRYVXVucVJGcG9veXlJWVRBVTc5TGVUZUdY?=
 =?utf-8?B?em4zQzJiUG0vL2FFZDkyUE4vOGtqQlRSYURucG11Nlpoc1hIcFRVMlFKTEc5?=
 =?utf-8?B?VnpJK29NbGZ2bjNjRUdIN1dibDJKV2NUSXMyMHh1V3AyRGdEQ2NKTzFMc0Zy?=
 =?utf-8?B?cWRYa2NlbWkzc1hvWEM3TVU5SDM2bUp1ZmFaeUZkRDV4NGwxMDJRWWUyS2kr?=
 =?utf-8?B?U2xkVXYxRzhmOHJTbTY5VVhyL1FrNTZsSTlXdFM0dXY5Ukt3QVdTdjg2eFcx?=
 =?utf-8?B?UjFUSXpQeVdtZzNMdHNFTmpPK2FKa1ZsdzFGWnlKZUpuK3ZlbWJWWVNYRU9B?=
 =?utf-8?B?MVJoYW5OTWhmL2wyNXlmWmdDUTBjWkptb0JVU1QrYkNHM21VNEpSeGFjenRR?=
 =?utf-8?B?UlN3eHFtZ2FFQ2NLeGtGOG9JTnJTRTIzcTZKVlR1bTBjeHNhTmw5UHRIV2Ev?=
 =?utf-8?B?TDZ3ZlFLSzJqalQ2eG5XbUVkYmIvNlRGTUY5ZVgyNk9EcTNqSktITjUvRmVL?=
 =?utf-8?B?VUxhSHZCL2dpL051QVZ4K1VJZXRiMVlPcWFRMlVneTJHa2IwOUFSdEk0UitX?=
 =?utf-8?B?NFFFQ21tR0pkc0JrV00wM3o0UE9SRDdXZERkc0Jvc09UV3gxNVM3eVBTZ3RB?=
 =?utf-8?B?dWM2YmJKVWE1TkhUaUU2Njd1VXFzVnAxWVE1L1J0T0lrOUFVQmdDMGhNUDdj?=
 =?utf-8?B?aEkzTE9VcU9qQzdNVVdkWVh4MTY0Z2ZHbmhQdTBSRUFjRE82RnpTNGV4RmdR?=
 =?utf-8?B?VmpBYXpWNEF6ZGcwNnFlS2JDWXJBcjYxSUEvNUNrdjFzN2MzN2Y1dXFhTVUx?=
 =?utf-8?B?YXdabk5OK1hqdHpLNTlXOW9QTzdOOHM1dS9kVitER2FpU0hMc0JER3hXSFdX?=
 =?utf-8?B?K2QwQzNvVEczQWJ4M3RPQ0tmZGdhd2NTclp4R2ZSSS9LVStCUlJEeVgxZkpD?=
 =?utf-8?B?S2VFbXhDVXhoWldDODB1ZG5jZmdCSHc1dTNpaGxxQjlkYlhJRVRsWXdMMkpI?=
 =?utf-8?B?MExydWE3d0tmTnlURFBGdEdJVm1ONzBmMG11ZWZ3S3EzaWd0Z2VFSzFNS0h6?=
 =?utf-8?B?MTltYzlYK01wOE52blYwZ0RhYk9YaVhGc0VVZUlFRGFZcjVVZ1EzSXE5a1d3?=
 =?utf-8?B?NU9RNHhKLytBcElwMTM0QjFsR2huSWtzMVc5STI5VWlzR0wyVzFCY29TZ0ho?=
 =?utf-8?B?NnZVODNZVE1MZVZDcXBzWWh0c0xmbE1LODF3TmNUK3RBbTg2OWpzclNUWGw2?=
 =?utf-8?B?YWVEMHdrMUdKeHZxZE81Qm5sMDRoZUEyQnhUOEY5QUZmN1FraEtwbUR4bFE2?=
 =?utf-8?B?eUV1eGhKQk55VW5ONGhkTWVDLzEyZ0crZjRHRnJlNkt4cWZzSkxmRG9LOWxv?=
 =?utf-8?B?V1loSGw5aUs3MTFVRDZYVm9jZENQVG5zTTRpU0FRRnM1Wnd1eW5GUHZrR1pp?=
 =?utf-8?B?QVoyaW5GbHZVTFJodEZKR3pHYzB2YUlocDFlclR4WGErQjRKNEozZWtDQmN1?=
 =?utf-8?B?QjRSMjJjOEI4UUxUbW5TM3pPNmVIOEhFbTlnUnBWQ3VSZ0tIT05ySkZySnpw?=
 =?utf-8?B?V0pjMTZTVmpOcEtHaFdCRVJlZG9lN2JuSTdrTXMzbTNGNnpjd2ZHK2VsQ1VK?=
 =?utf-8?B?NzFGMSsyeWVJVTJKR1lIaWdaVG5BY0VUM0NWVVdYNDlvWDBWTlIzTHJwQ2lv?=
 =?utf-8?B?bzdxbzZFUEpVQk9scFVjeEVFQ3Z3VkloNVZGZU9EbzRMeTh6YnRqc1BJQjlX?=
 =?utf-8?B?YTV0WTFkeHNJcHp5Z3NxOGlvOFVoZkJCMUlIeFk4dEwrNG1GdHNNcktUeWlW?=
 =?utf-8?B?NVVnNWR3S0ZCNUZUNVhyZXJFOG5jR2J0Nk1RenkyZ3g3c2dvRVppZXRUQlY5?=
 =?utf-8?B?TUx0c0c0SUdxV2djV1l0TUNFblZmR29wTzQ2MHVsQWoyL1BuNHM2SmlHVlc3?=
 =?utf-8?B?WGpGM2hPYi95aC9Jc2FyTEpHSEVySFRqazhZdnpLK2x6TUJ6OEhMUnQ4QWV5?=
 =?utf-8?B?MWU5bzliZUYydjlFbXRkdm91VWIwTGI5QllNeGo5K3J5cGhhaUtqRVNSeTVq?=
 =?utf-8?B?UWtDK2NUL3R0R2x5cjNuZkFKQjRtc2t1V1BZblZWNmZubjNUY0FvWG8xZEt6?=
 =?utf-8?B?cWlCT3JNazN0Wk1oTytqbjNVTXJscktIZlgrWW5GWXpIZnZFWW5WVGlBMExo?=
 =?utf-8?B?SjVBTWZOWkFWK21STXEyMmxtU3BEY3k1R3RRaTB3TkZtVDh5cEJiTHJhbFJt?=
 =?utf-8?Q?dgbeU5Kot2eO72XU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce551a79-d368-43cd-c8d1-08de79538712
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:34:39.0199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nD+1h2TEE9yVLZVNFSHVTGvKqGI++1ggxBRyxMtqWylEWGTwrZA246PTmCW6A+OLBKv9P6+k/afCsWcCI3hdsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
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

On Wed, Jan 28, 2026 at 10:13:30AM +0000, Tvrtko Ursulin wrote:
> Export the existing AuxCCS invalidation ring buffer programming helper
> which we will need to use to setup the indirect context workaround in the
> next patch.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 67 +++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_ring_ops.h |  3 ++
>  2 files changed, 48 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 9867a316c12b..e6ecd70618c3 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt_printk.h"
>  #include "xe_gt_types.h"
>  #include "xe_lrc.h"
>  #include "xe_sched_job.h"
> @@ -48,22 +49,49 @@ static u32 preparser_disable(bool state)
>  	return MI_ARB_CHECK | BIT(8) | state;
>  }
>  
> -static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
> -			      u32 *dw, int i)
> +u32 *xe_emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *cmd)

I'd prefer not to export the ring operation helpers directly as
functions, or at least not from this layer, as that opens a huge can of
worms. For example, look at the i915 ring operation helpers and the mess
they turned into—this is exactly what I'd like to avoid.

I see three options:

1. We add a xe_ring_ops_helper layer and stick this function there
2. In the next patch [1] we open code the ring programing there.
3. We add an emit_aux_table_inv vfunc to 'struct xe_ring_ops' and call
   in [1].

I'd strongly lean toward option #3, with three vfuncs: render_compute,
video_decode, and video_encode. We'd also need to split
ring_ops_gen12_video into two distinct structures. This results in more
code, but it's structurally correct, avoids open coding in xe_lrc.c, and
prevents the floodgate that would be opened by exporting ring ops helper
functions.

Matt

[1] https://patchwork.freedesktop.org/patch/701228/?series=160748&rev=1

>  {
> -	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
> -	dw[i++] = reg.addr + gt->mmio.adj_offset;
> -	dw[i++] = AUX_INV;
> -	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
> -		  MI_SEMAPHORE_REGISTER_POLL |
> -		  MI_SEMAPHORE_POLL |
> -		  MI_SEMAPHORE_SAD_EQ_SDD;
> -	dw[i++] = 0;
> -	dw[i++] = reg.addr + gt->mmio.adj_offset;
> -	dw[i++] = 0;
> -	dw[i++] = 0;
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_reg reg;
>  
> -	return i;
> +	switch (hwe->class) {
> +	case XE_ENGINE_CLASS_RENDER:
> +	case XE_ENGINE_CLASS_COMPUTE:
> +		reg = CCS_AUX_INV;
> +		break;
> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		reg = VD0_AUX_INV;
> +		break;
> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		reg = VE0_AUX_INV;
> +		break;
> +	default:
> +		xe_gt_err_once(gt, "AuxCCS invalidation not implemented!\n");
> +		return cmd;
> +	};
> +
> +	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
> +		 MI_LRI_MMIO_REMAP_EN;
> +	*cmd++ = reg.addr + gt->mmio.adj_offset;
> +	*cmd++ = AUX_INV;
> +	*cmd++ = MI_SEMAPHORE_WAIT_TOKEN | MI_SEMAPHORE_REGISTER_POLL |
> +		 MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
> +	*cmd++ = 0;
> +	*cmd++ = reg.addr + gt->mmio.adj_offset;
> +	*cmd++ = 0;
> +	*cmd++ = 0;
> +
> +	return cmd;
> +}
> +
> +static int emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *dw, int i)
> +{
> +	u32 *start, *end;
> +
> +	start = dw + i;
> +	end = xe_emit_aux_table_inv(hwe, start);
> +
> +	return i + (end - start);
>  }
>  
>  static int emit_user_interrupt(u32 *dw, int i)
> @@ -324,7 +352,6 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	u32 ppgtt_flag = get_ppgtt_flag(job);
>  	struct xe_gt *gt = job->q->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
>  
>  	*head = lrc->ring.tail;
>  
> @@ -333,12 +360,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
>  	dw[i++] = preparser_disable(true);
>  
>  	/* hsdes: 1809175790 */
> -	if (has_aux_ccs(xe)) {
> -		if (decode)
> -			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
> -		else
> -			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
> -	}
> +	if (has_aux_ccs(xe))
> +		i = emit_aux_table_inv(job->q->hwe, dw, i);
>  
>  	if (job->ring_ops_flush_tlb)
>  		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> @@ -403,7 +426,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>  
>  	/* hsdes: 1809175790 */
>  	if (aux_ccs)
> -		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
> +		i = emit_aux_table_inv(job->q->hwe, dw, i);
>  
>  	dw[i++] = preparser_disable(false);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.h b/drivers/gpu/drm/xe/xe_ring_ops.h
> index e942735d76a6..5a2d32f9bb25 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.h
> @@ -10,8 +10,11 @@
>  #include "xe_ring_ops_types.h"
>  
>  struct xe_gt;
> +struct xe_hw_engine;
>  
>  const struct xe_ring_ops *
>  xe_ring_ops_get(struct xe_gt *gt, enum xe_engine_class class);
>  
> +u32 *xe_emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *cmd);
> +
>  #endif
> -- 
> 2.52.0
> 
