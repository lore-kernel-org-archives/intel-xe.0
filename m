Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C5BC3A59D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 23:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79CB10E890;
	Fri,  5 Apr 2024 23:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hWoYvW6g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C2510E890;
 Fri,  5 Apr 2024 23:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712360579; x=1743896579;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rkN6wQzvG3MFu1DelBjGRzAbFlN4TjCoGPy4VwpjLCk=;
 b=hWoYvW6gShROTeNE2yfKy+vj1PFMi48VkTvi36bb/Dt/Bf+5eIOhzDr3
 5u9yBEciEy2Dj4yn/1ngel4Hr/sCh3z5pR1/07n3LTIWPUftbMimB7W22
 hZE5RvVNIJdUT7hcOo6D1s4R4JYbCiWCTQ0Ivu5+JDUOV4QHDYziOtm9z
 I+/+bzGjMf53VN3tm5SHcFk4mINSkIlmy0kkWvJ2IXB0fi6Iza/rt/8Rl
 N1fc1GcbLRO2tMSV8WX19fs+n5SdE7XBMBJVsRKBjiZhD1ZJ7jGp5ZTu0
 5ieWefFa74AAqu1mu9qayU3JXtI1kF+Jpu3WnjPIC9jZxajKnHVRtoxLd g==;
X-CSE-ConnectionGUID: EgC/g96LTd2JMc0RIsIEGw==
X-CSE-MsgGUID: qY62p1jHSiqEHga6T3/dHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7589399"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7589399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 16:42:58 -0700
X-CSE-ConnectionGUID: 2SIwqbcGRIeb6HA3zB6dBA==
X-CSE-MsgGUID: LFxzHzUDRbestm3UVE1xJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; d="scan'208";a="19753604"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 16:42:59 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 16:42:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 16:42:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 16:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNZdAnnNQFbXf2Y+6Y4XoiBOMXpWvDLwhcBZFabdprLYm54VYGSgYCrYWAezGAZPdKqrOK93nNtB2LkmWP05CdQfgDmR2MPXJ9VmuGX1XL7f1fDiVy8iJT5yNHXsfAHHq9RDkiDqL2mftkwpljbiorixnTlImHGSNzRTYTmzXxMAZvNWjlgx7x7veoT3HAK5tA1A57O/O3ygIbZXwc7H2OCscuFXx5fQy9ZW3BEmIE6ckZNifvs6h73P/zURKi8CTbzHbJbHRvw8g1MblH9zBs7osA0B6xbPkpjCEUajf3Ve0b9SExKxuplpH/QW8ecXcyjmAQlPyvmxpk7LP4U+bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v8H/ov9W1X3FYI4NawJLpf46tkNRDzKB2CSUtVajcU=;
 b=hpcdiHjj78NpiQaXdNGfHQXynEUfFR/TQePxH8GDRFCbqOWGCIRXg3VxS28SMVzYNvCVg07dimSH8vw1hYPGFcZGDZByBPqwNVMo7o5fEzGGxSjYHYcMfmUPqKyQATH9XHZyBdKesT+T73d8M2P4a0nP9gf+LC0J5PbcJoFVyGyBySMUSPZzcL2wxgkx7JwUyHd6EoPOL3VvU1WWyQcUPeedw1DH5mj2ErfkHP6bAIQ4PNutQVUDwuI9NfQEUhaNYdaPVg1pPkrzBm3BDDTgnGY6MAHuJuaML6ezXborIZ7To7w3JpiXyLY7mtSJ2S0KM4hxZ71gYfmdBsH6p4uMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 5 Apr
 2024 23:42:50 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 23:42:50 +0000
Message-ID: <d03eddc7-f35f-422f-be9a-1d5af78ecd77@intel.com>
Date: Fri, 5 Apr 2024 16:42:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
To: Matthew Brost <matthew.brost@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
 <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
 <SJ1PR11MB6204AA1AFB30BFEF7EBAA3D281032@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <76010aec-7937-4e5a-afd2-672b338df8df@intel.com>
 <ZhCKOUi3cn+n2p8j@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZhCKOUi3cn+n2p8j@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB7356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0+wZRBQM1OQC8ePojLrzuaSdU5/P2au0dfJQWROsBG8iP6VJzOh5uNlfRST6+HFeVKjy4WDuSu2Or3oMq9U5VrbZy2giD8+hr/Nlk93rZc1TtJOBukXXsKEGgoR09J7+5LxpsHCxvOK3mh2HCQLoQg1VZLLCaBOV/RpUi2OX1XL34fRgxRqx4LEnC+gwFWIIq+bcIr0zFr5vJt1hHSoUBDxoq8ImlJc4984qtuX3Q4N79y8UdFOp+mGBC+esViyl1HIp+l9Suw9s02cp7QNYpihJLLUqvqnkYNpMn9DWZt6ZFOC054lEUn2GhHMKBx5l1Lb152TQca1eSz9B4Imiu9ugYMfiUWDatk9TLbpX8q+oHdaH3gbo8afQG5+ZzpUvmvLb7uHHaUIwNnS2KGzvTqAB27/QlA+w5FYiVqA22lSAZu7+HbctAYJL8x6By4DwAzzGc4O+19jDG7SJPuSXtJxfCjAAnP3ufTeVUEM9Ad56Edh8wQiQkgeiQsGuodLWlD9mG+LGwnE2urZmThYI6AYLL4yJw/6DHCrZ736fQlRAjSN6YZ2HiR0CrAp3qjd3zcs3UeM25J0zQ7BGvTEXhXe2Vs9yhWSWyqjMu5X7vaQcfYnQpLosvJwWevO0fieNpGpHIfwMW9Yvehc6Nehib/sG9ZXdOIla1pUdhHHQ1sA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUR3c0ozYUloN3NWTmRGQ0VWMXJRNis5TkVaZ0RYcERUZ2laeG1jN1g4bzB0?=
 =?utf-8?B?VFF2V0ZoQWFBamVCUzlTR2YraVhxTUJnRTN6eGxzQlFITEVmaitzTjFsRCs5?=
 =?utf-8?B?SGh2N1hLWklqRVdUbmJLbWZvdEdkSXM5cUtHVi9EcCtiTGFQWkJuWTNaNlVP?=
 =?utf-8?B?QTJnR01hYjJ6eUZPaGdlY1hudzJLb21ScmkxZ3o0N2dNRVBRZ1N2S1ZyeWZu?=
 =?utf-8?B?SFg1V0U4bGJwWEZSSGF0SHVIdE9aNUp1K1EwZFo1aGJIcjRJbDVyWVV5bGNy?=
 =?utf-8?B?TDlCTzA3RGNkS3h6SHIvYUxpMmRXVjI0NzFBTTgxTTZpaURtVDU5RlVqTTh0?=
 =?utf-8?B?RFhYZVdlbDZDVmJjVDhGWDYwNVo0T2srRStqRkx2aFBMbVFySWZEOUVxcVFn?=
 =?utf-8?B?UVZTMll4elQ2QWRmWFR5eWM1dkx6ZXFKbEU1QWFkV2M3Y016dzVwNEJiUG1S?=
 =?utf-8?B?NUJUMGVFM3Z2OVVCemtNTWY0MlRERWNkQUU4cnVpOVErM3MwTFhHK3M2M2g1?=
 =?utf-8?B?c01rMzBaaWJDMGdvMXhKMXp1Y0wrVUxwcW9hQXBEbTN6bFhPVjBFbFdNTno1?=
 =?utf-8?B?SllkOVk4U1pPSEJHMGRtanN6WFNaWDNDYWsrZW9xeEx4K0FGS0IxUkFmZklC?=
 =?utf-8?B?V1g0Zkl2b2dkZGQ5aHBvZGdnUGpKUHZMYm55WEI2dnM1SGZSY1FXU2JBajht?=
 =?utf-8?B?Q1dyWHlxVGhUTmZqd1dZWFFscStTeWF5YXVpNWJsWW05bDFMSy9KaXorS3dy?=
 =?utf-8?B?a0dydlcwKzkyTmxKZzVCVmZZRlplcFlWZUwxNCt1ejF0ZWZMa0cwckowcnp5?=
 =?utf-8?B?a1liQVJKcmNQZ2J5MXFnbngwUUdWUTZCQzU1bU90VFRaNGtmK0NPbFg1cFVT?=
 =?utf-8?B?dUZFRlhkcG9CVDlLOFFZWExBenI2UWduaFlxOXJPcVFyeXhmdlFmTC9MWVNK?=
 =?utf-8?B?RC9LUWxQdUF3b2VHZllwb0hXTVFBbUZMTGtXeDAxVXhLYnVRNm1OUStVclkw?=
 =?utf-8?B?L2NpdEFma1hCK2t4L1p4ejh4UHRHdXU0TlF2dmZ6dkFXOGhGNmhSOER0ZlEy?=
 =?utf-8?B?d2FkbnhpZlRvTGk4d2ZLeldOY05lbUNqemtUanRpZEx2Y29CbU1LN1NSZWxE?=
 =?utf-8?B?SmVYaGgyOHhxVmhKWURYbXhGUkFQWFIvVFZLSC9YeFd0ZXkyK0N5eHJ4anZL?=
 =?utf-8?B?QkZYTUxOSW5vdXQ3WkZKdVRuWUFmYU0xTUs0czVTcXVJS2dsdVVGL05FbG8v?=
 =?utf-8?B?T2VsdVhreXhtVm1yY3lId3BzaFVBdFVwWWJ0TXFmZzBiSCsrbUtiQlg1d0U5?=
 =?utf-8?B?YkZORlorT3ExM09pSjhpWTVua2dmUDc0VSs4TEZWdm5kazNCMHJVTWI2N3o2?=
 =?utf-8?B?dVFuVGxjWkJZaDUxSDNuTXNqRUMyL0F3ZFN6cXQxL09yMUJOWGZoek9qem5a?=
 =?utf-8?B?d3R5SStvcFdyMXZhQ0xwbmRWVTF3OWREZ0lDTGh5TmVTa29FbURCaUtUbEl0?=
 =?utf-8?B?dUFjYmg4Q0pOVUU5SkJmdmdGeDVPc3hPdFZhRXdhRm9lYlJlNlpWSFhtRFhh?=
 =?utf-8?B?bnBnN3llcjBncTZRa01rcWRzTTdBeHEvMHJwY0k2QlRwaFhXSmF5aTNQSlYw?=
 =?utf-8?B?ZksxUHBHencvU3dINmgranNtREc1V1JaYW5qQTlZTk96UTJnOTNxYlZtRnJY?=
 =?utf-8?B?enZlOHlEY0xOdDNvUG9WLzJRRU1CSDg4aS9RdEVTQ05Ga2o2NnFOQWhxTU05?=
 =?utf-8?B?aVVzaEh6aTlkdGx5OFhyU1VzajhFRmRvamJkK3NzT04vaEFYSVhtdHFSS3lo?=
 =?utf-8?B?WjlYV20zZ3lDV0dSeGZDdzhKcU11VDNrTUpEK3RnMms5UlRJamU5M0hmRFl3?=
 =?utf-8?B?bTUwSkRLaG1CNHZKSUtqY3ZTZDhFSjhUSnJ1c21UY2d4MnhBV1dHWGJYNlhP?=
 =?utf-8?B?ZlZGL25WbFl1OUFObUpVK3Yra3B1cnV5aGE5eVNDZEdQK0JTUTlkOWlpMzBx?=
 =?utf-8?B?MVo0Y3RQN3F6Rm9sRDR3ZHlYU1crdUFXWjdZNVY3WU0wVE5jOEFlMU44LzhS?=
 =?utf-8?B?MVBRQ2FRUktiaTlDcnd4aU1RNmYwUlpGL243aVh2dG40Nkt3WHFTQ3Roai9x?=
 =?utf-8?B?YzRicWlaRlpibDI5NnlmZmJ2blMwbk1Dd1p2L1BZU3FsVThGM1REcEtIM3lj?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2739164d-dea5-460c-0af7-08dc55ca1af6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 23:42:50.6928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3bMpR9JuFm+7RfqavtKV+2ACofLDPLE5LEZKOagrrtXZbEazOFlhkDJhioTGP77Oseg88DuNEas1Edpw1UQSuLwMmxrg0ZQVK2+ZygTYxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

On 4/5/2024 16:33, Matthew Brost wrote:
> On Fri, Apr 05, 2024 at 11:15:14AM -0700, John Harrison wrote:
>> On 4/4/2024 21:47, Upadhyay, Tejas wrote:
>>>> -----Original Message-----
>>>> From: Harrison, John C<john.c.harrison@intel.com>
>>>> Sent: Friday, April 5, 2024 4:53 AM
>>>> To: Upadhyay, Tejas<tejas.upadhyay@intel.com>; De Marchi, Lucas
>>>> <lucas.demarchi@intel.com>; Roper, Matthew D
>>>> <matthew.d.roper@intel.com>
>>>> Cc:igt-dev@lists.freedesktop.org;intel-xe@lists.freedesktop.org; Brost,
>>>> Matthew<matthew.brost@intel.com>
>>>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
>>>> domain aware
>>>>
>>>> On 4/2/2024 22:35, Upadhyay, Tejas wrote:
>>>>>> -----Original Message-----
>>>>>> From: De Marchi, Lucas<lucas.demarchi@intel.com>
>>>>>> Sent: Wednesday, April 3, 2024 2:26 AM
>>>>>> To: Roper, Matthew D<matthew.d.roper@intel.com>
>>>>>> Cc: Upadhyay, Tejas<tejas.upadhyay@intel.com>; igt-
>>>>>> dev@lists.freedesktop.org;intel-xe@lists.freedesktop.org; Brost,
>>>>>> Matthew<matthew.brost@intel.com>
>>>>>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests
>>>>>> reset domain aware
>>>>>>
>>>>>> On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
>>>>>>> On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
>>>>>>>> RCS/CCS are dependent engines as they are sharing reset domain.
>>>>>>>> Whenever there is reset from CCS, all the exec queues running on
>>>>>>>> RCS are victimised mainly on Lunarlake.
>>>>>>>>
>>>>>>>> Lets skip parallel execution on CCS with RCS.
>>>>>>> I haven't really looked at this specific test in detail, but based
>>>>>>> on your explanation here, you're also going to run into problems
>>>>>>> with multiple CCS engines since they all share the same reset.  You
>>>>>>> won't see that on platforms like LNL that only have a single CCS,
>>>>>>> but platforms
>>>>>> but it is seen on LNL because of having both RCS and CCS.
>>>>>>
>>>>>>> like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset
>>>>>>> on one kills anything running on the others.
>>>>>>>
>>>>>>>
>>>>>>> Matt
>>>>>>>
>>>>>>>> It helps in fixing following errors:
>>>>>>>> 1. Test assertion failure function test_legacy_mode, file, Failed
>>>>>>>> assertion: data[i].data == 0xc0ffee
>>>>>>>>
>>>>>>>> 2.Test assertion failure function xe_exec, file
>>>>>>>> ../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec) == 0,
>>>>>>>> error: -125 != 0
>>>>>>>>
>>>>>>>> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
>>>>>>>> ---
>>>>>>>>     tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
>>>>>>>>     1 file changed, 25 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/tests/intel/xe_exec_threads.c
>>>>>>>> b/tests/intel/xe_exec_threads.c index 8083980f9..31af61dc9 100644
>>>>>>>> --- a/tests/intel/xe_exec_threads.c
>>>>>>>> +++ b/tests/intel/xe_exec_threads.c
>>>>>>>> @@ -710,6 +710,17 @@ static void *thread(void *data)
>>>>>>>>     	return NULL;
>>>>>>>>     }
>>>>>>>>
>>>>>>>> +static bool is_engine_contexts_victimized(int fd, unsigned int
>>>>>>>> +flags) {
>>>>>>>> +	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
>>>>>>>> +		return false;
>>>>>> as above, I don't think we should add any platform check here. It's
>>>>>> impossible to keep it up to date and it's also testing the wrong thing.
>>>>>> AFAIU you don't want parallel submission on engines that share the
>>>>>> same reset domain. So, this is actually what should be tested.
>>>>> Platforms like  PVC, ATS-M, DG2, etc. have some kind of WA/noWA which
>>>> helps to run things parallelly on engines in same reset domain and apparently
>>>> BMG/LNL does not have that kind of support so applicable for LNL/BMG with
>>>> parallel submission on RCS/CCS only.
>>>>> @Harrison, John C please reply if you have any other input here.
>>>> I don't get what you mean by 'have some kind of WA/noWA'. All platforms
>>>> with compute engines have shared reset domains. That is all there is to it. I.e.
>>>> everything from TGL onwards. That includes RCS and all CCS engines. So RCS +
>>>> CCS, CCS0 + CCS1, RCS + CC0 + CCS1, etc. Any platform with multiple engines
>>>> that talk to EUs will reset all of those engines in parallel.
>>>>
>>>> There are w/a's which make the situation even worse. E.g. on DG2/MTL you
>>>> are not allowed to context switch one of those engines while another is busy.
>>>> Which means that if one hangs, they all hang - you cannot just wait for other
>>>> workloads to complete and/or pre-empt them off the engine prior to doing
>>>> the shared reset. But there is nothing that makes it better.
>>>>
>>>> I assume we are talking about GuC triggered engine resets here? As opposed
>>>> to driver triggered full GT resets?
>>>>
>>>> The GuC will attempt to idle all other connected engines first by pre-empting
>>>> out any executing contexts. If those contexts are pre-emptible then they will
>>>> survive - GuC will automatically restart them once the reset is complete. If
>>>> they are not (or at least not pre-emptible within the pre-emption timeout
>>>> limit) then they will be killed as collateral damage.
>>>>
>>>> What are the workloads being submitted by this test? Are the pre-emptible
>>>> spinners? If so, then they should survive (assuming you don't have the
>>>> DG2/MTL RCS/CCS w/a in effect). If they are non-preemptible spinners then
>>>> they are toast.
>>> Main question here was, if this fix should be applied to all platforms who has RCS and CCS both or just LNL/BMG. Reason to ask is, only LNL/BMG are hitting this issue, with same tests PVC and other platforms are not hitting issue which we are addressing here.
>> And the answer is that yes, shared reset domains are common to all platforms
>> with compute engines. So if only LNL/BMG are failing then the problem is not
>> understood. Which is not helped by this test code being extremely complex
>> and having almost zero explanation in it at all :(.
>>
> Let me explain what this test is doing...
>
> - It creates a thread per hardware engine instance
> - Within each thread it creates many exec queues targeting 1 hardware
>    instance
> - It submits a bunch of batches which do dword write the exec queues
> - If the HANG flag is set, 1 of the exec queue per thread will insert a
>    non-preemptable spinner. It is expected the GuC will reset this exec
>    queue only. Cross CCS / RCS resets will break this as one of the
>    'good' exec queues from another thread could also be reset.
If the 'good' workloads are pre-emptible then they should not be reset. 
The GuC will attempt to pre-empt all shared domain engines prior to 
triggering any resets. If they are being killed then something is broken 
and needs to be fixed.

> - I think the HANG sections can fail on PVC too (VLK-57725)
> - This is racey, as if the resets occur when all the 'bad' exec queues
>    are running the test will still work with cross CCS / RCS resets
Can this description be added to the test?

> As the author of this test, I am fine with compute class just being
> skipped if HANF flag set. It is not testing individual engine instance
> resets (we had tests for that but might be temporally removed) rather
> falls into the class of tests which trying to do a bunch of things in
> parallel to stress the KMD.
Note that some platforms don't have RCS or media engines. Which means 
only running on BCS engines. Is that sufficient coverage?

And if this is not meant to be a reset test, why does it test resets at 
all? If the concern is that we don't have a stress test involving resets 
and this is the only coverage then it seems like we should not be 
crippling it.

John.


>
> Matt
>
>> As noted, PVC has multiple compute engines but no RCS engine. If any compute
>> engine is reset then all are reset. So if the test is running correctly and
>> passing on PVC then it cannot be failing on LNL/BMG purely due to shared
>> domain resets.
>>
>> Is the reset not happening on PVC? Is the test not actually running multiple
>> contexts in parallel on PVC? Or are the spinners pre-emptible and are
>> therefore supposed to survive the reset of a shared domain engine by being
>> swapped out first? In which case LNL/BMG are broken because the killed
>> contexts are not supposed to be killed even though the engine is reset?
>>
>> John.
>>
>>> Thanks,
>>> Tejas
>>>> John.
>>>>
>>>>
>>>>> Thanks,
>>>>> Tejas
>>>>>> Lucas De Marchi
>>>>>>
>>>>>>>> +
>>>>>>>> +	if (flags & HANG)
>>>>>>>> +		return true;
>>>>>>>> +
>>>>>>>> +	return false;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>     /**
>>>>>>>>      * SUBTEST: threads-%s
>>>>>>>>      * Description: Run threads %arg[1] test with multi threads @@
>>>>>>>> -955,9 +966,13 @@ static void threads(int fd, int flags)
>>>>>>>>     	bool go = false;
>>>>>>>>     	int n_threads = 0;
>>>>>>>>     	int gt;
>>>>>>>> +	bool has_rcs = false;
>>>>>>>>
>>>>>>>> -	xe_for_each_engine(fd, hwe)
>>>>>>>> +	xe_for_each_engine(fd, hwe) {
>>>>>>>> +		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
>>>>>>>> +			has_rcs = true;
>>>>>>>>     		++n_engines;
>>>>>>>> +	}
>>>>>>>>
>>>>>>>>     	if (flags & BALANCER) {
>>>>>>>>     		xe_for_each_gt(fd, gt)
>>>>>>>> @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
>>>>>>>>     	}
>>>>>>>>
>>>>>>>>     	xe_for_each_engine(fd, hwe) {
>>>>>>>> +		/* RCS/CCS sharing reset domain hence dependent engines.
>>>>>>>> +		 * When CCS is doing reset, all the contexts of RCS are
>>>>>>>> +		 * victimized, so skip the compute engine avoiding
>>>>>>>> +		 * parallel execution with RCS
>>>>>>>> +		 */
>>>>>>>> +		if (has_rcs && hwe->engine_class ==
>>>>>> DRM_XE_ENGINE_CLASS_COMPUTE &&
>>>>>>>> +		    is_engine_contexts_victimized(fd, flags))
>>>>>>>> +			continue;
>>>>>>>> +
>>>>>>>>     		threads_data[i].mutex = &mutex;
>>>>>>>>     		threads_data[i].cond = &cond;
>>>>>>>>     #define ADDRESS_SHIFT	39
>>>>>>>> --
>>>>>>>> 2.25.1
>>>>>>>>
>>>>>>> --
>>>>>>> Matt Roper
>>>>>>> Graphics Software Engineer
>>>>>>> Linux GPU Platform Enablement
>>>>>>> Intel Corporation

