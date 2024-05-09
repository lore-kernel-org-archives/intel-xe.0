Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37724C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C622E10F0A5;
	Thu,  9 May 2024 19:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSveulRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE1910F0A5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715282245; x=1746818245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BKwA4AGzEl0/AkpGlNHE79+2h5K0TKBlpulUKyo9hQ8=;
 b=MSveulRrbfPzGctqwK8oq8x3xbL6iD/Gq8VgjBNdkn1puSVjK+5WyIci
 h73DYl6LTQ2XvsXUsCVyWoP2qq/Ym5VmjvQD4RvQXvqRDtHfUPfmTPaYB
 TZoNC9+qJPScUK1NmCPrXZ9vR2zl8CJ5fksIy/OOnAUUEwNS9HKdzOpH9
 oi+GsSE2nJxx1pIUFUMBS6cdleV0lFRO1qnCHmiW1yRa+QFXSx8VCtN89
 r3nc6GAOtvm2MMvvG5emn1prW+Tl1JorDUY0qdOXRJPV43VQu0SWDzCYW
 BvIDDnI1q+J/eTbiOMBNAXEkgy7ehLh2g4dbasURk2/h3L8zHgk7j28Rq w==;
X-CSE-ConnectionGUID: SPRmPiQRTd+YUHNTkvpwwA==
X-CSE-MsgGUID: l5HxHDUNT0OYxHerX7CyvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28738584"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="28738584"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:17:24 -0700
X-CSE-ConnectionGUID: H0TSMK4EQrOq09E9VHEccg==
X-CSE-MsgGUID: QvB0cVRJQfuWIQAG9UsXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="33801344"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:17:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:17:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:17:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdgYvP0E4C8BOHBVb19yRW2ZBHYltzIqSGm555WANYFj2sHBCcnrOVq9vVXXa7YuiZa8SG9danPPugHTF0hpq9mUWHjO71D3/5AoI+Zf2xMuycsGDnXn37hI1welWdLxRNa8xBrpdNbe1xYksC+4+HtYRXi05Z/04atwv6DjENm14zPmAu3CeqSaR9ctLIrghyyNaUn1Qz2/8YHVzyCRR4r/0pklUZYcyqiibKpxCbMHNg8R/B16Fo0+8c2feMWw8Jhrv24Mig2Xjave5OjoJT6qEk4rLiPz6QgWAK3BpE3E57L58HD+COqzQK5P+wtIpiPYx/Cr0JBnFHGrA03rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5muoJG61hLhLLlZ4n3CVwYPrWD+H7p/gKmEarrzCAK4=;
 b=k8SsCWlrceO4/kpC2idZy6M5Wj3aL4uWDIyTSUbz9hLdpgASeLWp48+Bq3IUGjejmD1JRok+BMxPFA6kDnmv66vVK387wlicElyKeg4/H+U3j9h6xHrKn2eh5BJUEgsfAIFdRQNXh1C03ytcTmidPwkT/s1H/4vpSkC13Ph3EeiOr0Gw/cmHj0j373lnMIQpQouP6/V1TEHFiFEs0lOA7gsJ+8N1cZQHwJ5hwNxdAztDCU9Yr2XwzV2aDdNx3ls7CfJOjviipbCBS7mOe7aCOKBgn+u+GwT6wC2zxeMZ0bjoqqFR5R+caQtWzxUV1EUt3XeF8SzgyvqSHO/5Fo0fXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 19:17:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:17:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>
Subject: [PATCH 6/7] drm/xe: Stop checking for power_lost on D3Cold
Date: Thu, 9 May 2024 15:16:56 -0400
Message-ID: <20240509191657.504300-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509191657.504300-1-rodrigo.vivi@intel.com>
References: <20240509191657.504300-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:303:8f::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: daf159e5-a10a-4d25-2cc4-08dc705ca50b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rSlRJawUDPr1Lz1tnYacEQSsAPGAfy1TKSZqrGrgV6FbK2cBf0hSJV6j3Da4?=
 =?us-ascii?Q?WDP6nXzspptE+bI0XKGlZgifiZhdTWP5LrYECYnRBXQa/029uH47IQ17OPul?=
 =?us-ascii?Q?Lp+uPPEeUu4k+rhwRjh7wrvv/uypaPcdWUi5ID1NGQT7reOTVB9Eylgh+FLm?=
 =?us-ascii?Q?4n2zUnULe7yQ0PBdHBpaYUJYRUTvM6HyquLhj+GJgXbrcOTYTJO57wrvRNcf?=
 =?us-ascii?Q?5qXtVfHMdzx9QVqebmLdCC2x9Lk6Dg1kg86rpdg3LyVEiYh1KoGrAUDzbhan?=
 =?us-ascii?Q?TCsiN4Azlx6OXneENWRGr6Enf9eQrT4ou9Hnh8/2f0XGq3/i7xukHruqz2z6?=
 =?us-ascii?Q?oXodlRO+DyUII/ELAtVgSm0b+kdG54g4j1SkKoIBr7ImP/6LTs1EroEYiWf8?=
 =?us-ascii?Q?FBXjZMIjMKFazHr9Fd8UBohod69rEIHC+oGEGJoLZ10vjQQ/MxKXtRw3h1yo?=
 =?us-ascii?Q?Ixrk2rhHoeukSBw3M0GHjYvhB7gpGVgHcYk6a9oOq5R7BKq0lcIvIIdeLvdv?=
 =?us-ascii?Q?2rWVd2wAuWsSQ2vxXgizA/GT3w7qDQY2K8A3IASYKLk7NCEmUyVA43d24ebX?=
 =?us-ascii?Q?8hNHhv4avDxVkftnJYyRtqITIoBzylx9Zb2NHk4hiLcGTWXeRr2TSQKBZ5v9?=
 =?us-ascii?Q?hNKbWGLKZ86OFhPyDBwCdCYK/7j7nVSeHJgnpagpaYHojfW5Vt9loH4i9KXq?=
 =?us-ascii?Q?UvfS6NjcXEs/VJtoF+5V6AaSp2srfxlBgD8XVPgBiohgbA36ca+EReKhFY1S?=
 =?us-ascii?Q?iSKp/2JkEy3zCI8jbXcgUYs6T2rUiXOLpdgEoTJh/+Yh6cisUm5Ripddll7w?=
 =?us-ascii?Q?da2Bv3CaWbj6A39tQC55uqAEBsqy9mRDidWqu+lztATpzyMaRkTUtXStGBDV?=
 =?us-ascii?Q?qjeA1jfCMo5lV5Ybio3wGSSciA8L+YbVc6qHXh1uG0tjI2WU1QDWNspQ33kU?=
 =?us-ascii?Q?ZT9SnhbfDpLLVirSfKEjqSYHH3TMGZOj4UDYCKG85QKNfglKXTDoiJ+SoglD?=
 =?us-ascii?Q?Cu9Waeqqg+I+HoAkGMcSJBW4otpj8exxqOq9DCvJmf0rwluxwY+zFZRaUJaZ?=
 =?us-ascii?Q?rWI3mK05mdf6LrxSAabKzs7CWh10nyS6+w0YCov8Lbwr0wnReb6hHwiX+ni0?=
 =?us-ascii?Q?kcmbM+23VcCVxTQf5ZbFKwfOtnZcqQzjmqrVwMbEpoGtmTmK4Fup9toiIFpB?=
 =?us-ascii?Q?6QDq4ji5I+J83i4wbehxRyUrXFlzaon5j+Dd00bNGT/MNKpQUVv/m4AKhs41?=
 =?us-ascii?Q?nENfn27R19cgZATFVsFYWaqF4cYRnkHv7IkgEkdYCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LJ9L1De1d9qCVJ8mj6IwOdiccVZIpaqV5uCWO3nG734vaDKCd3aDKXLkDa1z?=
 =?us-ascii?Q?Zp53q9u0iaPSkwkhZtOPRGNFijAE6RQTFQWFJ0ALXhJLSJKU6GPGOFBMBEgX?=
 =?us-ascii?Q?Bu5wLrFldlHIcP0LkQHAal2HV6tTH9XKijDTUiicBioiW7Igwq7Jx+R2IvGH?=
 =?us-ascii?Q?6H5YGDQ81qGyRVN+bCi5UWEarU9M+kzGhabXt3qlmAX33K/MTQlp28xw2gqG?=
 =?us-ascii?Q?ppBVjWl4emn4Zs/xQSIB8QH1kdSMfa4z7foKH8mtHqcQn8r4hhVccxvMitbT?=
 =?us-ascii?Q?SwzlGvGif8k9YvwcFT7D4+yDb7S6JokS+ygdoKFKZkaTl5Sj2JiTnoS7Zr0Y?=
 =?us-ascii?Q?yXaAGYLwVLtDQV3iUi3zdenikXR7nDGtSBoqy5wKYCw14/9NT2C1lwI2QRHe?=
 =?us-ascii?Q?xBL5z4Vvrqd8ffRilHwW1IMYoV69VYiD8P+MnBld+YzVfJwoUzaT3Mhrz9bS?=
 =?us-ascii?Q?F1rfgi99ggAARxhSsgqOI+f1Oi+zF3y4UneFW7o8JwhPDW80lfZXO0XpLN5i?=
 =?us-ascii?Q?RPH6o1gahn1VhVguKi5g20mXQRgwVce208qruxewxT1RppH7c2xz43HRvMl0?=
 =?us-ascii?Q?9/yOxJoWqQvl363hia9wpKNLgBM1qzKTiMrgXLebd1Y3IRbi6F/GDp3fIQMS?=
 =?us-ascii?Q?x8TUTwswwYdNfHDV3mtazhj3F2oll5/lkE1Vdf+dP0GEnk+QqyQFhMtew/AO?=
 =?us-ascii?Q?vPaPZqUu75sr8PMi6YarKc0aMlZcSDmQHH3EvZotOx5XkPTfMa40D+/b+uDI?=
 =?us-ascii?Q?6tu+ug0LpOw0vnhgs2n8LxyUNUeBmI/RuXvZ+swXfbZaYiqRw3ceeymSpALY?=
 =?us-ascii?Q?zR3Q4jZWVVvREGFKhdu/bFiVzVSMxZKbcQD6Adh6JC5+wkRwma2xIUj9APmF?=
 =?us-ascii?Q?DFApkUzh6dDM4Mi52uYHUSPSnfRC37fwkKc7//b00rggo4nsIDYTmWLHsaKT?=
 =?us-ascii?Q?3AEn637zJCuJuqfYAF+0ZUMi0tPq+AJmsYD39npsILaKDl1zfp4lYeRLMPNw?=
 =?us-ascii?Q?NXTxDnKovKJXntjVIqj02co4DyhospadeXfvaPhwjd4KjZW3gO9Ei9PArHmf?=
 =?us-ascii?Q?1Lwb6FSmuxxzayri/bP+qcxgOp9jRc/YfuGojm/urhbMBSLKb/vX8Fo8Gve5?=
 =?us-ascii?Q?YqIMouuE3OYJk9jQvusB7WlLlv1kyXVIdU+Hf5b8e2u3evNnwLUPMVkGG3ks?=
 =?us-ascii?Q?VOkuIU2yygVFvLEMvPXiYJrqIxNh9N+Xis1oGOiShr/vVwoUsabIlc0m4a6a?=
 =?us-ascii?Q?ty8OgEMAJS5Z+LaYTnECrTsSF5jPMMENfHpk2E9+DWHnjLbs2LHSL5kZwwdK?=
 =?us-ascii?Q?TEd9pdYCLVDshyjX/OzNHoEBv3Igs50dt41yRLejVyv2qeVFAwKMm58PP9Rj?=
 =?us-ascii?Q?JLgEyD3ZLLN7q6iOXMZ8ltCtoQFpA2FAsF++wQtCjfzsQJqWgtRsftP6+g8j?=
 =?us-ascii?Q?ABvaK1Ha0R5T6XNwJMS04eEs3ubxw0MZ70QbQP7DPuNqviBbv6z/1W2WAlui?=
 =?us-ascii?Q?mkoZod8+HY1ZVyHkXozxRfC/wA7jkxv2Ef8lFA4hpIMhgb8aFDIwMJkofSj/?=
 =?us-ascii?Q?Z9bRHGozCUMZ6nwtKM6KZkwWSH5MKDTQVixnnO2bgWAtYpqMgLrKajnACpxX?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daf159e5-a10a-4d25-2cc4-08dc705ca50b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:17:19.1071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXMzS78VeVUNHeL1VEfhfSHCzcCsSk+Jb40lNBReaI7/v7oNIfb1iVTJN9VMLULD2VrS37psPNibra8JFSE9pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
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

GuC reset status is not reliable for this purpose and it is
once in a while ending up in a situation of D3Cold, where
power_reset is false and without the proper memory restoration
the GuC reload and Display will fail to come back from D3Cold.

So, let's do a full restoration of everything if we have a risk
of losing power, without further optimizations.

v2: also remove the gut_in_reset function (Anshuman)

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ---
 drivers/gpu/drm/xe/xe_guc.c          | 27 ---------------------------
 drivers/gpu/drm/xe/xe_guc.h          |  1 -
 drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
 4 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 906b98fb973b..471c848b2638 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -431,9 +431,6 @@ struct xe_device {
 		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
-		/** @d3cold.power_lost: Indicates if card has really lost power. */
-		bool power_lost;
-
 		/**
 		 * @d3cold.vram_threshold:
 		 *
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 0c9938e0ab8c..7860b720a99c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -938,30 +938,3 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
-
-/**
- * xe_guc_in_reset() - Detect if GuC MIA is in reset.
- * @guc: The GuC object
- *
- * This function detects runtime resume from d3cold by leveraging
- * GUC_STATUS, GUC doesn't get reset during d3hot,
- * it strictly to be called from RPM resume handler.
- *
- * Return: true if failed to get forcewake or GuC MIA is in Reset,
- * otherwise false.
- */
-bool xe_guc_in_reset(struct xe_guc *guc)
-{
-	struct xe_gt *gt = guc_to_gt(guc);
-	u32 status;
-	int err;
-
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return true;
-
-	status = xe_mmio_read32(gt, GUC_STATUS);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-
-	return  status & GS_MIA_IN_RESET;
-}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index a3c92b74a3d5..af59c9545753 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -37,7 +37,6 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
-bool xe_guc_in_reset(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a2f5a1b11cbf..de3b5df65e48 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -404,15 +404,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
-	/*
-	 * It can be possible that xe has allowed d3cold but other pcie devices
-	 * in gfx card soc would have blocked d3cold, therefore card has not
-	 * really lost power. Detecting primary Gt power is sufficient.
-	 */
-	gt = xe_device_get_gt(xe, 0);
-	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
-
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		err = xe_pcode_ready(xe, true);
 		if (err)
 			goto out;
@@ -433,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		xe_display_pm_resume(xe, true);
 		err = xe_bo_restore_user(xe);
 		if (err)
-- 
2.44.0

