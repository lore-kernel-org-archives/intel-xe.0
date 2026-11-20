Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AFC60A2635
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aNEVZ5m/;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=VHhXDq4j
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7A2112C3E;
	Fri, 20 Nov 2026 18:59:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1A5112C3E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 18:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795201131; x=1826737131;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q42bbF1+ObppRCbJFWdtwgG2iQ2MxyuVrKDmgfyKWXg=;
 b=aNEVZ5m/ZSf9Jwb1P1OoT9go1IAx4dt2oaX1HAyNDJIMOA4IIk+Kjofv
 L3eiy0TUK6zB/4+GY6c5RBm68EyumqdGHJHz42kUKGrLBc8IqTG0aYB13
 M7m5+/dcNxYeSyzL1tRFeAMOeuKdQuusCNzczkrcZOidjDrLqE2d1HinX
 10KuDClYIEzW2DPiKxDhuD4vGQnPxqK5mmp8FX2UE1DVkXF6KWWWsnbR2
 /MsdIafd/8tyJ/zZ38Il9ZmYjElquGmDYgG542bImSVWPPyDF2HLvq54i
 wG+8IfCt7o1NSAlbLSiuFVj2u8zOnCTmvQnNB5qEtUpU2Fn0dccWwBVFU w==;
X-CSE-ConnectionGUID: jqhuNYh/RpiWy75p7BKV2w==
X-CSE-MsgGUID: JBwgAHXAR0GDPxZBWl1+jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3969917"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3969917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:58:51 -0800
X-CSE-ConnectionGUID: Olpkn+npSuCk7eNlz/qNAQ==
X-CSE-MsgGUID: A4A+8HIDSsmWr43E01IfPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11181356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:58:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 10:58:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 10:58:49 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 10:58:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSCfI1ionK+8LsSAH5raXsN7bN1DcWMpy2Kpf8ZKxQl76k/uBfjQkUHw03ecoapZxtn5bOGwqusDo5zD9kODwKGGWNhKHi4ufCtvKeoxq5kZ39NMFNJjpw/P5yMGWp5wylFwmnnf96M+9ahtNrQNaGqFcNFNZcUY422lerpwEnTkHSqdSJON0w341IAOD95hIsESBqD7zh1XtZdEVKwUaHQbpMAjWf6bnubXu/zok2jMUJZSsGxcCNRTN2BBWSMDIyz3Ysc/WudFUKjX3eeervKz6oz5MY+iVRosDA2UzPmls9AjcgcxAZVxAOFjN1YCs6Afea8ybT5XtgSF8eVp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noZzWTVQ9pEL+czWKvEcHYCgu8UplvVULxyAw6mQzjE=;
 b=aF+4QKjhY/aTOOdqvwoqEB8IRvXKSnaz5gW29tAqlRApktyUQMlr2VnL2PrK9goK60Ap1BC5ouMM7Q4xfh0IB6r865EJwH/6Pd4cU+KZmEs4WFnJZO6yKhbzbfPxWtW2z5XxXEnJ2DbJgaiEbbxcnjWbJfe/FcrljQ/CqzgDijrt5fOkXGf7c4UFtkK8cPjcS59klfgKymHs9ceJCe/m6do6SfbQ9g3nRa0NLDdy1oHAE+seGm5pf2VkIkRe/f2t8EcZbtkNUkp0lFh/HMACtvoj/7hdq3iMoyf/OfC/cQiQT3L5zP+LLgj/YXfVrNvxlDWIvcCSSDdx8GsO2KsGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noZzWTVQ9pEL+czWKvEcHYCgu8UplvVULxyAw6mQzjE=;
 b=VHhXDq4jDuXWVPnA3FxNfOLhTKV4jEZf0qm3YnTBGibkmsBxpzTCVL2g2kRNlBw9i5ianFj9OGJIvVzLCMqnZtSFt8cGQq2tGuOaykh0/3mvR5ZfpU01lPS6TuSw0+t5tyqAp3CJSs8iVTogKmNoFloyDkMwjoBLyn/cFQJmqtg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 18:58:47 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 18:58:47 +0000
Message-ID: <749bb0ce-e077-4b76-9cca-b3c5faad9552@intel.com>
Date: Fri, 20 Nov 2026 10:58:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add GuC FW path configfs overrides
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Stuart Summers <stuart.summers@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20261119014602.243548-2-daniele.ceraolospurio@intel.com>
 <87bj7jr078.fsf@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <87bj7jr078.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|CH0PR11MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de29a44-9557-4260-441c-08df47384e4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|4143699003|11063799006|261021130227099003|261009221227099003|261021133027099003|261021123027099003|10067099003|261021121427099003|261102123227099003|261021135927099003|261022105027099003|261026130827099003|261022115727099003|261022113327099003|261026140227099003|261026135527099003|261022075727099003|56012099006|261009223027099003|261026121527099003|261028144727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 3T3NeOOIubOqu7AzYERysdeZxfYjfLvGRF6GW3oDYHKZ/k35r4M7wBE19u7usybC2n0BaDIrRYWdZzMdoUayZV4NkGNI1psp3yFvDOy2DPOLEgQcCyIAlktGI8YZK7ID1njdKpGLjEEnsZW9t9w7Jo7gKgc48Ujk8FqSwCGrb8jjk2ZSW9wmlKLmVvJRcePKcSGGhVeb/k87222dIoOD4Xmr+XdvLvYvOuWPDxuPvKXOUV/6EQPU0/1zuaIzP/XA/sKWJvpzp1NVQ9rBt7RgAl4Tb+PlUYb4F2y8Wh469w+g1s54Lr/fBLB5ovJUmS4cKoXNa2HI3UiJnj06MfGYEkr0Vjg9B0hAPjDSyRmrdVbzh2NbLd58ECuO55Yhpu8QAN2r6Q9ywSzoMgeYu30F9hqJmPvwni9LHtVHSHZdM2Oxt3/7kfKQv2X0ikBZbvwA9HyU6ukdVecFw6T9tz6PiROVeZ3cMKcktqcucFtjieurd6skPrDyZBOx2qP7mBVq5yefq5H74D9xzhc9l4CM/NMw4Lo2SnL9gZdY+eXG2u4xEnvQSQrbwBS1pvDv5O2iUlIxueugau5tOODaOdm/2eqbvh0MRvHw5JFpYY/SaI7R1KIvUl/X/wTFvJo0jIZkXTbH5yR+f/YbTbnICLoMCpfoaMIpO/znvpvQiXBo1gE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(4143699003)(11063799006)(261021130227099003)(261009221227099003)(261021133027099003)(261021123027099003)(10067099003)(261021121427099003)(261102123227099003)(261021135927099003)(261022105027099003)(261026130827099003)(261022115727099003)(261022113327099003)(261026140227099003)(261026135527099003)(261022075727099003)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elIxb2VzZlZMN1RVWUVROTdWZlR0VVBHVWxkeGgzVXVab3pKTUlqbGdQdXdK?=
 =?utf-8?B?Z1pTM29nMWNMVjJQVVN1VHRxTVBoMkxNOXlQUzkxbmxPVVVrb0xRc2ZCemxq?=
 =?utf-8?B?dTJJbk9SQ2d6V1drOXcrWVBIYVB6WFR5dlFnb0FwTjRnd3dtWDdhaCtrS2d1?=
 =?utf-8?B?bHpEM0Uxc1dKUU1zeDdmRThKdHdBUERqVWN4QnV2ZExHZEZkSXRNc3AzRFYy?=
 =?utf-8?B?eWNtWm0xczdUSzRPZ0FMd3NJTjdSdk5ETlFjbnZjNHllbWZJNWxiVmtYL1or?=
 =?utf-8?B?S2tRNTE3RGFIZU9qZkc2bis3ekJ4eEdIUXA1TEg3NE0rN0R5Zjh2MWczOThH?=
 =?utf-8?B?aEZZem9aYWNuR0hLZU9FN1AyejNtSG9BeVpoUzBsQm5sVjhmeWpWaVVoVUt2?=
 =?utf-8?B?bGlaWS9oWXZteDNTanNYNlduMGpTWldjVnFwMjhsMERaeHErcDJJVVpJZWhl?=
 =?utf-8?B?QThkdmU4NDhTS1JhNXd4R3M3VmxxdVdFVXdpTTZ4T2dDK3RDemJwSjIyWWd3?=
 =?utf-8?B?cjI4dTVEeFgrVFJHcjkraGZVNHEwVFZkMEswTmdrcS8xLzZRbTkrYlVnT3g0?=
 =?utf-8?B?ZzJrZ2MzRjQ3S2cvU1FxTUdKMGo2blZQdU9yeWJOMTIxNm80c2J6Y2tpZDNi?=
 =?utf-8?B?SjlUc012eDJ2dDYzZ1F4SjlQNGFFNDUwYktPVmMzQmNXMnN5NVhrMDhnNWtK?=
 =?utf-8?B?YzhGMU9aUTZ0YTFBRnlOQUg3UzdGV3FIZXdYTkVuemhiYnE5bGpNWGRiZGpn?=
 =?utf-8?B?RFYzcHdabXFkczRMbEVZaVl3Yk9tbDMxUDZiSlN1UXhHR0xKeHJsS1Y0VEJZ?=
 =?utf-8?B?cTVBbnNoMUJaeVcyc0t1dmVCMTFuWXlTZ1dFMkorbkRuYVM1c2xDUUN6NHdq?=
 =?utf-8?B?ODBrMVRZWVlpQzIzOWRWVnFicjJTRnAxRkEzQnQyNDdDT3AzL2dpZ0RWSjVY?=
 =?utf-8?B?Qm9WOUVpbjYrZnFZT3dpcG5oN3ZXM1ZIblFSRGRoZlpscDNOTFl5c3VkdW0x?=
 =?utf-8?B?RmxtbGh0UmZJamdncUc2MWcxdzRFYnNaazM3ZUtHOGNOSU9mem5WeExYelBQ?=
 =?utf-8?B?U0NxWWFxSm14MTRsMVlXTzdsYU00TlUvSVFUTmdRcTdycjZDVG51NjNqWkVZ?=
 =?utf-8?B?UEJKVEFtMnNZcVg1dHdaaWk1WEZpaHJFMkRIcjhKamRmNU9rNVJBZ2NsK1dO?=
 =?utf-8?B?K1RreW9UeFlIL2QxcVBzRURZbjFjbEU1YSs1MjgyVEpIeTd2Z0FSa1F4VEtj?=
 =?utf-8?B?MXJhR2hOZGQ5bW5HeVh3SU5GTFcrOCtRTExsZ2pxTWR4OEtuOXFhRk9oWHdu?=
 =?utf-8?B?V3FlMHFXblpKaGp3MlM2S01WTlhIUkppTTE3MVNqZ21aS2s3dWswRjhGa2FG?=
 =?utf-8?B?UTdqVDNGYTlaUkl5dUpXdWtXSHdzdUo5UE0rTlFnNzRWSWRmR3d5T0lGSmp6?=
 =?utf-8?B?OE5OTmV4eXJra2JpS0Q5czk0V283cXdHTURGNGR0WGZPdzhJOXNyNFdwM3F2?=
 =?utf-8?B?NTVxbk5YenFUU24vNTcwdStoYWNlOW4ybCtPemFPMEtCbTMxcHpiM2xyL29H?=
 =?utf-8?B?QjljUWVYMURic2dmczhBUCtGYnRtWklBSnExaW9BUENOSmF5K0w3VlZ5WEk5?=
 =?utf-8?B?ZDNQWWVtaXF4a2dubkNZblhYdkRQVCt0QmRCcEM3N1k3elZxWTFlUGJxMFZr?=
 =?utf-8?B?bEk4d3l1cTRiOXNlUWhTSWJuendIKzlpWXpqamp5aXBGbmR1Q0lZV2NHOEtM?=
 =?utf-8?B?Z0NFRCtacDVyczlBVGNWN3l4S0VUR0VkVWh4L2M0Z0Zqc0dyMDZzV1dYRXcx?=
 =?utf-8?B?UFJ4U3krME5SdTVZalhRb25rcGhXcXJFRXpkcGFuUERHOTE4SzBOTmVUVkNI?=
 =?utf-8?B?WTA3a1FzWFJlQjRZVUFYaFNEMFkwZFp5UllCS2dTN2lNbE1ML2lnUVJldExK?=
 =?utf-8?B?OWZrTGREc21aRDRBQW5QZGNhVWtERS93czZRUjVXTWN6WjhYYzYrOXZubGh5?=
 =?utf-8?B?KzFQY1o5a0VVNkhUNU1BUldCUGRTOFFjQkZyc0hoQU84emVqRUg4YzhraVla?=
 =?utf-8?B?alpTa0lCNGFSNjVLaDBXVUNlUktBR3cvYTB6eUhxRXdQVk5uVXZDbkMrVXg2?=
 =?utf-8?B?MmR6V1VZa1BsT2xtWE1vYlBJL1VqYk1aSEVkamlaOC9jWTNZV2k5SU5wZ0Jv?=
 =?utf-8?B?dTc3VytHR3R0K0I4aWhvOVBBZ2hXRGdKZWdqcGdlSGxaZ3ZjSzE1RE1hUldP?=
 =?utf-8?B?ZVVVRVpaZFppT2JneUUyZ2ZWNEo4aEFLREIyZHZDY2RPL09wL0J0SjhsbmpU?=
 =?utf-8?B?OHdxV0dmRkFOOFB2Ym5pM3laM25uSG10WThMS0E5SmtiUWtOeFFkV3ZTMThD?=
 =?utf-8?Q?8whh6FaTZ8nDn408=3D?=
X-Exchange-RoutingPolicyChecked: Yqj3FFOhfGS+CDueijns8MGtcLr5gcXdQwxf0DeOTLCqufXENom0H3CQ6v+xShpQNOvNK8yQchcGfa1oFeAnxCMsNcbTU+ulVJyVMkmyxkhkxdqYWtPbq67aa9uBTpKH+q8oGv2CjmixIK2PB/hZ3OMEwg1lJnVZyxqF+qeu0JvoJgRzwwVsfwIkWKrUnGnJJ5mXys6unxVfdsU3OMs9pffuKNm3Cy+cotK7+ve0N+gono4U5O8W1KLiSf9ZSxaOmT7C1DiSDsD1hMqk8RBDzbTxeqKnACOiYEEqLkrUdRCjh4tGLxH6z4Qa7jIN9rCHtJTtzn108RDT8O62veJd0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de29a44-9557-4260-441c-08df47384e4b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 18:58:46.9208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UAih7bln7Eq8G37WPatgGO3idptbXZhYZF9YUenEmY0hKzmnmCsUewc9SyLQ9SYgAfmPIQiW20d/ooiqgfhmm6as6/JiVQ9OfqmKc7QDFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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



On 11/20/2026 7:28 AM, Gustavo Sousa wrote:
> Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> writes:
>
>> Some platforms (e.g. NVL-P) use different GuC binaries for the primary
>> and media GTs, which means that the guc_firmware_path modparam that we
>> use to override the FW on all GTs for testing can't be used on those
>> platforms.
>> This patch adds separate configfs overrides for the 2 GTs, which can be
>> used to tweak their GuC FW paths independently. Note that the modparam
>> is still supported and takes precedence over the configfs.
>> Since the allocation containing the user-provided config is only
>> guaranteed to exist while we hold a reference to the config group, we
>> need to take a copy instead of pointing uc_fw->path directly to it. To
>> keep things simple on the cleanup side, we use a drmm allocation.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_configfs.c | 150 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_configfs.h |   2 +
>>   drivers/gpu/drm/xe/xe_uc_fw.c    |   7 +-
>>   3 files changed, 158 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 2ddd707a6dbd..b6b544c3bc9d 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -13,6 +13,8 @@
>>   #include <linux/pci.h>
>>   #include <linux/string.h>
>>   
>> +#include <drm/drm_managed.h>
>> +
>>   #include "instructions/xe_mi_commands.h"
>>   #include "xe_configfs.h"
>>   #include "xe_defaults.h"
>> @@ -277,6 +279,24 @@
>>    *
>>    * This attribute can only be set before binding to the device.
>>    *
>> + * GuC firmware override
>> + * ---------------------
>> + *
>> + * Override the GuC firmware path for the primary and/or media GT. This is
>> + * useful for testing a newer GuC firmware version without having to update the
>> + * driver. The specified path must be relative to the /lib/firmware directory::
> The path /lib/firmware is not the only base directory that the kernel
> uses for finding firmware.
>
> The documentation at
> Documentation/driver-api/firmware/fw_search_path.rst shows the other possibilities.

Thanks, I'll update the documentation.

>
>> + *
>> + *	# echo 'path/to/guc_firmware' > /sys/kernel/config/xe/0000:03:00.0/primary_gt_guc_override
>> + *	# echo 'path/to/guc_firmware' > /sys/kernel/config/xe/0000:03:00.0/media_gt_guc_override
>> + *
>> + * Writing an empty string disables the override::
>> + *
>> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/primary_gt_guc_override
>> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/media_gt_guc_override
>> + *
> We probably want to taint the kernel if an override is applied, no? And
> then document that a taint will be added when these options are used.

Good point, I'll add it.

>
>> + * A modparam is also available to override the GuC firmware path for all GTs,
>> + * which takes precedence over the configfs override.
> This is unrelated to this specific patch, but I wonder if it makes sense
> to have the module parameter apply override only to the primary GT if
> the current platform requires different GuCs for the different IPs?

That'd require a meaningful rework since one IP has no idea of which GuC 
FW the other IP is (or would be) using. I don't think it's worth the effort.

>
> Another thing that comes to mind: is it okay to load different GuCs on
> platforms that use the same GuC binary for both IPs?

Theoretically it is ok to load different GuCs even if a platform 
normally uses the same binary on both IPs, but I don't think anyone has 
done any in depth testing for this (I did try it on PTL when preparing 
this patch, but I only ran xe_exec_basic as testing).

>
>> + *
>>    * Remove devices
>>    * ==============
>>    *
>> @@ -309,6 +329,11 @@ struct xe_config_group_device {
>>   			unsigned int max_vfs;
>>   			bool admin_only_pf;
>>   		} sriov;
>> +
>> +		struct {
>> +			char *primary_gt;
>> +			char *media_gt;
>> +		} guc_overrides;
>>   	} config;
>>   
>>   	/* protects attributes */
>> @@ -331,6 +356,10 @@ static const struct xe_config_device device_defaults = {
>>   		.max_vfs = XE_DEFAULT_MAX_VFS,
>>   		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
>>   	},
>> +	.guc_overrides = {
>> +		.primary_gt = NULL,
>> +		.media_gt = NULL,
>> +	},
>>   };
>>   
>>   static void set_device_defaults(struct xe_config_device *config)
>> @@ -937,6 +966,84 @@ static ssize_t ctx_restore_post_bb_store(struct config_item *item,
>>   	return wa_bb_store(dev->config.ctx_restore_post_bb, dev, data, sz);
>>   }
>>   
>> +static ssize_t __gt_guc_override_show(struct xe_config_group_device *dev,
>> +				      char **override, char *page)
>> +{
>> +	guard(mutex)(&dev->lock);
>> +
>> +	return sprintf(page, "%s\n", *override ? *override : "no override");
>> +}
>> +
>> +static ssize_t __gt_guc_override_store(struct xe_config_group_device *dev,
>> +				       char **override, const char *page, size_t len)
>> +{
>> +	char *path;
>> +
>> +	if (len > PATH_MAX)
>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&dev->lock);
>> +	if (is_bound(dev))
>> +		return -EBUSY;
>> +
>> +	/*
>> +	 * An empty string disables the override. Some bash commands can add a
>> +	 * '\n' or '\0 ' at the end of the string, so consider a string of
>> +	 * length 1 containing one of those characters as empty.
>> +	 */
>> +	if (!len || (len == 1 && (page[0] == '\n' || page[0] == '\0'))) {
>> +		kfree(*override);
>> +		*override = NULL;
>> +	} else {
>> +		path = krealloc(*override, len + 1, GFP_KERNEL);
>> +		if (!path)
>> +			return -ENOMEM;
>> +
>> +		memcpy(path, page, len);
>> +
>> +		/*
>> +		 * the echo command adds a trailing newline unless the -n option
>> +		 * is used, so replace it if present.
>> +		 */
>> +		if (path[len - 1] == '\n')
>> +			path[len - 1] = '\0';
>> +		else
>> +			path[len] = '\0';
> I think we could handle the trailing chars stuff in a single place with
> something like below.  What do you think?

Looks reasonable, let me test it out.

Daniele

>
>      |diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>      |index b6b544c3bc9d..1a763d9f241c 100644
>      |--- a/drivers/gpu/drm/xe/xe_configfs.c
>      |+++ b/drivers/gpu/drm/xe/xe_configfs.c
>      |@@ -978,6 +978,7 @@ static ssize_t __gt_guc_override_store(struct xe_config_group_device *dev,
>      | 				       char **override, const char *page, size_t len)
>      | {
>      | 	char *path;
>      |+	size_t path_len;
>      |
>      | 	if (len > PATH_MAX)
>      | 		return -EINVAL;
>      |@@ -987,28 +988,27 @@ static ssize_t __gt_guc_override_store(struct xe_config_group_device *dev,
>      | 		return -EBUSY;
>      |
>      | 	/*
>      |-	 * An empty string disables the override. Some bash commands can add a
>      |-	 * '\n' or '\0 ' at the end of the string, so consider a string of
>      |-	 * length 1 containing one of those characters as empty.
>      |+	 * Some bash commands can add a trailing '\n' or '\0'.  Use
>      |+	 * path_len as the normalized length.
>      | 	 */
>      |-	if (!len || (len == 1 && (page[0] == '\n' || page[0] == '\0'))) {
>      |+	path_len = len;
>      |+	if (path_len && (page[path_len - 1] == '\n' || page[path_len - 1] == '\0'))
>      |+		path_len--;
>      |+
>      |+	/*
>      |+	 * An empty string disables the override.
>      |+	 */
>      |+	if (!path_len) {
>      | 		kfree(*override);
>      | 		*override = NULL;
>      | 	} else {
>      |-		path = krealloc(*override, len + 1, GFP_KERNEL);
>      |+		path = krealloc(*override, path_len + 1, GFP_KERNEL);
>      | 		if (!path)
>      | 			return -ENOMEM;
>      |
>      |-		memcpy(path, page, len);
>      |+		memcpy(path, page, path_len);
>      |
>      |-		/*
>      |-		 * the echo command adds a trailing newline unless the -n option
>      |-		 * is used, so replace it if present.
>      |-		 */
>      |-		if (path[len - 1] == '\n')
>      |-			path[len - 1] = '\0';
>      |-		else
>      |-			path[len] = '\0';
>      |+		path[path_len] = '\0';
>      |
>      | 		*override = path;
>      | 	}
>
> --
> Gustavo Sousa
>
>> +
>> +		*override = path;
>> +	}
>> +
>> +	return len;
>> +}
>> +
>> +static ssize_t primary_gt_guc_override_show(struct config_item *item, char *page)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>> +
>> +	return __gt_guc_override_show(dev, &dev->config.guc_overrides.primary_gt, page);
>> +}
>> +
>> +static ssize_t primary_gt_guc_override_store(struct config_item *item, const char *page, size_t len)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>> +
>> +	return __gt_guc_override_store(dev, &dev->config.guc_overrides.primary_gt, page, len);
>> +}
>> +
>> +static ssize_t media_gt_guc_override_show(struct config_item *item, char *page)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>> +
>> +	return __gt_guc_override_show(dev, &dev->config.guc_overrides.media_gt, page);
>> +}
>> +
>> +static ssize_t media_gt_guc_override_store(struct config_item *item, const char *page, size_t len)
>> +{
>> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>> +
>> +	return __gt_guc_override_store(dev, &dev->config.guc_overrides.media_gt, page, len);
>> +}
>> +
>>   CONFIGFS_ATTR(, ctx_restore_mid_bb);
>>   CONFIGFS_ATTR(, ctx_restore_post_bb);
>>   CONFIGFS_ATTR(, enable_multi_queue);
>> @@ -945,6 +1052,8 @@ CONFIGFS_ATTR(, enable_psmi);
>>   CONFIGFS_ATTR(, disable_vram_page_offline);
>>   CONFIGFS_ATTR(, engines_allowed);
>>   CONFIGFS_ATTR(, gt_types_allowed);
>> +CONFIGFS_ATTR(, media_gt_guc_override);
>> +CONFIGFS_ATTR(, primary_gt_guc_override);
>>   CONFIGFS_ATTR(, survivability_mode);
>>   
>>   static struct configfs_attribute *xe_config_device_attrs[] = {
>> @@ -956,6 +1065,8 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>>   	&attr_disable_vram_page_offline,
>>   	&attr_engines_allowed,
>>   	&attr_gt_types_allowed,
>> +	&attr_media_gt_guc_override,
>> +	&attr_primary_gt_guc_override,
>>   	&attr_survivability_mode,
>>   	NULL,
>>   };
>> @@ -966,6 +1077,8 @@ static void xe_config_device_release(struct config_item *item)
>>   
>>   	mutex_destroy(&dev->lock);
>>   
>> +	kfree(dev->config.guc_overrides.primary_gt);
>> +	kfree(dev->config.guc_overrides.media_gt);
>>   	kfree(dev->config.ctx_restore_mid_bb[0].cs);
>>   	kfree(dev->config.ctx_restore_post_bb[0].cs);
>>   	kfree(dev);
>> @@ -1479,6 +1592,43 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>>   	return len;
>>   }
>>   
>> +/**
>> + * xe_configfs_guc_override - get configfs guc override path
>> + * @pdev: pci device
>> + * @gt_type: type of the GT for which to get the guc override path
>> + *
>> + * Return: A new drmm-managed allocation containing the path to the specified GT
>> + * guc override if set, NULL otherwise
>> + */
>> +const char *xe_configfs_guc_override(struct pci_dev *pdev, enum xe_gt_type gt_type)
>> +{
>> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>> +	struct drm_device *drm = pci_get_drvdata(pdev);
>> +	const char *override, *path = NULL;
>> +
>> +	if (!dev)
>> +		return NULL;
>> +
>> +	if (!drm)
>> +		goto out_put;
>> +
>> +	scoped_guard(mutex, &dev->lock) {
>> +		if (gt_type == XE_GT_TYPE_MAIN)
>> +			override = dev->config.guc_overrides.primary_gt;
>> +		else if (gt_type == XE_GT_TYPE_MEDIA)
>> +			override = dev->config.guc_overrides.media_gt;
>> +		else
>> +			override = NULL;
>> +
>> +		if (override)
>> +			path = drmm_kstrdup(drm, override, GFP_KERNEL);
>> +	}
>> +
>> +out_put:
>> +	config_group_put(&dev->group);
>> +	return path;
>> +}
>> +
>>   #ifdef CONFIG_PCI_IOV
>>   /**
>>    * xe_configfs_admin_only_pf() - Get PF's operational mode.
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> index d726800de26a..514f115e1977 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/types.h>
>>   
>>   #include "xe_defaults.h"
>> +#include "xe_gt_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_module.h"
>>   
>> @@ -31,6 +32,7 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>>   u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>>   					enum xe_engine_class class,
>>   					const u32 **cs);
>> +const char *xe_configfs_guc_override(struct pci_dev *pdev, enum xe_gt_type gt_type);
>>   #ifdef CONFIG_PCI_IOV
>>   unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>>   bool xe_configfs_admin_only_pf(struct pci_dev *pdev);
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index c042075a36e5..98cf7f658b8e 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -10,7 +10,9 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "regs/xe_guc_regs.h"
>> +#include "xe_any.h"
>>   #include "xe_bo.h"
>> +#include "xe_configfs.h"
>>   #include "xe_device_types.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gsc.h"
>> @@ -291,13 +293,16 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>>   static void
>>   uc_fw_override(struct xe_uc_fw *uc_fw)
>>   {
>> -	char *path_override = NULL;
>> +	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>> +	const char *path_override = NULL;
>>   
>>   	/* empty string disables, but it's not allowed for GuC */
>>   	switch (uc_fw->type) {
>>   	case XE_UC_FW_TYPE_GUC:
>>   		if (xe_modparam.guc_firmware_path && *xe_modparam.guc_firmware_path)
>>   			path_override = xe_modparam.guc_firmware_path;
>> +		else
>> +			path_override = xe_configfs_guc_override(xe_any_to_pdev(gt), gt->info.type);
>>   		break;
>>   	case XE_UC_FW_TYPE_HUC:
>>   		path_override = xe_modparam.huc_firmware_path;
>> -- 
>> 2.53.0

