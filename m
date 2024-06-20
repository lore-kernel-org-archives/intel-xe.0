Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C14FC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 16:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCE610EB4F;
	Thu, 20 Jun 2024 16:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2OTc0YQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40E610EB4F
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 16:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718902009; x=1750438009;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zTiTbUkQZXiDNVaZLtUZh4PKWF53LVwtGavRmKRofX0=;
 b=W2OTc0YQ7OeLq5lLS8ltAvE/P6IVPdU1OXVSbSp6SOb/f1Q5d1QPswGw
 tk01GkL5mLJW60QolCxNOfDIyjKuBDmweFphjlcgq00xwDRLNmN12fqlT
 8Yu93tzdkKh31Ew2cBAHMQdnENmnHvtycrj1bFN3BeOVToiFcF1/Y9Gt5
 AL74G4gUF1o8X3pk1H7KF6EBbKajCZfdjrcBWx2DZ4Axqf8lyfGnCa3yy
 vWLE23QV2JLW/iX6Vaoe1ruH8q/yfH2uafVsOR20++8zWPGYGnb3WhtRR
 KXhjCX21GaQTXoIYcthUyep0MnqjsyxgkUqNxCxHMocNIVAPU+PYHeHrW A==;
X-CSE-ConnectionGUID: K4oIpMi1TVSXW7/C3E5PMg==
X-CSE-MsgGUID: CkQPO6lTQ1WVhiMf3XzVxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15657766"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15657766"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 09:46:48 -0700
X-CSE-ConnectionGUID: h3xgCKtfSF+QPE6wk4BDEw==
X-CSE-MsgGUID: lF5pnh37RRqKTt4zC3zGBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="46659865"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 09:46:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 09:46:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 09:46:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 09:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDAi8qiH2x2zGBIAF68Z8ND182CNVN7c2POg/P8/ZSgJyJ8HI95kaAXWu5tPteHZZmgYlnh/PYFVcEvYJcEFrKPIl+D/LOMHFv8/zf72/ItE+f9ZmGvO8jNoWM/X/JcAHjYYA4gyg6aCUd7Wn8I3PnWRKdgOWJQBppRbtWhgKMWkgPTGhIgDbGGDpRFEYWOoa/PG98oEfys8G5Ls1Ml3WQfm5iQSFt6RPs+4/FzaTcG/+sJB++QRNpzBxmf4IKDe8Ft0BInA074XrnExfkftFFc9bQ5MFLduycn0Uil7Re/D9tkEhQGAL5qarP1hETyjR9VuIG2d47tTI2bp/dY6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqlJdndN8EnuUg4GtfTFf6jHGg0h7T/pVFa3bY2L03Y=;
 b=TFkXV5rVuA/WrM453uqj2FR8vE2FIqwJYoyIfHWCYMa/r6DTX7yoGaGy7o8lQDPwG+PiiSquKEZMWVq/tx11278va9GEbpi9A1khkrjTuKviSSI5x7GfEIkkEswzP+8XiuvrxnvKVB38uI8DSATJrNhNBCQkdwmO4Y2UTzKwFZ6Vpjzbv5AwifWkrb8SQiSbYX9EI8u9O5dKgNmMBggEx6Ia3gDVI+E7kNtuk3oJNNAoY/QzBACouoYSoKAna3IrEE5TsMQpQ9EDHeFAk2JleFx3Yt+3IacYwEv1SjFd4v0saiaO9+vAHcDj658IRWfNwMjGvXr1GjFhqnMOgn3Hwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 16:46:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 16:46:18 +0000
Date: Thu, 20 Jun 2024 09:46:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74
Message-ID: <20240620164615.GS2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240619065614.131151-1-sai.teja.pottumuttu@intel.com>
 <171881349010.125140.2782820743321356720@a6498e030952>
 <BYAPR11MB323894C3BCA1459040C7E2B4A9C82@BYAPR11MB3238.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB323894C3BCA1459040C7E2B4A9C82@BYAPR11MB3238.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR06CA0057.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d714a3-6bb7-4279-1d7b-08dc91488202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmtGT2RWNm9FbVUraDlrRnFWL0Qyd0twRzRIVnNoclZweTZsNnVHcDU1Rkdn?=
 =?utf-8?B?a0tjTS82alM3SW5takxRSUZqNmliellYL2VjOVgramhDTEl1eE5maFZXd29m?=
 =?utf-8?B?SkNwNzFUNzIxTW5tdWdIV21aYUZUNWdZUjJMSzJ0MnlGL05IVnk3UTZhanNo?=
 =?utf-8?B?Z3ZUTS9ya1Z4T1VET0kvN2x2RklzOEVVWGxNaDd5eDJtM2YrQmxRWDlKakQr?=
 =?utf-8?B?THMwb2ZqSVdsNmtFZVc4TjdVYWRvLzRqZWR4UXU0OVYrSm0yWVY0cUE4OHJp?=
 =?utf-8?B?OERGckpQVU5RTnNRT2xtRXlVMUNQV01GZFM0YmRnbWZ4NGlnRzRHMitqUnBF?=
 =?utf-8?B?amRTQlI4N29kbEJyMDdwcU9CMmRCUHVQT25WaGtoMDRlTzJ3UkgzQmVkTXNY?=
 =?utf-8?B?UCtQTFJacngyR3dEcWJZNldEM0cvU0cycVdReU5iajF4S29zUHhuQ1dWMjUz?=
 =?utf-8?B?QUdyeWdPNVJ2UHZEazBWL25vTFFYUUFjZVJVaW1laytFQUp5UUdQdy9lNmdi?=
 =?utf-8?B?NVNEd2xkbGNPZXJmWFp4V1daTU9yY1poU3lwT2RJbXpZdVQ4YU5Wb21wTWFX?=
 =?utf-8?B?TTZoUG8rZGowSXc4dFNxY2NUMUY4L1dHUllRaDhLSys1K3BLQWR5dkhxYXJU?=
 =?utf-8?B?MUd6eS9JODZhcXIwZzhNTVRPOWpDaWxrdzg5R3laOFlvNmQvWk5peDVYVGdT?=
 =?utf-8?B?VXl3VlkwaEdWRDdFSy9nWFdkaWNjdHF0UW9zNmhHN2gyQjhkMSsxYjJHcTJq?=
 =?utf-8?B?ZWJzSjZZd2hMbXJhNVl6c1BqcXM5aHpRMjJKR0w5TUt6SmNLTEJVeGQzamJ2?=
 =?utf-8?B?RGNzZ2lVS01DK0JZdE5Gdlo5WStROWJ4TWRZNGw2WGhpcDhaTG42cWhMbzh2?=
 =?utf-8?B?OWFXcitQNExqT3V5eEtPa3ZoV0dMakM0Q1hJSGZscm5ZTHpLVnBaQlZPUGhY?=
 =?utf-8?B?SEdnUFZZZER6QTY4SS9wMmRzdUNjK3Z3TlhHWFV0MXNiOWFYRWx4WXRKeHdK?=
 =?utf-8?B?aWZ1dGxkWDFXazZoYWRNbWQyUnRmNkM0VlJ2RUhQYUJZN3lkMDlIY1AzUUEr?=
 =?utf-8?B?RHNlOXR3ZFZoUVUwUHZCdnoyUEFFL2VuaTUxdzVSckhpVkNWRFU4NXdLK1NF?=
 =?utf-8?B?TGViZVZUSHNYQjFST0YrTWNnV1J0QWEwTUJDR2hWV1JLNnNnOUZobXpxQ1kr?=
 =?utf-8?B?T3ZhUTFrSUZiSkVHdHlZSWJ5OUZtNDlreSt5ODZ4anBHN0hjSTF5UmRpOTZV?=
 =?utf-8?B?SGI5K1ZSZkRSSG5wellxbisyMHNCMEJ6VXBqZmw3VHI1VDYyYmQ3MFBZbEhv?=
 =?utf-8?B?NU13TWtqVDZ5NS9BUGFVLzhqVmc5TzNvTGs4b2dmSFZZOUNlVGFwaUZSQ1NQ?=
 =?utf-8?B?LzNaU0pwZkl6SU9ZTzdGUHdqOGczSEd6V3pxam5JbzZxeHZkNEpVaVkyNjdU?=
 =?utf-8?B?aDdHZThweFVVTXNjS2tGY1ZBdlVIUFFQVXl6OUNkT3ZpYWZoQ2gzVU9wbk16?=
 =?utf-8?B?K0NsQzhuK2xjNWlzYWI2STRTSHVNcnNlZEFPZzdvcitxc1Q3L3FhMzRHUlZQ?=
 =?utf-8?B?QTR5bVpidWtLUGpPT01OU0doalQzMzhoeTJzUlEyaTZkZG5xemRqemdXWlZJ?=
 =?utf-8?B?ZEx6SHFwN3B5ckhUNHJOSm1iU0Z1cXM0aVNBZ0FyMExzWmFQNE9QbXJuNC9v?=
 =?utf-8?B?NHpEeGZLanVUSXJpcnRBR3plSFNqQWFTakdnS3FTdEVyelMzUnM5ay9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWNtSm1pVm5xdGE1WmVaU1Q3bXg0YmxXY0JsUy8yQ1hlNG5wcW91clFJZWRR?=
 =?utf-8?B?YUxkL3Vxb2kyQjljeHpXL3ltY3p6SWg1MWZUQm9CaXRGNXpHYUJCeVZENk9N?=
 =?utf-8?B?YWZxQ3lnRmNwOUUyUldjT1FZZG4waHFzeENVZ3M1cHc0OEZvSGxQTHpUVTNn?=
 =?utf-8?B?cUx4cjhXRTZNOE8wM1hIbHFldVJ2cy8rU0Z0R2p4UnF2bUJ4aHNuSXNFTnN1?=
 =?utf-8?B?Y2FkNWI0aEtxUjU0LzRhRGpiTlJPdlhIMTFraHZhM3loN0RxY2JEdExQdm5i?=
 =?utf-8?B?Q2pWNXFUUUx0TEpQOXJQUDdkRUpIWDBncTdqNUdzc0hSRVRHKytZT1l4RWdW?=
 =?utf-8?B?QmFBUnBJeFYwblFFQUdsZS9ERDNTQU91MHJLY29CMEtGeVBtckpDcHJWK3B2?=
 =?utf-8?B?TXRjQlJhc2RqSGVnRVp3c0NRVys5aHNtSFYzRy9IZTczQUwzY1hWRmZIWHNP?=
 =?utf-8?B?bllTMHpYUWM5cEwwL1AxRGZNOUZOOHFjVmNzZDZRM0dyQVZ6bUhXeXloaGhM?=
 =?utf-8?B?TExCbVRScEphMjdNREt4UXk4Q3J4bWY5dHJMSi80R3g5VVBzUUhHbnpGQWsy?=
 =?utf-8?B?R0RQVWNIZkYraUtJTExxSjd0a3ZYSDBJVjdKQWN1cEV5TzBia0xGR2o1WHMv?=
 =?utf-8?B?dFpjUTRNNmdaWnZBQjNYMFFJNEtJNXV1aml2VHV1dXVEQXpoTHVPemlQVEpJ?=
 =?utf-8?B?NzRMYUh0S3NOazZvdFcvMVluYUVCV0FVK2lGeGZBNXZaaDduTklxVHBuSFl4?=
 =?utf-8?B?UHE1cGZzSzRZYjlxVHJVY01xTTlyQnJTRkpXTWF5VzhtZ1VxQVpqQXNGbkxy?=
 =?utf-8?B?VjBMalNhdnV3TWFsMFBocVZCbW55TG5wTlpKRGQydUd3ZWpUd3QvVEd5RnBE?=
 =?utf-8?B?MkcvUEc2UXd4VkUzVWU0SDkzZ1pYcVVvbWp6L1I2S1pkelVvMXBaOEFSTFZE?=
 =?utf-8?B?dEdkRm5teVpPVVlORTZWOGlTdHVhTlVQek1zSThmVUd0L1orVHo2ckdYdHdr?=
 =?utf-8?B?WTVPdHRuVncvc2dFSlJ0cTIrc2NSZlVUTTRPZkoxL0s0TFA0bkhQTmRaTXBi?=
 =?utf-8?B?dkVzNHV6VHZUa1VSSE4vQ1hFVGZqS1ZSVkhJK1VpdzAxN3ZmU0pBYlErLzRF?=
 =?utf-8?B?ZDc5MjArd1RudlpsS1ZiVWFGTGE0ZE1SRmU2MXFiVWM4MFhFbzZBVENKV0R5?=
 =?utf-8?B?WjhmdXhidGlVK0dBakNFVHBlYnRjcVpzVHpqS1ZGTDBwNjVFcWZIbGlqQnVs?=
 =?utf-8?B?VXAxdVg0Tk43RmF6UDRnakkwWlJFVCtHWS9DYXM5QmZrWCsrODJWdDlyVjZN?=
 =?utf-8?B?ek45aXY1NTF2UHpOUmpNTmxIYk14Ty9US0lzbStPSVdLbVdEM2xsMmRMVjcz?=
 =?utf-8?B?Z2svZWV1ZjJBOWJoZlFTWXBSSkp4aDd3NzZzcEQ5V3FIWGpFL0c1RzhseXVZ?=
 =?utf-8?B?bll3ODN6SDFBOVF2U3dXNjEzQ1BrME04UzV2US9kSE91Tmlua3Zldmdxd3ZR?=
 =?utf-8?B?NXh0NnJldHpySGRmTndwVXZIelVMNFB6MnNZbVg0YWxtQlpoQTFDQkI5Rjhn?=
 =?utf-8?B?Y0VoaFBQOThiMm9XQTY2QmVIdkFyV09yV2tJbi9lRVZ5Um5sKytGUUc1RDlQ?=
 =?utf-8?B?YUtVN1dlV3pNaW5pSG1vTGVjK1p4L2tLOUZwcHpEL2wxTWFweGROZUNjeEc3?=
 =?utf-8?B?UWRiRGI1MmxyTFdPSWtsSEhNdEwyVVhGQUtDNDF0R1VPOThIOVI1WnZwWHpN?=
 =?utf-8?B?Zk1oVkEydFJ0cG1WeXRVWFJyTXJTeXBwNERrQXVjSTUvRXNkVzdlWlE3eWFo?=
 =?utf-8?B?ejROTm1SNkJUVHpnbWV5WGdxbEV2V2g4WFRtWnBjV2JHeklsVlV4TTY5Zlo5?=
 =?utf-8?B?TjMrWFZVeDZHY05saCtxWE5DZVRjUFBzQm1vUExSUjJuSUxOZVNFTDdmaFBC?=
 =?utf-8?B?NjllY0thNDVLcy9xRmxsM2UyTVVaRm15MXA3UlRHWFBYcWZ0SHlvL1VlQk9R?=
 =?utf-8?B?TTNMNlVmWXQ5MVh4ZVM1Ry8xb0FCUlI3VjdaMDVldTE0NFpibDNsUWs5VmpR?=
 =?utf-8?B?WHZjMDNFNis1UThYd1BINUhLSkJ5ZmN4YUZpdnMyKzBVbkJUaUJTQ0E3SVRH?=
 =?utf-8?B?Q2VvLzhyWThvQW5zZzNCSGNZNU5WT2pnQ003RzRlSnRSM0V6VnVsUEcwaTF2?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d714a3-6bb7-4279-1d7b-08dc91488202
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 16:46:18.7214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AyxE8wravRUdTwtf2ynr4ypspYUczFIWtYO3KKBFwB3NxhX7/2MAjsUZ4VqQ5pOx8RakHu7RzvAGAAHsPu7UPvMuWcIazkC7P7DD6skJN84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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

On Thu, Jun 20, 2024 at 08:56:45AM +0000, Pottumuttu, Sai Teja wrote:
> The reported failures are on the platforms not impacted by this patch. So, we can ignore these.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: Wednesday, June 19, 2024 9:42 PM
> To: Pottumuttu, Sai Teja <sai.teja.pottumuttu@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: ✗ CI.FULL: failure for drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74
> 
> Patch Details
> Series:
> drm/xe/xelpgp: Extend Wa_14019877138 to graphics 12.74
> URL:
> https://patchwork.freedesktop.org/series/135046/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/index.html
> CI Bug Log - changes from xe-1494-fcea62a0d6954dcce241d22785597ba416a18076_full -> xe-pw-135046v1_full
> Summary
> 
> WARNING
> 
> Minor unknown changes coming with xe-pw-135046v1_full need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-135046v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org<mailto:I915-ci-infra@lists.freedesktop.org>) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (3 -> 3)
> 
> No changes in participating hosts
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-135046v1_full:
> 
> IGT changes
> Warnings
> 
>   *   igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656<https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html>
> 
> Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *   igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>      *   {shard-lnl}: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-8/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html> +1 other test dmesg-warn
>   *   igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
>      *   {shard-lnl}: NOTRUN -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html> +1 other test dmesg-warn
> 
> Known issues
> 
> Here are the changes found in xe-pw-135046v1_full that come from known issues:
> 
> IGT changes
> Issues hit
> 
>   *   igt@kms_big_fb@4-tiled-addfb:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619<https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>   *   igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
>   *   igt@kms_big_fb@linear-32bpp-rotate-270:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests skip
>   *   igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>      *   shard-adlp: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *   igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>      *   shard-adlp: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1874<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *   igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *   igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1 other test skip
>   *   igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-c-dp-4.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6 other tests skip
>   *   igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +14 other tests skip
>   *   igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9 other tests skip
>   *   igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#314<https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +4 other tests skip
>   *   igt@kms_chamelium_color@ctm-max:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306<https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *   igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *   igt@kms_chamelium_hpd@vga-hpd-fast:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-fast.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *   igt@kms_cursor_crc@cursor-offscreen-512x170:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308<https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *   igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910<https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>   *   igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#309<https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests skip
>   *   igt@kms_cursor_legacy@forked-bo@all-pipes:
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-466/igt@kms_cursor_legacy@forked-bo@all-pipes.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +6 other tests dmesg-warn
>   *   igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#310<https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +3 other tests skip
>   *   igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *   igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html> -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *   igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +10 other tests skip
>   *   igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html> (Intel XE#1874<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *   igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656<https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +19 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbc-1p-rte:
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html> -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-rte.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +8 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651<https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4 other tests skip
>   *   igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653<https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>   *   igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653<https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +4 other tests skip
>   *   igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html> (Intel XE#361<https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>)
>   *   igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498<https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1 other test skip
>   *   igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498<https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2 other tests skip
>   *   igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305<https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>   *   igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305<https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +5 other tests skip
>   *   igt@kms_pm_backlight@fade-with-dpms:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870<https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *   igt@kms_pm_dc@dc3co-vpb-simulation:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *   igt@kms_pm_rpm@dpms-non-lpsp:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#836<https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>   *   igt@kms_pm_rpm@legacy-planes-dpms:
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms.html> -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1211<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>)
>   *   igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *   igt@kms_psr@psr-sprite-plane-onoff:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *   igt@kms_psr@psr-suspend:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_psr@psr-suspend.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7 other tests skip
>   *   igt@kms_rmfb@close-fd:
>      *   shard-dg2-set2: NOTRUN -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@kms_rmfb@close-fd.html> (Intel XE#294<https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>) +2 other tests fail
>   *   igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327<https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *   igt@kms_universal_plane@cursor-fb-leak:
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771<https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> / Intel XE#899<https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>   *   igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html> (Intel XE#899<https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1 other test fail
>   *   igt@sriov_basic@enable-vfs-bind-unbind-each:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1932<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932>)
>   *   igt@xe_ccs@block-copy-compressed:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_ccs@block-copy-compressed.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488<https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>   *   igt@xe_evict@evict-beng-cm-threads-small:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_evict@evict-beng-cm-threads-small.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#261<https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) +3 other tests skip
>   *   igt@xe_evict@evict-cm-threads-large:
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_evict@evict-cm-threads-large.html> -> INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html> (Intel XE#1195<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392<https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>   *   igt@xe_evict@evict-threads-large:
>      *   shard-dg2-set2: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@xe_evict@evict-threads-large.html> -> TIMEOUT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@xe_evict@evict-threads-large.html> (Intel XE#1473<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392<https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) +1 other test timeout
>   *   igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#688<https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *   igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +16 other tests dmesg-warn
>   *   igt@xe_exec_basic@multigpu-no-exec-null:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1392<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2 other tests skip
>   *   igt@xe_exec_basic@twice-userptr-rebind:
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_basic@twice-userptr-rebind.html> -> INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-2/igt@xe_exec_basic@twice-userptr-rebind.html> (Intel XE#1195<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *   igt@xe_exec_fault_mode@once-userptr:
>      *   shard-dg2-set2: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288<https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>   *   igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288<https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +9 other tests skip
>   *   igt@xe_exec_reset@cm-cat-error:
>      *   shard-adlp: NOTRUN -> DMESG-FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html> (Intel XE#1962<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962>)
>   *   igt@xe_exec_reset@parallel-cat-error:
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_exec_reset@parallel-cat-error.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_exec_reset@parallel-cat-error.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#358<https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>) +1 other test dmesg-warn
>   *   igt@xe_module_load@force-load:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_module_load@force-load.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#378<https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *   igt@xe_pat@display-vs-wb-transient:
>      *   shard-adlp: NOTRUN -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1337<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>   *   igt@xe_pm@s4-exec-after:
>      *   shard-adlp: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-6/igt@xe_pm@s4-exec-after.html> -> ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html> (Intel XE#1358<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
> 
> Possible fixes
> 
>   *   igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>      *   shard-adlp: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#324<https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html> +2 other tests pass
>   *   igt@kms_cdclk@mode-transition:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cdclk@mode-transition.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cdclk@mode-transition.html> +8 other tests pass
>   *   igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html> +17 other tests pass
>   *   igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html> +3 other tests pass
>   *   igt@kms_cursor_legacy@single-move@pipe-a:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-a.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#877<https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@single-move@pipe-a.html>
>   *   igt@kms_cursor_legacy@torture-move:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@torture-move.html> (Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@torture-move.html> +1 other test pass
>   *   igt@kms_fbcon_fbt@psr-suspend:
>      *   {shard-lnl}: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html> -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html> +4 other tests pass
>   *   igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
>      *   {shard-lnl}: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html> (Intel XE#886<https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html> +1 other test pass
>   *   igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>      *   shard-adlp: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> +1 other test pass
>   *   igt@xe_evict@evict-beng-mixed-threads-large:
>      *   shard-dg2-set2: TIMEOUT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1473<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392<https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html>
>   *   igt@xe_evict@evict-mixed-threads-large:
>      *   shard-dg2-set2: INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1195<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1473<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392<https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html>
>   *   igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>      *   {shard-lnl}: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-3/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html> (Intel XE#1069<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html>
>   *   igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
>      *   shard-dg2-set2: INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html> (Intel XE#1169<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169> / Intel XE#1195<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1356<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html>
>   *   igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html> (Intel XE#1130<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html> +24 other tests pass
>   *   igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
>      *   {shard-lnl}: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-lnl-3/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html> (Intel XE#1330<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330> / Intel XE#1622<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-lnl-8/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html>
>   *   igt@xe_pm@s4-mocs:
>      *   shard-adlp: ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@xe_pm@s4-mocs.html> (Intel XE#1794<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pm@s4-mocs.html>
>   *   igt@xe_pm@s4-vm-bind-unbind-all:
>      *   shard-adlp: ABORT<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1601<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1601> / Intel XE#1794<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html>
>   *   igt@xe_vm@mmap-style-bind-userptr-either-side-full:
>      *   shard-dg2-set2: DMESG-FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-either-side-full.html> (Intel XE#1760<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) -> PASS<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_vm@mmap-style-bind-userptr-either-side-full.html>
> 
> Warnings
> 
>   *   igt@kms_async_flips@async-flip-with-page-flip-events:
>      *   shard-adlp: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html> (Intel XE#1033<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#324<https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html> (Intel XE#1033<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *   igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html> (Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests skip
>   *   igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *   igt@kms_big_fb@y-tiled-16bpp-rotate-90:
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316<https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *   igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +7 other tests skip
>      *   shard-adlp: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html> (Intel XE#1874<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *   igt@kms_big_fb@y-tiled-addfb:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619<https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html> (Intel XE#619<https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>   *   igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>      *   shard-adlp: DMESG-FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#324<https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +2 other tests fail
>   *   igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7 other tests skip
>   *   igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *   igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *   igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *   igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367<https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *   igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html> (Intel XE#1252<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *   igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +15 other tests skip
>   *   igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +55 other tests skip
>   *   igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *   igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html> (Intel XE#1252<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>   *   igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2 other tests skip
>   *   igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html> (Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +69 other tests skip
>   *   igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787<https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +19 other tests skip
>   *   igt@kms_chamelium_audio@dp-audio-edid:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html> (Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_chamelium_audio@dp-audio-edid.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8 other tests skip
>   *   igt@kms_chamelium_color@ctm-0-50:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306<https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306<https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *   igt@kms_chamelium_color@ctm-0-75:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html> (Intel XE#306<https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306<https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *   igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>   *   igt@kms_chamelium_frames@hdmi-frame-dump:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_chamelium_frames@hdmi-frame-dump.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html> (Intel XE#373<https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3 other tests skip
>   *   igt@kms_content_protection@atomic@pipe-a-dp-4:
>      *   shard-dg2-set2: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-464/igt@kms_content_protection@atomic@pipe-a-dp-4.html> (Intel XE#1178<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) -> INCOMPLETE<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html> (Intel XE#1195<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>   *   igt@kms_content_protection@dp-mst-lic-type-1:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307<https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307<https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *   igt@kms_cursor_crc@cursor-offscreen-512x512:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#308<https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308<https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308<https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *   igt@kms_cursor_crc@cursor-onscreen-512x512:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308<https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#308<https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *   igt@kms_cursor_edge_walk@256x256-top-bottom:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_cursor_edge_walk@256x256-top-bottom.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html> (Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +5 other tests dmesg-warn
>   *   igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html> (Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +5 other tests dmesg-warn
>   *   igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323<https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *   igt@kms_cursor_legacy@single-move:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_cursor_legacy@single-move.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#877<https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-464/igt@kms_cursor_legacy@single-move.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282<https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>)
>   *   igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1551<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html> (Intel XE#1551<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) +1 other test dmesg-warn
>   *   igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *   igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +11 other tests skip
>   *   igt@kms_force_connector_basic@prune-stale-modes:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#5274<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *   igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656<https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4 other tests skip
>   *   igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#651<https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651<https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +21 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651<https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html> (Intel XE#651<https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +23 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651<https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651<https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653<https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#653<https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +20 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653<https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2 other tests skip
>   *   igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel XE#658<https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#658<https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *   igt@kms_frontbuffer_tracking@plane-fbc-rte:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>   *   igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653<https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +4 other tests skip
>   *   igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#653<https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653<https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +22 other tests skip
>   *   igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#305<https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305<https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests skip
>   *   igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>      *   shard-adlp: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305<https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *   igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#305<https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305<https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +5 other tests skip
>   *   igt@kms_pm_backlight@basic-brightness:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html> (Intel XE#870<https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870<https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *   igt@kms_pm_backlight@fade:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_pm_backlight@fade.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870<https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_pm_backlight@fade.html> (Intel XE#870<https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *   igt@kms_pm_rpm@basic-rte:
>      *   shard-adlp: FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html> (Intel XE#1203<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@kms_pm_rpm@basic-rte.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *   igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html> (Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +13 other tests skip
>   *   igt@kms_psr@fbc-pr-no-drrs:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html> (Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +14 other tests skip
>   *   igt@kms_psr@pr-basic:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_psr@pr-basic.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_psr@pr-basic.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929<https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3 other tests skip
>   *   igt@kms_rotation_crc@primary-rotation-270:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327<https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#327<https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1 other test skip
>   *   igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#2575<https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327<https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *   igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1500<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1500<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>   *   igt@kms_vblank@ts-continuation-dpms-suspend:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html> (Intel XE#1551<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1551<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) +1 other test dmesg-warn
>   *   igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
>      *   shard-adlp: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1191<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *   igt@kms_vblank@ts-continuation-suspend:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html> -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +1 other test dmesg-warn
>   *   igt@kms_vrr@flipline:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_vrr@flipline.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_vrr@flipline.html> (Intel XE#455<https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +11 other tests skip
>   *   igt@kms_writeback@writeback-check-output-xrgb2101010:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756<https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (Intel XE#756<https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *   igt@sriov_basic@enable-vfs-autoprobe-off:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>)
>   *   igt@xe_copy_basic@mem-set-linear-0xfffe:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1130<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *   igt@xe_exec_fault_mode@twice-basic-imm:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_exec_fault_mode@twice-basic-imm.html> (Intel XE#1130<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-basic-imm.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288<https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +4 other tests skip
>   *   igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288<https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html> (Intel XE#288<https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +18 other tests skip
>   *   igt@xe_exec_fault_mode@twice-userptr-prefetch:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html> (Intel XE#288<https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-prefetch.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288<https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +18 other tests skip
>   *   igt@xe_huc_copy@huc_copy:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_huc_copy@huc_copy.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#255<https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html> (Intel XE#255<https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>   *   igt@xe_media_fill@media-fill:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_media_fill@media-fill.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#560<https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_media_fill@media-fill.html> (Intel XE#560<https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>   *   igt@xe_mmap@small-bar:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_mmap@small-bar.html> (Intel XE#1130<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_mmap@small-bar.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#512<https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *   igt@xe_pat@pat-index-xe2:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_pat@pat-index-xe2.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#977<https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html> (Intel XE#977<https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>   *   igt@xe_pat@pat-index-xelpg:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979<https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979<https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *   igt@xe_pm@d3cold-basic-exec:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366<https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#366<https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *   igt@xe_pm@s3-d3hot-basic-exec:
>      *   shard-adlp: WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html> (Intel XE#1639<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html> (Intel XE#1191<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1727<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html> (Intel XE#1551<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> / Intel XE#569<https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1551<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> / Intel XE#569<https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *   igt@xe_pm@s3-multiple-execs:
>      *   shard-dg2-set2: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-463/igt@xe_pm@s3-multiple-execs.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1551<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> / Intel XE#569<https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html> (Intel XE#1551<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> / Intel XE#569<https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *   igt@xe_pm@s3-vm-bind-prefetch:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html> (Intel XE#1130<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130> / Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#569<https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *   igt@xe_pm_residency@gt-c6-freeze:
>      *   shard-adlp: DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#1191<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1941<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-2/igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#1191<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *   igt@xe_query@multigpu-query-hwconfig:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html> (Intel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *   igt@xe_query@multigpu-query-uc-fw-version-huc:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html> (Intel XE#1201<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944<https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *   igt@xe_wedged@wedged-at-any-timeout:
>      *   shard-dg2-set2: SKIP<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1130<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> DMESG-FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1760<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
>      *   shard-adlp: DMESG-FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/xe-1494-fcea62a0d6954dcce241d22785597ba416a18076/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1760<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) -> DMESG-WARN<https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135046v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1214<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1760<https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>   *   Linux: xe-1494-fcea62a0d6954dcce241d22785597ba416a18076 -> xe-pw-135046v1
> 
> IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1494-fcea62a0d6954dcce241d22785597ba416a18076: fcea62a0d6954dcce241d22785597ba416a18076
> xe-pw-135046v1: 135046v1

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
