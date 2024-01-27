Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9202CC47422
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jan 2024 02:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC62F1121AA;
	Sat, 27 Jan 2024 02:40:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D668B1121A8
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jan 2024 02:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706323218; x=1737859218;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=My6fKt1/QevyscOGREoqW5uc4DgSELD90LXVnQysfIo=;
 b=AFVBnjPY1DpbAhnaViocYwPyAUJtclxJq04i3bLWPuWjxdMVyvBrfeRe
 0p+UKZD+K1lIwQun8gfty0psX6o4CeIBWB0cGziOhrxX3xTV3FXqtbpDQ
 rd5lObtTU1IP/3Gfdw3hmbMmtjbGrq5/cHBkXLfspOhgKq9FBzoI5LZue
 MAniWsKreqmRkqxNUuMV9XMYNFemkadInBuQUsW8gRRxxO7OjuC4GyZjj
 glg3KNS9TK5tQK5iSNyRyHNF7YfH8YkFXMdZ2kbFLPeXhfc+4GkVg9mFg
 vWldL6AGxMGyWQsRs6rp2xBsD76OuJQfZA+RuJ9q5UPbEDtELWL7vLZLN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="16160984"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="16160984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 18:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="29268762"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 18:40:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 18:40:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 18:40:04 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 18:40:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RINUR0IIJJV14d08L20wiUAmkKQZRcR8QsGhT7n2cnyeufbl6OFa3II5Jhd3Dg/pyAnmyLvO8KC+uD7C/6gxyQP6p19QsHkW89eKaUJSiKEbuSnRua+0zUrHpd4C2JK9906G8dukib9SC4MEe4S+xouq01XNDGa4JNTIwiyugM1Utf5woEVxa+v8aa0eklpbjKKTkq7Vzyv5qF5eJFjQCpQdvgsQUfnrQkOclEejlbwwmUq4ia/brJ5S2NoKjCSzobC315IAcJbHRwXDWi4UAf4ixaLFhD/t0caXFtd4HeEKFs7UWdLuK55cn7tKdKwUTR7nD1mkZRlju13pgnAZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMyNIj1sarOLCaN+P7NrA0mNpzjOhKEFLnqRemRHznc=;
 b=PFxWylv7IkwbQtZnBRorxZWZVS42v1JZgX7sdIqv9NaUdcDfyaXG49LBUkknHJt+o3+1/ijWoXGvYXLmHOxdbVlVM8I9Pflfp56SxM9jXArrWT8TBt4AHt5LEXTgBKbtHHDD75KHrIw7rpLcH8DPY8qvcaS6nVRulCTAB3EkjbYwxOO82Igyq30N/DmksKxrJoPx2e3zDgURXkmgogE7ZACJfR5AY8RukGVIr4ayT2uZiRJVVbWZv/2oKujL4BC18pScqgEI9M5/2B5q5oXNtcGDixHYiqQpccL3cjKbQEFRjKhd3BEEVDAxnDZizkoqm2MbRQEVB6zEMTBDJY5GzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Sat, 27 Jan
 2024 02:40:02 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.035; Sat, 27 Jan 2024
 02:40:02 +0000
Date: Fri, 26 Jan 2024 18:39:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <fei.yang@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: correct the assertion for number of PTEs
Message-ID: <20240127023959.GI7083@mdroper-desk1.amr.corp.intel.com>
References: <20240125065245.1204731-1-fei.yang@intel.com>
 <20240125065245.1204731-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240125065245.1204731-2-fei.yang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: e0235243-d4b0-4c29-9bf1-08dc1ee1432f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: baxpqs/Rz5ti/J5/uqtfhm0a2e9kC/zShEnq5z/0OI+1FnHo/EvsRanJceyo4jp1T3FDVpPER0yJSuFJz6Y9Iuqr0MYg5eSudxnFPoRvyJE/c051r7jwRoAFdjy8NDwUdnfVpUSc7xLJyu37jXnrq1Cr7WQS4md1dn/gOO8wvliIOElzGPyk43VJiRwrNs+VOMCLCUSpigCzdMVK9YNO4Pcc86MxNmOQ4eJjcoi+w12Xh3365M2pk7Ldifv4W4UYNmeuXNn4oy9+9X5si1d50JEDJNBSKVCb9nqHAORyOISyCovcrZavnJ0nexvhsEmVCNRpFxr2BS75ZfBOrtCYQCjv5FVpKr13j5NjQW6uqeFrtMrzw66rA2i/XJTd3rjqtf7NaIbUqCDC3VH+9F07BRQLtjEk4Ij4Pr5BMERudpqC9386n7d2M7gZMwPERA4UbCnSCchLx8FP4iZq0HpmwG+7ppiCUSNO5jEUuXLINa8EKVtHWMzg6+C717GjeOsCzwSuuuztIFJ+Q/PrQxmeSsE2rqoWUAt7+YNDRQQb5C5PCY+rNL6tXduGgqqbE4mp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66946007)(86362001)(82960400001)(316002)(6486002)(6636002)(66556008)(478600001)(66476007)(38100700002)(26005)(6666004)(6506007)(1076003)(4326008)(8676002)(34206002)(5660300002)(83380400001)(6512007)(8936002)(33656002)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B4yrZvW+apJzfws5UXo85eedjlTKqItvjs8+HuuWDUSkXbY0JiAfrfx8bP3g?=
 =?us-ascii?Q?Guuh3yb76IFev2ZQ3mLyL7LtsTJXZ84zXTO/No/cZEQXyKEc2T2hGFPBm59q?=
 =?us-ascii?Q?QUkZjDKh489F0T0eXRndT8VaO+e7JFXVetqHOW3jjIrLRERbKS7tNHf2Fp/J?=
 =?us-ascii?Q?52QkSI7JP/fulCgvIaEKM6G1a6sjT08oIb6cGKtoTpwdpW/WfgRjA00hmyiQ?=
 =?us-ascii?Q?MHl1g9dJyqFq6mkwxOYilHf/yB+KxJ65CJydh0FBw/gU8MgIATUb4E6YNlMI?=
 =?us-ascii?Q?uG0RtH9EnTT4tUKq6ErabmlTxdwVc5ITpJbgbloykTa8E6T+sao3Nvq5SoKY?=
 =?us-ascii?Q?c5Ml7HFzb9YyvTwMY4orQ2bBmrV1UCixZM6F4+0ldHjTOi4wH08mjXlktX0t?=
 =?us-ascii?Q?n+Jhs3V1FZdkQIEdXqlNt1G0sC1DwAnUE5PjRPUIy7nUub/sIDKGEpXubhAW?=
 =?us-ascii?Q?qHiVTsP5BpCR/MRpUcfP0qhpJr0DRDNyn6fJOiQgLATyEyjSRHnEM8r2O8x9?=
 =?us-ascii?Q?tXhcK5464qt1KAb+8FPrD2r2GBbuaZtAkHo9/b1LpWM9YfSbMZ8WRvQzCLto?=
 =?us-ascii?Q?tHYdqi0Z59QQwPmcYMgzpyckOPOvitreLOOWq7o6tcEWLyB11eCrU2TIelZh?=
 =?us-ascii?Q?IeD7UtiYswIaQRvLfZ8tYOh2uPWoC0zXrZDdhWdLFc3wkiOoaldWI8mupyu9?=
 =?us-ascii?Q?YJcsh5A0xYYZCwYtDlrootbZkF/BwqsZqvjngRG8skhVaf7TYjJ2y1Bo3YSb?=
 =?us-ascii?Q?qbHoTIvFSqvIKexCVJApLa9tuGgu8MLR7iS9dpP9Ay+PJWZjlrNmUj2lUjtD?=
 =?us-ascii?Q?noewkFah52zxL0IuQ2tugFKIahCT77MpfCtso7rold0kk7vUq4EZTsw9l/U4?=
 =?us-ascii?Q?xncESyScyVOk3rHWRXI6CdY6yYyKBNE/2iAUqxqWc6rT5IunQAYrIlmKM/ym?=
 =?us-ascii?Q?z3D1oyZz5WW94wQmyNyP1jF4M29ZCQ+TWVoApdy0A79PgXBWT/a7IP5I9WwM?=
 =?us-ascii?Q?GiDOy8Kzvq8e2zETZ99LzuvYtUTHCq8u+Mm/QEztwJ+EyNrqXZQE3y1RiSCx?=
 =?us-ascii?Q?BcupcpDEFnF51jNogWa+L0upqS9TqiJ04mModXU3wXg6pIUn5rpD0n4L6GIT?=
 =?us-ascii?Q?aG+JJ0/glKtReF6mYW89f/ip+iwwDkwC7Qf2XZLIn33ZAcQ4uB6Nu27D/Dyt?=
 =?us-ascii?Q?RTAmldUeKV0TSJ8ZQ3fk/r/qFGLmTTgw0GWBBIQYoWuohJtJ9Y0wYDS8pfJO?=
 =?us-ascii?Q?5Q8WaLKZcHSKAEG9BfjmU18yGQhPuXccQfzZhN9l/OYXKHHjjtX8vDS21yRh?=
 =?us-ascii?Q?JOfmnWEZYNrKfMacqUcajHQErGjA7x+9z91FNUZiZ3Tn/fM6rKQ5e0CubuGu?=
 =?us-ascii?Q?LWulKctgqX47rHYD1YEP9earUJbanKTVcfMxcgKT8Mc/PIQRYprOnTTd5a81?=
 =?us-ascii?Q?0oNczk2wVsHKot8WRTOjWqHljJNw2M54AuGvqJ0cuhSU/orrdVVdZ5OWRosm?=
 =?us-ascii?Q?DRowO1e+LV79vfgdIwhzMIB79YjCB6o0P0FlDaFmcTmAGApBDZ4NluOhaob+?=
 =?us-ascii?Q?Kb/W+zMY+5NRXb7WKOj89PYE041AF4y/Thn8xTKeKbchW/9bo9956EgkVoS6?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0235243-d4b0-4c29-9bf1-08dc1ee1432f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2024 02:40:02.4571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLRVKGXdypb7TIQEHusHC3f1Yp+i/EXEmkdP6LY6TzoogCOBSX3+EFHOUPcR8r07tgS4F1kleFfVZmXofEMYDUIr/hnBqwQE7gp24k7Forg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 10:52:45PM -0800, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> While one MI_STORE_DATA_IMM can take no more than 0x1fe qwords,
> the size of the pgtable can be 512 entries.
> 
> Fixes: 43d48379c939 ("drm/xe: correct the calculation of remaining size")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 7abf15546ced..9ab004871f9a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -71,6 +71,7 @@ struct xe_migrate {
>  #define NUM_KERNEL_PDE 17
>  #define NUM_PT_SLOTS 32
>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
> +#define MAX_NUM_PTE 512
>  
>  /*
>   * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
> @@ -1107,7 +1108,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>  	 * This shouldn't be possible in practice.. might change when 16K
>  	 * pages are used. Hence the assert.
>  	 */
> -	xe_tile_assert(tile, update->qwords <= MAX_PTE_PER_SDI);
> +	xe_tile_assert(tile, update->qwords < MAX_NUM_PTE);
>  	if (!ppgtt_ofs)
>  		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
>  						xe_bo_addr(update->pt_bo, 0,
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
