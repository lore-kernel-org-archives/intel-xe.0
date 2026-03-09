Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A69EF36F1
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 07:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1900310E48C;
	Mon,  9 Mar 2026 07:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdxvIrEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5AE10E48C
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 07:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773040047; x=1804576047;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=diIiWQaAbiZmEO5Ymj6q3wiOszqFAKUdaxFwyUovbsw=;
 b=FdxvIrEC7EsES61/89gb/CDjN84GcJGbC0SnkrR6LhYNyRQFdmBlJYFi
 A8/wdfF4hnBbeOy0zr/PufI5B9bWIptLrAlHDIFTFcRFiHonHSR1y+jKe
 0Vzqf5ExoPr5szM/ZtOKeXqnRsW9ksebWTZSkVKsEPLwCRQlJspfpXWk8
 PZeUe/8m7UcHhojFBxH/is2nneKXDe0eOoUjewxnakODkUmYVzvr8rTsv
 zDcdikjBxUBWri8Go1jl06Tzd/b4Ih1zxgDZlNjnW8bl8xjt5DkOgq+bv
 vwtQRyhepDmZGvhkMzUwzD/Y/XwdNb4S5wqs+kjsYDeCzTpENSXnas34W A==;
X-CSE-ConnectionGUID: X9IbqfvbSdmS/18mY1UqVg==
X-CSE-MsgGUID: cDGMn7g7RD+m+wRT6+YPYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73756969"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208,217";a="73756969"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 00:07:27 -0700
X-CSE-ConnectionGUID: LhL/2Y2CRUunnOZpHeY7Ag==
X-CSE-MsgGUID: rxGCLh+XTG6UC8Xb1p1xEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
 d="scan'208,217";a="219611010"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 00:07:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 00:07:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 00:07:25 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 00:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6MDhp+bsAP4LGtLQsmU3pkA238pGv9Z2gHcC9f6f/wXEa9lnrrvqCJvzvNDUSHP8hJKIvokePXdJKZjouVutNWvFDk/3DRveAbXlhDZa/WHsm/SW4go6aXOiWNp9hgwVBmy6Yo/BJVCWWZq4PXL2KLyq7rpNz1AeK+k7vgw/pB25pLUxZKHLxsMltuKJ4qsOt5S5c0b13GV36+ixWqoqh02o0ERgYju1/+YVKBJnrpIM1tM7StCK6SvAI9/lOzC1tRJ2PSUR9pbJBGDAZ+2C94Y5QjLuP7Cy0Ry55qFi7yHRVEZnXOaJ5Jdz8WI8OOftrztcIZgDbvKYivHANQT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD6iJ9xTnY8pCXSgN5O+6J2edHWdj2hKSIZUI0YQfcE=;
 b=uVS23TSPWv5BmKh/jm2qG8yB44aHmQu2PMwaKvB+7ahlTZidMfDqz6u0LBOb6vNnGn4ngHaFhCgFS320fi2Kt0+9Kt8xUqwID298daRIitebcAq4GYbafXtfEeMiEUD686KboXjKNdAnTnBtH7lc1IDVGfTQXKn83jDqkYTK+TD2aqDMq348jUWBM2ogm0hnQPl4WYsoukpP1N5di5KVphpMd/eJH2TiVTtknA/hXGTdhy1ql/n4Rz3GzuF9ZQ0ZkV9ugAqlTVTbyo98eFPVi2OVma3vzYaolzxdvLBiyQH5oPpZUA8aikqw17BJ364bbJO+R47c7JArHAuLIYqVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CH8PR11MB9483.namprd11.prod.outlook.com (2603:10b6:610:2b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 07:07:23 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 07:07:23 +0000
Content-Type: multipart/alternative;
 boundary="------------ezE0oQUK005RxKeb3YkpgV0M"
Message-ID: <70f3a306-15e4-4eb1-82da-74818f35b437@intel.com>
Date: Mon, 9 Mar 2026 12:37:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/7] drm/xe/vm: Add madvise autoreset interval notifier
 worker infrastructure
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
References: <20260219091312.796749-1-arvind.yadav@intel.com>
 <20260219091312.796749-5-arvind.yadav@intel.com>
 <aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MA5P287CA0220.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CH8PR11MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2c182e-6f24-4f1e-2c1b-08de7daa82e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: x01BLU4q+/QP+YB32J/RLLVcCtzVh/g1GzXDc0DNib7JOV3hUk4DNLGEW2GaegysRQCp8AxHXkOOf9rPXpcqgYf21OEp5VARsszU8LnwF/PY7zIXH41QI0xnLId9XvLDVod+ux+eEz7dolAzJcro9Fd99LDMOstDcXT2oI40YL3o9IPiFyVzqQHMseqsIaQaFRU7mzEwM40JSbhf9bSO52O48fWGIuFeqC3opZnBmInL6cJKYyshgj3gw4GWp74wtuW2GdjQ3I+A/3u8BmDggb56eIgtyvUKfO9AO52weVbcOfU1Xp2AXWZRvnJSCEBXYUPj7D5okaTEHv3Tr19JNX+ZbHr7ShsbAGWUJ43qhAUc1naE5+74lAFuoRbLk0oNtf9F6XSt65sMwxn9cHJr6P8xEW9UzSDEeQj8OD59mFSBvqSHJmGD1wp5vnIM9bNhaaqveeduLCVksOF2L+mVfiTvlBazfs6sKhoAd+Sg2G2lrJvn3nFUkYznZYmaPsMjK+Sy1nNFl/GKRVDxcwQAinVal9oBcy4cNUp4rYWaO3qC74nwtBGQ7YOj5jGO7ZVJsyKC9paOMJDI/kb3YE6gV/UIMHM+vnRJtZxzKr1OHzT3oIbTQFBzYgAwkLRZM65T3oW4YfEvBmFskMdc6tAs10eitZP+hvGliHlP+Hl5dsT59LPPZpb/jl8oPTgNmbm+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHQzVjMxcGxYSGN2NEhxR2ltOFVPaGVreWtxaCtBN1E1aURiUnFLVlRrZkFC?=
 =?utf-8?B?d1pDdWJmWHcyR0VjQm9KQlNOSTg0bHRuV1lrNzQ2N3B5YVNGVURvT3RZeTRq?=
 =?utf-8?B?ZXY5akt1UTZHOE9IcjdYa0tZU3NZaXZiZEl1aDhwWlhxZ3BSY0NRL0xLV2J5?=
 =?utf-8?B?THRMaGtFTW1TdnpjVmxoUGlKbDVyKzY0YzByaWdUSUVTS2REMmxjZHB2YXcw?=
 =?utf-8?B?R0NaNjhsdkVodTlPSmlQUWdQVC8zdGErU29XWXJqenZNTUhHZ1RJZ1h0bFJr?=
 =?utf-8?B?anRIYm9tRC83eWVtd1B0Z0NYcnRsWTdKYmpHN2pIV1BUR0xvRjRBMkpCOUNK?=
 =?utf-8?B?bGxpV1ZIL1YwT1dqaENNNHM0R1dlRU9YSzNsQVk3OGNBRlROajBhNC80WXVv?=
 =?utf-8?B?NXFaZVZmaUV3bUJsTlpKcXVoWkc4M3JOZHlVMGRZRHRGSEVrM1E1eFNOY1Z3?=
 =?utf-8?B?eEE5ZUpmbU0xeDJ4dzFvTHF0ekhMMHdJSjZYTXdOWHgyZ2QyYkxWL2dOdEtJ?=
 =?utf-8?B?S0t4UndCZzZJb0FjdnZ3ZHptYmNtdDBLeFdoaHBlTzdsaXllRCtJNjlmY3Fw?=
 =?utf-8?B?dlNtZUI1N2NJelJPQ0RvVUhVNHVwRE91QWNDY0lVRmc4SFdsZGx4bW1FNFc2?=
 =?utf-8?B?S3psV3I1cGQ0R3NwcnBGMXdtcjlEczdvUm5ZdmpBd1d0ZjIvOFRTaldQWHpS?=
 =?utf-8?B?a1lUSGhxeGRGbUI3ci9NbFROUVExWlF0Z1dJYmRlT1hNQzRZTEhpRzB2bmdP?=
 =?utf-8?B?RmFaYSsrK0FOTmZGOFVmVG9laVlKMUdaMFo0dHZzUHpzNzB2Wjd5NTdOSGxD?=
 =?utf-8?B?S1NRckJiblRKQXZob25mSDhKMGZibFFIamhTUVRIQUpDMmVERndJQkxRS3ND?=
 =?utf-8?B?R1ZqZ1k1OG1qR1VjK1MvTHN2NmVNZUQ3UzBMTnZZVHN3U29ucVJkRVFMaG9x?=
 =?utf-8?B?dERLR2EyV2RtUjhiWFFweVY0RERnc2U4QWxUUXVteEFWOEZqMXNndTIwQ2ZV?=
 =?utf-8?B?cXpYU0RhRWpqSm5COHJsZjJ5bVM2U2hwVS9VdWpsY1Z1OVdUMVFrcThJSWRk?=
 =?utf-8?B?M0JxSzZsNWNDa2wxV1JHNThyNklzOEl4R05zTmFFVm1ybmhOWXgxdFRGZUI5?=
 =?utf-8?B?ZjlIS1VweGpWRUk4em9BcnpDQnRYcm9EcFUxZ1ZQZVR0SHBHM0hiZmJOVGlh?=
 =?utf-8?B?cittM2lkZE5nOFVSQW5iSDkwelIrRzhGK2VQRk11TW1LNm54VFUwcG5mQ1JN?=
 =?utf-8?B?UU0xcHg4cDhUdHI4U3JycmxrL0ZtcUtsWCtic05NZEdYTzFhRENpSCtoSHEv?=
 =?utf-8?B?QTFXcGlOTXhTVHZvdGVVWU5iSC9raEdSbVlOY01HYlhiMFkvZks2ZTFqbTY1?=
 =?utf-8?B?VDl1L0M3TDhHMmcvRFZiaHZ1UEIxS0FHU3lPT1lmSllSRzN3WjBTMGs0RFhO?=
 =?utf-8?B?dXZ2NWtubENmcWZ4VU9HYzFueDZYSXg2aUtMbUZMejNIYjZ0YUsxRkszTE15?=
 =?utf-8?B?cisxc1Q2OVltNzdtR2FnNERyUFlFaVlxUlRrOGhZOWVuUHFYYUU2dW9DV3Mz?=
 =?utf-8?B?dDhRTXVKWmtHeHVteVdqSlRHS3JNQUZiTGcyeUlQY0FOUTZHN0ZzY3kva3gw?=
 =?utf-8?B?ZmxYRDFJeFRmM2Q0YUVTamFTRSsxWVJkZmhFUmpHYWlrWSthWXJNSlZaVENS?=
 =?utf-8?B?QmJOdUZXWS9IcXFvVDFpUnJ5UWovbVRva3ZMTFJNTmJHNnpPRVhmcEwyZkZj?=
 =?utf-8?B?VzMvUXpwaUpUY2MvOEt0UFY0T2c0eGtJaHdvK1BLMDkrdzFaV29oOXFXTjRi?=
 =?utf-8?B?NFpXVE1qY0N1NzR4T3R0Rk0vMUpPY1VyZm9ldVBJVE5xYk84bTBUY1VOS09B?=
 =?utf-8?B?cFBHU0N5Vk9EYzJzU3YvYUdrQnErYlBMT3RKYzFLdzFnMjdtdlVDU1d4d2FM?=
 =?utf-8?B?NWFSNnhpNHZvMzQzbGI0akQrd3FlVjUwbFI1LzJ5OHJScStYV2VoOVJsUmVv?=
 =?utf-8?B?aFlhRTRPRFhlb3pKY1dXOGNSR0VlNnFYcDJURmcxVzZtVjVpUzdxSHBub3ZT?=
 =?utf-8?B?Q3VxUUl2djBYSXkyRUFUWjFUeTBBelBrZ0NYcGNuWUxiTDFteEdnUDh6QnFz?=
 =?utf-8?B?aVJKcFVzRE92TDNzbjFNTGpRSlM4cE1Qc2QrU09FekZtak91Q0g4WVNCWElN?=
 =?utf-8?B?Ukk0aWUzUUY2cmZlWjRTb2ZmYkVWenNnRkFIUHlnWWNqb3VjN1UxVFh0QUhY?=
 =?utf-8?B?R1ZMdW1zcHZXSjF3aVRsYUw0a1ZobUNGTC9KMDE5U1dlY2Njbkc1ZytVb2hT?=
 =?utf-8?B?elpMYXBTRGxud0VFL296a0swY3NmTGI5RHZXbnlKVmRFeGRldG52UT09?=
X-Exchange-RoutingPolicyChecked: CwNID0H7Ig5J6C/ybJPr8g/ZiTLZyh3ZSZQut2zU+4/LG//9QLxJnx+ip7EB9cbRTU0Zs/sIAtrEzi0ySbBrlxyJX2vHv+xREwWgNXVbTMf+VGkqccE8rSJi+RfPplVCMUzjIeB/sW3WwWV2ClgYBNeoISaOjEnilysQFAoN82UQLzjcd+89CAun16xj723jRkZyw3qvxB66TwFii0Sm7gLPs9/maykmZjVeNZ5lXx0FMqjBH4TjWmtA0Bu8C+D9Gp06SbsQSuQC4se8tupQp7ec9uZVWcts5tXEN8H6DO5NL7bgMDe2xOBC/FaIPlxte9rayo4r2h5i44bPcj6dag==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2c182e-6f24-4f1e-2c1b-08de7daa82e3
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:07:23.1600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyvQ9ef2C/irtrpkvB9kIxZPtGkZ05+DMkBqaNqaIK6hOETcG68r3fVMh79iDSGv/+ZTkV36s2oPDHLIYpSnLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9483
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

--------------ezE0oQUK005RxKeb3YkpgV0M
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 26-02-2026 05:04, Matthew Brost wrote:
> On Thu, Feb 19, 2026 at 02:43:09PM +0530, Arvind Yadav wrote:
>> MADVISE_AUTORESET needs to reset VMA attributes when userspace unmaps
>> CPU-only ranges, but the MMU invalidate callback cannot take vm->lock
>> due to lock ordering (mmap_lock is already held).
>>
>> Add mmu_interval_notifier that queues work items for MMU_NOTIFY_UNMAP
>> events. The worker runs under vm->lock and resets attributes for VMAs
>> still marked XE_VMA_CPU_AUTORESET_ACTIVE (i.e., not yet GPU-touched).
>>
>> Work items are allocated from a mempool to handle atomic context in the
>> callback. The notifier is deactivated when GPU touches the VMA.
>>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 394 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |   8 +
>>   drivers/gpu/drm/xe/xe_vm_types.h   |  41 +++
>>   3 files changed, 443 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 52147f5eaaa0..4c0ffb100bcc 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -6,9 +6,12 @@
>>   #include "xe_vm_madvise.h"
>>   
>>   #include <linux/nospec.h>
>> +#include <linux/mempool.h>
>> +#include <linux/workqueue.h>
>>   #include <drm/xe_drm.h>
>>   
>>   #include "xe_bo.h"
>> +#include "xe_macros.h"
>>   #include "xe_pat.h"
>>   #include "xe_pt.h"
>>   #include "xe_svm.h"
>> @@ -500,3 +503,394 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>>   	xe_vm_put(vm);
>>   	return err;
>>   }
>> +
>> +/**
>> + * struct xe_madvise_work_item - Work item for unmap processing
>> + * @work: work_struct
>> + * @vm: VM reference
>> + * @pool: Mempool for recycling
>> + * @start: Start address
>> + * @end: End address
>> + */
>> +struct xe_madvise_work_item {
>> +	struct work_struct work;
>> +	struct xe_vm *vm;
>> +	mempool_t *pool;
> Why mempool? Seems like we could just do kmalloc with correct gfp flags.


I tried kmalloc first, but ran into two issues:
GFP_KERNEL — fails because MMU notifier callbacks must not block, and 
GFP_KERNEL can sleep waiting for memory reclaim.
GFP_ATOMIC — triggers a circular lockdep warning: the MMU notifier holds 
mmu_notifier_invalidate_range_start, and GFP_ATOMIC internally tries to 
acquire fs_reclaim, which already depends on the MMU notifier lock.

Agreed. mempool looks unnecessary here. I re-tested this with 
kmalloc(..., GFP_NOWAIT) and that avoids both blocking and the 
reclaim-related lockdep issue I saw with the earlier approach. I will 
switch to that and drop the pool in the next version.


>
>> +	u64 start;
>> +	u64 end;
>> +};
>> +
>> +static void xe_vma_set_default_attributes(struct xe_vma *vma)
>> +{
>> +	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
>> +	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
>> +	vma->attr.pat_index = vma->attr.default_pat_index;
>> +	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
>> +}
>> +
>> +/**
>> + * xe_vm_madvise_process_unmap - Process munmap for all VMAs in range
>> + * @vm: VM
>> + * @start: Start of unmap range
>> + * @end: End of unmap range
>> + *
>> + * Processes all VMAs overlapping the unmap range. An unmap can span multiple
>> + * VMAs, so we need to loop and process each segment.
>> + *
>> + * Return: 0 on success, negative error otherwise
>> + */
>> +static int xe_vm_madvise_process_unmap(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	u64 addr = start;
>> +	int err;
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	if (xe_vm_is_closed_or_banned(vm))
>> +		return 0;
>> +
>> +	while (addr < end) {
>> +		struct xe_vma *vma;
>> +		u64 seg_start, seg_end;
>> +		bool has_default_attr;
>> +
>> +		vma = xe_vm_find_overlapping_vma(vm, addr, end);
>> +		if (!vma)
>> +			break;
>> +
>> +		/* Skip GPU-touched VMAs - SVM handles them */
>> +		if (!xe_vma_has_cpu_autoreset_active(vma)) {
>> +			addr = xe_vma_end(vma);
>> +			continue;
>> +		}
>> +
>> +		has_default_attr = xe_vma_has_default_mem_attrs(vma);
>> +		seg_start = max(addr, xe_vma_start(vma));
>> +		seg_end = min(end, xe_vma_end(vma));
>> +
>> +		/* Expand for merging if VMA already has default attrs */
>> +		if (has_default_attr &&
>> +		    xe_vma_start(vma) >= start &&
>> +		    xe_vma_end(vma) <= end) {
>> +			seg_start = xe_vma_start(vma);
>> +			seg_end = xe_vma_end(vma);
>> +			xe_vm_find_cpu_addr_mirror_vma_range(vm, &seg_start, &seg_end);
>> +		} else if (xe_vma_start(vma) == seg_start && xe_vma_end(vma) == seg_end) {
>> +			xe_vma_set_default_attributes(vma);
>> +			addr = seg_end;
>> +			continue;
>> +		}
>> +
>> +		if (xe_vma_start(vma) == seg_start &&
>> +		    xe_vma_end(vma) == seg_end &&
>> +		    has_default_attr) {
>> +			addr = seg_end;
>> +			continue;
>> +		}
>> +
>> +		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, seg_start, seg_end - seg_start);
>> +		if (err) {
>> +			if (err == -ENOENT) {
>> +				addr = seg_end;
>> +				continue;
>> +			}
>> +			return err;
>> +		}
>> +
>> +		addr = seg_end;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_madvise_work_func - Worker to process unmap
>> + * @w: work_struct
>> + *
>> + * Processes a single unmap by taking vm->lock and calling the helper.
>> + * Each unmap has its own work item, so no interval loss.
>> + */
>> +static void xe_madvise_work_func(struct work_struct *w)
>> +{
>> +	struct xe_madvise_work_item *item = container_of(w, struct xe_madvise_work_item, work);
>> +	struct xe_vm *vm = item->vm;
>> +	int err;
>> +
>> +	down_write(&vm->lock);
>> +	err = xe_vm_madvise_process_unmap(vm, item->start, item->end);
>> +	if (err)
>> +		drm_warn(&vm->xe->drm,
>> +			 "madvise autoreset failed [%#llx-%#llx]: %d\n",
>> +			 item->start, item->end, err);
>> +	/*
>> +	 * Best-effort: Log failure and continue.
>> +	 * Core correctness from CPU_AUTORESET_ACTIVE flag.
>> +	 */
>> +	up_write(&vm->lock);
>> +	xe_vm_put(vm);
>> +	mempool_free(item, item->pool);
>> +}
>> +
>> +/**
>> + * xe_madvise_notifier_callback - MMU notifier callback for CPU munmap
>> + * @mni: mmu_interval_notifier
>> + * @range: mmu_notifier_range
>> + * @cur_seq: current sequence number
>> + *
>> + * Queues work to reset VMA attributes. Cannot take vm->lock (circular locking),
>> + * so uses workqueue. GFP_ATOMIC allocation may fail; drops event if so.
>> + *
>> + * Return: true (never blocks)
>> + */
>> +static bool xe_madvise_notifier_callback(struct mmu_interval_notifier *mni,
>> +					 const struct mmu_notifier_range *range,
>> +					 unsigned long cur_seq)
>> +{
>> +	struct xe_madvise_notifier *notifier =
>> +		container_of(mni, struct xe_madvise_notifier, mmu_notifier);
>> +	struct xe_vm *vm = notifier->vm;
>> +	struct xe_madvise_work_item *item;
>> +	struct workqueue_struct *wq;
>> +	mempool_t *pool;
>> +	u64 start, end;
>> +
>> +	if (range->event != MMU_NOTIFY_UNMAP)
>> +		return true;
>> +
>> +	/*
>> +	 * Best-effort: skip in non-blockable contexts to avoid building up work.
>> +	 * Correctness does not rely on this notifier - CPU_AUTORESET_ACTIVE flag
>> +	 * prevents GPU PTE zaps on CPU-only VMAs in the zap path.
>> +	 */
>> +	if (!mmu_notifier_range_blockable(range))
>> +		return true;
>> +
>> +	/* Consume seq (interval-notifier convention) */
>> +	mmu_interval_set_seq(mni, cur_seq);
>> +
>> +	/* Best-effort: core correctness from CPU_AUTORESET_ACTIVE check in zap path */
>> +
>> +	start = max_t(u64, range->start, notifier->vma_start);
>> +	end = min_t(u64, range->end, notifier->vma_end);
>> +
>> +	if (start >= end)
>> +		return true;
>> +
>> +	pool = READ_ONCE(vm->svm.madvise_work.pool);
>> +	wq = READ_ONCE(vm->svm.madvise_work.wq);
>> +	if (!pool || !wq || atomic_read(&vm->svm.madvise_work.closing))
> Can you explain the use of READ_ONCE, xchg, and atomics? At first glance
> it seems unnecessary or overly complicated. Let’s start with the problem
> this is trying to solve and see if we can find a simpler approach.
>
> My initial thought is a VM-wide rwsem, marked as reclaim-safe. The
> notifiers would take it in read mode to check whether the VM is tearing
> down, and the fini path would take it in write mode to initiate
> teardown...


Agreed. This got more complicated than it needs to be. I reworked it to 
use a VM-wide rw_semaphore for teardown serialization, so the atomic_t, 
READ_ONCE(), and xchg() go away..

>
>> +		return true;
>> +
>> +	/* GFP_ATOMIC to avoid fs_reclaim lockdep in notifier context */
>> +	item = mempool_alloc(pool, GFP_ATOMIC);
> Again, probably just use kmalloc. Also s/GFP_ATOMIC/GFP_NOWAIT. We
> really shouldn’t be using GFP_ATOMIC in Xe per the DRM docs unless a
> failed memory allocation would take down the device. We likely abuse
> GFP_ATOMIC in several places that we should clean up, but in this case
> it’s pretty clear GFP_NOWAIT is what we want, as failure isn’t
> fatal—just sub-optimal.


Agreed. This should be |GFP_NOWAIT|, not |GFP_ATOMIC|. Allocation 
failure here is non-fatal, so |GFP_NOWAIT| is the right fit. I willl 
switch to |kmalloc(..., GFP_NOWAIT)| and drop the mempool.

>
>> +	if (!item)
>> +		return true;
>> +
>> +	memset(item, 0, sizeof(*item));
>> +	INIT_WORK(&item->work, xe_madvise_work_func);
>> +	item->vm = xe_vm_get(vm);
>> +	item->pool = pool;
>> +	item->start = start;
>> +	item->end = end;
>> +
>> +	if (unlikely(atomic_read(&vm->svm.madvise_work.closing))) {
> Same as above the atomic usage...


Noted, Will remove.

>
>> +		xe_vm_put(item->vm);
>> +		mempool_free(item, pool);
>> +		return true;
>> +	}
>> +
>> +	queue_work(wq, &item->work);
>> +
>> +	return true;
>> +}
>> +
>> +static const struct mmu_interval_notifier_ops xe_madvise_notifier_ops = {
>> +	.invalidate = xe_madvise_notifier_callback,
>> +};
>> +
>> +/**
>> + * xe_vm_madvise_init - Initialize madvise notifier infrastructure
>> + * @vm: VM
>> + *
>> + * Sets up workqueue and mempool for async munmap processing.
>> + *
>> + * Return: 0 on success, -ENOMEM on failure
>> + */
>> +int xe_vm_madvise_init(struct xe_vm *vm)
>> +{
>> +	struct workqueue_struct *wq;
>> +	mempool_t *pool;
>> +
>> +	/* Always initialize list and mutex - fini may be called on partial init */
>> +	INIT_LIST_HEAD(&vm->svm.madvise_notifiers.list);
>> +	mutex_init(&vm->svm.madvise_notifiers.lock);
>> +
>> +	wq = READ_ONCE(vm->svm.madvise_work.wq);
>> +	pool = READ_ONCE(vm->svm.madvise_work.pool);
>> +
>> +	/* Guard against double initialization and detect partial init */
>> +	if (wq || pool) {
>> +		XE_WARN_ON(!wq || !pool);
>> +		return 0;
>> +	}
>> +
>> +	WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
>> +	WRITE_ONCE(vm->svm.madvise_work.pool, NULL);
>> +	atomic_set(&vm->svm.madvise_work.closing, 1);
>> +
>> +	/*
>> +	 * WQ_UNBOUND: best-effort optimization, not critical path.
>> +	 * No WQ_MEM_RECLAIM: worker allocates memory (VMA ops with GFP_KERNEL).
>> +	 * Not on reclaim path - merely resets attributes after munmap.
>> +	 */
>> +	vm->svm.madvise_work.wq = alloc_workqueue("xe_madvise", WQ_UNBOUND, 0);
>> +	if (!vm->svm.madvise_work.wq)
>> +		return -ENOMEM;
>> +
>> +	/* Mempool for GFP_ATOMIC allocs in notifier callback */
>> +	vm->svm.madvise_work.pool =
>> +		mempool_create_kmalloc_pool(64,
>> +					     sizeof(struct xe_madvise_work_item));
>> +	if (!vm->svm.madvise_work.pool) {
>> +		destroy_workqueue(vm->svm.madvise_work.wq);
>> +		WRITE_ONCE(vm->svm.madvise_work.wq, NULL);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	atomic_set(&vm->svm.madvise_work.closing, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_vm_madvise_fini - Cleanup all madvise notifiers
>> + * @vm: VM
>> + *
>> + * Tears down notifiers and drains workqueue. Safe if init partially failed.
>> + * Order: closing flag → remove notifiers (SRCU sync) → drain wq → destroy.
>> + */
>> +void xe_vm_madvise_fini(struct xe_vm *vm)
>> +{
>> +	struct xe_madvise_notifier *notifier, *next;
>> +	struct workqueue_struct *wq;
>> +	mempool_t *pool;
>> +	LIST_HEAD(tmp);
>> +
>> +	atomic_set(&vm->svm.madvise_work.closing, 1);
>> +
>> +	/*
>> +	 * Detach notifiers under lock, then remove outside lock (SRCU sync can be slow).
>> +	 * Splice avoids holding mutex across mmu_interval_notifier_remove() SRCU sync.
>> +	 * Removing notifiers first (before drain) prevents new invalidate callbacks.
>> +	 */
>> +	mutex_lock(&vm->svm.madvise_notifiers.lock);
>> +	list_splice_init(&vm->svm.madvise_notifiers.list, &tmp);
>> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
>> +
>> +	/* Now remove notifiers without holding lock - mmu_interval_notifier_remove() SRCU-syncs */
>> +	list_for_each_entry_safe(notifier, next, &tmp, list) {
>> +		list_del(&notifier->list);
>> +		mmu_interval_notifier_remove(&notifier->mmu_notifier);
>> +		xe_vm_put(notifier->vm);
>> +		kfree(notifier);
>> +	}
>> +
>> +	/* Drain and destroy workqueue */
>> +	wq = xchg(&vm->svm.madvise_work.wq, NULL);
>> +	if (wq) {
>> +		drain_workqueue(wq);
> Work items in wq call xe_madvise_work_func, which takes vm->lock in
> write mode. If we try to drain here after the work item executing
> xe_madvise_work_func has started or is queued, I think we could
> deadlock. Lockdep should complain about this if you run a test that
> triggers xe_madvise_work_func at least once — or at least it should. If
> it doesn’t, then workqueues likely have an issue in their lockdep
> implementation as 'drain_workqueue' should touch its lockdep map which
> has tainted vm->lock (i.e., is outside of it).
>
> So perhaps call this function without vm->lock and take as need in the
> this function, then drop it drain the work queue, etc...


Good catch. Draining the workqueue while holding |vm->lock| can deadlock 
against a worker that takes |vm->lock|. I fixed that by dropping 
|vm->lock| before |xe_vm_madvise_fini()|. In the reworked teardown path, 
|drain_workqueue()| runs with neither |vm->lock| nor the teardown 
semaphore held.


>
>> +		destroy_workqueue(wq);
>> +	}
>> +
>> +	pool = xchg(&vm->svm.madvise_work.pool, NULL);
>> +	if (pool)
>> +		mempool_destroy(pool);
>> +}
>> +
>> +/**
>> + * xe_vm_madvise_register_notifier_range - Register MMU notifier for address range
>> + * @vm: VM
>> + * @start: Start address (page-aligned)
>> + * @end: End address (page-aligned)
>> + *
>> + * Registers interval notifier for munmap tracking. Uses addresses (not VMA pointers)
>> + * to avoid UAF after dropping vm->lock. Deduplicates by range.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	struct xe_madvise_notifier *notifier, *existing;
>> +	int err;
>> +
> I see this isn’t called under the vm->lock write lock. Is there a reason
> not to? I think taking it under the write lock would help with the
> teardown sequence, since you wouldn’t be able to get here if
> xe_vm_is_closed_or_banned were stable—and we wouldn’t enter this
> function if that helper returned true.


I can make the closed/banned check stable at the call site under 
|vm->lock|, but I don’t think I can hold it across 
|mmu_interval_notifier_insert()| itself since that may take |mmap_lock| 
internally. I’ll restructure this so the state check happens under 
|vm->lock|, while the actual insert remains outside that lock.

>
>> +	if (!IS_ALIGNED(start, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
>> +		return -EINVAL;
>> +
>> +	if (WARN_ON_ONCE(end <= start))
>> +		return -EINVAL;
>> +
>> +	if (atomic_read(&vm->svm.madvise_work.closing))
>> +		return -ENOENT;
>> +
>> +	if (!READ_ONCE(vm->svm.madvise_work.wq) ||
>> +	    !READ_ONCE(vm->svm.madvise_work.pool))
>> +		return -ENOMEM;
>> +
>> +	/* Check mm early to avoid allocation if it's missing */
>> +	if (!vm->svm.gpusvm.mm)
>> +		return -EINVAL;
>> +
>> +	/* Dedupe: check if notifier exists for this range */
>> +	mutex_lock(&vm->svm.madvise_notifiers.lock);
> If we had the vm->lock in write mode we could likely just drop
> svm.madvise_notifiers.lock for now, but once we move to fine grained
> locking in page faults [1] we'd in fact need a dedicated lock. So let's
> keep this.
>
> [1]https://patchwork.freedesktop.org/patch/707238/?series=162167&rev=2


Agreed. We should keep a dedicated lock here.

I donot think |vm->lock| can cover |mmu_interval_notifier_insert()| 
itself, since that path may take |mmap_lock| internally and would risk 
inverting the existing |mmap_lock -> vm->lock| ordering.

So I will keep |svm.madvise_notifiers.lock| in place. That also lines up 
better with the planned fine-grained page-fault locking work.

>
>> +	list_for_each_entry(existing, &vm->svm.madvise_notifiers.list, list) {
>> +		if (existing->vma_start == start && existing->vma_end == end) {
> This is O(N) which typically isn't ideal. Better structure here? mtree?
> Does an mtree have its own locking so svm.madvise_notifiers.lock could
> just be dropped? I'd look into this.


Agreed. I switched this over to a maple tree, so the exact-range lookup 
is no longer O(N). That also lets me drop the list walk in the duplicate 
check.

>
>> +			mutex_unlock(&vm->svm.madvise_notifiers.lock);
>> +			return 0;
>> +		}
>> +	}
>> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
>> +
>> +	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
>> +	if (!notifier)
>> +		return -ENOMEM;
>> +
>> +	notifier->vm = xe_vm_get(vm);
>> +	notifier->vma_start = start;
>> +	notifier->vma_end = end;
>> +	INIT_LIST_HEAD(&notifier->list);
>> +
>> +	err = mmu_interval_notifier_insert(&notifier->mmu_notifier,
>> +					   vm->svm.gpusvm.mm,
>> +					   start,
>> +					   end - start,
>> +					   &xe_madvise_notifier_ops);
>> +	if (err) {
>> +		xe_vm_put(notifier->vm);
>> +		kfree(notifier);
>> +		return err;
>> +	}
>> +
>> +	/* Re-check closing to avoid teardown race */
>> +	if (unlikely(atomic_read(&vm->svm.madvise_work.closing))) {
>> +		mmu_interval_notifier_remove(&notifier->mmu_notifier);
>> +		xe_vm_put(notifier->vm);
>> +		kfree(notifier);
>> +		return -ENOENT;
>> +	}
>> +
>> +	/* Add to list - check again for concurrent registration race */
>> +	mutex_lock(&vm->svm.madvise_notifiers.lock);
> If we had the vm->lock in write mode, we couldn't get concurrent
> registrations.
>
> I likely have more comments, but I have enough concerns with the locking
> and structure in this patch that I’m going to pause reviewing the series
> until most of my comments are addressed. It’s hard to focus on anything
> else until we get these issues worked out.


I think the main issue is exactly the locking story around notifier 
insert/remove. We cannot hold |vm->lock| across 
|mmu_interval_notifier_insert()| because that may take |mmap_lock| 
internally and invert the existing ordering.

I have reworked this to simplify the teardown/registration side: drop 
the atomic/READ_ONCE/xchg handling, use a single teardown |rwsem|, and 
replace the list-based dedupe with a maple tree.
I will send a cleaned-up version with the locking documented more 
clearly. Sorry for the churn here.


Thanks,
Arvind

>
> Matt
>
>> +	list_for_each_entry(existing, &vm->svm.madvise_notifiers.list, list) {
>> +		if (existing->vma_start == start && existing->vma_end == end) {
>> +			mutex_unlock(&vm->svm.madvise_notifiers.lock);
>> +			mmu_interval_notifier_remove(&notifier->mmu_notifier);
>> +			xe_vm_put(notifier->vm);
>> +			kfree(notifier);
>> +			return 0;
>> +		}
>> +	}
>> +	list_add(&notifier->list, &vm->svm.madvise_notifiers.list);
>> +	mutex_unlock(&vm->svm.madvise_notifiers.lock);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> index b0e1fc445f23..ba9cd7912113 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -6,10 +6,18 @@
>>   #ifndef _XE_VM_MADVISE_H_
>>   #define _XE_VM_MADVISE_H_
>>   
>> +#include <linux/types.h>
>> +
>>   struct drm_device;
>>   struct drm_file;
>> +struct xe_vm;
>> +struct xe_vma;
>>   
>>   int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   
>> +int xe_vm_madvise_init(struct xe_vm *vm);
>> +void xe_vm_madvise_fini(struct xe_vm *vm);
>> +int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 29ff63503d4c..eb978995000c 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -12,6 +12,7 @@
>>   
>>   #include <linux/dma-resv.h>
>>   #include <linux/kref.h>
>> +#include <linux/mempool.h>
>>   #include <linux/mmu_notifier.h>
>>   #include <linux/scatterlist.h>
>>   
>> @@ -29,6 +30,26 @@ struct xe_user_fence;
>>   struct xe_vm;
>>   struct xe_vm_pgtable_update_op;
>>   
>> +/**
>> + * struct xe_madvise_notifier - CPU madvise notifier for memory attribute reset
>> + *
>> + * Tracks CPU munmap operations on SVM CPU address mirror VMAs.
>> + * When userspace unmaps CPU memory, this notifier processes attribute reset
>> + * via work queue to avoid circular locking (can't take vm->lock in callback).
>> + */
>> +struct xe_madvise_notifier {
>> +	/** @mmu_notifier: MMU interval notifier */
>> +	struct mmu_interval_notifier mmu_notifier;
>> +	/** @vm: VM this notifier belongs to (holds reference via xe_vm_get) */
>> +	struct xe_vm *vm;
>> +	/** @vma_start: Start address of VMA being tracked */
>> +	u64 vma_start;
>> +	/** @vma_end: End address of VMA being tracked */
>> +	u64 vma_end;
>> +	/** @list: Link in vm->svm.madvise_notifiers.list */
>> +	struct list_head list;
>> +};
>> +
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>   #define TEST_VM_OPS_ERROR
>>   #define FORCE_OP_ERROR	BIT(31)
>> @@ -212,6 +233,26 @@ struct xe_vm {
>>   		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
>>   		/** @svm.peer: Used for pagemap connectivity computations. */
>>   		struct drm_pagemap_peer peer;
>> +
>> +		/**
>> +		 * @svm.madvise_notifiers: Active CPU madvise notifiers
>> +		 */
>> +		struct {
>> +			/** @svm.madvise_notifiers.list: List of active notifiers */
>> +			struct list_head list;
>> +			/** @svm.madvise_notifiers.lock: Protects notifiers list */
>> +			struct mutex lock;
>> +		} madvise_notifiers;
>> +
>> +		/** @svm.madvise_work: Workqueue for async munmap processing */
>> +		struct {
>> +			/** @svm.madvise_work.wq: Workqueue */
>> +			struct workqueue_struct *wq;
>> +			/** @svm.madvise_work.pool: Mempool for work items */
>> +			mempool_t *pool;
>> +			/** @svm.madvise_work.closing: Teardown flag */
>> +			atomic_t closing;
>> +		} madvise_work;
>>   	} svm;
>>   
>>   	struct xe_device *xe;
>> -- 
>> 2.43.0
>>
--------------ezE0oQUK005RxKeb3YkpgV0M
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26-02-2026 05:04, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Feb 19, 2026 at 02:43:09PM +0530, Arvind Yadav wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">MADVISE_AUTORESET needs to reset VMA attributes when userspace unmaps
CPU-only ranges, but the MMU invalidate callback cannot take vm-&gt;lock
due to lock ordering (mmap_lock is already held).

Add mmu_interval_notifier that queues work items for MMU_NOTIFY_UNMAP
events. The worker runs under vm-&gt;lock and resets attributes for VMAs
still marked XE_VMA_CPU_AUTORESET_ACTIVE (i.e., not yet GPU-touched).

Work items are allocated from a mempool to handle atomic context in the
callback. The notifier is deactivated when GPU touches the VMA.

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Arvind Yadav <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 394 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.h |   8 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  41 +++
 3 files changed, 443 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 52147f5eaaa0..4c0ffb100bcc 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -6,9 +6,12 @@
 #include &quot;xe_vm_madvise.h&quot;
 
 #include &lt;linux/nospec.h&gt;
+#include &lt;linux/mempool.h&gt;
+#include &lt;linux/workqueue.h&gt;
 #include &lt;drm/xe_drm.h&gt;
 
 #include &quot;xe_bo.h&quot;
+#include &quot;xe_macros.h&quot;
 #include &quot;xe_pat.h&quot;
 #include &quot;xe_pt.h&quot;
 #include &quot;xe_svm.h&quot;
@@ -500,3 +503,394 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	xe_vm_put(vm);
 	return err;
 }
+
+/**
+ * struct xe_madvise_work_item - Work item for unmap processing
+ * @work: work_struct
+ * @vm: VM reference
+ * @pool: Mempool for recycling
+ * @start: Start address
+ * @end: End address
+ */
+struct xe_madvise_work_item {
+	struct work_struct work;
+	struct xe_vm *vm;
+	mempool_t *pool;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why mempool? Seems like we could just do kmalloc with correct gfp flags.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I tried kmalloc first, but ran into two issues:<br>
      GFP_KERNEL — fails because MMU notifier callbacks must not block,
      and GFP_KERNEL can sleep waiting for memory reclaim.<br>
      GFP_ATOMIC — triggers a circular lockdep warning: the MMU notifier
      holds mmu_notifier_invalidate_range_start, and GFP_ATOMIC
      internally tries to acquire fs_reclaim, which already depends on
      the MMU notifier lock.<br>
      <br>
      Agreed. mempool looks unnecessary here. I re-tested this with
      kmalloc(..., GFP_NOWAIT) and that avoids both blocking and the
      reclaim-related lockdep issue I saw with the earlier approach. I
      will switch to that and drop the pool in the next version.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	u64 start;
+	u64 end;
+};
+
+static void xe_vma_set_default_attributes(struct xe_vma *vma)
+{
+	vma-&gt;attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
+	vma-&gt;attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
+	vma-&gt;attr.pat_index = vma-&gt;attr.default_pat_index;
+	vma-&gt;attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
+}
+
+/**
+ * xe_vm_madvise_process_unmap - Process munmap for all VMAs in range
+ * @vm: VM
+ * @start: Start of unmap range
+ * @end: End of unmap range
+ *
+ * Processes all VMAs overlapping the unmap range. An unmap can span multiple
+ * VMAs, so we need to loop and process each segment.
+ *
+ * Return: 0 on success, negative error otherwise
+ */
+static int xe_vm_madvise_process_unmap(struct xe_vm *vm, u64 start, u64 end)
+{
+	u64 addr = start;
+	int err;
+
+	lockdep_assert_held_write(&amp;vm-&gt;lock);
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return 0;
+
+	while (addr &lt; end) {
+		struct xe_vma *vma;
+		u64 seg_start, seg_end;
+		bool has_default_attr;
+
+		vma = xe_vm_find_overlapping_vma(vm, addr, end);
+		if (!vma)
+			break;
+
+		/* Skip GPU-touched VMAs - SVM handles them */
+		if (!xe_vma_has_cpu_autoreset_active(vma)) {
+			addr = xe_vma_end(vma);
+			continue;
+		}
+
+		has_default_attr = xe_vma_has_default_mem_attrs(vma);
+		seg_start = max(addr, xe_vma_start(vma));
+		seg_end = min(end, xe_vma_end(vma));
+
+		/* Expand for merging if VMA already has default attrs */
+		if (has_default_attr &amp;&amp;
+		    xe_vma_start(vma) &gt;= start &amp;&amp;
+		    xe_vma_end(vma) &lt;= end) {
+			seg_start = xe_vma_start(vma);
+			seg_end = xe_vma_end(vma);
+			xe_vm_find_cpu_addr_mirror_vma_range(vm, &amp;seg_start, &amp;seg_end);
+		} else if (xe_vma_start(vma) == seg_start &amp;&amp; xe_vma_end(vma) == seg_end) {
+			xe_vma_set_default_attributes(vma);
+			addr = seg_end;
+			continue;
+		}
+
+		if (xe_vma_start(vma) == seg_start &amp;&amp;
+		    xe_vma_end(vma) == seg_end &amp;&amp;
+		    has_default_attr) {
+			addr = seg_end;
+			continue;
+		}
+
+		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, seg_start, seg_end - seg_start);
+		if (err) {
+			if (err == -ENOENT) {
+				addr = seg_end;
+				continue;
+			}
+			return err;
+		}
+
+		addr = seg_end;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_madvise_work_func - Worker to process unmap
+ * @w: work_struct
+ *
+ * Processes a single unmap by taking vm-&gt;lock and calling the helper.
+ * Each unmap has its own work item, so no interval loss.
+ */
+static void xe_madvise_work_func(struct work_struct *w)
+{
+	struct xe_madvise_work_item *item = container_of(w, struct xe_madvise_work_item, work);
+	struct xe_vm *vm = item-&gt;vm;
+	int err;
+
+	down_write(&amp;vm-&gt;lock);
+	err = xe_vm_madvise_process_unmap(vm, item-&gt;start, item-&gt;end);
+	if (err)
+		drm_warn(&amp;vm-&gt;xe-&gt;drm,
+			 &quot;madvise autoreset failed [%#llx-%#llx]: %d\n&quot;,
+			 item-&gt;start, item-&gt;end, err);
+	/*
+	 * Best-effort: Log failure and continue.
+	 * Core correctness from CPU_AUTORESET_ACTIVE flag.
+	 */
+	up_write(&amp;vm-&gt;lock);
+	xe_vm_put(vm);
+	mempool_free(item, item-&gt;pool);
+}
+
+/**
+ * xe_madvise_notifier_callback - MMU notifier callback for CPU munmap
+ * @mni: mmu_interval_notifier
+ * @range: mmu_notifier_range
+ * @cur_seq: current sequence number
+ *
+ * Queues work to reset VMA attributes. Cannot take vm-&gt;lock (circular locking),
+ * so uses workqueue. GFP_ATOMIC allocation may fail; drops event if so.
+ *
+ * Return: true (never blocks)
+ */
+static bool xe_madvise_notifier_callback(struct mmu_interval_notifier *mni,
+					 const struct mmu_notifier_range *range,
+					 unsigned long cur_seq)
+{
+	struct xe_madvise_notifier *notifier =
+		container_of(mni, struct xe_madvise_notifier, mmu_notifier);
+	struct xe_vm *vm = notifier-&gt;vm;
+	struct xe_madvise_work_item *item;
+	struct workqueue_struct *wq;
+	mempool_t *pool;
+	u64 start, end;
+
+	if (range-&gt;event != MMU_NOTIFY_UNMAP)
+		return true;
+
+	/*
+	 * Best-effort: skip in non-blockable contexts to avoid building up work.
+	 * Correctness does not rely on this notifier - CPU_AUTORESET_ACTIVE flag
+	 * prevents GPU PTE zaps on CPU-only VMAs in the zap path.
+	 */
+	if (!mmu_notifier_range_blockable(range))
+		return true;
+
+	/* Consume seq (interval-notifier convention) */
+	mmu_interval_set_seq(mni, cur_seq);
+
+	/* Best-effort: core correctness from CPU_AUTORESET_ACTIVE check in zap path */
+
+	start = max_t(u64, range-&gt;start, notifier-&gt;vma_start);
+	end = min_t(u64, range-&gt;end, notifier-&gt;vma_end);
+
+	if (start &gt;= end)
+		return true;
+
+	pool = READ_ONCE(vm-&gt;svm.madvise_work.pool);
+	wq = READ_ONCE(vm-&gt;svm.madvise_work.wq);
+	if (!pool || !wq || atomic_read(&amp;vm-&gt;svm.madvise_work.closing))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can you explain the use of READ_ONCE, xchg, and atomics? At first glance
it seems unnecessary or overly complicated. Let’s start with the problem
this is trying to solve and see if we can find a simpler approach.

My initial thought is a VM-wide rwsem, marked as reclaim-safe. The
notifiers would take it in read mode to check whether the VM is tearing
down, and the fini path would take it in write mode to initiate
teardown...</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Agreed. This got more complicated than it needs to be. I reworked
      it to use a VM-wide rw_semaphore for teardown serialization, so
      the atomic_t, READ_ONCE(), and xchg() go away..<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		return true;
+
+	/* GFP_ATOMIC to avoid fs_reclaim lockdep in notifier context */
+	item = mempool_alloc(pool, GFP_ATOMIC);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Again, probably just use kmalloc. Also s/GFP_ATOMIC/GFP_NOWAIT. We
really shouldn’t be using GFP_ATOMIC in Xe per the DRM docs unless a
failed memory allocation would take down the device. We likely abuse
GFP_ATOMIC in several places that we should clean up, but in this case
it’s pretty clear GFP_NOWAIT is what we want, as failure isn’t
fatal—just sub-optimal.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Agreed. This should be <code data-start="3307" data-end="3319">GFP_NOWAIT</code>,
      not <code data-start="3325" data-end="3337">GFP_ATOMIC</code>.
      Allocation failure here is non-fatal, so <code data-start="3380" data-end="3392">GFP_NOWAIT</code> is the right fit. I willl
      switch to <code data-start="3426" data-end="3452">kmalloc(...,
        GFP_NOWAIT)</code> and drop the mempool.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	if (!item)
+		return true;
+
+	memset(item, 0, sizeof(*item));
+	INIT_WORK(&amp;item-&gt;work, xe_madvise_work_func);
+	item-&gt;vm = xe_vm_get(vm);
+	item-&gt;pool = pool;
+	item-&gt;start = start;
+	item-&gt;end = end;
+
+	if (unlikely(atomic_read(&amp;vm-&gt;svm.madvise_work.closing))) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Same as above the atomic usage...</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Noted, Will remove.</p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		xe_vm_put(item-&gt;vm);
+		mempool_free(item, pool);
+		return true;
+	}
+
+	queue_work(wq, &amp;item-&gt;work);
+
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops xe_madvise_notifier_ops = {
+	.invalidate = xe_madvise_notifier_callback,
+};
+
+/**
+ * xe_vm_madvise_init - Initialize madvise notifier infrastructure
+ * @vm: VM
+ *
+ * Sets up workqueue and mempool for async munmap processing.
+ *
+ * Return: 0 on success, -ENOMEM on failure
+ */
+int xe_vm_madvise_init(struct xe_vm *vm)
+{
+	struct workqueue_struct *wq;
+	mempool_t *pool;
+
+	/* Always initialize list and mutex - fini may be called on partial init */
+	INIT_LIST_HEAD(&amp;vm-&gt;svm.madvise_notifiers.list);
+	mutex_init(&amp;vm-&gt;svm.madvise_notifiers.lock);
+
+	wq = READ_ONCE(vm-&gt;svm.madvise_work.wq);
+	pool = READ_ONCE(vm-&gt;svm.madvise_work.pool);
+
+	/* Guard against double initialization and detect partial init */
+	if (wq || pool) {
+		XE_WARN_ON(!wq || !pool);
+		return 0;
+	}
+
+	WRITE_ONCE(vm-&gt;svm.madvise_work.wq, NULL);
+	WRITE_ONCE(vm-&gt;svm.madvise_work.pool, NULL);
+	atomic_set(&amp;vm-&gt;svm.madvise_work.closing, 1);
+
+	/*
+	 * WQ_UNBOUND: best-effort optimization, not critical path.
+	 * No WQ_MEM_RECLAIM: worker allocates memory (VMA ops with GFP_KERNEL).
+	 * Not on reclaim path - merely resets attributes after munmap.
+	 */
+	vm-&gt;svm.madvise_work.wq = alloc_workqueue(&quot;xe_madvise&quot;, WQ_UNBOUND, 0);
+	if (!vm-&gt;svm.madvise_work.wq)
+		return -ENOMEM;
+
+	/* Mempool for GFP_ATOMIC allocs in notifier callback */
+	vm-&gt;svm.madvise_work.pool =
+		mempool_create_kmalloc_pool(64,
+					     sizeof(struct xe_madvise_work_item));
+	if (!vm-&gt;svm.madvise_work.pool) {
+		destroy_workqueue(vm-&gt;svm.madvise_work.wq);
+		WRITE_ONCE(vm-&gt;svm.madvise_work.wq, NULL);
+		return -ENOMEM;
+	}
+
+	atomic_set(&amp;vm-&gt;svm.madvise_work.closing, 0);
+
+	return 0;
+}
+
+/**
+ * xe_vm_madvise_fini - Cleanup all madvise notifiers
+ * @vm: VM
+ *
+ * Tears down notifiers and drains workqueue. Safe if init partially failed.
+ * Order: closing flag → remove notifiers (SRCU sync) → drain wq → destroy.
+ */
+void xe_vm_madvise_fini(struct xe_vm *vm)
+{
+	struct xe_madvise_notifier *notifier, *next;
+	struct workqueue_struct *wq;
+	mempool_t *pool;
+	LIST_HEAD(tmp);
+
+	atomic_set(&amp;vm-&gt;svm.madvise_work.closing, 1);
+
+	/*
+	 * Detach notifiers under lock, then remove outside lock (SRCU sync can be slow).
+	 * Splice avoids holding mutex across mmu_interval_notifier_remove() SRCU sync.
+	 * Removing notifiers first (before drain) prevents new invalidate callbacks.
+	 */
+	mutex_lock(&amp;vm-&gt;svm.madvise_notifiers.lock);
+	list_splice_init(&amp;vm-&gt;svm.madvise_notifiers.list, &amp;tmp);
+	mutex_unlock(&amp;vm-&gt;svm.madvise_notifiers.lock);
+
+	/* Now remove notifiers without holding lock - mmu_interval_notifier_remove() SRCU-syncs */
+	list_for_each_entry_safe(notifier, next, &amp;tmp, list) {
+		list_del(&amp;notifier-&gt;list);
+		mmu_interval_notifier_remove(&amp;notifier-&gt;mmu_notifier);
+		xe_vm_put(notifier-&gt;vm);
+		kfree(notifier);
+	}
+
+	/* Drain and destroy workqueue */
+	wq = xchg(&amp;vm-&gt;svm.madvise_work.wq, NULL);
+	if (wq) {
+		drain_workqueue(wq);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Work items in wq call xe_madvise_work_func, which takes vm-&gt;lock in
write mode. If we try to drain here after the work item executing
xe_madvise_work_func has started or is queued, I think we could
deadlock. Lockdep should complain about this if you run a test that
triggers xe_madvise_work_func at least once — or at least it should. If
it doesn’t, then workqueues likely have an issue in their lockdep
implementation as 'drain_workqueue' should touch its lockdep map which
has tainted vm-&gt;lock (i.e., is outside of it).

So perhaps call this function without vm-&gt;lock and take as need in the
this function, then drop it drain the work queue, etc...</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Good catch. Draining the workqueue while holding <code data-start="3664" data-end="3674">vm-&gt;lock</code> can
      deadlock against a worker that takes <code data-start="3716" data-end="3726">vm-&gt;lock</code>. I fixed that by dropping <code data-start="3753" data-end="3763">vm-&gt;lock</code> before <code data-start="3771" data-end="3793">xe_vm_madvise_fini()</code>.
      In the reworked teardown path, <code data-start="3826" data-end="3845">drain_workqueue()</code> runs with neither <code data-start="3864" data-end="3874">vm-&gt;lock</code> nor the
      teardown semaphore held.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		destroy_workqueue(wq);
+	}
+
+	pool = xchg(&amp;vm-&gt;svm.madvise_work.pool, NULL);
+	if (pool)
+		mempool_destroy(pool);
+}
+
+/**
+ * xe_vm_madvise_register_notifier_range - Register MMU notifier for address range
+ * @vm: VM
+ * @start: Start address (page-aligned)
+ * @end: End address (page-aligned)
+ *
+ * Registers interval notifier for munmap tracking. Uses addresses (not VMA pointers)
+ * to avoid UAF after dropping vm-&gt;lock. Deduplicates by range.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end)
+{
+	struct xe_madvise_notifier *notifier, *existing;
+	int err;
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I see this isn’t called under the vm-&gt;lock write lock. Is there a reason
not to? I think taking it under the write lock would help with the
teardown sequence, since you wouldn’t be able to get here if
xe_vm_is_closed_or_banned were stable—and we wouldn’t enter this
function if that helper returned true.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I can make the closed/banned check stable at the call site under
      <code data-start="4362" data-end="4372">vm-&gt;lock</code>, but I
      don’t think I can hold it across <code data-start="4413" data-end="4445">mmu_interval_notifier_insert()</code> itself
      since that may take <code data-start="4473" data-end="4484">mmap_lock</code>
      internally. I’ll restructure this so the state check happens under
      <code data-start="4552" data-end="4562">vm-&gt;lock</code>, while
      the actual insert remains outside that lock.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	if (!IS_ALIGNED(start, PAGE_SIZE) || !IS_ALIGNED(end, PAGE_SIZE))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(end &lt;= start))
+		return -EINVAL;
+
+	if (atomic_read(&amp;vm-&gt;svm.madvise_work.closing))
+		return -ENOENT;
+
+	if (!READ_ONCE(vm-&gt;svm.madvise_work.wq) ||
+	    !READ_ONCE(vm-&gt;svm.madvise_work.pool))
+		return -ENOMEM;
+
+	/* Check mm early to avoid allocation if it's missing */
+	if (!vm-&gt;svm.gpusvm.mm)
+		return -EINVAL;
+
+	/* Dedupe: check if notifier exists for this range */
+	mutex_lock(&amp;vm-&gt;svm.madvise_notifiers.lock);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If we had the vm-&gt;lock in write mode we could likely just drop
svm.madvise_notifiers.lock for now, but once we move to fine grained
locking in page faults [1] we'd in fact need a dedicated lock. So let's
keep this.

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/707238/?series=162167&amp;rev=2">https://patchwork.freedesktop.org/patch/707238/?series=162167&amp;rev=2</a></pre>
    </blockquote>
    <p data-start="663" data-end="708"><br>
    </p>
    <p data-start="663" data-end="708">Agreed. We should keep a
      dedicated lock here.</p>
    <p data-start="714" data-end="909">I donot think <code data-start="728" data-end="738">vm-&gt;lock</code> can cover <code data-start="749" data-end="781">mmu_interval_notifier_insert()</code>
      itself, since that path may take <code data-start="815" data-end="826">mmap_lock</code> internally and would risk
      inverting the existing <code data-start="876" data-end="899">mmap_lock
        -&gt; vm-&gt;lock</code> ordering.</p>
    <p data-start="915" data-end="1047">So I will keep <code data-start="928" data-end="956">svm.madvise_notifiers.lock</code>
      in place. That also lines up better with the planned fine-grained
      page-fault locking work.</p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	list_for_each_entry(existing, &amp;vm-&gt;svm.madvise_notifiers.list, list) {
+		if (existing-&gt;vma_start == start &amp;&amp; existing-&gt;vma_end == end) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is O(N) which typically isn't ideal. Better structure here? mtree?
Does an mtree have its own locking so svm.madvise_notifiers.lock could
just be dropped? I'd look into this.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Agreed. I switched this over to a maple tree, so the exact-range
      lookup is no longer O(N). That also lets me drop the list walk in
      the duplicate check.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+			mutex_unlock(&amp;vm-&gt;svm.madvise_notifiers.lock);
+			return 0;
+		}
+	}
+	mutex_unlock(&amp;vm-&gt;svm.madvise_notifiers.lock);
+
+	notifier = kzalloc(sizeof(*notifier), GFP_KERNEL);
+	if (!notifier)
+		return -ENOMEM;
+
+	notifier-&gt;vm = xe_vm_get(vm);
+	notifier-&gt;vma_start = start;
+	notifier-&gt;vma_end = end;
+	INIT_LIST_HEAD(&amp;notifier-&gt;list);
+
+	err = mmu_interval_notifier_insert(&amp;notifier-&gt;mmu_notifier,
+					   vm-&gt;svm.gpusvm.mm,
+					   start,
+					   end - start,
+					   &amp;xe_madvise_notifier_ops);
+	if (err) {
+		xe_vm_put(notifier-&gt;vm);
+		kfree(notifier);
+		return err;
+	}
+
+	/* Re-check closing to avoid teardown race */
+	if (unlikely(atomic_read(&amp;vm-&gt;svm.madvise_work.closing))) {
+		mmu_interval_notifier_remove(&amp;notifier-&gt;mmu_notifier);
+		xe_vm_put(notifier-&gt;vm);
+		kfree(notifier);
+		return -ENOENT;
+	}
+
+	/* Add to list - check again for concurrent registration race */
+	mutex_lock(&amp;vm-&gt;svm.madvise_notifiers.lock);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If we had the vm-&gt;lock in write mode, we couldn't get concurrent
registrations.

I likely have more comments, but I have enough concerns with the locking
and structure in this patch that I’m going to pause reviewing the series
until most of my comments are addressed. It’s hard to focus on anything
else until we get these issues worked out.</pre>
    </blockquote>
    <p><br>
    </p>
    <p data-start="5521" data-end="5749">I think the main issue is
      exactly the locking story around notifier insert/remove. We cannot
      hold <code data-start="5618" data-end="5628">vm-&gt;lock</code>
      across <code data-start="5636" data-end="5668">mmu_interval_notifier_insert()</code>
      because that may take <code data-start="5691" data-end="5702">mmap_lock</code>
      internally and invert the existing ordering.</p>
    <p data-start="5757" data-end="6043">I have reworked this to
      simplify the teardown/registration side: drop the
      atomic/READ_ONCE/xchg handling, use a single teardown <code data-start="5883" data-end="5890">rwsem</code>, and replace the
      list-based dedupe with a maple tree.<br>
      I will send a cleaned-up version with the locking documented more
      clearly. Sorry for the churn here.</p>
    <p data-start="5757" data-end="6043"><br>
    </p>
    <p data-start="5757" data-end="6043">Thanks,<br>
      Arvind</p>
    <blockquote type="cite" cite="mid:aZ+HHMnSK49omV2Y@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">

Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	list_for_each_entry(existing, &amp;vm-&gt;svm.madvise_notifiers.list, list) {
+		if (existing-&gt;vma_start == start &amp;&amp; existing-&gt;vma_end == end) {
+			mutex_unlock(&amp;vm-&gt;svm.madvise_notifiers.lock);
+			mmu_interval_notifier_remove(&amp;notifier-&gt;mmu_notifier);
+			xe_vm_put(notifier-&gt;vm);
+			kfree(notifier);
+			return 0;
+		}
+	}
+	list_add(&amp;notifier-&gt;list, &amp;vm-&gt;svm.madvise_notifiers.list);
+	mutex_unlock(&amp;vm-&gt;svm.madvise_notifiers.lock);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index b0e1fc445f23..ba9cd7912113 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -6,10 +6,18 @@
 #ifndef _XE_VM_MADVISE_H_
 #define _XE_VM_MADVISE_H_
 
+#include &lt;linux/types.h&gt;
+
 struct drm_device;
 struct drm_file;
+struct xe_vm;
+struct xe_vma;
 
 int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 
+int xe_vm_madvise_init(struct xe_vm *vm);
+void xe_vm_madvise_fini(struct xe_vm *vm);
+int xe_vm_madvise_register_notifier_range(struct xe_vm *vm, u64 start, u64 end);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 29ff63503d4c..eb978995000c 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -12,6 +12,7 @@
 
 #include &lt;linux/dma-resv.h&gt;
 #include &lt;linux/kref.h&gt;
+#include &lt;linux/mempool.h&gt;
 #include &lt;linux/mmu_notifier.h&gt;
 #include &lt;linux/scatterlist.h&gt;
 
@@ -29,6 +30,26 @@ struct xe_user_fence;
 struct xe_vm;
 struct xe_vm_pgtable_update_op;
 
+/**
+ * struct xe_madvise_notifier - CPU madvise notifier for memory attribute reset
+ *
+ * Tracks CPU munmap operations on SVM CPU address mirror VMAs.
+ * When userspace unmaps CPU memory, this notifier processes attribute reset
+ * via work queue to avoid circular locking (can't take vm-&gt;lock in callback).
+ */
+struct xe_madvise_notifier {
+	/** @mmu_notifier: MMU interval notifier */
+	struct mmu_interval_notifier mmu_notifier;
+	/** @vm: VM this notifier belongs to (holds reference via xe_vm_get) */
+	struct xe_vm *vm;
+	/** @vma_start: Start address of VMA being tracked */
+	u64 vma_start;
+	/** @vma_end: End address of VMA being tracked */
+	u64 vma_end;
+	/** @list: Link in vm-&gt;svm.madvise_notifiers.list */
+	struct list_head list;
+};
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
 #define FORCE_OP_ERROR	BIT(31)
@@ -212,6 +233,26 @@ struct xe_vm {
 		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
 		/** @svm.peer: Used for pagemap connectivity computations. */
 		struct drm_pagemap_peer peer;
+
+		/**
+		 * @svm.madvise_notifiers: Active CPU madvise notifiers
+		 */
+		struct {
+			/** @svm.madvise_notifiers.list: List of active notifiers */
+			struct list_head list;
+			/** @svm.madvise_notifiers.lock: Protects notifiers list */
+			struct mutex lock;
+		} madvise_notifiers;
+
+		/** @svm.madvise_work: Workqueue for async munmap processing */
+		struct {
+			/** @svm.madvise_work.wq: Workqueue */
+			struct workqueue_struct *wq;
+			/** @svm.madvise_work.pool: Mempool for work items */
+			mempool_t *pool;
+			/** @svm.madvise_work.closing: Teardown flag */
+			atomic_t closing;
+		} madvise_work;
 	} svm;
 
 	struct xe_device *xe;
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------ezE0oQUK005RxKeb3YkpgV0M--
