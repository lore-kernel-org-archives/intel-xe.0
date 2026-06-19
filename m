Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A32BCD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 05:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBF610E038;
	Fri, 19 Jun 2026 05:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kneAl8JH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F53D10E038
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 05:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781848108; x=1813384108;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=txRTqLwF5X2zV61MdyH39UD5I4INPNB9IpYLzAsMf9Y=;
 b=kneAl8JHlX66F8knWSfwOosQB1olRz3kIF6nKCmLgjchsZTcGgyl/7Fo
 vCF7J5FSGuSg5bzbU8w216zqTeLhdlhIo7mqUDd/0AcgqdyxxygKNxTdu
 wi6okypDJJPGG0ObaZrnuukWagb0QsEpVgTFyK9DmzNrYNFeIKmXTixWj
 kM46A/LrYV0JVw5CJ1Tr1dj+XjyrQkyo/cQUXob8dySlfR/FKPZLBWTpq
 v3tT602OCU24mOnUY4vEA5JGgVYAtdrXxoY/taiQgOYNo7SXdT8TPtzxE
 5Jk1dz0RB0ttsXWd3d5Cf0UWBXHmL+0oVAX7MMvhJD2QVjvFlG/6BAYbC Q==;
X-CSE-ConnectionGUID: l8x5qY59QL65NyAuAah+qA==
X-CSE-MsgGUID: YIJsyIvjSu2Hg+KaKUiH1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="94195135"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="94195135"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:48:27 -0700
X-CSE-ConnectionGUID: 3pM9SdDyTBu1eYmdGo3QUQ==
X-CSE-MsgGUID: jBcy1XRRS467Gf6+C9adWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="253540186"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:48:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 22:48:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 22:48:26 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 22:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHzCcB0Cxk+Y3DZKmXGTGy4GtlrM9h60tKjLdgs+oU4GVKEADcpF/alCZL2oDRPuE25JCGpqeO1jbKwFLK22oMcmZ6mi4C7LxOTSK9V2mLs5bMjkFIk7n/Aex+f224OXD5Yl2kWn6Ku2zMv0chxvwZoAi06eYpk2ziUNcn985vCmyaRIkYGQMo7QdT/3CBUFy/t1inQ7iG7uNA5kwaT9kPEhkNbMDTiQpBLAnhcWy7NHJgCObcJuxJoPQ1k8RRYeUDEygV/R2Nzz8/belJGcVehDQSrKGJ6KEZL/FMoTTqoj618Mbh1Eo8Y+Dir6TJDFoYuuBdlUAJs65JLkCSDIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WGoQ+r7oYXXK70dQrE3QeZgCxQFFE4IgMuKqtE5xkw=;
 b=U91H9hKHSVfOded60FHKxwUEtjnZAf+8zo5kR9Xd/oGFt04DOCAQKUZ0lXYpCH6FkaTxZuJfVCbkfSORYg09VtxTlsaWrne+bUBbXmZ1Q/e8bSbQSItlr2fjWZLQvbX53folcLpqOxHBxZUv+OlGnLluWh3rhxoEYzPq19deOZZhiR2V/CfVHh30HwxLvhW9ccoFa0rkBfBv8LYOLXHAMbgEHMFAvgDKioIHQJIp4a5EgIlaaugjQ9l6eVbSw7FcNDgmDI6ZBTdH3EWjBhpgIO0PNSSzGNr5ymodRHS0P5X1Ie7SsQJGzH2GN6lvka05HougOqGSrZ9dmbUIoz3QTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS7PR11MB9450.namprd11.prod.outlook.com (2603:10b6:8:26b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Fri, 19 Jun 2026 05:48:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 05:48:23 +0000
Message-ID: <2c2b5167-97fd-49fb-88f4-71e1dd1b3122@intel.com>
Date: Fri, 19 Jun 2026 11:18:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] drm/xe: Add error Signature IDs for RAS logging
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-6-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260617104711.79646-6-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0205.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS7PR11MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fbe8b99-8822-4c3d-5b59-08decdc66014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: fytZ1tOHXmAL7CIN5IrDjemX7mQoMe01FAqvYTdy3Xd8vi2fiskhaNmVhEUlVomytQJAykTIt6LaTruapKC1t7KB7A3E9kdDfpmsSY7E0X7hunpBcNp7vxHhcghJM8BxXjIpdWK0lN+JwV6J1dmWiMjzwZnVDa7umx5Zhu+SQCF6cmw9Jqwg/7QLPmFowEaoHHW+rOmEnefl4zOVPPflX7Jdn9blMwunul5f2PBNppl3e6QcwYAWHLjKCrqHouOwQhtumgOsnvxBUtfPda3qogBoJZaq1+E9Pkk0TjCKu2YH+s2ABcyRfYgrMLrtJ3HGGavx3p+Ffe2K+s9x1fsF9iTKYRshWwW/vtAjr1DS2ktphmIa0Zy7mE/Hx0eGzkFBMUr+1QvKE49+yM5Mt35MXDJysTNkm7EYTBgceTPkMQ1Fbwxe+RRsikaLzyZVcBaO6dZA9/sZRbLc/eg7cYZvbJRrTlgVCY+4Ch/JxGJe8/+3jyuxmoFsGlYZjrrj8aC6J2tS4yqbLN8uulp87DsoZfhgW68Vlhz1o/ICmJyfsiD5vRGDFrsoKxt/y+kQ+fb9SmUHemDBbqi5ajEqYM9lGOgR44Er38FEL9oooI961whlw83B7KsDxLoiNHD4IX/F9in7wE/HrVQdtYDVjb8PwzkanOFz/dfUuSu96QwyuBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUcwUHpBSTFDaW1HQkI5dmJQVUdoMGgwamE5K1Q2d3NMcHdEbzg0L1dvWktB?=
 =?utf-8?B?djF0cXhNcHI1ejVVc0FucHpaRHNJRFVrK0Vld0cvYTlmQWxzZlhYRGlQZW9D?=
 =?utf-8?B?cUNMVzk3UXhNd0xqNi9zY2dPUlh1bG9kNTUvNWh3N3lCRUQwcGhobUFyN1Bl?=
 =?utf-8?B?OFBLVVN4N2dydmpXR29kcmJDSkRuRGxMYUkwNzZXTVJmY0dxSEtHWkZndGh3?=
 =?utf-8?B?OUM1VFRGWVRxZjhqL1FqM044WkFoSC8wMEpQTy9qUTlVcEhScDhnZTRQWEZV?=
 =?utf-8?B?K0l5eWh5N3pZZnR2Tzh6NlRveXZDQTVnNWVxQ3FhVE9keE5WSnA2NURMelE2?=
 =?utf-8?B?VXo0RzJ6REc1TC9MWlNVMm9kWmFNQll1L2ZUQjUyMDBpYktJMS8rMTJPTFRr?=
 =?utf-8?B?QmdRa25sWVBEUEt0VURUOVFYUlU4VFU4Y0FQL2h2VkhFc0NSWk9pQVl5SG83?=
 =?utf-8?B?cFpYTVY4Vzh1VDRldGJZZU1SNGtZdlBIbHJycHJzZjlFaWJFMjdsSTlBckZ2?=
 =?utf-8?B?TnB0VXoxTU8wdE5xN0oyZ3lrS2lnY0NBRlBRbEFjdDFFdDJKSy8xdUt4MW5j?=
 =?utf-8?B?VmVjN3JsdVJlb3dhWm8vVCtEUTVwazUyUDkyeDVwL01tV2hzWlByQnowL05p?=
 =?utf-8?B?cFhhalBFL1FtUTNDZjJ0QkVqN0hEb1dRUlZMSkx0YUVCdnZlS1ByVHArOVRT?=
 =?utf-8?B?eThwMDdNYjNhb2kvbmtOMEFZMlJ4Qi9tekQybGVCajNUeXg4NGQ0U25NbE1t?=
 =?utf-8?B?ZHJoQ3Rma2tmY3hQVy81MU9ES0U3UFVUNTQ2ZGpHNXFJLzJmYjBKaklPdHor?=
 =?utf-8?B?SjlhQXliQW9XUlhLRldTOUNSUi9kb1lCV2sxV1QwdFFsVVJHV2R6cmEreEo0?=
 =?utf-8?B?ZTFKOHFxRGZZTWJlVDhIdWZqNTg4bFZKV2pJaGJkRkUxVUt1aGxiYkFWMHZ3?=
 =?utf-8?B?bFlpcytnRzBUd3hRQlM1VDNTbEEwNG5Oa1Rudmh6VjlIcitPMEt4bnllVUUv?=
 =?utf-8?B?ZGVIaXlmaHcrYTU0ZVVTWXJpYWZ0cGo4dWNsL3c0MHRQRVR4Mm4wRjM2dnEy?=
 =?utf-8?B?dGUzbG42Wmd5aWJNT1pEbFFFSGdOSmcwQnVIdFRPeWsyZkR2UUdZRExmcVlO?=
 =?utf-8?B?SjRwcUJQM1crZzFjWXBGNFA0NktZSnh6V3FsV1dNcmt6WWF5RndpMHVBdmQ5?=
 =?utf-8?B?eHVLbVNCQ01iQmV5Y1FJSTkrcGxVM3ZpNnRvNk1KL0NwM1RxU1Z2emJwSVlO?=
 =?utf-8?B?QTdjRkpzdU1YTm9vdjhIRll2VTV2RFl3d09VRTFGT0lLVlkvWGc4dmIxN1Nm?=
 =?utf-8?B?b1p5bGppdERrTHpzSEhMaEVGS1NwTVRTZnNvNDJZZFhaWDhsVDJXcVY2QUx6?=
 =?utf-8?B?SzY3VVVxTVNXaDVSbElvYkZMZkhDa2Urb2YzdlF1ZFBSMXVpZmlzZHhiaUJZ?=
 =?utf-8?B?VVhzZEwzNDllMjhnYUl4RTdMcFNGTWJDWk1hWDBzeHR2SEU5aFo3Sk1ySGhR?=
 =?utf-8?B?RTFnZW9PT3g2VVNMa2p0UVhjdWpZRDVwWWxtK3RwY1V2RC90d3NuTGZzMGNC?=
 =?utf-8?B?eWNBcXVBMnM2QWtKMWs0eVZSdm9xVEh2OUFMU3E3VVY0UE85WEZTYlIreTdp?=
 =?utf-8?B?YTQzS0ZYejdpZy9KZEdQMGhldklUTlVyZFExdnVvdGpwOWxYL0VVTE9vdXIv?=
 =?utf-8?B?U2ROaVRlWDMwUXpqS0ZrUkdrazU0TmgxWHNMb0g3MmQrUmRieWpUaFZtUEty?=
 =?utf-8?B?bW5IN2xLcHRxNkptR1ovVHVZeEhyVUxkWE91ZVp0ejBTL0Jrbk1majFJZGI5?=
 =?utf-8?B?d3dRK2RuOUpyOE9CWmdXZXRmakxDeVllOERVSnJCdGs4R2ducHM1VFV0ZVIw?=
 =?utf-8?B?SkhGR0wyN2dvckUrdzNlYlVSU0VvaTVEYlhiTUxjNmlLeXZ6amgrTzVHVER0?=
 =?utf-8?B?UWU0R1FnZU5WMmhKZmNKTXhzN282NFZwK2wvS2tteGV0U2QzTWdvaXpaeVY4?=
 =?utf-8?B?TlpvZVpoMyt6WWxobkFaUkNLbENMQ0MrdjI3Rm5zTFphQWo1Z2VXMnhYaElY?=
 =?utf-8?B?bURNdlVHbWQxZEVLV0h6ODZGU3JBUkF5Nm1YWEQ0enVjeDNoaFZ5Zk1ESnVV?=
 =?utf-8?B?TWpjbEIyK0pZZy9TVXlyejhWZ3FjeE5VY3JRR3ZMZzFHQXpCaENDcGlDWmVZ?=
 =?utf-8?B?enlNc3QxMi9qNm9nZlN1NDE3b01vbzFoOHM2SExKb1hldU5hckRTaWtNQ1ls?=
 =?utf-8?B?bXNpTWV2eU9pRlZZV3dQK0EvYUxuOTZnM01CMUlCM0hMK1pBcktlMFoyVmZk?=
 =?utf-8?B?S2pmSTFzUGVVc2RFVzJLTjdhTHFlVmZWV2pPS0xCcDJMckhjTmg0dz09?=
X-Exchange-RoutingPolicyChecked: J7XNsXaYnyi4MgLSuzgyocR4jQJiG0fz4yY9i/b8K0rEb9uUPRvGKqaYdwj7fLDsMypDSEhbM+JFv89LOSAebTvuf9KGIc1IC26kEjzcJlzSe3K0w3EOHqFRplm9Lr8yHSw5EADzfGXjVGlQ2duJy7mdoV3CizVpQPJf42hRO1r4/eDZZZ2VDNeW9INm46QuOpqRFYGHC2JX06X4DJ02hDqCsKznZokGvm5/SB+roi6+2A87RTuLZgwRZAKBAvAKBm3pJnnJ9cQ3+Z0DnGzZi3U0V8a7jApcVJsZ9DMF2rddTdrdSZZmOf0NkjZ5HTaosYBR2Loxplm0+c3+wiR9Vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbe8b99-8822-4c3d-5b59-08decdc66014
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 05:48:23.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bF7Zn9TsmZWWZ57CeDeqoonWnRV2/O+qBw4MViW9T7KIZ5Zv9CPJiWxW0j3VngXvGd4LKuLo3m1F6SjkX3MaMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9450
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


On 17-06-2026 16:17, Mallesh Koujalagi wrote:
> Every GPU fault needs a stable numeric label so monitoring tools can

GPU fault does not need a label. This patch introduces so it's easy for 
tools /script to monitor.

> identify what went wrong without parsing log text. Add xe_sig_ids.h
> which defines those labels, called SIG_IDs.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Add HW SIG IDS details. (Riana)
> ---
>   drivers/gpu/drm/xe/xe_sig_ids.h | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
>
> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
> new file mode 100644
> index 000000000000..7badd0d7ad72
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SIG_IDS_H_
> +#define _XE_SIG_IDS_H_

Document would be more relevant here

> +
> +/*
> + * Driver SIG_IDs
> + */
> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
> +#define XE_SIG_FW			4  /* RECOVERABLE: GuC/HuC/UC/GSC/CSC/PCODE */
> +#define XE_SIG_GT_TDR			5  /* RECOVERABLE: engine hang / reset */
> +#define XE_SIG_MEM_FAULT		6  /* RECOVERABLE: VM bind, page fault, GTT */
> +#define XE_SIG_IO_BUS			7  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */
> +
> +/*
> + * HW SIG_IDs

Acronym needed? Mention Hardware error

> + */
> +#define XE_SIG_HW_DEVICE_MEMORY		8  /* Device memory errors (e.g. ECC) */

example not needed. If required please define

> +#define XE_SIG_HW_CORE_COMPUTE		9  /* Compute/shader core errors */
> +#define XE_SIG_HW_PCIE			10 /* PCIe interface errors */
> +#define XE_SIG_HW_FABRIC		11 /* On-package fabric errors */
on-package?

Thanks
Riana


> +#define XE_SIG_HW_SOC_INTERNAL		12 /* SoC-internal errors */
> +
> +#endif /* _XE_SIG_IDS_H_ */
