Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC45AC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 15:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9C10E96E;
	Thu, 24 Jul 2025 15:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4gxReGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7FD10E96E
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753369235; x=1784905235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eHCAY0RaU6jrnJk4ru6yaCIforLxH59mWbycLG3pEKE=;
 b=E4gxReGL43HAAySc+QwpaHkgiaBzRa3pKGV347GC/RYDucwRwFx0fKr4
 yjXLCd4D5vvptCgWpiNvGtkA0bwoUDrb3v/sCWpydmlx8nKCWdOGogmoo
 PWWeiBm/KTc9ztUjMcxCNGQTdwIloxhl+rpjq7au7LjHrUmxJyvu3tjJZ
 K/h4jibuWIBXfeX1MkmiAnSfCuELH/IRAMGoFCWDZvpIkgQx19oUQVqEu
 odd0TL599ZUyuEI1xd/VMqeZ2IkTXr4RxsQBUhRud8NQbpFB3qtQ/xdbQ
 Mi6aJnx8U+Hg2NJzEcmk7mOxmXpAKj9u1rnkqtsSUODzEZ1o+TmYNvv25 Q==;
X-CSE-ConnectionGUID: EZn2RJuyTYS6uP6F5bgvGA==
X-CSE-MsgGUID: 4Dn9E6l0RfaagqIbnutpZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67042269"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="67042269"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 08:00:34 -0700
X-CSE-ConnectionGUID: UzJyCy/nSOevL6QbYEinPw==
X-CSE-MsgGUID: sc+3eFCkRGOpm0WCeGAiVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159846977"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 08:00:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 08:00:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 08:00:33 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 08:00:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8zRf4nOzKT3d1clzRz3pJtvRc6bHsxIpt9vqwwCLQ7RyvdNjWAqKZSsuOAVN+1dlIGQTRrN8heCpT7qg19aKX5KE9x8pvCyM1T8EoYAElt1iOTxjjXiRRCk7lK8zvqVC4e5Zh3nEt23877uOCtIJaSEojc5C1bFEYZKTx8DhUHt/v0GEShXjo4RRgkvrHr7cmojex/F7M6qcKXRc/2uF+e+k7A+D0Lp/K/LLd62t3UuAOdGHlXkrWZpOg2hrAAlRGUaD6kjqmLLt8PKiUCi4nj4irWSCZ1vmjqFq2pu9cNdTE5bKC7X5HwBrUiilnEEOj2zVtSt88xqh82xwO2OYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=angD8c7fcrXE63cRsaYoAD+d/D2CYRAEXoJibz0h/RE=;
 b=RWdXGsrnPEURdzfbUYF1CwIYzjbA/u1f6DiDMawPH62Z8AGEwf5URgUsePEge+J9DW3AjYBOuWBlVpkVdZ7gLPn20FmHgl3OTgLeVL0Wjvd+p1kV9V8TFZGdIsMKBETXybTu2v9R+4Vv8Uv39lKwcg4QHjXxdCYbscKiHxjjtFV7f0rVwayEoSMCndIuvRobYwbn/gLN1RBMHnB8Xwgu03tCfcVd04eRqu2nphLVuhQwU7fFThmEgrUG7DcipM91GDkU3V3kLwfbW+WnwS613WekJC4oyujUa+JcHnHNhslhuK0CjIqixwWvQhaMtwvo/jownAJgg8AEfzaUGKrzSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8047.namprd11.prod.outlook.com (2603:10b6:806:2fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 15:00:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 15:00:31 +0000
Date: Thu, 24 Jul 2025 12:00:25 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <priyanka.dandamudi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add documentation for
 DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
Message-ID: <7xmfbbj5r6kh7dhiwlku7lwyyvy3dxrplgoq27hubvl6i37t7h@pq362ajpqwdf>
References: <20250724060610.3310628-1-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250724060610.3310628-1-priyanka.dandamudi@intel.com>
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce22dc7-026d-4172-bb96-08ddcac2d540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MmoHVNHdvFxXOAzn6dUUx0/TXf+lwtRaKNYVFD+64KxJX/MzSaVsbvberPSG?=
 =?us-ascii?Q?nuty30mYlNAaFdvzfVLuM5wNwX2MMaW9nUgCyqQcEdt/+I++FfB9gE95f4+G?=
 =?us-ascii?Q?pV4hkaQbwCdlXbFZ2d64EGR8wzAuC7ma4s3B0VK/kn4JzhX5/n5xPDkW2oxN?=
 =?us-ascii?Q?kt9AnoEi33OBtVF8FHqKoUxFEMVgwWOdkicqqWuLMqQxfD2ev14ZNwXnBXRc?=
 =?us-ascii?Q?K/Nk8xaygNkHIgn3xTPYp80cZEIeTjazQT/d1Hb7pDU4lRrSo3Hv+DvhmsrY?=
 =?us-ascii?Q?417bLsXHnFdexHsigtMyOL8hDWPPgvjoxb3DPO/bwKCHZk4Kq9Z6FFjXv882?=
 =?us-ascii?Q?84BTJ1r+TT5kVHHFXC3Nb8I6tI+MFUml3/zEObe0nPgWCGC8BwAlXdcBzREh?=
 =?us-ascii?Q?3yHGY4g+DGXmboMMlThRyhxW4pj+uk2HYD6KKyGPI7i310h9N+Q1+qT4kaqR?=
 =?us-ascii?Q?sSFn5ugFyQ1uITZoeDmop+qVPBs89HdEc9IPRPeuc3pT/L13JF9jZ+Q5d+j/?=
 =?us-ascii?Q?xro8VRl7jvI/r38qtkiSPjz9AN13BvyW3nX1Mm6OzSsM+qwft3nXYc3GzOyY?=
 =?us-ascii?Q?suArVBVxq4KI6YzVat3q74/84X5Lykwz1WDSrHPgeUAq4AMzPx2nA7wZePjd?=
 =?us-ascii?Q?13mSAmqkoJ+dsJOlPIGvF6BYq9H5W2S9wAG6BAC7qUcYcald6YnWioj5ZR1w?=
 =?us-ascii?Q?luwr2DH4WKrfpG+BcRKcOl8v7vfVpJ128jiuJupbzQ5HYinT3UwUVa/1z9Oe?=
 =?us-ascii?Q?lwrnSlWUtAAANT+nIy+okYqYXlgqA1mgMxeSFKqJT/1r4vSiSFKT4ykdtrR+?=
 =?us-ascii?Q?sx8TMpZVlSfxbVraTKgO/IiImALha2FfXD63Pz5NL51X8rERhwJm+B69/XOT?=
 =?us-ascii?Q?PiNl2ADoNn3mdho5ltVbv15G0NqBl6wtig+Q22EkoJlytIodN+WxPYfQSnSa?=
 =?us-ascii?Q?avIIGUJdLqVRQWciFJ2reJrFoOdMU5U0EEnvdl6oS9oSXwTBN/bS9QWRzuYD?=
 =?us-ascii?Q?dviQleXjz/LB85vgIzrlpOnFDZYRMg0O6v7hw+28rOXRXMs3VULiihqtUlQs?=
 =?us-ascii?Q?PPr1aHJA1BzyTFeGCl1/TRMbM7T08gEdIVPo/0kEOSZqT1AlqJRXbOXJGZgd?=
 =?us-ascii?Q?zzXx15C9TGQo1F7kiekCJFse3rPht/aesPiMPXwz21YDucU7vdYyqLU25Cd6?=
 =?us-ascii?Q?CSr7XailAx0CeFBxj5Fam4g6AXL3z9adWinIdnVcTrkQ0jLAqCMWl8hgjkAl?=
 =?us-ascii?Q?ldUm6fTcO3RxfMz8bJe0s6CP9vYKV3/rEE3bkJCLZkZxqhpHZsSr3QIt9jas?=
 =?us-ascii?Q?wOY7ajm3+bzpmaCB+1ha4blS4AFzkZadT7eI9/xw18tqT5+svKM+rYNlb0MS?=
 =?us-ascii?Q?JOCpiqgI6FewTSHyYW+mAuORt+8LvxwJuUjb1Ta0XeJHsgEfWq57HD7sYiq1?=
 =?us-ascii?Q?ts4Faw/s018=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3aFTuiU1svDAhfVPiXK2U6i61QGkBbZ0fYjMGBWkmPnc72JairJ0yTeSTZNt?=
 =?us-ascii?Q?2IVvvudCW/fpXN/KiPipxbu3izA2LjWmN2tV2r2P5p73wi6Ap1AFVV9Z4PHF?=
 =?us-ascii?Q?DjGl+XtlmF1JzvfMs+Wg9w+RJw4mmK4+Baldvkjev6DS56cN5ZlMcsvJYSRv?=
 =?us-ascii?Q?xaddVhjhb31g9t+x8JuuUD3JrPG5yLKU/5i9w1l85YciB1YURVs4YIBU2qn8?=
 =?us-ascii?Q?1HtgPP7gB3Q9LLqjeb2dUvgXmOhBQqTugga/u0TdXbdgqsDgrWb/iFrddmhs?=
 =?us-ascii?Q?o0v6XkQCUzIpHEHI9AxQoRwauy8w5zkD+YASMlTE/DwtgkfVgkH2+egAxFzb?=
 =?us-ascii?Q?gYvbxSzoPos0dtgk5T/z/Ay+bkraYYWSF9naBMdEWk4GvYs9wZqBJg2sLa7V?=
 =?us-ascii?Q?6UNHG1E5LJNVN8zucClve6eE6p88wY+JtuI8VDqKnCjnDMgBbpBh53SqyCLA?=
 =?us-ascii?Q?oYYy2r3vXqz8oOoHdq8Le6CazhxnG/qLPEv+StbsRdZulZ2dQnzmbBpLhas3?=
 =?us-ascii?Q?XEHnz46U+tjbvIBCHOhDyGVfSbevXTQ5KHVXNSVRNrsykTljTLM/0G/QwdeB?=
 =?us-ascii?Q?lbXtulAcpE0wJEq584QwevGI7w9xbcwwk41HvugbHk7VBjYZBx9bFLKuKfVm?=
 =?us-ascii?Q?oWlGO8+DXV0Mn2CtmMqFDTD6JPClBEaAsKER89Bde4VhgxS01afRKboUPpgf?=
 =?us-ascii?Q?KReSZFFa/nYIu1M7c1LP1YxPUqjydgDf031Afr+ZEbpJAbuyZ0/6B3P4n2nr?=
 =?us-ascii?Q?oiTLztDdoSVdqC61vdjelnlD0o3POvA6MdZ3VLyVCchv5y9Mu1yLzaR1VLWM?=
 =?us-ascii?Q?nGxACJs5G2EhLE71RhG81w4EdVdK16Oh0XDwtzRMVFmGCu3DgJghK0IiIzhe?=
 =?us-ascii?Q?eCn2WkoM4roT5cHTFEtpN8T5GvDmPOWhfb0Jbk9xJXCI+UtNFcjaVoz7Gve2?=
 =?us-ascii?Q?pomcz807/lafM0y1XpvlPf9yHGdEABbdq3ebR/kcf4FLgEXY4moda8QEySPU?=
 =?us-ascii?Q?lwFobNRAiAC24Xh/E+3MpboPeUz/NaIFraA9+Aq98McuwqC4fpjxk0it+Wre?=
 =?us-ascii?Q?4mKfQzaHaAnn3yvOc/8rBTU9tfM/LGO3AiG9EzWBgxektHfVpogM+XgyrPyI?=
 =?us-ascii?Q?6kr6n56L3uhsMuqj0dft4C16o2sMh6mnBfSTuH0vB3eZrElwpTQ2JDeKMbVB?=
 =?us-ascii?Q?FFSVThM1uJrXpLbXEzoDZr7wlBJxtT4Bt/hDxhzE8f5Qxu1G4Vz2NHRNORPs?=
 =?us-ascii?Q?gCcRCqEaSqWWc8FAyDGV7iW3hbXi4V8eFYCzCk4j/mYuAQyloTnMQhWYAVsM?=
 =?us-ascii?Q?/x0qdKNSplG0O9roaLmcgciS5+NC+8K/kcFDiFjIbMrH2u8xm2WhKWY+Cxco?=
 =?us-ascii?Q?SGipIUsjlsXD5eLwcBN0RIP1VPpaIfE+toTErJwx7Fqlp00h5mW8KIw6MRQM?=
 =?us-ascii?Q?/FqpNJeO9uUlXWSQ/7HRBfoduoVbMQPdsQJeTURCC8NPJi7pyny2xGv+cdRA?=
 =?us-ascii?Q?eR17EN9xau3RnklExT0R97w5bAlTNiHLAX18YxEE4k1zcuvK82dZg1wDtAT+?=
 =?us-ascii?Q?LZGQYaPv1MlrekfCMTid3eG/cyJpgmH8FJKCb1cSsu4yY5KhH2/DVA+vwv85?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce22dc7-026d-4172-bb96-08ddcac2d540
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 15:00:31.0881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRwghXlgcdDyf/EDjECaLiA4DG0Cr1oSJVdqU0Pfft7j67J89aZ2CqmSCDLLPpFYSt5FAizECKXErzKBD2+gDuJovp8puOH0P9z6WuJElxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8047
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

On Thu, Jul 24, 2025 at 11:36:10AM +0530, priyanka.dandamudi@intel.com wrote:
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add documentation for drm_xe_gem_create structure flag
>DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING.
>
>v2: Modified to be in a more generalised way.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>---
> include/uapi/drm/xe_drm.h | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index e2426413488f..2ceafa5305d2 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -760,7 +760,11 @@ struct drm_xe_device_query {
>  * gem creation
>  *
>  * The @flags can be:
>- *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
>+ *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING - This flag modifies the GEM

						^^^^^^^^^^^^^^^^^^

This makes it too verbose and is not the style used in other flags.

%DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a possible placement, ensure ...
%DRM_XE_GEM_CPU_CACHING_WB - Allocate ...
%DRM_XE_GEM_CPU_CACHING_WC - Allocate ...

Here it could be:


%DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING - Modify the GEM ...

>+ *    object allocation strategy by deferring physical memory allocation
>+ *    until the object is either bound to a virtual memory region via
>+ *    VM_BIND or accessed by the CPU. As a result, no backing memory is
>+ *    reserved at the time of GEM object creation.

with the change above, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>  *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
>  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
>  *    possible placement, ensure that the corresponding VRAM allocation
>-- 
>2.34.1
>
