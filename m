Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BE6C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 12:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBE910E1DA;
	Fri,  8 Aug 2025 12:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Zglf74F4";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA83C10E1DA
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 12:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xacRP9x9yAQksV+XO3t3pPKxp3MBQoRfNKAchTnf9wuwSc222mRBSZ4F1aVXydiAbMvRJn5p9cmeR0+Jk9TR3qr31BjzpY1xHUUvnTuoadoJyFKxWZ/xiGpUHPE7HKGGq21oqukbKnaelL+BDHn0p1q9YrGDI2SYIYfELMceL/9CyVvBDWjNdufmi+/X5LRlM6ZZilzr9a/+N02JNuyBMi0geJ3WBmeXQfFpq/4OMZcYrVW5KpIB0gn94NeR7dCVFN8rDpBeVF88RnltzrkdJyjTKeNhWwwxOUReRV/ucrZBKpCBNLAeYCOEW+kxziFi3bhkPfedmHiP0cNrGa667w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yIUz9X4xF2OwMAfuOD9F8V1UmV/4OqGAdB3U52nNoI=;
 b=VZhrYpPtiYgZk51bEFfqQHiMXCb4m2XkTN/LaJjXPeYpAlLlT+buLEBxjj3U15XQCu/P7E6DQ3wR2UkLJ8DU/faY/vxhKk3YeUox5RP85GFNQ/NpQ5e0gjGDdCi/y63Ye8kb9wh5gWk3PRKpZzgABm6EnGhnwSsUR5nor5i8FQdCxWnmUDlVrc5l/IcVIgH137whLfNDLnJwevyl7VldQGRwDbXNPVeougxvJ7Wy8cJ7X93TXmkB1ZdBB/ByBL9FMCbtzYjko2JY3oxta1jtXwCCmG3a51upWZ9IUUgJxeBCCu+fM5dLeYZU2Ri3FURcFOLipnLHZSKw9hHWl0tkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+yIUz9X4xF2OwMAfuOD9F8V1UmV/4OqGAdB3U52nNoI=;
 b=Zglf74F4YN85zRlamVfl/ExTk6JT9AOUo0eRvXfTOr0CfywCcAJjy4CRJBEHiLqL2jDA4NNYfx0mSAoA7ZCFmpH3R5JntOf56j87thRNMUcnnmAaaAZqzwmxKDRQwFSMdl5a7dJd/YqCq7UYU9wbb7Bxh5dIMQH98XZIQurulvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7075.namprd12.prod.outlook.com (2603:10b6:806:2d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 12:49:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 12:49:26 +0000
Message-ID: <49a1024b-a318-446f-8c97-4076fc647fdd@amd.com>
Date: Fri, 8 Aug 2025 14:49:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Intel Xe GPU Debug Support (eudebug) v4
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c86acad-a8e5-4b7f-01e9-08ddd67a0202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjdDdk9zU3BsbEVER094bWk5aXl3UVZLQWFNYXA1SjRRQy9DUkNlWk5QWUhr?=
 =?utf-8?B?Y0pYSnA0alZaL3IrZzhiMG5uaWsvc2s2blFvV2xQQ3dtY0c3RnRPWk9CMlVP?=
 =?utf-8?B?SnY2WGFTZWlNQ2hkTFRaR1RFUEFlUzdOcEw1MnVGaU5sYWdyQ3dwYXh6eC91?=
 =?utf-8?B?ZkNDTnZ3MTJaQTBNNmxHN2JGcnU3dWVRYnFzOFhFL1Z1UW9CMHhPMmlqM1o0?=
 =?utf-8?B?Rk56dk8rOHY5eGRXaUZUZzIwWDRDbUJzT1Z0eldYWFBJUCt5TkZzM1VsaU8w?=
 =?utf-8?B?T2JSQmwwZEdMWFhEYnFFVkFzdk5wRGwybklWRUZha2Q2SFRPYXFGSkUvbnNQ?=
 =?utf-8?B?V2JtMFEzME5BUDEzMWlxY0V1SjNEeFJxQktEY1VVZTZzcXJIWUVTeVJCemZN?=
 =?utf-8?B?Tkk3WEZOZHRMSCszeUlBeUFsdUljNGZIQ3B6SXk3ditNN0M5cm54ZG1JVEZC?=
 =?utf-8?B?N1Z0VHZPSE95QUwydEhQdmRFSnhtYVVqZU45bXZjeDJCSm1tS21GQ1JJdm5X?=
 =?utf-8?B?QjgxTzc5c25BWnFDczB3cnh6U0V6VVhkemFGVXpPRjl0NkZzZ3lRRGpFNG1u?=
 =?utf-8?B?VmJlQ1lzY1MrZ01ITERWckFDMnVTZzhYNC9iSGg0YjFDUDhhU3BDcHo3ZXlM?=
 =?utf-8?B?MkJpSll3WkhNcnhNYmN6Z0xPSGtMaC8zR3BzZ0prMC8rS1M0eU1zdjg3WVYv?=
 =?utf-8?B?NlEzaHBjenROUW13K0xsd2JBMVJweGczakthTm1vUnpxL1FzajZvTU9YVzlY?=
 =?utf-8?B?c3paT01HaXd5UldlRjRSTEpjdzlOZFN2dnMvVXRVZnk4bytXNSsxSkpGUEd2?=
 =?utf-8?B?T1RudW5pMkVQKys1L2VEaWhBajFrTWZOakJ3T0tkYVhMUjArS0IyUDYxWFBp?=
 =?utf-8?B?ekJVRmZzazQrSnRGZTJ2WmoyRGppOS9qRkV5UGVaTFVFVm00V0FzVWVBaEVF?=
 =?utf-8?B?MHZISldjQnc3RGJzSGVCVmhuOFJvRytnVUxaWGlGNEw5Ylo1bmVyNzNMdVU4?=
 =?utf-8?B?N3RzK1Z1c0lXNkFzUnJ6eDF4Zkt5S0Z4V1R2dEsrK3Y4UjZNWUNoWmtmSjFK?=
 =?utf-8?B?RnRZcTdwczJ5Q1JPWjBybzVLcFlMZ1pZTk83eS9hTVhjL0hrZWowLzBTNVVR?=
 =?utf-8?B?T1pCWkZya3pqV2JTWmpIRjlwQmJkTkxRK0paYi9TK0dic2hISW9RN2VMRzlh?=
 =?utf-8?B?bUcxUGZKMVliaElSTlFIckZPVzhOSTl4NGZKYUI0WTFEQzlob1FpL2lRMmZj?=
 =?utf-8?B?ZWxDZDBXWEtwblpuNDIyaEpZWWRsVWZsMzRJRWo2cE05eGVhZWJCM3Nqb1Ny?=
 =?utf-8?B?ZVUxQ2F5YlpnUWw5MmZ1blFhOTROQnpSUHBZOXRrSW0rUUVydHRNa3ZFb1ps?=
 =?utf-8?B?UWFNNUZ0ZVY0MGdNdFd3YU1lWWcxM1kzNkpER3p5VnlBR3dCZVZoc012YXhP?=
 =?utf-8?B?MXZ2N2ZzR3JSRFVDRjBwMnhSUFlsSVJkd0VYN2phUWNPZlNsRUZlRytmdFJE?=
 =?utf-8?B?SHdKY2FmSFRHOTllbmhPR3MzTldabjVFVDJYZytaVnpIVDBXYUF3ay9QUE9U?=
 =?utf-8?B?TnNJTGpsS0xEaGk0S1ZlakpDRE1MQUZCZHFXZW4reFZWQkJLbWpSd0Y0K2tV?=
 =?utf-8?B?NkN2QUxkeGxMbHdyc0I3MXVla2xwK08xcHVGaGlhQVp1aVdoODdWTkwzY2xs?=
 =?utf-8?B?aTdwVnhIQmdWc2V0ejRjcmZhMUw5Y3BGcmJEc1dDdW9icjh2VVhndjI0MC95?=
 =?utf-8?B?ODA5d2ovNU14OEZGMXZjNGwyRTRWOENRcHRFVHJZK3dNTG1EQUFjQ1ArSHo4?=
 =?utf-8?Q?uQ5EJ2qTNX/DrvJ0SIIz3zy8kP9n1bpJvKBw0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnI1MFl2V0hoMFVka20zQk9zQXNJQmZaWWdJbEprOVlpWVJCNTUyQm16bnFF?=
 =?utf-8?B?dTk2VmE2dFlPenp5dzhxdjZwMnJGUHlGY0Z2K0o5OEY3MlovbjY1WGlkSW9t?=
 =?utf-8?B?TWx4V2l0T3B1SmZBY2prQkoyY2IrNndCSXBtbkQ4Q29aZHd3elNMK2V6eFhx?=
 =?utf-8?B?Qm8wTUwvUlcyVExjWC9WR3BtL2IrY1VSdHQ4MjZFUWsrTXR4UEdseXlsc1dr?=
 =?utf-8?B?ZERvZEt4QnlSZXBKaXkvSXJwVUxibU04bDdUdWZFRXRMQUkzRW9majBYUG13?=
 =?utf-8?B?L01oaFV3QnVPSHI3UzgrM1F6cCtjbUU1d3g1alhhb2drYUJHYVBVajh3cmRN?=
 =?utf-8?B?cnVOTEtXbVErTVZLZGZvVk9QQmdxUmxHRHdGVVBRSVZtMzRKSXVBK2NvOFpN?=
 =?utf-8?B?VjIyWmNISlR4MWxpOWpDL29yY0dETW12Ri9PN1oxZEFBVkJuYVdpUVJMdUVn?=
 =?utf-8?B?R0c5TTEyTUtKS0ZTZTNVMXRvOWZLcGswQ2JSK3Jidzh4bnBhZmVQZ1QyMmIr?=
 =?utf-8?B?VFBxU2xraEtvcmVZYjZqUnhyRzdQcko3QWZ6MkhQVWNFVmZvZVpMSlR4MXFl?=
 =?utf-8?B?TmQzWkd3QjRQZ3pDT1g1SCt1aWQyUDc4L3V4YlEydmxWK25iaDI4M1l5U2Ru?=
 =?utf-8?B?ZTZzSXZRMVdFY2N3eGd0M1E3MzU3ZVlDdUM3Tkx0VmtRaVpTcTF3SnVBUGdT?=
 =?utf-8?B?UGkrVFJEaFYwYVFwS3N2a1JzV0llNlkydExweTF5NVpqQ1FaTktEOW1pR0xF?=
 =?utf-8?B?dEp1eFlQRiswS3ZVTHBwOEZleitvSHgrcm1KTC9rWXd5ak1id0Q4azJJMGtJ?=
 =?utf-8?B?clhBbm5DOGsyMDI4Mlpnbmhoa2Yxenp6TEp5K1d1eithUGc1UjhxZ3hjV2kw?=
 =?utf-8?B?SytYMFgxcDA1Qjd3SjBTdmcrY0R3eVN1N3pnMm5Jbys0U0xrK2V6cGhZeXRP?=
 =?utf-8?B?WFVleTRSYVpvNjFVVXZON0dxVjRDM09PdnBpNTBHZUlqZUxmN29ybnYzMHZo?=
 =?utf-8?B?UlRwT25GbDlyY21NU1pGQ3N1cmJ2S2p2d0kxN29hVTlRWnFBOFJhT2pTajZT?=
 =?utf-8?B?NEZxMlc2cSttWGNPNmRnYXliTTZvV0YwSVYvQjM2SGlGd0pKN1dXRC9PNmt6?=
 =?utf-8?B?dEhaMVNNdjVYRHUyUTRkZmpjMVl0RlBKSHJwN3ZzbmZhbVlsVW9QQnB6WjRP?=
 =?utf-8?B?cDZSNzJjRS9yaWdSQU41WDBPM3JxbGJDdHhlM25pRmhNNW9vNHQwbmttNzBu?=
 =?utf-8?B?MGF2ZmxKVXNubVh1QnQvNnMvcVJmTXJadDhiMjNOcFBTS0hUekZDWVFRZVlF?=
 =?utf-8?B?MVNLVGJvNW03R3lPbDdlQUEyclVlZVlXZUw5dmFYT01QTlB2NkdQbjNRRmNy?=
 =?utf-8?B?ajNkeXdjYTFDRkV6ZFl0SVNkWENvS1Q4cklTbEtNeGI1V2hXclJibWdIWENC?=
 =?utf-8?B?K2VJVVlGTkRFL2xVUE5RM3hCbkltM3NibitpWEFBejNtMHRtdkY0Tk9TakNi?=
 =?utf-8?B?czdBbUVrL3RlNTNRQjFEWnlyL1EyTCtPTXNzMm5EcmxHQzhwS1ozQnVQampD?=
 =?utf-8?B?dnZ2S1JvRjl1SVk4YUQydjhxblV1NVE2QjhqVm1qWUNVOWwrMjB0cXJkTncy?=
 =?utf-8?B?QkZqZkw3cFFpUWNSVkFPbmxuRWZIbHBzNWpBMjM5b2d2SW5ub0ZLMmdmd3NV?=
 =?utf-8?B?Tyt1RmZHb1Y4K25hWk4vZEZsZmM3aG5mbzdQV2RLVTBiQTdPYmNrUzR4OTA5?=
 =?utf-8?B?M3JEbE1VdDB3dG9hQVFBVnRjQlN0TFZTeHZRY004ZHp3RlhtK09jdW41U2tT?=
 =?utf-8?B?VFJOc1pkeDhTb0xPNDlnTFg1OE42alVBc1JNa3EvaENSTW5QUFZhWjFUazNO?=
 =?utf-8?B?SGNHcG9jWHJWNHhzNGd4QXdqY0FOK1lTT1dBQmRtbG9RTmpFVmFCSzVSKzdK?=
 =?utf-8?B?UVE1TUpsbzE5bUxtSkZocWd6bGVHdUhsbDd3dmNxSDJPWE9OaklRQ3RZL0l3?=
 =?utf-8?B?eklqa0VyKzg4dVJXaDFRNzA5MEM1R0dIUzJlRC9wbXVPekxwcEdUemZUVHFP?=
 =?utf-8?B?T01HeXJ3Z1FxbnlaZ1p2ZUhqT1JkZW1SaWdzcy9raW1NSU5jN1VvcTV4ZVYx?=
 =?utf-8?Q?7MmS51Bzs60FIT7pxfrZfVqEb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c86acad-a8e5-4b7f-01e9-08ddd67a0202
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 12:49:26.6015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9NFp5ryGY6MCoKrRLjBgbCUSn/Q3QLOXXokXjvpZwMyyFfwoMRgYO880VzoLw44
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7075
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

On 08.08.25 12:43, Mika Kuoppala wrote:
> Hi,
> 
> This is the v4 patch series for Intel Xe GPU debug support (eudebug).
> 
> This series continues from the following previous submissions:
> - v1: https://lists.freedesktop.org/archives/intel-xe/2024-July/043605.html
> - v2: https://lists.freedesktop.org/archives/intel-xe/2024-October/052260.html
> - v3: https://lists.freedesktop.org/archives/intel-xe/2024-December/061476.html
> 
> This is a major cleanup and rework of eudebug patch series to address the
> feedback for v3. Page fault handling is omitted for until we receive
> ack on core design, as there was no feedback on it on previous iterations.
> 
> ### Major Changes
> 
> #### 1. Elimination of ptrace_may_access() and pid
> 
> In previous series, the connection attempt was made using the process ID
> (PID) as the target. Access was checked using the `ptrace_may_access()`
> helper to achieve security parity with CPU-side debugging.
> 
> In v4, this has been changed to connect to a DRM client, using a file
> descriptor as the target. This approach eliminates the need for the
> `ptrace_may_access()` symbol export, as access control is now managed
> through the debugger process's access to the file descriptor. For example,
> accessing a remote DRM client requires the debugger process to
> successfully call `pidfd_getfd()` to obtain a duplicate of the target
> file descriptor.The 1:1 mapping between DRM clients and their debuggers
> eliminates the need for `EVENT_OPEN` and simplifies overall connection
> tracking.

It would be really nice if we could document that approach under Documentation/gpu.

> 
> #### 2. ELF binaries not held in kernel memory
> 
> In v4, debug data is delivered as a VM bind 'OP_ADD_DEBUG_DATA' extension.
> The ELF binaries are no longer stored within the Xe KMD but are instead
> kept in a file. The file path is passed as part of an extension in
> the newly introduced 'OP_ADD_DEBUG_DATA' VM bind operation. Alternatively
> pseudo-paths can be used to annotate special address ranges similar to
> /proc/<pid>/maps.
> 
> #### 3. Debug metadata not carried in VMA struct
> 
> Instead of attaching debug data to vma created by 'OP_MAP',
> we introduce separate ops for managing the metadata.
> Debug data is no longer held in the VMA struct. xe_vm contains a
> list of all associated debug data.

I need to take a closer look but that sounds like it takes a big step into the right direction.

Regards,
Christian.

> 
> ### Supported Hardware with v4
> - Lunarlake (LNL)
> - Battlemage (BMG)
> - Pantherlake (PTL)
> 
> The code for this submission can be found at:
> https://gitlab.freedesktop.org/miku/kernel/-/tree/eudebug-v4
> 
> Christoph Manszewski (5):
>   drm/xe: Introduce ADD_DEBUG_DATA and REMOVE_DEBUG_DATA vm bind ops
>   drm/xe/eudebug: Introduce vm bind and vm bind debug data events
>   drm/xe/eudebug_test: Introduce xe_eudebug wa kunit test
>   drm/xe: Implement SR-IOV and eudebug exclusivity
>   drm/xe: Add xe_client_debugfs and introduce debug_data file
> 
> Dominik Grzegorzek (5):
>   drm/xe/eudebug: Introduce exec_queue events
>   drm/xe: Add EUDEBUG_ENABLE exec queue property
>   drm/xe/eudebug: hw enablement for eudebug
>   drm/xe/eudebug: Introduce EU control interface
>   drm/xe/eudebug: Introduce per device attention scan worker
> 
> Mika Kuoppala (5):
>   drm/xe/eudebug: Introduce eudebug interface
>   drm/xe/eudebug: Introduce discovery for resources
>   drm/xe/eudebug: Add UFENCE events with acks
>   drm/xe/eudebug: vm open/pread/pwrite
>   drm/xe/eudebug: userptr vm pread/pwrite
> 
>  drivers/gpu/drm/xe/Kconfig                  |   10 +
>  drivers/gpu/drm/xe/Makefile                 |    7 +-
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h    |    7 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h        |   43 +
>  drivers/gpu/drm/xe/tests/xe_eudebug.c       |  189 ++
>  drivers/gpu/drm/xe/tests/xe_live_test_mod.c |    5 +
>  drivers/gpu/drm/xe/xe_client_debugfs.c      |  118 +
>  drivers/gpu/drm/xe/xe_client_debugfs.h      |   19 +
>  drivers/gpu/drm/xe/xe_debug_data.c          |  279 +++
>  drivers/gpu/drm/xe/xe_debug_data.h          |   22 +
>  drivers/gpu/drm/xe/xe_debug_data_types.h    |   25 +
>  drivers/gpu/drm/xe/xe_device.c              |   30 +-
>  drivers/gpu/drm/xe/xe_device.h              |   42 +
>  drivers/gpu/drm/xe/xe_device_types.h        |   40 +
>  drivers/gpu/drm/xe/xe_eudebug.c             | 2309 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eudebug.h             |  116 +
>  drivers/gpu/drm/xe/xe_eudebug_hw.c          |  730 ++++++
>  drivers/gpu/drm/xe/xe_eudebug_hw.h          |   32 +
>  drivers/gpu/drm/xe/xe_eudebug_types.h       |  174 ++
>  drivers/gpu/drm/xe/xe_eudebug_vm.c          |  434 ++++
>  drivers/gpu/drm/xe/xe_eudebug_vm.h          |    8 +
>  drivers/gpu/drm/xe/xe_exec.c                |    2 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c          |   51 +-
>  drivers/gpu/drm/xe/xe_exec_queue.h          |    2 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h    |    7 +
>  drivers/gpu/drm/xe/xe_gt.c                  |    1 +
>  drivers/gpu/drm/xe/xe_gt_debug.c            |  179 ++
>  drivers/gpu/drm/xe/xe_gt_debug.h            |   41 +
>  drivers/gpu/drm/xe/xe_hw_engine.h           |   14 +
>  drivers/gpu/drm/xe/xe_lrc.c                 |   10 +
>  drivers/gpu/drm/xe/xe_oa.c                  |    3 +-
>  drivers/gpu/drm/xe/xe_pci_sriov.c           |   10 +
>  drivers/gpu/drm/xe/xe_reg_sr.c              |   21 +-
>  drivers/gpu/drm/xe/xe_reg_sr.h              |    4 +-
>  drivers/gpu/drm/xe/xe_reg_whitelist.c       |    2 +-
>  drivers/gpu/drm/xe/xe_rtp.c                 |    2 +-
>  drivers/gpu/drm/xe/xe_sync.c                |   45 +-
>  drivers/gpu/drm/xe/xe_sync.h                |    8 +-
>  drivers/gpu/drm/xe/xe_sync_types.h          |   28 +-
>  drivers/gpu/drm/xe/xe_vm.c                  |  186 +-
>  drivers/gpu/drm/xe/xe_vm.h                  |   26 +
>  drivers/gpu/drm/xe/xe_vm_types.h            |   38 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules          |    4 +
>  include/uapi/drm/xe_drm.h                   |   59 +
>  include/uapi/drm/xe_drm_eudebug.h           |  217 ++
>  45 files changed, 5552 insertions(+), 47 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_eudebug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data.c
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data.h
>  create mode 100644 drivers/gpu/drm/xe/xe_debug_data_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_hw.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_vm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_debug.h
>  create mode 100644 include/uapi/drm/xe_drm_eudebug.h
> 

