Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE99D1BDC4
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 16:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D32310E47F;
	Mon,  4 Nov 2024 16:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiZp1Ydp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208C910E47F
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 16:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730737758; x=1762273758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fgo01hOTN/yV9r1hM5ioflPPLzobj5AVJ/kvji1Dn54=;
 b=aiZp1YdpZ8qhPblGr2cqIs0kJYc4gV+1PMiEXg1x4R6uLToUQzIX2iwJ
 a/3wOzm8CoFczPcgMyvlBsCj7qwVb0wfQFVH6hmaNH/MZ1NNzUVo8iNQj
 +XU0CxV4Kho5JEdTD2a/sCxNjEuFfaDib5tF0N1Nwd4M0CxlhSRsZKgYQ
 LD2ejaqilxsc35n6gQlCPH1xWdmmbRkod9zgJX3+pmxuEZ/Ctn3HHRKMf
 eusPO/g425+d3DnmBIAd2HlqbN+7mCCifMf/YUTpasLx2n7sNQ11Tz6Yf
 x23ZphC24dzsTS1Kx72KZg4AvlB9iRe6dKxFUuPn3zaJLLR32CaC7qsm1 w==;
X-CSE-ConnectionGUID: 27lQ+prHSyGoNxjdtm1NHQ==
X-CSE-MsgGUID: IFJUkbQQSZeC+joTj7ZNAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30624500"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30624500"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 08:29:18 -0800
X-CSE-ConnectionGUID: mh65YskLSgOvw9HmIfgudQ==
X-CSE-MsgGUID: WpD14dE0TlqGkQoq0j2uOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="84143097"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 08:29:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 08:29:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 08:29:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 08:29:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=px8uBhHkmiqOVLOC151GyUxBk5sbzfgy3Zf5UOpC73eGEKwC+9I5a+GvMDk1rDTSmMLAEjdKAvN572AJPE14ljASorLbzKri7BnN8f9FTE2/Z+ioapC8uBihl23YmVwrXJ7wEYX6dhXcKJ4lTFZCD2befLHtCiPMBWitknM/ptgrWnVbf6R2YgIKRpQYaTQd3nx4/QSbGkm/FrGEuddbfRbwWiiwanqOE3sB+MYLAkVv1t6SOHfrVuG1I0VUSHsgpeRGsQTLiU7lMyoHzJ3P3LbTV/9ByQjZY1zWZC76pHuVW2UU3YAklz2x4wvhC4KfL75Z9S1Wvz8XZMAv0ucYPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e549mIHG9oKrYmbNcL9cQ6hKbis0Haq9iYJU+CVtgBs=;
 b=uYOx5+6QTdRaS5WAkw8qQjyF3fDge+LMVT2htRGThGGwTJzZldIYCKCx9g6OL2IeyKUTJahQugA68nQ98IgbF75EuWI4jl0bicMLxVYGHVLvnkxeZJgC6REBM+PhW11dHFZu9T/hrcC4z6L3Ne7PESDRWfrI/RLFXUO7b12oqpZDoUeQt/KOgCIQmZAx0QJIb/lOn8ZQhK4nHHDx7bcyCK0IL3udcr9yfOdGqK6OWcSLuuG+byKpb8yXCXMHrJxavxHxMj9KBBTsSeFqjY9U8HrXvA3j8G9A/MxLTSn1O0+SUABZ8e+43sH20bYS0wTfBvkZib/Npj542JeE5Ee2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7438.namprd11.prod.outlook.com (2603:10b6:806:32b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 16:29:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 16:29:09 +0000
Date: Mon, 4 Nov 2024 08:29:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v3 4/5] drm/xe: Wait on killed exec queues
Message-ID: <Zyj2dFOOqKnTaNPq@lstrano-desk.jf.intel.com>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241104143815.2112272-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:303:b4::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bbd138-4b4e-430c-3838-08dcfcedcf2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PnYRe6eHKLeR/T//b4IS07AnYpTIGCrFQNxjwsiTGX8xymFH7xiVQ9uUbfdZ?=
 =?us-ascii?Q?3TPqQoyfBgbH/3wn3Z9B++hHwCxRHEt7e9Iqh2BLD/5GKFGu2ZIS6JuI1Q8e?=
 =?us-ascii?Q?JBzQBZ4V/gcQIctoXEpW1DXHR75zrpBk+SR4N6sfswZqX8vd+tJdlkWX4ZMx?=
 =?us-ascii?Q?63vzxK5eWnCVdVU9cTrcgvVTR+5ITPRERBjm0O590Gktiyfk2Tz/rKGJTfkS?=
 =?us-ascii?Q?xtTuc/tHaaNZ488X/AAC0Buef/TZj+fnhPbP6ObGV05XMqyp/hvhdHjXdVnr?=
 =?us-ascii?Q?Wa0+AE8W0uftSSYy2tOOpkwixSiDe+9Z7+0o+6xasDqsE8x3isu9VhXdhKnH?=
 =?us-ascii?Q?TSLYbtp6UcEDsQdls1J7h9vZAFY2YXKgS0o29nL//PHqYxionBCVC7wByk28?=
 =?us-ascii?Q?SPmOKrZHTdP+zxRjhFr2PIJKe+yES1w5iz/cUa98CHvAqVV2JEOAOlQFK8rj?=
 =?us-ascii?Q?B0J7VmtsE4L5Jycpwp3IinImhite8jF/rMezM4dwinVX+fLSSz3DUVtZcAeY?=
 =?us-ascii?Q?jrX/HTW/rikTFB9ghx5K3DL6N3Z2AXdtQvxYiQKGxU7e8inMw8JftLynmSjE?=
 =?us-ascii?Q?ZWpGMh1MVBNg6zts+//yxj/8A5G3Me4JdVnWC3vHXZQxqC66amw66Sw+fQyz?=
 =?us-ascii?Q?5YIxrsfWrwebZ+4kTWG9FwRyXFqegYZpwmVSn7V4TNB5nBudSNSkXJmAEetK?=
 =?us-ascii?Q?mXv65MQWg0dnTXDBwnpByrf6hkBtDTCjSqB9Bo4Uz+UhXJkNvJJNlpIZoegh?=
 =?us-ascii?Q?oTqFxJOlVzCIZEiDZdac4oySYeMFT6fcjAAGqQ2x1zjVfatY8yubwos9255M?=
 =?us-ascii?Q?Q9RnXLfsjfEdw89tEDM07ELPYphn5S2IydQj/BFpq4zdE9lLVtRWMw0NhizD?=
 =?us-ascii?Q?2Bvgx7wNQs9hRFjBm4309Y4qiRMi+xaEO1nwiTQueMMEWeUOa+p7KJvdZdgI?=
 =?us-ascii?Q?mpxbQvVTPtLu1YJDm2nj7W44v1cspZnJPC5NDt8fMccyNlqfjd5PU30NEYHk?=
 =?us-ascii?Q?gPO2fETvJdX3Jqbl9/F2Oad1KC6t6WDQD3PI7T05TnU661zrYQjn80UHQzTW?=
 =?us-ascii?Q?94TJzNNlC0hDLQ5TNXn4fXs/xBwPCKkx1kU9+QLdCsSC1h7qb7eoZZDxD69d?=
 =?us-ascii?Q?eNP2ON5kwihcJOd1YuhMlu3KfnY6Z8m1B27S3zm4TLCSDwNLpSeg4vHuNfBf?=
 =?us-ascii?Q?jxWQ3GxKUN3ID0cy5QwuHKn8NReisaYVCt98Bm1lOkbRM/ziwUZtt1h/C9F+?=
 =?us-ascii?Q?Yuuk+vSuiVkGXB5eHBHw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PL4jbuHKoSTNmKmw+N1tybCbiWcpfmDk9E3SbsnHTpAlkucFcxZdSQEzI3go?=
 =?us-ascii?Q?au2RQsEnjyDEdm5D6P1GyO48nw35+P20rEB+mGnHZRyIQQTyTiu7BaN+IKsV?=
 =?us-ascii?Q?51Xk8p+b5a8ZUVGLFfU8itruSsCCLmc3c1WE8bqA5PXd+gLhzJ5888CXaI9t?=
 =?us-ascii?Q?jxQ7olPGYFnmjsyBU1DmOdY8CAKB8WtJPXeL90iLbUlsiC4JNjdYKmsxR4TK?=
 =?us-ascii?Q?BeKlvDYm4tlbvWFz65ZFw0teLHDC43Ujb1i2cGrjpmOCeUqAsQIUvwRqcVNe?=
 =?us-ascii?Q?hc9pzOFkbSIZEG9WiA+jTd7HDsiHnpfRXoUZu7Z6xktaOJ1KJx6a2FGdy5C0?=
 =?us-ascii?Q?fLxz2o3vgoCmgptCCGrq5EimnoEkp6nso84u2sFNT/ZlxnoyG69husviE4fd?=
 =?us-ascii?Q?vDoyOUVD5b4xzSfCYxjk+9qBXya7HiSJZMsVsjnME2dWtc/mxCTNWS9UvVCs?=
 =?us-ascii?Q?OYZwPE+V86FjEX4QUrtp0NHL74TrSbfM+F4U18scCiLtlx4k4nCAy4WLlNip?=
 =?us-ascii?Q?ZzZCNgH8kiHSUrUk5TTpQMhN0sXbZut4uonHIPCHW/tJYtcor118WsHMW4nN?=
 =?us-ascii?Q?m8fezNtSj8vjF338G6UULMEuN69HB0zHqge8qUoPt1l3RlFupkggUpuNTjxk?=
 =?us-ascii?Q?FV7Hsw5hzcl6KbrZKGW0amsyPtyN2I6Clvg7eFWEYoVWwd1zYO6zh9CSyd/0?=
 =?us-ascii?Q?wrNkRNwGISYVz6k3q/pUoK0UF8T0jTLV2StDvLnAL10f33EJIEWm3ZC6Ah6k?=
 =?us-ascii?Q?B9DLm7mPE12PxbZcAz9+zakkQ83mcD1j1vUOeN9Qexa1s+MQgn39uOpryHr+?=
 =?us-ascii?Q?N6J8H5hl9dUzjlzSwbfxvH1whpne7KK6jPAcyR0vku2x+GHeH6dpfq6BM3LB?=
 =?us-ascii?Q?FqW3gP4ydjjQi/ufn6cN/3IiBG1KrMe0+NBC1g9opfOLz/2zoNmQ/I9hRVPP?=
 =?us-ascii?Q?fdcg1QdJR2uBnd01TTaR6ORBAEvtdNth4nBHTQPKhAowEkjZrEEPKJXGjJMk?=
 =?us-ascii?Q?AvFXkmVMF+QKTB1kr9jgbuEkMduFft7tI78IvzadLVTTrXtJ5sw+5s/QcqYv?=
 =?us-ascii?Q?eZcmCDsWu6vifPl+rJxcmLPvx/x57uUNDxpl60v+B1cnSlYSHDb3pdy/uiVa?=
 =?us-ascii?Q?CF8AFoZwffa3xWKLDMXs5uj6dRqX6i3Z4/QUwlB4OckHzRBxXLqL5sIoc2Jp?=
 =?us-ascii?Q?cF+pYC4CRxS6z3Ui4k4ziTjN2YxSULHvL2BgdWElXyyEbu1yx7+Bb1iDwfTQ?=
 =?us-ascii?Q?7276OFeEKYBcFBsr4VXODKD5PpnZrQlVElBarKedcNToyj96p0vwH5eU9Pxq?=
 =?us-ascii?Q?9S38P1eTtDe/OyyJga+rBV7Om+0x4UWogO8VDA9tcpcAOyhs1cbxmcj4L54g?=
 =?us-ascii?Q?yA+sLuLFzU/+f+5eYf8Hs0HFBkFFWfeT/sl/Ml+UsaofOaPaC8sIkHBjgdHK?=
 =?us-ascii?Q?qNMYsCFSuHzBlTi2qDMQroIy7ljqNszZOySgQ7ihHNDALmhFWH4j4Z9zqeTo?=
 =?us-ascii?Q?afQ67EvzQK6UEezwJJ790OFxsom9uRD8NglCTYZP5aIhkBuOcRBALWVngyYQ?=
 =?us-ascii?Q?cSHMbCE7idgn6gJ5sVhL71YbXUfZwiQ6FeYo2gzycDWfsiF3nCwB98dvgV0O?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bbd138-4b4e-430c-3838-08dcfcedcf2c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 16:29:09.4656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LCmHFCbsVEy2SI9PiYorQS1HO5LYbiUsRdietJcPBKsGrAqjpWG4OgcdBaQRAmtH6JJ1ICg/TkcGVQZbCbaqqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7438
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

On Mon, Nov 04, 2024 at 06:38:14AM -0800, Lucas De Marchi wrote:
> When an exec queue is killed it triggers an async process of asking the
> GuC to schedule the context out. The timestamp in the context image is
> only updated when this process completes. In case a userspace process
> kills an exec and tries to read the timestamp, it may not get an updated
> runtime.
> 
> Add synchronization between the process reading the fdinfo and the exec
> queue being killed. After reading all the timestamps, wait on exec
> queues in the process of being killed. When that wait is over,
> xe_exec_queue_fini() was already called and updated the timestamps.
> 
> v2: Do not update pending_removal before validating user args
>     (Matthew Auld)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2667
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>  drivers/gpu/drm/xe/xe_drm_client.c   | 7 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.c   | 6 ++++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index cb193234c7eca..ed6b34d4a8030 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -605,6 +605,11 @@ struct xe_file {
>  		 * which does things while being held.
>  		 */
>  		struct mutex lock;
> +		/**
> +		 * @exec_queue.pending_removal: items pending to be removed to
> +		 * synchronize GPU state update with ongoing query.
> +		 */
> +		atomic_t pending_removal;

Would the interface in 'linux/completion.h' be better here?

Matt

>  	} exec_queue;
>  
>  	/** @run_ticks: hw engine class run time in ticks for this drm client */
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 22f0f1a6dfd55..24a0a7377abf2 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -317,6 +317,13 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  		break;
>  	}
>  
> +	/*
> +	 * Wait for any exec queue going away: their cycles will get updated on
> +	 * context switch out, so wait for that to happen
> +	 */
> +	wait_var_event(&xef->exec_queue.pending_removal,
> +		       !atomic_read(&xef->exec_queue.pending_removal));
> +
>  	xe_pm_runtime_put(xe);
>  
>  	if (unlikely(!hwe))
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fd0f3b3c9101d..ff556773c1063 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -262,8 +262,11 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>  
>  	/*
>  	 * Before releasing our ref to lrc and xef, accumulate our run ticks
> +	 * and wakeup any waiters.
>  	 */
>  	xe_exec_queue_update_run_ticks(q);
> +	if (q->xef && atomic_dec_and_test(&q->xef->exec_queue.pending_removal))
> +		wake_up_var(&q->xef->exec_queue.pending_removal);
>  
>  	for (i = 0; i < q->width; ++i)
>  		xe_lrc_put(q->lrc[i]);
> @@ -826,7 +829,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  
>  	mutex_lock(&xef->exec_queue.lock);
>  	q = xa_erase(&xef->exec_queue.xa, args->exec_queue_id);
> +	if (q)
> +		atomic_inc(&xef->exec_queue.pending_removal);
>  	mutex_unlock(&xef->exec_queue.lock);
> +
>  	if (XE_IOCTL_DBG(xe, !q))
>  		return -ENOENT;
>  
> -- 
> 2.47.0
> 
