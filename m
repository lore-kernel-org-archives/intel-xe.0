Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA9CE64A82
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 11:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0279010E1A0;
	Tue,  3 Dec 2024 11:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4DvwXNq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2D110E1A0
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Dec 2024 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733226473; x=1764762473;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GevIp+VhCdQe2PLA31cOSAG420CjL8EUTdPSNVO6slI=;
 b=m4DvwXNqRvPJTIcc1jwlC8Zzjzut+lWnuvPsk4McLIZr0Wnjdq4Vft7Q
 7V4hqzzu0HrN5/4j/olyL5l4Ar1XKrHMAjxKN4TuWwVNaj2Ds9eViLyAZ
 eUeC/igUpPNMaVIJ9ofiaR75Z+bg/yEpWK3NhBOace6905tDyKTelXpU9
 5jbfccrp24J7n4i6A953n/EKHIejfN0i1oIAmhvu17dfP4fIPo+JN+Gza
 Du6T3Vnu/jdufAaTuyzX2aI2jblrqgwpsYlVSjTAsyiBKQ7Jyt7m/z5+9
 CPkdL+rqsuvPnHt7tm4JdU0oTqvTlOC1BsMpKOMi/w2lexWmQKnyCdPGs Q==;
X-CSE-ConnectionGUID: KCeAFeLLRSuyBVFcFmKG1w==
X-CSE-MsgGUID: 2yzNOgUWQ4mV9Q2xCPdDMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33565317"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33565317"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 03:47:52 -0800
X-CSE-ConnectionGUID: BNOKElSNRLS9Kqdop7c7+A==
X-CSE-MsgGUID: 6daKDuHzSOWrD26L+ioI8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93814514"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 03:47:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 03:47:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 03:47:50 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 03:47:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9IaimlhSXugx7sO72HmP6BnPyF0FAJqTppEn9ELHlJ0PO8qZK0o3aFnzmkRtixjFD1UhtQPKeD7JNlTQG4aqHwNpZJLEsyptiqopXux+b+XrvqV9wLxAFMJ/1e0IIdMW47NQAkmtUifYdmwLaY9RddYQZqGf3DrFMtrX8/w7sc4Kt230vRdG4JofxlD3V4h91mwq95wYbRiRlxBs3l9CLwbelN1YUwddPk32HPuRllvZ4xAnHtOXEHaLo6FWQtZzd22bvFauulmBfVzeRnEgK3UlHPq5jNpDvuL+eYOZA1qbHj1qEojLtfMG/LhoAzE/ZUwaPKFUd5BvLFXqQWhKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvOtiPWDokCYJiIa84ueh5cXHQgQZXyeNB7yxrLPhoQ=;
 b=f3Lq86uwptO7ONi6iNUu/kzTLLOdmuuzK2LxEdp52xWIKyyFSuLNHvjnTXfmKXJiKHZgWWNbHWVmETUk7Vlyz956B+5SMLhP/rdIuDm29yfx/DmtEslIBYGZ2v9ka/mxONz8BTYmOJ+r89pqyT8Y7ImKpuugtRjVGrUA7WQdlSa8SDLWzkh2bIwELPFCwvCMAvUQE4FtFDpXFBoxwXve2DduEvfiHFwlPhKxbyc03NQSbrXe6kGLQDhFL0if3UVH8GKTMDGDV7UyPn5H6vpdfbtALA2sE2meXghcjVWxqlOByU1OPAxvO6aBw/kOTY5YYnIHMLnBEK5J3bDvMzhtJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 11:47:48 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::e707:2d60:2891:a02%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:47:47 +0000
Message-ID: <465360c2-8505-43a3-bd99-cceb2afe8ef5@intel.com>
Date: Tue, 3 Dec 2024 13:47:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/xe: Make irq enabled flag atomic
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <niranjana.vishwanathapura@intel.com>,
 <koby.elbaz@intel.com>, <yaron.avizrat@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-2-ilia.levi@intel.com>
 <20241202183255.glrvcigzprouhklw@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20241202183255.glrvcigzprouhklw@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0021.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::15) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH7PR11MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e6941d-9e84-4eea-c6ac-08dd13904ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkxCdWJLT1cxTUsxays3Mlo5OUc4OWltRGlOanR4bmV0bElJcjU1WUlZeEEy?=
 =?utf-8?B?cVZKbXBXVmFDbzVYM2NUMjNBTUp3dkxzcVM3RjlPM0piNGdVd1VZZXVyajFH?=
 =?utf-8?B?NW1WRkc1UUxYREdZcEFrTEY3cGI0dXIyQ3NHNmJ1Tno2WEhXT2crbzVMa1Yv?=
 =?utf-8?B?cTVlMFBPY01rekRqcmtNdGx5dHVyU3V0cERUSkJMMTJiaGU5c213RGxnWXpK?=
 =?utf-8?B?OEJXOHF0TmxEQUFGZ1E5NDhreFk5eXlocEZDWXZYVng0SjRGT0toVCs2d2Fz?=
 =?utf-8?B?QUluVDVraHZwcnB1bnpEb3pWNXVvNFVGOHFlQ0pTcGZ3NUY3dVEzV0U5UnpF?=
 =?utf-8?B?bEFwNEptVFF1OFg1VzNUNXFRRnZxMlVrd1JqektCS2NKbW9GWEpWeXcyblZ6?=
 =?utf-8?B?bVVYUEorTFhGMlFTdTJzSDBHMmpJem9oLzFBbFVJZDlQNFgrRlFyaUoyTjZm?=
 =?utf-8?B?RjZESUVScXkwRUZSZGkzVWNxMmtuTnZnVnN3c3VSYTV5OVBwakwxSmtyUE03?=
 =?utf-8?B?eklBeTFCM3JmeEhrdDZnenVwRmVERmtzbHE2WmZ6YW9tQ081bklnSnhjR0V4?=
 =?utf-8?B?TUlGeDBWUzRmSTRGUU14c0RITDFJWlZKVFJzZ2tXU1ZLS0JaZUQ2UUhuRU12?=
 =?utf-8?B?TTdLa1dZdnNYbVNkakhpRnEwWjdsMGNYU004dXBpcDcycGpna1ZKV1BBTE45?=
 =?utf-8?B?N2s4cWJvRGxvSFhPS2JYZHdpOWQ0M3ZGaUI0dFNSMHdvekNpUzBYTWt0SVNV?=
 =?utf-8?B?K3BVeW0rdEV3L2dvK3pYTmhTQ1YxUHh5SGoxWERsSlBJN0hrZGZmUUNDS2VO?=
 =?utf-8?B?SlljQnlRaWk1NFovaEVqZFBOQmV6UVNWV25qM2IrWDZPQmRtN3EyTUNlQTBO?=
 =?utf-8?B?dWpGdnp5TzBoRDkwU2dWUXhCeGduR2lvWGdRKzhSald0U1EvNUZDbzBJRlR1?=
 =?utf-8?B?dzBTYTFwc0hvNGlTK0VxSzllNVBqUXdwL2NLNE9JVVhPWDZRcDR4ZVpUV2J6?=
 =?utf-8?B?OFNkYkJSdmNOL2RUOFdXQUVSdGk4akVEY3RuTjR2cjNNWVdmbUErTVJMZ3I5?=
 =?utf-8?B?VDZKbmdyalVDOGtmVWdVOWNEVFB5SzRrbGxnSXNNRzQ2c1YyMkVIenJvS2sy?=
 =?utf-8?B?SDQ2REw2ZHYzRnQ2V2tvQW9nQ2NrTXRkclFwUlB0YkxlbXhQa1NkTTVmWXdS?=
 =?utf-8?B?R2ZvemVwdkFyaTJzaTA5UHpraG81RTB0dWlpTm9rWTJMRittclVQSTFYalli?=
 =?utf-8?B?Wi8zY2NJaFI0ZE0xQmZwNzFjdWRWSDF0Y3Rmc0UwaXgxNUNRRGRYWnNDUmx4?=
 =?utf-8?B?cTN3bVl5TUZUQTBydTAvU2JxaGpsaSswQmRBMjl1WWYxZ21wSVB3UVd2NGdv?=
 =?utf-8?B?R1Zubk1RdGpGdWJaL2JyMjMrUkhpbm00b3lpREZaaFJKVjIvcTBHOW5BRDk3?=
 =?utf-8?B?VmtLUUw5WXdQdFZVWkxkdWpHVlUvaHFKQk1SaldHWjlveWVPb082ckNsd2M5?=
 =?utf-8?B?YzNhNnFTaFM0cW5ocTFQRjdFQVhqRlJVV3ZMZGdpcnJjS1pyY3l2OW5SZjNR?=
 =?utf-8?B?T3htaTl4cUovTC90U042RGZnVWgranFNR05EQTRHQVk0MVlXWENpV1lZZUUz?=
 =?utf-8?B?UjZ6Z2w3RnQ3QnRwcmlqczhwd3ZTalMxeitZQk4zSEM1OHJoY0drT3BaemRN?=
 =?utf-8?B?dnIyTnduektpN21uQ2ZDUkxrV0NRRHMwZnl5eWNhQlloaDhvZUc1ekxFbEVq?=
 =?utf-8?B?TXFBZVRTak9iRzloNjBRc3B0L2ZMR1FqS3N2V0V1cEVvY0lJbFVXaUs3UC9u?=
 =?utf-8?Q?JduoHO3F1peV3GiAPCog/7bCYGa9mFGefegXE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkpoaGNvbzJnS1ZzVERQL0F5KzBMaFVXeHhZZTlHYUtjbi9MQUpPZ2YyaHg1?=
 =?utf-8?B?VUFoaFdSbWlZVDZvZjVQRWhMT0lUbEEvSzFSZkNRaElYZ2lWdnkrcjBaL2NE?=
 =?utf-8?B?MHh6T09EcUJHRWNsWXZLcE5xZEVyNmZTcG1wR0NaT2orL3lpb0wya3J1dmlQ?=
 =?utf-8?B?RDYwVlN2UlVaazZtVTE5WVVuNnY1QncyMFhnWUZ4UFJnU3BKUUhjL3Z5QW5G?=
 =?utf-8?B?eVRaRnJHeldUVko5ak1XSXhmaG9OS2phZ01IWEdjTFFCd0k5d05TcndBcXVS?=
 =?utf-8?B?OXdpNWhheUV2WmxydzVnSzkyN3FVV3FNZXZnV3JzbTJzcUt4T3BKQzJUQUJY?=
 =?utf-8?B?NUxySmNhR2t4bUkzSXRkOEZHZEI4TVhyc05GZG9CaExRajRSTVNPNkhFazhw?=
 =?utf-8?B?SnQwVTFzcmpBQ21pSks0dHpKK0pibjFETEZPYTY4QXF0d1BMTlkzV3J1SG5T?=
 =?utf-8?B?YnhkNjRxcmt4TGNGUUh6d2JwSzdxblg3NWJWNjlneXhPa3A4ckVKc3VET3Ns?=
 =?utf-8?B?TkVuTFJVRFR1MENBMUNoWGw5akZ6SVdkT2F2YldOUWwvZk43WmhsYTJHSXVt?=
 =?utf-8?B?RW9sdGMrZndGNHNQQWxDOFlTNGNoRE5GTCt1KzJrTmRYTlg4a2krbm1VOXpQ?=
 =?utf-8?B?U3NCRVNSK0hDWFN0dGQ4NVROa3ByTHpnS0x2VENCUDJyUmt3MlNHZVBpcXJO?=
 =?utf-8?B?Y08vbUh5azFzWW9yYlNIV3BkOE0yNXo4S1V0dlNPNFhPT2UwTFhQMWxLZ1hE?=
 =?utf-8?B?em1tRDlPcGptbjBjNG14ejl0OGFzczFMTGdrbGVCQ21CckJsR2FONkdMb0pr?=
 =?utf-8?B?UHZXdUFKeUpwUFR0ZGd4U3dnK1FHQy9uZzI4SlpsSlA0MlUxekRiekZKYVJw?=
 =?utf-8?B?cC9vSWw1YWVoQTBtM1JOZW5kazNEL3dLaWYxNDF3NlAwTVpjSGJKOWFkNlRW?=
 =?utf-8?B?U3lxS2RNeEFzV2lrYzJpUDlqWWRPSVJaNmZTQ09Cc1AzUDZRbSsrN3dsTFpN?=
 =?utf-8?B?MVZVQ3UwWkNoYktsTURYYWd0UTdLLzNia2l2Vnc3N1hrQjZKZW9hd21ibHBO?=
 =?utf-8?B?OTM2SjhuNXNnSzF4aTU3dklWTWJZb1NlQTVoczZzaDJxNUY5Tk0ySFpieE1N?=
 =?utf-8?B?YTIvZTJRa0tYTlpvMlRIeGRSdFZwQ1dRVmNrN0pRcnc5NVpoaUxmS3R4TkhI?=
 =?utf-8?B?eHhWeHFpVWpqZmFoOUVYU3dvVVVDbDNwYkRLeHZEOFZqQWJLQXU4WUZaZHhI?=
 =?utf-8?B?dW1PRHZVSEM2NjU2cmw5eUNSV29DM0lWSy9wRVloanZkNUJxTy9UdFlkTzlJ?=
 =?utf-8?B?WmVtUDNLN1lObDE2WnAvdkxNN2NVakZwb2FlUFM1dnE0b3IzNWRwa052aTla?=
 =?utf-8?B?eFV6aVVpejZrQnFEM2FibjVlRXdma0xjRXN1UDgxVXQ1bk1CeFF4emtmZ3l4?=
 =?utf-8?B?cTFBVXVPVFA3aHc5UzIwNzRNNkhRMGE5aUF5cGExT3g0bTBma2JkM0srNHdD?=
 =?utf-8?B?MGdGaDQyc1NSeDMvYy9PTDVNTTBQRkdHSjlvVGJWMzBJQjV3bmEyMThaYmdx?=
 =?utf-8?B?WmFGQWxiL0xIYk5USXFUUndsVUd2elZpblRXWDhjZ1R6aFJyK3FCUVdyaSt6?=
 =?utf-8?B?QTcvTXR3RlM1ZFU1WjlWWVNXUHlUc0JVTEc5bmhJOUF4cHVNR2VUeitJWTg1?=
 =?utf-8?B?NlZWbHR6QlFUM3I1b2tnK2xVeUZOYzdsaFNhSEdoc3pOUjF2Ymc1VjdUZ2kx?=
 =?utf-8?B?S3lPYi84dytNdVBoM3E2bkpJbXZZNThtNC9IRUdXWkczRUJMYS9GU3krc0Rl?=
 =?utf-8?B?TU5kMmxjN1daS1Axb0N5Rk9KQ3Zlb2NmUFhZWDJqQ3ZTT0hydDhxT1NXUmVJ?=
 =?utf-8?B?UGZmRWk3YnBJY0M5ckFpTmNBUTBsODlGQ1ZkR29QNm1qWExHb1BWQVZkZFRR?=
 =?utf-8?B?WGVPSG1EWjBib3p5MEtBZDVYbnRRYWw0b1ZmRHF0WUtvUGpxR2YvRFhzaEwx?=
 =?utf-8?B?NzN0UHVtM3ZLR2krdE5oOUZJY3I5WWIwUzd2Y0N5elZqTkZmbXRkV2ltTDNV?=
 =?utf-8?B?MGtudFNjQlFGY2w1TUZrNlZpUzBwRURBamM2a1N1TEd4T0sybGVpU3lJb3ds?=
 =?utf-8?Q?+ALptXvi9ogbeDsXpiKTo+U64?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e6941d-9e84-4eea-c6ac-08dd13904ee1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:47:47.9270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+pxghAO8sdIoNrLIlyNpj+7ffvqToomOxh+okcfyVPATxE3nA4WoeQpMJiMjBWMlTSBq9r9BjSV7iRhP2gs4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
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

On 02/12/2024 20:32, Piotr Piórkowski wrote:
> Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:41 +0200]:
>> The irq.enabled flag was protected by a spin lock (irq.lock).
>> By making it atomic we no longer need to wait for the spin lock in
>> irq handlers. This will become especially useful for MSI-X irq
>> handlers to prevent lock contention between different interrupts.
> I am not convinced that you can simply replace this spin_lock with an atomic.
> Note that this spin lock is also used for whole blocks in the irq handler
> (for example gt_irq_handler), and not only to access this flag.

Yes, I saw that. However, irq.enabled is not accessed within those blocks, so imho there is no need in mutual exclusion between checking the flag and those blocks.
If I understand correctly, the role of irq.enabled flag is to prevent new irq handlers from running  once the interrupts have been turned off (e. g. as a result of suspension), while synchronize_irq waits for the already running irq handlers to finish. Making the flag atomic should achieve the same goal. I have left the spin lock to protect access to interrupt registers (and there's also some protection in xe_execlist_port_destroy), though I'm not sure when it is useful.

Adding Rodrigo and Matthew in case I'm missing something.
Thanks,
Ilia

>
> Thanks,
> Piotr
>
>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/ext/i915_irq.c |  2 +-
>>  drivers/gpu/drm/xe/xe_device_types.h      |  2 +-
>>  drivers/gpu/drm/xe/xe_irq.c               | 29 ++++++-----------------
>>  3 files changed, 9 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>> index a7dbc6554d69..0c0f4533c34f 100644
>> --- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
>> +++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
>> @@ -64,7 +64,7 @@ bool intel_irqs_enabled(struct xe_device *xe)
>>  	 * But at this point the xe irq is better protected against races,
>>  	 * although the full solution would be protecting the i915 side.
>>  	 */
>> -	return xe->irq.enabled;
>> +	return atomic_read(&xe->irq.enabled);
>>  }
>>  
>>  void intel_synchronize_irq(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6a04f975ec16..7ee114c17552 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -347,7 +347,7 @@ struct xe_device {
>>  		spinlock_t lock;
>>  
>>  		/** @irq.enabled: interrupts enabled on this device */
>> -		bool enabled;
>> +		atomic_t enabled;
>>  	} irq;
>>  
>>  	/** @ttm: ttm device */
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index 7bf7201529ac..1c509e66694d 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -348,12 +348,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>>  	unsigned long intr_dw[2];
>>  	u32 identity[32];
>>  
>> -	spin_lock(&xe->irq.lock);
>> -	if (!xe->irq.enabled) {
>> -		spin_unlock(&xe->irq.lock);
>> +	if (!atomic_read(&xe->irq.enabled))
>>  		return IRQ_NONE;
>> -	}
>> -	spin_unlock(&xe->irq.lock);
>>  
>>  	master_ctl = xelp_intr_disable(xe);
>>  	if (!master_ctl) {
>> @@ -417,12 +413,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>  
>>  	/* TODO: This really shouldn't be copied+pasted */
>>  
>> -	spin_lock(&xe->irq.lock);
>> -	if (!xe->irq.enabled) {
>> -		spin_unlock(&xe->irq.lock);
>> +	if (!atomic_read(&xe->irq.enabled))
>>  		return IRQ_NONE;
>> -	}
>> -	spin_unlock(&xe->irq.lock);
>>  
>>  	master_tile_ctl = dg1_intr_disable(xe);
>>  	if (!master_tile_ctl) {
>> @@ -644,12 +636,8 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
>>  	struct xe_tile *tile;
>>  	unsigned int id;
>>  
>> -	spin_lock(&xe->irq.lock);
>> -	if (!xe->irq.enabled) {
>> -		spin_unlock(&xe->irq.lock);
>> +	if (!atomic_read(&xe->irq.enabled))
>>  		return IRQ_NONE;
>> -	}
>> -	spin_unlock(&xe->irq.lock);
>>  
>>  	for_each_tile(tile, xe, id)
>>  		xe_memirq_handler(&tile->memirq);
>> @@ -674,10 +662,9 @@ static void irq_uninstall(void *arg)
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  	int irq;
>>  
>> -	if (!xe->irq.enabled)
>> +	if (!atomic_xchg(&xe->irq.enabled, 0))
>>  		return;
>>  
>> -	xe->irq.enabled = false;
>>  	xe_irq_reset(xe);
>>  
>>  	irq = pci_irq_vector(pdev, 0);
>> @@ -724,7 +711,7 @@ int xe_irq_install(struct xe_device *xe)
>>  		return err;
>>  	}
>>  
>> -	xe->irq.enabled = true;
>> +	atomic_set(&xe->irq.enabled, 1);
>>  
>>  	xe_irq_postinstall(xe);
>>  
>> @@ -744,9 +731,7 @@ void xe_irq_suspend(struct xe_device *xe)
>>  {
>>  	int irq = to_pci_dev(xe->drm.dev)->irq;
>>  
>> -	spin_lock_irq(&xe->irq.lock);
>> -	xe->irq.enabled = false; /* no new irqs */
>> -	spin_unlock_irq(&xe->irq.lock);
>> +	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
>>  
>>  	synchronize_irq(irq); /* flush irqs */
>>  	xe_irq_reset(xe); /* turn irqs off */
>> @@ -762,7 +747,7 @@ void xe_irq_resume(struct xe_device *xe)
>>  	 * 1. no irq will arrive before the postinstall
>>  	 * 2. display is not yet resumed
>>  	 */
>> -	xe->irq.enabled = true;
>> +	atomic_set(&xe->irq.enabled, 1);
>>  	xe_irq_reset(xe);
>>  	xe_irq_postinstall(xe); /* turn irqs on */
>>  
>> -- 
>> 2.43.2
>>

