Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE6606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mGhvgyG0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7F210E07F;
	Thu, 29 Oct 2026 11:31:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBB710E7D9
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793273512; x=1824809512;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=2GY9ntse3cx4+YKABVkERdkEXLNK7TrSUphfiFDe2Ks=;
 b=mGhvgyG0KtSR+Adcvc8CNX2J2TDxzzBQQxNmx+WF2gsKQHU9/+Ydw8ra
 5HNXOaT0Z8zTDFYRCJTpTTSscfcwdpF/m3/gjAnXxOH53RoqUTR4cmY/e
 AEa3tOgLcTXYIZJTLQuPJIPvsb7tknjZ/ozpEb/gHja3b1Q9cgxRCwJ8j
 311TOhsEFHSMJn5xObuhqfv8V79QkmmU5cTPGreuNWJS6tMyZj5465AVt
 LSEywnjvppnWMYvIr2kvq2WPZNOiycE+b4LScyahQHhWSppj4NnJRqcou
 GJiDfUg1UCWR+UJDa6PbW+sc24d1xzKByq4XFGlyw9ZshlF1Xa4cntLR7 g==;
X-CSE-ConnectionGUID: +hzBF+CaRpKGKaj9Ulf6fg==
X-CSE-MsgGUID: DnOCMIOeSvSpP9n0jNAlEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2011829"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; d="scan'208,217";a="2011829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:31:52 -0700
X-CSE-ConnectionGUID: pRXktSlhRQCFJgjOoug75A==
X-CSE-MsgGUID: Zn3sG7UsSGWOpMqyU7IHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; d="scan'208,217";a="5456855"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 04:31:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:31:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 04:31:50 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 04:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRDW0S5PIq6UfKBhfFZwhs0DJt2rIqFfR7SpnOEGaJY30PmLDhpne36c3v4o6FQ3Sjnz+uhgRpZC2bOZWzIoPKZke7iLfaFmqBIirqds2FIJEGKQhpr3uCfBIhabE4Z+g7W2Ru91ocwULGVeCibgTTS4SqcMXTg1k5zwCkVbzu4TipNkJdABtLMKb0kfCo6Y5tPp3NZByjOG8xkyT6cwBrkIsPeyHwtIThuYCSV8cgiVNk2q0wg8QCgn0tlDsNPut/A3Lf3fwr0y2YeSuSJZuViuJxfq3xdjeJ6A9LePIijgnymjjD0s6+vPpzGPPJhws+B0sxjyebxRVBgg6AtdHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btPC7FoW71ydNxEAFElYm2a7COktxMdG84MiVaVkOw0=;
 b=m2eijF61WbcYAl89j0ocEs2T+Op83NCzDofaKGf36EtmVlZSceEEIf1nUq+TKAemO2mcUvhKadiIWCQwsRrbQfhP+BczGNjICwlkTGu3orjNXn3MsXkl49aeY1T2PlX6dLjt27ypMEP0hzwktHTBiOslKaLjDRFQKsdeBL443XuPihu3S10TpsZhgQhXwUdE4gHziMHnqc7YCpTXBEMgPQJ0SZtL0cnbzTdkJZcLB8IxZ4C3rRwufl8v0PAm57sPD/Nk8rmp3xsOZk1GK1UZsur0/jX85iukHiqkrBASXKU/yCwv9Wgbasg21P7WwuHsS4V33XIWksje3aAjfulZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by PH5PR11MB320987.namprd11.prod.outlook.com (2603:10b6:510:500::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 11:31:30 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 11:31:30 +0000
Content-Type: multipart/alternative;
 boundary="------------xtxVjSgP61sC0fJdQvlkY9Dx"
Message-ID: <f0cb6786-c5af-41d7-ba7a-463eefeb42cc@intel.com>
Date: Thu, 29 Oct 2026 17:01:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] drm/xe/hwmon: expose pwm[1-3]
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-5-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-5-karthik.poosa@intel.com>
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|PH5PR11MB320987:EE_
X-MS-Office365-Filtering-Correlation-Id: 4386abb4-6d17-427e-38d5-08df35b02d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|4143699003|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|22082099003|18002099003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: JPAkWOkBaxMD8KrNpJW3JrXGIogDtyFgRygKepb4BzYdNbMS8taAfb34dqeYphNfqKprqIWtEVJoDcQRoRE+NsBkEw62trdwGw0pZxKd0jEFqm6lVzaRcSHU+BgzTlYvxeJTgTdsEpOVABunXkoF2DmtRbPNheuB20osrk4WiwD6gpCtNTf7gKwHLZbkrtv1OR5bfizijEqxcZJ6KIF2usRCcxZOdE0O2Y0zxCizeS2rUYneh/9sCrptkiVWjd2kphtTfLaDVHdVq0OfTtmESLmIfcQ3VkK40Pux8Iz3aow+TOiW4AkyJtpxQvZfNIRdqxXuCzA6ld4obmeLDm/SxWpdDOBFxJuArvvTmkEAXXHkmlmFSCympoZTANzzj85jR1ZZ6V5p+KveJhlB2Eum0KWcd3PLmWJRAahTe4C18Ov/5E6o7vGQofSeY4R8BlHS6G0vkqd1/Tc9xjUfVY9y3ZjdHbau+UWeuo+qUmSguzR9BZxKRvoJcOSXSUJFQP3bN5o03THPLKsqqVdfjEz+Q4DeAgkAQJhoQupn4gF6i6IqWCGElNb6Dsu3FgY70qWAbjzMm0sCciYRVzJMlYk8CvIZ6wx3CzuSkP0QM1/mxnjP/6sz9WIpbLYbACnkovobSLKXFgZxCcCBSFuaLpLMQjV5Lofykw1ze/6sAvesKI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(22082099003)(18002099003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVA1UnpqaE8xYk4zeW9xWG52bW5MUGRrZGYweEZDQmlWcUR4UGFWaHpNbnhk?=
 =?utf-8?B?UjRiME5RV1I2UHhGb0pMWTRwWGpuREJwbmFKWGlIa0ZZTmxOaktvMG8yYzNl?=
 =?utf-8?B?VHZjZGlJcXNFWjk2aFF2ejVsV3VISzJPc1NxZHdWK3MzNUZXd2gyWVltdFpW?=
 =?utf-8?B?VEdlL2dabks2NGt6Z09vRHRvQUlwK09POWlWektnaTF2NkdwWmNhY0pzellQ?=
 =?utf-8?B?V3dMTS9SNzExVnErN2twWjNtOGpyV2xTbFYyRHhGeEFYV2ptTzNhSFpmcHd0?=
 =?utf-8?B?Y0hVNkUzR2lheURXUjhRUFlmTEwwNVpud0IycDZEdmI0cXpTdXZjMXFQQ2tJ?=
 =?utf-8?B?QlJlVWNpWElZTGFaUStTeE1ESlFkQVUvZXpQQkZNWE5sZFFEaTZGNk1QOXJv?=
 =?utf-8?B?U1ZLWDEvM0RrZlMrR3d2YVo5OFp5dlpKTkFobTc3bWprSjQ0NWxiUkpGWlU4?=
 =?utf-8?B?RStCOEswUjc5dTlVYUVUK2N6THhLWGVyYldaeFJwV0NZMFZNQml4Szd3RHhx?=
 =?utf-8?B?cDNhcENLZ3Vvdm9NdldoUC82aUlSbmlKU0RLMUJaNWJJUDJRNkFpUSs0YjdN?=
 =?utf-8?B?NEQvOTJoczYwUTNLRmFKVy9icXVzd3JIQWIrSEp2dG5rOWhYZlI3UEZEeXZB?=
 =?utf-8?B?c09PUEdwcjJBL25yUGVHeGlWRE1uNVArelhucE5Rb0pXN2Y4aks1dkRoekQ4?=
 =?utf-8?B?NnpJbkdJNUk4UEFjUktkWkpPb0V1Zmd6MWNwZFdWQmhkWTNmcUlRcVB4RlJi?=
 =?utf-8?B?bE1TV0loSTFyRjNoYmdsb3VKQk1MT3RIV2lTek96VTBFaEdUS0ZSeStnSUF2?=
 =?utf-8?B?ZXJ4cWFjeTRlRHkrZFFiMFV0UWlmOFkwZ2pudjhmV09vSFJ0YUVEcjNUa25y?=
 =?utf-8?B?TnNmbHE5RUZQclNMUEl1K21ndEQyN2JWVE82R3ZDM2d5eVhVbjBNWDZhUkIv?=
 =?utf-8?B?eDRTdk5UMXFSdE9ZbW52YVdOOVFGaW0xSFYwUVJhRjAyaU1oZkJoMVdIemto?=
 =?utf-8?B?aUljd3lyQS9oSVczNEVFbVNvVE1yaDI4dHRGK0NKa0hSTGo3dlFkNk43OEFN?=
 =?utf-8?B?UnhCN2xzRHBOOTBiZEFYM0NhSlNsd25iU3kwTDJucFpXNlMwMG0yaVRkbUg1?=
 =?utf-8?B?cWFkY0c2bGtwc21wbGtIYlNUd29LbnM3UE1pQWo4NGxFdnlGK0RqblNDc0lV?=
 =?utf-8?B?T0FFWXZ6WGo3cWxEdmN0aG5jdGNjcVBrbEhQTUNjblVCT2JSbE9xMEUwMzFF?=
 =?utf-8?B?dDhQNHQxVmhraTVPYlpqSENwMW5yNE5Tb2dzcnJkTTk0RXdBZWJKOUZIcnRa?=
 =?utf-8?B?dWR2bkw0V29NQm5lbGxzNGFzU1NQZXU3bE1sNFdIZDdvSE1ZTXp0Vk1BbXRR?=
 =?utf-8?B?VTNnUFlYUGowbnhPWmkwZzVtYTNJMVl3dllWQW5tQUFpclU3a3hRTzBnVWcv?=
 =?utf-8?B?RmFqMzRxdklhUVNQbjNBVTAya1JMbUJFVzJrNTRFaXFRMUJtU1JhYW4rQlJ5?=
 =?utf-8?B?SUZSSHJPcy9GTTN2elRaV0NhdTY2SFhTbFFwZnhzcWd2azMvbGtpN3puaWw5?=
 =?utf-8?B?U0NNNkkzdHJ2R2lkakltejU0SkpWdWdyYjZMcnl3bkcxakhWemRURlJoZjZw?=
 =?utf-8?B?V1FXOVJyR01zTUpmMlp4ME92Q21lRjJnSWR4MllOVzBQTlV2WmpzUHJxYjBu?=
 =?utf-8?B?bVVLdWJjNDlwV25zL2pyRmEwRkIxWFVDOVBoOStOMXhCbmJaNVJHQXhjb01o?=
 =?utf-8?B?cTlUMlRlY0c5R0drbkxOR0hFTWVEcE1KTlJUSjFmQWtkM0xGeUZrZWhQZnp1?=
 =?utf-8?B?TjAvSmp2ektJRE5ZRkVLZjFxZ204aTN1TGx0U05YdUQxTWVBVG82WG5GYnNH?=
 =?utf-8?B?NVZmVzJIVWR5eG1HZWQvMVBxQXIzaW5LQzlwanBWYWp6bVNRVnhRaGNJVEJx?=
 =?utf-8?B?L2xzZjJiSmpXbmJkTko2L1RRb2FwY3lKRnU2TEszZ0dxRzd3TTEySUxBRTN6?=
 =?utf-8?B?NkRjVklyenpBYXo2QTVJU203NWNINllvdExKN1dkSlFObHF0TUVtUmx5ZFd3?=
 =?utf-8?B?VURKWDh3NDdwRGJwNHgxWVFJMG1MWE1iVC9JR2xUMzJYNk9Ta1U5NFN0VHFV?=
 =?utf-8?B?M3VGRmJoVEF0MXhLQjR6K3ZFWndJbVgybXl4OGFjeDZqZWdzTnZZR1Nwemxi?=
 =?utf-8?B?OXozOERucDg0TEowV0dzRUs2MWk0VytnTzNrU0hiajdjcGxTZ0srcGI2NXBZ?=
 =?utf-8?B?azRXT3pWS3Z6ZjVSVVozOURuVWdITm9HSFMyV1k3L1l6SkJ1aTJKMlcyV3JZ?=
 =?utf-8?B?ekhia0Z6b3k1allUbFFYZlJEdWZ6bWdCbHRRKzBjZUFsa0UvRUpDdz09?=
X-Exchange-RoutingPolicyChecked: 0yTKWeDp6O1TyI4I3oluhaV+fqx2UQi8be3Cynrkq+XnB23oILeixKx5Jh9QFOTf2dVf6MXdvqxeLZ7JzhkE6NMyMItiN8GVtn/P0tuTo5xGbcWM2UcTD+20JBD2GCIisJxuuFOmEOa+rAeG89xRIT1Wh4S5Agk40HtPXsqZgRmET/sgUH+yxhT7ggTKoLKxWL/5K9zpYFLF2KPocpWIWW/loOeJFSN27Bfw/GqWvbskGpqxN3muAAZQtaTGk3D1CD/2s5qbQWaDFNEgfUtMaCQCC26NF0MBv9SSfxqkAg9faHD9AcoUIrONXGgw1FeHEZzpAsxWcveiVGoFf0M78A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4386abb4-6d17-427e-38d5-08df35b02d3e
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 11:31:30.2679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhXvDXLLo5iZpOSRvN+8gkXiJq+36VcyO6Y78tUKJ3yf/emLEltdJKar9YnVo5Hitb+KWEbg85NAbAK7K/3tzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR11MB320987
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------xtxVjSgP61sC0fJdQvlkY9Dx
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Expose pwm[1-3] fan duty attributes through hwmon.
>
> This enables reading and writing user PWM values (0..255) for each
> available fan channel.
>
> Update Xe hwmon ABI documentation for pwm[1-3].
>
> This sysfs node can be used for manual control of fan speed,
> irrespective of fan curve.
>
> v2:
>   - Use xe helpers for dmesg logs.
>   - Avoid using hwmon->num_fans to get fan count in
>     xe_hwmon_pwm_is_visible().
>
> v3:
>   - Set PWM directly through the user table; avoid initializing it from the
>     stock table. (Soham)
>   - Move the unused xe_hwmon_activate_user_fan_table() to the subsequent
>     patch.
>   - Fail pwmN reads when no value has been written, rather than activating
>     the user table from the stock table.
>   - Define MIN_FAN_CONTROL_POINTS as 2.
>   - Use MIN_FAN_CONTROL_POINTS for PWM configuration. (Soham)
>   - Use batched writes for configuring fan control points when setting pwmN.
>   - Add and rephrase couple debug logs.
>   - Update the hwmon documentation.
>
> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 170 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>   3 files changed, 182 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 5ee68aefa485..ce17e9ca3ed8 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -321,3 +321,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>   		milliseconds over which sustained power is averaged.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
> +Date:           October 2026
> +KernelVersion:  7.3
> +Contact:intel-xe@lists.freedesktop.org
> +Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
> +                fan speed and 255 is 100% fan speed.
> +
> +                Only supported for particular Intel Xe graphics platforms.
Use tab indentation after the field labels.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 32016c5d4770..a86ed741feb3 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -8,6 +8,7 @@
>   #include <linux/jiffies.h>
>   #include <linux/types.h>
>   #include <linux/units.h>
> +#include <linux/delay.h>
Is this header required ?
>   
>   #include <drm/drm_managed.h>
>   #include "regs/xe_gt_regs.h"
> @@ -153,6 +154,9 @@ enum fan_table_type {
>   /* Maximum number of fan control points supported by each fan. */
>   #define MAX_FAN_CONTROL_POINTS	(10)
>   
> +/* Minimum number of points required for a user fan table. */
> +#define MIN_FAN_CONTROL_POINTS  (2)
Use tab indentation.
> +
>   /* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
>   #define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 31) | \
>   						((POINT_NUM) & REG_GENMASK(30, 0)))
> @@ -913,6 +917,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>   	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
>   			   HWMON_F_INPUT | HWMON_F_MAX),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
>   	NULL
>   };
>   
> @@ -1154,6 +1159,89 @@ static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
>   	return 0;
>   }
>   
> +static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
> +					enum fan_table_type table_type)
> +{
> +	int ret;
> +
> +	ret = xe_hwmon_pcode_read_fan_control(hwmon,
> +					      (table_type == USER_FAN_TABLE) ?
> +					      FSC_READ_USER_FAN_CONTROL_POINTS :
> +					      FSC_READ_STOCK_FAN_CONTROL_POINTS,
> +					      fan, point_count);
> +	if (ret) {
> +		xe_err(hwmon->xe, "failed to read fan %d %s point count, ret=%d\n", fan,
> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", ret);
> +		return ret;
> +	}
> +
> +	if (*point_count > MAX_FAN_CONTROL_POINTS) {
> +		xe_err(hwmon->xe, "fan %d %s point count %u exceeds max %u\n", fan,
> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count,
> +		       MAX_FAN_CONTROL_POINTS);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Temperature to set when setting the fan PWM with pwmN. */
> +#define FIXED_PWM_TEMP	(1)
> +
> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
> +	u32 point_count = 0;
> +	u8 clamped_pwm;
> +	int ret, i;
> +
> +	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
> +	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
Is clamped_pwm and  fi->min_pwm in percentage ? If so use 100 *instead 
of* U8_MAX to be the max value.
> +
> +	/*
> +	 * Set the first fan control point in the user table to the clamped PWM value.
> +	 * Use only the first fan control point for setting the PWM value.
It says "only the first fan control point" but the loop end up writing 2 
points.
> +	 */
> +
> +	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
> +		writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan);
> +		writes[i].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, FIXED_PWM_TEMP + (i)) |
> +					    FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, clamped_pwm);
> +		xe_dbg(hwmon->xe, "prepared fan control point %d with temp=%d, speed=%u\n", i,
> +		       FIXED_PWM_TEMP + (i), clamped_pwm);
> +	}
> +
> +	writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan);
> +	writes[i].data = MIN_FAN_CONTROL_POINTS;
> +	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), writes, ARRAY_SIZE(writes));
> +	if (ret) {
> +		xe_err(hwmon->xe, "failed to write pwm %d for fan %d, ret=%d\n", pwm, fan, ret);
"pwm" has been reassigned to a percentage by this point, so either print 
the original 0–255 value (keep it in a separate variable) or label this 
one as a percentage.
> +		return ret;
> +	}
> +	xe_dbg(hwmon->xe, "applied fixed pwm %u for fan %d\n", clamped_pwm, fan);
> +
> +	/* Verify if the fan points are set */
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret && point_count == 0) {
On failure point_count is already 0, so && point_count == 0 seems to be 
redundant.
Instead could this be more usable :
if (ret || point_count != MIN_FAN_CONTROL_POINTS),  if the valid write 
needed to be checked ?

> +		xe_err(hwmon->xe, "pwm set verify failed for fan %d, ret=%d, point count=%u\n", fan,
> +		       ret, point_count);
> +		return ret;
> +	}
> +
> +	/* Update the user fan table cache. */
> +	for (i = 0; i < MIN_FAN_CONTROL_POINTS; i++) {
> +		fi->fan_table[USER_FAN_TABLE].fcp[i].temp = FIXED_PWM_TEMP + (i);
Drop the parentheses around i: FIXED_PWM_TEMP + i.
> +		fi->fan_table[USER_FAN_TABLE].fcp[i].speed = clamped_pwm;
> +		xe_dbg(hwmon->xe, "fan %d user table cache point %d with temp=%d, speed=%u\n", fan,
> +		       i, fi->fan_table[USER_FAN_TABLE].fcp[i].temp,
> +			  fi->fan_table[USER_FAN_TABLE].fcp[i].speed);
The arguments don't align under the opening (.
> +	}
> +	fi->fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
> +
> +	return 0;
> +}
> +
>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> @@ -1774,6 +1862,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	}
>   }
>   
> +static umode_t
> +xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	if (!hwmon->xe->info.has_fan_control || !IS_FAN_ENABLED(channel))
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
>   static int
>   xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
>   {
> @@ -1828,6 +1930,67 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   	}
>   }
>   
> +static int
> +xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	struct xe_hwmon_fan_info *fi;
> +	int ret = 0;
> +
> +	if (channel < 0 || channel >= FAN_MAX)
Add a short xe_dbg/xe_warn before these -EINVAL returns for clarity.
> +		return -EINVAL;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	fi = &hwmon->fi[channel];
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		/* Check if user fan table is set else activate it.*/
Where does it activate ? Use space before */.
> +		if (!fi->fan_table[USER_FAN_TABLE].point_count) {
> +			xe_warn(hwmon->xe, "pwm not set for fan %d\n", channel);
> +			ret = -ENXIO;
> +			goto unlock;
> +		}
> +		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed * U8_MAX, 100);
The 0–255 <-> percentage round-trip is lossy for small values; Better to 
add a one-line note since the ABI says a full 0–255 range.
> +		xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, *val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
> +}
> +
> +static int
> +xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
> +{
> +	int ret = 0;
> +
> +	if (channel < 0 || channel >= FAN_MAX)

Add a short xe_dbg/xe_warn before these -EINVAL returns for clarity.


Regards,
Soham
> +		return -EINVAL;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > U8_MAX) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
>   static umode_t
>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		    u32 attr, int channel)
> @@ -1854,6 +2017,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_fan:
>   		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
>   		break;
> +	case hwmon_pwm:
> +		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
> +		break;
>   	default:
>   		ret = 0;
>   		break;
> @@ -1883,6 +2049,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return xe_hwmon_energy_read(hwmon, attr, channel, val);
>   	case hwmon_fan:
>   		return xe_hwmon_fan_read(hwmon, attr, channel, val);
> +	case hwmon_pwm:
> +		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -1901,6 +2069,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return xe_hwmon_power_write(hwmon, attr, channel, val);
>   	case hwmon_curr:
>   		return xe_hwmon_curr_write(hwmon, attr, channel, val);
> +	case hwmon_pwm:
> +		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 32bac74c4281..80642bee0ac8 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -82,9 +82,12 @@
>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>   
>   #define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
> +#define     FSC_WRITE_FAN_TABLE			0x1
>   #define     FSC_READ_MAX_FAN_RPS        0x3
>   #define     FSC_READ_NUM_FANS			0x4
>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
> +#define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
>   #define     FSC_READ_FAN_TABLE			0x7
>   #define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
>   #define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
--------------xtxVjSgP61sC0fJdQvlkY9Dx
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Karthik,</p>
    <div class="moz-cite-prefix">On 16-10-2026 00:37, Karthik Poosa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">Expose pwm[1-3] fan duty attributes through hwmon.

This enables reading and writing user PWM values (0..255) for each
available fan channel.

Update Xe hwmon ABI documentation for pwm[1-3].

This sysfs node can be used for manual control of fan speed,
irrespective of fan curve.

v2:
 - Use xe helpers for dmesg logs.
 - Avoid using hwmon-&gt;num_fans to get fan count in
   xe_hwmon_pwm_is_visible().

v3:
 - Set PWM directly through the user table; avoid initializing it from the
   stock table. (Soham)
 - Move the unused xe_hwmon_activate_user_fan_table() to the subsequent
   patch.
 - Fail pwmN reads when no value has been written, rather than activating
   the user table from the stock table.
 - Define MIN_FAN_CONTROL_POINTS as 2.
 - Use MIN_FAN_CONTROL_POINTS for PWM configuration. (Soham)
 - Use batched writes for configuring fan control points when setting pwmN.
 - Add and rephrase couple debug logs.
 - Update the hwmon documentation.

Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
Assisted-by: LLM
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 170 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
 3 files changed, 182 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 5ee68aefa485..ce17e9ca3ed8 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -321,3 +321,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
 		milliseconds over which sustained power is averaged.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/pwm[1-3]
+Date:           October 2026
+KernelVersion:  7.3
+Contact:        <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
+Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
+                fan speed and 255 is 100% fan speed.
+
+                Only supported for particular Intel Xe graphics platforms.</pre>
    </blockquote>
    Use tab indentation after the field labels.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 32016c5d4770..a86ed741feb3 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -8,6 +8,7 @@
 #include &lt;linux/jiffies.h&gt;
 #include &lt;linux/types.h&gt;
 #include &lt;linux/units.h&gt;
+#include &lt;linux/delay.h&gt;</pre>
    </blockquote>
    Is this header required ?
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 #include &lt;drm/drm_managed.h&gt;
 #include &quot;regs/xe_gt_regs.h&quot;
@@ -153,6 +154,9 @@ enum fan_table_type {
 /* Maximum number of fan control points supported by each fan. */
 #define MAX_FAN_CONTROL_POINTS	(10)
 
+/* Minimum number of points required for a user fan table. */
+#define MIN_FAN_CONTROL_POINTS  (2)</pre>
    </blockquote>
    Use tab indentation.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
 /* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
 #define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) &lt;&lt; 31) | \
 						((POINT_NUM) &amp; REG_GENMASK(30, 0)))
@@ -913,6 +917,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
 			   HWMON_F_INPUT | HWMON_F_MAX),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
 	NULL
 };
 
@@ -1154,6 +1159,89 @@ static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
 	return 0;
 }
 
+static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
+					enum fan_table_type table_type)
+{
+	int ret;
+
+	ret = xe_hwmon_pcode_read_fan_control(hwmon,
+					      (table_type == USER_FAN_TABLE) ?
+					      FSC_READ_USER_FAN_CONTROL_POINTS :
+					      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+					      fan, point_count);
+	if (ret) {
+		xe_err(hwmon-&gt;xe, &quot;failed to read fan %d %s point count, ret=%d\n&quot;, fan,
+		       (table_type == USER_FAN_TABLE) ? &quot;user&quot; : &quot;stock&quot;, ret);
+		return ret;
+	}
+
+	if (*point_count &gt; MAX_FAN_CONTROL_POINTS) {
+		xe_err(hwmon-&gt;xe, &quot;fan %d %s point count %u exceeds max %u\n&quot;, fan,
+		       (table_type == USER_FAN_TABLE) ? &quot;user&quot; : &quot;stock&quot;, *point_count,
+		       MAX_FAN_CONTROL_POINTS);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* Temperature to set when setting the fan PWM with pwmN. */
+#define FIXED_PWM_TEMP	(1)
+
+static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
+{
+	struct xe_hwmon_fan_info *fi = &amp;hwmon-&gt;fi[fan];
+	struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
+	u32 point_count = 0;
+	u8 clamped_pwm;
+	int ret, i;
+
+	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
+	clamped_pwm = max_t(u8, pwm, min_t(u32, fi-&gt;min_pwm, U8_MAX));</pre>
    </blockquote>
    Is clamped_pwm and&nbsp; fi-&gt;min_pwm in percentage ? If so use 100&nbsp;<span data-subtree="aimfl,mfl" style="font-family: &quot;Google Sans&quot;, Arial, sans-serif, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 500; margin: 0px; text-decoration: none; border-bottom: 0px rgb(238, 240, 255);">
    </span><strong class="rQesXe MPyX" data-sfc-cp="" data-sfc-root="c" data-complete="true" style="font-family: &quot;Google Sans&quot;, Arial, sans-serif, &quot;Noto Color Emoji&quot;; font-size: 16px; font-weight: 500; margin: 0px; text-decoration: none; border-bottom: 0px rgb(238, 240, 255);">instead
      of</strong>&nbsp;<span style="white-space: pre-wrap">U8_MAX </span>to
    be the max value.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	/*
+	 * Set the first fan control point in the user table to the clamped PWM value.
+	 * Use only the first fan control point for setting the PWM value.</pre>
    </blockquote>
    It says &quot;only the first fan control point&quot; but the loop end up
    writing 2 points.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	 */
+
+	for (i = 0; i &lt; MIN_FAN_CONTROL_POINTS; i++) {
+		writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan);
+		writes[i].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, FIXED_PWM_TEMP + (i)) |
+					    FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, clamped_pwm);
+		xe_dbg(hwmon-&gt;xe, &quot;prepared fan control point %d with temp=%d, speed=%u\n&quot;, i,
+		       FIXED_PWM_TEMP + (i), clamped_pwm);
+	}
+
+	writes[i].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan);
+	writes[i].data = MIN_FAN_CONTROL_POINTS;
+	ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon-&gt;xe), writes, ARRAY_SIZE(writes));
+	if (ret) {
+		xe_err(hwmon-&gt;xe, &quot;failed to write pwm %d for fan %d, ret=%d\n&quot;, pwm, fan, ret);</pre>
    </blockquote>
    &quot;pwm&quot; has been reassigned to a percentage by this point, so either
    print the original 0–255 value (keep it in a separate variable) or
    label this one as a percentage.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return ret;
+	}
+	xe_dbg(hwmon-&gt;xe, &quot;applied fixed pwm %u for fan %d\n&quot;, clamped_pwm, fan);
+
+	/* Verify if the fan points are set */
+	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &amp;point_count, USER_FAN_TABLE);
+	if (ret &amp;&amp; point_count == 0) {</pre>
    </blockquote>
    On failure point_count is already 0, so &amp;&amp; point_count == 0
    seems to be redundant.<br>
    Instead could this be more usable :<br>
    if (ret || point_count != MIN_FAN_CONTROL_POINTS),&nbsp; if the valid
    write needed to be checked ?<br>
    <br>
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		xe_err(hwmon-&gt;xe, &quot;pwm set verify failed for fan %d, ret=%d, point count=%u\n&quot;, fan,
+		       ret, point_count);
+		return ret;
+	}
+
+	/* Update the user fan table cache. */
+	for (i = 0; i &lt; MIN_FAN_CONTROL_POINTS; i++) {
+		fi-&gt;fan_table[USER_FAN_TABLE].fcp[i].temp = FIXED_PWM_TEMP + (i);</pre>
    </blockquote>
    Drop the parentheses around i: FIXED_PWM_TEMP + i.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		fi-&gt;fan_table[USER_FAN_TABLE].fcp[i].speed = clamped_pwm;
+		xe_dbg(hwmon-&gt;xe, &quot;fan %d user table cache point %d with temp=%d, speed=%u\n&quot;, fan,
+		       i, fi-&gt;fan_table[USER_FAN_TABLE].fcp[i].temp,
+			  fi-&gt;fan_table[USER_FAN_TABLE].fcp[i].speed);</pre>
    </blockquote>
    The arguments don't align under the opening (.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	}
+	fi-&gt;fan_table[USER_FAN_TABLE].point_count = MIN_FAN_CONTROL_POINTS;
+
+	return 0;
+}
+
 static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
@@ -1774,6 +1862,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	}
 }
 
+static umode_t
+xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
+{
+	if (!hwmon-&gt;xe-&gt;info.has_fan_control || !IS_FAN_ENABLED(channel))
+		return 0;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		return 0644;
+	default:
+		return 0;
+	}
+}
+
 static int
 xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
 {
@@ -1828,6 +1930,67 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	}
 }
 
+static int
+xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
+{
+	struct xe_hwmon_fan_info *fi;
+	int ret = 0;
+
+	if (channel &lt; 0 || channel &gt;= FAN_MAX)</pre>
    </blockquote>
    Add a short xe_dbg/xe_warn before these -EINVAL returns for clarity.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return -EINVAL;
+
+	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
+
+	fi = &amp;hwmon-&gt;fi[channel];
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		/* Check if user fan table is set else activate it.*/</pre>
    </blockquote>
    Where does it activate ? Use space before */.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		if (!fi-&gt;fan_table[USER_FAN_TABLE].point_count) {
+			xe_warn(hwmon-&gt;xe, &quot;pwm not set for fan %d\n&quot;, channel);
+			ret = -ENXIO;
+			goto unlock;
+		}
+		*val = DIV_ROUND_CLOSEST(fi-&gt;fan_table[USER_FAN_TABLE].fcp[0].speed * U8_MAX, 100);</pre>
    </blockquote>
    The 0–255 &lt;-&gt; percentage round-trip is lossy for small values;
    Better to add a one-line note since the ABI says a full 0–255 range.
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		xe_dbg(hwmon-&gt;xe, &quot;pwm read for fan %d: %ld\n&quot;, channel, *val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+unlock:
+	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
+	return ret;
+}
+
+static int
+xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
+{
+	int ret = 0;
+
+	if (channel &lt; 0 || channel &gt;= FAN_MAX)</pre>
    </blockquote>
    <p>Add a short xe_dbg/xe_warn before these -EINVAL returns for
      clarity.</p>
    <br>
    Regards,<br>
    Soham
    <blockquote type="cite" cite="mid:20261015190751.1268916-5-karthik.poosa@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return -EINVAL;
+
+	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		if (val &lt; 0 || val &gt; U8_MAX) {
+			ret = -EINVAL;
+			break;
+		}
+		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
+
+	return ret;
+}
+
 static umode_t
 xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		    u32 attr, int channel)
@@ -1854,6 +2017,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_fan:
 		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
 		break;
+	case hwmon_pwm:
+		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -1883,6 +2049,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_energy_read(hwmon, attr, channel, val);
 	case hwmon_fan:
 		return xe_hwmon_fan_read(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1901,6 +2069,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return xe_hwmon_power_write(hwmon, attr, channel, val);
 	case hwmon_curr:
 		return xe_hwmon_curr_write(hwmon, attr, channel, val);
+	case hwmon_pwm:
+		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 32bac74c4281..80642bee0ac8 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -82,9 +82,12 @@
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
 #define   FAN_SPEED_CONTROL			0x7D
+#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
+#define     FSC_WRITE_FAN_TABLE			0x1
 #define     FSC_READ_MAX_FAN_RPS        0x3
 #define     FSC_READ_NUM_FANS			0x4
 #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
 #define     FSC_READ_FAN_TABLE			0x7
 #define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
 #define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
</pre>
    </blockquote>
  </body>
</html>

--------------xtxVjSgP61sC0fJdQvlkY9Dx--
