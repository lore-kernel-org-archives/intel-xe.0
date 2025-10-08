Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E9ACAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 03:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC0210E743;
	Wed,  8 Oct 2025 03:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPwodlDS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E5810E743
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 03:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759894662; x=1791430662;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3GtuIycUBi7wD56dOeT0mk39vdrqV0nRT4zAkcrmVxw=;
 b=RPwodlDSGP7KlipukRM+1GRpXp0PigBePMjmln9FSg0zWmx7cq+HqofZ
 kRURYR+ZzFHlJ2sgLZXhIzkffGS3wKKrGKC6muYiefKIFyeXkzi52E1H4
 Dl63UgljmJ0gXnfaMbkMSbJcna/2p3/wokdu2PL1xBSmOT1mv5AtjrV1b
 dqH65wPj/cJ2uJCCUSi58rdnVwW8cJFjvfDceLaFP3ZSsF+VdKG1vFj4Z
 DxTIn9MjCthidr7n++Tl5T+Bwwl5OaDAMVapGcdzuK99pCxyCge+5EW+H
 G6V27CteCqJH5Z/WlURLZZbsKxQM4PjbQh05ULItbUy8w2d0zjJc8hkCg g==;
X-CSE-ConnectionGUID: eSpEnHe/SUu5+PoteV187g==
X-CSE-MsgGUID: LJUdTXGQRlC8uBBcbnYtsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65909114"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65909114"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 20:37:41 -0700
X-CSE-ConnectionGUID: fr/zFrqiS+mJxtMW9dCzPw==
X-CSE-MsgGUID: aFxzyXzgQUuzyPjF/VD2XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="179579606"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 20:37:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 20:37:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 20:37:40 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 20:37:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpLS4JLfb+hv3P6E9YMRr+nzCXeKfQ8cSBYwRvHp4Q+HTLG4AfunTh3xD292RJrqnOOs82SzwcTspKqxN8ai8apaEuWB6OI4YmAh6cy7Izc1ZTsoWVcPCU/PfrbGqIhcwClTUhYTTborbaz0avupzX0tXz1JSCaz0p1cQUuNSM6y/4Kqy4jfhEzFxf0275lDobI66FYE2ycyd2pLCfy2moLvSxLpgooEbRpk41KGa6uqA+tTlbpMUxYY+gy0DFiOTPiicUkfJ9pV91UivWXRvy9CHHj4CLg71SUUMIJ8atDnQL0TfAZwaoSa1ifkQQnvs6tDPE5mgaAGLCcubSMEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg8bYwMhTcuT0xoXvXecH4iCGwpwK7eCtV6K2eO2A68=;
 b=nlkp7X9yKeOZUpzfRYUsvt2oNFWEwbMGMz/LcUY3auDrCgPhVLN3WQ/upPDL/5PPgk/3xEiTiYkGd8sOMUgX8/HHgFMCXTB4uZPkZx2Hp9egGCfuJ7y81jIB2syiw2wpTbIl0qem7Ry7mxssNV588Sg5Hy5gh9tk+vblBDGRWdqSNdriCDl+LHepHpifMGmOFFalgcLJujop80COD+zfAe8r17TSoXnb9aO9miHV1pdvgfg/PgjMN8qux08gjl21HIp9tGVCgheJO1EcZqG8xkP55pgTIUET1ufBXr1/zU63H7FJ0P34tpF4PQRD8LbSjw7qhSVoBMNy/8H0C90Ytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6768.namprd11.prod.outlook.com (2603:10b6:a03:47f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 03:37:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 03:37:34 +0000
Date: Tue, 7 Oct 2025 22:37:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 22/23] drm/xe/configfs: Add attribute to disable GT
 types
Message-ID: <ibppcxcdcx3wxqxxccxun6kru6fr7mtnaddvxfbjzfaoxss65s@n7btsnxddgub>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-47-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007204829.1468209-47-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 3337ac9e-bebf-429b-dcfb-08de061c04b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlZ2cUFiNWpBZUk2L1NWQ2YxazhQSzRBMGdsMmwyeXM2MFpEMHp3Z216bCta?=
 =?utf-8?B?TDJFQmczWXg5OHpZa0tGK2xWVTlQMFRKUERQc3o1NDFaQW9IVTNNRytRRlAz?=
 =?utf-8?B?aUh5UlJDMmxCUnFCSmVCbHBjdzYzUmd4cFdraFgwSlRTT2Q3TnJBcWtHd1ND?=
 =?utf-8?B?TkNnbUhkTUVYc3dsS240VnYyTHFDTm9xOTJMZ1hQNks5ZnJOTWQyMko4NjFD?=
 =?utf-8?B?ZkovbkM1OFJnRFN2K2wzblJTd1dKdEJhTW9yL2VSL3M1a3AxRXU2MzdFcmdF?=
 =?utf-8?B?TkhRb2lQdzVPaDV6QkFVT1BMejkrdjhhU2Q0cGtJS1dLTUFJZEdUNURqR2pt?=
 =?utf-8?B?cFo3V3UzSDJYSUVNT1p1T1gxcGhlbllteEJ2ZFJtaE5BcG0rbWRTb25PZE1k?=
 =?utf-8?B?OVRIc1FINjM4MVA3Mnh3U0JQMFFCSjhwL0RUMjdaSEU1TlJ6UHFNeTlzMmhh?=
 =?utf-8?B?SE9xM1NoMkpIS1A0dG93OGV1SVJaZEtmQlN0MnJPZkl2Yml0TVduaEFxbVkw?=
 =?utf-8?B?a0RLUlU3NW5mUkZoM3AwSmtUUm03QUltU3hSOUd6bG0rRTB0QStvZjllWHNS?=
 =?utf-8?B?YUNmNHZDK2lmRE5hU0M1cWttcHJYaEl4NjlGdndZa0JqbzJMOGdHZ2ZNNlFK?=
 =?utf-8?B?NTF6UmcxaytOakxjMmVvMS9PdWIxa3k1bnpPdzZlbzdibmdEZmhJMHdudzBQ?=
 =?utf-8?B?SWMxT092K3lwZEZsa093eUd1UnhXVCtSMjFXNnpsRzFSc0tVZ3ZZclUxQUNx?=
 =?utf-8?B?RkE5K2Qzek51WlNXcVhPN1FrbkEvL1BCQVZCUG9DUk1FU2Z3RWwrNVoyNHZl?=
 =?utf-8?B?YzlnVUlqaXFnMVlvd3JMZzl3WFpJTzlXT29vcVBnSlF6aG5pVDV1enREMG83?=
 =?utf-8?B?VkFURWxONllISHdZbWc0OWhMdUVtTFZGUzBkTHVsTUtjb2o1SllHTnJicHk4?=
 =?utf-8?B?aGdBOTFRaDY0emRKQmZleExKbkpOUjBRbWlNdE9IaDBoTlJpaUVRbi80WnE0?=
 =?utf-8?B?ajlYWUlxTFIvaHZRNmNtWmFNR2taL0lMcnpNNGZtMTQvSHVvZkdQNHgvMkJJ?=
 =?utf-8?B?U1c3UVNDNEJYNDMwTEQrS09aM1IzZWd5RzV0ZFFTTkhzOWhGREFBWklpeEJU?=
 =?utf-8?B?cHVET0VVckw0NDh4c2ZPOFFFMmhVcmJ6MW12MEw1WWpuN3NsQXFvb2ZWRmpx?=
 =?utf-8?B?bXVDRXFuWk5uZVJRK3ZnUnllbkpud1BaMUtBak1oWlhQL1RtRTJPcytpbDFY?=
 =?utf-8?B?bjlqSUJRTmU1aUR6T0tNWWQvaTFLbkJ6NGx1VU1CTzIrWW50eHRBQUVkN0p3?=
 =?utf-8?B?YU94MnluS0luV3YvY0JveXRzUkVNQlZtaFZiTEFpMHU4UElyTGxJaHBKTmc1?=
 =?utf-8?B?UE5rQTNFcXIxNVczNXRTcnBFZ1NHV1BYd0dWR29ScHozWHU0VitYUGtTcWth?=
 =?utf-8?B?ZW1rM0pwQTR0d2w3SkJQWFpKTW53OVVsWjlWL1pHRUsvUXBRb0M0VjZKdTFF?=
 =?utf-8?B?dUpvOHNHNlkwWDZ0UFVoZ3YyRU10aE5sMmJJMUlPSGk1a2EyaGNMaHBTRHNV?=
 =?utf-8?B?UmZXTXY0QXJEMnphcmJ2Q1p1VTBPc253UjFKTVNFV2xFWGpLQndmRlpZZCtQ?=
 =?utf-8?B?R2xwSzRGbWRocnV2TW1NTFdVL0t5djZ1NG14aU13TTdFeGRyZllwL2xGMG5V?=
 =?utf-8?B?bmg3VTJUYmtXTVF0YVpmZG1WTkRpVGRPNFk5b1owcFB0Q1F2SzZNaVpwTWo4?=
 =?utf-8?B?dUxQd2ZDck8wVjBFUGVJK0RBZGxSTktiSS90R3h6QW0xcGNqdGhwam8zc2lE?=
 =?utf-8?B?S2pOZ1VuZFdUeWFNY3kzNlFPVzUvNXAzSTE4N2g3aVVpVThkd2lGVzBNR0xo?=
 =?utf-8?B?YzZQRmdXUHBUeE0vUlJpeGdqWjBOakNnSkUzamdjRDhHOHhTaVJVU2c2M3Zy?=
 =?utf-8?Q?RXwOHTFbT+nvNKVdO6xeVt7ivSEhCktw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M25qbzMzS08zU2ZnN1ltNTkwSzQ0MjlxYXdFcTBCQmxFanpvNEQzSys2Z205?=
 =?utf-8?B?Rjh2OFJRWDJsdWJYaUx6YndWaGROMDRENnZZNnB1aVViNHV5TWIwbDMxbHky?=
 =?utf-8?B?NEZJYmZOS1VoM1h2WGhrOVd4VUlPaU5ZWm1JNnA3WHV6R3g3N2xHeDZvNkcx?=
 =?utf-8?B?cnUwb3FkNy96MDdhYVZMYWt0eGo3WW9WV0VuQ0g4RVNkYlZBTDRzRnl5aEZ1?=
 =?utf-8?B?QVc4Y2dEeHcyME9ZVFJEdEY0cHNuQUhCaEVOVHdwNDRRS3RZTnFmM29LOEgv?=
 =?utf-8?B?S09mTWVZV20wc2hRcVdZcTlKVnQvK3drWkxCRldhaE5pZ0Z6dXU0R1B3VG5p?=
 =?utf-8?B?VGt5N3I4VkpHUHRPbTVJc3IvRit1MVpxQ1lsU25VamRyUzFkbEZ6R1prUTZC?=
 =?utf-8?B?ZXpaaGNQUmdraTVtbkp3eVBmVXFVdlZWL1ZVcGNoaWRDUWdtdklGY2ZmVytD?=
 =?utf-8?B?aTlCcTcvb0kvdkNWYnR1d2RoZ2didC9KblhIOEpBeVRza05CT2hDSTZBYXZs?=
 =?utf-8?B?QmRnbnhyYVB0T0FCMUptd1dGNjRiZGlCWHVWZE8veUl0cHhHWnRqNXpRWWho?=
 =?utf-8?B?VEd3SU02Z1BsKzI3cTdhMzd2WVJlZHhrYU1rS3ZUN3NIWGpTMnU0WEd5eHFr?=
 =?utf-8?B?c0xaQ2h3dUpCbUlnSi9tekt1TUNjY2ZWQ0JhZXJCaTFMZ2VWMGE1dndlQ2ov?=
 =?utf-8?B?eHJmWmQwZDg5STU0SFRXRjVDb3hYZzBzK0tMbFM1ME04VG9IZHJkNkdMcUdk?=
 =?utf-8?B?K0xQRyswa1B3RGxOMVNFemh4Tmt4SnIveVVVdENXMjVnV3VhQjY1VWNSUXIx?=
 =?utf-8?B?ZWw1M3kvYXpIMTkxTnZ4a1pQZXlERktpcndja0J2TDZueWFLUkg3NVFjTlB5?=
 =?utf-8?B?bXNBTStGVHcwRHovS1l3RjlYRDBJdG5nNnY2RUNtNktlMERwb1B1T1VUYWdp?=
 =?utf-8?B?ZGUyeks2SSt2Y3ZLcjEwckM1cHFBQ1VBYTBZQkRvWHZ1bjdtbEYxQllIbDZ6?=
 =?utf-8?B?L2xYK1dqa3FNUkVXc21XZG84bndraTVFSEhYek50b0JSQjA2UFlrQ0c1Nk93?=
 =?utf-8?B?clNtVHFwUW5DV3dSNEZIMCtDZUpvRlZaM29CdEZrMVRXbEpQR2Y4TUtWTFEw?=
 =?utf-8?B?Wld5TDF6TTcrQ0hPTVRkb21rRUszelVpc29QZWEyTXB0aGRBa21uVmkvbzdW?=
 =?utf-8?B?L3VuUlpnRkJMSDB1T1RVaGw3T3JMdm8rUFNVSlZMZDMwNnpGeW56YjA1S3hM?=
 =?utf-8?B?YzJuc1B4N2JTOVNWdEtSQ1V1N1d4UXordWVmcWQreTJhdGR1bE5VdFoxR3Vv?=
 =?utf-8?B?WWVRbzRETmdxb3Vkb2NNZFNGM1RTd0t4TUdoZTFLNzViN090blJoUndGTTlm?=
 =?utf-8?B?WHI2RGpMU0hlUlJJck5NWlJnZ3JtWHBlc3A0TGVnekxVNjlXM05WTm9HOU9a?=
 =?utf-8?B?Um5YQ21jVUVOQVFzNFY1UVZMTVhlU0M3cGphMW5ZMGZ2M3FrMWNlUExIOUJE?=
 =?utf-8?B?RWN3N0oxQzF1aTIxTjdYSXFjeTBpd1ViWjdqWHVOeUc4VkN0cWNuZy83QjBl?=
 =?utf-8?B?aWVFWVorZTlvSGgrelhTc0RhTjJxWUNEZ2o0K3dHaS85MERSQUdFTUVvWDZS?=
 =?utf-8?B?VStITTh0QTZ4YzErMjc3NVVKSGhYckpXSTlYV1dYT2dydG4vZWdnV1pUajRj?=
 =?utf-8?B?UkE3Y2xleE9RYWtWTGk0K3VEcDliM2tnbFVLR2NNK1lubkFJdmM3TFlJOGtH?=
 =?utf-8?B?UG0vdWpyY0xBdW9qSW82MTdQYkFjUEpxb082TVhndFNtQlcvNHV6ZWkvbkc5?=
 =?utf-8?B?bFc3U253WHk1Q1lmejBiVHorN1JQWEk1amF3alhPVjNraHVDRmxoRkVTVzdl?=
 =?utf-8?B?U2ZwVitTZElQMkZXQnlDQ3ZodStscjlWaC9CQ0lSY1pmNmFMUVpGc1VOdlBD?=
 =?utf-8?B?Z0c2UG1BOFJJcTdZUGRic09LdTRqeXlub3VmNE10MUZvQkVZQTFlazhKNWdX?=
 =?utf-8?B?RlBRZjFpQTFiTE9jTVk3cnFVTzZKZWptK2tPazZScEgrOXBTWWpYMTJXR3Bo?=
 =?utf-8?B?bkdhTG9GTUllZnRzWXM5STlkZ2Z6dnphUWd1a2JPeXBxazlnODlXdG5zbjVm?=
 =?utf-8?B?VGFFc0Y1dmxlSmN6V09ZOGpaaURsVEY1d0huQ2UwU0NTQktWWmM5OCtQWkxI?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3337ac9e-bebf-429b-dcfb-08de061c04b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 03:37:34.2782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EH9U0g5fOfqexqCK5lW6qp1BSg9PNG/BOy6/RWTekkBljLkWasE0m+8iWmk0OyVC3N+YaEn5nv42+xlz5lNXIVY+SAwvPJ1AhP9EWLcorjM=
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

On Tue, Oct 07, 2025 at 01:48:52PM -0700, Matt Roper wrote:
>Preventing the driver from initializing GTs of specific type(s) can be
>useful for debugging and early hardware bringup.  Add a configfs
>attribute to allow this kind of control for debugging.
>
>With today's platforms and software design, this configuration setting
>is only effective for disabling the media GT since the driver currently
>requires that there always be a primary GT to probe the device.  However
>this might change in the future ---  in theory it should be possible
>(with some additional driver work) to allow an igpu device to come up
>with only the media GT and no primary GT.  Or to allow an igpu device to
>come up with no GTs at all (for display-only usage).  A primary GT will
>likely always be required on dgpu platforms because we rely on the BCS
>engines inside the primary GT for various vram operations.
>
>v2:
> - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
> - Tighten type usage in gt_types[] structure.  (Gustavo)
> - Adjust string parsing/name matching to match exact GT names and not
>   accept partial names.  (Gustavo)
>
>v3:
> - Switch to scope-based cleanup in gt_types_allowed_store() to fix a
>   leak if the device is already bound.  (Gustavo)
> - Switch configfs lookup interface to two boolean functions that
>   specify whether primary/media are supported rather than one function
>   that returns a mask.  This is simpler to use and understand.
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 145 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h |   4 +
> drivers/gpu/drm/xe/xe_pci.c      |  22 +++++
> 3 files changed, 171 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 139663423185..e36cc5e1bc8f 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -15,6 +15,7 @@
>
> #include "instructions/xe_mi_commands.h"
> #include "xe_configfs.h"
>+#include "xe_gt_types.h"
> #include "xe_hw_engine_types.h"
> #include "xe_module.h"
> #include "xe_pci_types.h"
>@@ -56,6 +57,7 @@
>  *	:
>  *	└── 0000:03:00.0
>  *	    ├── survivability_mode
>+ *	    ├── gt_types_allowed
>  *	    ├── engines_allowed
>  *	    └── enable_psmi
>  *
>@@ -79,6 +81,44 @@
>  *
>  * This attribute can only be set before binding to the device.
>  *
>+ * Allowed GT types:
>+ * -----------------
>+ *
>+ * Allow only specific types of GTs to be detected and initialized by the
>+ * driver.  Any combination of GT types can be enabled/disabled, although
>+ * some settings will cause the device to fail to probe.
>+ *
>+ * Writes support both comma- and newline-separated input format. Reads
>+ * will always return one GT type per line. "primary" and "media" are the
>+ * GT type names supported by this interface.
>+ *
>+ * This attribute can only be set before binding to the device.
>+ *
>+ * Examples:
>+ *
>+ * Allow both primary and media GTs to be initialized and used.  This matches
>+ * the driver's default behavior::
>+ *
>+ *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>+ *
>+ * Allow only the primary GT of each tile to be initialized and used,
>+ * effectively disabling the media GT if it exists on the platform::
>+ *
>+ *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>+ *
>+ * Allow only the media GT of each tile to be initialized and used,
>+ * effectively disabling the primary GT.  **This configuration will cause
>+ * device probe failure on all current platforms, but may be allowed on
>+ * igpu platforms in the future**::
>+ *
>+ *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>+ *
>+ * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
>+ * **This configuration will cause device probe failure on all current
>+ * platforms, but may be allowed on igpu platforms in the future**::
>+ *
>+ *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>+ *
>  * Allowed engines:
>  * ----------------
>  *
>@@ -187,6 +227,7 @@ struct xe_config_group_device {
> 	struct config_group group;
>
> 	struct xe_config_device {
>+		u64 gt_types_allowed;
> 		u64 engines_allowed;
> 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>@@ -201,6 +242,7 @@ struct xe_config_group_device {
> };
>
> static const struct xe_config_device device_defaults = {
>+	.gt_types_allowed = U64_MAX,
> 	.engines_allowed = U64_MAX,
> 	.survivability_mode = false,
> 	.enable_psmi = false,
>@@ -220,6 +262,7 @@ struct engine_info {
> /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> #define MAX_ENGINE_CLASS_CHARS 5
> #define MAX_ENGINE_INSTANCE_CHARS 2
>+#define MAX_GT_TYPE_CHARS 7
>
> static const struct engine_info engine_info[] = {
> 	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
>@@ -230,6 +273,14 @@ static const struct engine_info engine_info[] = {
> 	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
> };
>
>+static const struct {
>+	const char name[MAX_GT_TYPE_CHARS + 1];
>+	enum xe_gt_type type;
>+} gt_types[] = {
>+	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
>+	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
>+};
>+
> static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
> {
> 	return container_of(to_config_group(item), struct xe_config_group_device, group);
>@@ -292,6 +343,58 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
> 	return len;
> }
>
>+static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+	char *p = page;
>+
>+	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
>+		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
>+			p += sprintf(p, "%s\n", gt_types[i].name);
>+
>+	return p - page;
>+}
>+
>+static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
>+				      size_t len)
>+{
>+	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>+	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
>+	char *p = buf;
>+	u64 typemask = 0;
>+
>+	if (!buf)
>+		return -ENOMEM;
>+
>+	while (p) {
>+		char *typename = strsep(&p, ",\n");
>+		bool matched = false;
>+
>+		if (typename[0] == '\0')
>+			continue;
>+
>+		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
>+			if (strcmp(typename, gt_types[i].name) == 0) {
>+				typemask |= BIT(gt_types[i].type);
>+				matched = true;
>+				break;
>+			}
>+		}
>+
>+		if (!matched)
>+			return -EINVAL;
>+	}
>+
>+	scoped_guard(mutex, &dev->lock) {
>+		if (is_bound(dev))
>+			return -EBUSY;
>+
>+		dev->config.gt_types_allowed = typemask;
>+	}
>+
>+	return len;
>+}
>+
> static ssize_t engines_allowed_show(struct config_item *item, char *page)
> {
> 	struct xe_config_device *dev = to_xe_config_device(item);
>@@ -672,6 +775,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
> CONFIGFS_ATTR(, ctx_restore_post_bb);
> CONFIGFS_ATTR(, enable_psmi);
> CONFIGFS_ATTR(, engines_allowed);
>+CONFIGFS_ATTR(, gt_types_allowed);
> CONFIGFS_ATTR(, survivability_mode);
>
> static struct configfs_attribute *xe_config_device_attrs[] = {
>@@ -679,6 +783,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
> 	&attr_ctx_restore_post_bb,
> 	&attr_enable_psmi,
> 	&attr_engines_allowed,
>+	&attr_gt_types_allowed,
> 	&attr_survivability_mode,
> 	NULL,
> };
>@@ -846,6 +951,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
> 				 dev->config.attr_); \
> 	} while (0)
>
>+	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> 	PRI_CUSTOM_ATTR("%d", enable_psmi);
> 	PRI_CUSTOM_ATTR("%d", survivability_mode);
>@@ -896,6 +1002,45 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> 	return mode;
> }
>
>+static u64 get_gt_types_allowed(struct xe_device *xe)
>+{
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>+	u64 mask;
>+
>+	if (!dev)
>+		return device_defaults.gt_types_allowed;
>+
>+	mask = dev->config.gt_types_allowed;
>+	config_group_put(&dev->group);
>+
>+	return mask;
>+}
>+
>+/**
>+ * xe_configfs_primary_gt_supported - determine whether primary GTs are supported
>+ * @xe: xe device
>+ *
>+ * Return: True if primary GTs are enabled, false if they have been disabled via
>+ *     configfs.
>+ */
>+bool xe_configfs_primary_gt_supported(struct xe_device *xe)
>+{
>+	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN)) != 0;
>+}
>+
>+/**
>+ * xe_configfs_media_gt_supported - determine whether media GTs are supported
>+ * @xe: xe device
>+ *
>+ * Return: True if the media GTs are enabled, false if they have been disabled
>+ *     via configfs.
>+ */
>+bool xe_configfs_media_gt_supported(struct xe_device *xe)
>+{
>+	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MEDIA)) != 0;
>+}
>+
> /**
>  * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
>  * @pdev: pci device
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index c61e0e47ed94..5624e965b911 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -17,6 +17,8 @@ int xe_configfs_init(void);
> void xe_configfs_exit(void);
> void xe_configfs_check_device(struct pci_dev *pdev);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>+bool xe_configfs_primary_gt_supported(struct xe_device *xe);
>+bool xe_configfs_media_gt_supported(struct xe_device *xe);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>@@ -28,6 +30,8 @@ static inline int xe_configfs_init(void) { return 0; }
> static inline void xe_configfs_exit(void) { }
> static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>+static inline bool xe_configfs_primary_gt_supported(struct xe_device *xe) { return true; }
>+static inline bool xe_configfs_media_gt_supported(struct xe_device *xe) { return true; }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index a5932e4f4a23..9c8ab2b41737 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -695,6 +695,11 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
> 	struct xe_device *xe = tile_to_xe(tile);
> 	struct xe_gt *gt;
>
>+	if (!xe_configfs_primary_gt_supported(xe)) {
>+		drm_info(&xe->drm, "Primary GT disabled via configfs\n");
>+		return NULL;
>+	}
>+
> 	gt = xe_gt_alloc(tile);
> 	if (IS_ERR(gt))
> 		return gt;
>@@ -720,6 +725,11 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
> 	struct xe_device *xe = tile_to_xe(tile);
> 	struct xe_gt *gt;
>
>+	if (!xe_configfs_media_gt_supported(xe)) {
>+		drm_info(&xe->drm, "Media GT disabled via configfs\n");
>+		return NULL;
>+	}
>+
> 	if (MEDIA_VER(xe) < 13 || !media_desc)
> 		return NULL;
>
>@@ -829,6 +839,18 @@ static int xe_info_init(struct xe_device *xe,
> 		if (IS_ERR(tile->primary_gt))
> 			return PTR_ERR(tile->primary_gt);
>
>+		/*
>+		 * It's not currently possible to probe a device with the
>+		 * primary GT disabled.  With some work, this may be future in
>+		 * the possible for igpu platforms (although probably not for
>+		 * dgpu's since access to the primary GT's BCS engines is
>+		 * required for VRAM management).
>+		 */
>+		if (!tile->primary_gt) {
>+			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
>+			return -ENODEV;


I think "fail to probe" should be ok. Advanced user using this interface should know what
to do. I was thinking about blocking this at the configfs level, so the
user is not allowed to do it until that path is cleared. Any particular
reason to do it here?

Lucas De Marchi

>+		}
>+
> 		tile->media_gt = alloc_media_gt(tile, media_desc);
> 		if (IS_ERR(tile->media_gt))
> 			return PTR_ERR(tile->media_gt);
>-- 
>2.51.0
>
