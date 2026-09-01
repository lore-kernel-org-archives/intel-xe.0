Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787CFC61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 20:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DA810E3C3;
	Tue,  1 Sep 2026 20:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJxMPtmJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC2810E3C3
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788294586; x=1819830586;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=t5BeXc+UAv9+zoFWgfhEzoZZEJR4NxDOhYQKU3UKmrM=;
 b=kJxMPtmJWAWye8yYYfTZwZqTlBAIZuVGyxIQHnloJRcxzpUQWpvOEhcv
 bSzy9KMNbtekif/o6rLiYYKddNUpOsSteYB5EHTHUMVP1Sx9F5RKySmHT
 rGmDWL21e+e4lwybIpFOLEvHLgt0LuKMoslkgqdxCfAercoU/KTzjRUUS
 45oRZeYOyiYU7qFHwx52bHsGYX5S5IRyK1RHpHfKC0Jsw8n1ExMcUxbnb
 NViQglErLrG3HMtVPfYn5muV9H4Dj12Jel4UG8CDl1/BCDkwlQ9w6RG6S
 7xTzxoXbpCn444V19Ao4kgvEVJFVK7EWV61jg8MnYoIu1kQgiWd1Zd4VB w==;
X-CSE-ConnectionGUID: DPD74QiXRiaoA9UHSjubjw==
X-CSE-MsgGUID: f0WcTY2zSKigKhWJzSeZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="111510760"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="111510760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 13:29:46 -0700
X-CSE-ConnectionGUID: zAgnRdEfSjGohkQWAH0G2Q==
X-CSE-MsgGUID: JKQfQUtATlSa+qkpeOKp/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="292728767"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 13:29:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 13:29:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 13:29:45 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 13:29:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBGnFCpRudNg3g8vtFhWh6Xx9MTNB0HUasflzMWTnVyE8gW0zTlDEAbiXuw0G0ugCa6peXxP3mP+8s6RqZige+770oq21dOT1BPzI6IIlEs+tuJTSQxqRnNwjieaHNHcWkn3TxCv5/CwUpy+9ht3eA8GZoRYU3bv15JmDFpdeqRZE2JUFazW4Bg5mRjzfmXZ4LoLr0fto6zJUgGjpwXpEMuLpoovlm/hFe9D2oZnNA9yjlCiOBKmMPGuribSZg9Kyv7lPpLhG5eHExL4cgDombF/YKOFbko3mzC1y6XNrWMtvTq3R343HsFcgswgotJpGi75iipcz6J2uTDTvbTnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orrMzpRVK4hxfL+/aUhqD/4YJBu4t+LI3p3L24PUo5U=;
 b=H6aP0jSzRPdz/qMEq9lpFza62CIHAbrSQLvlnD9uKHZ3260/IrN6QsNFUjGYdq+2EhqUqSFfrKQ4+pxR40UpdFv8J+31m1CstZYJ/Fo9HEBO76nmSRb7xxeOgCh/ys77upR/9RAhTyChH+R/rc7jXsDAfYyf+3T32KqSZnDn9hNFG3GkuUbseI58sU1UHhdLEoYqiZLXF3wWKRlPTpLV5DmWTJksNafHGe/WFbcGPdPBr94FiaMdWWoXpDX47IeDSZhitqQn+QybtXI4xairL50IsOBf4mYnqeIKXzjKXJ13EB5/r1P9tS0WQDl/oPrBgv+Fxo8VOAl1a4iDsrEUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 20:29:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 20:29:42 +0000
Date: Tue, 1 Sep 2026 13:29:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 4/5] drm/xe: add force option for global invalidation
Message-ID: <apc1s+gfTc7uBMAi@gsse-cloud1.jf.intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828151405.662533-11-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:303:86::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fce3ea6-880c-4acb-1fb2-08df0867c102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: ur1MUafETFGhbAmP+RBj82GN7aOiKam5v3g+SuAA+rVMnz/yUPsZNKJYKeMUITjfy4wjiSdQaEbAWMNeCbWc+ipI9kfLOOgEZXZJ9sSpK4+vTkDLwLUz34juZauV144Z5AewCwkBhbsjVC7IGzERWFtDUXEWhCbQxQNals4bXW+/o2NFdyh4RTTt2F1pG580/M7+QLfvoXKkTZr92gD+Zm6bowRH+nepXmM030C576+BK7bMYC6u3FpOBO7HhWQJ9FPfRGRflDSnRWqex/BOocGEKeho4FOqGW2tNu6Pg3fEVJu5drpXV3GDLlRPfpIXxFZc97SJxAVCuaH0lL38wWSBQZW8Z7CP7IlgyQAatAuppaKxxaw0Wf7IoLyBMC5VKsyoW1exmqWdD5R6XHqkPncHXZmYzUDG25euEt5JGB9NolI/wAr9JpC5+MKQk8DnpAHXi6VzIc5VcGWe0zadQYjFcJCV2zll2bGc0X4LOtgcRQg7CxcsatsxOwdDRKrY52XtieXru2HL4BEJ+4PEan4f/P7ZDyvixYPxylOY0iGASG/WrnuLJqm6G3fzzIH7aexmRiuCiVv//yT4gUOsglCIWJ4Mnb1RPjd/IRkn2KbXbLJ2UWLAk1BVm2F5mGyXLU4CdPLjBW64A4zqQAGc7BMRdiCfPH2b7TQNEVsTFCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HTiqVa15BfRmwEvUB1BcqWsoQakvQFLWL9UhwxmddPRZ0+gkFpWmFKa7Nq?=
 =?iso-8859-1?Q?dQgw8aSEO+d3tedcZZUNYvx5hriOEDDZnubkR/dge7uoZwtci2Jt7tCs8j?=
 =?iso-8859-1?Q?pyP9vOi1nJgLxKa4HTwQrcTmi9nZ9eW1N0glKWsLV/XwMW/hdN4Gsif7dL?=
 =?iso-8859-1?Q?2/Yg6G2oClCzUxUqWhqFnLTYn59V1wQzRgpz9l0C8nvbm5G7DM9KS+ULhx?=
 =?iso-8859-1?Q?pokOt4yURcrD2/P30Pm9Z0LTe1JrFn5jLM00W0q21M1UleeAoCMb+VAD8b?=
 =?iso-8859-1?Q?LES2sgjNF6aiB1vrzH776YSfzMWlvI7eswWaU9AZ6/6Rfw7RmSVygrfIaU?=
 =?iso-8859-1?Q?CEt00wrk+cJelUhOWYv2Ki/LHhCKh+d/LULImozuwv8pgsRzMa6bO+nxVd?=
 =?iso-8859-1?Q?0QJyysZXcBi4KqagMM/Wh39R5JAwn+SZTla2oxlB7y5E9e8HjCX3KfJOLT?=
 =?iso-8859-1?Q?Fa+ezEEsB3WnrlfYWhjlke/JoakmOchTLSTvyG9aBlwRinntuCd1mX9QB6?=
 =?iso-8859-1?Q?i1NjHh2P0H92iFnbSbmokDgemf0Iw+gGWS+zh1zrMfDrD/Vlo2JzzfGNdK?=
 =?iso-8859-1?Q?WIcaHUaxKFNBwPkzVwu07zVsxs9WjRQtnSHBqpurIRvZssJ+393JS6MQRX?=
 =?iso-8859-1?Q?pJ1vW1F7Kifv0bRgPFeITvs6EoO+RJvzSCHr5g1CWsD9Cb0qikhmcmVJJg?=
 =?iso-8859-1?Q?0yEho55OTklRbRcnTUr1SbMhJpXqUSPVxmUFKAm3eicyq4lhVSZsnnu/I3?=
 =?iso-8859-1?Q?zwmeOGyunUuHb5xCwODw9Z4eEk/b2VASngOvctLOTqLyVCv6Tj9zK3KsPS?=
 =?iso-8859-1?Q?mLnHbJsIgMw8nPhghlUs5OTgpKRR0SSqI/ti9o5c8lL+H32qiB90cOPpCr?=
 =?iso-8859-1?Q?Qd/+KfhuRTvmIoUYVhLGuJvpAoraKHCQVLul40tQuxKKIUcKa9R+tef22p?=
 =?iso-8859-1?Q?BbiIoQwGkNDQzpQrS+MDo6kQkcEVoWYQyWJuDedg4HYDd0jiecdX6FyplW?=
 =?iso-8859-1?Q?SMOJMVu7pyGdYvl7vI6JGipyRiOMuOykfTn0oIy3bvNPQJMnK5gPvfpQ48?=
 =?iso-8859-1?Q?lk/t+kYUFWfVhjbAAQD7zjpKv15Vbk6q1+eLzRtm6QhjVkcydI9jAlxzb3?=
 =?iso-8859-1?Q?H60e+T3bkzV97W9FKB5XKxPULzcQYoK6HvgPt7cUjwE09SI7VE7kYQZeMN?=
 =?iso-8859-1?Q?wzXW9qWDjGuXXzlqE7UxfjtuU3UdO3NglLQ7GS267l3deFJsEssQd7Hj42?=
 =?iso-8859-1?Q?UWXs2yKqM5kD0tl0zicVUWeZ/CgA1XUv+sYP/94uxsUxHEZprjK0zbTeJC?=
 =?iso-8859-1?Q?knVK6Wm0s39U9TVAB9ueUXbCtSqRX1/8VsYpi7x6NmMvXtGIf8c1UpNf1N?=
 =?iso-8859-1?Q?SDDrBmHn2dUMDL200G5WcwBtC8LbEoGf0Bthl3dR0Zp040pux859wCDiL5?=
 =?iso-8859-1?Q?MKrHVvIbPUgQncymiG6WHbbZ/fzyWNF+NBkrw34zfZHNDuXiSl3ElO7etg?=
 =?iso-8859-1?Q?Wx+eqwI+Cl2tCrYPhom7YommfEBhY8/dfsVC2Dp/PaKwQUURKKPXEYw7TP?=
 =?iso-8859-1?Q?SPKZN8sPqhUMLplhujm+FnmFuHOm85Gwk301hRx9qc+lYC1L/14w0s2ho2?=
 =?iso-8859-1?Q?x/RQXSqrYjvqSihXeGMevM8zd3MK/419K1iWmQqxdOghZuEGn6uqrA4MnH?=
 =?iso-8859-1?Q?9sTkH+sK0Afq7eAyOEXF2YmSAU1psKQ3tC1x3AuLAm0y28SOyHzL+tKto6?=
 =?iso-8859-1?Q?Q1oKE0cB21S6PlRWSwo+q39OvYlAyPl22fiz/ro3swAzLB+FaM5f0boY1N?=
 =?iso-8859-1?Q?WvlsxsWdZ81OkOVNIbVsAacKKtwDkag=3D?=
X-Exchange-RoutingPolicyChecked: cOcDOoS+ZGQom5ZYr0a5wThm145aS26EaYDpxxsiwEb5b18F57EHI1aUvdGLePpFPgMDlyvtkftVSKUrCx7HqkcJMqoujHPbDh3n5lDNvVPZKCfXjjIr1DTZ4CZFURX9+atqhg+U47UNFPG95LDA6E+pIZaqMJaHmeUdLgIJl+iCoV1RC2oQLQKcZBTSVns0E+p8OPU5uRFfFfyspis3448SAh9iXZD71OsUsrdAZtOAKnlIyAvAq3jI0ZTs3ifTUZ40hzArDIlbMmwoVPibAH9+3fIVwL7Zka8lb1Sh99GWRnfoeZlMSPChaHrlArw0F98I+he6YlIjMeoqZeM4Kg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fce3ea6-880c-4acb-1fb2-08df0867c102
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 20:29:42.4147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAPFDIRqjfSULo7UyuJWZqyRkTnstpgsHICO79AEio0Zh7Y/sh38NRJoly8o7kArJbcaT0J30vThQCMlrrqIkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
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

On Fri, Aug 28, 2026 at 04:14:10PM +0100, Matthew Auld wrote:
> The flush is gated by the WA, since there would no valid use for it
> otherwise, but for some very special usecases allow bypassing the WA.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_dsb_buffer.c | 2 +-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c     | 2 +-
>  drivers/gpu/drm/xe/xe_device.c             | 6 +++---
>  drivers/gpu/drm/xe/xe_device.h             | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> index a7158c73a14c..82974e933e8d 100644
> --- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> +++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
> @@ -88,7 +88,7 @@ static void xe_dsb_buffer_flush_map(struct intel_dsb_buffer *dsb_buf)
>  	 * both for weak ordering archs and discrete cards.
>  	 */
>  	xe_device_wmb(xe);
> -	xe_device_l2_flush(xe);
> +	xe_device_l2_flush(xe, false);
>  }
>  
>  const struct intel_display_dsb_interface xe_display_dsb_interface = {
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 73469ea5f333..b46a2c32ac07 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -203,7 +203,7 @@ static int __xe_pin_fb_vma_dpt(struct drm_gem_object *obj,
>  	vma->node = dpt->ggtt_node[tile0->id];
>  
>  	/* Ensure DPT writes are flushed */
> -	xe_device_l2_flush(xe);
> +	xe_device_l2_flush(xe, false);
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 74d566693dfd..82e0a555fa69 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1270,7 +1270,7 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe)
>  	return false;
>  }
>  
> -void xe_device_l2_flush(struct xe_device *xe)
> +void xe_device_l2_flush(struct xe_device *xe, bool force)
>  {
>  	struct xe_gt *gt;
>  
> @@ -1278,7 +1278,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>  	if (!gt)
>  		return;
>  
> -	if (!XE_GT_WA(gt, 16023588340))
> +	if (!force && !XE_GT_WA(gt, 16023588340))
>  		return;
>  
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> @@ -1333,7 +1333,7 @@ void xe_device_td_flush(struct xe_device *xe)
>  
>  	if (XE_GT_WA(root_gt, 16023588340)) {
>  		/* A transient flush is not sufficient: flush the L2 */
> -		xe_device_l2_flush(xe);
> +		xe_device_l2_flush(xe, false);
>  	} else {
>  		xe_guc_pc_apply_flush_freq_limit(&root_gt->uc.guc.pc);
>  		tdf_request_sync(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 6c4cfaebc44a..6d3d6d5eba29 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -205,7 +205,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>  
>  bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
>  void xe_device_td_flush(struct xe_device *xe);
> -void xe_device_l2_flush(struct xe_device *xe);
> +void xe_device_l2_flush(struct xe_device *xe, bool force);
>  
>  static inline bool xe_device_wedged(struct xe_device *xe)
>  {
> -- 
> 2.55.0
> 
