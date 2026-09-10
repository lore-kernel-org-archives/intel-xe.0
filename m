Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702FDC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 11:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DF810E0A7;
	Thu, 10 Sep 2026 11:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeZQY7GP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015A610E0A7
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789041449; x=1820577449;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bfVbaZVUfQutiKHAh9GeKd6qVzP78RyJa7wBbHgg/4Q=;
 b=OeZQY7GPhecCireer+9okd7BLirPz1A0K5Eo25oOiY6WZNnaGcA2JRxj
 309J1T25XMMONS5IIJHnnGUahjZjZ6mZSh2usSspSvjLvT88uSjN0kkx6
 h7K2fArN2Wwx0F7j52Q6QKJqBs2x/VSCtrvuSwLEOTwzM7ZQWbycenS1d
 RuK8gOBiW0/luFYHQDgXn0gS5P06lKwnsH0pyY9UqdqBYKla1UpDJrsK6
 sfVUPYoBWWjIc+E8B5j197RC3pjyqSDsrOW6lC/ppr85r1wzqvEmu5dpL
 ctcD7UsmKxRZIZ+l2t5lPsdMw/Dy/B9/xnOYvC9t6E4xjPMOd+ZAAyKta w==;
X-CSE-ConnectionGUID: DxyznbdRQiGfFdnUjmw0NQ==
X-CSE-MsgGUID: 2s7fYb7MS5q15pFt8m/C2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="115034075"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="115034075"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:57:29 -0700
X-CSE-ConnectionGUID: VXdc4cJ1RP2XkALo7yfztg==
X-CSE-MsgGUID: uB8EyqYRT92imdSfswo+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="271115380"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 04:57:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 04:57:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 04:57:28 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 04:57:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LR6LGGCtXy8UntI0QpDNLeF8V/BoOhqLzWPOVOnq18TZheN1z6xb7YalItoi4KrLeuhgJ3Iy8aDaAz/bQwH77KJ715TSiNylxGu7v1nVom+tZvyuFNydm9bOae8/skbCx3GKlHxnms20FV+vY/WhNG9O2ZrYzVGb20yQakDA9SOut2+eLqKqYnkku8OteCOoHnP1SZjXU3+Gnt2SenI/c+CUNfxg/xS9xVxI287atxiTrVB+au4txB5G//bF4JsuMz3d63oHEZvSCSpXpILbHB+jFHt+WRXt8jISbYZ47pR6gSHAn/YEM4ZBr+aISbeUuZNWY90HdJIFsk0PNR+CdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wu7o6m1jBollbYpBeWPvRnD+b3rL6tNGjgMThWU2VxU=;
 b=MXesGwW+EfWQY8QyRYT8pK0kwOBJwfiWX20NNQY51hdjr0t6F0ZrqTKLVtuhAz508t8j6U5TbUececdktKkE4n7qMlNE2VVMPNNKp8O4farbXLiSzRes/9pDEs3BPjqAd9z5QXuU6MR0VO3YWPuh22wGdrUpSxSqu7/XbWQKDhfBRZgCRvlDRItGHxYZXhmSgW63+IhFfAUJeB2nvoBU0K9d0vdWWEmkto2FrYBb8F9mdK8C/H/UqIEbbZomGMjXtFnqrMUIRPkfAzBnyAPUhb1VeV7fqKPh8FJODVHukV6mEKkU/VWklXxzLSYTGYF1tFK0F4gEHsyO6Tnj5B2n4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH0PR11MB5030.namprd11.prod.outlook.com (2603:10b6:510:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 11:57:26 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 11:57:26 +0000
Message-ID: <62914acf-3e61-4868-85e4-44e270cd55ae@intel.com>
Date: Thu, 10 Sep 2026 17:27:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] drm/xe/cper: Add Intel specific CPER structures
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <daniele.ceraolospurio@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-17-badal.nilawar@intel.com>
 <0f51a1c9-a8fa-44fb-9733-97ea9e3e5899@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <0f51a1c9-a8fa-44fb-9733-97ea9e3e5899@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0176.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::17) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH0PR11MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: 072c0672-86e2-4378-69b5-08df0f32ae87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sDJGW34vzeREzs5oteqQyH6Xo02MoxY9hqz9XCxJ62QzvVri+q+zYiz4lg4+dfcJKpwYI56yYrYjTIi41ksokS547JOqoZjRp3p45NMNVTGkljhka8DWLmV+mx0mJMwHX/555FJWn8fJhcORgZcdiqQSlxVxRm5VQ9/K6bQp06xesQdhT/xJ74CnZSztIa/ifysSqQXlqxRz9Vq4zeFyHmx4GAkmADt9IMuPdeQ4Pn/kF5SRzRxfjt2OalfTiaTSG4CPXc4pJynLDPUVZIER2wy6JN6N84tmUGZLGUXq/uAQICAvUiFSjqrCT4rxj7v2xSlNzZguRebYHrMgA50/g2qwVYk+VwPOePhQWzpya0iL8AZFWF9szBEn8T0341aJ4CR7KmiNgoybbZdNPES1xyRAksiH3ypk+qaclgWbOVYcgSTVjotzrYtZRvtEuZpxsnAafn/dIePyv3UGburuBHmeix/LEjeHzNwukiTeBMikQBtNW9RQYHRBX7hoQNFaN8ZRi8lYqJzIzgCkBcZZKJWH4uqkIfLAj3999SolDlqF4sEbKxsYCS495H9rYTUzAQS7eXk4W4Mdbjdn0LBzYE1kg3DpUD7GldncfwBTp2U98PqVGjDWVAxtg72lNKCm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmdOdjZadXZkOXRVK0MrVTZxOGk4bEN5MHdCQk0vSEMrNUZ3eitxc1dnZzV0?=
 =?utf-8?B?WTUwWEZqSHR3Q09yMVEraTd4eTVYL0lLK0Y0Q0NIQ2U2bWtuTThqckQyTU53?=
 =?utf-8?B?Mnliakd4d29Va082UTExT294SzVHbGVLMEJ1NStrUDl1VDZUNXpqc1F6ejhy?=
 =?utf-8?B?M1FNWkEzWVZ2Y2xxbjFwMC8wZ0tNWEtpUi9tdUJLSXFITXRUZ0h6aU5rZFo4?=
 =?utf-8?B?WS9Nc24xZ3NGMkMzeW1tZ0xlUGp2QkdsTEE0cmxtZDVmT1RPWVEraHg2RFVH?=
 =?utf-8?B?VnBGcWo0dnZjZDlkNzFtT25yLzNKMGpIVnFpYnhPSVQ0QzVJWTg4eWJSUWVu?=
 =?utf-8?B?aW9OVWdmZDZyeTM3eVlWT09KSjZ3bFUzcmRscWpia3MxNGgyWW5BeW1KZWd5?=
 =?utf-8?B?eG9ZQUtEcXFlUzdjWGM4YUgxQTUybkhxbFFFeDZPYnhLVGsvczB2emRDbWd0?=
 =?utf-8?B?SmtQeDlPWW9lb3VEWE80RmhESlJBN2VuOTRsTlBnRFV4b0d3MU5veVM4WkM5?=
 =?utf-8?B?dENIVFZtODF3WVRDQllOdWdWVU1yVHVrbVduaFhMMGp3cDN4ZWRaeGhTVnhz?=
 =?utf-8?B?aENSNHhkQ3F0SDQ1cWlNL1FFV21QUUh2bkduVncxQlpxczJLV25tWkxmeC82?=
 =?utf-8?B?Tzh4aUxWVEdrdjBuUkFlMFh3Slc5U2JNczlqT08vRVV4NzZIRnREM0tNZFJ4?=
 =?utf-8?B?akQ2UTBCMnJNSmE0RS8yb2VmLzdMdG85N29JcVpwbWprM2VwZXdtNXppUktx?=
 =?utf-8?B?ZUlaOC9vTmh1QWNYcy90c2pXaG1qQndMMTZpbWtoem4yTjE5MUNMS3YvZlR6?=
 =?utf-8?B?emp6QU9sZFNWNVVKcHk0NVpCKzBNaEpKYjV0aVJIRDNNYmx4czE5eTVuUVpp?=
 =?utf-8?B?c0Q4aG1lWm1FNUY4TTJPRW8zQkJ3S2JrSGRIQVF1NE5LK2N1T0s1cVlsam9z?=
 =?utf-8?B?M2d3Q29qK2N0RmFrdmpQRkdRY3NHeVVabkJFTGM4ak0vaSs2aFpWRHI1MnpI?=
 =?utf-8?B?bU4rNTJ2UTRna2RGZStvbUFDUFlrTUgwSEZjeTZ2a3k1S09nSlpCQVJJbFNk?=
 =?utf-8?B?YVNGMUoybDVGazIvVnpPbkdudHAzbzZPeDdvTEdWMlhDQi9LZ2pvRjhxbWpV?=
 =?utf-8?B?b2ZrTHppemEvYmg0VFNYL3F2eUVHeXZGSUZ2TlhQTEpEZWI4Njl0dmRzRnZS?=
 =?utf-8?B?ZDRmVWR5a0RrZCthY2prUWpRcW40bUlaZ05ORHdSaVIrbTdMUENNVS9RK2ha?=
 =?utf-8?B?enRnK2FRV0NyYzRkR3pLNVY5V0JNTzdoNUdBZGU3UUxzNVUwbTl0c2NYR0p4?=
 =?utf-8?B?TTFmYVNlL1ByVmtXY0VQYllUUG1ldVVwTnpFbkxiU2tpd2toYm0zWkYwWlEr?=
 =?utf-8?B?dlRHVFd3VHpyR0dOY2RtVVNOUWx2bStpL3FhU1QxRkZGVFRZQlU0dXMyTzJ3?=
 =?utf-8?B?SFF3VEljelF2YVFjdEFrbEROK0lBTjFEQ3FWRGNMbDR6Tll6azVrMjg5NXJJ?=
 =?utf-8?B?cXE2VzREOEp5WU5tK1B5TStBQUJlNXl0SytKWTBaTU0xSnhrbHNIaUtJcFJq?=
 =?utf-8?B?NHUzbGFnaUtFQ0wzMFVlNCtuOXNhNm9WZnp4YXpMZFlVZkpraFRFN0ZTQllm?=
 =?utf-8?B?NzVtbWtNVlF4VGNJQ1p0WEtxUm1vM21zZDNsSVFLYStqZ2J0d3oxNkVyNmF0?=
 =?utf-8?B?RFNTeFprUW96M1FVUHFxMXpqOVZnc1ZQT3podkUvbVRIb002UlMxMElQSEgr?=
 =?utf-8?B?d1lPVnhOVDdkMEM3dXNxdFNNbksxT2J2azhmZ3hUcW94ejBaSitHZ2h1SHJk?=
 =?utf-8?B?K21xWkp5Si90M3dJWHRacm5oLzJnZGxwNG9Jb0lmLzNHcVc5ckJHVkg0QWxS?=
 =?utf-8?B?VzJxMWZXMEg3UGl1M1pyc2JpMkpsN1BzZktuN01KN2VQM1oxV2VNM2hlUWNL?=
 =?utf-8?B?blQ5TjlwZlJzVGEwakk5VTRVTlZOaGkvcU1YbjBoK2lacEtUR253OUpUUklK?=
 =?utf-8?B?YlJrajRBVm1USWVMaGhLYkQxSzlVWVIvM1BIV3VxMnVreldhWE4xN0h3OFN3?=
 =?utf-8?B?Ky90bDFGUDVua1pKTHhJODdHZkhpMXVkTzRIcVBtS1VoamdNU0ZBU3g1Wmpn?=
 =?utf-8?B?cElEYUZFd2graUlFbGI2cjdydWVUdDd3b3hyZFVmcEt3SU92RXJRVkd5ajNM?=
 =?utf-8?B?NG5BNE1UNnhwQkxBd3EwVm45YUx6dklnbnhMNHVXd0xnbkpqbnE5ejZONXJk?=
 =?utf-8?B?QnNNL3dqNlNWU3JHUXB2NGx2cWhDMG9Yb1lreTVHeUlDMmo0UzRRVVVPRFF2?=
 =?utf-8?B?NXdtQjM1Y1RjWVZ4dmZnYWRoTytselhmcFdyTXZxeUl0T0VrRzB3UT09?=
X-Exchange-RoutingPolicyChecked: dkgoEVQyjw/xEkbGgA927RWtw1bVTzzVg5b3C8LhDmJQIDK3IY5q7FwgvVuRu7wdxoZwkzNtvmKsetKPG1HR3FWadWUc7LD/8dHwgnQ0sFbk1WZVRgh4Kppx9yKP11nsPXH0tWDjQvIqoudB5IH/w5BrUL8A+EL5woyknWTHZcFq6kXFzfcwZOey+I2UX9VdUdt1CF9c1rhWp4ikALQ1rlg6nc0DZKOiPWf+Q3swHt2wrTREuuGrGxX2nq5eObAoK9ulqXCRp1Pr5kuGAiDU1byI2F6L8QkEU5CFJjj6/9pUVozkHiH+gEC4OMLBHBEr1QSYX9w6vT+bx4c74+Sn0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 072c0672-86e2-4378-69b5-08df0f32ae87
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 11:57:26.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uXu94MWTUws6FFvnFfBp3xdtMp1mZRGhC6Xbcch1svt/8wcovmTwsYMgP9ftoDF0qUmR33nO1Te/NhxLfiWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5030
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


On 07-09-2026 18:43, Michal Wajdeczko wrote:
>
> On 9/6/2026 7:26 PM, Badal Nilawar wrote:
>> Define Intel-specific data structures and GUIDs needed to build
>> Intel GPU CPER recoreds
> typo
>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> v2: Fixed sashiko warning about bit fields usage
>> ---
>>   drivers/gpu/drm/xe/xe_cper_types.h | 179 +++++++++++++++++++++++++++++
>>   1 file changed, 179 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
>> new file mode 100644
>> index 000000000000..b81b70501e0e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
>> @@ -0,0 +1,179 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_CPER_TYPES_H_
>> +#define _XE_CPER_TYPES_H_
>> +
>> +#include <linux/cper.h>
>> +#include <linux/types.h>
>> +#include <linux/uuid.h>
>> +
>> +/*
>> + * Validation bits definition for validation_bits in struct
>> + * xe_cper_sec_intel_err_hdr. When set, corresponding fields in header
>> + * contains valid data
>> + */
>> +#define XE_CPER_VALID_LOCATION		0x0001
>> +#define XE_CPER_VALID_FIRST_TIMESTAMP	0x0002
>> +#define XE_CPER_VALID_SIG_ID		0x0004
>> +#define XE_CPER_VALID_PCI_BDF		0x0008
>> +#define XE_CPER_VALID_DRV_VERSION	0x0010
>> +#define XE_CPER_VALID_FW_ID		0x0020
> 	BIT(0)
> 	BIT(1)
> 	...
> or
>
> enum xe_cper_valid_bits {
> 	XE_CPER_VALID_LOCATION = 0,
> 	XE_CPER_VALID_FIRST_TIMESTAMP,
> 	...	
>
> 	BIT(XE_CPER_VALID_LOCATION)
> 	BIT(XE_CPER_VALID_FIRST_TIMESTAMP)

Followed the include/linux/cper.h

/*
  * Validation bits definition for validation_bits in struct
  * cper_record_header. If set, corresponding fields in struct
  * cper_record_header contain valid information.
  */
#define CPER_VALID_PLATFORM_ID                0x0001
#define CPER_VALID_TIMESTAMP                    0x0002
#define CPER_VALID_PARTITION_ID                0x0004

> 	...
>
>> +
>> +/*
>> + * Intel CPER GUID Namespace — RFC 9562 UUIDv5 (SHA-1 name-based)
>> + *
>> + * All values below are generated deterministically by uuid generator.
>> + * Do not hand-edit the byte values.
>> + */
>> +
>> +/* Creator IDs */
>> +#define INTEL_CPER_CREATOR_XEKMD \
>> +	GUID_INIT(0x9a42070f, 0xdf9d, 0x555e, \
>> +		  0xba, 0x02, 0x7c, 0xbc, 0x86, 0x3d, 0x37, 0x1c)
>> +
>> +#define INTEL_CPER_CREATOR_AMC \
>> +	GUID_INIT(0x215803da, 0xfc7a, 0x5925, \
>> +		  0xb7, 0x8b, 0x1f, 0xc1, 0x19, 0x61, 0x58, 0xd1)
>> +
>> +/* Notification Types */
>> +#define INTEL_CPER_NOTIFY_GPU_ERROR \
>> +	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>> +		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
> only this one will be used for now, right?
> maybe introduce other when needed?
Sure.
>
>> +
>> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
>> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
>> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
>> +
>> +/* Section Types */
>> +#define INTEL_CPER_SECTION_ACCEL_GENERIC \
>> +	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
>> +		  0x80, 0x28, 0xb9, 0xb1, 0x3e, 0x6d, 0x58, 0xb0)
> as this seems to be new ABI, shouldn't we define it at least in our abi/ folder?
>
> 	drivers/gpu/drm/xe/abi/xe_cper_abi.h
You mean above GUIDs?
>
>> +
>> +#pragma pack(push, 1)
>> +
>> +/**
>> + * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
> if this is a Intel header, maybe it should start with intel_ prefix?
>
> 	intel_cper_section_...
>> + *
>> + * Fixed-size header for the Intel GPU error section of a CPER record.
> if this is GPU section, shouldn't we have gpu_ tag in the struct name?
>
> 	intel_cper_section_gpu_error
Followed the specs. Fields from these structures will be overloaded for 
software CPER as well.
>
>> + * All multi-byte fields are little-endian; the structure is packed.
>> + */
>> +struct xe_cper_sec_intel_err_hdr {
>> +	/** @error_class: Error classification (type, component, location, cause) */
>> +	union {
>> +		struct {
>> +			/** @error_class.error_type: RAS error severity */
>> +			u8  error_type;
>> +			/** @error_class.error_component: IP block that raised the error */
>> +			u8  error_component;
>> +			/** @error_class.tile: Tile number */
>> +			u8  tile;
>> +			/** @error_class.instance: Instance within the tile */
>> +			u32 instance;
>> +			/** @error_class.cause: Error cause code */
>> +			u32 cause;
>> +			/** @error_class.reserved: Reserved, must be zero */
>> +			u8  reserved;
>> +		} error_class;
>> +		/** @class: Raw byte view of the error class */
>> +		u8 class[12];
>> +	};
>> +	/** @first_timestamp: Timestamp of the first occurrence of this error class */
>> +	u64 first_timestamp;
>> +	/** @sig_id: Aggregated error class SIG ID; set to U32_MAX if unknown */
>> +	u32 sig_id;
>> +	/** @error_count: Number of times this error has been observed */
>> +	u32 error_count;
>> +	/** @validation_bits: Raw u16 view of all valid bits */
>> +	u16 validation_bits;
>> +	/** @pci_bdf: PCI location string, format "DDDD:bb:dd.f" */
>> +	char pci_bdf[16];
>> +	/** @drv_version: Driver source version string (THIS_MODULE->srcversion) */
>> +	char drv_version[25];
>> +	/** @fw_id: Firmware version string (GFSP+PCODE+CSC+GUC or MNG+NUC+RAS+GUC) */
>> +	char fw_id[256];
>> +	/** @reserved: Reserved for future use, must be zero */
>> +	u8 reserved[5];
>> +};
>> +
>> +/**
>> + * struct xe_cper_sec_intel_error_info - Variable-length Intel GPU error payload
>> + *
>> + * Appended after &xe_cper_sec_intel_err_hdr when detailed per-event data
>> + * is available. The @event_queue flexible array holds @event_queue_count
>> + * packed &xe_intel_priv_event_entry records.
>> + */
>> +struct xe_cper_sec_intel_error_info {
>> +	/** @error_class: Error classification (mirrors the header error_class) */
> if it is the same, shouldn't we define dedicated struct for it?
> doing a plain copy/paste is error prone
Sure.
>
>> +	union {
>> +		struct {
>> +			u8  error_type;
>> +			u8  error_component;
>> +			u8  tile;
>> +			u32 instance;
>> +			u32 cause;
>> +			u8  reserved;
>> +		} error_class;
>> +		/** @class: Raw byte view of the error class */
>> +		u8 class[12];
>> +	};
>> +	/** @error_count: Total number of errors recorded */
>> +	u32 error_count;
>> +	/** @event_queue_length: Total byte size of the @event_queue array */
>> +	u32 event_queue_length;
>> +	/** @event_queue_count: Number of entries in @event_queue */
>> +	u32 event_queue_count;
>> +	/** @event_queue: Packed array of &xe_intel_priv_event_entry records */
>> +	u8 event_queue[];
>> +};
>> +
>> +/**
>> + * struct xe_intel_priv_event_entry - Single error event in the event queue
> no cper_ in the name?
will add.
>
>> + *
>> + * Each entry is variable-length; @entry_length gives the byte size of
>> + * @metadata only (not including @entry_length or @timestamp).
>> + */
>> +struct xe_intel_priv_event_entry {
>> +	/** @entry_length: Byte length of the @metadata payload */
>> +	u32 entry_length;
>> +	/** @timestamp: Hardware timestamp of this event */
>> +	u64 timestamp;
>> +	/** @metadata: Event-specific payload bytes */
>> +	u8  metadata[];
>> +};
>> +
>> +/**
>> + * struct xe_cper_nonstd_record - Fixed-size portion of an Intel GPU CPER record
>> + *
>> + * Contains the standard CPER record header, section descriptor, and the
>> + * Intel error section header. A &xe_cper_sec_intel_error_info payload
>> + * (with its flexible @event_queue array) is appended dynamically.
>> + */
>> +struct xe_cper_nonstd_record {
>> +	/** @record_hdr: Standard CPER record header (UEFI Appendix N.2.1) */
>> +	struct cper_record_header record_hdr;
>> +	/** @section_desc: CPER section descriptor */
>> +	struct cper_section_descriptor section_desc;
>> +	/** @intel_hdr: Intel-specific error section header */
>> +	struct xe_cper_sec_intel_err_hdr intel_hdr;
>> +};
> hmm, this one looks like our helper struct, not a real ABI
>
> [1] https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#format

Yes it is helper structure.

Thanks,
Badal

>
>
>> +
>> +#pragma pack(pop)
>> +
>> +/**
>> + * struct xe_platform_id_entry - Mapping from PCI device ID to CPER platform GUID
>> + *
>> + * Used to resolve the platform_id field in a CPER section descriptor.
>> + * GUIDs are UUIDv5 (RFC 9562, SHA-1) derived from the Intel CPER namespace
>> + * with name string "platform/8086:<dev_id_hex_lower>".
>> + */
>> +struct xe_platform_id_entry {
>> +	/** @device_id: PCI device ID */
>> +	u16       device_id;
>> +	/** @platform_id: Corresponding UUIDv5 platform GUID */
>> +	guid_t    platform_id;
>> +};
>> +
>> +#endif
