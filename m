Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B2606A32E
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QiP8bBNR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD5A10E22A;
	Wed,  4 Nov 2026 10:44:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8FF10E22A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793789081; x=1825325081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTTwclx82RkZ9UCd6IQmMr3w1T9cTooxK0uQlPgHqZg=;
 b=QiP8bBNRPSm+5Sf282nktAagmf8AeAVPREhUPfZb2YQFot9dKHieOgAS
 vgIKpxisR+W9HqUEq6DxO+MfhbghXCvdkCK0kn9qtP9o1+LR9vMYxmfzI
 G5o9YpGnvTZWeE2nce6GmXeLLjUeX8B66r19zAiElaoqA5i1ref01+Vus
 KbMt6Ph/j7j38OiT0GKeqA3i8iPI9cis/rOPyh6Ct2DDZavi0fTxFG6k9
 hqWxpSWAkibMOdOiQLxd9XcL15dRJqDwl97MiKqfoYf7vuniF+YP4gEJa
 AI+pl7D8rAI46mantjs0PbLN+urZ7Jzip6wSDy3R45bLXQiIoJiqGUANQ w==;
X-CSE-ConnectionGUID: tgMWU7PLRqi0rTgXzemD4A==
X-CSE-MsgGUID: b5i2pDtZQS2NbvKh6e+10g==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2566544"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2566544"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 02:44:40 -0800
X-CSE-ConnectionGUID: AuIZEHkLQYKI8TRXN2yTBQ==
X-CSE-MsgGUID: g8yyff/9QMCgxgYun4kJ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7048708"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 02:44:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 02:44:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 02:44:39 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 02:44:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewjWwQhkw09c8Lc+XM7swLqFyGyA5vYUAvMWo4pTmZ87Pysv9pqhxHbTWMk4GwKTU8NdeAW/dUbsPH07ybmLzb4pqDwyRPelEsCxJCnFPv2Y2eF3ArkjKjILFOvYqwKTvteyt0ePU155iI+hYc+jqBGFSjitKDZ+NFADWlCFgvg5wMdjZqFWJDYbtyujKjfglbW9ES4zh9ZPYp30FioA78kC6Ff5YejFhZdH298pi3j27NXhMMY8CSx/yp7QPB28FBcFu+47aYwgO7W/pvrBsdF0bBLN9jaeX+pueKv4sD1qxPjx8qo9tojNotA5clddJ4PpKkniiO+kuKq2uxyjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY4zQg8vMAVT9/KP3wyNOucIXSkCQNUVCb8z8QmM3G0=;
 b=biip3OTSoqMOYO6v5K74VTWLz8tFfIMjWtqTjqQB7yfkZyDWG4bDYahSGAhmQl5KX2a5BiQIJ8p38K5ar+5Vb1QvFJEZMRSoggiiRTvcPLENKL63k8D86zkpO9KXQct5A8jfycQteWMswgMt83Zj34bNv14tbakPfbRPUgitaOS4Nhx7HwVPBKhjwq5Pc7naK8d8xqvcmiOGTqmClAvdScpfXntT4ZiR1UvVAorOh/dEVFs+Z2ixoclaNZGt3hYYvu6nFseFpb8akYMXiQmOq8R+0l/JgjSrIP3D+SKzjGHj3AEglEQR9SnZUwpGM1I8VtyN0MCwh7rRlclVEYOO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB953716.namprd11.prod.outlook.com (2603:10b6:806:536::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 10:44:32 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 10:44:31 +0000
Message-ID: <eeae7b51-4a19-4b6b-b4a0-8f2c8af7e65d@intel.com>
Date: Wed, 4 Nov 2026 16:14:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe: Add support for wa_14028434957
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <tejas.upadhyay@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <20261103060929.1586783-9-riana.tauro@intel.com>
 <20261103060929.1586783-15-riana.tauro@intel.com>
 <bcfd49c0-2e5e-4df6-a021-6a30da264ddf@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <bcfd49c0-2e5e-4df6-a021-6a30da264ddf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB953716:EE_
X-MS-Office365-Filtering-Correlation-Id: 72214653-966a-4eaa-bf5d-08df3a609be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|13003099007|6133799003|10067099003|22082099003|18002099003|11063799006|56012099006|4143699003|261022105027099003|261102123227099003|261009223027099003|261021121427099003|261026140227099003|261009221227099003|261026121527099003|261009220027099003|261009221727099003|261028144727099003|261021123027099003|261009223327099003|261022075727099003|261022113327099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: V9QYAUADElWZCIfd9Xhsjv2zyyBt9n19QU+3eGQygBks3Q6BUZ70bf6T57I06RCg54zOpBByrPjiTOGitUxmPIefKsg9sXXNxryN74d2joen7jxmeE78T3dKEi58H8v7M4XsntHzDxduS7qwTzTcKMlocr5oI7BsU8O3qMsd1VNX1nrleA13/LRZyVOOFo3zSfWkfIvfP/0Zn8bnwMM1GOyAwv6SD5w3Fp3VPFk582dsmStrqBWK7Tr9IXhWjeybftLPljMN/4mYUeX1VWny5Daeeotjzk4rMEYvlBzpa4o+lqW4vjvg4BIhDxguVDox5JK/uBxfZ6xfgNllXJBhgs6ptf3smLrwtP9LJmGyyKU4lcr8R3lC3yKgHlDlIi7i6jT/TkvtURZnDsn9AaIAQSyvZds7KlLe9MmMfQYUCLVczLIZg4DrRjid2dBVIttl+zt6WeMVZ5fxHaBi7TXGgSwRgmZDVjvZ7xPwviglDBJMXfx0tVJIw/jjU6GImOZqxjWw1UETMdyFR0miOpjYh5JFZ1xpgw5785KEuzVF3zYSwfoQYF1HxjkWuECKDPbzsMZk2JR/T+Z1TqoVN9ZjwRpXrTj22H+t7h+ooS3tidFwQoqWJIw7eVhGbjh2dyAH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(13003099007)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261022105027099003)(261102123227099003)(261009223027099003)(261021121427099003)(261026140227099003)(261009221227099003)(261026121527099003)(261009220027099003)(261009221727099003)(261028144727099003)(261021123027099003)(261009223327099003)(261022075727099003)(261022113327099003)(260925022911599003)(260925021311599003)(260925021911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1NjRmZOQW9oUkhrL0hQYlhBWWJhTktoTjR4QzYxdGsybWwyd21zbURFV2V4?=
 =?utf-8?B?YnB3MUlxZlZJNThKMFVXUnNBb3BQc09UcmdzQVBiR2M5MHY5M0VZL09pZlF0?=
 =?utf-8?B?OFZqM3RFOHV1bjhacHZIMzBBSWRDQ0N0aFhuVXpxSHhBUVpzN28xNUx2Z0xo?=
 =?utf-8?B?Q0s4WHkyWjNQakQ5cXB0cGk2V1d3dGYvcnl4RHh0TkZ2ZHY2clNXWGMzVVZR?=
 =?utf-8?B?TXpEWkE5UCtkbHg0SUV6bEFWZlR5SjR2TGIvU25xM084aHNHTXRGQlJYMkhm?=
 =?utf-8?B?WTVIdlZoeGdPRWFHTEdsMzVDV1p5d2hlYThUeVVxYzJtUmkyK1RDS3IwSkhU?=
 =?utf-8?B?b1dLVzJQaDhZMG14MlQ3b3JGbFp1SXluREdEcW1DVmtGQ09lcjhBZnBmUFEz?=
 =?utf-8?B?Uk5qOXg3cHF3bDhoWkoxbkV0RFpEKy83WXJjaFEvNk5Nd2QrYjhmUUF4T2xG?=
 =?utf-8?B?cFBTcFBGSGJod1ZFRWZNL0xmZWlyaitCaWs1UldnZDBPS1BsNlVXd1ZBdTcw?=
 =?utf-8?B?UWVNbEhGQVVoaEdVbjYzS3h6QUI3TWtvWUdSblJ0bjBha0Z0dXJaRkM3bFZI?=
 =?utf-8?B?bmJtMVJmS0tHMEFmaFV1alhneWtHbFF2ZVA3Qm9KN0ltSHhvYktrYVlrdTRQ?=
 =?utf-8?B?VnpnbThBTFc5ZmJUUEg0RVNpYnVBK0hqNzRvTXhKMDN4bkpnNzZuMGdpVlhB?=
 =?utf-8?B?eFpROTk0S2NkR0tPcUQxSUlDK05BblN1bnBOZ3ZCVkJTZlVjcjI1TVVWRmVr?=
 =?utf-8?B?UXZYeGI4UWJSOVF2RTRZaUFSWnMzaERkU29UYURQUHUxQTdnZkppa1MzUi93?=
 =?utf-8?B?d3RMS2J6alZUNytTc0l0dE5oN0dsTTlXaXhyMDRrc0cySitoZ2RDa2pHZi9I?=
 =?utf-8?B?ekJwVFh5dFBWL3pIaXpEazZTRzY3UEJ3YVRremJwbTRkY2c4bjc4aERoUTJJ?=
 =?utf-8?B?T1hZellrOHhjQlhueUlOam11bGVsSzRabU1MUEtGZkpBRDB3T0hZamkwVUlh?=
 =?utf-8?B?RzNHSXZ1dmNoTk9nRi93ZEh2cm5sQVRWbzY5TlZSOE00L3dpK2ZwQ1paSHFr?=
 =?utf-8?B?aDhqK2JpdktCMmdQV3k2bDlwZ20zR0owN0RKdUxMNDBnUUI2bWdMMG1hbFJ1?=
 =?utf-8?B?UGl2Tm4vYno3NThpZ094L0QxTEhsVGRUY3UxdElmVmdMNlZ6T0U4b3BDTnUr?=
 =?utf-8?B?S3QweDYwZTlCK3gyVCtDbDBuWmFZTk50NTRPRTl5SjZsVzUzanBFZExLcGdY?=
 =?utf-8?B?aTRlUnIzYnBBTDJHL2ZoV0JYeHFmS0RFMU5HbVFKNWM1OHlsQlY0ckxlL1Nl?=
 =?utf-8?B?SURQbXdyM2tkWUpYdzRvTndQZW81NVMzMnc0d3FQeTlNeUdIbHlXbi9YNlRF?=
 =?utf-8?B?ejhGQzlkTjNoVGpxQzhLQzBPaGIyakY4bkdWREFscnVqL1BueXVGQW8veExr?=
 =?utf-8?B?QXQ3QTEzaHh2TDZGalZkUEJoMkVDd2VTQ2dkYWM0VHd1UEx0UG83U2xIT1Rp?=
 =?utf-8?B?amhZY2xGaS95Ym5hbFdLNEVONXhaeEI2ZDNPdVpOSndtV0dRNW43dzlsT0Vn?=
 =?utf-8?B?SGtlM0c2WlFlV21BUW5TcUFMd29hMkt1TXJ5ckF4TDdmK2l5YUJ5cEcvOVRv?=
 =?utf-8?B?dldWMGp3dnorRnBsNXo4RHJucnlYSDZLT1dPbmF1aE5xcmJROHBPcDErYVQ3?=
 =?utf-8?B?UjdLY3huMVhXTmtVMHdMYTRZQVFXYnQ3cTFGV1hTTklJYUMxajh5VU1tT0tq?=
 =?utf-8?B?akUrNkJFeXVTRklRWWhjbFloNFN1VWhmSTRuU2FVUlZUdGgyR2lJOEV1alp3?=
 =?utf-8?B?aVNxZ0hmQUhEZXJ6YWE0QVRQb0hjY3lmTm5XMHc5dEh5TnJMbnVKNyt4VktF?=
 =?utf-8?B?bTAyR2lTMThHc3BtOGpuSjF1WWFsMHhVR3g1dVJKTG1pczRGaHl5QjlKcUk3?=
 =?utf-8?B?a2txZ2lFZGJJOFBnaG5HR2ZUang4d0ExRnJjTW9pYWdDR3gyb2ZXRUpVVzlY?=
 =?utf-8?B?andOZzhPNjRKQm8vRmZtUnVxMHBuWVF2NEQzd2QraHJsdlNpVm9TVVQ5T3Nj?=
 =?utf-8?B?YUl5aFd2bERRcDkzbW1DQXF3TWs2UGlSb1lXSmtYQ3MvWC9QYmlOYmdCUFVH?=
 =?utf-8?B?QnBNczZ6TE5nN2prNzF5UVo3K2thQWVPTExDREs2ZlJoM3UxRmluMEVtVFcx?=
 =?utf-8?B?b1FBQnp6UlFQWDhVYTNxL1BIUmdLSzJTdlZWL2R6VlhVVjlmK0doSUl3dDQy?=
 =?utf-8?B?SmExNkY4WGJjcWRNNWdtcTJOK25mYUxnUGt5elU2OFZxRGM4RWQzZitqaTRR?=
 =?utf-8?B?dWRFOGpScUxlZklFdGw1VXZoRnJDQWNqS1BldjZLZVJ4aTlKN0dHdz09?=
X-Exchange-RoutingPolicyChecked: hLPt7SAd01R0PCb2kelFs4X/NRSeuD/fhJy5RgEBG3dtJZg2XoiA5CvVZbfVxmL1naMSjMfUHa+8sJFnN2oLQfhroYaLostaTc2YLjYuqrFrzUyetMf04H5t5G1sphU46EKVPuA950QJNuXDCFocw64NGYahYrPDKMX3Yoaec5qj12hQWXofGdduBUyY92RRa2DrpPtSekwUwwQmbaejLkiIEv4rJhrG02kHaJ5STcwVVv3j6kmauv1qExFPJqdW520cKklXtfnG+t2mqn/1v6znq9h7vXausczBW9qInxNjRXQzvMr2vSiOu4yR/scUBVXTcg4FbsdTdJD7wNb1bw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 72214653-966a-4eaa-bf5d-08df3a609be2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 10:44:31.7670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsH1QxAp75sqtedNKJrTzqpHurKMDnIk4I6QGt/E4UVWJLMsAC5n5ISmAk8VRO9I1o/0Zl4gx27rlFlRs3xLZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB953716
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


On 04-11-2026 16:08, Mallesh, Koujalagi wrote:
>
>
> On 03-11-2026 11:39 am, Riana Tauro wrote:
>> Add support for wa_14028434957 on platform CRI.
>>
>> Non-fatal device errors are reported via a direct IRQ, while fatal
>> device errors are downgraded to non-fatal uncorrectable internal
>> errors and reported via AER.
>>
>> Add support to process and log non-fatal errors routed via the direct
>> IRQ path. Most non-fatal errors require no reset, except double-bit
>> ECC errors affecting a critical BO, for which the device is wedged
>> with a bus reset as the recovery action.
>>
>> For uncorrectable internal errors reported via AER, request a
>> secondary bus reset to recover. To avoid a race between the two
>> paths, if non-fatal error processing is in progress when an
>> uncorrectable internal error occurs, flush and disable the worker
>> to prevent further processing, since a reset is
>> imminent.
>>
>> Cc: Andi Shyti<andi.shyti@linux.intel.com>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>> v2: use platform instead of graphics version (Gustavo)
>>      combine patches (Tejas, Mallesh)
>>      remove 1sec delayed worker (Andi)
>> ---
>>   drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>>   drivers/gpu/drm/xe/xe_hw_error.c          | 31 ++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_pci_error.c         | 12 ++++++++-
>>   drivers/gpu/drm/xe/xe_ras.c               | 21 +++++++++++++--
>>   4 files changed, 58 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> index 356b4707dafe..3a8ef8abafc5 100644
>> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> @@ -6,3 +6,4 @@
>>   14026633728	PLATFORM(CRESCENTISLAND)
>>   14026746987	PLATFORM(CRESCENTISLAND)
>>   14026779378	PLATFORM(CRESCENTISLAND)
>> +14028434957	PLATFORM(CRESCENTISLAND)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index 39ff1e8cc156..2ab49ffdf49f 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -5,6 +5,8 @@
>>   
>>   #include <linux/bitmap.h>
>>   
>> +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>> @@ -15,7 +17,11 @@
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>> +#include "xe_ras.h"
>>   #include "xe_survivability_mode.h"
>> +#include "xe_wa.h"
>> +#include "xe_wedge.h"
>> +
>>   
>>   #define GT_HW_ERROR_MAX_ERR_BITS		16
>>   #define HEC_UNCORR_FW_ERR_BITS			4
>> @@ -171,7 +177,24 @@ static void hw_error_work(struct work_struct *work)
>>   	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   
>> +	/* Skip hw error processing if device is already wedged */
>> +	if (xe_wedged(xe))
>> +		return;
>> +
>>   	guard(xe_pm_runtime)(xe);
>> +
>> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
>> +		/*
>> +		 * Skip handling if an uncorrectable internal error is reported as
>> +		 * reset is imminent
>> +		 */
>> +		if (xe_ras_is_aer_internal_error(xe))
>> +			return;
>
> How are we dealing with aer_internal_error variable where on AER path 
> we are setting true and reading same variable on different worker 
> thread, for example if
>
> we have four tiles then four worker threads are running in parallel.
>

Currently the platform that has sysctrl check has single tile. And 
sysctrl responses are serialized.
Also this is a read so don't see a issue

>> +
>> +		xe_ras_process_errors(xe);
>
> hmm, we need to handle return of xe_ras_process_error() right?
>
I already responded to this in previous rev

https://lore.kernel.org/intel-xe/b8cc8266-68e2-440d-b87e-d4c7877b9b4a@intel.com/


<https://lore.kernel.org/intel-xe/b8cc8266-68e2-440d-b87e-d4c7877b9b4a@intel.com/>Thanks
Riana

> Thanks
>
> -/Mallesh
>
>> +		return;
>> +	}
>> +
>>   	xe_survivability_mode_runtime_enable(xe);
>>   }
>>   
>> @@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   		return;
>>   
>>   	/*
>> -	 * Hardware errors are reported through System Controller on the platforms that
>> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
>> -	 * here for those platforms.
>> +	 * Non-fatal errors are routed as a direct IRQ on platforms that support
>> +	 * system controller.
>>   	 */
>>   	if (xe->info.has_sysctrl) {
>> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>> +		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severity_str);
>> +		schedule_work(&tile->hw_error_work);
>>   		return;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> index 4ade392b47be..c27fd22e28ac 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -5,14 +5,18 @@
>>   
>>   #include <linux/pci.h>
>>   
>> +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_hw_error.h"
>>   #include "xe_log.h"
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_survivability_mode.h"
>> +#include "xe_wa.h"
>>   #include "xe_wedge.h"
>>   
>>   static void prepare_device_for_reset(struct pci_dev *pdev)
>> @@ -90,8 +94,14 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>>   	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>>   		return PCI_ERS_RESULT_DISCONNECT;
>>   
>> -	if (is_aer_internal_error(pdev))
>> +	/*
>> +	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
>> +	 * flush and disable the worker to prevent further processing, as a reset is imminent.
>> +	 */
>> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>>   		xe_ras_set_aer_internal_error(xe);
>> +		xe_hw_error_work_disable(xe);
>> +	}
>>   
>>   	switch (state) {
>>   	case pci_channel_io_normal:
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 58a0b5fa676d..1809c3c893de 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -5,6 +5,8 @@
>>   
>>   #include <linux/bitfield.h>
>>   
>> +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "xe_assert.h"
>>   #include "xe_bo.h"
>>   #include "xe_configfs.h"
>> @@ -23,6 +25,7 @@
>>   #include "xe_sysctrl_mailbox.h"
>>   #include "xe_sysctrl_mailbox_types.h"
>>   #include "xe_ttm_vram_mgr.h"
>> +#include "xe_wa.h"
>>   #include "xe_wedge.h"
>>   
>>   /* Any non-null entry marks the page as offlined by firmware */
>> @@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>>   			    "Double-bit ECC error detected at sw address 0x%llx\n",
>>   			    info->sw_address);
>> -		if (ret)
>> +		/*
>> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
>> +		 * Wedge the device with a bus reset for errors that require SBR to recover.
>> +		 * TODO: Trigger SBR using pci_reset_bus
>> +		 */
>> +		if (ret) {
>> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>>   			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		}
>>   		break;
>>   	default:
>>   		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> @@ -818,9 +828,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>   		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   
>>   	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
>> -	/* Default action */
>> +	/* Default action for PCIe bus errors */
>>   	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   
>> +	/*
>> +	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
>> +	 * internal error. Set the default action to reset.
>> +	 */
>> +	if (XE_DEVICE_WA(xe, 14028434957) && xe_ras_is_aer_internal_error(xe))
>> +		final_action = XE_RAS_RECOVERY_ACTION_RESET;
>> +
>>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
>>   				  NULL, 0, &response, sizeof(response));
>>   
