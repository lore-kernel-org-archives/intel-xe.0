Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931E0C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 11:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9A610E34A;
	Mon, 15 Jul 2024 11:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oxk53t78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B063F10E35B
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721043613; x=1752579613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NJnho2oVmAvHsp2eJbYK2O0SXR797YWEoMX9JWXviCc=;
 b=Oxk53t78DSZ5Wb+zCPw6LvEyS6cF7ERGIRYgKUjeXdRM/MEA7M+6v/KK
 VXtEN2A0nZ29n16xcrVo1qj/PHi7C0JYfiZbgpELD6tZQMVFms/46MZte
 cmuYzoKHd0fltD9ZUyckI01LV5Nngltas1PgN2DOzyapuxGoO8GiK08kj
 4VgZEnenk+Ob21v2/E+C/UcxtfA4w5ayXCw4GN14M5Fu+TXj/mVNChpqS
 z6CxbG2Sl+6JsQ43argyvxWtIJEsoUOmH1sy60ZYbCUbVgrh2FHMSPQ0c
 vmr0bpTmYrpRC75s9goOBtRMiZmqm5X7Q7Swz5DqWmMhXK4L6DJIjEsti g==;
X-CSE-ConnectionGUID: 3bmKkgMJQa+s9U+UpwBORg==
X-CSE-MsgGUID: wgzJ7EcRSiqa+MyRc9AEnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="35956523"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="35956523"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 04:40:10 -0700
X-CSE-ConnectionGUID: BDDk31hTTC2XLUKRa/m60g==
X-CSE-MsgGUID: A5tJ0RUCRSm1ZkeWylne6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="50365165"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 04:40:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 04:40:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 04:39:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 04:39:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 04:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVmY7DskpDjn3CtSaannP7UOjtEcwL6BD5Eny99ViX3xci+52JM8JP/Rcd4XtbO8t3pOwyvy9ZyGGvRWbh14VQO/jAyjjXn6h1T9Aj77jUoojdZNk1RUjtu8lomYP26tlZt2sRrMJ2ITlM96cd6lFChvaianblZQbJkVH1rJdkOFaw3GqlRWKqnBMPWLwnIP4m/22xS3FtHbQ+1bmQ3p5o9DV9A4FSrz7BS88RlPtfsnpvCUAtavv7vFqtI3A98svdKQtMpnDuSHtVqNWvVHJANaz0yCDxYoLDCtdgcbbREXzQmXnAkwiH/ow0HNtD/PhRRDRQbmePgfXYXFTOu1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHwWTiHJmflGCJnGIfV9vTAggbsLHSZ/SNK8lH7UGG0=;
 b=SiEgSFWFKvoKoAvoBeTY/rgzyMTEcHCpTcXswmPMFX3m8e0ohbRT9mgsoRAIU7/wrVJYimjADOnfgJQ8JDBssjPGBFiVE2h5mVrnwEc7thdO708F8l1MK+EmGEfeXL5xwz/fjcL3pL125bZlUdg7xNQTy9zQue1o1fE98MwaiQstD1+dC+FvRk7gi8BpTDVBYohKVKPty1k2bFMVHyB+6Tpda+kz/1w7ND6GQEeZQnxivra0A38KRhkrRIlqonsWKACuzrlEiMsTyKG9lLnYN6AxJrmbplooWvOLpbbu+Zd+4TIbYUgLysHueTsDyMK5rEAfbHE26x3mBxf3mIhnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Mon, 15 Jul
 2024 11:39:51 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 11:39:51 +0000
Date: Mon, 15 Jul 2024 13:39:48 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/vf: Track writes to inaccessible registers
 from VF
Message-ID: <20240715113948.p2asmszfc6ucxo6n@intel.com>
References: <20240713142643.1242-1-michal.wajdeczko@intel.com>
 <20240713142643.1242-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240713142643.1242-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0247.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f87a39-562d-4d81-4054-08dca4c2d6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU5jdFA2bjJDcTdGbGdoTHNLeStaUjdreE9aMmdnZjcyTmFadmFYU0hicUdk?=
 =?utf-8?B?Q1lUR01rc0NYYVJmbFN1SnlYT1hXSng5WS92dUVqajIrbmI5V3NPc2ZrMGdU?=
 =?utf-8?B?cmJHZm5YdHJBK1FBQUh0dktqZ1pzRjFVbGhzTWV4UVN1MHdBQ3pqbEZ1aWFj?=
 =?utf-8?B?a0ZQSy83TFRpZ3lPUU5ZYWVjQUR0MXRjQWgzWjQ2T3N1Y0llc043RXNvL2t5?=
 =?utf-8?B?T290dTlWMHVVQ2pGY1R6c3BBMk1odGg0eHcxenNaRXVISzMzd0Z4L3pZc1dZ?=
 =?utf-8?B?SVQrbnRoS2FiV0JxY0pPYlMzMHdvaE1JNHpUZFJDdkVZOFFEQVE1cGwvMEdU?=
 =?utf-8?B?MWRDS293ZDdWbms5di9tQnhUY1lRb3VadkdWOU9oSVFRbHpXczhxVkxDcFZW?=
 =?utf-8?B?YXdseWwvSGV1WXRpcmNiampvaVdzKzhhWUEvcTdsZWZmOWZyc0ZYMC94V2RM?=
 =?utf-8?B?cHJSc0tERkFXdXk2OWhPZUM1TEJQeWFSWm5yTU5FZ3UwYTM1dWJYTkNRRnFP?=
 =?utf-8?B?Tk9JL0Q3OWFkUG1seWtNYm1hemZJTllRR0dQMEVIS0F2WnYxMlZYSWtyS3A0?=
 =?utf-8?B?TVJobHR0aHd6OWVRSEdRNUcybDI0SG9VZ21ybDBjb3Y1ckMyTU9yclJpN0VW?=
 =?utf-8?B?cVcwNnFVNzlHWE1ZazhJTDM2a0hGR0RpSWlYRHh0Ky9ualhyRHlueWFsM0ta?=
 =?utf-8?B?OVlZVUlweGdkU3dMVEtudXQ5VUx1WEVuUzlGbFhFbGhTaUgwcDRBSjlXYzlu?=
 =?utf-8?B?U2krMzE5eHZPcm5GU1dsUEVrMDZVaVgxMU80NzNZZWtYdzBQS0Rlai9MN0lY?=
 =?utf-8?B?L0NLQWlOS3Y0aHgrT0lsVzR3OWU0Y1R1SVJhRjVtVEdONnF4eGtJejhBUkpt?=
 =?utf-8?B?WE1zTC8wenZ0WWNtQ2xTS0pjSDd4aDJneVBEdjFzZ0JzUTQ4VW1weEU5Tjc1?=
 =?utf-8?B?VW5FOWY0ZVBxNmVPcUpwVGYwN254SUdyWkxOR2JLeHhORzczam1Oc2FSekNF?=
 =?utf-8?B?UjBZdVNaWUozdEo5R2hpZGU5WWVOTEdWUWwxeDBOMTM4M3hEV1kvaWZnNXVj?=
 =?utf-8?B?L3BFbzJQNlJ2L2lSU28vY1VaQ3BicVdtN1J0L3VQRVZVeEtKbWtqVHNqaGVL?=
 =?utf-8?B?ZkIxQWdscVgzOVRhQWR4b0ZpZTMwcWo0a25ESTh5OHVmVUFVOHkrRkI4aU9K?=
 =?utf-8?B?OVc3REJpcGYyLzVZalFyQk8wWjhVZ1pGbU5LVmxrWk15V2MrNk5zSFQza1dv?=
 =?utf-8?B?VWtrbUF4S0Q4Q2k1S1B4bERvditKb0hDcndxcFQ3UWVJbGhpMTRkWG8vbjk1?=
 =?utf-8?B?Y2l0eld0R3hYQWlrL090QTdyb25mRk1ZTmVDVzhrT2pzSXVEQlU0VmJyZHpk?=
 =?utf-8?B?b2UrN2FmRWtHZkY5K2QyR2hzdmlSNlM4TG44bnY1N3A1WURqUWhsc3l1N3VD?=
 =?utf-8?B?cjNDMTF1bEtraXhwLy84SnVoWkFxTkJodTgxbmkyL3FUaUpYT3l5dzZVQXVP?=
 =?utf-8?B?cmZpaDlSTmdIOW1URXFqa2dGUWVYTDN6UmFpdlRFRHRXVXNaeGZkb0x6YTU5?=
 =?utf-8?B?S1Q4THNmVUZJOVpkUzBFQlB5cFNvRGhicExUai9pcVhoU3NyUmpoR0NEY1VB?=
 =?utf-8?B?dVphVTdacmZmNGV2QVdOVWtTTUE4b2orMDJkRktTS1ZwcytxeFJSczVqUG10?=
 =?utf-8?B?NGV5R0VWMHZpRGFoczEyWHp6TUkyT1paSXN1Y1lOWk13YUQwTC9Eemlxc05x?=
 =?utf-8?B?QWV1VXRoQ3lnaHpEYTBBZll6TG00S084VU5UWXYweDV3UjZ1K0Nzc05TY3cv?=
 =?utf-8?B?dGFnMUpWYmVtb3JMeHZVQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajVEWS9sVFd3NDNoMnIydUlKU2JLcWhRS25GVU9jM0FJMXhKZU9xOUczUE5Z?=
 =?utf-8?B?WGx2b3dDandKd1FqWjN5Q3R4NXowV3plTmZTU09wZ2pOVWNkTmNYSFRncGpl?=
 =?utf-8?B?Q0pGTHNxUjZaVFFwWWVtWWhSdUxZMHRkRWFrL3dMYkl1OVo2Y0lRS2JMbzdQ?=
 =?utf-8?B?S3lBOVUycEVydEU3dlpLWEZEQWRVYzI0TGdMcWVVeFZ6MzExcDdoendIV3ha?=
 =?utf-8?B?M1dpZE0vSjJpMjB4endDeXJ5SHR6U1h6SE5xalR2NUVGQ1ZSMGlPNktkOUN3?=
 =?utf-8?B?a2Vjc1YwVHp6NXgrTW9ob2xndjlLMUNlMVhoL1ZsMjFyMkRRbk9CY0xlUXZZ?=
 =?utf-8?B?ZVBlZHRmejQ4WHRZQ29HUHMwT0hSYWNid1ZFOVhINXlUemlIbHVoQ1pnZXp6?=
 =?utf-8?B?K0hjUGRKblZxdVM3Y0t0UjdpNlpHVXR6Nlc0MlROQnVZU2h0V091R29VbmZq?=
 =?utf-8?B?UXFrckVxY2dTUlNDT1hmQnZsMUc4blFQRC9rTTcvZzh3N25FQkRXTTcxZVl2?=
 =?utf-8?B?S1ZvYldIN2NVbXN2RzVuaGZHWHk2dG14N0FJUGN2L0Y2SjFkbVNkOHFXY08v?=
 =?utf-8?B?NzhNWHk4R3FUeGtmTlp1eWg1aUIzL0Rodjg0WmFwNmNiaEcwU2xPQUN3MjVa?=
 =?utf-8?B?UEIxVVlOeHdMU2xLckZweXpXaElNQkZSR2ZWQ3RoMUpPMkZGWkREMVo2cTJJ?=
 =?utf-8?B?QTh0U3pjNnZtcXZkOG1INTlxMlh3R0dNV2hIRFQwQmd6WVhWNGdjSWpSLys1?=
 =?utf-8?B?RGhLMEVWNVRmOEJFbThXY0RvWTlUdldBYlhURFYzbCtOb0R3YzMwSDNxd2FO?=
 =?utf-8?B?bUpPWVJ4cnk0Y3hoeVhJOGJKUERIcFcrdWUwUHBKUXdBOGEvUjhIN3UraUNK?=
 =?utf-8?B?RWVQVzBydzBCK1JqZDRrOGV2aHpGWm9OVFRxb3l2WmtpdzVzSTNacUNtV3Y5?=
 =?utf-8?B?MHB3SFhEVmc5c3gxNmNIQ0dTak1vckI5THlpV0xLK0FmejFWeTE4TCtMSzAr?=
 =?utf-8?B?ZzZRK3VobVUxVktDd1BxVFRrVjR5V3lMNGhpc2c1RFpjd1pWZkkwK2hnUjNa?=
 =?utf-8?B?VXh1YUdQRkdhU1dnU1ZFalMrRVY2ZUdJQTBrRHJOYnRSYTN6WGdtMTkwWis2?=
 =?utf-8?B?bitUdWlFZmVjT0lQS2pqdk9mMHhGWU9DOEd2bTdqeER1b1A3bU1zSzB0c3hm?=
 =?utf-8?B?N3cwSVZNTUdCcUZ6UFFMeVFhcUlpaVhsK2ZCZDlMQ1hyK05UZnozV29KOW90?=
 =?utf-8?B?bjlMaTFCZWhBTnpsVDI0aTEzR1FINVloWDRqZkZVZXlNL2ZVVFhuRGFHc3o3?=
 =?utf-8?B?YnlBOEFjNEJPQko0OE1GUVZJaDNSS21MOGdwN2I5LzhUeEZDZTVqVDhHSkxS?=
 =?utf-8?B?dEhZZTdNYzJuSEtmbGlBbXlsNGNsTmNRQ2lNdVRtTHM4ZXZpUEI0KzZaY2JC?=
 =?utf-8?B?Q0cveS9zUlU4OXNvRmR1TmdXYjFUS3pUL3lQbGgvWWlFM3FIajdnbTZVc2Ew?=
 =?utf-8?B?YzV0SnNtMGVXSUR0anNMQm9lQTNtOHVGeTJpQ0FObVdLckhQT29Kckt0TTQ0?=
 =?utf-8?B?dXdaQ2JCMFFKcGJKTTRBRktRRTRSbURFdDg0cndZdWNKRmVEZUdJZWRteHhH?=
 =?utf-8?B?OXRJMUo4MGxPNkhqdnRSS2xzd3V6em0wcUFCUzV1MTkvZDhkVXRGZjBBL21n?=
 =?utf-8?B?SnlVK1hjRDhIOEJXa0NSclZJRVJ0SStLL0xVVGRZVHd3WUordVRsM0ZDcEVi?=
 =?utf-8?B?ampYRGhtTkc2Q3ZVaEdSQVZlTmY4NEtaQ3JpbUFBUmJtY1Y1bzNLTUdtVEkw?=
 =?utf-8?B?RWZubHlzTWV1UzYzY2xKdUVKaXdvWTZhRWhFQWZyeTNZcXlmWmpKNnN5bzA5?=
 =?utf-8?B?dE9DbzZVVG5MR2E0RVpTa2xXdTFSNjZ2VktzbkZvWnBPeDZ2N3JPSWJsRzdP?=
 =?utf-8?B?dXZNU0lDU0VPWWgrSTNFVHNqRFFTd0FpL2hOZFZuZ2FkdkhyeXhpd2Zhd1Vq?=
 =?utf-8?B?THhmTStYME5HYnhROUxlSkh1aWxuOTJTOStPZ2REejZmLzdISUMwZWlhM3VO?=
 =?utf-8?B?UitZUlV1N1daZHUrQXdTU0RNeitqQS8vSVg5aGtlMTVYQmtYdEh2M01waVNr?=
 =?utf-8?B?OEI4VWZMRmFNLzJKcHkwRE1NaDRIcmt3NDRuN09BZzR4ZWY4RjZ0emlYemtu?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f87a39-562d-4d81-4054-08dca4c2d6d7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 11:39:51.6341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Bu/CGjhoWTchQvBcgK5KbLp80GCQwpK6LbEnAEga4Yg/+wc0G599D1jE6xeh4pwwu70Lc9HSxIZjmuHvAa9SK9ohe1BkJFLA26jBeX3t68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on sob [2024-lip-13 16:26:43 +0200]:
> Only limited set of registers is accessible for the VF driver and
> the hardware will silently drop writes to inaccessible registers.
> To improve our VF driver lets intercept all such writes to warn
> about such unexpected writes on debug builds or optionally allow
> to provide some substitution (as a potential future extension).
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
> v2: update commit message (Gustavo)
> v3: drop case for SOFTWARE_FLAGS_SPR33 (xe)
>     improve function description, add comment (Piotr)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_mmio.c        |  6 +++++-
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 41e46a00c01e..6a87d31c44e6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -892,6 +892,32 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>  	return rr->value;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_write32 - Handle a write to an inaccessible register.
> + * @gt: the &xe_gt
> + * @reg: the register to write
> + * @val: value to write
> + *
> + * This function is for VF use only.
> + * Currently it will trigger a WARN if running on debug build.
> + */
> +void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
> +{
> +	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, !reg.vf);
> +
> +	/*
> +	 * In the future, we may want to handle selected writes to inaccessible
> +	 * registers in some custom way, but for now let's just log a warning
> +	 * about such attempt, as likely we might be doing something wrong.
> +	 */
> +	xe_gt_WARN(gt, IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> +		   "VF is trying to write %#x to an inaccessible register %#x+%#x\n",
> +		   val, reg.addr, addr - reg.addr);
> +}
> +
>  /**
>   * xe_gt_sriov_vf_print_config - Print VF self config.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0de7f8cbcfa6..e541ce57bec2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -22,6 +22,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
> +void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>  
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index cf622d07e190..ea3c37d3e13f 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -171,7 +171,11 @@ void xe_mmio_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
>  	u32 addr = xe_mmio_adjusted_addr(gt, reg.addr);
>  
>  	trace_xe_reg_rw(gt, true, addr, val, sizeof(val));
> -	writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
> +
> +	if (!reg.vf && IS_SRIOV_VF(gt_to_xe(gt)))
> +		xe_gt_sriov_vf_write32(gt, reg, val);
> +	else
> +		writel(val, (reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
>  
Now it looks ok:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> -- 
> 2.43.0
> 

-- 
