Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FF6CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 09:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E83310E77D;
	Thu,  8 Oct 2026 09:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdI/5mEw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3676410E77D;
 Thu,  8 Oct 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791452146; x=1822988146;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=suEjVEoKO1T6CwCAAtcOzt50D0R8I/1tCcXSrMmmCiU=;
 b=DdI/5mEwBcV2COA+uhZ+Ooq1mX2N9pDQCSXWZRSQJxUZPSnlm66lv46w
 Hv5FMWr8lyHtue1rFJd+NIJLxSx/PkOjQlyihNx6FZtHq6h4iG/W8tDEx
 GGOJtHSxx4AMtFVfdv8wPvXYx5zrXlXSa0jv465dtwnJ3IkcAcWZHe3Wc
 SovmkC0WTMJnFK5dkwWX8qTsI3OGebVv7tPjKKj2uADxKLWNSpUzN8hMN
 pNXXGo+CeImtExbb/84hVA1b3WScOfC3uttJYsJ2UF4vk6pg0V/+ojs8J
 TQnXAHYdlsP/8cJJ1GAmCjXwSXDZHx2jHGTpAR0ZiLjr88M7FKvQsJevT w==;
X-CSE-ConnectionGUID: vzriocYmRb+VR2iwcNMIlg==
X-CSE-MsgGUID: p5ok8yfyTUm2FEZdjdl70w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="117503"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="117503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:34:33 -0700
X-CSE-ConnectionGUID: aKU9XF8cRjChAemDY4c+ZA==
X-CSE-MsgGUID: Xd8/h4u0TDKYhfYoClL1Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="87144"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:34:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:34:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 02:34:17 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4Rc1vGqMjqo8SRj9bPOePyJneG17NQ7Bh4bOYCKBe/f+ZwOxNql/tjMU9tZREf62In5T5FaGqUv2xuzhp9dt13HU8AfuPuQJmAAiZ0T6hs3HvgmTsHTd1n2nmXltIQQyj1JgU2+ahX94IO2ZpPkk5FmTGGw+Bhkudo/UR06JPW+Z8h/nx92S5YRFVwWnGHl/NSFHmaGRvLKoH8BBBPkS3/fhmG/wESqzgl5PjVGcfidcTOGtv1jW8Ul1n/bsCkv06WfZLZG39nccCz6tz9idzLPMIygZPJBP9Rn3zPBS1DA387IewhbpkUvGl5d1wFOi8nM6CeVOMAlpQKv9MPiyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suEjVEoKO1T6CwCAAtcOzt50D0R8I/1tCcXSrMmmCiU=;
 b=blc3HwlVVTk1Ox6kkMRcmigI5AkZdbL0zFBjxWjKhMbDvoWerDJn1L3ekft5VryKAObXm0bAHurtTOp1DxBCNyPigwIcqO2LFRgnIoG1mo81KGJd6jDvIf7tJCG9+wAJ+URLEp1ZpZf/ikLIPPnrPjR2W4YtnRQ/Ll6gxMOc5uWa3u3+mxVsMmeByeUZEYqh/aT9iG7wFn+SUe0vEpr1V/EwPVJjpfLzoSove/b7e7VU4b7qvw+GRHJgCtXtarqUF2sK+XGo7+xev7ezFcQIt5MG+ErLH5cXS/4QDDyDmdYVt5Ya0uWxIFdmAyrthXBvz4bDWGubfDMq3QDhl1o9Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SJ0PR11MB6768.namprd11.prod.outlook.com (2603:10b6:a03:47f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 8 Oct
 2026 09:34:13 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:34:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 8 Oct 2026 11:34:09 +0200
Message-ID: <DLZCR26Q9YQ6.1APHX12DA97O@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/i915/gmbus: Stop frobbing with pin direction in
 .getsda()/.getscl()
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
 <20261007222314.5714-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20261007222314.5714-2-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: WA2PEPF000008C0.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::69a) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SJ0PR11MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d1e4b8-fbc6-4a61-f932-08df251f4ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|10067099003|4143699003|56012099006|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2iFCfuuCgdEJJsAdM8wUIOYyXw7dXaf6Ef8fRiwCO15CKv4IVSyVU3wBPj8yfCk+eLuB9t95ytNdPh3pJLDsbigIlZRpZmxMDnsSh0K7wpFwPkukPH3/Byohuag1Ibcrgj2XAPffI0AN1rZG3AEVq35Xt2YsofK/6C8T1Njsjhl5ng73WgRfsPGWZIHVEHw3+MROSqOoZiUl0vd8kSlbsKEciWRF5mT9k/lui/VDbTrc8Gi69T2r8aKigOUKOOUdE1MW/S1sYUy3ecnmPoK0xEOg9i+euLc6KgkDnqbSvErIw4rfKo+P71/Z5auVfdGmBDq9oM+jWDJudcPB4k79DF+BGAiArL6VuAWQZfVpusq2lm55dR1JC1Sz7Srcn1/9+P38+YxmyqanA+UCG3lktX+0yeq1FwSfmUC6b/2Yiakl595D564g7xz3JQIye9+Hg+f298ZbqaHEzC0bijM1zM2jIWKasik/zsAwLexOHv3nBMHNkrBCud872HncwHkcWM+ZPeWKVeetb4LK9qh/1Fh0sG9bKaif8pkZ/R3iY3qpehKualIDE492FJaSsOaSSUHRAvOtZZqudNY0GLFxDJfyKqzDgwV1nsAJn9Rh5lpw5u/qzihJ0kXOaUcoTZ/a8Z3wHSGkxd0VTk3+O3RsaTHOxIZWggmfpvaRMMdy/Ak=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(3023799007)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmVWczA3MTNIdGtwVjV3YlJZd1B0TUJUcmFEWEo1YmE2YmRwV2pVVXVNRWRG?=
 =?utf-8?B?aEI5blhVakw3WXdQNnRscHFDVWZsTzB3NjhCVDZ5Q2VoSWU3akNoSy9MTjFC?=
 =?utf-8?B?cERBOHlYWmZFenpkejhDZ3dtNUtCakgxeVVGM0Rsd1pqK29qc2duTjZLV2xz?=
 =?utf-8?B?M3JmdEU2NTF6Yys4Q0h6N1VJZ2pvY1JSRnNYWDYrOUpDVkJxdHNka3A2MEkx?=
 =?utf-8?B?SmpudDRlZHVwRVVHMHlBOWQ3QlNnSnMwYnVSeHc3cFUzWHNoZ1VwaFZ6MElT?=
 =?utf-8?B?ZGlndzdlYmY0ZVdaWGlTd0s3NDhXRFNLampST2gvN0ZrMHoxQnBYd2VjNDly?=
 =?utf-8?B?Vm0xcXFnekZBb0tXbHNwcFEvcTgrV0VMU0NGbDVzejVKOXFONG1qZzNpcit3?=
 =?utf-8?B?WkZvV2ZHYWN1Wk5uYnN5czJGMEJmTk5Ja01ibEovMXpuSDVzWGI2Q3N5Q1ha?=
 =?utf-8?B?TEh3SHhub1VUczZDSFBiV1dmQ25ZZ0VVSkdIeEh4djNrYmd2dm16UTVac3Z4?=
 =?utf-8?B?RDU2aE5yb3Q4RUhPWVJKeEtlU1NaUVVFNnNoQ1dYNktuVFZOSVJ1d0ZuMmx5?=
 =?utf-8?B?VENaUXFyNExNV0hBdVBjdG8vbkxpTjY5WnhWTDR2ZWhYMXhpMTl2WTFSRlVv?=
 =?utf-8?B?U1F1RCtRT2E0b2toL0ZYSG0yU2k2MkNGenl4dlo2bG9Ea1RpZ1UyNlVnUnI3?=
 =?utf-8?B?WEsyMWhMMnNLT1d6QUI0TERYdVFBRVJPTGpJOW11Sm9nL3YyNkRiUnYzeFZp?=
 =?utf-8?B?cGVJbVdGV2Rja1lWQ2pNbVJ6RDBaTGNEdEI3bE5sVVVEV2NMVXYwQVFrRSs0?=
 =?utf-8?B?c2dhaGdKZ1pyUE1aaTVoYU05SmxDbER1UzVMcDZZaTFrQXM2Wk1CN1VKa0VV?=
 =?utf-8?B?SytjelRKK1VnMEpLMmEvaE5nRDByR3hWY0V4WW95ZU9sVjNBN29LakpPVFRl?=
 =?utf-8?B?d0Ewdlk1U1UyOUR6NnlNT1cvOElQc3g4YXlublMvUFY3RXZ2SkE5WWxOc1Vn?=
 =?utf-8?B?SGpxcGVtdlI3ZjhhMUFUTm41ek9jVmZMMUhGaHBGbWlCcmhVUTgwNFdPYXZv?=
 =?utf-8?B?U3djTmhnM1pYdERhNVRvZ3lJRURkUHA0aTJ2K3NGVjFwNElWOEpxdmJPRWZ0?=
 =?utf-8?B?Q2Nud1h2U01QQXZzMEdCU0R3bnM4ZFlER1BVYkc5eTJTY0NDYmg0WmQ5KzRE?=
 =?utf-8?B?dCt0Vk1sdGVaSzBZT2pIbE1pRTJqL2tvWlZQdVVtZnM1UUtlS2tYS2E3Vkl0?=
 =?utf-8?B?dXRyMGYrUlRYeE5BV3JXaGh0eHNTVTJDdm5zTWZHM2JyMDZCSEFpcThROTJ5?=
 =?utf-8?B?Tit2QUovenQ1QlphV2RhN0FPTUNvZEdoZk0wTnptTEVOZys4OFpNaHM3MTJF?=
 =?utf-8?B?akxXWmRycStwdEhsY0lEdk5kUE5IZVhVZTR6bURmVmZOODJNT3QrMDFDNUFl?=
 =?utf-8?B?elJyY2xQcnU3R1BDZXpzek9DMzhTUzFaSEJ3Z2JHNE9VaExSRERsUHhNWVlx?=
 =?utf-8?B?YTFqb3BHRTZIVHQ2Q280Q1JFVnpGOWorM0dSSk13TWh1Vk9yY3UxOVdnMGJO?=
 =?utf-8?B?bWlRUng0eUxJbTZjeXBDQjJxOEFlRTkxd285SEZUVTVnaHFEMGlVeHB6bVl3?=
 =?utf-8?B?bHZrQnpQN1NIR2U5YSswYjlkQytYckZKaUx6eStGdTZIcmxqRTBzTjR6cEl3?=
 =?utf-8?B?NGRGUndFS1dHdXhOaHFnU3lxbmJQcE13UUk5RktRQ0lpSnBhaXR4anhBYjhx?=
 =?utf-8?B?QzZlUWpUODhXakpVRFhzSW9VUklMQTVVNHJnOFk1TUwrWnhGcWIzY1FsSGZN?=
 =?utf-8?B?NStpWVRNOWwrc1pLMElNdnVvdnpMZm9mWjlvcTJZL3RmNEhTSUVpbzFwbXVE?=
 =?utf-8?B?aXB1eHAvMXlLUk11WFd0c292RDQ5YmlsY3JrOUdJa25td1llY3ZHZUxlZit1?=
 =?utf-8?B?TktMSVZPNzJpT2grckFuUTdWMCttb2M5UEFwT09XSnc2YUxWdzE3N2F4M2Y1?=
 =?utf-8?B?K0xzcmdvRm9GR3BSb2Q0ZGt2eXViN1RQTUtJUVdtc3lsQnF2bkJLM2p0UnYr?=
 =?utf-8?B?UkNleHlRT1IrWEZyMkltWitZQjh3czlVWWdUZEg4Skg3eWNJRVVBTjM3d1ZZ?=
 =?utf-8?B?YlRUeFFmV1VORXRYQ3FkR3NEYndRVHplWFROQ2djbkJBdWt5NTVsWHFHUWFo?=
 =?utf-8?B?VzYxd3NrMWpWb0VVRzdtcVhpd0dHclBGdHlTNnBaWWRqMzJYaEpWZUpWZGFE?=
 =?utf-8?B?NFN6YTQwME13VUpHTUcvdncwbUErZ2VnazNlOTVMZjBSSFJDbW1NT0F3SHM3?=
 =?utf-8?B?ZVJCd1k1TFQ0M0NMZzhNRTVjenk2dFgzVTh1cjlEVTkwaWpock43aGFUSWdz?=
 =?utf-8?Q?4wCM7c2V0xrZs8RQ=3D?=
X-Exchange-RoutingPolicyChecked: sOdVyLo938OYz3jO557ztRK+FwNlNQuKWLWo5Oh/tZ6ibsr37OUOfgl5vv7q/Y+vnDwq32Tb/0OYZxHsOG/UXrJrSBKn5DV5MeT219icYxtFMhsplBEVsZC7DsggZfGRvecWj4BVigsngH6jm6KlKujyzABfy5PIRwZT2ngqBR7lP4qL4tEZocDHLXcPR0Dcbq2plAmNam0pDuzMApJlEYwsq+YVD2z5FdM1dqnNhp49+UF8nnKs8PKW57QXpb4AIzST1kgcB1Vw2Zephmo3VfskeQmDg3lOyttJnj22kvgADOJHbX2IZbOqGrXu5PeqIL6MkBMqcE0eTD0r737odQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d1e4b8-fbc6-4a61-f932-08df251f4ff2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:34:12.6600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SILhJLgJhHR/QGy0N5qC8e2oCpYpS1uKNi8MoFv9BCIkPQlNa9lhQjeJYS4yzxwy0zeqdP0emNPAqHm80L4bSU6r5a/GJcCFanZoRyJjb3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6768
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

Hi Ville,
On Thu Oct 8, 2026 at 12:23 AM CEST, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> i2c .getscl() and .getsda() are just supposed to report the state
> of the pin without changing its state in any way. So nuke the
> bogus register writes from there that configure the pin as an
> input (ie. tri-state the pin).
>
> Given how i2c works the pin will already be tri-stated when
> .getsda()/.getscl() are called so these writes are in fact
> redundant. And even if that weren't the case the input bit
> does appear to reflect the state of the pin, even when driven
> as an output.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

