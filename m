Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D741CAC58D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 03:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2933410E29F;
	Thu, 11 Sep 2025 03:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrf0gduu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7C810E29F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 03:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757562668; x=1789098668;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JcDAodDMBNrKoISA1yySP6RgcovoD3ETe3Em16jgzUM=;
 b=mrf0gduuo2woL7xRzPXmuZkDXWRu1fQQNgz+XUO9Boa1uooW6HC5wGk7
 QXqe18DDLSOZVvdQFEsUAzejPbURWn+XsqbEQEuwdvlf7rIwTE2ICXFyq
 mHQxrXVLg40tgKuNkg8mTXEPd3lvLo+gjOe+cXzQ2LN+4wX3065+d9c+L
 /QD/k/RKRXWAe1F3XUTpqIsr/jmlss1YWPV7DNQM0mhbON9YIRRUza96N
 anVGkQpUYB5yHhMem7bCiMZpHUIyNmSbPEvr0K1o1YQ0XKNzgv3YLsL15
 TFYdmrcL/ckN2AfDrZzZGsA1iCxbSZujdeHAtiA7NHZZS8huHwSqJ101h g==;
X-CSE-ConnectionGUID: OHFHMdJsSkSE1e1VDhy4nw==
X-CSE-MsgGUID: HuhnGcFjRmugMohqjHMirg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47457537"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="47457537"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:51:08 -0700
X-CSE-ConnectionGUID: j3h0fhBKQIGCKEgJTCdLtw==
X-CSE-MsgGUID: DdtErPPXS+ya5UNWIlZAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="174375805"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 20:51:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 20:51:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 20:51:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 20:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWcJEhWFk4qZjuN04Wur1X0l1TYlA1ooV82mrMrsgKI5IyRh8Ok2VHcDfjh8HShZO8xEmKyNIhjZv1B4vOZVi7oWcdc1b/Miae9U/k+Olp8cW9Et2yzExehPr/5agKypit1IVYX6/P/y/E46dBh6t/Zd4+CTc0E/Mw++MUljKRQwumu+eou1wRI6BT5m3gC5+hDy71TWlKxmA0rgQ5NQi3X68Zp9DVZOm5vpciCztRqc492uLr0JkzMX7aTDPc12Di5gcg2nxXXSEtYoQCETI4nGfgQQ3GDGx3069oK/ES1Y202jK6hjxMum69+4ByCojFUb5UBN84ciaQfTxfGKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcDAodDMBNrKoISA1yySP6RgcovoD3ETe3Em16jgzUM=;
 b=nQdQJfV4Wurfu85l/uT8dVntGQgF+o2l88411ixjgIcFNsG8huQRLcN3HR4rJlNWcVacQmKZ4lI8Mb8aolIbPc8+IyPsbo6t966A4DeYQgMe5QCWg6bHCFqUtXdtt5aCbsl8PTvAAVTg+oJdtHhNhqzuCOf33QeUNEhfBW05tHeJ7QL295dHCoVUielyUKWmkmA4HXGQ1ddIZZtwX3NgQ7s+E/EK/PQJDVYp/IPkD3j4PoScIp3YNdY3Jl5ljm/+YzTZBwEHcdpak4nidmE9z9syNHd2+tIcfA9GCX0MGuqTc/H+n/sYRgMYrsgIvMpfFpgX1A7w6M9BwKbPT9A/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB9494.namprd11.prod.outlook.com (2603:10b6:208:59c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 03:51:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 03:51:06 +0000
Date: Wed, 10 Sep 2025 22:51:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 4/5] drm/xe: Add dedicated printk macros for tile and
 device
Message-ID: <i5fkr5r5o7qx77zywtjzeth6nexaiiqniizjssntdzlacl2zxg@cvw4f4a42zf2>
References: <20250909165941.31730-1-michal.wajdeczko@intel.com>
 <20250909165941.31730-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250909165941.31730-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 659d8e70-a102-4e57-5350-08ddf0e66f80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ItZkQMeKPISvxK+zQo46xMC5ca3CQctcA1p6kAPMedfgQadV+NA941/kEWv4?=
 =?us-ascii?Q?X9U3c6wK2HHyJbW7kgvCJHfgW9jTs5KVNj+uH0KHZ7bXschsiANTWeN3ZzNt?=
 =?us-ascii?Q?w3hdTMtuqMz2KW8FbcmxwrVOc1ZRcpIwJBJul8N9nJ60315Xju9MTUXix/ZR?=
 =?us-ascii?Q?6gBLv74WADDf9p9H6OAiYy+a8SPL9cQN4yhpMjMu1Q4Q9WYCFoOc9jmyJGCA?=
 =?us-ascii?Q?RlloE/blus/9xQsF0HkrFNtnFfiEgBBmaE3IAdzcVk8tJGErjnWGxSUV0oVX?=
 =?us-ascii?Q?IST76Awq0EckWcz9pnecmeareHNTRnoDvQ3zmTs0WySwPEft7XrCPf25hPkj?=
 =?us-ascii?Q?O+8+Xt4lPlmPhAM43SDoX94l3RH5myDx9kkjwlFQqQ9fNywF3g+Xbf79sMp/?=
 =?us-ascii?Q?TCsxCwieEYkKeubrh6UlMB2+G6dgZVtf3rZ3x0RQBGntFoYmWuPQ0Adf1UgB?=
 =?us-ascii?Q?oT7Yvn3MwXJIWSHtLDtNDMgQV6VPGJ5KOCTCR9gklKYiZk+xG3jr+AlNIuxv?=
 =?us-ascii?Q?O6YH2OLxBcw72TiMH9pUtUWWJdKT2cGkeE4KSuWSXNAED3PsADPNpzIJt/BL?=
 =?us-ascii?Q?ASrLn2dm/goPFNqpKLrfu6Cyb3tgHhDEYPX67iBrvgHiLRV4keahEFm+BQZa?=
 =?us-ascii?Q?SMqW6fYq+su0ODH6VFWpQA1w8OyfFWZL0dlEdWi+hmX9TnIBH7IaMsf0NgHY?=
 =?us-ascii?Q?ha6EvpIDkFGtvlQ/wtayS2pRyOw5bOGSzNZq4knoS6Q/oZ2ivApSY46fKJJ8?=
 =?us-ascii?Q?x3vbrmiSjAdnaQBulXSMseo0wVo478Mdu1YzwKpj1rrnT96FDB89XHMkE11S?=
 =?us-ascii?Q?6l4KN7BG7MG6TXyIIRimKXqK+LBo0XKQJq011BADN75UDx9UDQwAoWkdRhmT?=
 =?us-ascii?Q?RECyiI9tJxu9iq/OF55UetO0felyEh5td8JQUT++1cHj2X5Rwp4D9pisek5x?=
 =?us-ascii?Q?JK9qGfJKvJEHJTMRexZthvzjpv3971RPS9zdR8XJTYezA5x8XQfN/kEODMmC?=
 =?us-ascii?Q?exw5YTbVOnRrJzcYoCZfB2ahAm7j47ezrc4Nowt/n1Vosz4szcnoLZtunAgv?=
 =?us-ascii?Q?vH7xZanHwjj6zD14QFDhEZ+KnY75bLGLIGMz2TeRBLHSLIPWNurJhKz1fDgw?=
 =?us-ascii?Q?O3/kSAmKOSXkNhTmMn5+2pJKCPIBYmMFTVZoYNksbDrvnDzpejc1qyUIhOJ/?=
 =?us-ascii?Q?t0dNX34wxixrYdupmdVEN+dCTRWNdWR2cJk9+jQzeCQa0/RDh+GZTeZ8V9vv?=
 =?us-ascii?Q?sL/eQJIlIENyAXDhbM2EGpagZvbRlBT79fcI8Jpzvxy4Dy/uhOHoQ9ihqE3f?=
 =?us-ascii?Q?E2lOJ4JlmQtRdL+sFbUCEqxrBV6g+xEgbiXaQqfk2SD7Bj2KjKbYKHjU9Av2?=
 =?us-ascii?Q?V3lBf2AUZgvvvEdOQAleuO2OYVQBj5Rf1Rsmp+FT7HiHWD9zBtXyeNhgjIA9?=
 =?us-ascii?Q?8i/VtrZbQGs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JLVGMWc3ekGLiJaua2oWCU+zOYQAHF55a1VnWugApGAT4Tc8RxMggB1MR+Xg?=
 =?us-ascii?Q?9FpiIQ0jYj9Zwz77UI2U3V3amIDHZLWwsGm3Fa1qHQ6xYes/gbbdV6mlxlan?=
 =?us-ascii?Q?svVpO8UYTgEpCvJkGxseKiMV6Q1UuhDhRjAw650mXp4RTyF8uzn/MyXG7UIq?=
 =?us-ascii?Q?4rPBzpVvMWpurz18DRMH0/QI5Sqn9OIs+XvYaE9/3c59nFNokENNoaW2XP2/?=
 =?us-ascii?Q?OSxYkYAUdsbesi/zYHoDkQQslU7ixG4+CMj5s6Hpzi9DycazXL6t1eRMkvUS?=
 =?us-ascii?Q?NWl/TXxvGhEd5OB6/hhIND/T9wgi466G9LFBZFWL5h2FctT1S5aZFJteJYSr?=
 =?us-ascii?Q?2cUj6NloKOicuTiFB7I8O/ShIM7RGbMF6RVPrZUrVXxwEy0vyJKV2B/HU/TT?=
 =?us-ascii?Q?0Y6KqZ81QpA2eY9oR9HXDRCMZ7dwKB+VUCZPqe3Ze42LyPvOBuhhxcBpUrmg?=
 =?us-ascii?Q?f9IRYkwEvbHccx9rUdS72SadvfJKOvOcLldRE6qEKOghYP+G9ObcR4FdP2lC?=
 =?us-ascii?Q?ElV7w66RGSxIqbWFhRc2JcuKwIK/Z5ds7ryFRvFxiOnYaX+UifoIFnm4aPOT?=
 =?us-ascii?Q?4ln8hVMrFxDXuK7mMzKl8BOxmMsC4XxVrBPf9zA/KAR+CmYuFv0T6D0KSNnT?=
 =?us-ascii?Q?I/yxDep8Qfj8nqCz9T+ktY07tvaVIAq1+wQ55ztsE68P+CESz1ECxfZ5v6ju?=
 =?us-ascii?Q?CGTUXw+Ia3AIJedW9NH7C2ckPi0Ml8GdzdVml9AJ6XLnQIMipauY7wFDrgHJ?=
 =?us-ascii?Q?cooDuNyPD8eziMJ2XzAD4IGKSx1z6UnCq5rb0XbvGuy6/V5wbSy6rSbMsotg?=
 =?us-ascii?Q?+VtRURTuYbkvf1DXlQ9GybObmviq5z+mQmLfY5HKFvxhBHhLvMVVcpQ2oM6L?=
 =?us-ascii?Q?OjyC98yPhPkDMd9bRlezLNmVnBPjbtQhJ0nFJ4xokivtBGWDJVKZGoE6VVWW?=
 =?us-ascii?Q?RRlAkdSGItiWucDgcIyjFW1qpGKi+ySCdeULHVcgruq6mVxllIkMDr2V9NVD?=
 =?us-ascii?Q?vPPNxdLIAfVmRE+MydHAWwHWOAtCuF9xB/WE6dPrlUY7IOtxsgJhOuFDjefG?=
 =?us-ascii?Q?/jCztsJBlOw6z4jmBOoqBaEAoSbjKeMMS1POyrc1aSk/BJvoD4M59rF5dVCG?=
 =?us-ascii?Q?8h57rmOmMztxoDPAXzAedm3kkzd3rt1wVKn6+avaXnF697N+k1/LhQurpknY?=
 =?us-ascii?Q?35v5oJvGE3EsZomOdOy1UthZrU4sQGLe8HxiZWHHIih9IaLApiUT3Yjr0z8j?=
 =?us-ascii?Q?7hmo2Z2sCJAw2mEOJTGIP5u4/J7oWHtRAjp9oG9T6GJpLGzzVsBRILaPwwUc?=
 =?us-ascii?Q?FR+lJ/sD5j8hDG2HHwaRV/rkJjLfewBAjV8oH4UDY7XT2fpvEZb2LOsHT+M1?=
 =?us-ascii?Q?Mc3Xy6dPMjcMkt0IcDVVPbkkrKkPJffclDFn+bK0hRz19YHnOIDfrSxQsUd1?=
 =?us-ascii?Q?IHXbIkrKPfWsquNIODPv17K4i08pDOmHsvgpBLYv6LwIEl9Sb1DaksNbmOhc?=
 =?us-ascii?Q?XCw5WUyfoIsEpZG1cY6ZA8l9VoW6FQsOtinKjZ4k+9xI/VNm6NGqkPsYFRZt?=
 =?us-ascii?Q?GDhIZOn4bAL9VhQJIDv6TDg9Epl/UHBTauq4O0IsBBawitoSbVkvEyDhM7Aq?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 659d8e70-a102-4e57-5350-08ddf0e66f80
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 03:51:06.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5lcI4LsDWcWIgBR1wp9ZOSMmiIhz8s7253kUGWXfRCZv7z1jK82YH8jKYcQJTciZ6Wb00eBmKwqmpw4Q9k5t2GmzcHhYFy3O8fucHIu2k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9494
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

On Tue, Sep 09, 2025 at 06:59:38PM +0200, Michal Wajdeczko wrote:
>We already have dedicated helper macros for printing GT-oriented
>messages but we don't have any to print messages that are tile
>oriented and we wrongly try to use plain drm or GT-oriented ones.
>
>Add tile-oriented printk messages and to provide similar coverage
>as we have with xe_assert() macros. Also add set of simple macros
>for the top level xe_device, which we could easily tweak to include
>extra device specific info if needed.
>
>Typical output of our printk macros will look like:
>
> [drm] this is xe_WARN()
> [drm] *ERROR* this is xe_err()
> [drm] *ERROR* this is xe_err_printer()
> [drm] this is xe_info()
> [drm] this is xe_info_printer()
> [drm:printk_demo.cold] this is xe_dbg()
> [drm:printk_demo.cold] this is xe_dbg_printer()
>
> [drm] Tile0: this is xe_tile_WARN()
> [drm] *ERROR* Tile0: this is xe_tile_err()
> [drm] *ERROR* Tile0: this is xe_tile_err_printer()
> [drm] Tile0: this is xe_tile_info()
> [drm] Tile0: this is xe_tile_info_printer()
> [drm:printk_demo.cold] Tile0: this is xe_tile_dbg()
> [drm:printk_demo.cold] Tile0: this is xe_tile_dbg_printer()
>
> [drm] Tile0: GT0: this is xe_gt_WARN()
> [drm] *ERROR* Tile0: GT0: this is xe_gt_err()
> [drm] *ERROR* Tile0: GT0: this is xe_gt_err_printer()
> [drm] Tile0: GT0: this is xe_gt_info()
> [drm] Tile0: GT0: this is xe_gt_info_printer()
> [drm:printk_demo.cold] Tile0: GT0: this is xe_gt_dbg()
> [drm:printk_demo.cold] Tile0: GT0: this is xe_gt_dbg_printer()
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
