Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34C7C5DF81
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 17:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B102110E803;
	Mon, 24 Aug 2026 17:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gd7df44H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB76410E803
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787591018; x=1819127018;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9N3a8gvHv5H+8zqcvgqTi52taRQi19buC5W9QtAMYBY=;
 b=Gd7df44HYH3qDKBa8vtmSoLn02crR3ZxMq0+Kz4+omsp1esZGvPYh/pG
 5RnLqZB5lgrAP/u2hVB2DqgAnNFDF6f23k3jgKMOUvseEalyBrVlu3pYo
 TJtNOJdslhipDnp32uA5Vq25dYBl5fSWwFVsb9AT+C8hv3s5vwBw1cEMX
 09hGEEzbVCnCV5Fh3d20o3mbJ7SIoGbwACaQOckA/UVLjmxhqrcWwTFas
 lvZf7f6g9NpgyVe9XFFks5HQl554Y3xQbZmRNh/sVNQOPzIIpjxZ4l0HO
 EwsDEHr+HIQNH10rgu9SkPDU3KHxDrTIPkJkO27GZsy/d+9PI/9+cvECs w==;
X-CSE-ConnectionGUID: +XIfBvtkSGeFbI1MVkgW8Q==
X-CSE-MsgGUID: fp50431sQ8KH7kzKT6SUuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87920809"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="87920809"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 10:03:37 -0700
X-CSE-ConnectionGUID: F0MEeWzCTzeMLhD0/yvSPg==
X-CSE-MsgGUID: B2vNYvQfRcyhS1oz5je4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="264434420"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 10:03:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 10:03:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 10:03:37 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 10:03:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7cF/kwVNSpQnNz50YLjYqpxLSmGZiYBntz0NbO1213RHP1UQRDnniUbjqPDPS4e7yTqMhYWjkrJe7vZ1Hnp0Kq1vXVULc97jgArCNjJfjIpjGHPFP8CqF+sW50Ez3QCY+gV2TsEjYOg73926/lzBTEjGbx8oyiaEjyyQt2FB0QVpdvqRKDLZ0ksO/GI3KW+4nh8LHgJQGmz2lFPAS/KefFhOjIXuKHFJs1CBPFCDXO7Y6aydw3sdqec0a2Jddf9q7hF7+yVB15npYgo1u95kSY7QYxyZpAGZm8r7dTbjaTPGqIVAJiK1K08LOF1d7W/fCFopSSIZKcbxHT6ErOjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baKxvaYsl02iupH8rlWJzpEco0YSx04i0tENrll3U5s=;
 b=gx6SKRvs8TJfBQhL94TmfzocBkpuKb03QAT6YfzaPRtE/AzY6SYpcpH2LJ9dwj0BoGlISBY19oDiLQS3RkPkdt3XMvon0LLhmm97rPO2obS6DL9n2EMfqDNdoIdfAprV98GsV+ZWftZF8Cahf6bGJiDmdeCb7MApCy9SeRP9BxRDekHjpUoQj6dRdXa+scIFU59mP8lQCgYJBmyFwvawt1lqTaQ/D6K4sFcuNjtH1FG3IiF0RQvFxKCz11VtwLVtdSVEDjy8x2PEMaUpq+XyGu7LXhVuLYlCEojtf/HG1+WGfALrVoy9Ujs+UZLeRQQs9jpV88jKfy6Rx/Z/yfIcxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 17:03:31 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 17:03:31 +0000
Message-ID: <afc09ae9-a8fd-410b-b3d5-e07a88e3ec38@intel.com>
Date: Mon, 24 Aug 2026 22:33:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/i2c: Not for review, Squash of I2C/AMC series
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
 <20260823103523.554184-5-badal.nilawar@intel.com>
 <aow4lOTbMenEkOE6@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aow4lOTbMenEkOE6@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0310.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::16) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|IA1PR11MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4f3235-4250-4b7b-18fe-08df02019ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nKjv0FZC3HFhiLusWoZJWPH04jsYwq4vFTghdVlOw9l/63a/acAXOvT5Uayzw2sBCL8FWViY2SK8+JjVR8ybFYaA/HxN6N6Qo9PUb6gRRF+9Qya6DAb08CsZNyG++ph6X7B+dFivXI+tTksulkEhuiZI8D/48hQzm77uXKGiOY0Mk/zITM0IcwC46Q5p4cXJYq34Roc2v0USuncFDKyrtm95Yl1wREqEUavooh5nz/QZUBmBobRHfTi2MlEX4wpBS9dNjmuxiLAQhYjfA9DtQ+3dEUFIh4cnltnKQcE+8baTxiU2vRlgwYcIDnMydi1S3HmJBQQSov6+RoWsUpqAMBOa7TshEBxwe//bnnK2KSHe6pEpj+d7gn/v66Rv4R31N2yj3owGXFSlPMvPu4e4UY344/NNvklbAW1W0Bop/fMVP4DAFWrObefGsoTtNsmowKQz+IaEEBpCSVpoGVXSxMGbU+jeUP6c4ukmJk3QBy2ysDTHjYYhbeaoz/vi9POandzcf/8e41V0tatLCxZziWjp38dbY5bBohWkJR8JbZTFygbQMIsWvsNUm85jKuJmyvvK802h8gPOJuCfrTAX00H+c63+mzxLQ6/KnqY3WMs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1V0d3hrUW9odUZ4Wi8zN2VDMjNGK0NHTFFtKzVNNEJpcU5hOVluUzBwMnJz?=
 =?utf-8?B?VGpFY3FZUHM1akVRMGpQOTBERnd5OEtyQktaWThQT0NEU0o0ZjZ5VmwxN1Rv?=
 =?utf-8?B?VDhiVitkQXhlbTJKTVhBRTdDQ0tKZ2RRUFN4R3JiaEZvWkxiOUVJWTZIMjIr?=
 =?utf-8?B?S0xycWZMdVJ2R1dKd3JnMTFteG1DTHYvMG5sQU13b3lYaWl5UUlVakJNZit0?=
 =?utf-8?B?amVDRXNQQ1RzaE1pRWxsZE9NQ1dsTCt6ZVNSYzEvcE9ESTV3eXBuMjNhc0R1?=
 =?utf-8?B?bUdRcHNUTWFPTTIzV1ZhV3kwMStiMkJ2WXpnK1FOVXViL0owNHZNUEVhSWk5?=
 =?utf-8?B?cmtUc2FVY3hkbEVWS1JDVmRNdUVHWXBFdG9SRXdTdURJa1RsTWFyMHdmQXBQ?=
 =?utf-8?B?NnZRRFJGcGt5WldxWnFQcmpuV1lCM0RtUDdobkdNbU5xUm9rZWdQLzlOdFlh?=
 =?utf-8?B?TUMxSEdvMmhnQ3VsNWMrSXYvaXlGMEVhZjRSU3dqVlZQYy9RZjJFVU02aG82?=
 =?utf-8?B?OVZlV0dEWXNpU1pBalRzT0RWR01hTkdEcW1wTmhrVVlMbCtacVM3UVZBU0F6?=
 =?utf-8?B?eEVDVGdPTmt2U1dkYkNFOWFFSC80NmpKeUEySnBrNWxrN0EwcktXTFJ1RDE0?=
 =?utf-8?B?ZDM2V3RvTVBpdG5XQUh5S25ZeU5sOS9ab0piRFBPNFdGMWdpYXpKd24xaHBK?=
 =?utf-8?B?MVRIZjE2TmNsZVIxeElpeWpOUnptNnkrak04TDNnd0tROTZWMnpDNVdiQXVp?=
 =?utf-8?B?Ympsd1U2N2E4c1VMcytRaTR2L09oSUl3N3FFdDZIVlU5ODNFMHJGck0vQ1hq?=
 =?utf-8?B?MFJEekNVLzF6K09qUjBiSGFISGlXV2h6T3YyTUxJMWx0WTEwUERnK095V1J0?=
 =?utf-8?B?U1hFVTExMEFtMjFaZnhHNEhESHFrU3ZzN1BqRE44cHE0R3B6SWlsZ2ZrNnQ2?=
 =?utf-8?B?WTZ3S0RPYnN2c3pRa3d3bEpVak9BZ2dEWUZIdUt3TGZtM0R0SkdaZzdSNEVR?=
 =?utf-8?B?cTMzS1BKSDJycys1ZUVxT2MwK0RJYkthdm0zZzluTDY5ZUlrckx1dVM1S3pZ?=
 =?utf-8?B?eFBsTzFBckNxcVJVa0dnL1RNZ0pkekUyQjFOaURVVjd5dGdqcUdaR3Q0QkRu?=
 =?utf-8?B?NURxcjhCbUx0NnlJUDlXMElFdUtkU2djd2p2bUtkaVlmejNNRlU5bWlvSUpx?=
 =?utf-8?B?Y0NnOXRXWmdRQ095Ty8zUFhDS0pZYjlGTmxBNHkvL3BXMi9ERkpWSnVrMGV6?=
 =?utf-8?B?Vk1CK0NBVW13b3g5bXlYS0JOMzFPNUVuSk4zY21CVUNWM1J2c1FlOUsybGJ6?=
 =?utf-8?B?bmtRWVBLMEN2d2lLMzVnWnQ4SVRjUTZteURkYnJQOU1HZGJyNkRtdVZpVFll?=
 =?utf-8?B?Y1VMbDRsTnpTckt4c1hOblgvaE5MMVVKUy96c2JPaFBhUmJ6VE5qQjZrcFR4?=
 =?utf-8?B?U3FZeDFLZ0lIRk1BQTlPVFZtMUNQcGNNRmFtQ3cxazZPK1l1ZmdXS24vamJ3?=
 =?utf-8?B?MEJXeXg4WGV6M2V1VGl1Tmp2NUo5VlgrYjRMT0tQK2xVaUF6ODFPdHVUMk95?=
 =?utf-8?B?MXlxTStMZmRvQWRCMXpJeWRDSCtPWEpieERjWHg3OVh6M091YnFqMGVueXgx?=
 =?utf-8?B?V2JjbkZIRTZ0cFI3K09wM1J0UmsrOWVnMEtQR0pVRng5ZDJWZC9TeGpjelJx?=
 =?utf-8?B?alRHL3o4SGt3dGFrVXVlNkhNTFl5cVNmSzVkYWhEQVRLTERHUHQveUZwMFJF?=
 =?utf-8?B?czRlNWUxMndPZ2FXVklCc2FIRlB0eFZLSEpEZ3VtbVNuRWNxRnB0QzYvcmM5?=
 =?utf-8?B?Mk5YZTl3RWxkZWNPa3Z6eDNPRy9xbnp1ZEt4b0lycyt2UWxDRHB6TU8zMjhC?=
 =?utf-8?B?TGpRenJVRzdDZXhzdDlWcTc1Sy9HZ1J1cTVSWW9UMG9RUU0vT243L3ZXZmJa?=
 =?utf-8?B?TDMyeU9sS3NLd2tueDZ4OFVBcVRKamg4VDhGOURMWFE3ZEREUldzdC9IN01x?=
 =?utf-8?B?VWd4OU5wSzVLamdhRzNLTEhoLzh3b0RUNFhIaHBGOWhBRy91bU5OeFBNQTlt?=
 =?utf-8?B?ZXY1NG9uQ0lOM2NDdUEycUQwa200bnpXbStnWXB6U000Z01mV3pKZ3FVSUtm?=
 =?utf-8?B?Sk83a0VBVzh2aTh2dGN6My83eHdJdkVKNCtlOXpZckJrU1hQVWJRYWpGWlhl?=
 =?utf-8?B?eFZWQ1E0VVZZMFhFQ1JOM3Q4aTQ4RFo1bk5pNUhDODdMOFFGMnhqSUtFbjVN?=
 =?utf-8?B?dlJ3RjR6TG1CVnQ4QjVGbk0wMFY3Wi80a1E0eFRtZ3hsQ2sxWHg4Q1dBNmox?=
 =?utf-8?B?enplbG0rVTExM2RqaDQzWmdvTUNCd0h2cWkrVU43aDRnbHJpaW01UT09?=
X-Exchange-RoutingPolicyChecked: rDW6Koxd4jFWZKhQf35kDInRr4vxSJ7EoLkaQeRdXSZgiSCARd5UnTsuBDlkRU/+Ok5oE7U+YGBYwYs5Yfpr4TVnDgaSUe/PaKNMjx6w6i6U2bqh6B7nUF5py27Q02Ws/nUnv5n1FiXwg5DCJMrkD92IZJt7cOkGqy84kr9OrxuOTC0aJMjspcuBXVhJ9WeTGp1kXLuio40UH4UXVxXTlLkigf4u7jCBtW+vAWvsPqVKLd4O+RYxwadhf4bX7EChUmDWDp6HTiJBeVfwiGfpqJTj/ESHuo5EzpGibFHjN5bAI6Md1sMnCI3XNBW11V+zRIoTlZqkxEiTPJOE33nbhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4f3235-4250-4b7b-18fe-08df02019ff0
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 17:03:31.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8rWcDLhuexwjdgml/CFZxKyQqPxuRCVQaE4CHbgU/lFbFt8Eb9K/tURGst+BeCeT2/Vb8gJQa6v5g5RJl+UvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
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


On 24-08-2026 17:57, Heikki Krogerus wrote:
> On Sun, Aug 23, 2026 at 04:05:25PM +0530, Badal Nilawar wrote:
>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> This patch is not from me.
>
>> Squash of https://patchwork.freedesktop.org/series/168930/
> Why? What are you trying to achieve with this patch??????
To unblock the development I squashed your patches and built patch 2 on 
the top of it.
>
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Do not use my signature!
>
> It does not matter that the code originates from me - you can express
> that in a different way in the commit message. You don't use other
> peoples' signature even if the patch was intended for development
> purposes only.

Sure, understood. I did not think it was appropriate to change the 
authorship, so I kept the original authorship intact and explicitly 
marked the series as "Not for review" in the commit message.

I think I should have dropped your Signed-off-by.

Thanks,
Badal

>
> Thanks,
>
