Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6113CE6F07D
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 18:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF9410E9F8;
	Fri,  1 Nov 2024 18:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZSkXUW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA09510E9F8
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 18:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730486756; x=1762022756;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v1a7OlZ3ovaJyVLp7uwLNj61VY+4cSDmM/08MG3ZUiI=;
 b=OZSkXUW38FYqGiz45O7O5SpRWSIV8d3ml0JNVHdYdePC5bfkU6Vdp6jM
 k4bfcymuWA1UTXWndVshJQP8YF8Dchx9isyvm/FheMM0PIDd0cRVbZXpO
 axq1d5h+trNzX0fAq6bIaoOQ3Jw1Awuop/zVSOYqwnWxbQ7ITWIesTIkT
 z70nJfw+EsrzA9ONhaHnLk+bb1BUu0ViHKuF25qP98hbmtnbABVaXkYHa
 je7JFtL42WjgHiArVArPj8GT6Xk+x07wZyszDL8rTJGfjw01omSfttE3k
 HhHSrUB8nP4MaBqhubCTMj8SFo0wIIUvD/bDoasDEQKmUiFf4jpwQadXn g==;
X-CSE-ConnectionGUID: duLOqAhaSxynZRSwf4LAWg==
X-CSE-MsgGUID: qN4058YeQG2qpP3aADZhWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30217339"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30217339"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 11:45:56 -0700
X-CSE-ConnectionGUID: aMFqcc6BTCixBCA3dgTHMw==
X-CSE-MsgGUID: HFm733/2QmukcUKwd4C8Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="83866399"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 11:45:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 11:45:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 11:45:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 11:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNsoGSfRf9VDztjzdYxEoiNBq0nD65efZfTzKYFXNzYJz5G5RhI3pAOxm2yql/BYbhPuD9boZQa+dqAZPRCnAScDJnUf64HpLSwKALr5QyfNqxoRaSDlpWHD6+fPv0kYcKjzi5x6JP2yQvyMz/GzeWKg0f/al/dpe+mQOVhlfAUD6NUkowMRW2FuZ7KAaTyxmyz1JvkDh5pyiDXBO3p8ba8HWJ4z+JKCW+u5ZOAYBSQovRgw0khMhSNeZlYs3fdaVFseb+Mv+llUQLgLwoV7/TJJXw/n+nxd5th9hcqlJQPwwPRNOl5WBLBwng6Eq8QkVFs3l6bmdyCqJPtMsV+OtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6O48AjghXh6uZXCiEpzR/GzSEvRp8cW0iCnP3yGLXw=;
 b=LgLmL5+DXHvNPvHXojHutX4GdCWTtXNQMDAXylyhrxCjgpfSCYTzMV6RMVt91P2CJo3JSi+pk2Dqueg5L6eiwpLW0p2K55C8sMr4vxdb+fHGcDrurc+9aM/szrX2ObPNlQuuv9nIIw7jUuQftwmHcAN4U6N/5hUbvcl7nKGbuxLYe6NA/tgfw7qFxv/3sTBjDxDKmNAVWOMyERCCOsOq4oo8wANHIc20OBPwDcmYvM2SRjFXwUd04w3VsaC+hRLX9bArMyi2BUWgseX2yC9OEbb2tir3FJ2IgGDIGxWo1oZMMI+fMmFsRAqmSjNewPGEsiPO/KN7YkkkSSR1PWhE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 18:45:52 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 18:45:52 +0000
Message-ID: <6a317425-bf13-4269-b510-04a765c3cc23@intel.com>
Date: Fri, 1 Nov 2024 11:45:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_guc_ads: Add whitelist registers to write list
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <matthew.d.roper@intel.com>,
 <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>
References: <20241101180403.97272-1-jonathan.cavitt@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241101180403.97272-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:303:85::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 086f3eee-5da7-43d5-28d9-08dcfaa56924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1dLN2pudGE5WGpCQ2JlYWtINUJYLzdpbU5OK05TbTlsRXRYZWNVY1ZoMzJJ?=
 =?utf-8?B?ZU9qSXdUbDVjMEc0aFljYVowQmxzOUE0Zm4vZER5dWIreEllRnJpWXA4VG5s?=
 =?utf-8?B?UU9HWkFVajIxZHZaa1YvN2dpa3krRHFWc3JpeVptRncwalh1TnAzL3FqR0Fj?=
 =?utf-8?B?ZFU2VDc4WnpBU1FMZjk4YlZScXRJUVRQemc0Uys1d0hjK0RZMzhKUGFKK0N3?=
 =?utf-8?B?dzY3VVRxWkZUcVVBVVNIQjNPczltckFjYmVNb0dVZVV2WjRPOU4zNVJMWXdF?=
 =?utf-8?B?Q0Y1MW1uVW9Vc2ZSN0Rza3VIbjhuMU56RkJoZThKRHhiMVFYSXYza05hWk1u?=
 =?utf-8?B?bmxZMG93UE9xZTg0NnIzaDVKcGZZQjhrWmgzbWZobDV3SGt4RUJNejN0ZzdS?=
 =?utf-8?B?Mjg2dk1xTWFrcU8zZEpoU1FVaFcvemlrZnltMmEwREdGMnlPZkFZcWR2RzBl?=
 =?utf-8?B?SVVtNW9tbmdnclRNOWt5UFBORmV5QkVmRE5kdE1HbmwzaTdvWCtYUWtidmw0?=
 =?utf-8?B?TkthUFo0c2crWDFZOXVONEJYTElUUzJTcWFvQ1hMU2crdVNMWWxHSDE5MUxF?=
 =?utf-8?B?dEY3VEpCckc0RzFKNWdHYmNqV0dwb0phRmhva3EwU2JrZHdpZWtSSlRaNHBI?=
 =?utf-8?B?TENraGNQd0JVMkU5VUR3ZStTMGlCT0k5eVczQVMxY0RwV0hFTUZCUVNGVkt0?=
 =?utf-8?B?TWdhWlkwVHZINm9VSHZhTWVaWE04eENPWkFxcHEwMm84S2RiRnNlWDYwNzc5?=
 =?utf-8?B?WDZZRitqTWRycldyODF1cXZScU5BL21mV05Da1E1SGxQd3JpcExEeUd1VW4z?=
 =?utf-8?B?aXFERmlER1d4Q1lvSXhBV2dsN2tlUXBBekY0MnlNMjR0ekYwdFBQQ0JGSDdV?=
 =?utf-8?B?UVJNOFFxOVNYMXJUQmNSZUZnYWtKSjNoWDFhbytLbVVqc1c4K2M2aC8rT0xn?=
 =?utf-8?B?allJYTNSNUFiczJVSVBOdG9SeGhYbC9sZWhoOEhVNjFrL3lNYkpGWVJZQ3ph?=
 =?utf-8?B?MWkwak50RHpCb2pMdFFQL0ZQQkxtMTZUZG1ydXdTdW9ZeU9yNHZ0VHJ2cThh?=
 =?utf-8?B?Z1g5aVRSbmFGbEZvTlQ3enN0anhJSzE5bWgxTDh3UktFdVB0OVpyL0xHclMw?=
 =?utf-8?B?WlYxNmdZMHN0ckxtdS95M0VuOXd4UkxoaU56dUxYN1hyL1kxVWtPQ3c2ei9G?=
 =?utf-8?B?VmFJMkVYOVpVTFdtR29zbDV4TWcwbzhXa3FqWHVrTDd6dFVqWVo5MUlKTFR4?=
 =?utf-8?B?S1Q0TUhGTzV1dW40MWliRHlZNWtFNTBqYWRUS1FXNXgxU3J6RTBpTlBZUVMx?=
 =?utf-8?B?NXU3aXVrNVdVeFQyZVdOcFVXakZHN2lhMU9ULzJyZmhYT2JrK1l2YVV5d28x?=
 =?utf-8?B?TzEwLytZVzlqcnJoSjZ5R0Z3OTUwTjNSM2xpWDc3VEpheFJ6b3lodFlvRlMx?=
 =?utf-8?B?cndxckhmeHluSXVTaDJxcm8vdzdCT0V3cFZ3QVNrMS9pWEVPZGk5UDhwUXpO?=
 =?utf-8?B?YWpQWVAvL1NSUzNZbXYvK0pJQ2dmeHNmTWcwZmIwNmpURnRLTTBzckNIQzFY?=
 =?utf-8?B?VUV1WWg3djBzNUVMeURrSVhVV1I2TWZ3ZFA2STVTR3BwY3JqM1MyOEtGNkh4?=
 =?utf-8?B?MjJHNVNNOHphT0N0L0ZmSG5iNjJPaGNBMUloTEUrWXp0ZnVldGdUOEYrQ3BF?=
 =?utf-8?Q?6sQCj6m8xMHmUeY2Ns0u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Znh3cmtWeGRxOVpVTzJDZDlZcExRSkRXb0JqM3pXNjBtODVFTVEwYVRnMmlz?=
 =?utf-8?B?bGhldTdzZm9CaS9HM0NSbU13YnhDakJBakNuM3dCd21TODZBZE1saC9ybXdt?=
 =?utf-8?B?MGtUd1lvWE44L1BsRytZSU00L09RVjd1c2krcWt0aVRSRDIrVHd2Qm11WFR2?=
 =?utf-8?B?YTNZTUJYYXJYRFpXenl2WFk1M25Ld1FkaDlaY2Rjb085L29YdFhjOEEzM2da?=
 =?utf-8?B?eEh5MldMeEl5cGJsSVR4K0xNdVFmdzhacTA2UWx4QmFwdFNEcWRERURuTkFS?=
 =?utf-8?B?cCtMTU9SampxU2NoYkpESEZHMEdvaVhPcVN3Lzh1VXVHbTdyUUF6UWZSS01J?=
 =?utf-8?B?c1IrN0Vqa0QzeitqRjUzQSt5QmRPWGNPYXVpRmZWNVNQb2pIV1RiNHRSSmVa?=
 =?utf-8?B?M1lSOTNJTkZYbjZ5b0pkb0dqVHRuNEZFYXB5Qjg3ZlBNMU5wQWtIb1JmcHVx?=
 =?utf-8?B?NzJ2cE44YXBnLzVIRVJQa3B2Q0dSdnhUb0VBd0FaSVRXQjhSVDE5UFg3SDhE?=
 =?utf-8?B?dkRwOER1RGJTOUwwZzkwU1Q5b2UvTnhPeUREemt0eWNMSkpWRFFJQ2JnTm80?=
 =?utf-8?B?SUJJcHoxeExMNy91MGdvdWJpQVBCbmhMR2xSVDRUK3BwYnhTY2dtQWZaaGJh?=
 =?utf-8?B?N0QyV3k4cElKZlhOR211Rkk2Z2xHR0kwcXh2SFBBUDRmd1hBM2FaNGFKc21W?=
 =?utf-8?B?V1hHcGtqM3FpdXFaUDlqcXJQSjJDeGxZQ1VxejZOdVZ2emxnckFaMFlLVGpF?=
 =?utf-8?B?R3FIdi9mWU1pQUNDUHF2enJkSUpqUDFxaDZZTVNRckZQNHNjME9GclFOeHM3?=
 =?utf-8?B?NDFiRTQ5czlGelYrK21nbEJoMlhVeU9iSlM2K3B4Um5vUlc2QThLc0xFTFRE?=
 =?utf-8?B?cWUzZ0MwWUlzSm1SaGROblhkMXBhQlRNMzdBOVNOYnNUL3U4enI3RVpxaVRs?=
 =?utf-8?B?ZWdYdVpxR3NLVXZlemRYd0piTzg2TG5TcUR3MHRzd1hQYXBPN1FMY0MwNEhl?=
 =?utf-8?B?N0NCYkM0dEpVQ0tuQkt4MDZQcTJZNkc1TUdiaS85dTJGWnI4VUgzWmc0TWVM?=
 =?utf-8?B?ZEk1SndYT2pOTnpJZnlnRGpkWFZKWVllclhPakhxeFNvU3lwNG8rNVhWdDgx?=
 =?utf-8?B?VWJMSWlQWkF0WDJic0VLMzNDT0NCUnp2b1kzKzRuQUNnUHV0QU50cjBoVmow?=
 =?utf-8?B?MnozVy9yODdpTzFGalpNVnF1RnZJOWFuajcxQXJFTkZ1TlpiV1BRbFNKd3JJ?=
 =?utf-8?B?ZHQyejhWUmFpSzRzUUU0WElIcStKS1duUmpZL3RpTk50RnpVVDZNK3kyaElT?=
 =?utf-8?B?TzJURXVGY0djNjErc2R3RFdsWnlEYjNFaWNyOHNuYW9uQ1hpWHJNOVRzTmly?=
 =?utf-8?B?VkdvSkQxM3FHZVNnbHZacG5PSVM4RGJLUGlZV3FWR1NVMERuUHo5ZHlLMG9K?=
 =?utf-8?B?SWdERVpQRWZtemZmUGtJemtVc0Z0ZWo4Qzl0UmljRHI4QURnc1FwZ1ZJbnFU?=
 =?utf-8?B?cVNBc3NPVjBmNEcvcGRDTUNNV2tub1Q2VzViSVJqZTZmTGdmR0g2M1ZMQlFO?=
 =?utf-8?B?Sm1mV0MxT3Uxb3ZpWnlWQU1OeEVOc21yamx1SkZoQnBwdUp3bWZvQTBjNXF1?=
 =?utf-8?B?KytlOHNrSmRqV0tyRTNpL3JEYjh0UC9DbUt6ZGZNZGp4ZnNLL3ZiUWJpcnlS?=
 =?utf-8?B?MENrMWJHRzIrdE5QTmtIRzA4d0pqbVhuaW1YenBLSzZHMkluTXZENWdia3N5?=
 =?utf-8?B?ZlF2enBEU3JhOVY4VmtnQ3ZidE1kQXc2VCtOcHY5eTE4WmtPSVVyREZHWHBl?=
 =?utf-8?B?T0pZVmIxa0t5SExsT1o4T1NKcjNsN3VoSEVkRy9BNWlvYUtVU3R3ZW56MVdR?=
 =?utf-8?B?VUNQWUlQRGgydXgvdTlGNjRXaThUaDZoOEFldzZtRTJCcXU2MU1RZkFDMXNv?=
 =?utf-8?B?L0hvKzB1NjJCQk9MSEJqeGt5RXZkT3l3RGVjWWtqOGoxSTZCUzluR0NHa0tp?=
 =?utf-8?B?RlhYeEJESG1XTWs5QloyU3FIZVFCZ242RjByM210alNZVkxUTTZBcGhMNnQv?=
 =?utf-8?B?V0NUUDcyaXdiRnlFbzBWMllUY1hSd1FQQXRZK2FZZGpETTRXYmtCTFNDU0Y5?=
 =?utf-8?B?bmNKTnZhUXE2ZldYSXcxNWtjYlVYQzhmUTg4ODJCQ2ZOY2FTOERuMGtFcjd2?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 086f3eee-5da7-43d5-28d9-08dcfaa56924
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 18:45:52.2763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Po36i+GBrWTnMtdGJUWyDj8WxRCXjQL2t5gwrhCnp+FJxDui5YVLYwb+D/R1bfQNu9f5sw/rmBI8cg+fmSf6SL0/pIJbPnDlSVJ9spMCgrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
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

On 11/1/2024 11:04, Jonathan Cavitt wrote:
> When performing a guc_mmio_regset_write, we add all the registers in the
> reg_sr list to the save/restore list, but do not do the same for the
> whitelist registers.  Add them in.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Lucas de Marchi <lucas.demarchi@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: John Harrison <john.c.harrison@intel.com>
> CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 943146e5b460..2fc6b1ccc8fc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -239,9 +239,12 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>   	enum xe_hw_engine_id id;
>   	unsigned int count = 0;
>   
> -	for_each_hw_engine(hwe, gt, id)
> +	for_each_hw_engine(hwe, gt, id) {
>   		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>   			count++;
> +		xa_for_each(&hwe->reg_whitelist.xa, sr_idx, sr_entry)
> +			count++;
> +	}
>   
>   	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>   
> @@ -727,6 +730,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>   	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>   		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>   
> +	i = 0;
> +	xa_for_each(&hwe->reg_whitelist.xa, idx, entry)
> +		guc_mmio_regset_write_one(ads, regset_map,
> +					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i++),
> +					  count++);
> +
The code that actually writes to the NONPRIV registers 
(xe_reg_sr_apply_whitelist() in xe_reg_src.c) explicitly clears all the 
unused registers with a comment of "clear the rest in case of garbage". 
If we don't trust the reset state to be valid then we need to ensure all 
of them are saved/restored across a reset. Otherwise, that garbage can 
come back and cause problems.

John.


>   	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>   		if (e->skip)
>   			continue;

