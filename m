Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F8BD46623
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 21:00:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B473D10E204;
	Thu, 15 Jan 2026 21:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAeg9H2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EDD10E204
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 21:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768510816; x=1800046816;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PY7eSaWyWGIBU2+p7SZ5Iqox+X62o74XCxkxGYLcPK0=;
 b=jAeg9H2NWZXJ0YW2Vec/eaBH9UaVDydCQS1YrtUVTBH7X4f4Kzno29Tl
 n6AwfdkkGgvqAf1Dr+m29Oo/qZT51B/SLNB0W+0OpX8DAHcQW2hlhL5mq
 OEcxSWcILC7Oql9gKISGbMGaFuLxORdtlF4ExeyZGWNKWVLBATqTMoKTC
 4F4OtooH3Ym/T5HHRno//4eMnbpTjxY/9dvKUBrDbX00g4HSeHkJCWnLI
 pTSzBTLNzLmzoM73XLWV2T1LD9AbbX8XEdQH47j5arMUSX+HyfkI0ghKo
 q4IvIdnkoCGJSa0Tu1rhdZmWFdv7P4Ez8pg86J/0g0u+/WhCNJ8XxC28C w==;
X-CSE-ConnectionGUID: NsjsXxwkRai89U7TT3G43w==
X-CSE-MsgGUID: 38SH/CvxSeiToEDPUMQubQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69723999"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="69723999"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 13:00:16 -0800
X-CSE-ConnectionGUID: eCpOwzHDTyi1m44odTkBFg==
X-CSE-MsgGUID: /35mL/nMTmSZqQ5nSh6Gpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="205111850"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 13:00:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 13:00:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 13:00:15 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 13:00:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExVrBNI52Ql9dObVDVE8j3Z0fu0lCo571j1JRuvfVpBVRqklDn4U6XYEOG2LvlWoo3NKWXes2rT8b2ceCSP+1TLTj306kbWoDjHnwLVS9k+/kZyGP0nw2HpxiV44lLUueXWYKZ33zEQmgY/7/BYRaiCT9Eniqvoj9Oy15r2Y61k70Nuulbx4fgnfg2RhglG8UU+WJ1wNY7iK7rf3a4O8/cTdUa1Z7Rd5IswL3yUDRB2JI4eggE9b9mtH85S41OOt/Dm6hSOYc7kFHTOrWUbxB8KSI9R3olQs1Upcv0gBZLzUWqHCOg47yQFt1hcwcP8UqeZLJF73ABqPE6aKHH0Avg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKw+oe9xmg8+6bORcs3WKYkZPKIFKChCiN4G0HXXKPU=;
 b=KwS5LQDgF6AmVExYxswd+C8HlHnlCtaAH1jF5IadlNEw8xGoF5PjYDuf9SON6DmLX8nkGjFM4CT+pkbHRcm65iZCu4RA+cM5ytBUVLxtMER9/KTwvInrP74PbE/N0I+uJABCOcx42l/wJApQ3yvvaOdm+5q5hl7ggKpznHSjWNqmV32/d4YRZUemkFPKJJc8kfeIQXg5Kp2nweGfixafWdn2lEZxDHTLfWl5Q82HOc5vYzbGWCR5JeXUUAs5YYZ2k60DpjiPyDEi3eZRKdkmrWixv2V2IAGUeeZh1XE8JC7TjYzXGGfNsOSP0Nj5qCPw4VAsNh66TJJ0nZYld2EFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 21:00:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 21:00:12 +0000
Date: Thu, 15 Jan 2026 13:00:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <nakshtra.goyal@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= success for
 drm/xe/xe_query: Removing check for gt (rev2)
Message-ID: <20260115210009.GI458797@mdroper-desk1.amr.corp.intel.com>
References: <20260113091928.67446-1-nakshtra.goyal@intel.com>
 <176830212427.149757.15752579580536574121@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176830212427.149757.15752579580536574121@a3b018990fe9>
X-ClientProxiedBy: BYAPR05CA0102.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::43) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 336a9668-05f7-4f1a-436a-08de547912dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cBJT4WYz+zPShsHvCS0xncuOTnJoSkwJMNYHznCcHY6oRW9yQy+21jLY55s9?=
 =?us-ascii?Q?BBQ0bKUjEXV7PneF2V0Yrf1mu3DRD3O/idzRJgJFQLeoDDIv/MhmtIjHDrEV?=
 =?us-ascii?Q?HR2VO+bKsaMzILOLVFL8cFcsVWzpgrA9FmgfjUyHOc5cX6kFylOKkQt2/JkQ?=
 =?us-ascii?Q?l+Z+EuRoqaVB4Um25g3ymBrsZ1rwd1qAkGcOqVWVrhzT5hDodBU745EgrA+B?=
 =?us-ascii?Q?n+UXj5MdJHntU55/i1H8DdME+cHd/2TAq6GqXapiwGTn5wxYt1vSYeJZmBy8?=
 =?us-ascii?Q?kXJ2u7pfWdQZf4l+CxEfQ2g/KO58GN7X9jO8jN/PoCgTJ8YyLV571K83m8YV?=
 =?us-ascii?Q?T8XfZCZat+UCK+E0UWLwK7s/fncOzoN/UtZX4BLAD8jmvOh2jyU7v6cHDz0U?=
 =?us-ascii?Q?L3lUYpyS7UPdTYcDsRv+cdIE+xagVLy7dve7RCr4s5GrEfUAFsajD8TNlAmZ?=
 =?us-ascii?Q?aGA4dqs04xNQmXOqPiC7mqclubBcp5LGSjs4R7gkm5snSABYT9GWyObGR0Jn?=
 =?us-ascii?Q?CNGdLx2OJIA7m15yr6UDTvS1HB1kQrFwO2xLwBm4RGv2XrggdR4JUHhP9JFb?=
 =?us-ascii?Q?C5Bntwv9+eKJP/q92L4z5XGtFTliBLuvcBKjpwVjmgWbvZNtLR58kWLYaVcb?=
 =?us-ascii?Q?VXKItzF4LYR03G2oKK6/hxC5gYmCVFloDJ/M4nyiruGDlFjUIyJcJNUb06IE?=
 =?us-ascii?Q?QXl7g55GfiNZPU02XBd0UcTkDI6j2rT6q+NqcylZjka9/naWdUc4i6bZqOT2?=
 =?us-ascii?Q?GKL2OceAm2N94xQZlmkjGxevBzmWxUZ452fnenOdDADwjPZOC9Y05FzYdIss?=
 =?us-ascii?Q?SS5ME1IiZZPCw4TEAz5jGJmVQAHX4BF9Z/KAobHU/ZcTH1l8rXwTfLHMasft?=
 =?us-ascii?Q?cj3+/lCy7lE+olbFYuyfqlyMgEb4ILMSGoQFPqVWZFMwDEbjaW5mix3WjM++?=
 =?us-ascii?Q?sqJQQGdQLZcMfBrKR8MV69htAzIBL5ifuB2hR60ICC+PvJ53rfvdezqFV29G?=
 =?us-ascii?Q?WGL4DhIAFVCHLIZ7qqb7miIBQwWLE1hMZwMiKBKPIFRj0CuHZdWe3E1A24uz?=
 =?us-ascii?Q?v0s2vDQogi7LSLMys94MGrpCVnNjIOlKjtZA+cMeUpY0Xr6xUsUA71zV/lL1?=
 =?us-ascii?Q?q1mbexXPV26VvQx8OXTLrwpamP9hN8dBQPOzRIzituHXV6H9dICFDw/tfFUr?=
 =?us-ascii?Q?AFs0Ax4YzCpKLTzXza+hWWQYWrrxesz2VBDeEUpPXKKaFJ2WS1w2caFmAuEb?=
 =?us-ascii?Q?JCkRWFk0d6HnWulfiCdNlfKQPfNmCKtO5r3p7RQOYC/REF6QHdmDDvh4WHKt?=
 =?us-ascii?Q?01xX29T55DVaddotrwbs3otow+1tSmzZ31n1Ihy8T60Ox2wB5yFIQP22SOTJ?=
 =?us-ascii?Q?RnlhqZGR3y7AWnESLiD252bn5TCY7V1LfbHDOED9wC9sY7GZ/y8RCpiCE82p?=
 =?us-ascii?Q?wlsbbCMgn/+uFtWEpHgqOJLC/e5oCgi57P7UiaIb4LMnbecgZV67wUW+IgnD?=
 =?us-ascii?Q?tqXatXBaTfN5k7Of62HWCHFwQgFE/iCRv7MP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jb7dzI94l4fbnX8tKTZZEUVuY1Msm3zGqVwIMTr+fXTDR+nbwoZGpDepDJOE?=
 =?us-ascii?Q?ZO8ERFJFkrEBKqU0PTHuDJPJvdebj/zqbeKxrEHWS/V8BwXeIkdg9a+qS8C/?=
 =?us-ascii?Q?m3xA16k8fFxvDsFBp+//dF7MGjl5TMLwSfRRKfbihPYnMLw9h6sMU3+RJ4nt?=
 =?us-ascii?Q?/0LaIHHGUrzz65m/5X+yAupvUzI+0k3x3KNh4n0GqZ/KAtQXCqJiPrCG4mBz?=
 =?us-ascii?Q?lyoZYBLOSnH7TMyTJg82I79DC+gSzYtKjaazW51GQJfwLXhNfy1QyoHTk+ip?=
 =?us-ascii?Q?85CjDgoThH8f/Gzky0TuzErBWVF90UYpYXsr11GXJ97WGmq9+EsZ9aTz4d89?=
 =?us-ascii?Q?wC7kJi92gLy/ZVvm/VkVCAhEDHhUl6MSDyRs/MX0ClPIw1lGNNv32SiTEZNy?=
 =?us-ascii?Q?6oaVFE+eDxvT+4310c6iN4Z/9OqhzMyb9L2/hWTYD6RS3Az/b825B1j9Dxz+?=
 =?us-ascii?Q?OI6zGeqXEYRYs5MvVZ+vpj5oG88g84BrGNHWaSH7hkLsROcJmerzE0gymFIL?=
 =?us-ascii?Q?Hpmpyiz17SXXXiqShqYIxzVrJpBgL8hfroAAxAjWyt1v4wZCpCQHJN2THZGY?=
 =?us-ascii?Q?FgWKDmn6Rg9IlMVezHg7QyXLa/0iizU53SIWnKN5Vy9PqoZrvZoXCp8CReST?=
 =?us-ascii?Q?w5xu7lBdYx4nHAGo04J31asj3n5DflJupQmRe/pXN82WfVGRevfRUjhldEd+?=
 =?us-ascii?Q?vket+KIjUtmVrHYT8qZNKg4JqLa4WJdymLFdz1H+kj2Rmv8Yi4kOIrYIrre9?=
 =?us-ascii?Q?DzO/Tnd2nq6xoITMHksL0r9+MZuAHeQ5UBEoG4lFpvD6rYVxpJAwGrM0JbYa?=
 =?us-ascii?Q?0nMiyjWN+r0oJo8AtmBzXRvV8j1Ty0P22qDYye2GAWqAmVD5hr8skgD4ItSH?=
 =?us-ascii?Q?HlZee51x4qf+ut3+l+3/RVvA/ckEv/fH/euSVY8Qa06T9b4C2qvR4dPepKGo?=
 =?us-ascii?Q?Hse0n455LWHUweK6BDcM4pBP+MVp5WEURbubxnS8ERK9rtHJ3jbBkF3A5yxw?=
 =?us-ascii?Q?klSmPU9tWsP3msqi5O8evjY+/QfE2tFJpNsVPx/fzOIewf7+wej9gvrnDj6I?=
 =?us-ascii?Q?H5aYqVOPW78y252i8LnjaBB8aS75ETOJeW724AwewtdQAQvWF6MwRA48zIH6?=
 =?us-ascii?Q?AopKVDf6FzqDV3ttqhEDkIvQ2dOfpLcS7nBXAgavd0oNNPOpEBL+ZeR6akJ0?=
 =?us-ascii?Q?IB3py2ubkAfEYAc1h/tkvxhu6BK0hibSDo6jHwEL0dxL+vv9fHD87YsgernZ?=
 =?us-ascii?Q?TqwCSz7QYzAa5K7zTJnC6isw/O2y0K0Kfk5M8/twgoANbYDCkSyc3/OH1xlQ?=
 =?us-ascii?Q?9gI2eviLy1efMIkWjAHVfpV2KV5vUA9Ya3ud7hrmWVbhweA/WJ0D4vOS4OWs?=
 =?us-ascii?Q?qc2Chv/MwCH/xkg5ckmGcSvDKsNliGgdec1CTFI2k/m3ASRPuyd4fMCYv3vx?=
 =?us-ascii?Q?kthUHpzrqlDkJbVVyZdj0kpK0R96MJFguWH/kjQx9VmkzmrA2Tm3vaXkxDTS?=
 =?us-ascii?Q?LFUOuYZJLyxKegcwQE1Xomn1ItpITyi2nn8bEGxdZx46g67X8iABoh7nvR9h?=
 =?us-ascii?Q?0HxK7E4N99PCTrq6XNi6iJt12ok7iN6NAYU0mp10wzkmleuqqhTORRTt4kIf?=
 =?us-ascii?Q?w8gtPCHwWAi46Lw05zRnDfi9HeVqFtEdGnKE8P+75ZCAHT+tlzYuyV6339L0?=
 =?us-ascii?Q?UqTrHs3LkCNKsTDCMpcwG0hUoEnpKu2GThBZVJajIYzeOq72rUa8B/9ZHhF1?=
 =?us-ascii?Q?muqNXu3X89ubAcW10NWUpYZUi0cDD0Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 336a9668-05f7-4f1a-436a-08de547912dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:00:11.9690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cufbayx2wkucL+UqtTGCVvuAQi6WFmqyCVKzn+ib6uyZxukQ0h5wg9M/8YJJ5xCPcXafPfiuca5KQ4ndxRZqbkqUsX8BapPHI4tH4PKHF7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

On Tue, Jan 13, 2026 at 11:02:04AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe_query: Removing check for gt (rev2)
> URL   : https://patchwork.freedesktop.org/series/159866/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4375-0e1b1ce1c8adbc0a8ad1ee763a8a9eeaee297998_BAT -> xe-pw-159866v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

It doesn't look like full CI ever ran on this patch for some reason, but
the results from v1 indicate that there were no issues (just one
unrelated display false positive).

Applied to drm-xe-next with a small tweak to make the commit subject
imperative form (i.e., "Removing" -> "Remove").  Thanks for the patch.


Matt

>   
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-159866v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@xe_waitfence@abstime:
>     - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4375-0e1b1ce1c8adbc0a8ad1ee763a8a9eeaee297998/bat-dg2-oem2/igt@xe_waitfence@abstime.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159866v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html
> 
>   * igt@xe_waitfence@engine:
>     - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4375-0e1b1ce1c8adbc0a8ad1ee763a8a9eeaee297998/bat-dg2-oem2/igt@xe_waitfence@engine.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159866v2/bat-dg2-oem2/igt@xe_waitfence@engine.html
> 
>   
>   [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
>   [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4375-0e1b1ce1c8adbc0a8ad1ee763a8a9eeaee297998 -> xe-pw-159866v2
> 
>   IGT_8699: 0b67ab25f2eb58b296872c8c34474b79353727d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4375-0e1b1ce1c8adbc0a8ad1ee763a8a9eeaee297998: 0e1b1ce1c8adbc0a8ad1ee763a8a9eeaee297998
>   xe-pw-159866v2: 159866v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159866v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
