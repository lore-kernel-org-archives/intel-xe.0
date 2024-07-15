Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB646C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 18:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B3710E48B;
	Mon, 15 Jul 2024 18:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDU45KvP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B71D10E48B
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721067285; x=1752603285;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=FyNLzGb22q9Abmki34lpNb+r7nv9krXjkx7w/7i1kp0=;
 b=DDU45KvPH7bQRkkdIOCE2QLTdHJIgG997EDXv8oleek7bUtZsu0mOyMF
 W/8RFwVea6gOxt9eSOW4avIcI8lfp8uR2x+4kP5nAjoHCO9rB3W4aMOKJ
 L3NE3BEUff5hPrj7A+kwaXtWkWi5Qb2A/X5gzLV8IFH+O8UjSFdwgm/yb
 q+AmV62UgJzLBT1Kzs/c0ryY40E/MC6gP0CxYyjlMWLqgMmXz+Vz+TkX7
 6QLZlIdzwLLzrY3xvnCWyrGKUEfbWQp/umnQaDTP/80cTRoEO1OUJnG/a
 A4fE4AH0vTBrnBP4rOtW+JDPKlGh4KJ3NHqN/VdIxPEucE1crSMwQdJDi Q==;
X-CSE-ConnectionGUID: HY1my/UQTuaNSHV5/NWjTA==
X-CSE-MsgGUID: QVdFFgqnQDieCIi2APGNQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="29876563"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="29876563"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 11:14:44 -0700
X-CSE-ConnectionGUID: l6rrNMmCQmCC1bcfs7T14w==
X-CSE-MsgGUID: B0T/wzfaReyqFOPWb7ELOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49786487"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 11:14:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 11:14:44 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 11:14:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 11:14:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 11:14:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTARiYTPUGbZXoIZuFJB1NmUULPPJmTJ6BH8NSrDYIwI6fbefFVjPXlpDIsFYk6Yjl4acFpiwMGWbdJyBh1Cl6mfWnygrHxLZjKTlKC487lWDsvbEYmqzEIdH3aHzHDlM8E7WiglLUq4gmd/6VpBxOpiIPxG7mGAQyBaC0uyWtbBeKHcZVlby61kYx/rWtKllltnzg9DLFOlCGnvd7U0m7J7h0j9TykNiKXJKzz6ZlPO+9OLnLwoHKzyiWzBIX4A/WtDx2hJz3g3OeQaFqLkXB3kGr3EL4mRnfw37j8rxNXhFVgoDKek7eFeIWrAPID/5Eyyyk/q2SOTqcNqSWvxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyNLzGb22q9Abmki34lpNb+r7nv9krXjkx7w/7i1kp0=;
 b=eT5yeo2SjjTzQx8LwXSVIdllix8tLyAQSIv0+hY7xOzx4dKM6aWglA99Icz6fxWIeO7sqDW/rlrkt0hWsVmDKITvyYZq1Ol8XrVhYunn5RrVQtmcD4rG+npcm7DM37eTF9swwwyX1KH1J34Q1X6g6msKE88PWoSRqcMyaQUjCShctuRPmYE3CLFiRFnYvurk9qP3lLZXfJ6SQn/+2/md72EeRItH4QpeXeD5kIAljJBvRTnTw4wrtWtDnTAYDGtcKxWl2hCvzlQ03Y/hhCrwATBc9BsyGepN8J+Yv08KlJi+CdTwx0pg1GsD1srqyw4aseXk+U6kFJPNJx4lGSoLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA3PR11MB7611.namprd11.prod.outlook.com (2603:10b6:806:304::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 18:14:40 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 18:14:40 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Remove function xe_device_canonicalize_addr
Thread-Topic: [PATCH 2/2] drm/xe: Remove function xe_device_canonicalize_addr
Thread-Index: AQHa1qNI4saoC/2LtU+ueAU55GCxvLH30siAgABAdgCAAAUwAA==
Date: Mon, 15 Jul 2024 18:14:40 +0000
Message-ID: <1bce8ff9eaf181193401ab2eaa4337a4f9dd7dd9.camel@intel.com>
References: <20240715105555.2220444-1-himal.prasad.ghimiray@intel.com>
 <20240715105555.2220444-3-himal.prasad.ghimiray@intel.com>
 <dc1ba1cb5ec819259dda071b400323926f2e360a.camel@intel.com>
 <84b81613-0580-4baf-85fa-a1025df8d8d2@intel.com>
In-Reply-To: <84b81613-0580-4baf-85fa-a1025df8d8d2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA3PR11MB7611:EE_
x-ms-office365-filtering-correlation-id: b87fdb7e-3133-43c5-673a-08dca4f9fea8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dVA1U2d6dVdQU05SUlVjU28ycE1CakFVNlBvTFphSis2anU5MjkzdGhheXhK?=
 =?utf-8?B?Sk14aGM1Sk5VVjJyZzNwNGszL0kwZFFuaG5ycEtRWkJTWTJuUllTUitZNkpB?=
 =?utf-8?B?RXhpLzVOdzlCSzAxbmdsZjl2dUw3aTlqbUpBVnVETGJBWlR3Z2gwaGlRQXhp?=
 =?utf-8?B?US8xdnJlYVVEdE91NUZGVlVOczFLbE8razBxQlVkbFRDVGEzTVdYSW1oam1T?=
 =?utf-8?B?NUFwYit0cENVdEdDWmRNUFJzQm1uZnpFM0xSK1NCVCtkaXhQVUNuRnpEM3Bj?=
 =?utf-8?B?VUZDTC9Db3U3VnBCdXN4ZGhtUHpvRU9xL0hkbEtQWnJ3MGN6NW5GdHAwRFUr?=
 =?utf-8?B?SGtjUUZhR3h4dEd4MjlYaXFJVjdCemJ6SW9rUzVTNlNMZkY3TEVaN1JsRFMx?=
 =?utf-8?B?U0V5M1hlNXVVR053LzZxQ0I2cm1yVmJzMUhBbXhHS3gzYVZ2bmVKTDdyczNp?=
 =?utf-8?B?eFAxaGJ1SytPYVV2aENnRUhCZ3grRmxzZWVXZjdLQVhyMk9vTVdVTWNQU284?=
 =?utf-8?B?YzJraFR0ck15aDc3cThaQkVJR0U3WWgzSHJ4K0ROWk1za3h5RzNSZjBITndI?=
 =?utf-8?B?YitXalh4c0k1OTEvQTBzR000b3RMaTdadFlPU2pGRnBMS0FmVTQrVVI2OEFK?=
 =?utf-8?B?UElSTk0yU3FFS213Z3VLNnpQYWpoRFFQODc4RFEyMTduK2s0QXBoWmVkSTJo?=
 =?utf-8?B?dTl2cjNrRWxIeEtaa2pGWmlsS0JZRGxUSHdRSXpSeHBEcGxNdUVIWXQyeERY?=
 =?utf-8?B?bXJQZFNUc3k0bTFyUVN2VFBZQitGcGM5VklJREFPQ0FHenN3bWtTL0RzdE0z?=
 =?utf-8?B?Wkx6U0QvUGJpcFRlZWs2UE9HTFlIcnh4d2dOaWZhTVVYa2Fzb3dUVG9vUWsz?=
 =?utf-8?B?b0I2UWQrQUFtM3hhd1RxK1BrUHpqUVJ3Z2ZTZ1Y4Vk9lVitMMEl3a013ZGtv?=
 =?utf-8?B?R2h1WXlPSjRkUmNOby84K3VSWm9hRE9uaG1GbFdQV1gwSTZ1U0UyUERPNEpm?=
 =?utf-8?B?OXBJMW9taXAxWjVYNk94QjNnQWNhTEg4YkFYY2ZwRnlRSDBBbVpCbTBiS1FD?=
 =?utf-8?B?eTRZb2Z3eG9yYXZ4MThrdzBYOXM5dm1JSTE5Q1RnWUppbk5FeGpmcFZ6Y3V4?=
 =?utf-8?B?N1NxMmtTZk9PSTJVQ0l6Qy9iQVFpZmNHR0h5ZkxadlAyMU5UQjFPMGQyUmdB?=
 =?utf-8?B?ZGFPM2tac2hENHp6QW1MblQvcnp2TWk1VC9xbVBsSm5jRjFrQVF1YUk3NC8x?=
 =?utf-8?B?QzBsU01pL0krc051UldHZEZyb25NdlhCZXpKSkNvVFI2QzVFd2xtMVhWTllO?=
 =?utf-8?B?MGhIUGx2d3g1ajlvWENXSWRUOVZuajA3T0s5czFSeFk2SnU4b3RCeHJYT1VR?=
 =?utf-8?B?SFFBVDVGUlN0UlRIK0xhZmpDSFVoU0tNNVEwWFpTby9mZTBYK0JJWGdXeEhQ?=
 =?utf-8?B?bWZMdFg0NUlqZTZJUy9WY3BxQjVLb1hzRnlmQWpvSXpnUGRwYXIyRnBuelZN?=
 =?utf-8?B?T1U4L0NxNmNMWmdBQzUvRkJIZDk4SVlnS3duVFl3Um5QaEFpcGRscUR3Nm1O?=
 =?utf-8?B?aTdWRUwxdkc0dFd2ZndBdUtwcEIwSVd1WkkxQ3hoN25vYUlYRHlRaGZuT09t?=
 =?utf-8?B?MTZ4MXNSaTM3eGZEbUJyVjFEczVhYnVwTE1HRzBvNHJFNUFHSllhOWhLdWVJ?=
 =?utf-8?B?Y2J4T2hUeDU0akZla3dZSGVaT1F6dVB5bE44aGVEa1BYaW15Tnp4ZU1nQXAy?=
 =?utf-8?B?bnppOVkzOGtwa3BFZFVGUGF3NGdWRk95MXNMK3ZQUGc3NWpaK2lYbVo5cmdI?=
 =?utf-8?B?V0ZGbWxCZGgxTlhpMEh3RlM2NDV3eXg2cU1OeTZTVGY0dUVMYzlCQU1mdVFN?=
 =?utf-8?B?ZkprS2haZyszRHV2cWY5dGJJOElUYWQxbmZidDRFUDkra2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckdLRmU1bGNoZTdldG1hRnpXcEJCWDRsbjBmR3doQWd5QjhQa2VWdzBLUkIy?=
 =?utf-8?B?MWRMcVV2a1NyVTdxMkdLWk5xUGRWK0NVbG1UUkFsQXQ3YytiTG5DdnJKRWZF?=
 =?utf-8?B?d2RpM0dza1FvdEpJZ2M5cm14S0RiRmtGMGdacng0NmtPWkMxRHoxN3B0OHB3?=
 =?utf-8?B?cHIyZ1l0dXFLTURNWFUrcStteGFIaER3RzV6ekd0c211Unc1d0YxWkZ6Vmpa?=
 =?utf-8?B?cEFpV0toUldvNlYxNU1TZU9DWTB6QlJMRlVZL1puZ0orS2I3aXBNYlFhQ1Mv?=
 =?utf-8?B?MVlPaCt2eDVqTEo3cjJpelI3cEFRWFFKeWlleFpuVzlaNFp6d2kwWDBTbnNw?=
 =?utf-8?B?QzRCMlYwR3Y2TEN0d09vRGhXVEVMUUo2akNRaHVJbDQ3eWhhQzVuQnhYNjEv?=
 =?utf-8?B?Um9YamhXMTRBbkd3OVNkZ0lMSStxM1NicmVwVDVHekVnL0hIK2h1am1CMk8y?=
 =?utf-8?B?NTdMWWtuQk1oY1lmR2MzWWxBZVRUSWJQMUU2NXFNbUtPZURJaXI2cU5paG9B?=
 =?utf-8?B?cys5d1dEd0hkbDBSYS9uOWJFVG8yVkZSQitiRmhWRUtETGFCOFpvN2hsb00v?=
 =?utf-8?B?ZDJvTDFIdTVQRkJXSnFEMlQvSWQzT09QVEs0OWQxYWRFQXNuYW5EWWFRSFhG?=
 =?utf-8?B?UGRoNlR5N2xDNEo4M0NtTW1sMVpqem9vNE1tZnpMZ1NRRGZCYWYrZjFsYW1z?=
 =?utf-8?B?TjVrMDNzVTBrckxZN1lOMnFPS25PaEhabDJTL0IzRVR0NG5EcU05RUowOXJU?=
 =?utf-8?B?TmNBeVdYd2lDbmREOUhHYUQ0YUpHUFJQejZRWHA1TDdOSVFCMy9aMXJnU0VO?=
 =?utf-8?B?Q01GUGIvUDZObEc4UVpIckYxRmV1c2R2d1RKTDBRaUR1d0Y1cXdLYW1zdzlB?=
 =?utf-8?B?TXRuWUdRNXRiTFdScTRnOFY3NFh1cjh1bEdoRGpHWmJ0WEpCOEptZkxUczBH?=
 =?utf-8?B?djhBbGwxdTU2Y3BsenhhVXRYdGRDbTVDMldzNE1jWWhaRy81aDMvaEJUMUFZ?=
 =?utf-8?B?U1NaTmw1R2lCaG9zeXljWVc3OG5tWUlTaVNWcUZyaU1lVmVXQnJSYUZkUzRI?=
 =?utf-8?B?cVNWZm1hdDVkN0xySXFFOGxjZHRmb0hxVmhUM3hXZjRXSkVHemJ4ZzVqdmdS?=
 =?utf-8?B?RjB6Y25EMG9TK1RhSUliNmQvUGVDWW5DbERGN3FqRlFJc2VoZ0cvYzdqSUxz?=
 =?utf-8?B?SXZWZ1RBV3FjWnRXY3pzS295b0dmUFVPN1hWb1J4bFU4bGFZWlBWMFBoblYx?=
 =?utf-8?B?L1E3MERiMzNEZkFqaDlKSlB4OGVvY1JiajBKa1NLT3lwWFNsbFMvL201dFJ2?=
 =?utf-8?B?RGlBMithZWwvamRPT21uWGhyZThVOG4xemtlYWhnQjUzK0NHTDduT0trMmZD?=
 =?utf-8?B?R2xtRWRtNGtVVDVOOGUzV3A1T0V4V2ZzeG9OVUF3U1pGQk1zeWVoTzlEUEFs?=
 =?utf-8?B?V0d0c25JcVlIMTYrT3I4S3Uzc3VMVUU5aW42M3JOMmxLTXhFd2NkTlhwVlc2?=
 =?utf-8?B?K1JZL2JkekRzUGw1djlFZjNnUFNERHRJc2tLOFB2MHBYbkp5dkJ4d0FuQ3dI?=
 =?utf-8?B?MVd0YVQ3RTQxMndLR1pkdGVuelh5RFBSd044K1FJY3cvSWtJYVNablNUSkha?=
 =?utf-8?B?N3J3MGpHNFZPbWxPWEZwRTMzdUpvYllmSlY3OGQ1TlVJMUhTUnhIMTVVaHIx?=
 =?utf-8?B?N1RnSzcyYUZwaHFRbWxHTzF2d0NGNGxUWThxTTYwTTNnRFpkSkpPY2pLV0hS?=
 =?utf-8?B?blU2ZlNGT0JVbXA0WlpCNEQxQWo0Y0pwMHJBRlI5eTBXUzBMYU8vckN1ajlu?=
 =?utf-8?B?ODR6SG5rNE1QeUJjeWdCSDVIZ1p2RVovQm9sRkFWMzRmblBqbkNBbk5hSm5y?=
 =?utf-8?B?YTlQcUZhSkRLN2s5YUoweXdtUlI2UTc5aWdhNkRlcURXaERrTy9hYmtZeUNT?=
 =?utf-8?B?WUpDRDBjMkpjamsyaFd3OXU2MHNGVEN4WXRGRWg0SlZ6cVlkTHF6Q3BtZmVq?=
 =?utf-8?B?NDdNK2UyY3o2Vk5xN1hTVlV2U3k4ejlhSm5KU2FDVUh1STh1QTVkK25Wd3lI?=
 =?utf-8?B?MXEzWWFWV2NNaldWSGhaaEJJS3p3QlovSk5ZVmg0NGRIZThoQ0lmdXJWVHNW?=
 =?utf-8?B?MnNtYm9uTEZpaDlxelRjZ284VDdzV1lKSGs0OUlyNldWNGNTanM3eVdmUmtu?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62D1FF16C6D3AE46BB567A3175818638@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87fdb7e-3133-43c5-673a-08dca4f9fea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 18:14:40.5510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8KUSzTBKF7bgvmPk545F042joF3/r8AwpNYw7LWslLFjxqgJLH4R/iKjxq/NAneiabMNL41nAiDijBqmuvEL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7611
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

T24gTW9uLCAyMDI0LTA3LTE1IGF0IDIzOjI2ICswNTMwLCBHaGltaXJheSwgSGltYWwgUHJhc2Fk
IHdyb3RlOg0KPiANCj4gT24gMTUtMDctMjAyNCAxOTozNSwgU291emEsIEpvc2Ugd3JvdGU6DQo+
ID4gT24gTW9uLCAyMDI0LTA3LTE1IGF0IDE2OjI1ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWly
YXkgd3JvdGU6DQo+ID4gPiBUaGVyZSBpcyBubyBuZWVkIGZvciBjb252ZXJ0aW5nIHJlZ3VsYXIg
YWRkcmVzcyB0byBjYW5vbmljYWwgYWRkcmVzcyBpbg0KPiA+ID4gZHJpdmVyLCB0aGVyZWZvcmUg
cmVtb3ZlIHVudXNlZCB4ZV9kZXZpY2VfY2Fub25pY2FsaXplX2FkZHIuDQo+ID4gDQo+ID4gSSBj
YW4gc2VlIHNldmVyYWwgcGxhY2VzIHRoYXQgc2hvdWxkIHVzZSBpdCBidXQgYXJlIG5vdC4NCj4g
PiBMaWtlIGV2ZXJ5IHBsYWNlIHRoYXQgZG9lcyB4ZV9leGVjLCB0aGUgYWRkcmVzcyBuZWVkcyB0
byBjYW5vbmljYWwgaW4gWGUyKyBwbGF0Zm9ybXMuDQo+IA0KPiBIaSBKb3NlLCBUaGFua3MgZm9y
IGZlZWRiYWNrLiBJc24ndCBpdCB0aGUgcmVzcG9uc2liaWxpdHkgb2YgVU1EcyB0byANCj4gY2Fs
bCB4ZV9leGVjIHdpdGggYSBjYW5vbmljYWwgYWRkcmVzcyA/DQoNClllcCBidXQgeGUgaXQgc2Vs
ZiBhbHNvIGRvZXMgeGVfZXhlY3MuDQoNCj4gDQo+ID4gV2UgYXJlIHByb2JhYmx5IG5vdCBnZXR0
aW5nIGFueSBpc3N1ZXMgc28gZmFyIGJ5IGx1Y2ssIHNvIEkgd291bGQgbm90IHJlbW92ZSBpdCB0
byBhZGQgaXQgbGF0ZXIuDQo+IA0KPiBDYW4geW91IHBsZWFzZSBlbGFib3JhdGUgb24gd2hhdCBk
byB5b3UgbWVhbiBieSBsdWNrIGhlcmUgPw0KDQpXZSBhcmUgbHVjayB0aGF0IHNvIGZhciBub25l
IG9mIHRoZSB4ZSBrbWQgaW50ZXJuYWwgdXNhZ2UgaGFzIGEgYmF0Y2ggYnVmZmVyIHdpdGggdGhh
dCBhZGRyZXNzIHRoYXQgc2V0cyB0aGUgdmFfYml0cyAtIDEsIGlmIHRoYXQgaGFwcGVuZWQgdGhl
IGFkZHJlc3MNCndvdWxkIG5vdCBiZSBpbiBjYW5vbmljYWwgZm9ybWF0IGFuZCBIVyB3b3VsZCBu
b3QgZXhlY3V0ZSB0aGUgYmF0Y2ggYnVmZmVyLg0KDQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBD
YzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBIaW1hbCBQcmFzYWQgR2hpbWlyYXkgPGhpbWFsLnByYXNhZC5naGltaXJh
eUBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jIHwgNSAtLS0tLQ0KPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgg
fCAxIC0NCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiBpbmRleCAwNmNlYmFmZmI0NTEuLmViM2Ji
NDM0YjE4MCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
Yw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gPiBAQCAt
ODg1LDExICs4ODUsNiBAQCB2b2lkIHhlX2RldmljZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwgc3RydWN0IGRybV9wcmludGVyICpwKQ0KPiA+ID4gICAJfQ0KPiA+ID4gICB9
DQo+ID4gPiAgIA0KPiA+ID4gLXU2NCB4ZV9kZXZpY2VfY2Fub25pY2FsaXplX2FkZHIoc3RydWN0
IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNzKQ0KPiA+ID4gLXsNCj4gPiA+IC0JcmV0dXJuIHNp
Z25fZXh0ZW5kNjQoYWRkcmVzcywgeGUtPmluZm8udmFfYml0cyAtIDEpOw0KPiA+ID4gLX0NCj4g
PiA+IC0NCj4gPiA+ICAgdTY0IHhlX2RldmljZV91bmNhbm9uaWNhbGl6ZV9hZGRyKHN0cnVjdCB4
ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVzcykNCj4gPiA+ICAgew0KPiA+ID4gICAJcmV0dXJuIGFk
ZHJlc3MgJiBHRU5NQVNLX1VMTCh4ZS0+aW5mby52YV9iaXRzIC0gMSwgMCk7DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2RldmljZS5oDQo+ID4gPiBpbmRleCAwYTJhM2U3ZmQ0MDIuLjE0ZDQxNzFjNDY3ZSAx
MDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ID4gPiBAQCAtMTU4LDcgKzE1
OCw2IEBAIHUzMiB4ZV9kZXZpY2VfY2NzX2J5dGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQg
c2l6ZSk7DQo+ID4gPiAgIA0KPiA+ID4gICB2b2lkIHhlX2RldmljZV9zbmFwc2hvdF9wcmludChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gPiA+ICAgDQo+
ID4gPiAtdTY0IHhlX2RldmljZV9jYW5vbmljYWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwgdTY0IGFkZHJlc3MpOw0KPiA+ID4gICB1NjQgeGVfZGV2aWNlX3VuY2Fub25pY2FsaXplX2Fk
ZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNzKTsNCj4gPiA+ICAgDQo+ID4gPiAg
IHZvaWQgeGVfZGV2aWNlX3RkX2ZsdXNoKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiANCg0K
