Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B02C531CC
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 20:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486BC10E0A4;
	Thu, 19 Feb 2026 20:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DD5xJnrt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16A110E0A4
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771532228; x=1803068228;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NMpDV5h1gSY9RLHreSyIRojYytuh32YtFOt52rnBtsA=;
 b=DD5xJnrtvuo6nin4XfT17ZqAR0OkeqP314KBrYKFjTQ1BdmWnwsDKaoT
 kMvWRwHm5Bdin+z8j2y9qZK3M9wEDuIy0Ll1IXw8luIILF0sEkLkSN3kG
 72W2ksP5GrVJxGAo2407ZBNaQt0u6euS0MjlAk7zEQP83BwpyeONdvPtV
 PELEjM/zbmx7ElepR4VyShYgeAlghFNfvhi1UhZMJUoWHvJysJ0n1VYgs
 AVqt3oocxPsSUVTt8WdSCDIUkVBhvplfVj7nJzzuMrEG0Hcs7HyJtjpV4
 D/UCLysgu67fPKzJ3CO+wqYihE7fevGXzLRQsPYIkmx+d17SguXj2rFMo Q==;
X-CSE-ConnectionGUID: vfYxNtAOSpaMeFln64US1Q==
X-CSE-MsgGUID: u8QWQ1v+QVWLivd5XB1yTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="82954894"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="82954894"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:16:56 -0800
X-CSE-ConnectionGUID: bVCKjaUbRCWnF7nTsMKXng==
X-CSE-MsgGUID: X6Yv33BlTtiExO8peculbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213873030"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 12:16:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:16:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 12:16:54 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 12:16:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRj7ORcisdF9GIvv9yLElE/f+aNa10wRfJ4JSE3/zrbqTO02UOLDjwGwqtcNUZTXN3Ki/2PZJLp5ID00OWnY2exmtV7zTaBrwpk92SwnM4Ebjmf5yZ7oyZsX+FJcpjOOxeaoFghZmdy23qocsZxT6+fyOl8wskarSO6SuD+a6EstBqerxlh7hcdSERv5oQcAyb+SxdNe2JDo4iPhEdSj/20XOeENCOWXXQnUp8ZszjKrJW5lufbVI2ThUNomW2OfbsphOFNHLtjJHdYDLKNJWgJDtKI9e3NNoIdLKDCsE80ppKNBmAiHxojXadYlgEhdllXSd7elJtnzBNMA3YlT4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7efBgw5oEKKkqg56Z+EGaVQmy8GwZUeXrpFKTCMaK4=;
 b=R7SH6MWK8djHEmgBn1JAlWUfeHwd+nWz4iE+JKHTaO7eT2N6S0qP4jp1b0uBIMcqDlCRWlyXle73bxaU27oqecwd1R7IKBq0JGvrRjIJ4JEHjpoqI3VTNDlLwDri9MZ45GxrsnaSnMdD9ZEEXXSqQJqGNvqyR6QLuFGmOPBjYqMrvVbhv0LoHD1z5KlKA0dpSn76R7Mp5xuzvrlzKxdgcUhx/tRyKNErwE71cjQf+WMmj/wpQhvn1KgdSgXB9YAq+S8DGiCvo+yzkmcJaWkIu/Qt+Tvg/+6GMnnVnmC7ZKpGqNFZUbWG+47mSDr1dGo0K/aMGR77DIJiKqOknDO/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6275.namprd11.prod.outlook.com (2603:10b6:a03:456::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 20:16:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Thu, 19 Feb 2026
 20:16:51 +0000
Date: Thu, 19 Feb 2026 12:16:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/vf: Wait for default LRCs fixups before
 using
Message-ID: <aZdvsX0+ST//Lk3B@lstrano-desk.jf.intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260218232159.1726873-4-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:303:8c::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 9269765b-1089-4114-6cf1-08de6ff3d187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5FVMAqtlGmg750GxsQ1lVBWmJUx7mooUYkdA4DBzOBHe5q34tzKlhRHGhWn3?=
 =?us-ascii?Q?cc8XYRSfEPYM0BYdIkeZ/UTZhe4V2R18CIw419WHNVx4hO0Ib33/kYgjwG+F?=
 =?us-ascii?Q?F0Ho7AMl2s599uRWhu2SWszUbAq9SPIbRMtzouwpBZmtzPyOicPEKVM7gng4?=
 =?us-ascii?Q?Mkkdu55IskhI91UIZSd1JcEq68y8oFWWMQJlHHFEyPo9Uj+vtBfdaa9mlVQq?=
 =?us-ascii?Q?mMaZadTCKHqZilZRUZQc3P4VBCuk0s1EJiH0QFRMBNTwK7mSwJmM16fjdFzs?=
 =?us-ascii?Q?fSX3wQlLakfHktbjSwYwn7qRP/Tit50hOsWRGj2I9sB0x6FyxMxWkqXYYA5o?=
 =?us-ascii?Q?Cv3oisUe9wtdnVoYi970xKLFtSFWweXofBONSVIhQkzNBR7s5WLqHg7jr9j4?=
 =?us-ascii?Q?cmgS8RECKBq+Ht5p0r3zj3RnjX3uGkHpgxFXzdvopxqhYxm4R1fXhaZo4nGB?=
 =?us-ascii?Q?jPs7QJJVVSsnc/FW2a+WAZCg4mJlNmAh4f+hKbhXj5jHcqDnMEKzH/iO5B9R?=
 =?us-ascii?Q?h1KufZsPXgikAIxKaMqsfjnUcHDB4ibHF/MoOA7PPLr46QX2qK/ULDW3Cgki?=
 =?us-ascii?Q?4xiWARxQw+PXDuciS/r8GTGCLZku+Q+zjqoC1xrE+XleD1/OzTGViWTGP8qH?=
 =?us-ascii?Q?QuysCWRTZuCvoXNH0UBjXI7v6UiGUtSZRWxvWBoRoU876SX+zQ+CuT02A4FH?=
 =?us-ascii?Q?jPNerN0wOx+DAAAjfbbG/K2Z26Dlt1IdfKpl7p+LgmBqjMrNGo0Z4NrxcnOF?=
 =?us-ascii?Q?rkxUK0Jxgwt5nd2InQwGsvKPYJhFxbPYL5J4XPoX4PrNWDPrfdeKNCaEx99L?=
 =?us-ascii?Q?FORJ6oDcinNMPD37JqKpw5D2cTdyYrU8je9Li6anKqbi+NRHFjcHAnWS/uq8?=
 =?us-ascii?Q?6afJuUHT68KdabKuUjOP3uc/+m1PaA6oTfbWRk7qYAluoRYF65XP+DlEXSEc?=
 =?us-ascii?Q?ydekxbrlBnpcN2knO9ZuPp+LGEOJJr5TmIHpJ+0cgMUGriYHrDMtWM0NbdGJ?=
 =?us-ascii?Q?qzBVYk4IRB7fAFFW+0Yi1sC7O3tJKsIhiBwHKHdq+nW876HRNbBFFNJ9oLOT?=
 =?us-ascii?Q?Ga5S1h8r+UrPiqAmaIcfD+lOhhYW1dh9v7PPVsuvIfc61IbWRifjgyWjhRCg?=
 =?us-ascii?Q?Tk8CjXG7iN8x5hsPkzHWsnUcDr4G7KEADocvIz9tKoMYNM7oxNQum3krgzyS?=
 =?us-ascii?Q?IcYWv8EepWVjhFBzf60Q5YSo9T7u+nCXAUy/lFOZabQ+GUGLHSBHs5ool7X3?=
 =?us-ascii?Q?MB+NcaGXwft+8lUylivrd8PbYI7rSRTovj6Ht9mBuFJJ0nMqA71tnyOOC8PI?=
 =?us-ascii?Q?MO0rjbcBd/Sul2rXCczZ/lBNHfrjZldppbCbbaOQ8yTRmtim+Wt/Y0Eqi7Sm?=
 =?us-ascii?Q?CQB5KFZzKqA8CIKPfx+tRUxlat1e6Q71eCjZzMbQxP79jbZS8l5mPfkBSFSb?=
 =?us-ascii?Q?0Fo0U34bp/WI8ZppRNYDfzgXxBTbUqXdwIwNsAWoZ54eVybDZ5+iIKm/7k9I?=
 =?us-ascii?Q?0jT7F29RfX8FBbu44skVbRHLDA63sUI2gXAdLFZb5nKSzwFwAs/z93bIm87Q?=
 =?us-ascii?Q?K2VNbY7QkeqMJ4mBYhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96/EyruF54sXPQv5fewyWqSSEpfIFhP5ZhEM2NWx0UPcpMfjsZSTGqu8k8Cq?=
 =?us-ascii?Q?fz4KZtajzC8Y5V/MIT4v/G45Nl3cjwo6uk1tZuozdGbrD0KOQleW8WehWtRq?=
 =?us-ascii?Q?MpqrONa3uGcaGBP3n+siZu1OTdR0deLkLFnCgm5Blb8AUKLIEHkZK2Mc6Chs?=
 =?us-ascii?Q?NwSA28noUD5UiKv6X4R65uIIuyF6r5nbiqk21KQdxfvb9S0t2f5V2orhOVUW?=
 =?us-ascii?Q?JDEtbtWzVBZCyz2s1nLpXxjR6UZ8z+whSmtQPO2YfJ5ueSTEQ9RRf4BIdby6?=
 =?us-ascii?Q?844Bd/vxW2WVXDnJE2vEWJaZR290NsmVFCvLwbgX3CfPcRUkf+zemyoFOI/M?=
 =?us-ascii?Q?Tu+Cy/zD1HxQZydwgDH4uAwIGxzW/hSgJuci/hX7KI46p4TBS97mQ50i3yW6?=
 =?us-ascii?Q?SASwxMTFIh6KS5wnnDHy7MN9kZ+wMcUglKVwos3AYk/ZJzhyh0wOOJsmOoMz?=
 =?us-ascii?Q?0iwxmzIHAeyxP0OaTarRy54Yrdp85bH0zG+3WSKrBkYduZ4rqqf7H1dxB4VT?=
 =?us-ascii?Q?GSthSxjXDWGmVAgEY8IaR4sY8bqz0Zu1s/niyHI0n48CxToUqPXZFrWnQPKC?=
 =?us-ascii?Q?qV7D6+noQEh/moS+wBf2QIv+DvS2fhM+weKxWzrIZvPt19gu42DikyyGOlyj?=
 =?us-ascii?Q?h57inEwLUgtf3GUXUtPA3d6wT+TNYK2k3Arq7I2il8NyhSUcy4qMSGbdCecI?=
 =?us-ascii?Q?31m5ygav5WWpBCnxGT6hcGM1GI2WVRZn+HyJG35VCe5kzVMSPWHH+SDc4+Sg?=
 =?us-ascii?Q?gRuZfu1ShzGQ5D7Nbrqf9B3QO6COyTTdOs0NeHWbMOCzinGXYLMyp9smzDUT?=
 =?us-ascii?Q?dVVHc5bgjH8fCbCUY6Pw0OUecirRFADVL1yIXbNM8DxvaIsVR/h21TN/g/em?=
 =?us-ascii?Q?Gs9+eyDshz3N0Cn2VSOSGW5KswLNZUZa0OC+gfGNuX5wAiHXeKbbwPGA4d5M?=
 =?us-ascii?Q?6M0Vn8i/cq4b7yAVZKu+cGWr/tAEkjr+SSemK2s4tdyElNs+gFS/rYSsBnhD?=
 =?us-ascii?Q?itFM8qIc1yWaWgwrRhUL2TMd4NAHQ++W94JS4QXmxm/mSUq2Lrc8pc2zPgGJ?=
 =?us-ascii?Q?IYC8DKsabxNHTmCqLkHcOZ0IkY76PuQ4oPbIEeJ0FrCQxzUC4Idz0e9KHIlt?=
 =?us-ascii?Q?Hz/zhdvJLuz0n/ie3k5isJA4+TaTf3ijgDDZTg4yea9Se2Z1fqu5A8Qwa6of?=
 =?us-ascii?Q?7+7UhpDYobwqnfzMWkYlAkNv8gN9HYnn4SxInCPWr8yyCr5kqTBnYji18Y21?=
 =?us-ascii?Q?w529b11bJMlFyfCyDtTcnMmyGSCemPJftMFMuuvXIrrdm7+DQi2JikWhhr+6?=
 =?us-ascii?Q?iIM4M71QNTkqRXAghr9AA63UCgbZc4A7yoNYIJZgWInPXh3B+zQem36bBO7D?=
 =?us-ascii?Q?vDZpbLhQK1OpKWHiit0GsAVb8N6/TaYr7R44Df77bKuDQtaNLTadFAOSuoi5?=
 =?us-ascii?Q?2tiVY67+Y8KcKc0hPoDxOLdjhZQlO/RyQuSZjQL3ye5oKI8FwKBAtUlhHJZn?=
 =?us-ascii?Q?nDj7ZAiiewArcFZRc/Klp4Y/ZEnYsqzwsIeAOPSdMTiBUNIkELlBbImxnUDg?=
 =?us-ascii?Q?PWR6c4dcI5b7TO5wF1ESe4eke4Sw/8tWLd9hmml8ykIIQTULNcGPLgg0jGhm?=
 =?us-ascii?Q?uPLgQv76iqpLscdiLYZkCtIM4Xzw8KbGuxuVcodrmVBB7p6FDx+qArOLUYDM?=
 =?us-ascii?Q?EIdBN8QN6eUcykwaRgBjrJfIqhm8CwDREIeKPzayFTzAh6SsiTLxAMU7Sjk0?=
 =?us-ascii?Q?3uZFqWq+p6u3m9X4+j7SHmLrfwOEQ6o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9269765b-1089-4114-6cf1-08de6ff3d187
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:16:51.7481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3OX7EjNKoTRLhwpbWJNqryRjQ+inAZXTtxeiWYV7y9BxmA7JU6dKKHN7tCb9JkX9RLt4mfWioIiUE9s30vEOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6275
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

On Thu, Feb 19, 2026 at 12:21:56AM +0100, Tomasz Lis wrote:
> When a context is being created during save/restore, the LRC creation
> needs to wait for GGTT address space to be shifted. But it also needs
> to have fixed default LRCs. This is mandatory to avoid the situation
> where LRC will be created based on data from before the fixups, but
> reference within exec queue will be set too late for fixups.
> 
> This fixes an issue where contexts created during save/restore have
> a large chance of having one unfixed LRC, due to the xe_lrc_create()
> being synced for equal start to race with default LRC fixups.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>

This is better than what is in place, so...
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

But I think we need to close on why my suggestion in the previous rev
isn't fixing the issue (off list discussion). If we go this series, then
my RB holds for future revs.

Matt 

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c        |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 24 +++++++++++------------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++--
>  4 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index e9396ad3390a..6eb561086e1c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -309,7 +309,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	for (i = 0; i < q->width; ++i) {
>  		struct xe_lrc *lrc;
>  
> -		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> +		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
>  		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>  				    xe_lrc_ring_size(), q->msix_vec, flags);
>  		if (IS_ERR(lrc)) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 527ded3c9c22..5ce06031018d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -536,12 +536,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	 */
>  	xe_ggtt_shift_nodes(tile->mem.ggtt, start);
>  
> -	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
> -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> -		smp_wmb();	/* Ensure above write visible before wake */
> -		wake_up_all(&gt->sriov.vf.migration.wq);
> -	}
> -
>  	return 0;
>  }
>  
> @@ -844,6 +838,10 @@ static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>  
>  	for_each_hw_engine(hwe, gt, id)
>  		xe_default_lrc_update_memirq_regs_with_address(hwe);
> +
> +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
> +	smp_wmb();	/* Ensure above write visible before wake */
> +	wake_up_all(&gt->sriov.vf.migration.wq);
>  }
>  
>  static void vf_start_migration_recovery(struct xe_gt *gt)
> @@ -858,7 +856,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  	    !gt->sriov.vf.migration.recovery_teardown) {
>  		gt->sriov.vf.migration.recovery_queued = true;
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> +		WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, true);
>  		smp_wmb();	/* Ensure above writes visible before wake */
>  
>  		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
> @@ -1303,7 +1301,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  {
>  	spin_lock_irq(&gt->sriov.vf.migration.lock);
>  	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> -	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
>  	wake_up_all(&gt->sriov.vf.migration.wq);
> @@ -1499,7 +1497,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
>  	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>  }
>  
> -static bool vf_valid_ggtt(struct xe_gt *gt)
> +static bool vf_valid_default_lrc(struct xe_gt *gt)
>  {
>  	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
>  	bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
> @@ -1507,17 +1505,17 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> +	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes))
>  		return false;
>  
>  	return true;
>  }
>  
>  /**
> - * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> + * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT refs in default LRCs
>   * @gt: the &xe_gt
>   */
> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt)
>  {
>  	int ret;
>  
> @@ -1526,7 +1524,7 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  		return;
>  
>  	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> -					       vf_valid_ggtt(gt),
> +					       vf_valid_default_lrc(gt),
>  					       HZ * 5);
>  	xe_gt_WARN_ON(gt, !ret);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 7d97189c2d3d..70232dc38f9a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -39,6 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>  
> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 4ef881b9b662..8be181bf3cf3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -73,8 +73,8 @@ struct xe_gt_sriov_vf_migration {
>  	bool recovery_queued;
>  	/** @recovery_inprogress: VF post migration recovery in progress */
>  	bool recovery_inprogress;
> -	/** @ggtt_need_fixes: VF GGTT needs fixes */
> -	bool ggtt_need_fixes;
> +	/** @default_lrcs_need_fixes: GGTT refs within default LRCs need fixes */
> +	bool default_lrcs_need_fixes;
>  };
>  
>  /**
> -- 
> 2.25.1
> 
