Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CB0C77B6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 15:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DDC10E110;
	Fri, 14 Apr 2023 15:05:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F7D10E110
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681484706; x=1713020706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NlTv/ry1lISq3UUUuy3ac8mB7hvUiiN/Hptm4cihnnU=;
 b=cdP7p+Bz7FFWPTY95IhhjqWvpiQmws7LK9bHe3n9WTHrCfycy2VDiWNe
 F+MzaU2WIEprmpm1Hq79B3Q9eqbgbW83bPSaK09Vv+1X0jhirr7QkbWdq
 O6KxJRRyToqxwv1Mfh+VcvYvq1VcydrHta+AtbA572KVCOZ6TZl/XDLy5
 7UCsazDacl9szAj+aqta5gsjl7ZxEllLR48oYpWGHGh0K4QSnU4NuRqab
 mwJFPiKrmfNxQI4Z2ZHpKuTEzQ7iJdn+rJUMedxcGxHtXVywKO3Sfr5G2
 ceIt4lJGt7KCm0C/OfklAihUybEcScaRZ+vjZH7kbBXe9qhvakssveKrk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324112044"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="324112044"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 08:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="801227426"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="801227426"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2023 08:03:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 08:03:09 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 08:03:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 08:03:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 08:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrGH5svaaIAuHNErCpy2k1wSjaAbXTJ0NA8c4hlT6+okns2WlVShXNeQ8fiE2aXDLUh/u8Eqs4VQo7gcBjPYL+6HrMYoxjDScRHOZ3xDSEbJ49ovRzVfQH799BYIIdZEyb+3HRPVPgbtJMRXGXTVmpF0JIiEgWlMp5PJtxOQan5R7d7N2/lS6hy4QqTXynsdbPUDrXWzXtOGkS0kxaMm3h+Yc/RV556CCTbd8MYbCiuDbQFgScxqNFFISs0g3d9gwvgphPH6hZSzecLpgSKmVBS/4Inc48Kxnda4CNlywY2mVkFB1dwGRzm0ykWaBGSSFtvmn23K0BxC5zb4CBjdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pasRGCIPRrKxQ314TnBtaNt5LI/4emtl7D3SSHyVu4M=;
 b=cAg/BxAr2ckUond2t04scoK1rKDhPP32FsYi4xnLS9oEwKuB+IyaqO13dpZ3ULx8N7Q6w4gLSBCKcQsb5qUjdDFuSrbbr8XnaHutdl0GOxcGgV0rxkvnL8c4BcfaM7CdA9owLVlSwtM1jI+okzx7PXq7BWoEtTZZQQqnuD1o/Y3T/M4nWNce+OLwj6rrnIUXV97aaAQSY1WP2G0I0xzMXyq/R9+5TtqoiqbYHO1fCZZ81uVvXCFWSttS8IzNrD/6a9jG7H1UyIkyXpeAhKtB5C0qAJX+8O7UVsDeohvT2BOZeOMDkyL7Pco0iicL1LZY27FQxLs94pDzZIAhal8KfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 15:03:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 15:03:06 +0000
Date: Fri, 14 Apr 2023 08:03:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <wlguffke7h6r5rvft4cwctcr3ckd7taez6j35iqdjoxporbfl3@7o734ydmlx62>
References: <20230412082054.3314568-1-lucas.demarchi@intel.com>
 <ZDllBWhXoZGag1EM@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZDllBWhXoZGag1EM@intel.com>
X-ClientProxiedBy: SJ0PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: 901b3f6c-107b-4657-d74a-08db3cf95a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hm9TzvBBxoRkNLYGkKm3aS7nHcK4hh9mN+KgihdfNrtOdbGmFdlovLjy1yFfA42OsDONyhLC/oZV0BaBWmOXC0xTUs1fbe2P7cslQdNQDxG+47fDs7tYX6MaWcpLcKRn1HNUkMD4ZFsgSHQ2XNi01udZNsG7pDJ7po81yZMwpkvxwpUDmxAW3rcG3njYv9+ukYpa1HbHN3WLn5EeQxDvFjbvqWNFilqmVo9FrPgnZhCbkCzw6Cu3sZgh1P6FFDmFkx/bMi8ThmSr6S36Q3QVkdKXKEEZZToGhJOoq0a0gNqq1BOjWGMda+zwTY9mtvTWIsZjsGxzC053km0moLcS4U7WvnZcZvnWhj9PpcfLR3r/zfvAzUK8BlrmB2Tya904eDYIydwyETulcJWR2dX0fcVhEIXnr7QnmuvgkrfRU6cetnaB7QsYwrajhGqfToQXCotHcnHCqFE9e75K7r0R9u9hYRiEy6NHseBTvHvXX1O9xT3gImqr+Otix9lEWlfQXPpFyRrwkiJBVzy8PzwgEKCNbh297pJfpVxJDdL7zav2w8wDsSE6e4Y+aIrQYXyC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199021)(6862004)(8936002)(8676002)(66946007)(41300700001)(86362001)(2906002)(4326008)(6636002)(66556008)(66476007)(82960400001)(316002)(5660300002)(54906003)(478600001)(66899021)(38100700002)(6486002)(6666004)(33716001)(6512007)(83380400001)(26005)(9686003)(186003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Dyp2ocH8ICIjldrtSl5NVMgjy0fbehQskUP1G2j7ccAR4fK0Foe43xKM6Zn?=
 =?us-ascii?Q?9cC80yHAlXpMXNoLIeFjwc4jF8uSr0SA6BEasPS0wbBaIw3pYfWyktsgSF7m?=
 =?us-ascii?Q?0JEdTgXwcBWgZFW1uLXaxa/hZo74rB5gmYspHcXnCWhsANzt6xfVfkOHtic/?=
 =?us-ascii?Q?ZtoPBvEW22WaT8iLkS61gA7i7JbNbnKkERI3pMJMBbCbcBk5VadQBnL2sO92?=
 =?us-ascii?Q?AGquIJl5VJuiEJytuVAO/M7qv201pCkmlS4r/k4ByVPuoSKNrkR2Cxzu+kKh?=
 =?us-ascii?Q?7kcJ8DLh8eH6xdLzo6RnxSnjtT4fthH9gwAq3U9olFLhkiwIDoeEcp9OBelM?=
 =?us-ascii?Q?EUhdQYk9JML+YxdgyZvfpuDRgVudiTJyzj37qczxnbYr4pFYb3IPpoSQdJeg?=
 =?us-ascii?Q?s3woB8uDUYCX/HZgcByt07eC+VSVJtX+M5csFN6iQ8JoxLGLRd6u1kH+uX68?=
 =?us-ascii?Q?cBuAyfNlGArHlgZb/MNCRSCVPd5vzpA99wHsTUyRYOPGNHAYYj6klrqAr2qj?=
 =?us-ascii?Q?PN2aVvm/GxwE2nJGrKs+s9T1gyVuzJJO+ws4w4c7nilalBViDTl5e5pBrx3B?=
 =?us-ascii?Q?RSoz26YW9o5hlOAY1WrioguC3UQqbeWwrYxP+rTq93AcLkjJTFH9ExX/X3Py?=
 =?us-ascii?Q?Ng22UD5wGf9rKVu24Omy1Re5Od/G8dFNodADxW7Sczkvtfsa3YR5Yqftu4ld?=
 =?us-ascii?Q?J2yeP9WP+Nfc8gYg0IctdYVL1dE2fJBXjQuTJAKFKPhNoNX667XLeJq28n3Y?=
 =?us-ascii?Q?olj0pvIHaLA8Iq8o2VqnZuqPNjfjGSwsq8ARhOzbkZgPj/kZf5p5EwNMzznH?=
 =?us-ascii?Q?gQ+DqN+WhtWdnn2uJmdxCBiux6rwG7G42BTpy914IQD8NXPI8t9uA2ewnQ4x?=
 =?us-ascii?Q?H8qU1lvdVhoXj9rrAsdWale1wLRwPwd4AxR+Y7aca4arcFVE1DRGb3WVvHIx?=
 =?us-ascii?Q?7cjop5gTjo+Cko0gvlZ6grAxbFxctz9h0hDWwb99cicb0rBg+OKO2A7epJB0?=
 =?us-ascii?Q?gdRw/zODbv0s1rqfmXMO8szpYt/IV1vFfpsmByzSRIHfu21o6pbBzw/M/lbJ?=
 =?us-ascii?Q?pvZ1ADa1Dq9v9gAcCUlA8MefQ66rKpl8/8b0d1szYPr0e/cK1B0eKG/qkCbl?=
 =?us-ascii?Q?u8/90pBiP97251bHOVt9YX1UbsqWmVdQdpQBzKyNEbrpYJVaO0yc0oJcGjxb?=
 =?us-ascii?Q?YAGdmY4g/bpfrwsEtUDXjaHEQljs92DnjyuQzRnsYpspUaKjBBj+0wImJ1zw?=
 =?us-ascii?Q?kZUVbjv+8dFQxQeb9L4p00yFtDzz/iAcgrYTRTHbt2o9tEbFYh6gldhsAcdC?=
 =?us-ascii?Q?DYoHfLcinWzrRcbKIRUgD+qY49MeSyVwWNzf9zNqDndc+zIzUmKMHHq7xoYq?=
 =?us-ascii?Q?ndcTqxNON0OzzNa2QwWcXYuoWL4NEanz1AoDS4MXpnOh8tQnvvBOnINkAp+X?=
 =?us-ascii?Q?cSylRFzawrXKM5i4B+F8TOhqNMvpHIIjIyC/9S4guQ7kjVhRnz34Z9aX873Q?=
 =?us-ascii?Q?Q13OlaON5apQzXO2zfqrOeaX8+rVu7JCRzOLGORJWtH2rBR0973sENJpbW9V?=
 =?us-ascii?Q?3zkHhVUOo3fHhSnKzWQoCIsHqWQ6Pk8pzxEzAtGGEFLMLGvTQv40u4LxlkFo?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 901b3f6c-107b-4657-d74a-08db3cf95a5f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 15:03:06.6359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loGcQ3xWUTyrHvR0LE/kDrhch/OzCFaYunpGEVGgZ/gt3H2J6qS/hH/w4l589NYArNz1U1z1wC8eYYYhKoP1ILBl8i5NIn83Xt+TOc1SS3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 0/2] Dump + OOB workarounds
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 10:36:53AM -0400, Rodrigo Vivi wrote:
>On Wed, Apr 12, 2023 at 01:20:52AM -0700, Lucas De Marchi wrote:
>> This is 2 RFCs in one, since they are more or less related.
>>
>> PATCH #1) Dump the "driver workaround database" to check what are the
>> workarounds implemented. This is useful when checking against the spec
>> what workarounds are implemented in the driver.  This can later be
>> extended to mark what are the "active" workarounds on the current
>> platform.  I think this second scenario is more useful for the debugfs
>> usage.
>
>It is actually useful for the w/a assessment to know if the wa is
>already known and implemented by the driver.
>
>But for this use case in particular, this information without the
>platform that it is 'active' is kind of useless...

yeah... I think will drop the "all known WAs by the driver" from
debugfs. Printing just the active ones are the useful thing for "live"
checks.

>I would continue to use git-grep for that while we don't show the
>platform info.
>
>But thinking about other cases I also believe this is not that useful
>without the active platform information.

agreed. My idea now would be to:

a) move engine/gt/lrc WAs to special sections:
".rodata.xe_wa_{gt,engine,lrc}".  This makes it easier for external
tools to parse the .ko

b) Change this implementation so the condition is an rtp rule

	XE_WA(xe, <name>, <rtp-rules>, <action-statements>);

I'm leaning towards evaluating the rtp-rules where it's called rather
than on initialization since it's simpler. Once we have all of them
converted, switching to evaluation on probe-only would be easy.

The advantage with evaluating it on probe time is that we can then
report more easily what are the active WAs since we don't need to rely
on having crossed that code path.

>
>>
>> Other alternatives I have considered:
>> a) Reuse the kunit infra; with this it's possible to easily fake a
>> platform and get what are the WAs considered "active" for a platform.
>> This is nice because it doesn't need to run on real hardware. However
>> this may be abusing what the kunit is for
>
>First I also thought this was an abuse... but if you think on validation
>and we have some way to cross check some expected table against the
>implemented/active one then you might build a case.

After implementing the intel-gfx-fw-info, I think we have a more viable
path just moving the WAs to special sections as above and having a
dedicated tool for that. The sync issue between script and kernel
regardig the struct layout can be easily solved by having the tool
itself in the kernel repo.

>
>>
>> b) Just write a tool in C or python that parses the section from
>> the .ko and output the info need. Drawback is keeping in sync the
>> declarations from xe_rtp with this additional tool. And probably also
>> that it'd need to process the rules by itself.
>
>why from the .ko and not a grep in the code then?

you can't have a tool to reason on the WA - you will only know "is WA x
implemented?". And have to deal with false positives like
"TODO: remove this when Wa_xxxxx is implemented"

>
>>
>> PATCH #2) "out-of-band" workarounds, i.e. those that are sprinkled
>> around the driver. In the implementation here I tried to keep the caller
>> similar to what it was before. With the addition of XE_WA() the caller
>> "registers" the workaround so later we can access it. As example I
>> converted 1 place in xe_guc.c to use that.
>
>I liked that XE_WA declaration.
>
>We could even have some tool that also checks if all the XE_WA declarations
>are indeed the lineage number and not some random hsd number.

yep. My *current* plan (may change next week ;)) is implementing that
additional tool.

>
>>
>> Note: The "condition" is checked each time it goes through that code
>> path.  I was debating the ability to just re-use XE_RTP_RULE() instead
>> since it appears all the conditions can be translated to rules.
>> Consider this the alternative (a).
>>
>> After writing the commit message for that patch I thought: but if we can
>> transform those conditions in rules, we could very well keep them in an
>> additional table in xe_wa.c, which is the alternative below:
>>
>> b) keep an additional table in xe_wa.c whose action is to set a
>> bit/byte(?)  in  xe->active_oob_workarounds[]. During probe
>> the rules are processed and the ones active are marked in that array.
>> The extra section created by XE_WA() is then used to just map
>> the WA to the index value. Then the callers would only need something
>> like `if (XE_WA(xe, "XXXXXX") { ... } ` since the condition would be
>> executed once on init.  However I'm thinking that this may not scale to
>> all workarounds we may have.
>
>I like this idea and I believe that it does scale... It also helps
>to push back on big ugly workarounds that doesn't fit in this.

Thanks,  it seems we are converging on a final solution...

Lucas De Marchi

>
>>
>> Thoughts?
>>
>> thanks
>> Lucas De Marchi
>>
>> Lucas De Marchi (2):
>>   drm/xe: Add debugfs to dump all known workarounds
>>   drm/xe: Register OOB workarounds
>>
>>  drivers/gpu/drm/xe/Makefile       |  2 ++
>>  drivers/gpu/drm/xe/xe.lds         |  8 +++++++
>>  drivers/gpu/drm/xe/xe_debugfs.c   | 12 ++++++++++
>>  drivers/gpu/drm/xe/xe_guc.c       |  6 ++---
>>  drivers/gpu/drm/xe/xe_rtp_types.h |  8 +++++++
>>  drivers/gpu/drm/xe/xe_wa.c        | 38 +++++++++++++++++++++++++++++--
>>  drivers/gpu/drm/xe/xe_wa.h        | 14 ++++++++++++
>>  7 files changed, 83 insertions(+), 5 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe.lds
>>
>> --
>> 2.39.0
>>
