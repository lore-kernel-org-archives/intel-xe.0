Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE5CC3DA7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 14:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F132510E3FF;
	Mon, 29 Jul 2024 14:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLYpus9H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139F210E3FF
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 14:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722264185; x=1753800185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gGa+CpQt0WqT971dSmaYUSNCKdiJeArN2XIQGg8kx18=;
 b=hLYpus9HNMz0w5FB6ONlSGZdDV/insS1UntXK2ZjF6UQqrooqTFteya1
 LcC1oy+IKaDyor5aVRTgiGeHwY4BagpCa95RteUrrtYQ0bjFCVNP+4kWc
 zp7OX6MAzj3Ef6hLj6NT21Jx1dLAwBwMJHOsHiObNGev+YEHAGUFhhWvm
 S5ubkAbPc/qU+p+1HT2/VRVlrl+wWceaFF4nKIReQQqGBRbV9l34/8aDp
 Hc46U2gKQ5oOj8hbNigitUmcfr2ax83EDb1K3Nxipllp6yG8Ncu74aMwx
 OBMigYey/VSQ4SUqm07R+D7xEJTA6H7AWrAIMPdnPGjz5XLAsjnLqVyCP w==;
X-CSE-ConnectionGUID: bf+pERv0TTa7EHabylrukA==
X-CSE-MsgGUID: X+3bGXTxQ1aLLB1sYEjL/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23887373"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="23887373"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 07:43:05 -0700
X-CSE-ConnectionGUID: YQ3L2eQ/RseGPmqb8sMIBg==
X-CSE-MsgGUID: /aYSHlCVRLORurw1riNQGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="77220661"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 07:43:05 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 07:43:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 07:43:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 07:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC5J78lRs69AujOLAQ3ntuUWmz3PSClMTiAvo5lX+yBlmTATAYPVLtTf2QaxMwZild7LY6nJoIkybEAkZ10r8WNIWEo1ByyAsgAkeii/E/vYxQ8pVends2hl1Ny8tkNTxFZ7YnGCZKHqXV0tDhwqmHx85YFHvF/43UgW3JDOhtqEtrH5yszOCK9HvTyZ4A01xdYd8WUL9p4CwrBco6OgeHuCQLqS8T+6Rycl1WXcxe/dXIgW5XPne/HGVuZ7gqsscLDu9HzTgsno9C1QUZ1sMslD4Z9RB1uZllMd4spdTqvdB5gTU0CtVHs/B6xdYC8xcDlDED1hhYLUwvAkrd+u3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8HTIe7Hvm72myVaWZ1s4avSeweh4Q5agMOjY7RbEis=;
 b=sQUUsnDCP+RYwUYQdr+1xBOT3m1VL79RtMwpWC3cpIViRnHDq8eszUaKuKpZ2mZ2GZblmCbKQtIeoG9WmcNjXsXJMio8IY9xFR1Jqj97PrDZ/kRjRs1+q559Q/TtZKvxsbroD1HN5PL9FsBAmt6jdLUGvCAHOOTeTfiBMwb2Yg3eWdF855fO4PKm9jPVETPTvbjPIi1grPAjx8wCYU4/CO8eQWNEuiHyHKMdBCdcWJ5tqgW5VahYbCAH3eVsQ3piKAEKi+NbKHyNm6+IWGI20ANktCScaT3DNeR260JN0ESRLPEkeWHQhvyTUZnRWRpE2je7baLbYi5tGBi6LQryUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7316.namprd11.prod.outlook.com (2603:10b6:930:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 14:43:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 14:43:01 +0000
Date: Mon, 29 Jul 2024 09:42:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 7/8] drm/xe/rtp: Expand max rules/actions per entry
 again
Message-ID: <l2eaixyvy6lquwcnagml2ilwpauhfgwrzqww3v654so63omw5j@dklswjfoucbi>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
 <20240727015907.899192-8-lucas.demarchi@intel.com>
 <172226393148.1863.4987223828298751274@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172226393148.1863.4987223828298751274@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR04CA0197.namprd04.prod.outlook.com
 (2603:10b6:303:86::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: aa832414-c4d3-4167-7978-08dcafdcbf3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o5KmuU8pJyuOLqt1Sm7c07PMzOvyS/Rgg5Az4uC/YvF/SMHgCPKrIBW/a4kL?=
 =?us-ascii?Q?2OuH8PGusgSDtCNhCPycwmH5ZqZCLg3ulTgzIyBo5n51WLVoIh0P8fjaG5Cp?=
 =?us-ascii?Q?LTjOi0ISqdOcWchbKLPKiIBus1JcgL62/jT7vXXwBE1jKtfNE4/P+bkfiTx1?=
 =?us-ascii?Q?IUMrkOJGohswEssM5beTUTxyCBrReN71rjn2re7Eu5xwXrBnWtBLQXhelFvO?=
 =?us-ascii?Q?eYQZDCmh1gt8izpd0MZkAxzXhKdXYj19v3rOVpSi0W+HgSTd0pdfI6DtzeVy?=
 =?us-ascii?Q?LXpb7VVCGpOzSgdPQLYvNGBnloIx/fMRasU6WfomqM9aqHzWYyCjgTE7lUIP?=
 =?us-ascii?Q?nd3gWNuh+kM68s/enzsiHmkyZwEfGqnRiIFi/k0ILrfNU3hafqCGdTdK+iD0?=
 =?us-ascii?Q?Tf7b6i1lJFBbmZtjpmn5uCc+adz1sDwhRTaEkioNAiBKvFo/x5Fe43CJEIht?=
 =?us-ascii?Q?3ilBC2so+sKnn6eNDTpEXEb0K46/ITEVSNc5pBShjPzH4GaanpWmt6jHSW76?=
 =?us-ascii?Q?bC8Ps3NBWTtbU8TMvd4yzSLfBwHcvnUON/BHVF3s+t6ZsP7i7vfzYEsdk26i?=
 =?us-ascii?Q?q8/02lil5Q1yBkCTocG6uPJvQ5RKe8Pf6g8b/jvEMfsLCFXSD+htSDAjLKsD?=
 =?us-ascii?Q?S8aJpYYf/ciZXcRDH4ITF9vbprnIaMCpxcQj0der7mghdh0qjcZqHBGbGQpC?=
 =?us-ascii?Q?T8plOiRWCnvm7YML5+bckqasMss1l6F6u+eoy4TKiLFSy7JbrilE9Z32ja1h?=
 =?us-ascii?Q?eq4Bo8geF2rBg08ZO25RQV4YQOejJc6iVqDEvR97lg0UL+Gm64Uh+oW9kUaP?=
 =?us-ascii?Q?Up+whNEhun1N9R7FS5Khme9KpAG5UXRdirD82hCBfDZG3DvIp+D3H5+bpNE0?=
 =?us-ascii?Q?MWs9V70u256lSOf2jsMMuyZLHU7ud8h61Mx2K3PXefHAFonaqwuEmYkceZXt?=
 =?us-ascii?Q?AM2ewK71XLL4Y8HDIhLmKACKd9rTI5b5TAI0hgTd/NkLhh1vIyz0806+NdFK?=
 =?us-ascii?Q?ACEujdw4L2M9P4wc3lK/ryTpTDSLjBAqU4aaFe0EidBJp2S6g6Auwd1CuQua?=
 =?us-ascii?Q?f/Q6JoJ5LFbsgcE0TKJkMLZwvykNByKhqGWQeQ22AyEfsSb0C1S+EqjE+gVu?=
 =?us-ascii?Q?abWHfdmmVen+y5aqSMMQsZFY3mRobFhVkUpSrO6GbuE0DuovSFV8qHgsKx0R?=
 =?us-ascii?Q?clulhIYUQybqXzGhunA9uyC9aet+hb69G6PNQiRq7ZjnoB3mwHGxxpvV4yuu?=
 =?us-ascii?Q?vaVFgWxOLv00rS7PniEqrrcr1Z1+aTfXza4NSa3MBrSquyQWAffkK6oAKnmi?=
 =?us-ascii?Q?YPGe4RHCnjDPtQCcIL1CsAeQHezpqxR9VPGjR7ZvoOoHQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pwfQDPd3n/oJOjOaLovFIapJq4/IroicUjqSDSsc+KRFCjTZ7pM3lF8wTLxt?=
 =?us-ascii?Q?98E+ObhlYA7l5elUUxAMsi9gm7CjUiTWehUY2ouXRYEeYOxfv6VK+4KYF1sC?=
 =?us-ascii?Q?6Kyo1wEVF8GOYaTDB6Ha6d+D4HMY1q/8Cm/BUYlvlrqHkP6XJSVimjXHMSCv?=
 =?us-ascii?Q?/eHXFtP+K4OpZ6y/UbGm3MHTDIbybpmTszdnNm3WGcYXBHPRolGW7Xvp+Ibf?=
 =?us-ascii?Q?Y9eAegjliGjJ9cXvkOhkH4bNR2NYjGtWS1I+7Cqv00kAP7Gt89lrbl+dx5zX?=
 =?us-ascii?Q?akRNhgGAoGL1hb4jEAZmf4qcAtTfGpTrCPEnMmJANLtynoRiMBiQ7KIxmlr4?=
 =?us-ascii?Q?93IQNoM7IFvqIBNLR4XHnOL8R7qoTL3iAYjHUJgtuelVBjfIF2e88bgLOaOy?=
 =?us-ascii?Q?0h8o8EHTiEwWkQbnVK2kGgQ3ruD1pErJGrhapNrqLksUxeUtLbZx3G3iqdmi?=
 =?us-ascii?Q?jnViwcJ6r+R97RhbZlgcN+U3ByQ1YH6nxbiJrxfvWTQ+5BvPWK6MHzAbHYtU?=
 =?us-ascii?Q?K9f0fKv445tZFzyqMRNPxtiBittCKantoYOUupBiPFrme6Zv1qq2J6jiXqQz?=
 =?us-ascii?Q?ZNMuR8I3AWDl8Mlo5ESkMs42aPAARqvRtw6EZi97bt6iEa+rgk031wm8Tqti?=
 =?us-ascii?Q?3uYLl//FWqObYS3gyy/SJ3PY3XnLh/KkflnX+dFbXxoAH1lBCDwzXk9+jqYw?=
 =?us-ascii?Q?IcDuPM3ijy3ddYhpZ6gjMLEgfSGwYQqTnRIWWZR+0j+qGqQ/WIJ53v8joKMb?=
 =?us-ascii?Q?g4SNue7lgLibAHwHnRVJfOyyjHk0VjdBtc0fQe69f4TvDXtmupJkkGUNh14k?=
 =?us-ascii?Q?9E+CzzQ4kK8UCOxKzJLygEa/gFBCJDoMLgoBbsNsOJ32iz0Igo0sApSbKZ0N?=
 =?us-ascii?Q?qLz/lsixspg2MbIV+17Uwyvp8EWBFUfYhgAMAJzLXj5mhAkw1JGFOERrhAYn?=
 =?us-ascii?Q?1JbSP6frjp4QUnJTih5bg7aXvc10c18+3cZsruQADB8tdQya8k2U5M1dUWpm?=
 =?us-ascii?Q?VK8xRCczH8ipbYGCNgHllwu0DlsqmlnVx4nxrhYayuHqZaZbXDVS/vxD6qaI?=
 =?us-ascii?Q?HMrdwYV9BHdGWHnA4Giz3oX6rB4fFX2uPZExmf6S1iPGDJ3mP8s/TBqBD/9M?=
 =?us-ascii?Q?HMWUqIeOR4SHys1m/mkm2hmyFkAn15N5ij3igUzFu9sItCHEpY8GhEpw/dtM?=
 =?us-ascii?Q?OyszCR4WRUcielIzS0mCpIHvin5wASFWJTm0yJH7L21DQigUJj8gd7AofJIW?=
 =?us-ascii?Q?lIpoGLq9F+WfunHeEo47/oU2aus7u2QK9ia0Mv9AFLpgn8NNT3NC5WQoU7kI?=
 =?us-ascii?Q?eckp5/E4sy/wPJSfB7UguOOzEzjdsI5KTcKO1gBs5FmBb+WDTYxrsfaNXjDP?=
 =?us-ascii?Q?rOfHVRyFZSwExn5mKSk3YeRZ9KlITo9LHE/pO1JAdrQwwEeNMl7ArQeV7iIb?=
 =?us-ascii?Q?ywaCbmLRs98PwVvVYg42gbz8ntHHx1NW+twsO0VIFFlFcddLJzHO9uOqhkBs?=
 =?us-ascii?Q?a1/az0KfL15e2GOiNi18z64rz7HIVTAeAbkgcFEOtIZEFNpc5QrZK9Zto1qL?=
 =?us-ascii?Q?XMaCeohwuL0GDvz5x5yjybxSsjbtV0zpvWgr+GGvoTdQeeV1z7Qcp5wiG2Uk?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa832414-c4d3-4167-7978-08dcafdcbf3f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 14:43:01.7676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNID3Z62/VNCxr0u7iZdyoU3KsMNGjjmgMAxyjB/BcKr/G8AYDcfE+MbfOmAscEsFAKMMYFW7hc/i1EX7ig27WUJpRg6cN3RaR/qa93Wu8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7316
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

On Mon, Jul 29, 2024 at 11:38:51AM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-07-26 22:59:06-03:00)
>>Like commit 512660cd1f1a ("drm/xe/rtp: Expand max rules/actions per
>>entry") did, expand the maximum number of actions/rules. That commit was
>>too conservative, just incrementing 2. Other than the ugliness of these
>>macros and additional preprocessor steps when they are used, there are
>>no downsides on increasing the maximum: the tables in which they are
>>used use a sentinel to mark the last element.
>>
>>With rtp processing now supporting OR rules, it's possible to migrate
>>the extension made for OOB WAs that "entries with name are OR'ed in
>>previous entry". For that the maximum number of rules needs to be
>>increased.
>>
>>Just double it. Hopefully 12 is sufficient for longer than 6 was.
>>
>>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>Link: https://patchwork.freedesktop.org/patch/msgid/20240618050044.324454-3-lucas.demarchi@intel.com
>
>Are the trailers above result of some sort of using the original commit
>as base to generate this one? Should them be dismissed?
>
>With respect to the changes themselves,
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

yes, my bad. I used the commit 512660cd1f1a to get the commit message
but re-used too much. I will drop the unrelated trailers.

thanks
Lucas De Marchi

>
>>---
>> drivers/gpu/drm/xe/xe_rtp.h         | 4 ++--
>> drivers/gpu/drm/xe/xe_rtp_helpers.h | 6 ++++++
>> 2 files changed, 8 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>>index ad446731192c..827d932b6908 100644
>>--- a/drivers/gpu/drm/xe/xe_rtp.h
>>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>>@@ -374,7 +374,7 @@ struct xe_reg_sr;
>>  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
>>  * @...: Rules
>>  *
>>- * At least one rule is needed and up to 6 are supported. Multiple rules are
>>+ * At least one rule is needed and up to 12 are supported. Multiple rules are
>>  * AND'ed together, i.e. all the rules must evaluate to true for the entry to
>>  * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
>>  *
>>@@ -399,7 +399,7 @@ struct xe_reg_sr;
>>  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
>>  * @...: Actions to be taken
>>  *
>>- * At least one action is needed and up to 6 are supported. See XE_RTP_ACTION_*
>>+ * At least one action is needed and up to 12 are supported. See XE_RTP_ACTION_*
>>  * for the possible actions. Example:
>>  *
>>  * .. code-block:: c
>>diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>>index c59e40fd7fff..a33b0ae98bbc 100644
>>--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
>>+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
>>@@ -60,6 +60,12 @@
>> #define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
>> #define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)
>> #define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)
>>+#define XE_RTP_PASTE_7(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_6(prefix_, sep_, _XE_TUPLE_TAIL args_)
>>+#define XE_RTP_PASTE_8(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_7(prefix_, sep_, _XE_TUPLE_TAIL args_)
>>+#define XE_RTP_PASTE_9(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_8(prefix_, sep_, _XE_TUPLE_TAIL args_)
>>+#define XE_RTP_PASTE_10(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_9(prefix_, sep_, _XE_TUPLE_TAIL args_)
>>+#define XE_RTP_PASTE_11(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_10(prefix_, sep_, _XE_TUPLE_TAIL args_)
>>+#define XE_RTP_PASTE_12(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_11(prefix_, sep_, _XE_TUPLE_TAIL args_)
>>
>> /*
>>  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
>>--
>>2.43.0
>>
