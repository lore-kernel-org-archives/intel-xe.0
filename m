Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036D7D3943A
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 15:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77310E3E0;
	Thu,  2 Apr 2026 15:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp/ihh9n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D9F10E3E0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775143382; x=1806679382;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7uQa/hUE9ofzjLIdAC0iMs6jK2CC4VgqjZMtOBa9AIo=;
 b=Pp/ihh9nuvqYeKWq4Jdf2o1zQOB02pr4vW5HLVEfRvwk6c2nkG/boEdq
 RsZ7J0pYEeKNTSdqrRFs8DsN7DUA/HKBuYWhJVQz0+liwUT8olN9bqcom
 eU2gi+1Xe423iAYuriItBViaj+KN8KIg9+x8uowy1UIq5jyz0NqyYXLn7
 yMeqAzmXQxRzRzyGf6aex/X5tVpxX4C5wtcrvpW2qIhWSVMq5fggOxocr
 74UMnIKhRPelOz2lD2qFp+usLiTGMaxSLNzRfcE8A8/8UyltnyvQpc/vB
 B4lUpAS36nlJnJWwcmKOVYESluonzJyFrAqUZ1wxRNpr3uQ9dPM56eQbW Q==;
X-CSE-ConnectionGUID: aw6SXOpzQB6DDc4T7Em7Dg==
X-CSE-MsgGUID: o8ADCvU4TFWhbfAiR6DcUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76393788"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76393788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:23:02 -0700
X-CSE-ConnectionGUID: pnsIKQMvTq6/DddXqGJyWw==
X-CSE-MsgGUID: iSj5J4+XS0iOipCVLY95+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="223729346"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 08:23:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:23:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 08:23:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 08:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxvDKCJI+m/dW9aJOi/Gj5VCvI76Dgg6Wz24mm6tPOSr0oIi/X8ZeYPtNATwd0QJqLNF7s3L8KCtl7F7eYNQ/ezgNJa119rLSwBC9sWGWB+hO/kc3w4GmrSO2pzKnSpTcCHUlj3oamAY8RcYGRx/St2lODnaNfq2671YDkdVSWI2B+xHQf+h85NthiIErU9VCJiOvEvVaYu3ccqjcQl9q1odecPEwi1aX4OjYrTYnkrk65hbEx+c2epTHlD/qnL29AZjWHV7bYRwkRM5JKsLfIZcbKYTsjX52yJM1qjHwaHBSDOkfX8Y6lV4NUljSl6hfQFn8MxqF0En+6i6Fyl6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B72iqQbFKPErVl2dBZN9Vr327XWIWbtUcl3kdfwhWDg=;
 b=Kzi/NM424kRJKYHbx1WtcZZaBW+L44MmRaacMPXcxZbrKxfgnEEfT+8nlmcKzN2SyT1uYkTcFKvvhgz+zSardnLS2iYuUF+NjLSjfg6hcfQHr4EXT9aLWrkF/DTZCKA5EEgcc3klJPAvAuxv/DSF4Dl33ZLepaKPS16dBQ0oY4vew3bK6ddP9WwmcbnwkQdO00gZtzpVImRyeCR1BAqQDJfKsQndz7vkLOCrkec3j5Fb8TImjWjrj4KYQBj6ywwkp3lYo0aamBN78iMjLiuAfO94yRaHwZ61u4sHytggm+/9wRogWKNusE76nx7AsMhc92wEBw+UjkUUacfewMuX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 15:22:56 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 15:22:56 +0000
Date: Thu, 2 Apr 2026 17:22:52 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/13] drm/xe/pf: Reprovision scheduling to default when
 no VFs
Message-ID: <20260402152252.mpmp3vfcvqiqnfn2@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
 <20260330204046.567-11-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330204046.567-11-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR07CA0240.eurprd07.prod.outlook.com
 (2603:10a6:802:58::43) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: ba96d280-b2a3-4c38-3afa-08de90cbb73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 24KNQtTqmTvqLh2SBeJGSwSjV22hqusRBWHspTlrFp/fqZfDMSGTtCof62KL4o8Xar9Yy0juERucti5EQYbKs/T0syHfFXrXK9/ZyexzFG4Q0IiRttuPJTqLEo0ekySd1G15tfWAReS5oXUBdTp/gbcS2POzDm3FYvaoSmICtrWM1feW9wCf8AmF5gaec7NqcTYo1EliodX3sFVSptI3PPHzmGPtj1eYvNXy/SRNvAOKASrYjbPnHvsLrYpf3LKFn/yp0npKyjuG1XEFemAZrkI6obaCoErUTcydm1SiOdof5VV1R3w8it6PeeCNTHWCiuhFgxZQqGDOhuOFaUqATpfp1vYvcc885SJkur08sfyc8KcXJZM3hoatp3Mdh+OtVvOWelyN/xLovWYNSRzJ3QWvMbhFcgWch799vTa0RYsAwT6VJ3sUl9JGGw4MUAnZrHSAS3vfRa1Zln2G6I12ezsqXSp97f0ERmfXiQH7Vppgsq8iZnABjzEQxr76uRGOci0XDXaQTavXBCR5rBwMzsJPZZwEG6RxwCx1i+pDnOQa+Sk+BBJNcjBuemFn3ZBdU6F+rREV0e+K1qTCa7DdRRXJRrWyYBvB+DdO+UpE+2EJ8Ys4Vk1NspbFvNwSfYRMS/HqVJcTPLVh51nmUpHJnockDgriaSLBoAbKvlcI0VJXrnzDDRXRIoePSx9FolLhMV2OUE2cQ9e/WODRGmQaGqPSs4QprWm/n1ZAX2SdQ54=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGY1cnJJMmh1V1poVkNtdXdiMkIyRThvM2g1QU85cVZ2Y2NwcnlDdmRNVyt5?=
 =?utf-8?B?NTgrOC9wTkVwZjlSdnN1MHV6WW5NamNOVk1EQlBUQ0VqWGR0Kzg1WFBHUHZD?=
 =?utf-8?B?Q2VDeGg2QnJBKzNyUHUxclBHRGV4R2JOa2hKUERrcnZsKzRMdXNSOWFzem5X?=
 =?utf-8?B?eUdPSWRGVDhGamcxSnFGMXNqSkZ0K0RyWDY5ZWNUSHJpNXJDclI1eWdhUjlm?=
 =?utf-8?B?RWgzOCtXNzQwSVpsOXhDbDJGQm9jR1grb3NBUDNRM2NMclZhdmg5QWdJc3Ax?=
 =?utf-8?B?YkViOStrdDFzYjBLTW4zRk8zZmJ4Q1REYm9pSy9mb09mZFRBd0VnRW0vU3RM?=
 =?utf-8?B?RE9vWE1CNDhUSDFKblZjK3JZV3VFdzBtNlFkMDM4M1pVSUtmTk1jZFd4U3Fs?=
 =?utf-8?B?dXNGL00rQUhOWVNTUmxEcWhiRGxmNkpreldWeUFvSno4bElPdDljYjRUeHpu?=
 =?utf-8?B?YTVrb0ExU0MrUjk2ZzJ1QXJtM2o4UXlUcUZHNEpWRmhqcDdwdHJIUUtDREJZ?=
 =?utf-8?B?VmNFajNCTks2c1ViQUlhSVdBMG1KaDFNOWp1WG10anVDeW9CajVxSzdreERL?=
 =?utf-8?B?THNWcllCNEhrT2FudmlNMGljUXNESms4QnYrb2gzTFpuKysxUVVzSDJ1NHRV?=
 =?utf-8?B?V1JmaWRrRUpjMUVldVFUaU5CWDNVcnp1M3lvdEx4Rk5ES3NKVUZGdlZVUWR1?=
 =?utf-8?B?RGI4dGNVb25MVUhyQVA2dHNuZTI1NDh2blo4T21ObWZ1Q1krRWtRYlJHNDc2?=
 =?utf-8?B?UE1EaER6RGp2ZU80SWZYVTkxUWV3WFlpWjUvNGdWTFRXQWNsSTltQUpCd1Jv?=
 =?utf-8?B?UUhrMjJ0d3d5SWVjbUE3MWkvTHZrZVlTaEl0MlhVY0Mva0RPYmtVVDZVSVJM?=
 =?utf-8?B?NCtpVWlYWk5pWm5YQTBtUEIyeTlsWitGblRQcEhTVmtQMkNrVkZhWEYxemxK?=
 =?utf-8?B?VHdrY1pUekovNFkxS041c0JqL2lmRTMxcGpGWFpsdE4vUWppN1QyM1MrWWIx?=
 =?utf-8?B?eGZhdVhLaW5WS2JEVVE2dkhkNU1WRkcvVGxob3pGbEozRWVyZDl6WjlKYlZr?=
 =?utf-8?B?SEI0b2hpZTdKQXdJcUNMaHZTUE5iUjlXaWQrdVY3ZFBBWU1Ec01EckVkeEJo?=
 =?utf-8?B?RWwyVk9JaHl6RjE1WGRFMHUrRlp2Vmo1Qm9vWXMwSE5YSk9JU08wb21vR2ph?=
 =?utf-8?B?WlN5bmRDQUdhakFjYks2aTEzWHhuZVY1cmNMSTEyMmMvQ1B5RUpveUpBY2Yx?=
 =?utf-8?B?eXNxZWJiUHZpVm01U0E0UWFqUzFxblI3SjNBZ1Nydis5bGZpdGRqcGNXWmVv?=
 =?utf-8?B?YUhXcG5LbytFT2hTcTNpSWlCSVVLWncyMzJxL05TeTZZWXVVNGNUM2hvbWVh?=
 =?utf-8?B?eW40ZDE0aGY1ZVA5SzYrdjg1UTFQMHRqRDZHdVlvd1UzNVlrdFcvQXNIZXJN?=
 =?utf-8?B?blhYMDcvVTEvWmRncTNiOFd5ejMyd0FBZ0FBNStWV3Y0OENxZDY1QnZrYjBS?=
 =?utf-8?B?ajZVVkpnTVJidnd4YS9QSUFCVU9FbGdYVzU2cnpyako0TkVNQ00xY3U0QXB4?=
 =?utf-8?B?OU11ZnVrVXJhN1haOWhBcFZjSlV1M0NHbHIwOERFZGo3RmlCS3pUaTNUVzl5?=
 =?utf-8?B?S1lOMmFvRWtqN0xrVC9sTXNNd0FLQy83MHlwVWE2cng5ZU1IbzN2bUJwWGxU?=
 =?utf-8?B?Y1NlRmVpQmxKT3JyWWg5Y3ZKRHF0T1lEdHlndkdCTnp3K29WTE5BallwNDcx?=
 =?utf-8?B?NDZYbHQxQlhLTWhZQlFOL3Z0UDl0S1IrMUgwcUJ5dktPT1BIblRjc0JzcE9w?=
 =?utf-8?B?clZXaDhTT1JGV0hhWm5QOTVNSlBjb0I3Slh4bWR6elZkL0M2aElrcXNlMUIz?=
 =?utf-8?B?SzArZkp4dzRmd1Q4ZHdzSEI0OXBQNXhtaW9WMnVaNHN4VFQxU3VESHJkUTlR?=
 =?utf-8?B?WEVpdDNWU3dGcmcwcC9JNlFuUmdtRzVwRFBhbmlvUVZHNnlDcTJrR2tQU0ZH?=
 =?utf-8?B?TzJVTW9zQmxMWkRrVEtSakVzWm1rVkpGZmxBeUtuMlBIME9jS3pRZXM4WGU4?=
 =?utf-8?B?QXlwZ3ZoMkFNS0R3SmxtRmVCb09JYW1xendxMDdFbnBhR2RKUTFEUm95dlhm?=
 =?utf-8?B?UXVyMnZpNmxLOHBqdWJRUGtKeEdTeWd2YzcvWWZmZHhoS2dSUG9iNUp0clIv?=
 =?utf-8?B?QnQrY0xrYnpFVE1VeVgrMExTMjNyNGRNUG1BeE5oU3ZyV2kvYmRUZDZyZ1ZW?=
 =?utf-8?B?bUJqNW1zR0tDMkVhMSt1WEo1b1RXb1Bma09UcDQ0VHE1aTYyUVVwbmpVQWxF?=
 =?utf-8?B?UTNrVWV4WmpBVUVXblFHTUpVYlAyaVhWQVM3L0ZqMnZDaFFweUxBUTE3b3JN?=
 =?utf-8?Q?EgQeu9BYZqhr75CY=3D?=
X-Exchange-RoutingPolicyChecked: Pd8ulnEVh8kSujdMwS6VDg/EwoODEcLQZRYmLhQQcKjj3cK7IuKaEkm9tK1l8zKuRf3oYoQNYx9wOgRlyZdD1dMMD1o/vJ5RV/BOuzfjMFgqcrKzBctvq+h9nztLCdl43Kc6QVNUcXa+2NUPC6PcwtwLTU80opPahtB9hbzF2gzS3iuZe7bz789KD9wCptSZ0wW1hU0lCPB2ygV85AeDhcHvAyxvJJr/m3AhBwzDyoMkzS3mE1l3fj0tIrd7qtitH6sAwWxYjlC4Hrr8e/lGHJlUZwzyEeusA7LwL2De9itznt1rxzgEBvzkLdbLZ+/srt+XDxWMERpE09DXOK2tYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba96d280-b2a3-4c38-3afa-08de90cbb73b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 15:22:56.1507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHBA19jGUd/iAZuecpIHcols8Ly6SqQg7JA0jBHqeEgv+VHnqFWqk0x/nxpGb/VuCc95UBYz9k145M8NbK4mo5MLx+0pNhVLtoNXM11tO7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pon [2026-mar-30 22:40:41 +0200]:
> Once we have disabled VFs there is no point in keeping potentially
> limited PF scheduling provisioning as we want to complete a cleanup
> of the VFs resources and return to the pure native mode, the same
> as before VFs were enabled, as soon as possible.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_sriov.c          |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 39 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h |  1 +
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 3fd22034f03e..35e6b53e18ce 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -191,6 +191,8 @@ static int pf_disable_vfs(struct xe_device *xe)
>  
>  	pci_disable_sriov(pdev);
>  
> +	xe_sriov_pf_reprovision_default(xe);
> +
>  	pf_reset_vfs(xe, num_vfs);
>  
>  	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index abe3677d33ed..e11874d689fa 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -103,6 +103,45 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  	return 0;
>  }
>  
> +static int pf_reprovision_default(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_policy_set_sched_if_idle_locked(gt, false);
> +		result = result ?: err;
> +		err = xe_gt_sriov_pf_config_set_exec_quantum_locked(gt, PFID, 0);
> +		result = result ?: err;
> +		err = xe_gt_sriov_pf_config_set_preempt_timeout_locked(gt, PFID, 0);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_reprovision_default() - Reprovision default PF in auto-mode.
> + * @xe: the PF &xe_device
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_reprovision_default(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	if (!pf_auto_provisioning_mode(xe))
> +		return 0;
> +
> +	return pf_reprovision_default(xe);
> +}
> +
>  /**
>   * xe_sriov_pf_provision_set_mode() - Change VFs provision mode.
>   * @xe: the PF &xe_device
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> index f26f49539697..b15e4d7ad940 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> @@ -30,6 +30,7 @@ int xe_sriov_pf_provision_query_vf_vram(struct xe_device *xe, unsigned int vfid,
>  
>  int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
> +int xe_sriov_pf_reprovision_default(struct xe_device *xe);
>  
>  int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provisioning_mode mode);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.47.1
> 

-- 
