Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6423FC61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F9B10E392;
	Wed,  2 Sep 2026 16:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k/h0j3n/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD7E10E320;
 Wed,  2 Sep 2026 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788367460; x=1819903460;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E8agg7/BAaAep+uKhU10zISpZ9PjOIiJ5ttB+Z/YlbI=;
 b=k/h0j3n/Ai7Y7KDvLKjVvIklsDU1hN6eIaps9Qo3+omycL5nLHiyTujA
 eMNCVoxbrLZUk1W1JSnwTv7bRzHk6ZB2zz2Fo6frP1/LQmQ80yQXucoRf
 hionu0y+XrQsCm7ay2bnSEdZwHvQpfVENd94ZZyUB209D0gEQwciXOJYl
 gz7W7Odo39A48lp/t3cGFfjPvN9uJI6SNsKBpA8an7L9tbrjdWvU3kATW
 VJQjmSKFGUAOwe7FeU4/8l87Y7h0tshTEF3gdyH9K0iQKhMioCBjwfZaa
 e9d0MoTE0Vbohsm5phiL2Iecv30IT1b10kB/jn2IsW3BVaLdF6oqHrXSx Q==;
X-CSE-ConnectionGUID: sd3I5OYnTIKUyohlL3cKkg==
X-CSE-MsgGUID: Ye+qlTkARwKKNzHvjFPqqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="91344558"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="91344558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:44:20 -0700
X-CSE-ConnectionGUID: qR4qP4vYQ+K9v44NIXSu5w==
X-CSE-MsgGUID: 5BFDECfQTGOSzU98KEWDoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="268143114"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:44:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:44:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 09:44:19 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:44:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCnK4eGf1STgvUlGMwUD/sZIqOjzJq7LhKahfm7DcIkz4pzCAU4iNfSrosz4GI5WSQodOA2LgAwHc5Pjw3Kil7ivE8LlxpxFLqC+kq6eqPDlI0QNAnlz6GWVP62boUU770oHayuQsDdufrp30m7NNzIsvn3Hi56sshLAeNQ+Ht1YehhnqdSezGpbRI17QUQz1wjHg/WPSb/4va6gbKDHxoysJ5ZmeSm5DBGIyzKsjL1faMLXCS0t43y8tAftc2jLPEvwe4DPfVpi4Aj9iFBak3d2g4vmFNfzVu2OOSFQqK74bJLTHSam0QYpy8rKHRzbtmLCROpZven0VrxJFRrRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8Qu9RtaFQqM0KrS5Ya+XF0EIB5vBAel8Qmq+4vASNs=;
 b=uK6+jTET8z/Q0thDjuOHFs6/XOhra5fzqRZMDvV8tYvFmD43Qs/XzkI/KZon2U1sNcS0ojLhsJMA9hDLd9TrIxu8+70dTi7aynui4b12rAAMixdF109/QN6JX3g/lsFVQYYOmTzuAYmD7EUVRwyOJ5LzULkLKpy3dsfP77wRHXjwKPBQCM5OKIEJU3QAOcv51YvKPG2DQTc/Xd4KlNi2orNYDnjXxOKQYRgpipIgbAMN9m8D7xy2/wVxK7w1dmtl14rRIiN1cCitPOvMdYssyL9p91Z/FKow42fFWvR62H8matp/l+ulSmDsejneXaL6sqj/hR3M6MMxe283r6QPSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by DS4PR11MB081265.namprd11.prod.outlook.com (2603:10b6:8:507::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:44:17 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%4]) with mapi id 15.21.0360.006; Wed, 2 Sep 2026
 16:44:17 +0000
Message-ID: <2c3ee4d5-d7b8-45cb-9008-ea7201a2751f@intel.com>
Date: Wed, 2 Sep 2026 22:14:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 3/4] drm/i915/display: Reprogram AS SDP skip frames on
 seamless VRR transitions
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-4-uma.shankar@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260831213421.1804635-4-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::13) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|DS4PR11MB081265:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa1b6a9-c6e1-4ac2-89e6-08df09116d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|10067099003|11063799006|4143699003|5023799004|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 9doslw5NpwFsrpC9JjkWMkY/kGGf2xnoJ99hp96K50YK7TA5VTwpNrV228Ss8QtswA1u1FvB6yLRq5DCamQTsFHp0BfA9HS/S8wtP+BnEzCh1ouD2fJHjCNE/55Z7WhaxEAj6Lw6RV/f3dn5p28AFLmEr1xEI8eNyRmLxmaCqZDs2Yh992oYO1u12/3uYZk5RC/WO0ee4dtXJOqLLfQYiVzyLUAgjPBKez9KBMFi0cze4boE8BiKgvUg8TKlsQiIZ8ELhLWr05FrakDJgmti7t4LY59lnCMXm8keGb+u9dWeFr2IccSkH2E1Ch55Qp/sQdIZGUygerpe2zknMa27WnvC4Klj3g2yVDvSSWHjn5HQEEKQpTM1mU+z2Mv6ULDH6Fy/Nu8ceUKDLSNLQ6a6aWmpm+5laOiUL3w34v+t2Sx6bNX9YIROdq5jPT7PfiUnWNxbjgdcyZEyjYPgnbZ4JakKRoiS2+ucDzPs68l0ubyFoaJdUtDMwaIB7Jiu5iPHVzcpEwMwhQtq2PYp2+q7s34cd2DXVdT4W2Ic4DjaoxX2LbiTbD8fPDVGbgWwmzQV5w1Vs4wpr2q7IiYM+XhGO1FewyYaflV0bt4GwcaBr/EEqo9CPFUmEEHm+jaxeAI56WiqccnSxA5LhsjS6B4V+hJlAoOyPW0LlZLsYlrtO60=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(5023799004)(22082099003)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cElLUk1lSUFkYjRuUEZoRW8xV2sya1JuR2dTUW1mMi8vN2RRb2JVeFk3OVZi?=
 =?utf-8?B?RGo1KzVIQ0VTN1RvcmVzQXNRTnY4MFo4Sy95RE9IRGZhTU4zcHpBdkJrMVBq?=
 =?utf-8?B?SVNMZXg4TFk0cUNEV09rZXN5aVozbXFwZlp0bk90RXY0cmozd3E3WDBUanlI?=
 =?utf-8?B?RW03eFRKR2JiTm84UG41VFcxaytWNml0QVdvM0hVWklXa3BPaTl0YUZkUVd4?=
 =?utf-8?B?a3h1NmpEdkw2MjFKa2tiNU9QQlc4S3BKTTl1L3A4cmQvVmd4RkdLWmNFMVhj?=
 =?utf-8?B?dzNZR3dNZExkekUvTytER3AyYkY4TC9pcy9hZUx0QzYvblhWY2FxSFRJOE56?=
 =?utf-8?B?SkQrb1hRU1hBZHlKaGR4L3MyUWx3clBRemp3dEpydWNSaWRiTGpMc3JUMk9x?=
 =?utf-8?B?UFY0SHdHeG80Z0w3ZGE4dUlGbEgrZTB1YkRhbHl6R3kxV05kUTJVRWhvYlBJ?=
 =?utf-8?B?WlppTjZ6Zi9DVkJsc1FhOXF5MmIvWVNSczc2OXlZa004SkpPUHNtUk9leTg5?=
 =?utf-8?B?MEtvd0FzclQxMHdmdFpKaW9CeGo0ckQrWGxFNjJsdVliMGZIWDlaN3luYkpJ?=
 =?utf-8?B?NkI3NC81Ui8vLzcza1ZmQUhaSElGa1l2SExkVTFSL1RhWERWeE9IbWVqdDRj?=
 =?utf-8?B?ci9WeWNOMXR5QVhONXZvNldyaDlQL3pWcTJKOVloRFp0cU5lTXV1eGppd0Jj?=
 =?utf-8?B?SUJiVmE3eTAvNDlySXpqRDYrV2s5Y0piM3JlZDd6SHd4elpGZG95alR2QVV2?=
 =?utf-8?B?Q1pSK251Q1ppOXFMODJvL1FzaGpmUU8wM016ZWZtOWJPU0JObGNkLzdBY1Ix?=
 =?utf-8?B?WUgyYmtYTmozaTlQMmZBUDRHOHhlSnExR2diWnl3QzZoZnhOeEo3cU53MHJ5?=
 =?utf-8?B?WWxVcFhIeW5VSTkrT1ZZdG9sN0t4TVZrUm95L0U5cnhzdDNMMTU3c3NRWlY2?=
 =?utf-8?B?bi9TMnN4VTUrWlJET29mYXlZaWtLSDZaZFFTY0RGVWxTRkZJK2hiUE9lcDha?=
 =?utf-8?B?bXlSTzR6anBqWVowS3ZlMFpLcGZ1N0ZJdWdCMVhwYXJnVEp6QWVRSXpqVnRF?=
 =?utf-8?B?a3EwTHRvZ3o2WG1IT3hmTytZQmJYM2VRWFA4b0ZyY0Ryc2h6bHh0QmxPU05u?=
 =?utf-8?B?ZWVEczAxTXNZbDE1NlBGWGtVTTZkcy8yYzNVRVQxcElMdlFhTi9JUUxkVmpP?=
 =?utf-8?B?TTR1YjA5VjRjb2JCWTB2RVA1VldwRHVZUHBON2FuM1RRMSsxUkd5TDZLZ085?=
 =?utf-8?B?MUYzZjJ0dUdnY0RpaUkrd2VFdzYzc1A4Ym9NckRNVTczMGdRQWY3NVdxSjYw?=
 =?utf-8?B?bEwraGFDc294Q2FuM0REU2pEc0hLZDhmb3M5cmYwa3FETW9jcUxja0xWVWhT?=
 =?utf-8?B?L3RvMVpmNnZma3RNTmhxVGxXcWVybkV3YTBTZDNXcER6aGlaRVduNUV3QkU2?=
 =?utf-8?B?dzFwUElsV3hsd2Y0Nk1yeTJIaDJ6OVJoWnR1bjg1NDM2NkV5elJXL3FHd1U3?=
 =?utf-8?B?dTlSUWRxbzZpNGtrV3RXOTdoNGZoZzhSWFJWR2hUQ01yQ2t5QksxaHdpdWJN?=
 =?utf-8?B?Sncwa1ZCbjlBb1BmUHUrRUppbWFoa0M1RHdWays3TC80emN6MkhQcEdTMXUv?=
 =?utf-8?B?WUkxWHlDM284c3RraUcwWVNLcEhNb2E2NlkzSloyN3g3NzRWdDcrb1lIUTRu?=
 =?utf-8?B?Z1RnK3dobXoxSUhTTTUrUGp2U3NHcUtQekNiTG5MRHhTVGhpUzloOUdveDFN?=
 =?utf-8?B?R1ljaisyRDM4NmdFV3pYVmVCTXhQV0VhMXNvSytWSGlWUk53Mm5sd3JxSWhJ?=
 =?utf-8?B?SGFpVCtvTGE4Y2lLZGw4U2tzaStXWHJnL0l5cVZqMDRINVovTVk2NDNUZFZD?=
 =?utf-8?B?bHduZGlpMGFEUVBFZERDMUJ2a2RGUVExM1pJbGh1V1cxTnVyeFg0UVBtZTU4?=
 =?utf-8?B?QWs5eVBzYnFKd2VZcSt1bVV4UzBYeksyU1Z6SmdQT2NLN0ZFdng5eVlJdlpU?=
 =?utf-8?B?SmpiWUdMMktKZjV5MnFzSmZJb3ZqbUlnTXpZcGFwY3JFck5CVnZCa3JYMVJ2?=
 =?utf-8?B?cFFyQWNjTlM1Z0hXS0ovWXVDamdwbDQ1V3FTK2tHNjI0bjJPdlB1aDlrVHdK?=
 =?utf-8?B?N1loQkhMMHltR21SenlRcHRESVZSRi9DMVVrbzBsdkpMVVI4UzFxdUR4TWgz?=
 =?utf-8?B?dHRCTkFsRzE3RzZwSlRycEdqK3NURlJxZy9PdVRzSUFjMkpGbk9XWndCaXk3?=
 =?utf-8?B?cWdQbFo4cXI3RDR0UVhyZnE3bWpVUHZwRDA3dW1PTDNXbmt6U3NOVWZwSTRK?=
 =?utf-8?B?RVBBNTVxVXd0MDNXeTJSaHlEbnZFQkV4M3ZvdkVyWHBML3ZldUI2MWIzRXhx?=
 =?utf-8?Q?IA+MMy3iEuaEEGWgQ7VMbWlq123DgQcQgqog5?=
X-Exchange-RoutingPolicyChecked: GchA6n8qloLKSLeCPbSi7ZRDS3a3U+mDXiP+89q6KK5IGqWUiJp+xFhfwTzVrod0ZIIt4t0yOCl2IJQwLqmNdsd8QoHUzCsEoqu7wXTyd5h8Jb0WsnrhH8OIfK1Ft4sooVdu9UddqIH//jwLufHsPtGkr+aW7olm5682Py095k1Kh+4ncL4+terIqn6I6UGja6T00yehR0U1WiuIB2MBir2C4pCkSFQgAHOw+KkHddN1vrXhKpgvaX28/JjDAH5gQJpxDvmmK6wMlebWSnNnhOtkApSa14JuRXRJtTkbBHBToBAMl3L7TKQ0Df8CwGkRgNS/OLeeZ1kGsxoRA9DeUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa1b6a9-c6e1-4ac2-89e6-08df09116d6b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:44:16.6364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfwwRvtHDfBP8N11+qA8kEjKh3yeQEu3MLWwLvCPlO8BYD1yVHeAwSBp5iYTPqdHGxPCaUsBRXRHO71JRqAc5etYE6RlVxb+TeRt/jg7lbypov/rOhChZ2b0RwcBakda
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB081265
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

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> The AS SDP skip-frame count is written to PR_ALPM_CTL only from
> lnl_alpm_configure(), which runs from intel_psr_enable_locked() on a
> Panel Replay disabled->enabled transition. VRR, however, can be enabled
> and disabled seamlessly - without a modeset and without cycling Panel
> Replay (intel_crtc_vrr_enabling()/disabling() in the pipe update path).
>
> As a result, when a panel comes up with VRR off the non-zero skip count
> is programmed, and when VRR is later turned on seamlessly PR stays
> enabled, lnl_alpm_configure() is not re-invoked, and the stale skip
> count is left in the register. This also leaves the coupled AS SDP
> transmission / DC3CO idle-protocol bits inconsistent with the DC3co
> state, which is recomputed on every commit.
>
> Factor the PR_ALPM_CTL AS SDP programming out of lnl_alpm_configure()
> into intel_alpm_configure_pr_as_sdp() and expose
> intel_alpm_pr_as_sdp_update(), which recomputes those fields for the
> current VRR state. Call it from the seamless VRR enable and disable
> sites (non-modeset only; a modeset re-runs PR enable anyway) so the skip
> counter always matches whether VRR is actively driving the refresh rate.
>
> v2: Fixed Sashiko review comments
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c    | 119 +++++++++++++------
>   drivers/gpu/drm/i915/display/intel_alpm.h    |   1 +
>   drivers/gpu/drm/i915/display/intel_display.c |  18 +++
>   3 files changed, 100 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 0a33a89975bc..c784e77f610b 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -427,6 +427,85 @@ bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
>   	return intel_pr_as_sdp_skip_frames(intel_dp) > 0;
>   }
>   
> +/*
> + * Program the AS SDP portion of PR_ALPM_CTL: the transmission position, the
> + * skip-frame counter and the coupled AS SDP transmission / DC3CO idle-protocol
> + * bits. This is a full recompute of those fields (the base value is built from
> + * scratch, not read back), so it can be called both at PR enable time and when
> + * VRR is toggled seamlessly - which changes whether periodic AS SDP is used.
> + *
> + * Caller must hold intel_dp->alpm.lock.
> + */
> +static void intel_alpm_configure_pr_as_sdp(struct intel_dp *intel_dp,
> +					   const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +	u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> +	u32 skip_frames = 0;
> +
> +	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
> +		skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
> +
> +	if (crtc_state->link_off_after_as_sdp_when_pr_active)
> +		pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> +
> +	/*
> +	 * Skip frames needs the AS SDP to keep flowing during PR active, so it
> +	 * is mutually exclusive with disabling AS SDP transmission in active and
> +	 * with the DC3CO idle protocol.
> +	 */
> +	if (skip_frames) {
> +		pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +	} else {
> +		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> +
> +		if (crtc_state->disable_as_sdp_when_pr_active)
> +			pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +
> +		if (intel_display_power_dc3co_allowed(display))
> +			pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> +	}
> +
> +	intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder), pr_alpm_ctl);
> +}
> +
> +/*
> + * VRR can be enabled or disabled seamlessly, i.e. without a modeset and without
> + * cycling Panel Replay, so the AS SDP skip-frame programming done at PR enable
> + * time would otherwise go stale across a VRR toggle. Reprogram it here so the
> + * skip counter (and the coupled bits) matches the new VRR state.
> + */
> +void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_encoder *encoder;
> +
> +	/* AS SDP skip frames field only exists on Xe3p_LPD+ */
> +	if (DISPLAY_VER(display) < 35)
> +		return;
> +
> +	for_each_intel_encoder_mask(display->drm, encoder,
> +				    crtc_state->uapi.encoder_mask) {
> +		struct intel_dp *intel_dp;
> +
> +		if (!intel_encoder_is_dp(encoder))
> +			continue;
> +
> +		intel_dp = enc_to_intel_dp(encoder);
> +
> +		if (!intel_dp->as_sdp_supported ||
> +		    !intel_alpm_is_alpm_aux_less(intel_dp, crtc_state))
> +			continue;
> +
> +		mutex_lock(&intel_dp->alpm.lock);
> +		intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
> +		mutex_unlock(&intel_dp->alpm.lock);
> +	}
> +}
> +
>   static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			       const struct intel_crtc_state *crtc_state)
>   {
> @@ -449,44 +528,8 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
>   			ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);
>   
> -		if (intel_dp->as_sdp_supported) {
> -			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
> -			u32 skip_frames = 0;
> -
> -			/*
> -			 * AS SDP skip frames field only exists on Xe3p_LPD+, and
> -			 * periodic AS SDP is a Panel Replay feature that is only
> -			 * used when VRR is not actively driving the refresh rate.
> -			 */
> -			if (DISPLAY_VER(display) >= 35 && crtc_state->has_panel_replay &&
> -			    !crtc_state->vrr.enable)
> -				skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
> -
> -			if (crtc_state->link_off_after_as_sdp_when_pr_active)
> -				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
> -
> -			/*
> -			 * Skip frames needs the AS SDP to keep flowing during PR
> -			 * active, so it is mutually exclusive with disabling AS SDP
> -			 * transmission in active and with the DC3CO idle protocol.
> -			 */
> -			if (skip_frames) {
> -				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			} else {
> -				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> -
> -				if (crtc_state->disable_as_sdp_when_pr_active)
> -					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> -
> -				if (intel_display_power_dc3co_allowed(display))
> -					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
> -			}
> -
> -			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
> -				       pr_alpm_ctl);
> -		}
> +		if (intel_dp->as_sdp_supported)
> +			intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
>   
>   	} else {
>   		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index 328920027f1c..f8f605d94f96 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -36,6 +36,7 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
>   				 const struct intel_crtc_state *crtc_state);
>   bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
>   					      const struct intel_crtc_state *crtc_state);
> +void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
>   void intel_alpm_disable(struct intel_dp *intel_dp);
>   bool intel_alpm_get_error(struct intel_dp *intel_dp);
>   void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index fc30a455bed3..9151ea6c15ab 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1232,6 +1232,14 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
>   		intel_vrr_disable(old_crtc_state);
>   		intel_vrr_dcb_reset(old_crtc_state, crtc);
>   		intel_crtc_update_active_timings(old_crtc_state, false);
> +
> +		/*
> +		 * VRR is being disabled seamlessly (no modeset, Panel Replay
> +		 * stays enabled), so re-apply the AS SDP skip-frame programming
> +		 * for the new (VRR off) state.
> +		 */
> +		if (!intel_crtc_needs_modeset(new_crtc_state))
> +			intel_alpm_pr_as_sdp_update(new_crtc_state);
>   	}
>   
>   	if (audio_disabling(old_crtc_state, new_crtc_state))
> @@ -6971,6 +6979,16 @@ static void intel_update_crtc(struct intel_atomic_state *state,
>   		intel_crtc_update_active_timings(new_crtc_state,
>   						 new_crtc_state->vrr.enable);
>   
> +	/*
> +	 * VRR is being enabled seamlessly (no modeset, Panel Replay stays
> +	 * enabled), so re-apply the AS SDP skip-frame programming for the new
> +	 * (VRR on) state. Done here, outside the vblank-evasion critical section
> +	 * (which runs with interrupts disabled), because it takes alpm.lock.
> +	 */
> +	if (intel_crtc_vrr_enabling(state, crtc) &&
> +	    !intel_crtc_needs_modeset(new_crtc_state))
> +		intel_alpm_pr_as_sdp_update(new_crtc_state);
> +
>   	if (new_crtc_state->vrr.dc_balance.enable)
>   		intel_vrr_dcb_increment_flip_count(new_crtc_state, crtc);
>   

LGTM.
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

