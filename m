Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106E7C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 21:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2D610E2B0;
	Fri, 29 Dec 2023 21:08:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A4B10E2B0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 21:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703884118; x=1735420118;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KpTM9gvIp3GD6C20QIbsEiceyuxf51OCN/k/jjNOLhc=;
 b=RfWFGI3AVLmnkyfLCYRbhkVhtHJEM6TKtxtzjffPaXrC5kxHJPoVXUdn
 0quMMNkVhzKDo8swcJbPkHCoJv9YZHUj/TVrpdTmwo2s38BE50ZExNz8a
 mFJNCLhaEyThdXIe4/RITOogMbg9qBWPiVh7jjsKJYyxiWpjzb/FMOesn
 CK0kZp3YvFQZqTCTtlYUsiXaaoq6xssWDEf82I3KE2XbVA0XbLPGGhxNM
 QcMgWRUaW2z9QeiUqZSvlV5HYvTpS44hgRHygeppazVvw376/EE1UA6PS
 SOTsRQDJwKy5onU27OP2O1TVrCUf+JTRqemrYvrBSeAPRTzpjpwfXJeEJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="396410302"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="396410302"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 13:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="13366671"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Dec 2023 13:08:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:08:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 13:08:37 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 13:08:37 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 13:08:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ir8No/K3qGcFKkluc342YhTAhAVUBvI24hnKxS2VBBGLz5XWWJ8NVKEvzOkKzR3SYMdOUIhd6T6wvTIq9lga5MEKzmt287ryATshbUec1mH1xSGkz20RSN9e4Nhb7HiFgknZ1Jc8SYXfzMm2jB+EbtIKmhm6Dme6b5FgU6ppEGbnul4+X/rG4ZqFbucxsEWJ/f0z9zTiBAcW7xdWpgP+xArKzhaJvL2WtfHG2kIbrFDw9KjOLDnIuAgKBsTGxBCW6FVRyS7ysF9DaXM1TG7Kd0Elk8y9dELrmX2r95ljE6yeUslL5N0YoGZz+Z1dK8capCfNC2HdsX533klCTE4O2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3UgDmF+jBTWQqJiXYtEiDGv1ShhdJrPtaN+E1mXLRQ=;
 b=UcQ3Xji0xZN4tItNbZo+6o2Bj4z1aMvefP4kdiT+yu9/gi2z9I74XNW+GD5uzg3DoajzhauwhoXlHOPmiH8BxP6e3VztREHAd5iqcjCO/qK6m/MR4SFTRGhUUms/sjZ/SIniK9x9br6+LyVE0WwmedI2MNnuJ2NSdOo/Gv13tqOmvvEpFwxo7raJ0xpCyevQ9wbucXTV1dWOTMHUAyvAtZKmDNDMbGtzN06p84bp4L13+2RR6+h20O4TT1ratSoSQq9ogs3/h8RVsHufigGfKjMyZtqBRtU0hChjt/t46300rqFM8E7HWIubViqX6DyLjP4mONzfWDMPScnb24Y6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Fri, 29 Dec
 2023 21:08:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b30b:545e:3b7f:9626%2]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 21:08:35 +0000
Date: Fri, 29 Dec 2023 22:08:33 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 04/10] drm/xe/guc: Add helpers for HXG messages
Message-ID: <20231229210833.cphh32yxvqrckyfp@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
 <20231227235838.212-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231227235838.212-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: faf6c90c-afc7-439e-303f-08dc08b251d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rsU7hsZN3CtIfN1HQQyCyFzHjczDnWrbDj5BS1QigarM3rueBHn745GPuc5cdcQui/DSwBxnSxfO4k5gtaDlQpmIt70X5V1V1W7AhWdmAod7OerEE49zkJK9Hg7EfQG2IbWjep673SKeEqMTQRedsFBFo3r7k6kkk0f4xHZUwxcKtK8OuwviqoDRz/BK413MGyuZSnsAIdZzosrYM48HZ3BCWCaG+BNtFU12JNYVzVilZPo7nI3mIZyF3hTucYgIY8sp45QHtp9HDChI49EZ5kNRAWYZvBLpzUq/1RdR6H6nxQ9tp7/6mXonpJreatOjR5D0Gry/yfFYLqd14krpGp5jZPCBIpgOdo5AdQyf9Qc60Nrm6Bnu6MU9A6hwidy2teTl0uJP4348uu6XPirdbVpo53mFEhEOqBA6auWjsH1Lyp7EQW5BiLQvvOQEYNJTkmWkKkojKXPtvrywIzqH6zm72X0j6JD321A1A1MxRgGe6BYgH/UhwpH2Kq+XdeyiY/reBRFJ6JHyjegDpF6ZWB5AvdvyC6WeQQGGS2pz6uFB8peHiFtinINcHpeCIjxy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(41300700001)(2616005)(66574015)(83380400001)(26005)(86362001)(1076003)(36756003)(82960400001)(2906002)(6636002)(37006003)(66476007)(6506007)(6512007)(15650500001)(4326008)(8676002)(6862004)(5660300002)(8936002)(6486002)(478600001)(316002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0JRQVdZR05JeFNzdzlzKzdHcmpkcUNPWmlCVjVjRG03cUY1aUtRbWFnTzM5?=
 =?utf-8?B?VTZWTStmemdTc1A0SGhVQ2NKSzBaaDE3UDN1QjZpZXBQaXpnYTRSQ05pSTZ3?=
 =?utf-8?B?S093b2IvaGR1SkVNaWVaelVLSlMzN0pyL0hkc2JZYnQ2blAxUlV5a055OFp3?=
 =?utf-8?B?U1hrTnRiU2Fma0U3cmVIdHhYYm5NQ1dSbkZDaUhpVnZnbWJqdXN3b0FrcmhQ?=
 =?utf-8?B?aHlwM1JFWHdaWFVGTzJueit0SXU2bEk0ZldjeVJtY01UKzV6eFVlK3JEVjJW?=
 =?utf-8?B?UmJnN3hVRUZ2SG0wUnZWT0g3cEY3bzhaTmFVNVhUL0lRNGhqVkFqVzArNWsz?=
 =?utf-8?B?RTd2dVpHcVN4c0JjenpyS0tYV0JwVllHQ0JpbmhQM3lrVmJJVStscWY5cFFx?=
 =?utf-8?B?bFA0dldYaGVZT1owVDZhNzV0OFRkZlh0NkFRODUzaUlqLyt6RFU1L2ZZek1j?=
 =?utf-8?B?WmZrV3NGZnVEcWYrckwrTm1XTFJSclNTbVVSK2w0Lzl4RkVscjBpbUpKb2pi?=
 =?utf-8?B?YlBlWU9KcUNYa0szSnRvNU95UEROV3FPTGFvZmZGRGhUcmRYbkhud3hqQzVD?=
 =?utf-8?B?eElGNG1oc2M0MlhkcnBmYTZXc0pOZG9uM3ZuLzM0UnZiV1U5eUM4UHp2OGJE?=
 =?utf-8?B?cjFjVDNpN3J6WDJTSkI5RHhEN1hwWlkwSGg5aVNFaVhKRGgvRVVPRzNuNmE2?=
 =?utf-8?B?QWdyelFRQk9ha3dRcThDbEtVTUlRa2IzWm54aUZ6cFBvdW1ib1FXUnVFOEZu?=
 =?utf-8?B?MlZzUkhYSHdHU21LdkVieVpmV0ZJM25uTVlBeEhPYmJGTzFjSS81NUkvaVcv?=
 =?utf-8?B?VW1CaXdsd1RKdUI0V3krRzhoc3V0M1RSREVVQXVWakNwY1VZa2NYSXV6OUNy?=
 =?utf-8?B?K2J4Sm41cFhGbE5ld1hjQzB0UXZZRDhFMHBDdEdZWmZ1T0puVmlFeC9qZ1Fj?=
 =?utf-8?B?T2Z3Y2Y0bDloNEpmRDJDWFlVempFbDZqMXUvd3VSMTRJWlVoamdEd3dYZEhl?=
 =?utf-8?B?d2R0bi9oYkdGNWhTM0J1L1JOK1VweHcyKytMN0JFckl0cEl5RVFZZU4yQzJN?=
 =?utf-8?B?blNuSmVBYWQwL3F3bkNCVE9zR1VpeG1Oc054a21XeUhjYjNZQVc5RHZjcFdy?=
 =?utf-8?B?eThnZUc5c1lsNlNVQ2pMcjdtQUVZVHhPOVFQa3J6cm50V1dRaVpaWGNSb0hK?=
 =?utf-8?B?cTRJN2ZIRU1CdnJCTjdzL09NTUR5eXhoL3JFbVJ2L3Z1SjcwWTVaR2gvL1JF?=
 =?utf-8?B?d3RORVhzS05UOFR1WWZMS3orcW9ySXoxNzhkUFFLUjBrYlJ2OUJWeit5ZVA3?=
 =?utf-8?B?OWMwL3Vyd0RSQmJ2bmVXY0huTDdnQUZTd1NXUUtyNUVpUGlGTmZTNlZZblpW?=
 =?utf-8?B?dHZlS2xkVHdCd2xZd0t4TzJGMThyTHY3dXdZMmhvaERlSnNIbHVOblZqZmZn?=
 =?utf-8?B?SGZnQWRMNlg2c1l1YjFHNFRPTHRTTWIxY0Y3UUJEdGpnN2Q5OVIybWo3SGN2?=
 =?utf-8?B?czNHamN2NDE3YVhUUmIvR0xTaFR0OWVrakpob2p1YVE4b3lSMU1PSmdYa1Vp?=
 =?utf-8?B?STRJYmZacDlLSS9yOHhSZnlKVnN0RHhIcTl3U2VZblYxYmViOHlEVGF4L1NB?=
 =?utf-8?B?S1RyQktMRzJ3aEk0Nm1vWVhXK0VQbzBKVTFCRTRRNFgrdDNKTG1Qd2x1RGZC?=
 =?utf-8?B?UEtnNVY0SFY5VzQreCtvazU2TUV1YmkrSUtKTE9mZmpuaVpnVUkzQ2lDNFgx?=
 =?utf-8?B?aGtUZVNtZEVOQTZPMlpjc3RZZXFhRis4aVJpVUNMZk9jV0RhRWdhWEg5bENy?=
 =?utf-8?B?TnlzaVh4RUNkSzR0SGxJek44d1JXck82SFFCTitnN0dhNEdaaENnR29aa2JC?=
 =?utf-8?B?U21xbUJzd0wrWE9OWDBjTjV4eFFkMFVqZ2lpS3pKbHF1RkRFc1lDY0tUN3Vk?=
 =?utf-8?B?ZnI5S3VYTitjc3dMdFJwV2pFanFlbjhOSTVhRFlKK1N2dm9HQnhUQ0tMQVZD?=
 =?utf-8?B?OW5rVFdsVHNUc2ZyMmthUk5aVkZaK0JKc3dhWHFrQjNITnQ3VU5ob2VITExY?=
 =?utf-8?B?dXExWkxtNTlTazFvUTh0dHRJYjVHVGdZeDlVa1VBSklwNWxzUDJoLy83ZUxh?=
 =?utf-8?B?LzNIeEpFTjR3d1ZXeC9Va3k1L0owUkNkVjZBWnNNc2tuRm5ZQ0gram5xajN0?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faf6c90c-afc7-439e-303f-08dc08b251d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 21:08:35.0673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7bIGP4ZjfW9QE90b3VckDmwyvuz9G9rXVsMOKR8JfiZo9e3oasOjYq9DYjbzBH+Jh1xEjDDwPOuBiVQTRsBC8hvmbhe6CSqGsOxno9oxlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2023-gru-28 00:58:32 +0100]:
> In addition to MMIO and CTB communication between the host driver
> and the GUC firmware, we will start using GuC HXG message protocol
> in communication between SR-IOV VFs and PF. Define helpers related
> to HXG message protocol to minimize code duplication.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_hxg_helpers.h | 107 ++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h b/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
> new file mode 100644
> index 000000000000..4dc080484e7a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_HXG_HELPERS_H_
> +#define _XE_GUC_HXG_HELPERS_H_
> +
> +#include <linux/bitfield.h>
> +#include <linux/types.h>
> +
> +#include "abi/guc_messages_abi.h"
> +
> +/**
> + * hxg_sizeof - Queries size of the object or type (in HXG units).
> + *
> + * Asserts when actual size is not aligned to HXG unit (u32).
> + *
> + * Return: size in dwords (u32).
> + */
> +#define hxg_sizeof(T)	(sizeof(T) / sizeof(u32) + BUILD_BUG_ON_ZERO(sizeof(T) % sizeof(u32)))
> +
> +static inline const char *guc_hxg_type_to_string(unsigned int type)
> +{
> +	switch (type) {
> +	case GUC_HXG_TYPE_REQUEST:
> +		return "request";
> +	case GUC_HXG_TYPE_FAST_REQUEST:
> +		return "fast-request";
> +	case GUC_HXG_TYPE_EVENT:
> +		return "event";
> +	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
> +		return "busy";
> +	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
> +		return "retry";
> +	case GUC_HXG_TYPE_RESPONSE_FAILURE:
> +		return "failure";
> +	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
> +		return "response";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> +
> +static inline bool guc_hxg_type_is_action(unsigned int type)
> +{
> +	switch (type) {
> +	case GUC_HXG_TYPE_REQUEST:
> +	case GUC_HXG_TYPE_FAST_REQUEST:
> +	case GUC_HXG_TYPE_EVENT:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static inline bool guc_hxg_type_is_reply(unsigned int type)
> +{
> +	switch (type) {
> +	case GUC_HXG_TYPE_NO_RESPONSE_BUSY:
> +	case GUC_HXG_TYPE_NO_RESPONSE_RETRY:
> +	case GUC_HXG_TYPE_RESPONSE_FAILURE:
> +	case GUC_HXG_TYPE_RESPONSE_SUCCESS:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static inline u32 guc_hxg_msg_encode_success(u32 *msg, u32 data0)
> +{
> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_SUCCESS) |
> +		 FIELD_PREP(GUC_HXG_RESPONSE_MSG_0_DATA0, data0);
> +
> +	return GUC_HXG_RESPONSE_MSG_MIN_LEN;
> +}
> +
> +static inline u32 guc_hxg_msg_encode_failure(u32 *msg, u32 error, u32 hint)
> +{
> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_RESPONSE_FAILURE) |
> +		 FIELD_PREP(GUC_HXG_FAILURE_MSG_0_HINT, hint) |
> +		 FIELD_PREP(GUC_HXG_FAILURE_MSG_0_ERROR, error);
> +
> +	return GUC_HXG_FAILURE_MSG_LEN;
> +}
> +
> +static inline u32 guc_hxg_msg_encode_busy(u32 *msg, u32 counter)
> +{
> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_NO_RESPONSE_BUSY) |
> +		 FIELD_PREP(GUC_HXG_BUSY_MSG_0_COUNTER, counter);
> +
> +	return GUC_HXG_BUSY_MSG_LEN;
> +}
> +
> +static inline u32 guc_hxg_msg_encode_retry(u32 *msg, u32 reason)
> +{
> +	msg[0] = FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		 FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_NO_RESPONSE_RETRY) |
> +		 FIELD_PREP(GUC_HXG_RETRY_MSG_0_REASON, reason);
> +
> +	return GUC_HXG_RETRY_MSG_LEN;
> +}

Note to the 4 functions above ^^^^^:
I know that naming convention says to use in this case guc_hxg_*
However, these functions, by their content directly indicate that they
are only h2g.
I have a subjective feeling, which you can ignore, that they should be
labeled in some way as h2g.

But still:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


> +
> +#endif
> -- 
> 2.25.1
> 

-- 
