Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2497BC77B7F
	for <intel-xe@archiver.kernel.org>; Sat, 20 May 2023 05:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9AA10E494;
	Sat, 20 May 2023 05:50:43 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2359210E494
 for <intel-xe@lists.freedesktop.org>; Sat, 20 May 2023 05:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684561841; x=1716097841;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1z+qlrYLVcKjn6hAFxL3T7Y8XI9Czvm5s8D5In8vMyo=;
 b=k2bxlEZJWqgRufYVNiIQbsTbmfqsp78nkNTt8oRFmhcwP2LfaWZyffEF
 7/LxMDI9B7/jWiKLum4h+Acvn7xk+aw6jre4fv82F1LptK0/MS6LC0Bau
 X8VnB7iuumXmwNfc3BCVgmFzLIes7IOcyNKUtsmjGIeI85GOqpfNYbbSW
 fVuRthbNaiFCZ5SZGJFueHa/ZilmMSMkzlXDAoEP5e4KYZ2uEDrS5vRWy
 lU0aI84l5wwqK/pFn0E2vFNtScElsoL90hfYie+qChsAOfGQhEvFwQHAD
 +VGohkR6bYlxHryxneIe1gQwl7ExxWpxI3jIulgVGCRdXDsqhKRGK5faY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="350065235"
X-IronPort-AV: E=Sophos;i="6.00,179,1681196400"; d="scan'208";a="350065235"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 22:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="735753508"
X-IronPort-AV: E=Sophos;i="6.00,179,1681196400"; d="scan'208";a="735753508"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2023 22:50:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 22:50:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 22:50:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 22:50:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 22:50:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDvgontKMQHCpNkBIOwvVenBR4EKdNcdUcwF26ux7l8Eseu+mdTPup0qG7slmS3uYi0Xsh0TCfDFlNjLIdHRMkxdLWR257KlqjDLmpoMlkN7PtLjrsI2N50Y+tFCF3LoQcu50lYGqDrblAr+WXISkD8QsKoIJ/albujw+LyknZl/OfKgHm3FiqiZAkzO++9i3FyyW5fBGKTg4FCo036Roq0cSgA65OkLN5ItZ9JixkSFaQ70rsD+aqpE/sG+QCbzv1dpsL8wseeAeo9YNds2adaZ2bZcnXE2OObcerzsiuP25k+BnF6FUGkys/P4d4a+gAkCCQC8b3gvwQGCnjGkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSjelFvRUvlcjDnIzYG2AseYSksuDdQO0g3/p9lMrGQ=;
 b=FixVpy5PU4fKne/SY6WtN0ZeV9C4UK24edifpcTrC0Jpg7OmOrDx/JHcf8bGXpuR0wVdkl9P1eYKD/C4NuXA3RlB68uVVz5Io7HUVBSqbfkP2xUP5ilPx3jAMW0pwrPodr/+yG/ohs/O+R4Xyndt/ESQ6e+HGRXZc/VR0g3I9R+5d4Tm4uLwOpdciA1EsabAApLw33U22XbDiV6PDWfz1LcCEbNb/6QAi55AilmelgTad1taBAu1tRlX9HuKIQsO3ZQ73dcga7okTAXl/9dvEeEPWVFkbcJ0C4L1H23ZPX8zNuh2Ox2Hvic1HNisuw77KnTzkT85YTXrXRF+MMrnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Sat, 20 May
 2023 05:50:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.021; Sat, 20 May 2023
 05:50:26 +0000
Date: Fri, 19 May 2023 22:50:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <5agdfvinvtybfu6xkvnorg47qee5g4kdnp5fc7yyv7tij7dunh@xycmk43q3bar>
X-Patchwork-Hint: comment
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
 <20230519231827.3572452-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230519231827.3572452-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 73880397-a7dc-4f70-d014-08db58f61bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RmVSLY/tv4OyhU+c8fI4xhQkfaod8O5Ev2C8/qKn/Ylg1ncJ6V7TXe3WEorTuX5+RaCTOwT2dbZgwiRZNYxsV44ACO1R3VnviotNRw7pigPLZf2h84wRTMv1AI/ZLOBxDyUt0Os0q7V8UWX09TqBnMu9eThlwdVZozwgtneR1H90ZN+QSejMaXyHiVw5HFQcIeu1yWDw8zPc5Qyq9AoDVmJAFnjQvCU3vcI2U4tHtko3tKWrWK51hUvoSGyyt1xnrHW1E/n/EczDrmPqkPZFK5JGbstkR3uGmp828/QXDLjPHSE6bqrwkXIKcnLdme/656bg8BB0zB9a3L2N8Ahl4IiCSj5YQfwW6/TRqaJFqOI/COWQjY1AUwxuSVQl23+eO78W8aMDjltiCZnZfgxV69j4qCzDSjg7AB2AwNRwy3s1Vw+zA1VPPy4z0GZMu78W0IU/dPyinDmAG9icKd1sgawPeK4Znd3zzxTwviScd3BF2BKbGQbZyip2JkOdP8KdZU0rx5BqcUvRL/P70gfc87sjltjsBnxhRnIgim+nCmg4bAeCuin6T3+a0e6GHZUv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199021)(6486002)(26005)(6666004)(9686003)(6506007)(6512007)(186003)(5660300002)(66556008)(66946007)(66476007)(82960400001)(6862004)(8936002)(4326008)(8676002)(86362001)(41300700001)(6636002)(38100700002)(316002)(33716001)(2906002)(4744005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ya9PJ/iJSNqY7a+/ykniR298oNc0jDyKDvU7+g9SFLPjx34Dans+qTpNbaRz?=
 =?us-ascii?Q?PiAOy7T4S0AFq/olxt6dVbz3tHQ3MHkANWQfZSV7/d7kh+ZO98DVqwvR2OOW?=
 =?us-ascii?Q?0t430L0NdIrjYcl/K8Ezw3xit2U9dLvKeHCIQl9cObG5QrCX9l3ev6iGR3Mf?=
 =?us-ascii?Q?DVNUvekRwQIPBqr7mXUstOQUqkqKyttFdllE7155QCd1CsX9mJ/b/zwrp71G?=
 =?us-ascii?Q?ARdmf/mUief20UeYf03Y1RfiI+puQc9D2mu1zCX12EG3DVKmVIjuTq1LueIA?=
 =?us-ascii?Q?hgLiL4wWNx57eDAF0gmPjppCAPudiOar4eVFQbrFr0r5yHKQyRTLUrvE3qeX?=
 =?us-ascii?Q?EgkCtFR6wbO3VIRYWzTg/qfoe3JQ4KH1sGZ5hkIrS2FNiblZ/wTc8OAfuUID?=
 =?us-ascii?Q?me+j+Fsrc/Vy8rL1FfJ3Usun+K2n6o1a4LneNaIXCU2YhEV7Kzdg5Qb0vwZ3?=
 =?us-ascii?Q?BNvlufA1J7rqOttcpCi+fZFdHVGQhKEa08yLogbnyJJWigd4BrQjxoX2Vnj9?=
 =?us-ascii?Q?o21Q/GgoHnTjl0OL5KrcjbN07FMm5prGac02tRZu69iGR/BJTmDzP3tXWPh3?=
 =?us-ascii?Q?C6sKCc3i6GHWzRrcVcEm2BbE0AvPu5CgnNtjXGBrhxw8BLd77aiXsF+yEtac?=
 =?us-ascii?Q?+XbDyeoQ62lg2KOf60meR2RX2F4PQ4xV1C4oUTJY9U4NU9WrIDxGrTMlsYh7?=
 =?us-ascii?Q?5zHz5R4Un1sE6uurhlP5wlwNPZOeEfNku8oQ2D4qTvNJ7PhyDu3K+r3EJEE0?=
 =?us-ascii?Q?svcLfMtsDukNtsSpy9oAz6HNXQYM2KShulTVFmvxOWVDBK0kFzGt6ycUqzNM?=
 =?us-ascii?Q?tiDYVMk8Usno4FeFCIBswSjDhrxcB6LrrOCwzzSv4GJjovenN89R91hTcmLA?=
 =?us-ascii?Q?dicdtCyX4JQQX28XD6WWenUwiz18rTuCgjD6UVUM4RLkTRIzVDMHFs6W3hjH?=
 =?us-ascii?Q?TRZJKrOSAINV4XLeWeh99M5edMQjIOWtcQ+apUdTSAw/SbAKmAxKz9HrryjR?=
 =?us-ascii?Q?DDSGDG8DUrjT16jrMIJIPabOGFQwx3wxtxC5mxUAJAbG4CV00nCE+f2KLp3A?=
 =?us-ascii?Q?66WZu2NlhM5RYqTzNGL/MeA6t2lOoqtnbVmr6DPaJ743WwSnrA+Ss6rE9EhD?=
 =?us-ascii?Q?S3R2GX94kR8mMFw5tOiNh1yUUFHzw3qHr8YK4GwYJI+PzdCQEI4mt6w97T/s?=
 =?us-ascii?Q?wm9cXYoNgejqut89Vg3lz9THQWcR3To4m9bz8Q8eNFlZ2sofuDMD0mdosAM6?=
 =?us-ascii?Q?7rwG7aMTS7r0Z+tNC767Eu+IGUiSZUDOAz9lxoTaJX9t6XKwvlQO6ohWHDGd?=
 =?us-ascii?Q?oybQ0uO46lg+3+qRo5DIek6O404hkNRbv1SVxrEE6kOur/LXa9bVWUYVG/2R?=
 =?us-ascii?Q?54y9HW5QtJo0dqjkA+ywxZKW5C7Rxl4irOgRTHGmnXO8niV0w2TqFL0DQgLT?=
 =?us-ascii?Q?uv8u5bjjKHuF1dhgOkiAbs8vty7ZDM+jWYg3pOESAM3RQZ43tWYYXWtz+4L4?=
 =?us-ascii?Q?PS7DpR3Nd5VdgPQZG+vSv2cZZeWNgrHbgWyME5YumfdkWjQmQSuZt0DVbcsk?=
 =?us-ascii?Q?35Y55On4nAGd6iWT0bGc3t7rl8KhlKbAIenSHVm302usBt2XJz6dPKXA2rkS?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73880397-a7dc-4f70-d014-08db58f61bd3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2023 05:50:25.8328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S8dRgSVYUkRGn7OkWVAVPmM4fQFZUiW6WMBJqO32IQdM3pxBgMIiyUFPO5CspTeqgWQIHsG6oXDrCt7LXcBif5eZnqK4QM8c1U+xm4Op3fY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/30] drm/xe/mtl: Disable media GT
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

On Fri, May 19, 2023 at 04:17:58PM -0700, Matt Roper wrote:
>Xe incorrectly conflates the concept of 'tile' and 'GT.'  Since MTL's
>media support is not yet functioning properly, let's just disable it
>completely for now while we fix the fundamental driver design.  Support
>for media GTs on platforms like MTL will be re-added later.
>
>v2:
> - Drop some unrelated code cleanup that didn't belong in this patch.
>   (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
