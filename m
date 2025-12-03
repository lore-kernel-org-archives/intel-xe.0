Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5626AD116F3
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 04:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC4710E0AD;
	Wed,  3 Dec 2025 04:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QwyDMrwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AB910E0AD
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 04:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764735227; x=1796271227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kBcrDts8yvi+z3W7F17+55bC2/MZBI4F/UbqW19Eqyg=;
 b=QwyDMrwEh04Qp09Lrfb/Z5fL20T5ShVc32dox0VbeezQw/g0n/kkNV2L
 RmPmLltKoQJC6+EyTc0cZuvKKuVS83OM3JFb8+FP2VFVkkkFMANXfgmtn
 s58qPNQhVGnbLFguCI/jJ4MnBs0cv6MBdpqplP7s3Yf06kvZvp3aTe0xd
 tsPsFVu/47gLl87dw8BW/wNZIvMhCsDHJ12FfzNf/3l9L7wv8MeM3Gwp0
 3gSgqPbt0B3Gwdo+UbD9cCd3t9Jtt4qrvnNHj7ppnsj0VzX7C0M6ppmh9
 PPLk2s34/Jygetae01BEHLt9bYtGV1722SMAkbYEYfWBmKlu6ywAq0yqO A==;
X-CSE-ConnectionGUID: dewYwyseS7avJI9ey0y+aQ==
X-CSE-MsgGUID: WzUojfJeTt6rCt0dLoYjqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92197347"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="92197347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 20:13:47 -0800
X-CSE-ConnectionGUID: P8YHkZ8iRAmj0a+AuFVgdg==
X-CSE-MsgGUID: afaGJlRoRd2x9/V+rSugdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="193653611"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 20:13:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:13:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 20:13:46 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:13:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNj0RcQpMzM30XV+gX/1egqFzYsQH4IhrwioJjx4Xe9Rb4otRwjRLtolsoMqa3mqypWTfTPznNM3FTDoUmuS0WshQPn7aXarNYknxmP8k1baABXKPeTUQwgP/v4cim8H3KJDQZEO5gUOPyUtzp8Ft3TNmlnJ4EvK4mFMni1St8td3MO+9QOe3Q6vqlsWQgfNyWvrrLZJ14rVSuTdIMt9gZt6kAorKXfOOPdQ6HQWdwwjnj40rk8YXpnrnnqMm00HAVNu8FeJzsM3sbkbDkfdJE3qvs5RxcqkEOWdq5Xh5Zu2ViFjUBKiEgjFg2DFp1Eek1vzt6Gb1wlqjOsgJAFysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2st2BId+Fnrpf7Rf33EaL0GP3C44b5EjOF08aGI9Vg=;
 b=inrOGEsvH4DwJnepPpcQ//ou/qlKb1ZgWU0lY3ZpnE/R9ruhqISLNw5bdMOSAGvZYrGtD6IFZajnwA5j9++x2sZirZBnoOWhPobP2+SHGVebx3LI9HdlGcFBqKUCv60ugWO/38GPDQQJ56GgTuEIIaE2J3uhPBCiGZ7En9HilT39YcCI5HGkFiwj1oNhUQJDHN+tzzHJPfkP7yQ8N3hLuh1XA8Vcm9pwfA5i9LlcGzkXSa0P8MABQdkJYAxMA9qJbvvc7o1LNMW+cJMwPQCtKQP1j43pkWjTPrDOIvRx4xDYO1AiFligBsXnQLx1XpG47IA6jqCNZy0b/oKCaSTbrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 04:13:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 04:13:38 +0000
Date: Tue, 2 Dec 2025 20:13:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p_xpc: Enable Indirect Ring State for xe3p_xpc
Message-ID: <aS+48B53fgZG0JPL@lstrano-desk.jf.intel.com>
References: <20251203035800.1086089-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251203035800.1086089-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:303:86::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 1335dc5c-ad25-47ed-f929-08de32225609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eUgBCRQrQVeLOKrdGtNh/jA0GufSwpLvQZEfZeG93rkSBiteupZNHXmYSzpb?=
 =?us-ascii?Q?U6P9+mNsgY5grQmfBapjw5JXA5SJcc4Weu0rufwzr3BqInJRoEXBkyVZCLan?=
 =?us-ascii?Q?f9GL0/Cs8qMQeSfz5DP+q2aN4nanI9E6ZpFtGqWTBgz2jmnCBNNxPtVQw5x9?=
 =?us-ascii?Q?+XKZDAC4I9dlLsc9TfhfC64IK8RvVwVjFzQSnYCyiAdAXt3+w/jC0NQuaem/?=
 =?us-ascii?Q?PgbJe5xLcobb78IcwBKkevGf78IpohQL7mQVhYXMY7ocPZA6W3LxCu2DsieI?=
 =?us-ascii?Q?e+GxwlllSKJZqVCJN8G7puoRHBUixoHg3ZW6Lb4X4AYJRQUbAsN+NedW7pQN?=
 =?us-ascii?Q?rVUD8lzPmeuwD+fmJ+vwKjmCA0fBpPjjRgdoE3b7Lga1b4miCSxdJQ6OvLuY?=
 =?us-ascii?Q?sijERkrst9dqbSxf923cJdRs88zB3zkIEUA9Ka0oRAGKpSS3H1YmwiEy55dW?=
 =?us-ascii?Q?fVAX3sjMj7UTDgrGNP85c/aYp0RM6DQg5cvL9eJvsir+FzwhhEJsQMwUKsP9?=
 =?us-ascii?Q?vou7C/1wfIge1my0921h1EfH1o+Mo0Zg15lhAOutpNiFUjbo/Mw6y6ftCJVT?=
 =?us-ascii?Q?eLLWf02js6xSYFtMVODO2iCPizGUAPmf0YKYFhPKsed22whJ35ArBZbLqjym?=
 =?us-ascii?Q?NC7um2JX0i5HMhzfo47gyeGeG0OTWO3ufyvqL2F2DCzpCbo3U05IgyVJDYsP?=
 =?us-ascii?Q?T81Y+qjbNdB9r8ZLmeRCn4mjOIls+9c5uSLiqFss57+qkBMYCUkysTYcvbYQ?=
 =?us-ascii?Q?JUXYmTF7KIeYwJF97g+P58hUI2F1suF7fAWcYIoIq7Hf1BxS7rIxiYle/YaS?=
 =?us-ascii?Q?YE3/NuL/bun0g+yM/qGYUjkgZITf1fH0wCDIja332XBKXEP/csJGt5PRNipQ?=
 =?us-ascii?Q?4bcVFwi+0sqPZt7I/MUiFVZUhDr2iI2J8E6C41nDaDd5htcaV0cu77mhsSqX?=
 =?us-ascii?Q?w2e5g/ZTuzZiGldbEMCjOHLJZAiN7MSoXvBgWzmbGHdGTWEmlaJtT7+ndzu3?=
 =?us-ascii?Q?2JrbYUyv73cDQEyHqjXw0cKMNNI0jIHsKz2zBmkeR1VpvkIBgeEzE9tjY6m9?=
 =?us-ascii?Q?3AlrYXRwXz2v2rfdKh2ha1ucPSr8XO1xT7LwaC/GZd861zu5SfJwKQqzvYdh?=
 =?us-ascii?Q?k9O9gw3HxMm7Kdn67ScT67RxHq7DJzLtSTBPK+VqWptPbMJB0d5q+kGt63Z6?=
 =?us-ascii?Q?wyBVCJ5CyF6HNeaQjbrtENSg5HleO6bkz2i7cURowK+dJqr1jwejGNipnQzW?=
 =?us-ascii?Q?381LLMsEO/oggQcM1vFXnHmZJ1T+5mWsIAZXhytO01NTotGaCZLhav1weJDL?=
 =?us-ascii?Q?zcGNkmjaHDWjpaybJVCao8DaMuvJuEW1afjP6NXhLTG8lnkYtPaym6n8afmO?=
 =?us-ascii?Q?dyJ4ZeErK790IdFFG0voAkIMXTbxbAVT0PIN7Vt8vohygTJWzh6G57rhWHKd?=
 =?us-ascii?Q?VfH2O8aqZgI/M/Bcb0wcMQWyzO8doHD8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zHm9JjemsOP6u5b0SdaPPv8HW5O4CNlRZ1B5DSdQwkH1bZGtqEw631dzWSrN?=
 =?us-ascii?Q?4k3a348F5gOtyHVCix/+tKhdmu77e9l6gJCjVbVv84pJthHnNQO0e6by0GaM?=
 =?us-ascii?Q?XjAKHfwqp2Cz9HaKgNTCCg4lLM1oWSn94eNHDUbi3V39MJAFW6RXGIDy5wmG?=
 =?us-ascii?Q?UItx56oGE1jMi4NSvWdkMS+I0BuYxIi6gTi64BxUaHr8HuPDrJ/UXLXRY7kO?=
 =?us-ascii?Q?n3LAdFxzkkJvvcv5NOjHlHPGh/v+xiMFQxNOPN48EqHdywY+J8GnpTt1iUyw?=
 =?us-ascii?Q?U47krqLDxVasPdq4sLiLiklghUERL9lNw+qkjmN9nVXqffj3x9+J9Wb6lQQP?=
 =?us-ascii?Q?9W7aKCRRWCLkkCkJJIFRDysThA4y299vQLDrff28Ywn3BN2Q+aB8xFMmJEoV?=
 =?us-ascii?Q?RN2GzcDBEeSVAMm1Opo1Yt+AUeObxFaLvGrfH66zPbjQfz9bjMMmykosnvbH?=
 =?us-ascii?Q?z2abZey1QyyCnSlZ6WMZ7h0i/l23bh6zFgNz0dwbvvKywEtKl7ysO27nVqyR?=
 =?us-ascii?Q?ITbpcI/MGeGQolpgXYRpSI+0hxSt6HQIWOfvKOW9wcyhx889PuV6J9UYw+Of?=
 =?us-ascii?Q?t/pHU0ytjfrqDsSaDgcJu1zfsv6L8ljRELJU0o7VYfPye/xDUlkjoaEK96LF?=
 =?us-ascii?Q?gqv4asL8ivjoHwy55hPnzMZ9KbzOfNYiGpzXojlO7JlwdCnsCLP5SrM+41lA?=
 =?us-ascii?Q?fKobTXqqnq9NP6A0HA1aubrNGtHCcWQqlAcc/U+GxYfXsgESUqkh6PZDEgNt?=
 =?us-ascii?Q?NGXSNe4bc2nU9NGzrx7t4dtmdmZi96hM8SEMH56FWcMvoCfvzbmpUrICLdlY?=
 =?us-ascii?Q?+tft+732+2RPHHlC+AL80Eifo5s6P/9w746IFEOfStGzcAYYvX5ch7dxx+O0?=
 =?us-ascii?Q?CloKKOqBjwo8tg1q7hV7Sr1FysQgUM6iEZAoDyLAj2PcBhgXm5XsSUXd4ofp?=
 =?us-ascii?Q?mHIv2nyIGcwFyTpaT322E+tZ5J6zUpd+hZ3v2RXdVQS2a8HyEfq7ljcXRDz4?=
 =?us-ascii?Q?OQ3Uash+LFUD2YTuEWXkgy3AZ5YRPy54J/CpEN5cQIC3E6Qw9mj49YJ5cUbM?=
 =?us-ascii?Q?NaIHQSBjDi2bVxMVUf0Du1/oVj8i9AdfJZTN+wD/mkPK7p9n4F/dVEou2kvu?=
 =?us-ascii?Q?Xf+G08bSWAq4BbVyTWCSAXaDZ9lPznmCjrCV7GcAIymWICXmCmaTygPPXhkn?=
 =?us-ascii?Q?YRY2+hzIgWhjaZpx2E0DzLxODRbK2knCH4F6k2g1iiODenqIeQvRmomESQcB?=
 =?us-ascii?Q?USECVjvdt7n+H/jJkgGJpi3/Znq8tqsUTvvU1bsFNGchSI4vsu/fNcB02Go7?=
 =?us-ascii?Q?SRp1zAVU1bWG3UpETDJG7eQaKeQaXiesp9qkCz7OrYvBjgrPpKXvb2n5VVoh?=
 =?us-ascii?Q?P9qd29hRwJobII9SaBmyOd4IDTJKTG1dR8uLN4aKqU5YprEZW24Q81qLaPzV?=
 =?us-ascii?Q?nzdlF9T4zvmbDPxXr60zblR/X5JMLJKxPMvK141Or8nyfnljtB/i6xO5PDuO?=
 =?us-ascii?Q?laZmqOSXmbnS9EJXSG+EMqII91QZLPed6RmtpfKThgNltYUkBRs/CYkUTCoc?=
 =?us-ascii?Q?YlZMtlcyJAbN4S/Qmlljg1C3AQMVO11zOnJDsFwq8QL9AFKVISusxhNMlsmn?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1335dc5c-ad25-47ed-f929-08de32225609
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:13:38.7830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kNSttEKFT+gL+hZD1x43YXfX4kLReWitbtHJx/7IUxg3bZYiWjwBgiOuujj1d/p0qCqjPaP7SbOssHblwqrBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
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

On Tue, Dec 02, 2025 at 07:58:01PM -0800, Niranjana Vishwanathapura wrote:
> The xe3p_xpc platform supports Indirect Ring State and
> it is required for the upcoming multi-queue feature.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Just to confirm - in Xe2 we had hardwarwe issues with IRS, thus why we
disabled it. IIRC the GuC eventually implemented a W/A and the HW should
be fixed in Xe3. Can you confirm one these fixes is in xe3p_xpc?

If so:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 75e3588242c7..fbee83dc347a 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -108,6 +108,7 @@ static const struct xe_graphics_desc graphics_xe2 = {
>  
>  static const struct xe_graphics_desc graphics_xe3p_xpc = {
>  	XE2_GFX_FEATURES,
> +	.has_indirect_ring_state = 1,
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
>  		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
> -- 
> 2.43.0
> 
