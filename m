Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF66C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 21:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CCD10EA09;
	Fri,  9 Aug 2024 21:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4lZ+cpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95E710EA0B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 21:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723239742; x=1754775742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6TfgxuIGGnfxWDLIHbggT4c/GwMpFcQ54hfBive7v/E=;
 b=J4lZ+cpjO9zhmy949Bu7U0d/bkbBhoFWMOiTHH0ip3eAAvTQfRf0cOUl
 edHl5QNW8s3c4Z2kP9VECErfmoZnreQvUhAQTaPdVTJ6vIAi8Qc1cpeH6
 tZmdQFvLtm/n75AS6oWkFeP7/DXRSKyPL58fzuGLKqLaVbhE2kuaob0WV
 sHu/ruuywMS51GBUVIymm2RtvmjWeOchpbr6+2hXjmCRDOyDcPaptIYoW
 2Z4KW0HqXK4kpbg3+JqzpuUHtJ7RKvvZW7M1RtGNhlsy+py1znUZRf5G3
 QjISllypEtEtWJ8p1hpDUXmuTgD9h4e9SPYsMTzU+4crXxOhLQqxQsu3/ g==;
X-CSE-ConnectionGUID: 5jCKRw4CRaWfpkXJNJcqKw==
X-CSE-MsgGUID: eX9RH4OQQcCQv0/vfcylPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="12943549"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="12943549"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 14:42:21 -0700
X-CSE-ConnectionGUID: qpxKOLPZSdqUl5ALx9ihOA==
X-CSE-MsgGUID: 5y2gR7xWRoyebDTKQkylZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="57767255"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 14:42:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 14:42:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 14:42:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 14:42:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 14:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBRudsMy90LF0caYmHqpb0fsjZFt2y5mpJXhKxJ/c7CkuetlhOOLui43fP9+K4Wr/Kk843ugKSJVRRYCgOma/HwJ7vKzQpI+ZDxOQz7NIQyzmRrz13qNst6N7GoExP2OCJ9xaONtvOzDco9cPiR/mkmS/UXK6Im51e2wjzjwKURi1HF0l7MJ97pVJVT9rjQtesen9Bc/kiEWcxiZvDK0oJhk4lkwaqTmEWvZvf635yxGr/CHir9kOT/fDh0lnT79aTbLmRDwo1CCXhzni2zo/5aBtSwfd0CgRe6ru6BOjjJpzdPrL33Klpvmmdrkni4ZJl1u7g3JLBLDwRIuaKdlWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBKb2Jwukmp+OlNOUW+Cc0TcPM9/Mvr34/rDBxe8Vi4=;
 b=LMB5AcerZMXzoEqXDeNotS/0hHjBaklLUyRo3tmvNTdBJjHcX3Yhs1hL/y2+8FfetoeaVJazTcvR1hu3rV1kw5Gfv0aIwhzNk8mWrDXdGXqnDRxmY6r46CAO/XkzRRxF7Vun+ModH2FfP/iqPtu5lUQ+Kt9ZtqkLv7r+V3z5aDrqYXNSIoUbpxzzPORJijvE3hgTTB56iS/51/fmxq/XGf3ajgfY3w2Xh6DEU5fdyaUV/fGH/NLmx+1SE1368aMrHOZG2DDDDiO8/TQJobOgQ3g6XQCZ3Z7jZL2PEyHXG8Z1OHcdUc8MkLN9VTP4+R7va7sqNFqu79nNSC+t6ckO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Fri, 9 Aug
 2024 21:42:15 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 21:42:15 +0000
Date: Fri, 9 Aug 2024 17:42:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/12] drm/xe: Rename xe_ggtt balloon functions to make
 the node clear
Message-ID: <ZraNM1LAtWZMYQPs@intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-10-rodrigo.vivi@intel.com>
 <72b8f83b-72e7-4b78-93fa-aa56f17c4177@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <72b8f83b-72e7-4b78-93fa-aa56f17c4177@intel.com>
X-ClientProxiedBy: MW4P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: d29d58df-5737-4e1f-f6c6-08dcb8bc224d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1/8JV9F7OUrp4pk4tmmciGz3IvQNlxraJ797ujtSp6sfs5zY1UMvd3YsOZBU?=
 =?us-ascii?Q?17bFkXzfLQr0VMdpITU/J22x/eNjWY51Dp8H9/93i7cqqoPiKnG0621r1dH5?=
 =?us-ascii?Q?bFwk0rSBd8yYsc5wvyQVG6VnFY/IXRMidLucQd8BXJtDxMhl25/8MDdY0TMj?=
 =?us-ascii?Q?n2QsXnXs+A2UGCitnpU4jxZCQS534WMfOmJ+4v8AOma8kEJRW9t7bEds+a6T?=
 =?us-ascii?Q?guqDkQYhp2WuimZYHvfG3IVjXzOl0vzsDmQEazH8F/KBu5ZNsrFWNl+ahRwx?=
 =?us-ascii?Q?ia1Q+nKBGs/g2KNr8k41GU/55Tc9nQTVwQAtc7jSIdlLUh9O8KmYPW6CqUN3?=
 =?us-ascii?Q?sDIJ2Xa4bRqUmuN7y+ol9Zgklwtvgl3tu35owNelo75lhidYs/JuWHiBjk7t?=
 =?us-ascii?Q?D/4ibDfdok9es8HB3VdQiLg95bL3MK72jgwNiJ4ewArBUjebSn3TCykdn0G8?=
 =?us-ascii?Q?RFcobTCDgUbUNW4/PNMlbRG5vjp1arVokljdfhQNn3ADI8jeziUuMo1YzFFe?=
 =?us-ascii?Q?sbveMV8LrK33L5WwaGWAJNVwUgTjAyK6g4nHfCncmH7olh0us1ZDzGV9txga?=
 =?us-ascii?Q?r5VfxMGxwR2h2NfOI9a5a7XK8oCtJO5ZTxeLv9cQn9D8zsCs3x2nsFYv4bO8?=
 =?us-ascii?Q?PxAfwo4KCfSLGecfvxR0HTnKxeaxxPqEtlTxEUhejRwZtADgj5g8qvbWF5Cl?=
 =?us-ascii?Q?RlzI8dc3T0p4hhX+t7apalG8gO4HNAWnLD/EoeSOe4DrZxzr8jdS76vvqZLI?=
 =?us-ascii?Q?3fROAv6Wh9WHVpe/PRrgwfgPl1fRl5dB42mPLV71LFPYVu4u4yzJgsbZfAop?=
 =?us-ascii?Q?AxI82zMwPU4AYegbpdsGPB6FSRV/Wlzhj95mUPnwIg7iq5v8ZY4mtzh/jKoW?=
 =?us-ascii?Q?l78+AhwPP6JLXyFmjglLeDqQJxRTC3a0w0TvtVy81TL/8ABqpWepQgT/Zdzt?=
 =?us-ascii?Q?9cDUf/Vg3zEpP+WRdHCGhhkUZ2okOwCBcrJWHsVnZVvZdm5kaAJrDGERQP31?=
 =?us-ascii?Q?E9F4TkzpUvKTxOg6tLZmiFSyOYLCyL6FttmkV+0tPzDDmuU+hxscua8yJgLd?=
 =?us-ascii?Q?Bwu/DDilJVBtc0voABOUFtjWLQ16d/+w70G8viDotjNI6UvRLxQBLYEyu1ve?=
 =?us-ascii?Q?sqUBSZ4UK8e19mBC+81LIFq4crDCDh04fQn5ezNbSwVAfaMH0oHtoPhE+Tur?=
 =?us-ascii?Q?x3i65pMsEk4UkDVpiQNA5LxBnagE5aS7Yc/so/Ske6CupJTQ1d4iNZeh0YXH?=
 =?us-ascii?Q?Uq38CFwsvrnCNdfONjKfjaPYhGh3NzM/4cxQ7t3fvLQ2Nc5RwS26l89PMiQu?=
 =?us-ascii?Q?JpU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VkBSD7ZFXq5u8BkJedUsgcW7K63O5XoglKXx8bk0ODDyVZl5GjwU3WScxRsu?=
 =?us-ascii?Q?4pve0SoAa2h/RPO+05JaLkzgCgJgd8WQxf5qpzfNoXPM/kLtoW4tYJWTto7F?=
 =?us-ascii?Q?iWpGv5Xh76rmUmuXoZ2+B9Tr6P9jnyRo4fDABpEuRobfnMRYUAbm/ABIjfvc?=
 =?us-ascii?Q?zSbJBQlu2r/Ib281eyiOlVMId9THyKDh4SF3j52urc6ikwiyv09TIFl3uN+Q?=
 =?us-ascii?Q?HrwYNAptghKPjoDMtycM/2eoBoEFNrFNT9Wy9NPmUFQBME4YCTPk2GHtygUM?=
 =?us-ascii?Q?lxrArc/xi0+RxN2O+lCId6ENCi5XxHijRfx9KMxRcf9aiIkO2zd8JoHA9JuC?=
 =?us-ascii?Q?UD0KhQvJVLyd+UawBA9KBoVRCF5zVQTBrV3N7IA1pZIHERmK8c2IysHq7MJL?=
 =?us-ascii?Q?bXcQ5m+vmE8noCnHkOx/5Y+yjOwU+cNH3MZl24GWwkoLnJ1/73/ComF0fX+A?=
 =?us-ascii?Q?7saoQR4a+OaW2mC/dK8PBtd3W6S9sj+7lyWhVFTdMMrGyUABoCdv4HE56lX1?=
 =?us-ascii?Q?lW2okI/vX/HaoGS0YNYfPEvcchsnYnsYry8r3hK5d2sJ8LEggJ1+jZj3sXbV?=
 =?us-ascii?Q?4TRx1pdIpLA0nU2ZP3XFrUhwK1olBInfljgi6xQ0vC6i+0XUaWNPl0nJiBN4?=
 =?us-ascii?Q?28c/E6qCk0FNSuHmRSMqEy+db2uoFeLe8Rd/rtuBciOeibC4EVE+TlnD8JYv?=
 =?us-ascii?Q?FCPAD7gAWRjYBCiHERAbJHE1k5dumRQhE7C0GvYhaYXGwu1zZlzz6hNqtdyi?=
 =?us-ascii?Q?4NZ23Y7lwgzJhA9lO9JwpJv7ak8wIwJbh96gOfaVSZB4O7F5ghkDPwV30DlX?=
 =?us-ascii?Q?cw92j3pTa/ez/sk0HDzBnJZ4sDaqhY36q5Y40ons+AXnRs0aDvZKZQMg0SZQ?=
 =?us-ascii?Q?XF188Zt5DOhiNas0DPvLlqkFqMzsFUTBzKrZXLn3b6enW5duxTN7GkLu9tnw?=
 =?us-ascii?Q?lfQD1pf0f2lT0JK4uU2wdR/GhHmaORs+qzswHs0byAUagE8aIYD1Za+DHreI?=
 =?us-ascii?Q?qR2AQmy0jblUuHh8+gXjqz1/dN4LucyuF0a/ZoCvVorqRWlxpwc3yRtxmvEc?=
 =?us-ascii?Q?y/ZKkNntus2qFX0UT8KNo7NKJzvNO5bfWkbyPE5COeCwkdVs9NqJ0Xb2NZaY?=
 =?us-ascii?Q?0iMb+8y7jYFYMvyR80QR5bUXl/B/wHRYN+T54Z6M1LcXdeq8wZT+NdGDujte?=
 =?us-ascii?Q?zq8RAbvQCETZAJJq3j5KkndvV9t59g9NJlYH0yWqRF/APOUSkxFzt24UZYOR?=
 =?us-ascii?Q?s+4k1MLnMqY0ggVGY2gZW/1XVF6xQ6IPCd0t47q5BqrUFtXyEB1gDVOqDcRl?=
 =?us-ascii?Q?8Wk/D7j/dFaDrD4CssAAJ16w/Dy4gvSaLLVR+G855h5g3WUArpQK2aryJmzf?=
 =?us-ascii?Q?tEFYog5mIyAVyuXE0+BJrHEztDfLDWGWLNNf0AYp69lkCaWBaAQ4mquaS6yp?=
 =?us-ascii?Q?aoc7zM+9F8fB439rLVmFhj7Xyc1SJFiTQAnrX4pfONLA3N8VQIGGLc6WkUyw?=
 =?us-ascii?Q?FopZk5rcETSVb3HpeT2TG0dJeJ1rfLBTflhEAQbrGzja2FIvXzOR/YuU9y+r?=
 =?us-ascii?Q?ay/M8dpmtO7h+zIXgrgvz0iqel4kUp1MtwLITvUT1Uy2QXROcFCECpF4vBgj?=
 =?us-ascii?Q?iQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d29d58df-5737-4e1f-f6c6-08dcb8bc224d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 21:42:15.0396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g60nE3Z5a5V2w8jwJwPpb3RHXT0TTrnXdubMhKZwXCPJHPI/PewjIc9rxsF5Gt7HW3aXcmvVmIIj8V+FuM5ILg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
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

On Thu, Jul 11, 2024 at 10:17:24PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 11.07.2024 19:11, Rodrigo Vivi wrote:
> > These operations are related to node. Convert them to the
> > new appropriate name space xe_ggtt_node.
> 
> hmm, actually these operations were meant to be GGTT related [1], but it
> was suggested that it would be better to keep required nodes on the
> client side
> 
> [1] https://patchwork.freedesktop.org/patch/341977/?series=69844&rev=1
> 
> but maybe we can return to this idea and on the Xe driver lets hide
> balloon nodes inside the xe_ggtt ?
> 
> and later on we may want to add xe_ggtt_reballoon() to shift the range

either way works for me...  could we leave this to a follow-up rework
and for now just fix the name space?

> 
> > 
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ggtt.c        | 12 ++++++------
> >  drivers/gpu/drm/xe/xe_ggtt.h        |  4 ++--
> >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 +++++-----
> >  3 files changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 5b51753fe1ba..928c01f9e212 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -347,17 +347,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
> >  }
> >  
> >  /**
> > - * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
> > + * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses
> >   * @ggtt: the &xe_ggtt where we want to make reservation
> >   * @start: the starting GGTT address of the reserved region
> >   * @end: then end GGTT address of the reserved region
> >   * @node: the &xe_ggtt_node to hold reserved GGTT node
> >   *
> > - * Use xe_ggtt_deballoon() to release a reserved GGTT node.
> > + * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
> > +int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
> >  {
> >  	int err;
> >  
> > @@ -384,13 +384,13 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
> >  }
> >  
> >  /**
> > - * xe_ggtt_deballoon - release a reserved GGTT region
> > + * xe_ggtt_node_deballoon - release a reserved GGTT region
> >   * @ggtt: the &xe_ggtt where reserved node belongs
> >   * @node: the &xe_ggtt_node with reserved GGTT region
> >   *
> > - * See xe_ggtt_balloon() for details.
> > + * See xe_ggtt_node_balloon() for details.
> >   */
> > -void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
> > +void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
> >  {
> >  	if (!drm_mm_node_allocated(&node->base))
> >  		return;
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> > index 67ae5f1602a3..e68cede2e6b5 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.h
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> > @@ -13,8 +13,8 @@ struct drm_printer;
> >  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
> >  int xe_ggtt_init(struct xe_ggtt *ggtt);
> >  
> > -int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
> > -void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
> > +int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
> > +void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
> >  
> >  int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
> >  			u32 size, u32 align);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > index 41e46a00c01e..a478e6e1b20e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> > @@ -528,7 +528,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
> >  	start = xe_wopcm_size(xe);
> >  	end = config->ggtt_base;
> >  	if (end != start) {
> > -		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
> > +		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
> >  		if (err)
> >  			goto failed;
> >  	}
> > @@ -536,7 +536,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
> >  	start = config->ggtt_base + config->ggtt_size;
> >  	end = GUC_GGTT_TOP;
> >  	if (end != start) {
> > -		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
> > +		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
> >  		if (err)
> >  			goto deballoon;
> >  	}
> > @@ -544,7 +544,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
> >  	return 0;
> >  
> >  deballoon:
> > -	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> > +	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> >  failed:
> >  	return err;
> >  }
> > @@ -555,8 +555,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
> >  	struct xe_ggtt *ggtt = tile->mem.ggtt;
> >  
> >  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> > -	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
> > -	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> > +	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
> > +	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> >  }
> >  
> >  /**
