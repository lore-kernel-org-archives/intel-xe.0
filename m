Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22019C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 18:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F213410E22A;
	Fri, 12 May 2023 18:07:22 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA9710E22A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683914840; x=1715450840;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lwAC8NE26snrOmgwYMguf6cq+D7F6c4/3ss+O4SMt8Q=;
 b=CR9uWe4qy8ODfbc1SoDt0MyHp2i2o1uUnP4eN8JLnWCx0coPb2YCyPDM
 4umOl80N3cqbDrXZY+Tf3fqz61PgJAaS1qd1wUeUwFVQhrYYkm1LHNVmd
 aw7aBLYQc1QGvOB0uYVfyJs0z8hZV3NNYO09dCsXzwZSSEcKAXDMPob/F
 +K+9D6285RMFibcHnTxbUrDXgKqBiN7bKxJew0OnT+Cgbor7WltwjQoj6
 mj3BgDIr78POXV1NZP5l93i+Pti7xtZn80KoXtuFilkmQwBpEzjTs8KgM
 DJtjsE8QFsBOnqm4sTUDgocaS0YLSYiHjRqTzW+kR1wjFb37hqo5agxga Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="414229045"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="414229045"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="700263357"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="700263357"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 12 May 2023 11:07:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 11:07:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 11:07:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 11:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZDyE6vCfis5+25bRPEZMh2w+Mvgof+x4nzo1GjP0/B5W2hCOcmxP+vZ53OWjp0dJ+HFPL9juso1nuz1yrf2Z5R4pAiW0+7EXzTfF/OFQ9tcjYDMGuySJie4/xj/Kq1GO42H1WutWkuvJCmGgtyVDgq47IXLEM8UkCulEv+5EDX9o6wLjjF2VExMzEl48TRff/VtcijJPDBgIWUCKGrwEC64Lq6wcS0zMMZ/AeNA1Nw8TQfAJYx4XypU79xeqSze+ZvJqpZRlYEvTN7k5SIpjQIc/5TuU6cc45LzhG6ozNlFQpxUhTgvnIEj0gt3XbI/S1SZeZLHgTHrozok9iBoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KphfN6ndvVDnYDzRPgM5nnJSstoEXJ/Z0SVp9bXgnQ=;
 b=J+W1FoNOeA7hHclXgf0WgIT9YCowuTm2wChUhhTzQzZxwJm/7dYzZMtnRx91Ryrfe898fp3qsZYaAFKLNiULHygZO7AYJ0nb0+qba9ArdcnW7zmgtOItf391/io8WkqHvHmxea5vGaXGTee41BCfEAACogcdjmnVj1cZHed01Q9aRrrLQj2dmq4NjM7xIkzGQa6l1xJPqCkgLxfGTbmzvWgXXjAandrqWw1KgzSaJFJmiz1Aa0hFLMzcS0Mq+fcSaBTL+dseen64Mnq02RmEhr5uoS5/K1AF2KDy8FDkwd5TLECM2OzZZ8mDHhbupfxB8iee9QWVCRNW/lzdre65UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Fri, 12 May
 2023 18:07:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.024; Fri, 12 May 2023
 18:07:17 +0000
Date: Fri, 12 May 2023 11:07:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <wvzjbfnina7cyqu63zucacs4xnkqh6mjxxhd5y6or2dcitelkc@zmrvafkwf2ka>
References: <20230510160220.714725-1-jani.nikula@intel.com>
 <fliqzlotxeedvkcickrymodhpkh7sqheqy7pgzoyrfdcpzcv7q@a25nxqhm5fbe>
 <87mt2bkpye.fsf@intel.com> <ZF5GoZIRfdHPg+2w@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZF5GoZIRfdHPg+2w@rdvivi-mobl4>
X-ClientProxiedBy: BYAPR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 90db554d-434f-4a3f-915e-08db5313b8a3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wfNj2YOkDM7kllGJokmGlAbjZ/gyw2IQ+97vOWLdnD9n6XfgK/HRMeAimBJKArrMGZ0ht5hK2AezIZM6pIgUqxUtQ9GLMPYOD8Rr1ZYV8dC6ZxX7e5IQfwpAUrk+TAxD1Y736cuM5VreczcL9kmkmuOQRHqREQrBWWUNyZozSZtyCWm7DSU4kwZ/AvX22y44S6NMa4i2WTSs/bbG+Cc71CdheGoy9f3PpAZaDJoWMArC4jwU48CGYn6VfodX6S09TBX8aqDA4i9qh2rdxjA5dukNDKLKmttWZsSUVJbA5BMtMJ6+ILF6rc1aXT7sClCnBLFGMmVPg5iv8e/oyhiwKWUSsS9P5aHcfsQRdBsAx+lO5BidFpZflr3pkrFjWyIIZeUGk95l8xxTpaV/fFMb1YW+fCmBbLFlKjFb1wg01D3bquOJm/Puyyt5iTtKaVL1faf8hQjYn8i78F1pMK/7a6hcJtN0a2H9eAhh/jPbMisZIAe9aKdWP0NDzfvJORUDQtzbGcL7+tljuMcXmRCaOF+rQ8W0XpZWJ9Bpyx+tQhmq06lazTe5ioDefbc2vBav
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199021)(66556008)(6916009)(6486002)(4326008)(66946007)(66476007)(478600001)(316002)(86362001)(6506007)(107886003)(26005)(186003)(6512007)(9686003)(8936002)(41300700001)(8676002)(5660300002)(2906002)(33716001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6SZkKxT2eXEHjsEUrimP5hPYGJyj9Cx5lg3W+m8JSvOkdrNvuVgEhBLNDTkL?=
 =?us-ascii?Q?NpkpZ+K7nJOwcBkgeN16Z1wqYYXkZvzowxFlYD5pu3ccI4WFvVwTU1vu92tq?=
 =?us-ascii?Q?ymtiyk0fvzCxE8T87jGkFRWVUG3hEND2DwsXf+0QpbfK67gH3zI5X7LPuA2J?=
 =?us-ascii?Q?bLXWWDOFBQcD7I97VXuriabYTzhLiU9HPW1jQCx2iLNbM7gns0miIX59Gsvi?=
 =?us-ascii?Q?XkkYYtO82nRHTK9OjwzupZYP3alhbYI4HvixXDwT66e9al87NhB53eaWuRrD?=
 =?us-ascii?Q?JVLrZNbiHFP3tVp9xvclZSkxwAB/cp7SbgKebEkrTi5Nn38ChH1x+/JKbCu2?=
 =?us-ascii?Q?pbXRTgVKzdCxIFfnxSSA4Ej+Bs7GDFk8LcGBvEBNunlXWWXi+tP2jlt7+ECj?=
 =?us-ascii?Q?O34i38345Yg+xCaZotTX9Jr0qrYNultnMM/aA2hcZ53bf5RukZVPqccreEGl?=
 =?us-ascii?Q?V4WrOcs4bZdi+BpXQBWMW3k3psMEHP06XxQ5NnPKptLUFdzUNclVx9KXxL8q?=
 =?us-ascii?Q?G1zoU9QImt8LklUdaSn1ESRxRVHMfEikdg77Qc+VBloCrcRpd5YZMcYCY9dK?=
 =?us-ascii?Q?J4CqZOBuXdMSb2szU5sHZEi53cSRJ9jE9FVcbY7EShyUbkMNsNhOeSSRSLnC?=
 =?us-ascii?Q?uShC41d7hLvEIw7WJROPNGtS6DefT8A20RVK3QctLQb9NBEKuJflWubipG4J?=
 =?us-ascii?Q?YJDxjUBWyNK9im24zasiZcl3um0QzolxziF03umLuDUDMTW9arAESputbMKu?=
 =?us-ascii?Q?eDL8eveQIJRCd+VuWck0fIt/rhB6Ia1ZaggAYEJyjRop+bvKWiXHg+EYXJgz?=
 =?us-ascii?Q?a4fBxBM31fdFKjlWiXzG92bcLZowq7SCa7PLnOsByTMm+ARiIP0AkpmEoWw4?=
 =?us-ascii?Q?vXJZdA0DYO/J2UT2YVqsLMcP1riKsrVoRW/TYJDVIAReT4KPb5MDWTmwEQXe?=
 =?us-ascii?Q?UwiyMHxM8RxBwROIC0bBO/X16oNeKZwHOXEpKDR05ycsF4P4lHMva5K3s4DQ?=
 =?us-ascii?Q?LR3jyGBOgvF+wPXjZRAvePzfY1xJeIpFHqZr5J5U5/Ixn4SOzDDXgtWK6WOz?=
 =?us-ascii?Q?Yfj0ooMzDNG7Z5YzWw+XMQcYUDklUNQ+VGHNKMSBrFgmdU3Jek8rSIoPLmgH?=
 =?us-ascii?Q?RmP3+fSER+jlZlFudNKnz+b9eTjYw43Py2+KNFoBcaCunXMg/gskYGD3pi66?=
 =?us-ascii?Q?5pr+1ag677a3lLFnXIjCoUFv/BsrV99QScmwlppCYygd4pWhMw9uSjNI9EQm?=
 =?us-ascii?Q?3SXWaXUjT3ugMCrntcJ1NXqUii2qZpa97IBXexHfADVRmkIUmeAfdW8jngHR?=
 =?us-ascii?Q?D3KjLruckZsukhYmd+BCA8YIhq90LYGEmyAR8mzHIycHo5ctVaC/uMtJMYYx?=
 =?us-ascii?Q?sSzvZKG+NIMMsodRdfkrxI4nfpWTCU4YhSOdBtwRwzA2NPLJUxxdcFoKOU8V?=
 =?us-ascii?Q?tUdREV2f+LJTkrwlaSaAs2KU12EJ4Ih1l7RMgnvB8TUUkagASMiMS5AU5xwt?=
 =?us-ascii?Q?PoBVxMb+CjF52igof4SaZsQvAsJd2+XCwHsaR+quEwd9pdUB5SJNHapRSWIV?=
 =?us-ascii?Q?z6ExR2QJAJfSU6chQj9Ga7/nNoZNfdhXlaLgsf+V8xrzQ+A2+UhHih6wzRH+?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90db554d-434f-4a3f-915e-08db5313b8a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 18:07:17.2211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxicRGz7tLy9e1Tl/r0mTWWaNpoa8aFc+USKpAHj3dwIORDGIQmUrQLsmn1KE+N+LhQHa8lTt5R1B7TZD0bREuurwZqutEA/N0RkdqH2p1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/display: Add intel_pps support
 too
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 10:01:05AM -0400, Rodrigo Vivi wrote:
>On Thu, May 11, 2023 at 03:33:29PM +0300, Jani Nikula wrote:
>> On Wed, 10 May 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> > On Wed, May 10, 2023 at 07:02:20PM +0300, Jani Nikula wrote:
>> >>This is an unrelated, unneeded change in "drm/xe/display: Add intel_pps
>> >>support too".
>> >>
>> >>After that gets applied, "drm/xe/display: Add intel_pps support too"
>> >>should itself be a fixup to "drm/xe/display: Implement display support".
>> >>
>> >>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >
>> >
>> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Thanks, pushed to drm-xe-next.
>>
>> Rodrigo, what would be the best way to add a git rebase todo list for
>> you?
>
>An email here is fine.
>
>I'm going to run a git rebase clean-up today or next monday.
>
>what do I need to do besides taking care of the fixup and remove the dummy
>commits?
>
>(my only rule is that the rebase clean-up git diff HEAD..origin/drm-xe-next needs to come empty)

one alternative is:  take note of the commit you started from
(<original-head>  belo) and do the rebase yourself. Then push it to a
remote and send it here.

As long as there are just a few people doing that, it may scale better
when there are multiple fixups. Then when we do the rebase clean-up, we
basically swap out the range <fork-commit>..<original-head> with
<fork-commit>..<modified-head>


A simple git range-diff <original-head>...<modified-head> is sufficient
to double check the changes.


Lucas De Marchi
