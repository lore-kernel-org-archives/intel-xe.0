Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F143C0218B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 17:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0485710E2B0;
	Thu, 23 Jan 2025 17:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UX4FuC4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6490510E1F1
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737653773; x=1769189773;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3Ssgtt/CrizIjJgiLKtvCUoFzItbmhiJ9A7+WuBsbes=;
 b=UX4FuC4RYPZ29Tad3Ho6JIBilyHh5YbfHVmi99c3l7PR+EHmXDPLQHlw
 R/YzI5Vdff5Pkr2TiQtI1/qOS7q8MLpPjMkZoiiQSKTJfsacpvYdZmZPt
 YJY9Tnsy+uOR4u/wu/GVweh9RSPdEeBq68JHuGsW08uUclZdpxgoIzSyh
 u+2hlxutZLykg5uvSsSX8KApnAruKR63GibcuOmYCzwf6KXDi5iahQc16
 yluEPQXIlLo57oDafwJarBbmmKad164/kv6aW51YysSO/aEL5V+tt1p8o
 vEy0aYK4rzGYzD3op7hDEvtAH26hTQj6SLDjrjnKkAlnWQYRkyNdpxWON Q==;
X-CSE-ConnectionGUID: P81ZT+cxQHagvB+K1qZqWQ==
X-CSE-MsgGUID: 58ronf++TkarRhjLKvo2tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="38420461"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="38420461"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:36:11 -0800
X-CSE-ConnectionGUID: QiZiPZScTaaEQcEzo3HFLw==
X-CSE-MsgGUID: kLWx0puFQ9ymqo/WGEhGXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138394311"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 09:36:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 09:36:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 09:36:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 09:36:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1gZgVxF2pNMvSOVqJOrekliwgaDSFc/xrFWPlHKma/upifevPmLCAUIGfMvymkfO6sHE+RT86XbGncQcOcGDIRKH5C/ELx/19WLFHT1HA47gpxdmBH+uiRWs6oG04eRblRqa12D6d6SUfzP6JSd3GrTPGqMlnCbJx34RgVMCwjuJEgIFb/7ZJ9AJ4ix8pCNFO4KyDSLdSCB3CKYjqHPrh0FEi4AFmlZLnW200NdxLnQiLDCU5MsZuF4iPjuX8X7AnvPeL5KUnReepuBYrq/ZKDNSTczT6p1Yji1iHMITXIklRK0yJvxTKh0lZxiNJQtZB6w+JkdOwqo9poYXVR+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5e1zafUGK6I7D8HRBfp1ZCBa/MHeT8UlNI2jNioaiM=;
 b=BdkuCvw83HkMCMbiwqITHwJqfmmSeeJzIpke4f4FyxxHJC5zg+EamfhWsLc9xkYbaJDNTDq1qr6xk2zOqUmhH9QqNvrE1stkkYSuqzZtytco4cVvKa1/s0xj+J2IW/R8+jZjwOcl1efw8yckk3VUno48HBab3eNbvBtZeepnXO6NdlZ6pDbWnGUH+KVVFsWkQOVWkZtJPOXZeIbCQCegolb76u59YRbX+0qIbDf0lRFjLStBXzKf80B0lP3mO+4aHxPV5/fvZNJn8io66PX+OTNhUcIcCcgOwc65zHDAo2jDglenqUvqJrhSvXwLEBIPew1hjbdmnzTXBGsKWwXgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 17:36:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 17:36:05 +0000
Date: Thu, 23 Jan 2025 09:37:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>,
 <lionel.g.landwerlin@intel.com>, <carlos.santa@intel.com>
Subject: Re: [RFC PATCH 4/6] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Message-ID: <Z5J+PM/6apAzlyKv@lstrano-desk.jf.intel.com>
References: <20250123011513.362430-1-matthew.brost@intel.com>
 <20250123011513.362430-5-matthew.brost@intel.com>
 <Z5Ibl_Lc_wyFeV8C@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5Ibl_Lc_wyFeV8C@intel.com>
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: da000485-1cc9-46d7-7bed-08dd3bd46a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?16UCqgRwwA0CXAoFN8OtOsl5dPCCpSrUQ8rPwzBWDp99sdqtk4pzAYhooW?=
 =?iso-8859-1?Q?1DwM7/fX+SAFYwEl5C8bkCAuclftYb3Tfult7SGNvZOs6n4eK0LuxAG2kg?=
 =?iso-8859-1?Q?UDKHQ3/FOgWJJ1gnaZe95L01BfI6peLBMKNPiMxSjHHLvse3ETV2FbWAwE?=
 =?iso-8859-1?Q?2qpakF4jwhiS+WJ9qgvEVB/U+hB5D75o69KgvX7+pvk258rlUhTGhaVQA4?=
 =?iso-8859-1?Q?37Hk9cyd/8JjCskQKgkfXIvOSWgzb/t4UDzRIcqUvB24B9yXySdaFqpFRQ?=
 =?iso-8859-1?Q?vVlEDK9HkBC0YSMwvANOCUH83q3/NWWUHCkJhFegE9uo6rdPwq0Ey4BfsX?=
 =?iso-8859-1?Q?AB6dmGkx9EVQJ2Mb5EZeNLwjB+bUwB1yQNDb5y57GQ+GfzLTZ6koe/UAxL?=
 =?iso-8859-1?Q?PhtMp+oxQf3XwA6FeVw36h+Ym5Ucyem9POnZ2EeYxVAicfdsPZX1mkBybr?=
 =?iso-8859-1?Q?hTTsQJYXauuqqEX1pCrkbaEDIMdwR6tpUTz6uRvsfPKcEEa9Eiwm1sc+J4?=
 =?iso-8859-1?Q?LYmi3/0tu552iVLTWZwxSD8u6pDJCuyoFZCfR4e4IZ/j4eX7k7e0eA6aGb?=
 =?iso-8859-1?Q?g7/50qed0oUD35r4+3Cf+8sKg5RT4b2ZE0YwEMJPOCO2AxO4jMH+Z+Czub?=
 =?iso-8859-1?Q?3ipORSmf8fKEM6guTEWSXxD9TRSJSZ2fMsN0j4jhoGyfiZooqEs+ijRhHq?=
 =?iso-8859-1?Q?67kY4f/Sz6cZUaFOj5zDdgjrEUKLAd76Q9heZ2sc6hS8IAYCcTY8Thijr7?=
 =?iso-8859-1?Q?9qw5Df8CCZcjMVAJh58INqORhPjGeD/D3bgFD6NyaOfmPpWLjzD9rC30V9?=
 =?iso-8859-1?Q?wf+l1IxKyfwjfaLnLSAUJjTXm6uydo/Ub52aj4qd/6IVGcWuvPcRe226K+?=
 =?iso-8859-1?Q?l3uvRZeZAvWda1Wy0pYhna3EbGmwHfBfZH/KuoIFq6Lx/aupWC/y48NrGN?=
 =?iso-8859-1?Q?f56YmXfJXpmcG6JVHSJ6IBjohC38rW7uJTw1RbSPZX1Jgrc4FUx8Ge+t8w?=
 =?iso-8859-1?Q?atxRKPV9vPhazVsEDJ7Emgh860mj0TBx3etYErpLhjMY/YdcZxYvFviDNl?=
 =?iso-8859-1?Q?HzvPlXnSwJDdjsBp34eNfm+/2rtWwEdodjilMTC+ASDh2f7m5goImEL926?=
 =?iso-8859-1?Q?0my7kci/Mn+2uKtciJ5s7pHuGzi0g2fw59BWZWntY/KJWa01JXseCNf6Td?=
 =?iso-8859-1?Q?ceZNZp6MKdINbRxrsZMdC+akyCVNJBKiGgExogQkz9O95855HyeEVP70zR?=
 =?iso-8859-1?Q?4bcxNiEiWSLd1fD/BG9IVw83FcDJuUpNleh59lnr5OV3Z5R2ObmL5Gafy1?=
 =?iso-8859-1?Q?6epj/66LTpSfIcu8zsPN5rSiDIlXCLP1lKFGN6yv3tXTZvtxx+r1ilWRdg?=
 =?iso-8859-1?Q?mojM7HR3/yGOjKyWVaAXFrb5ZCs6iIdIkMsihKL6TFRHdhE/+SAB+zQ41Z?=
 =?iso-8859-1?Q?kmjeWI3ryn6WQ82y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xI4yaHLZBzzfFDvwN0CD8ZprLO/cC7FIz+n9MkWH+2zVVfwCogqMu4T6wJ?=
 =?iso-8859-1?Q?vbl5rWRlz6KJEylIu+l4YpAv6fNuFAiPr0VIApW8f/BiVsZhMaKSFra69/?=
 =?iso-8859-1?Q?+CDPt0Xfv/Oo3aK4VIaNniSJyJLXB2irO49P4f+B09lt9klnSXuhrsm/kh?=
 =?iso-8859-1?Q?PfTnFpXd9QxNm3xyBY5A1nixsdXnpeF+zc8UKJLs+mwRkl33YKzLLLdRjX?=
 =?iso-8859-1?Q?dVqtKKgmMNOxGE5/wzgTNF2CG5YFXiqfHwOOD4A0t+Az4w/9p0iizsA+fX?=
 =?iso-8859-1?Q?s9EbQRYbzPyUZqltCNNAw4iAYLCGT+gY6enue3rourSw0ZhvpjYpO4Gld0?=
 =?iso-8859-1?Q?0u/DKEMyhX2/Pl3XLWSTPprEhXKmuAi4lbuy/ERIcEu9aKjM77g4YDRuBc?=
 =?iso-8859-1?Q?lrPLatY6x/HyDLT94Y6o/tV2CW1eQdMkDuYR8OTC4P/S7VED7MZyBs/60R?=
 =?iso-8859-1?Q?50OgJuem+q/NXZGWgoiXgDM9jwULEx9Xzn0+3S4gb9g1uXdS7rzIk+BB2c?=
 =?iso-8859-1?Q?EIOKkP5MlRwHgHtyvSttnfhAWCHH3co73yy9ICbJgLzKi7uycgWaeMYvsm?=
 =?iso-8859-1?Q?tqqEUbX77FngUhgqGHDBvCse+J5JqdL9sm5oE3CXN0LUhAlct23jDB09Zp?=
 =?iso-8859-1?Q?6ZqG3Lv9RbQf1GPrQDuf4gqnM4l4Iyk05taFBFtZWC4iu69lrmWe+17az7?=
 =?iso-8859-1?Q?2zmjiF3iXdn/fePZQ1bPRbT0cNj6RMwim36CQr6Ib755an8OHZBzcgMez1?=
 =?iso-8859-1?Q?wr0bbp8KHGeUhnlVID9azRmzGw4nxMonk/Zjz+Uk9fT2z6xv6KOTxq5tVa?=
 =?iso-8859-1?Q?AdlPzpNkCs3MCPx74ZaGjJ8cP+v3CtpMHFMlkjgQ7tVW2bG6GP5X1xPe/B?=
 =?iso-8859-1?Q?xSA6N39etBsHb9ds6x/hqJZLS3f5vXH3+dvdSlufu22CCQn4Yue00hLr+h?=
 =?iso-8859-1?Q?nLGKeqHNCrbIISMkMAviWXaVMIAq/jsCRQAoXZPjnTrN1vxownmzt5ybTM?=
 =?iso-8859-1?Q?6PXoGS7AZEpktWLykighnE6+I275mWqblrgYPtBYRRSyv+iJV+HlzyiZFO?=
 =?iso-8859-1?Q?rhkKKoBh0ftqf9owF5VmQwG2p7TB4ZyF4uYFx0rXFvcwMElUIC5H0cCzzB?=
 =?iso-8859-1?Q?7rwWk0EjC/hA69gHNCV8FzkNfuA76BeqWykhsZeP65VrBMQX3rM5FNOGBC?=
 =?iso-8859-1?Q?rd9zeT76oWTwYckYi6xfBsyVCA+xFj3m15NwHMNNutelCOwR+ILJe7fDqJ?=
 =?iso-8859-1?Q?EzXQyTJNDIO67w6bjNNgncxLK+PuizUQhY92F2wv9s2ZbWoOls7GkKx9Uw?=
 =?iso-8859-1?Q?y1DdgufCa6XfZkKT1rmEupXgxjeL2+1VUOMcXORXT5tvvJZUKg9rbC01ww?=
 =?iso-8859-1?Q?v/sQBieElXJVes4AEGOXFaW/rjhC+0unlZJHxsj6uGRwEaCn94Zvm6H5LC?=
 =?iso-8859-1?Q?AQ1V6/7/mSiqBePfyWjXgDcWLluGMruZl0BVBT6shmwPBX+ity8oWxDbmD?=
 =?iso-8859-1?Q?1tBiuPrmZH1eQk4bOzfiIrITCmGVmhVf8NqW1PJvN50qeQAi0BivzikDUp?=
 =?iso-8859-1?Q?S7+Sq5eJaLSAHtwPI8RjQjr1qeDNLgQxWrTfR5DvDzTof7nFmePP0oYfIW?=
 =?iso-8859-1?Q?Io4c2cn+YdoV9L7RnePwQk8r1wQOz1FZIsV0DvFJdGzqpCbcPKSbzWzg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da000485-1cc9-46d7-7bed-08dd3bd46a04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 17:36:05.5897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6HSOpE5urWh+yNU0Ah1dqvj325tpWbSalqTeohiOqdCnMZjdcKHIE4HqWTwU4aRR0O4Twz9fVXP0/0jxcDG4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
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

On Thu, Jan 23, 2025 at 05:36:07AM -0500, Rodrigo Vivi wrote:
> On Wed, Jan 22, 2025 at 05:15:11PM -0800, Matthew Brost wrote:
> > Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which accepts a user pointer
> > to populate the exec queue state so that a GPU hang can be replayed via
> > a Mesa tool.
> > 
> > Cc: José Roberto de Souza <jose.souza@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index e2160330ad01..0fe8c2e8b022 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -204,8 +204,12 @@ struct drm_xe_ext_set_property {
> >  	/** @pad: MBZ */
> >  	__u32 pad;
> >  
> > -	/** @value: property value */
> > -	__u64 value;
> > +	union {
> > +		/** @value: property value */
> > +		__u64 value;
> > +		/** @ptr: pointer to user value */
> > +		__u64 ptr;
> > +	};
> >  
> >  	/** @reserved: Reserved */
> >  	__u64 reserved[2];
> > @@ -1137,6 +1141,7 @@ struct drm_xe_exec_queue_create {
> >  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> > +#define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		2
> 
> Will mesa need a property to read and know that this is supported by the
> running kernel?
> 

I had the same question after sending the series. I reasoned the Mesa
tool is not a part of core Mesa implementation and really an internal
thing we (Intel) use to help debug customer bugs. We should know what
kernel we are trying to recreate the hang on and if we use an
unsupported one it kinda our own fault and tool will just fail on exec
queue creation. So I don't think we need advertise if this is supported
via a query.

Up to Mesa team though. If they insist ofc we can add a query.

Matt

> >  
> >  	/** @extensions: Pointer to the first extension struct, if any */
> >  	__u64 extensions;
> > -- 
> > 2.34.1
> > 
