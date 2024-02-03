Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAEAC4828D
	for <intel-xe@archiver.kernel.org>; Sat,  3 Feb 2024 06:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C876110F3C1;
	Sat,  3 Feb 2024 06:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5jCW/1W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967EE10F3C1
 for <Intel-Xe@lists.freedesktop.org>; Sat,  3 Feb 2024 06:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706940580; x=1738476580;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cPTs0SRrCAoAz4HuD1zNN8xVGZoaK4AdLqbuNMCCtWk=;
 b=I5jCW/1WMv1BOj3LU1WosBQpVFRTZ37/VJCzk1JaDj7ZjeMlCQQHlAZl
 fd8zKmhKD2DcEguyPVZvcPnYmgFHsw7DR+6I3tSyXF2DHufjr4k6nQLpk
 jVRBTTOsitg/+eUskPmDYHOPwOE8vFrx+jOZkQIxR5VOnAe6uhP/8ffmU
 z2QQa0/XG0c3qpqdPMfXciWlFVZU8jSazlzuGf1ODYudqIVNH0XAWQbf5
 XqiikWGyVoH5QG1m+8APvdhYKnNzpf5wNojL/J+XjASRiIYSXaeD/vblH
 hviqZDEwHcx6Dm8LN7sdeoopRwmFWSdN+D3Jw9/HfHlOEzqdEOkgSQrvd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="525112"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="525112"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 22:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="320358"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 22:09:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 22:09:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 22:09:34 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 22:09:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuwIQiyAKrMMPiUrTR4jimSwerqsfKlefbHdwPfTZwhwmiBw04OQXFD4tvL+T0BetQF1u1H377lWflIR3lr39F9GJH2fQ6bwq6wTAkAdgr4C39n0iMDo2DUF4cmHdiPE8Y/JNJKeohU26pBfQtZRSklYggEaCQkD8osbbuE80AMXQvqct/lbsad2QHXEPEJOnCr0hc5PJEjrpjVfS1YCZ6xrH9pz5kVU957nGTyYkK/VUx/w8aXFtMr1rj2avbq2+l4d7Aap0kfoEA9AXzDKIfv2vnh+d/uIEwRp2a5i27mr30q3uKiotpBU1JZqGeYCw9r15sjsyjjhzZB1i/4GXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RtD2TR7+CpoR9igvBddT3WHapWJsYPgXvGzl5Vvp1g=;
 b=dUcyI+TvJoMnpWi7Ll6zhP4Tsl5uw/zDHylxRzHg/nmzq2FyUW08fY2BDFZE8ogC838p76n/OrIVzlf7QtX0CvJWLnCUbG7QWwZk2ELxBnyHvkEfaiHehH10vAEj+Tmf+1T7PY+vfkBXnY6ShOr3OcnI2SXY+VereT+rb4pmlIn6UKTT0RP7zjZ2Uw5lqm5G8ud/eu5GXmOcR9zmCMDMXq7iMQ/yJBe6FTqkjhnuv02nDGDg47tPV3ayhoYDaYozVU4q2r53uwI2wHl+8kNBXpuYMyaQ+bjmpA+g6FMRMhaxqLjNPVydvRUW31ScVoIE5htjBimYaB9AdfdnHMnSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB6049.namprd11.prod.outlook.com (2603:10b6:208:391::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Sat, 3 Feb
 2024 06:09:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Sat, 3 Feb 2024
 06:09:22 +0000
Date: Sat, 3 Feb 2024 00:09:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 6/6] drm/xe/guc: define PVC FW
Message-ID: <3yygy5wjwl2vv5ywm6o7ig56ufpdhlsilfamrllifbu7scgzk5@4nfj63plwnq4>
References: <20240202200017.2133438-1-John.C.Harrison@Intel.com>
 <20240202200017.2133438-7-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202200017.2133438-7-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: a5171d8e-6f14-4b0d-d30b-08dc247eaa37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0BWlEuIxG5y26HjYJxWzE+l0RZ1B+TAfVZ2XVi0Aqk0BrqQO7c6RbNuifUxA+v+3W7rEHJFYSzk6RQhSBRfWbIyPW7XRc3lsudg5Ele17gMOc2BFresgu52sxlYhBdFDBB4cF9ZwcAWkZzTVKki0V4lYZ9Ognw72OZQcTrbKLeSmH/kCoKpY3ZUKIrLsVQa6XcA0QJkUuwGgOlSX6BHSV87vJG9H+shKG+lHfZ6c8LqAVpAuqtJ6ND0BZ8VfshzEXuWHTLCfkTyGPaDS2GXGF7vVAm7Foy7+Rw3XDZIl+VNlNToKF+Zyl7k4yzfeQi1kNDQQzrHVMqbKVnqna6lEvx8HlWi4oquz1+oFC3al89eDUMPeYq9ord2pTzpurRcWTZTsQvl4rSYiK96OgXMn0uSZEGwqxjBgIbp7/Q2fHV8FxvbW18BJumEbTb7yyIekNhUzV04Kc547j6k9RFvFKyD2T/d+T4unhoNpYZzX9KJL5c6a7Bg1uxeWNUIpcQkdaKYclKNa31TPTt6NpeI7jpCe6QKD37cT1GVzj0jeds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(9686003)(6512007)(2906002)(26005)(66574015)(33716001)(38100700002)(478600001)(6506007)(316002)(66556008)(66946007)(54906003)(8936002)(66476007)(4326008)(8676002)(6486002)(6666004)(5660300002)(34206002)(6636002)(966005)(86362001)(41300700001)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O/wYT5iWxOLL6hJ3XBKgJYDKHM8GXcdRSYLtde/ucTJN5x/fGZurYfG4n3?=
 =?iso-8859-1?Q?SgpJdBG/ZYiLR5f2g1GLA4ZbUYxoUEyiOyHJw80vk2V9/d9YVQcFAqQikk?=
 =?iso-8859-1?Q?ERVqBgjr6XE6T5oO1xBqHJEgZNUwaGLKIxpK4m2yHskKEb10oflPW9j3tf?=
 =?iso-8859-1?Q?7KJEHwOMwwdOqa3WjCU2tJIzoTY+ZFDR1FX1twVHb/P0C78uM71oZXKwu8?=
 =?iso-8859-1?Q?nT8I8I0B9pB11u5L6A4nTKY4XO2k7vJ2np2LWGKbebg/TyRss8jdWUyWZg?=
 =?iso-8859-1?Q?eS1KY3wt92cVFeshb1B5qGtrdHwyNBWtxjSwFRSmyT0EZ9awEk/mzYaOGr?=
 =?iso-8859-1?Q?Gg4eJc3w85G7yOo5i4YHonu1OAfSiqdShiO0R5/TNlErUojt6QJB5xFe54?=
 =?iso-8859-1?Q?WyKYbXlD5MwNdNdUeQ6JFjEpG+m0VCWhdjacnx0ijGRdvenkMLcEL3Vg1i?=
 =?iso-8859-1?Q?rOecUOo3i85SfN8L+3qruyLlkqEAbJUm4XQ8CHoEU9ddr/5L1jJLmPg+Zu?=
 =?iso-8859-1?Q?cVXl4TFdlfmV134831ep1TvzNpfRtWwKwdhjfTvhUNkCbnKe9/7scDyqA6?=
 =?iso-8859-1?Q?zHxdj/KXUe/kU5tlXL5vrV3GhV/kNJ8QDNxl1z8S1SHKfsFO9DB7dHu5yz?=
 =?iso-8859-1?Q?ApOvWLZHoD3SYLUjlLj2KLivUExqOn5bdf3fpBz2QFMX+pxYFqIIeRn6pA?=
 =?iso-8859-1?Q?xhfXAN6r5p7OIWEw7XSIvsIPiukjin8x/YS3Cf3YzjudZMVMIPe2yYTj0/?=
 =?iso-8859-1?Q?A4EiTTYWmkfmig8Px671/34QbkCtrO9Pm4OlfqwqwOJcBKb+TDDolIAux6?=
 =?iso-8859-1?Q?tCCHdAh1j2/jc4iYmYTs1jmF/FluFJhgjyWaCBYYGSFqtqkcG+VmO3zhys?=
 =?iso-8859-1?Q?OBQttVB0PGjUaykWb2pxkmPdwyPVjVcvL3VRCogPStaVhlYk4ijb6BMEBs?=
 =?iso-8859-1?Q?JwppIj9oSv5zqITdsxz0in9fRVl1CVYl6Q4j/UInk9UwMmW0qs+P03ECA9?=
 =?iso-8859-1?Q?Nk5aFk+HdKo7IlqMXQbyD1EqfdspWvwl/ergmbGOSkhVxQVIdH1KZf2CPs?=
 =?iso-8859-1?Q?j3CmXo/55FyYRGXkkS0WTjEr95simOxGXi4jtGWsdV9cXoKSXJXD2+U4xN?=
 =?iso-8859-1?Q?gIRohBPeUcu4cw7xnMPy0pWhQoL+0Ww3pXhc1UF3tH1FxzYLxerKgVLVuw?=
 =?iso-8859-1?Q?D3HPRpy5+109BfP88XNGRWdvIRcxWlAvWHjNnI2Z3oErddAvavb0WSJuHi?=
 =?iso-8859-1?Q?UcUq3gkLZmaGfVuvv1c3Iu7AQ5LDC4/yIhv18k+ohWRJoaP8o46IDh46Ep?=
 =?iso-8859-1?Q?EiYHgRJ7wFqzOUhuyEmdLn4hJvoEKUOs/U4jqpuX9QwGMmGTVpnIGwtguw?=
 =?iso-8859-1?Q?ZqIdQ8VJTA0B/65BF8DjO74p9/BVXmRTeH7jXJVxA9qqT02yTfqWJujdLQ?=
 =?iso-8859-1?Q?p8m2WJ3vHcx8B+SWRXIqRsy4tluYY2T3F/JFGlMauBQCtAaYR3qzWpyVO0?=
 =?iso-8859-1?Q?6OpsM2pYrVpjIDbNa3VHa6OJiHbE/2iodDwdTphPEcxa/ldDS56c71+xcK?=
 =?iso-8859-1?Q?W4F92DH4qJGphBGhQZukWyRrjnM4+i1p3siYElullotl9JakR7lcieUjVC?=
 =?iso-8859-1?Q?Ur2WLtsZow8khQBZt5WWdrDjxe4hTisFSDytjdVinpEByLF7mN/K6foQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5171d8e-6f14-4b0d-d30b-08dc247eaa37
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2024 06:09:22.1837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgDv4baSTvm2bMT33iLzARmh81Ic9JqNSrN/pJkz04ZMH1Royu+/GQ5jb7oH36Qi7AppkULekT8LQNAUcu0jfC0qwHSeyt/CzmSGUSfY4fA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6049
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

On Fri, Feb 02, 2024 at 12:00:17PM -0800, John.C.Harrison@Intel.com wrote:
>From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
>Add PVC GuC FW definition. This is patch is for CI-only and it is meant
>for the topic/core-for-CI branch.
>
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1155
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 4714f2c8d2ba..d9ecf76c42a3 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -105,6 +105,7 @@ struct fw_blobs_by_type {
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
>+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 19, 2))	\

from CI results it doesn't seem we uploaded this to drm-firmware?

Lucas De Marchi

> 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
> 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
> 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
>-- 
>2.43.0
>
