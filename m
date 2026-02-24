Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB44F55425
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 23:03:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AC810E67D;
	Tue, 24 Feb 2026 23:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FE//0Hh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4134610E668
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771974223; x=1803510223;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LGYQVV71byqDhn70KUQZxHCQ4+Yjxyk8KPL6wiWi78I=;
 b=FE//0Hh0Ch7R668Fxk8Qst6wsYzbi9iNYshlCFLa7hTKatcX7I/nQWe8
 b8kU/SesSbFy/d6zw4vWjXR6W2KWsSX91lp3HqksJaJGXNc1a77ad7bWv
 MH72wZ98hKuDGSSoGzWQYJiIYogAiLJGIJLvrsrktiO3+AzUL3MUz8z1s
 MkAeK2jWVpU2v8OtXe6FOQl9vpbSTrcqw6V5Jlb/ueiLcydusMhbA5cDL
 ZPHDNCrXZoky49bn31OONwLrkBu9MkFXhoQ2kmSnzSHMCO3iZAIRinfbC
 vl7L8CVcUQ80s/DBitKCcANdApaesrdc8r/q4NRtx3eeUmmVUf/jGW1a3 w==;
X-CSE-ConnectionGUID: Zc2jCSU4TlagRxXEN7/0Zg==
X-CSE-MsgGUID: yRfpNrMGSo6Bf52IgOww2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83717664"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="83717664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 15:03:43 -0800
X-CSE-ConnectionGUID: n8bM5tnhSTW2+bdeJWGzDQ==
X-CSE-MsgGUID: YH62+QkQQ0mpCAmyirmBMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="221044212"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 15:03:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 15:03:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 15:03:42 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.46)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 15:03:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN98YCJYlDKeWP8XVO2GGf6qhR9r+O6/BfpsTzgShkBD5UwEM+KM5MxMnUwaNeM4YtPY7AFhtwrAfniEx4CPQyRcU2Xa6IKE4A19k2Lw3XFl61/w1Jg43/OoyujbDGHYYTedhJYYaGZ3XgglpOJz2ddoX3KRw+QJZrMtALGbzBKT8hQC2v3n/Yex0AJlFIO0+f23WobrMxCTz51U8Ki14HvMYrdCTBN60ZcPc8mP7Re43m6Y1Ck/qgcxl7NOZnzBR7I0Em4FUmM1cwuBeuLZKITW/QgSvNDx4VWk4gqYkubEYq6Z04r1pO0wpr8kFWGj+S7nlibj7sCnZIl7vaj1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LoVhbJ9fCU3LcljFI8Yz1IZO+2KWg49ylXlmbV5VfI=;
 b=TB58uqPIeH2FUhE/uRl+zlEI67Sb8y+BZ1aZMaZjlD9/0+SV/Ah/fgqflrWU3FzjiWtyy4sisZse0ZSjPneLa1R42LiEm2tYkhAozmq/n/KTd1D6KMp77UwtVgI53MlGdCwS0qxy7q+0/ZCywPrGxNrGmlUbjYasg2lDRJCcqi92w1SeEnUmI7V2Cjxy/AnCSlNUJyzTc034OtKyXYt0xixDa87SQSBh5aZjSke6m/gN++7qw/b5hgATbEiOemf41i1Tgj18R8ExBf7bfAHKLq6iBQD1sGra7vbbcP1lqjfXmUoWG+dmUKjM+2m7jq31/FCc1vLou4MVlWQwSdkcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 23:03:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 23:03:39 +0000
Date: Tue, 24 Feb 2026 15:03:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Wang, X" <x.wang@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH v3] drm/xe: restrict multi-lrc to VCS/VECS engines
Message-ID: <aZ4uSB27jzyG9c+F@lstrano-desk.jf.intel.com>
References: <20260224023354.182306-1-x.wang@intel.com>
 <20260224220548.GL4694@mdroper-desk1.amr.corp.intel.com>
 <c42a6636-c639-4c4c-93a7-3755baf351bf@intel.com>
 <aZ4o4/T7BiPP3TeC@lstrano-desk.jf.intel.com>
 <c814ab36-0861-43c4-924e-4a6cdaa11376@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c814ab36-0861-43c4-924e-4a6cdaa11376@intel.com>
X-ClientProxiedBy: MW4PR04CA0285.namprd04.prod.outlook.com
 (2603:10b6:303:89::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 41493697-c271-4a6d-8c8d-08de73f8f2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OL+fPfPu1TQH1aiPsoSA9l3kh2p4fdSAfIpGL1AozOTnpCR/Yc0uLX3ObW?=
 =?iso-8859-1?Q?Hc/45ZdQdmmw94IdvGmIHhbBpK1/e8fij8gpLAiV3R3BtMgPqISvOrlAoY?=
 =?iso-8859-1?Q?Y/iEW/K5kRkRmbIn/bvoiBF2IJE3KjkhluEqrhhAv3fk2F//D2KttbDoRO?=
 =?iso-8859-1?Q?g0gD9w9QHRxlawtDQizeWoRkt31zv7xtKXQ98TVsm5i2H26W9OnRUaXgPy?=
 =?iso-8859-1?Q?oiKKfVmfv9Gq+j2RdFaAVhZ61RMSddZgS6B2Ax/QPHvBkv7kO/nRvHSDh1?=
 =?iso-8859-1?Q?puXWq87hiKK7f3+9nNCdQegUxsa7TRGaL3qANkkgfJUwruAdfSHvodyEx5?=
 =?iso-8859-1?Q?JrDSw9lTHLyY9MqjK/jYpVsj4IgR+Fq8X+wNDA7we9f+WGxrcVrivNqckU?=
 =?iso-8859-1?Q?ohDLoHPM9GRvzduKjXQMsz7txVp66djuSPnsRy45uu0wAtJ9jWgKN+UO+d?=
 =?iso-8859-1?Q?1xMw8mLd4/9QV8zYCW5MlNdU98SgejEAbh3MgrRrA6AE5aYoF6Vs6JQKfE?=
 =?iso-8859-1?Q?TDLStm5m9+4XB1WtY5m6pU/IP2riBI2fZc4M0agwvYntSehsNBK8vwEeYe?=
 =?iso-8859-1?Q?fz84C3UZHg5kRUy+OF8/183Cp6x7gPY5viDLqbbOXGR1dLcvZlFkTnSu0E?=
 =?iso-8859-1?Q?GFYbexh1NEWq10Rj4rRKKsh1FGz1ddLCF28e3RJKZAVb5d645SvDkGk2Ho?=
 =?iso-8859-1?Q?nm75iHaBXxQHe5B70VahOWpBzDS6KDOwAS3TkAYHN3F0oIMtn8TE9A+TLk?=
 =?iso-8859-1?Q?3f2EWipmJvFX6TzxqvXUFqaubINUwQBev8JxYP0ClUbkWM8OrxJtdTVpoy?=
 =?iso-8859-1?Q?9oD7QHadTtFeWuVzXpiuVXkiRYZgGk40oa/oxkgz0WC1FMSgux18cF+CE1?=
 =?iso-8859-1?Q?wESKifmuHFeIrgqTyGVMA2UfgVeFRrpze5e15ypQcp+kCkvPXmkRX1UFxL?=
 =?iso-8859-1?Q?qIMGCxnwMI8V/2JDR7S4DtzqQk/8mmWxca3SVOJ2WROl/Da+sRR0oPDc/+?=
 =?iso-8859-1?Q?sWbjyWBVjNO0Uofj48mUGniwe7XjOGXU8RBHRFqc2EII/3UU4wBLQ+jIIe?=
 =?iso-8859-1?Q?AOpo9pPCpBE6DooiIwusC+XKpFHjmOGvm694OsRUQ+tnjHIPGRsm6l+OQU?=
 =?iso-8859-1?Q?J0KHZh4RFX6I1cQzgPsFC9XLboKgNJmki00n9MsP0Qdbszb9zQ07VulPnr?=
 =?iso-8859-1?Q?w8FWU2ldho0v5l8RtERSFHkZQtugflxlVp2kTltBSETnEJjS7XlRH6vTnq?=
 =?iso-8859-1?Q?wqTJpyztBXsJpx+Fm9BFSVzE/3h8YNz9NzOOtgO/KyTqV91YmvxjyCR3es?=
 =?iso-8859-1?Q?Az4EpPHjTGHIn7lji5nIk1j+nEn5eBayN9l1wHL/d84nWek0npKPf8vJII?=
 =?iso-8859-1?Q?LmhKXPDz+637r/QsDr73sWui4Yu4fR/A7bm4ORcAFt02gammb3EtE+kN0R?=
 =?iso-8859-1?Q?fmt3knbJTxx+4VUClOTLTyL8Y2VXxWDP7jLuEV8qLLEAaCRxj8AqQQ/RIB?=
 =?iso-8859-1?Q?5Fqo5OixeVPQjWytp4kXe0fIomZT/OuQJOKwagvEq1z+TpYyCaH7w/G8wo?=
 =?iso-8859-1?Q?wiggOfVixjipHlwSBhkQLXHTkGhlT+1pBXl5pHLgKmMivLlH7J5iNf6taK?=
 =?iso-8859-1?Q?XvjnlPQpd313E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+3TTusbY0tR9VjEVUYAXvkjPvy41RdWPOYjksIqfz+JZuemz34ee+qfOZx?=
 =?iso-8859-1?Q?+FMAELxLpxVQAqppGSHiTFQlvNMpzRc4qEeHxSlSh16vMKWn9WqhyQTfWV?=
 =?iso-8859-1?Q?nxfZP1gQggAuWR9JPDh4KN9kutDcJj8+1IaSQVUa7bTcB0gQUDo13frkec?=
 =?iso-8859-1?Q?ilgphONcSriznpUmjjg8F4//uhGcIoM28b5AiEyh+vQV5ZHUmOm+JUO5ve?=
 =?iso-8859-1?Q?Wyzfa/9YVwacSqrnt9gFiRKGs5WAZjW92E3iJzm53sh8FIn+U36kJLSIjU?=
 =?iso-8859-1?Q?JmGs6ACcS9Cwtd+7qpkknyy933E59mR4VvFgji5CMn3CUda2CGeHYQQTIa?=
 =?iso-8859-1?Q?anFpySptYrQS4wf//PNJbjDjIzIa5PVZGSHUDpxw34IYnvHTaF4buTYADr?=
 =?iso-8859-1?Q?Ak8maRXOu8bq/Vnos4HcpOzBLcxcSSExviiPMUMea4gl85ouEEd2+2WuTZ?=
 =?iso-8859-1?Q?Qao4lpyxeRi5NGNh2oXBDWC0RAtEEJodbdMaCtDpoYyVk6liuIU4r7D/uy?=
 =?iso-8859-1?Q?K5xOSeAivg9rO8yZKhCaREu2hxBSjjzIdGCbVBkzbChBv/lpl75nLplydI?=
 =?iso-8859-1?Q?0pQf9UlC4BiIgRi8EFwwhortD/Z6urC0R9SyC1DZ+BdxVfm7n3VZhYsSdg?=
 =?iso-8859-1?Q?ISUQ/om3YDJ9SH/BqISizzKuwaw0WegRKgboDstTJ1hpQXerN+o5yrVpb/?=
 =?iso-8859-1?Q?+LtDzCR52z3/ZEgH906gozzA1OlcLhVo/NK1dheyC6MPZBwKtBzIVSMz5w?=
 =?iso-8859-1?Q?6yOms7+YEcGg9OWdeVO9phbcoQg7KX9Qsc7IpO946IV25vx4xIPq36ZDp/?=
 =?iso-8859-1?Q?37nf02xwXCyfT382071A0mVTmO7MUXEkJ48Fm8WVvw2nTNAoT632ETcjfe?=
 =?iso-8859-1?Q?jNTAnnaHr5Xtidhz4xxY0b4L/1WfN5xwSkV3Os8t/XK9YpqRMCzlz48uwF?=
 =?iso-8859-1?Q?JMSAm4WGuMf4SO37icIb0JN7YYv9N3n4b3c/BvpWtkMKVgWyIGg4RqEBW/?=
 =?iso-8859-1?Q?COO1l6/OG8yv/do5pPIP3qv5D5Qv0TmeucZ6qn3t2Z10D752Av0HfOrGBD?=
 =?iso-8859-1?Q?a1V5xO6Go8fVQYEstW7Aog/Lo9BEV2pyODwwV6od6juuvfoorY3zO1AwU0?=
 =?iso-8859-1?Q?3Q0eDf/JE5trgFtDwXpYVRKRtZSIGM9wMrcRlVsyKDtTNE6qPBuSoEzwKQ?=
 =?iso-8859-1?Q?/jOp6YDEmcy8rB2tKE6ZmSCpBu0KyW5ZPrTqR4AP0R4C7xglrazk2D6rFp?=
 =?iso-8859-1?Q?dzMJE4+rGOly9zNQICQsaURT/vTvpW5aWM7N/n3Mdl5ejbVUnvusJAg4nw?=
 =?iso-8859-1?Q?ZAxik75xYjvExZjt+/U1Zacx6q2b1Bj8UXBP9mD4bianDCpx3OwT/hegNh?=
 =?iso-8859-1?Q?mq6X9W7ng5rh5ObQDvZmQHff3utRGgy/pcHlnQuE5cIGshgTPOD9goBUUk?=
 =?iso-8859-1?Q?b2GIaZXEOJdndqaqV9crLwy6opFQ0WVP+6eusG2PcPnH2mRCaAcZ1489QW?=
 =?iso-8859-1?Q?pFVTqqNHv8gFYieRF5eSLFSXPk1RP/rwtfihWwc42bmPfdL94tDeb8ZpN/?=
 =?iso-8859-1?Q?dWi7zTzzC7u4GrOFD4DngVdzFd7F6O+i+bu483YugvnUQ9QfkOHgqcL1yh?=
 =?iso-8859-1?Q?w3majyKf2jQ+ngDghXr7wX7bBacY1LQSDoRTVmb2XBxGUg9Wf/tkQXGe9t?=
 =?iso-8859-1?Q?iVqejIVnh0PdnE4iakRAkU5Wa+5ntbEpv61yfpSHzF6Ke9dadv8/Y9OrC6?=
 =?iso-8859-1?Q?PfQ9BRskYtyjLKKAmNIRayFeQWitZHNYWAiaeqQQjq9yqaEn8IkN4kiwb9?=
 =?iso-8859-1?Q?+q4dm4QVRNXHbwypsaqvInOGQ0qNfaQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41493697-c271-4a6d-8c8d-08de73f8f2ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 23:03:39.6976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZF4U/2J+ucMo0EwzjyAmy9kkSyHBCGROXnJhvR3R6SPDSdLRDMHqTmqONDfHgDF8+DoLUjgqCkMLJfhhL3ljQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
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

On Tue, Feb 24, 2026 at 02:57:48PM -0800, Wang, X wrote:
> 
> On 2/24/2026 14:40, Matthew Brost wrote:
> > On Tue, Feb 24, 2026 at 02:20:33PM -0800, Wang, X wrote:
> > > On 2/24/2026 14:05, Matt Roper wrote:
> > > > On Mon, Feb 23, 2026 at 06:33:54PM -0800, Xin Wang wrote:
> > > > > Tighten uapi validation to restrict multi-lrc support to VIDEO_DECODE and
> > > > > VIDEO_ENHANCE engines only. This check should have been in place from the
> > > > > start, as the driver typically avoids allowing uapi cases that we have
> > > > > no userspace consumer for.
> > > > > 
> > > > > Additionally, the GuC firmware on ModSched platforms no longer supports
> > > > > multi-lrc on non-media engines.
> > > > > 
> > > > > V3:
> > > > >    - store a multi-lrc enable class mask in xe->info and populate from
> > > > >      xe_device_desc in xe_pci.c (Matthew Brost)
> > > > > 
> > > > > V2:
> > > > >    - correct the typo (Shuicheng)
> > > > >    - move the check earlier to avoid VM lookup (Shuicheng, Matt Roper)
> > > > >    - remove the graphics version check (Matt Roper)
> > > > >    - input more details in the commit info (Matt Roper)
> > > > > 
> > > > > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > > > >    drivers/gpu/drm/xe/xe_exec_queue.c   |  5 +++++
> > > > >    drivers/gpu/drm/xe/xe_pci.c          | 17 +++++++++++++++++
> > > > >    drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> > > > >    4 files changed, 25 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index 8f3ef836541e..caa8f34a6744 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -138,6 +138,8 @@ struct xe_device {
> > > > >    		u8 tile_count;
> > > > >    		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
> > > > >    		u8 max_gt_per_tile;
> > > > > +		/** @info.multi_lrc_mask: bitmask of engine classes which support multi-lrc */
> > > > > +		u8 multi_lrc_mask;
> > > > >    		/** @info.gt_count: Total number of GTs for entire device */
> > > > >    		u8 gt_count;
> > > > >    		/** @info.vm_max_level: Max VM level */
> > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > index 66d0e10ee2c4..5abb29454d1f 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > @@ -1184,6 +1184,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > > >    		if (XE_IOCTL_DBG(xe, !hwe))
> > > > >    			return -EINVAL;
> > > > > +		/* multi-lrc is only supported on select engine classes */
> > > > > +		if (XE_IOCTL_DBG(xe, args->width > 1 &&
> > > > > +				 !(xe->info.multi_lrc_mask & BIT(hwe->class))))
> > > > > +			return -EOPNOTSUPP;
> > > > > +
> > > > >    		vm = xe_vm_lookup(xef, args->vm_id);
> > > > >    		if (XE_IOCTL_DBG(xe, !vm))
> > > > >    			return -ENOENT;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > index e1f569235d8a..fe63387d4077 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > @@ -194,6 +194,7 @@ static const struct xe_device_desc tgl_desc = {
> > > > >    	.has_llc = true,
> > > > >    	.has_sriov = true,
> > > > >    	.max_gt_per_tile = 1,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > > > Is there a reason why some platforms list both VCS + VECS but others
> > > > only list VCS?  The new .multi_lrc_mask is intended to restrict usage to
> > > > just the engine type(s) where we have a real userspace consumer, and for
> > > > now I'd expect that to be the same across all current platforms.  We
> > Matt R beat me to this suggestion too, +1.
> > 
> > > > should double check whether the media driver is actively using this on
> > > > both media engine types or just one of them (I don't know off the top of
> > > > my head), and then set the mask accordingly.
> > > > 
> > > > An ioctl request for multi-LRC might also get rejected on a platform if
> > > > the engine fusing indicates that there aren't 2+ engines of the given
> > > > type, but that's an orthogonal check that's independent of the
> > > > multi_lrc_mask we're defining here.  Finding out how many engines
> > > > actually exist on a device is something that we can only find out at
> > > > runtime after reading the fuse registers for a specific device.
> > > > 
> > > > 
> > > > Matt
> > > I checked the specs and found that some devices have fewer than two VCS or
> > > VCES
> > > instances. In these cases, I don't think it's necessary to allow multi-LRC
> > > to
> > > those engines. This would prevent the injection of some illegal ioctl
> > > parameters.
> > See Matt's response above, we check in the IOCTL how many engines the
> > platform has, if it only has 1 the IOCTL will prevent multi-LRC queue
> > from being created.
> > 
> > So again, I'd just enable XE_ENGINE_CLASS_VIDEO_DECODE |
> > XE_ENGINE_CLASS_VIDEO_ENHANCE on platforms.
> > 
> > Matt
> This means we can enable the VCS/VECS multi-lrc on all platforms without
> considering the number of engines. I can create a macro definition and add
> it to all current platforms.
> 
> #define MULTI_LRC_MASK \
>         .multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) | \
> BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE)
> 
> My understanding is that the advantage of adding a mask for each platform
> is that if we need to support multi-LRC for more engines in the future,
> we can simply modify the platform's xe_device_desc without changing the
> code logic.

Correct. Most behavioral choices in our driver should be encoded in the
xe_pci.c descriptors, which propagate into xe->info, and then the core
driver logic operates on xe->info to decide the appropriate behavior as
needed.

Matt

> Xin
> > > Xin
> > > > >    	.require_force_probe = true,
> > > > >    	.va_bits = 48,
> > > > >    	.vm_max_level = 3,
> > > > > @@ -208,6 +209,7 @@ static const struct xe_device_desc rkl_desc = {
> > > > >    	.has_display = true,
> > > > >    	.has_llc = true,
> > > > >    	.max_gt_per_tile = 1,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > > > >    	.require_force_probe = true,
> > > > >    	.va_bits = 48,
> > > > >    	.vm_max_level = 3,
> > > > > @@ -225,6 +227,7 @@ static const struct xe_device_desc adl_s_desc = {
> > > > >    	.has_llc = true,
> > > > >    	.has_sriov = true,
> > > > >    	.max_gt_per_tile = 1,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > > > >    	.require_force_probe = true,
> > > > >    	.subplatforms = (const struct xe_subplatform_desc[]) {
> > > > >    		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> > > > > @@ -246,6 +249,7 @@ static const struct xe_device_desc adl_p_desc = {
> > > > >    	.has_llc = true,
> > > > >    	.has_sriov = true,
> > > > >    	.max_gt_per_tile = 1,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > > > >    	.require_force_probe = true,
> > > > >    	.subplatforms = (const struct xe_subplatform_desc[]) {
> > > > >    		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> > > > > @@ -283,6 +287,7 @@ static const struct xe_device_desc dg1_desc = {
> > > > >    	.has_gsc_nvm = 1,
> > > > >    	.has_heci_gscfi = 1,
> > > > >    	.max_gt_per_tile = 1,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > > > >    	.require_force_probe = true,
> > > > >    	.va_bits = 48,
> > > > >    	.vm_max_level = 3,
> > > > > @@ -313,6 +318,8 @@ static const struct xe_device_desc ats_m_desc = {
> > > > >    	.pre_gmdid_media_ip = &media_ip_xehpm,
> > > > >    	.dma_mask_size = 46,
> > > > >    	.max_gt_per_tile = 1,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > > > >    	.require_force_probe = true,
> > > > >    	DG2_FEATURES,
> > > > > @@ -325,6 +332,8 @@ static const struct xe_device_desc dg2_desc = {
> > > > >    	.pre_gmdid_media_ip = &media_ip_xehpm,
> > > > >    	.dma_mask_size = 46,
> > > > >    	.max_gt_per_tile = 1,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > > > >    	.require_force_probe = true,
> > > > >    	DG2_FEATURES,
> > > > > @@ -358,6 +367,7 @@ static const struct xe_device_desc mtl_desc = {
> > > > >    	.has_display = true,
> > > > >    	.has_pxp = true,
> > > > >    	.max_gt_per_tile = 2,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE),
> > > > >    	.va_bits = 48,
> > > > >    	.vm_max_level = 3,
> > > > >    };
> > > > > @@ -393,6 +403,8 @@ static const struct xe_device_desc bmg_desc = {
> > > > >    	.has_soc_remapper_telem = true,
> > > > >    	.has_sriov = true,
> > > > >    	.max_gt_per_tile = 2,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > > > >    	.needs_scratch = true,
> > > > >    	.subplatforms = (const struct xe_subplatform_desc[]) {
> > > > >    		{ XE_SUBPLATFORM_BATTLEMAGE_G21, "G21", bmg_g21_ids },
> > > > > @@ -445,6 +457,8 @@ static const struct xe_device_desc cri_desc = {
> > > > >    	.has_soc_remapper_telem = true,
> > > > >    	.has_sriov = true,
> > > > >    	.max_gt_per_tile = 2,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > > > >    	.require_force_probe = true,
> > > > >    	.va_bits = 57,
> > > > >    	.vm_max_level = 4,
> > > > > @@ -459,6 +473,8 @@ static const struct xe_device_desc nvlp_desc = {
> > > > >    	.has_page_reclaim_hw_assist = true,
> > > > >    	.has_pre_prod_wa = true,
> > > > >    	.max_gt_per_tile = 2,
> > > > > +	.multi_lrc_mask = BIT(XE_ENGINE_CLASS_VIDEO_DECODE) |
> > > > > +			  BIT(XE_ENGINE_CLASS_VIDEO_ENHANCE),
> > > > >    	.require_force_probe = true,
> > > > >    	.va_bits = 48,
> > > > >    	.vm_max_level = 4,
> > > > > @@ -746,6 +762,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > > > >    	xe->info.skip_pcode = desc->skip_pcode;
> > > > >    	xe->info.needs_scratch = desc->needs_scratch;
> > > > >    	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> > > > > +	xe->info.multi_lrc_mask = desc->multi_lrc_mask;
> > > > >    	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > > > >    				 xe_modparam.probe_display &&
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > index 470d31a1f0d6..47e8a1552c2b 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > @@ -30,6 +30,7 @@ struct xe_device_desc {
> > > > >    	u8 dma_mask_size;
> > > > >    	u8 max_remote_tiles:2;
> > > > >    	u8 max_gt_per_tile:2;
> > > > > +	u8 multi_lrc_mask;
> > > > >    	u8 va_bits;
> > > > >    	u8 vm_max_level;
> > > > >    	u8 vram_flags;
> > > > > -- 
> > > > > 2.43.0
> > > > > 
