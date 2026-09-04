Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B200C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 09:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEA110E13D;
	Fri,  4 Sep 2026 09:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDq+zmuE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8A10E13D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788512783; x=1820048783;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OqRaWbE62GwhIHOZa48KUkSyXddqclDRjOym6VFiOCg=;
 b=jDq+zmuEzCXlGMVApnbplNqO3vCHIiJh/4k7pBrejmOTbTOPVXXXHr49
 VSLMBCgBEAMJvGS+O1cwap6ARoqjl1PxW+GMewJtB71k6pHyilFjjAOn2
 YLwDlC4ruxVEBOJejM5/EIYzDg2TUD6L25iZEMTyYGl53UltyT+DSOlPn
 dEHPYIUSWae2fPfmiacPCY6mZ5CMWLvpiHnrkraH4y5ALriWSus7HGLil
 1K+6M5JJAsLUpirhuXI6cESN1yAsY9ZyvoZG8qA6y9zKO94dA42F1BfE+
 +jQoYcflDtCRcJzDVI6z6ZQUfh7cTLISDdiYboe110QjKzdewpEyMMG1h Q==;
X-CSE-ConnectionGUID: olfqzz39RJqRVLSFPsnIkQ==
X-CSE-MsgGUID: ubBYFHHLQKC6dkd1VltRhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92882337"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="92882337"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 02:06:21 -0700
X-CSE-ConnectionGUID: C0eooBnOSFaQ7OZyCRx6cw==
X-CSE-MsgGUID: XXt0H9kMTPCiHteyehhsUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="269450656"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 02:06:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 02:06:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 02:06:19 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 02:06:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTiAYc97CqMfXJLHkaRb9n4/HkTIW0IoqG/msJADKtlQDKnnw33wiI2CkDhXYvS6WJKhGlec/ORqx5HUrj0q7+i7hdZuqStLXMiWX9ENBaQOA5SOHYOAJ9sn2LKdLrvTGB65qRVzPjFgHAs6FbctvaNVfH/E60qah7xXlMSnwPpbw7ME4pBi/zQN4yRLE61H02T/KpswZ5nNUQQDhiwxQwU1ougLx9MvkgpB/zrA116tQWD6K5Ezp2GkENA62IG8mJNoBHOaMvWt1YI+2Utec65UeZRup6QSZKF4sLPmywgqXhwheqaVc7kfTLccRoiMJezf3knFwsseyIurtY1W9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYYpFy0F4Av0xt7fskqi7IgpBt/j8vUO/+pnZKvxHbU=;
 b=V1lZHZGBo/w2EWZjq2x6NIWjfoncsvZz7ukrf7f/GzLHLB3qJoBKdC0yzRcU9IekAO9+NY75hBuX3w4JHoqvcDYvTSItpFQKkMM/DMxSoqR/BH6R2La11D2+e5c8HwvDpUeHwAk5vo+OC9wqgIDlLuw9g8r9DK4LduPptph1U/FTzUS7aDtCV2tA/xsjHQiLGfNB2hJp01GvZrWkxEjdi8REdXJE/d9TySfJxvQS8anlvCVc4xbPio178+qKxD4+1xhzvRuRPn7ZwnjNIlp4m/qcXpQrwxCZ6Sp1sG1AI6BXxr+zrx0n/w6ll5boole4clCqOJdb5EkZImASrai/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB4859.namprd11.prod.outlook.com (2603:10b6:806:f8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 09:06:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:06:17 +0000
Message-ID: <e37b716d-3fcf-44b0-993c-70b39fe59951@intel.com>
Date: Fri, 4 Sep 2026 14:36:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/xe/sysctrl: Return error codes from
 sysctrl_wait_bit_clear()
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
References: <20260820101632.527214-9-mallesh.koujalagi@intel.com>
 <20260820101632.527214-10-mallesh.koujalagi@intel.com>
 <9894fca5-809b-4952-9edf-01b3d448d9df@intel.com>
 <3ae4858b-0bbb-4052-9c73-726643cf7266@intel.com>
 <292aaec1-662d-466a-83a6-dc820dace637@intel.com>
 <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <87216310-a723-43ce-ae62-6b85d2525bbd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB4859:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1c7210-6e1f-490b-d2e3-08df0a63c700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|3023799007|11063799006|10067099003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: dB+o4AowZrzqxF0uqw0lWe6IzSpXYGH6vkB36PSssjh6ulLOpCJT6tHuCCI1BF5ZqyW0NP6ocVF6Sm+JbAx620X+coCOzVVjL9YjNm5KfO16w2J6tB2byKsisjCBZjQuEvbF1xUdS564R+KUEp//ksg0YyxCRYMW76mvjhM5oO2iflV1dn4AOI7aaEcguDilVJk1ynhcWFoyEBGNJlbXa/1DPkazrnXsVJ/w+D/tq+bZ/lTQt6PxZnnqQoMsZ2auKb8+Ax8sFQ69N+GXHm4wYQhd6EuOM/PY220ii761pMstpQJULjKgQIGlDNd8hlcEiZh/f3i2wOS7Be2Cz72URAImHgC866BapvI3VgDzsudwGNoVKAXooE0d66Rlfs5ijUsRiMjMZaYk3CE982vTVVVO2i9lQtSIrvu7LN4UVVIE/dSMKwKrldB8evqg/TMjXaPaBsvP/pSKMedb7ENBpmdIs4ixZZ9uS/0bj93oz5kcuwI06HN+p9Rsbk1JSNP4sFHIpRzwE+xtR3G+B+EwJrbX/qtoXmDQEvGOOqSPzm++50Gu+5CNilgioO44KvFQJtxbUiQnujXhR/N6mT5TkEqA7jLTF0NgWrGQMRq8rXtvSwVUOppO6jSx1/zNO1f9bVIH3ZGBoyb3zhIgyAZvw0llznjZBYm7iWzj974un1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(3023799007)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXNsUCtYWkQrOFExOW51L2FSOEVFcFFGM1pKSTVFRFlEdFJLeGJwVENVdFV2?=
 =?utf-8?B?L29mcDNvSWp5UlJuaGRldWU5NktDUE9uUHJBR0dsVE82ODFndmwyZTFzTUwx?=
 =?utf-8?B?TVNmSTQwMUdIdHhjUktobzd2aHFWL1NIM2RzMkFndXVWWmRuK0JPMFNZczFQ?=
 =?utf-8?B?aUFWbktjcGVEbXpyNTFmT0t0QllINzhBSkFIaDYxT1BrLzl6Z0V2Smw4UHpk?=
 =?utf-8?B?UC9waXk4S2o5UmVBcm9YZVdYTDFUaUF3bUR4UzczVmM3b2puTWF5OXp3VHAv?=
 =?utf-8?B?eHBYTEtUQ1ArSWdSUGRmeXF1TTE5Ui9lVzJZeU5uTjdrdlVjb3Nadlc2S2VU?=
 =?utf-8?B?aU12M3FRK1Q1TzVRbDNEREtqNU5aL25zWjRTSEpwbXdVekxuQ3ZvTkphTE5l?=
 =?utf-8?B?Q3BBbEtwL05DQVhqZnJNVUtwTGwvY2JzV2RoSUh0d1FZcFJDWU1VblNyNDN0?=
 =?utf-8?B?S2FwZkF5cmxvTXkwNUk2MHZvMlZ1Y1JWNUV6d1gxUTBRc3dpTDFvRG1VaGpi?=
 =?utf-8?B?ZE9nT2Z4SThnT3VLN3NEeUpwbE8vZFltM01uYlYzM2c5SE4zNEpOZHBvYXV6?=
 =?utf-8?B?SjFQSC94azRIaVl1M1djbXA2MXlsQmgrWkV1WGxmejVpYWtjZmJPckNPVUlk?=
 =?utf-8?B?NitMSy9lZ2dHTW0zcnc2SUl6Tkd0dzVpT05WMkx2V3BsSndCWThaMFNDN0FW?=
 =?utf-8?B?RDV5MkNOZUdDaTFPR1YxVEtNZThVdWE1cTR6VTVEUlg5V25zYm9IRTEwM0Qy?=
 =?utf-8?B?aXNTMmcrZnVDSXcwRlZpUW9EZ3RmTnlvZFlISW1BN1F1YUNldmRGVS9ESncy?=
 =?utf-8?B?NzRISVVtWFlmTEtGNlIvNG40blR5ckVJSm1aMlVoOUsxZmM5MG9TaVJwSitp?=
 =?utf-8?B?UzRyc1NNVElnZ091SWR2QitFaFR6T1dTbkpQenp4QjdPbExUZWZPSTlZd0hV?=
 =?utf-8?B?TVlwRExybDZON2puWDZYbFIwYWdXdXNkbnVGZFJzVHpRVHJuSkR5U0VJOHNz?=
 =?utf-8?B?b0FhbVdYdHducXE2ZEx3cExmRmdvVDBWR2U3ZDc0RTB4TlQzcTNYbTcxeC9L?=
 =?utf-8?B?b2Uzc3hXQmMzaHF0L2RZUjFqM3VlVzZ0NFlhZjhaaWl2ZW1XaWJPckhXRGpH?=
 =?utf-8?B?NldvUHdnUzFxRHpXc0Z1OFJ2RnN3NjV2eEptc2wxUE5ZZmlORGJIZWZkWlNT?=
 =?utf-8?B?NHRuU25iMGU4dXdLQlptOXNYVzBscVEzY1AwdmFia2dESDNTRXd5T3YzMEU3?=
 =?utf-8?B?QUd6WHhKdDdiRVF4SjNYQ2NwY00veVN6cm9VOTM3cEpDSkZWcjVObUV5TkVh?=
 =?utf-8?B?MmczdklVdEJvWlBYVXVDa1RkUEFkYUpnY3B4VHhnWEZ4WE9aQ1RzQmN2NWNQ?=
 =?utf-8?B?aTdXUVNMU1piZUNCRHVBUHpWbCtONTlJYXozckRVdXAwOUZXK0RnVXNjTlMz?=
 =?utf-8?B?RitXOXdPSmhUeERmYndsb0RHbGZXTXJHVG9Cak5TWGxGdDRkK1ZOL3VBNDl5?=
 =?utf-8?B?VWhCR2g4eUNMbWoyVlhDeURHNzJsanhQamVVTnhFeldVSlZxTTVtelFoM1NG?=
 =?utf-8?B?OW5EYmZTUW10SGN0aVlYSy9WQlF6K3loQ2ZmQXQyb0hpajN0bnlOZDd4NFRR?=
 =?utf-8?B?VS9MRFF5Y25CaTZWSG50YUFiNGV3Z1JnR3Bld1FHMWM3RFZ4Uk43N1VhWEFB?=
 =?utf-8?B?cnlBb1hRa0FQMmdJOVRXZDVHY2pFdTNCL2lnZkg2Y2RUS3ppMXhINGdBaXpW?=
 =?utf-8?B?VUNrMzlVUzcvSmJrTTg3WkdaZkR3WncxcTFlL0JvTFYrMDNwQXhCdi8vWlA1?=
 =?utf-8?B?WFlONzJFT1ZMQnpGeTkybjlvN29GUVpOS1RYM0srQUg1UDJsZkd6UmVrL3U5?=
 =?utf-8?B?cUo2SjBkQ2wvL3IyR2pQc2JFc09jTFpPY2lXT3UwSlpENENQV0ZNbnY5bW1H?=
 =?utf-8?B?UC9zY0Juc0F3UGIyRkcwb0pNNVpGRHY4elh4UTljRUErUWxiL3FRN3FJcnhk?=
 =?utf-8?B?SVVvb2QwUVoxS1NCODlLdUlLbjdUZmE0NUMwRzJPc1Y3MlNnV1dZTXNNbmpQ?=
 =?utf-8?B?ckE0YUlhQXJnTExLVUlHYnZGbTNGdUFPSHlOSm1vVTJvUVc4UGd2RWVpWlVL?=
 =?utf-8?B?V0pxODJSaXhiN1ZCTHpNRG51L3doOTNUVUpROFNBMFFMK3poRVpEN0VoRHhL?=
 =?utf-8?B?Yi8rNkRNeUJMSEozVEZuQUZKVDU3MDZPRzIvdUV5NzFWTDJHSkhBejFBUXgv?=
 =?utf-8?B?cGs5RkMzWENTQWlVTFVsNU5pdldPV3E4Y3NIWXdZbVVSUzJJTTVQMnhETGxl?=
 =?utf-8?B?UnhhTUJ6SHVFVjVTbDZ1WGN0WDRkVUpORUc1ZCtBSkRpdE04ckhZdz09?=
X-Exchange-RoutingPolicyChecked: I1Ry95YKU8nakE9rdTFlBKUrTwRmUlY/isLSpMwdFPpNI2SBxuULjceTHYlHVOjNxdcitfzxrLqsQV2ECLIhnO57y5ofLElVbbjRU9iXuQUFPza36lQUNcK08m1t+EH2gtx7tncgEKp/QhyNzJdPvTaemU+bKILNX31hwtdoFv33YVygJCnLE4MeaU3Z5Zm2oQof3pPb+Adpf8uGfV6bOmNJDaxuQ2ZcJajZHIUJW2nRgAzshhA1dQfzYI5QhaudcKisd01gKIUsQqQIbLY1S69YoXHRjsGSMZTeup+cwdoVi6WPhqfwkbZMS6pD4QWsaNHgNftVudcYlEgOhi81Rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1c7210-6e1f-490b-d2e3-08df0a63c700
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:06:17.0193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdMYJXV87H7weOE2Q8yu4tJYU0UE4ruxpBY2pFlwOveB2O9tBG8A4Af6yTqaGN+oZ/P8HxnXkDrRzS5InK4Avw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4859
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


On 04-09-2026 13:55, Mallesh, Koujalagi wrote:
>
> On 25-08-2026 01:05 pm, Tauro, Riana wrote:
>>
>> On 24-08-2026 16:34, Michal Wajdeczko wrote:
>>>
>>> On 8/24/2026 7:44 AM, Tauro, Riana wrote:
>>>> Hi Mallesh/Michal
>>>>
>>>> On 20-08-2026 15:46, Mallesh Koujalagi wrote:
>>>>> Make sysctrl_wait_bit_clear() return an error code rather than a 
>>>>> bool.
>>>>> and update callers to use xe_log_err() with the propagated error 
>>>>> code.
>>>> Bit confused here on the usage of SIGID. My assumption based on 
>>>> documentation and discussion was
>>>> that SIG ID is only needed for error logs based on severity and 
>>>> requires a resolution which can be documented.
>>>> Am i missing something?
>>> from "How to pick a SIGID (the uniqueness rule)"
>>>
>>>   * A single underlying failure therefore legitimately produces a
>>>   * *chain* of reports from different layers, each with its own 
>>> SIGID -- e.g. a
>>>   * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by 
>>> the firmware
>>>   * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, 
>>> and an
>>>   * aborted bind as %XE_SIGID_PROBE by the probe path. That chain 
>>> lets triage
>>>   * follow a fault from origin to final effect; it is not a duplicate.
>>>
>>> so in this case, some sysctrl timeout may eventually lead to a reset 
>>> and/or
>>> wedge and/or runtime-survivability-mode, and this intermediate FW 
>>> SIGID may
>>> help in any postmortem triage, and if we don't reach that final 
>>> state then
>>> we can still provide some generic resolution based on site and errno 
>>> (COLLECT)
>>
>> What if the paths are also used in non-critical scenarios for ex: 
>> sysctrl commands are used for
>> general counter telemetry, gpu health querying and firmware status.
>> Wouldn't this be lead to a lot of sigids in dmesg in case of some 
>> unrelated failure ..
>> Why not only add sigid for critical paths when we are sure it will 
>> cause a chain of failure
>> instead of these prints on every trivial command failure.
>
> Ops I miss this.
>
> I agree that we should not add SIGID for every minor or noisy failure. 
> The intent is not to log every non-critical cases,
>
> but to capture important intermediate failures that can help explain 
> the real root cause. If we log only the final critical
>
> failure, we may miss the earlier cases that actually caused the issue. 
> That makes triage and postmortem harder, since
>
> we lose visibility into how the failure occurred. The idea is to use 
> SIGID only for meaningful failure in key execution paths.
>
> Even when these failure are not fatal, they can provide valuable 
> context, make debugging easier and reduce
>
> mean-time-to triage (MTTT).


Suppose a user uses invalid entries for gpu health or counter 
management, won't we be polluting the dmesg
logs with sig id and cper logs unnecessarily since these are not fatal.

Thanks
Riana


>
>
> Thanks,
>
> -/Mallesh
>
>>
>> Thanks
>> Riana
>>
>>>
>>>> How do these errors indicate the need for a resolution.
>>>> Do we need it for all kmd logs with components or for errors that 
>>>> need a recovery or can be recoverable?
>>>>
>>>> Thanks
>>>> Riana
>>>>
>>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 26 
>>>>> ++++++++++++-------------
>>>>>    1 file changed, 13 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c 
>>>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>> index e13eebaac1d0..ef847f0a8f2c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>>>> @@ -11,6 +11,7 @@
>>>>>      #include "regs/xe_sysctrl_regs.h"
>>>>>    #include "xe_device.h"
>>>>> +#include "xe_log.h"
>>>>>    #include "xe_mmio.h"
>>>>>    #include "xe_pm.h"
>>>>>    #include "xe_printk.h"
>>>>> @@ -34,15 +35,11 @@ struct xe_sysctrl_mailbox_msg_hdr {
>>>>>    #define XE_SYSCTRL_HDR_RESULT(hdr) \
>>>>>        FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>>>>    -static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 
>>>>> bit_mask,
>>>>> -                   unsigned int timeout_ms)
>>>>> +static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 
>>>>> bit_mask,
>>>>> +                  unsigned int timeout_ms)
>>>>>    {
>>>>> -    int ret;
>>>>> -
>>>>> -    ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, 
>>>>> bit_mask,
>>>>> +    return xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, 
>>>>> bit_mask, bit_mask,
>>>>>                     timeout_ms * 1000, NULL, false);
>>>>> -
>>>>> -    return ret == 0;
>>>>>    }
>>>>>      static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 
>>>>> bit_mask,
>>>>> @@ -145,12 +142,14 @@ static int sysctrl_send_frames(struct 
>>>>> xe_sysctrl *sc,
>>>>>        struct xe_device *xe = sc_to_xe(sc);
>>>>>        u32 ctrl_reg, total_frames, frame;
>>>>>        size_t bytes_sent, frame_size;
>>>>> +    int ret;
>>>>>          total_frames = DIV_ROUND_UP(cmd_size, 
>>>>> XE_SYSCTRL_MB_FRAME_SIZE);
>>>>>    -    if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>>>>> timeout_ms)) {
>>>>> -        xe_err(xe, "sysctrl: Mailbox busy\n");
>>>>> -        return -EBUSY;
>>>>> +    ret = sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, 
>>>>> timeout_ms);
>>>>> +    if (ret) {
>>>>> +        xe_log_err(xe, SYSCTRL, ret, "Mailbox busy\n");
>>>>> +        return ret;
>>>>>        }
>>>>>          sc->phase_bit ^= 1;
>>>>> @@ -173,10 +172,11 @@ static int sysctrl_send_frames(struct 
>>>>> xe_sysctrl *sc,
>>>>>              xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>>>>    -        if (!sysctrl_wait_bit_clear(sc, 
>>>>> SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>>>> -            xe_err(xe, "sysctrl: Frame %u acknowledgment 
>>>>> timeout\n", frame);
>>>>> +        ret = sysctrl_wait_bit_clear(sc, 
>>>>> SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms);
>>>>> +        if (ret) {
>>>>> +            xe_log_err(xe, SYSCTRL, ret, "Frame %u acknowledgment 
>>>>> timeout\n", frame);
>>>>>                sc->phase_bit = 0;
>>>>> -            return -ETIMEDOUT;
>>>>> +            return ret;
>>>>>            }
>>>>>              bytes_sent += frame_size;
