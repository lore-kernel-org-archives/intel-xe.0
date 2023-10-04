Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1877AE7C4E3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF51C10E393;
	Wed,  4 Oct 2023 16:43:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17ED10E392
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696437794; x=1727973794;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8SfLm3RbcAIu1CN0tOROcfvXMfbXN8zuMLBc+q5SPRE=;
 b=aMpmB6h96bSPO367wuHWBFEdP80kNr+irZixkfGIRyTzO4H6SNGdeyMt
 f0byz+5jJsZ+pzemcgQagiVlZwTeJMR7WFionz+JaVoDynVNjf7yo1QLF
 JW0vQkGWUNrhy9fMCsVNu0bWP3azOglaIrQT5Fr5ikEcJtippFaj/OMAK
 qt326CW9/hK/q/p+tB5AmUBQnJdNpb0MXn8DD8rUHIoMUl9YAZkyfBgvW
 hBu8IKVIh6eMExpvsCwwpWxurKHcsAbbO4bcJFeqJU7doJfKmNudO6D+p
 UQiYXbeLIV7hUGynCjCWwq4bveCYja/4XkD5Zhfc6Bg35ZvNeBHjGFHVb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386055420"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="386055420"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="867468376"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="867468376"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:42:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:42:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:42:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:42:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:42:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTsiYNsaH5tj8+Vht628MFUA1PiNJ2jr42fJ+5kJaiNeqogWJ7V7bDgPscrJbFG4gmhWhciYQuh8yImDsHQkn6mTPdXwVk4kwulvOpHjK519kyzxS5wDlJA3UBibD761hIETcJQsQ7vu9G3pcvtEJAhSE4n2GZ6qdqFbo0uYz21nZEs03fRnE/w4o3gIveKyNy0lgXUUezrlre2ooHhwIUTtxCKm+WnAdJ9nJoPNYR2l99PAjbk4npNTLfS5zrRHzxqPhPiT9FJJGlCwJc+vGFMbJ9NP38DvDERNtYS+9nSUWXsfryouFbFoCcgoIxHmj+kPryM0gHZt/PamL0SdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SfLm3RbcAIu1CN0tOROcfvXMfbXN8zuMLBc+q5SPRE=;
 b=X+EylE/NTFVA6udKKrWRtzm5j/b53X2s0NF68o0atnGgEv/T5E/qS1TgbaeRse/RE6OU2ic3h7FnakpTeWJFfmWuOZvVeEJm97o6zIcAzwBKgCeZ8E3rl2Wu5uQXViLhO68w93BAo6qwQvj3VqYr6LrdH2X4+L6aQ3Un9gZQb1W6S9f3ek5ApI7t6PCLxX/yZz6v+9StbO4TeM1vYdH7U/fBnw83BrCJ8uMBF4x33XJMVgiNEXrPuvnmFYB0EJ3smzRysZvGgnLC08Tgj2E626IaEqJGxLDzYVas4OccRMQnzkubph4LMkatK6lYtoVWTGaByRGaun9W6a4M79pTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8445.namprd11.prod.outlook.com (2603:10b6:806:3a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 16:42:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 16:42:14 +0000
Date: Wed, 4 Oct 2023 11:41:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <diaa7nf3l6b5qsczyxto5ftyrcdrx2l3kec7wauoen57hy7dus@bxvldjcc5yyr>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: MW4PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:303:83::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3e4394-8a31-47a0-634c-08dbc4f8dcf9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2OGeBZZvVE/yRmpXlQNXCLf36k+wLo3GTZRtvab5INqyQuBY7vYpd7rETN+liEUDU74qqkKruqpkRqXYgQAOpanU2FVxF8tM2F5DkOt/ifGjKPslQyGygkRvjSSEdnkAHdLOagiBIzyMFh4PFafezVDmiMlR2NB916uzvT/FGEeOLRQ730uJavykZBO4FB1Y8iT/gIwczF6rjKBn6G54FK86loGmCEE4TIDclIo4Hwq9ubBij+metmCJMCgi3QK/gVY79NsY18m9CZgqSkaeojWHge6cBGJqs7LArVK3usgysC4ka7ou7/tAHH8nGs42V4m9c+uLzdJj9Y8DTDEkl9QG6moTmD//R+3inZ5QKoIziuD1Q4bpJYVw33VrBU5T/0oXc94Xk2aMUqsSuSmlJJAocPBqvQoHtHkerLm1d6gHIJRVrS+W4inCz3w3rrvJZB39+1V13OKHThdPChdvUTbS6e+7Yqa+sxaPlncqs/eXD8zys/4J7+Rn9nqjYhlH03w42N6ocNp3ncAy/K3aEjhc2zqCcapt08kZI2/aGMYZFgyxWilzVvhCkNpyc+0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(396003)(366004)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6512007)(9686003)(6506007)(107886003)(86362001)(38100700002)(82960400001)(2906002)(4744005)(26005)(6666004)(83380400001)(6486002)(478600001)(8936002)(8676002)(6862004)(4326008)(66946007)(6636002)(41300700001)(316002)(66476007)(5660300002)(33716001)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9JmhtBuXFwgM/tLUwyG2Hv2eX4KPI0lM2XMdDFo5g6Zc5DArzlVMoKSLXeiA?=
 =?us-ascii?Q?ooXXUe2+fnGSNDIhld4pJpY5onSPdm6kY0qWelpjNzWXw5salcPLra23ZYst?=
 =?us-ascii?Q?LF+2CxNMQ2qDeMlQGma2o7wVln0N/D5IcD0w9fC8Ksukf9arowJj2vXXTFOv?=
 =?us-ascii?Q?+MAPdSCcASc8mTANptd/HvquPBUt3208ronUZtXOGUT+qrrQcyU0X7osuD8V?=
 =?us-ascii?Q?nWMtQokS8BkpiptMCvkUq4ZayZcLtn11/A/jA8i0gbFHFqOd+d9QPGDRZbiM?=
 =?us-ascii?Q?MnhlGBrnZOdUkXFWux09l59zt+JSvCBlb1Brth4gLr9BFwEfQ/HISgDU0VCU?=
 =?us-ascii?Q?SBkVvUHX25atBVLrjMSdT97BUPT6lnZkK8O6yNx1kP0PjkjhS87sRwKLC7WT?=
 =?us-ascii?Q?6JXPuAH9NLtcmB73jyeEcxa0P9ZKBWMsb3ejc8i3u1/wIxy3XP/5CjhcMNNg?=
 =?us-ascii?Q?/jsbyR6q41rfRf0xWD93orqefg1HKt45U/T64BdRXrQv6uKFxpGJiHT9WH0y?=
 =?us-ascii?Q?DXlLEz6JJkdVtlkO7cJCQNmV0P+qOx5D+5gWsMesBPdSMPoEnCe8IjwW9iGN?=
 =?us-ascii?Q?KpUL2nUXDTG+KtDqUBXsmMZcP5UXzi35HdH5uLrV+ztv2qgaCPFtxRYMup0t?=
 =?us-ascii?Q?U109x5Epp2OpNhVafVQrNq4R6Htl9HEmIFzK7VzIDV8ENxq58jSb+Ovxhw9D?=
 =?us-ascii?Q?m99IEgVsZSjQ7pJlsQCOxvDznR6LkCXtqwDwynWNsiEo5V0HjWosToIMil1i?=
 =?us-ascii?Q?Pl+cqSBSnqJ7zGaAAE7HGL88ifoTBhE6W7cI15+LYwJA9qoL3rDqmz4lU80Y?=
 =?us-ascii?Q?7nvTuBpzgN4YvTjYQhw4X+mhrU1yq/RfhVR4+PwpVRKbqfITDQmPng8V726H?=
 =?us-ascii?Q?jUcwhkkFaAQA3g8jOdCM+rpe3AM/udcH+DhkRmqwugCOaOQh5lIhC0YAsZFv?=
 =?us-ascii?Q?LdLvd29XkhJ3jTVzfWvlBkETVwIKfyNvPX6R0Y2fLh95E54S+39ZvY3ZFQTL?=
 =?us-ascii?Q?NPGWrTBgpxm0wGwmJijIk+hRksIofUadMoLkUlmKTzyPrhsi/yk1OwYZXyUy?=
 =?us-ascii?Q?Xtz8agQ8wq5Y+vGT87VEvHBABu48kukV4kVeDeOr0lCPQ7GLJzS1MLDdFSJD?=
 =?us-ascii?Q?doOfFG77070muccgjBeeADlfYgZhYg+fYyXrDCP6gLv6Tr4CEkgizBqwM5w/?=
 =?us-ascii?Q?aIaqDaC21m4uzNbb2aJaSvtDwxju5WeYVZlL0UHd8Yeyo6QFa0K/574yqzrx?=
 =?us-ascii?Q?XVrRud74QsJ+Sw1W++eo+YjDgn8OzuuUITbarUtyqI5XFy/v6ziNcuR4iw0A?=
 =?us-ascii?Q?Tuefu5o5/VBlQHwfx7kiygrVbYlZOBUXJfdPd2L8dE5F3ZUpHLEKXGTCIZcX?=
 =?us-ascii?Q?Ku3Jzx9dr5dwXgWb/44iSZLZ897kMVg0e94r7hEjhiBjPSW5GKJsl2KVIPok?=
 =?us-ascii?Q?fR3nkIcLCkd/JifxuXFYPpErYLiEdXjMmNIo7EvWDqeL/IG6FbUJPgLuZZ3E?=
 =?us-ascii?Q?4PMvptb9LKUo2s/nQTkMcHVCsXUtUGlDA8RV1ct2Ljt5f09D0H3E1bmL8ObZ?=
 =?us-ascii?Q?uR8G2m6LaQSEjW6v2CAOj4lT+29MJ2ov7kRpyU6MzpZmo4gsyyRei0wAFuMF?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3e4394-8a31-47a0-634c-08dbc4f8dcf9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:42:14.2491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k36Kd2BgLle/iwumJad3Ybuisw7YXTK9p6vgxNiKsrlBMksItZtmsi8mbJH+S67nryelrBaXHAx5wF+z5UPOhKter4LVZkoXgvuYSngYSyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8445
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/10] fixup! drm/xe/display: Implement
 display support
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:55PM +0300, Jani Nikula wrote:
>Turn the enable_display module parameter to the same thing as it is for
>i915: assuming you have display hardware, take over it, put it to sleep,
>and keep connectors disconnected.

that was not what it was created for and it was on purpose. That is not
what we need when enabling a platform. The argument that *users* would
then be left in a situation that the display hardware is still consuming
power is IMO wrong as those *users* are not supposed to be using module
parameters and if they do, it's their only responsibility.

The module parameter here is for kernel developers and CI/validation,
particularly when enabling a new platform, to decide if the display side
should be enabled or not.

Lucas De Marchi
