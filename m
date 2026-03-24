Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718CFF54AD6
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 23:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DE510E626;
	Tue, 24 Mar 2026 23:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQlhh2Ds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED85A10E626
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 23:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774396417; x=1805932417;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GzbWDztl/6ajMl7EXPWayyR7QYNzYXkio3wtMNMfZaQ=;
 b=UQlhh2Dsxr35plb5lDXQCIa0jXQP8SaNrpyBtTVS8shP+dFUXdlGMX0I
 gQflhx+Ze9jq9mv+ku0HERQ1NK26yRWfhsPen5SA5AdrikNQRDtMknEee
 +bJprGZDwiGV4LwAEtE+FusmU/SdWPq/vzm68aIWGfLmfqAUyQWsk0Toy
 g+uHB2v0eG+6khNUP3ir4XnxNsw/4JUOuRbKW2JD2jQVGbyVaK682gDba
 cmtmb+U1fYp/LOpgaDPbh1H7pd+NTGBIcGCuEcN3WVuea6HfsGZAHNN5L
 kRF94CgHpILEKrgFGYo1LQCpi6uE2vYqA5sfqE+JGjSqEWT5XgrHEsALc g==;
X-CSE-ConnectionGUID: POF3WdaZTs+mbEVxbFfPLA==
X-CSE-MsgGUID: uAkePpiCTie4llP3VgMUhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="92809787"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="92809787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 16:53:36 -0700
X-CSE-ConnectionGUID: nvDXUdJjTPSHj4mjIXZFnA==
X-CSE-MsgGUID: MuW7ApUeTRmUZ662WjtPGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="228983985"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 16:53:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 16:53:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 16:53:35 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 16:53:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y7U7w8JX6SBs2ALjV6cV2rsERKu1VC25jsOFabhKgtqlHDmoST2AKXEX0DOkJRuAiPdRXWcWQrohy0vJpYQgVnK/u5LAvOxYVBItvpvUNLoeKsOITe4wLmJtSYEPLR6Z7ZBnJUnmzTvq4NvstbJUSjZXICwvJbv611QK///ScPfphAoG49q+lQssaJbI/bUsRAVq8ton3Zj1EOEbAme9TdSCovEU5qeKHxLAPbgZXRUx2HZqw8nQu/vY/HI9WxrfZ+adoUzQQSD/D86XsBCffjrbgzPWOj8E5WbQjZhyasGSNBN90xDxeoiyX/jXeWSsFBwvoqFc3v/QZ9Q3vqaDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuQ65YepC/lcNxlWQeDmjEhgYRteDw+AjrRud+7roEo=;
 b=Bly4bfwffKU+t+CqNB+MMNuqa/YOT/UEY1nexWgDOXfh3A6bPEHp9yJzLVXwlJvPW19n2NbWqFlGV+YZSVXwblxWZpSt/S5kE+Hs4qIWUHkaLbi+2WtZNDAruNu0A40xeouutUt/HubJrVKNl3Y5IBQIt3E+5VmgouQ30qbDnnGbJVOuADohEYZjtwt10TyT1YAyBDWh6qxf1suELQpKDGoKfVX7H32norZSkTeuJO3s5nTYM81e5CtKqnfSYatImso68+u6KAIaZ0QXHiz6cIQT4GnvsI2ZiBTWsRXxe3g+498vfnXilHL45Np9XZBRYK4vrey1bFI/zVh33+wMjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 23:53:31 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 23:53:31 +0000
Date: Tue, 24 Mar 2026 16:53:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Always invalidate TLBs on userptr invalidation
Message-ID: <acMj9+JZ2ONGa1yH@lstrano-desk.jf.intel.com>
References: <20260323211743.285064-1-stuart.summers@intel.com>
 <acH1IT6MBYvSf2GH@lstrano-desk.jf.intel.com>
 <0e9794ab3a16896d0790289750f56538602798e6.camel@intel.com>
 <dbde50462394e808b4de52974f9c7c086191e35a.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbde50462394e808b4de52974f9c7c086191e35a.camel@intel.com>
X-ClientProxiedBy: MW4P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM6PR11MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f02243-7aab-48be-896b-08de8a008d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: VhmIqRrAVHG9/qzrq0nqkr45M1wEd5nShDjjj61HjQMqsHqlBUJwBeN1fw9m8w0gkeGX3dvOOTxmba9ix6CF6paEqPMNQ84jCbP/lUTxOuMoifagzlyvsmvMW9UgiireF4P/sL9s96Gxq2jQF9Zzq8qYd2dd3aNooHFulFG4U4KjLbtOiidsHBsWQALacXzAtb7enM6XQRJDBSARmvHozQxZ11W/lE7JNJhTxC36v+pOeR9sSxYdY4/31G2/UpfvvzHtblhH/w1hEdm2REhl2uVR6e5+7WgwKPZOT5sIEGuqIciCawfmYbpDTaKmVbcFvKwkRn7d1ywKvmBgiIfBcrrnx+/GAcCLBycfDUuEMOQPrCubB4Ih1AHw7e9B+mddv6AUWhDt+1PFjPqPspoT7YXGu9V/JH/GJHzc2l7Qev1w1mNwSvqTpEcLuQgu/G4x4lMtdjXbwyBVDceZXSN9LlTGaCvrsFiDsR7NIXB18BWrbIY/2ZjO40AZANwHXyTu2MB8M6MXrFQvy4pR0EHFLeXDvP3z6rcEC95QSuzFEIaLx7fbjyJcVVH11jbuSm46swRWitR2c393z6OiKoAxZH3162ceQnbYmufP7z0Y3Dftm2UIv3NzXPNPVCi6Nrq4K7EdZ6Sa5c4KkZIqaTVyYpKqFdg7lnfz2SPGt1c6sC7GMnPjZEYlzmjDNtXolXnsQhYVE/iAVO85fv49NW+4eBWdRF7L2P9qWJ3Z2iDHJmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUlZMUt2OXl0cS9NY00rK0ZRUlNjczVDaGZhM1RVVG5pN3hyVjgzMGp1TWFQ?=
 =?utf-8?B?K3VYZzZLVTN4T0JIREN5T1oySGFtQVcrUkRKTWhubFZHWGZGL1RYZ2g3S2RX?=
 =?utf-8?B?UnEvUnQ0NGJCd3pjZ1FjbWxXbUdaRWl3RUhGdmVaanpMYUp4eUFZRGFSbHdx?=
 =?utf-8?B?d3U0UWhwNXorSFEzUkttNk8yeElGd2hnVUQ0MXlHNTdsSnVEalpDNjExN0E0?=
 =?utf-8?B?c1pXQTZ5OTZKeDVBd2JFN2toVnBLbnN4SkZJV0pqVmI0c2t5MGdYSXljTkQr?=
 =?utf-8?B?M0VrY08xT2VGdkNEOXVETHJSVU0vQU8xMmF2NGRPRVlrc2ZVWkxuWmltUFVN?=
 =?utf-8?B?cDJ3ZVRzSnJ0NTZKNmhpWFN5R0dpT3YveDF3Yjl5TzlJREg2NFI5cjJlTThU?=
 =?utf-8?B?OXdRLzdNY1FOOWpXTTZDTE1OaTM5UllKRDRGUm8zUG5KMGJPSEY4YXNpOHhn?=
 =?utf-8?B?eks3c1hIdGFWQ0JyaFEwRVNudlFXUmVTMmkrdDRoN2p0aDgzZFNFdUVkQVFZ?=
 =?utf-8?B?aVlRL3djc1djZXdsNU1JUTUvOHJMV3k2Q1RrWHlXaVBtcHY3dk91TEhua2V6?=
 =?utf-8?B?TW1naktMMHlmQ1VSU3poQWxqeFdUdFp3anh3WnF2akMrVzNKTHpwazRzRGUz?=
 =?utf-8?B?WlNXeVJpQWRvVk1HelVTb3JIaE52OVMvQkZsUm9FT2NuVjZXTVNFNG1HR21O?=
 =?utf-8?B?S2NvbFBiRlBLTlRLTWpEN1MzTVZlSWhGL3lES0xQVktWSTRab3liTlZNcjlL?=
 =?utf-8?B?SWFCU1hwcmpHRVV0Ty9maHNuRUJZTm54Vk00T1dkdWxjV1QyS0ozeDNlTW5o?=
 =?utf-8?B?SHBReTRMdGZ0cXdlZ3JMTm1OL0l6YUtWNXlEMjVicjVZRlpCajZrcmxxdnhB?=
 =?utf-8?B?Vml0UjlSQ3U3MkFmamtLaG8zVm9yMVQyd0RrYVVSVFd1eFczQkpPVGsvVFVN?=
 =?utf-8?B?S0xFTnQ5N3o5a3EwRGxPaFJ2bWRFS3NIUFBVQXpOQ3ZpM3hNejgwUnJSdTVx?=
 =?utf-8?B?YjNhZ0MwakQ4VjFDeDNacy93Q1JuZVZ5RjVNV3ROanJZbFJRYVRpakFjZDRC?=
 =?utf-8?B?Y1FvOWpPbnM2VU9td1h5SVhSdnp6VlJFK3J6c2g0cklBOXd4MkoxUU1weDNF?=
 =?utf-8?B?cWw4SHZBSEtBYjJWRC9WTmNHaGVkczdpeFZyajVqd29BRGsxU3pGM2p2Mmls?=
 =?utf-8?B?Mm5idjdQUFdFSTJtWjhiQkJhU0p2a20xbUtRTkNIT0dVK0Ywbk9oUVQ0Z01V?=
 =?utf-8?B?MGg3SktSUDlGd1g5bTJFOGxxWkIrUGgzbTN5TzdncDZ3Z29iOUpMYzhwQkRm?=
 =?utf-8?B?eHczUHVDWUpxQ1dyZjRVUjBhYXB2eHU5NEFlQU1jaDBBQzRXSWFrTGJvMnFO?=
 =?utf-8?B?OEw2UDZwazF3RUo5WUE2UFB1cDVwQkVtRGttT0lPcE81a0dpUldBN3RqckRR?=
 =?utf-8?B?aTNvQlRCWnRNcFJ3dWpjS1ZpblVGbHA1VFRiWVlDVnhtNlNrcjdKQy9EOERo?=
 =?utf-8?B?c1lyMFQvdk9mUGlvYmhiSldtZGlzQnZlVnB3aXM0NGtVQlkrRzd6cnQ3dk5Q?=
 =?utf-8?B?Nm5oTGZQNGVWRk5teHRuN0trbUZMUXo1eVZWVFZPVlNIMjkra0IzY2NmZWxS?=
 =?utf-8?B?NHFSaHNhMXZSWWRmQlRHQUp0NzVPd21rNm1Xa0ZJODJqY3RsVXRFTHptRHFS?=
 =?utf-8?B?QWdTdjQ0dnBWd3BvRkhrUkRJQ2l3eHY0bHJhRlluVHNMRkMrUkdid05DUEFO?=
 =?utf-8?B?TUVScEdoZnZ2aHJMR0V3NXIzZitRV0JYUXJkT0Z0M09xN2RldFFDdmk3TlNK?=
 =?utf-8?B?d2lwZG1oRHB4YnhGYXN0OUpNSGFzT2tMWURSc3k5L3RCdGQrNjNLcUhwbzFa?=
 =?utf-8?B?YW9qNm9nNzRGQm50ekNzUFRsTU5SV1R2UHRjUkhqSHBkUmNOS3lmclBRbEJz?=
 =?utf-8?B?SGFZdkd6VXdpV1JtWFI4WlVtYUZQNUxnaysvSXl5VWFqV1Q3VlhCU2NOTFNF?=
 =?utf-8?B?dGErcUFrdFlzUzRDQ1ZVeFhvNmtXaUlVdjlYd1VFUGJBUmlSQjVBZWZtMXV2?=
 =?utf-8?B?UEVkS3M0N29KNmcrbkVFWDBCRVRGbEdOaGJxR0tEUENFTkJodlhuMENOUHVU?=
 =?utf-8?B?NCtqdEloUEczS2RJclVrVE55YiszWm92NWgva2d0R3RqSjJHYURNMEVQS1Vs?=
 =?utf-8?B?cjZXUytVZHRqdFp0TExkd2lyRXJKa2xzRi9rYnpYdVhYUXRIQms1TllickFM?=
 =?utf-8?B?Q0JiSU5tL1FNQVlDU002WllJSGJvVUlaMEttYytVTTV1OENiTTEwOVpQQkpp?=
 =?utf-8?B?SGZOL095TXl3ZEpORmM2K3VGTEtGTFVJcXNTQ0RLSy9tZkpKWlFHSG5lL2Mv?=
 =?utf-8?Q?8ucT3mr3jCwiIEA0=3D?=
X-Exchange-RoutingPolicyChecked: Vd3Z8+nm6IIVtSKbdyXJ+PhX+qje7vXSwXnboYUZ7qzj1e4VSpDTgtdiA5GYd/YrWl306yHL0+JFVBtb9oaTcKG5jMnA+8V4yRKo7qZTYhgLOZSu+9PZ23DWXo6CBCkxERLVcGmXXRIwbdFzmuM6ZVFmLRUlA/MwqSnPaFLi7jmf7fPiRmL9teU4RK7DIvb3ZohuZn/Ou4zyziMsliQDfh8WFw6jDBX4NdWXhuBUtZ3M1+6739dwO8rRBYn50S63Q2TjFUM01v+w7kWOqaqqj2S8ExUprgvKMPtSeJ4tha0BdhzfTb2kubkjtZWJ/i3JcYUgf/xo5BL6DLRVZlFY9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f02243-7aab-48be-896b-08de8a008d47
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 23:53:31.0361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWNwN2Q1PI08t8LKDpQChFEXQdzGNpTuxaQAYQtMOmpm2CyP2r5mXeqmMYbEjDnVNKHjwByhTTjBDVMAib57dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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

On Tue, Mar 24, 2026 at 03:51:18PM -0600, Summers, Stuart wrote:
> On Tue, 2026-03-24 at 14:53 +0000, Summers, Stuart wrote:
> > On Mon, 2026-03-23 at 19:21 -0700, Matthew Brost wrote:
> > > On Mon, Mar 23, 2026 at 09:17:42PM +0000, Stuart Summers wrote:
> > > > Right now we are only invalidating TLBs when we are
> > > > running in fault mode. For non-fault mode based userptr
> > > > VMs, we then rely on context switches after an MMAP has
> > > > happened to ensure the TLB is clean for the next submission.
> > > > 
> > > > With context based TLB invalidation, we can no longer rely
> > > > on the implicit invalidation happening during context switch,
> > > > so remove the fault mode limiter and simply always perform
> > > > that invalidation.
> > > > 
> > > > I was able to see this behavior using the following test:
> > > > xe_exec_compute_mode --r twice-userptr-invalidate
> > > > 
> > > 
> > > Hmm, this implies that preempt fences don't issue a TLB
> > > invalidation...
> > > I thought we landed on preempt fences do a TLB invalidation in
> > > offline
> > > discussions.
> > 
> > So initially I was mostly focused on the xe_vm invalidate cases. In
> > hindsight I should have done a little more focused testing here as
> > well. This came up after some more extensive testing internally.
> > 
> > At least in my latest round of testing, I don't see any issues in
> > BAT/FULL after this change. I do think getting this merged (or
> > something similar) and tested more broadly would be interesting.
> > 
> > > 
> > > We may have more work to do here wrt context based TLB
> > > invalidations.
> > > 
> > > I think BO move path likely also needs to be updated then too.
> > 
> > Hm.. I haven't seen any issues on the BO side, although it's possible
> > I've missed something in testing of course (like this LR case). I'd

You'd only hit those cases if you run an eviction test.

> > really like to get this tested more regularly in CI if possible and
> > work through issues post merge. I think most of the remaining issues,
> > if they come up, should be timing sensitive.
> > 
> > Also the fact that this isn't enabled in anything in xe_pci.c right
> > now
> > means we shouldn't cause any major breakage otherwise for the feature
> > generally. Of course this specific change impacts everyone using
> > preempt fence like you said. I could add a has_ctx_tlb_inval here - I
> > had thought about that. But to me this seems like a more general case
> > given the discussion we had about intent of explicit invalidations.

I would add knob for context switch == TLB invalidation.

> > 
> > Anyway let me know what you think here.
> 
> Little more detail here on further analysis...
> 
> So I had found this through debug, but looking a little closer, I think
> the reason we need this is because of the xe_vm_rebind() function with
> these lines at the top:
> 
> if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||                       
>      list_empty(&vm->rebind_list))                                    
>     return 0;
> 
> So basically if we aren't in preempt fence mode (lr_mode), we always
> invalidate the TLBs in ops_execute() called in the xe_vm_rebind()
> function later on. If we are in preempt fence mode, there is a corner
> case here it looks like where we call the preempt rebind worker that
> then calls xe_preempt_work_begin() -> xe_vm_validate_rebind() ->
> xe_vm_rebind(false) and hits the above case, causing us to skip the TLB
> invalidation. If we add the hook here, it forces invalidation for

Kinda, if you look at this comment in xe_pt.c:

                /*
                 * If rebind, we have to invalidate TLB on !LR vms to invalidate
                 * cached PTEs point to freed memory. On LR vms this is done
                 * automatically when the context is re-enabled by the rebind worker,
                 * or in fault mode it was invalidated on PTE zapping.
                 *
                 * If !rebind, and scratch enabled VMs, there is a chance the scratch
                 * PTE is already cached in the TLB so it needs to be invalidated.
                 * On !LR VMs this is done in the ring ops preceding a batch, but on
                 * LR, in particular on user-space batch buffer chaining, it needs to
                 * be done here.
                 */
                if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
                     xe_vm_in_lr_mode(vm)))
                        pt_update_ops->needs_invalidation = true;
                else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
                        /* We bump also if batch_invalidate_tlb is true */
                        vm->tlb_flush_seqno++;

We explicitly call out that we rely on “automatically when the the
context being re-enabled by the rebind worker”

So another option is to adjust this if statement to something like:

else if (pt_op->rebind && xe_vm_in_preempt_fence_mode(vm) && !context_switch_invalidation)
	pt_update_ops->needs_invalidation = true;

This would also cover the BO eviction case I mentioned above. Also avoid
blocking in the notifier or BO evcition code on the TLB invalidation
which in general speeds up the entire kernel.

Matt

> lr_mode also.
> 
> We could just add this xe_vm_in_lr_mode() check here, but I still think
> doing this across the board is safest so we aren't hitting some other
> corner case in the future if we decide to rework those other scenarios.
> 
> Thanks,
> Stuart
> 
> > 
> > Thanks,
> > Stuart
> > 
> > >  
> > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_userptr.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> > > > b/drivers/gpu/drm/xe/xe_userptr.c
> > > > index 6761005c0b90..dfd679dd98d9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > > @@ -102,7 +102,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm,
> > > > struct xe_userptr_vma *uvma, bool is_d
> > > >                                     false, MAX_SCHEDULE_TIMEOUT);
> > > >         XE_WARN_ON(err <= 0);
> > > >  
> > > > -       if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > > > +       if (userptr->initial_bind) {
> > > 
> > > Should be change this if statement based on hardware support?
> > > 
> > > Matt
> > > 
> > > >                 if (!userptr->finish_inuse) {
> > > >                         /*
> > > >                          * Defer the TLB wait to an extra pass so
> > > > the caller
> > > > -- 
> > > > 2.43.0
> > > > 
> > 
> 
