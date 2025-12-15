Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F57BD5B170
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 17:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBAC10E642;
	Mon, 15 Dec 2025 17:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKakmKBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F6E10E642
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765819811; x=1797355811;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4chGVfhiu7UE6MdpH1QwWUM882z3j36XRIc1zWCB+B0=;
 b=kKakmKBtzhGJMLg/erITwe24ToOKrQLFiIA3mjN9U72FiFE6UHrEwIXj
 aWgEnahDPimqdmoqDD4rch6bQhqvS3T0Gx6B8a2AdQqijStqW+KoVaDD/
 kbDJa0nEqADuDh1v9Db1jascbz7nWVSUa/HnwfRYgS1DVRCa7w1WM/iqU
 HUODS5w3yH6TbiaoD1yMTNNFGopc6izXUn41r5hYW15UHbd/1Jvl+uD+A
 7nV/7fJ+Oc+/M/ZlBUVEA+SSNIlJaoAGLp+BT4Lko2Ua6Vwb0hcnCfvMX
 96QpiiPY1vnDlnw5/SF+abHb+381Xb16SMqxzPF9pYn6hQPL/D9TkKuxK A==;
X-CSE-ConnectionGUID: tQ4ZV38dS1e14t5Pqop/pA==
X-CSE-MsgGUID: MjnT1kXQQSWfT3tafmssiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67762482"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="67762482"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:30:10 -0800
X-CSE-ConnectionGUID: 5DnrxEcOSimtYfvUgnfH0Q==
X-CSE-MsgGUID: 5PdI2ka8QQutLyDYiCUjKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197774899"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 09:30:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 09:30:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 09:30:10 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 09:30:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgYJIhj0mbFhyCHyMR1oDTV2D9RH/Lqxb4/Rm1LFBMg31c1AlP3Hdklchxubpo3OL64BoLe2A/+UkBp7xdfpTKaiWtGWs93GFBBNXmGPPC4BAtPVIhyOmw9s+4Gh18d4CLU1RRLVBNoZ0tbo2YR2aDvePTNa7W7OecGPXEwvDtoskL52siZsgmbtWc1orF7GOWbWr3veXxlxgp3WB9sFBDtO5KrD9CzEqUnYz0TBstwaEG7lS8MebTref35T3otue9enODzDbrEPf2mdBdghN1loaXaihjuplYc+DfUec7MODYvHelWlZRETJL2LItJ0lcljVGjD2hi3WSxKyz6wXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYPf2s7aNSv5+HcS6c0XPS05J0F5mSV5MHOS6IoTLUI=;
 b=IJS1ejo/2TJAXpUb+AcKYjIHerWGor4v2agLsf3VGm8FoLVqqCvcpZl91p2PpZcxzMP0gjma5oM4kF4MWhVNiSBLU/FwncNF6iOUXaSbQYcP9Tx8FUK0wxhUElntPLe3D9g1I1Jf9KeRsZXX6wiakOm/zauiHTkg+H6LV6p1aBpw1y4Bms/huhsmGJToy+ICnEjVh6LIZlZL3WWHKF++6qXUE7P+iXPiAl0SpT6HuzHNZMS3kl1twLMC6MbNn4Ikg0pvtz5xKLbhYPc2rkV3L285A0EWESX7Bf/bVZPTx28PnfEgrRHiGlyUB+NyKfL/HKx5YTzGVRE4s1nUxiWS4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:30:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:30:08 +0000
Date: Mon, 15 Dec 2025 12:30:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <Michal.Wajdeczko@intel.com>,
 <matthew.brost@intel.com>, <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2] drm/xe/xe_guc_ct: Prevent compiler read/write
 optimization breaks
Message-ID: <aUBFmxDVaCHKn8Eo@intel.com>
References: <20251210174412.71084-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251210174412.71084-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:a03:338::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b5b902-68e8-474f-bc2e-08de3bff979d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PBNlrygVHdUAqIp1L8b5vY3uXYJm37gNdzsUZWvA+DvnYvRXQBoAGNeSNRfm?=
 =?us-ascii?Q?+MXYWkGyE9b7KGqaWUm2HFJfh1/wc7wMCl9KyscSajoQ+6tfggZAkTBJNVLR?=
 =?us-ascii?Q?WLw46R1f7urBHk1DA1sn/41LfhXu5a6Ia/iHlOrFAgKdIHDRGm8ezFiCV3Z5?=
 =?us-ascii?Q?3oIHvsCliv8aXpX12owqpDABvoPjG+kp7w+v7FnQPh2NnJL4YO9jfvAECkZj?=
 =?us-ascii?Q?sLmts/TVHVv/pj08QiKNicp11mtPVsaiKyxcoF+CffehqB/cBMb1vxpvioCh?=
 =?us-ascii?Q?hF71LPcQlxiC8LEx9bR9MCHH1o/RIrkSdXUBvPwsDf4in12IEQTyaKTYOjSI?=
 =?us-ascii?Q?4kT6yxTWc86NBqEPVR2OX7jFC2IPuZQZT37063zOD+B22sqVTFRU2lxOxwdf?=
 =?us-ascii?Q?/73/16w0xf91jCa6cEVLMUNZvGD2kyfTBbLcUHZbIJ2ELZynHfU5MuI9X3qy?=
 =?us-ascii?Q?/kwFC3O+J94uay+c+jXMUXk5HOmaYi1X0m0iWcluOg0+8IY76XRIkf/ekoCr?=
 =?us-ascii?Q?PV94VXW8rfmT983GMzqeajwFpEGy4p5WfzrDRKjOiHY4YRcauImXBFkFlYBT?=
 =?us-ascii?Q?JbS8rt3TLs6LFB0XwDIWUMNbCphBmb4Hn6ysPc/kkMKeDniFumH1xpETvFGC?=
 =?us-ascii?Q?1snWfIW73nUTJjrPnmL0G+Jx8HWKjKi89caLy+K60ufVsH0J7PFoObP/oq5O?=
 =?us-ascii?Q?ifIayUsIOLhMIpHSLol5Rl5qwpB00oSVLuRIuZX4IwwHULTCe2N0JsKdE146?=
 =?us-ascii?Q?XIRhdz5kVVEWrN4+EZzbx2WhzXSLYoeXZDnXHIgFh//aVWo1kHC7Zw7h4HsT?=
 =?us-ascii?Q?hB8OxpjjQb0oJGB12l23HSOh/xaQHAww0F0Zmcyuz+QZGuKUm+n5BiHG5/JF?=
 =?us-ascii?Q?BV6SFrAV9ZX8tzwdrvKSUYf0VcdP/DTS5P2Cd6J/q79AZRT4wVXQi59bjfAH?=
 =?us-ascii?Q?zV5W2Qt6lSSXBplsypOx44PVeU9zOiAIybtDy13qwzULiEHmL4Zq64kltB23?=
 =?us-ascii?Q?nu65TW6oTvCn5tRM4dZ8roYnORJ1Aek4cmVaBu6vG/IoG7eApjRGYPU6Z8hW?=
 =?us-ascii?Q?MkJYtNOwdI4A4Zw3RDGo4jEojBD4mxNSNItoAVrxAXRODVvX7DXB+aCEdqss?=
 =?us-ascii?Q?AVHy6qO9BmLKAhQbwf6nexsQtVlT74FKM9niEhVaRETgFZM7IVRDnhR4kBxG?=
 =?us-ascii?Q?88zJiZJp2A1K2KIzY8MJwum28AaOAIcRIpmQYNMhYn/JPSrdtgKJuZ2TSL81?=
 =?us-ascii?Q?toVzY33aVt8iFdFCgI2zkCB+wIiTxl1glE2RRjl1d6VPwYwcuETbioFOfnWs?=
 =?us-ascii?Q?EaJMm2uHZkC7tbQHKaA4tJA0ETgWAzKiKcFfgmvdpFQBrQOPfk7PCs9bSIuO?=
 =?us-ascii?Q?J50AkdHy1svLkR3DfEcUh2deYsSXytB6Hvb+eW1EiIM5UiwSG434NZ6LhmbR?=
 =?us-ascii?Q?iUPUZNy2EsLiI8pI1EuZ/bY7dTcp4f8f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EKC2PcZFwV6j+nau4IJQPRQQBCAeY0DSo4ignK60JAWlsAS57vKVGwE+HySF?=
 =?us-ascii?Q?Vj31gzZJyqknv0/PUmjIsI255YvNPlHoDESVqA6Zh82biwvvSksO37gc7Mts?=
 =?us-ascii?Q?0gu+VwoJSwZ889chPZq3OUj7JzNWCNS5UZYMloCuX+4eS+2GZzPQaicx69hK?=
 =?us-ascii?Q?H6L917V1GtJ+qHUvC30YJxxRJlL4KNFFx49H9fPcce3wPQZG814voXZA7ZLP?=
 =?us-ascii?Q?dZ1W2GyHfuN6CRdQ+56dEiXjKS6ClVOVLbmf/ohbf4VOagVaLNjaRKWY18+V?=
 =?us-ascii?Q?YD/bbRI0IyPU2uxKm8r2pYXdKS8yz/5VBPxMjznnHjYRmu3DnEPX8N2FoYWh?=
 =?us-ascii?Q?7DCqNkNDpTvjH5kXRf46kP6jRywapv816X1+xuY08MEnUPtYZip6N1X7GLGn?=
 =?us-ascii?Q?MrWrwo7Udlbj5Aqf7ishn4SSHgQY+G5Qrz3Ltms1l7XWhoIjEcDknaQGZygd?=
 =?us-ascii?Q?XOo4Tj3VxfUoPI5S+mfqOEg+FIEtlmzU8cet6+DSpo0LNNTnoekO/A5BDXsi?=
 =?us-ascii?Q?QXTty7tfroIJu+5hOmQfRkBMG/ex0V3XedlJ8iojh4Bkly6K/KglXCw5lgGd?=
 =?us-ascii?Q?YR1/KnFPkme+iGy9U7LdIW1qz2RH2iaOBOa5GV/qlWdM3YXmEHwR0YVVCMC2?=
 =?us-ascii?Q?KU+WuHc0kJSzjh2yIskuezZ54qn2+H2J1prmxkMP2qunOJZqYXmB0ILDs1OB?=
 =?us-ascii?Q?Izr6QikUFOLlc97aG1VhOSL+MO/eO+Dz8u1ikCbcrAlq6bpSMK/TgmaNZyxW?=
 =?us-ascii?Q?sr9A5miS1fjd5F32aaMffGKAWejl0SQDSqWWiZsmU85jb0XT6+krWue6RhN3?=
 =?us-ascii?Q?ZoFveudUlzU9M85OOSinY7scmPfB5nMRPYEZU8ctwDkfJi53IHElZX1PAJ3J?=
 =?us-ascii?Q?F2jJdAjEMfm6hY+3gFZrJQ0oFbCkKiDBpnVOumkkWJxn5Fa6fKYZlo9lC0Kp?=
 =?us-ascii?Q?AZLSa06yDAg0tGcbbnVPQSNMMVBhAz+utWDwKY2uFSWTgfEluvTMY1i4t+si?=
 =?us-ascii?Q?TH+nwFYE9tg1nEkHsxicqXR/fuGe5R1/RB9U6/ObWL0JEsIT0NptYdeYNQgH?=
 =?us-ascii?Q?KwTdZpH3XYCBhJXZWNHc69UbKr8kAJGnFpOP743gijlut+RllQAruJ3WNlUn?=
 =?us-ascii?Q?kB8HT70ZCEZOrYw3REJQk6JTnrKDKkW+fxP6ODpfhPhxKg5iX4YatQS4Z9p4?=
 =?us-ascii?Q?xOWaMj6+eXWtJZlRga+mZYwJz3A7C8CixZY5l4RxcJPWv7knNn+DXkLXmO1f?=
 =?us-ascii?Q?t+EZ4FwRfYDgP6nkhSrVL6Im+N1EjyldoQF7mRGCycU7kug1N/8Y6OdxMMVf?=
 =?us-ascii?Q?Qtby4FF5KKHo7g+8Lt73Tfj3cli8Onfu4l2TymSAzdhJkXypQ+vel3/kcYz5?=
 =?us-ascii?Q?HKbju5n81SkqHCrvedCtDB9rrG0/fSmfY/qdGlm2oN06VhyMw6UDgIta/1Gs?=
 =?us-ascii?Q?ykVDE/1wdg15rT/RXyclG5Y7abAWTBmeZoebpP48rFfjtpvUorvkpZyr8Kwg?=
 =?us-ascii?Q?JbDi277hlXs+Y8hFKcbCN4pxOOI3TATMVHWYJLKg5BTkne+Z71SggqWgaSsL?=
 =?us-ascii?Q?D6auzyUytnq/nuNSo+dmTrEpmbLcGw4wthtG0GzC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b5b902-68e8-474f-bc2e-08de3bff979d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:30:08.2684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzMJ8zvoUty2tWZnZtz0Hwybj/VLylqc2ZjJqcm5u9Afgt20m7UiXx2NVuobBYKuVYOaQYzOqXcOc/AhU6ilDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
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

On Wed, Dec 10, 2025 at 05:44:13PM +0000, Jonathan Cavitt wrote:
> Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
> g2h_fence->done values to prevent the compiler from ignoring these
> necessary operations.
> 
> v2: (Matt Brost)
> - Add Fixes tags
> - Add comments
> 
> Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
> Fixes: dc75d03716fe ("drm/xe/guc: Add more GuC CT states")
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Fixes: 0b93b7dcd9eb ("drm/xe: Fix early wedge on GuC load failure")

I really doubt that a 4 line patch is fixing 4 different patches...
I believe the important thing here is to identify the original patch
that introduced the wrong concept, not all individual patches that latest
touched that line...

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++---
>  drivers/gpu/drm/xe/xe_guc_ct.h |  6 ++++--
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 648f0f523abb..4ee628fe34b9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -206,7 +206,9 @@ static void g2h_fence_cancel(struct g2h_fence *g2h_fence)
>  {
>  	g2h_fence->cancel = true;
>  	g2h_fence->fail = true;
> -	g2h_fence->done = true;
> +
> +	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
> +	WRITE_ONCE(g2h_fence->done, true);
>  }
>  
>  static bool g2h_fence_needs_alloc(struct g2h_fence *g2h_fence)
> @@ -527,7 +529,12 @@ static void guc_ct_change_state(struct xe_guc_ct *ct,
>  	if (ct->g2h_outstanding)
>  		xe_pm_runtime_put(ct_to_xe(ct));
>  	ct->g2h_outstanding = 0;
> -	ct->state = state;
> +
> +	/*
> +	 * WRITE_ONCE pairs with READ_ONCEs in xe_guc_ct_initialized and
> +	 * xe_guc_ct_enabled.
> +	 */
> +	WRITE_ONCE(ct->state, state);
>  
>  	xe_gt_dbg(gt, "GuC CT communication channel %s\n",
>  		  state == XE_GUC_CT_STATE_STOPPED ? "stopped" :
> @@ -1496,7 +1503,8 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  
>  	g2h_release_space(ct, GUC_CTB_HXG_MSG_MAX_LEN);
>  
> -	g2h_fence->done = true;
> +	/* WRITE_ONCE pairs with wait_event_timeout in guc_ct_send_recv */
> +	WRITE_ONCE(g2h_fence->done, true);
>  	smp_mb();
>  
>  	wake_up_all(&ct->g2h_fence_wq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 5599939f8fe1..8d318b094f33 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -30,12 +30,14 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  
>  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
>  {
> -	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
> +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
> +	return READ_ONCE(ct->state) != XE_GUC_CT_STATE_NOT_INITIALIZED;
>  }
>  
>  static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>  {
> -	return ct->state == XE_GUC_CT_STATE_ENABLED;
> +	/* READ_ONCE pairs with WRITE_ONCE in guc_ct_change_state */
> +	return READ_ONCE(ct->state) == XE_GUC_CT_STATE_ENABLED;
>  }
>  
>  static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
> -- 
> 2.43.0
> 
