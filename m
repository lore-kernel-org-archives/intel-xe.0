Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DC3C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 04:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235B010E11A;
	Mon, 21 Apr 2025 04:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h6FFwFRZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB0810E11A
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 04:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745211170; x=1776747170;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3HUl0RjF/UY9FB2lIOvP1jN091zP/3zN4ZJEGnQ5ju8=;
 b=h6FFwFRZ8nG8mdVCQNUSEGVSPj8isJSJq5kls1db7TA44s7GGnzP6Nrz
 eUVuZxlDaKQQ+taNhoSNdfcF5xplNXf44WbpQuwkyZhEBh4It7HXl7QYa
 rr9d5JOyZZ1t5SXiQgBH9xuj238hG/YobUBFxPU433FwzqKT1qYfpMVx1
 DnIAaJM0H/+lf5mSlCcvwGtwr24OVi3S4+OLSlxR/VTseCQgz6Be9O5Jx
 XyHFiYDC0NxTCwaGY0FKJZIK9NMzAMN8rRTP4NTYKEwZbILBrA65WcqEX
 8F8yuSpwTdUAO3BkHYUHfyzTS8yAt7oafSDiYVxtLspWxPAlfK0hXof8x Q==;
X-CSE-ConnectionGUID: Hu+hHXF3RXiWqxWr/8WMJg==
X-CSE-MsgGUID: g4Pjd5H8QSamMhT5BBVy+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46858789"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="46858789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:52:48 -0700
X-CSE-ConnectionGUID: 3bQPFs73RgO2NeQj6kaspg==
X-CSE-MsgGUID: I7quNf69Sy6jXTY4fmvPGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136773543"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:52:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 21:52:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 21:52:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 21:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQjVbXxQMa1SzMeZ4ArcT6eLtCYO00sZz7oW7VntG7kDpEpPwBUUFaDdb7xQ80xP/mhqW9rwa7dcFLYp6ftrVmNxJ/ZQhqE6f+qgmkriNq3O7ZIPObygo3RfhWWkQm9ao7Bj8rGSvn/jeFreMvNzpzjx4KXDKxH6hkYWXfMtzq9wguIsdN6tQeL4g6Pea6eOnJB+bwZYeAZPEB52f5c50XZX1rIFLnrguPPtu11vADykOIKhrSq0Q5HrmsnrfUfL8ulDws5XrE5BUDgxMAdSIz8oH8PjIPleST2pLXJ6Ois3FlaGdnQp4iYSU/FkeAp37anI2HVmc0UpAN8G8gr7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOI/TkEaGWVAyjy/suldEh+FMWSHe+0lRVw6L0CvSKg=;
 b=HfSxTrfbPSM95UWdcI0AztSSwa30hrSP/3uhXnvmUyVuKm5OrgRzLXZOtpvhX8QXWWkAW5ANVZD6fSPqK0FdtVkrn9U+Vto3xN7SA94P8C2DvXfDfd6nWByLlofPK3ROSkD69mcl/sUMyWcjHCnXeE4yY5NIHyQlKrNl/r+OlK0qq/ECSLiTloj8CT/zqsHmOyFnvSgPwj5icKot/1eVxW23HpWMcN53/5iOpBz9wVMuiS3OESBSXVXeBJWqjX02txY4GW+c+Iy+1+XVVNsmJARt+wJioOElBpdO9ZBYokYzMGY0WONyyi7+mveSCs6Z9T41tVBy9WWAzqu0giyNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 21 Apr
 2025 04:52:18 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 04:52:18 +0000
Message-ID: <2e8fa7da-5ca9-4bda-8e97-76d529532139@intel.com>
Date: Mon, 21 Apr 2025 10:22:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/32] drm/xe/svm: Add function to determine if range
 needs VRAM migration
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-12-himal.prasad.ghimiray@intel.com>
 <aABv/vgb7v3ixrkX@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aABv/vgb7v3ixrkX@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: bdcb28dd-20f5-444e-4e53-08dd80904b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW8vcFZlbitKbUEvSnZkOWF3dUpxSlROdnJmcmlrdE1XQTRUY21wdXhjTU5G?=
 =?utf-8?B?S0ovQVEyRGliNXpFQ0psVis4NmR6TVl2czFOZFFqNHBZSDBmL3JKWER5SzJG?=
 =?utf-8?B?NGZuVm5UR0tMam5KSmlFVGZ5RDkxdGdXdzErbWRjYXptdklWcDFnQ1NHN0tD?=
 =?utf-8?B?QW4rZHh5c1A3NmFGT21hcHJyaXZuUkJmaEZJQ281blVSVVRvVVFqc3pzRkhz?=
 =?utf-8?B?eTFNS3FpUHJHMmh1c2NyQm9jZlRNdG1mR2JBV2QxSFAwRmF6VitIdHc3aFVG?=
 =?utf-8?B?RzZxVEhKWDA1YmRVTWxtbzdHUG1Ia1Qzb0dNRDlNVk9iZUN0QXNRUHc2b25T?=
 =?utf-8?B?alltMGVscU8zMDhwWUFhMGpKOUZwbFNFQnM1ZTBWN09LZ3pTN2ZJYllTaWZQ?=
 =?utf-8?B?TytyWWVuUG0yZ1kwelBmVjRraXNMNEx3d1NNT1dyRUNlSHAyZWVUSzZJNFFn?=
 =?utf-8?B?YUdyaFl3QWlvc0hHNHdZWkZSTTI0aGFUZEdaQXNseVRyMVZmSjE4NStnNDFs?=
 =?utf-8?B?L3VpVXRrV0pPQzgyRURYakFySkxYS2J5U2RhMmhraUh1dHNGMEYvMDROZldt?=
 =?utf-8?B?c0tRTVpHSElaSldUZWlJU0lKYkRTQXpIdDZxUWVRYVRzU1ViZ1JSamJjMjRn?=
 =?utf-8?B?OXZHcjJqeFBvSmlldlRZdVJSY2hOMnhiQUdXRzVPTS9xSnVON2x6VUZnU2Fz?=
 =?utf-8?B?Nm5ic3lMeG9rQ0hGYVVMN2pTZXRvT0JUV1FQYkdXWmJwV3dmaFF5RFVzWkkv?=
 =?utf-8?B?L2tIK0JKWVJ6cDdHZitvNUg1NmVBVVhCR3JqL0IrTzhyMDVtRXBqdDFqTG82?=
 =?utf-8?B?dXYrQTIyZ2krZVltU2ZEeDNtQk1aYmRoWEt0ejAvbTRadEgxTmFPWFp1dFMz?=
 =?utf-8?B?NTlVR25GSEwxU3A3TU1JTFM1R3M5YUJlNmVDK0hVL1ZYV2pJNGtvZHlwdXBM?=
 =?utf-8?B?cFFYdWJORFhzemF1aXVGUjhtNXQ5NmZTZVcxYnV2UWtORklwVnNLY2t4eDlZ?=
 =?utf-8?B?QVRsRFV1cGFYWFNMa1VObkNHd1A2YXllTEI0NnYrYjVTdWlNdzYrMEZWV1po?=
 =?utf-8?B?cGRXZnpxTkNUS3ZudGE4VzlDb0l1ZWFyN21PcWt3WW51YXBxV3NYRmVzVXBC?=
 =?utf-8?B?M3piaDhSNm16RWNobDhSTXF4YVBlaFpSWXVjcldmQ1Z4YU5aWEppU3JWelJk?=
 =?utf-8?B?aWY4ZUdqMDZWbitYT1RhdC9EaDF0aGFUcUJFSUpBY3RDRXIvazkrd3k0YnlY?=
 =?utf-8?B?VmZrbGUxeDNlZlBnUHVQemV5a3crTFl0M1pLMGFiUU9oNFJXaUNkMUR6YTdj?=
 =?utf-8?B?bDZWOENQUHlRQ204Ums0aXJiY0hBWjYvbEZxWW51MGhJQ21wUUliUWliT09H?=
 =?utf-8?B?LytIZERpZ2pyN3kxN1pvajRmV0NzZHFRazlPQlpZQWV1WnUvZFk4N1V2UUNz?=
 =?utf-8?B?V0ZmdW83dm5RKzVkSDhqdzFXSG5HZGdHRW1RbjZLUXZ0VHdGWXhnYlE3czBO?=
 =?utf-8?B?Nmk5TTZNSUpBT0ZGeDZuTXdiWlhURkFrbFNnUWM3Zm1MOWJiM3oxV2J4NnJZ?=
 =?utf-8?B?MW5RQkRXTkl3RDJPL2wzUW1jZTNRR0ZnTlFvUHIvYk80YkxQeWhvRnpPb3FX?=
 =?utf-8?B?cjhHZlRlZHlHUVExWWJmVEZyc3RNNEczQlh4VkRZcUR2SkxkbktGT0RRYUg0?=
 =?utf-8?B?MUtLaFROb2h4SjNhUFhMWXp4aEhyV2JnektPaGJyaU4xYnFnZkNqZXp0UWVO?=
 =?utf-8?B?ZGRTdkh3SWhId3lSOHhVeHRkVDhQT3o1aUwyaHpHbDI1YmN0NmVMMnlhVkpo?=
 =?utf-8?Q?gDyP2p/erI1strHGrdvvwXEtQ6Uk0gsRoRzN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2NiaUYrMjB0dHcrbHI4VnZjSUd1RTBYdWF5aThESWFiYU1UYXpCUVdrN2t0?=
 =?utf-8?B?NVdHZTh5L3dXZU9Sc2NISk5hekpKNEJWd05OQTVKb2F5UjBTbXpTaEZNVExN?=
 =?utf-8?B?SVBGZFJCbFhCTTI2QkEvdVZOVGRUVFhRWC8xYlR6Z1hDdDFlZjQwL3BwQTRO?=
 =?utf-8?B?T1ptUVpGTnE2eUU3Q1V2QlgxdXIzb3VOempmYXFwR2hnZmNPeEZXQmNSK3Rj?=
 =?utf-8?B?bDBsNmRIWG8yVDY2K3ZYT2hDZ1phZDR6NXJkWHF6YTNQdlhXZmlJK1hicHJN?=
 =?utf-8?B?SUt4SlhyTGJ3K2EzeTNBcnUvNVQ2ZVJQUEMvKy9VOUxmR0FBendpcmlGaHVB?=
 =?utf-8?B?Mnl4OHVXZCtRdmE4TEU4Q1c3NURld1F6QmFXRjF4cGp1U1BlRnVmOEVNYWlI?=
 =?utf-8?B?c2ZDanN1Wkw4UXlQaUhqdC9vOEZXT01SVU9aVGZHZ0s0Q05QWlhweHNWbU1F?=
 =?utf-8?B?YWh1YlZ4NjlQdEkwV29FZXBRd0xDSzBUbHpDU29sbFM3WHRiaFpBekkxeW9j?=
 =?utf-8?B?RVg2ZTV1ektKenJUOXQyNnFtSC9GMEppaXF1MHJwVGhLZWcwVlhIbzFxOThh?=
 =?utf-8?B?TU9Fb2FQV29GTHV0TGE2TG9KS2ZzRjl4Y1hWalFlNFFQYW9YSG1sdzFnWW1L?=
 =?utf-8?B?d2h0V1RTbGVVOEtwTmRQbUppbVluaWIwSCt2VjdTc21DTmNVQXNWQTJ5clJw?=
 =?utf-8?B?SWpOYkZ5dlcyQ2ZUUDY2Y2g1QlBKRy9XSFQ5TWhQRUpDbHYzWTB6VGdJdEY2?=
 =?utf-8?B?cXBrc2dWaWdaVGJhbFFDL1luUG1lN1hQOGtud2FPNW5PNUVvZVJhSVJyYjZP?=
 =?utf-8?B?b3JzMVp2eXFsSlNJcmJ2bTZxK0psVVJJWjF4dU9ub0hTcnhIUk9lTHYyS0Nz?=
 =?utf-8?B?T3QzRFVzaXFOd2l2OWlFS2xZR3dNOG1nQkZualhDekpkME0xNEUyUFlYTEwy?=
 =?utf-8?B?cE5kUlVVc0VKdXBOM3NSbDQ1YWtlNDZkajJMQllsNUVLZWlYaGgyTVMva1Iv?=
 =?utf-8?B?cVBlY1BPQzl0QjkwSjNwZ2tpbkpJRitpUUpZUDQ4YzdFVmhzTk1CMlprMXN1?=
 =?utf-8?B?c24zRjFqbEI5ajJ5Z1M1R2JvQmt3UDRIcXh0MHBPdkRwU1FFU0xVckgwZXph?=
 =?utf-8?B?Z3doUkhXVVRkZ2pOV3pCVVFtREJCdi80QWVDV2FRdjZ1d3JpTFNIcTlKQloy?=
 =?utf-8?B?OWFXZXVQRTgwTE1tTHlIZHdGWXpxTUVWTXdXMW90R25FcXhqeHJBWWN1ejlW?=
 =?utf-8?B?WFFxQ2k2dXhoQ3RLdU8xeGVSZFFKL3RVT2xJMlBBRVpaa01nWVJsTFdhMmdw?=
 =?utf-8?B?aktWVktLVy96ZXJuN2dDU20xbUliUnVvYVQrRjV5VmlRcGYvVm1RTU9Dc2c3?=
 =?utf-8?B?SXdoWXA1dmpHRmp0OEF5T2EraXQrcHBwcjlLcklMZHlobHBweTB2NjdKZWx1?=
 =?utf-8?B?WHhFRHRNdjVLMURpdjNwcTdxRmVjMWZwRGxQV2R3c2FYQlNYelNjZVNONnJC?=
 =?utf-8?B?QXRlc21SMG1YbFpsN21zTU9CYld2UW1QdFYrWDlUODRnUW1halpidG9tcURB?=
 =?utf-8?B?TytLMDBQK0kzZ1ZWQ1RMVTFlYVNhaUlWMkwvUDl5NWtNN3VEbDFjdGVhZUFX?=
 =?utf-8?B?ck9CQTR3TnZ5dTcwTUUvYXhRZnFVYWFzSldSejRELyszQlZKNzhzQXRUNmdh?=
 =?utf-8?B?QW94RkR3dzN2aFY5d0ZNeXUyTm9Wb1BRM01ZcFdSeFdMZ1RjaEVLdzhrUS8z?=
 =?utf-8?B?ckI2dWxaRmlLd1hBeHhUTWx6UnNEZ1BaMm9TYlRCcjZhdDNkdzF1Y2RiTFJF?=
 =?utf-8?B?bXdBWlB4QlRQTHRmL0tqWE0wQWVLYmFmZFE2NTUrZENRWFZyV0MzNEFlWEN5?=
 =?utf-8?B?clQ5MEJyREZiVmtFMm9qMHBwbjVvY0tlVWk4OEUwaDR0dzJkbTQvRDRJaEJU?=
 =?utf-8?B?bHN3cDFJQWtOYUpETkN4U2NWc3dsVzdlcVYraHRkQmw5TGtoUzJvV1REMnY0?=
 =?utf-8?B?MDJMR2ZVUjNpc0hSQnltSEU0WjZheGEvY1JGQldhTThPVTNzdHpmQTJ2bTRn?=
 =?utf-8?B?RWJzRDNpWDd4VzhacnNuTVZMenc2RDRNZGovd2JrNUZSSWJDVEd4ejJwZ20r?=
 =?utf-8?B?ZW5CVFJ3c2dSQUVoUXBHbU1DMDdWTzZ3eVNZR1pORDQ2Wm5YRkpSREY4YzY0?=
 =?utf-8?Q?ttjUmyAMn2qFs7K7TzDiKq4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdcb28dd-20f5-444e-4e53-08dd80904b49
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 04:52:18.6088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTEjA/cY5OISsJ4ov/86YpGYDFffLOwe7P55MyMYNhntjSo1UZMSvpD4Zy2cRmDsuPWqdm7ZkCfxbUXrjQI1vEU6wTHdmc8hx/Ah0ljL8YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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



On 17-04-2025 08:35, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:46:58PM +0530, Himal Prasad Ghimiray wrote:
>> xe_svm_range_needs_migrate_to_vram() determines whether range needs
>> migration to vram or not, for pagefault try at least once.
>>
> 
> So I pulled this patch into requested series to minimally enable atomic
> on the existing upstream code here [1]. I suspect we will get my series
> in first, perhaps even in the 6.15 cycle as I think it could reasonably
> justified as a fixes series as the compute UMD doesn't really work
> without it. Just a heads up.

I will build upon the [1] so irrespective of which series lands first, 
there wont be any impact on another one.

[1] https://patchwork.freedesktop.org/patch/649010/?series=147846&rev=2

> 
> [1] https://patchwork.freedesktop.org/patch/647159/?series=146290&rev=4
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 49 +++++++++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_svm.h | 10 ++++++++
>>   2 files changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 8cd35553a927..f4ae3feaf9d3 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -709,6 +709,51 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>>   }
>>   #endif
>>   
>> +static bool supports_4K_migration(struct xe_device *xe)
>> +{
>> +	if (xe->info.platform == XE_BATTLEMAGE)
>> +		return true;
>> +
>> +	return false;
> 
> 	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> 		return false;
> 
> 	return true;
> 
>> +}
>> +
>> +/**
>> + * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
>> + * @range: SVM range for which migration needs to be decided
>> + * @vma: vma which has range
>> + * @region: default placement for range
>> + *
>> + * Return: True for range needing migration and migration is supported else false
>> + */
>> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>> +					u32 region)
>> +{
>> +	struct xe_vm *vm = range_to_vm(&range->base);
>> +	u64 range_size = xe_svm_range_size(range);
>> +	bool needs_migrate = false;
>> +
>> +	if (!range->base.flags.migrate_devmem)
>> +		return false;
>> +
>> +	needs_migrate = region;
>> +
>> +	if (needs_migrate && !IS_DGFX(vm->xe)) {
>> +		drm_warn(&vm->xe->drm, "Platform doesn't support VRAM\n");
>> +		return false;
>> +	}
> 
> I'm not sure if this warrents a drm_warn, I think an assert would be
> better here as it shouldn't happen unless we have an internal
> programming error.

Sure.

> 
> Matt
> 
>> +
>> +	if (needs_migrate && xe_svm_range_in_vram(range)) {
>> +		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
>> +		return false;
>> +	}
>> +
>> +	if (needs_migrate && range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
>> +		drm_warn(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
>> +		return false;
>> +	}
>> +
>> +	return needs_migrate;
>> +}
>>   
>>   /**
>>    * xe_svm_handle_pagefault() - SVM handle page fault
>> @@ -763,8 +808,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	range_debug(range, "PAGE FAULT");
>>   
>>   	/* XXX: Add migration policy, for now migrate range once */
>> -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
>> -	    xe_svm_range_size(range) >= SZ_64K) {
>> +	if (!range->skip_migrate &&
>> +	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
> 
> A little odd to pass IS_DGFX(vm->xe) as the region...

OK.

> 
>>   		range->skip_migrate = true;
>>   
>>   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 9c4c3aeacc6c..d5be8229ca7e 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -95,6 +95,9 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>>   int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>   			   struct drm_gpusvm_ctx *ctx);
>>   
>> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>> +					u32 region);
>> +
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -281,6 +284,13 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
>>   	return 0;
>>   }
>>   
>> +static inline
>> +bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>> +					u32 region)
>> +{
>> +	return false;
>> +}
>> +
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> -- 
>> 2.34.1
>>

