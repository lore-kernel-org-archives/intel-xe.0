Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E85C87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 14:50:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6BC10E78F;
	Wed,  6 Aug 2025 14:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oE74AbaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252AC10E78C
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754491857; x=1786027857;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cR63/cXfP7pmfR2XM/uJe812MdEfQ8zymJUfyUWEgUo=;
 b=oE74AbaUVt6rKvBQ39qp74Uoq8CLPcyyqQj0eqlx9tKdTcsASqBW2OTj
 o0bMCk69/lE75dIabw4K9xDs9mftDEcT3+jVIYaqABAArl6MdTDPLyx7k
 5RxKCHb/yeK3xiqP3XOnP8hk4xUE4lOotoos7wKyIJtp0xonLjQgvvAlZ
 Ww71ZlkiXcCxHievcKIzcA8OEFH4IvKnPtjtJLXk+r0WPQiCay8FkWU5Q
 Gfa2Mp4mQXAIe4TVM7YvTH3VO8zygiOL1SwNAGE5yEF02KK8RcKH0z8Qm
 HSQUNoCgkX/UUM2KM+cJhPfcOi36O9aGYvuvLiPEoKFmfqZTX/Ri+FTTq A==;
X-CSE-ConnectionGUID: Eic8gDs9Re6N2+XPEB//EA==
X-CSE-MsgGUID: gFh0TfnITz2c5TQQvY2kIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56954324"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="56954324"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 07:50:57 -0700
X-CSE-ConnectionGUID: IwcLsAJrTGSOU77QQk9ALQ==
X-CSE-MsgGUID: NnVfRQkUTC6PbAgsYoG09Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164042123"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 07:50:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 07:50:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 07:50:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 07:50:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfxwhXVHX0PqEMWjvN9GOl4UcUSa4iO3BOxjoYfPy53YVD7149n58J6pLMh6FhL+iJ+TcZziAlvgUgAr0qJd36NECx0IN8tR6qfnNcAYEYREXP0dR7ebeyLWRhzaJ1/5HKCR4a2W/nPSuYajm5PHIR7K1i7MCb6/8aq6GoUzHFY3LNil8ULp2E/nPndDocigD4bUCJtgLMRNpsM+ziqin7D3vigNxjyFNFVaDNaDhGdF29ATDFTAB7EoXcmu5ySPttNIWik9vbdi2udEW5KCGnHI2ITCmA6HDZLdhWXQyWPkVNeqLma4AIzkoq1aJcZV3BhzKSzv/lH3kzQSAqXdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAf3kqIgFYBCgf1lVoZw5mWzOdJMsHQUCEj9uyq7edo=;
 b=fzDctln7D0+Y045w6wL/kv3NIsTSgkmA7rWH2bRbuOI7LjziJDouBNUuDVF7PbjKZZBX+VMQkCcArEEFT5tV2Zwj8YOywVlHa4NbskTemT/C2PJLoEXz4gjJscyLVDK4nEwSSVJCIyoChnpTzXpwr1bNIJQlq1Z+Ft2nOP6c4UZbxbtfAXivvsBgueqcDh9DYk0Zdm0vYLPQtuhyQxWR/g0rgkIqQeouGfacvNSVVMqwszmwIe9yUEeSU9hjkSas0z6OutHId1GTo5CaL2QVQP1hzybBKF6bEdsBMkgaZ3R7aQ2WWczePVLzDCH4of5Erw3a7h32A5/DofmaVPdkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA3PR11MB9208.namprd11.prod.outlook.com (2603:10b6:208:57c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 14:50:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 14:50:53 +0000
Date: Wed, 6 Aug 2025 11:49:54 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 09/11] drm/xe/configfs: Check if device was
 preconfigured
Message-ID: <bm2cdsfopy564voe6fsarowb5uh5cqptushwy3v2gf7t7ypsmr@uviun5ted47y>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-10-michal.wajdeczko@intel.com>
 <2etfvrw5naiwpragohjcoyywilmhqgdvvfsnniqkxgjitkv7e5@dgynxcaowgjj>
 <aee53da8-cb7b-4b24-8d5b-e702872b372d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aee53da8-cb7b-4b24-8d5b-e702872b372d@intel.com>
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA3PR11MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 6262ea6d-d5b7-4609-845e-08ddd4f8a33f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?d8jhKFFtMMX6UYRc3dOM0NQNBQGETvBzR474n+1FM8YzvMjGvXjSJzF4D2?=
 =?iso-8859-1?Q?ddvb6NMAJWN3r6qu+BE4IRtH1MOM21z/Co8JNnlhEmRZYFMa+Vwk1DO6D4?=
 =?iso-8859-1?Q?YmQMoV+hetpUo6BlIxnRbq8X0kkNiqH396eLJpOrmvx0neSE5LDYDj4rW5?=
 =?iso-8859-1?Q?ekOsm3lp2j08BdCifX6tiIMmKyXZC9md7zEP0ocBE9o5IvGTSjXx3mFexZ?=
 =?iso-8859-1?Q?Hj6DaWIzmcaz8DtMtUuuyZB4YD58VdafhNrWwSGoIxPF+9HSQDd+tEbAHs?=
 =?iso-8859-1?Q?O/sG2kl/fdVJkDOJ9QhtQC2mp8LtBYiy8LnYEESMy5K7Pp4RczZ9rLwOa3?=
 =?iso-8859-1?Q?esw5GYMALdTkGQggOBNk3ZXuD3Ij1zYi3sh8Jim1rUNYZEud1KBxti1Ccl?=
 =?iso-8859-1?Q?ZUEajLVaSWK4CxOF/TE8sjRLte5dmV0JUN36JwbwgGL2NX8ovjYPbf4shT?=
 =?iso-8859-1?Q?WPAAX5WS6Yz1sQao5S0XFd15BdRT6nSpYHplscMTlhDEYBseUncbw+NIP2?=
 =?iso-8859-1?Q?/C3PJ3MTtgypmxaFKt+EFQU12f/EIaOAce6tR0qzremhbXtCYVF8y1wlBG?=
 =?iso-8859-1?Q?MKR6n9yn1pW528SzF8+lMrt/3JNr8fmMt5p0svTKgYxttAE0fdJgnq6qmH?=
 =?iso-8859-1?Q?qoweUxoj1i945y8vUe7T3AOCBP6EhfT5Ua0FVNI2U4l2Q/pXTxTPaTPVVS?=
 =?iso-8859-1?Q?iRlaygG1IzMeNfSsjrH9pPFOm+RB2u9kXXDZcNudrLL0AGAZRBpdFFVD0I?=
 =?iso-8859-1?Q?yNZyxc+rQomTtaKW0izDNWyIbArTXGi2sOI2VqSfIl984VPEu+oXFAgqjo?=
 =?iso-8859-1?Q?m3ufcFaa4J3Z4p4u/pDmV2CXDWwTUVjaEGoEQFR5+l2cYId5++n2qWkhOm?=
 =?iso-8859-1?Q?PKEgx+pm9JeRcUTNNcYoDJnoVxk6k3kvfFmz0xiWQDCVbkhX6eFNdNDQrb?=
 =?iso-8859-1?Q?V1b6bmcR0tyaii6SQ/QRQE5AQY0wdKIN+2xI+MF9g8THN2iNuzRVEH4QYd?=
 =?iso-8859-1?Q?Tvlo3YQJxTuWQjYFKDeM1XWgvW070ip/ExzyuIy0WCYakya/y/FEiHpXHN?=
 =?iso-8859-1?Q?wn5M994uEllNatDjlGyb25jW98ryAN/MB8bm3nxva2+8JX+Q1JHr6V2xiJ?=
 =?iso-8859-1?Q?tgOIue8qHjhP8cbyvXqfleS0ij0+uaeWq+uM17+Jrp4rX/gbEfKh8c8/8n?=
 =?iso-8859-1?Q?6Sb4htmdgqLqkYVatwctlxTps79iK+hH/5IDsY1vKGgUuc38NrMp/ZOI0I?=
 =?iso-8859-1?Q?lNRoJ4WXBrnztgFW7Lg2A6yQi8NnclCBgIXRME9TufO7lDDB9/4osTrro4?=
 =?iso-8859-1?Q?x+xsAWYflf01dfw6aqXuWJ+pUJvL917PEoyp5VtJziLmnZ8NzGz0GA6uUO?=
 =?iso-8859-1?Q?B81+cX3+nmO+7R/PD9AOkIXtHtvGkTpLyNh40jrKRJyTyYJMNdOnbNeMY0?=
 =?iso-8859-1?Q?EnsHd6K397k1/Aou5R2BpBxtwkI/k5tEDq/BAinphPui/XYAT6u9kgSIjl?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UP/48wkXIZesKPn7MA2/s1t2gn6R5hbtDdwgbOtZG3N8jrstwf1Qh21zqU?=
 =?iso-8859-1?Q?X+F6PSC4XDDWXTdK2Wo1UEECwbQxzc0jZAOhsgWX+5izK5p7VML/pcdZ/n?=
 =?iso-8859-1?Q?u2U/y4YsNCBxeBkZhPVHnTrVnDX4H5Tmy24lvEE0Zk0DGRcb1LpnEXbLTN?=
 =?iso-8859-1?Q?SrLXOJaduKu4t/4owaxR/Ta3qKd9LdHusgidghIuqv0CAWyYAz6Ud/roOp?=
 =?iso-8859-1?Q?m99354HMUq2e1QQULkpTo7jmWOnLzbsEGS6LtFFVU2Q2l3PuySa+Hdug0Q?=
 =?iso-8859-1?Q?O0c1FsXkf9h8CSL17BuE0YiJsjsdncRNORjxZ3duS8IiH7Lv7fjlJHjDUL?=
 =?iso-8859-1?Q?hxbpQQuESs5PVceoFrvViSpEDmpFq3liNB3s/5JYIyvfpERt7VU70qcgTp?=
 =?iso-8859-1?Q?7au0ApRDexpzmAUff5dzg56iv71n9w0OqhARcd8V28fVb4B9Qpax425CW8?=
 =?iso-8859-1?Q?I11w6+9N/oi6he2Cfl0WUWqdoU4iDZS4vvdvzwIlQbFbVQuXMmm3kJHul9?=
 =?iso-8859-1?Q?gvnUOyFu2FdFRPqftib8loUTup9j+fYjWlEAj32Q9iDLZzivh9UPu7qcp9?=
 =?iso-8859-1?Q?XZmYsIUowjzE8cRlUqr1rsx0LmMemjcRrBJv19pCjxyiC7ha8mMm2mzGeZ?=
 =?iso-8859-1?Q?fA7g/pjElfVH6C2ZAIfqBSsX3o2I8xY/wk/GgWM4xwwk0I+EOANJvrvInW?=
 =?iso-8859-1?Q?h3NSSacGSfNI6ZkhhA5/NHJypfdGMdoUSa+P5w1FXu7S8z3ivP8YauzMMB?=
 =?iso-8859-1?Q?4Fei/OZ7PRl+RKEkOdrXhgr5IvR4Vk8S7bqHau6aVbsN3gS6PgcpHYl+S/?=
 =?iso-8859-1?Q?KPDoelqBeNlHbyCl59ipB6a1BooY31aPqtlW/ayxiDXcB+8+mSRam1JwaL?=
 =?iso-8859-1?Q?2FXFFnc9WyxRuWc5bYqc0nQ8LBVz6oEUTnAfKMrDGdIK5UmqlQHZo1Iks1?=
 =?iso-8859-1?Q?ftHhgFvPlsL2Ryh38jYeOkn71pnFMd2D4d+PnPKyvaL4tWzfoqtnOyUCi1?=
 =?iso-8859-1?Q?9lSjaLP6bOXFF7DFh70DUf7Sud8OLmd9fupMNK9ubo/SzSvbG1QXjh2hon?=
 =?iso-8859-1?Q?HQTZR6OwIbGjVVtXcP3X6tH+SEQN/tXZe3h++M+FqzfuFTKGe4e1AJwijw?=
 =?iso-8859-1?Q?yLgVH7LCmLzRR9fLrxfWs+kiF+leyHihie7Ru0xguricyvsmvP6mb+1ZDl?=
 =?iso-8859-1?Q?naAXaZjqZw32xRWBxDcqoEZHmXX+50/hWnfLz28UFtYKKbXl2iyd0p2Vre?=
 =?iso-8859-1?Q?Dof1C+DUNQSyYMGAeUpjVlVYg6bZ5qdPI3ybx4/AT/L6IAAG2aIOjwq1oP?=
 =?iso-8859-1?Q?YzgwikjTtI3FY0obPhbQ7CM7W0cy1ABQygec3liXC/IhcM55gP6Dei4rDD?=
 =?iso-8859-1?Q?hiKC+v0xBKNYHLn9xHBKe5IEA7OTiIKTOHFaEaBWs5REtxEcNapBz/BVYM?=
 =?iso-8859-1?Q?VUalWDLCvxggxexAcbIS/4s24EQHL669LWMrFayrdI0QA7JDG7o1es7P69?=
 =?iso-8859-1?Q?ik/Vp2rAblQvCb6qEBWJU04Qq0CQCkDqm+k5m23yDaZPi1CByqWiHj388T?=
 =?iso-8859-1?Q?2Y9d9jggM1Ogl2srfg9NQij7fJMpXZZUenZR6KDsERPb/D+FVOkQKQYC06?=
 =?iso-8859-1?Q?P26XCIlA3spGM7seyYXKUAe3lU2uD3T8kO3YmE/yKnR8qnkZI83ixqtg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6262ea6d-d5b7-4609-845e-08ddd4f8a33f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:50:53.3941 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gTe70dD6Bm6lug0hH5Ly5Fc6354+EDdKfZEwl/PCd56p5pAskXrQ7i7r5AiA7D1oaAFxLk7+WtwrHaKSPsVJXJmnTlCkGEjMwlyollJ8VPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9208
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

On Tue, Aug 05, 2025 at 04:14:26PM -0700, John Harrison wrote:
>On 8/5/2025 12:30 PM, Lucas De Marchi wrote:
>>On Thu, Jul 31, 2025 at 09:33:37PM +0200, Michal Wajdeczko wrote:
>>>Since device configuration using configfs could be prepared long
>>>time prior the driver load, add a debug log whether the current
>>>device driver probe is using custom or default settings.
>>>
>>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>>>---
>>>v2: make function void, rename helpers (Lucas) and rebased
>>>---
>>>drivers/gpu/drm/xe/xe_configfs.c | 25 +++++++++++++++++++++++++
>>>drivers/gpu/drm/xe/xe_configfs.h |  2 ++
>>>drivers/gpu/drm/xe/xe_pci.c      |  3 +++
>>>3 files changed, 30 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_configfs.c 
>>>b/drivers/gpu/drm/xe/xe_configfs.c
>>>index 150e7f2becc8..5f145ccdf535 100644
>>>--- a/drivers/gpu/drm/xe/xe_configfs.c
>>>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>>>@@ -107,6 +107,11 @@ static void set_device_defaults(struct 
>>>xe_config_device *config)
>>>    *config = device_defaults;
>>>}
>>>
>>>+static bool config_device_is_default(const struct 
>>>xe_config_device *config)
>>
>>this isn't exactly safe and as such shouldn't be a helper that can be
>>misused.
>>
>>$ pahole -C xe_config_device 
>>/p2/build-drm-xe-next/drivers/gpu/drm/xe/xe.o
>>struct xe_config_device {
>>        bool                       survivability_mode;   /* 0     1 */
>>
>>        /* XXX 7 bytes hole, try to pack */
>>
>>        u64                        engines_allowed;      /* 8     8 */
>>
>>        /* size: 16, cachelines: 1, members: 2 */
>>        /* sum members: 9, holes: 1, sum holes: 7 */
>>        /* last cacheline: 16 bytes */
>>};
>>
>On i915 at least, the rule for the module parameter structure was to 
>keep all bools at the end. Would that fix the issue here? If the 
>structure is full size integers first, then bool/char values at the 
>end then there would be no holes and no issues with uninitialised 
>data?

it's a good rule to avoid multiple holes and keep the flags together,
but it doesn't fix the issue here. You'd trade a hole for a padding.
sizeof() will include the padding and for locally scoped object it's
undefined behavior what the padding contains (and it does change
depending on compiler and optimization levels)...

I'd simply avoid the issue by not adding such a helper and simply inline
it here where we know the scope of each variable.

Lucas De Marchi

>
>John.
>
>>>+{
>>>+    return !memcmp(config, &device_defaults, sizeof(*config));
>>>+}
>>>+
>>>struct engine_info {
>>>    const char *cls;
>>>    u64 mask;
>>>@@ -339,6 +344,26 @@ static struct xe_config_group_device 
>>>*find_xe_config_group_device(struct pci_dev
>>>    return to_xe_config_group_device(item);
>>>}
>>>
>>>+/**
>>>+ * xe_configfs_check_device() - Test if device was configured by 
>>>configfs
>>>+ * @pdev: the &pci_dev device to test
>>>+ *
>>>+ * Try to find the configfs group that belongs to the specified 
>>>pci device
>>>+ * and print a diagnostic message if found.
>>>+ */
>>>+void xe_configfs_check_device(struct pci_dev *pdev)
>>>+{
>>>+    struct xe_config_group_device *dev = 
>>>find_xe_config_group_device(pdev);
>>>+
>>>+    if (!dev)
>>>+        return;
>>>+
>>>+    pci_dbg(pdev, "found %s settings in configfs\n",
>>>+        config_device_is_default(&dev->config) ? "default" : "custom");
>>
>>I guess comparing dev->config and device_defaults is safe because both
>>will zero-initialize the hole (or padding if we had one): the former is
>>allocated via kzalloc() and the latter has static storage.
>>
>>I'd just remove the helper and do the memcmp explicitly in this
>>function.
>>
>>Lucas De Marchi
>>
>>>+
>>>+    config_group_put(&dev->group);
>>>+}
>>>+
>>>/**
>>> * xe_configfs_get_survivability_mode - get configfs survivability 
>>>mode attribute
>>> * @pdev: pci device
>>>diff --git a/drivers/gpu/drm/xe/xe_configfs.h 
>>>b/drivers/gpu/drm/xe/xe_configfs.h
>>>index fb8764008089..fa4ea7f0c375 100644
>>>--- a/drivers/gpu/drm/xe/xe_configfs.h
>>>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>>>@@ -13,12 +13,14 @@ struct pci_dev;
>>>#if IS_ENABLED(CONFIG_CONFIGFS_FS)
>>>int xe_configfs_init(void);
>>>void xe_configfs_exit(void);
>>>+void xe_configfs_check_device(struct pci_dev *pdev);
>>>bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>>void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>>>u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>>>#else
>>>static inline int xe_configfs_init(void) { return 0; }
>>>static inline void xe_configfs_exit(void) { }
>>>+static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>>>static inline bool xe_configfs_get_survivability_mode(struct 
>>>pci_dev *pdev) { return false; }
>>>static inline void xe_configfs_clear_survivability_mode(struct 
>>>pci_dev *pdev) { }
>>>static inline u64 xe_configfs_get_engines_allowed(struct pci_dev 
>>>*pdev) { return U64_MAX; }
>>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>index 52d46c66ae1e..9ce6e6dca5bc 100644
>>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>>@@ -17,6 +17,7 @@
>>>
>>>#include "display/xe_display.h"
>>>#include "regs/xe_gt_regs.h"
>>>+#include "xe_configfs.h"
>>>#include "xe_device.h"
>>>#include "xe_drv.h"
>>>#include "xe_gt.h"
>>>@@ -771,6 +772,8 @@ static int xe_pci_probe(struct pci_dev *pdev, 
>>>const struct pci_device_id *ent)
>>>    struct xe_device *xe;
>>>    int err;
>>>
>>>+    xe_configfs_check_device(pdev);
>>>+
>>>    if (desc->require_force_probe && !id_forced(pdev->device)) {
>>>        dev_info(&pdev->dev,
>>>             "Your graphics device %04x is not officially supported\n"
>>>-- 
>>>2.47.1
>>>
>
