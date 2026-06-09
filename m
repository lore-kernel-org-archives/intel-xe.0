Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96D1CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 21:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1842C10E03D;
	Tue,  9 Jun 2026 21:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghEZz4lq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E841910E03D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781040573; x=1812576573;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R95etgzgJY0hUO/byZckQhduHTpr5WC+UEgyNYEXN6c=;
 b=ghEZz4lqKtePM0Cyj67xmKWSRkd+xkaPKxtwKf4PvobqS11Td0LcgU+k
 PgEf2LkvOqYRc+BiIvZYlB3Biewxv09NiqV7RhdzFIoie3rQY3Pdnyqwn
 Tc8Jtqpy18ga7hHnVPfQx3iPRi+gyEGWeuXNKNuQTalNEMVC/khiv5Qn5
 nCyy5Z07OHhQoglQgPgHvxyukVEEWYj++CBdDdEuxcf2ddWigtta9ytLf
 CeRajC5qJlkjuMNb4nxfVF41KQNSsFq703g4BRBpEkaIaz7xM3y8kuNho
 vUEs/twiULWe5e8U5Q0LIcYaOLHuzfpCl3QgRKWT3CEyri4pp5H/EhrQi A==;
X-CSE-ConnectionGUID: 2kbxIda7RGC7fZ7Sgflrzg==
X-CSE-MsgGUID: 9/Qc7lnBQUeH+YTghwnvrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85445982"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="85445982"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 14:29:32 -0700
X-CSE-ConnectionGUID: rVix+MzfTJ2dnYz+FTJKBw==
X-CSE-MsgGUID: NnZXygDWSf+hdZKnPqsLxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="241548567"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 14:29:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 14:29:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 14:29:31 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 14:29:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2FYBamN7koBPSeJBGMe7TDXgt1BtmoejXorWFHJU0s0e6ZyoOkoOfKudQeJXHxnYagfdsTRSnXWyFp24LASTnPyoIISmhVjiQ4UZDHZ1v+QO+bbIYOJzH/MHAXDMD8/mrUoI9/k8ib1Au+ritTe8hLGNh9DRPTb3FgD+Ido7+67q9ZTQQa/Y/82ibIbXIDYNuXU4lXdBw7qaIRKHhxoAYcyydlchgjLNrBqydjcy3bYqODk8UuiIsXdGCt9Syfu9HcxoiLfsruRSdfT78qsOiTyAM90LANOjRoZEAFQoIORn85qOa4dLFT/YIsxW8fza39+bNh2JpjuugDQ0S7NMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9SXZrIGV2b+yGvz8pZcQnruZPZCvJLvjFGInX5l7Xo=;
 b=XocRIUg7BwRL6rPpRGQl+uF0N/VG3zewxVLSJnKcFVLvyByfSqiV92fEqJzu8bXS1ODFlRedbKfkNYBWneO8sV3sqO5fPm6pGLvLk6sOvuht/d+BVyixPCxm72ecIPMOxOagyleDkQ4PoRMey0uGVVygjQ/96XiRU30SFmPBUSeFBvKXXuTn1gy/Yi9qshJ63BvwTOUPQcr5ugdBVTka2oR2DyisCVIyS8fG7hPIYkuq0rba+Ae2cyEO6c6vYFa74wRR51UGm5R7nAUSpGkR2HbKLVVkN7V/l6naFpnBGk4eE0hW4ZrFAy6kt6bsE9giLszQW6Wq0bs88V1tr2OBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CH3PR11MB8342.namprd11.prod.outlook.com (2603:10b6:610:167::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 21:29:28 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 21:29:28 +0000
Message-ID: <d85a6d2b-c585-42c3-9d41-92d8d9ec0fe1@intel.com>
Date: Tue, 9 Jun 2026 23:29:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/xe: Remove memirq status and source checks for
 engine interrupts
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>
References: <20260605232108.674580-14-stuart.summers@intel.com>
 <20260605232108.674580-21-stuart.summers@intel.com>
 <d0861102-2bd2-4010-90c3-fee01fe0f142@intel.com>
 <1ca4cf6934e72cca5bad61bc413c74a2ac9784ef.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <1ca4cf6934e72cca5bad61bc413c74a2ac9784ef.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008B0.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::65a) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CH3PR11MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: 320a4919-ebed-4fdd-76b5-08dec66e2fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 7yh4kzVa9B+pxnClV4Z/ifce/knBoW0DM3hGJhWGkkKav9l2ruPEl2ar6YC8LDjfjd4ADkeKHd+FFMmL8AiVoEBQJnHHH6BFKcrBtRALh8KwR4ypkO5IOZhlOevRcOeEgzyq2W53gV5Wl07oUItCtcnhbKvnZ/SRTeSOGThLF9qqHFHD/eXSMouE9pGLqLM7XhQaqJs4bVdu5g7Cm99jMlNEbKCxh7cW7SQYkBvvrm+3yfd9AC1Ki1Cr0RE9Fk+Et/8Y7bPtVSrkKYL3EbBmIOmaC7bMMHrQQWC94ZH+96la4npKObSzv6yufIfa+P4S5/8C83sOWhS1utBijK8oRCAbwuD6JANHsHvCjBBIdMXB40Gd5SBTftN1fmOtTe+ZZGy8LZKQcsZt5ULcCR0mXQmAeV1QXdadUgnNHSy3BXrgkprrO26ztR133yTpB8RELLgBbAMQ6cftIttihuGYJVw3gnNGME76paGtDkLqxgRjpVIB9HHutUxwABKwEOpqlvDoc0ZLgGFHMAn+norkAxZK4ud6+9UIgTrMIN+ez0GbBYDXuole+KITSQhPBcb9alGMChDiuND1CwaoXtw+7YTBPMzPeAC8zSmmQIFCQgkMmhIFs/LZTBflJ3H03lYtS/soYAVzN/DvdFpZk78usJGpeRLenTHZ5tAbp6/B/j/7DW83DA0hHdeUSgSQ4Gur
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6020.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEVQWWhERFppSDgzUmxkMUE0eEJreExRczg2eDRtVUJzSlRjdGo5c3NvajBI?=
 =?utf-8?B?d0I5K3NRVEtxTVB4UkhOSWJGOTBqeDBkU1RLdE9TcnZMQXpyOERVOXFUQyt3?=
 =?utf-8?B?ejFhVEpMa2JnTndVdXVsS2RwcTV1ZjBiWjR0L1ArWUhDdEVUK2hkSGZJSlMv?=
 =?utf-8?B?SEFQNlFMekd5NFZkejRzeVhUQzVsV0p1N0ZONkdnN05tRlNEei8yYjZDTXlv?=
 =?utf-8?B?N2lwZWVMT1Q5R0lOMUNJV2dzZDJJTmEwV1ZYZVZINzZTSGgwUE1yZmdzRWFh?=
 =?utf-8?B?b3RPVnJRNHRqU2VDczIySXIzalpKVWtJcDVHb0pPSURzdzYwNXlOS2JDaFVT?=
 =?utf-8?B?K3Zua0RyVGpIK1ZSWFYvWGFUVHNnYW1ENCtCcmtzS2F4SHZyVCt3WE5nZDdC?=
 =?utf-8?B?dGNhYWhBVmNDMlpMK3hmWjBIRk84SjU1S0xlcS9JZERIcS9WZ25rcTcxN3Yx?=
 =?utf-8?B?RCs5UEtZM0lEY3VNOUplbHlCSzJocnNlQmlSMWwrU21OQ3dibVRzYXFreUtl?=
 =?utf-8?B?bENiblFYZ3VISDNaYlR3YVIzRTBXTVgvbk5sTVVYWjFZTGZ2L2xQbXpzMUg1?=
 =?utf-8?B?cEdRQXlTZHpjQUE2b092bFd1bjM5RituMHR6QWp1Z3dKWmEyejJtUzNubkZO?=
 =?utf-8?B?WkwyUXE5WCtWaTdrZTExRjBweXhsVXgxUW5ZNTdGTkVkOGx2bmUxay9YY0d3?=
 =?utf-8?B?blBpY0RHRDdDa2NsVjlhaTB0eXZqOGxEbzZZSEFNZGtuS200MGR6dWZ4Q3Zp?=
 =?utf-8?B?bmZzVzBnY2ZtNUpyUlMzanVNSGFJOFcrQjFlcTFBT0xqcU1mODI5WUZaZjlO?=
 =?utf-8?B?TW81enlWbmhESjNsRXZWamtVNnM4TU1IQ0NCT2pZd0ZsZDVnd0RjWFd3VHZw?=
 =?utf-8?B?M3EvTFFUWXpXbWgzOGU4MHhFK3pWUnhadzZqM3RxM1Y4TUFJT2Z6QjEvZlFu?=
 =?utf-8?B?T3N6bklvTDZyT2w1V0VHM3V5Wk5jVTFrejM2akl1dDlhaWpWNmthUSszMjJX?=
 =?utf-8?B?azlsMWRUT0pIcDRTdGR6eUdOTTFMeVNzaWFVN1FXTXlXTlVXYjRKa1hlZmpm?=
 =?utf-8?B?MHQvdmtTM3BCS0JoT1BMK0F0TlArUXFFT2F2cTBodkE2VklyT1lWWkpvZ0I0?=
 =?utf-8?B?QTcwWmc2NS8yYWl2OG1WTjk0TUxuRHorTlpWZUhZZ3hTbXM5VXBHVk55SGJk?=
 =?utf-8?B?a285STh5NXg4c1FjR1ZOQUxqaEl5b3F1QUIrT3NTVGRZRmFuWHpvbXg2K2F5?=
 =?utf-8?B?eVhEV2hRVmU0S1NOS25TRWFRV1RQQWc4NVo1Y0pYcUxBMXBYSk5HUnRlNE0z?=
 =?utf-8?B?RmZJZzBkbnNmT3ZXcGFVSkYzY1h4blF0MW0ySFIyZHRGb0NFcUFaSnFENDhX?=
 =?utf-8?B?UU5FNm9KVGtXa043d2t4K1VLdjNPMFFJc3A4NXIwZzZ6enFaMTVpWmpFVi9N?=
 =?utf-8?B?cjlQenlsTWJaNlI2cDZrck5qbTVoNmRVTzZpakp0bHFNMHhFMmZGdThWdDJH?=
 =?utf-8?B?bFRUWnBTVExLKzI0SzY5K3VNcHdSQ1JVZFpwdzR3MU1HdXhqR2VjSGt0SGNL?=
 =?utf-8?B?OGxhOFd1ZDFCNnE1UnBiazEzUWU1YjRxSFZ0VVZWT0VRQTgvVncrN3hNTnpt?=
 =?utf-8?B?b0MzREVnNnpzS3d3Z3hqaTNidUtvSS9rK1NqSWVHUWpnUGk1RC9qd0ozaTkr?=
 =?utf-8?B?MGpKZkhTdkgxQjE3UmNSdzRtMW12QWRvYVJFc014NzgxZXRkcHBkOTMyYkEz?=
 =?utf-8?B?eEo1Z2xKL0tTNnNVUlpMRklTVEs0VlRMb25PSTBWdmxpdm05K3YzYVI1NkhN?=
 =?utf-8?B?Y2tsRUVjbUlFODc4eU1TaTBYVTRNRFlCRWhUYnA5V2JuVUNjUU9NRlZYVi9Y?=
 =?utf-8?B?ZHplTTY4ZEd4VE5wZStoUGVmUU1lMGoxdk5VeEtBUHZhN0NOSFRmQlBjSFp3?=
 =?utf-8?B?K21wbnlxUW10cHg1aHFYQUluWFhFNEsyVE0zd0tFN25OZ2Z2QzhsRElBeWVs?=
 =?utf-8?B?SGxXaFZiL0lqSkhpV05HK0NJdTFHZC9GWmVaMm1pcVp5Mzl1d2hGTlJ4ckx4?=
 =?utf-8?B?RStPR0NxeWZabWtaYjUweUJvMWF5VVIvUWxyMysxRWc3NnpMdjJRYnpSeWdS?=
 =?utf-8?B?U2dwZ1dGdzBUUlVtc2ttVVJwa2dRZEVFdGxCbjBiWVJOSi9IaFdIbHpBOWJw?=
 =?utf-8?B?di9WbXAwcVJ2MnJQK2FYMDBNbkVpbDlxYzluaUR6Wm9FWlBsSmUyMHJPQU9I?=
 =?utf-8?B?Z3lxMmtDV1k3UjdUUkhWMlFRRnVTNXJyOUNtY2tBWlRMbjMwbExBMktEUUVF?=
 =?utf-8?B?V1hHTmYxSEtGRWdJa0pDZ29URkNuM2k3N25nYXBSOUlJcGI0UFVWTmRrekZr?=
 =?utf-8?Q?sJCkjbK4zwIcjQcc=3D?=
X-Exchange-RoutingPolicyChecked: nBRclnMjYYesPwfbzuNzUNZi2MEHL9jZWgUmMCk4P9Fdd1+d/ENRdbljkjioel4DjgDz1IkTpypLgshyB9fK+UyLG9Bs6Ijhvlz0kRnKCoCyLE4HfSDVO6ANNpC52nnyutr52MP40lBapojoS9N1E+dwGw2fYoj2l/3TEzckzixWQ1wMPt9ff3Ex2hYBPKv0OCJUyBPoN+fZtrYSZwDdOO/3TzKFh53lRATtc4/5CpcQ29Hd+sej/Ah/lS7WbD4oahPv8SPrm1NTu5EgOO2QmKH5wUx8riCQjsgW9k1Nn1WIQd3WgSzpAlUrQcNW3gIMJYVbvW0Cx+SMMuKxiV34IA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 320a4919-ebed-4fdd-76b5-08dec66e2fba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 21:29:28.5362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umBiCUXPlA68H2ywz4+PA2hNLrLWFAx+dRuPkEdJrw5+iBnWfct91uCMUs2gDRmkeUrIznYAeQZzBzdTuDe4hMs9ziUhGoHXbzGWI+kUAHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8342
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



On 6/9/2026 9:38 PM, Summers, Stuart wrote:
> On Sat, 2026-06-06 at 13:18 +0200, Michal Wajdeczko wrote:
>>>
>>>
>>> On 6/6/2026 1:21 AM, Stuart Summers wrote:
>>>>> For engine-specific, memory-based interrupts, hardware will not
>>>>>>> fill in
>>>>> the source and status offsets, assuming that software will
>>>>> utilize > > the
>>>>> vector ID to determine the destination for a particular
>>>>> interrupt.
>>>>>
>>>>> GuC and VF based interrupts are still handled the same -
>>>>> explicitly
>>>>> checking these offsets.
>>>>>
>>>>> Bspec: 62316
>>>>>
>>>
>>> no empty lines here
> 
> Is that a rule? I thought we wanted the blank line between the commit
> body and the signatures?

true
we do want blank line between body and tags
but Bspec: is also a tag, not part of the body
and we don't want blank lines between tags

> 
>>>>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>>>>> Assisted-by: Copilot:claude-sonnet-4.6
>>>>> ---
