Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B58C27C7A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 08:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E8E10E41D;
	Thu, 17 Aug 2023 08:37:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8B710E41E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692261459; x=1723797459;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vEUQU/bGDLyB98OFeckESQhRgwsY1RgjZRvEJbxXbDw=;
 b=mL/lcLXLAG9m6drfn/hei5gjezs+0Xw4OgnL6jpsLoEDUwf5Re59wOo4
 AbWzY16fOChNn4BfQt2XUdFi/PD449L5jLRYkxQQodsdbiMFRuAF3Bzyf
 ni4QzH8MLJ7aSuqb2Jy/ealxgD1wc26jxP3xlqqTISxnx2uNclyNyZsLC
 OmQsSSVuZd0E0EfYQX5Hv2Aa3SOmD4bSJZSmBf6fCsXHNiU7R2oXnmOC4
 DDx5lw1F2A+GYq+uryZC/mLHg0aO4w+fi4z559z7d60SCtv78k8wMDckk
 krM4z1QpntHVrObB/ffng4i+kiSi0OhXkB4TW+COWy5xzPhhcaL5HKwWr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357715657"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="357715657"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 01:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804549440"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="804549440"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2023 01:37:37 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 01:37:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 01:37:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 01:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQNWKlKSSbYwbVqVptwk+MSeCNP87fqzWF9AmosFK+KrY9oqXepUgIIYyh0uvTYfZXyOBjxZAHGiCZJOV1l6b8UgcDy8JQNKuwJzH1Yu2JkLIibJ/9r6aGVl7TrEprEfVLjm2FaHZlOp3150ExO8CJiYEZoFDNs/YJRe5F3/fNkgQKPNC2zmiv6B9b8Wat37R97uvbJWp4nmCZRG9LpAny9Y7vhKre9fwKexWMbdYpnQpyS4sGEkiB+++qBwRItetUnPn+8qqGhYWTCebZs/v1VTd4XEYsXlQrECnTNiV4FSin6s9zPhEMzwRkPZXfmVhv85MMLdXB8/CugpNzEjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ekahExFch6D05mb6U12Yu7R7wqpgUPzW1Q+sHnnfKg=;
 b=aoVzp4GpyF+D9Sj9Z1ZB/87hwL4aA6o1/b5pX+BkN3H1n1mB/Kf24gk1bQt/ZeB29wTEERO17sjPrj+7AVb+ieiAX93cr5MfBV24PjiiEI42ytuBbDg19vBcR91kBvnVKRKMsIB0WVHo8R03LKZ5p055myeLdcyTjDUeulj6+G1YQqLPdIrqfL/P8g4gAbx7deRFCsTAgsZybqrMJysfhO74txficnQBDVmaW8VumtYykPCaBk94gl4aspdo7jbnDJMaB8DDAwfJRUqyZlaOmITkldtCHLHnUbUChH5+coglmwS0FOBVXjVNIwSq2MC46/OSEvkqzKhXTf7VZaeejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.26; Thu, 17 Aug 2023 08:37:35 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 08:37:35 +0000
Date: Thu, 17 Aug 2023 14:07:24 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZN3cRLCn7dHQsXln@bvivekan-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-14-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-14-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN2PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::35) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 531be172-e2ea-4bc0-7edb-08db9efd349f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2Erxeo+doUQNmz+e2eTycz1/pKbw4DUDd4MC74DLeQiLeD/EavIqKbm9v05ohK8naeF5wgj0rA+TF/ztExj2YhylrI5y8+bMTcEGIIVGd7SSscqKs9nJT6myp/6RrU/lUe0Ycq7au0PVjuuGuCChPSh6+vGmUb6nLD8vZLX/Ssn/1ybE+AerU8ptI+MfdIc11b0nrL8CMq8/bwVC+5jHOWXVpSJwoOzIQp59lfyJ/5Ax0NUgAzTSUSz8DgUyzFyJXt0XjppA3eIZV5ox8r5AKs3TTHyRxhtL8ZzfsIvcCv7nvhEcghe+Oc75Uxm1ZR/InM6RhYXYVpYv0t1OBjNggPbrOHVe7yYUtF7UuNOww/vQOFOmWAVCyMkR6MPBBQLFB6KUzk5IGUAEo5Y6uhXRjPFiuOsKhDJY6U26IfQf3FAgfGXQkl2OabcDIsthAp6Q78L6vAZ5S52EVXVFwbJHg+iRbsDF4Il4Mbt5lM3Z07oFGzb4zqxma5wjA8n+StuV9xDZ09Z9S8F2h43xYJqZy8wsfrL8OfbvBOxbGNVxZJozlURJWkFA/J9aMP/nZoK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(136003)(346002)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(26005)(86362001)(478600001)(6506007)(107886003)(6666004)(6486002)(6512007)(9686003)(53546011)(44832011)(5660300002)(41300700001)(316002)(66476007)(66946007)(66556008)(4326008)(8676002)(8936002)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXVYYk96aEROSUhXRVcvb0RRWWlUVWppeFlHa3RYVkFwa01MODNpM3l3cVVW?=
 =?utf-8?B?WXYzaGhldG5NTkg2V0diem1XR1NCSHBIYTdTbElSQkdJc1NHWDN2WkNTdVpo?=
 =?utf-8?B?cHNZWVJvN1lMOEFiMlpmU0k2YWcvOTc0dWJ0U0ZWWXVlakhYVk1UOHI2cFZv?=
 =?utf-8?B?Q0dLV09zVzlpelc4ZlFsSWdoNFVxeFduRlB0REU4Yno4eGVUcGMvZ2tER1dH?=
 =?utf-8?B?OEpXK3Faa2VybE9CVGRNS082N040WFNzSUF0aTJ6TGJGS3luWWszVUJZNmdu?=
 =?utf-8?B?bEdZQm0vQmJkWklBZkN4eWNXYUZjRlBjb3RZOG5MeEZzOXpuNHdJdC9jYksy?=
 =?utf-8?B?SjE0bkNYRVdtWm9OUTZLSFFlZzVBcmo4ZDRpb0RLLzJWc1FweGM3WFJBbUhs?=
 =?utf-8?B?dFZvSjVvQnpLY0tUdnMxUzljcU5zc0s5SXVoeWtrcVk0bXpFY1FTWlBmK1RU?=
 =?utf-8?B?R2NORFBNbUtxL0FENkpYakMyTHlFSEtWYUdMMTZQb3FWMnkzUy9JMmdkbWE5?=
 =?utf-8?B?aCtnc21DcjlzKzZHY0FmQ1Q0ckMvdzgrQklialU4bm5HdkE5VFdBbWpJSVl4?=
 =?utf-8?B?UE5EcnZxWXN2bGk0dDJMbndNenladUNhWHVjeisySFEvdzRwOXQ5MWF6cjhp?=
 =?utf-8?B?aElkeS9qSkx1clAxU3BaUW12MW12Qlo0aGVBY084enlFbWp4aCtNZ2pVR1lH?=
 =?utf-8?B?RXhkb1h6aG91Y1YzeWtmZmc3dC8vYTRncGhMb3ZLUW5nWVhZbHI3ZXNhUG5n?=
 =?utf-8?B?WGxTcC8vSnEvVUZOelc2UVc3Rjg1ZWt3UGZwVVFIbm9UVWcwUGFnc0R3bnk1?=
 =?utf-8?B?WDRtQnV3cjA0MVpJL0pkYUU3N2pXS2RyRWpKTDlaamtEMFcwL0VVN3BLbWJn?=
 =?utf-8?B?TzIxL3FqV3R5L1JQWnBPeEhSV0FKSVlIeUpsb1QwREp1bC8vL0xTUzIyOGNR?=
 =?utf-8?B?bFcrTU1saTR2eUhnUnI2MWdxWHFBNUxQTjVJdGJOaVMxeEx5UXkwcWRGckpn?=
 =?utf-8?B?ZVlxOG1MVW9ab2xVcUtVR1NaVjJpL2ZwaS96VnBLZ3NjR1hjNVBjQVlCckNH?=
 =?utf-8?B?N1BGSEVsMzRDRkxmTXFBOEgvSmtPaU9Da01BaEZ0Y0VIZ0w4MlRDa1RtcEIw?=
 =?utf-8?B?T09GMkkwVGxEMFR6eU56THR1ZGVsSjZhVmYwZ2dtaDVtZTdPc1R6VUpaNmZP?=
 =?utf-8?B?SWZNZ0NReWI0L1NaVnovSC9rODJkdXFxcUNlekc1TkpUWmtXTk5YWWx3MU4x?=
 =?utf-8?B?N3lGdGMwOTVIbW5VR2R5UFI0K1BhUmhOaHRQTGhmYkdkUzkvMXZldUNyZ21C?=
 =?utf-8?B?bThiS1h0eTU1ZTlSa0RwTENST1hiMDdrWnRBNS9JeWFkWjJZalJFSDdCUHEw?=
 =?utf-8?B?Q0RCK0laR2F6YkxFbTRwSFY3bkdxeDRFMlBuRXFSQUxaT21XWmcwdVpMZGM0?=
 =?utf-8?B?NFAvSVlSRldTa2h3WFR4WEJiRjdDNjRxak9zdWl1cUpLM2djZjgrcyt4WFAr?=
 =?utf-8?B?WHIyRk45QkxTWk9jT25CUTlHRWRyV29mUWZKd2U0YmR0TWdVUHF1Tjd3YWFq?=
 =?utf-8?B?cVBoVVBNQitVNG4xcnBQeEU5c2tmMGp1ZmZyQUw4cjNQSVovWjBHeCsra3dK?=
 =?utf-8?B?OXdJOGExY2krL2dnUDF0Q2VFMXE2L0ZrRzVuOHdzWUpwZ1FzTUR5d1pEVXB0?=
 =?utf-8?B?NE5QUm5uR0toR3B4L08rSHZ2TTdmaDZXMCs0WjZIM3EzTXV5L0tpWXc5d1Nx?=
 =?utf-8?B?bFByaCtZM3pNM2ZJaytrSEJZTlhQVG5nbVRTMGs5RURGK3hqN2Q0Y08yQmtl?=
 =?utf-8?B?T2dkbGpSYkh1dXR5c2Y1Um1OdVg2dVBQckJPbHJlZExGbHZTblV1VTgzcmI0?=
 =?utf-8?B?NXh5amVRN21ZUjh2bWFxVmNUM3pOOTA2SU1oMmw2VHBwNjFDWUdnTTVYQU1w?=
 =?utf-8?B?Y0NaNy9MZmtiVDNuR29aOURXa0RvWTZraFNXdWFYOHNpTWVYSFRSR3M1OC9Z?=
 =?utf-8?B?L3VHai9wZmp3Kzc5OVJNQWxhL3hlaUw5TlQxa1NNeVRnRVJ2eU4xTWR2dVla?=
 =?utf-8?B?d3JPWVVXNjlHclZ5eVZPaXFZQThzVDVsQnRQNFJjakpCT3d0bncvL3pkVUd5?=
 =?utf-8?B?RTBJOHNtU2JieGViZmhHbzVBRzRtcDMrV3gwNWJvb1FwRVZjUGVadHd2MHI5?=
 =?utf-8?Q?M6G+JBk443Fs3vMC/MJ40Ss=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 531be172-e2ea-4bc0-7edb-08db9efd349f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 08:37:35.3380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWhSHnkDQJ7EeiamnopRTlw+q+UdBB5ek3k0DUM3xPzE0OHtOU469SavQ2O/dtm1gmzle8gDgzMxpJBAKgt3w56grMk3Q2MVVHCDPFyh/Hl1xC1uCnl87Vk2usCBUfUa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/15] drm/xe/lnl: Add LNL platform definition
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11.08.2023 09:06, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> LNL is an integrated GPU based on the Xe2 architecture.
> 
> Bspec: 70821
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c            | 7 +++++++
>  drivers/gpu/drm/xe/xe_platform_types.h | 1 +
>  include/drm/xe_pciids.h                | 5 +++++
>  3 files changed, 13 insertions(+)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 70d5f25c0d208..5e3ffe76cc460 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -342,6 +342,12 @@ static const struct xe_device_desc mtl_desc = {
>  	.has_display = true,
>  };
>  
> +static const struct xe_device_desc lnl_desc = {
> +	PLATFORM(XE_LUNARLAKE),
> +	.has_4tile = true,
> +	.require_force_probe = true,
> +};
> +
>  #undef PLATFORM
>  __diag_pop();
>  
> @@ -382,6 +388,7 @@ static const struct pci_device_id pciidlist[] = {
>  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
>  	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
> +	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index abbb8a1f29a8e..e378a64a0f863 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -21,6 +21,7 @@ enum xe_platform {
>  	XE_DG2,
>  	XE_PVC,
>  	XE_METEORLAKE,
> +	XE_LUNARLAKE,
>  };
>  
>  enum xe_subplatform {
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index 43afd973e153b..29f07a00ac0fd 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -207,4 +207,9 @@
>  	XE_MTL_S_IDS(MACRO__, ## __VA_ARGS__),	\
>  	XE_ARL_IDS(MACRO__, ## __VA_ARGS__)
>  
> +#define XE_LNL_IDS(MACRO__, ...) \
> +	MACRO__(0x6420, ## __VA_ARGS__), \
> +	MACRO__(0x64A0, ## __VA_ARGS__), \
> +	MACRO__(0x64B0, ## __VA_ARGS__)
> +
>  #endif
> -- 
> 2.40.1
> 
