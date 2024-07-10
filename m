Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBBEC3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 14:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5599510E7F3;
	Wed, 10 Jul 2024 14:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8F7Xavy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5A410E7F3
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720622191; x=1752158191;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BPI38d8eJZB5At8G7UVU7cwJI+zK1R/19pY3daeMfaI=;
 b=L8F7XavywAuCI6pT4CC8dLafXLkn1ked+XiiC8Er7WMaLVu6ocCzprWT
 iCGauPMKB8JSja7qUB9c5gmhFT+ZIbylRJlvyQIIRAxV2x74NoNlbcPaN
 bRB/5h+52IH3I416gA7T/XaPdriX0DDYQ00ZvZGwjyMBQpJ3qJSUco1TY
 EQ8TmSNmu9Uy9REIEWoquO0hzg0me8wVpqqE83cyupCZcuNXXgrAznDuN
 PD9Q1IzamDDOuzMSCAoy2/a8ZcZnZGpMZYeHj4VeZHi0pWCS260GJXJDm
 G9XiLscAdWTcsHCL4PjiMWY9fcPRkagWf3LZ1VUAAyelcy9+izTwNtXYZ g==;
X-CSE-ConnectionGUID: r+XdRLggSh2kmh17AS7kDw==
X-CSE-MsgGUID: pc2YL62gQqKHvWoG1o1Zzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="35481958"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="35481958"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 07:36:27 -0700
X-CSE-ConnectionGUID: CxaGCYFsRp6vunDpdQOp8Q==
X-CSE-MsgGUID: 7zUAxPejSFGyoZ0Z1JCrHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="47985208"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 07:36:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 07:36:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 07:36:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 07:36:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBANvBr0uRGVotTwHEjw6nfVwfGcBmK2Jed9zg4VoM1YnXleC+tRtVAgV/vm+igqOfbMZZvocoqNHLFkbZzOmv7V/hId5z9wjtiCxyd64xUwHkpsJsxuZw+DJZEN6JQTuZRf9WWkPG5pkrxdZ0hykykyQ/nYHT4C/pDs2jgsrb2ftv/HimeZPw0D56//ZQbvhNdQVd52V8fSxRk/GglqbTmIFxKBtHfrwKUDvq0Axh/ooIBAmhykTi/bQyXPrPhNCvjqH2Xpc6AoeSn4EyWl7iUqxofMAVIS6ItgJ5RjwoYEmAPQzQLFRFLYfZSdniUg54xuUm03qKv1R11DqWAZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7TRf010OkAGd6Gy+RnH57fB8QSkubm5rwT0y6GZfJU=;
 b=eQLYcFAGvpX88AfxkwkCzHxYUUs2mLtwKdrfvlzKAWO8s5E5ar4vRxPHFU6UMUNtrcrfP31VUUjw1bGWG1iiGtIXzPt72vPvfDj3EwV9BApcDLZiz2yoz0UK9uwuvcjNbFMw27R2znXV9c8S/Al4UfksxcE15JVYl7m1+ti/zSN6wnkhUH6kE4Ia0hTdT6z7yW4WF4rhRX3SAJOJmZxkGaTOx+DnIw0cX8+OiMmr38RtIbPoRVbx8DFnI5j/LkGOZhV6KslAnyzG4kcDqAUNFgZAur7ngiNWxtyKVN/dLkm9hrMo4MfssoulwrWdPYeapaexkVqoZIrcLrAm/LNRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8534.namprd11.prod.outlook.com (2603:10b6:408:1f7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 14:36:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 14:36:24 +0000
Date: Wed, 10 Jul 2024 09:36:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit, 
 Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Yang, Fei" <fei.yang@intel.com>, "Roper, Matthew
 D" <matthew.d.roper@intel.com>, "Jerez Plata, Francisco"
 <francisco.jerez.plata@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Expose EU width via topology query
Message-ID: <76d6exieuad55xrie335bwzybeweu6iroxx6h73wbc7aeiltep@zzrnmsuukcqi>
References: <20240710055440.1985620-1-lucas.demarchi@intel.com>
 <a03a8d9fad59a747e9a0980517a41dcfd2d6da97.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <a03a8d9fad59a747e9a0980517a41dcfd2d6da97.camel@intel.com>
X-ClientProxiedBy: MW2PR2101CA0034.namprd21.prod.outlook.com
 (2603:10b6:302:1::47) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8534:EE_
X-MS-Office365-Filtering-Correlation-Id: c104f229-e119-43b1-f018-08dca0edac2f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Sx2TmC7iAPyxfYx7pm6C1+0Hd1DSq9cOpTWnpLjSqZoEP2VF6sQR4eZpGlZ?=
 =?us-ascii?Q?Wapa+Lx5aA9bsiW3LQa0OnNA5KpyPAXkx3ngovW0ULG4fGqw9ZfkXiEWMoX1?=
 =?us-ascii?Q?N6/4IxGU0CLtB4lLQlCiiuyOD9E1I8TYXGTHOAYbiCz6OHi700OipbucnewI?=
 =?us-ascii?Q?cFG1fYXofVgEEELKoEa3kToAxOtyvOAQiF3TgHJ/1n8VXp0xt51OtEH+RgaE?=
 =?us-ascii?Q?Vg4Z8z6RaJtnF5TmZ14eZBlBrNNYK0niKiAiMQeO9K86vvOOCefdFDTEn6f6?=
 =?us-ascii?Q?wiaQntVLt+e6b9oWxLDOcl+RWGMnBe6zdB1qp9ynfbipbieZP1ACQoOrvNwa?=
 =?us-ascii?Q?om9neiZmpfxX6QkWbKuJNZBhMPSRFam8ri1iB8xYvYLZtaMvXE0+Z2BqsGt/?=
 =?us-ascii?Q?C8hM4f/m1QWHRDEoKiNieUuK91rst+1QxWzjG8/Qx6+WoKivRe+JONyfUFIS?=
 =?us-ascii?Q?y9ov7gGMDeI+lrvSpnIA3VbeZhnsINamH9AoRqKyc9aZr2/mf1fhNHBkOhLV?=
 =?us-ascii?Q?mCp0DOnu8IaY/tPkExu2GCUTZnzfLT1sqEHrreJRrfp48/2ovWP+Aj/lAjvC?=
 =?us-ascii?Q?xQhUO+GpctclD85wUwnvCBgve/fn4MZMrgvm4UCD3HXBMz2uihmXj9HKt2CK?=
 =?us-ascii?Q?1akUO9t7pLBKrOwbVTP1ueUatgEXd8Y+CmJgm12yZpwL1ZRkGPc7iVC5cs0s?=
 =?us-ascii?Q?iStHqE/DEvRSBkrkA0UjDkertmGXjOznajxh7+4OcA9ociQm2+YPJy/6HufJ?=
 =?us-ascii?Q?53SiGJpESj6ENLyvJUHcj9H5M0MMseR6vWqDfO+pN3k9iYp1WOGuF/5KfDSP?=
 =?us-ascii?Q?dsgiGXg3cYqkyVgluUpjso2eyOSUxhSJAncHFghnTK90r8wuVBmTbWIETduA?=
 =?us-ascii?Q?9rPB+cTibAtuDIE4PjhouGd1EtjfjPx5iDLBptKpVDZvJpi/g2+OIhHjm/Zd?=
 =?us-ascii?Q?QNmtFLjO9tepY5x7y73bRPtxAY9hXqgDT6tRwme5312HffZVJSnBequXyfTW?=
 =?us-ascii?Q?kmwFpvWSlfNnQJrhqSj9rH6pDBzZT5Owcozmnh5fJgRUtLHJJWm5Qklh4sFr?=
 =?us-ascii?Q?R3JIYAqW7CuEMC7TQrkbvs2PtkJQblnZyytFsOrLJsDt7iogfMbC4DURoGHs?=
 =?us-ascii?Q?ri2QMmaR+HjSVWwTM8ROEK9+9/yQNa+esyHig4lbVpb2uBSyUMEGTtwEJjCG?=
 =?us-ascii?Q?ezsESSo9YfnPML5rPd0HFU0B4Da5sc+CUpkdo2Si664w1A46/Cx2sCIgadDh?=
 =?us-ascii?Q?WYmSbXlgs4HNMnfpWQqDzPQYD57/LAb8ZmcVO5TXzmAHxdLFYZ5B+lQLloPX?=
 =?us-ascii?Q?ncM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mAnw6hiWD27YZcmpmgryaZ48iBV7Yu4+i3AQ8P8JY0ls0n1vH3wptGqc/SJi?=
 =?us-ascii?Q?3Z6Fk1PxPAvq03OgmeIP/vCSIGrWkG8n7o/JqXc0p+BK6LUWFl86GadyUjNp?=
 =?us-ascii?Q?tnCd/D/pM6x6Tey9hYQcCYTlD0OISYTDu5EqSONhhw9G8esbkA+XIkAfETqD?=
 =?us-ascii?Q?ycLIrRCApMQMijO0Cj5aDCIu9fJh+3us0QP7N58magF2XETFTKBD6IzWXQcQ?=
 =?us-ascii?Q?5Kvj1iMej3PKUHjz+kgszIl9qthwicVRq6IQYe2WjZvdVN8xFPwAZrhHg0Rk?=
 =?us-ascii?Q?4trdosCzuH25lwJrVg4lMKg9mNeBYTO9vuiCfly0wTbRkO1NQkd6B31YEDah?=
 =?us-ascii?Q?S3oRyd8e9vbM0lZqtNHW9wpFnLXu24dOEkX3t0XeyNp5iMQ7ix59kgmBvoY5?=
 =?us-ascii?Q?dwlxT5MTAae1xGPwpbllApgJNVUCt/CkVTZVaaoiBjJYSWv/W307mRU4JOoh?=
 =?us-ascii?Q?V5c31NiVWe7JU8eZbMgbEpgh/Sueegj9w8dvNsRQhqnzfwE2JnVcK+gzZOMp?=
 =?us-ascii?Q?Ml4q3YOWffPR2BpZBlq56T8TV6YBQ6c1LR3gCLUIHbbbeGKD/JxXcOHDvMSC?=
 =?us-ascii?Q?lX1ZcWBwVVVtf0AzhJ5s+2BifWkCoscBp3Ku769m2Gh/TGOfpzaKLltUh4ct?=
 =?us-ascii?Q?DA7Iy1bga/aXVQ89lAVVaCo5cyetiK5ECI+G3B9P76q+tXED8fTqxQVm88Re?=
 =?us-ascii?Q?anHQf4tZKVQ79zk00it7g7b4uklQ6I6aP3kSl3msbhsMtjrkvmyNt2IN9YhE?=
 =?us-ascii?Q?Mg+KIBibQh7Wb79L/7xeGwC2qtBBS3U9GOsffzBtMZjG4LSTcz6RWrOfeqBA?=
 =?us-ascii?Q?fflJtfHWCd6q/G9LyXwEl74n92ntnaKexcoGBcOZWWZYuyaigKSvij3kUZ3j?=
 =?us-ascii?Q?D4m8lOtcelULbwB7VuQt0PvBsDARkCasC7slYJE7uFYzf6YrlF5c8v23jLwt?=
 =?us-ascii?Q?m1VaKx4vlMw1FrqjmDeddmm3e6y7Sgop7DkTTISfQCZpAQy0JNVCEPfI2XJD?=
 =?us-ascii?Q?vXlN/kEhTi89IjEpNT5/LMKuI04zmHLhUwRSCNqnUCowjpHj2fDJqnhiHmf/?=
 =?us-ascii?Q?309bujpXwVv+h9L8fQ2fu9YT4apCVlolAkOgQxGlFRvk5sLNsGJeBn3qQ5ZW?=
 =?us-ascii?Q?OtWBWylWo1nYcK+WT1u6cNAAxibQ5ZyHeHZIG0HVsRas8z2zV980OJjuHY9x?=
 =?us-ascii?Q?zVFSSYiahaqrADgEpJzGy00zHlMaJKN216icd7QbMj3kMzVEX2NFOT2yxA95?=
 =?us-ascii?Q?yCba61Y8ls/8PPVEVYeo5FEAaRFQiF5L5WB2zZ20UCGXSSisrqZC0ts9/uUF?=
 =?us-ascii?Q?TDYbGPBgiMB175+BQev5bQ6n8s8IWFdC7WoXNL6QmQV1w2W8c6QLUHcVmtEF?=
 =?us-ascii?Q?gsAatkb0j0JUX9mUg6Y5YpMBe/wv4lvsVh8LMalPJpOFqZhjn+ecZpez6s3X?=
 =?us-ascii?Q?ZoHvTNYta08FglqVHbKuY84DPM7+QI0x4FI2gOmnK1VSb5JNj9fka1NFkj9e?=
 =?us-ascii?Q?3hb+EMTbPlU6EdC7PskBzb+hJzeNmnHEvSgH/uzehOp4bm6P+mXxPCODqnpO?=
 =?us-ascii?Q?j/wtbb99jv4wVF63IzB4NuKdD0WK+LbK+WxF0KC11aCWPnqmkHP37Zizx3FC?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c104f229-e119-43b1-f018-08dca0edac2f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 14:36:23.9341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51zBlZUHcvAjrzzyVcZBnVMeDKClY9RG504TZJZKvTw2cAyobT2S6myy1q9rjXu/LemDCgnQ5FDx+1JpQpTx22Wjs5v/R0zMLl9re21pXPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8534
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

On Wed, Jul 10, 2024 at 09:05:43AM GMT, Jose Souza wrote:
>On Tue, 2024-07-09 at 22:53 -0700, Lucas De Marchi wrote:
>> PVC, Xe2 and later platforms have a 16 wide EU. We were implicitly
>> reporting for PVC the number of 16-wide EUs without giving userspace any
>> hint that they were different than for other platforms. Xe2 and later
>> also have 16-wide, but in those case the reported number would
>> correspond to the 8-wide count.
>>
>> Add a new item to the topology that aims to clarify what the EU_PER_DSS
>> mask means. This new item uses mask[] as a single u8 value. Xe2 and
>> later platforms start returning the number of SIMD16 EUs.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> Tested on TGL and LNL to check the behavior in dmesg, debugfs and ioctl.
>> Test-with: https://lore.kernel.org/igt-dev/20240710054446.1985069-1-lucas.demarchi@intel.com/
>>
>>  drivers/gpu/drm/xe/xe_gt_topology.c | 13 ++++++++-----
>>  drivers/gpu/drm/xe/xe_gt_types.h    |  6 ++++++
>>  drivers/gpu/drm/xe/xe_query.c       | 12 ++++++++++--
>>  include/uapi/drm/xe_drm.h           | 20 ++++++++++++++++++++
>>  4 files changed, 44 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index 25ff03ab8448..55ae1c79048f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -31,7 +31,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>>  }
>>
>>  static void
>> -load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>> +load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, u8 *eu_width)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
>> @@ -47,11 +47,13 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
>>  	if (GRAPHICS_VERx100(xe) < 1250)
>>  		reg_val = ~reg_val & XELP_EU_MASK;
>>
>> -	/* On PVC, one bit = one EU */
>> -	if (GRAPHICS_VERx100(xe) == 1260) {
>> +	if (GRAPHICS_VERx100(xe) == 1260 || GRAPHICS_VER(xe) >= 20) {
>> +		/* SIMD16 EUs, one bit = one EU */
>> +		*eu_width = DRM_XE_TOPO_EU_WIDTH_SIMD16;
>
>In my opinion would be better to return the actual/HW EU count and legacy/Windows/Marketing EU count.

I think you interpreted this wrong.
Actual/HW is what we are currently *not* exporting... not sure
those 2 groups make sense the way you grouped them:

	- actual/HW: new number, also matches hwconfig
	- legacy: SIMD8
	- Windows: I'm not sure, probably depends on what stack you're
	  looking, but I think it matches hwconfig, so the actual/HW
	- Marketing:  actual/HW

However if we export the actual number and try to compare with other
platforms, it doesn't make sense because we are counting apples and
oranges. Hence the need to say if it's apple or orange.

The alternative is to always convert it to SIMD8 (and keep doing it
forever for all new platforms) to maintain compatibility.

I'm not calling the old one "legacy" on purpose: it only created a huge
confusion (spec still to be updated). I want to export what the HW
actually is, then userspace can decide what it wants to use that number
for.  Also note that if you get the max # from hwconfig, it is expected to
match this number (see igt test xe_query@query-hwconfig)

Always keep the conversion in the kernel, always exporting as SIMD8
number, not matching what the hw actually is, not being very future
proof, not matching hwconfig, doesn't sound appealing.

Lucas De Marchi

>
>>  		val = reg_val;
>>  	} else {
>> -		/* All other platforms, one bit = 2 EU */
>> +		/* SIMD8 EUs, one bit = 2 EU */
>> +		*eu_width = DRM_XE_TOPO_EU_WIDTH_SIMD8;
>>  		for (i = 0; i < fls(reg_val); i++)
>>  			if (reg_val & BIT(i))
>>  				val |= 0x3 << 2 * i;
>> @@ -213,7 +215,7 @@ xe_gt_topology_init(struct xe_gt *gt)
>>  		      XEHP_GT_COMPUTE_DSS_ENABLE,
>>  		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
>>  		      XE2_GT_COMPUTE_DSS_2);
>> -	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
>> +	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_width);
>>  	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
>>
>>  	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
>> @@ -231,6 +233,7 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
>>
>>  	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
>>  		   gt->fuse_topo.eu_mask_per_dss);
>> +	drm_printf(p, "EU width:            %u\n", gt->fuse_topo.eu_width);
>>
>>  	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
>>  		   gt->fuse_topo.l3_bank_mask);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index 6b5e0b45efb0..71b4834080f5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -343,6 +343,12 @@ struct xe_gt {
>>
>>  		/** @fuse_topo.l3_bank_mask: L3 bank mask */
>>  		xe_l3_bank_mask_t l3_bank_mask;
>> +
>> +		/**
>> +		 * @fuse_topo.eu_width: EU width - SIMD8, SIMD16, etc. See
>> +		 * enum drm_xe_topo_eu_width.
>> +		 */
>> +		u8 eu_width;
>>  	} fuse_topo;
>>
>>  	/** @steering: register steering for individual HW units */
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 4e01df6b1b7a..82c966b73302 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -455,11 +455,12 @@ static int query_hwconfig(struct xe_device *xe,
>>  static size_t calc_topo_query_size(struct xe_device *xe)
>>  {
>>  	return xe->info.gt_count *
>> -		(4 * sizeof(struct drm_xe_query_topology_mask) +
>> +		(5 * sizeof(struct drm_xe_query_topology_mask) +
>>  		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
>>  		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
>>  		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
>> -		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
>> +		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
>> +		 sizeof_field(struct xe_gt, fuse_topo.eu_width));
>>  }
>>
>>  static int copy_mask(void __user **ptr,
>> @@ -524,6 +525,13 @@ static int query_gt_topology(struct xe_device *xe,
>>  				sizeof(gt->fuse_topo.eu_mask_per_dss));
>>  		if (err)
>>  			return err;
>> +
>> +		topo.type = DRM_XE_TOPO_EU_WIDTH;
>> +		err = copy_mask(&query_ptr, &topo,
>> +				&gt->fuse_topo.eu_width,
>> +				sizeof(gt->fuse_topo.eu_width));
>> +		if (err)
>> +			return err;
>>  	}
>>
>>  	return 0;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 19619d4952a8..6114a9064849 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -491,6 +491,19 @@ struct drm_xe_query_gt_list {
>>  	struct drm_xe_gt gt_list[];
>>  };
>>
>> +enum drm_xe_topo_eu_width {
>> +	/**
>> +	 * @DRM_XE_TOPO_EU_WIDTH_SIMD8 - EUs reported with
>> +	 * DRM_XE_TOPO_EU_PER_DSS have SIMD8 width
>> +	 */
>> +	DRM_XE_TOPO_EU_WIDTH_SIMD8 = 0,
>> +	/**
>> +	 * @DRM_XE_TOPO_EU_WIDTH_SIMD16 - EUs reported with
>> +	 * DRM_XE_TOPO_EU_PER_DSS have SIMD16 width
>> +	 */
>> +	DRM_XE_TOPO_EU_WIDTH_SIMD16,
>> +};
>> +
>>  /**
>>   * struct drm_xe_query_topology_mask - describe the topology mask of a GT
>>   *
>> @@ -518,6 +531,12 @@ struct drm_xe_query_gt_list {
>>   *    containing the following in mask:
>>   *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
>>   *    means each DSS has 16 EU.
>> + *  - %DRM_XE_TOPO_EU_WIDTH - To query the width of EUs as per
>> + *    enum drm_xe_topo_eu_width. It always has num_bytes == 1 and the only byte
>> + *    in the mask being the value. For example, a query response containing the
>> + *    following in mask:
>> + *    ``EU_WIDTH    00``
>> + *    means the EUs are SIMD8.
>>   */
>>  struct drm_xe_query_topology_mask {
>>  	/** @gt_id: GT ID the mask is associated with */
>> @@ -527,6 +546,7 @@ struct drm_xe_query_topology_mask {
>>  #define DRM_XE_TOPO_DSS_COMPUTE		2
>>  #define DRM_XE_TOPO_L3_BANK		3
>>  #define DRM_XE_TOPO_EU_PER_DSS		4
>> +#define DRM_XE_TOPO_EU_WIDTH		5
>>  	/** @type: type of mask */
>>  	__u16 type;
>>
>
