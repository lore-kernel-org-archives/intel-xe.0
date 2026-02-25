Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8536CEFD237
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 09:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FDE110E731;
	Wed, 25 Feb 2026 09:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWiV3FSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F16210E731
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772012462; x=1803548462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RJiq7wmDMa4jfFfh63kEiVOWpF7vEu/NiipxUlOIEzw=;
 b=aWiV3FStWtybpKEP+CRByQ7iCiVCJACneWOPtb44EktJJ/QperIyFbjK
 vQwF457zpTdBAciOva59lis9k77Tyg5VAOlAAWwY2ZZVAUw6bL4+xae7M
 nIBMbdEgIgtdgUtF7dHcnC7c/bfsVn2NJHfOqmQOMzuA4pCXkW6ZKALEI
 kybDQDWaV1ad3VHSyNwSzUXKKBue43Ddh22ZjCSE2qgFY1KQGDSoSawk5
 NwmnAeFNRBD1J4ezXqHhiobMSDnqBmDFUvhEaOrmIbS372OKS1/8xHO3Y
 hZWm8r1bGIiGAb6EdUMkkr5OIETKn8ZuARUo2sKkEYdykdde2QuyF29Re w==;
X-CSE-ConnectionGUID: TpimplekSACNI/s3IaGCRg==
X-CSE-MsgGUID: Qg93KkeXRV6OFcqyToyyjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84137457"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="84137457"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:41:02 -0800
X-CSE-ConnectionGUID: HWWrm1kBQRuBlh3PIcKDtg==
X-CSE-MsgGUID: Na6PwRX3TZWM5vBWNlTMIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="220298483"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 01:41:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 01:41:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 01:41:01 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 01:41:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq/6TrgHQnAE+ZLHvxykLCbe5VSmlEOr+8pTiNxOOY+M8NST7PBB05freAQpXdf4SW0fCDRdqgFc/Jy0rm/Ker1yxqklGFqMu6q1jbNgJ/FT84+JOr6iGcW13vAf3zJ7KUCuXSZfmZVGtrF3Z7gccQt75hr9plExNXryff9G3L4n1ial7rDAE3i6MmJU65GOZtqylaJqQZBverjMHOWDrxmMrA2N1pIAHgkxoNLplAT8VF+HR6+g3dk2Xz6iskB9AYp/zk1qu8Nl2NIHuutZHrS1IpL+JiNVMofulnSgddH8ASe2cu6P5+6NzMgMHI17l7FX26gT1qwrvQH7lbqmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKirwm9cpSwBhkzGNvMHh0geHAnVjXEYTSdHaGbEqaI=;
 b=l7m9KGz7F/UWsjRy89AUJC+XPOL15Q7x42ql7bu+Q0OZOhB2/8qROhA+4iUF8y2HJ8IOeSOcbmGlzlbWrAtEEJCPkDF8ZQHOC4TnhUcL7iA98h9iHJvC0TnkFz4JL9BlNJOSpyZGYpBcKTxMnKrw21OcvIazYa6l7V9yDm7lru9yl581qSXSOW4lFY3FGJH4sTXsqzqIkTp2A4vdft2Tv6EouqVjUmdHupg3nU5qtLFFBNmDmFtDxYxWbsviCzA1oHkDY/g4L2+aE/7Pm3a5EmWD8B/qHiRZDxBeGt6WjX1P/1qhjMTsVAJx+GMQ9PtaQFiIcoohhctif+yAZrvreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by DS0PR11MB8072.namprd11.prod.outlook.com (2603:10b6:8:12f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 09:40:54 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 09:40:53 +0000
Message-ID: <02b79322-f378-4e4f-befc-3f9bba9f7830@intel.com>
Date: Wed, 25 Feb 2026 15:10:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-7-arvind.yadav@intel.com>
 <823a16af4733d5b82470b6ed6da203de09644caa.camel@linux.intel.com>
 <5aaab739-2291-441e-937b-746495ce7d58@intel.com>
 <aZ3TpuSFKzY4y9sg@lstrano-desk.jf.intel.com>
 <14753c79-df95-4c14-b78b-cbee2670dac4@intel.com>
 <de396c52e6ca7377cd9f6e58b172b2232da4de4c.camel@linux.intel.com>
 <aZ67AoEmxHz9rkly@lstrano-desk.jf.intel.com>
 <1fd477061dedf58f0e23d6b8e6715fdab50f88ef.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <1fd477061dedf58f0e23d6b8e6715fdab50f88ef.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0232.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::16) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|DS0PR11MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 134ca9ec-8543-4db0-94ec-08de7451f7ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 8tGkfrYaKqmcTe45jMTCx28G5qXF8T09bJvlVlIR/dNT+lk0CNTR5719d4oRvaj4ua5KNj+mmxuap4ciDMKyTV0k5CT1nTVMtMyDMMJFhLLmtzf8jY654/6asVlgm/pV1r6eT8DVc3F7Lm0V/DfoaquraOiU/h5KzQSoF7liHkHXVgoJQZ2kPBzPrvXCEgfWEEpqdxPBrbZbDzVNg6UHtxY0ViZyEua/u/WPIwlET4e2X72e326Mf39IpLkxMCmtDB0bIfjS8I/2St20/FMt/kLBWcqAWDhqWrNKurQ6NSsnUFV+/uzJ2lihfQr7C5jB8qCLHCiTRfws3gLcsVroxWY1L3RYAPxqTCBN/Rl/fFN6uN13zyAJlQOpGZXhLliy/JYmLFO+Hui/mDbWCR2viUAK6Os2/0iMGe1cE4necJ2leb9VAVE0TElpasmrA2GRpJQAzCgLuF4W4fBZg3voVmnaNnYhyF63C6mK37VjyczRdWM3KBVh6vP4A2YVk3f3IUmX4msZtnyGj75wQXgIxONWy7t2vTv8DfWXp+fqPuFAIKwKba0/JIudTny9lXwFhTVak8cyysGAMW+QrbWEmLprNsRS+rk7uVkoCaDtWgsC5jXWXsGJRzRE0v+6af2Ieu+YHRYRUN7ytMIjqOaGGKGiANi24Alq4tBm2Xso81LpG0L5NCZXA5RsFhvMONz7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KytPamh5dGtTR29aOVExZDFobmhUN2JhcFJ6bkNCVmFDVDFQMzdxRC96RDJa?=
 =?utf-8?B?M0prMExFUXZRa0xDY09UTE5pMktjeEdJWFNMVmxwZXl1S3Q0YmpMTnZMR0xE?=
 =?utf-8?B?SmxtV0ltcFE4UjhNZ2tzSlJaZVN3WTUyVG9GZDNPVHBuMXZjMk5tSWdMM1BL?=
 =?utf-8?B?SllDNTFVbGZZekhRY3VvWUpZRXZPNy9velI0RzE0dDd2ZisvVVAvOW5vVUJx?=
 =?utf-8?B?ZlpRNzYyRk1KOU9KZ05zb2NCUjVhTzIyeXNTUEF4NEl3T0kzZGYvZE9qOHlL?=
 =?utf-8?B?ckJmVXFMVndWb0tLVWFPWlZ2SW1PeCs3c2VhL2NUTGhhcjRScEhZbkxTUHdl?=
 =?utf-8?B?V0pvTDNMVGRlcStBbkFjTnlsbHEzV3hqK2IwUExiSVk0b0RvY242c3FaMHJ6?=
 =?utf-8?B?TXlhaHBEbTE1SjE4NTVaQy9SdER2OGszYXlEWUY4MDNxMFByTHFHZ044VmYx?=
 =?utf-8?B?THBlakkxNjlNTVkyRG84aUxiYUMrVDJwN1hnT0pXT2NlV2VzQlJzUy9RYVJH?=
 =?utf-8?B?V3Q4MVA4SHFvQlFYajdqbDVOK3BNMm1qZTZEK0hKMjRSNGhkRnpnSm9YRkFO?=
 =?utf-8?B?bTB5THArbkRiR0ZjS29SS08rK0lSZ2FCdmU1SytJaXpEcmljVlYwSGFicCtM?=
 =?utf-8?B?Sldsa083N0l3YUFRT3Jmb1NLWTliWHRrSUdpbzJhN1NOaGVBVnVNMVhXL0Vt?=
 =?utf-8?B?emVNMkFjYldpc3VhaG0vbUVYZndqMTBxWDF5QVVsOS9nREZxZUdoSW5OaTdH?=
 =?utf-8?B?TVpwTk9JVi9SR0tOUTdWTWV4NW54QkNIdGxQbUkrNkJoVnZPZmt6NVhUN2xO?=
 =?utf-8?B?TkZSMUxTdEY0TWpBN2lqd1QvSjUxbnFzZGliU0I5bjlwejBkZXgxM2ZUc1Ni?=
 =?utf-8?B?a1FKSCtKUUdCcTkyNGs2bEozV0tnSmFyZGRmQUpEaksyY05ucEkrQzJmQ1o0?=
 =?utf-8?B?aGJCVVYwWjVqWHpSMDM0V3FyQjB1OURqNWt1Q1BGWEhlaGoxYStLNzgrTmlz?=
 =?utf-8?B?RmxkcEdPNUNwYWgxbXN0WDN2YSt3UlM3L3VZd280bnNYSlRpRGlnUFRsNzEv?=
 =?utf-8?B?N1Y4T01ZcDZNY1dxeW1xc2NnMVQvWE55Vnkxa0VCTFU3Q0dicjJmNTdYNmtp?=
 =?utf-8?B?T01FemMrd3d4UUlIYU40OWVqbXE1Sm9PQzZkbTNPWnJUOE1HbDZ3bHFta1h1?=
 =?utf-8?B?dUtsWUpVa0NOSmU2UUtPTU42cXRzTEdYQ05qYllyRHJDTkMxUFNrYmhxbnQ2?=
 =?utf-8?B?UldYRDVyTUNhU0hiVEx2RmFtOUl1MXJpY2VRNEp3OWRHQ2JuQ0xtNVZTNHRr?=
 =?utf-8?B?cVl2amw3eE1QbEp4MlBmMzhDVGdEU1AxYWdlL3JsZzFaV1AvaVhDYUg2SFZ4?=
 =?utf-8?B?V25HVStRcjdlUW5mbnpNRG5BRjBhbFhSalRQcmRzUW90cVNvQlYraHpTdzhq?=
 =?utf-8?B?NG02Yk9JK2d2b0U2dzQzS29LMUJxTWxCUGdWa05LTEtHWkprLzhhVmNERWtY?=
 =?utf-8?B?QmJhVVRlV0NqSkZrcVBPaXkrMDcrSFhwZHhTQ1lsWmZWU044bmJKcmpVQUV5?=
 =?utf-8?B?b1pJV2tQMStxa1M0eHpiazRnL1UzWWR0Y21NYlRpczZZamEvTUl3MG4wSi9q?=
 =?utf-8?B?dC9WRnhwR216R2RHR05CdWhXSnhIZ2NtckhFeG4vZnlhUXJmeWRnaWdsNEtP?=
 =?utf-8?B?YkhTZndHZlVzWlNUQzBnMGk0bnhNdlJjbmo5VDJ1cEQzY2w0amcxRk1NNDRL?=
 =?utf-8?B?WG9sM1BuK3o0VmFVbUNadUdxbUxmWUkwRmVDVVlnenlsTll3MmVXdFpwNk5G?=
 =?utf-8?B?NnlCeGYzUmFwQjRmbXNyMjBiRmJ1RVFUNFRrbTczZ3hRU2pmaDUrZW1CYnVy?=
 =?utf-8?B?ZVNDTWpPeUpCcnVNcHQyUEVKTDRMYTFXWFo1WllRRm1jdC9PYWNYT0xyNmMv?=
 =?utf-8?B?UFVURkREdnVISGdZa1lrYWhYblBoMUxGWDhOWVpTcnYraEYwMVZyNjAwZWQ4?=
 =?utf-8?B?M2NGWVlXbllhWmxRU1pMbWJYci9sNTliOGRYcHROYUswTzluRmJFZXdINXdo?=
 =?utf-8?B?WTJ3aVRsdUpqNkJSUy9zQmlUa2NrRmtkU2tFM3gzYURzU2hmU0N2Qm5jNzIy?=
 =?utf-8?B?MzlZclhhYThCRFVoeXpTZ2dtazlFS3N2Vm1qRWdLaE4wMVRQV3dBalJ6bm5T?=
 =?utf-8?B?azQ1dUQ4RWFoODJkNGs4YVlrZ3ZpdW5kWFRuMVpyeE01WjRlRkgxZDZiK1V4?=
 =?utf-8?B?MDloY0xmWVB4bjRUdnpKdXdzcjRrQkhKM2tkUkl2UHFIeWNoZjd6ZXRISUhM?=
 =?utf-8?B?VVFIbWhKRGlURlgxcnlPa2JXNytNNGpQUlM2ZS91cWFsWXFFc3BJZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 134ca9ec-8543-4db0-94ec-08de7451f7ea
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:40:53.7915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfYwAnMlhbaFDjBtw6ORJk7alkgq/U/U2L3L9L4CrORhwC5CQkCVWE0t2I8MaATLVn8+867q43SGa+j7dXMLWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8072
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


On 25-02-2026 14:48, Thomas Hellström wrote:
> On Wed, 2026-02-25 at 01:04 -0800, Matthew Brost wrote:
>> On Wed, Feb 25, 2026 at 09:21:10AM +0100, Thomas Hellström wrote:
>>> On Wed, 2026-02-25 at 11:05 +0530, Yadav, Arvind wrote:
>>>> On 24-02-2026 22:06, Matthew Brost wrote:
>>>>> On Tue, Feb 24, 2026 at 08:37:44PM +0530, Yadav, Arvind wrote:
>>>>>> On 24-02-2026 18:18, Thomas Hellström wrote:
>>>>>>> On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
>>>>>>>> Track purgeable state per-VMA instead of using a coarse
>>>>>>>> shared
>>>>>>>> BO check. This prevents purging shared BOs until all VMAs
>>>>>>>> across
>>>>>>>> all VMs are marked DONTNEED.
>>>>>>>>
>>>>>>>> Add xe_bo_all_vmas_dontneed() to check all VMAs before
>>>>>>>> marking
>>>>>>>> a BO purgeable. Add
>>>>>>>> xe_bo_recheck_purgeable_on_vma_unbind()
>>>>>>>> to
>>>>>>>> handle state transitions when VMAs are destroyed - if all
>>>>>>>> remaining VMAs are DONTNEED the BO can become purgeable,
>>>>>>>> or
>>>>>>>> if
>>>>>>>> no VMAs remain it transitions to WILLNEED.
>>>>>>>>
>>>>>>>> The per-VMA purgeable_state field stores the madvise hint
>>>>>>>> for
>>>>>>>> each mapping. Shared BOs can only be purged when all VMAs
>>>>>>>> unanimously indicate DONTNEED.
>>>>>>>>
>>>>>>>> One thing to note: when the last VMA goes away, we
>>>>>>>> default
>>>>>>>> back to
>>>>>>>> WILLNEED. DONTNEED is a per-mapping hint, and without any
>>>>>>>> mappings
>>>>>>>> there is no remaining madvise state to justify purging.
>>>>>>>> This
>>>>>>>> prevents
>>>>>>>> BOs from becoming purgeable solely due to being
>>>>>>>> temporarily
>>>>>>>> unmapped.
>>>>>>>>
>>>>>>>> v3:
>>>>>>>>      - This addresses Thomas Hellström's feedback: "loop
>>>>>>>> over
>>>>>>>> all vmas
>>>>>>>>        attached to the bo and check that they all say
>>>>>>>> WONTNEED. This
>>>>>>>> will
>>>>>>>>        also need a check at VMA unbinding"
>>>>>>>>
>>>>>>>> v4:
>>>>>>>>      - @madv_purgeable atomic_t → u32 change across all
>>>>>>>> relevant
>>>>>>>>        patches (Matt)
>>>>>>>>
>>>>>>>> v5:
>>>>>>>>      - Call xe_bo_recheck_purgeable_on_vma_unbind() from
>>>>>>>> xe_vma_destroy()
>>>>>>>>        right after drm_gpuva_unlink() where we already
>>>>>>>> hold
>>>>>>>> the BO lock,
>>>>>>>>        drop the trylock-based late destroy path (Matt)
>>>>>>>>      - Move purgeable_state into xe_vma_mem_attr with the
>>>>>>>> other madvise
>>>>>>>>        attributes (Matt)
>>>>>>>>      - Drop READ_ONCE since the BO lock already protects
>>>>>>>> us
>>>>>>>> (Matt)
>>>>>>>>      - Keep returning false when there are no VMAs -
>>>>>>>> otherwise
>>>>>>>> we'd mark
>>>>>>>>        BOs purgeable without any user hint (Matt)
>>>>>>>>      - Use xe_bo_set_purgeable_state() instead of direct
>>>>>>>> initialization(Matt)
>>>>>>>>      - use xe_assert instead of drm_war (Thomas)
>>>>>>> Typo.
>>>>>> Noted,
>>>>>>
>>>>>>> There were also a couple of review issues in my reply here:
>>>>>>>
>>>>>>> https://patchwork.freedesktop.org/patch/699451/?series=156651&rev=5
>>>>>>>
>>>>>>> that were never addressed or at least commented upon.
>>>>>>>
>>>>>>> The comment there on retaining purgeable state after the
>>>>>>> last
>>>>>>> vma is
>>>>>>> unmapped could be discussed, though.
>>>>>>>
>>>>>>> Let's say we unmap a vma marking a bo purgeable. It then
>>>>>>> becomes either
>>>>>>> purged or non-purgeable.
>>>>>>>
>>>>>>> Then an app tries to access it either using a new vma or
>>>>>>> CPU
>>>>>>> map. Then
>>>>>>> it will typically succeed, or might occasionally fail if
>>>>>>> the bo
>>>>>>> happened to be purged in between.
>>>>>>>
>>>>>>> How do we handle new vma map requests and cpu-faults to a
>>>>>>> bo in
>>>>>>> purgeable state? Do we block those?
>>>>>> @Thomas,
>>>>>>
>>>>>> The implementation already blocks new access to purged BOs:
>>>>>>    1. New VMA mappings (Patch 0005): vma_lock_and_validate()
>>>>>> rejects MAP
>>>>>> operations to purged BOs with -EINVAL via the check_purged
>>>>>> flag.
>>>>>>    2. CPU faults (Patch 0004): Both xe_bo_cpu_prep() and
>>>>>> xe_gem_mmap_offset()
>>>>>> return errors (-EFAULT / VM_FAULT_SIGBUS) when accessing
>>>>>> purged
>>>>>> BOs.
>>>>>>    3 . "Once purged, always purged": Even when the last VMA is
>>>>>> unmapped,
>>>>>> xe_bo_recompute_purgeable_state() preserves the PURGED state
>>>>>> - it
>>>>>> never
>>>>>> transitions back to WILLNEED or DONTNEED (see early return at
>>>>>> the
>>>>>> top of the
>>>>>> function).
>>>>>>
>>>>>> The only way forward for the application is to destroy the
>>>>>> purged
>>>>>> BO and
>>>>>> create a new one.
>>>>>>
>>>>>> Regarding the 'no VMAs → WILLNEED' logic: this only applies
>>>>>> to
>>>>>> non-purged
>>>>>> BOs that happen to be temporarily unmapped. Purged BOs remain
>>>>>> permanently
>>>>>> invalid.
>>>>> So I think xe_bo_all_vmas_dontneed() isn't 100% correct...
>>>>>
>>>>> I think should return an enum...
>>>>>
>>>>> enum xe_bo_vmas_purge_state {	/* Maybe a better name? */
>>>>> 	XE_BO_VMAS_STATE_DONTNEED = 0,
>>>>> 	XE_BO_VMAS_STATE_WILLNEED = 1,
>>>>> 	XE_BO_VMAS_STATE_NO_VMAS = 2,
>>>>> };
>>>>>
>>>>>
>>>>> Then in xe_bo_recompute_purgeable_state() something like this:
>>>>>
>>>>> void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>>>>> {
>>>>> 	enum xe_bo_vma_purge_state state;
>>>>>
>>>>> 	if (!bo)
>>>>> 		return;
>>>>>
>>>>> 	xe_bo_assert_held(bo);
>>>>>
>>>>> 	/*
>>>>> 	 * Once purged, always purged. Cannot transition back
>>>>> to
>>>>> WILLNEED.
>>>>> 	 * This matches i915 semantics where purged BOs are
>>>>> permanently invalid.
>>>>> 	 */
>>>>> 	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
>>>>> 		return;
>>>>>
>>>>> 	state = xe_bo_all_vmas_dontneed(bo);
>>>>> 	if (state == XE_BO_VMAS_STATE_DONTNEED) {
>>>>> 		/* All VMAs are DONTNEED - mark BO purgeable
>>>>> */
>>>>> 		if (bo->madv_purgeable !=
>>>>> XE_MADV_PURGEABLE_DONTNEED)
>>>>> 			xe_bo_set_purgeable_state(bo,
>>>>> XE_MADV_PURGEABLE_DONTNEED);
>>>>> 	} else if (state == XE_BO_VMAS_STATE_WILLNEED) {
>>>>> 		/* At least one VMA is WILLNEED - BO must not
>>>>> be
>>>>> purgeable */
>>>>> 		if (bo->madv_purgeable !=
>>>>> XE_MADV_PURGEABLE_WILLNEED)
>>>>> 			xe_bo_set_purgeable_state(bo,
>>>>> XE_MADV_PURGEABLE_WILLNEED);
>>>>> 	}
>>>>> }
>>>>>
>>>>> I think would avoid the last unbind unintentionally flipping
>>>>> from
>>>>> DONTNEED -> WILLNEED.
>>>>>
>>>>> What do you both of you (Thomas, Arvind) think?
>>>>
>>>> @Matt,
>>>>
>>>> Good catch—I missed that transition. You’re right: when the last
>>>> VMA
>>>> is
>>>> unmapped from a DONTNEED BO, the current logic can flip it back
>>>> to
>>>> WILLNEED, which discards the user’s hint. That’s wrong.
>>>>
>>>>     I like the enum approach to distinguish:
>>>>       -  *_DONTNEED: all VMAs are DONTNEED
>>>>       - *_WILLNEED: at least one VMA is WILLNEED
>>>>       - *_NO_VMAS: no VMAs present
>>>>
>>>> With that, xe_bo_recompute_purgeable_state() can avoid changing
>>>> state
>>>> on
>>>> NO_VMAS and preserve "once purged, always purged," matching i915
>>>> semantics. This also addresses Thomas's earlier question about
>>>> new
>>>> VMA/CPU access to purgeable BOs—the enum makes it clear we only
>>>> transition on explicit VMA state, not on absence of VMAs.
>>>>
>>>> I'll rework xe_bo_all_vmas_dontneed() to return the enum and
>>>> update
>>>> the
>>>> recompute path accordingly.
>>>>
>>>>
>>>> @Thomas,
>>>>
>>>> Does this direction look good to you? If yes, I will send updated
>>>> patch.
>>> Yes, but I'm also as mentioned concerned about whether we can add
>>> new
>>> vmas, cpu faults and exports in the WONTNEED state. If we can do
>>> that,
>>> it might succeed most of the time making a well-behave appearance
>>> in
>>> user-space, but if on occation the bo gets purged, the app would
>>> seeming unexpectedly fail.
>>>
>>> So do we block new vmas cpu-faults and exports in the WONTNEED
>>> state?
>>>
>> I’ve thought about the same thing. The new vmas semantics are a bit
>> odd,
>> because if you unbind the BO in WONTNEED and disallow creating new
>> VMAs,
>> the BO can never be used again—madvise requires a VMA to operate thus
>> you can't move a BO out of WONTNEED. Maybe that’s acceptable or even
>> desirable, but it would need to be documented, and ultimately we’d
>> need
>> a UMD ack for those semantics.
>>
>> CPU faults or exports in WONTNEED also seem like they should be
>> disallowed with less odd sematics, but again, this should be
>> documented
>> and require UMD ack.
> Hmm. With WONTNEED really to do as little as possible. So we shouldn't
> go to into any sort of unmapping GPU- or CPU ptes. That means the end
> behaviour might still be a bit erratic on access of a WONTNEED bo,
> depending on previous access pattern we may or may not fault.
>
> So we should probably disallow mmap(), VM_BIND and export, but allow
> CPU- and GPU pagefaults. And document.
>
> Speaking of pagefaults, I noticed that when *purged*, it looks like we
> populate with scratch PTEs also on faulting VMs. I think this is the
> correct approach, though, to avoid the prefetch pagefaults wreaking
> havoc if accessing vmas with purged bos.


@Thomas, @Matt,

Got it. So the plan is:

DONTNEED BOs:
    - Block: new mmap(), VM_BIND, dma-buf export
    - Allow: CPU/GPU faults on existing mappings (fail if purged)
    - Keep PTEs intact, just mark as purgeable

I'll add checks in:
1. xe_gem_mmap_offset() - reject new mmap to DONTNEED BO
2. VM_BIND path (vma_lock_and_validate) - reject new VMA to DONTNEED BO
3. dma-buf export path - reject export of DONTNEED BO

Let me know if I am missing something.

Thanks,
Arvind


> /Thomas
>
>
>> Matt
>>
>>> /Thomas
>>>
>>>
>>>> Thanks,
>>>> Arvind
>>>>
>>>>
>>>>> Matt
>>>>>
>>>>>> Thanks,
>>>>>> Arvind
>>>>>>> Thanks,
>>>>>>> Thomas
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>> Cc: Himal Prasad Ghimiray
>>>>>>>> <himal.prasad.ghimiray@intel.com>
>>>>>>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/xe/xe_svm.c        |  1 +
>>>>>>>>     drivers/gpu/drm/xe/xe_vm.c         |  9 ++-
>>>>>>>>     drivers/gpu/drm/xe/xe_vm_madvise.c | 98
>>>>>>>> ++++++++++++++++++++++++++++--
>>>>>>>>     drivers/gpu/drm/xe/xe_vm_madvise.h |  3 +
>>>>>>>>     drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
>>>>>>>>     5 files changed, 116 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_svm.c
>>>>>>>> index cda3bf7e2418..329c77aa5c20 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>>>>>>> @@ -318,6 +318,7 @@ static void
>>>>>>>> xe_vma_set_default_attributes(struct
>>>>>>>> xe_vma *vma)
>>>>>>>>     		.preferred_loc.migration_policy =
>>>>>>>> DRM_XE_MIGRATE_ALL_PAGES,
>>>>>>>>     		.pat_index = vma-
>>>>>>>>> attr.default_pat_index,
>>>>>>>>     		.atomic_access =
>>>>>>>> DRM_XE_ATOMIC_UNDEFINED,
>>>>>>>> +		.purgeable_state =
>>>>>>>> XE_MADV_PURGEABLE_WILLNEED,
>>>>>>>>     	};
>>>>>>>>     	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_vm.c
>>>>>>>> index 71cf3ce6c62b..e84b9e7cb5eb 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>>>> @@ -39,6 +39,7 @@
>>>>>>>>     #include "xe_tile.h"
>>>>>>>>     #include "xe_tlb_inval.h"
>>>>>>>>     #include "xe_trace_bo.h"
>>>>>>>> +#include "xe_vm_madvise.h"
>>>>>>>>     #include "xe_wa.h"
>>>>>>>>     static struct drm_gem_object *xe_vm_obj(struct xe_vm
>>>>>>>> *vm)
>>>>>>>> @@ -1085,6 +1086,7 @@ static struct xe_vma
>>>>>>>> *xe_vma_create(struct
>>>>>>>> xe_vm *vm,
>>>>>>>>     static void xe_vma_destroy_late(struct xe_vma *vma)
>>>>>>>>     {
>>>>>>>>     	struct xe_vm *vm = xe_vma_vm(vma);
>>>>>>>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>>>>>>>     	if (vma->ufence) {
>>>>>>>>     		xe_sync_ufence_put(vma->ufence);
>>>>>>>> @@ -1099,7 +1101,7 @@ static void
>>>>>>>> xe_vma_destroy_late(struct
>>>>>>>> xe_vma
>>>>>>>> *vma)
>>>>>>>>     	} else if (xe_vma_is_null(vma) ||
>>>>>>>> xe_vma_is_cpu_addr_mirror(vma)) {
>>>>>>>>     		xe_vm_put(vm);
>>>>>>>>     	} else {
>>>>>>>> -		xe_bo_put(xe_vma_bo(vma));
>>>>>>>> +		xe_bo_put(bo);
>>>>>>>>     	}
>>>>>>>>     	xe_vma_free(vma);
>>>>>>>> @@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct
>>>>>>>> dma_fence
>>>>>>>> *fence,
>>>>>>>>     static void xe_vma_destroy(struct xe_vma *vma, struct
>>>>>>>> dma_fence
>>>>>>>> *fence)
>>>>>>>>     {
>>>>>>>>     	struct xe_vm *vm = xe_vma_vm(vma);
>>>>>>>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>>>>>>>     	lockdep_assert_held_write(&vm->lock);
>>>>>>>>     	xe_assert(vm->xe, list_empty(&vma-
>>>>>>>>> combined_links.destroy));
>>>>>>>> @@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct
>>>>>>>> xe_vma *vma,
>>>>>>>> struct dma_fence *fence)
>>>>>>>>     		xe_assert(vm->xe, vma->gpuva.flags &
>>>>>>>> XE_VMA_DESTROYED);
>>>>>>>>     		xe_userptr_destroy(to_userptr_vma(vma));
>>>>>>>>     	} else if (!xe_vma_is_null(vma) &&
>>>>>>>> !xe_vma_is_cpu_addr_mirror(vma)) {
>>>>>>>> -		xe_bo_assert_held(xe_vma_bo(vma));
>>>>>>>> +		xe_bo_assert_held(bo);
>>>>>>>>     		drm_gpuva_unlink(&vma->gpuva);
>>>>>>>> +		xe_bo_recompute_purgeable_state(bo);
>>>>>>>>     	}
>>>>>>>>     	xe_vm_assert_held(vm);
>>>>>>>> @@ -2681,6 +2685,7 @@ static int
>>>>>>>> vm_bind_ioctl_ops_parse(struct xe_vm
>>>>>>>> *vm, struct drm_gpuva_ops *ops,
>>>>>>>>     				.atomic_access =
>>>>>>>> DRM_XE_ATOMIC_UNDEFINED,
>>>>>>>>     				.default_pat_index = op-
>>>>>>>>> map.pat_index,
>>>>>>>>     				.pat_index = op-
>>>>>>>>> map.pat_index,
>>>>>>>> +				.purgeable_state =
>>>>>>>> XE_MADV_PURGEABLE_WILLNEED,
>>>>>>>>     			};
>>>>>>>>     			flags |= op->map.vma_flags &
>>>>>>>> XE_VMA_CREATE_MASK;
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>>>>> index d9cfba7bfe0b..c184426546a2 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>>>>>>> @@ -12,6 +12,7 @@
>>>>>>>>     #include "xe_pat.h"
>>>>>>>>     #include "xe_pt.h"
>>>>>>>>     #include "xe_svm.h"
>>>>>>>> +#include "xe_vm.h"
>>>>>>>>     struct xe_vmas_in_madvise_range {
>>>>>>>>     	u64 addr;
>>>>>>>> @@ -183,6 +184,89 @@ static void madvise_pat_index(struct
>>>>>>>> xe_device
>>>>>>>> *xe, struct xe_vm *vm,
>>>>>>>>     	}
>>>>>>>>     }
>>>>>>>> +/**
>>>>>>>> + * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO
>>>>>>>> are
>>>>>>>> marked
>>>>>>>> DONTNEED
>>>>>>>> + * @bo: Buffer object
>>>>>>>> + *
>>>>>>>> + * Check all VMAs across all VMs to determine if BO can
>>>>>>>> be
>>>>>>>> purged.
>>>>>>>> + * Shared BOs require unanimous DONTNEED state from all
>>>>>>>> mappings.
>>>>>>>> + *
>>>>>>>> + * Caller must hold BO dma-resv lock.
>>>>>>>> + *
>>>>>>>> + * Return: true if all VMAs are DONTNEED, false
>>>>>>>> otherwise
>>>>>>>> + */
>>>>>>>> +static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
>>>>>>>> +{
>>>>>>>> +	struct drm_gpuvm_bo *vm_bo;
>>>>>>>> +	struct drm_gpuva *gpuva;
>>>>>>>> +	struct drm_gem_object *obj = &bo->ttm.base;
>>>>>>>> +	bool has_vmas = false;
>>>>>>>> +
>>>>>>>> +	xe_bo_assert_held(bo);
>>>>>>>> +
>>>>>>>> +	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
>>>>>>>> +		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
>>>>>>>> +			struct xe_vma *vma =
>>>>>>>> gpuva_to_vma(gpuva);
>>>>>>>> +
>>>>>>>> +			has_vmas = true;
>>>>>>>> +
>>>>>>>> +			/* Any non-DONTNEED VMA prevents
>>>>>>>> purging */
>>>>>>>> +			if (vma->attr.purgeable_state !=
>>>>>>>> XE_MADV_PURGEABLE_DONTNEED)
>>>>>>>> +				return false;
>>>>>>>> +		}
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	/*
>>>>>>>> +	 * No VMAs => no mapping-level DONTNEED hint.
>>>>>>>> +	 * Default to WILLNEED to avoid making BOs
>>>>>>>> purgeable
>>>>>>>> without
>>>>>>>> +	 * explicit user intent.
>>>>>>>> +	 */
>>>>>>>> +	if (!has_vmas)
>>>>>>>> +		return false;
>>>>>>>> +
>>>>>>>> +	return true;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * xe_bo_recompute_purgeable_state() - Recompute BO
>>>>>>>> purgeable state
>>>>>>>> from VMAs
>>>>>>>> + * @bo: Buffer object
>>>>>>>> + *
>>>>>>>> + * Walk all VMAs to determine if BO should be purgeable
>>>>>>>> or
>>>>>>>> not.
>>>>>>>> + * Shared BOs require unanimous DONTNEED state from all
>>>>>>>> mappings.
>>>>>>>> + *
>>>>>>>> + * Locking: Caller must hold BO dma-resv lock. When
>>>>>>>> iterating GPUVM
>>>>>>>> lists,
>>>>>>>> + * VM lock must also be held (write) to prevent
>>>>>>>> concurrent
>>>>>>>> VMA
>>>>>>>> modifications.
>>>>>>>> + * This is satisfied at both call sites:
>>>>>>>> + * - xe_vma_destroy(): holds vm->lock write
>>>>>>>> + * - madvise_purgeable(): holds vm->lock write (from
>>>>>>>> madvise
>>>>>>>> ioctl
>>>>>>>> path)
>>>>>>>> + *
>>>>>>>> + * Return: nothing
>>>>>>>> + */
>>>>>>>> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
>>>>>>>> +{
>>>>>>>> +	if (!bo)
>>>>>>>> +		return;
>>>>>>>> +
>>>>>>>> +	xe_bo_assert_held(bo);
>>>>>>>> +
>>>>>>>> +	/*
>>>>>>>> +	 * Once purged, always purged. Cannot transition
>>>>>>>> back to
>>>>>>>> WILLNEED.
>>>>>>>> +	 * This matches i915 semantics where purged BOs
>>>>>>>> are
>>>>>>>> permanently invalid.
>>>>>>>> +	 */
>>>>>>>> +	if (bo->madv_purgeable ==
>>>>>>>> XE_MADV_PURGEABLE_PURGED)
>>>>>>>> +		return;
>>>>>>>> +
>>>>>>>> +	if (xe_bo_all_vmas_dontneed(bo)) {
>>>>>>>> +		/* All VMAs are DONTNEED - mark BO
>>>>>>>> purgeable
>>>>>>>> */
>>>>>>>> +		if (bo->madv_purgeable !=
>>>>>>>> XE_MADV_PURGEABLE_DONTNEED)
>>>>>>>> +			xe_bo_set_purgeable_state(bo,
>>>>>>>> XE_MADV_PURGEABLE_DONTNEED);
>>>>>>>> +	} else {
>>>>>>>> +		/* At least one VMA is WILLNEED - BO
>>>>>>>> must
>>>>>>>> not be
>>>>>>>> purgeable */
>>>>>>>> +		if (bo->madv_purgeable !=
>>>>>>>> XE_MADV_PURGEABLE_WILLNEED)
>>>>>>>> +			xe_bo_set_purgeable_state(bo,
>>>>>>>> XE_MADV_PURGEABLE_WILLNEED);
>>>>>>>> +	}
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>     /**
>>>>>>>>      * madvise_purgeable - Handle purgeable buffer object
>>>>>>>> advice
>>>>>>>>      * @xe: XE device
>>>>>>>> @@ -231,14 +315,20 @@ static void __maybe_unused
>>>>>>>> madvise_purgeable(struct xe_device *xe,
>>>>>>>>     		switch (op->purge_state_val.val) {
>>>>>>>>     		case
>>>>>>>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>>>>>>>> -			xe_bo_set_purgeable_state(bo,
>>>>>>>> XE_MADV_PURGEABLE_WILLNEED);
>>>>>>>> +			vmas[i]->attr.purgeable_state =
>>>>>>>> XE_MADV_PURGEABLE_WILLNEED;
>>>>>>>> +
>>>>>>>> +			/* Update BO purgeable state */
>>>>>>>> +			xe_bo_recompute_purgeable_state(
>>>>>>>> bo);
>>>>>>>>     			break;
>>>>>>>>     		case
>>>>>>>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>>>>>>>> -			xe_bo_set_purgeable_state(bo,
>>>>>>>> XE_MADV_PURGEABLE_DONTNEED);
>>>>>>>> +			vmas[i]->attr.purgeable_state =
>>>>>>>> XE_MADV_PURGEABLE_DONTNEED;
>>>>>>>> +
>>>>>>>> +			/* Update BO purgeable state */
>>>>>>>> +			xe_bo_recompute_purgeable_state(
>>>>>>>> bo);
>>>>>>>>     			break;
>>>>>>>>     		default:
>>>>>>>> -			drm_warn(&vm->xe->drm, "Invalid
>>>>>>>> madvice
>>>>>>>> value = %d\n",
>>>>>>>> -				 op-
>>>>>>>>> purge_state_val.val);
>>>>>>>> +			/* Should never hit - values
>>>>>>>> validated in
>>>>>>>> madvise_args_are_sane() */
>>>>>>>> +			xe_assert(vm->xe, 0);
>>>>>>>>     			return;
>>>>>>>>     		}
>>>>>>>>     	}
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>>>>>> b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>>>>>> index b0e1fc445f23..39acd2689ca0 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>>>>>>> @@ -8,8 +8,11 @@
>>>>>>>>     struct drm_device;
>>>>>>>>     struct drm_file;
>>>>>>>> +struct xe_bo;
>>>>>>>>     int xe_vm_madvise_ioctl(struct drm_device *dev, void
>>>>>>>> *data,
>>>>>>>>     			struct drm_file *file);
>>>>>>>> +void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
>>>>>>>> +
>>>>>>>>     #endif
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>>>> index 43203e90ee3e..fd563039e8f4 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>>>> @@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
>>>>>>>>     	 * same as default_pat_index unless overwritten
>>>>>>>> by
>>>>>>>> madvise.
>>>>>>>>     	 */
>>>>>>>>     	u16 pat_index;
>>>>>>>> +
>>>>>>>> +	/**
>>>>>>>> +	 * @purgeable_state: Purgeable hint for this VMA
>>>>>>>> mapping
>>>>>>>> +	 *
>>>>>>>> +	 * Per-VMA purgeable state from madvise. Valid
>>>>>>>> states are
>>>>>>>> WILLNEED (0)
>>>>>>>> +	 * or DONTNEED (1). Shared BOs require all VMAs
>>>>>>>> to
>>>>>>>> be
>>>>>>>> DONTNEED before
>>>>>>>> +	 * the BO can be purged. PURGED state exists
>>>>>>>> only at
>>>>>>>> BO
>>>>>>>> level.
>>>>>>>> +	 *
>>>>>>>> +	 * Protected by BO dma-resv lock. Set via
>>>>>>>> DRM_IOCTL_XE_MADVISE.
>>>>>>>> +	 */
>>>>>>>> +	u32 purgeable_state;
>>>>>>>>     };
>>>>>>>>     struct xe_vma {
