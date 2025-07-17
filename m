Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC63EC83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DC210E893;
	Thu, 17 Jul 2025 19:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqmYnmnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68DF10E893
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752782015; x=1784318015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x9bxWbGRewFZeOCjY7kJXOS2/z4exHZsY7ScHtimJWM=;
 b=NqmYnmnTgtp9oGExYfJFVm5d0rCENHOal3FA9eatI04Wc8bw41lbkUSr
 z/YANA3gnMIcJrUgLAkUHcRsKoqz2AsUy3EoKYJRbt1k/SfIc6mxWAMZk
 Y8/mW2UoW6aDcF2Lpf4gqQpVNkaGNQp7qS/TgTXOVlk3+J3AXuds/pWH5
 HzNOQGos5LrNGH0GqaehkWJupNIKEDMNdE/vx9HcfXg2UUqlnt3ha7hLy
 jLgV5Oq/UfRrBP5BuHDm8ycPCARapbyawsmS2Qi+vRApAJM0txpr21sR8
 +ONnqZiVea/ZlWZUKJtgwkLG1mnpu8p7Tfm5PV4D2YU77i9h9Izq8Q9u6 g==;
X-CSE-ConnectionGUID: 1uNc2HizT0KNMeFtC6P6ag==
X-CSE-MsgGUID: 13DkE6W3RQuzbkjCdqkdxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54287416"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="54287416"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:53:35 -0700
X-CSE-ConnectionGUID: FHjYAeWJRpOxY9H2R0Y9Gg==
X-CSE-MsgGUID: 9pm5NhXuROeXcWOjZSGI5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="181594762"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:53:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:53:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 12:53:30 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiR0QcwzSa+DbOaju47EVzjsEdNLwdfIhuDadLsk0dtLoYBolytLlYnrtqEjcs3mswIzfHj7kCFKPYOstEniKTWpPczl5hNBkRm7DssECSyAgl7zfCDC5UzIoRtZoO1BYJYr+s/j+eWVkslj0g9JPXI9afYiQA7nttDaNuWwD8acn270uF+9v5JXf3Qgc1x6Dpq2g1xbuI6qGUoDLdTL/eDj1dg9r7WNyUcdbsG19831IDExme7tx+WAQ8ZjAAZUzIgOflQcAd+1sA3zRsSCN3uTK1GA0NDVMWPmjyJvu0fc6JQcQPjWperQnCsCILmcNpj/9LDAEK7zUoLbV+Qm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVjiG4mIQu3GoQd9EUeq1rrhutGgeCYB9JvuU2DWuWo=;
 b=aHwAdpmhczsVQMTjzAa9m22/LPOk2TFDIhQrY2pAkGSbr7W8fJV0Fvelfu23c31nozDSld9uGIfnZ+GHsJI5EQ/1jDTr7KvS/wOE2u2tUtLMtl+ObW4G5HT77QhX1FR8pyaasMnWzBP7M9NcxJ7sR6aBB4jaRiB+h/KXECGwWjnAac3C4JrXOkTE7fWSMiZ+rhXFFbs6oY+YlbPdg3XS584FqNFmz/Pu9pkgakgz16wfLiUdj+x9I5W84L3P2MAX73Dv5p9vGmf9Fx0ciuLb1dg4z0vqv7Yzf3A/3KGPpyZ+Vi1b3u0SN756hS9rvOV95nZ+uhkROvTNH8N1rCJqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 19:52:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 19:52:33 +0000
Date: Thu, 17 Jul 2025 16:52:29 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/configfs: Allow configurations only for Intel
 VGA devices
Message-ID: <4giwyvxxjwwopctdrugqgnwjdytushpvumxd7lbmzobg2bamax@nuegb34lc4qi>
References: <20250717184825.851-1-michal.wajdeczko@intel.com>
 <20250717184825.851-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250717184825.851-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fe6ce8-86de-4201-7788-08ddc56b78db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sfziHgwA244ioSsLPLhgfv3DPJvBnSVlRv6VGlynfwfqHt4Z9wZM5Jo6gCpX?=
 =?us-ascii?Q?RUez7NYBHqne97vqJoNqFec/ijZEDJScZKi91U5hJGp5QmIDtm5ledc4wYTp?=
 =?us-ascii?Q?r9q4109JOn5exUrIlWHMZdy9MUijERY/3BBlfX5uN3pqwxLROX7lkc5mlcqs?=
 =?us-ascii?Q?GJt2CVKzLPmvVi6k3ZYa4ol967yFFGlxI8U94TVmIP2WgwJwi/433zHZp02p?=
 =?us-ascii?Q?AkztFncvQxH0PNdoOBlU4dHaf+X81XsyqIgpXb3TU81ZD5Xb7gDnd1LYfhIS?=
 =?us-ascii?Q?+TYNrY3ZOUJGToMPsaDhu3UQ5oQXoZz86lihc14PNmH2kt0kroaHBHCrcnSP?=
 =?us-ascii?Q?FBCwNzpha0Hp8sN0KeKRZkaYhqXgp6TAVIbOLOX8n6dqV2cdA+Ma4rV9aBnE?=
 =?us-ascii?Q?CKW2Fd1F7e7vXGi3osgWKqRnIqxTOQzb+hD0scTNWEmbA4XFGuVIfKfs9m65?=
 =?us-ascii?Q?uvg56XnNNvpwaJFDu7Ukvw0lNqaohCPvnKBVBIsh3fsCt0AIthV+AfCNY0BD?=
 =?us-ascii?Q?d46VGtMEZheEJL+vOzoD7KwzvpLYkHCiL8iIH1TBCmnl+1hi4iiVSAbVUwmZ?=
 =?us-ascii?Q?JxC8fyoZQ8lgCCJ/kNZI7zfMY95pi/DZsuJaMRADIjqS6HI0MiYFoLYa/Jz6?=
 =?us-ascii?Q?4ECmKOhZMCdMHR/52kQogAqk+6ihjuYcuamhJrNRedYJcnhT9n2MjZR64opZ?=
 =?us-ascii?Q?Wl1U9wMMtKJIHVpl8RGpbAhoBpdOWX6aYgAKaOsiXhtErT9SFT1YD267OCI3?=
 =?us-ascii?Q?tVqNkzl+whKu0vbsQxoDQDrrAmVjyQhYMyadP0Y3zz26vCjdlKPDQx0p0E2D?=
 =?us-ascii?Q?NAiiyyFFsGqIxVL5H8UIOQi5ki1P1SjZs82HN7kGV7MtaOjoRVwT226xaHZu?=
 =?us-ascii?Q?WHzhDqBq3RTbQVNOVTX9apNGvWTpT6Y7nYO1eiD7RuL0Mz7AKndCT75eXPpb?=
 =?us-ascii?Q?PwnuFb+zwbcPlkqVC5UyEpgD7mORfUINAhM2pAIzwVGwGbkz20Ezh28BA7C4?=
 =?us-ascii?Q?txL7ylACU61IEpRsA/O1oI3zabt4MdlxAbmAPGEfAqekRABcBcCk7fjQ5fj4?=
 =?us-ascii?Q?UaJ+hygeIsir/a0YGN4wspNUnBKAz1sBkJxn+q5il0U6kP/Ve9yIiatPMGup?=
 =?us-ascii?Q?4EV0cQs04HxMo/1CqKMBzk1eWaW5BH5zjjLjG3DGa/G2kZ71MUKIo0wW1ohD?=
 =?us-ascii?Q?pl5QpCFK6Ub5YW1f58vfsbRhzuwG6r/D2O/PHxB/AtsIWpHU/Dcu2nS3JuII?=
 =?us-ascii?Q?KzfOYAwLLMMpCjLWuTUa/+xdT75TSn8GVQGu1k5y1YEEdwGxvnZkeEddjnKx?=
 =?us-ascii?Q?NBk9y/w5zRz6ybOWFqY3f5FL8n87DCzpzaSDppbK2/9UsX2nwDjK6y1+t/TY?=
 =?us-ascii?Q?6Ku0Xeo8N9JFBpqHIWaV/cLPSkuCpN8uY03As0MxQIR0cG05eji5hVZv+dIs?=
 =?us-ascii?Q?c/QOXMNSlGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j9+WNyC084y3Sryjrf1ybFa/aXPNy4NZ9Arcw5/K7CtTvHnFBpFx7L7ZLI6R?=
 =?us-ascii?Q?C6aepF8Fm7uoS9O1Jt2eM9vMgBWKOVkVSKn24Xi8KG91MSIgwnH4xhGGx0ja?=
 =?us-ascii?Q?KPkSa1tykRx8udgGwPcreTFDoIzn8bR9TKwyb17pwO3djANfAuC5JmPgzq7L?=
 =?us-ascii?Q?UK0ZysTqYlk089a6VeEj9AuRLis0/gSgCC3yHCkOQ45e78m89jfq4xYkQYey?=
 =?us-ascii?Q?yr8SQP7eCkCZGpy18LBhwvmS75hxMDPkTMrxM3FLTfeD+8rmw+k7lTtWSvAO?=
 =?us-ascii?Q?QrofQlSyIGKw3eLIbZZW+ql0tek9zWXVPaEV2UmhDOpxNlQf+49rJiQeYl6B?=
 =?us-ascii?Q?Noobojuf0VLj4NY8QBhMq6O/tek8Rb2CsGYUvNgQKM0c/m6Ybbos3sdDMxre?=
 =?us-ascii?Q?MrCiGr7eacMLEZE+BU28lPHLCUppqE27CskwqdnNBirvu0zC1otfISa9+k3b?=
 =?us-ascii?Q?gSMuhfLmuFX3VRmB4RELzJTUr+OHRjZpgH/DM3nbP1zUdKzO2SNZuWxBEW7e?=
 =?us-ascii?Q?X88vuQ+OmYChHJRThOmFh+FWyf4hZpujJya7Ah7H+UZnkX+xgUmcoOnTk0e4?=
 =?us-ascii?Q?8jDPmQB9iebGYPRb5oQ1O33RwY8KIZ1zrRSjLF3qNSZ7fIJ2a0vBMswxsqyU?=
 =?us-ascii?Q?+OF8LG1N1V8/avJXyOkVBlBuxHPGYg0Oapt/T7TuNsy0FX6zXhXGv0suhBJW?=
 =?us-ascii?Q?UFbim+Ft+ZnuoAXiDCxHi25/8JgGMUAxmRpiJIUKyQVqqTQ7nCXX+4NHlXJ6?=
 =?us-ascii?Q?xT3+njTQPOfplSkD4FXgcJRCuXHwXoZHrR77/7d098K1fpSbNFq/lECjpXUv?=
 =?us-ascii?Q?QXliOpP/IouHep17stdujcxBCFemcksMKdJraXPTkJvLASzbzDtkrLRcS1Nt?=
 =?us-ascii?Q?GbisV/RZ4g11xAiP3de+q1jHzfK7bCIWIxOFrB3xheQ3AvgeuLvUNdzCbWU2?=
 =?us-ascii?Q?2KtU+GJap7IJDfarSnzo7nsHrLbTq501MfHukb2QrFIxtt4PAV9REjxSJO5t?=
 =?us-ascii?Q?DnnK30Pd4Vg/1mqvPFoCWAETJuQqgkJdudZzznkIab8uBmZ/PS5yiwE0Ld40?=
 =?us-ascii?Q?LOXBVXZGRQ00835Zgdr0cH+m/jvT6qUJbnQ4H0nxAVUL7wGGaHFuz3ejnn6O?=
 =?us-ascii?Q?xCfjHwURgYgRV7StseQDn6u64gs4A9SqBJhro+c4DhkvqhcdJqozKDdWQLHz?=
 =?us-ascii?Q?3EG9RDwPzmH2tgIxLrH9kqnCDx5hmV1sVNPp3IE+d1OViipYUXogM3m+Wibh?=
 =?us-ascii?Q?z6JD5cQ7w3hgNUZnEyeMCTk4YVQTOWAVBaYjkoVHpk8zYDeuoOBBjCz8Y3gm?=
 =?us-ascii?Q?Lg6DGF+EvlUa7F5BdhVkPc1Wgw3/oqpOlKhDtDRv7U4IOq2s8N2r1+h2wZft?=
 =?us-ascii?Q?ufbVbZcyjt2zHnJKqYjq5XaeRDVg7OEJNF18VHJQYbVipNqGMJVbNYPHXK+0?=
 =?us-ascii?Q?03T5Hs9lnymSiegXc9nZ5TMx2mfbfiL1J3tdBwnZrQKn2nDezO8KHKwv94fB?=
 =?us-ascii?Q?RGYn9AAi90bvFz48IBhygnXOGZe5ZxALp9+u49ByuKLK0nQPJVYZgVYATRHF?=
 =?us-ascii?Q?GLwDwekM+ZdJSClKUlwYzxGZgO5GUoydyLkLcUdTnu15JWUJ8CyjRQHvbYlP?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fe6ce8-86de-4201-7788-08ddc56b78db
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:52:33.9141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt8Io88A4y1XIok0BX1QMEpi1uPACO6dWUhnCNl3gnJV9V8k0i4+ApDtwqGyzJwnJr5eO9Ofc1VEKviXb+l3vBrhK26sQdyXRVNr/lAl6BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6670
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

On Thu, Jul 17, 2025 at 08:48:24PM +0200, Michal Wajdeczko wrote:
>The Xe driver supports only Intel GPUs devices that all are PCI
>VGA class devices. Reject creation of configuration directories
>for PCI device addresses that are not Intel or VGA.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 00bb4e412c12..1df8cce78f13 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -260,6 +260,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> 	struct xe_config_device *dev;
> 	struct pci_dev *pdev;
> 	char canonical[16];
>+	bool match;
> 	int ret;
>
> 	ret = sscanf(name, "%x:%x:%x.%d", &domain, &bus, &slot, &function);
>@@ -275,8 +276,14 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
> 	if (!pdev)
> 		return ERR_PTR(-ENODEV);
>+
>+	match = pci_is_vga(pdev) && pdev->vendor == PCI_VENDOR_ID_INTEL;

although not officially supported by xe, we had devices in the past with
class 0x0380 and (I think) 0x302.

is the goal here to error early on typos that cause the config to not
"stick" and now error/warning to the user? Maybe we should rather have a
positive indication during bind that the user can grep for in the log?

Lucas De Marchi

>+
> 	pci_dev_put(pdev);
>
>+	if (!match)
>+		return ERR_PTR(-ENODEV);
>+
> 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> 	if (!dev)
> 		return ERR_PTR(-ENOMEM);
>-- 
>2.47.1
>
