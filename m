Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6003DCF3963
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 18:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291F910E75D;
	Thu, 19 Sep 2024 18:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0L0p4WN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38DD10E75D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 18:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726771574; x=1758307574;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=nWhuGIdyvFBpMaN4vW48OxMz3oaDZC53Y26OzCWZsbQ=;
 b=e0L0p4WNIh6SMibTFX9pH3K3hwQ/kd/30aHnBqne3kAb5oyjZHkR0jyL
 tPUk1s4Q4iU1iFs7QhB4E3VDPidb7gEMtdgAg07/V9U3z2j1lNwGsQFcF
 FFBjKwF8NQCpCptm37Lwyf73ifAS+j4uYepZFYGvEI+QlfNjGgamnRo2d
 2/gVVnLrKfjpNH/AzLEOfLBmZTByM3P+8sGlKMcwSwdlPwUr6ueXZktsW
 KEknK1/qG9+O0khuoYYgJLk4OrSgSIgFKb6m2wU53MmA/FMivWJbWgdoP
 6SqPhboHN1rKRvp1z3Bk601uDAJ+giKWnuL7GiI1EXu3UeNvcBOAZ5SAf A==;
X-CSE-ConnectionGUID: J8J8M62aT2miz0ccMviDmA==
X-CSE-MsgGUID: YdDwtNrvQUGy7dKL4KJ+Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43274101"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="43274101"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 11:46:13 -0700
X-CSE-ConnectionGUID: Uk0xNp/tQXCwpKb3jqOQzQ==
X-CSE-MsgGUID: nORjHvjqRKusoR/WE/QVIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="107503697"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 11:46:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 11:46:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 11:46:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 11:46:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k632MTJk+7w/OcK51zEB0R4R75ver6FFrXAUzFTEtKev5A0P8hcXV6SjglaHJmVxkKw2VQjVG4LQ6lSFrZjSH1mD/zfbX7DiqyXVsRs1WwHPovesod6kif4mHzXCex80smhkPYPKCoFHR2f72Tglt4pCfU/nHLkr5qkfd/7aTSxrjeaCYLsnICSB0hL29dy0OCpbh872o4u1d2l564SuunpEKsnI3bwNzPwHwbaVpojXfi9CNbTtz9WTAwHA1alsNkBwVT6vnvepjJ/De8qYfF/Wy+uhU5EqRZM7KtDdUQbyRvIACum6fYAiDpZJYE1hPSPeYYXEK4xwguxUtAh1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXRTomUOO70LqJ6B+seIMyvtKczdXD/Pwe9QThvTP/g=;
 b=I8pz3/agA2o8zhWF929d7IMa/HCcfKOjR6/Lq8jUnKSOs3o4WKSagdNt0qIgNd8wLDkSEJsGfv+LdWSMV5weoR9xJOjFf/R7QwVIuKDebBeWBk+j5JdB4b/yCpD50QQ1Tc7XvsHrwNDPdrbnRQhg1ZTI1OpQMfLOql8WsbROPnhMhWh7HnDSvyJlfaD4RuuR30iOIHKg5rOItaO/P+gZiTHXOK/WfS/CZpxXrMogtRAxrOFVnbttrlWMjJ15DJZ9oXYHZoN36rfzPxEUGqvwggM3ttxds5Ezusc5Yzof7bZV+a+9+LFdUlUzqCGX6iN9P13zYdKIoKSf8J3RfB1JiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 18:46:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 18:46:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <65167663-8d0e-4b6a-94c9-5480fb400761@intel.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-4-gustavo.sousa@intel.com>
 <65167663-8d0e-4b6a-94c9-5480fb400761@intel.com>
Subject: Re: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <sai.teja.pottumuttu@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 19 Sep 2024 15:46:04 -0300
Message-ID: <172677156484.49107.16096209191251101570@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BL3PR11MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: 7020b634-64e1-4a41-5ae0-08dcd8db537c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2VJaUpOSzZPTUJXNCtpWWxpUk5JSmdpb2dRRFhFcXM2M3ZYMUVYbXFlWGpm?=
 =?utf-8?B?ZVRZMVFrWDRKUVo4UGs4VjAvN3lvbVZnaGRsb3h5Sklnd3NXZ1FXd29HeHpW?=
 =?utf-8?B?V2FOeVdTdGVNOFV0cW5sa01RaCtvSE1sdVNVVDdRSkhKclhDK3NCcjdwUnEw?=
 =?utf-8?B?Qk9DUlY2SldYSjAyZDV1Nzl5UW50SUpTT3ROS3diOGhWZWUySDdTNzE5VDJF?=
 =?utf-8?B?UTRoc1RKcDN3Y1EvUmFqZFJhSWFxanhFSVozNTVadS9GSVpUSW1EYVFnVVdh?=
 =?utf-8?B?TG41bjVXK2hzcDVYYXNxeHdRbXk3S2UvNEU2bDM5N3JwbDFMMzdRNVA3YnZQ?=
 =?utf-8?B?NHdDSHg1VVhxVGxqUkRSMUFURldzZU5ibmdyTm83clF3d0dLb3F5bW5WNktH?=
 =?utf-8?B?RVJ3ZUZNRXQ4ZUNuYktTNzk3Uzhsb08vWWc2dWcxZ08yMGZLY3F5cEVNbVIy?=
 =?utf-8?B?VW9IMEFKZTJ2MjU2ZmQ1M0cvTGs3OE9ZOFpzWmJXMCtCMjIzOTc4bUphRTdU?=
 =?utf-8?B?TzB3dWMxZWVocXVId25KaWVPYnN3RmhpSTlVUi83S3pocitic3Q5L0ZXQlVO?=
 =?utf-8?B?WWlBVTEwNExsd3AxYzZFUDcxbzREbzlyWURpM3Fjd1ZuMHdzK2lNN1g1WGhU?=
 =?utf-8?B?bFpjc1ovZ3J6RGVhNzhzZy9Ga2doOGdoeW5EbDUvL2IrNzliTnkxQ3dwKzFE?=
 =?utf-8?B?QUtTYVRaZjlhblNwTVg0dHlpQkkxRGM1MC84RVliOGkwRGdGRVVCWXQvL25L?=
 =?utf-8?B?dFdXYlAwczVnclI4MWM1eWtoUE8xbU9VTXJQQk54a2ZnL3NtakJTdWVjVU1i?=
 =?utf-8?B?THlVc0xXTGJ5bDN3VEt2NUM5N212VU9pRVFQRFZjSlgrT3Nmd1Rzb1MyRnh3?=
 =?utf-8?B?QXlEdGZHbVkxNXV6bXlwbVdiR0RKZWVDSGtSdGcwdVhTRkp0NFA2ejVNZ1BJ?=
 =?utf-8?B?b01UUENrQVVhLzJSMmtwYUF2WkQwM21UZDVkdzJqcGo5QWxNSG92OUpPaytT?=
 =?utf-8?B?Ukk0elNsVHhaZWJ5c2UyNW1WU2taT2xVSHV4SFVWRGs1YVYyTlpzN09NZkc0?=
 =?utf-8?B?Tm10aCtHMmxDTnZpb0NuTVpBYkd4UWorcWVVRitXR1FnK2lEdEpPMkppVkRC?=
 =?utf-8?B?SmF4WFlCdGwwOFVDVzErTjFETlUwQlF4YmtYSTVqaElZN1YrYUFkTEx3dzBZ?=
 =?utf-8?B?R0wzWDQ0VG1JZzBxZ1Q3M2pBdmNoRVZuUGJwR0l1RStDYzNIc055TDdaLytZ?=
 =?utf-8?B?MUd1YlFPalZXRURZYUUxaEJXekNROGZQcjhVOUttMDR4T2pXNVptbWdvY2Iz?=
 =?utf-8?B?M1ZCblNnYXFxOVc1dlRHS1FXM3laNW1CQ3FkcDdsL1ZkbjN6Rk1JaXhtWTd0?=
 =?utf-8?B?enFsTW5Ba1hjd2hYWXdmVTlQczBkQkdkeXRuS1VyVlBYYWlhV1VVUmg2RU5N?=
 =?utf-8?B?SGdWd2hrT012L1IrbWd6Yit1K1orR3ZiYllCLzZ1eEk5Z0tOSXQ4Qlgram9W?=
 =?utf-8?B?RmYxZEtNb1JlajFQMVBBTnhHOHlGV3dVMENWTGZDTisyYW1waTdpTy80b0VG?=
 =?utf-8?B?TFVPS2tKZGlESG9xOE5ESWJGL2dtYXcraUh1V0YyRDJZY1VjNHQ5WWpOaVpr?=
 =?utf-8?B?dk94TWF4SnhDNW9BamUzRnhPZm1SZmJNOFpka1prY244TXorLzNnMlg0d3pZ?=
 =?utf-8?B?cjhMVGhYc2dUQ0NyWlh0R0ZyckdzdFd4cm1Renp5dy9YMmxaQ2tyMFlOMlJp?=
 =?utf-8?B?Z0NEemtSLy9naFN6NmF6c3hEOXVRdjFwMlVJbStyNlBldThBYVZSSnpPbURi?=
 =?utf-8?B?ZXRiVGIwQ1kvbHhKK2tjdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vyt2OEdHTnlXd056aXBueTNSeC9MN2lLaTUzcm1lZVlpcTAxSTAxYkFWUG9u?=
 =?utf-8?B?QVBWdndDaWRhajBlMlFkcWRFa1RjWHBKeFJxaTJuUUNEQlovbEJNLzRMNFZq?=
 =?utf-8?B?amx1UDRkL21XdEhPM3NxZlIzTlhLZ3Q2eGtONzRGamVPSGNGY1E4WjRDZ2pj?=
 =?utf-8?B?STErTmgwZ2NSNzB5NUZTTnNDU3QxVm9nYjlqZXJWcTdnK1dPbnF4aGhrK0No?=
 =?utf-8?B?WUlLZG9aK3VmanV2U2xiUFExYlNGb3FSYUNuV1NpNWdpZGN5MWNOdFpQamk4?=
 =?utf-8?B?TUpIYVEzOWlSRk45ZzBGZlVqRzlJRlRGc3QwMGlHcFovT0ZaZnN2WkpybGd3?=
 =?utf-8?B?WEthMVpsTkg4YmgvUmR2R2dHK1ExczJoZXpkbEd3RkJabTNvdHdYUjRERmdY?=
 =?utf-8?B?emF2UzV0bmE3dTQwZjRrbUJudDhEdTNKWWZmWWFKbnBqMVpKaVE0MS9CcnIz?=
 =?utf-8?B?Y21qODZCYTNqb2VBYjZvS01BKys5ejNBSHhwZFYrMUlTZDc3bG1mQ1RHcm5Y?=
 =?utf-8?B?Y3Jmc3dDTEhHb1NXYjFVYmRGeSs1aklTZEFOQitNU1M4cGtueVJCZlk5NzJy?=
 =?utf-8?B?RGx4YytPN0JHMk9NY1Q2WElXYTltUmthVXF0RG5lL2QzVkFMTVU3R3krNHp2?=
 =?utf-8?B?Qlc2TE9aS0lXdUxndU9Nc1ltWXJiMGVDSC80UndZZk5PK0ZYWVl3QjVydWpI?=
 =?utf-8?B?b1hmZk1TYmhSZXhxWHNHOFA2SHpqbC9Vd21EZkdXd2hJODEwUlVRYmYrVjNk?=
 =?utf-8?B?SzJSQnV0dEJmY2U3RmJzMG5tTjllVkF1OTJudm50RWZwWmlyYmxoQmRxU1dO?=
 =?utf-8?B?WVBEMWQrZDdqamovaHJjdmhtSHV3YnJIbElYWlRmdEVZZkxLdStJMWpSQUc5?=
 =?utf-8?B?SldGU2hIaVZKbWE3bzJUd3gvZlZSVmFleCsvcVUvakhpdEphNVcxYk9EamZY?=
 =?utf-8?B?dGJYVkhSMzB4NkZOVFQ5R2FGdXAvRm45bGpGWkwzeHRwT3RPVGZHckEwS0lh?=
 =?utf-8?B?N2c5Z1ZZdisvWkl2bStuV0lMbHp1UkM3TUhUMlJ2Wjdzc2wzZ0czdkZQWml6?=
 =?utf-8?B?emVhVFNrYUNNV2RJa3ZUYjNhR2lkVU43UVk3ZmZlTWpUbnhXd2ZaSlhBanJp?=
 =?utf-8?B?WXo3RUdJbnIwczAwRm5Sb0dJaUg1ZHpPU3hCTVBFdVJTV3E4emhzM0Zvb2s5?=
 =?utf-8?B?OFI0VVREVVQyTVNXdmxXRWhWbWlxU1JaRUZmeWNraE1oazB3aU1GQzYzeGoz?=
 =?utf-8?B?dVd5UFdXQzdFNTY4U2IwZnlvUjZSUGNmUjFFZ3lDQXZoWUdNT0JNMm1XVjRP?=
 =?utf-8?B?bm5yVWIwN0s3RFVab250bFg4VGZjTTg5QkltWlN3MnVBVS94bm9rSjBta2xJ?=
 =?utf-8?B?bmVkUmkyZzJuMXkyb3JIV25odFBEZWVVOGNoMU1xVnZyNmtrRVpNd1JGZWls?=
 =?utf-8?B?Y1pWaWxZZ0NjaHVyaEcxYmo1R3krRjljaTNSVlhpcnVpY1h0UlEybldWZzBk?=
 =?utf-8?B?M0lQbzJTRXBEamFCSHFDaGpDRUFYYWlqNlZneXZQTkloeTZaeFhLckRvSGVX?=
 =?utf-8?B?UDBBcll4K3ppQ0FXcHJUTnBCcDhjd0h3eVB2Q0VwL1U5M2xTdTRlQldqZVEv?=
 =?utf-8?B?RUttVmJzL0NOT0JiYk9xWUFVekR1ZHBlaXZuM3UvUkw5VEgranIxeGxWaWx5?=
 =?utf-8?B?TUhZaGdMVThoMFNoUEhiWFFDaXI2UngwSWxMMkpjVldCYmZZcXRjanU1M0Zr?=
 =?utf-8?B?UE41NEl3dzI1OHlGWkY2Q2EweVFWakR0QjJrYnk4ZUM1MTZCVnBiSUxTd2dL?=
 =?utf-8?B?TlYxaHZZKzJwa3FrdUVCQTVOdzNRdFlrdlo2SlZ1eEpIZlZWSldKT0VSaUdp?=
 =?utf-8?B?TnNsRGxOV0xKYUVtV1VMUTlZbTFLRm5RVkhXSnJvZlNVM0l0MlFGdnlaM0dE?=
 =?utf-8?B?U0Z3SGwvTmpTM1NUdmZBeUlrdU9hd1R3SEJkV3R5SVBHZHJhMlBOMEZVOUwv?=
 =?utf-8?B?KzhnL051cmdLeU1KaEJtcXVucXNLWi9BdW1reSswVit2WlYwQmszYjBGbkg5?=
 =?utf-8?B?TWdsZElUdTBqQUk3RzZjMlhqdVp5K0drQS8yYmQvaCtCaStuaXI1d3RRZjVC?=
 =?utf-8?B?VnZ4MEpUSDhVM3RwSEIxbGVZaEhqOWlqNjV3MEE4QnlSVzgzV1BMY0pGVWVj?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7020b634-64e1-4a41-5ae0-08dcd8db537c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:46:09.2099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9/2kI6hzYAkx9rYBdkO8QoXGNVdNeLdHPQ79D5tO6GZirj2RAlP8+Vv4xI76YR0+VAzv7TZWXYU2AwKkg2qzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
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

Quoting Pottumuttu, Sai Teja (2024-09-19 04:39:00-03:00)
>
>On 19-09-2024 02:17, Gustavo Sousa wrote:
>> A recommended performance tuning for LNL related to L3 cache flushing
>> was recently introduced in Bspec. Implement it.
>>
>> Bspec: 70821
>
>The correct BSpec should be 72161 I guess.

Yes. Thanks!

>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>>   drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/r=
egs/xe_gt_regs.h
>> index 6ec2d2c11d77..ccd18cdd5b50 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -389,6 +389,9 @@
>>   #define L3SQCREG3                                XE_REG_MCR(0xb108)
>>   #define   COMPPWOVERFETCHEN                        REG_BIT(28)
>>  =20
>> +#define SCRATCH3LBCF                                XE_REG_MCR(0xb154)
>> +#define   RWFLUSHALLEN                                REG_BIT(17)
>> +
>>   #define XEHP_L3SQCREG5                                XE_REG_MCR(0xb15=
8)
>>   #define   L3_PWM_TIMER_INIT_VAL_MASK                REG_GENMASK(9, 0)
>>  =20
>> @@ -406,6 +409,8 @@
>>  =20
>>   #define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
>>  =20
>> +#define XE2LPM_SCRATCH3LBCF                        XE_REG_MCR(0xb654)
>
>Just a general question, the register might exist on other platforms as=20
>well right, so,
>
>would it be a good idea to call it SCRATCH3LBCF_MEDIA instead?

XE2LPM_ already indicates this as the media version of this register. I
think _MEDIA is unnecessary here.

>
>> +
>>   #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
>>  =20
>>   #define XE2_TDF_CTRL                                XE_REG(0xb418)
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuni=
ng.c
>> index f62622f0be85..4dd77b44ac82 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -80,6 +80,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D =
{
>>             XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL, =
UNIFIED_COMPRESSION_FORMAT,
>>                                      REG_FIELD_PREP(UNIFIED_COMPRESSION_=
FORMAT, 0)))
>>           },
>> +        { XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004, XE_RTP_END_VERSION_=
UNDEFINED)),
>> +          XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
>
>The register should be SCRATCH3LBCF

Yeah. Thanks!

I thought I had build-tested this series... It turns out I did, but with
the wrong config :-( (i915 CI's kernel config instead of xe's).

--
Gustavo Sousa

>
>Thank You
>
>- Sai Teja
>
>> +        },
>> +        { XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
>> +          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UND=
EFINED)),
>> +          XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3LBCF, RWFLUSHALLEN))
>> +        },
>>           {}
>>   };
>>
