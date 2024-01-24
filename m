Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4741EC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 04:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE33910E94E;
	Wed, 24 Jan 2024 04:42:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7A610E94E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 04:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706071327; x=1737607327;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=k5gV4kRDtyu7bHdspxIFO51DymhfuUiM4D34A3+gw50=;
 b=HZCCkKUoJ0+8YnmLmEW9GzIqPQaZ94srlXcvZvITEazJExJWz3mKt9hz
 w/evoXnezsHH87sKNMaxN6mHBapqWzKeDeBLUxKpi47wsRsk86R/Oq0Kw
 dsECA1nYQvI1TVwihUExZnyG82/hjc1ykloy3iy9Ep7Lchr967bPGzfTT
 h5jEoYFsgkhnTjLkT5gMxk2U3yelaLkFhoV++oKhtsJGgA9Zewy3hK79+
 gCi6lQVuvrXNhrK8EFG2R9Qo3oPYB0r5aHRZ4hL2215hB3efnXU39dScS
 bs5J1J2qeazNFQt95srQxHNM+azHmNSt0VO28VCSVrEhtYd0tMxc1eNVo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8391565"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8391565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="34648501"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2024 20:42:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 20:42:05 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 20:42:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 20:42:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 20:42:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZ77WAjjiY7wjKy/Mcjy/hY5h6HUJusEiNtq3RbVdcOast5BNKnNbah5RtSas98D7oOf6Uf2El8khf+UxRreKzd5BzaaPDMvbgl5TYcuPqNrN3dmLjWcU4lYGdX5wbNGP2buQUq2ZjtLcSx9V6nv7teT9Avi1R+ABOHXhGqEOxJ9A7HDtnQ0UtaP3d/xUVTydx+0TULTFEDJtw0tgC9m6JPtzX3OVgQoID85x3nvxWIzKNw/XVWAq80j1jcMwOUA9CyOZuIqiakBLDAIvtzJ3QAoIreYaS6zaIjAp8vtZaSN/gZ56Z7yAXaLVMp1y8Ud3qRFvzll1jUzYBpAKc8XrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GGls3igaMyhkL5B4Bz/eezg9TKQPBX5YDuBxQPL/Ig=;
 b=Egv8eZXSMKj3+95BBX1X4Ua0zWSsc+tZzoNFrICB/RZiiV5NvdWDkehq3pVURbn3gU+LUnbPG4OOlhr9iyu92W/emBxV1Fygj+PlkasPywsSCEZBwLNGjEiHNrS7iw5jnDYff49nSdJFsftKCA1kWOW5LFTX7IS0msrV0dmXWdtcMQfQrQT7eigx9v6y59plL0g+coAH8Yt6MHn3WTIRghXsbyI4fH+kL69j5RunRCKPSipA5sdiYjwDOs1B7d2rRGRoISyHU6UFO4WlP+h2y0ojCV3Jbz/+lCXhTtFg62E3XHzqGbY0L+uOH9NtkjtiSEn6srg/olGTWxcE8TAUNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Wed, 24 Jan
 2024 04:41:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 04:41:57 +0000
Date: Tue, 23 Jan 2024 22:41:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Enable WA 14018913170
Message-ID: <2uczindsjgkbzgfvkhgrrkfgc5sle265vgp3gaksro3lyfa4bt@5iyazd2khiit>
References: <20240117055035.2417711-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240117055035.2417711-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb6b192-3b2d-44e6-fa8f-08dc1c96cc27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZVhMNawIruH8gK4ebdhR6ZL4YddwpVTY7yvqFbORshZjy0faHWCe95vbHqKZkhhnKk40NflXFLuE5TlnDdSZHr/jEg3ly8/cuhhRwwF2AFPLbs9gd+4EO4nSthKpbpEm02lmgyMmpT2OuQQqx0kzPJNjXOIbiwe+M4Q8LqOgMP5CP6wcLZGclLWxTRpFKCQ6ACKjoeyVn+1VMoRe1TFa6eBQr+aylGkP39+jaaM5uKa0/x2LQovc8jZ+Ooom/PBoez5U/fg4tL2t1ZPyMHv/0+1K0O0HdXAqQQNI/LpuZUmPQdosAyBK11Im6ZrhQg8HJyuk8eADH+SltAhKZywyO6Y6xLcAyRrXglwkAnPKzcPonl6NpRjo39/5FZjYwyCWe2RFq02Pu/fekBJDEPnLo2RKGKfp6vSl9sUJiXW4kH8uHS7SdaB2ogzfZ56bWW0m31u8atVt1YOoCk/UnnU10YeYNERw79P7FIUyc78aoBFOzY0c7I1quq9Ax5pAxHAFwVzrJ50J2isS58VkGhHvO092SO5HO6eoOApq7dilDcEk4ZAjZ2Lm2Zx0W58nBo/khjzj3Lveev1NuNWBjKcQbZgyEkFteJy0nMlwUzJpe0PWUYTZFVfK6Gjhp8kMerQyft15s7QNThCLv56Y0D+Gswy0m14IEBB/kS6q6FCE2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(136003)(346002)(39860400002)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(6506007)(26005)(9686003)(6512007)(107886003)(83380400001)(86362001)(38100700002)(82960400001)(966005)(6862004)(478600001)(5660300002)(8936002)(2906002)(66946007)(6636002)(41300700001)(33716001)(4326008)(8676002)(6486002)(66556008)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WCbzgPS5xSzO8vG6+OmDUekW89NpNhHARRs8NsbpEz9PCBFD1tqFYXIHVXb+?=
 =?us-ascii?Q?cODPj8DAKkXjZg9d3rkN0qL40btGJeGN+VlH8D2Pel6G27sbEoPEEif77jZq?=
 =?us-ascii?Q?HEJ8o79jgqgLkQ5HJgJukva//4Iq8d45DNnFtzx9Huc2CxGiiZQ8ET0+YFFG?=
 =?us-ascii?Q?WpU3p7wfDkbrilO6eyYU+92EPEUVQuPuEjVscUErRSwJkqC4HOQ5a8UP9XX2?=
 =?us-ascii?Q?C0dbTxK2H5hLlr0LtVVutTatYizG5uZ1eSSDH/z23hUecU8sdvrPM7DylnBC?=
 =?us-ascii?Q?st8uDOafPCrqhp1ogWp8fRJbynOECmQt+2Iz1GlbQTx0ZF+y0IqEaZxgzqDv?=
 =?us-ascii?Q?ZkqodM+H3N6JcE06hS3d66UcTR/INb4hRlVX65HXDSBFRV+C3uvxaUuSI+Xt?=
 =?us-ascii?Q?yRzyRqH2FETGA+wWdkiIg2CwNW5wLhedU4xZAl7qIkR/+ubJjzc4CyBQBbIK?=
 =?us-ascii?Q?w6yjdfvSq2HfXZ1ZwiUA5SRkz6i08ZiK1dkac1oP+5aT+h8gl3Hwx2IsW0O5?=
 =?us-ascii?Q?j2F1H9Le7sMA5IshTj22MvUvr443O/5S/yIhCKPb9X1gWR7C+H3up20sXuzH?=
 =?us-ascii?Q?IHg+y+kSbMQxUeiwapVfyEqaIVWk5S92wLM10FPyS+cVhdBMGL/rMMcAra6T?=
 =?us-ascii?Q?knFeN93xYrQZrcHeByXDwdccBnp5lUuBtnFixA4j0luZYv+0tciqxnbi21TX?=
 =?us-ascii?Q?wJuU3FVa6lnMpeUzGizDJ7/Sx4I1xij6vZFzeANg60WGvguFZIeFs6QX//15?=
 =?us-ascii?Q?8MNnu2Nm5PtvGxYEn++1MubVfMw7xQcOODG2/iGyyLM6KNqIyMyUbGB+Y+cr?=
 =?us-ascii?Q?Tx2iIHE2ncMfRJFOf14J9IcvusUxLEi7XN0dRFUheOJOxs24Do6ThIZeRvBL?=
 =?us-ascii?Q?KNp7MTY6pyRwaEpHn9ghBKyzD+WN5tjkBWjQleLxiCSNfCBHcVJ8S4zyedX9?=
 =?us-ascii?Q?7HK7/qKdPoNLRJbDZ02vOnfTjCSJJ9LkWc+JU3faNxwwCvPdc6dnoyZloZ5C?=
 =?us-ascii?Q?kaDOoXRjJOaEWvHfRZGtLTlsY8cagWuzqCH+pZXR/4RGumg1JcVWzVU9InJ9?=
 =?us-ascii?Q?sNJCU4pgUtcr7CAECIkV6ebIunYZjLBRqMuxAdmmt7vTWA3iSchNVx77xSCL?=
 =?us-ascii?Q?TlIeNIFqMaFTltK10+O9ZAonRLxob9wAwKuUIO5Ynu59jt0M9TEML1O1G8A+?=
 =?us-ascii?Q?Lb7MyJJ3gcvEvAhqzMBX1N65qx5dVfaRgdP2srK10u9D9pP0MEYiVhAQqAa0?=
 =?us-ascii?Q?EFkkUmB22eHdiGegRKh/mylWELh/9iOJx51xnnw2Fn39SHTpsgMmdogu03k7?=
 =?us-ascii?Q?rLE6I+xG1T4tZT3DLwzGOAa24G2JVwcfhrVpSnFM4HpHmvHK1hhEmzt6DjhN?=
 =?us-ascii?Q?msby9JzNmzDkO1XuQuljgC89lDk27wJtOQJlY78HP9v3QTzjT0i6LvFxbxGC?=
 =?us-ascii?Q?03fWHDgWMumfWhyuYyd228WlU6KpEQH1JQlcDFvLd6Jw9aT9ICKUkesroV8x?=
 =?us-ascii?Q?LlXxjR7kwMXQ/2PZSh7Xj7ZJrdojxho7Upp7CeypC1Adsb4wqsuS2h5IslLO?=
 =?us-ascii?Q?s59m81Y0ZP9nbBOr8ZhoDNtya9S5K4tRIcAf09C3omvpPeLw+OkDVNdYASlm?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb6b192-3b2d-44e6-fa8f-08dc1c96cc27
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 04:41:57.7191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4ogzuAP7MfI2D0cZSY/a2mHc4QzAdzbdQ0ktT5RZDhrEHbRD2VFPKL4RjiUQYwP1+uhjE7wAbUE/6EwDXugxcaU3yliBXJHQDGQgZTI0Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 11:20:35AM +0530, Karthik Poosa wrote:
>The GuC handles the WA, the KMD just needs to set the flag to enable
>it on the appropriate platforms.
>
>v2:
>  - Fixed CI checkpatch warning, alignment should match open parenthesis.
>  - Fixed GUC FW version check to use XE_UC_FW_VER_RELEASE which points to
>    current GUC FW version instead of XE_UC_FW_VER_COMPATIBILITY which
>    holds GUC FW I/F version (Badal).
>v3:
>  - Removed extra character in debug print.
>
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c        | 13 +++++++++++++
> drivers/gpu/drm/xe/xe_guc_fwif.h   |  1 +
> drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +++++
> 3 files changed, 19 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 235d27b17ff9..2891b0cc4f7f 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -132,10 +132,15 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
> 	return flags;
> }
>
>+#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>+
> static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> {
> 	struct xe_device *xe = guc_to_xe(guc);
> 	struct xe_gt *gt = guc_to_gt(guc);
>+	struct xe_uc_fw *uc_fw = &guc->fw;
>+	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>+
> 	u32 flags = 0;
>
> 	if (XE_WA(gt, 22012773006))
>@@ -165,6 +170,14 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> 	if (XE_WA(gt, 1509372804))
> 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>
>+	if (XE_WA(gt, 14018913170)) {
>+		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
>+			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>+		else
>+			drm_warn(&xe->drm, "can't apply WA 14018913170, GUC version expected >= 70.7.0, found %u %u %u\n",
>+				 version->major, version->minor, version->patch);

this warning can't be here for 2 reasons:

1) We still publish that the expected version is 70.5.1. This now warns
    for everybody. The minor version will eventually change, see
    https://lore.kernel.org/intel-xe/20240122213708.1841488-1-John.C.Harrison@Intel.com/,
    but the message here shouldn't be added ahead of that patch merging.

2) The mechanism to inform about newer fw versions is not by sprinkling
    warnings in the driver. The fw loader part in xe will already do it in
    the proper way that follows
    https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html

For the meantime, please reduce this to a debug message, not a warning.


Lucas De Marchi


>+	}
>+
> 	return flags;
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
>index 4dd5a88a7826..c281fdbfd2d6 100644
>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>@@ -97,6 +97,7 @@ struct guc_update_exec_queue_policy {
> #define   GUC_WA_POLLCS			BIT(18)
> #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
> #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
>+#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
>
> #define GUC_CTL_FEATURE			2
> #define   GUC_CTL_ENABLE_SLPC		BIT(2)
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index e73b84e01ea1..b138cbd51bdb 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -17,3 +17,8 @@
> 14019821291	MEDIA_VERSION_RANGE(1300, 2000)
> 14015076503	MEDIA_VERSION(1300)
> 16020292621	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>+14018913170	GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)
>+		MEDIA_VERSION(2000), GRAPHICS_STEP(A0, A1)
>+		GRAPHICS_VERSION_RANGE(1270, 1274)
>+		MEDIA_VERSION(1300)
>+		PLATFORM(DG2)
>-- 
>2.25.1
>
