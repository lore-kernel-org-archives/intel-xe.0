Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5525C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 22 Mar 2023 13:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6197A10E10C;
	Wed, 22 Mar 2023 13:29:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4310E10C
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Mar 2023 13:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679491753; x=1711027753;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6CRR3EZwhpm94TGB/rojD03VDVWeoDjp3ZvmatT+fgw=;
 b=KkSWLwubafCUHLVebFS7/UNZzU9rhrUg1mBNqGhwuVV45YH9pzk7OYX4
 If4SZV43ndOTM0e3bx7Hsqb4H0gc6tBlh2eJ1/RMDPYm7o7q/ca85MWha
 i+R6Wugqt6KBcYlxTXmj5BvIXLncjT5HDHekir1by+7aXeS0NyuMB/2+E
 IqMje7ebKjH5OlFDl/PJI33Xv5A/3ZLfZVZ+gm2i1+tV6HwDR0lwzj58V
 AL3oQof7wbQ744BgJtkJY8QSk13rgXd/Z8EkYhkDT/wvMnpGojK1cudse
 JjveTDeQKQ64pxnUvC8MX+d/UXcKz5QhmOXP3VbO5hKUo3sPV0+7MVXFk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="401780472"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="401780472"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="712206119"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="712206119"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2023 06:28:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 06:28:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 06:28:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 06:28:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBCE/CYdxfkdF5S0Uqdc+10C52Y3FtrvbcEAFt59lvEmfaLUexscsA0ODHbMRmil8TTENXJqOzoZSqvpCyGJHFApPNjqZ53CdGfk8LPmlOXt3zj8Sx6CY2Wf4ML1qJZ/EPOMf2oACrbhBD0/Lsw+BqHavuPq1hxbBIEldUGZiuYvq7nPlM9VEOewp5+OjVbDHjr5+IW8fIodZ9bp6OxZP10OR2r4Gazf+7LaW/4aABoIffKT5lRo16fumU8/EFo8f4WrdLQfJMJp2/gw/Z+VXJwR++tWbzQoGAd8yH1lu9o8cE0MbnDeNfMNkN1n0eFIuKMM0cfzZxZLUpbzqi1aTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPLBjIIiitb8Nk08vUd/63HowfPyr+qPeEneofZbM+M=;
 b=FwYGxpWdTrNZ7tW3+U6Pz6UFD4F01rkNp5cX+2E6T/7VP//frqoq20k/HNfJVxAt/RgnuOuLmiTU/a4jLtTOFVW5wiVnyBUNA41uHfBAxfU2swWvFgbdm8FjTKqkRoGDDmEA4GUdgTkSTxokHcRHBHNg8mhGBO6N/8ha3S554vdwZEirlV2nmpPKBlvFxGJcj80kUpJgFy6SZfl3XuZW7u26iaUIUq6cZAZlIAN/zQsw9O/+RLviv52iBJG34xvy/5J4qCi/qUL3aCK70g0KWGx5kCvdYZdBNl3S7PxCh/SK/CViiBv8s4eBvQIQAJgwSHB9+/7bGlwkyMzFiJW88A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 13:28:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 13:28:47 +0000
Date: Wed, 22 Mar 2023 06:28:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <20230322132841.o7ptwildnnykj4kr@ldmartin-desk2.lan>
References: <20230321160420.1352889-1-jani.nikula@intel.com>
 <87v8iu6qc1.fsf@intel.com> <87sfdy6q9k.fsf@intel.com>
 <20230321230448.rkgnfemrg4ehwfat@ldmartin-desk2.lan>
 <87pm916tba.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pm916tba.fsf@intel.com>
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 275f8ed5-e7dd-428b-0c4b-08db2ad95d76
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Jt82TKQQa2TNK9JaC1mD+k88xAGm/fJNnd2FJ4AnP9jSuOLdGqBLjiuX7ak6/orlQqG71i7mrufURPMeTyuFU6jXNONq82+PT0V96SWKZyt2yAe8Ut55criOq0C0WPIeIlCLoKAAiIVfxQ3JWBLwr+ogd2OWT8YSqtHQ7esp+JEhPYD58mM8WxSIl+PuEPTUXo2UvlrNt9uElvBLbUNhdXHpwq4xgHhDyvmRztDlRhd/iuDtGkhAWfJ4D3iV0ak3b8ZvIMZD/777re5Wsv96ar7pLL64VFpbtKi477GSFAFsttyBvSimy96F7KJuDRys2+imHx5v3OsynGrAejLMDLRwgs0WaxvHec24xVk91LP0l86etv3g6jT6Q/ZkEXQnKjS5oNOMFekq6t4P9jvZB5z2eAg08VQuMvcjThiK/fqNhh94Yx5oJV29UYQtnlc6WvbDH5yRYa6BjsQ9TYeNIoHyZ71hzouHSetk4OVkANb/dGAtpoVbh40Bz1MtnGzK2AvNXYqfT2SXdaVpPg3jrdLME77in3uejgUL7rG1SgfL4ywLBhRybXEk64E20HkLeceJDoGYfeFXx04Mh6gAjijMHyxxgnYRPLLSv5htjE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199018)(6506007)(9686003)(966005)(6486002)(478600001)(83380400001)(6666004)(6636002)(8676002)(316002)(66946007)(6512007)(66476007)(66556008)(186003)(26005)(66574015)(4326008)(1076003)(30864003)(8936002)(41300700001)(6862004)(5660300002)(82960400001)(2906002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wagOEdpTha2dR62RdUAS3gn6nSwH8tOEik2s3ymQiZR1K5gyQcjqaZjREq?=
 =?iso-8859-1?Q?1ZYzPy54iklW4gfl6PdkfqyVDTbL+VQ2wLER1CxWijbvkJ1R1pv00CYR20?=
 =?iso-8859-1?Q?XNPYrLK2x8ShgaGRo8+6Kz18NMDifrZW4VBQpDRuh1i2W4pjuTgLZ2aGJ0?=
 =?iso-8859-1?Q?1u3MXHzwuMoJxUrafqvFoB0VKEUBFpVqIPf2Q79qTxpCdurgSbe4F5rBEu?=
 =?iso-8859-1?Q?6UtWQmnW7W+LoTKkirIKzeF6I2nj21kPSyOQ/dt18T2xZHqf3MBgEABtuC?=
 =?iso-8859-1?Q?M8gBsMnj1FHnP2ybQa+MJ5caDcXbpNnFc4h0tb2keU9mJkNUpDeqGv97q9?=
 =?iso-8859-1?Q?fmZCBxqnczdTaQK09+64m9sKiKv5zKPoA+mSaI+TceVR41gj5QovrIXt5o?=
 =?iso-8859-1?Q?XoR2s+q6ACN0YnrHoXO+voH4v8JC7YL2BJE0OWdIDBxVt0WMsTxwfNbpxn?=
 =?iso-8859-1?Q?kCSY/e5TyzCoAhZQWFgURE+IBlaC5do1Z4PidIbqXGysnhXcGOc0Y74g+5?=
 =?iso-8859-1?Q?p878S1kS5CfFpUU6uf4Wdj80NzENTvxYk47YnxILK0iJcd68wPue6zx4HP?=
 =?iso-8859-1?Q?5L4mbfXUC1okIFIW/eE4ryycRmNS9QzD8Evn7H8Ycejwr6d+N8tGBURoUN?=
 =?iso-8859-1?Q?Fs37AVAo/qInHfuZfV1U7cXhvljDhrhjVOE3ih6kkp6gexGTdbjYiRms1C?=
 =?iso-8859-1?Q?aIpdMGXTQz6sU99F9Jjwy/8fdNpjFnuUXhLKTTAOxc5a66kF2AWApoJxDR?=
 =?iso-8859-1?Q?QNA1OATndeos/7qRUt7kxAiLy6YC1PuKs28gXXmOKe4vfGlmcvNnwOWF9l?=
 =?iso-8859-1?Q?9Lo/lod5557Gy7QOLp66+qsSpVzYF9rAMcSWoN1HTXqZXKWNpnF42vVJkT?=
 =?iso-8859-1?Q?EqjT6gVxpPLd518nkY6ieI1jXwO45Ff4kKxwF2rirP+g6MVHhRNopyujhL?=
 =?iso-8859-1?Q?G8AYGYA9cjt1Tb0G7DaONen1EfcYV7a75lmy1pE6/fJ1lnBulyUEBTtzpE?=
 =?iso-8859-1?Q?m4adF22lrLzvOeuGhvhB2Wn7WU7vBLrTu5uUV2NAvJM1WlTkTg1NLf3wQs?=
 =?iso-8859-1?Q?aMkjAAlVAVzutyp4qHc//TzuibojX1ufxmK8oTV578sDtE41vaH6ojcynG?=
 =?iso-8859-1?Q?uxwftRILnzgqKTTqUnVge8lx+kNVlRkDuwMstk/W8E9aRFYYjAOS7ZR85H?=
 =?iso-8859-1?Q?SY3PRmgRcT1n1gzcxS/CCmlIanbSScOHLKy+GtrH+EKQGIr+1FaUvDmDpi?=
 =?iso-8859-1?Q?5PzL/PuOR6DWYGi00CoWPsaC5Y3EriS7ruWBXjWUjhWke3FPh/5WNBU1GI?=
 =?iso-8859-1?Q?TYPNH+lzVZwDoE/eTqZMrjAZaVlB/vjdC3/k2FRO6gYjJnEdm2PoqcWUEb?=
 =?iso-8859-1?Q?AN0pQtC2QqB8xzkkbJZQ2a6Wy59QWEoHmTXb8r+5S/IJL4x0KCT2SxjxB1?=
 =?iso-8859-1?Q?GkeRbrEmmSnFUvmdJok1UoE7EqmY9PaA7aPwL+cYFCw6NMq4Z8di0rmRuH?=
 =?iso-8859-1?Q?Sq2JKuFr8Q0heiWMyjT2SvugC6Xr2Nz580bjpQEZRNpMWmKkfDFDjmlK5f?=
 =?iso-8859-1?Q?xsZT4nXAeIVd1JDodkEAoRx04C0s58yHgU455GxwIr9GZoZuPadWculNUK?=
 =?iso-8859-1?Q?JM+m5YzIQsWK51aLP2s8zrcHvOfSWwxlNMcCjcey3gcpjfNSWzuG30zQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 275f8ed5-e7dd-428b-0c4b-08db2ad95d76
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 13:28:46.9843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PMDFVFJ/2YvOkd9iZejYm17Mb12jiriZFzOCOyfTTMo8FLw9PBqNBT6KLZBIT9D7DzYSSpi3+yu2qw+GHe/4RBxB8ek9U5T372WdDFxEzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/i915/rps: split out display rps parts to
 a separate file
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
Cc: intel-xe@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 11:15:05AM +0200, Jani Nikula wrote:
>On Tue, 21 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Tue, Mar 21, 2023 at 06:08:39PM +0200, Jani Nikula wrote:
>>>On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>> On Tue, 21 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>>>>> Split out the RPS parts so they can be conditionally compiled out later.
>>>>>
>>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>>> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>> Link: https://patchwork.freedesktop.org/patch/msgid/20230302164936.3034161-1-jani.nikula@intel.com
>>>>> (cherry picked from commit 6dbbff25b39565c801c87379bc85933fb436518e)
>>>>>
>>>>> ---
>>>>>
>>>>> Here's an example of an upstream i915 commit that can help clean up
>>>>> cherry-pick as well as cleanup of the #ifdefs in one go, otherwise it
>>>>> breaks bisect.
>>>>
>>>> *sigh* I had something more here, but having #ifdef first on a line
>>>> dropped it as comments, and turned it into nonsense.
>>>>
>>>> It's a backport of upstream i915 commit to help clean up #ifdefs, but
>>>> how do we want to handle them?
>>>
>>>Moreover, even if we're stalling with adding such #ifdefs to upstream
>>>i915 now, we can however clean up existing usage in the xe branch to be
>>>more suitable for upstream. For example, I'd take the #ifdefs here
>>>pretty much without issues.
>>
>> instead of a cherry-pick + squashed-ifdef-removal I think it's better
>> to do:
>>
>> 1) cherry-pick
>> 2) remove ifdefs and commit with
>>
>> 	git commit -s --fixup=38a139546384
>>
>>    ... or whatever commit added them (there are a few before that commit
>>    above)
>
>Even if that results in a broken build for a commit?

yes, I guess we don't have many options. Better stick to the one that
can produce a clean result at the end

>I also have i915 patches locally that I think are probably fine upstream
>*with* the xe submission, but not standalone. They clean up #ifdefs. The
>trouble is, they often break the build on top of drm-xe-next, unless I
>also fix the commit adding #ifdefs. And in a rebase, they should go
>*before* 38a139546384.
>
>Here's a good example: https://paste.debian.net/1274882/
>
>That commit should go before 38a139546384, with -DI915=1 added to i915
>build, but it also touches xe to keep building properly.

I guess the option is to state that in the commit message.
Maybe hacking a git command

	git commit -a --fixup=38a139546384^

and then make sure the commit says something about NOFIXUP. So whoever
is rebasing knows this is about a commit move only. I can type a script
to change the rebase.todo automatically to do that if needed.
Maybe git would be open to accept the logic for a `git commit
--fixup=[move-after|move-before]:`

>Here, I admit a git-pile setup would help this part of the job.
>
>> The reason is that I don't think we will be able to avoid 1 more rebase
>> before being merged upstream.  We can't do merge-approach neither
>> because of these commits we don't really want to ever show up in
>> upstream (and because we are on top of drm-tip rather than e.g.
>> drm-next). So doing the above at least makes a rebase more bearable:
>
>I thought the rebase was going to be on v6.2, I argued for basing on
>drm-intel-next, but it ended up being on drm-tip after all. I was kind
>of surprised.

I still prefer it on <release-tag>  or at the most drm-next. But does it
matter much if we still keep these commits that can't go as-is upstream?
If we didn't have them we could simply have a merge approach and be on
a <release-tag>, which would be much simpler.

Lucas De Marchi

>
>> Whenever we do a rebase (with --autosquash) the cherry-pick should
>> automatically be dropped by git and the fixup should automatically remove
>> the addition of the ifdefs in the commit that added them.
>
>If only there was a way to tell git rebase how to reorder the
>patches. That would be needed for the ones that aren't upstream.
>
>BR,
>Jani.
>
>
>>
>> Lucas De Marchi
>>
>>>
>>>BR,
>>>Jani.
>>>
>>>
>>>>
>>>>
>>>>> ---
>>>>>  drivers/gpu/drm/i915/Makefile                 |  1 +
>>>>>  .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++-----------------
>>>>>  .../gpu/drm/i915/display/intel_display_rps.c  | 81 ++++++++++++++++++
>>>>>  .../gpu/drm/i915/display/intel_display_rps.h  | 34 ++++++++
>>>>>  4 files changed, 123 insertions(+), 78 deletions(-)
>>>>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.c
>>>>>  create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>>>> index ae9259ab3261..f689132e1506 100644
>>>>> --- a/drivers/gpu/drm/i915/Makefile
>>>>> +++ b/drivers/gpu/drm/i915/Makefile
>>>>> @@ -239,6 +239,7 @@ i915-y += \
>>>>>  	display/intel_display_power.o \
>>>>>  	display/intel_display_power_map.o \
>>>>>  	display/intel_display_power_well.o \
>>>>> +	display/intel_display_rps.o \
>>>>>  	display/intel_dmc.o \
>>>>>  	display/intel_dpio_phy.o \
>>>>>  	display/intel_dpll.o \
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>>> index 3d37f44ec835..e666a5c1fd91 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
>>>>> @@ -34,13 +34,10 @@
>>>>>  #include <drm/drm_atomic_helper.h>
>>>>>  #include <drm/drm_fourcc.h>
>>>>>
>>>>> -#ifdef I915
>>>>> -#include "gt/intel_rps.h"
>>>>> -#endif
>>>>> -
>>>>>  #include "i915_config.h"
>>>>>  #include "intel_atomic_plane.h"
>>>>>  #include "intel_cdclk.h"
>>>>> +#include "intel_display_rps.h"
>>>>>  #include "intel_display_trace.h"
>>>>>  #include "intel_display_types.h"
>>>>>  #include "intel_fb.h"
>>>>> @@ -951,66 +948,6 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
>>>>>  	return 0;
>>>>>  }
>>>>>
>>>>> -#ifdef I915
>>>>> -struct wait_rps_boost {
>>>>> -	struct wait_queue_entry wait;
>>>>> -
>>>>> -	struct drm_crtc *crtc;
>>>>> -	struct i915_request *request;
>>>>> -};
>>>>> -
>>>>> -static int do_rps_boost(struct wait_queue_entry *_wait,
>>>>> -			unsigned mode, int sync, void *key)
>>>>> -{
>>>>> -	struct wait_rps_boost *wait = container_of(_wait, typeof(*wait), wait);
>>>>> -	struct i915_request *rq = wait->request;
>>>>> -
>>>>> -	/*
>>>>> -	 * If we missed the vblank, but the request is already running it
>>>>> -	 * is reasonable to assume that it will complete before the next
>>>>> -	 * vblank without our intervention, so leave RPS alone.
>>>>> -	 */
>>>>> -	if (!i915_request_started(rq))
>>>>> -		intel_rps_boost(rq);
>>>>> -	i915_request_put(rq);
>>>>> -
>>>>> -	drm_crtc_vblank_put(wait->crtc);
>>>>> -
>>>>> -	list_del(&wait->wait.entry);
>>>>> -	kfree(wait);
>>>>> -	return 1;
>>>>> -}
>>>>> -
>>>>> -static void add_rps_boost_after_vblank(struct drm_crtc *crtc,
>>>>> -				       struct dma_fence *fence)
>>>>> -{
>>>>> -	struct wait_rps_boost *wait;
>>>>> -
>>>>> -	if (!dma_fence_is_i915(fence))
>>>>> -		return;
>>>>> -
>>>>> -	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
>>>>> -		return;
>>>>> -
>>>>> -	if (drm_crtc_vblank_get(crtc))
>>>>> -		return;
>>>>> -
>>>>> -	wait = kmalloc(sizeof(*wait), GFP_KERNEL);
>>>>> -	if (!wait) {
>>>>> -		drm_crtc_vblank_put(crtc);
>>>>> -		return;
>>>>> -	}
>>>>> -
>>>>> -	wait->request = to_request(dma_fence_get(fence));
>>>>> -	wait->crtc = crtc;
>>>>> -
>>>>> -	wait->wait.func = do_rps_boost;
>>>>> -	wait->wait.flags = 0;
>>>>> -
>>>>> -	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
>>>>> -}
>>>>> -#endif
>>>>> -
>>>>>  /**
>>>>>   * intel_prepare_plane_fb - Prepare fb for usage on plane
>>>>>   * @_plane: drm plane to prepare for
>>>>> @@ -1102,13 +1039,13 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>>>>>  		dma_resv_iter_begin(&cursor, obj->base.resv,
>>>>>  				    DMA_RESV_USAGE_WRITE);
>>>>>  		dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>>> -			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>>>> -						   fence);
>>>>> +			intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>>>> +							     fence);
>>>>>  		}
>>>>>  		dma_resv_iter_end(&cursor);
>>>>>  	} else {
>>>>> -		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>>>> -					   new_plane_state->uapi.fence);
>>>>> +		intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
>>>>> +						     new_plane_state->uapi.fence);
>>>>>  	}
>>>>>
>>>>>  	/*
>>>>> @@ -1119,10 +1056,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
>>>>>  	 * that are not quite steady state without resorting to forcing
>>>>>  	 * maximum clocks following a vblank miss (see do_rps_boost()).
>>>>>  	 */
>>>>> -	if (!state->rps_interactive) {
>>>>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, true);
>>>>> -		state->rps_interactive = true;
>>>>> -	}
>>>>> +	intel_display_rps_mark_interactive(dev_priv, state, true);
>>>>>
>>>>>  	return 0;
>>>>>
>>>>> @@ -1159,12 +1093,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
>>>>>  	if (!obj)
>>>>>  		return;
>>>>>
>>>>> -#ifdef I915
>>>>> -	if (state->rps_interactive) {
>>>>> -		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, false);
>>>>> -		state->rps_interactive = false;
>>>>> -	}
>>>>> -#endif
>>>>> +	intel_display_rps_mark_interactive(dev_priv, state, false);
>>>>>
>>>>>  	/* Should only be called after a successful intel_prepare_plane_fb()! */
>>>>>  	intel_plane_unpin_fb(old_plane_state);
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
>>>>> new file mode 100644
>>>>> index 000000000000..918d0327169a
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
>>>>> @@ -0,0 +1,81 @@
>>>>> +// SPDX-License-Identifier: MIT
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#include <drm/drm_crtc.h>
>>>>> +#include <drm/drm_vblank.h>
>>>>> +
>>>>> +#include "gt/intel_rps.h"
>>>>> +#include "i915_drv.h"
>>>>> +#include "intel_display_rps.h"
>>>>> +#include "intel_display_types.h"
>>>>> +
>>>>> +struct wait_rps_boost {
>>>>> +	struct wait_queue_entry wait;
>>>>> +
>>>>> +	struct drm_crtc *crtc;
>>>>> +	struct i915_request *request;
>>>>> +};
>>>>> +
>>>>> +static int do_rps_boost(struct wait_queue_entry *_wait,
>>>>> +			unsigned mode, int sync, void *key)
>>>>> +{
>>>>> +	struct wait_rps_boost *wait = container_of(_wait, typeof(*wait), wait);
>>>>> +	struct i915_request *rq = wait->request;
>>>>> +
>>>>> +	/*
>>>>> +	 * If we missed the vblank, but the request is already running it
>>>>> +	 * is reasonable to assume that it will complete before the next
>>>>> +	 * vblank without our intervention, so leave RPS alone.
>>>>> +	 */
>>>>> +	if (!i915_request_started(rq))
>>>>> +		intel_rps_boost(rq);
>>>>> +	i915_request_put(rq);
>>>>> +
>>>>> +	drm_crtc_vblank_put(wait->crtc);
>>>>> +
>>>>> +	list_del(&wait->wait.entry);
>>>>> +	kfree(wait);
>>>>> +	return 1;
>>>>> +}
>>>>> +
>>>>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>>>>> +					  struct dma_fence *fence)
>>>>> +{
>>>>> +	struct wait_rps_boost *wait;
>>>>> +
>>>>> +	if (!dma_fence_is_i915(fence))
>>>>> +		return;
>>>>> +
>>>>> +	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
>>>>> +		return;
>>>>> +
>>>>> +	if (drm_crtc_vblank_get(crtc))
>>>>> +		return;
>>>>> +
>>>>> +	wait = kmalloc(sizeof(*wait), GFP_KERNEL);
>>>>> +	if (!wait) {
>>>>> +		drm_crtc_vblank_put(crtc);
>>>>> +		return;
>>>>> +	}
>>>>> +
>>>>> +	wait->request = to_request(dma_fence_get(fence));
>>>>> +	wait->crtc = crtc;
>>>>> +
>>>>> +	wait->wait.func = do_rps_boost;
>>>>> +	wait->wait.flags = 0;
>>>>> +
>>>>> +	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
>>>>> +}
>>>>> +
>>>>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>>>>> +					struct intel_atomic_state *state,
>>>>> +					bool interactive)
>>>>> +{
>>>>> +	if (state->rps_interactive == interactive)
>>>>> +		return;
>>>>> +
>>>>> +	intel_rps_mark_interactive(&to_gt(i915)->rps, interactive);
>>>>> +	state->rps_interactive = interactive;
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.h b/drivers/gpu/drm/i915/display/intel_display_rps.h
>>>>> new file mode 100644
>>>>> index 000000000000..2cfb8a303b77
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.h
>>>>> @@ -0,0 +1,34 @@
>>>>> +/* SPDX-License-Identifier: MIT */
>>>>> +/*
>>>>> + * Copyright © 2023 Intel Corporation
>>>>> + */
>>>>> +
>>>>> +#ifndef __INTEL_DISPLAY_RPS_H__
>>>>> +#define __INTEL_DISPLAY_RPS_H__
>>>>> +
>>>>> +#include <linux/types.h>
>>>>> +
>>>>> +struct dma_fence;
>>>>> +struct drm_crtc;
>>>>> +struct drm_i915_private;
>>>>> +struct intel_atomic_state;
>>>>> +
>>>>> +#ifdef I915
>>>>> +void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>>>>> +					  struct dma_fence *fence);
>>>>> +void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>>>>> +					struct intel_atomic_state *state,
>>>>> +					bool interactive);
>>>>> +#else
>>>>> +static inline void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
>>>>> +							struct dma_fence *fence)
>>>>> +{
>>>>> +}
>>>>> +static inline void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
>>>>> +						      struct intel_atomic_state *state,
>>>>> +						      bool interactive)
>>>>> +{
>>>>> +}
>>>>> +#endif
>>>>> +
>>>>> +#endif /* __INTEL_DISPLAY_RPS_H__ */
>>>
>>>--
>>>Jani Nikula, Intel Open Source Graphics Center
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
