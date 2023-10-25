Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78679C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AD310E0FD;
	Wed, 25 Oct 2023 17:50:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20CD10E0FD
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256239; x=1729792239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R49Lt0QCZDFIufEDDaTFRk0s98LDz7iKX6XCa3nY9Tc=;
 b=PRmgFPFHDK7eUrkDo/c/GwaakIT500rlRPnW4GRpDQeXYTgdIfY3i5ak
 LCu1C2jBne+iWnQv9z25AdzkhPpxd4uGGiJAJMjeB6NqW0jGQ5j+SDHxI
 TWdpznVcfxaUl3HcekutiOAUc0Jp+xtqvIpVHt97hVffkwDCdp7l2DRZY
 mc22wzLiqWWErcxIMqGSI8ftBvZAFZhcF8Hkbs7KCOsSsEOF0qXtOqZAO
 JgxOi1VDr9tn77SVc7djL/sinJB1wGBfIKeIZAXMdxrSWL7tzORtbQ6/t
 fx1iXX0MbqZYPuAwt8IpUlyjpgtuVhxvJu3bx4vcjHeFi2mFp7f8AijOz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367577116"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="367577116"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="824720887"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="824720887"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 10:50:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 10:50:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 10:50:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 10:50:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFNnedv8bl1oRWaUPnjK09S9k2X003PgbkP+2qm3ZbC72BgDoFPWywIPgcmjYz+rQefBI4gEpyXyNKBWGtvcjIX8cR5wDP4lPzIusZu2fDG0OTqL4B4/RV6U8BcjK7vuz2UvfRDc0YB9iPKFXUAJkmKrPu7bP4iAq/GIPhoXpIUHs2K1eJSFg7gZs1oh+Y/6hlgEtx1xDx1x0xiUYNS7mc1OJZaPkduKtrs3K49vu+EIcJomPBYmmIkbh7g5UadU7R/gsEA5QJab2hzf6AarCpveJO6C/fiCP4k6fYwinY+vAtx4GkarlF4Vc5CKgyaon08tFSLhrr4X0gXQaA6oHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zstTD+pAKM3BvrCfvfoctuP5LKeG6NFerK3l0hTm6CQ=;
 b=cwThcoWvXXF0mOo8AHSlb8wkh8Zic57H0pmmwm83j34TUkmMLx2+NFBecsfJ9vlgMFmdpcYnGzWoUg6XQM1qb6Dk18bGnP/QRMOb4eXlfMM4b8zD8Kd6vPtx+5pPhK0w0/U15USnTGjrqTVh41iGxvdJYivXdgA8gbxMopMwwDLQsASVW6SA+cIEHNdB+nRyCphwN27bZpIOPPERBQqTrfVhzOGOk8cPKX1ESInNcAux/76MRXFURQUq1kzdaBkgJSGI8QdCScr7DDsI2zu26/7Jr/DbTUTp3qpSLdSrXTxwaj3xh5IgIC+E+XKaklz91OQZW1P81K0QVra5PoAVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5538.namprd11.prod.outlook.com (2603:10b6:610:d5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 17:50:05 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6907.030; Wed, 25 Oct 2023
 17:50:05 +0000
Date: Wed, 25 Oct 2023 12:49:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <eztcofcj4qwbokg6n2ua4t5okg6f24mksxgkgsewozvdbufe22@bt7pyoxs3s5r>
References: <20231025040520.1236213-1-matthew.brost@intel.com>
 <c3ndl6pfzedexr3ukg6ym35stplij4ponp2uojuqytcerlishr@z5dsqljvtbi4>
 <ZTlLNHyzwqAefhx5@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZTlLNHyzwqAefhx5@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5538:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f6da0dd-287b-4c71-4eea-08dbd582d264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85WRpiUu+ozdhuZgRzIjxhErFWvdcddk8Tderdz75AZ/PzBqLa3/bd1nFvc7kb/Smgol7dJLhmKOSgyR5ji5PHyrEqavLAfTd+SILX14nGEsv97AEdHxqGgN/vB8H1TtKchcf0M07uUzjoHclSluZRCPCB0KTE0cHt0rjyPtdu7Q8ZoHD3FBC9lL5fN9JEz7uyQZhBIPlZ+tMRzc3vEGADhMUJewNu9h3CwU+W4hhOugni4DP9Gk6sGZGXKO32Y7kiJqPVptb24t2p7F/8u38wn+UoF30xylKxdrokF/4L8c/SVWXKBFG/AK0GfmyORPGJi+aHQVCdy0Q21af1TgkBKBkVMTJkuIkXBw4HaG36Azt+6XpnjuOTo+cW0V2Vr31dQPBbb9rRjRlQaLXPkiA6F1zCCwG3lYh6g8h8FmK0TdYZgatEkLhgOrSYslD1HiZM6e7s4Mo8Ie6LX7iqsrQCh5Evs9hU4pCDxCY/fSUwgITsPNQC+mfgUu4PsKv3llfRT+P3jhp5DZ1Qp9QYSEyuDyT1RU8uzdm54BEKGtjaTb1gjLKHTh0ihedH2kvau/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(41300700001)(86362001)(15650500001)(5660300002)(8936002)(4326008)(6862004)(82960400001)(8676002)(66556008)(66946007)(66476007)(6636002)(316002)(478600001)(6486002)(2906002)(33716001)(83380400001)(107886003)(26005)(6506007)(6666004)(9686003)(6512007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9VGac/TBHwsSH5mrycJM8wyxxODTWrU1sz9dbLDXI5CbEv5lNMVy5UAVH+HN?=
 =?us-ascii?Q?MdVdv3OCGfwvzuiugS88tJQc1cgXjwoffyChwPcglDjH6I+jo9Xy0wZC1MXR?=
 =?us-ascii?Q?RzslmV8J/uMxBij+4yhEa9u4apdyasotbLr+wQho52agwcPEm3K/FRZ3j+Oy?=
 =?us-ascii?Q?+oWYGAUUKMlrzkuFm/gHafee7LeFv33VqR6177PoigiFM2TU0ASYEiXdjJtD?=
 =?us-ascii?Q?A9dG+wVZ/zCZo+KD49OmwqaxmMtBrRH5msnyHOYxsE2DJi3XLZbvTvWhXv3+?=
 =?us-ascii?Q?/X/zIkA4JXkz/RYyjqlS6Jd3UeeIfXfdUMP8l+IYuJnr/l9G8jkbMVpjFujx?=
 =?us-ascii?Q?vekCNyyl+IsGtYYsW1t5doQYbomXtj9DykfxnAYCiD13A73ZLM0uoVYwrylI?=
 =?us-ascii?Q?M0RCsAOAZ4rDwRyyLSOpGQDB3LV0teG3ZKH9rfROmxtcUGPYiz6+7SMAlId7?=
 =?us-ascii?Q?73JrxFa1Vs9+/MnW6FievwoLpt+WDXCZDg1G6nxc4A37I3Mq6ZR9wxhIb2jc?=
 =?us-ascii?Q?578nAGhQcCm/K/uUtMXGGhEOY8t75ZHzI5sGw10DOceVXA/6rSyUlIhWnbVM?=
 =?us-ascii?Q?PMyD84FL49+Cn0Uogj9UMp1OIHHJB6IOVKeWbs/FqedVtyJ5Cy8cN/g6pkgA?=
 =?us-ascii?Q?LZEPX06dqjSG/GuD+FkIM6espWtEHyl+DWR+Q2OvcrI+yuArW34S9LDHNGRQ?=
 =?us-ascii?Q?eo/0Nub8WeZpjHVjS9qUFYfzcmbIWTywvtu7HZpIBVBjaR2stJMTstfluQ4s?=
 =?us-ascii?Q?B6DxRR7nG40Gfu3MGi8jVOixtpssEpYTicTHwu7RaNXGIdLtZFeZHA/bzu3q?=
 =?us-ascii?Q?LAnIofyAlFmqdonuCRIV8YF599e7/YqnjO//+ieNXtX06+NmfvdS3lcxh1Ll?=
 =?us-ascii?Q?IwDLZh3OZXhCPYOer1rjBJaCEZazb7nkx2520v6iYx+v2o2ly9I5SyHSfQj4?=
 =?us-ascii?Q?0UmW6vsiHkU9hyDyaUkT1EORjegfXRd4td43cN3ZJngvVVN4buGia5lWzukG?=
 =?us-ascii?Q?IxkiPAbb8LpiZRRaxVVWE5AA+xTWpSkKKbS3rru0ahwGav6MuDAy0HaBTwHb?=
 =?us-ascii?Q?vX3lBKU7Y/fTeaYNJYj6pEgOU4hRfhiKCx7a6Tmg+SjTKVqPDPY45ysaJSuz?=
 =?us-ascii?Q?9CvYa5vOABa73tioXQ4TH4k9vZ3VhKDW3WqeYulyye/Ie0W7t5tNCfJWsjP5?=
 =?us-ascii?Q?/7vDRK6lo+HaBAG9yLol33g15XrOp8Jot5a5CfKnidjaVC/vyh4vq8ul6zvY?=
 =?us-ascii?Q?bDBRvuRmTyc0h0rnSqeXJieJyHslMpTQfQd6oL6HUF/Gx/twHqaEi1oen0Cc?=
 =?us-ascii?Q?NfUeQbQa28mY7caghyQ6Svn6sAKvuoPpXPM2yIqvZAcMxydZdZ1JrvyS4nCm?=
 =?us-ascii?Q?jINg3ekuSwC/dJDr3oMegJ523yXLC/vcAVv82SbRvWs16dQmw2lSLSwy5J5Z?=
 =?us-ascii?Q?RIQMnoso2bEhwPJ//Lw9RF20hzeE73zF/iVdDNZGw+fejm8nTvcXiwnrdv4J?=
 =?us-ascii?Q?Af9VjZPGGDfVZ8J8iRB2wQgMfDj4FDD6cQ48/Bx1ITvO4/iKCivVjaz/uOaM?=
 =?us-ascii?Q?TUYLymkPzRTmRobd80twp8NDeEyKCXv+wiALzgGesZOCA+PcH2nZjvLlFqtO?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6da0dd-287b-4c71-4eea-08dbd582d264
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 17:50:05.6604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oj7T7BubkeCFHwE/FNe8fHDYwr5VAvKyQ0G3gPbK+shsn4+ORXT8XuIiMNkvwNMnxzyWcr2tu4iEGUw/fkTguY+3mZiB+qcjVoAKshL+rEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5538
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Update to upstream DRM scheduler code
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 25, 2023 at 05:07:00PM +0000, Matthew Brost wrote:
>On Wed, Oct 25, 2023 at 08:56:17AM -0500, Lucas De Marchi wrote:
>> On Tue, Oct 24, 2023 at 09:05:20PM -0700, Matthew Brost wrote:
>> > The largest change is the message interface has been removed from the
>> > DRM scheduler. Xe still needs a message interface so it is implemented
>> > in the Xe driver by adding a Xe scheduler layer.
>>
>> can you point to the commits upstream? What commits in our branch it
>> replaces so we know what to drop when drm-xe-next is rebase... ?
>> How was this diff generated ?
>>
>
>This is based on the upstream series [1] that hopefully gets merged
>soon. To create this patch I just dropped in the new drm-scheduler code
>(copied drivers/gpu/drm/scheduler/*.c / *.h into this repo) and updated
>the Xe code as required. The DRM scheduler coded so much in the baseline
>I'm not sure if it worth trying to do fixup patches, rather we just
>merge it on tip and find a proper place these changes during the next
>rebase. Open to other ideas too.

I don't think we should do fixup patches neither, but it's important to
keep documented in the commit message how and what was changed. Like you
did now.

However I think it will be quite troublesome to rebase the branch in
future since you are also changing other parts of the code. So it's not
a matter of just dropping this one patch when we rebase.  Lately it's
usually Rodrigo who is rebasing drm-xe-next, so +Rodrigo.

One alternative that comes to mind is: can you do the rebase and post
the result to a remote branch? Assuming your remote is called xe:

	git fetch xe
	git reset --hard xe/drm-xe-next
	git rebase -i bb46e837b7e59c22a567ae6913ff4d6bf0e9211a

Then drop the patches as you see fit and add the ones from this series.

Lucas De Marchi
