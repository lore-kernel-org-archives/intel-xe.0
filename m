Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94083606A320
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LFmCtTL9;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=JvDHohsY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E06310E234;
	Sat, 21 Nov 2026 07:22:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D694410E234
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795245712; x=1826781712;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Sp92x+V1xOj3PsX2hFgooocfk/XgJZjhDQkjhd+9Ko=;
 b=LFmCtTL9DNT0wpUiM1j+U658r7hIaXQ4GsL8BI9BQ43A0eSXrvXjUSuX
 TAbY5GhzYEV7KGrAs3hUvrD30u6xf50z/spyuU9Y3ZXxCcGR4cl4kPxFo
 H3S636mEcz6d/gBSsi+15J8o16PyCc2rBDirF/f6gMhXBYEK+XgoarN7p
 3+l89o8XPv/5uLX+OG+9V52GrVktNI6w4kTmAvAr/7rf3fc+Hx3hhZp8T
 lQ8/VtNP5nAPktd3BYY+BZfTe3jc6le9CcI/1Gzrc+8+VApm7OKQ2u9sb
 7iAfKEEwKHdB83e/jdWMCh5KXeB4uZs3ENoFlXrhSD5ze21hbrhhkPCTZ g==;
X-CSE-ConnectionGUID: xWup1dO4QVOVsL6DwPgntA==
X-CSE-MsgGUID: 0V0Q4SW4QxK+nAZJ/xtTtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4117995"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4117995"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 23:21:51 -0800
X-CSE-ConnectionGUID: eo/e3uq8Tv6aBfqAKfj/Jg==
X-CSE-MsgGUID: foCGXQsYSbGIFm6bli+81g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; d="scan'208";a="10866230"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 23:21:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 23:21:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 23:21:48 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 23:21:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBW5T3G45Qf/Lqffo9pmjBIvXhu0qApoLK2/TTQNS9SpDR/hPOQO327vpXkXCCHBF05A2fvJ6rFd5HuHJ3c5g9agDqYGV7F2jPBzschS2LIbd8iCvYyxc2urPlKukNcqYzypk1nb8Oq1ST1MurdSJNklVyzBMZFWsCcYthbqWJvhx+WG/Y6nsRhvYuwtIsljYlds1Y5oj0LsK+9y4/6WkYVI1Bgb4KErsWIrJU+xVndjKvElzNo7QDx9HpqDApeAoEQz5IhYqxOLU82fiI36ArCpVvxpK2+VeGt+GWtPneF0cPW956BtrlaPgbt5iAMUSdNL1Oy2ahi7yAU/hOigsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TRNRCELDC0eKZ9e8aj1Cn3CcQwoAlXZnQliu5759PE=;
 b=Yl/dYyzMlZjCrW5x3LsWB/zHSS+FMlPdxXDFyT3eS6n3NNO+OmLHm0cZuBubmy+JyluwlHdlzbvlggio0Z3cUbBbBwDqpLBRQ7tm3WQN19EUfswiSakI9HbllIvYL5e+Pn6pvzKkREsO8Or2mL5Rd2phQELizUXG9abxA414ziQ5+q0D5AuiHPUBjHJIQXH8uGHQIrMtidds22kEbJqGlt7wpKveESqjKelS80T3Jbv+auT4CM1AnJbOOGeA/7oZOt+E4JR+miOmH0LsuYyXdzH+d74wLkdkRz7fS/Mf1vqhBkeKdT/fFHLycrzFBwb7L/GnAbqEL64hktxkskZ9hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TRNRCELDC0eKZ9e8aj1Cn3CcQwoAlXZnQliu5759PE=;
 b=JvDHohsYjsPHaxldkIM87bxjjVDQr//CjnUKa/7LiPvU/gOAq7mUH5yTFFP853WLdtk7FcwumwP4n4IQcCI8Nkyjm8r6/dWvZo/7MRHxCcM3AHSHljKYNzU35nRptxHzPXYnS/qRImiYYyQi7LtZGsSp5DMHiMEFCJYoDHibGQE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 07:21:45 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 07:21:44 +0000
Message-ID: <221bc3cf-1ebc-48e6-a09b-ccc78ab0a81c@intel.com>
Date: Sat, 21 Nov 2026 12:51:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/xe_ras: Skip gpu_health sysfs commands
 during reset or wedged
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <soham.purkait@intel.com>, <riana.tauro@intel.com>,
 <raag.jadav@intel.com>, <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20261119163913.1760721-1-ravi.kishore.koppuravuri@intel.com>
 <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261119163913.1760721-2-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|PH8PR11MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 049f8c1c-2e8b-4123-0047-08df47a0188a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|10067099003|56012099006|11063799006|261028144727099003|261021121427099003|261102123227099003|261026140227099003|261022105027099003|20046099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4hglft1QzNQSA1CX63gHawHHPYSkGQwnkokSodTWaZA7xAmy08QGDQpLPWJr7nkgMtEzmK8LwH2eFvGNcxF4WhiDhLeSQY0NYAzHwz+fJnqoEeLa2qkYT2nfxZalapXBdn8QlVZCYUE/YibgwAePLZwiBEMiJDSRLXrgNEOcKvK8IWP3vnimaVpERmuLzzBF89QPZsWOahEgreIwMTVhbW0WSTna6kWHMUMyGSS2VKnihsARO2N7DBav9VsHWpd58OXNg7nXhHqDdohOljtB6WiD/3uu6zXRLVGVgQJFjMmz+Eoo/pOebwXveCb/psaVajWrXTRq/SSQ9iLZIl9sEPjAqEgeBUBZ1iMSE8K+8phFcLWglsf5PjOKOH1oJx0IyNes57167idIFKxMLtNkWeu5U8s2kdXvYTS6mouaRDXTFlXOUQYnZvqgojRr+vzEn7XxT0rPYCRVp4jrvSIjpeLjR17QMydZ8Z1YdUbSI3kgNmakphSO4lyUO8Yt9OvWXkDhk4YfzwAl9CZYzhlkJDDUOlehhSnsU9VQG3PSZgyvfdpjKJRJ7CTVliAJon8N0bj/xLxX1zOB5YCG2L9PYTQYckZCoswEkEXqAEf37yVUkj3WpFNEd+7a9x5Cq4WTjRLshHtY9jgcbDz12fhv0RgMTMXqK9C1I48ibI3skkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261021121427099003)(261102123227099003)(261026140227099003)(261022105027099003)(20046099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG1DZmFMOS9WRmUyZ0ZUMldNK0pRQnl1TVo1U29UWnl4NFBONjAvSlBzMG54?=
 =?utf-8?B?cVBDZXBPSFdJejZOMHhidnh6TWdhMWp4aGNMbWQwVlBVN3M3NHhveVg4RzlG?=
 =?utf-8?B?Q2Mzc0pNUTI2NDFZZzN6My9ndUl6Nnptc3VycUxTanFET1FnSitKbmp2OWhD?=
 =?utf-8?B?NnNGMWpnQmxDaWt2ZmtXYlBCUHNTdE5RTFYveVdRZE5OTWtuU200UVRuNStw?=
 =?utf-8?B?cUhSSHhVN1BRb2l4dkFleG1ZYW94NUJ2bWJQVzY2UjB3Y3RJNzVLb3hxdnJo?=
 =?utf-8?B?MkNGeHRTbW96UDh6ejBhcFhqMEhDSW10VG5sV21pbUNSSUw1emdKUVJlbmU0?=
 =?utf-8?B?MmVXTnN1amU1WnlKalc5UGMrOHArSWpqcTBRTkYrclpzVGJLNHhscmZYUSt6?=
 =?utf-8?B?Vis2TUJzTGtWQWZtM0FQTEk2TFdtWlZpZENBaEY2SjRHMkdESnQ0dEdxSU9C?=
 =?utf-8?B?eHQrTkhaT0ZwbWFIbXRaYVN4YXU3VXZkbDBoMXd3Rk1sMFl6eG5tcUk4Wkpp?=
 =?utf-8?B?QkJ1QjVaa21tK2xma0NEZG9sWEtnMWxoQkR4eERBVmZwcUNzZDV4Y2ROcE51?=
 =?utf-8?B?SnlzK3h4QnFtMlNsK0ZJUStXaWdZekdHK0VLdEs0cTh6WDFXbzc1VFRqUmhH?=
 =?utf-8?B?RHkrVEFwN0FzK3ViWTNxSzcwN0kzNXRUOXZCb1lvNUJaZHRJSjlBdmlON0Vo?=
 =?utf-8?B?NHgxekc4djJwaUJVOHpmdU1BR25aWmI5TkM4eCtmZE13U1I5UzNsU0xVeXhM?=
 =?utf-8?B?R3ZQOUxYTkU3UzJrTTUwSVhqRVpleW9HemVJMGNtT0wxVnRhZFRlb3FEV1pK?=
 =?utf-8?B?cGluTUJyRWVGVGtCSjEvVGxpTGhZSTdlUmR6Q1JNSUN3Zjg5VTFPbkx6bkV2?=
 =?utf-8?B?MS94MXFiTnRNY2JSRFBhb2VtWTRoVzA5d0IxakhCNkpDQlc2T0F5M25tNmlW?=
 =?utf-8?B?TSs2V3hVcXVIemxObWpmSUpBVzFMZnpYcXpXNm1sbDAvNkZaOHcyVllYREF6?=
 =?utf-8?B?aTFNeXdmVWpib0I3YzliU0Q2dGVvMFVPMURubWZadHhXYWRiNGNPY2RxYmp1?=
 =?utf-8?B?RUdmd3RBZ1ZCM2NMN2NHM0Z2NHJ5T0FKNDBqSnlwdDJ6Zm91bTJoaHJ4aXFU?=
 =?utf-8?B?cmFwMmlYYTBZMlF2emJZYUhreVlVUU96OU5VNUxvL3lUWmowbU05cTFhTE01?=
 =?utf-8?B?OEFkdFV1U0lpUGpSZ3ovM3JhRVNYa2ZRRW9PYUsyYkM4SXdqcFQwc1Jvcldl?=
 =?utf-8?B?dUtJUkRYbG1WL1NBbnpmT0NsN0ZUL0lNY0wxZ2xvYmVDYTB3ZCtSTnBmRWRF?=
 =?utf-8?B?YXFJWmxQbzNYR012aGhmZEw4WmY0YlM1Qml0dEd3MFA5dDJrZHBHbm5VYStN?=
 =?utf-8?B?VS92Q1B2TGQ0K01wZ0RtMWJhb2dWdmtKSDJlZXZVV1N0QUVtSlR5anNKdFMw?=
 =?utf-8?B?VGt1T05NdGZ1eEtrZkdaUE5oT2ZrMXEwYmlPalgvSm50VGhzblp3L1lBWHdB?=
 =?utf-8?B?Yi8vWXZFVlU2U2hLaGJVTU5JOVZWMm9MZUVXZGZ3b0FQN0MyUkJiTVEyTnZI?=
 =?utf-8?B?UUxCdnBwQ0NDWklPUFYxaXUyeTNwbG0xZ2ZDVVdaejZlNzBrZFlRWWpGTDJx?=
 =?utf-8?B?elJiM0tWdFA5THhzdG9yRkhCR0RzRXZMUW1ZbWFZSUdOZzRrMnp5RnhWczJ3?=
 =?utf-8?B?L3dPakt4Wk4rNm01dmFXdDRNakhjWjQyTEtZS0ZsaGVaUXJQZGJFbklKUWtQ?=
 =?utf-8?B?Zkh4VC9JMm16RjBhSlNDNGpqeW5TNEZXSWV3Uzd5SDZzU3dMeEQwNFp6ajU4?=
 =?utf-8?B?QXltNmdBTHZZcGdobzdici8ycU9IdWdkeDc3a0M5VG94Z2NaWnVhM0ZDUk9z?=
 =?utf-8?B?UmpKdHAraW9ZWEhILzZheityUFI1V0ozdDdkQ0ppYTYzcmZuUHZhOW5GNUpk?=
 =?utf-8?B?YkVNdUxVMVZPUWxENDRwOEhwOForQzM2Ym9zNkQ0ZW1zMWlGM25HallJak4y?=
 =?utf-8?B?ckRsN0NXd1oxWDVFemw3VDk4RDU5UEo0ekRFdmd5SHVrbEt0dmlmdERWb2Zp?=
 =?utf-8?B?ck95Q0wyN2Q5VXVvOG5WYkNYOEJFYndNR01aczhRbVROaFZxVmI2WFZzNmlz?=
 =?utf-8?B?bkFwYS82c3BLeUlZaHNDWU4yOEJyVkxrdFBqSjVOZlhhUVpWNEpzdE9Bckp5?=
 =?utf-8?B?d0dkY3huRlpUQVlkaGJLbStUSysyYnhlQytvZyt5MTVSenI0b2grZllaeW03?=
 =?utf-8?B?aDNzZDd2Rk0xcnhjbVJjcCtrQmkrYXNzdXpjTnYrRGozY2NNQm5QbUxKY3Na?=
 =?utf-8?B?VWp6a3hsY01zbE5WRVVLcUFvK3FBMks3UElubWZIY1VndVByVEhBSWhXTHJu?=
 =?utf-8?Q?6Ouk9hjLJN+1ij0M=3D?=
X-Exchange-RoutingPolicyChecked: w8wCvpPqaiw891bOfCq7Z4jGd6qJ3vO3BGIZZSfJRke1S44PoyoBCq3PwQ91WO6s+IW3m9t+ixubiHKVT+oYzerJy4auqUrN8+PhqKmM6rBfrPt/Q2ZbXUkrqiBrkIEt/ZevTH6V0ZjI/nTCX2plinZ0pCA2GWiq6rUawL0GCWaFYQ0mNHZW2VzBGGmuCtXELYsKrX6aNmUVghW/9nnVA3W0q1ahheHXvo5WsxbKjsHTKATZVnR0m1qoB2QO9OXjvsJgutX5XE9ICgFppyJfwJoUipN5EPH6wg4Q9pUzlptu9dgKV5pYGpUs9MjIqbdO5/GWSnkE68exviXZoXKMyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 049f8c1c-2e8b-4123-0047-08df47a0188a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 07:21:44.6139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J06B9tHUBleNH5ePBXukiOgu1YIShmlP3c4ugBZ8n9dnVcSBR0H95nxcJmRknfFekSqwTJjNarjvf67TdLTlkquf9pdTkwUhrS16NLI23lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 19-11-2026 10:09 pm, Ravi Kishore Koppuravuri wrote:
> Accessing gpu_health sysfs attribute sends a command to the system
> controller. Add a guard to verify and skip if the device is wedged or in
> reset. It protects against touching the fw or device when it is not in
> usable state.
Are we really touching the firmware? IMO remove that statement.
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36..47f6b91edd9c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -1134,6 +1134,12 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
>   	size_t rlen;
>   	int ret;
>   
> +	if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
> +		xe_err(xe, "[RAS]: GPU is wedged or in reset\n");

Is logging required here? if the device is already in a reset or wedged 
state, wouldn't that

condition have already been logged? right?

> +		return -ECANCELED;
> +	}
> +
> +
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_HEALTH,
>   				  &request, sizeof(request), &response, sizeof(response));
>   	guard(xe_pm_runtime)(xe);
> @@ -1177,6 +1183,11 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
>   	if (state < 0)
>   		return -EINVAL;
>   
> +	if (xe_wedged(xe) || xe_device_is_in_reset(xe)) {
> +		xe_err(xe, "[RAS]: GPU is wedged or in reset\n");

ditto.


Thanks,

-/Mallesh

> +		return -ECANCELED;
> +	}
> +
>   	request.health = state;
>   
>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_SET_HEALTH,
