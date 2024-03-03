Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2441C5478C
	for <intel-xe@archiver.kernel.org>; Sun,  3 Mar 2024 01:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EE210F199;
	Sun,  3 Mar 2024 01:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3iTnT+x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F09310F199
 for <intel-xe@lists.freedesktop.org>; Sun,  3 Mar 2024 01:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709428754; x=1740964754;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wP/DMwZtGrQ5N2sS96ErX9iKzdLAeAMyvN/bq2cVO4A=;
 b=H3iTnT+xgVeAtjV1hmKZiu3k2bTMQJrzJWqwCmH5TfiL6LBRiVkKDdf9
 e25WTAILZ4rym6JsJBRplp4LAUkaoPW6lFu3Z/DTyQp/l4Icy0SXMmxMf
 O2RF/VuoSxwjWSpMwJms/6nzEvAWQMWHXGvZOPGvMvnsIMyNsPR7qLJqh
 RW0+r4wzmuVICwlmTc3mmmCmVdWE+zbSrU5TQBCZiQkMRR3jkUs4fOrb2
 GKRfIbTkaRRbNJ8KNBO6FMc/QBEOKNK+w2wjGw+O/BPzkN1qBfBuW1Lve
 011/K8huuk3ZYSEugkuGsv1z0OwmfY00pRj5nMxQPz5nGdPDHjzE4Tllv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4115518"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4115518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2024 17:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; d="scan'208";a="39423893"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Mar 2024 17:19:13 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 2 Mar 2024 17:19:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 2 Mar 2024 17:19:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 2 Mar 2024 17:19:11 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 2 Mar 2024 17:19:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaZNvTMfOerdPlpYDk9ilid4f1yZKYCZ2oIxkWUbkOb390WU/9718Gob6XoE0LY40KP48XZ8LLlGQXVKZDKObO4wIUX++BvYMqocqL7FhSlEN7BH6si8cl6NBK1whNe30r0UNft623sWr1xh3OjdiGlGV7G89wh3+zBYiBTMtap+OIvq9EoswPKumzobhoQIuNgeGUzrrCUgIdWv/KBa/BCSf8wX33CBtC8dCmlzp2Wxad5pCbNlAlIG45l+VF/MRzvTj/Rf5vt6lwDmcsKPx0fyON5jb0UTe/54/EXOq9AdL85c/1w+8SQJixO9knU6bX7flNH2/Yo9atWLzmGReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk0/GjgkFbCjqvOr5G05D8r/vOXYoMqn4HxVNkuvTzI=;
 b=OwlXOFVYv32Dq7TEBs5ssl6Zcu2qH838aGjDKjcbPDv3UII5UMWu8m9PjNPxYDG+sQcT1K7m5qEh+sQY1JzKqkh2j1l8mc7N6Cx454JOTH62zze6Ys4qOfWbKhuarpqxQNMTWzMXqe1sOaqbZ4kPNohPzhzuYnLaVE8LecORma1mjyfqGz1hQzFvUm2dTxZB64HcFFgqn6X3xXXWnVfHzS8YimKqfJsMd81hOkeeF90J/6hBGiK1MFdv+OKCloUKhTMqVm/S3K2CT9JixL6dAma4IaUCXKpDcARwEbWQSZOuaOayfTgOSCtQeNCFjdgtf09ddR5PZOBsU54/JamXzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.20; Sun, 3 Mar
 2024 01:19:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.017; Sun, 3 Mar 2024
 01:19:09 +0000
Date: Sat, 2 Mar 2024 19:19:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dafna Hirschfeld <dhirschfeld@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <ogabbay@kernel.org>, <obitton@habana.ai>
Subject: Re: [PATCH v3] replace 'grouped target' in Makefile with pattern rule
Message-ID: <6tum2r46vjvzjayk6o2gq2klzifjoi2vpgvpw63d3xphtj6b4t@2j4l3uxk455c>
References: <20240302153927.2602241-1-dhirschfeld@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240302153927.2602241-1-dhirschfeld@habana.ai>
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da0543a-715e-4552-1997-08dc3b1fed2b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +DbpT0t0pR1k/yw17Ly7Yufd1ZejEK9jnWk8yzeMQshM0wUYmnqQkgbVWiXKrkMQwtiUmq/WJbLbvDcolF5aw2YTi1HPH/rXaST+63gWUlTydmteNhMLY8rEpGm2fUY3P2phkpNQConzb7q5X1Nl3D/5d/uYC03+OZhHAyX997n6ikrGZizqv9Xkg+uQHzTtlf4FvK1/0XmAbCwlLp21g31awyBQL2r8Ja1k6/PfOR/PCi5GBbQ8ggqZkgHvpwhb9ih0g8mdC8nIqtXfsFv11eldJ6h60BdVGM3yQb8hRu1Aamlmi5Im1Mm3j7HVSHMX5L8Gg4ny4yn8BB9039NBTFIii3crFdli1S+r2uSI7yoGzTp/AXQ98lsMNdodJfsor8KokeIcKWBk13LkcTru5IsJYiww9Fst9enJKqkpnsYTmqwIu9v03878lGtFUfmL9/40Ta3EltNw+3OHv84fc8B+rWnxkcbIWzbrxaVzYZbNkV61+fXeqEcp2YctDiuK0z62Gascrf6MycN/l89/ONZTowZ47x283VcrTFia/CVatqFRMqwb0JqVPqVniUxe1hm/TG2AYAKSDVzInCrdevsdtbGeOaWkGuE+8TXUFqlZmQ00lbO2qNK8gIlrFD/o/kFFVN5bNMo0Ri2gFDmCVQCssdqOBHMCidf83rVA+Gs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VstStcjYM2r6lcrUPYZ+DTNW5LOB/IyeVAXta1/oP+9h3gFPp27SMpwIERiB?=
 =?us-ascii?Q?FDHL12rMWLOkKz9lRFk7uS6KnqZwNT0RGXcqE6hnSPvn+vZG0F8bWVfnGMz6?=
 =?us-ascii?Q?ptX4HkdetX9ugzn2rKhu8jEGjgmu5C198wUkxTenNgyDeqLHeXpdVFW5qC1C?=
 =?us-ascii?Q?OsXnw1s1zX9W/KOgUOYvf4U7+sdVHdxgx1d95J1Lepb0lYZ5CFtAM+lU2LBQ?=
 =?us-ascii?Q?JJcH5HCPrafauLD5gRtsWb2uT1u5QIprqJ1u+dYnIc8R6v8LFWGGH/kiYd9T?=
 =?us-ascii?Q?kQiGnAVLh0P1ZTCNdmjOWqxjRFPqM27ySIxOhlhPaL8ATHu1SH8PX1X9xmGH?=
 =?us-ascii?Q?YC2Wt+uyCc6qMu2pHNI6oMGfydFjZCuQHIACoLHGYgOPCqKjmTbaJMryYbgj?=
 =?us-ascii?Q?XIeLimWWEKq4/VAgHkN8gtJULGO6oJdySz8gbsekIGzYvQhZn7DZCLV+ewLy?=
 =?us-ascii?Q?sGP8Pfc5s/GOkTQWyn4JIQ8yoH24PgSzvZijviFgHG1j3PiCcZ2guz+WdV/h?=
 =?us-ascii?Q?FEUHerwSygXhWDyVLodNOqWo1Y9vA1S2oVtOgIp7lZF1BAafoYMb/0A0UDBy?=
 =?us-ascii?Q?WR7VHSN2I/XMXfGrwclIoDpAzMnx1pM35lRxuVmAvFWtmmNQuHFwxx48w1AU?=
 =?us-ascii?Q?bxkA4ssjBWOn/t7wNcprZ276cUbttwTYt6wkg3MM5/brX/Z0dFh/v7Qhb93T?=
 =?us-ascii?Q?sbAaj+HcqYU/ugJGFYZDgLjlF1Q0Pyck42Y92ZjolZsDSqBYMBEwn88Hq+YB?=
 =?us-ascii?Q?YPPhjA8SbhmWICKr9uX6As0gneZuCJnB04DTqfTbImA4uW4Pc5x1/JoPX0aT?=
 =?us-ascii?Q?2ATu3OBt1Ipedecgqe4diM2rRhODpgPmmNj8SgVsclh97HlL6aLNvYTu668Y?=
 =?us-ascii?Q?qcVkOPX140GCSWy/ilYGbUS181BWfQrwZXi9nFD+FdVzmtEdPxGKxlq1ouo4?=
 =?us-ascii?Q?FFiCTpvykrLBONghO5JzBmitIRPHmW2xxZx5cj5LCsIkdsF5DKxy1DG9DIsd?=
 =?us-ascii?Q?hTEqVoBmnLvYNZIy5rVKmycBjtJUkAup1Xt+DUme1oqobDgYcibcfZeiFvK4?=
 =?us-ascii?Q?Ptp4XH6ZZL6KTOvP6Nz531w50RObol6sZKxRaTzmmAPg5Tv7ksF1QKLu+ELm?=
 =?us-ascii?Q?je3zlw9drxViibNksd/QtQRSTBtunOtuIDqPtEmLofEQN2KEmOoKqOcXlZbr?=
 =?us-ascii?Q?o0VvRHwipwdDC1+qVxPuPf7DE9zqqeWipQtDJqOuq/DmLAnirgwt/wcBuG1E?=
 =?us-ascii?Q?PyvtBsWPQn4V7Y4TCvNWR48HEqhkHOUkHjEISTQR2kJXjy4YKo/q7DYPsa3d?=
 =?us-ascii?Q?04kdMt9cbD8XZlmhAsxOG/rBv85EinbJA5o2SJ9wR4l37J/gqvvwfLDiWX78?=
 =?us-ascii?Q?3HMqbK1Hw+3brFxjgwEYMpdFU3Ho2XOIDxxtC5KlFvybrcEn0/MXPSlhmHlJ?=
 =?us-ascii?Q?+VuwTIuktd4YV9Zw2cfd2QBzP3ZlYLTTzjfR6aoZ15uBQf4s2MiDuVXQDM3U?=
 =?us-ascii?Q?7+dDCWMByjHfWUjwCWTnJav+Njv3oPGW73GCj4ZisygTsxPSQuE7u375dkX2?=
 =?us-ascii?Q?u5QfIdZybxxszIntB48MByowN/uZBhvidMbsnBFGlVBmgBEY70HUnzF9qCaL?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da0543a-715e-4552-1997-08dc3b1fed2b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2024 01:19:09.0755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iBQEU5u+GWewZV6fuwjtVuYkMuVyZ4fVS6ubJnxdfFGacnFCFPPHiJO8WaJjQrtysIrPvas6UsiL+C0LmGpUCrt7DGX6sPLQxNvG3WBCvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
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

On Sat, Mar 02, 2024 at 05:39:28PM +0200, Dafna Hirschfeld wrote:
>Since 'grouped target' is used only in 'make' 4.3, it should
>be avoided. Replace it with 'multi-target pattern rule' which
>has the same behavior.
>
>Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/Makefile | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 1a59c15f4d66..5a428ca00f10 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -42,7 +42,8 @@ generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
> quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
>       cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
>
>-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
>+$(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>+		 $(srctree)/$(src)/xe_wa_oob.rules
> 	$(call cmd,wa_oob)
>
> uses_generated_oob := \
>-- 
>2.34.1
>
