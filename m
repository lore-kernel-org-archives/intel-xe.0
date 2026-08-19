Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DAAC5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 09:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9FC10ED62;
	Wed, 19 Aug 2026 09:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5F7T+Xd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B351010E55C
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787131348; x=1818667348;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sE6grFHg7/Pm9m0QH9kVyhEdrMxEJuE4rcwj4RBZbNw=;
 b=J5F7T+XdhOY+iQ15lc6klvkPSACVCtiKCxV6wf50ZLDanET0TyuCpEln
 59gpBNoJiwT5hFlMuZMv/hoZag4POv7TG5EdrAhSR1edZhePcaTEDXSla
 65pROMJgI3pZQzVfH7o2+01zUFbh2LqpMfRJuO4iv4kvjH+UFoQq9/Wxz
 GKTh3wySkLoBvIJxd/FyMaXrRPeeomEBm/9HgkKnwqM2MxxPyuE5EgAxA
 l0fQ2cZqlQDZK3pdBRlrScmLf4NHzh8sj6LWdSxEh5VSnveFYiKV45F3G
 TK+6UgpFhrCHz7RdghW+81cUEc33Cu1XueAdX0QPaOBfV6SVtD0CceDOR w==;
X-CSE-ConnectionGUID: nIUPFDD+SKmaIgoGgTwOjQ==
X-CSE-MsgGUID: 0JZ1yZkxSHyryL2P6ttNzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98233692"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="98233692"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 02:22:27 -0700
X-CSE-ConnectionGUID: wb+uU8WWQHWS4ybfi7q+NA==
X-CSE-MsgGUID: vByu+AVkQym/HuEcudjQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="264166489"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 02:22:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 02:22:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 02:22:26 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 02:22:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hn4caV1oyHKiMuORvZXsBYRm6NvmzHkzwHOe8jihZDiJ9wtv4idZzIM7V/YHqwXKFQ3Wic/12XsoR+8PRUXL3Y2plOEgn7N6UrPHSPHCCKf9tY/JCM5UN1XtUne16N6gjPYGnOlEq36ggtqwshimrR45MDCoDLZzDu0WWoZIcB9THmxz5nBcuynkNiF22FyWFRazqeW2agdoV6goVfL/y11ubtqTB1CjoFJkI9kWbQu4QZLQ9mCEsiuCK/sb6f/CKGdG05jv47+zX0m52LR3LL8SrxWZOb9l6eygprVBQ6G7n5hGeIUU16fPp8hP9qkynJiA0H0bfZ0/84UYiA5izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5PZS2r6inESxMA9gGxgXHqxc6G9r5OjyBvdxbHF09o=;
 b=ZLmHf3mJMaPJpNJi3szDfOZ2HUXQd1Y8V7XgVsEFMK3V7wd4bfoecvOr74mGlsWQD5/QezOGev1SY4QU9qSEIZsmS9yFIZ1uMbzGxdOa5amftcKgiCpT9Hued20G3VZlJ4KMpytZqf1rIHeCa6YMli3Knd4IRFqd6O+6J7XLZ/c5Ka0mwmFFNxWAV0ByevVRiS8DUy36SHSJqSClrrfOAlDeBV0jo2YTaDr+5fS6hM5mgJyoOTfHcNbgHlXT190eWT3YzaS5gxsBhN+lfrRYvpvqa/G8cwwISCadrFewWN+p/aptQL53CvnMZEnDKcA+nokBLPdqIX24t5I0Jlq+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by DS4PPFC77662F02.namprd11.prod.outlook.com (2603:10b6:f:fc02::4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:22:22 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:22:22 +0000
Message-ID: <627680f4-dc4f-41f0-87e2-ec7d0a5fe285@intel.com>
Date: Wed, 19 Aug 2026 14:52:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>, "Usyskin, Alexander" <alexander.usyskin@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
 <20260807145621.2938848-10-anoop.c.vijay@intel.com>
 <BN9PR11MB5242AF76995E0453ABF7878A95D12@BN9PR11MB5242.namprd11.prod.outlook.com>
 <anYovbHoP7LbRIuw@intel.com> <890923d9-f26f-41dd-9f5e-ca0e5716c533@intel.com>
 <BN9PR11MB52423EA5B03C63013DDA57A095A52@BN9PR11MB5242.namprd11.prod.outlook.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <BN9PR11MB52423EA5B03C63013DDA57A095A52@BN9PR11MB5242.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0286.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::12) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|DS4PPFC77662F02:EE_
X-MS-Office365-Filtering-Correlation-Id: 914bc664-31bb-42f0-9110-08defdd35faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|6133799003|4143699003|3023799007|22082099003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: b5JmJD9SNe/XCYQQnjvutgjyk0qhMvsVSwys48e2fKNiRHw6DHiu1Ar/sEjWiXTK2l+8ICGqWbyDdLhMhWXCtSz50WtxQYsRDMzZeeERz4LwaR60DG5s3+9leezh0H5NYR2aQqUKIIgEStLDlLFC+dK/28sEFylxnz9eJpLl3eYbx7hTl16lT+2BWXyAnP99rEjP6A3yEHYQZ/uXeUeqDVHAwvcEUPqH3s+9cDuJevmdxcKviBpblroSC+2E9KJR7jmI02SzAzORN8jA6gWvixX9Z5bORpZg1337pMc3T4OUTpI4Dv4T9DEXKLm1nCDJ3GQkTQy1KEX7wbbcxgfB7y3OgSiPiHwijgJsrv79EtwAsba8gnr0LiWGVG4ACvIzpOXfvMCMw5RfRcMKvfuqnxW433+l9CS9P7mCJrt9iB9R9wEeq9FUw/9YAxsDiOqIY4zQalqibbRNHL4XB0hH/qt2XG8EeUwGjmV+bMp4D4lBI/OmoljhwMKsD/JcRznvbRTd2Qi46LKZ8iBwKEjSXK3lpKqOqGXhHrGO1lPYwqoGxt3dPVhJ+kRLQs9EKDswTovruRhOPKyJmqogw+BUsV1ogES3s7CzNESFfDIDp8dQa9BHgqpF5kXXcm4T03x6k3LxhVvYNJ05+QPFWm7l+oMxoMHnyXw3PXDWc2XF//Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(3023799007)(22082099003)(18002099003)(11063799006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9lbE1JOHJ3dDRyWllHTGJMMzd0Q1R2dkxoaHdtUW9IOW1HbmQ1ejRHYmVJ?=
 =?utf-8?B?R0E2ME9zZis0VXNzYnpKUURoZVUrN1oyeWMzeW5WeDhWQVJFZkoyR2ZDMExY?=
 =?utf-8?B?TnBCdCtDNzQxcDFIZnl0NFhpMFhJTUdmMnY5ci9UV0NJZS9nUTJiTE5zbU05?=
 =?utf-8?B?VTlHM3RTd3lyOW02R2JWZVVXS3pnb1V2dVIzZUIzVWxMN2ZsWk9rdmxwVWox?=
 =?utf-8?B?emM4SUZSTklESTE4S0F2ZmNQd1pwNWtxNmtBQkhLckdqNSs4dTR0Z3JCcFNT?=
 =?utf-8?B?bCtESzQwWVJYTXBiUXhFc0wreXdFV0p0REgvWklJaHFScDA5cFEwTUhnQTNC?=
 =?utf-8?B?WjRNWTJ4QXdMajhCTzQ4cGdsdGwxakVsRUlBeGlEejZ0dnloVXFaRHR2T3g2?=
 =?utf-8?B?NEIvRk9aeVVJc1Nkemw4Zm02aFZBdDhvdWY3YzFVcVJlQjN2T05FU3FrdS8w?=
 =?utf-8?B?WW5SWVE5VC9aSVVYbWRMQklOSEFHRDhVSGxZc3FwZjZSTE1lREE4dVdncG5j?=
 =?utf-8?B?ZFFQTEUweERYTXJWaExNcnladWFibUY4d3lPVEEzakdlZnZka3ljRExmMXhI?=
 =?utf-8?B?UmhIOFJxV2ZFeUFHUEhUS3Rva3dUd1A1cnlkMVVEWFYrMEFlcVZRaEZSNU5v?=
 =?utf-8?B?d3lCT2p5T2hjUUE2NEM4NkF0c2dRa2RaMDZ2blhpd0QvcGFIM1dHWEJPaTZG?=
 =?utf-8?B?SGVESnFYUFJtSkc4V3RUT3NOdkxwZWIxdHhUVTNPcW9kWVEwQkFUck5xRmpI?=
 =?utf-8?B?NEQzNVlHN3FEam9wN2xsL1l0bmpFbWZrMFdWWGdaSHRxeUJwV3IycGV0V2ln?=
 =?utf-8?B?QW0rSTkzMEN5QVBqdXVEemVjNHBGbzJzeGIyeHVvMW11MWJ2allJdFRBQ2xG?=
 =?utf-8?B?eXBSd3dXZWRHekw0d0tpaUNzZFMxRld6dTNWL0hORjV3d2RqTmxYZjhtcEhW?=
 =?utf-8?B?K2ZwbjY3amtIellzTWVPTzVsMlQ0eXI3c2hVYVRDaGtaTEFmZXl2Unc0NTZl?=
 =?utf-8?B?QzJWNjB2eGdzaWRMT3kyWGJSWi91ajk2S3E3ODFEbisvM0dWMWVkWmdwNDlC?=
 =?utf-8?B?RmZaRXE2VFZ3a28wTEhGYndhcWxOUzRyaEEzb3ZHWmFtWFJtWUUrQ280V3hU?=
 =?utf-8?B?SGpPd0JyRHEyblkzeGh4alJXbGN2cXJqMkVZNk4rL3g1Smt2NmpESmNBTmNw?=
 =?utf-8?B?ZXA2MldKbkxHSk9OR1ZZWnNIU3ROV1lNTDlUbkZMaXg5QjBZam9wZzBCWEdo?=
 =?utf-8?B?ZGVJZDRwWmxxOEtJQllyb2lLV2JGNElNQTVYbEN5cXVYWm0wVmltMk9RMmg1?=
 =?utf-8?B?engzTyt5elZYL3ZPR2VmQjhQVWdVQ0NEaGZjYXBpYUQ2a2VRL25PQitBek9O?=
 =?utf-8?B?YnhhU09yZkYvek5ybThKd2YrMDR2UFdHQ1U1NWVQbW50UVJmSkQ3bXVjeGlP?=
 =?utf-8?B?T2JyUWd4RThTbHFmcEpDVlZGTVJoNUcrRzkvTkdZYzNNN29wTUxCWmNFZkZQ?=
 =?utf-8?B?bkx3RFlMMDhKMkdUTW42UkxISjlXSjZTdjA5Qi9ZOVUvampTN1JsNko0WGto?=
 =?utf-8?B?dnlYdTA4Z2FveGpTSEZ1SlU5bzZMMFNZODg3RTUxRTRwRzNCTEdXSXQ1VEFU?=
 =?utf-8?B?dEhrTDlXcGJPZjlYWW1acHl0Z3JPd29GRE04Q3pjeEREOWV3U2EyelZjWTdF?=
 =?utf-8?B?ZndicVpMNWg4ZFpnZnBJSi95d2tMT1hRQWR0ck1MbXlsZFNYTiszSTB0MGJY?=
 =?utf-8?B?RWpLMWxyWVJHSHRZQVhIN0Mwd1F0eGRyb3g1RGNsbGFueEMwbHBRNFF2eEt3?=
 =?utf-8?B?UE4zcFMzK1FlWTVGdnhMc0xiNHg0blI1NWFBTnBnRUMwS3I1VnZxN25RaktK?=
 =?utf-8?B?THdJdXRDamZSc282OFk4QWlFRFVKaHB3bHUyK3ovVmpjQW9IMTVWWkpJY2cr?=
 =?utf-8?B?dVlsc1lBdElvZXBRNzhDZjR1dlNUc2JGUkVMdlZKS0pENzd5bW9ub3N1aWtr?=
 =?utf-8?B?OUc1UmFXdTJuWEpxNzQ1TGdwOW9xbmhjc2xVN2FLYWVaQ0pGREVjby9VRDN5?=
 =?utf-8?B?T0NsNFphdGdEdklieVJFZVJsM1ArYTRkcThGZUh3YXRiN2tVZE5MT3N2UXcv?=
 =?utf-8?B?djhxUFoyNk1HV1djNU1IeDBreWRvaVVkWktMbWo1cnJSbytnei9MU0hUaUxq?=
 =?utf-8?B?SGVBemNVZm9IUFVuSkRWRXFaYTJqdFE1UDVOYjFMUmo0SzR4bE9iQmF4TXph?=
 =?utf-8?B?SzF5dGlqQ1JSZWdQMmt3bko1ZHNUMjQ1SlFTZTdPeVBXdzFUTVJDbmJ6V2pz?=
 =?utf-8?B?OHcvS0d1Unk3OFVVdlNmUE9JREY2MkZoMnppTUFsRFZZK1dhOFEzdz09?=
X-Exchange-RoutingPolicyChecked: HU6DfbISnevTQSDAXuNvFj5rfYFff+giuY5w0WfNBJZsNFX6JRgqV6toOCn1BgV9xLHHklcOiCsDJMJ4fJTQ+rIpadH0yAwZcSBmvV1lsDpEedTsRDs5zNMNO9ds1WpCXb62hpfqpyDEHvy+guxg58pJ2RJE2B180zPzpYjUssdONqFLLi+o/v2iDje28H0XC7DEspnNGpw7PPKxK48yAH4FdtildgwuPPIZR//i7minQ1FajyyFGpicVrhfurRFE79DOyORhRWPrRho6lQVXAXQcg59wHtnB2o2yeGf2lTRYcoSDEE7niJqG04Osq06BA7zb2N/BiIRBGxQhxzm5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 914bc664-31bb-42f0-9110-08defdd35faa
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:22:21.9829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tz4wt8qhGH+3ILVIItYx6dF8LKNJsy97RTF/BxCJLCZAcoVI44JXEX1tB+W1mYE+lSmR3f4kFl367CSa1iIKWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC77662F02
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


On 19-08-2026 09:16, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Vijay, Anoop C <anoop.c.vijay@intel.com>
>> Sent: Wednesday, August 19, 2026 12:15 AM
>> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Nerlige Ramappa, Umesh
>> <umesh.nerlige.ramappa@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Iddamsetty, Aravind
>> <aravind.iddamsetty@intel.com>; Tauro, Riana <riana.tauro@intel.com>;
>> Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
>> <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V,
>> Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
>> <kam.nasim@intel.com>
>> Subject: Re: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection debugfs
>> interface
>>
>>
>> On 08-08-2026 00:19, Rodrigo Vivi wrote:
>>> On Fri, Aug 07, 2026 at 11:15:59AM -0400, Gupta, Anshuman wrote:
>>>>> -----Original Message-----
>>>>> From: Vijay, Anoop C <anoop.c.vijay@intel.com>
>>>>> Sent: Friday, August 7, 2026 8:26 PM
>>>>> To: intel-xe@lists.freedesktop.org
>>>>> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
>>>>> Nilawar, Badal <badal.nilawar@intel.com>; Vivi, Rodrigo
>>>>> <rodrigo.vivi@intel.com>; Iddamsetty, Aravind
>>>>> <aravind.iddamsetty@intel.com>; Tauro, Riana
>>>>> <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>;
>>>>> Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
>>>>> <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V,
>>>>> Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
>>>>> <kam.nasim@intel.com>; Vijay, Anoop C <anoop.c.vijay@intel.com>
>>>>> Subject: [PATCH v3 4/4] drm/xe/sysctrl: Add RAS error injection
>>>>> debugfs interface
>>>>>
>>>>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>>>>
>>>>> Add debugfs interface for exercising System Controller's RAS error
>>>>> injection command, used to validate RAS error detection and recovery
>> paths.
>>>>> Command details:
>>>>> - Group ID: 0x02 (diag group)
>>>>> - Command ID: 0x7E (XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT)
>>>>> - Usage: echo "<ras_block_id> <ras_sub_block_id> <err_type> [params]"
>> \
>>>>>                > /sys/kernel/debug/dri/0/sc/ras_error_inject
>>>>>            cat /sys/kernel/debug/dri/0/sc/ras_error_inject
>>>>>
>>>>> This command requires the diag application to have completed
>>>>> firmware boot and initialization (late-bind loaded); writes are
>>>>> rejected with -ENODEV until xe_sysctrl_is_diag_fw_ready() reports the
>> diag firmware as ready.
>>>>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_sysctrl_debugfs.c       | 123
>> ++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  31 +++++
>>>>>    drivers/gpu/drm/xe/xe_sysctrl_types.h         |   3 +
>>>>>    3 files changed, 157 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>>>>> b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>>>>> index 2144d9d43fba..7b8846d739cb 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>>>>> @@ -10,6 +10,7 @@
>>>>>    #include <linux/seq_file.h>
>>>>>    #include <linux/slab.h>
>>>>>    #include <linux/string.h>
>>>>> +#include <linux/string_choices.h>
>>>>>    #include <linux/uaccess.h>
>>>>>
>>>>>    #include "xe_device.h"
>>>>> @@ -122,6 +123,124 @@ static const struct file_operations
>>>>> xe_sysctrl_loopback_fops = {
>>>>>    	.release = single_release,
>>>>>    };
>>>>>
>>>>> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file,
>>>>> +const char
>>>>> __user *ubuf,
>>>>> +						 size_t len, loff_t *offp)
>>>>> +{
>>>>> +	char *kbuf __free(kfree) = NULL;
>>>>> +	struct seq_file *m = file->private_data;
>>>>> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
>>>>> +	struct xe_device *xe = sc_to_xe(entry->sc);
>>>>> +	struct xe_sysctrl_diag_ras_err_inj_req req = {};
>>>>> +	struct xe_sysctrl_mailbox_command cmd = {};
>>>>> +	u8 resp_hdr_only[sizeof(u32)];
>>>>> +	unsigned int nfields = 0;
>>>>> +	char *token, *tmp;
>>>>> +	unsigned long val;
>>>>> +	size_t out_len = 0;
>>>>> +
>>>>> +	if (!xe_sysctrl_is_diag_fw_ready(xe)) {
>>>>> +		xe_err(xe, "sysctrl: diag firmware not ready, cannot inject RAS
>>>>> error\n");
>>>> Wild thought,
>>>> How it would be register the debugfs only if  diag firmware is loaded ?
>>>> That way nobody will be having access to these debugfs ?
>>> I agree with this. It is better not even register the file if the
>>> firmware is not loaded. So it doesn't even appear in the filesystem.
>> Unlike oCode, diag firmware initialization is not driven by KMD and can
>> complete asynchronously. We don't have a notification from SysCtrl when
>> diag firmware app becomes ready.
>> Since xe_sysctrl_check_app_status() is a lightweight synchronous query that
>> always reflects current firmware state, a possible middle ground would be to
>> move the readiness check to .open() rather than .write().
>> This would cause both cat and echo to fail with -ENODEV until diag firmware
>> is initialized.
>>
>> The file would remain visible under sc/, but would be inaccessible until the
>> firmware is ready.
>>
>> Would that be an acceptable compromise, or would you still prefer the entry
>> to remain hidden until diag firmware is loaded?
> @Vijay, Anoop C, AFAIU, we have a similar issue with the diag fwctl interface. I think we should register it only after the diag firmware is loaded.
>
> Since the diag firmware is loaded by CSC, there may be a way to address this. If the MEI lb driver can be notified when the firmware is loaded, we could use intel_lb_component_ops() to notify XeKMD. XeKMD could then use xe_sysctrl_check_app_status() to verify the application status and register the debugfs entries and fwctl interface accordingly.
>
> Thanks,
> Anshuman

Hi Anshuman,

Thanks for the suggestion. I looked into this proposal. Although diag 
late-binding uses the same ME firmware client GUIDs as mei_lb, it is 
loaded through a separate userspace MEI connection (/dev/mei). As a 
result, mei_lb has no direct visibility into user space late binding 
flow. We also do not have a firmware-defined 'ready' notification in CSC.

Supporting dynamic registration using this approach would require CSC 
firmware and MEI driver component changes.

Given that, I think the practical approach is to query readiness via 
xe_sysctrl_check_app_status() through Sysctrl at the point of use.

We can revisit dynamic registration if CSC firmware/MEI driver provides 
a readiness event in the future.

Thanks,
Anoop
>>>> Thanks,
>>>> Anshuman.
>>>>
>>>>> +		return -ENODEV;
>>>>> +	}
>>>>> +
>>>>> +	if (len == 0 || len >= PAGE_SIZE)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	kbuf = kmalloc(len + 1, GFP_KERNEL);
>>>>> +	if (!kbuf)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	if (copy_from_user(kbuf, ubuf, len))
>>>>> +		return -EFAULT;
>>>>> +	kbuf[len] = '\0';
>>>>> +
>>>>> +	tmp = kbuf;
>>>>> +	while ((token = strsep(&tmp, " \t\n")) != NULL) {
>>>>> +		if (*token == '\0')
>>>>> +			continue;
>>>>> +
>>>>> +		if (kstrtoul(token, 0, &val))
>>>>> +			goto inval;
>>>>> +
>>>>> +		switch (nfields) {
>>>>> +		case 0:
>>>>> +			if (val > U16_MAX)
>>>>> +				goto inval;
>>>>> +			req.ras_block_id = val;
>>>>> +			break;
>>>>> +		case 1:
>>>>> +			if (val > U16_MAX)
>>>>> +				goto inval;
>>>>> +			req.ras_sub_block_id = val;
>>>>> +			break;
>>>>> +		case 2:
>>>>> +			if (val > U16_MAX)
>>>>> +				goto inval;
>>>>> +			req.err_type = val;
>>>>> +			break;
>>>>> +		case 3:
>>>>> +			if (val > U32_MAX)
>>>>> +				goto inval;
>>>>> +			req.params = val;
>>>>> +			break;
>>>>> +		default:
>>>>> +			xe_err(xe, "sysctrl: too many ras_error_inject
>>>>> arguments\n");
>>>>> +			return -EINVAL;
>>>>> +		}
>>>>> +		nfields++;
>>>>> +	}
>>>>> +
>>>>> +	if (nfields < 3) {
>>>>> +		xe_err(xe,
>>>>> +		       "sysctrl: usage: <ras_block_id> <ras_sub_block_id>
>>>>> <err_type> [params]\n");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
>>>>> +				  &req, sizeof(req), resp_hdr_only,
>>>>> +				  sizeof(resp_hdr_only));
>>>>> +
>>>>> +	guard(xe_pm_runtime)(xe);
>>>>> +	entry->status = xe_sysctrl_send_command(entry->sc, &cmd,
>>>>> &out_len);
>>>>> +
>>>>> +	return entry->status ? entry->status : len;
>>>>> +
>>>>> +inval:
>>>>> +	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
>>>>> +	return -EINVAL;
>>>>> +}
>>>>> +
>>>>> +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m,
>>>>> +void
>>>>> +*data) {
>>>>> +	struct xe_sysctrl_debugfs_entry *entry = m->private;
>>>>> +	struct xe_device *xe = sc_to_xe(entry->sc);
>>>>> +
>>>>> +	seq_printf(m, "Command: group=0x%02x cmd=0x%02x\n", entry-
>>>>>> group, entry->command);
>>>>> +	seq_printf(m, "Diag firmware ready: %s\n",
>>>>> +		   str_yes_no(xe_sysctrl_is_diag_fw_ready(xe)));
>>>>> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ?
>>>>> +"FAILED" : "SUCCESS");
>>>>> +
>>>>> +	seq_puts(m, "\nUsage:\n");
>>>>> +	seq_puts(m, "  echo \"<ras_block_id> <ras_sub_block_id>
>>>>> <err_type> [params]\" > ras_error_inject\n");
>>>>> +	seq_puts(m, "  cat ras_error_inject\n");
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int xe_sysctrl_ras_error_inject_open(struct inode *inode,
>>>>> +struct file *file) {
>>>>> +	return single_open(file, xe_sysctrl_ras_error_inject_show,
>>>>> +inode->i_private); }
>>>>> +
>>>>> +static const struct file_operations xe_sysctrl_ras_error_inject_fops = {
>>>>> +	.owner = THIS_MODULE,
>>>>> +	.open = xe_sysctrl_ras_error_inject_open,
>>>>> +	.read = seq_read,
>>>>> +	.write = xe_sysctrl_ras_error_inject_write,
>>>>> +	.llseek = seq_lseek,
>>>>> +	.release = single_release,
>>>>> +};
>>>>> +
>>>>>    static void xe_sysctrl_register_entry(struct dentry *root, struct
>>>>> xe_sysctrl_debugfs_entry *entry,
>>>>>    				      struct xe_sysctrl *sc, const char *name,
>>>>>    				      u8 group, u8 command,
>>>>> @@ -154,4 +273,8 @@ void xe_sysctrl_debugfs_register(struct
>>>>> xe_sysctrl *sc, struct dentry *parent)
>>>>>    	xe_sysctrl_register_entry(root, &sc->debugfs.loopback, sc,
>>>>> "loopback",
>>>>>    				  XE_SYSCTRL_GROUP_CORE,
>>>>> XE_SYSCTRL_CMD_LOOPBACK,
>>>>>    				  &xe_sysctrl_loopback_fops);
>>>>> +
>>>>> +	xe_sysctrl_register_entry(root, &sc->debugfs.ras_error_inject, sc,
>>>>> "ras_error_inject",
>>>>> +				  XE_SYSCTRL_GROUP_DIAG,
>>>>> XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT,
>>>>> +				  &xe_sysctrl_ras_error_inject_fops);
>>>>>    }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>>> index ed80fe63e1c4..43ae0049b316 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>>> @@ -14,10 +14,12 @@
>>>>>     * enum xe_sysctrl_group - System Controller command groups
>>>>>     *
>>>>>     * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>>>>> + * @XE_SYSCTRL_GROUP_DIAG: Diag group
>>>>>     * @XE_SYSCTRL_GROUP_CORE: Core group
>>>>>     */
>>>>>    enum xe_sysctrl_group {
>>>>>    	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>>>>> +	XE_SYSCTRL_GROUP_DIAG			= 0x02,
>>>>>    	XE_SYSCTRL_GROUP_CORE			= 0xFF,
>>>>>    };
>>>>>
>>>>> @@ -51,6 +53,35 @@ enum xe_sysctrl_core_cmd {
>>>>>    	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>>>>>    };
>>>>>
>>>>> +/**
>>>>> + * enum xe_sysctrl_diag_cmd - Commands supported by Diag group
>>>>> + *
>>>>> + * @XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT: RAS error injection  */
>>>>> enum
>>>>> +xe_sysctrl_diag_cmd {
>>>>> +	XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT		= 0x7E,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct xe_sysctrl_diag_ras_err_inj_req - DIAG_RAS_ERR_INJECT
>>>>> +request payload
>>>>> + *
>>>>> + * Request payload for XE_SYSCTRL_CMD_DIAG_RAS_ERR_INJECT. The
>>>>> mailbox
>>>>> +layer
>>>>> + * prepends the application message header before sending.
>>>>> + *
>>>>> + * @ras_block_id: RAS block (subsystem) to inject the error into
>>>>> + * @ras_sub_block_id: RAS sub-block (IP) within @ras_block_id
>>>>> + * @err_type: Type of test error to inject
>>>>> + * @reserved: Must be zero
>>>>> + * @params: Optional injection parameters (default 0)  */ struct
>>>>> +xe_sysctrl_diag_ras_err_inj_req {
>>>>> +	u16 ras_block_id;
>>>>> +	u16 ras_sub_block_id;
>>>>> +	u16 err_type;
>>>>> +	u16 reserved;
>>>>> +	u32 params;
>>>>> +} __packed;
>>>>> +
>>>>>    /**
>>>>>     * struct xe_sysctrl_app_status_req - Get application status request
>>>>>     *
>>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>>>> b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>>>> index 53d82e61383a..3a97a10d1b7d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>>>> @@ -68,6 +68,9 @@ struct xe_sysctrl {
>>>>>
>>>>>    		/** @debugfs.loopback: Loopback test entry */
>>>>>    		struct xe_sysctrl_debugfs_entry loopback;
>>>>> +
>>>>> +		/** @debugfs.ras_error_inject: RAS error injection test entry
>>>>> */
>>>>> +		struct xe_sysctrl_debugfs_entry ras_error_inject;
>>>>>    	} debugfs;
>>>>>    };
>>>>>
>>>>> --
>>>>> 2.43.0
