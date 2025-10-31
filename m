Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0873CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 14:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A178D10EBD5;
	Fri, 31 Oct 2025 14:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxnep3VP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0210EBD5
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761922428; x=1793458428;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uX+41mgGnS+V+4hUp11SLTw1DApw7AgMw89JhFwe6u4=;
 b=cxnep3VPq9LdYuOByTPATKSEIfjS2AXxMW8UVM6u/EZ0hYYhleYP0XYc
 OQAhYwJu+b4jCgFVUxpNrr4Jds10jCAUOGYdvwAfbq8Mz2iP7Fvc6/Vzw
 oC954bP2Hj32cEFqboPFJ9hJMQ8Rh8c5+CRGCNdSW9CAIXCOAgDz6kYq0
 Vbf2yQYtDHLeHH5TNhbq1yCtwVGNCZHIKYctYZtXyvQnDXYxcXV2dkumx
 zvRc14T+tllTNJYITB6aozhFV4bjwc4ERJAqsrTN3M7G8GFDUujtRs4aa
 vvBzeahGoN0pSYLMWxI8OFW/xINfHoVSHBz7x2e5ot4M4SAVs6c7upe0Z Q==;
X-CSE-ConnectionGUID: 7yfMH3ngQ42JhAdywZLJDw==
X-CSE-MsgGUID: kTYnnfGdR1mgd370p0GyXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63971829"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63971829"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 07:53:48 -0700
X-CSE-ConnectionGUID: TPCn/s38RQWJ3d3akTWBjg==
X-CSE-MsgGUID: l8fmGdxJS7iHgX4IWcPKxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185914409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 07:53:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 07:53:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 07:53:47 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 07:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQOO9ZsO3eP6pgWSNdliityB0dGVw6VEfC5xP7aDXtv51TnUbWZetz1wKWmMYbsIMuUuEL72lTWbkcpUHN7i25yVMUI+l7ugGZbIUoL0+hmmwFy4Lk98Hp0mx7GC+KnzAsgnUome5L8snLyx3ntgvJ9yb7fEsqu5RueOwIyoCDddDvLM4xL1F5uQa+R4RF1XE0uVz9pb090QYerhod47oa9CVHmwJdUto53GEcZTFq871MiWqY5hbZ97cyvUuN0dzybV9QpVMhwCuBDcGY8WsBatGLZFdLGzJ8zfGmMZTQKq768v0pJsFGXaWtfsaBrmITJprAAXYS3VS1Yskrmciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXf8+mfAIwYy5od5cwNzGnCMw+QOwz2EOTLgkSRgm5U=;
 b=EeJmcsd0/XxDzm3cXt995MKSw8dL0VMz1m7o9roVS9FRbauZGcnDCOcjCV/9gDz8gF1lzksFSw1rf23whWGU5VWTsnsDAMMuwZf47bOmVKAMGsaSJQC/vbjIM81j5DgC4ElLWL0zyE7h39VTMVPZU6BV0JW5NSsgPK2NGXnMVJ/wOneXqmrqwiYRXAVRX9SBtuO4csR24LAG9GHLkQnB8sF29MeB1gptvXKL34QdP+UAEGb02V6PpLE+MDvTawuYC5EFkB0QFnfh6xbQFo32AkY6kiBMYJ4pV0gUcOY/72pLrNHHMPgTld2qAl/w9XJpouGmi/c5P2JTWz30zihZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS7PR11MB6013.namprd11.prod.outlook.com (2603:10b6:8:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 14:53:45 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9275.011; Fri, 31 Oct 2025
 14:53:45 +0000
Date: Fri, 31 Oct 2025 20:23:37 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Synchronize Dead CT worker with unbind
Message-ID: <aQTNcStpNqix46Iu@bvivekan-mobl1>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
 <20251030151122.3021436-6-balasubramani.vivekanandan@intel.com>
 <4996795cdb5a48ab19247de78334df2b080c8758.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4996795cdb5a48ab19247de78334df2b080c8758.camel@intel.com>
X-ClientProxiedBy: MA5P287CA0252.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::8) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS7PR11MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 3756eafb-0ed0-48fe-317e-08de188d49f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWppMWF2U2w0N3FNNlFlQW5ObDJvK3dCaHIzck1PeHVzSWI4azdHZlFNVXBq?=
 =?utf-8?B?VmdmbFdPWGp0VldMaldtSUpRMWtzbUpoLzk3cnpaanNrNEtmUzlQazRJZUhT?=
 =?utf-8?B?bW9xVGhKVkVEQ3RwWjBqLzRiYXBiK3JUNEg3dFBkQjYySzEwRkg3QWRvcXli?=
 =?utf-8?B?YXZObnpZMEEyVXJpLzNjQWRoNVNiVmtmMDVMVTNteWdmbUcxdkxKNkN4Y0FU?=
 =?utf-8?B?Sk52Wm0rU0xLQkRwaFRTZzJKK0VVMndpa3c4U01IbUdVT25aOFpRcE5PRk9T?=
 =?utf-8?B?WTJxUVBFaHJ0L1hpQ2phRFR2WG5vekZEc0hacHoxc0pNK3liZGdrZWRET3dL?=
 =?utf-8?B?RXlONG90K01KUEY3eDdERFNmOFVXWGVuTllEbnhiSkNGb0lDNldjczlMMGRW?=
 =?utf-8?B?Mnp2ZUJxdFZuYU53ZTFxWGtMVHcrWFp5eVI2V2VjY0g1UWhVSzRQQ25Oc0Fx?=
 =?utf-8?B?RzNSQ01SMk1lUE0xSzZ3S3JxeHZDREw0TDdZb0xwTkhWV2QwUkJocHo1MkUx?=
 =?utf-8?B?MWR2Z3IzQjlmeEdQVE5zUWpKYllHbjkzbGgvdzZJc0JlbUdvUTBUN0QzemlG?=
 =?utf-8?B?RE5UaXFGWnVtc0E2TDJUaFhVRG5FRmo0WS85MGhwRkVtRStNN2xiS3kyQ09E?=
 =?utf-8?B?Tk1hakl0SEhmc1lBdFdRcDBKcnJtMWs3OTQ2SDRvbEZkeFpoKzZCUVM2ZDZW?=
 =?utf-8?B?ZXh5RDZGcVRpTlZkRVh1TkRmQjF0WlBCMUZvTitMZFk5MTZZM0hCUVk0UG4w?=
 =?utf-8?B?NXRxdmFSYVlwc2RncDV0WkRlUmdzcW04a3VGKzBLbFNaUWlXcVp0M0diVHFN?=
 =?utf-8?B?Y0xZWCtpMnRsRGZ3TGNualRXUHE3QTlTajFCaEtjOGV6aHZWcmRrTDZqYlB6?=
 =?utf-8?B?UzlGc2xNWElhc1FhRjF2VkVReVRBbGd1a0hkWTYvTlJER2JLNXYzL1Q1ODM4?=
 =?utf-8?B?dkgvVis0eXVMakFHRFF6Y1ljU0ZKWWpDSmxxN2l5a2kzcEJFKzc3RFhZOGt6?=
 =?utf-8?B?OHQ4QmN5eHZvOUVHQmEwNG4vY2lJU3RsOFJUNGJoSStKR1VhaEN6YVRKOWFM?=
 =?utf-8?B?ZUZac2F2QXR4NmJERUhmajlDNTk0YTc1dDBKWENjenZmamQ0K1R2dnladW5D?=
 =?utf-8?B?NmU5aVNCejZ4TmNzWWx6Z0t5MVJFR3p2R3FuV2RUaEQvcVA0ekdaQndaTDZn?=
 =?utf-8?B?NW5zK3RVSnFZVjFJUUNnYUM1dW40cG1HVXFZNlZrcjgxU0pTcGJNZ2RveG1J?=
 =?utf-8?B?QXlsalQxZGYxM0dsOElUbWRiWDB4NUZ0YjJqOXRvM2h5cFd2MXV3L2FKNEQ5?=
 =?utf-8?B?QkduelU0NzdtUno4YjRVd0d6VlJrZHZtL3hIOXFVSytZNUxMbnhjNnpNbXNs?=
 =?utf-8?B?bGhyV21rSkwvWlhlY2tya1BRZzJtMExzdGNlRzdSbVJpd3JPZUlsYjdpOStI?=
 =?utf-8?B?T2h0UkNSRzFGUS9zeWN5ZkQvKzRqUXE5S1Z0cmYxMElNZW9UYUZMOWdPRnEy?=
 =?utf-8?B?dDd5dkFKa0hPbXBRZEJPMkVtODV0Tk9PVUFtZmtPYXpNY2hPS0djNldLVWRk?=
 =?utf-8?B?ZnkvTGk2Y1g5aE1xcjRFRWppcXpEa1ZNejJXMnhhcVJCb1hPVWdzZXU0MWVX?=
 =?utf-8?B?OFd1RXovUktmSVViN2YrKzVCQUNLMFRqbXRMcEJycDd6TitzYk9XYkJmSTg2?=
 =?utf-8?B?QjMzNEtXMHFobjBFWFJZenpXNTJ4b1NyQ0xISTdZZUs0QVR2Vnl5L1hMRUtH?=
 =?utf-8?B?cUZodGxSU2hHRVdaMW1IVTBSNEJDTGpLQmZEaHVzZjBMaW9vd1lDWXhXWUZh?=
 =?utf-8?B?Qmhpd1FxRVQ2T0ZmekpZZVlEV3lOTGJ4QmdocmtxaXkxUm1jd0pMcW5KV3Nm?=
 =?utf-8?B?ZnJBTlJpc1NiVW1qeklpdG1mSTE4bll2NWhNS25IZ3RxN0V3L2lFL01mOHl3?=
 =?utf-8?Q?l+kut3wrHNqCfajFEnLs21yOmW1lx1Xo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmJlVjdpN0ZPSmdvVlA1RHVKRFdVYmFES0xHalZ4TmQzNkJWSkp0dnlSQm9p?=
 =?utf-8?B?eGh0aEFoWEhUS2lOK25ValQzcW9qa0orSFdHZmM1RDRBVVg0bngwMnVkSmwy?=
 =?utf-8?B?WWJjMllxNjd3aHcyeDZyZ3JmZ1pIM05aejVoVjl0ZlNxY1ZBYTJoRjZWaDND?=
 =?utf-8?B?blkzN3JNUE9GRU1OWHp2SXhTcXE0MDhoaTJBV240UmJHTmpOVGltNHhVc2ti?=
 =?utf-8?B?Tys3NGEwTmkvSUNiWWRnWCtDdHVuS0F1OHArNDZOKzJubU5ZV0pRWm1WVUlL?=
 =?utf-8?B?M29JVEVHREgrMzVCVFJlZzB3dEZaSURJZXpUY0IrUW9USUN1aUJONGV4QUU5?=
 =?utf-8?B?NHp1TERsMmR6cWRROFhYc20zdUtVa0F6RDUzTGN1YU40dFN1NU40YmhJUlpz?=
 =?utf-8?B?OEJnMlNINFBwRE9USGlQcUVid0M0ZzRFbzVqN1cwODE0NC94R2ZUOU5nanFn?=
 =?utf-8?B?SnN5VHp1Zk0zSWh2bVFmelZOd0V6Y0tWVWcwZ1hLdzUyTFFuY3FseXdzWHVk?=
 =?utf-8?B?enpSZ0RwN0o3UnN3RVdtamRCTVdyTDh6SEhZUEJuY3hsbmNkVk9CUlB6ZzZj?=
 =?utf-8?B?ZVhBcWppODF2VTI4d1J2dmU5RFl1U3lyeXhzRzJUVXJqS0FncmpNNjJKK3Jj?=
 =?utf-8?B?QXJZd1pCUWJidUkxeTZsUXo4SS9sNGpEM0grMlQrZ1pFaEdHZkU0Z1JYaGU2?=
 =?utf-8?B?T1lUNnlvUFI5a0dRWXQwSXRodHMwWWdFdzArUVFxMHlvNkdJQlJpUDd1SE8y?=
 =?utf-8?B?RXNPS1hlemtiYndjL29STjhoZDk3bG1YOWtuK0o5RXRqYWVoeEdqejNVZ1RP?=
 =?utf-8?B?MjNtSFBrNUtoSjRuMCtNb2N0MGNFaG0xQWIzYzc3Vy9FNW9MWERmSFZwKzh3?=
 =?utf-8?B?V0lFZENvaTR5SFN1Ymg2VGk0VVJ2UnR6VEQ0THFLNzlEN1I5eWhLaENSNnNV?=
 =?utf-8?B?bnlZM05FZkhjSEEyMHYwZmxjYzh4NkhjeDhXT1FtMThJaGVBN2Vka2dHQnJC?=
 =?utf-8?B?UWJCRWpBNWJPN0toV2Jra29uc2dnUmp3cmt3VHNoS3NQSDBuTzNaZUpNVk5a?=
 =?utf-8?B?U3FUQ3ovL1BxRkRILzc4S3pkOGRGWGExUWZWVVFhYUJxeTRvcVRDWWpYUmo3?=
 =?utf-8?B?WlVJajlmTzBXS1VVSXBtZmZhdWZtaUxzWGtDVjJFSUlZSnpZOUFvOHlHQlVr?=
 =?utf-8?B?clg2cW9RbjJuVEo5YWZSUDlRL1VZWUlmMmV4N0pOak8ybHRtTlJEK2xnOTJ4?=
 =?utf-8?B?YWF6Q3N0ZHFQaStodHpZbEVQaTQzc0tjTm1SbmNKMDFMekJ4em9LWitmTHl4?=
 =?utf-8?B?dktzNHdTby9acCs2L0NCSmZUdFhuTEE2ZXlTZGRvRHRSQWdjaVRFdEpzZjVj?=
 =?utf-8?B?UElpdWh5WWplcUxzeERKVjhNMmZXeGphYmxKTjVxb2YxQkgyRlRYdjdDeFIr?=
 =?utf-8?B?T0hCSHRXaytnekdmSnRFN0orcCtCMWpmK1h3dVNoYUtGM3JvQ0xJSmxnTzk5?=
 =?utf-8?B?VThaZTIzZmZmZ0c4dTI3RmRmYkpMUVZFcWtYVGxhNy85cE1pTm1Md0ZKcmow?=
 =?utf-8?B?dnU1dVNFRWZ1MVMwNXUvZ2g2WjVzRlNLVEdiODlqanpoRWpqWTd1ZUVndlQ1?=
 =?utf-8?B?Ui9VOHZ0eEM2ckdTWlFxYXBUa2wvbHZLLzQxNGprZVk1ZUs4VEk1eWRTeld5?=
 =?utf-8?B?ZmJxaFd1NVZiQ2pIMk5RdEFEQWxnU2QvT3RhWGNaMDFGMmtLajQ4SXZucWdT?=
 =?utf-8?B?MGJaNDdYa1ovV1pSclZHaGgrY3hrdlo3QW1nSjFBbEZVN1lyVHJhTEx2cTdh?=
 =?utf-8?B?RlV5cmpTSmhoU2NjamhuSG5LZUVXUVJ1ci9mSmVyUGtUelQ1eEozWWdTY3Fr?=
 =?utf-8?B?U2dTNjN5NFhrdmJZQXBSRVhzYUM0by9FVjl4UmpvcjhGbTNYcFlkNFh2bXRr?=
 =?utf-8?B?VHVJUnhVRjJBN3JhQ1J6VFZuNldZVzRKVy9MRWpqZGM3MWE5bUJET1lKWUJ6?=
 =?utf-8?B?V2JlcHZlL25jT0l3UUExM2lqMVVMRjRIbzZsQmRzdTB1MUNtSW43cnpsVlVE?=
 =?utf-8?B?SXdCUVcrM3RsSVh6RHJmZWhJUEZaMTJ5cGZBbkJYRk84T2ZaVU1PRHFnQWI4?=
 =?utf-8?B?UWcxaXYrQTZMcW1DQjZHVUdIMGlzRWdvVi9mcXVmZ1VhRW9UU3NwbmVSR0dq?=
 =?utf-8?Q?DFpxwVaMhX8PORKm3AyY7pY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3756eafb-0ed0-48fe-317e-08de188d49f9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:53:44.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FBk9SAJ8oUlBfIOQMwCElpNsa7wOWzQDc4zh88V+EWJPj72ZFzrEjv0rq/RlHdvw4782HbwXwz73GesWlcr12dYo3KZ4YW9oovJZbQ3RUscOsLQYz82qZyqQz3tXcRc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6013
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

On 30.10.2025 23:08, Summers, Stuart wrote:
> On Thu, 2025-10-30 at 20:41 +0530, Balasubramani Vivekanandan wrote:
> > Cancel and wait for any Dead CT worker to complete before continuing
> > with device unbinding. Else the worker will end up using resources
> > freed
> > by the undind operation.
> 
> /s/undind/unbind/
> 
> And similar here - can you provide a stack trace?

Unfortunately I didn't save the stack trace. Kernel panic happened in
Dead CT worker after I applied the fix from the first patch and retried
the use case. Also the issue becomes sporadic after the first patch.

Regards,
Bala

> 
> Thanks,
> Stuart
> 
> > 
> > Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> > Fixes: d2c5a5a926f4 ("drm/xe/guc: Dead CT helper")
> > Signed-off-by: Balasubramani Vivekanandan
> > <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index e68953ef3a00..536433b061fc 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -199,6 +199,9 @@ static void guc_ct_fini(struct drm_device *drm,
> > void *arg)
> >  {
> >         struct xe_guc_ct *ct = arg;
> >  
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > +       cancel_work_sync(&ct->dead.worker);
> > +#endif
> >         ct_exit_safe_mode(ct);
> >         destroy_workqueue(ct->g2h_wq);
> >         xa_destroy(&ct->fence_lookup);
> 
