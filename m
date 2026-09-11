Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23D1C88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 21:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD1910E1F5;
	Fri, 11 Sep 2026 21:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1waUwsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5290610E1F5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 21:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789162392; x=1820698392;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4lxHfF/c2EGMCKQm0XiHGa9GZRTMZGHMi51HmSqHI8k=;
 b=O1waUwsla5GFKYDg69Pb6Ye5RkIKSOP/bYP0SQmkQYSX4yTpeL/EncZD
 C+sPqspl9zBHdNYpfXCQ6tcZ8gL9QKADpamkyc2g9ncsUEDyixLUMb6/y
 4mPfGpCITLn6+tyxqI9f1zRGtqc6tFzYD/uDsTCk39B7cCTUL/uO/PzBw
 QYTawQqIycB5+YiEsE2Oew3nCvKMAW05nv5cDMTZ1Oxlm66I3R6nLbcOC
 WIPnci399HrpDx3R02tHY3HczaJWaQjFPgjO0Q8TO2D7h8ntXcyJmr42v
 mI1Eob02LjwFRcANf0VZpjk2SSmiNPXDweDLlz2NXm58wUsOwoDaiYlm7 g==;
X-CSE-ConnectionGUID: uQ9RXznwTROrM+aNGlWHPQ==
X-CSE-MsgGUID: g915xMHKRy6w/GBC/PAeJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="88769952"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="88769952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 14:33:11 -0700
X-CSE-ConnectionGUID: 2vNZ65bKSQqqjk4PU70jpw==
X-CSE-MsgGUID: ot6fdzVcROmjgq9VCAC7qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="267739112"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 14:33:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 14:33:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 14:33:09 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 14:33:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RX1RqX5J/Wiidaw6mIZtTq4CivnXJbyYwfoRLj4P0UapKHDhge8ttMD2nwbsES+qwb8r+P+zSii5VA4DyRvMyFO/GfKW2tk2xw09YnPoMwrD1Goz8QQDaNJ7j2D1FATAHH6u6eTx0es1mM9zFE6TEU9vTezlvAYHOAmAfgjyj6q5WeVs0pR1gB954+0DeN9NvMyW1sP4SsgsP33UrkgmFqRgHkHT+J2HKb1VLSqrtE3lKRlVJ+nw9RS8Zj8nfDM5Ndz5Nwo9FF1Fo5gzdR4c4FNjOmdaHW7LsPb38WApotwxncrArEMOns4Yv1xZ33VXCFU+IyBmk8pczB54lJnZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uy2KFF3c7d75zLZoyMChStkgVyvgMRu/xKh6180FABw=;
 b=vylbiVemY/eHg0EDKMYmUu0CRMa05Y1axQuKPdlc3Lh1Ec+NdYGoxlJrM1/pgPnQnOwnJdfK8joYnbqU8mXEFQIAXFxq98DVcVZot/+FTWsL1xWctf01Wfz7VdBb7orwSLff2bxMi/zjsVvD84eBErel/UaJR10CXOqe7YitQ1vjrlnLeQgTvclU4ehAeEa9G/BtHoLZDzSZ72jql/R2eyGM02qZbI0iqFZX1U/6rbDFHSGIBl0Jlf6oI7qIQLbr7/oBe0LsH9ypmt3d2lsE4/zkFNEZiwhX4e3xBPFmgbNrCigFXdzqiPRbfAGROSq5rvsZxYuGooF/dFEEMVvq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 21:33:00 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 21:32:59 +0000
Message-ID: <40ec4b1a-7c13-4a5b-ac33-3bf8c03d12db@intel.com>
Date: Fri, 11 Sep 2026 14:32:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
To: <tilak.tirumalesh.tangudu@intel.com>, <tejas.upadhyay@intel.com>,
 <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
 <20260909161844.125147-3-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260909161844.125147-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 2716db63-c6a1-42a1-7c34-08df104c4096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: P0qR7nNA3acRvZeKMf7FqiNBrW9cwkoPxLjIhH3pN6LHlzPZ9FQwIYSNWhYzCoFGnQSSbwF0q+5hghBq2RRtPys7tA3Rwq+HonCQAdIbC+V8sz6QKQnHgU5pMxs/wp1tyLN1xmJ4XeJ8uwPC+2E2IU8/3ZkW+rSofwgi6zUDy/XmGsOrqE5P3hdZ3t0wr6AoDt028iCda6PZMQNRhDI+uLfPjxujakHJ7KVfnYnRM9Ch0tBkTfUK8g6Wg8YMVw64gVg9fbAzR7ImEYNpFxDZDAlRZ7A6q9sK1EClUfigdeCGuDMUJTqVThtgEYs6A+BJ0DxVF3Udw7ZzxUVwJt6sMGVCToRUYGVJ/te/70wl9a+wNX2TR13sZ5oaju+Mn3eRAbBDBESVtt42bUeGP3ghZgB3Fqt5KrgwD1UtNuNWe/xTajN3RXdPmWMVg+uwA/lwBolU3kiPbrq91BhyNH6Omq1nZbCQ83BVACnsihihsbzJYZZVO2cVLQ5Zfr3zjZBu827Sd8JvVPsASrMWIPH1LfjxjzRHE2iVnOsDwyoNFcAgFfvtagjNvnPqsq27q9ki+u7cDCveoeZ3a/YXy/GtVpVH0BDYBfvlVeDKG6kD3/XR19WFUymJIOOLC22J3lzXk+XbyoS+OAbv1ARMEKEBZU7hJnVt7U3xzoL5m+zo/D4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHhwWkNRczhOWldYU1hhamRXQ1hwWWhrU2NMUEZBVUNvZ0hVUXNpTmJHM2Np?=
 =?utf-8?B?eE1WTWRZWlhnU0VXVDY2cGdZUjNMU05XOGxrZkRZVHdRUUI1MlFpc28yaGpT?=
 =?utf-8?B?VG9qanA0WDBuNXpWVmpvbmkya3Y0SlVDaDRJcVdYbmxKcU5BbUgzQWpGeU5M?=
 =?utf-8?B?dG9qSktVTCtLd3FjbVAzRks3WmlWc2hPNGtUQTc3a3NLSzF3YzhLQ1lUSmY3?=
 =?utf-8?B?YTNaaVdKb25nRHhUZmRZM09yVm1JbDZ1TXdicGxQd0NOaHVGbDlKOGw3WllD?=
 =?utf-8?B?Y0tQNUhzVVlSb1FtZVVFMGo2cmxQeTB2dC9Oc0cvZG1mWUJrTWFjS1dMclU3?=
 =?utf-8?B?Nkd4NVEwandHd3p6ZktEa0ErWjN3VGpyZWRKZW9UNjJ2YXJRSDV5b085eWh2?=
 =?utf-8?B?cFQzN1A0b0RpM3BjMEc5bmVNeXNqblNndXBCVENtd2h0aHpHaEUrMVp4emFs?=
 =?utf-8?B?b3NueWgzZzg1UTZlL250RmwyOFdhQlB3UXRBZ3RUSGlCRmpieEhGelY4NmtI?=
 =?utf-8?B?dWJZWmtUR0ZMOUlhMG5oSlFkTmMwTk5QOENUaVMyZ0pEbUFOdENRQ1QxbUNs?=
 =?utf-8?B?YW9kMEIzTDNaNXFLd1g2S01vRmpYdTkrVjNnTkJUT3k5V2k0M2ZmaXZaWUYy?=
 =?utf-8?B?ZWpCWDZKSTlLdFJZT0lIVnlHWEhIMzZQS2pqb044aVJxWU13Y0krREpSNkJz?=
 =?utf-8?B?UXpSaGRmd1NHeFpNSU9uaU5YUUdUQ3JTQTBxa0EyL1RaWWlpWERUYXFreEpY?=
 =?utf-8?B?TnBFVmQ0VFlNUEZscitKVHZRWDZOODZYMXA5dEpvRi9ISndrWUgzTVc4Unho?=
 =?utf-8?B?QjFidnZyT0ZUb3MxY1FhME5rKzFlZUtNbjFGYm5TUmJLQ2pJU2psZlFkaHhm?=
 =?utf-8?B?SytSYnEzYUVnd3g5NkVYVHBZOW40NkxOZ1JCcmNmc3JrN1VjUEIzUUFEUHNW?=
 =?utf-8?B?SHo0d1FlRlMxOVd1STdGb3FvVDlMTmNCTG5RMEd2Z0ZOL0VveFo1MmhZTjhm?=
 =?utf-8?B?R05ETGF4dDYwNlh5Z1JLWUc5WWlCNUREVlFQcEU1eEc5dERma2J1aHVKZnF4?=
 =?utf-8?B?Y2tiaDRMNXJDelFUWkZxL3l1d2dRWnN5TUZ0VHY2b1Vmd3pPZWtlcytsR2tR?=
 =?utf-8?B?WUFtcHdVeE5PVkZ1M3gwcVQ1UTR6Mm5XdTRlQjRVOHM1dnpnU2l5clB6c2h3?=
 =?utf-8?B?MHJGSWs3SEp1K3psUDdtZCtJNExjMWJ0RDBFb2hBc1pFWXhYQ01BSUNiN3ZT?=
 =?utf-8?B?K2VlMzB6VDBBZll2U1VFbmpzenM4UkcvZllYQlVzRDZsd2pqR2Qyc1VEdkVz?=
 =?utf-8?B?NnV6K2JhcDFWWWg0Q3RUY3V5NmdSS1J2eXJqOUgvZEtuQ2ZkSVpEUS8xZXVJ?=
 =?utf-8?B?eVEranZnS0w4OC92VFpEak5qM0dyVVpOK2RidzFpdlZ0R1lFRlhTaUV3Z3JN?=
 =?utf-8?B?MWpOM1JaKzRvbnlidFl4eVNsckRXWW9iZldoZ2s0di9kVE9EODVRYktwSzFo?=
 =?utf-8?B?MHhTL2NmaUVweC9IRHQvTVNueWRhbUx0WG9CTndFekZlL292ZUhKMTdGZHcv?=
 =?utf-8?B?cjgrOUpLc1JienhFM3F4NkZxVlRhOW9nMU9ENDZONlp6OG5BNTl5eDhxWVdn?=
 =?utf-8?B?Zk9CamtlWkNCKzluSEVPM09YZnA0YjFHaWcyVTZxRjdncEVoK3B6NGp5SmQ2?=
 =?utf-8?B?NFZWNU9ZMUNESlhod0pQbnIwR2pkeUpjTThwWUZZaHJrQ1FGSmJuc2poNnZ3?=
 =?utf-8?B?QlpVZzBlc3dnUloxbVpNMVR5ajMxUHpVRjVZcTV4OHg0QzlIQWEyRXVzcUln?=
 =?utf-8?B?TzBCZVpobEJEdnZSa1dvQXMrbXA0anBtQ1RjZnVhbzVkQXdrbGRqbUU3OVM2?=
 =?utf-8?B?QTJrZE5CVVhqczlMNk9NTzFURUt0cDB6OXBDbUJJaXlTNmNBTTlXQW5ZRDE2?=
 =?utf-8?B?ejR1YWJXMm1zdGJQbDVMK1FiR0tOclcxZXRTQkxEbUlNbE92OEVUTUdFN24v?=
 =?utf-8?B?YmRRTGV2SGdqb20ydWgrTUExbUUyd3dpS3NWeElMRVZUeUVENjdET3B5ZGhy?=
 =?utf-8?B?dEkwNDY0a0NuOTU3NW45alNQUkRJYTVZdld6QURQU0FWa1hWQnRQaGFlVWVR?=
 =?utf-8?B?R1h3ZTQ4SEdVTW5NRDM1MWtiSXB2bTdDMXhaTGdaSnQrRkFUTjRuMEJ3RnF5?=
 =?utf-8?B?MThTSW9hM3kxa2cvY2IyZjBFWUQwdkVpbEVDK0lNRXU5RktzNENuWjFrZFlU?=
 =?utf-8?B?RjZTR2ZYRHhkSHo4T3JjTTNKVGVoOW5jT2Q4V29OeTY4cFgwK1ozR0J5Zm5M?=
 =?utf-8?B?NkpqRHdkSjdNaDQvczZqOHhpTk11Qzc0SDlrVUFPb3hZVWY5ZjhkVzNYRGhC?=
 =?utf-8?Q?q8SvTFROoQLNoCJo=3D?=
X-Exchange-RoutingPolicyChecked: lIgNs4jyUiyfR+k4tnFoKj481ESOD/vVKeNmaisVw+eT3jiE9fdRjREYtoxm3e0y3PvT7NkFUBDAXtCdGgNKNMii4gxM79LZKiUkzYRFbWNTJqdbNyL7AN4v1Oro3r9qnTf2Y76x0HcBMxMseIHjVmAFOBb9/jCAZ8stl8EQYkIe/EckWxmw0Hus9yJZZIkrjPd1UYazQuUwzMU0MKu9WPwaCesD2gCK46wue1tjzuTwh2jQtPZtEA91zKTS2nZaIZ+mZdMiy0d5dtn6FAbc7sdiV31ga+9ieLsx0fqePfgLEOFx/EjeEd+czwoHmi0hwNxpJOp7Z62z85QSgjEC8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2716db63-c6a1-42a1-7c34-08df104c4096
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 21:32:59.8417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQ1W8gYIHfyjSa2vutjfMhwc4vE62/yxuH5W+5amVyW0G+GLEEHRI1F82F0PxXY8nig3uQbQrdZnVSOhZWDVo2hPr3ujxivCNXvIotDYFyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
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


On 9/9/2026 9:18 AM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Avoid programming the IDLEDLY timer to less than 5 microseconds.
> Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
> and Media Versions 13.01 to 35.03
>
> v2: Use xe_rtp_match_not_sriov_vf, move to local variable
>      Remove warn and other knits            - Matt R
>
> v3: Add verbose comment - Tejas
>
> v4: Restore IDLE_DLY register on engine reset.
>      Add it to GUC save-restore list. -Vivek
>
> v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
>
> v6: Avoid clearing inhibit switch - Bala
>      Refactor code accordingly by adding idle_reg_val.
>
> v7: Rebased with the divide-by-zero/overflow guards living in
>      a separate hardening patch.
>
> v8: Preserve the Wa_16023105232 floor (DIV_ROUND_DOWN_ULL) and the
>      maxcnt == 0 guard from the hardening patch. Round up
>      (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion instead,
>      so the tick-quantized delay cannot round back below 5 us.
>
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c  | 69 ++++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
>   3 files changed, 60 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ff8eee3831aa..58a3f6293ce4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -864,7 +864,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>   		}
>   	}
>   
> -	if (XE_GT_WA(hwe->gt, 16023105232))
> +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
>   		guc_mmio_regset_write_one(ads, regset_map,
>   					  RING_IDLEDLY(hwe->mmio_base),
>   					  count++);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c86890e09b55..37cd7fe38c2b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -588,33 +588,78 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   static void adjust_idledly(struct xe_hw_engine *hwe)
>   {
>   	struct xe_gt *gt = hwe->gt;
> -	u32 idledly, maxcnt;
> +	u32 idledly, idledly_reg_val, maxcnt;
>   	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>   	u32 maxcnt_units_ns = 640;
> -	bool inhibit_switch = 0;
> +	bool inhibit_switch = false;
> +	bool wa_applied = false;
> +	bool clamped_below_maxcnt = false;
> +
> +	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
> +	    XE_GT_WA(gt, 14025941587)) {
> +		u32 mincnt_idledly_ns = 5000;
>   
> -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
>   		/* xe_gt_clock_init() zeroes timestamp_base on unknown crystal clock. */
>   		if (!idledly_units_ps) {
>   			xe_gt_warn(gt, "idledly WA skipped: timestamp_base is 0\n");
>   			return;
>   		}
>   
> -		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>   		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>   
> -		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
> +		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>   		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
>   		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>   		maxcnt *= maxcnt_units_ns;
>   
> -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> -			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
> -			idledly = maxcnt ?
> -				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
> -						   idledly_units_ps) : 0;
> -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
> +		/*
> +		 * Wa_14025941587 is applied before Wa_16023105232, which has
> +		 * higher priority; the two are not expected to conflict.
> +		 */
> +		if (XE_GT_WA(gt, 14025941587) &&
> +		    idledly < mincnt_idledly_ns) {
> +			idledly = mincnt_idledly_ns;
> +			wa_applied = true;
> +		}
> +
> +		if (XE_GT_WA(gt, 16023105232) &&
> +		    xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> +			/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> +			idledly = maxcnt ? maxcnt - 1 : 0;
> +			clamped_below_maxcnt = true;
> +			wa_applied = true;
> +			/* inhibit_switch override to keep
> +			 * semantics of Wa_16023105232
> +			 */
> +			if (inhibit_switch)
> +				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		}
> +
> +		if (wa_applied) {
> +			u32 idledly_ticks;
> +
> +			/*
> +			 * Wa_16023105232 requires idledly < maxcnt, so floor
> +			 * that clamp; otherwise round up to guarantee the
> +			 * Wa_14025941587 minimum survives tick quantization.
> +			 */
> +			if (clamped_below_maxcnt)
> +				idledly_ticks = DIV_ROUND_DOWN_ULL((u64)idledly * 1000,
> +								   idledly_units_ps);
> +			else
> +				idledly_ticks = DIV_ROUND_UP_ULL((u64)idledly * 1000,
> +								 idledly_units_ps);
> +
> +			idledly_reg_val &= ~IDLE_DELAY;
> +			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
> +			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u ts=%u\n",
> +				  hwe->name, idledly, maxcnt,
> +				  !!inhibit_switch, gt->info.timestamp_base);
> +			xe_mmio_write32(&gt->mmio,
> +					RING_IDLEDLY(hwe->mmio_base),
> +					idledly_reg_val);
>   		}
>   	}
>   }
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index dd69ad07f7a9..3001155f8d09 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,3 +72,5 @@
>   16029897822	MEDIA_VERSION(3500)
>   		GRAPHICS_VERSION(3510)
>   14027054324	GRAPHICS_VERSION(3511)
> +14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
> +		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
