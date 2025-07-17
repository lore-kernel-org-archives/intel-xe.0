Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE681C83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 19:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB13E10E893;
	Thu, 17 Jul 2025 19:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3NH6OkC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ECC10E893
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 19:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752782279; x=1784318279;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IqiZIgq5WuQkntotVekMAxtNTJu2GIhuPoZxvKiaILE=;
 b=j3NH6OkCG+yNVdjy5IxRq9yxK38s41JjZSFyr0MyiySO6VqBVE93qI9C
 qP8jRG4+3FQPEBUwuYV1byCpArYbNNDZdJyXnOS0n/fh5TQSCVMJ9FLHC
 /n9hgUZXWhAgsjZS7doRGmYtOi40a0eA95EyKYjlWUxuKacjmccgqDcqt
 FyEPKSkUTLVuxzZvPyApo+rY9r56HKi140J0It0SvekGUnDkloF3tpLK5
 eJL7O+N/663oSmZIgxzmPZR6lcDftCXzMfYQhAYknfQ9cEd9+Q39xjf4b
 1QOBVCDsaar16SNxG/9GXai/pTvaictUBFwg56H1aOxugDt0+7UdCB6C3 w==;
X-CSE-ConnectionGUID: Mh38o76pSZKA6KeOIhWRzg==
X-CSE-MsgGUID: T9l+gvLFQJS7eDBpFqUe6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66140914"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="66140914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:57:59 -0700
X-CSE-ConnectionGUID: Z+bmWRvNSmWdZf/x0mp9zg==
X-CSE-MsgGUID: vi4Zb7xcTuu0Xdx9McVkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="157687205"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 12:57:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:57:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 12:57:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 12:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJU0F2sRw42luqeyhNaxNlldCrOEWzi8UXRzMrLDDUqNSapxPGG3rRSWnqNzNhrWD/lBhCVj4eAtk6F/wTmRVRIhUeQldLqAQdYrGux7xhkc6zxku7NjW1H9A0CHRk0xCoV9QnYJCtbSeEwl5rEe9tCHbQ11HeMXw6vnkMqEqpVw7L2jzL5eO4gV2+W3Cf91V+yA69I4IiUE/guYhDDLB6EEHn6dGLnr99eg3WFTfjZzOUuQOFMKPV2H+F5SlSaN7atP2PIejnqF84wi2xd2UVG2oOxiFQaiSgFWgD70LK+AFH/NOztDr+Z1Wn1JR73gI86LJl4iJydHCW4HyUEaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHscAAfPk5ED/BGjD0fgpDlNN6LPWucKYCHR7V+4vuM=;
 b=OzWJR3O3o7pixcHOWNNJGkx6uMOblkZgDnWJRrdeXV9CzIdMk74ekvrw1ONc0LiJzsZLchSY6EJdMSnMwQQeXvoN6CTm3YNrgtePqQeurbsnTnhaQisda8F1hxQtifSVM4IzONz0ZMrjzVsVMlyDQ+mCBcq4wiNF/p29lZMjMF6odFRTrO6z3bPIuwdOPa36kI/UBeYDi9lA8nHXDWPonGkJUYbZIlGZlh90cmQzkztN7Uk0i8hCXkUQ1atfH6gqb9DbvROEnhEHi8sEwZ5VFcReOCA56vDYKPo2/vJJHTWUDA64f/gNgDPurDrDfitKZdNHJgVECMMXVxbeIU3KQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB6296.namprd11.prod.outlook.com (2603:10b6:8:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 17 Jul
 2025 19:57:54 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Thu, 17 Jul 2025
 19:57:54 +0000
Date: Thu, 17 Jul 2025 12:59:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 4/9] drm/xe: Create ordered workqueue for GT TLB
 invalidation jobs
Message-ID: <aHlWK0L3yPwSwTdw@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-5-matthew.brost@intel.com>
 <87aa32cb0f684bddec35bd1d33e4765fe0bca173.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87aa32cb0f684bddec35bd1d33e4765fe0bca173.camel@intel.com>
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3a8aaf-acbf-4146-10b8-08ddc56c3791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Rwb2t0wKXUKN5nKB186DZyPOvK6HdvwfHIpdIyETH2JG9snJUCDR+c8lyt?=
 =?iso-8859-1?Q?XBsx/FG68OQ3YBUdNQDdBpMNS5EUlcEJP78IVICP6oMwMOxrTSnivhqQKJ?=
 =?iso-8859-1?Q?czzuNbk7J6o+VRuBLHDyBScIAaZ+jN1KDEbwVqY5c8iAqPkrkC83la78Q/?=
 =?iso-8859-1?Q?T1WzjDNEkZnP13bxhnGo42Rc+JDeSW7g/jDCdb1cRJELxfXHV+IcoakwiR?=
 =?iso-8859-1?Q?fqadZO2/Mbao/5iGNb31qgMimIep0hCkpUaVhbTj79VlYRpDkAh5nzN5CL?=
 =?iso-8859-1?Q?37oajJeCGbsoSa+Vtc7uHr5DFMHzTdF8Q0jRClss8anC6Xp0UaAPmNMSLX?=
 =?iso-8859-1?Q?12w4eXi5ycTwvMQkJ+Nc5cUw27i8gukSzCmnMBTkrhospBMKz/vGdkqER4?=
 =?iso-8859-1?Q?hsUtZZbkYr9pL5N8Pn0LYiTFMN8x2x55hDLZispwHG0CMPey1QZtAO16mb?=
 =?iso-8859-1?Q?KQ1WE4DBBxzndH5J8WAYIIUZowuwRFhc0BujEeYPKH3IaZ6nP3DmIt+tlg?=
 =?iso-8859-1?Q?EIcKC7d3JkR9qyxl9xUnAhk7C6191OXbapYwctSfRAdGPs0o1SI4oUyOBz?=
 =?iso-8859-1?Q?he6OkeCdTVj+Rs1KgPe2aWmMt43THeYr1wnCra8M8amAf1Hf4yQbeQu4N+?=
 =?iso-8859-1?Q?Foeg7oJEqCrPint8TE8E0SA6HvE4buzA5z0viyWikprNX5yAD2hPY7E7qO?=
 =?iso-8859-1?Q?peI+7mOLFYu1rkdhCw967Tjs0kOfyiBHtCwNf3eK65/7Wp2o7kx3Nt1eOK?=
 =?iso-8859-1?Q?8HT/FBZayB4ZNmU/GMnchImdSTcnpquCQE0xnVUtNEo4LPqj74S3xpf2HW?=
 =?iso-8859-1?Q?opzlVxhou3wK6OCWz8RLhOKXfB88GkBSwNtzl8b9TphcV8sMUlK30cTrWi?=
 =?iso-8859-1?Q?oJ7nUKA41ffXE19EUpGHZDabp/itfe0dex9l+xyTvNDYC0b9QbkLxv+DcN?=
 =?iso-8859-1?Q?TW9qFJmPXnHFSaLE3SWHS6iS14UBWoup+L5J5YFR7IX/A+bGtyeNylLgDZ?=
 =?iso-8859-1?Q?L/8/in9oVbb7N+483TS0/6TdQpRAWiCZxx7DUMlNB9ES6DiRWZOuzhd+8L?=
 =?iso-8859-1?Q?VHiqRoDKpQ7SvZF0GBmfWxAlbVkMZlA8f6XTcid/cC+ekepYVpQxI4AMkV?=
 =?iso-8859-1?Q?jQ3hOdmxuZ/ePl5OCgInsQpQXzPCw8qNvQJR+g8H8o9PO8AJL15MktiaWY?=
 =?iso-8859-1?Q?GCf9QZw593WhAHNnVRlFrrN7YfvJQgDwVVihOJZRWqwIMDQrM4bMUOZTaC?=
 =?iso-8859-1?Q?uwSc+XTpqayQ2SUHkbWAP1jzIlnW7h4mSOx6k5fDXjXRo3jOX20mXIC51a?=
 =?iso-8859-1?Q?D9tA0VqjDa2S1cCiZKcQXgDIAKNmWQqPxYEqklg5Pgwl4jwjOUUrsWto4B?=
 =?iso-8859-1?Q?+Hg4v5iQM+ZRD90ZKhNAQ/VCSbGr83aS0Dm+adAWaJVsVEBs01IPN5yi0Y?=
 =?iso-8859-1?Q?VuyMbEt0UtecWZk5GxY3wc7jMy2aEQXdGKXUVhoBURu4C0M4htXB1ThIhr?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b1OmazWNtcQDSPgsAWPYmqOsY2fA+zlkS2KFX/rTYYhD0lLqzmBz5ovk/B?=
 =?iso-8859-1?Q?+fqYnGd0AIi7cR/rmenuHBxaZZjYO2+CuQo/8bU+QsMGdo/7Amuk3XG1fw?=
 =?iso-8859-1?Q?kXwoGBigkgTaCs6puUHSoDFonksyw+B6Fqz2lt6Tifq7w3LgMHJMHozfvz?=
 =?iso-8859-1?Q?dTHkDT3ISGpGQlccuRGvgGfFSyXK5qlNU++wk33rOAvktEVEfYvPMDDa85?=
 =?iso-8859-1?Q?pz7b8vTxgPXymFQpmXWzc9jZE7jMMAU7Y4bgVs3GAa5dBuuFcdRLfkeh8v?=
 =?iso-8859-1?Q?qkwoTMrMRAGaDNE3Q+HOC18DLI0zKmWkhywhRwcoYyQsXTWXkb9sCVu+Fd?=
 =?iso-8859-1?Q?x8lSl4zLm1TOJ0BGqufRUPITcgYXBNh0mpjtF9Hl9aBFWHjU+Z9apHrxqV?=
 =?iso-8859-1?Q?yMhiyDbDK6LhnyWcoWYZnDkxgrFfXmeFNTpAg3dQP8YwkNPQqSfstx+s8E?=
 =?iso-8859-1?Q?QAvxKDAe6TS8eAl8N3R3HfjAshYbLswAeOkB6OAcpwS2p+HWv03ZcmRLwX?=
 =?iso-8859-1?Q?XjGH3dWaz2V8pNRuvsIn84fpM6uRJTS8aOGWvk9OZ4+diCislLYBbDw+Ap?=
 =?iso-8859-1?Q?GIKHZlKe4FBIGpovFYfMZxMjk8JAgD3uFk3QZR5rXLMFE4gdvPxdLmf3s8?=
 =?iso-8859-1?Q?ZgtXXCgzXOnZtXjPqHFS/3XkzWyRya6xxSlddm3jCZ9MJ9X46RDtcjI1AL?=
 =?iso-8859-1?Q?9Me665+ChW0NQq2s6dqnikbT4eZ0u2VCIvXvYKeU7w9rtPe7xR3j4JgCe/?=
 =?iso-8859-1?Q?trbmZl2zOixSKRL0iEaBQbDzFGnnSEyVBJpuOu3jJ8vXPWQ97hgcp3tmrb?=
 =?iso-8859-1?Q?jKnkzTl5+p8fiJvFoSkfnVN3g8wHxSzPkgD9xd+eo9N5H0fklabX2DHkqb?=
 =?iso-8859-1?Q?UmJYHyo6gKgdZLaNClxpq3bRxhA94wjEIbV7KUbpQ1GMM934hu5OV8NP8G?=
 =?iso-8859-1?Q?mnvac1y+OAZStMicw5UyC8q3vPCuqPC9uN62kd818F+T+lzBUg1WQu/tOC?=
 =?iso-8859-1?Q?kEIsFHLkbN7eoiGsJk94QACaLH+Wz2hkCpllNSrtah3p3mm64FdcKTb7/G?=
 =?iso-8859-1?Q?W/rZzeREf/py0cCewA3nrYQb1emtyc31JWvfSMhHynou1OXN9JQSuxqi61?=
 =?iso-8859-1?Q?no85B8Tyixgk+6/q1Xf9JKSCTvZsk/U5YCIS+K1u9hO2/pGo6o4Zggabx9?=
 =?iso-8859-1?Q?PCv8IYeuD1R7cGcd8B4zHhKHCWwYMFTNNxZSZoo2PtrcaYNuWa2Jol6yXN?=
 =?iso-8859-1?Q?0EFbusouSLwvFkikyd9Q4dtTEBjw4EtaatVvXsDiX6TmU9EE2ZTTN8/Okq?=
 =?iso-8859-1?Q?MDVKRt5VfL3JmxM30pX7mqOT6SIVTFkyADsZ01iD8SXuXNV+NlT73hRpum?=
 =?iso-8859-1?Q?ES/VmvQooJCZ/10X6XEiarnz6PI/CjOlfHl+uB+uPiUtGmH+CPVMZBH/oG?=
 =?iso-8859-1?Q?DFBfgx5BmmjQNJHJgfjwluYlvZjsaykbpjUBFpxnGKUEfRDcHu3BB9txtO?=
 =?iso-8859-1?Q?tlXvPOVj0tyb6/D+Se4m72htXkFTY8MbXiX0ukqkzONp29lKIrohh4DqyC?=
 =?iso-8859-1?Q?OTxNvSAaFn1FgR+NEbXi1+nu/x9lTBo3tQGdS3LwimqWaAqpRWKiT3AzNI?=
 =?iso-8859-1?Q?lDKE92HS8Fw5xSGiCNw+p7HXy7AWWLLAdR2r5RQBJLHdAypUsuGzvu0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3a8aaf-acbf-4146-10b8-08ddc56c3791
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 19:57:53.9080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diyOVUyoRBZbj9j5cXOLabFC7mb/E0cLzoJ7Y0gxhizRDtzixiah3E5tp/glxdME95tzXTTgImoL+jpCFtdQ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6296
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

On Thu, Jul 17, 2025 at 01:55:21PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > No sense to schedule GT TLB invalidation jobs in parallel which
> > target
> > the same given these all contend on the same lock, create ordered
> 
> This was supposed to be "in parallel which target the same exec queue"?
> 

'same GT'.

Will fix.

Matt

> > workqueue for GT TLB invalidation jobs.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I still think we should be including these patches with patches that
> actually use what is implemented here generally, but not a huge deal
> here. This is pretty straight forward and already used in the
> subsequent patches in the series.
> 
> Verified also the drmm_alloc_ordered_workqueue is auto destroyed on the
> drm dev put.
> 
> Other than the minor commit message confusion above:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
> >  drivers/gpu/drm/xe/xe_gt_types.h            | 2 ++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 6088df8e159c..f6f32600e8a5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -3,6 +3,8 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> >  
> > +#include <drm/drm_managed.h>
> > +
> >  #include "xe_gt_tlb_invalidation.h"
> >  
> >  #include "abi/guc_actions_abi.h"
> > @@ -123,6 +125,12 @@ int xe_gt_tlb_invalidation_init_early(struct
> > xe_gt *gt)
> >         INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
> >                           xe_gt_tlb_fence_timeout);
> >  
> > +       gt->tlb_invalidation.job_wq =
> > +               drmm_alloc_ordered_workqueue(&gt_to_xe(gt)->drm, "gt-
> > tbl-inval-job-wq",
> > +                                            WQ_MEM_RECLAIM);
> > +       if (IS_ERR(gt->tlb_invalidation.job_wq))
> > +               return PTR_ERR(gt->tlb_invalidation.job_wq);
> > +
> >         return 0;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 96344c604726..dfd4a16da5f0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -210,6 +210,8 @@ struct xe_gt {
> >                  * xe_gt_tlb_fence_timeout after the timeut interval
> > is over.
> >                  */
> >                 struct delayed_work fence_tdr;
> > +               /** @wtlb_invalidation.wq: schedules GT TLB
> > invalidation jobs */
> > +               struct workqueue_struct *job_wq;
> >                 /** @tlb_invalidation.lock: protects TLB invalidation
> > fences */
> >                 spinlock_t lock;
> >         } tlb_invalidation;
> 
