Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9566EC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 16:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6245610E4BB;
	Mon, 11 Dec 2023 16:29:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF5C10E4BB
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702312179; x=1733848179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=roVJLAxJz51TG0LTkHbiy2itSC2nfh++nvEXelAHJaY=;
 b=ToE6v6KiJBhIb05sio9QQQX8xIWbPbrGUcUKwDqcHXu6CPxL9vBC+wKQ
 TjHyedROFRKDmKLzuRPzOr9Vq3x4B2e7VSj6eDCwPk/Oa6YP628g9sw0S
 mbJleSfeAgT67Zqtp+fioaMhmM+d7jIVuue8P7rwumtJjGVNLtlCXlK4s
 jlSa5O33FAmd7nZc9NTAwNidZggV4PMAfCFy1U81cScqwSET8mPrHYffb
 VjBrWBwizWhZdaxuPmw7M93z4Xkgrj5LWKv5rX4ZnYQheCX/CLC8ClHOh
 KBi4v+Y7ggnjHLudO02kYSCJvRDNnXQzrKmGzlOh/2JGU0itltWc5nrLK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461149800"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="461149800"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 08:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722862500"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722862500"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 08:29:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 08:29:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 08:29:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 08:29:38 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 08:29:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcWXhjcWDy7jAkkaOhR8pe+rgNjWpzfP4YCBRcEnIWyF/LfQu8JeaOEESlcB/CBAcTnPmIHd+vsVm8BPkTelBBwHAEzT/d2j9UftejRcDTs+UYTNcroloD8AtHE4tH/Up0F2icgbboxphLBFCLmV8i26VQemjvcnMN/frOsCxF8/mNbATBb+8ab5GxsjS7uKC+crSJP3uwySkGextgTELHbqoZkGowX01vjfsSwcQ9lsYF9HiRuaw0ITe41DYmhFJnIKVI55bF1EFbxrKhVHzHM7n1AM5boTTEQVAXH+4vWVrnwkXClWsV3nudfPuzGyVtnaRFNY7y8bjMLZf8TsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roVJLAxJz51TG0LTkHbiy2itSC2nfh++nvEXelAHJaY=;
 b=RhoIx/ndAFTQ7VWt+xfYkd5br8WqjyzIgL7TytKuPZW8DfFYU1nLLycHlx2T4d/qeua+vUceAy/+4Ptt9CoN/JJygKTe5NGLyelvDnLkYRGNrBOyiFpx0shidpqXqNnr9FPW8tZFhGIEbLu5Ur9grFEAHfZaHV1SXGYxtYdo0p0GmiVtt9XeZFQZdRBA65D6oLOSWXoOA/+G9YizagyUCyRfC4meIRgyo5ToYtcy3vt+o1w6khk4hG6Km4JTyJQpWitIK/AnOmSXsoHqMOPfP37kfUS8nKBmMxccV171A0uIFDdzn60JHjCEobCk9ZX4lkheGLqlrvAxguPKTPEihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7879.namprd11.prod.outlook.com (2603:10b6:8:f7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Mon, 11 Dec
 2023 16:29:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 16:29:33 +0000
Date: Mon, 11 Dec 2023 10:29:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/xe/pmu: Remove PMU from Xe till uapi is finalized
Message-ID: <tm7cscylygtne5tv2xv7u27bneokjrepgqtyogppft6eqsncfg@ef7wrbtvxcgu>
References: <20231209224352.2720403-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231209224352.2720403-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e232e3f-ccb7-4ae1-51da-08dbfa665b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQMi/OCpXerd+n8HOeQi44H3keiKJpmVlXWql4HYWpxQfl7gatgj1rAYh+F4uVFzyQN9+6JQbVlNnQURyiyDvWdkyqZjtF9VTAA+rmtEX0kwHvmAuc/bMNPSuLZU4EJ2GMB8Qaw7UGAv158nTkHipSeyfmmc00w9h8Yz+N6gfHtu6LjuGuiBhSsOUKhEw6dsNHphAYsCSy62etYuNKQDgxbWuluLvmoSK2GCs5vpB0CEGzTIjHsJiir3ZSVPWQMQOTwQuhDEHT56LsXdU3FGMuffQGVs2GlVFhb7EguMUVRWI3To55y2/NeqepxB+gUzWTNZdSEqH6jwHdNyzVyyi23jBgPmJdFTWr5fvhaufWToeDL5gFXgBemPRKzu/3I1gpkMSIvrJ+yXIU8h4tJDkWt1k/C3o7zKof09JiJX2cmGcV2gkgdaKOOaf9Ejgi1RpjgE9Afu2MkZPnSp5cjXN9t4bvkd4Z2EfC8K7HqV36n/NsRE5jdyqxPw/2kvmvQyWetF0NmpUnTYpIIM46GqoPcDY1Jz+j17wCVHWcGh8dNUB+5vYWWxsoItnYXDmioa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(9686003)(6512007)(33716001)(6506007)(5660300002)(26005)(107886003)(66946007)(6636002)(6486002)(66476007)(66556008)(4744005)(2906002)(82960400001)(41300700001)(478600001)(86362001)(8676002)(8936002)(4326008)(6862004)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rvq3VYnruVjGb7EAKrYFYJWzsBrcsSyiuZHlpz7+5SBLr5SGrzbNhkUAMn9s?=
 =?us-ascii?Q?jW8DSZcBlydQHgAvekYU9KqW7E8rotvg1QqOenowhQ6qsypGsy8+N23jxgKK?=
 =?us-ascii?Q?mWqHQMsbg5KejGUfySXBU40yI7iaCYoKI7ZbAOw1vmIvq3L6XwosrMLegMdb?=
 =?us-ascii?Q?CzL6C0rzZxlbrdyqBlGdn34Mm4qddSQ5yW72GhRCaypIdko9ugfqUYacvOKP?=
 =?us-ascii?Q?StGw+lUKEd0bjDh5q456vldMsCEIUOWLlfyRDRFsaATEoAMKvLKZuNbZcK6/?=
 =?us-ascii?Q?xcf1jr5ysdfEnI1Byx3ES9iAESvxpiIQq+1RHwNhwdyoFJXdPESgfc2Pi+qJ?=
 =?us-ascii?Q?t7J1JTputNamp86TMjOGR8JFo8uPd07FLiT2zwqxbEX7MMWVT84GMiuj0QK9?=
 =?us-ascii?Q?tkA+1Y/CHIWUrzEcDmubMth/LCvgxIjGQD1CIzjyEnE8FoSAxE9PH3a4DU57?=
 =?us-ascii?Q?VagcmF/3wGjA/NtSVpg2uiMYq9klhF5mjWZ7X4VKN1LzTYGvZY39cYE67ci5?=
 =?us-ascii?Q?9YqsHjpzt06hjtZoNZby/nAN6c3ddNcaW2cH4Sd9wub5pV+DbXkiJ/qQ60uM?=
 =?us-ascii?Q?bWL64DBk9F/CVFS+Rfld6imP10/6VA7sl6ilZSI/tvbEMEbBpXdTmZu8wBu4?=
 =?us-ascii?Q?n0nYwfKNQZViuRFLvncODJmlTIhseqCNMOXUJ2Abxg9HKPD6roftpKx0Sx2B?=
 =?us-ascii?Q?6sGGRimt/QMZBcGwJC1GilLlbWIgIdn5bf+ne41QyRGhDAEr3D3d9e5jFmos?=
 =?us-ascii?Q?eF1gYkccte+JkbORvS2RpEf7z49Wabx/dmJxJRNbsA67wCS7VTurtoUXbzOK?=
 =?us-ascii?Q?GZQ9ZEFlMDQZ/C6MnajrbLbD5UEo4BnUvt4iFGBumryQROGtPdalZYbNHTsG?=
 =?us-ascii?Q?Rmw+Bmmg8+sC8pQffCjBjYBuROXfUq4oqTpL/k8t8zRnDKjsUkaoJQHTmiBl?=
 =?us-ascii?Q?xWx8VBejBMMpLM+BYDa+yX0OnZvrYeo5+d4N2QAXzaGlqKdM1KgoJgTGThjy?=
 =?us-ascii?Q?h8i4lxIjK5BXYJCTjQi1ArLH9BybPBmRd/6qzgMNYlu5UIZko94qis1JirI4?=
 =?us-ascii?Q?k80r7LeKAO8FeK4yHkR6Pe5TjQiwSITipOekAUKxwtOEjdeDpwzJnB/NGW4Z?=
 =?us-ascii?Q?EqAa/Ivc+U00o95R2IvuxghLpSKngCcd3Rl9vAzVLksBhUItPu3xeBVL+rZX?=
 =?us-ascii?Q?1LSFaEDpX3T7yO2QnWqLSPAF/TlhGuttGKBY2rD3lzG/ncSvk+m8NcHYATKM?=
 =?us-ascii?Q?N1oN8rkcGTMLkp8KRN3z3/UE4iN6CgOrh6ztohiWBoMJ7F7BVEMT1cG/UqnB?=
 =?us-ascii?Q?/Dafgf9V1z1rXpCvkmRl+ZEZfr/0z3rCKrDc+HCap9UI17kECFwRv2ag6EWl?=
 =?us-ascii?Q?edNwJ4FMsyRnA8K1Q9FoK7x5805GEDAFc9pNZwwyV7W/VZXtgaGazkf3GbpR?=
 =?us-ascii?Q?zTQfUYy4aedFaqTv/wv2DahiEG+JFkyccBmtsMe+o/j54uG08dDSdpHqm8Ex?=
 =?us-ascii?Q?P/IWsbJmY8bwcDCu1xxYqgvvwPz1zlo5NlLwTchnCUTPrSbXfxyWm4+9mcf8?=
 =?us-ascii?Q?VtT6OZQrWHPzT8eIhOGXvl8OIztbxEkL7Yzrsg401xSPeMXrm+mV3BBsuyZo?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e232e3f-ccb7-4ae1-51da-08dbfa665b98
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 16:29:33.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDkJYebyZsQDKEMcsbTheSW2oMJ/MRcoSwt4g3HmppIATShmMNbcpOvFApMWuh4gWhltrAKWGwcy7Q1sV5bCI/T43j+8egCrGyxqBYXAJy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7879
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
Cc: francois.dugast@intel.com, intel-xe@lists.freedesktop.org, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 09, 2023 at 02:43:52PM -0800, Ashutosh Dixit wrote:
>PMU uapi is likely to change in the future. Till the uapi is finalized,
>remove PMU from Xe. PMU can be re-added after uapi is finalized.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
