Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A595C282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 06:06:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320A210E8ED;
	Thu,  6 Mar 2025 06:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hxzve/2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEEB10E8ED
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 06:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741241164; x=1772777164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sClOv1qgzHlT8aTIx/7elk8OvoI9HUb+uLCtu1cIhYg=;
 b=Hxzve/2jgGDR7a3brb1x2DwlG+CUEpbcuB6VEOe1c2/S5h5NKdlcbEv4
 /KLXoShxvspcpjXT2uuqnWO2bbAqNVJs8iLFhQ4NPZ7YOfbUz5JWwJI7W
 JCruS3vVaS02s4BQmayKAqrJ7N4RRjEYwd6sm2wswdY49DNczdgnuqO+8
 auVb4q0NyaeRUzofR2lr6KHuH6GMdfaxtjJSE1f2bvC8/vwaFaL+uzrW4
 k4xCgxCF0u6njlcU6UujosyIfrNoAvgyI+AcRTxGHK8+GD/DIITab8lvA
 aWtv/w9wabmzqCRgSFthJ4l5Ebn0Z4uizaf15W+Q8JYZY16qjxnyGyhUd w==;
X-CSE-ConnectionGUID: 4MEOS1ahSgWCdt8WA+zobw==
X-CSE-MsgGUID: R2K5bQaFSKmkNtJkWCidBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53635115"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53635115"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 22:06:03 -0800
X-CSE-ConnectionGUID: X+6s1DvnTU+lUpOzHzy8WA==
X-CSE-MsgGUID: v75bWDVeRu6OcHWsCktcnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119611714"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 22:06:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 22:06:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 22:06:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 22:05:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpWLoGoMqwSRZgULCYgmsOEmkcE+1sPf7lEOw0VYzkDHFzGuXYoIyQKrxqS+UTQEvs1+X+rd3+QhYfYq0OjURFfMDw5E/zSG5n0oSoikq37Vw5yjsuswSbC2eZZVrhAvhnCLSgO1kNgh6gK+iYtiW8k+jK04VdEIby9O3vDJFfN1BjPxbLv15HlZPORck1u9GqvOKsnWBXkXmXq8SVFRjemVnhjXL4CBysVHagrb/wIway27WSov6nU/luHFfiqLh9MFqiVBLqWstbmgCgKCEP56EeJqwlCq/XL42RU1umyTimRwrGpP37Ir8J0hKiXaAlGtvKhpdH+QF1RSAgHtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOoHiPLoAfSbKIQichAf/fay98E0QdaazH5ARxPArRU=;
 b=YOyQcUC/5fxzYlLK7Ui+ax9fhrVo5mpBGZzP8h4aUaH861NZVqJcMrtV3R7bm1UXtx2jSatIlHmN/WGjGA3ONp0G8W/kOyrhF6mq4GFmpZ6qSQSca+lk1DoBD+5hAuLgqiXgJKx3yFyS6yiYOj+UuEG+LjHpOyQsL/bXeLoNls7wOlw1zIXLl0qahyiEyrlyS2ODHLvFj88RoPmfb9eG8pPg7l7EgmXGVKBJVnz2U0qDWaY2ll9G2VUfKV/+xSw9+x8MOXsgFh6Wq9ulSb7dC3PEk1V4CW/vQxVIJCuuqZZNGy80N3YoEAuhyHAI4Om1RddI/bECPLItQqjbL5k52A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 06:05:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 06:05:56 +0000
Date: Thu, 6 Mar 2025 00:05:53 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
Subject: Re: [PATCH] drm/xe: fix enable survivability mode
Message-ID: <uszj2ekc7jiapwdqd2a7mseokpu2iabr74qczkzfpfqahky7jq@vmfro22jihmt>
References: <20250306055407.511405-1-riana.tauro@intel.com>
 <v7b65hpbmftedtbgq6qggel2xcvyal6wmxukx462rp2a75464w@5blgurlukprs>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <v7b65hpbmftedtbgq6qggel2xcvyal6wmxukx462rp2a75464w@5blgurlukprs>
X-ClientProxiedBy: MW4PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:303:b9::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4588:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9c665f-6a19-4965-23f8-08dd5c74f5e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XtW7WtNlUgAvAdfW+VXEiSGD56p+NKUa5Ml5RN3RL8KTo7eaXkGh4VlFgxvq?=
 =?us-ascii?Q?J2GRComtuv39nhzIQEic/9DV020SYaY4iM+vxTfSJc9J4aQ3Ism7PDml0e8x?=
 =?us-ascii?Q?Ik2/akuEbLe2/102ayow+5PtLBN5JZMlBh0netSxMcXVFGij4HG+dmZsmIXg?=
 =?us-ascii?Q?5V1gW9+z8Hmpt+yo/Svuv+4J2SsAnkXI2Jv/vzHpEVw/jJCrnQ4MQ8HZcR4p?=
 =?us-ascii?Q?ZkAfibZVaJ5Fc+VnbrRBdc1WkSJLmWRpLOwi8eQe+XKGi5B362ay0D7e6LtJ?=
 =?us-ascii?Q?M9BonOYFB+tJ54WKWcyiNBujAI+aDVrleq5inT/YR7RJbY6Wy9yZ/pi73nzC?=
 =?us-ascii?Q?WTy8qh3rPykacICWK39SlX2bUTsfc7r912DWrpLLGKFylENw7efQFaVXwooE?=
 =?us-ascii?Q?4nBExbtnSydD1CE2nbj8UDxoc/KhjBkqTDNHYv8ci+Ow3bKZHw4X1OibmT8C?=
 =?us-ascii?Q?mb/aQJpsrD/R4xUtAR6cjdHr4Z9R7xbisO3M2Pm2ekDIchaHEGOPffHLBiS1?=
 =?us-ascii?Q?7V27k4sdE4lIQePmyzvXwlphu3gYSAK+F41DsIx0e/yN3HJXA8YsZlHAQLMU?=
 =?us-ascii?Q?/UB0MJEUuFETXvmBfWx+vJpPRMO5Y3f3ItrGHyG7glwdyNu1AniGOdcp72iD?=
 =?us-ascii?Q?56IAinYp1qvV8BxDYS6R5hj7kU0o5mkE9W/T3qSkO3W014a41ojzbJF4Yv2Z?=
 =?us-ascii?Q?NdE8sklHSu9fMmwb0/sB0YojD/Vodlphr1pXwuGzvWw2zJzxpeI14yclrdAy?=
 =?us-ascii?Q?TLLKw8zV0dNFz52bnZNYRAAemIV9voyYdmhxtMimfMTnuW7yWfUHRT459Kws?=
 =?us-ascii?Q?+kaUPpBC23P6RORomM4YG+8CIfdT426T6tioIykt0YBMOIiFguI4v8bNy13s?=
 =?us-ascii?Q?KDFIa4r00DtFA82FJVqggEFpeuuBwr5c1iiIEDOmReGuMc80nizCrmVZ1UCv?=
 =?us-ascii?Q?xo06GqruwDallWiAz6c51p0G6stsInGREdvXvOZzv6dHjReqhS9QTHhA11er?=
 =?us-ascii?Q?00KGZGS7sk87UZHuKSsaTDZXxN36fnla6HMdj/u7z3DIn1L/0dUpQNi/faXy?=
 =?us-ascii?Q?PeYWd7SZ6OTn7SNChOzXx3KTvinSPP/x1AQCHm6g/DAvmM10+vJ3ZktJqpy3?=
 =?us-ascii?Q?qtwH2v0tkfk2fg3+ZSfQPxNAb/YC/mtpfxcd/o93DG0rDlLDj9CuK1Y1bQqv?=
 =?us-ascii?Q?F09F6ATKS18pg/rCo9PA126gEYkYNI+ZfSlumIp0aVUxu+WCsycalpGTb6Yn?=
 =?us-ascii?Q?Xh8GD4wpvO6gRSsDfvshYW9vjsIUqVe1kkDB06pGyVbuSItOOItKPrJTs/TY?=
 =?us-ascii?Q?U/IUG3jILOdATfSLg7xjyGF9yZwh01gCwswDg0MS5VYNnBXi3/hv1+8fMbXO?=
 =?us-ascii?Q?vtVNOcs+CPGo24ueiVgDB5Pradpj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hzw6i4Z6ArN/4HpvCtWK5ZcCQf0wwbejgaW1W7qRFdNOSHLPQ7JAIPnyVfz6?=
 =?us-ascii?Q?RvQkMeIFmuB977S0IQS6QgClnEGkcY0Hmch5KokeCh+D1YriTCi3oRz7tSvS?=
 =?us-ascii?Q?ffGxY2y1c7UzClOIcRAISGXtfVdgyaYUG9MU57Ov6a0bMJvy8s24YLGg1ju/?=
 =?us-ascii?Q?ut+W4QJ1ZDQTYDHgzEhn3hoAoXmAGzPKnClCZUxTOoCBEmFL5GMLUHsxphOT?=
 =?us-ascii?Q?Ri5P+t00roAIpDMo2CI7OZSoWTuq84ZJZaDUt4Tx+ptpsPlT91Mu0lIkTk/r?=
 =?us-ascii?Q?wuS9YwkbN3yKn2QuOjYUoF1kR5uC/4d+OUb9RZSYbCx6XE+S4Z8AO2qeFhUE?=
 =?us-ascii?Q?83aIjhr8nyCBCC+2zLZV8Mtzrmoe+I9k7rZU8k9O9Hk6JKbCoueI1vIOHUjg?=
 =?us-ascii?Q?sNW25v4PAkRQx4fz+64U+BtSPUHQIiu0EJqKu/0k8RA5v8bupeB2ue06YWbB?=
 =?us-ascii?Q?nmPp//cRCeaySP9HGFo3FBOdZq7TNsziauGPt8jGmoP6wQVQC85Ekioex1Ob?=
 =?us-ascii?Q?Na63jRUBkXKBZjdk9VNB7TX8kY8Lt+sEwLka6RH6upopWH1mHxy4xcmasukh?=
 =?us-ascii?Q?6y27F9e/dUA6mPL4HaCwJM8u9mmBf9SQdmuhA1lBjkCgvAnW1VQSTsdK4zns?=
 =?us-ascii?Q?Z+EdaDX5HoVBcrL70ybtpv6j0uneBQdomOeIuMElQyJ55SQ0/I+4+RWaiTr5?=
 =?us-ascii?Q?ea7WtDSSGjk6jh4iMbQpESuJJZQ8JT0c4x/vBeEwSnSbqCHvT8dtxodXGrV4?=
 =?us-ascii?Q?CpS9c33VU8YdeOQxgij8jctE+TdTg+aeCDH57b9530ecdvM9OeYHGJ+FJVix?=
 =?us-ascii?Q?OyDrLJ5SJxbmtq3ucbGj902Tx8AyhNb1VeVYxg3+JdtLckiJ2OrdBQ7Ixhmx?=
 =?us-ascii?Q?Vx0dCuHQe+RNI1zt3qN2LST0GDG1rm+ZQbdumi33UWharbNpVp4wTOQsqPUK?=
 =?us-ascii?Q?qfRamC2PJ934ievwCnD3nTTOQndqGk8OjNdIc/wn5V/RULhk5F9FJ1hgN6f/?=
 =?us-ascii?Q?z5BVQC56U7bBq+Fk2F1VecupIFZmNz7Q4BsTLnAmpCLolcGvqHpPIQaKM48m?=
 =?us-ascii?Q?ujytiDdro3bfIa8dJ8a5s9tQCcMFWRbpijLn6gNrxI2+TjWQy0ykRtH1BqaJ?=
 =?us-ascii?Q?RX8MH+3Iqt/wMXjzWYC5wIP+NETsx31AA9vt85b7gFvl2LC3pahQc4wcISX5?=
 =?us-ascii?Q?Xy3ekhEt/xyxqzJDzcY47kk7UHe171arTaBVfYbsB9X7WUD9j2jCm7+fFyjZ?=
 =?us-ascii?Q?O7tLS4LVrhQUIFihIGIeUZ7K57YzI5TCalnhdKE2wxMKFK7zJ1ajlxGjQza9?=
 =?us-ascii?Q?tQbulZJrqIojdp7mPnNc9UaNWEdWYjLQIhfH0Dy+KU3qynR85ha+yA8uZ5rB?=
 =?us-ascii?Q?6amr/d4PPDQzxabUFOdzwjDqv7VnUlckpOpYBx0ek6cluS8iIMiDCTzbcdxE?=
 =?us-ascii?Q?vuRDQRZyCAsB6E7NnZBL70aXkhHvLKt9eC4tr7CLVWVXDbd/mEh31e5vVL30?=
 =?us-ascii?Q?+9MeHz3tTTVSmWRuPZbPPAfPFPsElggKgX2wpC1pKQn3SOuHRrxrZc7QwozR?=
 =?us-ascii?Q?l+vLvZxWc39KH89brP1qRptKo3DDdICbcqNyo4BUi+DhbbTy9KbyXtij71Ti?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9c665f-6a19-4965-23f8-08dd5c74f5e1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 06:05:56.9299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hKfvcXhlxgGrty5P8vRj6FgQ/AYACloW8hImyZLn3GWvtgsMgGTVX2YQBJGHVEuLNIQRmTPhKI2FcEMper+zfQG1HbWYvXAS59W8dqiz6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
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

On Thu, Mar 06, 2025 at 12:04:06AM -0600, Lucas De Marchi wrote:
>On Thu, Mar 06, 2025 at 11:24:07AM +0530, Riana Tauro wrote:
>>The current implementation skipped entering survivability mode even when
>>survivability enable returned success. Enter survivability mode
>>if enable returns success
>>
>>Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>>---
>>drivers/gpu/drm/xe/xe_pci.c | 5 ++---
>>1 file changed, 2 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>index 6b5fa067b39b..ee0665e54489 100644
>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>@@ -857,9 +857,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>	 * HW to be enabled. In that case enable it and return success.
>>	 */
>>	if (err) {
>>-		if (xe_survivability_mode_required(xe) &&
>>-		    xe_survivability_mode_enable(xe))
>>-			return 0;
>>+		if (xe_survivability_mode_required(xe))
>>+			return xe_survivability_mode_enable(xe);
>
>ugh... the mix of bool and int above threw me off. I remember fixing it
>but probably forgot to put it in the series.
>
>+Francois
>
>Can we inject 2 errors to easily test this in igt?
>
>1. xe_device_probe_early() to return error
>2. xe_survivability_mode_required to return true
>
>Thanks,
>Lucas De Marchi
>
>
>>
>>		return err;
>>	}
>>-- 
>>2.47.1
>>
