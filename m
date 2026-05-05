Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17870CD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 19:39:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFF510E48B;
	Tue,  5 May 2026 19:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BE03cT3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7EE10E48B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778009959; x=1809545959;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=FGG36ibrkYto+vcWZYw2yPWoJ66e4Y8nZ6CYtHX4anc=;
 b=BE03cT3olBEgCjnVVKePaze+UvY62uMeA8W15Ys8BSYelgSxPe0YwW0x
 1+DwTsP+jqi92gEtO4flgGRrxA5KsDucYqQ2idsBLqbIaWATTFYunaggb
 uU2c2jkg+XgLubze5OcjU95ktTx1AXaLQq21jdkInCxtn+nmOYiYF4l4H
 Jnw6LWLevtBxQAQVSzXJLAsK4vW5Pbm/+TXNYboXBHH95Zuk854I9A3Sm
 RYi4fyydI9ZHp4sRX6FftPr0cM9mHg3keUj+nGAcldP3WjmfAxTaAzTkd
 qf+LAUIPVBziNTpIfsBOqhFkapfNCud2WiquTvMl/4IV4z8+Yf25JWTP+ g==;
X-CSE-ConnectionGUID: gieh5g9CSGmo8/+D2hQOHQ==
X-CSE-MsgGUID: FVxAlMHrTX2OKo+kT3ZMTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78604572"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78604572"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:39:19 -0700
X-CSE-ConnectionGUID: tJHvPcV1RqGu1ejScmMsIg==
X-CSE-MsgGUID: hUqfjWHsQr+rVTmCAPrabg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235771691"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 12:39:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:39:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 12:39:17 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 12:39:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dz5PZHpjTbj1vWFRHIdZjD20pa+GcAemVeDCqxc4ARxqUQcJAuaudKfsSEA6/vPN8EwbnfrZcxD45rpjf89lymf1NWnjr84zQbcoEOSafzeaKkAXvNmSmW9BbaCWM0aU8jfRyvOy6xp+MM6eSymNsAl4oCOI+qHIZ4nACW5JszMoLgGksExMxoDLixnS6cS2hhxeCtPqP0lKs+tuKv/6i419cSRtJLWhZbWob8b31iAdxsfwbrw3axa90aXVWX99xBto7Q0GR4lBRTWCnalxt0gSTBgH2hvkK2fDxPniiGIWfuEjy36pYu4tL+io/ffyU/wRVsCuzwt5ZNTOd7KfSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHj5QU1OVn+L+k3Sz9ul7F49D8VGTfSOaPuY8RauA+M=;
 b=iUWPgVOPSnqOtfqosoffwKhzE3ZaordoDGkO+fzuQMwG7Ks0ozOJTVZYV8g8KCVj+crY3303hOkcep03FN8H2BH239s3hph3dqePsTxbvpsgg2fInCDETU/ER4eAUe43H23VyKTV3oV331NSoAiIRrnwy4G7cqSkGKMjxwi6feNstIiA5FPZM0RXFQkkdaKGt+D8VsK2z7Tb+YpJTjQye3PrOFTe2RaIQJjMtClJDtBdSDX0bK5Aej5E/5MywH8HWMwHHTuZO1lxv31l3Y0zZqL3cTKvB5GgdT6Spmt9t8GmB0G/nEu2K2ehUljRjsuHugtTcLXkEW0oPecyBzW/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB8088.namprd11.prod.outlook.com (2603:10b6:610:184::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 5 May
 2026 19:39:14 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:39:14 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 12/12] drm/xe/reg_sr: Do sanity check for MCR vs non-MCR
In-Reply-To: <20260128235940.GW458797@mdroper-desk1.amr.corp.intel.com>
References: <20260116-rtp-mcr-check-v1-0-d420b9c1a327@intel.com>
 <20260116-rtp-mcr-check-v1-12-d420b9c1a327@intel.com>
 <20260128235940.GW458797@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 5 May 2026 16:39:10 -0300
Message-ID: <87ik91y7c1.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR11CA0098.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::39) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9122b3-364f-45c2-a0b1-08deaaddfcda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: es+c4BamtK+JCcmL31sHBWEJ15KWr1bIonhL/mPABqdS/iNkxiOuIFTLbrhnhWWO78Fxq63NLTZ4sfEKgnWpvUlRn1ofzHeuCRi48HUHbAHwDGqXwlNd9DNDEk8xfheL+ry0D4XbzpAWSruNhcmW7qrjCKtyqTlVpcczsY1Tfzh7/dsd6I0jHD/IVIQxHjnLNGNYYp6IJGyFZoTXbr8hBV7z8rlYyCeIghbucIcSAiyLcfAtEwRzynoTQXWfbntPfhwU24Jk1HYoXw04frcBxVu7asTWBSxY30xY4+eGEx6z8u7QbSOCOLr8zpw1bz4M1fkgAj4Ke7LW4nMiN1w3wiku9DjlgSQmGg0loh7SlFoGSuT6bOFJzvY7d746yAYJbFOPoWdKylcO9j71PvOWW3qWsOSHKNpaZNB2hz4bN/q8qNUAyxbNyRjNiCNdKdtsMSPA43u5fwJpsj3AGr23iwlYd7FB5kw9o1ukf7/se14rkxziB2akHZZJGKHBOP0w1hqI3DTY4aH3alrWcU5GI8kj8FD8ib0rq+PiDv6AutEvuajoOMxq1cKRmsb8Sqe7KkO4zi8TeCvB1PsQd7TCeY3V92Oe6ACDqcLxHp0/bP14kGHhWy8W93jX9zPyiBnmJErk9kJ+2MotJYGNg6szKeTS3BW6sbVWEe4KZ0Hhz4Yb9vdwyuxF3AZzXVfUwNvW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGxmb25TOG15VW9mRW5XMWlBTFRLRGpwM2NFUmszVlFLWjVyOFJFUmdpSDFQ?=
 =?utf-8?B?dExPTHJmMW5sZEtWeFlCaE5Idk1nZ2FEaGJ0UXZybHNHcHU5aVJnYnYvanhu?=
 =?utf-8?B?Vlp6aTNjdXJmL2VMdmk0WGlwOEFGd2VxR2JMZTg1aFpsODlUYWU0T0ZiS3lR?=
 =?utf-8?B?dWtRdThwL2ZGVVFaelU1cktLeE1TcFdHU3pqbnJReFNINlZTSDE1UG04alc0?=
 =?utf-8?B?NWxwU2I3anBYN3BvRVR0MWRKeUpMdGVJYmNTWVVaTjlvbTBDSlBRdUlaVWZk?=
 =?utf-8?B?OFo0RHFKTDRkZFYwUlNTclFwTmZtMW93czE1SFAreFhzaDVVTTI3SlRRQThs?=
 =?utf-8?B?VVRGTVVLWkFySCtlaURYangxUS8weGFqRVZrSHlBWXJKZE5lSUY5VUVrQnlv?=
 =?utf-8?B?R0hJdWgwNGgrUnlYT09FcmFLeXNvNHFjck9XKzFBVENYd2RzNmVlcTNqOUl3?=
 =?utf-8?B?UWN2SVoyc1RJZktRNDBRNkdJeERUN01pYXgvNUpaeGVNYVRYZVZ6TTBNaHMv?=
 =?utf-8?B?RGxtQUdocWVuRzVvaHFNUjF3VlNQbHVSRThmMGcxL3R0OS9LOGI1V2c1QmJS?=
 =?utf-8?B?bkp3VTAxSDltaUpHbmFvSWdBMHBjN01nQnE4cldjcVVlOG9heE9TckdrRWdw?=
 =?utf-8?B?RmFEdnl6ZXFqVGoySVlTMEpaRkd4Wkpic1FaY3RKekxldFVyQmY0WUdaRVRO?=
 =?utf-8?B?YjF1cC84Wkp0eUU2VFI2UUdqbWJHaHpKNjdtL2gyc3BqdGFlY0h6Vy83Z0ZN?=
 =?utf-8?B?d0FpMDFMRlcwa1ZpZjY5RkpXUnQ4UlE1RWozdkdEM0lsSzgrZk5OcWgrTy80?=
 =?utf-8?B?STR0YjlPSmlUWHlDYzBpc1NNTDhjOFBDMTA5WFNGOHlIbU1hclFZcWpCOHp5?=
 =?utf-8?B?bkhLZGFzcnN3UEM2OTFxK0YrZ29WT2JXaFRLd3pBN2RNWng5L0hsRDEvZk5x?=
 =?utf-8?B?TUl5S00rTWY2aEZEZnFrNmpVN3hoQTh6T3cwTXB4dVFzeXNlLzV6ME1Yd1ps?=
 =?utf-8?B?bTdSa1cyM1ptSTkwOHowK0p4YnU5a094cUpIMTlYNjdWelcwK1dtZzg5YWFX?=
 =?utf-8?B?dS9ObGVNdzlPL0k1OTZGaE41VEZQenVmU2ZuYnlvSkdmTkhEa2xvT3BZdm1S?=
 =?utf-8?B?NlJUanBSQkhUOHdCNzZQZzhpVTFSSlJXZUNDcWQrRU90WmQ2b012TGV3aVIv?=
 =?utf-8?B?NTRYRHFMVjdOUFNzSXQwamRXYXh2VFYvcHg1eE15K1d1NHJJdW5YRUJkTmdi?=
 =?utf-8?B?cjRaQjNENlVBVkVKUHR6NzBKdlplb1hKTGVTK25RdktQVU4rekFKUGpoeTJS?=
 =?utf-8?B?czVab0xGYzBxRjJES0tFNFlvbTlYVXNPcEhzWTB4OGthajBpMGNGQ1h3RGNt?=
 =?utf-8?B?OStkeUJWaWRtZ21UcmFXeVdldWRWMUFteXk0eFdvbURvV0Jva1RRMlNlU2Iw?=
 =?utf-8?B?dEx3NWxzb0h6bkZ5VVFPV1A5TGJ0cElFN2c3Z0M2TjdDRlVhUHZkS3ZSOFlm?=
 =?utf-8?B?czhmQytqTnF3WUxrM0RqZGNXUTlPejNGU0xTeDIxUnhCTWpaTTJobFhOZllz?=
 =?utf-8?B?bFRMU2NzdDFsU1Z1SkxhK2taczVSQjhKTlpGTEhObzhUQzdPNFBvOGFORlB0?=
 =?utf-8?B?bEFWOUFmVHFzRzgvMjBEQW5kYytOc3pKbU5DWUcrNWtRVlQyZHRoS1lJdVM2?=
 =?utf-8?B?Ry9lQTdQczdHN2p6QnhJVko4cmp0anRCcmRNcVVRM2dvcGQwVnBBVE9kVldm?=
 =?utf-8?B?b2dyS2tUVURISFd5V0RRK2tXcFExMUdlWWJkWnRFS0d2WjFpNVRzcGE3M2dw?=
 =?utf-8?B?TmFmN3FEQU5YdW9SWlg5MlFSazNzM2g4cTBsc3dZUks1WkppTzZnWHhuaEE5?=
 =?utf-8?B?Nm9tZ3JxYW8rdHhNY3Z1eWlJOUlZK2hjSlpOQUdkdmtsMkY2ekoxaDFSRzJT?=
 =?utf-8?B?dWRlc2IrbVQvQ3lqVzFnZUZwKytyNEh4V2VuUlRIMm52OHh5SS82bThYRnJn?=
 =?utf-8?B?YlVJamRHQ2pSL1EvU1V1QnJkak9ZTjBPNnRmakRBRDBreTlYV1pTUHhFcFN5?=
 =?utf-8?B?K3l0eHlZRC9JRTZQMy9YYjhvN3JNbElDR1V5L2M1WGl6akZ1R3daTWhlVkpF?=
 =?utf-8?B?MVpLSE11N01PNXUwa1RNTlRyWkFNckthS1p0WXFTMmxtdVNzbXNaekJtVWkx?=
 =?utf-8?B?NjczOUE1MjIweUk2Sms0Z1lIakpUZ3dzN2F2UmxVRjVDQzBqSjE0V0NKdy9M?=
 =?utf-8?B?K21EMDQ3VE1Yako5eXJZcVlrdElkS3RITXNQYytGWUpmcW05enUyVENhSDNu?=
 =?utf-8?B?YTJxaUdaL0dHNlZRZzZnaEQ5bEM0RHdwdzc3MDVMS3IxMTBsYjNlQT09?=
X-Exchange-RoutingPolicyChecked: NPbeppvL6HAsZh+F6iha9fnO8MDbsXH7si3eGPEqjZiAuNVV7cHwx63z7DrqZ+WEIpvEky+Xt3/NuPOXRPkg3MgzcJ0J2wpQFaGGnIXEryv3K/mObzgT36ERxI0geVYleKndIY5xeF135eIl6HTb36xO4Wu1GwBzbxzvDUVzDdt0CuUkhNw/wGGR9KtsB2i8pWfCDjcdDSxKWgPRFTv6TcM0ka+KrVvE9hNBjMjRSNijUwy7CHrauXTQrw5PrFajkZKJxr5HyTxUVlKrBqwEg6HSij9vDuNesuhp1by99iMvCtA2OWLlsTcWgaKTSdOf8NJY40I+dT1Gl3LW2nO1QQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9122b3-364f-45c2-a0b1-08deaaddfcda
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:39:14.1121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55ugeuFWAWuuAa4rTcxU6AEcZBjk9rhPx8/RAETeKi2OgqbDsXuEb0HuqdSKmnyQMgFztmh16t8+CdLRyBSpZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8088
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Fri, Jan 16, 2026 at 07:12:20PM -0300, Gustavo Sousa wrote:
>> The type struct xe_reg_mcr exists to ensure that the correct API is used
>> when handling MCR registers.  However, for in the register save/restore
>> functionality, the RTP processing always cast the register to a struct
>> xe_reg and then apply_one_mmio() selects the MMIO API based on the "mcr"
>> field of the register instance.
>>=20
>> This allows the developer to commit mistakes like passing a MCR register
>> for an RTP action for a platform where the respective register is not
>> MCR; and vice-versa.
>>=20
>> To capture such scenarios, do a sanity check in xe_reg_sr_add() and
>> raise warnings if inconsistencies are detected.
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 71 +++++++++++++++++++++++++++=
+++----
>>  drivers/gpu/drm/xe/tests/xe_wa_test.c  | 11 +++++-
>>  drivers/gpu/drm/xe/xe_gt_mcr.c         | 21 ++++++++++
>>  drivers/gpu/drm/xe/xe_gt_mcr.h         |  1 +
>>  drivers/gpu/drm/xe/xe_reg_sr.c         | 36 +++++++++++++++++
>>  5 files changed, 132 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe=
/tests/xe_rtp_test.c
>> index d2255a59e58f..80bd83f56d04 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -9,24 +9,30 @@
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_kunit_helpers.h>
>> =20
>> +#include <kunit/static_stub.h>
>>  #include <kunit/test.h>
>> =20
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_reg_defs.h"
>>  #include "xe_device.h"
>>  #include "xe_device_types.h"
>> +#include "xe_gt_mcr.h"
>>  #include "xe_kunit_helpers.h"
>>  #include "xe_pci_test.h"
>>  #include "xe_reg_sr.h"
>>  #include "xe_rtp.h"
>> =20
>> -#define REGULAR_REG1	XE_REG(1)
>> -#define REGULAR_REG2	XE_REG(2)
>> -#define REGULAR_REG3	XE_REG(3)
>> -#define MCR_REG1	XE_REG_MCR(1)
>> -#define MCR_REG2	XE_REG_MCR(2)
>> -#define MCR_REG3	XE_REG_MCR(3)
>> -#define MASKED_REG1	XE_REG(1, XE_REG_OPTION_MASKED)
>> +#define REGULAR_REG1		XE_REG(1)
>> +#define REGULAR_REG2		XE_REG(2)
>> +#define REGULAR_REG3		XE_REG(3)
>> +#define REGULAR_REG4		XE_REG(4)
>> +#define BAD_REGULAR_REG5	XE_REG(5)
>> +#define MCR_REG1		XE_REG_MCR(1)
>> +#define MCR_REG2		XE_REG_MCR(2)
>> +#define MCR_REG3		XE_REG_MCR(3)
>> +#define BAD_MCR_REG4		XE_REG_MCR(4)
>> +#define MCR_REG5		XE_REG_MCR(5)
>> +#define MASKED_REG1		XE_REG(1, XE_REG_OPTION_MASKED)
>> =20
>>  #undef XE_REG_MCR
>>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr =3D 1)
>> @@ -48,6 +54,23 @@ struct rtp_test_case {
>>  	const struct xe_rtp_entry *entries;
>>  };
>> =20
>> +static bool fake_xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg re=
g)
>> +{
>> +	/*
>> +	 * All supported platforms in this imaginary setup will always have RE=
G4
>> +	 * as a non-MCR register and REG5 as MCR, meaning that BAD_MCR_REG4 an=
d
>> +	 * BAD_REGULAR_REG5 represent programming errors to be captured by our
>> +	 * tests.
>> +	 */
>> +	if (reg.raw =3D=3D BAD_REGULAR_REG5.raw)
>> +		return true;
>> +
>> +	if (reg.raw =3D=3D BAD_MCR_REG4.raw)
>> +		return false;
>> +
>> +	return reg.mcr;
>> +}
>> +
>>  static bool match_yes(const struct xe_device *xe, const struct xe_gt *g=
t,
>>  		      const struct xe_hw_engine *hwe)
>>  {
>> @@ -304,6 +327,38 @@ static const struct rtp_to_sr_test_case rtp_to_sr_c=
ases[] =3D {
>>  			{}
>>  		},
>>  	},
>> +	{
>> +		.name =3D "bad-mcr-reg-forced-to-regular",
>> +		.expected_reg =3D REGULAR_REG4,
>> +		.expected_set_bits =3D REG_BIT(0),
>> +		.expected_clr_bits =3D REG_BIT(0),
>> +		.expected_active =3D BIT(0),
>> +		.expected_count_sr_entries =3D 1,
>> +		.expected_sr_errors =3D 1,
>> +		.entries =3D (const struct xe_rtp_entry_sr[]) {
>> +			{ XE_RTP_NAME("bad-mcr-regular-reg"),
>> +			  XE_RTP_RULES(FUNC(match_yes)),
>> +			  XE_RTP_ACTIONS(SET(BAD_MCR_REG4, REG_BIT(0)))
>> +			},
>> +			{}
>> +		},
>> +	},
>> +	{
>> +		.name =3D "bad-regular-reg-forced-to-mcr",
>> +		.expected_reg =3D MCR_REG5,
>> +		.expected_set_bits =3D REG_BIT(0),
>> +		.expected_clr_bits =3D REG_BIT(0),
>> +		.expected_active =3D BIT(0),
>> +		.expected_count_sr_entries =3D 1,
>> +		.expected_sr_errors =3D 1,
>> +		.entries =3D (const struct xe_rtp_entry_sr[]) {
>> +			{ XE_RTP_NAME("bad-regular-reg"),
>> +			  XE_RTP_RULES(FUNC(match_yes)),
>> +			  XE_RTP_ACTIONS(SET(BAD_REGULAR_REG5, REG_BIT(0)))
>> +			},
>> +			{}
>> +		},
>> +	},
>>  };
>> =20
>>  static void xe_rtp_process_to_sr_tests(struct kunit *test)
>> @@ -522,6 +577,8 @@ static int xe_rtp_test_init(struct kunit *test)
>>  	xe->drm.dev =3D dev;
>>  	test->priv =3D xe;
>> =20
>> +	kunit_activate_static_stub(test, xe_gt_mcr_check_reg, fake_xe_gt_mcr_c=
heck_reg);
>> +
>>  	return 0;
>>  }
>> =20
>> diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/=
tests/xe_wa_test.c
>> index 3311f05a6fc2..326278488cdb 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>> @@ -13,6 +13,7 @@
>>  #include "tests/xe_mmio_intercept.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>> +#include "xe_gt_mcr.h"
>>  #include "xe_hw_engine.h"
>>  #include "xe_kunit_helpers.h"
>>  #include "xe_pci_test.h"
>> @@ -38,8 +39,10 @@ static int xe_wa_test_init(struct kunit *test)
>>  {
>>  	const struct xe_pci_fake_data *param =3D test->param_value;
>>  	struct xe_pci_fake_data data =3D *param;
>> -	struct xe_device *xe;
>>  	struct device *dev;
>> +	struct xe_device *xe;
>> +	struct xe_gt *gt;
>> +	int id;
>>  	int ret;
>> =20
>>  	dev =3D drm_kunit_helper_alloc_device(test);
>> @@ -52,6 +55,12 @@ static int xe_wa_test_init(struct kunit *test)
>>  	ret =3D xe_pci_fake_device_init(xe);
>>  	KUNIT_ASSERT_EQ(test, ret, 0);
>> =20
>> +	/* Needed for sanitize_mcr(). */
>> +	for_each_gt(gt, xe, id) {
>> +		xe_gt_mcr_init_early(gt);
>> +		xe_gt_mmio_init(gt);
>> +	}
>> +
>>  	kunit_activate_static_stub(test,
>>  				   xe_mmio_intercept_read32,
>>  				   xe_wa_mmio_intercept_read32);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_m=
cr.c
>> index e7eb3c6da234..c6d9766b6cc6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -3,6 +3,8 @@
>>   * Copyright =C2=A9 2022 Intel Corporation
>>   */
>> =20
>> +#include <kunit/static_stub.h>
>> +
>>  #include "xe_gt_mcr.h"
>> =20
>>  #include "regs/xe_gt_regs.h"
>> @@ -623,6 +625,25 @@ static bool reg_in_steering_type_ranges(struct xe_g=
t *gt,
>>  	return false;
>>  }
>> =20
>> +/*
>> + * xe_gt_mcr_check_reg - check if a register is recognized by this GT a=
s MCR
>> + * @gt: GT structure
>> + * @reg: The register to check
>> + *
>> + * Returns true if the register offset falls within one of the MMIO ran=
ges
>> + * classified as MCR for the GT.
>> + */
>> +bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg)
>> +{
>> +	KUNIT_STATIC_STUB_REDIRECT(xe_gt_mcr_check_reg, gt, reg);
>> +
>> +	for (int type =3D 0; type <=3D IMPLICIT_STEERING; type++)
>> +		if (reg_in_steering_type_ranges(gt, reg, type))
>> +			return true;
>> +
>> +	return false;
>> +}
>> +
>>  /*
>>   * xe_gt_mcr_get_nonterminated_steering - find group/instance values th=
at
>>   *    will steer a register to a non-terminated instance
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_m=
cr.h
>> index 283a1c9770e2..d6b50b52b1d5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> @@ -26,6 +26,7 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct =
xe_reg_mcr mcr_reg,
>>  void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_=
reg,
>>  			       u32 value);
>> =20
>> +bool xe_gt_mcr_check_reg(struct xe_gt *gt, struct xe_reg reg);
>>  bool xe_gt_mcr_get_nonterminated_steering(struct xe_gt *gt,
>>  					  struct xe_reg_mcr reg_mcr,
>>  					  u8 *group, u8 *instance);
>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_=
sr.c
>> index d3e13ea33123..89d35301defa 100644
>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>> @@ -68,14 +68,49 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>>  #endif
>>  }
>> =20
>> +static struct xe_reg sanitize_mcr(struct xe_reg_sr *sr,
>> +				  const struct xe_reg_sr_entry *e,
>> +				  struct xe_gt *gt)
>> +{
>> +	struct xe_reg reg =3D e->reg;
>> +	bool is_mcr;
>> +
>> +	/*
>> +	 * We need the gt structure to check MCR ranges.
>> +	 */
>> +	if (!gt)
>> +		return reg;
>> +
>> +	is_mcr =3D xe_gt_mcr_check_reg(gt, reg);
>> +
>> +	if (is_mcr && !reg.mcr) {
>> +		reg.mcr =3D 1;
>> +		xe_gt_warn(gt, "xe_reg_sr_entry using non-MCR register for address 0x=
%x, forcing MCR\n",
>> +			   reg.addr);
>> +		reg_sr_inc_error(sr);
>> +	}
>> +
>> +	if (!is_mcr && reg.mcr) {
>> +		reg.mcr =3D 0;
>> +		xe_gt_warn(gt, "xe_reg_sr_entry using MCR register for address 0x%x, =
forcing non-MCR\n",
>> +			   reg.addr);
>> +		reg_sr_inc_error(sr);
>> +	}
>
> This sanity check (and fixup) is going to happen not only on the
> non-live kunit test, but also on true device probes on hardware, right?
> In this case, we might want to consider downgrading these messages to
> notice level rather than warn.  The kunit results should let us know if
> we have a problem here (even before we have real hardware CI setup), but
> if a mistake somehow sneaks by, having warn (or error) level messages
> printed in dmesg will cause CI to consider the entire device probe a
> failure and will prevent any further testing from running on the
> platform until it's fixed.  That seems unnecessarily harsh since a
> mistake here shouldn't really impact most of the other CI results we
> could be receiving.

Yep. I agree. I'll downgrade it to notice level on the next iteration of
this patch.

>
>
> Actually, related to the earlier patches in this series, I wonder if we
> truly need to mock up register accesses for non-live kunits.  It seems
> like we might still wind up with some FUNC() rules that incorrectly
> disqualify RTP entries that we want to check.  I'm thinking of oddball
> rules like xe_rtp_match_gt_has_discontiguous_dss_groups that either come
> from previous parts of driver initialization, and/or have somewhat
> non-obvious relationships to register values. It seems like for the
> purposes of checking MCR vs non-MCR status, the _only_ thing that
> matters is IP version:  IP version determines which MCR tables are used
> on the platform and IP version is the only RTP rule that actually
> matters to confirming that we're using proper register definitions.
> E.g., for an RTP entry with rules:
>
>    XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>                 GRAPHICS_STEP(B0, D0),
>                 FUNC(check_foo()),
>                 FUNC(check_bar()))
>    XE_RTP_ACTIONS(SET(CHKNREG, SOMEBIT)),
>
> we don't care what check_foo() and check_bar() are, or even what the
> stepping is.  Only the IP version rule is necessary to determine whether
> we should check CHKNREG's status against a specific IP version's MCR
> table and for the purposes of the kunit we can treat all other rules as
> 'true' without trying to process them.
>
> So maybe a simpler approach would be to have an alternative version of
> xe_rtp_process_to_sr() intended for use in non-live kunit tests that
> just ignores everything except the IP version rules and treats
> everything else as an automatic 'true.'

Makes sense.  Let me play around with that idea and see if I can send a
new version of this series with that solution.

--
Gustavo Sousa

>
>
> Matt
>
>> +
>> +	return reg;
>> +}
>> +
>>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>>  		  const struct xe_reg_sr_entry *e,
>>  		  struct xe_gt *gt)
>>  {
>>  	unsigned long idx =3D e->reg.addr;
>>  	struct xe_reg_sr_entry *pentry =3D xa_load(&sr->xa, idx);
>> +	struct xe_reg reg;
>>  	int ret;
>> =20
>> +	reg =3D sanitize_mcr(sr, e, gt);
>> +
>>  	if (pentry) {
>>  		if (!compatible_entries(pentry, e)) {
>>  			ret =3D -EINVAL;
>> @@ -96,6 +131,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>>  	}
>> =20
>>  	*pentry =3D *e;
>> +	pentry->reg =3D reg;
>>  	ret =3D xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
>>  	if (ret)
>>  		goto fail;
>>=20
>> --=20
>> 2.52.0
>>=20
>
> --=20
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
