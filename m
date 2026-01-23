Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A49D778B1
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 22:45:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526C010E23F;
	Fri, 23 Jan 2026 22:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6dFYHPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72E810E23F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 22:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769208320; x=1800744320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k8i+2MQ+1Sg/41ujdID3/jm7IyLhSeHO0FN2faFN2V8=;
 b=G6dFYHPkVKYexcclsVaYn1oREuMml/V94Ko47QutzsJuAXDrD/k9rZdQ
 JS1c9qqds6Dt9qMa+Sl4z8RCYmJueH0kziAekDnL6Fk4dsxSt+G9wwsvl
 SPKwQScv22Ftm0BCxuCsfVNDKO6NHBNQnCD5o6iz/wIr5v6Ni7h6AjRxK
 /DuS0zW4fPOBUKzTpjVgoNAoIR1f/D7dX2Xx6De3Z3pcgIz8CiW7l6aBH
 aBNkXTQzG5ptIyzx256FQnddHHDk2stBl1QtM/PWURZQpjJ7tgX3ndrs+
 FYYL/nvpxvBddoOPr2cXzmURgK0TH1Wgy1/OsPLJKgPjtR8ifUZijQtrs w==;
X-CSE-ConnectionGUID: EqY/nekZS+eU4B8rBdt3pw==
X-CSE-MsgGUID: fFRD4c27Q7OMda714oyrVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70515271"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="70515271"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 14:45:19 -0800
X-CSE-ConnectionGUID: gEUk8aF3SkCEETiXsQf9LA==
X-CSE-MsgGUID: ZRt46QesTryIQiY4RPVYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; d="scan'208";a="206740213"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 14:45:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 14:45:18 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 14:45:18 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 14:45:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfvrQ20HxqZy6H7XHmYEXP1gGbElWS9Mqo8iOKAIm25/yZ+UZyTGW4qVq2l+nKjt6EoiBh3ihhScNFzXzVya7aT7DKDPZl9LvN6NWhfUgYMoFo/QYJMBUMZbBP8AbMLZN1WbSGk7fAU80SiRdfMoYSBpRyMW1Gj7Ee2dNGLvhg/WyUDsZ4gtVqdyegZk/a1L6qBFsmzymZBNwECRPyhQFlqBCNHHv3xX3TmzjKKBnsOKbeYbiY23jh/WoWgkpprwdpfjbW/BfrGQ3BNqhi9ATQLWQQNw6pf7S/Gvvpqg5/uVSWLBGncQvnMLohfKzdlQxPDVMINnTQqYOjStxq/wag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8i+2MQ+1Sg/41ujdID3/jm7IyLhSeHO0FN2faFN2V8=;
 b=ERLtPwWwoBUGEsR/zsFm3antBjVC2+Tq8AvImaQUUo5SBp5UekQxYNA2Ew9RTWSOznigUMS8Npcqoskw83aPtZLYJNyM2VdTTFkTySOttc7zTATIuteZX+DbLJ48djO8BAq/95lW92Kw1ZSWD5HbKkjm105LmUPCrAhmpZuUDVj/vJGWSfkz+Mj0/wbU/mT5kQ1sZ8NAja01VlipNefW6iwSvx/bvMTWEiAwXFI9nEWKlNVHExAnMiJW97NPxB4tn8xNjdnLyjSyNvtbwrZonDmIqKCuP67sFjhth8+D146AlGgGrcduGh2DlA2M5+ZkKldaD2/+WZ2yAarW/f569Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8864.namprd11.prod.outlook.com (2603:10b6:208:597::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:45:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 22:45:13 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Disable D3Cold for BMG only on specific
 platforms
Thread-Topic: [PATCH] drm/xe/pm: Disable D3Cold for BMG only on specific
 platforms
Thread-Index: AQHcjI14N6iWBFGCu0Kjlmrew6TMcLVgWsGA
Date: Fri, 23 Jan 2026 22:45:13 +0000
Message-ID: <1e3e1f457997d04a1f920dd53d5a04689d981840.camel@intel.com>
References: <20260123173238.1642383-1-karthik.poosa@intel.com>
In-Reply-To: <20260123173238.1642383-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|IA1PR11MB8864:EE_
x-ms-office365-filtering-correlation-id: dd549189-ff9c-4ea2-adaa-08de5ad1123c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?V1F2UG9EOTM5Y3o4MnlxVjJLaWVrSUlDZEI5WFJxd3JCaHlOcEJjZk1iRld6?=
 =?utf-8?B?OU83SXpvbjA2UHhsRkV6dExYenBQZWpnbnBwbUhTK2NRVy9KM1pVeDQ3cVln?=
 =?utf-8?B?ak5TaEZ1UkZPdnhPVTVWYWZVeWdERzlCaFdKZ0hWVm5kcmQ2SzQ5WXNzckZx?=
 =?utf-8?B?U2xYKzN5My9JQzJGSkduK1NlZEZiMkpCbGh3Wko3ZnNEZ01KYlAybmhZeEhG?=
 =?utf-8?B?N2Fsb3BqUE4vVVczdTJTRUVoU2htL1lHazdkaWlFUGpsNkxxV3IyM3pTdEsr?=
 =?utf-8?B?a0NDU1Q1NFg1MHRXQXBVc3FsdExzeEx0L3d2Zzdkb1JNYVRMVS9ZTlI5RkR6?=
 =?utf-8?B?MllJd2pjOFZBaGtXZXR2SVF2YWcveFRqUU81LzNDVnpLSkhKeVdQczZiVkdQ?=
 =?utf-8?B?RUYyNm5RNWJUQnBqTUV1MTVyVnFvL0prdWJiN1U2SVZWQzVXNmVwbG1GbkVC?=
 =?utf-8?B?TVNSb1hhMndIc2FhbmU4RmEvalU4NFY3ZGV6SC9SaW5DVHFIbkkxOEFXM2Vl?=
 =?utf-8?B?eUVBZmJDeVpBcUd0by9wUDIwVmhoQjgvVmxiL2lXNlZMempqa1ZKaUFEQXZu?=
 =?utf-8?B?eVFPa0pzSUFhcERDc3VLU21uVERzMEx6ZVRpU3g3K2xBS2l6VlVSYVFOdGN3?=
 =?utf-8?B?VG9vdWVtc1VxNTRCeVl0VUtzVVdoWitFZzVLcGgrV2NFSXREQ3c2amJnTW9o?=
 =?utf-8?B?K1ljVXM5aHJNM1dDRHdiKzh2c2hlOFFQdUJ3b052bG5kSFY1WTRIRjNmb3dv?=
 =?utf-8?B?bStldXl5QTczWkpOVi9RMlhWd1VaOWFOS0xWNGplaHN6dElzL256TFhNREtR?=
 =?utf-8?B?UmhWcmJBYWpEa1dnb3JURW04bkJKYU9LMkZXd29zdE5vVENNbkJ2bm43U1p3?=
 =?utf-8?B?aUlmRmk1Vk85U3REcDhZN3pjekRtMHJ0Vmt5Vlhsa2o3SnNLU3FLMFE5a0VW?=
 =?utf-8?B?Um1jbGxZWExwQlBaMFF3VnFhcjA3czNGUmwwWE4wTk1SL21hYU8wWXlTcTQx?=
 =?utf-8?B?VGtWWEVMREVSRkgwVUpKdGtLR05GTUJuUnVtSUJBeElrL3AzWkdaZDE2NzdW?=
 =?utf-8?B?YWtrakFxLzZjR3hkNmg5aG5saDdTUE1MRlYzY1JxOUIyNVRwc0U5TDJaSTN6?=
 =?utf-8?B?Y0w0djFjaXBhODNoRkgrZWU4Q3NjNDJlR3ZuaGhCVWdXRXU5UmlCLzltWG8z?=
 =?utf-8?B?UElZTitQWVhsbGVyajBrWVIzQUh3OWw1cjZvcHE1SmNlZHFUWERxMDUrNHdJ?=
 =?utf-8?B?TklIRmJNVm03U2FYajJQeUtnbWJHYWZNSE9CaTRDSEwwTGw3OU92bXFaOWtr?=
 =?utf-8?B?WGowZE5VVVZTNTlEYWhtRWVVMEZ2SzBENkpyd2NaZTFJbzlaTUNNYkhZMHln?=
 =?utf-8?B?eEVySEpaUGdUVm9jVEJZWE9YeVd3cmhHZkxidTRFUFpJdEFNcStnRXRNMnFr?=
 =?utf-8?B?QnRzSGVHREh1b3pOU1hvMlpPbTVvQTF0L2JKTVhzK3N4NGRETklWWWN0Sk5i?=
 =?utf-8?B?RThYYTNvL0MzNlVQdGJ6eDZQNTBtbTBBMDB2Nm1YUnQwT3REenFQYnUwZXlq?=
 =?utf-8?B?eDYyOGg5b0dkYzFQWE9jT2JOUWdUZUVhOGZCT3JPeFFCanF3QktqM0FIY1pZ?=
 =?utf-8?B?NFptbzk4TmtuWHZyejYwYTdQMitRTmdLV2w3d29MTGdITFJZd3VVM2V5RHlR?=
 =?utf-8?B?U1R1WDYxM0RMaTNJK3N6eHlCbE5QRForSjBjbS9HeHpOMXkvUFAvY2VNQWFq?=
 =?utf-8?B?aWdEbzdHdE4rS1FhVk53OVplZ3luYXh1enUvT3VFWlVaT1pnWFFBdDU2aS9O?=
 =?utf-8?B?ZnVLMzdENXphY08zK20waUp4dnQ1QndhT1lXZ1lqQkVrY09VUU44b1pTQjN0?=
 =?utf-8?B?WVkxUDJnV043TVQzWm9sK2l0aXFuSXhMdFg5REplWjVEWDZsckdPZWErYnlj?=
 =?utf-8?B?WE1MQlc0cFJOZ1VoWUVWcGR6VmU5Qk0yb0xkT005RGRzUHBCcVhCSDRoRjZj?=
 =?utf-8?B?ZlVBYzJ2TWdpZVlNaWN2OTB4NGR6ditXSVJGWkp1R2FCTkw5NmdWaXRuOU5u?=
 =?utf-8?B?eUNpR2lqbXBQemN1YmtMN2ZjQ0UxMHZlWFdsRXl4ak5PTzFFcy85UzJzRjBN?=
 =?utf-8?B?YUFmV3pxeEFLdmMybTJqbFRMS3FoS2dCclBmSVo3QzJmWDkyMHA1UlMzbSt4?=
 =?utf-8?Q?MEb0lXrWHMNppLDztz4RCYI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2VnTERzdSt6U1pWT3drOXpOK25TSlpqQjBvVTduZitEWlFzSzNKZnc1clZr?=
 =?utf-8?B?dXg4Slp0YnNQRjVUSVljOGpGK0ZhVThmUm1IMXpkSmxlZTA5YVliUzdtRVBu?=
 =?utf-8?B?TndPYXFhb050SlpHM2pPMDQweWs0VzJKNXZtWnpiaVVUTHUxS1RqS1U4Y1Iy?=
 =?utf-8?B?a2ZsWTYzQzZRaExNNktGVG0xanExQU9YRERHa2U3eE81S0xPQTcrbG5rZHJP?=
 =?utf-8?B?YktWQjFCeWw0MTBCL1ZhR0hZVkRGdXRBcDQvOGhib2tld1ZERkN3bzR5OEI4?=
 =?utf-8?B?cFYxZ1Z2M0gwY0hCTGFIOXU0cGhnN2xjd1FMVTFUd0RqcE55bW1SeEd5dmNr?=
 =?utf-8?B?MDVBTVlPd0xLNXdXY0treGZiY1dKVXZmRm5NYWp5MmNuU25KaExvQ2c1YzhZ?=
 =?utf-8?B?Um1CcDk5ckRWWnlZMlN3dnNBaGNVQW5jTUE5RERBTDBrTzhydk85bWVRU1lQ?=
 =?utf-8?B?UGZtQzBGVHlKTjBIb2NXQ3RJWmoraHhWMHY3QkNpU1VLa1lsSHlJWlhHN0Nk?=
 =?utf-8?B?MURyQy9ZakVzTC9vaVd6VFJ5YVc5MU5kUWkyNUM0OXJjV0g5eXpRZ3hDWkhl?=
 =?utf-8?B?aGdiNHY0UnpqdWdWYWNITys4eXliTzBVYmoyUHlzaHJNVUgwMk00T2VRTm8v?=
 =?utf-8?B?RmZWMFRGUFJnWllNRUE0ODJkZkVJMUMwMHhVWjgzVnZ4SjZLQ0h5Ym1jQ3VR?=
 =?utf-8?B?OE9VR3ErVHRXOUJPbW9MQVh5djRiQnhmaGtsVVh3TmFDNUpJV1pWeFQwR2M4?=
 =?utf-8?B?c0paeXdqZjNrSG50aHJHL0cybXR2NEJrQ1Q2K0s0QUtFb3JaTTc3UWlKaGxm?=
 =?utf-8?B?QXJjb0dVOFlhK1dmSFNWV0VXNlRkNkQwYzBPNzFuN0s0VkZxcU1iQlNiUFJD?=
 =?utf-8?B?RjJpc3BRZ1lLc3NURE8wbUpHeDJJbFpJZGtTcGxGczkzVXNEUnUyMjJsZDFQ?=
 =?utf-8?B?djdMRzhCbmc0aW92R0d2eGpQbVZYZmY0V3VOU1ZRVWZoTER4MUV5NVE1cjQr?=
 =?utf-8?B?RzN0ZWQwUkhvNU52V2pNWTVaR1M2WDJ6Qm1qR28xZnNlajRsRExBb200d0ZJ?=
 =?utf-8?B?NGIrNDdJUTFNN3ZiUk5rcnBXSjNSN2R3QVZHc2Z4RjNJRUxwejRvMjhXNmtw?=
 =?utf-8?B?RFlBTlZPcWFyeXZLTldyREF4TXpxUkw3QmpOM3Ftak9pTWd6WldXRitFZ2NJ?=
 =?utf-8?B?SDRrS1lYbDNyaGxJODZjejlUZmxvcTkwanE1WGRlREZxODY2SzIybVlvdEtw?=
 =?utf-8?B?QjFaWTdGN2xtSTRrUkZnQXk4NGhuT05tLzdhWUxBdEI4RHNXa0s0cTNWQi95?=
 =?utf-8?B?eWRFWFM2UTl2SjcyanlvdmpIc0dZNFo1bmJsR3VZVHc4QlEvcVpWajMwd09S?=
 =?utf-8?B?ZkJJTGVqWmNtbWpkZlJUenJZODNaclBhd2JHVWF6ZWdoZCtIMmd4MXZzd25j?=
 =?utf-8?B?a2JpbE5mb0hGdzUzRVpxUHFkTWREaXh4dzZMK2NvVXVvQXM4TC9KMnNNbzJ4?=
 =?utf-8?B?d1RxbzZaSU5Ocis1Q2taZE10bUJ2WnZSblJhdUN1bmgzRE1EeDlFd0VmaldM?=
 =?utf-8?B?ZVVCMS85MS9NL2NtRUlHZCs4aVhKR21US0tkN3kzNHVybXBVUTJTUXo5ckZT?=
 =?utf-8?B?TGNGVmtETHBKbkhVTlFFZXpFczZEUEpwdEVmdUIwZE5rOUJQSWtWRC9xK3U5?=
 =?utf-8?B?U010b0JNanFYVGpXaVpVcnJFMm9nRnlQbVVBcmxlcnNQSWdDSFRGTlh0R2U2?=
 =?utf-8?B?Tmp6dUJwc1k4RzlySDBscTFoazR2cGVIMis1V2pvRktKdHNiaUI5aEt6c3RC?=
 =?utf-8?B?QTVZUzlvbmM1cGwvWVFYWm03cTdyUGVvR2J0MmtDajZDL0s2eExRU0M0bFJ0?=
 =?utf-8?B?VFAyOGdFZ0dOSGZDM1JPdmFnVkhZMjZuNmROQzdqdUpxc0NvaWJBZFhKVnJ2?=
 =?utf-8?B?MEZ1VlFMRmZDKzZyeVJJSmY3ajVISkNrQm02WHRuZm0rSHJRQkxMc1BOTWZS?=
 =?utf-8?B?UzVkdmxXWmFHMDBtRFhSREV5VGF5SlZqRlVWZmcwUXgxSWQ2SG45R3Z6cC9m?=
 =?utf-8?B?SWtoUHkyNXFTR3FZWEZ0Yi9BVkdUMGdEalpYOUpBQXZUNXRnSFhnZ0lJYXN4?=
 =?utf-8?B?eFNQUEtzUFFCRVhxVnk2SWJod1hlYXQvbHJxZFBWc0JzdTlBM3poTndkQ1hk?=
 =?utf-8?B?VHh0LzltRVlBdTlTM052dDdIdkhrc0VsMXZ3cndrSW9hK2F3M0hWMi9tN0Nz?=
 =?utf-8?B?RXBZUFhxN1RWN0svZ21lbHdJRnZ0bFNCb3k1OHkwNlhBNzJRbEppaS92L0ZI?=
 =?utf-8?B?aHBUT01hNkliVy9OZURMWkw4Y2tvRTFkaEsyRGVSYWo1THZvOUJGZFZ5cFhh?=
 =?utf-8?Q?J7NpOLsY9vFgKzbI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E72A690F106BB54CAD771F0DB3FAF808@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd549189-ff9c-4ea2-adaa-08de5ad1123c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 22:45:13.3397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0cmGHweGhlKDct44f0AYm9N4nyRGcw/zjOQkB4FmHsQ87I3sjgN12VOT/0wZABFc0O9GrAw8eBGVOyrw/W9PrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8864
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

T24gRnJpLCAyMDI2LTAxLTIzIGF0IDIzOjAyICswNTMwLCBLYXJ0aGlrIFBvb3NhIHdyb3RlOg0K
PiBSZXN0cmljdCBEM0NvbGQgZGlzYWJsZW1lbnQgZm9yIEJNRyB0byB1bnN1cHBvcnRlZCBOVUMg
cGxhdGZvcm1zLA0KPiBpbnN0ZWFkIG9mIGRpc2FibGluZyBpdCBvbiBhbGwgcGxhdGZvcm1zLg0K
PiANCg0KQ2M6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCg0K
RnJhbmNvaXMsIGNvdWxkIHlvdSBwbGVhc2UgZ2l0IGl0IGEgdHJ5IG9uIHlvdXIgTnVDPw0KDQo+
IFNpZ25lZC1vZmYtYnk6IEthcnRoaWsgUG9vc2EgPGthcnRoaWsucG9vc2FAaW50ZWwuY29tPg0K
PiBGaXhlczogM2UzMzFhNjcxNWVlICgiZHJtL3hlL3BtOiBUZW1wb3JhcmlseSBkaXNhYmxlIEQz
Q29sZCBvbiBCTUciKQ0KPiAtLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYyB8IDEz
ICsrKysrKysrKystLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0u
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wbS5jDQo+IGluZGV4IDU1OWNmNTQ5MGFjMC4uMDEx
ODVmMTBhODgzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcG0uYw0KPiBAQCAtOCw2ICs4LDcgQEANCj4gwqAj
aW5jbHVkZSA8bGludXgvZmF1bHQtaW5qZWN0Lmg+DQo+IMKgI2luY2x1ZGUgPGxpbnV4L3BtX3J1
bnRpbWUuaD4NCj4gwqAjaW5jbHVkZSA8bGludXgvc3VzcGVuZC5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L2RtaS5oPg0KPiDCoA0KPiDCoCNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4NCj4gwqAj
aW5jbHVkZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50Lmg+DQo+IEBAIC0zNjYsOSArMzY3LDE1IEBA
IEFMTE9XX0VSUk9SX0lOSkVDVElPTih4ZV9wbV9pbml0X2Vhcmx5LCBFUlJOTyk7DQo+IC8qIFNl
ZSB4ZV9wY2lfcHJvYmUoKSAqLw0KPiDCoA0KPiDCoHN0YXRpYyB1MzIgdnJhbV90aHJlc2hvbGRf
dmFsdWUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+IMKgew0KPiAtCS8qIEZJWE1FOiBEM0NvbGQg
dGVtcG9yYXJpbHkgZGlzYWJsZWQgYnkgZGVmYXVsdCBvbiBCTUcgKi8NCj4gLQlpZiAoeGUtPmlu
Zm8ucGxhdGZvcm0gPT0gWEVfQkFUVExFTUFHRSkNCj4gLQkJcmV0dXJuIDA7DQo+ICsJaWYgKHhl
LT5pbmZvLnBsYXRmb3JtID09IFhFX0JBVFRMRU1BR0UpIHsNCj4gKwkJY29uc3QgY2hhciAqcHJv
ZHVjdF9uYW1lOw0KPiArDQo+ICsJCXByb2R1Y3RfbmFtZSA9DQo+IGRtaV9nZXRfc3lzdGVtX2lu
Zm8oRE1JX1BST0RVQ1RfTkFNRSk7DQo+ICsJCWlmIChwcm9kdWN0X25hbWUgJiYgc3Ryc3RyKHBy
b2R1Y3RfbmFtZSwNCj4gIk5VQzEzUk5HIikpIHsNCg0KVGhhdCBpcyByZWFsbHkgTmVhdCENCg0K
PiArCQkJZHJtX3dhcm4oJnhlLT5kcm0sICJCTUcgKyBEM0NvbGQgbm90DQo+IHN1cHBvcnRlZCBv
biB0aGlzIHBsYXRmb3JtXG4iKTsNCg0KSSBkb24ndCBiZWxpZXZlIEJNRyBpcyBuZWVkZWQgaW4g
dGhpcyBtZXNzYWdlLi4uIA0KUHJvYmFibHkgc29tZXRoaW5nIGxpa2UNCiJEM0NvbGQgYmxvY2tl
ZCBpbiB0aGlzIGhvc3Q6ICVzXG4iICxwcm9kdWN0X25hbWUgDQoNCj8hDQoNCj4gKwkJCXJldHVy
biAwOw0KPiArCQl9DQo+ICsJfQ0KPiDCoA0KPiDCoAlyZXR1cm4gREVGQVVMVF9WUkFNX1RIUkVT
SE9MRDsNCj4gwqB9DQo=
