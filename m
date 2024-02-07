Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814B7C4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 20:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFFC10E129;
	Wed,  7 Feb 2024 20:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EK89pR/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE8010E129
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 20:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707338447; x=1738874447;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NXpXu4164HUOO4YzoPZHIkUqgtV1J2gR+24i9jugCW8=;
 b=EK89pR/7Ywg4RH1USMrB0z/sqWXSEKA37P4LJ5Q3P1DGvQ+cofqnKmBx
 1pzyNVjfTNkXKxp9IX4fMXwumVOwUXc5fpp8G1aVgeXugCrCxVF93eS8E
 p5h4OLA7dkYpJTahoXAHb11vH2mx4Ifb8JN2wGdZVgmxZHvMv2wDSEdxk
 KCm5et/PMhdpI60MrwnCxOSLL0g3OrEkd1PPzFhMvkAh7cbpacTHEZeLz
 tQZceZnLsPSg7pPama7uN9BJnwI4c56DKZuyTR/Yng4AIHyBCxYWEOYXR
 rnPW0mTlN+y/3uQK1Dk18ZuSEUMWxvL1aZrFsAQTqVQhT+eX8TxEQgDdx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1358824"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1358824"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 12:40:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="24698056"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 12:40:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 12:40:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 12:40:35 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 12:40:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUT/boEk5ZwxZDiHVrDxX2VERE3hNO+bCmxKCVaUyiy/U72A26l3ilW9VJSYh/u1chZM+UnqnfOsFfk81665rEfB3AoQ74xhr3Dbthz0nuutJZ6jV539PovbzaOrwP5JUBKJ9KflQGGSiXEy6WM0CCZOEvT8f4x6fLOHJ7US2XKk4DEDbmB3T8tIk6z7dNgcF81mvUj0MjVuLNDhD7cJxW0iqF3YKOECwnxLIJRfjDUasEZdO/hIh4tb71QVFw0K3Jmd+4sdR7YMoDmJMWl8EKzB1KHFzs3R4iUS6+IO4bFruXiTjqsUXre1+6ZCfI8qy+qRNMbCWgy3WJCi7MrSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47pSFURNtU8dr1Znr0BPr33AquBpAWuG6IlHgZVc7yQ=;
 b=Sxt/Sr5IZGrbcMWZLowOE8ok2it08tTBbKQxSaM0U0taCHZzibG7HnNVBOrjzathnM2xOuKgXBpVSajcUUwTROI6NEcHK+n+THTiH3CS/CUIZ48oPBC3CEiFoOUOjBZGJAkx/QmnyQXxxJMzMcHmd7JtC90jqkD5MGNA+iEhBxUoPmZwrNkZOGh1bxN5Z7ZAnyEgaESSTnRlaB+qV9O+2MUUv1OYFBW5wm6WBwClFPEeGjDJ9ZYgR7e0iLK2fF1Kg59clDBjjgzLtoM9cxQznsGIzk/CP4GgoudieMmQu46kGyTP4K0ozfMtc5U1FW9yFmhYfX/xXeExhNreoNKY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 20:40:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 20:40:24 +0000
Date: Wed, 7 Feb 2024 14:40:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, John Harrison
 <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>, Matt Roper
 <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Gustavo
 Sousa" <gustavo.sousa@intel.com>
Subject: Re: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Message-ID: <v5mwvlynhfvcre2iudh3am34y7eh4llhifj32gw3l56g4idvw6@uo6rutzsqmyl>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
 <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
 <zcvxg35dgst3vffu76v532dhl5lob6ilpi3hktg4ptnqc6lsbd@dsrjrmgk2kdj>
 <6d27be6f-f501-4bba-a8f9-ae80f23484bd@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d27be6f-f501-4bba-a8f9-ae80f23484bd@intel.com>
X-ClientProxiedBy: BYAPR01CA0010.prod.exchangelabs.com (2603:10b6:a02:80::23)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e92cb2b-02bd-44dc-fca2-08dc281d0256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iv4qLH9OxAgORLT5PXaG2lsHGy3YdA1g9Qy9+lYegxv47THx1X4qX5tVcfseh3PX8yq0fsx7zYcmavMH7gouhIydcRSio3smPpwSfjjZsls2m3bKUh3k0K7c6XaJM10t1fZRRQfG5mMxXJBkS0Od0eNWcgCktyHzSOSBw7uouKxEYstpZ4G12uc4pY3K8Sfow8CsfwqJeIp129fuahXM772Wi4zci6cxhEEfBCckLOS7lIVepjZZ9Zs6MJPsn4C+rHV2qsYJQhiFdFumXsNkA6/MwB90GVcjMzVNuHd66z0rPsR3kU9Gd3X3JzsBNdr4s4d7mDzfx2KG1yPquQhgYb2L0QPS9o/YNrcd1qKkDlGn9BZZkMCslynNXwMqNY4x+mAsKLB2fbh0Yw6e/Flfa2L8ncvMauaYAUu7o8si65t2bNfBcOC8kFBdyQYnwdeoEr4tQK08IPkfo6L68Yg5CUCxxpebBsoh8qVsVb01uO/hhvv2KAUtBOkAAdqFujpBxlScMajaoy3bLX5GESa3MnY7MFWYcs9kA6Og9S0pgeYjn8fKbmWelVOlSLYl7L+cvVYHuwml/gVptrhmnNG/vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(39860400002)(376002)(396003)(346002)(230922051799003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(66899024)(33716001)(41300700001)(8936002)(4326008)(6862004)(86362001)(8676002)(30864003)(966005)(6486002)(478600001)(6506007)(107886003)(6666004)(5660300002)(6512007)(9686003)(66946007)(66476007)(26005)(316002)(54906003)(6636002)(66556008)(2906002)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YkU512+zFgzAUGj6+5M68kMlpqX+mLyQcNINv6IdGjPTJcUZF3jtD1FxAq?=
 =?iso-8859-1?Q?aQOTwZqoggwM5LUCI6d+7UPMciZLprvQCn0Z+A82Gy9vxNmn+2n1al0mPp?=
 =?iso-8859-1?Q?n7tgojzxBSpyEdEnD3kkc14DeYwsQwbF+Fp9f3lPALWKXm6Ph8Cu320kD5?=
 =?iso-8859-1?Q?40MZEWxDPst0pH3KR63BZoUoYoUW067SbZCLqQ50SwxxgirX0w+llrZqUZ?=
 =?iso-8859-1?Q?X8oeSh3H1B1jLSgf4Wb/fPMAN2GbhGf3HsZpBcdDnhrMFAoxjlyKt/1s96?=
 =?iso-8859-1?Q?gNmaR6CfdCxpUlbXWKINq0IlU7R8EHMoYa0oEzU39vdMF1VHNZz5/JY7Ns?=
 =?iso-8859-1?Q?zfzeIVgBESYUnubPlO+tl1pA3lI3qA6gIWt66C0kfI+vhtn3abu8z5JdSd?=
 =?iso-8859-1?Q?63h1O86PSv48QetWAR66DQIWSgDHuyf44ADLRCegTxdQ/NuAraBtkTS6k5?=
 =?iso-8859-1?Q?VPzKFlHp1Se10S0rGZw2sJah8l10Eke1fD5I0UDAqgjyaBSa7YkYHik01m?=
 =?iso-8859-1?Q?LFICYorZNS1pcsfdS40yAJ7IqhfWaOHSSAn3/7xwab+7orauBhwo12hAca?=
 =?iso-8859-1?Q?STEMDvn7nxK0LUf2ptnYsrzTKarfjUHQeDIvJC/LcCLPmV7Mbumdsoz0Vu?=
 =?iso-8859-1?Q?PiBRKu9yyPHYtt64T/WEZjYPtCHbp5+dz5f/KIoGxsP73ItY4dyPd4CYCA?=
 =?iso-8859-1?Q?Beaj7iKqlHj+3Qy5u7otdXVxbxIn49BVO3qIGiv4CW43ZMEwgNmpZnakUZ?=
 =?iso-8859-1?Q?Pc55tP1qToakNlmSeyGkV/cZPsnZaHAuEw6HVkup9nuM3QD+b1UrQq4R15?=
 =?iso-8859-1?Q?5VxEJ1wi6xLtTg5la9uvVHDKzc8ZCt5G3t5jqkNPAicEgel5kK/ZRa+mBt?=
 =?iso-8859-1?Q?r4bQAqs7g1gaeEKrZ3PAaxnLCH+ogTDmBICyGF/3dZlsHaAKB8hQgjPkjz?=
 =?iso-8859-1?Q?MOpn5q9WrrPLe9DLfCHnwpgVoIUVLK0RC5Tsy+xYK2nBDVHwTf5wYjHNwV?=
 =?iso-8859-1?Q?8ZNe/7wDg9322SL/RHN/Hlkes9RcTyaJiA25hBolq0QiE0MnKU5xJkjyBV?=
 =?iso-8859-1?Q?g2zoIQAihDm2f+hM1Aa/KxnOI9AkUlMZYpHYQ1wbHUbGaStp+kDdMPII1Y?=
 =?iso-8859-1?Q?Xj2lU0taLCdIg8KhN/Sy9KSze7QdkQGP1aiiVtcot4l4zSVhXhIqiYcl2E?=
 =?iso-8859-1?Q?efWNES3hNPsLfOa8lZ8jYiWmJVcdfPrAkWLg6KA1QZV9mGnA1ti1EsJuT7?=
 =?iso-8859-1?Q?+zsASs1Vgzyxla6SbnOE6zK2uSbETpKNrKrn1EULWy5tKwJFPSXsXSsxib?=
 =?iso-8859-1?Q?s3bOLVcHykiSomapS34Fea53r49fcayKBsHDrgtjv3pFQX1L5iDgai4A2q?=
 =?iso-8859-1?Q?Ji9bCmFnBL1CK9XCwuTM4uu/mRRbLfEm7zL7ltaRU4lbG+gVjs5senfOXK?=
 =?iso-8859-1?Q?hMr9OQy5L1xPyiCMlvS799tWQcvu87uBSA08gmp330lTOOnPtiyKLRaLwn?=
 =?iso-8859-1?Q?WYnnKS4GcHs+QLG2S7E85nB9dzBI+Od7E9ltPD8nWxx+CseApT3WXLg4D7?=
 =?iso-8859-1?Q?JgJyXy3vmvGfzF4fgkCDIhbEX+VwOPi2KYWqddapFMJxnvDefPJFNAmi56?=
 =?iso-8859-1?Q?YPuCptrf1YQ5fkBaaZns4ID7CjoNGdkhS/5mD9cduiivc/4At2jqIPxQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e92cb2b-02bd-44dc-fca2-08dc281d0256
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 20:40:24.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0c8KopXXnrE1Q0z0P0ZohvAWYZBtZLLXviocsKpPaAMbSdVUHY0a4ET8fGDMtceNLC3yGrGNb74mfLUk6JRVp7y5F6yujaxQ0Rwly6TBtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
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

On Wed, Feb 07, 2024 at 10:34:07AM -0800, Daniele Ceraolo Spurio wrote:
>
>
>On 2/7/2024 8:42 AM, Lucas De Marchi wrote:
>>+Gustavo who is dealing with DMC firmware lately
>>
>>On Wed, Feb 07, 2024 at 03:30:59AM +0000, Matthew Brost wrote:
>>>On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
>>>>On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
>>>>> Supporting older GuC versions comes with baggage, both on the coding
>>>>> side (due to interfaces only being available from a certain version
>>>>> onwards) and on the testing side (due to having to make sure 
>>>>the driver
>>>>> works as expected with older GuCs).
>>>>> Since all of our Xe platform are still under force probe, we haven't
>>>>> committed to support any specific GuC version and we therefore don't
>>>>> need to support the older once, which means that we can force 
>>>>a bottom
>>>>> limit to what GuC we accept. This allows us to remove any conditional
>>>>> statements based on older GuC versions and also to approach newer
>>>>> additions knowing that we'll never attempt to load something older
>>>>> than our minimum requirement.
>>>>>
>>>>> RFC: this patch sets the minimum to the current GuC version (70.19),
>>>>> but that can be moved one way or the other. The main aim here is
>>>>Ideally, this would be bumped every time we update Xe to a newer 
>>>>firmware
>>>>version right up to the point when force probe is lifted. At 
>>>>that point it
>>>>becomes fixed and we have to add the version check support back in for
>>>>future w/a's and features.
>>>>
>>>>Get's my vote :).
>>
>>Yeah, but see my other reply... I think we will have to wait the
>>firmware being available in linux-firmware for that.
>>
>>Also, let's kickstart a discussion on our process with some
>>possible changes so we can get it documented. I think we have a good
>>opportunity here to start adopting the
>>https://gitlab.freedesktop.org/drm/firmware repo.
>>
>>Rough idea:
>>
>>1) use intel-staging branch with tags for pull requests to
>>   linux-firmware, just like documented in their readme.
>>   IMO the naming is rather unfortunate since it would be
>>   good to use it for (2) below.... but since it's already used
>>   we can use something else.
>>
>>   this would mainly replace the use we have today for
>>   https://cgit.freedesktop.org/drm/drm-firmware/ ,    which could 
>>be retired. From  upstream linux-firmware pov the only
>>   change would be the remote location and that we start using tags
>>   for the pull requests, coming from a single branch regardless of
>>   the firmware (guc, huc, dmc, gsc): intel-staging. Once accepted in
>>   linux-firmware, the branch is fast-forwarded.
>
>I think this needs a bit more fleshing out, because before we do a 
>pull request, we do want to run CI on the blobs. Also, in several 
>occasions we went through a couple of versions before we closed on 
>what to push to linux-firmware (e.g. in the latest push we started 
>with 70.19.1 but then pushed 70.19.2), so we can't go to intel-staging 
>until we're actually ready to push. I think the process you have below 
>for mmp blobs should work for this early testing flow as well, but we 
>might end up with a lot of noise in the staging-intel-for-CI branch.

that would be a throw away branch where we push stuff to be able to test
on CI. I don't think the commit history matters much there. The fact
that the firmware is available to match what is in the kernel and that
there's a documented process for using it in my view trumps the
this downside.

what I expect would be, considering the LNL case as example:

1) Start testing with the mmp version:

	a) Add firmware to  drm/firmware intel-staging-for-CI
	b) Add commit in topic/xe-for-CI on the kernel side to make
	   use of that firmware

2) Ooops, that has bugs

	a) add a second mmp firmware to drm/firmware intel-staging-for-CI
	b) replace commit in topic/xe-for-CI on the kernel side

3) we think we are good, let's try for real

	a) Add lnl_guc_70.bin to drm/firmware intel-staging-for-CI
	b) replace commit in topic/xe-for-CI on the kernel side

4) yay, it worked

	a) Add that lnl_gu_70.bin firmware to intel-staging branch and
	   prepare pull request to linux-firmware
	b) move patch from topic/xe-for-CI to drm-xe-next: i.e., rebase
	   topic/xe-for-CI on top of drm-xe-next leaving that commit as
	   first one. git push topic/xe-for-CI, dim push drm-xe-next (or
	   implement the logic in dim to push 2 branches)

	We may need some time between (a) and (b) depending on where we
	are on the kernel release cycle: we don't want to submit a
	kernel pull request before the firmware is available @
	linux-firmware repo.

Note that the fact we are using mmp makes it more complex, although
explicit.  Going direct with lnl_gu_70.bin would also work and avoid
updating the commits on the kernel side.

>
>We also need some rules to handle the case where there is already a PR 
>in flight and we need to push some more blobs. This might be as easy 
>as the committer seeing that there are commits on top of master, 
>replying to the previous PR to deprecate it, and then generating a new 
>PR with all the blobs.

the pull requests to linux-firmware would come from tags, not a branch.
So you have (tip of the branch is on top):

	o <intel-staging> intel: Add lnl_guc_70.bin
	o <refs/tags/intel-2024-01-30> intel: Update dg2_guc_70.bin  <-- last in flight pull request
	o intel: Add lnl_dmc.bin
	o <origin/main> ....  <--  where linux-firmware is at

Looking at amd-staging, it seems to match what they are doing:
https://gitlab.freedesktop.org/drm/firmware/-/commits/amd-staging?ref_type=heads

see the amd-$DATE tags

>
>
>>
>>2) mmp firmware versions are only ever pushed to a separate 
>>staging-intel-for-CI
>>   branch. There is no pull request in the mailing for this. We can 
>>either
>>   push directly to the branch or create MRs in gitlab. CI would start
>>   using this branch for the extra firmware for platforms instead of
>>   whatever it's using today to process the pull requests from the
>>   mailing list.  Or whatever it's using, because I don't know and don't
>>   see it documented anywhere.
>
>As long as the CI team is ok with this, I'm all for it.
>
>>
>>   The patch on the kernel side to use the mmp firmware is only ever
>>   pushed to the topic/xe-for-CI branch since a) the firmware is 
>>coming from
>>   a non-official location and b) end users and distro packaging
>>   shouldn't see a warning when building the kernel due to a possibly
>>   missing firmware
>>3) Raising firmware version requirement for past platforms used as
>>   SDV can be done **unless** it raises the major version. That's because
>>   end users would start seeing the warning that we avoided in (2).
>
>Who are the end users here? If we're talking about older 
>non-officially supported platforms, the only users should be 
>developers and they should be able to handle having to update the 
>firmwares to a newer major versions.

distros and any developer outside Intel. The kernel build system is
unaware of xe.force_probe. So if you have, after the several macros:

MODULE_FIRMWARE("xe/tgl_guc_71.bin")

It will show up in `modinfo -f firmware xe`. And it will show as a
warning when installing/packaging a kernel.

It doesn't matter for minor/patch updates because the file name is
major-only and **running** with that module is protected by the
force_probe. The major may be updated when it's available in
linux-firmware, which means i915 started using it (for i915 that would
be "as an option, with fallback to the previous major release" of
course).

Lucas De Marchi

>
>Daniele
>
>>
>>thoughts?
>>
>>Lucas De Marchi
>>
>>>>
>>>
>>>Mine too.
>>>
>>>With that:
>>>Acked-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>>>John.
>>>>
>>>>> agreeing to stop supporting very old GuC releases on the newer 
>>>>driver.
>>>>>
>>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>><daniele.ceraolospurio@intel.com>
>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>>>>>   drivers/gpu/drm/xe/xe_uc_fw.c | 36 
>>>>++++++++++++++---------------------
>>>>>   2 files changed, 16 insertions(+), 34 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c 
>>>>b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index 868208a39829..5e6b27aac495 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct 
>>>>xe_guc *guc)
>>>>>       return flags;
>>>>>   }
>>>>> -#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 
>>>>8) | (pat))
>>>>> -
>>>>>   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>   {
>>>>>       struct xe_device *xe = guc_to_xe(guc);
>>>>>       struct xe_gt *gt = guc_to_gt(guc);
>>>>> -    struct xe_uc_fw *uc_fw = &guc->fw;
>>>>> -    struct xe_uc_fw_version *version = 
>>>>&uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>> -
>>>>>       u32 flags = 0;
>>>>>       if (XE_WA(gt, 22012773006))
>>>>> @@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>>>       if (XE_WA(gt, 1509372804))
>>>>>           flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>>>> -    if (XE_WA(gt, 14018913170)) {
>>>>> -        if (GUC_VER(version->major, version->minor, 
>>>>version->patch) >= GUC_VER(70, 7, 0))
>>>>> -            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>> -        else
>>>>> -            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC 
>>>>version expected >= 70.7.0, found %u.%u.%u\n",
>>>>> -                version->major, version->minor, version->patch);
>>>>> -    }
>>>>> +    if (XE_WA(gt, 14018913170))
>>>>> +        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>>>       return flags;
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>>b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>> index 4714f2c8d2ba..e5bf59616f3d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>>> @@ -296,36 +296,28 @@ static void uc_fw_fini(struct drm_device 
>>>>*drm, void *arg)
>>>>>       xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>>>>>   }
>>>>> -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>>>uc_css_header *css)
>>>>> +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>>>uc_css_header *css)
>>>>>   {
>>>>>       struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>>>       struct xe_uc_fw_version *release = 
>>>>&uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>>>       struct xe_uc_fw_version *compatibility = 
>>>>&uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>>>       xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>>>> -    xe_gt_assert(gt, release->major >= 70);
>>>>> -
>>>>> -    if (release->major > 70 || release->minor >= 6) {
>>>>> -        /* v70.6.0 adds CSS header support */
>>>>> -        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>>> -                         css->submission_version);
>>>>> -        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>>>> -                         css->submission_version);
>>>>> -        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>>>> -                         css->submission_version);
>>>>> -    } else if (release->minor >= 3) {
>>>>> -        /* v70.3.0 introduced v1.1.0 */
>>>>> -        compatibility->major = 1;
>>>>> -        compatibility->minor = 1;
>>>>> -        compatibility->patch = 0;
>>>>> -    } else {
>>>>> -        /* v70.0.0 introduced v1.0.0 */
>>>>> -        compatibility->major = 1;
>>>>> -        compatibility->minor = 0;
>>>>> -        compatibility->patch = 0;
>>>>> +
>>>>> +    /* We don't support GuC releases older than 70.19 */
>>>>> +    if (release->major < 70 || (release->major == 70 && 
>>>>release->minor < 19)) {
>>>>> +        xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or 
>>>>newer is required\n",
>>>>> +              release->major, release->minor);
>>>>> +        return -EINVAL;
>>>>>       }
>>>>> +    compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, 
>>>>css->submission_version);
>>>>> +    compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, 
>>>>css->submission_version);
>>>>> +    compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>>>>css->submission_version);
>>>>> +
>>>>>       uc_fw->private_data_size = css->private_data_size;
>>>>> +
>>>>> +    return 0;
>>>>>   }
>>>>>   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
>>>>> @@ -424,7 +416,7 @@ static int parse_css_header(struct 
>>>>xe_uc_fw *uc_fw, const void *fw_data, size_t
>>>>>       release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, 
>>>>css->sw_version);
>>>>>       if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>>>>> -        guc_read_css_info(uc_fw, css);
>>>>> +        return guc_read_css_info(uc_fw, css);
>>>>>       return 0;
>>>>>   }
>>>>
>
