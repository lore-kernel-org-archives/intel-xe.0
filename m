Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D48D6AB1F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Apr 2026 00:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F1610E051;
	Fri,  3 Apr 2026 00:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtbxNWbW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A57210E051
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Apr 2026 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775174969; x=1806710969;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rN9wCHpnTDVSvAfmHv8ij+lMQg8MlJIR+wrpCpgstVw=;
 b=GtbxNWbWIwPvb1Aje5Za+sTq5GyErD+Ux7Ee6VipzHCQV9yON9qHZ1/U
 gJxIksQblqL3BdGUGh6DUXV/v8TWtOvNPluwy5RRDodmLTroIDVAjaask
 haRfcyObTPXpA034jLoNxTMFfS1SuXFmtCOaIhFvXAIfdDf7T5yRULGzW
 HVlBgPRjCgU+hgZ3/QQ12T0NkRQQ+jxq0tdd6wcvYadC4fFKC/mI1HWKY
 XpW1BamWYeXVHWzIc/CoMKIO70uHTrr/kUvg3ALpPjFHWA8kEgqewcoua
 VJ5DycosOAQnDXqhiB6BGjbZOo4mfLZeisO+Lh2T3rtZlMTZjgsAMwlti g==;
X-CSE-ConnectionGUID: xBC8eIJCQhKwb/KBAvPdAA==
X-CSE-MsgGUID: uLPBJW3PR5+8PgujPVfTJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87635167"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="87635167"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 17:09:29 -0700
X-CSE-ConnectionGUID: CaD+tvc/SyCkbJN6cuOr0Q==
X-CSE-MsgGUID: tHeU3p4MSBC29Jz10L3vEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="257589698"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 17:09:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 17:09:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 17:09:27 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 17:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVuyop7AnfcGKRNptgbEED++J9oAEpfAs8PwOQ/ir9bknCNNhItl6fz7Y4dBGsKBTNJyAC+w/L2UwzV0cbBstQy/WXAUqmLo5oCIDNjmp2mlPOyo/oHRhyQQusl4KiAyZOfU7/MkZsCDOScOL+S55sYr/6hV8b+u1rcTJ2J0DaoCDfhyM9sLrf0unU7iWtrgbO1h3Xso+1ZL5bjHZXHKubrsEG1hzDCGu/53fAs2pE/QfSWIJvm+/+P2K7BLMANtjwCaUylBRIA8vEKseoVq9jY9elQy29TOP6m+ykyQuv2fB4He5bhufb5nFmZUSEMnFRgC5H9me2WU0yCw7VAsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTtu4WBQKU6rXqJD78jAIIFgWlzlFGr5THtItXpaCmY=;
 b=Z9kRYDha41AtlYTSsJaYJ3FAjr8scEi8ZzQCuyaSu0QZB/ToiRZLVE9tuEd+bdZl0jJ3nBw15CzxK+uvdFBc9D23I6SPekTLcruJIL4LAUMQnF3Now0qiygHkri8d4YPWnogrBvwFiQgxjyCTP85gluqP3O/k3Pwd9stB6qTkfDSri3lud7ZXfo2VdKbTnFbHkO1mIp5Gp+DTW8hxcv143inW77zuKc1sro3m202vORYsid89+GrGeT1B60Fe56c3fFAX0XxgDh5Mye5VStSrXXh/S1IeDAzFHhhE3Xd2P1SPcqwmZhdtOPaE+DANZZfTfYSh9fZYmL6yGNlATRUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BL1PR11MB5239.namprd11.prod.outlook.com (2603:10b6:208:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 00:09:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 00:09:19 +0000
Date: Thu, 2 Apr 2026 17:09:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [RFC 15/15] drm/xe/pt: Set NC PTE bit for VMAs ineligible for
 access counting
Message-ID: <ac8FLPOAuXInmaEY@gsse-cloud1.jf.intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
 <20260318074456.2839499-16-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318074456.2839499-16-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::30) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BL1PR11MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: c333482c-0aa7-4b93-bbe5-08de91154036
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 52egTDSevYe5fU1QZxvlePEUQGRb60Ksw5tgz8F7pojfkTMHGiQ/3m4cT2Riq0FHVCXpwYwpfsgUJGrGA6eVYPbtk1eYTdc5Siv0GzR8ItnNthlip3DMOhDmcNd4iHOA4kleQzJiC2YDQFC2bQQMAYA7mUSu7w/6rrYV4bY5zIC2w7yQi+qMDOWay1mDOoUKRDJkHEAmtp+IkfJRLSmxNAnfmvvL9kXmv/qq0kp13hvDBzZlDQlcgF31VS1SK9lAdBx/9av2/qk1yvJOaPPES7tCjJWtAwLxLdJt7zd7EBcJNVeH0UKnfbQ+bg/x3ULu8kpDkIrlwe9P/oJYAMzwW7agqZcCf9QffwLFi6GmvmO+13HZGbnCneZ7IID/4nHaoi9kjZoGLoygDLO+mKOxebg5RQpjSSSR+bvUM4EsBiXkERIxTEVPc1N7wFHUHc3ho3kGNjxFfCyxRuztCDHw2+37D+IDTVJvrnapuWf6yL9/ro4AnynKfz7NOUDt9uEGt00wrPZqZ1VYZSYHrOExekeLrJHqqvPnMLMenchCRHEEVHZS/gJ+jGkhqhHlsUvoZX8Z3WqeDFiYQoV1ZkmHgKy52xiku2aVwpyuGgVj4eV+GMHRJkoXebqPjTHyE97uh3TFg8u21n4LOJ5eSqTfETbOM9vvHMGC1RwBRupEZ4iaKMByRnJde0beizyqczJ6u9SiE/7iybHAai4CO0y2KguD4VPe/OwH8PQMsSYGgbI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFhjZHBvYUhFUk9vbUJncm5KSUtmRjNKbE5OU3dUZHJUSE9QUHkyRjhrUWpv?=
 =?utf-8?B?eldpNkh2WFpiejZ4Z25kSFhPWXpYdVBjb1o0ZWRDUVljUnJDYVFHSGt2UkNU?=
 =?utf-8?B?Y2xPZHU5V3JSb1NpTWVWdEV3VVlLRDRrY1VIWTZPSW81QXRqQ1VpZFp4ZVJQ?=
 =?utf-8?B?dE9wQS95dk0rV3d6MDF0d2JWOVNpNzhCU1dhU1cwSWV1WFYrbUJZVkZteEkr?=
 =?utf-8?B?aGlsOFc2YUdQVWE2NUgydzJBMXAxcEtlSmFtNCtTME41cFZheVRGOU9FM3Qy?=
 =?utf-8?B?OUNoU0JNVmVNUHFzQlhYOTJTQW9ZMk5SWDlabHYyRXlKZll5dWllYnFad0p6?=
 =?utf-8?B?cndhMU5rc0xQQXVUY3U1THhRNjRyc3JoWWEycnN3RXBDekx6ekRNNGNRZnc0?=
 =?utf-8?B?OUdQaThhWnJqUE0xSFBDalllcGY5QkpMY0VxQU1XTmdaYjlpQkFUYWcvV0h2?=
 =?utf-8?B?YjUwdXZuMithUWhlRW5PeUc0Qk5MQ3p4WVd5N2RxRDBhOEdoUXZqYUx0YzZu?=
 =?utf-8?B?c25IVythNzJXRUxmK29CZ1pkOEpXL3hXN08vMEZ4SEF2K3dLc2gvMS9aaHQy?=
 =?utf-8?B?amhNRnV4R3hmR0txanhtejZ0YXhlYnpwMHQwNHhhaWhvS3lDekd6MzEzeDBs?=
 =?utf-8?B?S0htdFh1RGttcUlRcGRhYlpaTzhMOHkwKzAvTFV2T3RIMDdycWI2UlVsQXFD?=
 =?utf-8?B?L20zcXE0cFpQOGFLNldYdUJLRVpGUW9aTkVvRVdlSHY5R0dzWEZ1VC9zK1N0?=
 =?utf-8?B?bG13aFZaUTR6UW9BWVQ1V213TGE4dXljZ2lGZ2tpVjRLRlZlblh4QmdKUnZr?=
 =?utf-8?B?Q3VEeitpa2dFRUp0amZqWjJ0bnNwRkNhRytWRmNTL1ZSRVRlK0c5UitZcnBn?=
 =?utf-8?B?Wm9MRkI0dFoybHJDcTJTVGQ4Z3J5NjdrSmxDOEthdTNiZW0xYlZ4YVRsL1JX?=
 =?utf-8?B?ME84dHJLVkIzR0hPSDF2czlaTjFGK1huVG5PbEpoQm5EeVRDY3IvdXMwQjZn?=
 =?utf-8?B?aE11cFJZREN1cllubTcyNUNOTUJTMkxoSWtOZ2hwa0Q2SFZZV2pDQlp6T2Zs?=
 =?utf-8?B?M2J3bU1BQnlWaVFGVzJzdWFQNVRlMDRUMmhUbzR2Z1A5ekxRaHE1UTYzYVJL?=
 =?utf-8?B?elJjaC9oYk1DWHFnV1RsUmdWVXhWR1ZKQnNPUi9NdjBFUDlNL0dxZzJDSHdK?=
 =?utf-8?B?M1RPdjdMekl4Q1BHd296d25RY0lvUTQ5TmdCVzlxUkIzeSs2cnpMclZXbHpv?=
 =?utf-8?B?TUM2YWZJNEFiTFJlTlFsRVVoWHpKOTVDSjRxMHdHc1BJRWYrT2pFLzVLUWFM?=
 =?utf-8?B?L1Rod3JxTW5KT0FzSDBtN0J4UFI3ajNyM25ORXFhWEFESDVabyt0Um93RjJn?=
 =?utf-8?B?MzNlT29qLzEvbGxwRzBpNmZHVno0bngvNkk1NUlsMVUwcXNKNDd6YklZbmtx?=
 =?utf-8?B?WUV6MHR2c3ZiU21PZVFMZVhITnJJcHVMeGI3azNWd3hva3N3aENiZzhiTmRk?=
 =?utf-8?B?SDFQeTR1MnMrL2UwK0FtRnZTSm9PQWVIQ3Y4SHBhRmZ0WTI4dnQyOVJuaFlZ?=
 =?utf-8?B?RVJjL3QvR0xqRmQzajRTbDZWcEkvZGRFdTdZQ3hmRmw3VkRYTzQxaW11Vml1?=
 =?utf-8?B?emhvY2hxNHZENzY1d1dHUlhySGl4Y0JaQUh2Y05KUkFtMFp0MWF6MWdrRlhr?=
 =?utf-8?B?cTYxWmlhMWxEa0swdUEzbEpGVVROanFVaktMNnpzYVBCVDFDMStxZG1kY2Ns?=
 =?utf-8?B?V2o1aHVGNDRRUk9NRVRWVzAveTVpeFhocTJxRHZzQ1lXSFkzSFEyb0dwa2VZ?=
 =?utf-8?B?enFuc0dSVEFJVFg0dHgzVFV5K1hrY0NWMEhNTHpvdUlNOEJKcGZ5cnBnWVNa?=
 =?utf-8?B?ZitTRDU3MFBMQWNvTEptY3V4UXJ1bklEak1USFlGdVEzV0I4RUZlRFQvWExE?=
 =?utf-8?B?bXJ6cDRCREZjYkFTYkllL01qeEpqZHpvR09WcFFwM2hjeWM4SjcvUFlMa1g0?=
 =?utf-8?B?cURqdXgxbEFtWnJqZzQyQXBodGFQa1NlVFQ1VHJPeUcvL3ByNisvOXhLSjA0?=
 =?utf-8?B?Z05rbUc1TzdqMC9rRWVOQ0lpYkxGTzBiRnVnVzhWWWdvajFicmdrMTZnN1FS?=
 =?utf-8?B?cUpuQ3U4S05GZnRTRlRMVHYxS3BVZXVLaEVxZ2MvdnZmb2JoQTdKUUFmc1pr?=
 =?utf-8?B?MEpSNVIzZ2VkQ2lObHk0b3YrMkd5UFpOMGpwWk1YOWthbk1CWUNqV1NoeFlH?=
 =?utf-8?B?N2RvSnB2MWxGVVpDYjJsUmZCeUx5cHVRczVRYTlNQmlBb0RKL1hnTUJDU2l1?=
 =?utf-8?B?cXA3NE1ieUFra0ZzZGlEUTJRaStsdWszcUluUmpNc2RvRllSSjc1QzJub1dC?=
 =?utf-8?Q?U22y360onm2TxBGA=3D?=
X-Exchange-RoutingPolicyChecked: mepESzVwEaRz9Tbia9yf0bNJJ1rh5ks5AfXgeQm7eqRFnXA/pEspwDmsZZt5qbJXgQU0UgFfAvptph6vFIVZxK/DYiJpKJwRdBBFCDw2Et3UkfZeDtAdnJGto+9qjrzZJZBWVtM+dNX/bEwETlvD7RPIN1VNt6lcSydBKMGs/7Txs1ol0VSTUATnApi6pQKbDfFFsQacJP+9Qos3E6ssx7XAQxaUejrNpInoC9pMFx0wHYlv0nE/DqUoXTGfxxOd7AqFpNKix959ILnwAfYVsbIGSL0jXJqgtX3355mYQtCLc2MD5xBcm8VjCQHHq2sPmXlH1puOYqVkQT/FQimEXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c333482c-0aa7-4b93-bbe5-08de91154036
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 00:09:19.3646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65eTrd7QrJtMAXr0Ur5ERyPlvI7eTUnZunMYjH8jDSvXdbPhsVcM+flD5kOhgV3kSV6bUGJ99QJitoxhZTmzvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5239
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

On Wed, Mar 18, 2026 at 01:14:56PM +0530, Himal Prasad Ghimiray wrote:
> Set XE_PPGTT_PTE_NC on PTEs for VMAs that can't benefit from access
> counter migration hints, avoiding wasteful slot allocation.
> 
> Bspec: 67095
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  2 +-
>  drivers/gpu/drm/xe/xe_pt.c            | 11 +++++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> index 4d83461e538b..ace3cbcc13d8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> @@ -28,11 +28,11 @@
>  #define XE_GGTT_PTE_DM			BIT_ULL(1)
>  #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
>  #define XE_PPGTT_PTE_DM			BIT_ULL(11)
> +#define XE_PPGTT_PTE_NC			BIT_ULL(5)
>  #define XE_PDE_64K			BIT_ULL(6)
>  #define XE_PTE_PS64			BIT_ULL(8)
>  #define XE_PTE_NULL			BIT_ULL(9)
>  
>  #define XE_PAGE_PRESENT			BIT_ULL(0)
>  #define XE_PAGE_RW			BIT_ULL(1)
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 2d9ce2c4cb4f..cc8dcdb6649a 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -755,6 +755,17 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  			XE_USM_PPGTT_PTE_AE : 0;
>  	}
>  
> +	if (!xe_vma_supports_access_ctr(xe, vma, tile)) {
> +		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
> +		xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
> +	}
> +
> +	if (range) {
> +		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
> +		if (!range->base.pages.flags.migrate_devmem)


This isn’t quite right for multi-GPU. We don’t have a madvise policy for
access counters yet—but we likely should define these semantics as part
of this series. My thinking is that if madvise sets a specific GPU as
the preferred location, other GPUs should clear the NC bit so they don’t
generate access-counter events, since the user has explicitly indicated
where the memory should live. In other words, we need a way to say “this
memory has a preferred location—disable access counters accordingly.”
pages.flags.migrate_devmem is not that. I think this point is fairly
straightforward to agree on.

Now, what should the policy be if no preferred location is set? I’d
suggest defaulting to first-touch placement, then migrating once an
access counter becomes hot.

Looking further ahead, we could implement a policy like “don’t migrate
on first device,” e.g., leave pages in system memory initially, and only
migrate them once access counters on a device become hot. NVIDIA does
something similar. This would likely be handled in a follow-on series
with new uAPI, but I think we should all agree on the first two points
above before going there.

Whatever we agree upon for SVM access counters polices, let's also be
sure update any relavent kernel doc.

Also, in general, let’s avoid touching GPUSVM internals in Xe. If we do
need to, we should at minimum add an xe_svm.h helper layer that we can
eventually move into GPUSVM.

Lastly, default_vram_pte is correct for now. However, once we land UAL,
default_vram_pte will also be used for ranges located on a remote
device. It might make sense to add a helper for setting
xe_walk.default_vram_pte that blindly sets XE_PPGTT_PTE_NC, with a
comment explaining the UAL use case so we don’t forget to update this
later.

Matt

> +			xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
> +	}
> +
>  	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
>  	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
>  	if (!range)
> -- 
> 2.34.1
> 
