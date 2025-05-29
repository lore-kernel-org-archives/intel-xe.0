Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28194C5B549
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 05:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A697C10E23D;
	Thu, 29 May 2025 05:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6xIDTzM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D5D10E23D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 05:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748496484; x=1780032484;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nVNqUgLGeyI6POzYaeyzsWko1gxsdDeYbah7Dsv/bcM=;
 b=P6xIDTzMiN8FJT1nKqgJ+mmiVMymYcYCXNFSIUTj9haSeegeZxChHVIg
 nAZYeQiUHMs2o6JpyaPA3dWcklYGjQG+0ZnWI00ZcbyIVMtoI3qDQdeDD
 rpC3exjmdQiqpFVcazC324qFgEmJR0wpSWYerFdVxNYiPsIXVeGPMu+dZ
 tA/uGhaJM5wkIMg6tfzdk4eZdYHQpD4LjMTuCBFpN2oqChLDgs8+4sTdL
 MHeH/QDKS8hz6V1JW0pa2JyN+SuacZq1zTlUDzRI3xPl8ccZy47bRqhT9
 FP3EbazrsqTdirUb9Gr1x0vwj4ltANh6sR0Z05MV1lz4U+o/U5ZSAbYM8 Q==;
X-CSE-ConnectionGUID: xwGATU7vR52UJkXuilN/8w==
X-CSE-MsgGUID: fwo23L59TkG//qPrBSmjOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53170418"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="53170418"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:28:04 -0700
X-CSE-ConnectionGUID: f4qwDwkbTVOUcC7p1wfJnw==
X-CSE-MsgGUID: vFbvFPyLRzmtbXnAUhuLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="143353447"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:28:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 22:28:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 22:28:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.84) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 22:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfLP+0VUtRyA+D0mrtGQRfudV6cdgFze119fhoy0QHVGJg8yNlOhSZjAvWSoLslVMwDBIboNfBIpg6d6GvVv24NspKHciLF4ZsT0cPFaYC7XEB9kgQLtf8ivI313W2x9djcl2w/2lLuuUwLG9tp4PIELE8L1N7FwYQG1+wSpFUFk3iDImOyM6NGcZRAWTdCFh92d0CwTxxfO3VNuq8do7fNsByhqAZWcAU3iTGbnV1yoF7vNhSwlrrVb8+GUsU/82bFu2uwoLrMaFfWidXhxJ1JSACnqroPYx2gYooI7yipIzz92L5JMzG5cfXWr91SI0UtEyNsz+W6LmTfBAyQ0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnzPgEPaJ3M7cVnUMdEUZY6ox1Uuo7oCyEiUoHoHhaE=;
 b=A2KITvEgDTyJAAML0k6Q4txyr+3kE6Q7v3pJxW/4dI0QeVT6+LKd+TjF4TyKzs2i36Gbp2AemVkSfqMUEAgeM+ERq1rlNbfxNmEjnX0v53Zj6C7lm7+B2Y3z/G88xF/PyGSsG0pMmiXlilM7egJ6GgYv/XFgmCV3cEYi6/h69Fnxf0j+Ia/7BG0NM3zSOu9GJc+RrWaMLfA4MCH+pB5xLceir/OHLqmJMUNd2FwuoGs6AtOg+BC4xLM66329gbt39Q/8+qQ+FxZPr1zvgJutT+yltggfwkLmrgG0s5XiUfskrj79aecK0adTjgoZJwmJFJq5+speCVrKVEEZvDJjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 05:27:58 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%6]) with mapi id 15.20.8722.027; Thu, 29 May 2025
 05:27:58 +0000
Date: Wed, 28 May 2025 22:25:15 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <maarten@lankhorst.se>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Create LRC BO without VM
Message-ID: <aDfvu99Y17J1Xa8L@nvishwa1-desk1>
References: <20250529040448.2425873-2-niranjana.vishwanathapura@intel.com>
 <aDfgDYLLBipJgA6f@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aDfgDYLLBipJgA6f@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS7PR11MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 20815836-813f-4822-777d-08dd9e71929a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mnx/OaluNHUZKeZOcJdkIiLs+IlEbz0v+Wgi4lK+BjEkdYortQpAFI+ku2C1?=
 =?us-ascii?Q?KeT1znAMMgrC/JHL5DD4Xe8tjImkkrYDHU6FB+laVkvM6sYB0iAZYqzAt1ht?=
 =?us-ascii?Q?QyJ3gOLaXeKcXdgP/LLDRFzKiAC/PdQR5tvGUnLPTLJl3c6oFoZ2htg6+t5m?=
 =?us-ascii?Q?2R7+SYsjxrEkUfavAuSn/8bQh+4wY1spanGjnMoQ/m3Dx0j2RdokD40eOlN7?=
 =?us-ascii?Q?kGIYL2uW6ldLjrWbUcjl5sLJGF9dbhuYOJ+aD0AMSTQG7EFwdSi+Lu2RTyU+?=
 =?us-ascii?Q?WK3rK6vmT/xwgC8QNbqlkKG7c9LQ6vwo1uxJ5m71EC9IAB7XZk5zcwh8Adpz?=
 =?us-ascii?Q?eUdemSoKHBGT8d6+HO950dVBvbOfFAwEME9sij6w3CmqNgpzNt8mtut0IBkR?=
 =?us-ascii?Q?1uQHN+qoWLyrRPwfWZg45pbQLfQ3CQ+5TM7cmzc8y6Fx5aICLEE4xYRfuzPl?=
 =?us-ascii?Q?tWv0Dcvbnf/1tUtr9i+61MuUc/B92KeEADNdFQ3YWSh/CqHev9RA556pq9Qb?=
 =?us-ascii?Q?PH98qu6spTIMw7NmMHLZXoJxxBVQJ/gSwuunpku8KEDeB1eHanVYNgG5jmeI?=
 =?us-ascii?Q?zX57o4pbQZFHNpUt9FWF21KTvr571r8QxJks7JdHElE7uq5NiU0PwqmeRVgT?=
 =?us-ascii?Q?pYNSIL9gNM/ZMhWxunRGecyzBfYJivsUGTmCeCAy3NaweCgv5FPcztAllvzn?=
 =?us-ascii?Q?NyJlOzA50evNMYkamgdbSAb6I9uUhdripflh6gU4cAkiiyXiU89+6y9txLHG?=
 =?us-ascii?Q?IlCJNpYkKKtLy06f0CBJWHy0dI/Nc7CwX/TW/A2SiSdLQPuLmf16zTy00nae?=
 =?us-ascii?Q?qIZr9IlVbeAlxBiaDy4nj2zy99V1JPzK2FWOkFW0LucUSqw6Un3C9fBdtnOA?=
 =?us-ascii?Q?fA392N2xmbL3fG413xVmKgDDOMwwxibMDb1vBo7fxA0HLFybCpk2kuUFB9W0?=
 =?us-ascii?Q?is47TzQfs1TxUbbiM37Tro6w4FY3qmKkkAHTGp2ycqSPVTx9t+Xyv1D4y8aD?=
 =?us-ascii?Q?C+pnbh+jhmTafzjRRj+UElw4W7F3rRjpvcT1kZh5SNi0a6LLL7oTw+FsgPH6?=
 =?us-ascii?Q?HI/1d7jv/gEHsT11SwMaMXZm9uPtE34AvBXYH2pQFSXIzykJllZVsGQXW2kK?=
 =?us-ascii?Q?AcPy7sSh9KaiSeMfZr/OfSWPk3am/NbkUiFK4hHTdZ4/+rf5ztuVRMNeHCqv?=
 =?us-ascii?Q?+UNGGWeDroG2FjwPRVqABMT3PESDv0qyQVLLPA6DK7Cwv59EWIq+N7vL9tNA?=
 =?us-ascii?Q?/sSRHsWJvcOiaNtbP13n+zAnwPba01Szb/UnnB4ytT2NJFASQ0dY4KhQyDKk?=
 =?us-ascii?Q?x236s5h1qxsfdkJiU5gzLP7fdEd/F83EtFSqZ3iTkNQaW7WRAIDSikQJjiO4?=
 =?us-ascii?Q?nXrgf7x0vB0ijB6MCwnundKGmjJzQVSrdTxcBmni0YZll/XxRDTtQfIGnmL+?=
 =?us-ascii?Q?ybQEIcY1CDE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OTVK5k62qHcyzZGrmCgIZdeq/tW3VctJs0G1tUxPGD6w9ELvlW45L5KaOH++?=
 =?us-ascii?Q?1JTMPIeDgZamcpZgpSyaRlK06K3BWc0hzZ3cQeA3e82vvOyZ1sxtMGPJbUAz?=
 =?us-ascii?Q?x9qfojtyWYJmZR3mTo9YnhpLg4OAuT7HtsevaGq9CXd0KARD2nyptxqGLmu+?=
 =?us-ascii?Q?BzEf00MuaAdn8d47RgMqRsQZvuVf6CFB2RnAU9aJyHhrK3AxsmB1OaykH/tg?=
 =?us-ascii?Q?CNZiR1nHQdBxBdBf7mtPPEZr5XrNB63MpBVG4Jdh4ZlfLXN78gmQww1TU+nG?=
 =?us-ascii?Q?Ns8gzBCVbFwfF2TEbC/Zta2xwsAMiTAn3AFbdPjVQliVSfPA13Pf8G3MUXJB?=
 =?us-ascii?Q?jW2rv3OCGKkOJyhdEp9Ym+/fLrGjriqBZmVLoMatdeR8OhnEffnjJ4KO6H6X?=
 =?us-ascii?Q?kB3Q5CNgfo9c7iouqOxKXyiiHYvxOz+M06MTK/1cWMFKS2OPNxbWZTiGwUAU?=
 =?us-ascii?Q?A19Ba9eLMCn67t/ZxMgufWggwsU0MoCoMUGbLiL/ba6O8ajb7AVxwdX9Xhx4?=
 =?us-ascii?Q?O0QBfqGkgcXuNTsaaENBw509tBOLGGJRdgdurkUySPc5W1AYG6iVB77uBgFy?=
 =?us-ascii?Q?1TbH5xXLUX48MI2aRWkyOrwSs0CU/7SjV50F82F0qRVfPKJz18LL+xtfDzM8?=
 =?us-ascii?Q?ACF7NXpKuG2zNmGawS21pc1+Y1K5zzbi+Ke0zLsSK4w4UudU5h2QbJ+T4bfi?=
 =?us-ascii?Q?Cvj5M4SgVoiqgNeHMnk0KIMwUuFgAEsXj8yAzfW6z7ktE94OMj6Fv21ZTXpK?=
 =?us-ascii?Q?MokGknmQ5e1dI5PXhMg9DnoBFIUSVFLypD0aHOVT0/+OaBiyHHyofW23owDm?=
 =?us-ascii?Q?F4QTFKu2FVV4MogK6F+N+dmQf7gaXTOzYLy62herqa1cdJr8V6QrFxvFiWPY?=
 =?us-ascii?Q?5kVsgC+dxZseuUd5+RRW4XttnGdY/dIaPAaSsK3Fx1Y6MuAiyOHnBtYg9hGJ?=
 =?us-ascii?Q?dV/Cy2XUbgmm4VloTjI9w5XwLeQIUe8wqUzzLS9OWQq0jOLlYgJWZJUvZHxy?=
 =?us-ascii?Q?HT0BExNL2KLimmNcDkE0km8uuX+kbsEnJt4egbxUgCs5rHxHpMrAkruXo1Rs?=
 =?us-ascii?Q?Gw7/YUDJtanqxew6xl4tVjAUOoINsKAx5Gl3iOJdh9DyvYZuGzG3QDCdWNBN?=
 =?us-ascii?Q?Ttp1EDHLzBfSJKXemiiyB34zaniu54NoTNKvatUis1at1GQnll4gz6hE1wBW?=
 =?us-ascii?Q?Kd44gjvkCvFJNukK2hgZ303hzgqg2nei5PWwMHzoepqF4YnQhLelDngcOhG4?=
 =?us-ascii?Q?aHkyKMwf1jEmf/aTkNSQixLqZwkxPc7+9qKGrU5/5PSn3PnL/C5PvsQ5d016?=
 =?us-ascii?Q?PtVoBigo3VuURX23pJR5XKSvO4lsgMe8ULeSOb4/CybLm/AeHUQsx99JZ/+e?=
 =?us-ascii?Q?qYwTgh+wlNJzb4aQFnuawhu5G8/RlqYO7iMByCHmbjqK0L7mE93q806WCid8?=
 =?us-ascii?Q?IcIi0MvdQMht7th9sBiViCrrdNrpLNEh/5MyDd8Y8slJrPf1hLnrP0hZQLS9?=
 =?us-ascii?Q?mBrUAHJu/1hpMvXcvGuxL+IwUS1alzal53v/jx42qbR3bxjv3xA2Uc/qT2Gy?=
 =?us-ascii?Q?HZ5XKuFsbLCENf7Ud4pZthaIhim5Q2e9ihDEehMIJT7PTBLpJtFHuY91Rf5/?=
 =?us-ascii?Q?sdoe+vs0dr5409N0NLbtPVo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20815836-813f-4822-777d-08dd9e71929a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 05:27:58.6152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DuFhQGnPrVHP0fCPUrH35PBrytQnDbn5vvgyZHw3CIZnSMTLxdJY9mhxZEMTT/1Qi2pCYGdQV7sGDdq2t4dT0yBXBZiKSgjv8fNkxpeh7m9+l0JN986sVKAj+A4uldz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
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

On Wed, May 28, 2025 at 09:18:21PM -0700, Matthew Brost wrote:
>On Wed, May 28, 2025 at 09:04:49PM -0700, Niranjana Vishwanathapura wrote:
>> Specifying VM during lrc->bo creation requires VM's reference
>> to be held for the lifetime of lrc->bo as it will use VM's dma
>> reservation object. Using VM's dma reservation object for
>> lrc->bo doesn't provide any advantage. Hence do not pass VM
>> while creating lrc->bo.
>>
>> Fixes: 264eecdba211 ("drm/xe: Decouple xe_exec_queue and xe_lrc")
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>
>Good cleanup. I thought this through and can't reason why this would
>work or any advantages of the LRC using VM's dma-resv.
>
>One nit, xe_lrc_finish can use xe_bo_unpin_map_no_vm on lrc->bo now.
>
>Asssuming CI passes and the above nit fixed:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>

Thanks. I have uploaded v2 to use xe_bo_unpin_map_no_vm.

Niranjana

>> ---
>>  drivers/gpu/drm/xe/xe_exec_queue.c |  9 ---------
>>  drivers/gpu/drm/xe/xe_lrc.c        | 18 +++---------------
>>  2 files changed, 3 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index ce78cee5dec6..32c6923df7c3 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -132,12 +132,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>>  			flags |= XE_LRC_CREATE_RUNALONE;
>>  	}
>>
>> -	if (vm) {
>> -		err = xe_vm_lock(vm, true);
>> -		if (err)
>> -			return err;
>> -	}
>> -
>>  	for (i = 0; i < q->width; ++i) {
>>  		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
>>  		if (IS_ERR(q->lrc[i])) {
>> @@ -146,9 +140,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>>  		}
>>  	}
>>
>> -	if (vm)
>> -		xe_vm_unlock(vm);
>> -
>>  	err = q->ops->init(q);
>>  	if (err)
>>  		goto err_lrc;
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 61a2e87990a9..974fe509df0e 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1007,7 +1007,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
>>  	 * via VM bind calls.
>>  	 */
>> -	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
>> +	lrc->bo = xe_bo_create_pin_map(xe, tile, NULL, lrc_size,
>>  				       ttm_bo_type_kernel,
>>  				       bo_flags);
>>  	if (IS_ERR(lrc->bo))
>> @@ -1795,9 +1795,6 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>  	if (!snapshot)
>>  		return NULL;
>>
>> -	if (lrc->bo->vm)
>> -		xe_vm_get(lrc->bo->vm);
>> -
>>  	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
>>  	snapshot->ring_addr = __xe_lrc_ring_ggtt_addr(lrc);
>>  	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
>> @@ -1819,14 +1816,12 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
>>  {
>>  	struct xe_bo *bo;
>> -	struct xe_vm *vm;
>>  	struct iosys_map src;
>>
>>  	if (!snapshot)
>>  		return;
>>
>>  	bo = snapshot->lrc_bo;
>> -	vm = bo->vm;
>>  	snapshot->lrc_bo = NULL;
>>
>>  	snapshot->lrc_snapshot = kvmalloc(snapshot->lrc_size, GFP_KERNEL);
>> @@ -1846,8 +1841,6 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
>>  	xe_bo_unlock(bo);
>>  put_bo:
>>  	xe_bo_put(bo);
>> -	if (vm)
>> -		xe_vm_put(vm);
>>  }
>>
>>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p)
>> @@ -1900,14 +1893,9 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>>  		return;
>>
>>  	kvfree(snapshot->lrc_snapshot);
>> -	if (snapshot->lrc_bo) {
>> -		struct xe_vm *vm;
>> -
>> -		vm = snapshot->lrc_bo->vm;
>> +	if (snapshot->lrc_bo)
>>  		xe_bo_put(snapshot->lrc_bo);
>> -		if (vm)
>> -			xe_vm_put(vm);
>> -	}
>> +
>>  	kfree(snapshot);
>>  }
>>
>> --
>> 2.43.0
>>
