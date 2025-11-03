Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08971CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 22:06:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B699910E4B2;
	Mon,  3 Nov 2025 22:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJ1zaX0l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6803C10E4B8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 22:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762207564; x=1793743564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pV4EZcwcUba5kSTWMKOZd7MKMYlJ7diDOc8xVQntLV8=;
 b=oJ1zaX0lPF7HVCdxh6cHK39796M7A+6+BqtP5e5hg3EQ4sTPK23dR3SP
 xaWgIWEzQHoFY/Tml64UhCM5ZMb5iVYbzDiqkrxg5RJ62fFSHYavb449D
 RfQbDrDcvkqDfGMCCxAWMQsWCJtbqhn44Y+BpI05yRiR7JNrRVnnGg35E
 t5RaRCoVifEP+P4yxQREr49QfjKcH/SiNCKAI5w75NkvXcvDZY+ixSCV4
 x/hFbAnL843+OcIiWqlNiIaY7hj9NneXIy+X2JxqRpd6Tv02ARlG3Bn7e
 TJrtOJ7k0b/NqVED/h8l6JRPblaY5YlS26I0PSu2nHP21iRi2Bd8SVK53 A==;
X-CSE-ConnectionGUID: NAaCVpQ1TvmQH08aolBaYg==
X-CSE-MsgGUID: VtdF86BITpil+3p9CjM1PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74897603"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="74897603"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:06:04 -0800
X-CSE-ConnectionGUID: rciCnSGnSH6MnDKP+L4VCA==
X-CSE-MsgGUID: t+X4azqhTnGvlzJfy9T3RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="191073647"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 14:06:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:06:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 14:06:03 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 14:06:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkukVRNBpt6D95SWglZ0ExFu37g7C8cOSJl98c3axufuFHzwfcaABjWv9e4OMvjh5JWIMAYs2TdZrlMmVYbdZXr1iZZf7ExvMoWxUa4BQ71e8fCLjQocDNQLD5qFPeFctRG6mo7jXCq1jIkqMsC7XKogmvC1cm5C9i2hFW0oKS2fzyTKxz2yrxd1itS51Ll/hPaK4Kpmp43Axp00qQ4RPT9kuOqJIFb7B31gyfL7uUOQvN0Tg3vGfr2yWlK+rzAgvPWTcmNmoI/6HXj5pi6Jev571AdH92TgrnEdNGuaklNhlISwYKD58y/8Y8yQKAynm9FNqeeMWrpPXTN39UkpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lea7abosiL6S0GfNU+fvHh91nmaxHELnFtZryGb5GS4=;
 b=TXsXz33LKW5em29LP6y8gEAzzcbejnGx3CItLfhwhgQ4SiNPMaFk1ml7KUIoeCaN6sCKw/++NFzoROh4fkwp9mrk3xRdMwkrV6VRC+Np4MTh7xISxgTeBotTyi0japMw8IJ9S14MvXYeCQljmkhQ8Ns4IhQjkPcB8dnAMUqL9hjRo38qk4/X1tX6Qe9onGK3bg+/ZNlJaaT0hzBYLo6Snsh9kjExVuhiPLqxZSW6c5LUEOpSePCrQjzNtwgvQfJN8S35rAKXxh3XNNYZ7vryr+qiLSU3q3sfVrH4oGlzW7ZPxEw44Mj7zT2Tla5r+hrNKUaOS97iM4AYLMW68V5+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7047.namprd11.prod.outlook.com (2603:10b6:510:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 22:05:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 22:05:56 +0000
Date: Mon, 3 Nov 2025 14:05:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 13/16] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <aQknQYvam2TBQIpf@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-14-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251031182936.1882062-14-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e3a723-3fc8-479c-0a3a-08de1b25297f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GHa7spiOCXl83wfTEJBlosQL0GqLjMuW7yva+56AZvWw4RITjRhN3Xz6Idiv?=
 =?us-ascii?Q?fOCpmyFRM6+p0tEdOEym3TncnDjayFYJWVXuVo0pfDqXDfWZHOj+M4jiao3M?=
 =?us-ascii?Q?SyjcJzJhwMQ81q8myxAxFMteaciW2ex5Y6RyZcTkHcbsKXFUataYpV8oxELg?=
 =?us-ascii?Q?Yk6NP/eHsyeyFMYqzwScfbDDgGcbR6LOc1Zxenoucfx9veVrZA2RRm1Qy/TP?=
 =?us-ascii?Q?Cm14UYK5gwAtqrfQf0djj0XDmLegT//d0PKmVE1jOM5b0MJji/Ty4n9QiKjF?=
 =?us-ascii?Q?7vbW4xD3DS3DuoUhQdRQtAFrwLGXsqORd0c5GjdyoB+0xe7ij1mZ3D5tPCCP?=
 =?us-ascii?Q?Ej59mRn1CNc/Novg2FXJB+JojBJ1/TIDjU5216QOjlPaIHxiXp1MZKbanog8?=
 =?us-ascii?Q?J9JzTeTmM7vDv5LShX3Ce+XTbulKync4UYmWh+b6cwc8twc6p5arfvdZ0O2s?=
 =?us-ascii?Q?v+S9KEc6uXzib3HXOfe1FXpRs6hIPB/1zICCwH1n+fwB00dzwP9d+QOVz2pi?=
 =?us-ascii?Q?U29o49Ly9nDzgTOKUlITmME2xUloh8UjwuMqd3zPQ2r/KUKYMRMafTtGQAJd?=
 =?us-ascii?Q?hJE/FoprFw4DOkms/V+pwYTfY1J+43wURE6nc4WM2cHLMqdy5O/C3Bb01RV9?=
 =?us-ascii?Q?fBbJaoa5OEBZ5GFxzp0XYjaqnRSS/TpCxoACbHxGPEyU1hIdt66TEPbjxH5H?=
 =?us-ascii?Q?f5nuuU4kIG9z+Mifnzw6X20z7OwIWRRxTs6wlPqzF4tt6jy/ez0b4sSLIWPL?=
 =?us-ascii?Q?1mjsueDI4ZpW1kRwSJK3BGPt8GPBArmqC0OptV4FaAPnXwNlwFFA3IhFTWv2?=
 =?us-ascii?Q?pRtP9B16n60bLIkjuhldNTPWOP0QHNxTQ+a/Ed0lmx9Dd36YrfqPbKDDfWbv?=
 =?us-ascii?Q?AAaoJ4fKtBCIsoTVhclA5SflfcQYNEuJZ3l8kMpmK5vVeiYb94gOVFeXhyA4?=
 =?us-ascii?Q?O0dWkb4eZ13SRriGAdqd7biKhzJX+5/1BQD1ulTg/zade62WhNW1BWMbBY0H?=
 =?us-ascii?Q?lBprdLej+KrUchoUUEi/xkZRhaowzp9DBAWoDEzvYhadVtDTon5eULlQdpTc?=
 =?us-ascii?Q?35+9U7k9AQG9aRuiO6LTVB4R4wFt3F9MXVFZdaJbwWZ4NFa7nbXWlOzliLU5?=
 =?us-ascii?Q?u9tuUD3tyGvsvwYWHDU1ukVbHYKAo+euurRcucr3nL0XipX6xg5BF6mMLcwX?=
 =?us-ascii?Q?YlHhusORX2tURLGyrZTRT9kebvKZ9jtM0/v7Yl2902qHNV2Af6LOUeyrnNlW?=
 =?us-ascii?Q?YBEUB8jLND1srr3+Dbiu7YdMKsennKvxKf5ZgAX7HsQOdoQdYEshpBhnoz3v?=
 =?us-ascii?Q?xA/eHdPGy19Bw8w/95s1x/+tml/0bGObNnUki9/F3s5de3sntmDh9iK7Afle?=
 =?us-ascii?Q?SgounxVDDVMc7RE9IAuKjerW4oethKjydUVjfx9/JYa8O0XwCe0Z4qFa90S/?=
 =?us-ascii?Q?Cyhx3Ao7yb3KZwb32OhtS/+q7xUHiju6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6WqcjVB9maprrSDQy6hcyRgTGBAb0Pzn3EdAE8oz+8DjaKB27wbrq1gFRSoT?=
 =?us-ascii?Q?HOQEA5eBHYpgtQgkPDGMCVLjMLQyuZWDM0ePs9mWk/eZmQ/8R/iJ/sQIRBtl?=
 =?us-ascii?Q?c/tM4EYJ/tWymc245VjcAJsiSLwb2NkL0eeF71BM0N9TuHvlQnoksN78JbRp?=
 =?us-ascii?Q?YWi4vf1kyV2s4rQB9czUviMVc16xDKp+WhL/Vcict5Svn81GOn1vnaK8a6qA?=
 =?us-ascii?Q?WERUV2xY29MP83E6D6twBUfTjtohT1rB8DZVpuiQiervjidziCB5zkdq7zw2?=
 =?us-ascii?Q?V5ED1amAX8BO/Nlx3w5PwZpJSJaDkd9SwmSNZaHTr7s6UnF5KJpSk8KZIrtM?=
 =?us-ascii?Q?YzlqcdWyYc6RtC+9fgfJL22Duvggg/mUArxf6OI6Xty1lCeHcoWz9K8kABZd?=
 =?us-ascii?Q?RDMpCNOWlMY3UZo45fv5YhH3zts6vzlpDa4/YV1efBpztRCxdTQvJ7Z1WvYn?=
 =?us-ascii?Q?y7D3A75YTxvNjijSCnhn2yR7ebxmrJ6NDV6F+iBApmj7zonIuC+VdfeyNRr8?=
 =?us-ascii?Q?jg8b+s7aSWUO+QhL3nHJQFaxMu1hq75c4qMrd3Ri7Wz4b35z12eiTX10Hvfy?=
 =?us-ascii?Q?Yf0SwpVQX6mm8U/p8d7Pub8EJXfJQjTdOV+ury3ozCnNIKgttgJ1MEyT7vEr?=
 =?us-ascii?Q?1QhoXfSLCe7BJONO7uJYqE/FHHEpdJhjq5eI5Dw2wGrKSiBfWmJSPDU3pQ0o?=
 =?us-ascii?Q?nm+OXMMDXLE6pUfRDZNs+Y4CefHMsS3rZnqXecGqv5btPnY1CMOYa+rcu1gv?=
 =?us-ascii?Q?cs7G/9BHoSag7zwZKkt3A6aLxeOAhozowrOg6jiOHzk11jPPtzDPXv+bQdCW?=
 =?us-ascii?Q?g9teaBr98qE8HoRVaXyU62Ao2k/5S9blMYT7ETaV5vA4F1J8L9u0Zp+Vmi5B?=
 =?us-ascii?Q?Rji9FasJuLr3I2TNsGbyq9pZWbS22pT8Idc/fgNG86Q8g34GiDftMO+F2jvZ?=
 =?us-ascii?Q?1x/F/B2UlokiPT/bActCksaIPJ4555c7OJGPEghZ0QyyeuV5/DHijqWNtW3o?=
 =?us-ascii?Q?2b5gXS9cpyxCuSJFHiKXqMR4aWE9hsq5bzFQE2WzI+GqNnHv4cXomqb0bB0z?=
 =?us-ascii?Q?W2LhTKjGatzoHttaCconFJsMIFhaLP7fPoWx8MV0ue/+RBbG2JtZK4wBkKcP?=
 =?us-ascii?Q?zt9HQryMdgCs/HM4h1LmLgn6lYLgTqBJDM0KQnELX3esy5pC4YJ7Gj80TGth?=
 =?us-ascii?Q?FmQHfJE9rPr29UGaVzMZFdUJJu5gjRJ4hc+srfjiT3jIJxrnSZDe+Jm/0FM7?=
 =?us-ascii?Q?XGj8XX1q2l+YY59+nKa4xkOG6HN6u2vxWLTL8pHjNTvwqW0J7rCNqqZD/38f?=
 =?us-ascii?Q?BZeemG/DgMOR7kFUJLrBD+RXt/n8ObG92m9tcAFLcOkC8poDaoi6AwuEmr3z?=
 =?us-ascii?Q?kJtjclQq2psy6v5i29x9SKoirPGB1jVdvf/SMGGcHnlBF6PUjlyzYFoiLbhH?=
 =?us-ascii?Q?LdXeIY0p1GWbsN6Y5GkomQyJZoLyyq1edi+rOd6+HQ8A8qVRUNJ4ynI2I98J?=
 =?us-ascii?Q?xUhfo3mWW04bq0zqvBln0465C9ELNTE7K+cUjEmW221Ibzst9Fi/OQaNs93a?=
 =?us-ascii?Q?hej0LlEQwm5f+B02tGlobjPRV3cV/h7GsjqZO61UuWqIB5XUp8TsBMZPoGYm?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e3a723-3fc8-479c-0a3a-08de1b25297f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 22:05:55.9973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYqDcYfcoM6w/SadxdCfZAqrV7EIrXDLexu1ULmku98DzxAdXifHz+oxDrKo4FbsG19N1kgSMx7k6ovYwhvS6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7047
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

On Fri, Oct 31, 2025 at 11:29:33AM -0700, Niranjana Vishwanathapura wrote:
> Add support to keep the group active after the primary queue is
> destroyed. Instead of killing the primary queue during exec_queue
> destroy ioctl, kill it when all the secondary queues of the group
> are killed.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c           |  7 ++-
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
>  include/uapi/drm/xe_drm.h                |  5 +++
>  5 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0b496676527a..708a17c357e6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -176,7 +176,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> -		xe_exec_queue_kill(q);
> +
> +		if (xe_exec_queue_is_multi_queue_primary(q))
> +			xe_exec_queue_group_kill_put(q->multi_queue.group);
> +		else
> +			xe_exec_queue_kill(q);
> +
>  		xe_exec_queue_put(q);
>  	}
>  	xa_for_each(&xef->vm.xa, idx, vm)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 3c1bb4f10fd5..d7b0173691c1 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -405,6 +405,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  }
>  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>  
> +static void xe_exec_queue_group_kill(struct kref *ref)
> +{
> +	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
> +							 kill_refcount);
> +	xe_exec_queue_kill(group->primary);
> +}
> +
> +static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
> +{
> +	kref_get(&group->kill_refcount);
> +}
> +
> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
> +{
> +	if (!group)
> +		return;
> +
> +	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
> +}
> +
>  void xe_exec_queue_destroy(struct kref *ref)
>  {
>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
> @@ -607,6 +627,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  	group->primary = q;
>  	group->cgp_bo = bo;
>  	INIT_LIST_HEAD(&group->list);
> +	kref_init(&group->kill_refcount);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>  	mutex_init(&group->lock);
>  	mutex_init(&group->list_lock);
> @@ -675,6 +696,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>  	q->multi_queue.pos = pos;
>  	mutex_unlock(&group->lock);
>  
> +	if (group->primary->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_get(group);
> +		q->multi_queue.keep_active = true;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -691,6 +717,11 @@ static void xe_exec_queue_group_delete(struct xe_exec_queue *q)
>  	if (lrc)
>  		xe_lrc_put(lrc);
>  	mutex_unlock(&group->lock);
> +
> +	if (q->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_put(group);
> +		q->multi_queue.keep_active = false;
> +	}
>  }
>  
>  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> @@ -709,12 +740,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>  		return -EINVAL;
>  
>  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> -		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
> +		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
> +					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
> +			return -EINVAL;
> +
> +		/*
> +		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
> +		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
> +		 */
> +		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
> +				 xe_vm_in_preempt_fence_mode(q->vm)))
>  			return -EINVAL;
>  
>  		q->multi_queue.valid = true;
>  		q->multi_queue.is_primary = true;
>  		q->multi_queue.pos = 0;
> +		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
> +			q->multi_queue.keep_active = true;
> +
>  		return 0;
>  	}
>  
> @@ -1254,6 +1297,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  
>  	q->ops->kill(q);
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
> +
> +	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
> +		q->multi_queue.keep_active = false;
> +	}

This looks a little odd. Either you don't need to clear
multi_queue.keep_active as xe_exec_queue_kill can be called at most once
(IIRC it can be called multiple times) or you need some locking around
multi_queue.keep_active or it needs to be an atomic to prevent multiple
threads from calling xe_exec_queue_group_kill_put twice.

Matt

>  }
>  
>  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> @@ -1280,7 +1328,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (q->vm && q->hwe->hw_engine_group)
>  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  
> -	xe_exec_queue_kill(q);
> +	if (xe_exec_queue_is_multi_queue_primary(q))
> +		xe_exec_queue_group_kill_put(q->multi_queue.group);
> +	else
> +		xe_exec_queue_kill(q);
>  
>  	trace_xe_exec_queue_close(q);
>  	xe_exec_queue_put(q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 61478b2e883b..b642341f1ede 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -109,6 +109,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>  }
>  
> +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
> +
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index e64b6588923e..cdca3afe838c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -55,6 +55,8 @@ struct xe_exec_queue_group {
>  	struct list_head list;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
> +	/** @kill_refcount: ref count to kill primary queue */
> +	struct kref kill_refcount;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  };
> @@ -152,6 +154,8 @@ struct xe_exec_queue {
>  		u8 valid:1;
>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>  		u8 is_primary:1;
> +		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
> +		u8 keep_active:1;
>  	} multi_queue;
>  
>  	/** @sched_props: scheduling properties */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index d72151163e77..333fb38b3404 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1260,6 +1260,10 @@ struct drm_xe_vm_bind {
>   *    then a new multi-queue group is created with this queue as the primary queue
>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>   *    queue id is specified in the 'value' field.
> + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
> + *    set, then the multi-queue group is kept active after the primary queue is
> + *    destroyed.
> + *
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>   *    priority within the multi-queue group.
>   *
> @@ -1304,6 +1308,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		3
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	4
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -- 
> 2.43.0
> 
