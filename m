Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C0BC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 19:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7F10E10B;
	Tue, 15 Jul 2025 19:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqCgyTkj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C583B10E10B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 19:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752606959; x=1784142959;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7G7W5Yxi+jxR8FpEE0aSBBTf6RtVxv+d1razH5/Ftv0=;
 b=GqCgyTkjiiqYzEVMOxDsvehPJcKe+y7mVFKl+h68vidn/m+MopR5q9gM
 sdHMXlyBihxt/89ilWaIIWQyUCzoDlPVvY6Dk+srOkXPaRMMeSw8RdsJi
 brZTIDEiAqnwZrMgk+mSL41ev2FL7oYSQ6mkz8MlxEx70xVkaQIddrakl
 HOvlkMBniEX7JIJL8nLaUf96jREp8/rd+aUQkfztE1lhjhdBtIDwqeUxH
 TW+pVns9g4PF50fP4uiHRmATn8d45+CldxPK5IiGMMEUhLij1eC/wKKWr
 /Ali7ZHdzDMdCzZIYtKfYR3k2UQBJ4fLOyR/zSH77KTvlgqFJU8i9kQHk g==;
X-CSE-ConnectionGUID: C8DaU2faTLawNBY/18nMUA==
X-CSE-MsgGUID: kDpFiVXHTjSXyjV63Y5cBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54931873"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54931873"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:15:17 -0700
X-CSE-ConnectionGUID: IXC4NtOyQ06hxYDrRNrSkg==
X-CSE-MsgGUID: GkH4hIipSdub9F/PD3F+dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157655271"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:15:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 12:15:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 12:15:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.65)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 12:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy/XP89yz3eeM5hq5TA3rg2nxi9v1e6g2offKOXukKpTnlhsBJ7MJJ9Sis4+B2KhZH8zwohCZnD+hjj+E1z38FIBEI+eD9SI4WNQ3beeZgtC/wG10BE/YcVzF3xwB61rfkDuriQSbxI++ZBU4PMmOQKXHqg6/9GJ2PTBhxHSFUvZ7YYMxqY8KL0qwz62gL7bZ+Nv+dZM9KKl0/T9tXpvjzibqfidCmk9shs4sH+O1GhJe5EON5sVOhcEp5FNgEdxShrpnQDyPWf0pVQhYsY5wCGC8golTGwtuturATXGM5C2WzSF4CU1Upz2n3mAuPZwuTnzBzDaZ/Z5PCnYuQEntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vywLVbg9hN/Bx3i3Y4mdQeGtg+qR7VqdcIBgJba7TOk=;
 b=oQ+Bxa1qt3JOpeuXD+7vbbRqi5pvwSUJLlyGbFqPife1Xgl1/KTY7P27r7wqcIBXtQDAu3f6X0AI5lehz4+fAYsK7a4Sjxa+N5BSnNrUc6ljBmiOePf9EDmR5WB25adMwzJ2jhs7KnyGKDlTxYI8j34und2GagMVuJvNm5J6gttXDYGhCupIhpiFi92/xNAB2kDp3kFjcxxEc5RWHgNefWbg0oEexNsae3zf2KhgenUY/g7Lr+4vyq6L7NDKvXe+/Tc1tp2nD0GvDv0iefOyiPy8AixYePWE0uQOuXIaqL6KnA47wwDrRP+6Eck9nap3LXQrTGNfExrecubQtUoswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Tue, 15 Jul
 2025 19:15:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.023; Tue, 15 Jul 2025
 19:15:12 +0000
Date: Tue, 15 Jul 2025 15:15:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe: Move debugfs GT attributes under tile directory
Message-ID: <aHaovJ3ZSbJp5Jc9@intel.com>
References: <20250714193645.763-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250714193645.763-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: c065315a-2579-4253-0bf2-08ddc3d3ec3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFZMbHNydm01OWtobGVabW83YmRLWkZSSGJXOHJIT3BheXdEZkl5QUZKakpJ?=
 =?utf-8?B?eCtNZTlJUlBNcForSXUyakpWRGszMTV4b2o4MXdmVUZ6WjR1WDM0TEx2cG9t?=
 =?utf-8?B?am9ldWc4UGVmYkJQaCtqeXhpR0ZHNzl3K0xCZU1CWEM4STkxVFdNRDRJUEhL?=
 =?utf-8?B?NmNKRlhiaFdYS2MzRDUyOU9GU0ZSa01nUkVqdUhjcnFPTTQxSm5rMHlqMkdp?=
 =?utf-8?B?Rk1qTjVJREtOL1V5T0c3UktmWmJJQ2tEZHUyQVhJbGRobVlsajZLVU1Cck9t?=
 =?utf-8?B?OTlmc1l3THcxMXluSzZucUFXd1RmNVNXSkpFeU9pNm9rY1Zac3BZRENvMEVm?=
 =?utf-8?B?K2E5KzlTQlgreFJ0dTZkQmRRYTZ1UHFPdjczbDUvZVZWcHBvZ2U1c1VnMjBK?=
 =?utf-8?B?dW1ZVklYSVRBQUFma05vdjNMZFdDL05KaDlRWVBxR2JHeTJvWWh0WG96Qm1C?=
 =?utf-8?B?S2w5KzMwOEpvOXZ3eTEvekhJejhKZllkeXVvL1lvZkc1ZFEyZW9la1NMQ0Uw?=
 =?utf-8?B?NlFaemZRQkVEbXpDLzBuM0JZbUZWN2JLZnp5d3M5Z241WE9GaHc1VUhIeUln?=
 =?utf-8?B?T3FCWUtWYW5uOEtTUjRIK096RUMrR2FyWXRuOVVFQzR5cFJJdm9IdVhPem9k?=
 =?utf-8?B?UDJ0N0t3eDhkb2ZBQkpiSzRCQnhIUFpKWTBYWUYybXR5a1c1LzV0M0FIMUNm?=
 =?utf-8?B?ZUdicThaNDI4bHoyanZzTkhtZXNBWXE3bEtRTldxUXlva3JkM21keHVJcXVZ?=
 =?utf-8?B?QklJQTA4My9hNGhkaG9BTGU5dzNJNElTQi9TdEhneEZuOUUxZVlvUEpJbk5I?=
 =?utf-8?B?NmRQeWxZVFl2MEREbllIZWdnQW1SKzlUQklnYVVvYkIwTldjaU9pTW9FNE5r?=
 =?utf-8?B?NEdKSm9qWUdFYUpZQmhUZVp5UzNHVCtPZkF5TEJIQk9HNEFTaVBhQzNEcnNK?=
 =?utf-8?B?VU91R3NoQXhjeVRoR1FacjU5aVduVC9qYVhLeHhuR0g5OGMzdlZNVjNRZEdp?=
 =?utf-8?B?bG5adnhzdktwSXJmMTBFQmt0bTh2UmxoYXd1T0p2YWFSZHhSRzhoSlNTWEY2?=
 =?utf-8?B?bXNyRVFGbWlBMjZLcHZNNjlHclRmd1RONUhwMlRWUzQxNUFhaEJPaGZBMzN4?=
 =?utf-8?B?bWc2L2FXQnNVSGpWOG1zV1EwL1VDZmpua1pNUTIrVW5US09vQ2N3akpYTlpB?=
 =?utf-8?B?YmQrY2lDa2ZyZHNBNGhrQkdzYlB1aVpWV3djL2ZtZElaTC9sUXBZalkrWWV5?=
 =?utf-8?B?QmtJeCtBNGkzbjQ5dTFPNGdES3ZaSTJwU3BpWjA2WjdKRlRtVFFyQzBmeWVF?=
 =?utf-8?B?bFE5cjZQcEVuTmhTNG8ramQvMnRUZTl1V2p4S1lMNXBoSGRpVHRNMVNwSk9D?=
 =?utf-8?B?L0ZnQXF6bUplZ1FuVDZ6dmRObmZGQmEvWVJNeGxhK0o2alpZMzhRSTdadVRq?=
 =?utf-8?B?UnFzK2ZoTnNRMkFCS3hsbk1Ybmkwemw3bnUzYnRZenRDeXFpSXhnZ1M5Zzdv?=
 =?utf-8?B?cVR3L3I2ei93RlkvT0J3VnQ3M3QwRkFhL2pJczh4LzlwRmIzajZSNVIyRDVM?=
 =?utf-8?B?b1dmdUIvdmM1anhFUGxxYTFha1ozdlZFZEFzS0svcjVxemphYTdZV1Q4elFS?=
 =?utf-8?B?YW5ydmsraUg3MU1uclRjWGl3WDJpNHo2ZnJzMjZuSGN0cytQc2EzSjd3QUFn?=
 =?utf-8?B?aGRsdmhROUlFWEtVR0hocFYzaTJrM0c2TlNZVXphK2ZZeENDV3Yxa1VWNS9p?=
 =?utf-8?B?ZkJQRXdRenRNblprblE5Rno3K0pWa0RHdlpyQVNqbndmL1FlekJ5Ky9iU0Nv?=
 =?utf-8?B?Y2xWblk4L0FjNUhUT2MrdlFkZ2JFQ0xNM1Z2dGlmYjV6dFhjNzZjcWFCMUFr?=
 =?utf-8?B?ZVphMUNFTEI0TVFoU0duLytBQXp3K3hJZzZYNVhYdng2ODlBK1ROdEkzekIw?=
 =?utf-8?Q?BcK3l09OwsU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bktRVGE0UFRPTHYycDIvK2N2alZCcEFYMmdyenYxR3l5Y05uZXR2Z2NzdVZ0?=
 =?utf-8?B?dHpyRi9PZmJCTEloTkRLVHU2dnp4MGpZci83bFJKamg4R1VYd0NWaC83RmRX?=
 =?utf-8?B?TkVZWjE0a0pFWXVrb2hCdU8zTElxUEpUWHE1bmRZU2htYmE5L1ByTDdQVWZu?=
 =?utf-8?B?STZYaHFlWE9Ub0ZCVkUrRy9uZXFEU2l1UTBJb2kzSU5aM2RESU83bFBYN2Y2?=
 =?utf-8?B?dWZ5L0VxNGtWeXFRazQrQzRWaG1YS0ExSjVnVWpTVW9XQ3BxU3UzM1FDL0xs?=
 =?utf-8?B?SEh0RkZRY29ac0ZWaXZwQWxtRFFrMkVPL1pIUEZjcmZuQUxUTHNPNFhwd0hQ?=
 =?utf-8?B?UXdkeGpXektnR25Sbk16VlZwWkhZelByQ3d2Y3o0bXd1TGVIOVhKWGwvUjFT?=
 =?utf-8?B?cnJ3RGdKbUNObTdWTTFNN0ppNVZSRlBicXlzSWdjTEwwdHcyMFRka2Z5cnND?=
 =?utf-8?B?SFNpeFpaaDlWNFEwNWRUZnREY0dqNlVTY1p1UVZ6bVhsS3dVbitMaFVEekNN?=
 =?utf-8?B?MERuRW41dUlnOVVKdDhML2U4SmZWK2x2c3BGVDVZL2h5RXpOdWNLcWM5UVdj?=
 =?utf-8?B?emx5WU5IVkFacmhKOTk5MmYwK3JWSDErTVZNTUxCUDl3Q3FiUnNvWTJZaDlU?=
 =?utf-8?B?WjB3MG9xOEw0aE1rNU5mYllwMkZQTHVuK1ROZjQrTWRmZlFuMngrU0I0NStw?=
 =?utf-8?B?ZEN3Z0FxK2cybnBKenpYV2FFRHdPRlNUTXlQTTQ2VFgxbmtjNTJRYzUvQ1ht?=
 =?utf-8?B?OGRNcHZPajZIWUpXck44elZaM2Q2djQ0cThjZXAwZFZ1ZkRvcXJyMTdhNkdn?=
 =?utf-8?B?TmFuTkpDZG9rVFdzSnp5aHE1Y2RpMERxYmFVZGFnUmplZDFpalVDRVJMdk1O?=
 =?utf-8?B?K3hadDBJd3g5ZlpySnM5TDE0TFR1c3FaUTFua1RYbURQdldlY1JERDZpbVBu?=
 =?utf-8?B?cWtqQzIwNmlzc1IvSldmSWhRWWVQUjVxeGM2QTdjUU5wZ0M2RzNMMVl6ZC9G?=
 =?utf-8?B?WEdvQ3RSSHBEM3FpK29JdXhtbTJmK0oyTFJMUWdjT0RsS3doK0hXdVZ4bXU2?=
 =?utf-8?B?M3RjYTZFaTVaejBxa0NsbFl0Q3RVY2hKbTJ1em9TSUM0MlRJQVNOcjVqT3Ri?=
 =?utf-8?B?UVVPdFBNUzZ5NEJLNkoyeFNXM25iUmZVTVc2ODJmSnJUUUwvUm5ibHlqY0Zt?=
 =?utf-8?B?R2hGNnh6RVlDamo0a3UzaGUzdGM1Qk1GaDZSQ1hrUXUxaW01RXRaenQ3azFs?=
 =?utf-8?B?OXdSRFZnT0J1NGtKMHQ2UUx2bEUvZE13WjJINFJwQVVkdDJsNnloYm9jR1lD?=
 =?utf-8?B?MlRrZWxNWHBpS29tekJwcmZTb3BWQjkvSWZHVnNFRWN5dGtGdnczbHhXNUw5?=
 =?utf-8?B?VFdMbUZaVXF1VlYvNWlidENHWW9JcTJ0Z3o4Tjh0OW50R0NVdUhPdjFmdm5Z?=
 =?utf-8?B?TXdhUTdvYVZiZnRNSEtscWF1SmdST2dWQ1M2QVJUZFE4S09wcFhIbnJTZXpl?=
 =?utf-8?B?RkxRYmI2WWYyQ1lmZWRMVWNSZjZlRnZFb3hMVm42SDNuZWRnR2VqbE5sUTFG?=
 =?utf-8?B?TmRGMVdOT25EY2h0SGxjdko4bmI2UmlyMVpOSmtocWwxbitLZW96cVc1ckMz?=
 =?utf-8?B?MERBYlJSY1B3UGhNU09jczlVdkJ3QWFFY0dKU0xRL01FNmZJaE1VMXcxdzl4?=
 =?utf-8?B?ZzkwYkVaRWZEWUUxNFJVTGh3bmMwbzIxckxGZjNnT3BGUzk3VE96aittTTJW?=
 =?utf-8?B?TU5MRXluRFhpR25VeE9VSnBMNFNQalJ2VVJPQytpRjJYaFRTSjNSdUJsTkJx?=
 =?utf-8?B?ZjVybzJvK0xnMzRKZTVlTzNoRWgrZjYzaFVzeXI2Z1ZacERVY2swTDN4cSs1?=
 =?utf-8?B?V242Mkh1clBGcG4rcEdPSzlHRjBQdmdoVVhXMklEd2ZYUnY1eVBVU1E5bVJR?=
 =?utf-8?B?MjgwNjZMNXlDVFBpV1p0d2Q3N1JyQjZ1QmFIYnFPOThSMDFDVURNdDVXTHJy?=
 =?utf-8?B?cHMweXFwZnpPQmxyNGxsSHV6MjNjSlFkTFlKeXArbHh6WVp4SHAyQk1Nd1A4?=
 =?utf-8?B?QVpJdkFQcFQ1dnhZQURiRzRVc3I5M3BYL0ZtbGdjbWh0WFF3NnZBNzhxcHFP?=
 =?utf-8?B?blJxMWRtcHZRYzhFWDBCV2Z5eXZoK1laaTd0c3hpQTdYbWRHZ3JkNTVYb3Qy?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c065315a-2579-4253-0bf2-08ddc3d3ec3f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 19:15:12.7656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d39JY/v1bm+Zip671rjN5M1D5fCp+p5IJMvHIk0fQ3I2MbnrPZXQRoxl33P7JZzOW9AXZ2xy+atW9q4RUME1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
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

On Mon, Jul 14, 2025 at 09:36:45PM +0200, Michal Wajdeczko wrote:
> While in sysfs we are correctly trying to reflect the hardware
> architecture and we expose GT attributes in per tile hierarchy,
> in debugfs we expose GT attributes at flat level, without tiles.
> 
> Create debugfs directories to represent each tile and move GT
> attributes under matching parent tile directory. To not break
> existing debugfs tools, create symlink under old location:
> 
>  /sys/kernel/debug/dri/0000:00:02.0/
>  ├── ...
>  ├── gt0 -> tile0/gt0
>  ├── gt1 -> tile0/gt1
>  ├── tile0
>  │   ├── gt0
>  │   │   ├── ...
>  │   ├── gt1
>  │   │   ├── ...
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 14 +++++++++++++-
>  3 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 26e9d146ccbf..129186f4193b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -247,14 +247,33 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
>  	.write = atomic_svm_timeslice_ms_set,
>  };
>  
> +static void create_tile_debugfs(struct xe_tile *tile, struct dentry *root)
> +{
> +	char name[8];
> +
> +	snprintf(name, sizeof(name), "tile%u", tile->id);
> +	tile->debugfs = debugfs_create_dir(name, root);
> +	if (IS_ERR(tile->debugfs))
> +		return;
> +
> +	/*
> +	 * Store the xe_tile pointer as private data of the tile/ directory
> +	 * node so other tile specific attributes under that directory may
> +	 * refer to it by looking at its parent node private data.
> +	 */
> +	tile->debugfs->d_inode->i_private = tile;
> +}
> +
>  void xe_debugfs_register(struct xe_device *xe)
>  {
>  	struct ttm_device *bdev = &xe->ttm;
>  	struct drm_minor *minor = xe->drm.primary;
>  	struct dentry *root = minor->debugfs_root;
>  	struct ttm_resource_manager *man;
> +	struct xe_tile *tile;
>  	struct xe_gt *gt;
>  	u32 mem_type;
> +	u8 tile_id;
>  	u8 id;
>  
>  	drm_debugfs_create_files(debugfs_list,
> @@ -288,6 +307,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  	if (man)
>  		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
>  
> +	for_each_tile(tile, xe, tile_id)
> +		create_tile_debugfs(tile, root);
> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_debugfs_register(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index d4d2c6854790..98ce1255f1d0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -255,6 +255,9 @@ struct xe_tile {
>  
>  	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
>  	struct kobject *sysfs;
> +
> +	/** @debugfs: debugfs directory associated with this tile */
> +	struct dentry *debugfs;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..061a81f82e76 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -388,13 +388,18 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct drm_minor *minor = gt_to_xe(gt)->drm.primary;
> +	struct dentry *parent = gt->tile->debugfs;
>  	struct dentry *root;
> +	char symlink[16];
>  	char name[8];
>  
>  	xe_gt_assert(gt, minor->debugfs_root);
>  
> +	if (IS_ERR(parent))
> +		return;
> +
>  	snprintf(name, sizeof(name), "gt%d", gt->info.id);
> -	root = debugfs_create_dir(name, minor->debugfs_root);
> +	root = debugfs_create_dir(name, parent);
>  	if (IS_ERR(root)) {
>  		drm_warn(&xe->drm, "Create GT directory failed");
>  		return;
> @@ -426,4 +431,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		xe_gt_sriov_pf_debugfs_register(gt, root);
>  	else if (IS_SRIOV_VF(xe))
>  		xe_gt_sriov_vf_debugfs_register(gt, root);
> +
> +	/*
> +	 * Backwards compatibility only: create a link for the legacy clients
> +	 * who may expect gt/ directory at the root level, not the tile level.
> +	 */
> +	snprintf(symlink, sizeof(symlink), "tile%u/%s", gt->tile->id, name);
> +	debugfs_create_symlink(name, minor->debugfs_root, symlink);

oh, this is why IGT is happy :)

later we can change IGT and then remove this entirely...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  }
> -- 
> 2.47.1
> 
