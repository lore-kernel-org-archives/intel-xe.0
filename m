Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A768C369C5
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 19:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1266C10E068;
	Wed, 16 Apr 2025 19:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ggy/Y0Rp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B3B10E068
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 19:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744831448; x=1776367448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P/GjL5wBJFasAPNi7RLz4fiL0iYky8W6IwpDDc7uPoQ=;
 b=Ggy/Y0RpCp/z8RzA2tRElpubp/DZTVeiFWh86jNQ3Wz4vAaRWrBzi7h5
 LPPuBE80mvfsapaBsHS+rDrcaw0CNjWBPZRrPyHp1nu7gtxxyrSkEUjZa
 GAyNNJzL+WJCDnQ5mQ5/A6r2oyQWBWqy57/seMzjDALqgoFUyK888z9Lk
 TEpCVsx7718rNSEpHkbxAOiC33LZbGU/PctQ5gk5lZy+8Hj8hGnsjIXWU
 gEwyMqXdJ+uoZ7+WgqcSXAtM2tEwChp99DcJErEDRf86mcfDEuvyWnHaW
 KSjEjrF1iX/4f81ZOpnklgwY7F/CB8FTJy12EzbyvUuVkigfWkt0ncbRi A==;
X-CSE-ConnectionGUID: QQz6lYh2SGiCaz+wyqu+uA==
X-CSE-MsgGUID: HyRbUC0DSD+DPgggJHYUXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46527139"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46527139"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:24:08 -0700
X-CSE-ConnectionGUID: vCLduLc+TWeHV/j4vb9sLg==
X-CSE-MsgGUID: zB0ey87cSUeECo2jHhaxyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="153764312"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:24:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 12:24:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 12:24:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 12:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM9GB7/J7Tg1X24w3pXStyFKhuh9rB5y2Iqy4EfRX3oCIaOfvbwBMfqTWT+RYm76gBig7E5ayLLr+CPyA9DTfs26ednGMVlhkA1pgfVY20IX3BuD1okYcDfLPE3/uqFJZJIzuTJ3cpyoAitW89zjbxMPpZQQJLUx87PzLS1k6uvORAgrKbW0hqAJvI7rm+y7pbdsU5n7AKKQq8Wm/fnHPz3X1iEeSHKXHDOIi+6e4IVASVarKYVLVcW8KAjxFaNdIAzctAWNy7Cj8Yn06bFU/byRPXWLde1vTZ8J2lHiInqsU2zOZcyyIzBPKaL66cF9WCEWb6fhSrHff/qpNPr6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/GjL5wBJFasAPNi7RLz4fiL0iYky8W6IwpDDc7uPoQ=;
 b=bF4sT7EYydo5hRykItNOskEYg9C4trgURzC2Tn+GLa+GB+0O77PDgb5phwrtXB5CTUm6f7pY+1jSQNWa4GPtcnjVVUU1FTM9NPAd3JNKZ82LiFtN14tqdpHxo8Gj0Z28y5ukL2ES2eR1l8sA0+cJgta/jajPVwVoe4QSn9IPSxnRr7yLfehkhyBOeuPdMnDo5CEG9mvx87UdGW7sZDde5mg01kJLeUtaVRcmHV4HAEiVsfaQCQ/dfAbXFIL9GPf+enEiV7FTWbmMVTsz+1SpB8vnUW3HidjZCBZylAeZJzlNoQLoyPExfkSewiB510DQvscLn22ECoWicB44bEYuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA4PR11MB9057.namprd11.prod.outlook.com (2603:10b6:208:55d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 19:24:03 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 19:24:02 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "nirmoy.das@linux.intel.com"
 <nirmoy.das@linux.intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Do not use CT lock in TLB code
Thread-Topic: [PATCH 2/2] drm/xe: Do not use CT lock in TLB code
Thread-Index: AQHbrv2uvwzexwYq6ESfjvs74rTUtLOmrDuA
Date: Wed, 16 Apr 2025 19:24:02 +0000
Message-ID: <44f617884ff958c774cb67082e12a6d0d14ac049.camel@intel.com>
References: <20250416183032.70948-1-stuart.summers@intel.com>
 <20250416183032.70948-2-stuart.summers@intel.com>
In-Reply-To: <20250416183032.70948-2-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA4PR11MB9057:EE_
x-ms-office365-filtering-correlation-id: fd4261fe-a9ab-4b16-9e6c-08dd7d1c3f2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OElZWXRnaG9vaTdSQ2VzSWd5NHNoaVN3dTI0dXQ0TkJncENCRmNjUUZQVmFn?=
 =?utf-8?B?eGcrdm54UzVvRm9FRkQ2czFqOTBoVElpKzdPcGtwbDNYbno4ZnlhVG9wK0V4?=
 =?utf-8?B?cllwUjRVUUhLSGYrWm9SdkdDR3JTSWtQb0N1TDdrR2xxRDJMR1BHUGUyY3Yx?=
 =?utf-8?B?dHk5NHhuMnVkckMyYTZvREF4Nmo3djBkZ2VkZVdqUEVOVm1tRmRHVVRZTWRL?=
 =?utf-8?B?eEFHZXFObkxteVYyOGgvcFBKSGFJYkN3Uno2MEd3TWpXdXphT210dXJuaWQ2?=
 =?utf-8?B?V0MrclFxQ2lEMXlyZ0dsM1p4a1FhNGw5bGx3MjVIMlpkQzg1UUZMUnhzYSt0?=
 =?utf-8?B?YzJFZGg3Z2JNeFZDQTZOd3hzK0ZzZU93S0ZVMDZIeVFPQzdKUkh4T1FmQ3Zo?=
 =?utf-8?B?SVIwdTRiUkp6YUlTZzhLdnh5ZHRBTmkyamVINFNXb3RTa0c4SFJKVEg2Yldy?=
 =?utf-8?B?NUhDYUlCdGxqUlFFQlNRWEVmSllWWkp5U3ByZ0xQK3pyUkkvWGxUZmF0a3Vr?=
 =?utf-8?B?TXQyS0F1N1E4ejl3NGRmZHVrcElPYXYwbmVOOWNLcTFBTks0aVBuM3pTcmlP?=
 =?utf-8?B?SkFXUW0vZ3pFZjlHbXJjdmtVOTV0Tm5ndGhTZHlodFN6Y0gwSjBnaTRaSmVL?=
 =?utf-8?B?L3lJWTczdkdvNnF6TkRmRlpiZFFmS1VIbWJnTU9WRGx5Ym1sOEhWUnhod2E0?=
 =?utf-8?B?UmNjaCtLU2xmb0psSy9hdmhkYzBiNFI0MzBJTjEwZDFoSDdwS1o1VHdWaWhN?=
 =?utf-8?B?Y1F4ZFI0R1AvdmlaOUo4SFUvS2xyMzFSUGxrd3RibHZmYmpJOTVMODFJRktr?=
 =?utf-8?B?cjFHNUdFL3ZpL2hFOExoMjhBMElndlJrOVVmODRobUhGTnFPVjhISzc2MUlT?=
 =?utf-8?B?MnNHWVhyQ3ZyN3lsQXczUkF1blVqYzNIR2gxR2VPNTBXVzdxUXJZUHk1d05C?=
 =?utf-8?B?YmV4ZkErNmVCTGZTQ1NQUG16MExQdjJra3lCQlJRN1FwOVNOYStWcW9MWDh0?=
 =?utf-8?B?SVowSURERzdqOUdLSlNBWWtFRkc0czVNZ0toRm9nWE5PbXZlWm1uT1NwTUdN?=
 =?utf-8?B?cGNIVlBvd0NlTjd6bG5IaVZCQW1MWTJrMWhabmk1eGR2UzN0YzVyRlJZTU05?=
 =?utf-8?B?U0E2eTFrajVsNHE1WEgxVTdKTVBVRDlGdUVsZ1Y1SG5GTlZFWk5OanBGWFBV?=
 =?utf-8?B?Tmg2b3c0WWVUTUVkMVAwK2ZqZVlwQ3ArVDh0bmZzamdkM1JlbGxnVUVXblNG?=
 =?utf-8?B?cmJCeWh3M0p1SVRkdlo3VDhQMGVFZDRwV0NRNTdOMGNUZ2RiVFZydElCbXk2?=
 =?utf-8?B?SzVZWm5WZEp1TXNKeVJ0a29oTW5oWU04dkVVNlIwanpmWGRwVGIrcXRGT3hu?=
 =?utf-8?B?L3VoTEwrR3E0eTV4a1FDTVZHVS9pMzA2TXp1WHArVUZlWGZtU1VKRjI0a0cy?=
 =?utf-8?B?aDdzTEFmRnBkZm9tWkcvQngyTUk5ZlVEZ3ZxY1dkMHVSMnRsdjVyZ0NVZnl5?=
 =?utf-8?B?a25JYjBsWDhlKzlKdW9JODFuTVB5Qmsvay9OUnB4UGwzakZrZGc3U2M5Y1ZW?=
 =?utf-8?B?UUtrT040V1RuaGQwRFdOSzdtRTFURmE5ZjdnMmxGZTNralcyWVp6TkVmSGZz?=
 =?utf-8?B?bEpPSHJvR25YSHUyTUt2bUhoMnpBYk9uSDhyemg3ZXhMTTVPNEc3MDlVVHhZ?=
 =?utf-8?B?MFFSWWRxVEt5NStPRTVzU0V3T20rSlBjTi9ZT0xQbWlqNDV6Ym5hMU51Rmtx?=
 =?utf-8?B?UERYRDRIZ2orK241NE5HdXl6K0FnMDN3SE5Odzh3TWJzOEFuZEY3bzFqRzVD?=
 =?utf-8?B?akpXdGVLWFZQSmhUV2VqK2JEaVZ1MURoc01UMHhUUFFhZ0RmbUxyOFZ1SGpK?=
 =?utf-8?B?bUVva0pibnNTREtoYXdVTEMwZW5BSXYxb0FqV1lwV1EwRWFSTGtOQXpONDVQ?=
 =?utf-8?B?K3J4c0hlbWZXU3JmZXUwRVZkM3lqUE9tMGRuZXJ6QmZlWmRpVVdUL3pjYmxt?=
 =?utf-8?Q?BftewXAwog7oM2SLpWwdd3bZ11Ayro=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDI0T1hMSmlmRjhXZmFud20xMjZpQ1BQeGh6Slc4aERISnhhdzBqc2JtNXM1?=
 =?utf-8?B?RXJhQm5yTktoTVBGdlNtSzFzYkJFOW9QWmxhYWRhNFl2YjNuWW9PcnJUOWgv?=
 =?utf-8?B?NW1ZVk1yQkhpNEJ1MW1WYktLTjVLQXNDclNnQXlBZ3NLWndLR0htdlFNUWJY?=
 =?utf-8?B?dnpmaEpZbnhRdm5pL0d5N0FndWc3MEMxR3pvengvWW1mQ2s1OFYvNHcrRi9J?=
 =?utf-8?B?dVR1bWlydVFBaHh4L01BQ1cwVW41STlFZGkxOVJMZFJac1E5bmpWcTFENTky?=
 =?utf-8?B?bm85UEt4UWNUR0xvT1djdFRyYURtTmlHRUhMM2k3dnY4cldLaW5QMFNWQUlE?=
 =?utf-8?B?VE9UVUxWYlZSc3ZabnlnTHRIZk5OOHRXZ3ZYNmFodGxuVVZENkhsNE5sa2NK?=
 =?utf-8?B?OHZQMDRJWXVxUVlVRXNGNVFjUEljd0F0VnpjQW5URGY3cDBXaVFSakNNYlo1?=
 =?utf-8?B?RzEwaU81Q0tYdTVOWi9mM2JFYitEQzEvYkhlayt6R0dPRWVFdjB0ckZjbGh0?=
 =?utf-8?B?T29UMlJVc3hqdjBBbXRCSUd3ckgrQTBkU1I4K2p5bFhQaEVPNVZmVmtHS1BH?=
 =?utf-8?B?cVQ2aWRsNHJURHhYZmRiLy9KK21ZeVVEcDNXYVdHZVBVRWNlMUJtS2c3UkMv?=
 =?utf-8?B?YlRCTW4wU1JMOVJEdXJobzg5SDdIeG80eGtwR0U4YkdvQy80K3JQaUVwa1ZX?=
 =?utf-8?B?Rmg3SEt3dXZId0VzM3VQQm1pS0RWYjV3YmJFOWNGK0UwNXBaWVcwN29LTlc1?=
 =?utf-8?B?cklHa0JZN3FwbGhrZUpQcTZoM05IY2lNdEdIRVJIVzRjSmNPRk4vN3hzL2ZV?=
 =?utf-8?B?N042T0NCc2Fzc1NvSnNQNVZRVE9XcGdkQjdnZE0rcS9tTUwxcVIyMEZyeVdF?=
 =?utf-8?B?dDA0ZnVmQ1VGRmlZMEtBTVoyMVBzSnVsOXI2YlhqZUhuUms0dUhkSHFUSXV0?=
 =?utf-8?B?aXM3NjVYa0ZJVVFWYmJaMTdWcloxcXd3eFNuTUZWUDMwVXpqM2F0WlRFZjQ4?=
 =?utf-8?B?aUhYQmo2dytqUlZCSEdEdkM4dVBWVXBXdUpTcUd2RWNEc3pvRHV3U2VrMVRq?=
 =?utf-8?B?ZXEvTXM1S1p4Q21KZ2NDVUNFN0g4QlBPUTdoOGVESEltQlVPcmV2R2ZDc011?=
 =?utf-8?B?cjc1TW9zVnRrNmdZYVhnbnI1NEtPckxJMERObVYrQi93Qkorb0hWaXdPN3FL?=
 =?utf-8?B?Y2UzZWFaVEtaRWlnazNmWFlJU2kxank0MXhlR1pZeDNQVWhPUzZrMHE5eGJw?=
 =?utf-8?B?YU8zd28rZC9pSU1LTWRqV0pEWE9MRjJFZUlRYytNc1N1UndPWlg2dDZialYz?=
 =?utf-8?B?WUJlV3ZHSVpxaVpmc2IxT2N3Mi9TdFY5eXd1TnJ5QzZudmlaZjNJODdWZ3c5?=
 =?utf-8?B?dGZJUWthU2dXMkFlVnhzTEVuZFA1M3RPZi9UR3MyNnFiTkNNcFZvYlBxMEV1?=
 =?utf-8?B?ZC9hVzRNNUREQ0o0bG03ZTBuQjNuaStvUUlVYjcvM2Q3V3I2cXRJNFhXUDNJ?=
 =?utf-8?B?OGJCWHoyM3dNbWNyRmZqZUt6VCs3YnpNMUtOOUlERFVRR3lYeFpkSHJVYVlp?=
 =?utf-8?B?WWh6VVBFcEVkSDFsVVJnZjhKWWpmbDF2L01iQy9FeHhKZ0NWbWZ4V0R1blpI?=
 =?utf-8?B?ejFkakRmSWxpU3BETS9OYjF2RVNwbi9rejd5aHltL2Q3ZTR6VEI0bWo1UDZD?=
 =?utf-8?B?NlFueG5RT3d6WUxYNzFFLzR0TTdRRnNMcU9qOWFjRWpjK1BTYVE3TjRYcjkw?=
 =?utf-8?B?RU1uYnlBQ2RkR3ZReHd4Y084TXhHa1RxaFVHSm1OZFV6ZGdpRTYvY2pUMzJO?=
 =?utf-8?B?VVQ1bzVMSU9HVGNERTZ6UlF0V3N1QUJFSUdqblhreVVub2FpdzdiVkNCbDZi?=
 =?utf-8?B?OERST29sZ2FiTVlja21rc3ZFQldaZys2ZmZmVDJJUTNEY1pxUys5OGl0QVBT?=
 =?utf-8?B?YXYyaXgxcVBlWHFnd2k3NjBWRUVQUVNmcGgrcGFmb2hwd2o3UXQ1eHplMkNh?=
 =?utf-8?B?VXBzVkFTcmp0VHJHK3UyK1l6cFZUeFJ3R1FneVgrWEJvbXByY2tUQWxuWGla?=
 =?utf-8?B?dStaS3NLN1YwVFMwR2dNOFRNYmlvbWV3ZWtDTzBheHduU3NmYmljSmNzeTJl?=
 =?utf-8?B?Q1Q1RFIyMEpobEZkazNSU2lpeG5ORk5ER0NwLzl5ZzJBM0x3aXZEWkIxaTNX?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FF482D30F6DBA4DA1357321B6F22571@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4261fe-a9ab-4b16-9e6c-08dd7d1c3f2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 19:24:02.8790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ht2cfSr+x4eMuMDdFgE4fsusspSwm4A98RhoOr2wWkU6zQzo8LF6Y0RTNDpWtGJJXaFvfRK3EIysD3SuCtcw3P/hK+yM/9/q3aCkbfppHbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
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

T24gV2VkLCAyMDI1LTA0LTE2IGF0IDE4OjMwICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToK
PiBGcm9tOiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGludGVsLmNvbT4KPiAKPiBTdG9wIGFidXNp
bmcgQ1QgbG9jayBmb3IgR1QgVExCIGludmFsaWRhdGlvbiBmZW5jZSBzZXFubywgYWRkIGEKPiBk
ZWRpY2F0ZWQgbG9jay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFz
QGludGVsLmNvbT4KCkFsc28gYWdyZWUgaGVyZToKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJz
IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYyB8IDE3ICsrKysrKysrKystLS0tLS0tCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMyAr
KysrKysrKysrLS0tCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxi
X2ludmFsaWRhdGlvbi5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRh
dGlvbi5jCj4gaW5kZXggMDMxYzRkNDNmMzZiLi5jMmJiNTMzNjJkNzQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMKPiBAQCAtMyw2ICszLDggQEAK
PiDCoCAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0aW9uCj4gwqAgKi8KPiDCoAo+
ICsjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+Cj4gKwo+IMKgI2luY2x1ZGUgInhlX2d0X3Rs
Yl9pbnZhbGlkYXRpb24uaCIKPiDCoAo+IMKgI2luY2x1ZGUgImFiaS9ndWNfYWN0aW9uc19hYmku
aCIKPiBAQCAtMTIzLDcgKzEyNSw4IEBAIGludCB4ZV9ndF90bGJfaW52YWxpZGF0aW9uX2luaXRf
ZWFybHkoc3RydWN0Cj4geGVfZ3QgKmd0KQo+IMKgwqDCoMKgwqDCoMKgwqBJTklUX0RFTEFZRURf
V09SSygmZ3QtPnRsYl9pbnZhbGlkYXRpb24uZmVuY2VfdGRyLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2d0X3RsYl9mZW5jZV90aW1lb3V0
KTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biBkcm1tX211dGV4X2luaXQoJmd0X3RvX3hlKGd0KS0+ZHJtLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZndC0+dGxiX2ludmFs
aWRhdGlvbi5zZXFub19sb2NrKTsKPiDCoH0KPiDCoAo+IMKgLyoqCj4gQEAgLTE0Miw3ICsxNDUs
NyBAQCB2b2lkIHhlX2d0X3RsYl9pbnZhbGlkYXRpb25fcmVzZXQoc3RydWN0IHhlX2d0Cj4gKmd0
KQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBhcHBlYXIuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKg
Cj4gLcKgwqDCoMKgwqDCoMKgbXV0ZXhfbG9jaygmZ3QtPnVjLmd1Yy5jdC5sb2NrKTsKPiArwqDC
oMKgwqDCoMKgwqBtdXRleF9sb2NrKCZndC0+dGxiX2ludmFsaWRhdGlvbi5zZXFub19sb2NrKTsK
PiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2lycSgmZ3QtPnRsYl9pbnZhbGlkYXRpb24ucGVu
ZGluZ19sb2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgY2FuY2VsX2RlbGF5ZWRfd29yaygmZ3QtPnRs
Yl9pbnZhbGlkYXRpb24uZmVuY2VfdGRyKTsKPiDCoMKgwqDCoMKgwqDCoMKgLyoKPiBAQCAtMTYy
LDcgKzE2NSw3IEBAIHZvaWQgeGVfZ3RfdGxiX2ludmFsaWRhdGlvbl9yZXNldChzdHJ1Y3QgeGVf
Z3QKPiAqZ3QpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAmZ3QtCj4gPnRsYl9pbnZhbGlkYXRpb24ucGVuZGluZ19mZW5j
ZXMsIGxpbmspCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnZhbGlkYXRpb25f
ZmVuY2Vfc2lnbmFsKGd0X3RvX3hlKGd0KSwgZmVuY2UpOwo+IMKgwqDCoMKgwqDCoMKgwqBzcGlu
X3VubG9ja19pcnEoJmd0LT50bGJfaW52YWxpZGF0aW9uLnBlbmRpbmdfbG9jayk7Cj4gLcKgwqDC
oMKgwqDCoMKgbXV0ZXhfdW5sb2NrKCZndC0+dWMuZ3VjLmN0LmxvY2spOwo+ICvCoMKgwqDCoMKg
wqDCoG11dGV4X3VubG9jaygmZ3QtPnRsYl9pbnZhbGlkYXRpb24uc2Vxbm9fbG9jayk7Cj4gwqB9
Cj4gwqAKPiDCoHN0YXRpYyBib29sIHRsYl9pbnZhbGlkYXRpb25fc2Vxbm9fcGFzdChzdHJ1Y3Qg
eGVfZ3QgKmd0LCBpbnQgc2Vxbm8pCj4gQEAgLTE5NSwxMyArMTk4LDEzIEBAIHN0YXRpYyBpbnQg
c2VuZF90bGJfaW52YWxpZGF0aW9uKHN0cnVjdCB4ZV9ndWMKPiAqZ3VjLAo+IMKgwqDCoMKgwqDC
oMKgwqAgKiBuZWVkIHRvIGJlIHVwZGF0ZWQuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgCj4g
LcKgwqDCoMKgwqDCoMKgbXV0ZXhfbG9jaygmZ3VjLT5jdC5sb2NrKTsKPiArwqDCoMKgwqDCoMKg
wqBtdXRleF9sb2NrKCZndC0+dGxiX2ludmFsaWRhdGlvbi5zZXFub19sb2NrKTsKPiDCoMKgwqDC
oMKgwqDCoMKgc2Vxbm8gPSBndC0+dGxiX2ludmFsaWRhdGlvbi5zZXFubzsKPiDCoMKgwqDCoMKg
wqDCoMKgZmVuY2UtPnNlcW5vID0gc2Vxbm87Cj4gwqDCoMKgwqDCoMKgwqDCoHRyYWNlX3hlX2d0
X3RsYl9pbnZhbGlkYXRpb25fZmVuY2Vfc2VuZCh4ZSwgZmVuY2UpOwo+IMKgwqDCoMKgwqDCoMKg
wqBhY3Rpb25bMV0gPSBzZXFubzsKPiAtwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfY3Rfc2Vu
ZF9sb2NrZWQoJmd1Yy0+Y3QsIGFjdGlvbiwgbGVuLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHMkhfTEVOX0RX
X1RMQl9JTlZBTElEQVRFLCAxKTsKPiArwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfY3Rfc2Vu
ZCgmZ3VjLT5jdCwgYWN0aW9uLCBsZW4sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHMkhfTEVOX0RXX1RMQl9JTlZBTElEQVRFLCAxKTsK
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFyZXQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHNwaW5fbG9ja19pcnEoJmd0LT50bGJfaW52YWxpZGF0aW9uLnBlbmRpbmdfbG9jayk7
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKgo+IEBAIC0yMzIsNyArMjM1LDcg
QEAgc3RhdGljIGludCBzZW5kX3RsYl9pbnZhbGlkYXRpb24oc3RydWN0IHhlX2d1Ywo+ICpndWMs
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWd0LT50bGJfaW52YWxpZGF0
aW9uLnNlcW5vKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGd0LT50bGJfaW52YWxpZGF0aW9uLnNlcW5vID0gMTsKPiDCoMKgwqDCoMKgwqDCoMKgfQo+
IC3CoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmZ3VjLT5jdC5sb2NrKTsKPiArwqDCoMKgwqDC
oMKgwqBtdXRleF91bmxvY2soJmd0LT50bGJfaW52YWxpZGF0aW9uLnNlcW5vX2xvY2spOwo+IMKg
wqDCoMKgwqDCoMKgwqB4ZV9ndF9zdGF0c19pbmNyKGd0LCBYRV9HVF9TVEFUU19JRF9UTEJfSU5W
QUwsIDEpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfdHlwZXMuaAo+IGluZGV4IGJlODE2ODdjYmUyYi4uNDczNmE2MDhhODgxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3R5cGVzLmgKPiBAQCAtMTg3LDE3ICsxODcsMjQgQEAgc3RydWN0IHhl
X2d0IHsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAvKiogQHRsYl9pbnZhbGlkYXRpb246IFRMQiBp
bnZhbGlkYXRpb24gc3RhdGUgKi8KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHsKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEB0bGJfaW52YWxpZGF0aW9uLnNlcW5vOiBUTEIg
aW52YWxpZGF0aW9uIHNlcW5vLAo+IHByb3RlY3RlZCBieSBDVCBsb2NrICovCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAdGxiX2ludmFsaWRhdGlvbi5zZXFub19sb2NrOiBU
TEIgaW52YWxpZGF0aW9uCj4gc2Vxbm8gbG9jayAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgbXV0ZXggc2Vxbm9fbG9jazsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyoqCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEB0bGJfaW52
YWxpZGF0aW9uLnNlcW5vOiBUTEIgaW52YWxpZGF0aW9uIHNlcW5vLAo+IHByb3RlY3RlZAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBieSBAdGxiX2ludmFsaWRhdGlvbi5zZXFu
b19sb2NrCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgI2RlZmluZSBU
TEJfSU5WQUxJREFUSU9OX1NFUU5PX01BWMKgwqDCoMKgwqAweDEwMDAwMAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IHNlcW5vOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgLyoqCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBAdGxiX2lu
dmFsaWRhdGlvbi5zZXFub19yZWN2OiBsYXN0IHJlY2VpdmVkIFRMQgo+IGludmFsaWRhdGlvbiBz
ZXFubywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcHJvdGVjdGVkIGJ5IENU
IGxvY2sKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogcHJvdGVjdGVkIGJ5IEB0
bGJfaW52YWxpZGF0aW9uLnNlcW5vX2xvY2sgKHNlbmQpCj4gYW5kCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIEB0bGJfaW52YWxpZGF0aW9uLnBlbmRpbmdfbG9jayAoc2VuZCwg
cmVjdikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgaW50IHNlcW5vX3JlY3Y7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAvKioKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEB0
bGJfaW52YWxpZGF0aW9uLnBlbmRpbmdfZmVuY2VzOiBsaXN0IG9mIHBlbmRpbmcKPiBmZW5jZXMg
d2FpdGluZyBUTEIKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogaW52YWxpYXRp
b25zLCBwcm90ZWN0ZWQgYnkgQ1QgbG9jawo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBpbnZhbGlhdGlvbnMsIHByb3RlY3RlZCBieQo+IEB0bGJfaW52YWxpZGF0aW9uLnNlcW5v
X2xvY2sKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogKHNlbmQpIGFuZCBAdGxi
X2ludmFsaWRhdGlvbi5wZW5kaW5nX2xvY2sgKHNlbmQsCj4gcmVjdikKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IGxpc3RfaGVhZCBwZW5kaW5nX2ZlbmNlczsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoC8qKgoK
