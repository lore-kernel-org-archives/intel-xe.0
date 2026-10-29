Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F994606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B2RNTUBQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0632411224A;
	Thu, 29 Oct 2026 11:39:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08EA11224A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273985; x=1824809985;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1rZT6IweBLi4a+a4wfZJiUuSwxy8YPl/TdGCUgvXb30=;
 b=B2RNTUBQjiAe5fa+X4YyE+2GWAU2kdIUSBQyTpQksXgxKATSRT/G5hC2
 h6mJ8vN+KM5oU/k//0zqLAwoqVUSxVzAziYW84z98wvIXRgwomc63RAXH
 X9lo8FHiv7XrIFzotiFBfmSF+RYCTFq/onRwHai/G2WhUyykgMO9pcvOd
 s0cOT3wcsbWLdGw9lqHhyP+hJ8ChdmusdlRCHpos7xx31uZwR/Ut7wK5X
 hW+f9YP5SXi3e8IMIq+Bl3gtS8RT8z8SDhFM0ND34ZT+stCHwqvG94ZdI
 386mUlJZj+Xlvxebm+xOm2epVPw2ijeJM1sovi3liYGW5+1t9Tc+vc6PV g==;
X-CSE-ConnectionGUID: 6bL4wMvKQBOuZ+ddBl8D+g==
X-CSE-MsgGUID: je6eryd8Sn67pQh2PApctA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2029840"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2029840"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:39:44 -0700
X-CSE-ConnectionGUID: UbS9o2/iSPSBiGHXCH4p2g==
X-CSE-MsgGUID: XysDrJI8QIqn9xxY16egeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5458131"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:39:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:39:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 04:39:44 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8NCOXSi3B/eS7DViUS5BVMHgPpjMcUZgWAm9BCF9tZGWy7obdCMtEXyo++AON6FuvpTLA6YSmRajRvUmrLgo/BWu/Dz7pE+sFp2y5ZS9/NjoFXZ/7Gi9XAqhd+Gz6ZfZai2+rQmk0d6l4Me1rfH681OjQ9FOiCwFOVqTsANIIkLe57E+9P0o4AQeBa0Ljc4Av9Zd5SQ7C2JblGusCzlf84bFd5Ej5UI+4MHk+RbiSVNbFY9bHaomsfnZCYQV332xMGriSPUyG5KG7aHrKRKjipnMR3DU/N6DD5A8H5TnLWCaueFHVKabITy7Ssj1JZy9p/lMasGKbvXouF0UHjq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvQF3U7rcxTneGUZ5MjqiQQkVgRM90I5YAy9HXwQ5Ug=;
 b=hNCIFt8PCNLEA+edfPFGelrRh8UYwzTSJQzmNNiFhBvmL5FEUnfRuH3upD8FwKX/FPvwjQkXeH80v6U5f+uhtYLH/jC7kfnu/d13gChUKxKt8OxFVul/zh1DeKV88j1GoquLcBoaZF/OBaKxa+sQEjC97BQDO/kOFPAxdHez5ham9L2pVaDuuD08+edEGm0iCSY4n5y07Xox6q0Z33EXVfFa8V4zS4lEpkPJf4sZ7AHhzdNui0kZFGvaVtefKpqFc2e8+y+DFKw57koxUNqC0Mn7jhZkCmhz5Us+upb915LGcA1NlOiX+J3QQGpaDJXyZ/QWpUixmmgZwJSHflqTkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB8856.namprd11.prod.outlook.com (2603:10b6:8:253::22)
 by IA3PR11MB126088.namprd11.prod.outlook.com (2603:10b6:208:54b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 11:39:33 +0000
Received: from DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111]) by DS7PR11MB8856.namprd11.prod.outlook.com
 ([fe80::6613:5e2:a45:1111%4]) with mapi id 15.21.0546.012; Thu, 29 Oct 2026
 11:39:33 +0000
Message-ID: <5a4f0789-fc45-4650-8a33-6e0936abf8db@intel.com>
Date: Thu, 29 Oct 2026 17:09:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] drm/xe/hwmon: expose fanN_max
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-3-karthik.poosa@intel.com>
 <2db2b6d4-5bec-4de9-a38e-6f9ab742dacb@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <2db2b6d4-5bec-4de9-a38e-6f9ab742dacb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To DS7PR11MB8856.namprd11.prod.outlook.com
 (2603:10b6:8:253::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB8856:EE_|IA3PR11MB126088:EE_
X-MS-Office365-Filtering-Correlation-Id: 364f5420-4e67-4c02-a715-08df35b14d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261028144727099003|4143699003|56012099006|11063799006|5023799004|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261021121427099003|10067099003|261021123027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: SQ/UXcm0bvj/kqupBCtPZXBWeXQw5d8Y0Ej9/2v9sZ0jzx9S1QmjmZKLeCg5z62NLK4P/60iGEGGjgfNtlbqLb3y/88rPgXNQ7RbIMGJ0OGYAmjPvTowt78sXbu+6nXvm8gpP6+TfdG6P80ippfB0DJ44rs0EJNFrRKMJSwOORE7/Pp9udPRz4Kc0IkwzuIoI4IRCC1CHyTw938L5N1TxnrYxQ10p/SDSnsIg84J57vqzKBddH05Uh4KcBpHDNuht1+bTfhZTFDd4gbwNRKizcEBAdxJPE6uz3pu3Fst9u7y0ckR14YL9GQwE2nl7dO2lmXSazID12lq6CVwvDzj8jXbwWHeoyQjaiHDirvCpQPXAm2NG2RwayjvuiIGQUmHB/67UFJV/X/K2AsGgzki9yp6f98ILvYUgfb9SOZ7CtZ//ZxWf59gjTV0dnv+/b6L+1EosIizP09zsTlYHMe1QGZ2KD+zf0cChyazxbLNCmH3RTqyo1IrFsdcAvOgh2ybHLOAkh1iJ4cP3cfemeE/qIdmImadt8Smx/L95YirpdWSRVhqAkX+btSfjBEMadyJg75dhv8Ux0Q97RVWixZlF7yqu+PG0YRINXUYkmSDnRZHlnuoLVeV2F/UsPfv8408OO0xVrx1/374wDKxZzHm5j4mCYu9+FRmgFplQae3bno=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB8856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261028144727099003)(4143699003)(56012099006)(11063799006)(5023799004)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261021121427099003)(10067099003)(261021123027099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3FWUW04aU1RU1AyNDIrT01BaXZSUDVkWnFlWFprc0V4dzlkaWNkSDJsTW9B?=
 =?utf-8?B?TEpBVWFUMmJjRTJPbldtenV1SEdkOUw4WVU3aVJGT2N5WGdZeHYxNm1rVEtr?=
 =?utf-8?B?Z0pHaTBYYTJPcUM1WWpZamdvMzQ3ZUZvZTk3Y0NwZUNQNGF6YnhaWmZrbkJB?=
 =?utf-8?B?b1NBMUtRdkNQckFDVnVmTk9KaXlROStReGZRYkN5dDFHNlIyUU55TjVOR1Jj?=
 =?utf-8?B?c3VHaU5PTzdWbmNvWlJsdTBscVJmK09WeUpFc2wwZGxTcm5IRDJZYk5YZEkw?=
 =?utf-8?B?aml2aGJIUWxMRXVJakphRU1nWDY2SFU5ZDkyM296bFZVeHY0OEppdVBoN0ZR?=
 =?utf-8?B?YkdTN1dCVTBPNmlWQVJtSzMvTExrK3I0a3R2a1VrZFZoYlpCZXV6MUtyMUZa?=
 =?utf-8?B?VThOQWY2NkJxY0lWNWdPN2kwN21VV01mL0daZVoydlJkT1JUbHdYM2MyY244?=
 =?utf-8?B?M1VDT3VUeUVIbzBLZ3hCeSszbUlwaFROVkVudDlBVGJSUFl4VEVRWUdPZU5S?=
 =?utf-8?B?emJqN0dUd3d4aTdWanhHdXVtT3Q3RTM3RXZlcEdrM1QwNmVXYUp0M25vUjRB?=
 =?utf-8?B?aERLNGMzKzRwa3VMOVM5dUxrN0F5SGxQT21lME5RelJxeTJaemhUNzRQL1Ns?=
 =?utf-8?B?RTdHYXE5V0F5TjB0S25mS0w3YUZ2Z0Q4aGdxejJQMHl0RzdUcktENTY4VjRz?=
 =?utf-8?B?Z3JMSDN0SDM3Ni94RDI5OEVRVTBkdEtoNzFlT0tEUGpJUmtTMjBPY3RYY1Zy?=
 =?utf-8?B?RkhLckp5SGUxd1lhdVFpVlliNElGN2tjcGc1b1FQN1BFeEJSdFBCRTZDQVFp?=
 =?utf-8?B?dnB1SVNYRmV5akNldVl2UVB2b1RkRitTZlFIVlA4U2JGZVh4TU1TOXY3c1Rr?=
 =?utf-8?B?eU5aYkNibUZOc0g2Z2RNTHhMU2tzNlBJSHhkcGtVYzR3MHJaZnRrMVNyMFox?=
 =?utf-8?B?NFZzdDN5SHpnUXpnWm1KaTl4b1pWSnQwSjEzL2NaMk1nQktwUFRzZkJSbmEy?=
 =?utf-8?B?bitmd2NFYi82TjZQTTlqQVZra3I5UWJ1VjBIR0t6M09YeEdKUXhKVFBHNFpx?=
 =?utf-8?B?YlkvU2NhSVU1Szk1ZXhlaXUrM2YxNlNLQlNXNGZvMEhjQWsxU2Q5UWw2SHNE?=
 =?utf-8?B?UUdmakdiUEp2VGFnU0xUa2diOGk0ZC9tenRtUjhGQUdXbkY3alp2NnNlTzRN?=
 =?utf-8?B?Y3B4VjUvV1ZWL1I4eTg2RTZBb0tGTjQ5Ykx1TlA0VERtMlc5UzRHc1gxMklt?=
 =?utf-8?B?SlpyZE1zNGhhV0F1K0ZCRXU5NE94QnQwN0VKcmVBTXNLcjJ3UnRjWllmY3pZ?=
 =?utf-8?B?WU1UeEUyMVd3ZkxTdURGZE90SWFjczhjS2JEeEpCSXlJRnJsQXBHVm1IV25Z?=
 =?utf-8?B?U0pmTjlqNTAzTHdENU44SUxKNENBUDllTE1tNmtFWXVza21OdzZVKzZhZHZ3?=
 =?utf-8?B?aGgzTndlNXI1azNiU2pEUFBoN0o0NTNjN25yZTFkdEF3NTFUZktIc2MxZnhB?=
 =?utf-8?B?VmhSbld6cWdCSWUrWkN4RGJ5TnVUYnA5ZytERUhuNWdxbnQyZGc2TzEwczQv?=
 =?utf-8?B?MGdtT2t4MnRKS3VoZWl4eTZTT1prTlMzSnBCOGQ2YStSRndnbVhzSGpPUWd4?=
 =?utf-8?B?QTRTdjl3Z2lSMVJOc2JhdHprVEFiQ0J4NmRjNnB3UWc5eFdLVk5rWDBSZXB0?=
 =?utf-8?B?by9RUlpXQWcyM3dTWm4vWFZkc3RSZVlvbmpkU3hmNW9hY3NnWTdPQzJiMHhB?=
 =?utf-8?B?VlVXYXJNazFxcjVMTDIwL0FiYklyM1lkS0tJdFc5d2ZDN213YTZjM2dGWXls?=
 =?utf-8?B?UjVmNTJDcWhrdWg2ZDVNSG9pQ1RVZzFuN05KcFlTR2p3bFBaOEs4MG9ucGpJ?=
 =?utf-8?B?LzZJbEozcHJqcDlHMk1aNTNFMHZhcHhUS3lOUzNySWlQTnhCMms0KzlsbVR0?=
 =?utf-8?B?Yk1Pb1RGdVl5OGhHWjhMYU5UbWhKaFhhbHFWYlJLK3lKMXpReTlHVG5JYjFI?=
 =?utf-8?B?dXBOL3VLemJSOXB5VjNWUnhGQTB1SUQrMzlUd0d5TUpGeDFncXQyN0VKQnJq?=
 =?utf-8?B?bEwzOWpnRVZTUnUyYjlVWllZcnVEaXg3Wnk5Q2kxU1JMWFpQRjJaTlppR1l1?=
 =?utf-8?B?TWMyTVZ4WjhTY081R1pIRWxBWDZWR2lDVldJbXVSeFVVK3JQRkhCSC9jUlJC?=
 =?utf-8?B?STdheXRKbENuVDJzRXVtLzRXd2xxQ0FHTklhZnYrcWh2cXNPQTRPc201VVor?=
 =?utf-8?B?eW01UFlMYXRhT0wrRGtkbDVHRVpMVFhscG5pOVBFb2NMVWhOd1pNeURNNzN6?=
 =?utf-8?B?cThoRnc5QWhzdXprNDFiRGhnVC9rSE1KbUkra1ZramlTS3hvYnJ6dz09?=
X-Exchange-RoutingPolicyChecked: o268OaTJ+ULCP70AUarsrtlAdM3UotdVO/lrsnTvW0r0BKjOALA0eQZtTL6JkGXgm2yK4bIOtKilVq4SRKKS5PKKNQqP0uG/Wk4c3xUJM6/as93oB0e7j8lHG/Bagu3xkIPGCIN4M/UXo8MK8iEpGzZX7/Uv3cbvaaMUPGN6KPvvI2wAEAB+AGLQNI+WUXKJY1S+gcx+oFb4gbBs1OrGQyVFb8oDX2tjO1Ico076F4F6SEjyN8Ze8o6XvAS9P/XZtTNMj/6sacnavlvcq3b94jKuPQraJeXKq8e2dT+cVrFhl5ym/H7FCAQDSm9CadvrxyGFd8c+FaOhAuv/xHBNkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 364f5420-4e67-4c02-a715-08df35b14d05
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB8856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 11:39:33.1696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiZ1YNTY3tn25S+Ko+PcXDJnZ90fPelebEbg1M3hGPaczB+ZOYr1B3WBvF1hLRR3KYE3//LTH3qIxRyhph0nzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB126088
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


On 29-10-2026 10:05, Purkait, Soham wrote:
> Hi Karthik,
>
> On 16-10-2026 00:37, Karthik Poosa wrote:
>> Expose fan maximum RPM via fanN_max.
>>
>> The value is derived from the firmware-reported maximum fan RPS and
>> converted to RPM in the fan hwmon read path.
>>
>> Update Xe hwmon ABI documentation for fanN_max.
>>
>> v2: Use xe helper for dmesg logs.
>>
>> v3:
>>   - Fix indentation of the max_rps struct member.
>>   - Enable fanN_max only when fanN is supported.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: LLM
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  8 ++++++++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 19 ++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  1 +
>>   3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index 0da739d9a816..5ee68aefa485 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -266,6 +266,14 @@ Description:    RO. Fan 3 speed in RPM.
>>             Only supported for particular Intel Xe graphics platforms.
>>   +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan[1-3]_max
>> +Date:           October 2026
>> +KernelVersion:  7.3
>> +Contact:        intel-xe@lists.freedesktop.org
>> +Description:    RO. Maximum fan speed in RPM for each fan channel.
>> +
>> +                Only supported for particular Intel Xe graphics 
>> platforms.
>> +
> Use tab indentation.
ok
>>   What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
>>   Date:        May 2025
>>   KernelVersion:    6.15
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index f2bd20f8b0a2..32016c5d4770 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -181,6 +181,8 @@ struct xe_hwmon_fan_info {
>>               u8 speed;
>>           } fcp[MAX_FAN_CONTROL_POINTS];
>>       } fan_table[FAN_TABLE_MAX];
>> +    /** @max_rps: maximum fan RPS */
>> +    u32 max_rps;
>>       /** @min_pwm: minimum fan PWM */
>>       u32 min_pwm;
>>   };
>> @@ -909,7 +911,8 @@ static const struct hwmon_channel_info * const 
>> hwmon_info[] = {
>>       HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | 
>> HWMON_C_LABEL),
>>       HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, 
>> HWMON_I_INPUT | HWMON_I_LABEL),
>>       HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, 
>> HWMON_E_INPUT | HWMON_E_LABEL),
>> -    HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, 
>> HWMON_F_INPUT),
>> +    HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, 
>> HWMON_F_INPUT | HWMON_F_MAX,
>> +               HWMON_F_INPUT | HWMON_F_MAX),
>>       NULL
>>   };
>>   @@ -1219,6 +1222,14 @@ static int 
>> xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>               xe_warn(hwmon->xe, "fan %d min pwm unavailable, 
>> ret=%d\n", fan, ret);
>>           else
>>               xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, 
>> fi->min_pwm);
>> +
>> +        /* Read max fan RPS*/
> Add a space before */
ok
>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon, 
>> FSC_READ_MAX_FAN_RPS, fan,
>> +                              &fi->max_rps);
>> +        if (ret)
> Should fi->max_rps be set to 0 on read failure so the attribute is 
> correctly hidden on re-read ?
not needed as fi->max_rps will be filled only if read passed,

see __pcode_mailbox_rw()
  90         err = xe_mmio_wait32(mmio, PCODE_MAILBOX, PCODE_READY, 0,
  91                              timeout_ms * USEC_PER_MSEC, NULL, atomic);
  92         if (err)
  93                 return err;
  94
  95         if (return_data) {
  96                 *data0 = xe_mmio_read32(mmio, PCODE_DATA0);
  97                 if (data1)
  98                         *data1 = xe_mmio_read32(mmio, PCODE_DATA1);
  99         }


>> +            xe_warn(hwmon->xe, "failed to read fan %d max RPS, 
>> ret=%d\n", fan, ret);
>> +        else
>> +            xe_dbg(hwmon->xe, "fan %d max RPS %u\n", fan, fi->max_rps);
>>       }
>>       return 0;
>>   }
>> @@ -1756,6 +1767,8 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, 
>> u32 attr, int channel)
>>       switch (attr) {
>>       case hwmon_fan_input:
>>           return IS_FAN_ENABLED(channel) ? 0444 : 0;
>> +    case hwmon_fan_max:
>> +        return IS_FAN_ENABLED(channel) && hwmon->fi[channel].max_rps 
>> ? 0444 : 0;
>>       default:
>>           return 0;
>>       }
>> @@ -1806,6 +1819,10 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 
>> attr, int channel, long *val)
>>       switch (attr) {
>>       case hwmon_fan_input:
>>           return xe_hwmon_fan_input_read(hwmon, channel, val);
>> +    case hwmon_fan_max:
>> +        /* Convert RPS to RPM */
>> +        *val = (long)hwmon->fi[channel].max_rps * 60;
>> +        return 0;
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 0349b24a8259..32bac74c4281 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -82,6 +82,7 @@
>>   #define     PCODE_MBOX_DOMAIN_HBM        0x2
>>     #define   FAN_SPEED_CONTROL            0x7D
>> +#define     FSC_READ_MAX_FAN_RPS        0x3
>
> Nit: alignment.
>
> Regards,
> Soham
>>   #define     FSC_READ_NUM_FANS 0x4
>>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS    0x5
>>   #define     FSC_READ_FAN_TABLE            0x7
