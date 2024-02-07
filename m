Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAE4C4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 04:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D80B1130DD;
	Wed,  7 Feb 2024 04:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHiPqjvS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CFF1130DD
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 04:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707279701; x=1738815701;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TRc6ACfQIvmxEiHSfuyXyv3z7G18d1f/vyRF9PCryTw=;
 b=QHiPqjvSi84PHH8rCfB0JNs+tAqSJCLYgR9GDQ159h/h0o2R3h2hEGro
 y37PeNUt7BEpUxEEldPtEgu6SiG1kLw+9lXKxXFe+fg2Yiyg1HpbLZon9
 v689QsCioTBIVOsSlbYIVeaPMOJcEccw/cpUUlZ4ICWqkLSsXTk5lPDpd
 EA7psv3elttPU4CszttFEAr07m7ZjUhTviZSx96yNxF8yOGBejArHp7xD
 uvFaMUe8bEBbPvoy8TBNJo1QdLmu9nWPtmXz5mJQfdZLTZJiFOTSianuV
 pIO/1Vzglbr0/Ea5W+Z9NxSv0kxbYtNtNwxbu643L/DWz73fQ+YLINaUl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="436042357"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="436042357"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 20:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1497541"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 20:21:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 20:21:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 20:21:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 20:21:37 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 20:21:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC5iZBP3RH17MQyggDyLx+I9Py8HwIcGRWyKwXltPmR0+8n3R+95jUZJt9S14+cU5ErMIHhHYJFuFwIIAx9S2kICwiM0Zxvj/zYBvNv0roT0tluNwVwcmj4juAoWf/IyvMV7h4/Z1kPLNdzn3IKp/RwVYr+4+ENt2hb5hCBdRLnmdmcJ0i++fj8+cnJXKklv8dkob2CLvV+wJbeBQ0N98r75Vq94ZpmkXFQa9fZtIYpanqgclGki6F4leoof5GX6Lyu/tOMKvXT9W2TdTwn0365OsrurzXosxEZhb1nNwRwbm4QEpVXuy//sti4KkoEs1l94ZENMRLvR+H6EN+fTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWYMKztTQEwQ3hdLESXBGzwmC//eK1sWxkZNo7Cc9+k=;
 b=gZzK/ouUcSXVJmWK/EPmJ4PD7X+Qo3xAvEok5XKbJ1hLfo99zTqscK69sbwz3fHAOBztyS1/SOkQz19XHbKEx/rZtsmkXd0ubt/BI/YQPKgIWmqnK5fQHgikLHTcOuWpiXwi/OZTUX0XxJyrqILVLjSMUwMVipGvAQrVci2lvEk23kJBiV7D3fquBxPHnNHwzU7JWtdHlU+wYjk/3RZVsX6nTLhTHd8nKLO4Z5EcOrKelL0xX0o+TlZgUhTOCy5Y3+oKnrZFpJz2uG65BUVbqjpIzZ2JAMyMaqg8uTXLMmVt/i06LOwBBx6S5iHPkUWCAw1/g6kgc5iOqYLaAZDe2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7889.namprd11.prod.outlook.com (2603:10b6:208:3fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 04:21:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 04:21:35 +0000
Date: Tue, 6 Feb 2024 22:21:33 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Message-ID: <x63k5zcpuf5kmhlf62pwr53ldst2lhmg4h373iu4wk4i3mvoev@tkml4h57lueh>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR16CA0036.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 2acd5a90-fdbb-4ddf-c5de-08dc2794456c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEcF1pctvAvvdBT2NWS43IBWuGrMdhEPs0aFtzvrTUmdYWr1Y17BP4+vQDAr1vgWteyZ5tZsi5bwwQWxVecUGCJlp3PwohEpLD1CSKsBc0dgOShHjHAyCegwSSAjyOUKmuwGeQ4zvmJL0Dzipxf9XED80rmDTuvv5qCcJ36+6Gi54BawwIyJsaYumZkHi+J3fpS7HQHkPsHmprdAWxGDn1cbxdZAXh7+sIFZEDYglEtYZXvw3TjhiRbCaKhyHwaSAPqa9wCcrbkyy6n4MFGQo62r1WxzFANbokZ1Fmap8dGP7JcpALNThzwoZmduWC2xSOqXuC6+OWWCGy5VtQDKtlRD2MlMvP3osUkZ3v/+XW5kP5vy8RE/WpRjFoDDdtshlZ1AP/NGtyfb6VdPaF5nzj69KESLkz0utGOBqodXaC/mjGWEkIRfF7AKEgCdVQUugY/e0NzKiV8EvhPnR3OMTqJXvXN4dSnG9Z8Bw/8Aqf4ttyTSMsmu4QjbUQESAm4jLxTkJHMrPWHMC8wygM6uA+jMOLSa6ZxaFpkOGEOBqTH5xHedz1YIQa5HnjbeSz6+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(396003)(366004)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6636002)(33716001)(41300700001)(26005)(86362001)(6862004)(8936002)(8676002)(4326008)(6512007)(6506007)(107886003)(6486002)(478600001)(9686003)(5660300002)(66556008)(66946007)(66476007)(54906003)(316002)(2906002)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z2Ed1MklrjnKvxViZYWMelV2oh0yXYUtP7ZYSfiLO60FN7dUSdFiSXLu9Ye3?=
 =?us-ascii?Q?CSXi/Twdl2xlBmZRLxyY2LMcPlYhq8l/Rl1h/X5PypPpOjKhcbhPlRXK0myI?=
 =?us-ascii?Q?UNNlKa7y++7lfZNLus2FGUt72ytVvxostCkL3e/UsCPL18NooTqF9shgPROC?=
 =?us-ascii?Q?qMkPPM4KzrQspG/alDQazscv5MopPy2auQs4x6cBvDBOhjeX6nK+epQsvhQF?=
 =?us-ascii?Q?5oT1b72+m7aENeQE5Ukbk8r2ncJqQq/o8081qoAzqFyQaRc03YTp5UjfSQNf?=
 =?us-ascii?Q?7seDTKUjTvt/3n1M//CUelf3TIWsmdjr/d47DrFu9TS3Uo28w00AxX2hl9+I?=
 =?us-ascii?Q?L64HhA9bfisrfArI0BLO3x6JUv8KWyzA/y/DPiOJP+IBGuqaDE8ooZLQsdRM?=
 =?us-ascii?Q?4IinduCGXLXDcsP/whcJ6Alqiai0JcB4Ecil4P2L8/OjCj4XzmmkfwSSeFh1?=
 =?us-ascii?Q?NuB5ADCRrLpjPDBVYDs8k6DuvQaXbNzw2uqsicJkZnM2z/jpDu6aStOxzYnJ?=
 =?us-ascii?Q?mvwdlEmQ+GPq23l6Hoa/giSQZhqCSiGF8HOFM9GGaz+Mz52AS292REFqU2Oj?=
 =?us-ascii?Q?An7yy1aMLlvXnVVj4rBrvRD2vxurLGhNTCq+Z+2Gu0WSpMSwRw78gTkLc7GL?=
 =?us-ascii?Q?IRfyhIotyf4FKW2SMx0TgRfMVCUkYFyg2q9tLubj3tPuRr06uYOlr3iNX+ma?=
 =?us-ascii?Q?zJikUIcXxvJnfWYZ8748IdVKkq4pmyYbVgLLja9/or8TpNp/uJ71seNx5kZQ?=
 =?us-ascii?Q?uyft3t68rzIBEb/hINQsdOBryD4twxCuAyT0vfTUKydB+SlA9bhhoa4Glk8U?=
 =?us-ascii?Q?lN5nkzcBpkdd6D3ul+fm+BzwlITT97dWl7oarNRe4tBQwe3LSJLDjmuFQ3sf?=
 =?us-ascii?Q?doqKu2zYnIzaTh6zW2qbN5ZRamnkiMxKMUUjvBtRlyPVBXumc1/zUdFGh3oD?=
 =?us-ascii?Q?KhdA2OEuQNlnx2Bg+SsrUFTdfBe/xI8BXdPTCi8FAROnf31MtTSbmaz2jMIS?=
 =?us-ascii?Q?dlcYd6AZI+IiRvq8XnR5Jcz29FjjyTyIAh520fTdDCm3Wy3hbTO7n8h66gMs?=
 =?us-ascii?Q?wdifLqt0Pyydz0DZOY7ey/PQBCnQXkjryzUnXHmTJoWlxK392bYPN0Piv40+?=
 =?us-ascii?Q?Zg2Ol6VPvn3SGHvMwdvZe+vW180m9HOF1kzEDQp6EtWQAVjjNQ0Nht7f4GTV?=
 =?us-ascii?Q?vR03dgxn+NHCON51zVzJzi2AXVpAityibutIBlRADyffrv8q7Kn24Ht4WrO5?=
 =?us-ascii?Q?80GluRij4ZXO8FQJGYpk7hKik8kWor6T3EBzwxEGkmnqWkd1r4N/HiYMNsDM?=
 =?us-ascii?Q?aZR9NyP90/RPfGzr1sIBomf+WGo7bmbA1SUYuWKe6lF0kT4i5Y8TErXkrGJD?=
 =?us-ascii?Q?nkHirPuiZwMFwDGPh0L9u1Fvk7GDoRCj/2OQKmn85DMFkNiCxOSDrwB97Qd8?=
 =?us-ascii?Q?suIDkcv9a5Yq3+88JTijxGEftIYx5q9gauK9UUrxbTJDgeZcfYXRrOKA0vKa?=
 =?us-ascii?Q?0cIhABFK3J4x9R71dRxCg9/3Q4u924Lfylf9u3hF6Eec93N3FBW/zKtcsY8j?=
 =?us-ascii?Q?KRsvWGJmsTWUHGAWCHJcuQ6ae35bBrD5jK7zST/uyE2SzHfV/3LMQRmj+tF9?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2acd5a90-fdbb-4ddf-c5de-08dc2794456c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 04:21:35.5067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTaDeZLhK/Jg1u/wpQm5cs0uEg8bz6/7xCZZG8QSW1d3s1mDtzJLS5x18tgWo0mIcZoMOvODojPAtQWUIIKqEA9KTwuKa8WA2KrwID3UueQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
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

On Tue, Feb 06, 2024 at 03:41:03PM -0800, Daniele Ceraolo Spurio wrote:
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
>RFC: this patch sets the minimum to the current GuC version (70.19),

we are still using PVC for development, even if not completely
supported. We can't update to 70.19 since PVC is not in that version.
Once we have a firmware in at least drm-firmware repo, then I think
we can think about the changes here.

>but that can be moved one way or the other. The main aim here is
>agreeing to stop supporting very old GuC releases on the newer driver.
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
>index 868208a39829..5e6b27aac495 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
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
>@@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
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
>index 4714f2c8d2ba..e5bf59616f3d 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -296,36 +296,28 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
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
>+		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
>+			  release->major, release->minor);
>+		return -EINVAL;
> 	}
>
>+	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
>+	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
>+	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
>+
> 	uc_fw->private_data_size = css->private_data_size;
>+
>+	return 0;

my main concern is not about raising the version requirement, but that
this is too early. We don't have 70.19 for any platform in
linux-firmware yet. And we don't have it in drm-firmware for PVC at all.

 From the above changes, it doesn't seem we are reducing a lot of code:

	2 files changed, 16 insertions(+), 34 deletions(-)

maybe let's wait a little more before doing that?

Lucas De Marchi

> }
>
> int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>@@ -424,7 +416,7 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
> 	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
>
> 	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>-		guc_read_css_info(uc_fw, css);
>+		return guc_read_css_info(uc_fw, css);
>
> 	return 0;
> }
>-- 
>2.43.0
>
