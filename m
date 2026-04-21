Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331A5F327C8
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 09:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B121D10E843;
	Tue, 21 Apr 2026 09:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMAfxLZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194AD10E842
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776762067; x=1808298067;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=TlZ5rUMqxblARNMDdU/kMdvMCU4luqa7djtNLjzEsTY=;
 b=PMAfxLZdo+n57YjGM9lHRhd4ygFrA/66a2yfZkUnJfQ2CPnAJZONZHtg
 t7Vf8TbQ7HOv14bQnGST3rumPFJxxjMQSs8fq6Z+oMt8uQ7t0zeP1rHOe
 +mqZzeL0o8eUQNonQEPH7HOOl9IzoIvw9M6W0hzM+TdzCcJpJUeU/oB7T
 jw1ZgKDql/ll+h4E8lfC+Eqt1QA5j6O9v105do9lOCt2zKbiMrq7r3r4K
 b4nOfn06sU18iLvThZylDmOnakI3jCGi++cqrvxo+uydC+1c+hTzxNnh7
 sQbewyF+r5Yk2DEDMim155eIyEfWQm6jXbF0oeGDh82fkIWjS75Nt7YT4 A==;
X-CSE-ConnectionGUID: hxawBZ3oRvmsyPdsD9BWoA==
X-CSE-MsgGUID: wEY9HHrKSgKz70hfK+TnwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88767701"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208,217";a="88767701"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 02:01:06 -0700
X-CSE-ConnectionGUID: nfXU/dgPSW+eBu6ZdT35/A==
X-CSE-MsgGUID: qK4EBAhRQWuhTSoTz3Asog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
 d="scan'208,217";a="227344570"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 02:01:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 02:01:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 02:01:05 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 02:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgCGvJp5V6I0zOtZl3nciWyc+7fVXSHhDe44fwCiL0wUH//3FtTu5ynGcURu36YemCTVkGIfjed/D29VDqlLtlJjQM7pBGy6x87OgdQzQRabmdVU0c8s0aSeiXdgSusqegJHB9haleFh31UMOp2/fLd3re5v8rEcAWiqAsN3+HIlWErivJNIw83AJLGB2evzHFUICv3LeyRHBdFeNZSJkMdqPLsfbKjruFibbinn9DZQKnvppb66nw1b6oMnqcXGKsVsxKEZJz/rkq8jwM0pf8uzwLkS9KLNq39/Sl2+AkEgQqnN6Sn28VeNKP34HXz5Yo//jga3anYxP4ACGMW3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0u050Lt6LXe5MzCkLvbPGgIJqYF8CHU4VxZ2EkWJFM=;
 b=OocZWoPhj4DdIX/y24o8d+9YAfbbvDQfQt0Rp4nMEcL4Ji37ihGwQhbzkLNlQStLgot++OLtK+FQibYt7K8Y8bXANGd6V/wvx8AlfEgq0frZKrniIKZgWg6JmUxprSoU7DMsx6pzCwb/EI46oOGfUKN6JXx12HBVhNoSWttEzI/kW+PnHjrxbVREgOOMnrCWLHKR6MnsoOjjBc6DHTtDJnjWg4vWB1tdPvZ75Jr2nG9AMjC/EB79Deu/UwAMgoP0SaddQ0puq1BGHNJIQMofoKrCDkTyLKxkigilb7n8G/MFqZKTBq8fjo0gnMalKeDP4WcN2qGdynok2NXszjRlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 09:01:01 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%3]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 09:01:01 +0000
Content-Type: multipart/alternative;
 boundary="------------rtVBNEd0f0ZJBOu0iEb2lsJK"
Message-ID: <13c7ca4c-a093-433a-bab6-78c96e0d4f7f@intel.com>
Date: Tue, 21 Apr 2026 14:30:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/sysctrl: Add helper to query application status
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <umesh.nerlige.ramappa@intel.com>, <riana.tauro@intel.com>,
 <michael.j.ruhl@intel.com>, <mohamed.mansoor.v@intel.com>
References: <20260407191610.841935-2-anoop.c.vijay@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260407191610.841935-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5P287CA0250.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::9) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|IA1PR11MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: ed344dd7-e21e-4baa-3034-08de9f8482c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: z7oDg9TIwZQCaJMDS1H+EOfvZlkJ19PmCDZhLhoZJnbSRlWZr/ZokZwWNNY2INhAXCm4WoiQNJMW2+A2HCh5zBdmHnK1+PbSyuNKH9C4OtjeOePY9BMUSTXI2gz69gkXyTJjob7kK0K0w/elfCEE2xzeItPD+iBiWkGj4hC/bauJ5U11RN5nz7TtueIlhXBu2CGeWwr7bg7S59UpN5VX1HpCrNMm0UL1Tril8nS+7OBdMmlpn8jj0CAAM2AqX/I0snQBdn9p9zdZlIrHAHJQFjy/YzpZEt2Ew4BqVcdU/K1N6zuCy/54jmNsrrUnCMrqBQyP0o1GSrIS9r8G8ZdxEZbG6166iN/glIfJYrPWPoHnpRrgJ96CFl4GpgWNPux5ptqnb4IjHFPIj2foUgCLV1U0N2Jd6xEBJ75HtGhYqG5qinVzfDgMgRvpqhx+IIqhWbeVCtkYiPgo0nDpuPwwgWcumTn/U5Cn57OUEBSg8L0St4t2AQBIUlxfdA+nm59FiEiv/V7Z0HjeQ4WZaU6bHuDSEiNdOdR6soGODPkL9gwnGf4/VNiXATmSUZsjwFZMyA8bZHP85Afg6wa4gO4ZY5kcbA4ib/9c9VsUrjYEPmd6lN63dQCbVfr9bUYHCjH9Ro0XWdWZ3O6qYJ36cVAm04af5d4WHFKA8mD3RFs5MF3tcTapMNY48t0CEIEohmciBab3cyz8emrNLRy0LWaGe9TLwgeNp86zuGsCAt6RMos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnhtNDBaVERyMmluSTFwdncwTTNnMlREVy96TFhwblRlOTRRNkZ4WEhydDd4?=
 =?utf-8?B?RG56SmwxZzQwU1RIdVJyUk13NXNER2VoY2hjc3dYdzA4SFUzNWVBUG1IZlVx?=
 =?utf-8?B?ZlZNWlFnVlFvWGNiWmdwTUJTS3ZJbFJPU1FjdW5sWFhhRW8yTWlCOVRUT1cz?=
 =?utf-8?B?OFpMNHlCOG9pa1ZvQXEyZHFxdEcxc0YvVG9JVm9uaHpwSjJ6SzFRR3dNT0ZT?=
 =?utf-8?B?eWhGaDFualhSRC9ESmszTG92YkhiZW56cmdhU1ViaFJrUG1sT1dLaVVKYms5?=
 =?utf-8?B?OVlJekUyV2d6MlFZU21LNUtXYjk2NzBKZkhHMWNNalMwL3hvV01sM25kK2N3?=
 =?utf-8?B?VkRqbjlhK2EwSEZWNUdXbG1kR0VZeDRPeVVyWGpnaTJGWW1RVGpsNlZvOCtM?=
 =?utf-8?B?T3NVdFdZL3ZZUytYL3o1dlVzcGZXV2Flb1dxeUxLMnlKSVFLVk00aEhmZUc1?=
 =?utf-8?B?cmFSWXhBRm5naGRDVGFNYXF5N0UzUitKVHlCUFNOYmVWc2k3MTU3SUpFNGZs?=
 =?utf-8?B?Smw4amhjeUNUVTVuN05uRHpjbHIzM09GdUE0QW5kL1Ewc2FTODF1TjZmeFFl?=
 =?utf-8?B?S3IxTmppanhkNmpRWkpiZklHYk5WL2dKTVRuV2g3VnBWWUxJMms4YkpGdTY3?=
 =?utf-8?B?RitMem96TC9EeDg0andQeHJQL2ZQMVVEYjE4ZEE0MnBjemN6aXI1L3VKM1Rm?=
 =?utf-8?B?a2p2b1dUb2k4MlhtZFVyb3A5U2lGaXZyQnNhTmYvR2tvVUVsU2JKSVZXWldJ?=
 =?utf-8?B?N05aU3M2bXhoMWZXaXdmMitnTitUb21TQ2ppZEU2TXpUT21ndXVZNEYvR3Mw?=
 =?utf-8?B?SjVtQjZCTTU4K285REJuM3lsYkJYRjVMcUhicU9kRDJlVzVMZkZIdDJLS21G?=
 =?utf-8?B?T0c5aFc2SGFJaXl4RjFQazRPMjU5bUVOMFFram1IeUlOd004Z1JJTXZDM21Y?=
 =?utf-8?B?NjlXWElsdllDcnp6MjZBTi85QlpCbE9CVjZBWUF6K1JKbHZnVENDd1I3QWNO?=
 =?utf-8?B?WE1GQ25NWjNsdUFiTTJZNEJzRHJhYW13a2lkOUFzNHUzZkpDVkk5Y0QyZjVm?=
 =?utf-8?B?U01neWFqVWJ2b0FuUy9XU0oyV2VxK041N3ZsL2RobCt4TnpzQVZZMUJRVzdE?=
 =?utf-8?B?UXJodHZVSUU4cXpYOGF4MUJxRk1WS1kyOTF5RWVCbUFHVVRnb0RLeFFXcERz?=
 =?utf-8?B?b1RNcUc1NFU2Q0thVEd2aXU4RTMyZXZCbi9yL3VoanNoWllOSzFteDdPbkQr?=
 =?utf-8?B?REdHa2R2dzJtdHB1MGlIa3BtMGdrQk1aZzRER09rWGQ1c21sU0ovWWExbjFz?=
 =?utf-8?B?QnIrTm96akRsRFNSL0RyVldWb05TMG5qWm5vczFJUWp5eFRQb2dhR1FPdndJ?=
 =?utf-8?B?bHpvZXBOQ1UwZ3k4M0xWemZKV09mam5idUk2VTVPOS9CT0FuckJqRDljQi96?=
 =?utf-8?B?cmZ4YlVnTmlPcGtwZndwL1hnSDF6OGtrN3BjaHFZcGVqbFpMYUViT0w5U0dN?=
 =?utf-8?B?d25rTjhqR1JPejNxdGhsMlhGL3BreWk0bXFhQ2pFZGFVMEVidmRBS3RNekNF?=
 =?utf-8?B?dGw2djN6cVRQS0p6OGpWUVVLZ3BvSFFhNVREekZ2eXFvNk1zcEpqc211RlhR?=
 =?utf-8?B?amJVZ2FlczRTc2MyOW1SalVqaFZFeFRSa3lHTlllNmh5cUpLSzk0VGtjeHZk?=
 =?utf-8?B?aGNibnpOWjZNU2hhZmFxOW1SSWxWNDBxai91VHNNVjREQTl5U3NKL0VXTFBa?=
 =?utf-8?B?ejVheTI1cmE5U0dib1FlVG1YOU1UNDZWOFg4N1hkRW5iMGZpclo0WjdWOWdK?=
 =?utf-8?B?bm5rT3doK3pUaWc0YUJmbXA2eEJsR1lXS1owZVhPQkJ5cTd4NVRiV2lMcWln?=
 =?utf-8?B?WkUrSGZvcEI5d29aSUYrRUFOcW4yTEoxT0lLVjNSMkhZaWNHQ29iVkxlUllp?=
 =?utf-8?B?YmRJak9nNHlnSEhmQUpzNlczL09zaUE3aFdzeVNnR0FRWjFqRG5QYkI3UkR1?=
 =?utf-8?B?Nm00Slo0aDFldWc5QmZoNkZES3FYa01xZ3RTUUc3ekJ1KytJS0JYemFrK0p5?=
 =?utf-8?B?aG1xQzY1Y2FXKzkvS2ZBMENRS25ETjlKOG8xbXNtVkltdHdlNi8rbFgrM2F5?=
 =?utf-8?B?MFB4UG9sMFh3ZkxFYzJlM25RRm9YOVIzTjBzbHpDbDV6b3RNalg0d25YUlA0?=
 =?utf-8?B?cUNZZUUvRnlERm41aEthRVJyNWtRL3J6S1BSRmplWU9ocTc5TGdKaW9peTNi?=
 =?utf-8?B?Qm4ycW80ZlE0M1I4ZzVDZFIxM1BwK0lNWXd1NVR5RlhmUmQ4aEZ5YTYzVTdq?=
 =?utf-8?B?TmEvTlM5ZDVZUUNnQngwU0FSUEQwTnF6SzRQQVpZMXN0UVlwc3NJZz09?=
X-Exchange-RoutingPolicyChecked: MgY0qZGDwoabTNKlwFBFB31KxA6k5EAxpEoPxCZY5gsvz9WmPm9VLNefS5PvVHZa96bUsM+WimFh01sEA7ZhCSbEwTuwVDkRezPceZh5X1bez3dunDgy5dmw/zgzQ/mfAKrQ9kbAEtEUyPJ0SCUOLzL3Reao3GBS29j4upUO+4KFEFXZZ8aY2cnndPuYLdi3xEDx4ISx5RUUTRfeht/VRMTsJSCeqhiv7NdJ7eCmsiE2aZQCduj+5h/yYNBe8sImWHH2owK6W3q9No4ADaedANwst70Lu9qvwH8a9rLpbyUwLH/tYhYrbuHPWVwl5XVwSBFmAkmSx5TTV97Hvqolzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed344dd7-e21e-4baa-3034-08de9f8482c8
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 09:01:01.2675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5yYsTcTKzA63J7i1XPrz7C16hXPMc+X2zdk+fN03/BnlEWYtTbGwo/utKPvlnHdPRkeryFLxt+8KhkbccRPoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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

--------------rtVBNEd0f0ZJBOu0iEb2lsJK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08-04-2026 00:46, Anoop, Vijay wrote:
> From: Anoop Vijay<anoop.c.vijay@intel.com>
>
> Introduce xe_sysctrl_check_app_status() to query whether a sysctrl
> application is loaded and booted, returning standard error codes for
> not loaded (-ENOENT) or not booted (-EAGAIN) states.
>
> Signed-off-by: Anoop Vijay<anoop.c.vijay@intel.com>
> ---
>   drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 49 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.c         | 63 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl.h         |  1 +
>   3 files changed, 113 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> index 4cbde267ac44..7e1d88dd1c94 100644
> --- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> +++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
> @@ -62,4 +62,53 @@ struct xe_sysctrl_app_msg_hdr {
>   #define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>   #define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>   
> +/** System Controller Core command group */
> +#define XE_SYSCTRL_GROUP_CORE		0xFF
> +
> +/*
> + * XE_SYSCTRL_CMD_GET_APP_STATUS - Query application status
> + *
> + * Check if a System Controller application is loaded and its status.
> + *
> + * Group: XE_SYSCTRL_GROUP_CORE (0xFF)
> + * Command: 0x04
> + */
> +#define XE_SYSCTRL_CMD_GET_APP_STATUS	0x04
> +
> +/**
> + * struct xe_sysctrl_get_app_status_req - Get application status request
> + * @app_name: Application name (16 bytes, null-terminated)
> + */
> +struct xe_sysctrl_get_app_status_req {
> +	char app_name[16];
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_get_app_status_resp - Get application status response
> + * @handle: Identifier used to control the app
> + * @flags: Application status flags (see XE_SYSCTRL_APP_* definitions)
> + */
> +struct xe_sysctrl_get_app_status_resp {
> +	u16 handle;
> +	u16 flags;
> +} __packed;
> +
> +/**
> + * DOC: System Controller Application Status Flags
> + *
> + * Flags returned in xe_sysctrl_get_app_status_resp indicating the
> + * current state of a System Controller application.
> + */
> +
> +/** Application is loaded in System Controller */
> +#define XE_SYSCTRL_APP_LOADED		BIT(0)
> +/** Application binary is valid */
> +#define XE_SYSCTRL_APP_VALID		BIT(1)
> +/** Application has completed boot sequence */
> +#define XE_SYSCTRL_APP_BOOTED		BIT(2)
> +/** Application loaded as late binding */
> +#define XE_SYSCTRL_APP_LATE_BINDING	BIT(3)
> +/** Application contains data only (no executable code) */
> +#define XE_SYSCTRL_APP_DATA_ONLY	BIT(4)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 2bcef304eb9a..6073c80ee79c 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -14,6 +14,7 @@
>   #include "xe_soc_remapper.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   #include "xe_sysctrl_types.h" /** @@ -99,3 +100,65 @@ void xe_sysctrl_pm_resume(struct xe_device 
> *xe) xe_sysctrl_mailbox_init(sc); } + +/** + * 
> xe_sysctrl_check_app_status - Check if System Controller app is loaded 
> + * @xe: xe device instance + * @app_name: Name of the application to 
> check (max 15 chars + null terminator) + * + * Query System Controller 
> firmware to verify if the specified application + * is loaded and 
> booted. This is typically required before sending commands + * to 
> application-specific command groups. + * + * Common application names: 
> + * - "ocode"- oCode
> + * - "diag" - Dianostics
> + *
> + * Return: 0 if app is loaded and booted, negative error code otherwise:
> + *		-ENODEV if System Controller is not available
-EOPNOTSUPP
> + *		-EINVAL if app_name is invalid
> + *		-EIO if communication with firmware failed
> + *		-ENOENT if application is not loaded
Is app not loaded error?
> + *		-EAGAIN if application is loaded but not booted yet

How about returning positive status and caller can decide whether to 
retry and not.

APP_INVALID, APP_NOT_LOADED, APP_LOADED, APP_RUNNING. In case of 
APP_NOT_LOADED/APP_LOADED caller can retry after some interval for 
APP_RUNNING

> + */
> +int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name)
> +{
> +	struct xe_sysctrl_get_app_status_req req = {};
> +	struct xe_sysctrl_get_app_status_resp resp = {};
> +	struct xe_sysctrl_mailbox_command cmd = {};
> +	size_t out_len = 0;
> +	u16 flags;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return -ENODEV;
return -EOPNOTSUPP;
> +
> +	if (!app_name || strlen(app_name) == 0 || strlen(app_name) >= sizeof(req.app_name))
> +		return -EINVAL;
> +
> +	strscpy(req.app_name, app_name, sizeof(req.app_name));
> +
> +	cmd.header.data =
> +		cpu_to_le32(FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
> +			    FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_APP_STATUS) |
> +			    FIELD_PREP(APP_HDR_VERSION_MASK, 0));
> +
> +	cmd.data_in = &req;
> +	cmd.data_in_len = sizeof(req);
> +	cmd.data_out = &resp;
> +	cmd.data_out_len = sizeof(resp);
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
> +	if (ret)
> +		return -ENOENT;
> +
> +	if (out_len != sizeof(resp))
> +		return -EIO;
> +
> +	flags = le16_to_cpu(resp.flags);
> +
> +	if (!(flags & XE_SYSCTRL_APP_BOOTED))
> +		return -EAGAIN;

return positive status as commented above.

Thanks,
Badal

> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index f3b0f3716b2f..db2743d54cea 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
> +int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name);
>   
>   #endif
--------------rtVBNEd0f0ZJBOu0iEb2lsJK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08-04-2026 00:46, Anoop, Vijay
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260407191610.841935-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>

Introduce xe_sysctrl_check_app_status() to query whether a sysctrl
application is loaded and booted, returning standard error codes for
not loaded (-ENOENT) or not booted (-EAGAIN) states.

Signed-off-by: Anoop Vijay <a class="moz-txt-link-rfc2396E" href="mailto:anoop.c.vijay@intel.com">&lt;anoop.c.vijay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h | 49 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.c         | 63 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h         |  1 +
 3 files changed, 113 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
index 4cbde267ac44..7e1d88dd1c94 100644
--- a/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
+++ b/drivers/gpu/drm/xe/abi/xe_sysctrl_abi.h
@@ -62,4 +62,53 @@ struct xe_sysctrl_app_msg_hdr {
 #define APP_HDR_VERSION_MASK		GENMASK(23, 16)
 #define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
 
+/** System Controller Core command group */
+#define XE_SYSCTRL_GROUP_CORE		0xFF
+
+/*
+ * XE_SYSCTRL_CMD_GET_APP_STATUS - Query application status
+ *
+ * Check if a System Controller application is loaded and its status.
+ *
+ * Group: XE_SYSCTRL_GROUP_CORE (0xFF)
+ * Command: 0x04
+ */
+#define XE_SYSCTRL_CMD_GET_APP_STATUS	0x04
+
+/**
+ * struct xe_sysctrl_get_app_status_req - Get application status request
+ * @app_name: Application name (16 bytes, null-terminated)
+ */
+struct xe_sysctrl_get_app_status_req {
+	char app_name[16];
+} __packed;
+
+/**
+ * struct xe_sysctrl_get_app_status_resp - Get application status response
+ * @handle: Identifier used to control the app
+ * @flags: Application status flags (see XE_SYSCTRL_APP_* definitions)
+ */
+struct xe_sysctrl_get_app_status_resp {
+	u16 handle;
+	u16 flags;
+} __packed;
+
+/**
+ * DOC: System Controller Application Status Flags
+ *
+ * Flags returned in xe_sysctrl_get_app_status_resp indicating the
+ * current state of a System Controller application.
+ */
+
+/** Application is loaded in System Controller */
+#define XE_SYSCTRL_APP_LOADED		BIT(0)
+/** Application binary is valid */
+#define XE_SYSCTRL_APP_VALID		BIT(1)
+/** Application has completed boot sequence */
+#define XE_SYSCTRL_APP_BOOTED		BIT(2)
+/** Application loaded as late binding */
+#define XE_SYSCTRL_APP_LATE_BINDING	BIT(3)
+/** Application contains data only (no executable code) */
+#define XE_SYSCTRL_APP_DATA_ONLY	BIT(4)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 2bcef304eb9a..6073c80ee79c 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -14,6 +14,7 @@
 #include &quot;xe_soc_remapper.h&quot;
 #include &quot;xe_sysctrl.h&quot;
 #include &quot;xe_sysctrl_mailbox.h&quot;
+#include &quot;xe_sysctrl_mailbox_types.h&quot;
 #include &quot;xe_sysctrl_types.h<a class="moz-txt-link-rfc2396E" href="mailto:/**@@-99,3+100,65@@voidxe_sysctrl_pm_resume(structxe_device*xe)xe_sysctrl_mailbox_init(sc);}++/**+*xe_sysctrl_check_app_status-CheckifSystemControllerappisloaded+*@xe:xedeviceinstance+*@app_name:Nameoftheapplicationtocheck(max15chars+nullterminator)+*+*QuerySystemControllerfirmwaretoverifyifthespecifiedapplication+*isloadedandbooted.Thisistypicallyrequiredbeforesendingcommands+*toapplication-specificcommandgroups.+*+*Commonapplicationnames:+*-">&quot;
 
 /**
@@ -99,3 +100,65 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
 
 	xe_sysctrl_mailbox_init(sc);
 }
+
+/**
+ * xe_sysctrl_check_app_status - Check if System Controller app is loaded
+ * @xe: xe device instance
+ * @app_name: Name of the application to check (max 15 chars + null terminator)
+ *
+ * Query System Controller firmware to verify if the specified application
+ * is loaded and booted. This is typically required before sending commands
+ * to application-specific command groups.
+ *
+ * Common application names:
+ * - &quot;</a>ocode&quot;- oCode
+ * - &quot;diag&quot; - Dianostics
+ *
+ * Return: 0 if app is loaded and booted, negative error code otherwise:
+ *		-ENODEV if System Controller is not available</pre>
    </blockquote>
    -<font face="monospace">EOPNOTSUPP</font>
    <blockquote type="cite" cite="mid:20260407191610.841935-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+ *		-EINVAL if app_name is invalid
+ *		-EIO if communication with firmware failed
+ *		-ENOENT if application is not loaded</pre>
    </blockquote>
    <font face="monospace">Is app not loaded error?&nbsp;</font>
    <blockquote type="cite" cite="mid:20260407191610.841935-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+ *		-EAGAIN if application is loaded but not booted yet</pre>
    </blockquote>
    <p><font face="monospace">How about returning positive status and
        caller can decide whether to retry and not.&nbsp;</font></p>
    <p><font face="monospace">APP_INVALID, APP_NOT_LOADED, APP_LOADED,
        APP_RUNNING. In case of&nbsp;</font><font face="monospace">APP_NOT_LOADED/</font><font face="monospace">APP_LOADED caller can retry after some interval
        for&nbsp;</font><font face="monospace">APP_RUNNING</font><span style="white-space: pre-wrap"></span></p>
    <blockquote type="cite" cite="mid:20260407191610.841935-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">+ */
+int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name)
+{
+	struct xe_sysctrl_get_app_status_req req = {};
+	struct xe_sysctrl_get_app_status_resp resp = {};
+	struct xe_sysctrl_mailbox_command cmd = {};
+	size_t out_len = 0;
+	u16 flags;
+	int ret;
+
+	if (!xe-&gt;info.has_sysctrl)
+		return -ENODEV;</pre>
    </blockquote>
    <font face="monospace">return -EOPNOTSUPP;</font><br>
    <blockquote type="cite" cite="mid:20260407191610.841935-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	if (!app_name || strlen(app_name) == 0 || strlen(app_name) &gt;= sizeof(req.app_name))
+		return -EINVAL;
+
+	strscpy(req.app_name, app_name, sizeof(req.app_name));
+
+	cmd.header.data =
+		cpu_to_le32(FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_CORE) |
+			    FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_APP_STATUS) |
+			    FIELD_PREP(APP_HDR_VERSION_MASK, 0));
+
+	cmd.data_in = &amp;req;
+	cmd.data_in_len = sizeof(req);
+	cmd.data_out = &amp;resp;
+	cmd.data_out_len = sizeof(resp);
+
+	ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;cmd, &amp;out_len);
+	if (ret)
+		return -ENOENT;
+
+	if (out_len != sizeof(resp))
+		return -EIO;
+
+	flags = le16_to_cpu(resp.flags);
+
+	if (!(flags &amp; XE_SYSCTRL_APP_BOOTED))
+		return -EAGAIN;</pre>
    </blockquote>
    <p><font face="monospace">return positive status as commented
        above.&nbsp;</font></p>
    <p><font face="monospace">Thanks,<br>
        Badal</font></p>
    <blockquote type="cite" cite="mid:20260407191610.841935-2-anoop.c.vijay@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index f3b0f3716b2f..db2743d54cea 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 
 int xe_sysctrl_init(struct xe_device *xe);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
+int xe_sysctrl_check_app_status(struct xe_device *xe, const char *app_name);
 
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------rtVBNEd0f0ZJBOu0iEb2lsJK--
