Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBEA606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 10:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XSRuaEES;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=O/rtPk6p
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320311128E2;
	Fri, 20 Nov 2026 10:50:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1CE1128E2
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 10:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795171806; x=1826707806;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=95ZuLGI/C8JPOOPC6SAqngoylZGvNgElsU6t5DNZEU4=;
 b=XSRuaEESwAPa2525u3VPLSoIBKd+GEdLzsw/5GlHLtoVf3pF9BFPFMUF
 OzVeW36c8du+B2m3gfAYJECymK/MeNCXwDZTfiJqmrEBNEuposdBrdPPX
 AD2W1YJLC5W8zHoR1M/DptedZ+ivM7by5Txm9V3S6Uqe+R/zYVMFxVLEz
 VCDuJ4vTYtI3YaaIbxXPtEsfVrMDexD0cZXRWZIkoEvd+jkIhfe+yyrRz
 c4FY+qsmG35vjlKMqFX2W/64f96fnbTU+BX6QMZ2MLaEaljhCd5UDCZqC
 IgwjvG2mNsH5uaT9wTVMaHnIvAAwS4IIp25Zyf7nt9UxE+WMH8DD69f51 w==;
X-CSE-ConnectionGUID: n6NNN5zSTCqObdpdGk2A6Q==
X-CSE-MsgGUID: otVAgORSTaCiAD6QCyPxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3932356"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3932356"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 02:50:01 -0800
X-CSE-ConnectionGUID: EwhQKJfeS02o07Itvvfiww==
X-CSE-MsgGUID: Wmkv7UJiRGKwSFQEHOCvbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10614434"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 02:50:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 02:49:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 02:49:59 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 02:49:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQKtwxZOChGFE4+/axqlpBIU2Fgtoea8ZPsKTxwvxXoXLSZ4vzQe/lRGSsVvOn3xk4GToVcEwAaaQv627uqt+VanKykSEWPnUAvj5ppUlnwFV+jz1x/ikyr7TFOteFtRwKyxDlUg/0cyahzCLxhfs4RH22i+8Gey6nAiJ+nOM5ApDjjLT1bwkUszCxwy69UchnLW2/vtAxHUdgNCnN3IH9MJcraSAWz0BThWTH4YRxoDB+3r0jrWKbIMc/ZqsJEZkwH0tbI1mkiB8hsU1P6jyddc3SOfPeG79x37Ad8/FGmZcYlZHc+nLEZhRRz/6BX6ZDwVgqMpFeEl1FAh8G9h0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZRo5VKDPZbje5kXZapG/gJ72Hh9Jt6dzCCDz3z93Yg=;
 b=cyjyTmjtTSWkRjwFVRa1RDMcJQh1r6ncI//rNwJj5VlAWfQirgMM/Ctj7WZmXPsbs/8rWMFRc/823aSt/yPgFetG5BolIWGIPonEg3DKc9eeCHh/pKf4n5tretqNAggStorl6g+GXi/FgrrYYXpqfwZVA0YPhfz1yEIwE7qqNhxWWAoDRUitJCljIbVjuvrrkALxqmA8+IPMaPEnhIEIIkQGQ+AtxcOreCseakd52zD319jf6I0o8k1cIQvc1jgLnZ//hhfccMaPSymqTrGIkul5R6bU2i9B6LFhvXUfbER+RfZsYxYeMUvIz+BdGm4tOiZS/kqGrBTnII+qBpJp5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZRo5VKDPZbje5kXZapG/gJ72Hh9Jt6dzCCDz3z93Yg=;
 b=O/rtPk6p+xyhPLXghCxb3d+JEdXGf9Ex48QFSuGsWNdFukHjLu/WFs2rm/HWlza+zb2ZDPnBpZhpl6iujuKosQW6RqbHrsFB429I2W1FfHs//+wuhh6W8J/qliuDOLCxia8IpyspY/G7vdvK7cDjPZmVoE0mXPQSljhEDYgHnU8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW4PR11MB6763.namprd11.prod.outlook.com
 (2603:10b6:303:20b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 10:49:56 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::3a:cd0a:2af8:5837%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 10:49:55 +0000
Message-ID: <f4a16f86-e56e-404c-9c54-8e080e95f909@intel.com>
Date: Fri, 20 Nov 2026 16:19:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe: Add a userptr repin timeout sysfs attribute
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-3-af2e327833a9@intel.com>
 <1cabb132-2535-4aa0-b887-43716509ed21@intel.com>
 <96526285-1b9a-43b7-9eff-37f36f9e6431@intel.com>
Content-Language: en-US
From: Himal prasad Ghimiray <himal.prasad.ghimiray@intel.com>
In-Reply-To: <96526285-1b9a-43b7-9eff-37f36f9e6431@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0303.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::14) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 338dfc31-d4d5-446e-d3a8-08df46f40362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|5023799004|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: qgTcATXpTdHi6SnqbxkHuLHo7+MJnLWKTn6SlSpiwYHpCsKVadA8ytxxjKlV5RPvHOMKpfvau+eVYt9yDw/ErhzbvKULoG8g8QQ81pkKX3HM1Rx1NmrGI0IFhBRdiEsz6RGEHt8LsujmflVJ91mdU8FoBxZA0agFGPl1x4mAHSeFzTpgRBU1e2QFx1o6DUld+TVHEnP4R3kIuFfGua5jW2wTEoYRzwxnKclemk0RcanAS7cZspcp7DtqbM1VSxYwaspoS/jXTYLJTJz7650fetGsLIFdC/Y59btEczZmPP770OLNCEnNF4sDj7hqRON0Ksb/U731rRM4bn2JD3QOUxivO9xmf70XLs4inL0XNSeVYJai6Q+tnPwSEKXV8/PCaVx4vTJPRuqyAhqy/CczkoFfPyCdXHRAFLXTF8tJvm60pNdMkIQIQouBkZ71y3CqSweM0NPqLWQnHKa5zT7Ez9z5T1kRQgytKNy8YjatNYF1+gs9RsVZnAgvDbF0VVrKhw6Ewdkgd2xSEj7O08BNP2J/SD3mqhMA2Wf/yg0J3t/TF6U+ft23XhnOdaN4uZbUG2yZWt+VcHC/WkHFVCnBwAvWT2RPfmcmS3dUHQG4teommMoLe0rOlFRSoHJZyuH85GhNRO/x61PpnrLeCMoNbZlVLDBngDb7mMdg8GlTa6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3Bsd2wyemhZZ2tWdXI0UzhPT1JrdjdLL3FMcFJSUlAxMy9BalJqNG5zVy8z?=
 =?utf-8?B?MkwzTkwwUE1PNVlJWUNwNXpqejRKcU1NUWJMdDFSb0dOb2xwZjJMaEQ0bTdu?=
 =?utf-8?B?MkZxRUlrS1dWMUlVd3JoVFVsMzlBTlVONmN1WEo1SEU3S1EzaVVYanpmTXpz?=
 =?utf-8?B?ZHdZK3YxNlBma0pwdHZrTWl1ditxUlNLNUphRFNFbTR3MVJLWmVrTWNNdlZy?=
 =?utf-8?B?RlhqZHFIVzFwVE8zUVhrNTRZY2YrWFpramZSUk8xRVdTaXFUZ2hTTHhBR1Ex?=
 =?utf-8?B?dGJiNFI4L242RDJCaTFjZ2p4RHp0clh0bmU1VlFTLzNwYzg3V3Jsa05Bbmp6?=
 =?utf-8?B?NUJqYXRZVmRtWVNTbTcvbjhTWVlWNVNua2RzdC9XS0hjdHNBS0hDdDhJYjVM?=
 =?utf-8?B?Z3lFRDVkNGVzNW91UWtRM25XNnNPUzVQV0Y3bUpkcEp5TnpiZ1hLYjRSYm12?=
 =?utf-8?B?L2JIbEZ0T0JWalB0d2p4L0tWYno1djl6dTFvWDBReVB4R1k0QXF1STUzQW9E?=
 =?utf-8?B?UXNsZDNPczZIcTJrR0U5QVZ6L2g3QlBQVDBYNmc1YURJTldqVEY1c2RGekhh?=
 =?utf-8?B?SkYyeGhrVXhkTVhCK1lIb1NMUDNNcXBCcWxjMk1GY1BneEtZa3dtSmtCcHBx?=
 =?utf-8?B?VERuMHZUaWZUcENDcmpMUEtsb1czRTg2dGEvL3BpZ3VobW9XRklCT2tTUFJs?=
 =?utf-8?B?anVibExOcGgzc2RXYmdaUHh6eG1hWmtOVGc3YllhYUxLUVVVbHd4SHdpS2Fx?=
 =?utf-8?B?VUdnSDZMVnc2T2drSjFmU3hZSkM0RlkwdFRpVk56akwrSHZibnRCWkg2U25j?=
 =?utf-8?B?R0lBV05FU01PUHhvMFJQcTQ3Y3c4WWNNWTRQRTl2TVVqT0pjSFJHVG56MmdD?=
 =?utf-8?B?bmNhVWpkTTV6YVJkRU9ZWHMyTWtIa2NaZGQxT0gxa2dQb3BycUp5bG9CL0s2?=
 =?utf-8?B?MFVzWFVJenArbzllM0RSb1o0c1huNDdkeDdabE9QTnRGcFYwWlJMMGw2RDBX?=
 =?utf-8?B?SDZEdTQ4dGljTkhCTlBzQ0dKbkx0cjBJS203OVlXMmM5NXBPN3JiNS9CMkMy?=
 =?utf-8?B?N3BpaUljZ3FuajJuUWE5c2d1cWc1TlpQQWdlMmptTXdpZS9Sd3hObFRKWURr?=
 =?utf-8?B?QkFWcExZNXd6QmFPOWdld2xTTlB1WG1WMWllMTBIM2Zvb05CNmFJaGIzNHps?=
 =?utf-8?B?U0Vha0pnVERTTEdxdSswaWYzYVh6Q2tpNUNNUUtlQ1lHYkZwMXBjNkFwREdE?=
 =?utf-8?B?TEtGTXRad2tjTXJYTXE5VGN4V1o1c1NEQlA5aUtXTm1aNjZQRUJubjJCNjFo?=
 =?utf-8?B?Y2Y5VUo5b0VkZys4TUMxdVFLTG5HM3RBeDVLVWVmUk5kS3Q2OWVrclB5Vk5Q?=
 =?utf-8?B?clRPT0RxbVhZT3pMU2xROTJFNU05K0V6V2w2aFBDOVFhdDNFRU5XbGQ5OStu?=
 =?utf-8?B?M2c0VGh6MklpMGkrYitEYlQwU1VVZlkrU1lON3o0cU5XZzVYSlVBOWNpU1Ay?=
 =?utf-8?B?SmsrYTlUY2VINzV0eVhJb3NQdFVrK09jMXI1TlJIZ0JEUU0xTURPdmwxS0ZY?=
 =?utf-8?B?dFkySTlVMVV3ajNiYWNwZW9hMGZWY2VVU2liNUwvOTZnVFY5SHIwNFRSalZq?=
 =?utf-8?B?R2xXdzNUamo0eEg4YjdiSUpTeFFiZ3dtNmYvOXlEOFZRZ2dmQ1B2b21ocndG?=
 =?utf-8?B?RXMrZG5GNit2VC9VWVFwdUhKa1lQVUwyQ1QzOWZjYS80SGJVbm5xN0ExTVZG?=
 =?utf-8?B?UjREMjFheHlJL0Q1dm04VjZsM2p5YWRDdTZXRzdZYXQ4UHhpaDVDeVBocUov?=
 =?utf-8?B?NjIyV2hTdDNwdnMvbXZINEhSSk96T25DUGNYRzFOeUhmNXFaTVZjRXFqYVVK?=
 =?utf-8?B?OThKd1U2WkEzcTI2VGxKc29rcUNCcWl6alExcjd0VWdrK1hvNWNvOTBUdXAz?=
 =?utf-8?B?ZFpPY0dIMG9qdkhoeGxlTGxPanZEYjgyKzFFaEV6N3djVE5tTUg3SE9aNzI4?=
 =?utf-8?B?aTNGU2s4TytzOWd4OHdOZ21uUVpSSnZTYURzbDNpL1dWbDNTeXNaUWlmb2Q0?=
 =?utf-8?B?b3ZjdzBhaUNUZHptNG9OYm5OVTEyRVhzMklCdGRyVzdsMWdKeEh4OS9yK1RL?=
 =?utf-8?B?TU5sdjJqTENtcTgzUlh2RDFyMnYwUHJmdnV2cWVRZDdPbkpwYVQ5eTZ3K0hX?=
 =?utf-8?B?azNzb3N3dU52RS9CRkh4QTFxTmFLcVBKUjkxcldJVlJScjRUNnBGODRPV205?=
 =?utf-8?B?c0xyWEVIZDE3R2tKZ2l6MEZwdXBvTGpGeHZnN3FoV1NzUENYc0dTODN3QzQz?=
 =?utf-8?B?YUVnU1g1ZXJrM053Q0FkN2kvVEJBeG40eXZnKytJd0VKZnhzdkN5V2UrR0pF?=
 =?utf-8?Q?qltn+Xq/kPkChEiM=3D?=
X-Exchange-RoutingPolicyChecked: KL+R/db+6NSXqeOwCog364S5g+M6Dj3hTZG7Ba+UA+6tphBq9Jvb6mdtenokbYXZ4+bCOKukz7ekC3CXGXqWnZqXfw7PkT8wpj9Z99RdEdMQF4dLa2OMheCVpqrPAlXkrX+3nqRg/KBX6Y3zcC4l0i+jG9oBxNSJ2B8TGuA8wzVcmO2VX+A/QB0fXZowZUC7WP6kJmHBjvc3HpR6NbXDy8P5MQtbRok9cq9Nc9dTXtT+7kCmnIpD2i4D6AOGHf2VCWhlF5j4Ldohn3EwlS0gOYxOVkxbyL44554H9mrqq/YlIOP5hyV/LtiVCnWZLGMLsQ5effGZ+KpauQ4cUNuRvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 338dfc31-d4d5-446e-d3a8-08df46f40362
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:49:55.5281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JK6c6KXbtkC1Q1nhoUNwk6sq5e/zQWvZ5ODp17u/NUPfL0D1UWY5iu8wv2PsNmeiuSxxRzcz1jUqbEFaxRMYB65iPqx+e+jxwTwSOySIis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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


On 20-11-2026 16:13, Matthew Auld wrote:
> On 19/11/2026 16:38, Himal prasad Ghimiray wrote:
>>
>> On 19-11-2026 16:44, Matthew Auld wrote:
>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>
>>> Add a per-device sysfs attribute, userptr_repin_timeout_ms, to be used
>>> to bound the overall time a userptr repin is retried when the CPU
>>> mappings keep changing during the repin. The default is 100000 ms and
>>> zero means retry indefinitely. The value can be changed at any time and
>>> is read each time the timeout is checked.
>>>
>>> v2 (Matt):
>>> - Reject values above INT_MAX (or reaching MAX_JIFFY_OFFSET) with
>>>    -EINVAL in userptr_repin_timeout_ms_store() so msecs_to_jiffies() 
>>> does
>>>    not treat them as an infinite timeout.
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device.c       |  2 ++
>>>   drivers/gpu/drm/xe/xe_device.h       |  2 ++
>>>   drivers/gpu/drm/xe/xe_device_sysfs.c | 56 
>>> ++++++++++++++++++++++++++ ++++++++++
>>>   drivers/gpu/drm/xe/xe_device_types.h |  8 ++++++
>>>   4 files changed, 68 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>>> xe_device.c
>>> index 616e02066ae6..4e54a1b7fc51 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -437,6 +437,8 @@ struct xe_device *xe_device_create(struct 
>>> pci_dev *pdev)
>>>       if (err)
>>>           return ERR_PTR(err);
>>> +    xe->userptr_repin_timeout_ms = 
>>> XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT;
>>> +
>>>       return xe;
>>>   }
>>>   ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See 
>>> xe_pci_probe() */
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/ 
>>> xe_device.h
>>> index 7a7632e2d56b..128fe51bede7 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -43,6 +43,8 @@ static inline struct xe_device 
>>> *ttm_to_xe_device(struct ttm_device *ttm)
>>>       return container_of(ttm, struct xe_device, ttm);
>>>   }
>>> +#define XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT    100000h
>>
>> Isn't the default too high, if device is connected to no numa node 
>> host ?
>
> We could lower this to 30s? That should still be more than enough, I 
> would hope. Also, maybe we can have two different timeouts for NUMA vs 
> non-NUMA?


I am aligned on different timeouts for NUMA vs non-NUMA.


>
> So what about:
>
> #define XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT             10000
> #define XE_USERPTR_REPIN_TIMEOUT_MS_NUMA_DEFAULT        30000
>
> And then:
>
> xe->userptr_repin_timeout_ms = num_online_nodes() > 1 ?
>      XE_USERPTR_REPIN_TIMEOUT_MS_NUMA_DEFAULT :
>      XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT;


+1


>
>>
>>> +
>>>   struct xe_device *xe_device_create(struct pci_dev *pdev);
>>>   int xe_device_init_early(struct xe_device *xe);
>>>   int xe_device_probe_early(struct xe_device *xe);
>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/ 
>>> xe/xe_device_sysfs.c
>>> index ff5d25dd867c..52111b4458f4 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>> @@ -4,7 +4,9 @@
>>>    */
>>>   #include <linux/device.h>
>>> +#include <linux/jiffies.h>
>>>   #include <linux/kobject.h>
>>> +#include <linux/limits.h>
>>>   #include <linux/pci.h>
>>>   #include <linux/sysfs.h>
>>> @@ -38,6 +40,15 @@
>>>    * reclaimed by the shrinker. Higher values reduce reclaim 
>>> pressure on
>>>    * non-purgeable buffer objects. Valid values are 1 to 64. 
>>> Defaults to
>>>    * CONFIG_DRM_XE_SHRINKER_NON_PURGEABLE_SEEKS.
>>> + *
>>> + * userptr_repin_timeout_ms - Report/change the overall time, in
>>> + * milliseconds, a userptr repin is retried, with all locks dropped 
>>> between
>>> + * the attempts, when the CPU mappings keep changing during the 
>>> repin. The
>>> + * time is measured from the first repin attempt after an 
>>> invalidation. When
>>> + * it expires the repin fails with -EBUSY. Zero means retry 
>>> indefinitely.
>>> + * Valid values are 0 to INT_MAX (capped by MAX_JIFFY_OFFSET). The 
>>> value is
>>> + * read each time the timeout is checked, so a change takes effect
>>> + * immediately. Defaults to 100000.
>>>    */
>>>   static ssize_t
>>> @@ -340,6 +351,47 @@ static const struct attribute_group 
>>> shrinker_attr_group = {
>>>       .attrs = shrinker_attrs,
>>>   };
>>> +static ssize_t
>>> +userptr_repin_timeout_ms_show(struct device *dev,
>>> +                  struct device_attribute *attr, char *buf)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>>> +
>>> +    return sysfs_emit(buf, "%u\n", READ_ONCE(xe- 
>>> >userptr_repin_timeout_ms));
>>> +}
>>> +
>>> +static ssize_t
>>> +userptr_repin_timeout_ms_store(struct device *dev,
>>> +                   struct device_attribute *attr,
>>> +                   const char *buf, size_t count)
>>> +{
>>> +    struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>>> +    u32 val;
>>> +    int ret;
>>> +
>>> +    ret = kstrtou32(buf, 0, &val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    if (val > INT_MAX || msecs_to_jiffies(val) >= MAX_JIFFY_OFFSET)
>>> +        return -EINVAL;
>>> +
>>> +    WRITE_ONCE(xe->userptr_repin_timeout_ms, val);
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR_RW(userptr_repin_timeout_ms);
>>> +
>>> +static struct attribute *userptr_attrs[] = {
>>> +    &dev_attr_userptr_repin_timeout_ms.attr,
>>> +    NULL
>>> +};
>>> +
>>> +static const struct attribute_group userptr_attr_group = {
>>> +    .attrs = userptr_attrs,
>>> +};
>>> +
>>>   int xe_device_sysfs_init(struct xe_device *xe)
>>>   {
>>>       struct device *dev = xe->drm.dev;
>>> @@ -349,6 +401,10 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>>       if (ret)
>>>           return ret;
>>> +    ret = devm_device_add_group(dev, &userptr_attr_group);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>       if (xe->d3cold.capable) {
>>>           ret = devm_device_add_group(dev, &vram_attr_group);
>>>           if (ret)
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>>> xe/xe_device_types.h
>>> index 8f2a31949073..fc80cd2c766e 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -437,6 +437,14 @@ struct xe_device {
>>>           u16 idx[__XE_CACHE_LEVEL_COUNT];
>>>       } pat;
>>> +    /**
>>> +     * @userptr_repin_timeout_ms: Overall time in milliseconds a 
>>> userptr
>>> +     * repin is retried before failing with -EBUSY. Zero means retry
>>> +     * indefinitely. Accessed with READ_ONCE() / WRITE_ONCE() and 
>>> tunable
>>> +     * through sysfs.
>>> +     */
>>> +    u32 userptr_repin_timeout_ms;
>>> +
>>>       /** @d3cold: Encapsulate d3cold related stuff */
>>>       struct {
>>>           /** @d3cold.capable: Indicates if root port is d3cold 
>>> capable */
>>>
>
