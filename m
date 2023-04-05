Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD8C77B71
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 21:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C08410E261;
	Wed,  5 Apr 2023 21:12:12 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CCA10E261
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 21:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680729131; x=1712265131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A+Pd7Wgn8nnsi7B+6cXvNETmbmqr+ZqpqpbMkc+TbfI=;
 b=DJ9FvQj+8o0xHXVy47mUY3uOIizQqx1VBAt32tg9BMutnMvCFt7bNelh
 Is0UzMXrec8DLpYglsB1W884ldWVvGve4T/d46fN9RucxMXA3pnzeKAbm
 u6VHpwT8K3M+kRE5l819W/iMOXZcpEtYzJa0O+OHPA5mO72sCD+Mge1Gm
 6wuWeCeoXfuK0SnrjdcHzBgwTnLtBsqJ3pyyn2v8yxE8bXXWNkhKmwB0V
 J/vaVbe1lbvFVo6VX6e4VoRpvFwTsnRRpDXgGl2b/bqp2RSNB4Ln7lO1H
 BgrViunyUbNFpEje0x0ZGXszP9KskXVI67AtAO8Q/jO0llzK8t+7jvFMC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322943932"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="322943932"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 14:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="776204523"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="776204523"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Apr 2023 14:12:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 14:12:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 14:12:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 14:12:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRJQmWnY3/dbgURbxR0bJkJirjiWR83/iZ8azyu1Aab4jOks03UTR5YGWrrJnjTkwg6nEV6IY3KqJ9J5bXxBmW6+ojWHLcJzMAZ57q46S4Y5CJXZsRCs6ZP2tWkM1f7sfdtv3l1RLGyIpEJNSXz1IpnurNJ8w4GAvX4DsddrEUHIZnlpdkNhEB4my4qMDzm1znnBEof1rlAkfuiV5twkqcLSVxJcV6fXKkfBmL5ZHCK3HlgLPuwWHelaoydCKUCqNC1Y7GvzyZGpOhDeI2wwc8z9N/aac17Pb/qeF6hL245USK86C5f9UxsntQ6oKJvKX6AQNL6sl/9Mn/wShEd7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4zcC7UJ8oNv7dWKkEV38zk5ew9Yj2xVBkA/EMp2k+8=;
 b=gbZ8NpnY22bNB4pxcrIF+kj938qqPO6P9Q2lEH4hmQ8Dm8DduF5tKlL5iCJ0VYhPK/tumhEbfTWzxR88bnOSNR+nf/7Np0bZhM0Kw4LjP0l1ewhWy0Tr9bEGicvS//1QrTqTbT5TiCpaA4frhlk2uHKYqhz4mtD0biJI+qPKnI+21850qPupI5GP4/zQi7XsRRj8CbmR4QaMZEQ7g/G3dnrpQal5pGPUS3t7hIAQ0DJqcYCcjE4Z0sBiXWJoEEgTllcbwKnmYBkRRQUe9OzlPHVgJt4UNR/aihtp5hW+QgU2zpf4x+TpURtm17LtyalnMZB753uMzO+CRBk263REpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 21:12:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Wed, 5 Apr 2023
 21:12:06 +0000
Date: Wed, 5 Apr 2023 14:12:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230405211204.gh2j64qlmit7bst5@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230405203533.2182217-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230405203533.2182217-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f65ece-9816-4700-dad0-08db361a68c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AuLLz8F7mrK2ZBwE6dVNlPG/waim7CeNuGHABi3ri48Ty3bgMTPOHsdPpMzLiIM/bW6uauMdUIOgf5mUjn7xo5CG9EpdcjmhrLsEjNA5imgZ7dLxVTJM9qo33RiKnTzTovS88uU23jWIEAc6mUWQQGunnQuMC05pYk6sX7VP1Lyo/UvPauvf2xTwtX/gF06Rfog8Vxyvg0mYIMRswYuSIqWiAcBrGDPYanwU2y9WduI8lH19bNx1zztraggYkSt4YvcGdG4UWVTaUenhjNhlNCKxjq4zLJ7zo6j4Oh1O+JSLegHtHVSwYFKqOjOto8p0WIg5Xx/eKN81qE0cxBwGTOdgufPb2aXAHqai9pFIXL0+n3Q5VPeQ6ZVQYgJXbgcJuRSY6Bq2TogFIEsiNx/HdJcNbzGYYWLR7xdJIXTVCNTKR7b9nJcp68Mf1shzmFJ+0gQurBuydcMi05AF9OJHZcCX/G/A/xoW8nj+y07liSQI3H4LVrc75T9IMq6u0lxX15UpWMORVeL7Rqsgo+jOZSvgQpNIZgmz1Zo+BggkBGknUCzv/m9OHnQ+NO/zufNN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(6636002)(316002)(26005)(6486002)(186003)(478600001)(1076003)(6512007)(9686003)(6506007)(5660300002)(2906002)(36756003)(38100700002)(66476007)(41300700001)(82960400001)(4326008)(86362001)(66946007)(8936002)(6862004)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UnPQvHzWS4FyH7hvMWnfwLkod7OmNilRanu+0ugpxrlIYvnP1alGK6NzUmSl?=
 =?us-ascii?Q?bU6vFMc9qJw17wTMK9T2X7nQfeBUTB4SLYCcJqEzqK3SX6d+nuGVyjCAnd8u?=
 =?us-ascii?Q?8F9REOtNegCMWJFp2x6Na9gtPceFCaTFnGH/gBpVCjj13UQIZjxsJbOfjLx7?=
 =?us-ascii?Q?65NC7vs7f/WIPavX8+GHbkjyicZmpaVn62FrjbhgBYmt7dC+i3Z+N3/565qk?=
 =?us-ascii?Q?10Pz5TJ9qMaKPokSNohIujUU+vDeRJapEOkQSFhVgfWLeH+15RIZLEe3pDU6?=
 =?us-ascii?Q?I1qeeRmHW8xZlmKf5Cbfl1q2f6J6o/zYOEOeucJwgFBxOpTvqZqwYVNhXC85?=
 =?us-ascii?Q?CGEoLRskAIWX7xXTidDmyA/VpiZYGKbQpNECanS60R0Ga9+sv4MI/uypAcB4?=
 =?us-ascii?Q?n/ryYExT+L8avDhUs3ypVkzSsGlDZ7Y7awhdGkzidz/2kD+f2dG0VcxHbQmH?=
 =?us-ascii?Q?+oOydU+nbDth08J5NjEXqQTS3l0HyCkjGRJlMCQvxZOd1os9ftJBLuDN8wOA?=
 =?us-ascii?Q?jOITfurEsReaUZlj3Y5mHoWGtoXSyoIbDflHdgqbcTT3qn6nkYGSalPmdwnf?=
 =?us-ascii?Q?2NDPoJU8QqCWfdc/gJiN43nclzcnATytQYPHCxufnNW32gV4lY1vLIBkhuKh?=
 =?us-ascii?Q?t6WK4grQ4oNRVNkHXrz/VVYJ6BwXUST0pG/6U+kO9AqyR9C2x1xjCXmUfZCN?=
 =?us-ascii?Q?7HFXhhD0s0IDs0F1G9pTKGGZfv+FFiABc9k0iHqVXDMEVWm/ZY+NbTPIcmTE?=
 =?us-ascii?Q?VljolCPCXER/qbOLLxjZqE6bLb0wc/+RIZ3Rv99JnaxwbyT9kuLQ0KppwkTG?=
 =?us-ascii?Q?eHj32z6zX6KP3coMC21V5l3HDciFuIIRgR2AdOEZsUi1AasMNy4Nv0ZWSFhZ?=
 =?us-ascii?Q?f86MSJ1jtxsd9oIRp7xCllcrm7Sxmft/wFGU1z7EAtp6vqqICMB89y6Z7aJQ?=
 =?us-ascii?Q?bt73+x256xVLrs2U3BDJyAHdqYomYo7b7DKKGAeYJ7fB9k2KBv4P5hVGed3+?=
 =?us-ascii?Q?2wAeiBg6mWuljJ8A+lWyjj6Vsy9h51HJJK2A97LFUL4TKHgG/baSG6tLsRNz?=
 =?us-ascii?Q?1kBh4Rd4H7CAjPFa07NWXaA9NTjR7btkJjAZPxNzT1JVwmnAugN7hOkN8jCY?=
 =?us-ascii?Q?Tv4V7BEFazB4/1rLMqjHKMsVdBLdojxJx9gX/fMbt3ms3KfeN5fZmfKGSNFa?=
 =?us-ascii?Q?q67auW3iCqOgzhoL0QBh42UPhmHqLpfW1auqJnjhfxS6GNOkRDm4PDL7Z1nb?=
 =?us-ascii?Q?/AA3Ls4qOQootNsVWYuGFAbKQJxmGAi7r3ecomQ1CzAmAyYgbOvdi3V5ccAU?=
 =?us-ascii?Q?agsCUrG+iPhyhUFjMQltOSZNTnDD2kB6TacUPPg2zYix/UAyg1DTyXfY922h?=
 =?us-ascii?Q?R7xnHa2sgCJvSoSiLXrCQvlFShspeBUe29QhybX3NSLR8usvuEZh0SsIIp8W?=
 =?us-ascii?Q?o5YJP/PDpLxocQLuv5pxfCmq44Q6MwJBchkdSd3hHAY9ZRbIjTmAB+aq5iGJ?=
 =?us-ascii?Q?tZpM9qOmmXmBIoUb2rWsiRrpsCjpTx8rUygSu3w0V/CkR30gEyVpk57ymNF2?=
 =?us-ascii?Q?OajssXgBN6EznrW0llL2VnVLR06DxvgPV1ZAe9bg8ikPKpB8mz40318LvTP5?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f65ece-9816-4700-dad0-08db361a68c2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 21:12:05.9999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXDbhIqEvCnoME/V3o2Vm24TStQ6ybrEQYu3c8Ory7K72ilQE+ebXb3o9dG2atKEzLWp0ZQMH9blcUomNpWdYX7fDXYvoLGcp4NuPQqI95g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add Rocketlake device info
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 01:35:32PM -0700, Anusha Srivatsa wrote:
>Add missing device info for Rocketlake.
>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>---
> drivers/gpu/drm/xe/xe_display.c | 10 ++++++++++
> drivers/gpu/drm/xe/xe_pci.c     |  9 +++++++++
> 2 files changed, 19 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index 5fab5b9fbde0..93da1c4757aa 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -488,6 +488,16 @@ void xe_display_info_init(struct xe_device *xe)
> 	case XE_DG1:
> 		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
> 		break;
>+	case XE_ROCKETLAKE:
>+		xe->info.display = (struct xe_device_display_info) {

in i915 we have:

	.display.abox_mask = BIT(0)
	.display.has_hti = 1,
	.display.has_psr_hw_tracking = 0,

It seems we are missing the abox_mask setting here?

Since we already have the RKL platform definition, it's better to invert
the patches and first add the guc/huc entries and later add this patch.


other than the abox_mask,
	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi




>+			GEN12_DISPLAY,
>+			.has_hti = 1,
>+			.has_psr_hw_tracking = 0,
>+			.cpu_transcoder_mask =
>+				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>+				BIT(TRANSCODER_C),
>+		};
>+		break;
> 	case XE_ALDERLAKE_S:
> 		xe->info.display = (struct xe_device_display_info) {
> 			GEN12_DISPLAY,
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 20be113544fa..9fcaf2255a28 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -103,6 +103,14 @@ static const struct xe_device_desc tgl_desc = {
> 		BIT(XE_HW_ENGINE_VCS2),
> };
>
>+static const struct xe_device_desc rkl_desc = {
>+	GEN12_FEATURES,
>+	PLATFORM(XE_ROCKETLAKE),
>+	.platform_engine_mask =
>+		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
>+		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0),
>+};
>+
> static const struct xe_device_desc adl_s_desc = {
> 	GEN12_FEATURES,
> 	PLATFORM(XE_ALDERLAKE_S),
>@@ -286,6 +294,7 @@ __diag_pop();
>  */
> static const struct pci_device_id pciidlist[] = {
> 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
>+	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
> 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>-- 
>2.25.1
>
