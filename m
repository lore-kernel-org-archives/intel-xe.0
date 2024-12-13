Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C72E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 15:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575C010F04F;
	Fri, 13 Dec 2024 15:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kr0f3gBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4837B10F04F
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734102755; x=1765638755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=64LnEDY9m3lFiSDaNJvAUZ23xg3ptyrbY6WRTbBeHaA=;
 b=Kr0f3gBxqKWmL1t/Ae4+BsvZ3o4zI52uv273UTi6Li8+IVneGHEzJdHx
 ZimnENow8iqmQejDa46vxdKKgLN5Puc7r5CQRDU5m+KjZGYzTGsRABvsZ
 pBlseyche5s/9sUCAW8oUao1q2pX1rcMY2akM0lha/7zkLtVEDCC+2T7x
 I6vbm0DU5I8e+ZLANpZPonfirsrssqibyZKgI0CDyqP3X4hf7//ZqWpS5
 iA1OgO1gOpAvouvM2oc7JdcGneaBF9BV3tQIh2XlEjZaRyyr5UOWKv2n7
 fTGbKKtWZyYi5l69ZRH1aNOCcftXP/7gnuQs0QJouTUHg3tZ47Lb+fDX4 A==;
X-CSE-ConnectionGUID: TxUefleQTw6RZh/u9MZonw==
X-CSE-MsgGUID: UUy77TkGTqq4Nn5+HP8OEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38236327"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="38236327"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 07:10:23 -0800
X-CSE-ConnectionGUID: 0hq/VCmRTu+MzkDI56vujQ==
X-CSE-MsgGUID: zGVLhEeBTzyuHnOnYHxs8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127555614"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 07:10:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 07:10:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 07:10:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 07:10:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Htrdr5MAt86nqvW5HAx2kL4vMJMN2aU4ymKS2MA14lHk5heMKHQ2OlDrbcw04TwPasu7VlpENLOwPb+ESwj9V0adNCoZvkMcZjQcVnWfjlEdkmB3Gi1eBM4FDPWabo+FSQu+9SseuBP3dBETeMwO1Fb1l86b8S+xCjCF6B7oPXZCjMF+ICMZ2pNaVRt0xmTh2xAjla+SsPzm6UqDwdn6NA/A25x+OuqL6tiGHLbHjIT0egvRR9qzGdqJpxjyOtus5qb1HM7yR+3ZPgxGf/NeeVFhtv0eCq9GMyizAxj5QyvMp6MowZDL0lYvKZik68x/aFA1O/SPdg2Vi2F7YqhZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64LnEDY9m3lFiSDaNJvAUZ23xg3ptyrbY6WRTbBeHaA=;
 b=Byfn0Y/IQQsq7icnxB3dWCEECm1Z2SI4aoPxwH2lY0XceVBdesnYgRsgbRla61eCusa89Vg4nDBPGYctbEkirwA+mbRC/LlnMtxbCL3tUlxw+pLT1ASQrNqiFQG7TDiwbsHB//XBEsS41QigJg4WZ168+8jmQkqmzWpshijSB1LRwVa3AUjtRXr/OnCBYY7fOywKkE1zfFOK4pcJqYaiv2gZA8e4JxVJ1eB8XRN9fi8Ufm10B8nwjsel8+4fY6EyNIiZ/Qj25D8CVaidcsKo1vHzbhTcGl/acduCm+KJGSALO5QuyhOAlNrTA4AGS2SsbLDCSthkVyLISp9afxyKCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB4877.namprd11.prod.outlook.com (2603:10b6:a03:2d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 15:10:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 15:10:05 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Topic: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
Thread-Index: AQHbTWkcZhgIo/ttdkKNQ0lly9C4rLLkPnMAgAAI5oA=
Date: Fri, 13 Dec 2024 15:10:05 +0000
Message-ID: <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
In-Reply-To: <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB4877:EE_
x-ms-office365-filtering-correlation-id: 01bcb43d-25ac-4a03-d980-08dd1b8839e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YlJNM2dudmw2UWZiUjVpZGVkM2haQXNEajNwNmNMbXlrbGtWZlpnOXNoZUdX?=
 =?utf-8?B?Ym40clpwNkNJZkJkL0FPSXNsR2RaMmhNQWxmL2NCM1dCa1U1NHFZdGZiNUNV?=
 =?utf-8?B?c0dPOVk2S00vZUtiKzNMSExzNmkvY2hsYmR4L09SMlk2MzdqRm5ZN2dDYVpL?=
 =?utf-8?B?SlZaSDI4QmRMUTlwTVF2UE5icDNoTEVxZFM1YXVjUkNDUHhrYm00OVhNZnNp?=
 =?utf-8?B?K1pYL3ZacGFkZmorblVyd0RDOVluNXBXendvMHpMbWxQSUgvbG9XY3BEcnJn?=
 =?utf-8?B?dVNRTGhtYlZiTE9rR1NOYmcrbDh3OGtjREVjWUlScXhtSHVpNUxIaklJMm5L?=
 =?utf-8?B?WFd4ZHpObkNSOWRYak9OUjdkUHNPWXIzbmZTZHlURlEwUkNLVUxMVkoxalRz?=
 =?utf-8?B?MWkyZVZ1NlFJWC90WnhUOHlVTUVjOWtCNTBkWFI0UXRobDh3MUlPc0tzbFpP?=
 =?utf-8?B?RmlrL2JVUng3NDhBb3VSM2lKTFZiWjVpM2d1REMzSVJlSE5vS0dzOFdmYkpy?=
 =?utf-8?B?dWNEY2x1cHdrMHFTVXluakNoWHZCdmhVei9NRHVValdqa3dycUhKU3pUK1By?=
 =?utf-8?B?aitUOTZMSmdnZHphdWdBS25NaVR6OGI2a1U2Tkh5aXB2SzR4eXdsdmdEbE5v?=
 =?utf-8?B?TVhBTDdVTWNvN3daT0lzNlkvUzIvQjEvdkpvU1JZdkdlZUlDVDFjTElJK1Jp?=
 =?utf-8?B?bGlxTnUzSllTTENLKzkranNTbHh2c3MyQWM3V3V5SjAzOVlDWnU4YXhYMGxK?=
 =?utf-8?B?ZW9VSC9yQUgrY0JOVWo5bW5VSVg3YkZZRVdMV1l2bXFNMng2SE1NYVJXUW1U?=
 =?utf-8?B?TXVaSzBKVmlsbVlGMDZiU1QrK2hUanlzM3VGRHU1LzZGUm1DbWdWanI1RWZD?=
 =?utf-8?B?RUE3WUNoemxIcytDMGtiaEJzVFZnRGZ2ZE5wL2NLd01Bd1RYNHU3eGdiNllJ?=
 =?utf-8?B?NVZ2R1lxem9aV1ZMcmppMTE3RXBCL0pCQzF2b1FFUzd1Q1o5aHRnN1BkQXl6?=
 =?utf-8?B?WDAxaUVWdWdzQkM0alhXYWpuS0w3Nk1sMlRPN0RRaEExejJNSGErZXZGRHEr?=
 =?utf-8?B?TDQ1Q1hRRnJOYUhMY3NkTG9Rb3NkYVBQMnkzaXErNXB5R0t5dU90cU5zZDlN?=
 =?utf-8?B?VzhOVm9zNER3WDV4SlpVYnlBMGFLVjl6OURrTWxVMVVBeitYeVp6aHpjY1hB?=
 =?utf-8?B?NTNtcStTemNqSklOTVR2V2xEMEFJc0lRZnVoY1RtbHBOOFhKMXZrQ2xwYi9Y?=
 =?utf-8?B?S0Q1SWhSazBPMzZ6SlJyaDZaRlhCemZsaFpHTkpEc3Awam5HOEhiNzNjQS9a?=
 =?utf-8?B?WkNmQVJPb1I0aU0zaUVmMW4zTUllWGh4UFVrbDBCeEtVbUxmQ0lGMk1aMEYr?=
 =?utf-8?B?UnFtQUMrTTVXV3JKUkQwR3NodndpR0RYejRVMXBuWVRNR0paM2pIa0NKUnVv?=
 =?utf-8?B?YzVYcUJNVnNTT2RuNlZMemdDMmdSUThib0NuNWdtRDNjaDlZOTNRWDFlMW5q?=
 =?utf-8?B?Yk8xbnNIdUlyaXpwRE9kODdRL0F3QzNtT2lBQXlCQSthUmZyL2QyTkE0WVhY?=
 =?utf-8?B?MHdpR3lhRG80SjV2ZzdSUmJJNEtUM3hsMHR4akJ1b1c5NVVBaktUYldyVWFX?=
 =?utf-8?B?RnNQeEQ4YXd2ZytzS0IzMmRGNXpTT3FQY1ExeXB6WTlWMTB5aXpLZmJJUmp4?=
 =?utf-8?B?LzJYOVFLM29PN2FMVnRvRVQzcWc1NTZWV1NzL3pJQ0l0ZzdXT3lHbUhZMWhN?=
 =?utf-8?B?UnFBYTMyN1ZnQmNnUkJPWFpPTjN5N3FlRDdJaTl5c1FaZlJWdUh4U210TXQ0?=
 =?utf-8?B?dVRhOUJEV1VDTnI5UFF6amJjQnd4UnNEQ1BUZjR1VTdyTG9sM1hVeUp1N1FT?=
 =?utf-8?B?MmtuWVIxTXQwOXdkWFVkUVRpUWJMOFNTZmlqNWUyN2FWbFh3TFRCM09zcm5Q?=
 =?utf-8?Q?zfUA3uFaXILPzeZwQYguaQgulbDUX0AA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFh6U1ZEYjdEK3Y4cnZReTE0eUwzSzAySVRsVm5BeWlBZUM1TEJrYVlMQmJT?=
 =?utf-8?B?WXY3UHdCWDVIZWZBNzZpeUs4QkVwRUtSK1AyQlo1R3ZhVHlHTWlzcDlVVm1v?=
 =?utf-8?B?TDZQZ09SKzZySldzdDcwSktucHJLMTN6RzhtY0VpWTJ4MVRJTzAwZHVDUllQ?=
 =?utf-8?B?RjFOMDVEV1FlZXh3VE9PNkNsSDcyaGdtcURqa1VqbHEyQngyT2VBbG11L1kr?=
 =?utf-8?B?QUZwRjNZdEltOTQyYlBKVEprU1k2QnFUSTJMd2ZkMWRnT0I0K1BHcW4rWmxv?=
 =?utf-8?B?MWVRcmVCUHZvL2w3R3VtMWhZbGtOVVpJN2hPa1ZkNHEyc2JtdGExMzcxbGJj?=
 =?utf-8?B?UlhGaXFPaWRScURHWlF5TVZnWDNGN1EvUk9yWjJpMzROMXJPdEhWeStQUjdX?=
 =?utf-8?B?QTJtUWcySDRmS1RiOWtKY1RzSFdZV3dNZ0U2UW5GUGlEMmJqUzU2VkFUL3ov?=
 =?utf-8?B?TDdDcHBPdUZ2OUpUWEpGRUZJMlhoRmxGRll4RWEySVBmR0ZJZkRTY3M2OXJ4?=
 =?utf-8?B?emtHUWtzUjViRlJwbmRuYXpJeDh6NDZGdW1TbENUMHpUK3BUNHZGck1ZNytk?=
 =?utf-8?B?WHY5aHp6aFVPb1FVKzU3SE9vTUxrZDRZSGU5QXhTZzhMTElCcHp1WlhKdkpr?=
 =?utf-8?B?cUlHTDNYbHdUVi81b2RGRFJMNHBZTzBvek5oMGJzajJyZ1hSUlN0Ry9GTTJk?=
 =?utf-8?B?Y1dDMXVoK1kvK3RUdGp0bnBzNXRscCt6YnYvU0plNDluRy9Xc2hNS2piZmJC?=
 =?utf-8?B?UU12dEpUa3dXSFJscld0WDJmSXpQb25UK1Q1d2ZuenZPd014RFZLQ2RlcDkx?=
 =?utf-8?B?dWdTc0pSVWNVVWx1WW0xdUd3N1VDM204ZUVXSVJ5VVBmenlrK1lPOWtZOTd0?=
 =?utf-8?B?VUdTR3BxR0J2blk2OG9nSTNOSS9Ha013Q1p6d2tLT09pT2ZQNFRCbjdpZFFY?=
 =?utf-8?B?QkpFWExvQWlVWlRadU8vL09tOEhqazFqUEozdE1xQVN3TTlKOEE2Nk4wWmhB?=
 =?utf-8?B?YjAyK3lSUXZuLzJMdmN0VERld0daNmFMeXRMUk5YVkhvRW01cVQ5ZVEreFpL?=
 =?utf-8?B?cmhEMXBGZ1J3cDhRV0p5SzhzQzAwOFh4Mlk2S2RXSy8wUUNWRy9DTzJLa05F?=
 =?utf-8?B?UkU5emhITWtycUxPNXFwUmlObmJBUE55NFhucXBtcmRBMVJJVk03SVh0Q2lB?=
 =?utf-8?B?YWZiK3B0cWVPWldDTjRteWhseFByWEp4elNxbXJtS1hyMXp1aUkrVmZVWjZr?=
 =?utf-8?B?ZWFobWxOSTlwZ3d6NUZmQWpPT240NS9DRUZYajhLNHdNNmY5YTdVZHloMkRB?=
 =?utf-8?B?cmlCaTcvOXR2QWhOOGxNYUNvSm9ZOWY1WGVtbmk1QmNhSU5IcDFSSHVLK1hn?=
 =?utf-8?B?a3pDV01FZG8raXVUZkJEQW5BeXI3YXRSZWNYOEhMaEtJR2xqY2N2d085dGNY?=
 =?utf-8?B?b1NQYTBwTUJzMnhobmFkZVZrR0xmVkhkaE9LV1BvdHBydURKNm5QaVI2Q0Nz?=
 =?utf-8?B?QUlGOTdWUVBTMDY3emtUaTI1b2g3ODZybktUNGk4eTRDaU9LVTFwaXRiZURv?=
 =?utf-8?B?blQ1U2Z0YjJURWlsYUJOTEk5OE4vYkxQdXRMNlVOU0JPeUloL2ZhbzdhSVd1?=
 =?utf-8?B?bmRTQW5mbUgxTDRJK3VEZDFnUkx4VTZCVVg1UXp3Sk1SZUFaNnRsQXlwNjN2?=
 =?utf-8?B?T1ZHeWk2SEFGVDc3U0FFQUVnUnl4d0NOcDVjbjczbnFnMWFFZUdGemNsUVhI?=
 =?utf-8?B?Y09UQzhQSGtNUmd2SHRhNTJ0dXF2RGE0R040MndrczdKblFyL2NxNllBQ21Y?=
 =?utf-8?B?UjJPOUdQNjJjdklraFVzdld1TmpVeG1yNWJYWTJSek42d05OcDNTZlhOcmE3?=
 =?utf-8?B?aGlpaEI2R1c3WlhDYytrUDdqTWJYQ0ZacnVmRDBmYzhvQjJBNkludUpLaVBR?=
 =?utf-8?B?UlJqZVFmSTZ4c2kzenFXSUVLOGJVNlV3UE5laG5jdWIxSkw0Rm9iQ05ZeE9J?=
 =?utf-8?B?RUJLaUp2N25vZDBMejE5dUljcm1Rc0FhTmpHaEFMVGRVb0E0WjFLQU1ROGlJ?=
 =?utf-8?B?NWJSU0k3aEx4a2lMdFZlRFJ0d2U3dml1RSs5ZTIzai9GK1MvbS9ZTWsrQlBE?=
 =?utf-8?B?R3FncC90eEVuRTc2cXBhZXkrSzhSa0Y2VHYxdjQzb3pXTUFGU3JIVldtVElY?=
 =?utf-8?B?MXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4F77CD82550C44AAC48FF4A2FEC21D2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bcb43d-25ac-4a03-d980-08dd1b8839e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 15:10:05.6869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/VR+lMqH5B2fQCduyVE6pB5AoRH1a3Fax/ojRutYJ0DkTy5CFFaBj913eAnm2VyjPXI1aqKGJsO3Rd0Ygs+eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4877
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

T24gRnJpLCAyMDI0LTEyLTEzIGF0IDA4OjM4IC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIEZyaSwgRGVjIDEzLCAyMDI0IGF0IDA5OjEyOjUyQU0gLTA1MDAsIFJvZHJpZ28gVml2
aSB3cm90ZToNCj4gPiBXZSBkbyBub3QgYnJlYWsgdXNlcnNwYWNlLg0KDQpUaGVyZSBpcyBvdGhl
ciBwYXRjaCB0aGF0IGFsc28gYnJlYWtzIE1lc2EgcGFyc2VyOg0KDQpkcm0veGUvZGV2Y29yZWR1
bXA6IEltcHJvdmUgc2VjdGlvbiBoZWFkaW5ncyBhbmQgYWRkIHRpbGUgaW5mbw0KDQo+ID4gDQo+
ID4gVGhpcyByZXZlcnRzIGNvbW1pdCBlYzE0NTVjZTdlMzVhMzEyODlkMmRiYzEwNzBiOTgwNTM4
Njk4OTIxLg0KPiANCj4gQnV0IHdlIGhhdmUgdXNlcnMgY2FsbGluZyB0aGlzIGZ1bmN0aW9uLi4u
LiB0aGUgcmV2ZXJ0IGlzIG5vdCBzbyBzaW1wbGUuDQo+IEkgdGhpbmsgd2UgbmVlZCB0byByZXZl
cnQgdGhlIGZ1bmN0aW9uYWxpdHkgcmF0aGVyIHRoYW4gcmV2ZXJ0aW5nIGFsbA0KPiB0aGUgcGF0
Y2hlcywgb3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgYSBsb3Qgb2YgaGVhZGFjaGVzLg0KPiANCj4g
SSBwcm9wb3NlIHdlIGdvIHdpdGg6DQo+IA0KPiBhKSBkcm9wIHRoZSBcbiB0aGF0IGJyb2tlIG1l
c2EgYW5kIG1lcmdlIHRoYXQgd2l0aCBjYyBzdGFibGUuDQo+IA0KPiBiKSBtb3ZlIGJhY2sgdGhl
IGVudHJ5IHRvIHRoZSBwcmV2aW91cyBzZWN0aW9uIHRoYXQgYnJva2UgbWVzYSBhbmQgY2MNCj4g
ICAgIHN0YWJsZS4NCj4gDQo+ICAgICBKb3PDqSwgd291bGQgaXQgYmUgb2sgdG8gbWVyZ2UgYSBw
YXRjaCBpbiBtZXNhIGFuZCBwb3J0IHRoYXQNCj4gICAgIHRvIG1lc2Egc3RhYmxlIHRoYXQgc2lt
cGx5IGxvb2tzIGF0IDIgcG9zc2libGUgc2VjdGlvbnM/IE9yIGV2ZW4NCj4gICAgIGRyb3AgdGhl
IHNlY3Rpb24gY2hlY2tzLi4uID8NCj4gDQo+IGMpIHNldHRsZSBvbiBvbmUgb2YgdGhlIHBvc3Np
YmxlIHNvbHV0aW9ucyBmb3IgXG4gdGhhdCB3ZXJlIHByZXNlbnRlZCBpbg0KPiAgICAgdGhpcyBk
aXNjdXNzaW9uLiAgSSB0aGluayB0aGUgc2FuZXN0IG9uZSBpcyB0aGF0IGEgc3BhY2UgaW4gdGhl
IGVuZCBvZiBhDQo+ICAgICBsaW5lIHByaW50aW5nIGFzY2lpODUgd291bGQgc2lnbmlmeSBhIGNv
bnRpbnVhdGlvbiBtYXJrZXIuICBCdXQgbWVyZ2luZw0KPiAgICAgKGEpIG1lYW5zIHdlIGhhdmUg
dGltZSB0byBkaXNjdXNzIGFuZCBhZGp1c3QgaWYgbmVlZGVkLg0KPiANCj4gQWZ0ZXIgdGhlIGR1
c3Qgc2V0dGxlcyB3ZSBtYXkgdGhpbmsgb2YgYSBiZXR0ZXIgd2F5IHRvIGV2b2x2ZSB0aGUNCj4g
ZGV2Y29yZWR1bXAgZm9ybWF0IHNvIGl0IGRvZXNuJ3QgY2F1c2UgYnJlYWthZ2VzIGluIGZ1dHVy
ZSB1cGRhdGVzLg0KPiANCj4gTHVjYXMgRGUgTWFyY2hpDQoNCg==
