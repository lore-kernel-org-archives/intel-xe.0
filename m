Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E4CA600E
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 09:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980A010FD64;
	Thu,  8 Oct 2026 09:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeJ/duz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8265A10FD66;
 Thu,  8 Oct 2026 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791452958; x=1822988958;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=TffQfGS9645yqJsFIB9sgO7V7Q+0zes4csNc2zAxvGo=;
 b=LeJ/duz4m1w/dHNl/KEN0QkTM6k1bIykT0tihEKRAxKHARqaF4KHGwGA
 2ktrWFx8TocvxWC02tJJiZ4I/5xFiOFvMThm2yTCRSDKh4VH721iKwWiD
 5YpNlGrJC9RblLaC+YNxa6ueD4nZntxLHrW/+2AS4FuMZeCvpY585Z8mR
 +Bg69Gekvr/vzDCP34e2KEUSU/6Z3cmw8X8fzOrKpjCgV/Wa6ENPSliBh
 E8q9XstX21y848SF238AYboLUq48g/rCGK3eB/kOSXNfUGJ/9BhfjiMIm
 kd9EHDZ/vhDwde/W0YaIxTeXv3swhCvEV8r4pku/haMagOMtmX+/8fD2u A==;
X-CSE-ConnectionGUID: WP3c38BySpOlTPzZUDpbGg==
X-CSE-MsgGUID: UdMvptVHSsaexiOEwj12sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="109244"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="109244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:49:18 -0700
X-CSE-ConnectionGUID: JTmEB85lR8uPBUmLCuSwtw==
X-CSE-MsgGUID: OP0SbJylTtSsAXzPMb2jnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="441275"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 02:49:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:49:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 02:49:17 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 02:49:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvDsfakhtekFhF8Nkiddo3qv6Hz6a5MJCKUOtyMRhnDdLqII9PfpNloJ4W4gtD99eE3WEChGrTRnhwDbqzqLWBLLmyAl0KQZdcfTIAQ6ReZUPiP6k6BleoADRS0J2MENuO1pjJO9x1eWmLT62zwqf4p2JAMzrNakGglauSV/FK7sXFNeO4uf7f2pFHt1RzgqGOaXTeKJ/pm2I+GRmsa735GCOkM8WRdC2iCA82jF8hOuCp4jcb0fSZz0LdbuBpSkYZsY3r1Vv8DPwR7y31JBeH8JAjctjEmxzrdScnlFj/NuDe62KAhOVtdqJEPI7F40fQGXiq+NFJ+7iHL4LTFuSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TffQfGS9645yqJsFIB9sgO7V7Q+0zes4csNc2zAxvGo=;
 b=lvznKgz2B0YfsNdLgjsW6Y4Lx8kZSK97o+6sqV2lIlbp7w7nGdoKfs+H2+ZgDGiX4ojkALiKoIIxetOCHfpjuf2lIrO6dByaW3ygfrBpJpmkMiNDkip3sGiFPfUCSzMm08aa/Cr1V2gq/vCYBySa7nVI3QhpvRcCkrSJWEicGUSlBGumPpbyM02S8qEOElVDydBF2SaF0RW22a++mKNwVDZY881R+4qbZGEBb7oFtlhb+X20fVwisrrKDWnro8JiVUHzD10WAIHP1Xi3sIPgWyndQ1Y0y/nCE2sOWH8Lqkfw5YrSAqfjIWQe1YtalKOuenipbe6ZVKygv80TkwlFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 09:49:15 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 09:49:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 8 Oct 2026 11:49:12 +0200
Message-ID: <DLZD2KTHN15F.1SBQCVRXI4WFG@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/i915/gmbus: Reorder the PNV clock gating GPIO w/a
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20261007222314.5714-1-ville.syrjala@linux.intel.com>
 <20261007222314.5714-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20261007222314.5714-4-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: WA3PEPF00000526.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::67a) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a0e1d2-c7b9-4364-0abb-08df25216a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OI+E7mJpFClkLtOktKaaC5nqK+AA7DEBFVyD//Ery5vknGMnkjASGpdjfKkd1JsCKoy3ymZgnLAS+VNvc6C1LsoC7upE6V/R4o8iyshET7tLQ3Nd7qjMK88v4a9tv9mHHSB/qcYzX4xvEEmoKNo3oS0ZdxEG8C17IByt5hQZBdrzQW1K/c5qZ4ssZiGdFABODbLRJwj3EChgsF/iu/n3MWRQsNibTH6laX3hY+scaahGAd4QgtlAf67CIIyf+1wsE4gJRW02jSox2yu70JavCOYsB9Cr9l1dNFQtotMyg89FuqOOh6S80bJF8+cC/mkcKjiFLYG615ef/QqSn1SrgvyYYmvtJ0hbitlFrFxQeExR2EC/dXGqbS5BZzJXjUDJ05guu+wn12ZzX97YXJb77wydbW6xw4dwhgvVQnbaHEGS7jk6V2b5qSfmKUz36gN/d1tVz0CJ1n/QFR1OUwMNjhN9cSV0txCTn3WIMLa2cTouar3hBUR3AIkyynfH047orr7RXCHm4yfyADogDKYdrJ8i7f+BEjbRGQyNrcRPLPZAapdifvD4VftgckmFFiFdEVdyUi9sh2U4DCJy8IgeaExPz8wVfllPz8jC1BjU++8F+IvHkA2HVnJltbfu4T9LgcyQQ3toA1n3Vxn+QjKl/by+zvPaNAOVNfFCuq6udos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE5SUkc1YlZDd3FOTStPYTFXN1JsMzdFbUhNVkRFVDZKckZEc2tKTjZXVFhu?=
 =?utf-8?B?L1lXQ3pENzhZcmdEd0loSDhZY2hvNS9nQnJDUEgyN0NOTVk3NmIvL1BMZmtp?=
 =?utf-8?B?SUxmb2UvTjBJWUdtekI5RlVnQVgzSURqclBZK2xQSnpqZEtaUHErRzFQYVJo?=
 =?utf-8?B?Z0VPUEtmdml0NEliYVNubDJ2ai9WMCtVcXZWVy80dGJTOUlBbTBOTkRFbDRN?=
 =?utf-8?B?Yzh6aHpXMFg5YmxMK0lxUVNFWHNrcU5jb1YrK0ExSXp2Tm1WKzNZSjBUYzQv?=
 =?utf-8?B?WlFNSklEcUcxNXp4alQ4Z0cvakQrdDFNQStxU2JLVlNLQ3c1NEFSc0wxbHV2?=
 =?utf-8?B?VnVTRFNzaGlPRG10OElIZFhlcEl3TXRhSjJ5UGtHRGtHN0VqMENkblEvMjdv?=
 =?utf-8?B?cFFYWmMrdndnN21oRHRZL2c2cXN5VkFhRnVaRkdWSllDallxcTM0NnBFcSsr?=
 =?utf-8?B?UlZYQmJnOUlMTEpHOG90VVVxenVHTzNIOEpmY0IzK0ZuSUJGT04rQ3RlbEJx?=
 =?utf-8?B?ODBHbGkxOENVOFZwNVVlTmdzYmprVUMyUU5uZ1k2Y1hqRlNjVVg1YWNEQThC?=
 =?utf-8?B?NFVrQVF6N3R0SUIvM3pXeHBaaE4wUWNMUnl0ellnM2lhak9uNDU2NXQ3Rzd5?=
 =?utf-8?B?Q241WVc4cjcxeTVwTDBsQk1uVHZvc0o2ZG1zUHloQ0M3eFlISUlpeEF5RWV2?=
 =?utf-8?B?YUx2QXVNV0hCV294eG85UEltazh5NnkyYitpSGFMT2VkZU5LdnhkcEdQQk5I?=
 =?utf-8?B?ZUtobXd0RXpyVXF3MUhTQlFrQXFja2x4Vm5jakU1UHF2bkFTWVRNU3hrdFVE?=
 =?utf-8?B?UTNVeFVrQXR0ZWs0RGE2TUJkQURaS21zT1pFTUVYTENtUjNwZ0tBVkx2Qlds?=
 =?utf-8?B?NFdtMWYzV3NpdUxYOTBwZ2t1cjBPZC9rTHNodVJjaVpvUXRyYTMvMmZsTFdM?=
 =?utf-8?B?VUhOZVNhMHFKSWxFWmRjeEI5SW9mR3M2ZFBBQ05pcVpDemNLMU8vVW43LzVV?=
 =?utf-8?B?WWw5c2JzVEZoK1Q4ZlVJWWhPYjlVOHNUdTB6NjZHZ1R6ZU5RYU5VejJldWZq?=
 =?utf-8?B?cHprb0NDSVpFcG9TY2RBaFFJRFl6dnZrTjlkMm1jS3VLL3pJaDZOYmpWZU5o?=
 =?utf-8?B?N3FjTk01YVlKUnFPdHNEREpjQ1dOa2U3VFRqVkh4OGIxai9BbEplMTBjQWFP?=
 =?utf-8?B?ajNFRy9KYTZpZkp0WE5iR21kUDFTY0NIQys2NkZQMXlEYk5wc0ZsOHhhdXAy?=
 =?utf-8?B?MDJtRitoeDMrT1ljQkZ3R1RtVzZnUUQxdk56b2ZkVzN6Z0c0VGVOMnRtdGY4?=
 =?utf-8?B?OHlmZG94U2F4MzJKa1pqYStKSDZpRjM5SytXQnV2MkVZaU4wSU1qSEtDb1hP?=
 =?utf-8?B?UitLQitRM3VZajhIVkxHUmpZWkVQMko0a1NPZGJCSWUvanBlZDZ0c3dqZU9S?=
 =?utf-8?B?WWR5UXlQckNPYjBBRFk0aGtWRUNyVG1GSy9mNUQxS3R4YTR1cW1nYmNqRTVv?=
 =?utf-8?B?MjZUYjQzYisyeXVKaFA3RVhCdFY5ME9UNjB1K2V5R2VoZEIzb3l5NlU3TC9i?=
 =?utf-8?B?UEhXcjgrWEFHc3Y4RmlZUXJHUFhnYUNsYXpXSmJaTjVVN3l2clNIZ3crZHdu?=
 =?utf-8?B?MzZyVUNWUmhiR1VuWExsNVF4QVJvQkFJOVpaTmt4WFJ5SndwY1JjVzN4b2ds?=
 =?utf-8?B?SFQwbEh2WXF4RnFrWjUxY3l3RGR0WHBXSTdZUUZlK3BkWHZFb1M0NnRIbGNz?=
 =?utf-8?B?bGczRFMyeDU0NVI0NFc1d3hkNVpWZ2J2WGovL0tCdDQ1WnpZb2hxZHNvMHRJ?=
 =?utf-8?B?ZGhPcmlneTczV3FlVlpONW00RjluYldlY2l3c2NkVWZtQ09rcmRCb2REbXlX?=
 =?utf-8?B?NytKN045UjdDNm1mNk96aEwvRTZhczBJNVVnQUI3T09VazZza3NJSFIrRm5C?=
 =?utf-8?B?N2wvRXR0ZjJFSENudkxoZXZYMWUxTnJ0OTBZSnhHdDZDLzEzTEE0Q29NdEFU?=
 =?utf-8?B?M1lvTlVOWFFVSG1jU2c5M1FMSlJQTDhMWWJsYVVrSzRvOHZQdVFLYmlMYzVz?=
 =?utf-8?B?TDVzNUkwcW5INTJzTU1jYitaUDNYME54N3dka0o5VDFQQm5rNCtsTkNHZUJu?=
 =?utf-8?B?TU5iWllsSGVkMjM2VUFSRHczYXF0R0lHUUdhUHY3dktjYnh3anJqTkRrRERB?=
 =?utf-8?B?UndGdVUyeHJpbnBjU3JZaW5Qb2Y2ODFwaWdJbnJ4eXUzKzJGeVpnYy8wN0xn?=
 =?utf-8?B?Y2ExMmJQRFpnOEdaQlRaSUEyT0ljeXlOdUhSNkFzZUE3blQvREpPd0ozcnZp?=
 =?utf-8?B?LytKRkZhSzh1OTFmM2Q4Q3BDSzJGWlhpZE4xZWdRR01xanNzWjFObWxoZUF6?=
 =?utf-8?Q?05Ge7USe3Irxquv8=3D?=
X-Exchange-RoutingPolicyChecked: 13BCUx70keu/z2XycRenSkOv7szoyB+ZJgsKzcR5yBwMs3YVr5OJCcGWkhdWt2ZIPiZ7FwQZh5JDWd3VZw69TIq251DK3Ol/0yZXope3WjfiDnB97YhAqfNo7/psBG6wwRKwgNPCoMInUzmVjapdCCPfNQhFn56P0dbC+HDgfP4O05rNIo8a3LSSVXwJQXWQcENndefR4if8hyYqNx35It5qqnmrji9Gk0OaYhVy1iBH8tWkecHm3SdwNRyT2Cm1IHSNcmglQNl2oZIQJumwz6gpuKEyJZmQ93wokNryYc6h6hvC8jzQLpGOmZNuTKN2oszooJwrOUc30LcfLBRZmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a0e1d2-c7b9-4364-0abb-08df25216a00
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:49:15.4668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //s6ltfyBLkzjeeGsO5Jl87gnLPtg5cCA23PCoG3dAxzveL7KuPlfC7LVY6ySSMvCDQ7F7uYM6KQARb7FRL4YLhY9UH65aLW7c0aNdFnHyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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

On Thu Oct 8, 2026 at 12:23 AM CEST, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Move the PNV bit banging clock gating toggle to be the
> outermost operation in the pre/post xfer hooks. We don't
> want the clock gating to kick in once we've touched something
> in the GPIO registers. Right now this doesn't really matter,
> but upcoming changes to the GPIO register mask handling will
> need this.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
--=20
Best regards,
Sebastian

