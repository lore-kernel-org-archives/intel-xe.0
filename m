Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA968EE6B44
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 17:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDE110E879;
	Fri,  6 Feb 2026 17:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJFvtqQ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B0010E879
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770400015; x=1801936015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4nn9RNQELltpOQgyJ4klRE5JluX3Ub4rdR1NJzLErX0=;
 b=EJFvtqQ25+COejex2HJBrS8Nkbl/UIe42YbscaYjjFD2mst7F76N5a0Y
 sIo1f9FqaEOd9LHWZly8rKv1XSJ9gNy7FVfBeu2/GfQWYioyh2PMiBDrm
 XDH+vFrbhF6jUDZGGdwPklN0HDt3Z/Q6bvNy5ZpRLE+rKHyxJvh/uRKSo
 Dgv1oep+FrjuKyxbSOZO2v+BSpeMKxHASrrYuMxHE8EVyuPtCCe4o2ERg
 ui5rTf+B8yADMbIO3gI9f1DZLDn/rjAx7lAFIpPUAVhhT1hEuVjV6Lohf
 eloo/se8//3zvglWEC3HRN/YYTgqlvjOvCezvPSY/1fSS7nnBwLJ0GM4g w==;
X-CSE-ConnectionGUID: fmZbhwIkStWwAdnDDRy/Qw==
X-CSE-MsgGUID: oVeYrWYKRKmv5jd1SqPZ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75232403"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="75232403"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 09:46:55 -0800
X-CSE-ConnectionGUID: vnUM5wrwT6Go0Da8y53i4w==
X-CSE-MsgGUID: SFB/6nj9QIKHbVytBQlWcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210216172"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 09:46:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:46:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 6 Feb 2026 09:46:52 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 6 Feb 2026 09:46:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZtk2H7Hw6t/NLgeqlPLtuf2IYibl3eoOJA4Ou6SgMlP8cTqGsrZkmyige98ZiYA1Y2kGpkfOmHkFYGp2Y+Mi0HzBijIFp1VwcOfXldwGyQfjtBPDtRJ5T2P08WpRPmhn1xqFSefUcHjw1OC6oGfF5bdrtnGxBnkdon14jIuIDdMKBEOT98bMOvPggTgOOw50NZ9mXvLxGOOvYcLOeP4PwTAM0XPfmfzmT2WdYkEOVBRr8DIYia1kUjYMUa7Pu5A9l0oO8V5C89k/ue5aArL9jXAXfz+NG2FS061/Lc7+/y57nYpMnE3tATyXFypm8ZcYW40XKTdzmXfGnG7yCM68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOGhE/z5CGAngd4/62/Hf0lOwTwisUQwyo6vk/JUHW4=;
 b=H4ZI/P0uPDRYwQ3steCbIg/k82itRzn5xhvndHnU7PqgxcCmbnLtbUINZb1DX3iVs0HdqNDYFsbp35jS59HLSXiGDCx5f25z4ckMoSftDiBlHFLLArPzddegvZ9fgWyrF7aDme177J+gI3rC70Boc4TXQHFgKrL1SqeWqG4OhAy2p+b9W0OsCjRfyjcUju6DC63ts+6cZpkWxtolkLLXI+cl9rN570Lj2wtlpX534Gt3cBvRyPk93g/lQfd0tCva9MtlxPI3uCXiM7xo63fJSI54lHmjpLIcrZDIwe3xiAk3AdIyXvpFSy/8A9qxaVo1NXEvg2q+Cp0aL4s9mGr96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 17:46:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 17:46:49 +0000
Date: Fri, 6 Feb 2026 09:46:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v1 2/4] drm/xe/vf: Avoid LRC being freed while applying
 fixups
Message-ID: <aYYpBk1h6Fpjy+yN@lstrano-desk.jf.intel.com>
References: <20260206145334.674679-1-tomasz.lis@intel.com>
 <20260206145334.674679-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260206145334.674679-3-tomasz.lis@intel.com>
X-ClientProxiedBy: MW3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:303:2b::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dec6463-828f-43e5-45cf-08de65a7b469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P+HehBb7/w/zf/T26bCaxfBQF3xHS8O3/utS/whRlOc6W+YCZlkwFlbhiWUQ?=
 =?us-ascii?Q?PTBIYz2inDUOVAwCl6K3esPjK6Q7gho/Y3Wji1pHimkH4XQDCnI1qq62/1Do?=
 =?us-ascii?Q?fhYldGsujU9x1JNki7AV7LpMwQ+r30A/7wWzefVB6OJC92KKEaY1XczQ7Op/?=
 =?us-ascii?Q?UemrRnsggqoKo057UduUwrIV56clKvvPZQjTBTPbDvzbRZTnimznVsLh1ZT0?=
 =?us-ascii?Q?DdcpB7tFZ0RHRv3StePbNQZI0Ix9Bymu1bQ5d0BuycPwOMoNQR26DN7Upc9i?=
 =?us-ascii?Q?43B16eTaUJl5Dpw4948ilkX5+XjyFbIqS4cJIUIsO4G9GchfB//qoIN1da9X?=
 =?us-ascii?Q?0bo24ov6rria2jUH4Cl9J8IOWQhxZpTDJnFq9lgJRW0/MHdAPPr0Uh3LN3Na?=
 =?us-ascii?Q?2uSpLxJ6jfP4IY9EMj8FQ4HPSPf9qTUpt+Y8+9XxpgGqHSCMwrxjOMgsPzup?=
 =?us-ascii?Q?qLlzlqLDaCKVZwVky4GfepugN6OYO5ndbxgUpoJEl5jEpQvJN7OzFd1/SZf2?=
 =?us-ascii?Q?95RuE1A0fW9VSgzgabf+QdzU6NlABJllRpfZLeYS39qLibDjzbpt+xDLJ1Gb?=
 =?us-ascii?Q?ms+Rz67/1BdX8Ui44ONkI2aI7pOFzs1aRZ0xPuNxXql72WKMipFlGMTwionR?=
 =?us-ascii?Q?0CmYeR/02XKFEXMA5ORvrvzOZlxDvpLVvpqfUz36qmjpKEbadq5ihbFsJvB2?=
 =?us-ascii?Q?ZXUqzdBGHJQPVdr0y0T+GLH0FrwlCOAqUtMz97dF3gi4VD+/NR05l0dGYCX/?=
 =?us-ascii?Q?c+Zyd5TiWFBeo59TpLhoo0JpUlNdpJYZoDDrS4Y173LGMN9YMTW2iUY9yLf9?=
 =?us-ascii?Q?ZsSOQylQhvK3ehMUh2HFK846M7hMHSCNzxpeF7f+hR86uHPRhe96E7NH/vnE?=
 =?us-ascii?Q?3HYfbcDvdT1nay+Lno7cf7hIwRE6kJBIlIKWTBGGEI/efixStz13zwWT6Eqk?=
 =?us-ascii?Q?a9mYIIz7ULdZgAvfL5QAQqPUjcJP+gWGmFeFwr83FVggxWoqc9U5WtJkom82?=
 =?us-ascii?Q?7zPhhag0trrUqnrpHMNgdwyqcCHwb6WAVa8VGgVDUrg3/E1CLf8RROUcMint?=
 =?us-ascii?Q?k5YRUWDk3FOqwBfyjIWKnyfLVR6lOkU9Ybf+R1FbyDz2LTjbVW4Z5fr/7vPj?=
 =?us-ascii?Q?hy9+0AWB0KHpUh+4CTkgnoSLgp2v2iWMjDdpCktdaMkyJxcExepVcj1Nw/ub?=
 =?us-ascii?Q?0pDj7HeBEgRVojNcmTAQN2oFfe32yxyAxb/Piyy9xfvtpCgq5eyjBqoLYy4c?=
 =?us-ascii?Q?oYLd0HJSgVsN59HxhIg/7NhIGJRXp8i3gWLvC+8G3oo+XUFqw18ahfa7xQDW?=
 =?us-ascii?Q?ku65RR/JOLezmxjie49Kra+IP5EAz0FnV+C+fgMUkMKsaLmktbNwyAjILVPZ?=
 =?us-ascii?Q?gzU+VzWnJWa+YYxWFr1xVc53e/qolcelqlRHHnYazRvu786eu7ELdhKnuNCb?=
 =?us-ascii?Q?lKGu8d8E3JDWzB7L0lVLZvQU8HFSsBQeDirKe68X1O6x2ozKAtO3+Vs6gaL6?=
 =?us-ascii?Q?NgkL8Q0x/tPr+wIVGoe4xEKrWOb47SWLpDpdGTn9ggLJgpjRBMAe3pEMG58D?=
 =?us-ascii?Q?RF47Pl+xu4ROg2scezk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rYevxsADzdgSunljRwq7XfM2Mc4nMRZuwMyKi0sNXZ1mz79MlFqiWLmUTEXL?=
 =?us-ascii?Q?gHuhhSwYAye4tXOptFgWpIot3354NQgACyGobWKJ3hQ0AmayunTyxuXA/Xer?=
 =?us-ascii?Q?SLawlcdG3FadqovbBr1Rcksh+FDuMUy7O5boyb7ZD9mn3cJKl9YTgW8zYIXl?=
 =?us-ascii?Q?9NASPkO0ES4mfnrgbTZ1ppnsnM4z8ZkfBB+8+t2EtbJ8I81FmRTUhqs+qsv4?=
 =?us-ascii?Q?pk6afjMDsdMLbpEPuD80a5umsL4oqjWzz1w44YVR84UBa/P3XItmMV67q+Na?=
 =?us-ascii?Q?85puC96h0/lo/d/WOIEybd0wvFq0whWS/Pman1+vqJrPNfYW6NAhoQzRxTut?=
 =?us-ascii?Q?C5NBytz4feoSK2HzY6WwYTN2EpDTIlbAxdMAIdjBM7z6L/2KQDP4qJIY+wdN?=
 =?us-ascii?Q?ahE4j56ggDCwSJIvjUJMlitNZwMnfTvuOYRI3ep3EcYfMUZTxB7iMYY/wxT0?=
 =?us-ascii?Q?mVVdNEd+KDxjfDS+UgFgnDQ4UKmkaa41bDSm9jGJcDPQA4Ja7hHgqWCLbFtm?=
 =?us-ascii?Q?avsltItsM1SkL9v1L4ytad4QCTumJ7C3BTBkUj5nD9FwIdxeMRsGDIUTbi6H?=
 =?us-ascii?Q?jNuyhszLst/fHn3Sk6FW14wuYgXD4BWL/IcdMmS9omD0r7jpUfT1/z0M+sZ0?=
 =?us-ascii?Q?ajSSdbQEFWMsyMOTKh0RbUZdKRPtn7tC0iV6EQyQ0Of02aRTZcPVVsQSQl9Q?=
 =?us-ascii?Q?w7DemNRs1BWqjM4xEddjHd2zbMrhAaEpyhx9fr1GiZo4AM49xAbIDUj0GIgJ?=
 =?us-ascii?Q?04KNWImJlaFVRAVLBC2guLpus8nRY6N6RGgHtEai0rCHdYOIKb7mSYLYUz/+?=
 =?us-ascii?Q?L/p1Ecbz/rTTj0403+E/zm343Mop6dvRx4DdHz9roYNJ2D5ntLJVelKiQ52e?=
 =?us-ascii?Q?CxbZS0bTBVwYANHOH8q92ooQXGHM8Yl5DkjABW2BdVgY6g+ZeSDQipIKC3Cr?=
 =?us-ascii?Q?OpNiXaNHjb1/D4JMUxwxf/8EMSFmjXtiqsru2gpeOcef4hKrDpp748YFoIpS?=
 =?us-ascii?Q?f+EbiXPYDzloqSlNV/TtAa8Mf/36N5HkAnY307yoWjpMvJbpy+wdNhzVHlP0?=
 =?us-ascii?Q?Ej5VmexP133VlHeruX7genwECrnzomA62/QmK4+vpiiqIwN97fcdaNd+6hUE?=
 =?us-ascii?Q?niGXdnBdZeo6UP45aB9tBN5/05a8ODFmO5uWWVhc6ApGUojVcLuwd8gbbBbQ?=
 =?us-ascii?Q?MVxg1cOnhdpmbdreb81H0ZKmqm1b7VLG/1qcIWqhHv+FP8kflmvyqHhd8iUm?=
 =?us-ascii?Q?dabYd5j29O02SE7FR3XnKwRHppQsbFel6x3xpfhGiPU84lLGxVekUNoCjCdC?=
 =?us-ascii?Q?q6TMUQGVCN+Csqa1Lqf7le2NAvTcHain/SSVY6nEUDHdpvSEoEW/BVXS9Dnl?=
 =?us-ascii?Q?hwFji7B48lbLetNgpqW71Pc/xebBjFZ8VkHkc1dhnt93XoBMkZF69LogYuJE?=
 =?us-ascii?Q?H0o4H/m27HZrnv8XDV5K8Ey6BQ8SkuO144PaqRdVIarQOwtTBVSif1Cge4g1?=
 =?us-ascii?Q?hQnH37wsiOOMPbGvsil/uBTzvzdDIwDf85DQX/WAH/CICrzGMh8d2SRdVyKC?=
 =?us-ascii?Q?7sjk8x4nAxh8EhCSADesPTQb0Z08BMlL3rdIHesdWXgCnhhkeoo3Nv3mH5Ed?=
 =?us-ascii?Q?b/Fv4Mqm8LJ3XFuzQmjmEbrx0Eip2EJT/AqqA8K0ocRUB6PLdrtOAiyjvpnK?=
 =?us-ascii?Q?7R7xSFfo04nnIHfgDTO0VLKPPpOozNNH1nKgC+O7VgISAebiqMKr1gL9ck/J?=
 =?us-ascii?Q?e3vPzVqSCQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dec6463-828f-43e5-45cf-08de65a7b469
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 17:46:49.5648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgCzyyEdOCoTrK8xDzSB+0nvmwRCqCz+u5yzpCwhJHL/Iy/U7kB3QaCLSMpnwSnC1RZKQqcu2Tr3O0ysNAYjSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

On Fri, Feb 06, 2026 at 03:53:32PM +0100, Tomasz Lis wrote:
> There is a small but non-zero chance that fixups are running on
> a context during teardown. The chances are decreased by starting
> the teardown by releasing guc_id, but remain non-zero.
> On the other hand the sync between fixups and context creation
> drastically increases chance for such parallel teardown if
> context creation fails.
> 

I don't think this is possible as xe_exec_queue_contexts_hwsp_rebase is
done under the submission_state.lock + being present in
submission_state.exec_queue_lookup. The removal is done in q->ops->fini
and the xe_lrc_put(s) should run after this step.

This is weakly documented, and should be improved, but I don't see the
problem. I am missing something here?

Matt

> Prevent LRC teardown in parallel with fixups by getting a reference.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 42849be46166..e9396ad3390a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1669,10 +1669,11 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>  		lrc = READ_ONCE(q->lrc[i]);
>  		if (!lrc)
>  			continue;
> -
> +		xe_lrc_get(lrc);
>  		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
>  		xe_lrc_update_hwctx_regs_with_address(lrc);
>  		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> +		xe_lrc_put(lrc);
>  		if (err)
>  			break;
>  	}
> -- 
> 2.25.1
> 
