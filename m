Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BAFCAC58E
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762DD10E4CC;
	Tue, 17 Sep 2024 17:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEixUs/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C9B10E4CC
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726592591; x=1758128591;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=NKI3g7Rg1nejHHyHFUq9GumxiyZByxTcW6L3j3TYUKg=;
 b=jEixUs/IFTTWPywZH4drsHo9O/jgub+aXP7pgumZZT4amKIAywfxvbDY
 1sNYgwH03QogdJnCuUDLk4wpZwHsKwoTfCyyYXd3jain0kZ8u2+HFoCek
 G9JBDeXnqYTWJChfbTtzDpukI85hckdqRdi+kdQIA0FcMiDqrjqdmGcrR
 //GFvEOHpsTEf0v1bWC+ts0xmJlXbGVSgXc9RqzMHBJdDA+OW04XxmyMB
 23Glz+OWSyUbjmCQmX3G1IkUfzUzXPqTr9jRsaX2PiXPUEa7Gj6Yi5Z0L
 c6l3quMttURhcsB2Nz7gtO+BGn7fl8KmPpjpyGAZVW57BRcNj5hYULy+1 w==;
X-CSE-ConnectionGUID: ej+0F60FR1uRnLzu8dWWig==
X-CSE-MsgGUID: mNJd4w1pQ9elqG/RD71X4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36047824"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36047824"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:02:48 -0700
X-CSE-ConnectionGUID: 30jSb2a6TiyM28M37WLOKA==
X-CSE-MsgGUID: 5OOr3N+SQMmCx/6wptpRZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69575803"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 10:02:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 10:02:47 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 10:02:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 10:02:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 10:02:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdCRZ48EDP9WkcNn8sS4B7Af8xTgDJgVl9x1Wlxcf1VLFCpKwQ67gD6g864/j/hoX2pOWjtoJLTftgu+mtMkcqUHBhs8VuNkx+V+dA/jiKMu9exSUWa3i0WHcrtR+/+/OV55TPCb7YlcMh/wbJTyCdiPpU+fZ4phchNw+OrzyZZeB53217mUT8jHRqUOf4K3LOPMOtjXOO8ZjkPndaxr0vph4t2lcKfTC57tDTDatTt0hsqk/XAuCNRKfyiExtTnSlNPrYyhxwdQqag7uhsfMsLtg2duLLLUP8BqM2cLj406XsEU9fKX9T1M2BfCxzmOq/oAHmHaxgwn3xmYFAUezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXyOGoI0prxpkGz2dhuw071Pkc5PccxQNAb6t2y+pU4=;
 b=V/CZrNvDno7/De4pq5iVKoAe/4y2aT3iUgnu5VWmAOGwE/TZCWhJOJV13xe90j0Hp4/xQZ6/ylUMeWYh1ZiRr/Yp41L8hxD3WY/iBTee1Ukq6/roKknPFrtFAvd3OxJ2Dn+zaqGWPAdA7zXI9kLg1OV5AVhootgswQQBm8MHPA7OrQIrf4Obb+k/p00eWK2VDaxzovkvoip1Bg6i8kSPePsjzQafJLQb2ARGd4YRnbESiTFqWgs357faH6Rd2iPlS6STTGWz3ik4wORu3Gw9aOrrbfGpUm3BG2ewHTSPha0KVSXQIFPfGaxPBlk+KU63WhPIV4F4egsYTsJIHhBYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Tue, 17 Sep
 2024 17:02:44 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 17:02:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240917165400.40592-1-gustavo.sousa@intel.com>
References: <20240917165400.40592-1-gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe/xe2: Extend performance tuning to media GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Date: Tue, 17 Sep 2024 14:02:38 -0300
Message-ID: <172659255821.1857.18423882338010122836@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:303:16d::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e693633-5eb8-4ae3-a58c-08dcd73a8c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2E4QnpNNTdXR2hnMFpYU2J1enp3TFhiT280OFg4ZG54S1hjUjdOSlpUTUxw?=
 =?utf-8?B?Y01NNldTVWpXRGovOVM1VmMzbHEza3Zkbmw2SUE2STNHSEI3MTVqZ2VVOVNs?=
 =?utf-8?B?c1FlTk15RVVaa0NJZjhLYzFJd0puNGtHRCs1Mkhtcmp0ZXJ6NHU4RXRQRjhU?=
 =?utf-8?B?NUJaQkczZE9DSDhtUFVtMWFGK2NObnNUanEzVnNXa2tvMWdzbWx5dHBUa3BD?=
 =?utf-8?B?dldyeURmRUE2SEpMSXZENXhtZFUzRkw4YkpkVTVJWHkvaGNPYURIYThvZ1lN?=
 =?utf-8?B?dzBXcmlDd3ZDV1UrQStlOUhYRmZvTCswRHZBOEpxQW01MVFmM1lDc2pMMXU5?=
 =?utf-8?B?MzU5L25rWFF1WERNY1o2cUNjeVRxY3pBeVBpWDFkZTFZUXZYa0liTVpDc3dJ?=
 =?utf-8?B?MXVDUFhjeTUxamlZc0I5K25FSVUvTE5GeW5xODhXSkt3cnpIeVB3T0ZYNGNL?=
 =?utf-8?B?a08yalk0d3Y1aUdYRTZKUk9pWE5BSU5rNUgyVmd2OXdMUmEvbDNBemt4ZGxV?=
 =?utf-8?B?bXQ2OC9ZbWxDVmNLcENHOGdpY3B4YzNGcnlWWjVITGFrd1BtTll2OWRGU3JR?=
 =?utf-8?B?WTFESDd2UzFHYTZYY2YwekxuUFI5NmhmU0V0WjFlcEgvRFh6VGFSMm0xdVJC?=
 =?utf-8?B?MEhkby8vVEtLVUxJQ29QM1M0Q1FycUhjRGdIM1Y1VFNReFc0bW5DUFhQT0pU?=
 =?utf-8?B?YzU3ZkdHSDNPMFJyNmNJZU42Rm80NktSVENEZzE0d1B6K2RNUlRKblgzeDJC?=
 =?utf-8?B?Q0prY25YdUplZ3FtYVhycU1XWVVzVjZTOW8yeC9qMjQwcFo5bVA1MTJOeng3?=
 =?utf-8?B?d2JhQW9wemV1WGhCVGpxZW5WdGJBSm5PNjhhZWxyQk54L2FOTkxyRHI4aHJR?=
 =?utf-8?B?VnNZTUduZjBuNzdOeFRwdmxjTmFRbEpIdjJYZHNuWlFDRGJkb3B1Sk9ZMjF1?=
 =?utf-8?B?eXNLSmpJT1R2QkRaV2p1K3Riai80UnNYZW0rTmZqSnNvZy8wQnVxUGMwZ0Fk?=
 =?utf-8?B?T0lSOUNMM1ltZndpSzR0a2c3ZDdsa3Yva3lOTkJsdEx2c3hVOTYxTGdlVWx4?=
 =?utf-8?B?K3VuanRmTGdVYUhpbEdSbXZqRGw3UHczdWYrcm1vTm5LZUhubEE4amtubXoy?=
 =?utf-8?B?aEFYR3MvdDh1TXBUN2M1VG1XYm5PZlh4TGgrQmhIQXJqSytudi80Smk3VkN5?=
 =?utf-8?B?aVBlZlhRWEw2NVRROU9CNzZjM3lEdTRZNklwZWVVWUdwTmRsYm1nWUk2ZGF5?=
 =?utf-8?B?bnlmNnhHb1ppdlQyZ2UwWTB3bk1YZmtuUmI5QXZqVUlVaElwZWRDQ3VUUFpl?=
 =?utf-8?B?NmhZczIvK2ZHVkNCbE9sUmZ2eHdwb05abmQvdnVNOS9WSXRVRUt3MmRwTXE2?=
 =?utf-8?B?aitSZ21xR1ZWRkR5cjFLNmxwWno4aDVVTVU3M2VmT0J2RDhWTmo2aE1XTFVT?=
 =?utf-8?B?aG9CZUR2c2NvNTRpcUN4RkhRYi9ROHJrUUdDSGp6djRudktzb0tLVnFOWGdY?=
 =?utf-8?B?dTFaa3YrSzA4Rmt0dHMxNmVSYlZLLytFV1FmaWV4MCtsZmJMRnhHUWIvanEv?=
 =?utf-8?B?eDlBaEN3NnpZSjdOTDVLcnEzcmxRUHB5bXBGODdyeDRRN3ZEakFOQStJQ0FM?=
 =?utf-8?B?ZzBmbmZwUzZZZW56RGhzUGFWazBSWjB3QS9LQzA2VjliemxnUGtWSGtqYUN5?=
 =?utf-8?B?RXRVdkpUb2h0bzBWdWM5NjVaRDdHQllCQ2ZwclJNZzhjMUJaVUdzWnFQcjUv?=
 =?utf-8?B?UFNNNkJpTVg0RmJSeUEzbzRwM1orRGNNMlRkeGFrM25rREI1YVdlUkFyTGZX?=
 =?utf-8?B?MGVKNVNqem9RaytJVnY4QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVVDYkdrdmF1UStqL0pmeFdpQ1k5V1M3UzRrZHlPMERSN0Jxb2lJNHBvNENV?=
 =?utf-8?B?OTF3aUZhWmdkMHlGY204c1dxd2ZBN2hyeDlSUGh0ZkJWa0syL0JKNEViSDdH?=
 =?utf-8?B?aWRWbG5hQWRuTWM5cWhnUjF0K2pxS3ZseEFMTFdNSXVhRzdsbGI0blBUY01x?=
 =?utf-8?B?aEpqUm5tYmVpTEYzOEt0OFFORFA5S3NrajZNdzdDdHQ2ZFBzdDlmbEZoMWMz?=
 =?utf-8?B?eHFuWlZuNllybHdTdDBLRm5BWnFaeHZJYmJ5SlVQSEtpU2VVbjg5d1ZxVWNN?=
 =?utf-8?B?NFlkT21mN1lkTnVJaTVRczF1N0xrUHFRL1Y1a1NpMGVpakNzdVNLU1lNVTNQ?=
 =?utf-8?B?ZHgyTzFjYlJzNFRwZnVEdzFKQ3EyZlZJdkVaKy9WUm1KSnlqeCswRWNKTldB?=
 =?utf-8?B?UkR1a29ERFBQQldCYVlQS0dEdkJ1djgvZXFSa1dSTWJoYTdDTER5SVI1M3ly?=
 =?utf-8?B?cXhzMFpha0s1bzdJNXVUSDJYamRhVVY0M2V3WkdBbUp6YmJwb05LSTRHK2NC?=
 =?utf-8?B?NDZGVW12R21kNUhvZEVMZnFLQVlPTkVSR3BnNFp3SnMxOVNoL29YVW1OQmZr?=
 =?utf-8?B?N1ZKV1Y0VUdLWE85eUIxQjYxOHppYVhuQzR0c3lBWG51bXdkT3JYYTZRSGtp?=
 =?utf-8?B?eURxSTd6bExBbW54d1ZtQVpSTjJxVnVXc0hTRjZYeUxGOHhIN3RZa2RrM1dh?=
 =?utf-8?B?VHVsRjNSdEpzRnBQc2hDV3lKTjRvUThMenpWNGdxaTRrTjI5M1Y4R2U1eHh4?=
 =?utf-8?B?bEJkbmJUMFJ6M21kYWlDRWdmekhTZVowT1pFblFJQ21oZUx1dzl3bFNUdVk1?=
 =?utf-8?B?L01mOUpUOU1JVm5iWENXRDlQcjJwOFRNMTh5THcvTGdDNE1CVEk5aXp3T040?=
 =?utf-8?B?Skw0NHZUR2ZlMUcwaEQzNEo2c0tKYXY4MHJhUGF3cmhFS0FHYlVYSHFGaWVr?=
 =?utf-8?B?WjZaTWxtWFRGNE4wVmxwck9LanozdUxWWE5qWCtWZE4zUWRvWWphVmZGbXBl?=
 =?utf-8?B?clJEOXkvRXJHRE1SWG9hQ0oyNTFLSjkvV0tndDl2clF0QXZBY0VnaDRIT2VH?=
 =?utf-8?B?WDR4eWpPTFhzVi9tK1htbVJ4NUdmSkp0TEkvWlRJOUFML3crUHhHRE9ibVhF?=
 =?utf-8?B?U0lEWkNOM1RDcjNJUTljTVc2VUJFNlV4bVZVdld1MmpTZUJWVDh5VkV2akJp?=
 =?utf-8?B?RmdjOXMxZUsxQUNHK3FtcEl1VUxGV1hwOTBhRVBVL2Q0cU9DMnZ3TzVDSVJh?=
 =?utf-8?B?UDh3OVphd1pZbDF1amtFc092VUxvSyszSUxPTk55MmpSd3VCWUJUa1NMbGJh?=
 =?utf-8?B?QURCMCtBeE5DUWxGZjdNd0lmOGQwVnFyMmhqejQ2cU9rRGN2UXZrbXRIZGg0?=
 =?utf-8?B?UmFCcGpCOFhIV1FVUzFEa0VEMzR1a1dBaSs0ZXVvZE9nTUE5cjJCOS9NVmtC?=
 =?utf-8?B?c0EvdFBHSnduekdRYzB4Q2RDd0oxRDNaVCtkMFd6SDQrdm9EdHFvWENYWkNq?=
 =?utf-8?B?Umg0bmI5L3ZFdUVTaFU4cTlFODhPQ0dDRzF1dmtzaXQxWHFXNXdmQ0RDbmNV?=
 =?utf-8?B?aC9QSUFpYXFYYllOSm9lSVRUakJGbkI1SEt6RVhkQklHRnVMZFVpdTFuS00r?=
 =?utf-8?B?cXBNaGdLMllOVXVoVG9RejUyQ2dJWWRHRjJpSUNRRTgrUjBnUE1pZHJ0c2tL?=
 =?utf-8?B?VStEdlhOL2svbzlwdy9BVVpSWGtVOFR4cCsvV3hvc0lhVzlJZlA4bks0MXNu?=
 =?utf-8?B?VitjU0ZKY3d5bkZWanYvYzVnT0MzWC9BUUpMdDltZkczcUE2eGRqYWVialZS?=
 =?utf-8?B?TVU5NldKTmlhWEtTMzRsSks1VDU5M1ZsZ05WVERtdTNnTzVmcFJBNzJuRDlW?=
 =?utf-8?B?Z3V6SkZzYmgwRzZIRFpNeks3MGYvbHovYWQzc1FMRmEzZ2MzWHA3OHVRTDNB?=
 =?utf-8?B?bW9uRmh1Sk5NVEhCTEIxeS9TaXNOTFJta2p4MDdmdEd6WTJsenFMRWkvNDdh?=
 =?utf-8?B?WlRtVnVEdStseDlHTm84ZDJvcW9GbXBSTVd1UEJSSUVpTUZ2ZFRxTEd2SXpy?=
 =?utf-8?B?NHhmN0p1N3lxQkJyeTNSU0lJUndCc2ppeHpha1JzVTFtMm1zNTdkZEExZUJT?=
 =?utf-8?B?dlh4dk5XUGZaVXdldjdVVk5odnRURUxCeHVhTGxJWENySkxsRERTUktvUWUx?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e693633-5eb8-4ae3-a58c-08dcd73a8c46
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 17:02:44.3840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGpT0Zyve7WZn9Xcyy0CQW/yIz1ImDhL9kaTIIHjoDNtC6uOntCmYaPVk9j4ODFVccSvgiuUVWtxv8tHXSg3Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
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

Quoting Gustavo Sousa (2024-09-17 13:53:54-03:00)
>With exception of "Tuning: L3 cache - media", we are currently applying
>recommended performance tuning settings only for the primary GT. Let's
>also apply them to the media GT when applicable.
>
>According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exist
>only in Xe2_LPM and their offsets do not match their primary GT
>counterparts. As such, we need to have Xe2_LPM-specific definitions for
>them and apply the setting only for that specific IP.
>
>Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and the
>offset on the media GT matches the one on the primary one, so we can use
>the common definition and apply the setting to both IPs.
>
>Bspec: 72161
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
> drivers/gpu/drm/xe/xe_tuning.c       | 19 +++++++++++++++++++
> 2 files changed, 25 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index cf21de3adca6..2e655291a84a 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -169,6 +169,8 @@
> #define XEHP_SLICE_COMMON_ECO_CHICKEN1                XE_REG_MCR(0x731c, =
XE_REG_OPTION_MASKED)
> #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE        REG_BIT(14)
>=20
>+#define XE2LPM_CCCHKNREG1                        XE_REG_MCR(0x82a8)
>+
> #define VF_PREEMPTION                                XE_REG(0x83a4, XE_RE=
G_OPTION_MASKED)
> #define   PREEMPTION_VERTEX_COUNT                REG_GENMASK(15, 0)
>=20
>@@ -399,6 +401,10 @@
> #define SCRATCH1LPFC                                XE_REG(0xb474)
> #define   EN_L3_RW_CCS_CACHE_FLUSH                REG_BIT(0)
>=20
>+#define XE2LPM_L3SQCREG2                        XE_REG_MCR(0xb604)
>+
>+#define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
>+
> #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
>=20
> #define XE2_TDF_CTRL                                XE_REG(0xb418)
>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning=
.c
>index faa1bf42e50e..ea1444358b4f 100644
>--- a/drivers/gpu/drm/xe/xe_tuning.c
>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>@@ -42,20 +42,39 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D {
>           XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>                          SET(CCCHKNREG1, L3CMPCTRL))
>         },
>+        { XE_RTP_NAME("Tuning: Compression Overfetch - media"),
>+          XE_RTP_RULES(MEDIA_VERSION(2000)),

+Matt

I used exact match on the media version here because that's what is
already used for "Tuning: L3 cache - media", but I wonder if we should
make it MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED),
similarly to what is done for the primary GT.

>+          XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
>+                         SET(CCCHKNREG1, L3CMPCTRL))
>+        },
>         { XE_RTP_NAME("Tuning: Enable compressible partial write overfetc=
h in L3"),
>           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UN=
DEFINED)),
>           XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>         },
>+        { XE_RTP_NAME("Tuning: Enable compressible partial write overfetc=
h in L3 - media"),
>+          XE_RTP_RULES(MEDIA_VERSION(2000)),
>+          XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>+        },
>         { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UN=
DEFINED)),
>           XE_RTP_ACTIONS(SET(L3SQCREG2,
>                              COMPMEMRD256BOVRFETCHEN))
>         },
>+        { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
>+          XE_RTP_RULES(MEDIA_VERSION(2000)),
>+          XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>+                             COMPMEMRD256BOVRFETCHEN))
>+        },
>         { XE_RTP_NAME("Tuning: Stateless compression control"),
>           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UN=
DEFINED)),
>           XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_CO=
MPRESSION_FORMAT,
>                                    REG_FIELD_PREP(UNIFIED_COMPRESSION_FOR=
MAT, 0)))
>         },
>+        { XE_RTP_NAME("Tuning: Stateless compression control - media"),
>+          XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000)),

Also in this case, where we are already using a closed interval.

--
Gustavo Sousa

>+          XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_CO=
MPRESSION_FORMAT,
>+                                   REG_FIELD_PREP(UNIFIED_COMPRESSION_FOR=
MAT, 0)))
>+        },
>         {}
> };
>=20
>--=20
>2.46.1
>
