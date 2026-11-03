Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F685606A32E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 06:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c/+cPKMr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DEA10F367;
	Tue,  3 Nov 2026 06:28:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A59610F367
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Nov 2026 06:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793687275; x=1825223275;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QsvnBccX10vR/Qsh8WmYhvBB4PXWv+sNdvsiu50fjQA=;
 b=c/+cPKMrqutj2eXNNp5jAR3O960wUzpaRIKT2SRPnOXn70VV0wv3LkQf
 l/h3fZJmWvtHV/lDgvCcl8uy2ZLeW9tnE7oViiAO2dIe0cAeMd8aZObJg
 cTDh+GhiBSZJisNIajM37/yL0RKT++uZo+putf4Ok9+u1/EHmJO2+wCsE
 iuUKMB704GmhdvsRkf4Ijfio8ncEf2gt0+HXejXsM3R/N5TDlANKjDQia
 W7lk9XLhaikLnEETdCcPHI3/DETH5B4/dNTQeCWZRf+KqrinV3/okF1pe
 yhtUHYGZKBt2K8XfI5K0M+eJOUR5A838PQnatARZ1+Vd4iFs30WY8ytTy Q==;
X-CSE-ConnectionGUID: m+zgjJ30TDadAeTVAwwpjg==
X-CSE-MsgGUID: EQS39gxgTV6L8rc1QOJEng==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2287395"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2287395"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:27:54 -0800
X-CSE-ConnectionGUID: 1L5VSheDQmaLKeQJXCt08g==
X-CSE-MsgGUID: ACGUOKiQQj+oFcYJ6cx7vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6658776"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 22:27:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:27:53 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 22:27:53 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:27:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQRxh43sxqtYY6OH4FOegS779MVPzotnuZ8E4Rq2VQu0433hp+0Ni1sDkx/XSocXphCN8yFA7FcGFSUxBz60G6cUdH0Fc8Ff2m0iicb0Ds6pD4JD/Psyy1CWuVXSVbE0HPU96y/CViU6cUiCv9//zX8islwvoOzUK9soqHStFJOh5BC0iVkhEbUx6fqLq1R81lSmh9EjlhWJmYhb6nzfYnEENaftv8uV/9mup6tOD9GnF2+xWLWPC6d4mTV7gJoFXgIL3yEUISQJnlf9l0ltb4usDLGYF1wFmblobGRCJLIzDSukLoNumKoGdvrKU17WFSG2ZLhRkGGzhigu2OkqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMKn4OGv94VBQKVWp/sUuP+n//Cb46iktzh4cJUkWug=;
 b=IWQI8xrU6koEJtndrxOeFZfFflIvI3ZR7M9vWO284k3NRKjPG15N8eomE3DoObinmZo5jxAEK0oxu0FNt4fXF2Wrw4PxOtW8t6UO8VUxhf+yBvawC7F/Dr6QVMEO6Ji00fKyph30/vvAzcQ6pk9Mj5O2ad8yhRqwISdpSX+Ow8pt02utwQ6LSfR5Y+5QNSGll9bBM5FtfrhxGf+ToQYipQCx/Xng9RT1G03dpRMbyId18APtsdrqz9k7gVDCs2/wA+rE/GzKoFNfpeBpZNcHwTwS/Ox8juJ3FD+kQbWisJVfYPwbc8xNhk6h/hns/BOgsKkJ2vqu6Lsjkhkt27fMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DS4PR11MB789483.namprd11.prod.outlook.com (2603:10b6:8:514::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:27:50 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:27:49 +0000
Message-ID: <dae57c8a-7978-4d20-9cbc-f21ce4f7acdc@intel.com>
Date: Tue, 3 Nov 2026 11:57:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/xe/hw_error: Reuse CSC worker for generic
 error handling
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <tejas.upadhyay@intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-10-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261103060929.1586783-10-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::16) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DS4PR11MB789483:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd9dcfa-01b9-4c2c-82d7-08df39739510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SyNPvvFbR194nCTZojCtNI+hjEsAulQPTrr+J6DueYLaWrY+xb6/sB9hqnDzQrG0G8iV5pK+7DqJr6uZ4U2mnN1r7r5SZYhz3VClvkdjz5o6ZXU52LCOS9EdhsKPCNWFkg8v2SjBWrhNPbZWdzjdOuTjKjD14BFC8cKlU6S3njSm/DGsQwrFkfnOummsZSZD1PkAVKoj/Yg6E04qWGkpwPLOBByvrCJZmpSOZboERcJZn4OVFWTBDASScHc/wrGchK4EtuMVQMwEKVA/ewtTB4NRkC2xs/VH7tWdOqwk6133jI1L1+FzNzpbSNw4qjf8DI8mlE10aR3oZ/EP2YhP/i35h5QxsUQURU/2uzZ15CqeBsX5rcMLPr51GvN4DsGfAheLwCkvgOioXHGDPa+su9DtwCXjA8TSVsOU6WIadlyn7hLRHXNKNeo8qmQNaM2XMzEC+ZGstWoiLVcrueTu/fjWn0qFnWXGbsAf09l7qTeu3aCBNp7W7IAjrYI/OEGotXsiJ2ToS/XCcFKwN/HBGIknSV0YNFvu3oyfHUROjjXueXvM3b/nnXPsPLY6TGQvD4hsRM+NEx6UvWYlP+tVr61VbyWOqg76zvJltwN0mWpRw2pKZLWvD5VLTO+KDgrI+Np6E8YzJkYpJWLF6PG8FrKDA2/8V/bHZnqKhVTey8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026140227099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cklSaFl4dFpCZ2VQRGFDU05WeXFURnJMY1QvQU1MZFlDdlZHUncvS0Z2dGpm?=
 =?utf-8?B?NGsrVGZ3UFVOUUVsT2JsTHUrME1leGpUZjJRZkFPNkhxVHAva1V4NWdtVjA0?=
 =?utf-8?B?QVk0Y05YYUJ0ZWo0QW0wenpTeVF2NlFPSXFHR3J5bm14ZTg4MXA5bE02M00y?=
 =?utf-8?B?MjBBMlVmRmdNcnZOR280TjhpdWpoOGFBUUVjaWhQN05WZ1pDNVhwZ1NFOHJy?=
 =?utf-8?B?NFAwdng1clh6UFBpYWtLZzM2M3hOMlhpdmNMNHdNWXV6QWQzOFlsK0NiVitl?=
 =?utf-8?B?SE9oL3MvV0ViS0YwOFZ2M2Q3T3F1T0dpUkhGMndiVEVuU0xXanJSb1pYLzd2?=
 =?utf-8?B?WXVwMnVOUnpWczZwWDFGeG5pcjUzVlNTMHk2S0tLWUxCbVhCeTc5ZzZieitW?=
 =?utf-8?B?Uk00UldzN1RiWWdCZHRIQmNqa1l3SVdwdk5URWxyN0tGTks3dStCUjFYZVNh?=
 =?utf-8?B?ZzZXb0xiSjBsNmpsNUNFMkxIeGhHQmFlV0pvM1NodmNsYXllVVV4cC9DUGZS?=
 =?utf-8?B?T2p4bGxlTjQvU00rUTdoRmhCOUR5VUdWSS9ydzdTaDZ1Q3RLMnFxcXdXNmhh?=
 =?utf-8?B?UVZpSDR6SmpMV3U1WllpTmFsQnVIaWprWXNINGh5TVdZdy9yTzZsY2dLeWdK?=
 =?utf-8?B?MTlaZXBwR3M3TUJVdkthbGJWcVJmbHhGc1k2ZE1qbzZncUloSHZDWi8xR0lm?=
 =?utf-8?B?M2dZcEZCaWVlTDlGRjVzZHE5SXZVaTc4WGdxcU0wbVdRcWtHNWthNXZOeHhm?=
 =?utf-8?B?anBnc2YrWTZSMXFPT3ZyanBTN3BwWU04dWZZNU9zMnhJVXF1YzRsUmhiVktK?=
 =?utf-8?B?MHlhaTJYakdrYWtZYlNjVVpDUFlEbEt2NEVya0FwWDRuckVjOGJrb0s3OFJT?=
 =?utf-8?B?RmVTMHg4K0sxVmxrYm5YOFhtcCs4TFlCWXNJOFJqS2RkaTJnN1QrUkpZdmRZ?=
 =?utf-8?B?ZGg2aHVaZG9aVDF5dm9lUFVuTlhpM29zY1NCNFhLQUExZTBaNUprZ0g0WjVt?=
 =?utf-8?B?SzlrUjRHa0c4eWJJWFk5dk1kQzJhVVBCNXlWd0x0b3RwQVo1Q3dia0RXSjds?=
 =?utf-8?B?bFVBMG1Hb2dwZ2lGVmNuL2pKYTkyNERhbXAvVGMrYXJTYlNGM1IzMkd5MzBo?=
 =?utf-8?B?RGFheTN2ckdVcmx5NEdXNnMxM3hSNmh1TzY0a0hVdUIzWFBhNWRVb05JbjVa?=
 =?utf-8?B?cTJDTzhmL1hXU3oyZktMVERVOVBWNVVVZ3BuemppemZlNUdURnEvMmdhUkxH?=
 =?utf-8?B?N3BHRHNacTVZTXExaGFSZ2dsUWtIQ2VlcitKT0JXbUdwOUdCeGVMR1d4M3RD?=
 =?utf-8?B?VENiOW44VXNmM1ZMd3cvYWViZkp4UjRQVDJDelEwUWFUaElZOFdvVzgyM0J0?=
 =?utf-8?B?TGZlWXZudGpHOGRhM2duZHpBbzIzS2FHOVhsQitDaTlSdDRFOUNpRnZqcVg1?=
 =?utf-8?B?YmJGc2x6RldWT2dMNVVVMS9UT1NGQ29aeGEzM3lrQyszNjVLSVk5NHNXL2ls?=
 =?utf-8?B?YUtjMEpRcGc2enVFTDR5OXU2YVZtTjd4NVNnNUMwaXJyQTh2OTdvMDN0ODZP?=
 =?utf-8?B?bFB2MFdzdlVjOU01c2RRZ29lQi9PS0xGcDRIMkZCeWJhWnRJQUt5dk51Qldr?=
 =?utf-8?B?UTJydENxWkVVSVJreXlzUE01KytnN2Z5djhzd3Y2QlhUcnR5czk0UFpuRXhV?=
 =?utf-8?B?UDg2cTdEa1I3RTlBNEh3aU55bTFxRk9BMi9yVWRuNVp1eVJBdFZtWnFkWTl6?=
 =?utf-8?B?ekF4VG1yd2p6U0M5NGFRTkEyN1lPUStqZkUzczdHcXkwa1MvY2NrazI5bUpU?=
 =?utf-8?B?Rml1S2lHcjlnb1dkWXZYRUFmWDlvODdIU2FBRGIzcU5wczVwVU5VbE1RcE9P?=
 =?utf-8?B?bW53eGFMQmVSLzBreUYzend3UXpoM0JWbVQwTkFxODVZS0JuZ2c3TzB1WHpG?=
 =?utf-8?B?TS9YWUFKaWR0YjVRbTRIWUVzTHJyNjJiWXdNcW0zdEtjRDNyaC9kZkNPdTZF?=
 =?utf-8?B?bmpscjRLMzZsaEhvV3A2aWMzRkI5YjBaZG9OSEhlMkg5RkJLaVVEYk4wdkVk?=
 =?utf-8?B?T0hRWitZMWt4dUNYZlpUbDlqVkpqNFlzK3dHY3dzVEtFRE1Vb2M5MjFEcFNy?=
 =?utf-8?B?TWJSY1ZibXM2ekh2S05tckxTcllYWnhncUcyYWN3cnlvMkNjWlp4Vk50NTVS?=
 =?utf-8?B?aGxMcUUrbjlBTU1hZ2lYNlJvbDlXY2lwSWgxcVkxeDZ0UHVRaDh5aWxZUmEr?=
 =?utf-8?B?OFBSZytDaTRGc2I1Qk80dlE4eG5uVnlXVVl3dkNFRXoyWS9ZYXlsOW5BQ0ls?=
 =?utf-8?B?ZWcwNURuWkV2a0NmWm9VbnZmUTYyTVp3em1leEJHZ241R3RjVm1sMEVaWkZw?=
 =?utf-8?Q?HGuTHpQdEyr8qbn4=3D?=
X-Exchange-RoutingPolicyChecked: euOM/PI4qW3M8RftQSZdxOVesAJGt8M6Ry5GuITCksIy9Qtj5bbjyY3AfsY8MC/PGynjcM/zN7KutCX+p556z7QSod3ycfYskzqhUbx1ITFAfaY3Des6v5jYJwVKwV2KUluBSfrTyHG8YGP/mhdcJvsYr6Cvpf7bC9Mfabi+oUBd4PIHpRNXGTSnCC4a1l9qpOeIqN2XbAQyPBtcgnTWLMkGbjEmsng87NeoGS/MMGnMAnkBi9MxnevOa/oOW0kGIjtx2NDyyrWftKX2kadAeSQGKAzPie776gn+/Uxp/mLzRKZXe93lf68Wk6ls8DvxiKmRfygqLcUYuireAelOJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd9dcfa-01b9-4c2c-82d7-08df39739510
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:27:49.5752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GP9uGZGloeRjSzInc+vTWhmnkzjr3x6oAjmV8ntkFx0nIHtHinXWZ5CcBCDa8MGU6IHOWB65U6lH990lJXUxLkLtYY9wPVLtksJBoGLxODw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB789483
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 03-11-2026 11:39 am, Riana Tauro wrote:
> From: Raag Jadav <raag.jadav@intel.com>
>
> We have upcoming usecases which require defering work during error
> handling. Since we already have CSC worker in place, prepare it to
> be reused generically.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: Remove delayed work
> ---
>   drivers/gpu/drm/xe/xe_hw_error.c   | 10 +++++-----
>   drivers/gpu/drm/xe/xe_tile_types.h |  4 ++--
>   2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index ac720710c8e8..a934b649575c 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -166,9 +166,9 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static void csc_hw_error_work(struct work_struct *work)
> +static void hw_error_work(struct work_struct *work)
>   {
> -	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> +	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>   	struct xe_device *xe = tile_to_xe(tile);
>   
>   	guard(xe_pm_runtime)(xe);
> @@ -204,7 +204,7 @@ static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>   					     hec_uncorrected_fw_errors[err_bit], severity_str,
>   					     err_bit);
>   
> -			schedule_work(&tile->csc_hw_error_work);
> +			schedule_work(&tile->hw_error_work);
>   		}
>   	}
>   
> @@ -513,7 +513,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   	enum hardware_error hw_err;
>   
>   	if (xe_fault_csc_hw_error())
> -		schedule_work(&tile->csc_hw_error_work);
> +		schedule_work(&tile->hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
>   		if (master_ctl & ERROR_IRQ(hw_err))
> @@ -551,7 +551,7 @@ void xe_hw_error_init(struct xe_device *xe)
>   	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>   		return;
>   
> -	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
> +	INIT_WORK(&tile->hw_error_work, hw_error_work);
>   
>   	process_hw_errors(xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> index e1368c04846a..3dc011f111a4 100644
> --- a/drivers/gpu/drm/xe/xe_tile_types.h
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -118,8 +118,8 @@ struct xe_tile {
>   	/** @memirq: Memory Based Interrupts. */
>   	struct xe_memirq memirq;
>   
> -	/** @csc_hw_error_work: worker to report CSC HW errors */
> -	struct work_struct csc_hw_error_work;
> +	/** @hw_error_work: worker to handle HW errors */
> +	struct work_struct hw_error_work;
>   
>   	/** @pcode: tile's PCODE */
>   	struct {
