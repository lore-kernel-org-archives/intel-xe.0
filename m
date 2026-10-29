Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26A2606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 05:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AqXIhYIl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4B310E3E3;
	Thu, 29 Oct 2026 05:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0C210E3E3
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 05:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793251165; x=1824787165;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UzWrZGx/QQH+OsZ8CgZh9j03AC8cMOU22J8za7LHaYc=;
 b=AqXIhYIlcBwydcJ4WeRzYjEeDZNd09nCTwzc+E067nDVcmAamzMByFkH
 v75cGxW4LyczqHq/BflBVCjoqI6P4niiYTpP+UL3c6N9Jmm84G7z6f72Q
 IzDZ0WnsCEKEGkaBulE0JXhWljG+9+FVTif7lEYeZaxrE0QQp7IefxE9Y
 5HFrMghnIG+o+Hu2FoYqhEEf/5bP+5mX7raUnW64jwMX0kUXn6v2AKBSf
 iL+3tXEoEO1V/ojtj6yoiJYuZQa9WmkQNMoQL34+cIrewMcBjVA8afwJW
 VwW4Ec3UiQoqZ4vK4USPjjm5j/kaFm7ek+4c729ZSjER26QqsUsOmfve8 g==;
X-CSE-ConnectionGUID: O4LTVsLRSku0fHgqx8iLZA==
X-CSE-MsgGUID: afO4xDPNS1W6yULcmMDN4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1895425"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1895425"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:19:02 -0700
X-CSE-ConnectionGUID: oQN0GZmRRK6xsk3Bb9PMDQ==
X-CSE-MsgGUID: ZFU68jAoT6KCrfKRM7q+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4979246"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 22:19:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:19:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 22:19:01 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 22:19:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoK7WvWZZJEGtgoyrAqXn51OOB+xzRDSMWn3fW/Z97kjA6vsdIzY8S83Vb+GcFifxighT8SVLOFFBkopPddTJL0/yGjA3vyumUc+U7XFrGIySyEGL5xf6Xh2mntF9En26dSDME1VFrOP5c2ZOOGvRCGhkO7GcgqzZXtpi118zV5mIZlimoGLG8OXfyCkK64IRsNg+vIprNBnv5dMsopcJCBENYMpQ/DfrKL9OSAsiDrLmEqMQSHQ3mZhQXtBLQVUxsSAfbi8DoR6ulBhP89z03HZ+hGMHQgvyXtBsIKDbi6c8TDuPcWNONrHccEDLRXFIB9CbYeSPW1xIu4iq9+IEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+iDRWBeZtQKC7ZocxSdLb+h52hGZp5WS1mDJJ9E4aM=;
 b=rt7mY2eHLd35mO+2tS3qNq6GZJ5Uf7MWb6TEoPSoxAxJhDMDH0XDHQ71VafeyKwXXqzDCO7D4fFn1UTKr/TqhFQc9TfzTmBcD/MgYX9TD+l83i9bdB/hFHaYUFSW/76DQfNvTTFG0QeUuySH04BzY8JtVWqcqB0fRICXEcpJ7UF7w6kUgYek75ehYX6GtDHklMeM3ZKj1MScfInw50UdTgf2YT0C94Sdmt13GYLIU4iq0LZFqRTBPRw+mSyg5Bg9UdoN0qynL3VIJmYjoK0Hpuhf/g3FhYhx35P5+e5Vyu3KfEE8F20VbTYuNAlAFccNcINkiv7bKhfMVAt9cUa47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by IA4PR11MB9443.namprd11.prod.outlook.com (2603:10b6:208:55e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 05:18:59 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 05:18:58 +0000
Message-ID: <fa135bc0-a990-4851-a4a6-551a4a290a44@intel.com>
Date: Thu, 29 Oct 2026 10:48:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] drm/xe/xe_ras: Trigger SBR for all device errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-19-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261026060459.771448-19-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0330.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::8) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|IA4PR11MB9443:EE_
X-MS-Office365-Filtering-Correlation-Id: a72a9800-04ac-45b5-d265-08df357c229d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261009223027099003|261021121427099003|261022113327099003|261022105027099003|260925021911599003|260925021311599003|260925022911599003|10067099003|56012099006|261021123027099003|261026140227099003|261028144727099003|22082099003|18002099003|261026121527099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: zEZASrLi04jJKhACMIoUn4/xc8eQKhVPukfmz3iz7HccHfBexB9GTb1harqMYB1RQ+qCo/KEVHHiZW5wD9NboLucWaA8XVK3ZMkDVqWCZg1OPP3imxRYbphMuaH8ym7FSvKImt8EXeVpOs4IKxNasnGGUuPi8/FPiXHhwh2KaBCLtpY4U02XwLuDWZlkNysM5MPpvF2MBbX5Dx1hOIqDLBviBahW9YWkhPuZ86Z87W+QGcJKkhR2/RJD4zQMYG0535bJPrjI+wfBFvAC9BIEzcCL8qEp5h5ODRwqmMSXDY+a2xvPn9r6S4pFTgGZFV1IUXyUBXqaYuevFNluIn3PnXF+yiKe2mHa6lYtJfGj0AdN/l/80yzcjwzZnfvja7f6ddD4FHTmJYb3fQhi4AYefpJRNkx3A4eryRvf0Ok5jvRmoRrh8HtSg7KJRaKoFm1DnQRWYM/JnnSQc9YQJtgnkEZ3AmMDsrOCOR2oMFKMZCXERlBv5wOn0P3VDPFYNMqegbqrWLC+cMZoQ53GTySaWwCdd1R6TkRJLBQfHUh19iarmWfGDmQwXx2pU1agpJ/KAcdNysG1iQozWS7guCS+1i+Tl9qazM3BrpOShzwlz/GNiEN42Gt43Ier2B4vQKF26ovOuB7MQDzwbzPWiXRT8xE4maCK0stDtgfeB2t97uE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261009223027099003)(261021121427099003)(261022113327099003)(261022105027099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(56012099006)(261021123027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(261026121527099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGV1b0tLck5DNElPb241VUo3RzYydVB0d0IrbXNsYThLZGM1N05uU0FEemJ1?=
 =?utf-8?B?WUk1Z1FCY0EyYllJeDdFRUEyaStLUmM4bDRUVFFHT0IyVXJrc0lJRWR5WTBm?=
 =?utf-8?B?ZXQ5TUVETFhPQ2Jtc01CdENkUnB1VjF4YXJydDczdXQ2cWR6VW9ZUkNxOWJ1?=
 =?utf-8?B?VVU2SFQ0b212NVVCNHF4S2JucW0xSWZ2dWtJdmYzN1VXbzBFSkd0RS93VzIz?=
 =?utf-8?B?aWFDWlByOVdUSDVvcG9VcFo0WForTXZWZmxCTnJKU3NiSkFGa2tMOFZhOVYy?=
 =?utf-8?B?S0lYUGNHK1JQak5jU0ZVVTVlNGp0ZS9PRUVmMitLYkNZL05uUGtlSGJ0TDls?=
 =?utf-8?B?TXpIQS9PZDd1UmRUU0x1RWVrTmZOUlh0Y0Nrd002L3BaNURNWDROTGIrMzQy?=
 =?utf-8?B?TFBGOVorYmFWK2lRbThzYWxvaExuVkxpUDZadDJOc1Nuek1SeGEwUit5M2tB?=
 =?utf-8?B?cnNrWGRuYTBSSURSMEx4TVF2QkdzUitraS9EZjZ5Z0x0UCt2dW9WQlRKZ3hF?=
 =?utf-8?B?RTlXZlQyS3dvcHNVcXFKdU9SSVlaSk42OXQxRUdRWjRRdFhJaHF4YVlOODlj?=
 =?utf-8?B?L2h3SEFQYStNczZocVliKzhrUTk2MmRveEdTbmhZS2ZCQkJiRkR3L3d4Y3JW?=
 =?utf-8?B?SWczZnZOL1I3OVVXbGNwblhScDRDY25UdHA4TktoSmE4SVQ1OVEzeUFnTmJX?=
 =?utf-8?B?THBDTXR5czNvRU1VR3JyUFVSYzNMQVRCYTd1Z2pLZXduTExwVUJwUU9MNWdp?=
 =?utf-8?B?VlJZbERqTzM0VTFENWJJMVloWmZKWDlQaDg1eG5MWDRFTFdGR29NalkrNEth?=
 =?utf-8?B?eTVzck5EWUxGR0tkaEtxL0pwTmtPdmtqSXQ3Z05uZWR0b2hROEFsbGdrWjNK?=
 =?utf-8?B?aDlmRTZ2a0lPY1BEdFFJalBVSVJzRGZja25nbGwrOXZZWkxmVll4TjNXSWZS?=
 =?utf-8?B?NDNTZTQ1VGE2bTkrQWVuMXlUVDYveThjQnRCVE5aOGFYcGVTSlVWZVFWazNR?=
 =?utf-8?B?V0pJckV6UDNVcEVUNkJINkR2TDFKTUllNXlpY3JFWlN3RndQVyt5eTJWeFJP?=
 =?utf-8?B?aHVWamI5TGdIWm51Ylo3VC9PLytCcmNzQ0JjY25RcXZQT05uUCtBaHpoK1NL?=
 =?utf-8?B?ZTRHcjFibjFGVm5BNVBGZGJzbVl5RzRlN0hRWWhJc0dtMnJ2OCtSZHRJb3ZE?=
 =?utf-8?B?bmJWNG5RbFI5dE9rUGtvWkJuYWpvWkhaYU9WZ2lQVzdMYWxxYXhLdDR0eUtt?=
 =?utf-8?B?MEFqdmtINGU4QzNrMDNSQWs5czFhd1BCNG9zT012WWRvZTduYm9IcG5iVkVJ?=
 =?utf-8?B?UjFLcGs5enlFWDJEaUhJaEk1UzhGM1pNaTZhZTF2YjNENm4wU2VWeGcrTzU0?=
 =?utf-8?B?VCs1TXM4Nm9nU0VRV3VKaVNjUU9JTS95WXVOV0F4VVFsMTJRQnBmOUhOT3pO?=
 =?utf-8?B?Y0ZYQ3BvTFVVREIzV1NZeVRKMlNIbStmaWxkR0hab2szOEJaQURSQXIzRFRM?=
 =?utf-8?B?VVgydUt1YlJaRmY3d21hOFdORzQxd0dhSENsVDNlZ1B2T3RKajBvSXdvQUR6?=
 =?utf-8?B?SS9GbTBaa2t3cDZIenR3NFFLcVBTRjI5azlOM2NDa0RpSnd6ai9pcmtVUlE0?=
 =?utf-8?B?Z2hVOVI5ZG5WaCtlTzhXSnlwYzFLVEVjR2RLVnF6Z21ZK3BadklRRFRNaXFy?=
 =?utf-8?B?ZWp5Q29COU5KVnlQc3N0bTZuSmlxSnZyb25vemZlQmR4UzBhcGR4bjl5MmJx?=
 =?utf-8?B?SFowNVh4SXpWTFJaUW50MmNoOXRMekxUWHV5T3o0eDkvRUw2UWpaS1lQVVRq?=
 =?utf-8?B?VUVqWVVIZXVhZkJReFlWVXZnaVNPZzVCODI4Z2ZIbHMwV1FyT2hjUjhhL1Qw?=
 =?utf-8?B?N25zWTcyMFdDUkxFRzVHRzI0R1cvaldsTXM3REIySDVyeVFGQit6R1RtN2ZV?=
 =?utf-8?B?Y0lYVE9UZlowNkdReEdJNSs0ZGQrWHoyZ0JMT3Z1RTVtdUlkMlhPallCMVQ1?=
 =?utf-8?B?TkcxNjlYU1ltV3g0aEVmd3NHS2cvZXZEUGNONkxpNFVndnJuMHJPOFV0UEp3?=
 =?utf-8?B?eFlZL0VXVXdtSFBYQjNHZGxnTGd2Qm4xM3QraEdzcDJ0c0Y1dG1mT1RWY0oz?=
 =?utf-8?B?VDB3SmhTRU1lTE1TSjd2OGIvQ2ZjZ3JycG5nRFZZSEE0Q0wzM0hVM3R4VVNv?=
 =?utf-8?B?RTVpUlVFR2VVT0ZndDNPZFEvSEVMakJHM2FyaTFhOHcvd3JjdGlzWTdzd08x?=
 =?utf-8?B?UFNFYmZwUHRuTitmL1lRYnd6bWlnWW5mdFZzN24ySEdaK05sS2lxTyswSTZC?=
 =?utf-8?B?OVl5NFI5ekRCR0hiOTVSQTBGS0t6WjFoZGUrNVhYeHQ2L01PWmxzUzVwL3hH?=
 =?utf-8?Q?7BzReIWkJpVJd1qY=3D?=
X-Exchange-RoutingPolicyChecked: b/USrIQWNHBYkiSEoy6L5/ET++P1jP1BHM0DxgnjISBrB61abR8HjJXEO0cTM4rjHOcFkFUtt2Rk9pj29AdFCE25jR9F/g8wJKKREHYg+O1tuJNtrLso2MqtqVcjpnRXwU1h58Lxtp0NpoWJZVJVB6zg+N3F+bx8pSYQWih579J1d2wgx11MrjrHMh9Rl3PHI6KZ9B7HDY2sFFT2Inw7b+qbqK/Vn7eWzuEuqcJiHG9mDlAIBYm+u7BfUfH+cfbjGpsgaTjSeL1w8g1GxLxHhVowhPvtplbHR8OJ4Mvc2Fq6wQKnMpgsrsV3nAALHoKCQzvo9Ic53VGkUQYpSYRCsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a72a9800-04ac-45b5-d265-08df357c229d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:18:58.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOKsASKeYCdNeGC8d6rVdK9OQqwhBxhG/67QGFkgZXnC5mGtTF4QXW6vnCq7kqvtn8EMZ6FqUgRiiXsbTmpUcDtf6yaBBQCEeE3TcmbkqaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9443
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


On 26-10-2026 11:35 am, Riana Tauro wrote:
> There are two paths for error reporting. Uncorrectable non-fatal device
> errors are reported via direct IRQ. Uncorrectable device fatal errors are
> downgraded as non fatal uncorrectable internal errors and reported as AER.
> Set the default action to Secondary Bus Reset (SBR) for device fatal
> uncorrectable errors.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 42fb24366a6b..3b07b2fa8cd4 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2026 Intel Corporation
>    */
>   
> +#include <generated/xe_device_wa_oob.h>
> +
>   #include "xe_assert.h"
>   #include "xe_bo.h"
>   #include "xe_configfs.h"
> @@ -20,6 +22,7 @@
>   #include "xe_sysctrl_mailbox.h"
>   #include "xe_sysctrl_mailbox_types.h"
>   #include "xe_ttm_vram_mgr.h"
> +#include "xe_wa.h"
>   #include "xe_wedge.h"
>   
>   /* Any non-null entry marks the page as offlined by firmware */
> @@ -718,6 +721,7 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>   enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   {
>   	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_state *ras = &xe->ras.state;
>   	enum xe_ras_recovery_action final_action;
>   	u32 remaining = XE_SYSCTRL_FLOOD_LIMIT;
>   	struct xe_ras_get_soc_error response;
> @@ -735,9 +739,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   
>   	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
> -	/* Default action */
> +	/* Default action for PCIe bus errors */
>   	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>   
> +	/*
> +	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
> +	 * internal error. Set the default action to reset.
> +	 */
> +	if (ras->aer_path && XE_DEVICE_WA(xe, 14028434957))
> +		final_action = XE_RAS_RECOVERY_ACTION_RESET;
> +
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
>   				  NULL, 0, &response, sizeof(response));
>   
