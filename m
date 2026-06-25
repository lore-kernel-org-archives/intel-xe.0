Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9D3CDE00E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 21:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B468210E2A9;
	Thu, 25 Jun 2026 21:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkM6cGSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8A810E2A9
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782422525; x=1813958525;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jG6mHQ/PhgJUfv6LhTsuNZ4S635WOi5GbKkXKlveQXk=;
 b=GkM6cGSqPX9KOfSPbsU7QOCKGFQps9dfSTt+uKf7GmZQw9NQ/cDKdZ/M
 p6JXnqGucrKhXaO/m4hiHS9gQ/65rSDKbtfMmMd+bc6gNKdk3J6hrdsai
 8tsWuK+o2wzUqJAz+Hf5RATcgh8TB6osuoRD1JFcyU4ShF2/jbe9FrKfd
 8Lab1wbvkUDnW/QBmWR3rrYg/Ihbk78GUeKFgFAkecbdtp/uLaRNfMw4C
 tqPMI721/p19GkJPh/EUXPVszRyHuffJpB5JlO/ZuaZl+kXh1unUk514Y
 QZc05wH2qwIncjlEbdos70cbORWXMZlh6TIXWkkMfyC1E44EX2J+vKybo w==;
X-CSE-ConnectionGUID: QD4DRIRKSqOx0kZpuQnStw==
X-CSE-MsgGUID: E3pXA0PYS5qopMgmNHa3jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83220173"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="83220173"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 14:22:04 -0700
X-CSE-ConnectionGUID: dUftlIlyQXWkt+6Hrk7JsA==
X-CSE-MsgGUID: XOg7pdAxRj6AqE1BbfDX8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="254692033"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 14:22:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 14:22:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 14:22:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 14:22:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v26jvtJaRQk+6YsaTxViyAMs1eZQf6vPRubHynYuzDEMl3sOSxp1Gaqndl4FKScPsWJawYznP3PSoo5ipieKLzEiNMf2NPECbDI8WEdRTEBOruPRIX//wT8sIery4Kg9DqEahZ7Fkzzfz4QGdUXDl1A8lgOo9QosCU3wRMo3zzOUDfWeM5PuamB6SqW0U+oDVj5uLkcwS9gu6o9/TtKug+Onf0FAPqqLmQRzgxf56xx+LsP05EH3vkiEsZyZ39+RicySTSvcz/oSE/uWKMiWoHvM7j4RQgKVvGrBQDhw3PrxyNMvOFkzqOxpVUIfb/56xye0PFnpEo0C86aniXNhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ+rn4RmSab30/I9JiIaxDkqTmcpqk7lf2T1NJ1IjLk=;
 b=ntB5o0bzg1+pw0VSjxptaIKxoC/NSaYQmlYqyjj4I5JoaydNqDaltzBocR7/cgn5ymOvZ4AYey8Rmes/C61YsB+c67CeSXuL+yY9UqHo1EztzN7TcBCVlyWLISb7Bc9gQdcJ64bd07QOG1uPjUI+E/Id/AREq4TlSTUUFY0v0V3wKwFEx/aKl2+G5Vsy39s3xtOWOi01UPrw1rchyDmIvLMIHYV1avEUq+ZVVmVgUiHWmPgnb90aiALh3qrbj/abWk3jhk/gTbJxmFIqDVtVg2AiF5E4GBJNlltoGmDbyxUa4DuD8JoIUlSgp5Tm6PbO9A5epIG+jZAHlJFgdTw9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 21:22:00 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0159.016; Thu, 25 Jun 2026
 21:22:00 +0000
Message-ID: <13a16602-9bce-472e-a89f-d205f0d2afc0@intel.com>
Date: Thu, 25 Jun 2026 23:21:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Do not return an error for unrecognized VF
 events
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20260624095634.1250956-1-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260624095634.1250956-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0065.eurprd03.prod.outlook.com
 (2603:10a6:803:50::36) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a0614b-cba1-48d0-a627-08ded2ffcb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Q1BJFj3C920A6d16S5QePtY55bl0Gc+rVXPEgBwcsb4uu3paOlh5MjLml4OXEqkQW+03/6kbUk7HJ2BT5tX8l132AvwVNP5QqiuYVEQ/8zIHvkzdW7bpp6e5nEVSIQlnNBqHRPZM54Z7P9udJTEO8e3/I+kmnB3ArUM3kcwDZjISzFM/HU4GZWgibI8gAZf7V9acxqq6HjrEJMIz5ztLdcG7vuDrlNx7kETcmgGZUslSVapYxwpKKIzN3GI6MK7C1zCxdiGbn+S2yMrgDGk6XrPjovt+QN9cADfSYv+sQz8nAUYRxaYJMDPC7Ddecn5Y4J4Nz6RoZJ2jCPonY7ylteq8Xz9UHhe+bp0qcl2+vTWPfZ9PPZgD2vA16MhAqw/H+sEdMyjUc5K2kiFxoOiWP0kFG2r+NAZDw0XpR9JzbldqfT24AKzyxPhkep8HCe4apCuU+Jyc/gUifnr0/kw3Rrf9t9dMpGHWdrn43+GaVEKHiw7NE149k0RpkzE8MLoaCZJeczMh9bPV0XB5p9d7OOz0evbfo72V/K/BeQ2zQvuzf710vGY0uWTyGYRNNOav7NMZFcLl3N9aplu2tSdZzB/wbMqUqrXoOPx4m5K33XqDH6c4B5az5xtCsBNa0DR3iSWy9UzYiWMM2pEBN6raKivfv983E6uW9h6XBsv7cYg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VytEYjJBSi92dW9xWG83WVZRcnByMWpUdFdac1dnbEQ3LzBnVWxXVUlRcVFE?=
 =?utf-8?B?VUgrcHA1MmRXTytua0JMSG5lYSs2TjArMWhKaFh2MTRmT2ZZaHVDWjN1K2NV?=
 =?utf-8?B?Tkdodko3bjlVdzEva2x1SEppZmF6QkcvWjJ2L3RrZzBUd1UxbFJKME5IVkcv?=
 =?utf-8?B?emNzS01BYXc0N3ZDbXlNRWhUL2JxRjJ1QXpZZ29FL21VVzZUMzVtZ1RIUGF0?=
 =?utf-8?B?TWMwUG1tMExpZkdoYXdzWHNvRzYrb3YyZ3hLRFNoTzE2eVE1VGF4S3dvanZQ?=
 =?utf-8?B?K2V1RjlGV25lUDQyK0JjRGRWb0VWSXR2MzRKOGtoTkIwSkR0TmdpelZrSmRI?=
 =?utf-8?B?NEZDWExIQUxEWCs5b215eWV2eStlYUk1RW1sdGpSZFVPU3ptd0FtZk9RZzlU?=
 =?utf-8?B?UlNrQ09rbUtJcjV1bTlZdVhqSlVtWVdjcEtRNG14S29QczlaMmNiM2t1NkhQ?=
 =?utf-8?B?UHd4eElNb0kwbjA3bitBQ0hvTkYydmtQaWRtdTZhZnFVYTVyRDFOMXRWT2R4?=
 =?utf-8?B?R1NSQThiWUVLOG5sc2JLY3lsRUxTRjRZdHJuc2ttdjQ1RmNlT1pJT1Y0V2FQ?=
 =?utf-8?B?MlBDdFprcHN4TFJkdFhDZjZPc2pKU1pXTm1OSk9qeVB6WWMwdDgreDNFazhy?=
 =?utf-8?B?eHdUMW1OSWd0QnI1NTRJTDVsblA4aDV1UThNNlJHbWZVK1JRZVNGQU42ZjdG?=
 =?utf-8?B?dktUdGRqL1dIWFIvSjM0VnZLSDh3Sk9LTVQrdE80K010cytwaGRuU0MwazJS?=
 =?utf-8?B?d0ExV2wxRjZSdTF5RkorWHBtc0pRODlTMUU5KzJHMEp6MytVN0p1bnZ2RUlz?=
 =?utf-8?B?elZUL21odXdVaXhScHlmRHhFNTZIbjVUZmU0S2Y5a1ZsM2NCeVE2NmZ3SkRj?=
 =?utf-8?B?QVhCU3dBcHh2TkVUTWdFRDdRaTJ4SEloRU45T2YvSU5QazJRdWF4d3ltdVYr?=
 =?utf-8?B?QmpiQ3BTVWhNUEVKdjdNU0IvK1pwSkYrWG9BamFockxtaUtrQW03N1Bxejl2?=
 =?utf-8?B?RzNRUWVDdHgwUFBxUkRGU0JpdnRmY1FzR0diclFoNk13TGVSUGVJcm5ER21Z?=
 =?utf-8?B?RVh3YzUxQnJNNFBlQVQxTERRekJwT1hhVG9CZGFpL0pqeUJzZmgzVThBVER0?=
 =?utf-8?B?UHUxcmo3dDJDSjY0djBPbXorNTUrY3VmZlAwTXFTZWQ5VHlZS2xINjdoaktU?=
 =?utf-8?B?ekxGZjMvZW5GaUFvYkE0UlVOTnlnekRsVVZZYUZVZnpzZXBiSWh4MS9ReVFS?=
 =?utf-8?B?ZXdHL1gzZTR2cDV2dzN5akI5VlkyQjdCTXU1eHQrdk9IS2JicEZCUUx2SGRs?=
 =?utf-8?B?Z1lGYncySzZ6SzFjaWNIWXlWcDJSSy9HSVVFalpGQlNmYU9FbWdJM1hzSmM3?=
 =?utf-8?B?WWloTlBlY3o5QmptVG84WUd5NVZ0TmRLbXB2WGNCUm1pZkR2UnlyakxQbFJ1?=
 =?utf-8?B?ekZMQS8wS0xFaGxkNmNRclVuSWhEMVRmdjJOQkdvWHNUSzZTU09tbVpLSEdk?=
 =?utf-8?B?V1U2RE5KRitWZW80RURYaTBPNkJRbGUxd0lrdGMrS1VPSFRaNytCTmRXUHRK?=
 =?utf-8?B?VWZRb3BnRUFJWkJlSmJxam5WY0IzRVg5NlpvY0laaW5KQ0QxQ2J5RVNsUWRx?=
 =?utf-8?B?ZitKeEhhdjdhUGhlclNCT2h3YXpSTVlSTjNUZXB3YTFyeE5HTFZwSmJ1MVZS?=
 =?utf-8?B?ZjFQR0FYbDk0ekdrVjlySDVsclZBOWJvQ3oxcTAwcU9aWCtOWWV0dHZYYkRG?=
 =?utf-8?B?OVRXS2dhRHZZRlhzbU1VRFJWNjBsNmZmSnFiRjNGMDdiT09QejdmcktTQlAz?=
 =?utf-8?B?cHh4WWdpdGhjSWFBWDJmYTA2TlNDOXVnYUJ3VjdZWFVhN0M2bVh5eThFcG4r?=
 =?utf-8?B?WWRXRE1ESzZKRFk5YnFyMDhkRVFhQmdCNS9rNU9ISmNRNWFPQlUrSE1ORm9s?=
 =?utf-8?B?TzUreUpLOFAra3hiSFZWVjE4aVJOcVRWZmNSdG9SdCtXM1lZYU8xMC8zMDJT?=
 =?utf-8?B?cEtYTHlERCt2UEJpSkZJNW5MVHJVbkw4ZVJkb3FndGhhbVFiQ0pMeFVCNWxn?=
 =?utf-8?B?aFdtdXd1RWRqLzVJMzc4V1pWakx0a0xJNkhYS3FwZEQ2YWZEdEY1dFdSZjRC?=
 =?utf-8?B?dkNXRXhWR1Q4ckxCa3lid2ExYVg2dWhxRDVKZ2tJMmEzVGlQb2JTSGxjb1g3?=
 =?utf-8?B?WGp5MlZPb3BGd2JmWnZKNVJGOXk3WitMK08xU2hwbjUrL0JiNlowejRzdTRM?=
 =?utf-8?B?ME5Cc1N0NnBoRTEvRW5OMHMxbjlqUUtlOXFOdmttSGRteUxQN2ZsN0RjZEc3?=
 =?utf-8?B?dk5qSk5aZkFjWmlISU9IbkRPNHBNZUgraHJMQjVkVzJkVzRvVzZkLzJyKy8w?=
 =?utf-8?Q?X6x2N1gnMVKiiARo=3D?=
X-Exchange-RoutingPolicyChecked: Gj6U5b0EiGbdZC/nH1AATXO7/IKsfP1t0FRpEdVpAesyA9qp4Eb4Sjf0ZmQV/FS1pdDmGkUYgY6j7bfhpFUYJUKiKYw2Fae7x0TN2JY7wjUsxgPqvOuBZZ34lf3eKTpiLZczvM4Jg6cOn3D02k3afC+2ZSe9ncYK56GzjsNqqoeKYQvI+R0tgiSEcdHeEHDUgf2q8tBeLvDQHSigGcM8ae+mdD02lA3cDBbN1Z2AF9nxWJXCH5zC15FfALypg617Uje1r9wSkPvxV9JeegJTiXT7ADVxZSNJG1JLL0sBi7onFcDPhXsRDI6PnUE65JTelDL5feuHpgoK2JRhbhmosw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a0614b-cba1-48d0-a627-08ded2ffcb02
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 21:22:00.1072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GReMHIbef8b/cQC0/HTbEpVL/P/6WncBTl33ua2sJAlV57X4F8H+gWg3BJ73VVWESoHXIf9lQ9Jys1tXMyiDZu0UKeCIDs11aACCs4+dso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
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



On 6/24/2026 11:56 AM, Michał Winiarski wrote:
> Notifications about VF state are generally not considered critical
> enough to warrant PF GT-level error 

hmm, but without that error we risk that we will not notice that
we missed to implement handler for such notifications

> and subsequent reset.

hmm, actually this could be our "problem", as initial idea of returning
an error from the CTB event handler was to print the whole CTB message
for inspection and later we also added the capturing of the GuC log to
figure out why this message was send and if it is legit, all this done
by triggering a reset to leverage existing capture mechanism

maybe we should change the CTB code instead and trigger a reset only
under a debug config ? otherwise, if somehow we still have some gaps
and GuC will keep sending some unrecognized notifications, we might
enter an infinite reset loop

@Daniele, how you see it?

> Convert the error to dmesg log.
> 
> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 058585f063a93..65f015d0ede51 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -1973,7 +1973,7 @@ static int pf_handle_vf_event(struct xe_gt *gt, u32 vfid, u32 eventid)
>  	case GUC_PF_NOTIFY_VF_FIXUP_DONE:
>  		break;
>  	default:
> -		return -ENOPKG;
> +		xe_gt_sriov_notice(gt, "unrecognized VF%u event %#x\n", vfid, eventid);
>  	}
>  	return 0;
>  }

