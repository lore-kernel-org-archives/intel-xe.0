Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68003C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 02:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E2B10EB9A;
	Tue, 14 Jul 2026 02:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I35qTQza";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E407510EB9A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 02:04:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxhdvEo9W1xMJLZiJW8+N6W5e5fq5SUUwgLJO5+QlyQwFbQ14Gxni2rm9XtwE6ZNY6n5DJJTSPaU4bDJ6LZtpJN/aOKU5+gFxpzB7/eSjK8nDckw//XWrcVdJxYmeNbN8T/eYwYUmBMQJSg/FbGROXsJSxZZpwbgaIucK3QvEavlNFtS5JASNyJ2JDckvDC1HuEk9dqnulzow0iuZErA6WykeD9yudVR9uwRc9CIwxlrQ+p4NiauR4Aq8en1PREgC02MrtpdxE1rTeVbyy2GMrwHE1SjKOAS3cnncOKwNnjAeiN4DYD1Qkevsyn38EPTe0LutbmDkahKAkGVLmnX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtWvdALTDFZNSwZO0p8K8QhGvvnk1lgxskDCwp4irQI=;
 b=ps0vaURImcOev5oWRmCOXj6ACIW9hfijkXGQdqc3UQtx4C/tuyEAhZmwusL9Pwb2h6IAOH6pkq9DNUrwdOHcQJTWCYqLx3tuaWdDAM64VDFcVbFk7OeGdHlJxqxp1QDDg39FbxQKsmuc/LM6Of3d+TcrmJHDmhpnwWhXhsQUyuUPyFeyzI/VWCJTGKvcQklVxYniM5JcDtGtE64rCsleXrnNywkYTsDcs266zj3EaWCNo8DuZvFBjSPriF1P33ekjCJSYplRq40l3BrvenHNCTOBiC9zRkfn0afpDjspxH0GARHrAX4odz6fnkKHsGwZWQhgAKpynymUFPcglry3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtWvdALTDFZNSwZO0p8K8QhGvvnk1lgxskDCwp4irQI=;
 b=I35qTQzaOMbrZz/HH06raZdg9bYvrm9oD2FcSRY5LEO4Q5nAHsz9pVMEF4pfFCVA5A7yVz3s5k8kDm5hHWhobhCKVFxg6cYACR2H7GXnlAxqwVi3Ca+A6oHUGFDAhck4UzC3AVhr/LAJwRfX9C71pnQAxpK0qNvQ6XiAKrBSWMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7183.namprd12.prod.outlook.com (2603:10b6:510:228::20)
 by LV8PR12MB9111.namprd12.prod.outlook.com (2603:10b6:408:189::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 02:04:42 +0000
Received: from PH8PR12MB7183.namprd12.prod.outlook.com
 ([fe80::d54c:d13c:6346:4009]) by PH8PR12MB7183.namprd12.prod.outlook.com
 ([fe80::d54c:d13c:6346:4009%4]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 02:04:42 +0000
Message-ID: <7ab95b89-9efb-4bbd-bac2-2e6df069f340@amd.com>
Date: Tue, 14 Jul 2026 10:04:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] drm/gpusvm: fix IOVA/DMA unmap leaks in
 __drm_gpusvm_unmap_pages()
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20260706024642.614238-1-honghuan@amd.com>
 <alULRxMpL8x4A9VM@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Huang, Honglei" <honghuan@amd.com>
In-Reply-To: <alULRxMpL8x4A9VM@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0057.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::8)
 To PH8PR12MB7183.namprd12.prod.outlook.com
 (2603:10b6:510:228::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7183:EE_|LV8PR12MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 804e7d76-61d1-4889-259d-08dee14c4487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +fAjQ37emk+ihHbHADT66PG6Egt7vxchVrtSXhdTsmHv9GBkqf0xHZcIV1wHZG7n0LQcW5eLqTcrxTaLdad8Fx59K7sf6cIg5EYtyNRYfTuyaJX7qBy2Qx0UbM+b2GKdRi5Li35vipXeIVXH9/8szyrfMDBQQbER2HIWyXrUOO9BTC1kodwIPQTggice4Ac7IAGHpJ49J/oNYr0nTld0ETTRD+TPUI7+aI0m8VFL2++hCORRmLTZJZ6eRehECIv8ClrynrjqdwqmLssqkSZJ3C9RRYb61XA6rFruTzwXlvj8Z7c6rnuHus2Hva51aY0Mc8vaN1HA9/3csunUS5lJw/zJ/jyxHa3GsH4bTgTKIT5CgWr+jpNF74urYuQJLt84yB3T52+B8+BnkvtzmsalJukmwIlwEDFV3KrLurkiqkBEe3NiwPeeN6vWTFMMa34WnBQtce/5soTDv7CcCupFt5XZKBYKGTbVOuFPOlk2bo6TIfChvSYhosdrc1oMjilpBLS5J2lmF1sIcXynSwcgBvGtDnHpzNJLiZ6Tzz/0IqY/3B0DgkOLMEQuHR1a4MmsQaUdy8Cl16R1brZ/51UdQqhfSwK5LeZ1nS8aA+q6EQanyNEpUXM6PGZinQrDHil/jAZ6b/r5uTPiqe7Bp0PYqo/5DGSl4KeGfCAb8oEtioQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7183.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3A2amdUZHE3STRqeEIrRysydmZCL2dxUVZUT1djc0xYOHVERldQNUNQc3gw?=
 =?utf-8?B?U051YWpBVzBNaHV4LzliZzlKdG5sdTZXOGp3OGVpb3VIR0NZbkY1ZTRxTnFU?=
 =?utf-8?B?eWQwL2RzQ0krWEZ4N09JNk5FVFAwcXJSdTNOUkhtaG9lOXZOQWNSYWNQOWdy?=
 =?utf-8?B?cDdTY3BsVGV6aGNnZGxDbmI3TmVYTmEzek5PM25SNTJtZWhtWlB5SE1Vd2pl?=
 =?utf-8?B?TElLQ3k1cGY5YThiYzlUNTlsNEprc1BYV0tvdlBDeUxiaW4vZGRuMmhKanhZ?=
 =?utf-8?B?eTRLeGZuL3dQcHdGYmhxTXFHakhaWTIxZW9GUWE1SENFWEx5bGdhSU8zcjhn?=
 =?utf-8?B?WmdoRUtaRlBSZGI2NE9SR0JLUnNkL2t2cEdUaEhBMnh1aUlBTjNvWmlxdm1P?=
 =?utf-8?B?WVdhOXJTcDV1eFhDK3ZpRVlZM1IvSEdlSHRNNklidnJQa2NBcjhyVXBJNHlB?=
 =?utf-8?B?TElnQUFpb2ZqRlRHbzM3R05OY2hoYVJRSllxOG1tOGZJdXhJNnAwd2JYQndB?=
 =?utf-8?B?QTNqRUxNSHd6T0NzQ2tzczEvaDNwT0MyWWFkdDIyRlMrYUUrZ1F5SHFjWkp0?=
 =?utf-8?B?TDRWbzZLZ2F1OE1ydFNBWWFDUy90UGZ3bWE1N1dGQ2JrakJXa0Zkb2ZaUVYr?=
 =?utf-8?B?VDJSM2lhckYvKzZ4a1NGOENpc0VKZFIrVVV2MGZaaW9Qa05WbHZJYlEvVkhl?=
 =?utf-8?B?ODYvYUpjemowMldDWnp5OUEybnFTdnRDZno2VHJDUForTzlEUjFmR0hHd3M5?=
 =?utf-8?B?UW9hdlZaaW9MNFpOMDNPcm15a2JLdDYrNGZ5L3pBeFVrRkk2QVA1SkMxaVY1?=
 =?utf-8?B?NWlkMUZEVDBJcGE0MlJMTTBsZUpSRGNYcXhhbE9OekJHcHh4aTFmNVhiZGNR?=
 =?utf-8?B?VFNSNnBHeE5oNkRMcC9GdERzY1dzUjc0NGhtVGRacC9QSlg1WVBWdGJydGth?=
 =?utf-8?B?bnNqbXM2cWdsNnBYbFVBYk10VzM4TkVGZWJsdE9UUGZ0SnR6WWxzTGR0WmNC?=
 =?utf-8?B?c1ltTDcxbkwyNlEzbC84SzVkWXJzcGlEbEl2cEZ3RkZLVkpaWkg1a1E3V1V4?=
 =?utf-8?B?Tk9uTjlDOEkzaWxOT05jZ1NyUjQ0ejVoTWRGblF2dlNqdGhtKzhSelRPMlpX?=
 =?utf-8?B?ZWJQNy8xb216cUgvdHJLMUZnUWRQcXpjWXlOSnVhOThWTnRyWHpGQkpPaFlP?=
 =?utf-8?B?UFg2SUcvMENrd210bVU0eitrMkJ4NmJBNU9MYlh1QnVKOHlzRmtGSG9HeGhM?=
 =?utf-8?B?SFByT2FKL2tVK0JCcWs1WTF2NFNsWHlBbjhJbTFaKzVZT3AyNkw2RHdJREJG?=
 =?utf-8?B?U0tZbTB1K0kva2hwM0UyTTBqUGpWWmxyRmVGa29pOFRrcTdjbHhpTyt0Yzhv?=
 =?utf-8?B?QUs3NHRFYWVCbWxJbzN5MjQzdEQzNCtXT2tsbnJZMEJDdGdJWjdCNUFNaFZ2?=
 =?utf-8?B?cERhRTNrbVNoZG9iaTVJZkNTdTNJbGM1d0pMLzBuU3RVYWFSRjd5UDlmMnhM?=
 =?utf-8?B?UGI4UE01ajRMK0lreXZsSHFVc1A0RXF6RW5BVnBOWTBqUDFkMHRvVUVJWXpk?=
 =?utf-8?B?VktLSzVyRWd4SDg0WkI4MHVZQ3Fob3Q1Mm1WTWRCV0JBcy9iVXp4MFpOL2hX?=
 =?utf-8?B?cS9QUVBaL2ViVkhlYXZIQWtNcCt5TEkwamRmakxkUURDcDBYTTRSZUJYbStK?=
 =?utf-8?B?eTZDdHRTQjU3R0RGQ2F1bzN4VnBDVEJkb1hOdjYxaXZpKytrWDJ2cHl2UVBk?=
 =?utf-8?B?UXp5TjlnY1E4OFZmODMxSGRZWFZEMkFhSUhBQ3ZWMXQzdTJhWjRhMFRwaU82?=
 =?utf-8?B?cnByMjV5RGh0WHlYRkFobVN5cFV2RUxOMWpLeDF5L0R1bFdQSENsM1k2ajgx?=
 =?utf-8?B?YVE0K1VQRzJjeVBwUWRGS1hjcjFsbENDanhNMXExQWltQ0xCUmMyN3NoajY0?=
 =?utf-8?B?ZDhaSTFOVTFJRDJiaUlhbVNvTHB4ZjlNNmsrOGVvLy9pZmtRZkc1OHU3SGVa?=
 =?utf-8?B?RlE5SE5GMDl6VFB6b0FHNktXZWdWQ3VoUFBMWkQrY1ZWUEY2YWpIMTBOclVz?=
 =?utf-8?B?eU9rdThvUW82amF2ZEtWYThXKzFPdk1DcmZ6OVB1d25qZ1dxV3NKWVZITUtT?=
 =?utf-8?B?NXJDSFA5eE0yRWFQZGRPeGRaZEwrWGRranJ4K2JUWkdmUjFYVFZCQ0pqbGpZ?=
 =?utf-8?B?bWpsbDNuc21rbUhCSkZLTHhNVDh1SmluZkJxUC81ZUlJaUVmWGVrQ3pKeEV0?=
 =?utf-8?B?THV4d09GWWtFcUEzaVZmTjZQalc1aFJHR3duUy9rN0N6cFUva3JkRUtycFB0?=
 =?utf-8?B?S3d5aEwxM2FSTDh5N05jWTRSU1laNTNZbTRKRmc4V3JtQWh5TWZTZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 804e7d76-61d1-4889-259d-08dee14c4487
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7183.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 02:04:41.9297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osUHSSa0p4FkXI8jXCuqDAxiiossbbV8eagqznNpbJNlGEmMN/t979M+pLJj1CqxMslkO1Fi4zf6ojOqi4og/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9111
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



On 7/13/2026 11:59 PM, Matthew Brost wrote:
> On Mon, Jul 06, 2026 at 10:46:39AM +0800, Honglei Huang wrote:
>> Three small fixes for the IOVA/DMA unmap path in
>> __drm_gpusvm_unmap_pages() and the get_pages() error path, all spotted by
>> AI review:
>>
>>    - Free the whole IOVA reservation on unmap. In a mixed range only the
>>      system pages are linked, so freeing just the linked part leaks the
>>      IOVA reserved for the device pages. Unlink the linked portion and
>>      free the whole reservation. On the get_pages() error path
>>      state_offset is 0, so skip the unlink, also avoiding the
>>      uninitialised dma_addr[0].dir read, allocate dma_addr with the
>>      zeroing kvzalloc_objs().
>>    - Do not route system pages to device_unmap() on the IOVA path. Branch
>>      off addr->proto so only real device pages reach device_unmap().
>>    - Publish dpagemap early to avoid leaking device mappings on the
>>      get_pages() error path. It was only stored on success, so a mid-way
>>      failure left svm_pages->dpagemap NULL and skipped device_unmap().
>>      Assign it when the first device page is mapped.
>>
>> All three issues are preexisting and independent of the gpusvm MM/device
>> state split series; they were surfaced by the AI review of that series,
>> so this series addresses them separately.
>>
>> V4:
>>    - Add reviewed-by for Matt's review.
> 
> Thanks for the patches, going to merge this to drm-misc-fixes by EOD.
> 

Really thanks for the review and merging!

Regards,
Honglei

> Matt
> 
>>
>> V3:
>>    - Add fixes for all patches, add Cc stable.
>>    - Add reviewed by in patch 1.
>>    - Move AI review note into commit message instead of reported by.
>>
>> V2:
>>    - patch 1: extend the uninitialized dma_addr[0].dir fix into freeing
>>      the whole IOVA reservation, fixing the IOVA leak for mixed ranges
>>      (the earlier version only guarded the direction argument).
>>    - add patch 3: publish dpagemap early to fix the device-mapping leak on
>>      the get_pages() error path.
>>
>> Honglei Huang (3):
>>    drm/gpusvm: free the whole IOVA reservation on unmap
>>    drm/gpusvm: do not route system pages to device_unmap() on IOVA unmap
>>    drm/gpusvm: publish dpagemap early to avoid device mapping leak on
>>      error
>>
>>   drivers/gpu/drm/drm_gpusvm.c | 53 +++++++++++++++++++++++++-----------
>>   1 file changed, 37 insertions(+), 16 deletions(-)
>>
>> -- 
>> 2.34.1
>>

