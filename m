Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94024E6B278
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 13:11:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A19510E2C0;
	Fri,  1 Nov 2024 13:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhiJou4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D29A10E2C0
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730466673; x=1762002673;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lBi6gCFbzn+GQdOW8hxeCDDBi53U6Ouo+49T39W3qdc=;
 b=BhiJou4DJC/5fE8vU4+h2vwMGjx6WG4MskB6OjbGLzg1GcpzhJRq2m/S
 Vf77V315gT895JNnA85dVWIVHOdpuMVaCXl6tjhKoay7KkRvT4e5ay7vg
 o0hkwxBgucG3kk3SlsbqYrxtvrAEtmg/Nj4lV17xRO9U96W3BUyfmxsQJ
 q7ypo9I/YUWjrc57bmbCee5ZxYydwm9bKAFK9Ozg8DjMAomeT3oJpP9NF
 vnKS9o2psLpNHZm77oqQAIYQoJSdXTg738gXOGPfBBpiApVTWU9fcH4Iy
 /fRLUPJh7gEYzcjajMBKnnSgn6oz+Ri9NDC+VeFCAOoH/sZUXzLcTLbSM g==;
X-CSE-ConnectionGUID: 7Dv6TamjSACr2SLq9B9A6Q==
X-CSE-MsgGUID: BpxURaV5RZCZmQ7QzncRcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="47715123"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="47715123"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:11:12 -0700
X-CSE-ConnectionGUID: 4KDcYQLMQfqD9NeBHZXx1Q==
X-CSE-MsgGUID: iXNb43jYQ9m740bRLKiNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="82842346"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 06:11:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 06:11:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 06:11:12 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 06:11:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEdIdb+Ex7WCpBukO5a1hK8x5JqFfvUE8yMDwDWKL3vih2IROK7muxu3qwlAHFx41Sc6rV5994jea/2Cvx7XOdnUXYqk48UZ/lRVuKjvUSAP4dlP68zoqzBuzohzUzh+tCHO0fDzuAgN+AqUm0iHRROEqXqIchBlI4dEbh0ciGoyTnLYkYtbZ57twM4KhQ1I8L9Q19PT4x4k6xsxx+jCYpKHahvPu6FeDUwozLZ8UEQ5sY1Czmaj2RRVxUvH6XVzfI1DcnVCtt2obMn3JCGdBHYM/IiG1MiDr8c/Uj1Z/DwtVJaSUU5fxEx8uYvxR3Yr5d4YEsG/9dt6U28zJMB+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYzRIi+LeTeY7CalZP5Ln0Y3X77DaV4G7Gpb1KFKxlg=;
 b=LXWHGOaBK5YA5capM9BBQAEZhqmajeSPk4/QQR+av3FxZWEegguTo6htP4xBngnqafMIjoo4jY/0MrSPWCfxuTPYjAlSRM9roj074LdI5cvUYclJ36XFQ7x7XNUlrtj6wEfer5f21N26GHURAOOR15hjTQ7iHoHGR6DtedQfLdrEy/iI7wl7YZXZlhew0rMVl9diOhOMlY4JlcvlWaJxmx0KMyp94jfoxDZ87dr0xGgHkmHzZVGYAHOT10c/BmEFgjFbXqTjZu3c4q4pGJSWxlw09B5mTrGaNY6YlSTvfQEVwpQH3O7LqSfNWQ6mV7VOEesNi2TcJXG6rdk87KoiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Fri, 1 Nov
 2024 13:11:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 13:11:08 +0000
Date: Fri, 1 Nov 2024 08:11:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Use the filelist from drm for ccs_mode
 change
Message-ID: <i73d5dojgqd2kzwrrrh6xrbtnfkv3m3qwodp5lciql2sccsc4a@lv3fzsgquu4q>
References: <ZwVHmw8KPluuPgvC@DUT025-TGLU.fm.intel.com>
 <bl3ildwwdjswvvfpim4fgqdmlqvonccfbavdxymyxr4bdp53bn@xwd5njyqad4d>
 <ZwVS0eVGUaa8Z3v3@DUT025-TGLU.fm.intel.com>
 <l2a4np3y6htwcp7emufsrajyrozpmguwm4ucosbu2ne444jpwa@2ohs4dowlmr6>
 <ZwVq0JIEz64OhROM@DUT025-TGLU.fm.intel.com>
 <ZwVzOahncbCljo1f@DUT025-TGLU.fm.intel.com>
 <Zwe0bJJkKs3p-9Q8@bvivekan-mobl1>
 <qkxumw627jw4ukxsdywxhlzziub2324ydn43isdrp7yn5cfwta@vpipjndue5is>
 <Zwn+ZGwd4o9wNx8e@DUT025-TGLU.fm.intel.com>
 <7k7rfpbdy5ky3w3fzgg4vicrgooqdtnvhmh3fgpmgublqkhgsh@ek3j3leh2tt2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7k7rfpbdy5ky3w3fzgg4vicrgooqdtnvhmh3fgpmgublqkhgsh@ek3j3leh2tt2>
X-ClientProxiedBy: MW4PR04CA0346.namprd04.prod.outlook.com
 (2603:10b6:303:8a::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a20c8dc-bf50-403d-7963-08dcfa76a60f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DTHnfKS3Wk7p2WxuDHJ6Vw7PwTcrhtxixHbbHVzuL8Rf9iWtaVAQy1Mvu+DE?=
 =?us-ascii?Q?w8JpySlnjfnoWSJ0yR1hLyvNgIrLhB04Y7Vw3W+tU7FJ803Z9eqj4O7J91/x?=
 =?us-ascii?Q?U1aoIU8N496zWx7wC8VMo+KntckCbrlfvDTEnWhjosdpCSnnpOBEf1bMlEXv?=
 =?us-ascii?Q?xGN655Agwzj7R1ZqOYJB6PE0bty+Z8nsRTf+9oknVu1tHGTWogSbumH1f0F3?=
 =?us-ascii?Q?j7TP9aNORsZ6p8UB1By9pOJuaAHbnl/ZEysOtzDNpqdEXVt+mUi9jYkwglIH?=
 =?us-ascii?Q?tOwjE7cR1YIkYVbLdfD9KFs4ekuyoUOkdVAFWcfk3mPuvYQSE+VqrxMCIqy/?=
 =?us-ascii?Q?Mfs/jcoAH5mCwXuSxzPkHOx7htVA6giH+auPLG/J4ooc5yVOi/DZn6IGLzCA?=
 =?us-ascii?Q?9pMGzjwQcemx8FNoa1pvp/CLx0iNnVY33KyTHr3Dlc05X/pB4ubyfq5uXQ2x?=
 =?us-ascii?Q?m95uL5W6TOFoTqoa0dRakEIil2nBbY6wXhBdypFMklXmeRsXZCfitEut86nW?=
 =?us-ascii?Q?lvf9YGCzo5Puu9uHEavnMICpv62T5CRV6FZpvEEm03TVdQLsk9Yas4ZNxnot?=
 =?us-ascii?Q?gkUDqQj4XhfEx97xoSln5rxZGfzKuBbitICR1x5jcmZVLB0y/0ivHl2Sh1Ls?=
 =?us-ascii?Q?DEAP3ZtYkBdBcIyFlgmV+QS19hpZxQWjKBObZ9lsqesBxFD3MU1mw1rN/U79?=
 =?us-ascii?Q?T9vAXBRtM/YtgBvbFvqUlDJxiImdWW2xS5n2Jw2RdGd1z82sF0/76xbZcn0k?=
 =?us-ascii?Q?cVKPdboC+KX2RmQPD8NN+OMt64ZvPGkNAH0qjo1t9gdkz9sRYPDUP67MEUWy?=
 =?us-ascii?Q?Q072wLZIbYn6kaaziqJEaJ8IYT4ZWCIVzznac+IOD8v33qyhJM6YhNtqpiYY?=
 =?us-ascii?Q?yP9uReW/YzneMYinF5+XcMb4LviLt9gaef+vfWzmPjImS2E/hjX5qz1uO2L1?=
 =?us-ascii?Q?EXJq+3eN6leTP7F6q1Ws2S7G2sQnddUV7Hl0+cnM4asgu8cuCkzWFH6VWhEP?=
 =?us-ascii?Q?Wm9nqUdufwgx0KDMrARqNaAypjsvpSYwmtjjv4K/rBXIpXokZugTatVbAaq+?=
 =?us-ascii?Q?Fld8tkXO3c7XUGNNZz4ni36zFAlvcC+qa2a0clnzmtwLjNnoRBhiSx+iV1/x?=
 =?us-ascii?Q?h87zxx2C0UbZjZinnbM+Y5OOExQT7m+eFcrP3k04NCSMA9Dz+WnWjOT9Nchz?=
 =?us-ascii?Q?zIWmdvUC9cloxJFZukRFAp+FmvhZ6SVW+Y/VBFY/dHAzrmoJ55JdAgjADoU+?=
 =?us-ascii?Q?C2evysA7C/MJzLS4/NxyYtIB9MdZd2qOW+rszXIh2xiGYiMkj03xCCE1kN2R?=
 =?us-ascii?Q?OX0I5OaWAKZwDCrQ6QNUhT/Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?orssEoN57WA8+DHgkrHd24qPsFSeJ9pzlwwwhnK20PZqsB/0AqvhfQE/X9rA?=
 =?us-ascii?Q?8iCebICiwOgU3wJyf9LGyNYEvcwYUbxGL5NOcq5NUhuYHto1HE6TGNAhYANH?=
 =?us-ascii?Q?yfqLmE5tBtqzzkWnyUehJpmQFXOK7PHAI7aIMCJc/qVOCD7FsgtpByJ0gxMl?=
 =?us-ascii?Q?Go7BNWNdOR0LKACWAc9A3UfTm7se4ShiMVTMv5gXm7j3taTZ4/kmu4Sv9FXt?=
 =?us-ascii?Q?j1375JRIJZsSpCUqn3oaYPPhmSMxDBpsoHDSYwF2A2XiiNQ5Ih56eNVZYsyt?=
 =?us-ascii?Q?3Hkzuu6RUDZc7mY0Hr0buKzhw7xnH+9ZrHIUhJdjuPbr2YoQ/Qg/AG0X1ZoB?=
 =?us-ascii?Q?SOieWydOr85r1rg4Cy0yWLG5AsMR0YiE7LrLtgxAuiO9w8VHsYiLAC1UxWUo?=
 =?us-ascii?Q?0j1qV+d8PYs/+3qt1fjjH2X7EVXRBgVg9vHhohizIINPji0QpgWvcRrqSRGP?=
 =?us-ascii?Q?eEfpnwGpJOSC4QwwOpz2P4h1/fRcQHNhxp3DHpkFfyK99f4bA8u/bu7jf7Eo?=
 =?us-ascii?Q?rwBeWQOSdKmnC6oOliT4g2I7Z9SdesG2Dz/sSBKDS/yRnth/xIXo1xw+pBmI?=
 =?us-ascii?Q?+BDNZeyH2nPv0FLFr2ecsza8LN+5uxYHi0pngBuD3lS8dVtKP2BV2z1qlIUL?=
 =?us-ascii?Q?7YiaETHkp2owgs0CJyzFZFCLS4WEZbWBO14M/aZC+qbQc4JoQiV8j0+Mnbfq?=
 =?us-ascii?Q?2PZExNjGTY9bpnTW8v9H0d6ouJuEQMF+1FYP6FYLWQBBVB59IewueThAlMGz?=
 =?us-ascii?Q?NNPA0Pw/bnfXk/jAJV6liJVtkSHEiVZQRPxZouYP5QgAGlvZnmMR+vjxX6nc?=
 =?us-ascii?Q?CAcTPSt2b22pz8oQFsb9cBehfL9aGgz8YyoS/vzkIsGsuGG13/ESXXvXddPW?=
 =?us-ascii?Q?ZGjuQzBcDrVzVEyH7V0D3VvXo6lhvQiJR0DJHghJlhVjoWEw7ipYckRPCscw?=
 =?us-ascii?Q?/ApLuAoBRcG2c4eBZIOi3BwqhV/i2Oc7ki4Eq3C/auqWtkae7e0so/xUy3xR?=
 =?us-ascii?Q?15Qcy9IKHBQ6QdwkkrjxHGYInpwEgBbAP3ijnIVZjGXhlbkebSPxZEGGYJ1V?=
 =?us-ascii?Q?q3Z5vE8aM4011liIvewMC0l67XuqnJtO5SRse5UjIAbQdsF0ehi8FBr0YuQn?=
 =?us-ascii?Q?fG0vnnRBITS/7Jh/9Fr6AEbu6DPPZSYFxJuir4TpOMSEpgAOCN0TioDiHP6P?=
 =?us-ascii?Q?8ORNPkxdxNh1RG80PvCcCYyeS5FtGdaYi+AV+vB4KJDyGMcUsdUeuw7lL90k?=
 =?us-ascii?Q?FufU1WNaCqKrUohw+6icE3hayz1B2OIpfM/Tl8xDyc6oBxrRHzns+wAe1Qhd?=
 =?us-ascii?Q?LLZ84s7WU2bG/uOlV+WxGMjdb4ocHQHm5tDzqABLUMkEHEB/YSIKpDiwZjFA?=
 =?us-ascii?Q?piu7UqzxEzVBn/habhj/mFAAyRsIX1cMRSAMxJ3eqDxFX5MIFxBtms3Dy3mk?=
 =?us-ascii?Q?T8LmEGZUTk0LHRXj0uyHZIAZSp9tlQPRnudoU8BKgCl4X6WiY2JiUjOA+PYV?=
 =?us-ascii?Q?u+YwniT6i6YbzNBXKXPho6bqzqdmOEhciRHdKsfAyO9W0RH9sUES95HcFjbD?=
 =?us-ascii?Q?1j0k8rdZ08bCZ7Yk0/99fAfbGcYAXwD8V+1OpPibACN5Bf58wBOq+hDdWd+B?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a20c8dc-bf50-403d-7963-08dcfa76a60f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 13:11:08.1451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FatlZEbVZGhQBvPwWgr3aGYiVUn/c/XseeMaSQ9drTYxbJT85+FKgHe3VPalVanf1ida4JRGSzZ3ntlpAbrbGGH72XThj2mJUhKGvV4RcB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
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

On Sat, Oct 12, 2024 at 06:45:57PM -0500, Lucas De Marchi wrote:
>It looks like I forgot to Cc, so let's try again.
>
>Lucas De Marchi
>
>On Sat, Oct 12, 2024 at 04:43:16AM +0000, Matthew Brost wrote:
>>On Thu, Oct 10, 2024 at 11:02:56AM -0500, Lucas De Marchi wrote:
>>>On Thu, Oct 10, 2024 at 04:33:08PM +0530, Vivekanandan, Balasubramani wrote:
>>>> On 08.10.2024 18:00, Matthew Brost wrote:
>>>> > On Tue, Oct 08, 2024 at 05:24:32PM +0000, Matthew Brost wrote:
>>>> > > On Tue, Oct 08, 2024 at 11:55:03AM -0500, Lucas De Marchi wrote:
>>>> > > > On Tue, Oct 08, 2024 at 03:42:09PM +0000, Matthew Brost wrote:
>>>> > > > > On Tue, Oct 08, 2024 at 10:20:15AM -0500, Lucas De Marchi wrote:
>>>> > > > > > On Tue, Oct 08, 2024 at 02:54:19PM +0000, Matthew Brost wrote:
>>>> > > > > > > On Tue, Oct 08, 2024 at 01:06:28PM +0530, Balasubramani Vivekanandan wrote:
>>>> > > > > > > > Drop the exclusive client count tracking and use the filelist from the
>>>> > > > > > > > drm to track the active clients. This also ensures the clients created
>>>> > > > > > > > internally by the driver won't block changing the ccs mode.
>>>> > > > > > > >
>>>> > > > > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
>>>> > > > > > >
>>>> > > > > > > Is this really fixing anything. As far as I can tell nothing upstream
>>>> > > > > > > opens a file internally (i.e. xe_file_open) is never called directly.
>>>> > > > > >
>>>> > > > > > should fix this case:
>>>> > > > > >
>>>> > > > > > 	open()
>>>> > > > > > 	close()
>>>> > > > > > 			<---- race here
>>>> > > > > > 	change_ccs_mode()
>>>> > > > > >
>>>> > > > > > because the close is not completely sync - the cleanup where the
>>>> > > > > > previous number of clients is decremented is executed too late and
>>>> > > > > > subject to a race fixed here.
>>>> > > > > >
>>>> > > > >
>>>> > > > > Ah, ok. But then IMO just move the clients.count decrement to
>>>> > > > > xe_file_close. I try to preach solid locking / layering and this seems
>>>> > > > > to go against this idea.
>>>> > > >
>>>> > > > why do you want to track the exact same thing in 2 ways, one in drm and
>>>> > > > the other in xe? "Are there clients connected?" is something drm_file
>>>> > > > answer and doesn't need to be duplicated in the individual drivers.
>>>> > > >
>>>> > >
>>>> > > Well layering, making assumptions about the file list means, and not
>>>> > > randomly deciding what we can and can't do with locks we don't own.
>>>> > >
>>>> >
>>>> > I looked at this a bit more, if we want to do it this way then I think
>>>> > at a minimum we need a drm helper for this.
>>>> >
>>>> > e.g.,
>>>> >
>>>> > bool drm_device_user_clients_open(struct drm_device *dev)
>>>> > {
>>>> > 	lockdep_assert(&dev->filelist_mutex);
>>>> >
>>>> > 	return !!list_empty(&dev->filelist);
>>>> > }
>>>>
>>>> Still the driver would be required to use the filelist_mutex outside the
>>>> drm layer. So will not solve the layering problem completely.
>>>> Otherwise we can define two helper functions in drm, the first one would
>>>> check there are no open files and returns true holding the mutex.
>>>> The second function can be used to release the mutex.
>>>> Does it sound too invasive?
>>
>>I'd say helper to acquire / release the file lock indicating it is ok
>>for other layers to use the lock. Then add helpers with annotaions (like
>>my example) for internal access to that layer. Maybe a bit much, I find
>>myself writing code in this style these days.
>>
>>>
>>>yes, and I'd rather prefer not adding these helpers.  If someone wants
>>>to add helpers later and convert the current use cases, that's a
>>>cleanup/refactor that can be done on top. For me, these helpers are not
>>>really helping.
>>>
>>>Rodrigo / Thomas, any thought?
>>
>>Another opinion would be good. I know this seems a bit pedantic but
>>locking is about the most important thing a driver and certainly the
>>most difficult to unwind is we do it incorrectly.

I chatted with Thomas today regarding this. He is also of the opinion
that it'd be better to have wrappers in the drm layer. However since
there are already users, it's ok to add this as is and prep a conversion
on top.

 From a quick look, we'd need to add:

	drm_device_user_clients_lock()
	drm_device_user_clients_lock_interruptible()
	drm_device_user_clients_unlock()
	drm_device_user_clients_empty_locked()
	drm_device_user_clients_empty()

and discuss it in dri-devel to convert the current users. Maybe we will
also need some renames or doc updates since drm_device has:

	filelist, protected by filelist_mutex
	filelist_internal, protected by filelist_mutex
	clientlist, clientlist_mutex

which would point to actually add the helpers as
drm_device_filelist_* rather than user_clients


For now, applied both patches to drm-xe-next.


Lucas De Marchi

>>
>>Matt
>>
>>>
>>>Lucas De Marchi
>>>
>>>>
>>>> Regards,
>>>> Bala
>>>>
>>>> >
>>>> > Matt
>>>> >
>>>> > > > At least it's also used for similar reasons in amdgpu and vmwgfx:
>>>> > > >
>>>> > > > $ git grep -l -e "->filelist" -- drivers/gpu/drm/
>>>> > > > drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> > > > drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>> > > > drivers/gpu/drm/drm_client.c
>>>> > > > drivers/gpu/drm/drm_debugfs.c
>>>> > > > drivers/gpu/drm/drm_drv.c
>>>> > > > drivers/gpu/drm/drm_file.c
>>>> > > > drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>>> > > >
>>>> > >
>>>> > > The AMD / VMWGFX usage certainly looks wrong to me. If the file list was
>>>> > > meant to be traversed by drivers there should be an exported iterator
>>>> > > IMO.
>>>> > >
>>>> > > Matt
>>>> > >
>>>> > > >
>>>> > > > Lucas De Marchi
