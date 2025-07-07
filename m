Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7F9C83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 15:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD09210E4E1;
	Mon,  7 Jul 2025 15:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkVVyDU8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2301810E4E0
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751903529; x=1783439529;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B3vlaMiPlB97lTJK4Yk3AqKyX8M+s1N0VONbAYoMMOY=;
 b=XkVVyDU8w2dWmVUN/UDeNWvwr9bTwKOGkK/vNIuRVa0p0sIW1HqGjc5H
 Tw26qYyjX338k1ZepYd8SShqHT5MYKniPQj4ykM9nWmTk2LhtoYHaZ9BK
 AVOwGkMqKSYShQJUoSEgzb/opIqMTscFvMrJAVe3JgjM2p6bOqWf/7NlT
 AcNxRVIoA1BMI8xTemvMUkKfNiumn/79jSZ5i37RH3bavdPqJbdOLmSk0
 PraSx5viOxSzHznfqsoqW/bak88vtXTusIJCpEdicIxxd6gNh0ubs6W3S
 TU9wawzqtjb1d0/40c4pxvswEIETAkqHl9YFCylK7gR8dVLdJRCagT1yy Q==;
X-CSE-ConnectionGUID: tCFvTgFQQ1uQhmRPbskyTw==
X-CSE-MsgGUID: V6jG4GWAR2aKnc15P1m2QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79559900"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="79559900"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 08:52:08 -0700
X-CSE-ConnectionGUID: 50cp8V7oQ5er8sKYwJeS5Q==
X-CSE-MsgGUID: y7JiNfroT7O37HvSnfIjGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="154672828"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 08:52:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 08:52:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 08:52:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 08:52:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2BxYM/+5crXKU7M1S2va/0erq64iK7YAVKlCfYVte4dfUv+ujDrYjX2TOmngE3KKEWb8iPDbH5ykNGk5dD+tQr0mupEwH1HiPGqIz8+Q8+KG+XFYTqCx6Uh7HJNfj+2MCQRyX4GjSMzCnEe0E5RBnY1H5hcWAV7JTjwg6P/iBStEVEob68THJ4LyFJRoOV31Z21zKSFR06gwMvKTzrJFlslfPUUXP7rufyCLtHNP9tbEJ/LjFBp7iqP+jiF2iNFIcVYCrKUEoVR/Pl7goTzXm+OODfBRgtObnf6+v75N37r4DLFjts6wO4NvSM7unrZkq5lDAV2sAqdiNxYSGQZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIB/ulI64cnl/4nBhuIVva0uTOyLRScTWjaI12R5ao8=;
 b=JDDYLPCdj0l5a8ZjEOOc/eMY8ieM4Mqu2rvhac5MfnwMTjIza41mQcY5USu/ajMeTRX1TIRpcJjGKlzKgsD3w9nTlFekqKn+dP1hFcreG5/mBnxX0deQDAsXCwB1YCyXFiwRu2CPcmzVtc/k96j8ud4TytYy5Vh9mJkfAEVb8LCBJSehAF94biDklh9leWX+ZJlpRp9GS8bLmZhLqQ7UrCd3rpS+wu4P+gOzmhH3Bz4YhVQRdxvaYz64OKsk/6i4QeR2EUdb2iU7pNB6OlGMIhz0DJYn/9EYX91OoIhpeseUcToH3CInyBNcaNxpIsJrrNdjI8dbozZ60UK/KljjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 15:51:50 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 15:51:49 +0000
Message-ID: <297d9c89-56cc-4000-85f5-e0cf87710f36@intel.com>
Date: Mon, 7 Jul 2025 11:51:46 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvdWM6?=
 =?UTF-8?Q?_Disable_GuC_communication_on_hardware_initialization_error=2E_?=
 =?UTF-8?B?KHJldjYp?=
To: <intel-xe@lists.freedesktop.org>
References: <20250703213845.2259302-1-zhanjun.dong@intel.com>
 <175173157922.137301.12644691265401040785@1538d3639d33>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <175173157922.137301.12644691265401040785@1538d3639d33>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:303:8f::12) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH3PPF4EB9556A6:EE_
X-MS-Office365-Filtering-Correlation-Id: 424594b6-7b13-4d5e-7ce3-08ddbd6e2f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUlxSkZKVHFqUVFnUWFGSUZDN0NreWErMTNCYU42M3VxRjVCS1FHNVcrWGZn?=
 =?utf-8?B?WVhTaHdybkpCa2FOS1NSc0E2WjRqSFYxSE4vajdVeUxTSnFtSjFhUnBSWjhi?=
 =?utf-8?B?ejRjOGZzaHdmNXRKY3pCTFQ1dXVkVmhYRXA4ZS9acm53NDNoVnZ2bklISGpT?=
 =?utf-8?B?S29yUEMzUDB2UTl0T0MraUdxM1EvQXJCREhaTTlMaTJMSzNnc3ZZUGRuUGMr?=
 =?utf-8?B?Qkl4ODBkYkNUR0ZIL3pQQnZPSE81ZkNpQzdDd3ptTVNpT2Y4SEdEK0I0cDl6?=
 =?utf-8?B?d2o2TDNkY1VxbElaVk9rdzgvM3dQU3RQc1NQM0NJSnN4eU1WS3lBYldFazN6?=
 =?utf-8?B?dktHY0kwd3RDTUJsRWhtSTJTa1hsZjUwRjhYUEs1Vlg3VGRpZ0hyY0J0VFRa?=
 =?utf-8?B?ZkJpZkhvSUtVdkFOVkpwaVFQc1JBazNJS1FSaWNJRktNNkNCNEV1UTJTb3h5?=
 =?utf-8?B?amplODlPRC85RzhZc2xmWUlublhkakVtd05NQWQvRm9YSis3R0YzN1ZmdENH?=
 =?utf-8?B?Q1NNdnFCRmJKUldDU0dsSUlqclh1aXpnNHZkZ0xKazdpL3k4OGhjOXNxVGZ3?=
 =?utf-8?B?MGhlVnk1ajZhYmRaYkRGUTBpVTlDNWcyY1lFUUVzd2d1cWpVOUV4NnQyejky?=
 =?utf-8?B?VXlYYzBRVUxpSkdqdStYQXF4U1UyWGFLZHJMRmlqUmpnN29ITjlzV09hSXVN?=
 =?utf-8?B?OHZNbTc5cFl1OVN6c3lJMVUxa0tMYWtkbXlpZzhldXo4NXdWL0N0aGFreUxG?=
 =?utf-8?B?aWo0N2ZZTmxWRzl2K2d3UFEyV0VNQVlwaTgrbUNyUkZwdzlNQmhNMnlkdTJr?=
 =?utf-8?B?OWtISkJpeTI2Z3R0REhPWGFQV2Rvdnp3dHE2S3FWVUN2T1RPM0JhOXlYRGN3?=
 =?utf-8?B?TkFtUlpHM1B6bWE3REhFSUVCZ1o2NnZQbFBZQzNYOEVGWDUxWS83UjRGc3lW?=
 =?utf-8?B?dVhLY1FpcldiMTRYVDVhSHRBVkRRNzFZOUNlSGVYWUFKeWxKVjRjZHQvallL?=
 =?utf-8?B?Nldtd1RKUjBHWGQ4NFRpVko5WDYwb25WaDllWXZNbE40aXl0T09XM2t4M0U4?=
 =?utf-8?B?VGF6anJjVFJrQUYzQTZTTERVdDZzN1Y4VjNsN2RaNzVRbUtaUlY0VWRPQzBy?=
 =?utf-8?B?R0J3a1l2Z2xYYTk1RFAxanN4VzV5R1hxUTRWZmt0eFQrME16UmN0RmhpajlK?=
 =?utf-8?B?Yk9xc09hMUJwSzVGKzEzM2x3TXBnUUVYdjdiV2JoRU42b0NlU1ZVUFdrbWNo?=
 =?utf-8?B?ZkJvaEQwYmhQT1lvd0VETXJncXJ2aDhJekdVWGN0cjVOS3ZJWFhKSGtzN2VR?=
 =?utf-8?B?UXVuNUIyUVpCdzNYWTBPYitBaytVQzIyUGFIYTB6cDZoN1RTZzNzOEVReDVF?=
 =?utf-8?B?VmJVU0hpRCtnMVJvQWZhM3pIU25md3lCSyt4UTZWNHVTV29pQVZyczhOQ3FS?=
 =?utf-8?B?YjMvckNhYmVBemZVbVRDVzZUaDNQVG9xdmJsQ3RtZ1luc1c4cFJBVlZ0TGRn?=
 =?utf-8?B?SjdQZ0NSZHJrbmRxeFpmSDdaNkx5VkZ3SlVNSGhhSUpCVHQrV3RWc1FRbG5X?=
 =?utf-8?B?ZDlqek1BUmswZ3YxNlNCY0RZVFF0TjlSbmZZbkJmbFZyZU45dE9TRG05VXVz?=
 =?utf-8?B?Y3hma3hFOHFWdXdtUW5WL3VxYlFRQjJmTkRobXVVRVk5UXN5ekRmVjNTc2Z4?=
 =?utf-8?B?TkcyUjBVZThOdnZJZHNRUXZ3cCtFRDFKOGVLeDdzZE50bnExc0pCcFJWbHEr?=
 =?utf-8?B?ZjZVUlppVE0vQll4d3AzWDBCTkgvK25VaTJQdVZ4a3JlMkRjR2xuQ0lzUE5O?=
 =?utf-8?Q?djVd7aoIAmKqaBLkdVF+o4obMhZHpX7TzC7ho=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmI2Z2EzMGdnSzYrc0FaK1pub1d0cmg0Y3Z6TmUzcGZJWVR6U213bGM4Wnl0?=
 =?utf-8?B?YnFqcFQ3K2lCaEdMa0dYTTdPUm9BRDZZUXdlREg2NmhhbWQ5ZHBGN3ZtcUgx?=
 =?utf-8?B?MjJzOGRRc0daQUNleEZMT3dzQ1E1c2JMc3FyOWhRZGNLTWYrNjAvWjNNKzIy?=
 =?utf-8?B?dTFwRmdTWHNPRFYvczBTdUhTSm9QZ1Bpc0lHS3RhVEpua1R2dC9NVE4wSmFi?=
 =?utf-8?B?WGorNldVMSt4bjlNbzVRSjhBUW4rZ3FOUFdLVHlMRDlNNno0ZUlQeHNhVW9h?=
 =?utf-8?B?cXp2RGQyUUtCRldPcE44Q1FCVlNFSzBldlFaWUZYTWc1MFRkTW1IMTIyRXUv?=
 =?utf-8?B?TWhSZHdNOG5HSlVtRVM5NzJ5eVNZUmFvV08rOVJKVmhOK1F3ZDdpOXYzUmR6?=
 =?utf-8?B?UXhnWm1sZDg2K0JGNEVWajZUWEdsZzBHNk5RZC9TVjdIUDV3aFRENDNRRHhK?=
 =?utf-8?B?QzEyNUVxM1lXOWduOEl0MjVzZzFSb21ZMUJHR0crUk1lVFRZOGRhdWdrbnFl?=
 =?utf-8?B?SU5jUjVyK1N5TmpBcy9OZXdmb0FqaTVCVC9aYkJyazNxYkUySUtNWENvOStv?=
 =?utf-8?B?TDVGUXNnZ2NtMm1Ja0lXRWwrM1JIbUJ3UDljd3QzRE8yYzAyT3cxOVVEcVVV?=
 =?utf-8?B?VjdySm9XR3JXM0VsWGlhRjBNcEJIdXh5TWhsanJnMlE0OVF2NDBoZ01DeEox?=
 =?utf-8?B?QmhvWGoxbVh5eGgvdXNDdVBJUkpsL3hhVStieHJ1NGdOemZUR2pLWml5dGxC?=
 =?utf-8?B?Mmh2eGUxbEE1YTJzYUJaV3pzV3R2MVY3UFU2U2tOZWJyUnpBQTZmRU41YnU1?=
 =?utf-8?B?dytTUXR2SndXWURiNk9NMFBhS2l0WTZpQy9KNDdnZkVwajd0bmY0Tms3OUtT?=
 =?utf-8?B?Rm9FOUt2cGxhaTBxM1E4WEpsR0lRWm1pZHQzSXd3UDJ6NFVDQ1V1L1Y2a0pV?=
 =?utf-8?B?dlJwRWV1N0NjaHMwSk4wRTZaNlRXSVQ2NjhJVnZNZFNFNStUQk5sL1FMVVJF?=
 =?utf-8?B?M05PaC9RbnBSTnJtdmkxNSs2RHJmdG4rT2l1VG9FT3Rpa1JMV05LL2ZVTjUw?=
 =?utf-8?B?MENqdnVXeEJ1YTlKWWpCNy9pZTZhWEpHRTJxRkZ6aWtDY0pQQzRLenUyZVYy?=
 =?utf-8?B?ZXlIQ3hRN01wNUFlY2RKY2xaRFA2WnBnSjhDa2hmRWNOTGpGYUttZDJVUmdi?=
 =?utf-8?B?S0VyQUVtZzBodmhMMFRYN292T0JyT1MwR0RNQ01CS1N6VVcwZmNZMU9hcEg4?=
 =?utf-8?B?dUQvQXY3dmhxcVk3NFZvZFNTV01IMmZURWFZVTBHTXVDZ2g3OFV6b0ZiSG9W?=
 =?utf-8?B?ZVlWeVJmYm02a0tRRGlHN3QxajIyMFpwb3R3VFdIMG9qRnBFQlR3L2JrUFZu?=
 =?utf-8?B?N1NEenFNbHJTWDJIOWROZXBIZHJEZWsvUHBKUDRaSHJyOVJkeFk3VCtnenM4?=
 =?utf-8?B?dFRubnJjcE9ySm5sd0Z6M3ZhWXNhdExpL3hXUUJNeW1NSk1kZ2pzeVVJYkxK?=
 =?utf-8?B?bnhRbmFnQWtuakY0b29FQzVUSitmOTNjaE9SekpEVFMzTzFwdFc1Tm1BQTVN?=
 =?utf-8?B?OU5iNVgwRmRsVWQvR2RVUldLS2wxOHZmWUVka3poWnRKbnN5a24yOWVxRDFr?=
 =?utf-8?B?SmxzLzZwRGFzZis3VVdCWjBha1RubFFKTi8xdFN6U2I2Q3owS2ZJdlJMMUFY?=
 =?utf-8?B?ckZieUJpbWFqMTAzT0c5NXhlaTRnMExlbmdYZWVZMXAxdERrZG5yK3pleGRY?=
 =?utf-8?B?ZnlNcEllQzlGR0N5Uk8zSE5od2RNVEs4VnZvQU9JMWZ4YmF2alBDRk9HUVFy?=
 =?utf-8?B?VFNZdmNUNjhnVHVnQ1VCSlBHOXBSaUZYYTl2d1VDQkszVHMweUZUWmIrYmVP?=
 =?utf-8?B?RmlZVDl3UkRDL1MxZ1NwdTlNWEFhQnIzTmVSUmRqQTVzOU9BNFovNE1aMzcv?=
 =?utf-8?B?amR1djJlTEtjaUdIVWxOd1FmSllKeW1vbFlvMWNTM3ZoUi8zQ0V3OFhMeUtT?=
 =?utf-8?B?TTN5Y0x1eWEwL0F4WVg0aVZCOHQ2aDZQVjlkaEJIckQwajd5Ny9rMXhwNWhT?=
 =?utf-8?B?VmFQNjN0b2w4cDBpU2EwM0l3TG1pN0FNSE5KNVVZQ1R2MkhucWdDL0EybjFI?=
 =?utf-8?B?N05tNVphUzF6RmdRaTQ5V1NGcnVobk94blVBa1oxaXZEN2Ezek9EV1Vwem05?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 424594b6-7b13-4d5e-7ce3-08ddbd6e2f06
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 15:51:49.2320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01UoS515mW0vuLIGFKI2U3gJAmC76cpsBix5Os76si6GYTYsabiIcenjcdlrJ726yiKEPqnajX0eutfcibjVqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
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



On 2025-07-05 12:06 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/uc: Disable GuC communication on hardware 
> initialization error. (rev6)
> *URL:*	https://patchwork.freedesktop.org/series/150488/ <https:// 
> patchwork.freedesktop.org/series/150488/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac_FULL -> xe-
>   pw-150488v6_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-150488v6_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-150488v6_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-150488v6_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-lnl-5/
>         igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-
>         rebind.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-150488v6/shard-lnl-1/igt@xe_exec_compute_mode@many-
>         execqueues-bindexecqueue-userptr-rebind.html>
This failure is not related to this patch.>   *
> 
>     igt@xe_vm@bind-array-enobufs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-466/
>         igt@xe_vm@bind-array-enobufs.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-dg2-432/
>         igt@xe_vm@bind-array-enobufs.html>
This failure is not related to this patch.
BTW, CAT error happens during the test.

Regards,
Zhanjun Dong>
> 
>     Known issues
> 
> Here are the changes found in xe-pw-150488v6_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/igt@kms_bw@linear-tiling-1-
>         displays-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-436/igt@kms_ccs@bad-
>         rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +19 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-432/igt@kms_ccs@crc-
>         primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +125
>         other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-435/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-rc-ccs-cc.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113>) +1 other test incomplete
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-
>         a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1727> / Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113> / Intel XE#4212 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4212> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-bmg-3/igt@kms_ccs@random-ccs-
>         data-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-436/igt@kms_cdclk@mode-
>         transition@pipe-d-dp-4.html> (Intel XE#4417 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-mode-timings:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-bmg-5/igt@kms_chamelium_edid@dp-
>         mode-timings.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/
>         igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@srm@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-436/
>         igt@kms_content_protection@srm@pipe-a-dp-4.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@uevent@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-bmg-3/
>         igt@kms_content_protection@uevent@pipe-a-dp-2.html> (Intel
>         XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +3 other tests skip
>   *
> 
>     igt@kms_display_modes@extended-mode-basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/
>         igt@kms_display_modes@extended-mode-basic.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         bmg-5/igt@kms_display_modes@extended-mode-basic.html> (Intel
>         XE#4302 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/igt@kms_dsc@dsc-with-
>         output-formats-with-bpc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-4/
>         igt@kms_fbcon_fbt@fbc-suspend.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-adlp-4/
>         igt@kms_fbcon_fbt@fbc-suspend.html> (Intel XE#2953 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2953> / Intel
>         XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/igt@kms_flip@2x-flip-vs-
>         dpms-off-vs-modeset-interruptible.html> (Intel XE#310 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/
>         igt@kms_flip@2x-flip-vs-dpms-on-nop.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-bmg-6/
>         igt@kms_flip@2x-flip-vs-dpms-on-nop.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +4
>         other tests skip
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-8/
>         igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-150488v6/shard-adlp-9/igt@kms_flip@flip-vs-blocking-wf-
>         vblank@c-hdmi-a1.html> (Intel XE#4543 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +7 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/igt@kms_flip@flip-vs-
>         expired-vblank@b-hdmi-a6.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-2/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2597>) +3 other tests incomplete
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-432/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2597>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-dg2-435/
>         igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html> (Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2597>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>)
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/igt@kms_hdr@brightness-
>         with-hdr.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-2/
>         igt@kms_joiner@invalid-modeset-force-big-joiner.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (Intel XE#3012 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3012>)
>   *
> 
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-432/
>         igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html>
>         (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/616>) +2 other tests fail
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/igt@kms_psr2_sf@fbc-
>         psr2-plane-move-sf-dmg-area.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/igt@kms_psr2_sf@psr2-
>         overlay-plane-move-continuous-exceed-fully-sf.html> (Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/igt@kms_psr@fbc-psr2-
>         cursor-blt.html> (Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_psr@psr-primary-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/igt@kms_psr@psr-
>         primary-render.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@xe_eudebug_online@preempt-breakpoint:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/
>         igt@xe_eudebug_online@preempt-breakpoint.html> (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/
>         igt@xe_exec_basic@multigpu-many-execqueues-many-vm-
>         bindexecqueue.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-436/
>         igt@xe_exec_basic@multigpu-many-execqueues-many-vm-
>         bindexecqueue.html> (Intel XE#4842 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4842>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-463/
>         igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html>
>         (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1392>) +2 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/
>         igt@xe_exec_fault_mode@twice-userptr-invalidate.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +1 other test skip
>   *
> 
>     igt@xe_exec_system_allocator@many-stride-new-busy:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/
>         igt@xe_exec_system_allocator@many-stride-new-busy.html> (Intel
>         XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) +18 other tests skip
>   *
> 
>     igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-bmg-5/
>         igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html>
>         (Intel XE#4943 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4943>)
>   *
> 
>     igt@xe_exec_system_allocator@process-many-free-nomemset:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/
>         igt@xe_exec_system_allocator@process-many-free-nomemset.html>
>         (Intel XE#4915 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4915>) +24 other tests skip
>   *
> 
>     igt@xe_oa@oa-exponents:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/igt@xe_oa@oa-
>         exponents.html> (Intel XE#2541 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2541> / Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +1 other test
>         skip
>   *
> 
>     igt@xe_oa@syncs-syncobj-wait-cfg:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/igt@xe_oa@syncs-
>         syncobj-wait-cfg.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573> / Intel XE#4501 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4501>)
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-adlp-6/igt@xe_pm@s2idle-d3cold-
>         basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_query@multigpu-query-hwconfig:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/
>         igt@xe_query@multigpu-query-hwconfig.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_render_copy@render-stress-0-copies:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-dg2-466/
>         igt@xe_render_copy@render-stress-0-copies.html> (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-bmg-3/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel
>         XE#5376 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5376>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v6/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-bmg-ccs.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-
>         dp-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4522 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4522>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> +7 other tests pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-463/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-
>         dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-dg2-435/igt@kms_flip@2x-flip-vs-
>         expired-vblank-interruptible@ad-hdmi-a6-dp4.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         bmg-4/igt@kms_flip@2x-nonexisting-fb.html> +5 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-
>         adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html> (Intel
>         XE#4543 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4543>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v6/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-
>         hdmi-a1.html> +12 other tests pass
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-1/
>         igt@kms_flip@plain-flip-fb-recreate.html> (Intel XE#3098
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/
>         shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate.html> +1 other
>         test pass
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/
>         shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>   *
> 
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-432/
>         igt@xe_exec_basic@multigpu-once-basic-defer-bind.html> (Intel
>         XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1392>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v6/shard-dg2-436/igt@xe_exec_basic@multigpu-once-
>         basic-defer-bind.html> +4 other tests pass
>   *
> 
>     igt@xe_wedged@wedged-mode-toggle:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-1/
>         igt@xe_wedged@wedged-mode-toggle.html> -> PASS <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-adlp-6/
>         igt@xe_wedged@wedged-mode-toggle.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113> / Intel XE#4212 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4212> / Intel
>         XE#4345 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4345> / Intel XE#4522 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4522>) -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212> / Intel XE#4345 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4345> / Intel XE#4522 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_content_protection@uevent.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         bmg-3/igt@kms_content_protection@uevent.html> (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-2/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/
>         shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-
>         size.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +12 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-150488v6/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4141>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-150488v6/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +11 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3374> / Intel
>         XE#3544 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3544>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v6/shard-bmg-5/igt@kms_hdr@brightness-with-
>         hdr.html> (Intel XE#3544 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3544>)
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-yf:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/
>         igt@kms_plane_multiple@2x-tiling-yf.html> (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/
>         shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html> (Intel
>         XE#4596 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/
>         shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2426>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2509>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v6/shard-bmg-2/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#2426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-435/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1500>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-150488v6/shard-dg2-463/igt@kms_tiled_display@basic-
>         test-pattern-with-chamelium.html> (Intel XE#362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@xe_peer2peer@write:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-463/
>         igt@xe_peer2peer@write.html> (Intel XE#1173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v6/shard-
>         dg2-432/igt@xe_peer2peer@write.html> (Intel XE#1061 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1061>)
> 
> 
>     Build changes
> 
>   * Linux: xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac -> xe-
>     pw-150488v6
> 
> IGT_8438: 8438
> xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac: 
> 05fd9cf9ba87dcf4428adbca5237845f2c04d8ac
> xe-pw-150488v6: 150488v6
> 

