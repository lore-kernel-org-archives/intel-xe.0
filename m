Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8F0C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 23:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE32810E3F2;
	Tue,  8 Aug 2023 23:39:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B115510E21F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 23:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691537995; x=1723073995;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r/C0XJ5+1hmVcATB4WwuxZdygI8S28OcsOEKR+YP07k=;
 b=DcMAeaPnbioff5OtrX/Pufo97tR0QSACLWhpiIvNbFW4TvfsU4p8B1wB
 Gcx9yw5CThg33aHtC9LKi87GBECPF9eJOCHyBfAbg/w/QeazBb3pLhj1k
 uT6gsBw2SrVX8KBwavJB8hH2azZwWuesGzShHnKvuKhm3yuP/9hBhuxoc
 kPrJ1ajCa8Bq9IRe18CV7fkHkIPHW5yv9dvI1sAcWhVS5+7LEe4+Ov4O1
 VbRHCqyHvP9ZRKfjXHPb0RgCEpFiYqY8/Lx/kp9HIuCrNv6xt+qCsTIk4
 3oBMtP0TRx8RhplXVMYxlduXcb4FL3/32UbnZ68j0BxgBi4mV79M+V7UL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401943174"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="401943174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 16:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681449247"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; d="scan'208";a="681449247"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 16:39:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 16:39:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 16:39:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 16:39:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhERxzNnb+yhyHJJ5gG6t7QJnSllueWazTR3Mv5MzM3qRWHoaT91r4d3HqwPngZr7tLsP4P6EQlB1avvA1gDNggPNYH+Pz0CwgF+BB9kEI1BzOsogYDcChiwWDhqxk+hhCFQALNmIXaCH0c81i1fuqgjM7rJK4NzlwsPQXyC6CHask6c5tyYT2zuz90u1mgw00C2YoqfJjAfDly9xbayby+hdP0Nr9SF2ZVGpppQFo73F9HqJ+UHFG6UIbaE71ITvz0mW4ZOzEEtKJmQouk2dzbocNV6hv+VZm2i6dawTV55+O3MW3LFqkDuMwsXS5RbxwpxjyXm6hcG3hb4HFgkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkHrI2ZvRkdXXbRTa8JrOd1bKOh5ZxYd9v+AjD2VU/M=;
 b=Zk4fFQsSu8XqHKNAQsADXRjYSd1/GEJCnPVTLe7Au2lxfxbRDha2fQqoPwMQ6WE8VvB1f/K68jCpPBPtg29wmVNVjakcW1n99h9t1Kzb0BbMwLr+75LO1svFXZP29vVrDhgcUZBkmqSBH+WBExhcq9MFs7n74AkCWUmYkbRZwEk4oVD9u9+UqAl6D2EGv5e/ZAiZviKErrPUexcXHMeDhinu0MbNtm78dvaJfyDO2nE+IcJjQpQ8n10LfX4uKHZVvNuffFwK4HQh/0LY7OufcI8Hv9UeNAztta7qYGM09C2RMRuCWBA1hU4fCaiZi2ZM/u5JDvOJlg7Khh6IJFEBqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 23:39:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 23:39:52 +0000
Date: Tue, 8 Aug 2023 17:39:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <z36oxkgfnwkdurwlupkmxl3olty7pfyvk6afnylbdnr2dwmxof@jqnzrnmet65i>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <ZLBfsNWDeWYx+c/X@intel.com>
 <3zwh5c6wvaure57flxp5jrqe2rira6des6an3ws25anrauxsnu@a24cb3vjzbh3>
 <87fs4tu7xl.fsf@intel.com>
 <a3bof7gwvoiqgcjlvhogomb45qhylrn6i3mbetvxofs4sthe5u@ka2lh4hbmsk6>
 <87v8dpshff.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87v8dpshff.fsf@intel.com>
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bfd0af-e98f-4af4-fdc4-08db9868c2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Q1SGKTA5QSqnGW6+0CltwCY06+MfDpsHjXy4HNiYkWc8Cibp1q4JBon4i1rCe7jlCNGAbZNraeArT5+N8CHFED0cInguLgmlGf6lV5E1hquriRRayylDYpGbZG62knFH4YjhjenttWtUHwaxY0OURpg6ZVIyD5FahgmxUaxBqzWi2oYTMvFhX6DghC5s9OHStFBi/HtxKlZ1NqzdMR3Qyp1SjxZHP4T819iVay4YpcXgX4oV8C157m/YXR8IWQzZl7g8lWgqq/D/iWIcSuIgx2RVXxCTHtR9CCqidzbeK0cBOpZC+mMF7fSxa1BeCabsG1jeaeNj02pObhfGxWHyHFGmWa8F2vm0dYxPSE/vDFYKYEPDxlN3eSQHnwtNE/fcqSugaSj5aCM/FWh1oDWcW5eGUUs6FvsAIWQnQ/91M6wpZxihjdgWedVV7YHqCZolg+SYM4R2yysMxmJacOiJ7X1p8L8lG9s29c1JGEFnx/Qs1jNisq2sPSHI6eP0UB7cpZRBzuOGnjGbflZkjmH5R7OkeHdYW9K9b/Wc4oupLYldTFSAhlGjoUjHBO/Ef60
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(136003)(39860400002)(396003)(376002)(186006)(1800799006)(451199021)(66476007)(66556008)(66946007)(6916009)(4326008)(2906002)(8676002)(8936002)(5660300002)(478600001)(86362001)(41300700001)(316002)(54906003)(82960400001)(33716001)(38100700002)(9686003)(6666004)(6486002)(6512007)(6506007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CgwzRp4XyQUKZOBJvADG8JE3gGXgVSPBFvZWZHXyU9JLJJmYdSofIPGSAC3C?=
 =?us-ascii?Q?j2eEHZbwkOhd2wGGSfnG4UYcxQSQgnyzH8uGnAdwJCTtYpb1RESTYo9utVho?=
 =?us-ascii?Q?Var8Dc6RV3rIi5iUCBuHP7SLdU+r46jfy13giAHB/znE0O+1IvGBabrIpfGt?=
 =?us-ascii?Q?ATk6oqaXABvmHENx+8B7gZTaeNSzm/YNUhk7t30JI94g4M3V9MdOgyBV7m2H?=
 =?us-ascii?Q?478FOKeJfOY/sIElZD6dLjx+AhShk6iX4Gn0TTft+5kXC0CuZzYqXcaeu3Li?=
 =?us-ascii?Q?7J80rg/lrymmhVKCObin7gmXQe4s+0rQNOT8cfM9aEV3DglC7Y0oGJPT1lit?=
 =?us-ascii?Q?GkzIfALZT3s0TrtviMnA3Uuhhr0NeviMGLw/uGjQ1JC3mJA/7mj6eALXfFtO?=
 =?us-ascii?Q?DuceEYNqmZ6jvqrSE9uLIC7Jv5fTfdiZhAqo63b9QUHWsZr714hkwHYIPOtw?=
 =?us-ascii?Q?YFb1rEiij9L6JaxGqmCCxzsOYNs6Vinu6TY2pSLtVXlPcvJmbKpdZXQbcuDF?=
 =?us-ascii?Q?FBCLOF7qnRoIkAELVdVmiy4zp0MTN1fhpnjbkxfJb8N2qDwqbHRlZ5BNmFcI?=
 =?us-ascii?Q?vemlr/mICVpu61HndXyjlMXQFL1iloZ3XVIPbxOXDW5uKBp9KiXftK17kWYm?=
 =?us-ascii?Q?rRt+K6JA8gdW++iBI9lLbjXSPGoeKjPNoR8UMUKEffEJ3DfjxEBRl8oXIjbQ?=
 =?us-ascii?Q?SoLnq6oRzVB3f4cDz69OlUIJp/eeujunnoUo2QXZt9M73wvNgm0W6ZcE8W3b?=
 =?us-ascii?Q?oh401azZLYISqpAu5BZOQQJF+AEWkHDzgBBDDqQx3J7a64gaB13sOdhqERBQ?=
 =?us-ascii?Q?xym1CVObUgj+LLyM3u8RM7GuBm8vPfs0Buxzp5yCnQSIaqJovlT5qkgoEm2J?=
 =?us-ascii?Q?GdAPp5dxCwKYc0AVnk5p0q25n8d9QGE83sulXdyK3dz9i3gcUusZ55y6uwTo?=
 =?us-ascii?Q?PPhTKVJcod74OahkmVs4nty0MzQFzANoEOz+l68xy02s0Pnl1cIX9bzLr96K?=
 =?us-ascii?Q?XI9TkE4m8zUyc8K4PkVF256LkSQMVTupr6uDACxoZhh/j65DAEeUjIob/vu4?=
 =?us-ascii?Q?YheJ1ni9aXEZmP7R5kQUTh6ZADca52csH/vVF75Udff9SuLHJusEoSLgeRj/?=
 =?us-ascii?Q?a6fJobirCbUS4X+spblY8EUEs8U4nASUYocuHKMSC6ed07XeT5Rxho7d//Cg?=
 =?us-ascii?Q?4gFpcFmd/dk6usws5YcXpk78iIo25XeB1hCo4UF1Qkn31wZakqRt6jHfOdGh?=
 =?us-ascii?Q?V00tI1dZSlzBbwlUMswvHDuPcwV31ZirVlKfLv3YV3FmiuwpFrpD9zj44CFW?=
 =?us-ascii?Q?wi/jIOJdjhyBYiPjyFZpfM1IWBFvGhftLM0FtItpPDPtfBvzhX7SY2DekZOq?=
 =?us-ascii?Q?FYsvSozNauWv/5K7lbQbn3aT3TeKWdS7KJd/VkwWyIfTCzjwohOxZItmhg0h?=
 =?us-ascii?Q?tBl76TgTgfkviE4YspmHkZ2wpqrqizE/ASyM4zUthtnjRs65aaFSU7H52vcw?=
 =?us-ascii?Q?l7jo6IETqpPeX2J3W0JtfzJIRXpqqYbq6ohnKthounJmi2WoHvEBpTv9NS2N?=
 =?us-ascii?Q?jlB/+5/lNY80tPwnmFr7EY9T0ic2ZcAo/26IIejNAWyjOAXs85dmWHQLUxik?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bfd0af-e98f-4af4-fdc4-08db9868c2f2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 23:39:51.9432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ethbMfixu0BUsgO19ldm3P4LznuWyvE8sXq42GfkS9caUdlszPuwIYCKGemyJWRCfa2IJ2hdl3hcqC7ohnm0dPJa4xmX+j9EDrBaofGo/0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/7] drm/xe: Code cleanup
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 06:05:40PM +0300, Jani Nikula wrote:
>On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Tue, Aug 08, 2023 at 01:47:50PM +0300, Jani Nikula wrote:
>>>On Mon, 17 Jul 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> On Thu, Jul 13, 2023 at 04:33:52PM -0400, Rodrigo Vivi wrote:
>>>>>On Thu, Jul 13, 2023 at 03:06:04PM +0000, Francois Dugast wrote:
>>>>>> Fix minor typos and reduce ERRORs reported by checkpatch.pl from 95 to 22.
>>>>>
>>>>>I wonder if we should do this with !fixup patches...
>>>>
>>>> I think that would be a nightmare to thread through the conflicts.
>>>
>>>For display it's a nightmare we have to plunge through. And this just
>>>made it worse.
>>
>> This is automatically resolved when we move display up in the branch
>> though.  "Automatically" meaning that the pour sould doing the rebase
>> has to resolve the conflicts. I don't like doing it, but what's the
>> alternative? Last rebase I did a "squash-heavy approach" because moving
>> display up means some commits don't make sense anymore, even if they
>> apply correctly.  Those coding style changes would just be squashed in
>> the respective commits.
>
>Squashing is easy if you have respective commits with 1:1 mapping, but
>if you have one commit fixing multiple commits, it gets tricky.

no, what I meant is that I turned 10 or so commits into 1 squash to the
"Add display".  Simply because after moving them up in the branch they
don't make much sense anymore and just make it difficult to land
refactors like this on top. It's a nightmare to keep in the long run
that I should rather avoid. IMO it was fine for a few weeks, but not for
the several months we are in this situation.

Lucas De Marchi
