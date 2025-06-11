Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9ABC71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 17:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4D310E6DC;
	Wed, 11 Jun 2025 17:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElVB+ICU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F065210E6DC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 17:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749664559; x=1781200559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T3RJ4BdjPpL94E7DcNiJcusxRVVskA8hZMvIZEzBT+c=;
 b=ElVB+ICU71ZXBf5B5BuQC8RT21WSl/kVT69SCmRRQoj3hqtlEYzIa4xR
 vsE7aQP5S+yhJaWXwhw25K83uUFoGjkBzd8WcpkMNKTRhHSTnSTVvnXHS
 v0N+CJA4pePjXlhABCIH21ZyIEy2fK+PDY8WdpwV61cVr7hcXhJ/tx3q7
 s0/AgAh4trXjBXddru/ZrIOQYO1+3k/HtPpCdf2gDEMiTkuifM/QHrTqK
 pbqKHXDO1B/WZ1JA0JnZtlxHKktTxdTDWZKG7ViAIfuAn3CatbHOrvwdW
 0+LBLGO+egf5K6QWVNBCgK5N1qjlV12a7FOWv70DstAWKqklw9nKHiaiY A==;
X-CSE-ConnectionGUID: K8V9HkY0QpaCbOQ0UafgtA==
X-CSE-MsgGUID: 8x1Ia52WTzCe+6znrPXGtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63226300"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="63226300"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:55:59 -0700
X-CSE-ConnectionGUID: yMgfsKU1SEWqDjwzqFkjfg==
X-CSE-MsgGUID: +n4wUfh6SvqevAnn5vkH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="178175437"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:55:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 10:55:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 10:55:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 10:55:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXbVt0wPP2WaNO9S6rzHjIaN9NLxoQchIV5xJCnEwcUBew6+qMnSvyhjWOUQXrEwGQf+Ws9QpDoWweEta2/lUnMyj+oaIUM6vK/wkb4nQCnwlD450iRJZcyNNobo1KXeR3mbvzftlEQm2dhWJZ0Umx4MtEwsvAubSDwcIYhzGOYsQ0b1zvJ5kG+AqAGig+C6p6wDhjhbQIFj+8i1kGMOuW3+h9YwftUAOTwvE3YZqea0HdqULKzdojaAj+53kp4Z+5SNww0mJYNYJzTjt47SbEsCNGqa9CfPhiq4uz+7vhYvDv3nzChLCqJ1SHioq46ZTdLp7Jms5yxUt1EUkEYJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEzQVBaA64KxdHPuAPUa4TExZ0XgU1drWuSi/ugCyhI=;
 b=XjOo1yKYWiYPxsr6EfTHJO69kGgwMTutTTh+3eRJwT8iTHbvJDEKCKuRI8OOizzTtPjPuwww0/8uYKDskREaMFH/NkJL/dPvYwQGt9QGB76RQU1J8ISlYNHNv539sPVOKwZk1eHSQ2WSM6JNSaSnIZ1EZhfwKvagczYRhy2lZkDr6I/aABzNY71r6efyWinVKsTWLI/HLNN4XoKUROd3/nBAh24ppNN7Gqy8rCrycb0Td61kelzS1eScom+VPqwpH7iqdNHvrb76dj7wBjYVwNOGrw0QsNscNm4BWxUAjfzfyv4rROIyZFeOvd62e/CnUB5FtUzdDqNpUowihE6e1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9088.namprd11.prod.outlook.com (2603:10b6:208:57a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 17:55:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 17:55:27 +0000
Date: Wed, 11 Jun 2025 10:57:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aEnDbmfEVUEzmk0A@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <0c909f7376ab30f8260d83a74b3a908a4e6eb764.camel@intel.com>
 <aEmy8yBp0Ghssyuq@lstrano-desk.jf.intel.com>
 <7ede4886131931de5f9a672fd823d8bac3f374af.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ede4886131931de5f9a672fd823d8bac3f374af.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b87b5d-8a42-4a87-96e5-08dda9112601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wc4QN41oKtaQAILeANWIg5qhu8MCW+5JvUvxkKvxxdr7kVR4w9A5AJCgin?=
 =?iso-8859-1?Q?If61QBApt4G+SAl5V/kWFyBjzNdobndFgu05uxTvotE80wl5cfQH1+hiIn?=
 =?iso-8859-1?Q?zlCyqr1D2gJVnW6OvYKZEZzj3mhvdztP4QPUoQA95bs3ItGLLvOOvB8RhO?=
 =?iso-8859-1?Q?1S08yl5I5IHsa42/wY345ZiXu2Dl0dO9Lmpgjz4ZiCf/WVMGaRjbjG20Ul?=
 =?iso-8859-1?Q?CVkw+VKFVTXGzXe9cWsQr0s19NubWc4fvzeaQ/ITvPnIhJqIlcIZtFynhh?=
 =?iso-8859-1?Q?QerbmYmdyGUAGOmTx/lgo6NSnJsSQmXv2vqj7ESPPODuH+bfFs7G57dMxr?=
 =?iso-8859-1?Q?OqMLLjZNGI9qTBrYqhdfU0k5Dgs9nenLvaAIruNN1m+DmdQQ+HxmVCpRbV?=
 =?iso-8859-1?Q?pIWf3+Y72Yw51ZE5pBz9YPSCTQlnzj5jGVuI6Q6/quvNqYWV8wRdec76Ot?=
 =?iso-8859-1?Q?zhfG/e99CmX5G7JgE/PzG2axYq0g+1nF5Dtl5yj3wbJVkbJA141Z2rLD7o?=
 =?iso-8859-1?Q?VU3j2xtO8q8zN5i5r7eZVKb17TCbKg6/oa//fZx8w/qjQfrh8qejEw066H?=
 =?iso-8859-1?Q?2yn3h8+FK3pGqvq1CBywA+aF7BL7ec/jgTOeIWnqhXi1z797o8M+BKfUHg?=
 =?iso-8859-1?Q?6BaHME6yKBluvvR1b1JbyHCdSAF6e4/QxmZAJ/S4bdmdwONP0Uf0e+AXDY?=
 =?iso-8859-1?Q?SdMjydBCSPKzYoQZj8zGR6XOc+RAEpJzkumVglFGKKkkpcnSrfZ5tJ+6O3?=
 =?iso-8859-1?Q?3Z1F9Pb99YhsBeUuuDUSskzxUb/KnH1oGmzaxS0T5cGTRL0U7PobnzImZr?=
 =?iso-8859-1?Q?I7DszQJHz+hnSl0Pl/g0ipU5H+q648b++9R5kSk4Eile0/ts+k4fHrHai1?=
 =?iso-8859-1?Q?EqLv6/CnwCffpiM+GlPuW8RFHPqL7kRbHVM8QoYKFYAp7rft+pJu14k8Tl?=
 =?iso-8859-1?Q?5wM3rMdWKDpMDnrL4ROIWhRKTxt3qVK3Oe3xn98Z9s11J9Nll+k2mi4dcJ?=
 =?iso-8859-1?Q?DFL2NwjR0JBqyWObB0cBRHGMlvfCJ4DIIC5zxvI42qVJYPxOAb8iWKZMfz?=
 =?iso-8859-1?Q?DVv4SeM6Hy/hUU+hU5JXkxgBkFN6tW7MEjIfUfLdZWnwpiNyubIse8+jkE?=
 =?iso-8859-1?Q?51Z1sD/Fz4NIouIO5+ig6BuCRXXT++Qr+T7IyVUrd4I77fQ0XaWrxvdxXP?=
 =?iso-8859-1?Q?xdcvbosSFaYcty0fwuDDYg5U+hEG8JThyc1tk+6oefil8vYJVYnT7MH86i?=
 =?iso-8859-1?Q?eYFQc1oXp31/jAB+qB4ZSFcqWF59wnWgjBMk9Z0mAbcIxMaAQCQAo1hAOJ?=
 =?iso-8859-1?Q?LTWqXwIV4VYV+e4pcGyDQ+Tl57imvmk1Ypqn9bJaAaUJqn5eKJzHSOq8l+?=
 =?iso-8859-1?Q?RKU+iGaJx/m+QTu8mcePqC6gHeoo9f4eQAytcB4urtfCoRS+/yPO0VghlH?=
 =?iso-8859-1?Q?1SpsSNzE1+POlceJrxzX4hrDKFXf4u3i6tGqQFrVDYWkpPjSWxeZvi3BgI?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f4id+PY2Zz3P4KHiCjgvHU6qXScsp3TC/D540R4lssOolAdRFJh5jeT8YI?=
 =?iso-8859-1?Q?1fpk4noUob2xvQF6OF9GWesw+TC2Ky90cqC/0sBxHsczUZ3T+YckyvSpN7?=
 =?iso-8859-1?Q?zFbvQw5EEzD43QOyWC7n9N9XdRfceV6aQQKEYhNcNbrHWbB7N2GXaKJRKB?=
 =?iso-8859-1?Q?eaKVv97b+pRfO+YPeATiM+EPnjijqQbN8nnS9XjHudnkVaQSIspNb1vLcr?=
 =?iso-8859-1?Q?2tY7qgCeUh5p79WcS6vEheHmFbY+SwIGySgm5Ta2habpV63YYc4D8TsMdK?=
 =?iso-8859-1?Q?w98brCRlGo/d4Tlb6dnEXJnpxjI6dJap3Z8vZI637M0366kWlkK1u3n26p?=
 =?iso-8859-1?Q?FifiufrBY8FUdlid3KBpwTnmB57nwHsX/QE6iT8X04/JeR0KbvV+uIu7do?=
 =?iso-8859-1?Q?NtB7NjJD4pTXqwKYKFKZBHT3brFwzLxfgz9Qh16LEnUR5SPMtcIBgFI9jY?=
 =?iso-8859-1?Q?Qoru27oAi0kTtXPaguAJ6y0GxTbmZph25RO8bg5hFtwjF3ien39toEWWX3?=
 =?iso-8859-1?Q?WWFpiVfUivnXIAw9gj/M4z+ZAuKBuzemorBe94KmJ2qJE4c9EM6reYrqDs?=
 =?iso-8859-1?Q?nSEi/6c6HWADxw84LaN3nWdyb7/R0Q2skq63jV124TA+1Wb3vNXelp4Kll?=
 =?iso-8859-1?Q?bT6ZnWAun25HG78ISiCUCknhU19sk7SDPKjHCuQHfqQEklpq/fgwLX1O4A?=
 =?iso-8859-1?Q?lDB7H7l2jqneqDiJRww8IirvniOv2DVYwcqy+iBS+fo094KuUv0eX4MdoI?=
 =?iso-8859-1?Q?hVa6X5SMnB5rsI9xDKFKpKWK/Ngg7wGmNo6TSqBX6S2AA0MUfcr4aNXpw1?=
 =?iso-8859-1?Q?G6yREYyBNLhJIikGBvy1qt/dxX1A52oAmCP7dZajq47KVanbjFK6VttlSl?=
 =?iso-8859-1?Q?E52ZqcJHWME9ESN9F1k1AWxMRa6bZ7PnZ+fp27YEjr7Gzn7VVylHgGIzyn?=
 =?iso-8859-1?Q?Q+ac2T4FkfxQGGEch75XytKBm5NcXvYb1xmImtFzRg4NcAVRW4Q8BeHMtY?=
 =?iso-8859-1?Q?AgKm0AUEOc0o1UqAeTBrs74IUNUET+D+MxcUrdh+sGd77ZbKHLi5XBEc5F?=
 =?iso-8859-1?Q?GdHUTM4pVTdWq9tyv7JIvMISjuNV8PQ6Te/QmezpK0bbYn77+wZ8S2m4D/?=
 =?iso-8859-1?Q?l24mUETAOOAydEX89bIKxh9jiaOcOmB6eQKPcQ7o4srOFV+ODm2hjtHdeL?=
 =?iso-8859-1?Q?BOVlgseN3qaB0FMsKe1KESrMBGt4W4H3w6Bp0q1rcsxv7LJcMxoTqPOH8g?=
 =?iso-8859-1?Q?l1nxnsuBuCdz9b/Ix3vQxVlMqmWDRU5NtuUXK4TDCQPkJzB07CnraNl3NL?=
 =?iso-8859-1?Q?Iuo4gNyR4xkxwlQ3R+O9i8mEY2A+SZ0upEQ5vr4oQ6iqIipBkHigc4CxPA?=
 =?iso-8859-1?Q?uvlunD1NDrM/rooGof4+qnynihAqflkA6ss3KDC5HkMkbohGOw4+M2vgg2?=
 =?iso-8859-1?Q?tBzmpZTGh7Q9aF229c0I0sFaC7Tb9pWOSTKKPZib0WJu64ICrstnfAkBeh?=
 =?iso-8859-1?Q?CCmZAq6v4x0sn+IAiEyzy448+GjOSCeGjoHdbZUQY2osn8lO+tOEtOc+Mt?=
 =?iso-8859-1?Q?MgOUoggmqD7l9JMvNBp/4IA1FTbouaBE6DDmkqaLztTWNbmjBsbCMZq9ls?=
 =?iso-8859-1?Q?6Ev5VT3mUOpan/LwPZcz/SPeIPV6e9wyoNwHOGY8BSfew+GrD4qLDcMg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b87b5d-8a42-4a87-96e5-08dda9112601
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:55:27.5220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJMGCAYoDmLFS8S7u7ABGMkoILMyN8ayOqFMScFfH7wbNsZG3cnEHmcwNUfF0eaYSOnCNJRWTHsKiK9297ZEWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9088
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

On Wed, Jun 11, 2025 at 11:04:06AM -0600, Summers, Stuart wrote:
> On Wed, 2025-06-11 at 09:46 -0700, Matthew Brost wrote:
> > On Wed, Jun 11, 2025 at 10:26:44AM -0600, Summers, Stuart wrote:
> > > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > > > Clearing on free should hide latency of BO clears on new user BO
> > > > allocations.
> > > 
> > > Do you have any test results showing the latency improvement here
> > > on
> > > high volume submission tests? Also how does this impact at very
> > > large
> > 
> > No performance data yet available. Something we definitely should
> > look
> > into and would be curious about the results. FWIW, AMDGPU implements
> > clear on free in a very similar way to this series. 
> 
> I had a few other comments towards the end of the patch. Basically I

I should slow down and read... Repling to all comments here.

> think it would be nice to be able to configure this. There was
> significant testing done here for Aurora in i915 and the performance
> benefits were potentially different based on the types of workloads
> being used. Having user hints for instance might allow us to take
> advantage of those workload specific use cases.
> 

We can wire this mode to the uAPI for BO creation if needed - this patch
does clear-on-free blindly for any user BO. Ofc with uAPI we need a UMD
user to upstream. We may just want to start with this patch and do that
in a follow up if needed as it a minor tweak from a code PoV.

> > 
> > > buffer size submissions and mix of large and small buffer
> > > submissions
> > > with eviction between different processes?
> > > 
> > 
> > Eviction somewhat orthogonal to this. If an eviction occurs and it is
> > a
> > new allocation a clear would still have be issued ahead handing the
> > memory over to the new BO, if eviction occurs and paged in BO has
> > backing store (it was previously evicted) we'd just copy the contents
> > into the allocated memory.
> 
> Good point. I still think we should consider the scenarios of having a
> large buffer workload running and then clearing, then we have a small
> buffer workload coming in which now needs to wait on the clear from
> that large workload. Whereas on clear-on-alloc for the small workload,
> we can get that submission in quickly and not wait for that larger one.
> 

The buddy allocator tries to allocate cleared VRAM first, then falls
back to dirty VRAM. Dirty VRAM will still be cleared upon allocation in
this patch.

The senerio you describe could result in eviction actually. If a large
BO has pending clear - it won't be in either buddy allocator pool - it
will be TTM as ghost object (pending free). If the buddy allocator fails
an allocation, eviction is triggered with the ghost objects in TTM being
tried to allocate first (I think, if I'm misstaing TTM internals my
bad). This would as you suggest result in the BO allocation waiting on
potentially a large clear to finish even though the allocation is small
in size.

> I don't think there is necessarily a one-size-fits-all solution here
> which is why I think the hints are important.
> 

Jumping to new uAPI + hints immediately might not be the best approach,
but as I stated this is minor thing to add if needed.

> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > > 
> > > > Implemented via calling xe_migrate_clear in release notify and
> > > > updating
> > > > iterator in xe_migrate_clear to skip cleared buddy blocks. Only
> > > > user
> > > > BOs
> > > > cleared in release notify as kernel BOs could still be in use
> > > > (e.g.,
> > > > PT
> > > > BOs need to wait for dma-resv to be idle).
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > > > ++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> > > >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> > > >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> > > >  6 files changed, 94 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 4e39188a021a..74470f4d418d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1434,6 +1434,51 @@ static bool
> > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> > > >         return locked;
> > > >  }
> > > >  
> > > > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object
> > > > *ttm_bo)
> > > > +{
> > > > +       struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > > > +       struct dma_fence *fence;
> > > > +       int err, idx;
> > > > +
> > > > +       xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > > +
> > > > +       if (ttm_bo->type != ttm_bo_type_device)
> > > > +               return;
> > > > +
> > > > +       if (xe_device_wedged(xe))
> > > > +               return;
> > > > +
> > > > +       if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo-
> > > > >resource-
> > > > > mem_type))
> > > > +               return;
> > > > +
> > > > +       if (!drm_dev_enter(&xe->drm, &idx))
> > > > +               return;
> > > > +
> > > > +       if (!xe_pm_runtime_get_if_active(xe))
> > > > +               goto unbind;
> > > > +
> > > > +       err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> > > > +       if (err)
> > > > +               goto put_pm;
> > > > +
> > > > +       fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo-
> > > > > resource->mem_type),
> > > > +                                ttm_to_xe_bo(ttm_bo), ttm_bo-
> > > > > resource,
> > > > +                                XE_MIGRATE_CLEAR_FLAG_FULL |
> > > > +                                XE_MIGRATE_CLEAR_NON_DIRTY);
> > > > +       if (XE_WARN_ON(IS_ERR(fence)))
> > > > +               goto put_pm;
> > > > +
> > > > +       xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> > > > +       dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > > > +                          DMA_RESV_USAGE_KERNEL);
> > > > +       dma_fence_put(fence);
> > > > +
> > > > +put_pm:
> > > > +       xe_pm_runtime_put(xe);
> > > > +unbind:
> > > > +       drm_dev_exit(idx);
> > > > +}
> > > > +
> > > >  static void xe_ttm_bo_release_notify(struct ttm_buffer_object
> > > > *ttm_bo)
> > > >  {
> > > >         struct dma_resv_iter cursor;
> > > > @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct
> > > > ttm_buffer_object *ttm_bo)
> > > >         }
> > > >         dma_fence_put(replacement);
> > > >  
> > > > +       xe_ttm_bo_release_clear(ttm_bo);
> > > > +
> > > >         dma_resv_unlock(ttm_bo->base.resv);
> > > >  }
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >         struct xe_gt *gt = m->tile->primary_gt;
> > > >         struct xe_device *xe = gt_to_xe(gt);
> > > >         bool clear_only_system_ccs = false;
> > > > -       struct dma_fence *fence = NULL;
> > > > +       struct dma_fence *fence = dma_fence_get_stub();
> > > >         u64 size = bo->size;
> > > >         struct xe_res_cursor src_it;
> > > >         struct ttm_resource *src = dst;
> > > > @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >         if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> > > >                 clear_only_system_ccs = true;
> > > >  
> > > > -       if (!clear_vram)
> > > > +       if (!clear_vram) {
> > > >                 xe_res_first_sg(xe_bo_sg(bo), 0, bo->size,
> > > > &src_it);
> > > > -       else
> > > > +       } else {
> > > >                 xe_res_first(src, 0, bo->size, &src_it);
> > > > +               if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > +                       size -= xe_res_next_dirty(&src_it);
> > > > +       }
> > > >  
> > > >         while (size) {
> > > >                 u64 clear_L0_ofs;
> > > > @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >                         emit_pte(m, bb, clear_L0_pt, clear_vram,
> > > > clear_only_system_ccs,
> > > >                                  &src_it, clear_L0, dst);
> > > >  
> > > > +               if (clear_vram && !(clear_flags &
> > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > +                       size -= xe_res_next_dirty(&src_it);
> > > > +
> > > >                 bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > >                 update_idx = bb->len;
> > > >  
> > > > @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct
> > > > xe_migrate *m,
> > > >                 }
> > > >  
> > > >                 xe_sched_job_add_migrate_flush(job, flush_flags);
> > > > -               if (!fence) {
> > > > +               if (fence == dma_fence_get_stub()) {
> > > >                         /*
> > > >                          * There can't be anything userspace
> > > > related
> > > > at this
> > > >                          * point, so we just need to respect any
> > > > potential move
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > index fb9839c1bae0..58a7b747ef11 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct
> > > > xe_migrate
> > > > *m, struct xe_bo *bo,
> > > >  
> > > >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA          BIT(0)
> > > >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA         BIT(1)
> > > > +#define XE_MIGRATE_CLEAR_NON_DIRTY             BIT(2)
> > > >  #define
> > > > XE_MIGRATE_CLEAR_FLAG_FULL     (XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> > > >                                         XE_MIGRATE_CLEAR_FLAG_CCS
> > > > _DAT
> > > > A)
> > > >  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > index d1a403cfb628..630082e809ba 100644
> > > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> > > > xe_res_cursor *cur, u64 size)
> > > >         }
> > > >  }
> > > >  
> > > > +/**
> > > > + * xe_res_next_dirty - advance the cursor to next dirty buddy
> > > > block
> > > > + *
> > > > + * @cur: the cursor to advance
> > > > + *
> > > > + * Move the cursor until dirty buddy block is found.
> > > > + *
> > > > + * Return: Number of bytes cursor has been advanced
> > > > + */
> > > > +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> > > > +{
> > > > +       struct drm_buddy_block *block = cur->node;
> > > > +       u64 bytes = 0;
> > > > +
> > > > +       XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > > > +                  cur->mem_type != XE_PL_VRAM1);
> > > 
> > > What if we have more than just these two? Maybe check against the
> > > mask
> > > instead.

Sure. I think we do this test in a couple of other places in the driver too
and clean this up in seperate patch first.

> > > 
> > > > +
> > > > +       while (cur->remaining && drm_buddy_block_is_clear(block))
> > > > {
> > > > +               bytes += cur->size;
> > > > +               xe_res_next(cur, cur->size);
> > > > +               block = cur->node;
> > > > +       }
> > > > +
> > > > +       return bytes;
> > > > +}
> > > > +
> > > >  /**
> > > >   * xe_res_dma - return dma address of cursor at current position
> > > >   *
> > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > index 9e375a40aee9..120046941c1e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > > > ttm_resource_manager *man,
> > > >         if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> > > >                 vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> > > >  
> > > > +       if (tbo->type == ttm_bo_type_device)
> > > > +               vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> > > > +
> > > >         if (WARN_ON(!vres->base.size)) {
> > > >                 err = -EINVAL;
> > > >                 goto error_fini;
> > > > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> > > > ttm_resource_manager *man,
> > > >         struct drm_buddy *mm = &mgr->mm;
> > > >  
> > > >         mutex_lock(&mgr->lock);
> > > > -       drm_buddy_free_list(mm, &vres->blocks, 0);
> > > > +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> > > >         mgr->visible_avail += vres->used_visible_size;
> > > >         mutex_unlock(&mgr->lock);
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > index cc76050e376d..dfc0e6890b3c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct
> > > > ttm_resource
> > > > *res)
> > > >         return container_of(res, struct xe_ttm_vram_mgr_resource,
> > > > base);
> > > >  }
> > > >  
> > > > +static inline void
> > > > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> > > > +{
> > > > +       to_xe_ttm_vram_mgr_resource(res)->flags |=
> > > > DRM_BUDDY_CLEARED;
> > > 
> > > I see the amd driver is doing the same thing here. Maybe we can
> > > pull
> > > this in based on the flags given at the resource initialization so
> > > we
> > > can potentially tweak this for different scenarios (when to free)
> > > and
> > > converge what we're doing here and what amd is doing into the
> > > common
> > > code.
> > > 

AMD has a flag, which is the same test in this series as 'type ==
ttm_bo_type_device'. AMD blindly sets this flag on user BO creation but
as I stated above we could wire this to uAPI if needed.

Also I think there are some kernel BOs which clear-on-free is safe too
(e.g., I think only PT BOs need contents to stick around after final put
until dma-resv is clean of fences). Would have to fully to test for
definitive answer though.

Matt

> > > Thanks,
> > > Stuart
> > > 
> > > > +}
> > > > +
> > > >  static inline struct xe_ttm_vram_mgr *
> > > >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> > > >  {
> > > 
> 
