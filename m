Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218E0C5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 21:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBC010E884;
	Fri, 30 May 2025 21:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeaAjlHO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0577B10E884
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748640757; x=1780176757;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=v6Ayh0fgNA+Tb13eTQ70JK1QTaEhHiYOaV3M6NYBXnw=;
 b=jeaAjlHOmO41PkeBvZ6o7859thozHWyDShB9e+JX9PLFK80YH4JaoTOh
 TiRZKnOtbmhpuwXXINEZ0+a9fouLTx+qL7E778mZkjcOvEAISd63sBsMU
 NmJaWGyjyMDHIOgzvz1CfQyNLuctEfNP3LiW2sOqiNw2lX7HHwYDV52/r
 TQA+i+ovUTeU5zhQLhSKwLDnhbO2L1Wz0Hb6VSEsCWeNH/YNrtzEFUzG5
 pUeQkwqJW6gXPUlI6/jhQyzhq39vQrWEgJgFRFm4yMAlJQ6bntFiN0YK4
 1yzlhKsdNBM5QxNn8Ha1E5inKCALdzzVNzSxSkkApnZAIokzcJYc6sblb w==;
X-CSE-ConnectionGUID: Mhj8qX6bT+mCJMplhpfldA==
X-CSE-MsgGUID: tdxmRP5ASIu0S3hFHoSBIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50893123"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="50893123"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:32:36 -0700
X-CSE-ConnectionGUID: 4yRdqpZeSo+SJBVytuoHKg==
X-CSE-MsgGUID: YGJAFlSbSqiX4G3p7a3l/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="144321408"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:32:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 14:32:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 14:32:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.55)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 14:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeddDor/4gxTvHfhFrIBxmkXug2LmuwWfxo+Ai0hiSL4087PA3PeM/P19pFM6doHXgpadZEAypOlhA6qOtdrARdYyHo4kPwQgk2QeTLaUH3PrXK9R/oy+GMPf+oWMf8j47K4BKp6F5ysWL41wINpe6HZ98Vli3Xc4ksc4Pw0KvsaoubvjLn1YQEXxCC2OpWoZozsOaK9IEDNc257XOmPms1IzM6hGgHsD4XyeZbkQu5DJBku9pBbLGsVi3iGpz+m/1iDOoic1hF+Ir8OQBKqNu5xwE5x59xdRKTNlDl0ZqT6pZ4t4WVUz+C1JSEitW91E/5sg2I+cqPxmqpH6+ea2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjycdZxqHOO+vX3/Dr/W1aubGTSTzFRz5rNBgQJoL+A=;
 b=OyeQ6D84maQCSPDwKXLTWt9dDWHCR98vOOLqBV0qQY//Np6O3MFeQfZ3+CKRzoUDufYn6XZd9wkOjXJ96GW5WBtoJNw8WahZOXCrt7HPCPPrsVqSCOPs2JoO1jW7+wHwgll5ZYyaGQ/rWmd/sVYlHMg4AK/OV/CapTP9qeGIoXxgr33Did3pZmNBvRX7eXt5E6D1jht9bywB14/Lo7Ruxtu9YjlgBx3I0txreC43CmvFJ5GM8bsf7djkMEy8nJzeBdrOctn90S4AJnD8lhr/nsyYDde6XeG6j5czhl3vNCD1jZ9CTUN13EfN1PF+Y4P00Yik9amfK3W0PX78GBzUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 30 May
 2025 21:32:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 21:32:33 +0000
Date: Fri, 30 May 2025 14:34:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 10/19] drm/xe: Implement madvise ioctl for xe
Message-ID: <aDokTWyn942CBVXh@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527164003.1068118-11-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0259.namprd04.prod.outlook.com
 (2603:10b6:303:88::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe0734d-99a4-419e-81e6-08dd9fc17ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WuF76t2CEBYP249PRNA+co9ft3ypCVv3IadBemVRe7qy8uPLQCcXCu0Oib?=
 =?iso-8859-1?Q?Bjg5VzmMz4x0cPGPbuR6i5rtjfKX4TrgAzUTDRAUZb0D5uSjRf1Etav4nG?=
 =?iso-8859-1?Q?MUim3ED/z+EEfgz6ZEh5una8SJNEkHzFE1UuFA4VsRaKMHZhKVubJyBGSA?=
 =?iso-8859-1?Q?Q20Lwgtr2jfIWCLukiBDuFIHDXtJQASpy4Ipws6mvlDRAhzV9Rnk07Kz1a?=
 =?iso-8859-1?Q?aT1FhOwy6H2Yet5FqjHYGjFcxamgLGFxztXjv+olt8OPIuKu2wpcysHvUK?=
 =?iso-8859-1?Q?twpuNjiqICA9APKRVmKVUGDL+Zt9kgTZEscth5AxrVnhQhIp6yDekoSkwl?=
 =?iso-8859-1?Q?sJcgLFa4XUvwzjPRbf9CnZvJlM+nxSxLuedvGo6vyad1/TTOlh9CvmIUmw?=
 =?iso-8859-1?Q?QD5J3/xVVHBBYBjNchw/p5LjhJzOmoBb3aWMpzH5+aV7CFBkER6uw5LLKI?=
 =?iso-8859-1?Q?gQdnHvSUx8VXkp4gntcjN1Swo3E0+4JtWBavvF2Dczz3uRqs2Z5QkzLU7g?=
 =?iso-8859-1?Q?YitGoSzh5zS1rQPLoy+y39N7CQ6tzOm1xhdwsqQ5hYjtwIR8K+sH8gdWuu?=
 =?iso-8859-1?Q?7wTDB8+ivhcPDIN6FdF0M3Z77CpwdAQmg8HrQwjqch6htN2O3B2Qswhar2?=
 =?iso-8859-1?Q?QxGUVdXGRNXBTD+2Z7xwtO49fyTRz1c9QwsukxdZGRFAkgQN8MQUBDSZUC?=
 =?iso-8859-1?Q?9/zeQr+sLq+NUNIX4A8TINOUYpI0IGuNb3AyqDnOA3eUYA41ei1ZYDn822?=
 =?iso-8859-1?Q?rxZKJ5l5eA/wOPoxwkFE8b0pVZTno97/LqLs+XmGAoHdMNYoqms3cT9gf8?=
 =?iso-8859-1?Q?meMxJxVE8PYiHoccual4E46H5kvX6aVAtNZyAljz4EGBP5xAC99fhQPxnm?=
 =?iso-8859-1?Q?EAE8ez8iYsRf7WHJUKaicxBJ7LSmp7I1p3l+KCYtB+7B/UDxN/hS7TKSb1?=
 =?iso-8859-1?Q?0VQARVIi2jbMsaXrEw9V1KaMREjjNwg3B57C3XaQysXWdR8XxrOFJQRiPj?=
 =?iso-8859-1?Q?l0P9TWAzQ8IbT9a0dvM2RjcJ1HpzFoKpQgaG5T6Z6YkOWhyE75O1+NV3nW?=
 =?iso-8859-1?Q?yb5egrKnWtoZ9OxQD4OafUXIVP9PrwL5tAThHF1xepRThp07L0DfpHFcO4?=
 =?iso-8859-1?Q?0xStx0j+pqVssZQ/BRCM2KmKB04kWFmrkvnvtFt8E9wqlGNcZL1zHyX/QG?=
 =?iso-8859-1?Q?r1XnLrDO8E9SyPw5iWeipc0ozdYeyCEgb43lVXnz9RCzva181/MmVLs9tZ?=
 =?iso-8859-1?Q?PzwWA0OHTm9qadSYYATId7Fcg8SgIQtnG5RtZp9vMWJwKCezHoR6xRczFT?=
 =?iso-8859-1?Q?ytFxwiN6w9tYVtFAyxb9wdLPmiyIWi8068U1XC/fBEwHXxn95SVXMaNUzn?=
 =?iso-8859-1?Q?XtftLdkVNUUtOY4JH6HQtP3XDlOcWdw7c2Ehj1GjzkQLEitxnJODMDyspI?=
 =?iso-8859-1?Q?UYbIHEDFqw0z5sAI2MsIJ8R3h1vjAYXiROPfK5IB1Go0Y6JnxQKpI3aNfj?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Gb8deTvb3jwnBr35CQnZX3eCGZhAMW86JUd1MzaAg7rcQB/YEnPRVDpQF4?=
 =?iso-8859-1?Q?E3vXd/1Wqudf49rZkJWe2UKGMkYs7tMhxGJGVkk6QuEXE6dWQk+CBjNlMo?=
 =?iso-8859-1?Q?3Te0SJcK6dC5O3Y5nRVBNjqaeGxwo/7q3X9h8NYJrQf9UU7YrVHYgqUPZo?=
 =?iso-8859-1?Q?8cZcSHJX1m6iZH8OJ7AwAVnvTZqGcFt1TbESEd0GpbfYJbJ7ytTbMna4xY?=
 =?iso-8859-1?Q?GpJf50zjXs4v7HNpCwb9xYgVD/t5R/4giA52JEyHVrX2UBbh2SpPATW5AE?=
 =?iso-8859-1?Q?ClpmbpjUTKdg1RnG2JQZAQ1e+c5D/cdZfwksJtiGYzRur9PmUOlot9+cUB?=
 =?iso-8859-1?Q?+hxMdLgwsSykeXbf6c/N7E05t/mv3JU1IU7rtBfZ1jcd/WARmWKqQSCLUp?=
 =?iso-8859-1?Q?wVAmzrbxYrI4LWsNYaDSEy1DVJJEEVqmcnfLrpapew9OirE0UsWelPT7ze?=
 =?iso-8859-1?Q?nqDW/3VSDA0DALyLs7x+LzbQ2AK3pr1Vp7RD8fUx35c1f30yKDboDn0rfj?=
 =?iso-8859-1?Q?pcbpVVM2bYbzthqz3x7ku500fXallTmfj+b6PlbT9NURzCjK7flMqgNXLb?=
 =?iso-8859-1?Q?txXltneGyPZXZg6e60slStND4tjqVKv6F4VcbWnVJj5Ka/39u6gQ4I4Jqj?=
 =?iso-8859-1?Q?oCxnSN+BiGRnizx8y/xev3EpB4D6cbBVf2ULWySyl7ISdo9mcny5IAGPs7?=
 =?iso-8859-1?Q?gC2TuCHE63qil+682eLtjQ9IF8d/r5SkbAxt6Kml7eBcLhs5JPC5p8CjhO?=
 =?iso-8859-1?Q?2E3FfQEOQWQ56ztVEr+L0vReIktIHsLbsGL4IaBIyBDEIN1NQmGk+Zwhka?=
 =?iso-8859-1?Q?MhvqyeDDahulQ8laIj6xfnBt0F+BxIGf4F913pPTUJRwS/w8aSOewNi/1W?=
 =?iso-8859-1?Q?+VS5gHl4vG6bnZyfgTRZvmFukKbOmuxS9+iATvJDxpIViIadeZpQcxpgMa?=
 =?iso-8859-1?Q?rvfQevSehGHcCRv6JThmXYI87VL5C1rb5m3hDcGphNPLEFWu01D/tSRb9R?=
 =?iso-8859-1?Q?olm94r0hvpKPIh3sXLQ+YQ4+FEA5yJoJqLhgu1zaNQSW/abN0FVd/iCSjC?=
 =?iso-8859-1?Q?THf8Td+Lv7hkxD5aTsYII7ztvPEpKuWK92SfpvFp9TWCRwUbxYhC32KjwY?=
 =?iso-8859-1?Q?dh+Vk1VZsTYgA6VC5VJy8EVzKqX1fV+V18452uMugK4ML+tQpcLQO72HUb?=
 =?iso-8859-1?Q?S8C6lE9Dw3fSrKlrHLoU2N83QSyyDo9SVMXCLitA/DuDa/wGd7ad7SGAy6?=
 =?iso-8859-1?Q?mP9oB7pk12EjDTYnhbzPVNDbAPgAh/Qwld0pMv5JxmA6S9X4AygE79J7+/?=
 =?iso-8859-1?Q?mx73ILc/2NYvMyNHeCgRdZqeOJl7n8Cq35DlmLJO1Gu4+lRwI/78pJIKPb?=
 =?iso-8859-1?Q?wEnObDbDDDr5kER/wZ8KIiuQrERaWsNWF+LXu0kzhSAegiZk+Tu1cIxfBh?=
 =?iso-8859-1?Q?vKXV9eW1PXS/E9rqc0RHC/jBqyxg+Ke3rjyXz7p07K9vfONYFYETe9NhRq?=
 =?iso-8859-1?Q?l4C8rrY+fLquYrtqpnELqe5+S6+uXXBDFwkE2XRJ/PsJ6mbx15IMM+Op7/?=
 =?iso-8859-1?Q?7ebR/zJksjKIYfFGXVoZBZ4h5nRSOZ6CBD/t16J1kxARoBgfIAxvx2azWI?=
 =?iso-8859-1?Q?PsiW/dhSzuwlti+oL1mfergYrSB7NEaFBRfrx2oDQNFYfaPqmTeQidXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe0734d-99a4-419e-81e6-08dd9fc17ce9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 21:32:33.1529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewrLQ+k+CsJXnAW3aFOWdf27waU/dCTCNvWFFhLMBlvqi9jz694HcdNkENQ2BIiXBEBaf6m3qaZWlsWU+jADmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
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

On Tue, May 27, 2025 at 10:09:54PM +0530, Himal Prasad Ghimiray wrote:
> This driver-specific ioctl enables UMDs to control the memory attributes
> for GPU VMAs within a specified input range. If the start or end
> addresses fall within an existing VMA, the VMA is split accordingly. The
> attributes of the VMA are modified as provided by the users. The old
> mappings of the VMAs are invalidated, and TLB invalidation is performed
> if necessary.
> 
> v2(Matthew brost)
> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
> fault mode too
> - fix tlb invalidation skip for same ranges in multiple op
> - use helper for tlb invalidation
> - use xe_svm_notifier_lock/unlock helper
> - s/lockdep_assert_held/lockdep_assert_held_write
> - Add kernel-doc
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile        |   1 +
>  drivers/gpu/drm/xe/xe_device.c     |   2 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 264 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>  4 files changed, 282 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index c5d6681645ed..dc64bdcddfdc 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>  	xe_uc.o \
>  	xe_uc_fw.o \
>  	xe_vm.o \
> +	xe_vm_madvise.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
>  	xe_vsec.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d4b6e623aa48..b9791c614749 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -61,6 +61,7 @@
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_vm_madvise.h"
>  #include "xe_vram.h"
>  #include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
> @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> new file mode 100644
> index 000000000000..f7edefe5f6cf
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_vm_madvise.h"
> +
> +#include <linux/nospec.h>
> +#include <drm/ttm/ttm_tt.h>
> +#include <drm/xe_drm.h>
> +
> +#include "xe_bo.h"
> +#include "xe_gt_tlb_invalidation.h"
> +#include "xe_pt.h"
> +#include "xe_svm.h"
> +
> +static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
> +				u64 addr, u64 range)
> +{
> +	struct xe_vma **vmas, **__vmas;
> +	struct drm_gpuva *gpuva;
> +	int max_vmas = 8;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	*num_vmas = 0;
> +	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
> +	if (!vmas)
> +		return NULL;
> +
> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (*num_vmas == max_vmas) {
> +			max_vmas <<= 1;
> +			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
> +			if (!__vmas) {
> +				kfree(vmas);
> +				return NULL;
> +			}
> +			vmas = __vmas;
> +		}
> +
> +		vmas[*num_vmas] = vma;
> +		(*num_vmas)++;
> +	}
> +
> +	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
> +
> +	if (!*num_vmas) {
> +		kfree(vmas);
> +		return NULL;
> +	}
> +
> +	return vmas;
> +}
> +
> +static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
> +				     struct xe_vma **vmas, int num_vmas,
> +				     struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
> +			  struct xe_vma **vmas, int num_vmas,
> +			  struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
> +			     struct xe_vma **vmas, int num_vmas,
> +			     struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
> +				   struct xe_vma **vmas, int num_vmas,
> +				   struct drm_xe_madvise_ops ops)
> +{
> +	/* Implementation pending */
> +	return 0;
> +}
> +
> +typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
> +			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
> +
> +static const madvise_func madvise_funcs[] = {
> +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
> +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
> +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
> +};
> +
> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
> +{
> +	struct drm_gpuva *gpuva;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
> +		XE_WARN_ON(1);
> +
> +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			continue;
> +
> +		if (xe_vma_is_userptr(vma)) {
> +			WARN_ON_ONCE(!mmu_interval_check_retry
> +				    (&to_userptr_vma(vma)->userptr.notifier,
> +				     to_userptr_vma(vma)->userptr.notifier_seq));
> +
> +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
> +							     DMA_RESV_USAGE_BOOKKEEP));
> +		}
> +
> +		if (xe_vma_bo(vma))
> +			xe_bo_lock(xe_vma_bo(vma), false);
> +
> +		for_each_tile(tile, vm->xe, id) {
> +			if (xe_pt_zap_ptes(tile, vma))
> +				*tile_mask |= BIT(id);
> +		}
> +
> +		if (xe_vma_bo(vma))
> +			xe_bo_unlock(xe_vma_bo(vma));
> +	}
> +}
> +
> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	u8 tile_mask = 0;
> +
> +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
> +	if (!tile_mask)
> +		return 0;
> +
> +	xe_device_wmb(vm->xe);
> +
> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
> +}
> +
> +static int input_ranges_same(struct drm_xe_madvise_ops *old,
> +			     struct drm_xe_madvise_ops *new)
> +{
> +	return (new->start == old->start && new->range == old->range);
> +}
> +
> +/**
> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
> + * @dev: DRM device pointer
> + * @data: Pointer to ioctl data (drm_xe_madvise*)
> + * @file: DRM file pointer
> + *
> + * Handles the MADVISE ioctl to provide memory advice for vma's within
> + * input range.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_madvise_ops *advs_ops;
> +	struct drm_xe_madvise *args = data;
> +	struct xe_vm *vm;
> +	struct xe_vma **vmas = NULL;
> +	int num_vmas, err = 0;
> +	int i, j, attr_type;
> +	bool needs_invalidation;
> +
> +	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	down_write(&vm->lock);
> +
> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
> +		err = -ENOENT;
> +		goto unlock_vm;
> +	}
> +
> +	if (args->num_ops > 1) {
> +		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
> +
> +		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
> +					  GFP_KERNEL | __GFP_ACCOUNT |
> +					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +		if (!advs_ops) {
> +			err =  args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
> +			goto unlock_vm;
> +		}
> +
> +		err = __copy_from_user(advs_ops, madvise_user,
> +				       sizeof(struct drm_xe_madvise_ops) *
> +				       args->num_ops);
> +		if (XE_IOCTL_DBG(xe, err)) {
> +			err = -EFAULT;
> +			goto free_advs_ops;
> +		}
> +	} else {
> +		advs_ops = &args->ops;
> +	}
> +
> +	for (i = 0; i < args->num_ops; i++) {
> +		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
> +
> +		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
> +		if (!vmas) {
> +			err = -ENOMEM;
> +			goto free_advs_ops;
> +		}
> +
> +		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
> +		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
> +
> +		kfree(vmas);
> +		vmas = NULL;
> +
> +		if (err)
> +			goto free_advs_ops;
> +	}
> +
> +	for (i = 0; i < args->num_ops; i++) {
> +		needs_invalidation = true;
> +		for (j = i + 1; j < args->num_ops; ++j) {
> +			if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
> +				needs_invalidation = false;
> +				break;
> +			}
> +		}
> +		if (needs_invalidation) {
> +			err = xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
> +							     advs_ops[i].start + advs_ops[i].range);
> +			if (err)
> +				goto free_advs_ops;

In additional to all the other comments around invalidations - you don't
always need to issue TLB invalidations.

- For pat_index, only if the VMAs pat_index changed + valid page tables
- For atomic, only if the VMAs atomic mode changed + valid page tables +
  current placement would cause issues
- Purgeable - never
- Preferred placement - valid page tables + current placement != desired
  placement

We likley can set a temp bit in the vfuncs in either the VMA (BO,
userptr based) or the SVM range(s) which the invalidation func can parse
/ clear indicating an invalidation is required.

Matt

> +		}
> +	}
> +
> +free_advs_ops:
> +	if (args->num_ops > 1)
> +		kvfree(advs_ops);
> +unlock_vm:
> +	up_write(&vm->lock);
> +	xe_vm_put(vm);
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
> new file mode 100644
> index 000000000000..c5cdd058c322
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_VM_MADVISE_H_
> +#define _XE_VM_MADVISE_H_
> +
> +struct drm_device;
> +struct drm_file;
> +
> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file);
> +
> +#endif
> -- 
> 2.34.1
> 
