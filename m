Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B50AE9A03B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 03:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC9D10E169;
	Thu, 19 Feb 2026 03:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMCsy7N0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429E610E169
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 03:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771472817; x=1803008817;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GtrHuG8tOF6b5tb+arEi0u4CocoJFWzTqyaJInM958E=;
 b=RMCsy7N09hRuDdmi+09Z3LWx1H1sSQHL5XZ++4JeyYkyAJJVXDEOBo6n
 LcFSChtlGYonSmYQI8NoiYH1FK/DgwvkiYFQ+E39qnmUTaZmsUgifq2Tp
 baFDYLqS9+w320Tb04LmYJZ0G+rBM6kmjQtLueZABj8vBVqhyxJXuOKL8
 IF+APJKHt0PR/QurqVRYTZ9lvh995bwxVrIUCRWwQuIJ7evqmSpl1VEHQ
 iz2jIujE9EQtTzrAMGqiSX24MnJqy6IQ6htdiAsUvy2gFpbrnZgFASvu0
 /BtxZBUVjlVqBOpcH1IZl3818xSrsoEp4Y7Ry/F3xRYWf79REeqh6+FZm Q==;
X-CSE-ConnectionGUID: pPHa+qmDTq2/4M3b+JwmoQ==
X-CSE-MsgGUID: p6x5y4dlQmOjh3C3CFgquw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72548283"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72548283"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 19:46:56 -0800
X-CSE-ConnectionGUID: ERY5DCXJRO+vgCHx9IALxQ==
X-CSE-MsgGUID: r/67F3PzSDO6rlkJac1pDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="213104802"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 19:46:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 19:46:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 19:46:56 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.18) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 19:46:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpSWlTawZIz+PGIS+CWTjEhKYWaaoMIdK47Ho6VPiuoi5uhtW6WY5I4AM7Vw4NC4NZPRXb/eRRunA28+JD3s6fXXGTPaYaogoaK0i+TbOE8S0pF9GcpfzbiTMxBPBPeHo/iKWQZVcEVTc9lIKLx1v7O/U1eCOwVpRfbZPM6u0n/kd4Ter93D9chNEYqkN9/f9j7WFsFCgP0IKNUFwGNI3D7fST68MmftCFFYSILrYQaR0/DskUKoDxSBCECTgFFpO8dViwJKEQnORYhod+IAsBUCHE8XCTEF4bMvF9rw2dxzaUU2LnNSnBt1BB8hGx/ZwfamEbOgOwjljGAuYNhXIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6XXd+mQJNXdU1S2Rnrms0H6zrGyc/1cII2jZyIPwX8=;
 b=hFG7EsAFMj9Rpz3+kKPd3OXERatrSH1MvfiOJb65E/+40a+0YGKvY7/A9DTJBdI5O/6JKNssPkhD9QjHdzFkgCJQEtyas+jRsmsU/K//zzGkhfeKherFBokc3PLgfPtKKpGqUk6oBOq98nrX5v9GnHb6IDyswBqaHW8FQytH/FqXb4WjdiFeEFvPqCBMFmyFtcZBFzs0/wq+EaC4fn/7Xmu66TWRktiVZ/3wF0tnkfyp/lNEx1Wb/cPTUn8sOCehqG6EWlnGEYowSjyW9yc5XLoSvfO3a0hokVAPMn+6Nzd3N/WMzAIYGasjFJoiYi2xuiUrWtie4LB5x/Vmi172nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB5869.namprd11.prod.outlook.com (2603:10b6:303:168::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 19 Feb
 2026 03:46:48 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 03:46:48 +0000
Date: Wed, 18 Feb 2026 19:46:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Split H2G and G2H into separate buffer
 objects
Message-ID: <aZaHpcsCUKR2aszj@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-2-matthew.brost@intel.com>
 <a2010358cb931861b29e55a3d96ec0f47450e10f.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2010358cb931861b29e55a3d96ec0f47450e10f.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:303:b9::31) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: 28dce8a0-e592-411c-c926-08de6f698285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXc3SjBEbWd3ak5zbTVid3RlM1lRQ2E4TXREcGp0eW8yTmdUVUpQS1crMnhh?=
 =?utf-8?B?eE5LWk1nWkJ2UDcxYkg2a29nbXphQjVnWnBVYlg2OUhjdU9RaGFmMCtPVGdD?=
 =?utf-8?B?K3BHKzc5MjJ5cGZmREV3VUxEOFVBeXV1TVNSaFhoT1paQ0ljQ2I2bkR6K096?=
 =?utf-8?B?NjA2b0YwdXAxbk1rK1h5OVZUMS9oN3IybjZWL3RtaWF3VnNXeXY0KzM0T2Va?=
 =?utf-8?B?c05EOHM4T1hjTGYwYnAyei9XcmVEU0FHUWRNWTVWVG04eUVNN0ZUYmhTTC9M?=
 =?utf-8?B?VVBOakpUQ2hVMVZhVnArNUhTRWZKdmlVL1VBOWk5b3NGaCtIRHJOeXZMbjVv?=
 =?utf-8?B?UFJDbnBzU2JGNVlNdDFOaHNTc0JGREhYTnVaWXE4NG9SNkN3L3NLL2RnWlk3?=
 =?utf-8?B?OWdhMmNZYVpXdTh2MG55aUhCMEE3ZitsNVpBY0JWSE9XSzY2dnRJVHZMTVV2?=
 =?utf-8?B?anVkcG9jd3FpQlZsYkNwWENvWUhacHQ2V21WcE9qN1k4N0M1RE1nMDdIbURm?=
 =?utf-8?B?ODZ5M1pOSUx0cXl3RXN2aTdrWktHMHlvd0pSMGhWTUVaVWEzNXNWc2dDcm1j?=
 =?utf-8?B?SFM0Rjh1QUpRS1VORzJPbzc1NTVLWW5JWmhITlNWWlhrQXVXQ3F4M2hGS1I4?=
 =?utf-8?B?UXMwa3BQRDF2ZzNwc2MyNjd6RFBOc1BxbFdzMVpBMk85ZngySkFVZ05jb2VV?=
 =?utf-8?B?VXk0M04yRkczcks1SXUzSnZnSTNGUXNSS283QlFPWWtlUm83TWlwVnVCWE43?=
 =?utf-8?B?WFhmbjY5VWdFd00zWTdRSUNHOEw4dERRWWhHOTlqYm9idmU4VCtwOU11b2pG?=
 =?utf-8?B?L2tzaVArMXZoZzBEY0RMZWpjMGREQ3RNUVBqQVVvc2U3V0NZeFF3YUYwdkJB?=
 =?utf-8?B?ZUQ4bnN5S3QrOTV0OHg5RSs4czV0RVRJUmQwL0J4b1dWaEp2bDdmK29zVm5D?=
 =?utf-8?B?WVdBUWZ1dVZkb0ZzczJob3pLc2NmU1RFOFc1Q0hKY3Z6VFFhSkdaM3ZiK2gr?=
 =?utf-8?B?amF0TllEUVZzcWQyMTU0ZjdoL2F0TGRpUTF0K1RjdkJ0b2tYbytjK201cm9w?=
 =?utf-8?B?a3JaVFF6c1VWNUk2N1RTWEp6dlhhWmFRdXhyb3h4alJvVW5BOHg0VkhWMTIy?=
 =?utf-8?B?Y3NyczE5RkRTZnpOQUlseStWSVNyUDVETC9QWXd6SHNHWVBxVUpXbGRHR2xH?=
 =?utf-8?B?V1FuZ2V2cDBZczVUU2ErSEE3MmZVUXVOSFFmWDVNWjFmNmhpZUQwMDBNd0gv?=
 =?utf-8?B?WThZNENOaFB3NjNwYytvOEtJWDY0VjM4Q001aGRaWFEvcHZMY1llbGRUV3Uy?=
 =?utf-8?B?K1hYZUppWGkvQUR6V0hQMXRWNVp4VGF1QzNLc2duY0EwQlhqT1pTYnQ2ZUhD?=
 =?utf-8?B?N0JOQmJDTTFKckZwWVRiallKS0UybkZwblVXdGR1SjJjWGNGaUZrbnB2bUFE?=
 =?utf-8?B?WXZ2bkd6Z3RZaVhpay9VTjFGREUvVUtySks0dzl6cXloU0N1WC9aRTcra05l?=
 =?utf-8?B?eGNhZ2FVOERqQkdXd3RPZXJiNEhXdVJXWXQ5L1pxM0lIT28waXN4M0Jqck44?=
 =?utf-8?B?U1dJQmdnNDd6MDdhNW9Qamh6VGNDV290eWlhYnpXeXQ3WC9FMTloRzR3U1BB?=
 =?utf-8?B?MFNGMkhoUjNzeUZGM0s5Skw4Wm4wZTg1dlRJVlZQSW5TNjNZYUg4ZE9tcmFQ?=
 =?utf-8?B?YWVwb0FtMzEwYk41bWRvODJFcEIvcFRoMUlkUHgyN0xNakNheXRyZjMyZFRv?=
 =?utf-8?B?Y1NGcGRCUFNwYVhxVUJVZGFOODZuU0hWaXJDVnByL0FQZExkVWNOSVVXeWsv?=
 =?utf-8?B?L1c5REdPOWlQYWZyR2E3L2dhVWpBRlVLK1J6MCtXSGdqTzdzK29HLzY0ckVE?=
 =?utf-8?B?UHhFUGczZmYvVERaQmVJUmFkcnFvVWpab1pyUzVRM0ovdExRU1VCMDlXSk5D?=
 =?utf-8?B?WjdQVlRMTEdIQmlyN0xGUjg3RG5xNUQ0Y3dzM0ViejVWMkJUUTdGQWc4OWJ6?=
 =?utf-8?B?TGtzWTNKZTBmNnNUMjdaMU50YlkzdVJFaDVYR2hYaEJSUE1BOTJrUXcvcGRs?=
 =?utf-8?B?bWRWL2hvbW0veVlibWsrTXh4NzB3Y0VxM1pwSjF2Wlo3cWtySUV0dkltTFFW?=
 =?utf-8?Q?Nbjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVRDM0wrYUtyQUV1b1dGdnBORzBkaFZRWExUWXZ3aXVTc0ZrOUh6a3NVSHNk?=
 =?utf-8?B?SzQzUHBYZXNXVEhtaVpCVHBlREErSUtCNnBmZDlURkpWRjYrYW9jSEJkdGpt?=
 =?utf-8?B?R2xUTUhiRXAwN2pCVTJIT1d5ZEpNNFduTWx1aitNaVFldUxLTHBWSXRuVnhN?=
 =?utf-8?B?U1RSVURpcFMvdk5ZRnY2OWMxTHlqUk45WE5rZHErL1RMTEhKeThVWFZGNTNn?=
 =?utf-8?B?aEVQNzJKcEI3b2pSTEJpYXYxUzFiK1lidVEvYlBzcnN1VXFzd0k5eSs3OWxM?=
 =?utf-8?B?aWRGNjMwald3ZHlQbVgzVW1tdGxwVUtRNDhudmtvRHZVMTJ0M2paOWlnTVFY?=
 =?utf-8?B?bUpkd2VEMnpqWld3SUYrUGIzRjJFVDhyQnlaOGpZb01tWFp1aHdZQXF2a1VH?=
 =?utf-8?B?ZWdZWU9DUHRsV3U4RzFoTnd6d2Q2Q2xTV002b3ZDQm5XK2hCTWRpWU5RUkFJ?=
 =?utf-8?B?dVVyK25VVGo3UHF1WmpTTFNoNm9qREJYOHZlN2V4dTlhRGV0WURUMTNFdnhS?=
 =?utf-8?B?aUtxWStPWkFGOUlEa3d3ZkRNa2Y0QzlWMkRkWUVYRW9rTXdBdGxsS3lLLy9o?=
 =?utf-8?B?aFFXUVJCZDk4TDJIenRsSGhlaVFjTXdMdkpOZ0ZOMEU2T1JGR1RPQUkzNk9v?=
 =?utf-8?B?YXNLRzZhQi9pb2dONTFRSFJzSURGZEwvamZYSURkSHh5c3lHQjQyNUlzT1Vs?=
 =?utf-8?B?NXVCdzdZNTJZS1ZYT0cvL0FTNnIwNXRIeXRyU2NRUGk4OXFWc2ZxMDd2MDVI?=
 =?utf-8?B?SVBNSW9LMVlyQS9xZU52NlVRWmJsaFg4NWM3MkNha1RIVU4wS216NitpQ21o?=
 =?utf-8?B?UVZEUnk1bExnUWt3MCsvY05PQ1RYSS9OUU8yU2IzVlZXd1pCZ1pEazFGNTZh?=
 =?utf-8?B?ZFhQb0ZXZUZGS2pnMmNtUit3dWNqRlZpT2J4ODhQVS93THY0bWlBVktrK2tS?=
 =?utf-8?B?SW42TjZmTXJFUWhsaVR4TjVBWUNtKzl3NlY2Q0lrby9seEkwK2ltRUFqL241?=
 =?utf-8?B?aEpKZzd5ZU9qeW9pN25rTWF5Mmt2ell2TEZSM0VuT2haZjcwRUxjTUFJK2ow?=
 =?utf-8?B?NVJZcXE2NUMvaWVtbGhwTHc4WitHOVhqWXRvWGtuN2VIYStQZTE1aFNzdUhk?=
 =?utf-8?B?WWpzOStLMEdCblczcUxWVmdoT3Z3Q29XaHhoZW9kVWVZNEZvdGoyL0lqNUcx?=
 =?utf-8?B?RlV6UGNHVXFsRzJ2R0NyY1UvRjFieUJiSHJ0bllHZC9LdndBeVFCT2RIQ3VY?=
 =?utf-8?B?cEkrUlFRbng3TGdmOU5jUG1XRTNHYmorMnhPbHdFVm1GdWxpSjZGQVpUbFZm?=
 =?utf-8?B?K2JxYlRFdmdyU3hPTHdyL1JtQTJJZHFOemxaMHoxMXFmVEhLZmJVd1NHTkhM?=
 =?utf-8?B?cEpTWVRIcXFGaTJtWWdCMllNMnlDemZUZWsrQURvZGR4RVVmSGx1b2Jnb2xn?=
 =?utf-8?B?UTRGMVNmZVJxcjdRUUhmSXJSeE5HbG5iZXdJVW1sTjdiN29wV3JpeTNWUmVE?=
 =?utf-8?B?U0RrY2NOYWFhelU4ZVc0cGxNSTNZZGpYSWVqV3ZqTGN6Rmp1a3NrYkVHbXJm?=
 =?utf-8?B?NU50cWw1K0pHalZzQUlpWXdmbFF2K0FzYy83bDB2TkZEWitOcFNMUDdOY3dC?=
 =?utf-8?B?bjBrTzEvc3Y0aGp0RmVNNnNWakx2bHMyUHdPTW95bFVPSk5ITldQRFhCR0hz?=
 =?utf-8?B?d0d4RDR2anIzWm8xcjR2SUxjdm5QcXh4bGZPcUxQd1Y2cjZpRWcvV3ZpeXpY?=
 =?utf-8?B?UVVoZXA0L3FqWWFtSXJrSWVvbFVFR3lmUzBlSVdCV3lBVnAzRG9WemZJVzdE?=
 =?utf-8?B?dXAvbG94blNrSDc0ZXBmTVhSc1FkbjZmYTkyRmFQbmpqN2Nlak1wSUJaTnZ3?=
 =?utf-8?B?M0FyNXVLRElwV0RPQnJoeXlsOTIyNjhXcmhJaWJ1cERvU2pIMmhFZ2trbjNx?=
 =?utf-8?B?UDFvek1XOTc0UDZXd0h2VjZqbXlENEdYVUthN0hWSjhmeDc4azdIS3FWUzhx?=
 =?utf-8?B?SVJxZ3RtZWkxV0llUGJBRGtWL0VyMER1b3ZreXk2ak8raExzZDBWa1BoQmRH?=
 =?utf-8?B?NTVSQVhKVkVWNTFtd0tweDcrNklQUFFiajVYeG5FYnIrbXRKOUJWOUUzVEow?=
 =?utf-8?B?bVk0WnhmV2thMGoyanhpcy9HU3pJaGtDWTRNTnBNbWZFTk14d2haL0gvQW0r?=
 =?utf-8?B?ZzR5ZEh3endud1Q3RjM4VlVqcWpIRm9jY1ZwRjUrZmtoTFp2ZWV0NkpraDlx?=
 =?utf-8?B?cU9VQ0RGUzlCM0hmN2J0b0s3VGJmaFBJbHE5WUdTMjYxZ1pHOHJvclJwKzJv?=
 =?utf-8?B?SVdJNG5VcXR3NDhkYXZZMXBoQ20rSzNzeHRWOXRFYnFaMTZLYmc4N0g1THFO?=
 =?utf-8?Q?ZqTTwe1A+ugPbOKI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dce8a0-e592-411c-c926-08de6f698285
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 03:46:48.6781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pj/IkwKA9BuhcOZNNN3gNxf5SOJGNxRF+JjMT3IxEvmJvTWCLLDM3ZNKvOWRvW2YSOaSCniI5Dv3uDQfbMVkig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5869
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

On Wed, Feb 18, 2026 at 04:12:16PM -0700, Summers, Stuart wrote:
> On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> > H2G and G2H buffers have different access patterns (H2G is CPU-write,
> > GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these patterns
> > benefit from different memory placements: H2G in VRAM and G2H in
> > system
> > memory. Split the CT buffer into two separate buffers—one for H2G and
> > one for G2H—and select the optimal placement for each.
> > 
> > This provides a significant performance improvement on the G2H read
> > path, reducing a single read from ~20 µs to under 1 µs on BMG.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > v3:
> >  - Move BO to ctbs h2g or g2h structure (Michal)
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c       | 67 +++++++++++++++++++-------
> > --
> >  drivers/gpu/drm/xe/xe_guc_ct_types.h |  4 +-
> >  2 files changed, 47 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 8a45573f8812..ea07a27757d5 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -255,6 +255,7 @@ static bool g2h_fence_needs_alloc(struct
> > g2h_fence *g2h_fence)
> 
> We should update the documentation above then also to note that this
> isn't a single blob any more.
> 

Yes, will do.

> >  
> >  #define CTB_DESC_SIZE          ALIGN(sizeof(struct
> > guc_ct_buffer_desc), SZ_2K)
> >  #define CTB_H2G_BUFFER_OFFSET  (CTB_DESC_SIZE * 2)
> > +#define CTB_G2H_BUFFER_OFFSET  (CTB_DESC_SIZE * 2)
> >  #define CTB_H2G_BUFFER_SIZE    (SZ_4K)
> >  #define CTB_H2G_BUFFER_DWORDS  (CTB_H2G_BUFFER_SIZE / sizeof(u32))
> >  #define CTB_G2H_BUFFER_SIZE    (SZ_128K)
> > @@ -279,10 +280,14 @@ long xe_guc_ct_queue_proc_time_jiffies(struct
> > xe_guc_ct *ct)
> >         return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;
> >  }
> >  
> > -static size_t guc_ct_size(void)
> > +static size_t guc_h2g_size(void)
> >  {
> > -       return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE +
> > -               CTB_G2H_BUFFER_SIZE;
> > +       return CTB_H2G_BUFFER_OFFSET + CTB_H2G_BUFFER_SIZE;
> > +}
> > +
> > +static size_t guc_g2h_size(void)
> > +{
> > +       return CTB_G2H_BUFFER_OFFSET + CTB_G2H_BUFFER_SIZE;
> >  }
> >  
> >  static void guc_ct_fini(struct drm_device *drm, void *arg)
> > @@ -311,7 +316,8 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> >         struct xe_gt *gt = ct_to_gt(ct);
> >         int err;
> >  
> > -       xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > +       xe_gt_assert(gt, !(guc_h2g_size() % PAGE_SIZE));
> 
> For the h2g since we might relocate to device mem, should we use SZ_4K?
> Maybe should append this to the discussion in that other series rev..
> 

This is clearly broken for PAGE_SIZE != 4K. I'd rather leave the assert
as is for now for so we know this is broken and eventually fix this. It
is probably easy as changing guc_h2g_size/guc_g2h_size to align to
PAGE_SIZE. Also iGPU we never reallocate so PAGE_SIZE is actually
correct there.

> > +       xe_gt_assert(gt, !(guc_g2h_size() % PAGE_SIZE));
> 
> It would be nice to have a comment here after that discussion in the
> previous rev around using PAGE_SIZE because of the system memory
> allocation vs SZ_4K. Otherwise it seems likely we'll just run into that
> again.
>

See above, IMO different/existing issue, thus should be addressed in a
different patch.

Matt

> Thanks,
> Stuart
> 
> >  
> >         err = drmm_mutex_init(&xe->drm, &ct->lock);
> >         if (err)
> > @@ -356,7 +362,17 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >         struct xe_tile *tile = gt_to_tile(gt);
> >         struct xe_bo *bo;
> >  
> > -       bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> > +       bo = xe_managed_bo_create_pin_map(xe, tile, guc_h2g_size(),
> > +                                         XE_BO_FLAG_SYSTEM |
> > +                                         XE_BO_FLAG_GGTT |
> > +                                         XE_BO_FLAG_GGTT_INVALIDATE
> > |
> > +                                        
> > XE_BO_FLAG_PINNED_NORESTORE);
> > +       if (IS_ERR(bo))
> > +               return PTR_ERR(bo);
> > +
> > +       ct->ctbs.h2g.bo = bo;
> > +
> > +       bo = xe_managed_bo_create_pin_map(xe, tile, guc_g2h_size(),
> >                                           XE_BO_FLAG_SYSTEM |
> >                                           XE_BO_FLAG_GGTT |
> >                                           XE_BO_FLAG_GGTT_INVALIDATE
> > |
> > @@ -364,7 +380,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >         if (IS_ERR(bo))
> >                 return PTR_ERR(bo);
> >  
> > -       ct->bo = bo;
> > +       ct->ctbs.g2h.bo = bo;
> >  
> >         return devm_add_action_or_reset(xe->drm.dev,
> > guc_action_disable_ct, ct);
> >  }
> > @@ -389,7 +405,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct
> > *ct)
> >         xe_assert(xe, !xe_guc_ct_enabled(ct));
> >  
> >         if (IS_DGFX(xe)) {
> > -               ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct-
> > >bo);
> > +               ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct-
> > >ctbs.h2g.bo);
> >                 if (ret)
> >                         return ret;
> >         }
> > @@ -439,8 +455,7 @@ static void guc_ct_ctb_g2h_init(struct xe_device
> > *xe, struct guc_ctb *g2h,
> >         g2h->desc = IOSYS_MAP_INIT_OFFSET(map, CTB_DESC_SIZE);
> >         xe_map_memset(xe, &g2h->desc, 0, 0, sizeof(struct
> > guc_ct_buffer_desc));
> >  
> > -       g2h->cmds = IOSYS_MAP_INIT_OFFSET(map, CTB_H2G_BUFFER_OFFSET
> > +
> > -                                           CTB_H2G_BUFFER_SIZE);
> > +       g2h->cmds = IOSYS_MAP_INIT_OFFSET(map,
> > CTB_G2H_BUFFER_OFFSET);
> >  }
> >  
> >  static int guc_ct_ctb_h2g_register(struct xe_guc_ct *ct)
> > @@ -449,8 +464,8 @@ static int guc_ct_ctb_h2g_register(struct
> > xe_guc_ct *ct)
> >         u32 desc_addr, ctb_addr, size;
> >         int err;
> >  
> > -       desc_addr = xe_bo_ggtt_addr(ct->bo);
> > -       ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET;
> > +       desc_addr = xe_bo_ggtt_addr(ct->ctbs.h2g.bo);
> > +       ctb_addr = xe_bo_ggtt_addr(ct->ctbs.h2g.bo) +
> > CTB_H2G_BUFFER_OFFSET;
> >         size = ct->ctbs.h2g.info.size * sizeof(u32);
> >  
> >         err = xe_guc_self_cfg64(guc,
> > @@ -476,9 +491,8 @@ static int guc_ct_ctb_g2h_register(struct
> > xe_guc_ct *ct)
> >         u32 desc_addr, ctb_addr, size;
> >         int err;
> >  
> > -       desc_addr = xe_bo_ggtt_addr(ct->bo) + CTB_DESC_SIZE;
> > -       ctb_addr = xe_bo_ggtt_addr(ct->bo) + CTB_H2G_BUFFER_OFFSET +
> > -               CTB_H2G_BUFFER_SIZE;
> > +       desc_addr = xe_bo_ggtt_addr(ct->ctbs.g2h.bo) + CTB_DESC_SIZE;
> > +       ctb_addr = xe_bo_ggtt_addr(ct->ctbs.g2h.bo) +
> > CTB_G2H_BUFFER_OFFSET;
> >         size = ct->ctbs.g2h.info.size * sizeof(u32);
> >  
> >         err = xe_guc_self_cfg64(guc,
> > @@ -605,9 +619,12 @@ static int __xe_guc_ct_start(struct xe_guc_ct
> > *ct, bool needs_register)
> >         xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
> >  
> >         if (needs_register) {
> > -               xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct-
> > >bo));
> > -               guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo-
> > >vmap);
> > -               guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo-
> > >vmap);
> > +               xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap, 0, 0,
> > +                             xe_bo_size(ct->ctbs.h2g.bo));
> > +               xe_map_memset(xe, &ct->ctbs.g2h.bo->vmap, 0, 0,
> > +                             xe_bo_size(ct->ctbs.g2h.bo));
> > +               guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct-
> > >ctbs.h2g.bo->vmap);
> > +               guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct-
> > >ctbs.g2h.bo->vmap);
> >  
> >                 err = guc_ct_ctb_h2g_register(ct);
> >                 if (err)
> > @@ -624,7 +641,7 @@ static int __xe_guc_ct_start(struct xe_guc_ct
> > *ct, bool needs_register)
> >                 ct->ctbs.h2g.info.broken = false;
> >                 ct->ctbs.g2h.info.broken = false;
> >                 /* Skip everything in H2G buffer */
> > -               xe_map_memset(xe, &ct->bo->vmap,
> > CTB_H2G_BUFFER_OFFSET, 0,
> > +               xe_map_memset(xe, &ct->ctbs.h2g.bo->vmap,
> > CTB_H2G_BUFFER_OFFSET, 0,
> >                               CTB_H2G_BUFFER_SIZE);
> >         }
> >  
> > @@ -1963,8 +1980,9 @@ static struct xe_guc_ct_snapshot
> > *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bo
> >         if (!snapshot)
> >                 return NULL;
> >  
> > -       if (ct->bo && want_ctb) {
> > -               snapshot->ctb_size = xe_bo_size(ct->bo);
> > +       if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && want_ctb) {
> > +               snapshot->ctb_size = xe_bo_size(ct->ctbs.h2g.bo) +
> > +                       xe_bo_size(ct->ctbs.g2h.bo);
> >                 snapshot->ctb = kmalloc(snapshot->ctb_size, atomic ?
> > GFP_ATOMIC : GFP_KERNEL);
> >         }
> >  
> > @@ -2012,8 +2030,13 @@ static struct xe_guc_ct_snapshot
> > *guc_ct_snapshot_capture(struct xe_guc_ct *ct,
> >                 guc_ctb_snapshot_capture(xe, &ct->ctbs.g2h,
> > &snapshot->g2h);
> >         }
> >  
> > -       if (ct->bo && snapshot->ctb)
> > -               xe_map_memcpy_from(xe, snapshot->ctb, &ct->bo->vmap,
> > 0, snapshot->ctb_size);
> > +       if (ct->ctbs.h2g.bo && ct->ctbs.g2h.bo && snapshot->ctb) {
> > +               xe_map_memcpy_from(xe, snapshot->ctb, &ct-
> > >ctbs.h2g.bo->vmap, 0,
> > +                                  xe_bo_size(ct->ctbs.h2g.bo));
> > +               xe_map_memcpy_from(xe, snapshot->ctb + xe_bo_size(ct-
> > >ctbs.h2g.bo),
> > +                                  &ct->ctbs.g2h.bo->vmap, 0,
> > +                                  xe_bo_size(ct->ctbs.g2h.bo));
> > +       }
> >  
> >         return snapshot;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > index 09d7ff1ef42a..46ad1402347d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > @@ -39,6 +39,8 @@ struct guc_ctb_info {
> >   * struct guc_ctb - GuC command transport buffer (CTB)
> >   */
> >  struct guc_ctb {
> > +       /** @bo: Xe BO for CTB */
> > +       struct xe_bo *bo;
> >         /** @desc: dma buffer map for CTB descriptor */
> >         struct iosys_map desc;
> >         /** @cmds: dma buffer map for CTB commands */
> > @@ -126,8 +128,6 @@ struct xe_fast_req_fence {
> >   * for the H2G and G2H requests sent and received through the
> > buffers.
> >   */
> >  struct xe_guc_ct {
> > -       /** @bo: Xe BO for CT */
> > -       struct xe_bo *bo;
> >         /** @lock: protects everything in CT layer */
> >         struct mutex lock;
> >         /** @fast_lock: protects G2H channel and credits */
> 
