Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545A2CEDD89
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 12:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2BF10E2B0;
	Wed,  9 Oct 2024 12:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUr2URwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6536F10E2B0
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728478162; x=1760014162;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3udiRy245D6ygI33o/aGeifJtFkuhcJlmSoc4HFCkbc=;
 b=VUr2URwWWfdyvAsm1+cSqOYhj28+Lpab0oHp39Nn2DRP1/flYgkXydvV
 s//wuqVqsItRYGg6mQSro26reNFjU6Bv30LtNUoVZL4/AbZ2Vqp8pFg2F
 pfNEneGMJyRCJIWqGZECoXgvc+Xmj9GasG84nhUcWswIEuKNTQsD4uJp9
 342HeOTZcM1L9T68Q1EDiwtFKgQL3EToFvXEllg2IcNVkxqiyuhfvvC+K
 9S5rz7uIkG87KUfGjKJurZatkiX5jnJM+Ab3aD3SaZkpaLts4wutjH2EL
 NIi+gUdnYrONNUkgC2xGGPczS5rUzhxcOavFj6qdgoPZMUX1wTexv4KJ3 A==;
X-CSE-ConnectionGUID: wjjkEUb3S+yxo8Hwe2SKvQ==
X-CSE-MsgGUID: MPQ+CD/HQ0yRmvZ2l+29Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39166101"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39166101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:49:22 -0700
X-CSE-ConnectionGUID: OoirXbYWQ5uO6ppFKOzL4Q==
X-CSE-MsgGUID: TfAKzFRKTummZgfz2AByPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76338350"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 05:49:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 05:49:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 05:49:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:49:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKDuuY7Obg9VpMWVipFIW/vn+B8yz4Yb+KftJoObz37HeWgXqX+HiEMIh08wBVb+AqKLVFuwA6+Sn9yylYnkdnYMTkPresApyfJjRbMLGR34zuWs0xOyCbnl1q2n6Q4qwfjmUOO7gYGV9H8ZT0wGbWTn8C3cpMOiII4ApaIXwLF+Z2ao+U6tkK3j8oLndI0xHunpm8zCGA3mgiyCMcG/DbltkMQBHO2lmU4LAAuVbLgXHHr8ERhfez6xvjrqk8Nso+ithk09PcnHYZX3BsAvC2123epR0zbL6/eaxoFfRSR6qwRXD+4jue2PBsvtElsEbcY7jtN6NfX+r0ig35p7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWPNn9hzFBOJo5wGekrtqBDSwA4ujuRXPMJP/ABjLZE=;
 b=F0LQcTs03lIhTtS3oI+9eRycYdSY09JuTcS2rWsVzwq/9NdafcJaqlHaLXBm98TMykW/8wauQwI8E5h+PNOfKr6MbcNun5eToorD0FNxS2me4SHXiBnGTYZQM4W8OlUpF4lErzTftpVQn8geq494d0uOrKReb78jpUZ4kv1FA1Kl5vtBO34pzXrvIc8aCHPpp6ml6pZ23UVCgyYe/Z/sC5MGqlDGX0etLA+gtp4UBF4+TOiuCw1h6J5g2pygUs1NMIex6tefbyfo6mL1Hq7mavD8711zQiqR+/bSrA3rGtICq1c8+r8sofrgmaNZW1R2mthGsBnZo7XG4ktBRL5T3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5189.namprd11.prod.outlook.com (2603:10b6:510:3d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 12:49:19 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 12:49:18 +0000
Message-ID: <e7fd1abc-285e-4bf1-ad5e-46b263ff2c0b@intel.com>
Date: Wed, 9 Oct 2024 18:19:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/26] drm/xe/xe_gt_idle: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
 <20241008071115.1862704-11-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241008071115.1862704-11-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5189:EE_
X-MS-Office365-Filtering-Correlation-Id: d787b197-ddfc-467c-22cd-08dce860ca23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHV0cFBreDU5RGhWZHJxUUowalJKVFZsanFTc2lTMWZHaEJDUVd1elkwYlNu?=
 =?utf-8?B?c0dkQ1REQ2JSYW50U1pueldad2V5VkdaMlZoaTFhQ2tvRWd0UGxMZzgwWGpO?=
 =?utf-8?B?cVViTVA3eVpXNlZYeFZxcTB1SVd5UlNKUG1MVFNSTWZmeS9MMDZZZUh2bXRU?=
 =?utf-8?B?K2YybWJDN1pVdCtPTHVIMUFVMVR5SUxCZjF1cmtLWXpjS1RBY1NYMTZ5cTc4?=
 =?utf-8?B?RkEyTjYrdi9xL1k4UGxQK3pXVWRNejNnNyt4Nzhmc0JweXFjVWFBSVF4VHhx?=
 =?utf-8?B?S1VWUW95VGF5SnRjRno5a0VNUTJLN0Rsck5reWZqU0VKa0VISnBVeUl3dWlG?=
 =?utf-8?B?RG13cVFycUNwNm1BajRTSm90aEc4Y3dIRHVNbklvanNNOWhjbE42bk9QSkRB?=
 =?utf-8?B?MitBQ0RQUllyejlVNHJvVGNOMlJyM3dxd3RNbWxCQ0NnREszbmtRTFZ2M1kw?=
 =?utf-8?B?cXhTZVVlT0dudjFDRlR5S0l0eVR4MWdNUm9jL3crbmJHUXJGTFdrUGp4LzVI?=
 =?utf-8?B?aVNrRFhlbU9LRVlldzJ1dUoydjhreFlZS00rWDFFSGV1VW9pNWMwTU14OFVP?=
 =?utf-8?B?OWRGWDZVSjN1SjhSY3ltRURuWWgrdXVneTFyRVNRVlB6SzByUnQyQUhkZW1P?=
 =?utf-8?B?TDlCN0ExcWtyYTVNdzR4M0JIeEtXQlRrTXp4dnJuTXFJK3hVSGM3QWlOQmNx?=
 =?utf-8?B?T3g0TUdVUk1OSXJxR2EzcHlrMTBVbHc1UVVLZG5KekFwaHNzVDJQOFRzYUU0?=
 =?utf-8?B?c2MveERONW9uelh5YzRSWHBsRXdBSm9MOFZIK0ZobUpOT0RZU21PNzhURkpt?=
 =?utf-8?B?bnlvVEQ0T1dUYkZ0cTRhM3JCVzR6clNOelIrY01zSTlBWVAxUnNySGFqMDVo?=
 =?utf-8?B?Q1RsQmd6SEZTczlsVDI2WjRlSUhHOUJhZmNnaG01bGtLSGRhcnY2NmUwN2k3?=
 =?utf-8?B?Vzg4ZVFzZGhpenFzakR0M1lOMXlybysvNWVkdEpwVk8xMHoyK2Q0VzZJY0lq?=
 =?utf-8?B?ZVBaSFAyTE16Q244ZXZEVHY4OUhrUmJseHpOblRxU0lScHFOWDdBSjMvM3cz?=
 =?utf-8?B?TVE3NlpQYnNUTW95ODA3ZFF1cFZheWZ4RkZEUTBZQWh2YlB5MTV4Z3hlYlY1?=
 =?utf-8?B?aHArVEg2N2llQzg5Q05CREl4N3VuNllsZDlvY1VwNkM2UTBNZzVkaFBVdGVj?=
 =?utf-8?B?WU5seFFrV1B2NmFBc0NlRUJyWlk4bjRLaVJTWGZ6dG8yK1duOVZDVUc3emM5?=
 =?utf-8?B?NGVPTGFYc3VsY0ZueDF0RXpMZFNKeEVSckJoTlRJL0x3RkRlaDNQMmtxYjlz?=
 =?utf-8?B?UW9IdEdYYmdJRDlBZTBYZWtFY1ltZGxrR1psc0dIYzF0NkR6emNUN0hobjZS?=
 =?utf-8?B?R09kQlhlOERIc1VIT0FoZXZ5RW9nK2xaUWd6VmFDb090RXpWNUF5M0EvaUlD?=
 =?utf-8?B?c3R5cnZmWm91TFovY2NKU010OFNHYVF0bGVsUGJEb2JHRC83QmUwNjBad0pU?=
 =?utf-8?B?NTJSV2hWMkFxVFBXTGJyUldsZkxYcTdjOEVXRUYvaXIwRXU4VFN2SlVLcVk5?=
 =?utf-8?B?dGhhdWNLczV3djZJNXpVV2dxV3lpejU5MW5vTUgza1NsdC9VSUN6aTdLNVdo?=
 =?utf-8?B?S0ZMdlFyeGJDbWk1Z2huMWI1cHhvbHhKbmtGSWRhRXVEb2VoWkpRWmUyN0w2?=
 =?utf-8?B?aUFFOXlWV3ptVVJSaTNWdjMyNCsrSngzNjJsMjdGU3QyWU5pVHlNVjR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk1lNFdScnNPaTZod0tFdFNRNGdNdjdOWVRXZWhMbktLbXEyQ2J0UU5MeGZR?=
 =?utf-8?B?WUhxa3NSSTNnOXZVUW1nLzhMdTFBeEJ4ZlJQT0RaaUlZNFJYMmNpL0VoVDdN?=
 =?utf-8?B?Z0xJcGszcms3MFBHY0QwNkFCY3Rxdmk0UFJqWlVEbEJCeGtWYzdtWVlDR0pY?=
 =?utf-8?B?aVZ1UVRFanhGYXNSemVJbko0YkRxUlZhdVFTbU4vWFA5UEpYaVdXQlRLSmJj?=
 =?utf-8?B?bVdETk93UmEzczBadWhpczJ3MVE4ZzF3TzZrb2prR1V3SFc0c3V0L0VkNm5p?=
 =?utf-8?B?MmIwRFg5czJ5djdWQ1ZjdDdMTGlvSHU4dExwYUc1SXFIYXNtRFY3WVBVSjZl?=
 =?utf-8?B?ZWUrQXh0THJPL25ETksyTUJJTC8rdnF4NVFxNU52YXpaWHhYVzVpMUhqRU9Z?=
 =?utf-8?B?Nm9DZVZ3YXp2djBVRkhpbGxreHA4SzVXblg5M05CR0hrZk1MQ0N4Vk55SXhQ?=
 =?utf-8?B?cHE0NkpOajg5SThlSHNzeFUwRnYzNFBHZzhyV0I3TmlvMUI4b2o2Qm9RZlA4?=
 =?utf-8?B?eUZML1k1REFPRFlVTDFmT3ExdjZDanFGWXJXc1FIUkkxN1gxRTJ1QVpLbXZN?=
 =?utf-8?B?N3NPbUNjSTNEU0R6bDJUZTNMQ3Z3RTlaUE5jQ3J1Z3RBR1lmcmJDQVFDQXJs?=
 =?utf-8?B?SHVKRXY1NUxLTi9GNGoveVhHVnVyNXplRTB1YjRVTHlLTWFPMStVTGZnVHht?=
 =?utf-8?B?aXFCSER3RmtITGpldmE1NmNCZ3BVeGpxdUhKUlBFWFE2R1llUUE2TTlpY0xT?=
 =?utf-8?B?NDJBQzYyMHVCbmlmZG9pa2N6UTdKanJjYk1vZnJLRHYzcGdSRklQZ2dBSlFx?=
 =?utf-8?B?ZmJpM05EM25oUXlqSUJadEQzTC9INmFhZTArV0lwekxsRE9rdFFDMjYvdWtJ?=
 =?utf-8?B?c3JDMFVVZ0tGSWY2eUd1d1FDM2J0NlVZdC85RDFSNUdJWEk5Umk5RlJLc0Zk?=
 =?utf-8?B?b2YvQzJ4c3cvOFBhNnZxQmFDbzhzYTN5R0dIeVpiK1VqSVN3azVvOTdwNGtK?=
 =?utf-8?B?MjRrYURMM3ZOb0x3REJFdWZUaEZtYnF2UW9ZTzF4NzJBaWlxSXpXdjBZRDVa?=
 =?utf-8?B?VTN6ZktzbjRmSVhOUG02V2xJTkpIb0tlV2FYbHBNaUdMaFlWaURMbXppN3VU?=
 =?utf-8?B?c0huT0RzSVo4YXNvdUhSa3JyeklZZnEvck1ucWJXTW1tTXQ4eEhuTzI0cm82?=
 =?utf-8?B?NUFyRThyRGhTVStpc3VzK1RHc2FPWFg5a2ZISG1Sd1hQUkQrSU1pMHo4aWM1?=
 =?utf-8?B?cVRCbVhjaTgwTzk4N2VBcHgrZldFMkZUeFlTeXVNNnVmYjUvWVJNcmtKczdK?=
 =?utf-8?B?TVNQUGU3b1NOYmw3WVdCNWF5K0QzMHVxWVdPeXV4UlkxajdPbGxDcVRRaVZO?=
 =?utf-8?B?SFd4QnhsRmV2a1hIUkd3dkNpNnAzQlppdmFBQklXc3U2MjhpK3VoSFg4dE5W?=
 =?utf-8?B?K3MrQUFnTjV2d3Y5ZHZ3YzYvampEUzhCL1ovSzlQNFlsTHhpMXExbXNMejVl?=
 =?utf-8?B?cWhaT0RYd3ZRVEFqaGdzREMxQTMycjArV0VJTzkyOHY0MGRoU2NqbzdQVjlx?=
 =?utf-8?B?RTYwa1J2U2VtYTFWZkE5RkNrQUxYRVExTHN1SWhsUnYxcWRST0pYTDFRejh5?=
 =?utf-8?B?L1VHN1o1NysxREh0T2lnS3JQODBJSnI4YmIzKy9xb1I1MzVyTlBiejllWGhG?=
 =?utf-8?B?Q01BY1VtQ0xJTUc5QjAwL3lUZ2dMOHpILzZrdkYxVXF1Q3liYkN4a1lWc0Er?=
 =?utf-8?B?SllvODRNTXcxWkZsaDQzM3Q3RXc4aS83S3hFSDJKU0VFSSswNnNHa1dscXI0?=
 =?utf-8?B?bGRDWXJFdzhJcTJEb1FOUnBjbmR0bE1kYVVyNUJUeWh5MHpuMUMrVnNCWlh6?=
 =?utf-8?B?VDB0Q3IwdEhvS2JldDR3aG5UQmhUQjYrUnlrbkI2WWpIUko2WHd3R1ZoZDgv?=
 =?utf-8?B?aURiNGxSRjQ4T1dQT09zQmdyT1dIRDdGQ1FGU1NkcWZ2empXdUhwU1pxTUsx?=
 =?utf-8?B?MVUzSDNuUWtzSnVyWVk1b2JYY2tzNVE3bEhobExjY1piTEZMWWlOY0VuQkhS?=
 =?utf-8?B?WU1EWGd5bVZYaFR3SHhseWFWNVRRRzZvcjQzV3p5MHpmalRTUWR0c2xDUmVR?=
 =?utf-8?Q?DupOWTHGNCACM+B0At0FwUbv8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d787b197-ddfc-467c-22cd-08dce860ca23
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 12:49:18.8694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lb2EGHWucqNPMSbEWl4vf3USOuLfEV3uNtseytj4ku5YBn4918inYrG6eaUz3w05ehqylHepmA1f3ytVdeS36g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5189
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



On 08-10-2024 12:40, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v4
> - Rebase fix
> 
> v5
> - return unsigned int for xe_force_wake_get()
> - Remove reudandant WARN calls.
> 
> v7
> - Fix commit message
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_idle.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index 746812aee8ff..fd80afeef56a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -101,6 +101,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   	struct xe_gt_idle *gtidle = &gt->gtidle;
>   	struct xe_mmio *mmio = &gt->mmio;
>   	u32 vcs_mask, vecs_mask;
> +	unsigned int fw_ref;
>   	int i, j;
>   
>   	if (IS_SRIOV_VF(xe))
> @@ -127,7 +128,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
>   	}
>   
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	if (xe->info.skip_guc_pc) {
>   		/*
>   		 * GuC sets the hysteresis value when GuC PC is enabled
> @@ -138,12 +139,13 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>   	}
>   
>   	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   {
>   	struct xe_gt_idle *gtidle = &gt->gtidle;
> +	unsigned int fw_ref;
>   
>   	if (IS_SRIOV_VF(gt_to_xe(gt)))
>   		return;
> @@ -151,9 +153,9 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>   	xe_device_assert_mem_access(gt_to_xe(gt));
>   	gtidle->powergate_enable = 0;
>   
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   	xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /**
> @@ -172,7 +174,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>   	enum xe_gt_idle_state state;
>   	u32 pg_enabled, pg_status = 0;
>   	u32 vcs_mask, vecs_mask;
> -	int err, n;
> +	unsigned int fw_ref;
> +	int n;
>   	/*
>   	 * Media Slices
>   	 *
> @@ -208,14 +211,14 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>   
>   	/* Do not wake the GT to read powergating status */
>   	if (state != GT_IDLE_C6) {
> -		err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -		if (err)
> -			return err;
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		if (!fw_ref)
> +			return -ETIMEDOUT;
>   
>   		pg_enabled = xe_mmio_read32(&gt->mmio, POWERGATE_ENABLE);
>   		pg_status = xe_mmio_read32(&gt->mmio, POWERGATE_DOMAIN_STATUS);
>   
> -		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	}
>   
>   	if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
> @@ -298,13 +301,14 @@ static void gt_idle_fini(void *arg)
>   {
>   	struct kobject *kobj = arg;
>   	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> +	unsigned int fw_ref;
>   
>   	xe_gt_idle_disable_pg(gt);
>   
>   	if (gt_to_xe(gt)->info.skip_guc_pc) {
> -		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> +		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>   		xe_gt_idle_disable_c6(gt);
> -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);

LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   	}
>   
>   	sysfs_remove_files(kobj, gt_idle_attrs);

