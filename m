Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B605CCF9F8
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 03:34:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C6310E078;
	Sat,  8 Nov 2025 03:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IycRNUqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBE410E078
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 03:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762572866; x=1794108866;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z/LVnlWU51by//jItRoYx4TfuTdyGKA8klDyGoUkI4U=;
 b=IycRNUqow79H7iRGws2Cap25a8d1i6ATx8kTtoXRlz6T6QNnxaN3JkdD
 uwphooQELbTWuMdumNBvqLTVsyxaicd+7NHPNln0Ggf6iH67mzB4qcclo
 3e6Dwu/PlbYqtogkM9UfiJNSgEEiropb14lkTDY5KK0lbNMq0hOlkC/yA
 B0PMmipNdGfGc6MLAFC7j7qw088pDcgn/CB4Y3kCkBFBHBcspkwXpPxpk
 +IwgnxoLJq03K/NRen68GSwXQzDCz+TzugkEEk7GZy/minfKiN6CkobE8
 NJI5/MtWU/NWcdgBRvYrw6ec68OqEPn940hD3QYFMkjUpdpMW8+m5FsJX A==;
X-CSE-ConnectionGUID: XB2oHMgFS/O2fmCc3daH8w==
X-CSE-MsgGUID: yMxzv4CERiqck4N8MV0Guw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64637289"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="64637289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 19:34:25 -0800
X-CSE-ConnectionGUID: A1B7yen8RdSV/U1rTVsE+g==
X-CSE-MsgGUID: hKjOLG3+SQiGM3uGU07v5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="192572878"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 19:34:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 19:34:24 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 19:34:24 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 19:34:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dhs0f248UZ9EqMv0iiNQ94Ij2spJDG7L/oBJGCDumX5hGaWPJkH/LXzb0eChUS+uuUFSclnX39Ql/20ampTwPzBolTHSDQW+Htd/IUzhNw+vaW1O02jNjX8ugT41SKAaeXPzhBo1P3ZJKU4lGly7XVnIbgyujNBJKqKCtVvqIGgV/ATy7fXdlpN5r21k/c8elCu6qrOpkFGDqlnntqKiAfazkmWkn3QwS3OY5XwQ16LVuBxvdpufMDHYCITEprpLcO76JTUV/X8shuJumbvCqXkzyWQvzcdgDXxyOp4hL3RmP5XG1nDtzyQ8laCSBoZ7mROXcvk8ygEPxOvX+8eqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L30WKl/J9epdV7X73yFb5Y6iv8UkoyYywGMbW6GG+Jk=;
 b=gZA7aQSuz6NedTpQzO4v5FEFrK0RhXTD0rO1NcaOGNngkZnC6U4u2LJ8FqUXIfKGe39zqUCSA3J/w3S16Zpyq6ISrl5VFaE0FEP7VR3xd5VUXYSByyzpeX+uhR4pZNFCY5zm99UJnmWlio/CZJMiISjuq2HmEYqUUabpfjgefscaip+Z71q6lQy+hGvrdE02P7OU8fpp2JDqf/GmEJ3GwSRjIYZLI9zqEZBu0hLRiJOWITTF0cv1qkVhjkNCZ876GvWkcW+tiVRdSHXjjIwd5nLpKIg9/O8iraAyu8MQU03m+4QlY2KOlke6TP89hRvLdmePe0GsEFt4oKDqH+mukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6980.namprd11.prod.outlook.com (2603:10b6:510:208::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 03:34:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 03:34:15 +0000
Date: Fri, 7 Nov 2025 22:34:10 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v3] drm/xe/pm: Enable WAKE# support
Message-ID: <aQ66MkE7o8hwNGKK@intel.com>
References: <20251105145010.428268-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251105145010.428268-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d97042-c84f-4d34-6240-08de1e77b0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pKXUVS/JpG9erq00Ik8Ih3b9BBfMxlVXHinwCda0BoPBzHa0p+QY9KBOznB/?=
 =?us-ascii?Q?WVNdLKEF1OQ1afaEx0zntBA/sBPrLE5oY0xKJfTZzo2U9N28m1hzWZUmlM6j?=
 =?us-ascii?Q?/EGAjjrw5RjqNwJmVE5EUx/aHvILjyDfDtsi2RDOsRxcUmBowN7VS0ZYgc3A?=
 =?us-ascii?Q?8QzPOpBKxExqJvb2+UyrRSVwSfpj0iBw6zHRxaIDWXDOf9Hesqfq1wqGv2RW?=
 =?us-ascii?Q?w/ufUDj/9ah/Cg4+hP/VtNMm64ta99l4pdRfJVMhQSyR/rIihYer0G268DQZ?=
 =?us-ascii?Q?AoDC5vzhV3973+9uq4pYGuERAKMCeeBgWmQOF0R2Xb39jMFPSl+nmems4KVk?=
 =?us-ascii?Q?4UQJ2xYXOmRi3vR5jKbBbEtXYBSpF4J+qdd4KrzrlWVaz2do2XaYFzFN36XX?=
 =?us-ascii?Q?fzUo7kq95V3hr9dNFQ5fYcMtvKD0V5nb7mZnAwH2jRp75DQ4eqBfQ6QYOfi0?=
 =?us-ascii?Q?x4CWafy0Hi6Ebm5uOalEYO4/3eASQHqXpPMGj12uqTxoojgihwFW2jFQygHs?=
 =?us-ascii?Q?DGQI2rW4EK3UiHF4ljH9oQUHSKgYevVoy8lMbZwBX4CWXaIyehH/qfsq6lvM?=
 =?us-ascii?Q?ndMp6y3TJpbwl99Jw+eh9PeocGVTTaCd/2MmsUrjYQy0DOEIekgbPsK4ZwhU?=
 =?us-ascii?Q?CMInhkkCp1kWgcUgJgODn4mVMGNPx5AS3OeTMtGlPosp1TMoDk+DjRbOu3u4?=
 =?us-ascii?Q?m6YMbPj5p2IGCPOFWjJkOas6pkCne6UqFcph1tSyyyEp/YVpTGtOwJWP2yZn?=
 =?us-ascii?Q?sfMMn/aDhY1XvO0ObRr6cU6FG9j3RTZFPiw6LhfSP6j5f5YaVPfnYoHSKyce?=
 =?us-ascii?Q?qX4qLdNav87LM21OTIAJfVgRsD+ElX5wOnE92y9bLxJ4Ud828zMeWW6H6+yZ?=
 =?us-ascii?Q?b4y+TD38C4YX64Eh5zFQxQe7sEZz0Y4EYeCA6ESPtRY56xB5Wk9E3hl1FNOS?=
 =?us-ascii?Q?U3R8NATGY5h8c3jIC1kmCFLZZD0EZSMEv2//87Bhn8zd2N7mg6wQLQk1OMmW?=
 =?us-ascii?Q?fBqaMm5F+iQjzit9fQee96gMWxFE631IdCc2beFtk1ew9fL/I09GyJn6alcj?=
 =?us-ascii?Q?32KeM5Xgmdd/afojG5OWgoP/KzwCH4Z72spKtZPeotyB32wj60NGkUEWnZDI?=
 =?us-ascii?Q?oC4DJB8H7OhUFi5DaQE0JFZoJY8FKUQZA1kEe86c9oH5eBhU7Fk1A1ecIecg?=
 =?us-ascii?Q?BWkjw/oFPh+dUVilv/Aw3qczmfO7A6fC4L+faF15X1J/ctPSGcLPpRyuhexD?=
 =?us-ascii?Q?OxaPdK2EsP5Dzxj8LXMyXrGkiO5Pm0E9DCj241YKMQm8oZd3QKlxZDqIPIiX?=
 =?us-ascii?Q?L+5IpqRYMDuqnPzubqBnsY5sHai/AU9hKPSSEht0MZrUCaG48cVud7xiZjQ0?=
 =?us-ascii?Q?WiQ8R2BvxSqflVPOI3Zwoi3n9XOUWG2JWpy1QU6Zst6PlFyz07X7Nc6O/6kZ?=
 =?us-ascii?Q?GiBQe19SQEFJavlLXF0lWTDcfGJ0J6Z+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oFxHai6J4M7Jdo9kUMOt/8u7THCxC5J2z1JphVkcE1QGoZVHj1rwuUOXFPG4?=
 =?us-ascii?Q?47VVtv3lyq/iEvn+zLU1ekZPg1DPHisJ7qzxNa3+3jrJYfxPbX9Ur43rLpKz?=
 =?us-ascii?Q?KEAsAwOo8KAKwpvhx4xn50q/DccRM0emTLLemzP8Ca+dxneeQMPi3QmQ6ovW?=
 =?us-ascii?Q?ZqMLY3tYESzw/rYto5MyDIc50X8KG8qkUb+4FYrCyOF0wWrC6c8geS1WyOcm?=
 =?us-ascii?Q?PSRT6EhuaVRBcIwC7IGYaA0CZgX9J0XdGmnro0sgHcqSR1V/utBcfnmlXnlx?=
 =?us-ascii?Q?PUcMm3o64yMGzQ2w04FH/vYYG8+pkCNnjVzBYOer66VY77fs51ekc6YKmAsl?=
 =?us-ascii?Q?W3OpM4+C2O5XdllSRRKQI56+Hbu07HgRBFhr6PPx7OV7nAa62wHo6mOx8j9Y?=
 =?us-ascii?Q?o1bOxpA0qWs5crRQoTlj38ZhGPAlYNbzPi7AVWhbadVXlCCyeNRU6Cv+KXSr?=
 =?us-ascii?Q?xSjAZ2rnAtHnql18eRMpx4adCmvxpQYeYV9B8jZ7Uq4j4M24mvIFCOj+SWM6?=
 =?us-ascii?Q?gcO/yyh9efOrvyCelGUody+U+5u57ZkVAvgjxCGDQze4bHlUE796ATnNpPj8?=
 =?us-ascii?Q?VuIyhRmJ5KDKPP/A1q0PkVaHBQiVUfuGsn62a4OE5u4+FxysmEwMSyG85/qi?=
 =?us-ascii?Q?lfMDSZglMFM1qqSiaYnE/Z5ca8nVv2t+k8X+bkOG4JlorBJ5z0Yf6sOg3lhb?=
 =?us-ascii?Q?Z+Lrz6y/O8vDswqibN6n6Nhlv0cWrxXy4u7U1Qn8BUmvYRzHbl9YIreQVK3u?=
 =?us-ascii?Q?OdHYi5mei4v6gnPbUK741Mt5KPQCVxafam3vF4FLDRD0Pthrfu+sa1L2/okD?=
 =?us-ascii?Q?iigcMXb5ayXaTyOjTgvbybIfXsPIR1f8ktB4zqdm2FKJSwfBQZU9DO8LCa0o?=
 =?us-ascii?Q?li4aD2evdlrEaAuA29uIIqQy2c0uvBVB5md1MLSo5OWNU8or0n06fybXKFSF?=
 =?us-ascii?Q?JjeWMc4ImNpa4/Xn4ng7vWul+PpyJ5RKxWaf0PTMkNo05/n4lIr24gErymBP?=
 =?us-ascii?Q?44fHSqbJAwniBABFo5WeMcYwnBBs203VlRWjGLm7DoMBzgkxcwusH19MA/JX?=
 =?us-ascii?Q?zjwdZPl3zDgF2TmI/I9mBjjq56uY1KTZHHmFbMeN+U/D94wIlI+M9NN4s308?=
 =?us-ascii?Q?ESfuJF68PK/mk4fQu2lhV2lhzOJvCATBxm0Mb1k2iBLOrFzmrhSZ6GQsjVD7?=
 =?us-ascii?Q?2SK8ZdNCsCoFzdw+F1+yBHjAqc5ec6p1EH2mW/G3ymJAwhCmVozMwujR8Z+s?=
 =?us-ascii?Q?3c8AKACSzMWlU9lCAiQDmbZyTn3Ik5N91JZjRT34ObV33anBUl+/DHlCBj7g?=
 =?us-ascii?Q?9FdHgTxHua4BiuxfMAGIigbSBLKoEuEYNxhCzhAfFNmS6t366RwmTAzvmx9e?=
 =?us-ascii?Q?Ij56hQSk+XWwYLO4Ja75mldUroQtpT/wHfIQAO7i4Qq7HIWL6C0060xPgBae?=
 =?us-ascii?Q?H2KzmeHt3DS1BDDlAohxEF1LbbKNI5hJprvnzVNHXLljObl7cb5zGRmr7G6d?=
 =?us-ascii?Q?VyAP8VcC2ayzk/ug6tuGpk5/hkkVo7nqmB21BPSKhJbCADtC0GKpXn6BcIhK?=
 =?us-ascii?Q?ZcnpKvnyXJE/21wgmMVyOPiL+osmFjPPrHDcLBekq6ntQmHJCJgq+ZhhSQit?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d97042-c84f-4d34-6240-08de1e77b0c6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 03:34:15.1837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GD9Ah5mFX/xRvWXWog1Qs+y2E4IHgHuw7MQOk0JhqnraFBDfUk1FnZYfS96glPhkCjcXJ9JzE0GrpC5QmAauBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6980
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

On Wed, Nov 05, 2025 at 08:20:10PM +0530, Raag Jadav wrote:
> CRI supports signalling the host through WAKE# pin on smbus alerts
> while in D3cold. Enable/disable this feature based on device/host
> configuration. We also take user input into account in case the user
> wants to enable/disable it from userspace.

I'm sorry, but this whole patch still makes no sense to me.

Let me summarize what I am seeing so you have the change to correct
me or provide more info to show me where I'm not getting it:

We are reading a capability bit from pcode at init.
we stash this bit in the d3cold.wake
at **every** suspend we set this bit.
we never ever clear this bit, but we continue setting it
on every suspend.

Why?

Why do we need to keep setting if we are not clearing it?
Why can't we simply set this once at init if we know we need it?

like, read the capability, check our i2c presence and set the bit
and move on...

where am I getting this wrong?


> 
> v2: Make wakeup helper static, drop d3cold argument (Rodrigo)
> v3: Expand commit message, drop defeature on init (Rodrigo)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  4 +++
>  drivers/gpu/drm/xe/xe_pcode_api.h    |  5 +++
>  drivers/gpu/drm/xe/xe_pm.c           | 53 ++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index a03cc83aa26f..602849fcd3aa 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -528,6 +528,10 @@ struct xe_device {
>  		 * Default threshold value is 300mb.
>  		 */
>  		u32 vram_threshold;
> +
> +		/** @d3cold.wake: Indicates WAKE# capability of device */
> +		u32 wake;
> +
>  		/** @d3cold.lock: protect vram_threshold */
>  		struct mutex lock;
>  	} d3cold;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 92bfcba51e19..3f8d43c1b4fe 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -50,6 +50,11 @@
>  #define	READ_PL_FROM_FW				0x1
>  #define	READ_PL_FROM_PCODE			0x0
>  
> +#define   PCODE_D3COLD_WAKE			0x5A
> +#define     READ_MODE				0x0
> +#define     WRITE_MODE				0x1
> +#define       I2C_WAKE_ENABLE			REG_BIT(1)
> +
>  #define   PCODE_LATE_BINDING			0x5C
>  #define     GET_CAPABILITY_STATUS		0x0
>  #define       V1_FAN_SUPPORTED			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 7b089e6fb63f..94a0b1c9acc6 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -7,6 +7,8 @@
>  
>  #include <linux/fault-inject.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/string_choices.h>
>  #include <linux/suspend.h>
>  
>  #include <drm/drm_managed.h>
> @@ -22,6 +24,7 @@
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
> +#include "xe_pcode_api.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
>  #include "xe_sriov_vf_ccs.h"
> @@ -161,6 +164,29 @@ static void xe_rpm_lockmap_release(const struct xe_device *xe)
>  			 &xe_pm_runtime_d3cold_map);
>  }
>  
> +static void xe_pm_set_wakeup(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *root_pdev;
> +	bool wakeup;
> +	int ret;
> +
> +	/* Currently WAKE# is supported for I2C only */
> +	if (!REG_FIELD_GET(I2C_WAKE_ENABLE, xe->d3cold.wake))
> +		return;
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	wakeup = root_pdev && device_may_wakeup(&root_pdev->dev);
> +
> +	ret = xe_pcode_write(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, WRITE_MODE, 0),
> +			     wakeup ? xe->d3cold.wake : 0);
> +	if (ret)
> +		return;
> +
> +	drm_dbg(&xe->drm, "WAKE# %s\n", str_enabled_disabled(wakeup));
> +}
> +
>  /**
>   * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
>   * @xe: xe device instance
> @@ -205,6 +231,8 @@ int xe_pm_suspend(struct xe_device *xe)
>  
>  	xe_i2c_pm_suspend(xe);
>  
> +	xe_pm_set_wakeup(xe);
> +
>  	drm_dbg(&xe->drm, "Device suspended\n");
>  	xe_pm_block_end_signalling();
>  
> @@ -422,6 +450,27 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
>  	return NOTIFY_DONE;
>  }
>  
> +static void xe_pm_wakeup_init(struct xe_device *xe)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	int err;
> +
> +	if (xe->info.platform != XE_CRESCENTISLAND)
> +		return;
> +
> +	err = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_D3COLD_WAKE, READ_MODE, 0),
> +			    &xe->d3cold.wake, NULL);
> +	if (err || !xe->d3cold.wake) {
> +		drm_dbg(&xe->drm, "WAKE# not supported\n");
> +		return;
> +	}
> +
> +	if (!xe_i2c_present(xe))
> +		xe->d3cold.wake &= ~I2C_WAKE_ENABLE;
> +
> +	drm_dbg(&xe->drm, "WAKE# configuration 0x%08x\n", xe->d3cold.wake);
> +}
> +
>  /**
>   * xe_pm_init - Initialize Xe Power Management
>   * @xe: xe device instance
> @@ -459,6 +508,7 @@ int xe_pm_init(struct xe_device *xe)
>  			goto err_unregister;
>  	}
>  
> +	xe_pm_wakeup_init(xe);
>  	xe_pm_runtime_init(xe);
>  	return 0;
>  
> @@ -602,6 +652,9 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  
>  	xe_i2c_pm_suspend(xe);
>  
> +	if (xe->d3cold.allowed)
> +		xe_pm_set_wakeup(xe);
> +
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
>  	return 0;
> -- 
> 2.34.1
> 
