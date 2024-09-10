Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D170EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:48:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401D010E8CD;
	Tue, 10 Sep 2024 18:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPE+0NG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094C110E8CD
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725994135; x=1757530135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1T0MVTPQ6AeQYCeE6IGsz2hGeYgUFJwkVWsu+8fmN9s=;
 b=OPE+0NG/e37prpQ85UHAHOzK4DhZGMhOZ93CQ051dM4xa+7xBc9DNrqK
 y5sSli6km0U7NsOdX9BQEJ0IsI47AVjouRzZJdZUkmLpuI4Fmzb4nF3UX
 Eo+3kv9nC0mxuDtZmgNKQRAV5t6RBMW/trBFvG7G23oVNSl5ONWpU0omT
 3A1gdqKoa/uEhXkpM36UX/pn77tKWhK8Bjq15pHoWxPHBU/JGT0ICZYMr
 hxC3iu5txLDgz2tStuDexu5CVGPBd1ZTjwrbGCONZeiq3/1O2OvGh5IX4
 Y8X/fDZ+eF8DBhl8cU355IEJuOZqQuLnALMS1DKMe6EIWr9vchTIBduc9 Q==;
X-CSE-ConnectionGUID: 9j7KEf7PTciJuJRHD+yPAQ==
X-CSE-MsgGUID: ltwEGuNVTYyRS+7mXtyVwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28652953"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="28652953"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:48:55 -0700
X-CSE-ConnectionGUID: UuXo3B4oT+ScvqxMQ8Sqxw==
X-CSE-MsgGUID: DJVgNs82QjyOD3hU+L3UnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67413424"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:48:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:48:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:48:53 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:48:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ7ISPrC1VRQo2Wyn9pApAs8jZiGB+z+McIUXHPNn4H3lHn3aYQ10jNGfCFnbTj+3/xvJITDGhp8Fbl3GhYk+hwRY1wL0+8SpnLW4iRFO+Wwzd25HTcX5OSiQ76uFS6B8wOeEhlY02cLwgQ7X1VPg9s00W0etOUju8CYXGk0BQynEQi0Y6ZpAwgHgg1svepdM3LScMbKzZX5XlL5DRjDzOBIimDH5Nw1nuJOSSj7JN5+jOt2FRvftnwesbqofH6dawEVC44QMkFo8kKL9Uq8mHIk2/AmvM9DjyOj0OLE2+kB5Vr+jhzEWzs9fsfeF6MU9QvcTVdUmg5XbSqKbSR0rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmHu5tHPsC0ing4k3AQ6j4cXRPUryWe3L3gEwKYINoE=;
 b=sbD01MGFeuS9wCZajwNxDdVxZLA/zgumhfa3b+wCI5Ide7aT4S74X8SeiXgVS4CHl+TP+JcyyjcwQE0V3uWv0xdgQdv7bOGlATo5P0rfLI//fCWPG+fBOJNQauBHSZ2464IbC8VIaq+eVzOcm+xooCDYZ4h+BSGXaA78D5BtEacRS/g5VBojttcILNmax6fFaBKn1Xxl075jdGAdnHqtGXZ7SWnWU3inppUqm8KlekXNgVShiU4tIiB08MSIThSK6FfPaSVL89G+jgRncYRtN6i0KPgeaee3UJfjsGHC92bVAHzcTnOViOklxTxuaCsQmz65xSGAN7U6kFH+uNWGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 18:48:51 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:48:51 +0000
Date: Tue, 10 Sep 2024 14:48:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 21/43] drm/xe/guc: Convert register access to use
 xe_mmio
Message-ID: <ZuCUkHMtd68BB5W7@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-66-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-66-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 32674a57-6425-433e-ba67-08dcd1c93636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/gwGOUaBH5Oz02W5UWi2CEfma57z0rIYuQAguxWQ3gG+l9SOZJzr+XGsDEuJ?=
 =?us-ascii?Q?aaIRHtHomqxN9vKgmfmu0P7IfVnRLT1SLXDPNBEDj2nV+0B5HIK8inWorsQ0?=
 =?us-ascii?Q?gMg7m6DnDfG6yhffy6e2tiY0oSypV33QMDlrz5q79BIVdCFLc54c4nZAOffJ?=
 =?us-ascii?Q?aySvr8SzRob2cYesrNNGArmoWjAyD5zbUiN1+qbuCuVDloioaj6Xw39Ig/Ng?=
 =?us-ascii?Q?HFHAxtbQunSPlaAEzg7Aw9m/SMsLDLaX9L8Rz184cGYpoSO0D/V7qmrRE1Gt?=
 =?us-ascii?Q?lCspZgu1PQkPbzzoq96hKFcsroE6qRgsi6uNq8H67g26GVknU0KPlWwoDOwB?=
 =?us-ascii?Q?FF3wCR/8NmVXhtBzGP3oECxPNq8+wkjEJsiZJ0qyf2eff/zXF2bENkYTBcfz?=
 =?us-ascii?Q?X1dm1eJIYzQapgBRciRym11nO3rmrQYdAc0xgIlG4LrBEW1Fxbo7boAf9jTF?=
 =?us-ascii?Q?cWH52+FkW0uu5SDmaVW7NI6nLAaXKyjDLmU4iDHe++1HKlVoZdONbpxc6KtP?=
 =?us-ascii?Q?AirJ2JhkOcre/NgVEgqP1ixMxE+RZ99if8mGZsphd4P1N3NWFvL6rndJbwXB?=
 =?us-ascii?Q?N5xRhJHq0LKzn61Jwm+WVZmzMGNUdxRRC2gvjVgyHL73X2TM/tx3JWnVcEpO?=
 =?us-ascii?Q?PD6PQ5VLeVHnwWvJjwSWPZyOk9yXZlrzKzSjAKcrXO9xORidVTd4kr3csvS5?=
 =?us-ascii?Q?2ekBFZkAnU5B0rbha+dBrOVVzydoBpHh3rOj3K7DSZKxLyCZ9KMvRHDleVd9?=
 =?us-ascii?Q?F1go0wQHhfKv0G07TtO3pAIr1/B4SqH9reQ5H3n74cN/SY6wgA6vFtX2g190?=
 =?us-ascii?Q?1NZkynbP464KYLFCeCIVDR8cYXveK3d92fkD7t3I8J1nh8fnhRTJ9cHOb96I?=
 =?us-ascii?Q?eAckWknxFX5UdbPIe0yjHcdmcvIPjgM6AJiMIU9GDUzVUP93qdo3jjMGS99p?=
 =?us-ascii?Q?s/hRf+lWg3ISA+alMr6TgbVNo9a4iCxOimCDDtE4G8VpfAUDlSpgrf1v3uy2?=
 =?us-ascii?Q?pWurkHu/LeWnt4/J4g0IYHIGOddb1bwjWVBgTk76XrC+HFFCy4KzB54T1jPt?=
 =?us-ascii?Q?4xBxyGmqA9Zo7vSKCahtNFb7R6iG3nm+t1yuAQ1N1yj8eg1+uFJEgbt3VfG2?=
 =?us-ascii?Q?B/s2B+wq1nOWqfAXhUE+HPP0NEfhnFiQElGOfp5uCjJg1ioXLHTreEnW9jW+?=
 =?us-ascii?Q?p4RrO5pdPT6+BpH68CmslzMdZO7guqFhCZdeGlSQPvRInf7+PUt2Urj0rMDE?=
 =?us-ascii?Q?uPpQG0WdPCc4p21JxUzP23MppgwK9O6N8rBpKf38T83uoIETuUmYHXIcnWcX?=
 =?us-ascii?Q?vQhks9LHPXgFYfPTX32m1QcbZLCHwftIAhGvMH6tlsY7eg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CrHIlQAIG/yMb1rfcA85wqloOq+L0iClqPtW20RbfxT1JjrQNYfeFnUBDBiI?=
 =?us-ascii?Q?RtOI0nJOdu3nCKYGAA23a59BkpfPONNIaYzHOxe+pQHwU7T3W2JuTaC66FlO?=
 =?us-ascii?Q?7fHBADOrb5SrbL3vJNt5c2Pjk1X2tWT5mRiOUwlVpo4CmimAs/6plC9KVwvx?=
 =?us-ascii?Q?kjt4UMCbz8vAACgzlzrY4FZem5B+DxY/CjVQf+H15CjB1Pin6F8pp6qgErDt?=
 =?us-ascii?Q?nfWCOuX6Vb3mw9AhA6bOmGH1s4w2nhkE1ulPxyHkDT7eLujoOJfwb8v38r7J?=
 =?us-ascii?Q?wpD4SJwrEIRk5W9PQvfRgqL+NRjKdKt0e+Lh9Ri6Mo3EdUo1lsWTMN1FR40B?=
 =?us-ascii?Q?X4G29HMlE5+u9J6I8d0Og2IK5OmcHhXedmQwEp+2f6ljPDi5PcP8Kr9QP5/J?=
 =?us-ascii?Q?qe6tEslK5jNdq4VdaexWTC+nhj2vGs+nKa5/i/AyshcshdChtolOiSUxoUan?=
 =?us-ascii?Q?MLQWQe7RYNEFNW3IX6AXKZQZyvaYyz2LaqCv/HT+0e/uJ7rHiy8xqmCEHTtE?=
 =?us-ascii?Q?VRUS0onMBEdOkcvaZCo7c4CBGV4nIrav1+/Co0ffhxg9u3no1gKMS/rHnd76?=
 =?us-ascii?Q?K+4qFPXofw4Eg+swDkSd2pDHrFn8APOQoOWpKjV71VPjj4IAIIhtLCf5tKQG?=
 =?us-ascii?Q?iO9U1d4A3TulP+bxo8tDap/BQv1LgRZ9+hrdMV3ltg/sG+Ty3HM+0RAJAtVJ?=
 =?us-ascii?Q?S+UBc+q4mb4ueeDcI/9HLvuraZvNGiMjTuvPwjqUXPMgolQYBtLy0Y2+rfmv?=
 =?us-ascii?Q?0Krk3qLufX6tBL8zSXpodF2SWEoGEqTxiiWNXGnv7wM+NyPJfes3OP35YYmu?=
 =?us-ascii?Q?LNs0+oXTBi4gwUJ1eWLEFlhxcpgik1DN4GQ700gQcaVLmF43hnd4QBl3BQPd?=
 =?us-ascii?Q?gkk8+HHmG4I/2tLeFQGFLPBwcwSeIM2G0LvRjFw7LlDLOWYkugMurU0X1VmW?=
 =?us-ascii?Q?OHB4thNZHbM7HmcYTloQhZeck6aT24t+0B8oZZWtfYGu2Hv961SlPecaA8kB?=
 =?us-ascii?Q?90MttpwLQkpxV0zKTxYkzXaABvkOaQvueKcIbXZRA/xJ0EIfe/qDE/KASdYr?=
 =?us-ascii?Q?+6W5vlmyAzQ8Y3YrxMet3gHRtdcymLBljjbRNeN0Nxq0JvyaSwDJrcHcB0LC?=
 =?us-ascii?Q?2XlJ08Lc3VKRY3buOu17yZfJxRDTT+9AmyQENDX7oZ/u8kNiTk5tmIthYPBV?=
 =?us-ascii?Q?mYXFen3WtCGkUaBew67QN7WLYu5ON2kAZRDtrVapwFf0xdoLqEAm/SUEvZj8?=
 =?us-ascii?Q?N1TStiJqvpZWDNtK59EwH/lljelugXVp6Sv7iEE0OF830YJudzJeo4GWUE+3?=
 =?us-ascii?Q?O24cXX/EwiDHus2s1fLp/wL0b83UshAhKKl15hhLdue0dpCG3FCBmOlgnTzo?=
 =?us-ascii?Q?pMGRJsM+x1Z78eUREzP1RMNXZLrKx7MGJqu8YYoT1dlYyMYpbAY0NKAvv0fV?=
 =?us-ascii?Q?gXladakBRCITW9RsjqZS7iB8jmJRW759Dag0Co39V53PZNpa8zaatTaqeL2/?=
 =?us-ascii?Q?0KjV1AzSaJZjUXWd+qleZUC2OjAgq7Y3iT4IARkXR39wUH1wIWn9sP72YzV8?=
 =?us-ascii?Q?tM5aKody20W1An0Bx7FKT7400xJfNAWqaYpkjKVcrYQzTJOVz/1oMWzVDrmf?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32674a57-6425-433e-ba67-08dcd1c93636
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:48:51.2270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbX5M1XijK/s1DW+4GNm8yj+tZ99tcjY1xA5m2I5rG+3CffB6q36c/SO7ZK2IR0QhWOOBm145Eg+K80qZ9VWFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
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

On Fri, Sep 06, 2024 at 05:08:10PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Since GuC was the only part of the driver using xe_mmio_wait32_not(), we
> can also drop the _Generic wrapper macro for that function as well.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c     | 60 ++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_guc_ads.c |  2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c  | 34 +++++++++----------
>  drivers/gpu/drm/xe/xe_mmio.c    |  4 +--
>  drivers/gpu/drm/xe/xe_mmio.h    |  6 ++--
>  5 files changed, 54 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 5599464013bd..1eb5bb7e8771 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -236,10 +236,10 @@ static void guc_write_params(struct xe_guc *guc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	xe_mmio_write32(gt, SOFT_SCRATCH(0), 0);
> +	xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(0), 0);
>  
>  	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
> -		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
> +		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
>  }
>  
>  static void guc_fini_hw(void *arg)
> @@ -425,6 +425,7 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>  int xe_guc_reset(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	u32 guc_status, gdrst;
>  	int ret;
>  
> @@ -433,15 +434,15 @@ int xe_guc_reset(struct xe_guc *guc)
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return xe_gt_sriov_vf_bootstrap(gt);
>  
> -	xe_mmio_write32(gt, GDRST, GRDOM_GUC);
> +	xe_mmio_write32(mmio, GDRST, GRDOM_GUC);
>  
> -	ret = xe_mmio_wait32(gt, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
> +	ret = xe_mmio_wait32(mmio, GDRST, GRDOM_GUC, 0, 5000, &gdrst, false);
>  	if (ret) {
>  		xe_gt_err(gt, "GuC reset timed out, GDRST=%#x\n", gdrst);
>  		goto err_out;
>  	}
>  
> -	guc_status = xe_mmio_read32(gt, GUC_STATUS);
> +	guc_status = xe_mmio_read32(mmio, GUC_STATUS);
>  	if (!(guc_status & GS_MIA_IN_RESET)) {
>  		xe_gt_err(gt, "GuC status: %#x, MIA core expected to be in reset\n",
>  			  guc_status);
> @@ -459,6 +460,7 @@ int xe_guc_reset(struct xe_guc *guc)
>  static void guc_prepare_xfer(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_device *xe =  guc_to_xe(guc);
>  	u32 shim_flags = GUC_ENABLE_READ_CACHE_LOGIC |
>  		GUC_ENABLE_READ_CACHE_FOR_SRAM_DATA |
> @@ -473,12 +475,12 @@ static void guc_prepare_xfer(struct xe_guc *guc)
>  		shim_flags |= REG_FIELD_PREP(GUC_MOCS_INDEX_MASK, gt->mocs.uc_index);
>  
>  	/* Must program this register before loading the ucode with DMA */
> -	xe_mmio_write32(gt, GUC_SHIM_CONTROL, shim_flags);
> +	xe_mmio_write32(mmio, GUC_SHIM_CONTROL, shim_flags);
>  
> -	xe_mmio_write32(gt, GT_PM_CONFIG, GT_DOORBELL_ENABLE);
> +	xe_mmio_write32(mmio, GT_PM_CONFIG, GT_DOORBELL_ENABLE);
>  
>  	/* Make sure GuC receives ARAT interrupts */
> -	xe_mmio_rmw32(gt, PMINTRMSK, ARAT_EXPIRED_INTRMSK, 0);
> +	xe_mmio_rmw32(mmio, PMINTRMSK, ARAT_EXPIRED_INTRMSK, 0);
>  }
>  
>  /*
> @@ -494,7 +496,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>  	if (guc->fw.rsa_size > 256) {
>  		u32 rsa_ggtt_addr = xe_bo_ggtt_addr(guc->fw.bo) +
>  				    xe_uc_fw_rsa_offset(&guc->fw);
> -		xe_mmio_write32(gt, UOS_RSA_SCRATCH(0), rsa_ggtt_addr);
> +		xe_mmio_write32(&gt->mmio, UOS_RSA_SCRATCH(0), rsa_ggtt_addr);
>  		return 0;
>  	}
>  
> @@ -503,7 +505,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
>  		return -ENOMEM;
>  
>  	for (i = 0; i < UOS_RSA_SCRATCH_COUNT; i++)
> -		xe_mmio_write32(gt, UOS_RSA_SCRATCH(i), rsa[i]);
> +		xe_mmio_write32(&gt->mmio, UOS_RSA_SCRATCH(i), rsa[i]);
>  
>  	return 0;
>  }
> @@ -593,6 +595,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>  static void guc_wait_ucode(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	struct xe_guc_pc *guc_pc = &gt->uc.guc.pc;
>  	ktime_t before, after, delta;
>  	int load_done;
> @@ -619,7 +622,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		 * timeouts rather than allowing a huge timeout each time. So basically, need
>  		 * to treat a timeout no different to a value change.
>  		 */
> -		ret = xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
> +		ret = xe_mmio_wait32_not(mmio, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
>  					 last_status, 1000 * 1000, &status, false);
>  		if (ret < 0)
>  			count++;
> @@ -657,7 +660,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		switch (bootrom) {
>  		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
>  			xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
> -				  xe_mmio_read32(gt, GUC_HEADER_INFO));
> +				  xe_mmio_read32(mmio, GUC_HEADER_INFO));
>  			break;
>  
>  		case XE_BOOTROM_STATUS_RSA_FAILED:
> @@ -672,7 +675,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		switch (ukernel) {
>  		case XE_GUC_LOAD_STATUS_EXCEPTION:
>  			xe_gt_err(gt, "firmware exception. EIP: %#x\n",
> -				  xe_mmio_read32(gt, SOFT_SCRATCH(13)));
> +				  xe_mmio_read32(mmio, SOFT_SCRATCH(13)));
>  			break;
>  
>  		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> @@ -824,10 +827,10 @@ static void guc_handle_mmio_msg(struct xe_guc *guc)
>  
>  	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>  
> -	msg = xe_mmio_read32(gt, SOFT_SCRATCH(15));
> +	msg = xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(15));
>  	msg &= XE_GUC_RECV_MSG_EXCEPTION |
>  		XE_GUC_RECV_MSG_CRASH_DUMP_POSTED;
> -	xe_mmio_write32(gt, SOFT_SCRATCH(15), 0);
> +	xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(15), 0);
>  
>  	if (msg & XE_GUC_RECV_MSG_CRASH_DUMP_POSTED)
>  		xe_gt_err(gt, "Received early GuC crash dump notification!\n");
> @@ -844,14 +847,14 @@ static void guc_enable_irq(struct xe_guc *guc)
>  		REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>  
>  	/* Primary GuC and media GuC share a single enable bit */
> -	xe_mmio_write32(gt, GUC_SG_INTR_ENABLE,
> +	xe_mmio_write32(&gt->mmio, GUC_SG_INTR_ENABLE,
>  			REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST));
>  
>  	/*
>  	 * There are separate mask bits for primary and media GuCs, so use
>  	 * a RMW operation to avoid clobbering the other GuC's setting.
>  	 */
> -	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
> +	xe_mmio_rmw32(&gt->mmio, GUC_SG_INTR_MASK, events, 0);
>  }
>  
>  int xe_guc_enable_communication(struct xe_guc *guc)
> @@ -907,7 +910,7 @@ void xe_guc_notify(struct xe_guc *guc)
>  	 * additional payload data to the GuC but this capability is not
>  	 * used by the firmware yet. Use default value in the meantime.
>  	 */
> -	xe_mmio_write32(gt, guc->notify_reg, default_notify_data);
> +	xe_mmio_write32(&gt->mmio, guc->notify_reg, default_notify_data);
>  }
>  
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr)
> @@ -925,6 +928,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_mmio *mmio = &gt->mmio;
>  	u32 header, reply;
>  	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
> @@ -947,19 +951,19 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	/* Not in critical data-path, just do if else for GT type */
>  	if (xe_gt_is_media_type(gt)) {
>  		for (i = 0; i < len; ++i)
> -			xe_mmio_write32(gt, MED_VF_SW_FLAG(i),
> +			xe_mmio_write32(mmio, MED_VF_SW_FLAG(i),
>  					request[i]);
> -		xe_mmio_read32(gt, MED_VF_SW_FLAG(LAST_INDEX));
> +		xe_mmio_read32(mmio, MED_VF_SW_FLAG(LAST_INDEX));
>  	} else {
>  		for (i = 0; i < len; ++i)
> -			xe_mmio_write32(gt, VF_SW_FLAG(i),
> +			xe_mmio_write32(mmio, VF_SW_FLAG(i),
>  					request[i]);
> -		xe_mmio_read32(gt, VF_SW_FLAG(LAST_INDEX));
> +		xe_mmio_read32(mmio, VF_SW_FLAG(LAST_INDEX));
>  	}
>  
>  	xe_guc_notify(guc);
>  
> -	ret = xe_mmio_wait32(gt, reply_reg, GUC_HXG_MSG_0_ORIGIN,
> +	ret = xe_mmio_wait32(mmio, reply_reg, GUC_HXG_MSG_0_ORIGIN,
>  			     FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_GUC),
>  			     50000, &reply, false);
>  	if (ret) {
> @@ -969,7 +973,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		return ret;
>  	}
>  
> -	header = xe_mmio_read32(gt, reply_reg);
> +	header = xe_mmio_read32(mmio, reply_reg);
>  	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>  	    GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>  		/*
> @@ -985,7 +989,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  		BUILD_BUG_ON(FIELD_MAX(GUC_HXG_MSG_0_TYPE) != GUC_HXG_TYPE_RESPONSE_SUCCESS);
>  		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
>  
> -		ret = xe_mmio_wait32(gt, reply_reg, resp_mask, resp_mask,
> +		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
>  				     1000000, &header, false);
>  
>  		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
> @@ -1032,7 +1036,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  		for (i = 1; i < VF_SW_FLAG_COUNT; i++) {
>  			reply_reg.addr += sizeof(u32);
> -			response_buf[i] = xe_mmio_read32(gt, reply_reg);
> +			response_buf[i] = xe_mmio_read32(mmio, reply_reg);
>  		}
>  	}
>  
> @@ -1155,7 +1159,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  	if (err)
>  		return;
>  
> -	status = xe_mmio_read32(gt, GUC_STATUS);
> +	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
>  
>  	drm_printf(p, "\nGuC status 0x%08x:\n", status);
>  	drm_printf(p, "\tBootrom status = 0x%x\n",
> @@ -1170,7 +1174,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  	drm_puts(p, "\nScratch registers:\n");
>  	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
>  		drm_printf(p, "\t%2d: \t0x%x\n",
> -			   i, xe_mmio_read32(gt, SOFT_SCRATCH(i)));
> +			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
>  	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index d1902a8581ca..66d4e5e95abd 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -684,7 +684,7 @@ static void guc_doorbell_init(struct xe_guc_ads *ads)
>  
>  	if (GRAPHICS_VER(xe) >= 12 && !IS_DGFX(xe)) {
>  		u32 distdbreg =
> -			xe_mmio_read32(gt, DIST_DBS_POPULATED);
> +			xe_mmio_read32(&gt->mmio, DIST_DBS_POPULATED);
>  
>  		ads_blob_write(ads,
>  			       system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_DOORBELL_COUNT_PER_SQIDI],
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 034b29984d5e..2b654f820ae2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -262,7 +262,7 @@ static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
>  	u32 state = enable ? RPSWCTL_ENABLE : RPSWCTL_DISABLE;
>  
>  	/* Allow/Disallow punit to process software freq requests */
> -	xe_mmio_write32(gt, RP_CONTROL, state);
> +	xe_mmio_write32(&gt->mmio, RP_CONTROL, state);
>  }
>  
>  static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> @@ -274,7 +274,7 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>  
>  	/* Req freq is in units of 16.66 Mhz */
>  	rpnswreq = REG_FIELD_PREP(REQ_RATIO_MASK, encode_freq(freq));
> -	xe_mmio_write32(gt, RPNSWREQ, rpnswreq);
> +	xe_mmio_write32(&gt->mmio, RPNSWREQ, rpnswreq);
>  
>  	/* Sleep for a small time to allow pcode to respond */
>  	usleep_range(100, 300);
> @@ -334,9 +334,9 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>  	u32 reg;
>  
>  	if (xe_gt_is_media_type(gt))
> -		reg = xe_mmio_read32(gt, MTL_MPE_FREQUENCY);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_MPE_FREQUENCY);
>  	else
> -		reg = xe_mmio_read32(gt, MTL_GT_RPE_FREQUENCY);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>  
>  	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>  }
> @@ -353,9 +353,9 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>  	 * PCODE at a different register
>  	 */
>  	if (xe->info.platform == XE_PVC)
> -		reg = xe_mmio_read32(gt, PVC_RP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>  	else
> -		reg = xe_mmio_read32(gt, FREQ_INFO_REC);
> +		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
>  
>  	pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
> @@ -392,10 +392,10 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>  
>  	/* When in RC6, actual frequency reported will be 0. */
>  	if (GRAPHICS_VERx100(xe) >= 1270) {
> -		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
> +		freq = xe_mmio_read32(&gt->mmio, MTL_MIRROR_TARGET_WP1);
>  		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
>  	} else {
> -		freq = xe_mmio_read32(gt, GT_PERF_STATUS);
> +		freq = xe_mmio_read32(&gt->mmio, GT_PERF_STATUS);
>  		freq = REG_FIELD_GET(CAGF_MASK, freq);
>  	}
>  
> @@ -425,7 +425,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>  	if (ret)
>  		return ret;
>  
> -	*freq = xe_mmio_read32(gt, RPNSWREQ);
> +	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
>  
>  	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
>  	*freq = decode_freq(*freq);
> @@ -612,10 +612,10 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc)
>  	u32 reg, gt_c_state;
>  
>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
> -		reg = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_MIRROR_TARGET_WP1);
>  		gt_c_state = REG_FIELD_GET(MTL_CC_MASK, reg);
>  	} else {
> -		reg = xe_mmio_read32(gt, GT_CORE_STATUS);
> +		reg = xe_mmio_read32(&gt->mmio, GT_CORE_STATUS);
>  		gt_c_state = REG_FIELD_GET(RCN_MASK, reg);
>  	}
>  
> @@ -638,7 +638,7 @@ u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u32 reg;
>  
> -	reg = xe_mmio_read32(gt, GT_GFX_RC6);
> +	reg = xe_mmio_read32(&gt->mmio, GT_GFX_RC6);
>  
>  	return reg;
>  }
> @@ -652,7 +652,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u64 reg;
>  
> -	reg = xe_mmio_read32(gt, MTL_MEDIA_MC6);
> +	reg = xe_mmio_read32(&gt->mmio, MTL_MEDIA_MC6);
>  
>  	return reg;
>  }
> @@ -665,9 +665,9 @@ static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
>  	xe_device_assert_mem_access(pc_to_xe(pc));
>  
>  	if (xe_gt_is_media_type(gt))
> -		reg = xe_mmio_read32(gt, MTL_MEDIAP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_MEDIAP_STATE_CAP);
>  	else
> -		reg = xe_mmio_read32(gt, MTL_RP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, MTL_RP_STATE_CAP);
>  
>  	pc->rp0_freq = decode_freq(REG_FIELD_GET(MTL_RP0_CAP_MASK, reg));
>  
> @@ -683,9 +683,9 @@ static void tgl_init_fused_rp_values(struct xe_guc_pc *pc)
>  	xe_device_assert_mem_access(pc_to_xe(pc));
>  
>  	if (xe->info.platform == XE_PVC)
> -		reg = xe_mmio_read32(gt, PVC_RP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
>  	else
> -		reg = xe_mmio_read32(gt, RP_STATE_CAP);
> +		reg = xe_mmio_read32(&gt->mmio, RP_STATE_CAP);
>  	pc->rp0_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  	pc->rpn_freq = REG_FIELD_GET(RPN_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 29f4e3759106..ccf53a7840d9 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -430,8 +430,8 @@ int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
>   * This function works exactly like xe_mmio_wait32() with the exception that
>   * @val is expected not to be matched.
>   */
> -int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> -			 u32 *out_val, bool atomic)
> +int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
> +		       u32 *out_val, bool atomic)
>  {
>  	return ____xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 99e3b58c9bb2..2e97dc811d82 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -56,10 +56,8 @@ int __xe_mmio_wait32(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 val,
>  #define xe_mmio_wait32(p, reg, mask, val, timeout_us, out_val, atomic) \
>  	__xe_mmio_wait32(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
>  
> -int __xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
> -			 u32 val, u32 timeout_us, u32 *out_val, bool atomic);
> -#define xe_mmio_wait32_not(p, reg, mask, val, timeout_us, out_val, atomic) \
> -	__xe_mmio_wait32_not(__to_xe_mmio(p), reg, mask, val, timeout_us, out_val, atomic)
> +int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask,
> +		       u32 val, u32 timeout_us, u32 *out_val, bool atomic);
>  

shouldn't this go with the last patch?
Or avoid the last patch and then in every last usage of a case, like this,
you remove the unused compat layer?

>  static inline u32 __xe_mmio_adjusted_addr(const struct xe_mmio *mmio, u32 addr)
>  {
> -- 
> 2.45.2
> 
