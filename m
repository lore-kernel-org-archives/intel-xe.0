Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277AEC47DDF
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 20:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFAF10F7EA;
	Wed, 24 Jan 2024 20:18:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB4910F7E7
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 20:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706127511; x=1737663511;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aLX2QZo8dn52la5HQ+fpqKweFgJEBdP9l1Mlgho5ROw=;
 b=bqusQ2ZEizDZiQFLurEhQ6Wbp5qlnktVV4rEaMsizBXrd3zrmDn5Bqa7
 fqYBG/V62gnjtpXfCqQwMDJxZE9LuncuTNb9nRWtIC7Y3u8rl2MLjdf58
 kgQ0gYlTgdRJ090IsZl498kr5ttDX5E2Qev/koixtVw4vBP86kpr64gtv
 w+8cmDLC8ierfxAU32EI0Iude/QDjz/SIDE3KmaP6fHIboI1Ps3oNeNQF
 JtDeytzzIdeDz6MHYg007ALRz1/yY8i8n5SLLEtUXEjhsRySF87WpGRW4
 lcZWoEpx+V5Hh400WAKtbaiPgHL37pvRVlv6n/7va/mdUxNwGjd4ua4eY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405713126"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="405713126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 12:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2154636"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 12:18:29 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 12:18:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 12:18:28 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 12:18:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAR9LtMuwtXyPQR0yTennGSWogbdTuyP3vym1/qyaRTTj/0xrbTXahYQOcJrrr58Wj5GHBkL53XqtowOUo6Skzav2vPU1s/b9bKM3Tk6AN3CjSFdorxaQQ2Z/aq6ySMOikCAnmHeQ5IKNpMkfyJxjjgxMiW+LAbvcukWMznnQUe4PUE0Fg+rNRONjM3fUnI4fCIJYRZ1u+2CzXF7GMo4RvHOzCyoiweB6W62rsZt90Z7uDeYpcY0NvC0qpb0+2wklkFU6sDtNqkBOvrYLkiVf6fwNB0rbWKlppWLt0vhyJmWRKAdrjYr8jjQl9KORhLKm/LznfVEUDKi1zw8aNM4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u6BrXOoEKT4fzKQPHHx5uIuQQ92D0/C6c7Z/n5EiJs=;
 b=nQaiiS/yycJjJkmnY90zr50PYVxFc8g3uSNUNcv2rhtd08gNBYQmEUT7cRmysRGtlCr7q9QctUJgSe6VzTcwxuILDQ7CxBEzWD5pUQzHVgOAmGVEoGm+/7Z2SKrNDDwNHVEDM3ikwRLSOc7WuWiuD/tMq08dvahkXP1OV4MWUA9tsV5rqznqYKX6PhfFCpM4cfH8ZeJW6S4fY54CoRZ4EejfKPNsXGvW1hewa2yvqrQwb6+DfD5XgJvYDGUX0tNrWoVQo+BCPDMjV/8CoEjOXoXtdsC1rnV998QYqiobcaD7QqWO8vepV4fkE4EdnWzVgKMGt111HE3auk+RjMmkUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 20:18:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 20:18:11 +0000
Date: Wed, 24 Jan 2024 14:18:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe: Use LRC prefix rather than CTX prefix in lrc
 desc defines
Message-ID: <j3c3xt7klrx4g3kgtxu2crntoty5u2v5ed2wd2dzs477awuezi@lovlwwpttu53>
References: <20240123212638.1605626-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123212638.1605626-1-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: f7386fda-5dfb-42da-4bb0-08dc1d19961f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vlgF7RJhpR73YHoBIXBRZ/jq1ApzBOATD/iNjAr9tRlqqpacHyViP1vq/TYvYd69KC07byCXl9eQcINxtPvCcRXSs2M2XPdcOMeLcPQHBJMWPLuK6lSVdr00G/1+k3bw6mCmrs/LBnl75KmncvDGICu7hX3HTDvETlXyUDjWfbe0hIjz4Turdb8jBXSYeNbAGco9DljnzWVBajBkOsQcLXOwKAzuAc7INxU+eUIW20YrvTZrJ7OGLii2RIG6aY/KxBwwoONhcCafRDEelpkkcgaA/hvHsPz8DTuJCYuGN3n1pxw9xSChwUzVclni5Nv7EkAF/Qb7oYeB7PGBdkldUX3Tw8DmPB6JaJxl75C7+cuWzwVlgCbQrHMngQYOdS696VPtl5TtZVFfFspYlVkQ8NGWuxkaI5u9d2bimh3NXaEDVAbO5ydMolCH7ajGUvvAPOyzKlR0qdETgYhr+7jVzA3gU6G2Fjr8gjVMSR41GHTrBWid2FvHhT8W9pbE6lLI4uRfoIRzjPd1zhpw09fhVLAyzDYoM1qKIJxrSL+jlTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(4326008)(33716001)(6862004)(6486002)(316002)(66556008)(66946007)(6636002)(66476007)(966005)(86362001)(8936002)(82960400001)(38100700002)(6506007)(26005)(6512007)(478600001)(83380400001)(41300700001)(9686003)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7Uvh+4QGq0+dwAEcakLy4dqR9BEJlNle2aiKEYxVx/uKoZCEj2uYKK6vHv?=
 =?iso-8859-1?Q?3P3oYtxJ+GaGQ3aSjtAJaNgiijcgLlVD8KqpSoHlsgirWqHo3IMuVipkK5?=
 =?iso-8859-1?Q?cvinTDg0hd72hIVVvg5alaepNo7Jsw00kMB79wAJQKD3Nn3JUSIwsL94q9?=
 =?iso-8859-1?Q?i+jhEjKSj7sab7XskgbuT0WURAtIAPdkcqzDIpgoYuxqzH8Fl5ETDSjUPZ?=
 =?iso-8859-1?Q?FrCIMviod/vuFJVdXfA16yWVkmID9YcTphUCFjeELLNn0Dv7h1w3YLocXN?=
 =?iso-8859-1?Q?/YAMV1sBmdIPEtXpWWZlVfpS+jzO1qZMve0uh96JkL6ylJ4w4Qd3qUGGjy?=
 =?iso-8859-1?Q?1KLD1/Jht+FbWJErfsJo1EC4gTdUv64zaNTARC0yVPo3sj0rsnZhqrHbHD?=
 =?iso-8859-1?Q?TZ5MyH7LAFOsIWMVVLc+VX26ASRxgbsOhwtSvP7UHt1li9S9tPixoUohP9?=
 =?iso-8859-1?Q?ekmGCTfmNXg+2T93nBrEyaUu4lUcCARyJ4MjnVZwtfrK7WXtaebBDBRcDW?=
 =?iso-8859-1?Q?KDIIHvn/6ZbrRm/vwrigvn+dekUFyrxnaNgbQ/QlFuNGhLz7Qy2zA0WtNV?=
 =?iso-8859-1?Q?oiLDYv492rQ7ittnAlP9nlIMfXbNK3IARh/SbrEHNgz+XZsSe88yKgQ8kn?=
 =?iso-8859-1?Q?YFwU8vTwfw+IiphamyJQdjgNuIxd0IY5GpKPJazVOjFBsgfJ3VGSP2/nLp?=
 =?iso-8859-1?Q?XAK4Imo8LJhWXgADESrS+2KnR2Q5fJ+U5BNnTwkYHU0uAPavQZNlljHTAY?=
 =?iso-8859-1?Q?8iOhLJF69c/9hEkFYeLF9Zs0k+LD9SfJgNojy1MVCRwbV7Ii+6sVKvN7D2?=
 =?iso-8859-1?Q?ys55/40miWo6laPXSVxwhJ6RVnrnI30mSp2BY9k3Jl5CsFPoAt3d+AJz8z?=
 =?iso-8859-1?Q?ttD1WeTfCkufEDArKAgiLA+rnSsvq3odKtmtXce2O3FCjwg04qq/XCHXH7?=
 =?iso-8859-1?Q?+4eZoseubk6wciZPJhNbKnvy4s0wbXTjpSsbFboTS9G7T0TtLMyZL5mvYq?=
 =?iso-8859-1?Q?cuYXhUHG1FnIS/BgzcwyypYKy2TwhnWX7HHgo6UkZ4fDjsHHDqbfUZ52aH?=
 =?iso-8859-1?Q?snujZ0zl7JQ7r/EKZDCRbuUKx3eU7hBu4i8BWxb+6znHkCbO1i38QcWncx?=
 =?iso-8859-1?Q?HdqJt9w0P+otzRWn8G1QZHfLhm7UHb1nsQcr4RpM3A+TYOAn4S+UtaS+sp?=
 =?iso-8859-1?Q?+jWqdzqIXfjZuwewPkZZocPT1vdA3errI0/Tw64+8AWCaH3jGvf+5V04sB?=
 =?iso-8859-1?Q?Npe0TozjWZnDdcrES7aIKgLmSrqlNZ0S46nwdfbf87PG3UusyalZiijSTA?=
 =?iso-8859-1?Q?RXbk4fqYMWaxDh3mq1uSfv8ql+VbIPBoyLFDNxr1L2q6QzIQ9Me3xA/v5T?=
 =?iso-8859-1?Q?bt4/1vcsSYQsQspA1l83HMCS3xIBq1ynC/CZIcFfxktJRlxRiopRD+++sK?=
 =?iso-8859-1?Q?6nRbkAUvvG9zVAMZstHu/BC4mAOIOMMSyVO/ajl0jTPTwL2jl2knK0x+eu?=
 =?iso-8859-1?Q?o9G7/DxefWNfJjberCYCAxS7kV5Qw6mpx9nCcIgujR+hVcS3vBd0+YEZVV?=
 =?iso-8859-1?Q?wGOCvGCupGpWQsJE40y1PPiUl/imUaoURoO32kiFvSkAVuHsiLb8YEoTVo?=
 =?iso-8859-1?Q?j4zB2FwDvPq11mqpiMFOxs7lklX9ZOSb7IXplFd62vu3yEt/StmEtYMw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7386fda-5dfb-42da-4bb0-08dc1d19961f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 20:18:11.1476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEVKiUyaHiCQobG+lXEFuVXEyaewf1Q4xYgvO72c3I8ZkIrSXZT0Tcj+6SHhD/VAyMeT84ZDkvRNvuM8iP8jm5cCYJACS03i7NFc2xnm/ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

On Tue, Jan 23, 2024 at 01:26:38PM -0800, Matthew Brost wrote:
>The sparc build fails [1] due to CTX_VALID being redefined. Fix this by
>using a better naming convention of LRC_VALID as this define is used in
>setting bits in the lrc descriptor. To be uniform, change other define
>with LRC prefix too.
>
>[1] http://kisskb.ellerman.id.au/kisskb/buildresult/15112267/

I was thinking more about a link like
https://lore.kernel.org/all/20240123111235.3097079-1-geert@linux-m68k.org/

could you change that while pushing?

>
>v2:
>- s/LEGACY_64B_CONTEXT/LRC_LEGACY_64B_CONTEXT (Lucas)
>
>Fixes: 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_lrc.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index f17e9785355e..8c85e90220de 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -23,10 +23,10 @@
> #include "xe_sriov.h"
> #include "xe_vm.h"
>
>-#define CTX_VALID				(1 << 0)
>-#define CTX_PRIVILEGE				(1 << 8)
>-#define CTX_ADDRESSING_MODE_SHIFT		3
>-#define LEGACY_64B_CONTEXT			3
>+#define LRC_VALID				(1 << 0)
>+#define LRC_PRIVILEGE				(1 << 8)
>+#define LRC_ADDRESSING_MODE_SHIFT		3
>+#define LRC_LEGACY_64B_CONTEXT			3
>
> #define ENGINE_CLASS_SHIFT			61
> #define ENGINE_INSTANCE_SHIFT			48
>@@ -786,15 +786,15 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 				     (q->usm.acc_notify << ACC_NOTIFY_S) |
> 				     q->usm.acc_trigger);
>
>-	lrc->desc = CTX_VALID;
>-	lrc->desc |= LEGACY_64B_CONTEXT << CTX_ADDRESSING_MODE_SHIFT;
>+	lrc->desc = LRC_VALID;
>+	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
> 	/* TODO: Priority */
>
> 	/* While this appears to have something about privileged batches or
> 	 * some such, it really just means PPGTT mode.
> 	 */
> 	if (vm)
>-		lrc->desc |= CTX_PRIVILEGE;
>+		lrc->desc |= LRC_PRIVILEGE;
>
> 	if (GRAPHICS_VERx100(xe) < 1250) {
> 		lrc->desc |= (u64)hwe->instance << ENGINE_INSTANCE_SHIFT;
>-- 
>2.34.1
>
