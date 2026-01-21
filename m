Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5680D262B0
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 05:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D7810E0CE;
	Wed, 21 Jan 2026 05:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfJaOg7W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823D310E0CE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 05:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768972295; x=1800508295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CuP7wCoJiznrRa+9CAb+ykFuxQu6aky55N8jexzUMoY=;
 b=KfJaOg7WjqebF3dQnPCEBFJnYAG6l1xm5E0/DcGIWesJ+4zj45nLIyNi
 rjq1xO5Rh70nqiIcOKaA0eEjg+Y0h2dGvNw0YindjEjGUiPp/x7Jjl7MP
 HNL+JHJUrBJwi0w7MkvzmCTA/JckzAjrOjglxS/i1kebZoDT654QdvXQG
 qZZcfwomkv35GQs2ZtKMJRjQ4YuAtZyPlpLea6y5mZuXj93Gru7hPdiZp
 kump3m9ZjcnoDC1q5R8yxsO1uZ0I/UvUQui8841vckEBuG4WzSVislqCr
 YTctiny25HPE90deH4VhM2xszkHhafG9KpVS6Zj0kYF75vk0v9i1T9ucx A==;
X-CSE-ConnectionGUID: J5UomRf1Q4eap+rirVXxEA==
X-CSE-MsgGUID: +YNECJyLTOWlaC5ejyD11g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70248404"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70248404"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 21:11:35 -0800
X-CSE-ConnectionGUID: 1Z16YUnBQ3mXfBep81wVhg==
X-CSE-MsgGUID: yUWFhK95TXSLf1krVmlfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206149087"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 21:11:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 21:11:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 21:11:34 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 21:11:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7b/W1+fz3y9fOOYPxW6KZELyEnlBfLEmVz8gFb5ZahN0DCeJFjj5N7XphNTlyc33b5ONi3H9E2qb1Qo+13alfwH+/fs+Sl+QhZOdENW8jlOcAB0h0u3C5Tqx59k2jLFC++r7ekCcsybSinArTJonFN8YtNBTJFGUHMNMyOQqFb4pmSeY1thAM29RMQsu+ZUJXSZ8BArf4Onw/GybndllAXYHzBunls6KtX8gxX1r0QKGitom8rfqLXGv9BsSffa2mBkX7LSuFkxM01NmmZa4arSRK7JYapCdGeqYDqfinvot5nM9COCGjMSz99wNASl1vtmTFkEVHEv3CjwCS5YWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxU7z4f8g39aEL1DhoFfYjT0zILms0a4Y8uocq4byEE=;
 b=i2bVeJ39kV4LcnYBT1xUYs33qP3ogVHa+YsOvYGMNml2xS6u/fr+FtQm6NqKKTyo+6LpUmaJqAmEqUk8rtWY7biysBZD5+vZDl+d4Xku9Xqre4xsnxUul0NkW6diYYI37g8Cqxm+a5WfA6twn3Idha4NP7DnFlUAMhJiSrlkWAr7v8B/dKgEHhjn2Ii1JCveTIgGflwmiAJuqoOVG9GYFTqGara2QB4xPHUMJi3Cxr2mnwgtctbb6yyLxnwbqG+J41AuOWN1Is5LmPac6oUQuu//dxXAtFekrdy+eUzHh4zBfdu8K1GWcyGknXV+/HdKe99RhJP7b5y+4JSuzrpZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3052.namprd11.prod.outlook.com (2603:10b6:5:69::29) by
 CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 05:11:31 +0000
Received: from DM6PR11MB3052.namprd11.prod.outlook.com
 ([fe80::c685:30c9:fec0:40d0]) by DM6PR11MB3052.namprd11.prod.outlook.com
 ([fe80::c685:30c9:fec0:40d0%7]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 05:11:31 +0000
Message-ID: <60c7b0aa-cd6e-4899-b5db-ce7ed42d4700@intel.com>
Date: Wed, 21 Jan 2026 10:41:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-7-arvind.yadav@intel.com>
 <aW++QuG51rGP1Ru4@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aW++QuG51rGP1Ru4@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3052:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: f9aa371c-d2d9-474d-d32b-08de58ab897f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1hUa0NPVVpqT2lCamI5OHZySTVZOEVwbmZjblhLNGdWK2tCZm82ZCtBU3gy?=
 =?utf-8?B?WFdlQm5iS3VCMDg4ZXhYckdXK3dSbDhSVzNjbXFuOWxMcnNwZ3VWUDQvc3dC?=
 =?utf-8?B?bjc1SUNqSjZhQUFYQ1JCdzdNVlNKM2NQKzBHNnRVK3RDdmFrTTBrV0k3ZGZn?=
 =?utf-8?B?dlBDazFFemQ3ckl3dnU4THU5RzhXM24wZVpsbWlqaU1LZTJndDZPSlI1ZDlO?=
 =?utf-8?B?TEdSL000bWc1ams3SHlxamtNbWF1SWNDS0RYaFczYWlyZTc0eENYbnRXWW91?=
 =?utf-8?B?MVQ0a2NaTWJMQWRWaDNQNWRHbi9VRU8vK0FPbjkxcnRzSllxY1pDU2JoeDhQ?=
 =?utf-8?B?eXYxWkx1OURrUjdQOFI0Ujl4QXhCSzJEV0dFQzgrTS9oSVJra0VjTDgvcURW?=
 =?utf-8?B?ZnJRVHpyL2MyT0JDMVByUENSbFY2L0dlYkxlWVVHek9lK3djdHR4K3dVYXFt?=
 =?utf-8?B?bG9DMzEyd3dZblZXRjljVGtwQnluZlRDU0ZUUHVJRHlwam42N2FRZmVCRWdl?=
 =?utf-8?B?UlBoOHlyVW1zQTRiRmpIbVlEVDZYUFdpeXlGK1NOZUlFNHpNd0lYT3Z3azNl?=
 =?utf-8?B?NXlTcmNRRjBYNUhFNXhNczFCQWZKcjcwYmorMFF2QUZmQjh2b3pmY1RUSngx?=
 =?utf-8?B?em9KZjBFY1FDMlRlMHdidzRJb0w1MENsSGtXRDdCSmF3MHF2WDJvaHFsTTRE?=
 =?utf-8?B?Qjd6RkRYT2V0TDlJcGloV1BMYWROV05Yc3VTMGVTVUFhWGp4R0V0MTh6Zklr?=
 =?utf-8?B?dXN1cnlGbmN4QmJsR1ZDVDJFeGlGQVNQREtWU0J2T3pZR2gwb3R2bXBtbXZI?=
 =?utf-8?B?Z3h5WHllVTkyc0E4czBNOGxvV29ibHFWWmY4L3NuZkdIZ0wreDl0V25XU2di?=
 =?utf-8?B?NjJKMVdrNFoyVUg0dTVqN2hFWHhnNVFwZXA4TEVjZTFJakJ3U1lnQlVMZHcr?=
 =?utf-8?B?b3EzekV2cmpETVJ2K1A5MHRWRVEzQndPSHNhTG5kblRpd0I4TU9MWUxRRDU5?=
 =?utf-8?B?OU1aVWpKT2xZR3JtdE44eG1leUFmeGxpZWdZQTJDUkpqQVRKcHNzZGlVRHNu?=
 =?utf-8?B?OVNrNGZSVjFEY20vN05WeUtoK0dtSzRKcmpxRy96UDh0dU9ETDlZRlpMMGUw?=
 =?utf-8?B?U3ZvNW9qL205aDQwdjNtTlJKYkJCRnVGVVVRNlJPUnB6b0V2VUVNZjFkcGJK?=
 =?utf-8?B?Ykp6dXNXZFp6TXA5UkpHdXpPNnlGbnZsYkVxZzl1Qm9KRURkZW5lY3VKL0pF?=
 =?utf-8?B?TW5UZkp3ZTdSVytCLzFJRUJvYnpRbmRoWjUyU2FiZVBxRGpTcWpBcStlaVhY?=
 =?utf-8?B?bkcyOEFseW1hVjdBS0t6VVNyQjRERS80OXdwMjJoTVdoaktBNDlla0lqUnoz?=
 =?utf-8?B?R2Z6VkdXZE13aWh6Q0JtSmRoSTJ6elVYME9WSXozblppL0F6cGwxS3lGMGxV?=
 =?utf-8?B?MmpTR0psOU5Eekw2VVBLYzBJT0dzZVkzMkVmOGpMWTJEeER5b3RJNkZxZWt1?=
 =?utf-8?B?YzV5RTBOdWMxZHd1eUJXWnltMEZmS1VqMk1WMFQweHpQNUpVcFV4MDA1eWFX?=
 =?utf-8?B?VjVOZWd6TWwxeFdhQ0ZKLzFoNjBoVkxKUDQ2cVZRUS90cDFQS0svcDI0YnN5?=
 =?utf-8?B?MUs0RCtpd09NUXFUUHJZNm9UZThObXVLbFRNUDRlYlg2azlIdjBsaGE1djJU?=
 =?utf-8?B?M1UxS0JqVTEwMVdxRFBGTnRMUmtSUkxsZU1OVFNISmQ4Zk1xd1gvc1lZZWVB?=
 =?utf-8?B?SGQ0TTZnRzZySUdNTjVPdW9KRjVDK2VUVjA2MkIwZHRaSjczbUMrVS9tdUJU?=
 =?utf-8?B?KzlPa0tKb2pYTGZmaDdMMzQwVE1TYXUveXpyOEFtcUt6U3lmRkRtUVRlRmpz?=
 =?utf-8?B?c2xVZGYzSlhZakhqSk5PdVBCT1NTU2wycmQ1OTRzZnMrci9zdXU1eDVWWkZJ?=
 =?utf-8?B?MHFLZG9kRXVQd0x1VEsydDM0M2tJaG8vbmpKZlRFMHZvb3RXR2NuKythZEJl?=
 =?utf-8?B?MDRsTVJXMjR4QkdYN2lsbmdVNlBtZFVGZU9zbFlNV3ZTUEJScmg0UUlnUGgz?=
 =?utf-8?B?cEFDRVNqemptUzFCeFZpcUlaV3hkM3ZnbVQydS9qTjBTUncrTGdubFNsbGtX?=
 =?utf-8?Q?fUdc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3052.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVBiWGoyUW1mWnNyeVo3TWpXcHpIcFJ3OFd1REMzcXhuQTZmQVJiVWk0MVl6?=
 =?utf-8?B?UTF5SDV2ZTVtUm1ldWRWV25SYUxwMm04UlBkR1NKdHF6VG9FK2I3azZEN1BY?=
 =?utf-8?B?K2YwenQwT2VLeG9MR24yL0xtV1BLNGprTENNWkpYZHZtUDZMTDNvN3BXSmQ1?=
 =?utf-8?B?Wm8yOUNRK0kwTFpuN3Exc3ZsSVlYeU1IdjYxNjladWkwOE1kemd1R0UxVEpo?=
 =?utf-8?B?ODdRNjRSNVhya1o3Tml0QmZDUkJFZWk4NCtoeHNSSlRxY0ZCYWNmSnQrN3hE?=
 =?utf-8?B?Um4xeUJ6L1RJa3hudkI5YitaNklHUVlLR2ZMRk5FY1hDcVJ1TFRDdFB3SGVI?=
 =?utf-8?B?MWRlK3ZxVit0bDh6YnhJSmYrUUx4a1cwZ3VXanB5cWNRTjJ5T1BWZ1FyaFVZ?=
 =?utf-8?B?OEYvVnJZRHRsa1kyN3NMVk5JbnhIY0NOU1RRUWJEejRhWVcxalU4UkVLZWVz?=
 =?utf-8?B?bGs0Snoyb1BuamhxUnRvYTZsZHp3RnNCclkzaDh6MDRzcFhjT04zMy9uZlRU?=
 =?utf-8?B?NjJrNk54NFBXeWE2WGQxTE5DNlcxdGRpVVVRaVVqaU1KZlBiaWdRMDQwN2JP?=
 =?utf-8?B?MTdYdG01QnlKWWcyTWhrL0RWNG0rb3NUMFp6ZGlVMEpBZEtGNmtlb012LzBM?=
 =?utf-8?B?RGFUbTdNamJIWkFGZVRQMmNPdGxYMjJaL3poNUdYZ3RRa0ZNaFIwYWdVWHVM?=
 =?utf-8?B?bStEZDVVc3VKRGdDaGUxUnQ3SUppOGdCZTIwSnlac0hic0ZsbklGMHJaYTMr?=
 =?utf-8?B?ZUM3N3BWVWlLZlNBQkZidXhmRlAyMXpPckJjWU02M2ZMdktGT3lUeGVzVjcr?=
 =?utf-8?B?Z1NLSFkvVWlqeDNmV2U3N2owWVQ4TEw1UFR5enVCaldadnJtbFRXWW9FMWRi?=
 =?utf-8?B?NGFQNnB2RXN3RnBsbFdvcjB6WTNDbG5qc044MU4rZHdrL3d2UDNuT0ZXWlJq?=
 =?utf-8?B?b2ViNWlqVGNubnpDK3pBVC85OW1QZ2ovY2R5TWFib08ya2d6U3IzTEordU1K?=
 =?utf-8?B?Z0s2M3FTOXorbzN3Wit5ajZ5bzlZZW1ZdWdwVkNTTFlTMkVlcWxQMThUUXo2?=
 =?utf-8?B?ci9FRmZGNnF2VjE5UXk4NURBQ2VzaWVwR3E0dzhEeHl6VlpHTlJHRXZoSXVX?=
 =?utf-8?B?bGVTL0NKaEdGMUtHeHVSL214UWNmMEs3YWw2TmRHL0xvQ01aY3BYekpDL0FK?=
 =?utf-8?B?S2FyNVd1c2lGSHhCd2VXaUJKVVJJODluNkk2dGk1VnRvNWtWNzR0Qkt1NWJp?=
 =?utf-8?B?MWdPRHFuanRaRFA4OWJXSHdTQlpPaDR1SFNpWXdIMVRBME8xYXJWWlE5U0ZO?=
 =?utf-8?B?QzJ2N2MrTi82cUtEaEt2MUNua3RWTUh1VGoyZzRFdVdBQjI1MDRycnhxcG95?=
 =?utf-8?B?eEFwZVVhalVKdkVZNjMxZXE5cXVYS3NYT1JFeVdZSFZvbWRwN2RlMEgxRXJ1?=
 =?utf-8?B?a0h0eUFTVEl0dFRreWFjdnlUYlp3U3U4Q2k0VEpieEZUVkJ2YWcrSGt1TmFS?=
 =?utf-8?B?dXhHNTBDdldDYUc0VGpJMVJhVDRjNExhZVpnamRPQmJlK2MzcTI5ZmN4MVp3?=
 =?utf-8?B?SlNiQ0doNWkrK2dsR3RUdmRFWFBsU0I3WVJBYjJwYVRXY2dSR2p2U2tlZ0RQ?=
 =?utf-8?B?VXJicmN4QXFITWY0ODRLL21HSzFQNXBUUHV5QkVrZlp4Y3JIc0FBbzZBa1Ur?=
 =?utf-8?B?NkhzazJqaHFxc1J2SFhUcHM5R3JFeUpkZkFkQmhmOUV5L29SdnNya0xlWElx?=
 =?utf-8?B?dGpERzBjZ2Z5bGphZnlxM0hESjJxcENNMEJyTTU2NGJyM3dUTFF2Vlo4ZEh1?=
 =?utf-8?B?Wnp1V1ZHMEJpZ0RnbkwxNWhjMSt3T2MrYndoVU1CeUQyZ2tLUXNnQjF3Yi9y?=
 =?utf-8?B?QnhoS21SbjgzSVlvRVJFS0N1Q1dmNjJXZXBPZlZRQmdKSGYweDJXYXhHRnlz?=
 =?utf-8?B?OVRqdDhSa1lRbmwrOWdqcHZ6TjZ4aEg5YnprY1YyU2RGZU54TjJobWthNzlq?=
 =?utf-8?B?cGlSaVN3V212bUtZYnNvNG9sSlM2L0tvUEdhUUJlOE5PeThSbWhqTERZa0Z6?=
 =?utf-8?B?a0R4YzhFQ09uUExVeUh0cmg2SmRhMTNsNlBXVkhpSHVmQXJEeG44WFJZUVB6?=
 =?utf-8?B?RjVMK29iM1VGQUYrYUM5ZkJmRkxCd2U1M2F0OExTdS9kamJ4aEExeC8rZ2s1?=
 =?utf-8?B?SXh6TkxwcEdBOW1TMWlWYTdSN1RPWnduWHprMmdZZkVoU1JudmNDTzgxbGlu?=
 =?utf-8?B?UTA1ZjVTT0VHdGlvc08xd3ZjUS9MQWVxUW9USk85ZkhuSGFYSjlyVVdFQnB1?=
 =?utf-8?B?Rjl1TUpJTitCeWJCalk4SUhHeFpWSUhPcS9HRFkzOXZTMit0WEdyUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aa371c-d2d9-474d-d32b-08de58ab897f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 05:11:31.7642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DtgMl10MFLTDyquqPCPkx2p6RpzjYik42/Wjz0HFYbKcjfUdCYeZDSA6Q1EmjVSX4J0P1XLsM/gaOxx6H+urA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
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


On 20-01-2026 23:11, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 11:38:52AM +0530, Arvind Yadav wrote:
>> Track purgeable state per-VMA instead of using a coarse shared
>> BO check. This prevents purging shared BOs until all VMAs across
>> all VMs are marked DONTNEED.
>>
>> Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
>> a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
>> handle state transitions when VMAs are destroyed - if all
>> remaining VMAs are DONTNEED the BO can become purgeable, or if
>> no VMAs remain it transitions to WILLNEED.
>>
>> The per-VMA purgeable_state field stores the madvise hint for
>> each mapping. Shared BOs can only be purged when all VMAs
>> unanimously indicate DONTNEED.
>>
>> v3:
>>    - This addresses Thomas Hellström's feedback: "loop over all vmas
>>      attached to the bo and check that they all say WONTNEED. This will
>>      also need a check at VMA unbinding"
>>
>> v4:
>>    - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c         | 15 +++++-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 84 +++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |  3 ++
>>   drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
>>   4 files changed, 111 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index f250daae3012..9543960b5613 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -40,6 +40,7 @@
>>   #include "xe_tile.h"
>>   #include "xe_tlb_inval.h"
>>   #include "xe_trace_bo.h"
>> +#include "xe_vm_madvise.h"
>>   #include "xe_wa.h"
>>   
>>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>> @@ -1079,12 +1080,18 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   static void xe_vma_destroy_late(struct xe_vma *vma)
>>   {
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct xe_bo *bo = NULL;
>>   
>>   	if (vma->ufence) {
>>   		xe_sync_ufence_put(vma->ufence);
>>   		vma->ufence = NULL;
>>   	}
>>   
>> +	/* Get BO reference for purgeable state re-check */
>> +	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma) &&
>> +	    !xe_vma_is_cpu_addr_mirror(vma))
>> +		bo = xe_vma_bo(vma);
> I think xe_vma_bo just returns NULL if any of the above conditions are
> met, so I believe is ok to just blindly call xe_vma_bo as you have a
> NULL check on the BO below.


Right, xe_vma_bo() already returns NULL for those cases. Will simplify 
to just bo = xe_vma_bo(vma).

>
>> +
>>   	if (xe_vma_is_userptr(vma)) {
>>   		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>>   
>> @@ -1093,7 +1100,13 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>>   	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
>>   		xe_vm_put(vm);
>>   	} else {
>> -		xe_bo_put(xe_vma_bo(vma));
>> +		/* Trylock safe for async context; madvise corrects failures */
>> +		if (bo && dma_resv_trylock(bo->ttm.base.resv)) {
>> +			xe_bo_recheck_purgeable_on_vma_unbind(bo);
> Also I don't think the correct place to call this.
>
> I believe you can call this function in xe_vma_destroy after
> drm_gpuva_unlink. You also have BO lock there too so no need from this
> trylock path.


Good catch! Will move to xe_vma_destroy() after drm_gpuva_unlink() where 
we already have the BO lock. No trylock needed there.

>> +			dma_resv_unlock(bo->ttm.base.resv);
>> +		}
>> +
>> +		xe_bo_put(bo);
>>   	}
>>   
>>   	xe_vma_free(vma);
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index dfeab9e24a09..27b6ad65b314 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_pat.h"
>>   #include "xe_pt.h"
>>   #include "xe_svm.h"
>> +#include "xe_vm.h"
>>   
>>   struct xe_vmas_in_madvise_range {
>>   	u64 addr;
>> @@ -179,6 +180,80 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> +/**
>> + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked DONTNEED
>> + * @bo: Buffer object
>> + *
>> + * Check all VMAs across all VMs to determine if BO can be purged.
>> + * Shared BOs require unanimous DONTNEED state from all mappings.
>> + *
>> + * Caller must hold BO dma-resv lock.
>> + *
>> + * Return: true if all VMAs are DONTNEED, false otherwise
>> + */
>> +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
>> +{
>> +	struct drm_gpuvm_bo *vm_bo;
>> +	struct drm_gpuva *gpuva;
>> +	struct drm_gem_object *obj = &bo->ttm.base;
>> +	bool has_vmas = false;
>> +
>> +	dma_resv_assert_held(bo->ttm.base.resv);
>> +
>> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>> +			struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +			has_vmas = true;
>> +
>> +			/* Any non-DONTNEED VMA prevents purging */
>> +			if (READ_ONCE(vma->purgeable_state) != XE_MADV_PURGEABLE_DONTNEED)
> You don't need the READ_ONCE as purgeable_state is only accessed under
> the dma-resv lock, also there isn't a WRITE_ONCE anywhere.


Noted - I will remove READ_ONCE() - the dma-resv lock provides the 
necessary protection.

>
>> +				return false;
>> +		}
>> +	}
>> +
>> +	/* No VMAs means not purgeable */
> No VMAs means it is purgeable, right?


I kept “no VMAs => not purgeable” since otherwise we can mark BOs 
purgeable without any userspace DONTNEED hint (No VMAs means no user 
hint at all).

>> +	if (!has_vmas)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +/**
>> + * xe_bo_recheck_purgeable_on_vma_unbind() - Re-evaluate BO purgeable state after VMA unbind
>> + * @bo: Buffer object
>> + *
>> + * When a VMA is unbound, re-check if the BO's purgeable state should change.
>> + * Destroyed VMAs may allow the BO to become purgeable if all remaining VMAs
>> + * are DONTNEED, or require transition to WILLNEED if no VMAs remain.
>> + *
>> + * Called from VMA destruction path with BO dma-resv lock held.
>> + */
>> +void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo)
>> +{
>> +	if (!bo)
>> +		return;
>> +
>> +	dma_resv_assert_held(bo->ttm.base.resv);
>> +
>> +	/*
>> +	 * Once purged, always purged. Cannot transition back to WILLNEED.
>> +	 * This matches i915 semantics where purged BOs are permanently invalid.
>> +	 */
>> +	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
>> +		return;
>> +
>> +	if (xe_bo_all_vmas_dontneed(bo)) {
>> +		/* All VMAs are DONTNEED - mark BO purgeable */
>> +		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED)
>> +			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
>> +	} else {
>> +		/* At least one VMA is WILLNEED - BO must not be purgeable */
>> +		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED)
>> +			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>> +	}
>> +}
>> +
>>   /*
>>    * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
>>    * Returns true if any BO was purged, false otherwise.
>> @@ -213,10 +288,17 @@ static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
>>   
>>   		switch (op->purge_state_val.val) {
>>   		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>> +			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
>> +
>> +			/* Mark VMA WILLNEED - BO becomes non-purgeable immediately */
>>   			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>>   			break;
>>   		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>> -			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
>> +			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
>> +
>> +			/* Mark BO purgeable only if all VMAs are DONTNEED */
>> +			if (xe_bo_all_vmas_dontneed(bo))
>> +				bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
>>   			break;
>>   		default:
>>   			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> index b0e1fc445f23..61868f851949 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -8,8 +8,11 @@
>>   
>>   struct drm_device;
>>   struct drm_file;
>> +struct xe_bo;
>>   
>>   int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   
>> +void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 437f64202f3b..94ca9d033b06 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -150,6 +150,17 @@ struct xe_vma {
>>   	 */
>>   	bool skip_invalidation;
>>   
>> +	/**
>> +	 * @purgeable_state: Purgeable hint for this VMA mapping
>> +	 *
>> +	 * Per-VMA purgeable state from madvise. Valid states are WILLNEED (0)
>> +	 * or DONTNEED (1). Shared BOs require all VMAs to be DONTNEED before
>> +	 * the BO can be purged. PURGED state exists only at BO level.
>> +	 *
>> +	 * Protected by BO dma-resv lock. Set via DRM_IOCTL_XE_MADVISE.
>> +	 */
>> +	u32 purgeable_state;
>> +
> I think xe_vma_mem_attr is a better place for this field.


Noted - I will move purgeable_state into xe_vma_mem_attr for better 
organization.


Thanks,
Arvind

>
> Matt
>
>>   	/**
>>   	 * @ufence: The user fence that was provided with MAP.
>>   	 * Needs to be signalled before UNMAP can be processed.
>> -- 
>> 2.43.0
>>
