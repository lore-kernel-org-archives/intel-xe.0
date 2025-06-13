Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976CFC71148
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 16:30:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B470710E183;
	Fri, 13 Jun 2025 16:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6aht8Xq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBEF10E183
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749832206; x=1781368206;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=F14mriYRxVYHaToCk3/1eOAINRVWPiMe5oyyA8I7WvU=;
 b=R6aht8Xq5F+PQWe3Qd+Y8ZMktD63wXfrIe5jqqPW0vQXGiUusrhynITT
 KltCI159ReBXrvC+E4CJwz1gEbVgj6IFleEsK0emGC0eiHjd4jAeRJlWn
 34QdkRWlZJ8T3fINa8SJ2rcRIGlhybTj8QSRIbj0akiW6+R5nv0Zqxw7d
 8oJSwqGRJSf7nDm2gSQP9E0XzXyF/WnnQJUepn8IKC/wJV1bLJmxWiZts
 G60Xbaym1GJsByDhyEg0n+soHAL/szZ5ufBoTror12qohbP5/4nKT8g2W
 slu8M8zcylM+Q1ocYjTAhae9lzgtkMM5/GOtN27JtuitsAilulBrEOEzA w==;
X-CSE-ConnectionGUID: ZU5xHevCQuWHtoE/3epmyg==
X-CSE-MsgGUID: +I/54x0HQxaUofMFh3B5qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63464867"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="63464867"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:30:03 -0700
X-CSE-ConnectionGUID: BmLQZt6DTGGgOb1ulHF/qA==
X-CSE-MsgGUID: FZBS5SRqTReA13dCfrZxpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="178763076"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 09:30:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:30:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 13 Jun 2025 09:30:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 13 Jun 2025 09:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3HXDYd8teOgwl92n/BbJ/BkL6QJnDkg6i/FL1syOe5LymUhJrGvUTTkfUKQpflIwKt6rT2DwXnXg+c85LNZ2yaTA5qo1w8vCrHj7Q+jz8lcnh1+fSjYA4aMxuRsggYsR8fgeDtB1TVv3LKS5ya8bNtl5t71zDp0NuUJZ+AMIDosCIOL/7aLh8isMMT3+FL9DkhG226ccK6PAKSI/1X8vut3i1u+5v4BJqSilXQFhsUAl3pewCKgGktjgBiekQtYoru9ujRyzWU9ainL/Q3Xm52Vx/xDGQ2xGZdBDOYiE6KNoTNpqOulHuihP/IHZHHbsAztKs64qprizU65Htr+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVxCtWzsIBKTcOUe8FFoWWkNN2rPngJ4tVumYAHbsDY=;
 b=qUR7ho2RswegmXFVU8ecW5/eNM15dPt0CZo72J26IcDCKpDf4SZNUn1fZDpztL9pbA6Afqw37fKKhcR67OZ0LIRc5fc2kDBSh4lqT8DeuxFezS8atxDJLggv6x3+UZoNJKL4bKYSWVq7KWSTbhffMdYTuzEPxgyZgmmnXXHLypiWWWtmA7PGjJ2+t+/tPuq9wuM8tMd7smfWZPDZ6xF30O5IwJQrt3oKv4C3CFNmvciP70ixf5jCj5VMGQbp5aNPWjceE9BFQ30jmrZgko2KshrGS8yxPr4xRGB2pShFT2nnAdtGpBLesfDoVSjMqbBJYjjDvXB2WlLKil4DNrs2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 13 Jun
 2025 16:29:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 16:29:56 +0000
Date: Fri, 13 Jun 2025 09:31:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Opportunistically skip TLB invalidaion on unbind
Message-ID: <aExSZGseiz/qY0Om@lstrano-desk.jf.intel.com>
References: <20250613043645.255351-1-matthew.brost@intel.com>
 <136f645b70f1c0bfd646830d6cef2b60a0c3a22e.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <136f645b70f1c0bfd646830d6cef2b60a0c3a22e.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0215.namprd04.prod.outlook.com
 (2603:10b6:303:87::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2b36d5-add2-48db-51ab-08ddaa9788ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zZHo/8LDOjnf2dDZLa0apq2NQ8PjvsYqxgISRgoAq7lYMurCPTBhRAXDv/?=
 =?iso-8859-1?Q?qcLL0ZkzZfK0Bs6wXt+NLdlE8o0Ydz9u3egzJounwrMi8k1BQz+Wa0tYmL?=
 =?iso-8859-1?Q?TRRF958mbhLKDjxxcpNVVKqgWm3KTR53a6ckpYSBdh7CwdzqgFDCScevR2?=
 =?iso-8859-1?Q?QIRYzOZp++Dl6dpDi1cuuA/Hq6hCIOme/Uit++u1uBEcMSU1lM0xBQ+KuK?=
 =?iso-8859-1?Q?X29EDWiumqkAoczGf70ddWk0owHvsPgOJp7JMOLVbYOuczYPmJY9ZCRzyh?=
 =?iso-8859-1?Q?5yglgijeDBPC6nfNNG9pTfBiUzIerJPu3+ISGKYgJxsAvEtAfXM5ohUw0Q?=
 =?iso-8859-1?Q?CkGP/La+SYNYRQC2UPf8tk5qZTyeuezwrz9oL9eyhXupZK7p+e13teqSIA?=
 =?iso-8859-1?Q?jb0TDP9QVltq8V1TAWPj+MuvB6Ma8RFlAvs9NcWXuYiFmBsuI7a+kcjswe?=
 =?iso-8859-1?Q?MMTbgN32l/FJ+zNr+X2lERri9d8UYM+e3ypvSdTQF3BlaOzjSOHFTN0Ryi?=
 =?iso-8859-1?Q?IhlTRqmBKQ1qQtHOwRwHk2mZcEIvtj5AbKsDzritKkgDJ5TUZGgoG4DfTo?=
 =?iso-8859-1?Q?4MVRuXyz87JWmAUqnkS8r7NYwucga3vmH24aH6AQi0RASFXE7EspgUKLGE?=
 =?iso-8859-1?Q?WTSuILOxXECsi5swN7rBQeG+CSKwIMqqIgmIpP1cZ60uLzEnlxo800erdc?=
 =?iso-8859-1?Q?X6DCKVyrSqcoPo9tylqHbEjfoL8azyIt2G7sQxe1mb6Ak8LFqAeD10N77n?=
 =?iso-8859-1?Q?zyJewjyO77ms3m7vHfotUfnwx1yGm/1m6xjiUK2bX/OgmXLjoXVnSXf1Rx?=
 =?iso-8859-1?Q?DBQJlcjCNfRBj5sEcZcNxtbVVhA3acBdYGY2+A7i+2EmsM4IVwCS2VRKcr?=
 =?iso-8859-1?Q?XNnmueFo0frJSW261eJaH8rUEMS4CoeCdaH/h4knC+k1RG/s+yeA3tmkvu?=
 =?iso-8859-1?Q?i26RUUPBwIHpFLzErqIGqklYCscmsmDBaMe9gO+uXpBwpww6C6iEqEStXT?=
 =?iso-8859-1?Q?xRUJ72MMSVPXjnpsHtzLutzPeoPiQ+4yQ4hIpsYmUF4Lg16exLGoj39stF?=
 =?iso-8859-1?Q?GpERD5I4cDyM35bUsj1Ly3v5FhvqwNzt/z694+cYOYmqIdLG/MfgYn7/GZ?=
 =?iso-8859-1?Q?CxEbQCiVTp5XSQUxkcMab1vIPSSZhSi898rgIEVCCaLp/5YUn/IALc0H/4?=
 =?iso-8859-1?Q?LkJuzd6iMaGoECQ3j7s9Gd0Gixx90oaD5wBg40qW3Erjr1PwpZPpt7kCQW?=
 =?iso-8859-1?Q?s4be3JN0iFPTGxXKD74E8KSD22XzAep4es2k4rhXA/a5kAlTNfkhiX0IHy?=
 =?iso-8859-1?Q?1J6ikiyuXMTuoVPIu8hCxAYxpM5uLeBv8V1Aow5sRfusviWo1ZwYVdqnOX?=
 =?iso-8859-1?Q?Z0JW+sQ4hy5L9AGw4G5T6uWW1+Kye/obZE7o+F2kw3Io/8D1K8ALNhv9/o?=
 =?iso-8859-1?Q?qtyS3FCZ3gkUwgAYxSZm2UhBc4s8lhZQNqsRJ3o0JBpnmGtZ1ywYwO9Cgx?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CNoI/tQ7nnfD+i2kKQwJnipJioz9Er/Gwfz1qGQvPL2l2JayeyOACc8hVX?=
 =?iso-8859-1?Q?//ZqeGlxsILN2U4fgH5gf7zeKbo9f3ZRtNpM21PI8bM+ulk+F6boYYHqa+?=
 =?iso-8859-1?Q?lB6mXJuZDNsbRmstlXqJz14/YZuDG/09s9TjJbxZh4Tty/TN6/3jYSDbdN?=
 =?iso-8859-1?Q?0pn97jPtoc2ealzQtoGTmWVq5aoVs4mOoH3UtP0M7KX9i3t+qGBBkcpTsx?=
 =?iso-8859-1?Q?uL9zleEhSpvcFNNQzBexoBtXGi+nx66Zy8X3gvYSc7hHJMm1Sei58aKhg1?=
 =?iso-8859-1?Q?Xo4XD0gSZwg7fJIi3UFk5nzPAVyModjBoNia586Tya5oaDNghAkn8pzC3s?=
 =?iso-8859-1?Q?Xfb9i3SeYhAySk1oDIUCNnMDeOOb2W9lxNYcx9UyYvOCx82jnDbl04lv8v?=
 =?iso-8859-1?Q?AZKAXtoVLjLPk+MEUVhkfXBF7gWpdQVUNOKWHGsNVID8lIIG0qmFk9Abt3?=
 =?iso-8859-1?Q?/0z/EKLjtwlsBfO189MMMy1/dbHZvxl0DL0vjgNAvxK+CIuEq6WLz1BAg5?=
 =?iso-8859-1?Q?9aAplGgjfLkz28SVxdQTu9w9314oOsnBL2P4Q1MBz6Q8pkplUnxdhJQFkh?=
 =?iso-8859-1?Q?ucwxkYOq30swtS6lyfwgKMFVYA4Rms0UqQp2p8T59dbP9I9GAEsnT2icIZ?=
 =?iso-8859-1?Q?RbsThUM7YJV+g3rJ1srSojikQw0PjxWtW92wekNdSmwLcAz7Z/Ck569G2y?=
 =?iso-8859-1?Q?C64KQdEBU1eskb1Y+Sby56WAmg76kABQiFZwjT4QiO4COaQliQ5JufvGiI?=
 =?iso-8859-1?Q?k8sah+6PTl/suhjHOwWD857FUksg1f/JX9R6yEE+xISafy8Ckwi07vYw/P?=
 =?iso-8859-1?Q?uOsoCPUDiMsIGmeVWBmY5mYBUNvkCeRfvVhmoEkyYR9mqY8usB5ZuHZ1U8?=
 =?iso-8859-1?Q?zlhVxDKn9tIVBSuQnUt88h3+Y3je1Lq029LImqOPndh3uB/JAVCHPPSYPu?=
 =?iso-8859-1?Q?003ACH0Yy/uS29Yn2foqmfvGr0fDa7K/q9LMJ1UAP0h/KvEF/pF2xeBmM1?=
 =?iso-8859-1?Q?dUXQqtjTCNtL0Q0IEdnQv30UlHk41cTygAX1PymUsCqiky/Jq7pEzxH00s?=
 =?iso-8859-1?Q?H4RDRIarKCL1guVaIHhfsqRf/roqw632vO75ke2x1SiMS8Vh4M5PFCGBfL?=
 =?iso-8859-1?Q?iD+1S87B42gdlenuivxUy7VIxIQlq5k2e1qn9VfA17etjhbMR+VCAv9xcu?=
 =?iso-8859-1?Q?X01qvB862s6aaRPvcrc63CxjrnKBt4+lgdiqXwrF+EGrmleiqTkGFKq2w3?=
 =?iso-8859-1?Q?1SnMbXm2BdNRfowacrHpmbMY5tMaGEyvghwMTV8X9DwwOquSZ40iKoH6c1?=
 =?iso-8859-1?Q?Ys5WiyFq/LQHzv0bkZWBWhJB8JqwFJ1WIyDvUDon/e8u4dHHOABJ4IUs9a?=
 =?iso-8859-1?Q?hrB+o89fsBnTct7M20OvFU99h3s96RiOkkxWn7em65I42olBg/CgLPxNbm?=
 =?iso-8859-1?Q?6nbF59fv21w/Ha1SFi+YxabZqca9i9FY96vLTNP2m+YhopEgQe/yOFHsEM?=
 =?iso-8859-1?Q?hwfOGVE777xGxnGoK7FAxsbjaNXAtO3wKS+4yxmFVVWBoQ9ec2r2EanwhB?=
 =?iso-8859-1?Q?BhXJvt1DQkT2CU+qWDcjzN2YCmnaJ8OeDaaP1ZZ7iP20fIvF0OvNhjoNu6?=
 =?iso-8859-1?Q?AK/Sbfrcx9xQCcajXEFjlrMHPWHzYUZzD4tUM0adwh5+ZDZI18kOTnDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2b36d5-add2-48db-51ab-08ddaa9788ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 16:29:56.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPkFFP8mZ7vX779ihr+fTa5Pz3kWwMquejSY4ykY2b4Ljr4rgA37a+AMAVRThlOexNYYMpN17wu+kOIusUf16A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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

On Fri, Jun 13, 2025 at 10:24:32AM +0200, Thomas Hellström wrote:
> On Thu, 2025-06-12 at 21:36 -0700, Matthew Brost wrote:
> > If a range or VMA is invalidated and scratched page is disabled,
> > there
> > is no reason to issue a TLB invalidation on unbind, skip TLB
> > innvalidation is this condition is true. This is an opportunistic
> > check
> > as it is done without the notifier lock, thus it possible for the
> > range
> > or VMA to be invalidated after this check is performed.
> > 
> > This should improve performance of the SVM garbage collector, for
> > example, xe_exec_system_allocator --r many-stride-new-prefetch, went
> > ~20s to ~9.5s on a BMG.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c  | 18 ++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_svm.c |  5 ++++-
> >  drivers/gpu/drm/xe/xe_vm.c  |  5 ++++-
> >  3 files changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index f39d5cc9f411..09c3ccc81cca 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1988,7 +1988,14 @@ static int unbind_op_prepare(struct xe_tile
> > *tile,
> >  					 xe_vma_end(vma));
> >  	++pt_update_ops->current_op;
> >  	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> > -	pt_update_ops->needs_invalidation = true;
> > +
> > +	/*
> > +	 * Opportunistically supressing invalidation, READ_ONCE
> > pairs with
> > +	 * WRITE_ONCE in MMU notifier or BO move
> > +	 */
> > +	pt_update_ops->needs_invalidation |=
> > xe_vm_has_scratch(xe_vma_vm(vma)) ||
> > +		((vma->tile_present & BIT(tile->id)) &
> > +		 ~READ_ONCE(vma->tile_invalidated));
> >  
> >  	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op-
> > >num_entries);
> >  
> > @@ -2023,7 +2030,14 @@ static int unbind_range_prepare(struct xe_vm
> > *vm,
> >  					 range->base.itree.last +
> > 1);
> >  	++pt_update_ops->current_op;
> >  	pt_update_ops->needs_svm_lock = true;
> > -	pt_update_ops->needs_invalidation = true;
> > +
> > +	/*
> > +	 * Opportunistically supressing invalidation, READ_ONCE
> > pairs with
> > +	 * WRITE_ONCE in SVM MMU notifier
> 
> To avoid having to document the pairing for all use, perhaps some
> tile_invalidated accessors?
> 
> 
> > +	 */
> > +	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm)
> > ||
> > +		((range->tile_present & BIT(tile->id)) &
> > +		 ~READ_ONCE(range->tile_invalidated));
> 
> Would it be possible to code this repeated pattern as a function?
> 
> xe_vm_needs_invalidaion(vm, tile, tile_present, tile_invalidated);
> 
> Perhaps doesn't improve much on readability. Up to you.
> 

Let do this in a follow up. I think most of checks are similar enough a
per vma, range helper will eliminate most of these.

Matt 

> Otherwise LGTM.
> Thomas
> 
> 
> 
> >  
> >  	xe_pt_commit_prepare_unbind(XE_INVALID_VMA, pt_op->entries,
> >  				    pt_op->num_entries);
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 13abc6049041..5e5bf47293ad 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm
> > *vm, struct drm_gpusvm_range *r,
> >  	for_each_tile(tile, xe, id)
> >  		if (xe_pt_zap_ptes_range(tile, vm, range)) {
> >  			tile_mask |= BIT(id);
> > -			/* Pairs with READ_ONCE in
> > xe_svm_range_is_valid */
> > +			/*
> > +			 * Pairs with READ_ONCE in
> > xe_svm_range_is_valid or PT
> > +			 * code to suppress invalidation on unbind
> > +			 */
> >  			WRITE_ONCE(range->tile_invalidated,
> >  				   range->tile_invalidated |
> > BIT(id));
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index d18807b92b18..b296ac37347b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3924,7 +3924,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> >  	for (id = 0; id < fence_id; ++id)
> >  		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
> >  
> > -	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
> > +	/*
> > +	 * WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c or PT
> > code to
> > +	 * suppress invalidation on unbind
> > +	 */
> >  	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
> >  
> >  	return ret;
> 
