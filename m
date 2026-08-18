Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA7BC5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 18:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5005210E050;
	Tue, 18 Aug 2026 18:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CK+fldAf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848C410E050
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787077803; x=1818613803;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D8TQUi1CgQ+JEFrvq9NoLTCTYOgvUV1jhDGyPKSsL8U=;
 b=CK+fldAfMsXM72s72X5tx/ulO1L5CrGUlYIIdDmNbpbUIroSRy5FASNl
 Jv1o+e88taVmTP1nO0GhBSFB8F1xzaIAQwHWCCw5xWINnJil8/j1tltnL
 wLpi3BBbOY3lbv5daMPGyFr8WBjpK4FN1WpBPxlEqggYBQL+tU5HdBYEW
 27gu2VD2IqmzJ5FJTyYu5FiOswnteofxjql4gDNZzVa+LJX4r3s91o703
 WcyPDu5kVugf222EkWEY4Hy+H3SmgljWZvlFCYFz4osKCmNKU6iqDNbgq
 9f4QfKdkVUYivx1UoIljs7LepZzVDD5fjvwf/mqy0zDPT00h7y1i/O2Cd A==;
X-CSE-ConnectionGUID: tMmWqVFDQ8qO/Ad/lk1rPA==
X-CSE-MsgGUID: uL/3Mg9ZTXq4JNrPYOwwZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98172901"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98172901"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:29:59 -0700
X-CSE-ConnectionGUID: wxa0xo9+QwS36ZyyqwHJyg==
X-CSE-MsgGUID: Zd65Bq2vTwqKLf2iQPxiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="290115514"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 11:29:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:29:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 11:29:58 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 11:29:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFHAOt9tQThlTLIEYsUlT31TjEcUFNnmuUGwO/IGCIMovXQu/pIj7w3H8q8zHdfK7XJX/ENJh1UhIVVKcLkB866JSzE1n2DOQK8FxbJHFe53zQGJqdIF3IU8L5B+8DfGTJIHa/16wjFq8NfYfmuWeInZiP+WZ4FkJ5Sm2/Jt+/NP6koPQCBbQTfwIhVwAdtt84qIYgmFxNi69u286fFfUsHT+XcOmGCTY/YlimNSLXYCQbQK/2fa59tazOI46BO+N1JOKdlr6u7MKbJPHnA/I9jVuZPHs2mOA3nt7PcyeFOW8c6aGpWFf2YCI4C4wMwrz97ueXTdB4UbMnKTk/poog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiR5IiHBOR1L9yhey0wANEcfZX56f4sbLM2M01O1Itk=;
 b=mDa/9YWYi2NhBfcVSFZDO7LdL3hLaUnR19JKtPAM1qKYhS5ZZ46l6XPhw1M076xXqk3QIB4zbqoOpnZ6yTSw/y5jlCktODXDqqAmFgWouG4f1vgEPDberait4f5v72M7ntqftpeLk5oThA+Ilyj5I7Sr8nHWWP7/7bH4Eu3PMjSH3WOlhLB0VwiGq2N+WgmXGbxXWoX6N6WCh4/62oBBsLIaNaaFyv+zPdHczRdr35mi6eXsqNep9lIF1FSoUP5SejGkqohvgwujdsJUifjUR/lsTdQeseW5svRfwTcY2J4Wwppc/++1eWzS03sxLHERISqLCjTIXgacL9As6XWCyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7556.namprd11.prod.outlook.com (2603:10b6:806:31f::21)
 by CO1PR11MB5075.namprd11.prod.outlook.com (2603:10b6:303:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 18:29:53 +0000
Received: from SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c]) by SA3PR11MB7556.namprd11.prod.outlook.com
 ([fe80::3b95:cfb:be21:788c%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 18:29:52 +0000
Message-ID: <47c7270c-a019-4ffb-acb9-f06d652fa744@intel.com>
Date: Tue, 18 Aug 2026 23:59:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/sysctrl: Add System Controller get
 application status
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
 <20260807145621.2938848-7-anoop.c.vijay@intel.com>
 <anYpNPX3o7a5vEkd@intel.com>
Content-Language: en-US
From: Anoop Vijay <anoop.c.vijay@intel.com>
In-Reply-To: <anYpNPX3o7a5vEkd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0292.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::19) To SA3PR11MB7556.namprd11.prod.outlook.com
 (2603:10b6:806:31f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7556:EE_|CO1PR11MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f7cbac-0a1e-4e3b-1bc5-08defd56b1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|6133799003|4143699003|11063799006|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: anbgW9PQm1BLOEyx6SneLBSjVl/XfyLp26SUqsA/4IwbLM835Pjsoe8A59kEadKXTybHGm01Cq8wpCCuaCmnNhWPHOzs6UMXv0uPofs6eZlWYhQV1+2wSfHpo0iQXRFFPpDDRUbq6SXSn9BNDm4zFfPlWg1D2lAMhJC7oBGznrvJvQfVLj8szME7db1krNxlv8vTypPxNa3yPUrVeUfqsG58KrZpp8Z/+lx0t1mJr3pcGf7oWfsCQCsWTY/bV/9wRQZd/1XGy0WuINZS3eSsqfJyPar8JHYO19o49Ecn3oXS1vppVDvrS7pMZsRJ8fKDWY9RH62sFollk+XHb/+aGnuPXmtxSW9tn1FtE0Wfea7TbsXLD/rVpQTywG5l0mn95E3NhhrOfcfSrnDH3IB7JQQm+XdZ3cBg7lTej3i5Czh6PG9UJgqCqKZQgnSaPZSYIE4F0BtQ6FRxN76w4C7c4a0Nirt90Rak8XJ+5dRCqoApjxF3PnYVegrE4KUd3Y1PzRxsGLqycM9wavHHvbIfqi0Utkig5Y3dAaughAQGl7BOMHRMFPz6rDE6DNdaz+oNzOqW2MHOWca1izjMjFn0ATI8OABPMvLYR8EV4O0DiAn6U212vf/jeFSWbUNsUuqoh/Fw1l0VIfPXBIPBqOT7Qtrxmti0Xx1j5h91OwjlFc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(3023799007)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC90SFZlVUpRTWdZVXlYK3BDWGs5T2ZPenlQclNKRHc3ZFNNdnFRaFo4Um8y?=
 =?utf-8?B?Z2JaVUtUVVhhaDB6R3JiRGc0R3VSNEZNYThibEZRdTBLMU4rSnM4RWZzWDZo?=
 =?utf-8?B?dFpQL0NqcjRXU2JEaGVTb21JMmR4SEhoQklKTlFMTWNQRE4xVXVFYkt3R0Z1?=
 =?utf-8?B?RTM5SkFjZ1BCU2hzZ3c5MWhpQlhMbEN2Y09WcXNvWmZjRjJRYWZFNENCMUtZ?=
 =?utf-8?B?VkpOT252cnkzUFlQc20wamp2cnFCY2ZLdXVoTE1GT283TzR6WGVSdllENkFB?=
 =?utf-8?B?cTJrZFZLK3N4Ynh3Zmw2M3FsSXBZVFUxVDB0SCtaakZsVnMrOE1kZTZYd0dq?=
 =?utf-8?B?UTh4Zk1ONTFhUC9VNjJ5Q3FMc3ZHb2dxTU9XOHpXOVBSRGZWcklIbU5LYU96?=
 =?utf-8?B?WE5hUkRqb3dGUEtEK21qZnI1UmxRdVAvNm00dmFZdnhpWVhjZDd0aUhHK3NU?=
 =?utf-8?B?ekFxMk9FbE1aRHVVQS9kZ1lSdHVPamtnbFdIZGsveUY4MGtrRFV4Mk5qa3Fx?=
 =?utf-8?B?TjN4Z3JNYm1vSERuWE1aV1pNK0pPRE94YTh0OExSZkY1bVFkK0FreWV6SzNU?=
 =?utf-8?B?UTlvallacHpMMVBrTmVDU1pRMVRrUnBTaTV0Z0lwV2FYT0dCTkpzVEFCYnpN?=
 =?utf-8?B?S2U2M3hyaDlHT1NxV2xNWTd5NTRrS1JIWGJHYTQzTWRlRjFFOWlEWXZDL3Bl?=
 =?utf-8?B?NVVKR20vbUFKeUFsUW9lQ1FoaGFSb3Q3bVRieUtSaUJzOHkrd29neGxtQ1hT?=
 =?utf-8?B?VitMOHJFdTg3a0l3ZzVnMlhZcDRMNTE1UG5MZnl4OUpET0xDZkxqeG9wRCtC?=
 =?utf-8?B?UGxxa20rZUlvWm5KNjJTYitMV3U2eE9hZlo4dmtHcDBncXZjT3lFTUlva2ZP?=
 =?utf-8?B?ZE5ZTTNYMmo3clNhZTgzSVBaWFpEaGgxdTM0dy9CbDlrNWM5bVU5MWhsdEpD?=
 =?utf-8?B?NXdBY1hUVElJc0dPUWYxVWpRcGZaaTl1R0FZbWpXV2dGaUJZTUpldTZEZmFh?=
 =?utf-8?B?c3h0YUpDWTl6T2VRWVNvUXpRN2p6WkVNT2UrdFFIUm9qUkFVaFNrSE02Wm02?=
 =?utf-8?B?bnMxNkVXdkJWa2oySnRmSDN1NFE3NFYvdnZ3ekpwZnR3a2RpZjhhK2ppUHlo?=
 =?utf-8?B?Wmd0V0JuVE1EbVN2UjlwdVZaUG9RdXV5cWQ2alJMQmRYT2hPc0NWL1ZYbnNO?=
 =?utf-8?B?WUZHa0FqYkFxQ04xRmk4aUoxSXZDaEx1Zlc4alVmdWphN0tzNDAxZ1NXMGlT?=
 =?utf-8?B?cU5pNDdaWm9EWVJ4OWxqYWhHZ3pvUnplOXZhSzNQUEFWdXZxTmVsYld2V1JN?=
 =?utf-8?B?M1RCRC81UmdoV2VCYmRKWFd3ZlZnanlVWlFVcGRzTW4wOHBEbW5zL0hLcXZS?=
 =?utf-8?B?Q0V6Z0JyNlV5Z3lZdVRyb2s5R3orNCsrQWwwOXpLN2QyV2dTb3RuT2g1RVZ1?=
 =?utf-8?B?aXZaTmZhb3p0cVpjc3hEb0VsTDVpNzVLa1VDcTJ5MFVmNldiOWZuZmxldUE1?=
 =?utf-8?B?aVRtUXp3QjUyUWcrSVl3eHVBeXpyNkNZUkJGTlE4bVRKRUJPMDdNVFRzSWRJ?=
 =?utf-8?B?YTFCMnlGeitkK002QTJ6QTlOcHB1QzhvTUxoZG50T29Mbm1MREowWi91MnQ2?=
 =?utf-8?B?YjdIT2Y4dS9WTlRDNEo2cVhPL09CYi9xMmt6SSs0SVkrU3hJUC9mQ0JXSFAv?=
 =?utf-8?B?c3pYcmpyNElqc1Z6eWVwcnFIRVZBMExZVjJ5S1hvenFBQXNOS1NadDA0RFFR?=
 =?utf-8?B?b2h2VW80VTY2S2lhckE2a1M2YWRSQnFQblFvbUpWYmtnaE1ZZkVSS2F1c1lQ?=
 =?utf-8?B?WlVhdDVyM2pUVnJjck5jQjg3YXU2T1MxNzZNRlBPalBSbnJIbXpRaDZvNmxt?=
 =?utf-8?B?eG1CVlU2VndRc2NxR3ZYa24yS1ZXQVJRc1VyNTRvYjJnKzI2ZHVVM2l4RW5W?=
 =?utf-8?B?Y0FSNUtxaWtpYVA2eXB4RDVkVEtHMmJzMStLZCtNeGt2VEV3TzlrbURxSjVz?=
 =?utf-8?B?MTZvZUVoWTE3cm5oOER4djFsM0kwOG1CdURYdDRIUlJJc01qTkQ4RjhUSnVr?=
 =?utf-8?B?dzdCaWptVkJ0azU2Mm4zNm15bFhPdU9CNkFvQ3ZkQTlwMkFJVHY0Z1g1TzUx?=
 =?utf-8?B?L0JJdDNqVUZCTmVibGJGcWVlck9wb0I5b3Uxcnp2bFBtYlRIa0QyNUNCb1d2?=
 =?utf-8?B?YzJkYUU3NS9SeG8xUjVWWlBIQ24yQkhJS2NPcDUzbUxCQk43Z2RmOVNUYW1F?=
 =?utf-8?B?TGJhcnBDcXQ5SG5rWXRYaHR5ZW5oL1ZLRVZsUkJuZGM4V0JYQzhxU2JEVTFy?=
 =?utf-8?B?RndiR2Z5azBkYUJzVDVFMzVMVlE1VmZxbVJFR2tzeWRiMEN6MjdFbnQ1MVVI?=
 =?utf-8?Q?38LSHsfUN+AGxxTc=3D?=
X-Exchange-RoutingPolicyChecked: DozTpJT7/lcgeuerRqgXDgTIL65KIJpfPtqenUvtPFBRRP/2dfA6OLQ/cKHeqQJW8S8b7KBwsBvhm6xSpXPDxsz23YcAreeSQejAP231J6p98k/UW7KNMEcsot+u7Uo/6VNjfu/S1Deq81fBZU+eyS9HjhNdFwqK506s8bg7Y5zhn8akjRk5lYpZU28Nu5plZnYhdJZ1C0fuUSaZaVsgrOXZ26hJJjSzwN9yIv65D5xkMCKWPEwQAwKq6ng+24WqE3ci6Zkn1zApXu9QJE4KiHMJ37EJtgmLTILFd4gqhKOF6TkL6wqQ5/RrZESfgXl2/2ZEQhqQuBygIuvq4AecaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f7cbac-0a1e-4e3b-1bc5-08defd56b1c7
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 18:29:52.6633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIu7FCLzCwWp9chwBFeVtefjOKTViV52BEn/Zko/eC6v0GVTFwtnI8AmlIAfkn7C+hUhtq1E3srmyDtv60Y3SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5075
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


On 08-08-2026 00:21, Rodrigo Vivi wrote:
> On Fri, Aug 07, 2026 at 07:56:22AM -0700, Anoop, Vijay wrote:
>> From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>> Do not review, CI only.
> Why is this the case?
>
> Is it part of another series that is under review?
> It would be good to put the lore link here if this is the case.
Yes, this patch is part of another series already under review and was 
posted separately for CI validation only.

I'll respin and include the lore links to the parent series for reference:

https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vijay@intel.com/
https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vijay@intel.com/

Thanks,
Anoop
>> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl.c               | 82 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl.h               |  2 +
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 65 +++++++++++++++
>>   3 files changed, 149 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>> index 1db20be8158b..8eac58647265 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>> @@ -13,9 +13,11 @@
>>   #include "xe_device.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>> +#include "xe_printk.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_sysctrl.h"
>>   #include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>>   #include "xe_sysctrl_types.h"
>>   
>>   /**
>> @@ -130,3 +132,83 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
>>   
>>   	xe_sysctrl_mailbox_init(sc);
>>   }
>> +
>> +static enum xe_sysctrl_fw_status
>> +xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
>> +{
>> +	struct xe_sysctrl_app_status_req req = {};
>> +	struct xe_sysctrl_app_status_resp resp = {};
>> +	struct xe_sysctrl_mailbox_command cmd = {};
>> +	size_t out_len = 0;
>> +	u32 flags;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>> +
>> +	req.app_id = (u8)app_id;
>> +
>> +	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID,
>> +				  &req, sizeof(req), &resp, sizeof(resp));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);
>> +	if (ret)
>> +		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>> +
>> +	if (out_len != sizeof(resp)) {
>> +		xe_err(xe, "sysctrl: unexpected get app status response length %zu (expected %zu)\n",
>> +		       out_len, sizeof(resp));
>> +		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
>> +	}
>> +
>> +	flags = resp.flags;
>> +
>> +	if (!(flags & XE_SYSCTRL_APP_RESP_VALID))
>> +		return XE_SYSCTRL_FIRMWARE_APP_INVALID;
>> +
>> +	if (!(flags & XE_SYSCTRL_APP_RESP_BOOTED))
>> +		return XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED;
>> +
>> +	if (!(flags & XE_SYSCTRL_APP_RESP_INITIALIZED))
>> +		return XE_SYSCTRL_FIRMWARE_APP_BOOTED;
>> +
>> +	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
>> +}
>> +
>> +/**
>> + * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
>> + * @xe: xe device instance
>> + *
>> + * Returns true if oCode firmware has reached the initialized state, indicating
>> + * it is ready to handle requests. Returns true also on platforms without System
>> + * Controller support, as there is no firmware gate to wait on.
>> + *
>> + * Return: true if oCode is initialized or sysctrl is not present, false otherwise
>> + */
>> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
>> +{
>> +	enum xe_sysctrl_fw_status status =
>> +		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
>> +
>> +	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>> +	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>> +}
>> +
>> +/**
>> + * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>> + * @xe: xe device instance
>> + *
>> + * Returns true if diag firmware has reached the initialized state, indicating
>> + * it is ready to handle requests. Returns true also on platforms without System
>> + * Controller support, as there is no firmware gate to wait on.
>> + *
>> + * Return: true if diag firmware is initialized or sysctrl is not present, false otherwise
>> + */
>> +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe)
>> +{
>> +	enum xe_sysctrl_fw_status status =
>> +		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_DIAG);
>> +
>> +	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>> +	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>> index 090dffb6d55f..b69a3f474236 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>> @@ -20,5 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
>>   int xe_sysctrl_init(struct xe_device *xe);
>>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>>   void xe_sysctrl_pm_resume(struct xe_device *xe);
>> +bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
>> +bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index d0341538ad05..b507e1553cbb 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -14,9 +14,11 @@
>>    * enum xe_sysctrl_group - System Controller command groups
>>    *
>>    * @XE_SYSCTRL_GROUP_GFSP: GFSP group
>> + * @XE_SYSCTRL_GROUP_CORE: Core group
>>    */
>>   enum xe_sysctrl_group {
>>   	XE_SYSCTRL_GROUP_GFSP			= 0x01,
>> +	XE_SYSCTRL_GROUP_CORE			= 0xFF,
>>   };
>>   
>>   /**
>> @@ -38,6 +40,69 @@ enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>>   };
>>   
>> +/**
>> + * enum xe_sysctrl_core_cmd - Commands supported by Core group
>> + *
>> + * @XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID: Retrieve application status by ID
>> + */
>> +enum xe_sysctrl_core_cmd {
>> +	XE_SYSCTRL_CMD_GET_APP_STATUS_BY_ID		= 0x05,
>> +};
>> +
>> +/**
>> + * struct xe_sysctrl_app_status_req - Get application status request
>> + *
>> + * @app_id: Application ID for which to retrieve status
>> + */
>> +struct xe_sysctrl_app_status_req {
>> +	u8 app_id;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_sysctrl_app_status_resp - Get application status response
>> + * @flags: Application status flags (see XE_SYSCTRL_APP_RESP_* definitions)
>> + */
>> +struct xe_sysctrl_app_status_resp {
>> +	u32 flags;
>> +} __packed;
>> +
>> +/** XE_SYSCTRL_APP_RESP_VALID - app_id is recognized by System Controller firmware */
>> +#define XE_SYSCTRL_APP_RESP_VALID		BIT(0)
>> +/** XE_SYSCTRL_APP_RESP_BOOTED - application has completed its boot sequence */
>> +#define XE_SYSCTRL_APP_RESP_BOOTED		BIT(1)
>> +/** XE_SYSCTRL_APP_RESP_INITIALIZED - application has completed all post-boot initialization */
>> +#define XE_SYSCTRL_APP_RESP_INITIALIZED		BIT(2)
>> +
>> +/**
>> + * enum xe_sysctrl_fw_status - System Controller firmware application lifecycle states
>> + *
>> + * @XE_SYSCTRL_FIRMWARE_APP_INVALID: app_id is not recognized by firmware
>> + * @XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED: application is known but has not yet booted
>> + * @XE_SYSCTRL_FIRMWARE_APP_BOOTED: boot sequence completed, post-boot init pending
>> + * @XE_SYSCTRL_FIRMWARE_APP_INITIALIZED: application fully operational
>> + * @XE_SYSCTRL_FIRMWARE_APP_NOTSUPP: System Controller not available on this device
>> + * @XE_SYSCTRL_FIRMWARE_COMM_FAILURE: communication with System Controller firmware failed
>> + */
>> +enum xe_sysctrl_fw_status {
>> +	XE_SYSCTRL_FIRMWARE_APP_INVALID,
>> +	XE_SYSCTRL_FIRMWARE_APP_NOT_LOADED,
>> +	XE_SYSCTRL_FIRMWARE_APP_BOOTED,
>> +	XE_SYSCTRL_FIRMWARE_APP_INITIALIZED,
>> +	XE_SYSCTRL_FIRMWARE_APP_NOTSUPP,
>> +	XE_SYSCTRL_FIRMWARE_COMM_FAILURE,
>> +};
>> +
>> +/**
>> + * enum xe_sysctrl_app_id - Known System Controller application identifiers
>> + *
>> + * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
>> + * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
>> + */
>> +enum xe_sysctrl_app_id {
>> +	XE_SYSCTRL_APP_OCODE	= 0x0C,
>> +	XE_SYSCTRL_APP_DIAG	= 0x0D,
>> +};
>> +
>>   /**
>>    * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>>    */
>> -- 
>> 2.43.0
>>
