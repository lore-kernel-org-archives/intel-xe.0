Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C454CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 02:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E324810E120;
	Wed, 24 Sep 2025 02:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QdBlg3Pm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6644810E120
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 02:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758680444; x=1790216444;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=stfm9E/dJdmD1m58iE0rARSl8SKAuTUmcpgiH2/gwfw=;
 b=QdBlg3PmsqLCtdeuCiDnrqOJG8yVysQlnsn7da8OoD3UD9nUvB8jnedh
 R2zSiTOwNT8o8j5UeJt+cvglj4CSnGyvwTBzaOsZFhnCGQO4uOHdp5HGW
 UPRbwx3pyUQlZBfyvLnCZ9oMvwqYTTb5pyYNnwc5GXiEpMkGjOZiZ7pE7
 KcDOPV0MB1srxF96gcABJF9A3cS7KkocMiq67+MWyZe9awrSi1JJSqOaO
 4mjsQq74gchJSSVGMr0SfM7w3da3ktrZSQdTkKWVqSPkLe8cbiIyscdhT
 wmAS8RgBHvCjIRCT23EEf7dAPSuPTBhXXElZE3z/bswmS9h5Jrs7NGgHs Q==;
X-CSE-ConnectionGUID: OYzZ9o3aQH2jbeVq46L/lw==
X-CSE-MsgGUID: J9043TIGQUGM3MDcpM1lvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60185246"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="60185246"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 19:20:44 -0700
X-CSE-ConnectionGUID: H1MW+PgNS5ax0pTXYQt2Xg==
X-CSE-MsgGUID: 6h37XUPEQzSjrM4eQ7IrXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="200614005"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 19:20:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 19:20:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 19:20:43 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.59) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 19:20:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jbd+emuLd7j71nzpi6K5x2CEEWN1ejQ0vwCbaO9nQHbRlYB7rYZXv8u7ZdRXTYhU8B5QU9IeAz5vaQQOOEt5//GgYdIH/0r5M/he7eX3vBZs3i056ARu+7sa6qnYsbKpdxTYWUutRTo8rK0EUnaz6hSECBf/4xITBlxlwaFp0jLK3thcjIGrie6rL8Dc9mcxt3vOc9QzDp8NTmd0F/mcoWn15ioBkKY+8i0oHSL+KPNkcuCMggfDjqfNkWJuRZT647vYWU6ahMmZB8Itc1a1F7/Q3xYoLB3PbldyrAGHsl5E+cZNy+HCHZGgHEfHO8/xUygNDPFTk9xLAL1jikxxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViZRKE+CvcaN3hsKBjfWaKzmGaRK5d4WpYTXJdJOlk0=;
 b=r0EZKHC3nu9bH8kG+USnrsMhYpEVxLeH9/GQhH9DFtYHdeZOi/s6LZy1zdwLlT+5gox/1e+v0PQs8iKT7OAUMv6Hrks+3mVL6SXwY9RRxLeCL/Uonqjec7Uxfjsgg63xzQcNht4BaHbTld7dJP2sKfsZ4E+rjsxN+l1FqoL2lFgFr8AamuNC+B2lgIMoLo4F9iE14cXWc8nu8rb9WuA5SDXTMLCkhaushvfN6ns6T3P//D4CgMrvRF42c1hGsCbJewqPR5VP3FxY3k/Px3TpbwKlMAdYubK9cCehklyT0Ii/ON8Lj3bfmhT1GHIVd+a17kbz2oT2KsPhHkMMc5ONQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8159.namprd11.prod.outlook.com (2603:10b6:8:17d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 02:20:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 02:20:40 +0000
Date: Tue, 23 Sep 2025 19:20:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Add helper to extend CPU-mirrored VMA range
 for merge
Message-ID: <aNNVdWyd6aHEv7+E@lstrano-desk.jf.intel.com>
References: <20250922104316.263995-1-himal.prasad.ghimiray@intel.com>
 <20250922104316.263995-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922104316.263995-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:303:b6::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 92dbf601-ca33-4b37-bcb2-08ddfb10f4d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?giL0WuK7nv8GGnzeo/Zs+ONfBzU9Odz1GVLs4Yg+2Xk5SjgzgyJUV7sqrc?=
 =?iso-8859-1?Q?61DkOs1hmOkEcbSNcUu9F49JIWknh9XCPZJ5k2CyRSgkDJPPyqTFxVLMYb?=
 =?iso-8859-1?Q?4iJv2pIp8IUPbL32scLFFvSyekvyJ9texu+zfsVwHfVfgydu/06w8hzaE6?=
 =?iso-8859-1?Q?9Skxg7qwSPhmP+QSpzeY88knyP7+e66oLMSNns8d6f+caWIvSCPhEjIV5z?=
 =?iso-8859-1?Q?DYqWzaBPwAVWUlxOcSy8lnXqLf3fQL/xrFKSZJemlPcURuQGvsIVd5otwG?=
 =?iso-8859-1?Q?eEle/XmjwosyKc9MjEbKTLBlgessZVVBcknsW6DbsHL8xxw0AyJS6EigVz?=
 =?iso-8859-1?Q?NyCpXgpzIvnauwlIWgws1aD/St2EWykvvLoN2mzeLlDMgorbv73b3IPnK5?=
 =?iso-8859-1?Q?LSqUGNKxiEBgnrl4jmSSy0DPnHUrBzyastTJFAsqbH0GbqcA0FBKepWGj6?=
 =?iso-8859-1?Q?YOd5TUy1mh4kMBlg6KZFdJCdk0uwDC2ciMPsZtuK65bUrMln8S93MRGx+K?=
 =?iso-8859-1?Q?RBd6IHNxB7RpwL1vp3c5U3oLaVMZkMVCUB0geRoRjnDOPOpR1qaKDi74cK?=
 =?iso-8859-1?Q?9sNrQrZGs/xmWRi2gSoZSE1xbbquA8ap4ELjtPiPWDIPrb7Z3gB+36+5c6?=
 =?iso-8859-1?Q?WTLCyScB7kZxvkaNAHh+1HDOLps3L5Z4cC0YoTTW9i6ye9CG4WKl3HZ+Wn?=
 =?iso-8859-1?Q?GowXP2gR3VDKtZmFwv56FlQb/odZUl5PD++cJHd5jqgrSO2an47Xx765Cw?=
 =?iso-8859-1?Q?0xVhI9vcWhrrPxZktyHiEJUaLJzeNLsG4gVktSVAwGFQxnjMhTniG6C+mR?=
 =?iso-8859-1?Q?o3XLYCJLtllft48vQZtjMFIScD0IIYJYV2UN2xbfJ6VfTpWUZ/dkJFetW/?=
 =?iso-8859-1?Q?YQtiLa7EKS91GzCN5IijcP7K9V645CzfzYiNqT2vQUWPr/sI2v8JditRSB?=
 =?iso-8859-1?Q?13wpywEnMepuC/SXi8yNI2tSHuv7M8dKruZtYGNTxybLR5RDGVZz36p7A9?=
 =?iso-8859-1?Q?7/A8EQKienTlsTlSxx4xzhiv598FdU1LO1CJ5l46th5APyc6kWyGwPUvVo?=
 =?iso-8859-1?Q?ZJgHqadZn68t9sR7D8My/X/sLoFmY3Iw4jDxWIiUWFhRMMnt1QJ6ycR7kV?=
 =?iso-8859-1?Q?aAdZ2dx0CD/pp0OPwChzORffvluGbjVhsuf/rgvggmHDQSOpPmLrxoAWoy?=
 =?iso-8859-1?Q?jO3OIhdyM/+eexjIXoc136DlM3wVa8G2r3tPAldfmZRsM/4nBHrgHdj+sF?=
 =?iso-8859-1?Q?GBhWlBzLh0zkJrGyB9tRENiF9DDqojYfgK3UV0572g/kbEq+DJ+rl/384t?=
 =?iso-8859-1?Q?frI/JOIy2uoKhuU2WegPbKcUXsjXK8q+romW+XnEKkTYDnOwCKBJWOUs8O?=
 =?iso-8859-1?Q?PZav45oqGISYMAU+EuqvM0SFOyQo9zblvgw5gwY/AA8LWOuH1g60jPYxwu?=
 =?iso-8859-1?Q?yZNcNXKHqCgBJlISDpR5iOSCUewavL8eZXQqb8/H9/YF6SZjROipsGYAS0?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DEOkoDU/4C9+hsEeYzwjLJuWqO/PT7ip3Bl8sVfbDGUAUp0axgKsRwMMsB?=
 =?iso-8859-1?Q?6msDNtCkgbWlPRYDBNMuAoIoqiyJQcVsCkHm2GSaJWW+pkV+40s2CBu6j9?=
 =?iso-8859-1?Q?Oek1Tx/2iXzRPPr2+gqGQAY3BwKGddTNmqq6ZnJKzjzbV+B6wyKa7gqN9Z?=
 =?iso-8859-1?Q?VBLNam4CVkFWz8PTgODi4Dd11S9sL0E3F1B5lDln1VxBSXFccI1L5WDr2I?=
 =?iso-8859-1?Q?yhQEKOYdUXdavGJ2f7ngJWHw8YZD7yYqFYFC1e+F3UhsGki5kR9X4gIHXB?=
 =?iso-8859-1?Q?aNvMaYAf9oSsH8UOW4wNYLE1Kf0Um6KIzD1BSU2Z2Z8hZDN2hnPgCYjRnT?=
 =?iso-8859-1?Q?QYfAvpBGKPMO/GkCA4hpy1twp/spv0IhMk5IqfkurasjP3NGiwYGdW8udT?=
 =?iso-8859-1?Q?irI4OFdRfd8FvglCaB8Peupu8/qOfs4oLG/tq/jCi53XOj6OcepO9sTkDN?=
 =?iso-8859-1?Q?mXtviOaBrb0OkM/n2MwjsevZ0OfUcipQyNHmr67WjJL+S39FCzlbfQvvVa?=
 =?iso-8859-1?Q?qDF7H+YLoWmjPAX97/7I5tXVz/371RBPPP7qI9ySp8xJ4XsOIjk4ALK4YM?=
 =?iso-8859-1?Q?RmTVeWDjydg9CTSTXirYWzQ6WUaB2e4G7qP2qG3zentdFUuUgdaFSyooff?=
 =?iso-8859-1?Q?WnZ3VOn7g6zhYN3OfyS/4IYh+Xmki1izl4O5afC9YBsg1eKL0qG9f9QKxC?=
 =?iso-8859-1?Q?CvuMODVWv3yJXCE6/sye/eaKH/0Lte+7SwJanM8X0IOfeI5iVtPsa1h2TJ?=
 =?iso-8859-1?Q?kVFGoJNiA+NuI1P0qGYnZcYDn3iEjZfWx9UC7sdXocw1Hc7ueDg5eCSciG?=
 =?iso-8859-1?Q?6+Fg5hGpXaZ9gjG5o3I0G2IFRT9Iamy5bkoWZFWRM3yIsw6WVP304NYLiS?=
 =?iso-8859-1?Q?DtWiAh0jLydJr5ka8Kw9uAvrpt3AuzCHj/g6SeVpB+5GRgTUboQO2Yt6Od?=
 =?iso-8859-1?Q?U6qcwoVPtXOMea+JYWrXr7brr3Z7ijSLmEQFM95PtsrVASd33wg3eRmaLw?=
 =?iso-8859-1?Q?GxDkcM99fo0dEKTN7mfztNkcvUALbNuEDiyRDALT/E1jXyADlEcRPS+M+H?=
 =?iso-8859-1?Q?sg1affSFB8WpaIVm3+RXTZtV5VyANfByNEgedYejrNmU7nf2pfisGvWOth?=
 =?iso-8859-1?Q?XkyHBy2ZMBil/nY0skog3TYHhclscbipCL8Z3HzrN7Gq6hlnmWJGNbOSRY?=
 =?iso-8859-1?Q?20kqEGg9hITXPghn/z4RIFKGnO1PnpivYKwwXljta4/tSg2XjWlRaq9PfF?=
 =?iso-8859-1?Q?5SYDwGBj/X3nBy0FRLovOQ2BEedODuJCBV3Xx7x9VxUbMC/aLPzc3euh2q?=
 =?iso-8859-1?Q?B7aFt306/Ed4ciTd214ySp1t8xMLPa9N3cEXgbaYMex2HknWcLH8bm15zD?=
 =?iso-8859-1?Q?ssmAtkGKjt6Mx7KqJ5gcJWU2lWO4XBly1MkE3B/eZkBOwTjd6YAWet+moh?=
 =?iso-8859-1?Q?fs+SOYwsUnEk2jHA42rnANW8s1iC68raqH3zxCWtm8WiIpMkz4LIuR3dak?=
 =?iso-8859-1?Q?VMnXXCx7QMqnGkNIw/LmjNNyvVgQcP+RrcIBNS7cmmx6fiotDGcRTfS94N?=
 =?iso-8859-1?Q?wKZLP/5TpmNWFZJrfXHbatpUh/WhcGii3Tyjl5t9Jz5EGx76l1/+TRE7rb?=
 =?iso-8859-1?Q?/E8i1O7PXebNbe/3py8UNgpEmv7Ql/RYeSJK44o0t2D1AdBaRBHFIb5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dbf601-ca33-4b37-bcb2-08ddfb10f4d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 02:20:40.3819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLxgwvtrEyCYbzzHxacf0M3hwi8NE0V2LYuaHHH8YYorHLIC+YFA6vjZTvLd06FeLcpohwy8soTWCShg7CADxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8159
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

On Mon, Sep 22, 2025 at 04:13:13PM +0530, Himal Prasad Ghimiray wrote:
> Introduce xe_vm_find_cpu_addr_mirror_vma_range(), which computes an
> extended range around a given range by including adjacent VMAs that are
> CPU-address-mirrored and have default memory attributes. This helper is
> useful for determining mergeable range without performing the actual merge.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 37 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h |  3 +++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0cacab20ff85..4927f2fd9349 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4343,6 +4343,43 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  	return xe_vm_alloc_vma(vm, &map_req, true);
>  }
>  
> +static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
> +{
> +	return vma && xe_vma_is_cpu_addr_mirror(vma) && xe_vma_has_default_mem_attrs(vma);
> +}
> +
> +/**
> + * xe_vm_find_cpu_addr_mirror_vma_range - Extend a VMA range to include adjacent CPU-mirrored VMAs
> + * @vm: VM to search within
> + * @start: Input/output pointer to the starting address of the range
> + * @end: Input/output pointer to the end address of the range
> + *
> + * Given a range defined by @start and @range, this function checks the VMAs
> + * immediately before and after the range. If those neighboring VMAs are
> + * CPU-address-mirrored and have default memory attributes, the function
> + * updates @start and @range to include them. This extended range can then
> + * be used for merging or other operations that require a unified VMA.
> + *
> + * The function does not perform the merge itself; it only computes the
> + * mergeable boundaries.
> + */
> +void xe_vm_find_cpu_addr_mirror_vma_range(struct xe_vm *vm, u64 *start, u64 *end)
> +{
> +	struct xe_vma *prev, *next;
> +

lockdep_assert_held(&vm->lock);

Otherwise LGTM.

Matt

> +	if (*start > 0) {
> +		prev = xe_vm_find_vma_by_addr(vm, *start - 1);
> +		if (is_cpu_addr_vma_with_default_attr(prev))
> +			*start = xe_vma_start(prev);
> +	}
> +
> +	if (*end < vm->size) {
> +		next = xe_vm_find_vma_by_addr(vm, *end + 1);
> +		if (is_cpu_addr_vma_with_default_attr(next))
> +			*end = xe_vma_end(next);
> +	}
> +}
> +
>  /**
>   * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ef8a5019574e..361f10b3c453 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -68,6 +68,9 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>  
>  bool xe_vma_has_default_mem_attrs(struct xe_vma *vma);
>  
> +void xe_vm_find_cpu_addr_mirror_vma_range(struct xe_vm *vm,
> +					  u64 *start,
> +					  u64 *end);
>  /**
>   * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
>   * @vm: The vm
> -- 
> 2.34.1
> 
