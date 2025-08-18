Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78954CA0EE4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 16:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB6F10E07F;
	Mon, 18 Aug 2025 16:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPbozj2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A16610E07F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755534555; x=1787070555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fnoBGPVBWWvzEulLK2hu6GONMvQwwyU2JBGiLmPWClc=;
 b=QPbozj2SXp/NUoygrMDPmSNd9PJpw2irj9tZstDycwuuJ/kUJY5fDfc2
 eQNrR75YqXIt485gsrSvPEAEUt4OPkMqIiZy5Kx14URN6uSngqhNyvWG4
 NCHEKgtQGiHiCRBH+YhTjM779Cc2gqyo1lXfPn7DnUTufbiIgO//EaHdl
 z1+mdj5UxU21rj65yq2p8mDt8LfEnO3haRI094gE0TJm9x9S3FYGPOhQu
 z6xoYAlB/aJSht78aCcQQ/9YimvgjNCY0FqE+HgZ3BBaKPBrqMxPNtEDt
 m+xUxqbpo1mc1sS9UKZnbMmLX1HipZcZkv7Ok5B/aGEyXOwNuEtbkfNqt w==;
X-CSE-ConnectionGUID: PYT+uP4QTtGEqS50felWTg==
X-CSE-MsgGUID: GsE9GdDmT++4Y3OmUK7tmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45337396"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="45337396"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:29:15 -0700
X-CSE-ConnectionGUID: P6dsClqxTU6HMyzWi9KSCA==
X-CSE-MsgGUID: 7ytQwCWcSyK/vGh8Bqy4jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168003373"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 09:29:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:29:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 09:29:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 09:29:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkvP2ImfheeiJ9deVYLD1HVvq6LIqZR14y2Jn3VCiwEsYsaHknREL4aMej9f45t0OYXxc8Tn726APVYiKDtyv0gxnVEris9QlmZ8WL0zdpuCu7oK0l7EoDcvNRUTDptOb+Mn9SVvt6I2/4OINLBSI39wKKRGLjjUwUOePLR24w14xEk1NrXkv+h4FhnJW87wmj9g74v4GszzPo+2ruSLN/lKp1GmpnJLo0Hq7fuLACeWt7df76xq6KQ4AJuFb4BWzqkrhtHFUQkjH13zFCbui5kHx8nbO7LcBMI77ZOc+hBwNbvc2JW43JsIa9mSfQ441LRHAVedXvBLORlxHZtgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXLxoSeoyD3eAActnCYM7JXg1A2Tnfg3XWp9KrvCM6k=;
 b=kdtlwj0Hs6S1PDF+wNhsFmV8orj1Yjf8PODZHv2TYTEZYCUvttOLjjvfHuiiPV/Gz2PVSCgShlXhwdm8BBHsYEtdATOH2oOT2nVR5rTcTnO9wrKvMAleUc3A6Ltw/lUy0c7z7MmxZ+uL7EayM8uVnSF/aF/3WcVNMPMOOwRkyrsytcIMEtBL19UX9miCL+Ybwo4B8MB27Pv/sXvzSAFnSdNrgbEuhTZ52vbxGUziZU3sg9ixa5E5AuLBMs3fXN1ekG8LiAUzJtwckYZ5xRwvOJoUTMX2syaO2qbDT0ZpCAWldpNFb4uQMrIJy2ik/cxxGsrmB09mGqRBZbqYgD4ZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Mon, 18 Aug
 2025 16:29:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 16:29:12 +0000
Date: Mon, 18 Aug 2025 11:29:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe/kunit: Use default GMDID version if none
 provided
Message-ID: <xlvfmv26p5fkdhzsj3m6zkzwgav6djsoxspf5hkhczrwlgbpal@x2rwstyf66t6>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
 <20250801181350.180780-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250801181350.180780-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a5ab46-66c8-40a3-2694-08ddde745d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w5SfYvwfzxO7iL6QfAjStoosWO1aZ6sU/sb4sOK/MLSbFoElNT7BICbDc1wg?=
 =?us-ascii?Q?QXQfv3L5P6hUSkRZ+sjcVLg/nrbEwv3al8rottr/dJE+b0AWRG6lcba4YR/5?=
 =?us-ascii?Q?iRR4sAfLN0nsE7SMGz6WwdDT4npTMIcCMUQy4//rwYruufiv/tXF6dshuZhf?=
 =?us-ascii?Q?JVa43SCAOx+OTBYMgE3LLjQ6ghPtGfFszEWwkZ9oEKc0Qas0iHYzynqI6WnI?=
 =?us-ascii?Q?fk4fHycnRdzDA5RQynl5/IMPElb4Daue9vr9Cl48/jcmMTylg8/aBoE53P6V?=
 =?us-ascii?Q?NL+Xu1JC/F54C790WDG9wFMPjCzKkB+koU+YDqHtaApN6LS1zvtaEHotOe/g?=
 =?us-ascii?Q?zlyWkEh4KjTgTG5xLjnRhBHFPAXoTrB/W1EWi6BGfZNzw8WZWMzAo3i/hPpP?=
 =?us-ascii?Q?OCfRqpiHxr3DKHHBX28DP1RdVdj0GTs/kYEWws1byVBD26HepdK0EVDC/aaP?=
 =?us-ascii?Q?4L77Y96VFM72tx5hLu6++r7VItDygi4PwzC91lYKlVaMoRgxTY3SaPMk6a//?=
 =?us-ascii?Q?0ddDMbZc7XERUKLGQVy5+dIaZbJOMzvgn/l3t4qrB+HdzmjsgrxRRKUytmR4?=
 =?us-ascii?Q?BWlJpxGJuIipxGNNQHO18dfUUOH0tq82spME55DBtZIK+cDhaJUAtkWLPKhz?=
 =?us-ascii?Q?frkwwk/gpwNOLnDwzeSkqznSifdL5ilBSECOHFqtFPdDVX8ZiM+X8rYNWcZX?=
 =?us-ascii?Q?I/6K6HKuDOss7XAqvcXBKdyU1yfh8F/cLkj21Bha7JGJG3SViToH/q2Q2LML?=
 =?us-ascii?Q?PJe3SqkKGaV69F5gHTW6sc1u7fHnDL4ImLe9FaZ0/H8BmZ9h5JJrIgJ7i4ws?=
 =?us-ascii?Q?pe0ElPYFFHN2A5gBGdwvIhwJtmaI2mlJdvC9KNkVJyqwY2zJJFKQ3PCdI+EZ?=
 =?us-ascii?Q?xVrfg1UFO+DmwBdL0275QDHfR8zgonXg6yAcF+VWDtVbG4aCXId03FLAp9O0?=
 =?us-ascii?Q?9vAz50HbnMB/zxS7a2k8PAbZGCeV4CbpKiGitnzntOcsjPkG6bkCa58L9EG4?=
 =?us-ascii?Q?G1UrO5XS6zeogRjPeOu/42eUG3exMBW063ZmW30fwF4osWFHXF1N2ipKcawt?=
 =?us-ascii?Q?Mbl/hnwGWH6OgSE0sdxCLxOIxFiNHBMYHvuuqv8UTOGeW+Nsd9tyWBkNfkdG?=
 =?us-ascii?Q?4QlXuGbw4AnZ1JLZyhPvwWXytkL8j/2MXAEwXU1f3EKVY9vhY10pxQz+pRAP?=
 =?us-ascii?Q?LttFmDrgVKOAwqPbtWgpQW/opn0hucI70KHpKlEzguE2js1f0u7+p7rcdyRC?=
 =?us-ascii?Q?FM1xbY+O8Yj0wXyGxih6APjfT1Yq43aKKlnDjkqytVDF55b02r4hZbIkziGR?=
 =?us-ascii?Q?vFu0F2QKAWZYvDyy8FheBIlyGcuJbZEq7Yn4y75sGat7vZcJGLUUr/JWopqV?=
 =?us-ascii?Q?m8SatpTCvaAC9s+XgxgRm+/mhKIzU1x4kABRkyx3gtuwQUrINexxj7G7qW/K?=
 =?us-ascii?Q?LUavOrkO6XY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kU3VJs5fYI085ObhQcvbKc7JVQqjz8BbK1lD9sNVFSvVz0+URtKFmv/LiYnc?=
 =?us-ascii?Q?0Vj8NxUC6az1U+deFuynTRIXIriykdLxt44NMBG1uJjNd21lXZixj14vmObU?=
 =?us-ascii?Q?LFAvPoj7xYPnDcKOsZwEvkpIPSKh1RB1TLWfvgi3Ms+FIXkK9NspjKScyxfk?=
 =?us-ascii?Q?cdBbFeJ9pWWcOBj9fVk1FUgCb4J8A0jy1TMTN9ek4aoVQdqCT4HYP5i0YzOM?=
 =?us-ascii?Q?XkfFE0W/8bliJxOVqneZYk2slxQYb/pKuLyMcsx1NUAsRgwiI7A8zp3x1EPE?=
 =?us-ascii?Q?dfUdDjKls232h+4tErfv+groiso4vfKwmVOKmnO6lixDHDG2DsOzXH/btoVj?=
 =?us-ascii?Q?EiJwbH/yPtXcaE9D1mZdrwptgrrADB9cFZds0Gy/vTajNei9x60ZJA4tCcaV?=
 =?us-ascii?Q?1/7pf28I5y6neBMLcQYCG/2odlg2LQsPHKFYqw+4U4uwDoCWfQty4+YvuWzJ?=
 =?us-ascii?Q?Et9rcr0crbyyf+KNdZaAft/6iyO4xvY9UJTcv+AQOo0shY1zRj3Qi3BzZWfL?=
 =?us-ascii?Q?+dtj4+YYM0yIrYuPqfDzWnRpgcxRostmttJopWu6ohYfIML5gn54ZF85YeX7?=
 =?us-ascii?Q?xMVEbe7X/V0RAvt2Hlh4IJVQ6QMYvSw1Il7SNCg+MJiEJdrCbDFpoIAfsJX/?=
 =?us-ascii?Q?+B96uG0hMeqFNAKy+P+Lr/M/lqfDQtBuH9FIJ5ey9W3PbRcpTAvxWtumveYP?=
 =?us-ascii?Q?VM0cqD9wr8un9O6+JTmfoDVKR2RLjejY1bcqRFsrD5JWVtBrTtnnextHvCpB?=
 =?us-ascii?Q?zSsg4UFFO0pSZod5lAseMfJZTcbFMarIwikuAC5dwEUa33GHW2Pi/ndwn4rs?=
 =?us-ascii?Q?ubgD8vS69SOLd4G0UNIkkP5VjJ2nOIsNfacDaZwAgcudtj6COviyZ1dkDY+Y?=
 =?us-ascii?Q?Cgku77Vt627fIub+UL+hOkwvIU/zoJk83SZxLOk6oSVCsfh14yY8/0NG/QKD?=
 =?us-ascii?Q?UQ9jTHsbgAiyPAFe6M9MZH0jtc2l+PwK8t1tJGJzbzIafKJOh+iQI4sBQYr+?=
 =?us-ascii?Q?zqQKNhXVX0ggxh7BRi5ekofm5QCOf4+2Xv5dPjsMUIgHgJCrwyR/Aboik51P?=
 =?us-ascii?Q?J2B1iVWsZLFGpfzuMugHTKGxbNzg2hkQLPMt/ZXwg4jx1qb8oCGbcewuRCUF?=
 =?us-ascii?Q?FIwmXf7oWSx6YS2VBHJhqAmM8joWAVhKgEbyBZ6kNVuDjhlmf7MmKPWXem5Q?=
 =?us-ascii?Q?8K3UrAX59HX4idtKOvKcepzdVb+WrIooA4/cKZ4AqpEbrM1Wh8PPqvI1kkBz?=
 =?us-ascii?Q?yGtCSAZ2EBJ9sTELRiDPPjvfL6isDnaMPbu6sIO0a0BZDnE9xkwYRdyhARQP?=
 =?us-ascii?Q?mUsEdMyHzYF7utMmCp6oEtU0Af9XtlXamw7qn1I/TGAGavyVGXpEC8poq2Ul?=
 =?us-ascii?Q?TX++dIWJ2/qiy2ApkHHp6XBhSlAd7gQt/o0GmgdEb8ZruVveA57is3JrS3HR?=
 =?us-ascii?Q?0YMPEZrZg/eVM4z85t6XMIkv5+UCEHTbECP2/zRsCaR8+kvUG+WMC+API0em?=
 =?us-ascii?Q?aHKQYKZpMvzyqj9GPW58rot0kujyciEfFMA/NdEnIMgtnbbhTo98hA3Uf/p8?=
 =?us-ascii?Q?n8QeoJHZ8GBsOsjT6eElIjMFcfQxZnG/GKungI74vKCbdjdNIQwJM8h3QWk7?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a5ab46-66c8-40a3-2694-08ddde745d40
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 16:29:12.0485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbR0DWzhcvfwJ5eebqDAMMU7t+qqlERI1dcSTUoWftW76yKhajBZ2y3zkzW8UTglloOF5KZkfNeOyy2wGB6YoKtq0SfH1RbRFYdtTGZzocI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
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

On Fri, Aug 01, 2025 at 08:13:49PM +0200, Michal Wajdeczko wrote:
>For pre-GMDID platforms it is sufficient to provide platform enum
>or platform/subplatform enum pair to get full fake Xe device for use
>in KUnit tests. But if we specify GMDID platform without providing
>explicit verx100 values, we might get incomplete device test object
>that lacks any GTs.
>
>To relax tests from specifying full device config, use some default
>(or first available or defined) GMDID version if none was provided.

but would open the door to some bugs due to matching unexpected platform
+ gmdid. I'd rather always specify gmd id for gmd id platforms... as we
are currently doing by differentiating PLATFORM_CASE vs GMDID_CASE.
I don't see this patch being needed in this series. Do you have
more in the pipeline?

Lucas De Marchi

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_pci.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index e78d10df8359..90c55f72d687 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -262,10 +262,10 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
> 	struct xe_pci_fake_data *data = test->priv;
>
> 	if (type == GMDID_MEDIA) {
>-		*ver = data->media_verx100;
>+		*ver = data->media_verx100 ?: media_ips[0].verx100;
> 		*revid = xe_step_to_gmdid(data->step.media);
> 	} else {
>-		*ver = data->graphics_verx100;
>+		*ver = data->graphics_verx100 ?: graphics_ips[0].verx100;
> 		*revid = xe_step_to_gmdid(data->step.graphics);
> 	}
> }
>-- 
>2.47.1
>
