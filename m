Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5539DCCA468
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 15:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1728E10E2C2;
	Tue, 30 Sep 2025 15:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRah/qDB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6257610E2C2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759244452; x=1790780452;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XWVz0TFwi8bhZHvx4qGdlX5QiRoOPguKdloj97/HpcU=;
 b=PRah/qDBRgLto44MsDe1/QnCxdulp3LMaDVGwFhi3YOqYFG4mm7K1tei
 yn5Qs3zEdMv4MlDbDKyBWCnmtLdXBnMhwytPHd7A8QSan1ix4+EMC7au5
 rxi/QIswoyeMwi674jQotV7bzUiKa3TDjszNoLRwvP55NFvru/isiCGNa
 YLTMxLOKdudJw2twBFf6Qq4ve+cVbZTN9j25TS/1hq+vXaEbfEPl758T9
 XIr+02TGkvURv4x/J9wk5EGURQ9yyrrXFMF1Uu+UXLkjGui9IicryEEdm
 3aygdGrjljoWcWiW8j2FyeIpCAb+Lw4bO9rhuwxhlnflxF2J6EaT8CNx6 Q==;
X-CSE-ConnectionGUID: osPaMxxlQiC+jxQtvQhlcA==
X-CSE-MsgGUID: QVOuSXscS8aMK/hUp8DYcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="86948475"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="86948475"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 08:00:50 -0700
X-CSE-ConnectionGUID: TsqH/rf+QhCObSWevbmajQ==
X-CSE-MsgGUID: Zf+hIWjmToCjgkK+AH1i8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="177818303"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 08:00:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 08:00:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 08:00:48 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 08:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrdL3Vfu1gEoeiL55pVKo7REN8uKYdsuWBCiUixPO7RgMw5dXSMoWX+ZwUyaqj8/IgoFzVNYwCKMYjF7V8+CavZrYlu+5TGZs2A4+S+HIM+InUhg2W6s5KbnIFzqWGksSTwbSqXgWWMqD4yIeT4a64lTwlMPIIN43D5mI5Uki3hg27/+8l731AhKaLfyRJRxR2KE8OB8zxBSZ9EGMQpV7hi9tsRDlx0knGarQBaZikDCqym4EsWems/0iwPwfwzYOrUqfF/10cd8NHUpo/4NDfNyIwXiGPAEQnB8jRh/KVWXmKDzFB1wiDcSuVEaJl5dXfmetnQHMWwLNDfEsqJMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTrl7sLL/NH/5zEIbPDXuhXNCW+Pha0nr1h8p0W7ZsI=;
 b=tYxpcgFjOS5eDJRKrjUzMF7SzixG/vHZ+ilc/lreS/ct1drtGCpYUeLmaZQKUrYFBwj1aCf+rSlg/pjwGXePcI6MeRnXKV/+zXfG2pdiT/NiMoPkf5hCVoY06f2diYec2JGH/vV6pqW9OPi0ikYfkrTPbUEPeJAOYnbD+RjvBbjpoEcr5vy9UqGsMyf/mhX+TQPVqvAxOnmZSaxscPclja4RErp6GOpD1e9JDsxB8mvBazC/dC0UeaVsA5HzvtoA8dzN2vEDqCR1P/YsC22zJpNnUCGSPx/z6kFaj0t3Q5G59XOhQiBpF4YXeZB4QCYq4hLVLeBBAz6UVGNDY2TXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 15:00:45 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 15:00:45 +0000
Message-ID: <c1993885-886f-4818-8472-6f965cd7dacc@intel.com>
Date: Tue, 30 Sep 2025 17:00:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/36] drm/xe/vf: Remove memory allocations from VF
 post migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-16-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-16-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::18) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CO1PR11MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: df6e58ce-ed91-49ae-46b1-08de003221c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0JlYk12MTh0NjZFNEU3UVZtYk5XWHJrZ096cm1MSWxXVWxOQk9weHdlZWh5?=
 =?utf-8?B?bEtyS051ZWpuRC94bTlKdSt1eUxXR0hLSEY4ZzNMdlFxNktMWmQxL3V6ZUV2?=
 =?utf-8?B?QVMzTVN5ZzhNK3pZd3F2TVRkbUJxZUcxMURQYmpXUWZjYXdCV3VMMzhCQUhw?=
 =?utf-8?B?bTgyMEhOeWxkaFB1YlBzdlVkcm4xaU5yUExoYkNKckNKcTBiVEoyL3czMC9a?=
 =?utf-8?B?U3RzV3FrRm1PY2pmNTdhREZPdDNVV3hwZUt3YWg0WU9hZ3BpdjE3ZFdvd1Zu?=
 =?utf-8?B?Z28yQUNIVEtDVFo1Vm9GN2xWUzlFODdaWHE4STZwZ1ZuN3ZDSGVUcWFrU0hH?=
 =?utf-8?B?UmNvOXAvVW9yVTJJQ3UrTHJ1TzBoTkw4bWpYSVlqd29BcU9KOWw3clB0VkNn?=
 =?utf-8?B?YWhQSFdGK0N2SGY3eGY1NXR6QzJzSlZjK1pHSU5uS0g3TEdBa25Tb1FvWEQ1?=
 =?utf-8?B?OUNHVE5ZNXNuSnI3dTA3TythTTI0eUN0TWJwMGkwVTR6dVZBRC9TQVhMbDZI?=
 =?utf-8?B?RUpqcXZuWjdGNS9xMUxhYjdzbzN4YncyY05ISlljQ1kwUVZZYndDdUxIUFEr?=
 =?utf-8?B?dXAxN2paQ01QdVdrRUJDdmdhZ2cwWHZwVGs0Mm1zV29xMWhsRjU3Mmw4UzR1?=
 =?utf-8?B?YjJtSnFPN2d1Y1lqVlRzM0ZzcFpMeXRzOUpCV1JsSjFTOGpCNzh5RmdvY3dY?=
 =?utf-8?B?aXJhNnFQSndrUXczZjdiV3VZOEIzQmFJTGZkS1lOdU1xYTV4OGZNU01wRFJk?=
 =?utf-8?B?Y2YrZk8yN01CalZ5TEVHWmZWQWNsN2NWN2M4NHNDcUhhNUVVOHVwejI0dUl4?=
 =?utf-8?B?czVDdHhLc3J0L2pYa2FlejV5b3lLUGk5OHlyc2kwcytHaS9pcDNsWStTOXVG?=
 =?utf-8?B?b3lwbWZJY3A0Wm5SWGRBQ20wbzlhRHErNDZyNEtKWmo4SUx4MkFyaVB0TDFX?=
 =?utf-8?B?bDJDZ0I3UkVjODV0MFY5a3VGbUU1WWVDTEhBV0wvWkZSQVVhWSs5Qm9YVFBh?=
 =?utf-8?B?Z0FGNzNRZnpvZmlqNzhBQ2I4bmYyN3BqSnJBYmw1aUE5bk1OL3dFOHoxZTZJ?=
 =?utf-8?B?VzA2VmUzNE1xZm5sbk9kdjZqYnhPYjBpSkt6TTQxdk1nOHZsZDRaUngvY2dl?=
 =?utf-8?B?UWNkSStrMWZOWHduR0xrZ21xajNWTEZqMSs0SEppVlowdE1rSUFlZEo2UUky?=
 =?utf-8?B?MTB3U3AxR0lmN1U0QWo2Q1NSR3VOM1NhR242RVZNbFFYR3F0dEcwQkpNU0g3?=
 =?utf-8?B?SHNHbGd2ZlExSkthRFVjb25saHovajMrRXA4aisvUE11VTlCeFhpVWxKc1hS?=
 =?utf-8?B?YksxU253WGFWMzllcUNId1FSOW1PQkpvYTU4RU1BN3lRNGdXZUtXZ1c5TGo1?=
 =?utf-8?B?cFl6Qjg3cTExTHhob0Y4eG5ZZXM3RTFYWEd5TmNxSnQreU9oSWdZcXF3c1gr?=
 =?utf-8?B?dlpncC84c1lXMGoweTU0WWdueDFwZVF3RTRqNkd4L2k1Zk82NDlMcmNsWmls?=
 =?utf-8?B?YlExYlRYNmxXM0wrNVMyWnVIU2ZYb3FtWUY1c1ZiSmxYdmdEZ3hwNEFjQmsy?=
 =?utf-8?B?UnhSaTlOZFlrTGNGY203UnVyM25PakV2Lzg4KzZSYW96cjNQR25Dd21GQmxm?=
 =?utf-8?B?UG5uZ1k0UXNCQzhoUjVoSEZjclZuZG5ucjN0M3RzaTZsYW0xYmJJd1ZocEQ5?=
 =?utf-8?B?USt3MUNwZWpZbUhIeWFsQW9PMThGbFJBZXVBZ3Z6endpSUtURjhKV2VzTnVC?=
 =?utf-8?B?YUtyMUNCVVpsNFl4ZExTYzFocE45Nm9KWWdCY3VBdTl5akpLTUhHR3B1MjFZ?=
 =?utf-8?B?TkZsVURXeHphZ3haVm9WUFdxa3JuZlJmbGl1VDZ5RFJxMTB3YWIzYUl5Vm9h?=
 =?utf-8?B?OXg0aldDNmFhb2phSmxhN281dDlDTmZ1dFR0UUFPRDRMK1NDQjBMdXRNYjI5?=
 =?utf-8?Q?8gXq6DITvp6KCU7N1eQZNdk/nWfNvoW/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmwrTDNQSFVNWlFvMW0wM244Q0xob3QrSHZvWDFDZDZvc0M0VkhwejdyMm55?=
 =?utf-8?B?dkFuMytQMHVGSzNYVmxjQkNuQnN0ZUlCd3dlbmFDYnAwTy84dTNmZmx1cFAv?=
 =?utf-8?B?TGd5a2ZNSXdXUmZGVUZkUkVZelVkWjI2eHhUZno2OVVMUlltZ1U5T29GVkg0?=
 =?utf-8?B?S2t1ZEtoZkI0eUs0TzNMR1BrSzRsTnhnNHRpOUFYTWVZc25aRjhUcGRibEZZ?=
 =?utf-8?B?TUkxZEtUZWV1MTFtTnY4ZlJDWlBiN1daaTlvL3M3V2IzR0EydXpXSEpIVE1Z?=
 =?utf-8?B?OVdqd1Y1RHNJV0Y3c3R4RmFPbHcxZjBuMnExNVVqb05zSkE2YVVYTWdob3kx?=
 =?utf-8?B?ZDM0WE4zRFFzZjhERS8xR3hjcjBSOFZWMzJQZUVGaFhnYjg1QlRLc0k4cHQ4?=
 =?utf-8?B?aDZWVHhQbHVCdE1oZGtTcFduVHFFK3FUOTFWdnIyQmtLa3hsVmFOY1pzNzNn?=
 =?utf-8?B?cCt3bE1idXNIVEF0NjFKa1A2SGxBTVQrQTdnVWVkc0x4cFBBU0t5Uk5vOUI2?=
 =?utf-8?B?aytMS0pnWkFRMlZ1eDZTeFluRlU0VHRuZUg0VjE3NDloOGFjVVE5a3ZXUHJo?=
 =?utf-8?B?TUc1M3EzdWFuTXRpTlQxQjcrbzBmNmpZak5VTGwwbjJzOThhRVhrNUZpTFdx?=
 =?utf-8?B?S2FTKzRwTDhrSVdQS3VGMG84WUdIVkVGSDFjbk5GSU5pd2lMeGRIdFZ6WTdF?=
 =?utf-8?B?aG5FVnpjQzVMeHpSaTJrY016aDFtdHBxTldKajBGc01haEh5SWNxbDBPc2pu?=
 =?utf-8?B?VGEvQ1VPalh0MDJMc2lBV0V3N1RvRnJwOHNWdEdkMFlRRDdqSDdWdTZNV1Ba?=
 =?utf-8?B?UUp4Z3Rlbzkzdm82V1lDbitTa1NOdm9SS0F0VVRBZGRScXc3U2JGOE5kWVpO?=
 =?utf-8?B?eXNkRGdQdVdEaVpQZEZQbHdlOUxxRWlaZVRGMW9McFdhUTI1bE5Yc2cwUk9C?=
 =?utf-8?B?a25jQXBsdExiQ2huTXhnRlJvZkdEbElxTUt0Y0xUK2NqZFU4WW9INS9Ia055?=
 =?utf-8?B?SEQvSktIRTRpTnVIOFZqK0xFcmNhWjhhQ2Z2YjQxU09EcnNxMjlrZjQyN0Nz?=
 =?utf-8?B?QnRIclA4c0pNRGtYN0diTHpLcU5sSHdHcStBZThkUUlwOXhITVlhcnMvSVBJ?=
 =?utf-8?B?bkRoNWpOeTdKNlFHdEc3VnVtZ1BGLzJvWHNFK0NKTHA2T2J3Y25jL1orUVpV?=
 =?utf-8?B?NXV1V0RGYkFvMy96TVhqNG9jTzNpT1dsT0ZTSkF3eXFJZHZzZ0pwUWhEREhI?=
 =?utf-8?B?ZC92RWduMlB3Zm9qQm9CMG5pZnhUKzRCWFVPZUlkeGdLNEJGdTFULzROTE1X?=
 =?utf-8?B?MjhKSzZMUThrY2lxcXdKMHhOMElOdk5KV3dJMTRqbUtvaXRFeUFmOWR5YzND?=
 =?utf-8?B?Nlh3eTRxTFlMbjJmeWc4QThDOTNUaVJmQVZUL1c4UkRPSmVPbHIrb2RtOEtC?=
 =?utf-8?B?M3RNMXNuM2tNa2NMSEV5bnh3eTdMUGE2b2RjSThST0FvV2RHQ1dnVFN6TkdP?=
 =?utf-8?B?NGFRcGJiNnV2Z2lXTEx3UTFuYXFDWEZXTWE4b1hQZSs3QngvMmhscTRGYWRF?=
 =?utf-8?B?SnY0V2xtYjZnaDlURjhpQkoybXZKREVMY0ZEdkU3RnlHWHZ5TkVPTHdtY0Vm?=
 =?utf-8?B?WldJT1ExbS9yVHRtc2ZyNFovQm1GaE1nTkhwajkvcGh0Vk9pTjhuZFozbEYw?=
 =?utf-8?B?RE9NdXYyZG9TUGhCYVZ5eXc4Uk1DYUZWaFhVR0tUbzhvNWxNNjU5SFp5eStu?=
 =?utf-8?B?TklFdCtqazM3bmp3c3g5OE1lUGpCN2pyaHRYTXFRMGRBblVHSHRCbjdxbS95?=
 =?utf-8?B?NlU4Q3d6eklDNFF6RWNyWTlHZkxWc3U1SWdYRldjRkZSTHNCWEhEc09US2t1?=
 =?utf-8?B?Zk8rQllMNkdpMjVjRHNpRHdPUUtVcmovVkNmQ3FkaklmWWlHVDUyVG5GR2VE?=
 =?utf-8?B?TlhPREtkbTViaCsxaGg2bytzRDNocHNyejU2ZXNNK1NVbStkbGw2dmQyUjNE?=
 =?utf-8?B?bHRoUFZPei9zemhUcW9jYVovdkZFRzk1L2diZVlQNzk3S3dqK0tPekZMMWFq?=
 =?utf-8?B?Zk1wZXlyQnhJV1FMaDU3dGFSSEE2VGtNaExlTVkzbzNKOWNnNkR5SjQxbVZX?=
 =?utf-8?Q?A/FwaRHKL4j5LRLraEZfy5XzY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df6e58ce-ed91-49ae-46b1-08de003221c7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:00:45.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUMZUKYRdsaudCH9CRkutcxyCvFGIpps9Df791RiWXfPlOAppIJ70nHpoSxEuiIAHAHoyoJMhbjYs4nOswSDHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> VF post migration recovery is the path of dma-fence signaling / reclaim,
> avoid memory allocations in this path.
>
> v3:
>   - s/lrc_wa_bb/scratch (Tomasz)

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 23 +++++++++++++----------
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
>   2 files changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index ae9df9c0876d..6f15619efe01 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1214,17 +1214,13 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
>   
>   static int vf_post_migration_fixups(struct xe_gt *gt)
>   {
> +	void *buf = gt->sriov.vf.migration.scratch;
>   	s64 shift;
> -	void *buf;
>   	int err;
>   
> -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
> -	if (!buf)
> -		return -ENOMEM;
> -
>   	err = xe_gt_sriov_vf_query_config(gt);
>   	if (err)
> -		goto out;
> +		return err;
>   
>   	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>   	if (shift) {
> @@ -1232,12 +1228,10 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>   		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>   		if (err)
> -			goto out;
> +			return err;
>   	}
>   
> -out:
> -	kfree(buf);
> -	return err;
> +	return 0;
>   }
>   
>   static void vf_post_migration_kickstart(struct xe_gt *gt)
> @@ -1322,9 +1316,18 @@ static void migration_worker_func(struct work_struct *w)
>    */
>   int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>   {
> +	void *buf;
> +
>   	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
>   		return 0;
>   
> +	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
> +			   post_migration_scratch_size(gt_to_xe(gt)),
> +			   GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	gt->sriov.vf.migration.scratch = buf;
>   	init_rwsem(&gt->sriov.vf.self_config.lock);
>   	spin_lock_init(&gt->sriov.vf.migration.lock);
>   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 53680a2f188a..a63b6004b0b7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -58,6 +58,8 @@ struct xe_gt_sriov_vf_migration {
>   	struct work_struct worker;
>   	/** @lock: Protects recovery_queued */
>   	spinlock_t lock;
> +	/** @scratch: Scratch memory for VF recovery */
> +	void *scratch;
>   	/** @recovery_queued: VF post migration recovery in queued */
>   	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
