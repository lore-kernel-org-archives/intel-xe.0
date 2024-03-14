Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B813C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 17:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B4910F534;
	Thu, 14 Mar 2024 17:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFmFXX2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C4010F534
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710438319; x=1741974319;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5L1HxBLXBajJ9gy7ZfXHcOm9ttf0XJTmrKmSGht5Wgs=;
 b=UFmFXX2iV5fXI/r5+K+OX+SMp1Ojuhqlc4g5cDHyd8P1AZK4POnnpClx
 WyY/1ePuqmvJIkAc5Y77mDosq0Ab7rfkN8GZh4UGGIw6mjrvnK5nwIgHR
 X93h/eg1N/OYOWWKs/3Nxsoy/89KAZGrnGRMNgvA/ASYWBpkIXD0+3Hwo
 wq9/GRXfZGboSmJb9boZYFM7nvwG7Ayvk0mO4u7PlbV7u75F3LDql77VJ
 7T13oA+EZhYEKN72VFhIQpGVzRnVJT7oe/DFQcwYfXLfSUu7tFCJ6A6H5
 KveM3qy/h83xcizx+tZFKrKnUVWZahnYfBz9EntwDzCazw9PPn6yCVWOa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16675506"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16675506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 10:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16967152"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 10:45:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 10:45:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 10:45:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 10:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZOXFol2V5Ass9N0xlRKrxDzBQ1Q/GbggfVmoq6FBrO8xjzUdToXPy6V1wRESDAl4L9iB16co/vFJ28WP0Aok4L/bsOYW+Ly++tx/zg78UH0uPUoy/RMnUzn1nYHNTxxGoPThPkQJpD90kUgCOPp1N3fPW7mXY4A3W+NaMASlWj5/xGA7O5YcxSdFaPO7RrXVePS+jLcyyOC9raAgq+whCq1rYuh569Jp/bPHJbjLsftjbnWOjNae4Pn+p8HOCFoBrPj7PidAHXwaicjRBMWYT7al01pTEDk6BEyxSN0WTBD6cffHefdockG0wng8vAktvDUeqeyPziVBEuuwV2sHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEXQBM65NFCWNEmCS2K4QqYdnqXfetmDdf73Dtareis=;
 b=JUsb1z0Ahm/RPB59AA9pHcLTp8MhY1GfgDfjtFgve8Rfy8HACwXa430LRhOdaI8zE6PWCxu7uywY0Yj4WWD/WRJ2NhQbtNwTJ9L+ZLRjNmkl5btkDk3affRvzk+qm4fX3PK/hM6i7g2JXDhHvgZOmZTVGxG1IglSIFtfcfFo0feTlE2AeFri7+joUXotR1anqyhs13qgCo38r8fzt2lvPU12Q/8gePBETpVsjtz7hRSx4t2PLhazSYykYoXdx902XikA5icoC3oX53Nmh8vk5Fw9AMbOeST4KnGH+tRb7NyYJFMTmMymgcUok1H/q81Jcta2jQd9qA2zYtz0GCkYZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7423.namprd11.prod.outlook.com (2603:10b6:510:282::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 17:45:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 17:45:12 +0000
Date: Thu, 14 Mar 2024 17:44:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <airlied@gmail.com>, <brian.welty@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Helper to get memory region from tile
Message-ID: <ZfM3cfawyb+D6bd5@DUT025-TGLU.fm.intel.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240314033553.1379444-3-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 253a8d20-4832-4e6c-355b-08dc444e7fef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KkgspKEVEDvu04JFQ42bYhM+K2IsnAyJFLU9Z/W8/gWymYIqU+8Qjkd0AsjpO8WraOvHRtF5R04hjdYIGHtMyegcDgv83MGn4tmpBn7rhEFw4iNCBXMVns/syj+7GVMQeRFeEPDVqFJ3C4L+67QcrnUELu/AwpKFGNlecKJZQDl0i9tdoe27qAe2O5F2uczyKV1SFH6wovPyAuSvO84v3msZnG47+ZGoBeuCBGEa15sELAvYQOXjafJhWDrp3ahPiPccRc4e8MQ/Rqza9idhM/ULLoVoe3U7cmFhBJoOg/0irS2h239UiBkeEA0lW4hWBmcQKkFF5MLRLgfNg03lPmyt4IHtleq4H8EqlpOcG+vunANiXFIZvyXr+f/INGzzWLN16+6CH9OE+xWSSLxwdhmnrJS8cODYcKDHei4W+kHUwkioi+3jj3vXBGb5Sivy0YSdFwTIsLlunWuWZo2pQUT7EJA30lD9nj0+UdfE0WdAk8sqE9Shd5B/kYpCMICNNyXbQg/yUv0Quk6Brbz8bg9Dj7SUzgj199+48HHIaxjoU1BAEVA2neBTLfFZaWlE7CaQss9kgVGZQm1dHgmQInibdqaHc/H/RNDvRKqEyb9lmxz84QOqVVpj2XolPrzsAvqrwKXpkEnagxKhjI8THZXuyirIZTt6XfrJtkulhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ctJ9LtloDq5iPjkJCdz6s1591Sp5ul+aMk+bNRnl3e2W/2+FFUoek2JliAaX?=
 =?us-ascii?Q?DCfoEKFqw7onzURbGSQM7i2r59kruOxuuf1DAJGUEhRxlNWbWc0a06NwsbKV?=
 =?us-ascii?Q?ns5aIauUTam9fDR0R1xhGWAPyH6RExT0O6SlMsTZ5oThNOfNNXbMdHSQtcoL?=
 =?us-ascii?Q?ISI5/k3Wt2LkUdnFMj4kZoItKNK5qRZzbh7PHeXCfF9zwtSxDuY3teD3vGjr?=
 =?us-ascii?Q?QQkNqNDV7O6V1Uigl2Tg9pxlQa9COwopAc3iWHFa7HVogjXfJvcZD5dDMxTy?=
 =?us-ascii?Q?Ta9tyICl5OozTaSysTIVr+OvXuYeK4Gm4x1egKgTijM0HF7AE0FgUqVV3Vp8?=
 =?us-ascii?Q?bpk8FSZkC4nXkefQrDxSTMamxeg7WP3RIaGj/aYPMJwfnPkRSWUNLMjXEdN8?=
 =?us-ascii?Q?T5wvkARlKKHQfpE4lR4T6cHZd+PHxLl0rfnMoI1XZxqBmp/QNHurb++XJMtv?=
 =?us-ascii?Q?XKeVbsm8McGrGgp1qzYtL5/+DMRvRdVz/FmtYDBY0t4tPbm0wzGo6ydLFAlO?=
 =?us-ascii?Q?dVq3PrWqfJ++bVIfPsn4sg8Mir3LxN9jqbx1+fa8cnSidY+jYDEenS6K5A5/?=
 =?us-ascii?Q?0iYkW+gHpZFE0EjjVmowY08KzjtOCcrAqjZfEHEr6x1mmsW79soAOy1u/5Yv?=
 =?us-ascii?Q?rpwVJ6SHG+R0zeMgi915L2pY2VtuWZsv3AxSEouLICTYhxfgS9KFkiRSa9yq?=
 =?us-ascii?Q?7lR+ZIWL7qozLQ+dGbHvHgU1I4qL44Vu5PYyAojrZ//RvP78n0WVZ2hjYnqo?=
 =?us-ascii?Q?Q1QvleAyGRmYQ7vbukJXaheyyRMl4nIG2yAIDPyKIpf3VNgqDSjlbZ26vXda?=
 =?us-ascii?Q?4YyKd2YvKLt6xXbKqyULQX0EZU+TPqBqrz0jPLa95mW+2884fClG7P7/HvY+?=
 =?us-ascii?Q?9QcuCj0LHjGB/mO8ZjRRPwm1456M8jNqoy2HaZkscb7JAIEaF0v4d1ujTn6/?=
 =?us-ascii?Q?o2gDhw/rI/vAogm8Kc715BaIfsGHOkZtJLddcnGOvoHqlf2GStVan4EpA7/D?=
 =?us-ascii?Q?OzXsSjd6RSpAY+ixj+UfjIJdn7gI9rJvCtQowmBRkihn3J+sRB8HG/ohqRP5?=
 =?us-ascii?Q?pA88I66kBDB7VwEMU/rMJsLGWpDTi7Lo2UxDflXIi71z4rrGOKQH+HA2OAug?=
 =?us-ascii?Q?aKiL/LM6k4gwmcc9FSgWvrZCaNvlnBQfdRXHW41/T1YakqKYGf0oipwZmX1o?=
 =?us-ascii?Q?52IJdHggZLSSbR8udxD/IiN112E9pHQ8f0op4VzIMOZIioaeNtd6wbap5ay4?=
 =?us-ascii?Q?zCLMh+2dcvvDCu1vHp73DrrXUwKICogWEihW7f9yAuY576V7npBa6kmoPmEo?=
 =?us-ascii?Q?ViSDmjtfBoWpt3dHSY0/Jqxlp+/y7ddnzpNUjeZcQT7SXMdxGxcVSImB132V?=
 =?us-ascii?Q?sck+4aUWYPRWt7uFSsNYYP6g7z51K6I1rZTS1Rvp3jXlZ8mCckOVr/SZfH0C?=
 =?us-ascii?Q?TpuPL9wemhkxG8QpmCLVtaeQ+hwc7Sfq0mRGYOveb7kcUKYueI4VEOiWRfko?=
 =?us-ascii?Q?Nd9Tb8r9eQD3wf7jz/gV/AC4EdNbpYZsqnXWzRkIGirFf3BaICvQeIfv6zM0?=
 =?us-ascii?Q?X8c16YVbC4JaMTOuB1sdRGCt80SVOK5k+1MKtq9ywpznoeQLW2q4txVST/ba?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 253a8d20-4832-4e6c-355b-08dc444e7fef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 17:45:12.5976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XfOvXtX6NJSmNu6QsRDoEhloWf+gh6D6OoEvJasGav7JhIvYJruAwdSVFgzzmZQ2eM9E+myOIgkwgjcnXtUZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7423
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

On Wed, Mar 13, 2024 at 11:35:50PM -0400, Oak Zeng wrote:
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>

Missed this. Need a commit message. Also this looks to be unused in this series.

Matt

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f27c3bee8ce7..bbea40b57e84 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -571,4 +571,9 @@ struct xe_file {
>  	struct xe_drm_client *client;
>  };
>  
> +static inline struct xe_tile *mem_region_to_tile(struct xe_mem_region *mr)
> +{
> +	return container_of(mr, struct xe_tile, mem.vram);
> +}
> +
>  #endif
> -- 
> 2.26.3
> 
