Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941AE606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H0G/UdrP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ABF10E147;
	Mon, 26 Oct 2026 12:37:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3DB10E147
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793018245; x=1824554245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k5la5LFEeleDPaNBZmFyXgPVXqp7FTDXrXYona6mlYU=;
 b=H0G/UdrPCjR2qRn4MNaCYwvNnrMF0HeewqqSRUy3WO0QeZsZ0bCmR98A
 W3e7Qx/LcWipdBVaqTfiqD3JbeKsw+nmc1vSwv8DmhKZ5BHYHLy/nG8c3
 w0CE6bZXD4UDXbbczMDVm9/EBbu/hUFu8PRPazOruiw3GiEjezhIQQQHt
 pyymssrzn6+8w9obdTzDkNJ9vfFbVDZiDD3Xxl4GHFQO/HG7TI8+bc96g
 +1SxEWfyUpF/zoK4nYVF0Qf/2X1ZQ/smeYLOR6DfFg4z5ydi8c4gTBgwb
 EQwluhHAV9c0EdfztavWtmzDaJ46Tk1N2qbshoZehNPs15KQjU1Stbt9H w==;
X-CSE-ConnectionGUID: Hs0+LW9zTjuh4Ip0xAHKMA==
X-CSE-MsgGUID: QHY4XgBGQYS12uqGCVjZ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1585284"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1585284"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 05:37:25 -0700
X-CSE-ConnectionGUID: 6nU5LZwvQU64NU2g6B86iw==
X-CSE-MsgGUID: T39LvOo9QVSDdGImPS6xtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="6110683"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 05:37:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 05:37:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 05:37:08 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 05:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYcKhQ3g+JEPVkZLecaaTEyhS0zU4SPXuv9xhBmZxQtKSZk/0AoSoddCJOA/5uHPv2oN7P6tCwDiNSX4GtkmtCOiQKzMVIMdQAo5+Zq1PLAohDVHsq9JvCGwl+q4NJ8zuMqIGrc7A+3EmhJo/Rb7fubH/cThWssyle57wsbHq8+GLPan7oT/8WCTxHkexs/DDA1gM1VhSvFdJqYE68X0Msh2xe0A895wlFXQoJ1g8EvGyXc/MHbpw9GK5Cv/+DBzGZAZ0Zq6p6Df+uSHwwjXyKs9NA1Q4Qtp4zSBOPsRY1hfu5p8dGvLNVoUtwznu9enlUgJpWgBFaZZhUaTBp6LCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eroYckWdw6BlVszP9li7ONSLSEA3rXbmyUfg+UDFYmk=;
 b=MG6MD4crT+JnnP7rQT2L+FD434AxJ2zRG2lMcBpgTO5J/4YvXIsuJYvCj26sWk+fxn39To16XJ2nEJMBA7zqim3i+TJKrLjZNOlk22mmXHMXvyrhDf4x22EiefLsRMiG8GkyeQQPrtSxMfla++a9iU4uEp9N4KbCD4ihUS34jZtW+4DgBzhnUknEWgS3GGlSSPMUKWecWkOMKVDrAwXxXnztmANt9nwkg+aa9vMCJtsSXXbZ1lXY+a7d/0Le2UFbVQSBi1c7hGoEl10ksSnLKWfLiSvGBVzVE3Jy798kjFRTGpG69h6lB3lBmxjc7Mc0XGvggm6bteorIbwGNKe/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CHBPR11MB144368.namprd11.prod.outlook.com (2603:10b6:610:400::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:37:01 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:37:01 +0000
Message-ID: <c8a8e54a-df3f-43cc-a5b5-ec67597898c5@intel.com>
Date: Mon, 26 Oct 2026 18:06:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Use overflows_type() for temperature
 range check
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <jani.nikula@linux.intel.com>
References: <20261023143632.461084-2-mallesh.koujalagi@intel.com>
 <e4839979-963a-4298-9fef-5f4486a67442@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <e4839979-963a-4298-9fef-5f4486a67442@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CHBPR11MB144368:EE_
X-MS-Office365-Filtering-Correlation-Id: 069273f3-196f-49df-4ef2-08df335dd4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261021121427099003|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261022115727099003|10067099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1a2W9+0Y11z1xIY2zYLEjzfo96BPobgkZE9yqOcXysTb6iVpLgsH5PoQ+Z8PNFEPMD1a56BJvtUJoK82qAVNJqHJFMVJl1L15d4tF5egtdFqqpd8zE25u7INfY6bqrGEBV5K70WNq8jYj5GmZdL2257i7LC5V2bYnyFy5otnatvOlIZRx8ulzBUXW/SVTAMdiTU1D/UOvCZwVS8O1GWND56uylh45Os1kNxFaHBxfz0ydLPmVVKudaqSDGjq2hlb1jTM8BxnA3QwMurYobUcSixXmTFSJnKAiblBAHnERoTrBneyxJcp2x/GluLGUtEra9NX6PivjmUSdOM3425La1iujTKohcyUMBliviGvqgzRvXBNjVoFM40+/MwP/fJzmHVJLad084baFOCANPDHSfRfSPZ1Y0kOZOTCd63HbjTxhBwgn2cLHDTJzfMCsTK40o5X6lCrgVKevUjGTW6e/iWCWt6oCArIar0MzmMpB6e1c7YREGQbx/kKVoy0jB8IXGa7oWMAyYMPjc87+QRJFp1Y11d4WS0oLg+xQbNrCV6H6FXAuspWmbp+QrOaQ4dXAimEzALDvO2wQbOZsLuiJmaKxU4kwib7AA79vuFSTQjULBKzgaku1+OS24NvzzRS4ndgwGT5lUYqrtL1UsBwGwyLu/E61Du7wsHRgOk86kU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261021121427099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261022115727099003)(10067099003)(261021123027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXVUYldwQUpCUncxTklJTnJNdDlqMDNML0NoOUxiYUZuS0VldVI1T1dlUE9N?=
 =?utf-8?B?S0hMKzZjSXBKZyttY0tHZndBRWMvR013eXZyWk0zdjlOdExleEFnaVEvWXZ6?=
 =?utf-8?B?Zm52ejFzcTI3MFI1ejQ5T2xwcEdhNnJ1am05cERsbEFNMTFCQUpPaXdPcjZz?=
 =?utf-8?B?SnBERzd5UlVJcTM1OXMwVzRkSGVURlk4RFVxdFJ4REx6MGNtYmFSMjN6eG51?=
 =?utf-8?B?S042cGIxRWw1MUVmZmFtZlcrK2N3RTQ5am8rQTlzbmZRWmw2WkMzQVR5c3ZD?=
 =?utf-8?B?Nm5ldExjeHBDS0cvT0FUbUdxa0dIV0NvMzlFZWJaZ1ZDVlgyOElwLzdoV2JJ?=
 =?utf-8?B?Q3FodktPMTU2UW1iWlRtdkZjeWpTaDUreVlzcHZmeFlrbE0rSW1XSlVhbGpI?=
 =?utf-8?B?Slhnc2Fib28vMDgwMURlc015RnNIdzBFQk5qWHAzL3dKWWQ2VTFLWGR3VXNv?=
 =?utf-8?B?UzVCMWxrWkdGUzd5ZkV2YnUxS3NValFzdEIyaXozcUFldnVuZnllTFk4TTBL?=
 =?utf-8?B?cWF2TGdmSlNFMCt5b3lVb1lYWVZKTmxLTk9qSFo4QzNUT0xwbnR3cm4vblRX?=
 =?utf-8?B?bUR5ZkRFYzdONGlQSHNPUExvN1k2YVh2VGFOQm1QNmpMOVFJUkxKUm5hdVZH?=
 =?utf-8?B?cUg5cGw4c1ZCN0RjVHRLVzVrWWx4YkJHb0lnUVovRGRVM1BTSmlPVTRsb3ZT?=
 =?utf-8?B?TzhlcGQwOVUxbVBvWFd2NmNjRFMvZFJTaWpuT1pLSnpQK1VhVS93NHBjaE0r?=
 =?utf-8?B?bW0vR1ZieTNSL2JGQ3hNNUdZVEdtMFVHYnFMdjVKQmdMVVhDMk9DaFM2QVo1?=
 =?utf-8?B?b2pwYjZxOG5SVjdpWkk2enAzUm5PSmJNOTBGWVdaZmZuQ09tUlkvVlFnUXF5?=
 =?utf-8?B?dmVWSHJCcVFQZXFrSTJYYnFvR3VXOHlZNmJxV296dGMwS0YwaDk3MFRldHFV?=
 =?utf-8?B?UWdKaHcvOTFhbllURFdPemdmQ1ZLMm9leU5oWU9Oc0Y3RXc0N3hnVkhIODdT?=
 =?utf-8?B?WEpFaHQyOXBxbFBJcm5xNkt2VzNMbUJwbkFBNGtFcXl2Yk9GcjJuTEFncjVS?=
 =?utf-8?B?ZUUvSnQ4MENrcCt5ZEVyVUJKN1p0NmpVbXBnczkyVmJJY3lhNjh0cG5PbnF1?=
 =?utf-8?B?cSs3VjVMeHVIbzNTRmtpTGRaWmk2UnVsRzkxOHY4aHQ0N1AzcXlFYmxlRkNm?=
 =?utf-8?B?OEI1STZQaFlMM0x2V2htMis3OXc0MTQ2L25ZL0FTQXY5WmhYQ2hHc0NSWkRC?=
 =?utf-8?B?eHkvK3lNZ25lRThKa3lmMjE4VW1FYUo2WGxOUE9mbWxSdTNxUnBmRGhjTE1p?=
 =?utf-8?B?R0pCV3FEZnZ0ZGFLbm5HOVBFUTBPY3dVbTZrV25HbUpFcjZJL3VzUFppOTdY?=
 =?utf-8?B?a3pPckJRV2MxbHRUcUl6Wm1FNW5CZjJMSUdkY3JOb1BKdU1CRThCZjFMbmpO?=
 =?utf-8?B?bTd1TU54U1FJZkVnZjNrTGdTd1dXcy9hRVhJd3dWeGd4cDdSTTNIdS9jV1gx?=
 =?utf-8?B?MDhKQ09HbUxoZkp1SUFQK1l3ZVViaG5BMDBmR01yQWVSQWxIVkdnK3JhdjJC?=
 =?utf-8?B?Mm1LUUlEaDk1eXNPKzNxMStnMUh6cmRXSFM0cDBSc2JZclYzSzVHOVhEWEVX?=
 =?utf-8?B?ZjhqN3RFZ0hCSkRKMjU5d1FqZjk0Lys4ZlduYjBtd1VDTUUzME5SeXhremIy?=
 =?utf-8?B?YTdJVFlkZ0FTZGtRZVhVeDhMRmdkWnpTaEw3dEJ2UDRJV0JNR1R0OXlIbXJz?=
 =?utf-8?B?U1l2cVZkczdjVDJTMGlGMm4xamF1RTRyU2RNMDBzdWhjSVNqNHRuRE1XMlpF?=
 =?utf-8?B?akRLNXoyRzlGd3NDbmY2UUppN2RnZG5BQUdXaTdsRVhSOElRQ3BVaHZSaDFV?=
 =?utf-8?B?SU5vM3NLQnpWSktPMXIrUUhPbmNoaUl4Ym9LVlppQzlqOU1TSkliQVg5TEE2?=
 =?utf-8?B?NUlHb3Z4eTQvVHNqMkVHbVJJQzJmR3loMVJmdTVkb2ZYNjN0ZDRVYUR2b0Jt?=
 =?utf-8?B?amtBRVBkdnRYQnNYN1RaMlBtUEhQQ2FlOEtoMVJtdFBqQTlGdXdHRTBaeW9q?=
 =?utf-8?B?elhCcU5GQjJaNWJVN2RIK1E2RHIrRzUwaU5LUXUwQVVudWhtRlpHaGNFU1V5?=
 =?utf-8?B?U1BwUGZaT1BsRC9ORmJTcVFTYXFNRThqdEJhS1VWOXI3YWE5blRNU0U3KzB0?=
 =?utf-8?B?WEI0bXFkV1hud1BiaStEZ1VrWERVVlFXMm40K2VTb2JwTE5UTGxpcC90WmVE?=
 =?utf-8?B?dTh5cG1GMDBsczI3T2lhbk9LUm5XYkpjM0w5ZENhMU9QZnRScTB4ejVoeE5l?=
 =?utf-8?B?TU5QOXdYYlJQRVdnbWxoekZBZ0xNTkk4M3VYMU5hT3JKeHVyZ3FMb1p3b3o2?=
 =?utf-8?Q?j3kIMkaJ+yx31wEg=3D?=
X-Exchange-RoutingPolicyChecked: FeYs9iPan6+6RA83ojPw+DuVDiEKb5sY10IenGbnDWfrehqq1KcAoapzojfVo7t9fkRhmzXZsJRYy9SAWXFs7cuThuKOrFc/hxtBz6BotUkT3PgpsgNyaKDBrQXk/ZyOx0RFuu6N5GtqLfOFwEsjNifme7CVELlZDVKK7SWYqt2R4gauc8who44QdRBz+IFCzw06+0W9Zy9ZUqgaBojABqGjkDyeSBewMtr91lwFGjRl2V6XCACz0UPEPFsmv26QiF2D+N2CoBRkY7ClRWqwObB6epr7hOA6pOFeSykNMWAv7O6Py9lQaRY0JlkRAuZK2T8WlH19FmyFDGr+z5rySw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 069273f3-196f-49df-4ef2-08df335dd4df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:37:00.9537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZuY/JGKaFizWTnGxvwIseofhYeWG/5IZuOqkBBgRR6BpFfGAirKlEmzuishyJsAdyeF0Qiw/PQMh+fw4DfImnoBeABIEnlWLQt7rq4b71c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR11MB144368
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 05:04 pm, Poosa, Karthik wrote:
>
> On 23-10-2026 20:06, Mallesh Koujalagi wrote:
>> The temperature value is calculated as an s64 before being stored
>> in a long. Check whether the value fits in the target type using
>> overflows_type() instead of comparing against LONG_MAX directly.
>>
>> This keeps the overflow check correct on both 32-bit and 64-bit
>> systems and avoids architecture-specific handling.
>>
>> Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers 
>> as IEEE-754")
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2:
>> - Use overflows_type(), instead of #ifdef. (Jani)
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 42acfeb8818c..515b288f18e5 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/hwmon-sysfs.h>
>>   #include <linux/hwmon.h>
>>   #include <linux/jiffies.h>
>> +#include <linux/overflow.h>
>>   #include <linux/types.h>
>>   #include <linux/units.h>
>>   @@ -1322,8 +1323,8 @@ static int xe_hwmon_temperature_decode(u32 
>> reg_val, long *temperature)
>>           value = 0;
>>       }
>>   -    /* Ensure the magnitude fits in long, which is 32-bit on some 
>> arches. */
>> -    if (value > LONG_MAX)
>> +    /* Ensure the decoded value fits in a long. */
>> +    if (overflows_type(value, *temperature))
> Is this change addressing an issue reported by a static analysis tool ?
Yes, it's reported by a static analysis tool.
>
> |LONG_MAX| already reflects the platform-specific size of |long|, so 
> is this still needed ?
>
On 64 bit arch, where long and s64 are the same width, however (value > 
LONG_MAX)

is always false because LONG_MAX is 9223372036854775807LL /* (long)(~0UL 
 >> 1) */,

As a result,  "return -ERANGE" path is considered dead code and gets 
flagged.


Using overflows_type() makes the overflow check explicit across 32-bit 
and 64-bit arch and avoid flagging by

static analysis tool without changing the behavior.


Thanks,

-/Mallesh

>>           return -ERANGE;
>>         if (reg_val & IEEE754_SIGN)
