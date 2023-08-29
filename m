Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD43C71153
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 21:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EC289A60;
	Tue, 29 Aug 2023 21:50:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9357210E053
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693345818; x=1724881818;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vXlop8mLFAPkub/LSJbVDq/47tef1fXyFKZ4l+47Ayo=;
 b=CCDZSBVt2dL+AuY5MQpuXB9/psCiEred3pYUiuPJV4FimuX1tm3DrZ0L
 EhcAqKd+rVOyzL1S3V5l4h/mtd41Ijd5pNDzvfCzIsL+FhuTZmAF8yCl6
 RhPi3QVSKXXQmxG6OniiOtKeAEAfMkubUXo48S100mAfXotQk8Ckz3XGR
 SA+7bGhIp5/UnDv9UAvFKr4tMycLC+pdzqt87VyL1LYy2vraYzjAz/5on
 2VhJ3rfciu9ZELVNrLTOMqmBOIXlsbGcJjTVaAvC4xThXobYezwW/qq0n
 Y6bzl+9U6hKt/KwG2Xf+g2d98SbJrJU83nUApNXiq/pM2bLmeyvIsk32g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378204946"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="378204946"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 14:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="828984703"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; d="scan'208";a="828984703"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2023 14:50:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 14:50:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 14:50:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 14:50:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 14:50:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEk7/OttZLZdApWYZhmZ4ARBk72txssoOm61ez2aNt+oCtbfBahPT4mj7ZzMYMRhPcv2rDge+/APgDK+nQbrsDwlX1eN6cgevlrffGhypSao2RCfDP+uuN9l3BlT/Yai5jdTyyE8/jdHQV74JN33jAlKp8m7nSPyVaEvif2nFhb8mIxozuUoSyyJ7sFAigfvjtUddUjCaFIRATr7eoq28YMjmhEDEXGbjaHwnNrewDsXRAnPQijBXv0ljfg0MMa1NvcK4Qo7NiSTJng+xu+r/31ZC3U4msvmiRG9O55hPxR6I+0QHQxAejILK/LmXoSgavDH2En2ilt80Bara+k3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2IhQ30Le0SJTXiyunm3cmd+/AHeICXxaJ0pHbTC0RU=;
 b=fAlcHhpGYnsR962rOeeGM1qGNdVSB/kUsf/miFM57JdFBFiEbcGYSX9SXUUDSvZ/Xxxj4uCe489bTDmoQZttjvxdanqdql32+j56B81Ac3Or61SHIRr44uG//7+40svGkxf7KA8t9/pc8V2yNZNiZE9qG1Fs5AOpzxzeYthGunDyUSWhUJzWij+K3nlgjLz0tVoYYerYrC9pc1t3thVuIcy4tdRFXIPjBkYkOriHDbJchFNrdjHuRZ0QB7sf+9hSwlhzSPVV3y65go27dFzmnpZ0wA+0/wZlbsY/2pRM8Q0gUARngNch1OJ1taArLxmqtMRjGo1FJbV+dt4vZDIByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 21:50:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 21:50:03 +0000
Date: Tue, 29 Aug 2023 14:49:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <2atx3jvuevvb3a4duzqkym3n3rglbcbxjfn4smamcmuz3wazhq@kpwcva26aenl>
X-Patchwork-Hint: comment
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230829162840.73444-10-matthew.auld@intel.com>
X-ClientProxiedBy: MW4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: f35c3761-b798-45c7-8a7b-08dba8d9e632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rc9YmUA7X8X2Hs+6UeZ4inQFnVU5cLXOIEnftkPHgep8CpAlFsWmaaoW/lKdKtbZvvEhVlG1lyxx3qx2J20XANaAO/EoZS0+gDMJ46wPFpUATozpHI+Ae4P6CNBS4HOhaciV7xJSLRmkQ0wtJWqaFyA90LrR+nwyVkuqUIlBM6vWs8kHKpfbIuBzhkjDNWNwvbnJaTyStV6zY9xcB5pk912SpI8x+blBv58nzVQMbAhnLN708042J1DPDekJQSIqQdsHAnqa4bqh2GX/lpAWzAzQh9QbmbDI4Ta04mSPpVHC6+jmmNFCyWllo32DlwtKIaJY7LZbDRhzuI9u/Wgw3pRsJc2RqsnoM97qiCql6Jo6jCLSgjeK01vRvReNpVCdRzRuNHHZsxLS6KHY5gJ8Ms0XX+Fo+7m94hleiVHWtPMOakNHEu2248gzH2Wdj8o7H8hTI7xHL7D6uA4I2yQyRmI+MQprQTFxPyL+LtiZ24J1RUTcQPZuMURFIAGLAWYFliBL8rd2tssFVM1QCXZAm3kaRQkXkS/2FCEc6xsTttt9+VF6al93Ml4acQIe5Bvl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(376002)(396003)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(478600001)(6506007)(66476007)(66556008)(6486002)(6636002)(316002)(38100700002)(41300700001)(82960400001)(6512007)(9686003)(8676002)(26005)(5660300002)(83380400001)(2906002)(33716001)(107886003)(86362001)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pD3hjtsJFRkLdmw1Vg4srpw3vAWl4yF/9rgnufEBcUt/mymxY6h6/Wqxqd5Q?=
 =?us-ascii?Q?vLjSQ3miEpZ/K8ONRApvfZG0chJUb4LspoOWMvsNDN2s2rBUCYbe3IEX9/s0?=
 =?us-ascii?Q?BHo5WHR0G+rMKx3lb5uIRW9prcrgZCk2QIt/HwFnghaIn7JWKc6E52Ag8XDU?=
 =?us-ascii?Q?m4W+7plLOcRYuYdse+k25+2al/CE24pydZdc3ho70475jtwY8ygDi1mBhbCI?=
 =?us-ascii?Q?pBTGSl3H6RjRBbu+DjVvVhclZJe7wDrRLOzuRRbdux1570zNFiwar3PK7mwY?=
 =?us-ascii?Q?uYlvqo0+PmvU9OxFLrapK583KKzfNoRCjgzZqe9qw2rBrCYRKn/WGAdDs5S8?=
 =?us-ascii?Q?Uq6+mwtC+uAMry/pcV4C1UBO9wy1xby6f55QUVgL4Z8VIeE46S0scFI836KK?=
 =?us-ascii?Q?TNIYAUtq5ENTdWEuoNPf06Sh+Ohn45CNhAKWX3f17eKWAubh4oAbGa3liRfl?=
 =?us-ascii?Q?5+YauzI+gQo4vojIF6zk13BvlY7JVwn2MxQA5CPtKPTYzFuFPfDj4xYl8BG1?=
 =?us-ascii?Q?2d/JVkHqwgwcph0WLHsjUxv7Vyaj0FghKqosz/qO8e+O4jXTrQCVsY640sEQ?=
 =?us-ascii?Q?bwGlGJVPedm2785uLgQ88lozSb9yOyccUpqfzkUaO5lTTUQMIVOouQOLJotH?=
 =?us-ascii?Q?p6W8YaHbgQjg9e6wPLbJrrYUCrC2wFDooeXxEcv5s5bRegI8lR7b0uExqXyV?=
 =?us-ascii?Q?toOSunbl7ssdq5jsz48YoLEB9ontvkmyw9Hf9LbVmqZmtcQ+cLKlgvUb9q3c?=
 =?us-ascii?Q?zqA/j/0jVm+8my9trzgVkQjfrY/VG2ZHefWl/n20wvTNs+MVLzt8ZphRlX99?=
 =?us-ascii?Q?ijE1Ul4gl4O3+ZtQ8RucUo7K/VaH7StlHEnEieG9rtdK9XT+v9xgkYNTrXHZ?=
 =?us-ascii?Q?b3VHM5O+M4hzBVERJ0o78lCWf/ty+5JZmX0OE85VeXMWHXOD9wJQ/Z0qGqJQ?=
 =?us-ascii?Q?x6fts5XwHEjs5S3G7Oj7frgVExCBqgqqt8tyQmIuHq3idO4jxcjgBDgp/4vk?=
 =?us-ascii?Q?PtoU2JIsBXjZ5yeyD9KlAS1bTmeCxliLCuygb4hZ5AqTcVBTLG7vClNTA3E1?=
 =?us-ascii?Q?3afGnvI0f+Kl6u99P3UTqpZKem7UAbMSxMX3Ooj+ousK5dtkx8vkbFbQWTew?=
 =?us-ascii?Q?CzqR3ovXZIr9g5hsT+3nDKgZGOYPy8Zm/ncjE9GKbq5yV+z9woiYbuLA+jhn?=
 =?us-ascii?Q?qf9U+UxhXVYFrzpj53DXKJjEZfSbeeRPmb4TQswKE871Rc0lDs3lCs8erde6?=
 =?us-ascii?Q?hmDFe3CplIrkfAoj+gmKYQf/wZNmKU84Q2eIJ4FaZPgDWZz2oKbp3HOitZwL?=
 =?us-ascii?Q?7qhMlgIrztORoDd0jYSeznhu2zaKAjtmHMvKbSt5LVrO7GiGocj+7n06/n8w?=
 =?us-ascii?Q?Wdk3kMdzfQ035GdKuRFct0DnZmbnOu5VR6oEHCkmo1mEbtu9V7TmSb9lBTuT?=
 =?us-ascii?Q?fkuNmLxNW6D7NKX5g5VSH6CDu7OWD/t2N6E8IkyD8/guZbzQ5dxAo3WUfu8D?=
 =?us-ascii?Q?DJdEPUFigBSBO1uOZKinkMLC6IJUnvUAbTSZn9pKcksWi3ZO7M56PLPkFwHF?=
 =?us-ascii?Q?DnXtC9EYbdGsgOlEDt9f90ZRYWlvYu8uMBQSGAuBT4GPVovrCItCMlfnK5hG?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f35c3761-b798-45c7-8a7b-08dba8d9e632
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 21:50:02.8648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvOgWAWlk+QyaOZMBw1pUME7ygxg8dbfCOS32wrOfCPxrwfEgdHnHiCH7H0O1flViS2Y/I9HEkI8Kmx3ghpSZ1J/PmYJotG7SqeKLZFYZUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 3/5] drm/xe: move pat_table into device info
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 05:28:44PM +0100, Matthew Auld wrote:
>We need to able to know the max pat_index range for a given platform, as
>well being able to lookup the pat_index for a given platform in upcoming
>vm_bind uapi, where userspace can directly provide the pat_index. Move
>the platform definition of the pat_table into the device info with the
>idea of encoding more information about each pat_index in a future
>patch.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  3 +++
> drivers/gpu/drm/xe/xe_pat.c          | 39 ++++++++++++++++++----------
> drivers/gpu/drm/xe/xe_pat.h          |  3 ++-
> drivers/gpu/drm/xe/xe_pci.c          |  6 +++++
> 4 files changed, 36 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 5037b8c180b8..06235da647bb 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -238,6 +238,9 @@ struct xe_device {
> 		/** @enable_display: display enabled */
> 		u8 enable_display:1;
>
>+		const u32 *pat_table;
>+		int pat_table_n_entries;

as it's expected to have this "owned" by xe_pat, I'd
use a new substruct "pat" rather than abusing the info.

	struct {
		const u32 *table;
		unsigned int n_entries;
	} pat;

Then we can add more fields as we need them (example for annotating the
idx we want to use for kernel ops)

>+
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> 		const struct intel_display_device_info *display;
> 		struct intel_display_runtime_info display_runtime;
>diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>index a468655db956..f19f5d8dcd94 100644
>--- a/drivers/gpu/drm/xe/xe_pat.c
>+++ b/drivers/gpu/drm/xe/xe_pat.c
>@@ -106,24 +106,17 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
> 	}
> }
>
>-void xe_pat_init(struct xe_gt *gt)
>+int xe_pat_fill_info(struct xe_device *xe)

xe_pat_init_early() to follow what is done in other places as being a
"sw initialization only" that only depends on some other fields being
filled


> {
>-	struct xe_device *xe = gt_to_xe(gt);
>-
> 	if (xe->info.platform == XE_METEORLAKE) {
>-		/*
>-		 * SAMedia register offsets are adjusted by the write methods
>-		 * and they target registers that are not MCR, while for normal
>-		 * GT they are MCR
>-		 */
>-		if (xe_gt_is_media_type(gt))
>-			program_pat(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
>-		else
>-			program_pat_mcr(gt, mtl_pat_table, ARRAY_SIZE(mtl_pat_table));
>+		xe->info.pat_table = mtl_pat_table;
>+		xe->info.pat_table_n_entries = ARRAY_SIZE(mtl_pat_table);
> 	} else if (xe->info.platform == XE_PVC || xe->info.platform == XE_DG2) {
>-		program_pat_mcr(gt, pvc_pat_table, ARRAY_SIZE(pvc_pat_table));
>+		xe->info.pat_table = pvc_pat_table;
>+		xe->info.pat_table_n_entries = ARRAY_SIZE(pvc_pat_table);
> 	} else if (GRAPHICS_VERx100(xe) <= 1210) {
>-		program_pat(gt, tgl_pat_table, ARRAY_SIZE(tgl_pat_table));
>+		xe->info.pat_table = tgl_pat_table;
>+		xe->info.pat_table_n_entries = ARRAY_SIZE(tgl_pat_table);
> 	} else {
> 		/*
> 		 * Going forward we expect to need new PAT settings for most
>@@ -135,7 +128,25 @@ void xe_pat_init(struct xe_gt *gt)
> 		 */
> 		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%2d!\n",
> 			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
>+		return -ENODEV;

that would be an odd error. -ENOTSUPP maybe?


> 	}
>+
>+	return 0;
>+}
>+
>+void xe_pat_init(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	/*
>+	 * SAMedia register offsets are adjusted by the write methods
>+	 * and they target registers that are not MCR, while for normal
>+	 * GT they are MCR.
>+	 */
>+	if (xe_gt_is_media_type(gt) || GRAPHICS_VERx100(xe) < 1255)
>+		program_pat(gt, xe->info.pat_table, xe->info.pat_table_n_entries);
>+	else
>+		program_pat_mcr(gt, xe->info.pat_table, xe->info.pat_table_n_entries);
> }
>
> void xe_pte_pat_init(struct xe_device *xe)
>diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>index 54022f591621..9ab059758ad1 100644
>--- a/drivers/gpu/drm/xe/xe_pat.h
>+++ b/drivers/gpu/drm/xe/xe_pat.h
>@@ -26,8 +26,9 @@
> #define XELPG_PAT_WB_CACHE_1_WAY       3
>
> struct xe_gt;
>-extern struct xe_device *xe;
>+struct xe_device;

leftover from a previous patch? what was the base you used? I can't see
this on drm-xe-next.

Lucas De Marchi

>
>+int xe_pat_fill_info(struct xe_device *xe);
> void xe_pat_init(struct xe_gt *gt);
> void xe_pte_pat_init(struct xe_device *xe);
> unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 791107dec045..24f2021aae22 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -22,6 +22,7 @@
> #include "xe_gt.h"
> #include "xe_macros.h"
> #include "xe_module.h"
>+#include "xe_pat.h"
> #include "xe_pci_types.h"
> #include "xe_pm.h"
> #include "xe_step.h"
>@@ -553,6 +554,7 @@ static int xe_info_init(struct xe_device *xe,
> 	struct xe_tile *tile;
> 	struct xe_gt *gt;
> 	u8 id;
>+	int err;
>
> 	xe->info.platform = desc->platform;
> 	xe->info.subplatform = subplatform_desc ?
>@@ -601,6 +603,10 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> 				  enable_display &&
> 				  desc->has_display;
>+
>+	err = xe_pat_fill_info(xe);
>+	if (err)
>+		return err;
> 	/*
> 	 * All platforms have at least one primary GT.  Any platform with media
> 	 * version 13 or higher has an additional dedicated media GT.  And
>-- 
>2.41.0
>
