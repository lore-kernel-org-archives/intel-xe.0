Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B2010775E1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 16:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CD510E02A;
	Wed, 18 Mar 2026 16:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTQZH2Ef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CF110E02A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773850937; x=1805386937;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mVSvkx5AnHKjtBozcjqeHh1pFiggP5ghJZ0wDq8+pJk=;
 b=dTQZH2Efwcz0qoNn8vgR7XhF28KdxKGiqV37Cv3tTSTZY6+ft/FHofxq
 9qA2gVuJlS1QVjI8hS1RiMQFo2lesmbTJyfMI5bxVpNna3UCd3UptgLd/
 ieH3Sy6b+od3NRevJdBDleMXbNW8C7yupPd3ogA+kaFy95pEc2ncdeccs
 vnhVcGK3PLgs6odvMcVWw3ryDVwjR5zjHc4wEdmncsvHd+dslfXOJk4ui
 ZKl+l0ihojLValQ8mIT3wx8oxsSPUNCudeQIBtcl9xwGidRzov2M48xR/
 jIi8D0uF5IdZaxnJgEgB6IIrkYbNBV2A6g4C+Qy6t1EGiJc8EkWg+4Axk w==;
X-CSE-ConnectionGUID: kcRq1XPxSyi190pTfOxwZg==
X-CSE-MsgGUID: Z5oWqklrS7yr11jpB0Iw+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85611279"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85611279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:22:16 -0700
X-CSE-ConnectionGUID: xr0SvrVQRlG83ant5tsVYg==
X-CSE-MsgGUID: 2PIxkW2DR+en1kn2Dx1NMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221904187"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:22:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:22:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 09:22:15 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:22:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J54+1fXSAZXKbkYiQIfXjc7rKDv7BTeJK5pVmjhpLanMyH99irDQfG5VmOffagzSHRFLqqYq5a4p8jYg4gT/7Rfihc14D2Eyn5Jalt9ob2ZQBu/1FC2nKW5eDboiHUXqyllUmkP4/O69X/kDpo1aKbP2RYCUJyDbECeTaoUPdW9kPxyAKH/naBU5ChotNEj0lGYQAly39Gx6xy/VynfA4p1bktXzU0az/FYKI2Mg8pNKVbFyBTCBxIIMSqh2Ifu9QaDnjiwKVIVPCmCtmIm7pwrLV/gCwxxUVQJpwqAogE36z53pxGxUx+lR+z86hyQJSMFrgj3gBNSXxRrnqMAdJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSyWJTRcSY8MMT8ngfNnvhh3gRbAOesjA5Zo61CyMp8=;
 b=hmqUyNasnikTBvVfQakAr4GQibFB1gHGIKuRGEwdPiNn1b3+XEixK1l9CbOsQsfk+7FImI7yEHP0d8A1S9eQb+kzTTPXyK5LZSfS+fRICo4//JL7sg8EwKb2hgJ/iErbwQUCZPHJ1fk5N1CxAhpeZ8vRo2ECqlebix03IqKYJncONjlLqAT/ctCVcnvJZkv7SbwpXWuQJOHh/oN1bU5LLjYefdWrvTlfi1jusu6R047yREVs611yrfUi3bhfzFLi9mbVDy+FN5IaG7TxPalo5rQD4RJ0mu02XfKWTf1C4ab0u/pEh+RelALJnDX3jgA8jSljDSssfEDggzGsYzP77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 16:22:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 16:22:12 +0000
Date: Wed, 18 Mar 2026 21:52:03 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v10 1/7] drm/xe/xe_sysctrl: Add System Controller types
 and device integration
Message-ID: <abrRKwCpLaUHILAc@soc-5CG1426VCC.clients.intel.com>
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
 <20260313143303.2441609-10-anoop.c.vijay@intel.com>
 <abrQh7xFVqy1pYPe@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abrQh7xFVqy1pYPe@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: BY5PR17CA0045.namprd17.prod.outlook.com
 (2603:10b6:a03:167::22) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 419902a9-dc12-4320-319e-08de850a8285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: JuNhDVQ8ZjxCxBr0i9sTHyr17ZJI4MSmhmV3nRBgGbOv/SLUtH5tN1gCe6EytSZZmiikc4y4DtfyTAK5xiZTrNaCtcAX/j7Qw1CFCwsQEFJ0t+zHeCC1NdRdmiIZxGb77WQAGZo/yIQLbfawJbqeddkQ6oC3FqPjeixvV7jgRAk91KHFHvVRi4YwJpv7GcsWKq93J8Ycv0XXNLbdpNWEu4qo6JXoofdaAq0QHujMyFRCc+GKnIPz1X2syOTSWURXDcsQjB5bd/A/5mYSUL9K2EfmQxBGFK4WzUBpR9nTLpl17MGeAkEYuIy4ULh+ZBnDC6DqzywGBPFmUK1wCgsnBrDRvfSxsZcGFuNKcqGtpgA9R4y+AMXDypOmQ0WJGGG3DcZfiWJRBCUTrbu6vjh+2ohTNe2o1S5LaVlqSh/XkyiBMfsmV+GQ7Tss9/HEwOC+6Yt5QZuPY7V/W9r8c98GBreDtVxclLa4lBdU/oV5owefrod0CB/xaSHJLSxtdFPReFovsTw3v7nn3bRPOkyRFDMS7Uk3nmBfiez3D9u7PnlnjDw6gngOGXSyJXWwAvUq2AE+kapqvH1vOj8MUsi0uLTv2/oitKGixNR+K0Ie7dEhA3aImBMQo4HlCv1wgdblIU9B1XVpe90VS0kCZZojuyV86d1u4ifFpd87cIvZnTmqK1EUqVhwQY6/epftMBVl4XbhsSawknnm15WqkzC7FfRfwzscwwwY4Ikmf+P4hfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UERRR3JtdEtSaFdMN3o2dFFJdlRLZnlXMXRtMHFBNlFhMitwbUZndWpRSXE2?=
 =?utf-8?B?N3FZeERoYVlCSWtuRi9POGZMTlMwMXFhaUYwNm5pZHJRYkF6N0E0S2txcUxr?=
 =?utf-8?B?VzRqMitwSjFKc0ZEc2VTQytvaWIxN2ZWWm5IR2lDU2V2bFRkZmRjbklvVmdk?=
 =?utf-8?B?OVZscjFJbnBqMXhuSUxXQUlwQzZNMHBFcFdwY1FseVA1bFF2NGh5S3NRQlY2?=
 =?utf-8?B?dWJLVmYxNlNxdjFVZEJycUNUMDBDYnRBMEVmK20zTUVTUFgrTGpEc1lCeUNI?=
 =?utf-8?B?OGw3STh4WERZdW5PcmkreVlGT2NsK0JwQmJaYytyd24xU3Y1aFBoV2EyWjZK?=
 =?utf-8?B?QmxWV0JvQUZoa3U3a2Z2WXR5dktjUnhKYlpGWUxYaE1zYnA1SFgvNVhsTngx?=
 =?utf-8?B?MVUxY25sazhpeVR1WGtheFVTU3l6MDhGd2l3T1JQOWkrVUt0R3dJY0tBUnh0?=
 =?utf-8?B?SzFDUXErUXBxSFQ2eVk3ckVETjFsRmgyK3RORUZBSGVUMm1RZTVzMnNRZmpB?=
 =?utf-8?B?RFQ4Wm9WN3hIa21Dc0xMZkFvTEtZUHp0V0g4aklacUJjc3Y5WE5qbml5OW9j?=
 =?utf-8?B?TkRTYlBLMW15N1BQdExCOUhOeW9NbDFMdDlUWjJZS0NwNnA4NmJqYTEwRzNK?=
 =?utf-8?B?T1RzT2tvbXA2cFFKNElPODlIR1ErL2hrWElUZ29nekVabVEybkw3ZHRtcTY4?=
 =?utf-8?B?RUhXMUowbXhES0x2T3drZDBDNlpUQXJ0dnJWaUV1amQyZTNFODV0aDdQY3pQ?=
 =?utf-8?B?bVp6amo4K2cxZElNOC84bFFlSXJtN0s2Qm5uM0JjaGRYYlI5NkhBSjFESnIv?=
 =?utf-8?B?b0dJaTBRNml6SDh6dWVub0V1dDVLK3M3TGQ4VmVUU3A5Z3I1U3BuZ3RwR1Jn?=
 =?utf-8?B?OUd1Ykt2bHRlbElXcjZHYzc4SDlxZWRtby9ZNjU1b01UYVVPSFBRZUptdk5p?=
 =?utf-8?B?WnJxRVFaNko5Qk1TbURld2NQRWRDMy9NenpSOC9SU1llblJiVklYS09iRTNr?=
 =?utf-8?B?WWxNdmc0RWJWUTdLSXJnTC9uRUVqNU5zenlUUjNFRThaSFg3MnNzTS9MWmpn?=
 =?utf-8?B?OVJnSTRObHVveTZsTWx1VDN4YTFKajdvcldBb1h3bXowakxkK0VVYmNQazlD?=
 =?utf-8?B?bS9yMnEvN1VFRXJxRkVta0YzVWpjR1o1ekpyM0lqZXdWS2o2bUpyejhzSDJB?=
 =?utf-8?B?RHVqUWQyZ2NBNEpIaVJjUk9BSTEvdGw4RGdueTVWSVRabG94TjBxYTB5ZkVw?=
 =?utf-8?B?VlJyQXRvS0pkT1B5SU1ZakxZaUVtWnczai9UUkZEaTkzVTRUQWJXWXhpa3p2?=
 =?utf-8?B?VTQ1WVpNYk5HU0xYRlEwR0hsTXlrWjNhdXUzRUNBZVU0RGIrbTBCelRFVCtu?=
 =?utf-8?B?YllrUEk1ZkNuWmRjUlIwQkxGQTE4RjFkMTF2ZS9CMnpDaURFUmFVNzE5V2to?=
 =?utf-8?B?bHRMbTFtVTFFc2Z3VzJGdHEzM1A5UTU2TGhyV3NzMkplc0RoVTlPTDRpTjIy?=
 =?utf-8?B?TlhRcXRWNE54R1V0V0I0TTdYNkxvWlJUZlBPY1JPUmJpamY4OEIyUlVjdEJH?=
 =?utf-8?B?bzdGQU9yMlB1VHpkR1BiUTYvWlVpME52MENWa1FZQzJRU1lkamZwOUtLYnVh?=
 =?utf-8?B?SjE3MHlWTjBQZ09uejRwLytYNzlEeGNsTXRETk52WVMxb3B5eC95YlRVRnFX?=
 =?utf-8?B?cGJnemhTSzI0WGZ2OHoyVzk2cldsRGhJZXRGS2ZGTkZvN3pFeENOWTdxa1do?=
 =?utf-8?B?QktaWTVvR1k0OHVYT0NrZU14UUt1WHZ3SmJ1ampzaEs2dUEyK3UyNGZCLzFB?=
 =?utf-8?B?RDBxNVZJZzVWTnpBdWVRdVU5RjRGWFk5dnJJN1FQQkh1VDVkQXY2YnhwMGhj?=
 =?utf-8?B?Ymh6bWVTNEc5d0g2RGZOV0JzNU5iTmN5U3pTSCt4cXByTUtUZUVPaEgyVUNX?=
 =?utf-8?B?VysyQVBTUnpwaHA3Tm5NbTRVeXl4blM2ODU5QVVZenp4QVVFWkhyRGlteEpF?=
 =?utf-8?B?VTJkWFpUWkppUm52Yjd1eEY4aFo2MCtyd1BXemZKTVFnZW5aQ1hveXVVeG15?=
 =?utf-8?B?blpQSURVREw5WFgvZE1ianJ3a2c1OE5jaExIb3FGemlodlVNT1VLaDZPOEww?=
 =?utf-8?B?U3BqUmhpakdsTTVoTngyU3VhZlVwVDZRaEpxMlVra3Q4dElUVWluK2w0VHFD?=
 =?utf-8?B?c3BseklpVzdWNjhib3EvOUtrY3l0WUM1VkhBRVV3eWFtSmpaWFVzTEJQa0dC?=
 =?utf-8?B?RGlrY2thNTZxMHc3eTczcW40TG9kZ01KZ0J6TkhQRXhoaEJzU1NEYS9sYThx?=
 =?utf-8?B?TllLVVY3b0NPa0FCQ3BHK00yNXJjaFhwNFJob1EzU09VQUV6aUlFb0JQbXRC?=
 =?utf-8?Q?59clsaW7FHSxVIQfJDb8oF1/VBr96o/Tl0wTV?=
X-Exchange-RoutingPolicyChecked: QebKpS1UABMzYqbrQOvkpcF0loFiolElNZeMkZYDar9kboKJebTbn4ozc3KJQT3/BUrAeyeLGhLIEBaLZ/FjCXXn35yYUA/0Xq27m0KVJm7iYlNtJLwdL1+zIpMQayFyxxLt/BXVQw90Kpy8RbT1AkLuJm46pf7uEvmPIsd+jw8BNfELUTD+BEChKvYqtr/+OjXvZmIatm1Nv93Y52nu6BNp0h9ei6Vakg0KbqSfMKQhNYheJLgLRvohilnveUJLH3BKDYIu12IRyQDSGXev9IF2FNQSIPzWmDHufpzTWwg3r3BrU8m+ykDMY5uzTssCKhXHVFeOSTcNSJELwWrXOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 419902a9-dc12-4320-319e-08de850a8285
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:22:12.3338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtlnRD1VpKmPamJHR+qx/n0HKEkz0/MlIgOMhi7HVUU+cUv0UIfb56hDNIiMuijzpgBDQYEPoWThDp6s2xdPFEAOroF3vidGVnXyFLWAWm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
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

On Wed, Mar 18, 2026 at 09:49:19PM +0530, Umesh Nerlige Ramappa wrote:
>On Fri, Mar 13, 2026 at 07:33:04AM -0700, Anoop, Vijay wrote:
>>From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>Add foundational type definitions for System Controller (sysctrl) support
>>and integrate them into the xe_device structure. Introduce a capability
>>flag in device descriptor and runtime information to record sysctrl
>>presence on supported platforms.
>>
>>System Controller is a separate firmware-managed entity responsible for
>>selected platform-level control and coordination tasks on Intel Xe3p
>>discrete GPU platforms. The driver communicates with it via a mailbox
>>interface for delegated operations.
>>
>>This commit introduces core data structures required for sysctrl support,
>>including MMIO region definitions, a command mutex, and state tracking
>>required for mailbox communication.
>>
>>No functional changes. This patch provides preparatory infrastructure
>>for System Controller support.
>
>IMO, this ^ sentence can be dropped.

If including the above comment was a review feedback, then please retain 
it because I see it in other commit messages as well.



With or without that this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>---
>>v4: (Matt, Mike)
>>- Add domain-specific MMIO accessor
>>- Change phase_bit type from u32 to bool
>>
>>v6: (Matt)
>>- Add mailbox protocol constants
>>
>>v8: (Matt, Michal)
>>- Reordered patches for logical flow
>>
>>v9: (Matt)
>>- Extended commit message to explain System Controller and purpose of
>> `has_sysctrl` flag
>>---
>>drivers/gpu/drm/xe/xe_device_types.h  |  6 +++++
>>drivers/gpu/drm/xe/xe_pci_types.h     |  1 +
>>drivers/gpu/drm/xe/xe_sysctrl_types.h | 32 +++++++++++++++++++++++++++
>>3 files changed, 39 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index 615218d775b1..150c76b2acaf 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -27,6 +27,7 @@
>>#include "xe_sriov_vf_ccs_types.h"
>>#include "xe_step_types.h"
>>#include "xe_survivability_mode_types.h"
>>+#include "xe_sysctrl_types.h"
>>#include "xe_tile_types.h"
>>#include "xe_validation.h"
>>
>>@@ -196,6 +197,8 @@ struct xe_device {
>>		u8 has_soc_remapper_telem:1;
>>		/** @info.has_sriov: Supports SR-IOV */
>>		u8 has_sriov:1;
>>+		/** @info.has_sysctrl: Supports System Controller */
>>+		u8 has_sysctrl:1;
>>		/** @info.has_usm: Device has unified shared memory support */
>>		u8 has_usm:1;
>>		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>>@@ -508,6 +511,9 @@ struct xe_device {
>>	/** @i2c: I2C host controller */
>>	struct xe_i2c *i2c;
>>
>>+	/** @sc: System Controller */
>>+	struct xe_sysctrl sc;
>>+
>>	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
>>	u32 atomic_svm_timeslice_ms;
>>
>>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>>index 8eee4fb1c57c..08386c5eca27 100644
>>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>>@@ -57,6 +57,7 @@ struct xe_device_desc {
>>	u8 has_soc_remapper_sysctrl:1;
>>	u8 has_soc_remapper_telem:1;
>>	u8 has_sriov:1;
>>+	u8 has_sysctrl:1;
>>	u8 needs_scratch:1;
>>	u8 skip_guc_pc:1;
>>	u8 skip_mtcfg:1;
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>new file mode 100644
>>index 000000000000..8217f6befe70
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>>@@ -0,0 +1,32 @@
>>+/* SPDX-License-Identifier: MIT */
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#ifndef _XE_SYSCTRL_TYPES_H_
>>+#define _XE_SYSCTRL_TYPES_H_
>>+
>>+#include <linux/mutex.h>
>>+#include <linux/types.h>
>>+
>>+struct xe_mmio;
>>+
>>+/**
>>+ * struct xe_sysctrl - System Controller driver context
>>+ *
>>+ * This structure maintains the runtime state for System Controller
>>+ * communication. All fields are initialized during xe_sysctrl_init()
>>+ * and protected appropriately for concurrent access.
>>+ */
>>+struct xe_sysctrl {
>>+	/** @mmio: MMIO region for system control registers */
>>+	struct xe_mmio *mmio;
>>+
>>+	/** @cmd_lock: Mutex protecting mailbox command operations */
>>+	struct mutex cmd_lock;
>>+
>>+	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
>>+	bool phase_bit;
>>+};
>>+
>>+#endif
>>-- 
>>2.43.0
>>
