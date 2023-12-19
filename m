Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAA4C46CCD
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 22:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6ADD10E20C;
	Tue, 19 Dec 2023 22:58:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9D910E20C
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 22:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703026727; x=1734562727;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4reJoM+kmEzdH3kngANpTLA7+UyMJSyUoPFd000q3RU=;
 b=l2iJmUZr9EyQKEKwADu5RwpB48VGh/yghS5PVVN3yIIr70a+C7TPpObV
 P2krdmGy8cA8+zahjlebobL/6gfeJ9hpYdb12y9sRu1242zXKm1nsppDR
 bV/QZKAm4oNFsi2rJ4Ja6RJ8Z+P6guPkMEV7M8lGXLNk+sA+N/XF7PAd/
 xqLHMig0Tmp9p+z4++TRo9ubVTvuDzGj2Kt63V5qll8db3d5zG68gIbEI
 t1ghE6wQtmuB3bzKN52imgUGG2h8slczhBZunVsGf0rlFAm7f8FGJVCvb
 8w+gzvBu0ZjkimqKtwOlC7C/6B+1LWrVvl70mTRCniDomV0Sc4AZ+suJU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="398515881"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="398515881"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 14:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="810383006"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="810383006"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 14:58:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 14:58:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 14:58:46 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 14:58:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/gGE2fzvSSYe7w7HJD3CKVXqIoaJ/2F23mwcaa9V3JvxCdr3fd1+hjknwbefJbFPZhw3mJ1Gw8O2rhgeb6ZKW87FNZdJeY8UBLc+T0C32NCrJaPjqAFxjxd1c+oVdKnZbP304e29URRScsz3hS8To9ZM7WF+ZhhbV3jzk7gN83iSosvhPbA0pdiJCae+YKD+n6WtY7ilXQ90gXEXhW/Iz5qG7nXJKENDH+XBPfC9j+Zu2gJwHBSJOBHOhaCDqDj1mfmP0hOpqrLGy00yjNdxHNQl64lJ0bS+/hHyYkVKcprd/tEvhXB4krR+9TUUmMhoEMKsxgiFrgAxZ9NXxP+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk8N6ZwmdJz1vLtmDHSVsUgdBGMxPaT3ntJgshdvMRc=;
 b=cf3pGmvJXdtJcO/0kmVHinnZwCZcL8GCsNc/XR5EnRbFYWvvSNYSbw/+jfP6MU/IZNhHsF4vJnCJYUQey37pkCTrepXTmzwIiIuw12WHrWkroRpuXGu8SNhxCfJc5uAji6ITZ5ik/HvyUE998tY2g1NGJBTHDMceH96EZrxBq/BE30HEf4q+Ggzms6Z8wwMnYEW4+qLYac0qT+pLS3nlwqX2itH3nt7dJUHPQiVdd3ej94Y4g9b8PFO1KBJkvU3qD3rKFgQIR+JIA+MoNe/iuHouqOvl13A3jompaCHspherLPW59PC21oJBPoMoU/efZsb1/9aWSCyQ1oBhn3NDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.36; Tue, 19 Dec
 2023 22:58:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 22:58:43 +0000
Date: Tue, 19 Dec 2023 17:58:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Remove ci-only GuC FW definitions
Message-ID: <ZYIgIBhBiIEQH6db@intel.com>
References: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231219200023.2502159-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY3PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:217::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 0016e1c4-8675-4c4a-7914-08dc00e60c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DnREgvwRCay1rrjASwZfAEFNhvPQv2n/ZKFqUwbFBunwyF9qQRSWRsSKgpRG1cbP8tFnGgUJ14/sQWfrkT0acdiFT6jt/RLlpnQVVeKp8oQf8Eb2gpZ1VihWEpKbq8+wydJa+e4EBewEoWi5TS3PGACMK9w9QZbyMLTSTP4/tF/WCEPgvr7RFAp+4g6piH6iAPktjJsFevIjAs9xAagRwQLm+m+QeKOdMAJP0KH/xXXUDXTVV4qVIUr5Qbgv1lA+i+rRiV8QokYTs3LUQrVqYrScnc2PT8f8JSl3IcsyAKoyXcdI59FrfOy6Fmjv8KCrM+iLDdY2e3xF+hpAoG7H+OtszESydWP+thmoSP1q1AmboSBbAWeED7l3O4fHmhryyhM8ma7pya1bNDiKRFORbZQbsmjqLrACXllpblrIlNnvbgzeAa8mlMdCAadmb/3QG8WN6fbLeQngdJizwmOYbcF4EwTaxYWK/mgTAYZH1xYljewLnUYEd/1KoN7q2a6kHXdY9Cz8AgzBVN63jX9uvnve7+kHzoX3mA5gYF4wBwk1k5tGywoRWcpmEfvBbsxt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(5660300002)(41300700001)(36756003)(82960400001)(86362001)(26005)(66476007)(6486002)(83380400001)(66946007)(66556008)(6636002)(316002)(37006003)(2616005)(478600001)(6506007)(38100700002)(6512007)(4326008)(8936002)(8676002)(6862004)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wkw+D3OHyJyCJwjhvDBP7QdvGXU2fJ/DFpEWoebFXJnM7eqzpar0C2slWioN?=
 =?us-ascii?Q?h/ZtVa1Va+anuh4Fxavn5KCyRZhIZvH9SxA4nU0NvCe6e0nhkr2ztdLHufr3?=
 =?us-ascii?Q?kxrx5cc/5vra/a7Pjco9y59BKesHD2x4MfOZdgP8EEjiBC+nQTsrW6nZF6i6?=
 =?us-ascii?Q?UIFwHhMMaHOMmLYRFgoAo0TVFdAmhkxsIWG+4S/QPLngn92CyE4GmLazyMUM?=
 =?us-ascii?Q?YKZlh3teqCfWdfbnafw9S7zdnQXhY4G58nZnnoKXD8VSnHt2qmfenJyp2esz?=
 =?us-ascii?Q?hyxMKE8UAtgxOJrURTUG3eTXSe2Bi7szABsYPE1fuq+9gDnPT90fTsAqahyj?=
 =?us-ascii?Q?3AvZHoldAHherEv3yz1Fij53/Xy2ugry6uNBrxe94V7J+FkD8aGyUcIYZ7+Z?=
 =?us-ascii?Q?KmYY3479Mv0wJp70NnXzgmFHLURvDPjSogWGuqZK5Kk8Wy5yURngczkOQkjd?=
 =?us-ascii?Q?yPZN7NPrFpr6J8YPAkDlFre5nw6QWlv9shWS+x9c36cUlsss2EX+7cE+lQLC?=
 =?us-ascii?Q?yzpGROwCyMBEqs+sGdeW7ojjcTJdPuT8vHnFlJXZqEJv8ZBCjUQuLvNpqaTj?=
 =?us-ascii?Q?Wfh6pJXmHuWHoP0gzv9e18+JR3mRZfc82agkhoZ4Fye/wCgZNkhlSH0NVZP2?=
 =?us-ascii?Q?+N4UpG8wXXO2IHX9qK+eJchOKExu7dxO9MW0AUbfHZwz87N60tjIydGKyBUP?=
 =?us-ascii?Q?NkoMjeLyone/44ydAlREh50PLMlcjjq4KwZbnNYkTVnjmfMF/lvG7xphXzlg?=
 =?us-ascii?Q?Fp2LRPPNipicsXHUylQD/J2P9bCNRq04UcKN15b5qXyHrrmwbupovx/+sJGx?=
 =?us-ascii?Q?p1YvoodYNuJy70EZcZsCypAF76ec6JeDAef5cxBL9fU0xoKfFYhyLgsHAzzU?=
 =?us-ascii?Q?7+qUkkJ885t+ZeaYAqcCHsGmY7NL2VJOzp1LTXo3R3QPLXH54woyrUCYj8ZE?=
 =?us-ascii?Q?zPtoxuW66dYpm9oYIn4zIM4CppAPo6lhZPtwJUrhmFaPrA6ZM1ZAOyuVrgAp?=
 =?us-ascii?Q?aF6xn06H8GMwPlkqzNmSTDsVeorXVwF4ib0JL1QWT2qeApTvgdUoGt84MM43?=
 =?us-ascii?Q?B9ypSTUucjge5i45gPyF7WAonhFw3pAFxjOKBUcFd4IbgH36mPeQQxqBWqBA?=
 =?us-ascii?Q?oIUG176B8GfAGRptLIZn0vRy1fST9+eokcGy4vqO+Z8fqnFr8hpu89aID2Fu?=
 =?us-ascii?Q?RExdcYjLtIpeEycRLGNXYwu7Y6oW91/gpbDadQNLYQ5gu1YcxNHjny9obVSm?=
 =?us-ascii?Q?TOMDv0jlEzHhtyEVdtTRqzRerrQ2TsH/+Bgjb9vmmzdCJFkwynJLeTvW+T75?=
 =?us-ascii?Q?Wh+JqtbCCXdBUt+RnvK4B69VlfBRVc4KQsfT124MhJy0hiyEBGNb6H6IWxpW?=
 =?us-ascii?Q?x++NLPM5tBiUPT1FLHqD6ncczlsFe2f1Y9coxXMCiOJkkrdTekYsb/q8d5gb?=
 =?us-ascii?Q?XjwoAabRL9uz5Uj60DHqjWcuTI6ZHAnBRnKarrt/ojQu7Ogs23VMHaHnSPEk?=
 =?us-ascii?Q?/DqDLlHlvabj7vYhbAZ0109OZpqzw+SbdhKzSYFLpLKro8wC+eEwingSswZV?=
 =?us-ascii?Q?+vMCZ5eAi3uWGOZAV3b8yCiCxTfY12Bx7aAXVINK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0016e1c4-8675-4c4a-7914-08dc00e60c02
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 22:58:42.5702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H577vsPEJ+q2rdPAa5eV/+NCQBbIvaXCJnWRzx86iS7IUUiTOTd5twTd25i5wM9KYu7Ghb5ZF3wKoBy9cOtpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 12:00:20PM -0800, Daniele Ceraolo Spurio wrote:
> As part of the FW definitions, we declare each blob as required via the
> MODULE_FIRMWARE() macro. This causes the initramfs update (or equivalent
> process) to look for the blobs on disk when the kernel is installed;
> therefore, we need to make sure that all FWs we define are available in
> linux-firmware.
> 
> We currently don't plan to push the PVC blob to linux-firmware, while the
> LNL one will only be pushed once we have machines in CI to test it, so we
> need to remove them from the list for now.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

For the series:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and including it right now as part a respin for the pull-request

> ---
> 
> This patch is intended to be added to the PR sent for drm-next, with the
> FW definitions being added to topic/core-for-CI afterwards by the other
> patches in this series.
> 
> Note that this patch remove the last uses of the mmp FWs, but the
> support for those has been left in because we do plan to use mmp tags
> for early FW drops in the CI branch.
> 
>  drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 73d6938c921d..9dff96dfe455 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -102,9 +102,7 @@ struct fw_blobs_by_type {
>  };
>  
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
>  	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
> -	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 9, 1))	\
>  	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
>  	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
>  	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5))		\
> -- 
> 2.43.0
> 
