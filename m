Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A7FE87838
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E1710E05A;
	Tue,  3 Feb 2026 14:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVnTVCJX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46BC10E05A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770128382; x=1801664382;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uNccOfOG5O2Gl2ZCBeBHI8DgIqoie+r5MaF5kmkC4Mc=;
 b=mVnTVCJXcwDwKGZZ8DjyPbJbr1VJw+c1bxPPcaFTOllmZ6SHEoFpDOLO
 5WH1+UQeZflVwBlZIEQRCDaSQXhLoEFOlL/+U5oTZZc1eTvTwoGYiYTZJ
 /hWhf9lnA/7GeNGV0LECCx/6r0Dmvm4e+TKoKsNUHXZtGiVztd8zCXyfZ
 EuEcUyr1VAPLVZerYmCy64Me89cUxZocqeNrkTZvWuC8PBZWZgyeGBGOD
 E1Y57pLjOG+feXlfa8OKLrCs81/jMdo488UT1ZAvhbe/3K/VZpg+YxUZL
 6tMAosaa2uw5/CNWjOv5a9C+bqynB7NZ2dH5IqNvCwQr8UCldzEm9SXzd A==;
X-CSE-ConnectionGUID: A6pbl1j5Q5qp5sA1udd1Cw==
X-CSE-MsgGUID: 7C1vl9u8QFOqJ911gPhekQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71461112"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71461112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:19:41 -0800
X-CSE-ConnectionGUID: 2vCXA6GRTz6adeVk9sBNrw==
X-CSE-MsgGUID: mjHC1tUJTtKDaU/fC8yiqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="240821960"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:19:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 06:19:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 06:19:40 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 06:19:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEcES1sFwDU/VfnWQXTPwXcmjOdFo0tZ0rQnttdIl/bc6n2jQIJPxlnIitruczmmTC3TdggVb0xmuLa4gQXuD5ugV8NHHNYmqm+HyJX6XAd8fsZKOGZLFi/l+dFA08Jie33C5uJElY6uqNJN074HIje0xNUN4M2PzeIXjA5Lph7HRPUYNZnh7jLCbB1wOkFOogFrwrFzclkt25n9nd5DMESu+WJmaLW08uv+IWc9dq9OeuqRRU+PSZ6WiVJJglIRP3uqOl6N4hSROZcMrUohoq/4LwY7MOmC9JubgWghFyJMMrV/aIeL2TsdBTD9HqjtgOA+voifK5GO1l4KIWNbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNccOfOG5O2Gl2ZCBeBHI8DgIqoie+r5MaF5kmkC4Mc=;
 b=S405Euou9k7tmsYhsoGGqBPi8OR1PWe8qfJQFeleladH9A+w3CH4jis6O/v9CFKCBJGaS273iVFuDTpB/RLE5RwaRcZppopPFgL4vc49n+3L2AP2cEy+J4X3/dEkyjvbFo0KUCIzavTwMVX4326z4L3UMxO4bXy8Ge6Eq4RcuLQ8F48T8KDX2TxzA7+KRL7weq4p3e/KbciaMfIBq2z1tTpwIAd8kqJUNvSQM9IG/jRhy1yo5WIm44E2OCFOmef78qx2f9ZGvsl/3PonfhWDzeUKGQkd8gC2qRDZWsjSf0up0YLdbKa5xIzo0ruhPuA3euacTsisioV5VGnTfit2bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 14:19:33 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 14:19:33 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v3 2/2] drm/xe/cri: Enable HECI CSC support
Thread-Topic: [PATCH v3 2/2] drm/xe/cri: Enable HECI CSC support
Thread-Index: AQHclRYRIZBzkuOJdUGFhOwEsFL4BLVxBXjg
Date: Tue, 3 Feb 2026 14:19:32 +0000
Message-ID: <CY5PR11MB6366EAF1E964F1C3BC072EDDED9BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20260203140639.2048912-3-balasubramani.vivekanandan@intel.com>
 <20260203140639.2048912-4-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260203140639.2048912-4-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH0PR11MB7422:EE_
x-ms-office365-filtering-correlation-id: 6b1c1902-c1d5-49e9-08d3-08de632f4064
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?S0pONVJlVFRObHdJTDZtUzZ1YmJnVmJoTEU0R0hnMTd4ZEhOa2ptaXVtSEUw?=
 =?utf-8?B?RXc0YnFzWngyU29DbDhFZUNMY0I2WDZKZGFuazUzUWhFN0ZBR0RYQ2hrRUVr?=
 =?utf-8?B?dWdncjZKYzhIbWhxR0o3VHBpYS91ekg3QS9McElzR2I2Mjd5Um5YcXlwOVEx?=
 =?utf-8?B?bmg2V21VQk9kVXhPUkxvYjJ4WXVzUTh6MTFqdWJCY2tVa1Y0NEtmK0x6R0tH?=
 =?utf-8?B?WlN1ek9SQU5rRE11VWxLdUNNSW9Yd0pQYWJMUllWYzVjaGw0cDZLUlkrUVhM?=
 =?utf-8?B?dHVDa2VJK3JmQ3g5a3kvR0ZkYzZQUm1aeityMERkL2hWS2NyRGkwRmN2TVRp?=
 =?utf-8?B?bFRMOU1EeS9NWGtjUmI5Mm1TeStaWjk5R0lVYmZnQmVnWGdQeVMvNWRLbnRO?=
 =?utf-8?B?TmYrajVmVEZQeW5jRlE4TjdIQlFDL3Z1eTBRN1pDRXY5OTI0aURUa0FkM1R3?=
 =?utf-8?B?c281WUpyL3JWdkJhVFVUOFhscktqSkwzUUh2N3lSRUpvajJGVHp5YnV4cWlE?=
 =?utf-8?B?NjVLSlkwa3pPQjhBRERVK09aZ2llN0Y0c050eml3VzhoZUhBeFlLb1hBK0R5?=
 =?utf-8?B?WlVEWXYxa3pPbEt3VWw2T0poWDl4M1VwYm9CUllxTEtHaUlESWxSSzB0c3Y1?=
 =?utf-8?B?NFNQUXcxVFRKTmhhbUVOVFhvMmhVaVhZZE9CbDB6bmNHNWdjWUdVS01URmNp?=
 =?utf-8?B?bjFYbjFmOEZuVlM2LzZKWHZCOGE4UDZvU201VjJJa0R4d1lRTWJJVUxLRllR?=
 =?utf-8?B?dHBzK29WTGJ0bzI5TlJ6LzgvWE1JR1k5UzlSUVY2R21YK1lYS0ptZkJCUXla?=
 =?utf-8?B?MmRuSG11K3p4K2lRM04zTTgzQXREd1R5dDZvNFE5SFQ4ZmxHSVBxRnRkYmRn?=
 =?utf-8?B?UkZ0SUtlVWFiaUh0R25Va2NneEhOUHQvSERYSDVXdHl2VEhlczBMU0xTSmFa?=
 =?utf-8?B?dExxL0hiU0cyaVhTaVVISkdoVFZFYkZGOWNGNFdpdWlISmJXSUsrVjQvMUFq?=
 =?utf-8?B?NEdTTzhQWnRXZ1BFR0M3bVpCZDNYd2tWdXFOK0x0NjFWUERoZDgzeit2RWZ1?=
 =?utf-8?B?WStvZmZRTGt2YS8vTjRUeTNFV0dYYzFxSVIrWGtXNWs0T2JkdzdvSzdOSXpV?=
 =?utf-8?B?K2Foc2wwc294V1EwUmUrOG5aYzBMRjY0MkNuUHVQUGpwcWJGVG01NGRnay9r?=
 =?utf-8?B?SGN2TXowVVBML1BDditiSmlGTlU3WDhSYWltVE51L1AxeVB6L2ZqNkhDWUtM?=
 =?utf-8?B?a0s1aWd5dk5LeFpianE0Wkc1SUJZd3FQU1FSdWdFRTkwclQzTFkrYlVjM2Vr?=
 =?utf-8?B?NzNKNm1tY0VESlhIT0gvTTQvaGpxSTdmYi9ydXBNQWJscVhtZ1IrbDdjdVN4?=
 =?utf-8?B?cEI0L2k5bUI4ZlRrU2xUeGRiMzI0cUQyU2tqbk41Um9sQmpuMDg4SjNhTTRQ?=
 =?utf-8?B?SXliaW9vTThMczZGalRJTmRGUFdBb2tpNExyTHlHR0xXb2IxZWdGVE03STZx?=
 =?utf-8?B?TnZnVnVNTXFQUXpkeDd3NExLSGh0RVVGdTBSbFJkUUJ2dXg2OW8reFZyeXRL?=
 =?utf-8?B?b2YrR29aY2kwZmJtRGcyQzdvTHVRSHpXNWs5KzgyUm9sNit2UEozYkhTV3kx?=
 =?utf-8?B?TWRBdElyMjNWQ09SVDExTnkxWHhLUDYvTVlVaVJHUUJmMGsxRnpwREpwNnZW?=
 =?utf-8?B?cVc0Rkp3VDJTYTZRakcrT2RUUWFXRUlidVFLWFRoblBTUi93bk9xUVg3cGxn?=
 =?utf-8?B?c29oWURPR0JjYzZsb1BpUGROV3JNZUtEemJPMCtOMyttajIyT0hDNTBaTnJX?=
 =?utf-8?B?NU1RREt2ZnhPYnNvakd5QkY3QjNidzBicjBSVEE1c0IyT25hR3pybHRBaytE?=
 =?utf-8?B?c3FhU2NmYkVIb2pHTW8xajZBekVnWmJlb2Q1c3dMc0NFTFlHM0VDQUJkYnVB?=
 =?utf-8?B?eDBtS1lKdHh5cS8zcVRqMW1vWkJNMG5qaVp0V3VzUUlzVjRBMlBkUnFFR3pu?=
 =?utf-8?B?bWNCUEVsTWRJWDMwYmkrTjdZMm4ySzFPUXFlQVFOOG0wWitFODVqR3pYSmV6?=
 =?utf-8?B?K25kQWYzaGZ2Z2tzbkdoOWdCK1ZtOFNGa1NrWVpodzlBUnovU21LK2lUWXpF?=
 =?utf-8?B?ZE52YkduMmJTSkc2bTY4dU1ESHJWOG10ZnNqT0RrbnAyZkRydWc2UzVzckVl?=
 =?utf-8?Q?zlFwogNywwymvP36WLpE81w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cCt3WTJrVGZKTkxDV3NKQXkzL3lLdS95UHBpY0cxQndKS2lSMzFNTEJkWVds?=
 =?utf-8?B?VE1FUlRWcm5GckkwaVEwUi9TTzc3MitRQWFDWDJzaldneXNscCt1c2FXZmRW?=
 =?utf-8?B?c0Q3U0JWSnVmc1BVM1BpQ0l1c01IdlNNdVZhQStaKzJSQ0dBOVhNNno5ejdq?=
 =?utf-8?B?QWFPLzUzOU1Idk5hdmh2UUlqVkJiVjlmSDZFSUVZdUFIRWYwVCtHcVAxR1ky?=
 =?utf-8?B?Y2tVWEtQYjlQUCt1NHA2V3g0Wnd3cXU4cDI2bTB6RU9xQ0JpWjcySlRKOTJ4?=
 =?utf-8?B?TExsS0RQWXdOZlE1dUNOblZBRnlydFA4WGNvOHJvSU93RHJtbVNlOVpPTkJk?=
 =?utf-8?B?enEyZzkwb0xjUmZjdTNWWjNscDlTbU5EbForUzZDcWdoT1lha3FoOGlMZ2Fr?=
 =?utf-8?B?bFV2Y2pSL3FMcExYV3k3VGVUWnJxR1VHRFdCV25jNjltM08wMXJUd3FyQmFI?=
 =?utf-8?B?dStST1p4dVo0Lzk2ZTdmQ2JpblpyRUlSZGFkSE51ekMzajQ0QVMybHVlbC9x?=
 =?utf-8?B?eGNLaFdhMVlkbER3UUtUMURhWFdZQzJiYWdGaHZiZlh2bjI1L2hQV1lmSGd2?=
 =?utf-8?B?aWQvT010VTcxVFFLMm9NVXRyYm55VHRMdFdYQ2J1VWpjNEU5K294MThCZjN5?=
 =?utf-8?B?bXdTK2ZMVXBnN0R0OUFtVS9yalRmSmFnVVhUMDVJSFBmYm5jQ2pPa3Q1ZnRU?=
 =?utf-8?B?R3krYkY0Ly9rSDVaNzlHMFI4WjdrQlZVbTlUdzlvcFlIUEltUVN6a0ZWelBj?=
 =?utf-8?B?SVhwQ2J5TW9nS1VpQnIwY0swZjBmdVd0VDdLRVBrT2dpOXdnTXM3c1lnUzht?=
 =?utf-8?B?ZDltVDQ0VUdONTl4R3gzSU1BejRoOXlXalBXZnR4ZEExU1NRVHVrTlFSODho?=
 =?utf-8?B?UGtWM0ErR2kzVTIvblNKNE9KaFpIQi9qLzF0S3JaWHB3NUZpREV4a3ppR3Nk?=
 =?utf-8?B?bVB3Z1ZSYTRyUVJpKzMyUEJMVXVHUGhKSi90bHA4RUdHeDJBYmVOY0lTTUky?=
 =?utf-8?B?Sk1Gc0xiL1M4SjRBUWZtdmc0bWlUOFF2SXZqWTJPVEswY0FLek1hRW9jNnhZ?=
 =?utf-8?B?bUJJWVRjbkdMbUJ6UmkvYzhlRTVsQVFxOWFDYjZ4WWZUNU5wM1k0NXJsNUFv?=
 =?utf-8?B?UXgxRDIwM0JHeGJjdmV0TU1JUzdNWlF6OVQwdFhIV1FRK2lJQm9scWsrR0Fy?=
 =?utf-8?B?cWxIaGtFL29lT1FPZUVqQm12N0JubEtpazUwQ1FtYXJYUGJzUnJVZXkwZ1VT?=
 =?utf-8?B?U0ttUUpMSktGbEtpdE9XRmRsQUdQbTZIN2V2OFRjQ0h4Y1UwSTMvYkYyazF1?=
 =?utf-8?B?cllFSDNKcEVST05kMXpNV1o0bC9yS04rR3JaLzFHWStXVUVKUlExSzh3ZUxP?=
 =?utf-8?B?WXhRKy9HZks5K0JCUXI4SnljNFl3TWxHcHBhYmFEUWJ2YXd1UXp6b0R1L0Fy?=
 =?utf-8?B?WkR4Vjdoem5zaVpqd09ZWVc2OHVTRkJ1N1FGbHg5RFYvazJiSFZxbEtZQjlF?=
 =?utf-8?B?aDlhYVAxOUJWRCs1aThWekNWZmNPMExHR3dPMGZGZUsxMFBBbThtWll1Z255?=
 =?utf-8?B?OWxWNk8za2t0Wkg3eU1kZXR3M3ZHMDdnT1NyOTVCc1VGZjN3WlA5cDFtOGl4?=
 =?utf-8?B?UW9uQU5ReXpEb0d2VjhxbFpUNElnNkV3dGhBbExDV0gyZDlYNFpJdk9RNkor?=
 =?utf-8?B?RFJTYXo1cUJIVElxV3Y2WGNQc0R0eThrRm5lcE5CVHZGVGZRNUhDb2JlY0xY?=
 =?utf-8?B?c2FwU09jdFBPUG1MVXJjZXV5Zm0xa2x3UE91anU2alFKcW1xN0t4L2dndFA5?=
 =?utf-8?B?aG1nU1VPWkxoeFpLbWhmdkpOa0U0RVdmb2RhQ085a0l5YzcyaFA1UWF6dkxy?=
 =?utf-8?B?TW8rbytha21nVWtxd25zb3Y2QjJHdU9XeFZlcHZXV3hHUi82c3o1QTF5N2Fl?=
 =?utf-8?B?LzJWVndoc2xnNGpSQnE3ak4rQ1lvN0xSejVDTXh5cnMwRFdrTlBQbDk0OTBa?=
 =?utf-8?B?RnJaMFB0TzFnRndoK3huQTdRTVg5L20wc3gyTzJFbk5SNlAwSWxyS2lUM1Jy?=
 =?utf-8?B?aGNULzJubGM3QlhFTTdOMjVJTVliMzRqZjJHYXltQW41NEZheDllcjF5Q29X?=
 =?utf-8?B?bVhGVi8rczY3MUoxeW9QUlQ2TUo0M1lsK1VYTWE3UGVEdldWWUVNaXFNK0JO?=
 =?utf-8?B?enZUVWM2ZEFjZDNXT3RxOEg0bkMzbkRTNXcvcks0YnU1elFQTlZHTS8zcGFV?=
 =?utf-8?B?b1ZWNEl6bGV2VjRjalZIcUVmM0tKYnF1WUpieG5zUUJoQTNaN1NjM2pWVC9H?=
 =?utf-8?B?eFcxVUFXL2pxSzRlZWxrRE5RZHhjWGpqTG0wTnRyemlxeWYyTzA3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1c1902-c1d5-49e9-08d3-08de632f4064
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 14:19:32.7370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JfT0xFJkZ8EGu7aIioWezyc7cMKSEV+Tw1X353db3msq8/MRgB+go3Y9C8jKtMY1CblkKMaBDkhtur343fjoP7Z3nTNGuMoRnaAJRfV3snU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMi8yXSBkcm0veGUvY3JpOiBFbmFibGUgSEVDSSBDU0Mgc3Vw
cG9ydA0KPiANCj4gQ1JJIHN1cHBvcnRzIENTQyBlbmdpbmUgYXMgYSBzZXBhcmF0ZSBQQ0kgZW5k
cG9pbnQuIEVuYWJsZQ0KPiBoYXNfaGVjaV9jc2NmaSBmbGFnLg0KPiANCg0KRXhwbGFpbiB0aGF0
IGl0IGlzIG9ubHkgZm9yIGZhbGxiYWNrLCBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gZG9lcyBub3Qg
cmVxdWlyZSB0aGlzIGZsYWcNCg0KPiBTaWduZWQtb2ZmLWJ5OiBCYWxhc3VicmFtYW5pIFZpdmVr
YW5hbmRhbg0KPiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3BjaS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+IGluZGV4IGI1ZTg5MzVmZmYx
ZC4uMjNiMWExMDkxMWNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNp
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaS5jDQo+IEBAIC00MzAsNiArNDMw
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyBjcmlfZGVzYyA9IHsNCj4g
IAkucmVxdWlyZV9mb3JjZV9wcm9iZSA9IHRydWUsDQo+ICAJLnZhX2JpdHMgPSA1NywNCj4gIAku
dm1fbWF4X2xldmVsID0gNCwNCj4gKwkuaGFzX2hlY2lfY3NjZmkgPSAxLA0KDQpTaG91bGQgYmUg
aW4gYWxwaGFiZXRpY2FsIG9yZGVyDQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCj4gIH07DQo+
IA0KPiAgI3VuZGVmIFBMQVRGT1JNDQo+IC0tDQo+IDIuNDMuMA0KDQo=
