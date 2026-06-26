Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8C3CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 09:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16DB10F522;
	Fri, 26 Jun 2026 09:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNrK5Ut2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E740210F522
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782466940; x=1814002940;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S3i9uS/A4jmGPwaHmr9X64arwI6mtMo7EI6FfAja3eo=;
 b=CNrK5Ut2oPfCiqKC+hPFtZGC4lapjJGMfnhgvIy0ddSfQiT8VsqllK+D
 CPjqivgVc3M3OwR29koe2KQjQjbEMY69WA/y5WISil5oOEMYGgJNDmAq5
 0OIgHV7pYhmFZ7oN5GHhfopiwCGjiRaKyAI/CLCkXYYo+dvmgWzlm951u
 /peKiuvZigcuFOlf7BG5PHaOhtGneRvz3RWkMjkcuhhD1nHxOwr6BsptU
 F1BY0/x1PJDrawa85C/+irLTHsFqyv6boW8xBOXmi8r3Gmj+T8AoPLMTm
 BuxUnVb8NJIe/gZex4a035ykpF/FEgzvPX3aSVpSZAlPiBJoz3SH+rqUI A==;
X-CSE-ConnectionGUID: FaKasqD2SjG+WC8WHq0eeA==
X-CSE-MsgGUID: Kbh700TKQJ+P3IYL7I8/Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="93916778"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="93916778"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:42:15 -0700
X-CSE-ConnectionGUID: 4U4wyCJiS++lacjrz9B6vA==
X-CSE-MsgGUID: msXsPJYSSGCgMpkcAZNUkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="289383619"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:42:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:42:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 02:42:13 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:42:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzqgwvywTRvZsLQwtqsjtEsrQjC7wUvVy8nGTAMP9UlTu6H5mrpSLib3x7von9q0+8jstPBmplXDKSPr33YVars0B4Ve/CluaIG4x311JrIJrdw0vvy3rbQ9+s+gsq+tpnxRR2/AYnJRGeFLhvNvorJp5B0jBvPajYz2qiF/CBOHHLA1c7EVnOtfXUq4dZvQVYOHb6nxQMjbuoltp5f8mehfrj87XydJhKx9okrXwGPncvgvOgeB4zoof4cS8Ao7mPvrlBnqS4rtvtGoicGFr42DkEk1yp5r4yF9GLBLH2n81rgIOZBD6B4b2msLyu1hXqJ9GphXBRRgX6oNCtoTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1erLaaVPsfof++wszj1JIoKOnQairebQXPurk4jFV0=;
 b=wWMaJcthiwJqwIzaqYScdISeAH3tD+rdnyNf/OBnYUOXBnXlWsLQwR3IFvpslufu1pyi+vesu2CxlOK8d/lqpkaZX7Yr0k+DRYif7zUWUZpNJ5vzVbw7Ip7n/xPutFOAUDNyiROl7DWOG+IvfnJZM2ZLjf6HgJseV9QZoemL436XmhmIBdILbv+XRoIMrxqym4Eyr3fOIJ7w0n2iGiWZ0isa3ut2+xJN7X1Y9tVT+OhTHxgeFBPxMH7vhN6SOyuToB4ulPHl9CXZFx9Te6GFHziCQdcGbpoinZVxSoRxBvad9sKMd4UyHI8X8DlJ1DewOsVvu6Fyivz4YpUgmBkJPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 09:42:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 09:42:11 +0000
Message-ID: <d8562f46-cb43-4d66-abc8-35143466bc17@intel.com>
Date: Fri, 26 Jun 2026 11:42:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
To: Matthew Auld <matthew.auld@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
 <20260611161634.506476-20-matthew.auld@intel.com>
 <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
 <172ca7a0-4860-4aa3-b0c2-9afb788d6613@intel.com>
 <47058937-f35e-4856-89ca-f1e2f5087f55@intel.com>
 <b992c4c5-4934-4015-b6e6-f8d13435d415@intel.com>
 <63fd304b-9b4d-4d8a-b609-25a807050448@intel.com>
 <e3e0025a-efb1-4c74-ab5d-83532a689474@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <e3e0025a-efb1-4c74-ab5d-83532a689474@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B7A.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::616) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: d5c6c41c-433d-45f4-ff27-08ded3673215
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Hr6fh+9F8ERRiAD/G0xhwbDOrkrpGWqv1oS1o/vXqmWSag7QTGmwgwZa3XRLOxIScTRCJZShFUNYIy28pQc9a5ncrKsaIUmqno2xSQpOOAZ8Q8tsMOdbHWkJXnVJFMxbVzSbUdlWAXDbajLzq5WfxJACKWdZAnjdEbQZNUl2qlpekfpDko60ZpiGlk3ScyT+UuawLJN4o6j3zy+dPmXf/8v2cfhyZOmnWtJk+Iehu/JhZ0XJZMTQNQgS+PPCLQ6fR7Gzo9dFvswR3A3R78koTZB3dEm77mJJDb35WCLFOGqv6PRIVASOE60WOeSu28r0ZtYXrbwPGhUvk4jyerS84kS0vIRYN+AoATlsIuV6OZiGVyrFsteFL68tHEb0hK1oIBo4vKVNPrtYIqy835wZh4Fprr/yQwDUkG8VQz9u7gmoq/Rdn0uQRhXoGS7UElHlY89XdEUstEi8os48+uOWDnFK2ChPMws768nTzFFNNQvnfFHd6Z1DVoqEuVCf46/3nYrssNx3hMivtx9FsMvgq7jutV7rLKHr3vwKR0/f2yR6j9D5UUcsYFBsW0QhCODA0UCkpLtjSd92ZACbY0CzjJhPvLqDVgH4VyyYC/BuHfDdOhgNQcZJBJjp72lRkDBd4Yg234p2UwU7uzRPsBEILZPwOj5MY/MGFQnyOaxQ80Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U01TSGhHTmdaK0dWMlFrc1dMZHFSVjEyT3IwZXJORlBLZE56QStaQ25SN05n?=
 =?utf-8?B?NmhsbXFDbUJ6blZVcmpEN3VTWWhJRWNJZ3ZJYVVIUjd5TkdlU21mK3lPMkY5?=
 =?utf-8?B?ZGhXTGlVWExqcGhRLzRYT2Z6eTVQQ3ZCNjdMd3Z3YXdMcTR3cWhrckpzaTNT?=
 =?utf-8?B?TUpWaG9ldVFieGFJdjc1d3JVdHFBQUh6d1hQZE8xMGl4NzhzdVFZeEhOMW5j?=
 =?utf-8?B?OExMekNHdnJFT1ZMUWQ3UlJCM3F5K0paR3RPYTBmbi8xYk5RNXBKdEl3dW5S?=
 =?utf-8?B?dUZsTG9tc0syN2pjRFM0Sm1XMHNWbUdtWlNPcW0vRHNrc3lpcVIxMHNqaUFl?=
 =?utf-8?B?MFZnNXRZMVRQVmMwOXI2b1lpQ2E4dDd6bnRaUk1lVDVqT2t6R3AzS2JvN2Fu?=
 =?utf-8?B?T0drRUV0OTNweEgwTmcwdkxWVnlpbjJyVzd4MHRXcVlFZUgvZEJDRG5jeHIx?=
 =?utf-8?B?VE1Tb0wzb2VhR3dxemplc3lmUUZoa3ZnZzZqb2lGZDJhNWlTbE15WGZ3K1JL?=
 =?utf-8?B?NzQ5VVlHT25MRnVJRTV4bDd6TGY4ckpFRVJ1UmpOTk95Vy84OFhrKzBnOG1T?=
 =?utf-8?B?SHBEcDUyRjJza0ptVUtzYUpYUG5EY0NLNThpcHIwMGZiQmEzY3A2eEFYcHpu?=
 =?utf-8?B?Y2lKd2Vmbmx1MFZYci83a3ZWd05QMDRaM2s3YTlUUmRvRHArU3Nueno3YUs1?=
 =?utf-8?B?aE56RmQzbjhDUTNNV3RySHZZTHdwNTlwcmFNazZwWUZ1b1c3TGZCc3d2Uzl5?=
 =?utf-8?B?N1o1TG5ESVlmK05tM3NyZGpMbmxUTlJ6c0UwVldZWU9ON3NFN0xwS3VURkhS?=
 =?utf-8?B?SHdCRkp1T2hrNGFUcDZ5RlQxZXBqNGNsWnk4L2szYzJkT0RxRnJOVDdWYkxv?=
 =?utf-8?B?dnJ2b2pDRWVrTlBmVU1GdDR6bFNVRWRBb1lmdVAxMngvaDNqbTlWWXJpbVlp?=
 =?utf-8?B?UkZtS0dwTEM0QU81Y05QSmZLTDlGUHdzdlBGZHAxemxHL1NzSlRzN2VGVktv?=
 =?utf-8?B?WmhpTU8vZ0Y0MG9YNFROby9LYWk4U0tMcGE5aUxoUEtJbWpFZ2MrQTRWcERP?=
 =?utf-8?B?VjJmRmdITlNRdC9PMWNRTjlINDFTaXJuOG1wNG9BWXYvaXFzaFdpN0xyY3ly?=
 =?utf-8?B?RmJqcHYxeFdxeFRjVjJ4Tk85dDVralROOGJwU2ZaNG1lZkRra1lNdFhqditJ?=
 =?utf-8?B?Y0h1SU54em9MdFBRSFJxMDRYRzFMV3FSeElLaHA3cW1yZHhaK3VGR1dyRFZW?=
 =?utf-8?B?Uk1mNVBST011dmpkdGpoKzRQK1doNGxKMEdOMzVwVVJIR1NCT0xVVk5kNVhh?=
 =?utf-8?B?ZlRFRGQ0NXVjNHhpSXpzWnR5MW1yZ1lrUUJQNkw3d25LZVQwOE42a0RuOFk5?=
 =?utf-8?B?SHA1N2FVemNuRGxlM3BWTEdLU1R1MTQvd1VPdmpycE5kc2s5TUNQSHJxd09s?=
 =?utf-8?B?MGlRb2dlNFZ0bUhoaU1XaWg5bTVXd2EzZ012cFl6R3I1SXI2Ym1IcXkrcnBF?=
 =?utf-8?B?bnNCTEJxWWVKYlAzcWhDYUlNMXFjenNNU2czRkZWZENudFFOTi9POERVRFBG?=
 =?utf-8?B?djNWbi9iclBTTWdzV1NRYWRaSUFwOEVvSWVCRXBVZkJHOXZFRmhMc3JYak4r?=
 =?utf-8?B?b3BEZkZVUTl2M1NTTjhxOFNhQUxMTTBPMHY0amxJRkdFOHdScDMxQmtaM2pq?=
 =?utf-8?B?cEFGUkhmdFd3U2lSalRITkZsSVN2b0thZG1LdVZJVHQ3Q2xnd3ZUZXJKSXVj?=
 =?utf-8?B?MEFGN05weTcxSkZLRTJzbnJvcEc0L3NTOHA4blc2WUpsQ3k5TWtLYUlhYmUy?=
 =?utf-8?B?S3RMeU4rL0FQU0pDWS82V3NIK0RqeVNPWis3VWpsL1ZWLzJWVmNKYnVSbnh1?=
 =?utf-8?B?MVNEMVJobmFSc3VoVDZWRWs5Q21HbnhTTS81UEtFY3dHV2llM1huZE1VUTV5?=
 =?utf-8?B?VjUrSjVWaHRXWUJocGxzNjF0c2R6QS9hOWdnM3NlRkdPckhPc3ZtVnJpRS9W?=
 =?utf-8?B?aFNtN0pGSWh5TmM2TjhGQlphRWlyWVlwWmF6dm1vSjZGbjRnK0ZZYjVhMzRB?=
 =?utf-8?B?OEJENXVrK3ZIS1dNQTBmOTdubzg3alZMeTFZMEN6VlIxVVh3d1NaWHU3Mmkz?=
 =?utf-8?B?V3oyVXBHTUFKVHFKS2JGSUhNc2lQeklHaUVBSDdlUjlPZmo1alNjOGNUSlY2?=
 =?utf-8?B?UURLZUtpK3JWajlaVkxTMXZnQlZ5QVFvVVd4Zm5MQ1NqUFUyY1RINlRMcDBT?=
 =?utf-8?B?aitPd3BSalJiVGtXbGRBOThHdTJzdnlySjN0WDNBdjZnM2hET3Q0Z1ZaSERy?=
 =?utf-8?B?S256RE5EM0RHc0ZuMWVBRVhTRWZ6UmlvMGI3TDV3RDZRVzhNRFgxY2xLWGJx?=
 =?utf-8?Q?TPfCP/x/PyiU/fdw=3D?=
X-Exchange-RoutingPolicyChecked: IH34Y75GW4yYLPfpRPaiaTarDgwhGfDFZmLGei1298P/VPKCt0+dwbZt2A4/tweXhP2P8/BQJO3Vk4rDITyKr4if/I/hBWZJahBXi7D5ODFhL5atYouMyh7n2/8ERaJqN7dwMvUorwOGqTcfsSd3T5eSpa6DZ47pbGdwmLQoMT4XIXDYIs9R1bXi9FD2YpsHJYAqI2eTyOwnobwoF5HLdlimdGqxcDeGwoulaYBex2Mo/o99Uk5sDqlxSe/53+/gslaSVvzuX0Lt0tq+tCHnlTin6LJAyeMnWJBi4ZsLDaPIUyHkK2rLlEHEkTQ7LP8/rwvLbmtC+iC1+92zCU7uVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5c6c41c-433d-45f4-ff27-08ded3673215
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:42:10.9857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJa9WaGnMwHKNoaSw+LrXplNr2GlhwRx2UbBaeNHw1vOpfbOkkpyE6cXMgUZ3s9suLSX+VvgBxHgoGkfMYY6kpzihD/M6XzJbVXvsdzzkV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
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



On 6/26/2026 11:16 AM, Matthew Auld wrote:
> On 25/06/2026 21:58, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 6/25/2026 1:53 PM, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 6/25/2026 1:40 PM, Michal Wajdeczko wrote:
>>>>
>>>> On 6/23/2026 7:50 PM, Daniele Ceraolo Spurio wrote:
>>>>>
>>>>> On 6/23/2026 9:28 AM, Michal Wajdeczko wrote:
>>>>>> On 6/11/2026 6:16 PM, Matthew Auld wrote:
>>>>>>> When host PF writes the logical configuration for the GUC PAGING engine,
>>>>>>> the VF is meant to query it, and mirror it. Size of N means we have
>>>>>>> paging logical index range [0, N-1], with N fewer normal copy engines.
>>>>>>>
>>>>>>> Agreement is that PF will only spawn PAGING engines on NVL-S+, so this
>>>>>>> should be zero on older platforms, where we should simply fall back to
>>>>>>> the old behaviour.
>>>>>>>
>>>>>>> v2 (Sashiko):
>>>>>>>     - We can't call use the guc_has_paging_engine() this early in the VF
>>>>>>>       code. With that just unconditionally do the query, if the GuC is new
>>>>>>>       enough and take the value as-is. With that drop the -1 special case and
>>>>>>>       just let the upper layers figure out the rest.
>>>>>>> v3:
>>>>>>>     - Also update xe_guc_klv_key_to_string. (Michal)
>>>>>>>     - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
>>>>>>>       tweaks. (Michal)
>>>>>>>     - Update with final GuC version.
>>>>>>> v4:
>>>>>>>     - Just fallback to manual reserve when vf reported paging engines is
>>>>>>>       zero. Will revisit in the future.
>>>>>>>
>>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
>>>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 ++++++++++++++++ +++++++
>>>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
>>>>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
>>>>>>>    drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
>>>>>>>    6 files changed, 91 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/ drm/xe/abi/guc_klvs_abi.h
>>>>>>> index 644f5a4226d7..753c049d2fc8 100644
>>>>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>>>> @@ -52,6 +52,12 @@
>>>>>>>     * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>>>>>     *      Tells the driver whether scheduler groups are enabled or not.
>>>>>>>     *      Requires GuC ABI 1.26+
>>>>>>> + *
>>>>>>> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
>>>>>>> + *      Tells the driver the paging engine configuration.
>>>>>>> + *      Paging engine logical instances are guaranteed to be dense starting at
>>>>>>> + *      index 0.
>>>>>>> + *      Requires GuC ABI 1.36+
>>>>>>>     */
>>>>>>>      #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY 0x3000u
>>>>>>> @@ -60,6 +66,9 @@
>>>>>>>    #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY 0x3001u
>>>>>>>    #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>>>>>    +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY 0x3003u
>>>>>>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN    1u
>>>>>>> +
>>>>>>>    /**
>>>>>>>     * DOC: GuC Self Config KLVs
>>>>>>>     *
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/ drm/xe/xe_gt_sriov_vf.c
>>>>>>> index 0cd9d77f3351..0a11e63f470b 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>>>> @@ -658,6 +658,33 @@ static int vf_cache_sched_groups_status(struct xe_gt *gt)
>>>>>>>        return 0;
>>>>>>>    }
>>>>>>>    +static int vf_cache_num_paging_engines(struct xe_gt *gt)
>>>>>>> +{
>>>>>>> +    struct xe_guc *guc = &gt->uc.guc;
>>>>>>> +    struct xe_uc_fw_version guc_version;
>>>>>>> +    u32 value = 0;
>>>>>>> +    int err;
>>>>>>> +
>>>>>>> +    xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>>>>>>> +
>>>>>>> +    if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    err = guc_action_query_single_klv32(guc, GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
>>>>>>> +                        &value);
>>>>>>> +    if (unlikely(err)) {
>>>>>>> +        xe_gt_sriov_err(gt,
>>>>>>> +                "Failed to obtain the number of paging instances (%pe)\n",
>>>>>>> +                ERR_PTR(err));
>>>>>>> +        return err;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    gt->sriov.vf.runtime.num_paging_engine_instances = value;
>>>>>>> +
>>>>>>> +    xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
>>>>>>> +    return err;
>>>>>>      return 0;
>>>>>>
>>>>>>> +}
>>>>>>> +
>>>>>>>    /**
>>>>>>>     * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>>>>>>     * @gt: the &xe_gt
>>>>>>> @@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>>>>>>        if (has_gmdid(xe))
>>>>>>>            vf_cache_gmdid(gt);
>>>>>>>    +    err = vf_cache_num_paging_engines(gt);
>>>>>>> +    if (unlikely(err))
>>>>>>> +        return err;
>>>>>>> +
>>>>>>>        return 0;
>>>>>>>    }
>>>>>>>    @@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>>>>        return gt->sriov.vf.self_config.num_ctxs;
>>>>>>>    }
>>>>>>>    +/**
>>>>>>> + * xe_gt_sriov_vf_paging_engines - Query the number of paging engine instances
>>>>>> nit: we don't do any query here
>>>>>>> + * @gt: the &xe_gt
>>>>>>> + *
>>>>>>> + * This function is for VF use only.
>>>>>>> + *
>>>>>>> + * Return: number of GuC paging engine instances configured by the PF.
>>>>>>> + */
>>>>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
>>>>>>> +{
>>>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>>>>> +
>>>>>>> +    return gt->sriov.vf.runtime.num_paging_engine_instances;
>>>>>>> +}
>>>>>>> +
>>>>>>>    static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>>>>>>>    {
>>>>>>>        u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/ drm/xe/xe_gt_sriov_vf.h
>>>>>>> index 79878f21b1da..d171a8242a34 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>>>> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>>>>>    u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>>>>>    u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>>>>>>    bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>>>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>>>>>>>      u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>>>>>>    void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/ gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>> index 80562ffadb16..21cb9bc1a341 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>>>> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>>>>>>>            /** @regs.value: register value. */
>>>>>>>            u32 value;
>>>>>>>        } *regs;
>>>>>>> +    /**
>>>>>>> +     * @num_paging_engine_instances: number of configured paging engines.
>>>>>>> +     */
>>>>>>> +    u32 num_paging_engine_instances;
>>>>>> nit: can we move this up near .uses_sched_groups
>>>>>>
>>>>>>>    };
>>>>>>>      /**
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/ gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>> index 97600edda837..be992b8da9a1 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>>>> @@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>>>>>>        /* GuC Global Config KLVs */
>>>>>>>        case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>>>>>>>            return "group_scheduling_available";
>>>>>>> +    case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
>>>>>>> +        return "num_paging_engine_instances";
>>>>>>>        /* VGT POLICY keys */
>>>>>>>        case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>>>>>>            return "sched_if_idle";
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/ xe/xe_hw_engine.c
>>>>>>> index 4d7cb8b54b4b..1227b9e66fd6 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>>>> @@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>>>>>>>        return err;
>>>>>>>    }
>>>>>>>    -static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>> +static int hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>    {
>>>>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>>>>        unsigned int num_copy_engines = 0, num_paging_engines = 0;
>>>>>>> @@ -667,6 +667,27 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>        if (num_copy_engines && xe->info.has_usm)
>>>>>>>            num_paging_engines = 1;
>>>>>>>    +    if (IS_SRIOV_VF(xe)) {
>>>>>> maybe:
>>>>>>
>>>>>>      if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
>>>>>> or
>>>>>>      if (IS_SRIOV_VF(xe) && xe_uses_paging_class(xe)) {
>>>>>>
>>>>>>> +        u32 vf_num_paging_engines;
>>>>>>> +
>>>>>>> +        /*
>>>>>>> +         * PF could in theory reserve multiple paging engines, which
>>>>>>> +         * internally the submission/scheduling backend can load balance
>>>>>>> +         * from. Not something we currently expect, but we are at the
>>>>>>> +         * mercy of the PF, so we just need try our best to mirror the
>>>>>>> +         * paging configuration.
>>>>>>> +         */
>>>>>>> +        vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
>>>>>>> +        if (vf_num_paging_engines) {
>>>>>>> +            /* This should only be non-zero on NVL-S+ */
>>>>>>> +            xe_gt_assert(gt, xe->info.platform >= XE_NOVALAKE_S);
>>>> missed this one: I'm not sure we should use assert here:
>>>> it's not our fault after all, but it's misbehaving PF,
>>>> so either we silently live with that or abort
>>>>
>>>>>>> +            num_paging_engines = vf_num_paging_engines;
>>>>>>> +        }
>>>>>> hmm, so what should we do if vf_num_paging_engines is actually 0 on NVL-S+?
>>>>>>
>>>>>> can it be due to GuC FW being older that 1.36 on NVL-S+?
>>>>>> can PF skip programming paging class on NVL-S+?
>>>>> PF can indeed skip programming the paging class and that is a valid (although currently unexpected) scenario.
>>>>>
>>>>>> maybe 0 on NVL-S+ is a good reason to abort the probe?
>>>>> The expectation from the GuC side is that if PF has reserved a paging engine then VF must match it, but if PF hasn't reserved a paging engine then VF is free to reserve a BCS to do paging.
>>>> but then this paging engine on VF side will not be a paging CLASS, as the rest of the code may assume
>>>> or it doesn't matter for the VF?
>>>
>>> You're right that if we reserve a BCS (like we do now on current platforms) then it needs to be submitted as a COPY class and not as a PAGING class.
>>> It looks like xe_hwe_to_guc_class and xe_hwe_guc_logical_instance might be unconditionally returning PAGING class on VF if we're on a setup that supports it even if PF has not enabled it (unless I'm missing something), so that might need to be updated.
>>
>> I was indeed missing something :)
>> xe_guc_has_paging_engine(), which is used in both xe_hwe_to_guc_class and xe_hwe_guc_logical_instance to decide if COPY or PAGING class should be used, on VF returns true only if PF has reserved a paging engine (see patch 10); if no paging engines are reserved the code should automatically fall back to COPY class.

hmm, so maybe we should move that VF chunk from patch 10 to this patch here?

> 
> Yeah, should "just work" either way.

ok, so either way, with at least assert fixed,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> 
>>
>>>
>>>>
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
>>>>>>> +        return -EINVAL;
>>>>>>> +
>>>>>>>        reserved_logical_bcs_start = num_copy_engines - num_paging_engines;
>>>>>>>          /* FIXME: Doing a simple logical mapping that works for most hardware */
>>>>>>> @@ -688,6 +709,8 @@ static void hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>>>                }
>>>>>>>            }
>>>>>>>        }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>>    }
>>>>>>>      static void read_media_fuses(struct xe_gt *gt)
>>>>>>> @@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>>>>>>>                return err;
>>>>>>>        }
>>>>>>>    -    hw_engine_setup_logical_and_paging_mapping(gt);
>>>>>>> +    err = hw_engine_setup_logical_and_paging_mapping(gt);
>>>>>>> +    if (err)
>>>>>>> +        return err;
>>>>>>> +
>>>>>>>        err = xe_hw_engine_setup_groups(gt);
>>>>>>>        if (err)
>>>>>>>            return err;
>>>
>>
> 

