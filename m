Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E72CC48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 16:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F6F112335;
	Mon,  4 Mar 2024 16:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAS4dRUe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97414112337
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709570318; x=1741106318;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7w0KnV3KC/tWgVXFBiO+d7g54wkM0qDwOXTekXnhic0=;
 b=nAS4dRUeBrV2BSfCnKRiu6Ks5irejA4iROxevJ/QahWSPWkLt39szALr
 r//kiXQyQFsrYlCuAa+uSUweidG6V2uFv1Ja4Woor5PONsXJtU6umHZ1V
 HhH6BpUXGdIHn6UPpQwOjdWNGRuFxLj9JOFxMcDIYt5wynVpBY8b2PX3c
 8ZsX1ZFqyr/AdzrG9GGejCdZO7qx2u+mylDpqSfvMNOVqRl719gGwTmJR
 xX9K8LyX/QObO84Bq7JZO4KYWYcRUQhlPsD9WnQUJwQeVWx6B/Y56UtKZ
 8p4MeFxaewjqxtMMxp20zJBwtKjaNIWl6C1cROoZVXO16j1Y0tR7lpyZO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15220018"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15220018"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:38:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="32224521"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 08:38:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 08:38:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 08:38:24 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 08:38:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 08:38:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2aqK01xpZT9xs5PtzQIqT3VTM1g3eDwkP+w1y/TQWbx9j4t4YcdyriZ8RFsi67mEt+ffEdFVZyEauzeqjfZpCknR4gPCIzypcPRGYpGGspq8m2q029QACwn+WQ/lXToD8hucdL0TZLUCpLnwLv1KLmDVRtsyMevDrhrJd28Hmgr+bM8+gXLw5WD7+XMB9YO7cTKLm+raDvSePZ1+PAgjvwmSHX0GuM5hOAKbbLEg2Y2mBPb127OVetnD2Dvf9OL4AuJZBfUchQdCt+dDE6jtPq1GmXTJU359Oh7Z5pBbqyPSvHs3Cs6goB4+wZTwVKpjml9X0HBwAC540EnE0/YEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93JRCdcIcAYjJLDtxcSuSkYiVSs9JAQHErJHyBqFdJg=;
 b=Pg1CmBE1gjHELcoNCnDR4CiCWhoxJ7/ybSXvF55WobKgiHOeUOhE+BGuFeiMCjrMgvDPYO5hMM/qpxGKa7dRkQV0BdXZmb5BFd8+7UxmZrjbM9CTl/QLYvYrvasr+2nKmoVWU2pWFiJlhqxE5KRJIEK9iAqR9sdnR2XmmWj3B/qNkj/OF1U9tfV89+DwdUHeRHgGjTkdsk/nHa6evr5luQ5I5fUFKDV9ihCIEUtLw4y2V2YJeCm5H1JA7oYNS2PABUm2hkuiUFp1tbcYzHm3kuU70CVKSHEYXhh3xk0pcVhDs5vKNYCPorRfROhbS7OyU4p+PZQWqUVbi0/8OinkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7541.namprd11.prod.outlook.com (2603:10b6:510:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.21; Mon, 4 Mar
 2024 16:38:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 16:38:22 +0000
Date: Mon, 4 Mar 2024 10:38:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Don't support older GuC 70.x releases
Message-ID: <dw54uqzedkjsbhoiadem4lzjhuwpud7m7njenel7tfbc5fuxwm@latczhpxzijn>
References: <20240304162616.824884-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240304162616.824884-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: beda1b3f-fdc5-41a0-da46-08dc3c6980c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGuCWQPofrIfCdwOYEet9OiJFA5Tly3W5maECFlxNyG/kU8aWr8u4gmry7bYvJYepsI7Xkp/dtFVXHDJoox+yWZZCbCSE10MVGm5pPupJlY1p+v0FxNB7shLqwb6GYtd1auUu/LzHL6S9CDSC3ashqNNTKqzgQKNqJhXoXuJZgEXqxUPwKRPUZT3ct70VbXPL0gPC9mZ0QmGwtwe2IdpZVSvMSeVjCYe3qdKsvTB2rMZuYf+tXqMvHzesOjmzJv7rdk1T8/2GEfMvbo/l5xLMKmoV7UphizlczvkBh/AK+uCn+Es8J66bijrlPdLBPWthUtu4RTcMRnWO49Dv63XkImw9ch4l/YL/EgldR4zW3g3gmfZiSsPUdTZaOBbbjjvD8ZI2qmXsv4aban/UU1Uo7rePY0T/e2Obp5kudoZQvuIrp9ch555gPVpqyvZY8i+mrAtDd5qvP0rMmcc9g63+6FC5ppByF8QOB7+5nyXTkvnwnTDGV8kvd9htEDBH8ilSIE+XDtQjk5RbyPCc0SKCCnKzLhobAk3ILzi/i0PSZzczOXXW+fOK92RBx0ibTWwVJ+5QxG2ZJfuANmOl88FOdYOoZjhtJ5fbNnhjUmChrii+6WpUSsmgR6pw2beX6xC8TPmHvzlT4lOmwh3rwjXyAK7YEUH+5MvAO9a+FQ+YCNJxQMR43q0kpcZu3D5Z/u2rQnI4AY7STYnCChYsOydsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8PhuXWwQ4T28KxP9wvaYs7pIXZL4J4xTUJwFhT7jKTHKLYqNkDA6sLVrtLGu?=
 =?us-ascii?Q?b4Wix013m43Qa4AT/c+Dcu5Nk8VYJBVHcbvrZd1EPYy0+nDX4KHhcswjwEWa?=
 =?us-ascii?Q?xsr7Qb76rk+r0JvCkkXt2fQtN3F1ZPuV0okPYbFqMVpvk7uuXD1YZ6xRps95?=
 =?us-ascii?Q?A5BE0bDRQFO8z8FrEPu8mskNl+ZppDuOM+ecM2T4puxkaQvnAMHdgg/hQJxT?=
 =?us-ascii?Q?5lYdi+pvA24wSq1wOxwxgSfCaandV0O10E9yLXpsczcffaK8IF7znhnWV7QW?=
 =?us-ascii?Q?KAedJagw6NoBEgUTbjVRd5vRj7o4/7b6O9AaQk6QqVQ3EEyVy7C3cuMStmSz?=
 =?us-ascii?Q?V8Avw+L8cBbU1H7DWrXM3rvE73dC6+23+LHDmOTp9umcLlXnUmAVlGH549Ag?=
 =?us-ascii?Q?TOvLstLXvILmsRjqjmo5Z6NaiqFM5/fHRVAWI1mEbhhI+qigAqjBIMwPjcAS?=
 =?us-ascii?Q?Ckfll/TpbE3uGGrdL06tmKA/pFtAIip0BE0EsLVOxOunL/LKwIhgBZZ0Hyad?=
 =?us-ascii?Q?UPWDr4buqnrciaN2N16Go4DrjsrvZs4A0PYIaxOi/9cyZWbcA3f4fGDZh3Nj?=
 =?us-ascii?Q?1DIA/06wkm0ko9K6q4YDY8nTLtVMS/LD0nQSmbl/iho+oBGgcppbOXzy1RBa?=
 =?us-ascii?Q?NfVJLzIcIKWIzz29vzO8OeRIPD+/Nvm2ksR9LwbVXnmwtZzJp7z0Ty1fHOn4?=
 =?us-ascii?Q?EuZnPSLh5SnfI+9DEjszRPGwTI6lOYU+IzFA/UPr71Gms1xCNqLosLSywqrN?=
 =?us-ascii?Q?+0pGkgnFaUU2ktcs1YJ2pv1GVdPUH+mEfpGmXIIlR/qVjQzVOmVySXu4zqN0?=
 =?us-ascii?Q?ag8EQGUrhMnCVVcnrgFsLH3dZCnqIM5U5m9J3V26i/wooaycuLLCsZf997aI?=
 =?us-ascii?Q?YSqS9LyKBHtr4ZNpDVvExHhcVDnPxXRBWBpDqVb127uAYLTC8/Mwj+gHBXCd?=
 =?us-ascii?Q?puiyd7sflP/hAf2+nU7D7NaDDg4NK7wECRDTkpXrKnDkLsrPxloRkCI7HwvG?=
 =?us-ascii?Q?hID09qfz98rbAft0CA0Cb5S5bkTkCkTT6ePdVHn+KTz6VdeC+6y6v6KGZi3p?=
 =?us-ascii?Q?HEno10c3YWq6VKpdiXLr7RACJRZmdLyAlsiFFHG5owpMBf+eC1R9ViFSYXBi?=
 =?us-ascii?Q?oKDaCAQvGq9N+1zVVvO0EMXUIF0Ch6WeZR1QPs1x7oXUGJuPYNfX5KxqG30W?=
 =?us-ascii?Q?AvkfmCNEhqHh1Ve4thm/qx7hjewKxA7XeLiEnYrrfmvpWocsy8SyfnafAF9b?=
 =?us-ascii?Q?vN7pMshmmZqx04Q4htod5nuXl2vNXDc9tg04puEn5d2Cojj8iBKr5B1/XxEp?=
 =?us-ascii?Q?flMsQTJYBqODjOTMd0G07kpeld2ifYrWLb8/ZMxZ9jH05H3v2DUBju9uZ7RE?=
 =?us-ascii?Q?74sC29Vrjcjz99RmZP9v/XN5wjUxUaoKEFqbAj/lIapzd0YWDiR9nhe3hdHD?=
 =?us-ascii?Q?G0id5rs9UL9F47QixOydkG9WUJhE0iqoEhSOmbu3vOJmGHUP46cn16KGOwky?=
 =?us-ascii?Q?u9KFOWEZBUpSUiqdWjoJv51CZXiA2jovAgp//KDnrQ8Yxaw4PrB0w29gbPEN?=
 =?us-ascii?Q?7+USwlZArHYQ41X9VfPUmQe50aV8XZU7qMHdX8aRXcEBsKNUxPOG/eDNQqTL?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: beda1b3f-fdc5-41a0-da46-08dc3c6980c4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 16:38:21.0783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+Zqyi3kmUo+6IgBzdSA7Jbuv9D+XtUt8AoaSOYgWUp+3EzEz7QDhI4ve6q2lXX/8GBxE4/3/rWB1i+T0hfFLzdoQfnwQHzzpJsMg723oGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7541
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

On Mon, Mar 04, 2024 at 08:26:16AM -0800, Daniele Ceraolo Spurio wrote:
>Supporting older GuC versions comes with baggage, both on the coding
>side (due to interfaces only being available from a certain version
>onwards) and on the testing side (due to having to make sure the driver
>works as expected with older GuCs).
>Since all of our Xe platform are still under force probe, we haven't
>committed to support any specific GuC version and we therefore don't
>need to support the older once, which means that we can force a bottom
>limit to what GuC we accept. This allows us to remove any conditional
>statements based on older GuC versions and also to approach newer
>additions knowing that we'll never attempt to load something older
>than our minimum requirement.
>
>As an initial value, the minimum expected version is set to 70.19,
>which is the version currently in the firmware table, but the
>expectation is that this will be bumbed every time we update the
>table, until we remove the force probe.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
> drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
> 2 files changed, 16 insertions(+), 34 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 0d2a2dd13f11..ba2ca6895917 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -133,15 +133,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
> 	return flags;
> }
>
>-#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
>-
> static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> {
> 	struct xe_device *xe = guc_to_xe(guc);
> 	struct xe_gt *gt = guc_to_gt(guc);
>-	struct xe_uc_fw *uc_fw = &guc->fw;
>-	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>-
> 	u32 flags = 0;
>
> 	if (XE_WA(gt, 22012773006))
>@@ -171,13 +166,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> 	if (XE_WA(gt, 1509372804))
> 		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>
>-	if (XE_WA(gt, 14018913170)) {
>-		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
>-			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>-		else
>-			drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version expected >= 70.7.0, found %u.%u.%u\n",
>-				version->major, version->minor, version->patch);
>-	}
>+	if (XE_WA(gt, 14018913170))
>+		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>
> 	return flags;
> }
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 7751d6ba6ce0..fa06b57d2af5 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -297,36 +297,28 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
> 	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
> }
>
>-static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>+static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
> {
> 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> 	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> 	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>
> 	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>-	xe_gt_assert(gt, release->major >= 70);
>-
>-	if (release->major > 70 || release->minor >= 6) {
>-		/* v70.6.0 adds CSS header support */
>-		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>-						 css->submission_version);
>-		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>-						 css->submission_version);
>-		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>-						 css->submission_version);
>-	} else if (release->minor >= 3) {
>-		/* v70.3.0 introduced v1.1.0 */
>-		compatibility->major = 1;
>-		compatibility->minor = 1;
>-		compatibility->patch = 0;
>-	} else {
>-		/* v70.0.0 introduced v1.0.0 */
>-		compatibility->major = 1;
>-		compatibility->minor = 0;
>-		compatibility->patch = 0;
>+
>+	/* We don't support GuC releases older than 70.19 */
>+	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {

there's slight chance of this getting out of sync with the firmware versions we
define. What about adding a define with minimum version just above
XE_GUC_FIRMWARE_DEFS ?

Anyway,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

for this patch or to carry over to a v2.

thanks
Lucas De Marchi
