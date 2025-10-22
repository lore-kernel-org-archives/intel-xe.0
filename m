Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A0ACCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 15:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFB310E169;
	Wed, 22 Oct 2025 15:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mut4jm8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45CC10E7F9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761147089; x=1792683089;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=npK78QNxge7YOtko/HovAOXN7P+y6p0TxEXnzWOL8BE=;
 b=Mut4jm8yTEcVW8hXPRwRiR9fLNRO7UwO+gjMZBlm79YWqFA/7wc9DIpL
 t3P7yxCtJPo/ZbWCbfF4E/Qwkd0sa31Nq1w+n+j65xK0n/5MFovur4YRN
 Fh82i0azzQ/uek0tMiidfg6Y93A5ce2r//YQ2vMWF+JyvkIm2tIFdHrEA
 trrYA12MyKCJE1mtWUTCI6h4QFtxfxpysNo32Wtjq4FSMcH3O4PgnhDhf
 Zl2pktTUjp4DUkEw3ZSyvD31eRDS6KnOJJ6o5t9WAgWYtsxrV8f4hzjim
 57Z6JsV3ZeTb+cQLSph6PU6xcTmHe+UiHtakkDnXFp02TMDUcEeLiWye3 w==;
X-CSE-ConnectionGUID: PSDMwuLkRM+MwIvV+P9r+Q==
X-CSE-MsgGUID: uT74+JRpQVS8KKIx9ZC0uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74739028"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="74739028"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:31:28 -0700
X-CSE-ConnectionGUID: 5cocNuDbS4iaU0jARBY2QA==
X-CSE-MsgGUID: 89imPIEJTUe5CmDwW8wxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="207569095"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:31:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:31:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 08:31:27 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.71)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:31:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wT8BVt8l4yJ9wHjK7P1E/LYxmWsqXWdFuzTrjKKjCLpLcV6gQkOvb3pntbQD/JHfXBDX6wBz7nZvAn9ldMZu9EHXv2SH2pKQoMI0tJgl0SqfjOs+oI0B+EESkrJ34dpU12aKIKrY7SVgrL/O0+R5/6L9inbfiG28gtcbNh2U0Z8CfnhIyo19ogBTo0D+MUcoqN8sip/aUvWJ00edAeexOpRna9MYNibjuw0FCXkDp5a7mPZpoBgSoXcTnyUykHD1cd+tVDOaX/tK6+QCZvK+QLy590NpihnLG68YhmzAUPvbqFpZ3f0e8UIU12HdpvSWcSA+oU/Ial3a5iJ/u+5FWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qadyPzqNsNCGJgsIm0ladtboQKbhqP0B8qNUo7tUFkA=;
 b=fUhDRaVWow2wfB8x4BI5nlkN7kca8g5Ba0XleUQvNUgEanr/7SMdXpTUghenrXNS95BdSZ7tNYTZFRdUjKMk2Xzl0Pl4COhZeIWpoe5+TsoznYeicHlh6lUo14nf1i4JSIwYzxKRN7Bewk+X9cPXiUD5G87RlT6sB2DREUlz25MXRhHtLpJCT6fPlRwtzm0Q7LkvcXIzQ+cI5a9heHKb0adm3MqAdPTcRabFHgSe4ET7gS5X1d8/eFE9gi1fhJwIruoKY+M2iZdl73veGE+tGSW5PE6NOhKiXM39TcfVZ+5w3ko3FRu/kVEOUI404N9bilIWh/llFFoJIdUHPmEXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 15:31:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 15:31:25 +0000
Date: Wed, 22 Oct 2025 08:31:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v6 2/4] drm/xe/guc_submit: Bring back pause/unpause()
 helpers
Message-ID: <aPj4yh3hVTi12BEr@lstrano-desk.jf.intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
 <20251022094246.3584785-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251022094246.3584785-3-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:303:8c::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4575:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6f1a85-2297-46f5-27ae-08de11800fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tMQPEPCQbhzYyH4j0EaazOGI9sdHAIsp9Wk/ZiuZbebiK8S/C3em+XEfIUui?=
 =?us-ascii?Q?Vr6SlD3l0yFE9PqE+WPa5qN6DJ0wzCImP36LzaAK7CSHBUBzqjO7v+nDDQGM?=
 =?us-ascii?Q?aY3a/kWXSomWMtOFKUJG9jo1xmps9nMohlB76iXOO1KPbAm0WMqm8X5/1rrM?=
 =?us-ascii?Q?6ymH6dJJTpxj7wp2VFZ8pnAQDrdXlCyqq+jBMZeBaM+v8FZ+65HLHL8DTBxV?=
 =?us-ascii?Q?SKAVpW5vq2KG4suqFvNcUfBfg2kjY4LUS/c874oipwUfWi0Icg6sPRL1Myc/?=
 =?us-ascii?Q?bxzKsBdgoos2uGxLGaEwKN0xUJqAvadlFIJvAq3+D5qtphfeMAs3YCgHF5Ve?=
 =?us-ascii?Q?AZU2UcUMIArCuNppmce/Wx/JQgOHx/0qVSgCL+leO6+HKurH5Pm1y6I+1MEG?=
 =?us-ascii?Q?RFSXIpllsSBAa1pBgGFUDZljOIMzozaK8Z+8rH2q5But5/dqTTU0+5c/ui7M?=
 =?us-ascii?Q?d2hefI5aFFoFcib/OIiuTlfh9HZxmKrc2yDPH8+VpjE+tkboOkAByctsMixk?=
 =?us-ascii?Q?zpf+aKqXR/bS8k1R5wotJiYi+/iHw1zVRIbrLB/HkhSMCsePO5sFdIPNRUHn?=
 =?us-ascii?Q?jTIq26nJikergVieAfO4O9Mnt9pZLUN7J0yznmuhkf3t74KE5t2BMIpMvmv7?=
 =?us-ascii?Q?/7P3E5l5xyNd7tixcaBGxgyPriDQzk9HERXm6Xjyia32ML53nTyZcmJlLYxY?=
 =?us-ascii?Q?gGVyLNG8B6WAZFsQJQ+Sm7D3bQAWue6XWIx3kUW+C3p+3NJTHJ1y49R2DhkO?=
 =?us-ascii?Q?NyNguL/Fp5KXeCtTEtHMUL5Tmo6KVEtWvgIQqNWx1ZVHnf61K+UEk2BoHgum?=
 =?us-ascii?Q?7wH25bAsIS4LzYkp3AusYjn+LE5/o7wYXKgBdO+4gKUdUVJrIkeZFJkWtrqi?=
 =?us-ascii?Q?9MHY7vEyRVBPrmIgNdlq5ysrpURXKHwfLz9d6dV2v0KZpa8xiVNtB+2v5pfb?=
 =?us-ascii?Q?CFSBkYgkNEs5JAWBg5oYVaqICUE0TaC/jbbM0lkDalqBMkbS8fY8YI25MO+B?=
 =?us-ascii?Q?iv/L8f0NVcJ3S8ISUPCyGP5IArCwJd0yGn19SUwI64O3QTYKlA8ABdvyhjkk?=
 =?us-ascii?Q?l+8KFxHEYKO8UAiBzfBQINYscC+TvyNhXU0lyUvb1tt/t9KKVayp53uZ1Tv8?=
 =?us-ascii?Q?+BqjBsI2s8wMIz4cR7cs8Y5O32z/cE1Qtgn0jhMDsIPF57lcffnjCWZc2iVb?=
 =?us-ascii?Q?twx+crTqa89ARDr4p/UZ7zGuPNBORYdAGAY5WTZzB6xWbks6qpgBNUcpEn9j?=
 =?us-ascii?Q?tiJHa3kitO5v+2d01zaPzXelUC/71OxzWLOMVepdLeNaj7u+ew+M+1XTndTQ?=
 =?us-ascii?Q?G41eStPLrUEVpSklGDVx0k0f2wlvAJ4TQP++i3YyHt8GtwgV7HRp8gVywXOU?=
 =?us-ascii?Q?7hu1Mq8b7LopBvvGa0Bap8rgynUPWbNZ4gFsxHu57G1ffIp3e0APNfLv2E8E?=
 =?us-ascii?Q?XOFhpQMw3cw/aMoTu9npSy0zI4cmygsy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nUDAjO6+PFAj54nqBMiqGv8wyq1bCF24/Gv9B0H5PKYVMv4L4slqbgaXBht6?=
 =?us-ascii?Q?aGjtigNo7Vk1FK81XPcty/F8XA5D7zf9mj6hYah9C3oUt8ml4j4a2kx3mflG?=
 =?us-ascii?Q?Xv5wCRmf/huxYdPdEqzQJhYBqt8IFLeK/X0ICWp/9/TMWLtkhblgY54+EkBq?=
 =?us-ascii?Q?UygIkNHxPK3oxc3F3QBctyNev8V4bIe5XMvly+/wgfv8Q/QFLp1Ukh3P1X0u?=
 =?us-ascii?Q?jriDixvjjq2uHqNSffFZJy9D842KzUoLiBNGEdv+ucRo9O8wGV38jbG/o139?=
 =?us-ascii?Q?+Cu9lwivSxkW0qjLFpWgvOhq6wNARNVjU6ib7i/2DVpwjmCOvJ2GF7l76+RD?=
 =?us-ascii?Q?ZAIi3vPYHQmk/1rklTiv8tjQRSkcn/WmpeyG/Gev6EdzKTA7Yx7ac6YYUCWt?=
 =?us-ascii?Q?B1pERvZAvLq+1IZl5F4felJ3P6b9VCB2bwn0sKuuWYQpX/AruhKYvwc48v4e?=
 =?us-ascii?Q?KVjgVVD+uJzN5IkSMaHOqq4UUpASnxuazok5KCUTWBeeB+j3cmiqyTXLHRp3?=
 =?us-ascii?Q?TQmOnz06Ac4mKhKVUQ6zJAbHRIjP1WVboGMD2zYSW12mVZC6tmiDzuO0lYc8?=
 =?us-ascii?Q?at0jjT/NKovd8dC4yuo7yHnYUE8QZ3rUoIKntlNU/jGsfEMAn7Nq/EQAwVrH?=
 =?us-ascii?Q?CqgwHaE3k9cuPFFGTZ3rCt6S0vVvVrEjHUumIdOsuhO/jnhyr8lqqyBO2aeo?=
 =?us-ascii?Q?4dXTWXK5votKxW4ycvli/sxIlYjry0LpQV3h7YjBFPa+pguU4KXNR8PnXGmt?=
 =?us-ascii?Q?qFYx45Cf2qIO5iYbwQaGFpgalGR32Xs7UbvFa00I0ZWgtGFNAhfi/TFLwMow?=
 =?us-ascii?Q?rLf+ecbjW2gQyhoKZh5Vtv80NNkOlweLRVGSAC8SyCRQyNIZjTMJA6SL7qpy?=
 =?us-ascii?Q?Z2fqJ0IDBXWW2F1wo0xTcaoI5JTnVQnOzdMH+UU527BsBMOHwINUfnEreMkW?=
 =?us-ascii?Q?lWcfzsR379cX0hMxmuzrhT7wCEUhb7zV1//uRaWnZsku5lKxCHcp9L8PJRR7?=
 =?us-ascii?Q?ITt4CL4+FF6wR0GtMNYDx5UpM5ZND3K2oboZQ4Ja7FtG/S3RwmSXzb3o6gvo?=
 =?us-ascii?Q?WLtX1EXPUif22KEh6+QQXgqAWT08H0xKghqTIbzEuhe/zjY1gQq5MsGgI6wk?=
 =?us-ascii?Q?zpgkyyclL4/Ni+nwnrTqGribxahpvpUEy+L7XJCR3vsjkEXRW9JV29YIgLVS?=
 =?us-ascii?Q?SpwFtlZ1EfK92oY7WvmcaJC/qC7QQSGQbhT15npZ5zf6asndeYZwxAnX9Ekp?=
 =?us-ascii?Q?PesGnts1vL1HdHXWPs0ApeKb9RIrNb44C8ZANUmbHnpu4cenHFwa9Y4B74rJ?=
 =?us-ascii?Q?fRGWR/vIUBXXvNqX6zAnl52VsfRJl5gDVV6nhaQFljjW8CT7H6yZIyfb6yW5?=
 =?us-ascii?Q?USTKaKsgDVZP8LEvHKL7CWa6pVJ1mglbggXJOxxAog98tUZ98MAAi+DLEoYD?=
 =?us-ascii?Q?aaSNLGAQlQPAWIjOrCaw7ygOKplRC4OKmv6e/7juman2ytgE1gUx1bgQOCN1?=
 =?us-ascii?Q?fPjfxIEGBkgS9cz1F3zsaBNyBiWePd5XpfLKVxpwbhlHFGpU1li1OpDyz4vi?=
 =?us-ascii?Q?BVKfyizvRxQ01fDh6u5ZVHhrMSJEvYzE+0OJlPMTBAa6YP+VHmblwcYSGJAy?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6f1a85-2297-46f5-27ae-08de11800fc5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:31:25.3309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2nrOmS5ayn3ePGmJs+yBV7s9dqC3e6oaBsNzwcRR3HC5olJBxgov0OC/faZkRfSJqMs4soxX6zOXJukKGsRVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
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

On Wed, Oct 22, 2025 at 03:12:44PM +0530, Raag Jadav wrote:
> In preparation of non-VF usecases which require stopping/starting
> submission on GuC, bring back original pause/unpause() helpers.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

I'd reword the commit message to explain what the new functions do,
why they are needed, rather than referring to previously changed code.

Patch itself LGTM.

Matt

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 8fbb6b27095d..62771d5c1d91 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2161,6 +2161,21 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>  	}
>  }
>  
> +/**
> + * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> + */
> +void xe_guc_submit_pause(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_sched_submission_stop(&q->guc->sched);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  /**
>   * xe_guc_submit_vf_pause - Stop further runs of submission tasks for VF.
>   * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> @@ -2333,6 +2348,21 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
>  	xe_sched_submission_resume_tdr(sched);
>  }
>  
> +/**
> + * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be enabled
> + */
> +void xe_guc_submit_unpause(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_sched_submission_start(&q->guc->sched);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  /**
>   * xe_guc_submit_vf_unpause - Allow further runs of submission tasks for VF.
>   * @guc: the &xe_guc struct instance whose scheduler is to be enabled
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index cb5cc2cc9497..8057a4b71ff3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -20,7 +20,9 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
> +void xe_guc_submit_pause(struct xe_guc *guc);
>  void xe_guc_submit_pause_abort(struct xe_guc *guc);
> +void xe_guc_submit_unpause(struct xe_guc *guc);
>  void xe_guc_submit_vf_pause(struct xe_guc *guc);
>  void xe_guc_submit_vf_unpause(struct xe_guc *guc);
>  void xe_guc_submit_vf_unpause_prepare(struct xe_guc *guc);
> -- 
> 2.34.1
> 
