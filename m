Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC006C54E4A
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C5B113606;
	Thu,  7 Mar 2024 00:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNRJXVBN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9AA113606
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770585; x=1741306585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JFoBQyWL3vuAGWDgghX+gs0oqgTPm96MJ5tLNuT5wyA=;
 b=FNRJXVBN3KKw0vSHJe8Y9Fz2w9HLHcx8VpI4NHg+jmRVZL0fCIBWGkK+
 02+2Uq0bJujZ6yNIYmxPLFbtV/MvlrvFN15lGHVlNBuE6O8Holyn/vVgw
 r2XySiZYw88HaVQbPF2xNRlKjjQYTB+4s6ds23/0WZcastBo9X1Zpf2eT
 PL0IfYAjjoY6Voj62OLRvgWh5qaYW/83QZFxgqBWle2i3UoH5RCvosfz7
 qhnTxhLriHfOEVM6sQ9Ty3x5V4RGYyIrDZ1MBrDb/CtqQBRSB63tJnrVB
 EqihwIbZIy8hjFi4OmYEw/HBLXSCyhS7wrXX7ITijn3qPxXJSmLxFFTub w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21940049"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="21940049"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9911862"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:25 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgCv8m5UQ8A55/aMNh1V86Agfz7JAjY2thK/IOBCSOSn6Ehysa7cCPRBTuqAHWIeOXlzqpqq2LenKqvD3Eg3t7q9oB65UKd8+AtOe+NYuQEEiD3GHP72s167QSjtr933fGi2eurIDIcktaWQqdvpeYWYk7LAykuXiCacyDI+DBPzpKheTo5VTctV1sGZeLR80x2Lj1YFTUfBhOBxS/xc/0G6/reT3LF4fyFhPX5dzqs9laWCFecdy/oNrL1vlSVQKXEUNQTDwKhMRwWgEb0nNohjr7e4UxMfDAJFX4qdOz+0e2COhW1I4IIuYUQS39CtoqLDOYnkXsEx0bEMLtEWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KViTo9x32UwKtFfM8LCRK8tbf6ACkDd4X8oP8ZGwS1A=;
 b=KNKJAj5vFy1CCoTdMeb+0ikkWa9Oharul+4tSozpiWO0OiVfTE7HyNt7qgHWajxa+UruaToEZ1p0tBa/32DyTwMStWRBLOqlwzi5mPdXooGv8rY0MOorIHnqsKD+xGzMEEfpDCv1i/1+vyXrgq2m3mCJGShPjOcOH/OgD1qMz7ojVUBcmPjPJnTL8tJqRa/O5vC7TZ7tkUyDm+HNGYXUKUxKWcYQzm6Slg14OfZowVihfa5ztE3FDR/R7HYXYKmNlOmNL4Nvi1Jcksh6S63/4IJGgrbLfhucj/nSaTv0R9KWH9FqjMonD1aR4KdtTK5Waz8YZWFFwe3UyOA/Lj02Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 00:16:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 09/10] drm/xe: Ensure all the inner access are using the
 _noresume variant
Date: Wed, 6 Mar 2024 19:15:53 -0500
Message-ID: <20240307001554.162153-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbe6024-b490-445c-d08b-08dc3e3bd199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IbcJwRAgzfLqz3nkOB4aKLS40wTZHW9bsdisrYkRLHqcargbcWchscz52A07pR/G0rc0bSraoYfMhsSLHIzxRW7xMVq40gaysXPu7otIKj0+97F+FGTDDXGzrGZW5VqmnkyJ3PUK0Ta/OFrrxhY+JlyeueJvlvSioK79O5t0CG53nGAfAvMJIABNepR8INvoynJnxomKJqTy+noOKCYe+cHUofDLFB6G3swbT6YT3IUrlfgvSL+DrMMOhwDlOOAfXInxxpJBzeOqeZR0jVtZUpMnrvLI0kzXHKE+8NHMlv980X4GcOcF6ODMZ+jm2W7sToIRYIipLr/EWmE4aidZeXY/qOy4xxte7wMTELlroK/C1OZui7eq7nxinc/QlJH2Q0Vxh6Lbe+IomaY21YUs5UmARbw+ocGijGYjE8J5NxK0RL7JgoLhh7DKm3E5O8nLir5aqTM1ApwY8yHBecW++ZL17LYZXgdPauQvyUs3Yrqv5kCVupTMXpCNji8K2Mv4kDl3o8hVUWNS9C/VwVNSlUfmZ3qHEYWfTvnpKbzYS9fRE+NSK8uwD/O5Agx+Pi6McXIhGikfcArYteuq/kz3v1jB8uyjSKbmBTV7QB4w2YxLftWxW+oBGNS97szrlKizwhyU0Re+x9UHXrqHXSOKMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?On3cwhSvNi/DcGmz9Qb0m9vHjdMyLWamjMeKGOReuluja510RtLq3Cy0dZWJ?=
 =?us-ascii?Q?r9q2OE/Xn9Cb6RdlW66gg5l4krix/rn5GYC9+tRs2dTTou49MUKGdxnK4Pcn?=
 =?us-ascii?Q?rbnZnbPhmqh0WsUOz0JXGugNnp3AEMv7NZYZqqxKaAhW6U7v43LiR4jbrL8+?=
 =?us-ascii?Q?irz9z/Dv/HNE8jnHaFbVwy6GE7ljuOnphB99QYyaN0nE41e1UtmsZghpl5tr?=
 =?us-ascii?Q?Oc8EVNX+tylerepNv5ZXLLHBKVUqaJCCML7RSmkz+AIXVFfpZwgPl9RF65eG?=
 =?us-ascii?Q?lD/esc0j+T0hKsu3cb07HvDkBnUgxgqjNw2E9z070rCn676HJ/cLxUKrLFOV?=
 =?us-ascii?Q?rAi5uU95soju9AvUec3SehInb4AqtMt04EbN7T4XLEzSbb/V4rv3k1KhJEb+?=
 =?us-ascii?Q?DKdhczxvKAaMjwnq7iMdhLWO21//OS82X31rm9j/pnPa4lSxOYipPHNtaEWC?=
 =?us-ascii?Q?bljIj9d0hYsx6Z5dgJWkCJoVh/15Bxhc1s4b8NCP5Q/eHchr5aAhGv190ClS?=
 =?us-ascii?Q?KR7phTruYugTp9RX3MPGqhY+q8kCksMYVE6xwPfHUabWXHorJMtO4z2piAbX?=
 =?us-ascii?Q?v5CEi1VWW49bmSqSkzOOyIbMdL28u6BXATfXbNLK4B6V/TXwrdVPJL1qnDKS?=
 =?us-ascii?Q?9qpUI8uQwIchTYnXTm6YyGSzBSz4mnOB8gUxvBSTkuEfJGGDkI0JXbNwdtpu?=
 =?us-ascii?Q?FY93p8dQMx2eDrIpI1ivmlCLMd2RWSypHrEqk9e50dOLX7xJa/hf8Xd5BVNy?=
 =?us-ascii?Q?hAFEAs7Wbo2wERr7U2OBHqtDRZjZ2vD0N7oBIhXlv70lofrJ/3Bu1NrjZ8/B?=
 =?us-ascii?Q?bqWB9sN6YZmXn03bJaGD2kE+GkopQdzeVJyIslegwIORnroiGOybHsiT+km2?=
 =?us-ascii?Q?nWm+Jfr2+Okx7E4MDWfkgkT/z5kNiT2E73IDtor9ohXBi0Y1J5CaBEzechSV?=
 =?us-ascii?Q?AGOK0MDfbpFErmdMu1+4qYcUE/mZRQcraUfDlCTYXAK2LhyVSnMXuG4nsJQa?=
 =?us-ascii?Q?5HRShev0gbbzfhLEJgbYAgLMaYCjWCU+ZFRATDAs0AF0J9n3PGsItuviV5g4?=
 =?us-ascii?Q?qMC7JtgnTpBvPAod0zuIl6DSDYP40VkZv3DoMmNkr+lY3KNW9sFb36XZwb0c?=
 =?us-ascii?Q?ErpBhD2wnGjjTUFKMBduiltDXqlf1aYtjk34z2lffA9px6hoXUz8k0bE1YUV?=
 =?us-ascii?Q?BHqUwjha8PXDxwaYhm16msMEz9Mn5xajufxKVJ+NvwKvdyirk8td7HJ/3Dda?=
 =?us-ascii?Q?6xAfb1/B6qn0EyzQZJXiYTNcDr5jZA/1XRvFJNuZd8Na1RNFghAmyL+y+y5q?=
 =?us-ascii?Q?ukx9wnlPCXM9hpNVnjXeSlXV8n/0KrSxIw0Rycdtnv4jBkqqIWMhnV20uCAM?=
 =?us-ascii?Q?7/q2Ynrv45SY+/1Zu2BXFLlF8nERVRrAl9MHFtOFtvHzYIdqarwSrKIDTdyg?=
 =?us-ascii?Q?MqZZhqqy8rbB5TsviMSua6XWKrUUBQhqlFhGIBKNp2cWxKRQndhJA+1MQPi8?=
 =?us-ascii?Q?jl69MO0ZXiFBrg6KRYi2lBFPTcLXTg92F7s8Qww5PokZoumQSxdxtFmiHvYm?=
 =?us-ascii?Q?DM+BhkCJ/wv69iZZL/0MGrxp20hgW3bcZEqxYwihQuuk1IUOvIGR8obBjf3z?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbe6024-b490-445c-d08b-08dc3e3bd199
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:22.2467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVDYJgH2EE8QpPaOMvFAoW4bbEOHSaoNZOKYBhUZFGikWwD8Uj+6a1Ui4Jp4eF5/ghORX2GgEN4gp/AuiJwm9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
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

At this point mem_access references should be only used as inner
points of the execution and a get with synchronous resume previously
called at an outer point.

So, before killing mem_acces in favor of direct accsess, let's
ensure that we first convert them towards the new _noresume
variant that will WARN us if no inner caller happened.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6c7850dd70b5..58815e9bf242 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -671,7 +671,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	if (xe_pm_read_callback_task(xe) == current)
 		return;
 
-	xe_pm_runtime_get(xe);
+	xe_pm_runtime_get_noresume(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
 	xe_assert(xe, ref != S32_MAX);
-- 
2.43.2

