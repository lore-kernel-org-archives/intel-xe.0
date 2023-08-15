Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B30C001E0
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 01:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADE610E23B;
	Tue, 15 Aug 2023 01:52:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C4F10E23B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 01:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692064323; x=1723600323;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=GawtyQgwJ2l65sDIwIjH6/HFbmTihrv1BhkRmTPgbNE=;
 b=QSx0in47KH3G4VMB9Cucf74GhLrlJJNJRU8KZGtc3vMYJT30x3NNYukx
 UQuQ7jCiuJZ+h4uSW1hUUB4qGD7HoI+m5GrdPVZ+fCyfbdwIIW05moecD
 uaeByWbQeevwJMtz19860hZlKuR8pma5QLSFJ3LEA+E+O/vH1/7jyep/l
 x2kafGerEj0o/U18YNiDRe8duvVpzUbeHxNFqwNlM7yWOcimO9i6bVWvm
 BSuTvHDreSiMXr68wt0g9nJTd7i7ahgHfb77I/dAbr+6LmVjbmpZlnpjC
 vNW5h8iu2S1fMn6pxmzJJxRQqn4rVe5pBoS3ohAmQX3FigKL1by4Fxl52 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403160447"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="403160447"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 18:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710556941"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="710556941"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 14 Aug 2023 18:52:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 18:52:02 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 18:52:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 18:52:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 18:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUM71rlEDYGI/btD1QwDk24NlZiR7xZwsIAVMgrIli6tqvD2r9aB9EGfnKBl0ndhFs84OVOY2irZxAB/m1UvsfquLgzlAuoa2Kl4ktr/48qymNXrYM6JJFA5bDqaGtjqKDIPLNZkZ7hzGHHHtsJPENF7dDBgtM6T9+s46fMBvHC9+6TOhB/3pbX5zrriXJJNoxgIuNPt3O5w63/prMMMxPGfEdYkI4XSL0A9zK2pNeayZAEF2SDypE/nDZcijYHamLeBKy9YLUvYnAPxFGT9/kv9zkalQBh5IYTiiZU/XdwaYKPBEbtWVcpruySD8b/BwCYZq+MGI8RnaV0RRcaDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEmcfmKm1qe5b8a660jJYKRqoJYx+LPvon70H3VKh0Y=;
 b=DbF5hna+hcxtNGn41ADp2HEIGgKhaqF4TfyFg/fQFfQPIyKxCcuXQ6jS+phxEA5F+oJae+zF+NSmITFQ3XESBiXcnoDuI6n4nrM1tjLEF1PvKdH1hA1kxRcRYioPy3KKJIkWPtIXj3HGRG0iHDEr4vd7qqdfVWTEguuWxPZHa5F5odqin/NDWqPDs8qUIJF/+lpkJNV46l/5lNaqdtnCEiAbBKce5clo7bsfb6MfGfWwW6aHjhX2/RVUOUAAyjPM0rTQIGrGTvx5e6hwD5J3Zcf/Yu+LBEbId8p9lmVqhOyqzQZ9n/tL1HtXTKljy/gRW7kmi2HGWKPoKTf3aOEx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2984.namprd11.prod.outlook.com (2603:10b6:a03:8b::14)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 01:51:59 +0000
Received: from BYAPR11MB2984.namprd11.prod.outlook.com
 ([fe80::268b:145d:37e:8e0a]) by BYAPR11MB2984.namprd11.prod.outlook.com
 ([fe80::268b:145d:37e:8e0a%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 01:51:59 +0000
Date: Mon, 14 Aug 2023 18:51:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <ZNraNTaMv5Jp4qMN@orsosgc001.jf.intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <169205605123.19473.2720836544874490312@emeril.freedesktop.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <169205605123.19473.2720836544874490312@emeril.freedesktop.org>
X-ClientProxiedBy: BYAPR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:74::26) To BYAPR11MB2984.namprd11.prod.outlook.com
 (2603:10b6:a03:8b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2984:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba78490-73a6-48ca-98b1-08db9d32366d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjBxsf2qL+wCCfFAACGsgP082cOnoD59B3OEzBg76OUe1EEiBPlVAE+wsuc45P3b2yGg1p3UnJLlyOZ4W/hdd1vEDGVRC7PJXafj1QfY5uAemfjNhG9ZQJnRDiX8gB65ur521qBzneJnfOyK449gQ52idDwqSa9+zXnYKlYVWHOhw0ck8ruVO0RUjXNw1WZzJFhRf0UkO2i0eKmUWYAzz3Gt5El/HurhQ8AIehZH+k/68eRe+3FBWI62q5/Uh32Rfk7ASNh1zzkFO+bf6ttyiiFRtfE9FUJrWJXgru2pjqHKlQ3OSGEqt3opMjSm1Q/GlhuXl1oUHhL3t2/JokSA/72Sy1qXgHENcy3wZhMlBjBen2mSBf4Mr1iibIdqd1JrtJbEK5Em6gNjzl3zNKEk14AN1C8Ux/CG/dLTpoXh+GjmwADJVjYpxl+C5BisVMp6AY0fS/a50CtHECz/iBbzgLLeVYI4fz9v3kiZJQ3lBK95oWeq2qd9SG/sUOP6J7FmiVJtvTH8itLsMiSdBdeLKLFke555IiXLBGEATfczAvQjS6MMWhL5a/qHqJZJCEyk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2984.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199021)(186006)(1800799006)(38100700002)(6486002)(6666004)(478600001)(82960400001)(5660300002)(2906002)(4744005)(86362001)(66476007)(66556008)(6916009)(66946007)(41300700001)(8936002)(316002)(6506007)(26005)(83380400001)(966005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1ljaitvTmxRNkpXWUgvMENWVUhuYkNHR0pzQ3lpNG9FTXZFQ1ZxR0doMzZM?=
 =?utf-8?B?cllSNWNoajZJU0wxM2ZGbW81a1pTcVoxc1JDbmV3V0E1L25xbDcxMisyekpN?=
 =?utf-8?B?T0gya0c3S0FlTUpMLzlORENGaWdmTWdXc0ZlRFcyWUladElCOWphRnpKdUg0?=
 =?utf-8?B?dmx5Y3FldnB1UnBjdW82cXNxcTlMU1hBa01qNlFPRkVKRlNtdjhqSU5lVlBL?=
 =?utf-8?B?aFhNaVZMUU10RXpnNnhNZnZJR1lFR1FUbmxFOEU5bHA5MHFmS3krOEQ4Yjl1?=
 =?utf-8?B?a0VwaG8rQkROOVFVbUFpcEJ1R3FYb3pRNThlejJMRzk5K3RDTWdEdWJSRUxU?=
 =?utf-8?B?V05JcFdJNmFGZWFzdngrZWQyb2hKQitHOCtpMnpIOVkyVnM0UUxGSVh1TjQy?=
 =?utf-8?B?SW82WlVJVnlFMjVhUUN5MkVjb1JwZmY3MzdPTy96akJ0Z2l5Ykt5M1VrVE1D?=
 =?utf-8?B?NjNOLzZ0cmpxdWVkNGpXNnNDbTdxdFZQbjJjRGtsTzJ1M2NmRjFIeGlZRkFM?=
 =?utf-8?B?NjNGUHJkQWVWUzRhWVR3OExiY3Vqb1ZTNmdSWEg5b1hOOGYvMVFmdFhUVWt1?=
 =?utf-8?B?L2FGbGhNdEFtbzBpRXp0RmpzNll6YU9KODFKc0ZMY05wLzdPUW1JQXRzRnJy?=
 =?utf-8?B?aExINy9zajVUUFkwZGVyVjZwZVRNNUR5SldiV2Nzd1A4YlNnOTQxKzRRTkwr?=
 =?utf-8?B?a3ZrZ3VuaEVUamxrWHk5MjZHSW0rd3FFeFA5QWlpeDJBVDZIRVQweGxZNVZL?=
 =?utf-8?B?Qk1vS3pSZS9wZUttdWEzMmkrdlBmZlh3SE5mQXJ1QXF5WkNyWUs0UWcxMUsw?=
 =?utf-8?B?WW83ZklwSFBXNDRhMlc0dzZnYU83RmkyV1ZjOUR6d3NudWNoelA4d3JFNnZs?=
 =?utf-8?B?Y1BuSjFQUEloam9JZWRFTlg4NFgrS3pxS2VKSHdlS1pvazVXd3RvSWc1a0pp?=
 =?utf-8?B?SHBDcllkNEJQSlNNOUpzNGpiNFJULzFRcFljMjNzYXQ2Y01pdUtNazIzNXk3?=
 =?utf-8?B?N2Q0WHpTRXF0Z0VlQkRlR08rVEhHWllUWWgzSU1LR3B4ellvbVNPeUhQQlNj?=
 =?utf-8?B?M0pmNkFmZjRER0R3QzlUdjZiRElvblBpK3A5YnV4SmJiWGJCNTRmcEZ3bTQ0?=
 =?utf-8?B?bjliUlJyZy9xejRTeUt4YXN6d3JDekN6bGNITjhVcDlhWnduVlhMdjllWFNB?=
 =?utf-8?B?TjdCOUhUY2trVlNia1JQMmNLbFZSMnVGY0R3ZWRjdVNLeGhDNHRuMnBZVExB?=
 =?utf-8?B?dzVKYUZwcEF5eVlKZUxlSjB4bjZBQ3J3ZHNQVGJad1lOMmtCdFBlOEJaUkt1?=
 =?utf-8?B?aVRJd0RCa0tJTE1mbEJsQW1LZjV2VFp1cWZsZk9waXVoRnFMdW12c1FMV3hF?=
 =?utf-8?B?TWczTTZiODRRZGtDeW5DcHJPK2wya3FZb0E4T3d3M2tPUE1Ud254a0tFOER2?=
 =?utf-8?B?OW9QOHNta0wwMXVpeFBhU0VvclRSd2s1YytMcjUvN0ZzRVlmWkZiMEZXSjgw?=
 =?utf-8?B?UUhseGlabXFTVDVYbHVJVE0vdlp5RWVKUlI1MTFnSU5EdFQwYmhNZjM1ekZP?=
 =?utf-8?B?dVR2S2RSOGtaQ1ErREI5SEQxUk0wZHRCRHNQTTFtL3hBdHkzbjAwcU0yZnkr?=
 =?utf-8?B?djZidkNSREpubzJGMmRwQTdVS3BMVWlUcFhjaWhXR3VKb29FWXVMb1hWZkNL?=
 =?utf-8?B?ZFd3dzNMUlBRQ0ZkeVdkYmtLYTRFMGR3M1Y4Z2IxL3ZsMjhRYnh2OTdndjdD?=
 =?utf-8?B?cGs2aGdpMFVSQm03UHRNeHJDSkdhNnJPZThmaDJMYWZiLzRuVDZZM2RYdEJL?=
 =?utf-8?B?MEFxZ1lnSzRDSkhveWhvdjFhZVRMRTFQbUpqMXJwT29MYmNsRWUzcGFKaGVP?=
 =?utf-8?B?S24zZ0lJeGgyZnlMY0Rsd3RLeHcrcEhUaUJUa1BpYzZMU1hZU0pWVklQK01I?=
 =?utf-8?B?YkhFdlJhcFRiQSt1NDBiUTlxWFBOUHQvUWJYUTJlYytsOHNKQnZrMXd5MjFK?=
 =?utf-8?B?ZUFTOHl3UDNDVUtHL3lWb0hWWE5DcG5OYzlFSFM1ZWxpNGorWjBnK1VaODBk?=
 =?utf-8?B?TFpjUXRmYUJxcmZ4dFBRR3BINWI5NndUWGxiSDc0SDA0V2hMOTkrbHBNVktC?=
 =?utf-8?B?bDNPaC8rVm5nbTJwYWRwQkNLT29WVnhwU2dBdC9nT0IvTjM4ZWVIN3k4NG9M?=
 =?utf-8?Q?jOGocJlKMOytHpc4WHQsopE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba78490-73a6-48ca-98b1-08db9d32366d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2984.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 01:51:59.6297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmyot8mKyebhf5zbTWzURN0I03NTChaCPMUt+231FjVbM5Aj3SkpIHWsFqdhUA5uEif6hfJF36Z77QNA4RczdZx6+KiD94wlxWiKPxJKFvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Port_CPU-?=
 =?utf-8?q?GPU_timestamp_correlation_to_XE_KMD?=
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

Failures expected as there is a change in query_engines uApi. Not sure 
if Test-with works for Xe patches.

Umesh

On Mon, Aug 14, 2023 at 11:34:11PM +0000, Patchwork wrote:
>   Patch Details
>
>   Series: Port CPU-GPU timestamp correlation to XE KMD
>   URL:    [1]https://patchwork.freedesktop.org/series/122440/
>   State:  failure
>
>   Participating hosts:
>   bat-pvc-2
>   bat-atsm-2
>   bat-dg2-oem2
>   bat-adlp-7
>   Missing hosts results[1]:
>   bat-atsm-2
>   Results: [2]xe-pw-122440v1
>
>References
>
>   Visible links
>   1. https://patchwork.freedesktop.org/series/122440/
>   2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122440v1/index.html
