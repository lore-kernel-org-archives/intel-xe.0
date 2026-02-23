Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3C3EA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423CC10E3E7;
	Mon, 23 Feb 2026 14:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN5RFRtk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D6810E3E7
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855934; x=1803391934;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=5aUSbzaDfSbfO17lE6Zk99JC2GuAZsH+1wXJalbpebw=;
 b=JN5RFRtknF2mTrD60w+5ZF1x47H1UQq3neF7Zw3yV8GobFP9shsdEuvx
 d4uMz0CDQDjknjNsnwHW7Geu9CIN12jWvdIxcCic+E3p70crgpplAXY71
 +TUIVsMjIGB3ORxMUD8lRxQu3q91h3nmSdc6EvdVSKQf69C4Pm8cVhJra
 uYuDKoV26zEojgzM0+edlx4v0RwLO3D5MyjJJ1yinnd1MzoqwyhbQcy11
 +abeVuUzb4+Hj+ujbGQrrhxp/LqFz1/NPeaHX/nn4Uu2yVUupXFFIyLAp
 OO+debPbPdTqPZhz3WBaMNSqB2paSidgmUc7qvUtt9jSOGUFNFAb0W77B Q==;
X-CSE-ConnectionGUID: 4DGgt5kRSDqESc2F0OKYhg==
X-CSE-MsgGUID: rGkFixaITqi06RmwYs4O4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90435527"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90435527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:12:14 -0800
X-CSE-ConnectionGUID: bKyLr2hXR9Kxf6NeSzkbKA==
X-CSE-MsgGUID: acakWlOvQi+3sG/nRkJoXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215420141"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:12:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:12:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:12:12 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:12:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKdD7yPFWH0XxFEvmyPU1aUI4jzQUnE+75+ztgoHsNYTsyvNmuHfcu3EhODyMicUZsBot+frtb0v8snPH+qQwwYnIFBHq2F3rJ6ynYAOp0WBvQ5TUfxUNJVqtqrYMtAWw2zhNrDF4zWDRhbmNU8FS9Y8Qpq23tzIi+1ZaT0hgenbSvV/SyE47oSH8VHAkPzT0L8VUOfYutXcjBKyZmxD39/eBX+dbs+P9xAahv/HxMtCQa788CeYPwA+CkXsNKxS0rWWfree6Hut4jY/Cc3KlSeC5y/kqxODciLk8t1mF+b75RFCoauDMXk114orImxZOLYC4V62nBnu7ZyCAMttlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWaHkicx6wPbu+/n6zpPH++WU8VMa7bM4y3UwrvXiRw=;
 b=epha1zmQXc6ce6FUBpn37Q/5j36GMWkQaILAeo9+TGiXSLQF4eWhw+8nZiZWUDCP4JO+EYkoaSbERIp87RufaEdlHsZaqW2TuUwEdO2mfHDslIks9PXIsePcXbrol+aGlEIr//hnfFi2tCgnTGwynRfis+r+qxkhojDI4ZpL3iPNo1cK6Z9O8cLAdsSwuN3nMtWPtqpY0LCg2vlhlOx6VN/jmJhkK8mp77375IVEpM7AOtLQgZEWrx67TR2F+pVeX6ZneWXz0WOSVeV7Kxt4wFN7rsSF5o2NDT3BmhNM7ecBRtF0L8rg3+AREkfQ9sreuzAcnH270WgAg/YhX+gJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:12:10 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:12:10 +0000
Date: Mon, 23 Feb 2026 19:42:02 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 08/23] drm/xe: Consolidate workaround entries for
 Wa_18032247524
Message-ID: <aZxgMrRvv0k5po7j@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-8-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-8-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH0PR11MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: 51aff49b-91b7-43ca-6778-08de72e587f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akZLZHlhYUVqM0E1aEtRcHFmM0NpRTllL1g5MkY0aVdhTERyNzlIY29sUUxl?=
 =?utf-8?B?V3c2bVdodHR2M1lnTEkwOWxKODU1NjZHWFZGdXd2TytUMmlRVnNRMDZSUEVV?=
 =?utf-8?B?RDI0bkdPVFRkb3dpS3lmQzNoQlMwQVZCNjdZYXRrZFJZaXFLc25FUmpEMEFo?=
 =?utf-8?B?MXNnM2JPKys2Y2JEdUcvTXh4QTFDcko0LzI3WXdQbGNFalJEOExkWUMrNVJl?=
 =?utf-8?B?WjBVUFZCQmcyeTFoUEZEN2VoSXIxdGtKaEFwZFFheWp5a2plRkRXNWtzcjFQ?=
 =?utf-8?B?Q3hFQ1orRUgzWkJiSUVITnlOVzkweEN6SHFCckxKNHdEMjhWRG9ZMGswL1pE?=
 =?utf-8?B?NzhBcnlZV1ZUcG1GU2hidjIwRSsrU2xnakNUSHRzTTNrSE54NzVJN2UwWXN6?=
 =?utf-8?B?WTEySjNzVnh2cEl2aHNwU3pLNXhpcWY3QWczcXhQdWcwT1RHQzd5T1NsbWxw?=
 =?utf-8?B?WnZZbjlsNHlyS0wvMzIwMDVuVzR3azZqeGV5NmRCSHljMVhHSGNTejhBeUsy?=
 =?utf-8?B?QUJITEt6b1VoZWdoTG5vTG5OMW9MTTF3Y2lnTzh6V01sczR6ZGpSdGN6RWN2?=
 =?utf-8?B?RVI3VDRrWlJORTlyTnFiOTBnd2lNQ1pmQlZKWlJ5N3BTdE13SUgySG1LKzA0?=
 =?utf-8?B?TUlGVUQxYkM2WkpMbzhqWERKdlN3T0lTZ3NINEcwYmZueEs1UkJZZURLYlc1?=
 =?utf-8?B?cWRRbHJ2OG84RitiWWVEUFg4cGE5Y1BJZnZnUko3dHNzZmVLNC9Xd0tRbmVU?=
 =?utf-8?B?K1Vxa1RhSEdyVDVzN1YrYTF2d3p4VFlkTFo0VlNrQ1dHYkt1RTFDSFJ2TDE2?=
 =?utf-8?B?RjZqOG9xUmpxczFJTWc5ZDhxRTRoaDdkT1hXOFZKQ2cvVTBqSzR2czFJSzFu?=
 =?utf-8?B?Vkk4NC91RnlzUHJNbHVzMmFEbkQ5aUlIUVpQcnhaekRybFY1VGhhd3NZWENo?=
 =?utf-8?B?TGlTb25aVGpCTWJOUCtXdGFPM1YzY3EvMmY3eFdJVGFQdjZCU1BIRittTVhI?=
 =?utf-8?B?cU9NNTFIcWxHMUNUQ2UzdVlrQ08wdnNUV3h2azR1WXVqUCsxV2NEMVNNNUZH?=
 =?utf-8?B?YnVEZ3Z2STZGc01FSGlMTUU3L0hHcndLeUZjWWpxQmlCdHlJVzlaZjdVOGUr?=
 =?utf-8?B?NlBtcnRWVXg1WTlsOEM2VzF3WTFQYkc1bXJYVkVVYldkUFMrZmxqM3JkSmN0?=
 =?utf-8?B?UUsyM0EyMG1pZ1FORXE4aksvc1Y3NXZ4Z3JwSTdjYTBjVjRjL1FXeTByOUU3?=
 =?utf-8?B?QXZUdGx1RzlyNnlpa09iNksvK0R3dW4wSkRzQXo0NDAvSVk3VDRXZWFOc09p?=
 =?utf-8?B?LzR5VlVaSWhqclZVTmpnekgwWmRGMlFwVTZiV1A3ZThwbm1wSG42R0RvZzZu?=
 =?utf-8?B?MG1EQThnWkhVNDVTVnE5Z0lzTXpYSGxxVStBS21VZmlobVVpREwvSHdlUlIy?=
 =?utf-8?B?VjNlV2RTeG1WNnRIOXB6UHFsN2VXa0h6WDJ5a0VJTkYwdXhjRzc2WWxVUCt2?=
 =?utf-8?B?K3Z6UHhKcUZuWW9Eb2pNNVZsTnlqWlJKSWYrMGRwdE1FSjVETzdQSVppSUw3?=
 =?utf-8?B?SnJhdG40QVdxTXNEUUtScDd5VzRlS212aWkxeUNUOGx3c0dXRXRaWTU4eGRR?=
 =?utf-8?B?OXJYMlZlekRrL09XMmp0VW12OUdhTW5UVUU3UWtGb1VYSWxndVJKd0x4dWhY?=
 =?utf-8?B?Uit4RHBTalVoclJkay9yYTBoK2tIMHgwSGtYQXdNcHBCaEpOTzlhU3BCUjRk?=
 =?utf-8?B?eDA3bGppTkRwdjVrRmEyNEJXMDc4cUM3RXU1YWoxQ3NxWllHazZmZDczZHdu?=
 =?utf-8?B?ZUF0RGYvd2J0SlVwcnJXck5KQy80ZWdrbzdNWk5POXAzSUQ2dHlpS0hmWG1B?=
 =?utf-8?B?N3hlMmdYb2ZNTEhhZm9OVm5NWkFweDV1c2RUTHJobmxLV2F5ZDk4ZEVXSkFY?=
 =?utf-8?B?UDV1VU96K01ySkhRYXNYYjkrazFIWFpLYXNPcmh5Lyt4T3VnRHJQOFdUUy9G?=
 =?utf-8?B?N01Vem92Y0NZSEthRlF1NTlGWmxmYkNiSmpPMEl2RGc4VXFsaW9tVXBzUEky?=
 =?utf-8?B?YThkbE02ZGR1ZXZZRWpCVVh0SWFYOUpXc0F5K0QrcVVXZHFxaDJtOUVvQmZx?=
 =?utf-8?Q?DQkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXIzM000TlFsMkZlVUQyQmd5NWdjZFVOWUcxT1lVOGdqTVBzZGJlZ1djbnBS?=
 =?utf-8?B?azE0YVFLWVIwUkpsSmZ1bFNqMmZ5eEhzOWtpNGxsbit3ZjNxRXBZWXpURDdL?=
 =?utf-8?B?ZlVFWlNDRjFRblVIeTllL0VmUTd6QTdnSzNXVFRSY2plWHFRV3hSRmZuaDMz?=
 =?utf-8?B?VTdxRTFMRWZ1empMR1FNS2ExMXhTM2lGZ0hnSWpqcndjdGt2N3ZBMW1BaDNt?=
 =?utf-8?B?RU1xYXd0bTJmeUdHWUp4Nnhzak5aR1pQdy9KY2JZS3liWW1pNS81Y1NmU3BN?=
 =?utf-8?B?c1F5QU1kaEFPdzN6dVBzcTY2bm8ra2lFWENrY0V3YXljZUU4Z21QUXBpMVpC?=
 =?utf-8?B?aUhRa29SM2NXZUxnNDBRdzI0M2w4bDVmSURnTy8rLzljeDNlbnpKWkxkSmRV?=
 =?utf-8?B?K3Q2bk1tbWMzTmRjbS9BMzNMVlNjZFZXaGhoNFgweG5UTjRIcEpNeFVpdGNl?=
 =?utf-8?B?eEw1dWJ2T1NVdFkrVUlEek5qM1c2T2dHejdocmY3c3pEeHV6TkNiTTdZNm9x?=
 =?utf-8?B?MTkwZk5LbmJBdnk3UmZzRi95bjhwYUZObkxYU1VLN3ZyNm9uU29sTnJ2WTNT?=
 =?utf-8?B?SEliTmFWNGs2VlBPQTVlVHEzaU03YlpHdURuRGhqY0J1ek1xaGtESGFzOTVX?=
 =?utf-8?B?YnF4NzZIalVRRWh6bk9MbnAzQm9NcHQvY2NGTklVNktRYWhoNHp5NUZrSDBL?=
 =?utf-8?B?RnJNdlA2M2V2WWl3TnkrbTR0ZHhyWU1UaE01dkRhN2t6aWNPc0pSbDBUdngz?=
 =?utf-8?B?NGFlMVY5OUt2ZklwUmxpa3IwZ0h6bjM4SXkxOXlUdURQUm5zaXlDck5OUFh4?=
 =?utf-8?B?K0x5enNuN3U1V2dOOW5iUW44ZVVDc0ZOYkZVZUloeVBjd0JBWndQUU9YRXNz?=
 =?utf-8?B?bW9IK1AzZVRvbnVqUmF1UnNOaEtJZHZUVHh2SWZZaE5GdXljbUxLVExoUUFw?=
 =?utf-8?B?R09QWklFcmxmL0NacEgyL1RHM3laUlJIK0h3N3BnK1U0dmQyZHg3RVZNWEJ5?=
 =?utf-8?B?V1hYTzJORllTUGZ1VWJPL2J2d1RKTFdZdk1QRWZkQUU1VGcwbU5GNGxiTGpp?=
 =?utf-8?B?YmZIKzdmSnpuaVh1TGc1UXp3SmFyOGFuYnFKU0FEMWM4NkZ3S0ZRcDVZMlpt?=
 =?utf-8?B?a1JqZVFMVTI5U2hlSzhjTi9IQ1RBRWFCQzhHbVBBN3YwdnF0V01UUWtkSEtS?=
 =?utf-8?B?WEt5Z1NNLzljd3lSYklaQ09sUmUvTUV5Y1dDU3FSaUR0aWV6SVJFcFd4RW1U?=
 =?utf-8?B?Y21yU21icXlraFR0ZU1HbDNRWk01VmZlUE1GWTlmVXJjdmZVUXVtU2R2UEJv?=
 =?utf-8?B?bHhvc0JrOUxidDVkNXY5TEFnVGo0M3VBNTdFeEtZZ0VBYXFqc1lwNGR1UEts?=
 =?utf-8?B?SUdlZUNNSGovQzNkTDNvOHlhQ2wvWlhLbVFpaFZ5dXJOZGlVT3pSQUhwSEJM?=
 =?utf-8?B?alUyR1hMb05Ka2FSbkU1dnBXalh1dU1OWHVQQ3hvKzY4RVB0bWEvTGM3UkpU?=
 =?utf-8?B?TW84OThoeXFYQnJLeTMvQ3NHeDJvN2FLYXQzUjdmMWhEd1RiUEZ3STZ3djhy?=
 =?utf-8?B?bE55aDBlRGU3WDU0VWRid1RnNXcyN05LVTBmR2RMZ1E4S295eXNGblpIRld1?=
 =?utf-8?B?WDladmxvV2Q0MFlkdEZsVFluNHkyVHAxNHgrSjhUYjJpSVpDV25vSXBaNEdO?=
 =?utf-8?B?aEdXVFlXMGFhVzJrTVA4TGtrdG1NM2xyYUhjdW5KaVdQd2w1NDZjY2lxZVlM?=
 =?utf-8?B?NjVBQjdBaU1ta3FOQjB3TE02V1lFejduWlpsQzJ5MDJKTE1nVDBSVFU5cVZR?=
 =?utf-8?B?VEQwdDduVFBUNDVjT3lDMEF5VG5qdVRXRmNKaU9wVkFvcElaS1ZLZVpQdkpT?=
 =?utf-8?B?bTJxWG9mTHFYbTRhMHppN3BLTzBsYW9RMC9qaENBZTU0ZUxjVk1acjFzZWth?=
 =?utf-8?B?OVJ6R2JKbmtmVEQwYUhleGRnV2MyZ1FNM1BCS1VKbG5uSU5nc29QeFRabTIr?=
 =?utf-8?B?cG53dzlvVzAwd1NUMStoZXpHRjlRVGNZaUlHNFRBcHlyWjVDcGtkOCtnME9t?=
 =?utf-8?B?bnVxdkZ3NnlyenVpVHd4c1QwYlUwbGlKdmptdS9WMlgvSW0zR3U5MFVPQVpR?=
 =?utf-8?B?Zy8reG1Wb3hzcDM2bDk0WGc3T1pWRW5pNGlvMjB2ZTBjN1cwSjJqS1d2dS96?=
 =?utf-8?B?cld6T2pIQy8vSUlEMFhUYUs0eTZLK1VrZFhLQStLZVdNSXVWMkZRekxqWWlP?=
 =?utf-8?B?elJ5WnZ1eVE1TlUvOGNOQUh2dU5KaThReldKT2hMVmlUbDc4WXNyS3dZMXRD?=
 =?utf-8?B?aHlER0tIN3RQVlB3OGRwOC9uYUphVDk0Qnh6RGlaWktRbmNRbHd4SU1hZ1Rk?=
 =?utf-8?Q?ZZpyqkVOLfMn/KYUWBmUARuk2kxsEhFN7Zl6A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aff49b-91b7-43ca-6778-08de72e587f5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:12:10.0286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5Y3YEZty/HhHjfnDujWhMef0IGSEVaZaVBLissDPkT2SN9D4Gu8LbQ2rEifdrOlvLz1ViY0Q0EFPcqcJRp3TD6RQDa0BPg2UDJzf+Q6WIxzxO8ROSLMKFeR/p/UWRpO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_18032247524 applies to all graphics versions from 20.01 through 20.04
> (inclusive).  Consolidate the two RTP entries into a single range-based
> entry.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> 

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 092d46f48165d17b0ab4bf2a7e4550b97e137aad..a483a76c7665eba1c6a87a18bab1a31d11a01f4d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -306,6 +306,8 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  };
>  
>  static const struct xe_rtp_entry_sr engine_was[] = {
> +	/* Workarounds applying over a range of IPs */
> +
>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE(RENDER_RING_BASE),
> @@ -341,6 +343,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
>  			     FFSC_PERCTX_PREEMPT_CTRL))
>  	},
> +	{ XE_RTP_NAME("18032247524"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
> +	},
>  
>  	/* TGL */
>  
> @@ -478,11 +485,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  
>  	/* Xe2_LPG */
>  
> -	{ XE_RTP_NAME("18032247524"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
> -	},
>  	{ XE_RTP_NAME("16018712365"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
> @@ -551,11 +553,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
>  	},
> -	{ XE_RTP_NAME("18032247524"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
> -	},
>  	{ XE_RTP_NAME("14018471104"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> 
> -- 
> 2.53.0
> 
