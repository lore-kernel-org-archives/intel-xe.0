Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB713D232C7
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 23:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CE110E7D3;
	Thu,  8 Jan 2026 23:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WX/4E5Ar";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013006.outbound.protection.outlook.com
 [40.93.201.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2940F10E7D3
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 23:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRx5xaFzIktRZObm9GeD4/OQHfJ2XAJyQq8YV5zzxCx/dIwVvoZSgc/IX9xWslhNaDGwckM0bkOf/CHVjgaPIAjFe8ZnpnN8chJXU/TIaAtZAtYN7ZdWjZP4YO9NocJeqwFnSGNOvU1wb9YKVuCvi2FuBNtKbwovCddAaccEwpqnAPtqbr/9hl7USBxTLN3C7u8GgUcC0K/HzSLlfruAbDtwFBgZtHrx1ANlZp+zPfWaEnHxbXKuCDNpj6KynsHld90cIWM8hogNnFNcDnS8nHaWLenXJoI5aLolt5PG9Mwuo0zVwG6xtOobkzuiMMRzVBqGUaK+hPJBkYxurw6MIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Akc6dKynaVEGoTlAdd4u3YbgAQgbLM48dJrNRyUHIaY=;
 b=ZoeYYU+GA+SuyMeSIsXvnP2pPRrRWSdYb0ZIiBgyp8tawFzKeiUqq0Mg36Q655cSpM78zyFhL8byEhsxKbjez3YAdFwzZKPr3f4f9m+bulBP+QG+TQtejMMTmp8xy3iTRX4UB0Fxmc6IIQUokOdunrjHE+7R6lLs1s84dkpjuNEcu01fUUzMKfKJznO53mDgs0bNKABfouRD7qRxo+JlRaIO3gJfPEhZ+by42Du+CdxAoZ9opeslXK+aeZToNq+Z+FM90+HHCb0ckK7wnna/zNssBrQX9t4SsEdKExXnlVddw9QOdgrN6/1fZiHTL/9NYC5qkifP+Rrc/zSohwkAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Akc6dKynaVEGoTlAdd4u3YbgAQgbLM48dJrNRyUHIaY=;
 b=WX/4E5Ar/2X3+eYUK7ssnub6Xh3emYwtMFDXoIP4eWDphbvQ12VByZQ3IvBWgjj6YLKIygmMz4UkQ0IQvS49y42t2W5CpZcFhmutyjdz1ZaypK6fw7AAvNnWXQOWBwpGO4v9CfbWOBp9NpXRd2eEw3VdP7J5bQlcdv73mJgeB7HtZD5Dw5fZXN4vCgg6TQ9sq3YnBBdfgBwMSeTVLsPT6ijo5PRcV9hVDPb6h0dM+UQWOfNMyXUxAq9tYXl2uJS7U5+fCSwX9a0pZty1qmgkFM0NNdMqQht7F/J7rX6LKhSR6USxt4jyG/mQkyVQuO3UJevcWEiAPbkqy0fm73+eoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Thu, 8 Jan 2026 23:39:50 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 23:39:50 +0000
Message-ID: <8bf680f0-94ed-4614-9ace-a081a6558460@nvidia.com>
Date: Fri, 9 Jan 2026 10:39:45 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RESENDv2 v2 07/11] mm: Add a new swap type for migration entries
 of device private pages
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com
References: <20260108060102.41357-1-jniethe@nvidia.com>
 <20260108060102.41357-8-jniethe@nvidia.com>
 <ed99b6b6-f722-470d-a40e-dddfcc9ae585@lucifer.local>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <ed99b6b6-f722-470d-a40e-dddfcc9ae585@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY4P282CA0001.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::11) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: fc238e6e-3049-4ed0-e47a-08de4f0f374b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUN1NDdKdStLVkQwdGhkZldXRzBrUjBKUWM4cXY0OW9jQ055MUttUlBHUWJI?=
 =?utf-8?B?a1RwZDlqVGErQ1ZMVm9KSytMZVF5NDJqeFFGa3pVSlBoREhLQ2ovSnFpRHd4?=
 =?utf-8?B?MDJVK2k1SmNkeFMzR1grckdPWmEvNi9BZFZ3Z2pnRzhFdFVEL2xJdWowTHhm?=
 =?utf-8?B?d3hVaXBrVTdldzlKYko4bjVWL09ya2c1cC82MmNzN1V1YzViQ01oOWtNM3cw?=
 =?utf-8?B?dnl0c1VTcUwzbmF6dDlTREdCWDlEL2lpTnhQaWZBQzVPUDgxcTh6REorcWYv?=
 =?utf-8?B?cW9CTXFRc094VHQyc1JRdUxJd05kdXJaVVdCakZ5cGpTNGltbGFhTlpseGlm?=
 =?utf-8?B?dVhhRjBEQ2tIY1ZYSHRiaUZiV0U0RU1zYnhoam8vUGo3eklWaXp1NWN4Y0tu?=
 =?utf-8?B?bGJMT2ZaUEJmRWhPQ0JDMm9RYzdJZTJxQjVxZktTYVZ4TXlBRWpQdHpnTGpW?=
 =?utf-8?B?MnNWK0c4TGpPaysrcTg4ODgvYzNlQ0NHVHJYRENDRzRlR0VMSEk1alV4WS84?=
 =?utf-8?B?S1hPWmt5RGxDLzV3eGZWMkRtalBmWkswdWlPaG8vUFpTT0kxbGVpK1BzQWhD?=
 =?utf-8?B?MDdlbnI3enpkQ0pQWHZWNVg3UUZ2SmFnSFJ5RVVMb2lQSk1TdmNMVVFSeUpw?=
 =?utf-8?B?YXJiRWtxSmUyRkRrVkZIb0xEMEZ6VWozWnBaYXl1WHVtZ01LMWZhZWtkVGxZ?=
 =?utf-8?B?Z0lXOVB4MENDTy9zallQNVJaVVlZTDc2Tm1PWG1LTzgyRkpmSk9OQUlkdXBS?=
 =?utf-8?B?MUxDaGpxWnM2clNCOUVpdkpjaVVtbXBJTzY1MGN4dW1sTmw2amVZTUg3Z0Zp?=
 =?utf-8?B?ZlpoNWQrYW4xSWtlVWVCYkRwWDhzYzFCRVJwYXV5K3pFZTg2d253S0VzbG5I?=
 =?utf-8?B?dzUxNm9VaGNVckVSVmdka3VtOFFQRGFTczdjVmgyMzl4dURtNytMNjlvRjg2?=
 =?utf-8?B?THZ6QkVwak94T0k3S2R4N09mTGkyT1Z6aGIxQlNmSFZNbGprVEVnc3dQZmNH?=
 =?utf-8?B?WFVWVUs5ZXhteWJlQmRqVStlTkQzNkVOUlB2UlFpVVRJS2htVTRVME85cG10?=
 =?utf-8?B?K3FLY0lqcTJhVVdEMG1vT2pTN01GUFMyS2lpekdKY25iaTZSN0tlZjZENUdI?=
 =?utf-8?B?V0RIZXlmL1NuMkdSRGcvZjVPSjBSTU9hYzBQUmlWZ25NdTJwc2NsUm45Vklu?=
 =?utf-8?B?WmExWS9CMklKdjcvYUg3N2xuQS9EcHNFWTNCSmhtVnRFd3RaNGxGZDZDcDV6?=
 =?utf-8?B?dDRsRE9XdVR3dTlkR1hCY1BITkFMVS9RUW9jOE5UK2J1ek5TR3ZER0pWM2N4?=
 =?utf-8?B?NkZ1ZzVOMjY5a0ZJZUswTkFycHRMNGhIdThIZzErWmFmYUNMWkdwT0dNekhH?=
 =?utf-8?B?cUdRV3o5d3BBcEF3Ny80MElOWEY3RzF3aDBYOG9aTXBSWFZqR3RHNjg5UEJi?=
 =?utf-8?B?MUZHZ0ZXZUpRd2pPRnBJb0diK0FpNzcyYVNYZDFWcDdITUJTV1lLajJBODVp?=
 =?utf-8?B?KzcwT2xwMmRuZXJwTVB4YkhtejJaZ3JGaENuLzZ1Sy9CUkNQbG9rMGNsSDMv?=
 =?utf-8?B?RFhsaUVKclgyeHQ5TmFvRUtSSzNBZEI3Z2tCWS95UDNpdG9PakcyblFWc25M?=
 =?utf-8?B?TUFacVpIMU5vVVByWFRTRm1nSVpQOSs5WmtzQU1IdmRIMkcvRjQ5Y0RqSFND?=
 =?utf-8?B?VzB4dEVURzZvTnV3MWdrdUQ3VGJZNm5vZzRCNVJBVWN1cytNQlRXQ0tLUFg4?=
 =?utf-8?B?bUJJWmtia3RFSHBrQ3hHQVNES1JXZ24yQ21ibWdRTkwxdnhuSkdQTFJQOGxh?=
 =?utf-8?B?QnQ3QmFmY25wYlpNVmhYanFoYUJrYnRrcmVTY3AvMEhHVWZTUGMzdGNSMGNR?=
 =?utf-8?B?ZVlsaGgxdWtYYm92UDgxZm5lQ1paUkhrVmFnOHQzVjJJVnhiZzd3QlZmUFRx?=
 =?utf-8?Q?ZbIqE7hHIGL/cUwT9g7Kr6TF9024VJY4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFVwN2pzM0ZJOFFGb3kzVWtLL2tNa3NJcGg2Z2V6YkV2bFlKbXRNcmpldjNI?=
 =?utf-8?B?THVtUEN3ODFwR3B1ZFRNazg1dklaaFVkZnFPZFNNOVMxR1MrZVZoR1E0eE91?=
 =?utf-8?B?b2FWWG5WdXl4eFVOYVpNYW9iTU1UUkZuMXgrb2RPT244Z3BLZkgzdWNzNGhJ?=
 =?utf-8?B?eGdFVjUwRERpYUZVUW5pWm14MWdlODRxWFU2NUtQMzRrUmpIV05LYmx0Ukww?=
 =?utf-8?B?WDlJR00vRzFMM21xQ0hLemJORTEzMG8ya0l2ZElpV1RVWVdsZnpsMXV1RWtZ?=
 =?utf-8?B?L3M2NUVVWHJya0RyQk1GTkRmTVFtb2gxcFpuM3J2NDREb25TVUR1VkhvQ0Ra?=
 =?utf-8?B?SW92d1JLZWFnR1JZazhmcTgvdlZBYXVuT052NTVacnovaFFVdmZld0Q1M0R4?=
 =?utf-8?B?b0N1YjAwS3h3RFJ6NVpNQmF5RHlXYVRUcmFRbElJeEI3MGc5R3hzYTFOcHZY?=
 =?utf-8?B?eFJyTmZJMzhvbUpSQ3RYak91cjRISDEwa1JvVTZDdzhKSjRZM2t5MFFFcXFP?=
 =?utf-8?B?alpaM3QrcWwyaFJ4YzVQNk5uWU9JMERVcHppL0FidDhzRlRUcGFaTGhqLzd2?=
 =?utf-8?B?RnFkTGJZbGpBWG9WZmo3eEpDSDk0bW9kV3dPSXl4VVlDZTlQL0xkWHpnR0ZO?=
 =?utf-8?B?Z280aitRaTVwSHU0YW9Hd0dITDZpeE9zZ3dPeFIxbkVwc2hxWXNHTEhKb21Q?=
 =?utf-8?B?cTFkaXlUZ3Nqend4STlUbk45ZGQ2V2UrV2tUYUZJaGEwTXI1b3FWeHdnTWpP?=
 =?utf-8?B?RXdlQWRNREUyYjg2bzA2UzFDL1VtT25NNUNpYnVDWFdZL2hXbEN4N0gxcUpC?=
 =?utf-8?B?NW11YW1waGdDL1VvVlYwWUU0UUNacGE2cnFVK0hIUyttOTNOZXlaT2tlOGNW?=
 =?utf-8?B?TUgyN01YbXN1TGRhVFpmSCs2RVdhQUFxbDIzNHV6TjdURTN5SklLV3loOThz?=
 =?utf-8?B?cUw4cDdzTG0yaGVoYzlDT3N4ajRZOHpGbmhpT1EvdTM4bWVEN2lueFBGRUd0?=
 =?utf-8?B?TjJOTjFyeHF1V2xUODk1QWcyVE1nTEE2a0hreFRTQXVlSmc3aFZZRTByamVP?=
 =?utf-8?B?a0hkUXNJb1ZXTHhzeFZ1dGFlYkRGU1plYmJha09USEFRdk9Ra3FBMFRJc3BN?=
 =?utf-8?B?c0ZpQkRJL3pkd29iQWxLTndsYnBHVlZYUk92d3crdnlDcjdJYzY3ZEF6U3Ex?=
 =?utf-8?B?MmFPTGREVkxabDNzQVZtdUJXTTViaHFpcHFOVU1ibTlHWnFmMDM2M3BESEVS?=
 =?utf-8?B?WWdBM3RHQVdjNjRYT01NNThkc3Z2SCtqMFhBQnNHVnRJcmZrTGs0bGo2VUtn?=
 =?utf-8?B?QzJ5dWIxeHVkQjNNN0xJOTEwaXFTSU9vR1hNdU1JM3V4ZWxHdHBrZm50VmRQ?=
 =?utf-8?B?K1JQekJtR2JPSUR3ZXlodlVPZFVWZm5iUmVCMElsRVBWWE9ya1phS2psL1pT?=
 =?utf-8?B?KzJINVdXY202RytjclhlaDh1bXQrR09QM0czUGhpMWpReG1rRS9lSEdhaERa?=
 =?utf-8?B?RXc3bzlQMXh5bW1SeU50QlhIWko3NEUzUWpteVZNZkN4aGhFMGxrYjhWQ2VL?=
 =?utf-8?B?dStPQ2lzejJVT0VOZi9aajJ1MmhkRko5TXRzNjFDOGQ3a1EyM2xnWlltTEQ5?=
 =?utf-8?B?Tm1qRFNpeXpzSEdOajBNRkQweU1la3RrOUNsYXQ1bFVWMTF5ZDltK2dmNmlD?=
 =?utf-8?B?U3ZraFNLREVXSTNsUlRrWkVpTUM0ekxUeVJXQXRhN2ZDRzE3eUZsNmZUNTcy?=
 =?utf-8?B?VzFVU3ZmbVVkZkVJTmx6VHRlWTIrVHN6UkU5NnhlWHpEcHJTSVBDd3FYSEhs?=
 =?utf-8?B?QlZIL0wvaVFGM28xTytkSGFmeUlubVQ4SEltYXBaemZiNGRJNWlWVXRNVlJr?=
 =?utf-8?B?SERnc2ZKS2hLMU9SaTZEVVMvVGRSM1dxM3hodjg3eXhRc3ErejZ6bEJZZElV?=
 =?utf-8?B?REZPSFNlbnJJRGFLVitjclh1QWFXQ3JOYW9jOWl0NUxLcmZJWGJIOThJb1pl?=
 =?utf-8?B?TmtDVUExbklxNTdXT0w1eWVuakNIZmkvajlDc0ZZYzlla2lIcC9VU0t3VGdl?=
 =?utf-8?B?bnkwTkJzWXorcGh2MUFpOWdIdGw1N2cxQzh4TEtTY1dVbU12YkhYSFNrS3l2?=
 =?utf-8?B?Ym96QUo2QzE0WVpEb3hmdFR1T3NCbXpmb21sbEN4SlNUMkJkSGhOczJTVms2?=
 =?utf-8?B?ckZmYWFPZWhNdGRkbHdsM1lQRW9ILzEyajRWYm93Qlo5US9ndHoxcTBDSkZH?=
 =?utf-8?B?bEhUaHA4aUFROXVCYjNWWUw0MnpQeVpnSVdkRzF3cXV0bFdlWkxHTGc0ZnBF?=
 =?utf-8?B?OE1SbWlYQ3duN2NsNGxURUVPTkxKRlJmS3ExUzRwK2psaGkyQTUxdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc238e6e-3049-4ed0-e47a-08de4f0f374b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 23:39:50.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tg5nD+3edK4VFF+RyNzrNaL8p5kmAzJgb0QaALnaJjM8fJf+vTxkwEtbwy9JQ2mHwOv+PzJQ4kQtmmdrXdJkpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684
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

On 9/1/26 06:08, Lorenzo Stoakes wrote:

>> @@ -28,6 +28,9 @@ enum softleaf_type {
>>   	SOFTLEAF_DEVICE_PRIVATE_READ,
>>   	SOFTLEAF_DEVICE_PRIVATE_WRITE,
>>   	SOFTLEAF_DEVICE_EXCLUSIVE,
>> +	SOFTLEAF_MIGRATION_DEVICE_READ,
>> +	SOFTLEAF_MIGRATION_DEVICE_READ_EXCLUSIVE,
>> +	SOFTLEAF_MIGRATION_DEVICE_WRITE,
> 
> I think these should be SOFTLEAF_MIGRATION_DEVICE_PRIVATE_xxx
> 
> And I realise that's a mouthful :)
> 
> But to be consistent with other naming, including SOFTLEAF_DEVICE_PRIVATE_*.

Sure.

> 
> 
> I don't see any users of this, do you definitely use it? I mean presumably you
> might in a subsequent patch, not checked.
> 
> Otherwise I'd wrap it into softleaf_is_migration().

It gets used in the final patch of the series when we begin doing things 
like:

static inline struct page *softleaf_to_page(softleaf_t entry)
{
	struct page *page;

	if (softleaf_is_migration_device_private(entry) ||
	    softleaf_is_device_private(entry))
		page = device_private_entry_to_page(entry);
	else
		page = pfn_to_page(softleaf_to_pfn(entry));


> 
>>
>>   /**
>> @@ -211,7 +279,8 @@ static inline bool softleaf_is_migration_write(softleaf_t entry)
>>    */
>>   static inline bool softleaf_is_migration_read(softleaf_t entry)
>>   {
> 
> For these ones that you are making sort of compound now, can you please update
> the kdoc to reflect it? You've done it for others but not this one.
>

Sure, sorry I missed this one.

>> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
>> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
>> +	       softleaf_is_migration_device_private_read(entry);
>>   }
>>
>>   /**
>> @@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
>>    * readable migration entry?
>>    * @entry: Leaf entry.
>>    *
>> - * Returns: true if the leaf entry is an exclusive readable migration entry,
>> - * otherwise false.
>> + * Returns: true if the leaf entry is an exclusive readable migration entry or
>> + * exclusive readable device private migration entry, otherwise false.
>>    */
>>   static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
>>   {
>> -	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
>> +	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
>> +	       softleaf_is_migration_device_private_read_exclusive(entry);
>>   }
>>
>>   /**
>> @@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
>>   	case SOFTLEAF_MIGRATION_WRITE:
>>   		return true;
>>   	default:
>> -		return false;
>> +		return softleaf_is_migration_device_private(entry);
>>   	}
>>   }
> 
> So all of these above ^^^ are making it so you can't determine if an entry is
> 'migration xxx' vs. 'migration xxx device private'. Is this ok?
> 
> Does anything need to exclusively determine if something is a 'migration
> xxx'?
> 
> If not then fine, but just wanted to check.

The new entry types have the following relationship:

SOFTLEAF_MIGRATION_DEVICE_READ is-a SOFTLEAF_MIGRATION_READ
SOFTLEAF_MIGRATION_READ !is-a SOFTLEAF_MIGRATION_DEVICE_READ

So it is remains possible the distinguish the types using the
softleaf_is_migration_device_private_read() check

In practice, the only reason for introducing this new type is so we know 
when
we can not call pfn_to_page() on the swap entry offset. That is the only 
time
that the difference matters.

Rather than introducing a new type we could accomplish this by adding a new
flag like SWP_MIG_DIRTY, SWP_MIG_YOUNG but my concern was how we handle the
!migration_entry_supports_ad() case.


> 
>>
>> diff --git a/include/linux/swap.h b/include/linux/swap.h
>> index 38ca3df68716..c15e3b3067cd 100644
>> --- a/include/linux/swap.h
>> +++ b/include/linux/swap.h
>> @@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
>>    *
>>    * When a page is mapped by the device for exclusive access we set the CPU page
>>    * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
>> + *
>> + * Because device private pages do not use regular PFNs, special migration
>> + * entries are also needed.
>>    */
>>   #ifdef CONFIG_DEVICE_PRIVATE
>> -#define SWP_DEVICE_NUM 3
>> +#define SWP_DEVICE_NUM 6
>>   #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
>>   #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
>>   #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
>> +#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
>> +#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
>> +#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
> 
> I've lost track on how many entries we have left, have you tested this with a
> config that maximises the number?

Good point - let me double check that.

> 
> I really hate how we do this by the way, that's another thing to fix... :)
> 
>>   #else
>>   #define SWP_DEVICE_NUM 0
>>   #endif
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index a9ad997bd5ec..bae76d3831fb 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
> 
> Since this is pure softleaf stuff can we please put it all in leafops.h if
> possible? I know we already have some stuff here rather than there, but this
> really doesn't seem to belong here.

The reason for adding the swapops.h entries to correspond with the softleaf
entries was it looked like the swapops were still required for making
the entries currently.

That is, there aren't softleaf equivalents to
make_readable_device_private_entry() and friends yet.

Would it be better if I introduced the swapops.h changes in a proceeding 
patch?

> 
> 
> Cheers, Lorenzo

Thanks for reviewing.

Jordan.

