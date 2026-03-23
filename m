Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16C1D58CDC
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 06:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A6F10E30D;
	Mon, 23 Mar 2026 06:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cblA7UPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0850D10E30D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 06:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774247875; x=1805783875;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c8QvcoSS7d4iQpTy3S9tOVcf4UnaLzcd8eipwp76Wxk=;
 b=cblA7UPunQl6VE6YldzGwVzV5Sm1NFOvOCST5KJI14bLwGOmjtCgpmGv
 4Q7wMb8pM48TUUJG+qaUXDfykuNbmltcrDpx7Jtd3XyzwuHXndAsZjCnA
 cO4HD3Ab6RYHNX01o3/RxMLuWm24pWaRN3nF+fbuaNZIVcZ/DfGb4lvcJ
 J0nae/M8t51QpU7yZddp7bTsoWkfh8y+qllAmL1yLhY174ziIrEKInQp+
 aAKI70rrzrZCb4ybaAUP5/r5QNaP8vzzRl6uuvcmDmpdL7D32I16GDTko
 o2rSt96lhM+t2KqNRngARRDBcH4CnjI6yQE/eaK7E1O/ao+TMRhrXby98 A==;
X-CSE-ConnectionGUID: PihcB5voSZKlfvy4ze71gw==
X-CSE-MsgGUID: 3xKBCqp3TIC5zfDFPSC8WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75123504"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="75123504"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:37:54 -0700
X-CSE-ConnectionGUID: JJbKwnyDQbCRZrw/KoV6ow==
X-CSE-MsgGUID: aMCyQ7ubRRmU4XVkXAZUhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="228009150"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 23:37:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 23:37:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 22 Mar 2026 23:37:52 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 22 Mar 2026 23:37:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMa6AWDlkDSIqAgTrRqSliBaYCYQfX6LIWeo7p9vpS5/rB4Ku5FZQygcII0OzgLb/BTvoKNo9VVceBTc11nPnOeHWPyjt0YJbIwS1+W8f3XBATgMr/eqKzXHF1+LY3TCwsBSeGe2YmwdYGgGj71GQt2WQw0NuoNnq+OzuTrxsu46WFDIF0Kll4Y+TdI5g+pwFrYfXoZCLN4dlRfKItaIpzFihxGavRtf8tRnYb1FAc6AvdgU1vZhx3tTxo0X6YNllEB+8iK002UYqd8v86t6YTt6713qTyP3nY7NwAFt2KLaG6vTpcVUZGiDDShKeHsE9SidlwR7lduGo3v6nf/Ulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umcr7G3JFfnJc9cmkqO0r66xuebll7Z4roSniVD8/0k=;
 b=PeWV2/yxC7FWeOjWEkptlfRNUz4b2sFd80MJ9x1psv8Q4ke+G/Sb/uOKLXK/PFo849OgxtWlYoFyss/IgJXCHp80OM+vZbDbMtmzgGCtrxSENH6pfRwy+57WMG2cCRD8prcY0OnO6vTSKHPu/hKBcYrN7sp41Tz82eqZHFzps2pNUKmGXqjcb7xlmi7vhqdmrGAYU+sW59y6vu7F5BUJqiAUWBItlXydWamGPLfrFQHMtI2fD88STV9AIEDTXRLHHmusmpR0JXCUdcXvpwCiD/iHFweA0gkpg+lCrgV0pxlL5qTB7+O87Bwci7x01o4RCFNqWgzpTY5oIa1XajtD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CH3PR11MB7369.namprd11.prod.outlook.com (2603:10b6:610:14d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 06:37:45 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 06:37:45 +0000
Message-ID: <44bee1ad-9499-41d3-be9d-06534df4cd2c@intel.com>
Date: Mon, 23 Mar 2026 12:07:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] drm/xe/madvise: Add support for purgeable buffer
 objects
To: "Souza, Jose" <jose.souza@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Mishra, Pallavi"
 <pallavi.mishra@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <c9c1f3065d8283936bca96abfcd46ba7141406a3.camel@intel.com>
 <aadld+E4gyjpAYY4@lstrano-desk.jf.intel.com>
 <7291621eb5811fc9a227420257046bd29032e9b9.camel@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <7291621eb5811fc9a227420257046bd29032e9b9.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::10) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CH3PR11MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ef5325-94cf-4c53-de97-08de88a6b148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: NUoZwpGLGXfN3ckQjm75K1/Ul7Gs5ykIGFYT9tLMC2ql5avejJ4G6cZlHprsRO21Yar6O+Lp/QArqlNlwp9G8q8c6Dlvc5vTpsUHKJYLYPjGFLwQ0mM66/V+P2K2A8cNHelnn6SgsyfHLumMsEg5x5VyCHuLf8tgzcp7T4lNcFWgUGJMTywcoO0lWQSQF6Uce4XZ01IMeRS4DH6OggOmdRAoadp1Vxkb9LdJ8r8u37dY4g1271ZyfhoFplpgKdlRS4FQwRKFGnTASFM64jkMsjFiEwoQWeo5sOV1TbRsGiiAyYstSaimU2Mb+LGkrd8vjmnMMIvY9aHasNA0UFanat7cBob6f9BqD88U4VGTx3qptRGYhTsigqC3GQJ8exFkCnRwmQM/wDqp5/TjTDxGeW3Dey5wn2UZY2xjZXpRoUJG9vw4Ec8K/qMNRxuzt0bWksgc07hME36IP9nuGxtgGZnoPG46GfvBS0GWphl2Sj/JP9lxG1bHvbifEclhuAcqLTJg4kynOrvKiOQU8a49gto+MAYMoIZP+ZGqOPLKC3lU4VOV8GC061JXV9nSd3O+3I+7vfpnCUoyPhbpHIvwgxI/XqlwHRatAPaNB1WvrfcDDAnSwCj1miho7bE2vb26HbZ40bSV+c4QFfYvyH0lJ0X7rE+BHMETZ6/T+Iy8qxEEZM4zscvKxIEBXeEqyVXNfn8Y7S8uTm+KCpEp1Qqj9O6nAFJhSv9jS3DLMKcK6JA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXJKYnR2NmpVUk1qMWwwb09qenJzTWJJNjMvYXd3WDB0NW9EQWRSaGRlb050?=
 =?utf-8?B?SUxzdEFYWWROQ0dQNWkvU3NkM2gycjRudjVIN3gxYUtlN1FDODJEbmRMbkRF?=
 =?utf-8?B?c1ZGMnYrN3ltcWdGZ0pGMFhSeEh3M2ZWS1hMcVBIbWsrNWJYdHZyVHRXemw2?=
 =?utf-8?B?N1ZncVh2MER5Rk9sOVQzRjE0OHBpUm5jeWtHRnpkRUpNS3l0VXdpTzFMNlBM?=
 =?utf-8?B?dEh4Y2R5cVliQWtrckoySVJRMXk0ZzJRcHFoRmRaWE0vc1dnVVhHaXpKQWFk?=
 =?utf-8?B?cFRlcFZnQlc0cXFaRmkvQTZjeFA4L05PVWJkQTJ2Z0V6dElZeDl6TC9iSm55?=
 =?utf-8?B?UWRyQ0l4Und1dGV6cCsvUkZxUi82YnU5WmZ0a1AzWC9PZE5iSGVhUEp5SzNU?=
 =?utf-8?B?U0RITzJXUHMxUUdXVDV2aklOU2NGckhMZS9PbXBvWmRhb1hjc1NiRDZSRXNy?=
 =?utf-8?B?L3BsYnc3YXNGRFc4aE1wYXpHZHFmNU9jeUZGOWpSWTZiWm9uV0cyK1ZZQi9s?=
 =?utf-8?B?V0twYWVxb1ljWmFVK21JdUFYRWY2NlJSMHRGeE01YU5jY3lERkR6RDZ1eFRY?=
 =?utf-8?B?UnpMMUVMOHBFUEJzZ2FhMk5Ba2lYWGQxeFRZZEp2U2FkVHA2TUdIN1NGSXVx?=
 =?utf-8?B?Nk9jUllmN3lGVmxVaGVDL1VZTzNnRS9vU2p6cGtIWEhWQWtBbTJWRUg5dnVr?=
 =?utf-8?B?ZDlUSTVQWjB3aW1WMHdKSTRXdzhyTWZMaFdpdGxVNEdqSEpmeWVwMUVwcUNn?=
 =?utf-8?B?U3RYeVZ5VHZLV1JPc2d2NUtxQVN5b1VmSnJMSDhJdlBMbHZWMjJ3cXpJRUxV?=
 =?utf-8?B?aTZwcHBocmVrWjJ1eEw3bkdPbEdBS1dndDBUeWxSSlRybWpmbFlubXkvNmxq?=
 =?utf-8?B?aHExakh1OFJ4SjQxSm81UStycWpySWVxaUwzeEVzdTZMSS9xcXVZZDl5SXRL?=
 =?utf-8?B?b3pyRGlka2hrK2VaTmJCbFRzRmtiTnN0cnFSdFVTTjlkdjlScGFoejkwT0Ja?=
 =?utf-8?B?SE45WDhUcUowT284WkpYYmh0WWYwdU80cXk1RjFSRWNwVW9BR1pYSy9EaUd2?=
 =?utf-8?B?NUZkT3d1bnJuMmlFcFFYVzVEdm1GMzBVbXVFTjRLOWxJS2Z1Q0tEclNqSVIr?=
 =?utf-8?B?OEFSSVExc0JCd0U1TTlISzQ3L3dpTUNPZFQrTXNJakZkV1R1WGJ4WGtzSEg5?=
 =?utf-8?B?cTdTV1BROUlWVVpoQnJRTjg1dmd5UUR5SExIcGFFcXZJVzdMYmk1UmZzV3lR?=
 =?utf-8?B?UXhhd3p5eVYxNUE3ZXdpSEY5NDREQmRHT3MzbndtSHZSRm44VGtCTzU4TDdZ?=
 =?utf-8?B?dWY1THdnZ21FaXR0MDlmdXR6NXQzUTBMU1hCbkhyRTRlM2hnQmhqaWNEdWNX?=
 =?utf-8?B?YVptaW1wMTBUaUhWdTJLRCtqNjdTdHFzMTNlTzVYUnRNQ3pNdXU3dU9Uc0hX?=
 =?utf-8?B?Qzd2eDJVVHB3NU15TmdHUDYrV1pzQW15NlQ2RlVXUDI5WFYrb3FVRC9ISWtx?=
 =?utf-8?B?bDZrT2xCK3Q0M2NONkhSYnE1T3c1OTdmaW9IbVZ5V2ZMVkdzTHM0NHBmMmhC?=
 =?utf-8?B?R0RrVW1QVDBNbnlJNDZURWhUN0h0eWplZnlmdTN3eGowWWlNeHMwRzZwd0dI?=
 =?utf-8?B?enhDdXZBcWQySEtOVnY1NW9ma25rTEFzR0ZrUW4vUmluZ3NWVUZJTjFGVU9j?=
 =?utf-8?B?aTFWdGFvSEVOYUN2bW9DNVV5KzNmbXYxcmFKdjE0eDN6cEhLUThhWEt1ZUNU?=
 =?utf-8?B?NHdSeFU3V2IyNlkvSDhKMnlXTXJOT3h2akVjTlZzb1FTbjNjS3BYWUxuM1BR?=
 =?utf-8?B?Yit3Nzh6WWt0bUFSNjY3MW1MVjRRVmNLQnNqOEsrS0dBWXhzdWRmZFNIeTdy?=
 =?utf-8?B?U21abmVmUG9HeXhjVkpFM1pFTFpXeExSYVA5RkRmQ1cxcUlBQndWeHAyY1NN?=
 =?utf-8?B?ZjJKY1NZeWJKYWcvaWhzRklnTktTQkRxOUlWWDV2VXNPWWtqU2ZZdjRWdDJk?=
 =?utf-8?B?ekdvYUpueUhzek9JNVhNV29CVElhVENZSjdmajBiTjR1NzQweFdBT1NyTm9K?=
 =?utf-8?B?VHdPN3pvSGwvZVBEVkVEcVVXaW43N254ZmplWWJOcEpYNk9IVXdXWlMrNVho?=
 =?utf-8?B?NS9zdmJpMkx5bnFvVFEvTTFwTXg4Sk9lRmpjbDVYVkMxa1JHZURCVVJDdHc4?=
 =?utf-8?B?OFlyeGx3eWNFZHFUNWdQTGQzRGFzRSt3UnNPU2pWajlHbytxcURQM2tPTGxx?=
 =?utf-8?B?eWVsTk1UOUNPZG1iUFFsamIzQStOZVpBR1FSejhUbHIzSmF4MkFuMFpkU3hh?=
 =?utf-8?B?elNNODVlcEhGb1M1dkJyU0EraXRFL2NvRGVuS1lrTi9kUUc3K3BDdz09?=
X-Exchange-RoutingPolicyChecked: Fx7lHlFDC6ST9NZtfQL/ZbhrixQ3M0IxFc4LaH/70gRz43ENLjUGKjQPGGs2RLZp++A6fRBKGXPxV+D7KUm0XAqvx/bUwanhsyj54tttk9ScpY+FwJRD6wRemk55Vvn4xFAy+f4jlDQsgCwiFS/b/lrIpAe61YkS7AyPhi4dFXfrJEK3HhvYJBNsCkHu5bmkTUOO42XH1XNo7gwM7VWzja3g/nMGy6JQvT7Xdi4lgniJN2G5PZ3awQqWuGsxcNj+daz+pf4xdvyQa/9TeW0oHWfYeUZ6qG0Wy/VRrsWTBD5jZGKsVjqJkUeS4KLeffhBwWqZ6t0ipii5Bbc7DI7zOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ef5325-94cf-4c53-de97-08de88a6b148
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 06:37:45.4845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yy5t9qN2N/mZ6NC1Vz/YGPtnqRoFQnDpwRg2/FCOhVEA9mY1pl9YHYfiC8ns8RujJBiFBpo43ADF2RuqwA2f0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7369
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


On 04-03-2026 18:59, Souza, Jose wrote:
> On Tue, 2026-03-03 at 14:49 -0800, Matthew Brost wrote:
>> On Tue, Mar 03, 2026 at 03:05:59PM -0700, Souza, Jose wrote:
>>> On Tue, 2026-03-03 at 20:49 +0530, Arvind Yadav wrote:
>>>> This patch series introduces comprehensive support for purgeable
>>>> buffer objects
>>>> in the Xe driver, enabling userspace to provide memory usage
>>>> hints
>>>> for better
>>>> memory management under system pressure.
>>>>
>>>> Overview:
>>>>
>>>> Purgeable memory allows applications to mark buffer objects as
>>>> "not
>>>> currently
>>>> needed" (DONTNEED), making them eligible for kernel reclamation
>>>> during memory
>>>> pressure. This helps prevent OOM conditions and enables more
>>>> efficient GPU
>>>> memory utilization for workloads with temporary or regeneratable
>>>> data
>>>> (caches,
>>>> intermediate results, decoded frames, etc.).
>>>>
>>>> Purgeable BO Lifecycle:
>>>> 1. WILLNEED (default): BO actively needed, kernel preserves
>>>> backing
>>>> store
>>>> 2. DONTNEED (user hint): BO contents discardable, eligible for
>>>> purging
>>>> 3. PURGED (kernel action): Backing store reclaimed during memory
>>>> pressure
>>>>
>>>> Key Design Principles:
>>>>    - i915 compatibility: "Once purged, always purged" semantics -
>>>> purged BOs
>>>>      remain permanently invalid and must be destroyed/recreated
>>>>    - Per-VMA state tracking: Each VMA tracks its own purgeable
>>>> state,
>>>> BO is
>>>>      only marked DONTNEED when ALL VMAs across ALL VMs agree
>>>> (Thomas
>>>> Hellström)
>>>>    - Safety first: Imported/exported dma-bufs blocked from
>>>> purgeable
>>>> state -
>>>>      no visibility into external device usage (Matt Roper)
>>>>    - Multiple protection layers: Validation in madvise, VM bind,
>>>> mmap,
>>>> CPU
>>>>      and GPU fault handlers. GPU page faults on DONTNEED BOs are
>>>> rejected in
>>>>      xe_pagefault_begin() to preserve the GPU PTE invalidation
>>>> done at
>>>> madvise
>>>>      time; without this the rebind path would re-map real pages
>>>> and
>>>> undo the
>>>>      PTE zap, preventing the shrinker from ever reclaiming the BO.
>>>>    - Correct GPU PTE zapping: madvise_purgeable() explicitly sets
>>>>      skip_invalidation per VMA (false for DONTNEED, true for
>>>> WILLNEED,
>>>> purged
>>>>      and dmabuf-shared BOs) so DONTNEED always triggers a GPU PTE
>>>> zap
>>>>      regardless of prior madvise state.
>>>>    - Scratch PTE support: Fault-mode VMs use scratch pages for
>>>> safe
>>>> zero reads
>>>>      on purged BO access.
>>>>    - TTM shrinker integration: Encapsulated helpers manage
>>>> xe_ttm_tt-
>>>>> purgeable
>>>>      flag and shrinker page accounting (shrinkable vs purgeable
>>>> buckets)
>>>
>>> I get Engine memory CAT errors when using this feature:
>>>
>>> [  240.301213] xe 0000:00:02.0: [drm] Tile0: GT0: Fault response:
>>> Unsuccessful -EINVAL
>>> [  240.301301] xe 0000:00:02.0: [drm] Tile0: GT0: Engine memory CAT
>>> error [18]: class=rcs, logical_mask: 0x1, guc_id=17
>>> [  240.302871] xe 0000:00:02.0: [drm] Tile0: GT0: Engine reset:
>>> engine_class=rcs, logical_mask: 0x1, guc_id=17, state=0x249
>>> [  240.302885] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job:
>>> seqno=4294967169, lrc_seqno=4294967169, guc_id=17, flags=0x0 in
>>> arb_map_buffer_ [3374]
>>> [  240.302892] xe 0000:00:02.0: [drm:xe_devcoredump [xe]] Multiple
>>> hangs are occurring, but only the first snapshot was taken
>>>
>>> Mesa creates VM with DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, probably
>>> you
>>> don't have a IGT test with this scenario.
>>>
>>> @cc Rodrigo
>>>
>>> Other issue is not related to your patches but drm_xe_madvise only
>>> works with non-canonical addresses and some time ago was agreed
>>> that
>>> all the user-visible addresses would be in canonical format.
>>> Not sure if we can do anything at this point but letting you know.
>>>

CAT error with SCRATCH_PAGE VMs: Fixed in patch 3.

>> We actually might be able to fix it to accept canonical addresses,
>> what we
>> can't blindly do is make non-canonical addresses stop working...
>>
>> It might create weird scenario for UMDs though if canonical addresses
>> work on some kernel but not others but perhaps since this is Mesa's
>> first use of madvise we get this in as part of purgable and only NEO
>> would have to deal with this scenario.
> Yes, this is the first madvise usage in Mesa.


Canonical addresses: Fixed in patch 12. xe_vm_madvise_ioctl now strips 
sign extension via xe_device_uncanonicalize_addr() at the top, so both 
canonical and non-canonical addresses work transparently. Non-canonical 
addresses are unaffected.

Thanks,
Arvind

>> Matt
>>
>>>> v2 Changes:
>>>>    - Reordered patches: Moved shared BO helper before main
>>>> implementation for
>>>>      proper dependency order
>>>>    - Fixed reference counting in mmap offset validation (use
>>>> drm_gem_object_put)
>>>>    - Removed incorrect claims about madvise(WILLNEED) restoring
>>>> purged
>>>> BOs
>>>>    - Fixed error code documentation inconsistencies
>>>>    - Initialize purge_state_val fields to prevent kernel memory
>>>> leaks
>>>>    - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas
>>>> Hellström)
>>>>    - Add NULL rebind with scratch PTEs for fault mode (Thomas
>>>> Hellström)
>>>>    - Implement i915-compatible retained field logic (Thomas
>>>> Hellström)
>>>>    - Skip BO validation for purged BOs in page fault handler
>>>> (crash
>>>> fix)
>>>>    - Add scratch VM check in page fault path (non-scratch VMs fail
>>>> fault)
>>>>
>>>> v3 Changes (addressing Matt and Thomas Hellström feedback):
>>>>    - Per-VMA purgeable state tracking: Added xe_vma-
>>>>> purgeable_state
>>>> field
>>>>    - Complete VMA check: xe_bo_all_vmas_dontneed() walks all VMAs
>>>> across all
>>>>      VMs to ensure unanimous DONTNEED before marking BO purgeable
>>>>    - VMA unbind recheck: Added
>>>> xe_bo_recheck_purgeable_on_vma_unbind()
>>>> to
>>>>      re-evaluate BO state when VMAs are destroyed
>>>>    - Block external dma-bufs: Added xe_bo_is_external_dmabuf()
>>>> check
>>>> using
>>>>      drm_gem_is_imported() and obj->dma_buf to prevent purging
>>>> imported/exported BOs
>>>>    - Consistent lockdep enforcement: Added xe_bo_assert_held() to
>>>> all
>>>> helpers
>>>>      that access madv_purgeable state
>>>>    - Simplified page table logic: Renamed is_null to
>>>> is_null_or_purged
>>>> in
>>>>      xe_pt_stage_bind_entry() - purged BOs treated identically to
>>>> null
>>>> VMAs
>>>>    - Removed unnecessary checks: Dropped redundant "&& bo" check
>>>> in
>>>> xe_ttm_bo_purge()
>>>>    - Xe-specific warnings: Changed drm_warn() to XE_WARN_ON() in
>>>> purge
>>>> path
>>>>    - Moved purge checks under locks: Purge state validation now
>>>> done
>>>> after
>>>>      acquiring dma-resv lock in vma_lock_and_validate() and
>>>> xe_pagefault_begin()
>>>>    - Race-free fault handling: Removed unlocked purge check from
>>>>      xe_pagefault_handle_vma(), moved to locked
>>>> xe_pagefault_begin()
>>>>    - Shrinker helper functions: Added
>>>> xe_bo_set_purgeable_shrinker()
>>>> and
>>>>      xe_bo_clear_purgeable_shrinker() to encapsulate TTM purgeable
>>>> flag updates
>>>>      and shrinker page accounting, improving code clarity and
>>>> maintainability
>>>>
>>>> v4 Changes (addressing Matt and Thomas Hellström feedback):
>>>>    - UAPI: Removed '__u64 reserved' field from purge_state_val
>>>> union
>>>> to fit
>>>>      16-byte size constraint (Matt)
>>>>    - Changed madv_purgeable from atomic_t to u32 across all
>>>> patches
>>>> (Matt)
>>>>    - CPU fault handling: Added purged check to fastpath
>>>> (xe_bo_cpu_fault_fastpath)
>>>>      to prevent hang when accessing existing mmap of purged BO
>>>>
>>>> v5 Changes (addressing Matt and Thomas Hellström feedback):
>>>>    - Add locking documentation to madv_purgeable field comment
>>>> (Matt)
>>>>    - Introduce xe_bo_set_purgeable_state() helper (void return) to
>>>> centralize
>>>>      madv_purgeable updates with xe_bo_assert_held() and state
>>>> transition
>>>>      validation using explicit enum checks (no transition out of
>>>> PURGED) (Matt)
>>>>    - Make xe_ttm_bo_purge() return int and propagate failures from
>>>>      xe_bo_move(); handle xe_bo_trigger_rebind() failures (e.g.
>>>> no_wait_gpu
>>>>      paths) rather than silently ignoring (Matt)
>>>>    - Replace drm_WARN_ON with xe_assert for better Xe-specific
>>>> assertions (Matt)
>>>>    - Hook purgeable handling into
>>>> madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
>>>>      instead of special-case path in xe_vm_madvise_ioctl() (Matt)
>>>>    - Track purgeable retained return via xe_madvise_details and
>>>> perform
>>>>      copy_to_user() from xe_madvise_details_fini() after locks are
>>>> dropped (Matt)
>>>>    - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL
>>>> with
>>>>      __maybe_unused on madvise_purgeable() to maintain
>>>> bisectability
>>>> until
>>>>      shrinker integration is complete in final patch (Matt)
>>>>    - Call xe_bo_recheck_purgeable_on_vma_unbind() from
>>>> xe_vma_destroy()
>>>>      right after drm_gpuva_unlink() where we already hold the BO
>>>> lock,
>>>>      drop the trylock-based late destroy path (Matt)
>>>>    - Move purgeable_state into xe_vma_mem_attr with the other
>>>> madvise
>>>>      attributes (Matt)
>>>>    - Drop READ_ONCE since the BO lock already protects us (Matt)
>>>>    - Keep returning false when there are no VMAs - otherwise we'd
>>>> mark
>>>>      BOs purgeable without any user hint (Matt)
>>>>    -  Use struct xe_vma_lock_and_validate_flags instead of
>>>> multiple
>>>> bool
>>>>      parameters to improve readability and prevent argument
>>>> transposition (Matt)
>>>>    - Fix LRU crash while running shrink test
>>>>    - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()
>>>>    - Split ghost BO and zero-refcount handling in xe_bo_shrink()
>>>> (Thomas)
>>>>
>>>> v6 Changes (addressing Jose Souza, Thomas Hellström and Matt
>>>> Brost
>>>> feedback):
>>>>    - Document DONTNEED blocking behavior in uAPI: Clearly describe
>>>> which
>>>>      operations are blocked and with what error codes. (Thomas,
>>>> Matt)
>>>>    - Block VM_BIND to DONTNEED BOs: Return -EBUSY to prevent
>>>> creating
>>>> new
>>>>      VMAs to purgeable BOs (undefined behavior). (Thomas, Matt)
>>>>    - Block CPU faults to DONTNEED BOs: Return VM_FAULT_SIGBUS in
>>>> both
>>>> fastpath
>>>>      and slowpath to prevent undefined behavior. (Thomas, Matt)
>>>>    - Block new mmap() to DONTNEED/purged BOs: Return -EBUSY for
>>>> DONTNEED,
>>>>      -EINVAL for PURGED. (Thomas, Matt)
>>>>    - Block dma-buf export of DONTNEED/purged BOs: Return -EBUSY
>>>> for
>>>> DONTNEED,
>>>>      -EINVAL for PURGED. (Thomas, Matt)
>>>>    - Fix state transition bug: xe_bo_all_vmas_dontneed() now
>>>> returns
>>>> enum to
>>>>      distinguish NO_VMAS (preserve state) from WILLNEED (has
>>>> active
>>>> VMAs),
>>>>      preventing incorrect DONTNEED → WILLNEED flip on last VMA
>>>> unmap
>>>> (Matt)
>>>>    - Set skip_invalidation explicitly in madvise_purgeable() to
>>>> ensure
>>>>      DONTNEED always zaps GPU PTEs regardless of prior madvise
>>>> state.
>>>>    - Add DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for
>>>> userspace
>>>>      feature detection. (Jose)
>>>>
>>>> Arvind Yadav (11):
>>>>    drm/xe/bo: Add purgeable bo state tracking and field madv to
>>>> xe_bo
>>>>    drm/xe/madvise: Implement purgeable buffer object support
>>>>    drm/xe/bo: Block CPU faults to purgeable buffer objects
>>>>    drm/xe/vm: Prevent binding of purged buffer objects
>>>>    drm/xe/madvise: Implement per-VMA purgeable state tracking
>>>>    drm/xe/madvise: Block imported and exported dma-bufs
>>>>    drm/xe/bo: Block mmap of DONTNEED/purged BOs
>>>>    drm/xe/dma_buf: Block export of DONTNEED/purged BOs
>>>>    drm/xe/bo: Add purgeable shrinker state helpers
>>>>    drm/xe/madvise: Enable purgeable buffer object IOCTL support
>>>>    drm/xe/bo: Skip zero-refcount BOs in shrinker
>>>>
>>>> Himal Prasad Ghimiray (1):
>>>>    drm/xe/uapi: Add UAPI support for purgeable buffer objects
>>>>
>>>>   drivers/gpu/drm/xe/xe_bo.c         | 223 +++++++++++++++++++++--
>>>>   drivers/gpu/drm/xe/xe_bo.h         |  60 ++++++
>>>>   drivers/gpu/drm/xe/xe_bo_types.h   |   6 +
>>>>   drivers/gpu/drm/xe/xe_dma_buf.c    |  21 +++
>>>>   drivers/gpu/drm/xe/xe_pagefault.c  |  19 ++
>>>>   drivers/gpu/drm/xe/xe_pt.c         |  40 +++-
>>>>   drivers/gpu/drm/xe/xe_query.c      |   2 +
>>>>   drivers/gpu/drm/xe/xe_svm.c        |   1 +
>>>>   drivers/gpu/drm/xe/xe_vm.c         | 100 ++++++++--
>>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 283
>>>> +++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/xe/xe_vm_madvise.h |   3 +
>>>>   drivers/gpu/drm/xe/xe_vm_types.h   |  11 ++
>>>>   include/uapi/drm/xe_drm.h          |  60 ++++++
>>>>   13 files changed, 793 insertions(+), 36 deletions(-)
