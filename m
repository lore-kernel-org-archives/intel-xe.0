Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6483FD116F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 15:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F28B89EF7;
	Tue,  2 Dec 2025 15:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i11r3FbS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA2289EF7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 15:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764688643; x=1796224643;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rQVCNNy1Vb1dDSSSq199R7FkCh6bPRdDtnpTH7YhF3Y=;
 b=i11r3FbS5uUDJHAMdLXZSw9hTrkhzxaQ+OiEc1R/R00I+8kfZDQQ1M1c
 e0VekPUluOctZPKAWfjEDdzE0ugk2tWqzBCM/xFaITmOq/Ug02PGqRCU4
 CbTv8fpdQ5ZFhJNU6Hto1T7qTn/HmOKh9Ee5cJYdAMvpfCysQrEUUvdZx
 qF09JrnOaT3ME8EjmwHE4DjAxPmv8Evz2t0yMA851W2xjWeVPyS6uaL4v
 8pDkbkT+c7Jp7hOiUaGp9+OI0FKJ5XsIFGP/fh0vWwDkPpQCsj7beRxb+
 CY+4B4b8e6B8qrwI73YsfHhRI5VG2pvjqDY/UuLf7eHW0HBQKfaEXep8y A==;
X-CSE-ConnectionGUID: jQcvsOprRjCgJh/a+IQddw==
X-CSE-MsgGUID: /nnNhlt1QH6lHQ8BoEE9aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65663461"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="65663461"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:17:23 -0800
X-CSE-ConnectionGUID: mRri0q1xQ96sAKH0qtb1+g==
X-CSE-MsgGUID: t5oagjE9RkuGc7XzLMucXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="193703266"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:17:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:17:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 07:17:22 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.66) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:17:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewqQ/ejm7BDZhe4eAHZX7FYzycfWS7PynwtXPQsJY5BSuWf4OJkcI+c2sY/ZSIsSayl/bSC4LLwwN925rTcglGFu8mnQilG7ZnjHTaI1EFu5H+c1Umvdi9wfITFJpdgFyaH/b82bpyLsQjO6AsSzrdw+xbTaPiajofMBw2AUpKAd02UpCxL7Cd6iIV1pLf1g02rfiaXp1nJwxa/oaj8BwycJLyrJOc2EqDD+EWSSWB3whCXOkNK/Sc5kwhVNBzXJ1QxT07l5JHaX6Y57iub9lpbRSqXy2uGBNftVJodtDRyrnovu8HVOQWw0xcRJaYhvaU4khYCTcZQF4r/2cvwjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcigzLCxK7fh1DhJhYm7H1/Y3+X/qfzdfEZLCOp01R4=;
 b=fakwyVSYdn3gi/Ad0LbMPkLYzatj/Z5UZDtjIqnxjsu/8XqlhAaEcyMmRaSRfDN9KzHwy7lB5bRgvD4wPObwk31yWYpmVrivlOahMcbX9XsoPnFU56X1r7mQk98kfCK0/ToJe/LlYZBmOBF29ursP8+D1z4wB7a0kV/HnaMEhLp1ejrUgl60qTssoVxjAFu5D4WNErhJPjR/QgMfn+6f5YDhXq6zAf3qetl0kGqS0DW2ryOH2YSjSw48p3Ubp+tdh01quywYbsZGEz2qjOO/A3Ai8iFvqAdH3x9LPq81rGdPi+EHIwJ9xiZutImk/j4k26wQbUAfOoLhMdVIb6ccLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7351.namprd11.prod.outlook.com (2603:10b6:8:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 15:17:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 15:17:20 +0000
Date: Tue, 2 Dec 2025 07:17:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: "Yadav, Arvind" <arvind.yadav@intel.com>,
 <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 3/9] drm/xe/bo: Prevent purging of shared buffer objects
Message-ID: <aS8C/lCla/NdL43q@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-4-arvind.yadav@intel.com>
 <aS4geyZDuwlcyc9R@lstrano-desk.jf.intel.com>
 <6c3ed737-3dd5-49ca-a78e-593d8e187220@intel.com>
 <d5fd4f75e084f4e8d0e3eb7e542d8988fab87449.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5fd4f75e084f4e8d0e3eb7e542d8988fab87449.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0127.namprd04.prod.outlook.com
 (2603:10b6:303:84::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 5264728a-a0c0-4889-af08-08de31b5e35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?evy/RAFOL0eFjH2FtxonJua5HaHG1VpGQALQwO2MGAX56dMeS16Bk50LtS?=
 =?iso-8859-1?Q?QjxFTDZMEZ7Ro3FhUBBrEjkF6wfsk/1dXxSKiyJiDVEOchzaKi9NHNcm79?=
 =?iso-8859-1?Q?CEDrddZZmuWHx7tbtmPEmBsu0sDKb/jv7QbzbVix6X46JtXGyDvO2oRitq?=
 =?iso-8859-1?Q?kuaoSIyLHhtkBYR4CzCD8A9FyoSqNm0C+Qsdhp4n5ib3r9Ei5XntgSrpEx?=
 =?iso-8859-1?Q?O140IL/iVaRC67Jm0nSSacWtUSdbb+q2w+lOM+hjLeKywxjUJ4pzosR4HP?=
 =?iso-8859-1?Q?KJ1zirAd9P6k/aRRL4/jO3T6scMFn7OJPEk6s5AInq2BBgVyZ4Cv79dQNS?=
 =?iso-8859-1?Q?nbBMjM3BvxOXP6qH8lMaLyRcerZld0sFT703N0fUthjRXIQ9LyOWSHYV+a?=
 =?iso-8859-1?Q?pt6/hR2pmZ6MGNE9HTAbJxL1bWtqoGiimNv9YRAKZmUDveS97wLDqJ2iDx?=
 =?iso-8859-1?Q?lEPdC6ttY9z+7yNBw2ZJ0m7df1IMmfzrkINVDnidYi1Tepgwdxtv+iV1Nk?=
 =?iso-8859-1?Q?ixwmmbm+t2g/7w8GxqnrlfIu/pmqqggfyG8/LQCsTFmdMvuLfJAArMUmKo?=
 =?iso-8859-1?Q?jRgHqok98XFJoN7YBkOjfqaMeQy05zoz6eltIrrb0mfqv7cMDGVrgOAF6C?=
 =?iso-8859-1?Q?M+W/e910mCHAwZ4IP0FRP8U6E8OG/m3d5YASYfHGwnpx5rRr0v9OyUE6Ml?=
 =?iso-8859-1?Q?bcMC8pHcwfLKCOwPOevPYJxF3DeI5cVZlQuf0GQ/+Clijg94qOOpyrDGjj?=
 =?iso-8859-1?Q?BdULgjf46+vgHQhhOmCfcUC+B1a9uId/KRBlq2MlnV1Wp3M4aZyqSfrmoF?=
 =?iso-8859-1?Q?u0B7lJSSyZMAcvWtTEo0x/CYHpgahV/rgH091XqyRyM0VzZypRYkpZtQeN?=
 =?iso-8859-1?Q?xlTfHcYRF9RPHk2J9sM4Q0qZ16VkKvOT51zwL6Q9Rlgx3I0x35Wax7jNe9?=
 =?iso-8859-1?Q?kyrsO+uyCzwvQhALkAg7JiTWPe3Cfc2hE1RPHf3xl/3+1LL0Jsz7haDOgf?=
 =?iso-8859-1?Q?WzdG9vqr62vHTVdQQyW9tYszSOYQ0+hQD6CSRGBz04kSp09cczkFSqNWE/?=
 =?iso-8859-1?Q?t1zhwsDNXgP1B/YdvIDbQjna8469ciArkjl/PdHn9llMdF2io/TqRsLF75?=
 =?iso-8859-1?Q?doSj4fJjTCtelVVqdIRveW30nrxeChUrlrSevUwbMayHZjXlv9gTtncWIU?=
 =?iso-8859-1?Q?pNU5I4U5aryJJlGUatOayPsT0LhN9i7A65VxvusWcnWEdG/8ynt8d0dpUw?=
 =?iso-8859-1?Q?DusPVP1QEr1BiKyleXd7+CdIXrrMCZwXFaQlQPzmBxJRx02eHGby9PMYzr?=
 =?iso-8859-1?Q?7H23j70NuaLVRkiDLEEDBF3M/veGaZ8Lvj1fuynLsZrYera6WYujfLGGPf?=
 =?iso-8859-1?Q?/MFnVrhL/XI73ATbz6I/+uzy/PuDA3/M593bOF2P3ZZW6Ah1tAswjSpJs4?=
 =?iso-8859-1?Q?Y+P/0ovDTrr2SnpIvUqd2vmlXZm/lv4N+x+BmhbhI3mC4jflviaueZVRLX?=
 =?iso-8859-1?Q?dHd/UDUW1AtXfmolyjjbqE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vr0nHtkiklAnHZPCuOkQTHx5/jt9swaKeGOWyMGFuBQ9yDrbkqePLm6/DZ?=
 =?iso-8859-1?Q?IiTqijEx4ttZsdi8xeCst8LQnGTk6iNHeyupQeCsUVwmaO8HcFytIH+TOS?=
 =?iso-8859-1?Q?6ciFOdgAE45geO+IcnUfHo/mZVObWPo4q5TFnGp+fVMpmLAbdmbGHXLzlg?=
 =?iso-8859-1?Q?pOfK7vqU/uobQX5zbUnBDG1jHMDy6l+ol24i2/M8Oayzo7qWHuUETLsNDF?=
 =?iso-8859-1?Q?yV/ehnSpoLOZ/n8ByNjGcJzfWQD1ARiCrvZ8VJJzis/z2wLezq3G/DytNd?=
 =?iso-8859-1?Q?P8NZg7wPYzsiWDa83XptlW7gYnPonLI2nkmbNthX50hXwmoC7lxDtX5Lm4?=
 =?iso-8859-1?Q?1UAGNj8pncJEDUGrD7ZEOyRBY4xtFIGYQ2RZVHLCBOe1s1y6Ct93hT3rpi?=
 =?iso-8859-1?Q?CjBZ0Pzjm/kOr03ruenHxfEbGH9ievr7Q1/RIJH+KVhj0B2hcScD2CSRM+?=
 =?iso-8859-1?Q?zPBHhIVA+7Lyg4+CgdXGgZSIfmmycXDN5cDenQXDjfH21fB0A5TgGnqhST?=
 =?iso-8859-1?Q?noHRL4nVo9jqagd+kUl+xqWortSuCqSjtKL4oE413FW/GEws7AvrWeNc8E?=
 =?iso-8859-1?Q?nuTsevWsMRdTrpy/tX5KZycQJdxmXRoTKjFPpWsKO8+Gnt9zLmUasJSnmS?=
 =?iso-8859-1?Q?g8RGIwocFuws86yfBF4JPPYf5b2cU7oGtNNAHMGEFJsjR8Urk1p/084LVW?=
 =?iso-8859-1?Q?aZafgBk6sqyHhr7D2h7CM2RTPlMLO7IpQRr3ZY3ydkf9GrcZ0eQT4uMEML?=
 =?iso-8859-1?Q?7vC2VrWyMhWA+nQDx0UXpjpa+oKVk6Qk820gKDkZi17m8uI/blAsS7riDT?=
 =?iso-8859-1?Q?wZGBnMBss4bxJmmJryKz7lNwcBuzUWe3qG14be0yWzQ0BQ8rAdzHT63IpE?=
 =?iso-8859-1?Q?uivJJ0sXQ54KFb3Xi0kF5dmA9kf+aE6DkSQexB/G/3fisVBNw57wEfIOEr?=
 =?iso-8859-1?Q?vD3wjJutqStwId2bgzjjXWtU8djyexEp56plXXLotkuX3dICRaUtyM1X8m?=
 =?iso-8859-1?Q?YpxB1hN16ka8ja9ZmZrBLH0XiFhR4FN8N5BswjxeiZw5ef1Cpb5sjEnI81?=
 =?iso-8859-1?Q?vYwC/7mpyPQB9H5CogaCERvKUlxXs9crST1jwRgPhjInZnejGO986l4LIT?=
 =?iso-8859-1?Q?LK+takA+i1xknv/dz0OJ6oRXotWsasTd1GBvGBbQBkVkmzVDviiTWPzllS?=
 =?iso-8859-1?Q?LnAmXax6GQx0rPqN/EaN7T5Fp0qJyVW9ikb1sgqw8GdQpJ2vK5i0H42ZAy?=
 =?iso-8859-1?Q?28njarOPmo1rLsNK5aRNLS8MbaCdcz2oq8yNSStfxyS1IsHCuqucmbsrlt?=
 =?iso-8859-1?Q?Yi0N5PTS67SgxjnOa08SIads4At6jEvAt3pqTwu5olP5goyejpmfm9FSVv?=
 =?iso-8859-1?Q?LkrcEpXKp6jIrFD1KqB+nTuaGVPodkmp4iPh48v8dgqsbirWtt7C9O0Jbu?=
 =?iso-8859-1?Q?2jJwmksWACY/yCoEWqW+J8VTFgnyNna/SabCD+TgsGC2SBRRmXFUBMwpPG?=
 =?iso-8859-1?Q?a8MWQlBNIqjwxRAu4mOJyvX4J1NYPnYQ/LaT72IekbsDSrmI54nV2JHC/Y?=
 =?iso-8859-1?Q?QJekiqKmXi9LfMEUdTSXdU3OCeTtyrm0ePvKq0ZgRa05VKN8YqzrkQdzpt?=
 =?iso-8859-1?Q?gf6F7MNt/TD/O0xJlJzo4Q9CCZCwPnsKasqZdNs/CLdZFP7zvuSJlX+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5264728a-a0c0-4889-af08-08de31b5e35d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:17:20.7945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ef0rdFgslsm9+lC0tgkORtMI/91+0EF48lc8rT9jpxKsghs3Y+UMYNIfA+FJ0aUUPrll0fXS4ZZrn0mW7vyw7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7351
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

On Tue, Dec 02, 2025 at 10:42:07AM +0100, Thomas Hellström wrote:
> On Tue, 2025-12-02 at 09:12 +0530, Yadav, Arvind wrote:
> > 
> > On 02-12-2025 04:40, Matthew Brost wrote:
> > > On Mon, Dec 01, 2025 at 11:20:13AM +0530, Arvind Yadav wrote:
> > > > Introduce the `xe_bo_is_shared_locked()` inline helper to
> > > > determine if a
> > > > buffer object is shared across multiple clients or drivers. A
> > > > buffer is
> > > > considered shared if it is exported via dma-buf, imported, or has
> > > > a
> > > > handle count greater than one.
> > > > 
> > > > This check is critical for safely implementing purgeable memory.
> > > > Purging
> > > > a buffer that is shared would lead to data corruption for other
> > > > clients
> > > > that still hold a reference to it.
> > > > 
> > > > The kernel cannot safely determine when all clients are done with
> > > > a
> > > > shared buffer, so shared BOs must never be marked DONTNEED or
> > > > purged.
> > > > 
> > > > The new helper is used in two key locations:
> > > > 1.  In `xe_vm_madvise_purgeable_bo()`, to prevent userspace from
> > > >      successfully marking a shared buffer as `DONTNEED`. This is
> > > > the
> > > >      primary safeguard against incorrect usage.
> > > > 
> > > > 2.  In `xe_bo_move()`, as a final safety check before the kernel
> > > >      initiates a purge during eviction. This ensures that even if
> > > > a
> > > >      shared buffer were somehow marked `DONTNEED`, it would not
> > > > be
> > > >      purged.
> > > > 
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo.h | 30 ++++++++++++++++++++++++++++++
> > > >   1 file changed, 30 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > > b/drivers/gpu/drm/xe/xe_bo.h
> > > > index b0a31c77e612..97edb38bf1ed 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > @@ -478,4 +478,34 @@ static inline bool xe_bo_is_mem_type(struct
> > > > xe_bo *bo, u32 mem_type)
> > > >   	xe_bo_assert_held(bo);
> > > >   	return bo->ttm.resource->mem_type == mem_type;
> > > >   }
> > > > +
> > > > +/**
> > > > + * xe_bo_is_shared_locked - Check if a buffer object is shared
> > > > + * @bo: The buffer object to check
> > > > + *
> > > > + * Determines if a buffer object is considered shared, which
> > > > includes:
> > > > + * - Exported via dma-buf (obj->dma_buf is set)
> > > > + * - Imported from another driver (obj->import_attach is set)
> > > > + * - Referenced by multiple clients (handle_count > 1)
> > > > + *
> > > > + * This check is used to prevent data loss on shared content by
> > > > avoiding
> > > > + * certain operations like purging on buffers that other
> > > > processes or
> > > > + * drivers might still be using.
> > > > + *
> > > > + * Return: true if the buffer object is shared, false otherwise.
> > > > + */
> > > > +static inline bool xe_bo_is_shared_locked(const struct xe_bo
> > > > *bo)
> > > > +{
> > > > +	const struct drm_gem_object *obj = &bo->ttm.base;
> > > > +
> > > It seems like everything below here should be a new drm gem helper.
> > There is a DRM helper 'drm_gem_object_is_shared_for_memory_stats()',
> > but 
> > it's
> > specifically scoped for fdinfo memory accounting and doesn't check 
> > import_attach.
> > > > +	dma_resv_assert_held(obj->resv);
> > > > +
> > > > +	if (obj->dma_buf || obj->import_attach)
> > > > +		return true;
> > > > +
> > > > +	if (obj->handle_count > 1)
> > > So this covers the case when we prime fd to handle but we resolve
> > > to a
> > > BO (i.e., we don't do a dma-buf attach, rather just take reference
> > > on BO
> > > as the BO is from the same device)? I just want to make sure I'm
> > > understanding this part correctly. If so, maybe throw a comment in
> > > here
> > > or update the functions kernel doc a bit with a better
> > > explaination.
> > Yes, that's correct! The handle_count > 1 check covers exactly that 
> > scenario:
> > When we do prime fd-to-handle but both processes are using the same
> > xe 
> > device,
> > we don't do a dma-buf attach. Instead, we just increment the
> > reference 
> > count
> > and handle_count on the same xe_bo.
> > I will add and update the function with comments.
> 
> Arvind, Matt
> 
> I think the correct way to check purgability support for shared buffers
> is to loop over all vmas attached to the bo and check that they all say
> WONTNEED? If they don't, the bo is not purgeable. This will also need a
> check at VMA unbinding.
> 

I think this makes sense. I haven't fully gotten through this series
yet, but will consider this during the code reviews. I probably should
apply this series in full before providing feedback.

Matt 

> /Thomas
> 
> 
> 
> 
> 
> 
> > 
> > ~Arvind
> > > Matt
> > > 
> > > > +		return true;
> > > > +
> > > > +	return false;
> > > > +}
> > > >   #endif
> > > > -- 
> > > > 2.43.0
> > > > 
> 
