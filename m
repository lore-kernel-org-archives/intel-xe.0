Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E86CC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 19:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DFB10FFB2;
	Tue,  2 Apr 2024 19:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KI7IvDCs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D7810FFB2
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712085518; x=1743621518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QlEIGzbqsjBgjcQSNNkSloY1uLzxVBWxZHr61EUVHss=;
 b=KI7IvDCsqaFPsSqGumDgcUzXFtksB+TLB3jutBTg9bkKsE1SU7PwpIs9
 Pdyk3t/XT6mpE+Nr0mjI9yI+IV9NJ/3+gL6cwDNEqomzLdy3lIsgVImnw
 A3URi0A0CH+U/zzpzMgZv5WH0aumMAaUHUnV9nS8QyuyxsFN1Bk8uzqqL
 Ai5oCao8u275BzorDEGZGZ+9zn2iAxJ1PLlPkNM7hICFJXiPMM4NhAfmJ
 lVQABENGxffwJKSwKKl9oDAqa26ACy1nIoFZwT8iC35IPf2dH+d3clx8I
 xCMQYnhC+ihCvQTBx0sOi1gSDEzG4Kv3jNbYDb/l+cZ6IWQRx2zU6IhjU w==;
X-CSE-ConnectionGUID: QnhwdcthRvSVTdVacwT5gA==
X-CSE-MsgGUID: dr5diO2ORk6GJJqkS0w5Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="11058739"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="11058739"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 12:18:28 -0700
X-CSE-ConnectionGUID: CS8xegsZSYieb/GQpq8yKg==
X-CSE-MsgGUID: EWrrk2vbRkm5QO82BK4o0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="55629500"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 12:18:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:18:27 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:18:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 12:18:27 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 12:18:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/yjsEe74UDx48yxVUbr7K+CyXHocEBubvsdThGzYETdrC5MJkmifkyniffBXLafLeDsY2u49fStuxVbVFF3oVqdeCo6phzMyUT9/ok8bFE7n8wyJiExglb+HbXQNZ9z3avouwK7ffADpyF+IE1FaxYTZ3ORiC8fPEcA2Y1RNbCQPIUeYf8/gS/+sGBRG8j7qSNnjIFLnvaovmdxVyfi+0Dmia/lhBUOS/IDXUPIw2HZEaqvoZRQ63TBRMUzGgeaaENGH0AhFQZXEGcwYKfNzeqfRKN6/pzM7pyiI+f8BvsMA4CLDzlXBdf8Dn00GhO2aAwRbY4wygMuBv5SpHjOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZBmk9aOgXbZFJM7Rb/poVPwWC+tN2ZVveM/ZA/S7dg=;
 b=SUApgOOs8sYLLJW7B9gVSQSNG3OQHKKLNubrKL+VccujvYOud4E8xKrmJGTdubwbWfsQsaMJKiSl9BGIuoCUfzMRy/ILkkfiGk6dOYKFEZTJh0ncDNT+WSb6LU3KHuoZJTG74PsXgbJ5TiDC0adKW5ZJ6zs8LIJZu31BqvKbXZrazAwzbOHrRhaAZDNo61XXcWG0eoQ3tWhpDNQPLuKq2Gr8x8MQFbEiZ2da7Pl8h844y/bcffnfO3ODhhJsJLkDjtV4ci7qGCP5SzF+8/SROWJzvNGyQBjUC+OsalRebBK+7nZA0l4g5EYEBetvZoGHaAOy76ecOyZXaMZKXLvTxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7299.namprd11.prod.outlook.com (2603:10b6:610:14b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 19:18:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 19:18:24 +0000
Date: Tue, 2 Apr 2024 14:18:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/hwmon: Update xe hwmon with couple of fixes
Message-ID: <palg6mncpsbmsi2qt6ycrblfi5bd5v7keoc7boz4snx2o252fj@wpg6hthzgccz>
References: <20240402180956.508398-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402180956.508398-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7299:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 38XQ3K08w2GE7diCYEKXqzlI1gHVBw9XEDBptqafPIXYdoXNJplOCmzk06jXnISL3q+mQR5vvq+424Op5ZMNeYT8njT41aML+u1eY0tndevYVXxNm4E2XFOt1ZzLBYGQTOXbaJEJnEUiNbl1qj7Am5dJ+n23hAR+45U0St0P+YVWitEw6bQz3tifwsorWlGu78TpIx9VQVFynXkicOf0M5INslkqquz8A7rlcMu7fPAOvXz3zGWZmvR0uqlPJgZkzrtUaLk8OHFZ8wv8xzpjltkG3VrlAf4ntH7mJcFX33kr52REbXP+1idbgF30cDTmi1TRqiKUHmoEtclgbD6pWdtIoVsduHD5yRNJAqsDfp7appAyEjp4eB5xDudIqYcXa49FJuPw6QbQQDpMwcXsn3tsL1Ne6MXo48v/+j2MKg42tPTfZSlsVUncTO8r6fKfWQdurSGUoVPKVD5zZFTsa0rqIjp2pkvq1GjssMa7s79Ztf9vVTy5aka2/GMeK9Gs8AwOgO3xPcfg2agGEJAd/ddJFywja2AXOXcHWx39LxQVSrvQOLdKDuDZ1IMQ4JyYRzushBjMIz/8MhjbRGej53/I7xymDCRXdJ9MkT6eBjz60/OeysuNG0r16vhwAM+0o+xYY4wjNR0JlV5SE9BORls6ueCgrHT5h7HIQiXY7h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a0L8YTtwRUpY87v49HdI6LQIhAs0Q6Lc9eWIc2HkwE53owOMre4JpjGdQxQ6?=
 =?us-ascii?Q?my6bIZT7UJg8djCndPZsiB8USVGeQlGMAw7O+1qJrJ+6ZuujYuA0HH4Mk0zt?=
 =?us-ascii?Q?OAyGsae+GjnHb440IxOpSK/OJhBkFkKaH5yOVsabDvHI5oM0VLaLcJhssHne?=
 =?us-ascii?Q?p3JL7Byu+CenbibYFJHCV3GL+SVYRrw1O1FXLxUDfQLc3TuqlYM892CD0vut?=
 =?us-ascii?Q?a0/IsgzqtwMwdUCH2mNiwXx1y3fG4Tk2tpdGC3traEY7Mnlo7NOepsLEk/+B?=
 =?us-ascii?Q?QAN3lsNB0GLGMEL7lbNVS6ar+It2F6b+cPSxGQz5SwDMklTesX+bWZPNk7OV?=
 =?us-ascii?Q?plWayoOmR0gfANIgMBcH0EudEiCF1l99zEXZ8RWZHiV897QsnxPJypwe1P16?=
 =?us-ascii?Q?RpS8H+pA78mWZnKeNDXXl+zxyuon3/RVj69vy84eddHFAgtw6bTSHOmk6Ss/?=
 =?us-ascii?Q?//g8f+qDoMZS9jxY5pEYkeBIg9gZaDYMZUsZUbm3u7GoPP8M982qb9wG2PpE?=
 =?us-ascii?Q?spU1EpXD+fk38ohZVEWWmMioO4mUfEonjNITrhFwoAunYia8MWX7JkNIYQ4L?=
 =?us-ascii?Q?1Vzor3Q74UDrKHZDOj6Q7zZp5Z0+fq0MW/uof3ToHt2/pX1SnGiPx+B1V+l5?=
 =?us-ascii?Q?0rfVpysmZ6GJlUCdcKbzmORlJrIq+3ycduNtg6kYMtjoD0XhOWjd659sDb6r?=
 =?us-ascii?Q?9m70qGiLWP4fomXDR49HEli37maIcY09X+T8ySwL4s7b6YA6/oAmG5v55Q53?=
 =?us-ascii?Q?KiJzFSEFvqxYzNY4dS0Enn+m5/fGDWYywuzcdRCUDmTckAmH1+ZL0rM/LSi+?=
 =?us-ascii?Q?vRHWHtPVB6kzVUgUbWKHcRSfvIxb5xe9ILbnaY/16eP2B3qM5QNTzrRIT7y7?=
 =?us-ascii?Q?k59NGYcka/ppHnwR9NyedUpiFZ21cYA9073cAXP1H03ApmQMbtpqaj57ckAi?=
 =?us-ascii?Q?W6sabH9BFHPIdw0fHVW/ld0FfMqREhQzIin22D5Pe61eseV6Xhgn3O4Ko5V0?=
 =?us-ascii?Q?Rl7kBjTE+oW/6OoHfnLQd6PYyM1E+OUR7CMLJ5IWxwHTlMok4uVKno+6eiLm?=
 =?us-ascii?Q?4NZvtpu4iZUkhrvGh7yYJNl/BRGTrR1TtBL9aR1dizUAx845amJLJ/Nt+1SO?=
 =?us-ascii?Q?Kp1dc51yRq82zAlAnVndNM1aH+NdpJAKzqRWhDXi4tjm406cmVJwJOBgMs/x?=
 =?us-ascii?Q?0CwfR1QviHE6+litwiLhbJe+1g2tQhohaFJ8OJYriD8HfrdlaemsLpDybcva?=
 =?us-ascii?Q?zqkcgfAvWCQchcxH/DwWovGpKcgGaSTOnulqKm5gSBtBt5gf6Fg8pb4G1PO6?=
 =?us-ascii?Q?nzzP7GEhfiDwXP3GuvHF3bN8W4aYewYIFm7gYd+HXD/YUgxCaLkLzY/TDUHd?=
 =?us-ascii?Q?MmMF0IYVPc3C0bgo/+yKLxP4VYytE3w6sIs4PFAOglIbwV+wc2hegWGd2KUo?=
 =?us-ascii?Q?Jr9yX94Lvm4Z1z8CfWzNBqVh+YRo9awYahhSD05P+G95sGDRAdw73zHUouGl?=
 =?us-ascii?Q?mfEFxNZzF1eflPA38Zy92pGbegLZVBuS1ET4ZYSwc3t/jzwsodsxOAEo7q3U?=
 =?us-ascii?Q?AkKGckx8jsBr2+CMLjAade3gIao90sDsCW7jyVpygH9HH0YyinVUVdYFprIR?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 351c7643-c28d-4143-6019-08dc5349ab05
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 19:18:24.8416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKtF8Xe/ehTw9prKf1tRkmEOoPoCzVGDtjgqGZnDLJhUyUOPXTO5mCxlxuysEe4mcvjk7n8+SfhtVWUiPMK1lJ0eVKt8DvrKdtQxR6epLSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7299
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

On Tue, Apr 02, 2024 at 11:39:56PM +0530, Karthik Poosa wrote:
>Address potential overflows in result of multiplication of two lower
>precision (u32) operands before widening it to higher precision (u64).
>
>Initialize variables which were being used uninitialized.
>
>v2:
> - Rebase.
> - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
>   With this change caller function need not initialize value to 0.
>
>v3:
> - Update commit msg as per review comments (Rodrigo, Lucas).
> - Update xe_hwmon_get_reg. Return bool from xe_hwmon_get_reg
>   and output xe_reg. This is to have abstracted usage of xe_reg. (Lucas)
>
>Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>---
> drivers/gpu/drm/xe/xe_hwmon.c | 60 ++++++++++++++++++++---------------
> 1 file changed, 35 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index 7e8caac838e0..8c805ace592c 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -79,46 +79,48 @@ struct xe_hwmon {
> 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
> };
>
>-static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, int channel)
>+static bool xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>+			     int channel, struct xe_reg *reg)

patch 1 could add xe_reg_is_valid(), just like we have for i915. This
will create the missing abstraction

patch 2 could change this function, but rather than returning bool,
return struct xe_reg (yes, by value). The caller will then do a
if (!xe_reg_is_valid(reg)) return. This will unbreak the abstraction.


> {
> 	struct xe_device *xe = gt_to_xe(hwmon->gt);
>-	struct xe_reg reg = XE_REG(0);
>+
>+	*reg = XE_REG(0);
>
> 	switch (hwmon_reg) {
> 	case REG_PKG_RAPL_LIMIT:
> 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>-			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
>+			*reg = PVC_GT0_PACKAGE_RAPL_LIMIT;

with the return by value above you can update all these with
things like

	if (...)
		return PVC_GT0_PACKAGE_RAPL_LIMIT;
	if (...)
		return PCU_CR_PACKAGE_RAPL_LIMIT;


> 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>-			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
>+			*reg = PCU_CR_PACKAGE_RAPL_LIMIT;
> 		break;
> 	case REG_PKG_POWER_SKU:
> 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>-			reg = PVC_GT0_PACKAGE_POWER_SKU;
>+			*reg = PVC_GT0_PACKAGE_POWER_SKU;
> 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>-			reg = PCU_CR_PACKAGE_POWER_SKU;
>+			*reg = PCU_CR_PACKAGE_POWER_SKU;
> 		break;
> 	case REG_PKG_POWER_SKU_UNIT:
> 		if (xe->info.platform == XE_PVC)
>-			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
>+			*reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> 		else if (xe->info.platform == XE_DG2)
>-			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
>+			*reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
> 		break;
> 	case REG_GT_PERF_STATUS:
> 		if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
>-			reg = GT_PERF_STATUS;
>+			*reg = GT_PERF_STATUS;
> 		break;
> 	case REG_PKG_ENERGY_STATUS:
> 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
>-			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
>+			*reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
> 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
>-			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
>+			*reg = PCU_CR_PACKAGE_ENERGY_STATUS;
> 		break;
> 	default:
> 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
>-		break;
>+		return false;
> 	}
>
>-	return reg.raw;
>+	return true;
> }
>
> static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>@@ -127,10 +129,10 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
> {
> 	struct xe_reg reg;
>
>-	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
>-
>-	if (!reg.raw)
>+	if (!xe_hwmon_get_reg(hwmon, hwmon_reg, channel, &reg)) {
>+		*value = 0;

setting *value to 0 would be patch 3, with the commit message
explaining why. Although the code seems weird returning void and setting
the *value. Why not just return u64 with the value?

The caller is passed an uninitialized value and hoping it's set by the
callee rather than doing value = xe_hwmon_process_reg() and making sure
the callee could possibly forget to set.

> 		return;
>+	}
>
> 	switch (operation) {
> 	case REG_READ32:
>@@ -143,6 +145,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
> 		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
> 		break;
> 	default:
>+		*value = 0;
> 		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
> 			 operation);
> 		break;
>@@ -298,7 +301,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
> 	 * As y can be < 2, we compute tau4 = (4 | x) << y
> 	 * and then add 2 when doing the final right shift to account for units
> 	 */
>-	tau4 = ((1 << x_w) | x) << y;
>+	tau4 = (u64)((1 << x_w) | x) << y;
>
> 	/* val in hwmon interface units (millisec) */
> 	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>@@ -339,7 +342,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
> 	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
> 	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
> 	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
>-	tau4 = ((1 << x_w) | x) << y;
>+	tau4 = (u64)((1 << x_w) | x) << y;

as said previously, these 2 hunks are another issue and should be in
another patch.... make it patch 4



Lucas De Marchi

> 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>
> 	if (val > max_win)
>@@ -397,10 +400,11 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
> 	struct device *dev = kobj_to_dev(kobj);
> 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> 	int ret = 0;
>+	struct xe_reg reg;
>
> 	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
>
>-	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? attr->mode : 0;
>+	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index, &reg) ? attr->mode : 0;
>
> 	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
>
>@@ -493,19 +497,20 @@ static umode_t
> xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> {
> 	u32 uval;
>+	struct xe_reg reg;
>
> 	switch (attr) {
> 	case hwmon_power_max:
>-		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
>+		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel, &reg) ? 0664 : 0;
> 	case hwmon_power_rated_max:
>-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
>+		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel, &reg) ? 0444 : 0;
> 	case hwmon_power_crit:
> 		if (channel == CHANNEL_PKG)
> 			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
> 				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
> 		break;
> 	case hwmon_power_label:
>-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel) ? 0444 : 0;
>+		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel, &reg) ? 0444 : 0;
> 	default:
> 		return 0;
> 	}
>@@ -585,10 +590,12 @@ xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
> static umode_t
> xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> {
>+	struct xe_reg reg;
>+
> 	switch (attr) {
> 	case hwmon_in_input:
> 	case hwmon_in_label:
>-		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) ? 0444 : 0;
>+		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel, &reg) ? 0444 : 0;
> 	default:
> 		return 0;
> 	}
>@@ -609,10 +616,12 @@ xe_hwmon_in_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> static umode_t
> xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> {
>+	struct xe_reg reg;
>+
> 	switch (attr) {
> 	case hwmon_energy_input:
> 	case hwmon_energy_label:
>-		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel) ? 0444 : 0;
>+		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel, &reg) ? 0444 : 0;
> 	default:
> 		return 0;
> 	}
>@@ -758,12 +767,13 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
> 	long energy;
> 	u64 val_sku_unit = 0;
> 	int channel;
>+	struct xe_reg reg;
>
> 	/*
> 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
> 	 * so read it once and store the shift values.
> 	 */
>-	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
>+	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0, &reg)) {
> 		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
> 				     REG_READ32, &val_sku_unit, 0, 0, 0);
> 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>-- 
>2.25.1
>
