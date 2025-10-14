Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA651CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 11:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3CB10E5B8;
	Tue, 14 Oct 2025 11:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6yTEa0M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6E110E5B8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760443143; x=1791979143;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P0qgRMtoSGnUB5qcqnCmoXd8kXFsJOIstTrgHqFHvZ8=;
 b=H6yTEa0Mpkq1vejiopxmrJoIrUsjp8c+dm7M6kY4+1qrVAoYMTH2BAZz
 pfq0bAMQNAY/qBT52yTQ0IFmP0Di6DCwq+BFbnOrkfXf67X7pMM8U8pZg
 PqSn8ZaJ2Y1Z0HBKsXWbpeKANC8ZXOvsI2PbJdm3ZprJyiuYnSufhODaH
 kLNDmKc3osR77mvBDEt/Kydzt9Hl3Po6OSNfxx8bwHJ/109OCMc+12ZQF
 1ckdvWjh1p+FvVZrzFYpsMKngKpoQKIsq4+R9CTMvFAWQb7whq40Qs0ay
 UeuLcOzAN1d4+TAXQ5J34KccqwjP5xV9NJEmmDCOrluhz98NHuV1Cy7es g==;
X-CSE-ConnectionGUID: YN300+k7QHKhVIhhEFnqPg==
X-CSE-MsgGUID: W9V3a/sfRGyIMxK+f92qdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62695942"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62695942"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:59:02 -0700
X-CSE-ConnectionGUID: x1u21+qJTkqYH4YY58CLrA==
X-CSE-MsgGUID: oRJtc96DQMmFLIT9oFMCVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="187165015"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 04:59:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 04:59:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 04:59:01 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 04:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ni5PUHmScGeDM/gSUbqOXol7888FTR8G6t81q3yqJL5NjkdO2jRPGJyHCFA9JfDjd6hxNYwmFGgfk4HCjDU+1GipM+PxkFx1Eo1CDX82F00YWjfkKASJJmR1DfztCN3ok3SPHX+tTf9Al+KbbhKXhFxZzFFDAWcIhyA5JP+Vg93379Xdi/8pPEmX58j6nrX0GtUCBbKpR2bUo2AH64CkNs3INSff3n4LdD11pkgjlsmKztY8CE6/kWqHkP6P7kE8cOxgaYuA9Tah6JEAc8d5Lfept8fTEIPCstxmBk+TcjMgEqLEpFWV47t9g1VbHVMZwXYnzqB8OTH1AgdOJBJ5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Z5ud945l0ctoj51r3oCN5H365IW+88LdmC2uIA3K6I=;
 b=ssPPhKbzjnIQtll0sJ/nQ3iYgRPnlklOoA79t9LxuLJrUZQmdEQ6yWR+sv/nw0F/i5LaJUHKFhMMC1t3DNDXdVx3pyAhXNCG/UH3mEIJMUYsy2nh47uwWlkLjHUUIKdeS7r+LuPj/PM7PWr3t1HxSktJQhb8KPl6ogrnrj4DXRLjWNZ4wgd0sSal0MWrkZjlUJ+yVq9xMsoJWiRM9Re5QkTiXw2iBNtzf9cz+c+dsptFp+b0Y4BeIdbELtRc1N+PsUJA+qhAq+i7Wc6Bh+uo+eJ8PEZIvEqlpbTOTniIHkjPNvheBcSapFZ6zAwVnN4wh0s5vopFrYGyu6exLO6QsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SJ5PPF8EC896901.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::844) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 11:58:57 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 11:58:57 +0000
Message-ID: <7b5ed9f9-3b0b-4d6b-b2bf-a3abd209e4d4@intel.com>
Date: Tue, 14 Oct 2025 17:28:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-5-bfb74f038215@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251013-xe3p-v1-5-bfb74f038215@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0064.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::13) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SJ5PPF8EC896901:EE_
X-MS-Office365-Filtering-Correlation-Id: 59aaeede-9f21-46d6-17e8-08de0b190df5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXBDQzBqVUFNUzZHeGhaQWZURER6SmZ1UDdvYjhNOXY3NVpIWjFvbjFMOElH?=
 =?utf-8?B?Z0ltSGR3UjFoa28zNy9TcExCOUpZcjNlcjNQaU1qT3FQNU51WW90TW1ZMERD?=
 =?utf-8?B?UkpqWC9QSUhLKytaeWZKNlRvc0NSdStiRFI4Qmtwc2oxckRCaDdpakRxUzhC?=
 =?utf-8?B?OHhLdGZQOGhoUEtLQStPUjBqc2hEOVJIWDM0VGx6VHVPdzZFRnFveDAvalFz?=
 =?utf-8?B?elpvbXpTdmI1STYydVVyV0lYZzVRNXVBMEsxWmk4WHFQbTkrVkNUa2RmcWl0?=
 =?utf-8?B?dXNiZnRSMkI5YkFtVWdISk5tWjNMNUNNdHc2dTl2SEV1ZFloaFVHNGIwa21y?=
 =?utf-8?B?TlFTRlFicUtKL0FrcDJORE40TUNWSkxRTXRsYlVoWndya0gyL1R2RnZrUzJt?=
 =?utf-8?B?ZlZMYnVVd3NOMkFVanQ2TFRCMjNldU12TU1NWVMybm9rMkZLRUlQYjZQOWp3?=
 =?utf-8?B?SExuYmJBVncySjdFQ0JaYzZDZ3pCa0ZwaUg2Y1VpY01YbnFtQjRTTTJOUzdH?=
 =?utf-8?B?d0c2dXdLWk1neWVpOXNQQ1RxS05XYzN1OWVUUEdENEJaK3ZKSEFGZUxXWmtO?=
 =?utf-8?B?cmtXd3FqSUxFUlBDeXBZSVk0bXVsT1ZHVFY2OWJwQmR5QVlYYTYrMnRKNWJi?=
 =?utf-8?B?NEtHbVZFMnptNE14eGNGMWdDUmVKWXo5NVV6bzBpcXo1U0RFNmpIVmRsa3RQ?=
 =?utf-8?B?TkhMSTZ4R3RHTzVCOE9lQXhBYllzMGVKZEZKby9zb216ZlJhUW1FbU44THR0?=
 =?utf-8?B?cEVkQ0RlYUNFRlFuYUFWcGlodFExOWtFbTl2UWduV2p6Myt0N0J5NnFTOUlo?=
 =?utf-8?B?d2RUVjNXeWlYRm4xNmp4SExaalRkRTNUZDFkTXZjRjk1endrZXNrdUdlVUFu?=
 =?utf-8?B?eXZNekY1VGZjZ1Q2V1FrTWkzN3NwUTY3Qm11dVV1STU4b2diTXJiZElYRGJQ?=
 =?utf-8?B?V1FVY2tXMjVoQmRhcjFndm1xWDYwekltOE9CR0x0b3VkN0d6M0dpbXEvek9s?=
 =?utf-8?B?WUljaWlFNVpFTndoSTBTaWRRVXU5Q2M1L0F4THplZDFUQ1pzS0Y3bkRnUW5i?=
 =?utf-8?B?cEN4VFVRcmFPTkVCUWcrTmxKVGNaRXd2TXdqYWtDaXlCK3ZBVHBqNVNZS2hz?=
 =?utf-8?B?RHlpQzkyL0t3OHYrS3ptdmh4ZEp4ZE5qUm1EaTFhQU9JKzBzdzNjeHNLeDF1?=
 =?utf-8?B?V2JiWkVDbDhVYWw1andQTHRGQk5TQTNraWRTdnJEZVZvSlVrdVBWK2RGbXNS?=
 =?utf-8?B?d1lnTmtLdm9jTjJtdzZqMDQxNUk5TmFwZG8rUlduUkJyZ2YwTlNJL3pKQnRO?=
 =?utf-8?B?dXVNaEc1ZWVxTU41cDh3NlBTaGJkUUJ0ZUxWZDJINFJSUGc2UjczdXdHZUVv?=
 =?utf-8?B?UzAraHptUVl3ekhLMFlvTllYcmNTamlpby9BZlVYT0Yrc3QrMDRmQmVBTGU4?=
 =?utf-8?B?ZFJLRzh4SnRHVG1MRno4ZFR0WEZFc2grMitSVis3Q3hGZGl0TTVqQUlsd0M1?=
 =?utf-8?B?Z016UVVTbVk0WXY2Ulh6c2FvNlpaZGtjZDBHWlRWSjZ2Tmxpc1grelcvYkdJ?=
 =?utf-8?B?QU41dWdBK3BKam5IcDEyam9tVEdKc0N4dFVlbjJ0emo1aXpsOHF6VzAwdS9Z?=
 =?utf-8?B?R0MwUlZXWEdocTJEMmhNZFRmRVBWMnVpMmswNjNzMjNBMk1RTXFDUUZIT211?=
 =?utf-8?B?YnU4eTZyRzhDZjBJRzBqOW5MUkNjcmVydjdlZjNCR2NTVGt5Zi9EVzVWS0E2?=
 =?utf-8?B?OXN5WDVhMDJ0MG5IMzczRkpFc3BaLzRteVVIbDEzaHZBaFNheFd4VjRHdXBM?=
 =?utf-8?B?Z001djlXOFZ6Y2hRckxWc0NPeXNEV01SNE1QQmFtSjdKVXBmbU12OE5CK1Qx?=
 =?utf-8?B?ZjJJQ1hVOXU5Ymx1dnQzY3pGU3ZUaE1tNXorVVlNVitXbFFQQkhFcjl6bGhI?=
 =?utf-8?Q?aLSySslkLfnWpiEeRFDAXXO1GLyzgo4I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFJtcW9WNUp2cGNKZWc4R0hFMGhLNFZoMktkWnlSVXJMOVp5UzBmVFJOWXhS?=
 =?utf-8?B?R0hYTnQ3V3ZPQ1V5UWdQS21yWEhhRDFFU01oRVZYQm40dWhGZzdVZ3ZlQU5t?=
 =?utf-8?B?UFFid0lybldWV0s5TXpPenhzckM4eEpMckx5d2xROGpDTlAzcjg2eGdGMEps?=
 =?utf-8?B?ZG1Oajd6WVZ0ZmI1bG9rejV1d1ROeDhZbTNXSGhhcTFuUDJ2Rlo2WTBFRUdL?=
 =?utf-8?B?L3phbHJWTTE4WUJ2Wm1LMmF6Y1VpM0VuWHYrWFk0bTcxZFMrVkxUR0o5Mm1j?=
 =?utf-8?B?Sk1nUTVXM2dXK1V4Y3M0TU1iSU1YTEh3OHd6clk2YUhXTVZjNXM5OC9QVzBY?=
 =?utf-8?B?MHNEVXFlUElZZHU4Q0tvTkwrL0NGcE15SmttV2JxVmloZG5BZjllUEZUVE1I?=
 =?utf-8?B?T2Q5TFcwM1pGMnBtVXlBOEFJTXJkeHpLcDRwYnhudExIcmR5NWEyTFRZMVZS?=
 =?utf-8?B?Z0x0dzh4SWd6NXllYzFsUkJGcHNwQ1JBbHpIRzJvQzdObzBrVnIvYTdzbTR2?=
 =?utf-8?B?Q2RTRFFmaEIrR29VMFFIcjFPOG9rK0NQM1VXSys4RGRPUFNwZk11N0F2TE14?=
 =?utf-8?B?MUFZeE5MYzNPb1NwWTZMZFdmMDRjbUhEMnNyV1QreWZRaUJOeE5tdDZnNW52?=
 =?utf-8?B?ZkZwZzdkMThNNDh6NUtSWDE0VVR0dkRVYjA3dWZ5Y0dlL1QyTkRaQ3RTeDhK?=
 =?utf-8?B?QUhQeEJkZDVNUnd5cTU0ZGcvVkhqMzkwRnNiRTdHS3Z5V3FWZVFPcXUxSC9R?=
 =?utf-8?B?VUxiRW43V1IrU0JXRm5QdmJ3YldmbXhIRk55SUF4OThOUUhsOVZPbGlhSmRP?=
 =?utf-8?B?R3VHMzFXYzZ3c2hOd2IxK1RIc1BiK0FyU21nclBsZmR4SGozYVFRRDhrTkpt?=
 =?utf-8?B?TG12UHZiVm5jNUw1akI5TElOS1Q3dDZnK1pER0NaWmVpNThCVUJ3bWlhSEF3?=
 =?utf-8?B?dzVrMU9aeVBuSjNHZmJyUE1SRDVqNTFzQmYzZXpzNFNzNEMzUW14VENXT1dY?=
 =?utf-8?B?TWJtY0k3L3JCQVM3enoyNDh5YmM2UkxJZ244bXY3WTJUTmhHeFQwdWg0ZTRL?=
 =?utf-8?B?SlpXVnN0aGVMSCtGUS9aWnovdDR3TU9taW9qRjdMUC93OWlCUnpkQUpkWm9s?=
 =?utf-8?B?OGpiRUdMaXJHdnBzSm1qT2NOeEpITVRsRHlWRUwrZkxBcExMcHByYzNBRHpi?=
 =?utf-8?B?T3c4RnFiZXdvbkI1Zkh0T2JSY3RBdWlDVE4zemV6SXZjSWlHVkw1bDJLbVZV?=
 =?utf-8?B?SE15dCtkanN6UHFDUlNUdHUyY2dTRXpTMmNVQlEwUFd3azhyS2g0ZEUyVFl6?=
 =?utf-8?B?Z0JJNTI2UmNtclllc3IzN0tiSWthNzhDSVlHOHdibExHMndKNkhybHBSUjBm?=
 =?utf-8?B?NlE2d0tGTUx0NFR1ZFhSUnpjQlBCVWJldytvMGN5N0Fxcm55QVJoN3c1Ny80?=
 =?utf-8?B?TDllVm9nMjFyMjNFOVAzbkhNaDNoTThsMVZ3QnJ6ZnArbVlYYVdwMnQwTmo3?=
 =?utf-8?B?ZWJTNGlkQncvc3lKaEpveVkvZThXUXJEZXVGUUpIS05lLzZuYVVvUVU2SnJ5?=
 =?utf-8?B?REpOcDh6SXZSSUFkRmxaTXNzQlNYSm1rSm1meFR2K2o5dW8xSTJLMHU3OXMr?=
 =?utf-8?B?bXRJbEk4L2prbWdSRXBkSFBFNUl3amdhRGRteDUwY1FKaVlSN0dJZDJSNURa?=
 =?utf-8?B?SmF5NWdhS1F2TDRvZk5taFd6K1gyZkFrVUJDRXlkZTJGNGN5U25JdzN6cncv?=
 =?utf-8?B?My9pUGMxOHJHNHdadkk3K2NJaW1KYVBMMUw0N09RbklMTHBybHNzMUlLdm55?=
 =?utf-8?B?QklzTHpZeUdGMmhYV2F1N1pESlNiMDk0WThjakxmZHFORy9ZMjU2clhVY1ZL?=
 =?utf-8?B?SE1iTWdIOVRhRy9RVElXalR2K1hMdzlFSEJXMDlGQmpoLzJYMHlHaHVIeXFG?=
 =?utf-8?B?eWVJN2hIR0lKWm1jVk0zNS91dW1HYTQvbllNcHhCT3BRdFpaNHhEblhzZ0NM?=
 =?utf-8?B?MnlPMXQ0Q24wWnF5a2dFcFh2ck1YdnRZVGVhTlZQa3E4cGNncTZuVWVWVVFj?=
 =?utf-8?B?ampxYTU5VXhHS05CQjlnU1cxRFNpZFFQMDlSaEVRaURYdFV3Mk9FRVlkeElv?=
 =?utf-8?B?cGhNMllMdlNocEMzQ1pFd1RzWkk5QVlWc3UwWkJUZEhyOGJOY3hRNnQ4SkN1?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59aaeede-9f21-46d6-17e8-08de0b190df5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 11:58:57.4229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21DSRF/PesRBcurxqNuN5jyqypjnjEZZloo+RQm5qoxfuLF4SD9Y4Y9sH+uRvBzhnYpJTjzX04X8m5e78efU3lhusQeej5wEvop7vV1fQOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8EC896901
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


On 10/14/2025 8:54, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>
> CTC_MODE register is removed by Xe3p.  Stop reading that register on
> Xe3p and later platforms.
>
> Bspec: 62395

Again, maybe I'm referencing the Bspec in a wrong way, but I do see this 
register existing for IP 35. Maybe a possible tagging issue in the 
Bspec? Can someone comment here, if I'm missing something.

-shekhar

> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 4f011d1573c65..26052710be8a7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -57,6 +57,10 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
>   
>   static void check_ctc_mode(struct xe_gt *gt)
>   {
> +	/* CTC_MODE register is removed by Xe3p */
> +	if (GT_VER(gt) >= 35)
> +		return;
> +
>   	/*
>   	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
>   	 * platforms.  In theory it could be a valid setting for pre-Xe2
>
