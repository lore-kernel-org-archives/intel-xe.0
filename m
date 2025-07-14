Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948BDC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 18:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFD410E345;
	Mon, 14 Jul 2025 18:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSlZ+V4L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B493A10E345
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 18:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752518973; x=1784054973;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=/z4ZVmBtyihbGgRF5i7K2OATya2MQ3yOSOmRG526iIA=;
 b=YSlZ+V4Lr20lNoU5MYRcOugOqvxv7Ixp2/KkIvCDFyBHfW7t9Tj7ohIa
 YNYavRcoP6JYvlWTBz0YQg0VvHr3eICTzbvZ+E6fqBPNf5ynITlPjmhwV
 hUDAIG86p5KE7Bbzjww80fkqxfIR7qpD95nqCuxEzBXi5QbuCIRI5TdAM
 VIgVt2aHQdebuvnFt4/yYxTbVMqa34kGC2BOP1ssU3qForER2BIJFrqK3
 pNwdrcCYibzN/ef+mXpiN69GeHcfQFJsPc+2AnGMT5L848mkf+ZCAYCsk
 B0raKkZMAmS9U/xFeLFJuqiwhYpG9roboTbCTyxW3rn/ZEbvNnOA+CxFu A==;
X-CSE-ConnectionGUID: FRzyxaJhQWGcgtWoTu8N4w==
X-CSE-MsgGUID: vhhjx2kGR0mNYjqkdlKmBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65789067"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="65789067"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:33 -0700
X-CSE-ConnectionGUID: HE+1J3bWRDinLhOQqdR11g==
X-CSE-MsgGUID: qRrqQam2Ttib+Z2srkNbyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="162561431"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 14 Jul 2025 11:49:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 11:49:21 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 11:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqtdB3wG3cyTicGkNPdJyvvLSwbDTxr6n1mreZOi+IyjemeJqkoaNuTC75U0jOvcfKI1rNuBJqs7FZloHQwRf1/46jL9K/RLJnvGfjSLYdpGG3QB6b6pqOrFrbI324L28AJgVv6tIoijNVNjYs/vqUlWP+ddNHX1dZHpNXPJ9YtXjGb02K/PgG8vRzDUJbwUxnUyQx0RgsF8uwDp0W8L6ZQ5i+EPObx1u5LO8WCNHEmuPoJtpc1b3shE6ZpJqBbog2Nj3I10jXO2Z17k1/DJcmg/ZZUDZSyFJwjubDdGzus84hvdC9avgCcZprinSp2ewtgDFFlPJT4O2wTmYXW7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKh6NP3keQhXKPUw+33BWCn1n684Ck14Fp2Ch6zvwMA=;
 b=CaEy0bzL8Syd9L/LBB7T8IV8FK9u6m0U5ReursIRmRb5TT4GaZ9krJmMopRbGfTmcbWgyDZQ/1mMq6KtOJVA+tn79t/1VKhMECCt7PEEMRtlQSZDyyDimCKq9ADDFaGxghchjPc/1aQBAOVKfikAM25MlT3TNmECjgGZ7hqKA9wJQs+lOjXkgi32s9tqACDmMZZU+H+rpzLo/xe1T6odN8p1qZRT6fqt7NVX9ehBYC+dhcyiExO2ermo9e2IUhWceJ5yC+EzMOTS2MDVsMSeZ3qagM7XTxwFRMWd9qag29gyxF8AMRdaSONWfAiNX3hC9pZqlPsyJmmVDscJBIyQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 18:48:37 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 14 Jul 2025
 18:48:36 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH CI,
 v11 4/5] drm/xe: Split xe_migrate allocation from initialization
Date: Mon, 14 Jul 2025 20:48:17 +0200
Message-ID: <20250714184818.89201-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714184818.89201-1-piotr.piorkowski@intel.com>
References: <20250714184818.89201-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0173.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: 55937a44-4843-4174-2a91-08ddc3070aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEk2UnNqTm4vSUxWYjRWdU1EUXM4S084NHQzcjBIVm1MMXh5WUdhWkMvMkRw?=
 =?utf-8?B?YTJtTFNzdFNYaitBQzBiU3pacGJqZkx1NmhPbGpRRWRXKzVhckJHTU1ZWlQy?=
 =?utf-8?B?Ni9vbWpzS0RKOXFFRy9UcnF2TUI0UW5RQTFra0lDc1BNOGZISjdxT2tzRkpy?=
 =?utf-8?B?QWJKYTY4amxXZHp0WW01bjFzdlBqQWlSVXR0MHB5VElPV3pxT1RDQVY5T0Jm?=
 =?utf-8?B?MFhJTFVka3ZjMWx3eTNQU1llWnBKUlYvdlB5TVlJcG5UZVFUWFM1eURuSlBE?=
 =?utf-8?B?S2FhL1dXK1AyL2FZSzhZUDNrR01obDd3NTQ4ZWk5QUpldGd6K2ZRVFRHdm9L?=
 =?utf-8?B?ZUJDMjJ2MWNhbS9OSUczSy9EM21sKzBFMTNjL1dNWVg4NHJldEtiMUJqcS9Y?=
 =?utf-8?B?WFo4Q3YyL1NzZXBiVzJyVXE4NVpucDZ1QktXdnR4U2wwVi9yTFI4YjdqUlg5?=
 =?utf-8?B?djVlQjRSQmZZVWZCKzUrME5vSnVNenBObmtqN0ZyR2JnbVZiWjVvM1c0bUpa?=
 =?utf-8?B?R3o4V1FiM0NPcXNubWRsTnl0WTNFRFJpSG9zQzFOSWVLMUJybUNVS29lMnN1?=
 =?utf-8?B?Y0I2R294UUYwZTltOEFSY0RGNjdrU0ZraUwzR25aZEVkY1pxU0ZrUXAxUSt0?=
 =?utf-8?B?SFA3S2ltWTlzTEwxYTZ3RGF3bFJlZk9mZzNpaVRKWnRLMnRSVkRFbHNVcGlG?=
 =?utf-8?B?VnZIWUFkeTNjVEVPN0VSemk5RmVSSkpQNGZNZ3F6bTA5cTZlNWFYTWJxL21w?=
 =?utf-8?B?N0tIQnd1UnpWd1lOQzNwTHFQR3l0RWpoTlgvZEFTYUwvVlErU3gzTXh5Vldn?=
 =?utf-8?B?VVNINGZvS0p4cXg0R1JSZGRIaytrZjNrWGJnbEpKbjY2dElreW5rSWJsZFVW?=
 =?utf-8?B?VEYrSUU4UTJhT3pZclFLZlhJZnpoeDJTL1ZTRzZRWTA3YXlVOFFUOVJWRitT?=
 =?utf-8?B?WWh2Ni9jeTFtZ1BNNHZzRDJRTkJIYmxyMkhJczAwMm9rb0R3d29rdGlGcWFK?=
 =?utf-8?B?N0xYZndLWmJ4WU5nTHhHeE1uL0ttbHdzaHQ5SEwrcHF4NmdmWnFIbmlGVEQ5?=
 =?utf-8?B?TTZuZmxyQ1Viem54YTFZeXE3YnpML0Vkb0d2WU5CdWRYb3Y2Z3IvTVUwcm5j?=
 =?utf-8?B?dWFKUkt3d0RPbkNvMDc4S1hlek9zVnBpb0JGenptOCtCL0dwQVluUkh6N09w?=
 =?utf-8?B?NVFBT2dGRjMwdHltMlpQQ2NpOFZVT1I4cWF4aFV6MGQza3E2L2I3M3BEb2tM?=
 =?utf-8?B?dnQrbGxHdmJLTzJvYys2dFViY1dRc1pQRUFPR01oVjZBd1MxcVBhVStMREhB?=
 =?utf-8?B?UU5wSk12dmNnakJzbStJcmhXUGc4NXc3cFhrdFRlV001VytjT3NQNC9oR0px?=
 =?utf-8?B?ZWZVWVJWT0lMRGRKaU1Qbjd4eWFLc0hrVnl5VDNvUCtBaXkwZ0VKNEIxc0NE?=
 =?utf-8?B?NngrdUU4elNQNkYyVzZrZjZ3THBpR2pvaGlkaU0xODFFNDkybS92bW1sOVMx?=
 =?utf-8?B?WDZ5MXVJQTY4cWZUM3loME4zdUh5Y2JhK2w0Zmp3T0plMTZVYWliQ3dOTmFJ?=
 =?utf-8?B?U1N4U0JtQ2NKZzNtYnc3L29lcUgvNm1XZmRyTGpEWUNWbldpSHNIV25xeVhq?=
 =?utf-8?B?YlRzd2hxbTFoaEdXS0k3LysxQUZjbXgwTzVpTXRlV3RSWVBGNCtrZE1SbGdk?=
 =?utf-8?B?K0I2MnpMMVkvOUhEL0pacTcvOVZaVmkvVmZXc3MydERtYktjTWUzazU5ZTB6?=
 =?utf-8?B?eFBYMU9jeFppK1VPNE1oK1pYNkhUQXpZbWtuWnFSYWRrVmhldmoxRlJpd0pO?=
 =?utf-8?B?emIxQVovVEpUaW5VNlh5T00vV1lsRmVxbkptTnZlRFRwbWhGSzhVeFZkU01o?=
 =?utf-8?B?Z0tsVHVnRDVmcS9XY3dGQmxYaWl1dTVOd3Bvb0VHbXhIS2dLQ3lvTlZ4SzFF?=
 =?utf-8?Q?9hC2Dgff80I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3VEWVZRVlFzVnI5M21ETlozZFQ4Yk5mSlBsSnZMdTA2bSszcGVLNmxTNFc0?=
 =?utf-8?B?cGw0blNiV2lTNVdMVnVsNE5ZUkIyeE9CNzRtTnBTU245MDRVOFNRdDRqa2FM?=
 =?utf-8?B?K3dYbG42dUxGTHhqV2JHY3BLTlpySWpzRTR3MTN5c3JiRXlkMDRsNzBSckJ4?=
 =?utf-8?B?VE1lUWxDejNHL2dOZU5PaStLTUVVbmQ1R0Z3Tnh1SGc3K2p2TzRxdGJIZHVz?=
 =?utf-8?B?L252N2VGS3RmankrUm5LN3ZhTkR1eFg5amtuVExod1c1cFIvT2ZZbkwxN3VJ?=
 =?utf-8?B?RWZsdDM4bUtrOUpZandyQVRJcjRWQng0K1Y0YWo2MUJRZCtPamlDNE5USENl?=
 =?utf-8?B?RTJTQzNldHNrOEZvb1UzWlVCekNuaDBGamNFOFJ3R2lRempIVnFoWGNuN2Qz?=
 =?utf-8?B?b2dnTHk3NGxVYmNzaVhGc3BZVElROVlTQitQMDdTcU9xaTZrQVBKeThWM2tY?=
 =?utf-8?B?d3REc0liTEg2cTR0M2c1MFMxcHFIUVdSMFptSTh6V1ZKQ3VMQ2xHTHR0RWpV?=
 =?utf-8?B?YzduY1g5RjlyQTZhNkxCRDRWYU4va2hETmZWODlNVVFXR3VDdnE3RXBJTmpl?=
 =?utf-8?B?WmlmT0lLK091a3VJRG1nK0l2NE9EYmxWZSt3TFpWZHNFZGlyLzF3cFhIRCtS?=
 =?utf-8?B?YkEzd05Ed1VOVGIvZkZDV0M4TWxvYWZTc0NyUVVwNzZNZnVaR1JaUEhSTXpm?=
 =?utf-8?B?WWpWZXdLVDBNQUdUdm1NOWpYRWJqU1dhaUZlN2dtRUgxeTJ4clpzU2tuREtP?=
 =?utf-8?B?Mnlyeko2dUdMaVFZTGcydk5vZkc1VmFjdGYyN3hocFdxczhZaWtFK0Z4UHBo?=
 =?utf-8?B?YjNrWHVudWxMeld2c1pNN2FGQiszYmNvR3VwZmRRWXkyS1BXeWRQanNMTFEx?=
 =?utf-8?B?N2xwVjIwTHZCRmpBYmVVZGw0d1lOUG9pbFdRMStPSXFnOFEwQWpJMnFuN3V2?=
 =?utf-8?B?OWl4Y2dMNHdib2VLRy9rSnBwNC82NHhKemplMXYzZlBabzV2V3BiYkdYQlUv?=
 =?utf-8?B?bk5NMi9qV3R6c0xrcExkd2NYYytMUTQ5b2R6WE82QzZuanNwbTRmaEcyTndr?=
 =?utf-8?B?RDVibzQ5QTh4dzNXZWhmZlEvM0JFenM4OG9EUlRweFhydElva25iUEFtMGxP?=
 =?utf-8?B?WFpkMFpDRmd0NXBHYSt2RDVBU281OXpRV09LUXcxQm5UZjlpL0VQKzFwRFpn?=
 =?utf-8?B?RjE1dkVsUkdGcFp2bXIvaXhHUmZmTG5lWGFtME52eDd1MkwzcHR5RWNWSm5K?=
 =?utf-8?B?bm5mR3d6SzJDUi9naHQ4VnROOXZTZmR1b1hQYktrREFlMldtRmRnZm1OdVlZ?=
 =?utf-8?B?SnI4eVlMUnhydzFVQXFRSUpJOGdjcmpvNGdkYzJZODNzeGd1cUxON1lHRU4v?=
 =?utf-8?B?emEzZU90QW9valQzQm53dGJBKzQvYm9Sa01aRmorRFpKYWRTcXE5dVNOZXdN?=
 =?utf-8?B?czc2UzJKNERPajQvTDlvTVF1eHo4ejhLWXVVbk1sQ2JiNG9HTXZyY1IxQnZ5?=
 =?utf-8?B?MkhRcHFrcVlqVENRc0RPRUxuOG5XaGQ4YWtPVmw2UFFNRTFscjBmY3FuamZj?=
 =?utf-8?B?VTFzZmFuNHp5ZmEvR090dzVqcG5JMStNWjBTV09KT0p6VjA4enBQSEFJMFJU?=
 =?utf-8?B?eFJVTnA5dkNRbkNNeUJxODlDanFkNk0ySmZVemsvbmF5eDgydHkyeHN2dnpT?=
 =?utf-8?B?NTZkQTdaeTU3eUdIOHptOEtWN2E2dVRQZVAzSXl6ZGRFMmlHUHg5OHMvQjNn?=
 =?utf-8?B?clpIRUVqemNlUGdEd2o2UXIvbnFoKzgyUmJYaHJueFppQUV6VmU1c2pmNU9o?=
 =?utf-8?B?M0twMy9sQUc3UktHQmJPUTJDQWlUVVlES2RsZEFsbE4vR2hFZEJleEw3NndK?=
 =?utf-8?B?aW5QWEU5ZitzbXNOWjRzWjRabDd5T0dLekFxT2IzelBOSjB4a1dFNjcycEEw?=
 =?utf-8?B?NWhyNjlYcWs2WlVubFdhdmR4dTRGb1FmOWx5dzNPdGN5QlZCVXN3OU1UQmxy?=
 =?utf-8?B?Q1pSVDg2N0hBbEs1amE0cktmSUtUcUlYZTZqQ25LeGFsTkVnRGxSb3hVZy9Q?=
 =?utf-8?B?RTYvaUkxR1FVM20yV1dpbGJEVFFnV0JjeTNxNzN6RS9NZVlydWVRSTBUN1N1?=
 =?utf-8?B?RUY2cmQySE5uMXpTbzMrQWpXTnlOby9MRTVDSkZuek95eXlHMTV0dE9OSXlj?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55937a44-4843-4174-2a91-08ddc3070aa7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 18:48:36.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WrUybCYEO7psPcXvD87EJlFAQITI1WIQGbPofiglKf4dMegX6ECwc5DdrdVB7CVo5o5JEgIUWbvCz3V236Ywf1Ouqf3Y7Okodk9liO5JSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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

Currently, xe_migrate_init handled both allocation and initialization,
Lets moves allocation to xe_tile_alloc via a new xe_migrate_alloc
function, and keep initialization in xe_migrate_init.
This will allow the migration pointers to be passed to other structures
before full initialization.
Also replaces devm_kzalloc with drmm_kzalloc for better
DRM-managed memory.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 25 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_migrate.h |  1 +
 drivers/gpu/drm/xe/xe_tile.c    |  4 ++++
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d6186ac530cb..6a80ae6104dd 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -389,6 +389,23 @@ static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
 	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
 }
 
+/**
+ * xe_migrate_alloc - Allocate a migrate struct for a given &xe_tile
+ * @tile: &xe_tile
+ *
+ * Allocates a &xe_migrate for a given tile.
+ *
+ * Return: &xe_migrate on success, or NULL when out of memory.
+ */
+struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
+{
+	struct xe_migrate *m = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*m), GFP_KERNEL);
+
+	if (m)
+		m->tile = tile;
+	return m;
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @tile: Back-pointer to the tile we're initializing for.
@@ -399,16 +416,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *primary_gt = tile->primary_gt;
-	struct xe_migrate *m;
+	struct xe_migrate *m = tile->migrate;
 	struct xe_vm *vm;
 	int err;
 
-	m = devm_kzalloc(xe->drm.dev, sizeof(*m), GFP_KERNEL);
-	if (!m)
-		return ERR_PTR(-ENOMEM);
-
-	m->tile = tile;
-
 	/* Special layout, prepared below.. */
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
 			  XE_VM_FLAG_SET_TILE_ID(tile));
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index fb9839c1bae0..74c60f55004a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -93,6 +93,7 @@ struct xe_migrate_pt_update {
 	u8 tile_id;
 };
 
+struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index bd2ff91a7d1c..171de6a4ba95 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -94,6 +94,10 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	if (!tile->mem.ggtt)
 		return -ENOMEM;
 
+	tile->migrate = xe_migrate_alloc(tile);
+	if (!tile->migrate)
+		return -ENOMEM;
+
 	return 0;
 }
 
-- 
2.34.1

