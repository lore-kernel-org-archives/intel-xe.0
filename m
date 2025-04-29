Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427DBC369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 18:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0305E10E519;
	Tue, 29 Apr 2025 18:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKGfZf9C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697A410E519
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745951633; x=1777487633;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P/36G8AN0xnrdMRlltGq24CwdBW8pBAAtmVaEIZF7S0=;
 b=hKGfZf9CK4Ulu0CUb5YN45X6HI76RHQQV7vS0WvZHd8FmwuhSSlMnKcb
 iuA+n0aAKk49Wa7DuzJtJby1Fki+mVhF7ZBKRE/8AMGxNDmj6VCFrJ9nb
 U5yLv0ScCnyBvPg+sDWHcQMJQ2D64lp3iFgzVpbT0KhDBKJuYngujoLuo
 QP9oWDNJ6rRbdNr1O2InbYfyBR+AXJwjTntDVTMdH8ufHNwLHhDW7geYw
 p4EczOAtiD5ZMTdLaZ+KhJgOGdCnuWJc2sCkbwQ9Kg7h6Rzt+J1G+q7Aa
 gFY2pw9Z7v2O8FFf1Jg2F0LZ5eMzE33NyuutgdsGU1d5wtNDk5Y1aP5My Q==;
X-CSE-ConnectionGUID: yYXHVEWKSO6D26iYNPRkPQ==
X-CSE-MsgGUID: YmaiBiY/SzmpGDEKoEQyeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47474018"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47474018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 11:33:52 -0700
X-CSE-ConnectionGUID: UoHEPic9TqqSWKtY85fgng==
X-CSE-MsgGUID: lggMLKrWRnugTB8m3u12GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="134409073"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 11:33:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 11:33:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 11:33:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 11:33:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9duqzJQnBzqt0xwgdojLlW9KR7PvDCJXybuebL8M+I661RHoiOuG1YBGJeaSLj40elWI7IsWpAbhwRT0AM8HjLQpcepvxIghS+cuNFObHIUnELNrFLGk/owz0ari5f7KvpDxyMJcmAKwqoQ/iMKGSPTA7PpfsZyzrey+Bi66N2gyTEiZXa8i97XFhwYVVgNgnQH+CQcJoPuCJrqpDRpP0aJCE1ogipBbogLz2v+Op+cJezyYwrcPPVVfZYJL30cseinUjOZA0m3YaK4bM7190xm2XfaYzSy5GRa0JbmcTtVIMgvtl+kcXkmqzoMnEGkqd3FgYSiSE5Ft5pGAngy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2yTMihbZTMn3aR91IqNNA1ZrS4qTEm8V6XIpM4AzPk=;
 b=YX2TsRB6L44968mimHQFZNCZC1KoqNhOXqvAKw2RRrIbvihE3imo2TxuCnweWaRcmkrImmAjGJ5PRO0N/YQDm8P1Q3xgfTI2V/SX8K410C5asfaSrAU2LIIvS85sK+ZXl3X0rZjPqjxtlw+NEX1G1fVc2U2hJ7sW8AwVhls8mA376qcwwWvikDTGVkfIyfSH8VGL9r7q8aldFD7YJsUtkARvO/6yey7jv224CqvuXbgmg+1H256/0xZSB5pvGRDz6AeXtPFDP6Gkd8UKUzXYkWcM5XHFnS0Z+ce+oe1ezWj1uaPuPYrwimm4BDsprRS4MTcDZNjKDGu67mjGfQ+/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 18:33:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 18:33:47 +0000
Date: Tue, 29 Apr 2025 11:35:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 17/20] drm/gpusvm: Introduce
 drm_gpusvm_range_find_or_insert_start() function
Message-ID: <aBEb3eB36nXXLIds@lstrano-desk.jf.intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
 <20250429104233.215602-18-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250429104233.215602-18-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:303:86::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 33141cb5-fd5b-4baa-0bd5-08dd874c6115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IyU7d1eJ0nUWXpbDd8abVBdSfE7YiqwUAq+tna1mUCTUC+DgABqZ8zZbNCon?=
 =?us-ascii?Q?XmAXJKlQQFWP0SgpOilxECmscDcpk93pp+R8MGrZ1/VfvJ7zO0qwDAj4I04w?=
 =?us-ascii?Q?HpMROc6K3OBpe5fEE2Lh/nwzN056qwwtcdWyHHs5ePcwBtQQpacO7QM8YjPO?=
 =?us-ascii?Q?WiOn0yKcuEtiALFTrrbjRD9pSTTRA3FPYpgpw37714gLL7tgN8/Re78MF0Pg?=
 =?us-ascii?Q?Ti3L4436O1P33sWfnL/XkP5cPPVI/2DLlWw8YuWkJwSyl1gUPZzDQncbfC6g?=
 =?us-ascii?Q?Sx90xG+iCiNa817eWuym6eFkvgyEy5TP5aZRjOyKCYMNWoe61Mfz7qBKIf9v?=
 =?us-ascii?Q?CjJs35/IZkc3ICuf7likvxnMK0YqlvcsN9LFhYoPgAcxzO7q5a2mul9msfts?=
 =?us-ascii?Q?yuF9wNMW6nT9lJScmFxlIF/WvKax5lOi3jAOmtHX3V+wHLbkBMD38MzZbwYX?=
 =?us-ascii?Q?ATQtzmds9kiWV60pzteer6s8MW+y7vDiVOXQQgB7zMyhQrnmSPozLs1Lwu9K?=
 =?us-ascii?Q?cOc4B8pLNpcUhoN2ixUxaV+qMifQvgaDgatvZGfHJCPxXLUsMp1t6F2wClQT?=
 =?us-ascii?Q?CeRDLGkU811uOpzVdkpTTsVIuCe19Hkx5JHtbFp4K6/NQZpkPzCcnLbGSACS?=
 =?us-ascii?Q?Vj2cTI+oUA10Jzqhm4mcpjmaP1UfeiXhHbdJruEnogSj/B1+zKe/TXiNPAaD?=
 =?us-ascii?Q?TD6ExwwTKrtAwdEScUG1U8i3X5f1GTr0nO1WiTOIzbRcoi4KbU8sZ8xAey20?=
 =?us-ascii?Q?gaQ1c1xbrBrtbsUPI0vxsAuGt1hXjKMFdfA8dF0v5wwu+jwtdFbUbZcJYqnt?=
 =?us-ascii?Q?6+/4DpunjySlXVy7bmtkjlcmWkFM4gHB48BZPK0LMw+xCnAcTNaLMC/PIQC0?=
 =?us-ascii?Q?MpiKnJofRBf2OBqV1JZ0xDcoZDsV7UkgY4omwA4R88BaNbrce3UC2cbphaiZ?=
 =?us-ascii?Q?Wa6pmdtvU0r7LhfRIY+HtsC7mjIpn+cAR29ZZ2S/LZUAElBq3LJSUlsNTcti?=
 =?us-ascii?Q?jOGyXbrQdciVVtwdaDMRKIScKVeOOmMf50VJDA2qJqTTylXF4K2rHCEyQnDt?=
 =?us-ascii?Q?7lpJzPm1a32B6/HhozVLxcQphOnE8Hn1K63OE/liuVoSX2HpJBcZ8p5T9TDj?=
 =?us-ascii?Q?idBVVdSBC/R7TFhD6h4Zjml8EqSOTYLdWLQqOestlC/IHu3RgnE8qOizwzHk?=
 =?us-ascii?Q?DKRYH4mW8qsASik23cM7DePjYH8d6e/fFrMSzAt8lLcjqtw4lmuUKAXhoiwM?=
 =?us-ascii?Q?Ci23tNAkeHCv3760ltuQKu5SIjXOdi1ei8u2/YYy6Zmofj3CXKHJIagNfDMA?=
 =?us-ascii?Q?gj50MG1+w1PQf6B8DfGq/zDkiSr44pxC544HxDkCckYkiv2GApV7OiUXaEY3?=
 =?us-ascii?Q?rYWSqGotdkFnbUb0/ocd2mfLZeikchjlrwbCUwlC7j4/5ZGjVrhpckOkGsw1?=
 =?us-ascii?Q?oF2W1oAqW1I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4aFw+9/+nAEVnPO7xSh66BWso8ZRaPE5xgD2MauT/EcVza4FQ8QLO4iuOUAE?=
 =?us-ascii?Q?EZNfObQRQ9KnMV2ku5If1TZdRimSh/Vly/uCy3nagS4ovbiGleiarIwbZVSw?=
 =?us-ascii?Q?mh2UosoSnIE2Zy+zq4NyRKvYz9/0PQnWttCicNin7LRT5CP2kl9Wa5oqrN9V?=
 =?us-ascii?Q?VgNV9QAOtZcXvn0wtE4UDVCbLU9mQhwpCChVwSeWaO6ZuejP5qDsxmCfRxcl?=
 =?us-ascii?Q?eakTkjvtIs2SkaAJbvmD3CalfSF1dCXDR3iAzqXR0PcR23vtQW51IaLit0s7?=
 =?us-ascii?Q?OnAdrTPLFisWa29s2GSHuuBttbRk27A3A7OlSjLnOLJM1EdpPgeKcZNKBlUC?=
 =?us-ascii?Q?s3E+l7R4lrS1xswMYwrPK5AEnBH31bue8Q7AjL7J/3tmAx/61k/inChXAOSd?=
 =?us-ascii?Q?jyjkKELBJBm02lnpQdsQz9TXaXl59u6m3yDGKKQ7QG7JU8TaLg7BlQnT/t7O?=
 =?us-ascii?Q?LZab2PQutRGQfgTAskOVSDPX4KYDuDALG+w8ERzZ05FxZXLlLogSDhcq39k0?=
 =?us-ascii?Q?TSvlD/ezFpJw2/H8YzYgALTS4QlJS62o22T1PTvcG8enD1NmpY4nqtijTuaI?=
 =?us-ascii?Q?PTXx8mLiCE7mSumlfB/7eqqoMxLVPMzrUo6/YLH1YAGjl+7mKT+0DnrAa+3P?=
 =?us-ascii?Q?8N/GRfSo+kfFvNAmSkijp0WHXVHrGEqiT5rdTM5SFgzpquV48LEv6oeifhJQ?=
 =?us-ascii?Q?OGiUe3EZwVJ3Rktdz8K4zAJPR8Y6Jj9o5I59mRXt8i2rsSDE4IyLYdbMTnbz?=
 =?us-ascii?Q?aX5QBKjkfsmsBzqlt6V13Irn7+jvs/hBbyG2V6vztnqdC85BIehYfSfS92aG?=
 =?us-ascii?Q?r9wZKm7QmWCzydBWxTopUDHYzIuosWcL/JeYLdPdGnaOaquTR+WZsfBUXoEO?=
 =?us-ascii?Q?VFSM+eg7lGLYB9jRPV3AeNVkC8EKA18/BiB0W0Bu+o0PiaG8fdfa2E0clt0M?=
 =?us-ascii?Q?rbalRG2qWYHtAPZlQcP4WqObYRV4fhM5DUnvniWxtey/vXMlrsi/jN9xC/o7?=
 =?us-ascii?Q?3iflYDkrMPGgavCUSDpojh6i9vMrV3crtb4sPjUMNnIcnuK5JGfVX0C95rgy?=
 =?us-ascii?Q?PswBF/lr1JL4k8zWthKWtmBjMfHInAYfUZEGhBstFfXmk8dmjzsz5kBiShKD?=
 =?us-ascii?Q?f9uQrPeEiqQrYeRTgVAIltL5Cp7R/8ygUnJ5yfnFv3PgNb0jebfJsMbw67c5?=
 =?us-ascii?Q?bBfpoM+V8D8cRCeoVwu7Zw22sffZqupoJepzyrKEcwDiQfHxphHisHNqIdRv?=
 =?us-ascii?Q?QG6rzk8mQMQ+26sBdVQpTg1x7l5RsUvVnCQoqkmvxVpWuktrUedaVAjo+3+H?=
 =?us-ascii?Q?497oYSxF8Z0OQAZ3a4COYSQU3PwlLz4D7Qu5U5ow/iI7ZAA8QFn0VirHF275?=
 =?us-ascii?Q?6UZJyOMt4XSJGlggjMzOLd1ZoW+nI0CgojpWpsCW/Vvh3EgAF2JryrEGXcGE?=
 =?us-ascii?Q?F7c6IlYcskXAMMDDi19f8IWTZwuyp3LW+XKBKwuo1OV+l65UTgxHXdJG1yGn?=
 =?us-ascii?Q?83kT0al+Z4UaRnjX8LIPTuIYfbahc+QvlbIjOXil0If7lmRU5UmNoiOu+b1o?=
 =?us-ascii?Q?9vP3a11ohlC6LDNvDkWg1ZSBU0r6UIWCFtD6F2tkmuky2PTzS2VHfKr5GXrD?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33141cb5-fd5b-4baa-0bd5-08dd874c6115
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 18:33:47.4258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3v9bDovuKsLHpVkkbjUq9zb0FKJUlhRuHkQwHg3CmEg/jsxcF9tlQYiIcGZ8RQXwjoIYIvrw8yonTHfkG5XGkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
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

On Tue, Apr 29, 2025 at 04:12:30PM +0530, Himal Prasad Ghimiray wrote:
> The drm_gpusvm_range_find_or_insert_start() function is used to
> determine the starting address of a CPU VMA within a specified user
> range. If the range does not contain any VMA, the function returns
> ULONG_MAX.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 29 +++++++++++++++++++++++++++++
>  include/drm/drm_gpusvm.h     |  5 +++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 40a56f38ff8e..bb7c589b8d15 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -980,6 +980,35 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
>  }
>  #endif
>  
> +/**
> + * drm_gpusvm_range_find_or_insert_start() - Find or insert start address for range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @start: The inclusive start user address.
> + * @end: The exclusive end user address.
> + *
> + * Returns: The start address of first VMA within the provided range,
> + * ULONG_MAX otherwise. Assumes start_addr < end_addr.
> + */
> +unsigned long
> +drm_gpusvm_range_find_or_insert_start(struct drm_gpusvm *gpusvm,
> +				      unsigned long start,
> +				      unsigned long end)

We don't really do an insertion here, so maybe:

s/drm_gpusvm_range_find_or_insert_start/drm_gpusvm_find_vma_start

> +{
> +	struct mm_struct *mm = gpusvm->mm;
> +	struct vm_area_struct *vma;
> +	unsigned long addr = ULONG_MAX;
> +

Hmm, do you think we need a mmget here? I'd expect this be called from a
user context where we'd have a MM ref but maybe to be safe add a
mmget/put?

Matt 

> +	mmap_read_lock(mm);
> +
> +	vma = find_vma_intersection(mm, start, end);
> +	if (vma)
> +		addr =  vma->vm_start;
> +
> +	mmap_read_unlock(mm);
> +	return addr;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert_start);
> +
>  /**
>   * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index cce217bc136f..b0e9ee5c6226 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -315,6 +315,11 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
>  
>  void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
>  
> +unsigned long
> +drm_gpusvm_range_find_or_insert_start(struct drm_gpusvm *gpusvm,
> +				      unsigned long start,
> +				      unsigned long end);
> +
>  struct drm_gpusvm_range *
>  drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
>  				unsigned long fault_addr,
> -- 
> 2.34.1
> 
