Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ED1C2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 20:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B46710E0D5;
	Wed,  3 Jul 2024 20:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdwW07iY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACF410E0D5
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 20:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720038805; x=1751574805;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PtiniNKHNA7FOb6mzB+9utfFbBtCZSh8RwyfDhmJqmo=;
 b=jdwW07iYA8tRRRfR/4TkN1j0zCeE7LLFtnEJt+da6uBtdJSVHItLqEUK
 K8xQFZ8sz2L5rXFf81WkqWHzH+u2kwWOTy2X0KdNh2BlYXFdlW1Ge9Bhm
 G8g+JIvBLY4NylMIsFfmdtYB7SGbX1KYbNBJfTmJzoSyD+yKRhtoiqD1F
 qstZZr1alTyObhGlaJRg1iGkOixkRxbc2QaAAMNjsPHUyhDJS7ugS20j+
 Wv8EhbGI8BLAg2wl/xhVWvef/89uhDa9CN67PfLTv1chuTXdcqJky/Gp+
 83ihXfb5h0iUSe1DawGpFZU+UqfQYo8AkZkxjBSpE/0fikbTc10Zx15y7 w==;
X-CSE-ConnectionGUID: aSRD17AQSj+wKiJAeRw1Wg==
X-CSE-MsgGUID: Cg103c/vSTuCPczNA4By7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17433283"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17433283"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 13:33:25 -0700
X-CSE-ConnectionGUID: u+yzvUHTRRm+whnM1xF+4w==
X-CSE-MsgGUID: nw7zJJ3LRKas5Bog/5ry3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46311666"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 13:33:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 13:33:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 13:33:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 13:33:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmeafzlUs22GrMLcZ0UTr+DGVXxSt2PrEHx0nnd+3HAq+UjgpPvvF8zbphbjV8BqVxNoWb/6pGhbM8yrnOuqp47lINY3xos7VuS22VbQ/+PliCkVhdmax+/i9qulUSWYegXO8JnTOCPBXYt0Xqd/x4WZnuPXdOkf8HZx+tXn0cL/qAPkdHCggLRFuS2FZoJUruOU/5Wgw3Kcw8fPc8YkpAgR7wrVO0Erw0yLNK7eOSLpA1/bM33C7FdMx3H2RZho4ZMvhWItMQb5FZ7abtTuhOLAm4Z5huY4u6K9Q77koH86TSs0vibyrsje6X2azFXqI8pa+oSH5Wuo20TF0TBPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRBkzkmn5uFGcP0bc5tVmDY3kPpkL/HZOEHNsYB8b5o=;
 b=iNPT4H42H9pJYSHAPloDnzEMRPPxUy/y1CW1K41j15uN7kfKmB1TOCQao6HF6CQntO3uP2sBMDdVtpa7eeDxh1fL8sYsNliHnMb3NSY36cGoV5fNQeo7DvNNvIlFLtDzdI4wrU/x9zngSvEhWmclrJaDAy0287t8L1LuKNmMtqonpbCTxYOkW53sql3e1d3rGGvd8WuYvH2z2sr+Zo/6k6ZomMSoYmsZM1Yu13v5Jp+ffIHAumTIJXC4FM/w06gbrQ73PYC6G7ce+GAmeTg57cLuH9intBdlIsS0D86LbdK1Nf4U5BnokM4ad55MxUULarujYBucbsZcoVXEbQvIqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8319.namprd11.prod.outlook.com (2603:10b6:806:38c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 20:33:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 20:33:06 +0000
Date: Wed, 3 Jul 2024 15:33:02 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
 "Vetter, Daniel" <daniel.vetter@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Jose Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/xe/obsrv: Rename xe perf layer as xe observability
 layer
Message-ID: <faipg2kneuaquzcdjjxvqw2qv4rgguylpf46ztzflmyjx6bsh3@224hh3l2zgbq>
References: <20240702160740.2487279-1-ashutosh.dixit@intel.com>
 <ZoQo5F7cUsM3VZKE@intel.com>
 <87tth7a9c3.wl-ashutosh.dixit@intel.com>
 <dnkulc6j3c25f3powx5kltuxv3qak6oxbilqj3uog5lwp3ikna@6mflfe2vdmyq>
 <ZoReaBy9J0YfQFP6@intel.com>
 <87sewr9w84.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sewr9w84.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:303:2b::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0b260e-eccc-4d45-ad5d-08dc9b9f583d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QjFuLkIlugAiJCdScKqds031wn+9DAXVFPkjdPLJvlY+6FRgDweQ77e8bA?=
 =?iso-8859-1?Q?Kn/tQlCkfIXd9m7r7CP2Hab8hClWgG7bwTymIfSl7mFct+Nzxe/CGhL1Xm?=
 =?iso-8859-1?Q?4NaH+0I+c3ppP5URDMQ42DniXgZ+cnjw1UpQ+Fi7HfwPg+KHeGUnDyKV1J?=
 =?iso-8859-1?Q?O9cFxYaJxppATYr4u88XjYWlmAv00Pt5OfexKKy2O2xNWbmmD0VYm6jp0Q?=
 =?iso-8859-1?Q?0AxrORxN+U2lo+5JsG4kOuoWo/HBn+VdO7FNWapm/cmzR76LFbvz8n8S1r?=
 =?iso-8859-1?Q?MFLnzTZ90Mgt37CKFdjPsuPETlTvg+8gh/BMIy63CHpaN/Ur/9pZtPwHsT?=
 =?iso-8859-1?Q?mnK7X0m4hXQvOQ1XpS2sEZ8lzsLYYvuYp/NWoB45R3dnUvLAZ2oqekIWPC?=
 =?iso-8859-1?Q?QpGgEMBTNztm2pTRtS5bFbWV31FOEvPExNDMgirN6hXQVcvxI3W/o9w2ix?=
 =?iso-8859-1?Q?dLaRmThbwX6Vr5nuUfzZlUBuZD7Xy78+UVXGKZ+1DnJiGDVSXFeNbilUjr?=
 =?iso-8859-1?Q?2yXaH8TxVJ9e6kIjonNBuXlypjJHcO/xrlF5dvJ8sf7/SgenfWyHEY8bFP?=
 =?iso-8859-1?Q?4Cf4IH46LK+4PrENyhB2jTly/LrZ8HUsKvPGmctmnJPzJg2P1P2PwpzeFO?=
 =?iso-8859-1?Q?m/QsHNVReNnm8xpkmg0M+WkDPsLu+pHEsWJizhWqdMI6Sw/9S19TzZ6X/J?=
 =?iso-8859-1?Q?FiujQF695q5Pk+a4xuxgpY+Lffp/YQl0+ui57G+qn7ckD9jYlPuax/g4Sk?=
 =?iso-8859-1?Q?0zgo1vbzyD1YSs2iDQI8KcWaEx2c9SPuaxXjEYVb2T563ItE8T1vdFHYNv?=
 =?iso-8859-1?Q?KAx28NJ9O9nMgFGVcg3iXgIw0berY+BSMYsj8nIafI6qPzHFe10ZJ9Md3u?=
 =?iso-8859-1?Q?vO+HC37N1mhjk26kJrgOacqHuAieKwX6Uz0oqLIf2U15rjukH70GbXWLWD?=
 =?iso-8859-1?Q?DPIwGlQHBzf3SK1Z5MTsPuvfVW+rSXUz1YKrYnwTCYomgU9LTpZqAkP1nz?=
 =?iso-8859-1?Q?DYA3h3B7GXAjvjyf6LZE3yaFX1IDGF8ZOzP9OmdTeT5Jq1VhGui6sMBHDy?=
 =?iso-8859-1?Q?k2ROhhM1xv09QyVDJ5oisQkrYxB/skSWwu8vPd0O9QavHmbOnK2ct8PsTL?=
 =?iso-8859-1?Q?zUkt2VUKSvjtkxoQ+w1ekrb+C75MKvwQi64mQLvgbQPfyqJXfvQEMkNUqT?=
 =?iso-8859-1?Q?YeOYDcyM4Q7PCLvHbRKe5UnCZ2VERo5OzqAAwbTYhRel7CdEvAts7enVPF?=
 =?iso-8859-1?Q?IXlhw3JHEYQCaMFo2IOD9xnRe+rxxhTyczN4IUKmXbWFmsOwicHWzLepJQ?=
 =?iso-8859-1?Q?NiM7IasuiFiTTYbUyOi7j7GBGJO7leKXywZUJz/O0OkzWfzR2r+qgy3EBr?=
 =?iso-8859-1?Q?qNsRvlpJt2RUjsGckMeTGxT7T7TDaLOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RzxEjPOAIDFuy2Q5kEGFeKYGeXQCloqlQE65pLTJKpawBmF6XYeEmeJZoj?=
 =?iso-8859-1?Q?XOwf/O7mPrCufApAqUZJBrSl/3/xGjWmFOnpFActNkLBQtXkFZkoXYlGGr?=
 =?iso-8859-1?Q?bmLz+BpXBskrXAZGVc8m11TOvXMu5qYe+AC5bmLoKHwEsz0hTCBwjhCevL?=
 =?iso-8859-1?Q?zWWRuRjjOZdI1dJzW7GMuXkfx7fx593tXbe8Nf8dy2hOxbshP5NX6qOo9i?=
 =?iso-8859-1?Q?JV2P5C+Bb/JD96KQsF6zBDW17UFIJDxs96/QtecrlXzA3KndXpdncbxJ+E?=
 =?iso-8859-1?Q?Hxu0zIq2Jpuva2CYEz8GAVHc0kU8zHI3SSA1vpwKw3ph/QHg5Ni7i3a3Fy?=
 =?iso-8859-1?Q?1G7486gFwefu3uLAaVZ4HMkOWTm8DOweXANxcNJl7394MjQUDDf2G2V11O?=
 =?iso-8859-1?Q?OYScMBxthv/nJEw42c1sbg8gWTt5Q9oHaecGwkFPqOlM4olBX9XJsi8DMM?=
 =?iso-8859-1?Q?G2H5baQ0fhf5C0HkkIYPox6Hin4iR7hMaKo2QKsQmfKQqv6Tqus0PT0byJ?=
 =?iso-8859-1?Q?tvY3tHpqaTTZPgUw08GGKv1rSV7wuxK5mioeWufno9P6KztISa0UM4cORh?=
 =?iso-8859-1?Q?4mzZf4pI5td1Up128rKA+DNfAJmYFJL+ypEwbQVQHyvy5EkdFHCzMfVvRR?=
 =?iso-8859-1?Q?2owWccTtEEzH35Kv6o+2tKvOtNNhiKlFr+xSfXaL76eVEL3z+OVc1g1E7F?=
 =?iso-8859-1?Q?3CaUfVCKg+ZFY2CojYhRmm3xpd1svQhozwIDrKfPueUsYJxz+Ztxfue8bJ?=
 =?iso-8859-1?Q?qmqTVQR/OZjbp8jZgqj4za6JdeehfYCAX0oglpU8fYq+SFtaTAMsucObtf?=
 =?iso-8859-1?Q?npGp1cHd/XcISU/Rfg9bybpwxgsuOh9zBw39I7bYxOFcEWvdrl4R0w+iqm?=
 =?iso-8859-1?Q?VBsVsi+KN/bow96Tmbf/t0nCYpiSohqWkBGhFeSrrLzhlenZoegGT7JzPY?=
 =?iso-8859-1?Q?QqzK44iVCt2uCrv6pqaWlb4Ix38aKohRtkDE7SriSZy/4u4qwsC1PYxTXb?=
 =?iso-8859-1?Q?bMwbe0ajcT6pKlJpsJJNoZ1slDlZaD0tbRDAFWxa7C/RwQ8GgYDjWQPJpg?=
 =?iso-8859-1?Q?YM+BQjcQSf8XOUFGQMKHQOid4/MX194QT1vHtEJSj8ENNKIb3wdNFMXtCE?=
 =?iso-8859-1?Q?rgnq0p94VK5DlAyue1dPN1ueB7RF79Is1KYoCPt5D1RnSzFR/zyHTlaRZx?=
 =?iso-8859-1?Q?imoKtNJ/85cpmCYs/+ca3AruNE5d/zCHHE6/Mbw9UQsHox87GuCFi/hxwc?=
 =?iso-8859-1?Q?GbBvk48YXb5IyPonS5spEERJtF1WXuX7u9oMXRqkvSV3joSMpJZz4CufQ4?=
 =?iso-8859-1?Q?Xj6LfEgPv0hnLZ24mbxfKN8Mp1wR/FomDItIlWSJWwM/7hz8EcQvOEpDBO?=
 =?iso-8859-1?Q?MYnC5v4KMEPc7o38bYpydgvasAy5mPHbutbsjnW2oHIzAaiTeBqG4gAUIP?=
 =?iso-8859-1?Q?ms3tZwFf86BzzSDjRD2yqGAqWR+TNhUDRrc+zr0ioh2XKm7Wp8eqaYrS5C?=
 =?iso-8859-1?Q?cwjjphSW5UNnjtFphIn1OClZ4X7nKpp7XjRW9nfLB6Q9HBYlDVaY9RYPuu?=
 =?iso-8859-1?Q?9XM+WCd0ux/XTJa+HI5wzmlMIMD4xVN2I2Crrprr+GwB/BY2MqWONzPxeR?=
 =?iso-8859-1?Q?fpzUsKZiLsoIoyCA9bGqI5x8HZhGUarqdvlsmDTIP1ZZcuzcGCx0c9ig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0b260e-eccc-4d45-ad5d-08dc9b9f583d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 20:33:06.4612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJmmQUq812ayjLb+Q5QnBua/DWuezWq1V8UX2t8d8iBnEGXP2ZSi9nsdN0pyZTMMfgjwlNNOmo1UiRt0/Toj9hQCqMyvIALyxcQDVr9AKD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8319
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

On Tue, Jul 02, 2024 at 05:04:43PM GMT, Ashutosh Dixit wrote:
>On Tue, 02 Jul 2024 13:09:12 -0700, Rodrigo Vivi wrote:
>>
>
>Hi Rodrigo,
>
>> On Tue, Jul 02, 2024 at 02:47:10PM -0500, Lucas De Marchi wrote:
>> > On Tue, Jul 02, 2024 at 12:21:32PM GMT, Ashutosh Dixit wrote:
>> > > On Tue, 02 Jul 2024 09:20:52 -0700, Rodrigo Vivi wrote:
>> > > >
>> > >
>> > > Hi Rodrigo,
>> > >
>> > > > On Tue, Jul 02, 2024 at 09:07:40AM -0700, Ashutosh Dixit wrote:
>> > > > > In Xe, the perf layer allows capture of HW counter streams. These HW
>> > > > > counters are generally performance related but don't have to be necessarily
>> > > > > so. Also, the name "perf" is a carryover from i915 and is not preferred.
>> > > > >
>> > > > > In this patch we propose the name "observability" for this common layer
>> > > > > which allows capture of different types of these counter streams.
>> > > >
>> > > > Yeap, perf is indeed a bad name. I thought about observability at first
>> > > > because I always read 'OA' as observability architecture. Although Matt
>> > > > Roper convinced me that the most recent spec pages calls that as
>> > > > Observation Architecture.
>> > > >
>> > > > Shouldn't we go then with xe_observation?
>> > >
>> > > OK, I think we can go with xe_observation.
>> > >
>> > > >
>> > > > Well, although, OTOH, xe_observ can be applied as short to whatever
>> > > > bspec page you are looking at ;)
>> > > > Then perhaps just a mention to both names in some doc?
>> > > >
>> > > > No strong preferences on what final name, but +1 on changing the
>> > > > name:
>> > >
>> > > Will change to xe_observation. So we'll be opening/working with observation
>> > > streams. Will change names and comments to that effect.
>> > >
>> > >
>> > > >
>> > > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > >
>> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > >
>> > > Also since this is a uapi change don't we need to include this in the 6.11
>> > > PR? How else will we handle the uapi change?
>> >
>> > yes, this needs to go with 6.11... should be sent in a -fixes pull
>> > request (since we already submitted the drm-xe-next pull request).
>>
>> hmmm... I was not very worried or trying to rush this to 6.11 because:
>> 1. the name change doesn't break compatibility
>
>It does, not because of changes in xe_drm.h, but because there was a file
>"perf_stream_paranoid" which is now renamed to "xe_observation_paranoid".

we are talking about 2 different things here. uaBi breaks because
of this file, correct. But the rename is a clear uaPi breakage and hence
we shouldn't have it with 2 released kernel  (even if we didn't have the
issue with this file)

if userspace compilation builds with kernel headers from 6.11 and then
break with kernel headers from 6.12, that is not good.

Lucas De Marchi

>
>> 2. because I don't like rushing uapi changes, specially with userspace not
>> engaged yet.
>>
>> But since both of you are raising this a must-have for 6.11. It is just
>> because the name discrepancy for something released on 6.10 and then renamed
>> on 6.11, or will we really have a trouble on the 6.10 if the 'perf' name
>> gets released in 6.10?
>
>No, perf/observation/OA is not present in 6.10, it is getting added in
>6.11, so it's best the entire uapi gets added in 6.11, either via a PR or
>via fixes, as Lucas mentioned.
>
>Thanks.
>--
>Ashutosh
>
>>
>> Cc: Sima and Dave for awareness in case we send this as a
>> yet another last-pr-for-6.11 or if we send as drm-xe-next-fixes.
>>
>> >
>> > Thanks for working on this rename and I'm sorry I raised this concern
>> > after it had been merged.
>> >
>> > Once we get this squared we should also update mesa (just checked their
>> > MR and it has been merged last week). +Jose
>> >
>> > Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >
>> > for xe_observation
>> >
>> > Lucas De Marchi
>> >
>> > >
>> > > Thanks.
>> > > --
>> > > Ashutosh
>> > >
>> > >
>> > >
>> > > >
>> > > > >
>> > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > > > > ---
>> > > > >  drivers/gpu/drm/xe/Makefile          |  2 +-
>> > > > >  drivers/gpu/drm/xe/xe_device.c       |  4 +-
>> > > > >  drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>> > > > >  drivers/gpu/drm/xe/xe_gt_types.h     |  2 +-
>> > > > >  drivers/gpu/drm/xe/xe_module.c       |  6 +-
>> > > > >  drivers/gpu/drm/xe/xe_oa.c           | 34 +++++-----
>> > > > >  drivers/gpu/drm/xe/xe_obsrv.c        | 93 ++++++++++++++++++++++++++
>> > > > >  drivers/gpu/drm/xe/xe_obsrv.h        | 20 ++++++
>> > > > >  drivers/gpu/drm/xe/xe_perf.c         | 92 --------------------------
>> > > > >  drivers/gpu/drm/xe/xe_perf.h         | 20 ------
>> > > > >  include/uapi/drm/xe_drm.h            | 97 ++++++++++++++--------------
>> > > > >  11 files changed, 187 insertions(+), 185 deletions(-)
>> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_obsrv.c
>> > > > >  create mode 100644 drivers/gpu/drm/xe/xe_obsrv.h
>> > > > >  delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
>> > > > >  delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
>> > > > >
>> > > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > > > > index b1e03bfe4a68..21e8ebe10e85 100644
>> > > > > --- a/drivers/gpu/drm/xe/Makefile
>> > > > > +++ b/drivers/gpu/drm/xe/Makefile
>> > > > > @@ -96,10 +96,10 @@ xe-y += xe_bb.o \
>> > > > >	xe_mocs.o \
>> > > > >	xe_module.o \
>> > > > >	xe_oa.o \
>> > > > > +	xe_obsrv.o \
>> > > > >	xe_pat.o \
>> > > > >	xe_pci.o \
>> > > > >	xe_pcode.o \
>> > > > > -	xe_perf.o \
>> > > > >	xe_pm.o \
>> > > > >	xe_preempt_fence.o \
>> > > > >	xe_pt.o \
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > > > index cfda7cb5df2c..adf6cec662ea 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > > > @@ -42,9 +42,9 @@
>> > > > >  #include "xe_memirq.h"
>> > > > >  #include "xe_mmio.h"
>> > > > >  #include "xe_module.h"
>> > > > > +#include "xe_obsrv.h"
>> > > > >  #include "xe_pat.h"
>> > > > >  #include "xe_pcode.h"
>> > > > > -#include "xe_perf.h"
>> > > > >  #include "xe_pm.h"
>> > > > >  #include "xe_query.h"
>> > > > >  #include "xe_sriov.h"
>> > > > > @@ -142,7 +142,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>> > > > >			  DRM_RENDER_ALLOW),
>> > > > >	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>> > > > >			  DRM_RENDER_ALLOW),
>> > > > > -	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
>> > > > > +	DRM_IOCTL_DEF_DRV(XE_OBSRV, xe_obsrv_ioctl, DRM_RENDER_ALLOW),
>> > > > >  };
>> > > > >
>> > > > >  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > > index c37be471d11c..4a51f0152cf2 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > > @@ -463,7 +463,7 @@ struct xe_device {
>> > > > >	/** @heci_gsc: graphics security controller */
>> > > > >	struct xe_heci_gsc heci_gsc;
>> > > > >
>> > > > > -	/** @oa: oa perf counter subsystem */
>> > > > > +	/** @oa: oa observability subsystem */
>> > > > >	struct xe_oa oa;
>> > > > >
>> > > > >	/** @needs_flr_on_fini: requests function-reset on fini */
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> > > > > index 24bb95de920f..005c38fa3b4a 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> > > > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> > > > > @@ -389,7 +389,7 @@ struct xe_gt {
>> > > > >		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
>> > > > >	} user_engines;
>> > > > >
>> > > > > -	/** @oa: oa perf counter subsystem per gt info */
>> > > > > +	/** @oa: oa observability subsystem per gt info */
>> > > > >	struct xe_oa_gt oa;
>> > > > >  };
>> > > > >
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> > > > > index 893858a2eea0..76002c0202c4 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_module.c
>> > > > > +++ b/drivers/gpu/drm/xe/xe_module.c
>> > > > > @@ -11,7 +11,7 @@
>> > > > >  #include "xe_drv.h"
>> > > > >  #include "xe_hw_fence.h"
>> > > > >  #include "xe_pci.h"
>> > > > > -#include "xe_perf.h"
>> > > > > +#include "xe_obsrv.h"
>> > > > >  #include "xe_sched_job.h"
>> > > > >
>> > > > >  struct xe_modparam xe_modparam = {
>> > > > > @@ -80,8 +80,8 @@ static const struct init_funcs init_funcs[] = {
>> > > > >		.exit = xe_unregister_pci_driver,
>> > > > >	},
>> > > > >	{
>> > > > > -		.init = xe_perf_sysctl_register,
>> > > > > -		.exit = xe_perf_sysctl_unregister,
>> > > > > +		.init = xe_obsrv_sysctl_register,
>> > > > > +		.exit = xe_obsrv_sysctl_unregister,
>> > > > >	},
>> > > > >  };
>> > > > >
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> > > > > index 4188516a7816..ba23efb49f42 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_oa.c
>> > > > > +++ b/drivers/gpu/drm/xe/xe_oa.c
>> > > > > @@ -32,7 +32,7 @@
>> > > > >  #include "xe_macros.h"
>> > > > >  #include "xe_mmio.h"
>> > > > >  #include "xe_oa.h"
>> > > > > -#include "xe_perf.h"
>> > > > > +#include "xe_obsrv.h"
>> > > > >  #include "xe_pm.h"
>> > > > >  #include "xe_sched_job.h"
>> > > > >  #include "xe_sriov.h"
>> > > > > @@ -481,7 +481,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
>> > > > >					  OASTATUS_RELEVANT_BITS, 0);
>> > > > >	/*
>> > > > >	 * Signal to userspace that there is non-zero OA status to read via
>> > > > > -	 * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
>> > > > > +	 * @DRM_XE_OBSRV_IOCTL_STATUS obsrv fd ioctl
>> > > > >	 */
>> > > > >	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
>> > > > >		return -EIO;
>> > > > > @@ -1158,15 +1158,15 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
>> > > > >			       unsigned long arg)
>> > > > >  {
>> > > > >	switch (cmd) {
>> > > > > -	case DRM_XE_PERF_IOCTL_ENABLE:
>> > > > > +	case DRM_XE_OBSRV_IOCTL_ENABLE:
>> > > > >		return xe_oa_enable_locked(stream);
>> > > > > -	case DRM_XE_PERF_IOCTL_DISABLE:
>> > > > > +	case DRM_XE_OBSRV_IOCTL_DISABLE:
>> > > > >		return xe_oa_disable_locked(stream);
>> > > > > -	case DRM_XE_PERF_IOCTL_CONFIG:
>> > > > > +	case DRM_XE_OBSRV_IOCTL_CONFIG:
>> > > > >		return xe_oa_config_locked(stream, arg);
>> > > > > -	case DRM_XE_PERF_IOCTL_STATUS:
>> > > > > +	case DRM_XE_OBSRV_IOCTL_STATUS:
>> > > > >		return xe_oa_status_locked(stream, arg);
>> > > > > -	case DRM_XE_PERF_IOCTL_INFO:
>> > > > > +	case DRM_XE_OBSRV_IOCTL_INFO:
>> > > > >		return xe_oa_info_locked(stream, arg);
>> > > > >	}
>> > > > >
>> > > > > @@ -1209,7 +1209,7 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>> > > > >	xe_oa_destroy_locked(stream);
>> > > > >	mutex_unlock(&gt->oa.gt_lock);
>> > > > >
>> > > > > -	/* Release the reference the perf stream kept on the driver */
>> > > > > +	/* Release the reference the OA stream kept on the driver */
>> > > > >	drm_dev_put(&gt_to_xe(gt)->drm);
>> > > > >
>> > > > >	return 0;
>> > > > > @@ -1222,7 +1222,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>> > > > >	unsigned long start = vma->vm_start;
>> > > > >	int i, ret;
>> > > > >
>> > > > > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>> > > > > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>> > > > >		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
>> > > > >		return -EACCES;
>> > > > >	}
>> > > > > @@ -1789,8 +1789,8 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
>> > > > >   * @file: @drm_file
>> > > > >   *
>> > > > >   * The functions opens an OA stream. An OA stream, opened with specified
>> > > > > - * properties, enables perf counter samples to be collected, either
>> > > > > - * periodically (time based sampling), or on request (using perf queries)
>> > > > > + * properties, enables OA counter samples to be collected, either
>> > > > > + * periodically (time based sampling), or on request (using OA queries)
>> > > > >   */
>> > > > >  int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>> > > > >  {
>> > > > > @@ -1836,8 +1836,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>> > > > >		privileged_op = true;
>> > > > >	}
>> > > > >
>> > > > > -	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
>> > > > > -		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
>> > > > > +	if (privileged_op && xe_obsrv_paranoid && !perfmon_capable()) {
>> > > > > +		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe OA stream\n");
>> > > > >		ret = -EACCES;
>> > > > >		goto err_exec_q;
>> > > > >	}
>> > > > > @@ -2097,7 +2097,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>> > > > >		return -ENODEV;
>> > > > >	}
>> > > > >
>> > > > > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>> > > > > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>> > > > >		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
>> > > > >		return -EACCES;
>> > > > >	}
>> > > > > @@ -2181,7 +2181,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>> > > > >  /**
>> > > > >   * xe_oa_remove_config_ioctl - Removes one OA config
>> > > > >   * @dev: @drm_device
>> > > > > - * @data: pointer to struct @drm_xe_perf_param
>> > > > > + * @data: pointer to struct @drm_xe_obsrv_param
>> > > > >   * @file: @drm_file
>> > > > >   */
>> > > > >  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>> > > > > @@ -2197,7 +2197,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
>> > > > >		return -ENODEV;
>> > > > >	}
>> > > > >
>> > > > > -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
>> > > > > +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>> > > > >		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
>> > > > >		return -EACCES;
>> > > > >	}
>> > > > > @@ -2381,7 +2381,7 @@ static int xe_oa_init_gt(struct xe_gt *gt)
>> > > > >
>> > > > >	/*
>> > > > >	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
>> > > > > -	 * will appear in OA unit query, but no perf streams can be opened on them.
>> > > > > +	 * will appear in OA unit query, but no OA streams can be opened on them.
>> > > > >	 */
>> > > > >	gt->oa.num_oa_units = num_oa_units;
>> > > > >	gt->oa.oa_unit = u;
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_obsrv.c b/drivers/gpu/drm/xe/xe_obsrv.c
>> > > > > new file mode 100644
>> > > > > index 000000000000..f04ed4eb86b1
>> > > > > --- /dev/null
>> > > > > +++ b/drivers/gpu/drm/xe/xe_obsrv.c
>> > > > > @@ -0,0 +1,93 @@
>> > > > > +// SPDX-License-Identifier: MIT
>> > > > > +/*
>> > > > > + * Copyright © 2023-2024 Intel Corporation
>> > > > > + */
>> > > > > +
>> > > > > +#include <linux/errno.h>
>> > > > > +#include <linux/sysctl.h>
>> > > > > +
>> > > > > +#include <drm/xe_drm.h>
>> > > > > +
>> > > > > +#include "xe_oa.h"
>> > > > > +#include "xe_obsrv.h"
>> > > > > +
>> > > > > +u32 xe_obsrv_paranoid = true;
>> > > > > +static struct ctl_table_header *sysctl_header;
>> > > > > +
>> > > > > +static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_obsrv_param *arg,
>> > > > > +		       struct drm_file *file)
>> > > > > +{
>> > > > > +	switch (arg->obsrv_op) {
>> > > > > +	case DRM_XE_OBSRV_OP_STREAM_OPEN:
>> > > > > +		return xe_oa_stream_open_ioctl(dev, arg->param, file);
>> > > > > +	case DRM_XE_OBSRV_OP_ADD_CONFIG:
>> > > > > +		return xe_oa_add_config_ioctl(dev, arg->param, file);
>> > > > > +	case DRM_XE_OBSRV_OP_REMOVE_CONFIG:
>> > > > > +		return xe_oa_remove_config_ioctl(dev, arg->param, file);
>> > > > > +	default:
>> > > > > +		return -EINVAL;
>> > > > > +	}
>> > > > > +}
>> > > > > +
>> > > > > +/**
>> > > > > + * xe_obsrv_ioctl - The top level observability layer ioctl
>> > > > > + * @dev: @drm_device
>> > > > > + * @data: pointer to struct @drm_xe_obsrv_param
>> > > > > + * @file: @drm_file
>> > > > > + *
>> > > > > + * The function is called for different observability streams types and
>> > > > > + * allows execution of different operations supported by those stream
>> > > > > + * types.
>> > > > > + *
>> > > > > + * Return: 0 on success or a negative error code on failure.
>> > > > > + */
>> > > > > +int xe_obsrv_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> > > > > +{
>> > > > > +	struct drm_xe_obsrv_param *arg = data;
>> > > > > +
>> > > > > +	if (arg->extensions)
>> > > > > +		return -EINVAL;
>> > > > > +
>> > > > > +	switch (arg->obsrv_type) {
>> > > > > +	case DRM_XE_OBSRV_TYPE_OA:
>> > > > > +		return xe_oa_ioctl(dev, arg, file);
>> > > > > +	default:
>> > > > > +		return -EINVAL;
>> > > > > +	}
>> > > > > +}
>> > > > > +
>> > > > > +static struct ctl_table obsrv_ctl_table[] = {
>> > > > > +	{
>> > > > > +	 .procname = "xe_observability_paranoid",
>> > > > > +	 .data = &xe_obsrv_paranoid,
>> > > > > +	 .maxlen = sizeof(xe_obsrv_paranoid),
>> > > > > +	 .mode = 0644,
>> > > > > +	 .proc_handler = proc_dointvec_minmax,
>> > > > > +	 .extra1 = SYSCTL_ZERO,
>> > > > > +	 .extra2 = SYSCTL_ONE,
>> > > > > +	 },
>> > > > > +	{}
>> > > > > +};
>> > > > > +
>> > > > > +/**
>> > > > > + * xe_obsrv_sysctl_register - Register xe_obsrv_paranoid sysctl
>> > > > > + *
>> > > > > + * Normally only superuser/root can access observability stream
>> > > > > + * data. However, superuser can set obsrv_paranoid sysctl to 0 to allow
>> > > > > + * non-privileged users to also access observability data.
>> > > > > + *
>> > > > > + * Return: always returns 0
>> > > > > + */
>> > > > > +int xe_obsrv_sysctl_register(void)
>> > > > > +{
>> > > > > +	sysctl_header = register_sysctl("dev/xe", obsrv_ctl_table);
>> > > > > +	return 0;
>> > > > > +}
>> > > > > +
>> > > > > +/**
>> > > > > + * xe_obsrv_sysctl_unregister - Unregister xe_obsrv_paranoid sysctl
>> > > > > + */
>> > > > > +void xe_obsrv_sysctl_unregister(void)
>> > > > > +{
>> > > > > +	unregister_sysctl_table(sysctl_header);
>> > > > > +}
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_obsrv.h b/drivers/gpu/drm/xe/xe_obsrv.h
>> > > > > new file mode 100644
>> > > > > index 000000000000..13cf4a8029a7
>> > > > > --- /dev/null
>> > > > > +++ b/drivers/gpu/drm/xe/xe_obsrv.h
>> > > > > @@ -0,0 +1,20 @@
>> > > > > +/* SPDX-License-Identifier: MIT */
>> > > > > +/*
>> > > > > + * Copyright © 2023-2024 Intel Corporation
>> > > > > + */
>> > > > > +
>> > > > > +#ifndef _XE_OBSRV_H_
>> > > > > +#define _XE_OBSRV_H_
>> > > > > +
>> > > > > +#include <linux/types.h>
>> > > > > +
>> > > > > +struct drm_device;
>> > > > > +struct drm_file;
>> > > > > +
>> > > > > +extern u32 xe_obsrv_paranoid;
>> > > > > +
>> > > > > +int xe_obsrv_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>> > > > > +int xe_obsrv_sysctl_register(void);
>> > > > > +void xe_obsrv_sysctl_unregister(void);
>> > > > > +
>> > > > > +#endif
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
>> > > > > deleted file mode 100644
>> > > > > index d6cd74cadf34..000000000000
>> > > > > --- a/drivers/gpu/drm/xe/xe_perf.c
>> > > > > +++ /dev/null
>> > > > > @@ -1,92 +0,0 @@
>> > > > > -// SPDX-License-Identifier: MIT
>> > > > > -/*
>> > > > > - * Copyright © 2023-2024 Intel Corporation
>> > > > > - */
>> > > > > -
>> > > > > -#include <linux/errno.h>
>> > > > > -#include <linux/sysctl.h>
>> > > > > -
>> > > > > -#include <drm/xe_drm.h>
>> > > > > -
>> > > > > -#include "xe_oa.h"
>> > > > > -#include "xe_perf.h"
>> > > > > -
>> > > > > -u32 xe_perf_stream_paranoid = true;
>> > > > > -static struct ctl_table_header *sysctl_header;
>> > > > > -
>> > > > > -static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
>> > > > > -		       struct drm_file *file)
>> > > > > -{
>> > > > > -	switch (arg->perf_op) {
>> > > > > -	case DRM_XE_PERF_OP_STREAM_OPEN:
>> > > > > -		return xe_oa_stream_open_ioctl(dev, arg->param, file);
>> > > > > -	case DRM_XE_PERF_OP_ADD_CONFIG:
>> > > > > -		return xe_oa_add_config_ioctl(dev, arg->param, file);
>> > > > > -	case DRM_XE_PERF_OP_REMOVE_CONFIG:
>> > > > > -		return xe_oa_remove_config_ioctl(dev, arg->param, file);
>> > > > > -	default:
>> > > > > -		return -EINVAL;
>> > > > > -	}
>> > > > > -}
>> > > > > -
>> > > > > -/**
>> > > > > - * xe_perf_ioctl - The top level perf layer ioctl
>> > > > > - * @dev: @drm_device
>> > > > > - * @data: pointer to struct @drm_xe_perf_param
>> > > > > - * @file: @drm_file
>> > > > > - *
>> > > > > - * The function is called for different perf streams types and allows execution
>> > > > > - * of different operations supported by those perf stream types.
>> > > > > - *
>> > > > > - * Return: 0 on success or a negative error code on failure.
>> > > > > - */
>> > > > > -int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> > > > > -{
>> > > > > -	struct drm_xe_perf_param *arg = data;
>> > > > > -
>> > > > > -	if (arg->extensions)
>> > > > > -		return -EINVAL;
>> > > > > -
>> > > > > -	switch (arg->perf_type) {
>> > > > > -	case DRM_XE_PERF_TYPE_OA:
>> > > > > -		return xe_oa_ioctl(dev, arg, file);
>> > > > > -	default:
>> > > > > -		return -EINVAL;
>> > > > > -	}
>> > > > > -}
>> > > > > -
>> > > > > -static struct ctl_table perf_ctl_table[] = {
>> > > > > -	{
>> > > > > -	 .procname = "perf_stream_paranoid",
>> > > > > -	 .data = &xe_perf_stream_paranoid,
>> > > > > -	 .maxlen = sizeof(xe_perf_stream_paranoid),
>> > > > > -	 .mode = 0644,
>> > > > > -	 .proc_handler = proc_dointvec_minmax,
>> > > > > -	 .extra1 = SYSCTL_ZERO,
>> > > > > -	 .extra2 = SYSCTL_ONE,
>> > > > > -	 },
>> > > > > -	{}
>> > > > > -};
>> > > > > -
>> > > > > -/**
>> > > > > - * xe_perf_sysctl_register - Register "perf_stream_paranoid" sysctl
>> > > > > - *
>> > > > > - * Normally only superuser/root can access perf counter data. However,
>> > > > > - * superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
>> > > > > - * users to also access perf data.
>> > > > > - *
>> > > > > - * Return: always returns 0
>> > > > > - */
>> > > > > -int xe_perf_sysctl_register(void)
>> > > > > -{
>> > > > > -	sysctl_header = register_sysctl("dev/xe", perf_ctl_table);
>> > > > > -	return 0;
>> > > > > -}
>> > > > > -
>> > > > > -/**
>> > > > > - * xe_perf_sysctl_unregister - Unregister "perf_stream_paranoid" sysctl
>> > > > > - */
>> > > > > -void xe_perf_sysctl_unregister(void)
>> > > > > -{
>> > > > > -	unregister_sysctl_table(sysctl_header);
>> > > > > -}
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
>> > > > > deleted file mode 100644
>> > > > > index 53a8377a1bb1..000000000000
>> > > > > --- a/drivers/gpu/drm/xe/xe_perf.h
>> > > > > +++ /dev/null
>> > > > > @@ -1,20 +0,0 @@
>> > > > > -/* SPDX-License-Identifier: MIT */
>> > > > > -/*
>> > > > > - * Copyright © 2023-2024 Intel Corporation
>> > > > > - */
>> > > > > -
>> > > > > -#ifndef _XE_PERF_H_
>> > > > > -#define _XE_PERF_H_
>> > > > > -
>> > > > > -#include <linux/types.h>
>> > > > > -
>> > > > > -struct drm_device;
>> > > > > -struct drm_file;
>> > > > > -
>> > > > > -extern u32 xe_perf_stream_paranoid;
>> > > > > -
>> > > > > -int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>> > > > > -int xe_perf_sysctl_register(void);
>> > > > > -void xe_perf_sysctl_unregister(void);
>> > > > > -
>> > > > > -#endif
>> > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> > > > > index 12eaa8532b5c..b80d0b0d7bb2 100644
>> > > > > --- a/include/uapi/drm/xe_drm.h
>> > > > > +++ b/include/uapi/drm/xe_drm.h
>> > > > > @@ -80,7 +80,7 @@ extern "C" {
>> > > > >   *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>> > > > >   *  - &DRM_IOCTL_XE_EXEC
>> > > > >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>> > > > > - *  - &DRM_IOCTL_XE_PERF
>> > > > > + *  - &DRM_IOCTL_XE_OBSRV
>> > > > >   */
>> > > > >
>> > > > >  /*
>> > > > > @@ -101,7 +101,7 @@ extern "C" {
>> > > > >  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>> > > > >  #define DRM_XE_EXEC			0x09
>> > > > >  #define DRM_XE_WAIT_USER_FENCE		0x0a
>> > > > > -#define DRM_XE_PERF			0x0b
>> > > > > +#define DRM_XE_OBSRV			0x0b
>> > > > >
>> > > > >  /* Must be kept compact -- no holes */
>> > > > >
>> > > > > @@ -116,7 +116,7 @@ extern "C" {
>> > > > >  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>> > > > >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>> > > > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>> > > > > -#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
>> > > > > +#define DRM_IOCTL_XE_OBSRV			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSRV, struct drm_xe_obsrv_param)
>> > > > >
>> > > > >  /**
>> > > > >   * DOC: Xe IOCTL Extensions
>> > > > > @@ -1376,66 +1376,67 @@ struct drm_xe_wait_user_fence {
>> > > > >  };
>> > > > >
>> > > > >  /**
>> > > > > - * enum drm_xe_perf_type - Perf stream types
>> > > > > + * enum drm_xe_obsrv_type - Observability stream types
>> > > > >   */
>> > > > > -enum drm_xe_perf_type {
>> > > > > -	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
>> > > > > -	DRM_XE_PERF_TYPE_OA,
>> > > > > +enum drm_xe_obsrv_type {
>> > > > > +	/** @DRM_XE_OBSRV_TYPE_OA: OA observability stream type */
>> > > > > +	DRM_XE_OBSRV_TYPE_OA,
>> > > > >  };
>> > > > >
>> > > > >  /**
>> > > > > - * enum drm_xe_perf_op - Perf stream ops
>> > > > > + * enum drm_xe_obsrv_op - Observability stream ops
>> > > > >   */
>> > > > > -enum drm_xe_perf_op {
>> > > > > -	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
>> > > > > -	DRM_XE_PERF_OP_STREAM_OPEN,
>> > > > > +enum drm_xe_obsrv_op {
>> > > > > +	/** @DRM_XE_OBSRV_OP_STREAM_OPEN: Open an observability stream */
>> > > > > +	DRM_XE_OBSRV_OP_STREAM_OPEN,
>> > > > >
>> > > > > -	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
>> > > > > -	DRM_XE_PERF_OP_ADD_CONFIG,
>> > > > > +	/** @DRM_XE_OBSRV_OP_ADD_CONFIG: Add observability stream config */
>> > > > > +	DRM_XE_OBSRV_OP_ADD_CONFIG,
>> > > > >
>> > > > > -	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
>> > > > > -	DRM_XE_PERF_OP_REMOVE_CONFIG,
>> > > > > +	/** @DRM_XE_OBSRV_OP_REMOVE_CONFIG: Remove observability stream config */
>> > > > > +	DRM_XE_OBSRV_OP_REMOVE_CONFIG,
>> > > > >  };
>> > > > >
>> > > > >  /**
>> > > > > - * struct drm_xe_perf_param - Input of &DRM_XE_PERF
>> > > > > + * struct drm_xe_obsrv_param - Input of &DRM_XE_OBSRV
>> > > > >   *
>> > > > > - * The perf layer enables multiplexing perf counter streams of multiple
>> > > > > - * types. The actual params for a particular stream operation are supplied
>> > > > > - * via the @param pointer (use __copy_from_user to get these params).
>> > > > > + * The observability layer enables multiplexing observability streams of
>> > > > > + * multiple types. The actual params for a particular stream operation are
>> > > > > + * supplied via the @param pointer (use __copy_from_user to get these
>> > > > > + * params).
>> > > > >   */
>> > > > > -struct drm_xe_perf_param {
>> > > > > +struct drm_xe_obsrv_param {
>> > > > >	/** @extensions: Pointer to the first extension struct, if any */
>> > > > >	__u64 extensions;
>> > > > > -	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
>> > > > > -	__u64 perf_type;
>> > > > > -	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
>> > > > > -	__u64 perf_op;
>> > > > > +	/** @obsrv_type: observability stream type, of enum @drm_xe_obsrv_type */
>> > > > > +	__u64 obsrv_type;
>> > > > > +	/** @obsrv_op: observability op, of enum @drm_xe_obsrv_op */
>> > > > > +	__u64 obsrv_op;
>> > > > >	/** @param: Pointer to actual stream params */
>> > > > >	__u64 param;
>> > > > >  };
>> > > > >
>> > > > >  /**
>> > > > > - * enum drm_xe_perf_ioctls - Perf fd ioctl's
>> > > > > + * enum drm_xe_obsrv_ioctls - Observability fd ioctl's
>> > > > >   *
>> > > > > - * Information exchanged between userspace and kernel for perf fd ioctl's
>> > > > > - * is stream type specific
>> > > > > + * Information exchanged between userspace and kernel for observability fd
>> > > > > + * ioctl's is stream type specific
>> > > > >   */
>> > > > > -enum drm_xe_perf_ioctls {
>> > > > > -	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
>> > > > > -	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
>> > > > > +enum drm_xe_obsrv_ioctls {
>> > > > > +	/** @DRM_XE_OBSRV_IOCTL_ENABLE: Enable data capture for a stream */
>> > > > > +	DRM_XE_OBSRV_IOCTL_ENABLE = _IO('i', 0x0),
>> > > > >
>> > > > > -	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
>> > > > > -	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
>> > > > > +	/** @DRM_XE_OBSRV_IOCTL_DISABLE: Disable data capture for a stream */
>> > > > > +	DRM_XE_OBSRV_IOCTL_DISABLE = _IO('i', 0x1),
>> > > > >
>> > > > > -	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
>> > > > > -	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
>> > > > > +	/** @DRM_XE_OBSRV_IOCTL_CONFIG: Change stream configuration */
>> > > > > +	DRM_XE_OBSRV_IOCTL_CONFIG = _IO('i', 0x2),
>> > > > >
>> > > > > -	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
>> > > > > -	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
>> > > > > +	/** @DRM_XE_OBSRV_IOCTL_STATUS: Return stream status */
>> > > > > +	DRM_XE_OBSRV_IOCTL_STATUS = _IO('i', 0x3),
>> > > > >
>> > > > > -	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
>> > > > > -	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
>> > > > > +	/** @DRM_XE_OBSRV_IOCTL_INFO: Return stream info */
>> > > > > +	DRM_XE_OBSRV_IOCTL_INFO = _IO('i', 0x4),
>> > > > >  };
>> > > > >
>> > > > >  /**
>> > > > > @@ -1546,11 +1547,11 @@ enum drm_xe_oa_format_type {
>> > > > >   * Stream params are specified as a chain of @drm_xe_ext_set_property
>> > > > >   * struct's, with @property values from enum @drm_xe_oa_property_id and
>> > > > >   * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
>> > > > > - * @param field in struct @drm_xe_perf_param points to the first
>> > > > > + * @param field in struct @drm_xe_obsrv_param points to the first
>> > > > >   * @drm_xe_ext_set_property struct.
>> > > > >   *
>> > > > >   * Exactly the same mechanism is also used for stream reconfiguration using
>> > > > > - * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
>> > > > > + * the @DRM_XE_OBSRV_IOCTL_CONFIG obsrv fd ioctl, though only a subset of
>> > > > >   * properties below can be specified for stream reconfiguration.
>> > > > >   */
>> > > > >  enum drm_xe_oa_property_id {
>> > > > > @@ -1571,11 +1572,11 @@ enum drm_xe_oa_property_id {
>> > > > >
>> > > > >	/**
>> > > > >	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
>> > > > > -	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
>> > > > > +	 * reports, previously added via @DRM_XE_OBSRV_OP_ADD_CONFIG.
>> > > > >	 */
>> > > > >	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
>> > > > >
>> > > > > -	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
>> > > > > +	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: OA counter report format */
>> > > > >	DRM_XE_OA_PROPERTY_OA_FORMAT,
>> > > > >	/*
>> > > > >	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
>> > > > > @@ -1596,13 +1597,13 @@ enum drm_xe_oa_property_id {
>> > > > >
>> > > > >	/**
>> > > > >	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
>> > > > > -	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
>> > > > > +	 * stream in a DISABLED state (see @DRM_XE_OBSRV_IOCTL_ENABLE).
>> > > > >	 */
>> > > > >	DRM_XE_OA_PROPERTY_OA_DISABLED,
>> > > > >
>> > > > >	/**
>> > > > >	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
>> > > > > -	 * @exec_queue_id. Perf queries can be executed on this exec queue.
>> > > > > +	 * @exec_queue_id. OA queries can be executed on this exec queue.
>> > > > >	 */
>> > > > >	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
>> > > > >
>> > > > > @@ -1622,7 +1623,7 @@ enum drm_xe_oa_property_id {
>> > > > >  /**
>> > > > >   * struct drm_xe_oa_config - OA metric configuration
>> > > > >   *
>> > > > > - * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
>> > > > > + * Multiple OA configs can be added using @DRM_XE_OBSRV_OP_ADD_CONFIG. A
>> > > > >   * particular config can be specified when opening an OA stream using
>> > > > >   * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>> > > > >   */
>> > > > > @@ -1645,8 +1646,8 @@ struct drm_xe_oa_config {
>> > > > >
>> > > > >  /**
>> > > > >   * struct drm_xe_oa_stream_status - OA stream status returned from
>> > > > > - * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
>> > > > > - * query stream status in response to EIO errno from perf fd read().
>> > > > > + * @DRM_XE_OBSRV_IOCTL_STATUS obsrv fd ioctl. Userspace can call the ioctl to
>> > > > > + * query stream status in response to EIO errno from obsrv fd read().
>> > > > >   */
>> > > > >  struct drm_xe_oa_stream_status {
>> > > > >	/** @extensions: Pointer to the first extension struct, if any */
>> > > > > @@ -1665,7 +1666,7 @@ struct drm_xe_oa_stream_status {
>> > > > >
>> > > > >  /**
>> > > > >   * struct drm_xe_oa_stream_info - OA stream info returned from
>> > > > > - * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
>> > > > > + * @DRM_XE_OBSRV_IOCTL_INFO obsrv fd ioctl
>> > > > >   */
>> > > > >  struct drm_xe_oa_stream_info {
>> > > > >	/** @extensions: Pointer to the first extension struct, if any */
>> > > > > --
>> > > > > 2.41.0
>> > > > >
