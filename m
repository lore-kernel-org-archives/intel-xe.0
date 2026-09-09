Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD640C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 09:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB9A10F06E;
	Wed,  9 Sep 2026 09:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeAJ0zDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB1F10F06E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788946978; x=1820482978;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c6HD8MvAG8/0tX1Z0TIvp5G+zUTAdfURWdwfH+crF2U=;
 b=BeAJ0zDmJqdhEeEwvkqfH8qHXzNY5mDNuw009Cv/sh9agTzxORzviumH
 NVQeMT+PoZZvAY6jTngCUK5jvMJUqvO+JjSjWyh1No//VwIa+E2LES+Fj
 7/jJg0xFOEjyvIufSrQLYEUqtD33vxWkkRBIa2xo8/L4mETMfKaTWAyQL
 6IamRAH9f5mJmbQji2B0vCLT0jdWmCA0J8dlY4QcYjOmxI+CoOJKlHHFG
 aW8REizzF6J9TATz5rEIweWsft1Um8h5n8yV/exwcrjtuF1Q4ggLeAzCF
 gAU0d3KubU9tAC/cd9G4Btktb0JGs2PSSfMU71TMBsSbsEc9B/faIeJVA A==;
X-CSE-ConnectionGUID: 693iyYiYQN+vYObb8NbxlQ==
X-CSE-MsgGUID: CULoODrbQkmg1wO0g+Dn8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89490100"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89490100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 02:42:58 -0700
X-CSE-ConnectionGUID: A3sKCY9mR5CiqGGs65lHiQ==
X-CSE-MsgGUID: ONIgqi4YQ5WDAZgvxuKZyw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 02:42:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 02:42:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 02:42:57 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 02:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhnuToR/VJ5Q4GA2oUbKaLph1g5v86kZ3yLA3VxOsfqp6s7InKH9tLxYeh3A4bsVpU/QKaL8Pp9lUgdsZqEori5I0joXTNHejyqeSBO1BAZFvjeEkhFpJtDd0Nj3nCf5SFl7g7NACvtUJBM6y5ufpUUKtyAG6Cc/SOUL+vKiAshUc8qwgDug/lTQE6Z/jS1oJnn3afsJlc0i7SjhZziPi1KFSK6axLih7COn++zxSyQ4lkUwxKRQGgxOdsKLsNf6NBv7VLAW+vN/X61HUpYOL27rnTwHYsehGgYRg08oTK6C9xbb6nJEWaqH32ZWPUKhEKkTbutIVUSWd9mWUxV08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwU+XJj9NXtg5c6PGecZNuJrE9MVyP62o/gXnElF3fY=;
 b=PSpmkz3RR9tTOIlaDKtWf5gWxci08QSClcQYwjnYpBqV8eCUj8G7Cf0v8p7PejC46zbQTRujdrSHsJXXZ2VhSLV+ZwM2fRP8FhUfK80Pt+EeI+56cXYSabhSHTT5lQb9G0eZ/ygRt3c9rcSc0ZMIiaDEltDMdivdpp+XFzvws3GK6WPRgT4aP2AiRmMD8AqBAEDOjpJEN39bgzKtxL7M84whvxh3D52di8kHJZlRKF5RDDjOQIwgnBRFjxZay2qzQZXsFy2tNAjCMkvdquOybnbtq/kbTAVdCG4nJP/A71veNl2rOSMSZcG4glHALlXcPTY7c5DCCdvjS+52ahf9Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by PH7PR11MB6722.namprd11.prod.outlook.com (2603:10b6:510:1ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 9 Sep
 2026 09:42:55 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 09:42:55 +0000
Message-ID: <37ba4065-9a0d-4c97-93db-e34ebb99da77@intel.com>
Date: Wed, 9 Sep 2026 11:42:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/xe/log: Relax location ID recognition
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260904170531.516-1-michal.wajdeczko@intel.com>
 <20260904170531.516-7-michal.wajdeczko@intel.com>
 <f0f7e21a-6d90-498c-92bc-e8227a393d8d@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <f0f7e21a-6d90-498c-92bc-e8227a393d8d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0058.eurprd02.prod.outlook.com
 (2603:10a6:802:14::29) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|PH7PR11MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 877668e0-9aff-43f9-a281-08df0e56b99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: klmTblImQGY6oq+OAcWpD/d/Eqt6QPQ41RzWmwNFqtVtmzWFtTbZEKLELlihccRHbvFNjTOh5lzbedww7S0WeGb4U5Ga3qn1/eeOCBe2NID9FC30hOQPiMAPuYebujZSqPi1afDpqQeTKuuRV5LzOV9ZwTzoLoM8FTG4FQTc8NlGYRPih/tF0FBF4nh+tvifC0H4wZkpKTqnqDPavUrLujp3AQGKNNBKPpiFC/H8PRnBZ4cQazc5Gi7RyL6gHlAyvflVpZF0yD/hlSjUS7/vaKX3YVT4REs61XH0EHF+HJ1W+Taq7AkoKx9Sq9xOLnCVXJITmSsBk4SLiW36E6BMSPYLSIV/KNOjszyg8x7Zqw8jGNQX9huqByPcgUxxcfCgyv1J5mpanzpt8W+AMBU4IqC5Op8TnZmX2HbHDdCC6wClPU2Fwx1qmWaMSAVqq5eX/TXxvkNwI70XG2EBGzo95Gp8lZXKpk4x3b9XNiD9fxJHiT1y02fYp9jrz2ltV3dneJQ8UD7opkCwVPAjwSLW/wxdz/T0lMG1py6SCKvQFfBdEU42+N1Gy6cA4RDOAXBDEgzxsXMDsAav/lw+IhjeAR7VjnhK7S73eFz+mfFpBnE5ILmPRlhAsHkVHn8FRQXo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzE5NW9pUFlMYkFOK0hGOVhsTnFtMHY3QVhHY2hqS1k4T0l4YXNBaXpvUFFm?=
 =?utf-8?B?TzJybWp3emFiK3M3b2hhWERobmdwc3g1ZnI2UDNtZThkeElLSjd3b0M5RUZ4?=
 =?utf-8?B?RG9TVWliNUgxMUJuY001anlKZVhaN0VXMnN2WVhuOUdKOXdpRE90K0JTRTdr?=
 =?utf-8?B?L25VdmhZMUsrLzNmc0RCNEdUNkRETXc5RUJyT3RkRGRqRkxvOGJkOHBSLzhv?=
 =?utf-8?B?L3hjcXZNYzNVQUMxckhrdTkvZzBQeTdIRlVRUWw0Q3dyYkJKdlRjTitrcDJs?=
 =?utf-8?B?RngrSXQwWnp0UDhtU3pIeU03Sy9xdmNNRFQxci9ic0tERXVKLzZ5UEtIM3Nq?=
 =?utf-8?B?YVhTdzFCR1V6M05pZ0lySlplc0tnREwycHRFOER2NEhLUE0zaUdqR2FmT0tm?=
 =?utf-8?B?M3oxY2hjLzF6WnY0NC9ka2lrdG5RNG1SV1BhZWdSNWQyRGFBdmRVRnpkd1Vz?=
 =?utf-8?B?Vk1Sei9GQUFxNmRkcWU3U0RkeC9QaFFwZzNtWjhPVElZQkptOU9RV2c4NlFV?=
 =?utf-8?B?RVBpbjZmSUNXT2N0c082T3Y5SFdmTXZBSVB1cFVKdDZ6NlFkaFlGK2hqMXJv?=
 =?utf-8?B?UVZTaFZNNDN6VSt2bXlvUnl0Z0VpV2o1MlJXaThaSmVoQzhLamZ5UGdYaDdt?=
 =?utf-8?B?ejk4V2RqU0xUcnF5RlA3REtqMnVaL05qRWVFTytJdXV0bUpzYnVJVmZ6Q2F5?=
 =?utf-8?B?MFlxVjdQTGZTQXdtRjFTREJPWThIak4xclFyNG14RnB6bVdOUnFPcWhORUJM?=
 =?utf-8?B?elNoRUxWR0I1VWk0YXdhU2thRHliU25pZ21JdkVPcFNjMkNxMWRWQytsUVdq?=
 =?utf-8?B?V3JacWlsT3JSSnRJN2hlT2ZHTmxxVThaYWJZVzlidDhMNEVxM1dRVE1ESUhx?=
 =?utf-8?B?czV2M0dPbnpEWDgrUFpadzB6K3dmWHlqWmJHUUpkWGp3ZTdmUGgxYkxrNXRj?=
 =?utf-8?B?MUx6U3U4akwxYWRnYXFreXVocndEZ1lSbUFZdEJiaWd2N1ViTEJwSjZDckZH?=
 =?utf-8?B?YkZNTTZ2dDdkNUs2SVV0SS9IQVZnSmdmb09oRnVqSk1PUFBYVUdLS1k2eW9Z?=
 =?utf-8?B?T29Vd3BTQUREQkZTZzRmdWlZTjBPd3gzOGpuemFockh2U09zUkdLR0E4QzJS?=
 =?utf-8?B?TVRnQW1UL29TZjE3Q1dOL0o4ZVZySWhYQ2YzM3prSmsxdUVsZU56dEl1alhH?=
 =?utf-8?B?aklCcnBxR0EyWHU4SlhDUUZpZU94NEtxbWRvRWx5OEpLTlJHSWlJWnJ2Ympr?=
 =?utf-8?B?NHFQeUJEeUxlNzNieW5tUTFNR3JCYkpuWXk4L2lWOG9RMzlSTW4ybThZcGNT?=
 =?utf-8?B?NUw4RHY5ZE5RZWhnOVlMcEZydGxzb0hKd2toWkdmMExjaStUSWk1NWFZdURX?=
 =?utf-8?B?dlI4SkRPaEEycllERUhaZmVCdk5uZTJoeExUUXdyc3BkZEtpUnRjVFNoZHlT?=
 =?utf-8?B?K3FMTkJ3UGc3QVhVZG96czgxNC8wcVZKRnF1OG5CNjZBRG5TK2xvOXRDR09h?=
 =?utf-8?B?enR2TnkyL2JDV1d3Ykl6MkROeVRWcFVaY29VTFRFR2JvRGpWVlRXaWt0WTFa?=
 =?utf-8?B?OGtmTDZ6ZlY5TktZQVZ4d0FEK25KMkp2NWFub3NlNENuL214TWdCYU1lWXE4?=
 =?utf-8?B?cE0xZFRvVnp4MzlOTHliUHMwakpvMDhZcktWSUxVZ3djSGJ4Q0MxcjJnNUhI?=
 =?utf-8?B?UE9LZnFxR2ZPUkQzZGRJSlVXR2lVRk9sRlZMNmNiY3Z5Zk1KZ1ppMWhzNUFn?=
 =?utf-8?B?Uml0bFdCaG1LTUd2TEpSL3dFL08rUDd5ZmM2V1F6SDVRd2R5Z1JKdGFjVGp2?=
 =?utf-8?B?UG9ETk8yU2hKOElCK1lnWU11d1pkQWNETDNQUWt4TFZ2akp2b1R1aWRVSC9V?=
 =?utf-8?B?NkNTZXE5UzRGcmJRUE4vSUJ0Yy9ILzlwNkpnY0MrV0lzSU5tZWlyc01xakh6?=
 =?utf-8?B?akxjVzhUV3dnS3dyanI3Q2FTMDdmWE4zVXU0b3lDandDbDlFS0lUNXl2S0dF?=
 =?utf-8?B?U0xQcC85am8zVEIxTWlvZFB6a0VqOU5NMEFtek90d0dRNHNmdUhOS3VKMmIv?=
 =?utf-8?B?SlBVNkZWc2pHTDBZZXFBYVJsRkFZQVAyUHpmVTViZFlwVHRTK1lQUzRMQUsy?=
 =?utf-8?B?ZlY2MjZNbkJ3Y0ZhRkRCQzNPMEFRY3VsYTRpWWNEaDNpM1RrMHVNd0hrRFNn?=
 =?utf-8?B?Ujd0Q3ByZ1NidWdHRklBOUNJajl4b3lPK2xNL3lTZDBDY3FXK044YWxnakJO?=
 =?utf-8?B?MGJ6ck9RY0oxSVZsbjZueFJ6ZHpoaGk4ZnB1aUxySURlSHJJSzc3N3lmZFl1?=
 =?utf-8?B?djNkV2hJVlBFU2QzaUkvRElqZWxWRHduaWc1YU56VFh0Ni83M0U2dElKY1BH?=
 =?utf-8?Q?E3/wQwohVS0KqLu8=3D?=
X-Exchange-RoutingPolicyChecked: ARPnOCPCV9NnpyV0qpgqHd6/DYDbrK5CP4F7O/R9vhTlvrqkm6Zr11F/F7TB2AK3kJ/0qUbS1Amj9m3Wr+e8G2Ex/zmbP69fcxmYTVESWx0/SXwrUTyKha9PEtD7aRyN12e1tEcHyrUVe7fr8VXxJEZVTUIiutDoHDz4h1NgP9+CTImklbu6WasTLu9nU+HfiZDoacI6awpz1yTABGj6Z7itc8az9/aEIIU3rA710hF6q0agrSgbyA4RrQA6BHXOchrtG6TQphzlOhBvP+RPZ2XMFDa20+dM6sLNNcXzUN9lyPkWv0ibVS3pUnNMDuz/TVFCW85b1pOZ/HlNCfgXwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 877668e0-9aff-43f9-a281-08df0e56b99b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 09:42:55.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4FgEi75TiJdERJEF52u0wTHnHPsCScwV0Yby8JGmH6pJkjQeIZDkLwCh1biH3y1cCtrzHA21mDd3bagV6KGmiSx8xvR6UTXOMCIEUVRyu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6722
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



On 9/9/2026 11:00 AM, Mallesh, Koujalagi wrote:
> 
> On 04-09-2026 10:35 pm, Michal Wajdeczko wrote:
>> It turned out that during early probe phase, VFs use detached from
>> the xe_device, temporary xe_gt objects, which when used as location
>> in xe_log() macros, will be treated by the dmesg decoration code as
>> bogus, possibly triggering a WARN, and the output will look like:
>>
>>  [drm] *ERROR* SIGID=104 (-ETIMEDOUT) LOC3.0? GUC: MMIO request ...
                                         ^^^^^^^
[here] ----------------------------------^^^^^^^

>>
>> instead of expected:
>>
>>  [drm] *ERROR* SIGID=104 (-ETIMEDOUT) Tile0: GT0: GUC: MMIO request ...
>>
>> Relax the tile/GT id validation and instead of looking for the real
>> objects, only check if encoded id is within the range of possible
>> tiles or GTs on the current xe device, using data from the device
>> descriptor rather then the object list.
> 
> nit: 'rather than'
> 
> Please mention invalid id case, how it's going to render like 
> 
> Warn + Tile3?  GT9? now.

invalid ID it is shown [here] and in the cover letter

regarding a WARN, it will not show up in production builds,
but it would look like:

 [ ] xe 0000:00:02.1: LOG: unrecognized location 3.0
 [ ] WARNING: drivers/gpu/drm/xe/xe_log.c:97 at __xe_log_emit+0x3ba/0xaa0 [xe], CPU#9: sh/5268
 [ ] Tainted: [W]=WARN
 [ ] RIP: 0010:__xe_log_emit+0x3ce/0xaa0 [xe]
 [ ] Call Trace:
 [ ]  <TASK>
 [ ]  ? mark_held_locks+0x46/0x90
 [ ]  ? __xe_mmio_wait32+0x87/0x170 [xe]
 [ ]  xe_guc_mmio_send_recv+0x354/0xc10 [xe]
 [ ]  ? dev_printk_emit+0xa0/0xe0
 [ ]  xe_guc_mmio_send+0x10/0x20 [xe]
 [ ]  vf_reset_guc_state+0x47/0x100 [xe]
 [ ]  ? rcu_read_unlock+0x1c/0x80
 [ ]  xe_gt_sriov_vf_bootstrap+0x2f/0xcb0 [xe]
 [ ]  ? xe_gt_mmio_init+0x30/0x1e0 [xe]
 [ ]  ? __drm_dev_dbg+0xa9/0xe0
 [ ]  ? __kmalloc_large_noprof+0x115/0x130
 [ ]  read_gmdid+0xf3/0x310 [xe]
 [ ]  ? xe_device_probe_early+0x143/0x710 [xe]
 [ ]  ? xe_pci_rebar_resize+0x17e/0x2e0 [xe]
 [ ]  ? __pci_set_master+0x61/0x100
 [ ]  xe_pci_probe+0x554/0xac0 [xe]
 [ ]  ? mark_held_locks+0x46/0x90
 [ ]  ? __pm_runtime_resume+0x5b/0x90
 [ ]  ? _raw_spin_unlock_irqrestore+0x67/0x90


> 
>> Fixes: 1151b9f6f465 ("drm/xe/log: Add component/location decorations to dmesg")
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_log.c | 40 ++++++++++++++++++++++++-------------
>>  1 file changed, 26 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
>> index 5549ef6966fd..29eb16db3320 100644
>> --- a/drivers/gpu/drm/xe/xe_log.c
>> +++ b/drivers/gpu/drm/xe/xe_log.c
>> @@ -10,6 +10,7 @@
>>  
>>  #include "xe_device.h"
>>  #include "xe_log.h"
>> +#include "xe_pci_types.h"
>>  #include "xe_printk.h"
>>  
>>  static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>> @@ -52,18 +53,24 @@ static const char *log_component_prefix(u32 component)
>>  	return component ? log_unknown_component_prefix(component) : "";
>>  }
>>  
>> -static struct xe_gt *get_gt_safe(struct pci_dev *pdev, u8 id)
>> +static bool allowed_tile_id(struct xe_device *xe, u8 tile_id)
>>  {
>> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	return tile_id < 1 + xe->desc->max_remote_tiles;
>> +}
>>  
>> -	return xe ? xe_device_get_gt(xe, id) : NULL;
>> +static bool allowed_gt_id(struct xe_device *xe, u8 gt_id)
>> +{
>> +	return gt_id < (1 + xe->desc->max_remote_tiles) * xe->desc->max_gt_per_tile;
>>  }
>>  
>> -static struct xe_tile *get_tile_safe(struct pci_dev *pdev, u8 id)
>> +static u8 gt_id_to_tile_id(struct xe_device *xe, u8 gt_id)
>>  {
>> -	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	return gt_id / xe->desc->max_gt_per_tile;
> 
> hmm, we need to check max_gt_per_tile should not be zero to avoid hard Oops. I know in real scenario, max_gt_per_tile
> 
> value is greater than 0 and less than equal to XE_MAX_GT_PER_TILE, however rogue user can write kunit test case and manipulate it, to avoid such scenario, we need to handle it.

desc->max_gt_per_tile are const and are defined in xe_pci.c, so ordinary user can't change that

we also have a test check_platform_desc [2] to make sure no developer will define max_gt_per_tile as 0

and we can't really control rouge user that will prepare and use invalid descriptor for kunit,
but even then, it will crash just that kunit, so who cares?

[2] https://elixir.bootlin.com/linux/v7.3-rc1/source/drivers/gpu/drm/xe/tests/xe_pci_test.c#L63

> 
> Thanks,
> 
> -/Mallesh
> 
>> +}
>>  
>> -	return xe && id < xe->info.tile_count ? &xe->tiles[id] : NULL;
>> +static const char *location_suffix(bool valid)
>> +{
>> +	return valid ? ":" : "?";
>>  }
>>  
>>  static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char *buf, size_t size)
>> @@ -76,17 +83,22 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>>  			goto unrecognized;
>>  		strscpy(buf, "", size);
>>  	} else if (type == XE_LOG_LOCATION_TYPE_TILE) {
>> -		struct xe_tile *tile = get_tile_safe(pdev, id);
>> +		struct xe_device *xe = xe_any_to_xe(pdev);
>> +		bool valid = xe ? allowed_tile_id(xe, id) : false;
>> +		const char *pad = location_suffix(valid);
>>  
>> -		if (!tile)
>> -			goto unrecognized;
>> -		snprintf(buf, size, "Tile%u: ", id);
>> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>> +			 "LOG: invalid tile identifier: %u\n", id);
>> +		snprintf(buf, size, "Tile%u%s ", id, pad);
>>  	} else if (type == XE_LOG_LOCATION_TYPE_GT) {
>> -		struct xe_gt *gt = get_gt_safe(pdev, id);
>> +		struct xe_device *xe = xe_any_to_xe(pdev);
>> +		bool valid = xe ? allowed_gt_id(xe, id) : false;
>> +		const char *pad = location_suffix(valid);
>> +		u8 tile_id = xe ? gt_id_to_tile_id(xe, id) : 0;
>>  
>> -		if (!gt)
>> -			goto unrecognized;
>> -		snprintf(buf, size, "Tile%u: GT%u: ", gt->tile->id, id);
>> +		pci_WARN(pdev, !valid && IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>> +			 "LOG: invalid GT identifier: %u\n", id);
>> +		snprintf(buf, size, "Tile%u%s GT%u%s ", tile_id, pad, id, pad);
>>  	} else {
>>  		goto unrecognized;
>>  	}

