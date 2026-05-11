Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957FACD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 21:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE8910E20D;
	Mon, 11 May 2026 21:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyRboQSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F06810E20D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778533329; x=1810069329;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/fsX9eXBgmF4TPIptG5UX1NzF31TSltx8Lc4B2lbi0I=;
 b=gyRboQSNZX3GCf5h1dBKm8lCR3bw/qegdMJfl12Yt3PHUPUrv8Ej/2Wz
 f5pT5uu9NoNBUEW3MhBQ0XBr8rxLmKbT/xEYlmDKNMyrtTespD/aAhqbI
 WKG9FvfO+HRciyDYX7j69uWRGH0bT/iTO2n+lKGwzYtSSr6F+u97SOM2a
 931rmnoeANzbX6YHUCBc9/HVXeBwe+Wb9DIx1/5My8S7nEuGIrDlvMzgo
 7brCahjftH0rfZFtL7wlY1mMygmHPvg6s4YUyEc/JMFvZjzR14V1KiEAU
 90ixqkwIkcMrmB/Dz1kG4gn0ps1qmTXpnHStfopB6HCy428fSSfm43kE7 g==;
X-CSE-ConnectionGUID: FX86Mqt/RwipLmLoOO4yYQ==
X-CSE-MsgGUID: unkBvBeMSRKmoZhC2/pqjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90533913"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90533913"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:02:08 -0700
X-CSE-ConnectionGUID: wndG1+8qRUStDs4nW8vhdQ==
X-CSE-MsgGUID: XGRcNfu/ROSzvrDrqIboPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="241557929"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 14:02:08 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 14:02:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 14:02:07 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 14:02:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDgsitagARam1366VKDvVmDuEnOpxe7GCZU1og2in11OrC8M9XqJG6/jbx01or35P3ZRn8lG+y3S9uEXgXOIeuv3NQ563uhfxCz8EdqhEqCdimKJ6hyAG/yKoP3r/lFlAA8YsOnnD649zKRXVvWGhndX/tNfyoAnWVpmkwEPl8mH6AUS2WFrT1y1Df468IrUU9eRpHGMkTz/F6VZzOUoFkxtprdk1bowRd7e0QTYPJXLK+GKs+5gH5uHHA/I6ayYWHCb386UIU7oWlqdVzGWdIaeGyP4m//xRNgQvqoRS8o+kpgHaUL1M6LoMBF0BRhg93yoGhOlCN3miRjVY3rp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjwsV2yP2GyBPiedeKyDVQJSM1Zert8Lqv5mqo02uJY=;
 b=Y48jzv7cm/Ttxp7CoCf5Xj6w5mcmyTUqtGKB8iBLdQuQERlIYlATPmTmzwJG5xz7sDsUm/iah5pxL0ugSIP4vO+ZzjEpbFKGrrquGNjk/VQJ9U3sJAXNxUNBGqISqiYoNrlBacXmfitPTv5aYQ9LzvVQUmeRtqUDbCnw3dcyg6JEfjjr3oV1+YUhijwRevHlbkM8zFrC3nz3SKuJGThlJZUaT89U3xTE0lWhSJ+MFec/Q45JV6ZWJQGrIAPVogrX2Qhq/7Q3w4biKYGMseE0br1qwfrIgtC4TGB5PaBMenXG0/YOem4vk+FStWCppZBZtop7h3peKk4sIUlWQSD7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA4PR11MB9393.namprd11.prod.outlook.com (2603:10b6:208:569::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 11 May
 2026 21:02:04 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9891.020; Mon, 11 May 2026
 21:02:04 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
In-Reply-To: <agI9Mejxoj5VBRtR@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
 <c4e5c9ed6e931ef2d5ba5b87b7be549c8615f7c0@intel.com>
 <871pfirwy7.fsf@intel.com>
 <619ba2cfdac33128f92c4f83b8573770146cead8@intel.com>
 <87qzniqgau.fsf@intel.com> <agI9Mejxoj5VBRtR@intel.com>
Date: Mon, 11 May 2026 18:01:59 -0300
Message-ID: <87v7ct64oo.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA4PR11MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2294d6-4f0a-4efd-a526-08deafa08d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: O6Sk+NL2rOA2hfT/3lfxT6/kqOYpe0BPQnYCgxoyJUkVgK5IjJ3zx/CkBGb4jbX6YZwWNjh5V7PULehOLCPLc44zIQxXui034TdAeNK604mngBXfET6pb6C3DnJ13sOBRM8FhjrRPuWhJ93kC9y7VxvQQRvk92q8i0P00mJZyR8Lh6nAD7zE2gavYVcKsPgmaOs6FxVcKs0b4J8777L4tFK5hbTqS+9lanck5CCYqstn/tVWr3cupAnHItV81ydKRyglW5g1otKztExz3IZVHP9vrjY/fRNO0XaY7KBINdCbFyaXGWeW4isoBaJvW3N0tX8hnrljyqt2/QJU2PxzaUgmXdL7Nem1zAEU1ioSUAqyWMr9SdtSAz0k8r6qEf3YCz2uhAXP+crw2rO/YmD8loUvwmVhK9QSjtdPdmqAbr1cATBIRlK7hDWizV2BSJqayhvvvVB5qpnzIS8KmuqFh2MXEjxUYElBe+PZvMddkAr/JQTjyMRICK1WIruubBNsaKivUHAM4Plscpc1kh/nmrT3u10+xCABmGE98GtnHss4HqxIig6woiFVV5qB/jxmP/YN9j36Rf/MoL8NPXenVug5yYsnSt2tLzAHPN5IB3N8gtrjaxtrADZUq0YZjh0IOrYoOUwPoxK0jNnbPtzEMgqNDICaGpOomP3xiTzw2Kb+w1eO1DHArNdJQwBhLY3L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5TIuqUZau63GYPaFDvkIhF2EIsY64pOwgJUyIPLoJa2mSgPywDoIxlnBCOL?=
 =?us-ascii?Q?YvTutCt7mwmNtyojRsYmOaTemWirPdkb0MrVsmnzFyQ+AbdSgOz3Kpwws53V?=
 =?us-ascii?Q?6O9lThumSsadvsg3SoVX49mg+DRs7Zonq6DDd0EmCOokvNdKVRui4y3w5/S0?=
 =?us-ascii?Q?Caz+93ncD3BH0qFt52B0zVDzUKaWdzZUNChxCBCfPF1IFEUmclDoGml/SRDC?=
 =?us-ascii?Q?H2LcQ72kISwOtpy5lSc+bOiiD6tiouDPfktQ/lP8TGFwUZLCzna+iPWErdGO?=
 =?us-ascii?Q?9z8ny9lvisMG7BHNygnBd6j+gGAPap41BwknKhzEOwKpuHGMZyIe8izHIiST?=
 =?us-ascii?Q?GdWjgW8Qk9Hwv0tBoyEdCTXUnXH/Fk6K1z34CkRJ+BiK35m33CZnoBfZuLXk?=
 =?us-ascii?Q?mDgvDLGT7EluEkSVFo4aqzWSd49S/61tYdHU8ntqieWlyWc3MscPR3Ny/ygf?=
 =?us-ascii?Q?BbHeS8PLgtxy6jQaQtctNuSUUSXaY/Tp+1M5+rYZv65FuiTxlc897a8LsLBS?=
 =?us-ascii?Q?cx1Ly/amBQu4jLcMQd3knx8RfOrPFrviLxpkR3mmeJ4c/oY7cjuJeF79P6eS?=
 =?us-ascii?Q?UHUOeto4sVUfYs1V+OaFsPDcKufisoP9BNEy0yFcmPZ24OvX00a12NezrSa5?=
 =?us-ascii?Q?u2fQPrXLSdQ2kLdZyeEbt+Sdg6A8F5/HCSmr65To9lYtxXq/O+CbAb3n28Ib?=
 =?us-ascii?Q?L3cjPbLwqkXr07M2HXn17SY/Ig4wdOE4s8EMvNjjsdW8g6m3rLW8xpYyDHO5?=
 =?us-ascii?Q?uS54Dk+kKW17XovlJyEkuPUE9hn9wIt3qwk8nev+0MlPbSBkRtUa8EEvvbWJ?=
 =?us-ascii?Q?EH4iRsB1mM3KxGurdjn98WEa7WBiXPPzMHKj9WI1FRMznfaUvefq1UWywH5v?=
 =?us-ascii?Q?wR333RRyHqLf/XjFBPlHOiWLWPpCuUxrtAaoAFgLy/SxFvFoo1W9oq8UzQfk?=
 =?us-ascii?Q?8YRzW31l2OUiPM6WwQv9nOHt4rY9ZzFT5ZyFpIElOfKwngueeQfb3TmCSPdg?=
 =?us-ascii?Q?sE0lDZt5LhMGqzEnxhvguyCoYtq9J5uUa9yM+Hq8CSwqSDCEldxJ9gYRDhvc?=
 =?us-ascii?Q?hOGh9AOn76ySW3FXGDoNB/FcqyPOEJXJLOZlseXdEIB7Ubyi8tF6BLMcgUK8?=
 =?us-ascii?Q?vaZivrCQF1CwKMWLHp7hRpOgjZoXSjkR6jHEI2GP3L3IQtlcTFnlPZLN85Fp?=
 =?us-ascii?Q?OJL0HnqLSgOdFZVbFD5yVaYWz41s4SVxXLB8nIfRmWOGySpHjTk/qKomDfzX?=
 =?us-ascii?Q?fOly3L37bEeAAflmVuxFZjWOHZ6AzN4wW16EECJXPJbIaX2tr58/sz3TebQT?=
 =?us-ascii?Q?fqDvZk7sQBItQuR4jVE4bY/1wU4MbWK59ItiA1uUCpd53skZd2aZFZ3zDhnB?=
 =?us-ascii?Q?kgu6wE8dbaXiBs/fQZAX06nzqCcMD80OFImsi15Dk2urgaiVs6mDMnXgjVJf?=
 =?us-ascii?Q?mxYOhARymTvafbybsY/GJzTPq4IpocFdVELGyGk3zBuv9PZVKvclR3XWnO5t?=
 =?us-ascii?Q?+lMvj0zBgacqet89geUbVwrdkw33fUgZkricQgtzt9uBHiDvnkDKPmYlP8OG?=
 =?us-ascii?Q?EF7e6fAQca2h5Hk1N8tAfZ/yVCcavy8NFYEhTYrsMDVuTJO1BlCf5nPtts/4?=
 =?us-ascii?Q?radnYICAGzxDIh3ai6u3TjqkMAPbV28xDMC1tIFV887BG+PbE5RyAbuu5FY3?=
 =?us-ascii?Q?quEsB1Pvpvs6QCgKNHjRBVATpG2hHYSR3nJ91Rd/N5OMu0duHFcr5ay9/XVt?=
 =?us-ascii?Q?GA+cjNPJ0Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: hYe6PvWbvFU5on8ZGL1VZlL3mnn/jMUqPjVJnoElzKdtt2EcdNEJY4SLd0N4DqhYdSQLoRrc70TPelyA3CAugN3OKeW/i/Sx/VOlSMnDo54Y+ZCWjxaxFof2e0R/RQyEcqVewurb9c5Sw+3cgMf2+YYgxxnbuSWgVXhLPHc3KXyhO+ujbgUZyBJp+LJnAiy8gXoYvvj5b5FvjCNa66uiyZA+XXLdvHRSnDUK4F4vQmJKqxhYbKFjwYUqHHrFa3/QqGQKtTBQFXMYz6ezYQcUO0SqLzdafZqSgDPIrOF4EdLAmLTa9MZanln0c6ajAkYgQGSSZXdJ8FHHRLXP4joWcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2294d6-4f0a-4efd-a526-08deafa08d68
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:02:03.9455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRA+JAkqHwQqI6uQAlHnFnQKU4aEZ1oebHI9zpN33O/azCIth/3tMUTL/xDS/D+KgZgqi/faRTJ/h0URrbfcNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9393
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

Rodrigo Vivi <rodrigo.vivi@intel.com> writes:

> On Mon, May 11, 2026 at 09:30:49AM -0300, Gustavo Sousa wrote:
>> Jani Nikula <jani.nikula@linux.intel.com> writes:
>> 
>> > On Mon, 11 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> >> Jani Nikula <jani.nikula@linux.intel.com> writes:
>> >>
>> >>> On Fri, 08 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> >>>> +/**
>> >>>> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
>> >>>> + * @test: the &kunit test
>> >>>> + *
>> >>>> + * Return: True for a live test and false otherwise.
>> >>>> + */
>> >>>
>> >>> Pardon me for being blunt, but I think this is the worst kind of
>> >>> kernel-doc comment.
>> >>
>> >> I appreciate the bluntness! :-)
>> >>
>> >>>
>> >>> It doesn't provide any additional information to what the function name
>> >>> and signature already convey (which is to say excellent job on naming
>> >>> the function), but it fails to explain what "live test" means.
>> >>
>> >> I kind of just added this kernel-doc to fill a hole for "consistency",
>> >> but, yeah, it does not provide any new info.
>> >>
>> >>>
>> >>> The extra bits of useful information people might need after seeing the
>> >>> function xe_kunit_helper_is_live_test() in code are: What is a live
>> >>> test, and what is it if it's not live? Dead?
>> >>
>> >> Zombie? ;-)
>> >>
>> >> Joking apart, I personally tend to use "regular" to refer to non-live
>> >> tests. I do agree we are missing some documentation on the subject.  I'm
>> >> not sure though this function should be the place to do it.  I think we
>> >> would be better off with a "DOC:" section for that (and also explain
>> >> other bits in there).  I think it would be sensible to rename
>> >> xe_kunit_helpers.c to simply xe_kunit.c and add such a section.
>> >>
>> >> With that in place, this function would be kind of self-explanatory,
>> >> right? Is this a case we just drop the kernel-doc?
>> >>
>> >> Or should we try to be consistent on "every public function should have
>> >> a kernel-doc"?  Is that even a rule or am I imagining things? :-)
>> >
>> > I believe xe maintainership leans more towards requiring kernel-doc
>> > comments than we do with i915 or display. I think the hard requirement
>> > leads to a lot of unnecessary boilerplate, more geared towards filling
>> > the requirement than being informative and helpful.
>> >
>> > Personally, I value overview DOC: comments much more than kernel-doc
>> > comments. If I were to add any hard requirement for documentation, it
>> > would be for DOC: comments for each .c file.
>> >
>> > Bottom line, for xe, ask for xe maintainer opinion.
>> 
>> Cc:Xe maintainers, in case they want to chime in.
>
> I'm definitely the one to be blamed by requesting docs to every
> 'public' function in Xe. :)
>
> In my view this forces developer to see the .c,.h pair as a 'component'
> with specific entry points and a reason to exist, rather than some
> architecture like i915 where .c/.h pairs were only created when some file
> was 'too big'. With the component in mind it is easier to identify when
> something is abusing the interface and accessing specific internal
> types directly rather than having a function entry point to handle it.
>
> But well, the 'Doc: ' is actually part fundamental in this component.
> We should definitely have a 'Doc: ' as well that justifies and give
> reasoning to the component.
>
> That said, in this patch here specifically I agree with Jani. We are
> missing the 'Doc: with the reasoning for the component, and the
> 'public' function documentation could be bringing more useful information
> like Jani pointed out, instead of just stating twice the return value.

One relevant point here is that, once we have a "DOC:" section that will
explain "regular" tests and "live" tests, it will be redundant to add
that detail to the kernel-doc for xe_kunit_helper_is_live_test(), and,
IMO, it would be better not to repeat it.

That brings the question: should "every public function needs a
kernel-doc" be a hard rule?

--
Gustavo Sousa

>
> Thanks,
> Rodrigo.
>
>> 
>> --
>> Gustavo Sousa
>> 
>> >
>> >
>> > BR,
>> > Jani.
>> >
>> >>
>> >> --
>> >> Gustavo Sousa
>> >>
>> >>>
>> >>>
>> >>> BR,
>> >>> Jani.
>> >>>
>> >>>> +bool xe_kunit_helper_is_live_test(struct kunit *test)
>> >>>> +{
>> >>>> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
>> >>>> +	return false;
>> >>>> +}
>> >>>
>> >>> -- 
>> >>> Jani Nikula, Intel
>> >
>> > -- 
>> > Jani Nikula, Intel
