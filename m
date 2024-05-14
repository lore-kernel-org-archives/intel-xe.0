Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47899C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 23:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D058B10E0F3;
	Tue, 14 May 2024 23:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAk3juxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026CB10E0F3
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 23:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715727618; x=1747263618;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tWmryukKkijWTTBjhc3i8pDQMXc5R6JbImaqvD6q5k0=;
 b=NAk3juxJGRCXGCRUOusz1tPriEVWCfSJv5gEg7HBqi8k9WaHOkELILdG
 vWuW/Cy7waW5z+vAgquCjl8nWCRBr8ZgPIsoc4i1fGwMajCxFeFxQ1x+D
 E7mH3jtGT4VKCfMeuX+54cCQWakpVUH4AKpN9BQywV2Zk7fs6WMDS4sOn
 KkhFQdc4a7LWcW88y/aJRDlag9KRNkaMjOktDzP/byCfnJWsrfwKvE9eJ
 YRgSoElXXKDu/evUgRCGye5q0DndvfqOxeOtFUnj3bOh+HYu1hj9ceC5O
 ydkURlZ6pbk6etrFfjhmdS0q4X4liueUP4g6nMoC0MbErc4vS559LcTCM A==;
X-CSE-ConnectionGUID: ORLRv/ZWQ7GnN9tNYso+1g==
X-CSE-MsgGUID: LPy7NnmdT1CULSsqFgFT2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23143020"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="23143020"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 16:00:17 -0700
X-CSE-ConnectionGUID: bqEwMl1ZTT+ECobvNNOjdA==
X-CSE-MsgGUID: ZpNv7AoeSayDml/9msVzoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; d="scan'208";a="30830337"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 16:00:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 16:00:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 16:00:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 16:00:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 16:00:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsPBbUEZwstb48HPOnF4kqKl96gbjJqOT0dTbqBwpnFF/vK5ghIsh9wf14JfI8J9x1cN97xwFfURquNtquMK+JFSKSGnCHsSOgmb1WQUya+RW5BD/Ia0ROzw8eMtKDZUJxJAbmbRqcx99BkSVz8XLKIS5GOM/6yGfcKbpkVX9qQLsmR7G5abU+pdxdQu54eCa3xr8rwzgdOTy87vTdRVGZlTaGFJbbMy5CwZ2awGHJXzzMOFdWmNfKdN8SYSz4ocFl/+4Jp+o2LzVXqz2Ncaalt73swtjeLXlgb+0xBl2PemPRLcDsBwTasCWnGUysXSQKibqIugQX4pCpJQUT6TfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HHETbg50i9j+tAWoapil05yASHM7wYXnevIuiVGQZg=;
 b=A1uNiI41aOx5pl+SKj8nLmwIDps9wB6RcSU/1hh3QALsUbkjinVP3FrZRM95FfxpzT2OU8DuwNKMwd5g29XPxpHuo9m+ZQHw72k4L2WWvprnDOX6BFjMWj4kf5ClxPWL41b+IeHfT1T/YrFeXJ3smqagXDue0xgAVXiNHrLYIck6KJgNCNH5TUIzypIjppxdz0eaaD5VEPbFU42gIA/MsZEkWhM5SJG6G0VcmfLWDOS33iWIncURQMCtU2nEVqpXoDPke9eLbnvakMINpm7QIBR1l/rmb6Rp4dMmNgi0BI/FkR3QvOBe31Nppfs3EHSSyupAh1CtHS3y2YxIrPz76A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Tue, 14 May
 2024 23:00:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::ca61:3301:7ce0:f694%4]) with mapi id 15.20.7587.025; Tue, 14 May 2024
 23:00:14 +0000
Message-ID: <54f87429-f44e-4a68-8f2e-3988f7927e4a@intel.com>
Date: Tue, 14 May 2024 19:00:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] drm/xe/guc: Add XE_LP steered register lists
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240507014736.1057093-1-zhanjun.dong@intel.com>
 <20240507014736.1057093-3-zhanjun.dong@intel.com>
 <4d68b6cc674d6350fc0e0ef1995c5ae00beaa691.camel@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <4d68b6cc674d6350fc0e0ef1995c5ae00beaa691.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: ead01ff8-cbe8-474f-b7f9-08dc74699d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFJmcTVzTDFPZG16a0J4aWo4QVdMWVVZRWNZd3NBR1llTk5XdEdQNVFFeEpQ?=
 =?utf-8?B?Y0xod3VUUk9Pa0xxaXdUYlRsWVZRK1ZZdUNrRE5HeG1zTDdwUU54c2IyQ25Z?=
 =?utf-8?B?bWpWckM3YW5iUUxUeGRlVWJzNnliL1FUcUdJT0liemZUQUdvb2ZoL3g2WTZk?=
 =?utf-8?B?K2hoeHRQUzBGbTNKMU50ampQOXBuU1IvT01DSnFLMXFzR3pCajBRcGczTlRJ?=
 =?utf-8?B?YUt3MXN2aVB1YUwwL20yOFg1em9uWms1cEJKTlZwakEwSzFxTHd1QWIxcHQr?=
 =?utf-8?B?RWZLRStQcG1GRzFYZHJwS3JHbnhlelZsZDZ4ajhhdlhwTnNqSzFicHJKK1hG?=
 =?utf-8?B?T1E4RzFoUEhRTkxaK3YyMTVsU3RQZmtnSUNnWmZJZEU3MmhZVGtZd1RWa3Zt?=
 =?utf-8?B?cGdSRzBGWGdLQ1JieGljZkNWb1Joa3AvSGdXUGxuT2tZa09ud2xqMDE5cmx4?=
 =?utf-8?B?S0JlMjNWZmJ6RW9RclVtYytOckxTQ3l4ZTluaXEyeWdZSldnSElmbFdQd0pt?=
 =?utf-8?B?NWZvRis0MnVRTTZnZ1pzS3dYMmN2cGtmYzZmSWJhcW9ObzBDazJrY2RudGIv?=
 =?utf-8?B?cTJGbVZoa1RWT3hjZjRaamx6VDVvQ25OcDl1R0xDM3ZtNFB6R1paQ2U1Nkc5?=
 =?utf-8?B?bzdMaDZoY0dzT1NramRrdFFHY1NTWXQ0MUJTMStkQTZ4TGUvVERHMDVGQU44?=
 =?utf-8?B?RDJDZ09rZlF2VGU3Z21YL1VkaHFUa0NTU1cxM3Fyc3VVdWd6dTFCK0FzdDVL?=
 =?utf-8?B?UGdqMFZVVFR0N3h4cGEyN1Zud2dNYlNtbTAyTlpLdmJ5TENEdHpRZzFkUWsy?=
 =?utf-8?B?VGNidFJXRmh5clJNMjJoaFM2RElpWXVESDFmQmloYTRXTGFCUVRrZnAxWXZs?=
 =?utf-8?B?MHlhMjVWMkt6eGsrcnJVY3dDbjFQWlgzbm01czduVCtIVEt1dzZwOWNueWdU?=
 =?utf-8?B?SGpscnZvc0lLaVhQeFBsOWpocnFPNW9VaXdEdFE2NnZ1YWxYZmVUc2R0alpp?=
 =?utf-8?B?d2JVYUJvY2MzdUdmVnhVMXZkcXBPTDlnNHpHazEwZDduY2lZYmVOZ3hRRWFj?=
 =?utf-8?B?blduUXJBKzBUUld4c0diOVI4YytPeUI5OVMweWdIT1Avd2d3UGtrR3A1S3c3?=
 =?utf-8?B?bGNzQ1BRNExWeUNQc1F3Q3JhaHBFaXoycDBneTZkV05GM0NvN1ZPNVhOaDFS?=
 =?utf-8?B?T0s5RDltUC85R0t6NWl3WWhtNWZwS3BReGRRb0d0NXZGVzE5c2tTUjJNY090?=
 =?utf-8?B?MWp2TUY3dVZvbmNzd0o0aDZjNGU2TWhselZ5NmRLbncrOE1MNDVPSFQ4K3pl?=
 =?utf-8?B?U1pxS2xkSjgrcjczRFdpY2x6eGVRK3FSc3R0UVZGR2QwdHk5ZjFHTU1tSTNF?=
 =?utf-8?B?VlloeTh1RFdXVlJ6WU9Ec2tqaUFPeUJ0VU1mR0pjZC8ydVA4UkVVSUtxTlpW?=
 =?utf-8?B?N1FKay9naUwwVkNOcG45cjdveXN0V3NmamV6R1crMEpKcDZmbWRkOGw0UHN2?=
 =?utf-8?B?TGZUR0xzV1Jiek0wMjlycmlIdEk3bnhBRnY1R0V0YjAxNW43a1dBRzY2TXBn?=
 =?utf-8?B?azY4Nlhjcm9HWmJOU3FEZWh6eGgrR283ZWxyNzB0SU9SOHBwRVowNlRISkxV?=
 =?utf-8?B?NFlxUkdyd3NzdmxiYm50ejlhUU5ENGlScHBZem9jNVV5dURzZ3piNEFrZVF4?=
 =?utf-8?B?d2kwUHNNb1p6VEt6RTBoSEhCSTlBUnBleCtHTEp4MzR3VEFXY2Nnbk9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2Iramt6NHhzK3pJbDhYTkxjKzBtbTdpdFBqejJFd29INUdETEZiUjFzQVdF?=
 =?utf-8?B?RDlGL0lKWjJRMmVOS1FBV1YwRmpLcVhiWDRIOG5ZRmJLKzFMOU4xTFM0RzJK?=
 =?utf-8?B?cE9NM0k2NGZnZ3BhNlJSYmdDeU5zRGpVTS9wVW90ZHFBcnlOUnBLSkZlelor?=
 =?utf-8?B?ZW0vVTVUYlFsK0paYko1STdtYWVyZlpxU3J1N3JEUGMvTnVuWEFiN2tsalhq?=
 =?utf-8?B?aVJ6djJOMXVwaWZacTVuKzFSZ2lhak5peXVBWWIxMURyZWxTZmhJVVF2aTcv?=
 =?utf-8?B?eVVPYkd0bzNXWXFjUFJvOEpBNEtEYU4vMmswbGh2ejR2ZUFaQ2plUTVQN3Vz?=
 =?utf-8?B?ekNrdE9lREVqMCtITkZSKzBKUVhsMUo0UjFLUFR2VXlXcE1FL0JGN2tpRjRY?=
 =?utf-8?B?MW1PaDg4Z3l5OE5zRGdRUG1rZTEvalEwV3Q2cFU2L3kyeDg2RUcwZkNyZ1hJ?=
 =?utf-8?B?dDJQR2ozV2oxMXhXVFZ4L1FlUXNPRWRmaHFxS3YyTkJqVUJFU1VXUmtPd2kz?=
 =?utf-8?B?Tkp4d0ZrYjlaNXRsWnpobGs1V2Y3ZDZvRm1xSlIwbWhvbUJOQzlwZ3ZOWHZs?=
 =?utf-8?B?Y25SdW5aWFdFYXpzc0RsSEtHMzVNSnlyWllaYmd1UzZpVFlBVlN0RXZ3Zngx?=
 =?utf-8?B?eWZ3UlJuUkNvcHhWdjk4U1VSNU9mUlorWmViZGVZdUNUQnlBck1uYzhpZXRh?=
 =?utf-8?B?OWJydStiZEw1S3B3aFhZZG4vSjBDbVpQUEVzUGQrQzFIQ0ZmSVpFVUZhc0cw?=
 =?utf-8?B?OTVpOHFqUFpTVW9URTEydXRSOHZiK3I4MDRVeHNHSnRQV0Y0RktjTitTR3Az?=
 =?utf-8?B?U3JGRytvMDR1czV4OHQ3WmZOVkFyYW9GckVqNzVNeW1JOTdGSk1tNGxaUWZj?=
 =?utf-8?B?U2RRanZHdDBzZXV5VmRYV0swbmlGeUgraDlLZ0RmcVJtOVJiT2lVWHFHSUVi?=
 =?utf-8?B?ZWZxMThBbU02VTlIY0xRRTkyVTJFRkVnUExlOTg2VVBEMlFsS1RmRXZFUVlN?=
 =?utf-8?B?S1NJeWN0aHVNZXVGWUUweU5GQk5QQkplR05OS2NIMmQydGJsTmdEdzQvKzFq?=
 =?utf-8?B?STVVVFNmVnpObzY5MklhN0p0MmdScTJ6ZWhya3I2ZG9MSTFLSE4wS0I1dlBk?=
 =?utf-8?B?WThjN2hKenk1enRZREhCczJCTUFoVzlHbkdGemlPYmFzQkVTYlkyMmo2R2VF?=
 =?utf-8?B?eHQ3R3FWUjNUY2RuQ1o0dy9CMWprY1lRa1VCeXlid2grVjZvZy9oSkc1dTdB?=
 =?utf-8?B?VFBmN01TMUs4MUJ0MmZlNnR1QTlXV1RncDhnSjc4SnpZM2w5TnJVZzNBVFhl?=
 =?utf-8?B?dTBmU3pBaGRTOVY5djJTK3Mwa2Q4SnpwK1haTFNWbm5aZXdCMzhhVGFzM1pq?=
 =?utf-8?B?SFJiKzlaWEFKdC81QXdNem8xTkJJQUJlZERkeWRjUmlzdGZqS3EzN2tGS0I2?=
 =?utf-8?B?eGozNjR1U3lMUnA2RE9ZYnZrTGhNK25BZmtnU0k0cXpIajVGTHR5T2pyQ3Ez?=
 =?utf-8?B?TGk1dXlralJwS0FEL1kxaXhLaGkrcTVUUm5jK3J3S0svWnUrbUxDNXpxMnBY?=
 =?utf-8?B?ZWJKNUdZUXk1STNBc0xkRDIyaXZ1VldBeFc3T1RIempvaWdwSjh0c3NlSUdR?=
 =?utf-8?B?ZjJVRENDRFRYOHJKSjZvVStEVUdybjBrRURlWUpKMFFaUFpxNDZEYjRWTXFO?=
 =?utf-8?B?M0k0OTRUOTBkL2prdGt2Z0NpWEdyRXIvVDNNeGhXWHpHaklrT1hKaW9hSVBQ?=
 =?utf-8?B?QVlYNE5SN094L1FDSTkzSDZ6QXd5aFZHV3lkOFo4ZU50c09nZ2hXWnp5aHR3?=
 =?utf-8?B?VytQajRUQ3dvc3N4U0ZkcWhaeFNqdHNoTFFyYm1HeU04TjRzaHlPQ2l0cTFS?=
 =?utf-8?B?T1BrRkg3VVhTRGNCY1laRGcyUk53dkY2VXJBV2FOVXdneVozeWt1NjlSTzVh?=
 =?utf-8?B?TUY2ZTlLc2ljT1BnTHlseHBSdnViekt1d09nbExqM24rMERGOGxFVzFvYTZG?=
 =?utf-8?B?ZnN2Umh0Q2xsOUpFK1BhRHNkaUY0NWdMZ1dJcHRqRUVsT01WSzNzQ1c0YmE1?=
 =?utf-8?B?aW5ZcllwOXVPRFJ5UVVZajNOR2xDa01wL1Z0WjVzTHNnZXNXYW85Tkg2QklC?=
 =?utf-8?B?ZEUyRFpsV0JPeU1YS24xUFVTVkFiR2xKZDcwSS9vSG90TjRnQzRYOURaSWxC?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ead01ff8-cbe8-474f-b7f9-08dc74699d4f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 23:00:14.0988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5UILAiM6tUHlJYHnKR4+n83pD3yekFPDuBN5daP64A5r1oOw9EWoiqzQPEAzUYItbABMUPcLQGFq5CzJaRMCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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



On 2024-05-10 8:17 p.m., Teres Alexis, Alan Previn wrote:
> only a couple of nits, so,
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> 
> On Mon, 2024-05-06 at 18:47 -0700, Zhanjun Dong wrote:
>> Add the ability for runtime allocation and freeing of
>> steered register list extentions that depend on the
>> detected HW config fuses.
>>
> alan:snip
>> +static void
>> +guc_capture_alloc_steered_lists(struct xe_guc *guc, const struct __guc_mmio_reg_descr_group *lists)
>> +{
>> +       struct xe_gt *gt = guc_to_gt(guc);
>> +       u16 slice, subslice;
>> +       int iter, i, num_steer_regs, num_tot_regs = 0;
>> +       const struct __guc_mmio_reg_descr_group *list;
>> +       struct __guc_mmio_reg_descr_group *extlists;
>> +       struct __guc_mmio_reg_descr *extarray;
>> +       bool has_xehpg_extregs;
>> +       struct drm_device *drm = &gt_to_xe(gt)->drm;
> alan: nit: order vars as reverse christmas tree. I'm not sure if this is a hard rule,
> I've seen many review comments about this but cant find a hard rule in kernel doc.
> I wasnt paying attention to this earlier and realize that Patch #1 has at least 4 functions
> with this issue. I'm going to leave at your discretion since i assume this is a nit.
> 
in Xe folder, egrep "&gt_to_xe\(.*\)->drm" *.c
we have many

>> +
>> +       /* steered registers currently only exist for the render-class */
>> +       list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
>> +                                       GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
>> +                                       GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE);
>> +       /* skip if extlists was previously allocated */
>> +       if (!list || guc->capture->extlists)
>> +               return;
>> +
>> +       has_xehpg_extregs = GRAPHICS_VERx100(gt_to_xe(gt)) >= 1255;
>> +
>> +       num_steer_regs = ARRAY_SIZE(xe_extregs);
>> +       if (has_xehpg_extregs)
>> +               num_steer_regs += ARRAY_SIZE(xehpg_extregs);
>> +
>> +       num_tot_regs += num_steer_regs * bitmap_weight(gt->fuse_topo.g_dss_mask,
>> +                                                      sizeof(gt->fuse_topo.g_dss_mask) * 8);
> alan: nit: a bit confusing we are using "num_tot_regs +=" when its the first use of this
> variable after init to zero, so just "num_tot_regs =" is fine here.
Typo, will changed to =
> 
> alan:snip
> 
