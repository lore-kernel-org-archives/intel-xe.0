Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE16C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 20:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC9710EB8D;
	Thu, 27 Feb 2025 20:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQQ+yPCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1C810EB8D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 20:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740689948; x=1772225948;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kqUexI/fK3zJYxkWXXmvCzkL8PWKhuCk8P5Qs+VNick=;
 b=lQQ+yPCwRcdPN9btvgFdhjzmgt/49ouHK+bHkmkbj8/LPX1GJO8iMMVE
 r8iocTh2bqHnLTPTDUuCfvJ+05wdruI1RAYlMoiG6n66uKxAIsAoRrEuX
 CRopn4prZhs4snvatsdOb8EWYnBPqN9PD2aXBI52QHQWzZS2cYKRys/oP
 5Lmlew5UnjSKClx/xA7VVFj34hvEkTknUCdCrRK0IaFQb3o0+G2R3mZtK
 END8iiNlgVFkYLW+R6CxEumfqAhuaXfCYADkUIWl7L4hmi58ba2jj2CFD
 80odBlm3Dmq72CP1hMLIISfxnTVegHgVqeSVEgc8Xum/a0kkQYbpWavTb g==;
X-CSE-ConnectionGUID: 6DDbG8IdQCOCIef2ab2H7w==
X-CSE-MsgGUID: W0DprGMhR9WTticIiIU+Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52246052"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="52246052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 12:59:08 -0800
X-CSE-ConnectionGUID: /lTqawZuT1mrVsRD2fONjg==
X-CSE-MsgGUID: oFVlNJHYSyCq7Z2nHVS2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="116906814"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 12:59:08 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 12:59:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 12:59:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 12:59:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sO6a0FRGcz/nJ4JqeqX84kygynKDqBgkZ2bS0Ft39KouXN0iBzrEJBSrGC8nCJiC0z6kFsU+iaZtepOzsMl9pFsuhbNCNBnKB5/4jbO8dJwgKe6HObqHhixA57vtZ9iRbgYfBYLJuiAX37gZBJ8JnBqkz2bmg671+2XXvkO1OQx/SwmhjefETrege//xnFFGAb8VjL09wS5SUqd8oNF7y+481xqIDbhqk0rTErkQ1s9QpOCDVeaxxRvfR6Atxe55048RpfvOaEVArWAx0pgxMcfuhM6q4JuwfM6v8bMplNBbfif4ASkVjPOX3H6ZrE4UeG1nGicVzaMAxsaZfr4Imw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LxrnzUx9+OeLJ7+qf8RnBMQqnG1dy1ozqmC+cbsClg=;
 b=Frmnk1am6ssMIRTHmQsUJi58NHZT84tQpZ1WlKgJo6Q7vDOSdbSo6T1z6qtlD/GZzSWHX4pboa8SBS6K4jCkuuxceEBF8jkLjYgMLHtLKsYyOqZWjWeGsdbWJbDmOnmj4PJ7pI8CHgbatc9gsKufQz8Ez1sRYIxUYaz/too4K1joY7GROxqYaWiMh332RksjFFaWNSp15M0JURXB0Z+fzk+HUEMt0KQGijzcqnMl21kXPjQ3n+LGFx+ZRXhVxgNMggVloc6pCtTigJp0whtjLh1OsMw3vQ+Ze2pIP0J65BBNouFqc1gDFObKJe/mqOyzcdIGF6lsNBKrlbGZf2i4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 20:59:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 20:59:03 +0000
Date: Thu, 27 Feb 2025 14:58:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/xelp: Move Wa_16011163337 from tunings to
 workarounds
Message-ID: <og3rnaevqomre67vpskvk3xnlmy62ugs6g2nbiille3dvjz66x@vfvoioi3r5x5>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250227101304.46660-3-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: YQ1P288CA0001.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf35756-03ea-419f-8a40-08dd577190e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QCgDp0XmC7S9mqODSIx0cTRztmzNJfjn+TKbpQG9KQLH9wICisyiCMYt/F+i?=
 =?us-ascii?Q?A4cc2Y8h/OJGRieTPIYhEM+msWsHRZJ7leEA+9kKxIQare4XvI+ncJCgj/Rm?=
 =?us-ascii?Q?I1SpKBaKQOrvP7XzBq/Vb0fSn0SVPZA4Q4yEDRSMWofNhjaN9rLKJNuwou74?=
 =?us-ascii?Q?/8QbDip5SlR+CHzK3qmJf4QPtfvxUoW0l7Ept2n3we7b9w4JwfbTBWRuA/9H?=
 =?us-ascii?Q?6ej0A8Ul8DJ9lQKlvRC5QTaGaHrtr/UCs/UAx5dDP6q8jhz7HuiZu1wJwV+F?=
 =?us-ascii?Q?qt/u827NIU/lvufJO08S36s/7+W8mYl8K6Hr0FeYjWbliRgk9iGpIoCGSI/l?=
 =?us-ascii?Q?y7H249PDS33pRHbQTem4DEeG5ZVRA+H0Ta2ZGqSxnTzx2PjY1TT/osMR+5tK?=
 =?us-ascii?Q?UUYrYq/kD+D2ggC1YF7JRtiTFi9qUuZtAWiFPxIkL5bHJ3Z1fyYAsiYM7kmS?=
 =?us-ascii?Q?k2ymuFm/Olk/EW/CRNRLOZ9tLnvoQ2LP4+ESJqlGVVG0ueX1liECVLX2BYUb?=
 =?us-ascii?Q?PLZ6+IPfWxfq8njXOzNgfDbSui+6eXi/wNcRGWrW9k+WHiqJUtrGqmcvyHhx?=
 =?us-ascii?Q?L+Wy5jun8CNox8T2RDxILt+QEzh3FvRyKo0d4pobRLRnQL13E7ZT4iZl7F/A?=
 =?us-ascii?Q?MZJxR2KCoXGpgHiPU50k7Ucnj6GHVNSDJ0TQIe06P9m8+shgnxXY2G4tfos2?=
 =?us-ascii?Q?N4N9iANmSRBQWlQWUqQA2WE2+ei51Xr1qwoXqbwV1X16XEE8EIcWUQuoBYEL?=
 =?us-ascii?Q?B48UP7nWypeBm0IOGLEImobacu+UZeu5nAIMd0+juTHv7Gl0Oqw1LoiTD9TV?=
 =?us-ascii?Q?uBKTkSz11ljbODMLOFKcEGk4feFdWm0qTd5jYmVvwnP7xCUfWW27xY5nYBKM?=
 =?us-ascii?Q?+6zxNc51e5u1gdnG5DD8/5x3dw5GMaoaE7MMQCHEbAgwPbuNPFlQhtedNICD?=
 =?us-ascii?Q?PiliGrGC3nF2Ct+RV8wyFk9T6T4JSaSTeNjqiwdZ0/2BCaixb6iEzYZ/F1iQ?=
 =?us-ascii?Q?3LZpFSjODOV6je0XMtacFnCpIch1Cx64sO1CjJ2X5kqhhbC+feY1ADfkpwiZ?=
 =?us-ascii?Q?2DM1plCYw7A/+Z6ux4cshpxu8IPJhU9mlZ7RGzLKTWko8OWujDav4pGx+rlJ?=
 =?us-ascii?Q?wVOG0HN/zDUbvxFjw22o7hR89XAip7RoLn7q3qjA6zmxFpUpN7DhGSy1ohPi?=
 =?us-ascii?Q?+dVZWfgtf8y6Oh0MqR6+5aD0QQ47/P1p86N/JATDDJm0CRQVzrzyfOS3myxS?=
 =?us-ascii?Q?VyFElnQLQt3PzoWeAulz9/Tat0hMtPDMH0WLYTS7xFcZzi3zC0ppfOG3ZN+W?=
 =?us-ascii?Q?rVkPK9P2dyoGQiT1O/n0zVi5YPbFOPptFc6HMxwd1BkKcxCpmW/ZWSocF81z?=
 =?us-ascii?Q?hXwvaH9O3WwoJDHxU+ewkqYyPlsW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tb4Gy2i5rIW0LyhZQWY/u/PbeWd86Lb/C+n/2ln8xGCtVccw1LK7Vt1MV4Az?=
 =?us-ascii?Q?G1PsM+Dfu81xewDAYpRyEg+y/B1nT/JblsAGmw9rD8yfk5GSwfO2DnaNe+/c?=
 =?us-ascii?Q?uAA52j0pco6JwuXtrHKJHxCyFtonxLfaaNSOcXEjSqKHg8O0+8X/JmHuhYKT?=
 =?us-ascii?Q?93Dj5GZp4chmby9ugngnZ0IDkPChK1fdYDAQy+FmBKXBprb6yVWTm8nKOTO3?=
 =?us-ascii?Q?wfNo87+uNeSThvS5Ob6qJEJo0cXqje6QsgwDkfqZn9tMLajAURINHKrl/T6s?=
 =?us-ascii?Q?hyawvU62LRCSi7WRfb+CxaamG6M3QwOequb98Ytr9lS+XBEnUxpuLZRxRon3?=
 =?us-ascii?Q?Ot1DtsMRmPRc8SZcfUrLi7n1/WQ61FNa5UZvm6BH4/Xj1jhU4BxeHbTKJufY?=
 =?us-ascii?Q?LKA3ZPKlKke2jt+pdpwYibhpCvGg9xOahy+wjIYmJ8UYqk4VjqKXwwcBPzq4?=
 =?us-ascii?Q?qT+cegWS2Afwjek+wE9AAWbY21msk7Vh8M6VnGXZJX9RxEXs8NrWh8vW3+Vc?=
 =?us-ascii?Q?XgQaVce6of7/ZviAgeDnIMErbuRLnYszAtF2IppO2MY0DJvQEFeMSmzo+hjw?=
 =?us-ascii?Q?wwHpUJsru2zPkdZe7DQyu2We2UvZ71F1ZsQBLn/b/yGqzERfrV7ucl6ekcNU?=
 =?us-ascii?Q?EOph8M3ggJCYTFd55/S/RvDWgrOVRDTHH1Pm7HGz63qcjT57mTlAFdD/xv1Z?=
 =?us-ascii?Q?EWLR2HxwRYosXShz9aqfjRwT+PPP7eEJoCJ2xuxemVo7wXMP3y1jXeot8Tpj?=
 =?us-ascii?Q?VRURIvY2WY4J1Gd2loacwECaJmUN8r98BSxYFTZwvJFgqVGkImK08uhFw0zQ?=
 =?us-ascii?Q?B5kONAYLA5tUI3eNLGB7xek/nnseGexzF00cXixfDq46zQOiHPOixX3/MqHQ?=
 =?us-ascii?Q?yxex7SWz50nhTu+bICfg3/yI3CXfJtfYR3R/LS0gkte3SeF5+2vVUQRMh3lh?=
 =?us-ascii?Q?bSxS1PMbn3z24vaAPJ7bK1AsYKjasH9FfdfeTwG7aDHw5+S2Zg/WfwLbMZ51?=
 =?us-ascii?Q?5341cswckSVyZULcsvVEHCXSI5X3SiKNRnB8Lk8tDShFmLVcnzQJ38Hj+aR3?=
 =?us-ascii?Q?PsMTmcjLUHLKVbrSOdms6nS6vslx3/yIG7aeQ0o21LWS2hZRlA9mlP+mlZyh?=
 =?us-ascii?Q?UC+vR2e479CLPrlp7m2q/Hw6bI7Kz8uTvjOmbsphy/rHkXGN/lPFgd3I5T3G?=
 =?us-ascii?Q?d894ro5lsNnF05cGzF9aZcSWjju4AtPzIDxM0YhfajiHunwfKo+fDGXNXleR?=
 =?us-ascii?Q?qBTiKIcC5yJ1TBRggpAKHDUN2SnM4iatr0EiIKhGqdFGT+wT/vUVfYZ6ujoj?=
 =?us-ascii?Q?lLHyd4cgMfv4nFMIGYd5Le4tCTT4lgCV9OsAyHNrGXn+HlR4D/OREjtcYdnD?=
 =?us-ascii?Q?BqvVdgOCYC2Q1ZLKDlfhD/XB1v1PJQYCiF6cNp/FPOTV5IF4Or9A1wkUOHa3?=
 =?us-ascii?Q?eWNX32X10/QBNKcvFQRf8mcdKoW8w+oEsZ0TphwKt59DbFDxII6uLdfGjHVo?=
 =?us-ascii?Q?J1hfUTc0fYw9cn38nALF0o7V8yIPyVGKzUFOflcI9NSczOqvuQ13hBUlvqzI?=
 =?us-ascii?Q?tVXItdPLHGGQgkI8K8Vaju/suvvE8vlQDQxNIMTfbM7pjRwKY3KVCRUmzNOf?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf35756-03ea-419f-8a40-08dd577190e0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 20:59:03.2647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3P3wntkcx/m8pj1XV09FJnGAnM192huri3vyWTodL82WN9+48KSz/a6F5NC1Fldy5qxEYkSXqJlOaAkBnykZFCdI7Qc8riX8+05FIpmElU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
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

On Thu, Feb 27, 2025 at 10:13:01AM +0000, Tvrtko Ursulin wrote:
>Workaround database specifies 16011163337 as a workaround so lets move it
>there.
>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_tuning.c | 8 --------
> drivers/gpu/drm/xe/xe_wa.c     | 7 +++++++
> 2 files changed, 7 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>index d449de0fb6ec..3c78f3d71559 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -97,14 +97,6 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
> };
>
> static const struct xe_rtp_entry_sr lrc_tunings[] = {
>-	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),

we now lose the infor that we have this tuning implemented, but I'm ok
with keeping it only on the WA side.... for newer platforms it's there
so this is mostly making the older ones work.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>-	  /* read verification is ignored due to 1608008084. */
>-	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>-						FF_MODE2_GS_TIMER_MASK,
>-						FF_MODE2_GS_TIMER_224))
>-	},
>-
> 	/* DG2 */
>
> 	{ XE_RTP_NAME("Tuning: L3 cache"),
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index d4982799383c..e446bde3a52b 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -624,6 +624,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> };
>
> static const struct xe_rtp_entry_sr lrc_was[] = {
>+	{ XE_RTP_NAME("16011163337"),
>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>+	  /* read verification is ignored due to 1608008084. */
>+	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>+						FF_MODE2_GS_TIMER_MASK,
>+						FF_MODE2_GS_TIMER_224))
>+	},
> 	{ XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
> 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
>-- 
>2.48.0
>
