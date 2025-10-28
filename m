Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E54ACCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 18:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC84A10E084;
	Tue, 28 Oct 2025 18:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYRW7BmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5413010E084
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761676000; x=1793212000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R4zHm7zMoh5UWusr6RIn1oPwX+D98RfViWwmmbnMDG0=;
 b=iYRW7BmBe+QMvC2PjqIfElD6w0SWr3WRE2ccOaxatT7+wQBG3qHwNJ6l
 CNhLYKXU0+BTqsIucGSKPHYq8k5hTRfA/ruf5yuWdLUmJejB5zsI8lqZ+
 UvhQP3d4wOgT3YwyceC9vyuONmLiugEuRu7cKz94pKD7SDjGCVHris9Wz
 29MaxFJUblLd33WyXtzk/Ceg4z1OemTyNp7+CvT1nV7MfT0A0Nh+mhBhk
 WjilxlIay727rB+4Q0DI59URflv93jySm+CzhGlbO3wARp8+xlF6DBqqT
 nnXm8dIFqbw2NVBXPQbNLwsm4YoQ+G9in/rr/Kc3wjNNJz6ph/RMMnU29 w==;
X-CSE-ConnectionGUID: y6/55IsvRAWjdesFAPpmzw==
X-CSE-MsgGUID: brzx698tQAuxR3fueXp3jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74906205"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74906205"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:26:40 -0700
X-CSE-ConnectionGUID: p3cMPqL1SxKpttVcIHHhbg==
X-CSE-MsgGUID: 8E6YGcsnTRu5ePBjH827Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="222649125"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:26:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 11:26:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 11:26:39 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 11:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gfyi8L+To1iGL8l4uHOlSS/hUeA9BeNVFR/V3zK663R9Fzv0HpQdVe65RmuGLixdeBVab9tlwO8jfY76+5ulpc4kWT1iF+ILAFCj8eH0tRa6LKpkHJCDyprm/sjUnTvyLQXwG2rDYzFAENnmf9D13MeEEeShLu72iZn0xh/daC+wg4z23TZVr1AWszhLzBJo6zVJOAzugDDNn0S0v4FK9PkYdA5LCeWL4GHfbmhMaVEcvxCAml9Al9uPA/D7hu81lXxSIUfav1vPwWYT9dq0Nv4zvbcbTE1z8N/6HXWDAI4aTJSqebmsYA5DZtjOW+cxyTV24p5J5U7bt7kKy7VlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeITrYwaCIYRpr0zI9L95Vu5gwKx46X8bsZ5niHDXA0=;
 b=lg84xfcfRseTVaGJ72BxWbSPs9On1fokDPkRkn/Y+fnXmtQdJmE8MXTs1aqK2vxSfMHogRxitY6WMvbe0e2pr7y7HQTzUkypn2Z+gqWj2wNyJ1m/NDTtzc6ZYCDaINNxQ7zhIYkDEfoGGykxOtxDPjY5x7TWXnHK0qRF+z1+GxvTUPZCXeHG1sXcF0t1jcnW3AZOgxGNTpm5EUlu0tGOShMt1jZk2P/1Wi/FMpnTV/xn561zcqSthmqH6dJuZ/nTNTt4dsBD/rlqCxewYaMV9TY+3FDqnIe63h3emhrt54w27jh/k22LqPF6amIWch9/Hbc3pRPP8XuHSUQsN5un0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 18:26:36 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 18:26:36 +0000
Message-ID: <6609ff30-2c38-45dd-81ca-3ce852d5ff55@intel.com>
Date: Tue, 28 Oct 2025 11:26:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20251015181159.92509-2-jonathan.cavitt@intel.com>
 <4c8b3cd7-13bc-4051-b58d-df5c68e45e2b@intel.com>
 <CH0PR11MB544495482BE4637C9A705605E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <CH0PR11MB544495482BE4637C9A705605E5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV3PR11MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f30f8f-0fb4-4ec0-d9a3-08de164f874a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0JQSEsvcFBSK0kwNVVLUjNJZ0FQZmtGb2w4eTRMS05mMzJYa3IrczBFblh6?=
 =?utf-8?B?eWlQTW9iNHBTTlhFc2VpYmdkTUQwK25uQkVDeXM2UDNwQTJRdkRwMU1pS09S?=
 =?utf-8?B?blRtajFkSTVURkZXTndzNW1ieEE5Z2tOR09lTkhCbGh4WnYyRU5wZ050NXc5?=
 =?utf-8?B?Q0h0eTJOMEhxOGJWeGFXOFpleGtoWnIzd0FsN1N5MFRQZVhTQk5hM21vUkhS?=
 =?utf-8?B?dzVlbFJiOEpGUFZiTUdDTzcwK3hIR2F2eG5nTWlDZWJjeGZpS3pJaE5pOGt3?=
 =?utf-8?B?bFJBamRtTUJYWnRwNG5zVEJjM1ptdVloSkF2S3VEUjdkQ2QwWVZVSlIrZk9H?=
 =?utf-8?B?ZDBWMUdvalJoN3hSNzh3eFdDdGdPdXhtcFRYWGQwVE5mSjJvU1pUTlp0ZFEv?=
 =?utf-8?B?WmRGMGlPbGEzRDZCbmhyaDBzVTQ3eUVrMzl2Z0NRSUhMd1pZRDY3cWZrd1Zv?=
 =?utf-8?B?MDNwWUoyUUZhcDBud29HTkFlcTJzVXgzaFBxdWJHTnhGQ0VBK0ZFOVIxM3Vy?=
 =?utf-8?B?ejhpekxLaXVXYzBxamphYm1kczE1ZnE5dDh4czd3UWVHdExoSnFmV010bU5v?=
 =?utf-8?B?NUJWZU0zdHllRlc0ODFDRXI5cGRYdXF5YkJpUUNCeGxUWUYyNGFQZGZZOWhR?=
 =?utf-8?B?dHpxSlpWNE85Y2VzUHVpek5TYXluYmtvMGhGdlZYcmorK0hBYnBhRUhVUnlL?=
 =?utf-8?B?SDNLdXV2OHk5bnJuL0dFWklXNWEzSVNjSHpOVEY1VHRhKy9VSnRyZXpUS1BV?=
 =?utf-8?B?d2lObGJ1NHJaV25Dc2FBQlhac3ZFcm4zRGsxeURoUmVlTHkxZDF1R0VabWxh?=
 =?utf-8?B?TDlqUFA2WG1QVXI3RmVKWjF6NUh4RGNQK0luYytNOFBuNjVuVmVoVWRYU0RS?=
 =?utf-8?B?OHYxNVhocXdWd09ZZU51bGVZbFU2U3Qvb2hnSm5BMHNWdWgxSlFYSHBVSXNk?=
 =?utf-8?B?OFluUUZJaWVEd1hoUmJ0cG9RaDJTSnIyMDMrNXFYN0VsZGgzWFVkZkY0MU1y?=
 =?utf-8?B?a00vMzRacnFpSHdIaStGVllKdUVxQjFVYjJKeVMwNlZWMVZDaDdlQVA5N0tH?=
 =?utf-8?B?eWl3NGd2cUQ2QWhDMUFQTTJtQkx6SjVrak0rWlhTRGdVeTZrSWVuYXNIU1Rj?=
 =?utf-8?B?SmRSNDZwMlI0RXpwVmVmaDNqSGViWjJYWUdWaEpQZEFRM05ob3VWaE96R1VF?=
 =?utf-8?B?UjhxeGNwSFhvZGowbS91Uno4ZVFVSTRqRm1JNmJ2WlZTUXAxV3ZTYWY4QnFR?=
 =?utf-8?B?TVZ6TVhMVm9iSDRBYlJYc2hteUl1K04vWC93eFJhdDhtWEE1K3IxTld0enRy?=
 =?utf-8?B?VVo3dThaa1ZqbkpWZEVkQWcrcHJNZmlhNXpyRTRrUVYyallXN0Ivb054ZFhP?=
 =?utf-8?B?UVU0MnpqcnY5VjEvOEhUcG0vNGkyK0xQdXBqWjZnWmN1TytIMzlKV1FRcUtq?=
 =?utf-8?B?LzVEaHV1Mms0SGZzZzRpMlE0K0RhQUgxV0R0UWJUL1ErR04za21mcUgyenNV?=
 =?utf-8?B?U0hOc09NRW12dXkycElhSUlRUXpVYmJjQ3luY3VSU3c1ck9USjBHZDBrTFZq?=
 =?utf-8?B?UWltRTVpRVA5SUg2UW85elNveG9hY1R4cjlDKzNTYUw4bUczWDMrRGFNR3RF?=
 =?utf-8?B?NlVKR3lYNkd1UnJkUnp3YzJUNlVPbE4xaFN0eEc1UWMxdllDUHRLam9tQ1A2?=
 =?utf-8?B?MUxERGVkTlhxWFJ2K1BLMVp4Y1NZd2pDMzlseGFYblgwL2FqLzZRWWcvdlZp?=
 =?utf-8?B?eE9LZGdjRmdPVzFtMWpWbnhFWEFSL2FxNFFpMlM1R0IrVHhjV1VVK1Ezc3By?=
 =?utf-8?B?NE5oQWM4S1piQllvOTdDTnJyZkMrYUtDMm1sUnl6VFJmcFpZOEY2c0JYRVdL?=
 =?utf-8?B?WUs4SW8rMUJJbUROU1UzQ0NYdUdmVkt0MVg1bDhNeVMrUllUY2VvVmNCR3A2?=
 =?utf-8?Q?TWq0nwe/vnHgi4FsU2lMr4Cfl6MUQsSi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFlQNmdTWTVNRmVtQ1NuRzFGSVJVRXlWTEJRcUkveEZnK1IvNVF5MDVRcE5l?=
 =?utf-8?B?aW5ObUEwWlFWUFNXdVUxVjA2MktlYWlGMk5kYjdRWXRjOUd1K05oUXpobGs4?=
 =?utf-8?B?M3ExdXRJVkR3d0pTWTRkbUtLNkpTNEh5UTduNjE5ay9ORnlpQTRFRDNBbGZY?=
 =?utf-8?B?cWk5T3lRQVVWYzZxMS9pRWVncG5nUWk5SEEzOVl6WHpjNEhCL2lEbC9SN3Ex?=
 =?utf-8?B?V0ZFVEJrYmpMODBLcXFHakxXOUhzVGxNZkkwbzhCYVhXWDl0UGdTL1gxejVY?=
 =?utf-8?B?OWxiOUFZODUzNUx0MWlFbWpFTDFLL1pHdXhsQVRTMHhJd1p1WkNocGR6ekYy?=
 =?utf-8?B?ZklrTi9sNElBM3FXR3RETjMyRTUwdzhCVnByRnNKeUdRUzNaTnkvdmd2T3ZR?=
 =?utf-8?B?OTNIM2l6VlJPZ2xVZUhNaWxlMGxraVVKQWcwQ3pBYVJLTS90M1dNVXNySzNB?=
 =?utf-8?B?Nno1VnUwNHc5K3g5Z0F0MVhZUXFPeWY3eWM5NWVEWlJXeFdSTmtDZE9iNUU0?=
 =?utf-8?B?K0hFZzJaRFFKcmxGTXlUZjBkYW1zNnlYSDlHa2syTFNiUFI2T2pWYlB6Q1lV?=
 =?utf-8?B?S3NibUNySjVXT2NLeVd1THpyWUhaRzA5VUhnWHh1MW93QTRFVW9UWVJWUEdT?=
 =?utf-8?B?SDdpeFprSStDRng1UGs0UGgxNzhLQVBTVFNPMzFBZ0VqVU9laE9VVk5WenJM?=
 =?utf-8?B?NmozTUJyc1JRWGoyRGhlQStyMXBkSjZBOXRNRTdVWklvWXRVM0dKZ3JRUkl4?=
 =?utf-8?B?djI5VW02dlFqMUxqZ08xYmJKNXg3QUZiVy84dllycXg3eW5XaGdxZEZ1K214?=
 =?utf-8?B?MmZjZkpLYnBDMm9LenF5cktWa21JV2tWcENFeWo3Y1dpQXo3SThyMnhyQkRF?=
 =?utf-8?B?enlsdndWTUhndllEMVgvb01KTmN4QjVZSWdNRVdvMXdRdEdLZEhkUDJ4NHR6?=
 =?utf-8?B?dEIyQ1FURE44U2FkMUNqV2RQOG9vcDcrRkhGMU0vSjludVJ3azBha2c3Q29L?=
 =?utf-8?B?QzZ5QzFVeVdrZUY4ZEo5dGJ2NGkzdldqbW5BSUlEb0ZiMnNRakRyQUJ6eWJG?=
 =?utf-8?B?MWp1azNGaHVraE1vdmJpS2Y0MUo3TW9JU2V4TnlncnZNMjQ4d0EyaUhFS1lG?=
 =?utf-8?B?ZTdxdUlHWGswZ3RyUmlCN01xaHNrbVVBMkFGQnIwRmdvNmEvdm14YjN5QmNm?=
 =?utf-8?B?YTEvNU1Bd3NjUGdKeWFlZEtSNXNjK3dCUDV6Y3lhdmxWREtURkVzYUxHUkFy?=
 =?utf-8?B?VE9VMDZuVityY09OZWVBS3JjaE0zZlphd1dqb21qSDZYUE05cUtCYk02cHQz?=
 =?utf-8?B?aW1FQmQ2L1lkYVMwWWMzNis4SnBrSkE3NFBBRnMwT0FWV1VFZzFyVC9yMlZJ?=
 =?utf-8?B?clBEMjJ4MzBlWVpHZVhvMmo2eFFjMDZsNWVPQTVneFF0ZW1PQU16cWFNek8v?=
 =?utf-8?B?emFQUmlKem5wRGlmZllnTzI3MlBPbW92dDBXNi9wYk5JeS8yZlJ2L1pJZ3Ro?=
 =?utf-8?B?UVZXTlZnZGZDYll6eXdYVU1NK1RjVG1GWXZFWU5BbURxRkRmUjVFUnMzV1J6?=
 =?utf-8?B?eEptL1dyOHA0Z0FMTlVvbU54dnBtZlpTYnMrckx5emVmMWVEVVI3YWV2M0V4?=
 =?utf-8?B?TlM3R2JoT0hnbERnTkxxSytrRGtCRkJzNGJtT0pHVlhaMTRJaFJWZ3BUbE8w?=
 =?utf-8?B?WUZSejNSL0xEZEpHOXQzdnU4MGo5czIrWWEzSlRZZlhtMXdISy9lVnVEUWtS?=
 =?utf-8?B?UUdCN1FGQ2NRc3ZJUEtpTUtuV083ZnlSN2hVMnlOS3ZvTTdOSlJ1SGM1QTRa?=
 =?utf-8?B?U0Z1Q09QYjZnNlJnSGJ0M25tQnA2VXdGTUNMSFFuaTMwa29MT2xOblU1dVk5?=
 =?utf-8?B?dFdmMnpVOGt1bmlPdXJiQ2xDOUhSMEViUHZUbW1TOFZ4NXpRTjBndXhmcmJM?=
 =?utf-8?B?RHR3WHJ1YXdyK29pT3V2c2dyek9FeUxicUZFeVgyWWxUM2c3UUxEZ3BsbGxm?=
 =?utf-8?B?Mm1xN1RrUVhzTWUrNjlqQmthTjByY29JNGNmekJGUWs0a1pkUWV4aCtqSUdH?=
 =?utf-8?B?YStVS2N1Zm13N0hkWEhXVFJrQjNacDNxcnNSL2FWR21wTFFuVU5VRGdROG5S?=
 =?utf-8?B?V295Q3hhZzVBa3c2NSttNjNheDJ0U2tNZmhQMzZwVnRwTEJBMnRKSitkelBh?=
 =?utf-8?Q?GNl92wK5S0s3U9Q4brOpaYY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f30f8f-0fb4-4ec0-d9a3-08de164f874a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 18:26:36.4058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/ipYnuNQyUhFT/z2iYNegSBkF1oSxriaMCf2DMHOVrIXxMp9rRYnvtpTzCzwVtHL8leJWy3EIHgqCxZaL9urdtn58qRCeTWVjRGVSHUUIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
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



On 10/28/2025 7:37 AM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Sent: Monday, October 27, 2025 2:40 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: Re: [PATCH] drm/xe/xe_guc: Dynamically decide g2g buffer owner
>> On 10/15/2025 11:12 AM, Jonathan Cavitt wrote:
>>> On today's driver, xe_device_get_gt(xe, 0); can never return NULL.
>>> Hardware-wise there's always at least one tile, and every tilie has a
>>> primary GT.  If something went wrong during init of tile or GT and we
>>> couldn't create/initialize the structures, then we already aborted the
>>> device probe immediately and we'll never get further on to places in the
>>> code that would be chasing a NULL pointer.
>>>
>>> However, there's currently ongoing work to allow the primary GT to be
>>> disabled via configfs for debugging purposes.  Once that lands, it will
>>> be possible for this query to return a NULL pointer.  This can cause
>>> problems in guc_g2g_alloc, as this process currently relies on the
>>> primary GT always being present.
>>>
>>> Instead of making the primary GT the g2g buffer owner, make the first
>>> GuC passed to guc_g2g_alloc the g2g buffer owner.  This requires keeping
>>> track of the g2g buffer owner in the xe device so each GuC can know if
>>> it's the owner or not during initialization.
>>>
>>> Note that the associated kunit testing code does not need to be updated
>>> to reflect this change because
>>> 1. The kunit testing code always runs with the primary GT enabled, and
>>> 2. Tracking the g2g buffer owner in the xe device is unnecessary to
>>>      perform the functions of the tests.
>> I'm not convinced this works without modification to the selftest. In
>> the case where the G2G is already enabled, the selftest will destroy the
>> buffer (see g2g_free) to create a new one for the testing. Both for the
>> G2G_CTB_TYPE_DEFAULT subtest and as cleanup at the end, the test will
>> call guc_g2g_alloc() again; in this scenario xe->g2g_owner has not been
>> cleared but the BO is not allocated, so the code in g2g_alloc will try
>> to do an xe_bo_get on a bad pointer. I couldn't find the g2g test in the
>> CI results so couldn't confirm that this is indeed happening and I'm not
>> missing something.
> No, this is correct.  The solution here should be as easy as
> xe->g2g_owner = NULL at the end of g2g_free (and maybe
> xe->g2g_owner = &root_gt->uc.guc in g2g_distribute for completeness sake).
>
> I have to wonder what the point of disabling and reenabling the g2g interface
> in the kernel during the g2g selftests is given we aren't even using that interface
> to perform these selftests, but whatever.

There is no non-test kernel interface for G2G, the G2G is purely for the 
GuCs to use to communicate with each other, the driver just allocates 
the BO for the GuCs. The test just needs to make sure that we've 
allocated the BO and initialized the GuC structures correctly; we 
de-allocate and re-allocate the BO during the test to make sure that no 
matter where we allocate it everything still works.

Daniele

> -Jonathan Cavit
>
>> Daniele
>>
>>> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
>>> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device_types.h | 4 ++++
>>>    drivers/gpu/drm/xe/xe_guc.c          | 9 ++++++---
>>>    2 files changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 02c04ad7296e..e17f8b84b8d4 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -38,6 +38,7 @@ struct dram_info;
>>>    struct intel_display;
>>>    struct intel_dg_nvm_dev;
>>>    struct xe_ggtt;
>>> +struct xe_guc;
>>>    struct xe_i2c;
>>>    struct xe_pat_ops;
>>>    struct xe_pxp;
>>> @@ -626,6 +627,9 @@ struct xe_device {
>>>    	atomic_t g2g_test_count;
>>>    #endif
>>>    
>>> +	/** @g2g_owner: Pointer to the GuC that is the owner of the g2g buffer */
>>> +	struct xe_guc *g2g_owner;
>>> +
>>>    	/* private: */
>>>    
>>>    #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index d94490979adc..9790ddad606a 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -465,9 +465,8 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>>>    	if (guc->g2g.bo)
>>>    		return 0;
>>>    
>>> -	if (gt->info.id != 0) {
>>> -		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
>>> -		struct xe_guc *root_guc = &root_gt->uc.guc;
>>> +	if (xe->g2g_owner) {
>>> +		struct xe_guc *root_guc = xe->g2g_owner;
>>>    		struct xe_bo *bo;
>>>    
>>>    		bo = xe_bo_get(root_guc->g2g.bo);
>>> @@ -492,6 +491,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>>>    	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
>>>    	guc->g2g.bo = bo;
>>>    	guc->g2g.owned = true;
>>> +	xe->g2g_owner = guc;
>>>    
>>>    	return 0;
>>>    }
>>> @@ -504,6 +504,9 @@ static void guc_g2g_fini(struct xe_guc *guc)
>>>    	/* Unpinning the owned object is handled by generic shutdown */
>>>    	if (!guc->g2g.owned)
>>>    		xe_bo_put(guc->g2g.bo);
>>> +	/* g2g owner is no longer valid.  Mark as NULL in xe device */
>>> +	else
>>> +		guc_to_xe(guc)->g2g_owner = NULL;
>>>    
>>>    	guc->g2g.bo = NULL;
>>>    }
>>

