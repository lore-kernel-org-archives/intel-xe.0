Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5885CAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 18:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935A210E3B5;
	Tue, 16 Sep 2025 18:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPjKK75U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402B510E3B5
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 18:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758045754; x=1789581754;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9AIollO+dRGO94+5Gn9y7i36SsS5+7s/xcbwmyieYB4=;
 b=WPjKK75UL5cCqQN5eCVyAiut5oBZTCKq9oU8ZxbBdq57v7sQ5NyDlQnC
 OGzHB3+l8HfwM/flLd71N40HolXhaAHvFY732n0zgIdh89AFghaj16bvM
 fW9nIT+iT8yYzQIkK3Cr+bY9+VgwZBGs2jSbI13qtOXF1qL1F6FhPoRXb
 7q8k00eL/IhPaqcXxYTZuLMqE7cdhiICrWkTMpmL2p+IEOZsn2Ab/k+3B
 4nWhVLpvdTqnfEBgm2SFnQ1Z3SD5iEQsVJwI4LoLQIZr4RGf6rANB9UlO
 Wt0+7x+KIdvXn//n1hMZtjKSGmO46mrjAdHzuid6TIry5U+MG3llG+eBC Q==;
X-CSE-ConnectionGUID: xnOH28lhQoWvbM80xdLhEQ==
X-CSE-MsgGUID: IWfCHeXaTDCLeOzQXZVEyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60204677"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="60204677"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 11:02:33 -0700
X-CSE-ConnectionGUID: AC1cx684TCuKKR6V3RyIlA==
X-CSE-MsgGUID: J1QMDobSTjavRmESeas00w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="205798400"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 11:02:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 11:02:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 11:02:32 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 11:02:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMddrW7elJx8Z3tV0yhS+2TYv09+6KVdisRXnlPE7+f0kHoSWnwCljDhAJnO0n7SPafbqFDUfd0a2ukVLReFQ4gw9sCnvsrxYcJ8mLdbVD5/1wpuGJeauoSWzbSTpf1GP0Qnjql7qrSDSv1hlgYwMLko/563U36JscpgVtJPkzLD0vb0S3itPIMOcBF4OQnc+8CZadi7QFjZjhk5R/utlifR6yUrK7LSSszewFJR5H3/FrGgnX82AF9TPLj0AyeP3bdTAlEXEn9GQ1z74yDv9yXOOfjjf9HckarAoJvvuaJuo/NqALN2KO3pU12OzkFI++Bw0cRYoXvXgGqoraUFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrXVECPfLCzKgJ5WCW4/HnjpOQunFMtQXCxNPeH08GI=;
 b=lh0hAFe0005mkR7WK+98jvmewqKKZrBl0FZe5KgWUoVb1Lbz22V393Mqc19UrVRJy0oEtahJEWcYX3jdZah+/iZiS5efrzGjs5k8GaW4JDXIXM/DW0xBSzpr06XMz3hWApdEcAqKkjOcl63+rhYXl69eCeEFtJKmUDs0gkVViwiUyjevlNhLyuQORO5IXFA3oS/XijdPLvfxUXxKqaUYJIiu9JvJht113aRNCzZ3Xuv/CpdKhhFfIoTvHzDvym5oPqQ4tK5e/oJUNOqpMMXKoqMAhQJ4iGS+67nDyiZJlUXSKFUCidI/gTfw4X13EbhZwPQ8fWOxLb2bgp9AR67HZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 18:02:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 18:02:29 +0000
Date: Tue, 16 Sep 2025 11:02:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [RFC PATCH] drm/xe/dma-buf: Allow pinning of p2p dma-buf
Message-ID: <aMmmMoPcdimBAXS7@lstrano-desk.jf.intel.com>
References: <20250916115322.23293-1-thomas.hellstrom@linux.intel.com>
 <53d50dff-89eb-4de0-befc-4bb2552c5e21@intel.com>
 <afdf178471021e26a72bc38f17ad747b08533941.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afdf178471021e26a72bc38f17ad747b08533941.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:a03:54::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dca56dd-fa31-4f34-6b56-08ddf54b3373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?u1PtzlOU0XJc+7e3weTlrf6wVTSN6S7Xm0HNqllnTUum1Fdpwob7TAWBCT?=
 =?iso-8859-1?Q?EdQMDKrhG35Yk/m3ac2clq0CUxzlwL98OyrVskBkrC240DiyJuGCss+4hr?=
 =?iso-8859-1?Q?M+0SJRmjvZwapLlWY/WX3VryKFTypmKG+2geGMiChq3qP08+gJWxvbDQEk?=
 =?iso-8859-1?Q?q9Nmgwu+iTbSGqIDMYJVtb99Vs7Z3gQnosjAs/cSnSXpx02sWDJObGUrdo?=
 =?iso-8859-1?Q?TPSzX5HrwKnumyvDtC/kKLCF863kmYBh0AorOLbNEnidQfwyhsTBLMGkgY?=
 =?iso-8859-1?Q?WrS/xIbMshoN8WOcJra0qo96nmzhhEikLTT1XEB4e4xALnalc6lTNK23VV?=
 =?iso-8859-1?Q?65magJzL+Vt06BghVUZl+RXjy/4GvpKvSNy/2md6fq14LYGEn4b2DnciYJ?=
 =?iso-8859-1?Q?hD06WU9YYiEPO6fU5phojqkLVIMRfIXLVETTtL/6cL+mp3VwTzXwjuro0t?=
 =?iso-8859-1?Q?OYJ1msBRRYAn/gk5nbMf1YjHqcb90M/OKTLRCVLE+9bLmuhVWpUcltEpgy?=
 =?iso-8859-1?Q?0aIpIJfNZ9wF7ibQA+dfvznNkJCo074bO/UstFQ6hOGOTyo794axvNdq9C?=
 =?iso-8859-1?Q?Hj2TnKSOejzld9jdYdRGfBRZstKuoASdIortK+0/wXwlenYTYkDSN6MZYl?=
 =?iso-8859-1?Q?zurCZ9nO+k0Z68Z68gmUM9Zr7gpL4ZURPhK7a9X5tSmCQYgGXPqnN6eDLx?=
 =?iso-8859-1?Q?p1bCEg69B12xsu4q8DafI+/P6tHCFfQh7+ELwwLIMOBCvWIX+EqRzbMMsf?=
 =?iso-8859-1?Q?vDCuQQUP4CF3KOfo+7f7XwYuuNNJiuQD8YB/6aTcFs5fOuiO9KFDQYnkv6?=
 =?iso-8859-1?Q?GvceNnsunW6jAJOtKTaP6Riq5kzeh9UVzGtVbUi0H8e+iPmERjkeUuJd/M?=
 =?iso-8859-1?Q?EqItwyCuOBp4x1tUr/jCU3yhBJ4Rbii0MWVlv7EzPcRMzOnvqH4Xr4MO75?=
 =?iso-8859-1?Q?24YvL1UyDfXjAB8m13N4vLvFLVBhnxPwV6FmoTSxXRQqKxC5f+rctO5EnK?=
 =?iso-8859-1?Q?2gzCYJ5wjlecJccaLm24bZP6AOJiPqGtizdcj9Mvb90ZtjB0K3I6irHv7/?=
 =?iso-8859-1?Q?WhVlmp5nsneYpT8CtJ5qyJGF6CSymT1sg9bDYBDaKzv0SaHiDFaol1M+Nd?=
 =?iso-8859-1?Q?sVWLSDnDJuiQkA/1By+14o2eTBE+d1aQPO09NfHq0B0qpS96CzMWQQOoc6?=
 =?iso-8859-1?Q?Q7H8GiTBn2AAWQsW30cSixHD+rMeOzHDefpYIdbm9brORP7kRXfFhuNWCe?=
 =?iso-8859-1?Q?y4NN526m3Fvb6HXQGkoPvd1kXCNpwBrkRA0DC+C5j1a7+mLFY2oydnyrXr?=
 =?iso-8859-1?Q?PdKzChGppxHcBhAdDfLRfa3YazdagwhkhWJXfkVoovFxHQJWhJ+GivnZa/?=
 =?iso-8859-1?Q?UNSc//lf69eqImayYDuizW5K4SzIlD6+pBiTglBaOi6NPsy7xsqaxZQvVs?=
 =?iso-8859-1?Q?G/qecvcUt6k/jzRn+ucmzu5EoB6J3v4tj3ykakxz0IPM3JnucG79cc0s4P?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HHRTZRUIYf1kjk8VoRrgzlhMOlM3wwa4fhu3c3DbIyLCcT0VZ+W+gwkccV?=
 =?iso-8859-1?Q?Xh+gkS1JI3nb2m9CkzmdMKl1gBkKdVAueIZtRvPVWNxS6eWFMVHYM0XGNk?=
 =?iso-8859-1?Q?kCn5zUhm9HY8oLrvE1kynPLaLO0dvRaVSFt3ytYquh2cXC9SMxBVv3Jtyo?=
 =?iso-8859-1?Q?NkhEs7SAVsfSQmZn/dJcxtrproq/ndBIuxrYACgogKHr0EsDpRl8KSqEI7?=
 =?iso-8859-1?Q?2Emyyyc40H3v20UE+XHORc4ck/uZcER6Sc2ffuhztrtyzgXWTUtByKqjKS?=
 =?iso-8859-1?Q?khT3DtOJ0GCbjbjqhdWP+zTvPIaYaxTFl5d31ZsTs9p623FiSylXFihJxr?=
 =?iso-8859-1?Q?z2h6qdhIg8HmZDn+ikq0UosDGmhv4PE7zWqE4vf7CbvfhO6CzsG9A8pLXP?=
 =?iso-8859-1?Q?EWrTvJDLXaOJbop7Wx9IbQLXKwBN7gycbOsvzkGtlJ+/W2/LOR2K8k4JSM?=
 =?iso-8859-1?Q?tJLTGsuUdiWC6hIrAt9Pwx/IfkqldsnXuYYyyadOMRXczoFbxnQq4tVO5S?=
 =?iso-8859-1?Q?QDxaCLkdnHBZ9N5o6AAkDc4Mx/Nh7ES3HQXnLwovxngJWuQfUksKFtoCKd?=
 =?iso-8859-1?Q?D+G5rYndcErFt+UhbsXtFIKydXI9Oev0Tay4DGNSPDawKRvCuTCl5nK+lv?=
 =?iso-8859-1?Q?KmiPj33x0ywl3XD0IhwLZmAMth6ojDRiFArs0Gdve+yf4B3BY7de1qkvmg?=
 =?iso-8859-1?Q?FhmQ9QjdPbRJ2XtkCaEndQ1XnRNMXXmDhbx16KcUdrZBjH/pSkMXVbOgMD?=
 =?iso-8859-1?Q?6qwWDCCXbaooallM4B/IzSKlU9mNSRo+S5Kjok97tblIA7zx+PEUyPzzh4?=
 =?iso-8859-1?Q?Rhc7VhuUuky0EGRmQ4+6bF/Z9iEAzCCuCPiTViZxnDs+/+58YQOQcvkIMC?=
 =?iso-8859-1?Q?e0OXYbl3v8TlwVCq6g4zENV1awNHx3UvszG0Avkdd03UeRiNhDfYGh6z1z?=
 =?iso-8859-1?Q?aidJ+VnBhew/v73FGui7lEoULmMYL2pS4WVP9/9LiXLPzGtlQ9HzVZycKe?=
 =?iso-8859-1?Q?M/wO/pmVAtdgDZfHefKuCqgViq3qRZ5aWpMQQCH5+E91hx+rvX4H63lTzo?=
 =?iso-8859-1?Q?DltHTbQwzpqZvhHojc0kbR7ALxNLP1q0FXPQ6zDQ68ttLAC0cf5bbyQAnV?=
 =?iso-8859-1?Q?ZxXidIZiuBCIBwF89jFipkQi/26cPkDpfn4G61I1k4JSlJumyJwU1rO7bB?=
 =?iso-8859-1?Q?0lNo1Xlx5+GvPR68RJoYgWtzNiwo1bsunDbJMc91NdSpR1wfUlYmZ6JyO6?=
 =?iso-8859-1?Q?V5JvhikwRFr45d8/iT2JdZJJ4U2gXV454b67Zt9GRLMZxwJy/KskFz5CiE?=
 =?iso-8859-1?Q?W7Z/F2Tq2LGJsijwdJ2lTagqNsRwcr65xFFWUhgJPqwyuN8Eweumxg99Nk?=
 =?iso-8859-1?Q?6bqxmPPKTFRR3N0B8dK/bPEN5TpzfCWCRFaX9C8ryb7+Q7k7L06+Td/ScE?=
 =?iso-8859-1?Q?WKNO6qMyjvubBO4YrczEH2lgB3RzR/oiihzFSv4aMTTThHHtRxLJcB8Wbz?=
 =?iso-8859-1?Q?hBfzOFmRd4Mq3CfUCU/9zILBV1oS+QetefGI4z9wPlvXJTD1uVLuJlWTBn?=
 =?iso-8859-1?Q?9agIsXuW2GNPxKM3buaQ388kL///S3Et+NnJY0Y/8RE2zSN7C/ZYXFqt8T?=
 =?iso-8859-1?Q?M4ygulrm/AoVoYC8+S1EvYb5uGRgWU0O8R9Hvg3HuEQG4V1B0CXrGbJw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dca56dd-fa31-4f34-6b56-08ddf54b3373
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 18:02:29.3067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+aXiN3Aew+IVIbWxbxkzQLOR0VrUrAnPtwwjuUxArRc6tEAs7tsQ9F7Vd2uDgDnXcsNb8DL5QIYAsr9j6XZ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
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

On Tue, Sep 16, 2025 at 03:06:48PM +0200, Thomas Hellström wrote:
> On Tue, 2025-09-16 at 14:03 +0100, Matthew Auld wrote:
> > On 16/09/2025 12:53, Thomas Hellström wrote:
> > > RDMA NICs typically requires the VRAM dma-bufs to be pinned in
> > > VRAM for pcie-p2p communication, since they don't fully support
> > > the move_notify() scheme. We would like to support that.
> > > 
> > > However allowing unaccounted pinning of VRAM creates a DOS vector
> > > so up until now we haven't allowed it.
> > > 
> > > However with cgroups support in TTM, the amount of VRAM allocated
> > > to a cgroup can be limited, and since also the pinned memory is
> > > accounted as allocated VRAM we should be safe.
> > > 
> > > An analogy with system memory can be made if we observe the
> > > similarity with kernel system memory that is allocated as the
> > > result of user-space action and that is accounted using
> > > __GFP_ACCOUNT.
> > > 
> > > Ideally, to be more flexible, we would add a "pinned_memory",
> > > or possibly "kernel_memory" limit to the dmem cgroups controller,
> > > that would additionally limit the memory that is pinned in this
> > > way.
> > > If we let that limit default to the dmem::max limit we can
> > > introduce that without needing to care about regressions.
> > > 
> > > Considering that we already pin VRAM in this way for at least
> > > page-table memory and LRC memory, and the above path to greater
> > > flexibility, allow this also for dma-bufs.
> > > 
> > > Cc: Dave Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/tests/xe_dma_buf.c | 13 +++++++++
> > >   drivers/gpu/drm/xe/xe_dma_buf.c       | 41 +++++++++++++++++-----
> > > -----
> > >   2 files changed, 39 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > index a7e548a2bdfb..1f88ca71820c 100644
> > > --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> > > @@ -31,6 +31,7 @@ static void check_residency(struct kunit *test,
> > > struct xe_bo *exported,
> > >   			    struct drm_exec *exec)
> > >   {
> > >   	struct dma_buf_test_params *params =
> > > to_dma_buf_test_params(test->priv);
> > > +	struct dma_buf_attachment *attach;
> > >   	u32 mem_type;
> > >   	int ret;
> > >   
> > > @@ -88,6 +89,18 @@ static void check_residency(struct kunit *test,
> > > struct xe_bo *exported,
> > >   
> > >   	KUNIT_EXPECT_TRUE(test, xe_bo_is_mem_type(exported,
> > > mem_type));
> > >   
> > > +	/* Check that we can pin without migrating. */
> > > +	attach = list_first_entry_or_null(&dmabuf->attachments,
> > > typeof(*attach), node);
> > > +	if (attach) {
> > > +		int err = dma_buf_pin(attach);
> > > +
> > > +		if (!err) {
> > > +			KUNIT_EXPECT_TRUE(test,
> > > xe_bo_is_mem_type(exported, mem_type));
> > > +			dma_buf_unpin(attach);
> > > +		}
> > > +		KUNIT_EXPECT_EQ(test, err, 0);
> > > +	}
> > > +
> > >   	if (params->force_different_devices)
> > >   		KUNIT_EXPECT_TRUE(test,
> > > xe_bo_is_mem_type(imported, XE_PL_TT));
> > >   	else
> > > diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > index a7d67725c3ee..54e42960daad 100644
> > > --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> > > +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> > > @@ -48,32 +48,43 @@ static void xe_dma_buf_detach(struct dma_buf
> > > *dmabuf,
> > >   
> > >   static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
> > >   {
> > > -	struct drm_gem_object *obj = attach->dmabuf->priv;
> > > +	struct dma_buf *dmabuf = attach->dmabuf;
> > > +	struct drm_gem_object *obj = dmabuf->priv;
> > >   	struct xe_bo *bo = gem_to_xe_bo(obj);
> > >   	struct xe_device *xe = xe_bo_device(bo);
> > >   	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
> > > +	bool allow_vram = true;
> > >   	int ret;
> > >   
> > > -	/*
> > > -	 * For now only support pinning in TT memory, for two
> > > reasons:
> > > -	 * 1) Avoid pinning in a placement not accessible to some
> > > importers.
> > > -	 * 2) Pinning in VRAM requires PIN accounting which is a
> > > to-do.
> > > -	 */
> > > -	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
> > > XE_PL_TT)) {
> > > +	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> > > +		allow_vram = false;
> > > +	} else {
> > > +		list_for_each_entry(attach, &dmabuf->attachments,
> > > node) {
> > > +			if (!attach->peer2peer) {
> > > +				allow_vram = false;
> > > +				break;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	if (xe_bo_is_pinned(bo) && !xe_bo_is_mem_type(bo,
> > > XE_PL_TT) &&
> > > +	    !(xe_bo_is_vram(bo) && allow_vram)) {
> > >   		drm_dbg(&xe->drm, "Can't migrate pinned bo for
> > > dma-buf pin.\n");
> > >   		return -EINVAL;
> > >   	}
> > >   
> > > -	ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > > -	if (ret) {
> > > -		if (ret != -EINTR && ret != -ERESTARTSYS)
> > > -			drm_dbg(&xe->drm,
> > > -				"Failed migrating dma-buf to TT
> > > memory: %pe\n",
> > > -				ERR_PTR(ret));
> > > -		return ret;
> > > +	if (!allow_vram) {
> > > +		ret = xe_bo_migrate(bo, XE_PL_TT, NULL, exec);
> > > +		if (ret) {
> > > +			if (ret != -EINTR && ret != -ERESTARTSYS)
> > > +				drm_dbg(&xe->drm,
> > > +					"Failed migrating dma-buf
> > > to TT memory: %pe\n",
> > > +					ERR_PTR(ret));
> > > +			return ret;
> > > +		}
> > >   	}
> > >   
> > > -	ret = xe_bo_pin_external(bo, true, exec);
> > > +	ret = xe_bo_pin_external(bo, !allow_vram, exec);
> > 
> > Are we also missing save/restore support for such objects? Or at
> > least I 
> > can't see where the save flow is happening for externally pinned
> > VRAM?
> 
> Good point. I forgot about that. IIRC we once made a deliberate
> decision to leave that out since we didn't support it.
> 
> I'll have a look at that as well depending if we decide to go
> ahead with this.
> 

Don't we take a PM ref exporting device in xe_dma_buf_attach? So when
memory attached to (or pinned in this case) we can't go through save /
restore flows as the device should be awake?

Matt
 
> /Thomas
> 
> > 
> > >   	xe_assert(xe, !ret);
> > >   
> > >   	return 0;
> > 
> 
