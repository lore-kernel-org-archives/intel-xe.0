Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A528FC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5676E10E107;
	Tue,  5 Aug 2025 23:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="majde94Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7910E107
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754435687; x=1785971687;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hepeY+sgwlfAa01ocMXu2C+HOACU7Z4K9liBUZ48sA0=;
 b=majde94YLd11zgwwdyPNPQ/4WthLdcRROG5GX3y3d+WRFaHjHbgze2ml
 MDEY4xnr3GAMosr6dUF/I1h0qfpIiZT17xsCXhomA/e3qZYI83TFAs5Sm
 LDBdRdABlCUvAkid8TvyXzI6DmCCYWUlvfNEI61nW8z5jnF/4pU2gE5CI
 becG2bM1t76sMnnPxaewOhF5Sb8fUYP/QcpPd0BWjOG9mO4034f8i8Ojw
 4GGk7P8Gr5BnKuID1NbXBfHVwLUJ3RwdloL0QGZgpM00Yo4Kl1eRIT29x
 AJFcLlttxCyWfH8sNv1nGt6VqYRcNlegnPMsxFe3Uair7DRDsrHnvbilB g==;
X-CSE-ConnectionGUID: z1Rxs/z3QDSZto3ECZ4IYQ==
X-CSE-MsgGUID: dCLW0Z1dTcO9WF4qWIsO4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="55782057"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="55782057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:14:47 -0700
X-CSE-ConnectionGUID: GrAJtXu3Q/ahbJb/QY1zdw==
X-CSE-MsgGUID: CV62ZdjCSbaD1KSWMejy2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="168789539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:14:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 16:14:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 16:14:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 16:14:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/EIzM7B2DvDGIkI+WKVzTtSMsapprIc7a3h9PSLbrdYyTN5tXfVBSp4ULpHN6qQQRb3Er973JxWIsjTpbivS87IyGFFhpDBD+Nb/5O5kNVLgns5er3de/J9pzK1gpPUnIf/lh5JV3sdOw9aZJvpdgJDA6AI1dp9IdXEGtx9ONn/6OwIi+9A+iP5wodgZbTc2KQDGJlQ0TkOFY1aWFCzGfVFVmi/SLgUXSXBaQ7y1+IkPJtKrikzw8R3pzRiIAzL8Pl75bIE/8Ytve0nud29ZmFcxhCBbTY2HSElITDn2G5FyhBKWLHZDyMF3UqHo592erNhfFB3/9t3k4XBz68ZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlpeKDXQUv6ir8azLTeZ4VslczKJJF+HP/TfvkYX8Fs=;
 b=lNYqnbFkhcckoyhnQwZe9vfA55/NrVq++T+txcyQlLr5EQpdFHOMRQzjvBfgfe8IyLrcNZ54dpflfGxXpHH+dnyMaHjyjmRnHfCQr9eiWu1ZDvIPIicQ/08w9B7oIsJAScbjX86GI5E0+dNp6zg8yXahpeTzYUD6m7nVe5ChFNp3TOFRc2KH0n7H1hd3Qw7XHDg90Ok0asfewNjM4qKdDrMHP8gg0dqICqyTwIVE0fyaIh30b7M7pivW3ABvPXzOheEShqJOZH59l5Bi5ZRrMTxFaXzmC149IEdevaS1G0YjKIqMKbfCEPmpeULZg08iOMdsYqhltRQD5Wkw7papng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Tue, 5 Aug
 2025 23:14:28 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 23:14:28 +0000
Message-ID: <aee53da8-cb7b-4b24-8d5b-e702872b372d@intel.com>
Date: Tue, 5 Aug 2025 16:14:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/11] drm/xe/configfs: Check if device was
 preconfigured
To: Lucas De Marchi <lucas.demarchi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250731193339.179829-1-michal.wajdeczko@intel.com>
 <20250731193339.179829-10-michal.wajdeczko@intel.com>
 <2etfvrw5naiwpragohjcoyywilmhqgdvvfsnniqkxgjitkv7e5@dgynxcaowgjj>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2etfvrw5naiwpragohjcoyywilmhqgdvvfsnniqkxgjitkv7e5@dgynxcaowgjj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|MW4PR11MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 60090240-b7fa-4ecd-9272-08ddd475d352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzBvV1ZEa3FOWXg3cWhUWThJV3crMFZFV3ZBRlU2RTgrN2RKaGJCb1FNbVVw?=
 =?utf-8?B?aHZiV2podXdndWVIMTlhZW1QK1pmQmlHL1VtcnMwdU11TlhHTEZHTldCTVJB?=
 =?utf-8?B?MlhTS3VaZWw0dzViOEUzSDhIRkpVT3BEL3h1cjhSQzBJT3JuTUdSWHRvR2xI?=
 =?utf-8?B?RDNQQkFDc1JWUVVzY2ExSDJ1VVZXRGVHdUdCM3dkWG56V1U1SURFcktmMW11?=
 =?utf-8?B?YUJBS3dDMERDUXR1UHppYVF5V3R6TnRCTThOQ0FoWTluQ3lzTXRwY1FLK1Bu?=
 =?utf-8?B?RWxJOURQb2xNajNUYWpOTXZERWpub3BtS1MrYlB3MEpGZTAwTzhHMnJIZFVN?=
 =?utf-8?B?MVVWemtQMFlhN0Z3TDh3WkFtZ1RlKzMwWnRvQllTUTFDV2N2K25RdWRGckNY?=
 =?utf-8?B?blNOSTY2UVV3Ty9IdE9wU2FLTHpqOXlHN2pCQlpVeHJjZVJmcVFuQnBNaW9G?=
 =?utf-8?B?Q3VGUTNXU2Z1K1VLM1Y2c0FmSENjWDBZZnM5UzA0K3dYVVVhSmxsYVVHYW1x?=
 =?utf-8?B?RVhVVHROYUJNWEN1eVNBdDRzZVpCVXAyQVExRkoxWDRSbGtzSUJpOU1FbTJ6?=
 =?utf-8?B?ekFWTFZBZG10MldmZnRQN2ppaG9hK01FRDNRSUdnQWFodkQ1YVR0Sjl3THVa?=
 =?utf-8?B?ZGkveEFhNnJVWWh3b0RCcUtiYUllNmVDcEFka2k1cGdKK1pOV0wxbExhMm9T?=
 =?utf-8?B?WEd1ZjJhdWhxK1pQL1YzY3NDNkJGZ2pDVXJIWUR0VnJTUlpSdDZxdmFEOUlo?=
 =?utf-8?B?b0tUM2NLQmJkc1JZKzRiWldUWHluRXcxTzUrUTY1T1I1WmdNbHpKRWFlTlA3?=
 =?utf-8?B?SnAxalVtZk5UZlBPRlJVZHpUS2ZTTER4blN1UUtYdVV3VktNZWpKOEdtSThQ?=
 =?utf-8?B?Ny8yUExlV0MwN0RyZXFrK0MxWi8zV3M5NXpIL29lVEsvUTBqZmxuWmRneXh2?=
 =?utf-8?B?UnR0K1BvZUNGWU9LZnhCeGJ1KzlFU3BxWXB4MXpRM2dkekNQaU1JN2paVmE0?=
 =?utf-8?B?b01uemU0UFR4dXJ3VlFQUXdtN2p2b2Zqc3Y5Sk5LS2djNDVRQ0J4bDJzMzVk?=
 =?utf-8?B?amovalNsSHIyMzZKclZLWHlRemZMWmsyV2lIWFlpN3luc1JOamdXMCtxU29I?=
 =?utf-8?B?UmMzL1F3OFRDVkpkRk1iZGN0OG85V2hOZ3ZwRlk1aFBsT0czOW0wSDUrQ0po?=
 =?utf-8?B?YnlCNkIwYUNLeTdpa1ZpSlBGN0JmbldQOTIxTFlrTjhuekZ3QmUzbjhaV003?=
 =?utf-8?B?Q2RVZURrUkk2cDgxMXRENTFwUDJPTk1ibTFXQXoyQVVNNGkwb0Y2L1UrVzNM?=
 =?utf-8?B?TUlSS1NyY083b1R4Wjl4RzZlMUdPYmc3aWJ1WWIydHNXM3JCc2lwQ2M4dkoy?=
 =?utf-8?B?YXYwdGhHWHpyK0xlaC93Y3NzQkxxa1hqakU2STk0RHB3QTNFbEdhSE9RaEZs?=
 =?utf-8?B?dGIvNEFFWWJ5dVJBRjg5Sk1Cc3FKZktjRlRDRStkUGtaa1lRNGxPcllUc0xa?=
 =?utf-8?B?OEFWRHYzdlg4aC80UjJrcUx3RjJlRlU3RnBjVVlESkQ4a2ExYU1CWHZ5S2sx?=
 =?utf-8?B?NXBGcVVRM1NZMmVwTitvZUVDaVZmOEo1dFArWlB2UU1PeXQ5SS93eDJSOFR1?=
 =?utf-8?B?TnF5dmQwM096cTExRWU2UEs3UE12QWpmZWFTMGVQb1JuY1F0cVVGMUNnR20x?=
 =?utf-8?B?dHVRWTM5eFZTUm1RU2ZJRkRiRks4U1k4Sng2NFhHbjVvekFyMm0zcDNPRFhX?=
 =?utf-8?B?aTFBQjhTOS9TS0NSQ05sVWdLeG9MMXFTbWdRU09pY0pIb0gyZWtOa2RvbHZM?=
 =?utf-8?B?S1pBRFJDV05vbm8vcGhYb05Dd3V3ZjIza3p1ekQzV0hPUy91WkZ3b3l0NUlU?=
 =?utf-8?B?U3JHdXFjWVpNb0dmMkc3K1UwUUVXWDdjRWsvd3hHTG5ib0RXYzdaU21pYjY0?=
 =?utf-8?Q?cDtr5xxhBsw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0FDT2VacDB4UngzQW1tRlc2cGo2THFaWFFhNDNmWWlOL3BuRWM4WHliZ2ZE?=
 =?utf-8?B?aC9neFphOUZTVVJrRkNNQ2RPdEVPcW5yUlZtdjdpZUFqTU5KRCtjWmJFMlFq?=
 =?utf-8?B?OHQ1VEZ0QTlrT1ZBNnZlNFBESXFJSDFHZW5VdUdYRit6dVdydHhQRGZ5SEFj?=
 =?utf-8?B?WEk5V0dnWnJnNnBqZjZCVnh5Rmd0OUhqNmthUXBEYUwxWUtNZENBTDRORmY4?=
 =?utf-8?B?L2UvTmptdEJyOExPRkRPbGFudW9WamR4ZFpHSm5qaFl0V3pqNW5yQVhkQkk3?=
 =?utf-8?B?amlDRkRYVjhtaUtlTmU3NURRMTFZdlNheHI3MFN1dit6UkFFT2dHNzBBMEZG?=
 =?utf-8?B?UHBieGdQKzBUY1lkMGVKQUsvRW9GNHZldE9RYWhJSEFCblJrSTJzSkZLcmZa?=
 =?utf-8?B?Ym9UR1puTUx6WmcvUS9VdGF2QU9nUmNKeWlVbVk2TFFGNUczMVBmNkpDTGFx?=
 =?utf-8?B?U01EVFoxNDRscDU4WWluZmlGZlNlQWpxaGdCUC9tUDhoRWI0QTVqdm0rVDk3?=
 =?utf-8?B?WHFyNTlSd2tFMDRtZWtBTTZRR2Y1SDExNmxCVmtmbzlTYUJqK1UrL2ZEOGhR?=
 =?utf-8?B?WkNuQW5iWnhlSVpndGFSMGE5UlhJZ1JqU0pIT2l0ZGpjNEhFZFJxek16RHZH?=
 =?utf-8?B?dG9NK1NUc3pBSW9DYmNKcTQzeXljcGJSM1g3NElsNG9JdE5hQzBTRTFJQ0tz?=
 =?utf-8?B?V2o2bExrM1laT29WZzFoM05OQlp3UmdkRUtmZ3p3elJsczJGVGtFNG93WUJK?=
 =?utf-8?B?N3hUM0NUaHFkTGd4MUplTjhaMEZGTEZBZ1NzK3B4Ri93MWw2SHVyQkJKZnMv?=
 =?utf-8?B?aHBvNWoxNHk0ajVScTZwWHB4OWNiSWZ1VVdaVm9IM01QNUV0RUV2MmNLcnBX?=
 =?utf-8?B?aDQzazdWaGtpNFBRZnN2ZXhXQXFtRmVIRVlFb21OUkpWazd3VjIzMitEOEV4?=
 =?utf-8?B?NmNydGZMa0UxdDZUS0hOY0d5TVpWZFd3K0JmRVlDbTZacUNxNkRoQ3gvb2Y0?=
 =?utf-8?B?SHVsY2cxd1ZnUURRVSt5OUIzZjgxc002OVpmaElCQkpxVURZRGl5aEQ4Znpr?=
 =?utf-8?B?WlpoSTV3emg5NnkrTjc5V1VKakFEeGRLK05HRnlGQ0p1WDVRSzJGWlZvaWdl?=
 =?utf-8?B?b09oVnBRV3U4RjdkeG5QSWk5cUY4bmw2VitZMFdsbEptdEhKeG1tZWxUWHJQ?=
 =?utf-8?B?VzJOVTI5UGMrejVLWnhVQlp4SVRka2ZUT055YWF6V0FtM0lBa2RBZ243Z1Ry?=
 =?utf-8?B?ZllHSCt4WGs1eXRNMmIrek9HdlIveXhGU0xFSFBBL0kxSHdDYVNRTUZiMXdv?=
 =?utf-8?B?UUZpc3hqck9ZZkJuRzJaWkVqamdSZWQraCtrTjE1RHU0UGFZMjRrT3FBTVAw?=
 =?utf-8?B?NjBXRk9wRWwyWGF6UEczN1MxMGhhZGMvS01sYlpZOS9aamRmcStpZm5qUWFS?=
 =?utf-8?B?Qjk3cHJCKzJKNGhDV3pjNVBSUklCSW5mN1JQSm9kRHRZQlRBTVFweXFkYWRP?=
 =?utf-8?B?WEN0cElRVzd6bUYydlBndlgyZEtvZS9BU1kvdzVxTnpueVZxSEJSTmdVSC82?=
 =?utf-8?B?cUEza1NnYm5GY3l3Mm93Ym16RUR6cXNpLzBHQ1Q0NUJiSzBLTC9JbFY3aGFz?=
 =?utf-8?B?MTdmR0hMaXozYkRSeE9VS0lROWdBUUpiWXlBMGpZUm9ldjMzeG5SMURZMVly?=
 =?utf-8?B?cmdrcFl2eUJ2TXN5eXppT0ZySGZGUytvQkltdldyNjVHNlN5M3I5NGsxZmdy?=
 =?utf-8?B?elF0dHhiOHdySmdXWHhhMCtCcnN2dy8rTUQ0dHJ4MEpUUHhSRlk5V0xlWmZG?=
 =?utf-8?B?cldEWXp2a1pwM0QvQW1qbTROVU42SHNkZkljUXVnNG0yN0V2WUdaNXNlbUkv?=
 =?utf-8?B?K2xQcTdLdlNBaEhmWmtxRTliZnFSeDV3L0FlTjREa0UvQzR4TVI4cUJ2Umpj?=
 =?utf-8?B?NEtSREtvaU9YVTdZTG9BSFVMRXpkQnlYSlBPWEcwem9QYkcva1ZQUFBtNkFB?=
 =?utf-8?B?cUM4MlFPQjZjSys3eGhmWnZralVYcll6K1ltYVlZZU5ZQ0Z0c0lSamFCQnE0?=
 =?utf-8?B?TGUvMUVvdFBIN25jem4xZTZKUlZtQmN0L2tVZDdlYnprNHhoZTBBSG14NGJP?=
 =?utf-8?B?clUxNXJ6VGRaSkM0RDhseUgwZEkwQTFRd2JFc29tNkRWY0FyWWdySXVCVmRy?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60090240-b7fa-4ecd-9272-08ddd475d352
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 23:14:27.9835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEtTkQ4QjOe07kwqrlcxUjpN+OmSflGmV3xgL19baF0+iPKQzPtAFpBwQaENI8LF9CFiZOa/QMiaZsGaKrA5FNh5zaZSW/7yu5NJZnYagn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
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

On 8/5/2025 12:30 PM, Lucas De Marchi wrote:
> On Thu, Jul 31, 2025 at 09:33:37PM +0200, Michal Wajdeczko wrote:
>> Since device configuration using configfs could be prepared long
>> time prior the driver load, add a debug log whether the current
>> device driver probe is using custom or default settings.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>> v2: make function void, rename helpers (Lucas) and rebased
>> ---
>> drivers/gpu/drm/xe/xe_configfs.c | 25 +++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_configfs.h |  2 ++
>> drivers/gpu/drm/xe/xe_pci.c      |  3 +++
>> 3 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c 
>> b/drivers/gpu/drm/xe/xe_configfs.c
>> index 150e7f2becc8..5f145ccdf535 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -107,6 +107,11 @@ static void set_device_defaults(struct 
>> xe_config_device *config)
>>     *config = device_defaults;
>> }
>>
>> +static bool config_device_is_default(const struct xe_config_device 
>> *config)
>
> this isn't exactly safe and as such shouldn't be a helper that can be
> misused.
>
> $ pahole -C xe_config_device 
> /p2/build-drm-xe-next/drivers/gpu/drm/xe/xe.o
> struct xe_config_device {
>         bool                       survivability_mode;   /* 0     1 */
>
>         /* XXX 7 bytes hole, try to pack */
>
>         u64                        engines_allowed;      /* 8     8 */
>
>         /* size: 16, cachelines: 1, members: 2 */
>         /* sum members: 9, holes: 1, sum holes: 7 */
>         /* last cacheline: 16 bytes */
> };
>
On i915 at least, the rule for the module parameter structure was to 
keep all bools at the end. Would that fix the issue here? If the 
structure is full size integers first, then bool/char values at the end 
then there would be no holes and no issues with uninitialised data?

John.

>> +{
>> +    return !memcmp(config, &device_defaults, sizeof(*config));
>> +}
>> +
>> struct engine_info {
>>     const char *cls;
>>     u64 mask;
>> @@ -339,6 +344,26 @@ static struct xe_config_group_device 
>> *find_xe_config_group_device(struct pci_dev
>>     return to_xe_config_group_device(item);
>> }
>>
>> +/**
>> + * xe_configfs_check_device() - Test if device was configured by 
>> configfs
>> + * @pdev: the &pci_dev device to test
>> + *
>> + * Try to find the configfs group that belongs to the specified pci 
>> device
>> + * and print a diagnostic message if found.
>> + */
>> +void xe_configfs_check_device(struct pci_dev *pdev)
>> +{
>> +    struct xe_config_group_device *dev = 
>> find_xe_config_group_device(pdev);
>> +
>> +    if (!dev)
>> +        return;
>> +
>> +    pci_dbg(pdev, "found %s settings in configfs\n",
>> +        config_device_is_default(&dev->config) ? "default" : "custom");
>
> I guess comparing dev->config and device_defaults is safe because both
> will zero-initialize the hole (or padding if we had one): the former is
> allocated via kzalloc() and the latter has static storage.
>
> I'd just remove the helper and do the memcmp explicitly in this
> function.
>
> Lucas De Marchi
>
>> +
>> +    config_group_put(&dev->group);
>> +}
>> +
>> /**
>>  * xe_configfs_get_survivability_mode - get configfs survivability 
>> mode attribute
>>  * @pdev: pci device
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h 
>> b/drivers/gpu/drm/xe/xe_configfs.h
>> index fb8764008089..fa4ea7f0c375 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -13,12 +13,14 @@ struct pci_dev;
>> #if IS_ENABLED(CONFIG_CONFIGFS_FS)
>> int xe_configfs_init(void);
>> void xe_configfs_exit(void);
>> +void xe_configfs_check_device(struct pci_dev *pdev);
>> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>> #else
>> static inline int xe_configfs_init(void) { return 0; }
>> static inline void xe_configfs_exit(void) { }
>> +static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>> static inline bool xe_configfs_get_survivability_mode(struct pci_dev 
>> *pdev) { return false; }
>> static inline void xe_configfs_clear_survivability_mode(struct 
>> pci_dev *pdev) { }
>> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev 
>> *pdev) { return U64_MAX; }
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 52d46c66ae1e..9ce6e6dca5bc 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -17,6 +17,7 @@
>>
>> #include "display/xe_display.h"
>> #include "regs/xe_gt_regs.h"
>> +#include "xe_configfs.h"
>> #include "xe_device.h"
>> #include "xe_drv.h"
>> #include "xe_gt.h"
>> @@ -771,6 +772,8 @@ static int xe_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *ent)
>>     struct xe_device *xe;
>>     int err;
>>
>> +    xe_configfs_check_device(pdev);
>> +
>>     if (desc->require_force_probe && !id_forced(pdev->device)) {
>>         dev_info(&pdev->dev,
>>              "Your graphics device %04x is not officially supported\n"
>> -- 
>> 2.47.1
>>

