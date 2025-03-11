Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2618C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 20:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFDD10E27A;
	Tue, 11 Mar 2025 20:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCzYdlPB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C5110E27A
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 20:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741726518; x=1773262518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kVdBbmiZ0G9AK3DSKnks1a2Y35hJwPovRkgZTkiv0JU=;
 b=WCzYdlPBmsPgfIMsPDQR7ePRqEPRHCypdWzTmfqcLF5BkYMHGdHMmQOO
 A+xOAZ51xH40JyMIlBXN9ztG1P3jPNLLGIh6dtwewl53vpixGWbJuwY9T
 h9THIJbKw6nivs4UyYAecdx1uN80+mCiYWJJY0ZNLCGGCZK05FGbd9Xq0
 54WW9j8Jn7uX3H680uPbk7mkr83TGFV/sBUJ+1VbSbPmf60ra9+cdiOGp
 6rn3esSlWk4+qyst15ImI4qcdo5X4vvifbDJxTiSpljShQTJX84eubAZk
 duWBLrHEl+fnBYdA+aKMAM0ukDHLUmcDLffUncJ1oCXf52KqiVXazrXDJ Q==;
X-CSE-ConnectionGUID: tkafONMjT/6z+zVEnCE0Sw==
X-CSE-MsgGUID: sM918nH4SnmZUVxyVm7RYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60188457"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="60188457"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 13:55:17 -0700
X-CSE-ConnectionGUID: NpSCCQiNSO6rP+0OZWndTQ==
X-CSE-MsgGUID: d1xzs5L+Rr6sXsX0ed8svw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="125336418"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 13:55:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 13:55:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 13:55:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 13:55:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/SkUYtRL182MF7rmpirKLUOGn/iE2HmHqwAIKEc5+PCb9M+E03RyZF2E9UNhEpzKTtXy03jLJUL6Z2ny+gYLojbNsNus0Il+yVuZPPwniA588gVwtOR8Gt60zuKIg62UAvGQImSP+4Nka4oIvUXxPIn5S7vJ4jRTbQgcFPWcI0+hNgCYLnSwJ5BERJO85cGpvntYUypxJMT5tUNQAjocDufybxcj9qXOp6Vo/3ws7o9yxam2fhtuITxGKxHuOrNOXzHpeRkEAM50ARXmE0DpXpiarRs0+4RDLFcQ9l2mxhvqbrDttypZmQgS8qSFyAQdm8/jGiE5wn12WeVXmrGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxx4TkY7RW90Rdi6O8J4ABe3eJgHdfCi356X6GmIAZU=;
 b=bqyyxluLz12psAcvLeSkgoUV7xcURXMm2uX5P6mcUwEi43hBozwndwo3flWkRhgrDGKiCqERDd5ZHHYAay/xY33rSz6xIXeaP1qJKuh5EqVKisBlbmf8u+Oxxh99uHAaqZ7luGuDCxOlb1XgJvBXJF4kPxG+54KbGpyyo6bnuyAvkCpwZzbEWdKPAWXqOIV9+becTurSYhTIOlH6qDdA8nuB6rJi+S4ps+U/mQmaI/q47Gd0p2t2FBwY/cP5sa0xc6TkM1/99MDq6/N9d7PDMDEE1ltdkLdCY/XO07x12R1q8ze5/x0i9OJpmcCNgLxlmI40YxdBYAAedvRqISOPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7565.namprd11.prod.outlook.com (2603:10b6:806:344::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 20:55:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 20:55:12 +0000
Date: Tue, 11 Mar 2025 15:55:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 8/8] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
Message-ID: <z4oxa2vgrqorbediwjjwvs5nwtjxqwjtbeenmwa3m53mizdrjy@ox4klandkqsl>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-9-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250310200653.89731-9-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:303:6a::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: c9791721-c764-49de-1c70-08dd60df045d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tWfnPkSoZ0jvNODmhFCzYY9UdH8ccGnqGibTPPYUEiOwFslAjbNETSNLsrik?=
 =?us-ascii?Q?+FZtV7Rwt8v3C+V15l96M+mNvp4DSqS8ufwnExxmLY8ARlEFHZFk8nWJXYmN?=
 =?us-ascii?Q?W+BiPeWtpdLrKl5dq+DdlbRo1E5R/l/ddkOYL+Ya1pOgcAIRwKrc/47xqzVL?=
 =?us-ascii?Q?PFrjjg2zllJvGOeHyyomcriKxrUOoTGLxeGPx9ZE9kt3JBsqolcYQKlYToMc?=
 =?us-ascii?Q?ZeNDJPbknC1ipn1sSoZez+CcirRgVo2i9VsOjBQobMi21AyG5h0+awhIvs93?=
 =?us-ascii?Q?zr3JceiT3LAltnyIuCJ5Esr9bbvuYYk9RqXS1FeYhnhX9NR9H/+plqZCUur/?=
 =?us-ascii?Q?patgMGsNco0EwEPAMbqLIRiSsGcfJq/hYKfGy3cZBd5Y6CV3nsCYvEc4ydfT?=
 =?us-ascii?Q?9glyXnRs30cePd3dJNglIlV8Qg3Nd027jQMDwM7Ol/e7qKCbIq0yteo8Ad3n?=
 =?us-ascii?Q?4wclYd4/nd/oI6SQQZ5SV8lRlSbF/RGqvoQpaLZ2W21AryYiMdvHLIwk6Vj+?=
 =?us-ascii?Q?baW5zkibU+0VmwSclx8Fq/+Nr4a8NcNQWfkQn9RAGPjDiEG98+KjcbhbiI0i?=
 =?us-ascii?Q?klQrqgY8TXOa1wfWCcmhGcHDbUcGx7zQ3vOsTwk2CD38jaoT7qKm+ceY1lhq?=
 =?us-ascii?Q?uGKaczpuZlz7KtaJ76w6dySF4d93a5pF0zhTsQv8NMUKUoMSJTrcbZE+Xqr0?=
 =?us-ascii?Q?RJ9HYwoLqGx6QfG2ujW8EH5mwnapdrejQZhy+LFXW5H0cKLL8CKZiSSKYYgs?=
 =?us-ascii?Q?xFUxMntxONXYNShe2COUpKo4W3dOSdlKP17byAhYHEo2wICw7J5CcuwimztV?=
 =?us-ascii?Q?AiFT0+DcfveOUNelsjvPMwg4roNJG8NeCHIffCzUZ5TqT0I0mIbDLtDg6cdq?=
 =?us-ascii?Q?z7M5Mwn1DssdWriZDVU+bCvzjkBFgFrb2LJjxnumZ3GkPgZM+GllzBK5fMqU?=
 =?us-ascii?Q?sNAjcnXy2eFI3gKFxyO+Yh5e4sPAyBNSf9+8StmQWreQjjj1ShB0pMfIvQFN?=
 =?us-ascii?Q?koT7d2NMmJJ29n67rquR0T8ktvEpma0VGIfB+Mt99REETssfJ+r7/dYWn5YQ?=
 =?us-ascii?Q?MYDNyFSI2e/HFLnRIjaBQNADUFfLG1XF2yaUMRAKO21RPmTBGIxvrWn27Mta?=
 =?us-ascii?Q?xy1JP4m+neQk8y8/LLmu3K6jy5D7GfGTasjYO5J7H6iPf+DJHSMdfTllCXdt?=
 =?us-ascii?Q?Pd+cCDEsUtw5+bjjYlLq5cZvzUpY/DeG0ebUTXKfFn4ln7lj8abkjaQoY8p/?=
 =?us-ascii?Q?UcDcOysJLr1gxF0a7BH1Ier81QLZjownNew6ikPqIOXdRVCGYSebUTB1UKcD?=
 =?us-ascii?Q?PPWwqeTbruvuB3jh2rLB/acD7hMDo0vc0FMTrUsuc2McVZ3Sd9WpT9BVxYtK?=
 =?us-ascii?Q?XEDFI+w/ra05irMEpltboWf7+pG6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aFL0RgHpZkyqFhn/KIPymamy1Z8VASXYRx6SkMoooBTw/fQMUrJ86aoceBfV?=
 =?us-ascii?Q?87+fnE56/agAl4Cytpne2pfF9VQWUlcasWmndUZoT/BvciQT1VzLUT0UTpZd?=
 =?us-ascii?Q?mQO0/2CItJYVCr+bIra1An/wxVSS5TrhQs9u4nlz9FpscVY+g3dW8UHT55DA?=
 =?us-ascii?Q?QxDEOcKX5rvhi6qw9WrJSEWtKoY3euec9zfC8M05ex0q0hJowPUOaXR4WExm?=
 =?us-ascii?Q?ZYjSUE5vbsiTZX1NEQoO+AKZ2nU/5QmRs5MQkweY3px4Sx3SK70640Fm/mxp?=
 =?us-ascii?Q?I1lvcXFyw+n6kbSWF6gED5AfSRqvA07GF22TU83W/bQ441ntBg01cVgqX7Al?=
 =?us-ascii?Q?iK9YuGy6jq5T0q+1l8J16xMQ/zZKyZDcy2whYiCVTJNyxEEeUlnZ0zsk1hNT?=
 =?us-ascii?Q?sU4fkfp7cMFa9ouonjZMlAhm+lGFRbakD4/GKEbWbJii4ssTnv999mc5DV9f?=
 =?us-ascii?Q?SIqQtF+i2f9/s9WMFGYqkkGQrThwJXgtSY31a2l+/pX5lDpw/2qjMSvqNLCv?=
 =?us-ascii?Q?/CL12zHnpA6wUW1jmwOyy5xXFXG9ropB3z/Eu0NJRCuWldzGnerh/D2Oscmn?=
 =?us-ascii?Q?kIb8u+sVOMS0jMYV+qqY3qnKBakHJY4p+exfGztGRXynUqo9LMxjiSeXe+4U?=
 =?us-ascii?Q?71rOQl/e6uDBhBeaFhQyCNgWMvcneKOfJQGbISwbjimkRe31SYyPUMKQry4E?=
 =?us-ascii?Q?n3MtbzXejPVBm8aw+46DEYWOInoz6t0A8ZnS61yf1jrRotm+IAnupkuC+8VY?=
 =?us-ascii?Q?uBz9nyrM/ZgNYEJ0ZDv73DzC5Azn5x9FFLFXSnyb4sog5mSeeTH3WB9tbzBk?=
 =?us-ascii?Q?O1IUeJWG9BSuniFdGh/DALy4jVin0us2JBiRtyng6wHzp7iq7NK/rbMqofEu?=
 =?us-ascii?Q?gNx+sIeF9SecvVm+5jmKFt5iXO7lg37xY1i2oc4vyq1AgCZ1PBVEbjJYTV8m?=
 =?us-ascii?Q?t04HlTRGMFk1u1Msbqujrp2cMUiwekzbh+R6aH6sgDiQ0EnQQYufaREOUwAN?=
 =?us-ascii?Q?IaaR8fRxTHSuPPQ+T/u7QivbZTidLauN8524SAcr+hB6H+VmJUBcYAtJbpJb?=
 =?us-ascii?Q?47hcRrhx/ImkNB/rMlNzbMlbhRBE/jq0uvI/PcLWsSm1tfSTu98n/6ee0LdZ?=
 =?us-ascii?Q?yecXq4POuAqLdABbpQrdrYxXKmKz7YlPkSP1KR6CsNgHqHRbQHgQHuQn2tRH?=
 =?us-ascii?Q?U5k62BPzD7k8Tj+8vl1CtpUOGUXGm6c8Nqs+LwZrdd3LN3OVQvONE7YnTN3C?=
 =?us-ascii?Q?p3m/PW9dqj2C8cXUhPZEIMNSJsMIeDXaL9nhneT6YtRIo0qPpx6ZWVCCh+9d?=
 =?us-ascii?Q?K+SAP7YMqY+AfiqoC/rSmtSmHefcG2OK0FNO8vR2XoEHup1+++AhsVzVfYbz?=
 =?us-ascii?Q?lAiKT04YfHuSJQo6X9OH++MV1tjt3Do7C0AoYtWct8pcfyWwWeICESDbhgpN?=
 =?us-ascii?Q?8M5nU2iPXaYGZ2voR/ri0BTNt7yXhXz+cdiiJRme0d7XZRcnQ68lAmF5FLIR?=
 =?us-ascii?Q?x8djlEOa39q/zf4OUN/nzwC6CQpP4Q2DFrgHmCL6V4MspYZOvo5dK/9iH1zP?=
 =?us-ascii?Q?J6gC1OHbVjcBotnBrPW1lOEJfRtyA1cvpKC9MrgEfeBmC2KtTUYIPdCxcgae?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9791721-c764-49de-1c70-08dd60df045d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 20:55:12.5037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtMIKfWFnRAcc/oFHnhLXG0Yq8iUGjghwnRQHk+XTJZ5OrI7z69kHJ+bx1yX//GmyYT4coygYNp9o/PS44b9B0iQXb9jYV3rV2pZDaTDD78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7565
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

On Mon, Mar 10, 2025 at 09:06:53PM +0100, Maarten Lankhorst wrote:
> static void xe_gt_fini(void *arg)
>@@ -471,6 +451,18 @@ int xe_gt_init(struct xe_gt *gt)
> 	if (!fw_ref)
> 		return -ETIMEDOUT;
>
>+	err = xe_uc_init(&gt->uc);
>+	if (err)
>+		goto err_force_wake;
>+
>+	err = xe_uc_init_hwconfig(&gt->uc);
>+	if (err)
>+		goto err_force_wake;

humn... why are these 2 variants not merged together then?

at the end of this series I don't know what to expect. Is everything
here sufficient or is this part of what we need?

Lucas De Marchi
