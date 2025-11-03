Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105FACCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 17:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50BE10E4A2;
	Mon,  3 Nov 2025 17:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBR/GKul";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEA810E4A2
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 17:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762191868; x=1793727868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=n+dnU+mOJbx8OlJ+/vejlN3m8hZLnGIu1xWSJHPpv/Y=;
 b=lBR/GKulDHJrsJBHki7hD6QjsxKeU/t3ICYPKcn16PBn3ntC+1Mk5jDs
 uYThbB3/dI6RpMja+sWVi0a874oLx0cPmIRl4Ymeupbc8OeNq/NPMzJ80
 ZUTGabS33m+q5zbDEUoiLBasnguc6sWs0jCyWjtvqUPIBterQvqrb5uoA
 c3NyRDr0aTPag4+L9STohZZBGYXCO/MgbcthiOEzDKYHlTHDBTktBgzmb
 0Bh0znNGXAPbEC249KGYFcZ09olak9OqpIm/GYawuIJlHv7QWK+Q3gBV6
 e7akvpY3fun/xIOClI41NVgsmotKfA8X54klle358jgDkZcyfn4RBkNYS w==;
X-CSE-ConnectionGUID: DSvA0+E2QiSU2l+qIlSCAg==
X-CSE-MsgGUID: JyLMbFWkRO+tlrIhid3cnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64161253"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="64161253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:44:28 -0800
X-CSE-ConnectionGUID: AZ1mPqpDQuuMplUhQlG+2g==
X-CSE-MsgGUID: LwM+3+1iQg2WzXsfli/Bug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="186613683"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 09:44:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:44:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 09:44:27 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 09:44:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+JNQEdDMcQlGxd2cHZMoSoVunIiBDphzotF683PteThZjAV4zsm3D5gzxaPp0wkU7kDjUeq/XwTo+rDi7zo3N+POfRBgbwtGBaMCEMR3jemS+PbqJsFXX/kytDNOBmd7KAwVmAgT29+yWHH6/H9lvUXooQ5LPRoXmnZTL2wrv3sTAqB33qli9SKBB7Kfam11cVRQ1CJLd+CVXg/D9TFRIrBNaTzey4n/M/TRi3y5ouH9pX5xxX3M0UXxKf4tpCew5Jeb5Nj8KoRJc9lI37YEE5QRy6DiFBGViob7ScXWyMHvkgzkR3goQBi6fipNHns2YgTP00iGvpVkOAClK4m0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MkWeXT2x+9cSPsRJKOdKv5v2xqZBOgo3bODlnEDjkg=;
 b=hGViLDkPOmCIu88bdXWmj5tRhSddturOG3UGvaDqBLXzCG7w90x6VdYSGVpSXhjLeQU9pwoI7/HATvnjLzGEWM4eT5r1ADgXT9WCSDywvY6lOyauFsUdg0rwtxTuuZAH4ScvCvQPHQvmKPDZGOba9yW3InMUqaWQIUqHkfFBQgkpRG7MGg1f+a9acgPu0F/ekf+rXIfC+l6yWKPVreMSCF6E7FbxYGWu8igWZUSPXP1RqLAcFZYjNLFC0OyD+xR0iGnJKDPQgSbsFfsM8iEG/tmi1OythopQhOUDQ/6b7K0z2JXnM8pDBAw5fI11RAsh3FoGtiyEXsilz5pKIwME7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPFF8C186950.namprd11.prod.outlook.com (2603:10b6:518:1::d62)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 17:44:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 17:44:23 +0000
Date: Mon, 3 Nov 2025 09:44:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Message-ID: <aQjp9Uw3/Ll6EVno@lstrano-desk.jf.intel.com>
References: <20251103123144.3231829-4-balasubramani.vivekanandan@intel.com>
 <20251103123144.3231829-5-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251103123144.3231829-5-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPFF8C186950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e44da82-5b26-4fac-0897-08de1b00a00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZNqKSMOCGM2p48MQQIfLHLtof8eFGGTYI78Hy7bivcbIdR+kbk4YicGwNC8h?=
 =?us-ascii?Q?zDRM4NBOYqswf4Px7+w8eZrmiT+D7nOZ8DdjZ7tIyoQJSVlURuIzeSC3iW2B?=
 =?us-ascii?Q?2RwsJni67fGCluWHaROJ9+yTWfbAJXzYtlK5zUShh0qpphol4rUL/A6aCrVG?=
 =?us-ascii?Q?z1pSBRSmPo2l3Fei97WjXAH2hMNnRY9c1OE9E3xv8CTax55lHNFIQyLPZBFd?=
 =?us-ascii?Q?vYGkbi80+CwnnvFJQvVPaTtP4OvxTSKe94lioqsHyb14KYmFFFREPvtBpX5e?=
 =?us-ascii?Q?2zfcbFh3Jna0YeCk51E0BBvLTbj8FY1M+xHvZams51+vRyWqZSH0hZDyV0mp?=
 =?us-ascii?Q?u+lxEg65nT91XnKhVj6Jf7mCZrjluYAqvFRyzr7JSPM3ADoiUGx7Zcqfw7pT?=
 =?us-ascii?Q?WKbubS3duFp5gaiTwWPN8ggbVv1U/iK87EFjgn5tV1q0UHwueUu70ic90aMA?=
 =?us-ascii?Q?4H4HET09rp8gh6tnKX8Ju4dV6GGYvn0EW0zPpBbLwWjlcrvjnpF9tktuFd4R?=
 =?us-ascii?Q?4Vaz5UhWNPtgEDTtVb6Wk3a5Oh4ogT8VzGk59bvC9NaF5IUfgJ+PW813rP4M?=
 =?us-ascii?Q?4ZucwrXz+D/PH8IeJ5NLIEu9VVRJd0TEqzKpUJsQSqOUA5uFGEyU9k6AZBF+?=
 =?us-ascii?Q?HA0hD6klMU6N+JDOsDeOvuwQFEwnlKSfgMADrSEgtWrQNTfa19ccE/dEwfC4?=
 =?us-ascii?Q?tfWpBgY9LMH6JWl2XDqCW6DIbfxsYEjmWaDooWwcctMcceBFsRrKLR86ANIV?=
 =?us-ascii?Q?o+yq4QxORwvQAUBrg6zGmauTM+HHWBbzDJWIubp/FY/7r117z+7/Q8qwBQGg?=
 =?us-ascii?Q?D9hXETvGewfr/nB1LQucMlA9zfCgQkGv7TBowaCmANnJQmLbuh9z2yi9HFmb?=
 =?us-ascii?Q?S8toPADOrk5AIqLSVylFrTfX5+p2gLs5HfLXbsZr3qjAtF5lwyshccQgKMrF?=
 =?us-ascii?Q?mDdqQMMxc2+iSONQz4uvenCd9+V8Hdofz9+HWOnIUSps/KUDuDICTF30GZ3M?=
 =?us-ascii?Q?A8+rYpnvvnWbUe1UGaLs5sH9qWM2rdyLumz7369IvjQp1YyGTGXt5oYZ9YAf?=
 =?us-ascii?Q?mkALbn9C23IaTHSVz7QbW7epwpkRqw674zutvoIhljq5NfAidAPGmxo7+Cgx?=
 =?us-ascii?Q?y9WxXtcoSk/VnwG8ps+X07HPpjzJMbootH8ntc0xAhcTshrBNdwqG87NSznE?=
 =?us-ascii?Q?16Hyq5wpb1D7K0irnIF4iCKaemllzyLIK0Q9nR1RHArtI+xv467cV9eHooKW?=
 =?us-ascii?Q?1e0wR/Zsyu8Y0UOvgdlJbgDNIDqlm5BSlSl/MynH1/sIPXIcg1wWC0CcsJkK?=
 =?us-ascii?Q?cXZ7zc1JvgBYqkHLiA8i3O2Dzbd4okTpHf5Ei/dsQGPLORmCuHdH9Rav+TAX?=
 =?us-ascii?Q?p2a6hHGr8CeBhne/OzRaQ/BXY+SFo9sOcZUihVEBPFToe8WZOWSwBgrdrf6N?=
 =?us-ascii?Q?57cRsMvYtYGn1DRdc5J0qxindyjF62aX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ABA9DFQknrq1YWHk7rvuoiBnSqCp00hHTjwpLQFaVWks5gKI4+FBnu9D5jmK?=
 =?us-ascii?Q?GNGBqCLTxXc5ld8QFAeSVsLlD/QDsYuNJUnaqD8lCT4yLVmQCY19udOHRXPq?=
 =?us-ascii?Q?o1NbYEGCwC0Md6l3lM0ssctpxDh+nUhWEPc1HMBdjUhT1cd9B+wm/S/32z3F?=
 =?us-ascii?Q?cy0cymMxUBGSDMJMVLgVy1feqD4qElsOaoB11lSH9/ZrfRDzXbrde0F3ji0R?=
 =?us-ascii?Q?2E9f/d0UaOl3ssKVdEKHfY9Kl4Plm34w1SZUaOUXmJUS6hcv3hjDwP6HE/nu?=
 =?us-ascii?Q?UeHMgQXlj0IYLPigeVme2XBVsIcuxd7T/QpuCUt7BJblEtOFWrxa/b8ulW4S?=
 =?us-ascii?Q?qnNufm+x27VFFNEqCRf3Vad0UZbnH4cN3I3dpx7LRu//9RQPhnBzZn7mOVt7?=
 =?us-ascii?Q?JjSidmSuEjVKgeBbkQ1CAQJjv3kjCC+QrJ08e0yNEB412gMve1sRnkk2mBK4?=
 =?us-ascii?Q?jTAfeBSnNmiCpqFdCl1hnhCsjF1EfM2YZwiUkuJx86xCZORa7mniNInGiuv+?=
 =?us-ascii?Q?S1jctyj3qyCmiWbcQrERU8eJsRPpCv+RII3wl0mzFkfNC6eliOb6yEYfjGry?=
 =?us-ascii?Q?FjNzAeJ9A/byzxF7nAH1Mn78naup8mSDtw4yVsnzyuzWFu1XZVWznoHTLwS7?=
 =?us-ascii?Q?YJSsK5RbczAtGJ1dowU/GCcaoiW5OkuVGE/VkdwplIvUy7Rdp5y2UDVIplAo?=
 =?us-ascii?Q?yauVrjlQq9mwwBf3zg+6CiVa+3p/BA5aegb0AAPbe7h7sq8CYhLNCytQB6ur?=
 =?us-ascii?Q?TE50J8pjNqdxVDUUwNX7+4PEEjiWML3SQ8+u+P+4u1krY57SK7U81a+taFDN?=
 =?us-ascii?Q?Xvi0w6i9VYMPmpG9lf8IR40TxxGni/etKgJpMZnRrOB9ffzbPKBIAiUKH4Of?=
 =?us-ascii?Q?MBgpfsoCNWCVWPKQpkUaFYfUumqGTq2FpvVH7VhmFUON0o783EGWx8TjqTYc?=
 =?us-ascii?Q?lNXxsgZC5uzWmMRUv7uRykHUp0sXhuoL62Tgfx1sO+9g14vQGIX5jkrTqhJU?=
 =?us-ascii?Q?3uTXJY5qr7ypJyChqmxDJ08NBBQ9LwqeXJNGpqKanRSrqq9MI1m9dTlf6M4Y?=
 =?us-ascii?Q?bLGhJUsxFRGZZSSE/Y0Cacumyo3jbJWD8NJ34Tnk3oiOZQZk0GUd/XBa4TFu?=
 =?us-ascii?Q?73305+fXJUk7LIyTafytOzZNKeotCgvk7nndB0d2cB8P9vl8YKF5iMQMaeyt?=
 =?us-ascii?Q?gvW+ztWxYd7zgcHuoxVxJmJNN9uJgQNr0HPVu7W3IjhmfR7fb7hasRcV9wQt?=
 =?us-ascii?Q?uuqxxhwVTt56I0IAaaQJZzKxVcHr9uCLdWuU3ben1tiNSfXrNjlCoFL4aYfR?=
 =?us-ascii?Q?K/BlcDg14TQGInE9rCLrKO6dpdnoemIy15Ovi+A8Vq7Jz66moBwKWkhF6LTg?=
 =?us-ascii?Q?etNDEt41AW46YlBRMjy7L5vYEbq9lAzJSpBrCluptgwMHb9S/ieTFup9jKjd?=
 =?us-ascii?Q?SL/2W3bDCHVbkpKgnYA4MDGirQLvYzETwY7EdWQANJRFlBlTyjYgcoCZwWYR?=
 =?us-ascii?Q?FJygKimLL7esPOauOJNLzvDVNMB1TXcCSLogHMPfAvlPzC3p9Le4v1+QGkDx?=
 =?us-ascii?Q?AkhnVMLSB391/sOZROfqQ1R3T83/vnRKOTHYXBm8ASzYrYi4ALDV7LIsElwX?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e44da82-5b26-4fac-0897-08de1b00a00a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:44:23.7608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuU6zv4pNw/IHrZeiwdXM3Wib3Qj5cEqbASZxqJqhUTQEbmoZXGbIu1jMXFvaobSeSFdS4FLbKHlyV0+TTjeRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8C186950
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

On Mon, Nov 03, 2025 at 06:01:46PM +0530, Balasubramani Vivekanandan wrote:
> When unbinding wait for any GT reset in progress to complete. Unbinding
> will release the mmio mapping but mmio operations are performed during
> GT reset causing Kernel panic.
> 
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
> v2:
>  - Use the managed resource release function to wait for GT reset during
>    unbind. (Lucas)
> v3:
> - Release the reference to the rpm if gt_reset_worker is stopped from
>   execution. (Lucas)
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 60bac65c8b9d..e008e3c1bf68 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -607,6 +607,13 @@ static void xe_gt_fini(void *arg)
>  	struct xe_gt *gt = arg;
>  	int i;
>  
> +	if (disable_work_sync(&gt->reset.worker))
> +		/*
> +		 * If gt_reset_worker was halted from executing, take care of
> +		 * releasing the rpm reference here.
> +		 */
> +		xe_pm_runtime_put(gt_to_xe(gt));
> +
>  	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>  		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>  
> -- 
> 2.43.0
> 
