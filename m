Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABC9CD37B9
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 11:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E308110E515;
	Mon, 11 May 2026 11:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0CBICRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5130110E515
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778499960; x=1810035960;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xwTt/Sj70LBmHjr/48q8xeukpRukxWqyjE7Px96G57I=;
 b=X0CBICRtgb/nMIbuZF40OFZhRiagb1nFK7SK6TUYENbwUwDR2OlDRqNr
 bmGLLY1zYhO5eyGjBIOAKgVwtoUG7u1938HTOyHHzrwTOILVheC5eTrMu
 e2BPlZSb6/M/WVgwyqQeXyuQ2T1iTKUBJB3GOmUY8PwKnNlTkl0uEv2sd
 jZsApglpTc+qyyDIZQ9xAldi/pmXYmlWV49Jllrs0Efwf7CE5Ku+bMY9+
 IC68cfdlR0VnPkY3lkzUzKkwhsDaOW5y5j2LZDCzagY3ZYegmnDi0dQbb
 R0AT+w35Kx8JTGK2zxAgFbzyLp5J52LycnJVh3Z10UDZ7ItyUPXBjlSbV A==;
X-CSE-ConnectionGUID: 5KfGNpHQTleQZJ9Zsdyw1w==
X-CSE-MsgGUID: JKtnR+AZQb62NbwKNLhwlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="83230148"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="83230148"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 04:46:00 -0700
X-CSE-ConnectionGUID: 06d8EzLsROO/CHkh7pjvLg==
X-CSE-MsgGUID: WIe7H1gWR3Gk3YeW3psHOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="261166002"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 04:46:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 04:45:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 04:45:59 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 04:45:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VA7DrHxPGAL/qu0tWFkEVwbJMQ1H1dwnljH/5XnJR3dI18MKwjsPUB7MP5XL7LFGhbGHHVc2RFV2fTuZsVQNfNGm7QrlKOReVjHsTt/stDX6gnreC9hLuLA1RbaR1qM6Mudf1KoMF3Ap5n7bPGo8bX8lQHu0yiBxJd3oR4a9Btqqgs2xlm3mL9dBb9L0p0nMfPGhuWTUz/YtHpOnOhis/LtfMJ5zEQbQOhW6aWoja9jK0bEdHbMKOjxxZ5B87CPxRNTYloIF/NWuAXlAO+U+ahen7qBVvpUfnnBmST/EhFE9EIv3cgmZVVbcVHS7SHgC+EbAUR2NQDvpI748pkI74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avVMttJSdFGPuywaUYFqIXXiXp/j3V60SkXVfPrj4BE=;
 b=LKnCG1ax84Lh+PyRuuo6fUhnT7mULgi2z2mIXIbat8AlvcYarzSA3PdRDans0wQIsP+aZR+eZJMPrSaLnjNpkWf0LtbiNiMqixdFytgrQdXbsSKxWMvGtUCi7zvmTKkdV4OQviLK3TWFKUfJbNrnkXKP81+/6J3mBFLyHPE60LRtyhM7RJETF9B4pUYOEc7F0BIs0ecyiHTILDvwAh/DqHsB4OLNUCZa9SEXKMG9iwEl33xWzBQGruNmeT66U6viLucn3qzlbOvfdeiZ3CvwY0PkedhnyyflU8Axi/99mQMIepsZtcN1TylFX3G2wxoxUB3vaVtCd9pjmTxfyeyQEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 11:45:56 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9891.020; Mon, 11 May 2026
 11:45:56 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
In-Reply-To: <c4e5c9ed6e931ef2d5ba5b87b7be549c8615f7c0@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
 <c4e5c9ed6e931ef2d5ba5b87b7be549c8615f7c0@intel.com>
Date: Mon, 11 May 2026 08:45:52 -0300
Message-ID: <871pfirwy7.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA0PR11MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b6c76b-0b39-4a85-36da-08deaf52dcdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WKURu6vzQ13YYwpwe1Gq4oEJtS6nkspT+xmJF18NzpWdBrfVCTTCprDxmf9TIeADA6e4JmFJ9X6dRcgeyURQylwjZ2fSqh5ItoAqkr4TPq7rmeQlfzcu5X1yPnHhz6IMkF07NKg0QNgT2oJLKZ8YmOK4wXOP/7kjExKOJk2fWERNZUXJiKPchRBaq8PyurNB40Irs8Ln8dXlhHDPsm6yhh9yEIZQ2Wl8qa5+j9l5i+PwaEoGk/UxYj+i4Wh3+Pz8Ba0+edsuskecWVLoWS7HowguNXUpf0LX+oWOdddMe38Bo+83+uuld61GYSoqazvPKwEjqqwhtga58FAy7LdaXwYASx60rfMqHLcE5TpDFwJ3gbyi49b4Yefhgt8NSYfSdbQLeSz94n258Z0aaFUUqI5tL5HmIa3EH/Yft2E2vq1u+sVSjeJ4A0rezt+bM4SElL0OP2eRMbBUI0dFvyCTVxYWS08swMUhk2ZwxTPp7mP4nppZqlesdGgrxI3X0+F/aiIG/jhyX4fgpUi82LT9O1BPmEYuDivNRXRhhzW4lzBmXLKN/4Mew8mXavq13swvdrASe/rOoANjUGU5N6SSadc6RM6w1WhP6xQbNP7OYG4bWCu7TQg/HOLGqxf5ScueeAbgqv7PFwdqGKTZ8uWYHmCrMPzlE8OGACRPce9vMyZa04UedDfErFRq7izRaCLD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QxuFl3S5yL5bdK9YNdo6YZhMIQ+0peFuhjTyl2Jb0j0/cDh+Iyjd9E7fEqDb?=
 =?us-ascii?Q?rSdaAARnGqhwaEIvVdEn/RgP0p7PCST+ojnNsFpeinVWvGj/KJvPLzH0NU7r?=
 =?us-ascii?Q?un5sf13EBMFqvg5uFl+bvacav3dP9d2twsrTIbhCMzxgzjyvhR+LBQcGhbFM?=
 =?us-ascii?Q?erx1DrCdRi4v9ngFAG8R8MedVJDB561yxnI/AnMtdBMFiJ2s4JeIsQIyhawC?=
 =?us-ascii?Q?X4a29NPcI9yoKInhXM1X1YlpiaW4vb5NAAoSm+nYiPxAGL9rmrkOY/QOlx/a?=
 =?us-ascii?Q?AJ085ABfkZkb6ikiAvjQbobvNxD7NWooPEajU/tMH5e6Y4Jo4vivmKu2NhMU?=
 =?us-ascii?Q?FE2BDWW1xdkHfWnZRwZFsGNqoujAcra/aqGhnOHugF+u6q5KLq9WVUntHRM3?=
 =?us-ascii?Q?I19p0nZZvVg/v/n/n1C+XdjYU2rmvdmBlIckwSEcKiJS9rads1D/oaQmyQFL?=
 =?us-ascii?Q?ok9t6XrCD3RfPhn9qXp1Aj+3TW0n1v43uYXygoYis5L51aenAmC4GEuJX4ip?=
 =?us-ascii?Q?0Q+hOzaosoolmrLx8fqzejgA7JLR9hQ+9AFLecUwEx3WY6EXLJUqhVYplq2p?=
 =?us-ascii?Q?uTK5GGIx3irdWfIHaOTrtXOTSMjAFK3NfrYppoC728/mlUgsT3cqODr/Al++?=
 =?us-ascii?Q?ml1WVfnD8xGR0l0nvZlBBlsA98zlrs/LMQ2EkuK7teNBJw0Ok6L6F7estRmP?=
 =?us-ascii?Q?+s+2JR0NpuQ5LKK4io+3FXrXu7XZZ+9VzKoe2R78QPM3gdr99FGzxCZl7LcJ?=
 =?us-ascii?Q?bAIg9LhWx682WRKtTqfbWkUn6CFfKAAA7rYXNBbJizr61elvqoBGHnyd3e9L?=
 =?us-ascii?Q?d+esGig3H95BOmVpWvZ5YR4N2tg7wArxO4lRWriJJm/cBKPQVqJwZFhjFx18?=
 =?us-ascii?Q?kBvUDnLGtGA0DGqO3sbGP60e+KKIrd/DpCAkuJKibbkiTjq5KDkY9U3P4R81?=
 =?us-ascii?Q?Ptlo/nsZLsC6/KLZSgJqhjPD+xMZeR9DvnKcGxqV0TnBxISFLVJSKwuqYvMF?=
 =?us-ascii?Q?MsKMhzmzWvJ7VygczSic0Ix56+MaoG5myywetzhYVu0i6CZDx8ZFvF+KSx/3?=
 =?us-ascii?Q?GT05vj6tT3T7UXH47Mb92OAd9RWYOy2Sei+2S26I5oraQ13+d1VJRgpphzs9?=
 =?us-ascii?Q?UE74xbdeBqLZoxTmzXqNiPneIsaELuxXYNzphwnKOl67TrtIMJIEJJieAhCw?=
 =?us-ascii?Q?1snV1zAylbCccli1Yye1XrvWNj1BXPQXUwu4Mdw3U8zcQaJgQXR3aFi23wfT?=
 =?us-ascii?Q?311w2vOEFP+H+uL8cxmkHLu35NS8J+PMm3+bWrzfkX9zKQe2p/Wh0ssCnRP9?=
 =?us-ascii?Q?8mXlYRQXAg1SLQKlo0emBIQQyffB+/lyR4Bcv6t4KHIdxjQWZEZB76CJw/+a?=
 =?us-ascii?Q?Ql3T9Y8q/sPCV5u4k5p4zviiUPiZvLvl1nC2pBpP9bcOJhcXnAZeOw3cdnwg?=
 =?us-ascii?Q?29PRaUVJJZ2b60AnAvU45EbFMVhrHBLwjKm25zOOE5ub0GDg+MI8wrYhr6UC?=
 =?us-ascii?Q?5wEK+bvTMKOowaGuHvLTTkF1atMckYG59BwwEGLo+Qr2K6xwQpmefjbkw8IG?=
 =?us-ascii?Q?gBEkVZrAkPAGvhiJlvkGYFL9w9z56vQva6jdzaOXykjYhmKzrAfmmz1tnEmN?=
 =?us-ascii?Q?WJxFJPu3eUbMYwO0vwkCR+sYOoiuQfmbb0AfbLzfxEogCWLbvdVkFjJgX42R?=
 =?us-ascii?Q?YLhFC6ULrWnFozMqp/4fNvELTaCmS58HvQp/Dzx8eNpN7jkrVmB7nnz/l1U6?=
 =?us-ascii?Q?n2LyIfxqqQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: mBBs2tnQju2coHkDPnoge8h6otJPgpEHmeob7PdT4O/yb+xU79ABFY+8PZLv37m9pciRGRsnxm7jIu3AxiebbYPU77qyOFz2ZXOvgzQzWN9KLEUoyYPuJo14Imqy52aqE01ALCiyBHtU/ElsU+VMFZhHyUByWqD1KerfUYEWwshuKeto2AmBXVXL8ejpW6wjRieiMtc1xVJgyb7Nae9X+eNr31IqCuaE39+1U/PD8eKqjO4hl+8wFPilYBIPoBUZlTkMU9JOEVBKagTywLosiPgoV5849OYPRy8p/MJzPD6Uc12IHnmFYd2RkP0m0awfSVgWSz/dd1bIDRUmlk4gWg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b6c76b-0b39-4a85-36da-08deaf52dcdc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 11:45:56.5550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYI6/fdufzYM6tYKeDrgrBVx94pOAZvSQl+Oyiwea7HWWU2/TcFyvCDYwCFfF4vvYCrOGIvdwUQ3AwtGjohS/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
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

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Fri, 08 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> +/**
>> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
>> + * @test: the &kunit test
>> + *
>> + * Return: True for a live test and false otherwise.
>> + */
>
> Pardon me for being blunt, but I think this is the worst kind of
> kernel-doc comment.

I appreciate the bluntness! :-)

>
> It doesn't provide any additional information to what the function name
> and signature already convey (which is to say excellent job on naming
> the function), but it fails to explain what "live test" means.

I kind of just added this kernel-doc to fill a hole for "consistency",
but, yeah, it does not provide any new info.

>
> The extra bits of useful information people might need after seeing the
> function xe_kunit_helper_is_live_test() in code are: What is a live
> test, and what is it if it's not live? Dead?

Zombie? ;-)

Joking apart, I personally tend to use "regular" to refer to non-live
tests. I do agree we are missing some documentation on the subject.  I'm
not sure though this function should be the place to do it.  I think we
would be better off with a "DOC:" section for that (and also explain
other bits in there).  I think it would be sensible to rename
xe_kunit_helpers.c to simply xe_kunit.c and add such a section.

With that in place, this function would be kind of self-explanatory,
right? Is this a case we just drop the kernel-doc?

Or should we try to be consistent on "every public function should have
a kernel-doc"?  Is that even a rule or am I imagining things? :-)

--
Gustavo Sousa

>
>
> BR,
> Jani.
>
>> +bool xe_kunit_helper_is_live_test(struct kunit *test)
>> +{
>> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
>> +	return false;
>> +}
>
> -- 
> Jani Nikula, Intel
