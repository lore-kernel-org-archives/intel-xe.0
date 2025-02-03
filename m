Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF0C02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 13:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240A410E4E5;
	Mon,  3 Feb 2025 13:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4PhvDZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4720310E4D8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738590882; x=1770126882;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=578oL68ZoebEJNbEcvZ+9nrerIUDVMKfGZ3dZ0p8UQk=;
 b=U4PhvDZHA6vGZK5vqWQZTaMD0zpXfpiIh1E03zai9hbsUMG9SI5PbhLm
 bYGSB6p4xzzNeGhuSUGqSfoEBCJX8QEp9YeHhWF855QgKvFFIr94fUMA0
 elXZ+68oS8HvVacJeVHIInHinORB9LL4BsRAhQCFRdUqtfYjhfa7VeQ3a
 3v9PwudWyxGEb5RcfPOo6sj0bBR1xbJhs1q3TSG4o7yQTirQve9TtG+kJ
 NyTFJvEN8H3a3LBu6euJ+KTpaPUBGvCx/csjNIf6HV4/48gyojqEVZOB2
 vnsS/t2SeSdD7R9WkEU2bV6ClQlHgGrYu5Fn//vA9AmLAUU2JYO5EF+OS A==;
X-CSE-ConnectionGUID: TojGUlm/Q26Yof5TZ4Zthg==
X-CSE-MsgGUID: 5PEldHNnTX+L1kEJl0eqog==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42740574"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="42740574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:54:41 -0800
X-CSE-ConnectionGUID: 1FDxyNzDQV+cnJoO2CbXeQ==
X-CSE-MsgGUID: nD88w+RgQLiG1fpHNB65dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="115293924"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 05:54:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 05:54:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 05:54:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 05:54:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbtyK4fKyK9P6nRvdoiSt0WsJJZX9dKcSv0W5bxuLcm40iZox1ibuSjzPzSg5GKtUqfKNCO/qk9vdYbjA8BFeDpbRUQ/+LRZ1mSlc7FF5OZOt9JSiayBcobFh3Kz4xxq30nVPXVksoQmFzkBdlfea7akE0lXfTaoDWYBgpL6Iv09mKfXFDLmughuhQOd1HxQbhJtoqgetPU3sK9Pny4jByH2eTtGi/e5vxF/ER9YC4p7AcSnk+kzHdBBrNmlbc/R7CjYMS6NXBwiQP4sVKX78V0X+1Z8X6+T0cGJxaRczyd8frs4fQx/eQ0vGzSOvew2MONOM3t/CrW7duyW5Ben+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5/3jSS3twL45Ysu+UMeS532JUjFRaNnjCC9uUJhtqU=;
 b=RFaom++sPIUJvCFSyy4gL9Ykg4hSbvlyeYK1wiESjksQMLI813nsxEJzIZD3ZXPu+H3rC+Rf3rz2ytM6tfgDUC3eTu5BmIAuF5VE5fKnyjqeQed+thVbnCzB1Y+h5PXo6K06pOibi+gKfzTqtBeHsVYknYQvvJUsMGR8hcwsbBjZMsP3gByBxE2srpbO+Zilh2EJjXmk2a8/9qKSb7NKh2Ib85UZaWflbxAo19PrpZvsrq8Czjv7dg/kMRk9ASSxlkoKLDvtInXjIpz1g0EOTA20Od2G/BRnGkThK6+XfG1G0b/umkQ3J4QQm50bQYxeP8CPoWS9OlIyJzVF6Iy+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 13:54:10 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 13:54:10 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Farah Kassabri <farah.kassabri@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/2] Cleaning up code related to VRAM regions and its
 initialization - part 1
Date: Mon, 3 Feb 2025 14:53:57 +0100
Message-ID: <20250203135359.735832-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d13161-61af-46da-b545-08dd445a3be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEJsbUxmMHhrdUF3YTd5TzdyMHd4Y1RrNzJOWFFYT2lOWC9sZWk1OGZhWW40?=
 =?utf-8?B?TFB1VHVHL3crVEVxWkVmN2hERWJ4Q0cySkJlQSs2SGlINFhadnRFdkZoQm5F?=
 =?utf-8?B?L2tDUkphSGNMV25tVVA2TERXN2MvUXVuSDJQZUxlT1hNczloY0VuaW1TOTlS?=
 =?utf-8?B?bklIa2x4RXJtSWFYMU1GaXFJNGMrV3RoK09saWprcUV3dis0b0NmekxJaXRR?=
 =?utf-8?B?RzVwUWhBUXFHbmhHNTFmWDFFckNVK2N0bEJnNDVRc3BLbCtXVkZMRE02dkFZ?=
 =?utf-8?B?b2l5SzMxS01IdHNQYVNoNTF2T3Vrd0kyK2ZLNlU5WGRJeVQzaGNvNmtiWkFR?=
 =?utf-8?B?bkxxcTdlWTN5L0dCK0pkVFF2YTlCSE5rT0h1RVh0WEpoaUJ2YVB1eHBWeU5n?=
 =?utf-8?B?Y3M0YzR6WXdqM2g0OTNRK0tIU1c2NExmTVdwV0o3R2NGK2RQdlYrVGw4Zk1z?=
 =?utf-8?B?TGVJaHNyWm9pRk1ucW1sRkVKajVyaW5seHdIMnAwN0JSKzdtL1o2VnFrbTJX?=
 =?utf-8?B?L1ZoQTNkdFZ4bHFLRDhhc3EvZzYrcXVpUnNKUUFybENMaW42RUJFTXBjVlJq?=
 =?utf-8?B?RFZLSjhnT2I1Z3pWSmRsMEZPQS9takY1TUVyYkFvTDVOR1p6YzVzWURQcTF0?=
 =?utf-8?B?OHcvYURXM0tKc0hCTEZnTjYvQlJNZ3d1M0xibllKZldsaDFPL2tBaXU4bnJ4?=
 =?utf-8?B?bGl5Y0JVMUNvZ0RXSjRVVFZIYjdtSStsd3Z5NDkzM1l6aWZmSWlHSkdGTXVG?=
 =?utf-8?B?SkE5TW52REhHcDNUNzBFSmVCMW5pM2pua0tLbDZ6RHJBQ1VwNUZYeFRweVpC?=
 =?utf-8?B?OWNMbVdTM3RvTnJ4N2F5VGVzOHBiMDNZc0ZkbzNGdlp4ZjcxZFduemdxL0Z4?=
 =?utf-8?B?QmpXZDh2V1EyakdUVFZ1dXdmQ1E3RnNDaVNscDQraWd2aEpDRkRlSWF2bU96?=
 =?utf-8?B?azQrU3ROWlhQTW9BWkJEK3k0STdCTnZ1RGpYa3Y2KzRhckdsS295QldRWFMy?=
 =?utf-8?B?Z2RtN2RNeWN6SWd3TUFMN3UxVmFYdEFPR3dFS3FhWTd2RXB3SWFGN0tEbHVv?=
 =?utf-8?B?amJ0ekhXVFV2eGtzc3NaTXN1a2hoVXQ2d0xvZWthUGVRaUU3QXV6WjE4Q0pR?=
 =?utf-8?B?RDVKVXdtTis2eXFrL0x3b25QaTd0VlBFK2ZTeEcrN2xyNkQ2NGpqYy9jZTNO?=
 =?utf-8?B?L1E5MHFncENQZFB1ZWtVMEcyTzFQSml5Z0MvR2ZiU0NyZ3dBWnF2WnA2VVBR?=
 =?utf-8?B?SVpCQVNJdVI0MUZVM3B4VitieFp4dWg0T0I4SlpoSWx3aTZtQTNrWjFBd1Bi?=
 =?utf-8?B?TGM1YUhQZVAwL1p0OG1LOFBheXVaK01od0Vhb0V0eldMQ1pkYnlNQkVEM1ZE?=
 =?utf-8?B?NnBPdmhtYWJzUG9ibzBEa09raVpkb3NUZGE2UGluczFZZjZ4VGx0aktJRVRy?=
 =?utf-8?B?L2FnbXBJbjRURUJQa01vSkk2RzlBZ0tKZjRuNGhyQUNtSWdBTFRQMnNjQ1VL?=
 =?utf-8?B?TFpvR2ZPaTJiSWR5aWc1bEpuVkx4TGRBR0YvZmhoTy9NZE4zcXpFemdNOWdy?=
 =?utf-8?B?cUVDOFovS3BYSXRvR25ZTWM5RzhFWnhlWFlyWDdYSkwvZXpNMVBxWkkwQWxM?=
 =?utf-8?B?YjZHTXhrcDBxNkJaOThXek9sNUdjVGlKU2NLNjArWDBpY0VDQVo5eWZlOVQy?=
 =?utf-8?B?QnhHb3EvSGFzcTVwQkN1ZENmbll4QnE5Y3ZkeFRnaXdmemg4TUNzTFVXZlE1?=
 =?utf-8?B?c3NTTWZKK3U5bVdvSGVZRUh2b3ZHZ3ZHclFJMm9rSCsyU3AvZTRMSUlraXpa?=
 =?utf-8?B?T0s4dWlOWHRUQVdIZEtXZUltektHQmYrTnpyUGRkek16YTFjN0Ztd1pOcDJP?=
 =?utf-8?Q?eKRPkwxKZOZKR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlJCWndPU3Z4OUx4VzE2ZnJuMW9mbVRsVVg0UGFkU2E4VU5Jc3VqVWpqcHRE?=
 =?utf-8?B?ek96UEdEMnhnMXB3dmREYVFLdkgwUGpNWk9TaEd2Z1hWeGRoa2V2YVF1UXQw?=
 =?utf-8?B?N25RaE1Ray9oZDhUSExlaXE3b3ZIbWxPQ3hwdkMySGx6RkUvbjd4akxXWGow?=
 =?utf-8?B?QlljM24xbTRVbE5xWFNkRzFQK0lGL1JEMGdGY2xHd1RETmVEd2hqK215b0lq?=
 =?utf-8?B?bkFhajcvcm5CUW0wME9GeWVkRjU4clJhZFgxelFFcDgrYWxPamd1NzBTcmQv?=
 =?utf-8?B?cWFSK0d6cG5CQlpWSTFLTTJMdGtuWlVGa1VZeWcwQWpZc2V2RFd4c1R6b2FH?=
 =?utf-8?B?YzdocGFDd0ZNVWFGenU1bkVwdERvSFBRa2RpOHNqSkQyY3pkTmpXeWNVNng5?=
 =?utf-8?B?K1g4YTNxeE1qeU1jY3NHYWUwd3B3OTZCSVpoRjJMaEN0amVMT3F1OVRYcGZW?=
 =?utf-8?B?RUhtZW5rMngzVTd6bjZHcDZPbkhLNXd6S0xLMG1HSW1vWTk3RGJrQlJTc0pI?=
 =?utf-8?B?K09weHlQTGxrUGpvV2lyMTJFRjJ3bm1YOEVxYWdRa2FEQ1JiTndrYmViNFNR?=
 =?utf-8?B?WnhadmNVK2FsSEtEcHBEcnJFTzlUWXhMTnZLeUMvY3hsYUNBM3BmbGYyaHA1?=
 =?utf-8?B?U3V3N2JTK01mQ05FYnJod3JmamtqazNCcWlUYjY2MlpHK1RYbHlTTStpdEVL?=
 =?utf-8?B?WHVnK09OOHFEVEYvY2J1MUFrWXNXNS9WZ0RzL2hVSVBUMVA4ajdBWm5JaTY4?=
 =?utf-8?B?em1sODhBVnlyajAvbVBGQVNCbXlEc3VXRWdxUWJCblJxUGRTSTlKcnlORXhH?=
 =?utf-8?B?RDc3WEYvQkRIOUtEZDFwZU9Cb0YvMXNFd2dxd2hnT3RsR2RUMkpvU0g2ai9W?=
 =?utf-8?B?NGpjUGdWcWxkZkdmekhQWHFMMzh1K2xzWDl0TkVIck42WVZET3RQU2U0aDFW?=
 =?utf-8?B?bHZiZWh5cHFhcGFia3pLaWZiMDZhRDNtRVJiZkZ1d3lUaHJScTlYam1CQnpT?=
 =?utf-8?B?UWFzcEt6MEozd2NiQkhZaW0zOWljaUR6UVltbzhPczlNaFl3MDBUNDdMTXRY?=
 =?utf-8?B?WFkvRTJ6M09kOTRveVQyYWkxMGQxWVoyaW0venc2Uzk1Yi9yM2VUenhGRUYz?=
 =?utf-8?B?SXNMU29NdlE1RVh0UmsxTlNaOFJxZGE5VURQUFdQT2tObjdRTlBnbjdIOEx4?=
 =?utf-8?B?REQzVk80OXlZdjdFdDBTa29TUUVOYkJMV1UvR2ZkOHBVUmhBekx0L01TTUJp?=
 =?utf-8?B?S25qcS9UK25uVnl5a3lQVHlNTnphbHdyN1pMNVhaU21UVlhYQ2s0R3hLQ1lm?=
 =?utf-8?B?eXdjYzJoVENTQ1ZtRlZtRVY0bm5QcFQ4enNCNFkwT1ZZb3llMlJwVThMRytZ?=
 =?utf-8?B?VVFta2pJZ01DcDZiSGNkcmdQN0xxdlZZclQ5cHVxTW1ySTBWZ2xIb1ZzZysx?=
 =?utf-8?B?OTZzT2NZcHAwRG5sSFRHR21RMjFEOHlxdlNHT2hFQ1V1UlpDUXcvbEJSd0dY?=
 =?utf-8?B?bkVpWW1STFRYVXZGZEhoNFA1Z0s1Q3o1c29jZ29kUU1YYkdKU1VsL09xSE9P?=
 =?utf-8?B?cFI3MFB0T1BJbUphUjU3M3k1MzNxdUR0RDdwUGFCckF3Tk1Qekxnb3FvUjhR?=
 =?utf-8?B?TDUvelNQV2UwYWNscGxKQUM0WjROOFF6OEY4amI4TlpaeTBlWUlqZndSNSsz?=
 =?utf-8?B?eDR2ZEQ1aFNEeVdCMTlxRk1CMmtOTFNDWUx1a1lFU01VMnFQeW4wWEFrNWxr?=
 =?utf-8?B?dk11OFNUZEFrc2JCajJRZEEvb1pwYTRYeDgzb0xiM2JBSHlKbStGeG9TWEFj?=
 =?utf-8?B?bGJEMUE4UHBZMVgwQWkvKzFkVEJLeUJCdCsyaURLRTFOZFpDOHhla3lPdkJM?=
 =?utf-8?B?ZzhiOC9lODhaVS9UbDBGTEpOZ1BGa3V3WEtUWklheG16OU91SUVNRlVvaXFB?=
 =?utf-8?B?TGdETEVHdm4xNlRYRFVIMFZFQVRJUk9jQ0JrbVBnNDVuOGRMVkZaSE9zdU5J?=
 =?utf-8?B?dS9rSDRNeXpmQk1kSEFqSmlFQ21JOTdCaWMrcFNQdkJPcElNeUhkUGhuSVNi?=
 =?utf-8?B?KzNpNWpSc0wwdFB2R05CY3ZTUjVlbEpCSW16Z2kxTkdKa3FVK3NnWlhkRDNq?=
 =?utf-8?B?eS9FSnhYZTdhZ2p5SmlZUk9lMHdvemdnZktsbHZTMHRVSXptdFF1ZkZDczhZ?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d13161-61af-46da-b545-08dd445a3be5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 13:54:10.0888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TpSO1YkVt5LN6mcl6oL3Eq/Z2pH5SxttErwLJdAIkW1WoKDUeGR2bdJY0838njswz6qFK8X9bSFn1YJYVmMqLd6Dr1uXcdD5em1r6oCuXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

I would like to reorganize the code in the Xe driver regarding VRAM regions,
in order to allow in the future easier extension with more VRAM regions and
other than per tile ways to manage allocations in VRAM.
I would like to start with such simple changes as renaming the structure
xe_mem_region to xe_vram_region, to stop pretending that we use it for
something other than VRAM regions, and in the next patch move to this
structure, the field responsible for the TTM manager - this will allow us
to keep the things needed to manage allocations in VRAM in one place.

In future patches, I would like to make some changes in the initialization
of VRAM regions, and allow for dynamic allocation of these regions
depending on whether or not we need them in a particular case. Finally,
I would like to introduce the possibility of a separate VRAM region which
would be dedicated only for kernel structures, which may be necessary in
the case of SRIOV for future platforms.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Farah Kassabri <farah.kassabri@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

v2:
 - remove xe_vram_region pointer from xe_ttm_vram_mgr
 - stop use dynamic alloaction for xe_ttm_vram_mgr in xe_vram_region
 - rename struct xe_ttm_vram_mgr vram_mgr to ttm

Piotr Piórkowski (2):
  drm/xe: Rename struct xe_mem_region to struct xe_vram_region
  drm/xe: Move VRAM manager to struct xe_vram_region

 drivers/gpu/drm/xe/xe_bo.c                 | 22 ++++++++++++++--------
 drivers/gpu/drm/xe/xe_device_types.h       | 14 +++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  6 +-----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  3 +--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ----
 6 files changed, 24 insertions(+), 27 deletions(-)

-- 
2.34.1

