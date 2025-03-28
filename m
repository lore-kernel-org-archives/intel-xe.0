Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08436C36010
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 07:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE7410E997;
	Fri, 28 Mar 2025 07:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSpsbpox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677110E997
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743148361; x=1774684361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gZSuNav1odsUxw7v4hL98iJD/nNBIRv7z8Tl5Dr3Fdc=;
 b=nSpsbpoxHHABMtR+Z/cVLdgtiZpRWtE91o/EHhYb6wZOw45yY+O3vFk0
 ORrT/4ADewh73/91GsWX4ze3X8gTL/DD14wENvHPZdoEy5GiMLF2glPd5
 qi265xV7FkWzGmi85Bfo/eikyDl5aZL/3uUyaR1bdxZUW7qOYA/cSnNj9
 ex32OC70VYrkk51g3LG26fkneR4BUtUM1hv4ifKa0R4KUJw/iloXr5T5M
 /io+yQtOdh75fLMW2J2/2QiNO//iX7eCbadbeUz08Lh2P763vX7CI2JFT
 5NyH5ymnAwb80/xVOwGRVrjeVA093nLWSRNIC2ZkluuwhZyZGD9wJxNM/ g==;
X-CSE-ConnectionGUID: H9rrf3w5Tu2pwj6HbADgEg==
X-CSE-MsgGUID: enRqQXUPQBaLYH1/F0IKQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69866696"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="69866696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 00:52:39 -0700
X-CSE-ConnectionGUID: 9MgH2VJRQK+TSfGx7a/v1Q==
X-CSE-MsgGUID: crFmfj/eSauBUwWr1czFOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="156309676"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2025 00:52:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Mar 2025 00:52:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 00:52:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 00:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5Rk1SVtOUa9FYk6X6/OYIUOh9be01NJPFRU3Kinz3Cug9q6x8vnZILdvHk6OTrln5aEY5WM1FnslQ7C+MQtt6/b+84InPyfZqpsM8HaBRZ0mv8BWojz/WGEYthpSx4K5Di7FGlecVwRVWOpNQ2PpASVF58p6ZE+pMY5Xuxq+g5ws+a14mURNcZmF3YkoHlVRaFf5OdNx6o3eXhCNumOnxt+qXKOWIOVg51pQeM3HxgHHjiVdiaocpTRw5ZciaDEtvPCd3SikZb3bF6fDkWHW9Pq8JycxzC8rVT/Pi0iGDIEbI1ibgrZj0wcfMkPCmAvjZ6bqrygnhJf5eXhYJSU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6JPM5Xp8ODif2K1mFIw0SaJfd0Pe+T9lnPgNuvQfFU=;
 b=WKWACRkxXh2kE8c/wzRGK6uLQBKZ3ksBqLawkXybkiAb0hT5psVzgkLaSjYJiNOPs/jScZ5r/M5qhqyus3HprvXpb5taPJ+iZO25vXDBKq/XLfSWIIMTlML6vB+KcMBsQLcO4zG0KpgRoyDAhfpYu9WpJcGhGpHD+4goFB/m5+0owzkoQqCslhtU5CkrpJ1JOgQd4/Gq9MEceWjpGlHH3CGSvW1LmmECxwbJod/GH5q+tDWZFwR8RG+Lt3vaB+2dgqUzjdCnE1iF4TTcG7c3Bt0qkXDoCQSMEI7zjxHCWtXQoOIcCdTq4fpYp9pxSFIcRlLut/YO1B2achSLMSs8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM3PPF99D0888FA.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 07:52:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 07:52:36 +0000
Message-ID: <a7a89e28-da3c-4555-ae25-b4d8ac36e8c3@intel.com>
Date: Fri, 28 Mar 2025 13:22:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/29] drm/xe/vm: Update xe_vma_ops_incr_pt_update_ops to
 take an increment value
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <oak.zeng@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
 <20250314080226.2059819-7-himal.prasad.ghimiray@intel.com>
 <Z+YP1WAm4SwyD3xy@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z+YP1WAm4SwyD3xy@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM3PPF99D0888FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e1ae5ef-d5a1-40f9-7904-08dd6dcd8121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWl3V1crQUVSWDhRNUwzS0k3dDlWTE9rcmZmM1NVa1ZaOGxzWGRlVDZDd2hC?=
 =?utf-8?B?SWJyaExxUFJGcWcrNEdKNHlrc2ZBVmc5YW5ZemIyTktGOHhMWDdFTC9mVlRk?=
 =?utf-8?B?VDgwaHUvWGdUcW8yRm43Q3JyTGtNQ0hvZ2xYTmQybFk2YktDY0V1TW0vWDE0?=
 =?utf-8?B?V3lXRzB5T3hjWU1lL2phRy8yOEhnaGYyaG1IRW01SXcyeTJFdjRlcm8rMGNP?=
 =?utf-8?B?K2Q2NXE2eDQ5L09Wc25yenBNTWdiK0ZwSklzbEhPSVdjdERNaVZtdVNDaU4y?=
 =?utf-8?B?SjRYejV1Rkc0Nkc2OGZ0bEFkNHJUZWpjdk9KdEh5SUpXMlMvajNvb2xUMnds?=
 =?utf-8?B?d1lSUlc3OEJITFUwNHQzTXdEcUdNRDRTa2lvVHptNi9iM1haenNidHZZS0lS?=
 =?utf-8?B?M0lvVE9iRzI2WDN1NmJxV2lLMU1vNG9xZmloWmxlTXk2NnZFVDg3bEdDTVFN?=
 =?utf-8?B?Sk5SSWpjVWdkdENoUjY5Wk1HbzAwdFRYVEpKVmh0cys3ZUNrYTFYYTVPcEJl?=
 =?utf-8?B?dk9tRXlpV1djN3g0RS9Hd2x6Ti9Dc3B3UmI4R0EyNXVuM1llT01wVWZyZmRT?=
 =?utf-8?B?cWk2cHp0UEpPUWc5cW11dStaaGxiSlZjMERPRjVlbmZMKzREVmtzaGV6YnNo?=
 =?utf-8?B?SnhIZHptOUcvNUEraXFZVTJpR2lpbk16cEJFT1AxcjEwMVVEd2liYkZRMjJN?=
 =?utf-8?B?YkVJcUI3WWZZSXM2RDVDRmhHdWhjdFVqR1hBcXFSUFBLY3FZZUFDS3FwVm9a?=
 =?utf-8?B?cFdDQnlzWVc1WFl0T3l0TGtlS2t2Q090N05pR1VROXZFYkU1S01jdnZ4b3RN?=
 =?utf-8?B?ZUp5UHV5eVcvaFFWbldOYUlOa2gvcStzemh5RDhKTzhxYXFpckFHZHNETzVX?=
 =?utf-8?B?TXpSR1VMai9DVWQrMmFuZFQwVDZobWdXUWI2N0wzWkJXTDFJTGJZV0VPNkds?=
 =?utf-8?B?RXJXczlERG83M2J3RlZJTjRtMmpvUXNRQlR3ajQrT1RNcGxLVk91UVNIM0F1?=
 =?utf-8?B?bmhjYWc3SDNudDBYZ0FlMS90a2FCN1prSmhjZ1J0WUl2OGN1SGRLZy91dFdz?=
 =?utf-8?B?TlpsMkRucTJsRWpCZ0JVQVZndHloRjc0L25aYitiWjFHM0NDY3VoL0xkcDR1?=
 =?utf-8?B?aU03QnlocVM1WjJaRDBidndNZUxYT3ZqV2tnRXpNQkFiTy9YRnlkbG13Rlg3?=
 =?utf-8?B?UjNPSUJhVmFVbDdLcVliZGVyUHJudWFRVGdWdG83eStUcG9hZXRISjYyMzRV?=
 =?utf-8?B?aE9UWmlaNVNGUkdVeXMwMW9HTWVtbmRET2pRZlJVSzBHVmtQRmwrcmFPb3dN?=
 =?utf-8?B?VXczcnBYMDNmSEJ6RmFoWm5IWk05cmZCYytuYTg1NG0xSkEramJncldWbFRq?=
 =?utf-8?B?WmIzU2t0cTROZUN4WWNheVMyL2lPVUZkZEU3Q084Ry9hdURkaHk4YmRCOEpS?=
 =?utf-8?B?V0lPb2ZVMVZUUUwzWnlONUdUSStza1NXN0lRWW52d2lPK1Z2dVJkY1Aya0pu?=
 =?utf-8?B?Tno1Wlg1dWpJUThPNHR6VTl5a2taaEdXZHlJdkRMYXUrSlZCSWpCM01nSXY3?=
 =?utf-8?B?aVN4WFZIUVQyak1JOTZLRW02YzhmQytJbWlGMER2QWJYbm9FM1hpVnRENnNS?=
 =?utf-8?B?NGhGZ1ZybFJ3aWp3dGZQUmV1WDlQUHhNc1paRkJYOWhKUmZyV0p2b0FWUHFE?=
 =?utf-8?B?TFJXdDJ0eVlZbFJXRlVwRGZWQjNhZ1pwZk5xQ2VQNnFBTUhUYWVIbEtaUUxp?=
 =?utf-8?B?WDhxMUh0aUhMU1ZxUCtmc1dDc0xJUHRxZGRXTmZzM09DUVZTdWo0clFIZk5Z?=
 =?utf-8?B?TUVvNnd1Y1ZzVEhodmdRSWlmTk1xTjU4UVdmMGpMblBqc21NKzNBenYwSzdi?=
 =?utf-8?Q?ZSyuuGNKbPbTi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVRrdzErZzFiRjBKTlJUM1VvcnI3aTJHVmdoaWIrL1lkd3VmTndwcFBuQ3FN?=
 =?utf-8?B?OU00NDRtMTJLbWhmbFovOWdPZFNmbHdkR243Tk1wdFdEcmxOd01IWGRNQ1RT?=
 =?utf-8?B?Vm5xWVp1clJmb2E4ZFJoMlR6VThKL3JqcmtYSmtYOXVRM3ZNeDZRdldPdERG?=
 =?utf-8?B?WndrTVVuWHQxaGUxbzgrVmxUREJRcVZuS21uSHo3Vk9qN2puOUlWci9YYzhK?=
 =?utf-8?B?cnhPeEYzWFZqY1VDVEd0Rm1lMVZ5bXk3NU5HaklxYWJ4dEFGYXVBakJWMUhr?=
 =?utf-8?B?RVhybHN6Zm1tSUVpUlVNVGsrWGd5QzN2ckpQM1lUbjJ4cG0vSXlTZ0VVYjdX?=
 =?utf-8?B?RWVmMjVOdTErazBMaVRmcDR6amU5VncvdHZEQWhuVVhFN0pNbU1tTVRLbFBz?=
 =?utf-8?B?dGJzWkIxNFVtYmJxU2x2cnpxK1ZlcmdYaXhaaWQ2WllneHZQMHNWa0gzUHNR?=
 =?utf-8?B?Mmk1cFh5YWZhMUxKKzhtMzF1aFdVUTc4WlhVWGg0OFF4NnBuSUNRWTJDZU1I?=
 =?utf-8?B?ajFQNW5ycXdybE5vY1FzZHozcElSVTRBaFVYdWJ5aWtzNEdjOTNmQ3BHWTBu?=
 =?utf-8?B?eGlyaHB3eDdqVkhFUUlERlAxdjVGQ1VOMm9PK3g0U0RKWThXbXVodE1vdEpQ?=
 =?utf-8?B?M203T0NiVXJ0Ti9DMkZDZ0ZVc2pYQkxKd0lnTHMxUmtHSVNTZGhnR240bmJQ?=
 =?utf-8?B?MlVzY2dYWlJPZW1sVHYxUE1sa0hLZWdkWmJrU1E2UFBUd1l2bkcySHVTM2Jh?=
 =?utf-8?B?VFRUWVN2UHc1N0hOZVhUU1hqTVhuVFhrUUZLOENvSGRGK0ExQjRZeTlNQ2lE?=
 =?utf-8?B?SVM3dm9PVHc0c3FBcVJhNHV6ZWNGZ201RDkyY25uREgyZmhxR1RNUkhBR2Nq?=
 =?utf-8?B?WmNFMlVlc0xKTWg4TzB1bFBpZ1BmY3I3VGxtVVEyOUpOaGRyTDNzMnova0dy?=
 =?utf-8?B?MWN3b2tzWEJaVkhlem9RakhFMjY2U2RaQy8wMzdUMnYrcmovNHB3UTZhbW1u?=
 =?utf-8?B?Q1BvMUdaaG9LUGJMYzM0Tk9TQzVoRDc4M0lSd2NJTlVlOStGNDQvUHJTQUpC?=
 =?utf-8?B?d2hBcUEwQmQ2NDdTMTEzai9hSDl6b3hIODFUcmVwUzNTaTkyeVYyb29iSGRr?=
 =?utf-8?B?NEQ5aVVRblMzZXBOT3pPTU80djl2RmhnQi9YTGI5RDRJTXNocmNHTTJ4OGxM?=
 =?utf-8?B?UHBUdzRWYzJuNDZEZFpFRS9CYU96YzF3UU13czhhZG9hQlhzeWtEL056T3M3?=
 =?utf-8?B?N1BUTzVwSVRzTktZZ2JqRENIYW5BTmVzM2ZhOTF2Q0h0eDdOa01iOXVBUHFE?=
 =?utf-8?B?cGNMQWhObitMcWFYaFMyVXR3amNFVm5tNDBDdDA4WGdLZlZsQXc5aWI1eEs4?=
 =?utf-8?B?STF6Z3hSR2l0aVFNUkI1ekRuRXhmSTFSUjBNRzlxR0IzR0VDRDRGT0VwRG50?=
 =?utf-8?B?ZEZ6N0M3d25idlAxWk83MTUwSmNoV0pZT0UyVnZ4WDBwSWdYYW95enNxZldB?=
 =?utf-8?B?SFZlOE9kQUdDODlnakJYQmlTUkNoQUlYaXBxVjZKaG9rYjdKNlVMZ2ZjUmIy?=
 =?utf-8?B?eTh0anNHWkpKdGpzSjVMeElkOEgwZlhUNkwrQ0N3dXRmZk0yalhJTkhYSmlS?=
 =?utf-8?B?aGUwdkoxZ3pKZmJLdFV4eUREaGE0NGRPTnhYUllCcUNDanBtRThrOXU1VkIx?=
 =?utf-8?B?WU5ZRkU5dlFRNFRPYXViYXNDZnFYdk9HZGQ1Q0lLMi9pUW1jMDJoRnR5NjBr?=
 =?utf-8?B?ZUxSalIzK3F6NjJtYzhpZWZTMzNzQW12dldRZGNzbVVFckdPb3o4U1VScGQ5?=
 =?utf-8?B?cG5oYSt0Nmp1SGtyTml2Rk84dWswcGg0VnVWNzVuaWpXdXVOY0lFVFZTL3Vp?=
 =?utf-8?B?a000aUpSMnVIMGwwT2d0QXA1SXRhTTRaRVZMT0ZnVTcxNTRpeG54QTM0U2hs?=
 =?utf-8?B?SXg5WXU4ZjNhU3RKRXlBdVlNTEM3UDNNSitUbThlamlnS0VLeXJxU0IxT0Jq?=
 =?utf-8?B?K2R2b3lGVk1TTGZBbEo5MEhSUXlGN3RRaUVyN3VzQ3UrZFpZUjFPUHdTUFpG?=
 =?utf-8?B?c2p3N0FxQkRqV256aFRMMDZGQTVyVVdyMm1wSVlFVVVPNHExcEMyN2FlY1Z6?=
 =?utf-8?B?RHVwcHRYTjBIdy9yR1BMYkpFS2s0a0lrQjhkRXNvek9Ib2NMeksxVmE5Um4r?=
 =?utf-8?Q?q9Pn3Gh8UKzo25Aj9SSkYPc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e1ae5ef-d5a1-40f9-7904-08dd6dcd8121
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 07:52:36.1374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAWlEjcDrS4jDAKRyPsV/VaULyRgJ66gzwdhF6RFCzbonnTvGHDwACA33Il9LkR4Hj2EEuJGtS3oxyDZr9CznBpjlha+kkIZpABzIUB9j14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF99D0888FA
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



On 28-03-2025 08:26, Matthew Brost wrote:
> On Fri, Mar 14, 2025 at 01:32:03PM +0530, Himal Prasad Ghimiray wrote:
>> Prefetch for SVM ranges can have more than one operation to increment,
>> hence modify the function to accept an increment value as input.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 60303998bd61..53a80c0af8de 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -806,13 +806,13 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>>   		kfree(vops->pt_update_ops[i].ops);
>>   }
>>   
>> -static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
>> +static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, u8 inc_val)
>>   {
>>   	int i;
>>   
>>   	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>>   		if (BIT(i) & tile_mask)
>> -			++vops->pt_update_ops[i].num_ops;
>> +			vops->pt_update_ops[i].num_ops += inc_val;
>>   }
>>   
>>   static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
>> @@ -842,7 +842,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
>>   
>>   	xe_vm_populate_rebind(op, vma, tile_mask);
>>   	list_add_tail(&op->link, &vops->list);
>> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
>> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>>   
>>   	return 0;
>>   }
>> @@ -977,7 +977,7 @@ xe_vm_ops_add_range_rebind(struct xe_vma_ops *vops,
>>   
>>   	xe_vm_populate_range_rebind(op, vma, range, tile_mask);
>>   	list_add_tail(&op->link, &vops->list);
>> -	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
>> +	xe_vma_ops_incr_pt_update_ops(vops, tile_mask, 1);
>>   
>>   	return 0;
>>   }
>> @@ -1062,7 +1062,7 @@ xe_vm_ops_add_range_unbind(struct xe_vma_ops *vops,
>>   
>>   	xe_vm_populate_range_unbind(op, range);
>>   	list_add_tail(&op->link, &vops->list);
>> -	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present);
>> +	xe_vma_ops_incr_pt_update_ops(vops, range->tile_present, 1);
>>   
>>   	return 0;
>>   }
>> @@ -2475,7 +2475,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   			if ((op->map.immediate || !xe_vm_in_fault_mode(vm)) &&
>>   			    !op->map.is_cpu_addr_mirror)
>>   				xe_vma_ops_incr_pt_update_ops(vops,
>> -							      op->tile_mask);
>> +							      op->tile_mask, 1);
>>   			break;
>>   		}
>>   		case DRM_GPUVA_OP_REMAP:
>> @@ -2536,7 +2536,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   					       (ULL)op->remap.start,
>>   					       (ULL)op->remap.range);
>>   				} else {
>> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>>   				}
>>   			}
>>   
>> @@ -2565,11 +2565,11 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   					       (ULL)op->remap.start,
>>   					       (ULL)op->remap.range);
>>   				} else {
>> -					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>>   				}
>>   			}
>>   			if (!skip)
>> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
> 
> Maybe update the code here (REMAP case) to call
> xe_vma_ops_incr_pt_update_ops once. I feel like that would be a bit
> cleaner and use the new interface correctly.
> 
> Matt

Makes sense, will update in next version. Thanks

> 
>>   			break;
>>   		}
>>   		case DRM_GPUVA_OP_UNMAP:
>> @@ -2581,7 +2581,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   				return -EBUSY;
>>   
>>   			if (!xe_vma_is_cpu_addr_mirror(vma))
>> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>>   			break;
>>   		case DRM_GPUVA_OP_PREFETCH:
>>   			vma = gpuva_to_vma(op->base.prefetch.va);
>> @@ -2593,7 +2593,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   			}
>>   
>>   			if (!xe_vma_is_cpu_addr_mirror(vma))
>> -				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>>   			break;
>>   		default:
>>   			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>> -- 
>> 2.34.1
>>

