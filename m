Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83D8C44532
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 15:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B12210E35B;
	Tue, 21 Jul 2026 15:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJte2Cyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA4910E35B
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784646021; x=1816182021;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WT2bq5hl9iKYHvzt3NmBNXFHOmj5zUrOgSfe9KPCO+s=;
 b=gJte2CyynX+O26ArVdQzI+v6nRvL/mYDXhS/NkqW8KckP6Ya1U5SeGxu
 WumD41OIFYmhrbMgQfrpToSKVHNHkcBjl8P+NYDoz6UoWeW4czx8wK0sY
 N8z7Lp0YxNe7Z7VBhUBKBlMlfO96RV8hWJ962u5n51stXhwQpnsbb+ZXt
 GaSusnC1KrCFVdJTcL9UwOA2Glu0Swn57QRjZdi80fneuqF3VILCa+QUl
 uPnM3+AF6aBFc91akKeSfz51+e7d0au/w+y69ktwxX9sIrR2lXMbMPbnO
 44GUswAWGR1ALRvqb2cp9D0JasFGkF/vSQx7A7kZquYk48Y295fdVtD0v w==;
X-CSE-ConnectionGUID: 26e3N08FSmq6nftG3btJxg==
X-CSE-MsgGUID: 27xw/ZytSQ2ROmH5GLmxZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85267349"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85267349"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 08:00:21 -0700
X-CSE-ConnectionGUID: 8UbUXdwlRqCxR146q6t4hQ==
X-CSE-MsgGUID: rzzN8iO3SVSeGcws8DxSHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="258438965"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 08:00:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 08:00:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 08:00:19 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 08:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPuRCkbPm98LQvu+KsTKcqFqp+0rzWDunt4dIJnTiDLL3wxPON58r9MuMrGKoYUYZX0IHLJmAcWu9CLedKegHlbZ2nrhv17wBb47OPXIYLekp5Iy0/wDpxmsP/QFOG/i+MZ2abAe2QqxB+2wwN7DmcTqX8shq5/1e6PPtRZi5+ytTBuPA3I9BQz5Oh21UmT9JEjAKGN6qHLhi4XGJfGSjGTiVW4Lh2Fcss/QY6z1q8NdomlvaM9y63s9AOOTIbeF01m1nDu9B4HFvU9y1oN4g7Pfl8f1mMwLYtQACCTeAMcti6TowySJOQvkr/vivuGzZPgBxRedmC0hjtpKZzvyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WT2bq5hl9iKYHvzt3NmBNXFHOmj5zUrOgSfe9KPCO+s=;
 b=XUokJ0SKMhJP6y55IwWPEoo66EoKDgSTc8JBHKmU5qPqOqo1Bw0glTjOMsSOgwgBRbz76kE1phDfFroJgrDJcohoQhP6QOpt7BURgcmMiUyzIdWTQ0ZZHMVqlz/nqgw0xlBFUxuu6i2pQEWG8wfDej9zjxDKQx4ySub2hr6g11pCBFe3ybz57QNq3GOfYBFokO7sI7GgKNtj+xWQ7+Ea55PxRt3K0x9bdxdD8WYHzLd80YZDXhcWqFbUuvVNEpd6TJFOEMRIhT5e4Ugh9Xj5svi+6xnycdn4NXwZW5go74uZvHMIEQXysWggRx2H9QJArVcvVZIfmKftnQHRPWTKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8575.namprd11.prod.outlook.com (2603:10b6:806:3a9::5)
 by DM3PPF341F90799.namprd11.prod.outlook.com (2603:10b6:f:fc00::f19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Tue, 21 Jul
 2026 15:00:15 +0000
Received: from SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57]) by SA1PR11MB8575.namprd11.prod.outlook.com
 ([fe80::4d5f:58ec:402e:9e57%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 15:00:15 +0000
Message-ID: <ffaf3da9-e284-4478-ad84-4947d1eabbcb@intel.com>
Date: Tue, 21 Jul 2026 18:00:10 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/xe/mmio_gem: fix destroy flow
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <koby.elbaz@intel.com>, <shuicheng.lin@intel.com>,
 <thomas.hellstrom@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20260526125106.2806522-7-ilia.levi@intel.com>
 <20260526125106.2806522-12-ilia.levi@intel.com>
 <ad9d424d-9b9a-4c27-bbec-58a293fed39c@intel.com>
 <b0b43e2c-e6a5-4082-82be-216ec7d56942@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <b0b43e2c-e6a5-4082-82be-216ec7d56942@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::14) To SA1PR11MB8575.namprd11.prod.outlook.com
 (2603:10b6:806:3a9::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8575:EE_|DM3PPF341F90799:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e4ace6-4540-4ce7-66e2-08dee738c54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|4143699003|10067099003|11063799006|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: 0ptqJH+ABMJ72o7AAsZ4dE1fN6yxGOPBCsNhuQxl33TC0BAHgey+CNvfDGAHOdjRQV5GuBfBAjALhUDpCxY+mineXANTLVBvXPC4sGOhQ2os6p04J7aGU1dQg8FASLpnJft1zs4JGJkRRIKt2CqGAkcxLKKTGARs0D+Fkh8fL4061IjaLPhvUlIyDdHB+nFu+Vdc7rvgLaHVQ7Oa7aIUXO9s9JJzsD3FVRfrZf+RkcUcI5yNyFcjngXT50QIIjHJqfdtUBH/M0YayqnuvkXfsOb38tzraOtwNXM8cywUFJ7f28voB5pI4c9i9lhwHHIVW9nO3vVZ7sg4y2/aPYpSLAMjWnWPqtpnYUGXxiIkZz2PAxBYuBCdelEu9FNcYAC7fbqzdNj+uYI49mcNC8dypyS2u5gDg6aXoxgc6h+6SIrTCPeMQ1Pd0Z+318qUOQJyoF7F5DouQuqnzukgPWBry0/MKrveSRRgtGlnqHOe3w0uH+0Oj+aV5xOlJct3by+Z1BLwMmvolGGUu2XJWLeFEUEvjTCJ1m1m6HHiQ2ptNBs0K4SZEW7BT6QotpbN/zHgI6TcsUqm7ICXILpNaqHTXndwt7gg6WHIe/86+ZPaHWmbPmvblk/ru44lTbZUy0JZWrz56O7mTOht72s/rD5tl2bU0k/zNjBLjdrDzUQYe10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8575.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(10067099003)(11063799006)(56012099006)(5023799004)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzJEY2RnZGRTZzhTZi80ZzNmdVZpUWREbkJENU5RSHdVTFZ0OFpDaS9pT0dh?=
 =?utf-8?B?S2l1MkIwNFBjemEzVHkvZ2V0YjJIZXp0QWhBbXZiYi9UM2dvUlVRaWJQdDZV?=
 =?utf-8?B?dnhDNVYzeEhPb3B6L3F2Q3kycEYxL0dXQWRra1VQQ2NNeGdkWnFYM0tGdGo4?=
 =?utf-8?B?WWNQWUoxTkpuQlV1Qm56UFFIcFBLSms0U25XdnluaFFiaE1FVWVldisrYWhq?=
 =?utf-8?B?a0VDdlpZN1FEaktzRG04VmZDdUQ2NGI1ZHhWcEc0NVZ5aWNWR3hlb2pGTzNL?=
 =?utf-8?B?eU84N1AzM3J6eUNuUE91VkkyQWZxY004Vk1ZWUgvVThlMUVXbHRtMjJCc3Vi?=
 =?utf-8?B?Y2VrMUd5dTdOa0lUNjk2bTAvUE5zb3p4UUdDeDMzNWVlUnNTQUpZU3VRYVZN?=
 =?utf-8?B?VEhCN1JuY2RyeDFLNmwzc3BvMDlQemtkZXdCVmtBQ015TzBseEE3aTBtWlBk?=
 =?utf-8?B?V3lNVnVKNTFzSlRuUE9SRGthVGxsSE5SV3c4Tmp0UEpob3dtc1JxVXJSek15?=
 =?utf-8?B?eDRyQmdwblIvbWJ4OVRoWUs2YTdXWXQyeDlGUUZJVUZrVWtTTVZaTFJVVVRK?=
 =?utf-8?B?akNIbDliR2JHdHVBWkE2bldiTWpIQitCaXhBcnZwUDhPSGJWSm1kRGdleU5i?=
 =?utf-8?B?UjNMUnRzWXliQ2dZMnZLOVI1U01JcEJNTFk3bUQ2Z2NxYnZNcHBIT24zUFoz?=
 =?utf-8?B?WXJYVjhkTU1nUW01QUtpdFRscVNqYkRaNEtaYkg3L256b3hvU05Db2hUYTRI?=
 =?utf-8?B?SlMyWnlacTJQdnJyWks0WmxRb3dwNUUwQjBqWWFVZ0NFWUtCbFprdUpUcWRr?=
 =?utf-8?B?MnJwUVBQSzgrandWQnc1dHNRZnZaeVFZY1JBdHNIRkhSTzFTVk10d2dUd0Rj?=
 =?utf-8?B?cEh6eENYK2I3OUVMbGpyM1hhd2Q4NWt1RjB5WGIxOGRHMFdLMDJXWnBvcW56?=
 =?utf-8?B?V2IyUXRGMlN1cVoxSVFJUXkyVzM3RENnSG1lTUNGNkd1ZXprMXdjRWZ3MWdn?=
 =?utf-8?B?V0QxWEc3dmNvYUlSOEliSjZjcXE0QmdnMnNFN0haL2Q0UDhoNXF3cjcxK3ZN?=
 =?utf-8?B?QlJURkgxUkQ2dzRFYUtQNlZTa2JLbHNxM09Tc0RnUFE0YXNlOHhFR2FEOFR1?=
 =?utf-8?B?dDh1ZHpOZ0lXQWZoaUYrUHhzbk9xeWJkRkY3SjBrWXFkd3IrRVZDc0hqU016?=
 =?utf-8?B?aFpBWjFXWnBjajNCcEhzWFZLU05RQXE3dkgrMFo2VDc3LzlzaE16eEhRR0dR?=
 =?utf-8?B?a0ZEb0l2V3ZKaHdCbVpWQ3VyWUUzWCtPSW4vUzV3NzV0MDB1WU45SlZHMlB2?=
 =?utf-8?B?QTNVeWt4b2VISTZkVDVHaU4vL1hGSHFUdzNDYjdjWG1ReXZNMkY2SXpnMmw1?=
 =?utf-8?B?VFhjOVNaNXJQcEd6ZzZCcUpnVStXbFVTTk9nN2ZyclpTWTRMbEI4eitFbzZ2?=
 =?utf-8?B?c21ENVU1bTB4WHltVDdodTU4dDJSOFhsQTVaNVBuVVNudURBT3B3b2s2VzNM?=
 =?utf-8?B?OHNqZmxzQTdKWGNYOTJldGJqRDhPVHhEaktsUXJ4SkNrQWFoRXg0bm8xR3h1?=
 =?utf-8?B?NVREMS9OYlBEVDRoSC8vbnNxcXZJbmFUb0JyaEVJZnE3T2k0dXF3YnB1L0Zk?=
 =?utf-8?B?bjR4cnNxb0dxWmc0bW8vSzQ4MjJZTjJpR1k5bXo5L1VuZVlhdFdyazNTTno4?=
 =?utf-8?B?YmJxSkxKdHhFREFheTZNb1ZVUnJFcnd3TFlORFU1b3JHS09QVm5XcnFqbGlL?=
 =?utf-8?B?VnYwTHdxN0Jlcmp0cHlWTks2c3V6aEdyN3ZzbWViSUV4Um1ibmJPeTdiS0JY?=
 =?utf-8?B?OUtBSHRKcDBFTkJiQUZGUlZucEhDc1VwSzJiQ2w1SGx2OTd6cTUzdWlnMEph?=
 =?utf-8?B?NGZMaDh5dGtvbTNXaG9mUGF4blpLaGZ5ZHNUM3QwTko3dXh0VkxNaE82NmRs?=
 =?utf-8?B?NHYzT2pQWC9qUjQ5ZWs3bE1JaE9tbTdqMnRoU1kzZUx4WUFsZXhGUWVVbnBy?=
 =?utf-8?B?YmZnSVVseVp0VmxwY3BDOUk4dER2ZzJhbWFEV2tKY2pscWg0eGdwRGIrMmlz?=
 =?utf-8?B?WXRXSWwyano0dnpCK0ErSTQ0U1RiY1cwWFFWYVBUS0FsMXlNRElpdHFHYTNl?=
 =?utf-8?B?SE5YSTNKaFdPOGwwY2JYb2gwVWk4UzBZdkZIeXp6aUJ3dCt4L1hRTnZiQW5T?=
 =?utf-8?B?aExhN0NRWW55OEVDNEU2M3NYNTRidnV2M1dHbHpUaHZ4YmN0Zm5CSkNMOGZq?=
 =?utf-8?B?emx5eTc2L0RKS3ZLSWNJdzVSWlAxNmxaaGVxazN2NGMwNjJ5eVNxYlVLRy81?=
 =?utf-8?B?VnZraWh0WUFURWp4MHZOWjhhNnpmL1ROQnh5OXY5d0RmR1Vpd3FkQT09?=
X-Exchange-RoutingPolicyChecked: eWd5NajotzG/n+aX8hf1X0m2q05DDFv6TNUnZtyMwWClaSOzUzcIIZO8Yqx4lJeW0Hvjws6HokUURE7gPAhc1soYMXgwzy+iDQhAgrrEd05Z+P6iLTQjlvffHaj/w0dco6QH93rznBKRsZt1H3MW9TPtMOV/IODCnfyLdOpY46Zhy0j/zKUQqZe+rushKJHFZc92XDNDP3zMvWcjzeHh0k1B2zKQNwyc+zZ8Sfx62piOqiZXEqsNoWIhYG5c6qPEbMGTH3z7TyjHrVIJ2mVFaR1q/O1tO5H+M5eYDvk9L9zjXkqO5SbuljD4gCO5jYwSmdIOl1j+aQRZ2qAzvj+QaQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e4ace6-4540-4ce7-66e2-08dee738c54e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8575.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 15:00:14.9842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAGt25o9kPDLi4slDsQVnCZufQLNNBsska4xPqk2NHB3LC24PZYYWsmSrXEddO4ym8i+9ztNsnc615yIjWeYIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF341F90799
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


On 21-Jul-26 12:15, Matthew Auld wrote:
> On 16/07/2026 16:22, Matthew Auld wrote:
>> On 26/05/2026 13:51, Ilia Levi wrote:
>>> xe_mmio_gem_destroy() currently frees the GEM object directly, bypassing
>>> reference counting.  Since existing VMAs hold a reference and the fault
>>> handler accesses the object through vma->vm_private_data, this is
>>> use-after-free.  Additionally, nothing prevents the fault handler from
>>> installing PTEs to the real MMIO after destroy.
>>>
>>> Use SRCU to ensure the fault handler sees the 'destroyed' flag
>>> (mirroring the drm_dev_enter/exit pattern for hot-unplug), then zap
>>> existing PTEs to prevent continued access to the real MMIO. Use
>>> drm_gem_object_put() to respect the reference count.
>>
>> Couple questions here:
>>
>> 1) Can we not just use the dma-resv for synchronisation? We wrap the mmio_gem with a gem buffer, so the dma-resv is already there. This has the added benefit of looking more similar to the normal bo fault path. Also same question for dummy_page_lock in the previous patch.
>>
>> 2) Should we not just SIGBUG, if something faults on this post destroy? Is this not a userspace issue? Re-routing to the dummy page on unplug makes sense, since userspace did nothing wrong, so we want to give it a chance to recover.
>
> For 2) other option is maybe just to drop the gem->destroyed handling for now. For PCI_BARRIER and anything else tied to the xe_file, there shouldn't be any weird lifetime issues, so it should be impossible to see something "destroyed" in the fault handler. It's otherwise hard to judge without seeing a real user for this special "destroyed" flow with the re-routing to a dummy page.
>

The contract I envisioned for xe_mmio_gem_destroy() is immediate access cut-off,
so we're not dependent on userspace releasing it with munmap. For example,
suppose the exposed MMIO region is a per-exec-queue resource (i.e.
xe_mmio_gem_create called from xe_exec_queue_create and
xe_mmio_gem_destroy called from xe_exec_queue_destroy).
In such case, the same MMIO region could be recycled and reassigned to another
client - hence the need for the "destroyed" flag and zapping. You're probably
right about SIGBUS being the better choice in this case than a dummy page though.

Regarding dma_resv lock instead of srcu and dummy_page_lock - interesting idea,
let me check it out.

- Ilia

>>
>>>
>>> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
>>> Assisted-by: GitHub-Copilot:claude-opus-4.6
>>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_mmio_gem.c | 27 ++++++++++++++++++++++++++-
>>>   1 file changed, 26 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/ xe_mmio_gem.c
>>> index 2f2ebc4fd901..b91704c51a93 100644
>>> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
>>> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>>> @@ -5,11 +5,15 @@
>>>   #include "xe_mmio_gem.h"
>>> +#include <linux/srcu.h>
>>> +
>>>   #include <drm/drm_drv.h>
>>>   #include <drm/drm_gem.h>
>>>   #include "xe_device_types.h"
>>> +DEFINE_STATIC_SRCU(xe_mmio_gem_srcu);
>>> +
>>>   /**
>>>    * DOC: Exposing MMIO regions to userspace
>>>    *
>>> @@ -39,6 +43,7 @@ struct xe_mmio_gem {
>>>       unsigned long pgoff;
>>>       struct mutex dummy_page_lock; /* protects dummy page allocation */
>>>       struct page *dummy_page;
>>> +    bool destroyed;
>>>   };
>>>   static const struct vm_operations_struct vm_ops = {
>>> @@ -145,8 +150,23 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
>>>    */
>>>   void xe_mmio_gem_destroy(struct xe_mmio_gem *gem, struct drm_file *file)
>>>   {
>>> +    struct drm_gem_object *base = &gem->base;
>>> +    struct drm_device *dev = base->dev;
>>> +
>>>       drm_vma_node_revoke(&gem->base.vma_node, file);
>>> -    xe_mmio_gem_free(&gem->base);
>>> +
>>> +    gem->destroyed = true;
>>> +    synchronize_srcu(&xe_mmio_gem_srcu);
>>> +
>>> +    /*
>>> +     * At this point every subsequent fault handler will see that the
>>> +     * object has been destroyed and provide the dummy page.
>>> +     * Now just zap existing PTEs to prevent continued access to the real
>>> +     * MMIO.
>>> +     */
>>> +    drm_vma_node_unmap(&base->vma_node, dev->anon_inode->i_mapping);
>>> +
>>> +    drm_gem_object_put(base);
>>>   }
>>>   static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>>> @@ -196,6 +216,11 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>>>       unsigned long pgoff;
>>>       int idx;
>>> +    guard(srcu)(&xe_mmio_gem_srcu);
>>> +
>>> +    if (obj->destroyed)
>>> +        return xe_mmio_gem_vm_fault_dummy_page(vmf);
>>> +
>>>       if (!drm_dev_enter(dev, &idx)) {
>>>           /*
>>>            * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
>>
>
