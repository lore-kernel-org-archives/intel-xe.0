Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72A1C83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6FB10E893;
	Thu, 17 Jul 2025 19:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAiNJLW/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F3A10E893
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 19:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752781487; x=1784317487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BLxP4WldnUtOE/5EUJTPSMLlKG40V91V6xf4v8YuxBY=;
 b=XAiNJLW/tXxZJ5rw1c9G4BeBh0qkxhkCKHeK1xbEUKFdtLvVzOCcZluy
 Oe7GyQ4p/7qyeEDvULwnp+lZhU7Zjl2y5C5bxDI3CFiHlu0Blz990aOvX
 0BBf1Qprai3OX1G0x2vRI66LCeuafmRDU8SddZY6itjNK2bNndGgsSsHk
 DziKDFXR/s8ZFc8BtpJwBLGs/8hY493+/HKfWcVfoINVQH9CKCmXCDM7B
 kCdsawJV0F/StrHWe6q5R/7d3kuWBF/n3noqFzffdVX4I2w98WWC6pxeH
 V+uzJ12J0JLc3fSN4bqpmSzRQtaEAfip4TjRMUs5Oxv9pIK/DV4K2HE/W w==;
X-CSE-ConnectionGUID: yNSazy2ZQdenHwBzIJiLvQ==
X-CSE-MsgGUID: ru0FvE6HQl+wpUk0Sjc5LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54174809"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54174809"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:44:46 -0700
X-CSE-ConnectionGUID: LqxuOwBzRsWb9Vtj/O5rqg==
X-CSE-MsgGUID: 9HsUJL1aTFWO5WKH9wt5Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="158448143"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:44:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:44:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 12:44:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:44:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6EQbDpViVNBpY0SIuewA60mdxvan9Fo2y1pWfl1xzIwJ2A6JoB8vTfLYC9IfbpEKpS+ZxIJ7HfWWtDl+RGJzVQdlcXesTyeuqrsnmiP9d2XwfD9M1fu9wkZuIC7FO6NuNYkIe9mbkvIAFwITGkejEDWfWpKGvlDRG0ZUQG8xOk9AVs132xy2TwaW+ikfDSvlEfsv+1CGTZsaDewb4x1kA5XBNs2LhukD2/HBAJ5xEUcQzE5P9x4sJg2BjgyHs29DJuVZFL/Lv5NZbhaJZcaF1t2eLhI6jwFouYZCJifnD5uX2JaqHsRPduMfs3Qge7jkYXU+CQx9qGZA6fR3izDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vx0gZSQYmDsORZ8FTFuevbbXj1DZKegDOUClFYMDMb8=;
 b=cxXgQ1CZAia21YUvgfQvFtOaQTI4GwRsjaq3DgSrb/Fv/0IAcc+BQp7U9MIrPBy/EidlAr0V/A07cDZZ3hvDM1Fimb50MtX+iW9mjpzSieYe76Je1JH7IjqZLmWiTQ+4PHCp4ZOs/tGMDVPeN8n0YcPNsfwMQNI72z3p8sRBo73TAXACAiO/mxB6DHGwHMokRYmaU8lur6KuEhlEzvaHMIvUgLa4glz85h+6Ul4qcW12upngXgjFEIgU60ssMWC9HnXxITpCxJp8kgXKnbVtVA5ovVGCmoGmk1/eXH5AFwfqIL8hNoZsGbw7Ji21eiqVief2yEkTWI73P4hd5wG/sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 17 Jul
 2025 19:44:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:44:42 +0000
Date: Thu, 17 Jul 2025 16:44:38 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe/configfs: Use pci_name() for lookup
Message-ID: <qmpfc3o6kgbrsxcei6dh2bl2zoize2fdq4okndqynet3fioxza@qwu7z7haceku>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250717184825.851-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:a03:338::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 98c4da38-5f39-4fe5-fd81-08ddc56a5fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zmrMsEkIV1VAPx30GxtsZWpqO9J25TGSULskIk053zEl32cDLMOLT1OnzTLa?=
 =?us-ascii?Q?7CF17qTYLQKHW4ZPuJICVudXAstxSmQD1o5EzR92qabWcEJc6M6WVDbSmYPm?=
 =?us-ascii?Q?2dr3yNto4iNveyzCyBViTvFtbyqpYISkanwEfrJviwCmKDhEiJiflrGnQkZy?=
 =?us-ascii?Q?cjHanretOatoUTxYjoPwISGgUP8FhDRqgIqJnEzMncki4lFqMjTiqpG1fMv+?=
 =?us-ascii?Q?+F7f2vJYp5fJz5aBvJdJdzx7wFvdtvZzTZV9CuM1o/10V26j0Ciktr35a8Qc?=
 =?us-ascii?Q?uzKyfBEHLDYPpEqy2+ZFO6KvuRt1hxR662BuHk9J6Thk9srYGIfhiezS3I2d?=
 =?us-ascii?Q?iBMiC/1YVIEDgFN/Oxu/Xmiec+FAtCu1CiefByekPRxC3eeLJuxV7HK3sblY?=
 =?us-ascii?Q?rH0OmulhrA1cluDSlHLUpXLET0z/BE6UA/0mMez5ppuSqetaXZ3WSWgCfxjv?=
 =?us-ascii?Q?TAhNYgXdEQolps8YSSb2aCiXpbvgJi7x+MstUlpZXmbOSZXISYfLOig7UUEV?=
 =?us-ascii?Q?Y3k3ER3P0Hcmd1GgZwEPkpq8bU1ieIA6vb6Sp1fy40E44Z2Prrr+aTUQI3EH?=
 =?us-ascii?Q?/xP9xQObuUaea7tmrvVH+y+1mZyQPCSU0zMg4Dx+viU0dwQmz4XZFwjWeJVP?=
 =?us-ascii?Q?/Fo46Ta4CveOXXAtzr8+H8NHsZWsNVIhWjF5/5SLYjrTbBRMn4swOiCPF7Jh?=
 =?us-ascii?Q?OdK/yl250rK8FJhSyzPRdLM7DkK9sWVXQQ3ZmPdR/CLtRrnPS935iXhTsrLz?=
 =?us-ascii?Q?LXflni26a5ghtpRvj6JsXUPF/Vt94w1pmrZ2pNih5AJxsRq8+CqIfKsg20kb?=
 =?us-ascii?Q?kCAldiYLbaqqLeziB/vYvmq+Vc1YUnBwaIOnVtMKH/ToF9BudW0xE/Z6vvQe?=
 =?us-ascii?Q?jsrjkirCaXD/g0zVSHpCQ1CWa9rxSSI19j4i6/ZPnICdNgfs8Qat2nbJIf9S?=
 =?us-ascii?Q?hv52RS9wcJANL48XpLf4p8de3MZ3odSAQkrsD7Glx2lfhU1jQiQCeEfwgBi0?=
 =?us-ascii?Q?618mZmPoLDu5gl93tcqCFAWOh5dMx3X5tSWROL/k5xg/BRgFA04+Ky+RIkQp?=
 =?us-ascii?Q?kQob84bKvhECzPzdmafYvzHQRIGZnYqFw5T02zRHqB3n2s0aqjJKUKVIxMw3?=
 =?us-ascii?Q?3kQ2NHuEkYO/OqKEWKRzMsEbkWP2YiLDgXxc06uuegy2MzntEIXAEgwemXOi?=
 =?us-ascii?Q?R0dlPgk7NgLtSMdRCeecUsRo2t931xm5N3AZKPt0J8kYTubWyrVtQgl3W3wH?=
 =?us-ascii?Q?niFUjU/Kz6xvo2U4bDullHIg9+CiRN8rCqdMNCHleNOwqd2A0W5x4lFm+N/v?=
 =?us-ascii?Q?P4OzY8d0ZxWR1cj0wzgnbsG7YBWA6JORx0b2nZTgGtl3eRl0bUNvRxRYcHFW?=
 =?us-ascii?Q?UlHTSTP0aoScbdjQALDfMz9m1tXAXzxmQavWxpde4xxezoAN9W562ONWL2q9?=
 =?us-ascii?Q?gxTH5XxDNPI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f9AymkGerymUnAlvtlSeq+oEqxIM3Oq4vGty/RTHmfKQbszvjJ8yuYDee/zv?=
 =?us-ascii?Q?ZqSs21kH1Kjb42ve8zf4SxoNrfbSy5JN/cLvw5S1/5Vpvw6dv8PLKW3pKZzL?=
 =?us-ascii?Q?8MOYbA9kxAdC38jmg1rHbYtpUD6WRSFJRmv6k7iR1A3YdpWwn8Ngd/soDSwh?=
 =?us-ascii?Q?pVtC/mEeMQRJi3LzVeXGlscykeNJmMEpp7INkArKfXUuNdd3u0qVMF5n0Lhz?=
 =?us-ascii?Q?jcm5Ib8GzcA8E1g61xia9YaW1cdwkzcbvYxn/+VVgaWH40COFI+0QypoY1di?=
 =?us-ascii?Q?XK4Hu2wmW7ColqKj6Umy8EvSR5swkWn5O9t79PB+orGhxQ+0n9OEF7kyFlEL?=
 =?us-ascii?Q?iAxBE6oVAvTdz+2PrLTCfDnyUw1eqVUw/dE0xuEywdvX0+wE46JBFXj0w0Jv?=
 =?us-ascii?Q?gpIjN3qNHgpC0KuwZ7ziyrezfbIMkh9Qmi+jGznYD+cHr7Y8Q7nf8ZWpsWV2?=
 =?us-ascii?Q?r018atmyLPQmGu8e+RNUxbtAIoeM4iGApayZOf52nzGsZgXfQwh0yGV1d9hz?=
 =?us-ascii?Q?5vYWiOEjm2ofSbBVqTHybn7XwpicEJ/PItsUiqWwMq9utC+lIlRUj1OQ6PV4?=
 =?us-ascii?Q?qQ0M9MJhHgsqRY9VceTRWdcZ9zBc+awIrP8ufrTvxQj4ghZXcqk1n7T9ihql?=
 =?us-ascii?Q?oVOx8LEeO0+pKqfdikbilUQRzQ3CuczzIvyEuPaijHnI06VRjBElge35ty6P?=
 =?us-ascii?Q?MdNjtwH/CEpFYkTPf6jpXSlkuw76Isq6YUd/L2l+kPcP1VumCRwkniS+MeCo?=
 =?us-ascii?Q?I7ORP/vYt+bJgLOYSLpa+Nrn1UpQozkxFTMsCMIOEwFRek+tCrTsoriG3KYE?=
 =?us-ascii?Q?BGJpZyVep3UsEazfOPrVyniRp0E9IOIamTEOXUCd3TJPByL+X8dFeYEJ7yxP?=
 =?us-ascii?Q?r+WHV9qfJX+hhkX6CBos0CgjgjIvPFoKg/m56jQwaiiuQjjdwmhIc2TvmDBW?=
 =?us-ascii?Q?N/J59rGvIucHxG+4VbynfGchLIDgY3hZ5yjOOCVMo0utb6eDH8Xuz2UN9bTh?=
 =?us-ascii?Q?tPbrPxGaWXVhnBBb1YBadYRsUPxuD9muIkuIsTYyAbhFB9jieDW3wNsRv0zF?=
 =?us-ascii?Q?R10zQKH+rDTMw3wAc5HJVve38e6uZJTKX4E1EtcUPZM9eafhtBpZW3mWkHxK?=
 =?us-ascii?Q?fgX7ys+hZYxGaIbki4DLs/lpbJLsAa/eZBUvHW/3TMx1MGY4hYX4uKLmqonl?=
 =?us-ascii?Q?KLnN7ggI9AmXzlrm6UYpuErzqqZy9yVOcm9sbxRN/fw1A7wuI68EpLrUsENn?=
 =?us-ascii?Q?qVanig/ch6fyjMxuRSTp6RLndNlrRw+92pKq/CSfBXDGMNdQzXKG/lX70Hyf?=
 =?us-ascii?Q?F3mrdS8aXsVkYnQrKIdQbY9RlgTByq5CgMzuCH0Y5VnEq7GoAf4qoN7NeBet?=
 =?us-ascii?Q?G8DQCvD1tFa85fwG9xCSGPtG5Qf002zUK5MjopNDUpXWFMdXLokLJOnoBlUG?=
 =?us-ascii?Q?4tffspsRFQw3uKRCHqGtGWF2Jigf6ubdHTwpJn9D2yXLdhhUCeqah7l0Dyut?=
 =?us-ascii?Q?Gjov00IZhHotCuC616UNmtjUH1vQKstWtHjy9WxKNYqGscvxQMM8TvmNKztc?=
 =?us-ascii?Q?ZkQTbu24c6Mf6vIY7LS89Eu3UfMXG/RsykUB+Dt0enlj1rTonTAfhIAJBDHX?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c4da38-5f39-4fe5-fd81-08ddc56a5fda
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:44:42.5042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCHYQf04RpKmvFKx4yvN4zYssrT6sGf1bJ2NrkzCbr6IYguIiEg3KIZoBDDa4M2Tzeu6ca5RCdSP/uuydFFaCOGiRc1BFdH37+yR/yVmbfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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

On Thu, Jul 17, 2025 at 08:48:23PM +0200, Michal Wajdeczko wrote:
>There is no need to manually build PCI device name from BDF data,
>since it was already prepared and assigned and can be accessed by
>calling pci_name() function.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_configfs.c | 6 +-----
> 1 file changed, 1 insertion(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 90b4fe92a611..00bb4e412c12 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -312,13 +312,9 @@ static struct configfs_subsystem xe_configfs = {
> static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
> {
> 	struct config_item *item;
>-	char name[64];
>-
>-	snprintf(name, sizeof(name), "%04x:%02x:%02x.%x", pci_domain_nr(pdev->bus),
>-		 pdev->bus->number, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>
> 	mutex_lock(&xe_configfs.su_mutex);
>-	item = config_group_find_item(&xe_configfs.su_group, name);
>+	item = config_group_find_item(&xe_configfs.su_group, pci_name(pdev));
> 	mutex_unlock(&xe_configfs.su_mutex);
>
> 	if (!item)
>-- 
>2.47.1
>
