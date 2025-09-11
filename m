Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF353CA1016
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 04:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FE410E29F;
	Thu, 11 Sep 2025 04:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l++WNQnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1465310E29F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 04:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757563357; x=1789099357;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/v2LidsfYYLr0YJx2ItYf7/7Ppcj1+zscAjmgcQDmms=;
 b=l++WNQnAjgBphQJXFkH4O/eHLhfUf6ZYGCQAG/Vulg8h9q7qZfNcwZFg
 3ZUlrfZkArW4SdpiDU4FHV2X/teV7C414BsLHyXqR/FIm0Ruq0/zOy3In
 dCMtplfVAj4DXgDAy2z/n/JsgCFBIDEk4WlvycggNyPi/tbJ6vvxwBqdo
 FQ3qoU5oXSik2mqucuMFRhOifVPw62xf0mWafAtShzhjUikktZFP8PcSf
 xJtOPNd60fzqgo0On7c0UGPUxTsdNR+VxNB9nFTNhxb52W5MdHy9+4mDF
 xduLkWcy+4gAAcJY80ziY7cD8Y4VWV98WfMj+RiixDr3kjTPe7bBPhjcl w==;
X-CSE-ConnectionGUID: RhTn+XAlQSSAEgr5qCTvdA==
X-CSE-MsgGUID: 0nbtjbqnSOaTOXzN2GCooA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77339406"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="77339406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 21:02:36 -0700
X-CSE-ConnectionGUID: 3MD73FK8Rj6bcjxUzl7FqA==
X-CSE-MsgGUID: XwAeS9dtTz6k7gpq6JISQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="178785543"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 21:02:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 21:02:35 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 21:02:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.56)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 21:02:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCNsBqqRjXvKTOGw1fnMaQTReumFSSHnwRY4+fVdtyOsbJJfUKo5p+WBW7D1jkrcpVMINjKVSCwU90qx+ctFC5mdfK64yGucL9foeqS6OxjqujAcLAVCMzZ0aWOWs7BjYZwopY/DYBn+DLQ3PBToQdNS0nklOZhWdOT1dsEPxobqjdmz5BUXr2V/cFq0ntpccHJOYfyKJ0EudWnxqTWZbkbjI2rVrzKwBdgi21v9jzyIl/0ygusa8WvxMzHss062FbFMTI4RtNWJkA/NzvgpmK1HB+A3gN/HlgqyVR+7Q4oly2Uf6gz0LiKsmRnyNtefP9atoNZbfiam4BbrW2HUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShOUaoxuWgiZ1Z5+3qf02qrrsCBmLGSpotrPItNc/kA=;
 b=ChVz5T1K/BwxdtggkqKSaEn+YPCNqocSiHYCjDKKLoeG2hFEqPa8rZN3zyXqyh1Uneb9qC3CkmOnQN69XX3jxfjyQQkKhS0zFjMwT9X47fq2RQzGP1+zkXs8VHm6czGhC/ZAqTtgRrah74L1PXufJPprsHnyNCDBWOrtifcGSbwv174bqzlpCyXA/juecNv/cj12z27CR8rAjzy4s9dnP3d2NLBORLJL+5KwqDXtF8Cmf8SGhoq9PJwZi8Jw5HHCbjjq/wmUtXYTtP7QVtN0j6w4XPH3vNm9q0lfEJFetxdnKyleqeEi5hRLYPr2bhS6SfQAbqi9bfaFiW4GKSsWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6769.namprd11.prod.outlook.com (2603:10b6:510:1af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 04:02:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 04:02:31 +0000
Date: Wed, 10 Sep 2025 23:02:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe/tile: Release kobject for the failure path
Message-ID: <5vxpe7yvchsgtomjl24j57d3t5f7zz6e4i6aa3vrr4bc2njx5m@5g3ivcxeevbh>
References: <20250819003957.2868064-2-shuicheng.lin@intel.com>
 <20250819153950.2973344-2-shuicheng.lin@intel.com>
 <DM4PR11MB54567C12C35D39FDD4F15D12EA09A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DM4PR11MB54567C12C35D39FDD4F15D12EA09A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: efcf5e53-78eb-4fb4-3deb-08ddf0e807e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IETsrQAjUG/VNVOVfzUCiaULjOtiezAgki2xpiDohBOUymI7eTrw57VWQhtQ?=
 =?us-ascii?Q?blxfMTWH0H/yNw6qAB9a4BchMFdoVzYBPSaTEXhN/N5EW039RU/+XfC/lcau?=
 =?us-ascii?Q?nOK7pu4A7gYwjdn40Fmt+7tJ0zPfYLvlabkrrehIwq+3EQ7FpIV0Ta6mXCW9?=
 =?us-ascii?Q?086dJsOLZafoJr74e6VdMKCSeLjNHzhrRZoRKBQNN10m3iiHPqq5ITAUKYVM?=
 =?us-ascii?Q?HwqkcBAFtZB9RDdbiKd69LzjGnFjLgMBmde0wOiEGhqn56/BM1mPzOHi7Hz0?=
 =?us-ascii?Q?LhopMXOEkRd9GrL1oKNqyv8p1oJV7S87oV6pHA8TabuHiFYFQKmFoEd5nF2t?=
 =?us-ascii?Q?7KItyS5gzJ0RRSRgjd8NfIHeOxoBs9UlNE1hkc1cL/RC1zSNpCT+RAB/SASU?=
 =?us-ascii?Q?s5ZqHohUZX+LNwcYjdPmVM0eZ5BnImGqUeMg4TFM/A9TMYWI+mzHLYzQShqf?=
 =?us-ascii?Q?yae+b3CRIaEUANyNPb8Pq0zzVdelh2ZbiASHJDo/SEBsqoRVSOKIS4lex6bf?=
 =?us-ascii?Q?Spm5MKDx/tYzxQl1LYXjrM0304qrTqe0dzhBrkxs6YmzuwEnO8EmqdIr+cWQ?=
 =?us-ascii?Q?k8cdgNCyVEZlOWwKYPADBKeRjn+Zb2Gkt5GN2ITa132o0tYsQa+h59/QfcWz?=
 =?us-ascii?Q?fMgtwFmBwHJiRUSX/1FRhe0+q3387loRJqXEpX2LeHrxXgX5WkXq/URLq89Q?=
 =?us-ascii?Q?RCAOy63Kwmygr8284V1gs2PTbPaxtb1Wpy0VwVARMGQKVkGvD6AumW1Y4/2E?=
 =?us-ascii?Q?FR1cSNJhLQFvpvEt48i18rWv5VbNUC+JjqiyLWMWlFmeRaL5QIQv7T+2wumP?=
 =?us-ascii?Q?NlxGyaSNryea7GT2YfP7sWR/oyfHnb5X//mg+VOvhfx4mrXZlOJVHIIH33kH?=
 =?us-ascii?Q?xG8uplQn3E3q259CoNhHVo9HVHBnFiRHYotnwvJLWR7kDfpGVPyP+i6en4bi?=
 =?us-ascii?Q?74y6EF6U9PGWjRyqHPBappPlDztA9Z33N14cHTBx8gUG8BtyqNgCN4uBUpcT?=
 =?us-ascii?Q?3s6r9e4BbkiaEZMEb7ODgF/NZy9gxG6rref/ltIvvqZdYVCpTuKTBKAeUsjT?=
 =?us-ascii?Q?GDKlrIs0GuAAP/F2iZoGbg4JFt1VOdWcpdw6ZaUQ9EJMx8UYnZNLb+Xh766I?=
 =?us-ascii?Q?se4olfivhZMc1Jinpq8zANsySBEUrvhbtTKQdmiQYSbvjv+PAAWkWeXClNa/?=
 =?us-ascii?Q?TMBawInUkrgD4aL6aHxdG+haU5OzlE9VvvJlNwCN3dMNKpZd4JzqB/RehjBQ?=
 =?us-ascii?Q?3Q0PavQFz7TrCbO6vHz23zOXiDePn7S260gNinx7g/26VCPOKSzgnQtOUypQ?=
 =?us-ascii?Q?JE7WAXHOGnV150aLyvt217i2sZ6PybWmX/sgK0Q5VaMCs4KMRRejRDb0VVQ7?=
 =?us-ascii?Q?7fV+QLfLmcoH6a4aYb9owYk8tDXwt0aOPEbOaOTP2D67A9ChxBg8k62FFwiM?=
 =?us-ascii?Q?nu8AJu8vZSM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VLwquwx1judydJJPOjU/kzZM+qHkIjE6ka9REmVb4iUVezfN8KAw9pf5NUPJ?=
 =?us-ascii?Q?gjc0KVkFwfHdDH43MtSrO4BsWcqgz0KbEkxajd75l/RccjV2GP1yqAu1N1OH?=
 =?us-ascii?Q?nHy19pCZDu/1TPraFIsmKK8l+YZvuDEvIGiixX1FLgOBmJi/MxicdmWOaZFV?=
 =?us-ascii?Q?IobDoqA3MVZpqSQ0w3QxsWpgCr0aovRqJVnjIBXvlWap/b5u5xuPBEAqrEuO?=
 =?us-ascii?Q?frcDdDyhMHPOXjRZTO3RHZoGo+gwtY1MlDie7gpqEYjIIEya4SKuXSW9w8dc?=
 =?us-ascii?Q?DoE1vpR07bTYFi6ghmk6KDs2MmSKmXzdAPJcE3uTsuE6tq5Au5QcqAwyQKX5?=
 =?us-ascii?Q?vmHj1Ak6jPWh28RKlisttWdq05VuMJtwGvlGqrucwn0QL4IESRfNm27goMJh?=
 =?us-ascii?Q?V3LJ+NiAlfixh6Jl7I84DhIRZx4AlZ5nHQxEOyqSTIkVHkahg1nNYPFHG+U+?=
 =?us-ascii?Q?cZ5bM5KuggIjXTkmdmOPpj3W7jNleADrZO9N026Zf+H1zB+EmWHXqvYtCndm?=
 =?us-ascii?Q?68ACA3bqxSmPCFVNrPWM6jlVqNYk6BIefAg7ZODTUEE1UonAZksPvNvFRuxE?=
 =?us-ascii?Q?S7XdJ9Ikdmkt5yn2hqYe1rHaznlAygAGpMTmWa+yJIUx8Swm+IUo9FoSyZYk?=
 =?us-ascii?Q?MpL7+cOH9FzAYFDy0pqvcA2PCdteFBTbEb3K6jty/HUSjq3SrFC4IgClti9L?=
 =?us-ascii?Q?dpcgTrsVol21AZ+y+j4M6hWEPFXjD9lnEQ40T/iumshz5iAYhMGty7tRXjvM?=
 =?us-ascii?Q?7dBYI31gfkfzB7X9Ck0EYNaqPWurgmpcaStvCbWvlkHEKCcvpkjgf94O0kmH?=
 =?us-ascii?Q?moLB9UMva6jF/lE+nAoLUVZZwsysaWTHo553Po4rl8cqVciWDTxJUOUZfbxq?=
 =?us-ascii?Q?cVSjvJP1BN7Y9fVYnppNgzW6pqNo5GnmHKe8ImM5X6MZ0BJG1xNRa4mXozTt?=
 =?us-ascii?Q?GkW11Umel/i4w1p9cqJhyCXZ2CUMHB0i3e4UWUD5xQaTPIJYD3cKAifNlypJ?=
 =?us-ascii?Q?KdZxYBj9AG7nJH+x9gImEGL3TrPQUn3BX6dN2JLaOb/8+SQ+c1U+kIMZl5zu?=
 =?us-ascii?Q?CZ1TF+XMQz9hMpK8jeWQ/3U14B0puIHxCF52c3YbfrRGIrIWwkZPpFXTzLjn?=
 =?us-ascii?Q?Wvhq5y5CjM6Y9MXAu+sVq6V5CHluMf3aXgQximSucMhstrEUvDH6Nuo/6ckR?=
 =?us-ascii?Q?MJ3UchyzcsN1kVjrW8T99FfmBVzf/L4tKfY/5fnuRu9n7Nov0PHGRIx/UAdv?=
 =?us-ascii?Q?4MSbWs1LCjytlfdNnjjvdjsAbYq3LqqWi1a+wBvFpmywdPvsv0TIiZDIGnDy?=
 =?us-ascii?Q?I207+P343VA7VRwLNJWkZSgQae/UWnSq/8PPKuTyuUxecH4EOh50oqcTC8Ui?=
 =?us-ascii?Q?2ldfZmrytLkJ/RHz0wSFYpXK/b6gAXajInAMl6JuoLF12vdid+QC1WKmWLIr?=
 =?us-ascii?Q?E6V7Xeql5Llo6CvZtN3oCD6ZmGascV61W6k2g1NHm5INEH4BXAp4LsffCsXh?=
 =?us-ascii?Q?XItxbZHotD8IjHPTZB1k4/jpMkaMXkJqVWjHEEC3Mc0Vg6a/1jjw0aNcbKtC?=
 =?us-ascii?Q?/q6Sxv0+Sz4GS1Yio+n7p2R5nvYvxkTlSziOq1SjRlHtJdMKGyxk0QxIzozH?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efcf5e53-78eb-4fb4-3deb-08ddf0e807e1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 04:02:31.4323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIDPv2QMa5fVj6AvP9zQBDv6lFDxsNoe4G4pOajgGLgWD1w5Lqsz51KFyj2e+BY23JJCcNGtPtxYepnatsm+vygeKx2RDRMrS1gnnVvHfb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6769
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

On Thu, Sep 11, 2025 at 03:23:07AM +0000, Lin, Shuicheng wrote:
>Hi maintainers:
>Could you please help me review and merge the patch?
>Thanks.

applied to drm-xe-next, thanks

Lucas De Marchi

>
>Best Regards
>Shuicheng
>
>On Tues, August 19, 2025 8:40 AM Shuicheng Lin wrote:
>> Call kobject_put() for the failure path to release the kobject
>>
>> v2: remove extra newline. (Matt)
>>
>> Fixes: e3d0839aa501 ("drm/xe/tile: Abort driver load for sysfs creation failure")
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_tile_sysfs.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> index b804234a6551..9e1236a9ec67 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>> @@ -44,16 +44,18 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
>>  	kt->tile = tile;
>>
>>  	err = kobject_add(&kt->base, &dev->kobj, "tile%d", tile->id);
>> -	if (err) {
>> -		kobject_put(&kt->base);
>> -		return err;
>> -	}
>> +	if (err)
>> +		goto err_object;
>>
>>  	tile->sysfs = &kt->base;
>>
>>  	err = xe_vram_freq_sysfs_init(tile);
>>  	if (err)
>> -		return err;
>> +		goto err_object;
>>
>>  	return devm_add_action_or_reset(xe->drm.dev, tile_sysfs_fini, tile);
>> +
>> +err_object:
>> +	kobject_put(&kt->base);
>> +	return err;
>>  }
>> --
>> 2.49.0
>
