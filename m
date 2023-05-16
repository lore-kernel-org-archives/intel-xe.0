Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0FFC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 15:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB0C10E02A;
	Tue, 16 May 2023 15:15:40 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB0D10E02A
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684250138; x=1715786138;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=Ome6abrz5IecVABTMgNuA2kDxSmnE3yNxyLP+vEPw2Q=;
 b=UI9hKNXux2Hr6HrsiGJKks3uut//FRfLyAf7SIpEao5fl5G7p2raECr/
 QXsrGTjPcZiTnjNQpFnt5Y3GtTkusnJO4y2yxWh/ypip7Uay1g8a1d4QN
 jTdWX+BJdEmAI9+nSur4fByiOgk7LlaxPHQikJLCllx94yOpFwCuVoctk
 V7IYo4g8o883r7s3x62r+1hLA2UtjydFr7YuRyL+L/UMsu3lXXe3HFEQ4
 3iJXy62aBHqEdt59kELwEoi8mSXOmrCvm+d4JrD1UQw9X8/7MUDUL34IW
 bxLmw9iHr5IOdJ0N3IazUo7MFUyXdgy7ktfjEuDCTHgTD+ZdeVWCvwIzS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350343968"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="350343968"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 08:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="695495062"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="695495062"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 16 May 2023 08:15:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 08:15:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 08:15:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 08:15:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 08:15:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFjbXjo9o0yFUUmrzar9MBsKybuDVifOxeHbc3+fIW7wplxgQEvCKT7NuwJY8fRpWXvEmX0xjbQTDm9ljNrK6WVhQLM7k4/84MCNtjWiLGctu7LQIvNg1YWkWYcjC7Q2Udwc0e311ibB38U/m0iiFDSQXqkxXP3A6d2UYasfSrwuViuGVpyh+GgrRBVtNruWxVbxsL8q7ZXVVi40daOYi7NyTztQ8zOIfJ8FiiqQW5Ejo2hho45soq9RpOs2YRq/mvlgHAwfxvT7RZvt0LMS1Y/owLuJZzBZVx9afRk8hnQZ53YmmJV6fcPuo3iEIFP9dr38o2zREG2+0Z0cBY52dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su56nmtTbupGImIgSwbAcSXNM4+k56IMw2M18aNESGc=;
 b=atM4YywF3Ql2IAqoumW2BY/PjVWNwrQfTeGfJ+1SfqyGHJ2ZonLGoz9RjTmvBtXAryN1pIz5gTpWD+pmvRE/WqNBhpLIf4f9HDLU6q/G5aZALa5rCnnyyYT3L85zZu1F2/tP7F3L7Izv1yj2+LybVTjTYRIdX9pzDuftWLV4TQHegGgvTSxWqe6Hi6NSVBlkBbiHk0Vxh2xvQLXZC0/VYvKtd25H9Ojgy5cgvjvQvb6JhAUzz+Oa/zfxSW1BMouhDmh4XYyq+9eqiQWtXf4SzvkP4IR4Np0B005j8IOw9VokY4mTZ+vdvsMBevr9KPMnGCU/Wru4TjnrvnYhYQLb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 15:15:27 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::7c95:635b:8059:9e68%3]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 15:15:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <168420022142.13184.14005986251398268905@gjsousa-mobl2>
References: <20230511194822.626036-1-gustavo.sousa@intel.com>
 <168388880559.26101.11929545409498758841@emeril.freedesktop.org>
 <168420022142.13184.14005986251398268905@gjsousa-mobl2>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 16 May 2023 12:15:22 -0300
Message-ID: <168425012269.174531.5874618609082328202@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SA1PR11MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc99d72-161f-417e-e555-08db5620610d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDsYbTYvImzHhrmt2UYZgd2qXOssf2EqRMSJVnnXWcu6UtpiTwmivG1JUfKSH1Uv5sdURthlarrHR3vzgF3NKOQ1c3a8d9ef6cYsIfRm9fF1BhgMFvmoX3QTchRadJpTUZfNxuCgu+6xqNDSQXpvibxr6BHDpoUu1sLdT60VUGN5ESpfubln5tHS6+bVXG68K7L0rH6jb/sKXUatLUjBf8SLlNbbob5xFk6v/0X7U1VkVW0BQR+jEoiDBuqkXftR1gSfUP5uhDk3uTXdhKSEChHrJQq6nlkkOm18glsnIHfEh2sqhXlnbAWey5mlOCmtmy+J+kIuzV4A2x+RLAag1SSiEvKlNjX93/HjoQxGbCoERGzw+wkU3JbcFv42rkpVORYXPgo5nEeMv2jb3B3mGEAsMxYJHQ14uMf8XmwD7kvIXZhMMDCXhpaHODcOh6zexP/ZXfqAjI6XxZue27YQ2JYrnQ94Oew0R8RovTkbaJ9VXaOfKLyiW2O2neS6czGi458A13COl7AKK3MEs59uokGYxzJSVqq4e1EzLllpJDROQ+OggA7SksXt7bxQC9TDaqijoUu+5baO3+Y35yFttw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(33716001)(2906002)(966005)(478600001)(66946007)(6666004)(316002)(66556008)(66476007)(6916009)(6486002)(82960400001)(38100700002)(41300700001)(86362001)(8936002)(5660300002)(44832011)(6512007)(9686003)(186003)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWdCSkcxVnNyd3FJanN6NXkySWJwbHhNdDg5aGpxclNTL1ROSG5CYzZBSytE?=
 =?utf-8?B?ZmZhVXkrQ0pRQ2RSVHNvRnFQTnFKVUVqSHU2Ti9hSVM5UDB0eDdJanBoTUtK?=
 =?utf-8?B?QzhvQ3krQ0pGdFZEWGVDeGZIYnJ6emN1TTM2a01zN3lFL2c3ZUpWdzVxdkZp?=
 =?utf-8?B?ekRadnRiamJPVWdJaGQ3aWNHOVI3OVMxWGZTaEt4aDFCYmlCSnRBV1RGVUJy?=
 =?utf-8?B?dXhOTUUyMTRXSGJKcmwwU0xhSW0rVDJmeDV2ZVdxUHJOQWpFWVBPUGp5Q1pJ?=
 =?utf-8?B?VlJrelFieGsxUDM3dDlhQXJpdGNyU0NLNlQyekU4eU0zaXdlNytxcDNxd2Ft?=
 =?utf-8?B?eEoyK1hwMUluNTZZNkdLejNTeFJwVGsycU5VemU2a05sZXEvMnVBZEdKRmNy?=
 =?utf-8?B?YytPVlpMcVJTcGt6MnRXTEV5VXdkTmQvcVM3aVZXZ0dJOTRIWkptYmlic2h3?=
 =?utf-8?B?M0VyMGdOdlVHeVpuMjJrejdrT3BxN0JlSWsxSzg1K0VCc3RjVi8vSWo1eTB2?=
 =?utf-8?B?ZDNjQ1lvQXluaDJ4MktwYUk0UGhIT2dteHZsL09JNSs3eSs0dzRWRnFXZUgz?=
 =?utf-8?B?ZnVaYUtaRDdMV0xhanFhMDhOMEJrd0NVWW04eGUzdFg4Z1RueGlZbDhsMFFB?=
 =?utf-8?B?Z3FjOTEzOXlldVp6TU01cEFPVUhzUFhXSDN1VnFsYjlGZW9Hc3R1cGk4eEFz?=
 =?utf-8?B?aGdtaVliWEVzOWpTQ3FkUzg1Z21OQm14VkNmQ0w2L0xJVUtCZVMvaEpkZHMy?=
 =?utf-8?B?aWVQZkFlSWFPbStmd3pFQmtGUFhmYmtDVUVlS01xTmZ4cmZIb1MyVjJ5Tng5?=
 =?utf-8?B?emJwR2wwK05hYTZEdm9MQWd4MFdPVWpHVWZtQzZvdkRCNEJ3OFNuT1N6Vy9D?=
 =?utf-8?B?K2Y2TExjUTZvck4wWk02Sy92UVRhdC9TSWlBUUQwalRCOWpkR3hVbFNWeDlw?=
 =?utf-8?B?MHAzRXpnVkpzZWVxZXZQR1BNNGN1R0RUMkhrbUdEMlNrVFYxUUtXTHdmUVBv?=
 =?utf-8?B?QUZNeDhSZCszS2I2Z3dpNG12bGdBWlE5QVFMMzRpSS9oMW5JVFljUE5GMDNl?=
 =?utf-8?B?bUNMVFFzYTYyMSs1UGdJL1U1NHE5aDVaV1E1c0txSVoyZ3RtOUJvdE5TM0lY?=
 =?utf-8?B?QVI5V21PYk5LVU5mQ21OdFp4Yjd6UTZ6bnQ2UWlKNE1RNWIzak81TUN3RU9F?=
 =?utf-8?B?bit1Wnh1UjJFTXNrd2t3RDJSTjRuTkRLTFBwSWtwaTc5bTBDYjRQU01xcjFw?=
 =?utf-8?B?ZEFiRWExUUNCYkpWMEYrNDFJMWFCL25XamdYbEM0eWt0RHhiWEIxSzFYSjdi?=
 =?utf-8?B?YkZLaHQzc2JQRUJQVHo2eHVjck1hMmVpN3NIMG14U1IzOFZNRXNBY1VCTFN5?=
 =?utf-8?B?SWU1VUU3Q1pJMThlbFdDc29DaU5pSlhXdU9yemxsMlF6cUJvUU9iTk9WTnpM?=
 =?utf-8?B?SE1MQWhXNTlxYU5XaDRRTUNERmVuVDVpWnBDR2ZDeTRrTkFRTFVBS0hTSEls?=
 =?utf-8?B?RjVlUk5NckhzcER1eUZIemgxUVpqK3NnUUI2QnBWcU1DRkk2Z3Vtb2pFdmo0?=
 =?utf-8?B?RnRtZEJSWCtnU2sxM1h0VVV1bVkwMENVU1A3d09kVlkwZWNneS9FZFZPdHlx?=
 =?utf-8?B?QmRab3d0NlRtMjJXdVYrU24yUHA0aytEbGhaUlRyRnA0Qjl1L3BIdUxBNHFQ?=
 =?utf-8?B?NXNJSlhtT3Jaczk5b2xjdWFFaTkxUGhOUHFiQU1Cd1RhK25hNDU5aGZBSU96?=
 =?utf-8?B?RFM1eDVrSjB4cGdXNU5UU0t4S0NQK3RRVWRNM1Y5TEh5R1B5RG9jZVVMWDBh?=
 =?utf-8?B?eDN3Q2sweWJMV0Z3VkRrWkMvc1lleUZkcUdmL0tHQ0pRR05vbjJjNVFseTNl?=
 =?utf-8?B?QmhSRml4VzY0U292M3MzaXBtQ3ZJb0M5VTdPdys1QjlJRXNUeFlEd2Nkd2NY?=
 =?utf-8?B?NGtBZUhldkpOMytlRzcra050ZXAxeGRPYXRaTVpmNUVOL1VFQXQ5bEx2cVFj?=
 =?utf-8?B?aEtOd3hIU1g0VFlGZzFvUjRyMzYwK0U0NkpFbGE2UjlVUThmNnNaaFpVblI4?=
 =?utf-8?B?UmVTajBLbkRVOGtYOW5zRTJlSUlaQ3VLZUFhb0VLZHlyVnVsMDBwN1Q4QkR2?=
 =?utf-8?B?V3FnUE95MC9IWHQ4eWRMSUlURWIyY2ptTzRtYzdiOW1DUzIrRnYyYU8vMGlO?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc99d72-161f-417e-e555-08db5620610d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 15:15:27.2901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pcdGW97osZnvFlENAzfiImI5NcFCgvSJveY88RZsFyWrAkabgikl/2M4x5iCcdBZBCsCiE3uAeC4ifkv2cJFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=97=8B_CI=2EBAT=3A_info_for_drm/xe=3A_Ca?=
 =?utf-8?q?ll_exit_functions_when_xe=5Fregister=5Fpci=5Fdriver=28=29_fails?=
 =?utf-8?q?_=28rev2=29?=
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

Quoting Gustavo Sousa (2023-05-15 22:23:41)
>Quoting Patchwork (2023-05-12 07:53:25)
>>=3D=3D Series Details =3D=3D
>>
>>Series: drm/xe: Call exit functions when xe_register_pci_driver() fails (=
rev2)
>>URL   : https://patchwork.freedesktop.org/series/117559/
>>State : info
>>
>>=3D=3D Summary =3D=3D
>>
>>Participating hosts:
>>bat-dg2-oem2
>>bat-adlp-7
>>Missing hosts results[0]:
>>Results: [xe-pw-117559v2](https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-117559v2/index.html)
>>
>
>The only difference of CI result with respected to the latest drm-xe-next
>(xe-164-9e6366d33f771328bee3f570c220bdcf8ba057a5) is for:
>
>    bat-adlp-7 igt@xe_huc_copy@huc_copy: pass -> skip
>
>The skip there is for HuC not being loaded. This shouldn't be related to t=
his
>patch.

Looking at the log for CI.Patch_applied, it seems like the series was appli=
ed on
top of commit a9affcc66157 ("fixup! drm/i915/display: Remaining changes to =
make
xe compile"), which does not include [1]. That would explain the skip above=
.

[1] https://lore.kernel.org/all/20230512233649.3218736-1-lucas.demarchi@int=
el.com/

--
Gustavo Sousa
