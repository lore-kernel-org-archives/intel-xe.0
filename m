Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420F8EFB7E5
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 02:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D3210E486;
	Tue, 24 Feb 2026 02:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEAjVHCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB57110E48F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 02:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771900863; x=1803436863;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bpAgKejQ5MyYCAbGbnWzQMkgE4qihoNgYStRku7UUAE=;
 b=WEAjVHCqQ0FIidlMdG8QQprCqK0mFi7R7Y2IQoPh19ocuLWy8XerA6Bi
 DWibRUJwka+b6bAsyqcvxQQF3f2M1fwuGPz5Bluj+uVZuQaEUE/72Datp
 VJKxpR6rrPED3tIplIa+4XJndmHiQIJdJ+gceM9Bb7++6dDSqOd4kmDAo
 DvF66fIrP4PPtCpVbPjBZVxGIiQYOaCATuFREG8P0O//spp0jFGNBllB0
 zpNRksrEa7SMWCWthKtZrfUYVBVUoOtxZoPG21gDpitMl8PQC2c0PWoDj
 1lPpvwmX0hyuFUBO5OJJfVIfVX8gSafoflQUxZdMeY6D3Kp9lZ2BIelX5 A==;
X-CSE-ConnectionGUID: OI3GF0PITtGAyLf56iGYFg==
X-CSE-MsgGUID: 4szGpR7CRk+GkQO+lxhrVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83619783"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83619783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 18:41:02 -0800
X-CSE-ConnectionGUID: 9TcSzICARui6bqJpLjem5A==
X-CSE-MsgGUID: 51pQXbtvTo+J6IX52mIWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="253482726"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 18:41:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 18:41:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 18:41:01 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 18:41:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/8HK10rM9u9L7wtABP7SSfB4RSRYGxOFbJXOjkgd9dTQYawceTNeBi3yEDU6OLNCY2ZyuYC33wHv9qhyOlq/+Izqz1NqFkQJ/Qsc6ilsi7tBV/S8GGv0ag71KHgg8D3E0SHt16J38Yq+/4O2KdkxpK9T9KX43f1KaCJ4MPKLsow6LX40R5t7/ls1U6mj9agWGImkXPr6ki0RXxTB4OAddj1Q6zxA5Fw8WhWKNgVqK3wNG9OzxiasJSfoyXfY/yh0rKP1lpixHyi/zc1cNB3kDqkCHUrQN1EKjE0z1U73k7H1w5qSt3fbZ1RgmJjkK4sO7ucj0YNusvboidV9Q3u1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rkQ5bo6I6m68JYPcKCYliQSSsOk/dKbMin2k7oQg88=;
 b=FUAjGCai4E8c2S0wZ+0k8QxPZoTbf8E8reEx7fHp+E7cb8XE3ceFII/Pt9rQL6Czjb9CZG53cUfcTTFW2ChEQuy6OMs4FUezHfbFkFJ3WgjM8aRtr1IceAo8VhuFKwdRGmjkmHWjPhhqEMJg7sKBXkYqTBnibchNyGebQiQXBVGOF40WFVZX16WW/MEc5NMc/eHBbX5WK55zfy2iQNJ/PD1Df++gnakbFfy39zCHNOSDiIJqUQT3yeQIbCW/nlAndrKPMxBrEqW/jBKqL6P9Jx+mE5uCOT06LFzs8aAejyF7D6LMNfFQVgTxqAk5nNCjjnavJzA6EU9CWWQi8KLokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 02:40:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:40:58 +0000
Date: Mon, 23 Feb 2026 18:40:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <francois.dugast@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Move LRC seqno to system memory to avoid
 slow dGPU reads
Message-ID: <aZ0PtxpJ8na82TE0@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260218043319.809548-4-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR04CA0064.namprd04.prod.outlook.com
 (2603:10b6:303:6b::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9a1322-0668-4a87-ba28-08de734e23f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?g1kR90QWAq+taI39sVbLrFUEheICfs07RARuhpng75Nfg3z+oXHy2zH5qv?=
 =?iso-8859-1?Q?X4n4hUmWse3JS6uJNoQ5I/gCSC6b+99g9hpyUALCFfFiJyAWuAf4DQznGL?=
 =?iso-8859-1?Q?MeGpBL6WkVPdtaDYmJBKrUyFxVUwEyxEgTZQAWPEmPTeLqa+3RBHuu/ZJI?=
 =?iso-8859-1?Q?zDNxzIizg0lCSuwEZT18xvFq7WqtazhQxOIsvxCwEuzPJQs6vUZ8uBBiFG?=
 =?iso-8859-1?Q?zEf679lRGfC1ac8iA88XeZOr2aF9IIcnkU8jEF2GQC6I0BEKHlwAdOA38L?=
 =?iso-8859-1?Q?0qJQnhGYHgtwPkPI9Jr1+pQhXarNwqbdyRKiWqUXLhwPk07cVO0oInKfpE?=
 =?iso-8859-1?Q?iuYBt2lxuJCz1/4vDN+GQbRyJbllsmjweNAg4uFzUBC1JxOHve2iQtcP4A?=
 =?iso-8859-1?Q?u6vLaljdjwpFZoj4bGUtR19FckJtlfefOAjiXts6hMAFztmB2tpFR52QyK?=
 =?iso-8859-1?Q?U9QW9apoRNrtjn8k6PzUmmTQylTKoTZlhkpBefZs4fqKC1avT5zaexY2g7?=
 =?iso-8859-1?Q?wBouQ/kFET4HKGB3Bfc/1Kna+M8kI/wMefE6HrrHaw9JcfcU+F0m2tbx75?=
 =?iso-8859-1?Q?qipEytLzc/c/WC8w7oF/PXGzfr4fqJ7jLAM6qI/fzX0f6GEpeVSlkANWdS?=
 =?iso-8859-1?Q?PAo7Zl6hatfoYRJ/NOyrOCSH/0ppWVKJN8F3BMoHZCkjHTZw2YEr9zgk0Y?=
 =?iso-8859-1?Q?iffS0QhcxSmT2sN9xWv8sx/wnFTi48bTCvf/DFRWmMmqZKVS/Td8kIoAmJ?=
 =?iso-8859-1?Q?Stj9WzqE3rZHlJzeGr5is3ZFrDdy7ftixcO45Msu6p/cBtHqBp9eT8V4kd?=
 =?iso-8859-1?Q?vujumo5NvovxL19AVVyB3RovqjbmbYk03BJ0zaHzmXOG8n+/CtBG1bPd0c?=
 =?iso-8859-1?Q?7NTbk65atV+SuF0w/O3iU2qAsYFq9FsYMp+6tUOfr/LoEjXNpqrKkBqeM2?=
 =?iso-8859-1?Q?wWgbBQqs63DAGfLV3PIyTIW+qsutuovJhz+fb+VEErFbKuv3dJwswvx3i0?=
 =?iso-8859-1?Q?5ISVxOfuW/EGsdJxjau7LykAwl3iQXERLNMFYY2spkaCo8wwjccQao8mJ9?=
 =?iso-8859-1?Q?RqM4U04XuZCJ2yaVt0FqZ0VWmJZ5QFV3prYgFTXYTu8PZoFesQskqlajkn?=
 =?iso-8859-1?Q?x8VRwDPZrFB9lA1oMu0ZNkmrBuTF8++VNC7QoFEIiZxKpYHFkt3VBd77xz?=
 =?iso-8859-1?Q?l9DZRDLuBUyiw7HJnGHble9A3+/1TVQfKODZh99BC8KDUQl+Awr8R21hAw?=
 =?iso-8859-1?Q?XGbN31gMUQEk6zw6eQZiop9Lgsr6hRaqpdHy4PgHcUJphOF3TncPYQYOa4?=
 =?iso-8859-1?Q?1r26SlyxKDNgwu8FXHNl/SVmAkhGqwXfJo8D3pMGc93831MDElI69071IX?=
 =?iso-8859-1?Q?JE346psDEz4qmNHi/SsaD8y8a+XfWRQguiyezal+WseGY+C1io7GlFsDP7?=
 =?iso-8859-1?Q?sDbgzN6eg6UQirhpFukCZmF7JZmxWp7ZNUVYrAE3jqv7wYb3Q0NF4WcKRs?=
 =?iso-8859-1?Q?5avdnEDiXySFzXk8sWrgcMN1cxkpe/l4AtBxlvlYUz6cYhjsplitPpCuqx?=
 =?iso-8859-1?Q?aLcUNzsqs3BWrq2+f2N2rxSS+eR7Qr2xArkZxnBRJr4pgue1gq5H3+vAis?=
 =?iso-8859-1?Q?RhoDV3zr176r8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2yVvc0sg6gGKz32b6Lj5tr18UMnZjJlhvLdhG4Q0s5WhPbg4xZ+Fx+oBuF?=
 =?iso-8859-1?Q?ht36igOhuVns1GYy/Ho3rzijFU6wDj/ZeFuj8oDvAJUMJrGi11td5YT8Kn?=
 =?iso-8859-1?Q?hMOsOOQ3No5H6HLi5TgnctTS+15Bo1P8U6xQuAoic1UJJNm8Pb448ejqOc?=
 =?iso-8859-1?Q?fja7TvpWQeHKv6sZS5HyRmKxLYeE8P8x7nQ9Jk89MCHx3XUDwaT77wDqrb?=
 =?iso-8859-1?Q?8m8Y0RdGU+tnapb2Iu+/toq3D3dK6j6c7DHxiO/jwkeSgmSOjYQrzK/Bb9?=
 =?iso-8859-1?Q?DOHtEQBOJzRWTiU/Nxs5+JjZnnOfdDSLSGLmVncaZAhPW0AF4XEGBM2IFd?=
 =?iso-8859-1?Q?/1bA8SfP16o2p8nnG8GsE0XScA1PDtSEtMtYjQVutVarhimjnc6gxCtENO?=
 =?iso-8859-1?Q?z5CVWsoPCfJZzgybToMvXnOnBPKu+SLZ6BGzRSHPHGEKTKII3efPWufaLd?=
 =?iso-8859-1?Q?JWwBHvLGyJpDSUY9XyusQXM5OBGPjxtAXCQqBNarjWCeWkwi5rG4WcTDGo?=
 =?iso-8859-1?Q?BVaQaxQRm0WjtdgBKAbgklz2XFb6a5rcg5xZlYJZ2lxJiuk9f/TmmJd0yD?=
 =?iso-8859-1?Q?FzcYG1sMXMkvCQEtEsDwtgudUhJHp+CWF8EftwvgnHB863z8XAbgwyJqpH?=
 =?iso-8859-1?Q?lPp73sM8ameIFB1O2SXHyV63iFzLetEYtue44rMSfHTYDtVerayMZtyihI?=
 =?iso-8859-1?Q?CTS85kaCoSoCzOaMbJX/kmiV9aAt6Wc1bI+JsfKw+y/Ey7vQ/COiBMq9Xr?=
 =?iso-8859-1?Q?hi4eU3SNrwvCh+RO3Tsitk48LmuDF0nxcTsSr2L2fC/Kwlkatnmf3PCjrG?=
 =?iso-8859-1?Q?+398SzC2LHpJirvfBlWlOb188q6MXG7n4PdYxVwYZfAoL4ZQrlfhjr72R4?=
 =?iso-8859-1?Q?/y4QyjArNu2aYnogNn/xoHjgN5+YxB/YhVvpCCBGi/3gqMOmruMB7ZPauv?=
 =?iso-8859-1?Q?lm7FKGHtx3bb5OSgmlCp06WV9a2TQw4ZtZ+SBTkW7tPuBtQ6abu336nG6M?=
 =?iso-8859-1?Q?O7ffwXBDreKkk6AgIkJavj+d4ZhVFQ3Eqy55JyAhBR1LOOjs4DbYA8cHZs?=
 =?iso-8859-1?Q?/qXzFRrXqXmGbkhGTz2Q1r47paEnJFW81MqEGT1i1O5o6QBr4M/0cWaXUp?=
 =?iso-8859-1?Q?n2QKUgGPiw/QAEklqltn+XC0sxMFU/pQkb/lk1HeAFdnc8/6wBBafiUwBf?=
 =?iso-8859-1?Q?nXIEAppOMBah8DsViG1wY/x8xr8ScOUuW4yyP1erNQQReOGNRskt8/sL/i?=
 =?iso-8859-1?Q?9eiFcXyCIWko+5X7Xjsby4OVNEXjJhlc7K0DGwaGbX/tontPJGY1sHWIMc?=
 =?iso-8859-1?Q?FsAE88Wh/tvp2r8u3dnJV8vUV29DeJRL4nzE8b8CP2iMxioGNXOn6S9Al0?=
 =?iso-8859-1?Q?0z9YU3C9dwqKejWbecqIGLF4yP30z7akcNV7D0T6xmA7BlO39UeTkc8uRx?=
 =?iso-8859-1?Q?2c7KK2vOAfJPjbtpm0Kj8Qb7VnjIMEwUyjszWTcjacIwkHYDWiqZmlgn8o?=
 =?iso-8859-1?Q?3GBD8eFl+8hDnAsYNV2Etm6N9DwgL2wpdwmutMQyIirsafdsqmgKTL6+dy?=
 =?iso-8859-1?Q?S97sXTU7iIOHnzSq7L3yWMPaWGx5S27mbVlN7Vw6HtI2fXOxcMEvZ4f52j?=
 =?iso-8859-1?Q?bXwbiXcwKHiNr0fc2F1xws6XeDrMSknmWoOu8sGwWebIJGBzfPQQGOZ9SC?=
 =?iso-8859-1?Q?On9/vfdoztJuhbUfIUgeGHvMDzlQIWit2eLyVg7Di4h5btShYDKe3b+Z4t?=
 =?iso-8859-1?Q?ITqAaNfFYUgsQQU3dK6ug2aWVfg/15rdY85JmqwuGu3KgxvbhBTBJxPVyc?=
 =?iso-8859-1?Q?GnakwIi1IzHfNCpjAJn34tRoqHtY5lM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9a1322-0668-4a87-ba28-08de734e23f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:40:58.2469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DevxSZPFuv3zcNNBpm2SyYPf2JkR7+vqLf05xHQcSM9j1miqbosJcNvcfYPKBqfUgt384MzTJx+R9FrRoVRAJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
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

On Tue, Feb 17, 2026 at 08:33:19PM -0800, Matthew Brost wrote:
> The LRC seqno is read by the CPU in the fence signaling path. On dGPU
> that read can turn into a PCIe transaction when the seqno lives in the
> main LRC BO, making the hot-path poll/peek much more expensive.
> 
> Allocate a small dedicated seqno BO in system memory and map the seqno
> and start_seqno fields from there instead. The GPU still updates the
> values, but CPU reads stay in cached system memory and avoid PCIe read
> latency.
> 
> Update the LRC map/address helpers to accept a BO expression and use the
> new lrc->seqno_bo for seqno mappings. Unpin/unmap seqno_bo during
> teardown.
> 

I measured the fence latency, and it looks like fences in system memory
signal roughly 1.5µs faster than those in VRAM on BMG in a test case
with exactly one fence in the fence IRQ list per iteration.

Matt

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c       | 57 +++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_lrc_types.h |  6 ++++
>  2 files changed, 42 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 38f648b98868..d72146313424 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -715,12 +715,13 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define __xe_lrc_pphwsp_offset xe_lrc_pphwsp_offset
>  #define __xe_lrc_regs_offset xe_lrc_regs_offset
>  
> -#define LRC_SEQNO_PPHWSP_OFFSET 512
> -#define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> -#define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> +#define LRC_CTX_JOB_TIMESTAMP_OFFSET 512
>  #define LRC_ENGINE_ID_PPHWSP_OFFSET 1024
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>  
> +#define LRC_SEQNO_OFFSET 0
> +#define LRC_START_SEQNO_OFFSET (LRC_SEQNO_OFFSET + 8)
> +
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>  {
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_PPHWSP_SIZE;
> @@ -747,14 +748,12 @@ size_t xe_lrc_skip_size(struct xe_device *xe)
>  
>  static inline u32 __xe_lrc_seqno_offset(struct xe_lrc *lrc)
>  {
> -	/* The seqno is stored in the driver-defined portion of PPHWSP */
> -	return xe_lrc_pphwsp_offset(lrc) + LRC_SEQNO_PPHWSP_OFFSET;
> +	return LRC_SEQNO_OFFSET;
>  }
>  
>  static inline u32 __xe_lrc_start_seqno_offset(struct xe_lrc *lrc)
>  {
> -	/* The start seqno is stored in the driver-defined portion of PPHWSP */
> -	return xe_lrc_pphwsp_offset(lrc) + LRC_START_SEQNO_PPHWSP_OFFSET;
> +	return LRC_START_SEQNO_OFFSET;
>  }
>  
>  static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> @@ -805,10 +804,11 @@ static inline u32 __xe_lrc_wa_bb_offset(struct xe_lrc *lrc)
>  	return xe_bo_size(lrc->bo) - LRC_WA_BB_SIZE;
>  }
>  
> -#define DECL_MAP_ADDR_HELPERS(elem) \
> +#define DECL_MAP_ADDR_HELPERS(elem, bo_expr) \
>  static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
>  { \
> -	struct iosys_map map = lrc->bo->vmap; \
> +	struct xe_bo *bo = (bo_expr); \
> +	struct iosys_map map = bo->vmap; \
>  \
>  	xe_assert(lrc_to_xe(lrc), !iosys_map_is_null(&map));  \
>  	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
> @@ -816,20 +816,22 @@ static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
>  } \
>  static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
>  { \
> -	return xe_bo_ggtt_addr(lrc->bo) + __xe_lrc_##elem##_offset(lrc); \
> +	struct xe_bo *bo = (bo_expr); \
> +\
> +	return xe_bo_ggtt_addr(bo) + __xe_lrc_##elem##_offset(lrc); \
>  } \
>  
> -DECL_MAP_ADDR_HELPERS(ring)
> -DECL_MAP_ADDR_HELPERS(pphwsp)
> -DECL_MAP_ADDR_HELPERS(seqno)
> -DECL_MAP_ADDR_HELPERS(regs)
> -DECL_MAP_ADDR_HELPERS(start_seqno)
> -DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> -DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> -DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> -DECL_MAP_ADDR_HELPERS(parallel)
> -DECL_MAP_ADDR_HELPERS(indirect_ring)
> -DECL_MAP_ADDR_HELPERS(engine_id)
> +DECL_MAP_ADDR_HELPERS(ring, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(pphwsp, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(seqno, lrc->seqno_bo)
> +DECL_MAP_ADDR_HELPERS(regs, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(start_seqno, lrc->seqno_bo)
> +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(ctx_timestamp, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(parallel, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(indirect_ring, lrc->bo)
> +DECL_MAP_ADDR_HELPERS(engine_id, lrc->bo)
>  
>  #undef DECL_MAP_ADDR_HELPERS
>  
> @@ -1036,6 +1038,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
>  {
>  	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>  	xe_bo_unpin_map_no_vm(lrc->bo);
> +	xe_bo_unpin_map_no_vm(lrc->seqno_bo);
>  }
>  
>  /*
> @@ -1445,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	u32 bo_size = ring_size + lrc_size + LRC_WA_BB_SIZE;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_bo *seqno_bo;
>  	struct iosys_map map;
>  	u32 arb_enable;
>  	u32 bo_flags;
> @@ -1479,6 +1483,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	if (IS_ERR(lrc->bo))
>  		return PTR_ERR(lrc->bo);
>  
> +	seqno_bo = xe_bo_create_pin_map_novm(xe, tile, PAGE_SIZE,
> +					     ttm_bo_type_kernel,
> +					     XE_BO_FLAG_GGTT |
> +					     XE_BO_FLAG_GGTT_INVALIDATE |
> +					     XE_BO_FLAG_SYSTEM, false);
> +	if (IS_ERR(seqno_bo)) {
> +		err = PTR_ERR(lrc->bo);
> +		goto err_lrc_finish;
> +	}
> +	lrc->seqno_bo = seqno_bo;
> +
>  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>  			     hwe->fence_irq, hwe->name);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index a4373d280c39..5a718f759ed6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -22,6 +22,12 @@ struct xe_lrc {
>  	 */
>  	struct xe_bo *bo;
>  
> +	/**
> +	 * @seqno_bo: Buffer object (memory) for seqno numbers. Always in system
> +	 * memory as this a CPU read, GPU write path object.
> +	 */
> +	struct xe_bo *seqno_bo;
> +
>  	/** @size: size of the lrc and optional indirect ring state */
>  	u32 size;
>  
> -- 
> 2.34.1
> 
