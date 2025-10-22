Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91700CCF9E0
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 19:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C0F10E83D;
	Wed, 22 Oct 2025 19:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsHx0pan";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994E10E83D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 19:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761162846; x=1792698846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=l5W/QjcZ9A/zWeowbTZWcFwxiGHOfYAVhuuS3mQ0yP8=;
 b=PsHx0panR/LEqV8jCze8Gg3b+bfhNTQe3SOk+/86fsYYAtsVEqb9UIfm
 wf+3OuVK361xkakw8QSlwqMEs4/xNOUUJIFGdbE0gYq8bYosNzg+1BlQ4
 E1j4ZeG2NhRsinD26x8LvFXziNVPisW8pFXWnmnm9y7xACz73+gtUBlPs
 DyZQvwZO5v0ZdUeIwL13X4jdZwI7KqGnJCUM5tL36WOlJTUrZD20DyHKp
 xQ8ZsMVUzEf0F6ovHuz22vLq+7SdAW3GoWvDJT7hYBdSR/g51q1uDNKjl
 NPWXUUcsIce0/Juk+JqcMsmwRH/vuxfxOKcYx2oIe6+YREN+YiIBxg9QP Q==;
X-CSE-ConnectionGUID: V4a68YoSTKirrGoQwFxOJw==
X-CSE-MsgGUID: 9M92pVYxT/aa2BSeBpMtaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73992521"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73992521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 12:54:06 -0700
X-CSE-ConnectionGUID: ByVidNY6TPiMcRbaGn2lqg==
X-CSE-MsgGUID: 9j+zSYauQVeFUHZIDAilpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183900280"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 12:54:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 12:54:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 12:54:04 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.19) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 12:54:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FyW1PjYzLRBL13vFfg0IGnfWzeJSPYP+8NEXRAdklK1pXDxG1MK00+34L2h8an8rxW3LmF8AnHBwzmEI65PSIlk+RfPIdTW6gWJ72ohAVSNKRgPW/YFHyBt0VDwLa7Z+U88eKlA9Vb2FEh80d467jZ0j7fF4C9JGv2BIbbAntHlF2SS3jjVrxfId3bHSzGqNw0aYvr9+BxfaeRoTvap7zRTHuo78XCyb5S38c0mCgN/FkVbA6lme9PDVHGOuxDEx53QB2r+8y7DHw5ubwbZ20ASKHIlE2s8nR6xEhLbAH8l1o8sT2lo/NRE/YtZFGg6lCQ758WrJfkezQ42jxNTfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5W/QjcZ9A/zWeowbTZWcFwxiGHOfYAVhuuS3mQ0yP8=;
 b=qtJ3SCrPXNZ/Xa1TkM6xVR8cd9EZejrEYPETGQL9VDaeHSTcmNkOSqhcZMhJPyrt/xQoiGv12AQmMAPh16sTbHo3LeIPaf4ZTPRTcc7CEtV+vnOHPemB1BrmijNvHqJYRt2PSnXGD+AFv8rCuBzaIm4LZkmVolcsp7O8sUvAlEjsR1LHFmngIwq4hjqrdvEVNFNVIZqDpKvtDiM0VeDSZm2oMulvL9jImEQCXpjNSXIsEQbbC7gMKgGDpSOYndM08CJ5hj9OqZqww2hP/LCAF4L4SJ7rDPJQ9o1v9mUX2ybLqlwiyuWaRQ9P8UXHKsb+DktuwEnrDIQ8OCCJv0ABSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 19:54:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 19:54:02 +0000
Date: Wed, 22 Oct 2025 14:53:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/12] drm/xe/pm: Enable D3cold WAKE# support
Message-ID: <2igfhjblg5q5eyy4th2xwkcgatr7p3ochwvq7rh2bhfqbds6l3@3geu5qpgofz6>
References: <20251021-cri-v1-6-bf11e61d9f49@intel.com>
 <aPh7IYvOZWOLFvAf@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aPh7IYvOZWOLFvAf@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ce0715-060d-46b8-d051-08de11a4bf7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hkQFWXJLP1x4J1hrr1d0fgydhgk7apCZDWct9wm9pfiuGNmokWuBf2Q7aBtA?=
 =?us-ascii?Q?Ov5zTflvICtEMt/nIM7Any8Mf1B+D8kcMDibRVy44yiNCROrvMVgV3Qn4Wpf?=
 =?us-ascii?Q?BUwd09BD1AfTniysuipSm+IH7cQPRHjyx6YkJ5zEoohNKNrZZAmivNbP4o3G?=
 =?us-ascii?Q?keDiRv/6EqDklN6f/KFTYJ3MSK4mCm9xsxebqdHhZhKs4l5pbXeXow0UhqpG?=
 =?us-ascii?Q?K5ptmNxOOcVwHwXNkE6BFml0KegeKeaHtvMxwef1RXHEDe50uSYinIcgz0HW?=
 =?us-ascii?Q?QpPGtJoWVUT7ulDhZCk4cT71SwbkFKO6AnHy8W5OLo1mBVjWv3NwLV4Iyc4A?=
 =?us-ascii?Q?IZoGB7M3/h+3m3RQEilDovshjM6RF78yauwI5ktxlxYc8ZwqjLzcYJpgv7Ah?=
 =?us-ascii?Q?YZBII1kwQWNbxzg83g/F2Lki3oAHOb4DEAht300xEK3576Ot8exppxmZ0/ra?=
 =?us-ascii?Q?Mufl6VfIRWPK9y0rR8gwO2jSJKM8nIdC6aWkSheYh6zjzcA4J2B04s/PYruB?=
 =?us-ascii?Q?Blmkhf/EsHxEoj8ESA5/oc9G3jd8UoMBIC3AQA0QdxHK3bm/GNk9xU3Bu46v?=
 =?us-ascii?Q?5Axe7sqxCQrgBerjZ/tsjIX7Fexb+uEPb9eRQQ6NxCWxIpcTimpzmcTDKGSJ?=
 =?us-ascii?Q?igi51Rkl2N7bxPvEDqD2rizEVuUKLKdP7iVCcf8iGtzexjR7bKnRmE64n397?=
 =?us-ascii?Q?sJqEVAXLqgSTTdR26OCTalJBWhfEosBvnBE7NFqBFYcUmw71ncbVKu4rT1+k?=
 =?us-ascii?Q?m4d+QzwuTVnjKRSk58TTIq8FQITdtvmd24SY2tF4Ef8VGn8AaAcazCbonV3U?=
 =?us-ascii?Q?ZPXYMMAjQqgbgTwxTl0lRJdXchDYhaHSvRxmN4DyIrMDeYKdsBIPFkjp+nWb?=
 =?us-ascii?Q?+bvfRwqXPw11zbazBKtjo9Gjg1bt6WHZDUdWBzEi3lGYTOs1G8VUz7FRuWB4?=
 =?us-ascii?Q?XuHZinHsKZ7N+wfEbrFvma0EoLWrt1FWBogV9v7GG2CRsMZEwX3zO1NGyUeq?=
 =?us-ascii?Q?7WNppI02quRZxUayi47OAURDZKGBWh/15xJBSBPjqXd2TKv1u0J8AeFjzLyx?=
 =?us-ascii?Q?69PKsZqDWf5mV/3RC1pGEu0u2m1tI0K+ZIVXsyAh6pQdz5a0nMNVjz0nXdh5?=
 =?us-ascii?Q?uujPFVAGDc/+6PVD6hMJleIBM7hShWFk7P6avwFTih8XOrHFZsm9EwzmZUBB?=
 =?us-ascii?Q?hphSg56cUp6j9v/wfDWSiA4BB2891vpXsYesTphVDfRS/Mk9I6Wr7ySWbrPO?=
 =?us-ascii?Q?qflCP39zGbD2imQstk5jKp9zO6wmFB5NgddgblMyXvDhJhT6tJEOTgDz9gfz?=
 =?us-ascii?Q?8mWd/WPsU2s/AkIh71dUnsD1pYE9n5qoNf9Efj4eqVWVDLzQ+qoCU5LlMIY9?=
 =?us-ascii?Q?9H5eqi4MnwOobxggmWmIfjy5FvmS/6qvJcRZVOhdACp9XdCvT4zv7dUBY8jr?=
 =?us-ascii?Q?Yaq9ymnZD4OUQ/ZmlR3puRMKmROz6ju4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NhGS2TDWcIkJcv5TLYFBtJczNqCmp4ZvK4nAd6EncGlVvfm2Fe4A4ahn+hCC?=
 =?us-ascii?Q?rhZhRO1esIMNDlxL4ZOeFxDHs2AKwPhadfkpc5zIIma3HFy2jkQcz0q8qG4j?=
 =?us-ascii?Q?E5Lgmn5yIWjaKrirvlvaLR1ZJn3cyiSK8qCYMV5zSl4J8K0lz6z7jWUnaifY?=
 =?us-ascii?Q?MbZjRjTI/AhLb+WbNhbzS+H8oM9fMLy/c4wUfx0Tq14zfTjjhco3PVr3110j?=
 =?us-ascii?Q?QkQkhc46tcjdcqX7FYVjVTOZcxwr9NsA2Y58+dCngb3IV81Zp2noVSPO7qcA?=
 =?us-ascii?Q?45mF6S8FkWFSjtSGW8YGYrjmLyZ3NOhZKFFjXSctrQvKsWwUqalMhv52SfEf?=
 =?us-ascii?Q?CgJgNC7yLGru6E1vy7BA16EiPXE5WqwdW+CgloGDfC9s5X0lqr4TpTLjjNDV?=
 =?us-ascii?Q?IVF/uboargODiVDPq178xcYvnUX5L4l6EcMJcA1JWVVQk9F7KxV4wgoVcDIO?=
 =?us-ascii?Q?t29jQr91pjIXOHWarpXouN2b96vJ3xHkPonLWZxgbFDyi3n2Z7JNqmIU16QF?=
 =?us-ascii?Q?JH2Lh68AxSvP+21EdKg7A2tU4TpPJiq+u+S47IIvdOPydxLzJCi9IrGBaZRB?=
 =?us-ascii?Q?Kvj1wR+XnwoJhwFFi7JQz3hgjHB2axTcLzRcvujZRYMaIifOIXS4T/cVVpMj?=
 =?us-ascii?Q?HqaqLNO13NUb3fv2xMi13kPdsAi6IggKagNO0KIJhc+Josq+frP4exADtsZi?=
 =?us-ascii?Q?6/zHulA0/tz3n0q1XLvDhQlRpx+w44N2mZX93q9q+u20NGN7McY8GsH2nPrv?=
 =?us-ascii?Q?mXQm3oT7EQyKIb0YvmVIIvYCrtlM/DfVBC6KXco/7ZvpJsk7gLchQW1z/MW1?=
 =?us-ascii?Q?p+0eFTifHloEcIllJdAi6Y1TIaURJGttsknGQmFjjckSEZACiKzu3X7aRIeu?=
 =?us-ascii?Q?B+imu4yOJtnz4Us6CIq4z6+7JWmP3t7uT+sUBTksp3wm0BlLhc43pUYoaHKd?=
 =?us-ascii?Q?AY6bAfKw+XOH5bYQ9yRf9lraYkGSLTxc3vF6o0y2brhHucHcr/bppz3d9LUU?=
 =?us-ascii?Q?Yxo9wcRjaK7YrWPd0gnzCsarHdvX+vtBGZlD2JbwXOB1paQTu4GC/qOyLa5f?=
 =?us-ascii?Q?TWt5rUFT4U93T2HWT2hr0kQRaSvNAd9ef2Dl0oF+99WAvnbv2+PVYqXyigtN?=
 =?us-ascii?Q?yuH8H+KQYnRbmd0J9chy+lecSm+YWXjm+lndgLNjMcWG1areC23T/fg+Wn9i?=
 =?us-ascii?Q?OqNq39RIcS/YdBrw2QiByE7egphoTihhQW6NcX+TYE9I/8pvYcrQK7NSBvQR?=
 =?us-ascii?Q?Dakoc/IpqsNAGl8apNva934DMxnnIZjyqxjaGBeBaDVuKZEysQ7wu/uahEj3?=
 =?us-ascii?Q?qE/cakfKRdKRoU6tZXk2wds04gXbhVZGJT6ydoEEnfStN3nXbPlERJa5rwKP?=
 =?us-ascii?Q?ljf5l1+pqGvZ2Y8YS/OMSvkw7xjLeYufEMTVxfv2fksRRRDHZ8V/UxtlMwoQ?=
 =?us-ascii?Q?6JWblh5WjheHqotJAUUB+MkmEO7CpkThn8p4JO8ChIpDXkxV0WKQrr7q4xjv?=
 =?us-ascii?Q?fq0Ogn1pfdAkoapbhSOB48qnEFjzYknCPVZqnDpx18hFT/JDJb/4VE9eSI9P?=
 =?us-ascii?Q?f9kOYIK0MPbYVlwxTYRebI8AIvaXUvJSUTFFID7yl1S7ODSZLCXLKeDada+Z?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ce0715-060d-46b8-d051-08de11a4bf7f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 19:54:01.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45jNRHZ7ENFo+Zw76kR8iEkHSXl3QRhkFx1DG8//gkZ0wGoeG56K1mvk+6higR/D+SvDKZmHDAA2L1VTAimg+ntB9j2Bh5Cx6Do7GO419w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
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

On Wed, Oct 22, 2025 at 08:35:13AM +0200, Raag Jadav wrote:
>On Tue, Oct 21, 2025 at 10:17:38PM -0700, Raag Jadav wrote:
>> CRI supports signalling the host through WAKE# pin on smbus alerts while
>> in D3cold. Enable/disable this feature based on device/host configuration.
>
>Thanks for picking this up. Although this made sense when I originally
>wrote it, looking at it now I think this can be improved.
>
>Let me spin this out separately if it's okay with you.

yeah, sounds good. Just please Cc me so I can keep track of pending
things.

thanks
Lucas De Marchi

>
>Raag
>
>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
