Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C2CDB471
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 11:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EAE10E073;
	Wed, 24 Jun 2026 11:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gh6sJtrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A972210E073
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 11:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782301894; x=1813837894;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ctugkUb4q6nbN/w6QQ8i2lY8chuvhJbH25Y4KH8r/JE=;
 b=Gh6sJtrDrQHm0IFzqND5wMU2pKZZVMw0ECBN9CXu9DT5wFyqvQpebLS9
 Kc52x2vNVofQVOtkLl0JB4WKB7P4Pi94+nQPqPlNfe/0popVj6sOhsMlU
 iesYh5iwmZUN7BsmMIIm6ZVBzqVxSSsLnuAst5whNiqO2eybwSC0nw6Pj
 3QFF7+YDqahVUfFNkfS9kbvtOr2atAkyKSR9p3zSRJ7qqMfvCs4dayfTU
 g0I/+M228x3adv7aevU86zN2vaaJfsuwG/rxQsdg1Ac0WDvUqjaAbL5Oy
 h4VwxzyExHgiD5sNIWa3Db3eNXb/bk4Baijx7/8aXldsU+h9SmKyj3tyj Q==;
X-CSE-ConnectionGUID: CghqxKIgQ76FWYVGA997jQ==
X-CSE-MsgGUID: LINQShWlSU6qqkeKzUoWGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93417825"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="93417825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:51:34 -0700
X-CSE-ConnectionGUID: l7ZHPvtpQgKIJpuj9CwB9Q==
X-CSE-MsgGUID: u/wjbe8EStu/F4WICGL8Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="254191409"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 04:51:33 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 04:51:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 04:51:32 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 04:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kp/sWKggmijc5IRWrgV78rBAkryAC4zlFEOoh/Xl6lFGdmE2G7BkWNLfKQitbyciLR86xPpaPDz4ykauNAErKIMX+U0rJE6CLWsEiK8zlR04X+oaI0eEMbsw+FXpkgFJGVzOSUI+nwdBFTrlc+tNLWtVSTGuOOsy04hsN7+70SXRk2GtkIX5D3Wnqtu+4KWbG6e7ZAY8g22T8dgWcpUvWLRDGDPmHsbDMMF5hUJx8RWMnsCzb7F/oDhnROlUMmP/qvpzy0UGPpad49fHEVB7X1W9lEfKjkRRJeboPB4Tit97otjq/ojpzyVT5Qi5jI1jnsKMssHAVpTQ/PXMkFS5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7XGAQ++s/m8uvQ1C2WdsjBZ3xAgngCKWNHBxZlChzs=;
 b=f6G87ksNFFI4vPSvwZvtgGsirMsguEuPCjfOIPJchSd7Z4UWiWwbfRmPz2rUAh2dKi6k1mO/oHQFrcJFGGi2Mj1oP6wihNNCnj3MljdyZqB82Osh7Ml0V9hfCWwzwPWSO/VJWMMkl8Eq43Y8gazI8uPCPSnQVOXfasf+402p6cxK9k2QRUCBcaGK2SB+zpYu9CJht4MzJvQDhY5LnWC4okuL5QhOIbPh9fCpCpm8E34Na8qb5sDY/Dj5OBNnDd9d06s6viL+jcXs0/EUrvgKyprMJt3TIgrKi47A7OTq0/Q2uiRgPgFUtvP6iCZsZmStuoyB692lnNXWqc46ZG8WrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by BL4PR11MB8845.namprd11.prod.outlook.com (2603:10b6:208:5aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Wed, 24 Jun
 2026 11:51:29 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 11:51:29 +0000
Message-ID: <c06980ee-87ca-4cf8-b5f0-214486eb989b@intel.com>
Date: Wed, 24 Jun 2026 17:21:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] drm/xe: Add error Signature IDs for RAS logging
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-6-mallesh.koujalagi@intel.com>
 <db58c7ea-8d55-40c6-9fc7-b69878a02505@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <db58c7ea-8d55-40c6-9fc7-b69878a02505@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0276.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::19) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: ac614886-7032-45ee-9716-08ded1e6ed79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|6133799003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: uPelI25FpIeMfCjOAYsoFLPxXH2rpJ94AYUMRP++Cp5VrCnMGCZlIiKQ4u5Qd9p/si0HoUP6PRmQbG0xUM3gmncFhRQd+rREDhhnZaX61oEpAez3HInNy4UHj5cxIfPdEfOcJPPdI0KePeu3UQ099yOT6r3+56Wa+6HEtgKld9EBi7PDlganYDnnUCtMkNnh7tj3noekWlkIdTWdHrKfp+qnUVeG+nPxhzX3k/ceLqNDgCrvt8M8IpApmjGMdKrd397Dk+s6cUinFpFqrUoxVLA9Mjj40XTbSLJqSxaiGr/y+s2AnSd9xFIfrAvQhzKy0pVqc41O1XSIVaoeQtjhjhBHHzDWzEbK/OH62gspdz7Fw5P+ek8Fu7k2YKpiCby2F/BCVzyGHNErjYE/ljKonOcTXuN+Iaj8vVLxbpz7JBGSS9AYFuaPHD7D8DvW1IBoSe84Xx+wRytt9kUdnJO7oofP+DzgUCZ38YH0rh9Xm3ygecbELNSADDQuFgFKqCB3Cu1qevEd2ZRSrUzbwRVAx9VqQZBRuJlqjU9YOmtBSiziuxe6X4zcI9uIDuO/fTYEl9D/HIRHvCLZnNXuHchO6Z6DCBP3k3+HT02aa/07bK1Yn9/ZF2J9kvzya2btCp/V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzUxMWpEOTZaaHdPVlB4YlNCQzhkVHkrVVgxZ1V5NmpJRGZzNDF2cTBZYnh5?=
 =?utf-8?B?M0hQdlcxcHJKdDBtRTl1L1BTZXdpTm5iOGhlTXF2d09FQUE4NWpidzFCbXIx?=
 =?utf-8?B?QmZsaFNsRmxqQ25FVXRJYU9aSFp3eDJoTURNd2RrYktMaTZJRk91d1UxeGNI?=
 =?utf-8?B?VXNqeU1KSkEvSm1WMCs3T0cwWXVNSUpRNFpMZUdoMURRU2Z6NDR0bi9pY0lK?=
 =?utf-8?B?bXdpbE4rbzdQYnRUbXRwaFdQUVh5a211WDhPanJrVHp5SDRVSlE3ak5kTnh5?=
 =?utf-8?B?aTRFMFhCdkhRVit6b3l0MGhZamh1c1RodmFlMSt1VUlnTjFTREZ3cDZNQytH?=
 =?utf-8?B?S3M2YUlPbnhKKzlBY2VMWUxkLzBhY2hHSGc5VjJZcEhidThHRnkvdVBuQzNG?=
 =?utf-8?B?ZWVaemFKeTNNTGdqUDFTWnY4K2t4ZG1id29mWGpWOVlPZnN4SkRDVGhhRVFr?=
 =?utf-8?B?eDlFdFZ3ZUtJMnQ3d1BnTFo4clZXeFFUcUErRDlseTVrRkEwd041WEwyakZx?=
 =?utf-8?B?L29Tc0VoVFdtc3lPVmlVLzYxTVdycEZSMU9JMWxRTENpZStaV0FpZHNQaGQv?=
 =?utf-8?B?RzhzY2VUdG01Ti9rMjd3SWZyK1hjdmhtaW1STWp6SWdsdDBmenNqMjR4OEU0?=
 =?utf-8?B?TGgvZkJibnZjNElGRnUxWWRHaEExWDdlWWgxQWhUYUNRdVIwK0JrclRKSWw2?=
 =?utf-8?B?cWJ5ZDBlTG5VVlhYeVh5MENiMWErZFNTMXAyL2JlRjFjZnJiUm1aK3QySXVF?=
 =?utf-8?B?VnUySHY0cFZGbFFvQWFld2xSaGZmalUzODJ5eEtKbHJCRTdPeU1YTStmazdP?=
 =?utf-8?B?YlllRHhZbUlOSnlXUjAwOUVmc3FNV2g5Y3Uwa3V2OE1SRnFxNzVVN2RLSE9t?=
 =?utf-8?B?ZHRBc0NhZVFxRUVCMjNqUWNtZGUvZ2NUNjg1RnBsKzhCT29NbkQyUGlkOHVj?=
 =?utf-8?B?THVYT2JYYStZMjlMUHBmc2NkSTQ5T2JEY0lNREVuQXpxTWdNNFgyczNGdzRE?=
 =?utf-8?B?OHRtMWtveDlqQi96RWVDZmw1RUplQTlDMVVWM2JaUllieXZZZGtMTUYxMmJV?=
 =?utf-8?B?dUhLUkNiZXpLMkVPeFlQL25DYzhFNVN3bFUzZWZYd0hhWmpRdy9JWGpQZWtx?=
 =?utf-8?B?bk1vQS9oQW1ucllvbERnQ2ZvTEdRVnlqemFJTzZBeW5ST053c1VUN25YN1dP?=
 =?utf-8?B?MDg4Nm4xRTQrMnJvaGVkWXVGY2NjY2RqemVkUTcvWVNCdkx0eVQ0VXpCRWNz?=
 =?utf-8?B?cGNNMGkwNFZvTHprU0N3cXlJQjJSYW00WHlrNFB5dEt2NDFId3FNaEh4UVZB?=
 =?utf-8?B?MUhWeFhWQzhlcTNHTDFYRnYxZWZsTXJBSE4xdnRUUGVFR0VVdVcwOXB3dEtw?=
 =?utf-8?B?Z3gvYzNkQWNEeFB6QjR5MitQVkl6RjdDTThzbm1jQjNYZ0NVZDQyRXA0b3gx?=
 =?utf-8?B?clJkTGZpZDRjQk92eTlaL1BSbHEvYWFJNElJZEE2QUtRaXVsY0I2Vld0UUpl?=
 =?utf-8?B?cGl6NmRIT2FFcmlzeDRFZUpFVzgrNWNYN0pLWWdPNFo5NmswSlhpOG9Cbmlq?=
 =?utf-8?B?cWV3YkpMK3JCOTNQVCt5UDFXQk4xc0tQSExPV1pBRS9nME5ZSXJiUGlMcVY1?=
 =?utf-8?B?TzBxeUx0b245NDAyV2V6S0UwdjFwQWdVaEJkdW9SMytCbDZkSjRpd3JGVUkz?=
 =?utf-8?B?QkVaQjg5TmUzdkVTcWV1NjJCQVg3Yit4MDZvU3gwcDdXNG12VjZNOStnUnUw?=
 =?utf-8?B?RlF5M3ZNMzRTdFlabWJoT0hMYWprbU5UOWFSbTQ3Ti9wczYxRjhJUEhtdkRY?=
 =?utf-8?B?TE1ZK1VldmYzWWU3MHh5QkxKck95a3VGZVBlMURJSnhQUk1KQTZSdHEvRW5o?=
 =?utf-8?B?QlZvTnVVcFo2UVVSdXNaZk4zY2JsbnpjeW5QVWhlZTZlVEw2RXJ0M1NjNWxB?=
 =?utf-8?B?YmM4SjRzTzBLOG5FOGFyZ2FDdXpDSE92dDRZR3lDZ1FsQ1oySDh5b296WDVI?=
 =?utf-8?B?bUt0bi9NeUtSVFYwQ1dDTHVKcE1lL1pJeG53dDJlUU9FTmtRb1F6U1ZXQllV?=
 =?utf-8?B?WTZEMnVnNGhKU3dKZkx4Ri91KytCQTNvbTBSQklRNjhRQlRoUWc1b0VxTzMr?=
 =?utf-8?B?TDNKSVFRVlloUUJyb0hhUHIzWXR3ZmlyeVY2Z2NRbzVuSHlKYS82MkQrTlh1?=
 =?utf-8?B?SXNRN1dEaFc0bThKSU5iY2dqOFVNWUZrVzA1RHlhclZ4Q0ZmdTRQblI5TG0v?=
 =?utf-8?B?aWcxNXM1eFFSdVNtckZab3pDZy83S3V5VUZ3MWhoWmlSSVNjaVNKMnUxc1pz?=
 =?utf-8?B?dGp3RHdvU3ZlSFo2eTdwdFFFMk4yamt5K1QvajFsYnJaL25OVGR5eUw5ek81?=
 =?utf-8?Q?LCeaKXeZqrqHTh7I=3D?=
X-Exchange-RoutingPolicyChecked: eY8XJzkYUUkv6c9UfZQWj/TzOoj/OZzG07mOLOlG4X0LigiaC10v4wzoYD+XfY4QTMw+tL6NfP4FBZm1ozEkmwJOh3j9zcnqrBBrtaKj5pbhlRdh4qJbaxI1azWwd01XWxPe7gtVh8BoGfUgnvNEfZ3DVJrZM9n7k4heqpYTS3RGAYQwSWkoCka6U6x698QYocrCoJ4aQj4wjRmothhrRVQF7xiZYYVg/7AKhSV4C2rb8htvQ03QT5Nb6vcOfE3coOYFR0xI0cDtvSEnWDYAWZy+0PgAiY6jwUUb73f1B52VCoB6U+GfciEKOmC4D3Qwp3ZJKwvHU/R1sxd2LPqG9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac614886-7032-45ee-9716-08ded1e6ed79
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 11:51:29.4227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eT8sDSHGNmScjJV2JakpXHNHT4s9aAa32Dshqn55WM3q6/xnIuEfrdxqvKk+91F6n4QtLlZ3bhijHy60qXFa5qxlyXwiO6NpuRl7v3i5gy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
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


On 20-06-2026 10:32 pm, Michal Wajdeczko wrote:
>
> On 6/17/2026 12:47 PM, Mallesh Koujalagi wrote:
>> Every GPU fault needs a stable numeric label so monitoring tools can
> so the goal is to assign unique number to each GPU error that we report?

Thanks for questions, happy to clarify.

Not exactly. SIG_IDs represent types of errors,

not individual events. For example, XE_SIG_WEDGED = 2 just mean a 
"device wedged" error happened.

Multiple log message can share the same SIG_ID because they belongs to 
same category.
>
> can't we teach the monitoring tools to use the message pattern instead?

We can and that is basically what HW_ERR "[Hardware Error]" does today. 
But that approach is

fragile. If the message tech changes (Wording etc) the pattern can 
break. So that is reason a

numeric ID like SIG_ID is more stable and acts like a reliable 
interface, even if the message text changes.

>
> or maybe it's not about unique signature but rather class of Xe GPU errors?
> like HW_ERR defined in [1] for generic hardware errors?
>
> [1] https://elixir.bootlin.com/linux/v7.1/source/include/linux/printk.h#L118

Yes, that is the closest comparison. The difference is that SIG_IDs are 
numeric, specific to Xe

and designed to work with CPER.

>> identify what went wrong without parsing log text.
> hmm, but they will have to parse this text already to find that ID

Fair point, I'll fix the commit message. Tool can identify what went 
wrong by matching the stable SIG_ID field,

without relying on message text.

>> Add xe_sig_ids.h
>> which defines those labels, called SIG_IDs.
> SIG_ID looks like an acronym already - can we know the full real name?
SIG_ID expands to “Signature ID.” which is mentioned in the Spec.
>
> the 'signature' suggests uniqueness, but below definitions are more like a 'class' of errors/faults

It designed function as a stable component/category identifier for a 
class of errors, with the specific cause carried separately

errno, message text etc.

>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Add HW SIG IDS details. (Riana)
>> ---
>>   drivers/gpu/drm/xe/xe_sig_ids.h | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
>> new file mode 100644
>> index 000000000000..7badd0d7ad72
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SIG_IDS_H_
>> +#define _XE_SIG_IDS_H_
>> +
>> +/*
>> + * Driver SIG_IDs
> please add kernel-doc for SIG_IDs itself
> maybe then it will be clear what is it
Sure, will add in next revision.
>
> based on the "Every GPU fault needs a stable numeric label"
> maybe the more appropriate name would be names like:
>
> 	XE_ERROR_
> 	XE_FAULT_
>
Agreed, need to check with Arch team.
>> + */
>> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
>> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
>> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
>> +#define XE_SIG_FW			4  /* RECOVERABLE: GuC/HuC/UC/GSC/CSC/PCODE */
>> +#define XE_SIG_GT_TDR			5  /* RECOVERABLE: engine hang / reset */
>> +#define XE_SIG_MEM_FAULT		6  /* RECOVERABLE: VM bind, page fault, GTT */
>> +#define XE_SIG_IO_BUS			7  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
> at this patch, there is no description what FATAL or RECOVERABLE (severity?) really means here
> also, if there is a strict relation between SIG and its severity, then maybe those definitions should look like:
>
> #define XE_SIG_PROBE			XE_SIG(1, FATAL)
> #define XE_SIG_WEDGED			XE_SIG(2, FATAL)
> ...
>
> but

Agreed. For driver SIG_IDs, severity is part of the contract, not just 
an incidental comment.

Sure, I can add the severity details in the header.

>> +
>> +/*
>> + * HW SIG_IDs
>> + */
> below SIGs do not have associated severity
> why the same family of IDs is defined so differently?

This is intentional. Driver SIG_IDs are paired with fixed severities via 
the driver logging macros,

while Hardware SIG_IDs identify only the hardware component. Hardware 
severity is not fixed per SIG_ID,

it is carried by the incoming CPER record and may vary per event.

>> +#define XE_SIG_HW_DEVICE_MEMORY		8  /* Device memory errors (e.g. ECC) */
>> +#define XE_SIG_HW_CORE_COMPUTE		9  /* Compute/shader core errors */
>> +#define XE_SIG_HW_PCIE			10 /* PCIe interface errors */
>> +#define XE_SIG_HW_FABRIC		11 /* On-package fabric errors */
>> +#define XE_SIG_HW_SOC_INTERNAL		12 /* SoC-internal errors */
> what's the plan for extending SW or HW SIG_IDs in the future?

The current scheme assumes driver IDs are a fixed low range and HW IDs 
occupy the next contiguous range,

with range alone distinguishing Driver vs Hardware.

> as now it looks that will not be able to have new SW IDs together with old ones
>
> and I guess the goal is to not change the IDs assignments

Yes, the stated goal is stable IDs.

Thanks,

-/Mallesh

>
>> +
>> +#endif /* _XE_SIG_IDS_H_ */
