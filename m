Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BC4D3ABEF
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 08:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF7810E3AB;
	Mon,  8 Dec 2025 08:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="humqKouZ";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010034.outbound.protection.outlook.com [52.101.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB8510E3AB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 08:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOZxKBUBLvSjFpImSmwmxD3h5h+DwP29ydq9IVp1fnZjBMzF/MdU/86SBHi04fr5xgqNKBRk+UGIk0lTcBEVkWOoK+SPunUyeR0eZGquD+0lXS6udjPspfRKYYhuVEImyseMjSrWPsGVPg60e8x7STC9Bu4gQDZH0/ST7CQNB7JlW9Y1KmgAid5Kt9kebnGMsH9edBjcxxX53eoYn4DHrWEOcBPD2qRMOTWiniyh0kNEAqDEdZudUTKfhRD0wZ1PfObU+8nJtyUqQoMQLUz77ucI1dVQT+CXmbRi2Ane6kpmFEf5dzJqqaUk9hIHarRK3oLmXs+hAxZemWXT1yZObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFsVbGTgq6TpJ8TvJ05r+BEkgYru9hdnb1ZujpUd4mc=;
 b=JfNBx1EdjU+2qhHO/J6F6w8VkGpe1k/An/uiDv6IK+pADKdFBbtaopl8HJjLj6vBvQ159y1oBtb36EkjR/aL7EklovSGXJOtJeE9yYXXKkvkrF5tqIVTgFXnuUn2eje7n/TRT+Qh9QAIeZtsTXS43V4ilWbBX0lUtvJAEuug6pmF6s/RHsjNZ8roFde37tkdM3rM4+3YAiU0CYJ0zgg3LnVpq1TwIa9wWllRSpiHgfgnwpc0wlkv4QqICSEX0MqKmiLqoXGVybrfg/dpGo9fy6TnuW5HgeBkMQVjeEXWjO4uVmhtxwhb12Pf5jWqXlsKUA4rj8zGNZ84jiS5j7Z/dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFsVbGTgq6TpJ8TvJ05r+BEkgYru9hdnb1ZujpUd4mc=;
 b=humqKouZC8s0bh049LEw/NfK4fCrT/3OFN6+p2GwxqDvEFSWS1MB2fRGfRWHBcmUH//MTZUgAMymYShMj8NLuAtf86QjtNBiQaw+nuEIeHkL2hDFYdEJwGDoPAOHRakW0vQ0/1kV8VWQn2KjU8USSxnai1yInDje01XF7AftmEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB999081.namprd12.prod.outlook.com (2603:10b6:8:2ff::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 08:49:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 08:49:42 +0000
Message-ID: <656acfd8-fef7-483d-999b-78182c43070d@amd.com>
Date: Mon, 8 Dec 2025 09:49:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Intel Xe GPU Debug Support (eudebug) v4
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, christoph.manszewski@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com, andrzej.hajda@intel.com,
 matthew.auld@intel.com, maciej.patelczyk@intel.com,
 gwan-gyeong.mun@intel.com, Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250808104356.3294210-1-mika.kuoppala@linux.intel.com>
 <49a1024b-a318-446f-8c97-4076fc647fdd@amd.com> <874iq7gbyi.fsf@mkuoppal-desk>
 <176518351640.16441.6158110220097232872@jlahtine-mobl>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <176518351640.16441.6158110220097232872@jlahtine-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0498.namprd03.prod.outlook.com
 (2603:10b6:408:130::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB999081:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9eff6a-ff22-4a58-0ddd-08de3636ba9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUEzTnZpWmVSckxCdVdHSDVMN204dXJ6alQrbEpoR0gyYldSb3VxWHVrZlBU?=
 =?utf-8?B?bXJjRzJzSFhjQXdNMFhUNko1WG95NHJiNG9Ka3RteHJnNnJINDJ1VGFsRDV5?=
 =?utf-8?B?QUlBWVVBNVZnOEM5aVk3dTZPSm9xTzZDeHA5NDY0NjdpbW5aRmMyMWFPZU1u?=
 =?utf-8?B?aUk1ODF2SVFKdUlVNlI2cjE2bWpRQnFkZHZ0aVhJWVpkdTFqUjdBM1JuK3py?=
 =?utf-8?B?aHg1N1FqdE1zZVdpeERnbjJpZytFeXhIbFc5RzNxSE5wUk8xOG4vSXhtcGlV?=
 =?utf-8?B?QjlHTU9rVUllSWlFcXp4WmRSanpCcGNYVlJhS1dGZlJ3aS9td3dHTzg1bE5y?=
 =?utf-8?B?THFmdXE3ZFhSNE9zQVpJODNRazlBS1NBUGlmeDRxYTdZNG83QkwrU2c2Y0Vx?=
 =?utf-8?B?V1U0VytJUzRncFlZVldFYlA1TDJ3RzVJU0VoRDEzaWNBeFREUnFWcnA3MVVv?=
 =?utf-8?B?bEpJZVpjWDNEd2MvTlFxRmVDcXhpVlIzN3BnTEtrZ2Q4MU5rMFJlUE9vV0Uw?=
 =?utf-8?B?SkhqckwzRHdZeHJwNHRncHVTT08rVVJsZDZlMlV5bjNvb3RNbHVBaTUzYXBB?=
 =?utf-8?B?VHF1V1loeHR5R1JVdjBOTWc4ckxNUnpHZ012TDhHbTZVeVJiNzZEcGhmNU9r?=
 =?utf-8?B?T0Z2RHRWMWFudnJXVFdMSG9vajViY1hJUGZPS3VYZVBXL3hrQmtwMEJ3WHd0?=
 =?utf-8?B?UUlKT3NvZVhZY2w5TlF1SVdOdDB4UzQvK05vMVFDeXpJQXlYazZ5NCtmcHMx?=
 =?utf-8?B?TkNvNnAwS3ZzU3NBTXZJYmo2aE5oYWNHTkZUZ1ZENHhJT3RjdmZIb28wS0sy?=
 =?utf-8?B?SUlveHQ2bmJpMXdJOHprMVRpVU5mMlNURXBMOG1pLytBSFZFamxqd25SOGdU?=
 =?utf-8?B?M21DaWVIbVBhRHV0a3RXcm1ybXNhRnVONU1sZ1JYMi8vRjZyV2tVLy9hL3F0?=
 =?utf-8?B?SnBJWXRldEFaTmJLbkFlZWNsS1hpbFpzRENCTTcyQkcwL1FiT3ZmL2kxeEgz?=
 =?utf-8?B?YXB2YzNld3Uxdng4NGpUeHA4UFV6cExnZzcraTdMZ1JRaWx5QjMwbm5hSi9P?=
 =?utf-8?B?VTA1NDRaZUl4U0VFL09LNVV1dGUyN0dXRGVTeG45T2s5UG4vZUQwNlAybUNv?=
 =?utf-8?B?U0FSckFtTlpoM093MTFPdnNPSTNBRkY4eS9uS0gxdFZ0cEZKM0psaWUyNitU?=
 =?utf-8?B?WlFMbm5UWUo3djlRQ2s2SnlabTRzSTl3Zy82ZE5HTVBuVGxKSXgxQVA3Zzkv?=
 =?utf-8?B?eENZYS91MDJodDYyU0loTENPUXYySW4rV2VFS0Nmelo4V2lLYnNGa0lEMGdi?=
 =?utf-8?B?aXVCWW5sRFdLc1VPbE5QdHZ5T2ZSbzk5LzVwR0k0dXlwUm10b05pNnQ1cnVx?=
 =?utf-8?B?TDA0Uzc4OTBDdzRpcmdyT3pMcTZHbm9GKzdva3cwSHhpWmVaTndpT2cvT3Rr?=
 =?utf-8?B?YXMrVWp5S1BNeEtZcDhqTnYrdHpzdEF3UW1sZEloYm5UQWFYQ3JNb3JFU1FI?=
 =?utf-8?B?RTNaUlRmenI4TjlYVUdQUGwxMHdBVW9nck9zWDhnRFVQNWNTVG5kTGE0ZEd6?=
 =?utf-8?B?UHBkU3dVSnRSMHdySHVuYXRpbEdHUlprMlhCS1QrUHFnUFQ1SzNqOFhTOVor?=
 =?utf-8?B?V0tPOGNZSmtDUEdBdVBQd3U4ZmNZUmczVEwrWktnNDlHWXV4L2dhWE5VYW9t?=
 =?utf-8?B?Y1Bkd2c5WG1xeGF3VHYzOEhwMjA0ZGlNSHlqbWozNlRoVXh0RWNhUmJGbWYw?=
 =?utf-8?B?RUQ2b1lpcXB4TVduRlRSbC9zZ2ROVlFjWVd6aWNZNXVWbnR2OEtETnA0STl4?=
 =?utf-8?B?ODFDd2wyTnIveW1sa0hXWmIzaFByaDA2RUl0TXFjOUl4bkNXaE1WWGlSWE9C?=
 =?utf-8?B?SEJXSzZMbkY4VjRheUhQT0JUWDdrcVhaVk9pQXlsdC9DN09nMkMzOWR0R0xq?=
 =?utf-8?B?ejMwWFQ2YUJXbmJjd0htU1dMdW5ZY0ZRWHFhYUphMEpleHprWFFld0VmcGF3?=
 =?utf-8?B?b3gwY25tVVVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0l2clF1NTJ5bFBUTmhyVHY5TDFKdWpjNVVGYnlLdjI1UDdxOWp2VVE5bkRy?=
 =?utf-8?B?YmFWTTNJd09McmRsTkVmeHhOY0xZdjdKcHFIK21kTjd4SlJPYlA4N0hrNFkx?=
 =?utf-8?B?UTZ0OVgxNU1YWkZsa2pYY3I2VHhETTlqTWd1a3FKMFl4TEZXNGJIRGtBVHJJ?=
 =?utf-8?B?Rkk5Um1RQk4wNjhuTm42Ull4Z05MTWM2Y1pWenBhYm05aVgzK3ovcFkyNHJI?=
 =?utf-8?B?MEQ3UUtPaXNQUFkwMnJ5WVJXUncxNFdVMk5tbW13YVcvaHl2cFR3UmxaWDZM?=
 =?utf-8?B?MTg3V05YZWo1QkdTdlZQTDZyWGx5OHVORGNIMmNOQnFpLzl4ekUwWHNWYVd0?=
 =?utf-8?B?czMvNENWaUFBa1k4bk52cTNrWmFjVW9MMTJMWFlxU21LOExlWXNSeGMwYTN5?=
 =?utf-8?B?UFdSekE3UUpLT1ZEeWUrdnNVc1Ixdnl5QWJVbEpVR08rM3dXVGQwOHhQY3E1?=
 =?utf-8?B?cVdtQjFsZ056elpsTWx0N2V2RVVRaHJKdSswWmJVQytYNUJ3YlgxVFVIcUFz?=
 =?utf-8?B?cEowb05sNUdVSkltREh3VmlRYkJwZjFNd2ZrL3NmRDY3cm5Uc09VTzMrVXMr?=
 =?utf-8?B?b2NxZlUyd0FsdDNGRWwxN2FDZzdBQjJPV0dtT25SalpnMnlYWXZmdGl2ZFBB?=
 =?utf-8?B?L21RMnAyRzhpZnUrb1g5eTlVM3RFWEtSbkFJUjFJSTVjczlValUrWGFWaEg3?=
 =?utf-8?B?d3JieDNrYTJQU21oODlvWTBXTUxMVkF0MG1nY0E2NUFRWVlEZ3Rwc2dUc3Qy?=
 =?utf-8?B?NFIvcy9aUGVxNkRyWjVjMDlPVng4TVZ0U1paT2ppWlQ1aXY4ZlZzVmt4dkZY?=
 =?utf-8?B?cnRVMDhFeTBnTmVVeStOa2VWc1BQU1ppekMxVUk2cGMrbWdreXFpb0hQNEh4?=
 =?utf-8?B?cjR2TTZKcmlzNGRzREYxVWdYRXNUUnc2TFRQakl4YStsdjQ3VDdFSmF5d2NN?=
 =?utf-8?B?bE03SExwRk1kK3NQaFNpc3g5NkN5ekFHclZKT2t6QlB4U3VmVGFQNDZVblBk?=
 =?utf-8?B?c25GZkIzZUFNNXZnbFR3VHk4aS9rMmpFR2Zyd2x4a3JqMHVWR0xEUkRuQll1?=
 =?utf-8?B?cG1hRGtaeFo1KzlHN1RwRlIyM1QzajdGeFlKbGhrMzlFd3hTUURFMjlPa3A3?=
 =?utf-8?B?WDBrek5pMllaYVArZzlSajlmRWJ2NEt2UDlPam9sempaekYxeG4ybDExSms0?=
 =?utf-8?B?RGppL0JBMm0yYm5QQTkwZlhIZkEzTkUvWSt4ZDMyeXppOEd0U1BhZVRlb0Ix?=
 =?utf-8?B?OC9SWG16cTlsYjBMNEZVQzBhd3NYdi9PQjdIeTRTZVEyNkhwNUs2Q3hRKzlv?=
 =?utf-8?B?VkhrN3RqTnFOZnBweEczSVJaa3E1RjZPaHdjTmNIcHlCK015T2FrWE1xd28x?=
 =?utf-8?B?aTdjVURUaGhBbkM3a1RKYVhqcytPZWlvajhjLzZCMG14T0xEZ2JkK3BQUFJO?=
 =?utf-8?B?WTRkZkg3NHY3bzlORFJQdjIyc0tzSGlLR2pQZGJtY3BiZWFwUldDZkVQUVJk?=
 =?utf-8?B?cTdrZU5TcEpDK3hTR0hFcGZrR1ZhTTJMcm54dFBzdmlwQVcyQ1Q1dDgwR2Na?=
 =?utf-8?B?ZkZXNDd6Zk5IWDNnOHgzQk8xZkt0V0ppZzhsQzdiRjRyVU44a1BwenZreFlo?=
 =?utf-8?B?eU1wOWR2aExJeTNkUncyMURZanFhejVGWm1tZ3R2bEcwS3FWRWRBNjJGUllk?=
 =?utf-8?B?QWk1cWRWSzk0U0dFUXJqRnM5cnhSUWlxdEY5QzBFNlFTTjRFbythY1pDaUpV?=
 =?utf-8?B?bzVSWURjUVFWeE1COUFYamJqV2svdy80UjlxaTQxZW81L0h3YXJWZ1lhclY4?=
 =?utf-8?B?dCtNblZ3WjlCMlYzWUNQRXBjSk5UTmtTM3FqbFE1WXdmYmhTQkJMODB1VVJ0?=
 =?utf-8?B?dVFINkVsWFlqR1llaHZEaWMxcEtRVGZxSU42c0NLSG9TR3laMktGQnRneU5j?=
 =?utf-8?B?SjBhaXV5OTJINUlTYjlBdHNsYU5mZmlweDdRclA1K3plbXJqS2l1OTA5bk5m?=
 =?utf-8?B?L3k2UElRMjhIYnlZRk04a3daYWRkN2pEYzRQaHJwQUJNVzFSZFdWN2Z3MW9H?=
 =?utf-8?B?U1NaQ045QzNHWW5Xa3dnNnNDT3NnNnVYcVJYUFZOUmNlMnRoeVlZb0hORnZR?=
 =?utf-8?Q?aEIcKzH10atPDbFFeEXfa+E2o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9eff6a-ff22-4a58-0ddd-08de3636ba9e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:49:42.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh+DsUUxinx04laDufdNSD/b6tpYdEgN0wGPXaWr0bPhVSNZSyubqMxhhhgXiPoh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999081
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

On 12/8/25 09:45, Joonas Lahtinen wrote:
> Quoting Mika Kuoppala (2025-12-03 11:18:45)
>> Christian König <christian.koenig@amd.com> writes:
>>> On 08.08.25 12:43, Mika Kuoppala wrote:
> 
> <SNIP>
> 
>>>> #### 2. ELF binaries not held in kernel memory
>>>>
>>>> In v4, debug data is delivered as a VM bind 'OP_ADD_DEBUG_DATA' extension.
>>>> The ELF binaries are no longer stored within the Xe KMD but are instead
>>>> kept in a file. The file path is passed as part of an extension in
>>>> the newly introduced 'OP_ADD_DEBUG_DATA' VM bind operation. Alternatively
>>>> pseudo-paths can be used to annotate special address ranges similar to
>>>> /proc/<pid>/maps.
>>>>
>>>> #### 3. Debug metadata not carried in VMA struct
>>>>
>>>> Instead of attaching debug data to vma created by 'OP_MAP',
>>>> we introduce separate ops for managing the metadata.
>>>> Debug data is no longer held in the VMA struct. xe_vm contains a
>>>> list of all associated debug data.
>>>
>>> I need to take a closer look but that sounds like it takes a big step into the right direction.
>>
>> Encouraged by this positive feedback, we iterated the series further. VM
>> binds state handling has reworked on top of vm_ops, metada and ufence
>> handling improved and we added pagefaults on top.
>>
>> v6 series can be found here:
>> https://lists.freedesktop.org/archives/intel-xe/2025-December/106405.html
> 
> Christian, would it be possible for you to take a quick look before the
> holiday season? Would be very much appreciated.

I'm just back from a week of sick leave today (stupid flu season) and drowning in work.

But from a ten mile high view it looks sane to me now.

> 
> That way we could start polishing the documentation etc. assuming we
> still agree on the direction. At least from our viewpoint, we're running
> short of ideas where to simplify or improve on the implementation.
> 
> The page-faults are the freshest piece of the code, however it is rather
> well separated patches, so would be great if as a minimum the foundational
> patches before them could be agreed upon initially.

The only requirement I have is that you don't mix page faults, single step debugging and dma_fences for graphics contexts, but you already knew that.

In other words as long as you make sure that you can't attach a debugger to a process which does graphics rendering and uses dma_fences for that everything should be fine from my side.

Regards,
Christian.

> 
> Best Regards, Joonas
> 
>> Thanks,
>> -Mika

