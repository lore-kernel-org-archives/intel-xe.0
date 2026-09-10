Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DDFC79FB6
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 02:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE90A10E4E2;
	Thu, 10 Sep 2026 02:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSqzxlsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6C910E44C;
 Thu, 10 Sep 2026 02:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789008300; x=1820544300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4rAntp/OL5ji2l4udNIg+Chi4yHwFS7vhFFLgVxbM8A=;
 b=YSqzxlsLuqVLXooijUcI9EsPMLZ6xlT045YEfnwuZG6SbA+Xt1qVM2LQ
 g/9EW3fchrCObtC96F/hm79Inrdt2A5ucRgptAfKbU8D0wTqcA6HfgWgd
 7FY7wX2GQ+Rwjg9SwoOJ0d9XBBEWYNVJz79xM8s4X9jeZsIyuOyCo0x90
 n211+RGXMLmLqF/43lYuACdbxH0FLZ8UNIqy89f+2w4If0Ean609mgFa4
 19pB48wb8crP6X3jwxrIoGB/XPlfn6nv9cCoaf7eAkqS22X1cTDmi7SkC
 GjZZKULQ9DUdKz+GpKtSRJ3TdIp/p8yE+SHIEYOa/RSFb5Ml1u2Ic1kd1 A==;
X-CSE-ConnectionGUID: HyHEhKMFSJi4nTDU3ERwTQ==
X-CSE-MsgGUID: ipfrOoaIR8+IcUDiZ6Lbmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100969804"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="100969804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 19:44:59 -0700
X-CSE-ConnectionGUID: iZ1es5srSPKmM1ee6lqzsQ==
X-CSE-MsgGUID: evuFOdX9RZmiARIp3IsLqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; d="scan'208";a="273462946"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 19:44:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 19:44:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 19:44:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 19:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmrxwT2/+s1G84q0uMFiOZ4RzXYEVRM1/E7/0rx7QfbAt4dz7v1/eJWiOHU7Y7245REFOihJSmaXfg12FbFFS24+/nd+w90BWzEf9yGLeIrQ2QdryLnEGUj4zT8oUrv2clfevvj4QTEk5INVuFCISW+jkAaBgYKHMrPcIoUL+ElT34SrVMRAoq8oV0MjMW5Ucqlpdv1k2wjEQJ4UpCwI4G/79sDpippLBs5XrxCVDZiykmG8pQdN1af0DW7Q5DpWAwDyTNc1CxalCOdtNi+IqTnXqi9W6CoVE/Jva+Caykq0c4LRCAjtf4PZD1WnIpbeOr++k+liOksDcq2tG053xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FKTATvTHQx/eiSMjInsrPmPZkJjxIa3m8Ee3KGkB60=;
 b=FALntvDyx7wVXxYd8JkeDr1cWTgVN5xl8xAeoxOoDbrDF/GEH8PqvnksGSuIqRKxtF0csi+rLQSsqwBajyILtnZAKDTiL0wxvE+4qK+KiHhgi6LOmZFUc+GPVr3KY4hSRyEowVMXBqPC4U1fwMSpR92JoMadK6lsJPVu5tfqfGO8mRglOtkSrGV37uEZuJArYrcroPWAQGbVCEwSTwPIPO2f2P+c8W5JPGor+vQj2NZJu4ckNQUR9niWSaGZCHWIZ5hBr9PGG21Gjk6nWH0Vv/T/+0J2UZYDbDJLcgNTrDFxVLuuYmVm3q/hZoUoyDVVGUoyh6JWugwsUAnArS7yjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by SA1PR11MB6823.namprd11.prod.outlook.com (2603:10b6:806:2b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 02:44:56 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 02:44:55 +0000
Message-ID: <af412450-8a6f-468f-8e08-b94cb68f6a27@intel.com>
Date: Thu, 10 Sep 2026 08:14:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] drm/i915/display: Add crtc state for DIP
 transmission lines
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <arun.r.murthy@intel.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-6-ankit.k.nautiyal@intel.com>
 <c90084aa168dbcbaab68732b26b42c29ebcf2df5@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <c90084aa168dbcbaab68732b26b42c29ebcf2df5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|SA1PR11MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 89af1c93-48bb-4467-e75a-08df0ee57f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OJp0uIceScXOloIK9jGmSRf1DE6rthaAzs5k3AomERvb0dKjZIqrOoW9tOuR3vcKIepUC7IfrWMFn/mWjrNDgCJ9JXMSPh7vMtMQmZs6X4+9x6BRDbE3ig2kX9EXC/Fpl7466+TIABBz2L4yIwBJEwNjMAi5eTi1Gr+DTNzQwJ2DbefqqFF5V0XgUiP75KPon8dpXUKMWPac8Yc4RRoQa6OqrjrfFhJjO0lzN1PuoMB7MYQv2s8Rhnarz5YAA/qBgKWBZYYqoZj1Gzh0txkw/PvMaOjd596CV9OtSijSp1Sx9wFT/ag8YkymlmSXvyIFC51xhLDTXe3OtY+K3utN94014P+JyYXb5O2ZcZ7imbxF2/3d/GRwfv+SKVM7EKs4pcvXWwTznTo2QG4AfnlRcAv7JMdAm4m9dXqkKET5OkG++pKQwj2NxJnraSgGNhXK90yLyhSL3xNdJXm6aGzHxOOxCNKPXSTLfkl4WAZLFpxiGYUDxBN72tFNxysvOs/gLwcHsf+rTacld/gC9dqsTZ3zhmv7k7LoOmrzTdMKK2FY4OuK+dLAzh2s7oKU54ozdbuVCnin7adQmOpYHhkAPIefgSQF//ABnYaAZP0GyVm/28rot+c37/5pHQslc15ASxjxWRKew7sLIkeu27/fi8p3nPcAEzs3aG+NEXYYPYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlltcWRRVzh6WHlxMjFMMUZZZmJNUnNOc1BMeXVWWEZqTjVydFZVbFdtbTUw?=
 =?utf-8?B?MFpwL3E4SDUxTEphaHllR1JqMkp3cDhTQklITk4xNWVqaTNmK0JrMEVkSkR3?=
 =?utf-8?B?M1FHRTVGOFBBRzgxODE0cC9EMExnbHI5eWlZc1dyVUxDcGhTbW9LeS8vdEg2?=
 =?utf-8?B?QWJwTVAwcC9CazNaQUpUN09aazFTZnNKVHdReCtaNktWYnNVcExNSXFYclNp?=
 =?utf-8?B?RE04NU82czNwWWg0VGJxYmVTS2RQY0EyVXkzNFFpY05UdFhnM2xCTlJ5YW1z?=
 =?utf-8?B?ODFoUXZjWG93ZG0ra2c2Nk5WdU84TUl3bkF0WDNVdjFhZVkrNlRpRkhPUitr?=
 =?utf-8?B?SFRyV1JCZWRpQXVlV1k3MERBRjcxS0gvUTBhTWkyL3FLRVRVOXdJTldUTS9Q?=
 =?utf-8?B?T213cyt0RnZ1dFJSeE40RHFRQVlyZnFPUGg0aHk3eWZZb2FkMUpISjErYWhj?=
 =?utf-8?B?OUFLQmc4SVhtNDBvTW9sT0pMdFVNeUxzUVQxV3ZpVndkak5ZeEE3QlEybDkr?=
 =?utf-8?B?OEhITEhrZ1lQdUNxTzgyd1IxejlUdjlTbjRIM2h2VEJtZnhuM3BtNXovK1A5?=
 =?utf-8?B?aXgzdVVGaE5EU0RubGluWXJaeDlxR1ZYNCtkTTg3YWhXUTFqN2tHNndWTW81?=
 =?utf-8?B?Y0FCc0FjSGVvVW5idng5TFAyT1VFakd1b2dVTHQwc3dPUmtpallQKzV5QVVV?=
 =?utf-8?B?MHA3TjJDcm9Zd0UwRXZHTnhGSk9BbVN5UjRuT1Q5Ni9RZCtXQ2oxZDhOVjh1?=
 =?utf-8?B?bHA3aDM5amlwUEFXUU9OYUJWcmdDSER6UUhGTVFzSlJxVm9Qdmlnb28yZWFH?=
 =?utf-8?B?aUJxaFNEYysvOFNaa3NYcGkrSXJySVlJV0Z0Qm43ME9xM2RnYk1SOFl4cGI2?=
 =?utf-8?B?VnVHRXl1TEpMRDRsdGkvV0diM3pCZDg3bUVzMGxLSTFTOUJFZ1ZGOXVPOGNY?=
 =?utf-8?B?WERBQ0tRNGVGUDE1b1pRUk0zcFR3V1Q2Nk5OWE5pSjJnS25CcGx4dG9JK0Mx?=
 =?utf-8?B?akQvMDQ3a3BOdjdZZHJiWFZ0KzRUS0wzTFZXZWVMT2Myb0dYOHZvcGtpUktQ?=
 =?utf-8?B?dks5ODdMK2p4NjV0UVJ6d0RDb0JDcnRzQ0s3NXQ3WHlBMkJtRGtsNkhKRzdS?=
 =?utf-8?B?ZTg0LzY5alAxZmNJamU4Ym1UdXJlbDZtQ1I2RDN2bXlvVHFYZGFnSkFXZTg2?=
 =?utf-8?B?SDA0YjVDU3UwcGlNRHh5R25YR2N2K1g4MHM5VXBXaTJ5bGxpOTE4SjFGVld6?=
 =?utf-8?B?eG12dWNvVytPM0RscjA1eUkzVVFhbUtoVE1tUnVNcGN1Uk9hZ1g2MTNhZzM4?=
 =?utf-8?B?MUMwaEY4RWpBNytrcGduODdyd1NKQnBlTjJ6UGoya0Y3NkVjUWlzcjl1K05s?=
 =?utf-8?B?cGRvelA2c1JFQ3JqNURELzdDVnhtOEI1QlV1Wm5sellmQ0VaRGVOZEllWVRS?=
 =?utf-8?B?N0hON0dsMFUwTEJDZWhhNjV1eGhSK2tFdzdIbnpvTmpENFViWVlPNVo5TUdn?=
 =?utf-8?B?ZmQxZnJ5TGFxbFd6cTJ6Q25FT0tVQjdhT2tFVm5qRU1sSHJHNkRpdEtYVVdN?=
 =?utf-8?B?MFkvNjUybi9jUVJJK21oT2NDOXhCNEEvcmJYcGhIcjd6T21TM2JHbm0vd3pj?=
 =?utf-8?B?Yk9KdkYwQ0xKZFBjYzJjUXd4K2VDSm1QeDBTU1lGdmdDUnNreENmenB0L3ZV?=
 =?utf-8?B?UmsxVWxBMjIzRktXbmJmYXgxU1ZoTUVtais4QU9SZFZpaW8zT0llQ1Q4Ulc4?=
 =?utf-8?B?emxpY29OdjROTmF5NmpsZ044eGczMTJxaVIrdlRzeHVCV3hnZ0tIMm84V3NK?=
 =?utf-8?B?M0hiMnFxTG9odENqVVRzUzU3UHdQQlZoMHl4cGRXUGd3TXRmRDZ0bURFSjBO?=
 =?utf-8?B?dEtLUmNNdlJCZnBTYkcxYjVOWTNyVnlPM3hTRjFvWVJDdUlVbHo3eldZd3gx?=
 =?utf-8?B?YjNrMXdiN3F0emYvYzJnYWFNdWcvZE1vQ2pPMkNUMXNVZ3FOaGE1VGUvNENJ?=
 =?utf-8?B?dS9sSXExWSsrWURBU2Y4RHZsLzRDemJxa0JNWGNxVGFnTDFVUTRoR1dGS091?=
 =?utf-8?B?UlVEbWxXSzU5S25kY2ptajNJS2RQWWFaWWFZWmFpNFBKQm52dVhtSnNyQXo2?=
 =?utf-8?B?M1ZrMGZoWW9CcisvL3lLOFNyaHk1Y1lZazBkWUJOYjBDZ25kWHczRmtSWXlZ?=
 =?utf-8?B?eDNCdDJuN0NpRVVKOVpieXNRdURrbTdwQ20zK3czUG5INFJxbWtEZFdYbWNM?=
 =?utf-8?B?a1RLZ0hSaC9ZK2NiSmxkdlRjY29ieFV1SzcyaE56ZXdoM1hTUlB4eXJZV29T?=
 =?utf-8?B?Ykd5QTYzZ0k4WEs3SWdsdU8vWWtlZUF2SmlFWFJKajR3M08wLzNFb1BVbW9N?=
 =?utf-8?Q?ihEJRTwG4csK16tk=3D?=
X-Exchange-RoutingPolicyChecked: rCAUPN3l97g5LIkvnSTAa/ojU4BGA88Dz5l2ZFgzD9XCG9YnNUaxoS4/qZuWjjznjHKRtM1pq9qAt2y9z4VgAOdl6FN5VMkjGJUTKlL+H0AkAwSxeefVqFtd8rnifSyb/X5nCz6zE97ShYwQbdcSEpkYjTwTWvoLlzgJBzxRCtBgBzRjDkWnBJngkN3oSN6idOpTJn7pljXNJfJz9TbZS3IYUasItq4ZietrO22pcrbTYUZrN8BLlITVCRAqys2B+qWj1O/ZkWRtPHpEAJBo8uyNojYoLxGW7XMizL1hYXafRxkZLijy4Dp+uV4828ab7lu2u/5EfRXjZMfAux2hPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 89af1c93-48bb-4467-e75a-08df0ee57f1f
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:44:55.6577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Sfq38v/Mhp9OxWt/J0lIN7VMGQxLvoJLia4uDpyiA6PqhXpz5OZMm0+UkSRAnNbpa2TErA1jltpqBHcq5wCvi41kNQZrc2VKT+r2p6dTbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6823
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


On 9/8/2026 9:05 PM, Jani Nikula wrote:
> On Thu, 11 Jun 2026, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> The Adaptive Sync SDP is currently the only packet with a programmable
>> transmission line.
>>
>> Make a structure struct intel_dip for Data Island Packets. Add a member to
>> track Adaptive-Sync SDP transmission line. Include the new member in the
>> pipe configuration comparison.
>>
>> This will pave the way for supporting more packets' programmable
>> transmission lines, including the common base SDP transmission line
>> introduced with Xe3p_lpd.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dip.h           | 8 ++++++++
>>   drivers/gpu/drm/i915/display/intel_display.c       | 2 ++
>>   drivers/gpu/drm/i915/display/intel_display_types.h | 3 +++
>>   3 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h b/drivers/gpu/drm/i915/display/intel_dip.h
>> index 25bae4a04d6b..37507ac3e645 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dip.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
>> @@ -35,4 +35,12 @@ struct intel_crtc_state;
>>   u16 intel_dip_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
>>   void intel_dip_write_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
>>   
>> +struct intel_dip {
>> +	/*
>> +	 * DIP Transmission line, relative to the Vtotal.
>> +	 * The programmed transmit line is (Vtotal - value)
>> +	 */
>> +	u16 emp_as_sdp_tl;
>> +};
>> +
>>   #endif /* __INTEL_DIP_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index bdf02b67c1d8..c84ee0e865ee 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -5507,6 +5507,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>>   
>>   	PIPE_CONF_CHECK_I(set_context_latency);
>>   
>> +	PIPE_CONF_CHECK_I(dip.emp_as_sdp_tl);
>> +
>>   #undef PIPE_CONF_CHECK_X
>>   #undef PIPE_CONF_CHECK_I
>>   #undef PIPE_CONF_CHECK_LLI
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index aa4772a1c208..6cc3a4c2f17c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -46,6 +46,7 @@
>>   
>>   #include "i915_gtt_view_types.h"
>>   #include "intel_bios.h"
>> +#include "intel_dip.h"
> I understand the motivation, but I'd rather keep the struct here in
> intel_display_types.h than blow up the includes. There are already too
> many includes *and* this file is included just about everywhere.
>
> The point is, if you change anything unrelated to struct intel_dip in
> intel_dip.h, you'll end up rebuilding pretty much all the display code,
> and it'll slow everyone down.
>
> C really sucks at this. And embedding a lot of structs makes it worse.


Good point. I had not thought about this, though the pattern was always 
there, but it became clearer to me now.

I will move the structs to intel_display_types.h, and keep this in mind.

Thanks & Regards,
Ankit

>
>
> BR,
> Jani.
>
>
>
>>   #include "intel_display.h"
>>   #include "intel_display_conversion.h"
>>   #include "intel_display_limits.h"
>> @@ -1301,6 +1302,8 @@ struct intel_crtc_state {
>>   		struct drm_dp_as_sdp as_sdp;
>>   	} infoframes;
>>   
>> +	struct intel_dip dip;
>> +
>>   	u8 eld[MAX_ELD_BYTES];
>>   
>>   	/* HDMI scrambling status */
