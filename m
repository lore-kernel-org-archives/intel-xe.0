Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F61D4335D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 22:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55B310E304;
	Thu, 11 Dec 2025 22:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2CGbPX9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0088710E304
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 22:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765493089; x=1797029089;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=m+iOqm1yYA4SoXPzzX+DOiiQbk1sCjJ9+u6/6Q0ADoA=;
 b=g2CGbPX93W6uVqNB3Mf/cGreKhUZu2n0Ffl5TjjGdJj+n/RkhTwATPWF
 07J71dB2K78fun1t/+CITduJexuSddEpuWylar0x66PuCkh49qW0BY4Fy
 UnVai54P5WXd6argK5yVY5RtAX5LZ9+OjQXxA6UcY5BWk4orV6fVAQdez
 jezfLujSn2GULOdq3Z4TVC9QV5+7+vHQtWhEcekbiFihenfj3gJM3aY2u
 AdQKV3nQtOwEn+9bJJBvPOEyKrHPfshW2W2rSp9aheN24UMcIEJUnn0TN
 Nosd2MQ7xQtPu0/qy93pvzesIKibdIzMZvfl2UX1oVAOVlhvs0XET64g1 w==;
X-CSE-ConnectionGUID: HRif8pY2QxWyc9NiOR8Diw==
X-CSE-MsgGUID: NU+/7BkZQhGtV4fBRd5qbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78852822"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78852822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:44:48 -0800
X-CSE-ConnectionGUID: +da8fPizQGuZadng3N4dGQ==
X-CSE-MsgGUID: 9h63D7gmQsusmunjCxLRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196972952"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 14:44:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:44:47 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 14:44:47 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 14:44:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZDmtgzEavsMA8by4PgOwkZHv+eAUEormQSb9rbqs3e03qu6v+AKr728OUW6Y3gfuPXhCxtZt8vhok3Z/C8U/nKBlCkn2dvS8fKqjX051EshrJUYC32MLAov1r1+fOizByy5jAwdYLmxuT3gowna9ZRY/HjO04AUSKDqjsH+A3rcRJqEXhcO58+3heZepmPTg/GW5w9XcnUQ+aGNVwbtDiarKRqe7beaeMk/cNYvSQCaYul6R3Tv+sWQsVO2LlNYuRSg4HJK03uq3yiM1zEY37tHeiDwlM9ZF6aV7A5yNlzuVT0WjMLxRU+ExamQq70+ZlkZQ0ihZ+UHs4YDcNuG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzkjratVZxFpBs8IIoNhz06WJJXdelyLT/NTcAiBeMs=;
 b=lg5Yhw+uDoF1b/4RijAilw/cT+Rp5ZkdEH7N6K1mZKjB7r2Y+8I13cwK99OYThuUoCNNdQN4bydNd8gjkMolfjz3W6H3LNPGbKqnkoza++CH3wq+6xG3xYGtAoLoh23aLTZHZzEy2zSCvF7O+24Bdw80sb9AVxZF5AgBqyEXaAPSkgTsczDLM/1twPUyBspjn95HwldqFoFFrcYbk+RZ3smerJvoWSF7W+7fHQInQ8I8xSDURTRiZJPdE2ODGm5Ps2HHlce4wsPOgNJMkc8lM4rcTcEUOFRRyESRODTqRm10Hx8W1UGAzjHARMx8zttogNtJ/2ktvF3oz7JzIEjIJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 22:44:45 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 22:44:45 +0000
Message-ID: <07bbf5db-e171-40a3-83c4-12ab031b8854@intel.com>
Date: Thu, 11 Dec 2025 14:44:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] drm/xe/sriov: Add debugfs with scheduler groups
 information
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
 <20251211015700.34266-22-daniele.ceraolospurio@intel.com>
 <fb7cd4b8-f5a6-4fc2-b58b-5460cd23e8ae@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <fb7cd4b8-f5a6-4fc2-b58b-5460cd23e8ae@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ0PR11MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 25fbab50-d1d2-41d7-f05d-08de3906e151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnhXVkZMUkd4RUs1N1ZzeUtRellZb3BkS3hsNUlZbG1HK2RKYTd5MkU3ankz?=
 =?utf-8?B?OGNmaXRhQzJHdWpPR2YyUTFZWWtYbEdzTmVYZTQra0wrZnZFbGI1V1FVRkFO?=
 =?utf-8?B?VnFKSlhUZ2dGVG5qTVJyM2dKZW1wcEdVUkk5WnV3LzdlY1NnMllhVDI2ZFY4?=
 =?utf-8?B?Y0RCaFBUVFNzdDRVbnpsLzdYVmlScnBYZkttN1Z1UkFaNnFqMHppdVZ1cUlk?=
 =?utf-8?B?VExWeTlMRmZRVGRXUC9mdG96RVFZdTBMdmFDRVFsNlpWMkw1c2EvRGRUa0Jv?=
 =?utf-8?B?Vm55STR0MlU3WHAxWWJHQzJRYitpeXNYa205VlFkQkdtYmZGRDhWaWZHRVNM?=
 =?utf-8?B?eTBIbnNHQUNHd0FGS3VmeG16ei9IUDNVUWtYbmEydm5GU1g2eDZ0UU1XRVAz?=
 =?utf-8?B?Rm5EaGV4TUVjcmNpOHhFU29McU5HaE0vOFI4M256MVhsdGNrTVQ4Vm9XLzhD?=
 =?utf-8?B?N3FQbFUzZHVpb1dQVHFidWM5b250ODcrZDJLRGUxOGZPeEdVbWtqUjdvamV2?=
 =?utf-8?B?ZnE2cUx1RTFQTjdRcUZndTVESlZHWXdvTEdSaUtSTUVlQW0xTEtaTDBlQm45?=
 =?utf-8?B?ZHI2cDEydUZFemxRRTFqdCtybER4QVFienNaZzJCM1d2L1I5QklRbGwwVGR5?=
 =?utf-8?B?OWlQMXF0cFZSVkdtL0Vna1BwWERaYlo4MElTamtkOHQ5Mm50TmNKcS9jcFRZ?=
 =?utf-8?B?MlBuaEVuVFpJLzFlR1NLVWhnZDZpRk5QYXo5WDFTQmN5enNZZXFqRlQ2SkpG?=
 =?utf-8?B?aWFobXh5eDQzR2h2a21BRFRzYlBuUVRDNHZCazFjR2JNblZQOUF2TEVueDVs?=
 =?utf-8?B?a1lUT0J3QkpyOGV0ZmtHNzJxNVZZbVZ2T1B1bzNsT0tTazUyajluTWhKRWMx?=
 =?utf-8?B?QjcyWFNCS29FMmxYY214aHhaS2pxYU9RT1pURzRQa0FmL2pqOGVqekhCdDJp?=
 =?utf-8?B?K0pKK3lFWVhPbjJsVHN5c1VzaDdNeEVPNTlHMkdCV09WajU1OWVRdFdQVGtU?=
 =?utf-8?B?d0t3ejcrWEdjVVRwanV5cTcvZjlIdjY3YWJXUE01Yk5iQzFlaVg4ZElUb2Iz?=
 =?utf-8?B?VWtOVjZGNDQraFRRYk03YW9BTUNlR2NRalVBQlorR3dwRUhjN0pvcXdjY2N5?=
 =?utf-8?B?dlQ1UFBpb3NHYWF3UEtRMjk4TlhUUEk2cHI2bWNXRUZxalljZlh5RUdOQ3NC?=
 =?utf-8?B?cnJuZS85NG5HcmJRd0NhR2RUdjVuQ28xdkhzQ0twODdPVGVOdFpIQ3ltNlRJ?=
 =?utf-8?B?anRPem1nTS9XbXJoeVRjTEdqN1BFU2xybVE4ZXRtbk9DODFBRzBjbE4wWnlE?=
 =?utf-8?B?c1RMdldTNzJYV2k0Z1VGWG9XU05EVnJwNWRFS0RJUDRmQ0dBTkhsS24zaGtp?=
 =?utf-8?B?YmtscUtzMFFlTVVOZ09FeUZndVNET0E5djlET3RzdDFQZVUyOHQvR0hsVmVE?=
 =?utf-8?B?cjl5UDVmTWZQYmtGMDdDb0NNaXdrdEUvYWI3SlhOTDQ5RWZMT0VVd2FWY2d4?=
 =?utf-8?B?dTdwejRWOWxNOUxHM0lnMkI3ZWhRdTZKc0FmNkRONlpaWU4reUpLZUFVcC9N?=
 =?utf-8?B?cUJOOTM0OFU0QnhBZ1VOSm1Rc2RmbTR0Mi9Db095US9sN0o2c2QxWDh3YmU0?=
 =?utf-8?B?WjFWMzVJY2ZWM1B2ZnRqbTl6THZSTDJrWmNvWU5yTS9jYnBWbmxoYlRSMFVq?=
 =?utf-8?B?YzRmRGlhMEVjcjN3Q0wyTmFZbmFiNlNxUWdkb1VIZXRDWHg0N2tnbGlhd3Ja?=
 =?utf-8?B?aWRESkZiWHhXakIyYXRWazMycndYV1ozK3pWSnJDSE8rUHl5clF3ajAvT254?=
 =?utf-8?B?ZksxTWJ1S1NOZVJWRXpvQUFlV1NMVnBFOUp2bkd1OEFGVnhmQ210cHBYMGZw?=
 =?utf-8?B?ai94Z1UxMEdDc0lzVWd6WTgwR3ErQk9GdDcwSExNZDQ2cXNEbXBXbnhjd3lN?=
 =?utf-8?Q?0jAT91mrDAeSVdv2NiOifpumVXbu9YVi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkJjKzVRbEdxaFcwQ2hqajNoekx0S1Yrc1pCWkdLSGxPSkpBaDRxZUhmbGVj?=
 =?utf-8?B?OEVLVnJEb29pejdhQ2RpSS9TbTZXdXFlZU5FNyt0VSt2ZHYvMmd3L2RYV1RC?=
 =?utf-8?B?VTcwVDlhdGUxejdBcjkrRjBMN09IblRaQ0xEbVRvQ0pyYWcvS1BJNFhMV0Nm?=
 =?utf-8?B?VHdRU0tWbGZXVDV4UFNCMklyOHRVRXphZTBhR0p3VytmbFhFOXR2SUJpakEv?=
 =?utf-8?B?WWZMUTY2d1lGVHRoZDNQcjY4WkQ4MWswTXNROG55WTRGeFM4TmZvanU2eGhL?=
 =?utf-8?B?QTU0ZmlPdW1JbFFZelluViswbmZFSUsvVDF2a2Z1aUVtVjdzZXU4Nmo2SjJ4?=
 =?utf-8?B?SzlIaVRzREtnd3hlRUxtWkRsYUpJNkQ4Qjd2b1RNTVE2N3JMR3RYYU5GT0U3?=
 =?utf-8?B?ak1nTEtwcnRuaitsYnpsYzQ2cndZakM5Z1h1MnRpZXk0M092WXFza2h0amNh?=
 =?utf-8?B?bUdORk0rYkExUjdrWkdIaGhrZURPd2hRV0JxZ0NPT0JZTTIvS1ZnYVQzRlRp?=
 =?utf-8?B?dUpIUDlSbWNGMTNrN1M3VEZNWDNVVDFTYlFhQkt4OXZyRnhBbFRNU2pMQUdh?=
 =?utf-8?B?VlY4czkwc0s5RjJSUWZhMThKZ1VFSmkvc0ozYmpCbkJpM2FUWDhJRHRzNFVH?=
 =?utf-8?B?OXZZdm8xWnY2YkRRNm1RaUx4MzJzNGhyT0hkTDlwM0dwUjVJblcxN3ZDM3di?=
 =?utf-8?B?b2lqNmZkeVJ0UjB4TDJjUkZnMVdHOFRSMm5JY2Znc2RpdmdNSkppMXFzQjBh?=
 =?utf-8?B?R21jdlF3c0gwYmhadTNITlhuMWZ6UHJDTndIOFRMeTZ3blZqcGhrM3Bwb2dv?=
 =?utf-8?B?NHYxdEhDcG9wQVlCT24xTkU0VjA0aFYrdUY5WjBGTU1FN2VCaU1uR1lJWjla?=
 =?utf-8?B?OW9SQjlHOEhqSVF1OWFZMUFKdDQrdVAzUzRuanI2QS91aDlQWDFTVnJhNHU5?=
 =?utf-8?B?aHpxUHNuWHA5aVJucFRPWERXV0QvbkE4M29PTmFsa1lyelIyeWxMNXlub1ZS?=
 =?utf-8?B?VWlPWkNKWTc4Uk1EREdxaEZoTHRQOXZuSk1MS0IwTHhHREJ0c3UwTFRwTDFZ?=
 =?utf-8?B?Z21Uc05BcFRYaEFmb0V3UHhMTTdjQ2orbjdOWTdXU29NR2gxU3pBKzJBbGFq?=
 =?utf-8?B?Uk91Ui9DZGN3dW5NQzFQWTVZR0h4VisyRGE0UDRtNis2NFgwUW5OWWV0MitU?=
 =?utf-8?B?eGJmWGduejNmVTc0UG5yUTFpQ0hub3JTOFNtTHNNWDNva2Rna0VFVC9jZUMw?=
 =?utf-8?B?UTlxNXc5ZTY4dGorY2RnT25KMGMzYXoxd3JaRU56RlJRMmpDVlgzODg1aWVz?=
 =?utf-8?B?MktYSlVuLzNyWWU5ajFWNnRUcVBScDdTb1VwWm5oeDhILzQzSk85WVVVTktr?=
 =?utf-8?B?dndkSzVPMm1xQk5rRVNuSXBySUUzMGtpSS9rTWdXc293WHF3LzhkaHhLUit5?=
 =?utf-8?B?MS82bitrYUZucHBORHY3TFkxdzNQSk50UEtVbU1MKzJYd2x6bGQzeXlWdmhL?=
 =?utf-8?B?d3ZsOXJjQklBbm5jUzNUZy9PbUUxRnc1UnRqR0w3c1F6L2M3WGFoRlhqWWFk?=
 =?utf-8?B?UHZPbG1WaUpSa2tZYmFCSHp2SnV6Zkl6c3piZ0xabG5CUHNZdCtHcVdwTk5Z?=
 =?utf-8?B?N1Y0OGZkWGRlWm54d1EvbXI0Z1o5Skc1NXM2UFkwaVozZWVqdE9ybGhkSlRk?=
 =?utf-8?B?NHVBLzBFMDhCTVRFNk9mdVBBUHUvcWhWOVZxTEkrV20reUs4R0FmRVNkNWZq?=
 =?utf-8?B?QUNmcHZiNklwZU9jRXZMeVZ5Nk01OTc1NlcwYzdXTXN3QVBpbFhZQmcvL2pE?=
 =?utf-8?B?b1pyZlhsMXRsMUFwRVpaVnk0SW9XdnRSeHQwNGJqNGw2VEs2aXVwTTV6TmI0?=
 =?utf-8?B?alo2dk45eVE0MmZBYWxVUjI2WHd6Z20yR25iN0FESTNObUVMWG5xaVNWWE03?=
 =?utf-8?B?YitFdnkrWWthVDY5WndIK1JURlo0bjI2WTl5Q1kwNnMwZW50U240OGRlQmNa?=
 =?utf-8?B?Z2Q3ZU0zZFlRV2xkUWpneHB3dlZsMFFidjU1cU9TbmFpWDgweC9YcFppY3RD?=
 =?utf-8?B?bjl1dDVYTTNTbElWcERYc2dYVDhqamRDeElneTd1L0NjNjJLVzdWTTJCQjlk?=
 =?utf-8?B?ampvZmZIaE53Z29BanVWR292REhXRDFNM2M3bVhiaW9TalBVTDdSZ1JDV3Nw?=
 =?utf-8?Q?BpBWSLyAUcj5hMVpH1ecpe8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fbab50-d1d2-41d7-f05d-08de3906e151
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:44:44.9946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Go8r1ij32Ewwh5BNlsTFsenZW1DMaadJDLz+78HuJQydimvkaxnH3E8QdwORAybGf8lsohGhjOWrPg4NXXKKPHUm5t8yfA8NKFLlfhSPao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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



On 12/11/2025 2:40 PM, Michal Wajdeczko wrote:
> this is PF only patch, so
>
> 	drm/xe/pf:
>
> On 12/11/2025 2:57 AM, Daniele Ceraolo Spurio wrote:
>> Under a new subfolder, an entry is created for each group to list the
>> engines assigned to them. We create enough entries for each possible
>> group, with the disabled groups just returning an empty list.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---> v2: drop subfolders, always register debugfs for all groups (Michal)
>> v3: store the group id as uintptr_t (Michal)
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 66 +++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 8ac5e0e01e36..c09a89c69fad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -163,6 +163,10 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>>    *          :   ├── tile0
>>    *              :   ├── gt0
>>    *                  :   ├── sched_groups_mode
>> + *                      ├── sched_groups
>> + *                      :   ├── group0
>> + *                          :
>> + *                          └── groupN
>>    */
>>   
>>   static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
>> @@ -254,8 +258,56 @@ static const struct file_operations sched_groups_fops = {
>>   	.release = single_release,
>>   };
>>   
>> +static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
>> +					size_t count, loff_t *ppos)
>> +{
>> +	struct dentry *dent = file_dentry(file);
>> +	struct xe_gt *gt = extract_gt(dent->d_parent->d_parent);
>> +	struct xe_gt_sriov_scheduler_groups *info = &gt->sriov.pf.policy.guc.sched_groups;
>> +	struct guc_sched_group *groups = info->modes[info->current_mode].groups;
>> +	u32 num_groups = info->modes[info->current_mode].num_groups;
>> +	unsigned int group = (uintptr_t)extract_priv(dent);
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +	char engines[128];
>> +
>> +	engines[0] = '\0';
>> +
>> +	/* If there are no groups it means that all the engines are in group 0 */
> nit: this comment is more related to the 'else' below
>
>> +	if (group < num_groups) {
>> +		for_each_hw_engine(hwe, gt, id) {
>> +			u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
>> +			u32 mask = groups[group].engines[guc_class];
>> +
>> +			if (mask & BIT(hwe->logical_instance)) {
>> +				strlcat(engines, hwe->name, sizeof(engines));
>> +				strlcat(engines, " ", sizeof(engines));
>> +			}
>> +		}
>> +		strlcat(engines, "\n", sizeof(engines));
>> +	} else if (group == 0) {
> I'm still not convinced that we should list all engines in group0,
> even if this is what GuC uses internally, as from the ABI POV,
> and from the data you have in your groups structs,
> this group is still unpopulated, and mode says it is 'disabled'
>
> IMO on debugfs we should rather focus on exposing data we maintain in the driver,
> without going into detail how firmware implementation might use it

I'd prefer to keep this, because the sched_group ET/PT settings still 
work even if we're in disabled mode and the behavior for those is that 
all engines are considered part of group 0. Unless you'd prefer me to 
block access to those debugfs files if we're in disabled mode?

Daniele

>
> so with this "default" group0 removed and nits fixed,
>
> 	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
>> +		for_each_hw_engine(hwe, gt, id) {
>> +			strlcat(engines, hwe->name, sizeof(engines));
>> +			strlcat(engines, " ", sizeof(engines));
>> +		}
>> +		strlcat(engines, "\n", sizeof(engines));
>> +	}
>> +
>> +	return simple_read_from_buffer(buf, count, ppos, engines, strlen(engines));
>> +}
>> +
>> +static const struct file_operations sched_group_engines_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = simple_open,
>> +	.read = sched_group_engines_read,
>> +	.llseek = default_llseek,
>> +};
>> +
>>   static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>>   {
>> +	struct dentry *groups;
>> +	u8 group;
>> +
>>   	xe_gt_assert(gt, gt == extract_gt(parent));
>>   	xe_gt_assert(gt, PFID == extract_vfid(parent));
>>   
>> @@ -268,11 +320,25 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
>>   	 * We should rework the flow so that debugfs is registered after the
>>   	 * policy init, so that we check if there are valid groups before
>>   	 * adding the debugfs files.
>> +	 * Similarly, instead of using GUC_MAX_SCHED_GROUPS we could use
>> +	 * gt->sriov.pf.policy.guc.sched_groups.max_number_of_groups.
>>   	 */
>>   	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
>>   		return;
>>   
>>   	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
>> +
>> +	groups = debugfs_create_dir("sched_groups", parent);
>> +	if (IS_ERR(groups))
>> +		return;
>> +
>> +	for (group = 0; group < GUC_MAX_SCHED_GROUPS; group++) {
>> +		char name[10];
>> +
>> +		snprintf(name, sizeof(name), "group%u", group);
>> +		debugfs_create_file(name, 0644, groups, (void *)(uintptr_t)group,
>> +				    &sched_group_engines_fops);
>> +	}
>>   }
>>   
>>   /*

