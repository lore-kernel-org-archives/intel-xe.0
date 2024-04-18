Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE27BC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 15:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F9A113D3F;
	Thu, 18 Apr 2024 15:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7az3lIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4686C113D3F
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713452502; x=1744988502;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j/svJ3LP2jMTnHQbTNvFnasAocwNRaXgT1SA82nxcyM=;
 b=Q7az3lIgx+iDi158Ut1fH4KFwNuy7QdSSjMbDK1J5QzbFeEW7aim3PDm
 SgdRjfeqJHjbYtTFjJJlN032pxY5uAXh5BCgnUGQw6F5ptOwc8SVYUZpC
 z9Ur5OBGx37aFVIQxX7cm1iKUvDdJrfVNasWJVFgjkTi7aqbNN1OJsGpx
 Mp3Q4nL8fHGjbcTOCmNQH0BJnikYfEl54y9ogHzdUHv4Ad7skLSLVz8Fv
 DsJ4plXhEf949aliOKxZ9eL9OMk3mVPAwaQHVxo5Js+LZ1DyVIpevacsk
 CvhPePl4HCc9vJvs+aNKkPvnt2XkN/qWVHX6azgVp/rZzp4COw1GO+UdQ Q==;
X-CSE-ConnectionGUID: FcdU8hIQSlW++AwaUYtySA==
X-CSE-MsgGUID: lLfwzHWISH6jSw6R7H1zNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12793040"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="12793040"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:01:41 -0700
X-CSE-ConnectionGUID: Hf+mN6KUQeWpKKC0gDvMsw==
X-CSE-MsgGUID: XId1YS5ISY6jWK0nTLKgsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="22990827"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 08:01:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 08:01:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 08:01:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 08:01:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0tFYELnSnHEeNwNGGEjWpkyVVrGmMpa/p5ey7bT+BTv2PSumD9HcNbxz9/CEnj7vsujPaULdOkJdYnhCcNdjWMAsyqheN8EqeDd5ZeIs10hnF/nktE3lp+z/KENVmYhsDDQk26L/byLfgY+0VovhkI/tMSdtC+zC0RKa3TG+VYAr70RTdRrbM7g/1G8eu7TGwJALitJWWa9mY99MqT/XCxfRa5u+FTp5n1ALq2ihxv9FbT/86nY+0fhkDTDvmssNtTACVZChBY2UAdu4XlK9zo4tV46HfveVZSxgA4HNT6zAmBeXNt+9fkrzQwFktRnyhow0E7QZm7mBfqnr3b/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50FxtUoZq/4aY4ULGeSpoCcbLwC+fKkbahswfnfKvrA=;
 b=b5v5jkB4FRC06QfENkj6Yw3bgcw9KxJYAjBsKHH6wo9BYSllPGg5NBqJxLVVUqA3Ee5vK4uCFzsMW83j0SndjguDCAehQLb0tWlcF0PYR8E1wF1LCmQCdYw5TAZxISkeSocP1zFA4PRu8PTOZL7HJI0W6Wpsu2pM54yyQfbTGAznA0dZmXY64nxy5b8O6SrfAMfZTiz+qvAYl2OHi8MyvaMK7+Uu0peqq8dODd7Kmxf3Riyb7a7v11EnD41VCrl6OI/1rS/x5Li2AjCAqrQ/OOmjiP16yPmXoF0wMe/d2sgOzhoz5rKu0N4fx3H04rMYUpOE7j9opQF+e5DH0hYjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28; Thu, 18 Apr
 2024 15:00:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 15:00:22 +0000
Date: Thu, 18 Apr 2024 10:00:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 7/7] drm/xe/pm: Capture errors and handle them
Message-ID: <heu2iep5obhbjvcnokwwgmejre3b4ox7u57sueesloycpfrq24@ywmvzvuycsdk>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
 <20240412181211.1155732-8-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240412181211.1155732-8-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR11CA0090.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 5720fceb-845e-452b-6290-08dc5fb845a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: grQ3fcOR+k8Y6KQmif7k+unqQqUX0izWOipRmOXFgg0GJRwiWVXZKXAyDBI3cY6N18mX7f7n4fHIr9YYtbHtnV8/2UdkiyBMCxrKOp/CxX0XSXh8CCBOGVPi6VJ+6+nAAUmXW8lmSrrb6yBheSNNHOKVB0WclkFq61SBGivaBmG9X8cZad8ridjvfIduy8LY/BilEwkYVgwNlOFTBe/lKJOPY9Qe3emGZvuVz5/YzOAv+VAHMYBqHKrx8QN9+12DuA2CIZBXsiCkdlruicJCHM8bWbTDMGtzJhSmyvomeFwLvxVP7kkD3DP86AMwvnO2buiJgQEnGO8D0aCySHUKsI6U3cZ4OxJDx1E98ofWpaDzdba+vpHoOrhHhgQsZoPJdHl1VTM1jIki2vt1mhd2vvc0lMJBN1Mm/sTqs81LGF+82sS0SSGOS2C58QvtZYhyK5Wz5aRxw0B0fOXuduADrKXbZ9wzmtAOQ7PsDQrsNjH+HgmjAvahJX3XBdEenit5RiNq76e6tHc08ZX/sVtzIJTfubQPP8W5u5eRB8bK8v2TLC3d+rqKFfqBqWO4M6oKsj9dE1697YGOkv6jv9u4VAVF9G4EgQJT2Ky9tqeCTky6zDYSCmLqJkUwtwdywYS37n6NsrYruHhYaYrJb02yMWZchWl2cbY00aDm4qEbxmdP0eGD7bqutnX606DImuUof58z6CvmUcS7yoEf0toCTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U6AHfo7CGrYwB73/qw+CnFNKt1c908M7l9xABoj/e3EDSyMca/FE3cP5Jg/N?=
 =?us-ascii?Q?3C0DDue11M++rSUJNfHOuz16etj8+hJeM5QgDQIpOgapwsC0j2RB1SKuEKMf?=
 =?us-ascii?Q?Gckz7ThttQCD4Pq0aUY4wKmF1jBOPrgLfQLFcSyBqWoppQXNJOjY9AB4aZCy?=
 =?us-ascii?Q?TAQDsbbWfXZl8czDR3ANKYFwEoQipVttWn47wHfUhbZKqwYZXvVNU6C5fzij?=
 =?us-ascii?Q?rGuWHkPYHTwsEkTbLBQ+vKoYQuH3AZ97nf7zktW8Mg1BZ/mPvhzhbljNWQjY?=
 =?us-ascii?Q?c8bKirpH46oID6omThte5SSQPtkruZLI1KTZDTDFpwrPSYIXLYnZKHu+OZS+?=
 =?us-ascii?Q?B7MaSiJPbEpV+3P2ra0OMhbGd3i2aIq5IqqYkaiYvNmDadkU3XITiThQnIPU?=
 =?us-ascii?Q?vTjqAGfJJkmQmrNkv5HUmsJp4eZpxjLeN/9FxXkN2GINha5dtIqNNkmGxf8Y?=
 =?us-ascii?Q?OD/v2SV3lDB1Y24m8v5PkZqEeYwiHiNX64LQlzMb8jjiQcyttsR1fhK3rj9E?=
 =?us-ascii?Q?WbzBMrwSV5S7Vk9i9bx6LzyvMS5MpBcFikchqFg2qwymP6pCLhTlHOHrbYzD?=
 =?us-ascii?Q?aqII2dxgzc9KPkbhcnQHycgc//zC/MkOo7YzxjDGrEqxpjNphNdi2ooe0+s3?=
 =?us-ascii?Q?7W2QghFSXkQRSAqVM091UMF4bdzncWk2x2VFkmICJ/cv/S7sM3bN9g/Ig9aq?=
 =?us-ascii?Q?EDQCPhb/dWngswWJ1Ag2U4KRyfSOSqBHOgQnHy8O9Ccmc6sa/lurd0KzrYbi?=
 =?us-ascii?Q?lZmeRQgjDxQ7A0ijaTt/joUlOL4iacFEzIA1+wZhFjRR6pk/5VpsUXf+r/Bl?=
 =?us-ascii?Q?EcwFBwnTj3ZqWlfyvNGg0W5970nyU0Gm3h9ccBWCCGfKMsfnaoURa4rrqykC?=
 =?us-ascii?Q?2Q+wx8E3Z72ahPExsHv0cwwFKcQNgufeawAI86apRxpddlL+P9TK+kP1BUmt?=
 =?us-ascii?Q?1v6fl/3kDh8MkceVPTwefgszVZCeBhAcsrC3zFXTete6uInFMXbpO+DwbJ61?=
 =?us-ascii?Q?0q2Ihyl63qXO3MpwIZuH1O3gA0HzcQqbZEj48hS+mjmqWPz524wCNe9eykpk?=
 =?us-ascii?Q?kwuRuvehXhAd80WSDdB5G02/gYq4OpHppXzcZnPLql57lMfWq5p0O3+dmIWO?=
 =?us-ascii?Q?T1K0U7o1sw/Qoavf8GEEq2nCHeLGBA/CDzdF5vf5Hjs/5tWummauDpJyV7ps?=
 =?us-ascii?Q?3AnXb6u9YXSeU/EkcOGylkPQcb6uffB7RCHbNGrNXh+LsIlyvpp/Lg9HBYNG?=
 =?us-ascii?Q?sd6kLxI24mSgOkHnz+CDa1+diTxiLm4FGuAzahkaV8zobRFKfBwQxbL2ylSm?=
 =?us-ascii?Q?TXs6Yg4+Cmtuyn11F26bCEIup6++CbwQka9vR0xP+usKcDnfF3nFpkA/qHDw?=
 =?us-ascii?Q?Vd0uXox878tBe6v1AYQSW082suqvaKNveTNitwk/YDjC6bWZVWfSB7nY/9x6?=
 =?us-ascii?Q?8Itf5LVAQzBA98ApqP2iS5Gt3udFZZBbv8CqY/XTqulh/QMAp17MEVWiMjbM?=
 =?us-ascii?Q?MekBiO72GARUMH/l1mCbl44S0f/ivNdC7WOyOsl4j+UFy8fCwcVVSOaZt5Pr?=
 =?us-ascii?Q?BbsprXzlMPKA/RBMP8J8C/FoGTE2pAQ30DM5QEZm4f/ljLjCDjdMJLO98y3q?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5720fceb-845e-452b-6290-08dc5fb845a1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 15:00:22.8347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJ1Qxos/J1fwFuVYNpRfZXvxlIdp4Bgz1BN4jJtF3fkA6FftKQfUAbEs7Jhy6/4hiXeD3/P1UJNcFKqF+2tpauWjE2qpf3RETkOtlhl6VQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
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

On Fri, Apr 12, 2024 at 11:42:11PM GMT, Himal Prasad Ghimiray wrote:
>xe_pm_init may encounter failures for various reasons, such as a failure
>in initializing drmm_mutex, or when dealing with a d3cold-capable device
>for vram_threshold sysfs creation and setting default threshold.
>Presently, all these potential failures are disregarded.
>
>Move d3cold.lock initialization to xe_pm_init_early and cause driver
>abort if mutex initialization has failed.
>
>For xe_pm_init failures cleanup the driver and return error code
>
>-v2
>Make mutex init cleaner (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_device_sysfs.c | 12 ++++------
> drivers/gpu/drm/xe/xe_device_sysfs.h |  2 +-
> drivers/gpu/drm/xe/xe_pci.c          | 12 ++++++++--
> drivers/gpu/drm/xe/xe_pm.c           | 36 +++++++++++++++++++++-------
> drivers/gpu/drm/xe/xe_pm.h           |  4 ++--
> 5 files changed, 45 insertions(+), 21 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>index e47c8ad1bb17..21677b8cd977 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>@@ -76,18 +76,14 @@ static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
> 	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> }
>
>-void xe_device_sysfs_init(struct xe_device *xe)
>+int xe_device_sysfs_init(struct xe_device *xe)
> {
> 	struct device *dev = xe->drm.dev;
> 	int ret;
>
> 	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
>-	if (ret) {
>-		drm_warn(&xe->drm, "Failed to create sysfs file\n");
>-		return;
>-	}
>-
>-	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> 	if (ret)
>-		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
>+		return ret;
>+
>+	return drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
> }
>diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
>index 38b240684bee..f9e83d8bd2c7 100644
>--- a/drivers/gpu/drm/xe/xe_device_sysfs.h
>+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
>@@ -8,6 +8,6 @@
>
> struct xe_device;
>
>-void xe_device_sysfs_init(struct xe_device *xe);
>+int xe_device_sysfs_init(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index fa2cc80a08a3..65ea44672cab 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -781,18 +781,26 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 		str_yes_no(xe_device_has_sriov(xe)),
> 		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>
>-	xe_pm_init_early(xe);
>+	err = xe_pm_init_early(xe);
>+	if (err)
>+		return err;
>
> 	err = xe_device_probe(xe);
> 	if (err)
> 		return err;
>
>-	xe_pm_init(xe);
>+	err = xe_pm_init(xe);
>+	if (err)
>+		goto err_driver_cleanup;
>
> 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> 		str_yes_no(xe->d3cold.capable));
>
> 	return 0;
>+
>+err_driver_cleanup:
>+	xe_pci_remove(pdev);
>+	return err;
> }
>
> static void xe_pci_shutdown(struct pci_dev *pdev)
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index f1fc83845c01..a9decdf266a8 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -208,10 +208,21 @@ static void xe_pm_runtime_init(struct xe_device *xe)
> 	pm_runtime_put(dev);
> }
>
>-void xe_pm_init_early(struct xe_device *xe)
>+int xe_pm_init_early(struct xe_device *xe)
> {
>+	int err;
>+
> 	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>-	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>+
>+	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>+	if (err)
>+		return err;
>+
>+	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>+	if (err)
>+		return err;
>+
>+	return 0;
> }
>
> /**
>@@ -219,23 +230,32 @@ void xe_pm_init_early(struct xe_device *xe)
>  * @xe: xe device instance
>  *
>  * This component is responsible for System and Device sleep states.
>+ *
>+ * Returns 0 for success, negative error code otherwise.
>  */
>-void xe_pm_init(struct xe_device *xe)
>+int xe_pm_init(struct xe_device *xe)
> {
>+	int err;
>+
> 	/* For now suspend/resume is only allowed with GuC */
> 	if (!xe_device_uc_enabled(xe))
>-		return;
>-
>-	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>+		return 0;
>
> 	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
>
> 	if (xe->d3cold.capable) {
>-		xe_device_sysfs_init(xe);
>-		xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>+		err = xe_device_sysfs_init(xe);
>+		if (err)
>+			return err;
>+
>+		err = xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
>+		if (err)
>+			return err;
> 	}
>
> 	xe_pm_runtime_init(xe);
>+
>+	return 0;
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>index 0cb38ca244fe..2cefe8624474 100644
>--- a/drivers/gpu/drm/xe/xe_pm.h
>+++ b/drivers/gpu/drm/xe/xe_pm.h
>@@ -20,8 +20,8 @@ struct xe_device;
> int xe_pm_suspend(struct xe_device *xe);
> int xe_pm_resume(struct xe_device *xe);
>
>-void xe_pm_init_early(struct xe_device *xe);
>-void xe_pm_init(struct xe_device *xe);
>+int xe_pm_init_early(struct xe_device *xe);
>+int xe_pm_init(struct xe_device *xe);
> void xe_pm_runtime_fini(struct xe_device *xe);
> bool xe_pm_runtime_suspended(struct xe_device *xe);
> int xe_pm_runtime_suspend(struct xe_device *xe);
>-- 
>2.25.1
>
