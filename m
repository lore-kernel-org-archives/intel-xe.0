Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E882AE7C4E9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 18:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A6D10E3A5;
	Wed,  4 Oct 2023 18:03:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FECF10E3A5
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696442634; x=1727978634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DJmGG+b6VA000rJGryUdIrWfA2peOqrPJAA9qK0BXfQ=;
 b=dfnhv23Iw5Q1HOm9yGI0vI/LeOBy2BvVSx76VmdesOoUZzYaFDRV532a
 HfCT4q9bYy4CVns4ALFZKnXWdRXwo7i6KYZyxtNZOxPIV84hmNOoup+dC
 8AJJsloKqQtfUjR2pHbhzjGv1p+tA2qGjdmcsxGvwBEViJVObtgdII5B8
 1R0TRqphw1pfGkJYp95Z+KFOK11ZFm2UfRJ1DLUGnF+hTH4YzCAbof20l
 SmaXb5OKONW+3Qoa2j3U0ADH5SoMXag+Bxoe06GMXCIl+WSTGf2xV2ObM
 sQSPMBV8pPXIwcC4tKpnmPfZRhegLRm9tZ4lZII2RvebRgXo96rGZavYO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380533319"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="380533319"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 11:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755041446"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="755041446"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 11:03:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 11:03:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 11:03:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 11:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ribl5u/r9ubBzGWcnd3ip/ekc5Q/jZjNDdIOervdvmQdjuh5qokWwfe3CGY14rYFZ2IZ6JN+mawn4XJ48uY3pzJXdTGr9kLazQ+3ZMeWCQ7dxZgToZ4GVgSORFygAW05Ao4g0BVq8AB60OVAggEeGa1tcIrSwfKsSmfWCasx5Zh3zbDJ/eCkxs8uqAyTVEDNxseasg+4eaXyS8kjhtNKgyjiOfkFbsc5Ql3l8VMtQKoC9IQjg2Ah3orZ8q/ntxLFMDYtM+uSR1URQG8/VB2s1lBEmgSm45Y3F2KrxpgnPY/wh4BSWm7wjfen/JmGJa/SQmFKnz2KY7ZIYdHdYt2tYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1aJcr3v+mdfhNjSdG94nznodTAi1znUeeQExNZGRJE=;
 b=Fcq7i63P+tKKpINwyNINzchWhQRK3HLVvXIgXjscDARsOK4MdHyKelPZzABdewzLCx3IBK19j63iQGy0TakZx1/vw6Be8swdbstFKgXjTGvqquFMPV8QuM7cIRIuGX41MdTkFj1/xFFVRIRvdMnZXsYbOyTlii0iucpjqlBZNUMp8IMLctdhxqTPEbkYiuwe4UjllwJKWVIh8nfTvXDrRNzby98OXV8ZiRgJnK7pxBeS1SyGmLhrCxHBJ5nQhqLOgMZdja3phxWg3oiFof7jBI4QXbn7TdTFV95IM3TCmV16byyjjgO+4bZ/9u/6SOiujs3ARivBJyWGeQV9nqItNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Wed, 4 Oct
 2023 18:03:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 18:03:49 +0000
Date: Wed, 4 Oct 2023 13:03:06 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <asxw6bfxqqgm3akyehf4oh7bp4x6kax7en6buhuzmesu2v5fd2@wymfes6ci4ch>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
 <diaa7nf3l6b5qsczyxto5ftyrcdrx2l3kec7wauoen57hy7dus@bxvldjcc5yyr>
 <87zg0ycnyh.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87zg0ycnyh.fsf@intel.com>
X-ClientProxiedBy: MW4PR04CA0245.namprd04.prod.outlook.com
 (2603:10b6:303:88::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5276:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf9f147-1215-4484-8bbe-08dbc50442a5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2qFcRMzn1FSyy+OOkUZMmOO+zP2eSFyvRRvFM2Xq7Pl4tBvGnb1d5zSyI0hHo4aZQPKxdCSmUl93j+GiMLapyEA+kXXpFKQt08Rt295H0sVEL6aZ9CMswfGDJsXOOVUoRIpMwZGWZ9Rbu82l++/PeLxcdn0HigyV62s5h42raxBGnB+AeRKg4L7rYv7Yc0dOD++98YGwtPk49e7qlbkBVNxIPqDvxqVNUMMZX8uY8uBl9JMwRI0sOfyccmERTuG8NsUvZUKrcCUiMCHgNfmOQO53H8wiwuMuYC1/ZKRkES5L6mCXtj+LZNU3IyYRmYfKVdGNNZ73rPQTFAM75eK5gTUnXhQa2J43g2msc95EV6WiA9WXf9Fqw5cfGH4kt+csORJ9TdB4cJjabPUgrmlJPqQeW5Wtq4NUv4MKJAQG57D2KeUuHRDgVhfG66id/Km91FPgX4c+G+tjA5UW2bcqnvawvcWpy4EXKdG5NMx6rgs5infReaIFP7J+cQbsiHF9iIW6y1RN4Rxz2I7TJpmd2BNZs7cowocDP1fGrGOkE2d60cFXdHnZae7N6+ky0R7I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2906002)(5660300002)(4326008)(8936002)(107886003)(26005)(41300700001)(8676002)(66556008)(66946007)(66476007)(6636002)(9686003)(6486002)(33716001)(316002)(6862004)(83380400001)(6666004)(478600001)(86362001)(82960400001)(6506007)(6512007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BAHOZOEzCPsQlrpLEIY6TclltNkXW91QbB8sSe3vAv7m8uRMCZ0dMpdJ+D+V?=
 =?us-ascii?Q?yEJtPEdnUTUnA+qbZwu2SQvY43UPt6kN3Owub/fDo7oUOc51D/qa2exBnpFG?=
 =?us-ascii?Q?ojFifXtscvx+Ekm5u3C8Pj+mLd5WsTyyqrtwlA6gnZtbUX5lEnb4hJzEJxwt?=
 =?us-ascii?Q?9xYXZZ1WxgJJXHQHrOAAEF4MSWqA69aWUxBWhu7HR4bVlE0qFaeqqO9+4PnQ?=
 =?us-ascii?Q?elIE2A01rHq3jfWCAwdGuTBqygW2YUFQLtWpUfatqohdU58cPUusxGgx8KLw?=
 =?us-ascii?Q?pb2q0ogQzzr4gTXdgsqB23XxFxUuO2d4AoLLnKCTGvEUHYPgIazgGrLiGDSW?=
 =?us-ascii?Q?x8MVpoJ+ojLvOaiVTAOMmiRn3RXe4bGqSrwhvyBHOXRTBgLcN+Fx7C3lDR7O?=
 =?us-ascii?Q?kp9gRx9LytB9Gf5k3bfSpFzCPCmHpQevx5BLK/2XWdZ2RKKSbw50QfKbGNCz?=
 =?us-ascii?Q?Qvh2HSJka7Tzdq5e0qBwuNJ29ppzbWF65kPGp4sLZiDVPMZDIwxVLIltDusG?=
 =?us-ascii?Q?q+GIQPc2ICe6VraqYYtLmDKo36AwZFyWSNGZBOGRtxjm1UurbwZpAZtgSUK7?=
 =?us-ascii?Q?iCt3wkCtqgyVuNRszZxBNSlM3+5sfIR4ByeQMA5o1H7wMwCbW+/C7wnJAPS4?=
 =?us-ascii?Q?cqLGk2mKcmSO9JwiYuGLgFS4veme3RrVsYFJpzfJszH/GdcdbX3uilKvj6K6?=
 =?us-ascii?Q?fhaVMxRbdV0kpQzBnBlVDT2xSgtcOxIbYZ45w8Uy95+fKh6XlscezquZ1yWN?=
 =?us-ascii?Q?Tk2dRn+dS32eh/75ulusrHHISjxDyzocz7CpN6uge+h/J1LZJVzWsGT8n8Gm?=
 =?us-ascii?Q?CYHARzClmYLMuiWtLu+pPxar7kSf+cTH3S0qGq7Mrd6cDn6gUixPtbGNxqNk?=
 =?us-ascii?Q?9ZzSw3Vu1Vb4ArVZ4B++u+TRHNW0is+qxdy34zbC5FnPMxjxVZZ2Lu/skxyy?=
 =?us-ascii?Q?0NY5AGpQEKftTaiAw/gVkkeIkjO0uIimFxUCWIOaUrfw4BLFevJCVzRjUIW/?=
 =?us-ascii?Q?mmyGGk5qK7Tt2Ai7v4w89CPSYZ1svF/NpAeyO9lrgiflPQuCAoQyIiAmYuYq?=
 =?us-ascii?Q?Fu/OxO0BgShwTrP7deu2Xnkw2eNfJHbz9uF4wp1nWOE7EU+w/s9Ctgna044I?=
 =?us-ascii?Q?27ADeLGyxDc/jL0yGXZKQwEUdUwARnhEQUOF5Nzye5qdv34z02fWToJKDIqf?=
 =?us-ascii?Q?RblbFOr1UMsaQr98aotE+32ien6zXjppmlRYT+6ZrSkLJtBDe1nNYLtH6ILm?=
 =?us-ascii?Q?M4mESXAqIBSRhNXwqZmyf+FHqal7kaAMyy8GI3T1fQsWGZ9rXnSy0+oZtdsE?=
 =?us-ascii?Q?PEs5soXoO+VU7HiFpB8hDj4ShcSrrwznNMRVSK8IBm1Pj4AzWNqjTRLobc7k?=
 =?us-ascii?Q?Vr85imwH+o+CxJ5FJm3wD2kAwat9N5HkdEajdlFAnCCxgI3/QaJbyE/Y9g7y?=
 =?us-ascii?Q?BKbnfndzO1ynpDgWjMl+pHi2iE6ZX1XWszhhkRoLDM478xxN6ZXyLmfEC5RY?=
 =?us-ascii?Q?tp796wW8Ni12W8zJ05kwqDi4NQ1GwF00N2fRKkOWz+uz8It8pTpRuSod3qHp?=
 =?us-ascii?Q?qGbnYMDy+ALLMuW7tVF5n/FLAdEYqTkZ17z1kcPnnbug+gJFhLaCYGvn7rkm?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf9f147-1215-4484-8bbe-08dbc50442a5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 18:03:49.3666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwLq04uyH+1J6YBkW1zA2OBnCVcpGepzRWgSrFfzeprBiN+Cw8xVrMe8+iYeIMzH8PUzWwWuKc/ky3pM8X6BU2Znzg4faMe6FI/oQEXt8Ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5276
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

On Wed, Oct 04, 2023 at 08:11:18PM +0300, Jani Nikula wrote:
>On Wed, 04 Oct 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Tue, Oct 03, 2023 at 05:34:55PM +0300, Jani Nikula wrote:
>>>Turn the enable_display module parameter to the same thing as it is for
>>>i915: assuming you have display hardware, take over it, put it to sleep,
>>>and keep connectors disconnected.
>>
>> that was not what it was created for and it was on purpose. That is not
>> what we need when enabling a platform. The argument that *users* would
>> then be left in a situation that the display hardware is still consuming
>> power is IMO wrong as those *users* are not supposed to be using module
>> parameters and if they do, it's their only responsibility.
>>
>> The module parameter here is for kernel developers and CI/validation,
>> particularly when enabling a new platform, to decide if the display side
>> should be enabled or not.
>
>If you have a module param without the _unsafe annotation, and the only
>documentation is "enable display", it *is* for users.

There's only a handfull of users of the unsafe variant and I'm sure
there are many more module params not intended to be used in normal
scenarios.

>
>If you want to have a module param that's for development or debugging
>only, make it _unsafe, and add documentation to that effect.
>
>In any case, what's currently in the tree is conflated and broken, and
>this is/was an attempt to fix it. It's impossible to integrate xe with
>i915 display if the xe has different notions on the basic idea of what
>having or enabling display means.

i915 side is called *disable*_display since that's what it does. Here
it's called *enable* and we set it to 0 so it doesn't try to enable it.
I'm totally ok with renaming the module param on the xe side to something
more informative and making it _unsafe. Suggestions about a different
name?

Lucas De Marchi

>
>BR,
>Jani.
>
>-- 
>Jani Nikula, Intel
