Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E1FCAC583
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 12:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9566710E248;
	Tue,  9 Sep 2025 12:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdwT5MgE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E66C10E248
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 12:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757420593; x=1788956593;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hzcXiRRcq0cAhXfGrTpdXa4CVogy0VD96uJ+3Q1utj4=;
 b=UdwT5MgE6oOYqBeJhwnmJYzbEGul2VwxU7/vP9VGeSTuugacZUUDc+//
 tBz2qCZ8iUaSqQCH8Nfc2EjsM/UmKWh7YlqQw+9R8AB56lTJsuOOr19YN
 YuuvDCr5PV4Hy30Wa7W1cXCtvpinVMk1viziQKnndEwtLJhpxqI8O7PKq
 WJrf5MEZP7w9LBgo+2b5k8spx333UMFJpIQhonMlJdCN2iUgUDVt8bHDL
 ps5yzegkeoJL6S56WqKLRkaMs0C5zVFAGe9JlNInbwzbiLadufkGQlqvL
 QvCtMEF+kSpp2SQg4+Wqh0EzvSupT1LjsGX6JMVdD96n+/UT9G6R58MVG Q==;
X-CSE-ConnectionGUID: 3+5wWguFS/Oimf3q3nnUMw==
X-CSE-MsgGUID: +hP5OzVBSiOg+T0jjdK2Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59651785"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59651785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:23:12 -0700
X-CSE-ConnectionGUID: +1nnEhEXQ0W89f+usHBBzA==
X-CSE-MsgGUID: oBORq7ZWTuSAs7Usn3ETgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173538222"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:23:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:23:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 05:23:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:23:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5pJI0PZHAYKboFvjsWcHMWF72ebtcGuOrkSNgANMHZ64k7yPpNPl0+IcYpgzh4yN+Fu+STV3shonFDUJehBZP7Ve7IdF3W64bU4xHhpm7l6ooXOSk9mePrbnbja2DGWsGYd/sowKsy4lm2GpIjICENNUee3EF2g6woh59J/CULFiQDhiBrzoVKTkWbesmr0K78WcZUuInefMP0JMiYh+XvT2xMh2bYTkUZP7PjZAR/EGRPNjduBwoFPOu6B90WACo4ohJFtiBEbgRygGwOx+iRIeSAimFJIZ+xefu3Xe5wLRGeWCP38rCie85noucLIlz6jjGlQfoFw76u/jV/Osg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNYG5eyMVmohkRmHOi5g5uoAGvhOSTOROM6tYfwQV9c=;
 b=oldGXS5x+w/nLVubpmVQGugOId6fiwKJLCATEosjPalEBHLtcmoxQnQ5shkCym1gPRoLjld+FVrO0TAoJnpDT0Qpr6tDEpRV74ZT8sxmU/Or8v2DlxWd0pPYOD1lFtMhaTLTP1tiZN8wzSIzrFFeMFEcNh5DmlpP2YkY1YundcmfaNeQcHKumhPA8czoDpuA+a8CMrLyA+uwogp7cCWTC+mJpXID9kIGEmede37jEalQURMvRvHpJdFVYAfG+Yo3CgzQIjJBL5duiJ+0qLehppukqb2x+EGN+16P6HTcW9EqM7KyWIgAR5CHNRodyJplaBlOP0sSQxfRqRQOkLDlPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9280.namprd11.prod.outlook.com (2603:10b6:208:56f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 12:23:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 12:23:01 +0000
Date: Tue, 9 Sep 2025 07:22:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, "Vinay
 Belgaumkar" <vinay.belgaumkar@intel.com>, John Harrison
 <John.C.Harrison@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 4/4] drm/xe/pcode: Refactor pcode_try_request() to use
 poll_timeout_us()
Message-ID: <zwgczjyctqblqnxb25sdcp7rditv4da4hidxfpo64erkei6jti@7k3eqved6jnk>
References: <20250828-xe-iopoll-v1-0-9832ccd1c8b1@intel.com>
 <20250828-xe-iopoll-v1-4-9832ccd1c8b1@intel.com>
 <1896b8fb-74de-4549-a531-d76989dcbfb9@lankhorst.se>
 <ljtjibcl6ivqeva66d2rsofgwu7o4vt4zrx7qumb3s5gw65vbv@mclxcipdw5jf>
 <e42df19b-a82d-4893-be03-2843dd2a56d1@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e42df19b-a82d-4893-be03-2843dd2a56d1@lankhorst.se>
X-ClientProxiedBy: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 775f569d-7c99-428b-23c3-08ddef9b9e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jyZjMcM72OsVaFvHk5G2Wzf1a61G+W+XFXSd7iubxUUBXVRF9FNQHyCOuw?=
 =?iso-8859-1?Q?1VVqM1c5qTmrKj3Ox2kN9t1ntxR2JaBgzgRrMaFgNID71oYpcMYYxwUJBM?=
 =?iso-8859-1?Q?jHhqeyQVjdr7Ji4jB4CiUa0B3UWGb/0mMMKP2HShg1pbS0gByrAls3x6YZ?=
 =?iso-8859-1?Q?Bp2f5oJocXuCWEYMnn661wj7d2c6/IPJLsRC2uM6UXb15dPQwoucCJ9rml?=
 =?iso-8859-1?Q?fmDnlAO++r8aKc43QVF4IOty/LouUZYGLfIObWAcSkG4rMYji++xHvhQBN?=
 =?iso-8859-1?Q?9px+mWwWt/XXCDMHBL1BHz6mI6ZJF5QjiTPtLvhCG+QtRahbRoFPFLsGq1?=
 =?iso-8859-1?Q?YOYWbwG81+pTriQFIAggyrlu7+Zlp1myxwqYm7KX13i2RqvH4zNXTlTn5f?=
 =?iso-8859-1?Q?kyvEd4Q6AbZWNoB2BHi9CSKqfqBt0v6as2RqYiJZshEzFf7nwDBy7fCZVS?=
 =?iso-8859-1?Q?MEKwdtgEuyWsyllcYMVI7bLTYkQz6wupGBIgR14QR3C+yKgQjRXsdoQOBT?=
 =?iso-8859-1?Q?kNJwLGofnKStnfSG6WOdobRc8SJ6yPCEfK6xH/LWfseLIlwcUMzeVE6pyT?=
 =?iso-8859-1?Q?8jJkFfENa3Gwta5XpMBUEYdAMvXj5D1pSB1fK6pHeH8nKYcfPT0+vLdpzD?=
 =?iso-8859-1?Q?8HObNT4yS8l8BdZ2QJA2fM/oPZDOIn5VmCk2oL/x5jvSoMvAcSehgp52wM?=
 =?iso-8859-1?Q?ko0UF8SN0mR8y6gGsh+BipkaYmmTJSqW3DH937jM0fBNXSu1U08UbZ86qU?=
 =?iso-8859-1?Q?usMoWAqzth+DXeVbbSiA8RU5ulcI//C0+oo9oVbfmrLcI4sf1B8Sp0jS2A?=
 =?iso-8859-1?Q?Fi6i++hKjUcANRIjjyn3A12Svp4SUg69ucHjsSJpzB/CpxXmhSRdr2PjGa?=
 =?iso-8859-1?Q?DVEeag3wtg0SLQIZel/1CGcPC+i1ZjvPZZ91HjtVhu1G3JRzpRE3sXDuof?=
 =?iso-8859-1?Q?0Pg9Ao2H8i+ULGzGsZvEYpwfEGIXrg9wU5r8cad98L9GV06xTTtgVF7s7D?=
 =?iso-8859-1?Q?peNROFuIZzj7cTtsh9X/PAKx1Tnja1w3UIK+KbfpiAA/Je3tTr8n4lGOuB?=
 =?iso-8859-1?Q?XqCRoot0uO9FNabzE9wj+o0YmFkPAT9n3GxaidmTYdwSt9N28CtjDzT1+J?=
 =?iso-8859-1?Q?uPjcjgFIXCDD8iWSJ3fWS8N6EwLo3PlTp3Eve9ZKfHGjJh0+ZjJUGq5IsU?=
 =?iso-8859-1?Q?Oq5DckaefM63GOxRQYafTcT+yDrxpOLN6ok5sukAEthRrj6+jfBivYqL6U?=
 =?iso-8859-1?Q?6wsakfbSjiz1LSLttoY2jlIIHLe5yTIIcBdeMO6qbVLt2l9SURbfXW+yIs?=
 =?iso-8859-1?Q?GoDt0C+K5L7ntQRLMpmxahGbMOOWXOJuK3dLmgde3I7j0Z/HEd5mEBIb2P?=
 =?iso-8859-1?Q?Emgv15ICgJ7364eBs1oe+WecXr1RFqfHk8GnXqmv+7foRxM+1+prrALH+p?=
 =?iso-8859-1?Q?m0wyiNmAWV/lA+jdvCvEI1OeVpSFxi7IRZ4zYxnMWV83sIyQBMIbtZGGoU?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8J+TlH9fzTJbwnHILjq9AsbXNi/Fn14IyZHTcc7wzCDi8jdTTwQZvLkyKi?=
 =?iso-8859-1?Q?b6wtdrlwQ/xm2qGP9gzUxH0O1moe9p0TVFyQ7KOtxAfzKsZOoO5id4sW04?=
 =?iso-8859-1?Q?KFCgMo9vlxOPR+ga1Ihy+q0e2UQcib/iuukGdIP+gPBQxcXmPkbopX8bwN?=
 =?iso-8859-1?Q?OqtrEFau3DiPtNkueHlv8eD1bLzlpicKDjbHHltUhv1NZSCQp19tVS1p6R?=
 =?iso-8859-1?Q?rFD37eX8Kc4ptD6Goafdikn+NY3n1oPUkhg3B5IL1V+zOFOkY3X44kiRZp?=
 =?iso-8859-1?Q?wXfGEX8IN94QjSlMUflg4mA777ucd/42Bf57Hs0lLHFYXculriaMTk4VxA?=
 =?iso-8859-1?Q?+A2ha49I+6lPo6MwzVAlKtzkxb9ojgZFb0XHeTCqDgMsjFMbDWi7CmklXa?=
 =?iso-8859-1?Q?uEac3Q7XB9FOaCzIQrduq1TaLSi1ND4cgQ//81Vm8PTeLUZKam7gAKCPMP?=
 =?iso-8859-1?Q?wvak2icZpgi6dYj3eSyF2Ajmy9EmmAQvtEovrbkacfduki4iWhemvCUQe+?=
 =?iso-8859-1?Q?T3BTIJtD/DINTQxWF3RJCHMD7B3WOtpbavt3ACKY3mR1B2M+n/CaL+VtqE?=
 =?iso-8859-1?Q?kH2Rd3/b9wMhOckddJWdrIQq+CIZdzkjAK/JDj2X7DVKv/WDYSXaIg8YjS?=
 =?iso-8859-1?Q?hCU+FxyOWALUxZL5NmIixOESbAErN8cw+q/ERFPoDFOQtjkfoYtW7WbdFX?=
 =?iso-8859-1?Q?gpsnOZK33XMJDWphJKWRB3Rg/6Wll+eh4280w25QRYxdDOrAR+AR/w1Hrb?=
 =?iso-8859-1?Q?WqjugJKIvqKBxZSSEz1w1stqmQUv90OjvjH/5sbZ39vjGU3iVAqovfej24?=
 =?iso-8859-1?Q?fSxsg2kunG1uBBFhDugxx/Miqhf8DTo7bA+GSB/li7q7kPtGhS0Qwpet2K?=
 =?iso-8859-1?Q?+pVRjAb26grwxrl9xZ52ZFze8DZkbVBiMWtUdajx8nMoVgKjR81D41g1W7?=
 =?iso-8859-1?Q?cPnTEt3T5j+6xxnghDGbS1shd13HqWQos802Yq0oCEXb/05xedkNoHodx3?=
 =?iso-8859-1?Q?LjjqbnoaRT/99WAZAHTqOGQvrz75gQ2pM532tM4BgmlHCM6dmm4EeMHCsg?=
 =?iso-8859-1?Q?LFDwxc6ZrGhkaolwhR3RMO+3qX2FdXD3OiQYCfySSanPNsW8anLyqxrs04?=
 =?iso-8859-1?Q?ZWUTeyASagxcifL14Kz8V2bhuMnl/uodT/5Hwg3ZJ4bDag7Sdrs2a7sPgD?=
 =?iso-8859-1?Q?zRHPHbBL7Yz6t/Nd2NkqejZgMFkkn/CCThDiW61gm5IPEVm40+3nTAqYMm?=
 =?iso-8859-1?Q?px+i8t/KgLlGcX54sbU5zY5Us5CrTJFd53RdYGFXZD1WZBoZ4VSYuchyVO?=
 =?iso-8859-1?Q?QZVf0/i8v3fLq+1GwFqtJokfJfl452Oh2Dy/hYPvPv0cA7yXJO+jqpGDdz?=
 =?iso-8859-1?Q?CypZv2z8kX811cfZw6CFLpTPGVU6i+AbxIGYmajZsMUK8PiXX7YemySKbt?=
 =?iso-8859-1?Q?rLJYre1v1GHIcSudjVT/6QHaIU03f+dHIk2NJUWV2clDH6w/kAhWZ3RNzV?=
 =?iso-8859-1?Q?CopyXsDHCv4VYYx9iXeXvH0aIGGvnEOjxxVsDGTwcgNXMclrRq//i8h79N?=
 =?iso-8859-1?Q?b7di6cli3WxTGMOKk5yFFS5nmI22k5UE8KSBgxJDNbJwtvJCa7fw8E+UN6?=
 =?iso-8859-1?Q?+NNnG6Ur1NrOZL+m5z6Kl4Q0IqomFw0XIte6erE0nV0egTN6sS2I4Wow?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 775f569d-7c99-428b-23c3-08ddef9b9e34
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 12:23:01.2381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA86rIbJuDPKXK1Svyo/KcEQ9K2sPcYf6wJjvnpLZqKHnv/9myjhpjGt7rbW/AqB+Y/+5m8CiJHIhfnuWb0kW82xzS424FRSf/exntTO/XU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9280
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

On Fri, Aug 29, 2025 at 04:08:31PM +0200, Maarten Lankhorst wrote:
>
>
>Den 2025-08-29 kl. 15:53, skrev Lucas De Marchi:
>> On Fri, Aug 29, 2025 at 01:35:12PM +0200, Maarten Lankhorst wrote:
>>> Hey,
>>>
>>> Den 2025-08-29 kl. 00:04, skrev Lucas De Marchi:
>>>> Refactor the hand rolled wait to use poll_timeout_us(). Do a 20us wait
>>>> between reads instead exponentially growing from 10.
>>>>
>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_pcode.c | 33 ++++++++++++++-------------------
>>>>  1 file changed, 14 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>>>> index 6a7ddb9005f99..7bf5d3b9c0cc1 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>>> @@ -5,7 +5,7 @@
>>>>
>>>>  #include "xe_pcode.h"
>>>>
>>>> -#include <linux/delay.h>
>>>> +#include <linux/iopoll.h>
>>>>  #include <linux/errno.h>
>>>>  #include <linux/error-injection.h>
>>>>
>>>> @@ -135,28 +135,23 @@ static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>>>>                   u32 request, u32 reply_mask, u32 reply,
>>>>                   u32 *status, bool atomic, int timeout_us, bool locked)
>>>>  {
>>>> -    int slept, wait = 10;
>>>> +    int (*req)(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
>>>> +           unsigned int timeout_ms, bool return_data,
>>>> +           bool atomic);
>>>> +    int ret;
>>> if (locked) lockdep_assert_held(&tile->pcode.lock);
>>>
>>> and then use __pcode_mailbox_rw unconditionally?

and there was another issue about atomic vs non atomic. We'd have to
call the different poll functions. I will just leave this alone in next
rev.

Lucas De Marchi

>>
>> yeah, that would be much better indeed. But it seeems the locked arg
>> has different meanings here. In xe_pcode_ready() we do:
>>
>>     if (locked)
>>         mutex_lock(&tile->pcode.lock);
>>
>> That looks like a bug introduced in commit 933fd5ffaf87 ("drm/xe: check
>> pcode init status only on root gt of root tile")? It doesn't match its
>> kernel-doc neither in that function.
>Yeah that was what I was looking at, the 'locked' here means 'require locked access',
>so the mutex_lock() appears correct at first glance.
>
