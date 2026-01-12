Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046A8D2502E
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 01:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BC610E0A5;
	Mon, 12 Jan 2026 01:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dRyf8pN5";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D6110E0A5
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 01:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5oFHvavUIG57zZrp7ekrlURQx2UErppLFsiRBxvvLQY3va1V2in9bR6uI+cw2PzcuFfWCfi++6L6JhCVBowqD3WPFTD3TyyR+XfKCJrLb+0pnvURQRJJcrM9GiKW+wWBOi+Y+pou8+ALL1vFJeIwDyrqHsyuIxFKaQAuylm1Ho09hLFASejyaPoQNdQSqWdMmPrOOwyfPFFs54M5KpkNrHEum765P8I7aIQaNwYR/k9IPgrmFSO4uvqQRItSTmzObQlUTUSoxIwtQV/A1WkifvKcaiBezT2VJjk7eSI76vCupoL6zL//KVb9AjeWBO8RAU+yaPE4FnoqV7sLs67+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjaSNIbnSBbAKUP128DfvHBtoLfkFJFpJg3mDCl1IHM=;
 b=MxLnRobf+ZGTv14hN2bDENbtE4f5qHXMH+Pto/afhpfJoVJOXBj2GBX195MoIEz/ePwXzeR/zs2a9A5VZCqqxspd7LT21b2KEaNpylSpFPDlexif7hiMzoL4ZCcZv55zdSWq3au7RLsw+edTvOUj+Hf718Ddaleuq+Er8CYP5PT+bEgQ+tv6pn0kM0maiHlEpY39bPFn4SPcRwzKCTSW3XsvqS44wrYjIeqq1vC2P/sZ7/DguopxbCY647ID631dk9YWUMxJZgru8alUs5r4vylJyuRe7ouu+vYn/fd5zRpEjXXDyhb3WJRDb0cRJHtMWl1XFIiRKyC31Il+BEfVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjaSNIbnSBbAKUP128DfvHBtoLfkFJFpJg3mDCl1IHM=;
 b=dRyf8pN5MSQ+pqI9NqYuAv5DtvTGUh2esVN3K1etVWhBqKyQpSDT3tRDXXlxzBbUUTOYN06KovQWN5jyZ46l5lXTFpLFqXNf3pex9nQmf9xN0y29f2rGuOP0zD/iSlWwZNqslKy/HI3nhhi/a2BQN4yjFI91Dj8a483V+BgT0cP6rx0FS1gMMuLJJgGPW3T12NEA0ZWNENGjwBvHHCWOf/NzLc1VR4TBe3YCkHQ2V+lFIQ3pplbG+j3lLW+SkvX0Yz2f2B2l9yUzHbcZa2upOPhFWhjDhac0IP1XHNiv0H1a8dCqpfyupon1pEp6C8uWQXK/SwyQkz1gyRqaaGHd1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 01:05:26 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 01:05:25 +0000
Message-ID: <669c9fb2-a64c-475a-acfe-2a49ff12d8bf@nvidia.com>
Date: Mon, 12 Jan 2026 12:05:21 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RESENDv2 v2 07/11] mm: Add a new swap type for migration entries
 of device private pages
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com
References: <20260108060102.41357-1-jniethe@nvidia.com>
 <20260108060102.41357-8-jniethe@nvidia.com>
 <ed99b6b6-f722-470d-a40e-dddfcc9ae585@lucifer.local>
 <8bf680f0-94ed-4614-9ace-a081a6558460@nvidia.com>
 <7b46131e-de14-40a9-be73-25855bb73ed0@lucifer.local>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <7b46131e-de14-40a9-be73-25855bb73ed0@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:74::37) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: de1dc7bf-0216-4ba4-b630-08de5176ab73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1Axcy8xU1QvNlBHU0JLWlFaRFN2KzYvd29sRitXalNuakhsaDRvbndid0d6?=
 =?utf-8?B?Z0MyODRPMzBTbFVCR3lkOHF4RE40RGpiZlRnVFFJMHF5YXY1NSsyMmc0VXF0?=
 =?utf-8?B?UUxFMGxWdWYyTm5WUFJjdlVhQ3k5eC9mWlRzeExpMkd3Y01HOEdieGlwaFh4?=
 =?utf-8?B?bDBNa0Z2U1grR1hzMGFCeXNxRnlna0s2Z3BTMC9RbEhKSGFJNUNCak5Tamlz?=
 =?utf-8?B?eUhlUmFCdUFyZWtyL3Fqdi9wMnJ1UXN6RWRaMEFLeVp0bHNxNFJPeHlEU283?=
 =?utf-8?B?WHhkcEZUZGdsbjJWVDQ0allmcmJnYS9zenZWT0hSR0RmVWJHVGVJVGJxSkZ5?=
 =?utf-8?B?bE9kZ1RTUjZYaklQN2Q1WFlteXhMNHljSzNQZ0hzUWROSnZ0VS9QRXhEWTNv?=
 =?utf-8?B?WUE4ODNMRGhsOGR3LzkrOUlSbWZhK254RGwxblRHajZKd2FuNE9YK1A1MVZr?=
 =?utf-8?B?ZHh3dTJVdGx4Tzlna1liSTFCbzBHYm1oYm1oOFdOUzViYy9odG1qZS9TY0xr?=
 =?utf-8?B?WkNsZUVoZXp1UnA3UzhyZm11WjgzN2JmaHFoRHBkNVZURkRFeGJ4NVpkTlZo?=
 =?utf-8?B?SU1kTUpEcFRCRVJoWk5WQTNJQ2N3dFlaSWgyc0NIUjdSQ0ExSUtTcjJkVGN4?=
 =?utf-8?B?NUpuLy8rekJaV0taQU1lSHVPUC9HN3FpYThaTmQ1T2RSQWpzV053akVSQ3hW?=
 =?utf-8?B?QXR0bTE4RUVNTk9WK2N3ZDFTeTN6YU1NTVhOVng5V1hwdk84ajFKSEtkS2d0?=
 =?utf-8?B?N3NIa2ZVd0Y2ZkQ0TUs2czNmQTBidExaM3NIbERzOWVMSi9YcE5nRitBMFcr?=
 =?utf-8?B?SjJXdzMzdlFXOEh0VVY1SHhIWlUvL3JTeXdUb1g2Q1gwWS9TN3ltQ3hrWkV2?=
 =?utf-8?B?QktrNE94UHplZlZMUkhMRVVUUmFRcjQrdUFnWWZNOVRVOXFTQm9ucDFwd0pF?=
 =?utf-8?B?Zzh4TG5WTlVDYkhyTVN3NXFLdnc3eGVTYTN5Z1BFdXEyQmd0TktTT0FnelJM?=
 =?utf-8?B?bXVhNzh2bjg2S0lXNTJkOTdtNWJVak85WkFsSmtsM2pNRndIRjNYc0toYmdx?=
 =?utf-8?B?TnIxNXk4UmJxbEpBRUhEVzMyNWtwMlpnbTdKdU1lYmlTZWRNSWFmdWJBY1Nl?=
 =?utf-8?B?UlFqbEJRaitLY1FrdVl2bWsvYk56dER6UmRaNlBRcDI5WkdwaVFjQVlXOGd2?=
 =?utf-8?B?T0pqUU13UkNId2E0ck1ST2J3bEIzUDMwTEZOSktGVGxkS0ROWEZKU2FZNDZm?=
 =?utf-8?B?R3ZPN05kMmw1QU83U2luVGJtQnVaZDFXK2x3RTlYUHFqUXdFRWpNSlN0YVFj?=
 =?utf-8?B?N3VPTUI0RFRNSXFxSFhVa0pCbWlzNDhOS3pHUDJrb09XOWFya1R0RkZQaWpa?=
 =?utf-8?B?a1FMNzQvQXF4ZnJlNlBpSHhTTzZ3U2YyOUx4N28wUXZCSnlKODFYemRXQzBB?=
 =?utf-8?B?a21vMXZGYkNUWExKdGc4aFFXOUxmakVKTlpKU3N4ZDg4OGQ2dkE1OVhJbkc2?=
 =?utf-8?B?Ujh1YW5BOE5OOHlDMU9iV0RHbGlGYk94YlVLTE1EcitGTUl3V0xzbmxoSzBz?=
 =?utf-8?B?SEYvRWJYbHFEREEzRXFJMmh1SzVNaGZhVTB3YUlqdEJKVmNreEdIN0NYbzgz?=
 =?utf-8?B?RVdqUm1jamxEUVNONTN5M2Z3alNOd2xFeG9veU5GYmt2T1JpMU1iYXJLazNz?=
 =?utf-8?B?S2J4MDRHTkdoRHFWZ3dwMGZwTlRseStFbnBWNkZRRzg1NCtVVzQ1NU9GTy9N?=
 =?utf-8?B?bCtxc1JXNG8yS0hkN0x5eTRySjhNMUxRVm5IR1daNk5jU2w1Slp2NjI1ZTFj?=
 =?utf-8?B?YWRkMnBhSlo0TDVQRTM1QnR4RThoT0xpRWN0T0VsaUFFeXdMSW45VjVYN1d5?=
 =?utf-8?B?M004M1lHNVNlYlFsRUN1MGlkOEpDdjgyVHY3UzF2M1JyS1YzLy9wSmlKb3lu?=
 =?utf-8?B?ekFyZnUvZFRtSXg2NnNYbkRRcmlza3UyR1ZlZ3d0Z2c0L2pYem9qWXp3Ykg0?=
 =?utf-8?B?djVhYjVZMHdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UExEZzJqT01OcFc3d3ZxYzMwdDlvbGxtL3BMMXZWRjYzSmZNWWNVcU50YjYy?=
 =?utf-8?B?a3lKR2kzd1UwNzNnSUJVQ3Z0bEpnRTRoalpINjYvUUlvQjcyR1RIQnYwL1RP?=
 =?utf-8?B?TDRheTRxakpCU3M4dSswZ3lFc0lvNStVUFlXN3JBL3QyTUQxSUxuQ1VVWUh2?=
 =?utf-8?B?ZVZ1dkk2V1R1ZHE4R3dyUjBBZ1d5Uk13eXlSRHE1ek5hOElSYllpazdOVzVs?=
 =?utf-8?B?Ujc4UlJBZnQxbmVRV1hzTStRNmp1dlI0V1NYTjNFY2JUR1k0dnIwWFgyQm9N?=
 =?utf-8?B?VFpzZXN4Q3JXQ2tUUlVUVVVySWdvNUVhOG5Qa0dySXJ3T2p5bG9pUDYxZDFj?=
 =?utf-8?B?VkRNdndTekxETUVlQitGdzdBRkpzZWdxcG0wWFp1NVg1WjVXTjhiSW5aeXQ4?=
 =?utf-8?B?M3N0cnFrN2pLRXZEUDRFSk9NKzlNQlhmc3g4L3B1QzJOZXkyS25mYUpqMVVB?=
 =?utf-8?B?bktZTW1GOG4wQ25HQlFtMTJnOGZtN0hqVlE4NXZ0L0Q1WXk2R0l6cHhmYlVv?=
 =?utf-8?B?dlJnc2FUMFdCTm5CbkdmRnlaOUZUb05oVzB4YWh0OHJLVDBhY1VYSlZxVnZJ?=
 =?utf-8?B?R1h0cDhZaHBFd2FMQlkwRndwOVFvaDdSYWxteFdDanlXV0RETmV3K1oxSHVF?=
 =?utf-8?B?VlRkSTNrSFBodTlRdjVaY2ZGTTJzQVZDTDV2c0VTc25Iams1ZUltQ0RVNDAr?=
 =?utf-8?B?T1FLSGFXbEpkQm5CS3VaWlBqeW45eVhVZXRvblQ4ajQ1QVBZdVdKT3hWOVY3?=
 =?utf-8?B?UTg5MS95WDRkc1crTk1xa1hzLzhsVldWMklBOVlQNElvY3FKa0U0cldOb281?=
 =?utf-8?B?NG1vQk5JWEZZclhMRFZZY2htTzRHeUw4aUNlTzkwSm53eUlScDVWNUNaSy91?=
 =?utf-8?B?dEhRK1VreGVqcHZrZWVqdEEzZFdzbk9YTGZrNXZON1VqNkhuQ0VBNmYvazd3?=
 =?utf-8?B?eE5GUk00cFg4OGJwVDREbktqVVErbVBBQ2s2Mnd2NzE5STc3ajAySVpLNjhM?=
 =?utf-8?B?RktJMmMvdWoyM3lqQ0wxZm5EWDdRRWw0TnJmWTdHWXlQSWNDRVMvWHhkUkk3?=
 =?utf-8?B?MnRuNEFXUE5FOFFpTklwemF3dVJIbVdjTzdWVWFkM2FSdElxa2dBby9PWEFu?=
 =?utf-8?B?U2RWRDYzYlBodDZRamFZT2ZpYlpzSEo5TGlnZlJHckNsZ09RZ2lrOWVyVHF0?=
 =?utf-8?B?dzhjUnNRQjJYVmtld3JLZFZaKzJWVmUzeHdlV2pKanlDN2ZFeGVlTm96YVNQ?=
 =?utf-8?B?SHcwaThQVzJlQTZGTVorQ3IrZUQ0N2Q4M2FKbFZGOEZnT0lITy8zQlhEN0NE?=
 =?utf-8?B?NjVpaFpuV1RtNmQyeW5kZ2tCazk5ZHI1cnB5aFNCNHhTSnpsVWl0R1NRQ0gx?=
 =?utf-8?B?Y3Y5azBDOUhabjhEeTFyK3lsMDFRUzVBTU9KREVPTFdOUXkwZTNTR0lHQUtL?=
 =?utf-8?B?cmZ4eEZhOXFOeTQ0ZFdUdENvQzR1aEUvT2ZwT21PZXJCajlJa3BBcVpiNU1y?=
 =?utf-8?B?WW9zS2w1cWxWZ2xOT1FwUXFLSngyejRpR29Ec1FmNUpqQ24zSXd1NkZGeXVq?=
 =?utf-8?B?WmpodEFwYWg5Rjc2VStYYzFCZWRqRmlMSkdnVnI2M0xPK1BjaUVQU1Z4YXdO?=
 =?utf-8?B?YnJuUlE4SlVPcHZRTERlVVVNRnZnT3RLbXFMdkdZcnI1RW5jYStJMzJ4T3BV?=
 =?utf-8?B?WkpDN1hmQUh5WjZ6bm01V2NJcy9jbXdBWFVNdXJQWU1WTG05RFpud1NiajE2?=
 =?utf-8?B?d1U0UHF3cEhLNGp2SmdCSmh1REhnaERVamlCWW82RjJpR3A2NVRaR1dvKzNM?=
 =?utf-8?B?aTBLQlhJUDFua3hhRDltZjNpUjdYaDdIMnA0ZHc1eHdKTU9IYXZXVWYvM2xp?=
 =?utf-8?B?VitQZG1nSEJxN3B6YzFQdk5JR210SlNlVGlMVUR4ckJxQWVoRmduWk14NCsx?=
 =?utf-8?B?SlNPUys2cERLWVlTQjFuYzk0WS9aNEhENEpMbVBxVEFEd2d2L3FVM3JEUDB0?=
 =?utf-8?B?bDAxcGhvcDkrT09LYTloR3F6YzV0VkkwYk0rRTNRZ2oxekdOaWxQcHoxczlZ?=
 =?utf-8?B?MVdnejZwbW95U1VEcFM0TVlOUStabHZWYVhINllDZkcxUzB4OVlzN2pVZkNq?=
 =?utf-8?B?VVdjRzVLZ1o4Ni9TSWpxbWZVZzNUZm9aNzBrOVFCV1dnb05HMFhhWU16ZzB2?=
 =?utf-8?B?NUErSkp0VFhMWHlSQ0dNUEl1MW9hK05YMFJzOU10NFZTMENXRHRmWFJnaGJk?=
 =?utf-8?B?bmE0SHJwbU9aVGljaGVLQzFCSUI4QlpKYmVmMzh4cFhkQWxSZnBoUDh2bTd5?=
 =?utf-8?B?RlJhbkgzNWprVjRSaU1mcDhQRldYbnZIMUhybEpKY1NhTEFqN3FLZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1dc7bf-0216-4ba4-b630-08de5176ab73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 01:05:25.9324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ij0j40YxvtJWGoFnNx2CYBWLL90r41gsGfr6mruzFtQlbUOpxwsaeJJRljFQtTO7wMLXDs0xgu2HoukUjLk6eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505
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

Hi,

On 9/1/26 22:32, Lorenzo Stoakes wrote:
> Hey Jordan,
> 
> Thanks for the feedback to the feedback :P but can you re-send this
> replying on the thread to everybody?
> 
> As it's important for all participants to see the back and forth.

Yes sorry this resend series was just to try and get the intel-xe CI 
running.

Copied the discussion back to the main thread:

https://lore.kernel.org/all/375f5d20-7c15-4f8e-a9cd-c58e3e398c62@nvidia.com/

Thanks,
Jordan.

> 
> Cheers, Lorenzo
> 
