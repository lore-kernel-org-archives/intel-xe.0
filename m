Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62CCEE0213
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 15:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F2D10EA3D;
	Wed, 11 Sep 2024 15:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3+J/iYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E09210EA3A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726070330; x=1757606330;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OoyoWCymdk/lE7vYIkZwJoPP3OIDVABLyowMiaUcnBk=;
 b=a3+J/iYSq76xJFAplHLlzxzgPCbeYxCir/lWTaGdMbFwPRakui5r2EDA
 JuozdWXNkvSFC86T0fnZPa6PPxzp1aTrwV4LsWOWAxWXAx4rKxWrD4nln
 xgImeKmoyMsrx4XpAemH/c9obY0eiwWjNcpzEpedet9Z8OlSettsTNsRa
 QQ3BFMRKvn2cxxhVfl2rMW8ff9ZQtyytz3bdT1WSokrfb2b4rhBca8oPs
 TJma5RknBYtO4wLj7LALEfwbwlkOrAwcp8bdeskM6zhOiyeFQ+2EYyZ64
 Y5l2T+yA85zZnOneusvQZs/IHTp8VehP1qosW+cp9vLRRrlHyD4eo6Faa w==;
X-CSE-ConnectionGUID: NCTrr2ebRdeuuIHhqJHTtg==
X-CSE-MsgGUID: 9ZfL28QNQJmBhSr8Ogw8NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27799394"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="27799394"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 08:58:47 -0700
X-CSE-ConnectionGUID: O7pIXUKMRI+OmXhelL5rvw==
X-CSE-MsgGUID: m4I7RfOxSfOtTc1Mh6bbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="71550402"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 08:58:47 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 08:58:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 08:58:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 08:58:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMrr/ozQ289oOOC0ONjyMC6iq/JMwde13G/vQBtopreXgFtc0CVj0Bgx4sS9uGXFCm68GiWqR3WcpwR1z6pMVLiYyFPdbsXpH9VJGd8Phz1gVBvjhf3PCKF9xIg6xRV6TuB+Q4l386l23yH79uGIb9Jcv49RJLr6Jkk1QjPDixcKQH4CONBHA7GrzKR0Yg4m+Hjb0ARV/LCFsHYy1J71etuo3cAx3PnYFV2eL9NTd2SXjeGglvMgd4N5SJSDvv4ymvrs2xh+5m4dCFdM3LcRld7tl9CR/ul+jyoFbGGzPgmJ1Q1GvUVdLTmxxAK/tl3p45APUnT18oGNP0dOXNAD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyVmShQf3qPjBdq3AjdXn7R1zmTAswq92nmbKSxBxPY=;
 b=tWLmGXtL3aEYoMJgwKa94n+Fan1I5mVc0Y9+dgF/sGo9DaT5V9cNl5/NT/ZO6vK4T9pOpzIhCXlMjl/J2WL8sftDFLum2/Dq7H4seH2n8jXdZ/DNof6QJjV5zk6Hutr7P6706otcWsa3hvqUk8WOw/9pReGM7pX3T3/ChwrBX4Q9C5JU37NQcTd0Qc7cIsoIggHxxAqd+j9VTXvCfWuE+ZK4/gR/lX9WiX/n8nlO8mFO7ZGbxVouZhcTL3T9jGVMWEkNLaXVW5qRHqJFxMIWwfPw3vMPxoa4kzyz4zR32kGxQ5FKqgbz9JLSafTDkWavvGczqYULlcgOvg4ZpNQT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 15:58:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 15:58:34 +0000
Date: Wed, 11 Sep 2024 10:58:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Jose Souza <jose.souza@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Enable Xe2+ PES disaggregation
Message-ID: <h6mii7lhc75b4tqzbwyfel7jdnubwlk6kdmo7wphul4zl2t6dy@ivkxfq7ebw52>
References: <20240909165933.2638765-1-ashutosh.dixit@intel.com>
 <t7zip5kycyg2rtnzesno5rjlkdfu35idee6fk5sn2purbif5wm@2qxutmrlwj2y>
 <87wmjjyqe5.wl-ashutosh.dixit@intel.com>
 <slkwdfygztw67triuhz4bihzqke2yrmgyfptbw43tanx5x5c3d@rcz36pcnshap>
 <87ttemzsqr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ttemzsqr.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:303:8f::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4899:EE_
X-MS-Office365-Filtering-Correlation-Id: 466a5bcd-8742-4a9b-f295-08dcd27a9755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oVQciIvzu2CtgzZ5FCQj7l1sO9C1grqwir9dEil8GQErCU8Rt34zCQIkpAc5?=
 =?us-ascii?Q?QRbR/ftnyOsH0LNVzRxXlmP+zIV/4syBdt3WbZgyl50sTKfgt7INraUohsTN?=
 =?us-ascii?Q?xePmVUwhj22pj7ij8wKEBIQrpwlEyyNiIvrYTrhuuFxstZ925Sl2hNgCpxpV?=
 =?us-ascii?Q?hNleA2nAA2Itywx62SC55Aq4cLuge6ChTpD4sOKgItoDUCU0s48GKclQmR96?=
 =?us-ascii?Q?T/ZGTtflu05hxnZSkfW29sNQtLkysYAd/HIXomIBUu88DFZpskgoHRnVEWlb?=
 =?us-ascii?Q?UnljcX7efEGrlGpM+Y6SB27Dr1EVwREMVzJ5v7zj1iJ2hB0oGlVQVo15u6EM?=
 =?us-ascii?Q?jP+nAwDM+iOMcbgQPh+ZXrs4ME61flddZzwlJpMhtcDdEVAxFP86uu275Hv8?=
 =?us-ascii?Q?SoHHBt+kJvkC1uafKPK4N/GS8VWIxZsAOrCG1V5uAK54q2YrYCmVqIAsFkhd?=
 =?us-ascii?Q?qC0ghQFH95TgBNmmSKL7FYPFX+K4lc9LUC0LLnhgoqQ73a28XtWm98BHZlUN?=
 =?us-ascii?Q?3fV+gnN05lZMoZH0iP1bOLCbYjZMJsykQTBCZclH4uBraI69mWNHQ8YiyQIe?=
 =?us-ascii?Q?ss4gg2SEu81xUyId+4o3tLdEXB3RhFxQR2Kz1itZrOEScoBxIrJXiDoSVjcq?=
 =?us-ascii?Q?Gb/EbdMwaX3ZfpYSgkk4aXpbzc3/kFldcGBsFJ9KOiTnfz45Y5pW8t6NONxb?=
 =?us-ascii?Q?XZiSgXjOB4pb7DbGiII8WLPjYYvKxAJF0C3cNaYHKB2ZkT5hFutpekYan9OJ?=
 =?us-ascii?Q?AdOORik35TWX86L/ezYpDS4MPYMt4m4rY/zweMPcE+r5TAdQ/FqAjc0WyZRo?=
 =?us-ascii?Q?nB+OglKxTd3s3MDn1KMCV0vWY5NGQ5vBhEJs9bqelXWr/z9msMkUgbTsm4kO?=
 =?us-ascii?Q?7w9cfetliwNLEkpmq8AMRgiKblwOO1j1MK3iSnw4zaBC5XKxq9hDVoDjG11c?=
 =?us-ascii?Q?QF22ulsuwgH9vrzpx3GTw8zwagxx6D37Cge4Dnn9tNzgpbtQvxdEdjwDX9m6?=
 =?us-ascii?Q?I3g+tfQhReiiPH+zqbwYNRZhmkbJ8R/00vUdpVXBsY2AvlVUX44VfGhAicqH?=
 =?us-ascii?Q?pDKqC004S3KLDPp4IEOCioqtc5BU5dq8tXC/xPg8+Uf+Nh1Hvi0r6c3CIJbb?=
 =?us-ascii?Q?8izsNU1RthsRvQLpFOZFbpa1g2pcAm+UDoeUKhK40G00ZaMYRnHmqwdTkTZX?=
 =?us-ascii?Q?BzDubsaxdE+Wm4q3D/vJsJ6ra24945uQQ8e3JBN2nLk37telCVUA7Es2vbRK?=
 =?us-ascii?Q?PRWNoTt3rRZDS7+dpaQ8omOMYPB3HxkrAZ2drajo81F/OtpM8U6tCvIA28OG?=
 =?us-ascii?Q?QipkA3BGKE7LeqKGknppvg85DRxGlM8cesisT1XZ4eszAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U44rKhnU7FEor2Cj0KWJyE+WmtfFgXaBxyaBgBrkZz+TouAh3rv4lIokk3tz?=
 =?us-ascii?Q?6qkLaiPoUJYjzTNv6xvTtCMJGdPKLul72TvKOxpn9LhX/LnAw5ol/AXQBtIF?=
 =?us-ascii?Q?MIKouu4XZ5MdUy+0n0BP0UhTPCqOIjHkzG1gSL3aOwL9Bp3vMnEujyf3W7vD?=
 =?us-ascii?Q?BA97+MIH7urb/owingKaL9VhCxVsPfI4pwPAqXSFn6H/yQEwumuJxMAa3q3a?=
 =?us-ascii?Q?FBdi3YnVCuXmJUaGweBLzMB9Z2RwPx61Y3no1CAc+LD203ECvkfTy20SHfs0?=
 =?us-ascii?Q?pE9G2HR0ZN31izfTe9pon4SsAU5BDPvIwwllllGUFJmKFyBYqf3pGeJdpr0L?=
 =?us-ascii?Q?Pe/0Rl6LUR1ihjEBrHjzGLpZc22abtNRQHQ6yAhSlYFDYIQ6FIiEH0eTM+1x?=
 =?us-ascii?Q?/O1DNCDmKDR3GRaruTHu86x5jaQXOcV9EsaxfjT0MzYusOVe8TXjqrxypDwA?=
 =?us-ascii?Q?GElRp0uw4R6J7ffT0Ql8Axy/7szc6SXpLqxjUtVSddZtROfDxBxcml1ecDnu?=
 =?us-ascii?Q?K1/7Et9iaEG50a0JdfhWigFyBQHwqLqLLDrF5X4BNzBdB7DQyHCYWKNtYtfs?=
 =?us-ascii?Q?fkvCSdjP6vSvJ29lR7vCi8fH9rDNHI3gytwSYc0NXxwNonLJQ11mZieDKeq7?=
 =?us-ascii?Q?v29Zkz3HSIWPTNU95HFHGWtbP48cisrnCqUCEkSuvy1QEw7LXnxVg9U1m8dp?=
 =?us-ascii?Q?2LTg9Jne2uqhLX65YFBu0VHzIu/3fOBl5iiiSiL2KZOw10Lo8O3isdWFsugZ?=
 =?us-ascii?Q?9GVnaBp6sRRzyKdEY5817Dg6awuRF5e3HcxIBqn0iyV2X8DboyDO+ygZIgn5?=
 =?us-ascii?Q?tJvVQApNVF9EvX1XFivX4NpOjDIIl1Hi2nWr+kG6LZXrL8XFl5Rca6A/xF0R?=
 =?us-ascii?Q?YemrkSNELglsC8vcGUcvrMTLEGyqSQ/8Ahy0Q59zDLzcgESS++FOBfc0SJig?=
 =?us-ascii?Q?L2InnP/wzpsGBIwvFo0aYb3RixoQn5bpFZq/7eNgPdJXmrmYdUcnXO7T3PNo?=
 =?us-ascii?Q?xSxufzyWyFAobG7Sfe9DeT9B9hMzuQrqF06zySCKl+BvxxLE77RtmJo6i8WS?=
 =?us-ascii?Q?HtkKowQG1cGvtVMVs3JPdmTqx2xu+0BAzH2f2u3F4e3xbMFnis3KHqwV4mMf?=
 =?us-ascii?Q?gb4ofcnjscyii8vd3EkB0fOgTONyxgThPifm6lXIQd4yDuCwpFSGd62ERypw?=
 =?us-ascii?Q?Ydse8xcQ8rSaxHrgMHQVg7nPYFcEaCrvKQ6Ie+5vD7l6lfx6YgemlteCfTct?=
 =?us-ascii?Q?Jdsxf/IrXqlmzSOnf0tAcCxwlz92BbFQ5C0WBHugrI7LI5cpBykiEFCi6Gk8?=
 =?us-ascii?Q?rypeCNEgGEh3y8nliot0/a6vP2uV0x0Rlyw+KOd80XAWvCqtnOCUIKpmRly3?=
 =?us-ascii?Q?1BPNOTfT8RDmDi0BnUlR5+/qhDidFVPqpUDzPbyLq6Lx3cmN2rSOOk3AjgrU?=
 =?us-ascii?Q?WyjFVYV/qYXBFJaVsGw0Sbewh0YNZ0s0IjxyC1CoW44OdA5/uTTloW+UW8/e?=
 =?us-ascii?Q?eIhg8FyX6TpGLky7s7JuigorrB1gMKWXElKZ235oMXDlKhS2qYsf3jEv1LYz?=
 =?us-ascii?Q?C+Ltza+wPBgLgZ1KjIiCaEEAC0KNh8gW+HU5/Dwl8HG9ePb4wPhWpLlfLDMa?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 466a5bcd-8742-4a9b-f295-08dcd27a9755
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 15:58:34.8569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxY92XNkElfcapX9bijSha/v86qs5VDeyfik4BRKn47eTczLWeEl54XBEwQl2Lxq0d0HRajf3x/okcaJGUvdoP1C7jeMvrvEeRZFB8YrztA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4899
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

On Tue, Sep 10, 2024 at 10:03:56PM GMT, Ashutosh Dixit wrote:
>On Tue, 10 Sep 2024 17:57:59 -0700, Lucas De Marchi wrote:
>>
>> On Tue, Sep 10, 2024 at 05:40:02PM GMT, Ashutosh Dixit wrote:
>> > On Tue, 10 Sep 2024 10:04:32 -0700, Lucas De Marchi wrote:
>> >>
>> >
>> > Hi Lucas,
>> >
>> > We had a whole email thread to figure this out :/
>> >
>> >> On Mon, Sep 09, 2024 at 09:59:33AM GMT, Ashutosh Dixit wrote:
>> >> > Xe2+ PES disaggregation for OAG needs to be enabled to obtain disaggregated
>> >> > metrics when disaggregated data is needed. There is no uapi impact of this
>> >>
>> >> it looks like the *control* for disaggregated data is only available on
>> >> xe2
>> >
>> > Correct, that is why the check below (also this is available only for OAG,
>> > not say for OAM):
>> >
>> >	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>> >	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
>> >
>> >> and we always use disaggregated, right?
>> >
>> > No we don't, please see below.
>> >
>> >>
>> >> > change.
>> >> >
>> >> > v2: Minor change to commit message
>> >> >
>> >> > Bspec: 61101
>> >>
>> >> "Note: After enabling desired disaggregation mode/s using this control
>> >> field, PES MODE_SELECT field is used to configure appropriate
>> >> disaggregation mode of corresponding PEC."
>> >>
>> >> Apparently MODE_SELECT == Aggregated is the hw default for xe2. Don't
>> >> we need to program anything else?
>> >
>> > So the code in this patch only enables disaggregation, this additional step
>> > (PES_MODE_SELECT) is still needed to actually use disaggregation. However
>> > this second step is done via OA configurations which come in from userspace
>> > (using add_config observation stream op). So userspace can request either
>> > aggregated or disaggregated data depending on the OA config it programs.
>> >
>> > The goal of this patch is only to enable disaggregation so userspace can
>> > use it if they want, otherwise they can't, they can only use
>> > aggregated.
>>
>> can you add a paragraph to the commit message stating something like
>> above?  Because it was not clear it was intentional to enable it in the
>> control and not in the PES_MODE_SELECT.
>
>I have changed the commit message to the following:
>
>"
>Enable Xe2+ PES disaggregation (for OAG) to retrieve disaggregated metrics
>when disaggregated data is needed. Userspace can select whether to receive
>aggregated or disaggregated metrics via the particular OA configuration it
>uses (programmed via DRM_XE_OBSERVATION_OP_ADD_CONFIG).
>"

looks good to me.

thanks
Lucas De Marchi

>
>I think this provides sufficient high level information, not bringing in
>stuff like PES_MODE_SELECT. Or should I mention PES_MODE_SELECT too?
>Thanks.
>
>
>
>>
>> thanks
>> Lucas De Marchi
