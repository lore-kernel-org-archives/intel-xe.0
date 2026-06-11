Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CC2CD98C5
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 00:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFCA10EC40;
	Thu, 11 Jun 2026 00:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFJxzk1A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A68310EC52
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781136947; x=1812672947;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ESxBzPeqFmjFL/YETiZ10oC/lCO6tlDmWOxzTbYKNbc=;
 b=XFJxzk1A59lVciMHQ272mZk5T8C2ZVmVUaUv50cAraE0KdnFzPk2ZuF9
 I2eMg7UPvr/tq9xhgAu2tzT6bye0KMrxVAr4bLwbyTE62NcqoaMi/NGzf
 9CvDPoKw4RRZuTPsQd1VdO8LnI+C37KDxFwU2yjXp12Jb3PGfLrukKiuP
 N5X6udmM28oev+ku65sGLVWMNtThd8bRr47PXl+u/C+tAHOL7Y7YsBhI7
 bJZFAdQPXZJDzZYU2/wli6xLjUpM0FWhLj+hZTNov/jPLw3D749QfG9D0
 oba347qJyrDumy9itlzadK5eMyicjYrlOsU9iqIgwigI455QkXaz+9QMT Q==;
X-CSE-ConnectionGUID: jC+4ozxlT/C1hNG+BprRlQ==
X-CSE-MsgGUID: 8Q8u7q5uTPeoiKo0zyWhrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93053734"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93053734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 17:15:46 -0700
X-CSE-ConnectionGUID: 2qZFaOMuTA2r3Xl7W3k89g==
X-CSE-MsgGUID: gSkLuW3FTjGmcH3bxhiIZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270333892"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 17:15:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 17:15:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 17:15:45 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 17:15:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6HU6msYg2qqRY7qB3sC3UjJAK3ICB7nlLfTM4mHRDl1hDaBBs2fWhjqwylpGGKzfNFZsQ7kiELmW+1oKSPKo52jEkWzHRN5j5N6arpZKFM2Db94n7aqSi2l7dFzECkOirohCyXzkZax3rJ2crbaWZh5necyfsrO4SY/bjo/4Pn++J77b51sKbepZqym/WgGlp2VWSsQQVi02iWAREtlONOU/L4zX13MpJPZ5tw/JO3/zHmNsxdW/F3HWP7hMx0F4agB2P+Ska3hnl/Xz9D8oNUPCcyQi2DLjYNca89wonj6mQSnonMJFyCBRNovcOGGVxUnZjR1jUlsj699t8hlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSjyWjeeY6HS8/fW65AJI9rjKIPXvpOX7Mn17mROCHk=;
 b=qz4+LlISTO0B/dCVCcZWzkoPNjp0rIGE6rlkUGVJx454oTdwBNbQ9/B8VBp8r4poVo/5vHfJpraK/MPs6UHm77DB99J3EFbGBBR34g4R/9+fPNvN/B7wLGSvnsV39KoPykhQC58vgx0hlqgCfgSVaXk130W2MmSbEn2zoZAKaFV63dQ5Gg4PQGzFyC0Y3JPPvqDLFc3TVaUOFZDD4USi/MpICAETuGhL3n9xXERaW1ppVegSyCxroCxPVWlHIKd6RQMWCSoZBGd7zUQAq6SG63tUhBkz879SZIHtYj5qSB9YpFirMSj3UBG4sr3n28/1ltYmJVXg8rQWFysFLcNsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8228.namprd11.prod.outlook.com (2603:10b6:8:180::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 00:15:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 00:15:37 +0000
Date: Wed, 10 Jun 2026 17:15:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/multi_queue: preempt primary on queue group suspend
Message-ID: <ain+J8bCGhLtnCJB@gsse-cloud1.jf.intel.com>
References: <20260608021059.1037822-2-niranjana.vishwanathapura@intel.com>
 <ainBeTIG8DkoxI4G@gsse-cloud1.jf.intel.com>
 <ainYa3M6FkFWUpaG@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ainYa3M6FkFWUpaG@nvishwa1-desk>
X-ClientProxiedBy: MW4PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:303:16d::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aea8707-35e6-42ef-e8bd-08dec74e9026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|6133799003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: h+ARFnN5OboZIBQaXfFDIvyAkmGY7I81mh380MH6exVm0mNux57KFk0M5CICp7r3P6T6Xk6mw0KmKU8CulWLNmSmBnyT65fyeMP+66MCzpiXtJ4SArJd3lWthoz+mnRh/8rnLP8V2jYJ88ggCPGc04ouBzTz+n1mx1LBVogibk3UTKmIFLcISbh+fyhp/RhAr2QoXQksMNhprExrNctO1mn/6TySTa0cRf3iief+XI7N/kQdtILaVoCkm0t3pED6JC757o5ZyB/cCGa57ieLWrhiS6CUSlsMhC8FOHauI7liQF4ZjaMweTLfdUgD8S3GM1LmiCjoPAJX+InK8g7kZ6SU9Zc5FadF2iFei1O8+JAQ8PQDGk2iQ0np7JrtRrfb1dLXe6rojVdc3w7lzM1aB08zMLiU+DBdLRmzwcbS7zgaKe0pHyMJcsWe2hyMV/d6hsOdPjNFxFwnM6YQZVQpvKZ5pAii67/FVEObN1dzz160/AQtzmPpcc0vhEHgYR8qyFSgiy5BDkjfuGOvEiCHu10gN/jdWiuhgrd2fPg0xQfeV13eQu3z4Q42mcKQ+LlS5uY1zS1GgG3MAqT/HqoCsSiijuVcI0/YoZq8Qd+WDSoGCdf/6g541tf1mMAC+ztSgv9hVH2DFYKWnN9o7VcgJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG5maDIrcGJPYWRSQTV0VjQ4QlUvN1JIcmV5cXljZkJkaWc1OWpuT1MvUnli?=
 =?utf-8?B?SDl6dDE4NFNpS2oveHBMWnRHYWRWbFdCN0JSQTVYZ0ZzdHQrQkZRT1FYV2FC?=
 =?utf-8?B?Z3RDSVpYeld5eTVRalZ2aGRtbk01K0hkeUU0K2piSFFlbHlEaHRKRy9rMFB2?=
 =?utf-8?B?Um54OWhqZmJRbnAxNXNVbE1tbGZnUkVhK1lRbk5vMlNnTHBMOWJwdGZ6WWsz?=
 =?utf-8?B?RHdFVVE1QVVmQUR6dWNKMHhkV3JKZ0VGSUs0WmYxSG1oYlRpTzZySzVjVlJQ?=
 =?utf-8?B?RytOK1hLT1ltUzBORmZLQ3pQTURxOWpUdEFUbVF6SVQ4ai9FajdJNTdYdG5M?=
 =?utf-8?B?UVhpMHNEZjJNQUZpWCthUWVDUDRXRGx1Rk4rOW5OeW9relQ5ZUdTbkQ4UEd2?=
 =?utf-8?B?RkNZVWE3cjBiYjZlcDZUOXpiV0NTK3FsTWZ1YVVBOEdEajB4QVFaMEVGaDNP?=
 =?utf-8?B?Y1IvNXovU1V3TW01U2puK0d2TytsTEJ5eUR3bHVZRmRZSUNZbFBnenpIdVp2?=
 =?utf-8?B?WGFXNy9FdGhwTlZraFZONVo5bWV6bnVxbFRrdHgybUxsUkdqNUoybU0yTWN0?=
 =?utf-8?B?TXJuMzRoSEpTcVZOaVRuVlpQemxIM2dUZWh2TkR0alFFWGozOFBhWU9xZndU?=
 =?utf-8?B?U09nMjhUeHRZVDY4cVQyR3hRMitaRkNRYVRuMU5WNFBRYTN4cGRYVUEwaDRr?=
 =?utf-8?B?SjJZOUt6aDVXMTFJM1YwekQ2VmR6YURBbWVvVUpSRGtWNDAvUGRKMEFQeFI1?=
 =?utf-8?B?V2hkeGh6eC9pMlljMllxd3BiOHZmWVpFaUpicTRCL3l3MHlyRzhkczdOMzVL?=
 =?utf-8?B?eDFQcTlsYlJpZ3phRnBRSU4yMVl2MVRsZVFlZ0VjbVgrVm9xcVFkZDYweW9B?=
 =?utf-8?B?bkEvSndwaHBaMXI2TDdBNEZMazNmZHM4SHVoWXl5citza3R1NTFqQzNsNHhT?=
 =?utf-8?B?aWhDRXZaT2tNc0lHdzZKVlJjQ3F2TGZIbzdGWmFYb0o0dzBYaENQSEk0c3ZR?=
 =?utf-8?B?Vk16a3ZHenA5WGszQWM0QXZmV1laOG15a1hITldReW40Uk96ZDZLUzdOT3ZR?=
 =?utf-8?B?SkZYdmNkeHcvdXUyakFjNlVvWm8xbFNRQ2wvczQ4UHBXaTY2WTJQM3dpZ2Za?=
 =?utf-8?B?T1F5Z3pvN0lyRkRScDgrK1U0OWVxNzdKZ0VZV2MweUFFZVFDWnkxQ09xY0kr?=
 =?utf-8?B?cG9teEQvMWZyWTNBc3dFRmdGeXlxdEplWTBJNytPOGZud0ExTWV6SmR0d2xv?=
 =?utf-8?B?MDhEdXRxeEs1Rjk0YnJCak1ORVVodXg1TzgyTHAvbk9XWVhZd3NNNE44WmJO?=
 =?utf-8?B?QTFvNGRyTGd4Z2tEQWZSdG1HQmlPV2ZOaTI4dkRJQmRGWkhrY1EwYU1HZ0dL?=
 =?utf-8?B?cHEwWXppcWVSWVM4NHpOcFlaRTNHN005YVY1Z3lkWm5rVU54cVUxNmZDU3pM?=
 =?utf-8?B?Q0pMWEhlV1M4bTNJU0M0aU9LMUUrUHF4MFI1S1hpT1FOUVpQcWtGVkx6UEt0?=
 =?utf-8?B?UXkyS3J5cStkUFVaSGkvZXkxejRFNStidFZxNGhOYWNtOW82NkIyWGprVXJP?=
 =?utf-8?B?bFJMSHhnb1NldC8zcVVnMmNrQ0lWbGluQWowTExDQWx1TXpGNU1PRUlFSmp0?=
 =?utf-8?B?Yi9XL1M2K2IxaGVnalZRZHhJT2hRN0Jsa3JyN1hUWXp4YkIrbFdpNzFRcENt?=
 =?utf-8?B?c0lRNjk4L05GQ0VYVE1VbkMzZFY3amFITXFJUHM3YUlWTzluQldaZ3d0N1c0?=
 =?utf-8?B?bzd1MDJYWjhBbGpmZXZHamtkRXdzVTJIUFhoMTFmeEhmakZxY3dsS2VuWkxm?=
 =?utf-8?B?SFFvT1pWdHV3MFdYTCs4L3VwME1aVlI1YWV3Wks0dUhkekRPN2JZTUs5S0Jo?=
 =?utf-8?B?bzhQaTdhL0d3ZVVlMXVONUZzSVR0ZlU1dnhxeTVzTEFncEV0OWc0WFM3NFRo?=
 =?utf-8?B?NHp0SndUcWlsWGNacWdPd0JtRGMvMVhMQk04aGgzbUZiR2ZlWGpqYXVSTWx6?=
 =?utf-8?B?K2o1V0N0Yk45enpDQU1hUG4zbkdwTjUrWFJKUFFhY2xRdWNycWxTVERsWGR3?=
 =?utf-8?B?bGF3QXpmNHkrR0c3NlZHbGdGTDlCWFU0R3RvSXVWT3lWVHQwWXJPOFRBa0h1?=
 =?utf-8?B?RXREc2syWERrWEFyUGtoMHNubkNuWFcrdGlMK3RpWW95VDJCa0pMVUxVdWlm?=
 =?utf-8?B?Nnl3V1d6Z2tHWnBzRklaeGp2UEFNU2EyK2xoUFdPZzh1MWhyaUhZQ2YrUjgr?=
 =?utf-8?B?MDVtSUVyVEhINUVtQ3Y4MUw3M24vTnBYdktFa2ZrYlBOMDdtSHIyT3d5NGJx?=
 =?utf-8?B?M3hhTW5KaXV4NU5peEc1YjVlWEhFRXg0UG90RStSby9Ec05xY2JQUmVUcENm?=
 =?utf-8?Q?16SkhKJGtk8qoGZk=3D?=
X-Exchange-RoutingPolicyChecked: Ys2Liv69QF3CqyPa945K5oWzQhV5vtI1pdUlavIJ+SvRzuEg7cbNOFLV2RjxtueofTfl5tw0V/67y7kOiA3FMfnpUx5dvgB3UVdm5HfOndzWh/d3YJ0Tj30ayrZVVm2BZEc7XfdyArpBLtJa8ITxg1NhyiJduuRrHAJNVQ5VEbXnOl53bjzztdyyd6mi5Sq/1odueOrwea69B6wL8eYRN27cnnG1k0kJXw857wkDceYrvDU0YbSOywS5sS4L208agD2yhqROXOIWnYPgyZOLhMRvAHnVPJJGs/uYoa3XUWicKr0WJQH/e5V8LtNJl/x4H4zstyPyxNR69+CewFpq5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aea8707-35e6-42ef-e8bd-08dec74e9026
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 00:15:37.5020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvmcRwBIBlcgWDc4D0NY2+LQDjGQuI3ADOqjmIoc7n16deAJNrgB18k4rOpAxaLlwgskpmJmd/KmPrOayFFm4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8228
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

On Wed, Jun 10, 2026 at 02:34:35PM -0700, Niranjana Vishwanathapura wrote:
> On Wed, Jun 10, 2026 at 12:56:41PM -0700, Matthew Brost wrote:
> > On Sun, Jun 07, 2026 at 07:11:00PM -0700, Niranjana Vishwanathapura wrote:
> > > In a multi-queue group only the group's primary queue interfaces with
> > > GuC for scheduling; suspend/resume of secondary queues is handled
> > > internally and is not forwarded to GuC. As a result, suspending a
> > > secondary queue alone (e.g. on its preempt fence signalling) does not
> > > disable the primary's GuC context, so in-flight GPU work of the group
> > > is not actually preempted.
> > > 
> > > Route group suspend/resume through the primary using a group level
> > > reference count. The primary's GuC context is disabled on the first
> > > suspend of any group member and re-enabled only after every suspended
> > > member is resumed. A per-queue preempt_suspended flag makes the
> > > resume-all-queues-each-rebind-cycle behavior idempotent and keeps the
> > > count balanced, including on queue teardown. The secondary's own
> > > scheduler state machine is still suspended/resumed internally so its
> > > state stays consistent.
> > > 
> > 
> > Overall I believe this makes sense. A few comments below.

I just reviewed Thomas’s patch here [1], which is conceptually similar.
I’m wondering whether you should first pull into Thomas’s patch [1],
rebase on top of it, and make the suspend count logic congruent between
the two patches.

Matt 

[1] https://patchwork.freedesktop.org/patch/727811/?series=167032&rev=3

> > 
> > > Assisted-by: Github-Copilot:Claude-opus-4.8
> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  17 +++
> > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 173 +++++++++++++++++++++--
> > >  3 files changed, 181 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 1b5ca3ce578a..df95855a3d61 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -842,6 +842,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
> > >  	group->primary = q;
> > >  	group->cgp_bo = bo;
> > >  	INIT_LIST_HEAD(&group->list);
> > > +	spin_lock_init(&group->suspend_lock);
> > >  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> > >  	mutex_init(&group->list_lock);
> > >  	q->multi_queue.group = group;
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 2f5ccf294675..30c5dfcc58fb 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -62,6 +62,16 @@ struct xe_exec_queue_group {
> > >  	struct list_head list;
> > >  	/** @list_lock: Secondary queue list lock */
> > >  	struct mutex list_lock;
> > > +	/** @suspend_lock: Protects @suspend_count and queues' @preempt_suspended */
> > > +	spinlock_t suspend_lock;
> > 
> > Can you mention suspend_lock is nested outside of the queue's message lock?
> 
> Ok, sure.
> 
> > 
> > > +	/**
> > > +	 * @suspend_count: Number of queues in the group currently preempt
> > > +	 * suspended (e.g. due to their VM's userptr invalidation). Only the
> > > +	 * primary queue interfaces with GuC, so the primary's GuC context is
> > > +	 * kept disabled while @suspend_count is non-zero. Protected by
> > > +	 * @suspend_lock.
> > > +	 */
> > > +	u32 suspend_count;
> > >  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> > >  	bool sync_pending;
> > >  	/** @banned: Group banned */
> > > @@ -176,6 +186,13 @@ struct xe_exec_queue {
> > >  		u8 valid:1;
> > >  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
> > >  		u8 is_primary:1;
> > 
> > For valid and is_primary, could you mention that these values remain
> > static from initialization to destruction, since part of the bitfield is
> > dynamic and protected by a lock?
> 
> Ok, will mention.
> 
> > 
> > > +		/**
> > > +		 * @multi_queue.preempt_suspended: This queue is currently preempt
> > > +		 * suspended (e.g. due to its VM's userptr invalidation) and is
> > > +		 * accounted in the group's @xe_exec_queue_group.suspend_count.
> > > +		 * Protected by @xe_exec_queue_group.suspend_lock.
> > > +		 */
> > > +		u8 preempt_suspended:1;
> > >  	} multi_queue;
> > > 
> > >  	/** @sched_props: scheduling properties */
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 4b247a3019d2..8ec3ab24048f 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1657,11 +1657,22 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > >  	return DRM_GPU_SCHED_STAT_NO_HANG;
> > >  }
> > > 
> > > +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
> > > +
> > >  static void guc_exec_queue_fini(struct xe_exec_queue *q)
> > >  {
> > >  	struct xe_guc_exec_queue *ge = q->guc;
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > 
> > > +	/*
> > > +	 * A queue can leave the group while still preempt suspended (e.g.
> > > +	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
> > > +	 * which suspends it). Drop its contribution to the group suspend count
> > > +	 * and resume the primary if this was the last suspended queue.
> > > +	 */
> > > +	if (xe_exec_queue_is_multi_queue(q))
> > > +		guc_exec_queue_multi_queue_drop_suspend(q);
> > > +
> > >  	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > >  		struct xe_exec_queue_group *group = q->multi_queue.group;
> > > 
> > > @@ -2147,20 +2158,82 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > >  	if (exec_queue_killed_or_banned_or_wedged(q))
> > >  		return -EINVAL;
> > > 
> > > -	xe_sched_msg_lock(sched);
> > > -	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> > > -		q->guc->suspend_pending = true;
> > > -	xe_sched_msg_unlock(sched);
> > > +	if (!xe_exec_queue_is_multi_queue(q)) {
> > > +		xe_sched_msg_lock(sched);
> > > +		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> > > +			q->guc->suspend_pending = true;
> > > +		xe_sched_msg_unlock(sched);
> > > +
> > > +		return 0;
> > > +	}
> > > +
> > > +	/*
> > > +	 * For a multi-queue group only the primary queue interfaces with GuC
> > > +	 * for scheduling, so the group is preempted by disabling the primary's
> > > +	 * GuC context. Route all group suspends through the primary using a
> > > +	 * group level reference count: disable the primary's GuC context on the
> > > +	 * first suspend so the GPU is actually preempted, and keep it disabled
> > > +	 * until every suspended queue in the group is resumed.
> > > +	 *
> > > +	 * Set the primary's suspend_pending while holding @suspend_lock so a
> > > +	 * concurrent suspender of the same group cannot observe a not-yet-pending
> > > +	 * primary and have its suspend_wait() return before the GPU is preempted.
> > > +	 */
> > > +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> > > +		struct xe_exec_queue_group *group = q->multi_queue.group;
> > > +		struct xe_exec_queue *primary;
> > > +		struct xe_gpu_scheduler *psched;
> > > +		struct xe_sched_msg *pmsg;
> > > +
> > > +		if (q->multi_queue.preempt_suspended)
> > > +			break;
> > > +
> > > +		q->multi_queue.preempt_suspended = true;
> > > +
> > > +		/*
> > > +		 * Disable this queue's own scheduler state machine too. For a
> > > +		 * secondary this is handled internally (not forwarded to GuC),
> > > +		 * but updating its state is still required. The primary's own
> > > +		 * state is updated by the GuC suspend issued below on the first
> > > +		 * group suspend.
> > > +		 */
> > > +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > +			xe_sched_msg_lock(sched);
> > > +			if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> > > +				q->guc->suspend_pending = true;
> > > +			xe_sched_msg_unlock(sched);
> > > +		}
> > > +
> > > +		if (group->suspend_count++)
> > > +			break;
> > > +
> > > +		primary = xe_exec_queue_multi_queue_primary(q);
> > > +		psched = &primary->guc->sched;
> > > +		pmsg = primary->guc->static_msgs + STATIC_MSG_SUSPEND;
> > > +
> > > +		xe_sched_msg_lock(psched);
> > > +		if (guc_exec_queue_try_add_msg(primary, pmsg, SUSPEND))
> > > +			primary->guc->suspend_pending = true;
> > > +		xe_sched_msg_unlock(psched);
> > > +	}
> > 
> > Maybe a static helper for this code? e.g., guc_exec_queue_multi_queue_suspend?
> > 
> > Also assert is multi_queue in the helper.
> 
> Ok, will do.
> 
> > 
> > > 
> > >  	return 0;
> > >  }
> > > 
> > >  static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > >  {
> > > -	struct xe_guc *guc = exec_queue_to_guc(q);
> > > -	struct xe_device *xe = guc_to_xe(guc);
> > > +	struct xe_guc *guc;
> > > +	struct xe_device *xe;
> > 
> > This should be able to left as is given guc, xe shouldn't change based
> > secondary vs primary, right?
> > 
> 
> Yah, makes sense.
> 
> > >  	int ret;
> > > 
> > > +	/*
> > > +	 * In multi-queue mode the primary owns the GuC scheduling context for
> > > +	 * the whole group, so wait on the primary's suspend to complete.
> > > +	 */
> > > +	q = xe_exec_queue_multi_queue_primary(q);
> > > +	guc = exec_queue_to_guc(q);
> > > +	xe = guc_to_xe(guc);
> > > +
> > >  	/*
> > >  	 * Likely don't need to check exec_queue_killed() as we clear
> > >  	 * suspend_pending upon kill but to be paranoid but races in which
> > > @@ -2204,11 +2277,91 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
> > >  	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> > >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > > 
> > > -	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
> > > +	if (!xe_exec_queue_is_multi_queue(q)) {
> > > +		xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
> > > 
> > > -	xe_sched_msg_lock(sched);
> > > -	guc_exec_queue_try_add_msg(q, msg, RESUME);
> > > -	xe_sched_msg_unlock(sched);
> > > +		xe_sched_msg_lock(sched);
> > > +		guc_exec_queue_try_add_msg(q, msg, RESUME);
> > > +		xe_sched_msg_unlock(sched);
> > > +
> > > +		return;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Resume is called for every queue of the VM on each rebind cycle, so
> > > +	 * only act if this queue was actually suspended. Re-enable the primary's
> > > +	 * GuC context once the last suspended queue of the group is resumed.
> > > +	 */
> > > +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> > > +		struct xe_exec_queue *primary;
> > > +		struct xe_gpu_scheduler *psched;
> > > +		struct xe_sched_msg *pmsg;
> > > +
> > > +		if (!q->multi_queue.preempt_suspended)
> > > +			break;
> > > +
> > > +		q->multi_queue.preempt_suspended = false;
> > > +
> > > +		/*
> > > +		 * Re-enable this queue's own scheduler state machine that was
> > > +		 * disabled on suspend. For a secondary this is handled
> > > +		 * internally (not forwarded to GuC); the primary's own state is
> > > +		 * re-enabled by the GuC resume issued below on the last group
> > > +		 * resume.
> > > +		 */
> > > +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > +			xe_sched_msg_lock(sched);
> > > +			guc_exec_queue_try_add_msg(q, msg, RESUME);
> > > +			xe_sched_msg_unlock(sched);
> > > +		}
> > > +
> > > +		if (--q->multi_queue.group->suspend_count)
> > > +			break;
> > > +
> > > +		primary = xe_exec_queue_multi_queue_primary(q);
> > > +		psched = &primary->guc->sched;
> > > +		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
> > > +
> > > +		xe_gt_assert(guc_to_gt(guc), !primary->guc->suspend_pending);
> > > +
> > > +		xe_sched_msg_lock(psched);
> > > +		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
> > > +		xe_sched_msg_unlock(psched);
> > > +	}
> > 
> > guc_exec_queue_multi_queue_resume?
> > 
> 
> Ok, will add.
> 
> Thanks,
> Niranjana
> 
> > Matt
> > 
> > > +}
> > > +
> > > +/*
> > > + * Drop a leaving multi-queue member's contribution to the group preempt
> > > + * suspend count and resume the primary if it was the last suspended queue.
> > > + * See guc_exec_queue_fini().
> > > + */
> > > +static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
> > > +{
> > > +	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
> > > +		struct xe_exec_queue_group *group = q->multi_queue.group;
> > > +		struct xe_exec_queue *primary;
> > > +		struct xe_gpu_scheduler *psched;
> > > +		struct xe_sched_msg *pmsg;
> > > +
> > > +		if (!q->multi_queue.preempt_suspended)
> > > +			break;
> > > +
> > > +		q->multi_queue.preempt_suspended = false;
> > > +		if (--group->suspend_count)
> > > +			break;
> > > +
> > > +		primary = xe_exec_queue_multi_queue_primary(q);
> > > +		if (primary == q ||
> > > +		    exec_queue_killed_or_banned_or_wedged(primary))
> > > +			break;
> > > +
> > > +		psched = &primary->guc->sched;
> > > +		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
> > > +
> > > +		xe_sched_msg_lock(psched);
> > > +		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
> > > +		xe_sched_msg_unlock(psched);
> > > +	}
> > >  }
> > > 
> > >  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > > --
> > > 2.43.0
> > > 
