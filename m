Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFBACD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 13:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E457210FD1D;
	Tue,  2 Apr 2024 13:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/9d2OTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC45A10FD1D
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712064101; x=1743600101;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oU/mdn+Jz122J/i5kg3Wto69c72H7b3pB92ULlMp2Mg=;
 b=b/9d2OTXFiWlth93ri1lmxTczKrSiQmWx4JyrTI5XjiGFafvBxubmxlC
 UqCX/Loy+QgyYdnJutA8YPhNwQ+VHn01PlpOcFHwzFwL5QVo4wHDbHGY6
 7Mk/cbVLAFljzLoiCuAokrCFpNAkN4yPaZKU4E3qbDlMZQW0KfHxvdPSp
 FqTcPDUNSj/uMb34aw5L5Uv+t+eojCAMTTq9u78DtYu2/xNOAc/hZ2y3N
 nDVT5vtmWZKLoyYXm2RSbl5qoAPiMwmJZ0QbTIKrZR/D92nqMMMg6DHg+
 9xt9BwtXyr7e3JusQWZGPBFuixJmerW6G96jvUOKRQRSbWNH6n1H8PEXQ Q==;
X-CSE-ConnectionGUID: jpKjSG3pTyqASStnH+Xf6A==
X-CSE-MsgGUID: 7mRA1s0pQJe3vSBK/asrag==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="29714234"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="29714234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 06:21:41 -0700
X-CSE-ConnectionGUID: SR5T4+3zQ7KvIhWJkm9qnw==
X-CSE-MsgGUID: oNlvmBGmQPafKnxamjNdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18036496"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 06:21:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 06:21:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 06:21:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 06:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxVSOAiShCOlOwXKIJFuIGEeFw7HmxAO4D7Cz9aISBMjlDUYZrTXLbTzBf/g1XGY3K/E0Xnt01j8tZ0V9ETFKSvItE1FY2Axd/4fCaUzJXIy/Yu9o7OaLIBqvoN9yPeOsNaM2ECMEVjdSthixhwB6/vveVswbhE6/Srh4AHXUGFUmP2j+qwhtyOBIhdcQYGQBxuATreytnVwGS666hDaCDAP8WK+JZqUKf6s2KKFx4tv62p6tGFA8NExbKu/VUOOzW8StRYff3thW5yS+RQQ7Tz0zt/VoTu080cGq1WKWB9uRIEZ6avRmOHelB3xCRLI4u534yKWahr7lLzVxfhkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVSG0Obr1JLpIDdF0xFVqgtL+xkcu9JHsmZU1uFAdVA=;
 b=bAl0o+AqXJSlhmMxFqWfordBZmb1BaqRTSqixDxrV3Ejvc5qpe7Ky3hRJPEtvnnhP3i/uDvhT1iTE6i6buYYava+i/Hpw2o+0uCmUMNDff3PAuKK3bKeZHypYeqxW8btHziGKcdSpMAQn5h33KbcWocz9hY5DjcCQgaJO0AfG1XpTDGx5RQAElmDffsfQwJRgz/7YwJs2s14y0XDkgacYWc1b4ZNo364xfiIsLO/vMObo49hGqdSYMA6xRWcK11xGWeBA1FGRHkxaoKw2q7tAQ93C0y3VJ7D/4KfZnHaBUb/yT+G2XaGM3+5y2KkDAC3Sm9G9xUIZCnukONtellvPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 2 Apr
 2024 13:21:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 13:21:37 +0000
Date: Tue, 2 Apr 2024 08:21:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 01/11] drm/xe/xe2: Recognize Xe2_HPG IP
Message-ID: <uztojhsh4t5xfc6weedzsn5wt3ycw2wgkxuncp7j5hrjbl2nmf@z7p34j4alfwo>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402124724.1238122-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:a03:331::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7715:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Wb8EoMr6gUyVyJeIpWwDh03IliwxiInSGqvCIFcLUesmqsCauftCA1Ovw888JgWYuG1Fp9iLo0bZdpBdNVcZ0AYqxqJx8F7o4g4hUEdKuWrZkXl1qDmtLk5nsXxW3EcUDhkNzKgllmdWiD9k9BcR2VJe3CbVYYMTVhHlm5/3bpfuQREAMt2+3Ux6MMtACHM/+9LNyx9BLFdSFEYDMBhOcdBoWmNZuW2yvmcGE7Kky+mVWWfxCdKwvSaiF53L7kcTqu0UC3RwzUJZ3B4O8WzPR0K4RVTSFgYUMCSzJuXSaqQLpavkgdNUbqAtlRhWyDC6Mx2RVd8KY6BvIHuFQRZ012PpO94szV9IDip5XFL6nFTMB+VpqGrT2JPB7FZ/erl8xMNeYMR7YwH1eA9p/qmhYH2hTMBayz85B0WzRp3U0hQUHMZbGWSL1pVJxRueNGosHyvBnrRTLKZh35NH1hZ4sFUWhhTzsaGvlgCvi99/MaJMqiX5UaT7PUFow1hEO5lJSTZYynqMEkmGbpMW429b2GWYbFV8sG0JPDL0k1APFN1Ewu/EgYo/+iZHsbI50hnltrKNTWcxJUCKT8Vj+57DOwlz+wwA6ezpzc2+S9FGapbc0rKLCS1rREH0ngQfbc9VYyY0a9y4C1E6tP+pDavZEiZBsrrhfjpo4D8XeLJGy8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uxjwVCPc7Q1TLeIXnN+5bMYy5fBgJ2UbzuD6jfbD/38j6MMz4LaM4gwu90GN?=
 =?us-ascii?Q?habNYBJCUiHUOegSJxeV7iUXXO95zOuKksozDIDbugG/nTcw8Sdw7Tx1aDzU?=
 =?us-ascii?Q?7F9YFxV2qrRKrUjQYTVFw83oTX4WjaNvSbrfhDaoMNKlerS2klgmvkQB6mOn?=
 =?us-ascii?Q?dtBZNM2hRBIrhzj5LsSPW09tUk7c2/jVbcPyCJN6nkJW6b/qLLZHi8X4r0Ni?=
 =?us-ascii?Q?7n3Ry6ev3J2dUZzMaROrZmID6sO4LsmG+wE4S+8duGUCWIXG/pnU+yyi8FbZ?=
 =?us-ascii?Q?GBpohS3V66sfQQpW5ll9hErLtJP3JmC3120BwB9V9uMuBdRPY+PIGvIJAOz6?=
 =?us-ascii?Q?DRNSZZnMU/V5q3pj/6S3+nFkv4V85BWSCk6FoTMP1YQeEdCSOZMjNdudGL2O?=
 =?us-ascii?Q?B3Fs49w+e9KJLzLy73SfrODNv7KdrquDAjEut9GgDnB/HkZY7RvvTOPLvb+X?=
 =?us-ascii?Q?SU6eghUrnu//8E5ks1+DBcWD1oJkMhCHpzk3+ka3YHonquQYmN4qU3xX7++w?=
 =?us-ascii?Q?8tPz3G1mU51bVkHRJqm3uviwq+x+hIAOxu8Ib5MYoMOd06CVecN/2/07dsJW?=
 =?us-ascii?Q?7uBhytbw7ksvkoLO/QB5POhyv4xAgy6lbqSgXsBfFefrmH+NGjpefFSUGM1o?=
 =?us-ascii?Q?nx5lpQWELu3PArS4GbPjLpOIXp0tP4MW5kXPmWdl6QBdx5PihhhGD2ve1pDY?=
 =?us-ascii?Q?lTAH/hHLMMVjsK53xWazVHvbv7RT+pliaiOScbA09H89QjPi3XPtBmt01fKy?=
 =?us-ascii?Q?JSktkYP5OfGbS8ZqhBJtLavLK2NQdVoBD2CjuKlvVsQmIFZbUs4y8eH3m+py?=
 =?us-ascii?Q?qdfy52/ClX8Zs3BKeut/ZMUK8mw8+fQdKj+KjiGvt2fHmNB/R7n0ugm2t4CO?=
 =?us-ascii?Q?r2IH2/dRoP82nqr+GsFGldeBPTI3Y5Xz+C3Ckaj55zKyih1C3SG4Y8TRSCtb?=
 =?us-ascii?Q?TS5t02en92vpss+2mHxMPQG65AqrJfQxAyTu8a1zIlW0IsO5xsSfWuQ5UK6u?=
 =?us-ascii?Q?uR8MTR2J58dGrypdECjEI0UsNILWc2tWrSO9Rl2aWHnJrY9JsGK+TigYZVY7?=
 =?us-ascii?Q?z+zbZgNCISpka2Th+8Gqwphqrv40jHI98DnEO/3I59wQz9STqqQKYNYzVAjI?=
 =?us-ascii?Q?VLSke9/Ww1N+hCmO7kgFV9Zk1EX/sP0qxu7V1+Os8/WQibXTX1GRU/Fak3WG?=
 =?us-ascii?Q?DrcM+vuMRA4ze+K2m5TQ3ihJ5FZSrM6bXb5K+IChJ5cZRVa9FBLxcCeH9aO+?=
 =?us-ascii?Q?QV9kcoOCq3WCuM75eHJJKkDME90efsipEp8j86ggaIAOvMvCGFRLD8bksWZF?=
 =?us-ascii?Q?QV0dtWQIEPNupEW3qH/tRLtI15CwJWyZTg1QiM9MzFH5OL9k7Mm/OEAx2iq4?=
 =?us-ascii?Q?4bJJV8onTn3bFLW3+7lxzaVCbQxqXpwIjH7d9PiFJRUxWkolQRKERdUjuDJy?=
 =?us-ascii?Q?00BrmGut7ON8YeBS1aZ8+AxRsCSKbOqV9RFbnT/qXpe5mVOFLOi3YozBpgsH?=
 =?us-ascii?Q?5hmV+g/216mxY5XxRV1Pjm1qze48HDse79N3oVhhZezIRoCt2g+n7D1clYgt?=
 =?us-ascii?Q?MoLT1EbhLvFfVppI6hlOuKV/jQmx4wREOJVzOX8xhouM5xf0fglhtLh5wNhr?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f64b40ae-5f7a-4f13-fd4e-08dc5317d379
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:21:37.8710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DpwzUgTDxYEqd5f5jVu7w7HPd/UJqzgLWiTC0FNajMrhnTtskhYM5ixMiF3ZZ4jEJ38hJqdn4IkBleiapkAnpL2Sf5ZjquMMu4z+tC9YC3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7715
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

On Tue, Apr 02, 2024 at 06:17:14PM +0530, Balasubramani Vivekanandan wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Xe2_HPG uses the same general feature flags as Xe2_LPG.  Xe2_HPG is
>identified as version 20.01 in the GMD_ID register.
>
>Bspec: 68090
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Please drop my s-o-b and add my r-b.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index c47ab4b67467..6fd0f4258ba2 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -174,7 +174,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
> 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)
>
> static const struct xe_graphics_desc graphics_xe2 = {
>-	.name = "Xe2_LPG",
>+	.name = "Xe2_LPG / Xe2_HPG",
>
> 	XE2_GFX_FEATURES,
> };
>@@ -345,6 +345,7 @@ static const struct gmdid_map graphics_ip_map[] = {
> 	{ 1270, &graphics_xelpg },
> 	{ 1271, &graphics_xelpg },
> 	{ 1274, &graphics_xelpg },	/* Xe_LPG+ */
>+	{ 2001, &graphics_xe2 },
> 	{ 2004, &graphics_xe2 },
> };
>
>-- 
>2.25.1
>
