Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1137EC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 22:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF45A10E5F6;
	Tue, 16 Jan 2024 22:29:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4393610E5F6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 22:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705444165; x=1736980165;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YqTQXZldNsupOWmOr1yjJ2Adck0k8C8TGMOaYkhb83M=;
 b=KQ03XUP1cqC+LKfxGp3/HJF7JiGyMM217hJuJNdcoglJiaiUo/+P1rfb
 Sroqiul/bYlV/vs1JjdO8j0u4CeG3Ug+AUHL/t1rnmocirnn2QgMJMKCB
 4MDBRe019AcpdoqptYsSwPgKitUuX4LGGA5UlV4Uiw5W9ZDtchUM5TMf5
 pobq7OJDReEEzBuAZphUxrvGB0R2ujAk819YCVc9rRDiYfwlXZZmUviif
 HRQTwIbvb4eYtKEz67V+2OaMIqocvy0hwnk/fBzZmkO3bNddBRg1coAPG
 42h+kzMmgrSpn3IrVZXjS07tv+87IPdXWs1p/Ee1q7lDWTdxtUw5Sl6g0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397163064"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="397163064"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="733746024"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="733746024"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 14:29:24 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:29:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 14:29:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 14:29:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 14:29:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pze47/Sxmrr7Svf+Eobd9E3oUCHazHOhvX6qifexPEddH6To7/DUO/WBKI2xAv+nVEcK75bGJqkKGZzKJJGQTN5dOkxMsZLB8YGs/81S9beBZVddhXmsN2w8SYkXoyjkUfm/aYgEsyHyPEYYZMVFtBqvs1CPFvc8tU9QRtWfs+mkEM+WCNlnaCJQQ5B+/PciR5vaw+OsTY/K5Tg/2qehh5RsBXznviKIyDSbZMHebZvZBBPHqmcHBYYrZrC3g7xPDEE8mn9ZNV5xhVv9F3iATiaWDHq8yrk98E6+/ZZLESz2eYaA7Eh6himpWRUs3Xz1ulWphRTFyR0ete6c6Mb1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqTQXZldNsupOWmOr1yjJ2Adck0k8C8TGMOaYkhb83M=;
 b=dSIrbTfRn8HhdJ+FB5r7Su94c2Rb9y3+/azieM/EHUaEEJiQN+UhYvXwQ+Hx/cClpEu+fITfUdrFILBYbMJpiUh/tnVK0JnH94ra8zpoyqym3aDU15k6+m+R08r5Lt7mhRl1TvHvMIpqrW/ey+3FepNAIckA4lnCUwTyzIz1JjgebZke3+Kuq7Vjw811VvcZoxXlpEClTTGJ4NXAkmg1aqGQ/0lqMzn5Cy42nHjlHt0SHaAFUYRU6fh1nixHPUGYYdw5fwiV+EkjJv2sZBL8V9Vvo+qUFm8f4oaHhnchgIUz3TnT6hZNBd8bF1+FeRXZNiPeSRoJ1nqrTC3bStj+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5888.namprd11.prod.outlook.com (2603:10b6:510:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Tue, 16 Jan
 2024 22:29:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.020; Tue, 16 Jan 2024
 22:29:21 +0000
Date: Tue, 16 Jan 2024 16:29:20 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Rename num_slices to num_cslices
Message-ID: <kmp2gi76g5obllv5f5tnnybwhdg7m2elpbycfv3ireg7esfdre@ao6mt3z7og4u>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231216214120.7394-3-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: eb358f8f-1112-4326-985e-08dc16e29624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBbrpbmdnoiPj6jlv2esKuOpjmt/ODDO+4yNtgJ92VhzknjbGgS9TSUNlJM0kDqUtzSEGqv2rIJyb/1IH9EsVnUPX780n8517cwDfFPy4W64r4CsfaPaFaEFLg1yQaR8LQ9pRsI6FG/8W9YLrRBx26OieprLZwXMjLC3AG3MwbM2W7mRQ3VtG+zEJCkI4LNqJXHamLNymPjofpn0mgM3EdNHr0w5oS+HAMZ3XRir9ZF7jQHqcm5oEaRlxN9bhWp9UL6IOegSL+YgPfepXbgrNv5VOYL8QgQajYMPFInzJFiIE3ZAh+s5QXrA/CQkEIDZLDrWjSNJxcn3IiaIXzkDBcovs2FglOK8xejO4FMlP/aAJ8Y+8wGYDpn5PaB3SuALN5zD6evbnCd/g6l8jEZPw06mVsga0y7jzQNou9WiSzSfDirEj5NMTTdrZHw5JcK+nvLVRIu+jcbL8QPPJ/OiFgvc8B8JFcMHMRaJacRVorRXuZt/iopeFZoyFvaNW+4kGP8fNINhmBGhCViG6LkWATD3ap0/VTnWhZdRTCD6Y+jDl+W4nGr40OZM6lk6CWRB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6506007)(6512007)(86362001)(26005)(9686003)(5660300002)(8676002)(6862004)(4326008)(33716001)(4744005)(41300700001)(2906002)(8936002)(6486002)(66946007)(6636002)(478600001)(316002)(66556008)(66476007)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eSIiZAhYEyZxGRANMn5P0tiKbGrvKezH2lUuWShcaQ9pAXGR7VAWZXFCGxUF?=
 =?us-ascii?Q?iGYn9j+ytRRujPL4I7yE2lB6Pw4KiWaPPtpUNemFZgMp+a2irwlg1wU3UjCW?=
 =?us-ascii?Q?lP8HL5s126G9bhmUg1ZgCMNg0QRp+9Jvn5kE1/ZKetnMijsTUgqm7XpMhTPk?=
 =?us-ascii?Q?WxqUVuCKJs6mefzQ4j+K0LvExZpQrYPoJoEdXVgfX9Rp+oVwgp6iwGOQcwv1?=
 =?us-ascii?Q?vRCrlK+3ArK6bWf4b5vu49W0vEvUPw6VneclU+eROrWVUR/kZhXeDT52/t6x?=
 =?us-ascii?Q?alQ4/arRmVO/Yrjt6r1pwZ347ND5+OyRemYvPtMgMN4Q2am64artXahO4dGu?=
 =?us-ascii?Q?79YcNN97r3N0U8eRHLTjcDP8oy6vzfPpoSAlB2Q0fw7i3yzfquR+zKKWijdA?=
 =?us-ascii?Q?MFHkWAKGyGC63hSBD5nWuFINnWfoJloHY/SLe7UWdVqHlPefHLL5hEoFhAa7?=
 =?us-ascii?Q?RAxfmzvD1sZ+w8gMxMEc+22QfEQoPEzi94Vn6xy/iOsupWV1N0EL0Ty6uvjf?=
 =?us-ascii?Q?0vLhD1Br9smIgg+iYD2hrweRj4btMF4No5zw3AamVBkzKgPi40JCrUycI4HD?=
 =?us-ascii?Q?V7upgT0CfSUdWNk6q/PoO8aIg152EdKkZiZFrniGC0mf+rtt4S0xxsCW5brI?=
 =?us-ascii?Q?ruCSjf/j4QodQRx6Ow2B3vm9qj2maXXycXwsaTR6wuYN+eX753SfFnltqp5y?=
 =?us-ascii?Q?GJK14G7ZsTjepMubo2qABjaEgBzR1PGlQDZyW9WcPtToqIM2rbWLhADeg916?=
 =?us-ascii?Q?SqpQK905V8ztiXfv1QE18yAijkYUZeGHiE8fTHRU+S/Hp8JgzVXookflkdZJ?=
 =?us-ascii?Q?FNmQjiWePEQlpD0uP1Xu/DevFW84IhGK4WsTA19HVPAgQJHgGryOeih10ACK?=
 =?us-ascii?Q?ldhOM008emvFikNfuVhfGhNl+TO3WyS/117OLtR/R83CaImuJX+5L34rdVjr?=
 =?us-ascii?Q?EhONZHeHVQFD8/H5EVc52lkDmPIzRggFdC0RNCgBeti09NdGMmjJPKnPx9lD?=
 =?us-ascii?Q?9rwYyCT/ft963LVfYzI+0LzvJ1nKmmzboVvDI3xzhlrKWQeV83mco9n2N5pT?=
 =?us-ascii?Q?EahaurLuZNbV1Gyy4h7obRQKLlB4s2T+K6ptG+YzsSipUKTnBePCIaSlwKNw?=
 =?us-ascii?Q?FRW6gHTvMH7bOGmz167I4mxMLYlnXAOXjsUID/1RLv7iE9XHFY0aBGnxH7jv?=
 =?us-ascii?Q?ORFbSbjfKGQRP3duO2XSbUZjRZkpqq4iavKkkU8fmL/QU9rgSnhmcqP3o5qL?=
 =?us-ascii?Q?PwA3/DX0o/ZFUz4d5OV/Tfk8la2GphkOOvVAanFzR08SgFc2SM3kPjTpx2WK?=
 =?us-ascii?Q?uiMaVAl1os76jHr8Pgjxkw6vPVdIWp2GsB/bNFXalt/Fa1J4uJ8f0ekuRinJ?=
 =?us-ascii?Q?SYDWUkz5UyuNp5oX9DLoRgSKiotn4wYacEmUQ1ijNFxmI8YX5vYwWIIpmiHG?=
 =?us-ascii?Q?jVFj+yS0yqNABAg93AqSKw1A/8ONXA28Knc1OfjpagLByFfVWLRFI1C7DyB7?=
 =?us-ascii?Q?ao3EHuNpOfv1Oe7JzOyWV7Jgy4Hn71bwc3gds/595fgdFdyZUtSnkDgn5+tL?=
 =?us-ascii?Q?J7bq4FpNXqGjHvqkTp/gf9UAFN6vQiYqvZ4xjO2J7WhPrZ5QibvpgQRMa0Ub?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb358f8f-1112-4326-985e-08dc16e29624
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 22:29:21.7908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5a4EvCm+XricKLrFYge+JB/ve6uiIXgiD+VLKb+p+uqTgRbXz7UcZCgUO9zPKdX/CpC4w8pHbn1mjoCNRzx735R4ebR0zjbjLXkcHs5sLTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5888
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 16, 2023 at 01:41:17PM -0800, Niranjana Vishwanathapura wrote:
>'cslice' indicates compute slice and removes any
>ambiguity with 'gslice' used elsewhere in the driver.

some of my comments on patch #1 actually apply to this one. After
applying all 3 patches, there are still several places using "slice"
rather than "cslice".


Lucas De Marchi
