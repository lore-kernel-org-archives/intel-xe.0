Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABE5C7619A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 18:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AF710E0F1;
	Wed, 12 Apr 2023 18:10:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9F910E0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 18:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681323035; x=1712859035;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ugcn0Oqh0fgBvTcD+MxiP5G82gWHJidoL0wkmsJ43Zo=;
 b=cyAEYsNmKJuK+YDWfp0XN/e/g/bTwHBb7I+eQwb0o/35eSQKyHQBzdJj
 38a2+/6D6y43HvgaiLXVWmJCcM5OZcY8CB3j0MJha2xrpvd1HvkOwue5Z
 2EyX/YzwOvug/zbDzXYETmcIcVK7nuvAye0dCeOw4qgBUyR3RW+Lb5/PW
 OlvN6jNNKP/SzYBgBNZzlrA1ekyaTJQ49nrIvBx34umJtykviBc/GjMMK
 dCyBxdXWphiO5gK37AluKdTaag728x8KlpPE4T4T8pnGK1bo7ysS1EUTn
 i+/r6Qs5YDwQpQRJXuza6u3WtDi/lPrSeKFICq57ub7Fhb6AEAyAzS2KI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346660784"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="346660784"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 11:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="1018830713"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="1018830713"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2023 11:09:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 12 Apr 2023 11:09:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 12 Apr 2023 11:09:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 12 Apr 2023 11:09:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEftsWwz9CRcZNkAthhFo8DXFdxKfroj++0mpH6yxkgQ6vzmggrb2QSrQDo9vlURHbyETZE6W+4k00jrt3+sCArA2liguudHN+P7TXsypfWl7HLlAKQWL2arAeR2SoaTWkMMTzDJ7lZmLzL/vuwZ33CSoYTL/PhJ9P27RZ3GXIRNggtYbpVyUJPnigU+Q6O2aFNN2O2jfQGu3dQI2NPW1mPcfMIrfaWxam9v3L4P0eLPCfxQy7wle3DE6xx94fCpjuvYbov7ZmMvtPow0/d1CZtEIocIUIvYpgtbexgl77P9ao2pqw20nIKhYPqM0MoTp08fwFlzUyTfySUiPiLPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gL/z56RCkphaZHMegiE1kNqa121uHScZXp6uLO/8Q50=;
 b=MODLDgoSLRGXyQPxOKOqyxRhT+cwhGnVDn0SC1G+Iv8CJedFwxN4j+y+CX7WrkZlvh5Iw9ca+kQ4ZscRiWkPXFUGXTVUMffeAH/gHDOTERtyJ0HxYW0s4ihi3mhLxMbMTCnmue/PRANDPZw8oPDtNmCVVX8QTiWNpqepy8XjhE2VEv3QrF9tO6YmRT+7RlQ08qtZRDLpTCkfTDgy1DZpg2iadGf6jM7CovWH/LQMBP6JExuEZ3yDNBSEUAA4eSC9Y9sr1quVkZt/Qcn8ME+ImwGhnpzf4lMXCH3U13aiDVrwGR3ZvklBorH3NZNfOhuFYFoyHJiOhA3/NcCSIKga2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB6046.namprd11.prod.outlook.com (2603:10b6:408:17a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 18:09:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Wed, 12 Apr 2023
 18:09:14 +0000
Date: Wed, 12 Apr 2023 11:09:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230412180911.i5xoctni5mr2r24n@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230412142006.877109-1-jani.nikula@intel.com>
 <20230412142006.877109-22-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412142006.877109-22-jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: fef0728c-9216-47ae-457f-08db3b810611
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MMpJIP2LTuFJeY+c3faiKBMQqKbU5p3bAWXeXpvhNvcKqjhZXy02gtWOburkgjjg89YxbFQ+Bjz/QJ8FUjsGQ0PauscGF0FtC4e3uqbBaZ3ZY5vi8/6nKncjF8DxMz3lDPsbttdYWenY21AI5YFJEciY0C/7qYZSFZBrKdxnL3UaXM/afQ7Wg1xpDsfkyBI5dNIzishyi+559DARG+PS86iDbao1dmK8vOAn6JOQYerLyzclBHUEQg9/vFa4t6+ZhWesQMz0yKG7nRObsMi8pGOD0Ol7/FTBYz3IsDUMYbodqT1Mm/8qWlnBW/2FpPiQMlxxGeFCtZb+Xx+G0Rderxm4Q9IZMIJve0TUcI2UpVaf5GKciU4c0T0tzkIWW0x8tDH/IPwhxiWu8hj2LA61VN9/Oi59Qu3BhgoegQQRYMVIES0ZuoI2M7a30JwEuK8vTTWV0yD6OOf8rstv4tnbU9AJL8cLVzPrLFKUWMTyJvAvRlpAtDDVaPRwNgNx6N0ginbWHJHHGiN6YmgX9FqzGYZrItm+OfkBKTEdXtqGdDL4nqolIVvKKDBw/rmD1y0M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(2906002)(86362001)(36756003)(9686003)(6666004)(107886003)(186003)(6512007)(1076003)(26005)(6506007)(478600001)(6486002)(66556008)(66946007)(66476007)(38100700002)(82960400001)(6862004)(4326008)(8676002)(8936002)(316002)(41300700001)(6636002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4i0Qw+gwwKbS1QKaUrwXiH5DNM11Ck26RE40ZPnvmFQ9+t1U/hH8JOBfv1My?=
 =?us-ascii?Q?1Fn819wrwlOZ9C+v9rwvzts4f6QCo8paW/rNhxMWxo7l3GFcTG11djvXewhQ?=
 =?us-ascii?Q?K47SYxPiGVvWahuGck7czynd1MgVT+QWgtBPnA+HuxeqNC8B3dwjrpjtWJxu?=
 =?us-ascii?Q?d6G8rfEV5wWCRCFgEkPCk2RmLmZNF8/FkBYWhxC9ecbkAyKmeH7e2VEoS9yu?=
 =?us-ascii?Q?50ZMzELT2LkJzm80AuZzY2w/+/bxymc1LLeW7YrUBVrqfTQc5+2YCGddheuW?=
 =?us-ascii?Q?IT3wckWGTunlwCkIBz2ZnbV6JA7S7vOQAD5ZmT/bsBpXjggPpNJjFocw2TUn?=
 =?us-ascii?Q?fhjo7yvqCTXonTs1vSg1PbDoWA5bZ3TsxTeB7yQRpP3D/a62p8ClS/Kgovyq?=
 =?us-ascii?Q?oTX6Rx/ZsRkqZT9MdCRZKGTIKeCXMjV1tvsulvcRmKSgenE1nk80j8EvTIld?=
 =?us-ascii?Q?mig3402OvRpcrZdoNcV1wLihDwTmUBVwrKNx++qZxJ23ObOOdJwqLcRumm5m?=
 =?us-ascii?Q?CGGYwT7IaKGs8RNfd49+OLQbipRiUsaC0sTr0OQbRPBCPqUQaEbkRTeVx/qn?=
 =?us-ascii?Q?4UwOAhto+2bQSrbf3haqmaCJHPXvBvd3cBBHoxOc0kop+VSp0EwFOwb2lCn/?=
 =?us-ascii?Q?07wkqXq6hjEcBbsBMaEkCXGL0PUTZJ4WmKVtMdd/LdzDtvWRAxxwJ03Wfdt+?=
 =?us-ascii?Q?8HolLsN1zsK0NM7L8/1/iAUHOIRsy0NsMbJDvJEqOHvLbxV56SJjvuxbVd55?=
 =?us-ascii?Q?k2bAoxUrjw9wtuhyokZLldn+Yjr4JIapItzfuFs+dFzgLsAtkuvVrRdWxTcj?=
 =?us-ascii?Q?QoOd1lZoPv25L4ybF90uHfM9ij4xhJ7W5OevlcEgLL3+b0uH4QoDHW5JjaV8?=
 =?us-ascii?Q?Y8kr7fZSMEmbPnV8FkdOiHBw5ApN894GpmR/ZPDet5F68HueKtZf08/egn59?=
 =?us-ascii?Q?C89Ryv7IIDP20NJecqhT3RK3jjmjOPUG5LBriqv8BYETTyulHzUJ3QbVGXLr?=
 =?us-ascii?Q?9/3csm8QSQGWcsLKrZazvLL7LTI8Xmr1TCo781/hkU3pRr/642Ftq0mu3YNT?=
 =?us-ascii?Q?vwQz1SHHlQPbmxoNsOjj2lgxemBPpciM89cQCT2tPI5sQoELs9mX1oR2frai?=
 =?us-ascii?Q?02Zcqe147e7HhIUPKxW8khmyXCta3uamlFD2H/clG6KldIex+y7znVEyCxy4?=
 =?us-ascii?Q?GPuCPcQHE92ubVDHkC8kwrgEkKuzmfV02RhFVJXhyO1DeKoEmZJntPeDZcbS?=
 =?us-ascii?Q?v8P+KfVWq3uPq7OCx42kYFOUyCONWeQAUh9+FdokEY5yueZZbBbLnDFMYUhe?=
 =?us-ascii?Q?O2K/CIWI53UzEhubuMQaadvKLTwuiPDgJMvxfdWzGNZexY3iEDi2Tk5g2hkM?=
 =?us-ascii?Q?AglyHvKb1Xw6SY4/yZyAxafGh7kLz+uDhKIceAL4ylLNuSAfBWVv1pqUJg/U?=
 =?us-ascii?Q?bIfwEzhGNvu/zBAjE3G+xNQNGKybsojIbMr2PbwroRXBrw9t6MplBOafBPZY?=
 =?us-ascii?Q?pSWMFZ+BZ+GQUmp4sVewllUVORiVYuPRIWGBnOoJXIeN3wvZlKQusNo6/RKW?=
 =?us-ascii?Q?V+RhO3JxObn6X3q5GP83tqriWm6S+bJPVzIgNjtX8RYYTX252FBYDZa8qhqY?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fef0728c-9216-47ae-457f-08db3b810611
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 18:09:14.3550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ovbyz1gQWIq0qwZbJAPCuRhMuPlXAewaIm4Ky8yHUhl3HkTzlBdTeVm0CXwmtWNLATB6PjqqLQc6S1a0MvwRyBAq1XbXjlyEi7A8PNkkRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6046
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 21/41] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 05:19:46PM +0300, Jani Nikula wrote:
>It's okay to include uapi/drm/i915_drm.h. It provides us with structs to
>make stuff compile, even if we don't use them in xe.
>
>The placement is perhaps a bit random, though.
>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>---
> drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>index 133c60cb3a09..c40bb27ac72a 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
>@@ -1,6 +1,7 @@
> #ifndef I915_VMA_H
> #define I915_VMA_H
>
>+#include <uapi/drm/i915_drm.h>

my worry is that this creates an implicit dependency that ends up using
where it shouldn't, particularly when included in a header. Where
exactly this is needed? Can the include be moved to a .c?

Lucas De Marchi

> #include <drm/drm_mm.h>
>
> struct xe_bo;
>-- 
>2.39.2
>
