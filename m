Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73046CA0ED1
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 04:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AD910E208;
	Thu, 14 Aug 2025 04:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCnYHRJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03B510E208
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 04:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755145390; x=1786681390;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UHLLodB6eZc42UZJkOxolF/jHvLZjsB6urVlCasKmIA=;
 b=UCnYHRJ3BuXACPn+/Q+fBwMPeF/kRk6HuQRgsyHpsNR6GZNgDt723126
 QNDaiRCDZsDr1smDHntTLJyw42VNpy/WpXs272o3nUFQ7J6pjko6F8idC
 WYWzbnUaK0s3hSn0UFb+ka2yHZEmlHudt6K6d1yyfBgBuUSCm/n9niqCt
 u2k6hB5K1rmISn82mRF7SDjmDkVB3nSy6wE6WMv+9mNks89X8l9gZxNyx
 txZUYaQew6U3LVfGxYA7lN3w0AJZhFsTjELU0yXlLpwyPGnTAmFfW4le9
 mBlqo4dWgo49XqCSgrbPw4Jm7RST2w+0CXwlgcR+8ymrhJsw4cXka7JSi A==;
X-CSE-ConnectionGUID: d1FLx53VT2eD7gldZSwyKw==
X-CSE-MsgGUID: D9U5sCK9TM2fmmftGANTZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74905122"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="74905122"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:23:09 -0700
X-CSE-ConnectionGUID: 6gaMZnpgRoagAubcDH9iWg==
X-CSE-MsgGUID: 8d+0niWATJirovWZlsKOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="167024516"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 21:23:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 21:23:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 21:23:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 21:23:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDoZfjU1Vh7jvpwA0a28bpqClZ/0SlbQaWtC3A9Vxb7Myfj3iaFGN+hxPfbCZPq04ZRKaJreY2KVBe0BhRqsN49LhkjGxpnjqFaQab89TdPCIQI7Avndp0xA0npFgKsH/lIzNm39ioXadFf3Hms1KORsq6W0qy0e6KBEB6M9lvZ5Xqv2rKFn9fSOEpS4hhnIvD8G+CnU3a2ItEstB1+Fsj+AXiBiTYWypoCKeR/BGpBv8BmstRmzStzc36gqRmNjIm7Cy7ZrvZxuRrXiS9SDTfs5os/ABpq0KP6fwYKp9IUZx/dBF0eai1Hao0WatcZ+tehfkwbjRGcsEk1Ahew9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zjn7S/kAm0Rt2e36Bzk8QgnA2KkH12Ot49NBdUmBlw4=;
 b=Z7uLDLLsMubtWXq0DQqr2CH77ByJcQSwcwIDX9OU+/8faVpbJtifKmKOpuNCPw/SVTpAD0+QpLhnnsfVBNIDZ8/E1RCLdNi7gB4gpoo2VldXuZL/lc04O+aUSSg84AUMeJ/cqTGc6n4HCpoVsvDbEfbZi5iUCDA+jRSEb0sIKGmK4ioa9vgR5rgoXe29F6i6ZE2ZMMwFaGSSYrZf6zktxwwtSK9LVZNnD5OloSFfR4cO3MIkIQkX5mfqyVqFbdLsTgn6QlulTvidPKbqNXrPM6bhNF4jj8IGkka0VPGLj9x8u2L1+zP7oZ21AnzLejeV+hhIwpOEZKQfunlgxhkk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 04:23:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 04:23:06 +0000
Date: Wed, 13 Aug 2025 21:23:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 05/15] drm/xe: Introduce an xe_validation wrapper around
 drm_exec
Message-ID: <aJ1kp6K5mcFtzPJQ@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
 <aJ1LFsjFmjAY2Fcn@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ1LFsjFmjAY2Fcn@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR07CA0108.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a9391e-da08-449f-92b6-08dddaea4448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RElELzBIMHpUSHhDSTRhdDNwc2x0MUY1YUFjSnpTbzkrOTNBUUhSZXBwOUh0?=
 =?utf-8?B?QmRCRmdDeEZkQlo5a0swc0JCbUlpMUNJMm9vckpjSS9xdW1xNUlWdWx1WEFs?=
 =?utf-8?B?b1VKYmU5b0x4T2JLQ3pUeXdqUUZBNzRLZERsRVkzRUNJKzVPUWpraWJGWi9J?=
 =?utf-8?B?cTUwNkJuTEN0RzBlK0pKcG5ETTMxZzltT1RBWnBMYThDVVFnTUFlNGlWVVMx?=
 =?utf-8?B?SUt4MkU5WFBEWW5TbnVNbGNJVFlTR1hIalRGZ0NXOWhJME1HN1NEM0JicmlP?=
 =?utf-8?B?aGN1TlQxWHNFNUlCa1AwNkk2T1RNbHpDR3hZaTN0V2k4TWU0Z1l5ZmNRR0FX?=
 =?utf-8?B?OGNFUXF4YnJwSlBSUzhtVVhNSWtZbFh5NFdNaEhUU2pLSmVlRWVmNjUrYURx?=
 =?utf-8?B?MXdlUldMUTNFZTB5ZlVDTmhQTWg3OFVLTVJQekJJdUU2cmhsWjgydU5jRUZM?=
 =?utf-8?B?MnBpeDhjNUcvVTN0cm5BMjBTKzZ2VU5oUGJzL0hRUjgxbTRVeU02TDBzcmpm?=
 =?utf-8?B?dm1MRjV3enJzdmRucmVZU3BySk5NSi84Q0VwT3F5bE0vOXRVNU9PcThSeU1J?=
 =?utf-8?B?emFicWJwdkRodXRaNEZhTWtnUTFKa1lMdzd4dENhY1BDL21IUUhoZHBLNFlt?=
 =?utf-8?B?ZTZSbDRYRk95VnRDNU5KQ2xZT2cra3RlMzY1MEJLOVpBRE5oTlNOQmNXMnVl?=
 =?utf-8?B?Ulhodjc5NDhnRFRpOGQwanJITDE4V0orY3YrOFFVbitkQmdNem80SmVTVk5j?=
 =?utf-8?B?OUdxTEZsNEdaZVdTcG5nVGdvZUhjNllLdEUxL2IvRW5BSjFMaVlxbEVGRkll?=
 =?utf-8?B?YkU1RGtqY3VlU3ZTL1VUNHowZ1BINk5uOWpOQUErNFBRWHNwQnRNbjZZTHlh?=
 =?utf-8?B?U1k4aXJ5eU1iaE50SmUrWUxra3IvaTVFZE9Gem02MTlPalNaTVlWRFU1ZmpN?=
 =?utf-8?B?cEZkSkVoTUNKK3hXMm1lQVVRUU5HVkZITUViNlF2RW5CZGdEc3NIZ1QrM1lq?=
 =?utf-8?B?c1JzZFFoR29EWlBDaXJwRStMVTlVOGNQQVVoVkd6M1lISjl3M0phRjkxNG5t?=
 =?utf-8?B?RGNRNTh4Y21wOGtETnptVjloU1RFQVUyUGlkSVpNdDNveXVjTyt3RjFsdzcv?=
 =?utf-8?B?U3owVkVJMEFBeG9NamZ6OGMvS05Eb3JGYmt5Z0daQTAwOXRvdzIxRlNrNVVw?=
 =?utf-8?B?Z2dqclBqRkZkeE5VYmxXbEREbjJBWlNjQmRxVHhkWGpLRVg1WjNGVncva0ti?=
 =?utf-8?B?WTlnZFVHbGpFSnRRYjFsclhhY3hsc2c2UDdiakxwelgxNW00MXQrQXNUZ2VM?=
 =?utf-8?B?UzhUT1V0YTZMTEgrUW81MmdIZENFWGhLeU9IRzdKYmtmeVAvQ01TRnNIek9i?=
 =?utf-8?B?WVF1WFQ2UTZtMVJ1MTVIcC9uTFJ3RVllaTZObFdaWndTZjJQZCtGMmhSRGUx?=
 =?utf-8?B?QXdVMmJwekZIWDhmeEhidlVFMUI2cFJoZlhOVEVIdkZNT3FzSm1wVGduSTFz?=
 =?utf-8?B?UG1BOXU0SzNPRHRyVnZRdUQ4aVl2QzArL2VmWnBGOVNoWENHTjQ5T1NlVDdU?=
 =?utf-8?B?S3RqcTQ4VE9XMDlaakxocm5JQ3FrYlk0bC8wZUNHOExTTSthQ29rSXBCRmhk?=
 =?utf-8?B?QWFxdEtnTHlzUEVSaEs4Yk0rWnRlT3dhbjNmTjJoRUpRQ004akUzWlhTd2dW?=
 =?utf-8?B?ZUE2YnBvVVo3MWEzL2NKNXJDSDBQb2FzOGxmaTVwcjNJZ3I0NXFaY2RIakN1?=
 =?utf-8?B?RmllcHdsMkFSL1pzeDBNZHo5QSt1elVrcEtrZ0N1a01iOGRXVncweDRTSkpN?=
 =?utf-8?B?cHpqazdRazFQalJrWVJnRjhPb0NiNDMzUGhET0MrY2xhenZBcUNiQ01vSnBp?=
 =?utf-8?B?eUxFSUlvZG1xRDBNM04yN0c0TVVDT3FjM05MY2k3YkZlTngwbWpFd05FVTdE?=
 =?utf-8?Q?oM/5GljJcy8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JKbGNwMVBPME9BWVFVN1ZDNGdHakhadkVIZDV1T2Q2dFRZb0xkdnR0SXBP?=
 =?utf-8?B?cFhqSHV2a2VpalRES2k2ZitlZmx1VmRCUlFXTVNWNlh5WXB3L1l0ekltcVFD?=
 =?utf-8?B?NHpqK09tWVFIdHowT1dwaUJBVVBNR09BS3RmRkR1OWxla0pvcTc0MkxUTUZP?=
 =?utf-8?B?dDUvQllUY2d4SjhpcGQyK3NYSzZkSmtwb2cvN3Zydjkra09UUkdsNllZYnN2?=
 =?utf-8?B?NnpieDVldExtZExvdVJpaUExbGFtc1VSMnNOOHk5N1VhUnFiSUFPYjJGczdN?=
 =?utf-8?B?TTRIOEsyemJpNDdCczZ3RTZwRGZQYzIwckdvemNxeVhzeVYxbXk5alFPUGJE?=
 =?utf-8?B?K3hra0kyaDJxQTQwUDdjVndMRUkyYTlkQUdTeXVTZWlkcHhFQXVSclJKNkhC?=
 =?utf-8?B?NFpZMHhLcnltdDNBN1BQLzE4UGFDSXMxL3lKdWluUGVSUUJvanY2T1dJUlpu?=
 =?utf-8?B?bFJYRzE2emVXb2ZVQ2U2SHd1dzJaTFVMUzhhaDBrbDhMaXIrcGlVY2QvVWd2?=
 =?utf-8?B?Uk10bm05cGgxYktOTHRwaWJYcVBTeWliMWlSQ1kwaVdaWVBCSW4wTFlQTVEw?=
 =?utf-8?B?anpVVVBvcERwV3VWdXdyTFhGd3AyWEdUSFFjemVuTkIyQnhiNVNiRjdWZzBM?=
 =?utf-8?B?N2ZVOW96bFpsQUhjNS8ranZKcmRrb2lObklicFZVYlIzcS9NazdzOGNYL3BL?=
 =?utf-8?B?Yjc4ODZFbFBhUXdWRjBuSDhFMGYyZ0YwN1NoeCt1WHBCOWM0WUtZVmQrVTY5?=
 =?utf-8?B?YllpOGVrK2ZFTHdVbnF6UWhqemJISjdadXVLQWR0dUZXRjdWaXMzdmltL1BV?=
 =?utf-8?B?ZEZ1NWxoLzc5dnJPUE1KQ1J2MHdhdm95SHZZanFBdlAwcUxSYkc0aXhISG1t?=
 =?utf-8?B?bnA5eXFpRnlJa1hNQkZHU2N2WURiMWdhQ3djUVh4d0pqVlFPN21lQVhLVGRE?=
 =?utf-8?B?M0hRcEUvYXRMNXlnVmEzSVZIWUxNeXlOOTdGb2w3SFNwaGhDVGhzMXRiTkRh?=
 =?utf-8?B?SlRWUjRUVWsweVRMNC9pU2l5cVl3dklqOEtKRmVkK3pPQmpsUFJveUhNS3JZ?=
 =?utf-8?B?Yy9jaUJnZjJvZjNoa3FCV1VndEZJMnc2RFNzSXRDYUxtWk83Z3NBUDBmS0c1?=
 =?utf-8?B?WXJxVmJxbFdWcVA4U1kyRkUzY01hdVQyTTBCdHVKOTgvSkh0WHlEaDBwZUsz?=
 =?utf-8?B?RmZYNkdEMFJBMWNtcDlrSXIwbVpnMnkvNkI0dHVkcGNWMTlCTXVlYUpDUHk4?=
 =?utf-8?B?L2dmUHF5Mm1iaDZBUzdPLzFucExOMlFzdlhkS0daeEJtTWhUY0lkVnJyeFNI?=
 =?utf-8?B?MmpRNHZ4Tjg4QWZRVHBZUVV3aHZ4M24wcmIzMmJTNjROTFF5Q21sMnRJMlY1?=
 =?utf-8?B?ZGpSamFnQTk4QmJEaWwwSjVSRXlGaVp6UmV0ZnRQbEhkMXU0TXFuZmZVVkVO?=
 =?utf-8?B?bUxNMUtnNjlRbHJJN2Vsd2t6ZWVJcXhNV2tFWEVxUEl3bTRFSGh5bmVJclJv?=
 =?utf-8?B?N29BaWRQTW0xSDI5UFRVYVJHaWZjdjhMdnNxQ21vamFXRStNRGsrbWtHUzh1?=
 =?utf-8?B?ZjBZRm5za213N1M0NjY5SFhBSjlrTmhjemRraWZTUytCMVpqYjRxMEhtdThH?=
 =?utf-8?B?N0FETnN0ODBrd3I1ZGx5MHRTVHU0Z0k3TTUyWnFYMm1TZFVDbTFrRDdWVkFR?=
 =?utf-8?B?WVQvazZnbXEvRG5jSjA0Mmczck54azBBWW9kL0ZhZXJGb0N4WURldjJQYjB4?=
 =?utf-8?B?Yy9EVm4vY0dOanRzTFlad0UvSS8wR2d5VDBCeTVXb0dLREErSDdzVThnRVhI?=
 =?utf-8?B?TXhYVUJ1by9ncXFSdUYzT0VnZFBjL1dIRkc3L1NPOWpjL3U3b3UyQi9ua1JM?=
 =?utf-8?B?YVIyYUdGL1kvM09GSXNHbnRPdDhXWnR2QkUxbG9QRW1ZVjFNRGVKRGRoeGpa?=
 =?utf-8?B?SjNMTEx3d21KQyt1UXdDNnJTa3ZNSnJHTjlQeUVsMnRSWDNuN09KYkwxWXVu?=
 =?utf-8?B?N0hnQS9GWHZjU2sxcDNObW9PbUtXSmZNdWFXM2RDSE5iRlQxZ3MzUCtVWlZZ?=
 =?utf-8?B?eDBWM2Z1NlhZSzZRdVFWSHBQWVcxOXNWSTA0aitpNS9VMlRONWgrZldIU1Q0?=
 =?utf-8?B?UnpLSlNKK0Z2NUxKVHUzK01HZWVNUlNrYVhNd0tLN3liaUV4UlJDWmlLNGcx?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a9391e-da08-449f-92b6-08dddaea4448
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 04:23:06.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SzuLjAhsrIN+9IITyaox0QPkKVbqIJDOqweGiRkR0+G5kgdwBl+BfwOXjK3Pe9s8fteNbwbJf9z10S1/WbA/FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
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

On Wed, Aug 13, 2025 at 07:33:58PM -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 12:51:11PM +0200, Thomas Hellström wrote:
> > Introduce a validation wrapper xe_validation_guard() as a helper
> > intended to be used around drm_exec transactions what perform
> > validations. Once TTM can handle exhaustive eviction we could
> > remove this wrapper or make it mostly a NO-OP unless other
> > functionality is added to it.
> > 
> > Currently the wrapper takes a read lock upon entry and if the
> > transaction hits an OOM, all locks are released and the
> > transaction is retried with a write-lock. If all other
> > validations participate in this scheme, the transaction with
> > the write lock will be the only transaction validating and
> > should have access to all available non-pinned memory.
> > 
> > There is currently a problem in that TTM converts -EDEADLOCKS to
> > -ENOMEM, and with ww_mutex slowpath error injections, we can hit
> > -ENOMEMs without having actually ran out of memory. We abuse
> > ww_mutex internals to detect such situations until TTM is fixes
> > to not convert the error code. In the meantime, injecting
> > ww_mutex slowpath -EDEADLOCKs is a good way to test
> > the implementation in the absence of real OOMs.
> > 
> > Just introduce the wrapper in this commit. It will be hooked up
> > to the driver in following commits.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_validation.c | 199 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_validation.h | 107 ++++++++++++++++
> >  2 files changed, 306 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> > index cc0684d24e02..cd1424f04237 100644
> > --- a/drivers/gpu/drm/xe/xe_validation.c
> > +++ b/drivers/gpu/drm/xe/xe_validation.c
> > @@ -5,6 +5,7 @@
> >  #include "xe_bo.h"
> >  #include <drm/drm_exec.h>
> >  #include <drm/drm_gem.h>
> > +#include <drm/drm_gpuvm.h>
> >  
> >  #include "xe_assert.h"
> >  #include "xe_validation.h"
> > @@ -47,3 +48,201 @@ void xe_validation_assert_exec(const struct xe_device *xe,
> >  	}
> >  }
> >  #endif
> > +
> > +static int xe_validation_lock(struct xe_validation_ctx *ctx)
> > +{
> > +	struct xe_validation_device *val = ctx->val;
> > +	int ret = 0;
> > +
> > +	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
> > +		if (ctx->request_exclusive)
> > +			ret = down_write_killable(&val->lock);
> > +		else
> > +			ret = down_read_interruptible(&val->lock);
> > +	} else {
> > +		if (ctx->request_exclusive)
> > +			down_write(&val->lock);
> > +		else
> > +			down_read(&val->lock);
> > +	}
> > +
> > +	if (!ret) {
> > +		ctx->lock_held = true;
> > +		ctx->lock_held_exclusive = ctx->request_exclusive;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static void xe_validation_unlock(struct xe_validation_ctx *ctx)
> > +{
> > +	if (!ctx->lock_held)
> > +		return;
> > +
> > +	if (ctx->lock_held_exclusive)
> > +		up_write(&ctx->val->lock);
> > +	else
> > +		up_read(&ctx->val->lock);
> > +
> > +	ctx->lock_held = false;
> > +}
> > +
> > +/**
> > + * xe_validation_ctx_init() - Initialize an xe_validation_ctx
> > + * @ctx: The xe_validation_ctx to initialize.
> > + * @val: The xe_validation_device representing the validation domain.
> > + * @exec: The struct drm_exec to use for the transaction.
> > + * @flags: The flags to use for drm_exec initialization.
> > + * @nr: The number of anticipated buffer object locks. Forwarded to
> > + * drm_exec initialization.
> > + * @exclusive: Whether to use exclusive locking already on first validation.
> 
> The last two parameters of this function are always passed as 0 and
> false in this series. Is it worth keeping them? I don’t see a case where

Self correction, I see the shrinker uses exclusive. Same suggestion
though wrt to extending the flags field here for exclusive.

Matt

> nr would ever be non-zero. exclusive is defensible, but it’s still
> unused. Maybe drop both and reserve a bit in flags for a driver-defined
> “exclusive.” That would make the call sites more readable—long argument
> lists make it easy to forget what each parameter means or to transpose
> them.
> 
> > + *
> > + * Initialize and lock a an xe_validation transaction using the validation domain
> > + * represented by @val. Also initialize the drm_exec object forwarding
> > + * @flags and @nr to the drm_exec initialization. The @exclusive parameter should
> > + * typically be set to false to avoid locking out other validators from the
> > + * domain until an OOM is hit. For testing- or final attempt purposes it can,
> > + * however, be set to true.
> > + *
> > + * Return: %0 on success, %-EINTR if interruptible initial locking failed with a
> > + * signal pending.
> > + */
> > +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> > +			   struct drm_exec *exec, u32 flags, unsigned int nr,
> > +			   bool exclusive)
> > +{
> > +	int ret;
> > +
> > +	ctx->exec = exec;
> > +	ctx->val = val;
> > +	ctx->lock_held = false;
> > +	ctx->lock_held_exclusive = false;
> > +	ctx->request_exclusive = exclusive;
> > +	ctx->flags = flags;
> > +	ctx->nr = nr;
> > +
> > +	ret = xe_validation_lock(ctx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_exec_init(exec, flags, nr);
> > +
> > +	return 0;
> > +}
> > +
> > +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> > +/*
> > + * This abuses both drm_exec and ww_mutex internals and should be
> > + * replaced by checking for -EDEADLK when we can make TTM
> > + * stop converting -EDEADLK to -ENOMEM.
> > + * An alternative is to not have exhaustive eviction with
> > + * CONFIG_DEBUG_WW_MUTEX_SLOWPATH until that happens.
> > + */
> > +static bool xe_validation_contention_injected(struct drm_exec *exec)
> > +{
> > +	return !!exec->ticket.contending_lock;
> > +}
> > +
> > +#else
> > +
> > +static bool xe_validation_contention_injected(struct drm_exec *exec)
> > +{
> > +	return false;
> > +}
> > +
> > +#endif
> > +
> > +static bool __xe_validation_should_retry(struct xe_validation_ctx *ctx, int ret)
> > +{
> > +	if (ret == -ENOMEM &&
> > +	    ((ctx->request_exclusive &&
> > +	      xe_validation_contention_injected(ctx->exec)) ||
> > +	     !ctx->request_exclusive)) {
> > +		ctx->request_exclusive = true;
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +/**
> > + * xe_validation_exec_lock() - Perform drm_gpuvm_exec_lock within a validation
> > + * transaction.
> > + * @ctx: An uninitialized xe_validation_ctx.
> > + * @vm_exec: An initialized struct vm_exec.
> > + * @val: The validation domain.
> > + *
> > + * The drm_gpuvm_exec_lock() function internally initializes its drm_exec
> > + * transaction and therefore doesn't lend itself very well to be using
> > + * xe_validation_ctx_init(). Provide a helper that takes an uninitialized
> > + * xe_validation_ctx and calls drm_gpuvm_exec_lock() with OOM retry.
> > + *
> > + * Return: %0 on success, negative error code on failure.
> > + */
> > +int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
> > +			    struct drm_gpuvm_exec *vm_exec,
> > +			    struct xe_validation_device *val)
> > +{
> > +	int ret;
> > +
> > +	memset(ctx, 0, sizeof(*ctx));
> > +	ctx->exec = &vm_exec->exec;
> > +	ctx->flags = vm_exec->flags;
> > +	ctx->val = val;
> > +retry:
> > +	ret = xe_validation_lock(ctx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = drm_gpuvm_exec_lock(vm_exec);
> > +	if (ret) {
> > +		xe_validation_unlock(ctx);
> > +		if (__xe_validation_should_retry(ctx, ret))
> > +			goto retry;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_validation_ctx_fini() - Finalize a validation transaction
> > + * @ctx: The Validation transaction to finalize.
> > + *
> > + * Finalize a validation transaction and its related drm_exec transaction.
> > + */
> > +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> > +{
> > +	drm_exec_fini(ctx->exec);
> > +	xe_validation_unlock(ctx);
> > +}
> > +
> > +/**
> > + * xe_validation_should_retry() - Determine if a validation transaction should retry
> > + * @ctx: The validation transaction.
> > + * @ret: Pointer to a return value variable.
> > + *
> > + * Determines whether a validation transaction should retry based on the
> > + * internal transaction state and the return value pointed to by @ret.
> > + * If a validation should be retried, the transaction is prepared for that,
> > + * and the validation locked might be re-locked in exclusive mode, and *@ret
> > + * is set to %0. If the re-locking errors, typically due to interruptible
> > + * locking with signal pending, *@ret is instead set to -EINTR and the
> > + * function returns %false.
> > + *
> > + * Return: %true if validation should be retried, %false otherwise.
> > + */
> > +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret)
> > +{
> > +	if (__xe_validation_should_retry(ctx, *ret)) {
> > +		drm_exec_fini(ctx->exec);
> > +		*ret = 0;
> > +		if (ctx->request_exclusive != ctx->lock_held_exclusive) {
> > +			xe_validation_unlock(ctx);
> > +			*ret = xe_validation_lock(ctx);
> > +		}
> > +		drm_exec_init(ctx->exec, ctx->flags, ctx->nr);
> > +		return !*ret;
> > +	}
> > +
> > +	return false;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> > index db50feacad7a..a708c260cf18 100644
> > --- a/drivers/gpu/drm/xe/xe_validation.h
> > +++ b/drivers/gpu/drm/xe/xe_validation.h
> > @@ -7,9 +7,11 @@
> >  
> >  #include <linux/dma-resv.h>
> >  #include <linux/types.h>
> > +#include <linux/rwsem.h>
> >  
> >  struct drm_exec;
> >  struct drm_gem_object;
> > +struct drm_gpuvm_exec;
> >  struct xe_device;
> >  
> >  #ifdef CONFIG_PROVE_LOCKING
> > @@ -66,4 +68,109 @@ void xe_validation_assert_exec(const struct xe_device *xe, const struct drm_exec
> >  	} while (0)
> >  #endif
> >  
> > +/**
> > + * struct xe_validation_device - The domain for exhaustive eviction
> > + * @lock: The lock used to exclude other processes from allocating graphics memory
> > + *
> > + * The struct xe_validation_device represents the domain for which we want to use
> > + * exhaustive eviction. The @lock is typically grabbed in read mode for allocations
> > + * but when graphics memory allocation fails, it is retried with the write mode held.
> > + */
> > +struct xe_validation_device {
> > +	struct rw_semaphore lock;
> > +};
> > +
> > +/**
> > + * struct xe_validation_ctx - A struct drm_exec subclass with support for
> > + * exhaustive eviction
> > + * @exec: The drm_exec object base class. Note that we use a pointer instead of
> > + * embedding to avoid diamond inheritance.
> > + * @val: The exhaustive eviction domain.
> > + * @lock_held: Whether The domain lock is currently held.
> > + * @lock_held_exclusive: Whether the domain lock is held in exclusive mode.
> > + * @request_exclusive: Whether to lock exclusively (write mode) the next time
> > + * the domain lock is locked.
> > + * @flags: The drm_exec flags used for drm_exec (re-)initialization.
> > + * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
> > + */
> > +struct xe_validation_ctx {
> > +	struct drm_exec *exec;
> > +	struct xe_validation_device *val;
> > +	bool lock_held;
> > +	bool lock_held_exclusive;
> > +	bool request_exclusive;
> > +	u32 flags;
> > +	unsigned int nr;
> > +};
> > +
> > +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> > +			   struct drm_exec *exec, u32 flags, unsigned int nr,
> > +			   bool exclusive);
> > +
> > +int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct drm_gpuvm_exec *vm_exec,
> > +			    struct xe_validation_device *val);
> > +
> > +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
> > +
> > +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
> > +
> > +/**
> > + * xe_validation_retry_on_oom() - Retry on oom in an xe_validaton transaction
> > + * @_ctx: Pointer to the xe_validation_ctx
> > + * @_ret: The current error value possibly holding -ENOMEM
> > + *
> > + * Use this in way similar to drm_exec_retry_on_contention().
> > + * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
> > + * blocks other transactions and allows exhastive eviction. If the transaction
> > + * was already restarted once, Just return the -ENOMEM. May also set
> > + * _ret to -EINTR if not retrying and waits are interruptible.
> > + * May only be used within a drm_exec_until_all_locked() loop.
> > + */
> > +#define xe_validation_retry_on_oom(_ctx, _ret)				\
> > +	do {								\
> > +		if (xe_validation_should_retry(_ctx, _ret))		\
> > +			goto *__drm_exec_retry_ptr;			\
> > +	} while (0)
> > +
> > +/**
> > + * xe_validation_device_init - Initialize a struct xe_validation_device
> > + * @val: The xe_validation_device to init.
> > + */
> > +static inline void
> > +xe_validation_device_init(struct xe_validation_device *val)
> > +{
> > +	init_rwsem(&val->lock);
> > +}
> > +
> > +/*
> > + * Make guard() and scoped_guard() work with xe_validation_ctx
> > + * so that we can exit transactions without caring about the
> > + * cleanup.
> > + */
> > +DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> > +	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,
> > +	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags, 0, _excl);
> > +	       _ret ? NULL : _ctx; }),
> > +	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
> > +	     struct drm_exec *_exec, u32 _flags, int _ret, bool _excl);
> > +static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
> > +{return *_T; }
> > +#define class_xe_validation_is_conditional false
> > +
> > +/**
> > + * xe_validation_guard() - An auto-cleanup xe_validation_ctx transaction
> > + * @_ctx: The xe_validation_ctx.
> > + * @_val: The xe_validation_device.
> > + * @_exec: The struct drm_exec object
> > + * @_flags: Flags for the drm_exec transaction. See the struct drm_exec documention!
> > + * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
> > + * @_excl: Whether to start in exclusive mode already in the first iteration.
> > + *
> 
> Same comment as above on function xe_validation_ctx_init wrt to
> arguments.
> 
> Matt
> 
> > + * This macro is will initiate a drm_exec transaction with additional support for
> > + * exhaustive eviction.
> > + */
> > +#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
> > +	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
> > +	drm_exec_until_all_locked(_exec)
> > +
> >  #endif
> > -- 
> > 2.50.1
> > 
