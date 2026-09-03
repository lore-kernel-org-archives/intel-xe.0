Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5E1C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 03:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C85510F38D;
	Thu,  3 Sep 2026 03:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fvrh1pJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E36A10F38D
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 03:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788407101; x=1819943101;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rpQ+22aKLICk0Jgh2xjLj8ECMoEWc5LSwDQ2CpgLbqA=;
 b=Fvrh1pJTJhNy/OBI246nsdRg+Mko4diQhOPeTpA/ftRlBoFmN2XInJa2
 ib30U0F2mtrjk2TJHL8cInFuwQm4ScFopX9j+m1AZm+KL/rG0belMCoNK
 Jgvgp89v/p/2yiiORYPeDCqgsfAzMW+9AH8c0uABRoFW7DqMxbk5lDiW9
 I+6p4+QnfPhSceqCmN/zBK3f3JGmvqTUXpY4ptz7SWwUY90eOpwpP60+O
 HizUPmQU5Ez+nQMfHuK2cYjItPY6Hyd/ZLSwF88PFzYepi6NAGIg4fWWu
 Dwgl1MLLjwlndI3M339tL3NVyLc1UXKsZRXrnsGhfzzGDqkyHmIinPKCb w==;
X-CSE-ConnectionGUID: EwwDuQ61ThG6QAohrDVzAg==
X-CSE-MsgGUID: ADaWbIp+QNWM2Rq86UVJGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88018693"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88018693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 20:45:00 -0700
X-CSE-ConnectionGUID: 3zl7woK1SSi/H5haW+/wCQ==
X-CSE-MsgGUID: qCNlcqgMTruohoWt1rJ5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266993869"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 20:44:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 20:44:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 20:44:58 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 20:44:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9HUPUUqalVFFvv+fY2AG1T4Zevr0BFu5DXk+mSNfdR6tYTI2GxlN0fzwxiNMbzbPwQuPiEEdRRXV8aQl5WlaAdaIKWF2iciOsLRiCglEf+PRUp8VG0MOmxVpH6mBVrRasVAuzDj6v5TVeNsYhccEP1sAdPvk4obde6WGcMBEutYjKJgrTG8a7e4IVV541vKQpvTYNBuaNWewfw0ulbAE91mKLwMl7fWyvWGXAcAWc7IE3GqyEkfp9yBF+eAPErLJ7m1Vn3q6rNdE0FiBp5/5o1T0ckngHBS2DoJJuDB/qWaHT6OAjQVxUAjnDtmiVzD9BBEhVi1MrVBYhEo23Y0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db6fsVGL3JfMHb/XDkfGOd+iWqYkmz2f8uiWVttYcOo=;
 b=NIVMgSraOhj7iFOl5hbAbYO7eGcx1EoCM3eYFmPoNLGTTGVyd4AXQvhM9ztD4/jw8m4rvks0mjbYPlBzVUsNzq9nm5qAOHKHiCiiT37nAFYhKzsZxmUMlqUVn5dvwribKRzxnpJ1yetyordqahTxWXzT6zu0fx+JdDZsevg4lXMmPcoxXR/EXFP5z3k1HAJnBqsZnTMKuae2JJ4xGLdQtTxnS8yN5G46n6cCjvkOZFxO6Kj0v0cl9OpAkqfESOG5/iXXZOIZq6kPM7Zx3xiDFk/uAKecljQIIvwu+F2yljLL3e90epvTDvymFO3h/lSYLBPPhI6X5ya7XcqDCL0nNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH7PR11MB6907.namprd11.prod.outlook.com (2603:10b6:510:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 03:44:56 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:44:56 +0000
Message-ID: <e10762db-c219-4a1c-86de-efda27b265ab@intel.com>
Date: Thu, 3 Sep 2026 09:14:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] drm/xe/svm: Report terminal page-fault failures
 using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <badal.nilawar@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <mallesh.koujalagi@intel.com>, <matthew.brost@intel.com>
References: <20260901063059.2547247-1-arvind.yadav@intel.com>
 <20260901063059.2547247-4-arvind.yadav@intel.com>
 <5166575b-d624-4234-a9df-1c239ec3b318@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <5166575b-d624-4234-a9df-1c239ec3b318@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH7PR11MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: dca8b7dc-5b94-4ef7-2eb0-08df096db86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|3023799007|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 7MFjQ4MqR3biO6MDdp4OFqU/k//cGKyzX5UQTOfees/Ig/kbbnnp3XebFApLxo5qGCEt2h/zIjXs94DPqxJO5XaTuyC2W937cw6fX/kknwDf40UbTb0qfYSVy7iU8fXknArwCLrNLDsRsToafVwV9DZDP0D3mJTKj3RF8/FCZ2PgyaYPj3hh329zKBqU6Dlff5AXTFndbpjHmIjUUBfHnx8rYDP+R7IzS7APXfPeS6YMCM9lnrjpcXL05G2+aoikMXID8eNJj9aLLlrFuN77FC5TKyCrvKqDX58n8JPi+fKIvNJPcz23ucEHWUXtmDhXnqiD6hR1oBhKuMQHec742M8kfo/K+ByW/hAd1dOk5pm+V1IfgWK+X5jftzqfHjGO3Vgn8nuRFalzUFk2d8LAENSu3HrypoUHjAa7jQFOZlYMgzlEwvDS9eaYbDZ1ah5+jBJ0+swEGD51g+jtcR9bih3hRwi0Fp0LKeAGf3PRxM7RLthcVmPVnocUDH1kBQD/0c1cNKhJJXIY9Zd4ORvTOQLVET2xAUAr9yaKl7yq4IyXCHJDEGSRL/CBPhsyNlXa0lpc7f98mvIcy14E7mqr45fGFM5U4TZVcEm853Z7pIrlNyb7nGkcesWPp1kLV7s9N6jPqDmmKWA9G6ZUlVn+unRuiGdlFVbc2LebIRpQ9CU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(3023799007)(18002099003)(22082099003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHk4OEUzekE1cGJqZ0hhcHNQVVNuL1BnQkh5djFBQSsyd2w0ckJ6ZEJoYzdl?=
 =?utf-8?B?end6L3dUMjNHRDJlbldqbUFuTnZRcGxUM2ppNXIrMmRRZHRDeTRnNEJUbFRQ?=
 =?utf-8?B?Y1RYbGJsMWVOZTFlNStmVmNxR1lCKzdLbHlrOUZYNXFxeVl2SndJdjJPSG5w?=
 =?utf-8?B?Q09XbllPZGRCaHlzNlhPb3RJd1hYVnVGeGw4RExsUC9OSWpVRi9KYWFCZFBa?=
 =?utf-8?B?YW4vclI5VzZUaklsSXA4eDlFdHlEZSt3Zk83NlJ0UkYvSitDS1VRVWs3ZFJP?=
 =?utf-8?B?ZGI3U015eThkWWUvSkRWODlhd3dUNlR1REF2a1h6QmQvS1h6OUI2N0dtcUpJ?=
 =?utf-8?B?Wm8rblR4VU9oa1hzVEg2a1FqaXVSZURCRTgyRlZqaXFWZHRIa2NPL3Z4bWtM?=
 =?utf-8?B?QTZaR2ExTXV3cjB0aU1FSEdOWURHWFlkZ3p5RkFqdjVxVkh0NFJiVVhUL0dl?=
 =?utf-8?B?Zms0RzdIT3V4L3Zsa3pzUWl4UWFpZElPdDVYMWJwM2gvY0RGWUhMNmg0UFRt?=
 =?utf-8?B?SlorR003ckZIMTNZcG9RZExaSVBFUEZFeGxoMm1oT1c2ZmU0Y01uUjAxM2tW?=
 =?utf-8?B?WlgwUFkwVndrckNWNVdiQzd6MjFVYXR4czczbW5NM2diOTBZcUl0WmpLT0dk?=
 =?utf-8?B?d204dm5UNGkrTm5zdkVqZWpYUFpBOFFIcTZLa3RGVDFHSVZhbHMwTlhYMTc2?=
 =?utf-8?B?RXlPTmkrTVhuWXhPRnFzVEJ0TktabVZQazhXc25weTE2Z1AycGN2ekZiSlZn?=
 =?utf-8?B?M3VQT2tYNy9GUlNxZThQYjlGZEtiRzRkelJKYXFaalp6bzVod2d4ZmZrT0xi?=
 =?utf-8?B?TXZGcmpqb01VdVcvdEprK09KRFl1cTdJR2h2RFNHcEtjUFh0eWdCUGI1RkVz?=
 =?utf-8?B?dVNLT3B3YzFtRUVVSXFvNEtGazAxS28rL1BmYTM4dVdZM2tFSk1tYVVBUE80?=
 =?utf-8?B?MnByeTNRYnR0aFcvWWM2L2F5QTZmK21NMUlJNzFsdVM4dm5QVlQ4V1FQYkFK?=
 =?utf-8?B?UTBSUjcyQVJTU1ZaZkwxMXpKODNBZ0hHdWhza3cvSEc2bS9tcHlpc3Z0UW1Q?=
 =?utf-8?B?TFFnd2l0T3p4cmRGMUVmZm5OdmRLUWsyUzlsWFZZeE1YQUtBeG5LaGdNSjdV?=
 =?utf-8?B?NkYwUGYyaVlHMS9jek1FMmZMWmxOS1FsU1UwcXRIam5CeFpCaXFpVy9vOGVO?=
 =?utf-8?B?bC9xUzZCQXhRL2sxQ3J0WnlLL2hLV1Zxam8rbDdOaTBqYmlMM2xBRXA0RStq?=
 =?utf-8?B?YlpJVjdsdVFKN2FTSmlKSW0wKzkrYytRT2x4SFR1SElhL0N6SldsOXdLeEFn?=
 =?utf-8?B?R044T0pKcGFudWRxdWEvOVJ3RGg2cnRRVzEyZE1ZZkVUQ1VQRHovK2JieVc3?=
 =?utf-8?B?RHFZVkZncktwS0lTZEpwVjkwdGI1K0tkR21DRFh1dmlwdklaN2Z1Mk5zejFh?=
 =?utf-8?B?Y2RHS09LL04wL2pCcURFdk1HcjI4RFdrQkhYK3luSnNWUVovNm9zd1dWa0ln?=
 =?utf-8?B?NWliaE9CcUhNaFM4aUhWR0JSQlhjb3hMSjlBNXJzVEFGQzFUMi9jdWV1dW0y?=
 =?utf-8?B?K0FYUTdWMFBsZ0w2Y2xkc0N2bzV3a29RbzI3M0QvS05BMFZLZDdwbU1CYXBh?=
 =?utf-8?B?YXkzZ1J2V04vaEloYm9UeThocEVoYzQrRzEyQXYzbzRjTkxMRGhhM3hUTlk2?=
 =?utf-8?B?Y3RkTmxPMm9DQjNDOEg3Q2pnbHoydUdVT1pzckpqTjU4Z3R3Mm1PSUpuTm8v?=
 =?utf-8?B?bVk4TVdzdDM0SlFDblJDaDdkR0Vma01senJsdnBxKzJLTEtGU0JybTRWZ3pS?=
 =?utf-8?B?bmJuMlF4cWxUUnZza3FtbGt5UTVJalB0ci9Wb0QwRFkybThnMG1VTExic0wz?=
 =?utf-8?B?cEJEUkQ2ZzlxYncvYTNrK0htaVRKUGthSkhDYXp3Y2RJbzJiOWRuWTlXalBR?=
 =?utf-8?B?SlJJb2IvNC9BZ2ttVjF0RUdmOFpBZ2pOcXR5amgxaCtoUXVEbTZxNEJWcTVs?=
 =?utf-8?B?R2hrbkxvWEtYam4vVzFmbHlzUXZWSms4WHdIVS96NVVIMEJpcENzVmMzZ28x?=
 =?utf-8?B?Z1RhcDJLZ1NTYTl6MkR2WU9KS2Q4N2IvY3djUHBBcjRWNXNFeWYxL3JDODVP?=
 =?utf-8?B?cGRsV1F3TzdoL1ZyS2duRVlCNXliNkxTV1k1Y1FvVUV6T0p0cVpBM0RoRzhV?=
 =?utf-8?B?ME9XM3FYSTJMdk1kNkJtS2lGaXM4WDEvN01NU1dtbG14blZZYkhhUzhNMFdp?=
 =?utf-8?B?Zm92V2VZdmhHSGtpSGxHZjY1TUxOUHVkNEdzUGZjNnBRTGhpdXhlNE1heUE1?=
 =?utf-8?B?d3BwUThTOTF1a3YzQzExQzVyMlhPdjJRSURMQjFmeDkxVE0zNmZHQT09?=
X-Exchange-RoutingPolicyChecked: K5JFO9vxMQSPHOY04qChbuXIMLMb2sJzuyK7xK+iLp6HoqtwYPui6usYzXoV+Poe+wfLDn+ZetaElKXhCuKrC+bRaElHeeZNV+kZP/gTGnj/L2EApHJ9FOOWKqc/0d1Q4HmIwjdh4AJZWScKTUFWLMTbUkuMvt0DvHzP265Kf+N+DqmcYSmFHiFnI8npF2+mZiP/DbGjzuQCzFV5Er+M5PhUeCvDXLkMLKQVgelLvXhhzQz2NDGxkXkdNpHBGqTCjeaudie6FCmyc+r0quO6p1tK/561dZdxk8Hu7xNo/J52xJdDbGKjbWeL2YOiP8PZfNCrNKm61HF4/RiBGgZlDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dca8b7dc-5b94-4ef7-2eb0-08df096db86d
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:44:56.1864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2IU5Qp8GmGebPWJmp5YbKzvX9AuFnjeCtb5wSQVprwQ8h8aAgOoUmucB9W1gdXmBkYr5odn3qHEzh064wsw0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6907
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


On 02-09-2026 18:13, Michal Wajdeczko wrote:
>
> On 9/1/2026 8:30 AM, Arvind Yadav wrote:
>> Route terminal SVM page-fault failures through the structured SIGID logging
>> helper.
>>
>> These errors are reported only after the retry count is exceeded, so they
>> represent terminal page-fault handling failures rather than transient retry
>> conditions.
> that sounds like a LLM output
>
>> Use the PAGEFAULT component, which maps to XE_SIGID_MEM_FAULT, and pass the
>> real errno value to the helper. Pass the GT object so the report carries
>> tile/GT location. The helper renders the errno, so remove the manual
>> ERR_PTR() formatting from the message text.
> do we really need to explain here the details how xe_log() macro works?
> or that 'real errno' value will be used?


Noted, I will simplify the commit message.

>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index 627a741293d5..349e307ca092 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_bo.h"
>>   #include "xe_exec_queue_types.h"
>>   #include "xe_gt_stats.h"
>> +#include "xe_log.h"
>>   #include "xe_migrate.h"
>>   #include "xe_module.h"
>>   #include "xe_pagefault.h"
>> @@ -1361,9 +1362,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   				else
>>   					goto retry;
>>   			} else {
>> -				drm_err(&vm->xe->drm,
>> -					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
>> -					vm->usm.asid, ERR_PTR(err));
>> +				xe_log_err(gt, PAGEFAULT, err,
>> +					   "VRAM allocation failed, retry count exceeded, asid=%u\n",
> s/asid/ASID


Noted,

>
>> +					   vm->usm.asid);
>>   				goto err_out;
>>   			}
>>   		}
>> @@ -1384,9 +1385,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			range_debug(range, "PAGE FAULT - RETRY PAGES");
>>   			goto retry;
>>   		} else {
>> -			drm_err(&vm->xe->drm,
>> -				"Get pages failed, retry count exceeded, asid=%u, gpusvm=%p, errno=%pe\n",
>> -				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> +			xe_log_err(gt, PAGEFAULT, err,
>> +				   "Get pages failed, retry count exceeded, asid=%u, gpusvm=%p\n",
>> +				   vm->usm.asid, &vm->svm.gpusvm);
> s/asid/ASID
>
> also, does it make sense to log the gpusv kernel pointer ??
> maybe log the gpusvm->name instead?


Noted,
I will log the GPUVM name instead of the kernel pointer.

Thanks,
Arvind

>
>>   		}
>>   	}
>>   	if (err) {
