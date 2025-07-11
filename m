Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2138C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0C710EA92;
	Fri, 11 Jul 2025 16:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LumEwzF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6B510EA78
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752251639; x=1783787639;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5VI/y02SKLW4TnnQkIEaBEG8tcLUhz3QFif1MtwCUhU=;
 b=LumEwzF7n12O31hR9OTmNPU3BwvA4btGRDZdP4NSvXBdZpGJ4LqSwbFL
 q9rgH0R/mTo9uhiuOthdRrG8pVVrBl2FADqD1G371nHxbZfiLXwuMlqPv
 aAQwYaRI3dVbepaqHbYsfozRuOHj67m2uYJe1+x9d1+DDlOb4RPLYAive
 xsMGjXpjZV75aLDgi0BHOWoUgXS7tayJeUFo6/sNZm5WX6oOpyT51i11j
 6g8c7JXXtF1sszZjhLjJCjQm31PcY9mgqrF1h1gJEBhtMSofQH3yXWCxT
 /JWL2hNJVjMSGe3Jo/im1OUkvVB3JqkY1oiEhYjbvK17/jwfkLdvE6ChX Q==;
X-CSE-ConnectionGUID: GJfUvg5fTwm7fhbIlls0Kw==
X-CSE-MsgGUID: 5XANmKkQTHKNoqDdBPtytQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53663612"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="53663612"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:33:52 -0700
X-CSE-ConnectionGUID: tNxX0tReRNurB5W+Gmf7yQ==
X-CSE-MsgGUID: ouasnBYcQAKzyGnPvkErBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="156037052"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:33:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:33:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 09:33:50 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:33:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY0j0a8Q2aoz17qd++W6b6UdyacUQO8MaO0xEASPrNr8cgzg1EnG4/x2G/FcRvlRs9SxwGdMwIeqxLtvj8ES3Z1vQ1ViMRA75CFytAib61B1owiq9Bo37YWiyG6binGjTckiZYsK5h+JOD+crWJDTcCHtbqrZvC8DogxG0YUus3rc2VFqC99okmUDPrgxR531I7OgXVSZ4hkvpUG11JIVVwdquUalIkYxgffR9iv3rYuIM8IF9Co31Wfz8Qxl/TrTiHxBXPADPR6jTRY4nWwb4KjuzWOS8HCdKpNfOhW8aCu4LkRgGRcRLiuHyaR7hqsknLrlf08Kov/57vc6DMgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kj6KDq9oo7/fF6sTpaAfGgnkFqyDYs9N5IKHL0Esn2M=;
 b=lMoL8mOydU199K+WOljt8/l9G372MZLsFKKpNkH/mNgga7PEnBGm3Zzjb9xf431xiJ5qYIJF8Og1t7wtKD25boVoBrz2MdHSyJVItONAIaS0TxqQOv1lDWkVh7bAsWMRAvMrlI3RozaH7U2ZD6Z40mql3f+9Rpo3NQ0//ltjmzHnKjOY65chPnoqsXYLyG1w+xiZg5FKNJE8z96b9iR/uzCVJUToSQI36QF843VFpDh/iOGeyMQglcGlXALeESu2VzFnqmQOlwLnYZukR4hAhuRlXlLKZsQcJY3xqhB+vo+0SuCi780Uo5fhvhhJJs28x++htpII6mWyzqIztGHOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7799.namprd11.prod.outlook.com (2603:10b6:930:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 16:33:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 16:33:41 +0000
Date: Fri, 11 Jul 2025 11:33:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v10 6/8] drm/xe: Add plumbing for indirect context
 workarounds
Message-ID: <v4v3jhrlnghwiivxqb67u7zfygufpztti5enfja5ectz47l47f@lyxnq3rhgjjv>
References: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
 <20250711160153.49833-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250711160153.49833-7-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: b33ecab9-7f80-4302-029d-08ddc098b1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0nocuFQcBimfM/oOobHMvpXpjqyp1fdWeZCj9ivcnZyUf6xMqVdOmd3Z9xwb?=
 =?us-ascii?Q?1l2TyjzJuMB+AiDhrGNd62d3LYjX1MYflezC/iQrH07NMZRbt51Gzy8b55d2?=
 =?us-ascii?Q?0ZiYceWE4g11be5nGMZNsquNW1dl/TJEWwYi+9j/GT3aZ7KHze9c67B53ixa?=
 =?us-ascii?Q?14TruZ3tiyBm4CvBgvQ8E8G6JdzcVfB+mD5USV8AJ1DNGF8QyX98z04KuFP/?=
 =?us-ascii?Q?XgxBdozSGrnNm2kBCbA9vmCEK704PanccTJVvv02i0CZuk7QI+O7r1AND2QI?=
 =?us-ascii?Q?jZgIExJZG1pSry1v4pccHhzf3syKHemR+ZRqAfLl8luQ0PifHIbpZY5cYD2N?=
 =?us-ascii?Q?H3lrS884wwfbqKq/S+U3jMlGo9fkEHp19Xv7GnR/lfsvwTSWU/temwR3ZHat?=
 =?us-ascii?Q?Ve46qeutJIvBgX/yfNmyFRWm7HmfJ5MXpdzq9bFv4FKccniolVZzX/OmKRl0?=
 =?us-ascii?Q?PXWIpPFgLUk7eoE/ZBpSVzOPTVQxxx835rdN8cuwSLNHT8vgN8k2kLrIC89v?=
 =?us-ascii?Q?CLuHEYPWChl19oVNslzcIEzQl7C1Wvt5ZCIyUHRgKLaLPzrpXrSS9NPgizuJ?=
 =?us-ascii?Q?Z8C1cmpbzSS2XVGbKqjcdWevSPUIEJAmRW/RHcshi0C+7WAXppt1Wxg6MSZL?=
 =?us-ascii?Q?LOxtd/MLLFCXP+ZXll7M2CWe7iELV96MpNZafMBNVN2IcSpYJ5/4/sEJQOmk?=
 =?us-ascii?Q?QvFPgAeBy4zTEi3YKlPB1h94PHP90DNFwUwvtwLko/+k+TQGq+6bxD0h90Gf?=
 =?us-ascii?Q?y7lS/BomjD0HqFNpJ18X28Faxpkk2g0tcASOVfkL/EwXVXHKOWGmr8kLNvYX?=
 =?us-ascii?Q?5diV16p/CLm4nO8bsCbZkZgAXJcZ6M/FomHKERa/jkgW3weQTHLk6+e47ahi?=
 =?us-ascii?Q?0dYibOZ+yb8N6XlWW+bl7B7BQAf7aF5Lu4HDNeJNlaMtQq976npwWY6AiznU?=
 =?us-ascii?Q?zqE+SrPSml+3jSlXfzJQ94YwnjjJZbtxA2F6O5qnlwYyFOybykriw8EtjY3Z?=
 =?us-ascii?Q?+s+OLjl6/81GObOElsN+dNqT90pSCAn54LvcEAdQiJv7D+Ou9NN07G3J3ImV?=
 =?us-ascii?Q?1hrf1wLA+3fZRd/OKHTE/vHXaWyhfGY90TjF/dEgu0HTRFJFkHpafMEAticI?=
 =?us-ascii?Q?ll05i/Natm0IXQ6jMgP71DiM8KqAKDqW0N0efRgqRe/eRg8zyU9e/fOUn+CD?=
 =?us-ascii?Q?uxzrD/Yr2/UkCZsB4G1QNtCEuNl1wG6xo09NFhl2Rsv5ox+RcuSy0EqxBhGW?=
 =?us-ascii?Q?PBPkYWxuAA2IOOuKA48rnGbC9bQKceKEDCsVioXpYtfXBEF+GUEnNQtCOzFF?=
 =?us-ascii?Q?lgIgu8wo+wSYqgRkVn1ao95bCvlukyGTermE82inl94eurR2MQ8p4zkxr3+B?=
 =?us-ascii?Q?9iPWDR9nUfc208ypviXxDmh0BvZiqQ4mEPIdtrfloFdMCofjvrqd4yPRcYNK?=
 =?us-ascii?Q?XQZBNa8MGK8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mc+QqcRWMd/6nVRXCCSMWKEnEgvrc6HZi/x0DkZN5TdZO44lfSnaNijVwOj5?=
 =?us-ascii?Q?Vqpouwy7ggKHNj8IaJuQlcfv1525YrF7g68bjUs/EkUuXewCA205mbJ5c+eN?=
 =?us-ascii?Q?MXUr79m5N6HXMtk5lcfViBMfvirxwyV+8WRWqu8fwBXdQk3KOI45reketHgv?=
 =?us-ascii?Q?7K/SVz9uom6MvxB8m5V4jC1Jh6PAmP/npTNEPehgPRNAIZMkXH/pFF0fLo4X?=
 =?us-ascii?Q?gcdozsi+gNzDRTco8PSyZOVD8lTqftFBVpCvDxbJY4XGvgqUFgn0Jgfa0HZ/?=
 =?us-ascii?Q?4ovvv8r+PflSsdGDj6DfBVBbglYwkCBpU6vkG5nm5sE1SyxMlo/aliQNAJ3U?=
 =?us-ascii?Q?nay9NBdMI9hkqAhGVC1GjIA7Bp+aQ0tK3ExNJsT1tQTNbs4LSQngbfH+wcHI?=
 =?us-ascii?Q?ULMF3R6aru6hyXUHxH9IsoeqxKBAdrXOYctfvQkpug0bWC0X81pivURAkppr?=
 =?us-ascii?Q?bu5o4t3IhHo8H25VU37XXLe8tK899D8Q2cvYYrHan8pDauIhb1sOs+cs5flc?=
 =?us-ascii?Q?o5pQbUZsRR+v/1othxzo/Aqut6ZDjXgtv/nfFpbrb6+x2Rj61Dt99bVFq/qE?=
 =?us-ascii?Q?l3qqEBUXVlqzPAyXBF2NOKZ2FhxMSq2+mNgk/tG3ZM94VyOyF5GSRJIQsSIN?=
 =?us-ascii?Q?SYV2/D841J05CUjGJvg4CswvCMVS5wsx7CBVUomEh/020mZXU3HnRN3j/OTR?=
 =?us-ascii?Q?5xqfF1sLScZb+h0bNbDMC45+uMZf5Kran+AEUfNKrtAfh1b3m4cNSGWxMx7p?=
 =?us-ascii?Q?yo7jxDJMac4NtQ2Dn7j1QyKjmWkC6laK3850+lfSs15lu3WT0SSfN3A6W32L?=
 =?us-ascii?Q?ui+6cJYrCZ2rO+mGYDsSjLCPrbtUVpHQHvatD51UYmW0ZTd9nQxwiT5ji+Fr?=
 =?us-ascii?Q?yyZHe/FEBLFUVFjSEjfQQNapDIDsY9tYc5IuMhJorne+w1puMhaLZXg3oFZf?=
 =?us-ascii?Q?xvAjoJABUGImdYb51Eaqx/VivtjvQhAeFUiDqbl5ezpXO5aDZmROo8+y5PcB?=
 =?us-ascii?Q?NhkqbrTX1gfgGYk+0IkWCYoMdyTBzPZk8/PP5FfsCoBraC6gTDDKWUnApuKE?=
 =?us-ascii?Q?9HSwtmVQOJJMeBPRCfPhP0g2HruR/XE4RTLDLXqiREAVPFlOxWs+pCDotyXm?=
 =?us-ascii?Q?WySC391f1GmuzAF7iwdhr1ynX5rv/PKMQtE5ySexoXJSQaSNYFcAb/O3j1mK?=
 =?us-ascii?Q?NMcp+IaOTGsAxM5jSO7Nn+qdoKuWUlfyXs8/qsl2agvNRPsQSobnGgisJrTU?=
 =?us-ascii?Q?P0TpxiyMIOQ0+dmu2inzFD2REH3P450AfwxrcLWVRihF+QMt1Smb4slUnnbR?=
 =?us-ascii?Q?F62r1kSnTjWoDU2+sIR2AwaWOSMerCmNmvW3WwLt/3zRcyf1BPc8Z5l+/kLn?=
 =?us-ascii?Q?hRZ6PnQbxFQ6CEyJQUL37aWieV59m38Mb58mNOiQpxmiAQ2LfqJyCp822Z/C?=
 =?us-ascii?Q?p+ZWyjyRlKIwCdkSaAbuqhdkjaBj8euJElPRyB4yvmoA5IMHfcAUfoYRM5Rt?=
 =?us-ascii?Q?RmxgFiaB0A6Lsrc1qq+IU/D4KLcfb91aazrptpFKj1xvlRuDV+FiQU9MjuKY?=
 =?us-ascii?Q?l+MR/AjbdG+Ihh59U/eCHKDdpiA7aP0068Who1jig6pqF7hrOkNH4w9dKk9K?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b33ecab9-7f80-4302-029d-08ddc098b1ec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 16:33:41.1364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6xqWl7Y0RFHUx2x35uscI1SzU/1A8pRTVf152W+x/FpBmde+W2ilZLHlETo1wD8kpn23HnuGRAX8NZuKMl9TObZq7LHXScPQfv/U8Z2lfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7799
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

On Fri, Jul 11, 2025 at 05:01:51PM +0100, Tvrtko Ursulin wrote:
>Some upcoming workarounds need to be emitted from the indirect workaround
>context so lets add some plumbing where they will be able to easily slot
>in.
>
>No functional changes for now since everything is still deactivated.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Bspec: 45954
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks,
Lucas De Marchi

>---
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  5 ++
> drivers/gpu/drm/xe/xe_lrc.c             | 84 ++++++++++++++++++++++++-
> drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +-
> 3 files changed, 89 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 994af591a2e8..e0437d0454e6 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -12,6 +12,8 @@
> #define CTX_RING_START			(0x08 + 1)
> #define CTX_RING_CTL			(0x0a + 1)
> #define CTX_BB_PER_CTX_PTR		(0x12 + 1)
>+#define CTX_CS_INDIRECT_CTX		(0x14 + 1)
>+#define CTX_CS_INDIRECT_CTX_OFFSET	(0x16 + 1)
> #define CTX_TIMESTAMP			(0x22 + 1)
> #define CTX_TIMESTAMP_UDW		(0x24 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>@@ -36,4 +38,7 @@
> #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
> #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
>
>+#define CTX_INDIRECT_OFFSET_MASK	REG_GENMASK(15, 6)
>+#define CTX_INDIRECT_CTX_OFFSET_DEFAULT	REG_FIELD_PREP(CTX_INDIRECT_OFFSET_MASK, 0xd)
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 768cb9de48d6..fc5c6ff6e34a 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -39,6 +39,7 @@
> #define LRC_ENGINE_INSTANCE			GENMASK_ULL(53, 48)
>
> #define LRC_PPHWSP_SIZE				SZ_4K
>+#define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
> #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
> #define LRC_WA_BB_SIZE				SZ_4K
>
>@@ -48,6 +49,12 @@ lrc_to_xe(struct xe_lrc *lrc)
> 	return gt_to_xe(lrc->fence_ctx.gt);
> }
>
>+static bool
>+gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>+{
>+	return false;
>+}
>+
> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -717,7 +724,18 @@ static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
>-	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_RING_STATE_SIZE;
>+	u32 offset = xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE -
>+		     LRC_INDIRECT_RING_STATE_SIZE;
>+
>+	if (lrc->flags & XE_LRC_FLAG_INDIRECT_CTX)
>+		offset -= LRC_INDIRECT_CTX_BO_SIZE;
>+
>+	return offset;
>+}
>+
>+static inline u32 __xe_lrc_indirect_ctx_offset(struct xe_lrc *lrc)
>+{
>+	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE - LRC_INDIRECT_CTX_BO_SIZE;
> }
>
> static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>@@ -1077,6 +1095,58 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	return 0;
> }
>
>+static int
>+setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>+{
>+	static struct bo_setup rcs_funcs[] = {
>+	};
>+	struct bo_setup_state state = {
>+		.lrc = lrc,
>+		.hwe = hwe,
>+		.max_size = (63 * 64) /* max 63 cachelines */,
>+		.offset = __xe_lrc_indirect_ctx_offset(lrc),
>+	};
>+	int ret;
>+
>+	if (!(lrc->flags & XE_LRC_FLAG_INDIRECT_CTX))
>+		return 0;
>+
>+	if (hwe->class == XE_ENGINE_CLASS_RENDER ||
>+	    hwe->class == XE_ENGINE_CLASS_COMPUTE) {
>+		state.funcs = rcs_funcs;
>+		state.num_funcs = ARRAY_SIZE(rcs_funcs);
>+	}
>+
>+	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
>+		return 0;
>+
>+	ret = setup_bo(&state);
>+	if (ret)
>+		return ret;
>+
>+	/*
>+	 * Align to 64B cacheline so there's no garbage at the end for CS to
>+	 * execute: size for indirect ctx must be a multiple of 64.
>+	 */
>+	while (state.written & 0xf) {
>+		*state.ptr++ = MI_NOOP;
>+		state.written++;
>+	}
>+
>+	finish_bo(&state);
>+
>+	xe_lrc_write_ctx_reg(lrc,
>+			     CTX_CS_INDIRECT_CTX,
>+			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
>+			     /* Size in CLs. */
>+			     (state.written * sizeof(u32) / 64));
>+	xe_lrc_write_ctx_reg(lrc,
>+			     CTX_CS_INDIRECT_CTX_OFFSET,
>+			     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
>+
>+	return 0;
>+}
>+
> #define PVC_CTX_ASID		(0x2e + 1)
> #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
>
>@@ -1086,7 +1156,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> {
> 	struct xe_gt *gt = hwe->gt;
> 	const u32 lrc_size = xe_gt_lrc_size(gt, hwe->class);
>-	const u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>+	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	struct xe_device *xe = gt_to_xe(gt);
> 	struct iosys_map map;
>@@ -1101,6 +1171,12 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	lrc->flags = 0;
> 	lrc->ring.size = ring_size;
> 	lrc->ring.tail = 0;
>+
>+	if (gt_engine_needs_indirect_ctx(gt, hwe->class)) {
>+		lrc->flags |= XE_LRC_FLAG_INDIRECT_CTX;
>+		bo_size += LRC_INDIRECT_CTX_BO_SIZE;
>+	}
>+
> 	if (xe_gt_has_indirect_ring_state(gt))
> 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
>
>@@ -1225,6 +1301,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	if (err)
> 		goto err_lrc_finish;
>
>+	err = setup_indirect_ctx(lrc, hwe);
>+	if (err)
>+		goto err_lrc_finish;
>+
> 	return 0;
>
> err_lrc_finish:
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 2c7c81079801..e9883706e004 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -29,7 +29,8 @@ struct xe_lrc {
> 	struct xe_gt *gt;
>
> 	/** @flags: LRC flags */
>-#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x1
>+#define XE_LRC_FLAG_INDIRECT_CTX		0x1
>+#define XE_LRC_FLAG_INDIRECT_RING_STATE		0x2
> 	u32 flags;
>
> 	/** @refcount: ref count of this lrc */
>-- 
>2.48.0
>
