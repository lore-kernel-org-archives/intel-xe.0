Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418AA109C04A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 17:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72DB10E28B;
	Wed, 25 Mar 2026 17:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLQWcq8T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F85110E28B
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Mar 2026 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774459482; x=1805995482;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l4kOrMsdd+J2VU0NdeNkbcL7umAo6fL0vvnzkLnVZos=;
 b=YLQWcq8TPx6VQGL4SoK/+Zn2+P91yjAormMmiKB7+8ULOejQTHAFQ9xT
 0cBZCdC/B3xP8SQhDeRCCgfATzWJz7BXat940enGVp2Lltb2e+AcVzODn
 2dhx3685csLWhjSUMXgFjYBSvxrwH92t3BbT03JZCuPdm98gW2YEkmtJu
 9gKPMOfWHEfHbG9/NxK9aoAzUOXuWd30g1rn/2TBZiE8kXW8zI2pbv5e7
 1ggoufSh8y1wB1l9HhFxZv0Qj6jzrcFO4H1DlmAGQMhmKbD2iFKFS+1Gi
 +RJt8dw8LinwnW5G0S3nFHgLAEjgiGdGTXDJbnVvVZLhr7oZlvttkGRP9 A==;
X-CSE-ConnectionGUID: xlKiA0sfRpe20agVonEAFw==
X-CSE-MsgGUID: 2/wWbVnJR9myXeThenuXRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86983871"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86983871"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 10:24:41 -0700
X-CSE-ConnectionGUID: 9W9SRw1aRoG1cmqH15o39w==
X-CSE-MsgGUID: HlE6dW5uRyWvQAOZmPnhYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="226384549"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 10:24:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 10:24:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 10:24:34 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 10:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+w0HNyoOYpKf9ilmbTjdpvIXjHhfWipWxrfy5u83KyzyQdS6YEr7ZOtlZcTLGTUEiBW3pt69stCqnUIuD6lUZVaqq+4r94ZYuekrGCP2zoqbec5Cvd3vuZ6630nNGmPK7hp7SptIAmR5Jcs6TJ1Nv8ZGx9akz2OK0tm0e6QdLA/J/hE0oqFUF5lLBy63Rj1P5g34xk+lctglF2yo7M3V6cG+YgpZkAOK9e7YoYSeyAGcWDdXgG5RFA+C2FsWim5YPSvQ53Kl8IfNxNrtdiRUDhWqbrDFHf8Yb23cOyJUodmRsxz+zmm9OCW+JU5PF4hizdYWAPN+tTKlCRz3faXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7I9fDAea9xGhj1kszYYylZK+lMd3KzBr7IU8di8ScI=;
 b=PkQd7z9OdWuA+hNuYelM7CRLRGwvLHcwphe5J/FmOCSEtp7gD7l+AyrM4mXIUf/3Hwss8ZLvDTIGCP6jupw9ZACu+U7VH3GhXslH7Sl3Q0f4N47C8+kPrehmFPjyz50/dbJy2vi8Uc98KbFkHvfGEyvyODxVSrmKWjTqoyLsNznb1Tb+OscQ59gFxEj4kUF4t1YxSB8X8YxWSYa14bljxGdiNiTFN8JNbShhS/JaGX8FFwYMOuK3NS//tho2p1vJwy4JAsGU99lvt7t8i41KB+DCiPEIttxHflwVjg9YKN4bfp6NWn4UJZJPftRh/OhrvX1QfN2BfiodxLZxQOJWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM3PPFD7E67F036.namprd11.prod.outlook.com (2603:10b6:f:fc00::f54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 25 Mar
 2026 17:24:31 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9745.012; Wed, 25 Mar 2026
 17:24:30 +0000
Date: Wed, 25 Mar 2026 10:24:25 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v8 3/3] drm/xe/soc_remapper: Add system controller config
 for SoC remapper
Message-ID: <acQaSeCyFifXFtOt@soc-5CG1426VCC.clients.intel.com>
References: <20251223183943.3175941-5-umesh.nerlige.ramappa@intel.com>
 <20251223183943.3175941-8-umesh.nerlige.ramappa@intel.com>
 <85fr5o9cle.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <85fr5o9cle.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0298.namprd04.prod.outlook.com
 (2603:10b6:303:89::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM3PPFD7E67F036:EE_
X-MS-Office365-Filtering-Correlation-Id: 631252e9-51b1-45d5-8141-08de8a935fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: wJrhYUh69lYyB2Zbrw0mQyvYY0Ab08jXMRZPqT3XG40bnycAmrVxXYvD6TJZgHHR8C6l3BHa6MwDZymQPQv3sZ2nIC6WpijK+KjVZpor1Z4Yq3nXhd7AriYcrx52wQqxLDgN5ujoTAO4nettRMhgRYbNw2iovqkaaU2qRVwm452y4DXWv6L9L10IUkG/UFTpVxJBSdq8Ufk2qalJ2zEavdf/JBH1Ki3UyvtCf2q5vxu8oVG+ruHDRpuPW0tH3BV1bPo6cniKpaWmON+yTJ2EmUedxnI92tNXrQ3zLWgFbq9eJS5Vr0kzSo4fibEHv8w4xS5jNhO03V7w5Svqmf3VLIxBYX7T8EgNUha2y/vV/5gd8QSd4YBR1Tyr5DU9aHdC0KqB6c/xafe3XyhDQb9X+RBOkmIoL1dd3Oq8Zsy4cAsRRjTD2iIb8wCCjc0zaSL5jRKj4uA4qVmViPdHbONA1Mwe7IqqDheXXsaWi7XwDgl8OIPP70yWlMy8EN3Y6Xo5ucxbC63TqJeh+tRO5XTC69hfIKmlWFjULLymOHJCRTRZbqKZI+po4EVSQJzksdVQ6MAMpsSbtDY/kqbZq7zUVo57fjU5JDZsI2bReP9UH/h/lou6K1LfLcmwC5E2rzkNBktoyETsGtwaECuordxAvhPQkiU61eO9LM4Z95aAezQUjEcbWSq2AeEsF2JoYipNIYhnSqufOSHLXbNc5Jpi9kz9l19+bxJIwI6BjYdKwtk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjhSdDBKWFpqSzQ3TWYvY1Zrdlc0NGtzL0lhQUh5cU5Zci9uMDJUSU1RcTU3?=
 =?utf-8?B?UFZmRnY5RkI5NzBLYmNQcURrL2ZnMFdReHF1cDFZN1BXbEpmV2tPemhUb2gy?=
 =?utf-8?B?ckJFaGtjRWN5T2JDZFZIR1JrVXd2YWdCeXZmUkRVSWxteXJxaFk5RFFTZDlY?=
 =?utf-8?B?Q0t4TVBjUzlSaDJraStvOHNqcWYrQkMySDM5N0lwVDVGUkIzL1pTSmNqRDJ6?=
 =?utf-8?B?bkxDUEYwWVBaaGFkMXl5a3pJOUlZN2Z1VU1nOVZGNDBCZWVnOS9KdDhNcmt6?=
 =?utf-8?B?K1QyQmxnTWpDV1ZFSmh5dllUREF4akx2K0ZqQTJvUGdDOUhDSDNPZ0xLOGx3?=
 =?utf-8?B?a3dsR1ZGMEpDdWljMmVvbThTd00wZUpjRmhpVjBVZnduazh0c1Evc3ZsMDBE?=
 =?utf-8?B?QVhIcTl5SmhxMjJqZW9FcHA1cU5INlhJUFlMaXBZT0R1Um9JdmlENy84WlJP?=
 =?utf-8?B?TW9pQXoxaFZCSUUwRm5ud0lxSVZBNUcxdm5KVzVYOXpBaU02dm1HTDNmYmxB?=
 =?utf-8?B?THRlMkZwbFZvUFpWMUIyQUVKd25hc1Z2NWkrMEdXbC9NbTB1amRWZlNOcHFx?=
 =?utf-8?B?WGFIL1E0WjBrclNzT0FiZi9DbG02aWNEb25hVlZwYVp3N3dHZEhweW5wcVBt?=
 =?utf-8?B?MzN1UnNMLzVzMmYyMXFiV3dKNmhnNm1jclZTdGczTkVScnVNR2p5OWFyaC9E?=
 =?utf-8?B?bEFQS3VNTkM2d1IvUm9iaGJEdWxCcVlYSXpLWkhNalpON3FKSVRHUUpOazV2?=
 =?utf-8?B?c2VWK0xOajdsNVdNUlJURlArNkZwZkQwNVNTOTA0Z0FERDVEdXdtTHgydXdU?=
 =?utf-8?B?b3VEVTRCU2Z6Rnh6YlE1OFVWUnVCZDZtNWtzSE9mbFJ2Uk90Tjd1K05PTGgr?=
 =?utf-8?B?aHVYcGtzdEJlS1BhUHlNMFFrQk1PSVV5Yk82MTRPSHJtY3doY3hOemxiRmJF?=
 =?utf-8?B?UXdwWWgrSWIrT1Q4Y3JTTC9sVWpwcm5vQ3lTbGRnSnRVcTEvWlQ1TThvWWRG?=
 =?utf-8?B?U0tqdHk3UDFCbzdTUzExM0tRNzgwbUNtNGhtYVFMWEZCNzM1bStyMTkvYmVD?=
 =?utf-8?B?TVlBbU5nVnhwNzcxVXJURFhoVHVZdGdQUmo3VytUczN0ZGZ5UWRuR2NHZGZq?=
 =?utf-8?B?U1A2THRQNVF5YzMzVVMxaHRTQ2xJcnRKUTB3UFE3SW1FeDlDODhVdFJmay83?=
 =?utf-8?B?WldpRnlYdzFHTkxQTzZyVkNmaC9sYlN3K2N5R1ZlY2VkTFVFSk1wNmt1anVO?=
 =?utf-8?B?VXhqc2QwUU5NTkc2Szd5ck1wN0ZOclNKNmdmZ3JIYnRSMnRuRDVzd0ZPUitN?=
 =?utf-8?B?T09LMGtDNEYzTktOVS9vV0V1V1NYVmlsVWdzMEZQZXlvTEZGSmVKY0JzbU91?=
 =?utf-8?B?b3MxbGRtU1g5TFVJTklvVkxXbUFKVEs5S3hsUEdJWEtGay9lamNTNVdCMlFy?=
 =?utf-8?B?Q1RES3lBSTBrVm9TcERxdFpBbVFtbURlT0VrTVhlbCszV2hRNEl5VGhUcTV6?=
 =?utf-8?B?NGRnWjV6SnVGdEVqSGtTNnRvcUpMNU4wUnFoUm5scno0a3pKTEsvbHY0b2Nq?=
 =?utf-8?B?dURjSVMzblV6b0twd1ZZWVpHQjRtUlA4L1d5VlZueExpVDlKU0UvL1RTUmxR?=
 =?utf-8?B?blh4Rzl5cEdDYk1DMVJmSnR0NE1lUVBTanVUWTh3aExMTExCRkQvWk1WNWt1?=
 =?utf-8?B?V0o2dE01OFFwVGErN1dXbXlFNDZ4cTN1czM0VWFiUlJqRGlsYjIvb2YvTlFx?=
 =?utf-8?B?azJHS1VFbzlObHBSS3A2MGNoZDhxbUFMU1V2VHdJY0p4T0hQV284QTlDdHZs?=
 =?utf-8?B?VU9nTlZ6dDF0eGU2UGh6YXBTNGgzM20zem01dHFrem5IR1hsd0F4NW55WUZt?=
 =?utf-8?B?RzZtZGNFNjc5UWNsNFltYWxSb0d5Wk5UbVE1K3lyS2VHbjM1eXdSWHJxN1dI?=
 =?utf-8?B?S201RWdLTXp2bmJUN3g3UitDUTdadmEwREwvYVlGb2ZQYVNJdVBLNlRyQ2ZU?=
 =?utf-8?B?SjJjMzFYSkNvKzJFaFU3MGtpN1VnUVNkKzZZU05PM3EwbGR0cUtYRGVHVVVX?=
 =?utf-8?B?cVNNWnNiS1JRTmVOcWdvUjdJQk5BWDFUVE1QdHdmRk9xcXVjT2RGczdSd2hO?=
 =?utf-8?B?SzVEL0greS9tRzNjbEkvVXV3b0YrNkErZ3RFVjdmOWJzM2NBZXpTd3MyQXJY?=
 =?utf-8?B?MzMyQVo0aXQzK1ducWZqcS91eTd1ZFRxS1RXMnlJL3NYc0NPVXJPVks3UXFv?=
 =?utf-8?B?bjBvWDlNUzVvS0pDVU5qMU43T2k1ZzNxVzNadWtDRG1oZ1ZWZVF3MDdUaTAz?=
 =?utf-8?B?Y3BDVkdQaXFjcFVOV3VWd2cxNC9QdGFsOG9WbnpaU0dyVjhVcGtLdFFoOTlR?=
 =?utf-8?Q?l7I8LDEC0/7qEeBusJmTbQP6x+I9cf6X2LsUH?=
X-Exchange-RoutingPolicyChecked: k+yPYvPEwcBF5bW2blN2z8SSftD49xZfKQ/O2IlepbyF5B6gy7kihulXqaUzjGoI+PsPjrtflbEeV138dS4jkrPlrSmMS5e/byOK99pnjOGUu7Eb473H4ghPo3bR3+jrXCMnfZjA0WMKd+5CtWlllsZ44PvVfa3KSxbrZh6lMsm9Zc6dB6j1H0N5frgakhH5OqFCFbAnjqiOQDADrRYjYc8xRXUx3zkysT+weRuR0qrvh2W0Hf6tZP22Dvi2WUfxJsR59VBn7jwPDLu5XRdeW6hPou5LLDkSci/rncnWzd9jTlquD/ulyn5HVfozxDkMNhN0wvzpKxyB1dNiuz1iDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 631252e9-51b1-45d5-8141-08de8a935fdb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:24:30.7754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCBjVGHhoBOkDRVWrvsN2kjxcLWlbljkx+rFv3LBoxD25hUomGDO3d0iqRZaQr87ju7cXvnG3cRK31nd3o2sjC3FTkDQr6MlfCqVqexV+QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD7E67F036
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

On Wed, Mar 25, 2026 at 08:02:21AM -0700, Dixit, Ashutosh wrote:
>On Tue, 23 Dec 2025 10:39:47 -0800, Umesh Nerlige Ramappa wrote:
>>
>> @@ -30,10 +36,17 @@ static void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index)
>>   */
>>  int xe_soc_remapper_init(struct xe_device *xe)
>>  {
>> -	if (xe->info.has_soc_remapper_telem) {
>> +	bool has_soc_remapper = xe->info.has_soc_remapper_telem ||
>> +				xe->info.has_soc_remapper_sysctrl;
>> +
>> +	if (has_soc_remapper)
>>		spin_lock_init(&xe->soc_remapper.lock);
>> +
>> +	if (xe->info.has_soc_remapper_telem)
>>		xe->soc_remapper.set_telem_region = xe_soc_remapper_set_telem_region;
>> -	}
>> +
>> +	if (xe->info.has_soc_remapper_sysctrl)
>> +		xe->soc_remapper.set_sysctrl_region = xe_soc_remapper_set_sysctrl_region;
>
>Maybe these if () statements hould be moved inside these functions?
>Otherwise they will need to replicated in every place these functions are
>called?

The idea was for the caller to check if the funcs are available and then 
deal with the outcome. In sysctrl, the check was changed to assert due 
to some review comments. We are trying to change it back to a check and 
that should do for now. The telem caller is checking for it and bailing 
out as needed.

These function pointers are a bit off in terms of implementation. Matt 
Brost had suggested to clean them up and use vfuncs instead, but that 
refactor is still in the works.

Thanks,
Umesh

>
>We've already seen this problem in the sysctrl series.
