Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C87C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 22:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFFA10E0A5;
	Fri, 14 Mar 2025 22:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nh7srSQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88EC10E0A5
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 22:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741991068; x=1773527068;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tx/VSRKDaj3mAyQsxoTk2CjGCdyMlKyQNfsxRDcOzGY=;
 b=Nh7srSQpsjwa/VcjRCbC6kziXwxTwpQYTlzUemC4Op9pPV8UHd0/HeNj
 4JeyKN2q1JOww6x6hmH3ptvwQWrUzQqYcEdiViB6FhuwbasYqY7BLrkjp
 lJ3NW0D6TBAwyPg69fZDaGTMDTLlXw8ZOiJPyCKgKGNwQi9QLDhaRqFBK
 5KV8eqhanROxpHfgm8m7v0X+83kcACsy0qK2F9krNimHN3KQ2wY3OOOo0
 YvTHjN1isySX8p6Wjiw3RNJA7DLkXqzHHGmmEQ+UJ4G0Fa3xEy5GLC44w
 6SePxI3OrV1pKNqTC5K4DFJkz670InOI38AW9lleXE3+PSbsRhlWSSSJ3 g==;
X-CSE-ConnectionGUID: 2yeNWT4fR7WQB0dmYabhIw==
X-CSE-MsgGUID: ekK9DPrWTBqezjpJB6nPHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43335788"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43335788"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:24:28 -0700
X-CSE-ConnectionGUID: ISK7dFuCRr+kiJBYW43GeQ==
X-CSE-MsgGUID: GSEdZO/kT1iUJHWYJRP39g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121392121"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 15:24:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 15:24:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 15:24:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 15:24:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRJ38HkS+wr0wlblDbxbdC7aaVO2P7MMn7GiJD0oqIFWjBpS7F1lNWe8i4uJwyM3yVMy12KPzZ3INIsTabeMtGoxxFpJFWv8jIHHQwGb9pAG8JqSkp9jKv7LHWmaj7jr4DAfOHp+n4STcNLy994LLBC8kcWPoT9tyZYcX0rZIsTXLhNaVN3P8a8Iwp2rkMKiwtbuarDubvNPCcHK205CF+Wuc6jyDarJD3fFOVceK0Q45cKJLv9fkRRUsL+SUAr+NCc9JF5VbZ0cBwrZg8IJ38n3fFXCGlELqJuQscMhlSXmvbDo4Eo7cXnBQsfgJniVGRQ0qo22d5f5x9yezxHTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qZetT7o8CNoqn9u5S20Bg3NCGhAX8cQfzsrW3+1+Ho=;
 b=lQUdvb3gXC4mJ9FRGvkXI+wTVKGb1zW6gGw5D4Z3m71kTXpCzG1OJ0hnmhr53/Ns34HM9E1n5PcXwxxPTYcC7JOvYHMOvfd67DpDoPW+g6qzXSv/M6m+h5RNmhTQiIOSPQWbmvRNhF2O00TsqCfE9DmHVp/t9mhboZLkMpp3HaKqd+oLYSIAgAWx50IVyym7JAXHWd9cp6th2t5xFH90fMPW7G+wkOOpkeQyZVbLiRQD+zMRo+OSw9c2cdM5rlfV7ZbHkW/YcFLlxtLFk5dz/OOxsYwr+QLZBMeiUaVMCIxRrohLXKfmY+6e0sYrEGxC+YeFToextImMumfXdk3v4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5903.namprd11.prod.outlook.com (2603:10b6:510:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 22:24:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 22:24:22 +0000
Date: Fri, 14 Mar 2025 15:24:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4] drm/xe: Apply Wa_16023105232
Message-ID: <20250314222419.GD1439735@mdroper-desk1.amr.corp.intel.com>
References: <20250313180440.1393089-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250313180440.1393089-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c4d5de-da26-46d8-60e4-08dd6346f824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2uGKcRUE+vD9Gv7FDEu+WtTSVQ6vmFvXO/dqKZEJGuf3NLRFvFfckqyk+8fz?=
 =?us-ascii?Q?yVZwXvYeBgxnKPwdeWZPfJ1VwgcEDGpSvo3Z9f2YKU6D16EvfaC0q4/aKRpL?=
 =?us-ascii?Q?6X9IRq8uf7EdrHVv+HU1R8hoij901LAm7p0xZvNOsr9DIo8fP60kj+Cqe8Ol?=
 =?us-ascii?Q?4Ur52Ol34Js9ah28NJL6Cp4/k1RufIo7Ge430JQajL5ewpqValZfpOitPE76?=
 =?us-ascii?Q?0Xz6ebpn9Sp3W3TXu2PruX5U8S7FlGM5ROeNol+jXyrk74FljM34cyMi/5Si?=
 =?us-ascii?Q?hrhmwGfQKSYtSWwTBcuSkWbHce2xwjbh2bq2JKzRFO7ItLPwpBABbJLMdSYl?=
 =?us-ascii?Q?LTehU231Frc5zvgOU5eEO9NV/5PAzwK/EsmoBxxrp20AwHJn3qJYbGZoeQqT?=
 =?us-ascii?Q?pX8lTDnCywaiAvLwzQHnorr9SPdGWL1rHAI1yX87GVrxVVvNrI3m7iD1MSxC?=
 =?us-ascii?Q?K17IIk8X+qgi0ylfP8YBU0L0tf4nakIG4Wjc7zcim76Xrkm+7i57Mg9lt1YR?=
 =?us-ascii?Q?LJmu2Hr9ijGRKxIxaeeH3wfBPdE9nrGhYXFRsITEvV+W34JCgPDnAdxW+8Q1?=
 =?us-ascii?Q?GAZ6+HHCaD7KdqZolEMj7XDymNFGAqQmEyCsCezCcvGDItk4U8/u/g0uNAW+?=
 =?us-ascii?Q?Roj7WZvRMiXWRZss2DfcHv0PcGklVFzGMWeMvcgzD1F4CJf0vZjPhPgsWfsC?=
 =?us-ascii?Q?H7BUyRcZQ1LNkVA8rVeM5qYwN8kk85+c6B/SCnwBm4U61CFeI24zUcQINvGS?=
 =?us-ascii?Q?XQpR9+AOS10JMiy7Ujf3EEQSMCIow9j8CKwBNN8kFZ0FWx1VYyphqNgz0GRD?=
 =?us-ascii?Q?2HoHrW/uQUwlakAqLkYQTHEE2vorQg6By+AMVCU7s/I6AzqIChG68HvhBAG4?=
 =?us-ascii?Q?MoNDQSDahhpwl9X/dqaWfrKJ5offh6AyfV4cCOfXlqM3a+zX7X0ZDn4dn0/d?=
 =?us-ascii?Q?GVnKG5XxfQ8rf7qboXTVoyKa4LNTrGfwDKGVqSXufTY0ETBsKwN919czN4i5?=
 =?us-ascii?Q?zOUwFjL3/zq6LvCBmdG/JGarOBAMUHmhtKsHGl1XGm6rUq16ytBl8epg+V93?=
 =?us-ascii?Q?3c9zlBQe3l4nZYO01bxFDdM8CgA6jCaoOr+zzqUbkQEo3DMV99mBNGg56Qpi?=
 =?us-ascii?Q?qU25Qc9KhhPEIQ2ByP7K9Zc9y4amgloPT++43J4fd97G8+xnyvtQRX8k56lL?=
 =?us-ascii?Q?+m0ueILGjE95pS+kxc3pTvIAXUY80q/ZtDAT1IbNORkHf1K97AYDGjEkn8bM?=
 =?us-ascii?Q?jObV0AEthFS9PejXUE9m9HCS+go449lUD2L59CbwjRn14D05qviP3oomh3f2?=
 =?us-ascii?Q?3N7w8cJGA3Y8yP2b060oNQatJTjurQlF4ltybSYE0VNt1YA0A3oIUsNaP3ZB?=
 =?us-ascii?Q?22MUUY7KlDDdQPalOSGDm6wyee1o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nFQXiGqJ/y52qh/y2I4juZZADVzMHaKPsYmiswh58j12OEToZLAJQ9LosytM?=
 =?us-ascii?Q?QMYJox5fSi4og3O9W5cD0K3H3HY3zR2XnGO4alhZh/QEZwl899CZ0Y9LABSS?=
 =?us-ascii?Q?9QWA47csvs55fzjIGT2At9HEbwFsioqJbb3nuCipGL+8FsBT3mVlI/MHy/Fz?=
 =?us-ascii?Q?tF7HwRe18dXzzZrF6gX+V7KYEIqK+iJuEpc9QDwMQOzqRm/8rUG57uSzZDbT?=
 =?us-ascii?Q?045cNNEYrPfsU0KPscC7c4k5dadY6m5PrwH4GT7Caxu1+Y9B/3WZfLquNSyz?=
 =?us-ascii?Q?ZZZeQIbyJ82CEHvpm9F9pKwzZtmH9eA8O5ZwGO/4xZbvmBgvzaWwnrslZl4+?=
 =?us-ascii?Q?EsY5pEZkGiZ6X9WqOu/o3U3ePBBczrsOzK85BcDWFPTTG3Io9woGIOTCM4/y?=
 =?us-ascii?Q?ppwKxQMW43fzRYzSVTdNSz89W1lekAxl07KYFXZkopBKdZyYgQ0ymgMNAifv?=
 =?us-ascii?Q?o0p8vgD5ZIshR726O+JuanJrwpvAM1NlbaWC2j1PkODF1iHWJt0vbQH8ZgGH?=
 =?us-ascii?Q?9VSK1jIK1aW9Z9YKRZGG/5OKhpr/DgEMq4x362sHgfu/HAUNUP40Oc4HKYga?=
 =?us-ascii?Q?PsIJ6nRhspes0rA13HHYN9OfDaUsm9njxKlPNwU1Ir48wXLFZpYk8CZIe5LT?=
 =?us-ascii?Q?uKQAEhfBfyW2GyCQm0LTn0luKxka8dBVJT5gP3p7v5Xb2vF7auK6D2j1orhS?=
 =?us-ascii?Q?S00GF2Bkb71s0RQ5ZDSlUDQjFD7r5p55s2YmFXxC3ftPT+Kd4ytCZEBMqMHQ?=
 =?us-ascii?Q?SS/SSrOuNd840mM1pr6XdoIwDszQ4e+RE815+wl6nCvl/gvQXO33ywV+im8b?=
 =?us-ascii?Q?EGmrOTd/nuAZko45NS3pHQ6Vm+d3VkCsFP1BAvEt17wRL6y4L5+0W4wB6pG+?=
 =?us-ascii?Q?XBiNsQSlJkqOI7nepjZUlQ9VI2NZapIMW77qgFW9xgPVpD1S8AX0Hrlwsegn?=
 =?us-ascii?Q?3voeJGjKJH/iuLr4FsMjkNieGYgdzT7vs0hf41ebzOAgpAWSAa3+0xRBqZxh?=
 =?us-ascii?Q?kJuQma9jFGfIe8+gfuTWgC9HPxWon1gTuCrVJaCROwOYyquZSbnokX36FfTj?=
 =?us-ascii?Q?eGGX1kXGVbqWvF3XqKbCXcuqv48Z1zD+JbgkILfYSu/gDEkYHSK347ylxjsL?=
 =?us-ascii?Q?0XqCtQF4+I3nzsu2Sk2f/qC02PWbtpc2yiLE95ixvwElsicOKBAUOCDZdA52?=
 =?us-ascii?Q?6QRB9JR2LUukCet5Jj6CE9AS1XINjMPN/+qC7tP1iq0qM5AwEL+5m4SWVgmT?=
 =?us-ascii?Q?4d1SneE0FBdOOCXD1nUOtPPHgVxskqmlvqy0qckMKdd48r02mmwU7lTQJFG0?=
 =?us-ascii?Q?Un01lHNeec4kiHKwfvagNOi7enKaKl0dtE4ggfQnAgu8P4atV+DO+rM07HcG?=
 =?us-ascii?Q?FFV3KiJImS6xP7/jfLktAMXagGdp4uxUnAMT5yxBMzmTpvE2Nct7Kh+pH5ko?=
 =?us-ascii?Q?IgkcxypnuA1wbT+5i0fhv19j8yk5RDRQzGvZ9hxJhg/CTeL2afn+9vFou/sB?=
 =?us-ascii?Q?/KHo824qy5I+ulnNf0Y2a9EI9zdUgP/L+v7sy4XJSU+wtx0qMW4X0gwPjFlL?=
 =?us-ascii?Q?zV522n7NGJbWinrYDdgNanLiM90ALPWwlEBF7UpI7K1brS30pc74TODIoOF2?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c4d5de-da26-46d8-60e4-08dd6346f824
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 22:24:22.1169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sMKjBeGzsEB8RbQAcLRd8/6KDIMVQBzZHgoj2qr/x825hXlUQXwXkTB6KYwYpwf8IC3EtaWynMB0W58FaFhiUaqqUXlcLbCSJGALJ3JplI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5903
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

On Thu, Mar 13, 2025 at 11:04:40AM -0700, Vinay Belgaumkar wrote:
> The WA requires KMD to disable DOP clock gating during a semaphore
> wait and also ensure that idle delay for every CS is lower than the
> idle wait time in the PWRCTX_MAXCNT register. Default values for these
> registers already comply with this restriction.
> 
> v2: Store timestamp_base in gt info and other comments (Daniele)
> v3: Skip WA check for VF
> v4: Review comments (Matt Roper)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_gt_clock.c         | 36 ++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 30 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c               |  6 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
>  6 files changed, 67 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 659cf85fa3d6..05658ad991f4 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -130,6 +130,8 @@
>  #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
>  #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
>  
> +#define RING_IDLEDLY(base)			XE_REG((base) + 0x23c)
> +
>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>  #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index fca38738e610..f493b1687851 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -16,27 +16,41 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  
> -static u32 get_crystal_clock_freq(u32 rpm_config_reg)
> +#define f19_2_mhz	19200000
> +#define f24_mhz		24000000
> +#define f25_mhz		25000000
> +#define f38_4_mhz	38400000
> +#define ts_base_83	83333
> +#define ts_base_52	52083
> +#define ts_base_80	80000
> +
> +static void read_crystal_clock(u32 rpm_config_reg, u32 *freq, u32 *timestamp_base)
>  {
> -	const u32 f19_2_mhz = 19200000;
> -	const u32 f24_mhz = 24000000;
> -	const u32 f25_mhz = 25000000;
> -	const u32 f38_4_mhz = 38400000;
>  	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
>  					  rpm_config_reg);
>  
>  	switch (crystal_clock) {
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
> -		return f24_mhz;
> +		*freq = f24_mhz;
> +		*timestamp_base = ts_base_83;
> +		return;
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
> -		return f19_2_mhz;
> +		*freq = f19_2_mhz;
> +		*timestamp_base = ts_base_52;
> +		return;
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
> -		return f38_4_mhz;
> +		*freq = f38_4_mhz;
> +		*timestamp_base = ts_base_52;
> +		return;
>  	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
> -		return f25_mhz;
> +		*freq = f25_mhz;
> +		*timestamp_base = ts_base_80;
> +		return;
>  	default:
>  		XE_WARN_ON("NOT_POSSIBLE");
> -		return 0;
> +		*freq = 0;
> +		*timestamp_base = 0;
> +		return;
>  	}
>  }
>  
> @@ -65,7 +79,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
>  		check_ctc_mode(gt);
>  
>  	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> -	freq = get_crystal_clock_freq(c0);
> +	read_crystal_clock(c0, &freq, &gt->info.timestamp_base);
>  
>  	/*
>  	 * Now figure out how the command stream's timestamp
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index e3cfb026ac88..7def0959da35 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -121,6 +121,8 @@ struct xe_gt {
>  		enum xe_gt_type type;
>  		/** @info.reference_clock: clock frequency */
>  		u32 reference_clock;
> +		/** @info.timestamp_base: GT timestamp base */
> +		u32 timestamp_base;
>  		/**
>  		 * @info.engine_mask: mask of engines present on GT. Some of
>  		 * them may be reserved in runtime and not available for user.
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 223b95de388c..4b8a54c16ac7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -8,7 +8,9 @@
>  #include <linux/nospec.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>  #include <uapi/drm/xe_drm.h>
> +#include <generated/xe_wa_oob.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> @@ -21,6 +23,7 @@
>  #include "xe_gsc.h"
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
> +#include "xe_gt_clock.h"
>  #include "xe_gt_printk.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
> @@ -564,6 +567,29 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
>  
> +static void adjust_idledly(struct xe_hw_engine *hwe)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	u32 idledly, maxcnt;
> +	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
> +	u32 maxcnt_units_ns = 640;
> +
> +	if (XE_WA(gt, 16023105232)) {
> +		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> +
> +		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
> +		maxcnt *= maxcnt_units_ns;
> +
> +		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
> +			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * maxcnt_units_ns),
> +						    idledly_units_ps);
> +			idledly = DIV_ROUND_CLOSEST(idledly, 1000);
> +			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
> +		}
> +	}
> +}
> +
>  static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  			  enum xe_hw_engine_id id)
>  {
> @@ -604,6 +630,10 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
>  		gt->usm.reserved_bcs_instance = hwe->instance;
>  
> +	/* Ensure IDLEDLY is lower than MAXCNT */
> +	if (XE_WA(gt, 16023105232))
> +		adjust_idledly(hwe);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
>  
>  err_hwsp:
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a25afb757f70..24f644c0a673 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -622,6 +622,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>  	},
> +	{ XE_RTP_NAME("16023105232"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
> +		       GRAPHICS_VERSION_RANGE(2001, 3001)),
> +	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr lrc_was[] = {
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index e0c5fa460487..0c738af24f7c 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -53,3 +53,5 @@ no_media_l3	MEDIA_VERSION(3000)
>  		GRAPHICS_VERSION_RANGE(1270, 1274)
>  1508761755	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
> +16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
> +		MEDIA_VERSION_RANGE(1301, 3000)
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
