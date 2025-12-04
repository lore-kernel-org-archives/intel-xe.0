Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7195CD2A532
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 20:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE0010E9BD;
	Thu,  4 Dec 2025 20:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8cbM6Fn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970110E9B1
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764880925; x=1796416925;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zNONgHmrjc7CUqj/xzb1ZYM40Sp3giiSDGMZe0JjIJ4=;
 b=Z8cbM6FnK7MRJhn8yvn9tYeOmW/WH7hEQ/LstQX8mSN4TyNQEJ43ePEr
 11Lj5tCp3KGIxOmk6Xt6SiBgjXU4571j+H9gS2AQmt3Seq56ygB/GusP/
 oNX+CnwPcKtNh02sg61tr2r8qL1zpNtOT06BinH9oSn0GTxHu17vUoF0z
 sy/9jcThJEUqXP4Hj5N39l3LVUC20BmPeDns4pQoOjp6GVv4ix6zS7F1V
 kh5P5ABvCs53E7GPQqp3LVYYMSGDf/4nIY1XUFY/wWvJhjg3eiYRhP/yE
 4B+T63uwV/5xMLd4kQnJLSR/oghik5m38niT/lUnfTAak7dyKk541uEY8 Q==;
X-CSE-ConnectionGUID: aDvjf6wCRJeyu88cAZAFgQ==
X-CSE-MsgGUID: Sy+znCW6TLOUOupTFMKpVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84317881"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="84317881"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:42:05 -0800
X-CSE-ConnectionGUID: 5S9D1PHgSNWMomPngHLO5A==
X-CSE-MsgGUID: HQwi9BZPRsCye89iHgsNMw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:42:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:42:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:42:03 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:42:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbLNmu6dv3sCCVmFsWzfYOl9Gp03D95hhLj2a7H9sRu6j/dZtUbjhqiFxtaqmMTKTT2s1+h1g7wkZxntzwcA+R9wDa7tI/njcTeHc29hyLMeGPen3BgawHzZfwwG5vOgBOWwH/IXeyWIQE9pHYBNURr44Cct/LiIJpLCeujeiaPev3FAiFV0dhNsTjTDns/3sA9r/x+eMlRz/KWzaXXGYASjCVUcTj0OD5qErPnhY3QqVL3zveDzu9RmAypzbyC++C56zl0BamHbCUmD5v3QNwNQfMWoy+iPC0NgHoEA7h9aV2NX7ba/sl8KyGpp/x3YpaBE5TnHQGOKuHShN1s3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNONgHmrjc7CUqj/xzb1ZYM40Sp3giiSDGMZe0JjIJ4=;
 b=VJqy4eQJUPEwU4ABYUZPhal/dJ2ELi2KFZy67urGmPqUAkImfgEUDauGqNtGdPVyHOMbnOQhFsHLh24gBWUR3GHnN77C59kIEOi8qUBo0XatDsv2rurVscGmfDePPaEBT/WqhABhcZtU/ReV3fLkzXQQQDkhpChlfLnt9eBiPG0PRZ9u7S5oUk242re+ryBTw2oiFWOqf5WLNkd2GtSrJ1ZGiP1b9VeuikGmx0rFSIc5h5UbCCip8nk+M0XFORPz7RKcmyRqP59HEy76RLRuZpHK/vvx1THQ+RUviRyvy73+5n5sSa074yfLt5RBhB0rgHzQ6gQvV3nNUBZQsBnaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 20:42:00 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 20:41:59 +0000
Message-ID: <24c7e992-5aa4-41e6-a8b6-b5125bb9d99b@intel.com>
Date: Thu, 4 Dec 2025 12:41:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] drm/xe/guc: Only add GuC crash dump if available
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251127170759.2620994-1-zhanjun.dong@intel.com>
 <20251127170759.2620994-6-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20251127170759.2620994-6-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::34) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ccdf3f-c818-4323-4206-08de33759297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVVhL0RyZzlCdkRXY2JUL1dOM0RscHNLR241ajAyK0RxQzBkcTBjNURENGVy?=
 =?utf-8?B?V3Y2WW5FaEs4YU12c1UrdVRGNmltNEFhMURDYzBVcGJHaUNnY2IrTzNjV0VB?=
 =?utf-8?B?cnVFaitBWStOcDJkQXRZUVl1YmxZNGY4bnA4NjJBWGIrUGsrMXkrMVpaNnRj?=
 =?utf-8?B?dnE4eUM2ZG1UTWF4bTFydHFGOFE0YUxqVE9VSHpTQzJ4d0YwLzZIOUh1MnJX?=
 =?utf-8?B?dGtHaDlGempzdWg1dVVPN1luaUdOU2d1SUJlUFZTMnB2eDRxLytjWG1sNElH?=
 =?utf-8?B?eDc3WUFWSUV2cktMMktaWEVsd0ROY2RMaTVMZ3BGeWZhY2RpbWZZZDJDTTZp?=
 =?utf-8?B?SS83U1hLNlY4M2Vmejdka1NhVENHN0N5UDhDUWRzRVpHN3ZLd0lsQ0IreFVI?=
 =?utf-8?B?ZmRGYTg4RHlDWmZDQzhwK1V4Y2s1d3NCV2RmYklVc1l3bExWWlBtKytiYUI1?=
 =?utf-8?B?SzJJTzFsSTFzcUp1YXhONnZ1NlFXb0JuVlltYXhxb0VRcGw2RVhWa2t5UHpi?=
 =?utf-8?B?eE5aVlAzczhIay92QU5MZm5WWjBLQlBYbm9CRllWaDFxUWk4dWg4eUlSd0s1?=
 =?utf-8?B?V2VaY292NWp4WXlvT090Vm9NYytvTDd6blFtMXppY0t4RW51NlBqWU1QS210?=
 =?utf-8?B?b3VhOXBwMkF4K1E3eWVTQjMvT3FSSVF3NmRJREhycWQxQWdYNSthdHZrNEli?=
 =?utf-8?B?V0draWh2Q2dENlp5dVFpbkttbnN1N01SWjdSclVlOFVZVG5wWjIxZmlYYTRL?=
 =?utf-8?B?dEFaR2xhTVU0QlU1dEhjYmhkYStSWHUxY05SajhRaW54SlNIQyt4clcxSXpW?=
 =?utf-8?B?UHd6eW8xc2dzM2J0bzJmSk1XMEw3eFJNNVNhRWtWcXpibGt1TmUzYTNZcVZD?=
 =?utf-8?B?SWVodFNjeWVrQjYrMy91RU9GYTFnK2MrVFZDRzN6RytVT2dnRU9Zb3RjZEVt?=
 =?utf-8?B?aERWcTJuS2NickRpMUsyZUt1M2k5QUdFNWFaSHFXUjMzWDJsTm1CdmNEVzRn?=
 =?utf-8?B?S3VzdW9OMkY5Tms5bS8vMENpZGJGdTh6djV2Znk1Mmp0ZWR1dTVud3hwTHMy?=
 =?utf-8?B?L3VBNE5ZcXZiaXEvYS9hUnJSWERzell3OCtPSktkMVRzSFoxWU1uYWdxdUMz?=
 =?utf-8?B?QWZUVEc5ZnFybTI0eFRpNng4YmZqd0FOUkdWWVFRd2hSV2tiZVBRNTJEc1Qy?=
 =?utf-8?B?V0xsWG85V1BoY29wRHB5Z0VzMkRzeXViY2pSbFZHcTZ2bHV3bmZibHVMRkpj?=
 =?utf-8?B?WkJvU2pvUFExV1FSNGdBaUd3T1RWNUgvR2JzQWhYRXNOS1hkaXR2SFBhYWg4?=
 =?utf-8?B?RHM2WjJmM0FPZXd3QU5ZNkVOUlhMWUtyTXdMK21DdXFlM2l4UTRncldhakxM?=
 =?utf-8?B?UURFeU1YSGlaMjlGN0VqTnc4T0NnRU8rbTZZTmgwTmtyMU5IcWlZSU9FNG9E?=
 =?utf-8?B?SDBzcytRMG44Z2ZiTmxqSkJQcVVoM0svbDg5U0Ntc0dnVHhsQmlBT1B0RGlH?=
 =?utf-8?B?ODFzMGt1OEhlYjYxK3huTlpvQmZNUUY0bWdhNWZ0dkN2Ujd2M0ZwSTRONFc5?=
 =?utf-8?B?NkdrbEtVQU5pYUttRkhpY1N0cStrdFVtZHlucDZLWGh1VGE5ODNaeStzbTFq?=
 =?utf-8?B?S2c2YnNBNmRyUFJQRlRrVGNrQlA0YjlCS3RhT2kzbFk3RHFUbkJocG1Kck5D?=
 =?utf-8?B?UHFSUkJaNFpkeHdvNmFBT3FLeStDT3dnWWg5ZnptOWkrSEhCc0ZnanpoeXFE?=
 =?utf-8?B?anB4YkV2ZXc1c2JHNVF0WlZzM3RpcUxraU82YkRZeElYMWxpZEVRUHZTRVFl?=
 =?utf-8?B?VjNDa3RQQXFibG5yRExkNlhDL1ZjRUN2SUxNQUZFZmNOREhQR21OMmVXa1h4?=
 =?utf-8?B?R1dHK1g4dTczSW5SZW9yMzMrYjRTRC9yZmhURzcwMmkrMXZ6aUZ5VHhYWFJu?=
 =?utf-8?Q?GZTtYPfoqfRFQQQ93Px0lM8WFcZC85zN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnVNK0xHZGpQandhMEJEUmt0UENabjF5NXY1aWF0OEpvSmxQSUQxY3NKT0dV?=
 =?utf-8?B?TE9vSURwOVE2Q05Ydk9Jd3ZDczVLMTN4WlVPaXNTK3RwQ05nWWFIdUxCcEhF?=
 =?utf-8?B?dzY3Y2sxc0pPejBLdVRXK3NQZzFuNVJscUNNNkhJdjA3Rmt5SlZvNjM1Lzds?=
 =?utf-8?B?SGZMNXY4Q3BsR0Q4b2pHNW5zRFNabE1URnQyb0VxMmcwZTc4cFNkdXJKSkp5?=
 =?utf-8?B?ckJrWmxyVVA5MzdOOXJsMzR6WXhMSjFOczUxWXZhUXhpNkhyTCtROUJlcER0?=
 =?utf-8?B?T0hOdWR4RS9hbTM2eW9JbkRQakFGNHBSUU1WMjFpZlBXT09uNXVzbGZkVWNv?=
 =?utf-8?B?c0pHMDdLZ1FpcitqOWh4WitjV3hBN0lvTnBETHpEblhjcGVLZ1VSdFg4Vzd2?=
 =?utf-8?B?eFJHcnAvUUhIemU3VWJKeGFraXZIZ3c1OEk5TkpXaU9zV3NxUkt4SmVlODVz?=
 =?utf-8?B?UVp5S2RnTlRETzNpTFFTdEFEUjdXUG90WENVa2NvTWJ2dGovVisyL2liQXgy?=
 =?utf-8?B?L1JRWm91YjhQdmRPdkVkL0RNUThXSDJ1V2o4SlkyaHpWejZPZjdFMjZpd0Rm?=
 =?utf-8?B?SGNtVlR5ZDdDWnVBTHpKV0VzV0ZOa2RMTmdJaFFuVWhYdDVEOFZLYkhJNG9a?=
 =?utf-8?B?OEhDY2VJOGRudXFoSjBhZHdJcnIyaUhKYUdKMmRaUHY4akFYR0JBcGFRcW5Z?=
 =?utf-8?B?c0I3NnlxYWdOeVBwZ2lPSEJXOWdXZjhUUDgwVXVBcUlEVFdqTDJSWGxKeENi?=
 =?utf-8?B?ZkJHTEZjalN6aG9Yd0diK1dJUVowNkNEVVBZRmFicDdXRVM1Nzk1N2lTQllt?=
 =?utf-8?B?UEhuRlg0algvTXYxd3VIaE1ieGRpWnhrUmFMeDF6U0ZmbHlBb3VRTnM2Uks2?=
 =?utf-8?B?eVROZnV3YXEvVy80US9QRkZNU2daOVh6U0x1amhYQldOekJVVzJWdFNsSjJ5?=
 =?utf-8?B?a01zZEtGTnJQMTRMbGRWTnNPazFGOEFEa0U3WXNySUNzRXBsSWNoR1p2cVlp?=
 =?utf-8?B?SDdGUG9MRnpneU9CemZCYWxzQ0IvdHFSUlhXajNlS2Nvd0RjcU8wTnRvUW9k?=
 =?utf-8?B?RjB1MjdDekZWQ0s0dTNMWVpjbWx1WlhIU2o3cVVMUDRKVkRQZTMxYWQ1dERa?=
 =?utf-8?B?SXBFTm9rRlROaVlXUU5pdmVQSTl3eFJPOWo4N05WZ08wMjN2aGJpTy9Xb1Bh?=
 =?utf-8?B?ckl1Zm5mSHhSUGZaWm5SaGZRdk41MGNtVDJSNVhoTjVLSkdyS0tCVXliYnFQ?=
 =?utf-8?B?bFVvb29nZUlYMzByZGRlZTlybW1ZN0VRT2hoYmRwWDVEQk9KZ1RyTXZQWlZ1?=
 =?utf-8?B?NVBGQTJnS25QRzYycG1vaDFLWE12WlRpZzEzZ3BHWXVaSExCcEtQREhmdFhy?=
 =?utf-8?B?a0E5UUdVWlZGQmJDTC9PZFBCOWtkTzEvc3NmdjVQdllqWElVbnJndjlDOStV?=
 =?utf-8?B?cGgyVVhGVnA5WFlBU0hTR0E0ZHI3WGZWRDYzR2ZrdjJ6T2lMRFNIVjB6OEVB?=
 =?utf-8?B?dytHSmozdjVabWZ6QjlkbzhCRE1ZT1E5MC9pdDVGaUdwSEFCUGRwcmxqcnJB?=
 =?utf-8?B?L1dWOEQ3Rk9IZzBtcWxIOHRreEFsMWRuUHJDdGpaSWR2bVVwR1RxVlcyTEZY?=
 =?utf-8?B?c2pvWjZZd3IrdUNOYmNhdCtvOTB4UnF3V2hORjBXZFFubWdXK1EyZjQzZjNo?=
 =?utf-8?B?cDNEcWZmNUtFdXNaZDYvQzlMVURKaU5PUzZZb3FvMmptTGJyditWMVFNMXVG?=
 =?utf-8?B?eGdhNmdVU1lNeXBQZk1oUzVocW94dW5PNEtVeTZyN3dScG5ncEwvNFNyQllO?=
 =?utf-8?B?OGRCRHMwYTlMd2MxNEZmRFVNd1VmeCt5SFhVUkJMT0hvZEtEeGdCWWZEMHBp?=
 =?utf-8?B?Tk9XSnl2SXNsRDFWQlRxYmRsZjB4UG9hSTdGT1BCVnZpeFA3R01DenBPeHdB?=
 =?utf-8?B?L1JTcmxjSFVGSEFkbXdzbnBuL3hMYmNwczFIMTJuZkhNd0RpUWVsc01JcThW?=
 =?utf-8?B?K25FeDdRV3d0b0Zwd0pDenFoUzJ0OWxUL1p2di9aOE1SdFlIWVNaUjNEY0Jv?=
 =?utf-8?B?NFRydkprTnJBaVRFdlJnTEswS2h2UHpVVTRtNHhteHdvWTFweThCaGdaNHB1?=
 =?utf-8?B?TmFRTFhYbURwdG10NXlUVVZjSWxaN0xNVXVQRVlsZDNIajlsY0w2cFlTaElJ?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ccdf3f-c818-4323-4206-08de33759297
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 20:41:59.9292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7nHRaA1fWrkaqpmThQJunRcIVpz5L0vvo3Fz1ndx59v394TyR4N5khflQp4qACqWmWBX8JPHTvw9U68RBRMOZv0FYGevdODzhmOUfqny3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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

Previous comments addressed in '[v7,5/6] drm/xe/guc: Only add GuC crash dump if
available'.

LGTM
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

