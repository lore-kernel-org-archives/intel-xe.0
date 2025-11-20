Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D65CFA446
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 21:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285C110E073;
	Thu, 20 Nov 2025 21:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1gjbvRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39F610E073
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 21:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763674654; x=1795210654;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o+MjVPTYnUtqYF4b1kxsJ/L819wpzzZrrxVYrH0OUF0=;
 b=V1gjbvRF+fIvrl/WT3sMDbhTgubEI6d0ystDS3OLMKppb4iSxXjt9XUU
 XmyrEmwDkBdnbUwJF+3TvTLul07lOhSIVfDRWL12dnQZPVa7TPRJLwIPG
 hB6H6ik5Tpdeo8VTCVZubjelqw98bGBPekDWZlqxAI/i7alCcg9Ka/GFn
 F8dQ4YSnz8tXJJGvA9Km0bkYLfxyf3xmr66WBHgR/8unRL2oJLfEL0lHl
 q6uUGEBbb7V72tXuIe5Vn3mdW/pC7UvFjM+LBFqpvaHevUGr24IJ8MHV7
 ncVL4fparzj5PwyPAspfKo2czxv7HBU8RN/UpdjT+z0jh8U8pkldAKh7J w==;
X-CSE-ConnectionGUID: h/DC8dPsQcKOHeeJT/5C5g==
X-CSE-MsgGUID: WnA5513gSG+b2ncJf4aQFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77230266"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="77230266"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:37:34 -0800
X-CSE-ConnectionGUID: sYZWc/grTimxyCbZVLSkTA==
X-CSE-MsgGUID: bDi4vQd0Shuo/s9I82mtjA==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:37:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:37:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 13:37:33 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:37:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5ogE4k9m3u+LoUDWMvBDw4rRhXFiDRI3TXI4pKOb7hU+c8Y89Ezkp0abXB8U5UOHWxhwxr+zq7OxHAof1OdLq3JMnnil7q7To4hSB6skk+6kH3ghHd0+qPqOR6x25jHOkIZ9/4qbeoUuF8D4r+mMxZnl4LSYCcQzfTzWpMpK8/EhQviYB5KlK7TjeAFv4FGKlhVGhT2FufU+6t+0iZHPJyUcNb0r4YZ85AOEjNWZNKqgg+JW4jUFti5uY+QEWCORVFA+67YeXMiM2qVm7nGGwVR4a65Wsxgr/UYx0vPkiGnvL7W1JUIqGWnSmtHoWfrFwmmLo8H6f+mKeYmTJegYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJ05wlG0Ib9Z+QtwINYPPIjl94hrlfqHebXZGRZiQOo=;
 b=qtgyZho+F581pKlEa1wTK/7pEZwhY/UDMwQ+nxnz7FlvbYbVBo7U2i692RnPYbvIiknrgFoXoaGC98q4niqUQGODbKVT0vW2z/fnJOkiIbUUVkq6LOv7xBpkpmmb0l4Ennttzxybp2pptsj1gRUIsLdr3CwkfejObMu/hXlpwdk01XlOZwa6UeBfc0K2KxUSILBDDygVV2+N+AdTdpQEwgl9mmCYh5QGIBcpHpTgZ081whldivwLViemGGFKjJzlSt7vnT9zBeBdr0Rxb/YiV0PTIG0knKT81whXaORPgD7LiaHXP1kNCKxS1rzV/dt40yrMu3oJlD5/qSi0DXQmQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYYPR11MB8332.namprd11.prod.outlook.com (2603:10b6:930:be::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 21:37:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 21:37:30 +0000
Message-ID: <653833f5-3220-42f3-878c-44bf9253d430@intel.com>
Date: Thu, 20 Nov 2025 22:37:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/xe/vf: Introduce RESFIX start marker support
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251120145157.6995-5-satyanarayana.k.v.p@intel.com>
 <20251120145157.6995-7-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251120145157.6995-7-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0378.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYYPR11MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0d6226-343a-4886-7756-08de287d00c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGxkN3p2UEZhQkoxa2xONHRJVjB6ZWlwOWVuVC9hKzl4cEUzR1FoQzVYNmQw?=
 =?utf-8?B?ZUdCYzJheUhiNXJwU2hsODlGdzkydEJwVTJlZzJnNytVRmZZTkxyRkNaVWln?=
 =?utf-8?B?RlUwZkE1ZlRlajlmQUhjcmx2bTJOUmRSSnBrU2VrMW00UkViekFxcEpjNzNU?=
 =?utf-8?B?QUhncTdNV2lKcXVsRHlwTjVBMnBINlpIRE5LSTdyWVF1RElYR0JkVzNOdkZm?=
 =?utf-8?B?djdoWHhzZmlQbjV6TUxkVk5SM0NpcUwydVBCbm9JcGcrS2tNcHpFcUdDNUJG?=
 =?utf-8?B?QzIwTm9ObHN3dVFtNVNNOWpWay9RK1NWVFFEcnUvR09qUThiamZRbXdWTmE5?=
 =?utf-8?B?Q1JyejF1SHdRVHdoOVNoMkVKb2V6Y0U2OHJrb05jdkhUNHNCS0JYWUxWc3VV?=
 =?utf-8?B?ZmU4VnpxTllzOUUvRTkzMWhvMWI0bkMwcnFUR09pNmxXZ2thdGpaRTE2SHdk?=
 =?utf-8?B?RzIyWFU2SFYzYkVnZ1FBbXZFWVlHNUhFc3dtWjNsbWFXQlkyY2M4OTJKUm92?=
 =?utf-8?B?emM5ZGlrZ2Z1Rm52Ym1QaWpWUVcvcVZBRkNyOStVYnNFUkFHR3JiVmZPR08r?=
 =?utf-8?B?MmR3bEYxakE4dCtFeTBFdXpuMXF5NklMUCs0MDBPN3BnSGd2b2F6cW05MlVQ?=
 =?utf-8?B?OWFZUEtaR283dkJ3M1lhL0t6OTRGZGZuWEtQMGxOOFczQmUwYmpkYVBIVEM3?=
 =?utf-8?B?M0lUVnpmR0VJeUZHRWRUVUVwQ0c2N1ZzQ2t2MGJ3T0pFUHNicjEyci83OGVt?=
 =?utf-8?B?YXlFRjlOWnN2eXNFWkhXSWVPaTlYNXdreDdZNkFUYzJtMmxFRnRaSHA4VXA3?=
 =?utf-8?B?QlF1c0I3VXdIc1NoYitPdmptZHhGV2Y4N3h5R1d5WlVFRUtnbm5HYmNjYUxG?=
 =?utf-8?B?aVU5cHFoa1EyUGhxbzNoVDVmcFBHNzlpYVVBdUpEUzROdWVGNWZMaEF4KzBa?=
 =?utf-8?B?NWpLR2dXV2NPOHdjM0Y2anJYMWIrZEkxQTFIZTNCWnA4RWt2NFV0ejZvdHBJ?=
 =?utf-8?B?TkZVN1RrV0czQldqTzcxRkU2L012Q3N5U2I4WGV4cDFFSGVRYTJUalJjOHRT?=
 =?utf-8?B?V3pSTVpFSGZvQVAyM0YyLzF5UWJnMmNuUitVVEY2T0dLZXpLNkhxeXlXdGdC?=
 =?utf-8?B?YnN4NVhiSlFRREplbXQ0VkZYcFNyVndUNnRUdTVjTjdQYUc2TjNPaklSbkVB?=
 =?utf-8?B?OGJXckJBa1ROZlQ3RW5tSGdGRkFaVmVOWnUzc0hib2UxSmxybVppdXU0OTg1?=
 =?utf-8?B?T2tkb0ZWLzV0dGpTRCtsQS9kSEsrUHpQNG5NK2pJUFZQSnR4Z3U4ZkdTRXhJ?=
 =?utf-8?B?c3B4T0xlbzgwRW1aNVI5S3hhaGJ2Uk5tTzVJR3F0Z3JIV1lRTzJ1VkRoY3Nu?=
 =?utf-8?B?YVp4UmFzT0NMUmdVdWxqU0Q3QldXNXNBRVRLb09WZXd3L01CWHBlRFhqSk1S?=
 =?utf-8?B?WGZDOXBKY2QyRm5PQVBwbG8vTjZ6R3hnSjJHc2ZEdlRweVVoL3RMbE9mZ1Zr?=
 =?utf-8?B?YmlOUjZmS1Y3QnlqbUc0QjBoVDBFZDVhQ3RoOGtKS1dYcHNyWlZvb1JCQ3B4?=
 =?utf-8?B?aWVKUGhmWXNsQTJ5c3NBTW01TGFNUU5OTEZQWUVUdDBOY2ZvU3FxOHF2Wlp0?=
 =?utf-8?B?NjVWWVdQSzhoRkZNTUl0SXhOSWJuMkhQT1ZrQU00WWowT1hNUU5VNjViUlpr?=
 =?utf-8?B?M3YyU28zZ0kxaE5iMzJ0WUVwTitrZXY5NXA0cjFNb0FVNUlBanRMbGVNekov?=
 =?utf-8?B?N2lRc2VzYjkrYk1kN1dPVzhiWGdJVU5oMWk4blNSLzFIQm4wUmZYVDdUKy9k?=
 =?utf-8?B?eTdzUnFhbGJDMFE2ZlF5ZEdtRFprVnJKelVPRkdhN0hsaUpYY2lvdld4Rlp0?=
 =?utf-8?B?aWJIZkk2UFZxeUZtVjBZcFJHZjN0MVdVeThrVmQzTEpWL3hvcCtCYmIrVWNn?=
 =?utf-8?Q?qunpGlfbFLmCfKHqCmggn55q3MI6J6Og?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXBIb0RSWWtBdTRlWkkydTNuNGcxMkJnVnI1TXpwb3djSFhsUVhjMnhtUHRo?=
 =?utf-8?B?UWFMRG5LSFFxbTZWbU1wUkJjRmJxR2Z4UTlQS2p2T2JUNG96b0dDbkhhMlRn?=
 =?utf-8?B?YTJVbUhqZFlQR3JrTEZyejFTdW54akJqb3lIeEdvckZtc0tZdkl2K3UwR21r?=
 =?utf-8?B?a1JReFZLUUV1N3FaMUJLNnJYc0dFMEdWbHVxYjQwMytXK0NOWXdVWTZ3YjRT?=
 =?utf-8?B?K0dDUWR4NWl0emNNOWJBMzhXVXhOUGlNUEk0WU94WmJkb0srcVM4WWRPOEpk?=
 =?utf-8?B?U3dnbCszem1zL25yYWZlck9rNVBPMDJoOHVqNlNxUUVORDFSc0tZOVBnMEMv?=
 =?utf-8?B?TDFLUE4xbkVsbkpNWW0zSlhOMFNRSEhqVWhrSW1EbXYzRGk1NCtqb3U2Ujgz?=
 =?utf-8?B?cDBZeU5WVE5JUklZUzJiRzIrNEJtbmpOWG1jT2tKVGsxMDlqQTJ3bkhKN3RH?=
 =?utf-8?B?WVlWMXgrNmRvMDMxRk5EU2JaVThmVU91anN1YzFxOFlacXFES3BsRVVoVldL?=
 =?utf-8?B?ekdFTzFXdTZhZTlWZjZDWWpoUHlvQmg4MGo5SHlUQ2lpS3d4c3B0VU1mc24w?=
 =?utf-8?B?WkZJR0hiSHp3NXJMbjR1OC8rREVQZy9vYU5peVljMzZSR0Nha0ZJOVk5d0My?=
 =?utf-8?B?dWNwVFd0cnBnNXhTd0pncmg4SERqb1FId3NCbHBNc0VKd2Q1UmVyOEhXa3lT?=
 =?utf-8?B?eEFaSGIzUWh4TzNtanhYU1J1YUhGZnhaRUgxMjF3VTZOR2MrRWpLSW95SVNy?=
 =?utf-8?B?TWROejVhaFAzSUs5ZWFES3F2SDZQNkJGc0dDNHh2bDE4dkJtaEMreE40b21X?=
 =?utf-8?B?QStLUGp0N3FsTmFWVWVtVEw0b3gzWjRsRk5HVEhERzcvT0Fia0R6WjlzQXhL?=
 =?utf-8?B?SDVNUkhqS21ZU3hiL3dBNklkcXNHTG5nakpseG1HZXVrMzZySVlvQ2ozWlFY?=
 =?utf-8?B?WkNpZm10T3orazZIU1NmT1VaMzRZTm1nWmFsK2RyVmRsU1o4TmFPcnZSOGc5?=
 =?utf-8?B?T1lCbjEyWkJEU3A0aWNVbmN1Smp6dm1CNUZyR3g5RUd6SWdGVUJLbFpJaGJT?=
 =?utf-8?B?U1VkQ1BIRCtZNTRubGRWbExSaUd5T1FJNWxsN05zR3QwOXR2R0ZFSThHaHlo?=
 =?utf-8?B?d1ozWFNGUW1GaDhkclo3UE9iV0txSFlWSXErUzlERVdVb1pSeStvNzEvOVJi?=
 =?utf-8?B?ck5QUERBVm4wQXJKUGhqMTNia0QrN3YvWk1BK2tXbmlOaENMb3B4QmR1VWZT?=
 =?utf-8?B?M2piMXpEcFIrZ1BiNjF6eEthQ0lsNGh3YWQ1YlJsb1FaY1F3Wm0yMVM4Qy9h?=
 =?utf-8?B?YzZERGs5dWNSUytxR2NtUDlreVJmeVpnKzdYbGtLWU5ORnNiL3VCbWtPd2dp?=
 =?utf-8?B?ejdzRHZSbjJ6ODl5YzVXMlU3MXVSNnpVZ2RzemFkK2lHdUswWXdlb2hodCtq?=
 =?utf-8?B?MkNOODIveTlPQVJhdlFNU1gxYjRvMnI4Q3NVNzZMVEw0aWt2MTJCRU1YZSs4?=
 =?utf-8?B?QVA5cWR2aW1PRUlGNE0wbWUyRkt0WjFvNTFiUXJqSkNvS1pPdWRJN2NNejIx?=
 =?utf-8?B?NkFYNlFxVDB0ZlJ5dElMSzRPbytiajRxNVhTeDgyNnNqaXIrdjQ3Q0E2dFV5?=
 =?utf-8?B?NUM3ZWI4dGNxTG5SSXJDQTJBK2ZkMjJwSlkzemxWTUR3ajVoNWdlN0preEdw?=
 =?utf-8?B?cEp6ZnBLMzVIMktUYXZKK3JNbnhxZUpQTmkyRkRIMElRcmw0RDM1OW1Pc1NF?=
 =?utf-8?B?ZFVuMU9yN3hlU280M3NFOW53OTErOXNUR3k0U1hKUHZERVN5RnNEczMvdU9Q?=
 =?utf-8?B?T0N5a2czd0E0Mlg5UStoVktadFRCZVFZRGxwK3ltSGdxNkRDQ3daTEZnMGRU?=
 =?utf-8?B?bTlIU01XbVBoYzZpcVFiNStNNytESVc5VjJLOEJYK2xjLzRaUElNSFRjcW9w?=
 =?utf-8?B?c05lT2FlNTlqcHZFUHZMdW5RanpHcVpEaHphNGNNTkhTcEFSY2VBbVlUWTRz?=
 =?utf-8?B?ODhIdVpaenFTZU1LTGVJU082SHZZRnJ4TXJ6TEFrSDFyTnFJNExKaGRBZUta?=
 =?utf-8?B?Z3hZM3dEMnBDd2sxNlpnbThyRGVoeVdGQUxsMTNlNUlsVGpKQlV6VGh4czh2?=
 =?utf-8?B?M0hCSWtnVTA4QmRVT2VuWlozRE1GMkEvUjF0L1lHN2dHZ0ZPQTRzQ1R5RG5X?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0d6226-343a-4886-7756-08de287d00c5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:37:30.1349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ef+78DJf8DC3cVwt1zVa3ZB8O2bSPCprOG+n34RjCAA8d48TDBA3k3AYvjb9F3LOjRu0T4vzx6f+MBU3gzsgcipkqqAWEOCWowNlYp649kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8332
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



On 11/20/2025 3:52 PM, Satyanarayana K V P wrote:
> In scenarios involving double migration, the VF KMD may encounter
> situations where it is instructed to re-migrate before having the
> opportunity to send RESFIX_DONE for the initial migration. This can occur
> when the fix-up for the prior migration is still underway, but the VF KMD
> is migrated again.
> 
> Consequently, this may lead to the possibility of sending two migration
> notifications (i.e., pending fix-up for the first migration and a second
> notification for the new migration). Upon receiving the first RES_FIX
> notification, the GuC will resume VF submission on the GPU, potentially
> resulting in undefined behavior, such as system hangs or crashes.
> 
> To avoid this, post migration, a marker is sent to the GUC prior to the
> start of resource fixups to indicate start of resource fixups. The same
> marker is sent along with RESFIX_DONE notification so that GUC can avoid
> submitting jobs to HW in case of double migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V4 -> V5:
> - Fixed review comments (Michal W).
> - Fixed minor debug log levels and documentation part.
> - Moved complete marker logic to vf_post_migration_resfix_start_marker()
> 
> V3 -> V4:
> - Updated RESFIX_DONE action name and documenation part. (Michal W)
> - Enable resfxi_start marked by default as sav/restore is gated on
> Guc version 70.54.0
> 
> V2 -> V3:
> - Fixed review comments (Michal W).
> - Updated commit message.
> - Fixed CI.BAT issues.
> - Added helper function to assert on unsupported GUC versions.
> - Updated RESFIX_DONE action name and documenation part.
> 
> V1 -> V2:
> - Squashed "Enable RESFIX start marker only on supported GUC
> versions" commit into a single commit. (Matt B)
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 ++++++++++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 85 +++++++++++++++----
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 21 +++--
>  4 files changed, 144 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..d9f21202e1a9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -502,13 +502,17 @@
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
> - * DOC: VF2GUC_NOTIFY_RESFIX_DONE
> + * DOC: VF2GUC_RESFIX_DONE
>   *
> - * This action is used by VF to notify the GuC that the VF KMD has completed
> - * post-migration recovery steps.
> + * This action is used by VF to inform the GuC that the VF KMD has completed
> + * post-migration recovery steps. From GuC VF compatibility 1.27.0 onwards, it
> + * shall only be sent after posting RESFIX_START and that both @MARKER fields
> + * must match.
>   *
>   * This message must be sent as `MMIO HXG Message`_.
>   *
> + * Updated since GuC VF compatibility 1.27.0.
> + *
>   *  +---+-------+--------------------------------------------------------------+
>   *  |   | Bits  | Description                                                  |
>   *  +===+=======+==============================================================+
> @@ -516,9 +520,11 @@
>   *  |   +-------+--------------------------------------------------------------+
>   *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
>   *  +---+-------+--------------------------------------------------------------+
>   *
>   *  +---+-------+--------------------------------------------------------------+
> @@ -531,13 +537,13 @@
>   *  |   |  27:0 | DATA0 = MBZ                                                  |
>   *  +---+-------+--------------------------------------------------------------+
>   */
> -#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
> +#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
>   * DOC: VF2GUC_QUERY_SINGLE_KLV
> @@ -656,4 +662,45 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_RESFIX_START
> + *
> + * This action is used by VF to inform the GuC that the VF KMD will be starting
> + * post-migration recovery fixups. The @MARKER sent with this action must match
> + * with the MARKER posted in the VF2GUC_RESFIX_DONE message.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + * Available since GuC VF compatibility 1.27.0.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
> +
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4c73a077d314..1cd3d8204c15 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)

s/guc_action_vf_notify_resfix_start/guc_action_vf_resfix_start

>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
> +		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
>  	};
>  	int ret;
>  
> @@ -313,30 +314,54 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> -/**
> - * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> - * @gt: the &xe_gt struct instance linked to target GuC
> - *
> - * Returns: 0 if the operation completed successfully, or a negative error
> - * code otherwise.
> - */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
> +
> +	err = guc_action_vf_notify_resfix_start(guc, marker);
>  	if (unlikely(err))
> -		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
>  				ERR_PTR(err));
> -	else
> -		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
>  
>  	return err;
>  }
>  
> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)

s/guc_action_vf_notify_resfix_done/guc_action_vf_resfix_done

> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
> +		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix done marker %u\n", marker);
> +
> +	err = guc_action_vf_notify_resfix_done(guc, marker);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_DONE step (%pe)\n",
> +				ERR_PTR(err));
> +	return err;
> +}
> +
>  static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>  				       u32 *value, u32 value_len)
>  {
> @@ -1183,7 +1208,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	bool skip_resfix = false;
>  
> @@ -1206,14 +1231,32 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));
>  
> -	return vf_notify_resfix_done(gt);
> +	return vf_notify_resfix_done(gt, marker);
> +}
> +
> +/*
> + * Increment the startup marker again if it overflows, since GUC
> + * requires a non-zero marker to be set.
> + */
> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> +{
> +	u16 marker;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	marker = ++gt->sriov.vf.migration.resfix_marker;
> +	if (unlikely(!marker))
> +		marker = ++gt->sriov.vf.migration.resfix_marker;

in unlikely case that VF will be migrated 4096 times,
GuC will see marker as 0 since DATA0 field is 12-bit

> +
> +	return marker;
>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err;
> +	u16 marker;
>  	bool retry;
> +	int err;
>  
>  	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>  
> @@ -1227,13 +1270,19 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	marker = vf_post_migration_resfix_start_marker(gt);
> +
> +	err = vf_notify_resfix_start(gt, marker);
> +	if (err)
> +		goto fail;
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> +	err = vf_post_migration_notify_resfix_done(gt, marker);
>  	if (err && err != -EAGAIN)
>  		goto fail;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..66c0062a42c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/**
> +	 * @resfix_marker: Marker sent on start and on end of post-migration
> +	 * steps.
> +	 */
> +	u16 resfix_marker;
>  	/** @recovery_teardown: VF post migration recovery is being torn down */
>  	bool recovery_teardown;
>  	/** @recovery_queued: VF post migration recovery in queued */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 13cacdbbf2d2..2994b233e0cf 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -49,11 +49,13 @@
>   *
>   * As soon as Virtual GPU of the VM starts, the VF driver within receives
>   * the MIGRATED interrupt and schedules post-migration recovery worker.
> - * That worker queries GuC for new provisioning (using MMIO communication),
> + * That worker sends `VF2GUC_RESFIX_START` action along with non-zero
> + * marker, queries GuC for new provisioning (using MMIO communication),
>   * and applies fixups to any non-virtualized resources used by the VF.
>   *
>   * When the VF driver is ready to continue operation on the newly connected
> - * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
> + * hardware, it sends `VF2GUC_RESFIX_DONE` action along with the same
> + * marker which was sent with `VF2GUC_RESFIX_START` which causes it to
>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
>   * CTB messages and scheduling workloads from the VF::
>   *
> @@ -102,19 +104,26 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_RESFIX_START        [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]
>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
>   *      |                               |                       -----> [ ]
>   *      |                               |                              [ ]
> - *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
> + *      |                               |    VF2GUC_RESFIX_DONE        [ ]
>   *      |                              [ ] <---------------------------[ ]
>   *      |                              [ ]                             [ ]
>   *      |                              [ ]  GuC sets new VF state to   [ ]
> - *      |                              [ ]------- VF_RUNNING           [ ]
> - *      |                              [ ]      |                      [ ]
> + *      |                              [ ]------- VF_RUNNING on marker [ ]
> + *      |                              [ ]      |  match               [ ]
>   *      |                              [ ] <-----                      [ ]
> - *      |                              [ ]                     success [ ]
> + *      |                              [ ]   success (on marker match) [ ]
> + *      |                              [ ]---------------------------> [ ]
> + *      |                              [ ]  error (on marker mismatch) [ ]
>   *      |                              [ ]---------------------------> [ ]

actually, we should distinguish between error case due to marker mismatch,
like sending START(A) and then DONE(B), vs actual double-migration case

only if latter we should restart the recovery sequence (and only case needs
to be shown in above diagram)

this means that we need to teach our CTB to correctly recognize VF_MIGRATED
status code and return different -errno

>   *      |                               |                               |
>   *      |                               |                               |

