Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE28CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 15:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D7E10EC07;
	Fri, 29 Aug 2025 15:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dfifve9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C231F10EC05
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756482028; x=1788018028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JdpRdE3FSF9Dx+u2CMaDUcQn8r4oNQYf7PmDt14aj1o=;
 b=Dfifve9jbwK0dGPYASkWLKeWVwwJvPxt5L34aC4dKDOykbAGSO1wM4Sf
 wYPExY1YJUP/RS4disdxgSiHPYU0vSBk7FhjvUyWRtHo/YCePkn9AEk9M
 Pm7aNNJeeCXBL23S3A0kq3qKs3ziqmjsSuW9f3xuWhs9id/V+i9curIzu
 oBNQzjzqcw+9aRLN3XkqpAlVCAJfY98W21TOYHFqsnJLlrcht/Io7rLZJ
 9GwjJpeT43RaN9yGYegbvTpEla7UR12RdMfPToCsmLd+SDmc1/PRR3xJ7
 vCzKQK6I6K2cvwdT0fQuU1XRyxlbtNUaW84w3zFCMOdB5RE/64b2h4qYl g==;
X-CSE-ConnectionGUID: fqFXKK+JSXu5DoneFSmtiw==
X-CSE-MsgGUID: kPIA1rbVRwKCUW89dv9xVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69874078"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69874078"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:40:28 -0700
X-CSE-ConnectionGUID: hy8dpz7FSU20nWdmC0v7Ag==
X-CSE-MsgGUID: tP01xm3bT9u2mTbtr5MfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169663828"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 08:40:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 08:40:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 08:40:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 08:40:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6FRfiGtfYqk8eoOiQyShI3euJCxt0FIp94ndx3Ze/y0T6V2e7FixUrvE0fqLWRP+YKQ9JOjReduWbN0vtoiNod4SU1dzahta0/Yh3LOh9ZVMmzM37OiC4e0YBFzrxwqTzmLtKrSJoGzYbDdaCHtDLNo0Waott4+tymUpWwlr3SWi9lXe2OVFQkcmRKkbcPyXS/hRGqI+qyGenMGSAKh7/Oyt+nEOshv2Z4iF8liBbhlHekvAV3D7tjrneJyzNIaa7jYK7NRZsJRSDXqwYXGRqzIgA4jDTYDlSWCo2v7sLHy18gi97BVrIVP2Zeth9SIBSy2SueY/yAa+QwXDzLTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNxX8SegmZ3fZe9G1wItqV080dS2vC4OURCv0PmPp4U=;
 b=B8cN/BSFpEdPLlSj0xVHvvd0tPJmgguN1cWmJxAsPQBVGawgYoCcjA9UxcmX0hUYmIDV6LV+mjzWuJ9EjqFfDph8QyMxVEj/fMMg0zhJEdM0Yt+J1TX0H9Qm6KYME1zQZ/HRuB1xEFMBitZTmJLriMTpCVzT8WZFxIAGYilETdnScYLPjWAFWysUEZYiFuU3DdC1I/fd2PGZadbdjv4Rli9NHIuKrOyzaTrM3OfBOFyq2FbaqdFTO7fTOA+neJJQSGmMf31dBfJr+3ke9mDCApHPndNYg+h/LiVydm5cYqGFHGQfMbRShB8gxuw8A80q1ViqOQnFhaAzyog3NVNM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Fri, 29 Aug 2025 15:40:22 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%4]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 15:40:22 +0000
Date: Fri, 29 Aug 2025 10:40:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Message-ID: <pqq4nyw3wdsbsv6bnv4p3nkes5b4v7n7gdtzu7dssnhbpdfcg6@77mdoape5y5x>
References: <b131c6dec20a07acab020063df7ff22b7050c14c.1756318068.git.harish.chegondi@intel.com>
 <1b910cab369af1e386b7f8da186a756f6ffe2361.1756318068.git.harish.chegondi@intel.com>
 <l3o4birrnbgohxtopdx3iv7jbp3d7pe4ifurhapygbixehyvhm@eyh75lwhsn7j>
 <aLDSaOtVeRDUgk1P@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aLDSaOtVeRDUgk1P@intel.com>
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|SA2PR11MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: 4116454f-506c-40e1-b015-08dde7125d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T2mSJxEdOshpJxEW2A+2aOJ9NvI/gPKbwrgBpvFn0bGEdWS2fLt/3jDWcJFM?=
 =?us-ascii?Q?Mfre0KqYpxDR1m1FJ6DNNu0qOae31ezGZydcqOW7Lth2U/xXNT+a4wsodoWi?=
 =?us-ascii?Q?JtyATgzi14QIZCs+pR9mFY9ODkE8Jq1deQiQgzNMbGZDs+0crtIA9d8SPYFw?=
 =?us-ascii?Q?dXeResk7cTMxKnF/hfVvl0fsNjJLU1+4PHQAgph4iLsGWYTFyi+wVRXbfE5N?=
 =?us-ascii?Q?deFnw2jta08NearXBPl8dooQ0fMI0OmItg6aK8o1qaJkiXZd6E/sfAdbx1XQ?=
 =?us-ascii?Q?ko1SSSRUVl4yG9XeFakEkty8F7SDTgAheLeva9ncQOkwZZHbCLlRM07IU3SD?=
 =?us-ascii?Q?IIuIjBfWpNLZ9CwaNE644nrSxislERjYvibzOv35ACWvEzeygHA6HWuNM6ES?=
 =?us-ascii?Q?qwWjxPO7Uh6PbqWDrLNORot2LacJT0dMLwF1g2YuCtIY8y7RoZMPlLRV5AQ4?=
 =?us-ascii?Q?en5SMrRAGBUQlmCv4XYU1R/n8zljmFquo9aZCIbA/ma1RCwJN0mAZBF+DfYT?=
 =?us-ascii?Q?r4QpCfysIlA69BBQ0jFAMqUi9PqHP4kjFa0NWUKHSqiCZTL1ByM7bu3Rea9z?=
 =?us-ascii?Q?3XOroo90oEuwhcnu8kHkVPFR9pz4zmagj9Hb+k3CwZJMXgCHM6SzlOCbwGE7?=
 =?us-ascii?Q?KdMcg71l3ZuNyV0/aIXTJtU0Nn5Gn0ezMgVSDPoaY2fcOPWWkHgemigH+MB+?=
 =?us-ascii?Q?vPpLhCsEd8DAXEErAm0NCdErvjVuGiN44zK0NzXKxUwpP18A8iYUVTa4DNM6?=
 =?us-ascii?Q?5qMbzvyiIszuzi59RXsj/PpvecVv33DwGYOKNeP5CHvorlIYaTskn+eqcL5b?=
 =?us-ascii?Q?QHOitMcJyxbafbnigm6taN2mIXbkVNhj1rbmBhaJfpPsbr0L1WgEgECrrCEr?=
 =?us-ascii?Q?WKpU63MaNyKkqWVNrmT42Dl570KSDEhkd6MgUqE2pG72MTAE8lpZPk6j1R28?=
 =?us-ascii?Q?teF1i0trdFSPsKA0FiKHAv+VdOYI/j+3z8t8HFwJq0tL8txReJ0oSrAdkagj?=
 =?us-ascii?Q?Avc4gUjcmse+MWdPVaWJSenFmTsBu6mQYEV8Qe9hhVPkgHDbWEbwAv/R4/QV?=
 =?us-ascii?Q?H0rZzINDDELF4ZZJVq8+kraV7PfF2GfKca230v3ObwdI41NOLJR5pI4RcOYR?=
 =?us-ascii?Q?cKSfq9LGCT5r/vUwV+LeAYRZgrT6//q6+0bJn7oE9yaxq44ylF723syzXPy1?=
 =?us-ascii?Q?vkitIU0ZkRiOYglGl/EwiUWNmHJmVddqYKbG79X+m8ViJiBdTzv2XoiezGQw?=
 =?us-ascii?Q?OKR5KWC4vUNA2pjz6N95RH8bKEfj4XD0zt3Jj03aIuVnd+tx3P0e9m622qEn?=
 =?us-ascii?Q?3dal1B2Wv3Nekir+GZl4ItnTgSYeUvI94Vmd/fQEuyYSDnk/KdIVDIohYS9Y?=
 =?us-ascii?Q?pWv6m7Ih9IB6i9Ra/EDmBQGVnzew39JOrxWXN+xUsEBFEmoVVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ruE48UzrOhXwq/4ZGyTkQdHij9VnO7TcGWSAfxTz10c2R48LVh2U8+eBD2JR?=
 =?us-ascii?Q?2v+tSBYKfxA8Jy5sUEX+MhNPCHwzObuXXGtHTsTvLwCumC9/9Q/ebBu/iJYi?=
 =?us-ascii?Q?fSx8bTGLzvJNHwgWka2PMfD9EyFSopipQe/KUxqNCN6z/n4wmAUvTVGFW48a?=
 =?us-ascii?Q?zrgJs503UNR8PbKLNHtu338C8X4iWCjR3O615uS7eBM3oZO+flazmA9Lp7o0?=
 =?us-ascii?Q?1fGSmVkHTy1PMgCuYhFER/VPiQxzqExXfl7ltb+aAoVuaZugB8jBD/Zaq3qo?=
 =?us-ascii?Q?2s5e1xcKhTNYvGv5muDl7qjWm4SxU5QlTe2VK8dWFs9T3PWJCyL4rP+cuIDT?=
 =?us-ascii?Q?Sal1/mXvoDBApirLT9M0jLgG3VzxCXkrNxZlWAgGL63VJKS/Uo0GHuyhujfo?=
 =?us-ascii?Q?AGVidSsyczs4nTHYta1Q+pl+hBWCJ2/Yu8Qq5u1LmAP/g/p7gv8n3JIcL13y?=
 =?us-ascii?Q?ZCy/2iygcHio2CJKVKs7j6iXzqFxs1W6TLJ2G23+iggzcnTqQVWDzoj0h6U6?=
 =?us-ascii?Q?aJnfoJ9iWzDlYN2hxo/HYKGtovoD70WDx+wr9bVDYWCizdgHFOnd6jI8R2yL?=
 =?us-ascii?Q?RTNxlJjZby9lNOod9P8f2oAXqNYWAFKCfB45TPbBJL1xlKN7C9iLQSBlZUjZ?=
 =?us-ascii?Q?XMV3dwelY/dcJYy2hJJgn6tpIHr9qAmm5p7tdihEozhNl+yBpr2/YRIcy6pT?=
 =?us-ascii?Q?SR+a+jDYUqKi4MZxLsjq0cUa766yFDG4FXkuKmzOQRcWj864rUDkgvaZeV17?=
 =?us-ascii?Q?GYtJSpVMQs5t1uYtILv1KrM/qqup0rLrqA0EXB1vVL5f8yRLKd8qyG4EEmKQ?=
 =?us-ascii?Q?TMfbk5e0THhIKJ2EMs7Xyp/JJ+NZZPbhsEAaNqaku0IoZf0HmBbrrWREfqrA?=
 =?us-ascii?Q?rJhvrGBzjO1DuPBMm8X698CZumaVQbJz2hOm4KG40/igjTap29sXXgv/kk18?=
 =?us-ascii?Q?4b6U7WsK6fpObCS8fR/VWioO18vMcxZsS8D8eseI5NNFY5QsSBwvoP3kvR+V?=
 =?us-ascii?Q?aFxoT0PoNZhjVAWXls0GEYme6FpmYRLVmr5CKb4h5Te0lQTTZdu8yf3BM0QU?=
 =?us-ascii?Q?RqhgPOq0AZoNhXG4I8g+XlIUhQDyVszuQDqnReSW53KTkX8Iw24BhTAfY36c?=
 =?us-ascii?Q?tVPn4mHeTPPa0FpDKCQmZepB3fRpBhckjag8UTvDRWkjgre4GfpdibEPV8n/?=
 =?us-ascii?Q?sdk8DZtJt5nE8rAXwzCFg90fEUQsPQr/6u3ZJbz+c/2ErAwcjcR7xPMelTCo?=
 =?us-ascii?Q?A1IrC8MFqBwncycSbrPHdIVBR5U2lPYi4b9aMz8RLwNccObLkjctoADANTVi?=
 =?us-ascii?Q?h4jQgWbwQkqp/2vaihk3pKJKrURw2asG9+Q0s6yT4HK025tCEAiyFs67Y4Oa?=
 =?us-ascii?Q?eTU4REP5GdAcMYRFpoPkOeIHM8UI0YVEoL94mvH9p8KzpblMFCVXhEX44a2j?=
 =?us-ascii?Q?FExL5SF9TQuZ/t9emHvU64HUF+aVaAcRTYYqwcNc0PJq0PiI7LTZFgBwi1Pz?=
 =?us-ascii?Q?0w7E8tpjiST8Yz5HL9i3aqLDf9uElbwtxXb6TYm0pPAdL5NQeoyjEDhyJqBt?=
 =?us-ascii?Q?ViKYRCulmA76ed3VFmv3BjqhRbMjljGeQdpze5LzRke8QiXmXTIIUPPHihNM?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4116454f-506c-40e1-b015-08dde7125d77
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 15:40:22.2606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdvYgq9W8QS9bb1KwVwzCubc62kRZtx1TOTWxNqbJNs8MwyH2wdJ1c6ivTOnUBGojje0c4UDHg+wPDbIzhrKb3LumPqnRrgSgjwjZSNPFIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
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

On Thu, Aug 28, 2025 at 03:04:24PM -0700, Harish Chegondi wrote:
>On Wed, Aug 27, 2025 at 03:11:35PM -0500, Lucas De Marchi wrote:
>> On Wed, Aug 27, 2025 at 11:09:35AM -0700, Harish Chegondi wrote:
>> > Add Wa_18041344222 for Xe2_HPG that requires disabling
>> > the perf mode for subslice count for eustall sampling
>> > when the enabled slices are discontiguous.
>> >
>> > v4: Rebase
>>
>> this changelog is not very useful, is it?
>I wanted to let the reviewer know that v4 is just a rebase and no
>other changes made. Should I remove the changelog or add more details ?

well... if you didn't have to change, there's no reason to add any info,
is there? You may be re-sending to solve trivial conflicts on the rebase
or because some other patches in the series change. We don't have to
look back at commits 5 years from now and see things like:

v2: Rebase
v3: Rebase
...
v42: Rebase

It's just noise.

I'm even of the opinion that this should be below the '---' so it
doesn't end up in the final commit. But that would be a heated topic for
another discussion.

Lucas De Marchi

>>
>> > v3: Skip the workaround for SRIOV VF
>> > v2: Add Bspec references (Matt A)
>> >    Rebase
>> >
>> > Bspec: 79483, 56024
>> > Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>> > drivers/gpu/drm/xe/xe_gt_topology.c  | 17 +++++++++++++++++
>> > drivers/gpu/drm/xe/xe_gt_topology.h  |  1 +
>> > drivers/gpu/drm/xe/xe_rtp.c          |  6 ++++++
>> > drivers/gpu/drm/xe/xe_rtp.h          |  2 ++
>> > drivers/gpu/drm/xe/xe_wa.c           |  7 +++++++
>> > 6 files changed, 34 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > index f96b2e2b3064..06cb6b02ec64 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> > @@ -522,6 +522,7 @@
>> >
>> > #define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
>> > #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
>> > +#define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
>> >
>> > #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>> > #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> > index a0baa560dd71..0ed7dc9044a5 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> > @@ -12,6 +12,7 @@
>> > #include "regs/xe_gt_regs.h"
>> > #include "xe_assert.h"
>> > #include "xe_gt.h"
>> > +#include "xe_gt_mcr.h"
>> > #include "xe_gt_printk.h"
>> > #include "xe_mmio.h"
>> > #include "xe_wa.h"
>> > @@ -328,3 +329,19 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
>> > {
>> > 	return test_bit(dss, gt->fuse_topo.c_dss_mask);
>> > }
>> > +
>> > +bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt)
>> > +{
>> > +	unsigned int xecore;
>> > +	int last_group = -1;
>> > +	u16 group, instance;
>> > +
>> > +	for_each_dss_steering(xecore, gt, group, instance) {
>> > +		if (last_group != group) {
>> > +			if (group - last_group > 1)
>> > +				return true;
>> > +			last_group = group;
>> > +		}
>> > +	}
>> > +	return false;
>> > +}
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
>> > index c8140704ad4c..fd08b382e259 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_topology.h
>> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>> > @@ -47,4 +47,5 @@ xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>> > bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
>> > bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
>> >
>> > +bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
>>
>> mind the newline
>Will remove
>>
>> > #endif /* _XE_GT_TOPOLOGY_H_ */
>> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> > index 47ea1521dc80..b5f430d59f80 100644
>> > --- a/drivers/gpu/drm/xe/xe_rtp.c
>> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> > @@ -370,3 +370,9 @@ bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
>> > {
>> > 	return xe_configfs_get_psmi_enabled(to_pci_dev(gt_to_xe(gt)->drm.dev));
>> > }
>> > +
>> > +bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>> > +						  const struct xe_hw_engine *hwe)
>> > +{
>> > +	return xe_gt_has_discontiguous_dss_groups(gt);
>> > +}
>> > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> > index 7951fefdbe04..d0adb29db7dd 100644
>> > --- a/drivers/gpu/drm/xe/xe_rtp.h
>> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> > @@ -480,4 +480,6 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
>> > bool xe_rtp_match_psmi_enabled(const struct xe_gt *gt,
>> > 			       const struct xe_hw_engine *hwe);
>> >
>> > +bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>> > +						  const struct xe_hw_engine *hwe);
>>
>> ditto
>Will remove.
>
>
>Thanks
>Harish.
>
>>
>> > #endif
>> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> > index 52c7df4c3afd..1d4efaca110e 100644
>> > --- a/drivers/gpu/drm/xe/xe_wa.c
>> > +++ b/drivers/gpu/drm/xe/xe_wa.c
>> > @@ -612,6 +612,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>> > 		       FUNC(xe_rtp_match_first_render_or_compute)),
>> > 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>> > 	},
>> > +	{ XE_RTP_NAME("18041344222"),
>> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>> > +		       FUNC(xe_rtp_match_first_render_or_compute),
>> > +		       FUNC(xe_rtp_match_not_sriov_vf),
>> > +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
>> > +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
>> > +	},
>> >
>> > 	/* Xe2_LPM */
>> >
>> > --
>> > 2.48.1
>> >
