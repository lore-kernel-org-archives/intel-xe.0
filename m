Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BA7E7D0AB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 21:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F3210E61E;
	Thu, 21 Sep 2023 21:51:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EA310E61E
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 21:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695333086; x=1726869086;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vsRT2b7wntJ6lt4TiRiAqU9DwpnHwrXb5zR8T2NkACI=;
 b=JV1Hy4l87sgmfezy1b5l/kTERKitojEZts6VWbp2+3LI3FcJBfYNRkg4
 2UFRLppAUG43t6QVNlL1zvIGuWy6tludE9F3F2tAJNGiV8y4mn2SZprQz
 rj/miuMj9DJRHcR+nXAPHzqc47f/CPSoIAlhOW4fmr4Sj27JDl0XNXLcd
 y4p+8adEZQTqBQSDaJ+Z6aitNXHMswWJhsEfAzfMYHVEJF6reUT6BmdSF
 AR/0JaGJtONOWoSmh/k0et4SJM0lzATNuo94OcCOESXAYUu7IouH2oGjK
 z8ysRgVLhOKRSCdtga1BSr8HDclBkPI08MqVpaR5ZPYX2fyDlsmW+G37x g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="360918038"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="360918038"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 14:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="696917805"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="696917805"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 14:51:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 14:51:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 14:51:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 14:51:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 14:51:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGi4HEYHrmtR+vPamDNipWu0t6JPGs4TwZ5wtwI3Jh1nvxe15rbyIkyQPJWLa6iX3HJ4zwv8Sz8g/vOd78G/+r9slxUClWIlkhj+oJ1FbpDaBAvYwei5vmeucdpXYL2vQTsRT1mqTctuM/jnjbJUxNvB1i/S8/Vhfkaa6pJdFParY8S6X9K06UBXbVPoGOjvyy7j2R21CHSiA5TfdeTdIQJRPGEGdIBZezRICDEpmFuN42QvaJtvwfurya9EJVuZDvO64Ls3ozgwd8SBuDj2qioWWvTJSqT2l8WcbJrTvrnc2Qce4ND+76QZ3QwJNqR3GsER5CnscVFj6DdNPu/3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5ZEhhtXUvEA6JZo0/iQs7dqmYnzC2TakUK2vh0sKIw=;
 b=NcgM7+asxBXa5lzm2EkwW5pzuKzQ1VbUDXzG13G7OmOA/WGjx72B8S0TABKicsFF0LYnZPrX7HyI0fWN/vyBaDtBp1Ij66jMesnPI7OEc6lXgv0ST888r6ZdlQ1u2dGFTuGm5Fj2PrgjPB0cDDAkOeFxinQc9e8Kla+DJxSdEpVYNzad7EeR0aFQZQ5lNUIgPyhDrdYm12Wiy29LFcb4Itax803wTtbY8j6gMBEDeP/B9RlXsZX31vSQmVU4OkXpLlAF4Y2v3m35hm/LS5+GpoNIZcVBxokklKQQbWFxgHMGgiwLNfUpLOz+pdhO0lrK8MfP7bQGSpi/dxuXd1GFTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 21:51:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 21:51:22 +0000
Date: Thu, 21 Sep 2023 16:51:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.william.auld@gmail.com>
Message-ID: <fclraalqid4ztjpbngyjfrpiiunpu2vtnx5lly2qqevyubgjex@kiyhkzeph6wk>
References: <20230821144504.236122-1-ravi.kumar.vodapalli@intel.com>
 <CAM0jSHNgXQEQ_6nhvtKwjkdJNWtRSdoyLLwkOwk9VsoFE48=oQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAM0jSHNgXQEQ_6nhvtKwjkdJNWtRSdoyLLwkOwk9VsoFE48=oQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bebf156-5569-4e0a-13f4-08dbbaece500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbV8q7hvauO+PcQ1ZJD7BJvZc3W3ohAPvaHjlBYpJ1wHnfdjUvJ1gnkwmd4jk9ldjv/OUjJj43Zg3md3FvfxPq6nLCTK3pUbXKkriGniGe4p7ou+uJNgMtoF0UVv5wdGA+xYwOtbEX4ceIIaLeR1gnmGBr4a4Pb//b5Egb8ZbiduMQYTKKgIA+nbGhEWPqdvCd4xpx2K9fY2jKATWauWN+ZVIwm5R7kgIlTSb+J5Velq2cyZ75m8X3WMgYB53wC4NpjPMQtIyd/HVGmQMxtO7oMWJ++8+qF1Xa8bHfGobLraBdkDdivAkzFJtKFmhNi2hqq3Hux8bEz384Ew848muPo3u9HDn02Pc80MBIn1shg6/ojNOeJmRksdf2z1HcUMhLOV9PqrM9NmYXoebqV6uGX0n/xDPfZPLMZofxFecBSjndo869Al/2EXnU9I8r3vE///5vaibwv6DBLSy/S7KgVRcVL2LUNxUL7kS0q0ikEsA7m8K9yk8fxylORyxktAuspAZSXKevyRZ+c5pbnjTvozz12Uswue7JSqfElxnXgnN2xcaIYC5eQzm8WqTyOq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(376002)(136003)(396003)(39860400002)(186009)(1800799009)(451199024)(6666004)(6486002)(6506007)(6916009)(66556008)(66946007)(66476007)(478600001)(316002)(6512007)(8936002)(41300700001)(9686003)(4326008)(8676002)(26005)(5660300002)(86362001)(33716001)(2906002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/3PG7PPbKsmoxwpVvTffjkevE33soxkO1HhIs1wgqs2qv+T0PITaE4w1PSN?=
 =?us-ascii?Q?mFwVSuRZ8Oqj96a2f83OoXduWyjbMsYqy9SqD9Hbkxm3hWHahuF6KwkPQy/R?=
 =?us-ascii?Q?WppsY3+vlLnSXmycqv1hsXwXtG/T5Mv+tYI1FMmfX/fTei3jSc2MK6BTCzYx?=
 =?us-ascii?Q?9gRropNTbaG75RSVvSrh0JZ951K0UR1F2nLT+1fyqg9oXoZQ+utqaY0lFjQH?=
 =?us-ascii?Q?r9sX72DeKowcwIQOAJHkd6J/5R1AbQF0tdjNad7B3yB2zENENP1s4aMf5Ioe?=
 =?us-ascii?Q?iWM9gN1BZreyUfx9hFNxZeR7LyX+Zeq1m6FfPy62yXCVwqxqSAW6uDOub93n?=
 =?us-ascii?Q?lYt5cpR57P8+lxmYblQ7mB7izvxkjYwMc+qonbXMS+8mgsq8PMsyuwtG574g?=
 =?us-ascii?Q?3u2XZ14c3GcJMWW7dYAEfnProPdVKIkfEDMOu51Fc1OD8bmsDyqEv7AGPasz?=
 =?us-ascii?Q?2HxUYEuOyZPMcyXGk4DDJSbFiNBL5yW9XDUrOz/aJSU46H2TeweT7bzCvKeZ?=
 =?us-ascii?Q?cex1WP6i8WOlMY6/qWC0mnTKyZ2AbCcbWvbLWde+sno0/E51xC+lWeCFBk+p?=
 =?us-ascii?Q?gshb0d6VvB7k0zl/zTSlTxd+61ReRXvtEzM+6/JtCqHfYnJ2u6vN2MG6CZmW?=
 =?us-ascii?Q?No7fNOU6MBG3CxRmsRr8G4FQArDXTYCPbdW8jWF8jHxbyekvOfJrtYSYbFcd?=
 =?us-ascii?Q?De50nnM4N9Rvxs82TuYmkCSzjUjAtI0N+pwqyMhS+go1/5FVQ3pJgK2LvBCI?=
 =?us-ascii?Q?tJyM6zgDxeKb/wje3KxNc7bccBtOJL2mLLGOjw5saSjKUlGtE4Mh9S3ODtVe?=
 =?us-ascii?Q?lLyFM4JWsWwMRtys25ricGZGp7YlgBhV8M+JJwgkDSYw8y4UPTZe+yPSv5XY?=
 =?us-ascii?Q?ecHS0LltKkAVC2Z4ok2rvEr4XJBaVyWiW3vfs7ih9+EWTfZvJ9VZgxBetCEz?=
 =?us-ascii?Q?S+UYxk0LMzoij6cF5g9g/Gt1pGADQxyEO5lAhiyDFFGDkGWTpAD6f49NnU/z?=
 =?us-ascii?Q?wec4xawS84qXpFRfH9q8czLgu9L1ucHouQ5W4sCMp2k0qKGw8CbVToIWgNPI?=
 =?us-ascii?Q?SYrpHyZcMrhYqed4ClcDtv5z9Hkr69T5b3fzrvQSMAu8HdTQnW0sELiwp8Ij?=
 =?us-ascii?Q?NDoqy5oESHSbRhtebs5Zh2LshAeHBIgXrHfhI1ILcUylKRoQkahgBxtPMROq?=
 =?us-ascii?Q?pSxCBVkfKXBiW7abm6oBZxmiARKqN/rEmwIgh6xX6IOxjy+siYN2Rxg/JT4Q?=
 =?us-ascii?Q?Tt7W/q/zLY360YsZUJD0nokbTk6yVwq+atdt85jTGcQc7gDjnDGgW+BqZ3ig?=
 =?us-ascii?Q?v9W1yyvMyU5SGU6M40dntrDhghD6Pt0YR++qvKLE5Q8wWrM1P8pel6BG8F2g?=
 =?us-ascii?Q?HpplwLZarqfvMYiDslhp1z4apjYv3FIhGv/bfLnM4LYxiUcwVvaGKb6m72Zv?=
 =?us-ascii?Q?gv0uwgrFo1/YODgWcLYWFLObIMm4mX3RT7O4YUfOuiN6/Ei5SdyC8yYyd0aO?=
 =?us-ascii?Q?ZTCwLpVFaYFn+mRRJ/Ae3fdZiNRpO5z5gz7L+VqVvgEABNcpMQfOQIC1XuKO?=
 =?us-ascii?Q?BVY69awoBhCJ5Yds5kB/ONU8JLkERQhxMjEtf5BqhA3qNbIvV6XcX7ZFhgTR?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bebf156-5569-4e0a-13f4-08dbbaece500
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 21:51:22.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5T3q692EmaCIswKQdVhJ+8ONyHbXon6H2cGEQtfy4X/L2GAZXBMeXPowVMZMc2VEwrldODl+n5D56JnBBMvohblc9Tcrd/mZdZ0/LKE2QE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add support for PAT encoding in PTE
 and PDE
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

On Thu, Sep 14, 2023 at 11:50:01AM +0100, Matthew Auld wrote:
>> +static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat,
>> +                                               enum xe_cache_level cache)
>> +{
>> +       u32 pat_index = xe_pat_get_index(xe, cache);
>> +
>> +       pde_pat &= ~(XELP_PDE_PAT_MASK);
>> +
>> +       if (pat_index & BIT(0))
>> +               pde_pat |= BIT(3);
>> +
>> +       if (pat_index & BIT(1))
>> +               pde_pat |= BIT(4);
>> +
>> +       if (pat_index & BIT(2))
>> +               pde_pat |= BIT(12);
>
>BIT(12) will smash the address in the pde (also when applying the
>PDE_PAT_MASK), leading to hangs/crashes.
>
>AFAICT there is no PAT programming needed for the PDE, but only leaf nodes.
>
>I think the above BIT(12) needs to move into pte_encode_pat(), and
>make it conditional on XE_PDE_PS_2M/1G. Also I think that only applies
>to xe2, so perhaps we need to split 1200 and 2000 or something?

no, MTL also has it. I'm reworking this patch and thinking if we should
move this to the pte (it conflicts with a "normal" pte) or make this
function handle a leaf pde for 2M/1G pages

Lucas De Marchi
