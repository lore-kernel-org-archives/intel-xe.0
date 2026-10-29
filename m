Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED0E606A31F
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Smp2X5+4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C02710E77D;
	Thu, 29 Oct 2026 06:15:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B441510E77D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 06:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793254505; x=1824790505;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DHKxDMNga1koWM550S/2bUqWzQx3Mdz5bR8u1KcAKek=;
 b=Smp2X5+45Oy47E53R13Nxl1cqALbwsWLUuB9PYeAJSeQfLRBY+WXx7NG
 wK4fjeArVsrqDD8Nrj0xlrARJ/5tJFoM2QYwfND3AVFl+IGZuBNZMvjth
 keiTRoUDHDhJZqHjcZKgaVz7Xebh2LqOGsCEGulD3IGjBQzcFAVrbVMI/
 TJrlSJBalenNmEbI7eC5MFOLnnUibdbtIMAOnNths/58JQ9yI2oEUDro6
 xnwTJHx1zc/Cl6pK7dOPDkuPLq+EIjYdHwsfXrE8EMsumpvAEiBBuxpFy
 /DGMFJzqbwcKtgPNbcC3ZzTgey+2LLWF6zuXi/9R6WQ1yD6UL9+xOp10J Q==;
X-CSE-ConnectionGUID: xVHrznxSQw2g8i05mIg7AA==
X-CSE-MsgGUID: tKaF5lMVRVuGujCdZyyr/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1885141"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1885141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:15:05 -0700
X-CSE-ConnectionGUID: DjtyVixXQ4GPE6SkopUxpQ==
X-CSE-MsgGUID: XhXpzRmEQ6++Fg3il2/gBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5138131"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 23:15:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:15:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 23:15:05 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 23:15:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFgSVF1pR72eWuGW3SBP1YXmqP651chMHISd4Tgh0aVychjGfl/c3gNIRchXNeJFydPwCs5p/K3OJu02o8Yw3IYJ0mEiyeV+hunfkD909nWU/QRbTKhbDLlu0qX9zrER7eScKi3gUus66PyIBWwCOVxNdBWGzIaiLxEAFEXyV+J89yYrNkN+i07s8ib893cie058kYdiszTwzYAuwo3Y5XPuJFZTIPiCwpHIp45AIz3QKv3jA5W+yQNQKdEM6x9SRGzNqT4ZFKPyzzO4KKURkSHwdwXXRFyvDdPqEEKu5lb5bS8d6oXQ1AFD2cSCib9E+quaRJ3CAa9LWPClJ5hJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMQSMiqEGqDuyvK4kHA6z2eq7zN+zl106noJUmiQwNA=;
 b=uDUMsjF5t4AVe5Xcf3C1Tkl6cj1SU89I32ld/xOgaAD4iFY5TQ8A6zn9+uQFYPozn80WevZjjBpp7A1xnxgisq/8/PNAtLiMDtxfL7q4N8vvBA/wlZXl3NypnfR4h3GxtYNCTi0SwYZqpSrPFozLqp2mxNUjAB4moB0tH6JcxUgEWKbPCnVQwSAGnluI3Nii+FjYTbY9or6A7LlyirdZ78FjVtjrKnj5m46rmp0sY8WJLXUxCtSsaSoaid5IGTVKgz4Oxc2t7N67zFTDNSixhz2sfUT5tLrjP9AN3Vq8s7rW6BZ1LHKFh99sTQlB/RHFJnVasUAzwASW0K0qGCYCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Thu, 29 Oct 2026 06:15:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 06:15:03 +0000
Message-ID: <d535ae06-4646-4765-a5b7-7def7cfbda7b@intel.com>
Date: Thu, 29 Oct 2026 11:44:53 +0530
User-Agent: Mozilla Thunderbird
From: "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH v11 08/10] drm/xe: Introduce temporary device wedging
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <michal.winiarski@intel.com>,
 <matthew.auld@intel.com>, <dev@lankhorst.se>, <jani.nikula@intel.com>,
 <lukasz.laguna@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20261026050735.566613-1-raag.jadav@intel.com>
 <20261026050735.566613-9-raag.jadav@intel.com>
Content-Language: en-US
In-Reply-To: <20261026050735.566613-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0307.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fd9314-a51a-4ae5-84aa-08df3583f81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|261009223327099003|261009220027099003|261009223027099003|261022075727099003|261009221227099003|261021121427099003|261009221727099003|261021123027099003|261022105027099003|10067099003|56012099006|261026140227099003|261028144727099003|22082099003|18002099003|261026121527099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: oJ6BGTcxw6iEs554FJdA4H128oPEJ9pV5JTP6XB2jRyrn1OuaB2ONqWe4RmmbtxMwSjIHfil+PF78zGYQ2QpwvIWLQN6chJPmL0hCb+FurPZvEvXDrQzQ+xZjB3G+wRPFRdHqR1B+WBIx9WvKwSYVOc9AzUFay3NIp1OCLB7qdCSVtp0Wlv4aLkHyVySPhEyXAZDssUeFtbh9dh1Azsqydl8UWHBdZY5ePSr7tlxmczZpTjI/Spc3+vp/07KjzpihGy6g4RE1dUfo+6H3IcVvZIbNZdHomxNwiE4Br1XI9c6JsS1rI33LacKsw71itxcJBIsPQEPgOPQG6a+PrZATmhIbH+ffnc5qvUvvUM/3u4nCaJBjFi1eAvcLI0juft+zfOnNEEuh3a2IzShi5raL49LoNfZ47WERmpFVqLfuN5KZcVA+oK3uqEV3MqN+kGJEEyrMvMN1eSRCYMqYS7/pjGvzwvAwWiFGqCRcMiyozGcjW3WKnzvyR7kRb+iGlxcPitt8nfDYj8sMSiU/54G/dy79q6Kn11AddgkAnm923XHdeszsW0H/gtiGCYDtsEwrOWklNSz8qJqt0ufVmClTUMcbJS5/u63RUg7BlRlSATxDSHOZNfZa4hr1mZee6G/a3AB5AiJwWQbnHBCJPeNGLbXE+fvjcy3T4HUPDeVxG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261009223327099003)(261009220027099003)(261009223027099003)(261022075727099003)(261009221227099003)(261021121427099003)(261009221727099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(261026121527099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZ0Rm9wRVR3RDczV2NoOTNvRllRbzM3K3dmd2NaSHhJM2locjM0d1VSaXQ4?=
 =?utf-8?B?Ri9kZUdFZHhXc2l1YXdXdFQzNEx0dHY5S0YyYkV6OWN4WnN3Z1I4d2EweFIz?=
 =?utf-8?B?TE91djE1QjJybFRuM1Z4aEZLSTBVbG9iVThNNks3emVWSUJFNEVzOGFydkJz?=
 =?utf-8?B?ZmNYS0VPODN4c1J4YnhKOXltOFJ3V2ZSSVJ1azhHeEloeHBucVI4ZkxYSXA3?=
 =?utf-8?B?WktVeC9ORVBIOXZDMWFob2hacDFxOWhCQ0laUlZlOUNqOUVDb0lCTTVYSnh2?=
 =?utf-8?B?cmMwVEM5QVVRS2JsYjJnTENHcFZXcm5VTHUwVi9McFo0RUtvRUNqWkU2ZFc3?=
 =?utf-8?B?RG1ONmFQM1VyQVZnTlcxQ1U5cXFiWEtQU1hZWFN5VFVrR1dTVk5zdFVPajZo?=
 =?utf-8?B?QTk4NzRCWHptUFBicFZmY1duR3g3NXFBZDJmeE1USFl4YWdqM0luUnB3bXB6?=
 =?utf-8?B?TzJ3dXN5bDBpSkdJUkNodDIzT0paVlNZaElhVCtnQmF4WFpRd282OVYzYTNE?=
 =?utf-8?B?VEhUWmxXK3hXb3l4NTRmK0xmSC9CeGpyYWxqQlFrdlk0VjR1MlFaVUE3QUto?=
 =?utf-8?B?RWxrQitsOHBCbGxLb2pXYXZnbXFCS0R2UUc4TCtyUmdwcjFIK2c5UUc1S0ta?=
 =?utf-8?B?LzF0UllwM0hMenFZeTVSTmdsVlI0MktETnhNZyt6Q1gvaXJGN2VZL0UzVVIx?=
 =?utf-8?B?Uk9jcDV5cXNxK0U0aXY1KzhJaTVpSzhGUHErcHVaYkxmdkNOU1JwNENHTnZQ?=
 =?utf-8?B?eENQclo0Z3JCVTVSSTg4RWZ3WG9PaDJqclhNbm9iTjVsTmRZQzVWamNCaGVD?=
 =?utf-8?B?Z2p0b2NTM1dZRGtzemdkVUJETzFjTzkzR2V0dS9BVDJjRWtDRnJnRW80c2Rz?=
 =?utf-8?B?Qk0wckV0cnNoc081akt5dGFxbUZRNWVNMUN2SS8ydHFmOTVTbTZSMENTOXc5?=
 =?utf-8?B?UWVtY0Rkazd1SVoxMGdzQjBvc1hBS2tha0NadlJza1dvVFJSMis5K2UxMUYz?=
 =?utf-8?B?bGx5UXpyMlp0a1ViVko3Q1lBTzdDYzdWa215K1ZDR2NpZEJiYnB4T1V0SWZQ?=
 =?utf-8?B?Ny9NU1B5VXQxTFJWTEFkWHU4L0p0OFRGNkxsR0cxUEp6c01QN01XTGRxZndS?=
 =?utf-8?B?QlFydS9JbkJ5RnBrQ3NvdUIzN3hCczNXUUxMNkJ6d2tMYUFnZE44Qnd0NjdJ?=
 =?utf-8?B?azRIZVpoMktwWXVUbG9iZ1lvdUNFZUtYWGlTZXVKSWZRZm91eDl4QVYyeVlK?=
 =?utf-8?B?K1dzNmN4Qko5TUkyWnM4MWFFZ0g3d3NtcDhLREhidnFldzl0aEwxamN3S1ZP?=
 =?utf-8?B?NGlzUDRKSnd1bEh4VU92WHBXR1V6RFRySjI3Y05YRkdJVVA5Z240bnRTN0pF?=
 =?utf-8?B?bFp5eGJocGh1WXZMem5ZZU1KdHVndHkwaEErcWkvekM4WEY5cTNkOXBUTFpJ?=
 =?utf-8?B?R1JMLzBmZ1Y2NHJ2a0x2enZTeEtjNDU3cmhUY0pMMFV5K0V1L0Z6WTVPSWxS?=
 =?utf-8?B?Rkd1TGVpdGlDSldDcEgrbGRmVmpnclFzaEd3TW9qZU13a2Vuc3JrN0tVcito?=
 =?utf-8?B?aXE2V2Mwc3ZUdXZ1UkpUeWcxb1RkOXl6aFJRL3FadW5qK1BDYzNHaEltR0Fo?=
 =?utf-8?B?L09YYldROHhXS1JEaXE5VzJIbzBuWkJNQlBLMU9MMC96N0hDYW96NU5TdlNi?=
 =?utf-8?B?dUxmQkN4b2dWWWxCTWlmend6RENHS1dTOHZqaGxVT21mRWFROHFaUG1CTFhH?=
 =?utf-8?B?K2EzNEZSZ3NSalY3aWxsUy9BRWdwSzg0RkNCd3pZMHVzL2laZ2d4SmpoZkh6?=
 =?utf-8?B?MWpKeGFmVXdWdUJqenRNZEhDVUphOFZKUXZLN2M3dGdTTFhSWjA5ZUgxV0hV?=
 =?utf-8?B?bkJQdlkxL0h0Si8yWmEwMkhxVHZzVHZLRkdMaFZ1ZU1XY1JVSUlKTG1LTEFE?=
 =?utf-8?B?SkN3Qkx5S3VZcGpwRGtpQjZlazhlODRuSzErcE5qNFlUaTVEY0Q2L2d1RGdr?=
 =?utf-8?B?YXRkV2RUZHBqQUliUjJOeGVKNHhkWklmdHplVUkvdzRLemlLNFlBYUhFUk5I?=
 =?utf-8?B?L2grUUQrV0dpdWdGaXVzR085d0NUZWVuMUREZGdBSWFrVWJtZHBpYWFXN0pa?=
 =?utf-8?B?cHI4Uk1hWTdubnJBamF3Z1RQZFRvWW12Y2lqL0pPRWkvYm9FQThPTzRoZnQ5?=
 =?utf-8?B?Ly92UW5ZSERodG9pT2g2M3RHTjUvaTk3bjB0b0lmYnNTVFVJbjBkV2JxOVkr?=
 =?utf-8?B?NTZmUjMwcGJiV1BJYmtzQW9ycW92TXZhNmlvRzY3aHpTOUR1WWhiT3BMSVZH?=
 =?utf-8?B?VXZoS1RFQXJRY2RPQ2IzWVhSSGNrcHBqR25DV1pQbDY2c2MxMy95Zz09?=
X-Exchange-RoutingPolicyChecked: LIWI5z5h3Skd5+vkKxmV1kurainptWFv/lPiSJTqhetqh1LdcsAq7pfNRwlXHeNe2SDCkHaP7t2c+xJHQFtHOEj9M1pWtlS9yGInpxdFULUdGImYqOVnuBbflHyg9M2udnftIMBOwI4nO1qqBieK7E5FezfVo5jmTYoVEzRAPozXzoPfZGvNRnFUv6ZqHFwpxf5lHVgp6XoGuUKeb4EcPc24cGgCOXNqdVZHkBICHsCmPPI1gA7LExUkjqTb8x807/54oZOqzQbZfe1zYmVfnUAZLgtlZrRzQe29aaX1b4BnnvdJUpt6N68DKP3s2W9V+a/o3aiD+QmEJnBDnOCRzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fd9314-a51a-4ae5-84aa-08df3583f81b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 06:15:03.1038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1Be/1wd0EU82rZXyEZJelqO0umHNY4nATzpxhvF++OgHZHbn8YHHmdYOtKmhm2llbhiwZ5O4mGl5ZdTZRuX3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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


On 26-10-2026 10:36, Raag Jadav wrote:
> Currently, wedged state is serving a single usecase where the device is
> permanently declared wedged, but this doesn't allow any wedged state
> management for runtime usecases. In preparation of usecases which require
> to facilitate temporary device wedging, convert wedged.flag to wedged.ref
> which serves as a driver internal refcount for wedged state and blocks
> critical path execution during device lifetime. While at it, introduce
> wedged.perm which signifies permanent device wedging and operates
> independent of the refcount allowing relevant cleanup action on unwind
> path.
>
> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
> ---
>   v9: Redesign to prevent races (Sashiko)
> v10: Spell out temporary device wedging in subject (Lukasz)
> v11: Update GuC CT path to check against permanent wedging (Lukasz, Riana)
>       Put wedge reference only if device is wedged during resume() (Riana)
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c      |  6 +--
>   drivers/gpu/drm/xe/xe_pci.c         |  2 +
>   drivers/gpu/drm/xe/xe_pci_error.c   | 18 +++++++--
>   drivers/gpu/drm/xe/xe_wedge.c       | 58 +++++++++++++++++++++++++++--
>   drivers/gpu/drm/xe/xe_wedge.h       |  5 ++-
>   drivers/gpu/drm/xe/xe_wedge_types.h | 13 ++++++-
>   6 files changed, 88 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d42f0133c1eb..152fccf8f6f1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1162,7 +1162,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>   	xe_gt_assert(gt, g2h_len || !num_g2h);
>   	lockdep_assert_held(&ct->lock);
>   
> -	if (xe_wedged(ct_to_xe(ct))) {
> +	if (xe_wedge_not_recoverable(ct_to_xe(ct))) {
>   		ret = -ENOTRECOVERABLE;
>   		goto out;
>   	}
> @@ -1591,7 +1591,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   	if (g2h_fence.fail) {
>   		if (g2h_fence.cancel) {
>   			xe_gt_dbg(gt, "H2G request %#x canceled!\n", action[0]);
> -			ret = xe_wedged(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
> +			ret = xe_wedge_not_recoverable(ct_to_xe(ct)) ? -ENOTRECOVERABLE : -ECANCELED;
>   			goto unlock;
>   		}
>   		xe_gt_err(gt, "H2G request %#x failed: error %#x hint %#x\n",
> @@ -1936,7 +1936,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>   	lockdep_assert_held(&ct->fast_lock);
>   
>   	/* Keep in sync with g2h_err_is_fatal() */
> -	if (xe_wedged(xe))
> +	if (xe_wedge_not_recoverable(xe))
>   		return -ENOTRECOVERABLE;
>   
>   	if (ct->state == XE_GUC_CT_STATE_DISABLED)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 605c452a9c33..531d38bcfd1c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -39,6 +39,7 @@
>   #include "xe_survivability_mode.h"
>   #include "xe_tile.h"
>   #include "xe_tile_printk.h"
> +#include "xe_wedge.h"
>   
>   enum toggle_d3cold {
>   	D3COLD_DISABLE,
> @@ -1400,6 +1401,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   	 */
>   	xe_assert(xe, !IS_SRIOV_VF(xe));
>   	xe_assert(xe, !pci_num_vf(pdev));
> +	xe_assert(xe, !xe_wedged(xe));
>   
>   	err = xe_pm_runtime_suspend(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 9bf0da3a3d15..cdd0af4ec139 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -26,8 +26,7 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>   	 * xe_wedge_fini() releases runtime pm if wedged flag is set, so acquire a runtime
>   	 * pm reference to avoid underflow.
>   	 */
> -	if (!atomic_xchg(&xe->wedged.flag, 1))
> -		xe_pm_runtime_get_noresume(xe);
> +	xe_wedge_get(xe);
>   
>   	xe_device_set_in_reset(xe);
>   
> @@ -41,10 +40,16 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
>   
>   static pci_ers_result_t ras_action_to_pci_result(struct pci_dev *pdev, u8 action)
>   {
> +	struct xe_device *xe = xe_any_to_xe(pdev);
> +
>   	switch (action) {
>   	case XE_RAS_RECOVERY_ACTION_RECOVERED:
>   		return PCI_ERS_RESULT_RECOVERED;
>   	case XE_RAS_RECOVERY_ACTION_RESET:
> +		/* We should not be doing such ugly hacks, reuse FLR callbacks and drop this. */
> +		if (atomic_xchg(&xe->wedged.perm, 1))
> +			return PCI_ERS_RESULT_DISCONNECT;
> +
>   		prepare_device_for_reset(pdev);
>   		return PCI_ERS_RESULT_NEED_RESET;
>   	case XE_RAS_RECOVERY_ACTION_DISCONNECT:
> @@ -71,6 +76,10 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>   	case pci_channel_io_normal:
>   		return PCI_ERS_RESULT_CAN_RECOVER;
>   	case pci_channel_io_frozen:
> +		/* We should not be doing such ugly hacks, reuse FLR callbacks and drop this. */
> +		if (atomic_xchg(&xe->wedged.perm, 1))
> +			return PCI_ERS_RESULT_DISCONNECT;
> +
>   		prepare_device_for_reset(pdev);
>   		return PCI_ERS_RESULT_NEED_RESET;
>   	default:
> @@ -129,7 +138,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>   	xe = pdev_to_xe_device(pdev);
>   
>   	/* Wedge the device to prevent I/O operations till the resume callback */
> -	atomic_set(&xe->wedged.flag, 1);
> +	xe_wedge_get(xe);
>   
>   	return PCI_ERS_RESULT_RECOVERED;
>   }
> @@ -140,7 +149,8 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>   
>   	xe_info(xe, "PCI error: resume\n");
>   
> -	atomic_set(&xe->wedged.flag, 0);
> +	if (xe_wedged(xe))
> +		xe_wedge_put(xe);
>   }
>   
>   const struct pci_error_handlers xe_pci_error_handlers = {
> diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
> index 2f35937c5e66..49fd9251448b 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.c
> +++ b/drivers/gpu/drm/xe/xe_wedge.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   
> +#include "xe_assert.h"
>   #include "xe_defaults.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> @@ -55,6 +56,53 @@
>    *   firmware and restore device to normal operation.
>    */
>   
> +/**
> + * xe_wedge_get() - Acquire wedge reference
> + * @xe: xe device instance
> + *
> + * Get runtime PM reference and block critical path execution.

Add a documentation that this is temporary should not be used unless 
required to temporarily block
userspace access like resets.

Shouldn't runtime pm be associated with permanent wedging instead of 
temporary?

> + */
> +void xe_wedge_get(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	/* We should not be runtime suspending as long as critical paths are blocked */
> +	xe_pm_runtime_get_noresume(xe);
> +
> +	ref = atomic_inc_return(&xe->wedged.ref);
> +	xe_assert(xe, ref > 0);
> +}
> +
> +/**
> + * xe_wedge_put() - Relinquish wedge reference
> + * @xe: xe device instance
> + *
> + * Restore critical path execution and put runtime PM reference.
> + */
> +void xe_wedge_put(struct xe_device *xe)
> +{
> +	int ref;
> +
> +	ref = atomic_dec_return(&xe->wedged.ref);
> +	xe_assert(xe, ref >= 0);
> +
> +	xe_pm_runtime_put(xe);
> +}
> +
> +/**
> + * xe_wedge_not_recoverable() - Check for unrecoverable device
> + * @xe: xe device instance
> + *
> + * Do not abuse this. Use xe_wedged() instead where possible. Only
> + * use this as a last resort where xe_wedged() is problematic.
> + *
> + * Returns: %true if device is unrecoverable, %false otherwise.
> + */
> +bool xe_wedge_not_recoverable(struct xe_device *xe)

xe_wedged_permanent?

Thanks
Riana

> +{
> +	return atomic_read(&xe->wedged.perm);
> +}
> +
>   static void wedge_work(struct work_struct *work)
>   {
>   	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> @@ -97,11 +145,11 @@ void xe_wedge_declare(struct xe_device *xe, unsigned long method)
>   		return;
>   	}
>   
> -	if (atomic_xchg(&xe->wedged.flag, 1))
> +	if (atomic_xchg(&xe->wedged.perm, 1))
>   		return;
>   
> +	xe_wedge_get(xe);
>   	xe->needs_flr_on_fini = true;
> -	xe_pm_runtime_get_noresume(xe);
>   
>   	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
>   	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
> @@ -239,8 +287,10 @@ static void xe_wedge_fini(struct drm_device *drm, void *arg)
>   
>   	disable_work_sync(&xe->wedged.work);
>   
> -	if (atomic_read(&xe->wedged.flag))
> -		xe_pm_runtime_put(xe);
> +	if (atomic_read(&xe->wedged.perm))
> +		xe_wedge_put(xe);
> +
> +	xe_assert(xe, !xe_wedged(xe));
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
> index 3b5499dfc30d..28f43295948e 100644
> --- a/drivers/gpu/drm/xe/xe_wedge.h
> +++ b/drivers/gpu/drm/xe/xe_wedge.h
> @@ -14,11 +14,14 @@
>   
>   static inline bool xe_wedged(struct xe_device *xe)
>   {
> -	return atomic_read(&xe->wedged.flag);
> +	return atomic_read(&xe->wedged.ref);
>   }
>   
>   void xe_wedge_declare(struct xe_device *xe, unsigned long method);
>   int xe_wedge_init(struct xe_device *xe);
>   int xe_wedge_set_mode(struct xe_device *xe, enum xe_wedged_mode mode);
> +void xe_wedge_get(struct xe_device *xe);
> +void xe_wedge_put(struct xe_device *xe);
> +bool xe_wedge_not_recoverable(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_wedge_types.h b/drivers/gpu/drm/xe/xe_wedge_types.h
> index e472c5fcbd26..8e87290444dd 100644
> --- a/drivers/gpu/drm/xe/xe_wedge_types.h
> +++ b/drivers/gpu/drm/xe/xe_wedge_types.h
> @@ -29,8 +29,17 @@ enum xe_wedged_mode {
>    * struct xe_wedge - Struct to control Wedged States and mode
>    */
>   struct xe_wedge {
> -	/** @flag: Xe device faced a critical error and is now blocked. */
> -	atomic_t flag;
> +	/**
> +	 * @ref: Refcount for wedged device, blocks critical path execution. Used for
> +	 * driver internal usecases which require temporarily blocking user access of
> +	 * the device during autonomous recovery, like PCIe FLR and bus reset.
> +	 */
> +	atomic_t ref;
> +	/**
> +	 * @perm: Permanently wedged device, not recoverable. Only to be set when
> +	 * notifying userspace of wedged device through drm wedged uevent.
> +	 */
> +	atomic_t perm;
>   	/** @mode: Mode controlled by kernel parameter and debugfs */
>   	enum xe_wedged_mode mode;
>   	/** @method: Recovery method to be sent in the drm device wedged uevent */
