Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D5ECCD1BC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 11:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12F010E3CB;
	Thu, 23 Oct 2025 11:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JyxBcssb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872A910E3CB
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761217991; x=1792753991;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qUe69XU7712y5QUzgmIdWhF3Nj1UVRSIANp1RabG5qE=;
 b=JyxBcssbXB1DH4AB3pXK816YVTEgZPn59GtWvfYtgxFtgM1e4Mg7LnTU
 LMuq/KsLB+SVjZuus+Cd0cCZZGq1J49hP0RT8l3yGy1nypgcpeq+ALxOD
 PPToyWFoUgJ8MH6fXRLetVACh+EOTS7S+LGg8AFB6cSssZK+1Jn98I/I8
 iSvwB40imV6mfv3kFSHfIs71OWUe99mZEvo5MrwNxl39zDW28KGrPmeZD
 DeMYwM4D7chl1DO+Ir/ECprqi5ti/KGee5YlPLdsg7lcTfx3GWLJlUvj3
 ve1BP9SOchPNGf2rC6XQNfy67lfRBslXrHZrP+LNve0VTGbAKsaUUJPEW A==;
X-CSE-ConnectionGUID: 9Wp4CnVXRk6Dv4MdYV5twA==
X-CSE-MsgGUID: 2mnd1e9BRfa3gH0a1roVJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67220900"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67220900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:13:11 -0700
X-CSE-ConnectionGUID: d7KUQIiJRmult4GGUlqaPQ==
X-CSE-MsgGUID: NclSf680SUKdTwQftKv2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184906058"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:13:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 04:13:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 04:13:09 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 04:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LB4eh/M+8TOn8i0Y+hRdjCN8CsMEVkzDpGMwBR1o5JMmqb/nH2s1leDIf/ST3uMYX5DD/eG3Da12tutUahc+Ii/speEfzcQ+XRqUPvIeXcozYogAeq7EP6fHeLI60/Xys94Z3d5UExz64JQAp6LuW/d/PfDKJW0tsLoqZ0HEkTB/5OcHROG8xJTUjMWsai/SpSYdanGRJ/5V+L0UpNA3EIxjEHuTm4XEiP+Vlc4o5B99Qoj616erT2HrWUtr2Y8hT1Lq+zGjqXYxxPAt5RfRb0T0q61V9iE4IbDccu4dien9ztKRAUIyoq8jvwFb+CKhdX2jmEY2b8LRsCLHeJhyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnRlSpeGkxwyZF96tRUPzI//ghXhSdeMQjYNM6xWEw0=;
 b=qCbwkqiXwMld2FSIWeT65WE8eYLF0k2t5X8BO3Ps+puqXAIFKJDCHQbsLphycen10gayQQKN0B9u80gGfk0pFbjPTciAibZqhD3yEMixB3JinimgJnv2UN0mKO6J9VX7+jidbdNHc39Duju4l/a8/zlytRMlRSfxflVpvq0OukLb/xLZlDsrMUSLKNMS8SK4NROyWI050wH8LWoBsrhI0+dS8ZAJmNPsjST/Y2C+fOYjjS7JZe81YRugEMx1KP5PXPk+JC06TKviUYtWwWW+uNScuVHJjshSNMMc2bXShnSYCcGNULD10rNXCNjTEdV88AqpzjDZLnwa70j3yOp/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4987.namprd11.prod.outlook.com (2603:10b6:806:113::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:13:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:13:07 +0000
Date: Thu, 23 Oct 2025 06:13:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 01/12] drm/xe/cri: Add CRI platform definition
Message-ID: <itqqdyaxgieydocdn4s7pyp56ljnspan3hzmm3yollfmym3rn6@rk3rh66bod4b>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-1-bf11e61d9f49@intel.com>
 <aa7fa70a-b54d-4bc0-8c2a-01d300fa4b1d@intel.com>
 <imrwxmkq74tgmyngenrwxl3rv3r23t7dqu2b7jsemlb6jdc4i7@l7cf36qdwfgj>
 <iaspa7qpd7yv3wlsr5j6afu6hyi43uurtz4iydkxgmfpcmurus@yanpiuisnnjo>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <iaspa7qpd7yv3wlsr5j6afu6hyi43uurtz4iydkxgmfpcmurus@yanpiuisnnjo>
X-ClientProxiedBy: BY5PR20CA0035.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4987:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8d5440-31ef-4fce-1ffc-08de122524b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qOn9Ea6Jk0fXwekBp32In0PjYZU4HyrSvNjiSTYwbHOuSQREamho6FbZH7Pt?=
 =?us-ascii?Q?6CqrBh56W/wc/02HgXtAgLPA5hG2wboMSabLbwXUra3P4XL7Q1Qx0j1R5Dpl?=
 =?us-ascii?Q?kggRfMpZsWb9lTn5OkqlUPzLu0cfI+Q8bprd2H4/SzFNxUPBNoETBNHZzhoN?=
 =?us-ascii?Q?4fD1mE3FUYQ37CSzoeMzlbR/xhyu+3QGBHweLQ005pIC5DiaDoLC+PxtmjO4?=
 =?us-ascii?Q?3YmOfc6lJViWagoE4PCWycVQtSz5mcl516XosOPh/wufxw/oK5GdAyHjmlN2?=
 =?us-ascii?Q?yOr7Sr8E4C/5NBqPCkFladFFlyYnZ+wDqyMx1TV2itfgXOHP7ljvexwzQfAr?=
 =?us-ascii?Q?6e/vdTM5bB0aXUJbaeFWo2ZNhi/wKI0W5V+lnf28647y9xtsp4RaUXMDgxa0?=
 =?us-ascii?Q?tclGL+7QGEQBp6Lu9aRTO5Ug5HWgw2M6RaCFKu5SyjuB6TKmv6K9fw+l6SrM?=
 =?us-ascii?Q?YV5D4HLaOkzsvWvlv+4Co6h+WqBuMYL783Sh6Bpr2/KG7gHu+Hpoej7d7/ta?=
 =?us-ascii?Q?rzwjXYayjq/lpb2Lokdn8Wdfin/pBwZQqIS9+g+XGr2u7AAsOSEeRYQMpe0T?=
 =?us-ascii?Q?IDnpAC3viRT0mnHXuVH1wGWt9x8hhWKEieFPtmclOwOJ2zZrJ7q1aMPKhU/z?=
 =?us-ascii?Q?NSS44Tq7GP1DBXM+XMCQ6upxnFjAzsAaL7CG0kvfDTrqHG1aS7t5xbR8ShC3?=
 =?us-ascii?Q?RLEd1qyVJKkxpS4Iw1919PU7512iFiFfhIWJH9kQfS9KhMafKBIWO04uNpLF?=
 =?us-ascii?Q?aD4CcusXQkXksoXLYca3i5rIyMDRne/8EN1a2VBLDfS1Pn9mYAn3vxiP9y/H?=
 =?us-ascii?Q?NF+FLlYWQ95rH5y8fgs3P4DZ0fy1VcgvCFyAkFesakuH9EUb+NMKxcJO5Kru?=
 =?us-ascii?Q?m5bojgbKtr7hjMoqotl6YvVOYMKu6PcMfiq9F5TyhmtFqNm92LeR0NQyiIy7?=
 =?us-ascii?Q?mIhM7X9qLjE14pcl390yZ5DSH7R2FHHDIUZJtucblZ4tt4xuP5PhNTDL19Ie?=
 =?us-ascii?Q?Kdc/HYnyufnnfkdrRI4m906PfD5Wj4/rMaYZyrLxy+K3qr00k2FiTrKGomKT?=
 =?us-ascii?Q?L7kdL3IigNWlGoBUKmvpVpDhVfohTclD65Nk5bFegGInHNbstfpaJX1S7sIm?=
 =?us-ascii?Q?81YjgSlhi0H8cToE/kFJ/iEA3xLinTNsv02jt2ysr7ZQMrsq2IsOu159ES+E?=
 =?us-ascii?Q?iRC6elQFGL1GOjOc7iip8PqAaedF4gLVY1tCiXZaHRugklpZTrNg76OJQ4I7?=
 =?us-ascii?Q?6/XN5kNCUs31k5AYpXzygSZmP3YkEAG43NsrclUV06tQeMTda56zlFNpjphV?=
 =?us-ascii?Q?QWzz3dMS71YUwsDJkcUmEM0m82lg7eC2icUrKB1ExOQb9evK7fluWSjrmHoH?=
 =?us-ascii?Q?Bycvp+aT4ZbRTCiJ6I6k4UZwi52nh5rAtFSX6f7A3jT8U2+7rj91KnGqjwbG?=
 =?us-ascii?Q?agrW4ZzFLXhZEG4dyqs+LyYwuttubc+B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+eHW/boQic3oFAu/HalQiD8KXvNAWQKcGYmpAvDag7q/uQ2kp1CEruNoj+8f?=
 =?us-ascii?Q?RFnnorRlLSQpYiQVSqAkJ2a9v9/RkgiKeJi/iC8G0vDpWVQyZGYeIrwtmkW/?=
 =?us-ascii?Q?N3h6Bq+HsqBphUT17L8VxYNwLMYhTTx5mlX+tWPJJliAGbkNAN3Qv91oeru7?=
 =?us-ascii?Q?gSvgAzun5X43QQ/qc3CJMcsUQ9jOe+fl5CC8VNJ/1MjbW1PpJpZefJv6HgRP?=
 =?us-ascii?Q?UEV5jLRcgGxTL6enmMK80cs/FSvKjq15cSN7roFwZTwoEPtl+sXOf/rF+pRC?=
 =?us-ascii?Q?1ArunjijA+JlNG//vx6PyPEQ3z4cgm6f5qe9cXi6Jw6Uer8dOOkCqtujIIsr?=
 =?us-ascii?Q?E1kuqgzgHf7OfV9th5vQltvH2z/JhRftavauoMXdQMu9/fbJWC7xXR3QQzyy?=
 =?us-ascii?Q?o8qPyL4wlQh4k0LJoiMYNuAgx3L+sVB5Hazsq2lhFvr5jLk/ps27pi/zRrR6?=
 =?us-ascii?Q?Eog4IDZeAWxNTHW+IWMbzbuSzZEyw8JbfINFgDDPhAvK76Vw0ZuAD32VZT0G?=
 =?us-ascii?Q?x3a6eD+ZnazIIwYr83s8+vL1wSAXV5mSjwx8hWjWJBJu4xE5M3RA4at09ubG?=
 =?us-ascii?Q?NvPGVa0jICXbZXPAA0Cdrs4onQJh2NGuJtwa+Zo15eQwq8E8ole4d/96bU/R?=
 =?us-ascii?Q?9IXzzQmZpHRSz5VuwJD+8EEHaDq0mrlId71SeR4wi2RS7bGzSeJZYMLWMrWu?=
 =?us-ascii?Q?jQoy7NkskYuITWm0UK/KKprEhmm4+PslsBVIywhS1k2uOjBfrmmhQmUNJf+L?=
 =?us-ascii?Q?cfw1GzbaBpRz5aX4deBkgr4BKhOmQvnxaB8oJDFJ8c64LgRSkepszcUMCSE6?=
 =?us-ascii?Q?PfJfpwqNZ7D9TSdS1im80gWqa2G+l/Otto+lCSKwRGqCQNORUT+I8kvITXMo?=
 =?us-ascii?Q?S4FaKtFUeg6JArVTs3uXcs+RIsQzK7mt0+UXdJy7P2B2HicR/09M578WF7S4?=
 =?us-ascii?Q?KOS+4mGluAKEsLSNF+9QEiQ/izJjRuLEd4uwhLygHrHplEaNzEBw8dNm5Lub?=
 =?us-ascii?Q?uXn1yh+FJs3XHMCCKXBVqDEHR9U0qKihhJrESSACqXmqbQXSi8d2U34K9C2S?=
 =?us-ascii?Q?ifEQqF7xOrDeCgsvtmQikv1LgpJQAmt0Hdj/SkFYvcikitpmJTs5C1Utlj0j?=
 =?us-ascii?Q?+BdhDYkqBd8jOlOwMjBx+jii02pTFUZlKPcp+FNl0pjOUaio0Q+molNF0I7k?=
 =?us-ascii?Q?VvCGlXyPeksDm6u0wcbd7skSUsrsYkOfe9M91wgnkWgbW1QLys/o+uvxRiTf?=
 =?us-ascii?Q?JjqGdCEeEbTfbSZVX2e6C0Ktxnrrojug36UpkzxXtvAHWm0cQq9Aliu3K6KP?=
 =?us-ascii?Q?EcOl+ky5fYVstFwvXmWxMXOmsDGQ2ZYJDeroBhAMy4Ref1HxboPFuL2GTvMH?=
 =?us-ascii?Q?+kDnW72fRyty53z6/sEQ98QmfnJAu4pfSwuCny0joO3YUZR63LBTmbtICMmg?=
 =?us-ascii?Q?a0RJ0iJlAToMdel6d7MG9JmR5JOvozzr0+oO9aWtUMXuWBoNZ5H1BdytJeeL?=
 =?us-ascii?Q?MxnXgfi4qC4+drSnmRu9d+iqF3KWtAE7vb1n0obiBROs/PFXo3EsRo/+9ZJi?=
 =?us-ascii?Q?WzPqX23+6eb/SY55IZa257qOpeOH7SEMYyQve+f2OjLNgjmsGwEHS7VyT5+x?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8d5440-31ef-4fce-1ffc-08de122524b2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:13:07.3150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6XM9nAp4zJ08dWFFbgvcAKz2KXi7baSt7PkHrcSGgFb0qkUrFYWDgRnDffHhczphX4CKn6Wsiqt3xEDSD96Ycr2xkxJMJCUYMxm1VAS2d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4987
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

On Thu, Oct 23, 2025 at 05:57:51AM -0500, Lucas De Marchi wrote:
>
>Merged to drm-xe-next, thanks!
>
>[04/23] drm/xe/xe3p_lpm: Add special check in Media GT for Main GAMCTRL
>        commit: e681ddca301931dbea99fcb4bc5a5dacdb7fad06

^ and this was a wrong copy and paste, should have been:

[01/12] drm/xe/cri: Add CRI platform definition
         commit: 5e0de2dfbc1bddbd47fbcc9dabb4917000b0ca27

which was actually what I did.

Lucas De Marchi
