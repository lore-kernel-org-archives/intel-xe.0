Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96362EE4993
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 14:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5388010E378;
	Tue, 22 Aug 2023 14:20:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C1210E378
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692713998; x=1724249998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hAauFjSpbXgNLOu74sWoCVFudLkjCTUVjy3GeMck8ZQ=;
 b=ZOEZdGnIHxumDq8RUFfhM1e4aj6W1HSz4R7U6plxnT/Znhn3ekRpuxno
 7OQc84wwIdbKG0/lIm5VeoDi/VuKBKvAS6049v4zFTEvkPUwlU4kG/jY/
 j7zlccjiXRYsnj8AjDsHcOGAyOKnHKLglcYQxoGMhiTtrDhrHftzqpumO
 UkTHqoiQA/+HAzvSpU4Ihay56k+HOjhk04QHMnWYD47eIXziJIZBcxgT6
 oEVQ1zKf/0RaBJVHtPk/WWbTzUuFAQTczehGDlvVAf6h+XNG5RAcGVk2U
 tGwlPKoP43GObfivzgddxHBDit+7B4R5YtmBl79QuN1BSXFIuvVDn4Tdu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364060356"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="364060356"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 07:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="713177723"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="713177723"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 22 Aug 2023 07:15:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 07:15:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 07:15:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 07:15:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 07:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBYXzz9LTCabO1Jyf2fzcEi+s8dLPPIGhFWZWE3cksjcwfhZcFj/RIPBP7AH3c6M4LtWgqP7iCLqtc/1iBYnsudq2BChMg5g41gTEsswYpox6cVOPhVuwikv7JgaoTq1FE/2aSe7mjaJzvfoNFOjVplwDAOeAGFo10xzDTvHhlU09KRwNxkV/RgTWgo1FJjqvQghuT3l9ISGSXRgcHDZLv0s1KDgWMqtSgte5yFXgSoH2zpuCfwneE86GtIS+JziP4+m8iSl9+C7Ydp61E3r3xzaE4YFMW+2z6/5BNVkNmeDb0h2UEVfK11cszzSL+m2NYuSwGcWLmhnG8a33n1bmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFiLFyLVlJnipHrR+Ez+oPdlwXo1xRn1XwUgOEhcFcg=;
 b=RFLg1tTGYuAzTVdXsHqICVsnmJCmXHkcAkx4gVdP6A85xINMG0KLjc9KjoWqMxxvZhsVahqrKBSiaud9WghMsTuYg7Fajdz7EOHbE1nrTX8yzAM6sU71DbcwY2H3WUPe720ea2nQO2n1cd30cVf+u9UZFRmLgGis4bhtAewuENSC6o/aw2sz4ujdIOQTPw26bler4l66C7K1Q7gV/2j3cw228S4jb49lnkEnzfdRflC2bhAyj3iPnswkUetztpEyROVpZl8SMIrLvzUZKIfzhuUTFm9bAJ7zrjIbuyrnVzRmkh1RUN2XLj26lQnlDcZ2QuugE7QaZ29r+GtcSa8yBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6860.namprd11.prod.outlook.com (2603:10b6:510:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:15:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 14:15:23 +0000
Date: Tue, 22 Aug 2023 07:15:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <fgxtgocqv5zi62fhwmnck52xi2ytmthy6i6ssmvefaovycvuxa@7qe6igl4mbbe>
References: <20230821234322.758689-3-matthew.d.roper@intel.com>
 <20230821234322.758689-4-matthew.d.roper@intel.com>
 <d6uoulsbl5l7uibznwqy6jkrcp2yctoryre67xn5pa4znolrb6@skw5zmgvydtm>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <d6uoulsbl5l7uibznwqy6jkrcp2yctoryre67xn5pa4znolrb6@skw5zmgvydtm>
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 22475089-8b25-4624-73d5-08dba31a3952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ds246IhpYc6Y/ielpBI84u7lg3kE/iZbClXCwvfPp1AfHek37xInQ7gIoT8/vF/TACBMEz79cftLXphslaviwtN2F+Ibmw/R20byj8bgfDKVaPNFNZv+3WXrMXfjBUEJaFEfa7H+iDlmgSINIQw7S/UI3pzN2yfToxWbjpijH2Qa/WP4E34lLuO2R3jOi1HqjNxmbkM1TUvLOzxVLrx90CqpoSSixVt4JxlA+VJozRa81NaEQNaDGrKuDJQ+Uzc3ZuOUX72mC0f0HXhRf/iis8XKIKVSmc71La2T2h/DrGGhVzdHGqXPHYKaK32Q5ERS/XLCZlCw2KCknw9O6nodGTUbpaciKQ4xGir8Jqc26x/CXyVNC3HAEnBOV0YIyUKjvsXCVDYvogCZuc6P4i28Z430Dv42+YoD//NzVvnXDuPrKehgVKQWpdAus/x7QkPeHsdPixeYhFDbq0//ZsiMxcELaieCSBRnIJ7tbfSHCejfioceBdu3muZihF8gIjbcBiq8Oh88yGBhn79DSsp13Rjm3ZmW39Jd6rQFoco7WGPXRiCdgQ/GjjkOzKsuAmeF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(83380400001)(6506007)(6486002)(38100700002)(5660300002)(26005)(86362001)(8676002)(8936002)(4326008)(6862004)(107886003)(316002)(9686003)(6512007)(6636002)(66556008)(66476007)(82960400001)(478600001)(66946007)(41300700001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5roWUUa3gVHGxzYZvUds9SWjRkEbzm6Da9cpXnBkoUtpWE+ZyYKjP34AzsBQ?=
 =?us-ascii?Q?rLrREGUnuKgr7rbqyaptqr0m73OtIcJAFM+ohzmry1wt7tZUyrLVCBCSnSWh?=
 =?us-ascii?Q?SlGAIVfl/PxBaE5jKRmIInb8ha4Yzp3OOFssc3SFlccaWKekkGsgN5Arrcsj?=
 =?us-ascii?Q?3U/M++WooK/8SeqUkLt6yN9Bm1aLrTaQ5p6w7DyhmZlDDTZwo3tBkRJT6LNr?=
 =?us-ascii?Q?3FFgF3rBqlOZP4E+GoUX2/wACCxnT7Tr40vSo4HTIh/NojoRsA8xoC4N9pq2?=
 =?us-ascii?Q?8qzDAHaj/L5rhvA6fhHGW2PmcMFAI9VWkwZYWuZMsqHYPGIpmhqa69l1FyJs?=
 =?us-ascii?Q?KDm2iy5r73JNf7MaBLjEdSQfBaElJAi/Q+11CAm/My+L5kPROIrINEm5C1NS?=
 =?us-ascii?Q?xJBoeojfBXlHknkUui6ouh2F0ZxL6rmZnimkvvFFbKXuE453Le454MOw28an?=
 =?us-ascii?Q?KJDZhJQ/rWRpe7a8r69/HY5w4C7/YC/FRgY9MwwkMlHiKtpTLgG4E06WwIBk?=
 =?us-ascii?Q?Ew26WlqarkGO4WyWgHWCB85h6AnMOBDTfEvJyGAmVloZfUPslX+7UFT1uCPs?=
 =?us-ascii?Q?qDF3scLzSQNWp1nPhd2oHP3ks5iarXgVxiwdhdugngFsV4qruBttbfcMD85j?=
 =?us-ascii?Q?9n5W4DAPPf42YbXZ423XQ1HK8l+SOSCNAzxiwNceIT3J4a9ppfybH1prQ271?=
 =?us-ascii?Q?kxfsjWdRf9lqgEHS4zrPbUqmh3MH3yCseipMQSHr2lha5eB/zQaNeCoIyAQd?=
 =?us-ascii?Q?TCVQlZFKJgq+TB/h9q3AJQ1BS7M+32cpmZOQGip63050SU2PqPbl6Re9RGaX?=
 =?us-ascii?Q?FFZyA/zf/3V4K6lLJPyKCjA5hDlLWLKAr9de27+AZEpd3XlYq5olhmsUVJX+?=
 =?us-ascii?Q?NW9gzKgEgy3LIYTGFnM5728ybaARfkGozpk4WSTBIJVpywZjwD018h1Dohio?=
 =?us-ascii?Q?UxNHyPtyrTNNEizn/NzX5yLX95+uJoCl37VsGwPBKBfUzikUzWUhGiBNu1fy?=
 =?us-ascii?Q?55kN3lYqQOYZ2DjVQ6zkoBRFhREPUwOM+Hz/nAYo61DPWUg0AKq2lFt8xelJ?=
 =?us-ascii?Q?P9delo76R4HYQnU1tPyoD2s7GEyZ6hZsSKX4/THGiWcKkOUo0dvHqAwuwrP+?=
 =?us-ascii?Q?qheyt5gJFi+XWvszSiWkLN+HCPoxTR0bLXfJ1K6WzypiXWLk9YXglxtfxq/4?=
 =?us-ascii?Q?uofpbsOKavfbDEjU7uTglVMDDQ5qREw5AvG+yRuUKZZAR0+7TJvXkB9xOFvd?=
 =?us-ascii?Q?Wvnhob07MChBXc++qPrChVH19MVAui3S1vkRZ0drY29Gig1M0/HboAeEeXSZ?=
 =?us-ascii?Q?ugabjQ8QJXE6VhhSHd8NGwGrjmL7b1Mr5BolxYTPxBY7L4JfuqMUWb4dwffl?=
 =?us-ascii?Q?fI62A7/G4ufV3UUMERs5J0hF0PoOp0P4QyQ7igw/Osou+91iB6jpJg/oZzHg?=
 =?us-ascii?Q?4YHHWalcKQLPcxgMRRp09NtGFhhdkoddZhSkAL3tfgAYZiZdTfiW/la8YCq1?=
 =?us-ascii?Q?JK0NBGEdQyupnxHduxHlIRFBacdrUfDMnsX4opjH1kvfeE2IVOdrye9BkV0f?=
 =?us-ascii?Q?pQ34/9abY/nicmuXcJd4+mg9M7HqolGlKYgiU7LiVstPofNmktObmvEbRptp?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22475089-8b25-4624-73d5-08dba31a3952
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:15:23.0553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exGp+lt2YJMhFQ/kkccSY1CoCf9ZbS1LwBRBUW9sm9qC4KOnIhvuYROD1i1rso8pHpD0ksVtqBa4cW6kzqzIC715vE/2xhcUTpzj+sMK8Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6860
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop xe_mmio_write64()
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

On Tue, Aug 22, 2023 at 07:12:48AM -0700, Lucas De Marchi wrote:
>On Mon, Aug 21, 2023 at 04:43:24PM -0700, Matt Roper wrote:
>>The only possible 64-bit register writes in the driver come from the
>>highly questionable MMIO ioctl.  That ioctl's register write support
>>only operates for userspace running as root and cannot be used by any
>>real userspace; it exists solely to support the "xe_reg" debug tool in
>
>mesa also uses it for some operations to avoid the extra latency of
>setting up a bb. Have we confirmed none of those accesses are 64b?

but you are actually only removing the write side, so this is fine and
the rest of my comment can be ignored. Sorry for the noise.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>humn...
>
>	mesa $ git grep DRM_XE_MMIO -- ':^include/drm-uapi/xe_drm.h'
>	src/intel/common/xe/intel_gem.c:      .flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_64BIT,
>
>Should we turn those into a 2x32 access? There was an issue in gitlab
>about completely removing the mmio ioctl, but that got blocked because
>of these kind of timestamps read.
>
>+Jose
>
>
>It would also be useful to check media and compute drivers
>
>
>>IGT.  Since the spec indicates that hardware does not officially support
>>64-bit register accesses, there's no reason to allow such 64-bit writes,
>>even for debugging.
>>
>>Bspec: 60027
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_mmio.c |  3 ---
>>drivers/gpu/drm/xe/xe_mmio.h | 11 -----------
>>2 files changed, 14 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>index 932aa4ca59c8..568cd106d0ec 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.c
>>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>>@@ -490,9 +490,6 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
>>			}
>>			xe_mmio_write32(gt, reg, args->value);
>>			break;
>>-		case DRM_XE_MMIO_64BIT:
>
>if/when we can remove we also have to remove the DRM_XE_MMIO_64BIT
>define
>
>Lucas De Marchi
>
>>-			xe_mmio_write64(gt, reg, args->value);
>>-			break;
>>		default:
>>			drm_dbg(&xe->drm, "Invalid MMIO bit size");
>>			fallthrough;
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>index 892e96e50463..7c525d27cafb 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>@@ -75,17 +75,6 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>>	return old;
>>}
>>
>>-static inline void xe_mmio_write64(struct xe_gt *gt,
>>-				   struct xe_reg reg, u64 val)
>>-{
>>-	struct xe_tile *tile = gt_to_tile(gt);
>>-
>>-	if (reg.addr < gt->mmio.adj_limit)
>>-		reg.addr += gt->mmio.adj_offset;
>>-
>>-	writeq(val, tile->mmio.regs + reg.addr);
>>-}
>>-
>>/*
>> * Intel hardware officially only supports GTTMMADR register reads of 32 bits
>> * or smaller.  Although we often seem to get reasonable values back from a
>>-- 
>>2.41.0
>>
