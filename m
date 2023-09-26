Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A3DE8180F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 01:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D9410E33F;
	Tue, 26 Sep 2023 01:37:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EEA10E33F
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 01:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695692256; x=1727228256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e2M2IW8JsNf/5hi/whH4l40OC8PCg8nDyW1bWlCnUEM=;
 b=I0GjeJ66anV6MKMH8yPCKSQPayLL6KsyQE/T3MmQWKumsHK9ZA/HzUaj
 UMXKEooPAxpbJx3gU/cNaV7IooBG/vlol6So1v55GpfnrK4qYRME/o+zA
 bV5OEr0PnojpqtCVysUoG0nuV+oTRgEJiRS+JW8RxS7JVMvPpqNw/sTXQ
 bhARgT9XaPptj9UD4c4cC/QHFul05uJZ/KLyeOsb2X3oMJovd/JEhkBgr
 TvmUBQIsNTj9zpHhV037Y+RoDYqP/h/OdR50Kq+57cfQ7XY+WTvsBUHSl
 hIANxwnouABYyCYQhHEYtBFR5MRP3hpHm8V1P2GFc2DA7YzMjcN8zO7Xf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447953813"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="447953813"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 18:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838824783"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; d="scan'208";a="838824783"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 18:37:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 18:37:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 18:37:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 18:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+RV1vCY/NIRcKN4ee1/LxpeEx4JpyWXBHzgr5yWVF2yyzX9OCdXIzs8CdVA7CsJE/A1etzRQMjBv+GkNPH9QKpNjZt7rXhS/YIqOvPYaQlNqxo9P+5tI4BzR6qv7GEiELYiIvNWAI09xqgwzHfICodJIDMxR+0paMMXD4mUXkqiiyMjmoEBU4ws5NQczP9CEFaw6USZTzKrLPN02ObDJ8VKb02xCkGjMi3L4wN1i1MNDTxMrqGByuRa6N2kbmP7NMQ3SENynvrz89lnvO5s5DmGxrP55vX/uBRshXNBHkyotjjtFVwSPzeYXzpVh1lwi2FzQF6vcgn2l2LcNAskOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anzkEcTEYssHtyomPolu7EokV/HQ/GlnddV1po6QFpY=;
 b=oL5Gzs7DeCUB8P0dvBerbuQAvNekuz81Qwx9wszWkTGLLkuEMsv5Tltlpbwhl1A1zFa3vh22cPRS4CKqWoNdJYG3gvjoobWK51Z5yl+mru58fouTfmkQUk2MBntZ5RgII/o6lEeZVLdU9r9XKqZDgckwyHCVntbNAbpfLS/YdTEfdJzBK3u0wecZAqrp8gFfyYITzP1HEQXTW98gpRZSlIAQG/b2Y4y8bAF8i12ydDWEOeFRHibnhd0u8INhEJncPZa3AKKw3aVJhJ8VGFNrmQ3kksi5qj3lEbeO5JwUxg1B/6VQjWBit/mtWWgUIjW7b1ulGzGPwEVxTjrSgkg0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 DM4PR11MB8180.namprd11.prod.outlook.com (2603:10b6:8:18d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Tue, 26 Sep 2023 01:37:23 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::a51e:7713:dd10:97da%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 01:37:23 +0000
Date: Mon, 25 Sep 2023 18:37:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZRI1yPmabDfopQ77@unerlige-ril>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230920192940.135004-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|DM4PR11MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: caa2e0ef-4e64-4b9e-6b2b-08dbbe31213a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4IF+fiYw8UzQIjgTdIcnOdsxnOiODl12hupHjIxPhb/sRb9Nk7e/G5RSfpPGdAkFcyuAVsJmi3mplcaWJ+Uxp9s+pmoOE8wtR3+fOAEBU8B4Xd1mU4pKIFfHlge6iFCK1mlJudLMxOC/F3Fc6Fcy64pBHznYF/lJMlFo2uwWkMHnFK3q8ctXRKSfdi+9PTBTkgEe5phJi/XPOOs/0Ovw7ICl2dsX0/4BfIPkbXJpRI8k3XwLXEb0H5U/l5fsjxKVjN+zXwOt+tU+J/bo93aW2hqr2Zfl/LVLrTW1OjHC0p6tLYqaieOC5ER5+H+wGWyLStotvwNiVc0G/mkm/9GClz2fPaUTl+DmgSYrwE+N0GIVuHDm2SS8Lcz/RVz7q440ZXFpPRdMqWRCkeQi9hBOJka+eEHhtgNgdCOV6B3mNSir2Z7Cmj2lgIsNBIamAuJ1Sj1vlKMmQJ+ohphXKgBXMJPFmalfQM0xs0RCYJgvcsUrv/GabU0o49RhgOiRp8Ah+YAaxjhfu9giMl3x9rJxKD+KAEHyDTy1xsVKHaHX+67Djy2XubzL8C155Q1eDPapEXxoZWuRMU0Yx+e/tiV+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(366004)(39860400002)(346002)(376002)(230922051799003)(451199024)(1800799009)(186009)(6486002)(6512007)(6506007)(38100700002)(9686003)(86362001)(82960400001)(107886003)(26005)(4744005)(2906002)(6666004)(966005)(83380400001)(6862004)(5660300002)(8936002)(8676002)(41300700001)(4326008)(478600001)(33716001)(66946007)(66556008)(6636002)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTdwb3BsWlh2SC9FTDZQdjhGeWMwallaZGRWalp5bGpNc1ZEdktRQUJXSUpO?=
 =?utf-8?B?ZHV1QkYzcDdETzhZcURJY2Z2R2xyZzlvY0hHU1djQzlYNFExOHpmN1ZVUnRy?=
 =?utf-8?B?SkdRSWdCU3VubVRvUnhHeE9JU2NOd3BqUFpLN00vcnJCcGpPT2wxQkJjM2NC?=
 =?utf-8?B?cnMvck82d3RSaDg2V2c5VmJKQVVuOTFKSG9WSjZlTHdjTFZ1aDNXRklqNzJJ?=
 =?utf-8?B?cGpJOVJPcGMwWE02KzlqOVN2RmhYd0xDN3RjY1pQbytTbmpkTzJVSkEyM2lB?=
 =?utf-8?B?ZUk5WE5Iei9xUUw4ZXYxc21IYVM1UkdXZklmNXFJWHhSczFNd1pXZEJ5ektM?=
 =?utf-8?B?cWRPcEJjc2F5VmlGQnY5TmRCWEdXUWJVdGtJTzZSOUJtNTcxV0Z3d29rRmM0?=
 =?utf-8?B?U1cweFgrNmpCQStQREdwSm1iQmNPTkJneHFweWtHYnpkWUM4d0oyRTlPcXZn?=
 =?utf-8?B?WUlwcTZjalpmTFhhS01oaUhMSW9hSXVPZDg2TkhvYWNUT08ybndZdklMYVZa?=
 =?utf-8?B?WlNIYitSUzZWalBQMG1Xbm8zRERWelQ3ajd1N3lXSlhTdzFobjFSNnNyQ0Y3?=
 =?utf-8?B?TTBvYlRTQm9pTWkxblNmN09MbHVEa1BsNGZCcWVWTkRaQ2dEM042R2plZU5Q?=
 =?utf-8?B?bnBOSTFMRjFMemJMdUZaKytNVUxUNGNRV0NOSWpYN1dhRjllT3ZSODlWVmtw?=
 =?utf-8?B?dzVZL0pHYUtxVUsvUzZJRWw0WGJEaHgwVmtsRFo4OU1nSUpwckdPOTc5VUJY?=
 =?utf-8?B?a2pmSGlOanFpTGJTSG9BTDVlM2RyUUF0VEgwWEkxbEtmS2IwQTRnZDJkN0lo?=
 =?utf-8?B?Qmt1TVpMdHRPMEo3S0RubVBmR05BNUpoRmxXU2JrbnkxbVdEanpjRTZRSFNy?=
 =?utf-8?B?dG1MblZnZVZEdzk1bnY4czdxdlhoeVMyVXZHZ2MyQ2xPN1V2RTZ3L3BGWUUr?=
 =?utf-8?B?NUVydGFCMkNiRDZWc055NVJZek9PUm85M2hpZzNJSFJOdHB4cTJaM1RKcnAv?=
 =?utf-8?B?VU0yeXUyUlZKN0NGWTBRam5oK055WkhOMkRKMnFPSjRndlFRNHl5V2hncElI?=
 =?utf-8?B?eldNa2VLUHRtWU1iY05BZ0pCTVR0U0I3U0J0a2VBTjBBdHVsY1NwQ1hDaHJT?=
 =?utf-8?B?N1grSndjRFFNTGtkQlpEZ3RDRnU2dk1CR0c3cHpoTXRNNmJTMEFlS0VZTTla?=
 =?utf-8?B?ai9KQk5FWHFUWk40L1kweHkvam5ZSjltQVZoUEVua0U2UXdFVVFmSVUwUnpW?=
 =?utf-8?B?ck53S1FleE1wV0RKTGlSTFo1OFVBTStqZVNCa0ZqeFJMdXJnUTN6MmtsWVlj?=
 =?utf-8?B?UGpKdlcwNXZHWW5QYURNQzhyYnNUaENHYTZ0eGlIREo1N0lGbzZLck5uNkFw?=
 =?utf-8?B?RXBzdStpUkdsdGRDQWZMRkJTMnF2RmdyRDVMNFZ3aDd4SEl2SXBjdDZCVnph?=
 =?utf-8?B?cnNBR2dpUWd6aVl6R2JWQkJ3Wnp3cWRJNDVMSzk2bkhoZUVsekJCektWbnkv?=
 =?utf-8?B?eDFDUkFwbEZ4WndkODdQRkh2ZlBIZm5CaEdGaURYZmJzZGhBTmZ3eTlXTmpQ?=
 =?utf-8?B?Yit3YytNNkNqbHZwamFabVR4ZWJLUXY3VTdiRGM4VDVRUTd1dGJQSXE4ZFls?=
 =?utf-8?B?aUdRQVhtZE5ENmFDamM1bHc1MEFwV3p0VlBFemhsc0Z6L2NaS0RpUmFaVXZ3?=
 =?utf-8?B?dGo2NDFzVk5uSmFmVEExUWxHOWJyNHU3MGxubzNBcnZ4S3RKNUdCRkRNLzRC?=
 =?utf-8?B?b0hZM0xmWG1GYjNSbVkxUmdkVldXTVI2ejBjejZOMVpnS1ZzOUlqSC8yYWhB?=
 =?utf-8?B?Y3V4eWNWSWpuR2VpSnJxcllNNTRRSVUvUmVnalM3anFiR1hVanQ2YURtOUdN?=
 =?utf-8?B?SytGQUErNW9BUmtYczdseUEwWkd0RXNsK01oQzdoSGRNcDZTdTBBRDFrQzZB?=
 =?utf-8?B?eEhhZFJSRnZpOXJmeVFTd3Q0dHlzRXRWenpMMThMa0dhd3hQMmJZOUJYK25Y?=
 =?utf-8?B?T0IyNzZ1VFFpWWlXWDcySFQ4Z1V0MUZlZGk5SS93dlkwRFVidWIzRDh5U1RS?=
 =?utf-8?B?VVVBL1d3ajF6MlNhN04yeG1zaTZhSExDbXZpd25Nb3JTTnBZbjhDTGlOaTFN?=
 =?utf-8?B?c2tDZEQwY3VjK2FnSUhIMjhTeFFzbGlXQzJ2QVdhNGFoVnFuV1hMdmswVTZM?=
 =?utf-8?Q?z4oj+3SM7PJAWsBNrd4CUVA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caa2e0ef-4e64-4b9e-6b2b-08dbbe31213a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 01:37:22.4876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtu+wSYdt9+rk6+nerTAPx0nY9q+g/vMKaulkkP+FxShK8RmrESRTrh/so6tCjS/AszRiHwMOyln1MlVe8smNanNUappjmJ4jQv2T4bCXCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8180
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 03/20] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 03:29:23PM -0400, Rodrigo Vivi wrote:
>From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Perf measurements rely on CPU and engine timestamps to correlate
>events of interest across these time domains. Current mechanisms get
>these timestamps separately and the calculated delta between these
>timestamps lack enough accuracy.
>
>To improve the accuracy of these time measurements to within a few us,
>add a query that returns the engine and cpu timestamps captured as
>close to each other as possible.
>
>Prior work: https://patchwork.freedesktop.org/series/87552/
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---

Should already have an R-b from Jose based on this - 
https://patchwork.freedesktop.org/patch/552682/?series=122440&rev=1

Thanks,
Umesh
