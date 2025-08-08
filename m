Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D53AC87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 12:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92FE10E1AF;
	Fri,  8 Aug 2025 12:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xfSJ2lYX";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE8D10E1AF
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 12:26:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwFeWpi54R2wlvauxz764xUggiE7J6MAAij8KuJcpaVDB95Rz9RDJAvkXP8MCMknpbFQz13xkAnTsK8fLQBw3+9GNN+rtkWhynup+o0HkasUqx38CmNJ+32OREKhfoPN3LvSj6gKAc/2akQLn523BqXGQftaLkMZ/SeJdWl1GAf1YWqleQbid8bYmtGpCslmeITAbKa1eWtuH/a/8AGbu+vyKvTXi1XGoZ7FnhbtqsdRdYBMt7En1yXEdgQnnD0DY3rpsLm3dhZ3h24hbgsAoKPOPf3AktRJR1D4yxD6b/cKnhnKPf1Tr2IwjVL6DMQJDSwSxPnTCWIhnZcJKd67Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JNKi36alGf54XH6Ybj06iZydLIrlA/D0EHxbxPR77Q=;
 b=dKg+00xVrlO/NnzSpXnsA2Q5cQvQktgs+s3nlN5zbOq6/YbZ5/G1j9eJgZiVht3zLgb5CcoWMJ5+ihKiz0RJhyyCzkP68e+4BtuXETcw+8pMjGikLy8zsETz+iX9xT0Y6K3WNpG0DnahM199YuoBGH4YahVqyVZ9v7CoKMXG45rdGmJ30WYnlOcYZIC8slm76MsyySKT1j7RUXNiN8ll1fAq/9bGxAR4jQNLD3/9q1avX2VQziYkgxWXUlRQfkRHB6XWYZlhWpipUOv8IWKTHRGL8SSwuHn+4gQedSuHvXnKJulr5q1u1NP2gWlA4V001Xfq0hj9ThXeOPJysbRJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JNKi36alGf54XH6Ybj06iZydLIrlA/D0EHxbxPR77Q=;
 b=xfSJ2lYXAfv+czVwnKh4L5RaR5M/Jm9H8OgipTnfRYdZ++wl0qtdPT6HSb1lkfyVJu3V7JFph72RlWK+QfeoibRW7YARdfy5ltomYXR0r1XfY02HYlLx8sP70e8C9/oNqiXhTa3QwkSLypkk/Qtrz7DMxDVBxOS1VpszM4adLjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 12:26:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 12:26:18 +0000
Message-ID: <e95f06ab-1942-46a7-b3fd-622b033c9acb@amd.com>
Date: Fri, 8 Aug 2025 14:26:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] drm/xe: Add xe_client_debugfs and introduce
 debug_data file
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 christoph.manszewski@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 "Khatri, Sunil" <Sunil.Khatri@amd.com>
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
 <20250808104356.3294210-17-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250808104356.3294210-17-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0279.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9024:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fac6cb3-3e5d-45f2-171f-08ddd676c65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFdyallPdndBaXJHeXozR3dtdFpobHRMdUNlT0Q0UWcwWm40ZnA5eWNPeDhV?=
 =?utf-8?B?Z2R1bXFzZitkWUJFRDhqeHZJZ2h3ZXo2ZGRNRnAyKy9PcUtZRnBBenVTVjEz?=
 =?utf-8?B?ck9sYkIyaEowQTdsbVFkeUt1OFBQL083RjNKU3ZVaUJjL3BTMEQ0WFdUek5F?=
 =?utf-8?B?VWJKSXpsSHFVcDRqZEJOS0VUVkFkNHhwNWJEVzRRYU5XbXdYMUpodWlSZFRy?=
 =?utf-8?B?VTRVbGx0NTN6MUtDZWYweHBkTTVBTmZOVEFlM01ndllVMC9ZelhEMnFIWDBj?=
 =?utf-8?B?ek1vSkRFeDVSNVNBYVJFY3N4TW9sZHA0djFVWlNyREtvN01sVFgzRzZUcmRh?=
 =?utf-8?B?VnVoV3RlZzJlNWN0a0VVM2t4bGVqMUx5ZW1wVUFHT3l5cG5KV2hpNkZXbURL?=
 =?utf-8?B?Y2RLMGpvQVFZWnEwcDlveDRFRTh6azdlUyt6cUtFRjFUdExVeWd0VVdaZC9K?=
 =?utf-8?B?ZUtsclZJOG11NTlrWjVWZVVNRWlkT3ZiQktFQkw1M3BSaDFVeFNRZmlQNVpq?=
 =?utf-8?B?Y2lPa21lV3dObUVWZ3lGc1FmNzErZDNBSENhZ0pZd3VHU09XZFp3Q0N4d0I2?=
 =?utf-8?B?NFdaVitaZnpTeDRFcHcwdXBhV3pUODB4UTVXOVdQaVQ1SDMwWVE4U0pqdWdt?=
 =?utf-8?B?Q1EyN3dPT1p2emRiQWE0WGhaQXdwWkxTNkhOYy94aUsrMzZ3TVVwdEQ1djdH?=
 =?utf-8?B?cllJY25VUDI0OHpmdGtsejNJMGFkOE53UUdONWpBd3lsVDMvRUVQZTRYTkdj?=
 =?utf-8?B?VWtVRGZDS1prK0dOSU9yZkNDY3V0ZXc3VmJZOWIxeXh0VXQrWDVLL3p3SmlH?=
 =?utf-8?B?T0k3Vks5d3ozd1cwVE05akJZK0hMMnMzeFFDaUZ1VlBBVUkxOXNjd3poQXpx?=
 =?utf-8?B?bG9MUUhrMUpUU0FuYUN2dXlSOVhmODVwR2t5TTF5cWJveWlYRlRSWjMwczNS?=
 =?utf-8?B?dWlnYXg3ZWhLeWI4RzBrVW5JbVk5UFpQVEpHYktQOXNLZXBoZFFmdmtIczhz?=
 =?utf-8?B?TXZRUUt5dXNtS051WTVZTWFNM01iUTJlNjlVR0tUVFhyYkd4Vk8vSk9EYW12?=
 =?utf-8?B?dWg2ZFNoWnBycGJsUlBXMU5yK004Y2tPK2dZR1BCRzZqY3V3ejI4OEhHUHl6?=
 =?utf-8?B?TkpMUUdVQmRlUG1aSUIyZytncHczRFl1UWkrNnhzNGNMWjQ5RFg3Wlg0OFlL?=
 =?utf-8?B?bjJqUTl0MkZmcnJFcVlEaE9HVVkvMmZNbkdyamdhWUFWbldQQjlXeC96WTNx?=
 =?utf-8?B?ZHNWZmNHNEc5OC83eU9zSjB3RXR4ZmE1dUVaY1VqWFI2bXROL29wSGMvd3NG?=
 =?utf-8?B?MFdLMGpUcUd1cWZNU29UUkpKOGNSd1N0c29WcE9tcXkveHFTd1l2SE1LNURz?=
 =?utf-8?B?WkFPZjRZTnQ1ekZVaFNLRXZlTSs3dWxNRitCYmNPTUZXYUlTbWFmVWFxbHE4?=
 =?utf-8?B?bXpWeFN3R1dpNU5zeHlOc2ZtaHIrbkpBMFN4QzAra0luMms4bFdIeDV1WWN3?=
 =?utf-8?B?cUJvdmU3T0E1QlBPenYrQnlCUGIzcFRIOThSZy9xN21DV1ltWVlpeWZYbWFz?=
 =?utf-8?B?Lzd6TGd0MUt2V0tka2p2Y1dnZmJUSkVJZjcxK2pYMVo1WWtPM256c0ZkdFdW?=
 =?utf-8?B?c29tY2FTUm9oZ3EzcmtXbTF2amhFeWg0UE91M2E2Q2prMENMZ2JXeFFYdnp2?=
 =?utf-8?B?cmcrSmtGRVExeEhJajhlZXB1L0tkdFFjd1JYazdGbjNuclZMTTdoaHd4aCtV?=
 =?utf-8?B?R090b3hKS0NsRzB1L3FRY1MzWkpkVVBnOUF3NTNrTDB4N3g2WTNtMzVqVFNk?=
 =?utf-8?B?RVZxTFYzUmxGbTR6WXRodFdqTTY1djhNYXRwalZVOFRUTmxHa3JjSEpUWTdJ?=
 =?utf-8?B?RnhOOGRaZVBJVWxYV1EyclB2NlVEeXdDaWo4ZU55K2w5T0JBa1p0bEF6dk5q?=
 =?utf-8?Q?deDzF8ZcTcI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1lyM09lSUZjcTFUd0FrQ0ZSZVFVelRoQ1FVSjVzRnp3MnRGZ2I4TU8xYmhk?=
 =?utf-8?B?eHN4TzROaGhCdkIwYUxOVzk3dzg3aEU4eUE2aHdPSlk2U0krRklNNTFFTE0z?=
 =?utf-8?B?RHhkdU8vWE1zeTNQdTRaU2I4bk4rY2JRY25RWC9XRnFXNm80VW5sT1Axd1gv?=
 =?utf-8?B?K0RmSzlrbVI0SmFzdGVwSDJxQ0ZiRHRZQ09OMW5aTmI5MmM3bmJrbjZSOS9q?=
 =?utf-8?B?cnpjQnJYWU5EdG1MdVpFYUZxQUMvNm9ycktxNWZsV3dKZDVDZEhLdmpjV1NO?=
 =?utf-8?B?UU55QUJOcFFTOTNRWWxvU0Z5b1lYQ0hTYlZRblZVYldOVms5djZLdVZXc0VM?=
 =?utf-8?B?WkxOL2RSWHlFR2dLYm5YWi9pdFNsaEJUR241STdzNnhaZm10ZFJBUUdHaDEw?=
 =?utf-8?B?TkozQjRzOUV4WGZiQXVNV3o5cWd4Q0NZbGJid3BOU2NJVEpzY1dxVXViOGZz?=
 =?utf-8?B?WlBNck1CajJPeVhTNzV0RDJ0S256ZTVNMG5EaGFPOC9wL3hvYWU2RFU3U1Zp?=
 =?utf-8?B?cGtvbTZsQ1BQZDRnS1d0Ni9nT0QydW9YWGF5NWJhUktVdXp4bmdFd2xXdi9x?=
 =?utf-8?B?VC9pclVYZ3ppek41R2JvWUFGTTdPSjc4bDVqU2IvZ3dqSldTK01lZXdrY1dX?=
 =?utf-8?B?c0FCNm9JS3FFbEpydkJINjVYODdFNmJpMHpPdU52MHUvM0NHUHVQakVhZm1w?=
 =?utf-8?B?bkVWRjN4eTYrT2RicE53MndhY3o1bE53WlBZKzJXNFVBN1YrZW1mMTBXazhT?=
 =?utf-8?B?aGdLKzE2WkR1cEdwT0FCdDdDQmhnZ2pNNU45NDQ1dEJ5Q01FcFpLWHRQR3l4?=
 =?utf-8?B?dTM1L0NhSWZHMUwrNlhFTVZ4S3BleHd0VUMvS0VqZDAvUWNHUXBSL1Q5TDdH?=
 =?utf-8?B?L203U1F4RzBkWnBwcmR5d1hBQW5KZDNLVkJVV0NacGN6ckt0YkN6Q3pIaVY3?=
 =?utf-8?B?UTZtakV0RlhBMjRvL2dRaHdVNk1TTWpUdml1WGNJNTdjRXNnMDBqZWNnK1Va?=
 =?utf-8?B?SFpDa3pybC8rbWtOVWFKd1BYbFlBYWpST3E1dmdJK3VBY281bEI4TnhGZWl3?=
 =?utf-8?B?cXJxR2lmUys3QTdLeXJlN2txd2dqbThkMTAraVBZWVpvSCs0TmZCakpaVTR6?=
 =?utf-8?B?ZVlhYzdQV3hXODlva00wSDhrN0dyeURQanQzQnYwMkVGc004SVRiRFNod2Z5?=
 =?utf-8?B?SU1ZVHZkM0hreExnOHdzbWdoYnN0ekZncHdqT0JlT29kc1l1S1pST3QzN1NO?=
 =?utf-8?B?SVdjTHAvaWZsYmRNd2tYdTRhVXRqVXNUZHFMcXZ2ejZJcURmUXUzaXRmZXFD?=
 =?utf-8?B?N0NPdVV4eXA4SGlRWUE1eEFMZXRQUkQ3L2FBOUI4NTU2SUF1REdWdHJLZ3hY?=
 =?utf-8?B?Qk5vYzN2QXFNMzkwQVVsR2tUMHVaby92K2dnZzc4YkRneWc1UzlsTGRZdWxB?=
 =?utf-8?B?eFdiaVNpZnVGWGNOU2xBYy9OR0xpSjI0cjFhTldkVDlteDh4QjYvTHRyS2FY?=
 =?utf-8?B?ai8wcnlwdy9RTVgxUzg4NWdpYUQvdzJzOVNhMmFORGg5UldNVm8xNU93LzVZ?=
 =?utf-8?B?Z0FDSW5kMitqM2h2YlBBMWY4MzVqbDRCaXNaYmc2eDZORXlES2VzOERXQklp?=
 =?utf-8?B?c055MXFSU05LcWx2VFI1bFhPTXVFdWJoaDRCdWtlNlpHVU9Kd2ZwYTZLbFow?=
 =?utf-8?B?dTJhTlcwK1hvL09OVXk1NTAwQlJvNHpBRjdpU3J3YW81OEJsSVBNSHBYYnFZ?=
 =?utf-8?B?MUxIa1hBZFQ2MlgxbUoxT0tpNE0zYjNyWjBtbi9ScS9VMncza3NWeXdseGE5?=
 =?utf-8?B?c1haUXNYS2JvMGZ4aERnb1dmcWhTL3NwK0xsazIwOGF0d2IvbDdUYllVdTI0?=
 =?utf-8?B?RWJSTFlLZzhxNGtrNko1UnBCR2dSUHhJWm0wZGxCSks5eEtNU0Iwc2ZkRUtJ?=
 =?utf-8?B?SVhVdDgweUF2YVZoK1dJSjFyd2pWODgxSUVQeHpEb2xEcUQrNlJ0UnVWc2JT?=
 =?utf-8?B?L1JYWXlrQTFSMENYelo4cjZkdnhiVnBZM0J3L25UVkRGOUNuNk9OWEFSeVZq?=
 =?utf-8?B?NFNkN2NSa0Z3SUt4RE4wOXB2bFIzdGFjeXM1NHlMZjd1NnJacUNqZHFoUkVE?=
 =?utf-8?Q?5ADQ+NhnLFy3zGjgWCVFyIatH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fac6cb3-3e5d-45f2-171f-08ddd676c65a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 12:26:18.2444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nyGwblXcBdd5cUsS1O37JVAl+tWZise9qlIutrlhaQHX+XDxVlYnyJa4C0uWrg8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024
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
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Create a debug_data file for each xe file/client which is supposed to
> list all mapped debug data and attempts to mimic '/proc/pid/maps'.
> Each line represents a single mapping and has the following format:
> 
>   <vm id> <begin>-<end> <flags> <offset> <pathname>
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

Please make sure to CC Sunil on that stuff as well since he created the per client debugfs stuff.

The patch itself looks completely sane to me.

Regards,
Christian.

> ---
>  drivers/gpu/drm/xe/Makefile            |   3 +-
>  drivers/gpu/drm/xe/xe_client_debugfs.c | 118 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_client_debugfs.h |  19 ++++
>  drivers/gpu/drm/xe/xe_device.c         |   3 +
>  4 files changed, 142 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_client_debugfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b932a9e70284..c1d8068d2a97 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -319,7 +319,8 @@ ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
>  endif
>  
>  ifeq ($(CONFIG_DEBUG_FS),y)
> -	xe-y += xe_debugfs.o \
> +	xe-y += xe_client_debugfs.o \
> +		xe_debugfs.o \
>  		xe_gt_debugfs.o \
>  		xe_gt_sriov_vf_debugfs.o \
>  		xe_gt_stats.o \
> diff --git a/drivers/gpu/drm/xe/xe_client_debugfs.c b/drivers/gpu/drm/xe/xe_client_debugfs.c
> new file mode 100644
> index 000000000000..0b952038e698
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_client_debugfs.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_client_debugfs.h"
> +
> +#include <linux/debugfs.h>
> +
> +#include "xe_debug_data.h"
> +#include "xe_debug_data_types.h"
> +#include "xe_device_types.h"
> +#include "xe_vm_types.h"
> +
> +#define MAX_LINE_LEN (64 + PATH_MAX)
> +
> +static ssize_t debug_data_read(struct file *file, char __user *buf, size_t count,
> +			       loff_t *ppos)
> +{
> +	struct xe_debug_data *dd;
> +	unsigned long vm_index;
> +	const char *path;
> +	char *kbuf;
> +	struct xe_vm *vm;
> +
> +	struct xe_file *xef = file->private_data;
> +	ssize_t total = 0;
> +	loff_t pos = 0;
> +
> +	if (!xef || !buf)
> +		return -EINVAL;
> +
> +	kbuf = kmalloc(MAX_LINE_LEN, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
> +
> +	mutex_lock(&xef->vm.lock);
> +
> +	xa_for_each(&xef->vm.xa, vm_index, vm) {
> +		mutex_lock(&vm->debug_data.lock);
> +		list_for_each_entry(dd, &vm->debug_data.list, link) {
> +			int len;
> +
> +			path = dd->flags & DRM_XE_VM_BIND_DEBUG_DATA_FLAG_PSEUDO ?
> +				xe_debug_data_pseudo_path_to_string(dd->pseudopath) :
> +				dd->pathname;
> +
> +			/* Format: <vm id> <begin>-<end> <flags> <offset> <pathname> */
> +			len = snprintf(kbuf, MAX_LINE_LEN, "%lu 0x%llx-0x%llx 0x%llx 0x%x\t%s\n",
> +				vm_index,
> +				dd->addr,
> +				dd->addr + dd->range,
> +				dd->flags,
> +				dd->offset,
> +				path);
> +
> +			if (pos + len <= *ppos) {
> +				pos += len;
> +				continue;
> +			}
> +
> +			if (pos < *ppos) {
> +				const int skip = *ppos - pos;
> +
> +				len -= skip;
> +				memmove(kbuf, kbuf + skip, len);
> +				pos = *ppos;
> +			}
> +
> +			if (total + len > count)
> +				len = count - total;
> +
> +			if (copy_to_user(buf + total, kbuf, len)) {
> +				mutex_unlock(&vm->debug_data.lock);
> +				mutex_unlock(&xef->vm.lock);
> +				kfree(kbuf);
> +				return -EFAULT;
> +			}
> +
> +			total += len;
> +			pos += len;
> +
> +			if (total >= count) {
> +				mutex_unlock(&vm->debug_data.lock);
> +				mutex_unlock(&xef->vm.lock);
> +				kfree(kbuf);
> +				*ppos = pos;
> +				return total;
> +			}
> +		}
> +		mutex_unlock(&vm->debug_data.lock);
> +	}
> +
> +	mutex_unlock(&xef->vm.lock);
> +	kfree(kbuf);
> +	*ppos = pos;
> +	return total;
> +}
> +
> +static int debug_data_open(struct inode *inode, struct file *file)
> +{
> +	struct xe_file *xef = inode->i_private;
> +
> +	file->private_data = xef;
> +	return 0;
> +}
> +
> +static const struct file_operations maps_fops = {
> +	.owner = THIS_MODULE,
> +	.open = debug_data_open,
> +	.read = debug_data_read,
> +	.llseek = default_llseek,
> +};
> +
> +void xe_client_debugfs_register(struct xe_file *xef)
> +{
> +	debugfs_create_file("debug_data", 0444, xef->drm->debugfs_client, xef, &maps_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_client_debugfs.h b/drivers/gpu/drm/xe/xe_client_debugfs.h
> new file mode 100644
> index 000000000000..9eace15c0a49
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_client_debugfs.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_CLIENT_DEBUGFS_H_
> +#define _XE_CLIENT_DEBUGFS_H_
> +
> +#include <linux/debugfs.h>
> +
> +struct xe_file;
> +
> +#ifdef CONFIG_DEBUG_FS
> +void xe_client_debugfs_register(struct xe_file *xef);
> +#else
> +static inline void xe_client_debugfs_register(struct xe_file *xef) { }
> +#endif
> +
> +#endif // _XE_CLIENT_DEBUGFS_H_
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0249fb4aa966..af9c98a4f3a3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -24,6 +24,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
> +#include "xe_client_debugfs.h"
>  #include "xe_debugfs.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device_sysfs.h"
> @@ -117,6 +118,8 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  		put_task_struct(task);
>  	}
>  
> +	xe_client_debugfs_register(xef);
> +
>  	return 0;
>  }
>  

