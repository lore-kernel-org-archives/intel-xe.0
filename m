Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27972ECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:20:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E7110E822;
	Tue, 10 Sep 2024 14:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDFbMhwx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5FC10E822
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725978021; x=1757514021;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sSMgpVDNji5gvSHfmSbxOfi1dNlm9hpjyiAteEmUFJI=;
 b=lDFbMhwxI80VEjsPVVFwIZF4W9ZSywbnNu9Dv0KnmTMf5cfH6NfAxG3D
 68nawjIn8BOwrZXcMOd091hOVKWFH64dqmPyj5+uiNUJfrnBChlpiYfwq
 3ky0yP/OVILD91XJ1MmKoOSa89sMz31FhztSUXt7SfQFjWQ251NbUrVuC
 b1WlRms2kGFEApHISOHKhZDXbpOOc/p0bJN8DajLRW3PDoD36sMfQwUJm
 PPJfE3OVCtNq6aydv3G2tCIYRLBFpIgJ5/FBDKHVnpZWZPf6leXFKDQRs
 cGZIAIFx7T2YpLJVUB7JQwkmpQEn2zdi6Az/yn+OWbXhD1gV6fMa3tYrM Q==;
X-CSE-ConnectionGUID: 3Tj77A6LRQyrX17BPetxIQ==
X-CSE-MsgGUID: Y/gCCFitQOa8Tlb8LEAMwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35323060"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="35323060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:20:21 -0700
X-CSE-ConnectionGUID: tA2IVOiNQ6mHGA+BARLjig==
X-CSE-MsgGUID: MJGnuyVVS9KddYZNl2Qnbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66752787"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 07:20:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:20:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:20:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 07:20:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 07:20:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9g01B/Gb59FHAHpf49x/okYLxN66KrI2GByBTqOUTjt779Siq+KhN6nU3V2JbbFWH3RzntlpRuXYlsdWAmc2mUvKdILwqrUUFNOvtwNlZqoXNxntzNK2SIzBvd22/EkF82LbDSWd/qugDhZF7x8tvoIJIqYh/JvEA8Yy6Z5p5XYVcFTGBrEuAhdtceuN96TrdDFg1LzaXANhF1xT+a4g2dDH2y/Ylan3NKdUwyg4bV2RsHNxFbggFzfp3pat7RR9EY5qWJrbDnwoleN9OQJY5L6TW9ZxTl1DG6zBLIyhl/s9DnGNO8uN8R8O0BDWaNm5roZzMRakCnF/+VAybEggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5lsBUZATJez/mBaq6vIoDXBtkFmfUC82nHzRmNBkLg=;
 b=jJpEDst0NkL9WDXgAaFyjKLg58FIWplR4OZoTmKkoaNMeSbHAyuAJncEb9YwdpaEwvnG/ZbMaqa2ImgFJYbUeK3y5FCt/eslR9EPwjT/ky35viRyclwoC5DbnV4nVSZWLUsYOHNp62HpEuYsedyo0ruQmd9tUfxAydzeEEENlIBLkCZo4PlivTr10M+vM5PytdanDqKUEwqzZNoywgiY/KK42dYH7LmbJm2FA0vjBDZGjb/FndrvozRSOndLTFJRWX9jQN70ol85AxnTMBOUs0E85FS3ZCPfT81vV/H70JiNQ0okFlniLvULlBpToJX+tNKquU7yGAfe5DM9aYc+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Tue, 10 Sep
 2024 14:20:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 14:20:17 +0000
Date: Tue, 10 Sep 2024 14:18:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/xe/client: use mem_type from the current resource
Message-ID: <ZuBVGVkmecz13Y7G@DUT025-TGLU.fm.intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-7-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910131145.136984-7-matthew.auld@intel.com>
X-ClientProxiedBy: CY5PR13CA0023.namprd13.prod.outlook.com (2603:10b6:930::9)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: e4196a5c-e479-4ba9-248f-08dcd1a3b19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uUL6hEuD5dc2lnb1xHU1ev4jq66HQTJot8VmTYsvcGYVuperB2wk1fXTaz?=
 =?iso-8859-1?Q?YeZS/uVGrZj76n3MeIy44udpI8H+UFgunhB7YLnUBtnWtwd+Ub3EfqUJ9i?=
 =?iso-8859-1?Q?GsdNjDzzyWrqSTqx28UbGKBZzZGCQluV1ynhrwVJH4tgP4/oDl6IDwdN5O?=
 =?iso-8859-1?Q?ZNJxWnz/Wh6e1Eb78O2BDk8wcEutIhiP2liOp0u1YXCtSINJS5HPKaBRqd?=
 =?iso-8859-1?Q?6DyvsfVMFZHVVTuYZaZlvad2tuotNm9+TFlY+n5clwU7BfYoRKZIEONKqW?=
 =?iso-8859-1?Q?3Zj3DoMAjSHgV53I9t0tRTKzpGGuAg6qP5jSlzLHNu5gxoTeJljsMp62/J?=
 =?iso-8859-1?Q?BC2ljhQBcBYPRjNK/df4hVi83l7SBQQlT3Ewu0y8sNKIzWT3HD5ZEHGLUP?=
 =?iso-8859-1?Q?fysYlQlbclOULOzue59p0cpR1C74P9IP9G6fhHLu5oOcspl1qtzHgHVQrx?=
 =?iso-8859-1?Q?b1D2p3zufL81rc7IKa3LbuL3oKTMSjsyBX/q+pwURHoIkxOhILzwdF29DX?=
 =?iso-8859-1?Q?V6SU5wh2OyFhU6tiLB24C66Vfcbd7haNKoODdx9uPu+N3LxieVH0/mbYPG?=
 =?iso-8859-1?Q?qg9E9Ta0vj5dFxsWAIyXuOAPyzS9UYFfIUYwEpLBs4ayEXKCcwYP60QFMD?=
 =?iso-8859-1?Q?XebK8x1CByHt/xzJeCOzW/VlEFPR3KmH4VqemD9y6G3KmNIcwUca7+FytS?=
 =?iso-8859-1?Q?xOA9IEOxQalmyJiQtSLrwkgzG/0ReDgk2OYjlgbTNIE14ODkuWp0x0fQbS?=
 =?iso-8859-1?Q?h+cyDMW1+AyGC8BSXIoElvhbN0hR5kQtpese0hFbEqkAM32TPsd6zfD9iY?=
 =?iso-8859-1?Q?03eNCRnsE7rFRnBnAR9CEm/qTZMqYx9L54rTwLB6VDPEGKduTydftkAmKz?=
 =?iso-8859-1?Q?9NCTobh7daBrwg4GRqqv2MknaTdGXb6SaYwHlADBd6Yssatnhluf23Fkd8?=
 =?iso-8859-1?Q?Tx7hsrd7oUhUS2mCsGSQgovnVdXsYWd6l7PIL/MC4atIj0k28tX1Dvi5pw?=
 =?iso-8859-1?Q?Lf40z8QzpxH+5yJdUOj9ZMJ5o4B37U3KsR6/KSv6NdaiyJ/PNYN/NBOVN+?=
 =?iso-8859-1?Q?CdLphIhsJbtGTnFBW9DW/K8cu5AbM6Gum5CwdL/TKIcaGUm0yokrNHZO9d?=
 =?iso-8859-1?Q?YMpVFk1l/CtF2TXRLmeFA+E9qUnVPENcbdUw3vcBTLalq38rTscKtRJmoo?=
 =?iso-8859-1?Q?e/BIFnEhAsPI/deKFJ+iJFN+lfJFlj4Bl8fK4KX9HjpuLNM1RyT5OKsnpb?=
 =?iso-8859-1?Q?rgjNr5Ccx3PvQAlPvElhMGIIJWGPVM1q08B3t2EkVd1bqycxpKP3/PrnnN?=
 =?iso-8859-1?Q?1M+ah2Fzp+J6uAZppEyaPspmu72txMnxNFH9XMgslNl0vNR9aejfOhgncD?=
 =?iso-8859-1?Q?L21VTBGyOoi7WQYtgLUJhy39KFJMTGfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?avD/uoJsfWondo3g6UpqDryl334+Wo56ej66NjJFX8RgtmU+Lwyc2jbRLV?=
 =?iso-8859-1?Q?9xTfSbfBT0SDOnukUkzJ+PnZsq/d+w0fCLVvZnol69AHfLzX/7DPsnV4qY?=
 =?iso-8859-1?Q?CDmGxLAejnX6coW6sV5b1LPO0u8kltKiWghwWirbIVMwCfR6pS0vwrOSmb?=
 =?iso-8859-1?Q?fYyJuHeMkR/YMLneVB1ZkQEPWbTQI69qlPEM6v4NTSL3i1QBsOxnbGHyrr?=
 =?iso-8859-1?Q?+aOcPSdWgs8PSA/QFUhPW6piyvx98OSiPpRcG3FyPZKRGGJjDo1f7J5+qS?=
 =?iso-8859-1?Q?Oc3yZM2itQesp95oPIEVdch7GO6DWgmSKkAdFhL5sWBLEt0n0+AvhwOQWu?=
 =?iso-8859-1?Q?VUXaKClh+rmv4wD2Pr7EYZkAFdiW+arCRAcv4rmnymKcf5eyDXrDGewFpk?=
 =?iso-8859-1?Q?ezEUBM/PWIudPcA71BF+aRXit0Y5OO0o7PpfRapiu8qE211cxcbmbtExmu?=
 =?iso-8859-1?Q?ZksBN+hWIRkDRcaLFkQSrMs8B90o94n0zxIZIX/S4COO2gFpNp9U662WZO?=
 =?iso-8859-1?Q?gbfuJYk/jqgOkgvkStljGTgpY59CBHEZkNEmGhlOYrLVilAkumvW+u71em?=
 =?iso-8859-1?Q?Ape88j0W821q5SUHzuI2YFglWjZl2YU47GHfSfrbT8zf7gXN6WImbd44kz?=
 =?iso-8859-1?Q?aK53I7xUDMGQn0RIKDs1mEf4jd2/Xzu8eTkBCaAM4qewQzWOzb8F+oLY6k?=
 =?iso-8859-1?Q?4UdfdwdAmCXKotwIzUosiTV8F/ohWt69DkmFr59AB590p/PYHHj5wm2YW7?=
 =?iso-8859-1?Q?Qic7HOj9BMtKHklcX1orIoQjwXGYYedEt1II5bdKEav78KAMlIbERcprTh?=
 =?iso-8859-1?Q?eYgu5u8NFb/BFu1ebMhDOpoMQwamE1KNMtSkKB5BW1scS02+6Q/sX5Nh2o?=
 =?iso-8859-1?Q?7FJP48zFO4KoSB5ZLK27MYpBJWZfjO8xa9FU10HQ7aN0BfWyyA+zoDuLlf?=
 =?iso-8859-1?Q?mHJTidCls1TIm5xIosze2y5sFLv7bM1cCQZCB52EDxyYeGG9OLwNIUw5wo?=
 =?iso-8859-1?Q?v/TPBpJdMJdxPTCVs93d3HAPXPyiCLCbBNTPpqoO2QFvrsIqF9LvfeWvAn?=
 =?iso-8859-1?Q?blqGrH73cL1ak94lawhcOBKKG3VRuSeo3YOvSGoeMaTCTNOeaHBu8lTVjC?=
 =?iso-8859-1?Q?zqOID5vs4Yxmh/texAa3knlIoDQiT9cVyG+jeSIw6Az7///f2FQ7/ogkJv?=
 =?iso-8859-1?Q?nsVREggu04iomg0cp2liQ02x+h2dEttQt+U7zX1hw4uhB8VnBgTIZNWlh4?=
 =?iso-8859-1?Q?q0mwrD91gaQqeYhKKS8PlDk9y0I8tC7taSXcvUF9jCabAfm0PYbnGcxhAl?=
 =?iso-8859-1?Q?1tbwYpyG+a+2xcJRJwuDPN2AMF5nyYfcHoUtRxJ19kiXcZTbjeVxN8Fbdi?=
 =?iso-8859-1?Q?bRGZrENTpE31skAAwaohUkt9HYzYEOpvRNu+jcv57jzDs9gtPe9dlYLO3J?=
 =?iso-8859-1?Q?B/6XYZG9xpRzYgTUeyF5IC8+KlthoZ+0F8tf6vDlKXNGm7zGwG6frtum6b?=
 =?iso-8859-1?Q?CX9H129ohizIzC+fn0vR6iRBa0J4qfbY5HJEpZtQ4p/tUQYe9prYkSo9iu?=
 =?iso-8859-1?Q?8xEh4eCk7KNT584BzzqLL7sGaDAzekDUrSpPEL+aAfKq/WC0Amo4wg69CV?=
 =?iso-8859-1?Q?ctvOYf6/+ScXf39wMMfKNbKohTXk6cRE2eFjp49a9JPCPfRLRd57z3tw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4196a5c-e479-4ba9-248f-08dcd1a3b19c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:20:17.0713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKZkB7d4PBQJamE+2UygbQ2WzEyMzcYr7oUosE5ojeUbgCH/OyoJ7jeMnTbSpjgCfMUDWMbhIuXB1qJ/0Smd1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
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

On Tue, Sep 10, 2024 at 02:11:48PM +0100, Matthew Auld wrote:
> Rather extract the mem_type from the current resource. Checking the
> first potential placement doesn't really tell us where the bo is
> currently allocated, especially if there are multiple potential
> placements.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 3cca741c500c..578d2825c1fc 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -168,12 +168,7 @@ static void bo_meminfo(struct xe_bo *bo,
>  		       struct drm_memory_stats stats[TTM_NUM_MEM_TYPES])
>  {
>  	u64 sz = bo->size;
> -	u32 mem_type;
> -
> -	if (bo->placement.placement)
> -		mem_type = bo->placement.placement->mem_type;
> -	else
> -		mem_type = XE_PL_TT;
> +	u32 mem_type = bo->ttm.resource->mem_type;
>  
>  	if (drm_gem_object_is_shared_for_memory_stats(&bo->ttm.base))
>  		stats[mem_type].shared += sz;
> -- 
> 2.46.0
> 
