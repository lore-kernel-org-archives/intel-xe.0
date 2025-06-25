Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D226C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D449D10E762;
	Wed, 25 Jun 2025 15:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRbGgFht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FC610E762
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750864682; x=1782400682;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=btxNLQXcLOvFlUTnePHBYh71sJqNtnrXcWHamth/V0g=;
 b=XRbGgFhtTyfeZBvERDLJXHQ56dwrGTenvUpphjkiBoWlfDaJ2pFbGdD9
 oV/lZ7CrHXALft/VO79E0cb7KIi1ncXXqBaFFSMglyM2P95goqHG0XXyx
 fF8ZKGwiFbaJrSy71t4+VIiF/RwcWkOPU4Fi0fmtFS7aoZcCo01ScRqJq
 C9sS5MKwgcDnkAYFi38Ixs9gz8+HCfM6YriisYK1n/S0Wvd2a6qRXat1v
 RQJlHLB1fM5uvcXStvBaNYS1vLkeNVFYT6wQJtEbHrku7N5X9mf6r930k
 Y34/OIMRd9Rhxg26C/WKQ6FeJOzhBFzCU+63G6qAqs1pkkIsbhhSsjsXT g==;
X-CSE-ConnectionGUID: to/fgYc3T6CMMVbqbE1FjQ==
X-CSE-MsgGUID: m0maoXL4Q3izvvtpgRPgBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52256479"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="52256479"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:17:45 -0700
X-CSE-ConnectionGUID: V1W3o1aZSuKBQgqAFpe2qQ==
X-CSE-MsgGUID: gavKLEsLSLWqGOS5ON9tGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="175893707"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:17:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:17:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 08:17:24 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:17:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBicewJ8dYfmLsptxiC0JfM2IXBQHXfPMxp21TU8WjQ7L1lgC3lA+dgyvZyATR8yabNNHbGFK+qfytLszq7m3QpcdPg5UPnRmp9MSnjbE1THFoe/v5rhQP9pBLiosxOzudajzu2cmRzuJf027nElSZ1GhRxIlDiwZ9PYMC18NdBpXrQvt2g98uNCujskFRijV5z2Yf9yXUNr4Hf/TdY/d26HeyCLG+OXH9LEY7qD1SFxViP4c/kSMa0zlqWBSQXA67gAWAcO8FKGiA3946ToUJcePcaK8okFTTaiQzsWlofizpbCj3aglnwPQJp6nYt0Y9EzAnlWwhP9UULgFJpgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfX+F4UsypxmRM0yQuOrZRo9Gu+3/B7N1oEeNY3U2yc=;
 b=Y5UTR6VyuKjA6ZQjVSQjuRbGHiR+7H25g5tdXHRJX0YPQGonAP3ghDzOpW2YUH1Hx6QI/2IIcdoxpiQZUi2ZPhOvACKyIm82uvAmYf1lCMhST9TkFYWEOPykSVJLD0f4Rv75WQ+MYSrWcxXlDWRl+vP+/9nAIEc5cy9pf1DpKa8lr8sKYXr4YYUPQYGE9RkrrmAN/mq6HMdsBSfYLkaiXT7TCQgKzHUHguVEB/QdxJR2SKmGmlYZbkyfyjdbdDWegHfU7H/IWoxzuoqHtu+aKk8hO9PE+XWDBxW0ES9U+U2KCnAJsEbOOMqgQURH/89/CJvxWixow1iG/35BWvVNMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Wed, 25 Jun
 2025 15:17:18 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 15:17:17 +0000
Date: Wed, 25 Jun 2025 17:17:15 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Move PF and VF device types to separate
 headers
Message-ID: <20250625151715.f5t65fzgmi246wkb@intel.com>
References: <20250624200923.1348-1-michal.wajdeczko@intel.com>
 <20250624200923.1348-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624200923.1348-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:230::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b90e5b7-51fe-4503-826b-08ddb3fb5f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW5uT050NHdpd3FzRHljeUNKZ1BJbUNDM2dxelBxd3BlYlN4VGFIRjg2UmNo?=
 =?utf-8?B?aUhDd2dVZ1JDYi9xaDVGbi9CYlkyKzBRd0Vock5KcnFtTkxtcXlIK3JwRVgz?=
 =?utf-8?B?VG50L21uMGZPRUQ5RXA0eGFCRkpneU94bEZYVlhSZXJCUm5YNndjandiSk5L?=
 =?utf-8?B?VWg0KzBNNlBYWkpNT1FsekxMV0pwM0pSdDNYMDE3RVRPMVJhYXdybXlwTlJz?=
 =?utf-8?B?enFGbkF0L0lJdXlTTitqMjRsNmc1WHZNdWREQzVrcUhTeHFLQzJORXdqTy9a?=
 =?utf-8?B?OGR6Y2dtbEJYMjRDUFlJbnQyWlVTNlVnRjJ2d3MwVTJTV3R1VE83NW1QbjdF?=
 =?utf-8?B?YTlJdDdZcm04VTNXczBvZTB5cWsrSDhVay9PYWRkMk1jNkxVbzVPT2g0VWRI?=
 =?utf-8?B?cU1iNEtxTEFEcldCTWJyRFZ5UFZ3L3BEOVduOHRoUEM5aE5sZmVxazlvd2hJ?=
 =?utf-8?B?ZUpBU1dJWlN1MWhOb1d3SlhaVlloc0ZKTDBteE8xWDRqODd4ZGFoa2pUWnVM?=
 =?utf-8?B?eS82TXd5UTlBdDFSbG56a2REZHlXc2VLTm5lTzVWU0tRNEptSkZ6NWc0Y2lC?=
 =?utf-8?B?WkJrWkRxWkVKT0dDc0lXQlhuNFBzU0l2M21Gc21wQ0pvMXE3VDlYUTRkTHhL?=
 =?utf-8?B?NHJ5enRqaGpzMlladE5aeUxnU0xwc2VRaUVLeDBRTW96TzdKQmZFVDZQS2xx?=
 =?utf-8?B?c25JNXFBN0M2cmVNcWxRamloV3piOUtCUEVnNlFqbDJHWGJ2dStxeGVlckFS?=
 =?utf-8?B?aHNrQkEwWUNBOW9EZEQ3d2hZMU1zM1NmMGZPQ3JUc0FqbXB6c0MyTWkwNStR?=
 =?utf-8?B?TnkvSHdTK3I1b29CRG5SUVpTMmVoWDFONklEbkZKWUZWRnowN2lLTStGVzRl?=
 =?utf-8?B?QXdZakJnMDN2K04xR2ZpclpkeGVNUzFNS2VjeHN3K2pUYTh3K0FnVTFDTFNR?=
 =?utf-8?B?UEZCMVMyVEY0NUVOL0dFWmQ1d0FtZXZHdmZobkk1eDgrVUhNdVZUZm56STlL?=
 =?utf-8?B?VjdvclV0OXVGVDhCK2x1dWw5WFpONWttaEVJbW81Skl1ejRBQjF6dEJrSHE2?=
 =?utf-8?B?TkpqSmpHbUI5RnhXamlRTkUwUzhNdVFpOTVmTDhzWEFPc3V3SThXdThma05m?=
 =?utf-8?B?N1NQRE1Jd2VhSmNWdWdpb0s0ckhPQUtaMEU3andNY01rdjhmeDArUnVoZzlK?=
 =?utf-8?B?TmxLR2t0b3FVZUFJcjQrcVk4YXJPejNwZ043Q3A0YVVnUThhNlorN0NHaU55?=
 =?utf-8?B?UlUrcm5nZkZWZ3VpL3I2OXV6Ly9QdS8yM1pQeFdQWXZxNkpsdlZBcHRRa2V3?=
 =?utf-8?B?UzBWbThIZkZyMVNBTFNuQkphY01sV2FRT1FGcmoxZVVMNjMzQVFMSUxjaUUw?=
 =?utf-8?B?SzhIRXBIQXI4RElxNHBVNXdRaVBmQjJDZEgyZGhOU0gyKzVhbWtVUTMrRGdV?=
 =?utf-8?B?dUVSRllrUjRCaGswaGMrclRiMGZmaUdsWnErTUtZZDZjWHhTRzZUendMUFVt?=
 =?utf-8?B?L3RSQmZ4c3Q1MzljRXZPT3JUMTNVdWlSYlN3YW5HSmxxTkJEbTg4clpJMFFY?=
 =?utf-8?B?T3g5TkZWTUpndXMwSDFNbmVvODVvLzVINnlZMFU4eW9ZWnQ0QkNzaDNjVW43?=
 =?utf-8?B?SG5KTko0R2JuKzI4b2hQRDZTOXRLbDRFNzlvaFU2bHZVU1VlZWlmSUZhblJD?=
 =?utf-8?B?cGlIZmhDZ0U2UW5pbTZwOFdyMFRjeE9tMTZpRlpLa0JLdklsUjM4NDUvSExO?=
 =?utf-8?B?TzlTdGVBQTRsSWhHL1dOcU54endUakY0enJiRVVZeXM1d2xoZk9xRVFXemlG?=
 =?utf-8?B?Y0RRcUx4emxyMS9sbjhsRVhHU0ttUjJocWVmeVBOOCtodzREWTlLblpDTk14?=
 =?utf-8?B?QmlSOTJuZi85bW9TUjh6WkRMV2VjVVg1dG9GQkplZStnK3BJWnBqbFNudnpF?=
 =?utf-8?Q?5Ir97o4G+MQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXYycVB3c2ZPVTBBWmdFdDZvSXY4MkdLYSsrcEVPbXpCc2E0MzBHRS9mc0NT?=
 =?utf-8?B?S0h2YnVaM1pKYTN4cFQyVlRYajhtTDljMU5sYXF1ZlRmSHVpSXFidWd5aXVs?=
 =?utf-8?B?bHhsSEQ2aFhnT0sxSUdUZ3V4VFpHTmdOanB1bFlLTkloKy93aGo5ZDgrMDlh?=
 =?utf-8?B?UWdTbzFtV0tqcXZGdjVNYXRuZFU0ZnZRdmhIeFJNeUY0QkVyR2EvSnU5QTJK?=
 =?utf-8?B?d21qVTB5dkV1ajV2L3k3V1VjemJEVzBTdG1YbHIzT28xdEt4aVlnamxtS3cw?=
 =?utf-8?B?a1Bvd2JibkN4bEQvMlhTMWVocDJKZ1dpZTB2dGkyUFo3UTRJTHB2VzZ2SHpR?=
 =?utf-8?B?K09sYXhuNHNBZmk0U0hNRnZ6REpCa3ErLzhmOWFGeC9lU2FuYTV2cEFTQ1dp?=
 =?utf-8?B?L0hUWWtCcWVrWEliZlA3bC9jWHBFM0V5Wks2ZEgveS90blFrNlFtNWFwNFVY?=
 =?utf-8?B?Q1hWZ3ZTN1paRFJibEY1SHNVMFNoYldDWnM2Wm5YQTJGREd3Rm1nSDIyQVBo?=
 =?utf-8?B?UWxZbHFIcHNaeFVCK0pRcWhsMWJrSzBFK2ovMTZORHJib3U4WWQ4bk5BaTZQ?=
 =?utf-8?B?cEJab3ZleEJsYWtHaG5ROWtIOThQOG5qOFA4WlQ4VTVEaWhHOGpIWmkrODZt?=
 =?utf-8?B?OHk4Mjh2bWo1Q0grU0EwaWpxTzVLM3hLdFFhYjN2T0M4T1o3ckFRMTRlQXNX?=
 =?utf-8?B?Mk5uVHRZcEo2ZUhnTFJkMjRjMEFMNlFFT093MkpOcVpETm9QOXJ2alFwcitr?=
 =?utf-8?B?NENrcVRzNi9tbjVLUzF6c25VbGhMZEJnZmFuaDBkTjU0aXNrUTFqdHdKbWtJ?=
 =?utf-8?B?TzNiSjdhYWtLUW9MRVZHV0lHWTlhZllWT2U4eFZ2eHk0QkJjcWUxWmJFcUhU?=
 =?utf-8?B?cGFQSndrRnEwT3hzaHNhNzRTQ25hVjJ3S3Vzc3NxOEtmM0pHV1d2NCttelQy?=
 =?utf-8?B?ekNpSFNBWDEzZWw4a1hJUWF2L2pMTDN5OE04ajhaSjVrYkxaRHMrd1lkN1Zo?=
 =?utf-8?B?S0ZHaUtCbjFxS3NObGpWYkJ5UHpXQ1QwZktEa0R1OUd0aEZSNDE5OURCMnQz?=
 =?utf-8?B?WDFQV3lieEh3OVA4OG9OeHNYS3J4T29NSjRCMWlSSnpnbGE1TmE0VWJOVnps?=
 =?utf-8?B?UktEYndXbVlwc0pmZ3hwbVpLVEZUc0ZUTVBNd0pFcGVIRDVNYkkzbU0wM1Jv?=
 =?utf-8?B?VEphd1dUby82WU5scEJ0Nk5YbHZHUWxvRUlGTWdPSmtpRk85WHFvbG9jRkZG?=
 =?utf-8?B?TmNIVG15TWpReE9GMEJmV1FWTnI2NEZHTFA4WHRzNmlZMkNxVlg0WGpOUjM0?=
 =?utf-8?B?YXFZS2M3clFYV1BCVXdhN1BBd2hTMHZzRkJDSVUwcDVLZHUyTVZUMzFmTnpJ?=
 =?utf-8?B?ZlNtQ1pucGdsL3JZQ0JHd2QzcEc5V2llR2UvRzBzQ0Y3OGJ3aUVpUUsrUW5I?=
 =?utf-8?B?TlFyWE5GVmR5YXd4N1I0M1FCeDBUWWlzNHhZbWdYaElsaldCR3NvdkZYRlo4?=
 =?utf-8?B?Ulh1WVQwOXAzL2RhVlJLR0VqY2ZyZmFROU9nbk56cGE0US9aeldTYUw5YlhN?=
 =?utf-8?B?bHV2c2RGWHRlVlhNL2lOd1NFalNxY0dianB3SHB6NVVhc25GV3o0WHRua0Zo?=
 =?utf-8?B?M05XbmhtS0MwTmd2K3kvdmhFSEFWTUtUM1NpNXhpUkZtOXovNFVWRjh6TFQr?=
 =?utf-8?B?bzNkeWIwTDQ3cjRVVFdlY29UVm5EcVQ0NGJ6L2xVWko5K29LRmk2Sm85NDg4?=
 =?utf-8?B?RW54NzBqYi9hejVJaitzSUhBWWdTOWtNTVV6U1ZDdU5nTDRsdEE5ZklCQkJP?=
 =?utf-8?B?QU9xaUQ4Z3NkRTBDc0NLUUpmVXh6K0kvSzU1YjhscitCR0pIR3dpTnRPRjdX?=
 =?utf-8?B?ditOSzlyM0R2bGRWN1dYVittNFNLMTdzUlRqVVREQ1M5Z0xCTkx0cnJITkZj?=
 =?utf-8?B?NWw1RU91S09RYnhhYTFQMkk4cjQyZWh5ajNFNzB1VW5KemNUK1A3M2R3MUZi?=
 =?utf-8?B?T1FmYkp5RWtPeVhVbWhmZHg1MkNKamZaMzU0TzVtdFIxL255ZjQzeE13dTJD?=
 =?utf-8?B?STJicjRRN2tDR3hCc2tHTjhoc2ZPSUJjOVJmNjJxRG5PbkpGemdWdzVJSGF6?=
 =?utf-8?B?SmNnZEJVOStSQVNwR1dTV3Y0UFlzazk1Q0xKM0szZjBobUowVDRUNFpsS2s5?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b90e5b7-51fe-4503-826b-08ddb3fb5f99
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:17:17.9357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7xNCFIJCGy5bVcz3DuGzCnbuNK8hJAaUAc2R7eSpZW4EmkRyvvQbQPPm4kQe6FJWKQmbTXbC3QldOWMp0lBNwEoXkELZIrMbVqS+dr74xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-cze-24 22:09:20 +0200]:
> We plan to add more PF and VF types and mixing them in a single
> file is not desired.  Move them out to new dedicated files.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h   |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h | 29 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_types.h    | 36 --------------------------
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h | 27 +++++++++++++++++++
>  4 files changed, 58 insertions(+), 36 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 962acd451734..64a7e4c52a11 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -21,7 +21,9 @@
>  #include "xe_platform_types.h"
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
> +#include "xe_sriov_pf_types.h"
>  #include "xe_sriov_types.h"
> +#include "xe_sriov_vf_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> new file mode 100644
> index 000000000000..918dc089eb1d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_TYPES_H_
> +#define _XE_SRIOV_PF_TYPES_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_device_pf - Xe PF related data
> + *
> + * The data in this structure is valid only if driver is running in the
> + * @XE_SRIOV_MODE_PF mode.
> + */
> +struct xe_device_pf {
> +	/** @device_total_vfs: Maximum number of VFs supported by the device. */
> +	u16 device_total_vfs;
> +
> +	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
> +	u16 driver_max_vfs;
> +
> +	/** @master_lock: protects all VFs configurations across GTs */
> +	struct mutex master_lock;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index ca94382a721e..1a138108d139 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -7,9 +7,6 @@
>  #define _XE_SRIOV_TYPES_H_
>  
>  #include <linux/build_bug.h>
> -#include <linux/mutex.h>
> -#include <linux/types.h>
> -#include <linux/workqueue_types.h>
>  
>  /**
>   * VFID - Virtual Function Identifier
> @@ -40,37 +37,4 @@ enum xe_sriov_mode {
>  };
>  static_assert(XE_SRIOV_MODE_NONE);
>  
> -/**
> - * struct xe_device_pf - Xe PF related data
> - *
> - * The data in this structure is valid only if driver is running in the
> - * @XE_SRIOV_MODE_PF mode.
> - */
> -struct xe_device_pf {
> -	/** @device_total_vfs: Maximum number of VFs supported by the device. */
> -	u16 device_total_vfs;
> -
> -	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
> -	u16 driver_max_vfs;
> -
> -	/** @master_lock: protects all VFs configurations across GTs */
> -	struct mutex master_lock;
> -};
> -
> -/**
> - * struct xe_device_vf - Xe Virtual Function related data
> - *
> - * The data in this structure is valid only if driver is running in the
> - * @XE_SRIOV_MODE_VF mode.
> - */
> -struct xe_device_vf {
> -	/** @migration: VF Migration state data */
> -	struct {
> -		/** @migration.worker: VF migration recovery worker */
> -		struct work_struct worker;
> -		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> -		unsigned long gt_flags;
> -	} migration;
> -};
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> new file mode 100644
> index 000000000000..55c2421d4b2e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_TYPES_H_
> +#define _XE_SRIOV_VF_TYPES_H_
> +
> +#include <linux/workqueue_types.h>
> +
> +/**
> + * struct xe_device_vf - Xe Virtual Function related data
> + *
> + * The data in this structure is valid only if driver is running in the
> + * @XE_SRIOV_MODE_VF mode.
> + */
> +struct xe_device_vf {
> +	/** @migration: VF Migration state data */
> +	struct {
> +		/** @migration.worker: VF migration recovery worker */
> +		struct work_struct worker;
> +		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> +		unsigned long gt_flags;
> +	} migration;
> +};
> +
> +#endif

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
