Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9C0C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 17:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8226F10E5A0;
	Mon, 27 Jan 2025 17:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpTbiTpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDDE10E59B;
 Mon, 27 Jan 2025 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738000069; x=1769536069;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=tnjmepSR3oqk4RZkjfF5t3Kg+TtPViftEk7Bb4w7YRM=;
 b=TpTbiTpkLpM16HMfSj5C54/0C/IB/0ZaNaWNZa9GSNJCtUvg0BCZinW8
 8szd8NtENRu2lhtSoq5VKtN2ZMf0lQUAyaE9ldXU565/TZRCOJxMn7Xgn
 Dst0fVzzWfaa6mnMACIGBrBQ2DmEyZ67cNAx9KSL2XLk932+Xf8WssOZt
 ztkDZKNE9VGDS6L61BdiyF0savKhmarZwVmnwtOcEr4RTlyxwquCknjlT
 7RdNK2a+yWa9rnJEO6WFJ/HyAGpwPkgsjpQZm53+iWn0NoxubUxhM253r
 mjXJhzSeaX5uUN4a7lDM4gKtqucsyWWyByJmDDAsUxvZO0Y94Kiz9V5XO g==;
X-CSE-ConnectionGUID: 8xAwVXCMThOapwDV6rFcmA==
X-CSE-MsgGUID: 91V12hZES8SdhGS/vPbqAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38637701"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="38637701"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:47:48 -0800
X-CSE-ConnectionGUID: UY96UAbPQ+6zMPg80JFMmQ==
X-CSE-MsgGUID: dPeDKjIERuWoNAUO4iHI0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="113533925"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 09:47:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 09:47:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 09:47:48 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 09:47:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSLl2jFQDsOcOo0FqJ2rBi0Dcau3kAZkatu1JOYZ8HxBDU3fmOJIi6sSsQzwHbmy8f+DgEBy84wkStY6dVOPTbWMyLdLiBqBLDwIej/tQmVECgdBhkQHsVKq6TEyD8XifGE59GnHl3DrQmZY7hVOAQiB6KYQ3qygPvLAK6FGZr8bhCvLJYYv/9ZmtT5Klsfuz35rTFTmYjJgm3tHILhcigRRVGy8Pv+cCW3lmlLFYnOnbgRYxK6qlpvpvT6HG+9yVxYrSUllIeIB2ZqxEb71WQVhDchgwXjuaRD73EorTcCG81gsWl4fNdoBQktEO5WG9AEbiLFxrR58A5MBdIzGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HNTDlo+xiuUSMYkSbO2J509TtGwIrDzWBrDnvCEWA0=;
 b=jI0aYKwPVsDNpXb6rUyYyLK70Z4R6Uex3BAna48Uxt3YYnexpqEa0G1NIGyMBxJEwOWPhog2+R++6h6u8dVfY/l4nfuDgqKiENDsGyu59EX2lD5jCEaFNlaA9HpacLat+VNKa2aFClrXt53Q6XEtMM46qxfDuUWWVk+/Rt/I2z9TapHvpGo/QYe88Bilu+y5ew26dqKf4ygsylsqwKq8tH1tnv/FL/++9IVgOyGlHNFpZZW1P7DQtCBzpmXKqeh2mDeQhlxH12TghXi8JrSo0Nk4jsu7LuoZI2hSp8Yrol4gYmDtyWsSgu5lks8kRHhlXoLHGbt8YExKpzXXuEnwWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB5780.namprd11.prod.outlook.com (2603:10b6:806:233::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 17:47:45 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 17:47:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173798161841.2736.15863543915128976339@intel.com>
References: <20250124173956.46534-1-gustavo.sousa@intel.com>
 <173777420102.99963.14298772761339187449@b555e5b46a47>
 <173798161841.2736.15863543915128976339@intel.com>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/cmtg: Disable
 the CMTG (rev8)
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <jouni.hogander@intel.com>,
 <jani.nikula@intel.com>, <ville.syrjala@linux.intel.com>
Date: Mon, 27 Jan 2025 14:47:40 -0300
Message-ID: <173800006011.2736.1076705608034519811@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: b223543c-50b9-4184-3924-08dd3efab4ec
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFFWVkgvTUpwZm94TUVVQzA2YU9jWG1odDdvN3BUS3pKMS9jc0pjMEtMWVFt?=
 =?utf-8?B?WTdNU2JtZ2kxVVJoUml6akcvcGdzVTBOL1d2NDcwSmZuQ0ozN0wzdjQ2MzF1?=
 =?utf-8?B?eWVuV0toZ3BHcDY5QTdnOTVUb1Y5b1ZtVTRKTjhmbHhwdlIvSTBmci8rZHM2?=
 =?utf-8?B?VzRPNjhXZWsyVEdVeDA4R2hvRjJXYkR4TCtQc2hBWElJSGpRMGh1MjNsT3lt?=
 =?utf-8?B?aGh5anJqSDMramdRa0hWVUp1MDMrTDZLdzdHQnBab0lidkM0Z2x6TXcxc09z?=
 =?utf-8?B?TDNGOTdBWktnWFRiZUcrQWJMd01rdHhKdmVMUno5WGVYWXpsam04YkJJWDJz?=
 =?utf-8?B?bUdYM3ZSQ1I3eDl6M3J0TENGbndhMk9TNXdiVDd4SGdZSWZqelJEUVloZ2VI?=
 =?utf-8?B?dnhLQjlVOHNrV2ZwQ0c2QUlHU0VGcXpVenovTEdPNkFWQnBGNEE5K0xRZEhj?=
 =?utf-8?B?Q05KR0FBOGxHUUtqdTZlN1RJakJEVGYyWDNnNjNtWGJ1dnVCTjM3QytCaHlu?=
 =?utf-8?B?STBmNkF1QnlEK0UxTG4zM0pjUlZMMzh2WldzMTIrYXlaUW5sVmJKMXI0enRv?=
 =?utf-8?B?L0c4eDhXRkxsV01SNG9SRTdWNUd0U2QzbEhmbzJISEFuZVlDa0JhUmtxYmNo?=
 =?utf-8?B?ekpUWlNCRDVmRGo3NXBUdUh1MDI5WER6MHRIUU5WRnJrUDR6Lzh5cEJLNzZs?=
 =?utf-8?B?dzIxWEgwZU54YXV3ZjBRcStjdHNVTjJicjluN3JOZVc0Y290MGw1NWRlQ0U0?=
 =?utf-8?B?Q0hrRWI1MUVvNzlkL2UvWFdML1NlYnVmY0N3cS8rT1p3UFp6ZVNoN2tLY3Jk?=
 =?utf-8?B?Sm15Nk5Bd0NLWDRwNXlreVlhL3d5VFBSRTNJM095S25rNTlQTit5cUFkNklX?=
 =?utf-8?B?M1RHRDJad3dpdXdCWjNCejkwNHdGdTRuMUZob0xLN1VLVjJ6ZmpnOUJ0TTZF?=
 =?utf-8?B?TkFqZk9lL3IxazRrblBVSEdVZkIxWHdUV3psQ0xFM2FZTHZzcXVSdERPS2VQ?=
 =?utf-8?B?dmoyNVF1ZW91SGl5dTR3Y1pEdEFFaTlwcnB4aVNVUnliS1o2NnJFMURYbVVY?=
 =?utf-8?B?Ukd2cWNwWkZ1bXVjdjRoSHlxZ0N2cktoZklVZzEzeVVUMWovQzFSS3k3amdU?=
 =?utf-8?B?UkEwSlR3Y29MdGNaUGZ2c2lMTFVXSjVDQnlYMDZ0cTdpM2lCT1pVdzZMdWFK?=
 =?utf-8?B?WkRNdERETURjZjBBV3pzbWh4MGlrclB6dnVFdUFTczdyUVRjcSttQmp6cG1N?=
 =?utf-8?B?MTdzMnkzZmhlVElSR3FUT21KYUVvSU1iVTZvMVo0dkt2Q1VMYzJUS3pKZ3Er?=
 =?utf-8?B?dFRDQlBEbUpMb1FXM3c1eUxybjFWSVdHOXdncE91ci8vcVpCN29OUlUyOWl5?=
 =?utf-8?B?WGZDTnB1UytWakFlN1prTkMrZEhZTDdTSmdJSFlWN2h3VDlvVUNvYmV2bTNG?=
 =?utf-8?B?UUljbU9BUmQ4dkM0QzdzMEFOdWQzU2t6d1orRnJmTzRnS0hZQmhOY0tGVWJK?=
 =?utf-8?B?S0RtcExDRU5uTlFpMmdvamJWbHNUYXBDTHN6Ti9SdUxWQjZTRGgrYzRCSmRl?=
 =?utf-8?B?cDA1dXpVdTRTYW9iWXdUWXF4eU1CMzJISVlxcThyaUp4L01wOXlBMm5qR0pu?=
 =?utf-8?B?ZUVtMzdIbWZVRnBuY2dMZ3VXUXR5UDlPaEpJSUp0MWNac1ZFU0cxMFpIN2JF?=
 =?utf-8?B?Wi96Vi9YOWFYbTlDZmUwdExyWFB5elNrbnJmcCttOUJYZFpnQ3VoaVJVSFRi?=
 =?utf-8?B?d3k5amFKMGd0OFNWYjM1N3V2dXMyQlQzMU12WktRSk1MQzk2cVF1ZHFmTTUx?=
 =?utf-8?B?Y2ZlYlNNSWlRRGFML1poUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUlzYmh1LzBmemJWV01TOWxHTW5QK25mRm52V2hMN3NwZWRyQkg0VnY4azNM?=
 =?utf-8?B?SldLVENCbGRwQ1dKeVQ4MW9PWnBsQ2o1SGFZQWRYREN3WlVZWml0OStrQnVK?=
 =?utf-8?B?UzBmd0hTeGF4NE9Fb0duTW1xRTdzVXJqaEl0Q210NnNCZ3dXNjk0LzRjZ0Jq?=
 =?utf-8?B?a0RTTStXRzhmSGYvMkorc1R0WGhSczJyREhNOHpRN2hnMnplK3NiT1BLc3ZL?=
 =?utf-8?B?ZHVIc2o0N2pGdi93WDAvVHhMdmNMT2ExL09NeUF5b3k1NzhsVGdydUJockVu?=
 =?utf-8?B?ZHk3WlhLS3FOTFQ0UlhYYWpycUVFdzJvZFVwZGx6d1BMRGZmb2NsK0lLTWEy?=
 =?utf-8?B?ZXNjMWFidUlGNEtlU21VbEUwQmNXUHdXVUZjQVVveDRyZlNzWG84N2FqM2Nk?=
 =?utf-8?B?dFVwVVRLYnBTcUM1Z2JadGNpeW04WWt2UlJyY1NWTlNxZ3pOZSs1cjNYaUJv?=
 =?utf-8?B?T0w0VkcxcFZ4aDVHWXpxenhUZFFiVlR5Q1dTNkdsS2xQS0JFaE5heldUeXAv?=
 =?utf-8?B?bFJXSXAxL01yRU9XVlhLS1d3MXVwbmFGWU5aTGMrQ3Iyc1VxTGViV2NseUxp?=
 =?utf-8?B?dXNvcnovbTBVcW9SVUFTNkxVcTlMNlRrYWpGaTdsSkpmc0daY0FCQ2thTjQ4?=
 =?utf-8?B?MmZNUVZpWlFQaUcwL2MzUnVraEY1cFNRQ1Z1QWh3M0RHSWhNZmhiMnpVeUtu?=
 =?utf-8?B?TWNyL3pPdlJBbGk3R01iMHlOZHlXVnRjYUZvVVladFNmdlkyQW42aFVlYWJl?=
 =?utf-8?B?TlJtTEdJN1FWcms1Tzl6U2RhclA0OGdickt6OHlYdEpDNUNmdndFSnh3NlZq?=
 =?utf-8?B?cjFTZFBlYUVwYUMxSVRsM2JaOG5EVk8wcURDcjVadnR2VlFOMU04VjRDL0tK?=
 =?utf-8?B?UTlxQWJHUWlaZzE5Umh6MUk0bzhNU2pHRVQwU043cDhtQUhUSElUMUd0OURn?=
 =?utf-8?B?L3p4S1JmVFdWNzltOS9nRHRXZ3pFTzVaRE5DcWF2YkFYbkd5OS9XRmMvbG5a?=
 =?utf-8?B?WCtiaWRYOWNRM1lKUnlkOWhhU2RTR2VUWlBrbWpaWjVHSVo4M1ZveTJwcm4r?=
 =?utf-8?B?S3RoVysweHFXbXlENS90UzJaWXZOVEQ0dXcwTFZFMGZWNE1DNmtuWG5uM1Fv?=
 =?utf-8?B?Yk5NQ0c0RUZvYXdxMFl3SnVoWFgxQmU2UzZPSkZxY0p5N21JSzJ2eHkvUnMx?=
 =?utf-8?B?dk91OWhyVGJZaUR0UzllcXlJZEp6MEtORWIyVElaYXBtVEhkem5Bc3dwalA4?=
 =?utf-8?B?bFA3NHh6L0NvODFEandFYmtTb2ZKTkZSM3l4cHQvRC8wYmxyMlFud0dGc3ZG?=
 =?utf-8?B?V3pKWXg4bW0yZmR2eVFuYUZvVzRkQ2txQUJPM3M4VEVFQ3lEaFhvMHVzR3hu?=
 =?utf-8?B?NTFpRUdheE9wbXhWT2dkZit6cFd5VHgzVWlFZTNhUzZ3N0wvUGhqTXFYNUU4?=
 =?utf-8?B?TnpKWUpOOWF1UUVCbTRKbFVOTnVGQ3ZYNDQ2azhtRFNoZ0l6UUxjMXV4SE5K?=
 =?utf-8?B?T3dzTytZRmZZQVR5K1NyQndwZVRoeVd6aEJ5d0tLb0sraVNmbFBveGNyb2Rz?=
 =?utf-8?B?YjlaZTR4NlBuMDUvNDI4cjgyT3NsR1ZIUElGSndpdGFuaGRiZTdOUGhpd3Er?=
 =?utf-8?B?SWpZcVh0QVQzUzh2cUxFM1NXREgrOXN2aVJ0aE94eVVFNi9uUG9BcS9lVjRZ?=
 =?utf-8?B?cUU0bHRhNjUzNEQ1T2dHa0lyUjFoRCtiSnlpZWJjMkVxMmxQVERqeGFKZEt5?=
 =?utf-8?B?WnVobFZQYXZ5cWJmSlVISEoyT1c2VFRYTnAwRVZ3eHZwTUNoN200WnRJbGFY?=
 =?utf-8?B?SWVkV0FwMURodDFmdGFGS1VmM1VrN3JFaEhSSlBxVmFUUTI0K2szdTc1NDll?=
 =?utf-8?B?VzE2M3J2bWZuU2p0NGpXVmYxeU1qLzYzMWNVVkN2TWR2UEJGdG1XTStaYWVF?=
 =?utf-8?B?enVBbmJDTXhBTTl5WXppd2tzZlRqUWU2WlJPYjc4cVhuZmplNlFqNWxCdktv?=
 =?utf-8?B?azhIdUpqWU4wMTlrSVUxZisza1Z6cDk1TEtWNHI0S01rVVJSdG13QVUvYktI?=
 =?utf-8?B?emI2NnlzdHgrc0ZhK05USTdPU0F0R2NGV2NUTjVJdUM0YzU4TlBxeDk0Tnhq?=
 =?utf-8?B?SHJnak41WDZaUW5aV21FUXpCV1hUbVNEOUJVMkh1T05yOWF1bnJ3RVhsUmFU?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b223543c-50b9-4184-3924-08dd3efab4ec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 17:47:45.8293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npv4Jlm7RbKjoWJeoKINN3fzKhHkz+Bj9M6uA618IfLoReX6AZ51L4AKTjKnNX1e5DIrfL+R5WkkiM9ayAm9gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5780
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

Quoting Gustavo Sousa (2025-01-27 09:40:18-03:00)
>Quoting Patchwork (2025-01-25 00:03:21-03:00)
>>=3D=3D Series Details =3D=3D
>>
>>Series: drm/i915/cmtg: Disable the CMTG (rev8)
>>URL   : https://patchwork.freedesktop.org/series/142946/
>>State : failure
>>
>>=3D=3D Summary =3D=3D
>>
>>CI Bug Log - changes from xe-2549-b36df02c99e3246ba2a90e951c71797327374db=
7_full -> xe-pw-142946v8_full
>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>>
>>Summary
>>-------
>>
>>  **FAILURE**
>>
>>  Serious unknown changes coming with xe-pw-142946v8_full absolutely need=
 to be
>>  verified manually.
>> =20
>>  If you think the reported changes have nothing to do with the changes
>>  introduced in xe-pw-142946v8_full, please notify your bug team (I915-ci=
-infra@lists.freedesktop.org) to allow them
>>  to document this new failure mode, which will reduce false positives in=
 CI.
>>
>> =20
>>
>>Participating hosts (4 -> 4)
>>------------------------------
>>
>>  No changes in participating hosts
>>
>>Possible new issues
>>-------------------
>>
>>  Here are the unknown changes that may have been introduced in xe-pw-142=
946v8_full:
>>
>>### IGT changes ###
>>
>>#### Possible regressions ####
>>
>>  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-edp-1:
>>    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test inco=
mplete
>>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246=
ba2a90e951c71797327374db7/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled=
-lnl-ccs@pipe-a-edp-1.html
>>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-ln=
l-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-edp-1.html
>
>Not sure how this test could be related to the CMTG getting disabled at
>module load. I would expect more issues to pop up for LNL if disabling
>the CMTG would cause problems.

I re-ran this multiple times in a LNL machine and did not reproduce the
incompletion.

Pushed to drm-intel-next.

Thank you all for the reviews/feedback.

--
Gustavo Sousa

>
>>
>>  * igt@kms_color@deep-color:
>>    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incompl=
ete
>>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-bm=
g-1/igt@kms_color@deep-color.html
>
>If we look at
>https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-bmg-1/boot1=
2.txt,
>we will see that CMTG was not being used, so this patch did not cause
>any functional change to the hardware state. So this incomplete should
>be related to this.
>
>>
>>  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
>>    - shard-adlp:         NOTRUN -> [INCOMPLETE][4] +1 other test incompl=
ete
>>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-ad=
lp-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
>
>We only read the CMTG state for ADL, but we do not disable it. This
>incomplete should not be related to this patch.
>
>>
>>  * igt@kms_force_connector_basic@force-edid:
>>    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] +5 other tests dme=
sg-warn
>>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246=
ba2a90e951c71797327374db7/shard-adlp-6/igt@kms_force_connector_basic@force-=
edid.html
>>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-ad=
lp-3/igt@kms_force_connector_basic@force-edid.html
>
>Possibly related to
>https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2953 .
>
>>
>>  * igt@kms_pm_rpm@basic-pci-d3-state:
>>    - shard-bmg:          [PASS][7] -> [FAIL][8] +2 other tests fail
>>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246=
ba2a90e951c71797327374db7/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.htm=
l
>>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-bm=
g-4/igt@kms_pm_rpm@basic-pci-d3-state.html
>
>This seems to have already happened before:
>
>   https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_=
pm_rpm@basic-pci-d3-state.html
>
>This does not seem related to this patch.
>
>--
>Gustavo Sousa
