Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8F0C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 20:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A97E10E6E2;
	Wed, 21 May 2025 20:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrOWWyWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCF510E6E2
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 20:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747860029; x=1779396029;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gwFwEzn/5BvW0OJ8Bmfk6oJ+9oYud6Xjk9LfajvlDB4=;
 b=nrOWWyWUntaRE+bamFYbeJDbZF2K91hd3ggq25agT1OlEf+JRzYSoSia
 rSI1Nssbw8UOOoqEn5mV8xHdPM2EKLfubo5GO1gumW2clbntC3C6y8or3
 PcF3GqOlXzKR+QbFgo4G0DMky5vhbZiZll1ypqcAGOCGqjzULeOYT1PTR
 Ix+aligRib1Et74xVGpEjUrRJYF9QKKU26I8xhj+236Lj4bOxaBoyVAKh
 JAtQIs351D3wh3RoPzly7TRQrqqpgrNzAEHShMAHzCr8Ez/Egqrh090AH
 KF1wRXQvLT88Wq93JEAxAcnoPOb2ZfsO/i4+dSqIwkKxP9p8SSwrElR2r w==;
X-CSE-ConnectionGUID: C5TBJwqQS7mrSVeCzAnTaA==
X-CSE-MsgGUID: TvBSINuzTDSyoPDWlhs3xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="37478103"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="37478103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:40:28 -0700
X-CSE-ConnectionGUID: XkKL4HmPRfm6xAdbh2RYvg==
X-CSE-MsgGUID: c0BT5OWoQuWL+JaaQJxtmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140767403"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 13:40:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 13:40:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 13:40:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 13:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uA66FxZlOt799UHGoRdCVUq/QxzOvkCP4DeHireZ3IwmjFRJ6FNPqmVj/hqtNem5NQKBK7tnj8zGoDxigtSCz/rVJw8NQUiIW1vHOpcP9z+MyJobiJWJuTYyObzCsX0E8ciHNxm99TxmtNvWXngSfIyAfv5qY0uK0gfIRmYpdZK2V1N2uZ+By0VPPOzrGvQ/6w1zs3YMNZC7+wiDdhcqTzjhegkJzc3HQV3ElijEtSllgP0mNrEk71GkzkKTTKn2ybNhz6TLxYSVGLN03AksSpdct1vKQeMZVQ8sdLFsWf89AdN3b4tILXzmh/2BBAvYY8ZIqm0X1orSjoJOrmOiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apEQZKIauLG8SFZDsuihSQlkNjT1UT8K3Inuyclx/QM=;
 b=FF/kevkm+wGp5gLQiazcDpP+zCflVf+nhYTzmFaxZhE6DA0wNuErZgZh4uuRWPpIXmke+7zpXbCIDgrGtXZFM56yNGTLukf7ptXOxKoafmFkLoK7K8cT3MVBz45piXBi4uLB5UL1+Ov1uTOUaiDwmLxFWPrFGCChkIvZCH4VmpCo+Z73dT8ysFJ1GlNfW6zgcqhXhBeYsg7x9YCbHBuIvvrRZdXpqDTJDqcSjX1uYxVKPhixhEY0sxUjhizS8aZggcGquXJ9utosPTB/jzN+m9U5R/567hQHN6Ym/TYCbdaHomVvJ1q54mA+4YaXMbWz7NzzdunNQoQjJlt/JG1qyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 20:40:26 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 20:40:26 +0000
Message-ID: <2f80cab5-e71f-4b49-b211-be1bc4b8c943@intel.com>
Date: Wed, 21 May 2025 13:40:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pxp: Use the correct define in the
 set_property_funcs array
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
 <20250519233228.3754667-6-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250519233228.3754667-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 6069b57d-080d-4d94-68d4-08dd98a7b747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDVVdmJEak5VMy9JWkpKbDQ1bkgvM0pYYTZlcFZIUFBhMnNvOGlaTmJnNll3?=
 =?utf-8?B?cFJGbW1kZFVlcXhuMDNNTWFlMi9zTkhSN2MrTFdPUEd0MEpzSmpuWVpRL25o?=
 =?utf-8?B?bHN2SFlxZzVHU2JhQWZhZ0NxcGgybVYrazErQTE3K0FUQVBGSEtlMTZPaDgx?=
 =?utf-8?B?OTlGZ0VJaTZhZ2FKa1JQTWhmRElkSlFqTkR3aC9rdlpjbTgrajdHaGhiWnk3?=
 =?utf-8?B?TElBaUs3QlkvQ1BkTTN2RG1HQ09ac3hJMis3UDBuSXJsZzVnZjJoWFlDaytF?=
 =?utf-8?B?M2dPZThRV3lKVHp5Qnh1Uyt5UmhJaWk0bmNUUjcxVURWbk5RbmhxY3RYWTQz?=
 =?utf-8?B?cGJqclR1aDhzVE4zYUs5THdLbGcyWDloVitoRUYxTkRnNW1zcjRNbnJnNEI4?=
 =?utf-8?B?TWZ5NzdDRGY1UkNLdXNvdkllZHdJbjBjNmhLODMvUmkvY0hmVm5QYkhnNzJa?=
 =?utf-8?B?Y2JGVFZIYVFlNXFqVVY0UDlLNjVUam1zcCswSzBSUEx2WVVva1dQMHB2SlFu?=
 =?utf-8?B?VHJoZXZQcUVaNG9ibFR2aE5IMnYyckVpd3NvN2dmR1dBZ0tIWVhxOFF2Y3V4?=
 =?utf-8?B?RmdadWFFUms0aDJjVXF5d0xwOGN0MDZIb0hOU3VuVFRvblBOQVArVkZHU013?=
 =?utf-8?B?ek40Ny9jOXpmS3Q2UXdhRGowUmpUUDlkTm1mN1l2UUhzT2Q5TDB6Q3hDUyt6?=
 =?utf-8?B?QSt5VmJZUjY2ayt1cDhzL2dzTTBObnVyU1NKbHRCZEo4dTFUYm5OYWFjTm9G?=
 =?utf-8?B?b29rVWFGRDNIQzlnWHFKcWc2MVBHTytZbjlDN3JxSGZwVmFZMkE2TFhUbkVy?=
 =?utf-8?B?VUVoVEV4Y0U2NDBPbERIbUkrQy84c09wL0l2cnpzMlpYZmt5dGZqN285cEhm?=
 =?utf-8?B?QU1VNzB4R2hrZnduRzlEMXN5WjNKMUpUbG5QaWo3ZFdqTk1VcXJxWWROMXN5?=
 =?utf-8?B?ZnpFMGhlZndJK1NnOVVIWDNlNUswTC9hZmRKSlA2aUozMWJUR3pPcEJmQWVR?=
 =?utf-8?B?ejBFRDFPbmlBUmZkL3lxYW9OOUZ3R3BCNTRvQVJYbWJicXJZdURxeEhOaDJU?=
 =?utf-8?B?RVZ3cCt2ZjJFOXkraFFrWTZFMTlCSWxMYVJTc1FZcHNFSjNWSExIaW5SYWI0?=
 =?utf-8?B?dm9DMldRTThpaUpEU0R3a3FHVmVCaFRFWW4wMGtRTC9jMVRSTDJ0MTQrdWpy?=
 =?utf-8?B?TFVHTHUrMTkxWU9MSUNoVFE1SkRoNXBpSXRLU0pxdXRRM3N2emdpelZMc2ZH?=
 =?utf-8?B?Z1MvVm9nU0ZWSWZnUisraFFwdTBJS3IxcDNZZThLT2NBQXBWbVI5RGluaWFv?=
 =?utf-8?B?SHg2ekxMVHNjaGRNZTVqWU9nS2tsZnNrU1dhdzdvYStXb01QRzJoVXA5a1Jx?=
 =?utf-8?B?WWdlSVdBQmZDUmRSZTM4TWkrTDFrVXZKL2FoU3dpVDM0TEhBL2huNEZFUjJ0?=
 =?utf-8?B?cktlRkFEdFh5S0UrTkJ2dTM2VnQrRUFTOVZPU1RZZ1ZRQ2g3akNIQnhsdzdD?=
 =?utf-8?B?UWE4SDE1Vm93cUNJeDJKQ3VKcC83MWJLdHlENG1zRXFmQTBmbVRHRkVlc20x?=
 =?utf-8?B?dURKRFY5USs1QTg1YUMrQkhVczJwTWVUTTl6NDFNdnlxMmdTT2w0OXNzK3NR?=
 =?utf-8?B?ZER5c2Z2cjJUWmR0YTFLc1BvMFgwR3prY3AzMHVOR1A5cFk4ei8zLzRjcXhE?=
 =?utf-8?B?WFRqMkUySFIwV3B2ckVlZlFudy9NZDJWb2FqQ2kvT043QmlpTzVsQnJJSHg4?=
 =?utf-8?B?bC9Kd0ZxMEJOR0VCcVA5ZHdBZHBZaHhJQy85ODlDWTVsejNXVTNRUGg2M3N2?=
 =?utf-8?B?Vyt3b2h5R1hFcE01anlmMHhiY08vYlUvc1BHQm9sSjBqNHEwdlM4NVdybVNk?=
 =?utf-8?B?by91eGo4Wnpod0ljMzk0Z3dsTmpKOUFMODRESFlhcDdRMkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUVpbEJSbTN0NDFEb0NTNklOYXp5TGRWWStGQ0dVV3VZUTFzVjVKakVMRyta?=
 =?utf-8?B?eEZ6aklqay9DMjBwalJwZEJzSnN4cEcrSDRwTXJRZVcxUStqOGorUCtBYndY?=
 =?utf-8?B?NVBHWlR2dE9OTUlmUlp6d3BNRHNzZ3RGNGVCVFRQTnZwK1VTeWJwdEFXcXFi?=
 =?utf-8?B?SFRDQk1DYUE5RE5oc3ZUUWZKeU5hMVFqZCsvUUpLVnBTL0ZrODZ1eDhBUHBZ?=
 =?utf-8?B?QmxmOEI4TzNQRGxOWmVsQlg0aHE5ZHVVT0pVUERnT2ROS21jOVRYU0FENlda?=
 =?utf-8?B?Ui94YmwwcEIwQUYzVm5nRmFWTFdFekhQYW1PbWJ5akRSalRIdWdOVmkzV0U1?=
 =?utf-8?B?eVNRSzdpUVFFNzlIT0YvY1hkcVNDUFdINkxTSHpjcTVhWjd0OWtFNlppZ2RM?=
 =?utf-8?B?VDB1YTBwZDNGRTZ0am5rR1FRZ2c0UENWMFptUmlFajVFSWs0SWdwSXFpZkpj?=
 =?utf-8?B?L3VoUVJzNWQ0eDdlWkNleU1nSE83d1JkZzJHRTg1RTM5RnoxbmVWL0o0VGpv?=
 =?utf-8?B?RzhPS1FGOFlhbFVnc3h0RHBGTFU0aWxjeGNOS3M0UE9kYTlIeFdoRmM4a2tX?=
 =?utf-8?B?NTVwY0NZbjh1RzFYM0h3Sno1eHA1YUtKS0ZaVlVBeVpuclNDQU5hcDU1YmNu?=
 =?utf-8?B?dS9icXVudHJUK1M2blFGa25lLzRMb29nSlBKZEpWeVE4TXFhUnFFaG5tTVUw?=
 =?utf-8?B?ajVmRi9EZFNkSnRLa044VFdWdGdLdVZzR2RsRzdXdmJEc3cxbWs3QVdvZGw3?=
 =?utf-8?B?c0NEVEY4SzZkT1BocFRRL1lzYnFhd0dScjIwUUJFeEhYemN6NjJEWTNzNzVy?=
 =?utf-8?B?S1Q0VFZlRURnV0JOSnl2Vk9VTnhaRndHQU4za1kvOVUwN09tWUM2WWcwWEw3?=
 =?utf-8?B?QXdhSld6NGg1QWVNcjlOckVnYVlKbU5hd3RiUi8rRzF3MW8wVU5ITlF0RXNt?=
 =?utf-8?B?TVBuUVgwMkpOSE0rNzR2ZlR1eGNTU2JoNGNTVnI2eU5LWWZKK2FZNW8yR3NM?=
 =?utf-8?B?Uzg3aUJOSjdMVTJRRTN2STVPZ3Y1Nng0WUk4bStnUzl5WHdnRjdZdWVqQmcw?=
 =?utf-8?B?UmlFK0V4TzhCV0EyR1NCbnlMT0gzY0tEdjNiOTYxZmZDMWlBN2dtclRYU0U2?=
 =?utf-8?B?SDFVZXVCTVF1RW5NemVNVVRlUDZ5N2FyUFo4TWg1R2h4bjJ6WGJTb3dSdFVR?=
 =?utf-8?B?czE1eEZQaWtadjljOUVrRDcrZm1aVDAvU2ZDeEhCcUhSNTUrZ1hHNWNZczAz?=
 =?utf-8?B?a0xOa1hJYlVOeUdwbyszcTByNHVKOFZlQkc4NXNOcXFoTW5neXBGNXpUNFc4?=
 =?utf-8?B?NWU1Um02SmROSzZabEFqdVUxSjdsZWtEcWNPemR3YjZHVytmVFltUTJVYU4z?=
 =?utf-8?B?R1E1eWNqSmU2ZlBVQzlZczM0VzMyUGpRNGRXb3ZEaExZRmRSL3QzTHpRU1M1?=
 =?utf-8?B?d3J2dlRNU1lubUZBb3h1MmNmU25zeVNvRXdOeTZiamJFSDVPWlZ2T0N6ckFP?=
 =?utf-8?B?V2JHQ0xFQnJIY1ZOekUyaXUyQW5JYXV1dFBGOFNGdWdvbzZyZEhmM0x4Vkxl?=
 =?utf-8?B?UGNoWXRTd1RxOTdUUnIxeTBVcGRsV3g2RC9ZSDQyOWhSTkpJbWNHUjdKMTNq?=
 =?utf-8?B?R3NvSnhhcUlpaTlWWWlwdm5OT3p5aXVCZVBpQU1aWHJOeVNXczMyeXpib3Jn?=
 =?utf-8?B?anZzdGN0SHUxcklYeE55L2lyMTlzK2NQY1ZkVjJYWmxTMjVkcnU4cXVzK3VN?=
 =?utf-8?B?UzhWWnhKYm9RNXBqSXRDTFgzWFVDdTkvdHY3NVFqR2lvYkRLUWtFL1NrT3ll?=
 =?utf-8?B?d1R3WVJtcXJRMXpwVEpScHRDN0FUU0VTWEJkMjBWRk5tdXZYYzlnaFljVFR3?=
 =?utf-8?B?Ky9qcHVoU243MHdkd2oyU1JDa0RQeWp3QmdjK1dOL0FmbzgrbVNmbzc3ZmVL?=
 =?utf-8?B?YkNYelZ2K2FPdGN6bEpERDk5aDJIYlBiRm5KdmkrcXd4N1B1N2NzMzljbzg4?=
 =?utf-8?B?ZmtxVFdDbTlhTk9TUDNEYWdWQ21NQ3pWTERQelg2UlRZWncySlhMY1hDVHQ5?=
 =?utf-8?B?MkdvMXpySW8rRmsyTnpUQk10VFhYdHdnMlNPN25zQ09kUjJFcVZGdis2N0NE?=
 =?utf-8?B?WVJNbHlCOFBSRTdKc21FODg0MFo5TFErZjJlcmlRSzhUSlgrclRrcVUxWHJj?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6069b57d-080d-4d94-68d4-08dd98a7b747
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 20:40:26.0286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHtHC8XTKYc/TZweuYTiDZJAClpvIRORsFy7bQTdm+ezuRKkST8QhC5gCXo5CaTTufMS3guwJukLDnN1Ohz8ASpqcHqvPTCQAnsLEVjnCVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

On 5/19/2025 4:32 PM, Daniele Ceraolo Spurio wrote:
> The define of the extension type was accidentally used instead of the
> one of the property itself. They're both zero, so no functional issue,
> but we should use the correct define for code correctness.
>
> Fixes: 41a97c4a1294 ("drm/xe/pxp/uapi: Add API to mark a BO as using PXP")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d99d91fe8aa9..99e309642a1c 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2557,7 +2557,7 @@ typedef int (*xe_gem_create_set_property_fn)(struct xe_device *xe,
>   					     u64 value);
>   
>   static const xe_gem_create_set_property_fn gem_create_set_property_funcs[] = {
> -	[DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = gem_create_set_pxp_type,
> +	[DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE] = gem_create_set_pxp_type,
>   };
>   
>   static int gem_create_user_ext_set_property(struct xe_device *xe,

