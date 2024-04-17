Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCB5C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1401710E4AA;
	Wed, 17 Apr 2024 20:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bl3xEAhH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF0B10E4AA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713384019; x=1744920019;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tCIv7sxJuSpsP2jq9ubTm/HVf/xbDg8tZZ6mfeZfxzU=;
 b=bl3xEAhHOKzFHRptZJrEZi4XsX4yaO65kIMtcPCvLNR4Cf+78ExUDojn
 rXsyudYIs+RgKcuB9NP+04wbu78I0QHHDr0oNEknbAlkRco/CH0BIwhmI
 5uPRpOmTOaQGaQajBZDWHZADbbjKzYZ3ve7G8L2VOkju3ckPOCJXZssqJ
 8c0D2sicsReoabLKaRrjNvS+m8CgIZRw11LVGarxALn4IuTmMiJHihbFF
 KVLZcU1jfFELpD0euHo3ojggp0hHrmPam+XvJ+cnQsO96eyzlexlopwcO
 MUTsW4zwTcHhnBo1UljPa8G1ggplJtxOgWzRm8E+7lERMGTQxZVLMJACg Q==;
X-CSE-ConnectionGUID: aC0E2rqrTkahf5/tqLzS9Q==
X-CSE-MsgGUID: fMKBpCLDScy0NlTE85v28w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8735110"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="8735110"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:00:18 -0700
X-CSE-ConnectionGUID: sldfOPyxSvyumxueUFNcUg==
X-CSE-MsgGUID: C2nID0JZRxunON2DjrEnIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27516142"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:00:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:00:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:00:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:00:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOkdIeKlf/YXSmEKwuJTE/pl0Kxo2cKxIZodcfVNJG0sdBV10oZWb1JIhJpKaYgAqpIyKldsThUN8oyB8DlgmCinfojsNNBMC12GTIQfVrkBaPb8hV3QCqWcJDJi3z0agdtl05n/bu/braCG632eK2XkchwJKYEjbiAH7odxe2VC51b19wgv6isLbqv6eVR5377puRcSW8KklZTWdT2+1Os5I6F5v9sMhOMmlToFMafw32Y7SFfCUHt1jBW5FSeqk0nftal+fDwKPx1K8ajH3WjLAZApC+/+zt/1evJ+pgjvAB4ieHFLX5M11kp5NnbVT5H4Qhh9MRiIzHNUmHjI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmQAgdhjWCHaUb9jpuA5qRQ2RUXqui5xyVnSMFXiF7o=;
 b=XWKEWpInYD9hS7WLG2Kodo5sUCMjiCweVCsdmEIUrm7JXmEKSNKg5RFaonSLoT7H3h23GYcZZaGrFGPHLOoIEZkLDlwiKWsCW6s1kgLgFMBl139TYhrVxzV6V0cD25E/GT2aA9iGWyG81XTUoCtpuP0EXEuI3IYIpnWoHAw5nbCfi2jJohkcCp+49b5hU4VHp1YUDvXQz/Kl7jvA8WXjC6Wb0X7Fnvg0Z/dEckoGYlRWZUjvmE1uzueqlZ5d2GbrKKC7+fdW64OrER7gEKPprNvfWaJ1S0pC3NIOV/zb18/aGOCFmzLQAyTyg3FggjHdOyzerXAr5OXhLx4zAZCTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 20:00:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Wed, 17 Apr 2024
 20:00:15 +0000
Date: Wed, 17 Apr 2024 15:00:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/xe/gsc: define GSCCS for LNL
Message-ID: <pjhjle4cinjblusjsr54ycrcnm6k4c3stseah6dlvymedkoxpo@nswgln7643pe>
References: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
 <20240416222159.1332619-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240416222159.1332619-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 07681d9f-242d-4ce8-b345-08dc5f18ff99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkqYfmV/eLxPlx792k5KhV4DfkPClXIik7ya7nIlRFwBfdAmUpYwQdvpvICatMbS+0Gi1bVXp3wofXgWjiGaR5k6omwfHAxJV6DZyqFWCb6/FduGUMD/zOsGB31ZJ/bKjPRGHXuYXOESFWV7jeQ4465scRzniEjjrzwvYoFBFCUR/mBLS9JJOl/JeMKWhnrG7pZKolew42yrkEpnh28dURaEzpEH2cYjjMBEF3zkanEmIOlJCyOaZYfUQADR4SrZplFtQCksh0Gt9l4PZvA1HrnKi305GjEYyb6DNQJSMesaE9qpMM+xkLhTzgFXV4L/Bk/ejnu9XCdRTS5w8wWl2x47KoBKCCJ4ZfGhwUkDg0uw1KJbv/B7fLTkcSrTBXQdXTo84ekbNNe6OyP63C9g5OWAPJl2jvOIwyplj5G3NP8Y92bowUIS9enYnh3HdelXmdjYoNnoNIajSaZLPVb/0CjMyhRjV9UDPoNtwwyM30bKPMO2DtGWTb2Py8/eodFJf7xP5RDl/ilYkYdF+TgsSCtNRh1cAEjkhRIYFle5iNYG0XTeM6m8pq2fisxyUO6vl6KtPhs2V2AJpP5xwGWyGetHKOZzxTG9o8TbaXzZlywEJUdugB5gnX3qdr7PszuT9M/j45XZV29EymoV823WVVgfilTyhIhmZfDN6U90wis=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/A90mXdmjghhnDfTyyEdh+PBrwCnn2ypfpgu02Y84vMlgprA1A3Oh/2jmkdq?=
 =?us-ascii?Q?1TeBfRPei+MhX5NzMd1n5zrXhTVxkrYWTZuFhjsSIYs1K5aFLj5p3FNmx0BD?=
 =?us-ascii?Q?1agVkbE882s+uF5NUi569yr+149pmM+2qoCW/johS3Set6EYFmChKSVLLtZv?=
 =?us-ascii?Q?C23wPksv60KVZZMt4vXcsyfDGrQlLKHKGBG6/iTSa+VOUBZl6PJjqNXbiUyn?=
 =?us-ascii?Q?feBr6I14HXrgQW8Byjo4c7YE6iipzVw9UU4Xj9rj5rKbWXxrN5jsl9Fjizvt?=
 =?us-ascii?Q?z2TsWpe43IuA/YaXicHe3ORJY9/z/xfJ+NQrdIWf8YTCoizJO8nsYtzhy91g?=
 =?us-ascii?Q?SeXGzZbWQ+tzAXN0TCPNmoNssio9kvRJKvCAPL1zRxoCX2qrI6KFe4XHscxi?=
 =?us-ascii?Q?vajIrprSMEluO7uL7jvFnYfE9V77hDiWPBbaDS/8Z3i6F0f5PfN0RGCYfrFe?=
 =?us-ascii?Q?LQHcQu2nFrCx3/Eu0Z4IrDHt/5BwJmMkMazojxc6sf/bzpI3BtGmE+aES1aM?=
 =?us-ascii?Q?bLpzCn83W3RGWCrpTQDG5OPonwWVFiVWcHmrFw+ahMIDdxAXb2ple19syFqh?=
 =?us-ascii?Q?af4caMcoeAUlgoxdhyS3ScNk1T+6k2MuDQksqowPQI0vL1KLylViK3NvZ2D8?=
 =?us-ascii?Q?+kZRE077vrhRjknbrz9a0eULkKz2McYMsW2ISqQAbCNBhXzJcE9XcrJyj/eQ?=
 =?us-ascii?Q?qhYF9rfDogQx0e+dDat8luR3NJiWBtibu/4Vxmx3WoRYJpbHX1xSZfUTbYx1?=
 =?us-ascii?Q?lysvNUTgh/r5qPjI47LKVKMFYFkexAPtwGZP880+eonQ27zYdeDM2GK85YXy?=
 =?us-ascii?Q?iHtUqEkzSkxpja2mP6h7Q6MaZrLqKG4MPIkeW/T+Shj7Cy01RuSmppbGukfw?=
 =?us-ascii?Q?XG4kJesUBNoB7cHhzga4TPyj0VV1uHlwsvRIVWoR3z0/w35vR6/QTHLQ9QDX?=
 =?us-ascii?Q?hRMfhuWJdJvHyruw1HkCOS4+7dqkvkFn37JcjuBu+loYRoL7w7KlxjrqCvdV?=
 =?us-ascii?Q?18mfkXjmV0jw1IySnF+/TbhPmlbhb7shbMiJc9hfOXG4oBvvFRhB2La2f24y?=
 =?us-ascii?Q?Y9bUp1dseJR9pR/TLBu/9dv97VFoCH6QTMj1bS4ZsTGXwxrrviDEFr9IYe//?=
 =?us-ascii?Q?0p/U5RbVRJLpJ1f1ulQiW8fhJJSrhdw27aLYfEux5y/oscIsggDFLkIrqJZS?=
 =?us-ascii?Q?3qUt6M5pU1GKp347Y1Pd7IyBbx0u3r1WT1P7Pkqm/VjyhlFJ8X9hrTPqHVOu?=
 =?us-ascii?Q?mqO1v0dazb0uNPDiIL8M1u6QR2Mm/R6ZwQYgqEgPlgHiw3zdWVkUfm29qzV8?=
 =?us-ascii?Q?cO/CXpfv8QIVzSkc9FdRTjtEXN46CsKADMrImoFCOA3sFxd2kE8QS3CfODxj?=
 =?us-ascii?Q?hczEwrLSD+7Bm4nJWd99KfrXPV6q+PUvx+N3rnD1kQ65wRGzw5sa3egp6hz2?=
 =?us-ascii?Q?DXW6TBUTWqv0bdBpaFIDukKFaCMvXXLZE73wNfjwy4QKmAM8zoEzbJhgcvef?=
 =?us-ascii?Q?+eCdxHlV3iNp+KESWxB23e6zpFl8Yi4bjJPB220v1D44/d1UB837ecXaSJQE?=
 =?us-ascii?Q?9AKM+KgiEvrH2QwUsDoY0a7mdXTLLQKyyr8suhxknUs42wNFD/GEWu9f451/?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07681d9f-242d-4ce8-b345-08dc5f18ff99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:00:15.3510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmhraWRbeKFd7VQRixTMucnNrIpiu/X4M8c1Lf2a4u7KAPHhpVchTjk4WBJWB5rYixYt6hOkEPWBQGDX4lSoyiCBkfFTWBGIIEU1ogRjjag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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

On Tue, Apr 16, 2024 at 03:21:57PM GMT, Daniele Ceraolo Spurio wrote:
>LNL has 1 GSCCS, same as MTL. Note that the GSCCS will be disabled until
>we have a GSC FW defined, but having it in the list of engine is a
>requirement to add such definition.


... which means we could have gone with it defined instead of the TODO?
If so maybe good to adapt the patches for next platforms.  We already
define other engines and rely on fuses to handle things correctly (even
more after https://lore.kernel.org/intel-xe/20240417152621.3357990-2-matthew.d.roper@intel.com/
is merged. Just letting the firmware absence do the right thing would be
the equivalent of that I think.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 3b30353dbc09..ad46ed6a2de7 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -209,7 +209,8 @@ static const struct xe_media_desc media_xelpmp = {
> static const struct xe_media_desc media_xe2 = {
> 	.name = "Xe2_LPM / Xe2_HPM",
> 	.hw_engine_mask =
>-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
>+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0) |
>+		BIT(XE_HW_ENGINE_GSCCS0)
> };
>
> static const struct xe_device_desc tgl_desc = {
>-- 
>2.43.0
>
