Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6539BC5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 19:47:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214A910E4CA;
	Thu, 13 Aug 2026 19:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="me0FxObo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7307F10E4CA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 19:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786650428; x=1818186428;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jcDAu04AgrRj/XoIUqpnNxSaCg5tiSuJnmEK398iABw=;
 b=me0FxOboCCSsqLNZI4ZyjOEo5rBbx20UM6bZsGXG8cFHxHPDAQJC4j5m
 PK7KP7xIxpLCqkHN40nIyCRxdJ+OjoNQltZhKjPAXnB40vHMQplpahu6D
 k8KbxknquTVWx+NnoTjlQvGHOnq82OeyjiMR6+l5YfcPMa1aQ9ngrj3al
 QnnH/+Ea69jxdDKujkt6nJKHR1z2R9T8mozI4HLV7EIRUsl6TWRAoKxuL
 KBMRnFdxWvdhq9Po8iKIXTfwB+0uFvvrrGF88Mg1Xt2LA+8uRartSIwRu
 OkzRconveQT4ZEZkV6UFNdT3PCk5bwwaKBDGRhbJbjXVWXDsW5YRq49Vj w==;
X-CSE-ConnectionGUID: gIxCUNolSo+VPCZHbRIhcg==
X-CSE-MsgGUID: 4nDiogxSTQGSam9qreWAMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87258649"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87258649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 12:47:08 -0700
X-CSE-ConnectionGUID: YiM3JAMfSJaAbYTboT5N1Q==
X-CSE-MsgGUID: TiBSxu5WQjeNHI/qkOYWhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="262286865"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 12:47:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 12:47:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 12:47:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 12:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR1tvZfXU5DakE9Kh7/RrftYgtQUYW3vr+Z2YAokq7TCJmYO/NONCQbGhOH7mYXs5YMgJ45f4oBSRNyc2dKs+UGNVX1X/Ldz8FkGYlZSueD1YwoOsViH4+BcaevLtAx0Zha5hXwOhHEtRtxuu/iSLXKmCAgtsnYDMpHNb1SgCU5gDv0T/y6/lfngYjSZkmPugYfpwJZJ2b30OlcWnhoicUGBmdojQ2GBAi+2yOhVXy4mwNAyp4j24ocVAGsY1xNt/T+pfy2JgjKZWLQFNNzP/WKMWywhV/rYXFQPgxyxuWvetfd2Y0kj7HRvpStyW5+0jY/kNAqwD2nP55tnpxwwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZLVMzsz1gcqYOksiO2tUDkxvRoVf4OoedE+cfCZ+EY=;
 b=Ze5pRVZqBV8ilBFn9JMzjc7C9eDp3/rJ7TKqOHu3GT74F0fQdbebkIV7LCH00LyDDVHs7lpQvlKPRL4u+XO6+O3NBy/GKkm8KAMAKrVaeJEzQZTMzsCrD15FSynYVi3cmTtEaDLaUy4tiRfTjxCXCh68S1en9oI+d9e29rovi7tYikmvtD5dUekBTAw96rqM7FQaaG+KxRszUDmY27ejKXeLQwvAbGPly+hfR7HOnMWj+kZwLlVjsVZY4zVd+wmBLiYjOkslGIjFfcQgs7e7TqZvtCFLTD2tUu3nJcD2y7M4mhc7RoaHhseHkx4p5AEZqG4FfumDOFnIJPVcZFOS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB5178.namprd11.prod.outlook.com (2603:10b6:806:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 19:46:59 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 19:46:58 +0000
Message-ID: <fd80931a-b656-4220-b099-a370fe2a5313@intel.com>
Date: Thu, 13 Aug 2026 21:46:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/32] drm/xe/gt: Report 'Fault response' pagefault
 error using SIGID
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-31-michal.wajdeczko@intel.com>
 <an4PAo7kT0tomdgh@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <an4PAo7kT0tomdgh@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF0000051F.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::675) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB5178:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e23cb31-2605-4a13-f487-08def973a31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: T8HNMFnKgbd+a4Mdws0eZxxlKxOilBf/OieHPQEImaPDdsrZO+TMD2suhnTveH0wxuu+eMXD8iy6YxHmkzcyqh3vFh1+4BTZundc04P27Fui2prPCxITQ0fbyy84j+QvF3+ZtaHf4YO1kNH/xir3+w2FfEu6mXjqfEGptyxY/p5nX9Voj5aKmpZpLr78OpCQwDO2N0BMqk4ikrOCqOe905wd+gkbv05/wwO7slYg2FBGDctc1mpnCKzp5264sVutYiT/aLvKtlCnsLIlK0vmGDokzVWjpeNOY8OegNQg0p/dA+WNFh0P/60FtBwvpyAEy5TN/CWSL8wHZ6UQJ1a5QpNiz72Z7ODhaOe6a2QsdANUcMj2mmuJoVkLaZzmAX1Mwma0k3czQxJpAZwf1S0I8DB6pMQs57JBYt1ydN6J+dwYAEiog+CIx76JYOHEjh17Lf+UyIgih51LuABakpiUcdUHykt217+YhEmvzx8C1M1AVOqcMwM2nY4k1tsRX9/mgPj/WgbQ3wwl9WrBJzSb2u3QtUP4A333TGsUYhZeIWppfyef3ztxnPn2pvkv55U6vQHMwpbg6hVvUPUIbMT4/CogeKqkwGbK8/4jwbNUAx0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZGMFNZYXBFMTI5VDhUaXBhRG84cUJZSjkzdXZ5TnFQWm5EelZFdUMvWE0v?=
 =?utf-8?B?STJJWUpHMkQweGtsZ21jbGsyUHJ3WTV0M0xQZGp2TmM1dERJRzF5WEN1TGJt?=
 =?utf-8?B?ZEdIVG1XSDBjbGorbUR5SFZRYlNzYWdoMkx3YjhaWlY0WXVrOVZ2d2NjaTgw?=
 =?utf-8?B?U2RCdXVlbDFUbVNndXN0ZE1xUkdsTmNiQkJQT0ZXaVkwakVDdDh6bTY3YjJy?=
 =?utf-8?B?djVPM1dLcDdnMDd6VmRBVlRGRnF0Y2N2azVCTGkyTVFRVGJHZ1FWczBjRnZQ?=
 =?utf-8?B?Zit4ZXZIYTB5Q0VJbVBjWEpDVDYwYmdxeXBsVGhzRGJ1MnN2MFYxZGhRVFkx?=
 =?utf-8?B?ZXIxQ0tqUEhacExoYWdEZWsxUWw2TnJiaU5BRGJCTWUwTHJVcGttYy9YeWky?=
 =?utf-8?B?cUM1UVhFeno4ZW05bzd0RjhCK2E4V3crS3VLUkN3MFN2Q0MycGVKVTgxZFkr?=
 =?utf-8?B?OUdxNm1xckZsV3V4aFdVMGdpTjJHZXRWanBuQjF5ZWFXVXlTS09LQ1pRN0sv?=
 =?utf-8?B?RlpzS1VxYVdicnQxMkJ2VmJJczF5dFUrbE90SW9tdllvNVg0OUd5WlFQalp2?=
 =?utf-8?B?bHR0ckdGVmJkN2NucW1UM0ZZYnVPbFErWGp5eVFuSFdMeTQ5VkUxNDE5S29u?=
 =?utf-8?B?cnBpaXJKY0ZYTnVoK3cvMGZHQ2t0cElXZEkwazdjOENkc3FrQmRzYlhJTE5i?=
 =?utf-8?B?V1FkU0dGQ0dFTlFCR3E4L2FsUmFQNkcrQUtTUitwTEEyRFFlWjVtMnZIUGxY?=
 =?utf-8?B?MXJya3NDVDJpcDAxQUNDVWtVaTd6YjZpbnFTcVVzeVhLYkZZdUwrbkhzSHBo?=
 =?utf-8?B?MjVOQkFjRFJuRllGZXcvNytTOTJFaTdTZ3cyTmJRYWU5KzdVZTU1d0pPbmZx?=
 =?utf-8?B?aU50dHEzNTNSUnFWRDFVcDZ5NFNuQXZ1ckVCL2dXWDlLMElNVVJIbWlVV2x6?=
 =?utf-8?B?Q0tBcnpoeXVYN1o0enZsTTBjNnlwS3h2TW1QWU1ORExVbU9yTUFqTWxHc1E4?=
 =?utf-8?B?RjFndFhNbms5dnM3ME9zakJKNHYwQzFuaDlVR1F0VzhUbEFGRkFIUGplN1hu?=
 =?utf-8?B?dXdNVUhScnkrdHhkTnFpNjRseE5LQm9xRVpPUXcxVXhiU3JZbkU5V0NhL3g1?=
 =?utf-8?B?ak5HSlR6aTR4TWRFWjFrUFZ5Q2ljd3JxZEdPN0Yzb0grd0k4OHg2Y0JDc2Jk?=
 =?utf-8?B?SU9JNDQzdG1FN3gvanFrVk8yWDZ6Q0Q5OFA1UXFhVk9ZbFc5d2JSbzFYLzRh?=
 =?utf-8?B?NEtESUp1a004MFovVjl5WEtWOUwvL1RqejVSRkhLTndyMFJrblNHVjlPYkk3?=
 =?utf-8?B?RkVjUXh6aWw1R1d1WHZyMitqZWFoclRqNU9NZ3dTOHVMb0pLWWk5b0duYzRL?=
 =?utf-8?B?YkhlWC95OFFJVUNxb1dvWVBZZjgvZ0U5bkpCdEF5Y3BLSVA5OWpHbHl4TGlO?=
 =?utf-8?B?VytheitDSXVTejFTdDEzdVhIVHBBejZuMzBnOGVFWGlqQmNCTHUreStKa3Z0?=
 =?utf-8?B?QXFqNGczWU5kaEo4V3djRGkyTDV0NndGWnZwRHc0azMxUFFmL0xXMGd0aTlu?=
 =?utf-8?B?N01JWitNZm9HVjYzWmNzU2t6UGV4K2drb2NyRXNvSWN6eTBTUEw1Z2FFZisv?=
 =?utf-8?B?NjdZRVUyZGp6YWlGcjRtL3ZwaWI4UTVmWkpra3NuZmQvTFJISGdUZm5iNU5m?=
 =?utf-8?B?bXlCVkNwdmpwUE5HT3cxQm40R3FHdXBYSkdnbE1ZYldsNGgvOEdkeUdYa2tI?=
 =?utf-8?B?ZlZQU1EyV3RwYUlrYisrRXV1eDVZWHpIOTJYRjVTVHBlK0RtUHhBSVcrZENK?=
 =?utf-8?B?WjdaNkx2M2lYaVlwdUh4eGFDQmswb3VDUEdNTTE0KzNyempyQ2ZCanM5aHR1?=
 =?utf-8?B?cmU0R2ZQaTVnVmxwMVNTUEVZT1BiTm8vOXBmNFlRbDZQRWU5d2EzKzFYVUlJ?=
 =?utf-8?B?eFFVbnVFMWhVUzd2NkZOM1k5L28zTDJyZVhxc3RPbXVjY2dEaW1yRzViM0Ux?=
 =?utf-8?B?U2EvdVZGR3lxajhrdDZVQzJOSGltRk9rNFNEaWlIdDNJUERjT2xCcGFXU29S?=
 =?utf-8?B?NTZ4Tm5aSk5iR3o3cTZxc1c2Y3VOcStuKzdaWWhBemh3UjNTSlBwYTdhdkxT?=
 =?utf-8?B?dkdYeUEyU3B4cmxvYnhYNHVxdXFjbk1UTThUeUFlUzFWd1JzM2xOZjlyUEhR?=
 =?utf-8?B?REZkNy9CQjJ1a3BSQ0ZlajlHQ2Z3dGxsMzZ6YlJxeUpKZnFoZnZPekd3Q2po?=
 =?utf-8?B?VmRvc2hWTDFBZUNVYzF4NXBwK1FHMzJrVkJUMGtpUWJ4amZzWldZMWFhM05J?=
 =?utf-8?B?MnFsU1RqTkw0dHYrZ25TMmhCTkNFQjRZVitIcjRlRVdEUFg3MHkxWWVqcEx2?=
 =?utf-8?Q?Ph+GBuoY5G8BQeS0=3D?=
X-Exchange-RoutingPolicyChecked: rsYHlmascZwF6xpXVHkJXWpd6i2bPWTORbSZg6/uM0VKrYTmNNco1R+Eai1soEAAYH9Z1mG/4WFNWYviCB1CcZXaJETWBZ6hbBI5O98cVEaB2ziXr72pxL4TZOB9l14d4yfpC8NC15G4wD+4nrtLnRhuCkZ69PYKQpMM5o97ZjNsRjsC4DHuzCYG6yUM97KBmugwws+qOybRxG8BstO6O6HVMGoGlLU+9W8L8RzmnZ0grkbfNUjQ+fVf2wnZ0gM+ODfelL/Nykh+m7DpWeRiWB12aHNgjix5kNUkfOyHibyNSHKrWbW3vKGuGqUDVg1NqsJQEFnIVbffeHM6g/8OFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e23cb31-2605-4a13-f487-08def973a31a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 19:46:58.8756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FzkSHHQE8oDjS9TDawutI6/7jZAALSod/suOMr1xz1kUJViDJNTE/MUB1pNUvm93QW+QkdBspAhAOz2wVTYZZhEtJq4zqOWHoOhHIRPKRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5178
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



On 8/13/2026 8:37 PM, Rodrigo Vivi wrote:
> On Wed, Aug 12, 2026 at 09:14:46PM +0200, Michal Wajdeczko wrote:
>> Report 'Unsuccessful response' error using xe_log_err() helper.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2: rebased (Michal) reword message (Mallesh)
>> ---
>>  drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>> index 7e829c61387f..eb600c466187 100644
>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>> @@ -14,6 +14,7 @@
>>  #include "xe_gt_types.h"
>>  #include "xe_gt_stats.h"
>>  #include "xe_hw_engine.h"
>> +#include "xe_log.h"
>>  #include "xe_pagefault.h"
>>  #include "xe_pagefault_types.h"
>>  #include "xe_svm.h"
>> @@ -625,8 +626,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>  				xe_pagefault_save_to_vm(gt_to_xe(gt), pf);
>>  				xe_pagefault_cache_start_invalidate(cache_start);
>>  				xe_pagefault_print(pf);
>> -				xe_gt_info(pf->gt, "Fault response: Unsuccessful %pe\n",
>> -					   ERR_PTR(err));
>> +				xe_log_err(pf->gt, PAGEFAULT, err, "Unsuccessful response\n");
> 
> I'm wondering if we should really go from info to err here...

my question was different:
	"why this err is only reported as info level?"
as once we hit this condition we also print large dump
(see xe_pagefault_print) likely for debug/diagnostics
so it seems important

@Matthew, comments?

> 
> Why not staying with xe_log_info or now?

I can change that for xe_log_info, but then (by design)
we will not print an error

> 
> But also, why err and not ERR_PTR(err)?

patch 10/32 [1] introduced helpers that take just errno
value and convert that into data { ERR_PTR(err), 0 } pair

[1] https://patchwork.freedesktop.org/patch/745993/?series=171022&rev=4

> 
>>  			} else {
>>  				xe_gt_stats_incr(pf->gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>>  				xe_gt_dbg(pf->gt, "Prefetch Fault response: Unsuccessful %pe\n",
>> -- 
>> 2.47.1
>>

