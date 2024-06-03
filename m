Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5669C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 17:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B7710E264;
	Mon,  3 Jun 2024 17:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOquFLhS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3733310E264
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 17:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717436573; x=1748972573;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y7/HHHgRmy3rB3rjUuF+/jKdxg0bq8seAM2mVzn4fdU=;
 b=dOquFLhSFq4zLUS8tC5aaYVn6pr1QK81B7UXNnqZhaXRi5DRrBTiYVGT
 NTGl6ibay/tpiSRrA8dbYPMX8KHgGAZ+X6xiYa6jHZcS+xYXTn1Gxzhbu
 a+CLV45tMgtpO8JMUbrDlwuyEz47Q2ZEikm7tu00sVGhCM4n3wmSuzogC
 htKWgcYn5ymeJnaByq3NpbMqwx+YC3R5km6KdjjkN6Q9apN9/CXYQaYj9
 4I1vSJjwZHeX5eNDdsA08XkExi3xZ+GMzN66k7+IQMY9eAkV/8frt8hTk
 hjIs5DaMYpTryFsICTD2mrmMs+O74LagduagfNCje6+ePvHgYEJY+erDY w==;
X-CSE-ConnectionGUID: snxeDazhQRmV+h7vCVoDEw==
X-CSE-MsgGUID: U51TuQi9R7SHgmlUo8XlNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24567160"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="24567160"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 10:42:52 -0700
X-CSE-ConnectionGUID: jvDVgGRmT1KLX6hvKnrtaQ==
X-CSE-MsgGUID: FHfHXPd5RJmRe7htCPiqzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41380002"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 10:42:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 10:42:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 10:42:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 10:42:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 10:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbuGjQpmDezyaG0JKCpporydf9ziGLHhrwMRwtum+dBgzBE+qeMNccSgc+PbUunSeW75g21k3AjQGnBAMpYjV2SX0y4leEWay9JvwnL3VugWV8fax/KdDIuLcyG+m0j8PEDQMpc24AxbpHEBD5gY6qI51zCK9pWB5eSxW6x2FsnyRBJ17vll4wCP1ylFxb0kxVE44SsuIqib+aaA9ngdq2iFEtbmnPPgAIHGgOyGu6ITFd7ivMePvvsQIQo/vNs66YbsLZIC/tcOBAkXLqyUPJjb7C58QdXmmv6oKPOYV/4LqEJ12zE7EeTxMLgGFkXbPdRUnvMwwoNvq84/RjQtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QR26lZc2OL+ZUjk+bPznMFM71mghJj6Ttd4MI56p8IA=;
 b=LHC0gwTeuWjvapaSf6ZR6mDuUfFLiQJvXfDGPHQSZIeETFDAPTVUeuMYfB2wJp5jfZGIt73h2O34NREN36NgRB4PcOgdvL2LkScS58q3gngNOrFLexDvdq2UlVNV5v/sezdDeTYtgL0XJZbl0PimQ6krRPcAyU/XrkdaziCJd6E83bgNpzdmEQgsyAhnpVUDc9fqvXMTzbG7nZLnLqoy1VDuZO+HiMr9t9uLijeakqtX7eZt5qnfXk4dWZu5ecdAv1X7OU4YCn7YVJ5aaaDPSVjUCWmZk/dHEVKYbHJffw/5G9q9iaBH5xEVcpUU2uwsH9kaF7faH/IUYv+mTKz6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 17:42:49 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 17:42:49 +0000
Date: Mon, 3 Jun 2024 17:42:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe: flush gtt before signalling user fence on all
 engines
Message-ID: <Zl4AbmvJs7REtG83@DUT025-TGLU.fm.intel.com>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
 <e28c1e17fd9a6b7153432ff204ada2102706fb28.camel@linux.intel.com>
 <Zljle1kB6gR51RX4@DUT025-TGLU.fm.intel.com>
 <93ca58d4cbbd37cd93ce82959a8da30efd91307a.camel@linux.intel.com>
 <2f068913-5010-41a6-b24a-2a8057fa8e1c@intel.com>
 <8c242b147e2bebb614ea145ccc1a799423114043.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c242b147e2bebb614ea145ccc1a799423114043.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0345.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV3PR11MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e11cd2c-f5c4-4ec5-2d40-08dc83f495e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?93L4HxGUSg77Nkr07wIPnN3lz3xnDWZHYs+U8G90bhpBSza8l9FSpKLykw?=
 =?iso-8859-1?Q?mxbOyTduT40v12WLpTKirB9vhucIK1au5105Ov6e64i1QppUwPfAga8Klj?=
 =?iso-8859-1?Q?QAkj6Z13ThX9tw2BTbDDpllb4MB76Pa+kKp4qom2REcMs+lgnfdjoDWa2N?=
 =?iso-8859-1?Q?2D33xCdcF3IHzMUsONSgio+MflaHBLX9WCWfp2ryTVImQh9xc2OhxG8e32?=
 =?iso-8859-1?Q?vh5ZCgELcwQRwUcwn+4SHeIqh7+H6cphJIS+4mg0YlrnbIqsu/BpvdM5ap?=
 =?iso-8859-1?Q?Gscku0kX9rvzLLXQG8/M/0ReDNvqmseK8iuF6ScrDA3CQ+rOWqdu2CUc+s?=
 =?iso-8859-1?Q?m7SEK8nOZuH0UcT95K5MyTBVKSKpZrw4qzgtRw17idE2jMBfR8gARJcqFr?=
 =?iso-8859-1?Q?v/AcPP9kia/GGJusqSxF6/3F6O7wofqK7KknmLvqz8uNv1kGYW06yh8dJ0?=
 =?iso-8859-1?Q?UZRR//0kHG4Lzs8l0LL+3O9PAolg1ChAGLUJk5G/GFnJeWX3m/Za5TWsJo?=
 =?iso-8859-1?Q?9QAcxP9DmE46OLRuyqNc1P0MeyU8XGoh479Nf4C+RaAfKQCUdiFAChkoGq?=
 =?iso-8859-1?Q?yIkGxwinN1AtwWOX6ogo/Yk37IPxY8S4IejUcMDwNwFtlV3lddVVhAkkAw?=
 =?iso-8859-1?Q?Zvpn0V5yjFeLYDxCRG0bnBLJCHO2zGLezelQ0yw1vyX3na0Kd/hk8SolQN?=
 =?iso-8859-1?Q?7n4tFyAe74cH+EIvq8Sz+9UMI4RYvWH8TawWF2x6zqkjLzIjzLIGeVWg13?=
 =?iso-8859-1?Q?tLE1PsolcVDYcOeT3HyB84qOae8moqbCNXQWVvZVHa+1HnRfm607h0qXLV?=
 =?iso-8859-1?Q?pJIsnrAq1DqtjNVAyUHjNtxeUQluuWVXiDzt5dHcmsBtGW+lp94eu6mSu8?=
 =?iso-8859-1?Q?S1webvVH/c8s3g2Y0z7dUctFmdtHCZKWGg2eeIbELQiMTAzgstAZ75Z5T1?=
 =?iso-8859-1?Q?caus26esaoIZPEa6CimMNxKS7Tk9WJrICfWd0h3xMG4o4AZ+MYU5U9yrEI?=
 =?iso-8859-1?Q?8sBurpJv14iidgK2zxwgX2quiZp4Gwcv66YbcftZQbhVerJULB5OdodzUI?=
 =?iso-8859-1?Q?8rJ9/4I/Qlmcnw2tuGN6zh35Sn4fXDXApBE/MPUULVlfamRGNcA2TawZZS?=
 =?iso-8859-1?Q?iVC00ibjbU9KUR4DFkji41m1FnQuojfXiTL29AlfZUa8f+ReT9f2/VPYhg?=
 =?iso-8859-1?Q?fQpjdeZCLmoiIMMQpmiaI9jerOsv/sezFH7O6+MUqByS7XHJeVXgoZfosy?=
 =?iso-8859-1?Q?FO/LpaR6PZuupV129T43zsXoTwMei2zO99W3KShxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?itae4Wnx75FHSWzjD8zRwhRrsBfL4SREW9KMDYOrZFlClXajrXjGuub0WV?=
 =?iso-8859-1?Q?vty0OYsSOS1KFjcXNh4mzbme+1I7U3p0WCIAUHwW/FPHvLgKYLFbFHJCBp?=
 =?iso-8859-1?Q?VEw9p/zoqi1fHnRHHjetzjlkStWU8XaqITI1BPKU7Ka8v2zvfC5HvGqsyV?=
 =?iso-8859-1?Q?xkdQ+GZz4vebH1Spgs3kGXwcsUotYNEMid/eTCnIxgfg3k9vusmLTONJvt?=
 =?iso-8859-1?Q?iQm8IB+lqnW1ACWcTAsBKsIDGjshUJUZGydXAE2SRJcFWNrc+SaU1PyWIu?=
 =?iso-8859-1?Q?JZ12asoZtDpSazfp5x3gyGP6GThCo4aKXA0nnk3zJlijOLR7rQJJvgKecU?=
 =?iso-8859-1?Q?PXrTMxbFNJkbFyOybVs/dnjh+MhyNboW3xWA/WA1skE5eQye4R7ibaUmL0?=
 =?iso-8859-1?Q?5omQ1KUFxCN1PYYu4wWgsM+4tcyAWhypRsyoqbGFoypDdK9Rjbe70O56II?=
 =?iso-8859-1?Q?ODERZCvzy5XYpXLmV/jIIqIjw44w4KtPAqijPGCzKBvCQN/j4sTLv1h7fq?=
 =?iso-8859-1?Q?i79fS42CdZCAzN/c7EP+zv1dEHxjsnuMJyXRnNOVNCr8gxKLTiD6CVkndH?=
 =?iso-8859-1?Q?m/6rN4cnoRM70Icoxgt0rnFkCmEMzOAj2wT21ytJqgVk3auJON53xUZZnM?=
 =?iso-8859-1?Q?y2//gTS0r76LaqmV9SoKG/SF8G0u8fQxY0oXKEdt2bqi+R8wuG48ieQzSD?=
 =?iso-8859-1?Q?SsiOVc5t8nsc5gyhEGgg5bf0MIUtdm/K+NyV1QEixiIVWE+8T5qmkjX+qe?=
 =?iso-8859-1?Q?jv0VtZfE9nhOImFZEVYT2sfN6IM/Uy6J8YUkJ00ygveEmPxrZEvh9JF28N?=
 =?iso-8859-1?Q?5rBakNcI3Yt46ygQLqUjJqXIEyAorS2VV2GMCsVn52daaKgYbn/kwAfpWc?=
 =?iso-8859-1?Q?SZ3AXEDUkfuvy0SM+ApNCHwnaFaFOVjmTJaPJwB2d/whPiDA5wj8gqMivY?=
 =?iso-8859-1?Q?dpiqDk0VCTY9RDJtjPcKfa2yhIDUnNk49MruXbO4tJV1lHgVir4Sv+uwAr?=
 =?iso-8859-1?Q?S3uHpSll59JJrtSPN1H9S8Z9fySzQnZiJxhAmpmdvfwAThWKKON1mwUAA0?=
 =?iso-8859-1?Q?Z0u358MOZ7ogNWy1GbEjljPetpTc/e8ZsRi0RZ0ELMnCcu5S+nvyXwXJ6b?=
 =?iso-8859-1?Q?21j8SLQme38k9xMf00WRb50q3OEWU35/TyAPDbIoL2vBhMe7XuAUqOP9KY?=
 =?iso-8859-1?Q?eQM6Vqmx7Jytj8dxa5LKw4f6BktWFJNLveS1YmrdlTEorzpYAfuOrAZIfL?=
 =?iso-8859-1?Q?4eS9xdGp2gbA/FZKKomXdtKnlwiZJQJcdoNJAEkgZred3CiqAJCExd/+rE?=
 =?iso-8859-1?Q?3vC5hiHKtoze27KfZDxnJp2o3l6UsIe9TJ1chAp0nlHjTghM8C51N+7VPP?=
 =?iso-8859-1?Q?sVl96jXF2WvEtHFB9YhiOOy+wCBZHkHvzOApM0RSfPvD11xocDPKSfZv0O?=
 =?iso-8859-1?Q?eRQ5a3ohS/IQkVdSAMRr1uF/Ls9xeDhDN4Mr57tSE6ucAVtUKPRd9i6w+S?=
 =?iso-8859-1?Q?2krcsaRaus6bhyZ+0xkgxyyNOHQjrsf8vYrpMexNXjFcyTQPvt5UXHDGTk?=
 =?iso-8859-1?Q?pASBiYwGF4ZDXD0hZbj5zyLXjYxC3y/IP+I6mjRTTenVucHVcOfdei1G03?=
 =?iso-8859-1?Q?pd89ba1JOoRnr2mc30aTcdGAJQz61FjpT0Vfr5ySbkPujEx0dAd2J3MA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e11cd2c-f5c4-4ec5-2d40-08dc83f495e8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 17:42:49.3054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwdXpBmsyabQtzajWa9z/eZnSyTDduh9xodia7S4TVmLuk4Lu8HuDBtG0TTQGXJKM1n0vqLisFQmAaoZXkC69Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8603
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

On Mon, Jun 03, 2024 at 10:47:32AM +0200, Thomas Hellström wrote:
> Hi,
> 
> On Mon, 2024-06-03 at 10:11 +0200, Andrzej Hajda wrote:
> > 
> > 
> > On 03.06.2024 09:35, Thomas Hellström wrote:
> > > On Thu, 2024-05-30 at 20:45 +0000, Matthew Brost wrote:
> > > > On Thu, May 30, 2024 at 01:17:32PM +0200, Thomas Hellström wrote:
> > > > > Hi, All.
> > > > > 
> > > > > I was looking at this patch for drm-xe-fixes but it doesn't
> > > > > look
> > > > > correct to me.
> > > > > 
> > > > > First, AFAICT, the "emit flush imm ggtt" means that we're
> > > > > flushing
> > > > > outstanding / posted writes, and then write a DW to a ggtt
> > > > > address,
> > > > > so
> > > > > we're not really "flushing gtt"
> > > > > 
> > > > So, is this a bad name? I think I agree. It could have been a
> > > > holdover
> > > > from the i915 names. Maybe we should do a cleanup in xe_ring_ops
> > > > soon?
> > > > 
> > > > Or are you saying that the existing emit_flush_imm_ggtt is not
> > > > sufficient to ensure all writes from batches are visible? If this
> > > > were
> > > > true, I would think we'd have all sorts of problems popping up.
> > > It was more the title of the patch that says "flush gtt" when I
> > > think
> > > it should say "flush writes" or something similar.
> > > 
> > > 
> > > > > Second, I don't think we have anything left that explicitly
> > > > > flushes
> > > > > the
> > > > > posted write of the user-fence value?
> > > > > 
> > > > I think this might be true. So there could be a case where we get
> > > > an
> > > > IRQ
> > > > and the user fence value is not yet visible?
> > > Yes, exactly.
> > > 
> > > > Not an expert ring programming but are instructions to store a
> > > > dword
> > > > which make these immediately visible? If so, I think that is what
> > > > should
> > > > be used.
> > > There are various options here, using various variants of
> > > MI_FLUSH_DW
> > > and pipe_control, and I'm not sure what would be the most
> > > performant
> > > but I think the simplest solution would be to revert the patch and
> > > just
> > > emit an additional MI_FLUSH_DW as a write barrier before emitting
> > > the
> > > posted userptr value.
> > 
> > As the patch already landed I have posted fix for it:
> > https://patchwork.freedesktop.org/series/134354/
> > 
> > Regards
> > Andrzej
> 
> I'm still concerned about the userptr write happening after the regular
> seqno write. Let's say the user requests a userptr write to a bo. 
> 

I don't think this is a valid concern. User fences should be limited to
LR VMs. We don't enforce this, but I think we should add that
restriction. It should be okay to do so unless we have UMD using user
fences in a non-LR VM (which we don't).

I'm going to post a patch for this now.

> 1) The LRC fence signals.

In LR mode, the hw seqno / LRC ires unused. We signal LR jobs fences
immediately on upon scheduling.

> 2) Bo is evicted / userptr invalidated. pages returned to system.

In LR mode if a BO is evicted / userptr invalidated either we kick jobs
off the HW via preempt fences or if in faulting we invalidate PPGTT
mapping which causes a recoverable fault.

> 3) The user-fence writes to pages that we no longer own, or causes a
> fault.

Either exceution is resumed via rebind worker with valid mappings or
upon page fault we create valid mappings.

With this, I believe the original patch along wiht upcoming fix [1] is
correct.

Matt

[1] https://patchwork.freedesktop.org/series/134354/

> 
> /Thomas
> 
> > 
> > > 
> > > > 
> > > > 
> > > > We should also probably check how downstream i915 did this too.
> > > > 
> > > > > and finally the seqno fence now gets flushed before the user-
> > > > > fence.
> > > > > Perhaps that's not a bad thing, though.
> > > > > 
> > > > I don't think this is an issue, I can't think of a case where
> > > > this
> > > > reordering would create a problem.
> > > > 
> > > > Matt
> > > /Thomas
> > > 
> > > >   
> > > > > /Thomas
> > > > > 
> > > > > 
> > > > > On Wed, 2024-05-22 at 09:27 +0200, Andrzej Hajda wrote:
> > > > > > Tests show that user fence signalling requires kind of write
> > > > > > barrier,
> > > > > > otherwise not all writes performed by the workload will be
> > > > > > available
> > > > > > to userspace. It is already done for render and compute, we
> > > > > > need
> > > > > > it
> > > > > > also for the rest: video, gsc, copy.
> > > > > > 
> > > > > > v2: added gsc and copy engines, added fixes and r-b tags
> > > > > > 
> > > > > > Closes:
> > > > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
> > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > > > > Intel
> > > > > > GPUs")
> > > > > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > > Changes in v2:
> > > > > > - Added fixes and r-b tags
> > > > > > - Link to v1:
> > > > > > https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com
> > > > > > ---
> > > > > > Matthew,
> > > > > > 
> > > > > > I have extended patch to copy and gsc engines. I have kept
> > > > > > your
> > > > > > r-b,
> > > > > > since the change is similar, I hope it is OK.
> > > > > > ---
> > > > > >   drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
> > > > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > index a3ca718456f6..a46a1257a24f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > @@ -234,13 +234,13 @@ static void
> > > > > > __emit_job_gen12_simple(struct
> > > > > > xe_sched_job *job, struct xe_lrc *lrc
> > > > > >   
> > > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > >   
> > > > > > +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > seqno,
> > > > > > false, dw, i);
> > > > > > +
> > > > > >   	if (job->user_fence.used)
> > > > > >   		i = emit_store_imm_ppgtt_posted(job-
> > > > > > > user_fence.addr,
> > > > > >   						job-
> > > > > > > user_fence.value,
> > > > > >   						dw, i);
> > > > > >   
> > > > > > -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > seqno,
> > > > > > false, dw, i);
> > > > > > -
> > > > > >   	i = emit_user_interrupt(dw, i);
> > > > > >   
> > > > > >   	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> > > > > > @@ -293,13 +293,13 @@ static void
> > > > > > __emit_job_gen12_video(struct
> > > > > > xe_sched_job *job, struct xe_lrc *lrc,
> > > > > >   
> > > > > >   	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> > > > > >   
> > > > > > +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > seqno,
> > > > > > false, dw, i);
> > > > > > +
> > > > > >   	if (job->user_fence.used)
> > > > > >   		i = emit_store_imm_ppgtt_posted(job-
> > > > > > > user_fence.addr,
> > > > > >   						job-
> > > > > > > user_fence.value,
> > > > > >   						dw, i);
> > > > > >   
> > > > > > -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > seqno,
> > > > > > false, dw, i);
> > > > > > -
> > > > > >   	i = emit_user_interrupt(dw, i);
> > > > > >   
> > > > > >   	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> > > > > > 
> > > > > > ---
> > > > > > base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
> > > > > > change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33
> > > > > > 
> > > > > > Best regards,
> > 
> 
