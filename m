Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E73FCD98C7
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 01:43:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A821010E8FF;
	Fri, 12 Jun 2026 01:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJoIzPTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172CB10E8FF
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 01:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781228604; x=1812764604;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MiFuhBdNhPZNsPGj1t852ZzP6j/yL25iPDnF2VXlY9Q=;
 b=mJoIzPTjYcIrK0xDokb5JtdgHRKZpx1RU2qqNXA1+2Ac3UAddBCz6bIC
 yzV/5P2KN5/hrBRP7N9Ec2FyL5BVQtdWC0C0k/JPc579XnoebbhSsZlMJ
 1Q4XpM62d/eHJUS2x+OIytY7t8K8JXAOFIjCVffdNSrzwZP/sVI/m8ZDr
 ykHV7qiTdc3mqwAFR6Hu4JN8P7rKYtgeWzYpObeKme/DGwCyr7qCbFrI+
 DZbUSg+fCirhKvfgWbBVLKFQdKNXaN9zlTnj2auPDxK3aaTZ3L+cVu94b
 5k2PMeHrNH50X1+EBNjvF7faISp+oIF+puju5maFAUB/MU/xWn6meG4Hi Q==;
X-CSE-ConnectionGUID: C3bf63EzR4+2egHskSxtZQ==
X-CSE-MsgGUID: QjHSDiWLQpWb/rhq+Ffy0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81965089"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="81965089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 18:43:24 -0700
X-CSE-ConnectionGUID: 4EMuH7XZQlKG4zrK/rY7iw==
X-CSE-MsgGUID: kbkdJ5H6Rmyk+AJMTqFJ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="250610026"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 18:43:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 18:43:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 18:43:22 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 18:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyQpHk6MO0c+TcYEb+Eqg9zJsddwpgGc46xq5/IuI/4iOL9NGlsj+tovyDvMLf4G4nYm4zQAml8ug14JolB8xq/kMK7QUYwYixR0OCt2C/VFKikN46AiHmkPFj/TGhMAj0ZiCgraakbybbLSVGauSx7eEb3FjcG3qqxK38ojK0WMmCc87QUZP8SSmvKtjLIvRlNXJqy7B1pyQWju6V9S3KNtd3dt7Kyhv7WbJMhGw/YOjQBa1I0KYRba55PjqwrPx7VjEKI8Eu37XNnQOpvQ99i5dWIr0ZtuIqqtbeTLMGygUmFm7e18tLseU+PcG3kRYj8Htm6VODNixsusRlE9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39+d2hXms07Yg5k+N05e1cixRoKu11epZiX443spDMY=;
 b=R/ckmIhdq93I/GQhUuHpk8Ea/ILH7vWlbC/Ci+OsDW8tXIXHkzJZ95ch0z1156ouofRw/yon4gM5W2VhbhswDddZ6WhVDYiedenGg/cdOGPlnZhjLbOxeQPsfcguUrjAh3q0HqC3VpZEICseHl27u+ZYIaRFr/0z/w4Ht8ju8Gs7X3TZjr+wGtL2MEq/0GQTpnOzRWeZFyMeYZqJCiqXb9pXEYYqugPUwyzuqJrx3EHyhN8OA2+Y95kAPkjHAXGsc27PA1P+RtpO4dIJ8K5mfnJEjA4EFFoKDMwcCP5MU16+t/Wt1BIbKn9x9jgL/7mrjyAKXiNPfLReB0Kxhqul9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 01:43:14 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 01:43:14 +0000
Message-ID: <2f605dbb-7bb9-4b19-bf84-1fe100753e2c@intel.com>
Date: Fri, 12 Jun 2026 07:13:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/15] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>
References: <20260608084700.640376-17-riana.tauro@intel.com>
 <20260608084700.640376-25-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260608084700.640376-25-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4be6f1-793c-4834-e571-08dec823f7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|3023799007|56012099006|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: l8y1OQ+1YlR5GrhH2+iNdpVtZB9f23QE+2UlzF5R6Xr971jDMxoAHocB/QpQutSXaVlJIWGW/qq2yiV7lAozlET1fxBaXj/NePPa3bBHEgHLnWu501UudcncgMHcZ0JimQjYGqoIZbLifK4SlH11QThhVqJv1t18FplxRlBeBXXVJesuW2yslhyWFEootDZSY/5wS5YenBH8EZ8lXhE9xbeYHg+FjxKszDBSyKM+glwVFricZqAbr9abSxW3iOLFxrJO2/GKkwjycI4cXJH3M6+UMAvKk384yZKS87I54s6423DYJh2FplkkpEuIuloA7S85+UcgiIGjPBvgAs1DfrHsQzwyUEOOzb8xQ96pbLctzbok+8hVOECc0DokPT26QMA0WF/EwZ4UQ7gsI8R0iJ3Lwiwn3zak76LM+HrwgxRKUIqDml3q45kRgkxfb/LgOMqvpB+ZbCOW6ujIqPmtG3VQn7yH6bZMbG9l3Y+3epqWRVRn7u7TAOcMDSC1ZR3k52CA84GfRNZ4QZ49AAwQkSAZrxyzaIxNqrhmE9cBVCm6lpXk45u8YWc0YcSvarb0GOYiO1aVXzEqGW/c+Oou/u++LaS6O4T8QTnTNfK0lqFVSh/6lIWTz6wW7WiIWnwUiaP4pJkfg8VBatXb2hkCzypg0rbZGOWLGChhwX4C2oL+X1QoylgbNCUe9hctmKuS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006)(4143699003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0QzK1FPSnhHNmxhRnhZbHdnWHpwVTlsMytNRXVTWmV2aEgrRGsyeFQvUTBF?=
 =?utf-8?B?NmdYQmxIdUM4Z0cvUGc1QVY3emJLZ2FoL1A5dXJNN2dvVkRSMlFySWtzOHBu?=
 =?utf-8?B?OHpuek96eFR5aXdweG9QNnR5a3QzWG15Zk5ucVRPQ2JSOHBkZVpWaHNVMWlw?=
 =?utf-8?B?VjJoUHFnUWNHZGhJZkJKNm9VUEhJbWRucDFtSythaWpIN29UdTAvWkllbEVL?=
 =?utf-8?B?UTJrdm9lQis5TCtQUXdVSGtNL0poSTd4U25xMWVpMEJ3TlFRZjYxQjNxRm1i?=
 =?utf-8?B?MXF4Vno5dUtZdWhlSVBvTmJQMjdlNVNORFBNQWppRTNUVURYb3FKeDJXZHlD?=
 =?utf-8?B?d1phMnFaR2Q5enpXN0o2Z1VGeUxqTG9RRVozN01wNTEwK3VGbXE0WEhjcVpa?=
 =?utf-8?B?SWxMb2hwZ3YvVVVSeVhYTi8ySGYvNUFjc1NMNmpreDVOck9pMHJyWGo3bndm?=
 =?utf-8?B?VE80bWI4LzlKdG1VWDI2eGJITW0zdEtibHNrRThtUnlFWXB6eHoxaHRYVWtK?=
 =?utf-8?B?aVovVjNzZklFRUc3WW5malpkeks2K09idWR2dllkd0N0NU5IalJqckhwV3pk?=
 =?utf-8?B?dEJ2R1E2azZvZmtEQS83SDNBdnR5Q1B1NG1ObVNkNnRwSm96NVZVc1d1UVNJ?=
 =?utf-8?B?aDFpczdja2VacGFDYTU2eWVhNlFQZzhXSVA2WTVCWi9KTWZqN2hUUWtYQ3ht?=
 =?utf-8?B?ODBqZkVRZWhCRVovMzhnWlViblE1Q0hPMzVid3dKUFhSZ0ZTTm0yZVE2V2o2?=
 =?utf-8?B?V25kRWtFUy9nOWNwYUlVUHE5ck5paDU3aHlTeDJ0MGdRT3F1dTZ2S0p5VUVS?=
 =?utf-8?B?M0hJTUpvS3FubXdvT3hzT0lhY3NHa3Rjai9zTndkMmR1cFRCOW8wTTVKZnA5?=
 =?utf-8?B?ZE9oMmFOQjVaemkvYUFXaUkrMUQySDF4cmo2SFUrYkZ4WmJsbHFMUTFJbTNj?=
 =?utf-8?B?R1BxOTlxV3J1NFJiVUYzOWhSczBWNGM0YXZmbzdDVHBzZHdpdG4zRWZ0TlJW?=
 =?utf-8?B?eVBNbmY2STF6aFoySGd6eWl2TnhxRXRHWTJRS3JhR2xvMXhsR0IzVjFoVG1P?=
 =?utf-8?B?TnM3cUo2NGRrWkZkUCtrc2ljSGdTQjY3TmhqZXN5SXVMTmVrNU9lY1VDZkpj?=
 =?utf-8?B?RGtHWUFIdzZLYU44WnN2VXVQSTBybUJuZGlZbVV2V0ZNamdoYVgwU2dacnRM?=
 =?utf-8?B?RzhFL29iMWZMMkhDd2RyQUNLaDBlWFd4NTRBak53NW95VXFyWFpRc2R6M3RW?=
 =?utf-8?B?WUY1RXZ3dGFLUURyYmhhY1hLbU5oeDdqNUQvUEcxZzBlQkVaU2Znd2JzMFRq?=
 =?utf-8?B?cmpuYitvYzhyT0VjT0dPRW9udDh1SzdzZHF5ZmowZ0VBdWhLSFJHYXJQVFFT?=
 =?utf-8?B?T1A4czE5UG45YWs0Tzh5cmdKZjdsdTBROUdYRlNKbXl2Znl6WTlOdXFSeHJF?=
 =?utf-8?B?V0VZbXB0L0VXVjdsaktXQUlEQ0wzMkVMM3k3cFNzamRtZjJNMko2ZGNLNGdY?=
 =?utf-8?B?ajVjTnRERm5VRGg3RzNiVHJUNkZFRkJiOStMYTBJcDhDMnYvT3owbTg4L2F3?=
 =?utf-8?B?THlqZFFKUmUxak9qUGRwaVY0dEp6cmpFc1o5YmtXY0h0OWJ2UUlDNkpzdlZn?=
 =?utf-8?B?cjNjQU4yTjk1M0hmckxVc0Z5UUJMUWNDT3BtdmRDSUcreFBwUDB1amVuWmJk?=
 =?utf-8?B?M0twMG9FTnVzWWFKbU1POCtXUTg5dWNXY1VoMGoyck4wdmlkYjV5SXh6cUl1?=
 =?utf-8?B?UWViNlltczJHRVN3QWE0RlEvMUZQRlI5UHRCSHN1MTFaSnBYYnNkL3RNWnVw?=
 =?utf-8?B?TzhRWlJUc0o2REs2RXlRSVFCUWN0RGdRNC9kVkxZcHBlRTNwVzEyRjJCS3dZ?=
 =?utf-8?B?N1hqQ0orbjBrQjZIdWdicmJ5ZHl0U3Vka3I2L2doRGw2bTRQakRUQ1ZKMFh5?=
 =?utf-8?B?SVNRMms0dWVzeXhsZ3lpU1NRdkVOMzdpVFZ0K0hvanV4enE5T2U5eXZGdW1U?=
 =?utf-8?B?TG5zS3BpUUxLWlFIMzE4V1RrYkVqdjd0RWc5QTlJZ3NSOUF5ZWJvc09UVFEr?=
 =?utf-8?B?Y1BjSnJCYytFZDhyMSszZUZvWERnajhJaXpMMGI4cDFoNlViQnR5RkdiTlRw?=
 =?utf-8?B?c2YvTEgvWGRrb1pTMi9lTFJSYlc3dkZXclptUGpuVXFFaVlVRGRJUGpzbVR3?=
 =?utf-8?B?bzQydlRSTm55TWszaFB1ckU4eXBxdjR6SWlOcWZSYUxjWGpJRXhTUkZxbzNK?=
 =?utf-8?B?WTY1bERnOEpYZEcwTUhDTXhOcktUaEZYeDZvVElOYUZNSmhiNVhEQ0hlWXJO?=
 =?utf-8?B?andIMEo4S0gyTVcwUThoMUFDd1M1NGRRSTdnSE50TDJIR2xDMTFhN2RTY3Fx?=
 =?utf-8?Q?LluzJvkbI00xjKyE=3D?=
X-Exchange-RoutingPolicyChecked: epxQSiY9aEih9tCI8r3kMRb1XYz+Ly6chpsHtmV9GyWMP8CP7/sn4Q0WU5dActlxHnZFJCdirxmrAu+Y4PUQ/5JAM/v6Naik9EqqVQbbXs6TaXPotN5jRdFGxcGm+ZOS5U5vLp+mbJMHFDM2fapICwJKFjMm12YGBBGvoqEK/oU0XOj9F6zV1HzQ1QTrYrUbLhEc+KSU489fxiKJ6912cf89eQpDMTPXOk36W+EUjM3E+trGhmA9aOU/Qn+wzQVQTq9j3VNRcOdGFss6Sn89PbfGWmicrabXZ95GjDco1tuVibYjrebCaiZXX6zlGC17i6yTSk3vLFSIyLGJOaXM3w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4be6f1-793c-4834-e571-08dec823f7de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 01:43:14.2745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 265bi8RPDd2QXCzysL1yq3j0F9VBVt6DKScLf1giHMoYUBNNmFUZn0OOk21QyLIY7PK4owmA8AiftaGU1gra78UTtaW1AADvHGcQA4YMjLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
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


On 08-06-2026 02:17 pm, Riana Tauro wrote:
> Add structures and command for get soc error and process uncorrectable
> core-compute errors.
>
> Uncorrectable core-compute errors are classified into global and local
> errors.
>
> Global error is an error that affects the entire device requiring a
> reset. This type of error is not isolated. When an AER is reported and
> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>
> Local error is confined to a specific component or context like a
> engine. These errors can be contained and recovered by resetting
> only the affected part without disrupting the rest of the device.
>
> Upon detection of an uncorrectable local core-compute error, an AER is
> generated and GuC is notified of the error to trigger engine reset.
> Return recovered from PCI error callbacks for these errors as no
> action is needed.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add newline and fix log
>      add bounds check (Mallesh)
>      add ras specific enum (Raag)
>      helper for sysctrl prepare command
>      process all errors before deciding recovery action
>
> v3: remove TODO from commit message
>      remove redundant rlen check
>      fix loop
>      add check for sysctrl flooding (Raag)
>      do not use xe_ras prefix for static functions (Soham)
>
> v4: remove rlen initialization to 0
>      remove local variable
>      add error message for length mismatch (Raag)
>      reset on sysctrl flooding
>      fix sysctrl flood condition
>
> v5: rebase
>      modify log and move it to process_errors
>      modify sysctrl flood check
>      remove whitespace
>      simplify structure (Raag)
>      fix typo in commit message
>
> v6: remove xe parameter
>      remove error_class local variable (Mallesh)
>      move prepare_sysctrl_command to sysctrl layer (Raag)
>      shorten structure member names
>      rename count to remaining
>      fix sparse warnings
>
> v7: rename sysctrl_build_command (Raag)
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 110 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |   3 +
>   drivers/gpu/drm/xe/xe_ras_types.h             |  55 +++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   4 +-
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>   6 files changed, 201 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index c846e98ec6ab..005db8ab9622 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -9,6 +9,11 @@
>   #include "xe_ras_types.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +#define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
> +#define  GLOBAL_UNCORR_ERROR		2
>   
>   /* Severity of detected errors  */
>   enum xe_ras_severity {
> @@ -66,6 +71,24 @@ static inline const char *comp_to_str(u8 component)
>   	return xe_ras_components[component];
>   }
>   
> +static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_compute_error *error_info = (void *)arr->details;
> +	u8 uncorr_type;
> +
nit: Static check needed.
> +	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
> +
> +	/* Request a reset if error is global */
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	/*
> +	 * No action needed for other errors.
> +	 * Local errors are recovered using an engine reset by GuC.
> +	 */
> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -92,6 +115,93 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   	}
>   }
>   
> +/**
> + * xe_ras_process_errors() - Process and contain hardware errors
> + * @xe: xe device instance
> + *
> + * Get error details from system controller and return recovery
> + * method. Called only from PCI error handling.
> + *
> + * Returns: recovery action to be taken
> + */
> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_soc_error response;
Zero initialization required.
> +	enum xe_ras_recovery_action final_action;
> +	u32 remaining = XE_SYSCTRL_FLOOD_LIMIT;
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	/* Default action */
> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
> +				  NULL, 0, &response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get soc error %d\n", ret);
> +			goto err;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_err(xe, "sysctrl: unexpected get soc error response length %zu (expected %zu)\n",
> +			       rlen, sizeof(response));
> +			goto err;
> +		}
> +
> +		/* Report if number of errors exceeds the maximum errors supported */
> +		if (response.num_errors > XE_RAS_NUM_ERROR_ARR)
> +			xe_err(xe, "sysctrl: number of errors received %d out of bound (%d)\n",
> +			       response.num_errors, XE_RAS_NUM_ERROR_ARR);
> +
> +		for (int i = 0; i < response.num_errors && i < XE_RAS_NUM_ERROR_ARR; i++) {
> +			struct xe_ras_error_array *arr = &response.arr[i];
> +			enum xe_ras_recovery_action action;
> +			u8 component, severity;
> +
> +			component = arr->counter.common.component;
> +			severity = arr->counter.common.severity;
> +
> +			xe_err(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
> +			       sev_to_str(severity));
> +
> +			switch (component) {
> +			case XE_RAS_COMP_CORE_COMPUTE:
> +				action = handle_core_compute_errors(arr);
> +				break;
> +			default:
> +				/* For any other component, reset */
> +				action = XE_RAS_RECOVERY_ACTION_RESET;
> +				break;
> +			}
> +
> +			/* Process and log all errors and then trigger highest recovery action */
> +			if (action > final_action)
> +				final_action = action;
> +		}
> +
> +		/* Treat flooding as an system controller error */
> +		if (!--remaining) {
> +			xe_err(xe, "[RAS]: sysctrl: get soc error response flooding\n");
> +			return XE_RAS_RECOVERY_ACTION_RESET;

We can use goto err.

With minor changes

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

> +		}
> +
> +	} while (response.additional_errors);
> +
> +	return final_action;
> +
> +err:
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>   static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>   {
>   	struct pci_dev *vsp;
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 8acfd0ffe48e..8d106c708ff1 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,11 +6,14 @@
>   #ifndef _XE_RAS_H_
>   #define _XE_RAS_H_
>   
> +#include "xe_ras_types.h"
> +
>   struct xe_device;
>   struct xe_sysctrl_event_response;
>   
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
>   void xe_ras_init(struct xe_device *xe);
> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..3ffd7baa7a8c 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -8,8 +8,27 @@
>   
>   #include <linux/types.h>
>   
> +#define XE_RAS_NUM_ERROR_ARR			3
>   #define XE_RAS_NUM_COUNTERS			16
>   
> +/**
> + * enum xe_ras_recovery_action - RAS recovery actions
> + *
> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
> + * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
> + *
> + * This enum defines the possible recovery actions that can be taken in response
> + * to RAS errors.
> + */
> +enum xe_ras_recovery_action {
> +	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
> +	XE_RAS_RECOVERY_ACTION_RESET,
> +	XE_RAS_RECOVERY_ACTION_DISCONNECT,
> +	XE_RAS_RECOVERY_ACTION_MAX
> +};
> +
>   /**
>    * struct xe_ras_error_common - Error fields that are common across all products
>    */
> @@ -70,4 +89,40 @@ struct xe_ras_threshold_crossed {
>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>   } __packed;
>   
> +/**
> + * struct xe_ras_error_array - Details of the error types
> + */
> +struct xe_ras_error_array {
> +	/** @counter_value: Counter value of the returned error */
> +	u32 counter_value;
> +	/** @counter: Error counter */
> +	struct xe_ras_error_class counter;
> +	/** @timestamp: Timestamp */
> +	u64 timestamp;
> +	/** @details: Error details specific to the counter */
> +	u32 details[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_soc_error - Response from get soc error command
> + */
> +struct xe_ras_get_soc_error {
> +	/** @num_errors: Number of errors reported in this response */
> +	u8 num_errors;
> +	/** @additional_errors: Indicates if the errors are pending */
> +	u8 additional_errors;
> +	/** @arr: Array of up to 3 errors */
> +	struct xe_ras_error_array arr[XE_RAS_NUM_ERROR_ARR];
> +} __packed;
> +
> +/**
> + * struct xe_ras_compute_error - Error details of Core Compute error
> + */
> +struct xe_ras_compute_error {
> +	/** @log_header: Error Source and type */
> +	u32 log_header;
> +	/** @reserved: Reserved */
> +	u32 reserved[15];
> +} __packed;
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3caa9f15875f..f49d8dabcf73 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -307,6 +307,34 @@ void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>   	sc->phase_bit = (ctrl_reg & SYSCTRL_FRAME_PHASE) ? 1 : 0;
>   }
>   
> +/**
> + * xe_sysctrl_create_command() - Create System controller command structure
> + * @command: Sysctrl command structure
> + * @group_id: Command group ID
> + * @cmd_id: Command ID
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to create sysctrl command to be sent via xe_sysctrl_send_command()
> + */
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
>   /**
>    * xe_sysctrl_send_command() - Send mailbox command to System Controller
>    * @sc: System Controller instance
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index f67e9234de48..0ba841b0be1b 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -27,5 +27,7 @@ void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>   			    struct xe_sysctrl_mailbox_command *cmd,
>   			    size_t *rdata_len);
> -
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void *response,
> +			       size_t response_len);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index faa973986c0d..93ff0d481d74 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>   /**
>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>    *
> + * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>    */
>   enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>   };
>   
