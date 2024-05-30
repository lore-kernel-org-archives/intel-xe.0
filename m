Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEFEC27C43
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 15:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6541810F07B;
	Thu, 30 May 2024 15:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hp5IhXYM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBE310ED01
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082721; x=1748618721;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OUOxXF5A8xaK/vUvOaPRNGX/EBV3uoP2s4m8RK/wRf4=;
 b=hp5IhXYMMXWhYHQqBAHb/dIzatKdUDufjgND5i5xs9QHh8uveSCBE20M
 G7aknMWDodHOxdsoacn5cdmL60RdIo8SrJQKZ4vv8+rhR8hdxFy1fifo5
 VotALNU5cKencryE5yYssRZQJeTvDz4IRHFwupNWfNrrHZWo8l49eUW44
 6hplfCi6+lDfLxQZ6fXlvQPxZEfRWtpPMGs086y9WkonG+OEbHTfl8Uie
 ZnBPhbFdOd8+w/dnNQMPI4F10ZhsXK+Ks0ykG72bPPjqBmfb/gyUbbvzw
 Gx5C3iIjNJx22cnnQToghs8yWAoB84fJmDYYyFn381MreUdk++ctGx8sw A==;
X-CSE-ConnectionGUID: 9D/fWI/LQr25tWthCUu0aw==
X-CSE-MsgGUID: 6AADVNA8RFeJvkshpSyuWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="36103212"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36103212"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:25:16 -0700
X-CSE-ConnectionGUID: RXkDH3qRRTa8fwwvW/z6HQ==
X-CSE-MsgGUID: RKFKA4meT0uIIp/CqczCYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40744742"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 08:25:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 08:25:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 08:25:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 08:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBG/9SNIXT9quMGcFyvTaNLRqu+f7PuZw4B8dm9VQGJmpFYV9PqCjgDDdmSW8EtpwaCbkT6XEhpWkWRSvSHcg2I6YxMEZVXL+udK65/5s033NKTleZPrc3dJqE0HQZnGKn8Qfr9HBuy2TQhYAH8B8FiXt8UmIP1NZra0vWmINbuW90AUHpwsKRONkJKzBvmXyrLqLRcYeUmu4BTL7NpsR1RxqvbykOOPnU7AsYsBw4mGOPTquGy1Cu9vlmsdngGbmj6C27w91TSa6vo5BzAgZ+Fvvt3MVE35hYW7KoBN8y4ccvNW8oHGWhUTDX1VSjwaXELgkOr1b8Y/rEflMne2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaMKJ0+bVgRPz0v47JZShthVqV15QNxiER810dbQrpU=;
 b=mEo71EBycIyHxQG9XKN+mUvTBgyljfMac/SzIZJa14/UoApC//6GRSlwujXsoMYGKHtMBU4HRjEh3DHFxGavRcaSRwgdBp5JJ4q1eGd+EyAKMTDe2mjmfnMqgGZb8hNaqRKid35TSEeXV3PmYQN8KtE/ozxTuAP5JY1id9nxfeZMuivDY6u1gkXTcLNc6J+L/RnTc+sIzeO7ueD0MQVPUoN8zmirgBY1LjXxjNxP05NNgFajNuSsXmumDCFqd2Q6I8WktAKrJ/oA6+A6vb6M6gUjbAkBqcmmCTIM5FNA39OJwUj+RpNEwBqbpsVKcguVBb+7PPyDif5hoWj4xA19SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 15:25:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 15:25:13 +0000
Date: Thu, 30 May 2024 08:25:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe: Drop xe_ prefix from static functions in
 xe_mmio.c
Message-ID: <20240530152510.GL5383@mdroper-desk1.amr.corp.intel.com>
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
 <20240530133527.1328-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240530133527.1328-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: 8541eb2f-f17b-4d10-27ab-08dc80bcb326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RoOBMfmOkvHZuZgI+x1BTBx+sm6ov3nlwnbMXs3ZvaFMrYfcUhPhwR5Muffx?=
 =?us-ascii?Q?XIhvtS0jrJimzK42YOtONLMnGTewlXBKLjWtQJ+oMuFvqyyJmxm4rX7ICE11?=
 =?us-ascii?Q?z4SIB0xM3Edt6JKw3Yu4boM3OvlbFxiLoaEbLpeYO9pGiWtM9NIFZty6yrQl?=
 =?us-ascii?Q?nXNqqUPc8JBo7IALjKCRH8RRqfWCC/asAnA2ysnSbh2/uNCBu9QlY0Ub4bcX?=
 =?us-ascii?Q?IK45zGBk83UN4kj3UbEgpnh+vQ5x/GnSsp8e/B6ocaTcv36JV7LyxUTHc80Y?=
 =?us-ascii?Q?dwtAqEoJwQ/8LIYwQOTYEtcyrFEHCgqkX/2mbeaUAJoEjmI6qYesieVpFb02?=
 =?us-ascii?Q?/VHodvrcbrO9h+xacewCADWylnMBZTwkKigD1gCbGzR2wGEFe8eI9hYFOJ2N?=
 =?us-ascii?Q?MKo0sz5h29GNW0Fx2IBj76nGZec8C9H0R+V/WkdjlGyKyWghM89QLxOjr3k1?=
 =?us-ascii?Q?enU8Cy5zc56YRfE3CfEbZuNdxrr1S8t/9Ff8ZcQyLgRKnxPoRAgtPCN8chLE?=
 =?us-ascii?Q?/U8Vq+rUISnDxrkGYfjSKZ4giGg5Xy5NvDrI0w0A66AWrVlsQmFMyx62/BD4?=
 =?us-ascii?Q?AZtyrxtji7kBrAoMiRPEkfqSOEpaS9eMNF9B5FqtvJdH1Yy7+gYujNoRd9CA?=
 =?us-ascii?Q?pu+eUwAJFAIvn6+sOC9aUPqAHnXYCKk8408/JC/0PjMWXVpW/+MdDDrIdw7O?=
 =?us-ascii?Q?ctXWTGDI4Wbx9uxEwi9t/NyhqQmndpW85s13GM7DOFTptw4EiyB+LZsVn+yO?=
 =?us-ascii?Q?/T6BgLCDYsM/5rhLmPsbo93PeMcuHjlEpjCqLFXAesz4V4y5Kfs+ePBrFrdl?=
 =?us-ascii?Q?isTJidHcFABlV4NuImJZOuxm9jgaE3/KxaT9x7MYgb/WJcHolD0t1LPhL7UD?=
 =?us-ascii?Q?0dL9EHbHjlKEUDazL1MN+s0Fxjg0oPpSZvhNlMnNcTFK2Q6uIUS28wuTq/Rd?=
 =?us-ascii?Q?E2uB0oVPYIYi6OYuhktlqVzInr8e+C4nBbX8Xg2sdLvF8z7Bsb0E0laU1RLu?=
 =?us-ascii?Q?Sk/IA5qK51+zQ52r9vGVoRajjFk5qT1MMyfCTPss79Z0cl8JdgJfxxVsHaUA?=
 =?us-ascii?Q?GX9TYtZ01qhIGeP0m7GqfcBq90zfwOgeCmIQIqRpPkpVpf39tQ3h+HwSkDf8?=
 =?us-ascii?Q?+D4Sp5Rx2OQIVWVCkeOBivBGlQA5ToeJ1SoFRVZOapFmOBfP76e7pfQXXeKF?=
 =?us-ascii?Q?urHueIGUCcEWyEJnKUH0LuJEdLVhgUJhzspPsjMRc4Fea+8dmPaInJcYleXI?=
 =?us-ascii?Q?DMx2UmHZD3akwFwcKIokGmbAo1fiboAURfHm3ZClXg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bwA2AvtYDv5Z/0gFVttdgbVX6h6Gzk2pcpkgyJxaIAh+tfYvZY7SujvXrQ/q?=
 =?us-ascii?Q?GL/MqSeg9Bfd+MuEXanPFAbIqM/n6Unv260MGmWtWMFQ7aIabCaucUwD8qID?=
 =?us-ascii?Q?0qpkSiq72M5ksvXqKUcYkOg31AUCLbngSblgOHkeZH5K3SXIdtVA221k02pL?=
 =?us-ascii?Q?v9UofVsqHwVLUEBYCaYlr3FZGFjhP2cUZHvRWiToOFKcmy6WrmFmD4QRdAzF?=
 =?us-ascii?Q?aPvXGe4xRg3FrElGLktTa6Aac9+bo2sAZ2pcGp/aENyV30lM6rPOfzBuTAme?=
 =?us-ascii?Q?KnxMqizOB+gDlyoSYg6gGbKTFAOYz0tJ0Z/A16uignXWln9fJDEL6TkptYRC?=
 =?us-ascii?Q?sZ3QdwXkLOdWgbMpVMoSIhTdtta5XbGcT87DldZr1OUbUM3KSmgV0SGnMc5Y?=
 =?us-ascii?Q?JBWgRhM1yIoULm096pmADXdBncFYDVK3AnhPtvyIIKzEWGER3zfnUmKGo1zQ?=
 =?us-ascii?Q?XH10pyiLszZo8zRN5ficB5LvnA4BKOVHFVdaQRfkQDPkJ3T6f5ik2SqxjH52?=
 =?us-ascii?Q?VrqheYjZJq7q00DzowMPS+9omHtKv+KY7P2p2+P5h+5J5BUYkX1uSaXUhl4W?=
 =?us-ascii?Q?OxuiUXqUplKKVzhB8qYzO+N+4DT9KwCRjyIhAZK33mvqrwIzwZMg2dzuTY8x?=
 =?us-ascii?Q?7X+bos5c3CVTSuNi6A5ahmM+9YBGrATEGasNS1ULHVcLeDsjso57d3mbAUE3?=
 =?us-ascii?Q?Mz5ZhYVlKFbTIFMxMe8pJsZOGZzf5hjv58muqbu5n7BTAR3fqvKcWqOznaE6?=
 =?us-ascii?Q?TUCxlqGzD/8V8AHi1nNJiILFLJTJ9+5iigCJ+bDQoV1mphxoJO97K41CDK6V?=
 =?us-ascii?Q?XH4Wfv4qTXvQbPAtt1GqEpE+Q909AfimV9/owLWODi2ivdlvKFlC018qzHOq?=
 =?us-ascii?Q?uA4rFwe10sVuGzwg+D5o5pTz1GFsE9AKAvYuQL4COTwMFfWJZj+PIFK318VY?=
 =?us-ascii?Q?wit20WBxk//wm4p5nc7fiA1dxB/JeJVg9C8dVO1Ce6v7Lyin/GsD/cmP2xhB?=
 =?us-ascii?Q?AHYC4vM2+jLYT5qTnKNqd40Nne23KUKJru+EJBrX3fRPsezCfo0ZvlMQq36q?=
 =?us-ascii?Q?ekevDMfBM2PETN+aHFU55mhqR1n33mLkAeT4udbZ7qkjgoTzg20r5AKcRfDu?=
 =?us-ascii?Q?36Lzpm0iLLV7LtSB0g502TCFapAexdYW03d6cATdH+kIt/8LTaf4teORw2Vn?=
 =?us-ascii?Q?JI/SDRhPZL6kxKojHoknooiaXoH7ctol2iuQl1sbWjWCJwCt4E8jNLqQA9AH?=
 =?us-ascii?Q?mX68EfNEtoPbxolpnuvMGUeXaOSFw6n2bIB9UfM55T7TyOGQMyVSbpsR8pNk?=
 =?us-ascii?Q?qCWFUPX12O8T1FfsD77HemmBl8ieNRTsr5a+oYKsVhVcdzfnQLCpSxPV96NW?=
 =?us-ascii?Q?YMsWAjF6KjknGclrfdwiKo5appqHu9AXSmBpRkkSRL74aeMRICLPbC5Q2baP?=
 =?us-ascii?Q?IJSKn4treufkJjtmzlXvSeXKUxGsjj6LvvkddpcdWtMyFLvtV/JhVaoU9NFZ?=
 =?us-ascii?Q?LKS9qH2feW+RgZaGAHrIBl880IyfcREVrj2j0RB07DhTJkcWDRBtBQTgDlXL?=
 =?us-ascii?Q?GiFwgbU33qddOwZDGCUvvDD2/X60b+Xs7vLcE10eYZOJJ0qDcKokMLiXE2yx?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8541eb2f-f17b-4d10-27ab-08dc80bcb326
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 15:25:12.9168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: An6Kg8hKVVkcX0CzS6WdTHBzxzktx2uFNUsyO8XFMjTF/wL26i2zPuqbcmAJ9vtF5oFK20wKL2gFpdJ+D0M+pim1bWC2EJ59UXvok4dJm5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
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

On Thu, May 30, 2024 at 03:35:25PM +0200, Michal Wajdeczko wrote:
> Rename static functions to align with our typical coding style.
> While at it, downgrade the existing kernel-doc for internal
> function to normal comment.
> 
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 1272246dd8a3..6e57632b44a1 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -55,7 +55,7 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>   * if force_vram_bar_size is set, attempt to set to the requested size
>   * else set to maximum possible size
>   */
> -static void xe_resize_vram_bar(struct xe_device *xe)
> +static void resize_vram_bar(struct xe_device *xe)
>  {
>  	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -127,7 +127,7 @@ static void xe_resize_vram_bar(struct xe_device *xe)
>  	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
>  }
>  
> -static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
> +static bool resource_is_valid(struct pci_dev *pdev, int bar)
>  {
>  	if (!pci_resource_flags(pdev, bar))
>  		return false;
> @@ -141,16 +141,16 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
>  	return true;
>  }
>  
> -static int xe_determine_lmem_bar_size(struct xe_device *xe)
> +static int determine_lmem_bar_size(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
> -	if (!xe_pci_resource_valid(pdev, LMEM_BAR)) {
> +	if (!resource_is_valid(pdev, LMEM_BAR)) {
>  		drm_err(&xe->drm, "pci resource is not valid\n");
>  		return -ENXIO;
>  	}
>  
> -	xe_resize_vram_bar(xe);
> +	resize_vram_bar(xe);
>  
>  	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
>  	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
> @@ -202,8 +202,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>  	return offset;
>  }
>  
> -/**
> - * xe_mmio_tile_vram_size() - Collect vram size and offset information
> +/*
> + * tile_vram_size() - Collect vram size and offset information
>   * @tile: tile to get info for
>   * @vram_size: available vram (size - device reserved portions)
>   * @tile_size: actual vram size
> @@ -221,8 +221,8 @@ static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
>   * NOTE: multi-tile bases will include the tile offset.
>   *
>   */
> -static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> -				  u64 *tile_size, u64 *tile_offset)
> +static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> +			  u64 *tile_size, u64 *tile_offset)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *gt = tile->primary_gt;
> @@ -289,11 +289,11 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  
>  	/* Get the size of the root tile's vram for later accessibility comparison */
>  	tile = xe_device_get_root_tile(xe);
> -	err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>  	if (err)
>  		return err;
>  
> -	err = xe_determine_lmem_bar_size(xe);
> +	err = determine_lmem_bar_size(xe);
>  	if (err)
>  		return err;
>  
> @@ -304,7 +304,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
>  
>  	/* tile specific ranges */
>  	for_each_tile(tile, xe, id) {
> -		err = xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
>  		if (err)
>  			return err;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
