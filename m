Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B392BCD343F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 18:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EC210E1CA;
	Wed, 12 Nov 2025 18:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVb/RqzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0F410E1CA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762971665; x=1794507665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P9RhFFcijKDf3tRPua0RV26HkHMPrxya0rrDBo75IGE=;
 b=aVb/RqzXwnDiM7ewGwu5phQqn5XP4NhI/6T8DuM8iVJUHqKHkKoV33Wh
 GpmQRAP9syFP1coksl7QoVe1jKtDUYcrhbiGruT1chIYLoq1hHMwXGAgI
 j3lrJA16q3BJ8L3ffrvEs0HUiFb8jzeeKWoW13hT8VkrnbqHrXv/aSzvY
 2qlCfUENmUvBxZxHY0Jl57geVqKLW7OOWO4GLgfVkriWpuGtcVw3QT3nU
 Djbwwxzf1HevpCq1HLNuGkfY3LOHOIKczR/bEUBtwQ2ceT9usmEl9fEif
 mCEY1vS5OMoEhPr48RI+v8KEv5sCS+qwbcUFgRPAkAWL+lON60PJxsSJV g==;
X-CSE-ConnectionGUID: SM/Xb+hiQW29310C3+PvGQ==
X-CSE-MsgGUID: GTabmC4eR3KOd15emXpiWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64967663"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64967663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:21:05 -0800
X-CSE-ConnectionGUID: gh+l8X/IROmwu+T+/HnHvw==
X-CSE-MsgGUID: qO32aTSlTeKV6FI7PAI00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189063174"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:21:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 10:21:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 10:21:03 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 10:21:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnCvhVaiNXaBbsuJM71HKoN1E6wRXGB+c8R42f4nkITS/QVOjx/YzfH/CnrghTyeo4YKYxE33tbXi3ky6JEQ/6xM5GWQURFLNquxDqUZfZhfUAvWuE0Fy8r5umO1lbVjQkE9Zb0Ejij5sVHQyI+z+m9s+pgsWQHKJ0uQLoK9aHxm16V8P+o+oOtufqyFlzoevr95Ep0oo+Dtn3W8WZbuXq2048tzQVoc9FI9u8Qp1XHsmopq/MfW3lBbmycX4QwuvbRIANsHc6wR4gK0GzrU4OaNerm5q66ofD5iK7RWoblSKSD7uuy0ZIFruVYbNGs2J465i/lJ+B18fIbMBTJEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU0qRxj383jNo+JzOUozDbwmqMyRrfRS1HYaiiWYNm0=;
 b=YyVVwMc/G1l+mAwbiOrmOBgoN/awFeyEYgPPbcGpdHnlbA85N2IWUfqJNbzc/f9X2+UfOoynAnkAUv8Xb+MPBbtfFsl46sAipLNQCfszo3LNFywUqwdimPRpiHICLTJBzhuQZaVMsVzKz9vmGzNkJ3DK41md8bM4uJNy/VXcXb+zOnYS/MwqkFcKmQny9M9iJ0davS9uu7fGt64Dj8GYQNlGJ18cL1FFKP2MmVj1hSWY6nzQWPy1Gf+BzrMOVWuEAW1jj6TzPsiAB5fSzre0WH2cMRSWgj2NclCCmAAfYk8proq73Toxm0lXi3Z/6kOG4qKzO12nwDW/KFe8b1Tp+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 18:21:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 18:21:01 +0000
Date: Wed, 12 Nov 2025 13:20:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe_survivability: Add support for
 survivability mode v2
Message-ID: <aRTQCoNGUf_D0f1F@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
 <20251112103336.1468261-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251112103336.1468261-6-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8faab9f5-659d-449e-fa71-08de22183c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l4tNDNbKlKJJg77ONOjkOHKACwF34hI+FsKmgQke5pPSc3Y5CeyitiTA5ioz?=
 =?us-ascii?Q?dIWU5tKmYn6XaH6SUbl2ToUYpasnEZNQcGvQF6GX7CKEMai+B8jJ6ZCfVnLT?=
 =?us-ascii?Q?l39apqYGAP352+IJy9fDJvP+RBCFRnVrTcfPxS5kBnZjBh+1gvhNbJQtPGdv?=
 =?us-ascii?Q?ooORxTc1flce46oy+urEQcOYPoNC76K+RfVFvdOnxOuH1XYYPY2Lbf1L9nHx?=
 =?us-ascii?Q?rcHwSEIcrRR3z20rh1zmuNXH4DBWyuhWMEcfIU5ibo7mphENo1HtsLq3Qumw?=
 =?us-ascii?Q?zB42IEwClAg9wCuamUT5gDQk0aXBX+pw33LxHySAdFKyJUYuxroGCFKlvxrL?=
 =?us-ascii?Q?9J+zWhqqBk8swLEa3q3zUE4Lt112+7oXAmsoNjuQ9mGUOcc2tMb2G9jRQeTT?=
 =?us-ascii?Q?FCLul5BeGNC2NDlGw8j1+cb2piA2cQaNsbpvo2q1tDupmFdfbcjvTSv5D9+L?=
 =?us-ascii?Q?SxvBMR70DHWtFG/lKfoFrFrjwj7tKNnuT5yXKFT82PyHcwedICQdxJdB+/Z7?=
 =?us-ascii?Q?qCuFg0sVkkWq9IoRZJnxrs6dU3/P/07pQ3kzOP7Nbl3SUdpCxxdOeCPQ7XOm?=
 =?us-ascii?Q?LK9v2ZCEbbb6rzgu5JDwuxcpF+vHJx8ECB6htkhD0t1Ws+tZPinyVTpvc9Vo?=
 =?us-ascii?Q?Q2zgo+ncs0BNV/9KDLa78PW3mhUgg2FhPQ9VPgrr6YM0EwAZHKbuPDJJHfGV?=
 =?us-ascii?Q?6q7j4B3awntJVm969eNUVLH/A5Q9aaVOPQM8XBTyd2Wys0xtK91rTBTJxp6S?=
 =?us-ascii?Q?Iw2Lf8+W05VeB7PKrJWZSByuWKQKXS6We9wbMOrs1dPEbi/aktIsKJ6mPjKu?=
 =?us-ascii?Q?a14jioVx5aWWu+wDY4DPa+n4bgcsNwFn8Lc37BoG8UJrZSO+w9ufrqHnBNHd?=
 =?us-ascii?Q?FwsnmOxGYovetvyk2AHsuQEzp+Rq45taYnMBYgFN39H8LNm/WVRw5G1Z/YhH?=
 =?us-ascii?Q?+Ep0WnyZ/RpRURVL0+51GDkb81jmoJvR/g4BVOkGruRPmOIw8NXW/CQEXUx3?=
 =?us-ascii?Q?q4rKBWqpw7LXIvkTzMH/XLM9Vn++K9cQmpDuVuKWzOOHqxLM0hwpqoPkLEdf?=
 =?us-ascii?Q?1lsTYZ9ULpEsaefbQgX9UBjxpwoLGMBIj0fJx8b/FvEm7CjGgU8CLpRl8TeU?=
 =?us-ascii?Q?etPxsooxBZ7VxJt488scREB2idbMC6DU4WIvNQSX6l3h3iOewLtCrOPz+FPx?=
 =?us-ascii?Q?k62ZkSPSiHb3pkbQ9lLpjSHYwKYZ2ucyKoZNG3qETUTlneUkCH1RPu3eOAcM?=
 =?us-ascii?Q?agVojOc2RtyRtFqlIZx3JWmWqzBI9C/J9mZBnXlSLhX4hPLj+yw8lo1qVYxU?=
 =?us-ascii?Q?UBLvfhoec5ydHUuC6xsx3YqNj2boy3Q2MJRsCTpZ+hIMSvAXYszftjV5hHCJ?=
 =?us-ascii?Q?/xQeCukbCMIA1Xuif3NAzNfl9+TgP4pbq46knWgxU0/YzrJBGzoPBbdiWLQa?=
 =?us-ascii?Q?/RmqR86l5Vzjw4DOx+KjkVDpqyVTmEez?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?feDJbydV0PyhNb6VUynI9Qso0YHeMExTMr+HItmJs3mat5YLpp5CfW7fNLDM?=
 =?us-ascii?Q?Ek07F5kX3UB87BrAV2VPBr8f0BQSptXCDpg/nK8Ujw8sntswN/UNjEdA9Fa7?=
 =?us-ascii?Q?3tPW0UkdIcWhipjCC3VOjJsXsbWZ1ObQYoF/Zb2iaq7SYqruUWJEK518Zb7i?=
 =?us-ascii?Q?MmLbd6STOcTt3/nQkP2HEKXZ9m80KVF3E92WMdUJsVa+6FlhwlNeClIKZbeo?=
 =?us-ascii?Q?qU79g/ZEd7jnP4V6zQB/494/Fmj+Xl3OWgvW9j6G0/ELyAVn1dSwFQRE+3dV?=
 =?us-ascii?Q?3CpqNTnSBBYAoWFkXYkg0a+ajY5lKvIb9GMrc2XAAVZzMDwB/stY0sBjDRc7?=
 =?us-ascii?Q?FLmxtA0nM6Tp3ztnBI0TWuqnkfi+T+88jHt/qEnuOnDg+k4RwEooGjsxnEY+?=
 =?us-ascii?Q?zsdiRrgJdUlDAOdXOCNDzKK5JSTGOM7+eFdoQAX39owZY29g1N7NzooLCAWa?=
 =?us-ascii?Q?RlPwNH7hpRiyUDs/OjiMWgip9gfqEbfr9K+uHBpO+tkzCHhetU5tb+hr26Ld?=
 =?us-ascii?Q?YfiG0j67wBtTLCmayN2Z/Ccm+DGk0yATAyk1g7BSaFkN1cmTBAOwnk+sIGgq?=
 =?us-ascii?Q?s3mJzAhskYd1JY3dT8v6WfEDcfwK23VntPiYcMIR3zN1nxLhrY27OVTJrVgR?=
 =?us-ascii?Q?jee916QkzwQEZMWp1WgFgDy+JR7bmYu2VEhaR5a8kbbeE0q1spudIGoAuWrO?=
 =?us-ascii?Q?D2MSY8AHwdl6gYd56mJJ09LjPVMNMCuFKf/X/jZ12AML78Kezi5AepVa2/Hy?=
 =?us-ascii?Q?Lm3FtJ0fpvBXvRiibV12/SC4e1s9lTei90SMhtQSsSmUZX5/G3nZvKl04j5O?=
 =?us-ascii?Q?2GZJc/2G8p1G0PGN1NVM8SvId1gzlbzn4pjNcv4tNh6eiDs1zzZXY/M0fvfs?=
 =?us-ascii?Q?qVKWdwYWFA4xyVhqLfm78TvmPCCMS4UKPYSbDyd4nMXOyMm2BnZU22O2pZ5i?=
 =?us-ascii?Q?FWKcSYmaINBuXcSCPUPDYUEb2hB8pCFoBopRYsbyCfzw1bP6iMEqbJUK6hmu?=
 =?us-ascii?Q?awfk2Hh8kHxrnXu3h4djRHvZMmtq0954JOMnvY6ugpQD1RPEOCoLOFakvS1Q?=
 =?us-ascii?Q?FID+SbgeRFfTvDeGHR6jXrLJwsV0VMxXZPnyVxHB0iPnN39yPbx1joaKB/Zl?=
 =?us-ascii?Q?1Qckg1WgrkD7YgD6cBRp8S+JV1mqMntzmAeUN7OOkf75D3KrgqJVtdJc8G/R?=
 =?us-ascii?Q?ytqnB3Nfrg+zICfawMJ0lDlgssNn4tki4EavpqkCpE8rfN3wH7pBDH72LXId?=
 =?us-ascii?Q?Y7rTA5JtCRI3IKMUIqCHgyUbBOZsf5Wy5ahXPqB1VtIr1mHsVwUxK8/9szss?=
 =?us-ascii?Q?ncYbRcQZ/Ft7CllHV8+YIFiy5BAKOkW85tI1bO9tjUjcyUNRehsBLuJIYocs?=
 =?us-ascii?Q?QowcPYkHZJbhrM/8SdJOoVOgOPsLxE/kllmkk32o9qyyU0W6HUdUBWtMuERW?=
 =?us-ascii?Q?4eUEIli77wGumqdfjE8JfTgNr6HWbfoz3o98TpZbyTbyKjfPVAEoymkAh34j?=
 =?us-ascii?Q?L/9rwfmbUu1d91uZ4w0lV92vMhFpL5W8Xr6ZJTUlZYlFOSM+RxYPt6DXqe8N?=
 =?us-ascii?Q?b6v9ELKoYjJx2hOXuipa3aHzzonI2oFYuGcXK3rh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8faab9f5-659d-449e-fa71-08de22183c07
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 18:21:01.7596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jT2ietihK8nU1fQh2NHO1ODYv+X4cylmpidRVn77hkf/jQlPKf6DiKJrK2EujIoS44Mpq53oeBd+djbnFIy0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Wed, Nov 12, 2025 at 04:03:39PM +0530, Riana Tauro wrote:
> v2 survivability breadcrumbs introduces a new mode called
> SPI Flash Descriptor Override mode (FDO). This is enabled by
> PCODE when MEI itself fails and firmware cannot be updated via
> MEI using igsc. This mode provides the ability to update
> the firmware directly via SPI driver.
> 
> Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> 
> Userspace should check FDO mode entry in survivability info sysfs before
> using the SPI driver to update firmware.
> 
> 	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode
> 
> v2 also supports survivability mode for critical boot errors.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
>  drivers/gpu/drm/xe/xe_survivability_mode.c    | 41 +++++++++++++++++--
>  .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
>  3 files changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 92bfcba51e19..d41f07f9194d 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -77,11 +77,13 @@
>  
>  #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
>  /* PCODE_SCRATCH0 */
> +#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
>  #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>  #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>  #define   HISTORY_TRACKING		REG_BIT(11)
>  #define   OVERFLOW_SUPPORT		REG_BIT(10)
>  #define   AUXINFO_SUPPORT		REG_BIT(9)
> +#define   FDO_MODE			REG_BIT(4)
>  #define   BOOT_STATUS			REG_GENMASK(3, 1)
>  #define      CRITICAL_FAILURE		4
>  #define      NON_CRITICAL_FAILURE	7
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 3d9417911c33..d22fdd08d227 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -16,6 +16,7 @@
>  #include "xe_heci_gsc.h"
>  #include "xe_i2c.h"
>  #include "xe_mmio.h"
> +#include "xe_nvm.h"
>  #include "xe_pcode_api.h"
>  #include "xe_vsec.h"
>  
> @@ -66,6 +67,11 @@
>   *
>   * - ``aux_info<n>`` : Some failures have additional debug information
>   *
> + * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
> + *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
> + *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
> + *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
> + *
>   * Runtime Survivability
>   * =====================
>   *
> @@ -95,6 +101,8 @@ enum scratch_reg {
>  	MAX_SCRATCH_REG,
>  };
>  
> +#define FDO_INFO	(MAX_SCRATCH_REG + 1)
> +
>  struct xe_survivability_attribute {
>  	struct device_attribute attr;
>  	u8 index;
> @@ -131,6 +139,11 @@ static void populate_survivability_info(struct xe_device *xe)
>  	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
>  	reg_value = info[CAPABILITY_INFO].value;
>  
> +	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
> +	/* FDO mode is exposed only from version 2 */
> +	if (survivability->version >= 2)
> +		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
> +
>  	if (reg_value & HISTORY_TRACKING) {
>  		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
>  
> @@ -193,6 +206,9 @@ static ssize_t survivability_info_show(struct device *dev,
>  	struct xe_survivability_info *info = survivability->info;
>  	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
>  
> +	if (sa->index == FDO_INFO)
> +		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
> +
>  	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
>  }
>  
> @@ -210,13 +226,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
>  SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
>  SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
>  SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
> +SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
>  
>  static void xe_survivability_mode_fini(void *arg)
>  {
>  	struct xe_device *xe = arg;
> +	struct xe_survivability *survivability = &xe->survivability;
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct device *dev = &pdev->dev;
>  
> +	if (survivability->fdo_mode)
> +		xe_nvm_fini(xe);
> +
>  	device_remove_file(dev, &dev_attr_survivability_mode);
>  }
>  
> @@ -227,12 +248,16 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
>  	struct xe_survivability *survivability = &xe->survivability;
>  	struct xe_survivability_info *info = survivability->info;
>  
> -	if (info[idx].value)
> +	/* FDO mode is visible only when supported */
> +	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)

should we also make the version a file inside survivability_info?
for explicit check instead of implicit?

> +		return 0400;
> +	else if (info[idx].value)
>  		return 0400;
>  
>  	return 0;
>  }
>  
> +/* Attributes are ordered according to enum scratch_reg */
>  static struct attribute *survivability_info_attrs[] = {
>  	&attr_capability_info.attr.attr,
>  	&attr_postcode_trace.attr.attr,
> @@ -242,6 +267,7 @@ static struct attribute *survivability_info_attrs[] = {
>  	&attr_aux_info2.attr.attr,
>  	&attr_aux_info3.attr.attr,
>  	&attr_aux_info4.attr.attr,
> +	&attr_fdo_mode.attr.attr,
>  	NULL,
>  };
>  
> @@ -301,11 +327,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>  	if (ret)
>  		goto err;
>  
> +	if (survivability->fdo_mode) {
> +		ret = xe_nvm_init(xe);
> +		if (ret)
> +			goto err;

should we really fail the survivability mode here?
Or keep the survivability mode with some indication that fdo/nvm has failed?

> +	}
> +
>  	dev_err(dev, "In Survivability Mode\n");
>  
>  	return 0;
>  
>  err:
> +	dev_err(dev, "Failed to enable Survivability Mode\n");
>  	survivability->mode = false;
>  	return ret;
>  }
> @@ -436,8 +469,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>  	if (ret)
>  		return ret;
>  
> -	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
> -	if (survivability->boot_status == CRITICAL_FAILURE) {
> +	/*
> +	 * v2 supports survivability mode for critical errors
> +	 */
> +	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>  		log_survivability_info(pdev);
>  		return -ENXIO;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> index 1ed122cf62f2..d887b443b397 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> @@ -37,6 +37,12 @@ struct xe_survivability {
>  
>  	/** @type: survivability type */
>  	enum xe_survivability_type type;
> +
> +	/** @fdo_mode: indicates if FDO mode is enabled */
> +	bool fdo_mode;
> +
> +	/** @version: breadcrumb version of survivability mode  */
> +	u8 version;
>  };
>  
>  #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> -- 
> 2.47.1
> 
