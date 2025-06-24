Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD0AC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 12:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BC189580;
	Tue, 24 Jun 2025 12:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FKh/mIT1";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9060189580
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 12:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBeooC9rsalXXvYh63bQtzF3m6bZWddajcp3g9WSnsgkzePjECy7qN8g/iLDaPYVO9MB+nUs3/3zVpF6Iew3O8LdhXUvhhxrLG5zv5soOgqqtc4kP+KCH3GdPIzQ7iZnPkc9JtNldMC6OAP6Cu6kL7SYXoXkZCjohPG5dMaSFsMEhVwaiyFByE9eir7L1K0UWOCkzbrqqW0IM/1eEftITVgka3FLIIUlekElhUtPK/EjMsHOT1gmLSh4UMsxO93tj/TFkVa5IYCIe89v0c3helUDJnNkK1KV5e4co+ATWkiLHC1pObXZEqYoyi0LkH2tg6BWifpXUvE/TthXM69Q6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V48HXbhVr3CnD47tn++Khq76TSvwa3cUguCGWHRyCto=;
 b=RO7Ul2TktFbalBg/5A/aR5TwGQprXgvsBr/uQ6FiLa+wWHjON6rlTeVD/tbASM+wLYQpZX8vP28T41n47mFf7iWXvK9ig5+oA8hwEfqP1WVFOigNXwsxRrVlEy7rnWpu2cclY7GOPxY8DxLojpgDcbeHHJ1pMDQvyKeq4dY4W/V8HWoyX2ftCy03OTNqIpMKzWvHJpGp+cqds2HKfjxVHmW6phEbnf7wQvnCPI/T5mhariu9KymIvf39nLq6OWUoHV5CPJXHlzAqF7VptldnA1HpCLT2kO/Qn9ZN0YJbdR7x9LAKcWY/ybxXQXsHfXZ5M6g1QLnT2MOKrZnj1rBgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V48HXbhVr3CnD47tn++Khq76TSvwa3cUguCGWHRyCto=;
 b=FKh/mIT1Y+Mv+goSlcNAArnsPjA2cztP4Qy1jQslDnI/qr0rtX7AZhJhOup52MHC7HybqvYWejyUq55r8fawVoHVMqcyF9JwtRxZbLTD9rzI8vFJO7wX6On6wRlNBmXOd3MhM7xTygQh24im+ycuMmu5wW/Sy0Hi0/h/PpmcZ5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA3PR12MB7829.namprd12.prod.outlook.com (2603:10b6:806:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 12:26:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 12:26:27 +0000
Message-ID: <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
Date: Tue, 24 Jun 2025 14:26:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250623100109.1086459-2-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0019.prod.exchangelabs.com
 (2603:10b6:207:18::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA3PR12MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: a09f63ed-1a7a-4eff-896f-08ddb31a5732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDJYQVF4YlZQRnkwSzgwVlIyU29COVMwWEttU3Ruby9RU0grbis4VTZaZ0Zj?=
 =?utf-8?B?MjFkV1gyZVg2Q3NvV0dhcHBoSWZJTURteDlxWk03M2ZsdFBKOWVsU3BZREZZ?=
 =?utf-8?B?WXM5NEgrS2gvck1FdVc0dVdVRCtMMzNxN2kyWm1yR1cyZlRVdEZoYmQyOHI0?=
 =?utf-8?B?UjlaZ0t6cU1nZjRtQjY5TXJQekNNWWl4TVR6Yi90OFMrbGxmTHl3Y0wybXJW?=
 =?utf-8?B?Mjh3cFgzSGtLVDlIOVFoVkxIaGVOSWIrdm0ya0twSTNidW55QWlSbkhMWGgz?=
 =?utf-8?B?YlBwQ1psdGN2RzBtRTlWaDNRVmI0Sk1aUFFjQnpPTC9BdnJORmpkNTFZY3Uz?=
 =?utf-8?B?ajZ0Z04vbUhieC9UWTVGNi9oc25TZ1lWMGxmQzNUTlZ3MVl3OEgrQy9RWTdq?=
 =?utf-8?B?Q0x3MGJQcE54OFR0YitPcENiVmlmMGQ5OERXeEh4RlRUOVNqc3RFNTR6Vko2?=
 =?utf-8?B?bGJQcHJYTGdPUS8rR3lZeHpicktiNDBoYlFhbkdTV2pZY1c4cmZpZ3hxUHVM?=
 =?utf-8?B?N0w4ditEbUJlZnE1SVh3cEQ0MzN4ZzQwaHViZHJDcGpPZVdURUxYY3ZuZ0hY?=
 =?utf-8?B?b3Jsc0x2N2FvRmJzQmhHRDJsY09SZ3VKbitpRFBKOEFJT0E5cjBLN3BUMVE2?=
 =?utf-8?B?QkFRTFJvUlZMaW1WYjJDN3BjRXZPeURQK0N6TFhlZVRqQTJabm1TSjljM3J3?=
 =?utf-8?B?eHJSamZNQ2lUWHh1a2RzK0JtKzAxTzRBT2RlOVZWaHJCYjczT3gvNWRFd21F?=
 =?utf-8?B?R0c2N2RVeVhNUTY2K2ErQXViQXdpVlFsOEtMRFBuR3B4RHVHWW9HM3RTKzU2?=
 =?utf-8?B?eEV2cHh2aytvOVlmY0tPNS9uK2REZjM5ZVRqNlRzamZpdm9wV0ovV1lKbFla?=
 =?utf-8?B?blpKdjVRMHhNWUlTZCt0MVRtay9OcmxJYlpnVXhIV0gxQmQxaHFsa1FkSlE2?=
 =?utf-8?B?NHFHYkhJemQySVlla0JuZGd0UU80anJUZTFWRGxiMkVvMlc0bnR5bjhOVFFy?=
 =?utf-8?B?RWdVVjNsYUJmSHluZEh1aE5uUjZoR1BNVDgxc2dCSUhDaVkvbG5nNlJxQVN0?=
 =?utf-8?B?dFU2L0pMM0cvU0JiN3R1ZnhwYnlMTk1NZmY4bW9pZ29xWFlCaldPaXkveUpO?=
 =?utf-8?B?NkNNR2lYcUkyV2ZYeFVkNEFXTWY0S3FnbXR6Y1Q5aE1zMStTdzRJWTRyMUl6?=
 =?utf-8?B?SlNWaXp3VjFjR1dxanB5NGg2ckZIWVZ4ODgyZFJtYXJUYjlDUFlZdXlpdmRa?=
 =?utf-8?B?Ymw3a1k4dExzeTdtSnVDZGNrY2M4enVIRm9FK3B4N0ZreEZ4WE40SVVsM1Ro?=
 =?utf-8?B?RXNibDhmVlFUSTl3WWhuS2pNdjU5SGNrNk1nZVpSaEpiUWtGNDFpLzROSzJ1?=
 =?utf-8?B?SjQ4bTduVERjNTJISmlKeHNuOUR4dTFXWHVyYmloeis0b1ExSDl4MldvYW0w?=
 =?utf-8?B?QjBVbUFZWTlneFVzSC9rODV3NnRybzN4Yk44Vmpzd1VrYXBMMkhrNkludzZT?=
 =?utf-8?B?ZEYram1ERnM3bUJWd1RXbzd4cDdzRlRwWnJsazdheXAyL3ZUMnRDY0M2UnVJ?=
 =?utf-8?B?Rnl1bFo4eEpIeWw2TENqTGgrM3FjbFh4WU54TjcxbzJ6Q28vSmdsWnI4bVdJ?=
 =?utf-8?B?RTl4SnpGcllvYlIvdmpSTkZlNUpxR2xWR2VmNzFHS2xleE9PV2FYclk4Zldn?=
 =?utf-8?B?NVVlZFBoZkJ5dHlsNnpNdkJ5MGxVZ3Y1dUN5RkNwdmxac2xmRVhSV2Y3YzQz?=
 =?utf-8?B?YWRROFNkT2Rra3lIMktCL0xBeXc4RWt4N2NBWDZ3bWVYR1UzS2NiRkgzcUVB?=
 =?utf-8?B?QlBwWExybUxCNjFtbFNiQUhYcTMweElHd3lFN3dob3hGZmRmNHZQemo4R3M2?=
 =?utf-8?B?UGF0cnFpWHlkTWZzSExoOGRpNEwyOHF4V3FQd0ZBdVAxbTNvN2svbmZHNnFk?=
 =?utf-8?Q?rIhc3XtPCnM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHpSZDFWU0xjeFpUWXlrZ1Rnc016cVovVXczSjJhaGVLbkhSTzErVXhwcGtX?=
 =?utf-8?B?aENMdUVWN0UrdnNad3RTQ245MkpMVHRTR1FmUGNZN0l0Q3RxUlpNKzdVWVZ2?=
 =?utf-8?B?QlI5Q3Zheld5ZHIxR2E1TnFadWxBU3doRWltckxpcjJiM3ZSdit1akxsQXcz?=
 =?utf-8?B?dmI5bEhzY3hnWlhXOElPYWVtTkFHUjVYajhQdTl3V3p6MGd1U1BOaDdRbm9h?=
 =?utf-8?B?VkdHVWIvejBOb0JZbGhFWCs1SzhRTkhDVUhpNUgyVjI3blphdytHVXpGV2lS?=
 =?utf-8?B?RHhpMmxZN01rOWRKakl6YklHL2lyaC9MTWZheG5MRFIzNG1yRTc3MlJHR1RF?=
 =?utf-8?B?YjhreHFzOGdBeThqc1ArSCtrSklLL3lrSkV4bzMyQU5BaWlWRkl4R3ZHMVlp?=
 =?utf-8?B?WnpHZzNGYndqRDg4RTFseGZpRmRVdWNtK1RYeGVDNVBPQkswVG5OYVJFZVgw?=
 =?utf-8?B?Qy9sM09UWEw4TUNHaHdwa3ZZUXpTME9PYm5HMTJYUUNHUkUyVGhONDQ2Yk1M?=
 =?utf-8?B?VG1MSGl0NWtZZjZDbFU0clJQRVlNbnMyZ2FBRm5EaHFZQlAvODRMZGora2ZX?=
 =?utf-8?B?djBSaWh5SWI2WGVWNEphNU1QcTFBTGRMazhQWFB5UWlkR3c4RGVQWUM4UVVJ?=
 =?utf-8?B?d3BvVzJ6eUVzZ3cyMzJUYXB3T21EV3EwTzk2aHpEWVFnTDU0azJMTHRSc0lw?=
 =?utf-8?B?L2xTODN4SlJseVVRdmdPREQ0OVpJL2NYWUV2THV1ZWNzQTA1RGJSeXpWdE5B?=
 =?utf-8?B?d0t6dDA3Q25vRTdsYzFWSU1IUk5mR3ZyNUJWUlhWU0hFVm5KUU8xMmM5R3Yv?=
 =?utf-8?B?N2lVZ1dGUCtWNjNpRXFubUcyL3paTkhna3hhOWRPUlM3MlZ4cStSSUUrbDVQ?=
 =?utf-8?B?bVdycHExd2RvU3VVQ1ppZHVGNjYvYXBxSWVzR2RkOE9BOFo3MG1pZ0R0YmpJ?=
 =?utf-8?B?N3lWTGs1UzZOdkt0bFpKc1EyTDFxTDJXc3VCVUp1RUQrclRuZTR4eFZESE8v?=
 =?utf-8?B?Y3d3ZFVIQ2hIc3N1VFNONWpaSW1GT01Hd216azJycEZBKytiOU01V002UWZn?=
 =?utf-8?B?aFBic1BuV0FxaDBIMW8wN3JMWmFReHVZNEtLL05MMUlJemI1WFRrMUFmZy9y?=
 =?utf-8?B?Qjlub2gxU0NYeUlVZUoxQnVmaHJ2WnNucGNkbzNQbGRaemFZMnRqa3RwL3VQ?=
 =?utf-8?B?bjQ0RlNwazFCSmU5bUgzanBJMzhxYjFvWGJ1bnNpOUlQbFdPREMzMVVDdGFk?=
 =?utf-8?B?dzRIWjAzN3ZJUDJVNFdUTTlndHI2MWhyblh6eDdaZmpuSnYxQm81Z1ZJWjBC?=
 =?utf-8?B?R2xZWWVyNkNUN2IzT2lSUTFMRUI3allUNHE5d3k1QWhoenZNSDRxTjF2OWpG?=
 =?utf-8?B?QU9kRkNJNHNkUG84bngzaXU3YzRnY2xrSGdDS3NzeXVReTczU0UvbDJQSVdr?=
 =?utf-8?B?SlkxUGoyVno4cnlER0h0WE9hY3dQbEJ1WEMwa2tCU3huS2g0cklmOEhCK1Zw?=
 =?utf-8?B?Z0I0UHRLWTN0VlZsUTR5ZjIrRm52RnhXaUZJVlUrcWhXK0F2TkZieWlDNjI4?=
 =?utf-8?B?MmFXemNybXY2RGV0ZytXQjdNZ2x0cTljTHpjY3g0Q0htSm42NTRaUTNRcGNt?=
 =?utf-8?B?d0ZCd3c1WXI2aW9tQTNqMVBMYWp0T01BMGhPN1d1eWQ4cnY2WWRHUUVpemJ5?=
 =?utf-8?B?TWVnR243WDlpWnQ0dGdFZ0RrSTRqNE1leW51WndJcjFkcWpRUXJ6WWY1Ukgw?=
 =?utf-8?B?OUZLMUxndyt6dkh5Umt3dHhxekZlUXBaK0FpcEdlaFp4VmtIZElEMm51UFNk?=
 =?utf-8?B?OTBVb3JKcS9waVVSaTdSTUlpVmQwaS8rREdEUkhtMnFhdXlQc1MzVkJveHNX?=
 =?utf-8?B?cXFBQ3JNTExrVVlWYldiVnpZQVNEekQ4aWcyRW9lVk9JV1Z2TjZNbFE0eXVy?=
 =?utf-8?B?NXBqSDZnSGJhcTJYNm50YkxpbWtzWkdXd3VtbzV6emp1YkJpY1hNU01hNlFk?=
 =?utf-8?B?eHZhUmFBR0dXa1Z0bHl3NGxpd2VqVndlVXFkWXVLUnVhZnc1SzQyUTBBekdL?=
 =?utf-8?B?bWRqYkpHREpLbkxMODhxV3Q4NlJsaTN5NFRJZnh0cHc3QnE3OXRhSGxnTEFB?=
 =?utf-8?Q?jcchWwVe+1MDenRbTyegmSYkS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09f63ed-1a7a-4eff-896f-08ddb31a5732
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:26:27.4512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbI6y8eYESy+hnzU/EY1nx1G81t0MQMf+LyiImKhMYvXAYJm1HG0/gVA9vTgHxkb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7829
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

On 23.06.25 12:01, Riana Tauro wrote:
> A device is declared wedged when it is non-recoverable from
> the driver context.

Well, not quite.

> Some firmware errors can also cause
> the device to enter this state and the only method to recover
> from this would be to do a firmware flash

What? What exactly do you mean with firmware flash here?

Usually that means updating the firmware, but I don't see how this will bring you out of a wedge state?

Where is the rest of the series?

Regards,
Christian.

> v2: modify documentation (Raag, Rodrigo)
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 6 +++---
>  drivers/gpu/drm/drm_drv.c      | 2 ++
>  include/drm/drm_device.h       | 1 +
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 263e5a97c080..cd2481458755 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -422,9 +422,8 @@ Current implementation defines three recovery methods, out of which, drivers
>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
>  more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +(like soft/hard system reboot, physical device replacement or any other procedure
> +which can't be attempted on the fly), ``WEDGED=unknown`` will be sent instead.
>  
>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +434,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    firmware-flash  firmware flash
>      unknown         consumer policy
>      =============== ========================================
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 02556363e918..5f3bbe01c207 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -535,6 +535,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  		return "rebind";
>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>  		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_FW_FLASH:
> +		return "firmware-flash";
>  	default:
>  		return NULL;
>  	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 08b3b2467c4c..9d57c8882d93 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -30,6 +30,7 @@ struct pci_controller;
>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_FW_FLASH	BIT(3)  /* firmware flash */
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev

