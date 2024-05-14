Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA0BC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 12:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1FB10E3BC;
	Tue, 14 May 2024 12:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WB75c2al";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A6310E3BC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715690830; x=1747226830;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ABWELwk+1s2qSTD4alfzXTvAPw2EHa+mCtuCqBAnvnM=;
 b=WB75c2alLbjklW5Tlh1ocFf+W6VnoPS7TNk+s2T1idGaTkcuMRzpoiT2
 7StZg/qpXYF6z+bsV3onKALPidLX+GRaK45JsJg2N5c8gOwoHJLx2VZee
 NHV80TYVoeRThjX7iBkt92UFObzCAOmwh7vtQ2lVZIUPPtkTWEHIR/Y8J
 TIFsBPUCI/O1xPvPzf+2ZqfXc5CipamXr7m8eEXUUy8epeIC8pzKqGhgv
 hMnukxBH6ZrqJBuIx6IHravC3G3N+Z96b9TUJb2X8nTmnbh2EA67y4D3V
 zCChmSCvTkXaq0fGzCYefouKvR3RskIo6piXeAxC5MabUNZKfs29lrwv5 Q==;
X-CSE-ConnectionGUID: 5qqYWcqNQkOR78uwKbm3eA==
X-CSE-MsgGUID: s0xKfEpVTpqwAMxXnxzL+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="34183968"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="34183968"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:47:09 -0700
X-CSE-ConnectionGUID: aCV8D252SX+aGavSvu1K3g==
X-CSE-MsgGUID: U5ggLfhoSeS4+XG/sAsVRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="53887704"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 05:47:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 05:47:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 05:47:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 05:47:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 05:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVRn/MKRgwnfWBOKZBBxcRrj4SiKEpN6sIDMby2WahPNJhXFn/d+9BsnOjdf/1l6CSxx9K86yK4JQNKvcHc2NXK/mAWGk2Zgdnzf6JQN3MajXUIbpA6FWajh+S37G4B8PeGOC7Bfky1uahZzMCmWiUTm7lNY+QtvESiB97qWl1FzuwZ8gkEdpJdRRngeKtf5skNVc2PHPIiYY9/Z05fB3vak8cxrhOWS0+m34PbakH8e+7Fy2455IeXk/k8JSsBA4qoYph07/xBISpQ4a5+3vWQuAjq3Of9ehWHvvMsme4cFPFpPGhx5DsSuwsaBKDy58+dDO/5pN+/SBaHynuw6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vet0pKWliMFR/5OFi2SIru+YtnrYkjLKOTOZ/gU5ynE=;
 b=hJI1GEnAmPrqXzJyuprppv+tr8uMZP8o9B4ogTIAjoU6f0KvpkEzQb8abdEnbP3z2QO2tuSbwZVuEu7E00bUm3hdyVe7uTeefw09K+drI/JwSS568IhG6CKlHgpVndhLlaHUk7fUV47ntCnJMbfAhqIZqCSdSQa5sqPooIWtg+sJSNMp8LRCtFw9EE06XI/um6lJR/Z9Jh7/MedbH7SvEXcmCaXkWad7G+eBqyIm1L/IbupUIWQd6GM8DUIP9sU7o94aCTLpUDfv7H+UsFqCD6BmeRMq5ukTJ2tBMUtbsLCpWaeJpFrf9XmEfTV3aU3H+CLSy8pZc1hlSByOppGoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BY1PR11MB8056.namprd11.prod.outlook.com (2603:10b6:a03:533::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Tue, 14 May
 2024 12:47:05 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 12:47:05 +0000
Date: Tue, 14 May 2024 14:47:03 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe/guc: Add VF2GUC_MATCH_VERSION to ABI
Message-ID: <20240514124703.4o5royonzqivxokw@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
 <20240512154915.2040-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240512154915.2040-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU6P191CA0054.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BY1PR11MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: c5747cc1-ce56-4f03-8040-08dc7413f5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWtBRngyME5Gb2ZYU29jR25WMDJPbWgrOXlBa3F4T0MwWHZxWFlqUU1EVEtP?=
 =?utf-8?B?Tk12K1kyc3BibkNyUlY4UjdrOU12aFJ2Y2thSXlqMGRiLzFoNDIwTVJkcmlo?=
 =?utf-8?B?cFpjaGx3ZUlpRjlBemIxV01QaXQyRkRjd3YreVhHaDluREE1SW1TbVdEelVz?=
 =?utf-8?B?V3hLcW5CVFVjQktIRSsrbjRYaWY0b2FnZlF5MnVGZUZnVkx1RHZjZ2kxd0NT?=
 =?utf-8?B?RTV4VnNPVXZmS09INm1ZVTIwaW1WcUR5dndBZmdvcDFaTHhzN1d4M29LQ2Nm?=
 =?utf-8?B?U0I0eHRORDlRZFE1K01KSElKazUwcTV4TWdBWmJYQWYzWk55WmFDVjkwcEFV?=
 =?utf-8?B?U1l5WmJEdWdXRk5KS1F3RzBNR0lpc2lpcVdienI3UEZZUTJUYUxOZ1dsNlRj?=
 =?utf-8?B?aFdtODI2SXRLdW93ZjlCSys4M3ZYZ3pCK1VKYndicVZSaUpId2VzSkVXcUpN?=
 =?utf-8?B?ek1mb0IzR3NzQkZ2NldFSVNmdHkxQW5Yc1dwN3NzZG12amQzaFdCUytrQVoz?=
 =?utf-8?B?bXFObWFjTmc1dnd3ZDM1S01BemlsWnl0UjNRbHV0TlhST2FNeGttN0ZuaXl0?=
 =?utf-8?B?MTFxbityQUtyczAxRFhZaitibjBibVpsNmZxSnJGaTJFN0NnK1I3QnlhZ2lY?=
 =?utf-8?B?dHhTYVZPQVdpWmc1UysvM2ROSEJRNVpjV003d2xFNnljdXZhd3RQbUEwMGRK?=
 =?utf-8?B?SVBseWx3U3JKQXRNZlVMRU1JSHBIS3JueVJGd0NKTk1oZHp0VjkzMk9ZbE1p?=
 =?utf-8?B?QlR4eTVBY3k4dm0zTjIrWE51T09xMDNTRmpCWXk0M29XU1cxN1IwOTAyTk5v?=
 =?utf-8?B?eU1EN0xZdjgrZ0ZoM241SzZOb1RFUUgxNFExRllHTFlXQ3o0V2s4L2E5L2xU?=
 =?utf-8?B?MVJtWjdYcHBORWxWVFJxSFJ3Y1krU1FGbGkxcVVGcDBVMGRZejFyU2FKTXlU?=
 =?utf-8?B?Qlg4eGlzUlV4QjZuSm9tVGtnWXFqVTZCck94blMwU1V6azduMTBDUWZSTlk4?=
 =?utf-8?B?NVlKcm5HYms5R0pEUGEwUHMvVEMvWUIvT2xVYVozdGIrNS9uYVkwTWxYNC9s?=
 =?utf-8?B?L0x5YTlYS2Npb01OeEE1endHelppVjBZMVpMZXZHOGU5eG9jWll4b2JhY0wr?=
 =?utf-8?B?T0pmaFYzWDVZWHF5Q05XQTB5SnVHS09ieXFqdTE5Q0xXZS9qTXhyWUxYaWY3?=
 =?utf-8?B?bVZibEF4TE42L1hZSEFkbjZpemJqeUExOUJ4c1VLTG1ubDRHTjREQzNHOGlB?=
 =?utf-8?B?WlVaK2xoRk1iVzRNMkRCa2l5R25KQ3VaOG1mSVJrQjZqNkdEYlVZSG9TZ2lI?=
 =?utf-8?B?dVJ5VElVMVJiRmRZV3lHZGtoVkNiYU45cEt4c2RLZERsVmxNUWhmbmpKTVpt?=
 =?utf-8?B?UlJKUkJQMVBWMEwybU5YSjBOK0V5eTZhN1lPem5NVFFmNHR6SGp4Z1FNbGY0?=
 =?utf-8?B?RVpGMVdKYTVOY0dYdmpCTzhnbjU4OVpWZTFHUnJWR2Njd3htN1pkRW9rM3pW?=
 =?utf-8?B?Yk9EYzVacDRLNnQ5dXRzaS9YR0wrenlHZno0YzdoQWg0QXYzTkEwZURyeTV4?=
 =?utf-8?B?V0lmTll0QUJQV2psV0dNMlkvS3dIUENicWIrZWVFYitubUFaMERrUWhKSkth?=
 =?utf-8?B?WldyOUZMYnpjS0lndUJzZzNURFdwT2RZOEZCb0Yxc2VqeWZteERCT05TS1Ey?=
 =?utf-8?B?MDk0MEV2R2plZUpzZGxtSzk0aWJUN01PSVJTTy9FSU9vbmxEVXdxL2lBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tkgvb0tnMVEzUDEzNHYwaXhNS3FEc2lGZkpWRC9KN3Q3cy9VTDdmZWw3ZHFE?=
 =?utf-8?B?R2hObEJTbThkdjNRWjhLZGRhRzZnSDF1ek82c1hLa2NKS0t2NU10WVpaNFRw?=
 =?utf-8?B?OG9halFveDlvMFBQTjlOQWw2c2wzWGxpRnV5ZGtOVTN4TGdzYm56R2hiWkpC?=
 =?utf-8?B?RkMzek5xUVQ1MkhOVU15VGs3N3JFNGMyVGJOdnJ0REc0SFY5bitYYUNxVHNz?=
 =?utf-8?B?VjNicURuamRuS2FmM0RkNThpTGtBZ0xlajJXRDhCLzdaZitNZy9ubm5pRGR0?=
 =?utf-8?B?V3NCc2Y5Y1dsUWVWY2ZSdlVtTWtDamFuR0ttZGh0RndKbnFUTCtSbWt1VHJn?=
 =?utf-8?B?WUVOcWRTV1dSVFhMcUZlWndiUWdVcWpsS05JcEQvYUkxWVk2aW9Wd1pGSnZO?=
 =?utf-8?B?V3dYdHhHYVhhYnhVU0lSOXNIWWJ4U0M1eHg4SWg2Wjk3UWxLcUlUYlRGdzB1?=
 =?utf-8?B?aWNTcllrTDVrZTNsK1oybjF6OTlwRDhsTm1uY2NaY3l6UVlyM2JJcHZqL2ow?=
 =?utf-8?B?SC93NXREQk9penpCazEzdXJxVEt0bUs4Wjg2YWNDSDZrdHR6K1c3a0JXcjBv?=
 =?utf-8?B?czE0UWprVU00N1dzaGVyNTFFbHRGSm5iV3hwdUxDQStRaVMvNU1sWnk2NVFw?=
 =?utf-8?B?K3MzNXFxOHNnc2x6R1owV0NzZUJkNUs1bEJqcldJeS9yNlY0UDhLclNrWHEv?=
 =?utf-8?B?ZkZoU3NjUVhhR0ViTXVCQXdjYjU1UDRmZnd3UC8wbGZ4NXVSakhQaTEzY3JY?=
 =?utf-8?B?REowZmxwNDRBMFUzcTRWUFl1MjN6SEMwaUlGbkJUanBCVUxKSlpzdlhzOUJN?=
 =?utf-8?B?QjlwN0RtMTlpY1hSeGUrVWpFL0grWUU2MjFZaS92UkdIOGJPOXNjR0FLMnA0?=
 =?utf-8?B?Ni9FbVZrTU5SUUYrTnVjMHZtTGtwS0pLVHFORVZ1cjA2NERsb2xqcFJGZGpZ?=
 =?utf-8?B?d1RUYXpBcm1YWjJxazl4OUVEdzhheC9neFpxbS8rUHJOMFVyZ21Jays0VkRV?=
 =?utf-8?B?VlNVcEwwMWRUZGlFVFI3aU9wN2VTeWRITlUvVEQrRzg3RzJReHFkQjY1TWhG?=
 =?utf-8?B?dWsyWmV1Z3RHLzJlSGwzYXJLWGpBTWpSWHpEWEo2ZW9pTzRkdGRmVVc5Zjdv?=
 =?utf-8?B?L1c1cmNiTXpDSlZ3UHhPZ281dURvdng1K2xqOHFNTERhRllOc1dZdzUzZitP?=
 =?utf-8?B?U1VaUkFVbFhjeUZvN1haenRzejQ3bTVzNHlZbkZTalExeWEybHo2bHFGOEw3?=
 =?utf-8?B?Q0pQa3ROd3g1c3FCT0JqSUxrZFdmNDdZYSszc2wycG5nQmd0T2M1SU9EQ08r?=
 =?utf-8?B?bnRVUkZTczJhL3MzWW0rSk9LUnIzSHRVMC9md0RzUSticGtwbEtqdTR2ODhp?=
 =?utf-8?B?VWNYTWRiUUUvZmk2V3FTbUoxVWNUU1o5N2J2ZmVGMUZFdzJXREZTR1VwcHg2?=
 =?utf-8?B?VWZOUnVjQjF0NWlWNlA0OWpzNFNnb1pub29aY0xjbVZRMUYvY20rc1Z3WVl5?=
 =?utf-8?B?NndoR1REemJmcVQ1SC8yWFJGbXF2UjdBSUVJcGJwckIyU2pUaW5UajZOcTQ3?=
 =?utf-8?B?Q002ckw2QXBoZWZIdXVKTU81d3hJY2tZN2M0b0dreTB2NGszWFlDNUVNcUhk?=
 =?utf-8?B?TW1tc1ZSWFQ3bG5iTGdDTk9rcWYrb2txZGJRazRaNDZkTURUWHU2d0lPMVNX?=
 =?utf-8?B?cHBDc2pOeitUZGRwTU1BZFFmNUIrakNKOHJxRUVYNGsxRVRUaXpQdXNmRFNN?=
 =?utf-8?B?VlFaY2UxVjRJTVVncDA3c3dEZk4wTi8vTnFpbmRBQVVOU3NJaUdFc0MwcmF3?=
 =?utf-8?B?VWdLeWt0WjdraTVCS2Fjdy9Da21RVmtNWUpCbHNJOExYYSt1c1RTekRKeVFB?=
 =?utf-8?B?a2w4MVhPbmlzTVVkYWZDMDlhcEJTTDBIdUhVUGJtdzQ4Nkp0OFkwYmsxMFdT?=
 =?utf-8?B?Tml4ZXQvbGJ6bjZWMmlQUWYyRU1zemsxZHlqeGo3bFlVRzA2b0l1S1VEekJj?=
 =?utf-8?B?YTY0ZW5kTHJxQUJlMEJ6eE9WODEweDRZdTBtTk0wek9UYm5idHlCMFVXaHh5?=
 =?utf-8?B?c1JHbXpCZjFEeHpFNE15dUdIK3NvMHlFbnk3VXZqRi9kNHZ4SkFHV3RGWi91?=
 =?utf-8?B?VW9waVBCWlN3R20rYUduSmFOR2N2NXZtRnFGL0JwbGNEamdRQ2tDQ1d6Q1hC?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5747cc1-ce56-4f03-8040-08dc7413f5d4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 12:47:05.8676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rOIix9f4GMig4jXAdm0n6Vuus2eb1cxIlN/I5oNnInwfdst4FAoSlk9MPfj+s5uQsYZm+2gdLim9v11dTduPTEv509IXmJ+NP/wanRaL8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8056
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-maj-12 17:49:10 +0200]:
> In upcoming patches we will add a version negotiation between
> the VF driver and the GuC firmware. Add necessary definitions
> to our GuC firmware ABI header.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index c1ad09b36453..49ed5fbd4ced 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -213,6 +213,73 @@
>  #define   GUC_PF_NOTIFY_VF_PAUSE_DONE			3u
>  #define   GUC_PF_NOTIFY_VF_FIXUP_DONE			4u
>  
> +/**
> + * DOC: VF2GUC_MATCH_VERSION
> + *
> + * This action is used to match VF interface version used by VF and GuC.
> + *
> + * This action must be sent over MMIO.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_MATCH_VERSION` = 0x5500         |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 | 31:24 | **BRANCH** - branch ID of the VF interface                   |
> + *  |   |       | (use BRANCH_ANY to request latest version supported by GuC)  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
> + *  |   |       | (use MAJOR_ANY to request latest version supported by GuC)   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
> + *  |   |       | (use MINOR_ANY to request latest version supported by GuC)   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |   7:0 | **MBZ**                                                      |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 | 31:24 | **BRANCH** - branch ID of the VF interface                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 23:16 | **MAJOR** - major version of the VF interface                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:8 | **MINOR** - minor version of the VF interface                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |   7:0 | **PATCH** - patch version of the VF interface                |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_MATCH_VERSION			0x5500u
> +
> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_BRANCH	(0xffu << 24)
> +#define   GUC_VERSION_BRANCH_ANY			0
> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MAJOR	(0xffu << 16)
> +#define   GUC_VERSION_MAJOR_ANY				0
> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MINOR	(0xffu << 8)
> +#define   GUC_VERSION_MINOR_ANY				0
> +#define VF2GUC_MATCH_VERSION_REQUEST_MSG_1_MBZ		(0xffu << 0)

NIT: It seems to me that GENMASK would be more appropriate here

> +
> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_LEN		(GUC_HXG_RESPONSE_MSG_MIN_LEN + 1u)
> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_BRANCH	(0xffu << 24)
> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MAJOR	(0xffu << 16)
> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_MINOR	(0xffu << 8)
> +#define VF2GUC_MATCH_VERSION_RESPONSE_MSG_1_PATCH	(0xffu << 0)
> +
>  /**
>   * DOC: PF2GUC_UPDATE_VGT_POLICY
>   *

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
