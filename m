Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB982C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 15:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9922410E7F6;
	Fri, 16 Aug 2024 15:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="is/LFix8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A2710E7F6
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723822015; x=1755358015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b0W+AI0ymLXwqVezU5wGr6U9hMfx03Ti2x3rbJciitY=;
 b=is/LFix8h7+aTPKjKzmZmu/BvZI975OXsd3hMoaEXfq+VG9sMRmffDtF
 4E6f98k5s2wDIkNtn8fA4E3xO6Ziecy2swSyLtpsh5in5E7aSD2VMvn7r
 j4MAiSYwhj7fbOI5AJi0S5IM84YsxB6sXvYrJ2hhBlqDl1Vs+YXHZYJy1
 wSoknRfYvAMQZKw2etWFfTOeDAytwErbeFZC5pY2txLSsakZjYttfMatS
 KNbIvMol8MijMsdT0uLVfIj4PoWRAXiuSkQdqfqliU9sNCSCErxeLz6vR
 FyP++e4TRaNzoe8IRj1yAvc4kcFMUwFKN9XtBaHubiHLCl35cooUV5kRF w==;
X-CSE-ConnectionGUID: vWPAc6eGRGeBFgqTo5mYPw==
X-CSE-MsgGUID: yenhQcuzS9uWWEEOauYqmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="47525558"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="47525558"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 08:26:53 -0700
X-CSE-ConnectionGUID: SCb3mg+dT3WE1etv/VvCoA==
X-CSE-MsgGUID: IeGy3ZjiSPac/dqVixQunA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="64365365"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 08:26:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:26:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 08:26:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 08:26:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 08:26:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh4LFixVyyhHQQazFtPGat8wRoOD2HNvV4STMJsatzmSWpNUbd00eb1lti+AAvU/i1ztRBkLzY/hqNb5Juek2UThm8Amwc1vFzBM7KO03VUqArToTHDt/DMhGy6Ks+mS2imwTyIYEytFrSqEni02HUR+5n5Gv7mB5pXyGU1stQuNxLQFISIVIc7aXH3Ez8ZNvj0GcgDdrvaJR4DpPqwHGQ6j/JIiWpjLJiB5hoo+dYwiyVFblNrHbHN3644W/zZrWjJoejjpws/TwmLSGx5S74TVKCvwMP/C72fkgxS7ye776QlXXaqNb5YGn1qYqZXjbBdlbx5weN9+OKI0mysIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WS8pBU+gk93KFtbZV77CyNSU1mHOAzYa32tv9z/HqZU=;
 b=kbf22JkMv8UyUgVMNBQuO13wcSj+5M00EuvvEPV/SaqeyuwDJh77XcpSnamBZmJDsAAum09HpUIR19nktMfNmoj9bb9xLMcbPNz8X8P40qBbFx42j1f1Mw/VaHRDL3RUykCJBSnn0aCS399jYk/EiNtLi7DSbJ3QOHZT05wVKnfjqBUJ1VmBUnicbxFew3ngoBr2QAgb4NQnxj2a9fK7MHC6T3pnBIcrlgjDMyxI29cmnQT3xk/jXU7F+bdAhztQbn+KJov9foF7w02PzjbzPjDXs+EPtNImszm15Nm14EJJ3U9yOQA8tYhboMJn2gx55mrMlk2Kf0IUCNz0ihEFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7709.namprd11.prod.outlook.com (2603:10b6:510:296::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Fri, 16 Aug
 2024 15:26:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 15:26:50 +0000
Date: Fri, 16 Aug 2024 10:26:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jose.souza@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 07/12] drm/xe: Limit drm_mm_node_allocated access to
 xe_ggtt_node
Message-ID: <bcrknmrzha53zq2tdip55gh4lgriuxezfhorctrqeb4hr6pgn5@vmky7xsrgf4f>
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
 <20240816150243.87596-7-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240816150243.87596-7-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:303:b4::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b4d47e-8b98-406d-7863-08dcbe07d930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sxx6JXvWbGAux+ygcGl4ycb7xslsndAJWiZ8DYNTmuWPNei/PsJpKny+Hjzv?=
 =?us-ascii?Q?L42r8dpD1CslgcG3kdfyCGbCVv+0wh5X/cZwZAA0g/+DFWN0VJwG1HDBEkGx?=
 =?us-ascii?Q?ISRI0cEyKgr1h0SGplirJtlRlAgnxD+rnnb8XT485KMhcrdC1C3sMTnWNL5H?=
 =?us-ascii?Q?PC0VIxH8AlAIajlANxG6xxnxF3bHrVRuIQSCtNjD90f8Vo1HzkudkSC7Hg7/?=
 =?us-ascii?Q?JaafdFFp+Sm0Z3yZFpRD1ze7scjaMVUJaosnpl1LHmpehV6EEHy6Y2HD8qix?=
 =?us-ascii?Q?41VpnlvudInTJ7PIrBCBwtttfa1IJziRqrkyriqfLWNkurdXMpC0QaUk5lE6?=
 =?us-ascii?Q?g4zJP1eWo3nzAyT0OSVLC7c1Hxs1xSx979hcD4MzjQoXGtXHjzKZuIfMw1S+?=
 =?us-ascii?Q?4x/0JMSXMyMlVB0gkZpPIpt4E5tzkzm8i3uOArWnVHc24/n6QIeTbakr14Y6?=
 =?us-ascii?Q?tTsbL3RwaJp4Od7jM/yHScjywljjJQ0iMmo22V5XOZQ0sEj8aJVnyzMuuIAO?=
 =?us-ascii?Q?WYawIRj3RO1jdHZuACtu06Ar9fSjlZFi/HMeb4GCuKG54wgkW6BPs251FBk4?=
 =?us-ascii?Q?HwDfpP7u0zKPVRg8QV15O54wLB82YGtDTWPSV0hRXeFC/Bw3KhuujRP1xpIJ?=
 =?us-ascii?Q?uemMtggVtT9JZHoPWVixil3SfNjOfvggFnRINWjA4FHUt2PbgJq8GkWig9IY?=
 =?us-ascii?Q?8Ro7bhRq5fXq0en8q7nMKBX39/wgROhMuV0UE8W0T1tChn8awqA3caOS+LMD?=
 =?us-ascii?Q?U/WY47vxWChFiKBbcN0gTMf9FFu7qaPED6Xj2CMjSwYDzqysi4LTYpoEmCxm?=
 =?us-ascii?Q?GBXsOu2GPBoMifwC4dOEJpaFphLiuWCODqOnKuPHNnkeJdLUmWnKG8zh+gvw?=
 =?us-ascii?Q?c2/O4KlVX65gsDDj/fbPAoG1ozzhxaS48vaKQHfTw2K48aKieASaLUHrNF9j?=
 =?us-ascii?Q?VsKkqjVq6dIZX+f9WVds35dRP19d6mPWdoiO/gfWtYyNjDcqeQ6kz/pZCeAs?=
 =?us-ascii?Q?EiJYeViXS2ARgzoU8MidApmO3br9nyYMJIaDKrzGJkbVp5MXFsgI8al/YXTv?=
 =?us-ascii?Q?Kkp+JhmCc6dMZRyCKVXbN2+Tx8iZJLzmNSsqTwDaN8lqJk5pkDQPJq7uPrPu?=
 =?us-ascii?Q?1iTvy5bVg2ZdblI+YWDrfLEqpneqJ4Tz5d3pv2P8ZTCtqcLfn5TI1TwT3UaU?=
 =?us-ascii?Q?r/DAShZbsFhgzWsLCeDCjx/UtM3O5w7HPMaOuyT+DlO4OOzNiLTEtbqEshCQ?=
 =?us-ascii?Q?4H4XoEkIqbyTIe6e1VIWUaoZVcDUt22hpdfivODNL/MB+ZGVDUFhzJGDvhpg?=
 =?us-ascii?Q?OCUIoH7Hbz/e8tTmbp3sEvO9mHRqgFAvrKtrX3MSFFI30A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LVMrFVhApJ9NaZzAZLpeTiGltufNofgrSjeaM4iH/8WZAeiAZTpy8eO/WDpl?=
 =?us-ascii?Q?N4zyKX9HaI4RCFIFXuLEeS0Q7oaiAJhJa3F3qqDJpX4Sx6Enb5vaBHzoHLok?=
 =?us-ascii?Q?NidnMW7sQeqv3/pe+EdICHK0k9wURkX3aC4YtaIM35ryXQeRanys1+2/YzZg?=
 =?us-ascii?Q?wrRITgkZ53OdWp2ZpuXqWFby0uBEdXCupO7dExAc9a3hAdfBUZnS7lRfQNzt?=
 =?us-ascii?Q?I57/LWspUJ5OHRZ/vm5H245WCdSFjKiwhyl6QUqTONgrV1qNgeEV99gvmVHu?=
 =?us-ascii?Q?yaqOtI6SOj8sjr9pUrNlSxr0lNfdaP5O6XW2rMjPVuktroRZ5MCgD7ZQ/s4H?=
 =?us-ascii?Q?FZ/TSawITPvUq+gpejZDhmOt+E1QFTmDh0CpjIqvda7x2mCFzpxarzevEFW2?=
 =?us-ascii?Q?h4cjIjncNQQV2x4xaJohow0OTao3AggxjIQQVdVVHyYjZyz3gKIZwO2BeqIa?=
 =?us-ascii?Q?AuabR0RbllR5Sz6pfL/A7c04MYZl3XYA7O6hu95FBgA7wNQ9wtJJ5nWJTNVF?=
 =?us-ascii?Q?0oktuU9JUd8fqtjCSyyLO5u+ZkNcWjZU4ogu6xG5oWZoCfuVYjQJ1vhbrrds?=
 =?us-ascii?Q?+TpBsuuvcn3sXeC/V0J2usq76E6p3wZCXrXyqizORLf1uOGqozgMsJ1p7lbR?=
 =?us-ascii?Q?Ue/G/o0IYqDlKeIXqd6onTwDOBANGrfWitKT40Ssq6jHxylQBFIesTi4omLe?=
 =?us-ascii?Q?lAzGJatkYHQ/N9O48MlvlCb+c20PDiew95JvC0DKpHAZXkWWSkPzFtCGft8p?=
 =?us-ascii?Q?gSK/DzLN6DXJSZX/Wkg7RLvufE0E+uWvmo4p8/NhG7Hg/BJHBUa+SbCgMydJ?=
 =?us-ascii?Q?hmp6eh7VWd+q+niBWfYwPWLvnvTkzVs5aDuQkpo3usDgL1grHmw9FuKo5pD/?=
 =?us-ascii?Q?wrNadgEeyX42EWliOg4e+45+kohbOJhQ6PwLf16dkD9GdvHy8B2AUag87Jr1?=
 =?us-ascii?Q?e8jV6TsOoVj4eQYlh+ypi/fUh3LsGkuH4uWd+soXs3pAJIvcQgprTj8dLsFI?=
 =?us-ascii?Q?GVB1nWlQ7KEuwLpaeF4054w6omrLNAF2V6octXcu5QpYGNCmiNJRPxJJrnTM?=
 =?us-ascii?Q?fdJHUfjC719zuwB4dwOANmzZ9VSAv9nHMkU1BXHAmqGVU1XOZHp6tsF9z0oQ?=
 =?us-ascii?Q?j7RvytpkEwiabXka3T1hRyxKvCsaDkBS2x+z7uo6Q1Z/aDIs2d25cFFi/HPY?=
 =?us-ascii?Q?Xcr+J1J3yDNa6L+m3FVG2Vm5zBNS+7jxcWixNMTfpXVyMhfIvCBBFoNKqeuR?=
 =?us-ascii?Q?bZfnnTAAwoJqPBjWu5DqxNZlUkLilpk9kzMyaHJa/0qEuiQbSJGzNBM4bbiL?=
 =?us-ascii?Q?XLXkfwrgedXe4O3q3eKRl8EV3Mslj4N4kftw4tmo1ua53/RTKsgNrxgTyLQ2?=
 =?us-ascii?Q?lX/jBOkvzI4ykX9jinF8uomylg065Etd+Ifi6/cqEU6P+iIJu1pE6CN9EqhX?=
 =?us-ascii?Q?ly7FY4szI96UbV4NbaFSYBEhgHRf9KPcLny74qWHVxaQHrrOUDJAlzMAatZw?=
 =?us-ascii?Q?ew9t+btgKRfD1UdzvLPrRz4VAU2rHGcdSem1o4QWRPj6XFl/vEpg+KO+MrP6?=
 =?us-ascii?Q?3X4+TfCgFMZzTPRAGHQM3z/h4fy6+uuNKq6upft/ZB4TToPpuGEHQwaIaTmG?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b4d47e-8b98-406d-7863-08dcbe07d930
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 15:26:49.8859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gL/kVSSUT/vmD7k8BZ8OegcRCLufUY/rDfq9Sk3zV/hcKhGIjUFNfP1i7vUa/866a8TtRAmxqsskaqna2bEk0IV210i9H54C3H0mOwXZHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7709
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

On Fri, Aug 16, 2024 at 11:02:38AM GMT, Rodrigo Vivi wrote:
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index e0da24bb5774..7c8bbaa30fca 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -477,6 +477,17 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> 	drm_dev_exit(idx);
> }
>
>+/**
>+ * xe_ggtt_node_allocated - Check if node is allocated
>+ * @node: the &xe_ggtt_node to be inspected
>+ *
>+ * Return: True if allocated, False otherwise.
>+ */
>+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
>+{
>+	return drm_mm_node_allocated(&node->base);
>+}

since you could fwd declare the drm_mm_node, maybe this wrapper would be
better as a static inline. Not blocking this series though.

Lucas De Marchi
