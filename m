Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593F7C2BA1A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 18:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A9E10E161;
	Thu, 20 Jun 2024 18:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkyTxTpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814F510E161
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 18:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718909584; x=1750445584;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zFTA/6V/UeexgW1XI8lp0KrG79+fBN86ag10c4mdMqA=;
 b=fkyTxTpabDGE/tcZ1K6bcdQNtHOdupZgxNOGQvB9cw1taugUggsbx4Ky
 Y6kEM6IiORQ4fZCJ2fvczcGpkZ6xGyNPb+pZ4MbwnvJvE6Lwww3VQ/GOq
 vTUln7BAXVErcZfAn6Cqd1/eHzvw0hL0nCi/VPmLAmwbbxxSVHpCA/z2x
 bsBQ0KCdEmUkzADXIpE/Vj07JoOa0P066GirR5DyIg4x/y2RJ9wQbSLJo
 UpfwH4s/IsrUr0Jys6QQpdBk4tZwOZGYAs5gDL1jO4IeE59Y1syE7HK0N
 xyPhnhY08l6Fz/DAFF58IcrC2LWCNKeqpk9I/H+kQ2g3dN6HOxYzn9HJU A==;
X-CSE-ConnectionGUID: PrbMLvC5QEWAo8tsfXm1GA==
X-CSE-MsgGUID: vVFiRj/iT4m+skHkRLZg8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19729724"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19729724"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 11:53:04 -0700
X-CSE-ConnectionGUID: GIbfDZbyQJmvpV1U8R06bA==
X-CSE-MsgGUID: OR/HPl8/SgiLKliN19uZ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42437573"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 11:53:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 11:53:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 11:53:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 11:53:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 11:53:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moEMsiv1Zo8aQp0skkpTqV1MG7jsBE3o20ZmUlbs3q/QvX2R+/vHR2fWnmRg4vo/CZ96UYygTWYP7NDHk5UcZLveADy6beuOpQsPZKb3GqokipIEkm24rXLbSnKHY+T19DpxU98pO5rag7eQmuyTxMTh/mXybDv3fLps74MlB/wpyxrP3kdD8OxwRIIwjHgOpn45SUiI42rT0+VpduRQWGUKaRpqu3gy3zY9zhBzoY8MZUgCTeAbWONapIyHMDVnfZ1qbpSKT1OJUBoPPUHcdhFvHgw8SCa9HjxLI2sqvvFP7EjnxAEK8RmojvFfOITezjxQgXf/pM6b58lqOMdatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qwgTXsYGqPu/ax1ixtn0JqVOl1jzJZMj1s5flzDx6k=;
 b=G2GXGBpYFSZutZTDk4G1SILgwCuh+/MFLWdDGRwuRIMUJOZPg33kkIfxLjQCPOPmgB9OgvA/fm8+VorjqM9Jq82kndBpf53k5U1z+AyzNa5WvVvhibMIkzj1mPe04WW/4l1ADoqT3I//Xbk91gEPXxM1i2jITGFrH6CZYfqhxhjbISGmJAu7eyfDOtdrxD33DmFzxzigzYZI1Ec7Y0EZiOpzpE0JDJzKqLmnpYDGQbn2+0Zxb+kdyfwqnSF6dj0rvndNGqOxIX9DCA2Gfc4Ceqx7xqMU8XIPLOSzf6qyTBTB2vfNvtjSODC/rBb9A5qIYRrN4cARc27buswL9l3l9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6844.namprd11.prod.outlook.com (2603:10b6:930:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 18:52:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.033; Thu, 20 Jun 2024
 18:52:58 +0000
Date: Thu, 20 Jun 2024 18:52:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/7] drm/xe: Convert multiple bind ops into single job
Message-ID: <ZnR6YfLkJRFUWAgc@DUT025-TGLU.fm.intel.com>
References: <20240618171509.3336601-1-matthew.brost@intel.com>
 <20240618171509.3336601-5-matthew.brost@intel.com>
 <032aaef0-cc2a-4034-8e5b-7fc17532fb41@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <032aaef0-cc2a-4034-8e5b-7fc17532fb41@intel.com>
X-ClientProxiedBy: SJ0PR05CA0133.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1d41b4-797c-4cde-2408-08dc915a3407
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bjc/+ugKrXMTFx97fAhb6nJW9sHcIvFjrTpKfd0NB7oFOHLT1IXuipz38B?=
 =?iso-8859-1?Q?nxNplYocaKlBuOrM+V/yX0TKVnQbGDovf19OGkDY+7Da3kPGLVmTrbiRuO?=
 =?iso-8859-1?Q?2Jwz7bKHxFL7br/tQYnTtcVyKHLW/BB+pb7OrcjCNkeQBppd9/0l6HDQNm?=
 =?iso-8859-1?Q?nlkHG5WGsXwjRX8s8sdm9MGN3yr/P9mYcd1zaj2ez/aVrxG/x7NxXJBaB9?=
 =?iso-8859-1?Q?CpQ8jzfsl/x+v1z2b2sqEaAf6Al3SUXlmlkeqXKzV1Km9irhVCg6tpVT6V?=
 =?iso-8859-1?Q?Z7dvzwKJ0Td7OSRhsIwY0W46uruJCfN7LizBypJeIfUVWBBd0jFSxv0pkY?=
 =?iso-8859-1?Q?3To3o7KT0icClvJk6u6siJLBteiYVXqbDSfDBsZiaDuLAetq2MJYaQsFt1?=
 =?iso-8859-1?Q?4QnF3WMI/ZviKVZkirJJtNyf+hVCPcl0iIAi6KMTy/QeEtQ9dM3vm6srZ5?=
 =?iso-8859-1?Q?ZdHjPOU2rbLRpf9pgx2M5Nw2ibz0T6hkrw1bIQlUv9lvLdcLRB1SJ4AtEA?=
 =?iso-8859-1?Q?HkYnP9hT7dVlpcyO2XjH93/LKVc5ABCXAzswesG168OCH53sNk5A9JIOBe?=
 =?iso-8859-1?Q?Oi2LRaC1aRZ8PBdrIpMA87NMV/oPu6gW89MB6p5TspkctM1Je72DGMVbXM?=
 =?iso-8859-1?Q?Pwqz9p7uQhm3sD7YcuyLCUD6IkXD1vrjF6vo38btWvwNIBH0DrYjKAIwus?=
 =?iso-8859-1?Q?V6POmb27693fwhMEa3qL5XJwjiH2MISZE6iuTjf3z1ZBXW8m6jriG4OncM?=
 =?iso-8859-1?Q?Qoltv+ngi4I+6FQPngVt8ValDinAAtLUGGb8KJgNcaQnilL8RKr3JShUCn?=
 =?iso-8859-1?Q?gp9ZTnF7WtFIw0UXH5WroVODPYz6eiQDUas46GkQQ3y6IMtLPw3my+fZUe?=
 =?iso-8859-1?Q?/gZqsSkiJHxjbYYhGLpyPnDXWZS1BW9ZKH035keoObCp4GjfuPu6PZArPB?=
 =?iso-8859-1?Q?rrVsvMR6meFxogWtij074cCdHOI6dyDERJiMko8h1YPYUPcOKNH617cj2r?=
 =?iso-8859-1?Q?u7nbbYl15k/ee94UtG0jjwmbH/jeU0m7eerc7wfH2MeMvoP+RXuT+1IuNu?=
 =?iso-8859-1?Q?xApVNcHHviCZEDrNvX9N2I8ysn/b9cTcnWwPzLjNMbtlyEAqq1jq7z5s16?=
 =?iso-8859-1?Q?6BoE/beUAnvuM2u1CGveETiyeT5AIRYeRfkWp9RVwZpZYmDkDsvvvJjLHO?=
 =?iso-8859-1?Q?ZTsQL/VNbAkty9tzrTpVKvwybBMJibEYLE/hf80674phA+iJ4bSXesesrh?=
 =?iso-8859-1?Q?KMH0dW/0KA5uWsni41gPD7hLwsaabTRzyvSl2meMcZbrczVyCqjHL4pTe/?=
 =?iso-8859-1?Q?ng1Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PU0yXo1yYYgWqKtodvN1frZL3ix1ykNFBHrhLUxQWySGln86mBCqraW7Em?=
 =?iso-8859-1?Q?K8/lQSybXlDOBKWlcT04UH2gm2b3VmFTyThSAoiRlFIJ+WNkNe8UyPVAii?=
 =?iso-8859-1?Q?iiBrdTykdGx3ojaxQkKFVBVP6Ho6VbNui5bx1jnXLuadzttVfSJalxK67s?=
 =?iso-8859-1?Q?+8nzv+sFRicwGji23BsUXxn6DpGlVqnUfnYARTZpDUTyJgC4G45bSq6Wp7?=
 =?iso-8859-1?Q?pDMwqHpuVcXoBT6fzAHlwVhCB4S1gzcHvS/KVCVZs6aCHk3jIhY85E8tvW?=
 =?iso-8859-1?Q?UVjgOOMrJAyyeNrJnGMNzka23UL2VFlMvEJd4RsxFlU/SZS2wRblfOnmmr?=
 =?iso-8859-1?Q?Q0lv3QDi63MNjqqBf/Zy1vj9XDcINRWqKmI8OrLsBK6RH5GoVn9gEwEeF8?=
 =?iso-8859-1?Q?rCb7L7fRXJNC1JN0L19+hJsBXKSO5lqxerJ0M6wPE+nU+ObLcbI2HlVREv?=
 =?iso-8859-1?Q?IM6nVW94BkBy4gw/eEhkH7STI3w18pWUcooGlhdNUfsoN8XUhrKwYi4e/N?=
 =?iso-8859-1?Q?9olfiH6R28PPiSAqn4wq95bazry0GSeUlz++ke3IJ/sK9I6dBJa1RgczPY?=
 =?iso-8859-1?Q?rgzJw5Fy+npMx5j+2eahsULLklN5osVAkAhLmHZQcOgyIIsR3l7o6Wwxr3?=
 =?iso-8859-1?Q?/2u/0i37vMBzMTACF95lAoMnI4sD5EgcnSd/Gl9ZoeE4aTO4LakjiSdDgn?=
 =?iso-8859-1?Q?E6s5+KIpx9cYo9I5ci6bMeBLprV5Hldkrnbw3zncwy0HGj5JHhGQ8fbtvv?=
 =?iso-8859-1?Q?eQqsZo5r8XlTdBN6vsO20JoQMuwWQO1flQEHd1J7XC4FoSTyKNDaX2zx0u?=
 =?iso-8859-1?Q?4uZ8irKIZys3Va8FWkkkZp+RydBTyA6eXkyNiUyMEmI4zeC25ok+lzpSqr?=
 =?iso-8859-1?Q?Jq4DGuXH5mh5oXoxT0kEjFyDGtOFQuIqXE7htv+mVrfGd4IHMGAXmmuQIl?=
 =?iso-8859-1?Q?ysToIygvojF6FjoYSfqQZ8NvM6HEwrJ8HRT9vSNrKi7IKkRliwaMbCcdmD?=
 =?iso-8859-1?Q?KrPudUQaDqWCRNWUdIIbRW3WT2xGV7tZmCxSIOPEoj2nmSLSJs/1pX1lkL?=
 =?iso-8859-1?Q?doIJ0K61bdPSsmH0Kjg171sSxWEZu3n++HeQO6hfQDKV5n5lyKO5dZRiDo?=
 =?iso-8859-1?Q?a1jgPiGXMEvwM/s/QtiPbWl9BoprROymNmbNDlVkZoH5g5HonRpBatZwiv?=
 =?iso-8859-1?Q?Vu4ZkKzcaY81g3Pv7RCIKvPFqVTe39v3uf9o9EUjdP12tX0RrdfUd/YTGt?=
 =?iso-8859-1?Q?D/pnnDx9PA8h3ZaxIuiBplDi/YAgtFxqQq+d9ItWZKJnSK6kkOfwyHYbw3?=
 =?iso-8859-1?Q?rKU25ER7XX5xNKgwvKOHKTCZhu4BdTFI1mVz8+ZwiNKZNw/cX9AmB45J2R?=
 =?iso-8859-1?Q?nGIql3xER3OgPa8MEVvlwEwwe78QAq0eJQHRmExbLIR0yJdmlyZmELSp+1?=
 =?iso-8859-1?Q?fNYL5RFdTqHxNin4EnsuBCRnejZEJniQsErqAc5iKvAuTuz5NWiQCj6ycd?=
 =?iso-8859-1?Q?LuszQ+Cpksce697H2mzsjZq2QELzV+murAi0ntHMDdHPT9VnZbYe7CPFYh?=
 =?iso-8859-1?Q?N0QeShNxf/4SuatC8iUpMSg/ma02M3l+vzQQCApRAAQCElV6zgbpvopImo?=
 =?iso-8859-1?Q?qeL6firUheu4fyvNPVNNLeTqBn0kkF6NfgrmlzgACbCPoa/f1V0ltHUg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1d41b4-797c-4cde-2408-08dc915a3407
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 18:52:58.7259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXtrQizZTEpvs4cNA1Wz6X5eeI6of1iZ8OQZ4m7fEKmLESxsgFX0EHb8yCMH7u+D4l0Km9U3pFzJEcjvBwgpxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6844
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

On Thu, Jun 20, 2024 at 06:15:54PM +0100, Matthew Auld wrote:
> Hi,
> 
> On 18/06/2024 18:15, Matthew Brost wrote:
> > This aligns with the uAPI of an array of binds or single bind that
> > results in multiple GPUVA ops to be considered a single atomic
> > operations.
> > 
> > The implemenation is roughly:
> > - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> > - each xe_vma_op resolves to 0-3 PT ops
> > - xe_vma_ops creates a single job
> > - if at any point during binding a failure occurs, xe_vma_ops contains
> >    the information necessary unwind the PT and VMA (GPUVA) state
> > 
> > v2:
> >   - add missing dma-resv slot reservation (CI, testing)
> > v4:
> >   - Fix TLB invalidation (Paulo)
> >   - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo_types.h |    2 +
> >   drivers/gpu/drm/xe/xe_migrate.c  |  296 ++++----
> >   drivers/gpu/drm/xe/xe_migrate.h  |   32 +-
> >   drivers/gpu/drm/xe/xe_pt.c       | 1112 +++++++++++++++++++-----------
> >   drivers/gpu/drm/xe/xe_pt.h       |   14 +-
> >   drivers/gpu/drm/xe/xe_pt_types.h |   36 +
> >   drivers/gpu/drm/xe/xe_vm.c       |  519 +++-----------
> >   drivers/gpu/drm/xe/xe_vm.h       |    2 +
> >   drivers/gpu/drm/xe/xe_vm_types.h |   45 +-
> >   9 files changed, 1035 insertions(+), 1023 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 86422e113d39..02d68873558a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -58,6 +58,8 @@ struct xe_bo {
> >   #endif
> >   	/** @freed: List node for delayed put. */
> >   	struct llist_node freed;
> > +	/** @update_index: Update index if PT BO */
> > +	int update_index;
> >   	/** @created: Whether the bo has passed initial creation */
> >   	bool created;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index af62783d34ac..a1acd7d01243 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1125,6 +1125,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   }
> >   static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > +			  const struct xe_vm_pgtable_update_op *pt_op,
> >   			  const struct xe_vm_pgtable_update *update,
> >   			  struct xe_migrate_pt_update *pt_update)
> >   {
> > @@ -1159,8 +1160,12 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> >   		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> >   		bb->cs[bb->len++] = lower_32_bits(addr);
> >   		bb->cs[bb->len++] = upper_32_bits(addr);
> > -		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
> > -			      update);
> > +		if (pt_op->bind)
> > +			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
> > +				      ofs, chunk, update);
> > +		else
> > +			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
> > +				   ofs, chunk, update);
> >   		bb->len += chunk * 2;
> >   		ofs += chunk;
> > @@ -1185,114 +1190,58 @@ struct migrate_test_params {
> >   static struct dma_fence *
> >   xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
> > -			       struct xe_vm *vm, struct xe_bo *bo,
> > -			       const struct  xe_vm_pgtable_update *updates,
> > -			       u32 num_updates, bool wait_vm,
> >   			       struct xe_migrate_pt_update *pt_update)
> >   {
> >   	XE_TEST_DECLARE(struct migrate_test_params *test =
> >   			to_migrate_test_params
> >   			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
> >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > -	struct dma_fence *fence;
> > +	struct xe_vm *vm = pt_update->vops->vm;
> > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
> >   	int err;
> > -	u32 i;
> > +	u32 j, i;
> 
> ...
> 
> >   	if (XE_TEST_ONLY(test && test->force_gpu))
> >   		return ERR_PTR(-ETIME);
> > -	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
> > -					  DMA_RESV_USAGE_KERNEL))
> > -		return ERR_PTR(-ETIME);
> > -
> > -	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
> > -					       DMA_RESV_USAGE_BOOKKEEP))
> > -		return ERR_PTR(-ETIME);
> > -
> >   	if (ops->pre_commit) {
> >   		pt_update->job = NULL;
> >   		err = ops->pre_commit(pt_update);
> >   		if (err)
> >   			return ERR_PTR(err);
> >   	}
> > -	for (i = 0; i < num_updates; i++) {
> > -		const struct xe_vm_pgtable_update *update = &updates[i];
> > -
> > -		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
> > -			      update->ofs, update->qwords, update);
> > -	}
> > -
> > -	if (vm) {
> > -		trace_xe_vm_cpu_bind(vm);
> > -		xe_device_wmb(vm->xe);
> > -	}
> > -
> > -	fence = dma_fence_get_stub();
> > -
> > -	return fence;
> > -}
> > -
> > -static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
> > -			struct xe_sync_entry *syncs, u32 num_syncs)
> > -{
> > -	struct dma_fence *fence;
> > -	int i;
> > -	for (i = 0; i < num_syncs; i++) {
> > -		fence = syncs[i].fence;
> > -
> > -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				       &fence->flags))
> > -			return false;
> > -	}
> > -	if (q) {
> > -		fence = xe_exec_queue_last_fence_get(q, vm);
> > -		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > -			dma_fence_put(fence);
> > -			return false;
> > +	for (j = 0; j < pt_update_ops->num_ops; ++j) {
> > +		const struct xe_vm_pgtable_update_op *pt_op =
> > +			&pt_update_ops->ops[j];
> > +
> > +		for (i = 0; i < pt_op->num_entries; i++) {
> 
> ...inverting i and j here?
> 

Let me switch that.

> > +			const struct xe_vm_pgtable_update *update =
> > +				&pt_op->entries[i];
> > +
> > +			if (pt_op->bind)
> > +				ops->populate(pt_update, m->tile,
> > +					      &update->pt_bo->vmap, NULL,
> > +					      update->ofs, update->qwords,
> > +					      update);
> > +			else
> > +				ops->clear(pt_update, m->tile,
> > +					   &update->pt_bo->vmap, NULL,
> > +					   update->ofs, update->qwords, update);
> >   		}
> > -		dma_fence_put(fence);
> >   	}
> > -	return true;
> > +	trace_xe_vm_cpu_bind(vm);
> > +	xe_device_wmb(vm->xe);
> > +
> > +	return dma_fence_get_stub();
> >   }
> > -/**
> > - * xe_migrate_update_pgtables() - Pipelined page-table update
> > - * @m: The migrate context.
> > - * @vm: The vm we'll be updating.
> > - * @bo: The bo whose dma-resv we will await before updating, or NULL if userptr.
> > - * @q: The exec queue to be used for the update or NULL if the default
> > - * migration engine is to be used.
> > - * @updates: An array of update descriptors.
> > - * @num_updates: Number of descriptors in @updates.
> > - * @syncs: Array of xe_sync_entry to await before updating. Note that waits
> > - * will block the engine timeline.
> > - * @num_syncs: Number of entries in @syncs.
> > - * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
> > - * pointers to callback functions and, if subclassed, private arguments to
> > - * those.
> > - *
> > - * Perform a pipelined page-table update. The update descriptors are typically
> > - * built under the same lock critical section as a call to this function. If
> > - * using the default engine for the updates, they will be performed in the
> > - * order they grab the job_mutex. If different engines are used, external
> > - * synchronization is needed for overlapping updates to maintain page-table
> > - * consistency. Note that the meaing of "overlapping" is that the updates
> > - * touch the same page-table, which might be a higher-level page-directory.
> > - * If no pipelining is needed, then updates may be performed by the cpu.
> > - *
> > - * Return: A dma_fence that, when signaled, indicates the update completion.
> > - */
> > -struct dma_fence *
> > -xe_migrate_update_pgtables(struct xe_migrate *m,
> > -			   struct xe_vm *vm,
> > -			   struct xe_bo *bo,
> > -			   struct xe_exec_queue *q,
> > -			   const struct xe_vm_pgtable_update *updates,
> > -			   u32 num_updates,
> > -			   struct xe_sync_entry *syncs, u32 num_syncs,
> > -			   struct xe_migrate_pt_update *pt_update)
> > +static struct dma_fence *
> > +__xe_migrate_update_pgtables(struct xe_migrate *m,
> > +			     struct xe_migrate_pt_update *pt_update,
> > +			     struct xe_vm_pgtable_update_ops *pt_update_ops)
> >   {
> >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> >   	struct xe_tile *tile = m->tile;
> > @@ -1301,59 +1250,45 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   	struct xe_sched_job *job;
> >   	struct dma_fence *fence;
> >   	struct drm_suballoc *sa_bo = NULL;
> > -	struct xe_vma *vma = pt_update->vma;
> >   	struct xe_bb *bb;
> > -	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
> > +	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
> > +	u32 num_updates = 0, current_update = 0;
> >   	u64 addr;
> >   	int err = 0;
> > -	bool usm = !q && xe->info.has_usm;
> > -	bool first_munmap_rebind = vma &&
> > -		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
> > -	struct xe_exec_queue *q_override = !q ? m->q : q;
> > -	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > +	bool is_migrate = pt_update_ops->q == m->q;
> > +	bool usm = is_migrate && xe->info.has_usm;
> > -	/* Use the CPU if no in syncs and engine is idle */
> > -	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> > -		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
> > -							num_updates,
> > -							first_munmap_rebind,
> > -							pt_update);
> > -		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
> > -			return fence;
> > +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > +		struct xe_vm_pgtable_update *updates = pt_op->entries;
> > +
> > +		num_updates += pt_op->num_entries;
> > +		for (j = 0; j < pt_op->num_entries; ++j) {
> > +			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords, 0x1ff);
> > +
> > +			/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > +			batch_size += 4 * num_cmds + updates[j].qwords * 2;
> > +		}
> >   	}
> >   	/* fixed + PTE entries */
> >   	if (IS_DGFX(xe))
> > -		batch_size = 2;
> > +		batch_size += 2;
> >   	else
> > -		batch_size = 6 + num_updates * 2;
> > +		batch_size += 6 + num_updates * 2;
> > -	for (i = 0; i < num_updates; i++) {
> > -		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
> > -
> > -		/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > -		batch_size += 4 * num_cmds + updates[i].qwords * 2;
> > -	}
> > -
> > -	/*
> > -	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
> > -	 *
> > -	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
> > -	 * Should be reasonably bound..
> > -	 */
> > -	xe_tile_assert(tile, batch_size < SZ_128K);
> 
> Why do we drop this assert? I guess the batch size is potentially now much
> larger, since we combine more stuff into single job? The pool is fixed size
> and only 512K on igpu. Can userspace not hit the limit of that? It looks
> like this would also trigger a warning in drm_suballoc_new():
> 
> 	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> 		return ERR_PTR(-EINVAL);
> 
> Do we need some more checking somewhere? Also maybe bump the pool size?
> 

Yes, this is an issue which VK has hit in debug [1]. I think dropping
the assert is correct as a user shouldn't be able to make an assert pop.
We likely need to catch drm_suballoc_new error and convert it to an
error code which user space interrupts as split the array of binds into
a series bind IOCTLs with a single bind per IOCTL. Thomas and I had
discussed the VM bind error codes a while back and one of returned error
codes has this meaning. The error code lot work still needs to be done
and was going to be staged as a follow up to this series. I will at
least include the correct error code for this in the next rev of the
series. 

Longterm this should be a non-issue as we should switch to CPU bind
even if a job is used to complete the bind [2]. CPU binds have the
benefit of lower latency vs scheduling a GPU job, fixing this potential
issuei without involving user space, and GPU bind jobs not getting
scheduled behind other GPU jobs on the copy engine.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/799
[2] https://patchwork.freedesktop.org/patch/582003/?series=125608&rev=5

> > -
> > -	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
> > +	bb = xe_bb_new(gt, batch_size, usm);
> >   	if (IS_ERR(bb))
> >   		return ERR_CAST(bb);
> >   	/* For sysmem PTE's, need to map them in our hole.. */
> >   	if (!IS_DGFX(xe)) {
> >   		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> > -		if (q) {
> > -			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
> > +		if (!is_migrate) {
> > +			u32 num_units = DIV_ROUND_UP(num_updates,
> > +						     NUM_VMUSA_WRITES_PER_UNIT);
> > -			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
> > +			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
> >   						 GFP_KERNEL, true, 0);
> >   			if (IS_ERR(sa_bo)) {
> >   				err = PTR_ERR(sa_bo);
> > @@ -1373,14 +1308,26 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> >   		bb->cs[bb->len++] = 0; /* upper_32_bits */
> > -		for (i = 0; i < num_updates; i++) {
> > -			struct xe_bo *pt_bo = updates[i].pt_bo;
> > +		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +			struct xe_vm_pgtable_update_op *pt_op =
> > +				&pt_update_ops->ops[i];
> > +			struct xe_vm_pgtable_update *updates = pt_op->entries;
> > -			xe_tile_assert(tile, pt_bo->size == SZ_4K);
> > +			for (j = 0; j < pt_op->num_entries; ++j, ++current_update) {
> > +				struct xe_vm *vm = pt_update->vops->vm;
> > +				struct xe_bo *pt_bo = updates[j].pt_bo;
> > -			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
> > -			bb->cs[bb->len++] = lower_32_bits(addr);
> > -			bb->cs[bb->len++] = upper_32_bits(addr);
> > +				xe_tile_assert(tile, pt_bo->size == SZ_4K);
> > +
> > +				/* Map a PT at most once */
> > +				if (pt_bo->update_index < 0)
> > +					pt_bo->update_index = current_update;
> > +
> > +				addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
> > +								 XE_CACHE_WB, 0);
> > +				bb->cs[bb->len++] = lower_32_bits(addr);
> > +				bb->cs[bb->len++] = upper_32_bits(addr);
> > +			}
> >   		}
> >   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > @@ -1388,19 +1335,36 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
> >   			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> > -		for (i = 0; i < num_updates; i++)
> > -			write_pgtable(tile, bb, addr + i * XE_PAGE_SIZE,
> > -				      &updates[i], pt_update);
> > +		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +			struct xe_vm_pgtable_update_op *pt_op =
> > +				&pt_update_ops->ops[i];
> > +			struct xe_vm_pgtable_update *updates = pt_op->entries;
> > +
> > +			for (j = 0; j < pt_op->num_entries; ++j) {
> > +				struct xe_bo *pt_bo = updates[j].pt_bo;
> > +
> > +				write_pgtable(tile, bb, addr +
> > +					      pt_bo->update_index * XE_PAGE_SIZE,
> > +					      pt_op, &updates[j], pt_update);
> > +			}
> > +		}
> >   	} else {
> >   		/* phys pages, no preamble required */
> >   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> >   		update_idx = bb->len;
> > -		for (i = 0; i < num_updates; i++)
> > -			write_pgtable(tile, bb, 0, &updates[i], pt_update);
> > +		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +			struct xe_vm_pgtable_update_op *pt_op =
> > +				&pt_update_ops->ops[i];
> > +			struct xe_vm_pgtable_update *updates = pt_op->entries;
> > +
> > +			for (j = 0; j < pt_op->num_entries; ++j)
> > +				write_pgtable(tile, bb, 0, pt_op, &updates[j],
> > +					      pt_update);
> > +		}
> >   	}
> > -	job = xe_bb_create_migration_job(q ?: m->q, bb,
> > +	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
> >   					 xe_migrate_batch_base(m, usm),
> >   					 update_idx);
> >   	if (IS_ERR(job)) {
> > @@ -1408,46 +1372,20 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   		goto err_bb;
> >   	}
> > -	/* Wait on BO move */
> > -	if (bo) {
> > -		err = xe_sched_job_add_deps(job, bo->ttm.base.resv,
> > -					    DMA_RESV_USAGE_KERNEL);
> > -		if (err)
> > -			goto err_job;
> > -	}
> > -
> > -	/*
> > -	 * Munmap style VM unbind, need to wait for all jobs to be complete /
> > -	 * trigger preempts before moving forward
> > -	 */
> > -	if (first_munmap_rebind) {
> > -		err = xe_sched_job_add_deps(job, xe_vm_resv(vm),
> > -					    DMA_RESV_USAGE_BOOKKEEP);
> > -		if (err)
> > -			goto err_job;
> > -	}
> > -
> > -	err = xe_sched_job_last_fence_add_dep(job, vm);
> > -	for (i = 0; !err && i < num_syncs; i++)
> > -		err = xe_sync_entry_add_deps(&syncs[i], job);
> > -
> > -	if (err)
> > -		goto err_job;
> > -
> >   	if (ops->pre_commit) {
> >   		pt_update->job = job;
> >   		err = ops->pre_commit(pt_update);
> >   		if (err)
> >   			goto err_job;
> >   	}
> > -	if (!q)
> > +	if (is_migrate)
> >   		mutex_lock(&m->job_mutex);
> >   	xe_sched_job_arm(job);
> >   	fence = dma_fence_get(&job->drm.s_fence->finished);
> >   	xe_sched_job_push(job);
> > -	if (!q)
> > +	if (is_migrate)
> >   		mutex_unlock(&m->job_mutex);
> >   	xe_bb_free(bb, fence);
> > @@ -1464,6 +1402,38 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   	return ERR_PTR(err);
> >   }
> > +/**
> > + * xe_migrate_update_pgtables() - Pipelined page-table update
> > + * @m: The migrate context.
> > + * @pt_update: PT update arguments
> > + *
> > + * Perform a pipelined page-table update. The update descriptors are typically
> > + * built under the same lock critical section as a call to this function. If
> > + * using the default engine for the updates, they will be performed in the
> > + * order they grab the job_mutex. If different engines are used, external
> > + * synchronization is needed for overlapping updates to maintain page-table
> > + * consistency. Note that the meaing of "overlapping" is that the updates
> > + * touch the same page-table, which might be a higher-level page-directory.
> > + * If no pipelining is needed, then updates may be performed by the cpu.
> > + *
> > + * Return: A dma_fence that, when signaled, indicates the update completion.
> > + */
> > +struct dma_fence *
> > +xe_migrate_update_pgtables(struct xe_migrate *m,
> > +			   struct xe_migrate_pt_update *pt_update)
> > +
> > +{
> > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
> > +	struct dma_fence *fence;
> > +
> > +	fence =  xe_migrate_update_pgtables_cpu(m, pt_update);
> > +	if (!IS_ERR(fence))
> > +		return fence;
> 
> Previously there was an EAGAIN check here to bail. It's fine to drop this?
> 

Techincally no as __xe_migrate_update_pgtables will just return -EAGAIN
anyways. -EAGAIN is returned in rare case if a userptr has been
invalidaed on a faulting VM. For optimial coding, we should check this.
I will add this back in.

> > +
> > +	return __xe_migrate_update_pgtables(m, pt_update, pt_update_ops);
> > +}
> > +
> >   /**
> >    * xe_migrate_wait() - Complete all operations using the xe_migrate context
> >    * @m: Migrate context to wait for.
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index a5bcaafe4a99..453e0ecf5034 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -47,6 +47,24 @@ struct xe_migrate_pt_update_ops {
> >   			 struct xe_tile *tile, struct iosys_map *map,
> >   			 void *pos, u32 ofs, u32 num_qwords,
> >   			 const struct xe_vm_pgtable_update *update);
> > +	/**
> > +	 * @clear: Clear a command buffer or page-table with ptes.
> > +	 * @pt_update: Embeddable callback argument.
> > +	 * @tile: The tile for the current operation.
> > +	 * @map: struct iosys_map into the memory to be populated.
> > +	 * @pos: If @map is NULL, map into the memory to be populated.
> > +	 * @ofs: qword offset into @map, unused if @map is NULL.
> > +	 * @num_qwords: Number of qwords to write.
> > +	 * @update: Information about the PTEs to be inserted.
> > +	 *
> > +	 * This interface is intended to be used as a callback into the
> > +	 * page-table system to populate command buffers or shared
> > +	 * page-tables with PTEs.
> > +	 */
> > +	void (*clear)(struct xe_migrate_pt_update *pt_update,
> > +		      struct xe_tile *tile, struct iosys_map *map,
> > +		      void *pos, u32 ofs, u32 num_qwords,
> > +		      const struct xe_vm_pgtable_update *update);
> >   	/**
> >   	 * @pre_commit: Callback to be called just before arming the
> > @@ -67,14 +85,10 @@ struct xe_migrate_pt_update_ops {
> >   struct xe_migrate_pt_update {
> >   	/** @ops: Pointer to the struct xe_migrate_pt_update_ops callbacks */
> >   	const struct xe_migrate_pt_update_ops *ops;
> > -	/** @vma: The vma we're updating the pagetable for. */
> > -	struct xe_vma *vma;
> > +	/** @vops: VMA operations */
> > +	struct xe_vma_ops *vops;
> >   	/** @job: The job if a GPU page-table update. NULL otherwise */
> >   	struct xe_sched_job *job;
> > -	/** @start: Start of update for the range fence */
> > -	u64 start;
> > -	/** @last: Last of update for the range fence */
> > -	u64 last;
> >   	/** @tile_id: Tile ID of the update */
> >   	u8 tile_id;
> >   };
> > @@ -96,12 +110,6 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
> >   struct dma_fence *
> >   xe_migrate_update_pgtables(struct xe_migrate *m,
> > -			   struct xe_vm *vm,
> > -			   struct xe_bo *bo,
> > -			   struct xe_exec_queue *q,
> > -			   const struct xe_vm_pgtable_update *updates,
> > -			   u32 num_updates,
> > -			   struct xe_sync_entry *syncs, u32 num_syncs,
> >   			   struct xe_migrate_pt_update *pt_update);
> >   void xe_migrate_wait(struct xe_migrate *m);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index ade9e7a3a0ad..d6ce531f0fcd 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -9,12 +9,15 @@
> >   #include "xe_bo.h"
> >   #include "xe_device.h"
> >   #include "xe_drm_client.h"
> > +#include "xe_exec_queue.h"
> >   #include "xe_gt.h"
> >   #include "xe_gt_tlb_invalidation.h"
> >   #include "xe_migrate.h"
> >   #include "xe_pt_types.h"
> >   #include "xe_pt_walk.h"
> >   #include "xe_res_cursor.h"
> > +#include "xe_sched_job.h"
> > +#include "xe_sync.h"
> >   #include "xe_trace.h"
> >   #include "xe_ttm_stolen_mgr.h"
> >   #include "xe_vm.h"
> > @@ -325,6 +328,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
> >   	entry->pt = parent;
> >   	entry->flags = 0;
> >   	entry->qwords = 0;
> > +	entry->pt_bo->update_index = -1;
> >   	if (alloc_entries) {
> >   		entry->pt_entries = kmalloc_array(XE_PDES,
> > @@ -864,9 +868,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
> >   	lockdep_assert_held(&vm->lock);
> > -	if (xe_vma_is_userptr(vma))
> > -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> > -	else if (!xe_vma_is_null(vma))
> > +	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
> >   		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
> >   	xe_vm_assert_held(vm);
> > @@ -888,10 +890,8 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
> >   		if (!rebind)
> >   			pt->num_live += entries[i].qwords;
> > -		if (!pt->level) {
> > -			kfree(entries[i].pt_entries);
> > +		if (!pt->level)
> >   			continue;
> > -		}
> >   		pt_dir = as_xe_pt_dir(pt);
> >   		for (j = 0; j < entries[i].qwords; j++) {
> > @@ -904,10 +904,18 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
> >   			pt_dir->children[j_] = &newpte->base;
> >   		}
> > -		kfree(entries[i].pt_entries);
> >   	}
> >   }
> > +static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
> > +			    u32 num_entries)
> > +{
> > +	u32 i;
> > +
> > +	for (i = 0; i < num_entries; i++)
> > +		kfree(entries[i].pt_entries);
> > +}
> > +
> >   static int
> >   xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> >   		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> > @@ -926,12 +934,13 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> >   static void xe_vm_dbg_print_entries(struct xe_device *xe,
> >   				    const struct xe_vm_pgtable_update *entries,
> > -				    unsigned int num_entries)
> > +				    unsigned int num_entries, bool bind)
> >   #if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
> >   {
> >   	unsigned int i;
> > -	vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
> > +	vm_dbg(&xe->drm, "%s: %u entries to update\n", bind ? "bind" : "unbind",
> > +	       num_entries);
> >   	for (i = 0; i < num_entries; i++) {
> >   		const struct xe_vm_pgtable_update *entry = &entries[i];
> >   		struct xe_pt *xe_pt = entry->pt;
> > @@ -952,66 +961,116 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
> >   {}
> >   #endif
> > -#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> > -
> > -static int xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
> > +static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
> >   {
> > -	u32 divisor = uvma->userptr.divisor ? uvma->userptr.divisor : 2;
> > -	static u32 count;
> > +	int i;
> > -	if (count++ % divisor == divisor - 1) {
> > -		struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > +	for (i = 0; i < num_syncs; i++) {
> > +		struct dma_fence *fence = syncs[i].fence;
> > -		uvma->userptr.divisor = divisor << 1;
> > -		spin_lock(&vm->userptr.invalidated_lock);
> > -		list_move_tail(&uvma->userptr.invalidate_link,
> > -			       &vm->userptr.invalidated);
> > -		spin_unlock(&vm->userptr.invalidated_lock);
> > -		return true;
> > +		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > +				       &fence->flags))
> > +			return false;
> >   	}
> > -	return false;
> > +	return true;
> >   }
> > -#else
> > -
> > -static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
> > +static int vma_add_deps(struct xe_vma *vma, struct xe_sched_job *job)
> >   {
> > -	return false;
> > +	struct xe_bo *bo = xe_vma_bo(vma);
> > +
> > +	xe_bo_assert_held(bo);
> > +
> > +	if (bo && !bo->vm) {
> > +		if (!job) {
> > +			if (!dma_resv_test_signaled(bo->ttm.base.resv,
> > +						    DMA_RESV_USAGE_KERNEL))
> > +				return -ETIME;
> > +		} else {
> > +			return xe_sched_job_add_deps(job, bo->ttm.base.resv,
> > +						     DMA_RESV_USAGE_KERNEL);
> > +		}
> > +	}
> > +
> > +	return 0;
> >   }
> > -#endif
> > +static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
> > +		       struct xe_sched_job *job)
> > +{
> > +	int err = 0;
> > -/**
> > - * struct xe_pt_migrate_pt_update - Callback argument for pre-commit callbacks
> > - * @base: Base we derive from.
> > - * @bind: Whether this is a bind or an unbind operation. A bind operation
> > - *        makes the pre-commit callback error with -EAGAIN if it detects a
> > - *        pending invalidation.
> > - * @locked: Whether the pre-commit callback locked the userptr notifier lock
> > - *          and it needs unlocking.
> > - */
> > -struct xe_pt_migrate_pt_update {
> > -	struct xe_migrate_pt_update base;
> > -	bool bind;
> > -	bool locked;
> > -};
> > +	switch (op->base.op) {
> > +	case DRM_GPUVA_OP_MAP:
> > +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> > +			break;
> > +
> > +		err = vma_add_deps(op->map.vma, job);
> > +		break;
> > +	case DRM_GPUVA_OP_REMAP:
> > +		if (op->remap.prev)
> > +			err = vma_add_deps(op->remap.prev, job);
> > +		if (!err && op->remap.next)
> > +			err = vma_add_deps(op->remap.next, job);
> > +		break;
> > +	case DRM_GPUVA_OP_UNMAP:
> > +		break;
> > +	case DRM_GPUVA_OP_PREFETCH:
> > +		err = vma_add_deps(gpuva_to_vma(op->base.prefetch.va), job);
> > +		break;
> > +	default:
> > +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > +	}
> > +
> > +	return err;
> > +}
> > -/*
> > - * This function adds the needed dependencies to a page-table update job
> > - * to make sure racing jobs for separate bind engines don't race writing
> > - * to the same page-table range, wreaking havoc. Initially use a single
> > - * fence for the entire VM. An optimization would use smaller granularity.
> > - */
> >   static int xe_pt_vm_dependencies(struct xe_sched_job *job,
> > -				 struct xe_range_fence_tree *rftree,
> > -				 u64 start, u64 last)
> > +				 struct xe_vm *vm,
> > +				 struct xe_vma_ops *vops,
> > +				 struct xe_vm_pgtable_update_ops *pt_update_ops,
> > +				 struct xe_range_fence_tree *rftree)
> >   {
> >   	struct xe_range_fence *rtfence;
> >   	struct dma_fence *fence;
> > -	int err;
> > +	struct xe_vma_op *op;
> > +	int err = 0, i;
> > -	rtfence = xe_range_fence_tree_first(rftree, start, last);
> > +	xe_vm_assert_held(vm);
> > +
> > +	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
> > +		return -ETIME;
> > +
> > +	if (!job && !xe_exec_queue_is_idle(pt_update_ops->q))
> > +		return -ETIME;
> > +
> > +	if (pt_update_ops->wait_vm_bookkeep) {
> > +		if (!job) {
> > +			if (!dma_resv_test_signaled(xe_vm_resv(vm),
> > +						    DMA_RESV_USAGE_BOOKKEEP))
> > +				return -ETIME;
> > +		} else {
> > +			err = xe_sched_job_add_deps(job, xe_vm_resv(vm),
> > +						    DMA_RESV_USAGE_BOOKKEEP);
> > +			if (err)
> > +				return err;
> > +		}
> > +	} else if (pt_update_ops->wait_vm_kernel) {
> > +		if (!job) {
> > +			if (!dma_resv_test_signaled(xe_vm_resv(vm),
> > +						    DMA_RESV_USAGE_KERNEL))
> > +				return -ETIME;
> > +		} else {
> > +			err = xe_sched_job_add_deps(job, xe_vm_resv(vm),
> > +						    DMA_RESV_USAGE_KERNEL);
> > +			if (err)
> > +				return err;
> > +		}
> > +	}
> 
> Could maybe reduce some duplication here? Maybe wait_vm + wait_vm_usage.
> 

I should be able to add a helper with either DMA_RESV_USAGE_BOOKKEEP or
DMA_RESV_USAGE_KERNEL passed in. Will add.

Matt

> <snip>
