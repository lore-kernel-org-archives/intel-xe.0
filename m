Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59300C982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 09:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F4110E87E;
	Fri, 18 Sep 2026 09:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ji4DNqli";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C661310F28F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789725058; x=1821261058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BawGUrIfP+YZI5ntgZEZk1jM7lDo0olnDWfTHytNHRo=;
 b=Ji4DNqli919H8JnXNUI0MiIHZjmAMy3JnVIj5aimrcx1u9gdN9A0hcId
 pTSCB5uS1zB2pOwE0f8wAAdIjsZi2ZwqL4B1NNG9k2gI2pJVe0ddGw+D8
 NczHLCtC7yd3TEhkFvhcRXzK+B1pwFd3Qv4Bt/3ucPJig5ozKS5zU0KO+
 o/e9eFbfhWMQyYOIIGUMLxgxIEM2VE5qJsuJML3tlV87kfSCCE8lMY+Xs
 +eYkxIp54qGq2E/gQr3T8kcLG7lHkkTWSv4IzZBDOWeWYb9sVTbTt3OXL
 41wSTad7rr4cmk2NEy4OwIn+Z+Vf5k4mCS62Rd5p4tZ5aNoNi1IqlaYH2 Q==;
X-CSE-ConnectionGUID: BeMYI2+oRGK1YoGTrrvlCg==
X-CSE-MsgGUID: 4Oqi2iV1TK2FFx9odyDXOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90351009"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90351009"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 02:50:57 -0700
X-CSE-ConnectionGUID: rQm8Om6TQ7S+Q+OMDnEWCA==
X-CSE-MsgGUID: yt+l6ToSRjOTRwVqoLbSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2512391"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 02:50:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 02:50:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 02:50:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 02:50:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9NduGrK79WU0+CDZ7zwpnFNieqz7Yif8SPX6v362xq/s70utzLw+24VgO4zlLoZUifZB+JJeFjGUyFW5BcqvJcPkYxYogEfW9DPhQYq47ztVT1AZNOa6mM9iTm5pz+5TgIO/tQjBpsy691ebe3Sb65xRAY31KSJ3P2DVlWoMc2Vul4INAVd/cdlGfAMXm+fr+SGbRsRQNYVwMRQaV4R07csv2PjLjoPPwIy0NNYwirNgxXUHKGMzZ55YX/gt8ctJlrcNUnECD9O0rDTwc6ioctF4CDIoHi2yooRnj+0/2V7QA3U4ueKEb9wRMY6j5uuNcdFyPWVJCh2Eak1XUGxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QobhTZICT8VVwyIqDGQGXYUCts9WQtqE7WIxlt25uDA=;
 b=FijrcCJR6Aw+xR5pEiVKAdUjJzrFwmRcZdVFQp5ow6NbjaijJPVL8XXvQYzR9oz/lNap8L/esWPPOLfLmd0t9a2h9wApgkfgKlyxwkjQ0mmOjYH+eKSczRHIi+OGeSJyRYC0FuK9K8AKCgrQecDS8JON3Y7mLGlU4xEK1ecRofKtMXYSKX4Zdv5tqbWDBq8gSeXg7bKEFdAiXnAhWyUNENcKsTeCeNA83BRj37tzW9lJXeboYU96jGO1377fzrzfLbayucA8jSlM0qBaapy0p4dez9rpe8LGxJlCVgZTeYXWVTSogoJ3x0N/JUlFTEyaC7n+DFma3DA+VBJXvXp3Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS3PR11MB9795.namprd11.prod.outlook.com (2603:10b6:8:363::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 09:50:35 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 09:50:35 +0000
Date: Fri, 18 Sep 2026 05:50:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe/hwmon: Use VRAM temperature sensor count
 from thermal config on CRI
Message-ID: <aq0JXGomUXDbQghg@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910182756.638830-3-karthik.poosa@intel.com>
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS3PR11MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 878dd6c9-8b75-4b88-0c5e-08df156a4923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kUvAoh5V8vvkVb2tHb4A3zL9cmPeKi7MyG29HR08tXuy7TPlzy1MKX1aYfmKfHkkLXbvVhAksJdcavSPliddFhZZGyw+5nwrNA3fSQ8unoBHib9MtqiDWKTWWKd38w170uW0F+wMHn+rZoUUkxbNfRXFnD8owp9I/wNbqAtbcbsVYGUOqao+8yvuaqYqEszxGkf4InZ0cm/S9RwXOjhsxRuZqafB9QitJiwYbONlLX7+N8ArF/nBB8WMTWD3csLsnkCJm2jGt39+WgA5Fg0c5Yh0KXu5R0z/UticEmhKZcRJ0u5E6LOYrPvfO9Oi7rI2kmgZG9g0KjUMKtnLBPQL/CqI7vl5Kb0pv9ppynYbhrkjcmPErEmlwQeTiecrFmBqXqtH5CEJgTvQ5M5J7V9aA9AtpwpwH5WVrOFnTkqXZiY0wa/6fnjqRNJ/S7iMvD5NKJS6cQjJZMI4ux3ofJdx4OF+4cNZjGSapvbIffIysGuILBlR7uYOmPSFRkuhYZJB/ZysD8P7xSp6wCemsFIxT0zRP42FqS+H5PO8EPeL3EOqnu79tfkBjIz2z2VA/6E/rqYYnUlf1j0gF6RJoW0CT0jif+1uN2Vtp/b1kUuY033uLEhTWNUuj+DFAX8XL7We5gXmxax4Waswl1kYv09jw75wdMCMePwa+H2c3bwfRNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZK2STDUBPfPWs1wfc4g4t/c4edYVl7RasO3QQuLnZVIqGOM9ffM0xfxdNdlK?=
 =?us-ascii?Q?d7DdmPo4iwtYC6wICjHFb/xxDGwEHyQdK3rkxGviR17PFOWLlnQyzT/YoXD7?=
 =?us-ascii?Q?BNQTpNlgQY1ee+paZnZ17cp2/BAwlIKMVmKq7ET3zVgeCniz9BN9xuZ3abue?=
 =?us-ascii?Q?pOK9EEgFHKjxWdmM2i+t2Blqlmu+H9MDYHrqZm0JgHbx/1e8g7/0J4MX+VAT?=
 =?us-ascii?Q?W/uerci8gA796c26e10Oy2G81HhHns5Zs1vjqRl2Uc6o+rX9bj2U7BdCKhsT?=
 =?us-ascii?Q?y+pC6jiKSjh7Hm+5r3m+oaoHsVluRV/J2jL3wAaTwWeft+jPZk2h1Z9eRw2r?=
 =?us-ascii?Q?ft82KHrK0n2afG/YjH0J58lXCTH50iaZCW53BSfzQ7ji3z6/ShDiIrtWjOJU?=
 =?us-ascii?Q?Ev2KaPBF2e7ssGD4IPJso4IPfuTwJMHuB432B5PnV5F4qUnZa+1cQ09N0miM?=
 =?us-ascii?Q?nfvRUEZiDWNrdTcmtu0R2xPlJm30G5x5zAw0/WjK6Y9q7yyK+QJtCwTp3SNX?=
 =?us-ascii?Q?NLZUkwC3oSHfrIcIwwC03Rv8+Hjzo0y+xtqttNcOmQiyvYjdlkaWISdkdord?=
 =?us-ascii?Q?nBkm0Mn+v0Ut6THQVJSQhsExbPpg4w09tMHlUcGlKMJqKdHwsiV0dVBY3c2K?=
 =?us-ascii?Q?tKmnM9L4gJfqn7cb627PbdMrqYnr0V1MSgN34TH3U6iTxiNoM869JidrrLfg?=
 =?us-ascii?Q?e9NytycOv3MGJUTwAnMDt34fGlen6i6TIFGfTQA6feU2d9telW7C7bZHAa18?=
 =?us-ascii?Q?ocFzUlHxybDthhhV4f4bZAOpU/s+aMjqHS/5abl5lNTcu/TGhHMA3OcNhkh6?=
 =?us-ascii?Q?fW20fU5CNFOjEoTWtp0jJZjCNXk/2/jupyxqw4aMGeNXAiLGfKkJcG1vL8Tv?=
 =?us-ascii?Q?yt2XXxYOpYXUYBlAWykcb6F/74j4400rHfrFvaL3Fd57MaeQ+cc5GMaqCGj6?=
 =?us-ascii?Q?VObPfy6FBcuttEG5OvXuV82xvDKnqEnRzVLfJQdytuqBBuElA49gDyk5pWUJ?=
 =?us-ascii?Q?BW+2QHxrwnoCVU+muxLlAvkn3pT5vX+A+3qvAr7+l9XWj/fnaKlv+RFZg03F?=
 =?us-ascii?Q?FXXUvr1YrXfMZS6mE2IBjKWshSvKg+X95k4Gb3cw8QMTgSzM0X/ZZE8CA0HH?=
 =?us-ascii?Q?HwMvEjlX4ZRwsQa64IaKs/18h117Rykq/7DHY/y9eM2+HqCMeLDrbKw/cjig?=
 =?us-ascii?Q?vR1x6ru12T4L9rxQIYcZURZSNcgNxpt9pAv20FZkZ2xRrMnRvNwfzQGhoYVL?=
 =?us-ascii?Q?HAclxu6GcVCAeys6x1BG6I1YfNvx4mv0troEG5pxGETHwqym2JCGrxcpkXmE?=
 =?us-ascii?Q?mJkNid69jf68A22hcmjWyGV8E/w1CgnyhZPO89a0CoL0zdFz+RXMNychsoci?=
 =?us-ascii?Q?VkkqiZmwcSnWM1Y7oK8luWSAv3BlzmpmyojD5oeagUnM/PGYOBpgl+ogntV6?=
 =?us-ascii?Q?2xcKGi/B7wyUi1WTfQViRe5GHAC8wapsfDXSktU074ZRgd1Ca+SZvYVnb1mC?=
 =?us-ascii?Q?rv6d5dXhbnY2QJPhZraDrM1B1IujpZmgNTWrsYK8LWWq44quuXENN2wUC4iW?=
 =?us-ascii?Q?j3Ao11wOQsHCzmuu0WBFUEmA15rJMIV47FrtEXYyi/uYQ/4rNWFU3HLO8JjN?=
 =?us-ascii?Q?06UgHJDXd0Bjbhm/tPG8734p9yKIOIIzUKRdvvLcRxWqSb4QhxIRzNH/eTBq?=
 =?us-ascii?Q?ihtaEqHto06S194szC7AprVhLUiiKcqE4lkO/1YlcZLMWhIPYip2rB/MQ4O8?=
 =?us-ascii?Q?gzhIrRSjlQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: FCNdRXaDlePcg7lb7k0EWtuxK4XHKn3Zv4PLJBjYs1IJV/F8vxw+uOjS0C/IXbCeplQBrkppxS7w3dfeauzxZhLvlLXrJa0lcahRcC9Gr4nN9o67d4WCbHqwfI8RvXnawpXHhGcFEd+ZSTAVrJ3dhuJMWDmzrLxZD4y9cFS/uMqbucd3bU8XcuyyW5eDNYDbpgFIHMNMjS9i4+qvF5QQ4qCKp+3UhYjs/pfFPITevQKAtgwYsla/h4VCBHWUumzcobhpAJPrQ8UZ4L2+O9QnpfYwGWD4wgY8+UqrpJSiFavNqP1ucT+nt9nev9n/wlTZB5N6Cw7UmWzfT+jUK+K4wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 878dd6c9-8b75-4b88-0c5e-08df156a4923
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 09:50:35.4692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84GkA9CWN656pmoCTzoeBZkevJmo11rTVIG4Cwq4K3hr2hzxu8F+OUjCBYnxFX8cO/fmhylN5AAtUV2i0tCtuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9795
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

On Thu, Sep 10, 2026 at 11:57:53PM +0530, Karthik Poosa wrote:
> Read the number of VRAM temperature sensor channels from the second byte
> of READ_THERMAL_CONFIG on CRI platforms. Use the reported count to avoid
> exposing hwmon attributes for unavailable VRAM temperature sensors, while
> retaining the maximum supported channel count on non-CRI platforms.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> 
> v2:
>  - Address review comments from sashiko-bot@kernel.org.
>  - Address review comments from Badal and Raag.
>  - Update HWMON_CHANNEL_INFO() to supports maximum VRAM channels of CRI.
> 
> v3:
>  - Address review comments from sashiko-bot@kernel.org.
>  - Address review comments from Rodrigo.
> 
>  drivers/gpu/drm/xe/xe_device_types.h |   4 +
>  drivers/gpu/drm/xe/xe_hwmon.c        | 115 +++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_pci.c          |   2 +
>  drivers/gpu/drm/xe/xe_pci_types.h    |   1 +
>  drivers/gpu/drm/xe/xe_pcode_api.h    |   1 +
>  5 files changed, 115 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f88bacf63c83..74037a9c32f7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -178,6 +178,10 @@ struct xe_device {
>  		u8 has_drm_ras:1;
>  		/** @info.has_fan_control: Device supports fan control */
>  		u8 has_fan_control:1;
> +		/*

/**

then Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +		 * @info.has_fixed_vram_channels: Device has fixed VRAM temperature channel count.
> +		 */
> +		u8 has_fixed_vram_channels:1;
>  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
>  		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index faed2f5da394..a60a6a731d88 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,7 +39,8 @@ enum xe_hwmon_reg_operation {
>  	REG_READ64,
>  };
>  
> -#define MAX_VRAM_CHANNELS      (16)
> +#define MAX_VRAM_CHANNELS	80
> +#define FIXED_VRAM_CHANNELS	16
>  
>  enum xe_hwmon_channel {
>  	CHANNEL_CARD,
> @@ -48,6 +49,7 @@ enum xe_hwmon_channel {
>  	CHANNEL_MCTRL,
>  	CHANNEL_PCIE,
>  	CHANNEL_VRAM_N,
> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
>  	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>  	CHANNEL_MAX,
>  };
> @@ -142,12 +144,14 @@ struct xe_hwmon_thermal_info {
>  		/** @data: temperature limits in dwords */
>  		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>  	};
> -	/** @count: no of temperature sensors available for the platform */
> +	/** @count: temperature sensors count from READ_THERMAL_CONFIG */
>  	u8 count;
> +	/** @vram_count: number of VRAM temperature sensors available for the platform */
> +	u8 vram_count;
>  	/** @value: signed value from each sensor */
>  	s8 value[U8_MAX];
> -	/** @vram_label: vram label names */
> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
> +	char (*vram_label)[MAX_LABEL_SIZE];
>  };
>  
>  /**
> @@ -271,7 +275,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_DG2) {
>  			if (channel == CHANNEL_PKG)
> @@ -777,6 +781,70 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
> @@ -794,6 +862,14 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	u32 config = 0;
>  	int ret;
>  
> +	/*
> +	 * Fixed-channel platforms don't derive the VRAM count from the mailbox
> +	 * config, so set it up front to keep the sensors visible even if a read
> +	 * below fails.
> +	 */
> +	if (hwmon->xe->info.has_fixed_vram_channels)
> +		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
> +
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>  			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>  	if (ret)
> @@ -810,6 +886,16 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	drm_dbg(&hwmon->xe->drm, "thermal config count 0x%x\n", config);
>  	hwmon->temp.count = REG_FIELD_GET(TEMP_MASK, config);
>  
> +	if (!hwmon->xe->info.has_fixed_vram_channels) {
> +		hwmon->temp.vram_count = REG_FIELD_GET(VRAM_COUNT_MASK, config);
> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS) {
> +			drm_warn(&hwmon->xe->drm,
> +				 "VRAM channel count %d exceeds max %d, clamping\n",
> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
> +		}
> +	}
> +
>  	return ret;
>  }
>  
> @@ -1505,7 +1591,7 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "mctrl";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
>  		return 0;
>  	case hwmon_power:
> @@ -1634,6 +1720,15 @@ int xe_hwmon_register(struct xe_device *xe)
>  
>  	xe_hwmon_get_preregistration_info(hwmon);
>  
> +	if (hwmon->temp.vram_count) {
> +		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
> +						      MAX_LABEL_SIZE, GFP_KERNEL);
> +		if (!hwmon->temp.vram_label) {
> +			ret = -ENOMEM;
> +			goto err_null_hwmon;
> +		}
> +	}
> +
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>  
>  	/*  hwmon_dev points to device hwmon<i> */
> @@ -1642,10 +1737,14 @@ int xe_hwmon_register(struct xe_device *xe)
>  								hwmon_groups);
>  	if (IS_ERR(hwmon->hwmon_dev)) {
>  		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> -		xe->hwmon = NULL;
> -		return PTR_ERR(hwmon->hwmon_dev);
> +		ret = PTR_ERR(hwmon->hwmon_dev);
> +		goto err_null_hwmon;
>  	}
>  
>  	return 0;
> +
> +err_null_hwmon:
> +	xe->hwmon = NULL;
> +	return ret;
>  }
>  MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1e04e8ef2611..d98b240e1753 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -416,6 +416,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_fan_control = true,
> +	.has_fixed_vram_channels = true,
>  	.has_flat_ccs = 1,
>  	.has_mbx_power_limits = true,
>  	.has_mbx_thermal_info = true,
> @@ -794,6 +795,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_cached_pt = desc->has_cached_pt;
>  	xe->info.has_drm_ras = desc->has_drm_ras;
>  	xe->info.has_fan_control = desc->has_fan_control;
> +	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
>  	/* runtime fusing may force flat_ccs to disabled later */
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index fed509ff601e..87b8121b3e51 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -42,6 +42,7 @@ struct xe_device_desc {
>  	u8 has_display:1;
>  	u8 has_drm_ras:1;
>  	u8 has_fan_control:1;
> +	u8 has_fixed_vram_channels:1;
>  	u8 has_flat_ccs:1;
>  	u8 has_gsc_nvm:1;
>  	u8 has_heci_gscfi:1;
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 94575c476e3d..e1079eff72c6 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -57,6 +57,7 @@
>  #define   PCODE_THERMAL_INFO			0x25
>  #define     READ_THERMAL_LIMITS			0x0
>  #define     READ_THERMAL_CONFIG			0x1
> +#define       VRAM_COUNT_MASK			REG_GENMASK(15, 8)
>  #define     READ_THERMAL_DATA			0x2
>  #define       PCIE_SENSOR_GROUP_ID		0x2
>  #define       PCIE_SENSOR_MASK			REG_GENMASK(31, 16)
> -- 
> 2.25.1
> 
