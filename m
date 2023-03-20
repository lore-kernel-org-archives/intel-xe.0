Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4E9C761A6
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 17:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005BB10E5F9;
	Mon, 20 Mar 2023 17:05:46 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E9D10E207
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679331943; x=1710867943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pg4yVZs9wDxlfYABWU9w4vulmdzFd/Q1b56f2a6Yqiw=;
 b=iGMx70aswxpav39Wn+YaWxoXdIHWx7OnQRudjvI3kVNA2plIB9BW7Phi
 yDXjrxV4DWnYqTaFc4YCiszLQO4t+K5OZJ6vS7GFv2ZYd7ki75pbotmsm
 eE1rqXR7vcKc4s3W3zpSw/V52Uh7iLAnfa1HYeGQPvc1V7cY01514bbUe
 PbXCOiOfth/89FYMtOKbesbuX+Y0OfeRTILaUJjD8vzo2GCt+6I/lEehJ
 59sZv5zfQNnwQmFMvxDUOcZ6LVf4j0NF3gazitxGYYW8SoexpnPK2lyhM
 9EF5ZQS6etX6KUzWvvIj7vbX18kZ6BDt/GBaPgzpu2XzzHERkKzPdkNP3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319120768"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="319120768"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 10:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770267706"
X-IronPort-AV: E=Sophos;i="5.98,276,1673942400"; d="scan'208";a="770267706"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2023 10:05:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:05:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 10:05:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 10:05:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 10:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxeHnwsyzCRv2nIcXitB+guPuXBlU/3KC0LDz4dCXsPoWDApb4xcjKUXuFgU6glLjMxKgeQVSruugCXOOnqzEnIAZXXT7apBqplWs+DdfXze2RF+9E6EW3VKJsnTOtEyhHsFpL/KNmoLNy/sE4k6ywEXAYSVl52ZzYTwcpb7akPA4d1M30XYRHC2WMOUXFVqJbu/iSK9yHvU6Vv/QQwBFmwCGYzjjsbGCDs9mxqjPJkee+zsMcyyEZ9HAxuvj5OkqLOo7vFffLuYrbLkavtSEG647iQcSA802Uk/LW178oD9z6O3F31notOaSBpAGTU1KnbHKm7j6LAwW5284WKneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bK/p88Al8zT83RLaOPYqMPMRSn0/QZwrLXn94KKj2Mc=;
 b=jLzI1F8zOzMR1hu0DYDozUs5LHBVTeUGO2HipmL8AqY+PGg5O4c3Yj6zfC/Tj2zQzocshK6bzVeSlDch+gP7HpnneU8WltxXz5giC3NN8M5C+rCX5l8Orrasl8w3osK2aUIwz0ozEZWjvzYiT+NDcnOJm71eGhSNYWMFrBr/lWE/ypqdYyFvvGUKiiAtf0G6SqIS1YNWmLD740cUqiC6yPJ8PwW5Rl7tV2NLtGh0jQvDNAw8I9UxvlrEIM8ZrXusc5XAlv0J0n0yIVOdmAmo/0lqzKpcuVktvknJYdHX4cPqS8qjxmvFkUta54GU5xeRZp769SH5hPdA+LNHuH7k0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.36; Mon, 20 Mar
 2023 17:05:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 17:05:37 +0000
Date: Mon, 20 Mar 2023 10:05:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230320170535.xmqca3amc4cwlmhi@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <25959b6c92cae10f414e3fcbc881c4b2e272f3d8.1678873128.git.mchehab@kernel.org>
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: d79d05c1-7748-4037-070b-08db29655395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ppGEqbeSnM6r4l8vvN2VAnRVfSgT9kpqo4Byi39SpMBQRKjNhW+mrp6HUHltjAEVVCqK3F6okKjIn/SNPLYoPWcvYF5y6Hd1n9VJfMG3UOXa7fDBLG613BdBkfbeuRH/weuYUy3jFox3iwu2egZXnuWB9f38Grd2X7HLF5UOEYNcb6FMRhdgjMSRNTHHaLt1jclJMJzLj/UrD3Q3wPUmqtqarkN9RRrzvbrNlPav451esIoFctiJL6NAq+Ew9gfGa815TM3tuaaYdbYrBEfpkvpIMKHiU8dGxr2FsitCQo9ZVJlCoolLWLuyfRntD5QMxSnakn0+4DrS270PFvKdv0hT2i3rqhh83snQElb8tQTAdznbQ3s91UUG/1/eVda7hv0WgRBVEl4zpqLp/jvCN11J0XAnsd3XeR4eepC6oc+NKnDimF0b4S9kbate0d9LBugkiMhfIBB9K9TVmm15TXNx11Zgntf8DQudjYJIt01huxygJx4IFXsgMxY//Dkouni9ZqOhZ0k2HhfVhT1Mis/NQ9EfJfYli+qZqacSRV+QtpxD7yTh/3HVDuHr0BxNiXVZRaOm7bFk3vRISRDsVDPF2urveHm5h7XJNvfw43KPl6Icckp7HqbWbHEjWWUU4cZtAksUMpA0rciw5BibQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199018)(86362001)(66556008)(66476007)(4326008)(8676002)(66946007)(478600001)(316002)(6916009)(186003)(6506007)(1076003)(6512007)(26005)(6486002)(83380400001)(38100700002)(82960400001)(8936002)(41300700001)(15650500001)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?91qO70a6YKOQl9V+FeSDQQ7B2gNVPilIu4I7D8QtPLmdZmYTbq4sU6J+IdRp?=
 =?us-ascii?Q?IEIPHautAuArmOTmqvMhADkA2gW6vN5my9YBE05ubzrPvTi5o3B5nesk+VmY?=
 =?us-ascii?Q?VbC/Y+X8sodba6cq9I05qFrZnlIiRJ9kUWXyZ/HsRGsLVXkJ5KufmNBVTWMu?=
 =?us-ascii?Q?M3wWplET0TwM378ueZNZg58xUGRPCV7RDgZZobOQBL+Kr8cNBL5I5U6cl5eo?=
 =?us-ascii?Q?mFt3ZX2bvCcdhyGlFl+oRjBq4B5CnPJMny+btGLDr4cB6bpT9LsHJuwTk73c?=
 =?us-ascii?Q?rGGGOStUiGk1xETMPIwsv5jdDzy3z6SZcWZa60DNSHEJxk61qD6QKjfVejH3?=
 =?us-ascii?Q?iijqigU/fut5YrPFVLcrmoHfYeWghq6RLeSeW8HV+QEkqwGzIf64/IhY7DhR?=
 =?us-ascii?Q?CdXGpKQd+bm1Iv1lAbGay9lbHVHsDNX2T0/G/kCJ+HFG40Rbmy1yssDSfe66?=
 =?us-ascii?Q?nLev70bmMjmb0bTZcdaZXDHCXbzTHHHH7dg26QUkoKOQc0q7+7bFbquP+IwJ?=
 =?us-ascii?Q?+hcFIenIOmtCX18A+XF9OpGrKSXKbxyLFILA1RLrpaBtybgZ5OJ1u6ng+i61?=
 =?us-ascii?Q?8YT7uo4dMn2YLZory7xbhSG5RV39wkuA+ZEGj0DvJucNZ0ZICJfpid5nZfnP?=
 =?us-ascii?Q?k4BaYE2L6fxsoAlQjGK7LIj4ArTYlLirCI0MlUJ2ZnX2PCzp8nDNGG3m7snB?=
 =?us-ascii?Q?CE08JMv5l1TUqLPis/Zhd6mnNX1QV0aq/jtA/Hlr/MQbB97fEXb3UwbODLff?=
 =?us-ascii?Q?rQLVas90yHpmdUxm+yn9V1qlQ+Rr6VmZOZmIzfe0zANJpQRlUgbZLmxTykIT?=
 =?us-ascii?Q?HcHYy9EFzMrBcs3SwN7RjSj8pG5ne7Pr/ysRI4uKNcS4nKxC8WdBHcW6Eh97?=
 =?us-ascii?Q?GoLSHUqPRCDJshVUkY/OfZD4Mpq3BgetxneAIz79/2tcWixCxw/uzwbdtv58?=
 =?us-ascii?Q?zByeP9ASu+mxrwlK3W//vSAeCqEPmhYuLvYgY6QufzDxcp9RB/TK4Hd0lwWi?=
 =?us-ascii?Q?dT5SHAKr+VOnidnDFNhccQl7Kq9z3O0zTHwS+QfKJ8SI8E0Lt44LP4T65My4?=
 =?us-ascii?Q?6LS5m5rEd4N3AU+/7ln/o/itKyVFilvC9exd+ai4ppa8cEQBBLaRU4tE5VhB?=
 =?us-ascii?Q?jkprknOgpBGlDRxB/JTNlIYK/TIkr/lBkAOg65Hff7Ip8Iy0dOOv5OB4jlmX?=
 =?us-ascii?Q?m7B8ppeBJ165zlZi2fw7Cki365aqnoAeqM2+ogPTiaSU/3DBBw1E9JdGPO0r?=
 =?us-ascii?Q?LtamSwSOF0HB1MdV+cokaUU1hHnpQnU8jr65K26LLxi0q0PLbGrraMWaSCPs?=
 =?us-ascii?Q?MPYNlHmM5cy1J7NVlcNx5dpl2Nfs0tcrcdVtEZ1uZ9J87C1L7m2DE+dctlF4?=
 =?us-ascii?Q?rx0JREnDCRPryAFf2jTnSNZ1ZhNN9qKM8hK3ixWzinX5AMAL3ZItapy1iI4b?=
 =?us-ascii?Q?HUZgD3i3hr+NwNJXrVIpMZ3u9oeo+Szu/5dhZOKJM2Zi9efPgQeuZJAPO1jE?=
 =?us-ascii?Q?RntdMwrC7eR90tiRubALZcQ1DrY4KnAoHHysSoHtOGW03LNE0xpSfPqu9ynw?=
 =?us-ascii?Q?TuFAWFUDlnMqfnvbe3l0WfIQ6ywJ7yTNHLW8x+KYX0MCQUX0pWUpKj+aEOh9?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d79d05c1-7748-4037-070b-08db29655395
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:05:37.6124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCZxrGbFb0LaVYw/nIXdkBkg4bjDgC50BM/1PHAIL7kqhkRZt93t75fE+Naq0ZwvLdW7+iP0XU1LHzxkN25HJDlDyljhr+CsulqY62KRvN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe-pci: print a message when probing
 a device
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

On Wed, Mar 15, 2023 at 10:38:55AM +0100, Mauro Carvalho Chehab wrote:
>From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>On devices with multiple GPUs, like:
>
>	GPU device: ADLS, PCI ID: 8086:4680
>	GPU device: DG2 (DG2_G12), PCI ID: 8086:56a3
>
>Using force_probe parameter with a value different than "*" gives
>a warning for the other GPU, like:
>
>[  448.991536] xe 0000:00:02.0: Your graphics device 4680 is not officially supported
>               by xe driver in this kernel version. To force Xe probe,
>               use xe.force_probe='4680' and i915.force_probe='!4680'
>               module parameters or CONFIG_DRM_XE_FORCE_PROBE='4680' and
>               CONFIG_DRM_I915_FORCE_PROBE='!4680' configuration options.
>
>This is confusing, as the subsequent messages refer to the
>other probe attempt:
>
>	[  448.991843] xe 0000:03:00.0: vgaarb: deactivate vga console
>	[  449.007744] GT topology dss mask (geometry): 00000000,00ffff00
>	[  449.007750] GT topology dss mask (compute):  00000000,00ffff00
>	[  449.007752] GT topology EU mask per DSS:     0000ffff
>	[  449.008846] xe 0000:03:00.0: [drm] vram_size: 0x180000000 usable_size: 0x17c800000
>	[  449.008880] xe 0000:03:00.0: BAR 2: releasing [mem 0x6000000000-0x600fffffff 64bit pref]
>
>Ok, one might infere from the PCI bus that it is for a different
>card, but it is better to state so, as it helps debugging
>issues and to check if the probe was really to the expected device.
>
>So, prints the PCI ID of the GPU it will be about to probe.
>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>---
> drivers/gpu/drm/xe/xe_pci.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index c4d9fd2e7b2b..5aa594e92ff0 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -394,6 +394,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 		return -ENODEV;
> 	}
>
>+        dev_info(&pdev->dev, "Probing device [%04x:%04x].\n",
>+                pdev->vendor, pdev->device);

I think info would be too much. A debug is ok. Most of the drivers in
the kernel don't print anything about when probe is happening.
With a change to dev_dbg():

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Btw as we move more things to rely on async probe (se e.g.
-EPROBE_DEFER in xe_display.c) the order of the messages
for different devices may not be something to rely on.

Lucas De Marchi
