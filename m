Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2200AC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 06:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACCC10E5A6;
	Thu, 10 Sep 2026 06:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWNTHDiE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394CF10E5A6
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789021903; x=1820557903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OmKBe1nDZA7aK9ragsR8VxHCTVOif0x1YmlCymoA83c=;
 b=mWNTHDiEvr0S3A/eEVyMNYBcc+lLuedvCcTMt2qPm37sY+TLTqJmdxE7
 V2tgRVQLOnP5Pl08W875Z7gnjlXFbclLymvUDElCHlc8I8G2Q4iMtTpAW
 3IK275Gkv5I0KIqYbfaktARaoeps/ydsyjcBFRPJ6FQMsTX5+rj7DupPd
 cL3cRlGzvKETxckiQwiWqOUzymEZD0YkObOUGHYoh8LtZ3GgSz3Bp+70j
 I+J8Fqqi8MS97Gwwvh/PoPteRg4t1ElskJfhLVnnDB8TikZacD+Vf03jM
 7td2a6UMEPxauBReghqT2LSDQNaJ8hqyW6tO+gRIJwsULvCiflWkoMeq4 w==;
X-CSE-ConnectionGUID: 0puAj0g0SoSCPuOb0C2R8A==
X-CSE-MsgGUID: 4mjPU+f9T7GiX9MBLht11A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91978865"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="91978865"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:31:43 -0700
X-CSE-ConnectionGUID: FUM2Le0/QZe+4r88MZWeMg==
X-CSE-MsgGUID: UQKQT0fXT9+ix9og7ZdArA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="270187104"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 23:31:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:31:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 23:31:42 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhOpDrCSHQBu3jiprmGXnUeQ639IFB4eBusCzEEe7Lfy+Kn+IXbbCxJ7HO2wgKXMcBVT0txeHsEbNcVHdixvvBvrbdAkjtnVY6G5b6qNWHZcN435Htw0jvFeuxaDBLA77uyZJCFDLgw1JKirRyEB98LnjRlUpWZd8uivWrUuq5gKDhGd3x9oEd4HkKL6b0Wmp1TfNNXjGA61QF/iaxPYFU+wn+cgUJaaZ3uEfm/gOYI0pMas6wLpntCr7h8aHnXn5L6mdUEhf/Q2srlxM6fw2awOaT9s3uApgh/893Ns69R1NOYvWnu2RwnNFzqqp81A7vpFHvvhuMBhjGilX4Eihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jrwwwuCGi+RkZ8z/U0a8nfCfRKgSWodFbQjCgaq/js=;
 b=yCS0pPkDdBano3lQeNXlSmWf0EIuw6Iq01jDiLClJml5o4fDeJJp3eOFSEk6gwMmC1oal0PmoiJE082nGs0YWtQlYPi9rMdb3v3hC3zHQrGOG+8m7nxBIOqOJNsE56iyRF+Qv25vr4ok13Y6w25jaAZYFqauOiR+2kGnwe+dxGbxoqf7goiqRJwLGz4a/1MyEdCZlea7akS1Rp1ZHNLuORZLD7IHF2yCktrSyc/IqFTIoErsV0I9pBJYYeWMzLVUiyd4S+I8tJc5NaGXrLCnZoj8T6GdZkeaFxEhWqcPS90j8Pk0TcwlG/bhA2m+FEuMuBXMb14jgee387X8w3Zivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 06:31:39 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 06:31:38 +0000
Message-ID: <be45d8ff-b084-4d15-bdbd-bc8087860722@intel.com>
Date: Thu, 10 Sep 2026 12:01:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <heikki.krogerus@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
 <65b77b6b-a21f-4631-9cb3-a5c0e07645c5@intel.com>
 <5ac64235-025a-48c9-ac18-893fcfd6db6a@intel.com>
 <01acf34a-3231-45c7-b8ce-e70ead34a44d@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <01acf34a-3231-45c7-b8ce-e70ead34a44d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0227.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::8) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f0d703-8db6-42d4-b130-08df0f052b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|6133799003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: H8QC3uj9TW1H8gHYzItLWvh7W/XpSkG5RDlBm7mZtwPYCDzKt8oslZ3S413GRhu9gOEvOYyH4b+vuokyV9i3RdFDqoisRoPbKdlQGXxUZKuGskSjDyZTSoUS0/UtL9q2iufiyx65NorOcnExeYCkZvUK474EjV9N1dyWwRCzMObIUTOj9dgwqfU6ucJwm3skPocRsP+n2705r/LMwQDnSBDYuXgZD9OuHHyCEXdgtStWz9H7Spvt/i5ZwPyYl6c7w5Yjb+01d2j+5ft+EB4WNTX/UCQ4C4N/eQyHZIaufr+IKMMEt7MDGnlJ5bUN+yij3R0TOuUyw9hK6ohkP+1a4TspN6QCnsuDohMlDUv7dKIQthk6qLNCZH1peO2dWP6ke+fQ5OzVIMCyw2O9zAF34RRLgqgVkYTMjLrekxpqGjXiImUQz5wtxhZLOLT2zL2Hx6sBuzQNoplXjYow/rLdoqD2aUj9wXVRL5jqkaphBpXc/ftFSr3xeC6+klVPuBrSv2zu5OMiuWfrBnr7E1vDJEqCmQHJrV1K/Sqc8nR40S+JnSGmSvu+qkR7DJ68YUSII2enwlF7D9g2lFl98g+fb7McQAj7rx2ygwH2OPeU6L459awshAm+klM7zsCo/Q6iueT4cLfV84dJZJA7rnovx0USsy5LV/AAeJxKAaFWhXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFlPeUNmWE9mamplN0hQSWpQbktZVW9lZVdTemtTb2FNYVlNT2I3ZUc3UWY3?=
 =?utf-8?B?MVk5Y25ZN0k2L2h6d3l5T2xzczRlaGljaHNGZ3hsZzRhT21EU3A4SXZtTUlV?=
 =?utf-8?B?OG90YmJpMjJVeFFxWUszRURZVnZlUi9FUnA5dVNIREFnYmJDTWNLSEw4eFJQ?=
 =?utf-8?B?dWRRZEN3QmxXRHhodUQwQWx1VXdZamsyRDF3VWpFQjc2ekJNUUROQUdJR0xs?=
 =?utf-8?B?VjFXY3h4Vnp4NS85THRPSnVQSXdmUUxMeTQydysxUkQxNWo3TW9zK1hqVmJI?=
 =?utf-8?B?dzFIREpUQ2U3anJRQ2RxMnBtOFkyakM3aHJ1Y1p2VDNmZjdNdENOM1k1MmlL?=
 =?utf-8?B?MUh5TFlBcE9QTHZNenMvOWphTlR4eGtwUDJlOHI2SEZzN3BJcGxOZlpjZHF1?=
 =?utf-8?B?TGNpcjhLODR3bjh0b3J2ZE9lT1pHb1NVWTFyQkl4cGpZa2IraWVsb2o0N0VU?=
 =?utf-8?B?QXNQZ3pHbmpzS2RPU1hYUG5EaTRhd1dDR0pJNWM4VVhWMGFvVEVJekd6TG5y?=
 =?utf-8?B?a3RxMEdCNG9BeGlFTThoeXhiaisxeUgzQm4ySjRZQ1ROeU5LRkVnUFp4VU5i?=
 =?utf-8?B?MnZ6OWdJMnB5aWROc2JVMFUwcXNwMzU3YWtCNmZPdGZPR2tuOWFlR29hQ3Vv?=
 =?utf-8?B?QXJrd1hQalkrbld0Wnh3bzdjczlmd1pQRVJraVNQZGIzL3ROcjI0S1dPalJk?=
 =?utf-8?B?Q29tak41VjMzWmhWOGpPRDBKL2xTcGF6VzJOV2pOLzc1elhwblY5QldKU0NW?=
 =?utf-8?B?VzU1YzhGMzJjQ3RjRG5tVlpHbGRZZlh2N0dpbXRoRW5PekpsalYrclU2cml5?=
 =?utf-8?B?UGNPaWxoV213aVEwcDJGZ0YrcEJrQ3FhYkN1RkU5bngxb2ZndGlVWlZFV1Jy?=
 =?utf-8?B?K3pISjN6RHJDS2NyUlFSK0l4Vy9TWFhLSldra0hSTmRMSjFXNmwyTWhKWWR2?=
 =?utf-8?B?Ymx1dTZNQWQ5UlFXTVA0b1h5dHViWVFzYmpENVNraWpKRGVlSFFLY2laWEs2?=
 =?utf-8?B?ekcrSllKVnZKc0REY0NVa25BTy9pQTVPakNKVTJ5UC9EZHgzN2Jxa1J6RUNs?=
 =?utf-8?B?Tmd3UVR6MmlMVitZSi9OUkJGYTZJcWJWekVvRnVEWG9WYjNiQjhnY1YzckJt?=
 =?utf-8?B?NG1PNXg5SGRKU09oM0dTUGJTcHJXeXhWM2FycnFOamlsQ2wrc003elJnMGdP?=
 =?utf-8?B?UHp5NGUvQ3lJWVg2RU5LVjlrb0c3R3NHRHhNMHRWcGRiV2IxNGtPN0psUGth?=
 =?utf-8?B?djM5OGFKU3d5bTJmQ014SFVGVXpEWHk2SGFPdm5qY3F5VHA1RTBkNzcyZVI5?=
 =?utf-8?B?ZGxZd0dtMUNUN3Jid2VVcVlzNlVYa2dPZlBNS0l0Wnp3RURjRElpQk83cGRn?=
 =?utf-8?B?b2FLeVc1VDlNL2VUN0NoTnZCZnA0Tmtaa3ZUajVOaGVLNngvQTRHb2E2Zjk1?=
 =?utf-8?B?R28zYUE1RnNudmNWaEFKTkhIY0pxMm05QlE2dFlWY3ZCTGk1dUJENXV5UmNO?=
 =?utf-8?B?WWtQOFZBMXNUZTBMOWNWN2VncUJBVmxJY0V1MjRXc3RDWjRjeUdvOGNQcVVO?=
 =?utf-8?B?UnROV1BZcktLMm4rVUZvVS9KSDJBUUxnTmxQTjUxVUVrK1JORUZNVGFldE80?=
 =?utf-8?B?Q29aeFNZOEE2Q1Q2aWJrdjI2aFFNcGpXdXpOV0dNWnhWM25ERDlwaEtLWjVZ?=
 =?utf-8?B?cittdThiZ2RDZy9hSlIya2d1TGQ5OGdZSTlST01XMlVoQXBYcm1QVkpFaDNT?=
 =?utf-8?B?MHNlVGJmK0NIWmpUK2RrRndSQ0U2bDdGSzJQS29QbkhUdE9MZFU1TWZ6M2FX?=
 =?utf-8?B?UlFrWmVReE52MVNBWmdZMzN1NHN3SmtBR3N3MklzeU1zZFZVZk5HMlJ6Mm9y?=
 =?utf-8?B?T0FDR1NIV0lGRVJPYlRMU1VYbEFXS2djeUN1enQ0dkxWZTUzVlFNaFRmc2JY?=
 =?utf-8?B?RXpoZytROUdjSEFpZzZzczFRYmpQVmFvTUhGZjFPOWRWT1hYNU5wR09PcTdM?=
 =?utf-8?B?a3ZNdzlxZVNDSUtEWmNINjJubE0reGtPa2RyV1pzdnRXSENVUzlhZWZoV0JE?=
 =?utf-8?B?SlQ3MndvczRNQW9jV3FIWFcyOGVNQjdaMGVCT0ZEenRZNFVycFd4RXBNZCtk?=
 =?utf-8?B?cGpPbnpydkVGVGt6T2xXamRueVBnR1lVajVUdW80MUJOcTdhVnlEY1ltNTlO?=
 =?utf-8?B?SGFBbkovanlUaFlQSmk3akc5YnduZi9sQmdXU01QbVQ3Y3lNMDI2V3BYYUhu?=
 =?utf-8?B?ZFIwcGNlZ3hEclpNQVlWWkJhUFcxWS9ONTJNc28zc2hZZVFmNzdmRmp4bmY4?=
 =?utf-8?B?Q01kWjA4UGh4dHFhOThadmJ0cm9BRmtCSDNtS2c0TXZlUlYxbUJHUT09?=
X-Exchange-RoutingPolicyChecked: t3NT2ZDXheZvjym8xQGGfJJ3Emk6wWk9XuyVm0T5bkDVRVUhAUVUkxNTGDklaoBarGqN+QuPOJCr3jPAnP3OAtuzC08oWNuza8hq7qkScevTfbfW5rzpQjulfviTzdG4P2Gfy3ZC9Yb6YKIVy3SqMuNhlOi0JU8+jTkfO/4conAbVAsEJnRuwszcel7hRKC/Dzxj3QQIb637PJ0t5LLCNFEzTikxcRBOiuGU24ceqyR1ow149pBZwjVKhLs0fdDA5ujUr8ongmXHLHNUwrseIon8vfARpEd8IAafWyGBZjGExA52P0YJ3L9qMgD1ZpMY9y4TwZRZIGeFK2d/cGZ5cQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f0d703-8db6-42d4-b130-08df0f052b65
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 06:31:38.8214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAUofaK6+GQ2BSys++sYRmqhhAkaoH6Y/+p6GBUxZnZ6st5G4YikgtDpUywMeXql+ZONC66psk4w4Q9P8V8O5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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


On 07-09-2026 17:25, Michal Wajdeczko wrote:
>
> On 9/7/2026 11:13 AM, Nilawar, Badal wrote:
>> On 04-09-2026 22:07, Michal Wajdeczko wrote:
>>> On 9/4/2026 6:06 PM, Badal Nilawar wrote:
>>>> Expose a read-only sysfs attribute, device_uuid, that reports the
>>>> GPU's unique hardware identifier.
>>>>
>>> Bspec: 53048,53049
>> Sure
>>>> Assisted-by: Claude:claude-opus-4.8
>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>> ---
>>>>    .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>>>>    drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>>>>    drivers/gpu/drm/xe/xe_device.c                |  3 ++
>>>>    drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_device_types.h          |  3 ++
>>>>    5 files changed, 54 insertions(+)
>>>>    create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>>> new file mode 100644
>>>> index 000000000000..1a4bdfbad8d7
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>>> @@ -0,0 +1,10 @@
>>>> +What:        /sys/bus/pci/drivers/xe/.../device_uuid
>>>> +Date:        September 2026
>>>> +KernelVersion:    7.4
>>>> +Contact:    intel-xe@lists.freedesktop.org
>>>> +Description:    RO. Unique 64-bit identifier of the device instance, read from
>>>> +        the device's CRI_DEVICE_UUID register and printed as a
>>> hmm, maybe in the user facing documentation we should refer to this register as
>>>
>>>      DEVICE_UUID(102008)
>>>
>>> instead of the meaningless macro name?
>> I will drop "read from ..." statement.
>>>> +        zero-padded 16-digit hexadecimal string.
>>> if this is UUID, shouldn't we print it in UUID format? see %pU
>> I this is not UUID, i will rename the node as device_uid.
>>>> +
>>>> +        This sysfs file is present only on Intel Xe platforms that
>>>> +        provide a device UUID. It is available to all users.
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>>>> index ef4746b7b5d3..68226fe0b659 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>>>> @@ -30,6 +30,8 @@
>>>>    #define XEHP_MTCFG_ADDR                XE_REG(0x101800)
>>>>    #define   TILE_COUNT                REG_GENMASK(15, 8)
>>>>    +#define CRI_DEVICE_UUID                XE_REG(0x102008)
>>>> +
>>>>    #define GGC                    XE_REG(0x108040)
>>>>    #define   GMS_MASK                REG_GENMASK(15, 8)
>>>>    #define   GGMS_MASK                REG_GENMASK(7, 6)
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 8583b2e9ecf4..e8db8871990b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -801,6 +801,9 @@ int xe_device_probe_early(struct xe_device *xe)
>>>>        if (IS_SRIOV_VF(xe))
>>>>            vf_update_device_info(xe);
>>>>    +    if (xe->info.platform == XE_CRESCENTISLAND)
>>>> +        xe->device_uuid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UUID);
>>>> +
>>>>        /*
>>>>         * Check for pcode uncore_init status to confirm if the SoC
>>>>         * initialization is complete. Until done, any MMIO or lmem access from
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> index a73e0e957cb0..a4d326159dce 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>>>> @@ -8,6 +8,7 @@
>>>>    #include <linux/pci.h>
>>>>    #include <linux/sysfs.h>
>>>>    +#include "regs/xe_regs.h"
>>>>    #include "xe_device.h"
>>>>    #include "xe_device_sysfs.h"
>>>>    #include "xe_mmio.h"
>>>> @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>>>>        .attrs = auto_link_downgrade_attrs,
>>>>    };
>>>>    +/**
>>>> + * DOC: device_uuid
>>> do we need this?
>>> you already described that in Documentation/ABI
>> I think I will drop the Documentation/ABI and keep DOC: section.
> hmm, but all other sysfs entries are defined in Documentation/ABI
> (which IMO is the correct place, not a local DOC section)
>
>
>>>> + *
>>>> + * Each Xe device exposes a 64-bit UUID that uniquely identifies the SoC.
>>>> + * The value is read from the CRI_DEVICE_UUID register and can be
>>>> + * read back through the ``device_uuid`` sysfs entry.
>>>> + *
>>>> + *    $ cat /sys/bus/pci/devices/<bdf>/device_uuid
>>>> + */
>>>> +
>>>> +static ssize_t
>>>> +device_uuid_show(struct device *dev, struct device_attribute *attr, char *buf)
>>>> +{
>>>> +    struct pci_dev *pdev = to_pci_dev(dev);
>>>> +    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> +
>>>> +    return sysfs_emit(buf, "%016llx\n", xe->device_uuid);
>>> %pU ?
>> Not needed.
>>>> +}
>>>> +static DEVICE_ATTR_RO(device_uuid);
>>>> +
>>>> +static struct attribute *device_uuid_attrs[] = {
>>>> +    &dev_attr_device_uuid.attr,
>>>> +    NULL
>>>> +};
>>>> +
>>>> +static const struct attribute_group device_uuid_attr_group = {
>>>> +    .attrs = device_uuid_attrs,
>>>> +};
>>>> +
>>>>    int xe_device_sysfs_init(struct xe_device *xe)
>>>>    {
>>>>        struct device *dev = xe->drm.dev;
>>>> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>>>                return ret;
>>>>        }
>>>>    +    if (xe->info.platform == XE_CRESCENTISLAND) {
>>> use .is_visible instead
>> Will add has flag.
> to be clear: my point was to move this check to the
>
> 	attribute_group.is_visible
>
> and I don't care whether it will use .has_uid or .platform field

I don't think is_visible() is necessary here. It makes sense for cases 
such as late_bind_attr_is_visible(), where attribute visibility is 
determined dynamically.
In this case, support for the attribute is known before the sysfs 
entries are created, so I'd prefer to keep the current approach.

if (xe->has_uid && !IS_SRIOV_VF(xe))

         ret = devm_device_add_group(dev, &device_uid_attr_group);

         if (ret)
                return ret;

Thanks,
Badal

>
>> Thanks,
>> Badal
>>
>>>> +        ret = devm_device_add_group(dev, &device_uuid_attr_group);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +
>>>>        return 0;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 180d450a6deb..6fdd16eac906 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -257,6 +257,9 @@ struct xe_device {
>>>>            bool oob_initialized;
>>>>        } wa_active;
>>>>    +    /** @device_uuid: unique 64-bit identifier read from CRI_DEVICE_UUID */
>>>> +    u64 device_uuid;
>>>> +
>>>>        /** @survivability: survivability information for device */
>>>>        struct xe_survivability survivability;
>>>>    
