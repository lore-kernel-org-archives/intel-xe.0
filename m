Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8261C606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPyuQlAN;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=hR1aBsob
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4989E10E375;
	Mon, 23 Nov 2026 10:58:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476D310ECDE
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 10:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795431524; x=1826967524;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=bVFdWaBp/k3ANMiORNXTMr3dO7am59JgpmPDaHRzv70=;
 b=CPyuQlAN0xLa15cLWN1oKTVbJ2w1Vn07j1WkweBtDbXtpAgdU0zgT0hO
 jl2WS4S82dj0zg7HNjpGkMoOFAMY5Z5osTwcPJrrjOuLIybC2sZbVpQFx
 JUVVGhJT2M/kfu6BWRpR5XUH+HpgFwr4rV5v/+WRzVyOPYJntMrmN/68r
 Lqbh6O7RL/4MS+z/3aj/57m4L5P2Ibd+W8DSImor7mLANR/LKFC5Qt4FM
 O7MKxDMi3VLQqeFVOny0A35FLWlCJVOOD2i6PfxiqV04g3lPtb0uCWYlq
 wn9q8DLLRWxrEmsz0OVqL2VessAed85PZdQ2SIkH/8EZKSh1jeH0gLgDD Q==;
X-CSE-ConnectionGUID: SSF+xZI/T2m83gQW9qSHfg==
X-CSE-MsgGUID: 8LAOv1rbQj6/bNmEbMiTaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4119439"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208,217";a="4119439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:58:43 -0800
X-CSE-ConnectionGUID: mXHQglWtRqqlLFw+fP+twA==
X-CSE-MsgGUID: 8OuCChRKQFeAQsYHaCfbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208,217";a="11604385"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:58:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 02:58:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 02:58:42 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 02:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zz6l42dBm6v8J0XZYpEvMI30XKPNKdfeb77uMHQTe2yc3XCTwMyWj7WoZr6xlF7/XCrmvqzqsG/X/+7/K+43CVO4p/M+bScfk+Wd9LzA+Jm9euEkdBTZRDTZ6BTRi1yQbQo+BGAlBeLxRLlDh1RpwTJKCx6d8ZQMG12cGenApvSEVYtCzlMWfu9jwnF7+fZCFVhkhMz3C9TQfiLoMYnhoZ4UGfcGaPED9N349jgbbUIPq83wiBSbX3Gxldz83th+sheugSBhD/a9H6dVkCAgJeZMKe66PiYGTQZRbb8obHP4ERvgTlcpojvIMEgfO/Bgw4pgNezOJz8+U1YzCrKZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdOwouTXf9xcJrf86Q15dMeX0gXcZtp1vGxVwu6uMBI=;
 b=mBqX9wrsJ8su+oyVphzAPM7enZDuWGdfZymZwu9ts05Br2O6/IF/zNWgK569in6dNrWJO3+wC45mbVN383pUkadHd0behqtUO7dhhtkUXWpeGyuriq8hr2mcLvV8W6yvyBVMO3OMRFa8TNcwGrEYlMKDXeV65zU3NyQr5qdpL0WCA4ktiGqhXPduJIHri4Ri7eN4bwuFuNnRQbv1B26upv+O/xqg8dPlDJcTbV08PoJg0mP2OQ+BrkM2eS6YT3l+knhn6CgaFW/sG/AMn0SThDNqJ4+bk/IJchgbGe8ozacMkGqDxtQExkXcrZqdHWP1PkHASwOScxvDz0Err+pD0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdOwouTXf9xcJrf86Q15dMeX0gXcZtp1vGxVwu6uMBI=;
 b=hR1aBsobDgmTcBRS8TJGmPv9S17epAUChfRabK8kv0H770hTnggAIcJSyh2ZYbbhr8pprrcNRREGaPufUSlEX6d/zq+ukMZ4Gadj3r2pBxPZnD2lgurHHf0f9JPcvJCRwno/uaPCh/rqGskvdAtHcULwLIrZhnofK/fZTFiwfk0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 10:58:39 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 10:58:39 +0000
Content-Type: multipart/alternative;
 boundary="------------GcyH7LAfZQVtV5tFJSfeN4pf"
Message-ID: <8e005d8c-c670-4a61-addd-1e02eda9db39@intel.com>
Date: Mon, 23 Nov 2026 16:28:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] drm/xe/guc: Split GuC doorbells manager into
 usable and shareable pools
To: <intel-xe@lists.freedesktop.org>
References: <20261026104224.1018993-1-piotr.piorkowski@intel.com>
 <20261026104224.1018993-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261026104224.1018993-2-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA5PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::9) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|DS7PR11MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b8eda8-d72a-4f49-92e4-08df4950bae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|261009223027099003|18002099003|22082099003|8096899003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021123027099003|261021121427099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: BGfgfNR2Jsk+U5WOQPY6Bo8OdIf/pL3DUcBn0vjPLAc0dXKO8biN73BsFv6E5iJClOCS7kmH+aGXo4xrVTEf9Zlx2TIhHId/0FhdFsU3t33pFwku4cWC9kpQo+9fF/IDlkMa9gGHEV7X1unBdjEjcINYB/HZYXNdP40mzd+64uujv2mE4khgT/k9hX7WuuiaVT4iHUa+WkfQLA4Uy+hnLwbE/jDbqKi0+wYzVmT4ZABN0/yakkM2HVOwglN8taKyHBuOIgm+bF8oJ5cpqQ/1d8cBr61m6iqyOY5AblbeAMSHRSp8kz8HOo4OFdKPlFVEIg3XRBQzjGQN3bIuV1s+zdtdcE2Vm9a3TuEET3vyodIpN6dg3SkNasSxL1DMPyaVZK0GcnNYm6che3xpQhB3TV36Mw1kCn92Y07cbXiT0hO6vxWLIPA0fx6x60DOCdrIBoUQVO91Pf7OzR8ICV5GU6gX0LYcLqhlUn15Gl8QaZ1eBFJLewC4sJJJ4IAYgpm0DnRt4mIPQQNqM98xXsob3+GfgeVNLSWUc6ILUpqSJDKd53mWgvnvaP6ElJSaMr+nkanVbQGGGNmeqWBifuJzecTEARbdsAUWYlX/u5BumcqE4feFwEfPpH37ZW7UueGNlOk0HD5S4Qcw5DgdkIpfvsqjm5eoq24YIOp79Tm0vAY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261009223027099003)(18002099003)(22082099003)(8096899003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(56012099006)(4143699003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0IzV2tGSFB1ek5aaS9BdzVsVGg4SVhPOEdCb244QWIvRDE5cDVKa0JhR0JF?=
 =?utf-8?B?UWRHQkIwZUpuc0dVTHhmOXVZSXIrOXBtbXA1MXdzdDVwRG5wV09mUDRNMzVw?=
 =?utf-8?B?d3FoRlg1VVhzWmowYnFEdHkxRm1IaTR5TThveWIvUkJFTXlBR045WmhpQk9G?=
 =?utf-8?B?VU92U2hjSUVGUU5VbzRTbTRXYkpKQ05LK3dmdExjMFF1WnJkUGpreUd3WDFL?=
 =?utf-8?B?TWE3TXdqcnY2cWVRQisrNE90VTNtQ0FzVEFjSmlxSnJMRFB3ZDBSY3FTWFZC?=
 =?utf-8?B?bDhZelF6QjZ5ZGRldUQycENsQWRKcGFMOG83VWttOXR6NExDMGN2SkZpVzAy?=
 =?utf-8?B?NkdOV0plV015NzhxS2RsVm1RV1lhUndocnJXVjlyeDRacVlLTGtZOURhT0FS?=
 =?utf-8?B?dlYxcC9mZjNjaC92bHh2WGsxN2ZsR2RYTFVUTWZEMG5DY2x4RVBmNWE0MXd5?=
 =?utf-8?B?OVcwWlZpZlg0blUwcnVrZmI2SUtDa2VSTVhLN1NNS2I4S3lBdTN2WFptMGpi?=
 =?utf-8?B?ZTRLTHAwcEFuMVdqb1JQcnVVazVBNjBaWEJUM21qcHpWbTBDQ2hkK2gwNmlR?=
 =?utf-8?B?S2JSQ2hwMDBGZldwTkIzaUVaaEh6NmRXSU5ackErbzd5cHZwOXJKMFdBTDUv?=
 =?utf-8?B?S1BiNDlqUlNsVVhnRVhpb3JUV1FRVVRHckxpbjkxN2JrNFJxYW9UUU9Gazda?=
 =?utf-8?B?N2I1OWpZUWhMeXVrVE1sY1cvYWJoMXMwV2RSZytJcENZa3lzTEtNcmkrc0FT?=
 =?utf-8?B?MVh4MlErOHR2Ullja0RlajBMcnM0MlF2KzFWRndWOG11MTBaUVVGQ0ZZMy8x?=
 =?utf-8?B?UkpiTFllWTduSno1dGlabUNkZTdoZkFLZjNacUhtbUR5c0NhOWJsMjkwY3ds?=
 =?utf-8?B?L3A2S0l6RmRtTnh3NDhXSXFRODV0L1B1ZTdFNWlHTjNhU1ZBd3pwSzZCb0RW?=
 =?utf-8?B?S0dOaVVRUG9FVmpadnhsQnl3M0hHSGg3SDJqOVdmREExNFNrSCtLYUtBcEEz?=
 =?utf-8?B?Wk9UdE9FeGJKM1psMU9TWTAzUDZFNjFnVE1Gd2xDcDhGVG4wVmpYMytJVzN4?=
 =?utf-8?B?SVJxUDhET2JrbEZQVXRZZURxWWE3d0JFQ1YzbXgyQXNuMTdNaVh3TnFXdmwx?=
 =?utf-8?B?UzhXUGFiYk5tQVI2Qk9aWlNCREFNbGN1cU9oclBBQS9aREtBRDNzREU3T0cv?=
 =?utf-8?B?Wnh3OC9wT2RUTVFsK3dJd2lyNFc4ZmhWNENZSXUvSlpPa3Uza25kUExEeHAz?=
 =?utf-8?B?SGVGOWdVTC9YUXVMZ0ZmV2FUeTdvWlF1Wm00bHFWRVJVU3JDdkpkUGVkNGdC?=
 =?utf-8?B?YkhBSmdoaFFTdk0welNGOXVwYXRlSEFNN1ZZVzFHbUFVRDAxUUttRFF5Szcz?=
 =?utf-8?B?OHJVMFFTWWRrdm00L2FBdEdpL3NMTnJpQmxncnZXcy9oVGxnYS9IZm5UT01H?=
 =?utf-8?B?RVd2UTdJWUxTc3ZycHA2Nm5saFJJWHFrL2o5eE1XTmR0TThwZHNucVM0Smg1?=
 =?utf-8?B?UnhDeFBvNmJqNm1Fa1NWRnJqU1p1WjM1VWd0aGVjS2VFbWEzVWEvZm16THla?=
 =?utf-8?B?MldVMWEreU1nd1VMcWNoZnB6enQ5bWd1dGEwVVJKZVJ2ZHBsejVrWGFZUjNa?=
 =?utf-8?B?Y0lQb0pYZUJXcU1xRXhBUXhoZFkyaFVJUXZXMEdNNE1JQXZDc1FKZmJtZC9J?=
 =?utf-8?B?dHJsejN5MC9YNlJvMUplL3VQZjVONi9pK2FNMEpLNS81VHdGMUEwY3d2R1M0?=
 =?utf-8?B?d0ZaY05JNzVYeHJNQ2M2RFpFU0twRnJiRVQwQ2JhbzV1dU9KOU1hdHdxbFlw?=
 =?utf-8?B?RHdVbWdSRUNsbkE2QzJCQ3g3SlpOT1JmU2ZHWDR1VUNBeFFzN01ZZVdEM0ZD?=
 =?utf-8?B?aEozR3U0RmZ1dmI4KzN4VFIrTE9Cb3NvY3VtcUx2RXdSK0FqV2tCUVM4SEVv?=
 =?utf-8?B?bm4wR0oxTUhLdzJDWWdsMDZrSUZjQXFmWWVTVVFkSUJBak5NcFBGMXVRRWEz?=
 =?utf-8?B?cFJ4RFdmRklGaWUwN0N4d3ZUaXNXai9ETnZVcENkZjl2aDdTbVRCUjkxVWlW?=
 =?utf-8?B?Uis1VGtBZHhjeTNuWGxtUlUrd0xBWlpLTEx3OGZxQWhzM1BoVmhubjZ5S2dD?=
 =?utf-8?B?M0x3Vkxmc2F3NVl3ZGpZbWptdzRKQkUyMEp3SGg4U1JkTFhNNjdBUFBuS1BV?=
 =?utf-8?B?QkJURnhZQ3R3VDNKa242UFU4WHJnQjJOemsyd3RFQXFNcFZKazdIcWlFS2p6?=
 =?utf-8?B?UjI1aHVmWGVZVHhlamZWNXc1a3RYNzg2SXVTMTEvWHl2dXFpRHRKYXg1eG50?=
 =?utf-8?B?VUt5TjNOeG9IYnAxeUpxcUZWR1d4YWNPTndSanNyVGRQRG5ZNGJsRENzUjJq?=
 =?utf-8?Q?2rcWhhG/A3TLgzSY=3D?=
X-Exchange-RoutingPolicyChecked: BfWzvcD9+lT1Lcbf9DdK5p/UPESH0xmZE25spjG6VMyxAb5aeaToTiMd2EPN7IwTZAu20PAPl2SpA5gx9Fb0VtoJzYlFuC/VsYSYodGXa3Sg85yYaTxAY2u6KfmWQbW/RtkNzftQZeYGB4hpwrM0w5h7PtYun6GXDNcoJHvHlN1Lge/71uq6yPZfLXU8TJ9G5O4tkhQjQSWOJOhO4/Y/2DYYEzVtJQftrtfPxVJ3JaMebPtWxz/KYWa8/JbdKt4osgaZTMtO16icArlrY+989z5ZKOrMBzrHz7VirHeCEPN7JJCLVtqKnbro+VP5gb2AP38WaTy8TA6FYR1U2sIa3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b8eda8-d72a-4f49-92e4-08df4950bae9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:58:39.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujvnRcVaRCW53FOr0gabBrczIKjHiTFCeIZRme6w8y5VukV12Z0KJfcAZd1bk0Z/aoIB8bKv+mwvlBZBjk+sv9g5fJnKT9VtD1sWNKM1LNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5990
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------GcyH7LAfZQVtV5tFJSfeN4pf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 26-Oct-26 4:12 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Modify the GuC doorbells manager so that it distinguishes between
> usable doorbells, available for the PF, and shareable doorbells, which
> can be provisioned to VFs. Both pools are represented as a single
> bitmap and may overlap.
>
> Let's replace the single-pool accounting model with separate usable and
> shareable pools, add helpers for pool accounting and limits, add API to
> reserve and release shareable doorbells, and update debug reporting.
>
> For now, let's keep the current allocation behaviour by mapping both pools
> onto the same doorbells space. This prepares the doorbells manager for
> separate management of PF and VF doorbells in following changes.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  36 +-
>   drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 316 ++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_db_mgr.h            |   7 +
>   drivers/gpu/drm/xe/xe_guc_types.h             |   6 +-
>   4 files changed, 283 insertions(+), 82 deletions(-)

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------GcyH7LAfZQVtV5tFJSfeN4pf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 26-Oct-26 4:12 PM, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261026104224.1018993-2-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Modify the GuC doorbells manager so that it distinguishes between
usable doorbells, available for the PF, and shareable doorbells, which
can be provisioned to VFs. Both pools are represented as a single
bitmap and may overlap.

Let's replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, add API to
reserve and release shareable doorbells, and update debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same doorbells space. This prepares the doorbells manager for
separate management of PF and VF doorbells in following changes.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  36 +-
 drivers/gpu/drm/xe/xe_guc_db_mgr.c            | 316 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_db_mgr.h            |   7 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   6 +-
 4 files changed, 283 insertions(+), 82 deletions(-)
</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261026104224.1018993-2-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------GcyH7LAfZQVtV5tFJSfeN4pf--
