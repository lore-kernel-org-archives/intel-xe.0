Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B7C54756
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 07:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22D510EB60;
	Thu, 22 May 2025 07:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iuRmNmHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB1C10E0FF
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747900675; x=1779436675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qXqRFmO2F467jNBoZ058cfkUeXiZn8apHZxNqM+S0sE=;
 b=iuRmNmHyuv8yYYEktwbBOGj0G6D1puazGTOEMpdFMIJyIsC5l3Z/RF+0
 LLeaV+zhobJ/HsFpfTZz63YFLuR4mwjthEHngnotIG3l8YdCraZW7QHcd
 WS9FNaYoScWUrDxh8pAchV1zwyRnAJ5r0oIjZkz+2bT2+Q1nrSbUyUtHw
 gw9urVansF4U+Y6o9DFtnfS6Y5+c6zD0Jw7eSxM3UrY0SKsUI88EPT1EL
 OJKX5CWiBU58NJAhflt4rDeU19/15D/LjNGlnyOVkM3yWhJ2zDFqIk4IT
 VS32HrwUaRuHh13K1owLyAk1h0FDsBnlPlJWvUl3bPfy7deADl205uRnh A==;
X-CSE-ConnectionGUID: EwobExBORUiafIFiHO8ZCA==
X-CSE-MsgGUID: uCa1SqKTQDGiTsjnptFfCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60548800"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="60548800"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:57:54 -0700
X-CSE-ConnectionGUID: 9rlZfah/RFKcPVvFPF0Z5Q==
X-CSE-MsgGUID: JsYmM/3fTUKyI5OWgYra1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="171355898"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 00:57:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 00:57:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 00:57:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 00:57:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvL+2+VH8qPCl7PeWM4+jC7IY2eP7N73Jo8vxvfZEAU9gsM6rAGQvANvWsmgdCZbVxKEPKJm5YJ0cxFqm78KK0GV0pjcQAvRZXXAmQqzvEC+F565tuq/P2x6FMf/iJksQp4ytjGoD0gE6i9yeFgX6wKAu3DFsGk5UCYXf51unbkRrBvqpupdyJ9ejdRoeuxDnoukC1QRTKAcs2NiC3EvSg7CkbSVS+tuDIrobxaF3oiGfTgvInfPBDRjWtaOQg/ykpGR44YYwEZL4xBGeH5zZXer8VzY3S5LGAgALV6f/LG9J7i12g0A/rrxkaPeN5wIFfiHfKEJGhHe17C2KL4k5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXqRFmO2F467jNBoZ058cfkUeXiZn8apHZxNqM+S0sE=;
 b=BW/Rg3t8rcOB8nvJGsd8IhsdaQTzXDrib2zSPRvJCGCz5owgMifTAawANuPOJ/+oK7S+iwsoRUwEjIBXavRmoxIkbyIsZAQ6M+hHgn7VNAOCOludj47oxhBTF0RJW36He7VLMVTCA8/Yz+8KuyhW3dzMFJVRGSW/c3hgsd/WfFHFfoggqxQXPL4PcG6m6Efa/ud5RRmZLVXVvPbvbtwbM4bYbaKJrSIWDa8Av4EIZ4gc7+2mXa4HpvTwWaNqgKU0Kh09a0W9rbFICj7Z/OfPTO+UdFEVeYlODl6u3vlAYqc5AvQ61TuL+w2Y4Z+jRoteYGjdsgqLQj05MVAv7hJQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 07:57:51 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 07:57:51 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v4] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Thread-Topic: [PATCH v4] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
Thread-Index: AQHbxYCoi5gGlL22JE6S2FXWyiBxoLPdpGuAgACunnA=
Date: Thu, 22 May 2025 07:57:49 +0000
Message-ID: <LV3PR11MB8695E8000C731A8748757E81F999A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250515101952.19317-1-satyanarayana.k.v.p@intel.com>
 <e04fe935-b7ec-4c74-a472-230ef71f9e64@intel.com>
In-Reply-To: <e04fe935-b7ec-4c74-a472-230ef71f9e64@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|MW4PR11MB5935:EE_
x-ms-office365-filtering-correlation-id: 321721ab-6d37-44ca-c97a-08dd990659b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RjgrSDRQeG9qNlh3RVBUYnIzTExob000Ukt1Vkw4L0VvUFdMOXNxM2tYUVlx?=
 =?utf-8?B?cWxpVysyZy94ZExYL3VlSWxtNHRYUUZKNXFTVU1HSjFETHRxMHFicFdwSnFh?=
 =?utf-8?B?Nk9XOEpOc3l0VzVWT3JrZXllUTVCOVloa0VIcmllQmQ1Z0pQcXZLY3JvcmNa?=
 =?utf-8?B?L1NGRHZrTVVEUUs5QzJzRlE2UE4zUkpoNTdTUENJbXpBVkhWNFVhcy9SaTFR?=
 =?utf-8?B?Yk5KQXdmWXVYMDlneHl0L0lsaDFaNmhRc2E4d2FaVFh1YmliU2hKVVR2RkNR?=
 =?utf-8?B?Y1FHWmZZWmM1SjZ1SkRmejM1SGUxeERyb0l4QXVFckpnZHp0Y2NFNTFxZzZs?=
 =?utf-8?B?WEcrL3pFc09rNVBWSlkxRnl0RzdUSG5ZcFRGZnZFNGZ2WEp4ZU83dHhZemFy?=
 =?utf-8?B?YUVzVmFnVnVwdVdMTnFXT2s2VlFkdnMyNGxJZ2tMeTBqNi9iaXBNaXh5d1FJ?=
 =?utf-8?B?WG5Ca01BTkN0SmpWZVJUYmFsOGYzNzlYQ0xlb0Z4QzZhZUlkdTVobzRjN1ht?=
 =?utf-8?B?Z3FjSnU1NHE4cTNrNGZzdkFsa3JzQ0trLzNySmVpZDAyZkk0MTl3ZjR4RGFQ?=
 =?utf-8?B?aDJlbWE1eGJBMmtGcEVhYU5Lb3VOL3gwazIxbFZnSit2d1FxalJONkxjd0JW?=
 =?utf-8?B?N3cyakxDUVJkb2l4ZXp0aVVTc1VYM2RHbDhmcnNJRE04T3NHZ1htQk9kbzlI?=
 =?utf-8?B?c2JIY2xiWlE1MlRMY2UwUVRYbjY0MysxSXFOYUZodkp3a3RyejhNMGNrTFhm?=
 =?utf-8?B?MlUrS0hJcSthNlNzcWc0eVVqTjBWelhZa0NrOTA1d1ZBZ3U4Um1CSkJ3dFZF?=
 =?utf-8?B?eUhZOTc1NkRxZmhaOWpEMGxuaFFQeXJEcVVQVVBSMWZOakd1L2EyMzRsU2pC?=
 =?utf-8?B?d0tNbDZXWWtWemQxTDNIMGl4bGVPNnlXK1h5NWw0bXBFQmw5QjBpeDVxNm9u?=
 =?utf-8?B?K05WMDZJUElHZWlZZ3NiR3JEdXVBUCtkTWcrUTBUNm1RbXpnTEtJaXFIVXl5?=
 =?utf-8?B?MVFucEVrc0RiaG9Wa2pmaFU0RGhqQmhxZkN2TFk2cisyekFaNlo2eHpjL3hK?=
 =?utf-8?B?cUh6czZwTlZMVTE3VDBVRitJYVZxMnFNUnNSUjgyaDUwdTBuWWVQSXY5cW5y?=
 =?utf-8?B?eFdPaFpQcytURDhuanN6R0gxTjdackttWGNGL0NiNWxXNXVaaEJGcmc5ejh0?=
 =?utf-8?B?TE5ja3BEQTFEdEdHV0YzWEgrUy8wM0lxaFNCelVORXA3emRLdVZBeC93bGto?=
 =?utf-8?B?WExDb1o3ckFHM2wydldyWlg4QVA5Yk81dlRCbWdycmFBalpkdG5JZXE2K1V4?=
 =?utf-8?B?Q0hFdmxHVXBya21iTTh2UnhlRWlqRWtGZGErTURFV1F4ZFFDT21oT05qMjBu?=
 =?utf-8?B?TE1QMUw2dUlWY1VjMVRkblpHWkMvQUE1Tmo1SEtPa3U4V2w0OG1MRjdQb3k2?=
 =?utf-8?B?MzRsK3JIWFlwZllieGRJeWFmb1N0STdicjZUM0pXMW1hcndqZXdlcmw2UXhk?=
 =?utf-8?B?NEhLQVRXSGRhSlR3bmhrVGhpaTB0emJJMUNJZG8xR0NLd0NMamIyS216Qm9k?=
 =?utf-8?B?bU1SUkpVa1NhbzdXL2p1cjdBRTJSeCsvSkpzeEoxUVFKYjlTSTdMa1U2dzds?=
 =?utf-8?B?b1AvRElJeFJ6RkRabzRxZ1ZtOEx0VFhWTjAyZkJHQmJpR1NEU3dsOGdacVVE?=
 =?utf-8?B?TVlMclpYMjB6eEx3a3BxWW1nK093YkFNZHd3UkFXZ1ZuRFYwSjRjM1lwdnhS?=
 =?utf-8?B?eG5ickRCVm8vU2RheGF6bTJBSnNNVS91K0dSR0hSa2Z3V0NkVThYUllLcDNP?=
 =?utf-8?B?OWZoeG51MW5XRUFNcmdlOEQycThWYlNxZm96eWJ1blZxdURqK2F0UTNKc1dZ?=
 =?utf-8?B?MitkaGExYWVNSGVaQzFEamlnOTAvS1BaOW1IOVlTbnQvWThtTHRkWDF1UTZN?=
 =?utf-8?B?QWFza2lub09PdHpYS1BiQ2l2ZFdiN0xIVFM4eEVIZnJNdnBDRkNzVUEzVXYv?=
 =?utf-8?Q?l9aL10Z7j2gb8ZaWL1j3zsJ9BLdFIA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEpFYU1va0VveWRZZXdVUjZsTEJFMGZuOEp0Ylo1bjBmaVpDdkxEWm5HZk4z?=
 =?utf-8?B?cmNneSs4MmJxUUtiZGRwRU52eWNIb3JETGNYSlpFNU5hS3JWczZyVzJqN0tt?=
 =?utf-8?B?cyt0eWxDTThKUzgxN2w5NXZhTUcvdlhmQWRMaFFreGUySTBCeHB6YW9telNk?=
 =?utf-8?B?RHBMKzlKMm9Ycm51dWcyd2RRc2NUaUVucDRMQ2ZvOXhhNllFM3NKNDFjdlBi?=
 =?utf-8?B?TC84ZzZhejVNZGxlR3BaRE5zWktUVU4zVWtVZ0RBUTRqdmNOMmorckpXN3Zl?=
 =?utf-8?B?RWJocGo5c0ZXNWhjVi9Bc21RbDU1TzlSSXNBSnhMWUF5ZlRQaTM5TEVoOXZr?=
 =?utf-8?B?empLV1E4T05OelV1a0F5UFdCU2Z6NFdsU2MrL05ETCs5ZWRCa0ZEMmIyVUNI?=
 =?utf-8?B?Slljc2IzVUJHeThsckRjN0hUT3A2aUJ5Ui9aK3p4ZkF0Y3dBVmRrWFpjcXMx?=
 =?utf-8?B?VkY5MVhkM0U5anZ6a1hKR3ZyWFNwSURxbytWcDh1UGorbkE5MTcrd2FEQ0JR?=
 =?utf-8?B?cENkdUJtcm5RZlAxbUhwdktCeGV5UWZoSFlHK2NVQkVZbXpRWU1vMktDeXI3?=
 =?utf-8?B?cHVXRU9jbU5ERHdEb1JwdFZheTJPcUkyQ2FWMWoxa3BpTmZuYnZFbDFsNmlY?=
 =?utf-8?B?SWhVanplMWZrUy9pQlJMVERCZUJ4S2ZJaUtqNWViR1Y2RlBUZDZRV2RRUTVl?=
 =?utf-8?B?NlcrUzBKMFBza1l3TGhYTDZTOXQzZ2lDUXBGMzdHalZ2M0l6SklsMFFZMXJq?=
 =?utf-8?B?b2ZrWTVMZGdHY1Y0L0RrSlE2czdtZEVjQ20xSnlYRElEekJZTVZOck80OG5R?=
 =?utf-8?B?UlVZVC9Fa3F6MlZ5R2xtM2VNWUtkdXFmeVZHRloyeTZGZ0xTMWFDVHdhSkNF?=
 =?utf-8?B?Q1hBY2Z2eHNXNXM1eXo4NllwZFNwdEFqc09jbWFHQ0tuUEMrWlJKczlIM0hG?=
 =?utf-8?B?aUhXK1V0MUdJZzl2NGYzMGJSajJEZWRpVkhESGo2aXM0N1QvUWJ6T1F4ZUJG?=
 =?utf-8?B?MVBtNjRpbFZGNUxLalVoTW1keWYvNXJLZEVlVVNWMjdWOTZwM1h5STVkOGE1?=
 =?utf-8?B?ZTE2QjJqaThyemM0Y2FDMjNsa2d5dnl4elRlNWhTU1IzQ2V3MFhnVVA2c3VS?=
 =?utf-8?B?RGswSTIrenkwYzlEWGVMbDFCbmNmUFl6OEVBbHh0WWtKT3lBMUtYaWVpcUlH?=
 =?utf-8?B?VEVYc3RvUndEM1pCRnZSYStMN3d5UFdZbUJWNFNIMjdhL1RwY0xTQlJONllr?=
 =?utf-8?B?TFBzaWlnR3ZJaHI5cFRNeTRIWXJURHM1ZndiS1dnaWwyQldTQXdFRW51TmN5?=
 =?utf-8?B?R2p5VkVkZmNEWHpRZTJEczRZOFBmc21vRy9wd2RFTUc1Z2dnZThlczYyR3Fh?=
 =?utf-8?B?dGFWSnRvaWkzRjBudmEzWDFBa01TUGFpWVVtMmdBbnhOWS9JR25vUmFYak1j?=
 =?utf-8?B?UklKczdLbTJBdStBUVh5L21DRU55MytveFIrNzRjeDlvbHM2OHdOK2craWs1?=
 =?utf-8?B?UUt2elpDMTJueHhwSkZodDFCR1oyWkZHeTZnUGZyZkZ2RlRyRnF3bzZMV0tT?=
 =?utf-8?B?R0o4VFpaV0ZkSUFNZVZSRk1SbzM1bS8zL0FsTXoxQ1JNNVN0TjJxYThuU0RF?=
 =?utf-8?B?ZTh0VVhxNzU4QUxPWXNDTWNOVGRLWW9oTnM1T3YyYjFna3RvUFhOVmRKYW03?=
 =?utf-8?B?UW0yMGRLY21pM2ZNZHVMSzVOeko5d2NhV3ExVC9YSjVUa082RjczV3lvZVpV?=
 =?utf-8?B?U3l6aXY0Qms3KytvbkhpaENObUF5V0JIaVhTOHQ4aE9FeGI1YXgyU3E1ZFkv?=
 =?utf-8?B?QlVpL2JsRU9LMGhoc0p4OExVcjN0UzJTTEpWVjN1bWVzN20vZFozcGQ4ZTF3?=
 =?utf-8?B?TkZrT1VTa2VhbmY4QjY1UXY3dkFuR1F2Z1o5eEN0RmdnZEtpV1I4OW9qa0wv?=
 =?utf-8?B?Y1NMSFV0V2RrbTV0dkdFb2grbHVHcU51eDJPL0w1OUxHVUtTejUwdCtKUmpt?=
 =?utf-8?B?UnY5OU01aXd4SU9ua043aU9ZQ1JNU1VmeEQ1MTc3Ry9rZGZGUkJvOENEZ29z?=
 =?utf-8?B?d0M2OHBLZi9pRWhyNmJmcWcyQ2FNMjNRRSs2eGVzeVFkTWFZOTFNV0pYVVhS?=
 =?utf-8?B?cVBCVE1DTlRjL0gwT0pBVUttV2ZBTjcwdk5LME5JQW1ZcjRDL3BZNktvQkEr?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321721ab-6d37-44ca-c97a-08dd990659b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 07:57:50.9891 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+okBWtQRwl2XxHQpYl5w2vEc2vDJ/48ydqcoUDgPnYGGWS65Dyew+/XqJlCYpDhahxDmZTijtxxamGE7k6y9v6r+ancqKSKuDZOEl6byqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
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

SGkuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhcnJpc29uLCBKb2hu
IEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjIs
IDIwMjUgMzowMSBBTQ0KPiBUbzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEu
ay52LnBAaW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBD
YzogV2FqZGVjemtvLCBNaWNoYWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPjsgTmlrdWxh
LCBKYW5pDQo+IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djRdIGRybS94ZTogQWRkIGhlbHBlciBmdW5jdGlvbiB0byBpbmplY3QgZmF1bHQgaW50bw0KPiBj
dF9kZWFkX2NhcHR1cmUoKQ0KPiANCj4gT24gNS8xNS8yMDI1IDM6MTkgQU0sIFNhdHlhbmFyYXlh
bmEgSyBWIFAgd3JvdGU6DQo+ID4gV2hlbiBpbmplY3RpbmcgZmF1bHQgdG8geGVfZ3VjX2N0X3Nl
bmRfcmVjdigpICYgeGVfZ3VjX21taW9fc2VuZF9yZWN2KCkNCj4gPiBmdW5jdGlvbnMsIHRoZSBD
SSB0ZXN0IHN5c3RlbXMgYXJlIGdvaW5nIG91dCBvZiBzcGFjZSBhbmQgY3Jhc2hpbmcuIFRvDQo+
ID4gYXZvaWQgdGhpcyBpc3N1ZSwgYSBuZXcgaGVscGVyIGZ1bmN0aW9uIGlzIGNyZWF0ZWQgYW5k
IHdoZW4gZmF1bHQgaXMNCj4gPiBpbmplY3RlZCBpbnRvIHRoaXMgeGVfaXNfaW5qZWN0aW9uX2Fj
dGl2ZSgpIGhlbHBlciBmdW5jdGlvbiwNCj4gPiBjdCBkZWFkIGNhcHR1cmUgaXMgYXZvaWRlZCB3
aGljaCBzdXBwcmVzc2VzIGN0IGR1bXBzIGluIHRoZSBsb2cuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTYXR5YW5hcmF5YW5hIEsgViBQIDxzYXR5YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT4N
Cj4gPiBTdWdnZXN0ZWQtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29A
aW50ZWwuY29tPg0KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0K
PiA+DQo+ID4gVjMgLT4gVjQ6DQo+ID4gLSBVcGRhdGVkIHRoZSBuYW1lIG9mIGhlbHBlciBmdW5j
dGlvbiBhbmQgbW92ZWQgdG8geGVfZGV2aWNlLmggZmlsZS4NCj4gPg0KPiA+IFYyIC0+IFYzOg0K
PiA+IC0gQWRkZWQgaW5saW5lIGZ1bmN0aW9uIHRvIGF2b2lkIGNvbXBpbGF0aW9uIGVycm9yIGlu
IHRoZSBhYnNlbmNlIG9mDQo+ID4gQ09ORklHX0ZVTkNUSU9OX0VSUk9SX0lOSkVDVElPTi4NCj4g
Pg0KPiA+IFYxIC0+IFYyOg0KPiA+IC0gRml4ZWQgcmV2aWV3IGNvbW1lbnRzLg0KPiA+IC0tLQ0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIHwgMTggKysrKysrKysrKysrKysr
KysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2N0LmMgfCAgNiArKysrKysNCj4g
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuaA0KPiA+IGluZGV4IDBiYzNiYzhlNjgwMy4uYjkzN2Q1ODUwODNiIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+IEBAIC0xOTUsNiArMTk1LDI0IEBAIHZv
aWQgeGVfZGV2aWNlX2RlY2xhcmVfd2VkZ2VkKHN0cnVjdCB4ZV9kZXZpY2UNCj4gKnhlKTsNCj4g
PiAgIHN0cnVjdCB4ZV9maWxlICp4ZV9maWxlX2dldChzdHJ1Y3QgeGVfZmlsZSAqeGVmKTsNCj4g
PiAgIHZvaWQgeGVfZmlsZV9wdXQoc3RydWN0IHhlX2ZpbGUgKnhlZik7DQo+ID4NCj4gPiArLyoq
DQo+ID4gKyAqIGlzX2luamVjdGlvbl9hY3RpdmUoKSAtIEhlbHBlciBmdW5jdGlvbiB0byBpbmpl
Y3QgZmF1bHQuDQo+IFRlY2huaWNhbGx5LCB0aGlzIGlzIG5vdCBpbmplY3RpbmcgdGhlIGZhdWx0
LiBJdCBpcyBhIHBsYWNlIGhvbGRlciB0bw0KPiBoYXZlIGEgZmF1bHQgaW5qZWN0ZWQgaW4gdG8g
c28gdGhhdCBpdCBjYW4gcmVwb3J0IHRvIG90aGVyIGNvZGUgdGhhdCBhDQo+IGZhdWx0IGluamVj
dGlvbiB0ZXN0IGlzIHJ1bm5pbmcuDQo+IA0KRGVmaW5lZCBhIG5ldyBmdW5jdGlvbiB0byBpbmpl
Y3QgZmF1bHQgYW5kIHRoaXMgZnVuY3Rpb24gcmV0dXJucyB0aGUgZmF1bHQgc3RhdHVzLg0KPiA+
ICsgKg0KPiA+ICsgKiBUaGlzIGlzIGEgaGVscGVyIGZ1bmN0aW9uIHRvIGluamVjdCBmYXVsdCBp
bnRvIGN0X2RlYWRfY2FwdHVyZSgpLg0KPiBHaXZlbiB0aGF0IHRoaXMgaXMgbm93IGEgZ2VuZXJp
YyBmdW5jdGlvbiBpbiBhIGEgZ2VuZXJpYyBsb2NhdGlvbiwgaXQNCj4gc2hvdWxkIG5vdCByZWFs
bHkgdGFsayBhYm91dCBzcGVjaWZpYyBpbnN0YW5jZXMgb2YgdXNhZ2UuDQo+IA0KPiBJIHdvdWxk
IHNheSBzb21ldGhpbmcgbGlrZToNCj4gDQo+ICsvKioNCj4gKyAqIGlzX2luamVjdGlvbl9hY3Rp
dmUoKSAtIEhlbHBlciBmdW5jdGlvbiB0byB0ZXN0IHdoZXRoZXIgYSBmYXVsdA0KPiBpbmplY3Qg
dGVzdCBpcyBydW5uaW5nLg0KPiArICoNCj4gKyAqIFRoaXMgaXMgYSBoZWxwZXIgZnVuY3Rpb24g
dGhhdCB0aGUgZHJpdmVyIGNhbiB1c2UgdG8gZGV0ZWN0IHdoZXRoZXINCj4gYSBmYXVsdCBpbmpl
Y3Rpb24NCj4gKyAqIHRlc3QgaXMgcnVubmluZyBpbiBvcmRlciB0byBzdXBwcmVzcyBleGNlc3Np
dmUgZGVidWcgb3V0cHV0LiBCeQ0KPiBkZWZhdWx0LCB0aGUgcmV0dXJuDQo+ICsgKiB2YWx1ZSBp
cyBmaXhlZCBhcyB6ZXJvIGJ1dCBpdCBjYW4gYmUgbW9kaWZpZWQgYnkgdGhlIGZhdWx0IGluamVj
dGlvbg0KPiBmcmFtZXdvcmsgdG8NCj4gKyAqIHJldHVybiBhbiBlcnJvci4NCj4gKyAqDQo+ICsg
KiBSZXR1cm5zOg0KPiArICogMCBpZiBmYXVsdCBpbmplY3Rpb24gaXMgbm90DQo+ICsgKi1FSU5W
QUwgaWYgZmF1bHQgaW5qZWN0aW9uIGlzIGFjdGl2ZQ0KPiANClVwZGF0ZWQgaW4gdGhlIG5ldyBy
ZXZpc2lvbi4NCj4gT3Igd2hhdGV2ZXIgZXJyb3Igd2FzIHBpY2tlZCBieSB0aGUgSUdUIHNpZGU/
DQo+IA0KPiA+ICsgKiBBcyBmYXVsdCBpcyBpbmplY3RlZCB1c2luZyB0aGlzIGZ1bmN0aW9uLCBu
ZWVkIHRvIG1ha2Ugc3VyZSB0aGF0DQo+ID4gKyAqIHRoZSBjb21waWxlciBkb2VzIG5vdCBvcHRp
bWl6ZSBhbmQgbWFrZSBpdCBhcyBhIGlubGluZSBmdW5jdGlvbi4NCj4gPiArICogVG8gcHJldmVu
dCBjb21waWxlIG9wdGltaXphdGlvbiwgIm5vaW5saW5lIiBpcyBhZGRlZC4NCj4gPiArICovDQo+
ID4gKyNpZmRlZiBDT05GSUdfRlVOQ1RJT05fRVJST1JfSU5KRUNUSU9ODQo+ID4gK3N0YXRpYyBu
b2lubGluZSBpbnQgeGVfaXNfaW5qZWN0aW9uX2FjdGl2ZSh2b2lkKQ0KPiA+ICt7DQo+ID4gKwkg
ICAgICAgIHJldHVybiAwOw0KPiBJcyB0aGUgaW5kZW50YXRpb24gY29ycmVjdCBoZXJlPyBJdCBp
cyBzaG93aW5nIGFzIGRvdWJsZSBpbnRlbmRlZCBpbiB0aGUNCj4gZW1haWwgcmVhZGVyLg0KPiAN
Cj4gPiArfQ0KPiA+ICtBTExPV19FUlJPUl9JTkpFQ1RJT04oeGVfaXNfaW5qZWN0aW9uX2FjdGl2
ZSwgRVJSTk8pOw0KPiA+ICsjZWxzZQ0KPiA+ICtzdGF0aWMgaW5saW5lIGludCB4ZV9pc19pbmpl
Y3Rpb25fYWN0aXZlKHZvaWQpIHsgcmV0dXJuIDA7IH0NCj4gV2h5IGhhdmUgdGhlIGZpcnN0IHZl
cnNpb24gc3ByZWFkIG92ZXIgdGhyZWUgbGluZXMgYnV0IHRoaXMgdmVyc2lvbg0KPiBjb21wcmVz
c2VkIHRvIGEgc2luZ2xlIGxpbmU/IFRoZSBjb2RlIGlzIGlkZW50aWNhbCBleGNlcHQgZm9yICdu
b2lubGluZScNCj4gdnMgJ2lubGluZScgaXNuJ3QgaXQ/DQo+IA0KPiBZb3UgY291bGQgZXZlbiBk
byBpdCBhczoNCj4gKyNpZmRlZiBDT05GSUdfRlVOQ1RJT05fRVJST1JfSU5KRUNUSU9ODQo+ICtB
TExPV19FUlJPUl9JTkpFQ1RJT04oeGVfaXNfaW5qZWN0aW9uX2FjdGl2ZSwgRVJSTk8pOw0KPiAr
c3RhdGljIG5vaW5saW5lDQo+ICsjZWxzZQ0KPiArc3RhdGljIGlubGluZQ0KPiArI2VuZGlmDQo+
ICtpbnQgeGVfaXNfaW5qZWN0aW9uX2FjdGl2ZSh2b2lkKQ0KPiArew0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gMDsNCj4gK30NCj4gDQo+IEFsdGhvdWdoIEkgZ3Vlc3MgdGhlIEFM
TE9XXyBtYWNybyBuZWVkcyB0byBiZSBhZnRlciB0aGUgZnVuY3Rpb24gZGVmaW5pdGlvbj8NCj4g
DQo+IEpvaG4uDQo+IA0KQUxMT1dfRVJST1JfSU5KRUNUSU9OKCkgbmVlZHMgdG8gYmUgYWZ0ZXIg
ZnVuY3Rpb24gZGVmaW5pdGlvbi4NCj4gPiArI2VuZGlmDQo+ID4gKw0KPiA+ICAgLyoNCj4gPiAg
ICAqIE9jY2FzaW9uYWxseSBpdCBpcyBzZWVuIHRoYXQgdGhlIEcySCB3b3JrZXIgc3RhcnRzIHJ1
bm5pbmcgYWZ0ZXIgYSBkZWxheSBvZg0KPiBtb3JlIHRoYW4NCj4gPiAgICAqIGEgc2Vjb25kIGV2
ZW4gYWZ0ZXIgYmVpbmcgcXVldWVkIGFuZCBhY3RpdmF0ZWQgYnkgdGhlIExpbnV4IHdvcmtxdWV1
ZQ0KPiBzdWJzeXN0ZW0uIFRoaXMNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Y19jdC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gaW5k
ZXggZmY2ZWRmMWIxNGY0Li5hNjk2NGQxM2YzYTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d1Y19jdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19jdC5jDQo+ID4gQEAgLTE5NjMsNiArMTk2MywxMiBAQCBzdGF0aWMgdm9pZCBjdF9kZWFkX2Nh
cHR1cmUoc3RydWN0IHhlX2d1Y19jdA0KPiAqY3QsIHN0cnVjdCBndWNfY3RiICpjdGIsIHUzMiBy
ZWFzbw0KPiA+DQo+ID4gICAJaWYgKGN0YikNCj4gPiAgIAkJY3RiLT5pbmZvLmJyb2tlbiA9IHRy
dWU7DQo+ID4gKwkvKg0KPiA+ICsJICogSHVnZSBkdW1wIGlzIGdldHRpbmcgZ2VuZXJhdGVkIHdo
ZW4gaW5qZWN0aW5nIGVycm9yIGZvciBndWMNCj4gQ1QvTU1JTw0KPiA+ICsJICogZnVuY3Rpb25z
LiBTbywgbGV0IHVzIHN1cHByZXNzIHRoZSBkdW1wIHdoZW4gZmF1bHQgaXMgaW5qZWN0ZWQuDQo+
ID4gKwkgKi8NCj4gPiArCWlmICh4ZV9pc19pbmplY3Rpb25fYWN0aXZlKCkpDQo+ID4gKwkJcmV0
dXJuOw0KPiA+DQo+ID4gICAJLyogSWdub3JlIGZ1cnRoZXIgZXJyb3JzIGFmdGVyIHRoZSBmaXJz
dCBkdW1wIHVudGlsIGEgcmVzZXQgKi8NCj4gPiAgIAlpZiAoY3QtPmRlYWQucmVwb3J0ZWQpDQoN
Cg==
