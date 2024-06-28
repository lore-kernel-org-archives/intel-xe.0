Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAFBC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 21:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AC510E0BB;
	Fri, 28 Jun 2024 21:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiRZAiOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2BD10E0BB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 21:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719609819; x=1751145819;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ltnpR3IdoWouwKvxK2xSqsglN5npYlYhi+0aZfItMrQ=;
 b=PiRZAiOCn1yIJU63DB4nSQY5pM2bIne10ej6Ggq+Fzgn5reGVXkwAWtd
 67bs6ye/nn+kihir6a0DNibva+9uGmq33rg5xnUczsxEP9aI3p5npje8M
 yltugTFQ6aTrQ7c4raI99BIz0YRkqaRIoLwdbvyDhJFVdpOwjCOaXtlLW
 qFDvl5Ej0ViAygzipu7OrvtBTGYG1lxBGQcV8S8E7po3XMn/OJfS/1y/w
 jKgPyFSVEk1BDsGF5TA/HkoddGgqT14qaqQ3sVt9ZpQk1dH6Z/rTf1nQ5
 A308gYaSJpjzAmMlkjVW2VWiQaGby5LsJNQWNLjOOtoC0rENBn5W/9D/T A==;
X-CSE-ConnectionGUID: QX9o2leOR7WDo22ivPQPlg==
X-CSE-MsgGUID: cGLPRfFqRz62lmHsj0GhOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="20622786"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="20622786"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 14:23:38 -0700
X-CSE-ConnectionGUID: cNs78LV0ROyduz9ouQPOyQ==
X-CSE-MsgGUID: gcZz/Bv/SlSoEIGiOca0Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45274077"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 14:23:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 14:23:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 14:23:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 14:23:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 14:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBhU8/XYmT83PlIBEjVXMRTPbY0gD3t4jBmewqb2qlg12jv3r/24XBjd1Q21ADes3xUXJhYqaQwkJo8lUDTd/t5w35Js/xpiDSjaDLLBt1V/52dl8M9E8QjoUATWEHb/wX0NjEesit3snbkuyHpzaVmY+HJOApibw9NyBKU+RHhNGuJ0nry9ggr8IIb3U3GzrI3r9rViVRbgJeZ0nKPfQ6H4bAJS3EB5bgbp+v0090L8s9q2Tp5v2YuObHx/Eh/tEvLSXtHYaONjzM1SIezTSAm+eD+DPTRFx48FW2criH16j7x6OFwJAwEmKEK9dKgjWyrVqQz5bf7wW2e7ATTRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66AVwDkKsr8YGMWyn8vB/RkDGFIf6IUlaO8cIIu+JTI=;
 b=jXRFuJ8BhPWj7aBYrMEiUX/IkLEoK4gh5KJr6KSu9vJAKumxdCQmcE6J4XJiztwOPGvc0L0hctM6sXAXYST3RyqVAQRgxCqXjLWedJmPInpwLwAIl2Pagjg0ukpFfUTfXBOmhWVnetvSqSuSfZCec06n8Ya1GhcfC9SUZy48TQnla9i13Ps4Xt3+F08f4myXNPnA8o92XsOQS9QM9M7WitPS0aRqeiUyEsf2fI/v6LgEYQ1vwdoMixoO6w1sZyi+3v+hk8v54ZhYxnpg0eyaDQC/7IgF1I2nbNqT7UgV7+P87bxy83omOikcCqhGjf/pWPPV9ElKiyGpv5TmF18HHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB8224.namprd11.prod.outlook.com (2603:10b6:208:44f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Fri, 28 Jun
 2024 21:23:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 21:23:25 +0000
Date: Fri, 28 Jun 2024 14:23:23 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/mcr: Avoid clobbering DSS steering
Message-ID: <20240628212323.GY2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240626210536.1620176-2-matthew.d.roper@intel.com>
 <171948139304.164095.16771248114004647258@a6498e030952>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171948139304.164095.16771248114004647258@a6498e030952>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 83621c27-eb14-4601-6693-08dc97b88bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5f+1bXmedbaGNYt7/QGLoav6Hzzqy6dcCbwt0ZZ2Wqd1+GnQRo30caz1l25z?=
 =?us-ascii?Q?FTAIn+8AalLwGVF3qzIW+c72zK4zgiA6whO1Ai+lZt8UZm3Kd3BU153EtuRS?=
 =?us-ascii?Q?oI5xP6HeJuYiV8gYbhNilVNYLKZ+8+BgaINPWiIhp2/X5KnZPHBkzIMxiAey?=
 =?us-ascii?Q?ZT5B7QbOlb9Ug4rUrz6/nmOGBfsnMmKZmSU/C7EhTDeHHYl2qh1XSRqa70Hz?=
 =?us-ascii?Q?KewaphjD1Shcvzl0um84I6izHo4pUFmHn3c+HTCNTQUVN4yCaf82Pu/3yo3o?=
 =?us-ascii?Q?osZff/Y8ZpTZwQMgAuzl11JYq/7ldYAMvBwLHVixa2z/te861I4GKf10bwwJ?=
 =?us-ascii?Q?dA1dXVrJxRGvmObgWPEfP7uf4G6dQeDcXxhliEsK1e7N0e7Q0JWf1gQBvJFA?=
 =?us-ascii?Q?R7p2uRDykW02xbqT+0BkVzII0YUqxmxkGM9EHGL23x9shXRpsIqLHwvvPfLe?=
 =?us-ascii?Q?xnK0N/3pbptIECSHc56b8XxCNEgzAXqPbyBaST1InpjFOCTu+zp524YGLXpA?=
 =?us-ascii?Q?Bqu6ixEK0o9hywRLC3/FE00aaUHykJv8nUNq+TstOhu0XYoTvK4kgsileS4g?=
 =?us-ascii?Q?2LGZ3ujVg/zqJl8MW22NrTeDyNtWlTuGxhMryT4mmDo8GebseogIvlz4NYUo?=
 =?us-ascii?Q?RQX4UybLvTrd5uuxqNlR0fxe0gb+M/TU9P8CdBKbxqEEf3+sWSnwbur3Bseb?=
 =?us-ascii?Q?fCcdRNY1Sw44G35y19EiXXUDBWp8+CrSD7yDxecPzk4YQsElnokhZjpJGdVn?=
 =?us-ascii?Q?c9jPcycmIXLAvED8Moy+mfFkzG2JU5a/coxXYiRUgd1IgKvZQ9dq87t5vDmW?=
 =?us-ascii?Q?F7mfhEGUoha9onLEZaZGMlkCVI8GvhdbsJf/K7M4zmHpC7Va8g28Ql/Rj54U?=
 =?us-ascii?Q?OlrT8zYc/UMCzl6DoS7tfN69WuNIwiR/nJWLUpJVgSIjAVzPztTiv0fxC/GS?=
 =?us-ascii?Q?oIqFbGGPnKfZv68WPZqEIaemupzGcNJUflEloEHg1mPKSFBeooXovcTvE27H?=
 =?us-ascii?Q?1jvcne8ehfNMzWcP+o5bdib19pXPzcpexQheLGxq4RpePk8NjrSgc7Dg3MD1?=
 =?us-ascii?Q?ShZmefnNJZ02I4Ww18VpKXUdKGPJ1kA2i77GC0aTeVMXLHuvoU7lnGjHYoc9?=
 =?us-ascii?Q?rNJPAvd8tDdQHwzbxJkv0MYgivV5+4mzoxd0cQwFiP/Dw2PMOwVQgT09HJ4D?=
 =?us-ascii?Q?LpeN8/6TW5By8I7ciCDHIiExkJEIaMULNbdi4l9orbdyz+m6MrKgUS0kjyqN?=
 =?us-ascii?Q?d2OJXl5okJbD6f/EtcVnVGJj7BzBGWEb/fzz3tcWKzSwwbPWlWq/YpK5JA5u?=
 =?us-ascii?Q?MF8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pDqhd+BMP8WCEg8fYObGzdsCrc4OyiOPVV+XGGT7Smls+23Euam25UrO6d0p?=
 =?us-ascii?Q?35Uz5wDxCrvphb4KpzF4a3hVEsPGX5fSFjzMylGYfZ7IbkxUHLdIUNSvpjqO?=
 =?us-ascii?Q?mydh8TsExBP++0YW22dgBLosBrVGMtR7eQEYnAiwfxjpxvs0kDAtSgsxh1RR?=
 =?us-ascii?Q?4J1aiUNGcKb8Xvd1FTroXD4gb0ozBQV/47ArsLh3Jfro4hUIcMQNrPXbRJnG?=
 =?us-ascii?Q?PPQB++a0K8FwkCHPWBnXcquT5G5jl8S4twBXZt4bOlhbKIbh/pFRdUoQCbeO?=
 =?us-ascii?Q?ZlKtG2BW0JH3yTvU/sv+C3tmtZmiAYgd648hB9DqR5Ofwzgo2MuUPYZMTFaC?=
 =?us-ascii?Q?CdzGU58qwz7vEXpIP+ulEQqHNca0R+bbY7hlmJCqj610aeZLE9xW8glFpijq?=
 =?us-ascii?Q?iTqxXi9WVBSFiiyaRc/LKD8uc63DN/C85wmcORBXfdaJ4Vd6cMgWwoIW/OhC?=
 =?us-ascii?Q?1xCto+MOPQz/userCvfF75oH4gumi8jOfKRxWGH+3bPDVncVa1CYvgc+/KxM?=
 =?us-ascii?Q?DCAJf9mPLidE86QR6OndHincrDPSNohBSdht4e3RSaOcmGBNpTjusAUTd345?=
 =?us-ascii?Q?Gam4CJ3VgBEf6+/XwfohOoqdR3AciOZAE7JcgeRiEDik5dVOHxO+yC+AEWPk?=
 =?us-ascii?Q?IGUA5kZOiHRaEgz7Aure5bmR8nks8UMovBAbFSlXR7r7KSGI6XFUP3qCW6Pc?=
 =?us-ascii?Q?runU3ZQdIIu3/4XSyaEAJtmb6CupL7mtKXk62hdJvu4lqWOCk5RR0rWe2JnN?=
 =?us-ascii?Q?9TeHwBwmHOWJ8pCQidg+OFBS18G94w0Svi5WYBbDzOzh9THF4YlOjZbkdsjY?=
 =?us-ascii?Q?WdoyyXeTfyCra8S2xvacGTvTy8jq0zPJCZVUYGDbAXp8H2tpPMD0BmWFnomU?=
 =?us-ascii?Q?/Rzmk/3SugT38WMt+v2o5krEisdCbUsE2G1f0ucY5bvAvjU+7bEFlburc994?=
 =?us-ascii?Q?JuGDmKG+uCvPaR+a8/OGRJfdaN9PrvlaL0FD1XqXmeLxhm5bN8XztsC6uvbl?=
 =?us-ascii?Q?1hZbLLCERTejC46mstPMt5LB7NNZWZhCjolIVwTaGJvEtZtouz7W2emXxEwn?=
 =?us-ascii?Q?E/OU+sdhCnz7xEwqwzWPD0Uev2vaIHt7oSeVd/QoW3nubpGgf2XtkmWasC7d?=
 =?us-ascii?Q?1OEW4MT5ghfzCshGNo9+n1lQKgPwdRwF5ZL0Kwpn0NCtJihoAObp6/4klMB/?=
 =?us-ascii?Q?XdAoYi6CsuAZNkU5MLjWAGzdWzTfSIfe0pVynD2lp0xdirX1cwIMA4qvWe4t?=
 =?us-ascii?Q?G+o0V9GW5Z/eWdInFv2cteT/24XXOftGTSb85KQQby774WzaJ/qB2eknvH5p?=
 =?us-ascii?Q?CxyU7cfVRg//l+uwmhXG+u1zpmBQbdxwh7n3JRsD0IzKmxdw1yrOWux6YqLf?=
 =?us-ascii?Q?H+7B4ksO3Gj5cmzJHFBASpYkqN3kQqiOkr3tqqh2xXXbDrNqOuia4r6bHf7N?=
 =?us-ascii?Q?cGz7v5rbaFWA57cZNFjgCThmWp9sJFhNO4wWEpd6r9i6iUgN5CRydHAFNMw6?=
 =?us-ascii?Q?EP0AotZkBwihIZB3kc/dmWXKXWj5is08SQCwBwuBN3xr2/GicQFRMefmthfL?=
 =?us-ascii?Q?YnVI4XOYPO/um45XTxXL/rxGqeVRfJOZ2O7ajNgBMFgwSFu9z+GRj9AsU+uv?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83621c27-eb14-4601-6693-08dc97b88bc9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 21:23:25.6349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4Y+JVbV5TH9Gk7F6OhUIEg1ywx8zw/IEOOCu2cCRcBakO/5ebpw5O2WtQHHNS2LBkH8mP2hQ2+SFcOQJOERq303M9VCxEZ0ZeFS1MIfCjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8224
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

On Thu, Jun 27, 2024 at 09:43:13AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/mcr: Avoid clobbering DSS steering
> URL   : https://patchwork.freedesktop.org/series/135452/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada_full -> xe-pw-135452v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135452v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135452v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-135452v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

Looks like there was an unwanted display disconnect in the middle of
this test and then a bunch of display warnings which caused the failure.
Not related to this GT patch.

Applied to drm-xe-next.  Thanks Lucas for the review.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind:
>     - {shard-lnl}:        [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-lnl-8/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-lnl-6/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135452v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@modeset-transition:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1201]) +7 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_atomic_transition@modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#1252])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#306])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#308])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][23] ([Intel XE#616])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][24] ([Intel XE#1551]) +1 other test dmesg-fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#323])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#323])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#1874]) +1 other test fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#656]) +14 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][36] ([Intel XE#1035] / [Intel XE#1195])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#361])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][40] ([Intel XE#361]) +1 other test fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1489])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@psr-cursor-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_psr@psr-cursor-blt.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-adlp:         NOTRUN -> [FAIL][46] ([Intel XE#1174])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         NOTRUN -> [FAIL][47] ([Intel XE#771] / [Intel XE#899])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][48] ([Intel XE#899])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#756])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#1932])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1123] / [Intel XE#1201])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1126] / [Intel XE#1201])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#1600])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][57] -> [INCOMPLETE][58] ([Intel XE#1195] / [Intel XE#1473])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-external:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@xe_evict@evict-small-external.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#378])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1337])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#1173]) +1 other test fail
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [PASS][66] -> [ABORT][67] ([Intel XE#1358])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-4/igt@xe_pm@s4-basic.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-9/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#944])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#944])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_vm@large-userptr-misaligned-binds-1073741824:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][70] ([Intel XE#1214]) +1 other test dmesg-warn
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@xe_vm@large-userptr-misaligned-binds-1073741824.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][72] +1 other test pass
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - {shard-lnl}:        [FAIL][73] ([Intel XE#1659]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-adlp:         [INCOMPLETE][75] ([Intel XE#1195]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-adlp:         [DMESG-WARN][77] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][78] +1 other test pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-9/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-dg2-set2:     [INCOMPLETE][79] ([Intel XE#1195]) -> [PASS][80] +2 other tests pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>     - {shard-lnl}:        [FAIL][81] ([Intel XE#886]) -> [PASS][82] +1 other test pass
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
>     - shard-adlp:         [FAIL][83] ([Intel XE#1874]) -> [PASS][84] +2 other tests pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][85] ([Intel XE#361]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][87] ([Intel XE#1473]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_basic@no-exec-bindexecqueue:
>     - {shard-lnl}:        [INCOMPLETE][89] ([Intel XE#1330] / [Intel XE#1622]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-lnl-5/igt@xe_exec_basic@no-exec-bindexecqueue.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-lnl-7/igt@xe_exec_basic@no-exec-bindexecqueue.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][91] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [FAIL][93] ([Intel XE#958]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_vm@mmap-style-bind-userptr-either-side-partial:
>     - shard-dg2-set2:     [DMESG-WARN][95] ([Intel XE#1214]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-either-side-partial.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@xe_vm@mmap-style-bind-userptr-either-side-partial.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][97] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][98] ([Intel XE#1033] / [Intel XE#1214])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][99] ([Intel XE#324]) -> [FAIL][100] ([Intel XE#1204])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][101] ([Intel XE#1231]) -> [DMESG-FAIL][102] ([Intel XE#324])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][103] ([Intel XE#1195]) -> [DMESG-WARN][104] ([Intel XE#1214])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][105] ([Intel XE#1473] / [Intel XE#392]) -> [DMESG-FAIL][106] ([Intel XE#482])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][107] ([Intel XE#1760]) -> [DMESG-WARN][108] ([Intel XE#1214] / [Intel XE#1760])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada -> xe-pw-135452v1
> 
>   IGT_7904: f13702b8e4e847c56da3ef6f0969065d686049c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1536-39235fee2ef6c0933097ee921c86a676dba72ada: 39235fee2ef6c0933097ee921c86a676dba72ada
>   xe-pw-135452v1: 135452v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135452v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
