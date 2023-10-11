Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2E3CDB470
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 17:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2131210E00B;
	Wed, 11 Oct 2023 17:58:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A72C10E00B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 17:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697047118; x=1728583118;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Zq0gLjAzYjmv3Uuh1eIMhz/mldChhwuU22O4lYuDZI=;
 b=V64maxX/eb8PtVHmNVr/Ig5YCTjPZLY8lLWxuuF8ZSy0iddoNMc+9s3M
 wvX/t4fm1F9qjljIv4Yy/0Az8ZOSYYEJJC5ftMT9MbOsRkEguxTWiZfZu
 MqfSNiY8htuX3ZoqV0gCGYyXZP5CuancidGrwF0HQqAVlcdS59RPWteKz
 R33Wo/Zul6SD8Of1gQEw1GGM++6I3pbwvkmoPDUKEYCLb2GVdQxACeW8k
 MFH38wgKSipZYqMNY8kS4mD/I02agpLFDGd3hiqoS9nipS22Iv6XGS3BK
 GJMSDpCxRlPR2b19rMW2814zhHc8RZKmZkBQ/eChO0UPtwI6CRwgChRVH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415783185"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="415783185"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 10:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="757667191"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="757667191"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 10:58:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 10:58:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 10:58:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 10:58:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 10:58:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxJofIHGEJVAgnwxKBmgALZ9xx1BPAYbsuQax0s2vbGatCKFT/hA0GHkffBhYfg0JJxEwE8T6uVM0mU1nk5+KiBX0e7SqPt5kAh503p36OaoZEd1seWrKM6PKgeCWpLHjglhjK59m4I5OE8vGS1OVZJhB29KDXbLfBLXnHP+Ek+SE4Mz24z1F7k9qshJinydMXpATrEbM7lddUrvWNEvf/t4UE1gjpYX0HpOOgMtscIAK/rEXSGfwqoN5tmWX4beRduj9STsA2xoNd3PRsVYvzyra/PnCRstQGZxY2DBdbGMJvJOOFP6ralr1uy2Y59egI930SjVG4GBjkJMq7LZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDG+BpgmdmLhAgjcR+ZbelRukzpjsVOe0UAM5/Q9I4A=;
 b=IEcf5OFP2zkaw15Uo1c7HZjCfgQdOND4bYZxUC6JwYNML9b1SLkeD/xsLLHONGpF2+YueOINWDDLXjX/HlWgpN+3Pd8YdSApqg0RLgTwr2EB0wtSoPjpALs5hf1DuMn4KWoTsNb4eskihsNWFIyBCm/jiZWRItlg+zKdWoAh3HOf8A7/aNXPCVT+F839BmRQT4/m+pzjIykn4ljJNSQlDhe+BQav6/k6QBAaossFbor5nLLJtf8p5vFDeUu9W5EuqODgVcPSI/2Wpfa3xBgBDc3OF50fU1KXYd0Hkhi/s6jZBDz5y/8BFKoyBU7JH1u9jyZPwolnnKCxn1XMEvSZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Wed, 11 Oct 2023 17:58:35 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 17:58:35 +0000
Date: Wed, 11 Oct 2023 10:58:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20231011175832.GL5757@mdroper-desk1.amr.corp.intel.com>
References: <20231011154526.2819754-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231011154526.2819754-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: BY3PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:a03:255::29) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 1175b0bb-6220-421d-d098-08dbca83b03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2g5zE97F9mYSzeOtEf2/fLL0c7YIJB8+wa+q39cegmOBiCXoAnOcrDf/raQkPr5AeU7j2YZ78Ivw7klZaXWAXCq7RF5yrlyPgb89310xOUg9sxxqUthSHqe5iYvQTqJPaDw50pZp5jZuIjVoiAlQYI5qpZ9V+RQuRS4Czq7xv++L78ja2RZ1bAmyFTU90LOq+lE4P3A142Nd5SX5ZYcIqAAoc0v+Vrp7EY6qTeca49SSCoS5PKYEskkXN/xk6pN4a8cvAnkeabgv72AQECZdyGgjbKqQ8RuI61+P7KZ1YUSl/OAuiva1qKaBZWG8NQAi3kNo3mvPD2tIL1bKdi6YBgrH/shqGcuzdUfVj1/k1nGVRV4P4BIsLOoAxuEc32H+Y0yM0xosJXTMXZVKprOL5+VFcofOKPaKQ1T8oAgzvKujumyCh+NsTYI6oqtNo6Y5VzIy9pWQ3B8PvurrgpaRUoVEnRgHEhkGgfnStVMpfEX6Yqb7T56N86VkqNZZFXKlNOEuYjx8XFj2DOQYJu6Ha4zJR2uF6lmhdFsK40f49R+HmJtWH/dEMXlZsbSs4L4W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(39860400002)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6666004)(26005)(86362001)(33656002)(6512007)(83380400001)(6506007)(1076003)(66476007)(66556008)(66946007)(4326008)(6862004)(8936002)(8676002)(41300700001)(82960400001)(316002)(6636002)(5660300002)(2906002)(478600001)(6486002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ycw2gKNhZKnhBf+m+YYqGTlPju1ZRO+Abv/k70s378LKLxDp/ly03Uwa67XX?=
 =?us-ascii?Q?jnqth0kVgcoc1KNOvUTTrXQnfM2Hqol1wTdYNI9Zfn95vxJylJMeTYzl1aD5?=
 =?us-ascii?Q?NwEQ3GF1BLECAE5mkf5cvZiMrsq9SA+HTVJurN0wTzG4mGtgGlujkBbA4ukR?=
 =?us-ascii?Q?e/jzqMQpX49Y7RoDKTg9JdmiH6TFvbmCgSAh65nqD4u2dP+M13MgEbIemc1r?=
 =?us-ascii?Q?PFzgFal/zDlf+C8z2rISQ8k+174JQo/OJdGxuED2D4egs7isoROZ1MP5LLT7?=
 =?us-ascii?Q?oLDITPszdQ18lkaadVSImfwuaeF6wKtFBgGNTYQ7DGK7aF06qgf895lRy/ih?=
 =?us-ascii?Q?DuprcJiRHvevugY1FVy0TnZDjVGwjNAv0jRcE4+9EVzqBAnbDpKcRKB3FLKt?=
 =?us-ascii?Q?3SEwEhWQZU0gkw4qHeCewLRbZsxWaJ0v79XMmsoH3ZfyzoZpNi/O4AYk2+8g?=
 =?us-ascii?Q?/P/Vl/nIcFAUHgdt7y+IXNWOLe/I8CRsO/hlz01mjoeG7Jl+SbA4i9lGwvga?=
 =?us-ascii?Q?KMyRIim/Su91EgrVtb2H7ylDJ/olz5KQl4aQUEHZh8z46Z2LYw5ohHPbNHGA?=
 =?us-ascii?Q?msqQEw1ZMZwUvQ1B5RKDsyXMC/gwZWYeCR7/AM4hhxxCGjIXfSemmFc8AB2g?=
 =?us-ascii?Q?zPmCEmqaWplD2PsMlqxKYuaaqAdxRx5FRyfsKpbvlAD8Zp3ibGGyx/yN6kT7?=
 =?us-ascii?Q?wFIHvQyxQmgnllAlR/C2nmDLll4S8ElkTU8nrqOqGxGCwVq4Ban/gNbYqTsB?=
 =?us-ascii?Q?k9OvUTX/DJq6x/mRT37+YUubmpuDcTQxE5T93VDw83xtYq/J+3cIUpeBVtM8?=
 =?us-ascii?Q?t2y9tarRrIupMaofkNyWLrKf4Y4fgN5uQVqrkwvAukvqMSz1NToIQzG0y1ra?=
 =?us-ascii?Q?o0OQoC14Unie5JRlPJ2VPNFZMFMd19RP/cozTzHA1NZZu4/6sirT0K9rZg95?=
 =?us-ascii?Q?eTXw0dUUH8XbEq09IZ0h04UAedtyb9IWfG43PlF4+8VsEX6EuZGCWqkDbvFn?=
 =?us-ascii?Q?z36puKvc0b6aqtGB/lzW3/lenkp9Tnd10UZNK4664hkhNWSjK1bSEZ/IIVZP?=
 =?us-ascii?Q?fGnxIqCFfs0dcrFy7dx3hmyeyCeikj4kzKitMyD3uVi6RYZcb58Q2IEfiz7T?=
 =?us-ascii?Q?LGUEB16SxyEmm9Qkk7N68W8fTel0b9tEpG537cge8Qhzudu+C9CMcbhQ8MAG?=
 =?us-ascii?Q?zMKnRYib5y4yqvICt6fzVZQ6z/81CG1iEwOjOWIWC9quPbP6X8eb13r9I6wT?=
 =?us-ascii?Q?OZ1YusnAKQwOkAomnnjccQItXdqtk9xYSkgy4dPf1C5x8kXC+uyX66Jd/7uy?=
 =?us-ascii?Q?rP6wixAfhHdT+Rkw9AprPMfat2s62xHOwCtm2Qxq6IvPZo63MWIBWWBQJfJY?=
 =?us-ascii?Q?ngSDKhTiJNc50D8qifQM4ObEbOJgZbTnrNQh2j9AY90Bv/dQMNvplSd+OAh0?=
 =?us-ascii?Q?6KorX3Z4H85R670Mim6eS5SyMtlekIqK4Xf6R3lF10f6MOeFVpCD3hh0V5Y4?=
 =?us-ascii?Q?aIH9a7cqrECp10x2hlQkD8Z3WMBzUQAhws5WjLKmp4UVE+Gw4w5nNaCr1qWo?=
 =?us-ascii?Q?Yslkc+hnjErYdCtfCX2IGocIxUy6HG9Y+7eftyeebooMr4yvYEYdUOMikn5V?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1175b0bb-6220-421d-d098-08dbca83b03f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 17:58:35.1028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXHHKrPtHm39nXzh8OoCiTl+O6xJXknIC6PQSqyX51pbK3TyUyoOlID8XsI2HJKf+Q1EC+gUbocesby9yhuE5lARgm4W9WISkzuYI3yW6Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/dg2: Remove one PCI ID
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

On Wed, Oct 11, 2023 at 09:15:26PM +0530, Shekhar Chauhan wrote:
> The bspec was recently updated to remove PCI ID
> 0x5698; this ID is actually reserved for future
> use and should not be treated as DG2-G11.
> 
> BSpec: 44477
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Matches the change we previously made in i915 with commit 3a38be31ec82
("drm/i915/dg2: Drop one PCI ID")

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/drm/xe_pciids.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index 29f07a00ac0f..b19478a58694 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -134,7 +134,6 @@
>  	MACRO__(0x5693, ## __VA_ARGS__),	\
>  	MACRO__(0x5694, ## __VA_ARGS__),	\
>  	MACRO__(0x5695, ## __VA_ARGS__),	\
> -	MACRO__(0x5698, ## __VA_ARGS__),	\
>  	MACRO__(0x56A5, ## __VA_ARGS__),	\
>  	MACRO__(0x56A6, ## __VA_ARGS__),	\
>  	MACRO__(0x56B0, ## __VA_ARGS__),	\
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
