Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128D3C52D7D
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 13:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F0D10E6D9;
	Fri, 16 Aug 2024 13:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkWFDSlA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150BC10E6C2
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723813224; x=1755349224;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=orD9ugq7Q6KEv8T2Ha3tZ8D1+rPny+F9A5+UxovfRjE=;
 b=OkWFDSlA9J8mOpdrauKp9gQlcToTygdqWKE1Uk63uRrcq8w6zwh27cJm
 EVBHdaPFM6zDiYI9CHZ+sosnniE+Ls7r2P2G/L4//RjIqRBHMCfSan1IG
 A0C3JAGkDvWdIXwMB7CSE1teYgUHASCVroxCa6y13aizfXFeHuVh5tYRC
 Z6xB0hHUBLnO7THosjLScp2R9O8+CJ/k/NrRDL8ad5PoLNmoBkec/Hw3n
 74dj9MttU6P++Gal87Mp5LlRMvszqdUTgfr5IkeE5mfIVWP0DZ6Q2xeSK
 ABfdB2+CAuaiK1PadZCeNMwpO1J0McMmiren84ROz779IrNoWfQJ+v15e w==;
X-CSE-ConnectionGUID: f4T2ze8kTX+jIIMRyqxPxg==
X-CSE-MsgGUID: HCewJJVDQeqr2GSDpl++9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25009167"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="25009167"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 05:59:27 -0700
X-CSE-ConnectionGUID: JdSOlMHdQny30zbOTz+OyQ==
X-CSE-MsgGUID: NBMaV237Q12r/jhyY7+IJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="60459408"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 05:59:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 05:59:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 05:59:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 05:59:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 05:59:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PW6qj3NxtKvwROJybeSgWi6WZcW6u+gssScbqocVFRwMK/rirM/8X6g6WrTtleLkrTntLygLsaYL5+IAhN7A+2DRIcx+VryASiZ7z2O1TiLyBPwSGPMrdS1r7lsfMGIWsz1d2KnfPbN+j+ej2iCMPK8FxyZnUlsu7Ykybq/OK6mSJFlVtr+Tf3QcNbQVNF4TFT2/mY6N6bAxKXqrbRQzCKOKSsYPXvvkaA8YkgPK7/0YVGU3xtz81fMv0gA3EdksAkQ1QCakAK7uW8Wt47P/889fFQD3EXH+g7BCIRp8JrsWi9sON740PTiMaz0A7A+iBRlSRn1OghOAqswa8QmX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPnW8LmU88y+48wQJZB0oY7KDlS51mTfJ1LCGe7PJQo=;
 b=CCtz28C+2beRWibapooxLNJKm1ET0t6p9IJYeuMX617hy/omd3vSh0ExYic3eBRADDa/TS4dcvxtxhaO4V1OOrX7nqEPP43qEDk0sOfKAa/ey8/BzJ3W2G7G/pBxQEm+Isjx3NMMK4FgdbyyKfUdWRYbO+6vkM6cm05CFhOwf+9aqFUSsqvtNf/qo30aw2n2DMqYyJ85dFxAmHBGAsLvnvFi/gQbLTLrTwhtBQ7SYQr3BAEoHgwqJxhHjv8jfcDiR6b/PfAzXTizBK98MoNMePCndLhltLHVTozANS8YQ8SfGL6vPUM6DfP8IxG8hPWHj43KUTxUxyBwujRcfeh0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 12:59:24 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 12:59:24 +0000
Date: Fri, 16 Aug 2024 14:59:20 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 02/12] drm/xe/pf: Fix documentation formatting
Message-ID: <20240816125920.lconshmpx6sq5olb@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809165159.662-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 81eaa00a-fe71-4ad0-6ed8-08dcbdf340c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3JqaXNKWTJmeVVaQlpVQWVEKzAxeTFMV3dCZHNhV2EvOFVuL3doQmdrMnJh?=
 =?utf-8?B?Sk8xRFRoWmlXSjZKSDhacE5vMlhYb1UzMnFmZUtqZUZ6Rk9oc0t2RzVmMEYz?=
 =?utf-8?B?LzNKV1R1TWh2VlNjV2ZhUXYrT3VCYkc2NmIzRVFUTTIzUkw3UnpGSFlKemRJ?=
 =?utf-8?B?Y2JUdi9LT2RHQXRyV3EzRWF6Z0tNK0dsSDFYMVZuaGExcGVKNnpXSkMwenV0?=
 =?utf-8?B?blVvN0FJaFRXdGJiVzFlZk9tdGNNVmR5MndKZUs0V1QrRFV5eWhTVkxob2Jr?=
 =?utf-8?B?SGlLek5VOEFTTHk4c3U5MnZGQXIrQkY0Ynk3OSsxcE0xblVqWlZTbkt0Z25i?=
 =?utf-8?B?Ulg2SjZOQ29pQTFvU3lNV2IxTHBCdXJlYWxOVnM3cUE3bi9aeGtTZ1N0THhD?=
 =?utf-8?B?WU5nSFNFdXZ3NzlBNVBlTk0vdjR6aDFHWG8yRTE3VExIZlMrVUQyVWtmSjl2?=
 =?utf-8?B?ZHlnUjZnZDhrUmU4bDRNUTEwa3FJTXM1SGJ3VUM3TEFyb08wYnovQXVlWVVz?=
 =?utf-8?B?RUNLZkozUmNlbTBPR2F0NU9pNTYzUVd6UHVEeXpDSXczNm9WSERzR29lZWZh?=
 =?utf-8?B?elZKRHNjSXJ6VzF0c0VOZ0pZdnFMaXV2OUFMdG9uUmJPVG93SHljOFZBSDJ6?=
 =?utf-8?B?a1orYmhOM1l5dHQ3R2RqeDU5WFdtZVhmdEoxM2lmVEl4SGtxRGZIRHZnUFd3?=
 =?utf-8?B?a2NZMnUxenFDMFhqK0RCMWlsVlR1SHdISEwzZGp0RjBjdDZTb056eEVRZUZx?=
 =?utf-8?B?V3dLVkcxVzRpem9tU1BUZFo2WERwU1F2dmhuc2NKclRQNkxkUWVkZlBHS2Uy?=
 =?utf-8?B?Z1htQWd6bDA3ZHFHK0xMQ1VBVUZHMkV5Y1Z6MGYyNFI4TVFNbnBrM3loZjdh?=
 =?utf-8?B?aXFHak8wNlBNQXlHdlFRRzhhQTVTeDRZMjlad3FGUHJKaHNhS3R1NVg5T2tM?=
 =?utf-8?B?L0ViN0ZCRHN1b0ZSeFhETjRTSFArU3dUYm1TL3B4Qm5TNHBPQWRudzV6ejc3?=
 =?utf-8?B?am1YY2pEWjN0V2hvQWxKcTlRbVh2OEpxeWhPZ1lWNDlSY0NDSHFaTENIbjhw?=
 =?utf-8?B?MitFK2IveUpMbzY5NDk1eEl2UXg1YTNJUVRhQWJ6cHQ1clc4NHFKTHFGRVpT?=
 =?utf-8?B?R3B0Qmk2S2JHYys0NGdRVTFpL2FBTDZwSVk0TTVuMkNiN0NCdjBBbDY5RWFS?=
 =?utf-8?B?YThaZXdHbzQ5b28wNkFtQVlWdDl1V3J1bXhNbVF3bms2UVdXZ3pZSTRmbi9N?=
 =?utf-8?B?MzJ2SVJNb0U2K3dpcGdZdkxjaFB6MzNxMTVORHVnNXZBM1BnZDZZUmlXRXND?=
 =?utf-8?B?MzNmeXVER1p0UEhzWFhUTTRZaCs0Tk8relpEUXltb2pGczEzOVpTZTJhdEow?=
 =?utf-8?B?QmtKK0ZhUE5pcW9sOWNMakFFaThKYTRrdU1RNzMrZldmTEVhUzVLTnlUdjQx?=
 =?utf-8?B?dUFzTlJTUnRpYkRKUlNxcERkTDRnMU55Y2dveFNIMmFOU0xXQ3VOZ0paSUt5?=
 =?utf-8?B?QTZtb08wMndzbkUxLzF2N3JnUyt4RjVjOGtwM2lGaUQwR2xRMlFub1BrTi9E?=
 =?utf-8?B?RGJDWXZQcmw4U0trQXkxUVZGZFRhbFdaVFFubDEwRklPTXhFV0NzZVR3QWUz?=
 =?utf-8?B?R3FmK3hreDJrOXp4T1l5SmpXMDBmOHR1YW9zODRNVUhiTUpwNUJXVjNmQ0RH?=
 =?utf-8?B?dHVlZUp4ZVUrYUhoU0Rkcit4RHJCY0FUQ0hUTlYyRlZmVEV6Y1psMjE2YVkz?=
 =?utf-8?B?d2x2NWFjL0twRGpDR3gzdHVoODhuV0ZlTHZEay9LSXNyTUl0YnJzSHFZbWxO?=
 =?utf-8?B?YWJqb1I1QWx2NVJQRU45dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVdkaU5TY2kxTVc0RlJuaklMbmRlUlUwdmFwb0lBRUFmUWJsc2lpMlNmK0xx?=
 =?utf-8?B?eVkrOGRNQ0J0MG4yNzhaK2F4ZWJmRVlnR2xuSUlOd1ZMTzJjbnQ0UmRkUkxx?=
 =?utf-8?B?U3hCbkJUN09tLzdGNk1IZmNXVEdBTmdTYnYrKzJzQ0gvelc1USszaEJUckN1?=
 =?utf-8?B?bmJaMFFxSmFqY0hRRXF1OFRzRS84Z01KeGVDSEUvL0JqOGRvQW9XUkhHYlNv?=
 =?utf-8?B?TmJUTkRBbTlHYTZUcm9PTEpZbm4zUjRURWxwRDcxZXBzZERvQVNXaTZCdXAw?=
 =?utf-8?B?MHd6NElZcTgyWDJrSHBYOXowc1doKzZtSTBVL2dZUXpvVExFK1NtMk9sbEFt?=
 =?utf-8?B?dHJhblVBMHllM2VQTXk5WUozMWNSeXBvWEMzb3liZTF0aHc3c2Q1VU9pMTVm?=
 =?utf-8?B?enJGZDBQZ0dxNlVTaERxN2dqVFRGQy9Ma0FuYUZVY0ZFY3I0TU5iekw1YUFt?=
 =?utf-8?B?TVJSUVBpZ0VJeG1XSFVnQk5Ya010NlNjNXhNTHVxS3FtdTR5VTJ4Tzc5Q29C?=
 =?utf-8?B?VnZzZ3NPejMzVlBmOFJrSGxid2t4d0t2VTdJeFhGZU5LQ1BVNTRndE51bTBP?=
 =?utf-8?B?SkFHSTdHeWJhLytnQTlUbm9yODRaUEpsRjdHWmtGdm85ZHJrelJqby82c2s4?=
 =?utf-8?B?ZG1iMEl6L09ZREY4ejBFbGh6TG9LWFBBVjFqS3NBRGNsUE5rVk1QUEROc0Iz?=
 =?utf-8?B?c3VrZDJHNGdvV0tGWGJvTklHZTFWMUtvSWRSVVN5OWhDb1JjZ2hnNkJFV25j?=
 =?utf-8?B?S0NDVWx4Q1NpS3pNbmVaMG9xV014Y1I1bmZzbzVUY1lHVndwVDlVRnZVT2ZL?=
 =?utf-8?B?WEhjWFpHUWhyRVlQZGZVd1c2K1hramIzYjJ2NVFHK25iY0tWMWpIMkJMWmd2?=
 =?utf-8?B?TWlMZWIzSXFYcVlkTlBnenY1SGxXUU44RWEwTnlmQ0U5a3JFL3I5QVZhY2JN?=
 =?utf-8?B?NTRBeEsyWU9ZQkNKWjRWZFZPdFY5Mkx0VUI1L2wxVXNhcVNnVGNWKzlCL2hk?=
 =?utf-8?B?VEZKcnV5WUk3R25PVENRVDJBejl5RE9EYnZMOUNnamVBWHZFRHpFZ0VNTlVD?=
 =?utf-8?B?bFNsMEdJTUMwNHhGY2tpRVlPMk43VGpZK1BYOGJZdG5hMVVvNHovVTl4b3Nk?=
 =?utf-8?B?VlVxb0IrZ2pNZStzRklicHhKcXlOOVBkZ3Z3VXhuZll5WUtLZWNwNHVtVm94?=
 =?utf-8?B?VE9ldlI4SWd1eXV0Q0ZuWUtoeXpBaUkzVEdJMWJsMUtYOU9aU3RSL2Z3aUE5?=
 =?utf-8?B?dDArVnFFTFB2V1J0V29nWitYUVZmbU1xRG5RWjBzMzBjRHpSZVNWeHBMTEY3?=
 =?utf-8?B?aHF5YzRoUEFPT3V4NHN3RDhtVm9ET2NnU1VveHhORFg5ek93b0JCR09UdWJI?=
 =?utf-8?B?MmthY1VDYkQzN1d0dWtFT3FiVW4xY3BXVG5oL251NVFrVzZWdCtJa01qMXNt?=
 =?utf-8?B?TWVwQ2xRSUNkREN5cHJSelZvdzdLdi85NlBYL1N4M21DYmdBQlJxZ3VUYTQ3?=
 =?utf-8?B?OGJvUFZtak9UeWRaRzlvdlVPcEtaMkpOY3dpT2tQb2NkQU5QYkt3R3VsV3Jo?=
 =?utf-8?B?MzNzU3JrVms4Y2dHY05raHdaMStreDVoVXhhOVdldFFHTmlBdzNMbk44U2tH?=
 =?utf-8?B?TkkvNjJSWE42MGE0SjNPT2RmVTBndmdGQUZoajhCeVpQVlVERnRkSXRIbXYz?=
 =?utf-8?B?Yzk5OGdPNFE2ZXFaT2FWTXM5WktBRC9lbzg3UnJiOXBiYWNLcXVWZlZOUm16?=
 =?utf-8?B?eVRQaTRvVWM1Nk53cmRFUTJ0anhVNDQvdWp1TVpza2dnOUJhYWNWeVE3c1A1?=
 =?utf-8?B?OThXN0hLVHpVQVVRTUpEaVdubU9wM3F6ei9sZWx3TzM5Rm5nWXpmSUpLcUtE?=
 =?utf-8?B?UVVVcHhOeld3OGZ2Rm1xK01lbklPaG5xcW13TGxJeXJoV3RUQ1k0bDdPOFBk?=
 =?utf-8?B?eDdLMlZlRlVWTHROam8zMHhsM1ZRcG9QZys4N28yb09PTCtjMkVmSUNaOWIr?=
 =?utf-8?B?djd5WkxTTk5Md2tFQUFBeTJLOWNhaml6Zmc3eThsSVhuL2VEbWYwYkIzT1ZW?=
 =?utf-8?B?UkZPaHBVM2QzNHBWL28veDFzR1owZ0d6YVB2ZW16dXZLNGc3eVVOZTE5RTVL?=
 =?utf-8?B?ZUpBTWQzTy8rRWVmMW9xbHlNU0F0U1kvR0lMbEZ5SkRIVjZrcWpCdjI5RXJR?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81eaa00a-fe71-4ad0-6ed8-08dcbdf340c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 12:59:24.1641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FxQhWGS6ygMfyB1rzPRu9C6VJCKWqgzgkImQ3zMffxQxxRC+UYlmq0Zo0TwAbfG3SbqnyZPXRVJ0EZLWw2RGoJnGNxR48q5x2aGy/3+ciw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:49 +0200]:
> Current formatting of "The VF FLR Flow with GuC" only looks fine,
> but it will not render properly when included in htmldocs due to:
> 
>   WARNING: Block quote ends without a blank line; unexpected unindent.
>   CRITICAL: Missing matching underline for section title overline.
> 
> Fix that by adding proper indent and using list markup.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 54 +++++++++++----------
>  1 file changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index ebf06e037750..d11839d9e7d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -153,33 +153,35 @@ int xe_gt_sriov_pf_control_trigger_flr(struct xe_gt *gt, unsigned int vfid)
>  /**
>   * DOC: The VF FLR Flow with GuC
>   *
> - *          PF                        GUC             PCI
> - * ========================================================
> - *          |                          |               |
> - * (1)      |                         [ ] <----- FLR --|
> - *          |                         [ ]              :
> - * (2)     [ ] <-------- NOTIFY FLR --[ ]
> - *         [ ]                         |
> - * (3)     [ ]                         |
> - *         [ ]                         |
> - *         [ ]-- START FLR ---------> [ ]
> - *          |                         [ ]
> - * (4)      |                         [ ]
> - *          |                         [ ]
> - *         [ ] <--------- FLR DONE -- [ ]
> - *         [ ]                         |
> - * (5)     [ ]                         |
> - *         [ ]                         |
> - *         [ ]-- FINISH FLR --------> [ ]
> - *          |                          |
> + * The VF FLR flow includes several steps::
>   *
> - * Step 1: PCI HW generates interrupt to the GuC about VF FLR
> - * Step 2: GuC FW sends G2H notification to the PF about VF FLR
> - * Step 2a: on some platforms G2H is only received from root GuC
> - * Step 3: PF sends H2G request to the GuC to start VF FLR sequence
> - * Step 3a: on some platforms PF must send H2G to all other GuCs
> - * Step 4: GuC FW performs VF FLR cleanups and notifies the PF when done
> - * Step 5: PF performs VF FLR cleanups and notifies the GuC FW when finished
> + *	         PF                        GUC             PCI
> + *	========================================================
> + *	         |                          |               |
> + *	(1)      |                         [ ] <----- FLR --|
> + *	         |                         [ ]              :
> + *	(2)     [ ] <-------- NOTIFY FLR --[ ]
> + *	        [ ]                         |
> + *	(3)     [ ]                         |
> + *	        [ ]                         |
> + *	        [ ]-- START FLR ---------> [ ]
> + *	         |                         [ ]
> + *	(4)      |                         [ ]
> + *	         |                         [ ]
> + *	        [ ] <--------- FLR DONE -- [ ]
> + *	        [ ]                         |
> + *	(5)     [ ]                         |
> + *	        [ ]                         |
> + *	        [ ]-- FINISH FLR --------> [ ]
> + *	         |                          |
> + *
> + * * Step 1: PCI HW generates interrupt to the GuC about VF FLR
> + * * Step 2: GuC FW sends G2H notification to the PF about VF FLR
> + * * Step 2a: on some platforms G2H is only received from root GuC
> + * * Step 3: PF sends H2G request to the GuC to start VF FLR sequence
> + * * Step 3a: on some platforms PF must send H2G to all other GuCs
> + * * Step 4: GuC FW performs VF FLR cleanups and notifies the PF when done
> + * * Step 5: PF performs VF FLR cleanups and notifies the GuC FW when finished
>   */
>  
>  static bool needs_dispatch_flr(struct xe_device *xe)
> -- 
> 2.43.0

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 

-- 
