Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB85C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F9D112C39;
	Mon, 11 Mar 2024 19:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkxW0Ixe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5245112C39
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185355; x=1741721355;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=gqEA83ZtOOxqEONLvEk7CGKvhrmdpjQWtSvD7fl5C9s=;
 b=fkxW0IxeDTFiXlju3Kmk+pwnU06b/aZI5HTfMKnDnT72zZ5ILQk8F0RL
 istT65ziOFBIWHyK0hnZttSTLNrQMYRvkUni7vwmRVbIZSwSO2Q5bjTY+
 o0pljc8Jl+YQKlQR2Nc+3LSmdMM25esGxyB6jixPUS2wLM2iizH6fazkN
 3QAcDnDsuqBiVGFRGNf5PjJSW25qWreeBICzhPiQvXpj6S9i+e/pcaUFb
 Qh2UFRv1a4fSHlARNWHtvC+eZSobZE+zO+Mp5KPoCJedKanPifZKicQ/U
 2Op/XC/lYPTsnhFk+4lVOzM7SbSInA+y+ksu+yCh0BvTy3uwVWONdPFzN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8627914"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8627914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:29:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11346126"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:29:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:29:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7uJgMuzHqOUXVUy41eHIZgyjO0mEnvw+C6LfprH5DytQBZR3kMjzPAsNkc2WeA0meBRe1wYRYJlOmGj3vp2vkKwQ8EaJx8nOBp8CU4kC4gB7uFMLzUGirB+p54utZTKMTKFTnKvV7WKU3yFuWaB/kyQ5XBSpmavkI+VnZWx/Fdp2TXT7FaG9aUEbQw+nOwV/dJPPdCWUMOfYgXwdivMhhZzsd3OauF37DwHbl7go2NjiyqQk5ZSuakrnyeJscW7h3wi3tEExh22oMJmcqK8dbcQvPFxfBVzUDdWQNj9GsFuSGg4saN2u9+fpruBLD2o2d8A25e7HEXL54/0ljeuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EB238jmxX46Y4UddB2n9Ix5zgvjmCsEbNTlpNKAZz1w=;
 b=eJUnD+sOUbIh1004Xy8NGl8w3CXI9e7yvOEfyOYaTRYeZgXOqokKwuJNqUuqej6lgZGzGsg213NYdekeai6SO4T4d2iAsDmDjHOBrx4ho0B7l9d4g606B4thIEHCLDoQJdHquOA7tEOqIx+aN0EhNcpQlEsvz/TqPMTXkaggYJMlj5bqWnTa34Z1AuU69f6se7xb/P0+sLpHN2dPlBujKhstvIarTfqKcMvYL/2Q8Jr4FILlfuw658po6p8bqlM21YvyZUEBvADAhM5R3C4JsXa5J2d/XKSMr3EOq0oaLO4PiYPLA9STnrAwhpZA3sTsAK7bS21WU6SSLXaUhu4scA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.14; Mon, 11 Mar
 2024 19:29:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:29:09 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:29:06 -0400
Resent-Message-ID: <Ze9bgoDvF5QPeYZU@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 02/11] drm/xe: Introduce intel_runtime_pm_get_noresume at
 compat-i915-headers for display
Date: Mon, 11 Mar 2024 15:22:54 -0400
Message-ID: <20240311192303.33961-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:a03:100::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4526:EE_|MN0PR11MB6059:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fea603-2e8f-43ae-ad2d-08dc420185ee
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0423d1-fef7-4a8b-aa2b-08dc4200b072
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:11.1040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSvZiOTsx+cv5KyF0/PbyU7R49sFc+B8ImiA8H41TBZksjXh0VCiifGP74UXaLOFJagV4ajLdRMYluO7txK0nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.1741297
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: kRmbOOz2oEe7PDznb78fTdgI2eSNGHIJ3qy2KcDQldR013q5Hkvjkr5NXo7NhhUlC+YsGj2eFMja7OXrk5LzSdtgNht3Sp53YHgjEYLFmIjrioS1lAIWPfMfNCrXmcJxvZi+9xF+ElknXtzw0p2C84RJtjyHQ6lr4orLFIjr0lp3EIHQgl2HlXV0q/Y108otFvezxtpJo7UhAt4h1CWrwXPjkcNJY2Wjo4+bVEhlOtyu7IzXpLshDIgOGPbI9Rb9MOto3O5ZOa+WEwBW+/ZK/hRu0IX3EqVNvEGfWFl7KsRPii/bdoG696p1cOduv5Q3jKDnqLnDinyBkma9mP80/3PoylD7N3vUislimuK9XDlDe8g3yd9KmSkeUcB6dxLBx5tZtjPPhzTAZ71YWyjNABJei/vl7qiddx9xvV/KS8Mq5HSOZq6Sf9oCeC/6XW4eZEJ3MDHv0+N38JUqRCplaeawL7OlXpm/MKnghIy+SOfne3dWdkKpUp0bvogrh5RYVunfrGLj676Mhekx54Hv2TKms7JhfeGz7KqWA+BE3ic/2MEynHrT9Yghvyz56s3h37ecZCEAuh1N+Nz4qodJ30gzmAHAHg3ycn9NX3Pgd7yrLCUFTokvvhJ4o/x+gjxE5M0NOASdeEukAQXrPqz9KvXMol6VlL1QmaunckgW0LQ=
X-TUID: dUwTZrQwgDju
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1d0423d1-fef7-4a8b-aa2b-08dc4200b072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5bQ9NuuKhLupVSzv5GQ2bDgTowyxe4sM28AO+UzPfyiRfRogxCXWsSEcyO5j?=
 =?us-ascii?Q?saGuz6396jWBV8P1PGX0SfW/sKjxrQEIPkfne9nlmnu2ZX3+De14jj0EM68b?=
 =?us-ascii?Q?uVaNyyTUfrtcdxW0+i1JmwoGHT7FQFR+RunljPgaBQ/ergGx96TEHv336Ljv?=
 =?us-ascii?Q?bucgxE1lD4OQR7cfd1cSeZ4OQLlkDbUs6TuTkAbDJExxuEWQcg9SJEsfVBbD?=
 =?us-ascii?Q?s/3BqNYqhlrq5sATzKuNjcX2bIRvgrlyTe7Z6lLTlODyietA9ma4hCpszj2l?=
 =?us-ascii?Q?L8FJ+zIe1qls681RbYMSkNhBj0mcxqWK95ghqphSL1YG6/iQ5rX8ye5/RcSd?=
 =?us-ascii?Q?a/OgMZHQpXoqn+hauxobwBa9jflD6yQWm7kAr/2Jom37o3dufbqkYroiWRD3?=
 =?us-ascii?Q?2pSfGfeMgMKujYyRJ1jGg4zVkWA+9XmqzVEPZ5N9OuNi2MDU4enTFqvsaquY?=
 =?us-ascii?Q?k9YS8Oo2z4QjNJxqFCtXdpfgPNO1h9cmukRv5McpLLPJpW9rOzQDQMtnf+5U?=
 =?us-ascii?Q?XmCCUb3Gk2qM7zokupxh3PMq52ydnMSdTjWmg/iReVCP6b2fsWgLR4MFymmw?=
 =?us-ascii?Q?m2T5GFaT/6DUI6tue9Sma6+zI3Xf38LF/J8oWZ6xGvKhDuFLMf2u0qFPXGjE?=
 =?us-ascii?Q?7VF0kY8mi2prwFocXBlJ+p0mxmU29fXF4jgLiGCZ7QfvbMvXdhRS1/JRKaKR?=
 =?us-ascii?Q?lqw3aQCpkGYuCfsWadxf9XXkX6P4zVuV/Knkg86YKdHgeviNLZdPHSjEiZkn?=
 =?us-ascii?Q?Se2ApmR3ciNIB3ImzYfdr8/Ye+HXHC/CiYLkIjQmlOlpaZc6mud3Ex1Ts3OW?=
 =?us-ascii?Q?ecrt3DuszcvKNoL3/ytkmsSMWMpZIiNmVyY4K9nuYbZQLyOE81WbgdTILacs?=
 =?us-ascii?Q?feIXJRB+IF4hoHK+ve964FlLEIuF9rPsd6LwPeprXewq4TRiCjZiIKedqXOO?=
 =?us-ascii?Q?txY3ubaFVyzNmf6vdwl0OVJ93mLYjtBeT7PktLw5xheMgg3SzSbMs6eZCJMg?=
 =?us-ascii?Q?MRPRLgaegcfsKREqU5xdt8rTk6UHVd/g+4ISxjUQ77CkHreT319z9QESBTUo?=
 =?us-ascii?Q?j//6e/pXjqVe/MjQWHOGGpMZnbELBun96lldgwdcC8XPlehb3G/5h5zjFalS?=
 =?us-ascii?Q?VOgufYKFNT1xlV8ZxopCLWT+1sJ20CUME65rlUwjO/p6Hfe0HtHM+WlpL4mK?=
 =?us-ascii?Q?6uyB3pEBQy7YyhjgZ3H2jKPuEAjWT+AwR6AjWaKsS5h64Qjmcc+Sg5JlL8Fs?=
 =?us-ascii?Q?OM8187sNKyOEdNg/lwRxYmmueR2x8Dbl5oKZLlls/xxNiMi02h+2s1dDtK/s?=
 =?us-ascii?Q?dsWTD29oGqBVrFgQQeS3oBDcQXU3gkpvofUrvBhCAi3ZZb1Wd/wOp6ECUOSO?=
 =?us-ascii?Q?Iqip6lXJO5DIRGHyLM5pOl+JT1vm4uJgrMP5/+3P/96QNLlHFtxJbXGVsfQ8?=
 =?us-ascii?Q?x95SEF8dNuU7llxOUbpq6NfyhK++NAf8onCa84XK0AYKkTHERf7MaYHZiTLz?=
 =?us-ascii?Q?0lhD775+/qjZgaZ3moFK4PUK2bxYGFWLD2xE2PgrdVxZJljUaeXCc5Hzg8S8?=
 =?us-ascii?Q?iqurt7Ri/XSX4NCz3wxNHevkiFWTkqtvRkn4yGfKxLjiio4fioZb5XCQ/sxB?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fea603-2e8f-43ae-ad2d-08dc420185ee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:29:09.0938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRLTIuMq11CGUaxQ+1FRVcnCu6fizNcbOGXoFjt+MakHvzRSGC3TKrjk7x5hd0bk6KKaT71CRmY168EEuuQ2Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
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

The i915-display will start using the intel_runtime_pm_noresume.
So we need to add the compat header before it.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index fef969112b1d..84fda436faab 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -176,6 +176,13 @@ static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_p
 	return xe_pm_runtime_get_if_in_use(xe);
 }
 
+static inline intel_wakeref_t intel_runtime_pm_get_noresume(struct xe_runtime_pm *pm)
+{
+	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
+	xe_pm_runtime_get_noresume(xe);
+	return true;
+}
+
 static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
-- 
2.44.0

